uint64_t sub_243DCAC7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_243DFAE90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_243DCACE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243DFAE90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_243DCAD44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243DFAE90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_243DCADA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243DFAE90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_243DCAE0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243DCAE20);
}

uint64_t sub_243DCAE20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243DFAE90();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_243DCAE8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243DCAEA0);
}

uint64_t sub_243DCAEA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243DFAE90();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for BankConnectAppAuthorizationFlow(uint64_t a1)
{
  return sub_243A651B0(a1, (uint64_t *)&unk_268E22A40);
}

uint64_t sub_243DCAF30()
{
  uint64_t result = sub_243DFAE90();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_243DCAFBC(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_243DFAE90();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    uint64_t v11 = sub_243DFBC00();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_243DCB0C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243DFAE90();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_243DFBC00();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_243DCB16C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243DFAE90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_243DFBC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_243DCB224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243DFAE90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_243DFBC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_243DCB2DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243DFAE90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_243DFBC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_243DCB394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243DFAE90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_243DFBC00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_243DCB44C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243DCB460);
}

uint64_t sub_243DCB460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243DFAE90();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_243DFBC00();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_243DCB558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243DCB56C);
}

uint64_t sub_243DCB56C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_243DFAE90();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_243DFBC00();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t sub_243DCB670()
{
  uint64_t result = sub_243DFAE90();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_243DFBC00();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_243DCB738()
{
  return sub_243DCB7C8(&qword_268E22A60, (void (*)(uint64_t))type metadata accessor for BankConnectWebAuthorizationFlow);
}

uint64_t sub_243DCB780()
{
  return sub_243DCB7C8(&qword_268E22A68, (void (*)(uint64_t))type metadata accessor for BankConnectAppAuthorizationFlow);
}

uint64_t sub_243DCB7C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_243DCB810()
{
  return sub_243DCB7C8(&qword_268E22A70, (void (*)(uint64_t))type metadata accessor for BankConnectAuthorizationFlow);
}

uint64_t sub_243DCB858()
{
  return sub_243DCB7C8(&qword_268E22A78, (void (*)(uint64_t))type metadata accessor for BankConnectExtensionAuthorizationFlow);
}

uint64_t sub_243DCB8A0(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = a2 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a2 + 64);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  int64_t v8 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    int64_t v9 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v9 >= v5) {
      goto LABEL_19;
    }
    uint64_t v10 = *(void *)(v12 + 8 * v9);
    ++v8;
    if (!v10)
    {
      int64_t v8 = v9 + 1;
      if (v9 + 1 >= v5) {
        goto LABEL_19;
      }
      uint64_t v10 = *(void *)(v12 + 8 * v8);
      if (!v10) {
        break;
      }
    }
LABEL_18:
    uint64_t v4 = (v10 - 1) & v10;
LABEL_5:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_243DFE9B0();
    swift_bridgeObjectRelease();
    sub_243DFE9B0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_243DFF4B0();
    v7 ^= result;
  }
  int64_t v11 = v9 + 2;
  if (v11 >= v5)
  {
LABEL_19:
    swift_release();
    return sub_243DFF460();
  }
  uint64_t v10 = *(void *)(v12 + 8 * v11);
  if (v10)
  {
    int64_t v8 = v11;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v8 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v8 >= v5) {
      goto LABEL_19;
    }
    uint64_t v10 = *(void *)(v12 + 8 * v8);
    ++v11;
    if (v10) {
      goto LABEL_18;
    }
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_243DCBA68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243DFC1C0();
  uint64_t v32 = *(void *)(v4 - 8);
  uint64_t v33 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  int64_t v9 = (char *)&v29 - v8;
  uint64_t v34 = type metadata accessor for BankConnectExtensionAuthorizationFlow(0);
  MEMORY[0x270FA5388](v34);
  int64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v29 - v13;
  MEMORY[0x270FA5388](v15);
  v17 = (char *)&v29 - v16;
  double v19 = MEMORY[0x270FA5388](v18);
  v21 = (char *)&v29 - v20;
  char v22 = MEMORY[0x2456829B0](a1, a2, v19);
  sub_243DCBE48(a1, (uint64_t)v21, type metadata accessor for BankConnectExtensionAuthorizationFlow);
  sub_243DCBE48(a2, (uint64_t)v17, type metadata accessor for BankConnectExtensionAuthorizationFlow);
  if ((v22 & 1) == 0)
  {
    sub_243DCBDE8((uint64_t)v21, type metadata accessor for BankConnectExtensionAuthorizationFlow);
    sub_243DCBDE8((uint64_t)v17, type metadata accessor for BankConnectExtensionAuthorizationFlow);
    sub_243DCBE48(a1, (uint64_t)v14, type metadata accessor for BankConnectExtensionAuthorizationFlow);
    sub_243DCBE48(a2, (uint64_t)v11, type metadata accessor for BankConnectExtensionAuthorizationFlow);
    goto LABEL_5;
  }
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  uint64_t v23 = v34;
  __swift_project_boxed_opaque_existential_1(&v21[*(int *)(v34 + 20)], *(void *)&v21[*(int *)(v34 + 20) + 24]);
  sub_243DF9D20();
  __swift_project_boxed_opaque_existential_1(&v17[*(int *)(v23 + 20)], *(void *)&v17[*(int *)(v23 + 20) + 24]);
  sub_243DF9D20();
  char v24 = MEMORY[0x245683D40](v9, v6);
  uint64_t v25 = v33;
  v26 = *(void (**)(char *, uint64_t))(v32 + 8);
  v26(v6, v33);
  v26(v9, v25);
  sub_243DCBDE8((uint64_t)v21, type metadata accessor for BankConnectExtensionAuthorizationFlow);
  sub_243DCBDE8((uint64_t)v17, type metadata accessor for BankConnectExtensionAuthorizationFlow);
  sub_243DCBE48(v30, (uint64_t)v14, type metadata accessor for BankConnectExtensionAuthorizationFlow);
  sub_243DCBE48(v31, (uint64_t)v11, type metadata accessor for BankConnectExtensionAuthorizationFlow);
  if ((v24 & 1) == 0)
  {
LABEL_5:
    char v27 = 0;
    goto LABEL_6;
  }
  char v27 = sub_243DC4B48(*(void *)&v14[*(int *)(v34 + 24)], *(void *)&v11[*(int *)(v34 + 24)]);
LABEL_6:
  sub_243DCBDE8((uint64_t)v14, type metadata accessor for BankConnectExtensionAuthorizationFlow);
  sub_243DCBDE8((uint64_t)v11, type metadata accessor for BankConnectExtensionAuthorizationFlow);
  return v27 & 1;
}

uint64_t sub_243DCBDE8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_243DCBE48(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_243DCBEB0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_243DCBF18(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = a2;
  uint64_t v3 = type metadata accessor for BankConnectExtensionAuthorizationFlow(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v35 = (uint64_t)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = type metadata accessor for BankConnectWebAuthorizationFlow(0);
  MEMORY[0x270FA5388](v34);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for BankConnectAppAuthorizationFlow(0);
  MEMORY[0x270FA5388](v7 - 8);
  int64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for BankConnectAuthorizationFlow(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v33 - v14;
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v33 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22A80);
  MEMORY[0x270FA5388](v19 - 8);
  v21 = (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = (uint64_t)&v21[*(int *)(v22 + 56)];
  sub_243DCBE48(a1, (uint64_t)v21, type metadata accessor for BankConnectAuthorizationFlow);
  sub_243DCBE48(v36, v23, type metadata accessor for BankConnectAuthorizationFlow);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_243DCBE48((uint64_t)v21, (uint64_t)v18, type metadata accessor for BankConnectAuthorizationFlow);
    if (swift_getEnumCaseMultiPayload())
    {
      v26 = type metadata accessor for BankConnectAppAuthorizationFlow;
      uint64_t v27 = (uint64_t)v18;
LABEL_13:
      sub_243DCBDE8(v27, v26);
      sub_243A56808((uint64_t)v21, &qword_268E22A80);
LABEL_14:
      char v25 = 0;
      return v25 & 1;
    }
    sub_243DCBEB0(v23, (uint64_t)v9, type metadata accessor for BankConnectAppAuthorizationFlow);
    char v25 = MEMORY[0x2456829B0](v18, v9);
    sub_243DCBDE8((uint64_t)v9, type metadata accessor for BankConnectAppAuthorizationFlow);
    uint64_t v30 = (uint64_t)v18;
    uint64_t v31 = type metadata accessor for BankConnectAppAuthorizationFlow;
LABEL_17:
    sub_243DCBDE8(v30, v31);
    sub_243DCBDE8((uint64_t)v21, type metadata accessor for BankConnectAuthorizationFlow);
    return v25 & 1;
  }
  if (EnumCaseMultiPayload != 1)
  {
    sub_243DCBE48((uint64_t)v21, (uint64_t)v12, type metadata accessor for BankConnectAuthorizationFlow);
    if (swift_getEnumCaseMultiPayload() != 2)
    {
      v26 = type metadata accessor for BankConnectExtensionAuthorizationFlow;
      uint64_t v27 = (uint64_t)v12;
      goto LABEL_13;
    }
    uint64_t v28 = v23;
    uint64_t v29 = v35;
    sub_243DCBEB0(v28, v35, type metadata accessor for BankConnectExtensionAuthorizationFlow);
    char v25 = sub_243DCBA68((uint64_t)v12, v29);
    sub_243DCBDE8(v29, type metadata accessor for BankConnectExtensionAuthorizationFlow);
    uint64_t v30 = (uint64_t)v12;
    uint64_t v31 = type metadata accessor for BankConnectExtensionAuthorizationFlow;
    goto LABEL_17;
  }
  sub_243DCBE48((uint64_t)v21, (uint64_t)v15, type metadata accessor for BankConnectAuthorizationFlow);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    v26 = type metadata accessor for BankConnectWebAuthorizationFlow;
    uint64_t v27 = (uint64_t)v15;
    goto LABEL_13;
  }
  sub_243DCBEB0(v23, (uint64_t)v6, type metadata accessor for BankConnectWebAuthorizationFlow);
  if ((MEMORY[0x2456829B0](v15, v6) & 1) == 0
    || (MEMORY[0x2456836E0](&v15[*(int *)(v34 + 20)], &v6[*(int *)(v34 + 20)]) & 1) == 0)
  {
    sub_243DCBDE8((uint64_t)v6, type metadata accessor for BankConnectWebAuthorizationFlow);
    sub_243DCBDE8((uint64_t)v15, type metadata accessor for BankConnectWebAuthorizationFlow);
    sub_243DCBDE8((uint64_t)v21, type metadata accessor for BankConnectAuthorizationFlow);
    goto LABEL_14;
  }
  sub_243DCBDE8((uint64_t)v6, type metadata accessor for BankConnectWebAuthorizationFlow);
  sub_243DCBDE8((uint64_t)v15, type metadata accessor for BankConnectWebAuthorizationFlow);
  sub_243DCBDE8((uint64_t)v21, type metadata accessor for BankConnectAuthorizationFlow);
  char v25 = 1;
  return v25 & 1;
}

unint64_t sub_243DCC428()
{
  unint64_t result = qword_268E22A88;
  if (!qword_268E22A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22A88);
  }
  return result;
}

uint64_t sub_243DCC47C()
{
  uint64_t v0 = sub_243DF9430();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v13 - v5;
  id v7 = objc_msgSend(self, sel_mainBundle);
  id v8 = objc_msgSend(v7, sel_bundleIdentifier);

  if (!v8) {
    return 0;
  }
  sub_243DFE910();

  sub_243DF9410();
  sub_243DF9400();
  sub_243DCB7C8(&qword_268E22AA0, MEMORY[0x263F05868]);
  sub_243DFEAB0();
  sub_243DFEAB0();
  if (v13[2] == v13[0] && v13[3] == v13[1])
  {
    swift_bridgeObjectRelease_n();
    char v9 = 0;
  }
  else
  {
    char v11 = sub_243DFF3A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v9 = v11 ^ 1;
  }
  uint64_t v12 = *(void (**)(char *, uint64_t))(v1 + 8);
  v12(v4, v0);
  v12(v6, v0);
  return v9 & 1;
}

unsigned char *storeEnumTagSinglePayload for BankConnectAuthorizationFlowManagerError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x243DCC778);
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

ValueMetadata *type metadata accessor for BankConnectAuthorizationFlowManagerError()
{
  return &type metadata for BankConnectAuthorizationFlowManagerError;
}

unint64_t sub_243DCC7B4()
{
  unint64_t result = qword_268E22AA8;
  if (!qword_268E22AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22AA8);
  }
  return result;
}

id CSSearchQueryFactory.make(queryString:attributes:)()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F02AD0]), sel_init);
  uint64_t v1 = (void *)sub_243DFEAD0();
  objc_msgSend(v0, sel_setFetchAttributes_, v1);

  id v2 = objc_allocWithZone(MEMORY[0x263F02AC8]);
  swift_bridgeObjectRetain();
  id v3 = v0;
  unsigned int v4 = (void *)sub_243DFE8E0();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_initWithQueryString_queryContext_, v4, v3);

  return v5;
}

id sub_243DCC8EC()
{
  return CSSearchQueryFactory.make(queryString:attributes:)();
}

id sub_243DCC90C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4 = (void *)sub_243DFE8E0();
  swift_bridgeObjectRelease();
  if (a3)
  {
    id v5 = (void *)sub_243DFEAD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  id v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithQueryString_attributes_, v4, v5);

  return v6;
}

uint64_t (*sub_243DCC9A0())()
{
  unint64_t result = (uint64_t (*)())objc_msgSend(v0, sel_foundItemsHandler);
  if (result)
  {
    *(void *)(swift_allocObject() + 16) = result;
    return sub_243DCD458;
  }
  return result;
}

void sub_243DCCA14(uint64_t a1, uint64_t a2)
{
  sub_243DCD414();
  id v3 = (id)sub_243DFEAD0();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);
}

void sub_243DCCA80(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    v4[4] = a1;
    v4[5] = a2;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 1107296256;
    v4[2] = sub_243DCCB28;
    v4[3] = &block_descriptor_22;
    id v3 = _Block_copy(v4);
    swift_release();
  }
  else
  {
    id v3 = 0;
  }
  objc_msgSend(v2, sel_setFoundItemsHandler_, v3);
  _Block_release(v3);
}

uint64_t sub_243DCCB28(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_243DCD414();
  uint64_t v2 = sub_243DFEAE0();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t (*sub_243DCCB9C(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_243DCCBF8(v2);
  return sub_243DCCBF4;
}

void (*sub_243DCCBF8(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x48uLL);
  *a1 = v3;
  v3[8] = v1;
  unsigned int v4 = objc_msgSend(v1, sel_foundItemsHandler);
  if (v4)
  {
    id v5 = v4;
    unsigned int v4 = (void *)swift_allocObject();
    v4[2] = v5;
    id v6 = sub_243DCD40C;
  }
  else
  {
    id v6 = 0;
  }
  v3[6] = v6;
  v3[7] = v4;
  return sub_243DCCCAC;
}

void sub_243DCCCAC(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 48);
  if (a2)
  {
    if (v3)
    {
      uint64_t v4 = v2[7];
      v2[4] = v3;
      v2[5] = v4;
      *uint64_t v2 = MEMORY[0x263EF8330];
      v2[1] = 1107296256;
      v2[2] = sub_243DCCB28;
      v2[3] = &block_descriptor_13;
      id v5 = _Block_copy(v2);
      swift_retain();
      swift_release();
    }
    else
    {
      id v5 = 0;
    }
    objc_msgSend((id)v2[8], sel_setFoundItemsHandler_, v5);
    _Block_release(v5);
    sub_243A6F580(v2[6]);
  }
  else
  {
    if (v3)
    {
      uint64_t v6 = v2[7];
      v2[4] = v3;
      v2[5] = v6;
      *uint64_t v2 = MEMORY[0x263EF8330];
      v2[1] = 1107296256;
      v2[2] = sub_243DCCB28;
      v2[3] = &block_descriptor_16;
      id v7 = _Block_copy(v2);
      swift_release();
    }
    else
    {
      id v7 = 0;
    }
    objc_msgSend((id)v2[8], sel_setFoundItemsHandler_, v7);
    _Block_release(v7);
  }

  free(v2);
}

uint64_t (*sub_243DCCE14())()
{
  unint64_t result = (uint64_t (*)())objc_msgSend(v0, sel_completionHandler);
  if (result)
  {
    *(void *)(swift_allocObject() + 16) = result;
    return sub_243DCD454;
  }
  return result;
}

void sub_243DCCE88(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_243DFB9F0();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_243DCCEEC(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    v4[4] = a1;
    v4[5] = a2;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 1107296256;
    v4[2] = sub_243DCCF94;
    v4[3] = &block_descriptor_6;
    uint64_t v3 = _Block_copy(v4);
    swift_release();
  }
  else
  {
    uint64_t v3 = 0;
  }
  objc_msgSend(v2, sel_setCompletionHandler_, v3);
  _Block_release(v3);
}

void sub_243DCCF94(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t (*sub_243DCD000(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_243DCD0A0(v2);
  return sub_243DCCBF4;
}

void sub_243DCD058(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_243DCD0A0(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  v3[8] = v1;
  id v4 = objc_msgSend(v1, sel_completionHandler);
  if (v4)
  {
    id v5 = v4;
    id v4 = (void *)swift_allocObject();
    v4[2] = v5;
    uint64_t v6 = sub_243DCD404;
  }
  else
  {
    uint64_t v6 = 0;
  }
  v3[6] = v6;
  v3[7] = v4;
  return sub_243DCD154;
}

void sub_243DCD154(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 48);
  if (a2)
  {
    if (v3)
    {
      uint64_t v4 = v2[7];
      v2[4] = v3;
      v2[5] = v4;
      *uint64_t v2 = MEMORY[0x263EF8330];
      v2[1] = 1107296256;
      v2[2] = sub_243DCCF94;
      v2[3] = &block_descriptor_17;
      id v5 = _Block_copy(v2);
      swift_retain();
      swift_release();
    }
    else
    {
      id v5 = 0;
    }
    objc_msgSend((id)v2[8], sel_setCompletionHandler_, v5);
    _Block_release(v5);
    sub_243A6F580(v2[6]);
  }
  else
  {
    if (v3)
    {
      uint64_t v6 = v2[7];
      v2[4] = v3;
      v2[5] = v6;
      *uint64_t v2 = MEMORY[0x263EF8330];
      v2[1] = 1107296256;
      v2[2] = sub_243DCCF94;
      v2[3] = &block_descriptor_3;
      id v7 = _Block_copy(v2);
      swift_release();
    }
    else
    {
      id v7 = 0;
    }
    objc_msgSend((id)v2[8], sel_setCompletionHandler_, v7);
    _Block_release(v7);
  }

  free(v2);
}

id sub_243DCD2BC()
{
  return objc_msgSend(v0, sel_start);
}

id sub_243DCD2CC()
{
  return objc_msgSend(v0, sel_cancel);
}

uint64_t dispatch thunk of SpotlightSearchQuery.init(queryString:attributes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of SpotlightSearchQuery.foundItemsHandler.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SpotlightSearchQuery.foundItemsHandler.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of SpotlightSearchQuery.foundItemsHandler.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of SpotlightSearchQuery.completionHandler.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of SpotlightSearchQuery.completionHandler.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of SpotlightSearchQuery.completionHandler.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of SpotlightSearchQuery.start()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of SpotlightSearchQuery.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of SpotlightSearchQueryFactory.make(queryString:attributes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

ValueMetadata *type metadata accessor for CSSearchQueryFactory()
{
  return &type metadata for CSSearchQueryFactory;
}

uint64_t block_copy_helper_17(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_17()
{
  return swift_release();
}

uint64_t sub_243DCD3CC()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_243DCD404(uint64_t a1)
{
  sub_243DCCE88(a1, *(void *)(v1 + 16));
}

void sub_243DCD40C(uint64_t a1)
{
  sub_243DCCA14(a1, *(void *)(v1 + 16));
}

unint64_t sub_243DCD414()
{
  unint64_t result = qword_268E22AB0;
  if (!qword_268E22AB0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268E22AB0);
  }
  return result;
}

uint64_t sub_243DCD490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243DCD4A4);
}

uint64_t sub_243DCD4A4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for OrderWidgetTimelineEntry(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    char v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18680);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    char v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 254)
  {
    unsigned int v14 = *(unsigned __int8 *)(a1 + a3[6] + 8);
    if (v14 > 1) {
      return (v14 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19698);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[7];
    return v16(v18, a2, v17);
  }
}

uint64_t sub_243DCD628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243DCD63C);
}

uint64_t sub_243DCD63C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = type metadata accessor for OrderWidgetTimelineEntry(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18680);
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 254)
  {
    *(unsigned char *)(a1 + a4[6] + 8) = -(char)a2;
  }
  else
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19698);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[7];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

uint64_t _s5LargeVMa()
{
  uint64_t result = qword_268E22AB8;
  if (!qword_268E22AB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_243DCD810()
{
  type metadata accessor for OrderWidgetTimelineEntry(319);
  if (v0 <= 0x3F)
  {
    sub_243A99B34(319, (unint64_t *)&qword_268E186A0, MEMORY[0x263F18D80]);
    if (v1 <= 0x3F)
    {
      sub_243A99B34(319, &qword_268E196B0, MEMORY[0x263F1FC90]);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t sub_243DCD954()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_243DCD970@<X0>(uint64_t a1@<X8>)
{
  uint64_t v40 = a1;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22AC8);
  MEMORY[0x270FA5388](v41);
  uint64_t v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22AD0);
  MEMORY[0x270FA5388](v38);
  uint64_t v39 = (uint64_t)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = _s5LargeVMa();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E196C8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22AD8);
  MEMORY[0x270FA5388](v37);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v36 - v15;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v36 - v18;
  uint64_t v20 = *(void *)v1;
  unint64_t v21 = *(void *)(*(void *)v1 + 16);
  if (v21 == 1)
  {
    uint64_t v22 = type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
    uint64_t v23 = *(void *)(v22 - 8);
    uint64_t v36 = v6;
    uint64_t v24 = v23;
    sub_243DD1460(v20 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80)), (uint64_t)v11, type metadata accessor for OrderWidgetTimelineEntry.OrderData);
    char v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56);
    v25(v11, 0, 1, v22);
    sub_243DD1460(v1, (uint64_t)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))_s5LargeVMa);
    unint64_t v26 = (*(unsigned __int8 *)(v36 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    uint64_t v27 = swift_allocObject();
    sub_243DD13F8((uint64_t)v8, v27 + v26, (uint64_t (*)(void))_s5LargeVMa);
    v25(v13, 1, 1, v22);
    sub_243A9B540((uint64_t)v11, (uint64_t)v13);
    uint64_t v28 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))&v13[*(int *)(v37 + 36)];
    *uint64_t v28 = sub_243DD127C;
    v28[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v27;
    uint64_t v29 = &qword_268E22AD8;
    sub_243A56740((uint64_t)v13, (uint64_t)v16, &qword_268E22AD8);
    sub_243A56740((uint64_t)v16, (uint64_t)v19, &qword_268E22AD8);
    sub_243A567A4((uint64_t)v19, v39, &qword_268E22AD8);
    swift_storeEnumTagMultiPayload();
    sub_243A569B0(&qword_268E22AE8, &qword_268E22AD8);
    sub_243A569B0(&qword_268E22AF0, &qword_268E22AC8);
    sub_243DFD170();
    uint64_t v30 = (uint64_t)v19;
  }
  else
  {
    if (v21 >= 3) {
      uint64_t v31 = 3;
    }
    else {
      uint64_t v31 = *(void *)(*(void *)v1 + 16);
    }
    uint64_t v32 = *(void *)(type metadata accessor for OrderWidgetTimelineEntry.OrderData(0) - 8);
    uint64_t v33 = v20 + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80));
    swift_bridgeObjectRetain();
    *(void *)uint64_t v3 = sub_243DFD000();
    *((void *)v3 + 1) = 0;
    v3[16] = 0;
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22AE0);
    sub_243DCE0B8(v20, v33, 0, (2 * v31) | 1, v1, &v3[*(int *)(v34 + 44)]);
    uint64_t v29 = &qword_268E22AC8;
    sub_243A567A4((uint64_t)v3, v39, &qword_268E22AC8);
    swift_storeEnumTagMultiPayload();
    sub_243A569B0(&qword_268E22AE8, &qword_268E22AD8);
    sub_243A569B0(&qword_268E22AF0, &qword_268E22AC8);
    sub_243DFD170();
    swift_bridgeObjectRelease();
    uint64_t v30 = (uint64_t)v3;
  }
  return sub_243A56808(v30, v29);
}

uint64_t sub_243DCDEE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22AF8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B00);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v7 = sub_243DFD000();
  *((void *)v7 + 1) = 0;
  v7[16] = 0;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B08);
  sub_243DD0584(a1, v2, (uint64_t)&v7[*(int *)(v12 + 44)]);
  uint64_t v13 = v2 + *(int *)(_s5LargeVMa() + 24);
  uint64_t v14 = *(void *)v13;
  LOBYTE(a1) = *(unsigned char *)(v13 + 8);
  sub_243A556F8(*(void *)v13, a1);
  sub_243AFB580(v14, a1);
  sub_243A557AC(v14, a1);
  LOBYTE(v14) = sub_243DFD730();
  sub_243DFC480();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  sub_243A567A4((uint64_t)v7, (uint64_t)v11, &qword_268E22AF8);
  uint64_t v23 = &v11[*(int *)(v9 + 44)];
  *uint64_t v23 = v14;
  *((void *)v23 + 1) = v16;
  *((void *)v23 + 2) = v18;
  *((void *)v23 + 3) = v20;
  *((void *)v23 + 4) = v22;
  v23[40] = 0;
  sub_243A56808((uint64_t)v7, &qword_268E22AF8);
  return sub_243A56740((uint64_t)v11, a2, &qword_268E22B00);
}

uint64_t sub_243DCE0B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t v39 = a4;
  v44 = a6;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E196C0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v45 = (uint64_t)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v42 = (char *)&v38 - v13;
  uint64_t v38 = _s5LargeVMa();
  uint64_t v14 = *(void *)(v38 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388](v38);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B18);
  uint64_t v16 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  v43 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v38 - v19;
  uint64_t v46 = a1;
  uint64_t v47 = a2;
  uint64_t v21 = a3;
  uint64_t v48 = a3;
  uint64_t v22 = v39;
  uint64_t v49 = v39;
  uint64_t KeyPath = swift_getKeyPath();
  sub_243DD1460(a5, (uint64_t)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))_s5LargeVMa);
  unint64_t v23 = (*(unsigned __int8 *)(v14 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = a1;
  v24[3] = a2;
  v24[4] = v21;
  v24[5] = v22;
  sub_243DD13F8((uint64_t)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v24 + v23, (uint64_t (*)(void))_s5LargeVMa);
  swift_unknownObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B28);
  sub_243A569B0(&qword_268E22B30, &qword_268E22B20);
  sub_243DD1AF0(&qword_268E1E420, MEMORY[0x263F05F80]);
  sub_243A569B0(&qword_268E22B38, &qword_268E22B28);
  sub_243DFE390();
  uint64_t v25 = *(void *)(a5 + *(int *)(type metadata accessor for OrderWidgetTimelineEntry(0) + 24));
  if (v25 < 4)
  {
    uint64_t v29 = type metadata accessor for OrderWidgetMoreTextView();
    uint64_t v28 = v42;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v42, 1, 1, v29);
  }
  else
  {
    uint64_t v26 = v25 - 3;
    uint64_t v27 = type metadata accessor for OrderWidgetMoreTextView();
    uint64_t v28 = v42;
    sub_243AFBCF4((uint64_t)&v42[*(int *)(v27 + 20)]);
    *uint64_t v28 = v26;
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v28, 0, 1, v27);
  }
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  uint64_t v31 = v43;
  uint64_t v32 = v41;
  v30(v43, v20, v41);
  uint64_t v33 = v45;
  sub_243A567A4((uint64_t)v28, v45, &qword_268E196C0);
  uint64_t v34 = v44;
  v30(v44, v31, v32);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B40);
  sub_243A567A4(v33, (uint64_t)&v34[*(int *)(v35 + 48)], &qword_268E196C0);
  sub_243A56808((uint64_t)v28, &qword_268E196C0);
  uint64_t v36 = *(void (**)(char *, uint64_t))(v16 + 8);
  v36(v20, v32);
  sub_243A56808(v33, &qword_268E196C0);
  return ((uint64_t (*)(char *, uint64_t))v36)(v31, v32);
}

uint64_t sub_243DCE5A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, unint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v115 = a5;
  unint64_t v120 = a4;
  uint64_t v124 = a3;
  uint64_t v104 = a2;
  uint64_t v105 = a6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B48);
  MEMORY[0x270FA5388](v7 - 8);
  v106 = (char *)&v98 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v98 - v10;
  uint64_t v12 = _s5LargeVMa();
  uint64_t v110 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v111 = v13;
  uint64_t v114 = (uint64_t)&v98 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E196C8);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v113 = (uint64_t)&v98 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B50);
  MEMORY[0x270FA5388](v112);
  v117 = (char *)&v98 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v116 = (uint64_t)&v98 - v18;
  uint64_t v19 = sub_243DFB3F0();
  uint64_t v20 = *(void **)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  v100 = (char *)&v98 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B58);
  MEMORY[0x270FA5388](v22);
  uint64_t v109 = (uint64_t)&v98 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v98 - v25;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B60);
  MEMORY[0x270FA5388](v27 - 8);
  uint64_t v99 = (uint64_t)&v98 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  v119 = (char *)&v98 - v30;
  MEMORY[0x270FA5388](v31);
  v121 = (char *)&v98 - v32;
  MEMORY[0x270FA5388](v33);
  uint64_t v101 = (uint64_t)&v98 - v34;
  MEMORY[0x270FA5388](v35);
  uint64_t v37 = (char *)&v98 - v36;
  double v39 = MEMORY[0x270FA5388](v38);
  uint64_t v41 = (char *)&v98 - v40;
  v42 = (void (*)(char *, uint64_t, uint64_t))v20[2];
  uint64_t v118 = a1;
  v122 = v42;
  v123 = v20 + 2;
  ((void (*)(char *, uint64_t, uint64_t, double))v42)((char *)&v98 - v40, a1, v19, v39);
  v43 = (uint64_t (*)(char *, void, uint64_t, uint64_t))v20[7];
  uint64_t v44 = 1;
  uint64_t result = v43(v41, 0, 1, v19);
  int64_t v46 = v120 >> 1;
  unint64_t v120 = v46;
  if (v46 != v124)
  {
    if (v46 <= v124)
    {
      __break(1u);
      goto LABEL_31;
    }
    uint64_t v47 = v124;
    uint64_t v48 = type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
    v122(v37, v104 + *(void *)(*(void *)(v48 - 8) + 72) * v47, v19);
    uint64_t v44 = 0;
  }
  v102 = v11;
  v107 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v43;
  v43(v37, v44, 1, v19);
  uint64_t v108 = v22;
  uint64_t v49 = (uint64_t)&v26[*(int *)(v22 + 48)];
  sub_243A567A4((uint64_t)v41, (uint64_t)v26, &qword_268E22B60);
  sub_243A567A4((uint64_t)v37, v49, &qword_268E22B60);
  v50 = v20;
  v51 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v20[6];
  if (v51((uint64_t)v26, 1, v19) == 1)
  {
    sub_243A56808((uint64_t)v37, &qword_268E22B60);
    sub_243A56808((uint64_t)v41, &qword_268E22B60);
    int v52 = v51(v49, 1, v19);
    if (v52 == 1) {
      v53 = &qword_268E22B60;
    }
    else {
      v53 = &qword_268E22B58;
    }
    if (v52 == 1) {
      int v54 = -1;
    }
    else {
      int v54 = 0;
    }
    int v103 = v54;
    uint64_t v55 = v118;
    v56 = v50;
  }
  else
  {
    uint64_t v57 = v101;
    sub_243A567A4((uint64_t)v26, v101, &qword_268E22B60);
    if (v51(v49, 1, v19) == 1)
    {
      sub_243A56808((uint64_t)v37, &qword_268E22B60);
      sub_243A56808((uint64_t)v41, &qword_268E22B60);
      v56 = v50;
      ((void (*)(uint64_t, uint64_t))v50[1])(v57, v19);
      int v103 = 0;
      v53 = &qword_268E22B58;
    }
    else
    {
      v98 = v51;
      v58 = v50;
      v59 = (void (*)(char *, uint64_t, uint64_t))v50[4];
      v60 = v100;
      v59(v100, v49, v19);
      sub_243DD1AF0(&qword_268E22B70, MEMORY[0x263F05F80]);
      int v103 = sub_243DFE870();
      v61 = (void (*)(char *, uint64_t))v58[1];
      v61(v60, v19);
      v62 = (void (*)(uint64_t, uint64_t))v61;
      v53 = &qword_268E22B60;
      uint64_t v63 = (uint64_t)v37;
      v56 = v58;
      v51 = v98;
      sub_243A56808(v63, &qword_268E22B60);
      sub_243A56808((uint64_t)v41, &qword_268E22B60);
      v62(v101, v19);
    }
    uint64_t v55 = v118;
  }
  sub_243A56808((uint64_t)v26, v53);
  uint64_t v64 = (uint64_t)v121;
  v122(v121, v55, v19);
  uint64_t v65 = 1;
  v66 = v107;
  uint64_t result = ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v107)(v64, 0, 1, v19);
  uint64_t v67 = v108;
  if (v120 == v124) {
    goto LABEL_19;
  }
  if ((uint64_t)v120 <= v124)
  {
LABEL_31:
    __break(1u);
    return result;
  }
  unint64_t v68 = v120 - 1;
  uint64_t v69 = type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
  v122(v119, v104 + *(void *)(*(void *)(v69 - 8) + 72) * v68, v19);
  uint64_t v65 = 0;
LABEL_19:
  v70 = v66;
  v71 = v119;
  v70(v119, v65, 1, v19);
  uint64_t v72 = (uint64_t)v71;
  uint64_t v73 = *(int *)(v67 + 48);
  uint64_t v74 = v109;
  uint64_t v75 = v109 + v73;
  v76 = &qword_268E22B60;
  sub_243A567A4(v64, v109, &qword_268E22B60);
  sub_243A567A4(v72, v75, &qword_268E22B60);
  if (v51(v74, 1, v19) == 1)
  {
    sub_243A56808(v72, &qword_268E22B60);
    sub_243A56808(v64, &qword_268E22B60);
    if (v51(v75, 1, v19) == 1)
    {
      char v77 = -1;
    }
    else
    {
      v76 = &qword_268E22B58;
      char v77 = 0;
    }
  }
  else
  {
    uint64_t v78 = v99;
    sub_243A567A4(v74, v99, &qword_268E22B60);
    if (v51(v75, 1, v19) == 1)
    {
      sub_243A56808(v72, &qword_268E22B60);
      sub_243A56808((uint64_t)v121, &qword_268E22B60);
      ((void (*)(uint64_t, uint64_t))v56[1])(v78, v19);
      char v77 = 0;
      v76 = &qword_268E22B58;
    }
    else
    {
      v79 = v100;
      ((void (*)(char *, uint64_t, uint64_t))v56[4])(v100, v75, v19);
      sub_243DD1AF0(&qword_268E22B70, MEMORY[0x263F05F80]);
      char v77 = sub_243DFE870();
      v80 = (void (*)(char *, uint64_t))v56[1];
      v80(v79, v19);
      v76 = &qword_268E22B60;
      sub_243A56808(v72, &qword_268E22B60);
      sub_243A56808((uint64_t)v121, &qword_268E22B60);
      v80((char *)v78, v19);
    }
  }
  uint64_t v81 = (uint64_t)v102;
  sub_243A56808(v74, v76);
  uint64_t v82 = v113;
  sub_243DD1460(v55, v113, type metadata accessor for OrderWidgetTimelineEntry.OrderData);
  uint64_t v83 = type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
  v84 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v83 - 8) + 56);
  v84(v82, 0, 1, v83);
  uint64_t v85 = v114;
  sub_243DD1460(v115, v114, (uint64_t (*)(void))_s5LargeVMa);
  unint64_t v86 = (*(unsigned __int8 *)(v110 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v110 + 80);
  uint64_t v87 = v86 + v111;
  uint64_t v88 = swift_allocObject();
  sub_243DD13F8(v85, v88 + v86, (uint64_t (*)(void))_s5LargeVMa);
  v89 = (unsigned char *)(v88 + v87);
  unsigned char *v89 = v103 & 1;
  v89[1] = v77 & 1;
  uint64_t v90 = (uint64_t)v117;
  v84((uint64_t)v117, 1, 1, v83);
  sub_243A9B540(v82, v90);
  v91 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))(v90 + *(int *)(v112 + 36));
  *v91 = sub_243DD1A44;
  v91[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v88;
  uint64_t v92 = v116;
  sub_243A56740(v90, v116, &qword_268E22B50);
  if (v77)
  {
    uint64_t v93 = sub_243DFE380();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v93 - 8) + 56))(v81, 1, 1, v93);
  }
  else
  {
    sub_243DFE370();
    uint64_t v94 = sub_243DFE380();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v94 - 8) + 56))(v81, 0, 1, v94);
  }
  uint64_t v96 = v105;
  uint64_t v95 = (uint64_t)v106;
  sub_243A567A4(v92, v90, &qword_268E22B50);
  sub_243A567A4(v81, v95, &qword_268E22B48);
  sub_243A567A4(v90, v96, &qword_268E22B50);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B68);
  sub_243A567A4(v95, v96 + *(int *)(v97 + 48), &qword_268E22B48);
  sub_243A56808(v81, &qword_268E22B48);
  sub_243A56808(v92, &qword_268E22B50);
  sub_243A56808(v95, &qword_268E22B48);
  return sub_243A56808(v90, &qword_268E22B50);
}

uint64_t sub_243DCF1E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>)
{
  int v80 = a4;
  LODWORD(v83) = a3;
  uint64_t v92 = a5;
  uint64_t v7 = sub_243DFC8E0();
  uint64_t v86 = *(void *)(v7 - 8);
  uint64_t v87 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v85 = &v79[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  v84 = &v79[-v10];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A728);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = &v79[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A730);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = &v79[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = &v79[-v18];
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B78);
  uint64_t v21 = v20 - 8;
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = &v79[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B80);
  MEMORY[0x270FA5388](v89);
  uint64_t v88 = &v79[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B88);
  MEMORY[0x270FA5388](v90);
  v91 = &v79[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v81 = *(int *)(type metadata accessor for OrderWidgetTimelineEntry(0) + 24);
  BOOL v26 = *(void *)(a2 + v81) > 2;
  *(void *)uint64_t v13 = sub_243DFCE60();
  *((void *)v13 + 1) = 0;
  v13[16] = 0;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B90);
  sub_243DCF918(a1, v26, a2, (uint64_t)&v13[*(int *)(v27 + 44)]);
  uint64_t v28 = sub_243DFE4F0();
  sub_243AD1CA4(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v16, 0.0, 1, INFINITY, 0, v28, v29);
  sub_243A56808((uint64_t)v13, &qword_268E1A728);
  sub_243A56740((uint64_t)v16, (uint64_t)v19, &qword_268E1A730);
  LOBYTE(v13) = sub_243DFD720();
  uint64_t v82 = _s5LargeVMa();
  uint64_t v30 = a2 + *(int *)(v82 + 24);
  uint64_t v31 = *(void *)v30;
  LOBYTE(a1) = *(unsigned char *)(v30 + 8);
  sub_243A556F8(*(void *)v30, a1);
  sub_243AFB580(v31, a1);
  sub_243A557AC(v31, a1);
  sub_243DFC480();
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  sub_243A567A4((uint64_t)v19, (uint64_t)v23, &qword_268E1A730);
  uint64_t v40 = &v23[*(int *)(v21 + 44)];
  *uint64_t v40 = (_BYTE)v13;
  *((void *)v40 + 1) = v33;
  *((void *)v40 + 2) = v35;
  *((void *)v40 + 3) = v37;
  *((void *)v40 + 4) = v39;
  v40[40] = 0;
  sub_243A56808((uint64_t)v19, &qword_268E1A730);
  char v41 = sub_243DFD740();
  uint64_t v42 = *(void *)v30;
  LOBYTE(v19) = *(unsigned char *)(v30 + 8);
  sub_243A556F8(*(void *)v30, (char)v19);
  LOBYTE(a1) = sub_243AFB580(v42, (char)v19);
  sub_243A557AC(v42, (char)v19);
  if ((a1 & 1) != 0 && (v83 & 1) == 0)
  {
    uint64_t v83 = a2;
    v43 = v84;
    sub_243AFB7C0((uint64_t)v84);
    uint64_t v45 = v85;
    uint64_t v44 = v86;
    uint64_t v46 = v87;
    (*(void (**)(unsigned char *, void, uint64_t))(v86 + 104))(v85, *MEMORY[0x263F18D60], v87);
    sub_243DD1AF0((unint64_t *)&qword_268E196F8, MEMORY[0x263F18D80]);
    sub_243DFE860();
    uint64_t v47 = *(void (**)(unsigned char *, uint64_t))(v44 + 8);
    v47(v45, v46);
    uint64_t v48 = v43;
    a2 = v83;
    v47(v48, v46);
  }
  sub_243DFC480();
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  uint64_t v56 = v55;
  uint64_t v57 = v88;
  sub_243A567A4((uint64_t)v23, (uint64_t)v88, &qword_268E22B78);
  v58 = &v57[*(int *)(v89 + 36)];
  unsigned char *v58 = v41;
  *((void *)v58 + 1) = v50;
  *((void *)v58 + 2) = v52;
  *((void *)v58 + 3) = v54;
  *((void *)v58 + 4) = v56;
  v58[40] = 0;
  sub_243A56808((uint64_t)v23, &qword_268E22B78);
  char v59 = sub_243DFD750();
  uint64_t v60 = *(void *)v30;
  char v61 = *(unsigned char *)(v30 + 8);
  sub_243A556F8(*(void *)v30, v61);
  char v62 = sub_243AFB580(v60, v61);
  sub_243A557AC(v60, v61);
  if ((v62 & 1) != 0 && (*(uint64_t *)(a2 + v81) > 3 || (v80 & 1) == 0))
  {
    uint64_t v63 = v84;
    sub_243AFB7C0((uint64_t)v84);
    uint64_t v65 = v85;
    uint64_t v64 = v86;
    uint64_t v66 = v87;
    (*(void (**)(unsigned char *, void, uint64_t))(v86 + 104))(v85, *MEMORY[0x263F18D60], v87);
    sub_243DD1AF0((unint64_t *)&qword_268E196F8, MEMORY[0x263F18D80]);
    sub_243DFE860();
    uint64_t v67 = *(void (**)(unsigned char *, uint64_t))(v64 + 8);
    v67(v65, v66);
    v67(v63, v66);
  }
  sub_243DFC480();
  uint64_t v69 = v68;
  uint64_t v71 = v70;
  uint64_t v73 = v72;
  uint64_t v75 = v74;
  v76 = v91;
  sub_243A567A4((uint64_t)v57, (uint64_t)v91, &qword_268E22B80);
  char v77 = &v76[*(int *)(v90 + 36)];
  *char v77 = v59;
  *((void *)v77 + 1) = v69;
  *((void *)v77 + 2) = v71;
  *((void *)v77 + 3) = v73;
  *((void *)v77 + 4) = v75;
  v77[40] = 0;
  sub_243A56808((uint64_t)v57, &qword_268E22B80);
  return sub_243A56740((uint64_t)v76, v92, &qword_268E22B88);
}

uint64_t sub_243DCF918@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B98);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v25 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22BA0);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v25 - v18;
  *(void *)uint64_t v19 = sub_243DFD000();
  *((void *)v19 + 1) = 0x4000000000000000;
  v19[16] = 0;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22BA8);
  sub_243DCFB30(a1, a2, (uint64_t)&v19[*(int *)(v20 + 44)]);
  *(void *)uint64_t v13 = sub_243DFCFF0();
  *((void *)v13 + 1) = 0;
  v13[16] = 0;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22BB0);
  sub_243DD023C(a1, a3, (uint64_t)&v13[*(int *)(v21 + 44)]);
  sub_243A567A4((uint64_t)v19, (uint64_t)v16, &qword_268E22BA0);
  sub_243A567A4((uint64_t)v13, (uint64_t)v10, &qword_268E22B98);
  sub_243A567A4((uint64_t)v16, a4, &qword_268E22BA0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22BB8);
  uint64_t v23 = a4 + *(int *)(v22 + 48);
  *(void *)uint64_t v23 = 0x4024000000000000;
  *(unsigned char *)(v23 + 8) = 0;
  sub_243A567A4((uint64_t)v10, a4 + *(int *)(v22 + 64), &qword_268E22B98);
  sub_243A56808((uint64_t)v13, &qword_268E22B98);
  sub_243A56808((uint64_t)v19, &qword_268E22BA0);
  sub_243A56808((uint64_t)v10, &qword_268E22B98);
  return sub_243A56808((uint64_t)v16, &qword_268E22BA0);
}

uint64_t sub_243DCFB30@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  LODWORD(v95) = a2;
  uint64_t v99 = a3;
  uint64_t v4 = type metadata accessor for OrderWidgetMerchantTitleModifier();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v97 = (uint64_t *)((char *)&v92 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v6);
  uint64_t v98 = (uint64_t)&v92 - v7;
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19710);
  MEMORY[0x270FA5388](v96);
  uint64_t v9 = (char *)&v92 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19718);
  MEMORY[0x270FA5388](v94);
  uint64_t v102 = (uint64_t)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v93 = (char *)&v92 - v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v100 = (uint64_t)&v92 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19720);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v92 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19728);
  MEMORY[0x270FA5388](v92);
  uint64_t v101 = (uint64_t)&v92 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v92 - v20;
  MEMORY[0x270FA5388](v22);
  uint64_t v104 = (uint64_t)&v92 - v23;
  uint64_t v24 = type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
  uint64_t v25 = (uint64_t *)(a1 + *(int *)(v24 + 32));
  uint64_t v26 = v25[1];
  uint64_t v105 = *v25;
  uint64_t v106 = v26;
  unint64_t v27 = sub_243A56634();
  swift_bridgeObjectRetain();
  uint64_t v103 = v27;
  uint64_t v28 = sub_243DFDAA0();
  uint64_t v30 = v29;
  char v32 = v31 & 1;
  uint64_t v33 = v24;
  uint64_t v34 = *(int *)(v24 + 36);
  uint64_t v35 = a1;
  sub_243A9ABBC(*(void *)(a1 + v34), v28, v29, v31 & 1, v36, (uint64_t)v17);
  sub_243A56688(v28, v30, v32);
  char v37 = v95;
  swift_bridgeObjectRelease();
  if (v37) {
    uint64_t v38 = sub_243DFD7E0();
  }
  else {
    uint64_t v38 = sub_243DFD8B0();
  }
  uint64_t v39 = v38;
  uint64_t v40 = v33;
  uint64_t v41 = v92;
  uint64_t KeyPath = swift_getKeyPath();
  sub_243A567A4((uint64_t)v17, (uint64_t)v21, &qword_268E19720);
  v43 = (uint64_t *)&v21[*(int *)(v41 + 36)];
  uint64_t *v43 = KeyPath;
  v43[1] = v39;
  sub_243A56808((uint64_t)v17, &qword_268E19720);
  sub_243A56740((uint64_t)v21, v104, &qword_268E19728);
  uint64_t v44 = v35;
  uint64_t v45 = (uint64_t *)(v35 + *(int *)(v40 + 28));
  uint64_t v46 = v45[1];
  uint64_t v105 = *v45;
  uint64_t v106 = v46;
  swift_bridgeObjectRetain();
  uint64_t v47 = sub_243DFDAA0();
  uint64_t v49 = v48;
  char v51 = v50;
  uint64_t v53 = v52;
  uint64_t v54 = swift_getKeyPath();
  uint64_t v55 = v97;
  *uint64_t v97 = v54;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  swift_storeEnumTagMultiPayload();
  uint64_t v56 = (uint64_t)v55;
  uint64_t v57 = v98;
  sub_243DD13F8(v56, v98, (uint64_t (*)(void))type metadata accessor for OrderWidgetMerchantTitleModifier);
  sub_243DD1460(v57, (uint64_t)&v9[*(int *)(v96 + 36)], (uint64_t (*)(void))type metadata accessor for OrderWidgetMerchantTitleModifier);
  *(void *)uint64_t v9 = v47;
  *((void *)v9 + 1) = v49;
  v9[16] = v51 & 1;
  *((void *)v9 + 3) = v53;
  sub_243A9B700(v57, (uint64_t (*)(void))type metadata accessor for OrderWidgetMerchantTitleModifier);
  if (v37) {
    uint64_t v58 = sub_243DFD930();
  }
  else {
    uint64_t v58 = sub_243DFD7B0();
  }
  uint64_t v59 = v58;
  uint64_t v60 = v100;
  uint64_t v62 = (uint64_t)v93;
  uint64_t v61 = v94;
  uint64_t v63 = swift_getKeyPath();
  sub_243A567A4((uint64_t)v9, v62, &qword_268E19710);
  uint64_t v64 = (uint64_t *)(v62 + *(int *)(v61 + 36));
  *uint64_t v64 = v63;
  v64[1] = v59;
  sub_243A56808((uint64_t)v9, &qword_268E19710);
  sub_243A56740(v62, v60, &qword_268E19718);
  uint64_t v65 = (uint64_t *)(v44 + *(int *)(v40 + 40));
  uint64_t v66 = v65[1];
  if (v66)
  {
    uint64_t v105 = *v65;
    uint64_t v106 = v66;
    swift_bridgeObjectRetain();
    uint64_t v67 = sub_243DFDAA0();
    uint64_t v69 = v68;
    uint64_t v71 = v70;
    uint64_t v73 = v72 & 1;
    uint64_t v103 = swift_getKeyPath();
    uint64_t v74 = swift_getKeyPath();
    uint64_t v75 = sub_243DFD3E0();
    if (v37) {
      uint64_t v76 = sub_243DFD930();
    }
    else {
      uint64_t v76 = sub_243DFD7B0();
    }
    uint64_t v96 = v76;
    uint64_t v77 = v60;
    uint64_t v80 = swift_getKeyPath();
    uint64_t v97 = (uint64_t *)(v75 << 32);
    uint64_t v98 = v80;
    uint64_t v79 = 1;
    uint64_t v95 = v67;
    uint64_t v78 = v73;
  }
  else
  {
    uint64_t v77 = v60;
    uint64_t v95 = 0;
    uint64_t v96 = 0;
    uint64_t v69 = 0;
    uint64_t v78 = 0;
    uint64_t v71 = 0;
    uint64_t v103 = 0;
    uint64_t v79 = 0;
    uint64_t v74 = 0;
    uint64_t v97 = 0;
    uint64_t v98 = 0;
  }
  uint64_t v81 = v101;
  sub_243A567A4(v104, v101, &qword_268E19728);
  uint64_t v82 = v102;
  sub_243A567A4(v77, v102, &qword_268E19718);
  uint64_t v83 = v81;
  uint64_t v84 = v99;
  sub_243A567A4(v83, v99, &qword_268E19728);
  uint64_t v85 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268E22BC8);
  sub_243A567A4(v82, v84 + v85[12], &qword_268E19718);
  uint64_t v86 = (uint64_t *)(v84 + v85[16]);
  uint64_t v87 = v95;
  *uint64_t v86 = v95;
  v86[1] = v69;
  v86[2] = v78;
  v86[3] = v71;
  uint64_t v88 = v103;
  v86[4] = v103;
  v86[5] = v79;
  v86[6] = v74;
  v86[7] = v79;
  uint64_t v89 = v98;
  v86[8] = (uint64_t)v97;
  v86[9] = v89;
  uint64_t v103 = v88;
  v86[10] = v96;
  uint64_t v90 = v84 + v85[20];
  *(void *)uint64_t v90 = 0;
  *(unsigned char *)(v90 + 8) = 0;
  sub_243DD1B38(v87, v69, v78, v71);
  sub_243A56808(v100, &qword_268E19718);
  sub_243A56808(v104, &qword_268E19728);
  sub_243DD1BB8(v87, v69, v78, v71);
  sub_243A56808(v102, &qword_268E19718);
  return sub_243A56808(v101, &qword_268E19728);
}

uint64_t sub_243DD023C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (int *)type metadata accessor for OrderWidgetImageView();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v28 - v13;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v28 - v16;
  sub_243DD1460(a1, (uint64_t)v8, type metadata accessor for OrderWidgetTimelineEntry.OrderData);
  uint64_t v18 = *(void *)(a2 + *(int *)(type metadata accessor for OrderWidgetTimelineEntry(0) + 24));
  switch(v18)
  {
    case 1:
      uint64_t v19 = 0x4066000000000000;
      goto LABEL_5;
    case 2:
      uint64_t v19 = 0x4055800000000000;
LABEL_5:
      double v20 = *(double *)&v19;
      break;
    case 3:
      double v20 = 82.0;
      break;
    default:
      double v20 = 71.0;
      break;
  }
  sub_243DD13F8((uint64_t)v8, (uint64_t)v14, type metadata accessor for OrderWidgetTimelineEntry.OrderData);
  *(double *)&v14[v9[5]] = v20;
  *(double *)&v14[v9[6]] = v20;
  *(void *)&v14[v9[7]] = 0x4018000000000000;
  uint64_t v21 = (uint64_t *)&v14[v9[8]];
  uint64_t *v21 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
  swift_storeEnumTagMultiPayload();
  uint64_t v22 = (uint64_t *)&v14[v9[9]];
  *uint64_t v22 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E19740);
  swift_storeEnumTagMultiPayload();
  uint64_t v23 = &v14[v9[10]];
  *(void *)uint64_t v23 = swift_getKeyPath();
  v23[40] = 0;
  uint64_t v24 = (uint64_t *)&v14[v9[11]];
  *uint64_t v24 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E19690);
  swift_storeEnumTagMultiPayload();
  sub_243DD13F8((uint64_t)v14, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  LOBYTE(v24) = *(void *)(*(void *)a2 + 16) < 3uLL;
  sub_243DD1460((uint64_t)v17, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  *(void *)a3 = 0;
  *(unsigned char *)(a3 + 8) = 0;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22BC0);
  sub_243DD1460((uint64_t)v11, a3 + *(int *)(v25 + 48), (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  uint64_t v26 = a3 + *(int *)(v25 + 64);
  *(void *)uint64_t v26 = 0;
  *(unsigned char *)(v26 + 8) = 0;
  *(unsigned char *)(v26 + 9) = (_BYTE)v24;
  sub_243A9B700((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  return sub_243A9B700((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
}

uint64_t sub_243DD0584@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v92 = a2;
  uint64_t v94 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19708);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v100 = (uint64_t)&v87 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v93 = (uint64_t *)((char *)&v87 - v7);
  uint64_t v8 = type metadata accessor for OrderWidgetMerchantTitleModifier();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v90 = (uint64_t *)((char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v10);
  uint64_t v96 = (uint64_t)&v87 - v11;
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19710) - 8;
  MEMORY[0x270FA5388](v91);
  uint64_t v89 = (char *)&v87 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19718) - 8;
  MEMORY[0x270FA5388](v101);
  uint64_t v97 = (uint64_t)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v98 = (uint64_t)&v87 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19720);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v87 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19728);
  uint64_t v20 = v19 - 8;
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v87 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v95 = (uint64_t)&v87 - v24;
  uint64_t v25 = (int *)type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
  uint64_t v26 = v25[8];
  uint64_t v87 = a1;
  unint64_t v27 = (uint64_t *)(a1 + v26);
  uint64_t v28 = v27[1];
  uint64_t v102 = *v27;
  uint64_t v103 = v28;
  sub_243A56634();
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_243DFDAA0();
  uint64_t v31 = v30;
  char v33 = v32 & 1;
  sub_243A9ABBC(*(void *)(a1 + v25[9]), v29, v30, v32 & 1, v34, (uint64_t)v18);
  sub_243A56688(v29, v31, v33);
  swift_bridgeObjectRelease();
  uint64_t v35 = sub_243DFD8A0();
  uint64_t KeyPath = swift_getKeyPath();
  sub_243A567A4((uint64_t)v18, (uint64_t)v22, &qword_268E19720);
  char v37 = (uint64_t *)&v22[*(int *)(v20 + 44)];
  *char v37 = KeyPath;
  v37[1] = v35;
  sub_243A56808((uint64_t)v18, &qword_268E19720);
  uint64_t v99 = v22;
  uint64_t v38 = v95;
  sub_243A56740((uint64_t)v22, v95, &qword_268E19728);
  uint64_t v39 = v25;
  uint64_t v40 = v25[7];
  uint64_t v41 = v87;
  uint64_t v42 = (uint64_t *)(v87 + v40);
  uint64_t v43 = v42[1];
  uint64_t v102 = *v42;
  uint64_t v103 = v43;
  swift_bridgeObjectRetain();
  uint64_t v44 = sub_243DFDAA0();
  uint64_t v46 = v45;
  LOBYTE(v20) = v47;
  uint64_t v49 = v48;
  uint64_t v50 = swift_getKeyPath();
  char v51 = v90;
  *uint64_t v90 = v50;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  swift_storeEnumTagMultiPayload();
  uint64_t v52 = (uint64_t)v51;
  uint64_t v53 = v96;
  sub_243DD13F8(v52, v96, (uint64_t (*)(void))type metadata accessor for OrderWidgetMerchantTitleModifier);
  uint64_t v54 = (uint64_t)v89;
  sub_243DD1460(v53, (uint64_t)&v89[*(int *)(v91 + 44)], (uint64_t (*)(void))type metadata accessor for OrderWidgetMerchantTitleModifier);
  *(void *)uint64_t v54 = v44;
  *(void *)(v54 + 8) = v46;
  *(unsigned char *)(v54 + 16) = v20 & 1;
  *(void *)(v54 + 24) = v49;
  sub_243A9B700(v53, (uint64_t (*)(void))type metadata accessor for OrderWidgetMerchantTitleModifier);
  uint64_t v55 = sub_243DFD7B0();
  uint64_t v56 = swift_getKeyPath();
  uint64_t v57 = v97;
  sub_243A567A4(v54, v97, &qword_268E19710);
  uint64_t v58 = (uint64_t *)(v57 + *(int *)(v101 + 44));
  uint64_t *v58 = v56;
  v58[1] = v55;
  uint64_t v59 = v41;
  sub_243A56808(v54, &qword_268E19710);
  uint64_t v60 = v98;
  sub_243A56740(v57, v98, &qword_268E19718);
  uint64_t v61 = (uint64_t *)(v41 + v39[10]);
  uint64_t v62 = v61[1];
  if (v62)
  {
    uint64_t v102 = *v61;
    uint64_t v103 = v62;
    swift_bridgeObjectRetain();
    uint64_t v101 = sub_243DFDAA0();
    uint64_t v96 = v63;
    uint64_t v91 = v64;
    uint64_t v66 = v65 & 1;
    uint64_t v90 = (void *)swift_getKeyPath();
    uint64_t v89 = (char *)swift_getKeyPath();
    uint64_t v88 = sub_243DFD3E0() << 32;
    uint64_t v67 = 1;
  }
  else
  {
    uint64_t v101 = 0;
    uint64_t v96 = 0;
    uint64_t v66 = 0;
    uint64_t v90 = 0;
    uint64_t v91 = 0;
    uint64_t v67 = 0;
    uint64_t v88 = 0;
    uint64_t v89 = 0;
  }
  uint64_t v68 = sub_243DFCE70();
  uint64_t v69 = (uint64_t)v93;
  *uint64_t v93 = v68;
  *(void *)(v69 + 8) = 0;
  *(unsigned char *)(v69 + 16) = 1;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19730);
  sub_243DD0CE0(v59, v92, v69 + *(int *)(v70 + 44));
  uint64_t v71 = (uint64_t)v99;
  sub_243A567A4(v38, (uint64_t)v99, &qword_268E19728);
  sub_243A567A4(v60, v57, &qword_268E19718);
  sub_243A567A4(v69, v100, &qword_268E19708);
  uint64_t v72 = v71;
  uint64_t v73 = v94;
  sub_243A567A4(v72, v94, &qword_268E19728);
  uint64_t v74 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268E22B10);
  sub_243A567A4(v57, v73 + v74[12], &qword_268E19718);
  uint64_t v75 = (void *)(v73 + v74[16]);
  uint64_t v76 = v101;
  uint64_t v77 = v96;
  *uint64_t v75 = v101;
  v75[1] = v77;
  uint64_t v78 = v90;
  uint64_t v79 = v91;
  v75[2] = v66;
  v75[3] = v79;
  v75[4] = v78;
  v75[5] = v67;
  uint64_t v80 = v88;
  v75[6] = v89;
  v75[7] = v67;
  v75[8] = v80;
  uint64_t v81 = v73 + v74[20];
  *(void *)uint64_t v81 = 0;
  *(unsigned char *)(v81 + 8) = 1;
  uint64_t v82 = v73 + v74[24];
  uint64_t v83 = v100;
  sub_243A567A4(v100, v82, &qword_268E19708);
  uint64_t v84 = v76;
  uint64_t v85 = v96;
  sub_243DD1300(v84, v96, v66, v79);
  sub_243A56808(v69, &qword_268E19708);
  sub_243A56808(v98, &qword_268E19718);
  sub_243A56808(v95, &qword_268E19728);
  sub_243A56808(v83, &qword_268E19708);
  sub_243DD1364(v101, v85, v66, v79);
  sub_243A56808(v97, &qword_268E19718);
  return sub_243A56808((uint64_t)v99, &qword_268E19728);
}

uint64_t sub_243DD0CE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (int *)type metadata accessor for OrderWidgetImageView();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v27 - v13;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v27 - v16;
  sub_243DD1460(a1, (uint64_t)v8, type metadata accessor for OrderWidgetTimelineEntry.OrderData);
  uint64_t v18 = *(void *)(a2 + *(int *)(type metadata accessor for OrderWidgetTimelineEntry(0) + 24));
  switch(v18)
  {
    case 1:
      uint64_t v19 = 0x4066000000000000;
      goto LABEL_5;
    case 2:
      uint64_t v19 = 0x4055800000000000;
LABEL_5:
      double v20 = *(double *)&v19;
      break;
    case 3:
      double v20 = 82.0;
      break;
    default:
      double v20 = 71.0;
      break;
  }
  sub_243DD13F8((uint64_t)v8, (uint64_t)v14, type metadata accessor for OrderWidgetTimelineEntry.OrderData);
  *(double *)&v14[v9[5]] = v20;
  *(double *)&v14[v9[6]] = v20;
  *(void *)&v14[v9[7]] = 0x4020000000000000;
  uint64_t v21 = (uint64_t *)&v14[v9[8]];
  uint64_t *v21 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
  swift_storeEnumTagMultiPayload();
  uint64_t v22 = (uint64_t *)&v14[v9[9]];
  *uint64_t v22 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E19740);
  swift_storeEnumTagMultiPayload();
  uint64_t v23 = &v14[v9[10]];
  *(void *)uint64_t v23 = swift_getKeyPath();
  v23[40] = 0;
  uint64_t v24 = (uint64_t *)&v14[v9[11]];
  *uint64_t v24 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E19690);
  swift_storeEnumTagMultiPayload();
  sub_243DD13F8((uint64_t)v14, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  sub_243DD1460((uint64_t)v17, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  *(void *)a3 = 0;
  *(unsigned char *)(a3 + 8) = 1;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19748);
  sub_243DD1460((uint64_t)v11, a3 + *(int *)(v25 + 48), (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  sub_243A9B700((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  return sub_243A9B700((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
}

uint64_t sub_243DD1008()
{
  uint64_t v1 = (int *)_s5LargeVMa();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v6 = type metadata accessor for OrderWidgetTimelineEntry(0);
  uint64_t v7 = v0 + v3 + *(int *)(v6 + 20);
  uint64_t v8 = sub_243DFBE80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v0 + v3 + *(int *)(v6 + 28);
  uint64_t v10 = sub_243DFE790();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  uint64_t v12 = v5 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_243DFC8E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  else
  {
    swift_release();
  }
  sub_243A557AC(*(void *)(v5 + v1[6]), *(unsigned char *)(v5 + v1[6] + 8));
  uint64_t v14 = v5 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E19690);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_243DFE6C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_243DD127C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_243DCDEE0(a1, a2);
}

uint64_t sub_243DD1300(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_243A63AD4(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_243DD1364(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_243A56688(result, a2, a3 & 1);
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_243DD13F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_243DD1460(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_243DD14C8()
{
  uint64_t v1 = (int *)_s5LargeVMa();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_unknownObjectRelease();
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v6 = type metadata accessor for OrderWidgetTimelineEntry(0);
  uint64_t v7 = v0 + v3 + *(int *)(v6 + 20);
  uint64_t v8 = sub_243DFBE80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v0 + v3 + *(int *)(v6 + 28);
  uint64_t v10 = sub_243DFE790();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  uint64_t v12 = v5 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_243DFC8E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  else
  {
    swift_release();
  }
  sub_243A557AC(*(void *)(v5 + v1[6]), *(unsigned char *)(v5 + v1[6] + 8));
  uint64_t v14 = v5 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E19690);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_243DFE6C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_243DD1744@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(_s5LargeVMa() - 8);
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  unint64_t v8 = v2[5];
  uint64_t v9 = (uint64_t)v2 + ((*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_243DCE5A4(a1, v6, v7, v8, v9, a2);
}

uint64_t sub_243DD17CC()
{
  uint64_t v1 = (int *)_s5LargeVMa();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v6 = type metadata accessor for OrderWidgetTimelineEntry(0);
  uint64_t v7 = v0 + v3 + *(int *)(v6 + 20);
  uint64_t v8 = sub_243DFBE80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v0 + v3 + *(int *)(v6 + 28);
  uint64_t v10 = sub_243DFE790();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  uint64_t v12 = v5 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_243DFC8E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  else
  {
    swift_release();
  }
  sub_243A557AC(*(void *)(v5 + v1[6]), *(unsigned char *)(v5 + v1[6] + 8));
  uint64_t v14 = v5 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E19690);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_243DFE6C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v4 + v3 + 2, v2 | 7);
}

uint64_t sub_243DD1A44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(_s5LargeVMa() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = v2 + v6;
  uint64_t v8 = (unsigned __int8 *)(v2 + *(void *)(v5 + 64) + v6);
  int v9 = *v8;
  int v10 = v8[1];

  return sub_243DCF1E4(a1, v7, v9, v10, a2);
}

uint64_t sub_243DD1AF0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_243DD1B38(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_243A63AD4(result, a2, a3 & 1);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_243DD1BB8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_243A56688(result, a2, a3 & 1);
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

unint64_t sub_243DD1C3C()
{
  unint64_t result = qword_268E22BD0;
  if (!qword_268E22BD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22BD8);
    sub_243A569B0(&qword_268E22AE8, &qword_268E22AD8);
    sub_243A569B0(&qword_268E22AF0, &qword_268E22AC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22BD0);
  }
  return result;
}

unint64_t sub_243DD1D00(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v13 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    char v8 = *(unsigned char *)(a2 + 8);
    sub_243A556F8(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(unsigned char *)(a1 + 8) = v8;
    uint64_t v9 = *(int *)(a3 + 20);
    int v10 = (void *)(a1 + v9);
    uint64_t v11 = (void *)(a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_243DFC510();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      void *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_243DD1E40(uint64_t a1, uint64_t a2)
{
  sub_243A557AC(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_243DFC510();
    unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_243DD1EFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_243A556F8(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  int v10 = (void *)(a2 + v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_243DFC510();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    void *v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_243DD1FE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_243A556F8(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_243A557AC(v8, v9);
  if (a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_243A56808(a1 + v10, &qword_268E18600);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_243DFC510();
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

uint64_t sub_243DD20F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_243DFC510();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_243DD21CC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_243A557AC(v8, v9);
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (char *)a2 + v10;
    sub_243A56808(a1 + v10, &qword_268E18600);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_243DFC510();
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

uint64_t sub_243DD22D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243DD22E8);
}

uint64_t sub_243DD22E8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18678);
    char v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_243DD2394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243DD23A8);
}

uint64_t sub_243DD23A8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 254)
  {
    *(unsigned char *)(result + 8) = -(char)a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18678);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for OrderLargeBlackButtonStyle()
{
  uint64_t result = qword_268E22BE0;
  if (!qword_268E22BE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_243DD249C()
{
  sub_243A6DC3C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_243DD2534()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_243DD2550@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v47[1] = a1;
  uint64_t v55 = a2;
  uint64_t v54 = sub_243DFC9E0() - 8;
  MEMORY[0x270FA5388](v54);
  uint64_t v53 = (char *)v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_243DFD470();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22BF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22BF8);
  uint64_t v51 = *(void *)(v10 - 8);
  uint64_t v52 = v10;
  MEMORY[0x270FA5388](v10);
  v47[0] = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22C00);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22C08) - 8;
  MEMORY[0x270FA5388](v48);
  uint64_t v17 = (char *)v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22C10) - 8;
  MEMORY[0x270FA5388](v49);
  uint64_t v50 = (uint64_t)v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243DFD480();
  uint64_t v19 = sub_243DFD7E0();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v6, v3);
  uint64_t v21 = (uint64_t *)&v9[*(int *)(v7 + 36)];
  uint64_t *v21 = KeyPath;
  v21[1] = v19;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_243DFD850();
  sub_243DD3030();
  uint64_t v22 = v47[0];
  sub_243DFDAF0();
  sub_243A56808((uint64_t)v9, &qword_268E22BF0);
  sub_243DFE4F0();
  sub_243DFCA30();
  uint64_t v24 = v51;
  uint64_t v23 = v52;
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v15, v22, v52);
  uint64_t v25 = &v15[*(int *)(v13 + 44)];
  long long v26 = v61;
  *((_OWORD *)v25 + 4) = v60;
  *((_OWORD *)v25 + 5) = v26;
  *((_OWORD *)v25 + 6) = v62;
  long long v27 = v57;
  *(_OWORD *)uint64_t v25 = v56;
  *((_OWORD *)v25 + 1) = v27;
  long long v28 = v59;
  *((_OWORD *)v25 + 2) = v58;
  *((_OWORD *)v25 + 3) = v28;
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
  uint64_t v29 = sub_243DD2AFC();
  sub_243A567A4((uint64_t)v15, (uint64_t)v17, &qword_268E22C00);
  *(void *)&v17[*(int *)(v48 + 44)] = v29;
  sub_243A56808((uint64_t)v15, &qword_268E22C00);
  char v30 = sub_243DFD490();
  uint64_t v31 = sub_243DD2CC8(v30 & 1);
  LOBYTE(v13) = sub_243DFD730();
  uint64_t v32 = v50;
  sub_243A567A4((uint64_t)v17, v50, &qword_268E22C08);
  uint64_t v33 = v32 + *(int *)(v49 + 44);
  *(void *)uint64_t v33 = v31;
  *(unsigned char *)(v33 + 8) = v13;
  sub_243A56808((uint64_t)v17, &qword_268E22C08);
  uint64_t v34 = v53;
  uint64_t v35 = &v53[*(int *)(v54 + 28)];
  uint64_t v36 = *MEMORY[0x263F19860];
  uint64_t v37 = sub_243DFCF60();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v37 - 8) + 104))(v35, v36, v37);
  __asm { FMOV            V0.2D, #12.0 }
  *uint64_t v34 = _Q0;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22C28);
  uint64_t v44 = v55;
  uint64_t v45 = v55 + *(int *)(v43 + 36);
  sub_243A6E1B0((uint64_t)v34, v45);
  *(_WORD *)(v45 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E18990) + 36)) = 256;
  sub_243A567A4(v32, v44, &qword_268E22C10);
  sub_243A6E214((uint64_t)v34);
  return sub_243A56808(v32, &qword_268E22C10);
}

uint64_t sub_243DD2AFC()
{
  uint64_t v1 = sub_243DFC510();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = *(void *)v0;
  char v9 = *(unsigned char *)(v0 + 8);
  sub_243A556F8(*(void *)v0, v9);
  char v10 = sub_243AFB580(v8, v9);
  sub_243A557AC(v8, v9);
  type metadata accessor for OrderLargeBlackButtonStyle();
  sub_243AFBD2C((uint64_t)v7);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F18508], v1);
  char v11 = sub_243DFC500();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v2 + 8);
  v12(v4, v1);
  v12(v7, v1);
  if (v10)
  {
    if (v11) {
      return sub_243DFE060();
    }
    else {
      return sub_243DFE030();
    }
  }
  else
  {
    uint64_t v14 = self;
    uint64_t v15 = &selRef_systemGray3Color;
    if ((v11 & 1) == 0) {
      uint64_t v15 = &selRef_systemGray2Color;
    }
    return MEMORY[0x245685B60]([v14 *v15]);
  }
}

uint64_t sub_243DD2CC8(int a1)
{
  int v29 = a1;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22C30);
  MEMORY[0x270FA5388](v28);
  uint64_t v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_243DFC510();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  char v10 = (char *)&v28 - v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v28 - v12;
  uint64_t v14 = *(void *)v1;
  char v15 = *(unsigned char *)(v1 + 8);
  sub_243A556F8(*(void *)v1, v15);
  char v16 = sub_243AFB580(v14, v15);
  sub_243A557AC(v14, v15);
  type metadata accessor for OrderLargeBlackButtonStyle();
  if (v16)
  {
    sub_243AFBD2C((uint64_t)v13);
    uint64_t v17 = *(int *)(v28 + 48);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v3, v13, v4);
    char v18 = v29;
    v3[v17] = v29 & 1;
    int v19 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v3, v4);
    if (v19 == *MEMORY[0x263F18508])
    {
      if ((v18 & 1) == 0)
      {
        uint64_t v26 = sub_243DFE030();
        goto LABEL_15;
      }
      id v20 = objc_msgSend(self, sel_systemGray3Color);
LABEL_11:
      uint64_t v26 = MEMORY[0x245685C60](v20);
LABEL_15:
      uint64_t v25 = v26;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
      return v25;
    }
    if (v19 == *MEMORY[0x263F184F8])
    {
      if ((v18 & 1) == 0)
      {
        uint64_t v26 = sub_243DFE060();
        goto LABEL_15;
      }
      id v20 = objc_msgSend(self, sel_systemGray4Color);
      goto LABEL_11;
    }
    uint64_t v25 = sub_243DFE030();
    sub_243A56808((uint64_t)v3, &qword_268E22C30);
  }
  else
  {
    sub_243AFBD2C((uint64_t)v10);
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F18508], v4);
    char v21 = sub_243DFC500();
    uint64_t v22 = *(void (**)(char *, uint64_t))(v5 + 8);
    v22(v7, v4);
    v22(v10, v4);
    uint64_t v23 = self;
    uint64_t v24 = &selRef_systemGray6Color;
    if ((v21 & 1) == 0) {
      uint64_t v24 = &selRef_systemGray4Color;
    }
    return MEMORY[0x245685B60](objc_msgSend(v23, *v24, v28));
  }
  return v25;
}

unint64_t sub_243DD3030()
{
  unint64_t result = qword_268E22C18;
  if (!qword_268E22C18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22BF0);
    sub_243DD30D0();
    sub_243A569B0(&qword_268E185B0, &qword_268E185B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22C18);
  }
  return result;
}

unint64_t sub_243DD30D0()
{
  unint64_t result = qword_268E22C20;
  if (!qword_268E22C20)
  {
    sub_243DFD470();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22C20);
  }
  return result;
}

unint64_t sub_243DD312C()
{
  unint64_t result = qword_268E22C38;
  if (!qword_268E22C38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22C28);
    sub_243DD31CC();
    sub_243A569B0(&qword_268E189C8, &qword_268E18990);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22C38);
  }
  return result;
}

unint64_t sub_243DD31CC()
{
  unint64_t result = qword_268E22C40;
  if (!qword_268E22C40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22C10);
    sub_243DD326C();
    sub_243A569B0(&qword_268E189B8, &qword_268E189C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22C40);
  }
  return result;
}

unint64_t sub_243DD326C()
{
  unint64_t result = qword_268E22C48;
  if (!qword_268E22C48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22C08);
    sub_243DD330C();
    sub_243A569B0(&qword_268E19778, &qword_268E19780);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22C48);
  }
  return result;
}

unint64_t sub_243DD330C()
{
  unint64_t result = qword_268E22C50;
  if (!qword_268E22C50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22C00);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22BF0);
    sub_243DD3030();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22C50);
  }
  return result;
}

double static EdgeInsets.defaultListRowInsets(_:)()
{
  uint64_t v0 = sub_243DFC8E0();
  uint64_t v1 = *(void *)(v0 - 8);
  double v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, double))(v1 + 104))(v4, *MEMORY[0x263F18D10], v0, v2);
  sub_243DFC8D0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return 12.0;
}

double View.defaultListElementVerticalSpacing()()
{
  return 8.0;
}

uint64_t View.orderImageStyle(style:hideBorder:scale:strokeColor:)(char *a1, char a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return View.orderImageStyle(size:cornerRadius:scale:strokeColor:hideBorder:)(a3, a4 & 1, a5, a2, a6, a7, dbl_243E16200[*a1], dbl_243E161D0[*a1]);
}

uint64_t static Section<>.compact<>(header:content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v41 = a6;
  uint64_t v42 = a7;
  v36[0] = a5;
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v38 = a1;
  uint64_t v45 = a8;
  uint64_t v9 = sub_243DFCEB0();
  uint64_t v43 = *(void *)(v9 - 8);
  uint64_t v44 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v13);
  char v15 = (char *)v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_243DFE410();
  uint64_t v37 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  char v18 = (char *)v36 - v17;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E1BC90);
  v36[1] = sub_243DFC920();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E1BC48);
  uint64_t v19 = sub_243DFC920();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v24 = MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)v36 - v25;
  (*(void (**)(char *, uint64_t, uint64_t, double))(v12 + 16))(v15, v38, a4, v24);
  uint64_t v28 = v41;
  uint64_t v27 = v42;
  sub_243DFE3D0();
  sub_243DFCEA0();
  uint64_t v50 = v28;
  uint64_t v51 = v27;
  uint64_t v52 = MEMORY[0x263F1BA00];
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_243DFDD10();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v44);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v18, v16);
  uint64_t v30 = sub_243A569B0(&qword_268E1BC88, &qword_268E1BC90);
  uint64_t v48 = WitnessTable;
  uint64_t v49 = v30;
  uint64_t v31 = swift_getWitnessTable();
  uint64_t v32 = sub_243A569B0(&qword_268E1BC98, &qword_268E1BC48);
  uint64_t v46 = v31;
  uint64_t v47 = v32;
  uint64_t v33 = swift_getWitnessTable();
  sub_243A6C1BC(v22, v19, v33);
  uint64_t v34 = *(void (**)(char *, uint64_t))(v20 + 8);
  v34(v22, v19);
  sub_243A6C1BC(v26, v19, v33);
  return ((uint64_t (*)(char *, uint64_t))v34)(v26, v19);
}

uint64_t static Section<>.compact<>(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  v26[3] = a2;
  uint64_t v27 = a3;
  v26[2] = a1;
  uint64_t v29 = a4;
  uint64_t v28 = sub_243DFCEB0();
  uint64_t v4 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_243DFE410();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v26 - v9;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E1BC90);
  v26[1] = sub_243DFC920();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E1BC48);
  uint64_t v11 = sub_243DFC920();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)v26 - v16;
  uint64_t v18 = v27;
  sub_243DFE3F0();
  sub_243DFCEA0();
  uint64_t v34 = MEMORY[0x263F1BA00];
  uint64_t v35 = v18;
  uint64_t v36 = MEMORY[0x263F1BA00];
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_243DFDD10();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v28);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v20 = sub_243A569B0(&qword_268E1BC88, &qword_268E1BC90);
  uint64_t v32 = WitnessTable;
  uint64_t v33 = v20;
  uint64_t v21 = swift_getWitnessTable();
  uint64_t v22 = sub_243A569B0(&qword_268E1BC98, &qword_268E1BC48);
  uint64_t v30 = v21;
  uint64_t v31 = v22;
  uint64_t v23 = swift_getWitnessTable();
  sub_243A6C1BC(v14, v11, v23);
  double v24 = *(void (**)(char *, uint64_t))(v12 + 8);
  v24(v14, v11);
  sub_243A6C1BC(v17, v11, v23);
  return ((uint64_t (*)(char *, uint64_t))v24)(v17, v11);
}

BOOL static OrderImageStyle.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t OrderImageStyle.hash(into:)()
{
  return sub_243DFF460();
}

uint64_t OrderImageStyle.hashValue.getter()
{
  return sub_243DFF4B0();
}

double sub_243DD3D7C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_243DFC8E0();
  uint64_t v3 = *(void *)(v2 - 8);
  double v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v3 + 16))(v6, v1, v2, v4);
  int v7 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  if (v7 == *MEMORY[0x263F18D48]) {
    return 0.8;
  }
  if (v7 == *MEMORY[0x263F18D20]) {
    return 0.85;
  }
  if (v7 == *MEMORY[0x263F18D28]) {
    return 0.9;
  }
  double result = 1.0;
  if (v7 != *MEMORY[0x263F18D10])
  {
    if (v7 == *MEMORY[0x263F18D38])
    {
      return 1.1;
    }
    else if (v7 == *MEMORY[0x263F18D60])
    {
      return 1.2;
    }
    else if (v7 == *MEMORY[0x263F18D70])
    {
      return 1.35;
    }
    else
    {
      double result = 1.5;
      if (v7 != *MEMORY[0x263F18CB8])
      {
        if (v7 == *MEMORY[0x263F18CC8])
        {
          return 1.6;
        }
        else if (v7 == *MEMORY[0x263F18CD8])
        {
          return 1.7;
        }
        else if (v7 == *MEMORY[0x263F18CF0])
        {
          return 1.8;
        }
        else
        {
          double result = 2.0;
          if (v7 != *MEMORY[0x263F18CF8])
          {
            (*(void (**)(char *, uint64_t, double))(v3 + 8))(v6, v2, 2.0);
            return 1.0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_243DD3FEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v90 = a1;
  uint64_t v95 = a2;
  uint64_t v84 = sub_243DFC510();
  uint64_t v83 = *(void *)(v84 - 8);
  MEMORY[0x270FA5388](v84);
  uint64_t v82 = (char *)&v80 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v81 = (uint64_t)&v80 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19468);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v94 = (uint64_t)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_243DFC9E0();
  MEMORY[0x270FA5388](v9);
  uint64_t v93 = (double *)((char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v11);
  uint64_t v88 = (double *)((char *)&v80 - v12);
  uint64_t v13 = sub_243DFC8E0();
  uint64_t v98 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v97 = (uint64_t)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for OrderImageStyleModifier();
  MEMORY[0x270FA5388](v15);
  uint64_t v89 = (uint64_t)&v80 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v80 - v18;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v80 - v21;
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v80 - v24;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22CD0);
  MEMORY[0x270FA5388](v26);
  uint64_t v96 = (uint64_t)&v80 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22CD8);
  MEMORY[0x270FA5388](v87);
  uint64_t v99 = (uint64_t)&v80 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22CE0);
  MEMORY[0x270FA5388](v91);
  uint64_t v92 = (char *)&v80 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v30 = *(unsigned __int8 *)(v2 + 24);
  sub_243DD6C60(v3, (uint64_t)v25, (uint64_t (*)(void))type metadata accessor for OrderImageStyleModifier);
  if (v30 == 1)
  {
    uint64_t v31 = v97;
    sub_243AFB7C0(v97);
    sub_243DD3D7C();
    (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v31, v13);
  }
  sub_243DD6CC8((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for OrderImageStyleModifier);
  int v32 = *(unsigned __int8 *)(v3 + 24);
  sub_243DD6C60(v3, (uint64_t)v22, (uint64_t (*)(void))type metadata accessor for OrderImageStyleModifier);
  if (v32 == 1)
  {
    uint64_t v33 = v97;
    sub_243AFB7C0(v97);
    sub_243DD3D7C();
    (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v33, v13);
  }
  sub_243DD6CC8((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for OrderImageStyleModifier);
  sub_243DFE4F0();
  sub_243DFC670();
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22CE8);
  uint64_t v35 = v96;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 16))(v96, v90, v34);
  uint64_t v36 = (_OWORD *)(v35 + *(int *)(v26 + 36));
  long long v37 = v101;
  *uint64_t v36 = v100;
  v36[1] = v37;
  void v36[2] = v102;
  double v39 = *(double *)(v3 + 8);
  double v38 = *(double *)(v3 + 16);
  LODWORD(v35) = *(unsigned __int8 *)(v3 + 24);
  sub_243DD6C60(v3, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for OrderImageStyleModifier);
  if (v35 == 1)
  {
    uint64_t v40 = v97;
    sub_243AFB7C0(v97);
    double v38 = sub_243DD3D7C();
    (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v40, v13);
  }
  uint64_t v80 = v13;
  sub_243DD6CC8((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for OrderImageStyleModifier);
  double v41 = v39 * v38;
  uint64_t v90 = v9;
  uint64_t v42 = v88;
  uint64_t v43 = (char *)v88 + *(int *)(v9 + 20);
  uint64_t v44 = *MEMORY[0x263F19860];
  uint64_t v45 = sub_243DFCF60();
  uint64_t v46 = *(void (**)(char *, void, uint64_t))(*(void *)(v45 - 8) + 104);
  unsigned int v86 = v44;
  uint64_t v85 = v46;
  v46(v43, v44, v45);
  double *v42 = v41;
  v42[1] = v41;
  uint64_t v47 = v99;
  uint64_t v48 = v99 + *(int *)(v87 + 36);
  uint64_t v49 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_243DD6C60((uint64_t)v42, v48, MEMORY[0x263F19048]);
  *(_WORD *)(v48 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E18990) + 36)) = 256;
  uint64_t v50 = v96;
  sub_243A567A4(v96, v47, &qword_268E22CD0);
  sub_243DD6CC8((uint64_t)v42, v49);
  sub_243A56808(v50, &qword_268E22CD0);
  double v52 = *(double *)(v3 + 8);
  double v51 = *(double *)(v3 + 16);
  LODWORD(v48) = *(unsigned __int8 *)(v3 + 24);
  uint64_t v53 = v89;
  sub_243DD6C60(v3, v89, (uint64_t (*)(void))type metadata accessor for OrderImageStyleModifier);
  if (v48 == 1)
  {
    uint64_t v54 = v97;
    sub_243AFB7C0(v97);
    double v51 = sub_243DD3D7C();
    (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v54, v80);
  }
  sub_243DD6CC8(v53, (uint64_t (*)(void))type metadata accessor for OrderImageStyleModifier);
  double v55 = v52 * v51;
  long long v56 = v93;
  v85((char *)v93 + *(int *)(v90 + 20), v86, v45);
  double *v56 = v55;
  v56[1] = v55;
  if ((*(unsigned char *)(v3 + 40) & 1) == 0)
  {
    uint64_t v57 = v81;
    sub_243AFBD2C(v81);
    uint64_t v58 = v83;
    long long v59 = v82;
    uint64_t v60 = v84;
    (*(void (**)(char *, void, uint64_t))(v83 + 104))(v82, *MEMORY[0x263F18508], v84);
    sub_243DFC500();
    long long v61 = *(void (**)(char *, uint64_t))(v58 + 8);
    v61(v59, v60);
    v61((char *)v57, v60);
  }
  uint64_t v62 = sub_243DFE080();
  sub_243DFC570();
  uint64_t v63 = (uint64_t (*)(void))MEMORY[0x263F19048];
  uint64_t v64 = v94;
  sub_243DD6C60((uint64_t)v56, v94, MEMORY[0x263F19048]);
  uint64_t v65 = v64 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E19470) + 36);
  long long v66 = v104;
  *(_OWORD *)uint64_t v65 = v103;
  *(_OWORD *)(v65 + 16) = v66;
  *(void *)(v65 + 32) = v105;
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19478);
  *(void *)(v64 + *(int *)(v67 + 52)) = v62;
  *(_WORD *)(v64 + *(int *)(v67 + 56)) = 256;
  uint64_t v68 = sub_243DFE4F0();
  uint64_t v70 = v69;
  uint64_t v71 = (uint64_t *)(v64 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E19480) + 36));
  uint64_t *v71 = v68;
  v71[1] = v70;
  sub_243DD6CC8((uint64_t)v56, v63);
  uint64_t v72 = sub_243DFE4F0();
  uint64_t v74 = v73;
  uint64_t v75 = (uint64_t)v92;
  uint64_t v76 = (uint64_t)&v92[*(int *)(v91 + 36)];
  sub_243A567A4(v64, v76, &qword_268E19468);
  uint64_t v77 = (uint64_t *)(v76 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E19350) + 36));
  *uint64_t v77 = v72;
  v77[1] = v74;
  uint64_t v78 = v99;
  sub_243A567A4(v99, v75, &qword_268E22CD8);
  sub_243A56808(v64, &qword_268E19468);
  sub_243A56808(v78, &qword_268E22CD8);
  return sub_243A56740(v75, v95, &qword_268E22CE0);
}

uint64_t View.orderImageStyle(size:cornerRadius:scale:strokeColor:hideBorder:)(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, double a7, double a8)
{
  uint64_t v22 = a6;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18680);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (uint64_t *)((char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = type metadata accessor for OrderImageStyleModifier();
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (double *)((char *)&v22 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t *v17 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  swift_storeEnumTagMultiPayload();
  *(void *)((char *)v20 + *(int *)(v18 + 40)) = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
  swift_storeEnumTagMultiPayload();
  *uint64_t v20 = a7;
  v20[1] = a8;
  *((void *)v20 + 2) = a1;
  *((unsigned char *)v20 + 24) = a2 & 1;
  *((void *)v20 + 4) = a3;
  *((unsigned char *)v20 + 40) = a4;
  sub_243A56740((uint64_t)v17, (uint64_t)v20 + *(int *)(v18 + 36), &qword_268E18680);
  swift_retain();
  MEMORY[0x245685AA0](v20, a5, v18, v22);
  return sub_243DD6CC8((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for OrderImageStyleModifier);
}

uint64_t type metadata accessor for OrderImageStyleModifier()
{
  uint64_t result = qword_268E22CC0;
  if (!qword_268E22CC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

double sub_243DD4C48()
{
  double result = 8.0;
  xmmword_268E22C58 = xmmword_243E15FF0;
  *(_OWORD *)&qword_268E22C68 = xmmword_243E15FF0;
  return result;
}

double static EdgeInsets.veryNarrowListRowInsets.getter()
{
  if (qword_268E18118 != -1) {
    swift_once();
  }
  return *(double *)&xmmword_268E22C58;
}

double sub_243DD4CB4()
{
  double result = 12.0;
  xmmword_268E22C78 = xmmword_243E16000;
  *(_OWORD *)&qword_268E22C88 = xmmword_243E16000;
  return result;
}

double static EdgeInsets.narrowListRowInsets.getter()
{
  if (qword_268E18120 != -1) {
    swift_once();
  }
  return *(double *)&xmmword_268E22C78;
}

double sub_243DD4D20()
{
  double result = 8.0;
  xmmword_268E22C98 = xmmword_243E16010;
  *(_OWORD *)&qword_268E22CA8 = xmmword_243E16010;
  return result;
}

double static EdgeInsets.defaultListRowInsetsMacOS.getter()
{
  if (qword_268E18128 != -1) {
    swift_once();
  }
  return *(double *)&xmmword_268E22C98;
}

uint64_t static Section<>.compact(header:footer:content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v55 = a4;
  uint64_t v56 = a8;
  uint64_t v46 = a6;
  uint64_t v52 = a2;
  uint64_t v49 = a1;
  uint64_t v59 = a9;
  uint64_t v53 = a10;
  uint64_t v54 = a3;
  uint64_t v45 = a11;
  uint64_t v13 = sub_243DFCEB0();
  uint64_t v57 = *(void *)(v13 - 8);
  uint64_t v58 = v13;
  MEMORY[0x270FA5388](v13);
  double v51 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(a7 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_243DFE410();
  uint64_t v48 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v44 - v24;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E1BC90);
  uint64_t v47 = sub_243DFC920();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E1BC48);
  uint64_t v26 = sub_243DFC920();
  uint64_t v50 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (char *)&v44 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v30 = MEMORY[0x270FA5388](v29);
  uint64_t v44 = (char *)&v44 - v31;
  (*(void (**)(char *, uint64_t, uint64_t, double))(v19 + 16))(v22, v49, a5, v30);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, v52, a7);
  uint64_t v32 = v45;
  uint64_t v33 = v53;
  uint64_t v34 = v56;
  sub_243DFE3E0();
  uint64_t v35 = v51;
  sub_243DFCEA0();
  uint64_t v64 = v34;
  uint64_t v65 = v33;
  uint64_t v66 = v32;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_243DFDD10();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v35, v58);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v25, v23);
  uint64_t v37 = sub_243A569B0(&qword_268E1BC88, &qword_268E1BC90);
  uint64_t v62 = WitnessTable;
  uint64_t v63 = v37;
  uint64_t v38 = swift_getWitnessTable();
  uint64_t v39 = sub_243A569B0(&qword_268E1BC98, &qword_268E1BC48);
  uint64_t v60 = v38;
  uint64_t v61 = v39;
  uint64_t v40 = swift_getWitnessTable();
  double v41 = v44;
  sub_243A6C1BC(v28, v26, v40);
  uint64_t v42 = *(void (**)(char *, uint64_t))(v50 + 8);
  v42(v28, v26);
  sub_243A6C1BC(v41, v26, v40);
  return ((uint64_t (*)(char *, uint64_t))v42)(v41, v26);
}

uint64_t static Section<>.compact<>(footer:content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v41 = a6;
  uint64_t v42 = a7;
  v36[0] = a4;
  uint64_t v39 = a2;
  uint64_t v40 = a3;
  uint64_t v38 = a1;
  uint64_t v45 = a8;
  uint64_t v9 = sub_243DFCEB0();
  uint64_t v43 = *(void *)(v9 - 8);
  uint64_t v44 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_243DFE410();
  uint64_t v37 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)v36 - v17;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E1BC90);
  v36[1] = sub_243DFC920();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E1BC48);
  uint64_t v19 = sub_243DFC920();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v24 = MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)v36 - v25;
  (*(void (**)(char *, uint64_t, uint64_t, double))(v12 + 16))(v15, v38, a5, v24);
  uint64_t v28 = v41;
  uint64_t v27 = v42;
  sub_243DFE400();
  sub_243DFCEA0();
  uint64_t v50 = MEMORY[0x263F1BA00];
  uint64_t v51 = v28;
  uint64_t v52 = v27;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_243DFDD10();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v44);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v18, v16);
  uint64_t v30 = sub_243A569B0(&qword_268E1BC88, &qword_268E1BC90);
  uint64_t v48 = WitnessTable;
  uint64_t v49 = v30;
  uint64_t v31 = swift_getWitnessTable();
  uint64_t v32 = sub_243A569B0(&qword_268E1BC98, &qword_268E1BC48);
  uint64_t v46 = v31;
  uint64_t v47 = v32;
  uint64_t v33 = swift_getWitnessTable();
  sub_243A6C1BC(v22, v19, v33);
  uint64_t v34 = *(void (**)(char *, uint64_t))(v20 + 8);
  v34(v22, v19);
  sub_243A6C1BC(v26, v19, v33);
  return ((uint64_t (*)(char *, uint64_t))v34)(v26, v19);
}

unint64_t sub_243DD56E0()
{
  unint64_t result = qword_268E22CB8;
  if (!qword_268E22CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22CB8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for OrderImageStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x243DD5800);
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

ValueMetadata *type metadata accessor for OrderImageStyle()
{
  return &type metadata for OrderImageStyle;
}

uint64_t sub_243DD5838()
{
  return swift_getWitnessTable();
}

unint64_t sub_243DD58A4()
{
  unint64_t result = qword_268E1D1F0;
  if (!qword_268E1D1F0)
  {
    type metadata accessor for OrderImageStyleModifier();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E1D1F0);
  }
  return result;
}

uint64_t sub_243DD58FC()
{
  return swift_getWitnessTable();
}

uint64_t sub_243DD5A54()
{
  return swift_getWitnessTable();
}

uint64_t sub_243DD5BAC()
{
  return swift_getWitnessTable();
}

uint64_t sub_243DD5D04()
{
  return swift_getWitnessTable();
}

void *sub_243DD5E58(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (void *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = a2[2];
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    *(void *)(a1 + 32) = a2[4];
    uint64_t v7 = *(int *)(a3 + 36);
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (uint64_t *)((char *)a2 + v7);
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_243DFC8E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v12 = *(int *)(a3 + 40);
    uint64_t v13 = (void *)((char *)v4 + v12);
    uint64_t v14 = (uint64_t *)((char *)a2 + v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_243DFC510();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *uint64_t v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t sub_243DD6038(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_243DFC8E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_243DFC510();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_243DD6168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_243DFC8E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  }
  else
  {
    *uint64_t v7 = *v8;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = *(int *)(a3 + 40);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_243DFC510();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  }
  else
  {
    *uint64_t v11 = *v12;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_243DD62F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 36);
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (void *)(a2 + v7);
    sub_243A56808(a1 + v7, &qword_268E18608);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_243DFC8E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = *(int *)(a3 + 40);
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (void *)(a2 + v11);
    sub_243A56808(a1 + v11, &qword_268E18600);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_243DFC510();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      *uint64_t v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_243DD64B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_243DFC8E0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = *(int *)(a3 + 40);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_243DFC510();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  return a1;
}

uint64_t sub_243DD6658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 36);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (const void *)(a2 + v6);
    sub_243A56808(a1 + v6, &qword_268E18608);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_243DFC8E0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
    uint64_t v11 = *(int *)(a3 + 40);
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (const void *)(a2 + v11);
    sub_243A56808(a1 + v11, &qword_268E18600);
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_243DFC510();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_243DD682C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243DD6840);
}

uint64_t sub_243DD6840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18680);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 36);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18678);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 40);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_243DD6974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243DD6988);
}

uint64_t sub_243DD6988(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 32) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18680);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 36);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18678);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 40);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_243DD6ABC()
{
  sub_243DD6BF0(319, (unint64_t *)&qword_268E186A0, MEMORY[0x263F18D80]);
  if (v0 <= 0x3F)
  {
    sub_243DD6BF0(319, (unint64_t *)&qword_268E18698, MEMORY[0x263F18520]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_243DD6BF0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_243DFC530();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_243DD6C44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_243DD6C60(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_243DD6CC8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_243DD6D2C()
{
  unint64_t result = qword_268E22CF0;
  if (!qword_268E22CF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22CE0);
    sub_243DD6DCC();
    sub_243A569B0(&qword_268E19348, &qword_268E19350);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22CF0);
  }
  return result;
}

unint64_t sub_243DD6DCC()
{
  unint64_t result = qword_268E22CF8;
  if (!qword_268E22CF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22CD8);
    sub_243DD6E6C();
    sub_243A569B0(&qword_268E189C8, &qword_268E18990);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22CF8);
  }
  return result;
}

unint64_t sub_243DD6E6C()
{
  unint64_t result = qword_268E22D00;
  if (!qword_268E22D00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22CD0);
    sub_243A569B0(&qword_268E22D08, &qword_268E22CE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22D00);
  }
  return result;
}

uint64_t sub_243DD6F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v57 = MEMORY[0x263F8EE78];
    sub_243D7AEF8(0, v4, 0);
    uint64_t v7 = a1 + 32;
    unint64_t v8 = 0x1F66C0000uLL;
    do
    {
      sub_243C57BD4(v7, (uint64_t)&v47);
      uint64_t v42 = v7;
      int64_t v43 = v4;
      if (v49 == 4)
      {
        long long v20 = v47;
        uint64_t v21 = v48;
        swift_bridgeObjectRetain();
        id v22 = objc_msgSend(v21, sel_title);
        uint64_t v23 = sub_243DFE910();
        uint64_t v25 = v24;

        *(void *)&long long v50 = v23;
        *((void *)&v50 + 1) = v25;
        id v26 = [v21 (SEL)(v8 + 1816)];
        uint64_t v27 = sub_243DFE910();
        unint64_t v29 = v28;

        swift_bridgeObjectRelease();
        uint64_t v30 = HIBYTE(v29) & 0xF;
        if ((v29 & 0x2000000000000000) == 0) {
          uint64_t v30 = v27 & 0xFFFFFFFFFFFFLL;
        }
        if (v30)
        {
          id v31 = [v21 (SEL)(v8 + 1816)];
          sub_243DFE910();

          v44[0] = 8236;
          v44[1] = 0xE200000000000000;
          sub_243DFE9E0();
          swift_bridgeObjectRelease();
          sub_243DFE9E0();
          swift_bridgeObjectRelease();
        }
        unsigned long long v34 = v50;
        unint64_t v33 = v34 >> 64;
        unint64_t v32 = v34;
        uint64_t v35 = sub_243DFE050();
        uint64_t v36 = swift_allocObject();
        *(_OWORD *)(v36 + 16) = v20;
        *(void *)(v36 + 32) = v21;
        long long v50 = v20;
        *(_OWORD *)uint64_t v51 = __PAIR128__(v33, v32);
        *(void *)&v51[16] = v35;
        unint64_t v52 = 0xD000000000000012;
        unint64_t v53 = 0x8000000243E1CC10;
        uint64_t v54 = 0x6E6F697461636F4CLL;
        *(void *)&long long v55 = 0xE800000000000000;
        *((void *)&v55 + 1) = a4;
        uint64_t v56 = v36;
      }
      else
      {
        sub_243AFD784(&v47, (uint64_t)v44);
        uint64_t v9 = v45;
        uint64_t v10 = v46;
        __swift_project_boxed_opaque_existential_1(v44, v45);
        (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v10 + 8))(&v50, v9, v10);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
      }
      uint64_t v11 = *((void *)&v50 + 1);
      uint64_t v39 = v50;
      uint64_t v12 = *(void *)v51;
      unint64_t v13 = v52;
      unint64_t v14 = v53;
      uint64_t v15 = v54;
      long long v40 = v55;
      long long v41 = *(_OWORD *)&v51[8];
      uint64_t v16 = v56;
      uint64_t v5 = v57;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_243D7AEF8(0, *(void *)(v5 + 16) + 1, 1);
        uint64_t v5 = v57;
      }
      unint64_t v18 = *(void *)(v5 + 16);
      unint64_t v17 = *(void *)(v5 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_243D7AEF8(v17 > 1, v18 + 1, 1);
        uint64_t v5 = v57;
      }
      *(void *)(v5 + 16) = v18 + 1;
      uint64_t v19 = v5 + 88 * v18;
      *(void *)(v19 + 32) = v39;
      *(void *)(v19 + 40) = v11;
      *(void *)(v19 + 48) = v12;
      *(_OWORD *)(v19 + 56) = v41;
      *(void *)(v19 + 72) = v13;
      *(void *)(v19 + 80) = v14;
      *(void *)(v19 + 88) = v15;
      *(_OWORD *)(v19 + 96) = v40;
      *(void *)(v19 + 112) = v16;
      uint64_t v7 = v42 + 48;
      int64_t v4 = v43 - 1;
      unint64_t v8 = 0x1F66C0000;
    }
    while (v43 != 1);
  }
  return v5;
}

uint64_t sub_243DD7254(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_243D7AED8(0, v1, 0);
    uint64_t v2 = v11;
    uint64_t v4 = *(void *)(sub_243DF93C0() - 8);
    uint64_t v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    do
    {
      __int16 v7 = sub_243DF93B0();
      unint64_t v9 = *(void *)(v11 + 16);
      unint64_t v8 = *(void *)(v11 + 24);
      if (v9 >= v8 >> 1) {
        sub_243D7AED8(v8 > 1, v9 + 1, 1);
      }
      *(void *)(v11 + 16) = v9 + 1;
      *(_WORD *)(v11 + 2 * v9 + 32) = v7;
      v5 += v6;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_243DD7380(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v31 = MEMORY[0x263F8EE78];
  sub_243D7AF18(0, v1, 0);
  uint64_t v2 = v31;
  uint64_t result = sub_243DDD840(a1);
  uint64_t v6 = result;
  uint64_t v7 = 0;
  uint64_t v8 = a1 + 64;
  int64_t v24 = v1;
  int v25 = v5;
  uint64_t v26 = a1 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v11 = (unint64_t)v6 >> 6;
    if ((*(void *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(a1 + 36) != v5) {
      goto LABEL_24;
    }
    uint64_t v27 = v7;
    uint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v6);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8 * v6);
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E21918);
    *(void *)&long long v28 = v13;
    *((void *)&v28 + 1) = v14;
    uint64_t v29 = v15;
    uint64_t v30 = v16;
    uint64_t v31 = v2;
    unint64_t v18 = *(void *)(v2 + 16);
    unint64_t v17 = *(void *)(v2 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v18 >= v17 >> 1)
    {
      sub_243D7AF18(v17 > 1, v18 + 1, 1);
      uint64_t v2 = v31;
    }
    *(void *)(v2 + 16) = v18 + 1;
    uint64_t result = (uint64_t)sub_243A6C1AC(&v28, (_OWORD *)(v2 + 32 * v18 + 32));
    int64_t v9 = 1 << *(unsigned char *)(a1 + 32);
    if (v6 >= v9) {
      goto LABEL_25;
    }
    uint64_t v8 = a1 + 64;
    uint64_t v19 = *(void *)(v26 + 8 * v11);
    if ((v19 & (1 << v6)) == 0) {
      goto LABEL_26;
    }
    int v5 = v25;
    if (*(_DWORD *)(a1 + 36) != v25) {
      goto LABEL_27;
    }
    unint64_t v20 = v19 & (-2 << (v6 & 0x3F));
    if (v20)
    {
      int64_t v9 = __clz(__rbit64(v20)) | v6 & 0xFFFFFFFFFFFFFFC0;
      int64_t v10 = v24;
    }
    else
    {
      unint64_t v21 = v11 + 1;
      unint64_t v22 = (unint64_t)(v9 + 63) >> 6;
      int64_t v10 = v24;
      if (v11 + 1 < v22)
      {
        unint64_t v23 = *(void *)(v26 + 8 * v21);
        if (v23)
        {
LABEL_20:
          int64_t v9 = __clz(__rbit64(v23)) + (v21 << 6);
        }
        else
        {
          while (v22 - 2 != v11)
          {
            unint64_t v23 = *(void *)(a1 + 80 + 8 * v11++);
            if (v23)
            {
              unint64_t v21 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    uint64_t v7 = v27 + 1;
    uint64_t v6 = v9;
    if (v27 + 1 == v10) {
      return v2;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_243DD75B4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243DFC390();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_243DD7628()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243DFC390();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_243DD769C(uint64_t a1, uint64_t a2)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243DFC390();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_243DFC3A0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243DFC390();
  swift_release();
  swift_release();
  if (v6 == a1 && v7 == a2) {
    return swift_bridgeObjectRelease_n();
  }
  char v5 = sub_243DFF3A0();
  swift_bridgeObjectRelease();
  if ((v5 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_243DFC3A0();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_243DD783C()
{
  return sub_243DDAC3C();
}

uint64_t sub_243DD7850()
{
  v1[9] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22DF8);
  v1[10] = v2;
  v1[11] = *(void *)(v2 - 8);
  v1[12] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22E00);
  v1[13] = v3;
  v1[14] = *(void *)(v3 - 8);
  v1[15] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22E08);
  v1[16] = v4;
  v1[17] = *(void *)(v4 - 8);
  v1[18] = swift_task_alloc();
  uint64_t v5 = sub_243DFC2D0();
  v1[19] = v5;
  v1[20] = *(void *)(v5 - 8);
  v1[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1ECC8);
  v1[22] = swift_task_alloc();
  uint64_t v6 = sub_243DFEE50();
  v1[23] = v6;
  v1[24] = *(void *)(v6 - 8);
  v1[25] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1ECD0);
  v1[26] = v7;
  v1[27] = *(void *)(v7 - 8);
  v1[28] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22E10);
  v1[29] = v8;
  v1[30] = *(void *)(v8 - 8);
  v1[31] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22E18);
  v1[32] = v9;
  v1[33] = *(void *)(v9 - 8);
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  v1[36] = sub_243DFEB80();
  v1[37] = sub_243DFEB70();
  uint64_t v11 = sub_243DFEB30();
  v1[38] = v11;
  v1[39] = v10;
  return MEMORY[0x270FA2498](sub_243DD7C24, v11, v10);
}

uint64_t sub_243DD7C24()
{
  uint64_t v21 = *(void *)(v0 + 280);
  uint64_t v25 = *(void *)(v0 + 272);
  uint64_t v23 = *(void *)(v0 + 264);
  uint64_t v24 = *(void *)(v0 + 256);
  uint64_t v26 = *(void *)(v0 + 248);
  uint64_t v22 = *(void *)(v0 + 240);
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 216);
  uint64_t v5 = *(void *)(v0 + 192);
  uint64_t v4 = *(void *)(v0 + 200);
  uint64_t v6 = *(void *)(v0 + 176);
  uint64_t v13 = *(void *)(v0 + 184);
  uint64_t v14 = *(void *)(v0 + 160);
  uint64_t v16 = *(void *)(v0 + 152);
  uint64_t v17 = *(void *)(v0 + 168);
  uint64_t v19 = *(void *)(v0 + 144);
  uint64_t v20 = *(void *)(v0 + 232);
  uint64_t v15 = *(void *)(v0 + 136);
  uint64_t v18 = *(void *)(v0 + 128);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1ECE8);
  sub_243DFC360();
  swift_endAccess();
  sub_243DFEE40();
  sub_243A8F888(0, (unint64_t *)&qword_268E20100);
  *(void *)(v0 + 56) = sub_243DFEE60();
  uint64_t v7 = sub_243DFEE30();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_243A569B0(&qword_268E1ECF8, &qword_268E1ECD0);
  sub_243DDE4F4();
  sub_243DFC410();
  sub_243A56808(v6, &qword_268E1ECC8);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v13);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v17, *MEMORY[0x263EFDAF0], v16);
  (*(void (**)(uint64_t, void, uint64_t))(v15 + 104))(v19, *MEMORY[0x263EFDB08], v18);
  sub_243A569B0(&qword_268E22E20, &qword_268E22E10);
  sub_243DFC400();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v19, v18);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v17, v16);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v26, v20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v25, v21, v24);
  uint64_t v8 = sub_243A569B0(&qword_268E22E28, &qword_268E22E18);
  MEMORY[0x245683EA0](v25, v24, v8);
  sub_243DFC300();
  *(void *)(v0 + 320) = sub_243DFEB70();
  uint64_t v9 = sub_243A569B0(&qword_268E22E30, &qword_268E22DF8);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 328) = v10;
  void *v10 = v0;
  v10[1] = sub_243DD8080;
  uint64_t v11 = *(void *)(v0 + 80);
  return MEMORY[0x270FA1E80](v0 + 40, v11, v9);
}

uint64_t sub_243DD8080()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 336) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 320);
  if (v0)
  {
    if (v3)
    {
      swift_getObjectType();
      uint64_t v4 = sub_243DFEB30();
      uint64_t v6 = v5;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v6 = 0;
    }
    uint64_t v7 = sub_243DD8694;
  }
  else
  {
    if (v3)
    {
      swift_getObjectType();
      uint64_t v4 = sub_243DFEB30();
      uint64_t v6 = v8;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v6 = 0;
    }
    uint64_t v7 = sub_243DD8218;
  }
  return MEMORY[0x270FA2498](v7, v4, v6);
}

uint64_t sub_243DD8218()
{
  swift_release();
  *(_OWORD *)(v0 + 344) = *(_OWORD *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 304);
  uint64_t v2 = *(void *)(v0 + 312);
  return MEMORY[0x270FA2498](sub_243DD8288, v1, v2);
}

uint64_t sub_243DD8288()
{
  uint64_t v1 = v0[44];
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[45] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_243DD8468;
    uint64_t v3 = v0[43];
    return sub_243DD8718(v3, v1);
  }
  else
  {
    uint64_t v5 = v0[35];
    uint64_t v6 = v0[32];
    uint64_t v7 = v0[33];
    uint64_t v9 = v0[14];
    uint64_t v8 = v0[15];
    uint64_t v10 = v0[12];
    uint64_t v11 = v0[13];
    uint64_t v13 = v0[10];
    uint64_t v12 = v0[11];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v13);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v11);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
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
    uint64_t v14 = (uint64_t (*)(void))v0[1];
    return v14();
  }
}

uint64_t sub_243DD8468()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v1 + 312);
  uint64_t v3 = *(void *)(v1 + 304);
  return MEMORY[0x270FA2498](sub_243DD85AC, v3, v2);
}

uint64_t sub_243DD85AC()
{
  v0[40] = sub_243DFEB70();
  uint64_t v1 = sub_243A569B0(&qword_268E22E30, &qword_268E22DF8);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[41] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_243DD8080;
  uint64_t v3 = v0[10];
  return MEMORY[0x270FA1E80](v0 + 5, v3, v1);
}

uint64_t sub_243DD8694()
{
  *(void *)(v0 + 64) = *(void *)(v0 + 336);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E200F0);
  uint64_t v1 = MEMORY[0x263F8E628];
  uint64_t v2 = swift_dynamicCast();
  uint64_t v3 = MEMORY[0x263F8E658];
  return MEMORY[0x270FA0678](v2, v1, v3);
}

uint64_t sub_243DD8718(uint64_t a1, uint64_t a2)
{
  v3[36] = a2;
  v3[37] = v2;
  v3[35] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E22DA8);
  v3[38] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E22DB0);
  v3[39] = swift_task_alloc();
  uint64_t v4 = sub_243DF93C0();
  v3[40] = v4;
  v3[41] = *(void *)(v4 - 8);
  v3[42] = swift_task_alloc();
  v3[43] = swift_task_alloc();
  v3[44] = swift_task_alloc();
  v3[45] = swift_task_alloc();
  v3[46] = swift_task_alloc();
  sub_243DFEB80();
  v3[47] = sub_243DFEB70();
  uint64_t v6 = sub_243DFEB30();
  v3[48] = v6;
  v3[49] = v5;
  return MEMORY[0x270FA2498](sub_243DD88A4, v6, v5);
}

uint64_t sub_243DD88A4()
{
  uint64_t v1 = OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel_previousSearchText;
  *(void *)(v0 + 400) = OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel_previousSearchText;
  unint64_t v2 = *(void *)(v0 + 288);
  uint64_t v3 = *(void *)(v0 + 296);
  uint64_t v4 = (void *)(v3 + v1);
  uint64_t v5 = *(void *)(v3 + v1 + 8);
  if (v5)
  {
    if (*v4 != *(void *)(v0 + 280) || v5 != v2)
    {
      if ((sub_243DFF3A0() & 1) == 0) {
        goto LABEL_13;
      }
      uint64_t v3 = *(void *)(v0 + 296);
    }
    uint64_t v7 = *(void *)(v3 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel_previousSearchTags);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    sub_243DFC390();
    swift_release();
    swift_release();
    uint64_t v8 = sub_243DD6F0C(*(void *)(v0 + 272), v0 + 232, (uint64_t)&unk_26F8F27F8, (uint64_t)&unk_268E1E2B8);
    swift_bridgeObjectRelease();
    if (v7)
    {
      uint64_t v9 = swift_bridgeObjectRetain();
      char v10 = sub_243B43DC4(v9, v8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      if (v10)
      {
        swift_release();
LABEL_21:
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
        return v23();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
LABEL_13:
  *(void *)(v0 + 408) = 0;
  *(void *)(v0 + 416) = v2;
  uint64_t v11 = *(void *)(v0 + 280) & 0xFFFFFFFFFFFFLL;
  if ((v2 & 0x2000000000000000) != 0) {
    uint64_t v11 = HIBYTE(v2) & 0xF;
  }
  uint64_t v12 = *(void *)(v0 + 296);
  if (!v11)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_243DFC390();
    swift_release();
    swift_release();
    uint64_t v13 = *(void *)(*(void *)(v0 + 256) + 16);
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v0 + 296);
    if (!v13)
    {
      swift_release();
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v22 = MEMORY[0x263F8EE78];
      *(void *)(v0 + 264) = MEMORY[0x263F8EE78];
      swift_retain();
      sub_243DFC3A0();
      swift_getKeyPath();
      swift_getKeyPath();
      *(unsigned char *)(v0 + 57) = 0;
      swift_retain();
      sub_243DFC3A0();
      *(_OWORD *)uint64_t v4 = xmmword_243E16230;
      swift_bridgeObjectRelease();
      *(void *)(v12 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel_previousSearchTags) = v22;
      swift_bridgeObjectRelease();
      goto LABEL_21;
    }
  }
  uint64_t v14 = v12 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel_tokenManager;
  uint64_t v15 = *(void *)(v12 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel_tokenManager);
  *(void *)(v0 + 424) = v15;
  uint64_t v16 = *(void *)(v14 + 8);
  *(void *)(v0 + 432) = v16;
  uint64_t v17 = *(void *)(v14 + 16);
  *(void *)(v0 + 440) = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 448) = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_243DD8C90;
  uint64_t v20 = *(void *)(v0 + 280);
  uint64_t v19 = *(void *)(v0 + 288);
  return sub_243C56984(v20, v19, v15, v16, v17);
}

uint64_t sub_243DD8C90(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 456) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v2 + 392);
  uint64_t v4 = *(void *)(v2 + 384);
  return MEMORY[0x270FA2498](sub_243DD8E1C, v4, v3);
}

uint64_t sub_243DD8E1C()
{
  uint64_t v1 = *(void *)(v0 + 456);
  uint64_t v2 = *(void *)(v0 + 416);
  uint64_t v3 = *(void *)(v0 + 400);
  uint64_t v4 = *(void *)(v0 + 296);
  uint64_t v5 = *(void *)(v0 + 280);
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)(v0 + 248) = v1;
  uint64_t v6 = (void *)(v4 + v3);
  swift_retain();
  sub_243DFC3A0();
  *uint64_t v6 = v5;
  v6[1] = v2;
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_243DFC390();
  swift_release();
  swift_release();
  uint64_t v7 = sub_243DD6F0C(*(void *)(v0 + 240), v0 + 200, (uint64_t)&unk_26F8F2870, (uint64_t)&unk_268E22DE8);
  swift_bridgeObjectRelease();
  *(void *)(v4 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel_previousSearchTags) = v7;
  swift_bridgeObjectRelease();
  if (qword_268E180E0 != -1) {
    goto LABEL_61;
  }
  while (1)
  {
    uint64_t v8 = *(void *)(v0 + 288);
    uint64_t v9 = *(void *)(v0 + 280);
    swift_bridgeObjectRetain();
    uint64_t v10 = swift_bridgeObjectRetain();
    uint64_t v11 = sub_243DDD8C8(v10, v9, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_243DFC390();
    swift_release();
    swift_release();
    uint64_t v12 = *(void *)(v0 + 192);
    uint64_t v13 = *(void *)(v12 + 16);
    if (v13)
    {
      uint64_t v14 = (long long *)(v0 + 16);
      uint64_t v15 = v0 + 64;
      uint64_t v106 = (long long *)(v0 + 152);
      uint64_t v16 = *(void *)(v0 + 328);
      uint64_t v17 = v12 + 32;
      long long v101 = (void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
      uint64_t v111 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
      uint64_t v113 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56);
      uint64_t v104 = v16;
      uint64_t v109 = (void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32);
      swift_bridgeObjectRetain();
      unint64_t v18 = MEMORY[0x263F8EE78];
      do
      {
        sub_243C57BD4(v17, v15);
        sub_243C57BD4(v15, (uint64_t)v14);
        if (*(unsigned char *)(v0 + 56) == 1)
        {
          unint64_t v19 = v18;
          uint64_t v20 = v11;
          sub_243AFD784(v14, (uint64_t)v106);
          sub_243AFD784(v106, v0 + 112);
          __swift_instantiateConcreteTypeFromMangledName(&qword_268E22DD0);
          uint64_t v21 = type metadata accessor for TransactionTypeTokenProvider();
          char v22 = swift_dynamicCast();
          uint64_t v23 = *(void (**)(void, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
          uint64_t v25 = *(void *)(v0 + 312);
          uint64_t v24 = *(void *)(v0 + 320);
          uint64_t v26 = *(void *)(v0 + 304);
          if (v22)
          {
            v23(*(void *)(v0 + 304), 0, 1, v21);
            (*v101)(v25, v26 + *(int *)(v21 + 20), v24);
            sub_243D32BD0(v26);
            (*v113)(v25, 0, 1, v24);
          }
          else
          {
            v23(*(void *)(v0 + 304), 1, 1, v21);
            sub_243A56808(v26, &qword_268E22DA8);
            (*v113)(v25, 1, 1, v24);
          }
          uint64_t v11 = v20;
          unint64_t v18 = v19;
        }
        else
        {
          (*v113)(*(void *)(v0 + 312), 1, 1, *(void *)(v0 + 320));
          sub_243DDE2EC((uint64_t)v14);
        }
        uint64_t v28 = *(void *)(v0 + 312);
        uint64_t v27 = *(void *)(v0 + 320);
        sub_243DDE2EC(v15);
        if ((*v111)(v28, 1, v27) == 1)
        {
          sub_243A56808(*(void *)(v0 + 312), &qword_268E22DB0);
        }
        else
        {
          uint64_t v30 = *(void *)(v0 + 360);
          uint64_t v29 = *(void *)(v0 + 368);
          unint64_t v31 = v18;
          uint64_t v32 = *(void *)(v0 + 320);
          unint64_t v33 = *v109;
          (*v109)(v29, *(void *)(v0 + 312), v32);
          uint64_t v34 = v32;
          unint64_t v18 = v31;
          v33(v30, v29, v34);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v18 = sub_243AA71A8(0, *(void *)(v31 + 16) + 1, 1, v31);
          }
          unint64_t v36 = *(void *)(v18 + 16);
          unint64_t v35 = *(void *)(v18 + 24);
          if (v36 >= v35 >> 1) {
            unint64_t v18 = sub_243AA71A8(v35 > 1, v36 + 1, 1, v18);
          }
          uint64_t v15 = v0 + 64;
          uint64_t v37 = *(void *)(v0 + 360);
          uint64_t v38 = *(void *)(v0 + 320);
          *(void *)(v18 + 16) = v36 + 1;
          v33(v18+ ((*(unsigned __int8 *)(v104 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v104 + 80))+ *(void *)(v104 + 72) * v36, v37, v38);
        }
        v17 += 48;
        --v13;
        uint64_t v14 = (long long *)(v0 + 16);
      }
      while (v13);
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v18 = MEMORY[0x263F8EE78];
    }
    uint64_t v39 = MEMORY[0x263F8EE78];
    if (!*(void *)(v18 + 16)) {
      break;
    }
    uint64_t v118 = MEMORY[0x263F8EE78];
    uint64_t v40 = *(void *)(v11 + 16);
    swift_bridgeObjectRetain();
    uint64_t v105 = v40;
    if (!v40)
    {
LABEL_48:
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      uint64_t v100 = v39;
      goto LABEL_50;
    }
    unint64_t v41 = 0;
    uint64_t v42 = *(void *)(v0 + 328);
    uint64_t v103 = v42;
    unint64_t v97 = v18;
    uint64_t v98 = (void (**)(unint64_t, uint64_t, uint64_t))(v42 + 32);
    uint64_t v114 = (void (**)(uint64_t, uint64_t))(v42 + 8);
    uint64_t v99 = v11;
    while (1)
    {
      if (v41 >= *(void *)(v11 + 16))
      {
        __break(1u);
        goto LABEL_60;
      }
      unint64_t v44 = (*(unsigned __int8 *)(v103 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80);
      uint64_t v117 = *(void *)(v103 + 72);
      uint64_t v45 = *(void (**)(void, unint64_t, void))(v103 + 16);
      v45(*(void *)(v0 + 352), v11 + v44 + v117 * v41, *(void *)(v0 + 320));
      uint64_t v46 = *(void *)(v18 + 16);
      if (v46) {
        break;
      }
      int64_t v43 = *v114;
LABEL_24:
      v43(*(void *)(v0 + 352), *(void *)(v0 + 320));
LABEL_25:
      if (++v41 == v105) {
        goto LABEL_48;
      }
    }
    uint64_t v108 = v39;
    uint64_t v47 = *(void *)(v0 + 344);
    unint64_t v107 = v44;
    unint64_t v48 = v18 + v44;
    uint64_t v49 = *(void *)(v0 + 320);
    v45(v47, v48, v49);
    sub_243D31D0C();
    swift_bridgeObjectRetain();
    char v50 = sub_243DFE870();
    uint64_t v51 = v47;
    int64_t v43 = *v114;
    (*v114)(v51, v49);
    if (v50)
    {
LABEL_29:
      swift_bridgeObjectRelease();
      uint64_t v11 = v99;
LABEL_30:
      unint64_t v52 = *v98;
      (*v98)(*(void *)(v0 + 336), *(void *)(v0 + 352), *(void *)(v0 + 320));
      uint64_t v39 = v108;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_243D7AE60(0, *(void *)(v108 + 16) + 1, 1);
        uint64_t v39 = v118;
      }
      unint64_t v54 = *(void *)(v39 + 16);
      unint64_t v53 = *(void *)(v39 + 24);
      if (v54 >= v53 >> 1)
      {
        sub_243D7AE60(v53 > 1, v54 + 1, 1);
        uint64_t v39 = v118;
      }
      uint64_t v55 = *(void *)(v0 + 336);
      uint64_t v56 = *(void *)(v0 + 320);
      *(void *)(v39 + 16) = v54 + 1;
      v52(v39 + v107 + v54 * v117, v55, v56);
      uint64_t v118 = v39;
      unint64_t v18 = v97;
      goto LABEL_25;
    }
    uint64_t v11 = v99;
    if (v46 == 1)
    {
      unint64_t v18 = v97;
      swift_bridgeObjectRelease();
LABEL_37:
      uint64_t v39 = v108;
      goto LABEL_24;
    }
    long long v102 = v43;
    uint64_t v57 = *(void *)(v0 + 344);
    unint64_t v58 = v48 + v117;
    uint64_t v59 = *(void *)(v0 + 320);
    v45(v57, v58, v59);
    char v60 = sub_243DFE870();
    uint64_t v61 = v57;
    int64_t v43 = v102;
    v102(v61, v59);
    if (v60)
    {
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
    unint64_t v18 = v97;
    if (v46 == 2)
    {
      swift_bridgeObjectRelease();
      goto LABEL_37;
    }
    unint64_t v62 = v97 + v44 + 2 * v117;
    uint64_t v63 = 2;
    while (1)
    {
      v45(*(void *)(v0 + 344), v62, *(void *)(v0 + 320));
      uint64_t v64 = v63 + 1;
      if (__OFADD__(v63, 1)) {
        break;
      }
      uint64_t v65 = *(void *)(v0 + 344);
      uint64_t v66 = *(void *)(v0 + 320);
      char v67 = sub_243DFE870();
      uint64_t v68 = v65;
      int64_t v43 = v102;
      v102(v68, v66);
      if (v67) {
        goto LABEL_29;
      }
      ++v63;
      v62 += v117;
      if (v64 == v46)
      {
        unint64_t v18 = v97;
        swift_bridgeObjectRelease();
        uint64_t v11 = v99;
        goto LABEL_37;
      }
    }
LABEL_60:
    __break(1u);
LABEL_61:
    swift_once();
  }
  swift_bridgeObjectRelease();
  uint64_t v100 = v11;
LABEL_50:
  unint64_t v69 = *(void *)(v0 + 416);
  if ((v69 & 0x2000000000000000) != 0) {
    uint64_t v70 = HIBYTE(v69) & 0xF;
  }
  else {
    uint64_t v70 = *(void *)(v0 + 280) & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v115 = v70;
  *(void *)(v0 + 464) = sub_243A8F888(0, (unint64_t *)&qword_268E200D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18460);
  uint64_t v71 = swift_allocObject();
  *(_OWORD *)(v71 + 16) = xmmword_243E01820;
  uint64_t v72 = MEMORY[0x263F8D310];
  *(void *)(v71 + 56) = MEMORY[0x263F8D310];
  unint64_t v73 = sub_243A63954();
  *(void *)(v71 + 64) = v73;
  *(void *)(v71 + 32) = 0;
  *(void *)(v71 + 40) = 0xE000000000000000;
  uint64_t v74 = (void *)sub_243DFED60();
  *(void *)(v0 + 472) = v74;
  *(void *)(v0 + 480) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E227B0);
  uint64_t v75 = swift_allocObject();
  *(_OWORD *)(v75 + 16) = xmmword_243E01810;
  uint64_t v76 = swift_allocObject();
  *(_OWORD *)(v76 + 16) = xmmword_243E01820;
  *(void *)(v76 + 56) = v72;
  *(void *)(v76 + 64) = v73;
  unint64_t v110 = v73;
  *(void *)(v76 + 32) = 0;
  *(void *)(v76 + 40) = 0xE000000000000000;
  *(void *)(v75 + 32) = sub_243DFED60();
  *(void *)(v75 + 40) = v74;
  uint64_t v77 = swift_allocObject();
  *(_OWORD *)(v77 + 16) = xmmword_243E01820;
  id v78 = v74;
  uint64_t v79 = sub_243DD7254(v100);
  swift_bridgeObjectRelease();
  *(void *)(v77 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22DB8);
  *(void *)(v77 + 64) = sub_243A569B0(&qword_268E22DC0, &qword_268E22DB8);
  *(void *)(v77 + 32) = v79;
  *(void *)(v75 + 48) = sub_243DFED60();
  sub_243DFEAF0();
  uint64_t v80 = (void *)sub_243DFEAD0();
  swift_bridgeObjectRelease();
  uint64_t v81 = self;
  *(void *)(v0 + 488) = v81;
  id v82 = objc_msgSend(v81, sel_andPredicateWithSubpredicates_, v80);
  *(void *)(v0 + 496) = v82;

  if (v115)
  {
    uint64_t v112 = v78;
    uint64_t v83 = *(void *)(v0 + 280);
    uint64_t v84 = *(void *)(v0 + 288);
    uint64_t v85 = swift_allocObject();
    *(_OWORD *)(v85 + 16) = xmmword_243E01810;
    uint64_t v86 = swift_allocObject();
    uint64_t v116 = v82;
    *(_OWORD *)(v86 + 16) = xmmword_243E01820;
    *(void *)(v86 + 56) = MEMORY[0x263F8D310];
    *(void *)(v86 + 64) = v110;
    *(void *)(v86 + 32) = v83;
    *(void *)(v86 + 40) = v84;
    swift_bridgeObjectRetain();
    *(void *)(v85 + 32) = sub_243DFED60();
    uint64_t v87 = swift_allocObject();
    *(_OWORD *)(v87 + 16) = xmmword_243E099B0;
    *(void *)(v87 + 32) = v112;
    uint64_t v88 = swift_allocObject();
    *(_OWORD *)(v88 + 16) = xmmword_243E01820;
    *(void *)(v88 + 56) = MEMORY[0x263F8D310];
    *(void *)(v88 + 64) = v110;
    *(void *)(v88 + 32) = v83;
    *(void *)(v88 + 40) = v84;
    swift_bridgeObjectRetain();
    id v89 = v112;
    *(void *)(v87 + 40) = sub_243DFED60();
    sub_243DFEAF0();
    uint64_t v90 = (void *)sub_243DFEAD0();
    swift_bridgeObjectRelease();
    id v91 = objc_msgSend(v81, sel_andPredicateWithSubpredicates_, v90);

    *(void *)(v85 + 40) = v91;
    *(void *)(v85 + 48) = v116;
    sub_243DFEAF0();
    id v92 = v116;
    uint64_t v93 = (void *)sub_243DFEAD0();
    swift_bridgeObjectRelease();
    id v94 = objc_msgSend(v81, sel_orPredicateWithSubpredicates_, v93);
  }
  else
  {
    id v94 = objc_msgSend(self, sel_predicateWithValue_, 1);
  }
  *(void *)(v0 + 504) = v94;
  *(void *)(v0 + 216) = MEMORY[0x263F8EE78];
  uint64_t v95 = (void *)swift_task_alloc();
  *(void *)(v0 + 512) = v95;
  *uint64_t v95 = v0;
  v95[1] = sub_243DD9BEC;
  return sub_243DDB4C0(v0 + 216);
}

uint64_t sub_243DD9BEC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 392);
  uint64_t v3 = *(void *)(v1 + 384);
  return MEMORY[0x270FA2498](sub_243DD9D0C, v3, v2);
}

uint64_t sub_243DD9D0C()
{
  uint64_t v1 = *(void **)(v0 + 504);
  uint64_t v15 = *(void **)(v0 + 496);
  uint64_t v2 = *(void **)(v0 + 488);
  uint64_t v3 = *(void **)(v0 + 472);
  uint64_t v4 = *(void *)(v0 + 296);
  swift_release();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_243E01810;
  uint64_t v6 = *(void **)(v4 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel_basePredicate);
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v1;
  id v7 = v6;
  id v8 = v1;
  uint64_t v9 = (void *)sub_243DFEAD0();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v2, sel_andPredicateWithSubpredicates_, v9);

  *(void *)(v5 + 48) = v10;
  sub_243DFEAF0();
  uint64_t v11 = (void *)sub_243DFEAD0();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v2, sel_andPredicateWithSubpredicates_, v11);

  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)(v0 + 224) = v12;
  swift_retain();
  sub_243DFC3A0();
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 58) = 1;
  swift_retain();
  sub_243DFC3A0();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_243DD9F48(uint64_t a1)
{
  uint64_t v61 = sub_243DF92F0();
  uint64_t v3 = *(void *)(v61 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v61);
  uint64_t v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  char v60 = (char *)&v51 - v7;
  int64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v62 = a1;
  uint64_t v63 = v3;
  if (v8)
  {
    uint64_t v56 = v1;
    uint64_t v66 = MEMORY[0x263F8EE78];
    sub_243D7AF18(0, v8, 0);
    int64_t v10 = sub_243DDD6BC(a1);
    int v12 = v11;
    char v14 = v13 & 1;
    uint64_t v58 = v3 + 16;
    uint64_t v59 = a1 + 56;
    uint64_t v57 = v3 + 32;
    while ((v10 & 0x8000000000000000) == 0 && v10 < 1 << *(unsigned char *)(a1 + 32))
    {
      if (((*(void *)(v59 + (((unint64_t)v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_30;
      }
      if (*(_DWORD *)(a1 + 36) != v12) {
        goto LABEL_31;
      }
      uint64_t v15 = v63;
      int64_t v16 = *(void *)(a1 + 48) + *(void *)(v63 + 72) * v10;
      uint64_t v17 = v60;
      uint64_t v18 = v61;
      (*(void (**)(char *, int64_t, uint64_t))(v63 + 16))(v60, v16, v61);
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v6, v17, v18);
      uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22D98);
      unint64_t v19 = (uint64_t *)((char *)__swift_allocate_boxed_opaque_existential_1((uint64_t *)&v64) + *(int *)(v65 + 48));
      sub_243DF92B0();
      *unint64_t v19 = sub_243DF9220();
      v19[1] = v20;
      (*(void (**)(char *, uint64_t))(v15 + 8))(v6, v18);
      uint64_t v9 = v66;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_243D7AF18(0, *(void *)(v9 + 16) + 1, 1);
        uint64_t v9 = v66;
      }
      unint64_t v22 = *(void *)(v9 + 16);
      unint64_t v21 = *(void *)(v9 + 24);
      if (v22 >= v21 >> 1)
      {
        sub_243D7AF18(v21 > 1, v22 + 1, 1);
        uint64_t v9 = v66;
      }
      *(void *)(v9 + 16) = v22 + 1;
      sub_243A6C1AC(&v64, (_OWORD *)(v9 + 32 * v22 + 32));
      a1 = v62;
      int64_t v23 = sub_243DDD75C(v10, v12, v14 & 1, v62);
      int64_t v10 = v23;
      int v12 = v24;
      char v14 = v25 & 1;
      if (!--v8)
      {
        sub_243AB1434(v23, v24, v25 & 1);
        uint64_t v1 = v56;
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
  }
  else
  {
LABEL_13:
    uint64_t v26 = v1 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel_tokenManager;
    *(void *)(v1 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel_tokenManager + 16) = v9;
    swift_bridgeObjectRelease();
    int64_t v27 = *(void *)(a1 + 16);
    uint64_t v28 = MEMORY[0x263F8EE78];
    if (!v27)
    {
LABEL_25:
      if (*(void *)(v28 + 16))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_268E18838);
        uint64_t v48 = sub_243DFF2F0();
      }
      else
      {
        uint64_t v48 = MEMORY[0x263F8EE80];
      }
      *(void *)&long long v64 = v48;
      sub_243DDE000(v28, 1, &v64);
      swift_bridgeObjectRelease();
      uint64_t v49 = sub_243DD7380(v64);
      swift_release();
      *(void *)(v26 + 8) = v49;
      return swift_bridgeObjectRelease();
    }
    uint64_t v52 = v26;
    *(void *)&long long v64 = MEMORY[0x263F8EE78];
    sub_243D7AF38(0, v27, 0);
    int64_t v29 = sub_243DDD6BC(a1);
    int v31 = v30;
    char v33 = v32 & 1;
    uint64_t v56 = v63 + 16;
    uint64_t v57 = a1 + 56;
    uint64_t v54 = v63 + 8;
    uint64_t v55 = v63 + 32;
    long long v53 = xmmword_243E01820;
    while ((v29 & 0x8000000000000000) == 0 && v29 < 1 << *(unsigned char *)(a1 + 32))
    {
      if (((*(void *)(v57 + (((unint64_t)v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v29) & 1) == 0) {
        goto LABEL_33;
      }
      if (*(_DWORD *)(a1 + 36) != v31) {
        goto LABEL_34;
      }
      uint64_t v34 = v63;
      int64_t v35 = *(void *)(a1 + 48) + *(void *)(v63 + 72) * v29;
      unint64_t v36 = v60;
      uint64_t v37 = v61;
      (*(void (**)(char *, int64_t, uint64_t))(v63 + 16))(v60, v35, v61);
      (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v6, v36, v37);
      uint64_t v38 = sub_243DF9260();
      uint64_t v58 = v39;
      uint64_t v59 = v38;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268E19968);
      sub_243DFBEF0();
      uint64_t v40 = swift_allocObject();
      *(_OWORD *)(v40 + 16) = v53;
      sub_243DF92B0();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v37);
      uint64_t v28 = v64;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_243D7AF38(0, *(void *)(v28 + 16) + 1, 1);
        uint64_t v28 = v64;
      }
      unint64_t v42 = *(void *)(v28 + 16);
      unint64_t v41 = *(void *)(v28 + 24);
      if (v42 >= v41 >> 1)
      {
        sub_243D7AF38(v41 > 1, v42 + 1, 1);
        uint64_t v28 = v64;
      }
      *(void *)(v28 + 16) = v42 + 1;
      int64_t v43 = (void *)(v28 + 24 * v42);
      uint64_t v44 = v58;
      v43[4] = v59;
      v43[5] = v44;
      v43[6] = v40;
      a1 = v62;
      int64_t v45 = sub_243DDD75C(v29, v31, v33 & 1, v62);
      int64_t v29 = v45;
      int v31 = v46;
      char v33 = v47 & 1;
      if (!--v27)
      {
        sub_243AB1434(v45, v46, v47 & 1);
        uint64_t v26 = v52;
        goto LABEL_25;
      }
    }
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_243DDA534(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = sub_243AA6B48(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(sub_243DF92F0() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = v3 + v13 + v12 * v9;
  unint64_t v15 = a1 + v13;
  uint64_t v16 = v12 * v8;
  unint64_t v17 = v14 + v16;
  unint64_t v18 = v15 + v16;
  if (v15 < v17 && v14 < v18) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFADD__(v20, v8);
  uint64_t v22 = v20 + v8;
  if (!v21)
  {
    *(void *)(v3 + 16) = v22;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_243DFF300();
  __break(1u);
  return result;
}

uint64_t sub_243DDA6E4(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  unint64_t v3 = sub_243AA6F74(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[6 * v9 + 4];
  if (a1 + 32 < v10 + 48 * v8 && v10 < a1 + 32 + 48 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_243DFF300();
  __break(1u);
  return result;
}

uint64_t sub_243DDA844(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_243DFF2B0();
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
    uint64_t v5 = sub_243DFF2B0();
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
    unint64_t v4 = MEMORY[0x245686DA0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_243D4759C(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_243DFF2B0();
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

  return sub_243DFEAF0();
}

uint64_t sub_243DDAA10(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v22 = v4 + v2;
  }
  else {
    int64_t v22 = v4;
  }
  unint64_t v3 = sub_243AA772C(isUniquelyReferenced_nonNull_native, v22, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = *(void *)(sub_243DFBEF0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = v3 + v12 + v11 * v8;
  unint64_t v14 = a1 + v12;
  uint64_t v15 = v11 * v2;
  unint64_t v16 = v13 + v15;
  unint64_t v17 = v14 + v15;
  if (v14 < v16 && v13 < v17) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFADD__(v19, v2);
  uint64_t v21 = v19 + v2;
  if (!v20)
  {
    *(void *)(v3 + 16) = v21;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_243DFF300();
  __break(1u);
  return result;
}

uint64_t sub_243DDABB4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243DFC390();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_243DDAC28()
{
  return sub_243DDAC3C();
}

uint64_t sub_243DDAC3C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243DFC390();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_243DDACA8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243DFC390();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_243DDAD1C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243DFC390();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_243DDAD9C()
{
  return sub_243DFC3A0();
}

uint64_t sub_243DDAE18@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243DFC390();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_243DDAE98(void **a1)
{
  unsigned __int8 v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return sub_243DFC3A0();
}

uint64_t sub_243DDAF10@<X0>(unsigned char *a1@<X8>)
{
  return sub_243DDAF4C(a1);
}

uint64_t sub_243DDAF24()
{
  return sub_243C0567C();
}

uint64_t sub_243DDAF38@<X0>(unsigned char *a1@<X8>)
{
  return sub_243DDAF4C(a1);
}

uint64_t sub_243DDAF4C@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243DFC390();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_243DDAFC8()
{
  return sub_243C0567C();
}

uint64_t sub_243DDAFDC()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22E48);
  uint64_t v40 = *(void *)(v2 - 8);
  uint64_t v41 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v39 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18C90);
  uint64_t v37 = *(void *)(v4 - 8);
  uint64_t v38 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v36 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22E40);
  uint64_t v6 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22E38);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1ECE8);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = v1 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel__searchText;
  uint64_t v42 = 0;
  unint64_t v43 = 0xE000000000000000;
  sub_243DFC350();
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v17, v16, v13);
  uint64_t v18 = v1 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel__searchTags;
  uint64_t v19 = MEMORY[0x263F8EE78];
  uint64_t v42 = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E19E30);
  sub_243DFC350();
  BOOL v20 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 32);
  v20(v18, v12, v9);
  uint64_t v21 = v1 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel__searchSuggestions;
  uint64_t v42 = v19;
  sub_243DFC350();
  v20(v21, v12, v9);
  uint64_t v22 = v1 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel__searchPredicate;
  uint64_t v42 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E22D80);
  sub_243DFC350();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v22, v8, v35);
  uint64_t v23 = v1 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel__searchSubmitted;
  LOBYTE(v42) = 0;
  uint64_t v24 = v36;
  sub_243DFC350();
  (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v23, v24, v38);
  uint64_t v25 = v1 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel__state;
  LOBYTE(v42) = 0;
  uint64_t v26 = v39;
  sub_243DFC350();
  (*(void (**)(uint64_t, char *, uint64_t))(v40 + 32))(v25, v26, v41);
  int64_t v27 = (uint64_t *)(v1 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel_tokenManager);
  *int64_t v27 = sub_243C56E8C();
  v27[1] = v28;
  v27[2] = v29;
  if ((v19 & 0xC000000000000000) != 0 && sub_243DFF2B0()) {
    unint64_t v30 = sub_243D357E8(MEMORY[0x263F8EE78]);
  }
  else {
    unint64_t v30 = MEMORY[0x263F8EE88];
  }
  *(void *)(v1 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel_cancellableSet) = v30;
  uint64_t v31 = OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel_basePredicate;
  sub_243DFA970();
  *(void *)(v1 + v31) = MEMORY[0x2456824C0]();
  *(void *)(v1 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel_previousSearchTags) = 0;
  char v32 = (void *)(v1 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel_previousSearchText);
  *char v32 = 0;
  v32[1] = 0;
  return v1;
}

uint64_t sub_243DDB4C0(uint64_t a1)
{
  v2[52] = a1;
  v2[53] = v1;
  sub_243DFEB80();
  v2[54] = sub_243DFEB70();
  uint64_t v4 = sub_243DFEB30();
  v2[55] = v4;
  v2[56] = v3;
  return MEMORY[0x270FA2498](sub_243DDB558, v4, v3);
}

uint64_t sub_243DDB558()
{
  uint64_t v54 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243DFC390();
  swift_release();
  swift_release();
  sub_243DDDB90(*(void *)(v0 + 400));
  swift_bridgeObjectRelease();
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_243D474A4(v1);
  swift_bridgeObjectRelease();
  long long v53 = v2;
  sub_243DDCB68(&v53);
  swift_bridgeObjectRelease();
  uint64_t v3 = v53;
  *(void *)(v0 + 456) = v53;
  uint64_t v4 = v3[2];
  *(void *)(v0 + 464) = v4;
  if (!v4)
  {
LABEL_20:
    swift_release();
    swift_release();
    uint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
    return v29();
  }
  unint64_t v5 = 0;
  uint64_t v51 = (long long *)(v0 + 104);
  uint64_t v50 = v0 + 152;
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v7 = (unint64_t *)&qword_268E200D0;
  unint64_t v8 = 0x263F08000uLL;
  uint64_t v9 = (SEL *)&block_descriptor;
  while (1)
  {
    *(void *)(v0 + 472) = v5;
    uint64_t v13 = *(void *)(v0 + 456);
    if (v5 >= *(void *)(v13 + 16))
    {
      __break(1u);
      JUMPOUT(0x243DDBC64);
    }
    uint64_t v14 = *(void *)(v13 + 24 * v5 + 48);
    *(void *)(v0 + 480) = v14;
    uint64_t v15 = *(void *)(v14 + 16);
    *(void *)(v0 + 488) = v15;
    if (v15) {
      break;
    }
    uint64_t v16 = *(void *)(v6 + 16);
    if (!v16)
    {
      swift_bridgeObjectRelease();
LABEL_4:
      uint64_t v10 = *(void **)(v0 + 416);
      sub_243A8F888(0, v7);
      uint64_t v11 = (void *)sub_243DFEAD0();
      swift_bridgeObjectRelease();
      id v12 = objc_msgSend(self, v9[502], v11);

      MEMORY[0x245686650]();
      if (*(void *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_243DFEB00();
      }
      sub_243DFEB20();
      sub_243DFEAF0();
      goto LABEL_7;
    }
    if (v16 != 1)
    {
      unint64_t v20 = v8;
      uint64_t v21 = v7;
      *(void *)(v0 + 392) = v6;
      swift_bridgeObjectRetain();
      sub_243DFF250();
      uint64_t v22 = (void **)(v6 + 32);
      do
      {
        uint64_t v23 = *v22++;
        id v24 = v23;
        sub_243DFF230();
        sub_243DFF260();
        sub_243DFF270();
        sub_243DFF240();
        --v16;
      }
      while (v16);
      swift_bridgeObjectRelease_n();
      uint64_t v7 = v21;
      unint64_t v8 = v20;
      uint64_t v9 = (SEL *)&block_descriptor;
      goto LABEL_4;
    }
    uint64_t v17 = *(void **)(v0 + 416);
    id v18 = *(id *)(v6 + 32);
    swift_bridgeObjectRelease();
    id v19 = v18;
    MEMORY[0x245686650]();
    if (*(void *)((*v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v17 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_243DFEB00();
    }
    sub_243DFEB20();
    sub_243DFEAF0();

LABEL_7:
    unint64_t v5 = *(void *)(v0 + 472) + 1;
    if (v5 == *(void *)(v0 + 464)) {
      goto LABEL_20;
    }
  }
  *(void *)(v0 + 496) = 0;
  *(void *)(v0 + 504) = v6;
  uint64_t v25 = v14 + 32;
  swift_bridgeObjectRetain();
  sub_243C57BD4(v25, v50);
  sub_243C57BD4(v50, (uint64_t)v51);
  switch(*(unsigned char *)(v0 + 144))
  {
    case 1:
      uint64_t v26 = (void *)(v0 + 280);
      sub_243AFD784(v51, v0 + 280);
      uint64_t v27 = *(void *)(v0 + 304);
      uint64_t v28 = *(void *)(v0 + 312);
      goto LABEL_26;
    case 2:
      uint64_t v26 = (void *)(v0 + 320);
      sub_243AFD784(v51, v0 + 320);
      uint64_t v27 = *(void *)(v0 + 344);
      uint64_t v28 = *(void *)(v0 + 352);
      goto LABEL_26;
    case 3:
      uint64_t v26 = (void *)(v0 + 240);
      sub_243AFD784(v51, v0 + 240);
      uint64_t v27 = *(void *)(v0 + 264);
      uint64_t v28 = *(void *)(v0 + 272);
      goto LABEL_26;
    case 4:
      uint64_t v32 = *(void *)(v0 + 104);
      uint64_t v31 = *(void *)(v0 + 112);
      char v33 = *(void **)(v0 + 120);
      swift_bridgeObjectRetain();
      id v34 = objc_msgSend(v33, sel_title);
      uint64_t v35 = sub_243DFE910();
      uint64_t v37 = v36;

      *(void *)(v0 + 376) = v35;
      *(void *)(v0 + 384) = v37;
      id v38 = objc_msgSend(v33, sel_subtitle);
      uint64_t v39 = sub_243DFE910();
      unint64_t v41 = v40;

      swift_bridgeObjectRelease();
      uint64_t v42 = HIBYTE(v41) & 0xF;
      if ((v41 & 0x2000000000000000) == 0) {
        uint64_t v42 = v39 & 0xFFFFFFFFFFFFLL;
      }
      if (v42)
      {
        id v43 = objc_msgSend(v33, sel_subtitle);
        sub_243DFE910();

        *(void *)(v0 + 360) = 8236;
        *(void *)(v0 + 368) = 0xE200000000000000;
        sub_243DFE9E0();
        swift_bridgeObjectRelease();
        sub_243DFE9E0();
        swift_bridgeObjectRelease();
      }
      uint64_t v44 = *(void *)(v0 + 376);
      uint64_t v45 = *(void *)(v0 + 384);
      uint64_t v46 = sub_243DFE050();
      char v47 = (void *)swift_allocObject();
      void v47[2] = v32;
      v47[3] = v31;
      v47[4] = v33;
      *(void *)(v0 + 16) = v32;
      *(void *)(v0 + 24) = v31;
      *(void *)(v0 + 32) = v44;
      *(void *)(v0 + 40) = v45;
      *(void *)(v0 + 48) = v46;
      *(void *)(v0 + 56) = 0xD000000000000012;
      *(void *)(v0 + 64) = 0x8000000243E1CC10;
      *(void *)(v0 + 72) = 0x6E6F697461636F4CLL;
      *(void *)(v0 + 80) = 0xE800000000000000;
      *(void *)(v0 + 88) = &unk_268E22DD8;
      *(void *)(v0 + 96) = v47;
      goto LABEL_32;
    default:
      uint64_t v26 = (void *)(v0 + 200);
      sub_243AFD784(v51, v0 + 200);
      uint64_t v27 = *(void *)(v0 + 224);
      uint64_t v28 = *(void *)(v0 + 232);
LABEL_26:
      __swift_project_boxed_opaque_existential_1(v26, v27);
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v28);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
LABEL_32:
      uint64_t v48 = *(int **)(v0 + 88);
      *(void *)(v0 + 512) = *(void *)(v0 + 96);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v52 = (uint64_t (*)(uint64_t))((char *)v48 + *v48);
      uint64_t v49 = (void *)swift_task_alloc();
      *(void *)(v0 + 520) = v49;
      *uint64_t v49 = v0;
      v49[1] = sub_243DDBC78;
      uint64_t result = v52(v0 + 408);
      break;
  }
  return result;
}

uint64_t sub_243DDBC78()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 448);
  uint64_t v3 = *(void *)(v1 + 440);
  return MEMORY[0x270FA2498](sub_243DDBDBC, v3, v2);
}

uint64_t sub_243DDBDBC()
{
  uint64_t v54 = v0 + 152;
  uint64_t v1 = *(void **)(v0 + 408);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v3 = *(void **)(v0 + 504);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
LABEL_42:
  }
    uint64_t v3 = sub_243AA7098(0, v3[2] + 1, 1, v3);
  unint64_t v5 = v3[2];
  unint64_t v4 = v3[3];
  if (v5 >= v4 >> 1) {
    uint64_t v3 = sub_243AA7098((void *)(v4 > 1), v5 + 1, 1, v3);
  }
  uint64_t v6 = *(void *)(v0 + 488);
  uint64_t v7 = *(void *)(v0 + 496) + 1;
  v3[2] = v5 + 1;
  v3[v5 + 4] = v1;
  sub_243DDE2EC(v54);
  if (v7 == v6)
  {
    swift_bridgeObjectRelease();
    uint64_t v1 = (void *)MEMORY[0x263F8EE78];
    unint64_t v8 = (unint64_t *)&qword_268E200D0;
    uint64_t v9 = (SEL *)&block_descriptor;
    while (1)
    {
      uint64_t v10 = v3[2];
      if (v10)
      {
        if (v10 != 1)
        {
          uint64_t v13 = v8;
          *(void *)(v0 + 392) = v1;
          swift_bridgeObjectRetain();
          sub_243DFF250();
          uint64_t v14 = 0;
          while (v10 != v14)
          {
            uint64_t v15 = v14 + 1;
            id v16 = (id)v3[v14 + 4];
            sub_243DFF230();
            sub_243DFF260();
            sub_243DFF270();
            sub_243DFF240();
            uint64_t v14 = v15;
            if (v10 == v15)
            {
              swift_bridgeObjectRelease_n();
              unint64_t v8 = v13;
              uint64_t v9 = (SEL *)&block_descriptor;
              goto LABEL_16;
            }
          }
          __break(1u);
LABEL_41:
          __break(1u);
          goto LABEL_42;
        }
        uint64_t v11 = *(void **)(v0 + 416);
        id v12 = (id)v3[4];
        swift_bridgeObjectRelease();
        uint64_t v3 = v12;
        MEMORY[0x245686650]();
        if (*(void *)((*v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_243DFEB00();
        }
        sub_243DFEB20();
        sub_243DFEAF0();
      }
      else
      {
        swift_bridgeObjectRelease();
LABEL_16:
        uint64_t v17 = *(void **)(v0 + 416);
        sub_243A8F888(0, v8);
        id v18 = (void *)sub_243DFEAD0();
        swift_bridgeObjectRelease();
        uint64_t v3 = objc_msgSend(self, v9[502], v18);

        MEMORY[0x245686650]();
        if (*(void *)((*v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v17 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_243DFEB00();
        }
        sub_243DFEB20();
        sub_243DFEAF0();
      }
      unint64_t v19 = *(void *)(v0 + 472) + 1;
      if (v19 == *(void *)(v0 + 464)) {
        break;
      }
      *(void *)(v0 + 472) = v19;
      uint64_t v20 = *(void *)(v0 + 456);
      if (v19 >= *(void *)(v20 + 16)) {
        goto LABEL_41;
      }
      uint64_t v21 = *(void *)(v20 + 24 * v19 + 48);
      *(void *)(v0 + 480) = v21;
      uint64_t v22 = *(void *)(v21 + 16);
      *(void *)(v0 + 488) = v22;
      uint64_t v3 = v1;
      if (v22)
      {
        uint64_t v25 = swift_bridgeObjectRetain();
        uint64_t v26 = 0;
        uint64_t v3 = (void *)MEMORY[0x263F8EE78];
        goto LABEL_27;
      }
    }
    swift_release();
    swift_release();
    uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
    return v23();
  }
  else
  {
    uint64_t v26 = *(void *)(v0 + 496) + 1;
    uint64_t v25 = *(void *)(v0 + 480);
LABEL_27:
    *(void *)(v0 + 496) = v26;
    *(void *)(v0 + 504) = v3;
    sub_243C57BD4(v25 + 48 * v26 + 32, v54);
    sub_243C57BD4(v54, v0 + 104);
    switch(*(unsigned char *)(v0 + 144))
    {
      case 1:
        sub_243AFD784((long long *)(v0 + 104), v0 + 280);
        uint64_t v29 = *(void *)(v0 + 304);
        uint64_t v30 = *(void *)(v0 + 312);
        __swift_project_boxed_opaque_existential_1((void *)(v0 + 280), v29);
        (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v30);
        __swift_destroy_boxed_opaque_existential_1(v0 + 280);
        break;
      case 2:
        sub_243AFD784((long long *)(v0 + 104), v0 + 320);
        uint64_t v31 = *(void *)(v0 + 344);
        uint64_t v32 = *(void *)(v0 + 352);
        __swift_project_boxed_opaque_existential_1((void *)(v0 + 320), v31);
        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v32);
        __swift_destroy_boxed_opaque_existential_1(v0 + 320);
        break;
      case 3:
        sub_243AFD784((long long *)(v0 + 104), v0 + 240);
        uint64_t v33 = *(void *)(v0 + 264);
        uint64_t v34 = *(void *)(v0 + 272);
        __swift_project_boxed_opaque_existential_1((void *)(v0 + 240), v33);
        (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v34);
        __swift_destroy_boxed_opaque_existential_1(v0 + 240);
        break;
      case 4:
        uint64_t v36 = *(void *)(v0 + 104);
        uint64_t v35 = *(void *)(v0 + 112);
        uint64_t v37 = *(void **)(v0 + 120);
        swift_bridgeObjectRetain();
        id v38 = objc_msgSend(v37, sel_title);
        uint64_t v39 = sub_243DFE910();
        uint64_t v41 = v40;

        *(void *)(v0 + 376) = v39;
        *(void *)(v0 + 384) = v41;
        id v42 = objc_msgSend(v37, sel_subtitle);
        uint64_t v43 = sub_243DFE910();
        unint64_t v45 = v44;

        swift_bridgeObjectRelease();
        uint64_t v46 = HIBYTE(v45) & 0xF;
        if ((v45 & 0x2000000000000000) == 0) {
          uint64_t v46 = v43 & 0xFFFFFFFFFFFFLL;
        }
        if (v46)
        {
          id v47 = objc_msgSend(v37, sel_subtitle);
          sub_243DFE910();

          *(void *)(v0 + 360) = 8236;
          *(void *)(v0 + 368) = 0xE200000000000000;
          sub_243DFE9E0();
          swift_bridgeObjectRelease();
          sub_243DFE9E0();
          swift_bridgeObjectRelease();
        }
        uint64_t v48 = *(void *)(v0 + 376);
        uint64_t v49 = *(void *)(v0 + 384);
        uint64_t v50 = sub_243DFE050();
        uint64_t v51 = (void *)swift_allocObject();
        v51[2] = v36;
        v51[3] = v35;
        v51[4] = v37;
        *(void *)(v0 + 16) = v36;
        *(void *)(v0 + 24) = v35;
        *(void *)(v0 + 32) = v48;
        *(void *)(v0 + 40) = v49;
        *(void *)(v0 + 48) = v50;
        *(void *)(v0 + 56) = 0xD000000000000012;
        *(void *)(v0 + 64) = 0x8000000243E1CC10;
        *(void *)(v0 + 72) = 0x6E6F697461636F4CLL;
        *(void *)(v0 + 80) = 0xE800000000000000;
        *(void *)(v0 + 88) = &unk_268E22DD8;
        *(void *)(v0 + 96) = v51;
        break;
      default:
        sub_243AFD784((long long *)(v0 + 104), v0 + 200);
        uint64_t v27 = *(void *)(v0 + 224);
        uint64_t v28 = *(void *)(v0 + 232);
        __swift_project_boxed_opaque_existential_1((void *)(v0 + 200), v27);
        (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v28);
        __swift_destroy_boxed_opaque_existential_1(v0 + 200);
        break;
    }
    uint64_t v52 = *(int **)(v0 + 88);
    *(void *)(v0 + 512) = *(void *)(v0 + 96);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v55 = (uint64_t (*)(uint64_t))((char *)v52 + *v52);
    long long v53 = (void *)swift_task_alloc();
    *(void *)(v0 + 520) = v53;
    void *v53 = v0;
    v53[1] = sub_243DDBC78;
    return v55(v0 + 408);
  }
}

uint64_t sub_243DDC538()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel__searchText;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1ECE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel__searchTags;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22E38);
  unint64_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v0 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel__searchSuggestions, v4);
  uint64_t v6 = v0 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel__searchPredicate;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22E40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v0 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel__searchSubmitted;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18C90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = v0 + OBJC_IVAR____TtC12FinanceKitUI22TransactionSearchModel__state;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22E48);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_243DDC75C()
{
  sub_243DDC538();

  return swift_deallocClassInstance();
}

uint64_t sub_243DDC7B4()
{
  return type metadata accessor for TransactionSearchModel();
}

uint64_t type metadata accessor for TransactionSearchModel()
{
  uint64_t result = qword_268E22D60;
  if (!qword_268E22D60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_243DDC808()
{
  sub_243D9FF7C(319, &qword_268E22168);
  if (v0 <= 0x3F)
  {
    sub_243B8F304(319, &qword_268E22D70, &qword_268E19E30);
    if (v1 <= 0x3F)
    {
      sub_243B8F304(319, &qword_268E22D78, &qword_268E22D80);
      if (v2 <= 0x3F)
      {
        sub_243D9FF7C(319, (unint64_t *)&qword_268E18C88);
        if (v3 <= 0x3F)
        {
          sub_243D9FF7C(319, &qword_268E22D88);
          if (v4 <= 0x3F) {
            swift_updateClassMetadata2();
          }
        }
      }
    }
  }
}

unsigned char *storeEnumTagSinglePayload for TransactionSearchModel.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x243DDCAD8);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TransactionSearchModel.State()
{
  return &type metadata for TransactionSearchModel.State;
}

unint64_t sub_243DDCB14()
{
  unint64_t result = qword_268E22D90;
  if (!qword_268E22D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22D90);
  }
  return result;
}

uint64_t sub_243DDCB68(void **a1)
{
  unint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = (void *)sub_243AA3570(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = sub_243DDCBD4(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_243DDCBD4(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_243DFF370();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_243DDD2FC(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  uint64_t v106 = result;
  uint64_t v103 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v11 = (char *)MEMORY[0x263F8EE78];
LABEL_118:
      id v94 = v11;
      uint64_t v105 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v103;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          unint64_t v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_243DDD3E4((char *)(v95 + 24 * v98), (char *)(v95 + 24 * *(void *)&v94[16 * v12 + 16]), v95 + 24 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v97 = sub_243AA3548((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          uint64_t v100 = &v97[16 * v96 + 32];
          *(void *)uint64_t v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          id v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(void *)(v105 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v105 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E21928);
    uint64_t v7 = sub_243DFEB10();
    *(void *)(v7 + 16) = v6;
    uint64_t v105 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v104 = *a1 + 8;
  uint64_t v102 = *a1 - 24;
  uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v107 = v3;
  uint64_t v108 = v10;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    uint64_t v14 = (uint64_t *)(v10 + 24 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 24 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_243DFF3A0();
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v104 + 24 * v20);
    do
    {
      uint64_t v23 = (void *)(v10 + 24 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_243DFF3A0()))
      {
        goto LABEL_36;
      }
      v21 += 3;
      uint64_t v22 = v20 + 1;
      uint64_t v9 = v20;
      uint64_t v20 = v22;
    }
    while (v22 < v3);
    uint64_t v20 = v22;
LABEL_36:
    uint64_t v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 24 * v20;
        uint64_t v26 = 24 * v13;
        uint64_t v27 = v20;
        uint64_t v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v26;
            uint64_t v30 = v10 + v25;
            uint64_t v31 = *(void *)(v10 + v26);
            long long v32 = *(_OWORD *)(v10 + v26 + 8);
            long long v33 = *(_OWORD *)(v10 + v25 - 24);
            *(void *)(v29 + 16) = *(void *)(v10 + v25 - 8);
            *(_OWORD *)uint64_t v29 = v33;
            *(void *)(v30 - 24) = v31;
            *(_OWORD *)(v30 - 16) = v32;
          }
          ++v28;
          v25 -= 24;
          v26 += 24;
        }
        while (v28 < v27);
      }
LABEL_45:
      uint64_t v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v106) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_243AA317C(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v45 = *((void *)v11 + 2);
    unint64_t v44 = *((void *)v11 + 3);
    unint64_t v12 = v45 + 1;
    if (v45 >= v44 >> 1) {
      uint64_t v11 = sub_243AA317C((char *)(v44 > 1), v45 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    uint64_t v46 = v11 + 32;
    id v47 = &v11[16 * v45 + 32];
    *(void *)id v47 = v13;
    *((void *)v47 + 1) = v9;
    if (v45)
    {
      uint64_t v10 = v108;
      while (1)
      {
        unint64_t v48 = v12 - 1;
        if (v12 >= 4)
        {
          long long v53 = &v46[16 * v12];
          uint64_t v54 = *((void *)v53 - 8);
          uint64_t v55 = *((void *)v53 - 7);
          BOOL v59 = __OFSUB__(v55, v54);
          uint64_t v56 = v55 - v54;
          if (v59) {
            goto LABEL_135;
          }
          uint64_t v58 = *((void *)v53 - 6);
          uint64_t v57 = *((void *)v53 - 5);
          BOOL v59 = __OFSUB__(v57, v58);
          uint64_t v51 = v57 - v58;
          char v52 = v59;
          if (v59) {
            goto LABEL_136;
          }
          unint64_t v60 = v12 - 2;
          uint64_t v61 = &v46[16 * v12 - 32];
          uint64_t v63 = *(void *)v61;
          uint64_t v62 = *((void *)v61 + 1);
          BOOL v59 = __OFSUB__(v62, v63);
          uint64_t v64 = v62 - v63;
          if (v59) {
            goto LABEL_138;
          }
          BOOL v59 = __OFADD__(v51, v64);
          uint64_t v65 = v51 + v64;
          if (v59) {
            goto LABEL_141;
          }
          if (v65 >= v56)
          {
            uint64_t v83 = &v46[16 * v48];
            uint64_t v85 = *(void *)v83;
            uint64_t v84 = *((void *)v83 + 1);
            BOOL v59 = __OFSUB__(v84, v85);
            uint64_t v86 = v84 - v85;
            if (v59) {
              goto LABEL_145;
            }
            BOOL v76 = v51 < v86;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v77 = *((void *)v11 + 4);
            uint64_t v78 = *((void *)v11 + 5);
            BOOL v59 = __OFSUB__(v78, v77);
            uint64_t v70 = v78 - v77;
            char v71 = v59;
            goto LABEL_99;
          }
          uint64_t v50 = *((void *)v11 + 4);
          uint64_t v49 = *((void *)v11 + 5);
          BOOL v59 = __OFSUB__(v49, v50);
          uint64_t v51 = v49 - v50;
          char v52 = v59;
        }
        if (v52) {
          goto LABEL_137;
        }
        unint64_t v60 = v12 - 2;
        uint64_t v66 = &v46[16 * v12 - 32];
        uint64_t v68 = *(void *)v66;
        uint64_t v67 = *((void *)v66 + 1);
        BOOL v69 = __OFSUB__(v67, v68);
        uint64_t v70 = v67 - v68;
        char v71 = v69;
        if (v69) {
          goto LABEL_140;
        }
        uint64_t v72 = &v46[16 * v48];
        uint64_t v74 = *(void *)v72;
        uint64_t v73 = *((void *)v72 + 1);
        BOOL v59 = __OFSUB__(v73, v74);
        uint64_t v75 = v73 - v74;
        if (v59) {
          goto LABEL_143;
        }
        if (__OFADD__(v70, v75)) {
          goto LABEL_144;
        }
        if (v70 + v75 >= v51)
        {
          BOOL v76 = v51 < v75;
LABEL_105:
          if (v76) {
            unint64_t v48 = v60;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v71) {
          goto LABEL_139;
        }
        uint64_t v79 = &v46[16 * v48];
        uint64_t v81 = *(void *)v79;
        uint64_t v80 = *((void *)v79 + 1);
        BOOL v59 = __OFSUB__(v80, v81);
        uint64_t v82 = v80 - v81;
        if (v59) {
          goto LABEL_142;
        }
        if (v82 < v70) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v87 = v48 - 1;
        if (v48 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
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
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!v10) {
          goto LABEL_157;
        }
        uint64_t v88 = v10;
        id v89 = &v46[16 * v87];
        uint64_t v90 = *(void *)v89;
        id v91 = &v46[16 * v48];
        uint64_t v92 = *((void *)v91 + 1);
        sub_243DDD3E4((char *)(v88 + 24 * *(void *)v89), (char *)(v88 + 24 * *(void *)v91), v88 + 24 * v92, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v92 < v90) {
          goto LABEL_132;
        }
        if (v48 > *((void *)v11 + 2)) {
          goto LABEL_133;
        }
        *(void *)id v89 = v90;
        *(void *)&v46[16 * v87 + 8] = v92;
        unint64_t v93 = *((void *)v11 + 2);
        if (v48 >= v93) {
          goto LABEL_134;
        }
        unint64_t v12 = v93 - 1;
        memmove(&v46[16 * v48], v91 + 16, 16 * (v93 - 1 - v48));
        *((void *)v11 + 2) = v93 - 1;
        BOOL v76 = v93 > 2;
        uint64_t v10 = v108;
        if (!v76) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
    uint64_t v10 = v108;
LABEL_15:
    uint64_t v3 = v107;
    if (v9 >= v107)
    {
      uint64_t v8 = v105;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v106)) {
    goto LABEL_153;
  }
  if (v13 + v106 >= v3) {
    uint64_t v34 = v3;
  }
  else {
    uint64_t v34 = v13 + v106;
  }
  if (v34 >= v13)
  {
    if (v9 != v34)
    {
      uint64_t v35 = v102 + 24 * v9;
      do
      {
        uint64_t v36 = (uint64_t *)(v10 + 24 * v9);
        uint64_t v37 = *v36;
        uint64_t v38 = v36[1];
        uint64_t v39 = v13;
        uint64_t v40 = v35;
        do
        {
          BOOL v41 = v37 == *(void *)v40 && v38 == *(void *)(v40 + 8);
          if (v41 || (sub_243DFF3A0() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          long long v42 = *(_OWORD *)(v40 + 32);
          uint64_t v43 = *(void *)(v40 + 16);
          uint64_t v37 = *(void *)(v40 + 24);
          *(_OWORD *)(v40 + 24) = *(_OWORD *)v40;
          *(void *)(v40 + 40) = v43;
          *(void *)uint64_t v40 = v37;
          *(_OWORD *)(v40 + 8) = v42;
          uint64_t v38 = v42;
          v40 -= 24;
          ++v39;
        }
        while (v9 != v39);
        ++v9;
        v35 += 24;
      }
      while (v9 != v34);
      uint64_t v9 = v34;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  uint64_t result = sub_243DFF290();
  __break(1u);
  return result;
}

uint64_t sub_243DDD2FC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 24 * a3 - 24;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 24 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    while (1)
    {
      BOOL v13 = result == *(void *)v12 && v10 == *(void *)(v12 + 8);
      if (v13 || (uint64_t result = sub_243DFF3A0(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 24;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      long long v14 = *(_OWORD *)(v12 + 32);
      uint64_t v15 = *(void *)(v12 + 16);
      uint64_t result = *(void *)(v12 + 24);
      *(_OWORD *)(v12 + 24) = *(_OWORD *)v12;
      *(void *)(v12 + 40) = v15;
      *(void *)uint64_t v12 = result;
      *(_OWORD *)(v12 + 8) = v14;
      uint64_t v10 = v14;
      v12 -= 24;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_243DDD3E4(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 24;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 24;
  uint64_t v29 = __src;
  uint64_t v28 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -23)
    {
      if (__dst != a2 || &a2[24 * v11] <= __dst) {
        memmove(__dst, a2, 24 * v11);
      }
      uint64_t v17 = &v4[24 * v11];
      uint64_t v27 = v17;
      uint64_t v29 = v6;
      if (v7 < v6 && v10 >= 24)
      {
        unint64_t v18 = a3 - 24;
        int v19 = v6;
        while (1)
        {
          uint64_t v20 = (char *)(v18 + 24);
          uint64_t v21 = *((void *)v19 - 3);
          uint64_t v22 = *((void *)v19 - 2);
          v19 -= 24;
          BOOL v23 = *((void *)v17 - 3) == v21 && *((void *)v17 - 2) == v22;
          if (v23 || (sub_243DFF3A0() & 1) == 0)
          {
            uint64_t v27 = v17 - 24;
            if (v20 < v17 || v18 >= (unint64_t)v17 || v20 != v17)
            {
              long long v25 = *(_OWORD *)(v17 - 24);
              *(void *)(v18 + 16) = *((void *)v17 - 1);
              *(_OWORD *)unint64_t v18 = v25;
            }
            int v19 = v6;
            v17 -= 24;
            if (v6 <= v7) {
              goto LABEL_46;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= (unint64_t)v6)
            {
              long long v24 = *(_OWORD *)v19;
              *(void *)(v18 + 16) = *((void *)v19 + 2);
              *(_OWORD *)unint64_t v18 = v24;
            }
            uint64_t v29 = v19;
            if (v19 <= v7) {
              goto LABEL_46;
            }
          }
          v18 -= 24;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_46;
          }
        }
      }
      goto LABEL_46;
    }
  }
  else if (v8 >= -23)
  {
    if (__dst != __src || &__src[24 * v9] <= __dst) {
      memmove(__dst, __src, 24 * v9);
    }
    uint64_t v12 = &v4[24 * v9];
    uint64_t v27 = v12;
    if ((unint64_t)v6 < a3 && v8 >= 24)
    {
      do
      {
        BOOL v13 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v13 || (sub_243DFF3A0() & 1) == 0)
        {
          if (v7 != v4)
          {
            long long v16 = *(_OWORD *)v4;
            *((void *)v7 + 2) = *((void *)v4 + 2);
            *(_OWORD *)uint64_t v7 = v16;
          }
          v4 += 24;
          uint64_t v28 = v4;
          long long v14 = v6;
        }
        else
        {
          long long v14 = v6 + 24;
          if (v7 < v6 || v7 >= v14 || v7 != v6)
          {
            long long v15 = *(_OWORD *)v6;
            *((void *)v7 + 2) = *((void *)v6 + 2);
            *(_OWORD *)uint64_t v7 = v15;
          }
        }
        v7 += 24;
        if (v4 >= v12) {
          break;
        }
        uint64_t v6 = v14;
      }
      while ((unint64_t)v14 < a3);
      uint64_t v29 = v7;
    }
LABEL_46:
    sub_243AA3338((void **)&v29, (const void **)&v28, &v27);
    return 1;
  }
  uint64_t result = sub_243DFF300();
  __break(1u);
  return result;
}

uint64_t sub_243DDD6BC(uint64_t a1)
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
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  int64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
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

int64_t sub_243DDD75C(int64_t result, int a2, char a3, uint64_t a4)
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

uint64_t sub_243DDD840(uint64_t a1)
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

uint64_t sub_243DDD8C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v34 = a2;
  uint64_t v35 = a3;
  uint64_t v5 = sub_243DF93C0();
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  long long v33 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)v26 - v9;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v41 = MEMORY[0x263F8EE78];
  uint64_t v12 = *(void *)(a1 + 16);
  if (v12)
  {
    BOOL v13 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    uint64_t v31 = v8 + 16;
    long long v32 = v13;
    uint64_t v14 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v15 = *(void *)(v8 + 72);
    uint64_t v28 = v5;
    uint64_t v29 = (v14 + 32) & ~v14;
    uint64_t v16 = a1 + v29;
    v26[1] = v3;
    uint64_t v27 = (void (**)(char *, uint64_t))(v8 + 8);
    uint64_t v30 = (void (**)(char *, char *, uint64_t))(v8 + 32);
    do
    {
      uint64_t v36 = v12;
      v32(v10, v16, v5);
      sub_243DF9390();
      uint64_t v17 = sub_243DFE970();
      uint64_t v19 = v18;
      swift_bridgeObjectRelease();
      uint64_t v39 = v17;
      uint64_t v40 = v19;
      uint64_t v37 = v34;
      uint64_t v38 = v35;
      sub_243A56634();
      uint64_t v37 = sub_243DFF020();
      uint64_t v38 = v20;
      char v21 = sub_243DFF080();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v21)
      {
        uint64_t v22 = *v30;
        (*v30)(v33, v10, v5);
        uint64_t v23 = v41;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_243D7AE60(0, *(void *)(v23 + 16) + 1, 1);
          uint64_t v23 = v41;
        }
        unint64_t v25 = *(void *)(v23 + 16);
        unint64_t v24 = *(void *)(v23 + 24);
        if (v25 >= v24 >> 1)
        {
          sub_243D7AE60(v24 > 1, v25 + 1, 1);
          uint64_t v23 = v41;
        }
        *(void *)(v23 + 16) = v25 + 1;
        uint64_t v5 = v28;
        v22((char *)(v23 + v29 + v25 * v15), v33, v28);
        uint64_t v41 = v23;
      }
      else
      {
        (*v27)(v10, v5);
      }
      v16 += v15;
      uint64_t v12 = v36 - 1;
    }
    while (v36 != 1);
    return v41;
  }
  return result;
}

void *sub_243DDDB90(uint64_t a1)
{
  unint64_t v1 = (void *)MEMORY[0x263F8EE80];
  uint64_t v62 = (void *)MEMORY[0x263F8EE80];
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 48)
    {
      sub_243C57BD4(i, (uint64_t)v61);
      sub_243C57BD4((uint64_t)v61, (uint64_t)&v47);
      if (v49 == 4)
      {
        uint64_t v26 = *((void *)&v47 + 1);
        uint64_t v43 = v47;
        uint64_t v27 = v48;
        swift_bridgeObjectRetain();
        id v28 = objc_msgSend(v27, sel_title);
        uint64_t v29 = sub_243DFE910();
        uint64_t v31 = v30;

        uint64_t v50 = v29;
        uint64_t v51 = v31;
        id v32 = objc_msgSend(v27, sel_subtitle);
        uint64_t v33 = sub_243DFE910();
        unint64_t v35 = v34;

        swift_bridgeObjectRelease();
        uint64_t v36 = HIBYTE(v35) & 0xF;
        if ((v35 & 0x2000000000000000) == 0) {
          uint64_t v36 = v33 & 0xFFFFFFFFFFFFLL;
        }
        if (v36)
        {
          id v37 = objc_msgSend(v27, sel_subtitle);
          sub_243DFE910();

          v44[0] = 8236;
          v44[1] = 0xE200000000000000;
          sub_243DFE9E0();
          swift_bridgeObjectRelease();
          sub_243DFE9E0();
          swift_bridgeObjectRelease();
        }
        uint64_t v38 = v50;
        uint64_t v39 = v51;
        uint64_t v40 = sub_243DFE050();
        uint64_t v41 = (void *)swift_allocObject();
        v41[2] = v43;
        v41[3] = v26;
        v41[4] = v27;
        uint64_t v50 = v43;
        uint64_t v51 = v26;
        uint64_t v52 = v38;
        uint64_t v53 = v39;
        uint64_t v54 = v40;
        unint64_t v55 = 0xD000000000000012;
        unint64_t v56 = 0x8000000243E1CC10;
        uint64_t v57 = 0x6E6F697461636F4CLL;
        unint64_t v58 = 0xE800000000000000;
        BOOL v59 = &unk_268E22DE0;
        unint64_t v60 = v41;
      }
      else
      {
        sub_243AFD784(&v47, (uint64_t)v44);
        uint64_t v4 = v45;
        uint64_t v5 = v46;
        __swift_project_boxed_opaque_existential_1(v44, v45);
        (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v5 + 8))(&v50, v4, v5);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
      }
      uint64_t v6 = v57;
      uint64_t v7 = v58;
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v9 = sub_243A68114(v6, v7);
      uint64_t v10 = v1[2];
      BOOL v11 = (v8 & 1) == 0;
      uint64_t v12 = v10 + v11;
      if (__OFADD__(v10, v11)) {
        break;
      }
      char v13 = v8;
      if (v1[3] < v12)
      {
        sub_243A69550(v12, 1);
        unint64_t v1 = v62;
        unint64_t v14 = sub_243A68114(v6, v7);
        if ((v13 & 1) != (v15 & 1)) {
          goto LABEL_26;
        }
        unint64_t v9 = v14;
      }
      if (v13)
      {
        swift_bridgeObjectRelease();
        uint64_t v16 = v1[7];
        sub_243A802A4((uint64_t)v61, (uint64_t)&v50);
        uint64_t v17 = *(void **)(v16 + 8 * v9);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v16 + 8 * v9) = v17;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v17 = sub_243AA6F74(0, v17[2] + 1, 1, v17);
          *(void *)(v16 + 8 * v9) = v17;
        }
        unint64_t v20 = v17[2];
        unint64_t v19 = v17[3];
        if (v20 >= v19 >> 1)
        {
          uint64_t v17 = sub_243AA6F74((void *)(v19 > 1), v20 + 1, 1, v17);
          *(void *)(v16 + 8 * v9) = v17;
        }
        v17[2] = v20 + 1;
        sub_243A802A4((uint64_t)&v50, (uint64_t)&v17[6 * v20 + 4]);
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_268E19988);
        uint64_t v21 = swift_allocObject();
        *(_OWORD *)(v21 + 16) = xmmword_243E01820;
        sub_243A802A4((uint64_t)v61, v21 + 32);
        v1[(v9 >> 6) + 8] |= 1 << v9;
        uint64_t v22 = (uint64_t *)(v1[6] + 16 * v9);
        *uint64_t v22 = v6;
        v22[1] = v7;
        *(void *)(v1[7] + 8 * v9) = v21;
        uint64_t v23 = v1[2];
        BOOL v24 = __OFADD__(v23, 1);
        uint64_t v25 = v23 + 1;
        if (v24) {
          goto LABEL_25;
        }
        v1[2] = v25;
      }
      if (!--v2) {
        return v1;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    sub_243DFF3E0();
    __break(1u);
    JUMPOUT(0x243DDDFECLL);
  }
  return v1;
}

uint64_t sub_243DDE000(uint64_t result, char a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    uint64_t v6 = (void *)swift_bridgeObjectRetain();
    uint64_t v8 = v6[4];
    uint64_t v7 = v6[5];
    unint64_t v44 = v6;
    uint64_t v9 = v6[6];
    uint64_t v10 = (void *)*a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_243A68114(v8, v7);
    uint64_t v13 = v10[2];
    BOOL v14 = (v11 & 1) == 0;
    uint64_t v15 = v13 + v14;
    if (__OFADD__(v13, v14))
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    char v16 = v11;
    if (v10[3] < v15)
    {
      sub_243A6955C(v15, a2 & 1);
      unint64_t v17 = sub_243A68114(v8, v7);
      if ((v16 & 1) != (v18 & 1))
      {
LABEL_27:
        uint64_t result = sub_243DFF3E0();
        __break(1u);
        return result;
      }
      unint64_t v12 = v17;
      unint64_t v19 = (void *)*a3;
      if ((v16 & 1) == 0) {
        goto LABEL_12;
      }
LABEL_9:
      uint64_t v45 = *(void *)(v19[7] + 8 * v12);
      swift_bridgeObjectRetain();
      sub_243DDAA10(v9);
      swift_bridgeObjectRelease();
      uint64_t v20 = v19[7];
      swift_bridgeObjectRelease();
      *(void *)(v20 + 8 * v12) = v45;
      uint64_t v21 = v3 - 1;
      if (v3 == 1) {
        return swift_bridgeObjectRelease();
      }
LABEL_16:
      for (uint64_t i = v44 + 9; ; i += 3)
      {
        uint64_t v30 = *(i - 2);
        uint64_t v29 = *(i - 1);
        uint64_t v31 = *i;
        id v32 = (void *)*a3;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v33 = sub_243A68114(v30, v29);
        uint64_t v35 = v32[2];
        BOOL v36 = (v34 & 1) == 0;
        BOOL v24 = __OFADD__(v35, v36);
        uint64_t v37 = v35 + v36;
        if (v24) {
          break;
        }
        char v38 = v34;
        if (v32[3] < v37)
        {
          sub_243A6955C(v37, 1);
          unint64_t v33 = sub_243A68114(v30, v29);
          if ((v38 & 1) != (v39 & 1)) {
            goto LABEL_27;
          }
        }
        uint64_t v40 = (void *)*a3;
        if (v38)
        {
          uint64_t v27 = 8 * v33;
          uint64_t v46 = *(void *)(v40[7] + 8 * v33);
          swift_bridgeObjectRetain();
          sub_243DDAA10(v31);
          swift_bridgeObjectRelease();
          uint64_t v28 = v40[7];
          swift_bridgeObjectRelease();
          *(void *)(v28 + v27) = v46;
        }
        else
        {
          v40[(v33 >> 6) + 8] |= 1 << v33;
          uint64_t v41 = (uint64_t *)(v40[6] + 16 * v33);
          *uint64_t v41 = v30;
          v41[1] = v29;
          *(void *)(v40[7] + 8 * v33) = v31;
          uint64_t v42 = v40[2];
          BOOL v24 = __OFADD__(v42, 1);
          uint64_t v43 = v42 + 1;
          if (v24) {
            goto LABEL_26;
          }
          v40[2] = v43;
        }
        if (!--v21) {
          return swift_bridgeObjectRelease();
        }
      }
      goto LABEL_25;
    }
    if (a2)
    {
      unint64_t v19 = (void *)*a3;
      if (v11) {
        goto LABEL_9;
      }
    }
    else
    {
      sub_243A6A850();
      unint64_t v19 = (void *)*a3;
      if (v16) {
        goto LABEL_9;
      }
    }
LABEL_12:
    v19[(v12 >> 6) + 8] |= 1 << v12;
    uint64_t v22 = (uint64_t *)(v19[6] + 16 * v12);
    *uint64_t v22 = v8;
    v22[1] = v7;
    *(void *)(v19[7] + 8 * v12) = v9;
    uint64_t v23 = v19[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v19[2] = v25;
    uint64_t v21 = v3 - 1;
    if (v3 == 1) {
      return swift_bridgeObjectRelease();
    }
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_243DDE2EC(uint64_t a1)
{
  return a1;
}

uint64_t sub_243DDE348@<X0>(unsigned char *a1@<X8>)
{
  return sub_243DDAF4C(a1);
}

uint64_t sub_243DDE370()
{
  return sub_243C0567C();
}

uint64_t sub_243DDE3A4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_243A66978;
  return sub_243D1099C(a1);
}

uint64_t objectdestroyTm_32()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_243DDE4A4@<X0>(unsigned char *a1@<X8>)
{
  return sub_243DDAF4C(a1);
}

uint64_t sub_243DDE4CC()
{
  return sub_243C0567C();
}

unint64_t sub_243DDE4F4()
{
  unint64_t result = qword_268E1ED08;
  if (!qword_268E1ED08)
  {
    sub_243A8F888(255, (unint64_t *)&qword_268E20100);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E1ED08);
  }
  return result;
}

uint64_t sub_243DDE55C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243DFC390();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_243DDE5D0(uint64_t a1)
{
  v1[8] = a1;
  type metadata accessor for BankConnectReconnectAccountsResult(0);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  sub_243DFEB80();
  v1[11] = sub_243DFEB70();
  uint64_t v3 = sub_243DFEB30();
  v1[12] = v3;
  v1[13] = v2;
  return MEMORY[0x270FA2498](sub_243DDE6A4, v3, v2);
}

uint64_t sub_243DDE6A4()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  v0[14] = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[15] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_243DDE7B0;
    uint64_t v3 = v0[9];
    return sub_243DDEF20(v3);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_243DDE7B0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 104);
  uint64_t v3 = *(void *)(v1 + 96);
  return MEMORY[0x270FA2498](sub_243DDE8F4, v3, v2);
}

uint64_t sub_243DDE8F4()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  swift_release();
  sub_243DE2318(v2, v1, type metadata accessor for BankConnectReconnectAccountsResult);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = v0[10];
    uint64_t v5 = *(void (**)(uint64_t))(Strong + 56);
    swift_retain();
    swift_release();
    v5(v4);
    swift_release();
  }
  sub_243DE1DC8(v0[10], type metadata accessor for BankConnectReconnectAccountsResult);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_243DDEA08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A950);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243DFC390();
  swift_release();
  uint64_t result = swift_release();
  if ((v14[15] & 1) == 0)
  {
    uint64_t v10 = sub_243DFEBB0();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
    sub_243DFEB80();
    swift_retain();
    swift_retain();
    uint64_t v11 = sub_243DFEB70();
    unint64_t v12 = (void *)swift_allocObject();
    uint64_t v13 = MEMORY[0x263F8F500];
    v12[2] = v11;
    v12[3] = v13;
    v12[4] = v3;
    v12[5] = a1;
    v12[6] = a2;
    sub_243C26D38((uint64_t)v8, (uint64_t)&unk_268E22E88, (uint64_t)v12);
    return swift_release();
  }
  return result;
}

uint64_t sub_243DDEB8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  sub_243DFEB80();
  v6[5] = sub_243DFEB70();
  uint64_t v8 = sub_243DFEB30();
  v6[6] = v8;
  v6[7] = v7;
  return MEMORY[0x270FA2498](sub_243DDEC28, v8, v7);
}

uint64_t sub_243DDEC28()
{
  uint64_t v1 = *(int **)(v0 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 72) = 1;
  swift_retain();
  sub_243DFC3A0();
  uint64_t v4 = (uint64_t (*)(void))((char *)v1 + *v1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_243DDED50;
  return v4();
}

uint64_t sub_243DDED50()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 56);
  uint64_t v3 = *(void *)(v1 + 48);
  return MEMORY[0x270FA2498](sub_243DDEE70, v3, v2);
}

uint64_t sub_243DDEE70()
{
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  *(unsigned char *)(v0 + 73) = 0;
  swift_retain();
  sub_243DFC3A0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_243DDEF20(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = sub_243DFAE70();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  uint64_t v4 = sub_243DF8B70();
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v5 = sub_243DFAE90();
  v2[13] = v5;
  v2[14] = *(void *)(v5 - 8);
  v2[15] = swift_task_alloc();
  uint64_t v6 = sub_243DFC2C0();
  v2[16] = v6;
  v2[17] = *(void *)(v6 - 8);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  type metadata accessor for BankConnectAuthorizationFlow(0);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  sub_243DFEB80();
  v2[23] = sub_243DFEB70();
  uint64_t v8 = sub_243DFEB30();
  v2[24] = v8;
  v2[25] = v7;
  return MEMORY[0x270FA2498](sub_243DDF180, v8, v7);
}

uint64_t sub_243DDF180()
{
  uint64_t v1 = v0[6];
  __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
  uint64_t v2 = v1 + OBJC_IVAR____TtC12FinanceKitUI37BankConnectReconnectAccountsViewModel_institution;
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC12FinanceKitUI37BankConnectReconnectAccountsViewModel_fpanID);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC12FinanceKitUI37BankConnectReconnectAccountsViewModel_fpanID + 8);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[26] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_243DDF258;
  uint64_t v6 = v0[22];
  return sub_243DC5290(v6, v2, v3, v4);
}

uint64_t sub_243DDF258()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 216) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 200);
  uint64_t v4 = *(void *)(v2 + 192);
  if (v0) {
    uint64_t v5 = sub_243DDF790;
  }
  else {
    uint64_t v5 = sub_243DDF394;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_243DDF394()
{
  char v38 = v0;
  uint64_t v1 = v0[22];
  uint64_t v3 = v0[20];
  uint64_t v2 = v0[21];
  swift_release();
  sub_243DFC210();
  sub_243A946A8(v1, v2);
  sub_243A946A8(v1, v3);
  uint64_t v4 = sub_243DFC290();
  os_log_type_t v5 = sub_243DFEDC0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v25 = v0[21];
    uint64_t v29 = v0[20];
    uint64_t v36 = v0[19];
    uint64_t v6 = v0[15];
    uint64_t v34 = v0[17];
    uint64_t v35 = v0[16];
    uint64_t v8 = v0[13];
    uint64_t v7 = v0[14];
    uint64_t v10 = v0[11];
    uint64_t v9 = v0[12];
    uint64_t v11 = v0[10];
    uint64_t v27 = v8;
    uint64_t v28 = v0[9];
    uint64_t v30 = v0[8];
    uint64_t v31 = v0[7];
    log = v4;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    uint64_t v37 = v33;
    *(_DWORD *)uint64_t v12 = 136315394;
    sub_243DC3E58(v6);
    sub_243DFADF0();
    uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v26(v6, v8);
    uint64_t v13 = sub_243DF8B50();
    unint64_t v15 = v14;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    v0[3] = sub_243A75AB4(v13, v15, &v37);
    sub_243DFEFE0();
    swift_bridgeObjectRelease();
    sub_243DE1DC8(v25, type metadata accessor for BankConnectAuthorizationFlow);
    *(_WORD *)(v12 + 12) = 2080;
    sub_243DC3E58(v6);
    sub_243DFAE80();
    v26(v6, v27);
    uint64_t v16 = sub_243DFAE60();
    unint64_t v18 = v17;
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v31);
    v0[4] = sub_243A75AB4(v16, v18, &v37);
    sub_243DFEFE0();
    swift_bridgeObjectRelease();
    sub_243DE1DC8(v29, type metadata accessor for BankConnectAuthorizationFlow);
    _os_log_impl(&dword_243A50000, log, v5, "Reconnect accounts step successfully initiated consent for institutionID: %s with consentID: %s.", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x245687A10](v33, -1, -1);
    MEMORY[0x245687A10](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v36, v35);
  }
  else
  {
    uint64_t v19 = v0[20];
    uint64_t v20 = v0[19];
    uint64_t v22 = v0[16];
    uint64_t v21 = v0[17];
    sub_243DE1DC8(v0[21], type metadata accessor for BankConnectAuthorizationFlow);
    sub_243DE1DC8(v19, type metadata accessor for BankConnectAuthorizationFlow);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
  }
  sub_243DE2318(v0[22], v0[5], type metadata accessor for BankConnectAuthorizationFlow);
  type metadata accessor for BankConnectReconnectAccountsResult(0);
  swift_storeEnumTagMultiPayload();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = (uint64_t (*)(void))v0[1];
  return v23();
}

uint64_t sub_243DDF790()
{
  uint64_t v1 = (void *)v0[27];
  swift_release();
  sub_243DFC210();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_243DFC290();
  os_log_type_t v5 = sub_243DFEDA0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[27];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v10;
    sub_243DFEFE0();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_243A50000, v4, v5, "Reconnect accounts step failed to initialise authorization flow with error: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E19AF0);
    swift_arrayDestroy();
    MEMORY[0x245687A10](v8, -1, -1);
    MEMORY[0x245687A10](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = (void *)v0[27];
  }
  uint64_t v12 = v0[27];
  uint64_t v13 = (void *)v0[5];
  (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
  *uint64_t v13 = v12;
  type metadata accessor for BankConnectReconnectAccountsResult(0);
  swift_storeEnumTagMultiPayload();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_243DDF9D4()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC12FinanceKitUI37BankConnectReconnectAccountsViewModel_institution;
  uint64_t v2 = sub_243DF8B70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC12FinanceKitUI37BankConnectReconnectAccountsViewModel__isLoading;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18C90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocClassInstance();
}

uint64_t sub_243DDFAE0()
{
  return type metadata accessor for BankConnectReconnectAccountsViewModel(0);
}

uint64_t type metadata accessor for BankConnectReconnectAccountsViewModel(uint64_t a1)
{
  return sub_243A651B0(a1, (uint64_t *)&unk_268E22E58);
}

void sub_243DDFB08()
{
  sub_243DF8B70();
  if (v0 <= 0x3F)
  {
    sub_243A75E84();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

id *sub_243DDFBF4(id *a1, id *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = (char *)*a2;
    *a1 = *a2;
    a1 = (id *)&v8[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      id v6 = *a2;
      id v7 = *a2;
      *a1 = v6;
    }
    else
    {
      type metadata accessor for BankConnectAuthorizationFlow(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        uint64_t v15 = sub_243DFAE90();
        (*(void (**)(id *, id *, uint64_t))(*(void *)(v15 - 8) + 16))(a1, a2, v15);
        uint64_t v16 = type metadata accessor for BankConnectExtensionAuthorizationFlow(0);
        uint64_t v17 = *(int *)(v16 + 20);
        long long v18 = *(_OWORD *)((char *)a2 + v17 + 24);
        *(_OWORD *)((char *)a1 + v17 + 24) = v18;
        (**(void (***)(void))(v18 - 8))();
        *(id *)((char *)a1 + *(int *)(v16 + 24)) = *(id *)((char *)a2 + *(int *)(v16 + 24));
        swift_bridgeObjectRetain();
      }
      else if (EnumCaseMultiPayload == 1)
      {
        uint64_t v10 = sub_243DFAE90();
        (*(void (**)(id *, id *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
        uint64_t v11 = *(int *)(type metadata accessor for BankConnectWebAuthorizationFlow(0) + 20);
        uint64_t v12 = (char *)a1 + v11;
        uint64_t v13 = (char *)a2 + v11;
        uint64_t v14 = sub_243DFBC00();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
      }
      else
      {
        uint64_t v19 = sub_243DFAE90();
        (*(void (**)(id *, id *, uint64_t))(*(void *)(v19 - 8) + 16))(a1, a2, v19);
      }
      swift_storeEnumTagMultiPayload();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_243DDFE6C(void **a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = *a1;
  }
  else
  {
    type metadata accessor for BankConnectAuthorizationFlow(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v5 = sub_243DFAE90();
      (*(void (**)(void **, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
      uint64_t v6 = type metadata accessor for BankConnectExtensionAuthorizationFlow(0);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)a1 + *(int *)(v6 + 20));
      swift_bridgeObjectRelease();
    }
    else
    {
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v7 = sub_243DFAE90();
        (*(void (**)(void **, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
        a1 = (void **)((char *)a1 + *(int *)(type metadata accessor for BankConnectWebAuthorizationFlow(0) + 20));
        uint64_t v4 = sub_243DFBC00();
      }
      else
      {
        if (EnumCaseMultiPayload) {
          return;
        }
        uint64_t v4 = sub_243DFAE90();
      }
      uint64_t v8 = *(void (**)(void **, uint64_t))(*(void *)(v4 - 8) + 8);
      v8(a1, v4);
    }
  }
}

void *sub_243DDFFF8(void *a1, id *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    id v4 = *a2;
    id v5 = *a2;
    *a1 = v4;
  }
  else
  {
    type metadata accessor for BankConnectAuthorizationFlow(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v12 = sub_243DFAE90();
      (*(void (**)(void *, id *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
      uint64_t v13 = type metadata accessor for BankConnectExtensionAuthorizationFlow(0);
      uint64_t v14 = *(int *)(v13 + 20);
      long long v15 = *(_OWORD *)((char *)a2 + v14 + 24);
      *(_OWORD *)((char *)a1 + v14 + 24) = v15;
      (**(void (***)(void))(v15 - 8))();
      *(void *)((char *)a1 + *(int *)(v13 + 24)) = *(id *)((char *)a2 + *(int *)(v13 + 24));
      swift_bridgeObjectRetain();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_243DFAE90();
      (*(void (**)(void *, id *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = *(int *)(type metadata accessor for BankConnectWebAuthorizationFlow(0) + 20);
      id v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = sub_243DFBC00();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      uint64_t v16 = sub_243DFAE90();
      (*(void (**)(void *, id *, uint64_t))(*(void *)(v16 - 8) + 16))(a1, a2, v16);
    }
    swift_storeEnumTagMultiPayload();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

id *sub_243DE0220(id *a1, id *a2)
{
  if (a1 != a2)
  {
    sub_243DE1DC8((uint64_t)a1, type metadata accessor for BankConnectReconnectAccountsResult);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      id v4 = *a2;
      id v5 = *a2;
      *a1 = v4;
    }
    else
    {
      type metadata accessor for BankConnectAuthorizationFlow(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        uint64_t v12 = sub_243DFAE90();
        (*(void (**)(id *, id *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        uint64_t v13 = type metadata accessor for BankConnectExtensionAuthorizationFlow(0);
        uint64_t v14 = *(int *)(v13 + 20);
        long long v15 = (char *)a1 + v14;
        uint64_t v16 = *(uint64_t *)((char *)a2 + v14 + 24);
        *((void *)v15 + 3) = v16;
        *((void *)v15 + 4) = *(id *)((char *)a2 + v14 + 32);
        (**(void (***)(void))(v16 - 8))();
        *(id *)((char *)a1 + *(int *)(v13 + 24)) = *(id *)((char *)a2 + *(int *)(v13 + 24));
        swift_bridgeObjectRetain();
      }
      else if (EnumCaseMultiPayload == 1)
      {
        uint64_t v7 = sub_243DFAE90();
        (*(void (**)(id *, id *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        uint64_t v8 = *(int *)(type metadata accessor for BankConnectWebAuthorizationFlow(0) + 20);
        id v9 = (char *)a1 + v8;
        uint64_t v10 = (char *)a2 + v8;
        uint64_t v11 = sub_243DFBC00();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      }
      else
      {
        uint64_t v17 = sub_243DFAE90();
        (*(void (**)(id *, id *, uint64_t))(*(void *)(v17 - 8) + 16))(a1, a2, v17);
      }
      swift_storeEnumTagMultiPayload();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t type metadata accessor for BankConnectReconnectAccountsResult(uint64_t a1)
{
  return sub_243A651B0(a1, (uint64_t *)&unk_268E22E70);
}

char *sub_243DE0490(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    type metadata accessor for BankConnectAuthorizationFlow(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v12 = sub_243DFAE90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(a1, a2, v12);
      uint64_t v13 = type metadata accessor for BankConnectExtensionAuthorizationFlow(0);
      uint64_t v14 = *(int *)(v13 + 20);
      long long v15 = &a1[v14];
      uint64_t v16 = &a2[v14];
      long long v17 = *((_OWORD *)v16 + 1);
      *(_OWORD *)long long v15 = *(_OWORD *)v16;
      *((_OWORD *)v15 + 1) = v17;
      *((void *)v15 + 4) = *((void *)v16 + 4);
      *(void *)&a1[*(int *)(v13 + 24)] = *(void *)&a2[*(int *)(v13 + 24)];
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = sub_243DFAE90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      uint64_t v8 = *(int *)(type metadata accessor for BankConnectWebAuthorizationFlow(0) + 20);
      id v9 = &a1[v8];
      uint64_t v10 = &a2[v8];
      uint64_t v11 = sub_243DFBC00();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    }
    else
    {
      uint64_t v18 = sub_243DFAE90();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a1, a2, v18);
    }
    swift_storeEnumTagMultiPayload();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_243DE0678(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_243DE1DC8((uint64_t)a1, type metadata accessor for BankConnectReconnectAccountsResult);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      type metadata accessor for BankConnectAuthorizationFlow(0);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        uint64_t v12 = sub_243DFAE90();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(a1, a2, v12);
        uint64_t v13 = type metadata accessor for BankConnectExtensionAuthorizationFlow(0);
        uint64_t v14 = *(int *)(v13 + 20);
        long long v15 = &a1[v14];
        uint64_t v16 = &a2[v14];
        long long v17 = *((_OWORD *)v16 + 1);
        *(_OWORD *)long long v15 = *(_OWORD *)v16;
        *((_OWORD *)v15 + 1) = v17;
        *((void *)v15 + 4) = *((void *)v16 + 4);
        *(void *)&a1[*(int *)(v13 + 24)] = *(void *)&a2[*(int *)(v13 + 24)];
      }
      else if (EnumCaseMultiPayload == 1)
      {
        uint64_t v7 = sub_243DFAE90();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
        uint64_t v8 = *(int *)(type metadata accessor for BankConnectWebAuthorizationFlow(0) + 20);
        id v9 = &a1[v8];
        uint64_t v10 = &a2[v8];
        uint64_t v11 = sub_243DFBC00();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
      }
      else
      {
        uint64_t v18 = sub_243DFAE90();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a1, a2, v18);
      }
      swift_storeEnumTagMultiPayload();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_243DE0884()
{
  uint64_t result = type metadata accessor for BankConnectAuthorizationFlow(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_243DE0914@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for BankConnectReconnectAccountsViewModel(0);
  uint64_t result = sub_243DFC320();
  *a1 = result;
  return result;
}

uint64_t sub_243DE0954@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v52 = a1;
  uint64_t v53 = a4;
  char v6 = a3 & 1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22E98);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22EA0);
  uint64_t v12 = v11 - 8;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v51 = (uint64_t)&v50 - v16;
  sub_243DFD710();
  uint64_t v54 = a1;
  uint64_t v55 = a2;
  char v56 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E22EA8);
  sub_243DE1F78();
  sub_243DFC4C0();
  uint64_t v17 = sub_243DFC970();
  char v18 = sub_243DFD740();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v14, v10, v7);
  uint64_t v19 = &v14[*(int *)(v12 + 44)];
  *(void *)uint64_t v19 = v17;
  v19[8] = v18;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v20 = v51;
  sub_243DE2080((uint64_t)v14, v51);
  sub_243DE18B8(v52, a2, v6, (uint64_t)&v83);
  long long v63 = v89;
  long long v64 = v90;
  v65[0] = v91[0];
  *(_OWORD *)((char *)v65 + 10) = *(_OWORD *)((char *)v91 + 10);
  long long v59 = v85;
  long long v60 = v86;
  long long v61 = v87;
  long long v62 = v88;
  long long v57 = v83;
  long long v58 = v84;
  LOBYTE(v8) = sub_243DFD750();
  sub_243DFC480();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  char v66 = 0;
  char v29 = sub_243DFD720();
  sub_243DFC480();
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  char v67 = 0;
  sub_243DE20E8(v20, (uint64_t)v14);
  LOBYTE(v17) = v67;
  uint64_t v38 = v53;
  sub_243DE20E8((uint64_t)v14, v53);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22ED8);
  uint64_t v40 = v38 + *(int *)(v39 + 48);
  *(void *)uint64_t v40 = 0;
  *(unsigned char *)(v40 + 8) = 1;
  uint64_t v41 = (_OWORD *)(v38 + *(int *)(v39 + 64));
  long long v70 = v59;
  long long v71 = v60;
  long long v68 = v57;
  long long v69 = v58;
  long long v74 = v63;
  long long v75 = v64;
  long long v76 = v65[0];
  long long v77 = v65[1];
  long long v72 = v61;
  long long v73 = v62;
  LOBYTE(v78) = v8;
  *((void *)&v78 + 1) = v22;
  *(void *)&long long v79 = v24;
  *((void *)&v79 + 1) = v26;
  *(void *)&long long v80 = v28;
  BYTE8(v80) = 0;
  LOBYTE(v81) = v29;
  *((void *)&v81 + 1) = v31;
  *(void *)&v82[0] = v33;
  *((void *)&v82[0] + 1) = v35;
  *(void *)&v82[1] = v37;
  BYTE8(v82[1]) = v17;
  long long v42 = v65[1];
  v41[8] = v65[0];
  v41[9] = v42;
  long long v43 = v73;
  v41[4] = v72;
  v41[5] = v43;
  long long v44 = v75;
  v41[6] = v74;
  v41[7] = v44;
  long long v45 = v69;
  *uint64_t v41 = v68;
  v41[1] = v45;
  long long v46 = v71;
  v41[2] = v70;
  v41[3] = v46;
  long long v47 = v81;
  v41[12] = v80;
  v41[13] = v47;
  v41[14] = v82[0];
  *(_OWORD *)((char *)v41 + 233) = *(_OWORD *)((char *)v82 + 9);
  long long v48 = v79;
  v41[10] = v78;
  v41[11] = v48;
  sub_243A6388C((uint64_t)&v68);
  sub_243DE2150(v20);
  long long v89 = v63;
  long long v90 = v64;
  v91[0] = v65[0];
  v91[1] = v65[1];
  long long v85 = v59;
  long long v86 = v60;
  long long v87 = v61;
  long long v88 = v62;
  long long v83 = v57;
  long long v84 = v58;
  char v92 = v8;
  uint64_t v93 = v22;
  uint64_t v94 = v24;
  uint64_t v95 = v26;
  uint64_t v96 = v28;
  char v97 = 0;
  char v98 = v29;
  uint64_t v99 = v31;
  uint64_t v100 = v33;
  uint64_t v101 = v35;
  uint64_t v102 = v37;
  char v103 = v17;
  sub_243A638C4((uint64_t)&v83);
  return sub_243DE2150((uint64_t)v14);
}

void *sub_243DE0D5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_243DFCFF0();
  sub_243DE0E8C((uint64_t)__src);
  v24[312] = 0;
  memcpy(&v24[7], __src, 0x131uLL);
  char v3 = sub_243DFD740();
  sub_243DFC480();
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  char v25 = 0;
  char v12 = sub_243DFD720();
  sub_243DFC480();
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  char v21 = v25;
  char v26 = 0;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t result = memcpy((void *)(a1 + 17), v24, 0x138uLL);
  *(unsigned char *)(a1 + 336) = v3;
  *(void *)(a1 + 344) = v5;
  *(void *)(a1 + 352) = v7;
  *(void *)(a1 + 360) = v9;
  *(void *)(a1 + 368) = v11;
  *(unsigned char *)(a1 + 376) = v21;
  *(unsigned char *)(a1 + 384) = v12;
  *(void *)(a1 + 392) = v14;
  *(void *)(a1 + 400) = v16;
  *(void *)(a1 + 408) = v18;
  *(void *)(a1 + 416) = v20;
  *(unsigned char *)(a1 + 424) = v26;
  return result;
}

uint64_t sub_243DE0E8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_243DF8B70();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BankConnectReconnectAccountsViewModel(0);
  sub_243DE21B0();
  uint64_t v6 = sub_243DFC550();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6 + OBJC_IVAR____TtC12FinanceKitUI37BankConnectReconnectAccountsViewModel_institution, v2);
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  v96[0] = 0;
  LOBYTE(v81) = 0;
  sub_243DFE1C0();
  uint64_t v73 = v76;
  v95[0] = v75;
  uint64_t v81 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18590);
  sub_243DFE1C0();
  id v69 = v75;
  uint64_t v70 = v76;
  uint64_t v68 = sub_243DF8B50();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  LODWORD(v2) = v96[0];
  int v66 = v95[0];
  int v65 = sub_243DFD750();
  sub_243DFC480();
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  sub_243DE14FC((uint64_t)&v75);
  uint64_t v17 = (uint64_t)v75;
  uint64_t v18 = v76;
  unsigned __int8 v19 = v77;
  int v64 = v77;
  uint64_t v62 = v78;
  uint64_t v61 = v79;
  int v63 = v80;
  int v60 = sub_243DFD750();
  sub_243DFC480();
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  sub_243DE1700((uint64_t)&v75);
  uint64_t v28 = v75;
  uint64_t v54 = (uint64_t)v75;
  uint64_t v58 = v76;
  unsigned __int8 v29 = v77;
  int v67 = v77;
  uint64_t v71 = v78;
  uint64_t v72 = v79;
  int v59 = v80;
  int v57 = sub_243DFD750();
  sub_243DFC480();
  int v30 = v2;
  char v97 = v2;
  char v94 = 0;
  unsigned __int8 v92 = v19;
  char v88 = 0;
  unsigned __int8 v86 = v29;
  char v82 = 0;
  *(_DWORD *)(a1 + 17) = v75;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)((char *)&v75 + 3);
  *(_DWORD *)(a1 + 33) = v81;
  *(_DWORD *)(a1 + 36) = *(_DWORD *)((char *)&v81 + 3);
  *(_DWORD *)(a1 + 41) = *(_DWORD *)v96;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)&v96[3];
  int v31 = *(_DWORD *)v95;
  *(_DWORD *)(a1 + 76) = *(_DWORD *)&v95[3];
  *(_DWORD *)(a1 + 73) = v31;
  LOBYTE(v31) = v94;
  int v32 = *(_DWORD *)v93;
  *(_DWORD *)(a1 + 116) = *(_DWORD *)&v93[3];
  *(_DWORD *)(a1 + 113) = v32;
  LOBYTE(v32) = v92;
  int v33 = *(_DWORD *)v91;
  *(_DWORD *)(a1 + 140) = *(_DWORD *)&v91[3];
  *(_DWORD *)(a1 + 137) = v33;
  int v34 = *(_DWORD *)v90;
  *(_DWORD *)(a1 + 164) = *(_DWORD *)&v90[3];
  *(_DWORD *)(a1 + 161) = v34;
  int v35 = *(_DWORD *)v89;
  *(_DWORD *)(a1 + 172) = *(_DWORD *)&v89[3];
  *(_DWORD *)(a1 + 169) = v35;
  LOBYTE(v35) = v88;
  int v36 = *(_DWORD *)v87;
  *(_DWORD *)(a1 + 212) = *(_DWORD *)&v87[3];
  *(_DWORD *)(a1 + 209) = v36;
  LOBYTE(v36) = v86;
  int v37 = *(_DWORD *)v85;
  *(_DWORD *)(a1 + 236) = *(_DWORD *)&v85[3];
  *(_DWORD *)(a1 + 233) = v37;
  int v38 = *(_DWORD *)v84;
  *(_DWORD *)(a1 + 260) = *(_DWORD *)&v84[3];
  *(_DWORD *)(a1 + 257) = v38;
  int v39 = *(_DWORD *)v83;
  *(_DWORD *)(a1 + 268) = *(_DWORD *)&v83[3];
  *(_DWORD *)(a1 + 265) = v39;
  LOBYTE(v37) = v82;
  *(void *)a1 = v68;
  *(void *)(a1 + 8) = v8;
  uint64_t v55 = v8;
  *(unsigned char *)(a1 + 16) = 3;
  uint64_t v40 = KeyPath;
  *(void *)(a1 + 24) = KeyPath;
  *(unsigned char *)(a1 + 32) = v30;
  int v56 = v30;
  *(unsigned char *)(a1 + 40) = v66;
  id v41 = v69;
  *(void *)(a1 + 48) = v73;
  *(void *)(a1 + 56) = v41;
  *(void *)(a1 + 64) = v70;
  *(unsigned char *)(a1 + 72) = v65;
  *(void *)(a1 + 80) = v10;
  *(void *)(a1 + 88) = v12;
  *(void *)(a1 + 96) = v14;
  *(void *)(a1 + 104) = v16;
  *(unsigned char *)(a1 + 112) = v31;
  *(void *)(a1 + 120) = v17;
  *(void *)(a1 + 128) = v18;
  *(unsigned char *)(a1 + 136) = v32;
  uint64_t v42 = v61;
  *(void *)(a1 + 144) = v62;
  *(void *)(a1 + 152) = v42;
  *(unsigned char *)(a1 + 160) = v63;
  *(unsigned char *)(a1 + 168) = v60;
  *(void *)(a1 + 176) = v21;
  *(void *)(a1 + 184) = v23;
  *(void *)(a1 + 192) = v25;
  *(void *)(a1 + 200) = v27;
  *(unsigned char *)(a1 + 208) = v35;
  *(void *)(a1 + 216) = v28;
  uint64_t v43 = v58;
  *(void *)(a1 + 224) = v58;
  *(unsigned char *)(a1 + 232) = v36;
  uint64_t v44 = v72;
  *(void *)(a1 + 240) = v71;
  *(void *)(a1 + 248) = v44;
  *(unsigned char *)(a1 + 256) = v59;
  *(unsigned char *)(a1 + 264) = v57;
  *(void *)(a1 + 272) = v45;
  *(void *)(a1 + 280) = v46;
  *(void *)(a1 + 288) = v47;
  *(void *)(a1 + 296) = v48;
  *(unsigned char *)(a1 + 304) = v37;
  swift_bridgeObjectRetain();
  sub_243A556F8(v40, v30);
  swift_retain();
  swift_retain();
  id v69 = v69;
  LOBYTE(a1) = v64;
  sub_243A63AD4(v17, v18, v64);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v49 = v54;
  uint64_t v50 = v43;
  uint64_t v51 = v43;
  LOBYTE(v43) = v67;
  sub_243A63AD4(v54, v51, v67);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_243A56688(v49, v50, v43);
  swift_release();
  swift_bridgeObjectRelease();
  sub_243A56688(v17, v18, a1);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_243A557AC(KeyPath, v56);
  swift_release();

  return swift_release();
}

uint64_t sub_243DE14FC@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B0CDA78 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_26B0CDAA0;
  uint64_t v3 = (void *)sub_243DFE8E0();
  uint64_t v4 = sub_243DFE8E0();
  uint64_t v5 = (void *)sub_243DFE8E0();
  id v6 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, v5);

  sub_243DFE910();
  sub_243A56634();
  uint64_t v7 = sub_243DFDAA0();
  uint64_t v9 = v8;
  LOBYTE(v5) = v10 & 1;
  sub_243DFD7A0();
  uint64_t v11 = sub_243DFDA10();
  uint64_t v13 = v12;
  char v15 = v14;
  swift_release();
  sub_243A56688(v7, v9, (char)v5);
  swift_bridgeObjectRelease();
  sub_243DFD810();
  uint64_t v16 = sub_243DFD9A0();
  uint64_t v18 = v17;
  LOBYTE(v4) = v19;
  uint64_t v21 = v20;
  sub_243A56688(v11, v13, v15 & 1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = v16;
  *(void *)(a1 + 8) = v18;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v21;
  *(void *)(a1 + 32) = result;
  *(unsigned char *)(a1 + 40) = 1;
  return result;
}

uint64_t sub_243DE1700@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B0CDA78 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_26B0CDAA0;
  uint64_t v3 = (void *)sub_243DFE8E0();
  uint64_t v4 = (void *)sub_243DFE8E0();
  uint64_t v5 = (void *)sub_243DFE8E0();
  id v6 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, v5);

  sub_243DFE910();
  sub_243A56634();
  uint64_t v7 = sub_243DFDAA0();
  uint64_t v9 = v8;
  LOBYTE(v5) = v10 & 1;
  sub_243DFD7E0();
  uint64_t v11 = sub_243DFDA10();
  uint64_t v13 = v12;
  char v15 = v14;
  uint64_t v17 = v16;
  swift_release();
  sub_243A56688(v7, v9, (char)v5);
  swift_bridgeObjectRelease();
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = v11;
  *(void *)(a1 + 8) = v13;
  *(unsigned char *)(a1 + 16) = v15 & 1;
  *(void *)(a1 + 24) = v17;
  *(void *)(a1 + 32) = result;
  *(unsigned char *)(a1 + 40) = 1;
  return result;
}

double sub_243DE18B8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  if (qword_26B0CDA78 != -1) {
    swift_once();
  }
  uint64_t v8 = (void *)qword_26B0CDAA0;
  uint64_t v9 = (void *)sub_243DFE8E0();
  char v10 = (void *)sub_243DFE8E0();
  uint64_t v11 = (void *)sub_243DFE8E0();
  id v12 = objc_msgSend(v8, sel_localizedStringForKey_value_table_, v9, v10, v11);

  uint64_t v13 = sub_243DFE910();
  uint64_t v15 = v14;

  type metadata accessor for BankConnectReconnectAccountsViewModel(0);
  sub_243DE21B0();
  LOBYTE(v10) = a3 & 1;
  sub_243DFC550();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243DFC390();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *(void *)(v16 + 24) = a2;
  *(unsigned char *)(v16 + 32) = (_BYTE)v10;
  sub_243A65398();
  sub_243DFE4F0();
  sub_243DFCA30();
  *(void *)a4 = v13;
  *(void *)(a4 + 8) = v15;
  *(unsigned char *)(a4 + 16) = v18;
  *(void *)(a4 + 24) = sub_243DE2244;
  *(void *)(a4 + 32) = v16;
  *(void *)(a4 + 40) = v18;
  *(unsigned char *)(a4 + 48) = v19;
  *(void *)(a4 + 56) = v20;
  *(unsigned char *)(a4 + 64) = v21;
  *(void *)(a4 + 72) = v22;
  *(unsigned char *)(a4 + 80) = v23;
  *(void *)(a4 + 88) = v24;
  *(unsigned char *)(a4 + 96) = v25;
  *(void *)(a4 + 104) = v26;
  *(unsigned char *)(a4 + 112) = v27;
  *(void *)(a4 + 120) = v28;
  *(unsigned char *)(a4 + 128) = v29;
  double result = *(double *)&v30;
  *(_OWORD *)(a4 + 136) = v30;
  *(_WORD *)(a4 + 152) = 256;
  return result;
}

uint64_t sub_243DE1B7C()
{
  uint64_t v0 = *MEMORY[0x263F5C4C0];
  sub_243B8857C(MEMORY[0x263F8EE78]);
  sub_243A6BB90(24, v0, 11);
  swift_bridgeObjectRelease();
  type metadata accessor for BankConnectReconnectAccountsViewModel(0);
  sub_243DE21B0();
  sub_243DFC550();
  uint64_t v1 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  sub_243DDEA08((uint64_t)&unk_268E22EF0, v1);
  swift_release();
  return swift_release_n();
}

uint64_t sub_243DE1C74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  char v5 = *(unsigned char *)(v1 + 16);
  *(void *)a1 = sub_243DFCFF0();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22E90);
  return sub_243DE0954(v3, v4, v5, a1 + *(int *)(v6 + 44));
}

uint64_t sub_243DE1CD4@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_243DFC390();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_243DE1D54()
{
  return sub_243DFC3A0();
}

uint64_t sub_243DE1DC8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_243DE1E30()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_243DE1E78(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_243A66978;
  return sub_243DDEB8C(a1, v4, v5, v6, v7, v8);
}

ValueMetadata *type metadata accessor for BankConnectReconnectAccountsView()
{
  return &type metadata for BankConnectReconnectAccountsView;
}

uint64_t sub_243DE1F50()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_243DE1F6C@<X0>(uint64_t a1@<X8>)
{
  return sub_243DE0D5C(a1);
}

unint64_t sub_243DE1F78()
{
  unint64_t result = qword_268E22EB0;
  if (!qword_268E22EB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22EA8);
    sub_243DE1FF4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22EB0);
  }
  return result;
}

unint64_t sub_243DE1FF4()
{
  unint64_t result = qword_268E22EB8;
  if (!qword_268E22EB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22EC0);
    sub_243D1CD90(&qword_268E22EC8, &qword_268E22ED0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22EB8);
  }
  return result;
}

uint64_t sub_243DE2080(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22EA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_243DE20E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22EA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_243DE2150(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22EA0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_243DE21B0()
{
  unint64_t result = qword_268E22EE0;
  if (!qword_268E22EE0)
  {
    type metadata accessor for BankConnectReconnectAccountsViewModel(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268E22EE0);
  }
  return result;
}

uint64_t sub_243DE2208()
{
  sub_243A654A8();

  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_243DE2244()
{
  return sub_243DE1B7C();
}

uint64_t sub_243DE2250()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_243DE2288()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_243A66048;
  return sub_243DDE5D0(v0);
}

uint64_t sub_243DE2318(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_243DE2390()
{
  return sub_243D1CD90(&qword_268E22EF8, &qword_268E22F00);
}

Swift::Void __swiftcall CopyStringAction.callAsFunction(_:)(Swift::String a1)
{
  id v1 = objc_msgSend(self, sel_generalPasteboard);
  id v2 = (id)sub_243DFE8E0();
  objc_msgSend(v1, sel_setString_, v2);
}

uint64_t EnvironmentValues.copyString.getter()
{
  sub_243DE2494();

  return sub_243DFCDE0();
}

unint64_t sub_243DE2494()
{
  unint64_t result = qword_268E22F08;
  if (!qword_268E22F08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22F08);
  }
  return result;
}

uint64_t sub_243DE24E8()
{
  return sub_243DFCDE0();
}

uint64_t sub_243DE2520()
{
  return sub_243DFCDF0();
}

uint64_t EnvironmentValues.copyString.setter()
{
  sub_243DE2494();

  return sub_243DFCDF0();
}

uint64_t EnvironmentValues.copyURL.getter()
{
  sub_243DE25D8();

  return sub_243DFCDE0();
}

unint64_t sub_243DE25D8()
{
  unint64_t result = qword_268E22F10;
  if (!qword_268E22F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22F10);
  }
  return result;
}

uint64_t sub_243DE262C()
{
  return sub_243DFCDE0();
}

uint64_t sub_243DE2664()
{
  return sub_243DFCDF0();
}

uint64_t EnvironmentValues.copyURL.setter()
{
  sub_243DE25D8();

  return sub_243DFCDF0();
}

void CopyURLAction.callAsFunction(_:)()
{
  id v0 = objc_msgSend(self, sel_generalPasteboard);
  id v1 = (id)sub_243DFBB30();
  objc_msgSend(v0, sel_setURL_, v1);
}

uint64_t (*EnvironmentValues.copyString.modify(void *a1))()
{
  *a1 = v1;
  a1[1] = sub_243DE2494();
  sub_243DFCDE0();
  return sub_243DE27AC;
}

uint64_t sub_243DE27AC()
{
  return sub_243DFCDF0();
}

uint64_t (*EnvironmentValues.copyURL.modify(void *a1))()
{
  *a1 = v1;
  a1[1] = sub_243DE25D8();
  sub_243DFCDE0();
  return sub_243DE2834;
}

uint64_t sub_243DE2834()
{
  return sub_243DFCDF0();
}

uint64_t sub_243DE2864()
{
  return sub_243DFCDE0();
}

uint64_t sub_243DE289C()
{
  return sub_243DFCDF0();
}

uint64_t sub_243DE28D4()
{
  return sub_243DFCDE0();
}

uint64_t sub_243DE290C()
{
  return sub_243DFCDF0();
}

ValueMetadata *type metadata accessor for CopyStringAction()
{
  return &type metadata for CopyStringAction;
}

ValueMetadata *type metadata accessor for CopyURLAction()
{
  return &type metadata for CopyURLAction;
}

ValueMetadata *_s13__Key_copyURLVMa()
{
  return &_s13__Key_copyURLVN;
}

ValueMetadata *_s16__Key_copyStringVMa()
{
  return &_s16__Key_copyStringVN;
}

uint64_t *sub_243DE2984(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v24 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = type metadata accessor for MerchantImage.ViewModel(0);
    uint64_t v8 = *(int *)(v7 + 20);
    uint64_t v9 = (char *)v4 + v8;
    char v10 = (char *)a2 + v8;
    uint64_t v11 = sub_243DFB3F0();
    id v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(v7 + 24);
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = *(int *)(type metadata accessor for ReturnDetailsHeader.ViewModel(0) + 20);
    uint64_t v18 = (char *)v4 + v17;
    char v19 = (char *)a2 + v17;
    uint64_t v20 = sub_243DFBE80();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    swift_bridgeObjectRetain();
    long long v85 = v22;
    if (v22(v19, 1, v20))
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
      memcpy(v18, v19, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    unsigned __int8 v86 = (int *)type metadata accessor for ReturnDetailsContentsSection.ViewModel(0);
    uint64_t v25 = v86[5];
    uint64_t v26 = (char *)v4 + v25;
    char v27 = (char *)a2 + v25;
    uint64_t v28 = sub_243DFB1E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
    uint64_t v29 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
    uint64_t v30 = *(int *)(v29 + 20);
    int v31 = &v26[v30];
    int v32 = &v27[v30];
    if (v85(&v27[v30], 1, v20))
    {
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
      memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v31, v32, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v31, 0, 1, v20);
    }
    uint64_t v34 = *(int *)(v29 + 24);
    int v35 = &v26[v34];
    int v36 = &v27[v34];
    uint64_t v37 = type metadata accessor for OrderDetailsNote(0);
    uint64_t v38 = *(void *)(v37 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37))
    {
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE8);
      memcpy(v35, v36, *(void *)(*(void *)(v39 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v43 = *((void *)v36 + 1);
        *(void *)int v35 = *(void *)v36;
        *((void *)v35 + 1) = v43;
        uint64_t v44 = *((void *)v36 + 3);
        *((void *)v35 + 2) = *((void *)v36 + 2);
        *((void *)v35 + 3) = v44;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v45 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
        uint64_t v46 = &v35[v45];
        uint64_t v47 = &v36[v45];
        uint64_t v48 = sub_243DFB220();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 16))(v46, v47, v48);
      }
      else
      {
        uint64_t v40 = *((void *)v36 + 1);
        *(void *)int v35 = *(void *)v36;
        *((void *)v35 + 1) = v40;
        uint64_t v41 = *((void *)v36 + 2);
        uint64_t v42 = *((void *)v36 + 3);
        *((void *)v35 + 2) = v41;
        *((void *)v35 + 3) = v42;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
    }
    uint64_t v49 = v86[6];
    uint64_t v50 = (uint64_t *)((char *)v4 + v49);
    uint64_t v51 = (uint64_t *)((char *)a2 + v49);
    uint64_t v52 = v51[1];
    void *v50 = *v51;
    v50[1] = v52;
    uint64_t v53 = v86[7];
    uint64_t v54 = (uint64_t *)((char *)v4 + v53);
    uint64_t v55 = (uint64_t *)((char *)a2 + v53);
    uint64_t v56 = v55[1];
    *uint64_t v54 = *v55;
    v54[1] = v56;
    uint64_t v57 = v86[8];
    uint64_t v58 = (uint64_t *)((char *)v4 + v57);
    int v59 = (uint64_t *)((char *)a2 + v57);
    uint64_t v60 = v59[1];
    void *v58 = *v59;
    v58[1] = v60;
    uint64_t v61 = v86[9];
    uint64_t v62 = (uint64_t *)((char *)v4 + v61);
    int v63 = (uint64_t *)((char *)a2 + v61);
    uint64_t v64 = v63[1];
    *uint64_t v62 = *v63;
    v62[1] = v64;
    uint64_t v65 = v86[10];
    int v66 = (uint64_t *)((char *)v4 + v65);
    int v67 = (uint64_t *)((char *)a2 + v65);
    uint64_t v68 = v67[1];
    *int v66 = *v67;
    v66[1] = v68;
    *(uint64_t *)((char *)v4 + v86[11]) = *(uint64_t *)((char *)a2 + v86[11]);
    uint64_t v69 = a3[5];
    uint64_t v70 = a3[6];
    uint64_t v71 = (char *)v4 + v69;
    uint64_t v72 = (char *)a2 + v69;
    long long v73 = *((_OWORD *)v72 + 4);
    *((_OWORD *)v71 + 3) = *((_OWORD *)v72 + 3);
    *((_OWORD *)v71 + 4) = v73;
    *(_OWORD *)(v71 + 73) = *(_OWORD *)(v72 + 73);
    long long v75 = *((_OWORD *)v72 + 1);
    long long v74 = *((_OWORD *)v72 + 2);
    uint64_t v76 = *((void *)v72 + 1);
    *(void *)uint64_t v71 = *(void *)v72;
    *((void *)v71 + 1) = v76;
    *((_OWORD *)v71 + 1) = v75;
    *((_OWORD *)v71 + 2) = v74;
    long long v87 = (uint64_t *)((char *)v4 + v70);
    unsigned __int8 v77 = (uint64_t *)((char *)a2 + v70);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v78 = sub_243DFC8E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v78 - 8) + 16))(v87, v77, v78);
    }
    else
    {
      *long long v87 = *v77;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v79 = a3[7];
    unsigned __int8 v80 = (char *)v4 + v79;
    uint64_t v81 = (char *)a2 + v79;
    uint64_t v82 = *(void *)v81;
    char v83 = v81[8];
    sub_243AFDCBC(*(void *)v81, v83);
    *(void *)unsigned __int8 v80 = v82;
    v80[8] = v83;
  }
  return v4;
}

uint64_t type metadata accessor for ReturnDetailsContentsSection.ViewModel(uint64_t a1)
{
  return sub_243A651B0(a1, (uint64_t *)&unk_268E22F28);
}

uint64_t sub_243DE2FDC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(type metadata accessor for MerchantImage.ViewModel(0) + 20);
  uint64_t v5 = sub_243DFB3F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(type metadata accessor for ReturnDetailsHeader.ViewModel(0) + 20);
  uint64_t v7 = sub_243DFBE80();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (!v9(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  uint64_t v10 = a1 + *(int *)(type metadata accessor for ReturnDetailsContentsSection.ViewModel(0) + 20);
  uint64_t v11 = sub_243DFB1E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
  uint64_t v13 = v10 + *(int *)(v12 + 20);
  if (!v9(v13, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v13, v7);
  }
  uint64_t v14 = v10 + *(int *)(v12 + 24);
  uint64_t v15 = type metadata accessor for OrderDetailsNote(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v14, 1, v15))
  {
    unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v17 = v14 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
      uint64_t v18 = sub_243DFB220();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
    }
    else if (EnumCaseMultiPayload <= 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v19 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = sub_243DFC8E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
  }
  else
  {
    swift_release();
  }
  uint64_t v21 = a1 + *(int *)(a2 + 28);
  uint64_t v22 = *(void *)v21;
  char v23 = *(unsigned char *)(v21 + 8);

  return sub_243AFDCC0(v22, v23);
}

void *sub_243DE337C(void *a1, void *a2, int *a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = type metadata accessor for MerchantImage.ViewModel(0);
  uint64_t v7 = *(int *)(v6 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_243DFB3F0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(v6 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = *(int *)(type metadata accessor for ReturnDetailsHeader.ViewModel(0) + 20);
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = sub_243DFBE80();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  swift_bridgeObjectRetain();
  char v83 = v21;
  if (v21(v18, 1, v19))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
    memcpy(v17, v18, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  long long v84 = (int *)type metadata accessor for ReturnDetailsContentsSection.ViewModel(0);
  uint64_t v23 = v84[5];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_243DFB1E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
  uint64_t v27 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
  uint64_t v28 = *(int *)(v27 + 20);
  uint64_t v29 = &v24[v28];
  uint64_t v30 = &v25[v28];
  if (v83(&v25[v28], 1, v19))
  {
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
    memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v29, v30, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v29, 0, 1, v19);
  }
  uint64_t v32 = *(int *)(v27 + 24);
  uint64_t v33 = &v24[v32];
  uint64_t v34 = &v25[v32];
  uint64_t v35 = type metadata accessor for OrderDetailsNote(0);
  uint64_t v36 = *(void *)(v35 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
  {
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE8);
    memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v41 = *((void *)v34 + 1);
      *(void *)uint64_t v33 = *(void *)v34;
      *((void *)v33 + 1) = v41;
      uint64_t v42 = *((void *)v34 + 3);
      *((void *)v33 + 2) = *((void *)v34 + 2);
      *((void *)v33 + 3) = v42;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v43 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
      uint64_t v44 = &v33[v43];
      uint64_t v45 = &v34[v43];
      uint64_t v46 = sub_243DFB220();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
    }
    else
    {
      uint64_t v38 = *((void *)v34 + 1);
      *(void *)uint64_t v33 = *(void *)v34;
      *((void *)v33 + 1) = v38;
      uint64_t v39 = *((void *)v34 + 2);
      uint64_t v40 = *((void *)v34 + 3);
      *((void *)v33 + 2) = v39;
      *((void *)v33 + 3) = v40;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
  }
  uint64_t v47 = v84[6];
  uint64_t v48 = (void *)((char *)a1 + v47);
  uint64_t v49 = (void *)((char *)a2 + v47);
  uint64_t v50 = v49[1];
  *uint64_t v48 = *v49;
  v48[1] = v50;
  uint64_t v51 = v84[7];
  uint64_t v52 = (void *)((char *)a1 + v51);
  uint64_t v53 = (void *)((char *)a2 + v51);
  uint64_t v54 = v53[1];
  *uint64_t v52 = *v53;
  v52[1] = v54;
  uint64_t v55 = v84[8];
  uint64_t v56 = (void *)((char *)a1 + v55);
  uint64_t v57 = (void *)((char *)a2 + v55);
  uint64_t v58 = v57[1];
  void *v56 = *v57;
  v56[1] = v58;
  uint64_t v59 = v84[9];
  uint64_t v60 = (void *)((char *)a1 + v59);
  uint64_t v61 = (void *)((char *)a2 + v59);
  uint64_t v62 = v61[1];
  void *v60 = *v61;
  v60[1] = v62;
  uint64_t v63 = v84[10];
  uint64_t v64 = (void *)((char *)a1 + v63);
  uint64_t v65 = (void *)((char *)a2 + v63);
  uint64_t v66 = v65[1];
  *uint64_t v64 = *v65;
  v64[1] = v66;
  *(void *)((char *)a1 + v84[11]) = *(void *)((char *)a2 + v84[11]);
  uint64_t v67 = a3[5];
  uint64_t v68 = a3[6];
  uint64_t v69 = (char *)a1 + v67;
  uint64_t v70 = (char *)a2 + v67;
  long long v71 = *((_OWORD *)v70 + 4);
  *((_OWORD *)v69 + 3) = *((_OWORD *)v70 + 3);
  *((_OWORD *)v69 + 4) = v71;
  *(_OWORD *)(v69 + 73) = *(_OWORD *)(v70 + 73);
  long long v73 = *((_OWORD *)v70 + 1);
  long long v72 = *((_OWORD *)v70 + 2);
  uint64_t v74 = *((void *)v70 + 1);
  *(void *)uint64_t v69 = *(void *)v70;
  *((void *)v69 + 1) = v74;
  *((_OWORD *)v69 + 1) = v73;
  *((_OWORD *)v69 + 2) = v72;
  long long v85 = (void *)((char *)a1 + v68);
  long long v75 = (void *)((char *)a2 + v68);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v76 = sub_243DFC8E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v76 - 8) + 16))(v85, v75, v76);
  }
  else
  {
    *long long v85 = *v75;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v77 = a3[7];
  uint64_t v78 = (char *)a1 + v77;
  uint64_t v79 = (char *)a2 + v77;
  uint64_t v80 = *(void *)v79;
  char v81 = v79[8];
  sub_243AFDCBC(*(void *)v79, v81);
  *(void *)uint64_t v78 = v80;
  v78[8] = v81;
  return a1;
}

void *sub_243DE3964(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = type metadata accessor for MerchantImage.ViewModel(0);
  uint64_t v7 = *(int *)(v6 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_243DFB3F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(v6 + 24);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = *(int *)(type metadata accessor for ReturnDetailsHeader.ViewModel(0) + 20);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_243DFBE80();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  int v20 = v19(v15, 1, v17);
  int v21 = v19(v16, 1, v17);
  uint64_t v87 = v18;
  char v88 = a3;
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
LABEL_6:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
    memcpy(v15, v16, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 24))(v15, v16, v17);
LABEL_7:
  uint64_t v23 = (int *)type metadata accessor for ReturnDetailsContentsSection.ViewModel(0);
  uint64_t v24 = v23[5];
  long long v89 = a2;
  long long v90 = a1;
  uint64_t v25 = (char *)a1 + v24;
  uint64_t v26 = (char *)a2 + v24;
  uint64_t v27 = sub_243DFB1E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 24))(v25, v26, v27);
  uint64_t v28 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
  uint64_t v29 = *(int *)(v28 + 20);
  uint64_t v30 = &v25[v29];
  uint64_t v31 = &v26[v29];
  int v32 = v19(&v25[v29], 1, v17);
  int v33 = v19(v31, 1, v17);
  if (v32)
  {
    if (!v33)
    {
      (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v30, v31, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v87 + 56))(v30, 0, 1, v17);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v33)
  {
    (*(void (**)(char *, uint64_t))(v87 + 8))(v30, v17);
LABEL_12:
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
    memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v87 + 24))(v30, v31, v17);
LABEL_13:
  uint64_t v35 = *(int *)(v28 + 24);
  uint64_t v36 = &v25[v35];
  uint64_t v37 = &v26[v35];
  uint64_t v38 = type metadata accessor for OrderDetailsNote(0);
  uint64_t v39 = *(void *)(v38 - 8);
  uint64_t v40 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v39 + 48);
  int v41 = v40(v36, 1, v38);
  int v42 = v40(v37, 1, v38);
  if (v41)
  {
    if (!v42)
    {
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        *(void *)uint64_t v36 = *(void *)v37;
        *((void *)v36 + 1) = *((void *)v37 + 1);
        *((void *)v36 + 2) = *((void *)v37 + 2);
        *((void *)v36 + 3) = *((void *)v37 + 3);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v45 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
        uint64_t v46 = &v36[v45];
        uint64_t v47 = &v37[v45];
        uint64_t v48 = sub_243DFB220();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 16))(v46, v47, v48);
      }
      else
      {
        *(void *)uint64_t v36 = *(void *)v37;
        *((void *)v36 + 1) = *((void *)v37 + 1);
        *((void *)v36 + 2) = *((void *)v37 + 2);
        *((void *)v36 + 3) = *((void *)v37 + 3);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v38);
      goto LABEL_28;
    }
LABEL_19:
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE8);
    memcpy(v36, v37, *(void *)(*(void *)(v43 - 8) + 64));
LABEL_28:
    uint64_t v44 = v90;
    goto LABEL_29;
  }
  if (v42)
  {
    sub_243DEA850((uint64_t)v36, type metadata accessor for OrderDetailsNote);
    goto LABEL_19;
  }
  uint64_t v44 = v90;
  if (v90 != v89)
  {
    sub_243DEA850((uint64_t)v36, type metadata accessor for OrderDetailsNote);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      *(void *)uint64_t v36 = *(void *)v37;
      *((void *)v36 + 1) = *((void *)v37 + 1);
      *((void *)v36 + 2) = *((void *)v37 + 2);
      *((void *)v36 + 3) = *((void *)v37 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v83 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
      long long v84 = &v36[v83];
      long long v85 = &v37[v83];
      uint64_t v86 = sub_243DFB220();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v86 - 8) + 16))(v84, v85, v86);
    }
    else
    {
      *(void *)uint64_t v36 = *(void *)v37;
      *((void *)v36 + 1) = *((void *)v37 + 1);
      *((void *)v36 + 2) = *((void *)v37 + 2);
      *((void *)v36 + 3) = *((void *)v37 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_29:
  uint64_t v49 = v23[6];
  uint64_t v50 = (void *)((char *)v44 + v49);
  uint64_t v51 = (void *)((char *)v89 + v49);
  void *v50 = *v51;
  v50[1] = v51[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v52 = v23[7];
  uint64_t v53 = (void *)((char *)v44 + v52);
  uint64_t v54 = (void *)((char *)v89 + v52);
  void *v53 = *v54;
  v53[1] = v54[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v55 = v23[8];
  uint64_t v56 = (void *)((char *)v44 + v55);
  uint64_t v57 = (void *)((char *)v89 + v55);
  void *v56 = *v57;
  v56[1] = v57[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v58 = v23[9];
  uint64_t v59 = (void *)((char *)v44 + v58);
  uint64_t v60 = (void *)((char *)v89 + v58);
  *uint64_t v59 = *v60;
  v59[1] = v60[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v61 = v23[10];
  uint64_t v62 = (void *)((char *)v44 + v61);
  uint64_t v63 = (void *)((char *)v89 + v61);
  *uint64_t v62 = *v63;
  v62[1] = v63[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)v44 + v23[11]) = *(void *)((char *)v89 + v23[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v64 = v88[5];
  uint64_t v65 = (uint64_t)v44 + v64;
  uint64_t v66 = (char *)v89 + v64;
  *(void *)((char *)v44 + v64) = *(void *)((char *)v89 + v64);
  swift_retain();
  swift_release();
  *(void *)(v65 + 8) = *((void *)v66 + 1);
  swift_retain();
  swift_release();
  long long v67 = *((_OWORD *)v66 + 1);
  long long v68 = *((_OWORD *)v66 + 2);
  *(unsigned char *)(v65 + 48) = v66[48];
  *(_OWORD *)(v65 + 16) = v67;
  *(_OWORD *)(v65 + 32) = v68;
  long long v69 = *(_OWORD *)(v66 + 56);
  long long v70 = *(_OWORD *)(v66 + 72);
  *(unsigned char *)(v65 + 88) = v66[88];
  *(_OWORD *)(v65 + 72) = v70;
  *(_OWORD *)(v65 + 56) = v69;
  if (v44 != v89)
  {
    uint64_t v71 = v88[6];
    long long v72 = (void *)((char *)v44 + v71);
    long long v73 = (void *)((char *)v89 + v71);
    sub_243A56808((uint64_t)v44 + v71, &qword_268E18608);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v74 = sub_243DFC8E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v74 - 8) + 16))(v72, v73, v74);
    }
    else
    {
      *long long v72 = *v73;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v75 = v88[7];
  uint64_t v76 = (uint64_t)v44 + v75;
  uint64_t v77 = (char *)v89 + v75;
  uint64_t v78 = *(void *)v77;
  char v79 = v77[8];
  sub_243AFDCBC(*(void *)v77, v79);
  uint64_t v80 = *(void *)v76;
  char v81 = *(unsigned char *)(v76 + 8);
  *(void *)uint64_t v76 = v78;
  *(unsigned char *)(v76 + 8) = v79;
  sub_243AFDCC0(v80, v81);
  return v44;
}

_OWORD *sub_243DE4284(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = type metadata accessor for MerchantImage.ViewModel(0);
  uint64_t v7 = *(int *)(v6 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_243DFB3F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)((char *)a1 + *(int *)(v6 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v6 + 24));
  uint64_t v11 = *(int *)(type metadata accessor for ReturnDetailsHeader.ViewModel(0) + 20);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_243DFBE80();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v52 = v15;
  uint64_t v53 = a3;
  uint64_t v54 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v54(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v17 = (int *)type metadata accessor for ReturnDetailsContentsSection.ViewModel(0);
  uint64_t v18 = v17[5];
  uint64_t v19 = (char *)a1 + v18;
  int v20 = (char *)a2 + v18;
  uint64_t v21 = sub_243DFB1E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
  uint64_t v22 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
  uint64_t v23 = *(int *)(v22 + 20);
  uint64_t v24 = &v19[v23];
  uint64_t v25 = &v20[v23];
  if (v54(&v20[v23], 1, v14))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v24, v25, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v52 + 56))(v24, 0, 1, v14);
  }
  uint64_t v27 = *(int *)(v22 + 24);
  uint64_t v28 = &v19[v27];
  uint64_t v29 = &v20[v27];
  uint64_t v30 = type metadata accessor for OrderDetailsNote(0);
  uint64_t v31 = *(void *)(v30 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
  {
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE8);
    memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      long long v33 = *((_OWORD *)v29 + 1);
      *(_OWORD *)uint64_t v28 = *(_OWORD *)v29;
      *((_OWORD *)v28 + 1) = v33;
      uint64_t v34 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
      uint64_t v35 = &v28[v34];
      uint64_t v36 = &v29[v34];
      uint64_t v37 = sub_243DFB220();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 32))(v35, v36, v37);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v28, v29, *(void *)(v31 + 64));
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
  }
  *(_OWORD *)((char *)a1 + v17[6]) = *(_OWORD *)((char *)a2 + v17[6]);
  *(_OWORD *)((char *)a1 + v17[7]) = *(_OWORD *)((char *)a2 + v17[7]);
  *(_OWORD *)((char *)a1 + v17[8]) = *(_OWORD *)((char *)a2 + v17[8]);
  *(_OWORD *)((char *)a1 + v17[9]) = *(_OWORD *)((char *)a2 + v17[9]);
  *(_OWORD *)((char *)a1 + v17[10]) = *(_OWORD *)((char *)a2 + v17[10]);
  *(void *)((char *)a1 + v17[11]) = *(void *)((char *)a2 + v17[11]);
  uint64_t v38 = v53[5];
  uint64_t v39 = v53[6];
  uint64_t v40 = (_OWORD *)((char *)a1 + v38);
  int v41 = (_OWORD *)((char *)a2 + v38);
  long long v42 = v41[3];
  v40[2] = v41[2];
  v40[3] = v42;
  v40[4] = v41[4];
  *(_OWORD *)((char *)v40 + 73) = *(_OWORD *)((char *)v41 + 73);
  long long v43 = v41[1];
  *uint64_t v40 = *v41;
  v40[1] = v43;
  uint64_t v44 = (char *)a1 + v39;
  uint64_t v45 = (char *)a2 + v39;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v47 = sub_243DFC8E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v47 - 8) + 32))(v44, v45, v47);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v44, v45, *(void *)(*(void *)(v46 - 8) + 64));
  }
  uint64_t v48 = v53[7];
  uint64_t v49 = (char *)a1 + v48;
  uint64_t v50 = (char *)a2 + v48;
  *(void *)uint64_t v49 = *(void *)v50;
  v49[8] = v50[8];
  return a1;
}

void *sub_243DE47BC(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = type metadata accessor for MerchantImage.ViewModel(0);
  uint64_t v8 = *(int *)(v7 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_243DFB3F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = *(int *)(v7 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(int *)(type metadata accessor for ReturnDetailsHeader.ViewModel(0) + 20);
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = sub_243DFBE80();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
  int v23 = v22(v18, 1, v20);
  int v24 = v22(v19, 1, v20);
  uint64_t v100 = a3;
  uint64_t v98 = v21;
  if (v23)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v24)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v18, v20);
LABEL_6:
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
    memcpy(v18, v19, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 40))(v18, v19, v20);
LABEL_7:
  uint64_t v99 = type metadata accessor for ReturnDetailsContentsSection.ViewModel(0);
  uint64_t v26 = *(int *)(v99 + 20);
  uint64_t v27 = (char *)a1 + v26;
  uint64_t v101 = a2;
  uint64_t v28 = (char *)a2 + v26;
  uint64_t v29 = sub_243DFB1E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 40))(v27, v28, v29);
  uint64_t v30 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
  uint64_t v31 = *(int *)(v30 + 20);
  uint64_t v32 = &v27[v31];
  long long v33 = &v28[v31];
  int v34 = v22(&v27[v31], 1, v20);
  int v35 = v22(v33, 1, v20);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(char *, char *, uint64_t))(v98 + 32))(v32, v33, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v98 + 56))(v32, 0, 1, v20);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v35)
  {
    (*(void (**)(char *, uint64_t))(v98 + 8))(v32, v20);
LABEL_12:
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
    memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v98 + 40))(v32, v33, v20);
LABEL_13:
  uint64_t v37 = *(int *)(v30 + 24);
  uint64_t v38 = &v27[v37];
  uint64_t v39 = &v28[v37];
  uint64_t v40 = type metadata accessor for OrderDetailsNote(0);
  uint64_t v41 = *(void *)(v40 - 8);
  long long v42 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 48);
  int v43 = v42(v38, 1, v40);
  int v44 = v42(v39, 1, v40);
  if (v43)
  {
    if (!v44)
    {
      uint64_t v45 = (int *)v99;
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        long long v46 = *((_OWORD *)v39 + 1);
        *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
        *((_OWORD *)v38 + 1) = v46;
        uint64_t v47 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
        uint64_t v48 = &v38[v47];
        uint64_t v49 = &v39[v47];
        uint64_t v50 = sub_243DFB220();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 32))(v48, v49, v50);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v38, v39, *(void *)(v41 + 64));
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
      goto LABEL_27;
    }
    goto LABEL_19;
  }
  if (v44)
  {
    sub_243DEA850((uint64_t)v38, type metadata accessor for OrderDetailsNote);
LABEL_19:
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE8);
    memcpy(v38, v39, *(void *)(*(void *)(v51 - 8) + 64));
    uint64_t v45 = (int *)v99;
    goto LABEL_27;
  }
  uint64_t v45 = (int *)v99;
  if (a1 != v101)
  {
    sub_243DEA850((uint64_t)v38, type metadata accessor for OrderDetailsNote);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      long long v52 = *((_OWORD *)v39 + 1);
      *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
      *((_OWORD *)v38 + 1) = v52;
      uint64_t v53 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
      uint64_t v54 = &v38[v53];
      uint64_t v55 = &v39[v53];
      uint64_t v56 = sub_243DFB220();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 32))(v54, v55, v56);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v38, v39, *(void *)(v41 + 64));
    }
  }
LABEL_27:
  uint64_t v57 = v45[6];
  uint64_t v58 = (void *)((char *)a1 + v57);
  uint64_t v59 = (void *)((char *)v101 + v57);
  uint64_t v61 = *v59;
  uint64_t v60 = v59[1];
  void *v58 = v61;
  v58[1] = v60;
  swift_bridgeObjectRelease();
  uint64_t v62 = v45[7];
  uint64_t v63 = (void *)((char *)a1 + v62);
  uint64_t v64 = (void *)((char *)v101 + v62);
  uint64_t v66 = *v64;
  uint64_t v65 = v64[1];
  *uint64_t v63 = v66;
  v63[1] = v65;
  swift_bridgeObjectRelease();
  uint64_t v67 = v45[8];
  long long v68 = (void *)((char *)a1 + v67);
  long long v69 = (void *)((char *)v101 + v67);
  uint64_t v71 = *v69;
  uint64_t v70 = v69[1];
  *long long v68 = v71;
  v68[1] = v70;
  swift_bridgeObjectRelease();
  uint64_t v72 = v45[9];
  long long v73 = (void *)((char *)a1 + v72);
  uint64_t v74 = (void *)((char *)v101 + v72);
  uint64_t v76 = *v74;
  uint64_t v75 = v74[1];
  *long long v73 = v76;
  v73[1] = v75;
  swift_bridgeObjectRelease();
  uint64_t v77 = v45[10];
  uint64_t v78 = (void *)((char *)a1 + v77);
  char v79 = (void *)((char *)v101 + v77);
  uint64_t v81 = *v79;
  uint64_t v80 = v79[1];
  *uint64_t v78 = v81;
  v78[1] = v80;
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + v45[11]) = *(void *)((char *)v101 + v45[11]);
  swift_bridgeObjectRelease();
  uint64_t v82 = v100[5];
  uint64_t v83 = (char *)a1 + v82;
  long long v84 = (char *)v101 + v82;
  *(void *)((char *)a1 + v82) = *(void *)((char *)v101 + v82);
  swift_release();
  *((void *)v83 + 1) = *((void *)v84 + 1);
  swift_release();
  long long v85 = *((_OWORD *)v84 + 2);
  *((_OWORD *)v83 + 1) = *((_OWORD *)v84 + 1);
  *((_OWORD *)v83 + 2) = v85;
  v83[48] = v84[48];
  *(_OWORD *)(v83 + 56) = *(_OWORD *)(v84 + 56);
  *(_OWORD *)(v83 + 72) = *(_OWORD *)(v84 + 72);
  v83[88] = v84[88];
  if (a1 != v101)
  {
    uint64_t v86 = v100[6];
    uint64_t v87 = (char *)a1 + v86;
    char v88 = (char *)v101 + v86;
    sub_243A56808((uint64_t)a1 + v86, &qword_268E18608);
    uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v90 = sub_243DFC8E0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v90 - 8) + 32))(v87, v88, v90);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v87, v88, *(void *)(*(void *)(v89 - 8) + 64));
    }
  }
  uint64_t v91 = v100[7];
  unsigned __int8 v92 = (char *)a1 + v91;
  uint64_t v93 = (char *)v101 + v91;
  uint64_t v94 = *(void *)v93;
  LOBYTE(v93) = v93[8];
  uint64_t v95 = *(void *)v92;
  char v96 = v92[8];
  *(void *)unsigned __int8 v92 = v94;
  v92[8] = (char)v93;
  sub_243AFDCC0(v95, v96);
  return a1;
}

uint64_t sub_243DE4F80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243DE4F94);
}

uint64_t sub_243DE4F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ReturnDetailsContentsSection.ViewModel(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18680);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_243DE50C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243DE50DC);
}

uint64_t sub_243DE50DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for ReturnDetailsContentsSection.ViewModel(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18680);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for ReturnDetailsContentsSection(uint64_t a1)
{
  return sub_243A651B0(a1, (uint64_t *)&unk_268E22F18);
}

void sub_243DE5230()
{
  type metadata accessor for ReturnDetailsContentsSection.ViewModel(319);
  if (v0 <= 0x3F)
  {
    sub_243A82A1C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_243DE5308(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v24 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = type metadata accessor for MerchantImage.ViewModel(0);
    uint64_t v8 = *(int *)(v7 + 20);
    uint64_t v9 = (char *)v4 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_243DFB3F0();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(v7 + 24);
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = *(int *)(type metadata accessor for ReturnDetailsHeader.ViewModel(0) + 20);
    uint64_t v18 = (char *)v4 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = sub_243DFBE80();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    swift_bridgeObjectRetain();
    uint64_t v71 = v22;
    if (v22(v19, 1, v20))
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
      memcpy(v18, v19, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    uint64_t v25 = a3[5];
    uint64_t v26 = (char *)v4 + v25;
    uint64_t v27 = (char *)a2 + v25;
    uint64_t v28 = sub_243DFB1E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
    uint64_t v29 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
    uint64_t v30 = *(int *)(v29 + 20);
    uint64_t v31 = &v26[v30];
    uint64_t v32 = &v27[v30];
    if (v71(&v27[v30], 1, v20))
    {
      uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
      memcpy(v31, v32, *(void *)(*(void *)(v33 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v31, v32, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v31, 0, 1, v20);
    }
    uint64_t v34 = *(int *)(v29 + 24);
    int v35 = &v26[v34];
    uint64_t v36 = &v27[v34];
    uint64_t v37 = type metadata accessor for OrderDetailsNote(0);
    uint64_t v38 = *(void *)(v37 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37))
    {
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE8);
      memcpy(v35, v36, *(void *)(*(void *)(v39 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v43 = *((void *)v36 + 1);
        *(void *)int v35 = *(void *)v36;
        *((void *)v35 + 1) = v43;
        uint64_t v44 = *((void *)v36 + 3);
        *((void *)v35 + 2) = *((void *)v36 + 2);
        *((void *)v35 + 3) = v44;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v45 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
        long long v46 = &v35[v45];
        uint64_t v47 = &v36[v45];
        uint64_t v48 = sub_243DFB220();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 16))(v46, v47, v48);
      }
      else
      {
        uint64_t v40 = *((void *)v36 + 1);
        *(void *)int v35 = *(void *)v36;
        *((void *)v35 + 1) = v40;
        uint64_t v41 = *((void *)v36 + 2);
        uint64_t v42 = *((void *)v36 + 3);
        *((void *)v35 + 2) = v41;
        *((void *)v35 + 3) = v42;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
    }
    uint64_t v49 = a3[6];
    uint64_t v50 = a3[7];
    uint64_t v51 = (uint64_t *)((char *)v4 + v49);
    long long v52 = (uint64_t *)((char *)a2 + v49);
    uint64_t v53 = v52[1];
    *uint64_t v51 = *v52;
    v51[1] = v53;
    uint64_t v54 = (uint64_t *)((char *)v4 + v50);
    uint64_t v55 = (uint64_t *)((char *)a2 + v50);
    uint64_t v56 = v55[1];
    *uint64_t v54 = *v55;
    v54[1] = v56;
    uint64_t v57 = a3[8];
    uint64_t v58 = a3[9];
    uint64_t v59 = (uint64_t *)((char *)v4 + v57);
    uint64_t v60 = (uint64_t *)((char *)a2 + v57);
    uint64_t v61 = v60[1];
    *uint64_t v59 = *v60;
    v59[1] = v61;
    uint64_t v62 = (uint64_t *)((char *)v4 + v58);
    uint64_t v63 = (uint64_t *)((char *)a2 + v58);
    uint64_t v64 = v63[1];
    *uint64_t v62 = *v63;
    v62[1] = v64;
    uint64_t v65 = a3[10];
    uint64_t v66 = a3[11];
    uint64_t v67 = (uint64_t *)((char *)v4 + v65);
    long long v68 = (uint64_t *)((char *)a2 + v65);
    uint64_t v69 = v68[1];
    *uint64_t v67 = *v68;
    v67[1] = v69;
    *(uint64_t *)((char *)v4 + v66) = *(uint64_t *)((char *)a2 + v66);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_243DE5828(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(type metadata accessor for MerchantImage.ViewModel(0) + 20);
  uint64_t v5 = sub_243DFB3F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(type metadata accessor for ReturnDetailsHeader.ViewModel(0) + 20);
  uint64_t v7 = sub_243DFBE80();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (!v9(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  uint64_t v10 = a1 + *(int *)(a2 + 20);
  uint64_t v11 = sub_243DFB1E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
  uint64_t v13 = v10 + *(int *)(v12 + 20);
  if (!v9(v13, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v13, v7);
  }
  uint64_t v14 = v10 + *(int *)(v12 + 24);
  uint64_t v15 = type metadata accessor for OrderDetailsNote(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v14, 1, v15))
  {
    unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v17 = v14 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
      uint64_t v18 = sub_243DFB220();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
    }
    else if (EnumCaseMultiPayload <= 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_243DE5B24(void *a1, void *a2, int *a3)
{
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  uint64_t v6 = type metadata accessor for MerchantImage.ViewModel(0);
  uint64_t v7 = *(int *)(v6 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_243DFB3F0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(v6 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = *(int *)(type metadata accessor for ReturnDetailsHeader.ViewModel(0) + 20);
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = sub_243DFBE80();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  swift_bridgeObjectRetain();
  uint64_t v69 = v21;
  if (v21(v18, 1, v19))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
    memcpy(v17, v18, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  uint64_t v23 = a3[5];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_243DFB1E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
  uint64_t v27 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
  uint64_t v28 = *(int *)(v27 + 20);
  uint64_t v29 = &v24[v28];
  uint64_t v30 = &v25[v28];
  if (v69(&v25[v28], 1, v19))
  {
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
    memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v29, v30, v19);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v29, 0, 1, v19);
  }
  uint64_t v32 = *(int *)(v27 + 24);
  uint64_t v33 = &v24[v32];
  uint64_t v34 = &v25[v32];
  uint64_t v35 = type metadata accessor for OrderDetailsNote(0);
  uint64_t v36 = *(void *)(v35 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35))
  {
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE8);
    memcpy(v33, v34, *(void *)(*(void *)(v37 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v41 = *((void *)v34 + 1);
      *(void *)uint64_t v33 = *(void *)v34;
      *((void *)v33 + 1) = v41;
      uint64_t v42 = *((void *)v34 + 3);
      *((void *)v33 + 2) = *((void *)v34 + 2);
      *((void *)v33 + 3) = v42;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v43 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
      uint64_t v44 = &v33[v43];
      uint64_t v45 = &v34[v43];
      uint64_t v46 = sub_243DFB220();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
    }
    else
    {
      uint64_t v38 = *((void *)v34 + 1);
      *(void *)uint64_t v33 = *(void *)v34;
      *((void *)v33 + 1) = v38;
      uint64_t v39 = *((void *)v34 + 2);
      uint64_t v40 = *((void *)v34 + 3);
      *((void *)v33 + 2) = v39;
      *((void *)v33 + 3) = v40;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
  }
  uint64_t v47 = a3[6];
  uint64_t v48 = a3[7];
  uint64_t v49 = (void *)((char *)a1 + v47);
  uint64_t v50 = (void *)((char *)a2 + v47);
  uint64_t v51 = v50[1];
  *uint64_t v49 = *v50;
  v49[1] = v51;
  long long v52 = (void *)((char *)a1 + v48);
  uint64_t v53 = (void *)((char *)a2 + v48);
  uint64_t v54 = v53[1];
  *long long v52 = *v53;
  v52[1] = v54;
  uint64_t v55 = a3[8];
  uint64_t v56 = a3[9];
  uint64_t v57 = (void *)((char *)a1 + v55);
  uint64_t v58 = (void *)((char *)a2 + v55);
  uint64_t v59 = v58[1];
  *uint64_t v57 = *v58;
  v57[1] = v59;
  uint64_t v60 = (void *)((char *)a1 + v56);
  uint64_t v61 = (void *)((char *)a2 + v56);
  uint64_t v62 = v61[1];
  void *v60 = *v61;
  v60[1] = v62;
  uint64_t v63 = a3[10];
  uint64_t v64 = a3[11];
  uint64_t v65 = (void *)((char *)a1 + v63);
  uint64_t v66 = (void *)((char *)a2 + v63);
  uint64_t v67 = v66[1];
  *uint64_t v65 = *v66;
  v65[1] = v67;
  *(void *)((char *)a1 + v64) = *(void *)((char *)a2 + v64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_243DE5FF4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = type metadata accessor for MerchantImage.ViewModel(0);
  uint64_t v7 = *(int *)(v6 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_243DFB3F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(v6 + 24);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = *(int *)(type metadata accessor for ReturnDetailsHeader.ViewModel(0) + 20);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_243DFBE80();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  int v20 = v19(v15, 1, v17);
  int v21 = v19(v16, 1, v17);
  if (v20)
  {
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
LABEL_6:
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
    memcpy(v15, v16, *(void *)(*(void *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 24))(v15, v16, v17);
LABEL_7:
  long long v68 = a1;
  uint64_t v69 = a3;
  uint64_t v23 = a3[5];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v67 = a2;
  uint64_t v25 = (char *)a2 + v23;
  uint64_t v26 = sub_243DFB1E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 24))(v24, v25, v26);
  uint64_t v27 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
  uint64_t v28 = *(int *)(v27 + 20);
  uint64_t v29 = &v24[v28];
  uint64_t v30 = &v25[v28];
  int v31 = v19(&v24[v28], 1, v17);
  int v32 = v19(v30, 1, v17);
  if (v31)
  {
    if (!v32)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v29, v30, v17);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v29, 0, 1, v17);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v32)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v29, v17);
LABEL_12:
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
    memcpy(v29, v30, *(void *)(*(void *)(v33 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 24))(v29, v30, v17);
LABEL_13:
  uint64_t v34 = *(int *)(v27 + 24);
  uint64_t v35 = &v24[v34];
  uint64_t v36 = &v25[v34];
  uint64_t v37 = type metadata accessor for OrderDetailsNote(0);
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v39 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48);
  int v40 = v39(v35, 1, v37);
  int v41 = v39(v36, 1, v37);
  if (v40)
  {
    if (!v41)
    {
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        *(void *)uint64_t v35 = *(void *)v36;
        *((void *)v35 + 1) = *((void *)v36 + 1);
        *((void *)v35 + 2) = *((void *)v36 + 2);
        *((void *)v35 + 3) = *((void *)v36 + 3);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v43 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
        uint64_t v44 = &v35[v43];
        uint64_t v45 = &v36[v43];
        uint64_t v46 = sub_243DFB220();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
      }
      else
      {
        *(void *)uint64_t v35 = *(void *)v36;
        *((void *)v35 + 1) = *((void *)v36 + 1);
        *((void *)v35 + 2) = *((void *)v36 + 2);
        *((void *)v35 + 3) = *((void *)v36 + 3);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
      goto LABEL_28;
    }
LABEL_19:
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE8);
    memcpy(v35, v36, *(void *)(*(void *)(v42 - 8) + 64));
    goto LABEL_28;
  }
  if (v41)
  {
    sub_243DEA850((uint64_t)v35, type metadata accessor for OrderDetailsNote);
    goto LABEL_19;
  }
  if (v68 != v67)
  {
    sub_243DEA850((uint64_t)v35, type metadata accessor for OrderDetailsNote);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      *(void *)uint64_t v35 = *(void *)v36;
      *((void *)v35 + 1) = *((void *)v36 + 1);
      *((void *)v35 + 2) = *((void *)v36 + 2);
      *((void *)v35 + 3) = *((void *)v36 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v63 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
      uint64_t v64 = &v35[v63];
      uint64_t v65 = &v36[v63];
      uint64_t v66 = sub_243DFB220();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v66 - 8) + 16))(v64, v65, v66);
    }
    else
    {
      *(void *)uint64_t v35 = *(void *)v36;
      *((void *)v35 + 1) = *((void *)v36 + 1);
      *((void *)v35 + 2) = *((void *)v36 + 2);
      *((void *)v35 + 3) = *((void *)v36 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
LABEL_28:
  uint64_t v47 = v69[6];
  uint64_t v48 = (void *)((char *)v68 + v47);
  uint64_t v49 = (void *)((char *)v67 + v47);
  *uint64_t v48 = *v49;
  v48[1] = v49[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v50 = v69[7];
  uint64_t v51 = (void *)((char *)v68 + v50);
  long long v52 = (void *)((char *)v67 + v50);
  *uint64_t v51 = *v52;
  v51[1] = v52[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v53 = v69[8];
  uint64_t v54 = (void *)((char *)v68 + v53);
  uint64_t v55 = (void *)((char *)v67 + v53);
  *uint64_t v54 = *v55;
  v54[1] = v55[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v56 = v69[9];
  uint64_t v57 = (void *)((char *)v68 + v56);
  uint64_t v58 = (void *)((char *)v67 + v56);
  *uint64_t v57 = *v58;
  v57[1] = v58[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v59 = v69[10];
  uint64_t v60 = (void *)((char *)v68 + v59);
  uint64_t v61 = (void *)((char *)v67 + v59);
  void *v60 = *v61;
  v60[1] = v61[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)v68 + v69[11]) = *(void *)((char *)v67 + v69[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v68;
}

_OWORD *sub_243DE67B8(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = type metadata accessor for MerchantImage.ViewModel(0);
  uint64_t v7 = *(int *)(v6 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_243DFB3F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)((char *)a1 + *(int *)(v6 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v6 + 24));
  uint64_t v11 = *(int *)(type metadata accessor for ReturnDetailsHeader.ViewModel(0) + 20);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_243DFBE80();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v42 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v42(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  int v41 = a3;
  uint64_t v17 = a3[5];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = sub_243DFB1E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  uint64_t v21 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
  uint64_t v22 = *(int *)(v21 + 20);
  uint64_t v23 = &v18[v22];
  uint64_t v24 = &v19[v22];
  if (v42(&v19[v22], 1, v14))
  {
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
    memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v23, v24, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v23, 0, 1, v14);
  }
  uint64_t v26 = *(int *)(v21 + 24);
  uint64_t v27 = &v18[v26];
  uint64_t v28 = &v19[v26];
  uint64_t v29 = type metadata accessor for OrderDetailsNote(0);
  uint64_t v30 = *(void *)(v29 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
  {
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE8);
    memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      long long v32 = *((_OWORD *)v28 + 1);
      *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
      *((_OWORD *)v27 + 1) = v32;
      uint64_t v33 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
      uint64_t v34 = &v27[v33];
      uint64_t v35 = &v28[v33];
      uint64_t v36 = sub_243DFB220();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 32))(v34, v35, v36);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v27, v28, *(void *)(v30 + 64));
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
  }
  uint64_t v37 = v41[7];
  *(_OWORD *)((char *)a1 + v41[6]) = *(_OWORD *)((char *)a2 + v41[6]);
  *(_OWORD *)((char *)a1 + v37) = *(_OWORD *)((char *)a2 + v37);
  uint64_t v38 = v41[9];
  *(_OWORD *)((char *)a1 + v41[8]) = *(_OWORD *)((char *)a2 + v41[8]);
  *(_OWORD *)((char *)a1 + v38) = *(_OWORD *)((char *)a2 + v38);
  uint64_t v39 = v41[11];
  *(_OWORD *)((char *)a1 + v41[10]) = *(_OWORD *)((char *)a2 + v41[10]);
  *(void *)((char *)a1 + v39) = *(void *)((char *)a2 + v39);
  return a1;
}

void *sub_243DE6BF0(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = type metadata accessor for MerchantImage.ViewModel(0);
  uint64_t v8 = *(int *)(v7 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_243DFB3F0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = *(int *)(v7 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(int *)(type metadata accessor for ReturnDetailsHeader.ViewModel(0) + 20);
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = sub_243DFBE80();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
  int v23 = v22(v18, 1, v20);
  int v24 = v22(v19, 1, v20);
  uint64_t v83 = v21;
  if (v23)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v24)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v18, v20);
LABEL_6:
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
    memcpy(v18, v19, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 40))(v18, v19, v20);
LABEL_7:
  long long v84 = a3;
  long long v85 = a2;
  uint64_t v26 = a3[5];
  uint64_t v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  uint64_t v29 = sub_243DFB1E0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 40))(v27, v28, v29);
  uint64_t v30 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
  uint64_t v31 = *(int *)(v30 + 20);
  long long v32 = &v27[v31];
  uint64_t v33 = &v28[v31];
  int v34 = v22(&v27[v31], 1, v20);
  int v35 = v22(v33, 1, v20);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(char *, char *, uint64_t))(v83 + 32))(v32, v33, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v83 + 56))(v32, 0, 1, v20);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v35)
  {
    (*(void (**)(char *, uint64_t))(v83 + 8))(v32, v20);
LABEL_12:
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
    memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v83 + 40))(v32, v33, v20);
LABEL_13:
  uint64_t v37 = *(int *)(v30 + 24);
  uint64_t v38 = &v27[v37];
  uint64_t v39 = &v28[v37];
  uint64_t v40 = type metadata accessor for OrderDetailsNote(0);
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v42 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 48);
  int v43 = v42(v38, 1, v40);
  int v44 = v42(v39, 1, v40);
  if (v43)
  {
    if (!v44)
    {
      uint64_t v45 = v85;
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        long long v46 = *((_OWORD *)v39 + 1);
        *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
        *((_OWORD *)v38 + 1) = v46;
        uint64_t v47 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
        uint64_t v48 = &v38[v47];
        uint64_t v49 = &v39[v47];
        uint64_t v50 = sub_243DFB220();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v50 - 8) + 32))(v48, v49, v50);
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v38, v39, *(void *)(v41 + 64));
      }
      (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
      goto LABEL_27;
    }
LABEL_19:
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE8);
    memcpy(v38, v39, *(void *)(*(void *)(v51 - 8) + 64));
    uint64_t v45 = v85;
    goto LABEL_27;
  }
  if (v44)
  {
    sub_243DEA850((uint64_t)v38, type metadata accessor for OrderDetailsNote);
    goto LABEL_19;
  }
  uint64_t v45 = v85;
  if (a1 != v85)
  {
    sub_243DEA850((uint64_t)v38, type metadata accessor for OrderDetailsNote);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      long long v52 = *((_OWORD *)v39 + 1);
      *(_OWORD *)uint64_t v38 = *(_OWORD *)v39;
      *((_OWORD *)v38 + 1) = v52;
      uint64_t v53 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
      uint64_t v54 = &v38[v53];
      uint64_t v55 = &v39[v53];
      uint64_t v56 = sub_243DFB220();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v56 - 8) + 32))(v54, v55, v56);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v38, v39, *(void *)(v41 + 64));
    }
  }
LABEL_27:
  uint64_t v57 = v84[6];
  uint64_t v58 = (void *)((char *)a1 + v57);
  uint64_t v59 = (void *)((char *)v45 + v57);
  uint64_t v61 = *v59;
  uint64_t v60 = v59[1];
  void *v58 = v61;
  v58[1] = v60;
  swift_bridgeObjectRelease();
  uint64_t v62 = v84[7];
  uint64_t v63 = (void *)((char *)a1 + v62);
  uint64_t v64 = (void *)((char *)v45 + v62);
  uint64_t v66 = *v64;
  uint64_t v65 = v64[1];
  *uint64_t v63 = v66;
  v63[1] = v65;
  swift_bridgeObjectRelease();
  uint64_t v67 = v84[8];
  long long v68 = (void *)((char *)a1 + v67);
  uint64_t v69 = (void *)((char *)v45 + v67);
  uint64_t v71 = *v69;
  uint64_t v70 = v69[1];
  *long long v68 = v71;
  v68[1] = v70;
  swift_bridgeObjectRelease();
  uint64_t v72 = v84[9];
  long long v73 = (void *)((char *)a1 + v72);
  uint64_t v74 = (void *)((char *)v45 + v72);
  uint64_t v76 = *v74;
  uint64_t v75 = v74[1];
  *long long v73 = v76;
  v73[1] = v75;
  swift_bridgeObjectRelease();
  uint64_t v77 = v84[10];
  uint64_t v78 = (void *)((char *)a1 + v77);
  char v79 = (void *)((char *)v45 + v77);
  uint64_t v81 = *v79;
  uint64_t v80 = v79[1];
  *uint64_t v78 = v81;
  v78[1] = v80;
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + v84[11]) = *(void *)((char *)v45 + v84[11]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_243DE7270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243DE7284);
}

uint64_t sub_243DE7284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ReturnDetailsHeader.ViewModel(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 32) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_243DE739C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243DE73B0);
}

uint64_t sub_243DE73B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for ReturnDetailsHeader.ViewModel(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 32) + 8) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t sub_243DE74C4()
{
  uint64_t result = type metadata accessor for ReturnDetailsHeader.ViewModel(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_243DE75B4@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_243DFCC30();
  *a1 = v3;
  return result;
}

uint64_t sub_243DE75E0()
{
  return sub_243DFCC40();
}

uint64_t sub_243DE760C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_243DE7628@<X0>(char *a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22F38);
  uint64_t v2 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22F40);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22F48);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v31 = v8;
  uint64_t v32 = v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22F50);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v29[0] = (char *)v29 - v17;
  uint64_t v34 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E22F58);
  sub_243DE9A98();
  sub_243DFD980();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v19 = v30;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v7, v4, v30);
  uint64_t v20 = (uint64_t *)&v7[*(int *)(v5 + 36)];
  *uint64_t v20 = KeyPath;
  v20[1] = 0;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v19);
  unint64_t v21 = sub_243DE9EF0();
  sub_243DFDB70();
  sub_243A56808((uint64_t)v7, &qword_268E22F40);
  uint64_t v35 = v5;
  unint64_t v36 = v21;
  swift_getOpaqueTypeConformance2();
  uint64_t v22 = v31;
  sub_243DFDD90();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v22);
  uint64_t v23 = v29[0];
  (*(void (**)(void, char *, uint64_t))(v13 + 32))(v29[0], v15, v12);
  uint64_t v24 = *(void *)(v29[1] + *(int *)(type metadata accessor for ReturnDetailsContentsSection.ViewModel(0) + 44));
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v25(v15, v23, v12);
  uint64_t v26 = v33;
  v25(v33, (uint64_t)v15, v12);
  *(void *)&v26[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E22FF0) + 48)] = v24;
  uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  swift_bridgeObjectRetain_n();
  v27(v23, v12);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v27)(v15, v12);
}

uint64_t sub_243DE7A4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v76 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1BBF8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v75 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22FA0) - 8;
  MEMORY[0x270FA5388](v74);
  uint64_t v79 = (uint64_t)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_243DFCEB0();
  uint64_t v78 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v71 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22FB0);
  uint64_t v80 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  uint64_t v77 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ReturnDetailsContentsSection(0);
  uint64_t v63 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v63 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ReturnDetailsHeader.ViewModel(0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for ReturnDetailsHeader(0);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22FC0);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v61 - v22;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22F90) - 8;
  MEMORY[0x270FA5388](v65);
  uint64_t v64 = (char *)&v61 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v68 = (uint64_t)&v61 - v26;
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22F80) - 8;
  MEMORY[0x270FA5388](v69);
  uint64_t v66 = (uint64_t)&v61 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22F70) - 8;
  MEMORY[0x270FA5388](v70);
  uint64_t v67 = (uint64_t)&v61 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243DE9FBC(a1, (uint64_t)v13, type metadata accessor for ReturnDetailsHeader.ViewModel);
  *(void *)&v17[*(int *)(v15 + 28)] = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1AFD8);
  swift_storeEnumTagMultiPayload();
  sub_243DEA028((uint64_t)v13, (uint64_t)v17, type metadata accessor for ReturnDetailsHeader.ViewModel);
  uint64_t v29 = sub_243DFE4F0();
  uint64_t v31 = v30;
  sub_243DE9FBC(a1, (uint64_t)v10, type metadata accessor for ReturnDetailsContentsSection);
  unint64_t v32 = (*(unsigned __int8 *)(v63 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80);
  uint64_t v33 = swift_allocObject();
  sub_243DEA028((uint64_t)v10, v33 + v32, type metadata accessor for ReturnDetailsContentsSection);
  sub_243DE9FBC((uint64_t)v17, (uint64_t)v23, type metadata accessor for ReturnDetailsHeader);
  uint64_t v34 = (uint64_t (**)@<X0>(uint64_t@<X8>))&v23[*(int *)(v18 + 36)];
  uint64_t v62 = v23;
  *uint64_t v34 = sub_243DEA090;
  v34[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v33;
  v34[2] = (uint64_t (*)@<X0>(uint64_t@<X8>))v29;
  v34[3] = v31;
  sub_243DEA850((uint64_t)v17, type metadata accessor for ReturnDetailsHeader);
  uint64_t v81 = a1;
  sub_243A567A4((uint64_t)v23, (uint64_t)v20, &qword_268E22FC0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E22FD8);
  sub_243DE9DCC();
  sub_243A569B0(&qword_268E22FD0, &qword_268E22FD8);
  uint64_t v35 = v77;
  sub_243DFE3D0();
  unint64_t v36 = v71;
  sub_243DFCEA0();
  uint64_t v37 = v73;
  uint64_t v39 = v78;
  uint64_t v38 = v79;
  uint64_t v40 = v79 + *(int *)(v74 + 44);
  uint64_t v41 = *(void (**)(uint64_t, char *, uint64_t))(v78 + 16);
  v41(v40, v36, v73);
  uint64_t v42 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56);
  v42(v40, 0, 1, v37);
  uint64_t v43 = v38;
  uint64_t v44 = v72;
  (*(void (**)(uint64_t, char *, uint64_t))(v80 + 16))(v43, v35, v72);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v46 = (uint64_t)v75;
  v41((uint64_t)v75, v36, v37);
  v42(v46, 0, 1, v37);
  uint64_t v47 = (uint64_t)v64;
  uint64_t v48 = (uint64_t *)&v64[*(int *)(v65 + 44)];
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1BC48);
  sub_243A567A4(v46, (uint64_t)v48 + *(int *)(v49 + 28), &qword_268E1BBF8);
  *uint64_t v48 = KeyPath;
  uint64_t v50 = v79;
  sub_243A567A4(v79, v47, &qword_268E22FA0);
  sub_243A56808(v46, &qword_268E1BBF8);
  sub_243A56808(v50, &qword_268E22FA0);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v36, v37);
  (*(void (**)(char *, uint64_t))(v80 + 8))(v77, v44);
  uint64_t v51 = v68;
  sub_243A56740(v47, v68, &qword_268E22F90);
  sub_243A56808((uint64_t)v62, &qword_268E22FC0);
  uint64_t v52 = sub_243DFCFD0();
  uint64_t v53 = v66;
  sub_243A567A4(v51, v66, &qword_268E22F90);
  uint64_t v54 = (uint64_t *)(v53 + *(int *)(v69 + 44));
  *uint64_t v54 = v52;
  v54[1] = (uint64_t)sub_243A75774;
  v54[2] = 0;
  sub_243A56808(v51, &qword_268E22F90);
  uint64_t v55 = sub_243DFCFE0();
  uint64_t v56 = v67;
  sub_243A567A4(v53, v67, &qword_268E22F80);
  uint64_t v57 = (uint64_t *)(v56 + *(int *)(v70 + 44));
  *uint64_t v57 = v55;
  v57[1] = (uint64_t)sub_243D74618;
  v57[2] = 0;
  sub_243A56808(v53, &qword_268E22F80);
  LOBYTE(v55) = sub_243DFD750();
  uint64_t v58 = v76;
  sub_243A567A4(v56, v76, &qword_268E22F70);
  uint64_t v59 = v58 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E22F58) + 36);
  *(unsigned char *)uint64_t v59 = v55;
  *(_OWORD *)(v59 + 8) = 0u;
  *(_OWORD *)(v59 + 24) = 0u;
  *(unsigned char *)(v59 + 40) = 1;
  return sub_243A56808(v56, &qword_268E22F70);
}

uint64_t sub_243DE8324@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  v25[0] = a2;
  uint64_t v3 = type metadata accessor for ReturnDetailsContentsSection(0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_243DFD2A0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243DFD450();
  sub_243DFC6D0();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v19 = sub_243DFE040();
  sub_243DE9FBC(a1, (uint64_t)v6, type metadata accessor for ReturnDetailsContentsSection);
  unint64_t v20 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v21 = swift_allocObject();
  sub_243DEA028((uint64_t)v6, v21 + v20, type metadata accessor for ReturnDetailsContentsSection);
  uint64_t v22 = (void *)(v21 + ((v20 + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v22 = v12;
  v22[1] = v14;
  v22[2] = v16;
  v22[3] = v18;
  v25[5] = v19;
  uint64_t v26 = sub_243DEAD40;
  uint64_t v27 = v21;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  v25[1] = v12;
  v25[2] = v14;
  v25[3] = v16;
  v25[4] = v18;
  sub_243DE9FBC(a1, (uint64_t)v6, type metadata accessor for ReturnDetailsContentsSection);
  uint64_t v23 = swift_allocObject();
  sub_243DEA028((uint64_t)v6, v23 + v20, type metadata accessor for ReturnDetailsContentsSection);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1B060);
  type metadata accessor for CGRect(0);
  sub_243B010A0();
  sub_243DEB284((unint64_t *)&qword_268E1B070, type metadata accessor for CGRect);
  sub_243DFDF30();
  swift_release();
  swift_release();
  sub_243A6F580((uint64_t)v26);
  return sub_243A6F580(v28);
}

uint64_t sub_243DE8650()
{
  type metadata accessor for ReturnDetailsContentsSection(0);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1B078);
  MEMORY[0x245685E90](&v1);
  sub_243DFE310();
  swift_release();
  return swift_release();
}

uint64_t sub_243DE87A4()
{
  type metadata accessor for ReturnDetailsContentsSection(0);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1B078);
  MEMORY[0x245685E90](&v1);
  sub_243DFE310();
  swift_release();
  return swift_release();
}

uint64_t sub_243DE88F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v116 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22FF8);
  uint64_t v126 = *(void *)(v3 - 8);
  uint64_t v127 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v111 = (char *)&v104 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v110 = (char *)&v104 - v6;
  MEMORY[0x270FA5388](v7);
  uint64_t v108 = (char *)&v104 - v8;
  MEMORY[0x270FA5388](v9);
  uint64_t v107 = (char *)&v104 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23000);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v115 = (uint64_t)&v104 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v114 = (uint64_t)&v104 - v14;
  MEMORY[0x270FA5388](v15);
  uint64_t v119 = (char *)&v104 - v16;
  MEMORY[0x270FA5388](v17);
  v128 = (char *)&v104 - v18;
  uint64_t v19 = sub_243DFC8E0();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v109 = (uint64_t)&v104 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v106 = (uint64_t *)((char *)&v104 - v23);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v104 - v25;
  MEMORY[0x270FA5388](v27);
  uint64_t v29 = (char *)&v104 - v28;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23008);
  MEMORY[0x270FA5388](v30 - 8);
  unint64_t v32 = (char *)&v104 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23010);
  uint64_t v34 = v33 - 8;
  MEMORY[0x270FA5388](v33);
  uint64_t v113 = (uint64_t)&v104 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v36);
  uint64_t v38 = (char *)&v104 - v37;
  MEMORY[0x270FA5388](v39);
  uint64_t v41 = (char *)&v104 - v40;
  *(void *)unint64_t v32 = sub_243DFD000();
  *((void *)v32 + 1) = 0x4032000000000000;
  v32[16] = 0;
  uint64_t v42 = (uint64_t)&v32[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E23018) + 44)];
  uint64_t v129 = a1;
  sub_243DE94F8(a1, v42);
  uint64_t v124 = a1 + *(int *)(type metadata accessor for ReturnDetailsContentsSection(0) + 24);
  sub_243AFB7C0((uint64_t)v29);
  uint64_t v43 = *(void (**)(void))(v20 + 104);
  unsigned int v123 = *MEMORY[0x263F18D10];
  v121 = (void (*)(char *, void, uint64_t))v43;
  uint64_t v122 = v20 + 104;
  v43(v26);
  LOBYTE(a1) = sub_243DFC8D0();
  uint64_t v44 = *(void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v117 = v26;
  v44(v26, v19);
  uint64_t v118 = v19;
  uint64_t v125 = v20 + 8;
  unint64_t v120 = v44;
  v44(v29, v19);
  if (a1) {
    uint64_t v45 = 0x4028000000000000;
  }
  else {
    uint64_t v45 = 0x4030000000000000;
  }
  sub_243A567A4((uint64_t)v32, (uint64_t)v38, &qword_268E23008);
  uint64_t v46 = &v38[*(int *)(v34 + 44)];
  *(void *)uint64_t v46 = 0x4028000000000000;
  *((void *)v46 + 1) = v45;
  uint64_t v47 = v129;
  *((void *)v46 + 2) = 0;
  *((void *)v46 + 3) = v45;
  v46[32] = 0;
  sub_243A56808((uint64_t)v32, &qword_268E23008);
  uint64_t v112 = v41;
  sub_243A56740((uint64_t)v38, (uint64_t)v41, &qword_268E23010);
  uint64_t v48 = type metadata accessor for ReturnDetailsContentsSection.ViewModel(0);
  uint64_t v49 = v48;
  uint64_t v50 = (uint64_t *)(v47 + *(int *)(v48 + 40));
  uint64_t v51 = v50[1];
  if (v51)
  {
    uint64_t v105 = v48;
    uint64_t v52 = *v50;
    if (qword_26B0CDA78 != -1) {
      swift_once();
    }
    uint64_t v53 = (void *)qword_26B0CDAA0;
    uint64_t v54 = (void *)sub_243DFE8E0();
    uint64_t v55 = (void *)sub_243DFE8E0();
    uint64_t v56 = (void *)sub_243DFE8E0();
    id v57 = objc_msgSend(v53, sel_localizedStringForKey_value_table_, v54, v55, v56);

    uint64_t v58 = sub_243DFE910();
    uint64_t v60 = v59;

    swift_bridgeObjectRetain();
    uint64_t v61 = (uint64_t)v106;
    sub_243AFB7C0((uint64_t)v106);
    uint64_t v62 = v117;
    uint64_t v63 = v118;
    v121(v117, v123, v118);
    LOBYTE(v57) = sub_243DFC8D0();
    uint64_t v64 = (uint64_t (*)(uint64_t, uint64_t))v120;
    v120(v62, v63);
    uint64_t v65 = v64(v61, v63);
    uint64_t v106 = &v104;
    uint64_t v66 = 0x4030000000000000;
    uint64_t v130 = v58;
    uint64_t v131 = v60;
    if (v57) {
      uint64_t v66 = 0x4028000000000000;
    }
    uint64_t v132 = v52;
    uint64_t v133 = v51;
    uint64_t v134 = 0x4028000000000000;
    uint64_t v135 = v66;
    uint64_t v136 = 0;
    uint64_t v137 = v66;
    char v138 = 0;
    MEMORY[0x270FA5388](v65);
    uint64_t v67 = v129;
    *(&v104 - 4) = v129;
    *(&v104 - 3) = v52;
    *(&v104 - 2) = v51;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E23028);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E1B5E0);
    sub_243DEA248();
    sub_243A569B0(&qword_268E1B5E8, &qword_268E1B5E0);
    uint64_t v68 = v108;
    sub_243DFDB50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v70 = v126;
    uint64_t v69 = v127;
    uint64_t v71 = *(void (**)(char *, char *, uint64_t))(v126 + 32);
    uint64_t v72 = v107;
    v71(v107, v68, v127);
    uint64_t v73 = (uint64_t)v128;
    v71(v128, v72, v69);
    uint64_t v47 = v67;
    uint64_t v74 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v70 + 56);
    v74(v73, 0, 1, v69);
    uint64_t v49 = v105;
  }
  else
  {
    uint64_t v69 = v127;
    uint64_t v74 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v126 + 56);
    v74((uint64_t)v128, 1, 1, v127);
    uint64_t v63 = v118;
    uint64_t v62 = v117;
  }
  uint64_t v75 = (uint64_t *)(v47 + *(int *)(v49 + 36));
  uint64_t v76 = v75[1];
  if (v76)
  {
    uint64_t v77 = *v75;
    if (qword_26B0CDA78 != -1) {
      swift_once();
    }
    uint64_t v78 = (void *)qword_26B0CDAA0;
    uint64_t v79 = (void *)sub_243DFE8E0();
    uint64_t v80 = (void *)sub_243DFE8E0();
    uint64_t v81 = (void *)sub_243DFE8E0();
    id v82 = objc_msgSend(v78, sel_localizedStringForKey_value_table_, v79, v80, v81);

    uint64_t v83 = sub_243DFE910();
    uint64_t v85 = v84;

    swift_bridgeObjectRetain();
    uint64_t v86 = v109;
    sub_243AFB7C0(v109);
    v121(v62, v123, v63);
    LOBYTE(v82) = sub_243DFC8D0();
    uint64_t v87 = v62;
    char v88 = (uint64_t (*)(uint64_t, uint64_t))v120;
    v120(v87, v63);
    uint64_t v89 = v88(v86, v63);
    uint64_t v90 = 0x4030000000000000;
    uint64_t v130 = v83;
    uint64_t v131 = v85;
    if (v82) {
      uint64_t v90 = 0x4028000000000000;
    }
    uint64_t v132 = v77;
    uint64_t v133 = v76;
    uint64_t v134 = 0x4028000000000000;
    uint64_t v135 = v90;
    uint64_t v136 = 0;
    uint64_t v137 = v90;
    char v138 = 0;
    MEMORY[0x270FA5388](v89);
    *(&v104 - 4) = v129;
    *(&v104 - 3) = v77;
    *(&v104 - 2) = v76;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E23028);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E1B5E0);
    sub_243DEA248();
    sub_243A569B0(&qword_268E1B5E8, &qword_268E1B5E0);
    uint64_t v91 = v111;
    sub_243DFDB50();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v69 = v127;
    unsigned __int8 v92 = *(void (**)(char *, char *, uint64_t))(v126 + 32);
    uint64_t v93 = v110;
    v92(v110, v91, v127);
    uint64_t v94 = (uint64_t)v119;
    v92(v119, v93, v69);
    uint64_t v95 = 0;
  }
  else
  {
    uint64_t v95 = 1;
    uint64_t v94 = (uint64_t)v119;
  }
  v74(v94, v95, 1, v69);
  uint64_t v96 = (uint64_t)v112;
  uint64_t v97 = v113;
  sub_243A567A4((uint64_t)v112, v113, &qword_268E23010);
  uint64_t v98 = (uint64_t)v128;
  uint64_t v99 = v114;
  sub_243A567A4((uint64_t)v128, v114, &qword_268E23000);
  uint64_t v100 = v115;
  sub_243A567A4(v94, v115, &qword_268E23000);
  uint64_t v101 = v116;
  sub_243A567A4(v97, v116, &qword_268E23010);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23020);
  sub_243A567A4(v99, v101 + *(int *)(v102 + 48), &qword_268E23000);
  sub_243A567A4(v100, v101 + *(int *)(v102 + 64), &qword_268E23000);
  sub_243A56808(v94, &qword_268E23000);
  sub_243A56808(v98, &qword_268E23000);
  sub_243A56808(v96, &qword_268E23010);
  sub_243A56808(v100, &qword_268E23000);
  sub_243A56808(v99, &qword_268E23000);
  return sub_243A56808(v97, &qword_268E23010);
}

uint64_t sub_243DE94F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v3 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ReturnDetailsStatusLabel(0);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (uint64_t *)((char *)&v31 - v11);
  uint64_t v13 = (int *)type metadata accessor for ReturnDetailsContentsSection.ViewModel(0);
  sub_243DE9FBC(a1 + v13[5], (uint64_t)v5, type metadata accessor for ReturnDetailsStatusLabel.ViewModel);
  *uint64_t v12 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1AFD8);
  swift_storeEnumTagMultiPayload();
  sub_243DEA028((uint64_t)v5, (uint64_t)v12 + *(int *)(v7 + 28), type metadata accessor for ReturnDetailsStatusLabel.ViewModel);
  uint64_t v14 = (uint64_t *)(a1 + v13[7]);
  uint64_t v15 = v14[1];
  if (v15)
  {
    uint64_t v16 = *v14;
    char v34 = 0;
    uint64_t v17 = v15;
    swift_bridgeObjectRetain();
    sub_243DFE1C0();
    uint64_t v18 = v35;
    uint64_t v19 = v36;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v16 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
  }
  uint64_t v20 = (uint64_t *)(a1 + v13[6]);
  uint64_t v21 = v20[1];
  if (v21)
  {
    uint64_t v32 = *v20;
    uint64_t v22 = (uint64_t *)(a1 + v13[8]);
    uint64_t v23 = *v22;
    uint64_t v24 = v22[1];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v32 = 0;
  }
  sub_243DE9FBC((uint64_t)v12, (uint64_t)v9, type metadata accessor for ReturnDetailsStatusLabel);
  uint64_t v31 = v12;
  uint64_t v25 = v33;
  sub_243DE9FBC((uint64_t)v9, v33, type metadata accessor for ReturnDetailsStatusLabel);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23038);
  uint64_t v27 = (uint64_t *)(v25 + *(int *)(v26 + 48));
  *uint64_t v27 = v16;
  v27[1] = v17;
  v27[2] = v18;
  v27[3] = v19;
  uint64_t v28 = (uint64_t *)(v25 + *(int *)(v26 + 64));
  *uint64_t v28 = v23;
  v28[1] = v24;
  uint64_t v29 = v32;
  v28[2] = v32;
  v28[3] = v21;
  sub_243DEA80C(v16, v17);
  sub_243B9B634(v23, v24);
  swift_bridgeObjectRetain();
  sub_243DEA850((uint64_t)v31, type metadata accessor for ReturnDetailsStatusLabel);
  sub_243DEA8B0(v23, v24, v29, v21, MEMORY[0x263F8EEA0]);
  sub_243DEA8B0(v16, v17, v18, v19, MEMORY[0x263F8EED8]);
  return sub_243DEA850((uint64_t)v9, type metadata accessor for ReturnDetailsStatusLabel);
}

uint64_t sub_243DE9818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ReturnDetailsContentsSection(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  sub_243DE9FBC(a1, (uint64_t)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ReturnDetailsContentsSection);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  sub_243DEA028((uint64_t)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9, type metadata accessor for ReturnDetailsContentsSection);
  uint64_t v11 = (void *)(v10 + ((v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v11 = a2;
  v11[1] = a3;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E19E38);
  sub_243A569B0(&qword_268E19E58, &qword_268E19E38);
  return sub_243DFE220();
}

void sub_243DE99B8(uint64_t a1)
{
  uint64_t v1 = a1 + *(int *)(type metadata accessor for ReturnDetailsContentsSection(0) + 28);
  uint64_t v2 = *(void *)v1;
  char v3 = *(unsigned char *)(v1 + 8);
  sub_243AFDCBC(*(void *)v1, v3);
  sub_243AFD234(v2, v3, v4);
  sub_243AFDCC0(v2, v3);
  id v5 = objc_msgSend(self, sel_generalPasteboard);
  id v6 = (id)sub_243DFE8E0();
  objc_msgSend(v5, sel_setString_, v6);
}

uint64_t sub_243DE9A90@<X0>(uint64_t a1@<X8>)
{
  return sub_243DE7A4C(*(void *)(v1 + 16), a1);
}

unint64_t sub_243DE9A98()
{
  unint64_t result = qword_268E22F60;
  if (!qword_268E22F60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22F58);
    sub_243DE9B60(&qword_268E22F68, &qword_268E22F70, (void (*)(void))sub_243DE9B38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22F60);
  }
  return result;
}

uint64_t sub_243DE9B38()
{
  return sub_243DE9B60(&qword_268E22F78, &qword_268E22F80, (void (*)(void))sub_243DE9BE0);
}

uint64_t sub_243DE9B60(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    sub_243A7947C();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_243DE9BE0()
{
  unint64_t result = qword_268E22F88;
  if (!qword_268E22F88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22F90);
    sub_243DE9C80();
    sub_243A569B0(&qword_268E1BC98, &qword_268E1BC48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22F88);
  }
  return result;
}

unint64_t sub_243DE9C80()
{
  unint64_t result = qword_268E22F98;
  if (!qword_268E22F98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22FA0);
    sub_243DE9D20();
    sub_243A569B0(&qword_268E1BC88, &qword_268E1BC90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22F98);
  }
  return result;
}

unint64_t sub_243DE9D20()
{
  unint64_t result = qword_268E22FA8;
  if (!qword_268E22FA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22FB0);
    sub_243DE9DCC();
    sub_243A569B0(&qword_268E22FD0, &qword_268E22FD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22FA8);
  }
  return result;
}

unint64_t sub_243DE9DCC()
{
  unint64_t result = qword_268E22FB8;
  if (!qword_268E22FB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22FC0);
    sub_243DEB284(&qword_268E22FC8, (void (*)(uint64_t))type metadata accessor for ReturnDetailsHeader);
    sub_243A569B0(&qword_268E1B0B8, &qword_268E1B0C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22FB8);
  }
  return result;
}

uint64_t sub_243DE9E9C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_243DFCC30();
  *a1 = v3;
  return result;
}

uint64_t sub_243DE9EC8()
{
  return sub_243DFCC40();
}

unint64_t sub_243DE9EF0()
{
  unint64_t result = qword_268E22FE0;
  if (!qword_268E22FE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E22F40);
    sub_243A569B0(&qword_268E22FE8, &qword_268E22F38);
    sub_243A569B0(&qword_268E1C9C8, &qword_268E1C9D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E22FE0);
  }
  return result;
}

uint64_t sub_243DE9FBC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_243DEA028(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_243DEA090@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for ReturnDetailsContentsSection(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_243DE8324(v4, a1);
}

uint64_t sub_243DEA110@<X0>(uint64_t a1@<X8>)
{
  return sub_243DE88F8(*(void *)(v1 + 16), a1);
}

uint64_t sub_243DEA118()
{
  return MEMORY[0x245684720]();
}

uint64_t sub_243DEA13C()
{
  return MEMORY[0x245684720]();
}

uint64_t sub_243DEA160(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1BBF8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243A567A4(a1, (uint64_t)v4, &qword_268E1BBF8);
  return MEMORY[0x245684730](v4);
}

uint64_t sub_243DEA1F8()
{
  return sub_243DE9818(v0[2], v0[3], v0[4]);
}

unint64_t sub_243DEA248()
{
  unint64_t result = qword_268E23030;
  if (!qword_268E23030)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E23028);
    sub_243C3D818();
    sub_243A569B0(&qword_268E1ABF0, &qword_268E1ABF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E23030);
  }
  return result;
}

uint64_t sub_243DEA2E8()
{
  return sub_243DE9818(v0[2], v0[3], v0[4]);
}

uint64_t objectdestroy_15Tm()
{
  uint64_t v1 = type metadata accessor for ReturnDetailsContentsSection(0);
  uint64_t v23 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v21 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v22 = (v23 + 16) & ~v23;
  uint64_t v24 = v0;
  uint64_t v2 = v0 + v22;
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + v22 + *(int *)(type metadata accessor for MerchantImage.ViewModel(0) + 20);
  uint64_t v4 = sub_243DFB3F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v22 + *(int *)(type metadata accessor for ReturnDetailsHeader.ViewModel(0) + 20);
  uint64_t v6 = sub_243DFBE80();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v9 = v2 + *(int *)(type metadata accessor for ReturnDetailsContentsSection.ViewModel(0) + 20);
  uint64_t v10 = sub_243DFB1E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
  uint64_t v12 = v9 + *(int *)(v11 + 20);
  if (!v8(v12, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v12, v6);
  }
  uint64_t v13 = v9 + *(int *)(v11 + 24);
  uint64_t v14 = type metadata accessor for OrderDetailsNote(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v13, 1, v14))
  {
    unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v16 = v13 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
      uint64_t v17 = sub_243DFB220();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
    }
    else if (EnumCaseMultiPayload <= 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v18 = v2 + *(int *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_243DFC8E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  }
  else
  {
    swift_release();
  }
  sub_243AFDCC0(*(void *)(v2 + *(int *)(v1 + 28)), *(unsigned char *)(v2 + *(int *)(v1 + 28) + 8));
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v24, ((v21 + v22 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v23 | 7);
}

void sub_243DEA788()
{
  uint64_t v1 = *(void *)(type metadata accessor for ReturnDetailsContentsSection(0) - 8);
  sub_243DE99B8(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
}

uint64_t sub_243DEA80C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_243DEA850(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_243DEA8B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    a5(a4);
  }
}

uint64_t sub_243DEA908()
{
  uint64_t v1 = type metadata accessor for ReturnDetailsContentsSection(0);
  uint64_t v23 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v21 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v22 = (v23 + 16) & ~v23;
  uint64_t v2 = v0 + v22;
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + v22 + *(int *)(type metadata accessor for MerchantImage.ViewModel(0) + 20);
  uint64_t v4 = sub_243DFB3F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v22 + *(int *)(type metadata accessor for ReturnDetailsHeader.ViewModel(0) + 20);
  uint64_t v6 = sub_243DFBE80();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v9 = v2 + *(int *)(type metadata accessor for ReturnDetailsContentsSection.ViewModel(0) + 20);
  uint64_t v10 = sub_243DFB1E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
  uint64_t v12 = v9 + *(int *)(v11 + 20);
  if (!v8(v12, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v12, v6);
  }
  uint64_t v13 = v9 + *(int *)(v11 + 24);
  uint64_t v14 = type metadata accessor for OrderDetailsNote(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v13, 1, v14))
  {
    unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v16 = v13 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
      uint64_t v17 = sub_243DFB220();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
    }
    else if (EnumCaseMultiPayload <= 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v18 = v2 + *(int *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_243DFC8E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  }
  else
  {
    swift_release();
  }
  sub_243AFDCC0(*(void *)(v2 + *(int *)(v1 + 28)), *(unsigned char *)(v2 + *(int *)(v1 + 28) + 8));

  return MEMORY[0x270FA0238](v0, ((v21 + v22 + 7) & 0xFFFFFFFFFFFFFFF8) + 32, v23 | 7);
}

uint64_t sub_243DEAD40()
{
  type metadata accessor for ReturnDetailsContentsSection(0);

  return sub_243DE8650();
}

uint64_t objectdestroyTm_33()
{
  uint64_t v1 = type metadata accessor for ReturnDetailsContentsSection(0);
  uint64_t v23 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v21 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v22 = (v23 + 16) & ~v23;
  uint64_t v2 = v0 + v22;
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + v22 + *(int *)(type metadata accessor for MerchantImage.ViewModel(0) + 20);
  uint64_t v4 = sub_243DFB3F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v22 + *(int *)(type metadata accessor for ReturnDetailsHeader.ViewModel(0) + 20);
  uint64_t v6 = sub_243DFBE80();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v9 = v2 + *(int *)(type metadata accessor for ReturnDetailsContentsSection.ViewModel(0) + 20);
  uint64_t v10 = sub_243DFB1E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = type metadata accessor for ReturnDetailsStatusLabel.ViewModel(0);
  uint64_t v12 = v9 + *(int *)(v11 + 20);
  if (!v8(v12, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v12, v6);
  }
  uint64_t v13 = v9 + *(int *)(v11 + 24);
  uint64_t v14 = type metadata accessor for OrderDetailsNote(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v13, 1, v14))
  {
    unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v16 = v13 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E1BCE0) + 64);
      uint64_t v17 = sub_243DFB220();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
    }
    else if (EnumCaseMultiPayload <= 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v18 = v2 + *(int *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v19 = sub_243DFC8E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  }
  else
  {
    swift_release();
  }
  sub_243AFDCC0(*(void *)(v2 + *(int *)(v1 + 28)), *(unsigned char *)(v2 + *(int *)(v1 + 28) + 8));

  return MEMORY[0x270FA0238](v0, v22 + v21, v23 | 7);
}

uint64_t sub_243DEB204()
{
  type metadata accessor for ReturnDetailsContentsSection(0);

  return sub_243DE87A4();
}

uint64_t sub_243DEB284(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_243DEB2CC(void *a1, void *a2)
{
  if ((sub_243B84570(a1, a2) & 1) == 0) {
    return 0;
  }
  uint64_t v4 = (int *)type metadata accessor for ReturnDetailsContentsSection.ViewModel(0);
  if (!sub_243D57380((uint64_t)a1 + v4[5], (uint64_t)a2 + v4[5])) {
    return 0;
  }
  uint64_t v5 = v4[6];
  uint64_t v6 = (void *)((char *)a1 + v5);
  uint64_t v7 = *(void *)((char *)a1 + v5 + 8);
  uint64_t v8 = (void *)((char *)a2 + v5);
  uint64_t v9 = v8[1];
  if (v7)
  {
    if (!v9) {
      return 0;
    }
    BOOL v10 = *v6 == *v8 && v7 == v9;
    if (!v10 && (sub_243DFF3A0() & 1) == 0) {
      return 0;
    }
  }
  else if (v9)
  {
    return 0;
  }
  uint64_t v11 = v4[7];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = *(void *)((char *)a1 + v11 + 8);
  uint64_t v14 = (void *)((char *)a2 + v11);
  uint64_t v15 = v14[1];
  if (v13)
  {
    if (!v15) {
      return 0;
    }
    BOOL v16 = *v12 == *v14 && v13 == v15;
    if (!v16 && (sub_243DFF3A0() & 1) == 0) {
      return 0;
    }
  }
  else if (v15)
  {
    return 0;
  }
  uint64_t v17 = v4[8];
  uint64_t v18 = *(void *)((char *)a1 + v17);
  uint64_t v19 = *(void *)((char *)a1 + v17 + 8);
  uint64_t v20 = (void *)((char *)a2 + v17);
  BOOL v21 = v18 == *v20 && v19 == v20[1];
  if (!v21 && (sub_243DFF3A0() & 1) == 0) {
    return 0;
  }
  uint64_t v22 = v4[9];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = *(void *)((char *)a1 + v22 + 8);
  uint64_t v25 = (void *)((char *)a2 + v22);
  uint64_t v26 = v25[1];
  if (v24)
  {
    if (!v26 || (*v23 != *v25 || v24 != v26) && (sub_243DFF3A0() & 1) == 0) {
      return 0;
    }
  }
  else if (v26)
  {
    return 0;
  }
  uint64_t v27 = v4[10];
  uint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = *(void *)((char *)a1 + v27 + 8);
  uint64_t v30 = (void *)((char *)a2 + v27);
  uint64_t v31 = v30[1];
  if (v29)
  {
    if (v31 && (*v28 == *v30 && v29 == v31 || (sub_243DFF3A0() & 1) != 0)) {
      goto LABEL_38;
    }
    return 0;
  }
  if (v31) {
    return 0;
  }
LABEL_38:
  uint64_t v32 = v4[11];
  uint64_t v33 = *(void *)((char *)a1 + v32);
  uint64_t v34 = *(void *)((char *)a2 + v32);

  return sub_243B43510(v33, v34);
}

uint64_t sub_243DEB490()
{
  return sub_243A569B0(&qword_268E23040, &qword_268E23048);
}

uint64_t sub_243DEB4CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243DEB4E0);
}

uint64_t sub_243DEB4E0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for OrderWidgetTimelineEntry(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18680);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + a3[5];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  if (a2 == 254)
  {
    unsigned int v14 = *(unsigned __int8 *)(a1 + a3[6] + 8);
    if (v14 > 1) {
      return (v14 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19698);
    BOOL v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[7];
    return v16(v18, a2, v17);
  }
}

uint64_t sub_243DEB664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243DEB678);
}

uint64_t sub_243DEB678(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = type metadata accessor for OrderWidgetTimelineEntry(0);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_268E18680);
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + a4[5];
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  if (a3 == 254)
  {
    *(unsigned char *)(a1 + a4[6] + 8) = -(char)a2;
  }
  else
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19698);
    BOOL v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a4[7];
    return v16(v18, a2, a2, v17);
  }
  return result;
}

uint64_t _s6MediumVMa()
{
  uint64_t result = qword_268E23050;
  if (!qword_268E23050) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_243DEB84C()
{
  type metadata accessor for OrderWidgetTimelineEntry(319);
  if (v0 <= 0x3F)
  {
    sub_243A99B34(319, (unint64_t *)&qword_268E186A0, MEMORY[0x263F18D80]);
    if (v1 <= 0x3F)
    {
      sub_243A99B34(319, &qword_268E196B0, MEMORY[0x263F1FC90]);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t sub_243DEB990()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_243DEB9AC@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v47 = a3;
  uint64_t v48 = (uint64_t *)a2;
  LODWORD(v46) = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23060);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23068);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _s6MediumVMa();
  uint64_t v44 = *(void *)(v9 - 8);
  uint64_t v10 = *(void *)(v44 + 64);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E196C8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v45 = (uint64_t)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  BOOL v16 = (char *)&v39 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23070);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v39 - v21;
  MEMORY[0x270FA5388](v23);
  if (v46)
  {
    uint64_t v40 = (uint64_t)&v39 - v24;
    uint64_t v41 = v17;
    uint64_t v42 = v6;
    uint64_t v43 = v8;
    uint64_t v46 = v3;
    uint64_t v25 = *v48;
    uint64_t v26 = *(void *)(*v48 + 16);
    uint64_t v27 = type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
    uint64_t v39 = *(void *)(v27 - 8);
    uint64_t v28 = v39;
    if (v26)
    {
      sub_243DEF6E8(v25 + ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80)), (uint64_t)v16, type metadata accessor for OrderWidgetTimelineEntry.OrderData);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v16, 0, 1, v27);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56))(v16, 1, 1, v27);
    }
    uint64_t v32 = v45;
    sub_243A567A4((uint64_t)v16, v45, &qword_268E196C8);
    sub_243DEF6E8((uint64_t)v48, (uint64_t)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))_s6MediumVMa);
    unint64_t v33 = (*(unsigned __int8 *)(v44 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
    uint64_t v34 = swift_allocObject();
    sub_243DEF680((uint64_t)v11, v34 + v33, (uint64_t (*)(void))_s6MediumVMa);
    type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56))(v19, 1, 1, v27);
    sub_243A9B540(v32, (uint64_t)v19);
    unsigned __int8 v35 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))&v19[*(int *)(v41 + 36)];
    *unsigned __int8 v35 = sub_243DEF5D0;
    v35[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v34;
    uint64_t v30 = &qword_268E23070;
    sub_243A56740((uint64_t)v19, (uint64_t)v22, &qword_268E23070);
    sub_243A56808((uint64_t)v16, &qword_268E196C8);
    uint64_t v36 = (uint64_t)v22;
    uint64_t v37 = v40;
    sub_243A56740(v36, v40, &qword_268E23070);
    sub_243A567A4(v37, (uint64_t)v43, &qword_268E23070);
    swift_storeEnumTagMultiPayload();
    sub_243A569B0(&qword_268E23080, &qword_268E23070);
    sub_243A569B0(&qword_268E23088, &qword_268E23060);
    sub_243DFD170();
    uint64_t v31 = v37;
  }
  else
  {
    *(void *)uint64_t v5 = sub_243DFD000();
    *((void *)v5 + 1) = 0;
    v5[16] = 0;
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23078);
    sub_243DECD44((uint64_t)v48, &v5[*(int *)(v29 + 44)]);
    uint64_t v30 = &qword_268E23060;
    sub_243A567A4((uint64_t)v5, (uint64_t)v8, &qword_268E23060);
    swift_storeEnumTagMultiPayload();
    sub_243A569B0(&qword_268E23080, &qword_268E23070);
    sub_243A569B0(&qword_268E23088, &qword_268E23060);
    sub_243DFD170();
    uint64_t v31 = (uint64_t)v5;
  }
  return sub_243A56808(v31, v30);
}

uint64_t sub_243DEBF40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A718);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A720);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23090);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v8 = sub_243DFCE60();
  *((void *)v8 + 1) = 0;
  v8[16] = 0;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23098);
  sub_243DEC1C0(a1, a2, (uint64_t)&v8[*(int *)(v16 + 44)]);
  uint64_t v17 = sub_243DFE4F0();
  sub_243AD1D5C(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v11, 0.0, 1, INFINITY, 0, v17, v18);
  sub_243A56808((uint64_t)v8, &qword_268E1A718);
  uint64_t v19 = a2 + *(int *)(_s6MediumVMa() + 24);
  uint64_t v20 = *(void *)v19;
  LOBYTE(a2) = *(unsigned char *)(v19 + 8);
  sub_243A556F8(*(void *)v19, a2);
  sub_243AFB580(v20, a2);
  sub_243A557AC(v20, a2);
  LOBYTE(v20) = sub_243DFD730();
  sub_243DFC480();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  sub_243A567A4((uint64_t)v11, (uint64_t)v15, &qword_268E1A720);
  uint64_t v29 = &v15[*(int *)(v13 + 44)];
  *uint64_t v29 = v20;
  *((void *)v29 + 1) = v22;
  *((void *)v29 + 2) = v24;
  *((void *)v29 + 3) = v26;
  *((void *)v29 + 4) = v28;
  v29[40] = 0;
  sub_243A56808((uint64_t)v11, &qword_268E1A720);
  return sub_243A56740((uint64_t)v15, a3, &qword_268E23090);
}

uint64_t sub_243DEC1C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E230A0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v23 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E230A8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v23 - v16;
  *(void *)uint64_t v17 = sub_243DFD000();
  *((void *)v17 + 1) = 0;
  v17[16] = 0;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E230B0);
  sub_243DEC3CC(a1, (uint64_t)&v17[*(int *)(v18 + 44)]);
  *(void *)uint64_t v11 = sub_243DFCFF0();
  *((void *)v11 + 1) = 0;
  v11[16] = 0;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E230B8);
  sub_243DECA44(a1, a2, (uint64_t)&v11[*(int *)(v19 + 44)]);
  sub_243A567A4((uint64_t)v17, (uint64_t)v14, &qword_268E230A8);
  sub_243A567A4((uint64_t)v11, (uint64_t)v8, &qword_268E230A0);
  sub_243A567A4((uint64_t)v14, a3, &qword_268E230A8);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E230C0);
  uint64_t v21 = a3 + *(int *)(v20 + 48);
  *(void *)uint64_t v21 = 0x4024000000000000;
  *(unsigned char *)(v21 + 8) = 0;
  sub_243A567A4((uint64_t)v8, a3 + *(int *)(v20 + 64), &qword_268E230A0);
  sub_243A56808((uint64_t)v11, &qword_268E230A0);
  sub_243A56808((uint64_t)v17, &qword_268E230A8);
  sub_243A56808((uint64_t)v8, &qword_268E230A0);
  return sub_243A56808((uint64_t)v14, &qword_268E230A8);
}

uint64_t sub_243DEC3CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v82 = a2;
  uint64_t v3 = type metadata accessor for OrderWidgetMerchantTitleModifier();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v78 = (uint64_t *)((char *)&v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  uint64_t v80 = (uint64_t)&v76 - v6;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19710) - 8;
  MEMORY[0x270FA5388](v79);
  uint64_t v77 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19718) - 8;
  MEMORY[0x270FA5388](v81);
  uint64_t v84 = (uint64_t)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v85 = (uint64_t)&v76 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19720);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19728);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v83 = (uint64_t)&v76 - v19;
  uint64_t v20 = (int *)type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
  uint64_t v21 = v20[8];
  uint64_t v76 = a1;
  uint64_t v22 = (uint64_t *)(a1 + v21);
  uint64_t v23 = v22[1];
  uint64_t v87 = *v22;
  uint64_t v88 = v23;
  sub_243A56634();
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_243DFDAA0();
  uint64_t v26 = v25;
  char v28 = v27 & 1;
  sub_243A9ABBC(*(void *)(a1 + v20[9]), v24, v25, v27 & 1, v29, (uint64_t)v13);
  sub_243A56688(v24, v26, v28);
  swift_bridgeObjectRelease();
  uint64_t v30 = sub_243DFD8B0();
  uint64_t KeyPath = swift_getKeyPath();
  sub_243A567A4((uint64_t)v13, (uint64_t)v17, &qword_268E19720);
  uint64_t v32 = (uint64_t *)&v17[*(int *)(v15 + 44)];
  *uint64_t v32 = KeyPath;
  v32[1] = v30;
  sub_243A56808((uint64_t)v13, &qword_268E19720);
  uint64_t v86 = v17;
  uint64_t v33 = v83;
  sub_243A56740((uint64_t)v17, v83, &qword_268E19728);
  uint64_t v34 = v20;
  uint64_t v35 = v76;
  uint64_t v36 = (uint64_t *)(v76 + v20[7]);
  uint64_t v37 = v36[1];
  uint64_t v87 = *v36;
  uint64_t v88 = v37;
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_243DFDAA0();
  uint64_t v40 = v39;
  LOBYTE(v15) = v41;
  uint64_t v43 = v42;
  uint64_t v44 = swift_getKeyPath();
  uint64_t v45 = v78;
  *uint64_t v78 = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  swift_storeEnumTagMultiPayload();
  uint64_t v46 = (uint64_t)v45;
  uint64_t v47 = v80;
  sub_243DEF680(v46, v80, (uint64_t (*)(void))type metadata accessor for OrderWidgetMerchantTitleModifier);
  uint64_t v48 = (uint64_t)v77;
  sub_243DEF6E8(v47, (uint64_t)&v77[*(int *)(v79 + 44)], (uint64_t (*)(void))type metadata accessor for OrderWidgetMerchantTitleModifier);
  *(void *)uint64_t v48 = v38;
  *(void *)(v48 + 8) = v40;
  *(unsigned char *)(v48 + 16) = v15 & 1;
  *(void *)(v48 + 24) = v43;
  sub_243DEFD88(v47, (uint64_t (*)(void))type metadata accessor for OrderWidgetMerchantTitleModifier);
  uint64_t v49 = sub_243DFD7B0();
  uint64_t v50 = swift_getKeyPath();
  uint64_t v51 = v84;
  sub_243A567A4(v48, v84, &qword_268E19710);
  uint64_t v52 = (uint64_t *)(v51 + *(int *)(v81 + 44));
  *uint64_t v52 = v50;
  v52[1] = v49;
  sub_243A56808(v48, &qword_268E19710);
  uint64_t v53 = v51;
  uint64_t v54 = v85;
  sub_243A56740(v51, v85, &qword_268E19718);
  uint64_t v55 = (uint64_t *)(v35 + v34[10]);
  uint64_t v56 = v55[1];
  if (v56)
  {
    uint64_t v87 = *v55;
    uint64_t v88 = v56;
    swift_bridgeObjectRetain();
    uint64_t v57 = sub_243DFDAA0();
    uint64_t v80 = v58;
    uint64_t v81 = v57;
    uint64_t v79 = v59;
    uint64_t v61 = v60 & 1;
    uint64_t v78 = (void *)swift_getKeyPath();
    uint64_t v77 = (char *)swift_getKeyPath();
    uint64_t v62 = sub_243DFD3E0();
    uint64_t v76 = sub_243DFD7B0();
    uint64_t v63 = swift_getKeyPath();
    uint64_t v64 = v62 << 32;
    uint64_t v65 = 1;
  }
  else
  {
    uint64_t v80 = 0;
    uint64_t v81 = 0;
    uint64_t v61 = 0;
    uint64_t v78 = 0;
    uint64_t v79 = 0;
    uint64_t v65 = 0;
    uint64_t v76 = 0;
    uint64_t v77 = 0;
    uint64_t v64 = 0;
    uint64_t v63 = 0;
  }
  uint64_t v66 = (uint64_t)v86;
  sub_243A567A4(v33, (uint64_t)v86, &qword_268E19728);
  sub_243A567A4(v54, v53, &qword_268E19718);
  uint64_t v67 = v66;
  uint64_t v68 = v82;
  sub_243A567A4(v67, v82, &qword_268E19728);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E230C8);
  sub_243A567A4(v53, v68 + *(int *)(v69 + 48), &qword_268E19718);
  uint64_t v70 = (uint64_t *)(v68 + *(int *)(v69 + 64));
  uint64_t v72 = v80;
  uint64_t v71 = v81;
  *uint64_t v70 = v81;
  v70[1] = v72;
  uint64_t v73 = v78;
  uint64_t v74 = v79;
  v70[2] = v61;
  v70[3] = v74;
  v70[4] = (uint64_t)v73;
  v70[5] = v65;
  v70[6] = (uint64_t)v77;
  v70[7] = v65;
  v70[8] = v64;
  v70[9] = v63;
  v70[10] = v76;
  sub_243DD1B38(v71, v72, v61, v74);
  sub_243A56808(v85, &qword_268E19718);
  sub_243A56808(v83, &qword_268E19728);
  sub_243DD1BB8(v71, v72, v61, v74);
  sub_243A56808(v84, &qword_268E19718);
  return sub_243A56808((uint64_t)v86, &qword_268E19728);
}

uint64_t sub_243DECA44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for OrderWidgetImageView();
  uint64_t v10 = (int *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v28 - v14;
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v28 - v17;
  sub_243DEF6E8(a1, (uint64_t)v8, type metadata accessor for OrderWidgetTimelineEntry.OrderData);
  uint64_t v19 = *(void *)(a2 + *(int *)(type metadata accessor for OrderWidgetTimelineEntry(0) + 24));
  double v20 = 40.0;
  if (v19 == 2) {
    double v20 = 50.0;
  }
  if (v19 == 1) {
    double v21 = 72.0;
  }
  else {
    double v21 = v20;
  }
  sub_243DEF680((uint64_t)v8, (uint64_t)v15, type metadata accessor for OrderWidgetTimelineEntry.OrderData);
  *(double *)&v15[v10[7]] = v21;
  *(double *)&v15[v10[8]] = v21;
  *(void *)&v15[v10[9]] = 0x4018000000000000;
  uint64_t v22 = (uint64_t *)&v15[v10[10]];
  *uint64_t v22 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
  swift_storeEnumTagMultiPayload();
  uint64_t v23 = (uint64_t *)&v15[v10[11]];
  *uint64_t v23 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E19740);
  swift_storeEnumTagMultiPayload();
  uint64_t v24 = &v15[v10[12]];
  *(void *)uint64_t v24 = swift_getKeyPath();
  v24[40] = 0;
  uint64_t v25 = (uint64_t *)&v15[v10[13]];
  *uint64_t v25 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E19690);
  swift_storeEnumTagMultiPayload();
  sub_243DEF680((uint64_t)v15, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  sub_243DEF6E8((uint64_t)v18, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  *(void *)a3 = 0;
  *(unsigned char *)(a3 + 8) = 1;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19748);
  sub_243DEF6E8((uint64_t)v12, a3 + *(int *)(v26 + 48), (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  sub_243DEFD88((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  return sub_243DEFD88((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
}

uint64_t sub_243DECD44@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  char v41 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E196C0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v42 = (uint64_t)v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v43 = (void *)((char *)v37 - v6);
  v37[0] = _s6MediumVMa();
  uint64_t v7 = *(void *)(v37[0] - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v37[0]);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E230D0);
  uint64_t v9 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v40 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v37 - v12;
  uint64_t v14 = *(void *)a1;
  if (*(void *)(*(void *)a1 + 16) >= 2uLL) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = *(void *)(*(void *)a1 + 16);
  }
  uint64_t v16 = *(void *)(type metadata accessor for OrderWidgetTimelineEntry.OrderData(0) - 8);
  uint64_t v17 = v14 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
  uint64_t v44 = v14;
  uint64_t v45 = v17;
  uint64_t v18 = (2 * v15) | 1;
  uint64_t v46 = 0;
  uint64_t v47 = v18;
  v37[1] = swift_getKeyPath();
  sub_243DEF6E8(a1, (uint64_t)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))_s6MediumVMa);
  unint64_t v19 = (*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  double v20 = (void *)swift_allocObject();
  v20[2] = v14;
  v20[3] = v17;
  v20[4] = 0;
  v20[5] = v18;
  sub_243DEF680((uint64_t)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v20 + v19, (uint64_t (*)(void))_s6MediumVMa);
  uint64_t v39 = v14;
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E230D8);
  sub_243A569B0(&qword_268E22B30, &qword_268E22B20);
  sub_243DD1AF0(&qword_268E1E420, MEMORY[0x263F05F80]);
  sub_243A569B0(&qword_268E230E0, &qword_268E230D8);
  double v21 = v13;
  sub_243DFE390();
  uint64_t v22 = *(void *)(a1 + *(int *)(type metadata accessor for OrderWidgetTimelineEntry(0) + 24));
  if (v22 < 3)
  {
    uint64_t v26 = type metadata accessor for OrderWidgetMoreTextView();
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v43, 1, 1, v26);
  }
  else
  {
    uint64_t v23 = v22 - 2;
    uint64_t v24 = type metadata accessor for OrderWidgetMoreTextView();
    uint64_t v25 = v43;
    sub_243AFBCF4((uint64_t)v43 + *(int *)(v24 + 20));
    *uint64_t v25 = v23;
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v25, 0, 1, v24);
  }
  char v27 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  uint64_t v28 = v40;
  uint64_t v29 = v21;
  uint64_t v30 = v38;
  v27(v40, v21, v38);
  uint64_t v32 = v42;
  uint64_t v31 = (uint64_t)v43;
  sub_243A567A4((uint64_t)v43, v42, &qword_268E196C0);
  uint64_t v33 = v41;
  v27(v41, v28, v30);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E230E8);
  sub_243A567A4(v32, (uint64_t)&v33[*(int *)(v34 + 48)], &qword_268E196C0);
  swift_bridgeObjectRelease();
  sub_243A56808(v31, &qword_268E196C0);
  uint64_t v35 = *(void (**)(char *, uint64_t))(v9 + 8);
  v35(v29, v30);
  sub_243A56808(v32, &qword_268E196C0);
  return ((uint64_t (*)(char *, uint64_t))v35)(v28, v30);
}

uint64_t sub_243DED27C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, unint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v115 = a5;
  unint64_t v120 = a4;
  uint64_t v124 = a3;
  uint64_t v104 = a2;
  uint64_t v105 = a6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B48);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v106 = (char *)&v98 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v98 - v10;
  uint64_t v12 = _s6MediumVMa();
  uint64_t v110 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v111 = v13;
  uint64_t v114 = (uint64_t)&v98 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E196C8);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v113 = (uint64_t)&v98 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E230F0);
  MEMORY[0x270FA5388](v112);
  uint64_t v117 = (char *)&v98 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v116 = (uint64_t)&v98 - v18;
  uint64_t v19 = sub_243DFB3F0();
  double v20 = *(void **)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v100 = (char *)&v98 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B58);
  MEMORY[0x270FA5388](v22);
  uint64_t v109 = (uint64_t)&v98 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v98 - v25;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22B60);
  MEMORY[0x270FA5388](v27 - 8);
  uint64_t v99 = (uint64_t)&v98 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v119 = (char *)&v98 - v30;
  MEMORY[0x270FA5388](v31);
  v121 = (char *)&v98 - v32;
  MEMORY[0x270FA5388](v33);
  uint64_t v101 = (uint64_t)&v98 - v34;
  MEMORY[0x270FA5388](v35);
  uint64_t v37 = (char *)&v98 - v36;
  double v39 = MEMORY[0x270FA5388](v38);
  char v41 = (char *)&v98 - v40;
  uint64_t v42 = (void (*)(char *, uint64_t, uint64_t))v20[2];
  uint64_t v118 = a1;
  uint64_t v122 = v42;
  unsigned int v123 = v20 + 2;
  ((void (*)(char *, uint64_t, uint64_t, double))v42)((char *)&v98 - v40, a1, v19, v39);
  uint64_t v43 = (uint64_t (*)(char *, void, uint64_t, uint64_t))v20[7];
  uint64_t v44 = 1;
  uint64_t result = v43(v41, 0, 1, v19);
  int64_t v46 = v120 >> 1;
  unint64_t v120 = v46;
  if (v46 != v124)
  {
    if (v46 <= v124)
    {
      __break(1u);
      goto LABEL_31;
    }
    uint64_t v47 = v124;
    uint64_t v48 = type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
    v122(v37, v104 + *(void *)(*(void *)(v48 - 8) + 72) * v47, v19);
    uint64_t v44 = 0;
  }
  uint64_t v102 = v11;
  uint64_t v107 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v43;
  v43(v37, v44, 1, v19);
  uint64_t v108 = v22;
  uint64_t v49 = (uint64_t)&v26[*(int *)(v22 + 48)];
  sub_243A567A4((uint64_t)v41, (uint64_t)v26, &qword_268E22B60);
  sub_243A567A4((uint64_t)v37, v49, &qword_268E22B60);
  uint64_t v50 = v20;
  uint64_t v51 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v20[6];
  if (v51((uint64_t)v26, 1, v19) == 1)
  {
    sub_243A56808((uint64_t)v37, &qword_268E22B60);
    sub_243A56808((uint64_t)v41, &qword_268E22B60);
    int v52 = v51(v49, 1, v19);
    if (v52 == 1) {
      uint64_t v53 = &qword_268E22B60;
    }
    else {
      uint64_t v53 = &qword_268E22B58;
    }
    if (v52 == 1) {
      int v54 = -1;
    }
    else {
      int v54 = 0;
    }
    int v103 = v54;
    uint64_t v55 = v118;
    uint64_t v56 = v50;
  }
  else
  {
    uint64_t v57 = v101;
    sub_243A567A4((uint64_t)v26, v101, &qword_268E22B60);
    if (v51(v49, 1, v19) == 1)
    {
      sub_243A56808((uint64_t)v37, &qword_268E22B60);
      sub_243A56808((uint64_t)v41, &qword_268E22B60);
      uint64_t v56 = v50;
      ((void (*)(uint64_t, uint64_t))v50[1])(v57, v19);
      int v103 = 0;
      uint64_t v53 = &qword_268E22B58;
    }
    else
    {
      uint64_t v98 = v51;
      uint64_t v58 = v50;
      uint64_t v59 = (void (*)(char *, uint64_t, uint64_t))v50[4];
      char v60 = v100;
      v59(v100, v49, v19);
      sub_243DD1AF0(&qword_268E22B70, MEMORY[0x263F05F80]);
      int v103 = sub_243DFE870();
      uint64_t v61 = (void (*)(char *, uint64_t))v58[1];
      v61(v60, v19);
      uint64_t v62 = (void (*)(uint64_t, uint64_t))v61;
      uint64_t v53 = &qword_268E22B60;
      uint64_t v63 = (uint64_t)v37;
      uint64_t v56 = v58;
      uint64_t v51 = v98;
      sub_243A56808(v63, &qword_268E22B60);
      sub_243A56808((uint64_t)v41, &qword_268E22B60);
      v62(v101, v19);
    }
    uint64_t v55 = v118;
  }
  sub_243A56808((uint64_t)v26, v53);
  uint64_t v64 = (uint64_t)v121;
  v122(v121, v55, v19);
  uint64_t v65 = 1;
  uint64_t v66 = v107;
  uint64_t result = ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v107)(v64, 0, 1, v19);
  uint64_t v67 = v108;
  if (v120 == v124) {
    goto LABEL_19;
  }
  if ((uint64_t)v120 <= v124)
  {
LABEL_31:
    __break(1u);
    return result;
  }
  unint64_t v68 = v120 - 1;
  uint64_t v69 = type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
  v122(v119, v104 + *(void *)(*(void *)(v69 - 8) + 72) * v68, v19);
  uint64_t v65 = 0;
LABEL_19:
  uint64_t v70 = v66;
  uint64_t v71 = v119;
  v70(v119, v65, 1, v19);
  uint64_t v72 = (uint64_t)v71;
  uint64_t v73 = *(int *)(v67 + 48);
  uint64_t v74 = v109;
  uint64_t v75 = v109 + v73;
  uint64_t v76 = &qword_268E22B60;
  sub_243A567A4(v64, v109, &qword_268E22B60);
  sub_243A567A4(v72, v75, &qword_268E22B60);
  if (v51(v74, 1, v19) == 1)
  {
    sub_243A56808(v72, &qword_268E22B60);
    sub_243A56808(v64, &qword_268E22B60);
    if (v51(v75, 1, v19) == 1)
    {
      char v77 = -1;
    }
    else
    {
      uint64_t v76 = &qword_268E22B58;
      char v77 = 0;
    }
  }
  else
  {
    uint64_t v78 = v99;
    sub_243A567A4(v74, v99, &qword_268E22B60);
    if (v51(v75, 1, v19) == 1)
    {
      sub_243A56808(v72, &qword_268E22B60);
      sub_243A56808((uint64_t)v121, &qword_268E22B60);
      ((void (*)(uint64_t, uint64_t))v56[1])(v78, v19);
      char v77 = 0;
      uint64_t v76 = &qword_268E22B58;
    }
    else
    {
      uint64_t v79 = v100;
      ((void (*)(char *, uint64_t, uint64_t))v56[4])(v100, v75, v19);
      sub_243DD1AF0(&qword_268E22B70, MEMORY[0x263F05F80]);
      char v77 = sub_243DFE870();
      uint64_t v80 = (void (*)(char *, uint64_t))v56[1];
      v80(v79, v19);
      uint64_t v76 = &qword_268E22B60;
      sub_243A56808(v72, &qword_268E22B60);
      sub_243A56808((uint64_t)v121, &qword_268E22B60);
      v80((char *)v78, v19);
    }
  }
  uint64_t v81 = (uint64_t)v102;
  sub_243A56808(v74, v76);
  uint64_t v82 = v113;
  sub_243DEF6E8(v55, v113, type metadata accessor for OrderWidgetTimelineEntry.OrderData);
  uint64_t v83 = type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
  uint64_t v84 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v83 - 8) + 56);
  v84(v82, 0, 1, v83);
  uint64_t v85 = v114;
  sub_243DEF6E8(v115, v114, (uint64_t (*)(void))_s6MediumVMa);
  unint64_t v86 = (*(unsigned __int8 *)(v110 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v110 + 80);
  uint64_t v87 = v86 + v111;
  uint64_t v88 = swift_allocObject();
  sub_243DEF680(v85, v88 + v86, (uint64_t (*)(void))_s6MediumVMa);
  uint64_t v89 = (unsigned char *)(v88 + v87);
  unsigned char *v89 = v103 & 1;
  v89[1] = v77 & 1;
  uint64_t v90 = (uint64_t)v117;
  v84((uint64_t)v117, 1, 1, v83);
  sub_243A9B540(v82, v90);
  uint64_t v91 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))(v90 + *(int *)(v112 + 36));
  char *v91 = sub_243DEFCDC;
  v91[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v88;
  uint64_t v92 = v116;
  sub_243A56740(v90, v116, &qword_268E230F0);
  if (v77)
  {
    uint64_t v93 = sub_243DFE380();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v93 - 8) + 56))(v81, 1, 1, v93);
  }
  else
  {
    sub_243DFE370();
    uint64_t v94 = sub_243DFE380();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v94 - 8) + 56))(v81, 0, 1, v94);
  }
  uint64_t v96 = v105;
  uint64_t v95 = (uint64_t)v106;
  sub_243A567A4(v92, v90, &qword_268E230F0);
  sub_243A567A4(v81, v95, &qword_268E22B48);
  sub_243A567A4(v90, v96, &qword_268E230F0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E230F8);
  sub_243A567A4(v95, v96 + *(int *)(v97 + 48), &qword_268E22B48);
  sub_243A56808(v81, &qword_268E22B48);
  sub_243A56808(v92, &qword_268E230F0);
  sub_243A56808(v95, &qword_268E22B48);
  return sub_243A56808(v90, &qword_268E230F0);
}

uint64_t sub_243DEDEBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>)
{
  v70[1] = a4;
  int v76 = a3;
  uint64_t v81 = a5;
  uint64_t v7 = sub_243DFC8E0();
  uint64_t v74 = *(void *)(v7 - 8);
  uint64_t v75 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v73 = (char *)v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v72 = (uint64_t)v70 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23100);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23108);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23110);
  MEMORY[0x270FA5388](v77);
  uint64_t v19 = (char *)v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23118);
  MEMORY[0x270FA5388](v79);
  uint64_t v80 = (uint64_t)v70 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = *(int *)(type metadata accessor for OrderWidgetTimelineEntry(0) + 24);
  int v21 = *(void *)(a2 + v78) > 2;
  *(void *)uint64_t v13 = sub_243DFCE70();
  *((void *)v13 + 1) = 0;
  v13[16] = 1;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23120);
  sub_243DEE52C(a1, v21, a2, (uint64_t)&v13[*(int *)(v22 + 44)]);
  LOBYTE(v21) = sub_243DFD720();
  uint64_t v71 = _s6MediumVMa();
  uint64_t v23 = a2 + *(int *)(v71 + 24);
  uint64_t v24 = *(void *)v23;
  LOBYTE(a1) = *(unsigned char *)(v23 + 8);
  sub_243A556F8(*(void *)v23, a1);
  sub_243AFB580(v24, a1);
  sub_243A557AC(v24, a1);
  sub_243DFC480();
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  sub_243A567A4((uint64_t)v13, (uint64_t)v17, &qword_268E23100);
  uint64_t v33 = &v17[*(int *)(v15 + 44)];
  *uint64_t v33 = v21;
  *((void *)v33 + 1) = v26;
  *((void *)v33 + 2) = v28;
  *((void *)v33 + 3) = v30;
  *((void *)v33 + 4) = v32;
  v33[40] = 0;
  sub_243A56808((uint64_t)v13, &qword_268E23100);
  char v34 = sub_243DFD740();
  uint64_t v35 = *(void *)v23;
  LOBYTE(v21) = *(unsigned char *)(v23 + 8);
  sub_243A556F8(*(void *)v23, v21);
  LOBYTE(v24) = sub_243AFB580(v35, v21);
  sub_243A557AC(v35, v21);
  if ((v24 & 1) != 0 && (v76 & 1) == 0 && *(uint64_t *)(a2 + v78) >= 3)
  {
    uint64_t v36 = v72;
    sub_243AFB7C0(v72);
    uint64_t v38 = v73;
    uint64_t v37 = v74;
    uint64_t v39 = v75;
    (*(void (**)(char *, void, uint64_t))(v74 + 104))(v73, *MEMORY[0x263F18D60], v75);
    sub_243DD1AF0((unint64_t *)&qword_268E196F8, MEMORY[0x263F18D80]);
    int v76 = sub_243DFE860();
    uint64_t v40 = *(void (**)(char *, uint64_t))(v37 + 8);
    v40(v38, v39);
    v40((char *)v36, v39);
  }
  sub_243DFC480();
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  sub_243A567A4((uint64_t)v17, (uint64_t)v19, &qword_268E23108);
  uint64_t v49 = &v19[*(int *)(v77 + 36)];
  *uint64_t v49 = v34;
  *((void *)v49 + 1) = v42;
  *((void *)v49 + 2) = v44;
  *((void *)v49 + 3) = v46;
  *((void *)v49 + 4) = v48;
  v49[40] = 0;
  sub_243A56808((uint64_t)v17, &qword_268E23108);
  char v50 = sub_243DFD750();
  uint64_t v51 = *(void *)v23;
  char v52 = *(unsigned char *)(v23 + 8);
  sub_243A556F8(*(void *)v23, v52);
  char v53 = sub_243AFB580(v51, v52);
  sub_243A557AC(v51, v52);
  if ((v53 & 1) != 0 && *(uint64_t *)(a2 + v78) > 2)
  {
    uint64_t v54 = v72;
    sub_243AFB7C0(v72);
    uint64_t v56 = v73;
    uint64_t v55 = v74;
    uint64_t v57 = v75;
    (*(void (**)(char *, void, uint64_t))(v74 + 104))(v73, *MEMORY[0x263F18D60], v75);
    sub_243DD1AF0((unint64_t *)&qword_268E196F8, MEMORY[0x263F18D80]);
    sub_243DFE860();
    uint64_t v58 = *(void (**)(char *, uint64_t))(v55 + 8);
    v58(v56, v57);
    v58((char *)v54, v57);
  }
  sub_243DFC480();
  uint64_t v60 = v59;
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  uint64_t v66 = v65;
  uint64_t v67 = v80;
  sub_243A567A4((uint64_t)v19, v80, &qword_268E23110);
  uint64_t v68 = v67 + *(int *)(v79 + 36);
  *(unsigned char *)uint64_t v68 = v50;
  *(void *)(v68 + 8) = v60;
  *(void *)(v68 + 16) = v62;
  *(void *)(v68 + 24) = v64;
  *(void *)(v68 + 32) = v66;
  *(unsigned char *)(v68 + 40) = 0;
  sub_243A56808((uint64_t)v19, &qword_268E23110);
  return sub_243A56740(v67, v81, &qword_268E23118);
}

uint64_t sub_243DEE52C@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v39 = a4;
  uint64_t v7 = type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for OrderWidgetImageView();
  uint64_t v11 = (int *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v38 - v15;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v38 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22BA0);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v38 - v24;
  *(void *)uint64_t v25 = sub_243DFD000();
  *((void *)v25 + 1) = 0;
  v25[16] = 0;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E22BA8);
  sub_243DEE920(a1, a2, a3, (uint64_t)&v25[*(int *)(v26 + 44)]);
  sub_243DEF6E8(a1, (uint64_t)v9, type metadata accessor for OrderWidgetTimelineEntry.OrderData);
  uint64_t v27 = *(void *)(a3 + *(int *)(type metadata accessor for OrderWidgetTimelineEntry(0) + 24));
  double v28 = 40.0;
  if (v27 == 2) {
    double v28 = 50.0;
  }
  if (v27 == 1) {
    double v29 = 72.0;
  }
  else {
    double v29 = v28;
  }
  sub_243DEF680((uint64_t)v9, (uint64_t)v16, type metadata accessor for OrderWidgetTimelineEntry.OrderData);
  *(double *)&v16[v11[7]] = v29;
  *(double *)&v16[v11[8]] = v29;
  *(void *)&v16[v11[9]] = 0x4018000000000000;
  uint64_t v30 = (uint64_t *)&v16[v11[10]];
  *uint64_t v30 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18600);
  swift_storeEnumTagMultiPayload();
  uint64_t v31 = (uint64_t *)&v16[v11[11]];
  *uint64_t v31 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E19740);
  swift_storeEnumTagMultiPayload();
  uint64_t v32 = &v16[v11[12]];
  *(void *)uint64_t v32 = swift_getKeyPath();
  v32[40] = 0;
  uint64_t v33 = (uint64_t *)&v16[v11[13]];
  *uint64_t v33 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E19690);
  swift_storeEnumTagMultiPayload();
  sub_243DEF680((uint64_t)v16, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  sub_243A567A4((uint64_t)v25, (uint64_t)v22, &qword_268E22BA0);
  sub_243DEF6E8((uint64_t)v19, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  uint64_t v34 = v39;
  sub_243A567A4((uint64_t)v22, v39, &qword_268E22BA0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23128);
  uint64_t v36 = v34 + *(int *)(v35 + 48);
  *(void *)uint64_t v36 = 0x4024000000000000;
  *(unsigned char *)(v36 + 8) = 0;
  sub_243DEF6E8((uint64_t)v13, v34 + *(int *)(v35 + 64), (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  sub_243DEFD88((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  sub_243A56808((uint64_t)v25, &qword_268E22BA0);
  sub_243DEFD88((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for OrderWidgetImageView);
  return sub_243A56808((uint64_t)v22, &qword_268E22BA0);
}

uint64_t sub_243DEE920@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v109 = a3;
  LODWORD(v124) = a2;
  uint64_t v118 = a4;
  uint64_t v114 = _s6MediumVMa();
  MEMORY[0x270FA5388](v114);
  uint64_t v110 = (char *)&v106 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_243DFC8E0();
  uint64_t v117 = *(void *)(v108 - 8);
  MEMORY[0x270FA5388](v108);
  uint64_t v116 = (char *)&v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v115 = (uint64_t)&v106 - v8;
  uint64_t v9 = type metadata accessor for OrderWidgetMerchantTitleModifier();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v106 = (uint64_t *)((char *)&v106 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v11);
  uint64_t v112 = (uint64_t)&v106 - v12;
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19710);
  MEMORY[0x270FA5388](v107);
  uint64_t v14 = (char *)&v106 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19718);
  MEMORY[0x270FA5388](v113);
  uint64_t v122 = (uint64_t)&v106 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v111 = (uint64_t)&v106 - v17;
  MEMORY[0x270FA5388](v18);
  uint64_t v123 = (uint64_t)&v106 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19720);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v106 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19728);
  MEMORY[0x270FA5388](v23);
  uint64_t v121 = (uint64_t)&v106 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)&v106 - v26;
  MEMORY[0x270FA5388](v28);
  uint64_t v125 = (uint64_t)&v106 - v29;
  uint64_t v30 = type metadata accessor for OrderWidgetTimelineEntry.OrderData(0);
  uint64_t v31 = (uint64_t *)(a1 + *(int *)(v30 + 32));
  uint64_t v32 = v31[1];
  uint64_t v126 = *v31;
  uint64_t v127 = v32;
  unint64_t v33 = sub_243A56634();
  swift_bridgeObjectRetain();
  unint64_t v119 = v33;
  uint64_t v34 = sub_243DFDAA0();
  uint64_t v36 = v35;
  char v38 = v37 & 1;
  uint64_t v120 = v30;
  uint64_t v39 = *(int *)(v30 + 36);
  uint64_t v40 = a1;
  sub_243A9ABBC(*(void *)(a1 + v39), v34, v35, v37 & 1, v41, (uint64_t)v22);
  sub_243A56688(v34, v36, v38);
  swift_bridgeObjectRelease();
  if (v124) {
    uint64_t v42 = sub_243DFD930();
  }
  else {
    uint64_t v42 = sub_243DFD7B0();
  }
  uint64_t v43 = v42;
  uint64_t v44 = v107;
  uint64_t v45 = v106;
  uint64_t KeyPath = swift_getKeyPath();
  sub_243A567A4((uint64_t)v22, (uint64_t)v27, &qword_268E19720);
  uint64_t v47 = (uint64_t *)&v27[*(int *)(v23 + 36)];
  *uint64_t v47 = KeyPath;
  v47[1] = v43;
  sub_243A56808((uint64_t)v22, &qword_268E19720);
  sub_243A56740((uint64_t)v27, v125, &qword_268E19728);
  uint64_t v48 = (uint64_t *)(v40 + *(int *)(v120 + 28));
  uint64_t v49 = v48[1];
  uint64_t v126 = *v48;
  uint64_t v127 = v49;
  swift_bridgeObjectRetain();
  uint64_t v50 = sub_243DFDAA0();
  uint64_t v52 = v51;
  LOBYTE(KeyPath) = v53;
  uint64_t v55 = v54;
  *uint64_t v45 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  swift_storeEnumTagMultiPayload();
  uint64_t v56 = (uint64_t)v45;
  uint64_t v57 = v112;
  sub_243DEF680(v56, v112, (uint64_t (*)(void))type metadata accessor for OrderWidgetMerchantTitleModifier);
  sub_243DEF6E8(v57, (uint64_t)&v14[*(int *)(v44 + 36)], (uint64_t (*)(void))type metadata accessor for OrderWidgetMerchantTitleModifier);
  *(void *)uint64_t v14 = v50;
  *((void *)v14 + 1) = v52;
  unsigned char v14[16] = KeyPath & 1;
  *((void *)v14 + 3) = v55;
  sub_243DEFD88(v57, (uint64_t (*)(void))type metadata accessor for OrderWidgetMerchantTitleModifier);
  if (v124) {
    uint64_t v58 = sub_243DFD920();
  }
  else {
    uint64_t v58 = sub_243DFD8F0();
  }
  uint64_t v59 = v58;
  uint64_t v60 = v123;
  uint64_t v62 = v109;
  uint64_t v61 = (uint64_t)v110;
  uint64_t v63 = v108;
  uint64_t v64 = swift_getKeyPath();
  uint64_t v65 = v111;
  sub_243A567A4((uint64_t)v14, v111, &qword_268E19710);
  uint64_t v66 = (uint64_t *)(v65 + *(int *)(v113 + 36));
  *uint64_t v66 = v64;
  v66[1] = v59;
  sub_243A56808((uint64_t)v14, &qword_268E19710);
  sub_243A56740(v65, v60, &qword_268E19718);
  uint64_t v67 = v115;
  sub_243AFB7C0(v115);
  uint64_t v69 = v116;
  uint64_t v68 = v117;
  (*(void (**)(char *, void, uint64_t))(v117 + 104))(v116, *MEMORY[0x263F18D60], v63);
  sub_243DD1AF0((unint64_t *)&qword_268E196F8, MEMORY[0x263F18D80]);
  LOBYTE(v59) = sub_243DFE860();
  uint64_t v70 = *(void (**)(char *, uint64_t))(v68 + 8);
  v70(v69, v63);
  v70((char *)v67, v63);
  sub_243DEF6E8(v62, v61, (uint64_t (*)(void))_s6MediumVMa);
  BOOL v71 = (v59 & 1) == 0
     || *(void *)(v61 + *(int *)(type metadata accessor for OrderWidgetTimelineEntry(0) + 24)) > 2;
  sub_243DEFD88(v61, (uint64_t (*)(void))_s6MediumVMa);
  uint64_t v72 = (uint64_t *)(v40 + *(int *)(v120 + 40));
  uint64_t v73 = v72[1];
  if (v73 && !v71)
  {
    uint64_t v126 = *v72;
    uint64_t v127 = v73;
    swift_bridgeObjectRetain();
    uint64_t v80 = sub_243DFDAA0();
    uint64_t v74 = v81;
    uint64_t v83 = v82;
    uint64_t v85 = v84 & 1;
    uint64_t v86 = swift_getKeyPath();
    uint64_t v87 = swift_getKeyPath();
    uint64_t v88 = sub_243DFD3E0();
    if (v124) {
      uint64_t v89 = sub_243DFD920();
    }
    else {
      uint64_t v89 = sub_243DFD8F0();
    }
    unint64_t v119 = v89;
    uint64_t v120 = swift_getKeyPath();
    uint64_t v90 = v88 << 32;
    uint64_t v77 = 1;
    uint64_t v117 = v80;
    uint64_t v75 = v83;
    uint64_t v124 = v85;
    uint64_t v76 = v86;
    uint64_t v79 = v90;
    uint64_t v78 = v87;
  }
  else
  {
    uint64_t v117 = 0;
    uint64_t v74 = 0;
    uint64_t v124 = 0;
    uint64_t v75 = 0;
    uint64_t v76 = 0;
    uint64_t v77 = 0;
    uint64_t v78 = 0;
    uint64_t v79 = 0;
    unint64_t v119 = 0;
    uint64_t v120 = 0;
  }
  uint64_t v91 = v121;
  sub_243A567A4(v125, v121, &qword_268E19728);
  uint64_t v92 = v122;
  sub_243A567A4(v123, v122, &qword_268E19718);
  uint64_t v93 = v91;
  uint64_t v94 = v118;
  sub_243A567A4(v93, v118, &qword_268E19728);
  uint64_t v95 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268E22BC8);
  sub_243A567A4(v92, v94 + v95[12], &qword_268E19718);
  uint64_t v96 = (uint64_t *)(v94 + v95[16]);
  uint64_t v97 = v117;
  *uint64_t v96 = v117;
  v96[1] = v74;
  uint64_t v98 = v124;
  v96[2] = v124;
  v96[3] = v75;
  v96[4] = v76;
  v96[5] = v77;
  v96[6] = v78;
  unsigned char v96[7] = v77;
  uint64_t v124 = v98;
  uint64_t v99 = v75;
  uint64_t v100 = v97;
  unint64_t v101 = v119;
  uint64_t v102 = v120;
  v96[8] = v79;
  v96[9] = v102;
  v96[10] = v101;
  uint64_t v103 = v94 + v95[20];
  *(void *)uint64_t v103 = 0;
  *(unsigned char *)(v103 + 8) = 0;
  uint64_t v104 = v99;
  sub_243DD1B38(v97, v74, v98, v99);
  sub_243A56808(v123, &qword_268E19718);
  sub_243A56808(v125, &qword_268E19728);
  sub_243DD1BB8(v100, v74, v124, v104);
  sub_243A56808(v122, &qword_268E19718);
  return sub_243A56808(v121, &qword_268E19728);
}

uint64_t sub_243DEF268@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A708);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243DEB9AC(*(void *)(*(void *)v1 + 16) == 1, v1, (uint64_t)v5);
  uint64_t v6 = sub_243DFE4F0();
  sub_243AD1D00(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, a1, 0.0, 1, INFINITY, 0, v6, v7);
  return sub_243A56808((uint64_t)v5, &qword_268E1A708);
}

uint64_t sub_243DEF35C()
{
  uint64_t v1 = (int *)_s6MediumVMa();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v6 = type metadata accessor for OrderWidgetTimelineEntry(0);
  uint64_t v7 = v0 + v3 + *(int *)(v6 + 20);
  uint64_t v8 = sub_243DFBE80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v0 + v3 + *(int *)(v6 + 28);
  uint64_t v10 = sub_243DFE790();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  uint64_t v12 = v5 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_243DFC8E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  else
  {
    swift_release();
  }
  sub_243A557AC(*(void *)(v5 + v1[6]), *(unsigned char *)(v5 + v1[6] + 8));
  uint64_t v14 = v5 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E19690);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_243DFE6C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_243DEF5D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(_s6MediumVMa() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_243DEBF40(a1, v6, a2);
}

uint64_t sub_243DEF680(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_243DEF6E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_243DEF760()
{
  uint64_t v1 = (int *)_s6MediumVMa();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 48) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_unknownObjectRelease();
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v6 = type metadata accessor for OrderWidgetTimelineEntry(0);
  uint64_t v7 = v0 + v3 + *(int *)(v6 + 20);
  uint64_t v8 = sub_243DFBE80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v0 + v3 + *(int *)(v6 + 28);
  uint64_t v10 = sub_243DFE790();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  uint64_t v12 = v5 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_243DFC8E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  else
  {
    swift_release();
  }
  sub_243A557AC(*(void *)(v5 + v1[6]), *(unsigned char *)(v5 + v1[6] + 8));
  uint64_t v14 = v5 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E19690);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_243DFE6C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_243DEF9DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(_s6MediumVMa() - 8);
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  unint64_t v8 = v2[5];
  uint64_t v9 = (uint64_t)v2 + ((*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_243DED27C(a1, v6, v7, v8, v9, a2);
}

uint64_t sub_243DEFA64()
{
  uint64_t v1 = (int *)_s6MediumVMa();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  swift_bridgeObjectRelease();
  uint64_t v6 = type metadata accessor for OrderWidgetTimelineEntry(0);
  uint64_t v7 = v0 + v3 + *(int *)(v6 + 20);
  uint64_t v8 = sub_243DFBE80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v0 + v3 + *(int *)(v6 + 28);
  uint64_t v10 = sub_243DFE790();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  uint64_t v12 = v5 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E18608);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_243DFC8E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  else
  {
    swift_release();
  }
  sub_243A557AC(*(void *)(v5 + v1[6]), *(unsigned char *)(v5 + v1[6] + 8));
  uint64_t v14 = v5 + v1[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E19690);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_243DFE6C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v4 + v3 + 2, v2 | 7);
}

uint64_t sub_243DEFCDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(_s6MediumVMa() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = v2 + v6;
  uint64_t v8 = (unsigned __int8 *)(v2 + *(void *)(v5 + 64) + v6);
  int v9 = *v8;
  int v10 = v8[1];

  return sub_243DEDEBC(a1, v7, v9, v10, a2);
}

uint64_t sub_243DEFD88(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_243DEFDEC()
{
  unint64_t result = qword_268E23130;
  if (!qword_268E23130)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E1A710);
    sub_243DEFE68();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E23130);
  }
  return result;
}

unint64_t sub_243DEFE68()
{
  unint64_t result = qword_268E23138;
  if (!qword_268E23138)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E1A708);
    sub_243DEFEDC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E23138);
  }
  return result;
}

unint64_t sub_243DEFEDC()
{
  unint64_t result = qword_268E23140;
  if (!qword_268E23140)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E23148);
    sub_243A569B0(&qword_268E23080, &qword_268E23070);
    sub_243A569B0(&qword_268E23088, &qword_268E23060);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E23140);
  }
  return result;
}

uint64_t sub_243DEFFA0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v71 = a3;
  uint64_t v72 = a4;
  unint64_t v63 = a2;
  uint64_t v73 = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19830);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v68 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  int v10 = (char *)&v60 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E19030);
  uint64_t v64 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v67 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v60 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1CE38);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v70 = (uint64_t)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v69 = (char *)&v60 - v19;
  MEMORY[0x270FA5388](v20);
  uint64_t v66 = (uint64_t)&v60 - v21;
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v60 - v23;
  MEMORY[0x270FA5388](v25);
  uint64_t v65 = (uint64_t)&v60 - v26;
  if (qword_26B0CDA78 != -1) {
    swift_once();
  }
  uint64_t v27 = (void *)qword_26B0CDAA0;
  uint64_t v28 = (void *)sub_243DFE8E0();
  uint64_t v29 = (void *)sub_243DFE8E0();
  uint64_t v30 = (void *)sub_243DFE8E0();
  id v31 = objc_msgSend(v27, sel_localizedStringForKey_value_table_, v28, v29, v30);

  uint64_t v32 = sub_243DFE910();
  uint64_t v34 = v33;

  uint64_t v74 = v32;
  uint64_t v75 = v34;
  sub_243DFC460();
  uint64_t v35 = sub_243DFC470();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v61 = *(void (**)(char *, void, uint64_t))(v36 + 56);
  uint64_t v62 = v35;
  uint64_t v60 = v36 + 56;
  v61(v10, 0, 1);
  uint64_t v37 = a1;
  if (a1)
  {
    uint64_t v38 = swift_allocObject();
    unint64_t v39 = v63;
    *(void *)(v38 + 16) = v37;
    *(void *)(v38 + 24) = v39;
    uint64_t v40 = sub_243A9E358;
  }
  else
  {
    uint64_t v40 = nullsub_1;
    uint64_t v38 = 0;
  }
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = v40;
  *(void *)(v41 + 24) = v38;
  sub_243A6F570(v37);
  unint64_t v63 = sub_243A56634();
  sub_243DFE230();
  sub_243A569B0((unint64_t *)&qword_268E20B10, &qword_268E19030);
  sub_243DFDDF0();
  uint64_t v42 = *(void (**)(char *, uint64_t))(v64 + 8);
  v42(v15, v11);
  uint64_t v43 = v65;
  sub_243DF07A8((uint64_t)v24, v65);
  uint64_t v44 = (void *)qword_26B0CDAA0;
  uint64_t v45 = (void *)sub_243DFE8E0();
  uint64_t v46 = (void *)sub_243DFE8E0();
  uint64_t v47 = (void *)sub_243DFE8E0();
  id v48 = objc_msgSend(v44, sel_localizedStringForKey_value_table_, v45, v46, v47);

  uint64_t v49 = sub_243DFE910();
  uint64_t v51 = v50;

  uint64_t v74 = v49;
  uint64_t v75 = v51;
  uint64_t v52 = v68;
  sub_243DFC450();
  ((void (*)(char *, void, uint64_t, uint64_t))v61)(v52, 0, 1, v62);
  swift_retain();
  char v53 = v67;
  sub_243DFE230();
  uint64_t v54 = (uint64_t)v69;
  sub_243DFDDF0();
  v42(v53, v11);
  uint64_t v55 = v66;
  sub_243DF07A8(v54, v66);
  sub_243DF0810(v43, v54);
  uint64_t v56 = v70;
  sub_243DF0810(v55, v70);
  uint64_t v57 = v73;
  sub_243DF0810(v54, v73);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23150);
  sub_243DF0810(v56, v57 + *(int *)(v58 + 48));
  sub_243A56808(v55, &qword_268E1CE38);
  sub_243A56808(v43, &qword_268E1CE38);
  sub_243A56808(v56, &qword_268E1CE38);
  return sub_243A56808(v54, &qword_268E1CE38);
}

uint64_t sub_243DF0610@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B0CDA78 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_26B0CDAA0;
  uint64_t v3 = (void *)sub_243DFE8E0();
  uint64_t v4 = (void *)sub_243DFE8E0();
  uint64_t v5 = (void *)sub_243DFE8E0();
  id v6 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, v5);

  sub_243DFE910();
  sub_243A56634();
  uint64_t result = sub_243DFDAA0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v8;
  *(unsigned char *)(a1 + 16) = v9 & 1;
  *(void *)(a1 + 24) = v10;
  return result;
}

uint64_t sub_243DF0748()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_243DF0780()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_243DF07A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1CE38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_243DF0810(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1CE38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *sub_243DF0878(unsigned char *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(unsigned char *)a2;
    uint64_t v7 = (int *)type metadata accessor for OrderActionsMenuContext(0);
    uint64_t v8 = v7[5];
    char v9 = (char *)v4 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_243DFACC0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    *((unsigned char *)v4 + v7[6]) = *((unsigned char *)a2 + v7[6]);
    *((unsigned char *)v4 + v7[7]) = *((unsigned char *)a2 + v7[7]);
    *((unsigned char *)v4 + v7[8]) = *((unsigned char *)a2 + v7[8]);
    *((unsigned char *)v4 + v7[9]) = *((unsigned char *)a2 + v7[9]);
    *((unsigned char *)v4 + v7[10]) = *((unsigned char *)a2 + v7[10]);
    *((unsigned char *)v4 + v7[11]) = *((unsigned char *)a2 + v7[11]);
    uint64_t v12 = *(int *)(a3 + 20);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (char *)v4 + v12;
    uint64_t v15 = (char *)a2 + v12;
    uint64_t v16 = *((void *)v15 + 1);
    *(void *)uint64_t v14 = *(void *)v15;
    *((void *)v14 + 1) = v16;
    unsigned char v14[16] = v15[16];
    uint64_t v17 = (void *)((char *)v4 + v13);
    uint64_t v18 = (void *)((char *)a2 + v13);
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E18B30);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_243DFC2C0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      void *v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t sub_243DF0A64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(type metadata accessor for OrderActionsMenuContext(0) + 20);
  uint64_t v5 = sub_243DFACC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  swift_release();
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E18B30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_243DFC2C0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

unsigned char *sub_243DF0B80(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (int *)type metadata accessor for OrderActionsMenuContext(0);
  uint64_t v7 = v6[5];
  uint64_t v8 = &a1[v7];
  char v9 = &a2[v7];
  uint64_t v10 = sub_243DFACC0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  a1[v6[6]] = a2[v6[6]];
  a1[v6[7]] = a2[v6[7]];
  a1[v6[8]] = a2[v6[8]];
  a1[v6[9]] = a2[v6[9]];
  a1[v6[10]] = a2[v6[10]];
  a1[v6[11]] = a2[v6[11]];
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = &a1[v11];
  uint64_t v14 = &a2[v11];
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = v15;
  v13[16] = v14[16];
  uint64_t v16 = &a1[v12];
  uint64_t v17 = &a2[v12];
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E18B30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_243DFC2C0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  }
  else
  {
    *uint64_t v16 = *v17;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

unsigned char *sub_243DF0D14(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (int *)type metadata accessor for OrderActionsMenuContext(0);
  uint64_t v7 = v6[5];
  uint64_t v8 = &a1[v7];
  char v9 = &a2[v7];
  uint64_t v10 = sub_243DFACC0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  a1[v6[6]] = a2[v6[6]];
  a1[v6[7]] = a2[v6[7]];
  a1[v6[8]] = a2[v6[8]];
  a1[v6[9]] = a2[v6[9]];
  a1[v6[10]] = a2[v6[10]];
  a1[v6[11]] = a2[v6[11]];
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *(void *)&a1[v11] = *(void *)&a2[v11];
  swift_retain();
  swift_release();
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_retain();
  swift_release();
  v12[16] = v13[16];
  if (a1 != a2)
  {
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = &a1[v14];
    uint64_t v16 = &a2[v14];
    sub_243A56808((uint64_t)&a1[v14], (uint64_t *)&unk_268E18B30);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E18B30);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_243DFC2C0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *uint64_t v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

unsigned char *sub_243DF0EE0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (int *)type metadata accessor for OrderActionsMenuContext(0);
  uint64_t v7 = v6[5];
  uint64_t v8 = &a1[v7];
  char v9 = &a2[v7];
  uint64_t v10 = sub_243DFACC0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  a1[v6[6]] = a2[v6[6]];
  a1[v6[7]] = a2[v6[7]];
  a1[v6[8]] = a2[v6[8]];
  a1[v6[9]] = a2[v6[9]];
  a1[v6[10]] = a2[v6[10]];
  a1[v6[11]] = a2[v6[11]];
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = &a1[v11];
  uint64_t v14 = &a2[v11];
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  v13[16] = v14[16];
  uint64_t v15 = &a1[v12];
  uint64_t v16 = &a2[v12];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E18B30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_243DFC2C0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  return a1;
}

unsigned char *sub_243DF1078(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (int *)type metadata accessor for OrderActionsMenuContext(0);
  uint64_t v7 = v6[5];
  uint64_t v8 = &a1[v7];
  char v9 = &a2[v7];
  uint64_t v10 = sub_243DFACC0();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  a1[v6[6]] = a2[v6[6]];
  a1[v6[7]] = a2[v6[7]];
  a1[v6[8]] = a2[v6[8]];
  a1[v6[9]] = a2[v6[9]];
  a1[v6[10]] = a2[v6[10]];
  a1[v6[11]] = a2[v6[11]];
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *(void *)&a1[v11] = *(void *)&a2[v11];
  swift_release();
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_release();
  v12[16] = v13[16];
  if (a1 != a2)
  {
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = &a1[v14];
    uint64_t v16 = &a2[v14];
    sub_243A56808((uint64_t)&a1[v14], (uint64_t *)&unk_268E18B30);
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E18B30);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_243DFC2C0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_243DF1244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243DF1258);
}

uint64_t sub_243DF1258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for OrderActionsMenuContext(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E18B48);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_243DF138C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243DF13A0);
}

uint64_t sub_243DF13A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for OrderActionsMenuContext(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E18B48);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for ActionsContextMenu()
{
  uint64_t result = qword_268E23158;
  if (!qword_268E23158) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_243DF1520()
{
  type metadata accessor for OrderActionsMenuContext(319);
  if (v0 <= 0x3F)
  {
    sub_243B13F94();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_243DF15F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_243DF160C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v22 = a1;
  uint64_t v25 = a2;
  uint64_t v4 = type metadata accessor for ActionsContextMenu();
  uint64_t v5 = v4 - 8;
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v21 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1B550);
  uint64_t v23 = *(void *)(v12 - 8);
  uint64_t v24 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1B558);
  type metadata accessor for OrderActionsItems(0);
  sub_243A569B0(&qword_268E1B560, &qword_268E1B558);
  sub_243DF1C58();
  sub_243DFDB50();
  uint64_t v15 = v2 + *(int *)(v5 + 28);
  uint64_t v16 = *(void *)(v15 + 8);
  uint64_t v22 = *(void *)v15;
  v21[3] = *(unsigned __int8 *)(v15 + 16);
  sub_243DF1CE8(v2, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for ActionsContextMenu);
  unint64_t v17 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v18 = swift_allocObject();
  sub_243DF1F58((uint64_t)v11, v18 + v17, (uint64_t (*)(void))type metadata accessor for ActionsContextMenu);
  sub_243DF1CE8(v3, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ActionsContextMenu);
  uint64_t v19 = swift_allocObject();
  sub_243DF1F58((uint64_t)v8, v19 + v17, (uint64_t (*)(void))type metadata accessor for ActionsContextMenu);
  sub_243B15C80(v22, v16, v25);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v14, v24);
}

uint64_t sub_243DF190C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ActionsContextMenu();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = type metadata accessor for OrderActionsMenuContext(0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243DF1CE8(a1, (uint64_t)v9, type metadata accessor for OrderActionsMenuContext);
  sub_243DF1CE8(a1, (uint64_t)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ActionsContextMenu);
  unint64_t v10 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v11 = swift_allocObject();
  sub_243DF1F58((uint64_t)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10, (uint64_t (*)(void))type metadata accessor for ActionsContextMenu);
  sub_243DFE910();
  sub_243AB4B30();
  sub_243DFEDE0();
  *a2 = sub_243DFC430();
  uint64_t v12 = type metadata accessor for OrderActionsItems(0);
  uint64_t result = sub_243DF1F58((uint64_t)v9, (uint64_t)a2 + *(int *)(v12 + 20), type metadata accessor for OrderActionsMenuContext);
  uint64_t v14 = (uint64_t (**)())((char *)a2 + *(int *)(v12 + 24));
  *uint64_t v14 = sub_243DF1ECC;
  v14[1] = (uint64_t (*)())v11;
  return result;
}

uint64_t sub_243DF1AF8()
{
  return sub_243DFE310();
}

uint64_t sub_243DF1B64()
{
  uint64_t v0 = sub_243DFC2C0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ActionsContextMenu();
  sub_243AFBAB8((uint64_t)v3);
  sub_243B15390((uint64_t)v3);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_243DF1C50@<X0>(uint64_t *a1@<X8>)
{
  return sub_243DF190C(*(void *)(v1 + 16), a1);
}

unint64_t sub_243DF1C58()
{
  unint64_t result = qword_268E1B460;
  if (!qword_268E1B460)
  {
    type metadata accessor for OrderActionsItems(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E1B460);
  }
  return result;
}

uint64_t sub_243DF1CB4()
{
  return sub_243DF1EE4((uint64_t (*)(uint64_t))sub_243DF1B64);
}

uint64_t sub_243DF1CD0()
{
  return sub_243DF1EE4((uint64_t (*)(uint64_t))sub_243B156E8);
}

uint64_t sub_243DF1CE8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t objectdestroy_6Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for ActionsContextMenu() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v0 + v3 + *(int *)(type metadata accessor for OrderActionsMenuContext(0) + 20);
  uint64_t v6 = sub_243DFACC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_release();
  uint64_t v7 = v0 + v3 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E18B30);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_243DFC2C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_243DF1ECC()
{
  return sub_243DF1EE4((uint64_t (*)(uint64_t))sub_243DF1AF8);
}

uint64_t sub_243DF1EE4(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for ActionsContextMenu() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_243DF1F58(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_243DF1FC0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t TransactionSearchTokenModel.id.getter()
{
  uint64_t v2 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  sub_243DFE9E0();
  swift_bridgeObjectRetain();
  sub_243DFE9E0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_243DF2184(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return MEMORY[0x270FA2498](sub_243DF21A4, 0, 0);
}

uint64_t sub_243DF21A4()
{
  uint64_t v1 = *(void **)(v0 + 24);
  **(void **)(v0 + 16) = v1;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  id v2 = v1;
  return v4();
}

uint64_t sub_243DF2210@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  swift_bridgeObjectRetain();
  sub_243DFE9E0();
  swift_bridgeObjectRetain();
  sub_243DFE9E0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v5;
  return result;
}

uint64_t _s12FinanceKitUI27TransactionSearchTokenModelV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v16 = a1[8];
  uint64_t v17 = a1[7];
  uint64_t v7 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v14 = a2[8];
  uint64_t v15 = a2[7];
  if (*a1 == *a2 && a1[1] == a2[1] || (v10 = sub_243DFF3A0(), uint64_t result = 0, (v10 & 1) != 0))
  {
    if (v2 == v7 && v3 == v6 || (v12 = sub_243DFF3A0(), uint64_t result = 0, (v12 & 1) != 0))
    {
      if (sub_243DFE000())
      {
        if (v4 == v8 && v5 == v9 || (v13 = sub_243DFF3A0(), uint64_t result = 0, (v13 & 1) != 0))
        {
          if (v17 == v15 && v16 == v14)
          {
            return 1;
          }
          else
          {
            return sub_243DFF3A0();
          }
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t destroy for TransactionSearchTokenModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for TransactionSearchTokenModel(uint64_t a1, uint64_t a2)
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
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for TransactionSearchTokenModel(void *a1, void *a2)
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
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[10];
  a1[9] = a2[9];
  a1[10] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for TransactionSearchTokenModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = v6;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for TransactionSearchTokenModel()
{
  return &type metadata for TransactionSearchTokenModel;
}

ValueMetadata *type metadata accessor for SendableNSPredicate()
{
  return &type metadata for SendableNSPredicate;
}

uint64_t destroy for WalletIconHeaderView(id *a1)
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WalletIconHeaderView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  id v7 = v3;
  id v8 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WalletIconHeaderView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  id v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

uint64_t assignWithTake for WalletIconHeaderView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for WalletIconHeaderView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WalletIconHeaderView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for WalletIconHeaderView()
{
  return &type metadata for WalletIconHeaderView;
}

uint64_t sub_243DF2900()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_243DF291C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v77 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23188);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&KeyPath - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23190);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&KeyPath - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  char v12 = (char *)&KeyPath - v11;
  uint64_t v76 = (uint64_t)&KeyPath - v11;
  sub_243DF2D80((uint64_t)v5);
  char v13 = sub_243DFD750();
  sub_243DFC480();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  sub_243A567A4((uint64_t)v5, (uint64_t)v9, &qword_268E23188);
  uint64_t v22 = &v9[*(int *)(v7 + 44)];
  uint64_t v78 = v9;
  *uint64_t v22 = v13;
  *((void *)v22 + 1) = v15;
  *((void *)v22 + 2) = v17;
  *((void *)v22 + 3) = v19;
  *((void *)v22 + 4) = v21;
  v22[40] = 0;
  sub_243A56808((uint64_t)v5, &qword_268E23188);
  sub_243DF398C((uint64_t)v9, (uint64_t)v12);
  uint64_t v23 = a1[3];
  uint64_t v79 = a1[2];
  uint64_t v80 = v23;
  unint64_t v72 = sub_243A56634();
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_243DFDAA0();
  uint64_t v26 = v25;
  LOBYTE(v9) = v27 & 1;
  sub_243DFD7A0();
  uint64_t v28 = sub_243DFDA10();
  uint64_t v30 = v29;
  char v32 = v31;
  swift_release();
  char v33 = v32 & 1;
  sub_243A56688(v24, v26, (char)v9);
  swift_bridgeObjectRelease();
  sub_243DFD810();
  uint64_t v34 = sub_243DFD9A0();
  uint64_t v74 = v35;
  uint64_t v75 = v34;
  uint64_t v73 = v36;
  char v38 = v37 & 1;
  sub_243A56688(v28, v30, v33);
  swift_bridgeObjectRelease();
  int v71 = sub_243DFD750();
  sub_243DFC480();
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v47 = a1[5];
  uint64_t v79 = a1[4];
  uint64_t v80 = v47;
  swift_bridgeObjectRetain();
  uint64_t v48 = sub_243DFDAA0();
  uint64_t v50 = v49;
  LOBYTE(v9) = v51 & 1;
  sub_243DFD7E0();
  uint64_t v52 = sub_243DFDA10();
  uint64_t v54 = v53;
  LOBYTE(v28) = v55;
  uint64_t v57 = v56;
  swift_release();
  LOBYTE(v26) = v28 & 1;
  sub_243A56688(v48, v50, (char)v9);
  swift_bridgeObjectRelease();
  uint64_t v58 = swift_getKeyPath();
  uint64_t v59 = v76;
  uint64_t v60 = (uint64_t)v78;
  sub_243A567A4(v76, (uint64_t)v78, &qword_268E23190);
  LOBYTE(v79) = v38;
  uint64_t v61 = v77;
  sub_243A567A4(v60, v77, &qword_268E23190);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23198);
  uint64_t v63 = v61 + *(int *)(v62 + 48);
  uint64_t v65 = v74;
  uint64_t v64 = v75;
  uint64_t v66 = v73;
  *(void *)uint64_t v63 = v75;
  *(void *)(v63 + 8) = v66;
  *(unsigned char *)(v63 + 16) = v38;
  *(void *)(v63 + 24) = v65;
  *(unsigned char *)(v63 + 32) = v71;
  *(void *)(v63 + 40) = v40;
  *(void *)(v63 + 48) = v42;
  *(void *)(v63 + 56) = v44;
  *(void *)(v63 + 64) = v46;
  *(unsigned char *)(v63 + 72) = 0;
  *(void *)(v63 + 80) = KeyPath;
  *(_WORD *)(v63 + 88) = 1;
  *(unsigned char *)(v63 + 90) = 1;
  uint64_t v67 = v61 + *(int *)(v62 + 64);
  *(void *)uint64_t v67 = v52;
  *(void *)(v67 + 8) = v54;
  *(unsigned char *)(v67 + 16) = v26;
  *(void *)(v67 + 24) = v57;
  *(void *)(v67 + 32) = v58;
  *(_WORD *)(v67 + 40) = 1;
  *(unsigned char *)(v67 + 42) = 1;
  uint64_t v68 = v64;
  sub_243A63AD4(v64, v66, v38);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_243A63AD4(v52, v54, v26);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_243A56808(v59, &qword_268E23190);
  sub_243A56688(v52, v54, v26);
  swift_release();
  swift_bridgeObjectRelease();
  sub_243A56688(v68, v66, v79);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_243A56808((uint64_t)v78, &qword_268E23190);
}

uint64_t sub_243DF2D80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E231A0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E231A8);
  MEMORY[0x270FA5388](v7);
  id v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1AA10);
  MEMORY[0x270FA5388](v10 - 8);
  char v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E231B0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v51 = (uint64_t)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v44 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E231B8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)v2)
  {
    id v21 = *(id *)v2;
    sub_243DF3310(v21, (uint64_t)v6);
    sub_243A567A4((uint64_t)v6, (uint64_t)v9, &qword_268E231A0);
    swift_storeEnumTagMultiPayload();
    sub_243A569B0(&qword_268E231C0, &qword_268E231B8);
    sub_243A569B0(&qword_268E231C8, &qword_268E231A0);
    sub_243DFD170();

    uint64_t v22 = (uint64_t)v6;
    uint64_t v23 = &qword_268E231A0;
  }
  else
  {
    sub_243ADAA50(v2);
    *(void *)uint64_t v20 = sub_243DFCE70();
    *((void *)v20 + 1) = 0x4024000000000000;
    v20[16] = 0;
    uint64_t v45 = &v20[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E231D0) + 44)];
    uint64_t v24 = sub_243DFE0F0();
    uint64_t v50 = v17;
    uint64_t v25 = v24;
    sub_243DFD840();
    uint64_t v49 = v4;
    uint64_t v26 = sub_243DFD800();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v12, 1, 1, v26);
    uint64_t v27 = sub_243DFD880();
    sub_243A56808((uint64_t)v12, &qword_268E1AA10);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v46 = v7;
    uint64_t v29 = KeyPath;
    uint64_t v30 = sub_243DFE090();
    uint64_t v48 = a1;
    uint64_t v31 = v30;
    uint64_t v32 = swift_getKeyPath();
    uint64_t v52 = v25;
    uint64_t v53 = v29;
    uint64_t v54 = v27;
    uint64_t v55 = v32;
    uint64_t v56 = v31;
    __int16 v57 = 257;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E231D8);
    uint64_t v47 = v18;
    sub_243DF3A0C();
    sub_243DFDC00();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v33 = *(void *)(v2 + 48);
    uint64_t v34 = *(void *)(v2 + 56);
    id v35 = *(id *)(v2 + 8);
    double v36 = (double)sub_243DF9480();
    type metadata accessor for AppIconImage.Loader();
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 16) = 0;
    sub_243DFC0F0();
    *(void *)(v37 + 24) = v33;
    *(void *)(v37 + 32) = v34;
    *(void *)(v37 + 40) = v35;
    *(double *)(v37 + 48) = v36;
    uint64_t v39 = (uint64_t)v50;
    uint64_t v38 = v51;
    sub_243A567A4((uint64_t)v50, v51, &qword_268E231B0);
    uint64_t v40 = v45;
    *uint64_t v45 = 2;
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E231F8);
    sub_243A567A4(v38, (uint64_t)&v40[*(int *)(v41 + 48)], &qword_268E231B0);
    uint64_t v42 = &v40[*(int *)(v41 + 64)];
    *(void *)uint64_t v42 = v37;
    *((void *)v42 + 1) = 0;
    *((void *)v42 + 2) = v33;
    *((void *)v42 + 3) = v34;
    *((double *)v42 + 4) = v36;
    swift_retain();
    sub_243A56808(v39, &qword_268E231B0);
    swift_release();
    sub_243A56808(v38, &qword_268E231B0);
    sub_243ADA800(v2);
    sub_243A567A4((uint64_t)v20, (uint64_t)v9, &qword_268E231B8);
    swift_storeEnumTagMultiPayload();
    sub_243A569B0(&qword_268E231C0, &qword_268E231B8);
    sub_243A569B0(&qword_268E231C8, &qword_268E231A0);
    sub_243DFD170();
    uint64_t v22 = (uint64_t)v20;
    uint64_t v23 = &qword_268E231B8;
  }
  return sub_243A56808(v22, v23);
}

uint64_t sub_243DF3310@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1AA10);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E231B0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v55 = (uint64_t)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v49 = (char *)&v47 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23200);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v53 = (uint64_t)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v52 = (uint64_t)&v47 - v16;
  MEMORY[0x270FA5388](v17);
  uint64_t v51 = (char *)&v47 - v18;
  MEMORY[0x270FA5388](v19);
  uint64_t v47 = (uint64_t)&v47 - v20;
  sub_243ADAA50(v3);
  sub_243ADAA50(v3);
  id v48 = a1;
  *(void *)a2 = sub_243DFCE70();
  *(void *)(a2 + 8) = 0x4024000000000000;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v50 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E23208) + 44);
  uint64_t v54 = v3;
  uint64_t v21 = *(void *)(v3 + 48);
  uint64_t v22 = *(void *)(v3 + 56);
  id v23 = *(id *)(v3 + 8);
  double v24 = (double)sub_243DF9480();
  type metadata accessor for AppIconImage.Loader();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = 0;
  sub_243DFC0F0();
  *(void *)(v25 + 24) = v21;
  *(void *)(v25 + 32) = v22;
  *(void *)(v25 + 40) = v23;
  *(double *)(v25 + 48) = v24;
  uint64_t v56 = v25;
  uint64_t v57 = 0;
  uint64_t v58 = v21;
  uint64_t v59 = v22;
  double v60 = v24;
  sub_243DF3B28();
  sub_243DFDC00();
  swift_release();
  uint64_t v26 = sub_243DFE0F0();
  sub_243DFD840();
  uint64_t v27 = sub_243DFD800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v8, 1, 1, v27);
  uint64_t v28 = sub_243DFD880();
  sub_243A56808((uint64_t)v8, &qword_268E1AA10);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v30 = sub_243DFE090();
  uint64_t v31 = swift_getKeyPath();
  uint64_t v56 = v26;
  uint64_t v57 = KeyPath;
  uint64_t v58 = v28;
  uint64_t v59 = v31;
  double v60 = *(double *)&v30;
  __int16 v61 = 257;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E231D8);
  sub_243DF3A0C();
  uint64_t v32 = (uint64_t)v49;
  sub_243DFDC00();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  id v33 = v48;
  id v48 = v33;
  double v34 = (double)sub_243DF9480();
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = 0;
  sub_243DFC0F0();
  *(void *)(v35 + 24) = v21;
  *(void *)(v35 + 32) = v22;
  *(void *)(v35 + 40) = v33;
  *(double *)(v35 + 48) = v34;
  uint64_t v56 = v35;
  uint64_t v57 = 0;
  uint64_t v58 = v21;
  uint64_t v59 = v22;
  double v60 = v34;
  uint64_t v36 = (uint64_t)v51;
  sub_243DFDC00();
  swift_release();
  uint64_t v37 = v47;
  uint64_t v38 = v52;
  sub_243A567A4(v47, v52, &qword_268E23200);
  uint64_t v39 = v32;
  uint64_t v40 = v55;
  sub_243A567A4(v32, v55, &qword_268E231B0);
  uint64_t v41 = v53;
  sub_243A567A4(v36, v53, &qword_268E23200);
  uint64_t v42 = v38;
  uint64_t v43 = v50;
  sub_243A567A4(v38, v50, &qword_268E23200);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23218);
  sub_243A567A4(v40, v43 + *(int *)(v44 + 48), &qword_268E231B0);
  sub_243A567A4(v41, v43 + *(int *)(v44 + 64), &qword_268E23200);
  sub_243A56808(v36, &qword_268E23200);
  sub_243A56808(v39, &qword_268E231B0);
  sub_243A56808(v37, &qword_268E23200);
  sub_243A56808(v41, &qword_268E23200);
  sub_243A56808(v40, &qword_268E231B0);
  sub_243A56808(v42, &qword_268E23200);

  uint64_t v45 = v54;
  sub_243ADA800(v54);
  return sub_243ADA800(v45);
}

uint64_t sub_243DF3864@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23170);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = v1[1];
  v20[0] = *v1;
  v20[1] = v6;
  long long v7 = v1[3];
  v20[2] = v1[2];
  v20[3] = v7;
  *(void *)uint64_t v5 = sub_243DFCFF0();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23178);
  sub_243DF291C(v20, (uint64_t)&v5[*(int *)(v8 + 44)]);
  char v9 = sub_243DFD720();
  sub_243DFC480();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  sub_243A567A4((uint64_t)v5, a1, &qword_268E23170);
  uint64_t v18 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E23180) + 36);
  *(unsigned char *)uint64_t v18 = v9;
  *(void *)(v18 + 8) = v11;
  *(void *)(v18 + 16) = v13;
  *(void *)(v18 + 24) = v15;
  *(void *)(v18 + 32) = v17;
  *(unsigned char *)(v18 + 40) = 0;
  return sub_243A56808((uint64_t)v5, &qword_268E23170);
}

uint64_t sub_243DF398C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23190);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_243DF3A0C()
{
  unint64_t result = qword_268E231E0;
  if (!qword_268E231E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E231D8);
    sub_243DF3A88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E231E0);
  }
  return result;
}

unint64_t sub_243DF3A88()
{
  unint64_t result = qword_268E231E8;
  if (!qword_268E231E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E231F0);
    sub_243AEFA98();
    sub_243A569B0(&qword_268E18660, &qword_268E18668);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E231E8);
  }
  return result;
}

unint64_t sub_243DF3B28()
{
  unint64_t result = qword_268E23210;
  if (!qword_268E23210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E23210);
  }
  return result;
}

void **initializeBufferWithCopyOfBuffer for WalletIconHeaderView.Layout(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void **assignWithCopy for WalletIconHeaderView.Layout(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  id v4 = *a1;
  *a1 = *a2;
  id v5 = v3;

  return a1;
}

void **assignWithTake for WalletIconHeaderView.Layout(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for WalletIconHeaderView.Layout(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for WalletIconHeaderView.Layout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WalletIconHeaderView.Layout()
{
  return &type metadata for WalletIconHeaderView.Layout;
}

unint64_t sub_243DF3CD0()
{
  unint64_t result = qword_268E23220;
  if (!qword_268E23220)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E23180);
    sub_243A569B0(&qword_268E23228, &qword_268E23170);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E23220);
  }
  return result;
}

uint64_t sub_243DF3D74()
{
  return sub_243DFCCB0();
}

uint64_t sub_243DF3D98(uint64_t a1)
{
  uint64_t v2 = sub_243DFC760();
  double v3 = MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, double))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return sub_243DFCCC0();
}

char *static OrderImportControllerProvider.makeViewController(with:completion:)(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6 = sub_243DFBC10();
  if (!v3)
  {
    uint64_t v8 = v6;
    unint64_t v9 = v7;
    a3 = sub_243DF6148(v6, v7, a2, (uint64_t)a3);
    sub_243A6BE54(v8, v9);
  }
  return a3;
}

char *static OrderImportControllerProvider.makeViewController(with:completion:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_243DF6148(a1, a2, a3, a4);
}

void sub_243DF40D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_243DFB9F0();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

void sub_243DF4140(void **a1, void (*a2)(uint64_t, void *))
{
  uint64_t v3 = *a1;
  if (!*a1)
  {
    uint64_t v4 = 0;
    goto LABEL_5;
  }
  if (v3 == (void *)1)
  {
    uint64_t v4 = 2;
LABEL_5:
    a2(v4, 0);
    return;
  }
  id v5 = v3;
  a2(1, v3);

  sub_243DF86E4(v3);
}

void *OrderImportPreview.init(orderData:deviceInfo:sourceApplication:completion:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  *(void *)(a9 + 24) = 0;
  *(void *)(a9 + 32) = 0;
  sub_243DFE1C0();
  *(unsigned char *)(a9 + 56) = v25;
  *(void *)(a9 + 64) = v26;
  uint64_t v16 = type metadata accessor for OrderImportPreview();
  uint64_t v17 = (uint64_t *)(a9 + *(int *)(v16 + 36));
  uint64_t *v17 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A860);
  swift_storeEnumTagMultiPayload();
  uint64_t v18 = (uint64_t *)(a9 + *(int *)(v16 + 40));
  *uint64_t v18 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1AF98);
  swift_storeEnumTagMultiPayload();
  if (sub_243DF99D0())
  {
    uint64_t v19 = sub_243DF8900();
    sub_243DF78E4(&qword_268E23230, MEMORY[0x263F055F0]);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v19 - 8) + 104))(v20, *MEMORY[0x263F055E8], v19);
    swift_willThrow();
    swift_release();
    sub_243A6BE54(a1, a2);
    swift_bridgeObjectRelease();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_release();
    sub_243A56808((uint64_t)v17, (uint64_t *)&unk_268E209E0);
    return (void *)sub_243A56808((uint64_t)v18, &qword_268E1C760);
  }
  *(void *)(a9 + 8) = a3;
  *(void *)(a9 + 16) = a4;
  swift_bridgeObjectRelease();
  *(void *)(a9 + 24) = a5;
  *(void *)(a9 + 32) = a6;
  type metadata accessor for OrderManagementModel.ConfirmationData(0);
  swift_allocObject();
  unint64_t result = OrderManagementModel.ConfirmationData.init(orderData:)(a1, a2);
  if (v23)
  {
    swift_release();
    goto LABEL_5;
  }
  *(void *)a9 = result;
  *(void *)(a9 + 40) = a7;
  *(void *)(a9 + 48) = a8;
  return result;
}

id OrderImportControllerProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id OrderImportControllerProvider.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id OrderImportControllerProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t OrderImportPreview.init(orderBundleURL:deviceInfo:sourceApplication:completion:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v39 = a7;
  uint64_t v36 = a6;
  uint64_t v37 = a4;
  uint64_t v40 = a5;
  uint64_t v12 = sub_243DFBC00();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(a8 + 24) = 0;
  *(void *)(a8 + 32) = 0;
  char v43 = 0;
  sub_243DFE1C0();
  uint64_t v16 = v42;
  *(unsigned char *)(a8 + 56) = v41;
  *(void *)(a8 + 64) = v16;
  uint64_t v17 = type metadata accessor for OrderImportPreview();
  uint64_t v18 = (uint64_t *)(a8 + *(int *)(v17 + 36));
  *uint64_t v18 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A860);
  swift_storeEnumTagMultiPayload();
  uint64_t v19 = (uint64_t *)(a8 + *(int *)(v17 + 40));
  *uint64_t v19 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1AF98);
  swift_storeEnumTagMultiPayload();
  if (sub_243DF99D0())
  {
    uint64_t v20 = sub_243DF8900();
    sub_243DF78E4(&qword_268E23230, MEMORY[0x263F055F0]);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v20 - 8) + 104))(v21, *MEMORY[0x263F055E8], v20);
    swift_willThrow();
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v13 + 8))(a1, v12);
LABEL_7:
    swift_bridgeObjectRelease();
    swift_release();
    sub_243A56808((uint64_t)v18, (uint64_t *)&unk_268E209E0);
    return sub_243A56808((uint64_t)v19, &qword_268E1C760);
  }
  *(void *)(a8 + 8) = a2;
  *(void *)(a8 + 16) = a3;
  swift_bridgeObjectRelease();
  uint64_t v22 = v40;
  *(void *)(a8 + 24) = v37;
  *(void *)(a8 + 32) = v22;
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v40 = a1;
  v23(v15, a1, v12);
  int v24 = sub_243DFBB80();
  uint64_t v25 = v38;
  uint64_t v26 = sub_243DFBC10();
  if (v25)
  {
    if (v24) {
      sub_243DFBB60();
    }
    uint64_t v28 = *(void (**)(char *, uint64_t))(v13 + 8);
    v28(v15, v12);
    swift_release();
    v28(v40, v12);
    goto LABEL_7;
  }
  unint64_t v30 = v27;
  LODWORD(v38) = v24;
  uint64_t v31 = v26;
  type metadata accessor for OrderManagementModel.ConfirmationData(0);
  swift_allocObject();
  uint64_t v32 = OrderManagementModel.ConfirmationData.init(orderData:)(v31, v30);
  if (v38) {
    sub_243DFBB60();
  }
  id v33 = *(void (**)(char *, uint64_t))(v13 + 8);
  v33(v15, v12);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v33)(v40, v12);
  *(void *)a8 = v32;
  uint64_t v34 = v39;
  *(void *)(a8 + 40) = v36;
  *(void *)(a8 + 48) = v34;
  return result;
}

uint64_t OrderImportPreview.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v48 = a1;
  uint64_t v47 = sub_243DFC770() - 8;
  MEMORY[0x270FA5388](v47);
  uint64_t v45 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_243DFEBB0();
  uint64_t v44 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v49 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OrderImportPreview();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23238) - 8;
  MEMORY[0x270FA5388](v43);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = *(void *)v1;
  uint64_t v13 = *(void *)(v1 + 64);
  char v50 = *(unsigned char *)(v1 + 56);
  uint64_t v51 = v13;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E227D0);
  sub_243DFE1F0();
  uint64_t v34 = v53;
  uint64_t v35 = v52;
  int v36 = v54;
  sub_243DF6590(v1, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for OrderImportPreview);
  uint64_t v14 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = (v14 + 16) & ~v14;
  uint64_t v16 = v14 | 7;
  uint64_t v33 = swift_allocObject();
  sub_243DF63D0((uint64_t)v10, v33 + v15);
  uint64_t v40 = type metadata accessor for OrderImportPreview;
  uint64_t v41 = v1;
  sub_243DF6590(v1, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for OrderImportPreview);
  uint64_t v37 = v15 + v6;
  uint64_t v39 = v16;
  uint64_t v17 = swift_allocObject();
  uint64_t v38 = v15;
  sub_243DF63D0((uint64_t)v7, v17 + v15);
  sub_243DF6590(v1, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for OrderImportPreview);
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = (uint64_t)v10;
  sub_243DF63D0((uint64_t)v10, v18 + v15);
  uint64_t v20 = v49;
  sub_243DFEB90();
  uint64_t v22 = v44;
  uint64_t v21 = v45;
  uint64_t v23 = v20;
  uint64_t v24 = v46;
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(&v45[*(int *)(v47 + 28)], v23, v46);
  void *v21 = &unk_268E23248;
  v21[1] = v18;
  sub_243DF6590((uint64_t)v21, (uint64_t)&v12[*(int *)(v43 + 44)], MEMORY[0x263F189F8]);
  uint64_t v25 = v34;
  uint64_t v26 = v35;
  *(void *)uint64_t v12 = v42;
  *((void *)v12 + 1) = v26;
  *((void *)v12 + 2) = v25;
  v12[24] = v36;
  uint64_t v27 = v33;
  *((void *)v12 + 4) = sub_243DF6434;
  *((void *)v12 + 5) = v27;
  *((void *)v12 + 6) = sub_243DF64A8;
  *((void *)v12 + 7) = v17;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_243DF8684((uint64_t)v21, MEMORY[0x263F189F8]);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v49, v24);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_243DF6590(v41, v19, (uint64_t (*)(void))v40);
  uint64_t v28 = swift_allocObject();
  sub_243DF63D0(v19, v28 + v38);
  uint64_t v29 = v48;
  sub_243DF6830((uint64_t)v12, v48);
  unint64_t v30 = (uint64_t (**)())(v29 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268E23250) + 36));
  *unint64_t v30 = sub_243DF67A4;
  v30[1] = (uint64_t (*)())v28;
  v30[2] = 0;
  v30[3] = 0;
  return sub_243A56808((uint64_t)v12, &qword_268E23238);
}

uint64_t sub_243DF4EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OrderImportPreview();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A950);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *MEMORY[0x263F5C4B8];
  sub_243B8857C(MEMORY[0x263F8EE78]);
  sub_243A6BB90(31, v11, 4);
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_243DFEBB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  sub_243DF6590(a2, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for OrderImportPreview);
  sub_243DFEB80();
  swift_retain();
  uint64_t v13 = sub_243DFEB70();
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = MEMORY[0x263F8F500];
  v15[2] = v13;
  v15[3] = v16;
  v15[4] = a1;
  sub_243DF63D0((uint64_t)v7, (uint64_t)v15 + v14);
  sub_243C26D38((uint64_t)v10, (uint64_t)&unk_268E23288, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_243DF50C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5[2] = a4;
  v5[3] = a5;
  uint64_t v6 = sub_243DFC6A0();
  v5[4] = v6;
  v5[5] = *(void *)(v6 - 8);
  v5[6] = swift_task_alloc();
  uint64_t v7 = sub_243DFA9A0();
  v5[7] = v7;
  v5[8] = *(void *)(v7 - 8);
  v5[9] = swift_task_alloc();
  uint64_t v8 = sub_243DFA540();
  v5[10] = v8;
  v5[11] = *(void *)(v8 - 8);
  v5[12] = swift_task_alloc();
  v5[13] = sub_243DFEB80();
  v5[14] = sub_243DFEB70();
  uint64_t v10 = sub_243DFEB30();
  v5[15] = v10;
  v5[16] = v9;
  return MEMORY[0x270FA2498](sub_243DF5278, v10, v9);
}

uint64_t sub_243DF5278()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[7];
  sub_243DF89F0();
  sub_243DF89C0();
  sub_243DFA990();
  sub_243DF8970();
  v0[17] = 0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_release();
  return MEMORY[0x270FA2498](sub_243DF5380, 0, 0);
}

uint64_t sub_243DF5380()
{
  *(void *)(v0 + 144) = sub_243DFEB70();
  uint64_t v2 = sub_243DFEB30();
  return MEMORY[0x270FA2498](sub_243DF540C, v2, v1);
}

uint64_t sub_243DF540C()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[3];
  swift_release();
  sub_243DF5730(v2, v1);
  uint64_t v3 = v0[15];
  uint64_t v4 = v0[16];
  return MEMORY[0x270FA2498](sub_243DF548C, v3, v4);
}

uint64_t sub_243DF548C()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[10];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_243DF5534()
{
  *(void *)(v0 + 152) = sub_243DFEB70();
  uint64_t v2 = sub_243DFEB30();
  return MEMORY[0x270FA2498](sub_243DF55C0, v2, v1);
}

uint64_t sub_243DF55C0()
{
  uint64_t v12 = v0;
  uint64_t v1 = (void *)v0[17];
  uint64_t v3 = v0[5];
  uint64_t v2 = v0[6];
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  swift_release();
  uint64_t v6 = *(void (**)(void **))(v5 + 40);
  uint64_t v11 = v1;
  id v7 = v1;
  v6(&v11);

  type metadata accessor for OrderImportPreview();
  sub_243AFCF08(v2);
  sub_243DFC690();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v8 = v0[15];
  uint64_t v9 = v0[16];
  return MEMORY[0x270FA2498](sub_243DF56A4, v8, v9);
}

uint64_t sub_243DF56A4()
{
  uint64_t v1 = *(void **)(v0 + 136);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_243DF5730(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = a2;
  uint64_t v3 = sub_243DFC6A0();
  uint64_t v30 = *(void *)(v3 - 8);
  uint64_t v31 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_243DFC760();
  uint64_t v27 = *(void *)(v6 - 8);
  uint64_t v28 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_243DFBC00();
  uint64_t v25 = *(void *)(v9 - 8);
  uint64_t v26 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_243DFACC0();
  uint64_t v23 = *(void *)(v12 - 8);
  uint64_t v24 = v12;
  MEMORY[0x270FA5388](v12);
  unint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_243DFAD80();
  uint64_t v16 = *(void *)(v15 - 8);
  double v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *(void (**)(uint64_t *, double))(a1 + 40);
  uint64_t v32 = 1;
  v20(&v32, v17);
  if (sub_243DF99E0())
  {
    sub_243DFA530();
    int v21 = (*(uint64_t (**)(char *, uint64_t))(v16 + 88))(v19, v15);
    if (v21 == *MEMORY[0x263F05DA8] || v21 == *MEMORY[0x263F05DA0])
    {
      sub_243DFA520();
      sub_243DF8870();
      type metadata accessor for OrderImportPreview();
      sub_243AFCC58((uint64_t)v8);
      sub_243DFC730();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v28);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v26);
      (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v24);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
    }
  }
  type metadata accessor for OrderImportPreview();
  sub_243AFCF08((uint64_t)v5);
  sub_243DFC690();
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v5, v31);
}

uint64_t sub_243DF5B24(uint64_t a1)
{
  uint64_t v2 = sub_243DFC6A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *MEMORY[0x263F5C4B8];
  sub_243B8857C(MEMORY[0x263F8EE78]);
  sub_243A6BB90(28, v6, 4);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void (**)(uint64_t *))(a1 + 40);
  uint64_t v10 = 0;
  v7(&v10);
  type metadata accessor for OrderImportPreview();
  sub_243AFCF08((uint64_t)v5);
  sub_243DFC690();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_243DF5C58(uint64_t a1)
{
  v1[4] = a1;
  sub_243DFEB80();
  v1[5] = sub_243DFEB70();
  uint64_t v3 = sub_243DFEB30();
  v1[6] = v3;
  v1[7] = v2;
  return MEMORY[0x270FA2498](sub_243DF5CF0, v3, v2);
}

uint64_t sub_243DF5CF0()
{
  uint64_t v1 = (uint64_t *)v0[4];
  uint64_t v3 = v1[1];
  uint64_t v2 = v1[2];
  uint64_t v4 = *v1;
  sub_243DF89F0();
  uint64_t v5 = sub_243DF89C0();
  v0[8] = v5;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_268E23278 + dword_268E23278);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[9] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_243DF5DD0;
  return v8(v3, v2, v4, v5);
}

uint64_t sub_243DF5DD0(char a1)
{
  uint64_t v2 = *v1;
  *(unsigned char *)(*v1 + 81) = a1;
  swift_task_dealloc();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 56);
  uint64_t v4 = *(void *)(v2 + 48);
  return MEMORY[0x270FA2498](sub_243DF5F1C, v4, v3);
}

uint64_t sub_243DF5F1C()
{
  char v1 = *(unsigned char *)(v0 + 81);
  uint64_t v2 = *(void *)(v0 + 32);
  swift_release();
  uint64_t v3 = *(void *)(v2 + 64);
  *(unsigned char *)(v0 + 16) = *(unsigned char *)(v2 + 56);
  *(void *)(v0 + 24) = v3;
  *(unsigned char *)(v0 + 80) = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E227D0);
  sub_243DFE1E0();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_243DF5FBC(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(result + 24);
    swift_bridgeObjectRetain();
    LOBYTE(v2) = sub_243A6B914(v2, v1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E18450);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_243E01820;
    *(void *)(inited + 32) = sub_243DFE8E0();
    unint64_t v4 = 0xE600000000000000;
    unint64_t v5 = 0x697261666173;
    switch((char)v2)
    {
      case 1:
        unint64_t v4 = 0x8000000243E17B00;
        unint64_t v5 = 0xD000000000000014;
        break;
      case 2:
        unint64_t v5 = 0x746567646977;
        break;
      case 3:
        unint64_t v4 = 0xE400000000000000;
        unint64_t v5 = 1818845549;
        break;
      case 4:
        unint64_t v4 = 0xE800000000000000;
        unint64_t v5 = 0x6567617373654D69;
        break;
      case 5:
        unint64_t v4 = 0xE400000000000000;
        unint64_t v5 = 1936744813;
        break;
      case 6:
        unint64_t v4 = 0xE500000000000000;
        unint64_t v5 = 0x7070416E69;
        break;
      default:
        break;
    }
    *(void *)(inited + 40) = v5;
    *(void *)(inited + 48) = v4;
    sub_243B8857C(inited);
    sub_243A6B418(*MEMORY[0x263F5C4B8], 4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

char *sub_243DF6148(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for OrderImportPreview();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v24 - v12;
  id v14 = objc_msgSend(self, sel_mainBundle);
  id v15 = objc_msgSend(v14, sel_bundleIdentifier);

  if (v15)
  {
    uint64_t v16 = sub_243DFE910();
    uint64_t v18 = v17;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v18 = 0;
  }
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a3;
  *(void *)(v19 + 24) = a4;
  uint64_t v20 = sub_243DF8A70();
  sub_243A6BDE8(a1, a2);
  swift_retain();
  uint64_t v21 = v24[1];
  OrderImportPreview.init(orderData:deviceInfo:sourceApplication:completion:)(a1, a2, v20, MEMORY[0x263F05688], v16, v18, (uint64_t)sub_243DF867C, v19, (uint64_t)v13);
  if (!v21)
  {
    sub_243DF6590((uint64_t)v13, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for OrderImportPreview);
    id v22 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_268E23290));
    uint64_t v10 = (char *)sub_243DFD060();
    sub_243DF8684((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for OrderImportPreview);
  }
  return v10;
}

uint64_t type metadata accessor for OrderImportPreview()
{
  uint64_t result = qword_268E23258;
  if (!qword_268E23258) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_243DF63A4()
{
  return sub_243DFCCB0();
}

uint64_t sub_243DF63D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OrderImportPreview();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_243DF6434(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for OrderImportPreview() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_243DF4EB8(a1, v4);
}

uint64_t sub_243DF64A8()
{
  return sub_243DF67BC(sub_243DF5B24);
}

uint64_t sub_243DF64C4()
{
  uint64_t v2 = *(void *)(type metadata accessor for OrderImportPreview() - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_243A66978;
  return sub_243DF5C58(v3);
}

uint64_t sub_243DF6590(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t objectdestroyTm_34()
{
  uint64_t v1 = type metadata accessor for OrderImportPreview();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A860);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_243DFC6A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1AF98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_243DFC760();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_243DF67A4()
{
  return sub_243DF67BC(sub_243DF5FBC);
}

uint64_t sub_243DF67BC(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for OrderImportPreview() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_243DF6830(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E23238);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_243DF6898()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for OrderImportControllerProvider()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for OrderImportPreview(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    *(void *)(a1 + 24) = a2[3];
    uint64_t v8 = a2[6];
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    *(void *)(a1 + 48) = v8;
    *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
    uint64_t v9 = *(int *)(a3 + 36);
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    *(void *)(a1 + 64) = a2[8];
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A860);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_243DFC6A0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      void *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = *(int *)(a3 + 40);
    id v14 = (void *)(a1 + v13);
    id v15 = (uint64_t *)((char *)a2 + v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E1AF98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_243DFC760();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *id v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for OrderImportPreview(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A860);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_243DFC6A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1AF98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_243DFC760();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

uint64_t initializeWithCopy for OrderImportPreview(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = v7;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v8 = *(int *)(a3 + 36);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A860);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_243DFC6A0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    void *v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = *(int *)(a3 + 40);
  uint64_t v13 = (void *)(a1 + v12);
  id v14 = (void *)(a2 + v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1AF98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_243DFC760();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  else
  {
    *uint64_t v13 = *v14;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for OrderImportPreview(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 36);
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (void *)(a2 + v7);
    sub_243A56808(a1 + v7, &qword_268E1A860);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A860);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_243DFC6A0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = *(int *)(a3 + 40);
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (void *)(a2 + v11);
    sub_243A56808(a1 + v11, &qword_268E1AF98);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268E1AF98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_243DFC760();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      *uint64_t v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for OrderImportPreview(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A860);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_243DFC6A0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v12 = *(int *)(a3 + 40);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1AF98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = sub_243DFC760();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v16 - 8) + 32))(v13, v14, v16);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for OrderImportPreview(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 36);
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (const void *)(a2 + v7);
    sub_243A56808(a1 + v7, &qword_268E1A860);
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A860);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_243DFC6A0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
    uint64_t v12 = *(int *)(a3 + 40);
    uint64_t v13 = (void *)(a1 + v12);
    uint64_t v14 = (const void *)(a2 + v12);
    sub_243A56808(a1 + v12, &qword_268E1AF98);
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1AF98);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_243DFC760();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v16 - 8) + 32))(v13, v14, v16);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for OrderImportPreview(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243DF73A4);
}

uint64_t sub_243DF73A4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E209E0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 36);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1C760);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)a1 + *(int *)(a3 + 40);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for OrderImportPreview(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243DF74EC);
}

void *sub_243DF74EC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268E209E0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 36);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1C760);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 40);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_243DF7620()
{
  sub_243DF7754(319, (unint64_t *)&qword_268E20A00, MEMORY[0x263F188C0]);
  if (v0 <= 0x3F)
  {
    sub_243DF7754(319, &qword_268E1C778, MEMORY[0x263F18948]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_243DF7754(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_243DFC530();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

ValueMetadata *type metadata accessor for OrderImportPreview.ImportResult()
{
  return &type metadata for OrderImportPreview.ImportResult;
}

unint64_t sub_243DF77BC()
{
  unint64_t result = qword_268E23268;
  if (!qword_268E23268)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E23250);
    sub_243DF7838();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E23268);
  }
  return result;
}

unint64_t sub_243DF7838()
{
  unint64_t result = qword_268E23270;
  if (!qword_268E23270)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268E23238);
    sub_243C81CC4();
    sub_243DF78E4((unint64_t *)&qword_268E186B8, MEMORY[0x263F189F8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268E23270);
  }
  return result;
}

uint64_t sub_243DF78E4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_243DF792C()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_243DF7964(uint64_t a1, uint64_t a2)
{
  sub_243DF40D0(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_243DF796C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a3;
  v4[10] = a4;
  v4[7] = a1;
  v4[8] = a2;
  uint64_t v5 = sub_243DFC2C0();
  v4[11] = v5;
  v4[12] = *(void *)(v5 - 8);
  v4[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E183C0);
  v4[14] = swift_task_alloc();
  uint64_t v6 = sub_243DF8960();
  v4[15] = v6;
  v4[16] = *(void *)(v6 - 8);
  v4[17] = swift_task_alloc();
  v4[18] = swift_task_alloc();
  uint64_t v7 = sub_243DFBE80();
  v4[19] = v7;
  v4[20] = *(void *)(v7 - 8);
  v4[21] = swift_task_alloc();
  uint64_t v8 = sub_243DFACC0();
  v4[22] = v8;
  v4[23] = *(void *)(v8 - 8);
  v4[24] = swift_task_alloc();
  sub_243DFEB80();
  v4[25] = sub_243DFEB70();
  uint64_t v10 = sub_243DFEB30();
  v4[26] = v10;
  v4[27] = v9;
  return MEMORY[0x270FA2498](sub_243DF7BB8, v10, v9);
}

uint64_t sub_243DF7BB8()
{
  if (sub_243DF99E0())
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
    return v1(1);
  }
  else
  {
    uint64_t v4 = v0[20];
    uint64_t v3 = v0[21];
    uint64_t v5 = v0[19];
    uint64_t v6 = v0[14];
    sub_243DF9330();
    sub_243DF9350();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v6, v3, v5);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v6, 0, 1, v5);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[28] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_243DF7D6C;
    uint64_t v8 = v0[24];
    uint64_t v9 = v0[18];
    uint64_t v10 = v0[14];
    return MEMORY[0x270EEC070](v9, v8, v10);
  }
}

uint64_t sub_243DF7D6C()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 112);
  *(void *)(*v1 + 232) = v0;
  swift_task_dealloc();
  sub_243A56808(v3, &qword_268E183C0);
  uint64_t v4 = *(void *)(v2 + 216);
  uint64_t v5 = *(void *)(v2 + 208);
  if (v0) {
    uint64_t v6 = sub_243DF8080;
  }
  else {
    uint64_t v6 = sub_243DF7ECC;
  }
  return MEMORY[0x270FA2498](v6, v5, v4);
}

uint64_t sub_243DF7ECC()
{
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[23];
  uint64_t v5 = v0[20];
  uint64_t v4 = v0[21];
  uint64_t v6 = v0[19];
  uint64_t v14 = v0[18];
  uint64_t v7 = v0[16];
  uint64_t v8 = v0[17];
  uint64_t v9 = v0[15];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v8, v14, v9);
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 88))(v8, v9);
  if (v10 == *MEMORY[0x263F05650]) {
    goto LABEL_4;
  }
  if (v10 != *MEMORY[0x263F05658])
  {
    if (v10 == *MEMORY[0x263F05640])
    {
LABEL_4:
      uint64_t v11 = 0;
      goto LABEL_8;
    }
    if (v10 != *MEMORY[0x263F05648]) {
      (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
    }
  }
  uint64_t v11 = 1;
LABEL_8:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(uint64_t))v0[1];
  return v12(v11);
}

uint64_t sub_243DF8080()
{
  uint64_t v33 = v0;
  uint64_t v1 = (void *)v0[29];
  swift_release();
  sub_243DFC260();
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_243DFC290();
  os_log_type_t v5 = sub_243DFEDA0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (void *)v0[29];
    uint64_t v28 = v0[22];
    uint64_t v30 = v0[24];
    uint64_t v26 = v0[21];
    uint64_t v27 = v0[23];
    uint64_t v24 = v0[20];
    uint64_t v25 = v0[19];
    uint64_t v21 = v0[12];
    uint64_t v22 = v0[11];
    uint64_t v23 = v0[13];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v32 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_getErrorValue();
    uint64_t v9 = sub_243DFF3F0();
    v0[6] = sub_243A75AB4(v9, v10, &v32);
    sub_243DFEFE0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_243A50000, v4, v5, "Failed to query order: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245687A10](v8, -1, -1);
    MEMORY[0x245687A10](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v22);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v30, v28);
  }
  else
  {
    uint64_t v11 = (void *)v0[29];
    uint64_t v12 = v0[23];
    uint64_t v13 = v0[21];
    uint64_t v29 = v0[22];
    uint64_t v31 = v0[24];
    uint64_t v15 = v0[19];
    uint64_t v14 = v0[20];
    uint64_t v16 = v0[12];
    uint64_t v17 = v0[13];
    uint64_t v18 = v0[11];

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v18);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v31, v29);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19(0);
}

uint64_t sub_243DF8390()
{
  uint64_t v1 = type metadata accessor for OrderImportPreview();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A860);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_243DFC6A0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1AF98);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_243DFC760();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_243DF8548(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for OrderImportPreview() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_243A66048;
  return sub_243DF50C8(a1, v5, v6, v7, v8);
}

uint64_t sub_243DF8644()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_243DF867C(void **a1)
{
  sub_243DF4140(a1, *(void (**)(uint64_t, void *))(v1 + 16));
}

uint64_t sub_243DF8684(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_243DF86E4(id a1)
{
  if ((unint64_t)a1 >= 2) {
}
  }

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_243DF8730()
{
  return MEMORY[0x270EE0C80]();
}

uint64_t sub_243DF8740()
{
  return MEMORY[0x270EE0CB0]();
}

uint64_t sub_243DF8750()
{
  return MEMORY[0x270EE0CD0]();
}

uint64_t sub_243DF8760()
{
  return MEMORY[0x270EE0D18]();
}

uint64_t sub_243DF87A0()
{
  return MEMORY[0x270EE0E88]();
}

uint64_t sub_243DF87B0()
{
  return MEMORY[0x270EE0FB0]();
}

uint64_t sub_243DF87C0()
{
  return MEMORY[0x270EE11D8]();
}

uint64_t sub_243DF87D0()
{
  return MEMORY[0x270EE1258]();
}

uint64_t sub_243DF87E0()
{
  return MEMORY[0x270EE1918]();
}

uint64_t sub_243DF87F0()
{
  return MEMORY[0x270EE1938]();
}

uint64_t sub_243DF8810()
{
  return MEMORY[0x270EE1A20]();
}

uint64_t sub_243DF8820()
{
  return MEMORY[0x270EE1B80]();
}

uint64_t sub_243DF8830()
{
  return MEMORY[0x270EE1C48]();
}

uint64_t sub_243DF8840()
{
  return MEMORY[0x270EE1CB0]();
}

uint64_t sub_243DF8850()
{
  return MEMORY[0x270EE1CC0]();
}

uint64_t sub_243DF8870()
{
  return MEMORY[0x270EEC010]();
}

uint64_t sub_243DF8880()
{
  return MEMORY[0x270EEC018]();
}

uint64_t sub_243DF8890()
{
  return MEMORY[0x270EEC020]();
}

uint64_t sub_243DF88A0()
{
  return MEMORY[0x270EEC028]();
}

uint64_t sub_243DF88B0()
{
  return MEMORY[0x270EEC030]();
}

uint64_t sub_243DF88D0()
{
  return MEMORY[0x270EEC040]();
}

uint64_t sub_243DF88E0()
{
  return MEMORY[0x270EEC048]();
}

uint64_t sub_243DF88F0()
{
  return MEMORY[0x270EEC050]();
}

uint64_t sub_243DF8900()
{
  return MEMORY[0x270EEC058]();
}

uint64_t sub_243DF8940()
{
  return MEMORY[0x270EEC078]();
}

uint64_t sub_243DF8960()
{
  return MEMORY[0x270EEC090]();
}

uint64_t sub_243DF8970()
{
  return MEMORY[0x270EEC098]();
}

uint64_t sub_243DF8980()
{
  return MEMORY[0x270EEC0A8]();
}

uint64_t sub_243DF89C0()
{
  return MEMORY[0x270EEC0C8]();
}

uint64_t sub_243DF89D0()
{
  return MEMORY[0x270EEC0D0]();
}

uint64_t sub_243DF89F0()
{
  return MEMORY[0x270EEC0E0]();
}

uint64_t sub_243DF8A00()
{
  return MEMORY[0x270EEC0E8]();
}

uint64_t sub_243DF8A10()
{
  return MEMORY[0x270EEC0F0]();
}

uint64_t sub_243DF8A20()
{
  return MEMORY[0x270EEC0F8]();
}

uint64_t sub_243DF8A30()
{
  return MEMORY[0x270EEC100]();
}

uint64_t sub_243DF8A40()
{
  return MEMORY[0x270EEC108]();
}

uint64_t sub_243DF8A50()
{
  return MEMORY[0x270EEC110]();
}

uint64_t sub_243DF8A60()
{
  return MEMORY[0x270EEC118]();
}

uint64_t sub_243DF8A70()
{
  return MEMORY[0x270EEC120]();
}

uint64_t sub_243DF8A80()
{
  return MEMORY[0x270EEC128]();
}

uint64_t sub_243DF8A90()
{
  return MEMORY[0x270EEC130]();
}

uint64_t sub_243DF8AA0()
{
  return MEMORY[0x270EEC138]();
}

uint64_t sub_243DF8AB0()
{
  return MEMORY[0x270EEC140]();
}

uint64_t sub_243DF8AC0()
{
  return MEMORY[0x270EEC148]();
}

uint64_t sub_243DF8AD0()
{
  return MEMORY[0x270EEC150]();
}

uint64_t sub_243DF8AE0()
{
  return MEMORY[0x270EEC158]();
}

uint64_t sub_243DF8AF0()
{
  return MEMORY[0x270EEC160]();
}

uint64_t sub_243DF8B00()
{
  return MEMORY[0x270EEC168]();
}

uint64_t sub_243DF8B10()
{
  return MEMORY[0x270EEC170]();
}

uint64_t sub_243DF8B20()
{
  return MEMORY[0x270EEC178]();
}

uint64_t sub_243DF8B30()
{
  return MEMORY[0x270EEC180]();
}

uint64_t sub_243DF8B40()
{
  return MEMORY[0x270EEC188]();
}

uint64_t sub_243DF8B50()
{
  return MEMORY[0x270EEC190]();
}

uint64_t sub_243DF8B60()
{
  return MEMORY[0x270EEC198]();
}

uint64_t sub_243DF8B70()
{
  return MEMORY[0x270EEC1A0]();
}

uint64_t sub_243DF8B80()
{
  return MEMORY[0x270EEC1A8]();
}

uint64_t sub_243DF8B90()
{
  return MEMORY[0x270EEC1B0]();
}

uint64_t sub_243DF8BA0()
{
  return MEMORY[0x270EEC1B8]();
}

uint64_t sub_243DF8BB0()
{
  return MEMORY[0x270EEC1C0]();
}

uint64_t sub_243DF8BC0()
{
  return MEMORY[0x270EEC1C8]();
}

uint64_t sub_243DF8BD0()
{
  return MEMORY[0x270EEC1D0]();
}

uint64_t sub_243DF8BE0()
{
  return MEMORY[0x270EEC1E0]();
}

uint64_t sub_243DF8BF0()
{
  return MEMORY[0x270EEC1E8]();
}

uint64_t sub_243DF8C00()
{
  return MEMORY[0x270EEC1F0]();
}

uint64_t sub_243DF8C10()
{
  return MEMORY[0x270EEC1F8]();
}

uint64_t sub_243DF8C20()
{
  return MEMORY[0x270EEC200]();
}

uint64_t sub_243DF8C30()
{
  return MEMORY[0x270EEC208]();
}

uint64_t sub_243DF8C40()
{
  return MEMORY[0x270EEC210]();
}

uint64_t sub_243DF8C50()
{
  return MEMORY[0x270EEC218]();
}

uint64_t sub_243DF8C60()
{
  return MEMORY[0x270EEC220]();
}

uint64_t sub_243DF8C70()
{
  return MEMORY[0x270EEC228]();
}

uint64_t sub_243DF8C80()
{
  return MEMORY[0x270EEC230]();
}

uint64_t sub_243DF8C90()
{
  return MEMORY[0x270EEC238]();
}

uint64_t sub_243DF8CA0()
{
  return MEMORY[0x270EEC240]();
}

uint64_t sub_243DF8CB0()
{
  return MEMORY[0x270EEC248]();
}

uint64_t sub_243DF8CC0()
{
  return MEMORY[0x270EEC250]();
}

uint64_t sub_243DF8CD0()
{
  return MEMORY[0x270EEC258]();
}

uint64_t sub_243DF8CE0()
{
  return MEMORY[0x270EEC260]();
}

uint64_t sub_243DF8CF0()
{
  return MEMORY[0x270EEC268]();
}

uint64_t sub_243DF8D00()
{
  return MEMORY[0x270EEC270]();
}

uint64_t sub_243DF8D10()
{
  return MEMORY[0x270EEC278]();
}

uint64_t sub_243DF8D20()
{
  return MEMORY[0x270EEC280]();
}

uint64_t sub_243DF8D30()
{
  return MEMORY[0x270EEC288]();
}

uint64_t sub_243DF8D40()
{
  return MEMORY[0x270EEC290]();
}

uint64_t sub_243DF8D50()
{
  return MEMORY[0x270EEC298]();
}

uint64_t sub_243DF8D60()
{
  return MEMORY[0x270EEC2A0]();
}

uint64_t sub_243DF8D70()
{
  return MEMORY[0x270EEC2A8]();
}

uint64_t sub_243DF8D80()
{
  return MEMORY[0x270EEC2B0]();
}

uint64_t sub_243DF8D90()
{
  return MEMORY[0x270EEC2B8]();
}

uint64_t sub_243DF8DA0()
{
  return MEMORY[0x270EEC2C0]();
}

uint64_t sub_243DF8DB0()
{
  return MEMORY[0x270EEC2C8]();
}

uint64_t sub_243DF8DC0()
{
  return MEMORY[0x270EEC2D0]();
}

uint64_t sub_243DF8DD0()
{
  return MEMORY[0x270EEC2D8]();
}

uint64_t sub_243DF8DE0()
{
  return MEMORY[0x270EEC2E0]();
}

uint64_t sub_243DF8DF0()
{
  return MEMORY[0x270EEC2E8]();
}

uint64_t sub_243DF8E00()
{
  return MEMORY[0x270EEC2F0]();
}

uint64_t sub_243DF8E10()
{
  return MEMORY[0x270EEC2F8]();
}

uint64_t sub_243DF8E20()
{
  return MEMORY[0x270EEC300]();
}

uint64_t sub_243DF8E30()
{
  return MEMORY[0x270EEC308]();
}

uint64_t sub_243DF8E40()
{
  return MEMORY[0x270EEC310]();
}

uint64_t sub_243DF8E50()
{
  return MEMORY[0x270EEC318]();
}

uint64_t sub_243DF8E60()
{
  return MEMORY[0x270EEC320]();
}

uint64_t sub_243DF8E70()
{
  return MEMORY[0x270EEC328]();
}

uint64_t sub_243DF8E80()
{
  return MEMORY[0x270EEC330]();
}

uint64_t sub_243DF8E90()
{
  return MEMORY[0x270EEC338]();
}

uint64_t sub_243DF8EA0()
{
  return MEMORY[0x270EEC340]();
}

uint64_t sub_243DF8EB0()
{
  return MEMORY[0x270EEC348]();
}

uint64_t sub_243DF8EC0()
{
  return MEMORY[0x270EEC350]();
}

uint64_t sub_243DF8ED0()
{
  return MEMORY[0x270EEC358]();
}

uint64_t sub_243DF8EE0()
{
  return MEMORY[0x270EEC360]();
}

uint64_t sub_243DF8EF0()
{
  return MEMORY[0x270EEC368]();
}

uint64_t sub_243DF8F00()
{
  return MEMORY[0x270EEC370]();
}

uint64_t sub_243DF8F10()
{
  return MEMORY[0x270EEC378]();
}

uint64_t sub_243DF8F20()
{
  return MEMORY[0x270EEC380]();
}

uint64_t sub_243DF8F30()
{
  return MEMORY[0x270EEC388]();
}

uint64_t sub_243DF8F40()
{
  return MEMORY[0x270EEC390]();
}

uint64_t sub_243DF8F50()
{
  return MEMORY[0x270EEC398]();
}

uint64_t sub_243DF8F60()
{
  return MEMORY[0x270EEC3A0]();
}

uint64_t sub_243DF8F70()
{
  return MEMORY[0x270EEC3A8]();
}

uint64_t sub_243DF8F80()
{
  return MEMORY[0x270EEC3B0]();
}

uint64_t sub_243DF8F90()
{
  return MEMORY[0x270EEC3B8]();
}

uint64_t sub_243DF8FA0()
{
  return MEMORY[0x270EEC3C0]();
}

uint64_t sub_243DF8FB0()
{
  return MEMORY[0x270EEC3C8]();
}

uint64_t sub_243DF8FC0()
{
  return MEMORY[0x270EEC3D0]();
}

uint64_t sub_243DF8FD0()
{
  return MEMORY[0x270EEC3D8]();
}

uint64_t sub_243DF8FE0()
{
  return MEMORY[0x270EEC3E0]();
}

uint64_t sub_243DF8FF0()
{
  return MEMORY[0x270EEC3E8]();
}

uint64_t sub_243DF9000()
{
  return MEMORY[0x270EEC3F0]();
}

uint64_t sub_243DF9010()
{
  return MEMORY[0x270EEC400]();
}

uint64_t sub_243DF9020()
{
  return MEMORY[0x270EEC410]();
}

uint64_t sub_243DF9040()
{
  return MEMORY[0x270EEC420]();
}

uint64_t sub_243DF9050()
{
  return MEMORY[0x270EEC428]();
}

uint64_t sub_243DF9060()
{
  return MEMORY[0x270EEC430]();
}

uint64_t sub_243DF9070()
{
  return MEMORY[0x270EEC438]();
}

uint64_t sub_243DF9080()
{
  return MEMORY[0x270EEC440]();
}

uint64_t sub_243DF9090()
{
  return MEMORY[0x270EEC448]();
}

uint64_t sub_243DF90A0()
{
  return MEMORY[0x270EEC450]();
}

uint64_t sub_243DF90B0()
{
  return MEMORY[0x270EEC458]();
}

uint64_t sub_243DF90C0()
{
  return MEMORY[0x270EEC460]();
}

uint64_t sub_243DF90D0()
{
  return MEMORY[0x270EEC468]();
}

uint64_t sub_243DF90E0()
{
  return MEMORY[0x270EEC470]();
}

uint64_t sub_243DF90F0()
{
  return MEMORY[0x270EEC488]();
}

uint64_t sub_243DF9100()
{
  return MEMORY[0x270EEC490]();
}

uint64_t sub_243DF9110()
{
  return MEMORY[0x270EEC498]();
}

uint64_t sub_243DF9120()
{
  return MEMORY[0x270EEC4A0]();
}

uint64_t sub_243DF9130()
{
  return MEMORY[0x270EEC4A8]();
}

uint64_t sub_243DF9140()
{
  return MEMORY[0x270EEC4B0]();
}

uint64_t sub_243DF9150()
{
  return MEMORY[0x270EEC4B8]();
}

uint64_t sub_243DF9160()
{
  return MEMORY[0x270EEC4C0]();
}

uint64_t sub_243DF9170()
{
  return MEMORY[0x270EEC4C8]();
}

uint64_t sub_243DF9180()
{
  return MEMORY[0x270EEC4D0]();
}

uint64_t sub_243DF9190()
{
  return MEMORY[0x270EEC4D8]();
}

uint64_t sub_243DF91A0()
{
  return MEMORY[0x270EEC4E0]();
}

uint64_t sub_243DF91B0()
{
  return MEMORY[0x270EEC4E8]();
}

uint64_t sub_243DF91C0()
{
  return MEMORY[0x270EEC4F0]();
}

uint64_t sub_243DF91D0()
{
  return MEMORY[0x270EEC4F8]();
}

uint64_t sub_243DF91E0()
{
  return MEMORY[0x270EEC500]();
}

uint64_t sub_243DF91F0()
{
  return MEMORY[0x270EEC508]();
}

uint64_t sub_243DF9200()
{
  return MEMORY[0x270EEC510]();
}

uint64_t sub_243DF9210()
{
  return MEMORY[0x270EEC518]();
}

uint64_t sub_243DF9220()
{
  return MEMORY[0x270EEC520]();
}

uint64_t sub_243DF9230()
{
  return MEMORY[0x270EEC528]();
}

uint64_t sub_243DF9240()
{
  return MEMORY[0x270EEC530]();
}

uint64_t sub_243DF9250()
{
  return MEMORY[0x270EEC538]();
}

uint64_t sub_243DF9260()
{
  return MEMORY[0x270EEC540]();
}

uint64_t sub_243DF9270()
{
  return MEMORY[0x270EEC548]();
}

uint64_t sub_243DF9280()
{
  return MEMORY[0x270EEC550]();
}

uint64_t sub_243DF9290()
{
  return MEMORY[0x270EEC558]();
}

uint64_t sub_243DF92A0()
{
  return MEMORY[0x270EEC560]();
}

uint64_t sub_243DF92B0()
{
  return MEMORY[0x270EEC568]();
}

uint64_t sub_243DF92C0()
{
  return MEMORY[0x270EEC570]();
}

uint64_t sub_243DF92D0()
{
  return MEMORY[0x270EEC578]();
}

uint64_t sub_243DF92E0()
{
  return MEMORY[0x270EEC580]();
}

uint64_t sub_243DF92F0()
{
  return MEMORY[0x270EEC588]();
}

uint64_t sub_243DF9300()
{
  return MEMORY[0x270EEC590]();
}

uint64_t sub_243DF9310()
{
  return MEMORY[0x270EEC598]();
}

uint64_t sub_243DF9320()
{
  return MEMORY[0x270EEC5A8]();
}

uint64_t sub_243DF9330()
{
  return MEMORY[0x270EEC5B0]();
}

uint64_t sub_243DF9340()
{
  return MEMORY[0x270EEC5B8]();
}

uint64_t sub_243DF9350()
{
  return MEMORY[0x270EEC5C0]();
}

uint64_t sub_243DF9360()
{
  return MEMORY[0x270EEC5C8]();
}

uint64_t sub_243DF9370()
{
  return MEMORY[0x270EEC5E8]();
}

uint64_t sub_243DF9380()
{
  return MEMORY[0x270EEC5F0]();
}

uint64_t sub_243DF9390()
{
  return MEMORY[0x270EEC5F8]();
}

uint64_t sub_243DF93A0()
{
  return MEMORY[0x270EEC600]();
}

uint64_t sub_243DF93B0()
{
  return MEMORY[0x270EEC608]();
}

uint64_t sub_243DF93C0()
{
  return MEMORY[0x270EEC610]();
}

uint64_t sub_243DF93D0()
{
  return MEMORY[0x270EEC618]();
}

uint64_t sub_243DF93E0()
{
  return MEMORY[0x270EEC620]();
}

uint64_t sub_243DF93F0()
{
  return MEMORY[0x270EEC628]();
}

uint64_t sub_243DF9400()
{
  return MEMORY[0x270EEC630]();
}

uint64_t sub_243DF9410()
{
  return MEMORY[0x270EEC638]();
}

uint64_t sub_243DF9420()
{
  return MEMORY[0x270EEC640]();
}

uint64_t sub_243DF9430()
{
  return MEMORY[0x270EEC648]();
}

uint64_t sub_243DF9440()
{
  return MEMORY[0x270EEC650]();
}

uint64_t sub_243DF9450()
{
  return MEMORY[0x270EEC658]();
}

uint64_t sub_243DF9460()
{
  return MEMORY[0x270EEC660]();
}

uint64_t sub_243DF9470()
{
  return MEMORY[0x270EEC668]();
}

uint64_t sub_243DF9480()
{
  return MEMORY[0x270EEC670]();
}

uint64_t sub_243DF94A0()
{
  return MEMORY[0x270EEC680]();
}

uint64_t sub_243DF94B0()
{
  return MEMORY[0x270EEC688]();
}

uint64_t sub_243DF94C0()
{
  return MEMORY[0x270EEC690]();
}

uint64_t sub_243DF94D0()
{
  return MEMORY[0x270EEC698]();
}

uint64_t sub_243DF94E0()
{
  return MEMORY[0x270EEC6A0]();
}

uint64_t sub_243DF94F0()
{
  return MEMORY[0x270EEC6A8]();
}

uint64_t sub_243DF9500()
{
  return MEMORY[0x270EEC6B8]();
}

uint64_t sub_243DF9510()
{
  return MEMORY[0x270EEC6E0]();
}

uint64_t sub_243DF9520()
{
  return MEMORY[0x270EEC6E8]();
}

uint64_t sub_243DF9530()
{
  return MEMORY[0x270EEC6F0]();
}

uint64_t sub_243DF9540()
{
  return MEMORY[0x270EEC6F8]();
}

uint64_t sub_243DF9550()
{
  return MEMORY[0x270EEC700]();
}

uint64_t sub_243DF9560()
{
  return MEMORY[0x270EEC708]();
}

uint64_t sub_243DF9570()
{
  return MEMORY[0x270EEC710]();
}

uint64_t sub_243DF9580()
{
  return MEMORY[0x270EEC718]();
}

uint64_t sub_243DF9590()
{
  return MEMORY[0x270EEC720]();
}

uint64_t sub_243DF95A0()
{
  return MEMORY[0x270EEC728]();
}

uint64_t sub_243DF95B0()
{
  return MEMORY[0x270EEC730]();
}

uint64_t sub_243DF95C0()
{
  return MEMORY[0x270EEC738]();
}

uint64_t sub_243DF95D0()
{
  return MEMORY[0x270EEC740]();
}

uint64_t sub_243DF95E0()
{
  return MEMORY[0x270EEC748]();
}

uint64_t sub_243DF95F0()
{
  return MEMORY[0x270EEC750]();
}

uint64_t sub_243DF9600()
{
  return MEMORY[0x270EEC758]();
}

uint64_t sub_243DF9610()
{
  return MEMORY[0x270EEC760]();
}

uint64_t sub_243DF9620()
{
  return MEMORY[0x270EEC768]();
}

uint64_t sub_243DF9630()
{
  return MEMORY[0x270EEC770]();
}

uint64_t sub_243DF9640()
{
  return MEMORY[0x270EEC778]();
}

uint64_t sub_243DF9650()
{
  return MEMORY[0x270EEC780]();
}

uint64_t sub_243DF9660()
{
  return MEMORY[0x270EEC788]();
}

uint64_t sub_243DF9670()
{
  return MEMORY[0x270EEC790]();
}

uint64_t sub_243DF9680()
{
  return MEMORY[0x270EEC798]();
}

uint64_t sub_243DF9690()
{
  return MEMORY[0x270EEC7A0]();
}

uint64_t sub_243DF96A0()
{
  return MEMORY[0x270EEC7A8]();
}

uint64_t sub_243DF96B0()
{
  return MEMORY[0x270EEC7B0]();
}

uint64_t sub_243DF96C0()
{
  return MEMORY[0x270EEC7B8]();
}

uint64_t sub_243DF96D0()
{
  return MEMORY[0x270EEC7C0]();
}

uint64_t sub_243DF96E0()
{
  return MEMORY[0x270EEC7C8]();
}

uint64_t sub_243DF96F0()
{
  return MEMORY[0x270EEC7D0]();
}

uint64_t sub_243DF9700()
{
  return MEMORY[0x270EEC7D8]();
}

uint64_t sub_243DF9710()
{
  return MEMORY[0x270EEC7E0]();
}

uint64_t sub_243DF9720()
{
  return MEMORY[0x270EEC7E8]();
}

uint64_t sub_243DF9730()
{
  return MEMORY[0x270EEC7F0]();
}

uint64_t sub_243DF9740()
{
  return MEMORY[0x270EEC7F8]();
}

uint64_t sub_243DF9750()
{
  return MEMORY[0x270EEC800]();
}

uint64_t sub_243DF9760()
{
  return MEMORY[0x270EEC808]();
}

uint64_t sub_243DF9770()
{
  return MEMORY[0x270EEC810]();
}

uint64_t sub_243DF9850()
{
  return MEMORY[0x270EEC880]();
}

uint64_t sub_243DF9860()
{
  return MEMORY[0x270EEC888]();
}

uint64_t sub_243DF9870()
{
  return MEMORY[0x270EEC890]();
}

uint64_t sub_243DF9880()
{
  return MEMORY[0x270EEC898]();
}

uint64_t sub_243DF9890()
{
  return MEMORY[0x270EEC8A0]();
}

uint64_t sub_243DF98A0()
{
  return MEMORY[0x270EEC8A8]();
}

uint64_t sub_243DF98B0()
{
  return MEMORY[0x270EEC8B0]();
}

uint64_t sub_243DF98C0()
{
  return MEMORY[0x270EEC8B8]();
}

uint64_t sub_243DF98D0()
{
  return MEMORY[0x270EEC8C0]();
}

uint64_t sub_243DF98E0()
{
  return MEMORY[0x270EEC8C8]();
}

uint64_t sub_243DF98F0()
{
  return MEMORY[0x270EEC8D0]();
}

uint64_t sub_243DF9900()
{
  return MEMORY[0x270EEC8D8]();
}

uint64_t sub_243DF9910()
{
  return MEMORY[0x270EEC8E0]();
}

uint64_t sub_243DF9920()
{
  return MEMORY[0x270EEC8E8]();
}

uint64_t sub_243DF9930()
{
  return MEMORY[0x270EEC8F0]();
}

uint64_t sub_243DF9940()
{
  return MEMORY[0x270EEC8F8]();
}

uint64_t sub_243DF9950()
{
  return MEMORY[0x270EEC900]();
}

uint64_t sub_243DF9960()
{
  return MEMORY[0x270EEC908]();
}

uint64_t sub_243DF9970()
{
  return MEMORY[0x270EEC910]();
}

uint64_t sub_243DF9980()
{
  return MEMORY[0x270EEC918]();
}

uint64_t sub_243DF9990()
{
  return MEMORY[0x270EEC920]();
}

uint64_t sub_243DF99A0()
{
  return MEMORY[0x270EEC928]();
}

uint64_t sub_243DF99B0()
{
  return MEMORY[0x270EEC930]();
}

uint64_t sub_243DF99C0()
{
  return MEMORY[0x270EEC938]();
}

uint64_t sub_243DF99D0()
{
  return MEMORY[0x270EEC940]();
}

uint64_t sub_243DF99E0()
{
  return MEMORY[0x270EEC948]();
}

uint64_t sub_243DF99F0()
{
  return MEMORY[0x270EEC950]();
}

uint64_t sub_243DF9A00()
{
  return MEMORY[0x270EEC958]();
}

uint64_t sub_243DF9A10()
{
  return MEMORY[0x270EEC960]();
}

uint64_t sub_243DF9A20()
{
  return MEMORY[0x270EEC968]();
}

uint64_t sub_243DF9A30()
{
  return MEMORY[0x270EEC970]();
}

uint64_t sub_243DF9A40()
{
  return MEMORY[0x270EEC978]();
}

uint64_t sub_243DF9A50()
{
  return MEMORY[0x270EEC980]();
}

uint64_t sub_243DF9A60()
{
  return MEMORY[0x270EEC988]();
}

uint64_t sub_243DF9A70()
{
  return MEMORY[0x270EEC990]();
}

uint64_t sub_243DF9A80()
{
  return MEMORY[0x270EEC998]();
}

uint64_t sub_243DF9A90()
{
  return MEMORY[0x270EEC9A0]();
}

uint64_t sub_243DF9AA0()
{
  return MEMORY[0x270EEC9A8]();
}

uint64_t sub_243DF9AB0()
{
  return MEMORY[0x270EEC9B0]();
}

uint64_t sub_243DF9AC0()
{
  return MEMORY[0x270EEC9B8]();
}

uint64_t sub_243DF9AD0()
{
  return MEMORY[0x270EEC9C0]();
}

uint64_t sub_243DF9AE0()
{
  return MEMORY[0x270EEC9C8]();
}

uint64_t sub_243DF9AF0()
{
  return MEMORY[0x270EEC9D0]();
}

uint64_t sub_243DF9B00()
{
  return MEMORY[0x270EEC9D8]();
}

uint64_t sub_243DF9B10()
{
  return MEMORY[0x270EEC9E0]();
}

uint64_t sub_243DF9B20()
{
  return MEMORY[0x270EEC9E8]();
}

uint64_t sub_243DF9B30()
{
  return MEMORY[0x270EEC9F0]();
}

uint64_t sub_243DF9B40()
{
  return MEMORY[0x270EEC9F8]();
}

uint64_t sub_243DF9B50()
{
  return MEMORY[0x270EECA00]();
}

uint64_t sub_243DF9B60()
{
  return MEMORY[0x270EECA08]();
}

uint64_t sub_243DF9B70()
{
  return MEMORY[0x270EECA10]();
}

uint64_t sub_243DF9B80()
{
  return MEMORY[0x270EECA18]();
}

uint64_t sub_243DF9B90()
{
  return MEMORY[0x270EECA20]();
}

uint64_t sub_243DF9BA0()
{
  return MEMORY[0x270EECA28]();
}

uint64_t sub_243DF9BB0()
{
  return MEMORY[0x270EECA30]();
}

uint64_t sub_243DF9BC0()
{
  return MEMORY[0x270EECA38]();
}

uint64_t sub_243DF9BD0()
{
  return MEMORY[0x270EECA40]();
}

uint64_t sub_243DF9BE0()
{
  return MEMORY[0x270EECA48]();
}

uint64_t sub_243DF9BF0()
{
  return MEMORY[0x270EECA50]();
}

uint64_t sub_243DF9C00()
{
  return MEMORY[0x270EECA58]();
}

uint64_t sub_243DF9C10()
{
  return MEMORY[0x270EECA60]();
}

uint64_t sub_243DF9C20()
{
  return MEMORY[0x270EECA68]();
}

uint64_t sub_243DF9C30()
{
  return MEMORY[0x270EECA70]();
}

uint64_t sub_243DF9C40()
{
  return MEMORY[0x270EECA78]();
}

uint64_t sub_243DF9C50()
{
  return MEMORY[0x270EECA80]();
}

uint64_t sub_243DF9C60()
{
  return MEMORY[0x270EECA88]();
}

uint64_t sub_243DF9C70()
{
  return MEMORY[0x270EECA90]();
}

uint64_t sub_243DF9C80()
{
  return MEMORY[0x270EECA98]();
}

uint64_t sub_243DF9C90()
{
  return MEMORY[0x270EECAA0]();
}

uint64_t sub_243DF9CA0()
{
  return MEMORY[0x270EECAA8]();
}

uint64_t sub_243DF9CB0()
{
  return MEMORY[0x270EECAB0]();
}

uint64_t sub_243DF9CC0()
{
  return MEMORY[0x270EECAB8]();
}

uint64_t sub_243DF9CD0()
{
  return MEMORY[0x270EECAC0]();
}

uint64_t sub_243DF9CE0()
{
  return MEMORY[0x270EECAC8]();
}

uint64_t sub_243DF9CF0()
{
  return MEMORY[0x270EECAD0]();
}

uint64_t sub_243DF9D00()
{
  return MEMORY[0x270EECAE0]();
}

uint64_t sub_243DF9D10()
{
  return MEMORY[0x270EECAF8]();
}

uint64_t sub_243DF9D20()
{
  return MEMORY[0x270EECB00]();
}

uint64_t sub_243DF9D30()
{
  return MEMORY[0x270EECB08]();
}

uint64_t sub_243DF9D40()
{
  return MEMORY[0x270EECB10]();
}

uint64_t sub_243DF9D50()
{
  return MEMORY[0x270EECB18]();
}

uint64_t sub_243DF9D60()
{
  return MEMORY[0x270EECB20]();
}

uint64_t sub_243DF9D70()
{
  return MEMORY[0x270EECB28]();
}

uint64_t sub_243DF9D80()
{
  return MEMORY[0x270EECB30]();
}

uint64_t sub_243DF9D90()
{
  return MEMORY[0x270EECB38]();
}

uint64_t sub_243DF9DA0()
{
  return MEMORY[0x270EECB40]();
}

uint64_t sub_243DF9DB0()
{
  return MEMORY[0x270EECB48]();
}

uint64_t sub_243DF9DC0()
{
  return MEMORY[0x270EECB50]();
}

uint64_t sub_243DF9DD0()
{
  return MEMORY[0x270EECB58]();
}

uint64_t sub_243DF9DE0()
{
  return MEMORY[0x270EECB60]();
}

uint64_t sub_243DF9DF0()
{
  return MEMORY[0x270EECB68]();
}

uint64_t sub_243DF9E00()
{
  return MEMORY[0x270EECB70]();
}

uint64_t sub_243DF9E10()
{
  return MEMORY[0x270EECB78]();
}

uint64_t sub_243DF9E20()
{
  return MEMORY[0x270EECB80]();
}

uint64_t sub_243DF9E30()
{
  return MEMORY[0x270EECB88]();
}

uint64_t sub_243DF9E40()
{
  return MEMORY[0x270EECB90]();
}

uint64_t sub_243DF9E50()
{
  return MEMORY[0x270EECB98]();
}

uint64_t sub_243DF9E60()
{
  return MEMORY[0x270EECBA0]();
}

uint64_t sub_243DF9E70()
{
  return MEMORY[0x270EECBA8]();
}

uint64_t sub_243DF9E80()
{
  return MEMORY[0x270EECBB0]();
}

uint64_t sub_243DF9E90()
{
  return MEMORY[0x270EECBB8]();
}

uint64_t sub_243DF9EA0()
{
  return MEMORY[0x270EECBC0]();
}

uint64_t sub_243DF9EB0()
{
  return MEMORY[0x270EECBC8]();
}

uint64_t sub_243DF9EC0()
{
  return MEMORY[0x270EECBD0]();
}

uint64_t sub_243DF9ED0()
{
  return MEMORY[0x270EECBD8]();
}

uint64_t sub_243DF9EE0()
{
  return MEMORY[0x270EECBE0]();
}

uint64_t sub_243DF9EF0()
{
  return MEMORY[0x270EECBE8]();
}

uint64_t sub_243DF9F00()
{
  return MEMORY[0x270EECC00]();
}

uint64_t sub_243DF9F10()
{
  return MEMORY[0x270EECC08]();
}

uint64_t sub_243DF9F20()
{
  return MEMORY[0x270EECC10]();
}

uint64_t sub_243DF9F30()
{
  return MEMORY[0x270EECC18]();
}

uint64_t sub_243DF9F40()
{
  return MEMORY[0x270EECC20]();
}

uint64_t sub_243DF9F50()
{
  return MEMORY[0x270EECC28]();
}

uint64_t sub_243DF9F60()
{
  return MEMORY[0x270EECC30]();
}

uint64_t sub_243DF9F70()
{
  return MEMORY[0x270EECC38]();
}

uint64_t sub_243DF9F80()
{
  return MEMORY[0x270EECC40]();
}

uint64_t sub_243DF9F90()
{
  return MEMORY[0x270EECC48]();
}

uint64_t sub_243DF9FA0()
{
  return MEMORY[0x270EECC58]();
}

uint64_t sub_243DF9FB0()
{
  return MEMORY[0x270EECC60]();
}

uint64_t sub_243DF9FC0()
{
  return MEMORY[0x270EECC68]();
}

uint64_t sub_243DF9FD0()
{
  return MEMORY[0x270EECC70]();
}

uint64_t sub_243DF9FE0()
{
  return MEMORY[0x270EECC78]();
}

uint64_t sub_243DF9FF0()
{
  return MEMORY[0x270EECC80]();
}

uint64_t sub_243DFA000()
{
  return MEMORY[0x270EECC88]();
}

uint64_t sub_243DFA010()
{
  return MEMORY[0x270EECC90]();
}

uint64_t sub_243DFA050()
{
  return MEMORY[0x270EECCB0]();
}

uint64_t sub_243DFA060()
{
  return MEMORY[0x270EECCB8]();
}

uint64_t sub_243DFA070()
{
  return MEMORY[0x270EECCC0]();
}

uint64_t sub_243DFA080()
{
  return MEMORY[0x270EECCC8]();
}

uint64_t sub_243DFA090()
{
  return MEMORY[0x270EECCD0]();
}

uint64_t sub_243DFA0A0()
{
  return MEMORY[0x270EECCD8]();
}

uint64_t sub_243DFA0B0()
{
  return MEMORY[0x270EECCE0]();
}

uint64_t sub_243DFA0C0()
{
  return MEMORY[0x270EECCE8]();
}

uint64_t sub_243DFA0D0()
{
  return MEMORY[0x270EECCF0]();
}

uint64_t sub_243DFA0E0()
{
  return MEMORY[0x270EECCF8]();
}

uint64_t sub_243DFA0F0()
{
  return MEMORY[0x270EECD00]();
}

uint64_t sub_243DFA100()
{
  return MEMORY[0x270EECD08]();
}

uint64_t sub_243DFA110()
{
  return MEMORY[0x270EECD10]();
}

uint64_t sub_243DFA120()
{
  return MEMORY[0x270EECD18]();
}

uint64_t sub_243DFA130()
{
  return MEMORY[0x270EECD20]();
}

uint64_t sub_243DFA140()
{
  return MEMORY[0x270EECD28]();
}

uint64_t sub_243DFA150()
{
  return MEMORY[0x270EECD30]();
}

uint64_t sub_243DFA160()
{
  return MEMORY[0x270EECD38]();
}

uint64_t sub_243DFA170()
{
  return MEMORY[0x270EECD40]();
}

uint64_t sub_243DFA180()
{
  return MEMORY[0x270EECD48]();
}

uint64_t sub_243DFA190()
{
  return MEMORY[0x270EECD50]();
}

uint64_t sub_243DFA1A0()
{
  return MEMORY[0x270EECD58]();
}

uint64_t sub_243DFA1B0()
{
  return MEMORY[0x270EECD60]();
}

uint64_t sub_243DFA1C0()
{
  return MEMORY[0x270EECD68]();
}

uint64_t sub_243DFA1D0()
{
  return MEMORY[0x270EECD70]();
}

uint64_t sub_243DFA1E0()
{
  return MEMORY[0x270EECD78]();
}

uint64_t sub_243DFA1F0()
{
  return MEMORY[0x270EECD80]();
}

uint64_t sub_243DFA200()
{
  return MEMORY[0x270EECD88]();
}

uint64_t sub_243DFA210()
{
  return MEMORY[0x270EECD90]();
}

uint64_t sub_243DFA220()
{
  return MEMORY[0x270EECD98]();
}

uint64_t sub_243DFA230()
{
  return MEMORY[0x270EECDA0]();
}

uint64_t sub_243DFA240()
{
  return MEMORY[0x270EECDA8]();
}

uint64_t sub_243DFA250()
{
  return MEMORY[0x270EECDB0]();
}

uint64_t sub_243DFA260()
{
  return MEMORY[0x270EECDB8]();
}

uint64_t sub_243DFA270()
{
  return MEMORY[0x270EECDC0]();
}

uint64_t sub_243DFA280()
{
  return MEMORY[0x270EECDC8]();
}

uint64_t sub_243DFA290()
{
  return MEMORY[0x270EECDD0]();
}

uint64_t sub_243DFA2A0()
{
  return MEMORY[0x270EECDD8]();
}

uint64_t sub_243DFA2B0()
{
  return MEMORY[0x270EECDE0]();
}

uint64_t sub_243DFA2C0()
{
  return MEMORY[0x270EECDE8]();
}

uint64_t sub_243DFA2D0()
{
  return MEMORY[0x270EECDF0]();
}

uint64_t sub_243DFA2E0()
{
  return MEMORY[0x270EECDF8]();
}

uint64_t sub_243DFA2F0()
{
  return MEMORY[0x270EECE00]();
}

uint64_t sub_243DFA300()
{
  return MEMORY[0x270EECE08]();
}

uint64_t sub_243DFA310()
{
  return MEMORY[0x270EECE10]();
}

uint64_t sub_243DFA320()
{
  return MEMORY[0x270EECE18]();
}

uint64_t sub_243DFA330()
{
  return MEMORY[0x270EECE20]();
}

uint64_t sub_243DFA340()
{
  return MEMORY[0x270EECE28]();
}

uint64_t sub_243DFA350()
{
  return MEMORY[0x270EECE30]();
}

uint64_t sub_243DFA360()
{
  return MEMORY[0x270EECE38]();
}

uint64_t sub_243DFA370()
{
  return MEMORY[0x270EECE40]();
}

uint64_t sub_243DFA380()
{
  return MEMORY[0x270EECE48]();
}

uint64_t sub_243DFA390()
{
  return MEMORY[0x270EECE50]();
}

uint64_t sub_243DFA3A0()
{
  return MEMORY[0x270EECE58]();
}

uint64_t sub_243DFA3B0()
{
  return MEMORY[0x270EECE60]();
}

uint64_t sub_243DFA3C0()
{
  return MEMORY[0x270EECE68]();
}

uint64_t sub_243DFA3D0()
{
  return MEMORY[0x270EECE70]();
}

uint64_t sub_243DFA3E0()
{
  return MEMORY[0x270EECE78]();
}

uint64_t sub_243DFA3F0()
{
  return MEMORY[0x270EECE80]();
}

uint64_t sub_243DFA400()
{
  return MEMORY[0x270EECE88]();
}

uint64_t sub_243DFA410()
{
  return MEMORY[0x270EECE90]();
}

uint64_t sub_243DFA420()
{
  return MEMORY[0x270EECE98]();
}

uint64_t sub_243DFA430()
{
  return MEMORY[0x270EECEA0]();
}

uint64_t sub_243DFA440()
{
  return MEMORY[0x270EECEA8]();
}

uint64_t sub_243DFA450()
{
  return MEMORY[0x270EECEB0]();
}

uint64_t sub_243DFA460()
{
  return MEMORY[0x270EECEB8]();
}

uint64_t sub_243DFA470()
{
  return MEMORY[0x270EECEC0]();
}

uint64_t sub_243DFA480()
{
  return MEMORY[0x270EECEC8]();
}

uint64_t sub_243DFA490()
{
  return MEMORY[0x270EECED0]();
}

uint64_t sub_243DFA4A0()
{
  return MEMORY[0x270EECED8]();
}

uint64_t sub_243DFA4B0()
{
  return MEMORY[0x270EECEE0]();
}

uint64_t sub_243DFA4C0()
{
  return MEMORY[0x270EECEE8]();
}

uint64_t sub_243DFA4D0()
{
  return MEMORY[0x270EECEF0]();
}

uint64_t sub_243DFA4E0()
{
  return MEMORY[0x270EECEF8]();
}

uint64_t sub_243DFA4F0()
{
  return MEMORY[0x270EECF00]();
}

uint64_t sub_243DFA500()
{
  return MEMORY[0x270EECF08]();
}

uint64_t sub_243DFA510()
{
  return MEMORY[0x270EECF10]();
}

uint64_t sub_243DFA520()
{
  return MEMORY[0x270EECF18]();
}

uint64_t sub_243DFA530()
{
  return MEMORY[0x270EECF20]();
}

uint64_t sub_243DFA540()
{
  return MEMORY[0x270EECF28]();
}

uint64_t sub_243DFA550()
{
  return MEMORY[0x270EECF30]();
}

uint64_t sub_243DFA560()
{
  return MEMORY[0x270EECF38]();
}

uint64_t sub_243DFA570()
{
  return MEMORY[0x270EECF40]();
}

uint64_t sub_243DFA580()
{
  return MEMORY[0x270EECF48]();
}

uint64_t sub_243DFA590()
{
  return MEMORY[0x270EECF50]();
}

uint64_t sub_243DFA5A0()
{
  return MEMORY[0x270EECF58]();
}

uint64_t sub_243DFA5B0()
{
  return MEMORY[0x270EECF60]();
}

uint64_t sub_243DFA5C0()
{
  return MEMORY[0x270EECF68]();
}

uint64_t sub_243DFA5D0()
{
  return MEMORY[0x270EECF70]();
}

uint64_t sub_243DFA5E0()
{
  return MEMORY[0x270EECF78]();
}

uint64_t sub_243DFA5F0()
{
  return MEMORY[0x270EECF80]();
}

uint64_t sub_243DFA600()
{
  return MEMORY[0x270EECF88]();
}

uint64_t sub_243DFA610()
{
  return MEMORY[0x270EECF90]();
}

uint64_t sub_243DFA620()
{
  return MEMORY[0x270EECF98]();
}

uint64_t sub_243DFA630()
{
  return MEMORY[0x270EECFA0]();
}

uint64_t sub_243DFA640()
{
  return MEMORY[0x270EECFA8]();
}

uint64_t sub_243DFA650()
{
  return MEMORY[0x270EECFB0]();
}

uint64_t sub_243DFA660()
{
  return MEMORY[0x270EECFB8]();
}

uint64_t sub_243DFA670()
{
  return MEMORY[0x270EECFC0]();
}

uint64_t sub_243DFA680()
{
  return MEMORY[0x270EECFC8]();
}

uint64_t sub_243DFA690()
{
  return MEMORY[0x270EECFD0]();
}

uint64_t sub_243DFA6A0()
{
  return MEMORY[0x270EECFD8]();
}

uint64_t sub_243DFA6B0()
{
  return MEMORY[0x270EECFE0]();
}

uint64_t sub_243DFA6C0()
{
  return MEMORY[0x270EECFE8]();
}

uint64_t sub_243DFA6D0()
{
  return MEMORY[0x270EECFF0]();
}

uint64_t sub_243DFA6E0()
{
  return MEMORY[0x270EECFF8]();
}

uint64_t sub_243DFA6F0()
{
  return MEMORY[0x270EED000]();
}

uint64_t sub_243DFA700()
{
  return MEMORY[0x270EED008]();
}

uint64_t sub_243DFA710()
{
  return MEMORY[0x270EED010]();
}

uint64_t sub_243DFA720()
{
  return MEMORY[0x270EED018]();
}

uint64_t sub_243DFA730()
{
  return MEMORY[0x270EED020]();
}

uint64_t sub_243DFA740()
{
  return MEMORY[0x270EED028]();
}

uint64_t sub_243DFA750()
{
  return MEMORY[0x270EED030]();
}

uint64_t sub_243DFA760()
{
  return MEMORY[0x270EED038]();
}

uint64_t sub_243DFA770()
{
  return MEMORY[0x270EED040]();
}

uint64_t sub_243DFA780()
{
  return MEMORY[0x270EED048]();
}

uint64_t sub_243DFA790()
{
  return MEMORY[0x270EED050]();
}

uint64_t sub_243DFA7A0()
{
  return MEMORY[0x270EED058]();
}

uint64_t sub_243DFA7B0()
{
  return MEMORY[0x270EED060]();
}

uint64_t sub_243DFA7C0()
{
  return MEMORY[0x270EED068]();
}

uint64_t sub_243DFA7D0()
{
  return MEMORY[0x270EED070]();
}

uint64_t sub_243DFA7E0()
{
  return MEMORY[0x270EED078]();
}

uint64_t sub_243DFA7F0()
{
  return MEMORY[0x270EED080]();
}

uint64_t sub_243DFA800()
{
  return MEMORY[0x270EED088]();
}

uint64_t sub_243DFA810()
{
  return MEMORY[0x270EED090]();
}

uint64_t sub_243DFA820()
{
  return MEMORY[0x270EED098]();
}

uint64_t sub_243DFA830()
{
  return MEMORY[0x270EED0A0]();
}

uint64_t sub_243DFA840()
{
  return MEMORY[0x270EED0A8]();
}

uint64_t sub_243DFA850()
{
  return MEMORY[0x270EED0B0]();
}

uint64_t sub_243DFA860()
{
  return MEMORY[0x270EED0B8]();
}

uint64_t sub_243DFA870()
{
  return MEMORY[0x270EED0C0]();
}

uint64_t sub_243DFA880()
{
  return MEMORY[0x270EED0C8]();
}

uint64_t sub_243DFA890()
{
  return MEMORY[0x270EED0D0]();
}

uint64_t sub_243DFA8A0()
{
  return MEMORY[0x270EED0D8]();
}

uint64_t sub_243DFA8B0()
{
  return MEMORY[0x270EED0E0]();
}

uint64_t sub_243DFA8C0()
{
  return MEMORY[0x270EED0E8]();
}

uint64_t sub_243DFA8D0()
{
  return MEMORY[0x270EED0F0]();
}

uint64_t sub_243DFA8E0()
{
  return MEMORY[0x270EED0F8]();
}

uint64_t sub_243DFA8F0()
{
  return MEMORY[0x270EED100]();
}

uint64_t sub_243DFA900()
{
  return MEMORY[0x270EED108]();
}

uint64_t sub_243DFA910()
{
  return MEMORY[0x270EED110]();
}

uint64_t sub_243DFA920()
{
  return MEMORY[0x270EED118]();
}

uint64_t sub_243DFA930()
{
  return MEMORY[0x270EED120]();
}

uint64_t sub_243DFA940()
{
  return MEMORY[0x270EED128]();
}

uint64_t sub_243DFA950()
{
  return MEMORY[0x270EED130]();
}

uint64_t sub_243DFA960()
{
  return MEMORY[0x270EED138]();
}

uint64_t sub_243DFA970()
{
  return MEMORY[0x270EED140]();
}

uint64_t sub_243DFA980()
{
  return MEMORY[0x270EED148]();
}

uint64_t sub_243DFA990()
{
  return MEMORY[0x270EED150]();
}

uint64_t sub_243DFA9A0()
{
  return MEMORY[0x270EED158]();
}

uint64_t sub_243DFA9B0()
{
  return MEMORY[0x270EED180]();
}

uint64_t sub_243DFA9C0()
{
  return MEMORY[0x270EED188]();
}

uint64_t sub_243DFA9D0()
{
  return MEMORY[0x270EED190]();
}

uint64_t sub_243DFA9E0()
{
  return MEMORY[0x270EED198]();
}

uint64_t sub_243DFA9F0()
{
  return MEMORY[0x270EED1A0]();
}

uint64_t sub_243DFAA00()
{
  return MEMORY[0x270EED1A8]();
}

uint64_t sub_243DFAA10()
{
  return MEMORY[0x270EED1B0]();
}

uint64_t sub_243DFAA20()
{
  return MEMORY[0x270EED1B8]();
}

uint64_t sub_243DFAA30()
{
  return MEMORY[0x270EED1C0]();
}

uint64_t sub_243DFAA40()
{
  return MEMORY[0x270EED1C8]();
}

uint64_t sub_243DFAA50()
{
  return MEMORY[0x270EED1D0]();
}

uint64_t sub_243DFAA60()
{
  return MEMORY[0x270EED1D8]();
}

uint64_t sub_243DFAA70()
{
  return MEMORY[0x270EED1E0]();
}

uint64_t sub_243DFAA80()
{
  return MEMORY[0x270EED1E8]();
}

uint64_t sub_243DFAA90()
{
  return MEMORY[0x270EED1F0]();
}

uint64_t sub_243DFAAA0()
{
  return MEMORY[0x270EED1F8]();
}

uint64_t sub_243DFAAB0()
{
  return MEMORY[0x270EED200]();
}

uint64_t sub_243DFAAC0()
{
  return MEMORY[0x270EED208]();
}

uint64_t sub_243DFAAD0()
{
  return MEMORY[0x270EED210]();
}

uint64_t sub_243DFAAE0()
{
  return MEMORY[0x270EED218]();
}

uint64_t sub_243DFAAF0()
{
  return MEMORY[0x270EED220]();
}

uint64_t sub_243DFAB00()
{
  return MEMORY[0x270EED228]();
}

uint64_t sub_243DFAB10()
{
  return MEMORY[0x270EED230]();
}

uint64_t sub_243DFAB20()
{
  return MEMORY[0x270EED238]();
}

uint64_t sub_243DFAB30()
{
  return MEMORY[0x270EED240]();
}

uint64_t sub_243DFAB40()
{
  return MEMORY[0x270EED248]();
}

uint64_t sub_243DFAB50()
{
  return MEMORY[0x270EED250]();
}

uint64_t sub_243DFAB60()
{
  return MEMORY[0x270EED258]();
}

uint64_t sub_243DFAB70()
{
  return MEMORY[0x270EED260]();
}

uint64_t sub_243DFAB80()
{
  return MEMORY[0x270EED268]();
}

uint64_t sub_243DFAB90()
{
  return MEMORY[0x270EED270]();
}

uint64_t sub_243DFABA0()
{
  return MEMORY[0x270EED278]();
}

uint64_t sub_243DFABB0()
{
  return MEMORY[0x270EED280]();
}

uint64_t sub_243DFABC0()
{
  return MEMORY[0x270EED288]();
}

uint64_t sub_243DFABD0()
{
  return MEMORY[0x270EED290]();
}

uint64_t sub_243DFABE0()
{
  return MEMORY[0x270EED298]();
}

uint64_t sub_243DFABF0()
{
  return MEMORY[0x270EED2A0]();
}

uint64_t sub_243DFAC00()
{
  return MEMORY[0x270EED2A8]();
}

uint64_t sub_243DFAC10()
{
  return MEMORY[0x270EED2B0]();
}

uint64_t sub_243DFAC20()
{
  return MEMORY[0x270EED2B8]();
}

uint64_t sub_243DFAC30()
{
  return MEMORY[0x270EED2C0]();
}

uint64_t sub_243DFAC40()
{
  return MEMORY[0x270EED2C8]();
}

uint64_t sub_243DFAC50()
{
  return MEMORY[0x270EED2D0]();
}

uint64_t sub_243DFAC60()
{
  return MEMORY[0x270EED2D8]();
}

uint64_t sub_243DFAC70()
{
  return MEMORY[0x270EED2E0]();
}

uint64_t sub_243DFAC80()
{
  return MEMORY[0x270EED2E8]();
}

uint64_t sub_243DFAC90()
{
  return MEMORY[0x270EED2F0]();
}

uint64_t sub_243DFACA0()
{
  return MEMORY[0x270EED2F8]();
}

uint64_t sub_243DFACB0()
{
  return MEMORY[0x270EED300]();
}

uint64_t sub_243DFACC0()
{
  return MEMORY[0x270EED308]();
}

uint64_t sub_243DFACD0()
{
  return MEMORY[0x270EED310]();
}

uint64_t sub_243DFACE0()
{
  return MEMORY[0x270EED318]();
}

uint64_t sub_243DFACF0()
{
  return MEMORY[0x270EED320]();
}

uint64_t sub_243DFAD00()
{
  return MEMORY[0x270EED328]();
}

uint64_t sub_243DFAD10()
{
  return MEMORY[0x270EED330]();
}

uint64_t sub_243DFAD20()
{
  return MEMORY[0x270EED338]();
}

uint64_t sub_243DFAD30()
{
  return MEMORY[0x270EED340]();
}

uint64_t sub_243DFAD40()
{
  return MEMORY[0x270EED348]();
}

uint64_t sub_243DFAD50()
{
  return MEMORY[0x270EED350]();
}

uint64_t sub_243DFAD60()
{
  return MEMORY[0x270EED358]();
}

uint64_t sub_243DFAD70()
{
  return MEMORY[0x270EED360]();
}

uint64_t sub_243DFAD80()
{
  return MEMORY[0x270EED368]();
}

uint64_t sub_243DFADA0()
{
  return MEMORY[0x270EED378]();
}

uint64_t sub_243DFADB0()
{
  return MEMORY[0x270EED380]();
}

uint64_t sub_243DFADC0()
{
  return MEMORY[0x270EED388]();
}

uint64_t sub_243DFADD0()
{
  return MEMORY[0x270EED390]();
}

uint64_t sub_243DFADE0()
{
  return MEMORY[0x270EED398]();
}

uint64_t sub_243DFADF0()
{
  return MEMORY[0x270EED3A0]();
}

uint64_t sub_243DFAE00()
{
  return MEMORY[0x270EED3A8]();
}

uint64_t sub_243DFAE10()
{
  return MEMORY[0x270EED3B0]();
}

uint64_t sub_243DFAE20()
{
  return MEMORY[0x270EED3B8]();
}

uint64_t sub_243DFAE30()
{
  return MEMORY[0x270EED3C0]();
}

uint64_t sub_243DFAE40()
{
  return MEMORY[0x270EED3C8]();
}

uint64_t sub_243DFAE50()
{
  return MEMORY[0x270EED3D0]();
}

uint64_t sub_243DFAE60()
{
  return MEMORY[0x270EED3D8]();
}

uint64_t sub_243DFAE70()
{
  return MEMORY[0x270EED3E0]();
}

uint64_t sub_243DFAE80()
{
  return MEMORY[0x270EED3E8]();
}

uint64_t sub_243DFAE90()
{
  return MEMORY[0x270EED3F0]();
}

uint64_t sub_243DFAEA0()
{
  return MEMORY[0x270EED410]();
}

uint64_t sub_243DFAEB0()
{
  return MEMORY[0x270EED418]();
}

uint64_t sub_243DFAEC0()
{
  return MEMORY[0x270EED420]();
}

uint64_t sub_243DFAED0()
{
  return MEMORY[0x270EED428]();
}

uint64_t sub_243DFAEE0()
{
  return MEMORY[0x270EED430]();
}

uint64_t sub_243DFAEF0()
{
  return MEMORY[0x270EED438]();
}

uint64_t sub_243DFAF00()
{
  return MEMORY[0x270EED440]();
}

uint64_t sub_243DFAF10()
{
  return MEMORY[0x270EED448]();
}

uint64_t sub_243DFAF20()
{
  return MEMORY[0x270EED450]();
}

uint64_t sub_243DFAF30()
{
  return MEMORY[0x270EED458]();
}

uint64_t sub_243DFAF40()
{
  return MEMORY[0x270EED460]();
}

uint64_t sub_243DFAF50()
{
  return MEMORY[0x270EED468]();
}

uint64_t sub_243DFAF60()
{
  return MEMORY[0x270EED470]();
}

uint64_t sub_243DFAF80()
{
  return MEMORY[0x270EED480]();
}

uint64_t sub_243DFAF90()
{
  return MEMORY[0x270EED488]();
}

uint64_t sub_243DFAFA0()
{
  return MEMORY[0x270EED490]();
}

uint64_t sub_243DFAFB0()
{
  return MEMORY[0x270EED498]();
}

uint64_t sub_243DFAFC0()
{
  return MEMORY[0x270EED4A0]();
}

uint64_t sub_243DFAFD0()
{
  return MEMORY[0x270EED4A8]();
}

uint64_t sub_243DFAFE0()
{
  return MEMORY[0x270EED4B0]();
}

uint64_t sub_243DFAFF0()
{
  return MEMORY[0x270EED4B8]();
}

uint64_t sub_243DFB000()
{
  return MEMORY[0x270EED4C0]();
}

uint64_t sub_243DFB010()
{
  return MEMORY[0x270EED4C8]();
}

uint64_t sub_243DFB020()
{
  return MEMORY[0x270EED4D0]();
}

uint64_t sub_243DFB030()
{
  return MEMORY[0x270EED4D8]();
}

uint64_t sub_243DFB040()
{
  return MEMORY[0x270EED4E0]();
}

uint64_t sub_243DFB080()
{
  return MEMORY[0x270EED500]();
}

uint64_t sub_243DFB090()
{
  return MEMORY[0x270EED508]();
}

uint64_t sub_243DFB0A0()
{
  return MEMORY[0x270EED510]();
}

uint64_t sub_243DFB0B0()
{
  return MEMORY[0x270EED518]();
}

uint64_t sub_243DFB0C0()
{
  return MEMORY[0x270EED520]();
}

uint64_t sub_243DFB0D0()
{
  return MEMORY[0x270EED528]();
}

uint64_t sub_243DFB0E0()
{
  return MEMORY[0x270EED530]();
}

uint64_t sub_243DFB0F0()
{
  return MEMORY[0x270EED538]();
}

uint64_t sub_243DFB100()
{
  return MEMORY[0x270EED540]();
}

uint64_t sub_243DFB110()
{
  return MEMORY[0x270EED548]();
}

uint64_t sub_243DFB120()
{
  return MEMORY[0x270EED550]();
}

uint64_t sub_243DFB130()
{
  return MEMORY[0x270EED558]();
}

uint64_t sub_243DFB140()
{
  return MEMORY[0x270EED560]();
}

uint64_t sub_243DFB150()
{
  return MEMORY[0x270EED568]();
}

uint64_t sub_243DFB160()
{
  return MEMORY[0x270EED570]();
}

uint64_t sub_243DFB170()
{
  return MEMORY[0x270EED578]();
}

uint64_t sub_243DFB180()
{
  return MEMORY[0x270EED580]();
}

uint64_t sub_243DFB190()
{
  return MEMORY[0x270EED588]();
}

uint64_t sub_243DFB1A0()
{
  return MEMORY[0x270EED590]();
}

uint64_t sub_243DFB1B0()
{
  return MEMORY[0x270EED598]();
}

uint64_t sub_243DFB1C0()
{
  return MEMORY[0x270EED5A0]();
}

uint64_t sub_243DFB1D0()
{
  return MEMORY[0x270EED5A8]();
}

uint64_t sub_243DFB1E0()
{
  return MEMORY[0x270EED5B0]();
}

uint64_t sub_243DFB1F0()
{
  return MEMORY[0x270EED5B8]();
}

uint64_t sub_243DFB200()
{
  return MEMORY[0x270EED5C0]();
}

uint64_t sub_243DFB210()
{
  return MEMORY[0x270EED5C8]();
}

uint64_t sub_243DFB220()
{
  return MEMORY[0x270EED5D0]();
}

uint64_t sub_243DFB230()
{
  return MEMORY[0x270EED5D8]();
}

uint64_t sub_243DFB240()
{
  return MEMORY[0x270EED5E0]();
}

uint64_t sub_243DFB250()
{
  return MEMORY[0x270EED5E8]();
}

uint64_t sub_243DFB260()
{
  return MEMORY[0x270EED5F0]();
}

uint64_t sub_243DFB270()
{
  return MEMORY[0x270EED5F8]();
}

uint64_t sub_243DFB280()
{
  return MEMORY[0x270EED600]();
}

uint64_t sub_243DFB290()
{
  return MEMORY[0x270EED608]();
}

uint64_t sub_243DFB2A0()
{
  return MEMORY[0x270EED610]();
}

uint64_t sub_243DFB2B0()
{
  return MEMORY[0x270EED618]();
}

uint64_t sub_243DFB2C0()
{
  return MEMORY[0x270EED620]();
}

uint64_t sub_243DFB2D0()
{
  return MEMORY[0x270EED628]();
}

uint64_t sub_243DFB2E0()
{
  return MEMORY[0x270EED630]();
}

uint64_t sub_243DFB2F0()
{
  return MEMORY[0x270EED638]();
}

uint64_t sub_243DFB300()
{
  return MEMORY[0x270EED640]();
}

uint64_t sub_243DFB310()
{
  return MEMORY[0x270EED648]();
}

uint64_t sub_243DFB320()
{
  return MEMORY[0x270EED650]();
}

uint64_t sub_243DFB330()
{
  return MEMORY[0x270EED658]();
}

uint64_t sub_243DFB340()
{
  return MEMORY[0x270EED660]();
}

uint64_t sub_243DFB350()
{
  return MEMORY[0x270EED668]();
}

uint64_t sub_243DFB360()
{
  return MEMORY[0x270EED670]();
}

uint64_t sub_243DFB370()
{
  return MEMORY[0x270EED678]();
}

uint64_t sub_243DFB380()
{
  return MEMORY[0x270EED680]();
}

uint64_t sub_243DFB390()
{
  return MEMORY[0x270EED688]();
}

uint64_t sub_243DFB3A0()
{
  return MEMORY[0x270EED690]();
}

uint64_t sub_243DFB3B0()
{
  return MEMORY[0x270EED698]();
}

uint64_t sub_243DFB3C0()
{
  return MEMORY[0x270EED6A0]();
}

uint64_t sub_243DFB3D0()
{
  return MEMORY[0x270EED6A8]();
}

uint64_t sub_243DFB3E0()
{
  return MEMORY[0x270EED6B0]();
}

uint64_t sub_243DFB3F0()
{
  return MEMORY[0x270EED6B8]();
}

uint64_t sub_243DFB400()
{
  return MEMORY[0x270EED6C0]();
}

uint64_t sub_243DFB410()
{
  return MEMORY[0x270EED6C8]();
}

uint64_t sub_243DFB420()
{
  return MEMORY[0x270EED6D0]();
}

uint64_t sub_243DFB430()
{
  return MEMORY[0x270EED6D8]();
}

uint64_t sub_243DFB440()
{
  return MEMORY[0x270EED6E0]();
}

uint64_t sub_243DFB450()
{
  return MEMORY[0x270EED6E8]();
}

uint64_t sub_243DFB460()
{
  return MEMORY[0x270EED6F0]();
}

uint64_t sub_243DFB470()
{
  return MEMORY[0x270EED6F8]();
}

uint64_t sub_243DFB480()
{
  return MEMORY[0x270EED700]();
}

uint64_t sub_243DFB490()
{
  return MEMORY[0x270EED708]();
}

uint64_t sub_243DFB4A0()
{
  return MEMORY[0x270EED710]();
}

uint64_t sub_243DFB4B0()
{
  return MEMORY[0x270EED718]();
}

uint64_t sub_243DFB4C0()
{
  return MEMORY[0x270EED720]();
}

uint64_t sub_243DFB4D0()
{
  return MEMORY[0x270EED728]();
}

uint64_t sub_243DFB4E0()
{
  return MEMORY[0x270EED730]();
}

uint64_t sub_243DFB4F0()
{
  return MEMORY[0x270EED738]();
}

uint64_t sub_243DFB500()
{
  return MEMORY[0x270EED740]();
}

uint64_t sub_243DFB510()
{
  return MEMORY[0x270EED748]();
}

uint64_t sub_243DFB520()
{
  return MEMORY[0x270EED750]();
}

uint64_t sub_243DFB530()
{
  return MEMORY[0x270EED758]();
}

uint64_t sub_243DFB540()
{
  return MEMORY[0x270EED760]();
}

uint64_t sub_243DFB550()
{
  return MEMORY[0x270EED768]();
}

uint64_t sub_243DFB560()
{
  return MEMORY[0x270EED770]();
}

uint64_t sub_243DFB570()
{
  return MEMORY[0x270EED778]();
}

uint64_t sub_243DFB580()
{
  return MEMORY[0x270EED780]();
}

uint64_t sub_243DFB590()
{
  return MEMORY[0x270EED788]();
}

uint64_t sub_243DFB5A0()
{
  return MEMORY[0x270EED790]();
}

uint64_t sub_243DFB5B0()
{
  return MEMORY[0x270EED798]();
}

uint64_t sub_243DFB5C0()
{
  return MEMORY[0x270EED7A0]();
}

uint64_t sub_243DFB5D0()
{
  return MEMORY[0x270EED7A8]();
}

uint64_t sub_243DFB5E0()
{
  return MEMORY[0x270EED7B0]();
}

uint64_t sub_243DFB5F0()
{
  return MEMORY[0x270EED7B8]();
}

uint64_t sub_243DFB600()
{
  return MEMORY[0x270EED7C0]();
}

uint64_t sub_243DFB610()
{
  return MEMORY[0x270EED7C8]();
}

uint64_t sub_243DFB620()
{
  return MEMORY[0x270EED7D0]();
}

uint64_t sub_243DFB630()
{
  return MEMORY[0x270EED7D8]();
}

uint64_t sub_243DFB640()
{
  return MEMORY[0x270EED7E0]();
}

uint64_t sub_243DFB650()
{
  return MEMORY[0x270EED7E8]();
}

uint64_t sub_243DFB660()
{
  return MEMORY[0x270EED7F0]();
}

uint64_t sub_243DFB670()
{
  return MEMORY[0x270EED7F8]();
}

uint64_t sub_243DFB680()
{
  return MEMORY[0x270EED800]();
}

uint64_t sub_243DFB690()
{
  return MEMORY[0x270EED808]();
}

uint64_t sub_243DFB6A0()
{
  return MEMORY[0x270EED810]();
}

uint64_t sub_243DFB6B0()
{
  return MEMORY[0x270EED818]();
}

uint64_t sub_243DFB6C0()
{
  return MEMORY[0x270EED820]();
}

uint64_t sub_243DFB6D0()
{
  return MEMORY[0x270EED828]();
}

uint64_t sub_243DFB6E0()
{
  return MEMORY[0x270EED830]();
}

uint64_t sub_243DFB6F0()
{
  return MEMORY[0x270EED838]();
}

uint64_t sub_243DFB700()
{
  return MEMORY[0x270EED840]();
}

uint64_t sub_243DFB710()
{
  return MEMORY[0x270EED848]();
}

uint64_t sub_243DFB720()
{
  return MEMORY[0x270EED850]();
}

uint64_t sub_243DFB730()
{
  return MEMORY[0x270EED858]();
}

uint64_t sub_243DFB740()
{
  return MEMORY[0x270EED860]();
}

uint64_t sub_243DFB750()
{
  return MEMORY[0x270EED868]();
}

uint64_t sub_243DFB760()
{
  return MEMORY[0x270EED870]();
}

uint64_t sub_243DFB770()
{
  return MEMORY[0x270EED878]();
}

uint64_t sub_243DFB780()
{
  return MEMORY[0x270EED880]();
}

uint64_t sub_243DFB790()
{
  return MEMORY[0x270EED888]();
}

uint64_t sub_243DFB7A0()
{
  return MEMORY[0x270EED890]();
}

uint64_t sub_243DFB7B0()
{
  return MEMORY[0x270EED898]();
}

uint64_t sub_243DFB7C0()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_243DFB7D0()
{
  return MEMORY[0x270EEDC48]();
}

uint64_t sub_243DFB7E0()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_243DFB7F0()
{
  return MEMORY[0x270EEDC68]();
}

uint64_t sub_243DFB800()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_243DFB810()
{
  return MEMORY[0x270EEDCF0]();
}

uint64_t sub_243DFB820()
{
  return MEMORY[0x270EEDD10]();
}

uint64_t sub_243DFB830()
{
  return MEMORY[0x270EEDD40]();
}

uint64_t sub_243DFB840()
{
  return MEMORY[0x270EEE0D0]();
}

uint64_t sub_243DFB850()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_243DFB860()
{
  return MEMORY[0x270EEE208]();
}

uint64_t sub_243DFB870()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_243DFB880()
{
  return MEMORY[0x270EED8A0]();
}

uint64_t sub_243DFB890()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_243DFB8A0()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_243DFB8B0()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_243DFB8C0()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_243DFB8D0()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_243DFB8E0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_243DFB8F0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_243DFB900()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_243DFB910()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_243DFB920()
{
  return MEMORY[0x270EEE748]();
}

uint64_t sub_243DFB930()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_243DFB940()
{
  return MEMORY[0x270EEE7B0]();
}

uint64_t sub_243DFB950()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_243DFB960()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_243DFB970()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_243DFB980()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_243DFB990()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_243DFB9A0()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_243DFB9B0()
{
  return MEMORY[0x270EEE9C0]();
}

uint64_t sub_243DFB9C0()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_243DFB9D0()
{
  return MEMORY[0x270FA1638]();
}

uint64_t sub_243DFB9E0()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_243DFB9F0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_243DFBA00()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_243DFBA10()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_243DFBA20()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_243DFBA30()
{
  return MEMORY[0x270EEF888]();
}

uint64_t sub_243DFBA40()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_243DFBA50()
{
  return MEMORY[0x270EEF8D8]();
}

uint64_t sub_243DFBA60()
{
  return MEMORY[0x270EEFB38]();
}

uint64_t sub_243DFBA70()
{
  return MEMORY[0x270EEFB40]();
}

uint64_t sub_243DFBA80()
{
  return MEMORY[0x270EEFB48]();
}

uint64_t sub_243DFBA90()
{
  return MEMORY[0x270EEFB50]();
}

uint64_t sub_243DFBAA0()
{
  return MEMORY[0x270EEFB58]();
}

uint64_t sub_243DFBAB0()
{
  return MEMORY[0x270EEFB78]();
}

uint64_t sub_243DFBAC0()
{
  return MEMORY[0x270EEFB88]();
}

uint64_t sub_243DFBAD0()
{
  return MEMORY[0x270EEFBD8]();
}

uint64_t sub_243DFBAE0()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_243DFBAF0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_243DFBB00()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_243DFBB10()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_243DFBB20()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_243DFBB30()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_243DFBB40()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_243DFBB50()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_243DFBB60()
{
  return MEMORY[0x270EEFE18]();
}

uint64_t sub_243DFBB70()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_243DFBB80()
{
  return MEMORY[0x270EEFE38]();
}

uint64_t sub_243DFBB90()
{
  return MEMORY[0x270EEFE50]();
}

uint64_t sub_243DFBBA0()
{
  return MEMORY[0x270EEFE60]();
}

uint64_t sub_243DFBBB0()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_243DFBBC0()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_243DFBBD0()
{
  return MEMORY[0x270EEFEE0]();
}

uint64_t sub_243DFBBE0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_243DFBBF0()
{
  return MEMORY[0x270EEFF30]();
}

uint64_t sub_243DFBC00()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_243DFBC10()
{
  return MEMORY[0x270EED8A8]();
}

uint64_t sub_243DFBC20()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_243DFBC30()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_243DFBC40()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_243DFBC50()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_243DFBC60()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_243DFBC70()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_243DFBC80()
{
  return MEMORY[0x270EED8B0]();
}

uint64_t sub_243DFBC90()
{
  return MEMORY[0x270EED8B8]();
}

uint64_t sub_243DFBCA0()
{
  return MEMORY[0x270EED8C0]();
}

uint64_t sub_243DFBCB0()
{
  return MEMORY[0x270EF02E8]();
}

uint64_t sub_243DFBCC0()
{
  return MEMORY[0x270EF0320]();
}

uint64_t sub_243DFBCD0()
{
  return MEMORY[0x270EF0340]();
}

uint64_t sub_243DFBCE0()
{
  return MEMORY[0x270EF0348]();
}

uint64_t sub_243DFBCF0()
{
  return MEMORY[0x270EF0360]();
}

uint64_t sub_243DFBD00()
{
  return MEMORY[0x270EF0428]();
}

uint64_t sub_243DFBD10()
{
  return MEMORY[0x270EF0440]();
}

uint64_t sub_243DFBD20()
{
  return MEMORY[0x270EF0448]();
}

uint64_t sub_243DFBD30()
{
  return MEMORY[0x270EF0548]();
}

uint64_t sub_243DFBD40()
{
  return MEMORY[0x270EF0568]();
}

uint64_t sub_243DFBD50()
{
  return MEMORY[0x270EF0580]();
}

uint64_t sub_243DFBD60()
{
  return MEMORY[0x270EF0598]();
}

uint64_t sub_243DFBD70()
{
  return MEMORY[0x270EF0670]();
}

uint64_t sub_243DFBD80()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_243DFBD90()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_243DFBDA0()
{
  return MEMORY[0x270EF0850]();
}

uint64_t sub_243DFBDB0()
{
  return MEMORY[0x270EF0860]();
}

uint64_t sub_243DFBDC0()
{
  return MEMORY[0x270EF0868]();
}

uint64_t sub_243DFBDD0()
{
  return MEMORY[0x270EF0890]();
}

uint64_t sub_243DFBDE0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_243DFBDF0()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_243DFBE00()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_243DFBE20()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_243DFBE30()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_243DFBE40()
{
  return MEMORY[0x270EF0C00]();
}

uint64_t sub_243DFBE50()
{
  return MEMORY[0x270EF0C10]();
}

uint64_t sub_243DFBE60()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_243DFBE70()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_243DFBE80()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_243DFBE90()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_243DFBEA0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_243DFBEB0()
{
  return MEMORY[0x270EF0C98]();
}

uint64_t sub_243DFBEC0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_243DFBED0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_243DFBEE0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_243DFBEF0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_243DFBF00()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_243DFBF10()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_243DFBF20()
{
  return MEMORY[0x270EF0FB0]();
}

uint64_t sub_243DFBF30()
{
  return MEMORY[0x270EF0FB8]();
}

uint64_t sub_243DFBF40()
{
  return MEMORY[0x270EF0FC8]();
}

uint64_t sub_243DFBF50()
{
  return MEMORY[0x270EF1078]();
}

uint64_t sub_243DFBF60()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_243DFBF70()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_243DFBF80()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_243DFBF90()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_243DFBFA0()
{
  return MEMORY[0x270EF1140]();
}

uint64_t sub_243DFBFB0()
{
  return MEMORY[0x270EF1150]();
}

uint64_t sub_243DFBFC0()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_243DFBFD0()
{
  return MEMORY[0x270EF12A0]();
}

uint64_t sub_243DFBFE0()
{
  return MEMORY[0x270EF12A8]();
}

uint64_t sub_243DFBFF0()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_243DFC000()
{
  return MEMORY[0x270EF1330]();
}

uint64_t sub_243DFC010()
{
  return MEMORY[0x270EF1378]();
}

uint64_t sub_243DFC020()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_243DFC030()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_243DFC040()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_243DFC050()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_243DFC060()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_243DFC070()
{
  return MEMORY[0x270EF15D0]();
}

uint64_t sub_243DFC080()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_243DFC090()
{
  return MEMORY[0x270EF1700]();
}

uint64_t sub_243DFC0A0()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_243DFC0B0()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_243DFC0C0()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_243DFC0D0()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_243DFC0E0()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_243DFC0F0()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_243DFC100()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_243DFC120()
{
  return MEMORY[0x270EEB968]();
}

uint64_t sub_243DFC130()
{
  return MEMORY[0x270EEB978]();
}

uint64_t sub_243DFC140()
{
  return MEMORY[0x270FA12D8]();
}

uint64_t sub_243DFC150()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_243DFC160()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_243DFC170()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_243DFC180()
{
  return MEMORY[0x270EE9F40]();
}

uint64_t sub_243DFC190()
{
  return MEMORY[0x270FA1348]();
}

uint64_t sub_243DFC1A0()
{
  return MEMORY[0x270EEB878]();
}

uint64_t sub_243DFC1B0()
{
  return MEMORY[0x270EEB8A0]();
}

uint64_t sub_243DFC1C0()
{
  return MEMORY[0x270EEB8E8]();
}

uint64_t sub_243DFC1D0()
{
  return MEMORY[0x270FA16A0]();
}

uint64_t sub_243DFC1E0()
{
  return MEMORY[0x270FA1768]();
}

uint64_t sub_243DFC1F0()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_243DFC200()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_243DFC210()
{
  return MEMORY[0x270EED8C8]();
}

uint64_t sub_243DFC220()
{
  return MEMORY[0x270EED8D0]();
}

uint64_t sub_243DFC230()
{
  return MEMORY[0x270EED8D8]();
}

uint64_t sub_243DFC240()
{
  return MEMORY[0x270EED8E0]();
}

uint64_t sub_243DFC250()
{
  return MEMORY[0x270EED8E8]();
}

uint64_t sub_243DFC260()
{
  return MEMORY[0x270EED8F0]();
}

uint64_t sub_243DFC270()
{
  return MEMORY[0x270EED8F8]();
}

uint64_t sub_243DFC280()
{
  return MEMORY[0x270EED900]();
}

uint64_t sub_243DFC290()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_243DFC2A0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_243DFC2B0()
{
  return MEMORY[0x270FA2E18]();
}

uint64_t sub_243DFC2C0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_243DFC2D0()
{
  return MEMORY[0x270EE3928]();
}

uint64_t sub_243DFC2E0()
{
  return MEMORY[0x270EE3B98]();
}

uint64_t sub_243DFC2F0()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_243DFC300()
{
  return MEMORY[0x270EE3BD0]();
}

uint64_t sub_243DFC310()
{
  return MEMORY[0x270EE3BF0]();
}

uint64_t sub_243DFC320()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_243DFC330()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_243DFC340()
{
  return MEMORY[0x270EE3CF0]();
}

uint64_t sub_243DFC350()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_243DFC360()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_243DFC370()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_243DFC380()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_243DFC390()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_243DFC3A0()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_243DFC3B0()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_243DFC3C0()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_243DFC3D0()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t sub_243DFC3E0()
{
  return MEMORY[0x270EE3E20]();
}

uint64_t sub_243DFC3F0()
{
  return MEMORY[0x270EE3E90]();
}

uint64_t sub_243DFC400()
{
  return MEMORY[0x270EE3F10]();
}

uint64_t sub_243DFC410()
{
  return MEMORY[0x270EE3F90]();
}

uint64_t sub_243DFC420()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_243DFC430()
{
  return MEMORY[0x270EFEC00]();
}

uint64_t sub_243DFC440()
{
  return MEMORY[0x270EFEC20]();
}

uint64_t sub_243DFC450()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_243DFC460()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_243DFC470()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_243DFC480()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_243DFC490()
{
  return MEMORY[0x270EFED90]();
}

uint64_t sub_243DFC4A0()
{
  return MEMORY[0x270EFEDA0]();
}

uint64_t sub_243DFC4B0()
{
  return MEMORY[0x270EFEDC8]();
}

uint64_t sub_243DFC4C0()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_243DFC4D0()
{
  return MEMORY[0x270EFEE70]();
}

uint64_t sub_243DFC4E0()
{
  return MEMORY[0x270EFEE78]();
}

uint64_t sub_243DFC4F0()
{
  return MEMORY[0x270EFEED0]();
}

uint64_t sub_243DFC500()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_243DFC510()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_243DFC520()
{
  return MEMORY[0x270EFEF50]();
}

uint64_t sub_243DFC530()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_243DFC540()
{
  return MEMORY[0x270EFF008]();
}

uint64_t sub_243DFC550()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_243DFC560()
{
  return MEMORY[0x270EFF118]();
}

uint64_t sub_243DFC570()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_243DFC580()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_243DFC590()
{
  return MEMORY[0x270EFF1D8]();
}

uint64_t sub_243DFC5A0()
{
  return MEMORY[0x270EFF2C8]();
}

uint64_t sub_243DFC5B0()
{
  return MEMORY[0x270EFF2D0]();
}

uint64_t sub_243DFC5C0()
{
  return MEMORY[0x270EFF2D8]();
}

uint64_t sub_243DFC5D0()
{
  return MEMORY[0x270EFF2E0]();
}

uint64_t sub_243DFC5E0()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_243DFC5F0()
{
  return MEMORY[0x270EFF3E0]();
}

uint64_t sub_243DFC600()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_243DFC610()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_243DFC620()
{
  return MEMORY[0x270EFF468]();
}

uint64_t sub_243DFC630()
{
  return MEMORY[0x270EFF4E0]();
}

uint64_t sub_243DFC640()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_243DFC650()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_243DFC660()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_243DFC670()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_243DFC680()
{
  return MEMORY[0x270EFF648]();
}

uint64_t sub_243DFC690()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_243DFC6A0()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_243DFC6B0()
{
  return MEMORY[0x270EFF6A0]();
}

uint64_t sub_243DFC6C0()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_243DFC6D0()
{
  return MEMORY[0x270EFF6E8]();
}

uint64_t sub_243DFC6E0()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_243DFC6F0()
{
  return MEMORY[0x270EFF708]();
}

uint64_t sub_243DFC700()
{
  return MEMORY[0x270EFF718]();
}

uint64_t sub_243DFC710()
{
  return MEMORY[0x270EFF728]();
}

uint64_t sub_243DFC720()
{
  return MEMORY[0x270EFF748]();
}

uint64_t sub_243DFC730()
{
  return MEMORY[0x270EFF800]();
}

uint64_t sub_243DFC750()
{
  return MEMORY[0x270EFF838]();
}

uint64_t sub_243DFC760()
{
  return MEMORY[0x270EFF850]();
}

uint64_t sub_243DFC770()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_243DFC780()
{
  return MEMORY[0x270EFF930]();
}

uint64_t sub_243DFC790()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_243DFC7A0()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_243DFC7C0()
{
  return MEMORY[0x270EFFA08]();
}

uint64_t sub_243DFC7D0()
{
  return MEMORY[0x270EFFA10]();
}

uint64_t sub_243DFC7E0()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_243DFC7F0()
{
  return MEMORY[0x270EFFAC0]();
}

uint64_t sub_243DFC800()
{
  return MEMORY[0x270EFFAF0]();
}

uint64_t sub_243DFC810()
{
  return MEMORY[0x270EFFB50]();
}

uint64_t sub_243DFC820()
{
  return MEMORY[0x270EFFB58]();
}

uint64_t sub_243DFC830()
{
  return MEMORY[0x270EFFB68]();
}

uint64_t sub_243DFC840()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_243DFC850()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_243DFC860()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_243DFC870()
{
  return MEMORY[0x270EFFC98]();
}

uint64_t sub_243DFC880()
{
  return MEMORY[0x270EFFCA0]();
}

uint64_t sub_243DFC890()
{
  return MEMORY[0x270EFFD68]();
}

uint64_t sub_243DFC8A0()
{
  return MEMORY[0x270EFFE00]();
}

uint64_t sub_243DFC8B0()
{
  return MEMORY[0x270EFFE08]();
}

uint64_t sub_243DFC8C0()
{
  return MEMORY[0x270EFFEB0]();
}

uint64_t sub_243DFC8D0()
{
  return MEMORY[0x270EFFEC0]();
}

uint64_t sub_243DFC8E0()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_243DFC8F0()
{
  return MEMORY[0x270F00050]();
}

uint64_t sub_243DFC900()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_243DFC910()
{
  return MEMORY[0x270F00120]();
}

uint64_t sub_243DFC920()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_243DFC930()
{
  return MEMORY[0x270F001B8]();
}

uint64_t sub_243DFC940()
{
  return MEMORY[0x270F001C0]();
}

uint64_t sub_243DFC950()
{
  return MEMORY[0x270F001D0]();
}

uint64_t sub_243DFC960()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_243DFC970()
{
  return MEMORY[0x270F00230]();
}

uint64_t sub_243DFC980()
{
  return MEMORY[0x270F003C0]();
}

uint64_t sub_243DFC990()
{
  return MEMORY[0x270F003C8]();
}

uint64_t sub_243DFC9A0()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_243DFC9B0()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_243DFC9C0()
{
  return MEMORY[0x270F00528]();
}

uint64_t sub_243DFC9D0()
{
  return MEMORY[0x270F00530]();
}

uint64_t sub_243DFC9E0()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_243DFC9F0()
{
  return MEMORY[0x270F00628]();
}

uint64_t sub_243DFCA00()
{
  return MEMORY[0x270F00630]();
}

uint64_t sub_243DFCA10()
{
  return MEMORY[0x270F00648]();
}

uint64_t sub_243DFCA20()
{
  return MEMORY[0x270F00650]();
}

uint64_t sub_243DFCA30()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_243DFCA40()
{
  return MEMORY[0x270F00770]();
}

uint64_t sub_243DFCA50()
{
  return MEMORY[0x270F007E0]();
}

uint64_t sub_243DFCA60()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_243DFCA70()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_243DFCA80()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_243DFCA90()
{
  return MEMORY[0x270F008E8]();
}

uint64_t sub_243DFCAA0()
{
  return MEMORY[0x270F00900]();
}

uint64_t sub_243DFCAB0()
{
  return MEMORY[0x270F00940]();
}

uint64_t sub_243DFCAC0()
{
  return MEMORY[0x270F00948]();
}

uint64_t sub_243DFCAD0()
{
  return MEMORY[0x270F00978]();
}

uint64_t sub_243DFCAE0()
{
  return MEMORY[0x270F00980]();
}

uint64_t sub_243DFCAF0()
{
  return MEMORY[0x270F009D0]();
}

uint64_t sub_243DFCB00()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_243DFCB10()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_243DFCB20()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_243DFCB30()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_243DFCB40()
{
  return MEMORY[0x270F00A78]();
}

uint64_t sub_243DFCB50()
{
  return MEMORY[0x270F00A88]();
}

uint64_t sub_243DFCB60()
{
  return MEMORY[0x270F00AC0]();
}

uint64_t sub_243DFCB70()
{
  return MEMORY[0x270F00AF0]();
}

uint64_t sub_243DFCB80()
{
  return MEMORY[0x270F00AF8]();
}

uint64_t sub_243DFCB90()
{
  return MEMORY[0x270F00B68]();
}

uint64_t sub_243DFCBA0()
{
  return MEMORY[0x270F00B70]();
}

uint64_t sub_243DFCBB0()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_243DFCBC0()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_243DFCBD0()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t sub_243DFCBE0()
{
  return MEMORY[0x270F00BE8]();
}

uint64_t sub_243DFCBF0()
{
  return MEMORY[0x270F00C28]();
}

uint64_t sub_243DFCC00()
{
  return MEMORY[0x270F00C30]();
}

uint64_t sub_243DFCC10()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_243DFCC20()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_243DFCC30()
{
  return MEMORY[0x270F00C90]();
}

uint64_t sub_243DFCC40()
{
  return MEMORY[0x270F00C98]();
}

uint64_t sub_243DFCC50()
{
  return MEMORY[0x270F00CA0]();
}

uint64_t sub_243DFCC60()
{
  return MEMORY[0x270F00CA8]();
}

uint64_t sub_243DFCC70()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_243DFCC80()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_243DFCC90()
{
  return MEMORY[0x270F00DC0]();
}

uint64_t sub_243DFCCA0()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_243DFCCB0()
{
  return MEMORY[0x270F00DF0]();
}

uint64_t sub_243DFCCC0()
{
  return MEMORY[0x270F00E00]();
}

uint64_t sub_243DFCCD0()
{
  return MEMORY[0x270F00E18]();
}

uint64_t sub_243DFCCE0()
{
  return MEMORY[0x270F00E20]();
}

uint64_t sub_243DFCCF0()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_243DFCD00()
{
  return MEMORY[0x270F00E40]();
}

uint64_t sub_243DFCD10()
{
  return MEMORY[0x270F00E48]();
}

uint64_t sub_243DFCD20()
{
  return MEMORY[0x270F07348]();
}

uint64_t sub_243DFCD30()
{
  return MEMORY[0x270F07370]();
}

uint64_t sub_243DFCD40()
{
  return MEMORY[0x270F073D8]();
}

uint64_t sub_243DFCD50()
{
  return MEMORY[0x270F073E0]();
}

uint64_t sub_243DFCD60()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_243DFCD70()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_243DFCD80()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_243DFCD90()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_243DFCDA0()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_243DFCDB0()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_243DFCDC0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_243DFCDD0()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_243DFCDE0()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_243DFCDF0()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_243DFCE00()
{
  return MEMORY[0x270F00F50]();
}

uint64_t sub_243DFCE10()
{
  return MEMORY[0x270F00F68]();
}

uint64_t sub_243DFCE20()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_243DFCE30()
{
  return MEMORY[0x270F00FA0]();
}

uint64_t sub_243DFCE40()
{
  return MEMORY[0x270F00FA8]();
}

uint64_t sub_243DFCE50()
{
  return MEMORY[0x270F01038]();
}

uint64_t sub_243DFCE60()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_243DFCE70()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_243DFCE80()
{
  return MEMORY[0x270F01198]();
}

uint64_t sub_243DFCE90()
{
  return MEMORY[0x270F011A0]();
}

uint64_t sub_243DFCEA0()
{
  return MEMORY[0x270F011C0]();
}

uint64_t sub_243DFCEB0()
{
  return MEMORY[0x270F011D0]();
}

uint64_t sub_243DFCEC0()
{
  return MEMORY[0x270F011D8]();
}

uint64_t sub_243DFCED0()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_243DFCEE0()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_243DFCEF0()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_243DFCF00()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_243DFCF10()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_243DFCF20()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_243DFCF30()
{
  return MEMORY[0x270F012E0]();
}

uint64_t sub_243DFCF40()
{
  return MEMORY[0x270F012F0]();
}

uint64_t sub_243DFCF50()
{
  return MEMORY[0x270F01300]();
}

uint64_t sub_243DFCF60()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_243DFCF70()
{
  return MEMORY[0x270F013D0]();
}

uint64_t sub_243DFCF80()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_243DFCF90()
{
  return MEMORY[0x270F01468]();
}

uint64_t sub_243DFCFA0()
{
  return MEMORY[0x270F01470]();
}

uint64_t sub_243DFCFB0()
{
  return MEMORY[0x270F01498]();
}

uint64_t sub_243DFCFC0()
{
  return MEMORY[0x270F014A8]();
}

uint64_t sub_243DFCFD0()
{
  return MEMORY[0x270F014E8]();
}

uint64_t sub_243DFCFE0()
{
  return MEMORY[0x270F014F0]();
}

uint64_t sub_243DFCFF0()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_243DFD000()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_243DFD010()
{
  return MEMORY[0x270F01528]();
}

uint64_t sub_243DFD020()
{
  return MEMORY[0x270F01538]();
}

uint64_t sub_243DFD030()
{
  return MEMORY[0x270F015F8]();
}

uint64_t sub_243DFD040()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_243DFD050()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_243DFD060()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_243DFD070()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_243DFD080()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_243DFD090()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_243DFD0B0()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_243DFD0C0()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_243DFD0D0()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_243DFD0E0()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_243DFD0F0()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_243DFD100()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_243DFD120()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_243DFD130()
{
  return MEMORY[0x270F073F8]();
}

uint64_t sub_243DFD140()
{
  return MEMORY[0x270F07400]();
}

uint64_t sub_243DFD150()
{
  return MEMORY[0x270F07410]();
}

uint64_t sub_243DFD160()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_243DFD170()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_243DFD180()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_243DFD190()
{
  return MEMORY[0x270F01938]();
}

uint64_t sub_243DFD1A0()
{
  return MEMORY[0x270F01980]();
}

uint64_t sub_243DFD1B0()
{
  return MEMORY[0x270F01988]();
}

uint64_t sub_243DFD1C0()
{
  return MEMORY[0x270F01998]();
}

uint64_t sub_243DFD1D0()
{
  return MEMORY[0x270F019A8]();
}

uint64_t sub_243DFD1E0()
{
  return MEMORY[0x270F019B0]();
}

uint64_t sub_243DFD1F0()
{
  return MEMORY[0x270F01A10]();
}

uint64_t sub_243DFD200()
{
  return MEMORY[0x270F01A28]();
}

uint64_t sub_243DFD210()
{
  return MEMORY[0x270F01A40]();
}

uint64_t sub_243DFD220()
{
  return MEMORY[0x270F01A60]();
}

uint64_t sub_243DFD230()
{
  return MEMORY[0x270F01A68]();
}

uint64_t sub_243DFD240()
{
  return MEMORY[0x270F01A70]();
}

uint64_t sub_243DFD250()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_243DFD260()
{
  return MEMORY[0x270F01AA0]();
}

uint64_t sub_243DFD270()
{
  return MEMORY[0x270F01AA8]();
}

uint64_t sub_243DFD280()
{
  return MEMORY[0x270F01B20]();
}

uint64_t sub_243DFD290()
{
  return MEMORY[0x270F01B30]();
}

uint64_t sub_243DFD2A0()
{
  return MEMORY[0x270F01B78]();
}

uint64_t sub_243DFD2B0()
{
  return MEMORY[0x270F01B80]();
}

uint64_t sub_243DFD2C0()
{
  return MEMORY[0x270F01B88]();
}

uint64_t sub_243DFD2D0()
{
  return MEMORY[0x270F01BA0]();
}

uint64_t sub_243DFD2E0()
{
  return MEMORY[0x270F01BC8]();
}

uint64_t sub_243DFD2F0()
{
  return MEMORY[0x270F01BD0]();
}

uint64_t sub_243DFD300()
{
  return MEMORY[0x270F01BD8]();
}

uint64_t sub_243DFD310()
{
  return MEMORY[0x270F01BE0]();
}

uint64_t sub_243DFD320()
{
  return MEMORY[0x270F01BE8]();
}

uint64_t sub_243DFD330()
{
  return MEMORY[0x270F01BF0]();
}

uint64_t sub_243DFD340()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_243DFD350()
{
  return MEMORY[0x270F01C10]();
}

uint64_t sub_243DFD360()
{
  return MEMORY[0x270F01C18]();
}

uint64_t sub_243DFD370()
{
  return MEMORY[0x270F01C20]();
}

uint64_t sub_243DFD380()
{
  return MEMORY[0x270F01C90]();
}

uint64_t sub_243DFD390()
{
  return MEMORY[0x270F01CA8]();
}

uint64_t sub_243DFD3A0()
{
  return MEMORY[0x270F01CB0]();
}

uint64_t sub_243DFD3B0()
{
  return MEMORY[0x270F01CB8]();
}

uint64_t sub_243DFD3C0()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_243DFD3D0()
{
  return MEMORY[0x270F01D30]();
}

uint64_t sub_243DFD3E0()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_243DFD3F0()
{
  return MEMORY[0x270F01E28]();
}

uint64_t sub_243DFD400()
{
  return MEMORY[0x270F01E48]();
}

uint64_t sub_243DFD410()
{
  return MEMORY[0x270F01F20]();
}

uint64_t sub_243DFD420()
{
  return MEMORY[0x270F01F28]();
}

uint64_t sub_243DFD430()
{
  return MEMORY[0x270F01F30]();
}

uint64_t sub_243DFD440()
{
  return MEMORY[0x270F01F40]();
}

uint64_t sub_243DFD450()
{
  return MEMORY[0x270F01F98]();
}

uint64_t sub_243DFD460()
{
  return MEMORY[0x270F02018]();
}

uint64_t sub_243DFD470()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_243DFD480()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_243DFD490()
{
  return MEMORY[0x270F02100]();
}

uint64_t sub_243DFD4A0()
{
  return MEMORY[0x270F02120]();
}

uint64_t sub_243DFD4B0()
{
  return MEMORY[0x270F02128]();
}

uint64_t sub_243DFD4C0()
{
  return MEMORY[0x270F02260]();
}

uint64_t sub_243DFD4D0()
{
  return MEMORY[0x270F022B0]();
}

uint64_t sub_243DFD4E0()
{
  return MEMORY[0x270F022B8]();
}

uint64_t sub_243DFD4F0()
{
  return MEMORY[0x270F02310]();
}

uint64_t sub_243DFD500()
{
  return MEMORY[0x270F02330]();
}

uint64_t sub_243DFD510()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_243DFD520()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_243DFD530()
{
  return MEMORY[0x270F023A8]();
}

uint64_t sub_243DFD540()
{
  return MEMORY[0x270F023B0]();
}

uint64_t sub_243DFD550()
{
  return MEMORY[0x270F023B8]();
}

uint64_t sub_243DFD560()
{
  return MEMORY[0x270F023C0]();
}

uint64_t sub_243DFD570()
{
  return MEMORY[0x270F023F0]();
}

uint64_t sub_243DFD580()
{
  return MEMORY[0x270F023F8]();
}

uint64_t sub_243DFD590()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_243DFD5A0()
{
  return MEMORY[0x270F02490]();
}

uint64_t sub_243DFD5B0()
{
  return MEMORY[0x270F024A8]();
}

uint64_t sub_243DFD5C0()
{
  return MEMORY[0x270F025C8]();
}

uint64_t sub_243DFD5D0()
{
  return MEMORY[0x270F025E0]();
}

uint64_t sub_243DFD5E0()
{
  return MEMORY[0x270F07428]();
}

uint64_t sub_243DFD5F0()
{
  return MEMORY[0x270F025F0]();
}

uint64_t sub_243DFD600()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_243DFD610()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_243DFD620()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_243DFD640()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_243DFD650()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_243DFD660()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_243DFD680()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_243DFD690()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_243DFD6A0()
{
  return MEMORY[0x270F02928]();
}

uint64_t sub_243DFD6B0()
{
  return MEMORY[0x270F02930]();
}

uint64_t sub_243DFD6C0()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_243DFD6D0()
{
  return MEMORY[0x270F029A0]();
}

uint64_t sub_243DFD6E0()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_243DFD6F0()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_243DFD700()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_243DFD710()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_243DFD720()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_243DFD730()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_243DFD740()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_243DFD750()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_243DFD760()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_243DFD770()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_243DFD780()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_243DFD790()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_243DFD7A0()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_243DFD7B0()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_243DFD7C0()
{
  return MEMORY[0x270F02AF0]();
}

uint64_t sub_243DFD7D0()
{
  return MEMORY[0x270F02B00]();
}

uint64_t sub_243DFD7E0()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_243DFD7F0()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_243DFD800()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_243DFD810()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_243DFD820()
{
  return MEMORY[0x270F02BE8]();
}

uint64_t sub_243DFD830()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_243DFD840()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_243DFD850()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_243DFD860()
{
  return MEMORY[0x270F02C20]();
}

uint64_t sub_243DFD870()
{
  return MEMORY[0x270F02C38]();
}

uint64_t sub_243DFD880()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_243DFD890()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_243DFD8A0()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_243DFD8B0()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_243DFD8C0()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_243DFD8D0()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_243DFD8E0()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_243DFD8F0()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_243DFD900()
{
  return MEMORY[0x270F02CD8]();
}

uint64_t sub_243DFD910()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_243DFD920()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_243DFD930()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_243DFD940()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_243DFD950()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_243DFD960()
{
  return MEMORY[0x270F02D90]();
}

uint64_t sub_243DFD970()
{
  return MEMORY[0x270F02DB0]();
}

uint64_t sub_243DFD980()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_243DFD990()
{
  return MEMORY[0x270F02DF8]();
}

uint64_t sub_243DFD9A0()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_243DFD9B0()
{
  return MEMORY[0x270F02FE8]();
}

uint64_t sub_243DFD9C0()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_243DFD9D0()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_243DFD9E0()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_243DFD9F0()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_243DFDA00()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_243DFDA10()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_243DFDA20()
{
  return MEMORY[0x270F03158]();
}

uint64_t sub_243DFDA30()
{
  return MEMORY[0x270F03168]();
}

uint64_t sub_243DFDA40()
{
  return MEMORY[0x270F03170]();
}

uint64_t sub_243DFDA50()
{
  return MEMORY[0x270F03178]();
}

uint64_t sub_243DFDA60()
{
  return MEMORY[0x270F03190]();
}

uint64_t sub_243DFDA70()
{
  return MEMORY[0x270F031A0]();
}

uint64_t sub_243DFDA80()
{
  return MEMORY[0x270F03220]();
}

uint64_t sub_243DFDA90()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_243DFDAA0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_243DFDAB0()
{
  return MEMORY[0x270F07438]();
}

uint64_t sub_243DFDAC0()
{
  return MEMORY[0x270F07458]();
}

uint64_t sub_243DFDAD0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_243DFDAE0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_243DFDAF0()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_243DFDB00()
{
  return MEMORY[0x270F03388]();
}

uint64_t sub_243DFDB10()
{
  return MEMORY[0x270F033C0]();
}

uint64_t sub_243DFDB20()
{
  return MEMORY[0x270F033D8]();
}

uint64_t sub_243DFDB30()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_243DFDB40()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_243DFDB50()
{
  return MEMORY[0x270F03480]();
}

uint64_t sub_243DFDB60()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_243DFDB70()
{
  return MEMORY[0x270F034C8]();
}

uint64_t sub_243DFDB80()
{
  return MEMORY[0x270F034E8]();
}

uint64_t sub_243DFDB90()
{
  return MEMORY[0x270F034F0]();
}

uint64_t sub_243DFDBA0()
{
  return MEMORY[0x270F03510]();
}

uint64_t sub_243DFDBB0()
{
  return MEMORY[0x270F035C0]();
}

uint64_t sub_243DFDBC0()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_243DFDBD0()
{
  return MEMORY[0x270F035F0]();
}

uint64_t sub_243DFDBE0()
{
  return MEMORY[0x270F03608]();
}

uint64_t sub_243DFDBF0()
{
  return MEMORY[0x270F03638]();
}

uint64_t sub_243DFDC00()
{
  return MEMORY[0x270F03648]();
}

uint64_t sub_243DFDC10()
{
  return MEMORY[0x270F03660]();
}

uint64_t sub_243DFDC20()
{
  return MEMORY[0x270F036B0]();
}

uint64_t sub_243DFDC30()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_243DFDC40()
{
  return MEMORY[0x270F036E8]();
}

uint64_t sub_243DFDC50()
{
  return MEMORY[0x270F03788]();
}

uint64_t sub_243DFDC60()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_243DFDC70()
{
  return MEMORY[0x270F037F8]();
}

uint64_t sub_243DFDC80()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_243DFDC90()
{
  return MEMORY[0x270F03870]();
}

uint64_t sub_243DFDCA0()
{
  return MEMORY[0x270F03880]();
}

uint64_t sub_243DFDCB0()
{
  return MEMORY[0x270F03898]();
}

uint64_t sub_243DFDCC0()
{
  return MEMORY[0x270F038D0]();
}

uint64_t sub_243DFDCD0()
{
  return MEMORY[0x270F038E8]();
}

uint64_t sub_243DFDCE0()
{
  return MEMORY[0x270F03968]();
}

uint64_t sub_243DFDCF0()
{
  return MEMORY[0x270F03A08]();
}

uint64_t sub_243DFDD00()
{
  return MEMORY[0x270F03A20]();
}

uint64_t sub_243DFDD10()
{
  return MEMORY[0x270F03A38]();
}

uint64_t sub_243DFDD20()
{
  return MEMORY[0x270F03A70]();
}

uint64_t sub_243DFDD30()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_243DFDD40()
{
  return MEMORY[0x270F03B18]();
}

uint64_t sub_243DFDD50()
{
  return MEMORY[0x270F03B70]();
}

uint64_t sub_243DFDD60()
{
  return MEMORY[0x270F03B78]();
}

uint64_t sub_243DFDD70()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_243DFDD80()
{
  return MEMORY[0x270F03BD8]();
}

uint64_t sub_243DFDD90()
{
  return MEMORY[0x270F03C00]();
}

uint64_t sub_243DFDDA0()
{
  return MEMORY[0x270F03C40]();
}

uint64_t sub_243DFDDB0()
{
  return MEMORY[0x270F03C58]();
}

uint64_t sub_243DFDDC0()
{
  return MEMORY[0x270F03C78]();
}

uint64_t sub_243DFDDD0()
{
  return MEMORY[0x270F03C80]();
}

uint64_t sub_243DFDDE0()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_243DFDDF0()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_243DFDE00()
{
  return MEMORY[0x270F03D40]();
}

uint64_t sub_243DFDE10()
{
  return MEMORY[0x270F03E00]();
}

uint64_t sub_243DFDE20()
{
  return MEMORY[0x270F03E28]();
}

uint64_t sub_243DFDE30()
{
  return MEMORY[0x270F03E58]();
}

uint64_t sub_243DFDE40()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_243DFDE50()
{
  return MEMORY[0x270F03E80]();
}

uint64_t sub_243DFDE60()
{
  return MEMORY[0x270F03EA8]();
}

uint64_t sub_243DFDE70()
{
  return MEMORY[0x270F03EE8]();
}

uint64_t sub_243DFDE80()
{
  return MEMORY[0x270F03EF8]();
}

uint64_t sub_243DFDE90()
{
  return MEMORY[0x270F03F30]();
}

uint64_t sub_243DFDEA0()
{
  return MEMORY[0x270F03F50]();
}

uint64_t sub_243DFDEB0()
{
  return MEMORY[0x270F03F70]();
}

uint64_t sub_243DFDEC0()
{
  return MEMORY[0x270F03FB0]();
}

uint64_t sub_243DFDED0()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_243DFDEE0()
{
  return MEMORY[0x270F04010]();
}

uint64_t sub_243DFDEF0()
{
  return MEMORY[0x270F040D8]();
}

uint64_t sub_243DFDF00()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_243DFDF10()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_243DFDF20()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_243DFDF30()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_243DFDF40()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_243DFDF50()
{
  return MEMORY[0x270F041B0]();
}

uint64_t sub_243DFDF60()
{
  return MEMORY[0x270F04240]();
}

uint64_t sub_243DFDF70()
{
  return MEMORY[0x270F04278]();
}

uint64_t sub_243DFDF80()
{
  return MEMORY[0x270F04290]();
}

uint64_t sub_243DFDF90()
{
  return MEMORY[0x270F042C0]();
}

uint64_t sub_243DFDFA0()
{
  return MEMORY[0x270F042E0]();
}

uint64_t sub_243DFDFB0()
{
  return MEMORY[0x270F04320]();
}

uint64_t sub_243DFDFC0()
{
  return MEMORY[0x270F04330]();
}

uint64_t sub_243DFDFD0()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_243DFDFE0()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_243DFDFF0()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_243DFE000()
{
  return MEMORY[0x270F043C0]();
}

uint64_t sub_243DFE010()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_243DFE020()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_243DFE030()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_243DFE040()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_243DFE050()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_243DFE060()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_243DFE070()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_243DFE080()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_243DFE090()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_243DFE0A0()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_243DFE0B0()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_243DFE0C0()
{
  return MEMORY[0x270F04588]();
}

uint64_t sub_243DFE0D0()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_243DFE0E0()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_243DFE0F0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_243DFE100()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_243DFE110()
{
  return MEMORY[0x270F04698]();
}

uint64_t sub_243DFE120()
{
  return MEMORY[0x270F046A0]();
}

uint64_t sub_243DFE130()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_243DFE140()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_243DFE150()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_243DFE160()
{
  return MEMORY[0x270F07460]();
}

uint64_t sub_243DFE170()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_243DFE180()
{
  return MEMORY[0x270F04728]();
}

uint64_t sub_243DFE190()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_243DFE1A0()
{
  return MEMORY[0x270F04758]();
}

uint64_t sub_243DFE1B0()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_243DFE1C0()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_243DFE1D0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_243DFE1E0()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_243DFE1F0()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_243DFE200()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_243DFE210()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_243DFE220()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_243DFE230()
{
  return MEMORY[0x270F048D0]();
}

uint64_t sub_243DFE240()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_243DFE250()
{
  return MEMORY[0x270F04900]();
}

uint64_t sub_243DFE260()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_243DFE270()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_243DFE280()
{
  return MEMORY[0x270F04978]();
}

uint64_t sub_243DFE290()
{
  return MEMORY[0x270F049D0]();
}

uint64_t sub_243DFE2A0()
{
  return MEMORY[0x270F04AE0]();
}

uint64_t sub_243DFE2B0()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_243DFE2C0()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_243DFE2D0()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_243DFE2E0()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_243DFE2F0()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_243DFE300()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_243DFE310()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_243DFE320()
{
  return MEMORY[0x270F04B58]();
}

uint64_t sub_243DFE330()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_243DFE340()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_243DFE350()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_243DFE360()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_243DFE370()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_243DFE380()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_243DFE390()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_243DFE3A0()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_243DFE3B0()
{
  return MEMORY[0x270F04CE8]();
}

uint64_t sub_243DFE3C0()
{
  return MEMORY[0x270F04D38]();
}

uint64_t sub_243DFE3D0()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_243DFE3E0()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_243DFE3F0()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_243DFE400()
{
  return MEMORY[0x270F04D70]();
}

uint64_t sub_243DFE410()
{
  return MEMORY[0x270F04D80]();
}

uint64_t sub_243DFE420()
{
  return MEMORY[0x270F04DF0]();
}

uint64_t sub_243DFE430()
{
  return MEMORY[0x270F04E10]();
}

uint64_t sub_243DFE440()
{
  return MEMORY[0x270F04E20]();
}

uint64_t sub_243DFE450()
{
  return MEMORY[0x270F04E28]();
}

uint64_t sub_243DFE460()
{
  return MEMORY[0x270F04E38]();
}

uint64_t sub_243DFE470()
{
  return MEMORY[0x270F04EC8]();
}

uint64_t sub_243DFE480()
{
  return MEMORY[0x270F04ED8]();
}

uint64_t sub_243DFE490()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_243DFE4A0()
{
  return MEMORY[0x270F04F20]();
}

uint64_t sub_243DFE4B0()
{
  return MEMORY[0x270F04F78]();
}

uint64_t sub_243DFE4C0()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_243DFE4D0()
{
  return MEMORY[0x270F05010]();
}

uint64_t sub_243DFE4E0()
{
  return MEMORY[0x270F05048]();
}

uint64_t sub_243DFE4F0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_243DFE500()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_243DFE510()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_243DFE520()
{
  return MEMORY[0x270F050F8]();
}

uint64_t sub_243DFE530()
{
  return MEMORY[0x270F05120]();
}

uint64_t sub_243DFE540()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_243DFE550()
{
  return MEMORY[0x270F05158]();
}

uint64_t sub_243DFE560()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_243DFE570()
{
  return MEMORY[0x270F05188]();
}

uint64_t sub_243DFE580()
{
  return MEMORY[0x270F05278]();
}

uint64_t sub_243DFE590()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_243DFE5A0()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_243DFE5B0()
{
  return MEMORY[0x270F05368]();
}

uint64_t sub_243DFE5C0()
{
  return MEMORY[0x270F05378]();
}

uint64_t sub_243DFE5D0()
{
  return MEMORY[0x270F05380]();
}

uint64_t sub_243DFE5E0()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_243DFE5F0()
{
  return MEMORY[0x270F053D0]();
}

uint64_t sub_243DFE600()
{
  return MEMORY[0x270F053D8]();
}

uint64_t sub_243DFE610()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_243DFE620()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_243DFE630()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_243DFE640()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_243DFE650()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_243DFE660()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_243DFE670()
{
  return MEMORY[0x270EEB078]();
}

uint64_t sub_243DFE680()
{
  return MEMORY[0x270EEB088]();
}

uint64_t sub_243DFE690()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_243DFE6A0()
{
  return MEMORY[0x270F07550]();
}

uint64_t sub_243DFE6B0()
{
  return MEMORY[0x270F07560]();
}

uint64_t sub_243DFE6C0()
{
  return MEMORY[0x270F07570]();
}

uint64_t sub_243DFE6D0()
{
  return MEMORY[0x270F075D0]();
}

uint64_t sub_243DFE6E0()
{
  return MEMORY[0x270F075D8]();
}

uint64_t sub_243DFE6F0()
{
  return MEMORY[0x270F07608]();
}

uint64_t sub_243DFE700()
{
  return MEMORY[0x270F076E8]();
}

uint64_t sub_243DFE730()
{
  return MEMORY[0x270F07788]();
}

uint64_t sub_243DFE740()
{
  return MEMORY[0x270F077A0]();
}

uint64_t sub_243DFE750()
{
  return MEMORY[0x270F077A8]();
}

uint64_t sub_243DFE760()
{
  return MEMORY[0x270F077B8]();
}

uint64_t sub_243DFE770()
{
  return MEMORY[0x270F07830]();
}

uint64_t sub_243DFE780()
{
  return MEMORY[0x270F07848]();
}

uint64_t sub_243DFE790()
{
  return MEMORY[0x270F07850]();
}

uint64_t sub_243DFE7A0()
{
  return MEMORY[0x270F07920]();
}

uint64_t sub_243DFE7C0()
{
  return MEMORY[0x270F07930]();
}

uint64_t sub_243DFE7D0()
{
  return MEMORY[0x270F07938]();
}

uint64_t sub_243DFE7F0()
{
  return MEMORY[0x270F079F0]();
}

uint64_t sub_243DFE800()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_243DFE810()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_243DFE820()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_243DFE830()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_243DFE840()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_243DFE850()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_243DFE860()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_243DFE870()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_243DFE880()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_243DFE890()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_243DFE8A0()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_243DFE8B0()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_243DFE8C0()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_243DFE8D0()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_243DFE8E0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_243DFE8F0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_243DFE900()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_243DFE910()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_243DFE920()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_243DFE930()
{
  return MEMORY[0x270EF1A38]();
}

uint64_t sub_243DFE940()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_243DFE950()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_243DFE960()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_243DFE970()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_243DFE980()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_243DFE990()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_243DFE9A0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_243DFE9B0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_243DFE9C0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_243DFE9D0()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_243DFE9E0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_243DFE9F0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_243DFEA00()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_243DFEA10()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_243DFEA30()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_243DFEA40()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_243DFEA50()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_243DFEA60()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_243DFEA70()
{
  return MEMORY[0x270EF1B50]();
}

uint64_t sub_243DFEA80()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_243DFEA90()
{
  return MEMORY[0x270F9D910]();
}

uint64_t sub_243DFEAA0()
{
  return MEMORY[0x270EE4040]();
}

uint64_t sub_243DFEAB0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_243DFEAC0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_243DFEAD0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_243DFEAE0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_243DFEAF0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_243DFEB00()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_243DFEB10()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_243DFEB20()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_243DFEB30()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_243DFEB40()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_243DFEB50()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_243DFEB70()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_243DFEB80()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_243DFEB90()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_243DFEBA0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_243DFEBB0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_243DFEBC0()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_243DFEBD0()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_243DFEBE0()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_243DFEC00()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_243DFEC20()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_243DFEC40()
{
  return MEMORY[0x270FA2040]();
}

uint64_t sub_243DFEC50()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_243DFEC60()
{
  return MEMORY[0x270EF1CA8]();
}

uint64_t sub_243DFEC70()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_243DFEC80()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_243DFEC90()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_243DFECA0()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_243DFECB0()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_243DFECC0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_243DFECD0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_243DFECE0()
{
  return MEMORY[0x270F9E0D0]();
}

uint64_t sub_243DFECF0()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_243DFED00()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_243DFED10()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_243DFED20()
{
  return MEMORY[0x270FA2BE8]();
}

uint64_t sub_243DFED30()
{
  return MEMORY[0x270EED908]();
}

uint64_t sub_243DFED40()
{
  return MEMORY[0x270EED910]();
}

uint64_t sub_243DFED50()
{
  return MEMORY[0x270EED918]();
}

uint64_t sub_243DFED60()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_243DFED70()
{
  return MEMORY[0x270EED920]();
}

uint64_t sub_243DFED80()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_243DFED90()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_243DFEDA0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_243DFEDB0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_243DFEDC0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_243DFEDD0()
{
  return MEMORY[0x270EED928]();
}

uint64_t sub_243DFEDE0()
{
  return MEMORY[0x270EED930]();
}

uint64_t sub_243DFEDF0()
{
  return MEMORY[0x270EED938]();
}

uint64_t sub_243DFEE00()
{
  return MEMORY[0x270EED940]();
}

uint64_t sub_243DFEE10()
{
  return MEMORY[0x270F824A0]();
}

uint64_t sub_243DFEE20()
{
  return MEMORY[0x270EF1F38]();
}

uint64_t sub_243DFEE30()
{
  return MEMORY[0x270FA0CD0]();
}

uint64_t sub_243DFEE40()
{
  return MEMORY[0x270FA0CE8]();
}

uint64_t sub_243DFEE50()
{
  return MEMORY[0x270FA0D20]();
}

uint64_t sub_243DFEE60()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_243DFEE70()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_243DFEE80()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_243DFEE90()
{
  return MEMORY[0x270EED948]();
}

uint64_t sub_243DFEEA0()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_243DFEEB0()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_243DFEEC0()
{
  return MEMORY[0x270EED950]();
}

uint64_t sub_243DFEED0()
{
  return MEMORY[0x270EED958]();
}

uint64_t sub_243DFEEE0()
{
  return MEMORY[0x270EED960]();
}

uint64_t sub_243DFEEF0()
{
  return MEMORY[0x270EE4218]();
}

uint64_t sub_243DFEF00()
{
  return MEMORY[0x270EE4220]();
}

uint64_t sub_243DFEF10()
{
  return MEMORY[0x270EE4238]();
}

uint64_t sub_243DFEF30()
{
  return MEMORY[0x270EED968]();
}

uint64_t sub_243DFEF40()
{
  return MEMORY[0x270EED970]();
}

uint64_t sub_243DFEF50()
{
  return MEMORY[0x270EED978]();
}

uint64_t sub_243DFEF60()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_243DFEF70()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_243DFEF80()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_243DFEF90()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_243DFEFA0()
{
  return MEMORY[0x270EF2248]();
}

uint64_t sub_243DFEFB0()
{
  return MEMORY[0x270EF2258]();
}

uint64_t sub_243DFEFC0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_243DFEFD0()
{
  return MEMORY[0x270EF23C8]();
}

uint64_t sub_243DFEFE0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_243DFEFF0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_243DFF000()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_243DFF010()
{
  return MEMORY[0x270EF2410]();
}

uint64_t sub_243DFF020()
{
  return MEMORY[0x270EF2458]();
}

uint64_t sub_243DFF030()
{
  return MEMORY[0x270EF2470]();
}

uint64_t sub_243DFF040()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_243DFF050()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t sub_243DFF060()
{
  return MEMORY[0x270EF24F8]();
}

uint64_t sub_243DFF070()
{
  return MEMORY[0x270EF2508]();
}

uint64_t sub_243DFF080()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_243DFF090()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_243DFF0A0()
{
  return MEMORY[0x270EF25E0]();
}

uint64_t sub_243DFF0B0()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_243DFF0C0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_243DFF0D0()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_243DFF0E0()
{
  return MEMORY[0x270F9E7E0]();
}

uint64_t sub_243DFF0F0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_243DFF100()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_243DFF110()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_243DFF120()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_243DFF130()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_243DFF140()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_243DFF150()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_243DFF160()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_243DFF170()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_243DFF180()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_243DFF190()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_243DFF1A0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_243DFF1B0()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_243DFF1C0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_243DFF1D0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_243DFF1E0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_243DFF1F0()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_243DFF200()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_243DFF210()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_243DFF220()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_243DFF230()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_243DFF240()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_243DFF250()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_243DFF260()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_243DFF270()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_243DFF280()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_243DFF290()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_243DFF2A0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_243DFF2B0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_243DFF2C0()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_243DFF2D0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_243DFF2E0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_243DFF2F0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_243DFF300()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_243DFF320()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_243DFF340()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_243DFF350()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_243DFF360()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_243DFF370()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_243DFF380()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_243DFF3A0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_243DFF3B0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_243DFF3D0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_243DFF3E0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_243DFF3F0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_243DFF400()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_243DFF410()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_243DFF420()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_243DFF430()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_243DFF440()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_243DFF450()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_243DFF460()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_243DFF470()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_243DFF480()
{
  return MEMORY[0x270F9FC70]();
}

uint64_t sub_243DFF490()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_243DFF4A0()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_243DFF4B0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_243DFF4C0()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t sub_243DFF4D0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_243DFF4E0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_243DFF510()
{
  return MEMORY[0x270FA00C0]();
}

uint64_t sub_243DFF520()
{
  return MEMORY[0x270FA0128]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5028](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t PKCurrencyAmountMake()
{
  return MEMORY[0x270F51C38]();
}

uint64_t PKLastReviewPromptDate()
{
  return MEMORY[0x270F51D80]();
}

uint64_t PKMaskedPaymentPAN()
{
  return MEMORY[0x270F51DB8]();
}

uint64_t PKMerchantFormattedDisplayName()
{
  return MEMORY[0x270F51DE0]();
}

uint64_t PKOpenInstallWallet()
{
  return MEMORY[0x270F51E28]();
}

uint64_t PKPassKitUIBundle()
{
  return MEMORY[0x270F51E50]();
}

uint64_t PKUIImageFromPDF()
{
  return MEMORY[0x270F52060]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t PKFontForDefaultDesign(NSString *a1, NSString *a2, double a3)
{
  return MEMORY[0x270F52068](a1, a2, a3);
}

uint64_t PKLocalizedDeletableString(NSString *a1)
{
  return MEMORY[0x270F52048](a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
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

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}