uint64_t sub_100004A7C(unint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned char *v6;
  uint64_t *v7;
  unsigned char *v8;
  unint64_t v9;
  unint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  unint64_t v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  long long v38[2];
  uint64_t v39;
  long long v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  *(void *)&v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  sub_100007FF8(&qword_100020888);
  if (swift_dynamicCast())
  {
    sub_1000081C4(v38, (uint64_t)&v41);
    sub_1000081DC(&v41, v43);
    sub_1000185F0();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    sub_100008220((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_1000080E8((uint64_t)v38, &qword_100020890);
  v2 = a1;
  v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      v41 = a1;
      v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v4 = sub_100018A10();
      }
      if (v4) {
        v6 = (unsigned char *)(v4 + v5);
      }
      else {
        v6 = 0;
      }
      v7 = (uint64_t *)v4;
    }
    v8 = sub_1000063C0(v7, v6);
    v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    v2 = a1;
    v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    v11 = sub_100018880();
    goto LABEL_17;
  }
LABEL_69:
  v8 = 0;
  v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    v11 = HIBYTE(v3) & 0xF;
  }
  else {
    v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_100006424(v11);
  *((void *)&v38[0] + 1) = v12;
  __chkstk_darwin();
  v13 = (unint64_t)sub_100005CD0((void *(*)(uint64_t *__return_ptr, char *, char *))sub_100008144);
  v16 = *((void *)&v38[0] + 1) >> 62;
  v17 = v13;
  v18 = v3;
  v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        sub_1000186C0();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        v25 = HIBYTE(v3) & 0xF;
      }
      else {
        v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      v28 = 4 << v27;
      v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      v33 = (uint64_t)v8;
      v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      v22 = *(void *)(*(void *)&v38[0] + 16);
      v21 = *(void *)(*(void *)&v38[0] + 24);
      v23 = __OFSUB__(v21, v22);
      v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      v24 = 0;
      goto LABEL_61;
    default:
      v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    v29 = v19 & 0xC;
    v2 = v19;
    if (v29 == v28) {
      v2 = sub_100005C54(v19, v17, v18);
    }
    v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      v2 = sub_1000188B0();
      v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      v41 = v17;
      v42 = v35;
      v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        v2 = sub_100018A10();
      }
      v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    v2 = sub_100005C54(v19, v17, v18);
    v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    v2 = sub_100018890();
    v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      sub_1000186D0();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    sub_1000186D0();
    sub_1000081B0(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_1000081B0((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

uint64_t sub_100004FAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_100008358;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_10000505C(uint64_t a1)
{
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_100020840 + dword_100020840);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100005104;
  return v5(a1);
}

uint64_t sub_100005104(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100005200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  void *v15 = v7;
  v15[1] = sub_1000052E4;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_1000052E4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000053D8(uint64_t a1)
{
  unint64_t v2 = sub_100005C00();

  return MLHostExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005484()
{
  unint64_t result = qword_100020818[0];
  if (!qword_100020818[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100020818);
  }
  return result;
}

uint64_t variable initialization expression of FedStatsPluginMLHostClient.taskType()
{
  return 0;
}

unint64_t variable initialization expression of FedStatsPluginMLHostClient.recipes()
{
  return sub_100005908((uint64_t)&_swiftEmptyArrayStorage, (uint64_t *)&unk_1000208C0);
}

unint64_t sub_100005508(uint64_t a1)
{
  return sub_100005908(a1, (uint64_t *)&unk_1000208C0);
}

unint64_t sub_100005514(uint64_t a1)
{
  uint64_t v2 = sub_100007FF8((uint64_t *)&unk_1000208B0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007FF8(&qword_100020C00);
  uint64_t v6 = sub_100018AA0();
  uint64_t v7 = (void *)v6;
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
    sub_100008290(v12, (uint64_t)v5, (uint64_t *)&unk_1000208B0);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_100012D70(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = (uint64_t *)(v7[6] + 16 * result);
    uint64_t *v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = type metadata accessor for FedStatsPluginCKExperimentRecord();
    unint64_t result = sub_1000082F4(v9, v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18);
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

unint64_t sub_1000056FC(uint64_t a1)
{
  uint64_t v2 = sub_100007FF8((uint64_t *)&unk_1000208A0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007FF8(&qword_100020BE0);
  uint64_t v6 = sub_100018AA0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100008290(v12, (uint64_t)v5, (uint64_t *)&unk_1000208A0);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_100012D70(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = (uint64_t *)(v7[6] + 16 * result);
    uint64_t *v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = sub_100018680();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18, v9, v21);
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

unint64_t sub_1000058FC(uint64_t a1)
{
  return sub_100005908(a1, &qword_100020898);
}

unint64_t sub_100005908(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007FF8(a2);
  uint64_t v3 = (void *)sub_100018AA0();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_100012D70(v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v5 += 3;
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

unint64_t sub_100005A20(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007FF8(&qword_100020878);
  uint64_t v2 = sub_100018AA0();
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
    sub_100008290(v6, (uint64_t)&v15, &qword_100020880);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100012D70(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000080D8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t variable initialization expression of FedStatsPluginMLHostClient.experimentCfgs()
{
  return sub_100005514((uint64_t)&_swiftEmptyArrayStorage);
}

unint64_t variable initialization expression of FedStatsPluginMLHostClient.assetURLs()
{
  return sub_1000056FC((uint64_t)&_swiftEmptyArrayStorage);
}

unint64_t variable initialization expression of FedStatsPluginMLHostClient.attachmentIDMaps()
{
  return sub_100005908((uint64_t)&_swiftEmptyArrayStorage, &qword_100020898);
}

ValueMetadata *type metadata accessor for FedStatsMLHostPlugin()
{
  return &type metadata for FedStatsMLHostPlugin;
}

uint64_t sub_100005BAC()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100005C00()
{
  unint64_t result = qword_100020838;
  if (!qword_100020838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020838);
  }
  return result;
}

uint64_t sub_100005C54(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1000188C0();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = sub_1000188A0();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

char *sub_100005CD0(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_100019120;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_1000185A0() && __OFSUB__((int)v4, sub_1000185D0())) {
        goto LABEL_24;
      }
      sub_1000185E0();
      swift_allocObject();
      uint64_t v13 = sub_100018580();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      unint64_t result = sub_1000060BC((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_100018690();
      unint64_t result = sub_1000060BC(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *uint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *uint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        unint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *uint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_100005FD4@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    unint64_t result = (unsigned char *)sub_1000061FC(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (unsigned char *)sub_1000062C0((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = (unsigned char *)sub_10000633C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_10000604C(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  unint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_1000060BC(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  unint64_t result = (char *)sub_1000185A0();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  unint64_t result = (char *)sub_1000185D0();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_1000185C0();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  unint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_100006170@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    unint64_t result = sub_100018A00();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      unint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000061FC(unsigned char *__src, unsigned char *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_1000062C0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1000185E0();
  swift_allocObject();
  uint64_t result = sub_100018590();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1000186B0();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_10000633C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1000185E0();
  swift_allocObject();
  uint64_t result = sub_100018590();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *sub_1000063C0(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_1000061FC(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_1000062C0((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_10000633C((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_100006424(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_1000185E0();
      swift_allocObject();
      sub_1000185B0();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_1000186B0();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_1000064C4(uint64_t a1)
{
  v1[35] = a1;
  uint64_t v2 = sub_100018620();
  v1[36] = v2;
  v1[37] = *(void *)(v2 - 8);
  v1[38] = swift_task_alloc();
  uint64_t v3 = sub_100018680();
  v1[39] = v3;
  v1[40] = *(void *)(v3 - 8);
  v1[41] = swift_task_alloc();
  v1[42] = swift_task_alloc();
  v1[43] = swift_task_alloc();
  uint64_t v4 = sub_1000187A0();
  v1[44] = v4;
  v1[45] = *(void *)(v4 - 8);
  v1[46] = swift_task_alloc();
  v1[47] = swift_task_alloc();
  return _swift_task_switch(sub_100006694, 0, 0);
}

uint64_t sub_100006694()
{
  uint64_t v115 = v0;
  if (qword_1000207D0 != -1) {
    swift_once();
  }
  unint64_t v1 = *(void **)(v0 + 280);
  uint64_t v2 = sub_100007F14(*(void *)(v0 + 352), (uint64_t)qword_100021520);
  *(void *)(v0 + 384) = v2;
  id v3 = v1;
  uint64_t v111 = v2;
  uint64_t v4 = sub_100018780();
  os_log_type_t v5 = sub_100018940();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(void **)(v0 + 280);
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    *(void *)(v0 + 272) = v7;
    id v10 = v7;
    sub_100018990();
    *uint64_t v9 = v7;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Context: %@", v8, 0xCu);
    sub_100007FF8(&qword_100020AE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v11 = *(void *)(v0 + 376);
  uint64_t v12 = *(void *)(v0 + 352);
  uint64_t v13 = *(void *)(v0 + 360);
  sub_100018770();
  char v14 = sub_100009178();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  v15(v11, v111, v12);
  uint64_t v16 = sub_100018780();
  os_log_type_t v17 = sub_100018940();
  if (os_log_type_enabled(v16, v17))
  {
    unint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v112 = swift_slowAlloc();
    *(_DWORD *)unint64_t v18 = 136315138;
    sub_1000189F0(28);
    swift_bridgeObjectRelease();
    uint64_t v113 = 0xD00000000000001ALL;
    unint64_t v114 = 0x80000001000198C0;
    uint64_t v19 = 8 * v14;
    v117._countAndFlagsBits = *(void *)&aInvalid_2[v19];
    uint64_t v104 = *(void *)(v0 + 360);
    uint64_t v105 = *(void *)(v0 + 352);
    id v106 = *(id *)(v0 + 376);
    v117._object = *(void **)((char *)&unk_100019220 + v19);
    sub_100018870(v117);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 264) = sub_100012718(0xD00000000000001ALL, 0x80000001000198C0, &v112);
    sub_100018990();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Access level: %s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v20 = *(void (**)(id, uint64_t))(v104 + 8);
    v20(v106, v105);
  }
  else
  {
    uint64_t v21 = *(void **)(v0 + 376);
    uint64_t v22 = *(void *)(v0 + 352);
    uint64_t v23 = *(void *)(v0 + 360);

    uint64_t v20 = *(void (**)(id, uint64_t))(v23 + 8);
    v20(v21, v22);
  }
  uint64_t v24 = *(void *)(v0 + 368);
  uint64_t v25 = *(void *)(v0 + 352);
  id v26 = *(id *)(v0 + 280);
  sub_100018760();
  uint64_t v28 = v27;

  swift_bridgeObjectRelease();
  v15(v24, v111, v25);
  v29 = sub_100018780();
  os_log_type_t v30 = sub_100018940();
  BOOL v31 = os_log_type_enabled(v29, v30);
  v32 = *(void **)(v0 + 368);
  uint64_t v33 = *(void *)(v0 + 352);
  if (v31)
  {
    v108 = *(void **)(v0 + 368);
    uint64_t v110 = v28;
    v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v112 = swift_slowAlloc();
    *(_DWORD *)v34 = 136315138;
    uint64_t v113 = 0;
    unint64_t v114 = 0xE000000000000000;
    sub_1000189F0(22);
    swift_bridgeObjectRelease();
    uint64_t v113 = 0xD000000000000014;
    unint64_t v114 = 0x80000001000198A0;
    if (v110) {
      v35._countAndFlagsBits = 0x63696D616E7944;
    }
    else {
      v35._countAndFlagsBits = 0x636974617453;
    }
    if (v110) {
      v36 = (void *)0xE700000000000000;
    }
    else {
      v36 = (void *)0xE600000000000000;
    }
    v35._object = v36;
    sub_100018870(v35);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 256) = sub_100012718(v113, v114, &v112);
    sub_100018990();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "MLHost Task Type: %s", v34, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v20(v108, v33);
    if (v110) {
      goto LABEL_17;
    }
LABEL_20:
    id v47 = objc_allocWithZone((Class)sub_100018720());
    goto LABEL_24;
  }

  v20(v32, v33);
  if (!v28) {
    goto LABEL_20;
  }
LABEL_17:
  sub_100018760();
  if (v37)
  {
    uint64_t v38 = *(void *)(v0 + 336);
    uint64_t v39 = *(void *)(v0 + 312);
    uint64_t v40 = *(void *)(v0 + 320);
    uint64_t v41 = *(void *)(v0 + 296);
    uint64_t v42 = *(void *)(v0 + 304);
    uint64_t v43 = *(void *)(v0 + 288);
    sub_100018640();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 144) = 0x6574656D61726170;
    *(void *)(v0 + 152) = 0xEF6E6F736A2E7372;
    (*(void (**)(uint64_t, void, uint64_t))(v41 + 104))(v42, enum case for URL.DirectoryHint.notDirectory(_:), v43);
    sub_100007F4C();
    sub_100018670();
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v42, v43);
    swift_bridgeObjectRelease();
    v44 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
    *(void *)(v0 + 392) = v44;
    *(void *)(v0 + 400) = (v40 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v44(v38, v39);
    uint64_t v45 = sub_1000186A0();
    *(void *)(v0 + 408) = v45;
    *(void *)(v0 + 416) = v46;
    uint64_t v53 = v45;
    unint64_t v54 = v46;
    v55 = self;
    Class isa = sub_1000186E0().super.isa;
    *(void *)(v0 + 192) = 0;
    id v57 = [v55 JSONObjectWithData:isa options:16 error:v0 + 192];

    v58 = *(void **)(v0 + 192);
    if (v57)
    {
      id v59 = v58;
      sub_1000189B0();
      swift_unknownObjectRelease();
      sub_100007FF8(&qword_100020850);
      if (swift_dynamicCast())
      {
        id v107 = v55;
        uint64_t v60 = *(void *)(v0 + 176);
        swift_bridgeObjectRetain_n();
        v61 = sub_100018780();
        os_log_type_t v62 = sub_100018940();
        v109 = v44;
        if (os_log_type_enabled(v61, v62))
        {
          v63 = (uint8_t *)swift_slowAlloc();
          uint64_t v113 = swift_slowAlloc();
          *(_DWORD *)v63 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v64 = sub_100018820();
          unint64_t v66 = v65;
          swift_bridgeObjectRelease();
          *(void *)(v0 + 248) = sub_100012718(v64, v66, &v113);
          sub_100018990();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v61, v62, "Config JSON: %s", v63, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }

        if (*(void *)(v60 + 16) && (unint64_t v76 = sub_100012D70(0x617261506B736174, 0xEE0073726574656DLL), (v77 & 1) != 0))
        {
          sub_10000807C(*(void *)(v60 + 56) + 32 * v76, v0 + 112);
        }
        else
        {
          *(_OWORD *)(v0 + 112) = 0u;
          *(_OWORD *)(v0 + 128) = 0u;
        }
        swift_bridgeObjectRelease();
        if (*(void *)(v0 + 136))
        {
          if (swift_dynamicCast())
          {
            v78 = (void **)(v0 + 184);
            unint64_t v79 = *(void *)(v0 + 160);
            unint64_t v80 = *(void *)(v0 + 168);
            swift_bridgeObjectRetain_n();
            v81 = sub_100018780();
            os_log_type_t v82 = sub_100018940();
            if (os_log_type_enabled(v81, v82))
            {
              v83 = (uint8_t *)swift_slowAlloc();
              uint64_t v113 = swift_slowAlloc();
              *(_DWORD *)v83 = 136315138;
              swift_bridgeObjectRetain();
              *(void *)(v0 + 240) = sub_100012718(v79, v80, &v113);
              sub_100018990();
              swift_bridgeObjectRelease_n();
              _os_log_impl((void *)&_mh_execute_header, v81, v82, "Task Parameters JSON-String: %s", v83, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              v78 = (void **)(v0 + 184);
              swift_slowDealloc();
            }
            else
            {
              swift_bridgeObjectRelease_n();
            }

            uint64_t v88 = sub_100004A7C(v79, v80);
            unint64_t v90 = v89;
            Class v91 = sub_1000186E0().super.isa;
            sub_100007FA0(v88, v90);
            *v78 = 0;
            id v92 = [v107 JSONObjectWithData:v91 options:16 error:v78];

            v93 = *v78;
            if (v92)
            {
              id v94 = v93;
              sub_1000189B0();
              swift_unknownObjectRelease();
              if (swift_dynamicCast())
              {
                uint64_t v95 = *(void *)(v0 + 200);
                if (*(void *)(v95 + 16)
                  && (unint64_t v96 = sub_100012D70(0xD000000000000015, 0x8000000100019880), (v97 & 1) != 0))
                {
                  sub_10000807C(*(void *)(v95 + 56) + 32 * v96, v0 + 16);
                }
                else
                {
                  *(_OWORD *)(v0 + 16) = 0u;
                  *(_OWORD *)(v0 + 32) = 0u;
                }
                swift_bridgeObjectRelease();
                if (*(void *)(v0 + 40))
                {
                  sub_100007FF8((uint64_t *)&unk_100020860);
                  if (swift_dynamicCast())
                  {
                    uint64_t v99 = *(void *)(v0 + 216);
                    objc_allocWithZone((Class)type metadata accessor for FedStatsPluginMLHostClient());
                    v100 = (void *)swift_task_alloc();
                    *(void *)(v0 + 424) = v100;
                    void *v100 = v0;
                    v100[1] = sub_100007894;
                    return sub_10000CD1C(2, v99);
                  }
                }
                else
                {
                  sub_1000080E8(v0 + 16, &qword_100020858);
                }
                v84 = sub_100018780();
                os_log_type_t v85 = sub_100018950();
                if (!os_log_type_enabled(v84, v85)) {
                  goto LABEL_67;
                }
                v86 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v86 = 0;
                goto LABEL_66;
              }
            }
            else
            {
              id v98 = v93;
              sub_100018610();

              swift_willThrow();
              swift_errorRelease();
            }
            v84 = sub_100018780();
            os_log_type_t v85 = sub_100018950();
            if (os_log_type_enabled(v84, v85))
            {
              v86 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v86 = 0;
              v87 = "Task parameters string not a JSON string";
              goto LABEL_66;
            }
            goto LABEL_67;
          }
        }
        else
        {
          sub_1000080E8(v0 + 112, &qword_100020858);
        }
        v84 = sub_100018780();
        os_log_type_t v85 = sub_100018950();
        if (os_log_type_enabled(v84, v85))
        {
          v86 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v86 = 0;
          v87 = "No task parameters string inside config";
LABEL_66:
          _os_log_impl((void *)&_mh_execute_header, v84, v85, v87, v86, 2u);
          swift_slowDealloc();
        }
LABEL_67:
        uint64_t v101 = *(void *)(v0 + 344);
        uint64_t v102 = *(void *)(v0 + 312);

        id v103 = objc_allocWithZone((Class)sub_100018720());
        uint64_t v52 = sub_100018710();
        sub_100007FA0(v53, v54);
        v109(v101, v102);
        goto LABEL_33;
      }
    }
    else
    {
      id v67 = v58;
      sub_100018610();

      swift_willThrow();
      swift_errorRelease();
    }
    v68 = sub_100018780();
    os_log_type_t v69 = sub_100018950();
    if (os_log_type_enabled(v68, v69))
    {
      v70 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v70 = 0;
      _os_log_impl((void *)&_mh_execute_header, v68, v69, "Error when deserializing JSON", v70, 2u);
      swift_slowDealloc();
    }
    uint64_t v71 = *(void *)(v0 + 344);
    uint64_t v72 = *(void *)(v0 + 312);

    id v73 = objc_allocWithZone((Class)sub_100018720());
    uint64_t v52 = sub_100018710();
    sub_100007FA0(v53, v54);
    v44(v71, v72);
    goto LABEL_33;
  }
  v48 = sub_100018780();
  os_log_type_t v49 = sub_100018950();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v50 = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "No task folder from task", v50, 2u);
    swift_slowDealloc();
  }

  id v51 = objc_allocWithZone((Class)sub_100018720());
LABEL_24:
  uint64_t v52 = sub_100018710();
LABEL_33:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v74 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v74(v52);
}

uint64_t sub_100007894(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 432) = a1;
  *(void *)(v3 + 440) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_100007CAC;
  }
  else {
    uint64_t v4 = sub_1000079D4;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_1000079D4()
{
  uint64_t v19 = v0;
  id v1 = [self runAllRecipesWithAssetProvider:v0[54]];
  sub_10000803C();
  sub_100018810();

  swift_bridgeObjectRetain();
  uint64_t v2 = sub_100018780();
  os_log_type_t v3 = sub_100018940();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100018820();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    v0[29] = sub_100012718(v5, v7, &v18);
    sub_100018990();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Recorded the following record counts in experiments: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v8 = (void *)v0[54];
  uint64_t v10 = v0[51];
  unint64_t v9 = v0[52];
  uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[49];
  uint64_t v12 = v0[43];
  uint64_t v13 = v0[39];
  id v14 = objc_allocWithZone((Class)sub_100018720());
  uint64_t v15 = sub_100018710();
  sub_100007FA0(v10, v9);

  v11(v12, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(uint64_t))v0[1];
  return v16(v15);
}

uint64_t sub_100007CAC()
{
  swift_errorRetain();
  swift_errorRetain();
  id v1 = sub_100018780();
  os_log_type_t v2 = sub_100018950();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[28] = v5;
    sub_100018990();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Cannot create MLHost client: %@", v3, 0xCu);
    sub_100007FF8(&qword_100020AE0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v7 = v0[51];
  unint64_t v6 = v0[52];
  uint64_t v8 = (void (*)(uint64_t, uint64_t))v0[49];
  uint64_t v9 = v0[43];
  uint64_t v10 = v0[39];

  id v11 = objc_allocWithZone((Class)sub_100018720());
  uint64_t v12 = sub_100018710();
  sub_100007FA0(v7, v6);
  swift_errorRelease();
  v8(v9, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(uint64_t))v0[1];
  return v13(v12);
}

uint64_t sub_100007F14(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100007F4C()
{
  unint64_t result = qword_100020848;
  if (!qword_100020848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020848);
  }
  return result;
}

uint64_t sub_100007FA0(uint64_t a1, unint64_t a2)
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

uint64_t sub_100007FF8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000803C()
{
  unint64_t result = qword_100020870;
  if (!qword_100020870)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100020870);
  }
  return result;
}

uint64_t sub_10000807C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_1000080D8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000080E8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100007FF8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_100008144@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  unint64_t result = sub_10000604C((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_100008270, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_1000081B0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100007FA0(a1, a2);
  }
  return a1;
}

uint64_t sub_1000081C4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_1000081DC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100008220(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008270@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_100006170(a1, a2);
}

uint64_t sub_100008290(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007FF8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000082F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FedStatsPluginCKExperimentRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for FedStatsPluginTaskType(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FedStatsPluginTaskType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FedStatsPluginTaskType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000084C8);
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

uint64_t sub_1000084F0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000084F8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FedStatsPluginTaskType()
{
  return &type metadata for FedStatsPluginTaskType;
}

uint64_t sub_100008510()
{
  uint64_t v0 = sub_1000187A0();
  sub_100009298(v0, qword_100021520);
  sub_100007F14(v0, (uint64_t)qword_100021520);
  return sub_100018790();
}

uint64_t sub_100008590()
{
  uint64_t result = os_variant_has_internal_content();
  uint64_t v1 = 19783;
  if (result) {
    uint64_t v1 = 0x7972726163;
  }
  unint64_t v2 = 0xE200000000000000;
  if (result) {
    unint64_t v2 = 0xE500000000000000;
  }
  qword_100021538 = v1;
  unk_100021540 = v2;
  return result;
}

void sub_1000085E0()
{
  sub_1000189F0(31);
  swift_bridgeObjectRelease();
  if (qword_1000207D8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_100021538;
  uint64_t v1 = (void *)unk_100021540;
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = v0;
  v4._object = v1;
  sub_100018870(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0x6E6961746E6F632ELL;
  v5._object = (void *)0xEA00000000007265;
  sub_100018870(v5);
  NSString v2 = sub_100018840();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(self, "containerWithIdentifier:", v2, 0xD000000000000013, 0x80000001000198E0);

  qword_100021548 = (uint64_t)v3;
}

id sub_10000870C()
{
  if (qword_1000207E0 != -1) {
    swift_once();
  }
  id result = [(id)qword_100021548 publicCloudDatabase];
  qword_100021550 = (uint64_t)result;
  return result;
}

void sub_100008774()
{
  id v0 = [objc_allocWithZone((Class)CKOperationGroup) init];
  NSString v1 = sub_100018840();
  [v0 setName:v1];

  qword_100021558 = (uint64_t)v0;
}

id sub_1000087E8()
{
  id v0 = [objc_allocWithZone((Class)CKOperationConfiguration) init];
  [v0 setPreferAnonymousRequests:1];
  [v0 setQualityOfService:9];
  if (qword_1000207E0 != -1) {
    swift_once();
  }
  id result = [v0 setContainer:qword_100021548];
  qword_100021560 = (uint64_t)v0;
  return result;
}

void sub_100008894()
{
  qword_100021568 = 0x746E65746E6F63;
  qword_100021570 = 0xE700000000000000;
}

void sub_1000088B8()
{
  qword_100021578 = 0x656D686361747461;
  qword_100021580 = 0xEF70614D4449746ELL;
}

uint64_t sub_1000088E8(char a1)
{
  return *(void *)&aInvalid_3[8 * a1];
}

uint64_t sub_100008908(char *a1, char *a2)
{
  return sub_100008914(*a1, *a2);
}

uint64_t sub_100008914(char a1, char a2)
{
  if (*(void *)&aInvalid_3[8 * a1] == *(void *)&aInvalid_3[8 * a2] && qword_1000193E0[a1] == qword_1000193E0[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_100018AE0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_10000899C(char a1, char a2)
{
  if (*(void *)&aInvalid_4[8 * a1] == *(void *)&aInvalid_4[8 * a2] && qword_1000193B0[a1] == qword_1000193B0[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_100018AE0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_100008A24(char a1, char a2)
{
  if (*(void *)&aInvalid_5[8 * a1] == *(void *)&aInvalid_5[8 * a2]
    && *(void *)&aRecipeinrecipe[8 * a1 + 16] == *(void *)&aRecipeinrecipe[8 * a2 + 16])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_100018AE0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_100008AAC(char a1, char a2)
{
  if (*(void *)&aInvalid_6[8 * a1] == *(void *)&aInvalid_6[8 * a2] && qword_100019348[a1] == qword_100019348[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_100018AE0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int sub_100008B34()
{
  return sub_100008B3C();
}

Swift::Int sub_100008B3C()
{
  return sub_100018B20();
}

Swift::Int sub_100008BA8()
{
  return sub_100018B20();
}

Swift::Int sub_100008C14()
{
  return sub_100018B20();
}

Swift::Int sub_100008C80()
{
  return sub_100018B20();
}

uint64_t sub_100008CEC()
{
  return sub_100008CF4();
}

uint64_t sub_100008CF4()
{
  sub_100018860();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100008D48()
{
  sub_100018860();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100008D9C()
{
  sub_100018860();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100008DF0()
{
  sub_100018860();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100008E44()
{
  return sub_100008F84();
}

Swift::Int sub_100008E4C()
{
  return sub_100018B20();
}

Swift::Int sub_100008EB4()
{
  return sub_100018B20();
}

Swift::Int sub_100008F1C()
{
  return sub_100018B20();
}

Swift::Int sub_100008F84()
{
  return sub_100018B20();
}

uint64_t sub_100008FEC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000924C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_10000901C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000088E8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100009048(uint64_t a1, uint64_t a2)
{
  return sub_1000090D4(a1, a2, 22, 0xD000000000000014, (void *)0x80000001000198A0, (uint64_t (*)(uint64_t))sub_1000088E8);
}

unint64_t sub_100009080()
{
  unint64_t result = qword_100020930;
  if (!qword_100020930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020930);
  }
  return result;
}

uint64_t sub_1000090D4(uint64_t a1, uint64_t a2, Swift::Int a3, uint64_t a4, void *a5, uint64_t (*a6)(uint64_t))
{
  uint64_t v10 = *v6;
  sub_1000189F0(a3);
  v12._countAndFlagsBits = a4;
  v12._object = a5;
  sub_100018870(v12);
  v13._countAndFlagsBits = a6(v10);
  sub_100018870(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 0;
  v14._object = (void *)0xE000000000000000;
  sub_100018870(v14);
  return 0;
}

uint64_t sub_100009178()
{
  v2._countAndFlagsBits = 0xD00000000000002ALL;
  v2._object = (void *)0x8000000100019900;
  if (sub_1000188D0(v2))
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v3._object = (void *)0x8000000100019930;
    v3._countAndFlagsBits = 0xD000000000000030;
    if (sub_1000188D0(v3))
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v4._object = (void *)0x8000000100019970;
      v4._countAndFlagsBits = 0xD000000000000030;
      BOOL v1 = sub_1000188D0(v4);
      swift_bridgeObjectRelease();
      if (v1) {
        return 3;
      }
      else {
        return 0;
      }
    }
  }
}

uint64_t sub_10000924C(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10001C968;
  v6._object = a2;
  unint64_t v4 = sub_100018AC0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t *sub_100009298(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void *sub_1000092FC(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v39 = *a2;
    *a1 = *a2;
    a1 = (void *)(v39 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1000186F0();
    int v8 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((void *)((char *)a1 + a3[5]), (void *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[6];
    uint64_t v10 = a3[7];
    uint64_t v11 = (void *)((char *)a1 + v9);
    Swift::String v12 = (void *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    Swift::String v14 = (void *)((char *)a1 + v10);
    uint64_t v15 = (void *)((char *)a2 + v10);
    uint64_t v16 = v15[1];
    *Swift::String v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = a3[9];
    *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    uint64_t v18 = (void *)((char *)a1 + v17);
    uint64_t v19 = (void *)((char *)a2 + v17);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = a3[10];
    uint64_t v22 = a3[11];
    uint64_t v23 = (void *)((char *)a1 + v21);
    uint64_t v24 = (void *)((char *)a2 + v21);
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
    id v26 = (void *)((char *)a1 + v22);
    uint64_t v27 = (void *)((char *)a2 + v22);
    uint64_t v28 = v27[1];
    *id v26 = *v27;
    v26[1] = v28;
    uint64_t v29 = a3[13];
    *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
    *((unsigned char *)a1 + v29) = *((unsigned char *)a2 + v29);
    uint64_t v30 = a3[14];
    BOOL v31 = (void *)((char *)a1 + v30);
    v32 = (void *)((char *)a2 + v30);
    uint64_t v33 = *v32;
    unint64_t v34 = v32[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1000094C8(v33, v34);
    *BOOL v31 = v33;
    v31[1] = v34;
    uint64_t v35 = a3[15];
    v36 = (void *)((char *)a1 + v35);
    uint64_t v37 = (void *)((char *)a2 + v35);
    uint64_t v38 = v37[1];
    void *v36 = *v37;
    v36[1] = v38;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1000094C8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_100009520(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000186F0();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100007FA0(*(void *)(a1 + *(int *)(a2 + 56)), *(void *)(a1 + *(int *)(a2 + 56) + 8));

  return swift_bridgeObjectRelease();
}

uint64_t sub_100009624(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000186F0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a3[7];
  uint64_t v10 = (void *)(a1 + v8);
  uint64_t v11 = (void *)(a2 + v8);
  uint64_t v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = (void *)(a1 + v9);
  Swift::String v14 = (void *)(a2 + v9);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a3[10];
  uint64_t v21 = a3[11];
  uint64_t v22 = (void *)(a1 + v20);
  uint64_t v23 = (void *)(a2 + v20);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = (void *)(a1 + v21);
  id v26 = (void *)(a2 + v21);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  uint64_t v28 = a3[13];
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  *(unsigned char *)(a1 + v28) = *(unsigned char *)(a2 + v28);
  uint64_t v29 = a3[14];
  uint64_t v30 = (uint64_t *)(a1 + v29);
  BOOL v31 = (uint64_t *)(a2 + v29);
  uint64_t v32 = *v31;
  unint64_t v33 = v31[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000094C8(v32, v33);
  *uint64_t v30 = v32;
  v30[1] = v33;
  uint64_t v34 = a3[15];
  uint64_t v35 = (void *)(a1 + v34);
  v36 = (void *)(a2 + v34);
  uint64_t v37 = v36[1];
  *uint64_t v35 = *v36;
  v35[1] = v37;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000097A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000186F0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v14 = a3[9];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  void *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[10];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[11];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  uint64_t v23 = a3[14];
  uint64_t v24 = (uint64_t *)(a1 + v23);
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v26 = *v25;
  unint64_t v27 = v25[1];
  sub_1000094C8(*v25, v27);
  uint64_t v28 = *v24;
  unint64_t v29 = v24[1];
  *uint64_t v24 = v26;
  v24[1] = v27;
  sub_100007FA0(v28, v29);
  uint64_t v30 = a3[15];
  BOOL v31 = (void *)(a1 + v30);
  uint64_t v32 = (void *)(a2 + v30);
  *BOOL v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10000998C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000186F0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  uint64_t v10 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  uint64_t v11 = a3[13];
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[15];
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  return a1;
}

uint64_t sub_100009A88(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_1000186F0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  void *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[10];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  *uint64_t v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[11];
  unint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (uint64_t *)(a2 + v28);
  uint64_t v32 = *v30;
  uint64_t v31 = v30[1];
  void *v29 = v32;
  v29[1] = v31;
  swift_bridgeObjectRelease();
  uint64_t v33 = a3[13];
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  *(unsigned char *)(a1 + v33) = *(unsigned char *)(a2 + v33);
  uint64_t v34 = a3[14];
  uint64_t v35 = *(void *)(a1 + v34);
  unint64_t v36 = *(void *)(a1 + v34 + 8);
  *(_OWORD *)(a1 + v34) = *(_OWORD *)(a2 + v34);
  sub_100007FA0(v35, v36);
  uint64_t v37 = a3[15];
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = (uint64_t *)(a2 + v37);
  uint64_t v41 = *v39;
  uint64_t v40 = v39[1];
  *uint64_t v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100009BFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009C10);
}

uint64_t sub_100009C10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000186F0();
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
    return (v10 + 1);
  }
}

uint64_t sub_100009CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100009CE8);
}

uint64_t sub_100009CE8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000186F0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for FedStatsPluginCKExperimentRecord()
{
  uint64_t result = qword_100020998;
  if (!qword_100020998) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100009DF4()
{
  uint64_t result = sub_1000186F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_100009EB4(char a1)
{
  sub_1000189F0(27);
  swift_bridgeObjectRelease();
  uint64_t v2 = 8 * a1;
  v4._countAndFlagsBits = *(void *)&aInvalid_7[v2];
  v4._object = *(void **)((char *)&unk_100019788 + v2);
  sub_100018870(v4);
  swift_bridgeObjectRelease();
  return 0xD000000000000019;
}

uint64_t sub_100009F48(char a1)
{
  return *(void *)&aInvalid_7[8 * a1];
}

uint64_t sub_100009F68(char *a1, char *a2)
{
  return sub_100008AAC(*a1, *a2);
}

Swift::Int sub_100009F74()
{
  return sub_100008BA8();
}

uint64_t sub_100009F7C()
{
  return sub_100008DF0();
}

Swift::Int sub_100009F84()
{
  return sub_100008E4C();
}

uint64_t sub_100009F8C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000B6FC(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_100009FBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009F48(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100009FE8()
{
  return sub_100009EB4(*v0);
}

unint64_t sub_100009FF0(char a1)
{
  sub_1000189F0(23);
  swift_bridgeObjectRelease();
  uint64_t v2 = 8 * a1;
  v4._countAndFlagsBits = *(void *)&aInvalid_8[v2];
  v4._object = *(void **)((char *)&unk_1000197C0 + v2);
  sub_100018870(v4);
  swift_bridgeObjectRelease();
  return 0xD000000000000015;
}

uint64_t sub_10000A084(char a1)
{
  return *(void *)&aInvalid_8[8 * a1];
}

uint64_t sub_10000A0A4(char *a1, char *a2)
{
  return sub_10000899C(*a1, *a2);
}

Swift::Int sub_10000A0B0()
{
  return sub_100008C14();
}

uint64_t sub_10000A0B8()
{
  return sub_100008D48();
}

Swift::Int sub_10000A0C0()
{
  return sub_100008F1C();
}

uint64_t sub_10000A0C8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &off_10001C880;
  uint64_t result = sub_10000BB00(*(void *)a1, *(void **)(a1 + 8), v3);
  *a2 = result;
  return result;
}

uint64_t sub_10000A100@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000A084(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10000A12C()
{
  return sub_100009FF0(*v0);
}

unint64_t sub_10000A134(char a1)
{
  sub_1000189F0(46);
  swift_bridgeObjectRelease();
  uint64_t v2 = 8 * a1;
  v4._countAndFlagsBits = *(void *)&aInvalid_9[v2];
  v4._object = *(void **)&aRecipeinrecipe_0[v2 + 16];
  sub_100018870(v4);
  swift_bridgeObjectRelease();
  return 0xD00000000000002CLL;
}

uint64_t sub_10000A1C8(char a1)
{
  return *(void *)&aInvalid_9[8 * a1];
}

uint64_t sub_10000A1E8(char *a1, char *a2)
{
  return sub_100008A24(*a1, *a2);
}

Swift::Int sub_10000A1F4()
{
  return sub_100008C80();
}

uint64_t sub_10000A1FC()
{
  return sub_100008D9C();
}

Swift::Int sub_10000A204()
{
  return sub_100008EB4();
}

uint64_t sub_10000A20C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  v3._rawValue = &off_10001C9D0;
  uint64_t result = sub_10000BB00(*(void *)a1, *(void **)(a1 + 8), v3);
  *a2 = result;
  return result;
}

uint64_t sub_10000A244@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000A1C8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10000A270()
{
  return sub_10000A134(*v0);
}

void sub_10000A278()
{
  qword_100021588 = 0x656D697265707845;
  unk_100021590 = 0xEA0000000000746ELL;
}

void sub_10000A2A0(void *a1@<X0>, char *a2@<X8>)
{
  v157 = a2;
  uint64_t v4 = sub_100007FF8(&qword_1000209F8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v140 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v140 - v8;
  uint64_t v10 = sub_1000186F0();
  uint64_t v160 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  v158 = (char *)&v140 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v140 - v13;
  uint64_t v15 = sub_100018980();
  uint64_t v17 = v16;
  if (qword_100020810 != -1) {
    swift_once();
  }
  if (v15 == qword_100021588 && v17 == unk_100021590)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v18 = sub_100018AE0();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
    {
      uint64_t v161 = 0;
      v162 = (void *)0xE000000000000000;
      sub_1000189F0(41);
      swift_bridgeObjectRelease();
      uint64_t v161 = 0xD00000000000001FLL;
      v162 = (void *)0x80000001000199D0;
      uint64_t v65 = qword_100021588;
      unint64_t v66 = (void *)unk_100021590;
      swift_bridgeObjectRetain();
      v164._countAndFlagsBits = v65;
      v164._object = v66;
      sub_100018870(v164);
      swift_bridgeObjectRelease();
      id v67 = self;
      v165._countAndFlagsBits = 0x20746F67202CLL;
      v165._object = (void *)0xE600000000000000;
      sub_100018870(v165);
      v166._countAndFlagsBits = sub_100018980();
      sub_100018870(v166);
      swift_bridgeObjectRelease();
      NSString v68 = sub_100018840();
      swift_bridgeObjectRelease();
      [v67 errorWithCode:300 description:v68];

      swift_willThrow();
      return;
    }
  }
  id v159 = a1;
  id v19 = [a1 values];
  uint64_t v20 = sub_100007FF8(&qword_100020A60);
  uint64_t v21 = sub_100018810();

  if (!*(void *)(v21 + 16) || (unint64_t v22 = sub_100012D70(0x61645F7472617473, 0xEE00656D69746574), (v23 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v160 + 56))(v9, 1, 1, v10);
    goto LABEL_25;
  }
  uint64_t v154 = v2;
  v156 = v14;
  uint64_t v24 = *(void *)(*(void *)(v21 + 56) + 8 * v22);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v161 = v24;
  int v25 = swift_dynamicCast();
  uint64_t v26 = v160;
  uint64_t v27 = v10;
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v160 + 56);
  v28(v9, v25 ^ 1u, 1, v27);
  unint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  if (v29(v9, 1, v27) == 1)
  {
LABEL_25:
    sub_10000B69C((uint64_t)v9);
    v63 = self;
    NSString v64 = sub_100018840();
    [v63 errorWithCode:300 description:v64];

    swift_willThrow();
    return;
  }
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
  uint64_t v155 = v27;
  v151 = v30;
  uint64_t v152 = v26 + 32;
  v30(v156, v9, v27);
  id v31 = [v159 values];
  unint64_t v153 = v20;
  uint64_t v32 = sub_100018810();

  if (!*(void *)(v32 + 16) || (unint64_t v33 = sub_100012D70(0x657461645F646E65, 0xEC000000656D6974), (v34 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    uint64_t v69 = v155;
    v28(v7, 1, 1, v155);
    uint64_t v38 = v69;
    goto LABEL_28;
  }
  uint64_t v35 = *(void *)(*(void *)(v32 + 56) + 8 * v33);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v161 = v35;
  uint64_t v36 = v155;
  int v37 = swift_dynamicCast();
  v28(v7, v37 ^ 1u, 1, v36);
  uint64_t v38 = v36;
  if (v29(v7, 1, v36) == 1)
  {
LABEL_28:
    sub_10000B69C((uint64_t)v7);
    v70 = self;
    NSString v71 = sub_100018840();
    [v70 errorWithCode:300 description:v71];

    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v160 + 8))(v156, v38);
    return;
  }
  uint64_t v39 = v158;
  v151(v158, v7, v36);
  id v40 = [v159 values];
  uint64_t v41 = sub_100018810();

  uint64_t v42 = v156;
  if (!*(void *)(v41 + 16) || (unint64_t v43 = sub_100012D70(0x656D697265707865, 0xED000064695F746ELL), (v44 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  uint64_t v45 = *(void *)(*(void *)(v41 + 56) + 8 * v43);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v163 = v45;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_30:
    uint64_t v72 = self;
    NSString v73 = sub_100018840();
    [v72 errorWithCode:300 description:v73];

    swift_willThrow();
    v74 = *(void (**)(char *, uint64_t))(v160 + 8);
    v74(v39, v38);
LABEL_31:
    v74(v42, v38);
    return;
  }
  uint64_t v47 = v161;
  uint64_t v46 = (uint64_t)v162;
  id v48 = [v159 values];
  uint64_t v49 = sub_100018810();

  if (!*(void *)(v49 + 16) || (unint64_t v50 = sub_100012D70(0x656D796F6C706564, 0xED000064695F746ELL), (v51 & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_33:
    swift_bridgeObjectRelease();
    v75 = self;
    NSString v76 = sub_100018840();
    id v77 = [v75 errorWithCode:300 description:v76];
LABEL_34:
    v77;

    swift_willThrow();
    v74 = *(void (**)(char *, uint64_t))(v160 + 8);
    v74(v158, v38);
    goto LABEL_31;
  }
  uint64_t v52 = *(void *)(*(void *)(v49 + 56) + 8 * v50);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v163 = v52;
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_33;
  }
  uint64_t v54 = v161;
  uint64_t v53 = (uint64_t)v162;
  id v55 = [v159 values];
  uint64_t v56 = sub_100018810();

  if (!*(void *)(v56 + 16) || (unint64_t v57 = sub_100012D70(0x657079745F736FLL, 0xE700000000000000), (v58 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_37:
    swift_bridgeObjectRelease();
    goto LABEL_38;
  }
  uint64_t v59 = *(void *)(*(void *)(v56 + 56) + 8 * v57);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v163 = v59;
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  uint64_t v60 = v53;
  v61._rawValue = &off_10001C880;
  char v62 = sub_10000BB00(v161, v162, v61);
  if (v62 == 3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v38 = v155;
    uint64_t v42 = v156;
LABEL_38:
    v78 = self;
    NSString v76 = sub_100018840();
    id v77 = [v78 errorWithCode:300 description:v76];
    goto LABEL_34;
  }
  char v79 = v62;
  id v80 = [v159 values];
  uint64_t v81 = sub_100018810();

  if (!*(void *)(v81 + 16)) {
    goto LABEL_54;
  }
  unint64_t v82 = sub_100012D70(0x646C6975625F736FLL, 0xEC0000006E696D5FLL);
  if ((v83 & 1) == 0) {
    goto LABEL_54;
  }
  uint64_t v84 = *(void *)(*(void *)(v81 + 56) + 8 * v82);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v163 = v84;
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_55;
  }
  uint64_t v149 = v161;
  uint64_t v150 = (uint64_t)v162;
  id v85 = [v159 values];
  uint64_t v86 = sub_100018810();

  if (!*(void *)(v86 + 16)) {
    goto LABEL_58;
  }
  unint64_t v87 = sub_100012D70(0x646C6975625F736FLL, 0xEC00000078616D5FLL);
  if ((v88 & 1) == 0) {
    goto LABEL_58;
  }
  uint64_t v89 = *(void *)(*(void *)(v86 + 56) + 8 * v87);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v163 = v89;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_54:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_55;
  }
  uint64_t v147 = v161;
  uint64_t v148 = (uint64_t)v162;
  id v90 = [v159 values];
  uint64_t v91 = sub_100018810();

  if (!*(void *)(v91 + 16) || (unint64_t v92 = sub_100012D70(0x765F6E6967756C70, 0xEE00746E61697261), (v93 & 1) == 0))
  {
LABEL_53:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_55:
    swift_bridgeObjectRelease();
    v100 = self;
    NSString v101 = sub_100018840();
    [v100 errorWithCode:300 description:v101];

    swift_willThrow();
LABEL_56:
    uint64_t v102 = *(void (**)(char *, uint64_t))(v160 + 8);
    uint64_t v103 = v155;
    v102(v158, v155);
    v102(v156, v103);
    return;
  }
  uint64_t v94 = *(void *)(*(void *)(v91 + 56) + 8 * v92);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v163 = v94;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_58:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_55;
  }
  uint64_t v145 = v161;
  uint64_t v146 = (uint64_t)v162;
  id v95 = [v159 values];
  uint64_t v96 = sub_100018810();

  if (!*(void *)(v96 + 16) || (unint64_t v97 = sub_100012D70(0x6974616C75706F70, 0xEA00000000006E6FLL), (v98 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_55;
  }
  uint64_t v99 = *(void *)(*(void *)(v96 + 56) + 8 * v97);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v163 = v99;
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_53;
  }
  int v142 = sub_10000B6FC(v161, v162);
  if (v142 == 4) {
    goto LABEL_53;
  }
  id v104 = [v159 values];
  uint64_t v105 = sub_100018810();

  if (!*(void *)(v105 + 16) || (unint64_t v106 = sub_100012D70(0x657069636572, 0xE600000000000000), (v107 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_68;
  }
  uint64_t v108 = *(void *)(*(void *)(v105 + 56) + 8 * v106);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v163 = v108;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_68:
    uint64_t v143 = 0;
    unint64_t v109 = 0xC000000000000000;
    goto LABEL_69;
  }
  uint64_t v143 = v161;
  unint64_t v109 = (unint64_t)v162;
LABEL_69:
  unint64_t v144 = v109;
  id v110 = [v159 values];
  uint64_t v111 = sub_100018810();

  if (*(void *)(v111 + 16) && (unint64_t v112 = sub_100012D70(0x695F657069636572, 0xE900000000000064), (v113 & 1) != 0))
  {
    uint64_t v114 = *(void *)(*(void *)(v111 + 56) + 8 * v112);
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v163 = v114;
    if (swift_dynamicCast())
    {
      uint64_t v141 = v161;
      unint64_t v115 = (unint64_t)v162;
      goto LABEL_75;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v141 = 0;
  unint64_t v115 = 0xE000000000000000;
LABEL_75:
  unint64_t v153 = v115;
  unint64_t v116 = v144 >> 62;
  switch(v144 >> 62)
  {
    case 1uLL:
      uint64_t v117 = (int)v143;
      uint64_t v118 = v143 >> 32;
      break;
    case 2uLL:
      uint64_t v117 = *(void *)(v143 + 16);
      uint64_t v118 = *(void *)(v143 + 24);
      break;
    case 3uLL:
      uint64_t v118 = 0;
      uint64_t v117 = 0;
      break;
    default:
      uint64_t v117 = 0;
      uint64_t v118 = BYTE6(v144);
      break;
  }
  if ((v153 & 0x2000000000000000) != 0) {
    uint64_t v119 = HIBYTE(v153) & 0xF;
  }
  else {
    uint64_t v119 = v141 & 0xFFFFFFFFFFFFLL;
  }
  if ((v119 == 0) != (v117 != v118))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v120 = self;
    NSString v121 = sub_100018840();
    [v120 errorWithCode:300 description:v121];

    swift_willThrow();
    sub_100007FA0(v143, v144);
    goto LABEL_56;
  }

  LODWORD(v160) = 2;
  switch((int)v116)
  {
    case 1:
      uint64_t v123 = (int)v143;
      uint64_t v124 = v143 >> 32;
      goto LABEL_90;
    case 2:
      uint64_t v123 = *(void *)(v143 + 16);
      uint64_t v124 = *(void *)(v143 + 24);
LABEL_90:
      if (v123 == v124) {
        goto LABEL_91;
      }
      goto LABEL_87;
    case 3:
      goto LABEL_93;
    default:
      if ((v144 & 0xFF000000000000) != 0) {
LABEL_87:
      }
        int v122 = 1;
      else {
LABEL_91:
      }
        int v122 = 2;
      LODWORD(v160) = v122;
LABEL_93:
      v125 = v157;
      v126 = (void (*)(uint64_t, char *, uint64_t))v151;
      v151(v157, v156, v155);
      v127 = (int *)type metadata accessor for FedStatsPluginCKExperimentRecord();
      v126((uint64_t)&v125[v127[5]], v158, v155);
      v128 = (uint64_t *)&v125[v127[6]];
      uint64_t *v128 = v47;
      v128[1] = v46;
      v129 = (uint64_t *)&v125[v127[7]];
      uint64_t *v129 = v54;
      v129[1] = v60;
      v125[v127[8]] = v79;
      v130 = (uint64_t *)&v125[v127[10]];
      uint64_t v131 = v150;
      uint64_t *v130 = v149;
      v130[1] = v131;
      v132 = (uint64_t *)&v125[v127[9]];
      uint64_t v133 = v148;
      uint64_t *v132 = v147;
      v132[1] = v133;
      v134 = (uint64_t *)&v125[v127[11]];
      uint64_t v135 = v146;
      uint64_t *v134 = v145;
      v134[1] = v135;
      v125[v127[12]] = v142;
      v125[v127[13]] = v160;
      v136 = &v125[v127[14]];
      unint64_t v137 = v144;
      *(void *)v136 = v143;
      *((void *)v136 + 1) = v137;
      v138 = (uint64_t *)&v125[v127[15]];
      unint64_t v139 = v153;
      uint64_t *v138 = v141;
      v138[1] = v139;
      break;
  }
}

uint64_t sub_10000B69C(uint64_t a1)
{
  uint64_t v2 = sub_100007FF8(&qword_1000209F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B6FC(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_10001C8E8;
  v6._object = a2;
  unint64_t v4 = sub_100018AC0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

ValueMetadata *type metadata accessor for FedStatsPluginCKExperimentRecord.RecipeType()
{
  return &type metadata for FedStatsPluginCKExperimentRecord.RecipeType;
}

uint64_t getEnumTagSinglePayload for FedStatsPluginPopulation(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for FedStatsPluginPopulation(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x10000B8BCLL);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FedStatsPluginPopulation()
{
  return &type metadata for FedStatsPluginPopulation;
}

unsigned char *_s26FedStatsMLHostPluginClassA20FedStatsPluginOSTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000B9C0);
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

ValueMetadata *type metadata accessor for FedStatsPluginOSType()
{
  return &type metadata for FedStatsPluginOSType;
}

unint64_t sub_10000B9FC()
{
  unint64_t result = qword_100020A68;
  if (!qword_100020A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020A68);
  }
  return result;
}

unint64_t sub_10000BA54()
{
  unint64_t result = qword_100020A70;
  if (!qword_100020A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020A70);
  }
  return result;
}

unint64_t sub_10000BAAC()
{
  unint64_t result = qword_100020A78;
  if (!qword_100020A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020A78);
  }
  return result;
}

uint64_t sub_10000BB00(uint64_t a1, void *a2, Swift::OpaquePointer a3)
{
  v7._countAndFlagsBits = a1;
  v7._object = a2;
  unint64_t v5 = sub_100018AC0(a3, v7);
  swift_bridgeObjectRelease();
  if (v5 >= 3) {
    return 3;
  }
  else {
    return v5;
  }
}

uint64_t sub_10000BB50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *unint64_t v5 = v3;
  v5[1] = sub_10000BBF8;
  return CKDatabase.records(for:desiredKeys:)(a3, 0);
}

uint64_t sub_10000BBF8(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    unsigned int v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return _swift_task_switch(sub_10001857C, 0, 0);
  }
}

void sub_10000BD44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007FF8(&qword_100020A88);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = type metadata accessor for FedStatsPluginCKExperimentRecord();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned char *)(a2 + 16) & 1) == 0)
  {
    uint64_t v14 = *(void **)(a2 + 8);
    id v15 = v14;
    sub_10000A2A0(v15, v9);
    if (v2)
    {
      swift_errorRelease();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
      sub_1000080E8((uint64_t)v9, &qword_100020A88);
      if (qword_1000207D0 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_1000187A0();
      sub_100007F14(v16, (uint64_t)qword_100021520);
      id v17 = v15;
      char v18 = sub_100018780();
      os_log_type_t v19 = sub_100018940();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        uint64_t v35 = swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 136315138;
        unint64_t v33 = v20 + 4;
        id v21 = [v17 recordID];
        id v22 = [v21 recordName];

        uint64_t v23 = sub_100018850();
        unint64_t v25 = v24;

        uint64_t v34 = sub_100012718(v23, v25, &v35);
        sub_100018990();
        swift_bridgeObjectRelease();
        sub_1000183A4(v14, 0);
        sub_1000183A4(v14, 0);
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Cannot create experiment record for record '%s'", v20, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        sub_1000183A4(v14, 0);
      }
      else
      {
        sub_1000183A4(v14, 0);
        sub_1000183A4(v14, 0);
      }
    }
    else
    {
      uint64_t v32 = *(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56);
      unint64_t v33 = v14;
      v32(v9, 0, 1, v10);
      sub_1000082F4((uint64_t)v9, (uint64_t)v13);
      id v26 = [v15 recordID];
      id v27 = [v26 recordName];

      uint64_t v28 = sub_100018850();
      uint64_t v30 = v29;

      sub_100012DE8((uint64_t)v13, (uint64_t)v7);
      v32(v7, 0, 1, v10);
      sub_10000C194((uint64_t)v7, v28, v30);
      sub_1000183A4(v33, 0);
      sub_100012E4C((uint64_t)v13);
    }
  }
}

uint64_t sub_10000C194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007FF8(&qword_100020A88);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for FedStatsPluginCKExperimentRecord();
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v14 + 48))(a1, 1) == 1)
  {
    sub_1000080E8(a1, &qword_100020A88);
    sub_100012F8C(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_1000080E8((uint64_t)v10, &qword_100020A88);
  }
  else
  {
    sub_1000082F4(a1, (uint64_t)v13);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_1000142A4((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000C350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100007FF8(&qword_100020AB8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100018680();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_1000080E8(a1, &qword_100020AB8);
    sub_100013130(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_1000080E8((uint64_t)v10, &qword_100020AB8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_100014408((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000C52C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_10000C5D4;
  return CKDatabase.records(for:desiredKeys:)(a3, 0);
}

uint64_t sub_10000C5D4(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return _swift_task_switch(sub_10000C720, 0, 0);
  }
}

uint64_t sub_10000C720()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10000C744(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100007FF8(&qword_100020AB8);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v46 - v9;
  uint64_t v11 = sub_100018680();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  id v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v46 - v16;
  if (*(unsigned char *)(a2 + 16)) {
    return;
  }
  uint64_t v52 = v2;
  uint64_t v18 = *(void **)(a2 + 8);
  uint64_t v50 = a1;
  char v51 = v18;
  id v19 = v18;
  id v20 = [v19 values];
  sub_100007FF8(&qword_100020A60);
  uint64_t v21 = sub_100018810();

  if (qword_100020800 == -1)
  {
    if (!*(void *)(v21 + 16))
    {
LABEL_10:
      swift_bridgeObjectRelease();
LABEL_11:
      if (qword_1000207D0 != -1) {
        swift_once();
      }
      uint64_t v38 = sub_1000187A0();
      sub_100007F14(v38, (uint64_t)qword_100021520);
      uint64_t v39 = sub_100018780();
      os_log_type_t v40 = sub_100018940();
      if (os_log_type_enabled(v39, v40))
      {
        uint64_t v41 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v41 = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, v40, "Cannot get attachment content from asset record", v41, 2u);
        swift_slowDealloc();
      }
      sub_1000183A4(v51, 0);

      return;
    }
  }
  else
  {
    swift_once();
    if (!*(void *)(v21 + 16)) {
      goto LABEL_10;
    }
  }
  uint64_t v22 = qword_100021570;
  uint64_t v23 = qword_100021568;
  swift_bridgeObjectRetain();
  unint64_t v24 = sub_100012D70(v23, v22);
  if ((v25 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v49 = v12;
  uint64_t v26 = *(void *)(*(void *)(v21 + 56) + 8 * v24);
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  self;
  id v27 = (void *)swift_dynamicCastObjCClass();
  if (!v27)
  {
    swift_unknownObjectRelease();
    goto LABEL_11;
  }
  uint64_t v48 = v26;
  id v28 = [v27 fileURL];
  if (v28)
  {
    uint64_t v29 = v28;
    sub_100018660();

    uint64_t v30 = v49;
    uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v49 + 32);
    v47(v10, v15, v11);
    uint64_t v31 = *(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56);
    v31(v10, 0, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v10, 1, v11) != 1)
    {
      v47(v17, v10, v11);
      id v32 = [v19 recordID];
      unint64_t v33 = v31;
      id v34 = [v32 recordName];

      uint64_t v35 = sub_100018850();
      uint64_t v37 = v36;

      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v8, v17, v11);
      v33(v8, 0, 1, v11);
      sub_10000C350((uint64_t)v8, v35, v37);
      swift_unknownObjectRelease();
      sub_1000183A4(v51, 0);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v11);
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v49 + 56))(v10, 1, 1, v11);
  }
  sub_1000080E8((uint64_t)v10, &qword_100020AB8);
  if (qword_1000207D0 != -1) {
    swift_once();
  }
  uint64_t v42 = sub_1000187A0();
  sub_100007F14(v42, (uint64_t)qword_100021520);
  unint64_t v43 = sub_100018780();
  os_log_type_t v44 = sub_100018940();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v45 = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Cannot get asset URL from attachment content", v45, 2u);
    swift_slowDealloc();
  }
  swift_unknownObjectRelease();
  sub_1000183A4(v51, 0);
}

uint64_t sub_10000CD1C(char a1, uint64_t a2)
{
  *(void *)(v3 + 80) = a2;
  *(void *)(v3 + 88) = v2;
  *(unsigned char *)(v3 + 264) = a1;
  uint64_t v4 = sub_100018680();
  *(void *)(v3 + 96) = v4;
  *(void *)(v3 + 104) = *(void *)(v4 - 8);
  *(void *)(v3 + 112) = swift_task_alloc();
  *(void *)(v3 + 120) = swift_task_alloc();
  *(void *)(v3 + 128) = swift_task_alloc();
  sub_100007FF8(&qword_100020AD0);
  *(void *)(v3 + 136) = swift_task_alloc();
  *(void *)(v3 + 144) = swift_task_alloc();
  *(void *)(v3 + 152) = sub_100007FF8(&qword_100020B80);
  *(void *)(v3 + 160) = swift_task_alloc();
  *(void *)(v3 + 168) = swift_task_alloc();
  *(void *)(v3 + 176) = swift_task_alloc();
  *(void *)(v3 + 184) = swift_task_alloc();
  return _swift_task_switch(sub_10000CEC4, 0, 0);
}

uint64_t sub_10000CEC4()
{
  uint64_t v1 = *(unsigned char **)(v0 + 88);
  char v2 = *(unsigned char *)(v0 + 264);
  v1[OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_taskType] = 0;
  uint64_t v3 = OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_recipes;
  uint64_t v4 = v1;
  *(void *)&v1[v3] = sub_100005508((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v5 = OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_experimentCfgs;
  *(void *)&v4[v5] = sub_100005514((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v6 = OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_assetURLs;
  *(void *)&v4[v6] = sub_1000056FC((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v7 = OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_attachmentIDMaps;
  *(void *)&v4[v7] = sub_1000058FC((uint64_t)&_swiftEmptyArrayStorage);

  uint64_t v8 = type metadata accessor for FedStatsPluginMLHostClient();
  *(void *)(v0 + 48) = v4;
  *(void *)(v0 + 56) = v8;
  uint64_t v9 = objc_msgSendSuper2((objc_super *)(v0 + 48), "init");
  *(void *)(v0 + 192) = v9;
  v9[OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_taskType] = v2;
  uint64_t v10 = v9;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 200) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_10000D048;
  uint64_t v12 = *(void *)(v0 + 80);
  return sub_1000163E8(v12);
}

uint64_t sub_10000D048(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 208) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = sub_10000D67C;
  }
  else
  {
    *(void *)(v4 + 216) = a1;
    uint64_t v5 = sub_10000D1B8;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000D1B8()
{
  uint64_t v1 = v0[27];
  uint64_t v2 = v0[24];
  uint64_t v44 = v0[21];
  uint64_t v45 = v0[23];
  uint64_t v43 = v0[20];
  uint64_t v48 = v0[19];
  uint64_t v49 = v0[22];
  uint64_t v3 = OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_experimentCfgs;
  v0[28] = OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_experimentCfgs;
  *(void *)(v2 + v3) = v1;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v2 + v3);
  uint64_t v41 = v4 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(v4 + 64);
  int64_t v42 = (unint64_t)(63 - v6) >> 6;
  uint64_t v46 = v4;
  swift_bridgeObjectRetain_n();
  int64_t v8 = 0;
  uint64_t v9 = (char *)&_swiftEmptyArrayStorage;
  for (i = v0; ; sub_1000080E8(i[22], &qword_100020B80))
  {
    v0[29] = v9;
    char v51 = v9;
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      int64_t v50 = v8;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_24;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v42) {
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v41 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v42) {
        goto LABEL_35;
      }
      unint64_t v14 = *(void *)(v41 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v42) {
          goto LABEL_35;
        }
        unint64_t v14 = *(void *)(v41 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v42) {
            goto LABEL_35;
          }
          unint64_t v14 = *(void *)(v41 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v14 - 1) & v14;
    int64_t v50 = v15;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
LABEL_24:
    uint64_t v18 = (void *)v0[22];
    uint64_t v17 = (void *)v0[23];
    id v19 = (void *)v0[21];
    uint64_t v20 = *(void *)(v46 + 56);
    uint64_t v21 = (uint64_t *)(*(void *)(v46 + 48) + 16 * v12);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    uint64_t v24 = type metadata accessor for FedStatsPluginCKExperimentRecord();
    sub_100012DE8(v20 + *(void *)(*(void *)(v24 - 8) + 72) * v12, (uint64_t)v17 + *(int *)(v48 + 48));
    *uint64_t v17 = v22;
    *(void *)(v45 + 8) = v23;
    sub_10001821C((uint64_t)v17, (uint64_t)v18, &qword_100020B80);
    uint64_t v25 = *(int *)(v48 + 48);
    uint64_t v26 = (uint64_t)v19 + v25;
    uint64_t v27 = (uint64_t)v18 + v25;
    uint64_t v28 = *(void *)(v49 + 8);
    void *v19 = *v18;
    *(void *)(v44 + 8) = v28;
    sub_100012DE8((uint64_t)v18 + v25, (uint64_t)v19 + v25);
    int v29 = *(unsigned __int8 *)(v26 + *(int *)(v24 + 52));
    swift_bridgeObjectRetain();
    sub_100012E4C(v26);
    if (!v29)
    {
      uint64_t v9 = v51;
LABEL_28:
      int64_t v8 = v50;
      char v30 = sub_100018AE0();
      swift_bridgeObjectRelease();
      if ((v30 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_31;
    }
    uint64_t v9 = v51;
    if (v29 == 1) {
      goto LABEL_28;
    }
    swift_bridgeObjectRelease();
    int64_t v8 = v50;
LABEL_31:
    uint64_t v31 = (void *)i[20];
    uint64_t v32 = (uint64_t)v31 + *(int *)(v48 + 48);
    uint64_t v33 = *(void *)(v49 + 8);
    *uint64_t v31 = *(void *)i[22];
    *(void *)(v43 + 8) = v33;
    sub_100012DE8(v27, v32);
    id v34 = (uint64_t *)(v32 + *(int *)(v24 + 60));
    uint64_t v36 = *v34;
    uint64_t v35 = v34[1];
    swift_bridgeObjectRetain();
    sub_100012E4C(v32);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v9 = sub_100012608(0, *((void *)v9 + 2) + 1, 1, v9);
    }
    unint64_t v38 = *((void *)v9 + 2);
    unint64_t v37 = *((void *)v9 + 3);
    if (v38 >= v37 >> 1) {
      uint64_t v9 = sub_100012608((char *)(v37 > 1), v38 + 1, 1, v9);
    }
    *((void *)v9 + 2) = v38 + 1;
    uint64_t v10 = &v9[16 * v38];
    *((void *)v10 + 4) = v36;
    *((void *)v10 + 5) = v35;
LABEL_5:
    uint64_t v0 = i;
  }
  uint64_t v16 = v8 + 5;
  if (v8 + 5 < v42)
  {
    unint64_t v14 = *(void *)(v41 + 8 * v16);
    if (!v14)
    {
      while (1)
      {
        int64_t v15 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          break;
        }
        if (v15 >= v42) {
          goto LABEL_35;
        }
        unint64_t v14 = *(void *)(v41 + 8 * v15);
        ++v16;
        if (v14) {
          goto LABEL_23;
        }
      }
LABEL_39:
      __break(1u);
    }
    int64_t v15 = v8 + 5;
    goto LABEL_23;
  }
LABEL_35:
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v39 = (void *)swift_task_alloc();
  v0[30] = v39;
  *uint64_t v39 = v0;
  v39[1] = sub_10000D788;
  return sub_100016D9C((uint64_t)v9);
}

uint64_t sub_10000D67C()
{
  uint64_t v1 = *(void **)(v0 + 192);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000D788(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[31] = a1;
  v3[32] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = (void *)v3[24];
    swift_bridgeObjectRelease();

    uint64_t v5 = sub_10000D904;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_10000DA0C;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000D904()
{
  swift_task_dealloc();
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

uint64_t sub_10000DA0C()
{
  uint64_t v130 = v0;
  v125 = (_OWORD *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 248);
  uint64_t v2 = *(void *)(v0 + 192);
  uint64_t v120 = *(void *)(v0 + 144);
  uint64_t v115 = *(void *)(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v4 = *(void *)(v2 + *(void *)(v0 + 224));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1000176D4((uint64_t)&_swiftEmptyDictionarySingleton, v4, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v107 = OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_recipes;
  uint64_t v108 = v2;
  *(void *)(v2 + OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_recipes) = v5;
  swift_bridgeObjectRelease();
  int64_t v6 = 0;
  uint64_t v109 = v1 + 64;
  uint64_t v7 = -1;
  uint64_t v8 = -1 << *(unsigned char *)(v1 + 32);
  if (-v8 < 64) {
    uint64_t v7 = ~(-1 << -(char)v8);
  }
  unint64_t v9 = v7 & *(void *)(v1 + 64);
  uint64_t v10 = (void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  uint64_t v116 = v1;
  uint64_t v117 = (void (**)(void, char *, void))(v3 + 32);
  uint64_t v114 = v3;
  uint64_t v123 = (void (**)(uint64_t, uint64_t))(v3 + 8);
  int64_t v111 = (unint64_t)(63 - v8) >> 6;
  char v113 = (void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  while (1)
  {
    if (v9)
    {
      uint64_t v127 = (v9 - 1) & v9;
      unint64_t v12 = __clz(__rbit64(v9)) | (v6 << 6);
LABEL_8:
      int64_t v13 = *(char **)(v0 + 136);
      uint64_t v14 = *(void *)(v0 + 96);
      int64_t v15 = (void *)(*(void *)(v116 + 48) + 16 * v12);
      uint64_t v16 = v15[1];
      *(void *)int64_t v13 = *v15;
      *(void *)(v115 + 8) = v16;
      unint64_t v17 = *(void *)(v116 + 56) + *(void *)(v114 + 72) * v12;
      uint64_t v18 = sub_100007FF8(&qword_100020AD8);
      (*(void (**)(char *, unint64_t, uint64_t))(v114 + 16))(&v13[*(int *)(v18 + 48)], v17, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v13, 0, 1, v18);
      swift_bridgeObjectRetain();
      goto LABEL_18;
    }
    int64_t v19 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_97;
    }
    if (v19 < v111)
    {
      unint64_t v20 = *(void *)(v109 + 8 * v19);
      if (v20) {
        goto LABEL_12;
      }
      v6 += 2;
      if (v19 + 1 >= v111)
      {
        int64_t v6 = v19;
      }
      else
      {
        unint64_t v20 = *(void *)(v109 + 8 * v6);
        if (v20)
        {
          ++v19;
LABEL_12:
          uint64_t v127 = (v20 - 1) & v20;
          unint64_t v12 = __clz(__rbit64(v20)) + (v19 << 6);
          int64_t v6 = v19;
          goto LABEL_8;
        }
        if (v19 + 2 < v111)
        {
          unint64_t v20 = *(void *)(v109 + 8 * (v19 + 2));
          if (v20)
          {
            v19 += 2;
            goto LABEL_12;
          }
          int64_t v69 = v19 + 3;
          if (v19 + 3 >= v111)
          {
            int64_t v6 = v19 + 2;
          }
          else
          {
            unint64_t v20 = *(void *)(v109 + 8 * v69);
            if (v20)
            {
              v19 += 3;
              goto LABEL_12;
            }
            while (1)
            {
              int64_t v19 = v69 + 1;
              if (__OFADD__(v69, 1)) {
                goto LABEL_100;
              }
              if (v19 >= v111) {
                break;
              }
              unint64_t v20 = *(void *)(v109 + 8 * v19);
              ++v69;
              if (v20) {
                goto LABEL_12;
              }
            }
            int64_t v6 = v111 - 1;
          }
        }
      }
    }
    uint64_t v21 = *(void *)(v0 + 136);
    uint64_t v22 = sub_100007FF8(&qword_100020AD8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
    uint64_t v127 = 0;
LABEL_18:
    uint64_t v23 = *(void *)(v0 + 144);
    sub_10001821C(*(void *)(v0 + 136), v23, &qword_100020AD0);
    uint64_t v24 = sub_100007FF8(&qword_100020AD8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48))(v23, 1, v24) == 1) {
      break;
    }
    uint64_t v25 = *(uint64_t **)(v0 + 144);
    uint64_t v26 = *v25;
    unint64_t v27 = *(void *)(v120 + 8);
    (*v117)(*(void *)(v0 + 128), (char *)v25 + *(int *)(v24 + 48), *(void *)(v0 + 96));
    id v28 = [self defaultManager];
    sub_100018650(v29);
    uint64_t v31 = v30;
    *(void *)(v0 + 72) = 0;
    unsigned int v32 = [v28 removeItemAtURL:v30 error:v0 + 72];

    uint64_t v33 = *(void **)(v0 + 72);
    int64_t v126 = v6;
    if (v32)
    {
      uint64_t v34 = qword_1000207D0;
      id v35 = v33;
      if (v34 != -1) {
        swift_once();
      }
      uint64_t v36 = *(void *)(v0 + 120);
      uint64_t v37 = *(void *)(v0 + 128);
      uint64_t v38 = *(void *)(v0 + 96);
      uint64_t v39 = sub_1000187A0();
      sub_100007F14(v39, (uint64_t)qword_100021520);
      (*v10)(v36, v37, v38);
      swift_bridgeObjectRetain();
      os_log_type_t v40 = sub_100018780();
      os_log_type_t v41 = sub_100018940();
      BOOL v42 = os_log_type_enabled(v40, v41);
      uint64_t v43 = *(void *)(v0 + 120);
      uint64_t v44 = *(void *)(v0 + 128);
      uint64_t v45 = *(void *)(v0 + 96);
      if (v42)
      {
        uint64_t v46 = v26;
        uint64_t v47 = swift_slowAlloc();
        v129[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v47 = 136315394;
        swift_bridgeObjectRetain();
        *(void *)(v47 + 4) = sub_100012718(v46, v27, v129);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v47 + 12) = 2080;
        sub_1000181A0();
        uint64_t v48 = sub_100018AD0();
        *(void *)(v47 + 14) = sub_100012718(v48, v49, v129);
        swift_bridgeObjectRelease();
        int64_t v50 = *v123;
        (*v123)(v43, v45);
        _os_log_impl((void *)&_mh_execute_header, v40, v41, "Removed %s at %s", (uint8_t *)v47, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v50(v44, v45);
      }
      else
      {

        NSString v68 = *v123;
        (*v123)(v43, v45);
        swift_bridgeObjectRelease_n();
        v68(v44, v45);
      }
      uint64_t v10 = v113;
    }
    else
    {
      uint64_t v112 = v26;
      id v51 = v33;
      sub_100018610();

      swift_willThrow();
      if (qword_1000207D0 != -1) {
        swift_once();
      }
      uint64_t v52 = *(void *)(v0 + 128);
      uint64_t v53 = *(void *)(v0 + 112);
      uint64_t v54 = *(void *)(v0 + 96);
      uint64_t v55 = sub_1000187A0();
      sub_100007F14(v55, (uint64_t)qword_100021520);
      (*v10)(v53, v52, v54);
      swift_errorRetain();
      swift_bridgeObjectRetain();
      swift_errorRetain();
      uint64_t v56 = sub_100018780();
      os_log_type_t v57 = sub_100018940();
      BOOL v58 = os_log_type_enabled(v56, v57);
      uint64_t v59 = *(void *)(v0 + 128);
      uint64_t v60 = *(void *)(v0 + 112);
      uint64_t v61 = *(void *)(v0 + 96);
      if (v58)
      {
        uint64_t v110 = *(void *)(v0 + 128);
        uint64_t v62 = swift_slowAlloc();
        v63 = (void *)swift_slowAlloc();
        v129[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v62 = 136315650;
        swift_bridgeObjectRetain();
        *(void *)(v62 + 4) = sub_100012718(v112, v27, v129);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v62 + 12) = 2080;
        sub_1000181A0();
        uint64_t v64 = sub_100018AD0();
        *(void *)(v62 + 14) = sub_100012718(v64, v65, v129);
        swift_bridgeObjectRelease();
        unint64_t v66 = *v123;
        (*v123)(v60, v61);
        *(_WORD *)(v62 + 22) = 2112;
        swift_errorRetain();
        uint64_t v67 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v62 + 24) = v67;
        void *v63 = v67;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "Cannot remove %s at %s. Error: %@", (uint8_t *)v62, 0x20u);
        sub_100007FF8(&qword_100020AE0);
        swift_arrayDestroy();
        uint64_t v10 = v113;
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
        v66(v110, v61);
      }
      else
      {

        swift_errorRelease();
        swift_errorRelease();
        unint64_t v11 = *v123;
        (*v123)(v60, v61);
        swift_bridgeObjectRelease_n();
        swift_errorRelease();
        v11(v59, v61);
      }
    }
    int64_t v6 = v126;
    unint64_t v9 = v127;
  }
  swift_release();
  uint64_t v70 = *(void *)(v108 + v107);
  uint64_t v71 = v70 + 64;
  uint64_t v72 = -1;
  uint64_t v73 = -1 << *(unsigned char *)(v70 + 32);
  if (-v73 < 64) {
    uint64_t v72 = ~(-1 << -(char)v73);
  }
  unint64_t v74 = v72 & *(void *)(v70 + 64);
  int64_t v128 = (unint64_t)(63 - v73) >> 6;
  swift_bridgeObjectRetain_n();
  int64_t v75 = 0;
  uint64_t v124 = &_swiftEmptyDictionarySingleton;
  if (!v74) {
    goto LABEL_46;
  }
LABEL_45:
  unint64_t v76 = __clz(__rbit64(v74));
  v74 &= v74 - 1;
  for (unint64_t i = v76 | (v75 << 6); ; unint64_t i = __clz(__rbit64(v79)) + (v75 << 6))
  {
    uint64_t v81 = (uint64_t *)(*(void *)(v70 + 48) + 16 * i);
    uint64_t v82 = *v81;
    uint64_t v83 = v81[1];
    uint64_t v84 = *(void *)(*(void *)(v70 + 56) + 8 * i);
    uint64_t v85 = qword_100020808;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v85 == -1)
    {
      if (!*(void *)(v84 + 16)) {
        goto LABEL_80;
      }
    }
    else
    {
      swift_once();
      if (!*(void *)(v84 + 16))
      {
LABEL_80:
        uint64_t v90 = v0 + 16;
        _OWORD *v125 = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
LABEL_81:
        sub_1000080E8(v90, &qword_100020858);
LABEL_82:
        swift_bridgeObjectRelease();
        goto LABEL_83;
      }
    }
    uint64_t v86 = qword_100021580;
    uint64_t v87 = qword_100021578;
    swift_bridgeObjectRetain();
    unint64_t v88 = sub_100012D70(v87, v86);
    uint64_t v90 = v0 + 16;
    if (v89)
    {
      sub_10000807C(*(void *)(v84 + 56) + 32 * v88, (uint64_t)v125);
    }
    else
    {
      _OWORD *v125 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
    }
    swift_bridgeObjectRelease();
    if (!*(void *)(v0 + 40)) {
      goto LABEL_81;
    }
    sub_100007FF8((uint64_t *)&unk_100020BA0);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_82;
    }
    uint64_t v121 = *(void *)(v0 + 64);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v129[0] = (uint64_t)v124;
    unint64_t v92 = sub_100012D70(v82, v83);
    uint64_t v93 = v124[2];
    BOOL v94 = (v91 & 1) == 0;
    uint64_t v95 = v93 + v94;
    if (__OFADD__(v93, v94)) {
      goto LABEL_98;
    }
    if (v124[3] < v95)
    {
      char v118 = v91;
      sub_1000132EC(v95, isUniquelyReferenced_nonNull_native);
      uint64_t v124 = (void *)v129[0];
      unint64_t v96 = sub_100012D70(v82, v83);
      int v98 = v97 & 1;
      char v91 = v118;
      if ((v118 & 1) != v98) {
        goto LABEL_93;
      }
      unint64_t v92 = v96;
LABEL_77:
      uint64_t v99 = v124;
      if ((v91 & 1) == 0) {
        goto LABEL_86;
      }
      goto LABEL_78;
    }
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_77;
    }
    char v119 = v91;
    sub_100014840();
    uint64_t v99 = (void *)v129[0];
    uint64_t v124 = (void *)v129[0];
    if ((v119 & 1) == 0)
    {
LABEL_86:
      v99[(v92 >> 6) + 8] |= 1 << v92;
      v100 = (uint64_t *)(v99[6] + 16 * v92);
      uint64_t *v100 = v82;
      v100[1] = v83;
      *(void *)(v99[7] + 8 * v92) = v121;
      uint64_t v101 = v99[2];
      BOOL v78 = __OFADD__(v101, 1);
      uint64_t v102 = v101 + 1;
      if (v78) {
        goto LABEL_99;
      }
      v99[2] = v102;
      swift_bridgeObjectRetain();
      goto LABEL_88;
    }
LABEL_78:
    *(void *)(v99[7] + 8 * v92) = v121;
    swift_bridgeObjectRelease();
LABEL_88:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
LABEL_83:
    swift_bridgeObjectRelease();
    if (v74) {
      goto LABEL_45;
    }
LABEL_46:
    BOOL v78 = __OFADD__(v75++, 1);
    if (v78) {
      break;
    }
    if (v75 >= v128) {
      goto LABEL_89;
    }
    unint64_t v79 = *(void *)(v71 + 8 * v75);
    if (!v79)
    {
      int64_t v80 = v75 + 1;
      if (v75 + 1 >= v128) {
        goto LABEL_89;
      }
      unint64_t v79 = *(void *)(v71 + 8 * v80);
      if (!v79)
      {
        int64_t v80 = v75 + 2;
        if (v75 + 2 >= v128) {
          goto LABEL_89;
        }
        unint64_t v79 = *(void *)(v71 + 8 * v80);
        if (!v79)
        {
          int64_t v80 = v75 + 3;
          if (v75 + 3 >= v128) {
            goto LABEL_89;
          }
          unint64_t v79 = *(void *)(v71 + 8 * v80);
          if (!v79)
          {
            int64_t v80 = v75 + 4;
            if (v75 + 4 >= v128) {
              goto LABEL_89;
            }
            unint64_t v79 = *(void *)(v71 + 8 * v80);
            if (!v79)
            {
              int64_t v80 = v75 + 5;
              if (v75 + 5 >= v128)
              {
LABEL_89:
                uint64_t v103 = *(char **)(v0 + 192);

                swift_release();
                swift_bridgeObjectRelease();
                *(void *)&v103[OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_attachmentIDMaps] = v124;
                swift_bridgeObjectRelease();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                swift_task_dealloc();
                id v104 = *(uint64_t (**)(uint64_t))(v0 + 8);
                uint64_t v105 = *(void *)(v0 + 192);
                return v104(v105);
              }
              unint64_t v79 = *(void *)(v71 + 8 * v80);
              if (!v79)
              {
                while (1)
                {
                  int64_t v75 = v80 + 1;
                  if (__OFADD__(v80, 1)) {
                    break;
                  }
                  if (v75 >= v128) {
                    goto LABEL_89;
                  }
                  unint64_t v79 = *(void *)(v71 + 8 * v75);
                  ++v80;
                  if (v79) {
                    goto LABEL_60;
                  }
                }
LABEL_97:
                __break(1u);
LABEL_98:
                __break(1u);
LABEL_99:
                __break(1u);
LABEL_100:
                __break(1u);
              }
            }
          }
        }
      }
      int64_t v75 = v80;
    }
LABEL_60:
    unint64_t v74 = (v79 - 1) & v79;
  }
  __break(1u);
LABEL_93:
  return sub_100018B00();
}

void sub_10000E860(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v161 = a3;
  uint64_t v155 = a1;
  sub_100007FF8(&qword_100020AB8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v153 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100018680();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v164 = v6;
  uint64_t v165 = v7;
  ((void (*)(void))__chkstk_darwin)();
  v157 = (char *)&v153 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007FF8(&qword_100020B80);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v154 = (uint64_t *)((char *)&v153 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v160 = (uint64_t)&v153 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v156 = (uint64_t)&v153 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  unint64_t v17 = (uint64_t *)((char *)&v153 - v16);
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v159 = (uint64_t)&v153 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  v162 = (char *)&v153 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = (uint64_t *)((char *)&v153 - v23);
  uint64_t v25 = __chkstk_darwin(v22);
  unint64_t v27 = (uint64_t *)((char *)&v153 - v26);
  uint64_t v28 = __chkstk_darwin(v25);
  uint64_t v163 = (uint64_t)&v153 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  v158 = (uint64_t *)((char *)&v153 - v31);
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v34 = (uint64_t *)((char *)&v153 - v33);
  uint64_t v35 = __chkstk_darwin(v32);
  Swift::String v166 = (uint64_t *)((char *)&v153 - v36);
  uint64_t v37 = __chkstk_darwin(v35);
  uint64_t v39 = (uint64_t *)((char *)&v153 - v38);
  uint64_t v40 = v37;
  uint64_t v41 = *(int *)(v37 + 48);
  BOOL v42 = (char *)&v153 + v41 - v38;
  uint64_t v43 = a2[1];
  *uint64_t v39 = *a2;
  v39[1] = v43;
  uint64_t v169 = (uint64_t)a2 + v41;
  sub_100012DE8((uint64_t)a2 + v41, (uint64_t)v42);
  os_log_t v167 = (os_log_t)type metadata accessor for FedStatsPluginCKExperimentRecord();
  int v44 = v42[SHIDWORD(v167[6].isa)];
  sub_100012E4C((uint64_t)v42);
  if (!v44)
  {
    if (qword_1000207D0 != -1) {
      swift_once();
    }
    uint64_t v65 = sub_1000187A0();
    sub_100007F14(v65, (uint64_t)qword_100021520);
    unint64_t v66 = sub_100018780();
    os_log_type_t v67 = sub_100018950();
    if (!os_log_type_enabled(v66, v67)) {
      goto LABEL_33;
    }
    NSString v68 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v68 = 0;
    _os_log_impl((void *)&_mh_execute_header, v66, v67, "Invalid or unimplemented recipe type", v68, 2u);
    goto LABEL_31;
  }
  if (v44 == 1)
  {
    uint64_t v45 = self;
    uint64_t v46 = v166;
    uint64_t v47 = (uint64_t)v166 + *(int *)(v40 + 48);
    uint64_t v48 = a2[1];
    *Swift::String v166 = *a2;
    v46[1] = v48;
    sub_100012DE8(v169, v47);
    unint64_t v49 = (uint64_t *)(v47 + SLODWORD(v167[7].isa));
    uint64_t v50 = *v49;
    unint64_t v51 = v49[1];
    sub_1000094C8(*v49, v51);
    sub_100012E4C(v47);
    Class isa = sub_1000186E0().super.isa;
    sub_100007FA0(v50, v51);
    *(void *)&v172[0] = 0;
    id v53 = [v45 JSONObjectWithData:isa options:16 error:v172];

    id v54 = *(id *)&v172[0];
    if (v53)
    {
      sub_1000189B0();
      swift_unknownObjectRelease();
      sub_100007FF8(&qword_100020850);
      char v55 = swift_dynamicCast();
      uint64_t v56 = v163;
      if (v55)
      {
        uint64_t v57 = *(void *)&v171[0];
        uint64_t v58 = *(int *)(v40 + 48);
        uint64_t v59 = v166;
        uint64_t v60 = (uint64_t)v166 + v58;
        uint64_t v61 = *a2;
        uint64_t v62 = a2[1];
        *Swift::String v166 = *a2;
        v59[1] = v62;
        sub_100012DE8(v169, (uint64_t)v59 + v58);
        swift_bridgeObjectRetain();
        v63 = v155;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&v172[0] = *v63;
        void *v63 = 0x8000000000000000;
        sub_100014588(v57, v61, v62, isUniquelyReferenced_nonNull_native);
        void *v63 = *(void *)&v172[0];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100012E4C(v60);
        return;
      }
    }
    else
    {
      int v122 = v54;
      sub_100018610();

      swift_willThrow();
      swift_errorRelease();
      uint64_t v56 = v163;
    }
    if (qword_1000207D0 != -1) {
      swift_once();
    }
    uint64_t v123 = sub_1000187A0();
    sub_100007F14(v123, (uint64_t)qword_100021520);
    uint64_t v124 = (uint64_t)v34 + *(int *)(v40 + 48);
    uint64_t v125 = a2[1];
    uint64_t *v34 = *a2;
    v34[1] = v125;
    sub_100012DE8(v169, v124);
    int64_t v126 = v158;
    sub_100018280((uint64_t)v34, (uint64_t)v158);
    sub_10001821C((uint64_t)v34, v56, &qword_100020B80);
    swift_bridgeObjectRetain();
    unint64_t v66 = sub_100018780();
    os_log_type_t v127 = sub_100018940();
    if (!os_log_type_enabled(v66, v127))
    {
      sub_1000080E8(v56, &qword_100020B80);
      sub_1000080E8((uint64_t)v126, &qword_100020B80);
      goto LABEL_33;
    }
    int64_t v128 = (uint8_t *)swift_slowAlloc();
    uint64_t v169 = swift_slowAlloc();
    *(void *)&v172[0] = v169;
    *(_DWORD *)int64_t v128 = 136315138;
    v168 = v128 + 4;
    uint64_t v129 = *(int *)(v40 + 48);
    uint64_t v130 = v166;
    uint64_t v131 = (uint64_t)v166 + v129;
    uint64_t v133 = *v126;
    unint64_t v132 = v126[1];
    *Swift::String v166 = *v126;
    v130[1] = v132;
    sub_100012DE8((uint64_t)v126 + v129, (uint64_t)v130 + v129);
    swift_bridgeObjectRetain();
    sub_100012E4C(v131);
    *(void *)&v171[0] = sub_100012718(v133, v132, (uint64_t *)v172);
    sub_100018990();
    swift_bridgeObjectRelease();
    sub_1000080E8(v163, &qword_100020B80);
    sub_1000080E8((uint64_t)v126, &qword_100020B80);
    _os_log_impl((void *)&_mh_execute_header, v66, v127, "Cannot deserialize recipe for record %s to JSON", v128, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
LABEL_31:
    swift_slowDealloc();
LABEL_33:

    return;
  }
  uint64_t v69 = (uint64_t)v27 + *(int *)(v40 + 48);
  uint64_t v70 = a2[1];
  *unint64_t v27 = *a2;
  v27[1] = v70;
  sub_100012DE8(v169, v69);
  uint64_t v71 = (uint64_t *)(v69 + SHIDWORD(v167[7].isa));
  uint64_t v72 = *v71;
  uint64_t v73 = v71[1];
  swift_bridgeObjectRetain();
  sub_100012E4C(v69);
  uint64_t v74 = v161;
  if (*(void *)(v161 + 16) && (unint64_t v75 = sub_100012D70(v72, v73), (v76 & 1) != 0))
  {
    uint64_t v77 = *(void *)(v74 + 56);
    uint64_t v79 = v164;
    uint64_t v78 = v165;
    (*(void (**)(char *, unint64_t, uint64_t))(v165 + 16))(v5, v77 + *(void *)(v165 + 72) * v75, v164);
    uint64_t v80 = 0;
    uint64_t v81 = v40;
  }
  else
  {
    uint64_t v80 = 1;
    uint64_t v81 = v40;
    uint64_t v79 = v164;
    uint64_t v78 = v165;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v78 + 56))(v5, v80, 1, v79);
  swift_bridgeObjectRelease();
  int v82 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v78 + 48))(v5, 1, v79);
  uint64_t v83 = (uint64_t *)v162;
  if (v82 != 1)
  {
    uint64_t v114 = v157;
    (*(void (**)(char *, char *, uint64_t))(v78 + 32))(v157, v5, v79);
    uint64_t v115 = v168;
    uint64_t v116 = sub_1000186A0();
    if (v115)
    {
      swift_errorRelease();
      if (qword_1000207D0 != -1) {
        swift_once();
      }
      uint64_t v118 = sub_1000187A0();
      sub_100007F14(v118, (uint64_t)qword_100021520);
      char v119 = sub_100018780();
      os_log_type_t v120 = sub_100018940();
      if (os_log_type_enabled(v119, v120))
      {
        uint64_t v121 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v121 = 0;
        _os_log_impl((void *)&_mh_execute_header, v119, v120, "Cannot read recipe URL from Attachment record", v121, 2u);
        swift_slowDealloc();
      }
    }
    else
    {
      uint64_t v134 = v116;
      unint64_t v135 = v117;
      v136 = self;
      Class v137 = sub_1000186E0().super.isa;
      id v170 = 0;
      id v138 = [v136 JSONObjectWithData:v137 options:16 error:&v170];

      id v139 = v170;
      if (v138)
      {
        sub_1000189B0();
        swift_unknownObjectRelease();
        sub_1000080D8(v171, v172);
        uint64_t v140 = *(int *)(v81 + 48);
        uint64_t v141 = v154;
        uint64_t v142 = (uint64_t)v154 + v140;
        uint64_t v144 = *a2;
        uint64_t v143 = a2[1];
        *uint64_t v154 = *a2;
        v141[1] = v143;
        sub_100012DE8(v169, (uint64_t)v141 + v140);
        sub_10000807C((uint64_t)v172, (uint64_t)v171);
        swift_bridgeObjectRetain();
        sub_100007FF8(&qword_100020850);
        if (swift_dynamicCast()) {
          int64_t v145 = (int64_t)v170;
        }
        else {
          int64_t v145 = sub_100005A20((uint64_t)&_swiftEmptyArrayStorage);
        }
        v151 = v155;
        char v152 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&v171[0] = *v151;
        void *v151 = 0x8000000000000000;
        sub_100014588(v145, v144, v143, v152);
        void *v151 = *(void *)&v171[0];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100007FA0(v134, v135);
        sub_100008220((uint64_t)v172);
        (*(void (**)(char *, uint64_t))(v165 + 8))(v157, v164);
        sub_100012E4C(v142);
        return;
      }
      uint64_t v146 = v139;
      sub_100018610();

      swift_willThrow();
      swift_errorRelease();
      if (qword_1000207D0 != -1) {
        swift_once();
      }
      uint64_t v147 = sub_1000187A0();
      sub_100007F14(v147, (uint64_t)qword_100021520);
      uint64_t v148 = sub_100018780();
      os_log_type_t v149 = sub_100018940();
      if (os_log_type_enabled(v148, v149))
      {
        uint64_t v150 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v150 = 0;
        _os_log_impl((void *)&_mh_execute_header, v148, v149, "Cannot load recipe from URL", v150, 2u);
        swift_slowDealloc();
      }
      sub_100007FA0(v134, v135);
    }
    (*(void (**)(char *, uint64_t))(v165 + 8))(v114, v164);
    return;
  }
  sub_1000080E8((uint64_t)v5, &qword_100020AB8);
  if (qword_1000207D0 != -1) {
    swift_once();
  }
  uint64_t v84 = sub_1000187A0();
  sub_100007F14(v84, (uint64_t)qword_100021520);
  uint64_t v85 = (uint64_t)v24 + *(int *)(v81 + 48);
  uint64_t v87 = *a2;
  uint64_t v86 = a2[1];
  *uint64_t v24 = *a2;
  v24[1] = v86;
  uint64_t v88 = v169;
  sub_100012DE8(v169, v85);
  sub_100018280((uint64_t)v24, (uint64_t)v83);
  uint64_t v89 = (uint64_t)v24;
  uint64_t v90 = v159;
  sub_10001821C(v89, v159, &qword_100020B80);
  uint64_t v91 = (uint64_t)v17 + *(int *)(v81 + 48);
  *unint64_t v17 = v87;
  v17[1] = v86;
  sub_100012DE8(v88, v91);
  uint64_t v92 = v156;
  sub_100018280((uint64_t)v17, v156);
  uint64_t v93 = (uint64_t)v17;
  uint64_t v94 = v160;
  sub_10001821C(v93, v160, &qword_100020B80);
  swift_bridgeObjectRetain_n();
  uint64_t v95 = sub_100018780();
  os_log_type_t v96 = sub_100018940();
  int v97 = v96;
  if (os_log_type_enabled(v95, v96))
  {
    uint64_t v98 = swift_slowAlloc();
    LODWORD(v165) = v97;
    uint64_t v99 = v98;
    uint64_t v169 = swift_slowAlloc();
    *(void *)&v172[0] = v169;
    *(_DWORD *)uint64_t v99 = 136315394;
    uint64_t v100 = *(int *)(v81 + 48);
    uint64_t v101 = v166;
    uint64_t v102 = (uint64_t)v166 + v100;
    uint64_t v103 = v83[1];
    *Swift::String v166 = *v83;
    v101[1] = v103;
    sub_100012DE8((uint64_t)v83 + v100, v102);
    id v104 = (uint64_t *)(v102 + SHIDWORD(v167[7].isa));
    os_log_t v167 = v95;
    uint64_t v105 = (uint64_t *)v92;
    uint64_t v106 = v81;
    uint64_t v107 = *v104;
    unint64_t v108 = v104[1];
    swift_bridgeObjectRetain();
    sub_100012E4C(v102);
    *(void *)&v171[0] = sub_100012718(v107, v108, (uint64_t *)v172);
    sub_100018990();
    swift_bridgeObjectRelease();
    sub_1000080E8(v159, &qword_100020B80);
    sub_1000080E8((uint64_t)v83, &qword_100020B80);
    *(_WORD *)(v99 + 12) = 2080;
    uint64_t v109 = *(int *)(v106 + 48);
    uint64_t v110 = (uint64_t)v101 + v109;
    uint64_t v112 = *v105;
    unint64_t v111 = v105[1];
    *uint64_t v101 = *v105;
    v101[1] = v111;
    sub_100012DE8((uint64_t)v105 + v109, (uint64_t)v101 + v109);
    swift_bridgeObjectRetain();
    sub_100012E4C(v110);
    *(void *)&v171[0] = sub_100012718(v112, v111, (uint64_t *)v172);
    sub_100018990();
    swift_bridgeObjectRelease();
    sub_1000080E8(v160, &qword_100020B80);
    sub_1000080E8((uint64_t)v105, &qword_100020B80);
    os_log_t v113 = v167;
    _os_log_impl((void *)&_mh_execute_header, v167, (os_log_type_t)v165, "No recipe record '%s' for experiment record '%s'", (uint8_t *)v99, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_1000080E8(v90, &qword_100020B80);
    sub_1000080E8((uint64_t)v83, &qword_100020B80);
    sub_1000080E8(v94, &qword_100020B80);
    sub_1000080E8(v92, &qword_100020B80);
  }
}

uint64_t FedStatsPluginMLHostClient.recipeDictionary(forRecipe:)(uint64_t a1, void *a2)
{
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_recipes);
  if (!*(void *)(v5 + 16)) {
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100012D70(a1, (uint64_t)a2);
  if ((v7 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_5:
    uint64_t v8 = self;
    sub_1000189F0(48);
    swift_bridgeObjectRelease();
    v11._countAndFlagsBits = a1;
    v11._object = a2;
    sub_100018870(v11);
    v12._object = (void *)0x8000000100019C00;
    v12._countAndFlagsBits = 0xD000000000000011;
    sub_100018870(v12);
    NSString v9 = sub_100018840();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, "errorWithCode:description:", 300, v9, 0xD00000000000001DLL, 0x8000000100019BE0);

    swift_willThrow();
    return a1;
  }
  a1 = *(void *)(*(void *)(v5 + 56) + 8 * v6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

Swift::String_optional __swiftcall FedStatsPluginMLHostClient.namespaceIdentifier(forRecipe:)(Swift::String forRecipe)
{
  object = forRecipe._object;
  uint64_t countAndFlagsBits = forRecipe._countAndFlagsBits;
  uint64_t v4 = type metadata accessor for FedStatsPluginCKExperimentRecord();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007FF8(&qword_100020A88);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_experimentCfgs);
  if (*(void *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_100012D70(countAndFlagsBits, (uint64_t)object);
    if (v13)
    {
      sub_100012DE8(*(void *)(v11 + 56) + *(void *)(v5 + 72) * v12, (uint64_t)v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v4);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v4);
  }
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4))
  {
    sub_1000080E8((uint64_t)v10, &qword_100020A88);
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  else
  {
    sub_100012DE8((uint64_t)v10, (uint64_t)v7);
    sub_1000080E8((uint64_t)v10, &qword_100020A88);
    uint64_t v16 = (uint64_t *)&v7[*(int *)(v4 + 44)];
    uint64_t v14 = *v16;
    uint64_t v15 = (void *)v16[1];
    swift_bridgeObjectRetain();
    sub_100012E4C((uint64_t)v7);
  }
  uint64_t v17 = v14;
  uint64_t v18 = v15;
  result.value._object = v18;
  result.value._uint64_t countAndFlagsBits = v17;
  return result;
}

Swift::String_optional __swiftcall FedStatsPluginMLHostClient.experimentIdentifier(forRecipe:)(Swift::String forRecipe)
{
  object = forRecipe._object;
  uint64_t countAndFlagsBits = forRecipe._countAndFlagsBits;
  uint64_t v4 = type metadata accessor for FedStatsPluginCKExperimentRecord();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007FF8(&qword_100020A88);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_experimentCfgs);
  if (*(void *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_100012D70(countAndFlagsBits, (uint64_t)object);
    if (v13)
    {
      sub_100012DE8(*(void *)(v11 + 56) + *(void *)(v5 + 72) * v12, (uint64_t)v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v4);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v4);
  }
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4))
  {
    sub_1000080E8((uint64_t)v10, &qword_100020A88);
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  else
  {
    sub_100012DE8((uint64_t)v10, (uint64_t)v7);
    sub_1000080E8((uint64_t)v10, &qword_100020A88);
    uint64_t v16 = (uint64_t *)&v7[*(int *)(v4 + 24)];
    uint64_t v14 = *v16;
    uint64_t v15 = (void *)v16[1];
    swift_bridgeObjectRetain();
    sub_100012E4C((uint64_t)v7);
  }
  uint64_t v17 = v14;
  uint64_t v18 = v15;
  result.value._object = v18;
  result.value._uint64_t countAndFlagsBits = v17;
  return result;
}

Swift::String_optional __swiftcall FedStatsPluginMLHostClient.treatmentIdentifier(forRecipe:)(Swift::String forRecipe)
{
  object = forRecipe._object;
  uint64_t countAndFlagsBits = forRecipe._countAndFlagsBits;
  swift_bridgeObjectRetain();
  uint64_t v3 = countAndFlagsBits;
  uint64_t v4 = object;
  result.value._object = v4;
  result.value._uint64_t countAndFlagsBits = v3;
  return result;
}

Swift::String_optional __swiftcall FedStatsPluginMLHostClient.deploymentIdentifier(forRecipe:)(Swift::String forRecipe)
{
  object = forRecipe._object;
  uint64_t countAndFlagsBits = forRecipe._countAndFlagsBits;
  uint64_t v4 = type metadata accessor for FedStatsPluginCKExperimentRecord();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007FF8(&qword_100020A88);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_experimentCfgs);
  if (*(void *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_100012D70(countAndFlagsBits, (uint64_t)object);
    if (v13)
    {
      sub_100012DE8(*(void *)(v11 + 56) + *(void *)(v5 + 72) * v12, (uint64_t)v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v4);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v4);
  }
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4))
  {
    sub_1000080E8((uint64_t)v10, &qword_100020A88);
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  else
  {
    sub_100012DE8((uint64_t)v10, (uint64_t)v7);
    sub_1000080E8((uint64_t)v10, &qword_100020A88);
    uint64_t v16 = (uint64_t *)&v7[*(int *)(v4 + 28)];
    uint64_t v14 = *v16;
    uint64_t v15 = (void *)v16[1];
    swift_bridgeObjectRetain();
    sub_100012E4C((uint64_t)v7);
  }
  uint64_t v17 = v14;
  uint64_t v18 = v15;
  result.value._object = v18;
  result.value._uint64_t countAndFlagsBits = v17;
  return result;
}

id sub_1000101C0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_100018850();
  uint64_t v8 = v7;
  id v9 = a1;
  a4(v6, v8);
  uint64_t v11 = v10;

  swift_bridgeObjectRelease();
  if (v11)
  {
    NSString v12 = sub_100018840();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v12 = 0;
  }

  return v12;
}

void *FedStatsPluginMLHostClient.recipeIdentifiers()()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_100016218(v0);
  swift_bridgeObjectRelease();
  return v1;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> FedStatsPluginMLHostClient.fetchAssets(_:)(Swift::OpaquePointer a1)
{
  p_Class isa = (void *)sub_1000187B0();
  uint64_t v42 = *(p_isa - 1);
  __chkstk_darwin(p_isa);
  uint64_t v5 = (uint64_t *)((char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v43 = sub_1000187E0();
  uint64_t v6 = *(void *)(v43 - 8);
  uint64_t v7 = __chkstk_darwin(v43);
  id v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v41 - v10;
  uint64_t v12 = sub_100007FF8(&qword_100020A98);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = v1;
  uint64_t v16 = sub_100017E0C((uint64_t)&_swiftEmptySetSingleton, (uint64_t)a1._rawValue, (uint64_t)v15);
  uint64_t v41 = v2;

  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  uint64_t v18 = sub_100018910();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v14, 1, 1, v18);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = v15;
  v19[5] = v16;
  v19[6] = v17;
  id v20 = v15;
  uint64_t v21 = v17;
  sub_100010D70((uint64_t)v14, (uint64_t)&unk_100020AA8, (uint64_t)v19);
  swift_release();
  sub_1000187D0();
  *uint64_t v5 = 240;
  uint64_t v22 = v42;
  uint64_t v23 = p_isa;
  (*(void (**)(void *, void, void *))(v42 + 104))(v5, enum case for DispatchTimeInterval.seconds(_:), p_isa);
  sub_1000187F0();
  uint64_t v24 = v5;
  uint64_t v25 = v21;
  (*(void (**)(void *, void *))(v22 + 8))(v24, v23);
  uint64_t v26 = *(void (**)(char *, uint64_t))(v6 + 8);
  unint64_t v27 = v9;
  uint64_t v28 = v43;
  v26(v27, v43);
  sub_100018960();
  v26(v11, v28);
  if (sub_1000187C0())
  {
    v45[0] = 0;
    v45[1] = 0xE000000000000000;
    sub_1000189F0(56);
    v47._object = (void *)0x8000000100019C20;
    v47._uint64_t countAndFlagsBits = 0xD00000000000002ELL;
    sub_100018870(v47);
    uint64_t v46 = 240;
    v48._uint64_t countAndFlagsBits = sub_100018AD0();
    sub_100018870(v48);
    swift_bridgeObjectRelease();
    uint64_t v29 = self;
    v49._uint64_t countAndFlagsBits = 0x73646E6F63657320;
    v49._object = (void *)0xE800000000000000;
    sub_100018870(v49);
    NSString v30 = sub_100018840();
    swift_bridgeObjectRelease();
    [v29 errorWithCode:300 description:v30];

    swift_willThrow();
  }
  else
  {
    if (qword_1000207D0 != -1) {
      swift_once();
    }
    uint64_t v31 = sub_1000187A0();
    sub_100007F14(v31, (uint64_t)qword_100021520);
    id v32 = v20;
    uint64_t v33 = sub_100018780();
    os_log_type_t v34 = sub_100018940();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = swift_slowAlloc();
      p_Class isa = &v25->isa;
      uint64_t v36 = (uint8_t *)v35;
      uint64_t v37 = swift_slowAlloc();
      *(_DWORD *)uint64_t v36 = 136315138;
      v45[0] = v37;
      uint64_t v43 = (uint64_t)(v36 + 4);
      sub_100018680();
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_100018820();
      unint64_t v40 = v39;
      swift_bridgeObjectRelease();
      uint64_t v46 = sub_100012718(v38, v40, v45);
      sub_100018990();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "assetURLs = %s", v36, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
  }
}

uint64_t sub_100010908(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 64;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v13 >= v7) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      int64_t v2 = v13 + 1;
      if (v13 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v14 = *(void *)(v3 + 8 * v2);
      if (!v14)
      {
        int64_t v2 = v13 + 2;
        if (v13 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        if (!v14)
        {
          int64_t v2 = v13 + 3;
          if (v13 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v14 = *(void *)(v3 + 8 * v2);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    uint64_t v10 = (Swift::Int *)(*(void *)(v1 + 56) + 16 * v9);
    Swift::Int v11 = *v10;
    Swift::Int v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_1000150C8(&v16, v11, v12);
    Swift::String_optional result = swift_bridgeObjectRelease();
  }
  int64_t v15 = v13 + 4;
  if (v15 < v7)
  {
    unint64_t v14 = *(void *)(v3 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v2 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        ++v15;
        if (v14) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v15;
    goto LABEL_22;
  }
LABEL_23:

  return swift_release();
}

uint64_t sub_100010A88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return _swift_task_switch(sub_100010AAC, 0, 0);
}

uint64_t sub_100010AAC()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  int64_t v2 = sub_100016300(v1);
  *(void *)(v0 + 40) = v2;
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100010B5C;
  return sub_100016D9C((uint64_t)v2);
}

uint64_t sub_100010B5C(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 56) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_100010D0C;
  }
  else
  {
    swift_release();
    *(void *)(v4 + 64) = a1;
    uint64_t v5 = sub_100010C8C;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_100010C8C()
{
  *(void *)(v0[2] + OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_assetURLs) = v0[8];
  swift_bridgeObjectRelease();
  sub_100018970();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100010D0C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100010D70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100018910();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_100018900();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_1000080E8(a1, &qword_100020A98);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000188F0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void FedStatsPluginMLHostClient.assetURL(forRecipe:forKey:)(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint8_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v70 = a3;
  uint64_t v71 = a4;
  uint64_t v10 = sub_100018680();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  int64_t v13 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100007FF8(&qword_100020AB8);
  __chkstk_darwin(v14 - 8);
  Swift::Int v16 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = v5;
  uint64_t v17 = *(void *)(v5 + OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_attachmentIDMaps);
  if (!*(void *)(v17 + 16)) {
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v18 = sub_100012D70(a1, (uint64_t)a2);
  if ((v19 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_8:
    NSString v30 = self;
    uint64_t v72 = 0;
    unint64_t v73 = 0xE000000000000000;
    sub_1000189F0(36);
    swift_bridgeObjectRelease();
    uint64_t v72 = 0xD000000000000010;
    unint64_t v73 = 0x8000000100019C60;
    v75._uint64_t countAndFlagsBits = a1;
    v75._object = a2;
    sub_100018870(v75);
    v76._uint64_t countAndFlagsBits = 0xD000000000000012;
    v76._object = (void *)0x8000000100019C80;
    sub_100018870(v76);
    NSString v31 = sub_100018840();
    swift_bridgeObjectRelease();
    id v32 = [v30 errorWithCode:300 description:v31];
LABEL_24:
    v32;

    swift_willThrow();
    return;
  }
  uint64_t v63 = a5;
  uint64_t v64 = v13;
  uint64_t v67 = v11;
  uint64_t v68 = v10;
  uint64_t v20 = *(void *)(*(void *)(v17 + 56) + 8 * v18);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_1000207D0 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_1000187A0();
  uint64_t v22 = sub_100007F14(v21, (uint64_t)qword_100021520);
  swift_bridgeObjectRetain_n();
  uint64_t v65 = v22;
  uint64_t v23 = sub_100018780();
  os_log_type_t v24 = sub_100018940();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v62 = v6;
  unint64_t v66 = v16;
  if (v25)
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    uint64_t v72 = v61;
    *(_DWORD *)uint64_t v26 = 136315138;
    uint64_t v60 = v26 + 4;
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_100018820();
    unint64_t v29 = v28;
    swift_bridgeObjectRelease();
    uint64_t v74 = sub_100012718(v27, v29, &v72);
    sub_100018990();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "attachmentIDMap = %s", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v34 = v70;
  uint64_t v33 = v71;
  if (!*(void *)(v20 + 16)) {
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  unint64_t v35 = sub_100012D70(v34, (uint64_t)v33);
  if ((v36 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t v72 = 0;
    unint64_t v73 = 0xE000000000000000;
    sub_1000189F0(45);
    swift_bridgeObjectRelease();
    uint64_t v72 = 0xD000000000000016;
    unint64_t v73 = 0x8000000100019CA0;
    v77._uint64_t countAndFlagsBits = a1;
    v77._object = a2;
    sub_100018870(v77);
    v78._uint64_t countAndFlagsBits = 0x6F6E2073656F6420;
    v78._object = (void *)0xEF20657661682074;
    sub_100018870(v78);
    v79._uint64_t countAndFlagsBits = v34;
    v79._object = v33;
    sub_100018870(v79);
    uint64_t v43 = self;
    v80._uint64_t countAndFlagsBits = 2036689696;
    v80._object = (void *)0xE400000000000000;
    sub_100018870(v80);
    NSString v31 = sub_100018840();
    swift_bridgeObjectRelease();
    id v32 = [v43 errorWithCode:300 description:v31];
    goto LABEL_24;
  }
  uint64_t v37 = (uint64_t *)(*(void *)(v20 + 56) + 16 * v35);
  uint64_t v39 = *v37;
  uint64_t v38 = (void *)v37[1];
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v40 = sub_100018780();
  os_log_type_t v41 = sub_100018940();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v72 = swift_slowAlloc();
    *(_DWORD *)uint64_t v42 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v74 = sub_100012718(v39, (unint64_t)v38, &v72);
    sub_100018990();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "assetAttachmentID = %s", v42, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v45 = v67;
  uint64_t v44 = v68;
  uint64_t v46 = (uint64_t)v66;
  uint64_t v47 = *(void *)(v69 + OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_assetURLs);
  if (!*(void *)(v47 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v67 + 56))(v66, 1, 1, v68);
LABEL_23:
    sub_1000080E8(v46, &qword_100020AB8);
    unint64_t v51 = self;
    uint64_t v72 = 0;
    unint64_t v73 = 0xE000000000000000;
    sub_1000189F0(36);
    swift_bridgeObjectRelease();
    uint64_t v72 = 0xD000000000000011;
    unint64_t v73 = 0x8000000100019CC0;
    v81._uint64_t countAndFlagsBits = v39;
    v81._object = v38;
    sub_100018870(v81);
    swift_bridgeObjectRelease();
    v82._object = (void *)0x8000000100019C00;
    v82._uint64_t countAndFlagsBits = 0xD000000000000011;
    sub_100018870(v82);
    NSString v31 = sub_100018840();
    swift_bridgeObjectRelease();
    id v32 = [v51 errorWithCode:300 description:v31];
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v48 = sub_100012D70(v39, (uint64_t)v38);
  if (v49)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v45 + 16))(v46, *(void *)(v47 + 56) + *(void *)(v45 + 72) * v48, v44);
    uint64_t v50 = 0;
  }
  else
  {
    uint64_t v50 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 56))(v46, v50, 1, v44);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v46, 1, v44) == 1) {
    goto LABEL_23;
  }
  swift_bridgeObjectRelease();
  uint64_t v52 = v63;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 32))(v63, v46, v44);
  id v53 = v64;
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v64, v52, v44);
  id v54 = sub_100018780();
  os_log_type_t v55 = sub_100018940();
  if (os_log_type_enabled(v54, v55))
  {
    uint64_t v56 = (uint8_t *)swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    *(_DWORD *)uint64_t v56 = 136315138;
    uint64_t v71 = v56 + 4;
    uint64_t v72 = v57;
    sub_1000181A0();
    uint64_t v58 = sub_100018AD0();
    uint64_t v74 = sub_100012718(v58, v59, &v72);
    sub_100018990();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v53, v44);
    _os_log_impl((void *)&_mh_execute_header, v54, v55, "assetURL = %s", v56, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v45 + 8))(v53, v44);
  }
}

Swift::Void __swiftcall FedStatsPluginMLHostClient.removeAssets()()
{
  uint64_t v76 = sub_100018680();
  uint64_t v1 = *(void *)(v76 - 8);
  uint64_t v2 = __chkstk_darwin(v76);
  uint64_t v4 = (char *)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v2);
  uint64_t v7 = (char *)&v64 - v6;
  __chkstk_darwin(v5);
  unint64_t v9 = (char *)&v64 - v8;
  uint64_t v10 = sub_100007FF8(&qword_100020AD0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  int64_t v13 = (int64_t *)((char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v11);
  uint64_t v15 = (int64_t *)((char *)&v64 - v14);
  uint64_t v16 = *(void *)(v0 + OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_assetURLs);
  uint64_t v17 = *(void *)(v16 + 64);
  uint64_t v65 = v16 + 64;
  uint64_t v18 = 1 << *(unsigned char *)(v16 + 32);
  uint64_t v19 = -1;
  if (v18 < 64) {
    uint64_t v19 = ~(-1 << v18);
  }
  unint64_t v20 = v19 & v17;
  Swift::String v79 = (void (**)(char *, char *, uint64_t))(v1 + 16);
  uint64_t v71 = v1;
  unint64_t v73 = (void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v74 = (void (**)(char *, char *, uint64_t))(v1 + 32);
  int64_t v68 = (unint64_t)(v18 + 63) >> 6;
  int64_t v64 = v68 - 1;
  uint64_t v72 = v16;
  swift_bridgeObjectRetain();
  int64_t v21 = 0;
  uint64_t v69 = 0;
  *(void *)&long long v22 = 136315394;
  long long v70 = v22;
  unint64_t v66 = (char *)&type metadata for Any + 8;
  uint64_t v67 = v15;
  Swift::String v77 = v7;
  Swift::String v78 = v4;
  Swift::String v75 = v13;
  while (1)
  {
    if (v20)
    {
      uint64_t v80 = (v20 - 1) & v20;
      int64_t v81 = v21;
      unint64_t v24 = __clz(__rbit64(v20)) | (v21 << 6);
      uint64_t v25 = v76;
LABEL_9:
      uint64_t v26 = v71;
      uint64_t v27 = *(void *)(v72 + 56);
      unint64_t v28 = (void *)(*(void *)(v72 + 48) + 16 * v24);
      uint64_t v29 = v28[1];
      *int64_t v13 = *v28;
      v13[1] = v29;
      uint64_t v30 = v27 + *(void *)(v26 + 72) * v24;
      uint64_t v31 = sub_100007FF8(&qword_100020AD8);
      (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))((char *)v13 + *(int *)(v31 + 48), v30, v25);
      (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v13, 0, 1, v31);
      swift_bridgeObjectRetain();
      goto LABEL_22;
    }
    int64_t v32 = v21 + 1;
    uint64_t v25 = v76;
    if (__OFADD__(v21, 1))
    {
      __break(1u);
LABEL_45:
      __break(1u);
    }
    if (v32 >= v68) {
      goto LABEL_20;
    }
    unint64_t v33 = *(void *)(v65 + 8 * v32);
    if (v33) {
      goto LABEL_13;
    }
    v21 += 2;
    if (v32 + 1 >= v68) {
      goto LABEL_42;
    }
    unint64_t v33 = *(void *)(v65 + 8 * v21);
    if (v33) {
      goto LABEL_16;
    }
    if (v32 + 2 >= v68)
    {
LABEL_20:
      int64_t v81 = v21;
    }
    else
    {
      unint64_t v33 = *(void *)(v65 + 8 * (v32 + 2));
      if (v33)
      {
        v32 += 2;
        goto LABEL_13;
      }
      int64_t v21 = v32 + 3;
      if (v32 + 3 < v68)
      {
        unint64_t v33 = *(void *)(v65 + 8 * v21);
        if (v33)
        {
LABEL_16:
          int64_t v32 = v21;
LABEL_13:
          uint64_t v80 = (v33 - 1) & v33;
          int64_t v81 = v32;
          unint64_t v24 = __clz(__rbit64(v33)) + (v32 << 6);
          goto LABEL_9;
        }
        while (1)
        {
          int64_t v32 = v21 + 1;
          if (__OFADD__(v21, 1)) {
            goto LABEL_45;
          }
          if (v32 >= v68) {
            break;
          }
          unint64_t v33 = *(void *)(v65 + 8 * v32);
          ++v21;
          if (v33) {
            goto LABEL_13;
          }
        }
        int64_t v32 = v64;
LABEL_42:
        int64_t v81 = v32;
        goto LABEL_21;
      }
      int64_t v81 = v32 + 2;
    }
LABEL_21:
    uint64_t v34 = sub_100007FF8(&qword_100020AD8);
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v13, 1, 1, v34);
    uint64_t v80 = 0;
LABEL_22:
    sub_10001821C((uint64_t)v13, (uint64_t)v15, &qword_100020AD0);
    uint64_t v35 = sub_100007FF8(&qword_100020AD8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v35 - 8) + 48))(v15, 1, v35) == 1) {
      break;
    }
    uint64_t v37 = *v15;
    unint64_t v36 = v15[1];
    (*v74)(v9, (char *)v15 + *(int *)(v35 + 48), v25);
    id v38 = [self defaultManager];
    uint64_t v39 = v9;
    sub_100018650(v40);
    uint64_t v42 = v41;
    id v82 = 0;
    unsigned int v43 = [v38 removeItemAtURL:v41 error:&v82];

    if (v43)
    {
      uint64_t v44 = qword_1000207D0;
      id v45 = v82;
      if (v44 != -1) {
        swift_once();
      }
      uint64_t v46 = sub_1000187A0();
      sub_100007F14(v46, (uint64_t)qword_100021520);
      (*v79)(v7, v39, v25);
      swift_bridgeObjectRetain();
      uint64_t v47 = sub_100018780();
      os_log_type_t v48 = sub_100018940();
      if (os_log_type_enabled(v47, v48))
      {
        uint64_t v49 = swift_slowAlloc();
        id v82 = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v49 = v70;
        swift_bridgeObjectRetain();
        *(void *)(v49 + 4) = sub_100012718(v37, v36, (uint64_t *)&v82);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v49 + 12) = 2080;
        sub_1000181A0();
        uint64_t v50 = sub_100018AD0();
        *(void *)(v49 + 14) = sub_100012718(v50, v51, (uint64_t *)&v82);
        swift_bridgeObjectRelease();
        uint64_t v23 = *v73;
        (*v73)(v77, v25);
        _os_log_impl((void *)&_mh_execute_header, v47, v48, "Removed %s at %s", (uint8_t *)v49, 0x16u);
        swift_arrayDestroy();
        uint64_t v7 = v77;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        uint64_t v23 = *v73;
        (*v73)(v7, v25);
        swift_bridgeObjectRelease_n();
      }
      v23(v39, v25);
      uint64_t v4 = v78;
      unint64_t v9 = v39;
    }
    else
    {
      id v52 = v82;
      swift_bridgeObjectRelease();
      sub_100018610();

      swift_willThrow();
      if (qword_1000207D0 != -1) {
        swift_once();
      }
      uint64_t v53 = sub_1000187A0();
      sub_100007F14(v53, (uint64_t)qword_100021520);
      unint64_t v9 = v39;
      (*v79)(v4, v39, v25);
      swift_errorRetain();
      swift_errorRetain();
      id v54 = sub_100018780();
      os_log_type_t v55 = sub_100018940();
      if (os_log_type_enabled(v54, v55))
      {
        uint64_t v56 = swift_slowAlloc();
        uint64_t v57 = (void *)swift_slowAlloc();
        id v82 = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v56 = v70;
        sub_1000181A0();
        uint64_t v58 = sub_100018AD0();
        *(void *)(v56 + 4) = sub_100012718(v58, v59, (uint64_t *)&v82);
        swift_bridgeObjectRelease();
        uint64_t v60 = *v73;
        (*v73)(v78, v25);
        *(_WORD *)(v56 + 12) = 2112;
        swift_errorRetain();
        uint64_t v61 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v56 + 14) = v61;
        *uint64_t v57 = v61;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v54, v55, "Cannot remove URL %s. Error: %@", (uint8_t *)v56, 0x16u);
        sub_100007FF8(&qword_100020AE0);
        swift_arrayDestroy();
        uint64_t v4 = v78;
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        unint64_t v9 = v39;
        swift_slowDealloc();

        swift_errorRelease();
        uint64_t v62 = v39;
        uint64_t v63 = v25;
        uint64_t v15 = v67;
      }
      else
      {

        swift_errorRelease();
        swift_errorRelease();
        uint64_t v60 = *v73;
        (*v73)(v4, v25);
        swift_errorRelease();
        uint64_t v62 = v39;
        uint64_t v63 = v25;
      }
      v60(v62, v63);
      uint64_t v69 = 0;
      uint64_t v7 = v77;
    }
    int64_t v13 = v75;
    unint64_t v20 = v80;
    int64_t v21 = v81;
  }
  swift_release();
}

id FedStatsPluginMLHostClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void FedStatsPluginMLHostClient.init()()
{
}

id FedStatsPluginMLHostClient.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FedStatsPluginMLHostClient();
  return objc_msgSendSuper2(&v2, "dealloc");
}

char *sub_100012608(char *result, int64_t a2, char a3, char *a4)
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
      sub_100007FF8(&qword_100020BE8);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      int64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      int64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
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
    sub_100016CA8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100012718(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000127EC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000807C((uint64_t)v12, *a3);
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
      sub_10000807C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100008220((uint64_t)v12);
  return v7;
}

uint64_t sub_1000127EC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000189A0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000129A8(a5, a6);
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
  uint64_t v8 = sub_100018A10();
  if (!v8)
  {
    sub_100018A70();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100018AB0();
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

uint64_t sub_1000129A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100012A40(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100012C20(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100012C20(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100012A40(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100012BB8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100018A00();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100018A70();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100018880();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100018AB0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100018A70();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100012BB8(uint64_t a1, uint64_t a2)
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
  sub_100007FF8(&qword_100020C08);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100012C20(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007FF8(&qword_100020C08);
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
  int64_t v13 = a4 + 32;
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
  uint64_t result = sub_100018AB0();
  __break(1u);
  return result;
}

unint64_t sub_100012D70(uint64_t a1, uint64_t a2)
{
  sub_100018B10();
  sub_100018860();
  Swift::Int v4 = sub_100018B20();

  return sub_100012EA8(a1, a2, v4);
}

uint64_t sub_100012DE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FedStatsPluginCKExperimentRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012E4C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FedStatsPluginCKExperimentRecord();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100012EA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100018AE0() & 1) == 0)
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
      while (!v14 && (sub_100018AE0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100012F8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_100012D70(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1000149E0();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for FedStatsPluginCKExperimentRecord();
    uint64_t v20 = *(void *)(v13 - 8);
    sub_1000082F4(v12 + *(void *)(v20 + 72) * v8, a3);
    sub_100014084(v8, v11, (uint64_t (*)(void))type metadata accessor for FedStatsPluginCKExperimentRecord);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for FedStatsPluginCKExperimentRecord();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_100013130@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_100012D70(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100014C4C();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = sub_100018680();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a3, v12 + *(void *)(v20 + 72) * v8, v13);
    sub_100014084(v8, v11, (uint64_t (*)(void))&type metadata accessor for URL);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = sub_100018680();
    BOOL v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_1000132EC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100007FF8(&qword_100020898);
  char v37 = a2;
  uint64_t v6 = sub_100018A90();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v2;
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
    unint64_t v24 = *(void *)(v36 + 8 * v14);
    if (!v24)
    {
      int64_t v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        uint64_t v3 = v35;
        if ((v37 & 1) == 0) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v25);
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
          unint64_t v24 = *(void *)(v36 + 8 * v14);
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
    uint64_t v26 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_100018B10();
    sub_100018860();
    uint64_t result = sub_100018B20();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v32 = v17 == v31;
        if (v17 == v31) {
          unint64_t v17 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v12 + 8 * v17);
      }
      while (v33 == -1);
      unint64_t v18 = __clz(__rbit64(~v33)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    void *v19 = v28;
    v19[1] = v27;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v29;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_1000135E0(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for FedStatsPluginCKExperimentRecord();
  uint64_t v42 = *(void *)(v5 - 8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_100007FF8(&qword_100020C00);
  int v43 = a2;
  uint64_t v9 = sub_100018A90();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  os_log_type_t v41 = (void *)(v8 + 64);
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
    uint64_t v26 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v42 + 72);
    uint64_t v30 = *(void *)(v8 + 56) + v29 * v21;
    if (v43)
    {
      sub_1000082F4(v30, (uint64_t)v7);
    }
    else
    {
      sub_100012DE8(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_100018B10();
    sub_100018860();
    uint64_t result = sub_100018B20();
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
    uint64_t v19 = (void *)(*(void *)(v10 + 48) + 16 * v18);
    void *v19 = v28;
    v19[1] = v27;
    uint64_t result = sub_1000082F4((uint64_t)v7, *(void *)(v10 + 56) + v29 * v18);
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
    *uint64_t v23 = -1 << v38;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_100013984(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = sub_100018680();
  uint64_t v5 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  os_log_type_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_100007FF8(&qword_100020BE0);
  int v47 = a2;
  uint64_t v8 = sub_100018A90();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  id v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  unint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
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
    if (v22 >= v43) {
      break;
    }
    uint64_t v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
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
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    uint64_t v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    sub_100018B10();
    sub_100018860();
    uint64_t result = sub_100018B20();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    void *v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  uint64_t v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

uint64_t sub_100013D6C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100007FF8((uint64_t *)&unk_1000208C0);
  char v36 = a2;
  uint64_t v6 = sub_100018A90();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
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
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_100018B10();
    sub_100018860();
    uint64_t result = sub_100018B20();
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
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_100014084(unint64_t result, uint64_t a2, uint64_t (*a3)(void))
{
  int64_t v4 = result;
  uint64_t v5 = a2 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v7 = (result + 1) & ~v6;
  if (((1 << v7) & *(void *)(a2 + 64 + 8 * (v7 >> 6))) != 0)
  {
    uint64_t v9 = ~v6;
    uint64_t result = sub_1000189C0();
    if ((*(void *)(v5 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
    {
      unint64_t v10 = (result + 1) & v9;
      while (1)
      {
        sub_100018B10();
        swift_bridgeObjectRetain();
        sub_100018860();
        Swift::Int v11 = sub_100018B20();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v9;
        if (v4 >= (uint64_t)v10) {
          break;
        }
        if (v12 < v10) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v13 = *(void *)(a2 + 48);
        uint64_t v14 = (_OWORD *)(v13 + 16 * v4);
        unint64_t v15 = (_OWORD *)(v13 + 16 * v7);
        if (v4 != v7 || v14 >= v15 + 1) {
          *uint64_t v14 = *v15;
        }
        uint64_t v16 = *(void *)(a2 + 56);
        uint64_t v17 = *(void *)(*(void *)(a3(0) - 8) + 72);
        int64_t v18 = v17 * v4;
        uint64_t result = v16 + v17 * v4;
        int64_t v19 = v17 * v7;
        unint64_t v20 = v16 + v17 * v7 + v17;
        if (v18 < v19 || result >= v20)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v4 = v7;
          if (v18 == v19) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v4 = v7;
LABEL_6:
        unint64_t v7 = (v7 + 1) & v9;
        if (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v12 < v10) {
        goto LABEL_6;
      }
LABEL_11:
      if (v4 < (uint64_t)v12) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    int64_t v22 = (uint64_t *)(v5 + 8 * ((unint64_t)v4 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v4) - 1;
  }
  else
  {
    int64_t v22 = (uint64_t *)(v5 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *int64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1000142A4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_100012D70(a2, a3);
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
      sub_1000149E0();
      goto LABEL_7;
    }
    sub_1000135E0(v15, a4 & 1);
    unint64_t v22 = sub_100012D70(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      unint64_t v12 = v22;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_100018B00();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = v19 + *(void *)(*(void *)(type metadata accessor for FedStatsPluginCKExperimentRecord() - 8) + 72) * v12;
    return sub_100018508(a1, v20);
  }
LABEL_13:
  sub_1000146F8(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_100014408(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_100012D70(a2, a3);
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
      sub_100014C4C();
      goto LABEL_7;
    }
    sub_100013984(v15, a4 & 1);
    unint64_t v26 = sub_100012D70(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_100018B00();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = sub_100018680();
    uint64_t v21 = *(void *)(v20 - 8);
    unint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_100014790(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_100014588(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100012D70(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_100014F10();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_100013D6C(v15, a4 & 1);
  unint64_t v21 = sub_100012D70(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_100018B00();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  int64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000146F8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for FedStatsPluginCKExperimentRecord();
  uint64_t result = sub_1000082F4(a4, v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1);
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

uint64_t sub_100014790(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = sub_100018680();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
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

void *sub_100014840()
{
  id v1 = v0;
  sub_100007FF8(&qword_100020898);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100018A80();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_1000149E0()
{
  id v1 = v0;
  uint64_t v2 = type metadata accessor for FedStatsPluginCKExperimentRecord();
  uint64_t v29 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007FF8(&qword_100020C00);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_100018A80();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *id v1 = v7;
    return result;
  }
  char v27 = v1;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
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
    sub_100012DE8(*(void *)(v5 + 56) + v21, (uint64_t)v4);
    char v22 = (void *)(*(void *)(v7 + 48) + v17);
    *char v22 = v19;
    v22[1] = v20;
    sub_1000082F4((uint64_t)v4, *(void *)(v7 + 56) + v21);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    id v1 = v27;
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

void *sub_100014C4C()
{
  uint64_t v35 = sub_100018680();
  uint64_t v1 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007FF8(&qword_100020BE0);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = sub_100018A80();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    char v27 = v30;
LABEL_25:
    *char v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    int64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    *int64_t v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    char v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_100014F10()
{
  uint64_t v1 = v0;
  sub_100007FF8((uint64_t *)&unk_1000208C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100018A80();
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1000150C8(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_100018B10();
  swift_bridgeObjectRetain();
  sub_100018860();
  Swift::Int v8 = sub_100018B20();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_100018AE0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
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
      if (v19 || (sub_100018AE0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100015558(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100015278()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100007FF8(&qword_100020C10);
  uint64_t v3 = sub_1000189E0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
      }
      else
      {
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
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_100018B10();
      sub_100018860();
      uint64_t result = sub_100018B20();
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
            goto LABEL_38;
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_100015558(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_100015278();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_1000156F4();
      goto LABEL_22;
    }
    sub_1000158A8();
  }
  uint64_t v11 = *v4;
  sub_100018B10();
  sub_100018860();
  uint64_t result = sub_100018B20();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_100018AE0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_100018AF0();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_100018AE0();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

void *sub_1000156F4()
{
  uint64_t v1 = v0;
  sub_100007FF8(&qword_100020C10);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000189D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
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
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1000158A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100007FF8(&qword_100020C10);
  uint64_t v3 = sub_1000189E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
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
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_100018B10();
    swift_bridgeObjectRetain();
    sub_100018860();
    uint64_t result = sub_100018B20();
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
          goto LABEL_36;
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
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100015B58(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return (uint64_t)&_swiftEmptyDictionarySingleton;
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_100007FF8(&qword_100020C18);
  uint64_t result = sub_100018AA0();
  uint64_t v9 = result;
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      uint64_t v41 = v11;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= v40) {
        return v9;
      }
      unint64_t v16 = v39[v15];
      uint64_t v17 = v11 + 1;
      if (!v16)
      {
        uint64_t v17 = v11 + 2;
        if (v11 + 2 >= v40) {
          return v9;
        }
        unint64_t v16 = v39[v17];
        if (!v16)
        {
          uint64_t v17 = v11 + 3;
          if (v11 + 3 >= v40) {
            return v9;
          }
          unint64_t v16 = v39[v17];
          if (!v16)
          {
            uint64_t v18 = v11 + 4;
            if (v11 + 4 >= v40) {
              return v9;
            }
            unint64_t v16 = v39[v18];
            if (!v16)
            {
              while (1)
              {
                uint64_t v17 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_41;
                }
                if (v17 >= v40) {
                  return v9;
                }
                unint64_t v16 = v39[v17];
                ++v18;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v17 = v11 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      uint64_t v41 = v17;
      unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
    }
    uint64_t v19 = 16 * v14;
    uint64_t v20 = v4;
    uint64_t v21 = (uint64_t *)(*(void *)(v4 + 48) + v19);
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    unint64_t v24 = (uint64_t *)(*(void *)(v4 + 56) + v19);
    uint64_t v25 = *v24;
    uint64_t v26 = v24[1];
    sub_100018B10();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100018860();
    uint64_t result = sub_100018B20();
    uint64_t v27 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v28 = result & ~v27;
    unint64_t v29 = v28 >> 6;
    if (((-1 << v28) & ~*(void *)(v12 + 8 * (v28 >> 6))) != 0)
    {
      unint64_t v30 = __clz(__rbit64((-1 << v28) & ~*(void *)(v12 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v33 = v29 == v32;
        if (v29 == v32) {
          unint64_t v29 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v29);
      }
      while (v34 == -1);
      unint64_t v30 = __clz(__rbit64(~v34)) + (v29 << 6);
    }
    *(void *)(v12 + ((v30 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v30;
    uint64_t v35 = 16 * v30;
    uint64_t v36 = (void *)(*(void *)(v9 + 48) + v35);
    void *v36 = v23;
    v36[1] = v22;
    unint64_t v37 = (void *)(*(void *)(v9 + 56) + v35);
    *unint64_t v37 = v25;
    v37[1] = v26;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    uint64_t v4 = v20;
    uint64_t v11 = v41;
    if (!v5) {
      return v9;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_100015E18(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_100016018(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void *sub_100016218(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100007FF8(&qword_100020BE8);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_100015E18((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_10001856C();
  if (v6 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_100016300(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100007FF8(&qword_100020BE8);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_100016018((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_10001856C();
  if (v6 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_1000163E8(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = sub_1000187A0();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  return _swift_task_switch(sub_1000164A8, 0, 0);
}

uint64_t sub_1000164A8()
{
  unint64_t v29 = v0;
  uint64_t v1 = v0[5];
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    unint64_t v28 = &_swiftEmptyArrayStorage;
    sub_100018A40();
    uint64_t v4 = v1 + 40;
    do
    {
      id v5 = objc_allocWithZone((Class)CKRecordID);
      swift_bridgeObjectRetain();
      NSString v6 = sub_100018840();
      swift_bridgeObjectRelease();
      [v5 initWithRecordName:v6];

      sub_100018A20();
      sub_100018A50();
      sub_100018A60();
      sub_100018A30();
      v4 += 16;
      --v2;
    }
    while (v2);
    uint64_t v3 = v28;
  }
  v0[9] = v3;
  if (qword_1000207D0 != -1) {
    swift_once();
  }
  uint64_t v7 = v0[7];
  uint64_t v8 = v0[8];
  uint64_t v9 = v0[6];
  uint64_t v10 = sub_100007F14(v9, (uint64_t)qword_100021520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v8, v10, v9);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_100018780();
  os_log_type_t v12 = sub_100018940();
  BOOL v13 = os_log_type_enabled(v11, v12);
  uint64_t v15 = v0[7];
  uint64_t v14 = v0[8];
  uint64_t v17 = v0[5];
  uint64_t v16 = v0[6];
  if (v13)
  {
    uint64_t v27 = v0[6];
    unint64_t v18 = (uint8_t *)swift_slowAlloc();
    unint64_t v28 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v18 = 136315138;
    v0[3] = v17;
    sub_100007FF8((uint64_t *)&unk_100020860);
    sub_1000183B0();
    uint64_t v19 = sub_100018830();
    v0[4] = sub_100012718(v19, v20, (uint64_t *)&v28);
    sub_100018990();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Retrieving ['%s'] from CK Container", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v27);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  if (qword_1000207E8 != -1) {
    swift_once();
  }
  if (qword_1000207F8 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_100021560;
  if (qword_1000207F0 != -1) {
    swift_once();
  }
  uint64_t v22 = qword_100021558;
  uint64_t v23 = swift_task_alloc();
  v0[10] = v23;
  *(void *)(v23 + 16) = v3;
  unint64_t v24 = (void *)swift_task_alloc();
  v0[11] = v24;
  uint64_t v25 = sub_100007FF8((uint64_t *)&unk_100020BC0);
  *unint64_t v24 = v0;
  v24[1] = sub_100016910;
  return CKDatabase.configuredWith<A>(configuration:group:body:)(v0 + 2, v21, v22, &unk_100020BF8, v23, v25);
}

uint64_t sub_100016910()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_100018578;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v2 = sub_100016A34;
  }
  return _swift_task_switch(v2, 0, 0);
}

void sub_100016A34()
{
  unint64_t v24 = v0;
  uint64_t v1 = v0[2];
  uint64_t v21 = &_swiftEmptyDictionarySingleton;
  uint64_t v2 = v1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(v1 + 64);
  int64_t v6 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = v0[12];
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  for (unint64_t i = v9 | (v8 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v8 << 6))
  {
    uint64_t v14 = *(void **)(*(void *)(v1 + 48) + 8 * i);
    uint64_t v15 = *(void *)(v1 + 56) + 16 * i;
    uint64_t v16 = *(void **)v15;
    char v17 = *(unsigned char *)(v15 + 8);
    v22[0] = v14;
    v22[1] = v16;
    char v23 = v17;
    id v18 = v14;
    sub_100018398(v16, v17);
    sub_10000BD44((uint64_t)&v21, (uint64_t)v22);
    if (v7) {
      break;
    }

    sub_1000183A4(v16, v17);
    if (v5) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_33:
      __break(1u);
      return;
    }
    if (v11 >= v6) {
      goto LABEL_29;
    }
    unint64_t v12 = *(void *)(v2 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v6) {
        goto LABEL_29;
      }
      unint64_t v12 = *(void *)(v2 + 8 * v8);
      if (!v12)
      {
        int64_t v8 = v11 + 2;
        if (v11 + 2 >= v6) {
          goto LABEL_29;
        }
        unint64_t v12 = *(void *)(v2 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 3;
          if (v11 + 3 >= v6) {
            goto LABEL_29;
          }
          unint64_t v12 = *(void *)(v2 + 8 * v8);
          if (!v12)
          {
            int64_t v8 = v11 + 4;
            if (v11 + 4 >= v6) {
              goto LABEL_29;
            }
            unint64_t v12 = *(void *)(v2 + 8 * v8);
            if (!v12)
            {
              int64_t v13 = v11 + 5;
              if (v13 >= v6)
              {
LABEL_29:
                swift_release();
                swift_bridgeObjectRelease();
                uint64_t v19 = v21;
                swift_task_dealloc();
                unint64_t v20 = (void (*)(void *))v0[1];
                v20(v19);
                return;
              }
              unint64_t v12 = *(void *)(v2 + 8 * v13);
              if (!v12)
              {
                while (1)
                {
                  int64_t v8 = v13 + 1;
                  if (__OFADD__(v13, 1)) {
                    goto LABEL_33;
                  }
                  if (v8 >= v6) {
                    goto LABEL_29;
                  }
                  unint64_t v12 = *(void *)(v2 + 8 * v8);
                  ++v13;
                  if (v12) {
                    goto LABEL_22;
                  }
                }
              }
              int64_t v8 = v13;
            }
          }
        }
      }
    }
LABEL_22:
    unint64_t v5 = (v12 - 1) & v12;
  }
  swift_bridgeObjectRelease();

  sub_1000183A4(v16, v17);
  swift_release();
}

uint64_t sub_100016CA8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_100018AB0();
  __break(1u);
  return result;
}

uint64_t sub_100016D9C(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = sub_1000187A0();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  return _swift_task_switch(sub_100016E5C, 0, 0);
}

uint64_t sub_100016E5C()
{
  unint64_t v29 = v0;
  uint64_t v1 = v0[5];
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    unint64_t v28 = &_swiftEmptyArrayStorage;
    sub_100018A40();
    uint64_t v4 = v1 + 40;
    do
    {
      id v5 = objc_allocWithZone((Class)CKRecordID);
      swift_bridgeObjectRetain();
      NSString v6 = sub_100018840();
      swift_bridgeObjectRelease();
      [v5 initWithRecordName:v6];

      sub_100018A20();
      sub_100018A50();
      sub_100018A60();
      sub_100018A30();
      v4 += 16;
      --v2;
    }
    while (v2);
    uint64_t v3 = v28;
  }
  v0[9] = v3;
  if (qword_1000207D0 != -1) {
    swift_once();
  }
  uint64_t v7 = v0[7];
  uint64_t v8 = v0[8];
  uint64_t v9 = v0[6];
  uint64_t v10 = sub_100007F14(v9, (uint64_t)qword_100021520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v8, v10, v9);
  swift_bridgeObjectRetain_n();
  int64_t v11 = sub_100018780();
  os_log_type_t v12 = sub_100018940();
  BOOL v13 = os_log_type_enabled(v11, v12);
  uint64_t v15 = v0[7];
  uint64_t v14 = v0[8];
  uint64_t v17 = v0[5];
  uint64_t v16 = v0[6];
  if (v13)
  {
    uint64_t v27 = v0[6];
    id v18 = (uint8_t *)swift_slowAlloc();
    unint64_t v28 = (void *)swift_slowAlloc();
    *(_DWORD *)id v18 = 136315138;
    v0[3] = v17;
    sub_100007FF8((uint64_t *)&unk_100020860);
    sub_1000183B0();
    uint64_t v19 = sub_100018830();
    v0[4] = sub_100012718(v19, v20, (uint64_t *)&v28);
    sub_100018990();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Retrieving ['%s'] from CK Container", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v27);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  if (qword_1000207E8 != -1) {
    swift_once();
  }
  if (qword_1000207F8 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_100021560;
  if (qword_1000207F0 != -1) {
    swift_once();
  }
  uint64_t v22 = qword_100021558;
  uint64_t v23 = swift_task_alloc();
  v0[10] = v23;
  *(void *)(v23 + 16) = v3;
  unint64_t v24 = (void *)swift_task_alloc();
  v0[11] = v24;
  uint64_t v25 = sub_100007FF8((uint64_t *)&unk_100020BC0);
  *unint64_t v24 = v0;
  v24[1] = sub_1000172C4;
  return CKDatabase.configuredWith<A>(configuration:group:body:)(v0 + 2, v21, v22, &unk_100020BB8, v23, v25);
}

uint64_t sub_1000172C4()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_10001765C;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v2 = sub_1000173E8;
  }
  return _swift_task_switch(v2, 0, 0);
}

void sub_1000173E8()
{
  unint64_t v24 = v0;
  uint64_t v1 = v0[2];
  uint64_t v21 = &_swiftEmptyDictionarySingleton;
  uint64_t v2 = v1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(v1 + 64);
  int64_t v6 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = v0[12];
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  for (unint64_t i = v9 | (v8 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v8 << 6))
  {
    uint64_t v14 = *(void **)(*(void *)(v1 + 48) + 8 * i);
    uint64_t v15 = *(void *)(v1 + 56) + 16 * i;
    uint64_t v16 = *(void **)v15;
    char v17 = *(unsigned char *)(v15 + 8);
    v22[0] = v14;
    v22[1] = v16;
    char v23 = v17;
    id v18 = v14;
    sub_100018398(v16, v17);
    sub_10000C744((uint64_t)&v21, (uint64_t)v22);
    if (v7) {
      break;
    }

    sub_1000183A4(v16, v17);
    if (v5) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_33:
      __break(1u);
      return;
    }
    if (v11 >= v6) {
      goto LABEL_29;
    }
    unint64_t v12 = *(void *)(v2 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v6) {
        goto LABEL_29;
      }
      unint64_t v12 = *(void *)(v2 + 8 * v8);
      if (!v12)
      {
        int64_t v8 = v11 + 2;
        if (v11 + 2 >= v6) {
          goto LABEL_29;
        }
        unint64_t v12 = *(void *)(v2 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 3;
          if (v11 + 3 >= v6) {
            goto LABEL_29;
          }
          unint64_t v12 = *(void *)(v2 + 8 * v8);
          if (!v12)
          {
            int64_t v8 = v11 + 4;
            if (v11 + 4 >= v6) {
              goto LABEL_29;
            }
            unint64_t v12 = *(void *)(v2 + 8 * v8);
            if (!v12)
            {
              int64_t v13 = v11 + 5;
              if (v13 >= v6)
              {
LABEL_29:
                swift_release();
                swift_bridgeObjectRelease();
                uint64_t v19 = v21;
                swift_task_dealloc();
                unint64_t v20 = (void (*)(void *))v0[1];
                v20(v19);
                return;
              }
              unint64_t v12 = *(void *)(v2 + 8 * v13);
              if (!v12)
              {
                while (1)
                {
                  int64_t v8 = v13 + 1;
                  if (__OFADD__(v13, 1)) {
                    goto LABEL_33;
                  }
                  if (v8 >= v6) {
                    goto LABEL_29;
                  }
                  unint64_t v12 = *(void *)(v2 + 8 * v8);
                  ++v13;
                  if (v12) {
                    goto LABEL_22;
                  }
                }
              }
              int64_t v8 = v13;
            }
          }
        }
      }
    }
LABEL_22:
    unint64_t v5 = (v12 - 1) & v12;
  }
  swift_bridgeObjectRelease();

  sub_1000183A4(v16, v17);
  swift_release();
}

uint64_t sub_10001765C()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000176D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v31 = a3;
  uint64_t v30 = sub_100007FF8(&qword_100020B80);
  uint64_t v6 = __chkstk_darwin(v30);
  int64_t v8 = (uint64_t *)((char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v6);
  uint64_t v10 = (uint64_t *)((char *)&v27 - v9);
  uint64_t v33 = a1;
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v28 = a2 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & v11;
  int64_t v29 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v32 = a2;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v16 = 0;
  if (!v14) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v17 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  for (unint64_t i = v17 | (v16 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v16 << 6))
  {
    uint64_t v22 = *(void *)(v32 + 56);
    char v23 = (uint64_t *)(*(void *)(v32 + 48) + 16 * i);
    uint64_t v24 = *v23;
    uint64_t v25 = v23[1];
    uint64_t v26 = type metadata accessor for FedStatsPluginCKExperimentRecord();
    sub_100012DE8(v22 + *(void *)(*(void *)(v26 - 8) + 72) * i, (uint64_t)v10 + *(int *)(v30 + 48));
    *uint64_t v10 = v24;
    v10[1] = v25;
    sub_10001821C((uint64_t)v10, (uint64_t)v8, &qword_100020B80);
    swift_bridgeObjectRetain();
    sub_10000E860(&v33, v8, v31);
    if (v3)
    {
      swift_bridgeObjectRelease();
      sub_1000080E8((uint64_t)v8, &qword_100020B80);
      return swift_release();
    }
    uint64_t result = sub_1000080E8((uint64_t)v8, &qword_100020B80);
    if (v14) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v16++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v16 >= v29) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v28 + 8 * v16);
    if (!v20) {
      break;
    }
LABEL_17:
    unint64_t v14 = (v20 - 1) & v20;
  }
  int64_t v21 = v16 + 1;
  if (v16 + 1 >= v29) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v28 + 8 * v21);
  if (v20) {
    goto LABEL_16;
  }
  int64_t v21 = v16 + 2;
  if (v16 + 2 >= v29) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v28 + 8 * v21);
  if (v20) {
    goto LABEL_16;
  }
  int64_t v21 = v16 + 3;
  if (v16 + 3 >= v29) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v28 + 8 * v21);
  if (v20) {
    goto LABEL_16;
  }
  int64_t v21 = v16 + 4;
  if (v16 + 4 >= v29)
  {
LABEL_26:
    swift_release();
    return v33;
  }
  unint64_t v20 = *(void *)(v28 + 8 * v21);
  if (v20)
  {
LABEL_16:
    int64_t v16 = v21;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v16 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v16 >= v29) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v28 + 8 * v16);
    ++v21;
    if (v20) {
      goto LABEL_17;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1000179A0(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = 0;
  int64_t v5 = 0;
  uint64_t v8 = *(void *)(a3 + 64);
  uint64_t v6 = a3 + 64;
  uint64_t v7 = v8;
  uint64_t v9 = 1 << *(unsigned char *)(v6 - 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & v7;
  uint64_t v31 = v6;
  int64_t v32 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v27 = (unint64_t *)result;
  uint64_t v28 = a4 + 7;
LABEL_5:
  uint64_t v29 = v4;
LABEL_6:
  while (v11)
  {
    unint64_t v12 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    unint64_t v13 = v12 | (v5 << 6);
LABEL_22:
    uint64_t v17 = a4[2];
    if (v17)
    {
      id v18 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v13);
      uint64_t v19 = *v18;
      uint64_t v20 = v18[1];
      uint64_t result = a4[4];
      BOOL v21 = result == *v18 && a4[5] == v20;
      if (v21 || (uint64_t result = sub_100018AE0(), (result & 1) != 0))
      {
LABEL_4:
        *(unint64_t *)((char *)v27 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
        uint64_t v4 = v29 + 1;
        if (!__OFADD__(v29, 1)) {
          goto LABEL_5;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
      if (v17 != 1)
      {
        uint64_t v22 = v28;
        uint64_t v23 = 1;
        while (1)
        {
          uint64_t v24 = v23 + 1;
          if (__OFADD__(v23, 1)) {
            break;
          }
          uint64_t result = *(v22 - 1);
          if (result == v19 && *v22 == v20) {
            goto LABEL_4;
          }
          uint64_t result = sub_100018AE0();
          if (result) {
            goto LABEL_4;
          }
          v22 += 2;
          ++v23;
          if (v24 == v17) {
            goto LABEL_6;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
        goto LABEL_41;
      }
    }
  }
  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1)) {
    goto LABEL_40;
  }
  if (v14 >= v32) {
    return sub_100015B58(v27, a2, v29, a3);
  }
  unint64_t v15 = *(void *)(v31 + 8 * v14);
  ++v5;
  if (v15) {
    goto LABEL_21;
  }
  int64_t v5 = v14 + 1;
  if (v14 + 1 >= v32) {
    return sub_100015B58(v27, a2, v29, a3);
  }
  unint64_t v15 = *(void *)(v31 + 8 * v5);
  if (v15) {
    goto LABEL_21;
  }
  int64_t v5 = v14 + 2;
  if (v14 + 2 >= v32) {
    return sub_100015B58(v27, a2, v29, a3);
  }
  unint64_t v15 = *(void *)(v31 + 8 * v5);
  if (v15)
  {
LABEL_21:
    unint64_t v11 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v5 << 6);
    goto LABEL_22;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v32) {
    return sub_100015B58(v27, a2, v29, a3);
  }
  unint64_t v15 = *(void *)(v31 + 8 * v16);
  if (v15)
  {
    int64_t v5 = v16;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v5 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v5 >= v32) {
      return sub_100015B58(v27, a2, v29, a3);
    }
    unint64_t v15 = *(void *)(v31 + 8 * v5);
    ++v16;
    if (v15) {
      goto LABEL_21;
    }
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_100017BF0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  char v7 = *(unsigned char *)(a1 + 32);
  unsigned int v8 = v7 & 0x3F;
  unint64_t v9 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v10 = 8 * v9;
  swift_bridgeObjectRetain_n();
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v8 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1000179A0((uint64_t)&v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v9, a1, a4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v4) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v13 = (void *)swift_slowAlloc();
    bzero(v13, v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_1000179A0((uint64_t)v13, v9, a1, a4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_slowDealloc();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_100017E0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a2 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a2 + 64);
  uint64_t v29 = OBJC_IVAR____TtC26FedStatsMLHostPluginClassA26FedStatsPluginMLHostClient_attachmentIDMaps;
  int64_t v28 = (unint64_t)(v6 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  uint64_t v27 = v4;
  while (v8)
  {
    unint64_t v11 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v12 = v11 | (v10 << 6);
LABEL_20:
    uint64_t v16 = *(void *)(a3 + v29);
    if (*(void *)(v16 + 16))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
      uint64_t v19 = *v17;
      uint64_t v18 = v17[1];
      uint64_t v20 = *(void **)(*(void *)(v4 + 56) + 8 * v12);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v21 = sub_100012D70(v19, v18);
      if (v22)
      {
        uint64_t v23 = v5;
        uint64_t v24 = a3;
        uint64_t v25 = *(void *)(*(void *)(v16 + 56) + 8 * v21);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v26 = sub_100017BF0(v25, v19, v18, v20);
        a3 = v24;
        uint64_t v5 = v23;
        uint64_t v4 = v27;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100010908(v26);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
      }
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  if (__OFADD__(v10++, 1))
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v10 >= v28) {
    goto LABEL_28;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v10);
  if (v14)
  {
LABEL_19:
    unint64_t v8 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
    goto LABEL_20;
  }
  int64_t v15 = v10 + 1;
  if (v10 + 1 >= v28) {
    goto LABEL_28;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  int64_t v15 = v10 + 2;
  if (v10 + 2 >= v28) {
    goto LABEL_28;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  int64_t v15 = v10 + 3;
  if (v10 + 3 >= v28) {
    goto LABEL_28;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  int64_t v15 = v10 + 4;
  if (v10 + 4 >= v28)
  {
LABEL_28:
    swift_release();
    return a1;
  }
  unint64_t v14 = *(void *)(v5 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v10 = v15;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v28) {
      goto LABEL_28;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10001809C()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000180EC()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_1000052E4;
  *(void *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  return _swift_task_switch(sub_100010AAC, 0, 0);
}

unint64_t sub_1000181A0()
{
  unint64_t result = qword_100020AC8;
  if (!qword_100020AC8)
  {
    sub_100018680();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020AC8);
  }
  return result;
}

uint64_t type metadata accessor for FedStatsPluginMLHostClient()
{
  return self;
}

uint64_t sub_10001821C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007FF8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100018280(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007FF8(&qword_100020B80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000182E8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_100018574;
  return sub_10000C52C(a1, a2, v6);
}

id sub_100018398(void *a1, char a2)
{
  if (a2) {
    return (id)swift_errorRetain();
  }
  else {
    return a1;
  }
}

void sub_1000183A4(void *a1, char a2)
{
  if (a2) {
    swift_errorRelease();
  }
  else {
}
  }

unint64_t sub_1000183B0()
{
  unint64_t result = qword_100020BD0;
  if (!qword_100020BD0)
  {
    sub_10001840C((uint64_t *)&unk_100020860);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020BD0);
  }
  return result;
}

uint64_t sub_10001840C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100018458(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_100018574;
  return sub_10000BB50(a1, a2, v6);
}

uint64_t sub_100018508(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FedStatsPluginCKExperimentRecord();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001856C()
{
  return swift_release();
}

uint64_t sub_100018580()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t sub_100018590()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t sub_1000185A0()
{
  return __DataStorage._bytes.getter();
}

uint64_t sub_1000185B0()
{
  return __DataStorage.init(length:)();
}

uint64_t sub_1000185C0()
{
  return __DataStorage._length.getter();
}

uint64_t sub_1000185D0()
{
  return __DataStorage._offset.getter();
}

uint64_t sub_1000185E0()
{
  return type metadata accessor for __DataStorage();
}

uint64_t sub_1000185F0()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t sub_100018600()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100018610()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100018620()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_100018630()
{
  return URL.absoluteString.getter();
}

uint64_t sub_100018640()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

void sub_100018650(NSURL *retstr@<X8>)
{
}

uint64_t sub_100018660()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100018670()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_100018680()
{
  return type metadata accessor for URL();
}

void sub_100018690()
{
}

uint64_t sub_1000186A0()
{
  return Data.init(contentsOf:options:)();
}

uint64_t sub_1000186B0()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t sub_1000186C0()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t sub_1000186D0()
{
  return Data._Representation.append(contentsOf:)();
}

NSData sub_1000186E0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_1000186F0()
{
  return type metadata accessor for Date();
}

uint64_t sub_100018700()
{
  return static AppExtension.main()();
}

uint64_t sub_100018710()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t sub_100018720()
{
  return type metadata accessor for MLHostResult();
}

uint64_t sub_100018760()
{
  return MLHostExtensionContext.taskFolder.getter();
}

uint64_t sub_100018770()
{
  return MLHostExtensionContext.taskName.getter();
}

uint64_t sub_100018780()
{
  return Logger.logObject.getter();
}

uint64_t sub_100018790()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000187A0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000187B0()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_1000187C0()
{
  return static DispatchTimeoutResult.== infix(_:_:)();
}

uint64_t sub_1000187D0()
{
  return static DispatchTime.now()();
}

uint64_t sub_1000187E0()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_1000187F0()
{
  return + infix(_:_:)();
}

NSDictionary sub_100018800()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100018810()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100018820()
{
  return Dictionary.description.getter();
}

uint64_t sub_100018830()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString sub_100018840()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100018850()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100018860()
{
  return String.hash(into:)();
}

void sub_100018870(Swift::String a1)
{
}

Swift::Int sub_100018880()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100018890()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_1000188A0()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_1000188B0()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_1000188C0()
{
  return String.UTF16View.index(_:offsetBy:)();
}

BOOL sub_1000188D0(Swift::String a1)
{
  return String.hasPrefix(_:)(a1);
}

NSArray sub_1000188E0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000188F0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100018900()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100018910()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100018940()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100018950()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100018960()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int sub_100018970()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_100018980()
{
  return CKRecord.recordType.getter();
}

uint64_t sub_100018990()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000189A0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000189B0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000189C0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_1000189D0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_1000189E0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

void sub_1000189F0(Swift::Int a1)
{
}

uint64_t sub_100018A00()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100018A10()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100018A20()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100018A30()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100018A40()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100018A50()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100018A60()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100018A70()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100018A80()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100018A90()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100018AA0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100018AB0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100018AC0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100018AD0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100018AE0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100018AF0()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100018B00()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100018B10()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100018B20()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}