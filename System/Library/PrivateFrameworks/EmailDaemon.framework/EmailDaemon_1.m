uint64_t sub_1DB5D4FD0(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t vars8;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + a2[10];
  v5 = sub_1DB5E1728();
  v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(a1 + a2[11], v5);
  if (*(void *)(a1 + a2[12] + 24))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

char *sub_1DB5D50C8(char *a1, char *a2, int *a3)
{
  uint64_t v5 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v5;
  uint64_t v6 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v6;
  uint64_t v7 = *((void *)a2 + 5);
  *((void *)a1 + 4) = *((void *)a2 + 4);
  *((void *)a1 + 5) = v7;
  uint64_t v8 = *((void *)a2 + 7);
  *((void *)a1 + 6) = *((void *)a2 + 6);
  *((void *)a1 + 7) = v8;
  uint64_t v9 = *((void *)a2 + 9);
  *((void *)a1 + 8) = *((void *)a2 + 8);
  *((void *)a1 + 9) = v9;
  uint64_t v10 = a3[10];
  v20 = &a2[v10];
  v21 = &a1[v10];
  *((void *)a1 + 10) = *((void *)a2 + 10);
  uint64_t v11 = sub_1DB5E1728();
  v19 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19(v21, v20, v11);
  v19(&a1[a3[11]], &a2[a3[11]], v11);
  uint64_t v12 = a3[12];
  v13 = &a1[v12];
  v14 = &a2[v12];
  uint64_t v15 = *((void *)v14 + 3);
  if (v15)
  {
    uint64_t v16 = *((void *)v14 + 1);
    *(void *)v13 = *(void *)v14;
    *((void *)v13 + 1) = v16;
    *((void *)v13 + 2) = *((void *)v14 + 2);
    *((void *)v13 + 3) = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v17 = *((_OWORD *)v14 + 1);
    *(_OWORD *)v13 = *(_OWORD *)v14;
    *((_OWORD *)v13 + 1) = v17;
  }
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_1DB5D5240(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 3) = *((void *)a2 + 3);
  *((void *)a1 + 4) = *((void *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 5) = *((void *)a2 + 5);
  *((void *)a1 + 6) = *((void *)a2 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 7) = *((void *)a2 + 7);
  *((void *)a1 + 8) = *((void *)a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 9) = *((void *)a2 + 9);
  *((void *)a1 + 10) = *((void *)a2 + 10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[10];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_1DB5E1728();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[a3[11]], &a2[a3[11]], v9);
  uint64_t v11 = a3[12];
  uint64_t v12 = &a1[v11];
  v13 = &a2[v11];
  uint64_t v14 = *(void *)&a1[v11 + 24];
  uint64_t v15 = *(void *)&a2[v11 + 24];
  if (v14)
  {
    if (v15)
    {
      *(void *)uint64_t v12 = *(void *)v13;
      *((void *)v12 + 1) = *((void *)v13 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((void *)v12 + 2) = *((void *)v13 + 2);
      *((void *)v12 + 3) = *((void *)v13 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1DB5C80B4((uint64_t)v12);
      long long v16 = *((_OWORD *)v13 + 1);
      *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
      *((_OWORD *)v12 + 1) = v16;
    }
  }
  else if (v15)
  {
    *(void *)uint64_t v12 = *(void *)v13;
    *((void *)v12 + 1) = *((void *)v13 + 1);
    *((void *)v12 + 2) = *((void *)v13 + 2);
    *((void *)v12 + 3) = *((void *)v13 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v17 = *((_OWORD *)v13 + 1);
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
    *((_OWORD *)v12 + 1) = v17;
  }
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1DB5D5470(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  uint64_t v6 = a3[10];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v9 = sub_1DB5E1728();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(a1 + a3[11], a2 + a3[11], v9);
  uint64_t v11 = a3[12];
  uint64_t v12 = a3[13];
  v13 = (_OWORD *)(a1 + v11);
  uint64_t v14 = (_OWORD *)(a2 + v11);
  long long v15 = v14[1];
  _OWORD *v13 = *v14;
  v13[1] = v15;
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  return a1;
}

char *sub_1DB5D5568(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  swift_bridgeObjectRelease();
  uint64_t v7 = *((void *)a2 + 4);
  *((void *)a1 + 3) = *((void *)a2 + 3);
  *((void *)a1 + 4) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *((void *)a2 + 6);
  *((void *)a1 + 5) = *((void *)a2 + 5);
  *((void *)a1 + 6) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *((void *)a2 + 8);
  *((void *)a1 + 7) = *((void *)a2 + 7);
  *((void *)a1 + 8) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *((void *)a2 + 10);
  *((void *)a1 + 9) = *((void *)a2 + 9);
  *((void *)a1 + 10) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[10];
  uint64_t v12 = &a1[v11];
  v13 = &a2[v11];
  uint64_t v14 = sub_1DB5E1728();
  long long v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40);
  v15(v12, v13, v14);
  v15(&a1[a3[11]], &a2[a3[11]], v14);
  uint64_t v16 = a3[12];
  uint64_t v17 = (uint64_t)&a1[v16];
  v18 = &a2[v16];
  if (!*(void *)&a1[v16 + 24]) {
    goto LABEL_5;
  }
  if (!*((void *)v18 + 3))
  {
    sub_1DB5C80B4(v17);
LABEL_5:
    long long v21 = *((_OWORD *)v18 + 1);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
    *(_OWORD *)(v17 + 16) = v21;
    goto LABEL_6;
  }
  uint64_t v19 = *((void *)v18 + 1);
  *(void *)uint64_t v17 = *(void *)v18;
  *(void *)(v17 + 8) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = *((void *)v18 + 3);
  *(void *)(v17 + 16) = *((void *)v18 + 2);
  *(void *)(v17 + 24) = v20;
  swift_bridgeObjectRelease();
LABEL_6:
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1DB5D56D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DB5D56EC);
}

uint64_t sub_1DB5D56EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_1DB5E1728();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 40);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1DB5D579C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DB5D57B0);
}

uint64_t sub_1DB5D57B0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_1DB5E1728();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_1DB5D5858()
{
  uint64_t result = sub_1DB5E1728();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_1DB5D591C()
{
  unint64_t result = qword_1EA917118;
  if (!qword_1EA917118)
  {
    type metadata accessor for SearchableRichLink();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA917118);
  }
  return result;
}

unint64_t sub_1DB5D5974()
{
  unint64_t result = qword_1EA9170B0;
  if (!qword_1EA9170B0)
  {
    sub_1DB5E1728();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA9170B0);
  }
  return result;
}

uint64_t sub_1DB5D59C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5) {
      return 0;
    }
    BOOL v6 = *(void *)a1 == *(void *)a2 && v4 == v5;
    if (!v6 && (sub_1DB5E1D68() & 1) == 0) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  if ((sub_1DB5D23DC(*(void **)(a1 + 16), *(void **)(a2 + 16)) & 1) == 0
    || (*(void *)(a1 + 24) != *(void *)(a2 + 24) || *(void *)(a1 + 32) != *(void *)(a2 + 32))
    && (sub_1DB5E1D68() & 1) == 0
    || (*(void *)(a1 + 40) != *(void *)(a2 + 40) || *(void *)(a1 + 48) != *(void *)(a2 + 48))
    && (sub_1DB5E1D68() & 1) == 0)
  {
    return 0;
  }
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a2 + 64);
  if (v7)
  {
    if (!v8 || (*(void *)(a1 + 56) != *(void *)(a2 + 56) || v7 != v8) && (sub_1DB5E1D68() & 1) == 0) {
      return 0;
    }
  }
  else if (v8)
  {
    return 0;
  }
  if ((*(void *)(a1 + 72) != *(void *)(a2 + 72) || *(void *)(a1 + 80) != *(void *)(a2 + 80))
    && (sub_1DB5E1D68() & 1) == 0)
  {
    return 0;
  }
  uint64_t v9 = type metadata accessor for SearchableRichLink();
  if ((sub_1DB5E1708() & 1) == 0 || (sub_1DB5E1708() & 1) == 0) {
    return 0;
  }
  uint64_t v10 = *(int *)(v9 + 48);
  uint64_t v11 = *(void *)(a1 + v10);
  uint64_t v12 = *(void *)(a1 + v10 + 8);
  uint64_t v13 = *(void *)(a1 + v10 + 16);
  uint64_t v14 = *(void *)(a1 + v10 + 24);
  long long v15 = (uint64_t *)(a2 + v10);
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  uint64_t v18 = v15[2];
  uint64_t v19 = v15[3];
  if (v14)
  {
    if (v19)
    {
      if (v12)
      {
        if (!v17) {
          return 0;
        }
        if (v11 != v16 || v12 != v17)
        {
          uint64_t v20 = v13;
          char v21 = sub_1DB5E1D68();
          uint64_t v13 = v20;
          if ((v21 & 1) == 0) {
            return 0;
          }
        }
      }
      else if (v17)
      {
        return 0;
      }
      if (v13 == v18 && v14 == v19 || (sub_1DB5E1D68() & 1) != 0) {
        goto LABEL_46;
      }
      return 0;
    }
    uint64_t v22 = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v13 = v22;
LABEL_40:
    uint64_t v23 = v13;
    sub_1DB5C8C3C(v16, v17, v18, v19);
    sub_1DB5C8C80(v11, v12, v23, v14);
    sub_1DB5C8C80(v16, v17, v18, v19);
    return 0;
  }
  if (v19) {
    goto LABEL_40;
  }
LABEL_46:
  uint64_t v25 = *(int *)(v9 + 52);
  uint64_t v26 = *(void *)(a1 + v25);
  uint64_t v27 = *(void *)(a2 + v25);

  return sub_1DB5D2714(v26, v27);
}

void __checkOutScheduler_block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138412546;
  *(void *)&v3[4] = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, a2, a3, "Created new scheduler %@ \"%{public}@\"", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __checkOutScheduler_block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138412546;
  *(void *)&v3[4] = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_5(&dword_1DB39C000, a2, a3, "Using existing scheduler %@ with count %lu", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void _expandForCompoundPredicate_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Cannot currently handle a NOT predicate with more than one sub", v2, v3, v4, v5, v6);
}

void _expandPredicate_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, v0, v1, "Got unexpected predicate: %{private}@", v2);
}

void cachedMetadataArgumentsAreValid_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_0(&dword_1DB39C000, v0, v1, "Invalid cached metadata key '%{public}@'", v2);
}

void cachedMetadataArgumentsAreValid_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Trying to access cached metadata for global message ID 0.", v2, v3, v4, v5, v6);
}

void triedToCheckoutWriterWhileOnXPCQueue()
{
}

void and64_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "wrong number of arguments (%d) to and64", (uint8_t *)v2, 8u);
}

uint64_t sub_1DB5E13F8()
{
  return MEMORY[0x1F40E3030]();
}

uint64_t sub_1DB5E1408()
{
  return MEMORY[0x1F40E3068]();
}

uint64_t sub_1DB5E1418()
{
  return MEMORY[0x1F40E3078]();
}

uint64_t sub_1DB5E1428()
{
  return MEMORY[0x1F40E3088]();
}

uint64_t sub_1DB5E1438()
{
  return MEMORY[0x1F40E30B0]();
}

uint64_t sub_1DB5E1448()
{
  return MEMORY[0x1F40E30C8]();
}

uint64_t sub_1DB5E1458()
{
  return MEMORY[0x1F40E3120]();
}

uint64_t sub_1DB5E1468()
{
  return MEMORY[0x1F40E3148]();
}

uint64_t sub_1DB5E1478()
{
  return MEMORY[0x1F40E3158]();
}

uint64_t sub_1DB5E1488()
{
  return MEMORY[0x1F40E37C8]();
}

uint64_t sub_1DB5E1498()
{
  return MEMORY[0x1F40E37D8]();
}

uint64_t sub_1DB5E14A8()
{
  return MEMORY[0x1F40E37E8]();
}

uint64_t sub_1DB5E14B8()
{
  return MEMORY[0x1F40E37F8]();
}

uint64_t sub_1DB5E14C8()
{
  return MEMORY[0x1F40E3808]();
}

uint64_t sub_1DB5E14D8()
{
  return MEMORY[0x1F40E3810]();
}

uint64_t sub_1DB5E14E8()
{
  return MEMORY[0x1F40E3828]();
}

uint64_t sub_1DB5E14F8()
{
  return MEMORY[0x1F40E3B78]();
}

uint64_t sub_1DB5E1508()
{
  return MEMORY[0x1F40E41D8]();
}

uint64_t sub_1DB5E1518()
{
  return MEMORY[0x1F40E4208]();
}

uint64_t sub_1DB5E1528()
{
  return MEMORY[0x1F40E4218]();
}

uint64_t sub_1DB5E1538()
{
  return MEMORY[0x1F40E4538]();
}

uint64_t sub_1DB5E1548()
{
  return MEMORY[0x1F40E4548]();
}

uint64_t sub_1DB5E1558()
{
  return MEMORY[0x1F40E48D0]();
}

uint64_t sub_1DB5E1568()
{
  return MEMORY[0x1F40E4900]();
}

uint64_t sub_1DB5E1578()
{
  return MEMORY[0x1F40E4998]();
}

uint64_t sub_1DB5E1588()
{
  return MEMORY[0x1F40E4A00]();
}

uint64_t sub_1DB5E1598()
{
  return MEMORY[0x1F40E4A48]();
}

uint64_t sub_1DB5E15A8()
{
  return MEMORY[0x1F40E4A78]();
}

uint64_t sub_1DB5E15B8()
{
  return MEMORY[0x1F40E4A98]();
}

uint64_t sub_1DB5E15C8()
{
  return MEMORY[0x1F40E4AB8]();
}

uint64_t sub_1DB5E15D8()
{
  return MEMORY[0x1F40E4B08]();
}

uint64_t sub_1DB5E15E8()
{
  return MEMORY[0x1F40E4B18]();
}

uint64_t sub_1DB5E15F8()
{
  return MEMORY[0x1F40E4B28]();
}

uint64_t sub_1DB5E1608()
{
  return MEMORY[0x1F40E4B60]();
}

uint64_t sub_1DB5E1618()
{
  return MEMORY[0x1F40E4B70]();
}

uint64_t sub_1DB5E1628()
{
  return MEMORY[0x1F40E4B88]();
}

uint64_t sub_1DB5E1638()
{
  return MEMORY[0x1F40E4BC0]();
}

uint64_t sub_1DB5E1648()
{
  return MEMORY[0x1F40E4BE8]();
}

uint64_t sub_1DB5E1658()
{
  return MEMORY[0x1F40E4C60]();
}

uint64_t sub_1DB5E1668()
{
  return MEMORY[0x1F40E4C88]();
}

uint64_t sub_1DB5E1678()
{
  return MEMORY[0x1F40E4CB0]();
}

uint64_t sub_1DB5E1688()
{
  return MEMORY[0x1F40E4CE0]();
}

uint64_t sub_1DB5E1698()
{
  return MEMORY[0x1F40E4D50]();
}

uint64_t sub_1DB5E16A8()
{
  return MEMORY[0x1F40E4DA0]();
}

uint64_t sub_1DB5E16B8()
{
  return MEMORY[0x1F40E4E58]();
}

uint64_t sub_1DB5E16C8()
{
  return MEMORY[0x1F40E4ED8]();
}

uint64_t sub_1DB5E16D8()
{
  return MEMORY[0x1F40E4EE8]();
}

uint64_t sub_1DB5E16E8()
{
  return MEMORY[0x1F40E50B0]();
}

uint64_t sub_1DB5E16F8()
{
  return MEMORY[0x1F40E5190]();
}

uint64_t sub_1DB5E1708()
{
  return MEMORY[0x1F40E52C8]();
}

uint64_t sub_1DB5E1718()
{
  return MEMORY[0x1F40E52E8]();
}

uint64_t sub_1DB5E1728()
{
  return MEMORY[0x1F40E5380]();
}

uint64_t sub_1DB5E1738()
{
  return MEMORY[0x1F40E5888]();
}

uint64_t sub_1DB5E1748()
{
  return MEMORY[0x1F4187858]();
}

uint64_t sub_1DB5E1758()
{
  return MEMORY[0x1F4187888]();
}

uint64_t sub_1DB5E1768()
{
  return MEMORY[0x1F41878C8]();
}

uint64_t sub_1DB5E1778()
{
  return MEMORY[0x1F41878E8]();
}

uint64_t sub_1DB5E1788()
{
  return MEMORY[0x1F41878F8]();
}

uint64_t sub_1DB5E1798()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1DB5E17A8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1DB5E17B8()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1DB5E17C8()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1DB5E17D8()
{
  return MEMORY[0x1F4186CB8]();
}

uint64_t sub_1DB5E17E8()
{
  return MEMORY[0x1F4186CD8]();
}

uint64_t sub_1DB5E17F8()
{
  return MEMORY[0x1F4186D00]();
}

uint64_t sub_1DB5E1808()
{
  return MEMORY[0x1F4186D68]();
}

uint64_t sub_1DB5E1818()
{
  return MEMORY[0x1F40E5FF8]();
}

uint64_t sub_1DB5E1828()
{
  return MEMORY[0x1F40E6028]();
}

uint64_t sub_1DB5E1838()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1DB5E1848()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1DB5E1858()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1DB5E1868()
{
  return MEMORY[0x1F40E6198]();
}

uint64_t sub_1DB5E1878()
{
  return MEMORY[0x1F40E61B0]();
}

uint64_t sub_1DB5E1888()
{
  return MEMORY[0x1F40E61C0]();
}

uint64_t sub_1DB5E1898()
{
  return MEMORY[0x1F40E61D0]();
}

uint64_t sub_1DB5E18A8()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1DB5E18B8()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1DB5E18C8()
{
  return MEMORY[0x1F4183950]();
}

uint64_t sub_1DB5E18D8()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1DB5E18E8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1DB5E18F8()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1DB5E1908()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1DB5E1918()
{
  return MEMORY[0x1F4183A00]();
}

uint64_t sub_1DB5E1928()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1DB5E1938()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1DB5E1948()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1DB5E1958()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1DB5E1968()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1DB5E1988()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1DB5E1998()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1DB5E19A8()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1DB5E19B8()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1DB5E19C8()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1DB5E19D8()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1DB5E19E8()
{
  return MEMORY[0x1F40E6340]();
}

uint64_t sub_1DB5E19F8()
{
  return MEMORY[0x1F40E6368]();
}

uint64_t sub_1DB5E1A08()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1DB5E1A18()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1DB5E1A28()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1DB5E1A38()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1DB5E1A48()
{
  return MEMORY[0x1F40E6480]();
}

uint64_t sub_1DB5E1A58()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1DB5E1A68()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1DB5E1A78()
{
  return MEMORY[0x1F41870E8]();
}

uint64_t sub_1DB5E1A88()
{
  return MEMORY[0x1F4187118]();
}

uint64_t sub_1DB5E1A98()
{
  return MEMORY[0x1F40D4AA0]();
}

uint64_t sub_1DB5E1AA8()
{
  return MEMORY[0x1F40E6908]();
}

uint64_t sub_1DB5E1AB8()
{
  return MEMORY[0x1F41874B0]();
}

uint64_t sub_1DB5E1AC8()
{
  return MEMORY[0x1F41874B8]();
}

uint64_t sub_1DB5E1AD8()
{
  return MEMORY[0x1F41874C8]();
}

uint64_t sub_1DB5E1AE8()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1DB5E1AF8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1DB5E1B08()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1DB5E1B18()
{
  return MEMORY[0x1F40E6BB8]();
}

uint64_t sub_1DB5E1B28()
{
  return MEMORY[0x1F40E6D60]();
}

uint64_t sub_1DB5E1B38()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1DB5E1B48()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1DB5E1B58()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1DB5E1B68()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1DB5E1B78()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1DB5E1B88()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1DB5E1B98()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1DB5E1BA8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1DB5E1BB8()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1DB5E1BC8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1DB5E1BD8()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1DB5E1BE8()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1DB5E1BF8()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1DB5E1C08()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1DB5E1C18()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1DB5E1C28()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1DB5E1C38()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1DB5E1C48()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1DB5E1C58()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1DB5E1C68()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1DB5E1C78()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1DB5E1C88()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1DB5E1C98()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1DB5E1CA8()
{
  return MEMORY[0x1F41853B0]();
}

uint64_t sub_1DB5E1CB8()
{
  return MEMORY[0x1F41853B8]();
}

uint64_t sub_1DB5E1CD8()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1DB5E1CE8()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1DB5E1CF8()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1DB5E1D08()
{
  return MEMORY[0x1F4185540]();
}

uint64_t sub_1DB5E1D18()
{
  return MEMORY[0x1F4185558]();
}

uint64_t sub_1DB5E1D28()
{
  return MEMORY[0x1F4185560]();
}

uint64_t sub_1DB5E1D38()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1DB5E1D48()
{
  return MEMORY[0x1F41856E0]();
}

uint64_t sub_1DB5E1D58()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1DB5E1D68()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1DB5E1D78()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t sub_1DB5E1D88()
{
  return MEMORY[0x1F4185B40]();
}

uint64_t sub_1DB5E1D98()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1DB5E1DA8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1DB5E1DB8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1DB5E1DC8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1DB5E1DD8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1DB5E1DE8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1DB5E1DF8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1DB5E1E08()
{
  return MEMORY[0x1F4185E30]();
}

uint64_t sub_1DB5E1E18()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1DB5E1E28()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1DB5E1E38()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1DB5E1E48()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1DB5E1E58()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1DB5E1E68()
{
  return MEMORY[0x1F40E6ED0]();
}

uint64_t sub_1DB5E1E78()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1DB5E1E88()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_1DB5E1E98()
{
  return MEMORY[0x1F4185FF0]();
}

int AAArchiveStreamClose(AAArchiveStream s)
{
  return MEMORY[0x1F4179268](s);
}

int AAArchiveStreamWritePathList(AAArchiveStream s, AAPathList path_list, AAFieldKeySet key_set, const char *dir, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return MEMORY[0x1F4179298](s, path_list, key_set, dir, msg_data, msg_proc, flags, *(void *)&n_threads);
}

int AAByteStreamClose(AAByteStream s)
{
  return MEMORY[0x1F41792A8](s);
}

AAByteStream AACompressionOutputStreamOpen(AAByteStream compressed_stream, AACompressionAlgorithm compression_algorithm, size_t block_size, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x1F41792C8](compressed_stream, *(void *)&compression_algorithm, block_size, flags, *(void *)&n_threads);
}

AAArchiveStream AAEncodeArchiveOutputStreamOpen(AAByteStream stream, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAArchiveStream)MEMORY[0x1F4179318](stream, msg_data, msg_proc, flags, *(void *)&n_threads);
}

AAFieldKeySet AAFieldKeySetCreateWithString(const char *s)
{
  return (AAFieldKeySet)MEMORY[0x1F4179328](s);
}

void AAFieldKeySetDestroy(AAFieldKeySet key_set)
{
}

AAByteStream AAFileStreamOpenWithPath(const char *path, int open_flags, mode_t open_mode)
{
  return (AAByteStream)MEMORY[0x1F4179348](path, *(void *)&open_flags, open_mode);
}

AAPathList AAPathListCreateWithDirectoryContents(const char *dir, const char *path, void *msg_data, AAEntryMessageProc msg_proc, AAFlagSet flags, int n_threads)
{
  return (AAPathList)MEMORY[0x1F41793A8](dir, path, msg_data, msg_proc, flags, *(void *)&n_threads);
}

void AAPathListDestroy(AAPathList path_list)
{
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

CFStringRef CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D83A0](*(void *)&encoding);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationDisplayNotice(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle)
{
  return MEMORY[0x1F40D8A50](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
}

uint64_t CKRetryAfterSecondsForError()
{
  return MEMORY[0x1F40D6448]();
}

uint64_t DRSubmitLog()
{
  return MEMORY[0x1F4117558]();
}

uint64_t ECConvertCharacterSetNameToEncoding()
{
  return MEMORY[0x1F4117868]();
}

uint64_t EFARC4NormallyDistributedRandomDoubleInRange()
{
  return MEMORY[0x1F4117A08]();
}

uint64_t EFARC4NormallyDistributedRandomDoubleWithMinimum()
{
  return MEMORY[0x1F4117A10]();
}

uint64_t EFAtomicObjectLoad()
{
  return MEMORY[0x1F4117A20]();
}

uint64_t EFAtomicObjectRelease()
{
  return MEMORY[0x1F4117A28]();
}

uint64_t EFAtomicObjectReleaseIfIdentical()
{
  return MEMORY[0x1F4117A30]();
}

uint64_t EFAtomicObjectSetIfIdentical()
{
  return MEMORY[0x1F4117A38]();
}

uint64_t EFAtomicObjectSetIfNil()
{
  return MEMORY[0x1F4117A40]();
}

uint64_t EFBundleIdentifierForXPCConnection()
{
  return MEMORY[0x1F4117A58]();
}

uint64_t EFComparatorFromSortDescriptors()
{
  return MEMORY[0x1F4117A60]();
}

uint64_t EFContentProtectionValidateObservedStateIsUnlocked()
{
  return MEMORY[0x1F4117A88]();
}

uint64_t EFCopyResponseDataForURLRequest()
{
  return MEMORY[0x1F4117A90]();
}

uint64_t EFDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F4117AA0]();
}

uint64_t EFFetchSignpostLog()
{
  return MEMORY[0x1F4117AB0]();
}

uint64_t EFFrameworkVersion()
{
  return MEMORY[0x1F4117AB8]();
}

uint64_t EFIsRunningUnitTests()
{
  return MEMORY[0x1F4117AC8]();
}

uint64_t EFLogRegisterStateCaptureBlock()
{
  return MEMORY[0x1F4117AD8]();
}

uint64_t EFMarkFileAsPurgeableFD()
{
  return MEMORY[0x1F4117AE0]();
}

uint64_t EFNumbersAreEqual()
{
  return MEMORY[0x1F4117AF8]();
}

uint64_t EFObjectsAreEqual()
{
  return MEMORY[0x1F4117B00]();
}

uint64_t EFPostUTF8FormData()
{
  return MEMORY[0x1F4117B08]();
}

uint64_t EFProductName()
{
  return MEMORY[0x1F4117B10]();
}

uint64_t EFProtectedDataAvailable()
{
  return MEMORY[0x1F4117B18]();
}

uint64_t EFRegisterContentProtectionObserver()
{
  return MEMORY[0x1F4117B28]();
}

uint64_t EFSQLVerboseDebugLoggingEnabled()
{
  return MEMORY[0x1F4117B30]();
}

uint64_t EFSaveTailspin()
{
  return MEMORY[0x1F4117B38]();
}

uint64_t EFStringWithInt64()
{
  return MEMORY[0x1F4117B50]();
}

uint64_t EFStringWithUInt64()
{
  return MEMORY[0x1F4117B58]();
}

uint64_t EFStringsAreEqual()
{
  return MEMORY[0x1F4117B68]();
}

uint64_t EFSystemBuildVersion()
{
  return MEMORY[0x1F4117B70]();
}

uint64_t EFUnregisterContentProtectionObserver()
{
  return MEMORY[0x1F4117B80]();
}

uint64_t EFVerifyFileProtectionType()
{
  return MEMORY[0x1F4117B88]();
}

uint64_t EMBIMIIncomingServerHighLevelDomainIsAllowlisted()
{
  return MEMORY[0x1F41177B8]();
}

uint64_t EMBlackPearlIsFeatureEnabled()
{
  return MEMORY[0x1F41177C0]();
}

uint64_t EMBlackPearlIsLanguageSupported()
{
  return MEMORY[0x1F41177C8]();
}

uint64_t EMCategoryFromSubtype()
{
  return MEMORY[0x1F41177D0]();
}

uint64_t EMCategoryTypeFromString()
{
  return MEMORY[0x1F41177D8]();
}

uint64_t EMInteractionLoggerShouldLog()
{
  return MEMORY[0x1F41177E0]();
}

uint64_t EMIsGreymatterAvailableWithOverride()
{
  return MEMORY[0x1F41177E8]();
}

uint64_t EMIsGreymatterSupportedWithOverride()
{
  return MEMORY[0x1F41177F0]();
}

uint64_t EMLogCategoryMessageLoading()
{
  return MEMORY[0x1F41177F8]();
}

uint64_t EMPrivacyProxyIsDisabledForNetwork()
{
  return MEMORY[0x1F4117818]();
}

uint64_t EMRecodeDataToNetwork()
{
  return MEMORY[0x1F4117820]();
}

uint64_t EMStringFromCategoryType()
{
  return MEMORY[0x1F4117830]();
}

uint64_t EMStringFromSubtype()
{
  return MEMORY[0x1F4117838]();
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x1F412A6A8]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x1F412A768]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x1F412A788]();
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1 = MEMORY[0x1F40E7200](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1F4147180]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1F4147188]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteSint32Field()
{
  return MEMORY[0x1F4147210]();
}

uint64_t PBDataWriterWriteSint64Field()
{
  return MEMORY[0x1F4147218]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PBRepeatedBOOLAdd()
{
  return MEMORY[0x1F41472B8]();
}

uint64_t PBRepeatedBOOLClear()
{
  return MEMORY[0x1F41472C0]();
}

uint64_t PBRepeatedBOOLCopy()
{
  return MEMORY[0x1F41472C8]();
}

uint64_t PBRepeatedBOOLHash()
{
  return MEMORY[0x1F41472D0]();
}

uint64_t PBRepeatedBOOLIsEqual()
{
  return MEMORY[0x1F41472D8]();
}

uint64_t PBRepeatedBOOLNSArray()
{
  return MEMORY[0x1F41472E0]();
}

uint64_t PBRepeatedInt64Add()
{
  return MEMORY[0x1F4147398]();
}

uint64_t PBRepeatedInt64Clear()
{
  return MEMORY[0x1F41473A0]();
}

uint64_t PBRepeatedInt64Copy()
{
  return MEMORY[0x1F41473A8]();
}

uint64_t PBRepeatedInt64Hash()
{
  return MEMORY[0x1F41473B0]();
}

uint64_t PBRepeatedInt64IsEqual()
{
  return MEMORY[0x1F41473B8]();
}

uint64_t PBRepeatedInt64NSArray()
{
  return MEMORY[0x1F41473C0]();
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x1F4145DC0]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x1F4145DD0]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

uint64_t SpotlightDaemonClientRegister()
{
  return MEMORY[0x1F415BAA8]();
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

uint64_t _EFLocalizedString()
{
  return MEMORY[0x1F4117B90]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _sqlite3_integrity_check()
{
  return MEMORY[0x1F4181F48]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  return (objc_property_t)MEMORY[0x1F4181550](cls, name);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1F417F0C0](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0D0](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1F417F0E0](stream, *(void *)&flags);
}

uint64_t container_create_or_lookup_app_group_paths_for_current_user()
{
  return MEMORY[0x1F40CB568]();
}

uint64_t container_get_identifier()
{
  return MEMORY[0x1F40CB640]();
}

uint64_t container_get_path()
{
  return MEMORY[0x1F40CB650]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1F40CB720]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1F40CB730]();
}

uint64_t container_query_iterate_results_sync()
{
  return MEMORY[0x1F40CB748]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1F40CB750]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1F40CB760]();
}

uint64_t container_query_set_include_other_owners()
{
  return MEMORY[0x1F40CB778]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x1F40CB780]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1F40CBA00](data, applier);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1F40CBA48](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1F40CBAD8](type, *(void *)&fd, queue, cleanup_handler);
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t ef_xpc_activity_register()
{
  return MEMORY[0x1F4117BA0]();
}

uint64_t ef_xpc_activity_register_withcriteria()
{
  return MEMORY[0x1F4117BA8]();
}

uint64_t ef_xpc_activity_run_if_necessary()
{
  return MEMORY[0x1F4117BB0]();
}

void exit(int a1)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC578]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE0](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1F40CD0F0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1F4181AE8](p, isRequiredMethod, isInstanceMethod, outCount);
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int sqlite3_backup_finish(sqlite3_backup *p)
{
  return MEMORY[0x1F4181F68](p);
}

sqlite3_backup *__cdecl sqlite3_backup_init(sqlite3 *pDest, const char *zDestName, sqlite3 *pSource, const char *zSourceName)
{
  return (sqlite3_backup *)MEMORY[0x1F4181F70](pDest, zDestName, pSource, zSourceName);
}

int sqlite3_backup_step(sqlite3_backup *p, int nPage)
{
  return MEMORY[0x1F4181F88](p, *(void *)&nPage);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1F4182048](a1, *(void *)&ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1F4182050](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1F4182068](a1);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x1F4182118](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1F4182190](db);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
}

void sqlite3_set_last_insert_rowid(sqlite3 *a1, sqlite3_int64 a2)
{
}

int sqlite3_sleep(int a1)
{
  return MEMORY[0x1F4182368](*(void *)&a1);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int sqlite3_table_column_metadata(sqlite3 *db, const char *zDbName, const char *zTableName, const char *zColumnName, const char **pzDataType, const char **pzCollSeq, int *pNotNull, int *pPrimaryKey, int *pAutoinc)
{
  return MEMORY[0x1F41823E0](db, zDbName, zTableName, zColumnName, pzDataType, pzCollSeq, pNotNull, pPrimaryKey);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x1F4182448](a1);
}

sqlite3_vfs *__cdecl sqlite3_vfs_find(const char *zVfsName)
{
  return (sqlite3_vfs *)MEMORY[0x1F4182470](zVfsName);
}

int sqlite3_vfs_register(sqlite3_vfs *a1, int makeDflt)
{
  return MEMORY[0x1F4182478](a1, *(void *)&makeDflt);
}

int sscanf_l(const char *a1, locale_t a2, const char *a3, ...)
{
  return MEMORY[0x1F40CE0D8](a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1F40CEE88](xdict);
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

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

uint64_t objc_msgSenduint64_tSetFromSet_byRemovingIndexesFromSet_andLimitingTo_(void *a1, const char *a2, ...)
{
  return MEMORY[0x1F4181798](a1, seluint64_tSetFromSet_byRemovingIndexesFromSet_andLimitingTo_);
}