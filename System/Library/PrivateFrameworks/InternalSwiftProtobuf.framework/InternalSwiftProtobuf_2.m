void sub_1B3788C9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_14_14();
  OUTLINED_FUNCTION_4_28(v2, v3);
  if (*(void *)(v0 + 16))
  {
    OUTLINED_FUNCTION_35_9();
    do
    {
      v4 = *(void *)(v0 + 32);
      swift_bridgeObjectRetain();
      v5 = v1;
      sub_1B36DC17C();
      swift_bridgeObjectRetain();
      sub_1B36DC17C();
      sub_1B36DBED8(": ", (char *)2);
      if ((v4 & 0x8000000000000000) != 0)
      {
        if ((OUTLINED_FUNCTION_50() & 1) == 0)
        {
          OUTLINED_FUNCTION_10();
          v5 = v9;
        }
        if (*(void *)(v5 + 16) >= *(void *)(v5 + 24) >> 1) {
          OUTLINED_FUNCTION_23();
        }
        OUTLINED_FUNCTION_20_14();
      }
      v6 = v1;
      sub_1B3785334(v4);
      if ((OUTLINED_FUNCTION_50() & 1) == 0)
      {
        OUTLINED_FUNCTION_10();
        v6 = v8;
      }
      if (*(void *)(v6 + 16) >= *(void *)(v6 + 24) >> 1) {
        OUTLINED_FUNCTION_23();
      }
      OUTLINED_FUNCTION_31_11();
    }
    while (!v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_15_15();
}

void sub_1B3788DD4()
{
  OUTLINED_FUNCTION_14_14();
  OUTLINED_FUNCTION_4_28(v2, v3);
  if (*(void *)(v0 + 16))
  {
    OUTLINED_FUNCTION_35_9();
    do
    {
      unint64_t v4 = *(unsigned int *)(v0 + 32);
      swift_bridgeObjectRetain();
      uint64_t v5 = v1;
      sub_1B36DC17C();
      swift_bridgeObjectRetain();
      sub_1B36DC17C();
      sub_1B36DBED8(": ", (char *)2);
      sub_1B3785334(v4);
      if ((OUTLINED_FUNCTION_50() & 1) == 0)
      {
        OUTLINED_FUNCTION_10();
        uint64_t v5 = v7;
      }
      if (*(void *)(v5 + 16) >= *(void *)(v5 + 24) >> 1) {
        OUTLINED_FUNCTION_23();
      }
      OUTLINED_FUNCTION_28_11();
    }
    while (!v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_15_15();
}

void sub_1B3788EC4()
{
  OUTLINED_FUNCTION_14_14();
  OUTLINED_FUNCTION_4_28(v2, v3);
  if (*(void *)(v0 + 16))
  {
    OUTLINED_FUNCTION_35_9();
    do
    {
      unint64_t v4 = *(void *)(v0 + 32);
      swift_bridgeObjectRetain();
      uint64_t v5 = v1;
      sub_1B36DC17C();
      swift_bridgeObjectRetain();
      sub_1B36DC17C();
      sub_1B36DBED8(": ", (char *)2);
      sub_1B3785334(v4);
      if ((OUTLINED_FUNCTION_50() & 1) == 0)
      {
        OUTLINED_FUNCTION_10();
        uint64_t v5 = v7;
      }
      if (*(void *)(v5 + 16) >= *(void *)(v5 + 24) >> 1) {
        OUTLINED_FUNCTION_23();
      }
      OUTLINED_FUNCTION_28_11();
    }
    while (!v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_15_15();
}

void sub_1B3788FB4()
{
}

void sub_1B3788FCC()
{
}

void sub_1B3788FE4()
{
}

void sub_1B3788FFC()
{
}

void sub_1B3789014()
{
  OUTLINED_FUNCTION_14_14();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_21(v2, v4);
  uint64_t v5 = *(void *)(v3 + 16);
  if (v5)
  {
    OUTLINED_FUNCTION_35_9();
    uint64_t v6 = 0;
    do
    {
      int v7 = *(unsigned __int8 *)(v3 + v6 + 32);
      swift_bridgeObjectRetain();
      v8 = v1;
      sub_1B36DC17C();
      swift_bridgeObjectRetain();
      sub_1B36DC17C();
      sub_1B36DBED8(": ", (char *)2);
      if (v7) {
        v9 = "true";
      }
      else {
        v9 = "false";
      }
      if (v7) {
        uint64_t v10 = 4;
      }
      else {
        uint64_t v10 = 5;
      }
      sub_1B36DBED8(v9, (char *)v10);
      if ((OUTLINED_FUNCTION_50() & 1) == 0)
      {
        OUTLINED_FUNCTION_10();
        v8 = v12;
      }
      unint64_t v11 = v8[2];
      if (v11 >= v8[3] >> 1)
      {
        OUTLINED_FUNCTION_23();
        v8 = v13;
      }
      ++v6;
      v8[2] = v11 + 1;
      *((unsigned char *)v8 + v11 + 32) = 10;
      *uint64_t v1 = v8;
    }
    while (v5 != v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_15_15();
}

void sub_1B3789140()
{
  OUTLINED_FUNCTION_14_14();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_6_21(v1, v3);
  uint64_t v4 = *(void *)(v2 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = (unint64_t *)(v2 + 40);
    do
    {
      uint64_t v6 = *(v5 - 1);
      unint64_t v7 = *v5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_1B36DC17C();
      swift_bridgeObjectRetain();
      sub_1B36DC17C();
      OUTLINED_FUNCTION_12_13(": ");
      sub_1B37856D4(v6, v7);
      swift_bridgeObjectRelease();
      sub_1B374BB28();
      uint64_t v8 = *(void *)(*v0 + 16);
      sub_1B374BA20(v8);
      uint64_t v9 = *v0;
      *(void *)(v9 + 16) = v8 + 1;
      *(unsigned char *)(v9 + v8 + 32) = 10;
      *uint64_t v0 = v9;
      v5 += 2;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_15_15();
}

uint64_t sub_1B3789244(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t *)v2;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(v2 + 8);
  uint64_t v7 = *(void *)(v2 + 48);
  uint64_t v8 = *(void *)(v2 + 56);
  char v9 = *(unsigned char *)(v2 + 64);
  *(void *)&v35[0] = *(void *)v2;
  *((void *)&v35[0] + 1) = v6;
  long long v10 = *(_OWORD *)(v2 + 32);
  v35[1] = *(_OWORD *)(v2 + 16);
  v35[2] = v10;
  uint64_t v36 = v7;
  uint64_t v37 = v8;
  char v38 = v9;
  sub_1B3786D34(a2);
  uint64_t v11 = *(void *)(a1 + 16);
  if (!v11) {
    return swift_bridgeObjectRelease();
  }
  uint64_t v34 = v3;
  swift_bridgeObjectRetain();
  v12 = (unint64_t *)(a1 + 40);
  do
  {
    uint64_t v13 = *(v12 - 1);
    unint64_t v14 = *v12;
    sub_1B36B9E20(v13, *v12);
    swift_bridgeObjectRetain();
    uint64_t v15 = (uint64_t)v4;
    sub_1B36DC17C();
    swift_bridgeObjectRetain();
    sub_1B36DC17C();
    sub_1B36DBED8(": ", (char *)2);
    if ((OUTLINED_FUNCTION_50() & 1) == 0)
    {
      OUTLINED_FUNCTION_10();
      uint64_t v15 = v28;
    }
    unint64_t v16 = *(void *)(v15 + 16);
    if (v16 >= *(void *)(v15 + 24) >> 1)
    {
      OUTLINED_FUNCTION_23();
      uint64_t v15 = v29;
    }
    v12 += 2;
    *(void *)(v15 + 16) = v16 + 1;
    *(unsigned char *)(v15 + v16 + 32) = 34;
    *uint64_t v4 = v15;
    switch(v14 >> 62)
    {
      case 1uLL:
        if (v13 >> 32 < (int)v13)
        {
          __break(1u);
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
        }
        uint64_t v15 = v14 & 0x3FFFFFFFFFFFFFFFLL;
        sub_1B36B9E20(v13, v14);
        if (sub_1B37A0530() && __OFSUB__((int)v13, sub_1B37A0560())) {
          goto LABEL_38;
        }
        uint64_t v24 = sub_1B37A0550();
        uint64_t v25 = (v13 >> 32) - (int)v13;
        if (v24 < v25) {
          uint64_t v25 = v24;
        }
        OUTLINED_FUNCTION_30_11(v25);
        uint64_t v34 = v3;
        if (v3) {
          goto LABEL_40;
        }
        sub_1B36C2E10(v13, v14);
        break;
      case 2uLL:
        uint64_t v15 = v14 & 0x3FFFFFFFFFFFFFFFLL;
        uint64_t v18 = *(void *)(v13 + 16);
        uint64_t v19 = *(void *)(v13 + 24);
        swift_retain();
        swift_retain();
        if (sub_1B37A0530() && __OFSUB__(v18, sub_1B37A0560())) {
          goto LABEL_37;
        }
        BOOL v20 = __OFSUB__(v19, v18);
        uint64_t v21 = v19 - v18;
        if (v20) {
          goto LABEL_36;
        }
        uint64_t v22 = sub_1B37A0550();
        if (v22 >= v21) {
          uint64_t v23 = v21;
        }
        else {
          uint64_t v23 = v22;
        }
        OUTLINED_FUNCTION_30_11(v23);
        uint64_t v34 = v3;
        if (v3)
        {
          swift_release();
          swift_release();
          __break(1u);
LABEL_40:
          sub_1B36C2E10(v13, v14);
          __break(1u);
          JUMPOUT(0x1B378963CLL);
        }
        swift_release();
        swift_release();
        break;
      case 3uLL:
        *(void *)((char *)v35 + 6) = 0;
        *(void *)&v35[0] = 0;
        v17 = (char *)v35;
        goto LABEL_18;
      default:
        *(void *)&v35[0] = v13;
        WORD4(v35[0]) = v14;
        BYTE10(v35[0]) = BYTE2(v14);
        BYTE11(v35[0]) = BYTE3(v14);
        BYTE12(v35[0]) = BYTE4(v14);
        BYTE13(v35[0]) = BYTE5(v14);
        v17 = (char *)v35 + BYTE6(v14);
LABEL_18:
        uint64_t v3 = v34;
        sub_1B3785DD4((unsigned __int8 *)v35, (uint64_t)v17, v4);
        break;
    }
    if ((OUTLINED_FUNCTION_50() & 1) == 0)
    {
      OUTLINED_FUNCTION_10();
      uint64_t v15 = v30;
    }
    unint64_t v26 = *(void *)(v15 + 16);
    unint64_t v27 = v26 + 1;
    if (v26 >= *(void *)(v15 + 24) >> 1)
    {
      OUTLINED_FUNCTION_23();
      uint64_t v15 = v31;
    }
    *(void *)(v15 + 16) = v27;
    *(unsigned char *)(v15 + v26 + 32) = 34;
    *uint64_t v4 = v15;
    if ((int64_t)(v26 + 2) > *(void *)(v15 + 24) >> 1)
    {
      OUTLINED_FUNCTION_23();
      uint64_t v15 = v32;
    }
    *(void *)(v15 + 16) = v26 + 2;
    *(unsigned char *)(v15 + v27 + 32) = 10;
    sub_1B36C2E10(v13, v14);
    *uint64_t v4 = v15;
    --v11;
  }
  while (v11);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B378964C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)v4;
  uint64_t v31 = a4;
  OUTLINED_FUNCTION_1();
  uint64_t v9 = v8;
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x1F4188790](v12);
  uint64_t v13 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v4 + 48);
  uint64_t v15 = *(void *)(v4 + 56);
  char v16 = *(unsigned char *)(v4 + 64);
  long long v17 = *(_OWORD *)(v4 + 16);
  v32[0] = *(_OWORD *)v4;
  v32[1] = v17;
  v32[2] = *(_OWORD *)(v4 + 32);
  uint64_t v33 = v14;
  uint64_t v34 = v15;
  char v35 = v16;
  uint64_t v19 = sub_1B3786D34(v18);
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_1B37A0A00();
  *(void *)&v32[0] = v20;
  if (v20 == MEMORY[0x1B3EB6BB0](a1, a3))
  {
LABEL_2:
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  uint64_t v28 = v11;
  uint64_t v29 = (void (**)(char *, uint64_t *, uint64_t))(v9 + 16);
  uint64_t v30 = v19;
  while (1)
  {
    char v22 = sub_1B37A0A70();
    sub_1B37A0A10();
    if ((v22 & 1) == 0) {
      break;
    }
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v13, a1+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v20, a3);
LABEL_6:
    swift_bridgeObjectRetain();
    MEMORY[0x1B3EB6BC0](v32, a1, a3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v23 = v5;
    sub_1B36DC17C();
    swift_bridgeObjectRetain();
    sub_1B36DC17C();
    sub_1B36DBED8(": ", (char *)2);
    sub_1B3785448((uint64_t)v13, a3, v31);
    if ((OUTLINED_FUNCTION_50() & 1) == 0)
    {
      OUTLINED_FUNCTION_10();
      uint64_t v23 = v25;
    }
    unint64_t v24 = v23[2];
    if (v24 >= v23[3] >> 1)
    {
      OUTLINED_FUNCTION_23();
      uint64_t v23 = v26;
    }
    v23[2] = v24 + 1;
    *((unsigned char *)v23 + v24 + 32) = 10;
    *uint64_t v5 = v23;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, a3);
    uint64_t v20 = *(void *)&v32[0];
    if (v20 == MEMORY[0x1B3EB6BB0](a1, a3)) {
      goto LABEL_2;
    }
  }
  uint64_t result = sub_1B37A0CA0();
  if (v28 == 8)
  {
    uint64_t v36 = result;
    (*v29)(v13, &v36, a3);
    swift_unknownObjectRelease();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B3789918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = v4;
  uint64_t v53 = a4;
  OUTLINED_FUNCTION_1();
  uint64_t v59 = v9;
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  v57 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v45 - v14;
  uint64_t v46 = v16;
  MEMORY[0x1F4188790](v13);
  v58 = (char *)&v45 - v17;
  uint64_t v19 = *((void *)v4 + 2);
  uint64_t v18 = *((void *)v4 + 3);
  uint64_t v21 = *((void *)v4 + 4);
  uint64_t v20 = *((void *)v4 + 5);
  uint64_t v23 = *((void *)v4 + 6);
  uint64_t v22 = *((void *)v4 + 7);
  char v24 = *((unsigned char *)v4 + 64);
  long long v63 = *v4;
  uint64_t v48 = v19;
  *(void *)&long long v64 = v19;
  *((void *)&v64 + 1) = v18;
  uint64_t v49 = v18;
  uint64_t v50 = v21;
  uint64_t v65 = v21;
  uint64_t v66 = v20;
  uint64_t v51 = v20;
  uint64_t v67 = v23;
  uint64_t v68 = v22;
  char v69 = v24;
  uint64_t v60 = sub_1B3786D34(v25);
  uint64_t v26 = dynamic_cast_existential_1_conditional(a3);
  uint64_t v54 = v22;
  if (v26)
  {
    OUTLINED_FUNCTION_39_9();
    uint64_t v28 = *(void (**)(uint64_t))(v27 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v29 = OUTLINED_FUNCTION_37_7();
    v28(v29);
    long long v30 = v63;
    long long v31 = v64;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    long long v30 = 0uLL;
    long long v31 = 0uLL;
  }
  v4[1] = v30;
  v4[2] = v31;
  uint64_t v32 = sub_1B37A0710();
  uint64_t v47 = v23;
  swift_bridgeObjectRelease();
  v6[6] = v32;
  uint64_t v70 = a1;
  sub_1B37A0AD0();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB594718);
  if (swift_dynamicCast())
  {
    __swift_project_boxed_opaque_existential_1(&v63, *((uint64_t *)&v64 + 1));
    OUTLINED_FUNCTION_38_10();
    v33();
    uint64_t v34 = v62;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v63);
  }
  else
  {
    uint64_t v65 = 0;
    long long v63 = 0u;
    long long v64 = 0u;
    sub_1B36C99D0((uint64_t)&v63, &qword_1EB594720);
    uint64_t v34 = 0;
  }
  uint64_t v35 = v54;
  swift_bridgeObjectRelease();
  v6[7] = v34;
  swift_bridgeObjectRetain();
  uint64_t v36 = sub_1B37A0A00();
  uint64_t v70 = v36;
  if (v36 == MEMORY[0x1B3EB6BB0](a1, a3))
  {
LABEL_8:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6[7] = v35;
    swift_bridgeObjectRelease();
    v6[6] = v47;
    uint64_t result = sub_1B36C9B28(v6[2]);
    uint64_t v38 = v49;
    v6[2] = v48;
    v6[3] = v38;
    uint64_t v39 = v51;
    v6[4] = v50;
    v6[5] = v39;
    return result;
  }
  v61 = (unint64_t *)(v59 + 16);
  uint64_t v52 = v53 + 72;
  v55 = (void (**)(char *, uint64_t))(v59 + 8);
  v56 = (void (**)(char *, char *, uint64_t))(v59 + 32);
  while (1)
  {
    unint64_t v40 = sub_1B37A0A70();
    sub_1B37A0A10();
    if (v40)
    {
      unint64_t v41 = a1
          + ((*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80))
          + *(void *)(v59 + 72) * v36;
      unint64_t v40 = *(void *)(v59 + 16);
      v42 = v58;
      ((void (*)(char *, unint64_t, uint64_t))v40)(v58, v41, a3);
    }
    else
    {
      uint64_t v44 = sub_1B37A0CA0();
      if (v46 != 8) {
        goto LABEL_24;
      }
      *(void *)&long long v63 = v44;
      unint64_t v40 = *v61;
      ((void (*)(char *, long long *, uint64_t))*v61)(v58, &v63, a3);
      v42 = v58;
      swift_unknownObjectRelease();
    }
    swift_bridgeObjectRetain();
    MEMORY[0x1B3EB6BC0](&v70, a1, a3);
    swift_bridgeObjectRelease();
    (*v56)(v15, v42, a3);
    swift_bridgeObjectRetain();
    sub_1B36DC17C();
    swift_bridgeObjectRetain();
    sub_1B36DC17C();
    sub_1B36DBED8(" {\n", (char *)3);
    if (qword_1EB5938A8 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    sub_1B36DC17C();
    ((void (*)(char *, char *, uint64_t))v40)(v57, v15, a3);
    if (!swift_dynamicCast()) {
      break;
    }
    unint64_t v40 = *((void *)&v63 + 1);
    uint64_t v35 = v63;
    sub_1B36C8218(v6);
    sub_1B36B9E20(v35, v40);
    sub_1B36EF4BC((uint64_t)v6, v35, v40);
    if (v5) {
      goto LABEL_25;
    }
    sub_1B36C2E10(v35, v40);
    sub_1B36C2E10(v35, v40);
    swift_release();
    uint64_t v35 = v54;
LABEL_18:
    unint64_t v43 = *(void *)(v6[1] + 16);
    if (v43 < 2)
    {
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      sub_1B36C2E10(v35, v40);
      OUTLINED_FUNCTION_34_10();
      goto LABEL_27;
    }
    sub_1B378BACC(v43 - 2, v43);
    swift_bridgeObjectRetain();
    sub_1B36DC17C();
    sub_1B36DBED8("}\n", (char *)2);
    (*v55)(v15, a3);
    uint64_t v36 = v70;
    if (v36 == MEMORY[0x1B3EB6BB0](a1, a3)) {
      goto LABEL_8;
    }
  }
  (*(void (**)(void *, ValueMetadata *, _UNKNOWN **, uint64_t))(v53 + 72))(v6, &type metadata for TextFormatEncodingVisitor, &off_1F0C07008, a3);
  if (!v5) {
    goto LABEL_18;
  }
  sub_1B36C9B28(v48);
  swift_bridgeObjectRelease();
LABEL_27:
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_1B3789F9C(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t *), uint64_t a4, uint64_t a5)
{
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  uint64_t v9 = *(void *)(a5 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x1F4188790](a1);
  uint64_t v12 = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  long long v31 = (char *)v27 - v13;
  sub_1B3786FB4(v14);
  sub_1B37588B4(": ", (char *)2, 2);
  sub_1B374BB28();
  uint64_t v15 = *(void *)(*v5 + 16);
  sub_1B374BA20(v15);
  uint64_t v16 = *v5;
  *(void *)(v16 + 16) = v15 + 1;
  *(unsigned char *)(v16 + v15 + 32) = 91;
  uint64_t v32 = v5;
  *uint64_t v5 = v16;
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_1B37A0A00();
  uint64_t v34 = v17;
  if (v17 == MEMORY[0x1B3EB6BB0](a1, a5))
  {
LABEL_2:
    swift_bridgeObjectRelease();
    uint64_t v21 = v32;
    sub_1B374BB28();
    uint64_t v22 = *(void *)(*v21 + 16);
    sub_1B374BA20(v22);
    uint64_t v23 = *v21;
    *(void *)(v23 + 16) = v22 + 1;
    *(unsigned char *)(v23 + v22 + 32) = 93;
    *uint64_t v21 = v23;
    sub_1B374BB28();
    uint64_t v24 = *(void *)(*v21 + 16);
    uint64_t result = sub_1B374BA20(v24);
    uint64_t v26 = *v21;
    *(void *)(v26 + 16) = v24 + 1;
    *(unsigned char *)(v26 + v24 + 32) = 10;
    *uint64_t v21 = v26;
    return result;
  }
  v27[0] = v10;
  v27[1] = v6;
  uint64_t v28 = (void (**)(char *, uint64_t *, uint64_t))(v9 + 16);
  char v18 = 1;
  while (1)
  {
    char v19 = sub_1B37A0A70();
    sub_1B37A0A10();
    if ((v19 & 1) == 0) {
      break;
    }
    uint64_t v20 = v31;
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v31, a1+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v17, a5);
LABEL_6:
    swift_bridgeObjectRetain();
    MEMORY[0x1B3EB6BC0](&v34, a1, a5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v20, a5);
    if ((v18 & 1) == 0) {
      sub_1B36DBED8(", ", (char *)2);
    }
    v29(v12, v32);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, a5);
    uint64_t v17 = v34;
    char v18 = 0;
    if (v17 == MEMORY[0x1B3EB6BB0](a1, a5)) {
      goto LABEL_2;
    }
  }
  uint64_t result = sub_1B37A0CA0();
  if (v27[0] == 8)
  {
    uint64_t v33 = result;
    uint64_t v20 = v31;
    (*v28)(v31, &v33, a5);
    swift_unknownObjectRelease();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

void sub_1B378A2EC(uint64_t a1, unint64_t a2)
{
  OUTLINED_FUNCTION_9_18(a1, a2);
  OUTLINED_FUNCTION_12_13(": ");
  sub_1B374BB28();
  OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_5_23();
  if (v3)
  {
    OUTLINED_FUNCTION_24_10();
    OUTLINED_FUNCTION_29_11();
    while (1)
    {
      float v6 = *(float *)(v2 + 4 * v4 + 32);
      if ((v5 & 1) == 0) {
        sub_1B36DBED8(", ", (char *)2);
      }
      if ((~LODWORD(v6) & 0x7F800000) == 0) {
        break;
      }
      uint64_t v8 = sub_1B37A0B70();
      sub_1B36DC054(v8, v9);
LABEL_14:
      char v5 = 0;
      if (v3 == ++v4)
      {
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
    }
    if ((LODWORD(v6) & 0x7FFFFF) != 0)
    {
      uint64_t v7 = "nan";
    }
    else
    {
      if (v6 < 0.0)
      {
        uint64_t v7 = "-inf";
        uint64_t v10 = 4;
LABEL_13:
        sub_1B36DBED8(v7, (char *)v10);
        goto LABEL_14;
      }
      uint64_t v7 = "inf";
    }
    uint64_t v10 = 3;
    goto LABEL_13;
  }
LABEL_16:
  sub_1B374BB28();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_1_33();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_0_32();
}

void sub_1B378A408(uint64_t a1, unint64_t a2)
{
  OUTLINED_FUNCTION_9_18(a1, a2);
  OUTLINED_FUNCTION_12_13(": ");
  sub_1B374BB28();
  OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_5_23();
  if (v3)
  {
    OUTLINED_FUNCTION_24_10();
    OUTLINED_FUNCTION_29_11();
    while (1)
    {
      double v6 = *(double *)(v2 + 8 * v4 + 32);
      if ((v5 & 1) == 0) {
        sub_1B36DBED8(", ", (char *)2);
      }
      if ((~*(void *)&v6 & 0x7FF0000000000000) == 0) {
        break;
      }
      uint64_t v8 = sub_1B37A0B50();
      sub_1B36DC054(v8, v9);
LABEL_14:
      char v5 = 0;
      if (v3 == ++v4)
      {
        swift_bridgeObjectRelease();
        goto LABEL_16;
      }
    }
    if ((*(void *)&v6 & 0xFFFFFFFFFFFFFLL) != 0)
    {
      uint64_t v7 = "nan";
    }
    else
    {
      if (v6 < 0.0)
      {
        uint64_t v7 = "-inf";
        uint64_t v10 = 4;
LABEL_13:
        sub_1B36DBED8(v7, (char *)v10);
        goto LABEL_14;
      }
      uint64_t v7 = "inf";
    }
    uint64_t v10 = 3;
    goto LABEL_13;
  }
LABEL_16:
  sub_1B374BB28();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_1_33();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_0_32();
}

void sub_1B378A524()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_18(v3, v4);
  OUTLINED_FUNCTION_12_13(": ");
  sub_1B374BB28();
  OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_5_23();
  if (v1)
  {
    OUTLINED_FUNCTION_24_10();
    OUTLINED_FUNCTION_29_11();
    do
    {
      int v6 = *(_DWORD *)(v0 + 4 * v2 + 32);
      if ((v5 & 1) == 0) {
        OUTLINED_FUNCTION_18_13();
      }
      if (v6 < 0)
      {
        if ((OUTLINED_FUNCTION_43_8() & 1) == 0) {
          OUTLINED_FUNCTION_16_15();
        }
        OUTLINED_FUNCTION_21_9();
        if (v7) {
          OUTLINED_FUNCTION_8_17();
        }
        OUTLINED_FUNCTION_13_11();
      }
      OUTLINED_FUNCTION_40_7();
      OUTLINED_FUNCTION_47_6();
    }
    while (!v8);
    swift_bridgeObjectRelease();
  }
  sub_1B374BB28();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_1_33();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_0_32();
  OUTLINED_FUNCTION_16_9();
}

void sub_1B378A5FC()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_18(v3, v4);
  OUTLINED_FUNCTION_12_13(": ");
  sub_1B374BB28();
  OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_5_23();
  if (v1)
  {
    OUTLINED_FUNCTION_24_10();
    OUTLINED_FUNCTION_29_11();
    do
    {
      uint64_t v6 = *(void *)(v0 + 8 * v2 + 32);
      if ((v5 & 1) == 0) {
        OUTLINED_FUNCTION_18_13();
      }
      if (v6 < 0)
      {
        if ((OUTLINED_FUNCTION_43_8() & 1) == 0) {
          OUTLINED_FUNCTION_16_15();
        }
        OUTLINED_FUNCTION_21_9();
        if (v7) {
          OUTLINED_FUNCTION_8_17();
        }
        OUTLINED_FUNCTION_13_11();
      }
      OUTLINED_FUNCTION_40_7();
      OUTLINED_FUNCTION_47_6();
    }
    while (!v8);
    swift_bridgeObjectRelease();
  }
  sub_1B374BB28();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_1_33();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_0_32();
  OUTLINED_FUNCTION_16_9();
}

void sub_1B378A6D4(uint64_t a1, unint64_t a2)
{
  OUTLINED_FUNCTION_9_18(a1, a2);
  OUTLINED_FUNCTION_12_13(": ");
  sub_1B374BB28();
  OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_10_18();
  if (v2)
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_42_7();
    do
    {
      if ((v3 & 1) == 0) {
        OUTLINED_FUNCTION_18_13();
      }
      OUTLINED_FUNCTION_41_6();
      OUTLINED_FUNCTION_46_7();
    }
    while (!v4);
    swift_bridgeObjectRelease();
  }
  sub_1B374BB28();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_1_33();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_0_32();
}

void sub_1B378A76C(uint64_t a1, unint64_t a2)
{
  OUTLINED_FUNCTION_9_18(a1, a2);
  OUTLINED_FUNCTION_12_13(": ");
  sub_1B374BB28();
  OUTLINED_FUNCTION_10_12();
  OUTLINED_FUNCTION_10_18();
  if (v2)
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_42_7();
    do
    {
      if ((v3 & 1) == 0) {
        OUTLINED_FUNCTION_18_13();
      }
      OUTLINED_FUNCTION_41_6();
      OUTLINED_FUNCTION_46_7();
    }
    while (!v4);
    swift_bridgeObjectRelease();
  }
  sub_1B374BB28();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_1_33();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_0_32();
}

void sub_1B378A804()
{
}

void sub_1B378A81C()
{
}

void sub_1B378A834()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_18(v3, v4);
  OUTLINED_FUNCTION_12_13(": ");
  sub_1B374BB28();
  OUTLINED_FUNCTION_10_12();
  uint64_t v5 = *v0;
  *(void *)(v5 + 16) = v2 + 1;
  *(unsigned char *)(v5 + v2 + 32) = 91;
  *uint64_t v0 = v5;
  uint64_t v6 = *(void *)(v1 + 16);
  if (v6)
  {
    OUTLINED_FUNCTION_24_10();
    uint64_t v7 = 0;
    char v8 = 1;
    do
    {
      int v9 = *(unsigned __int8 *)(v1 + v7 + 32);
      if ((v8 & 1) == 0) {
        OUTLINED_FUNCTION_18_13();
      }
      ++v7;
      if (v9) {
        uint64_t v10 = "true";
      }
      else {
        uint64_t v10 = "false";
      }
      if (v9) {
        uint64_t v11 = 4;
      }
      else {
        uint64_t v11 = 5;
      }
      sub_1B36DBED8(v10, (char *)v11);
      char v8 = 0;
    }
    while (v6 != v7);
    swift_bridgeObjectRelease();
  }
  sub_1B374BB28();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_1_33();
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_0_32();
  OUTLINED_FUNCTION_16_9();
}

uint64_t sub_1B378A914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[2] = a3;
  v5[3] = a4;
  return sub_1B3789F9C(a1, a2, (void (*)(char *, uint64_t *))sub_1B378BC20, (uint64_t)v5, a3);
}

uint64_t sub_1B378A954(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, void (*a5)(void *, char *, char *), uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = v9;
  uint64_t v11 = a8;
  uint64_t v62 = a6;
  v61 = a5;
  v75 = a4;
  uint64_t v69 = a3;
  unint64_t v60 = a2;
  uint64_t v68 = a1;
  v74 = *(char **)(a8 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](a1);
  uint64_t v15 = (char *)v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v13);
  char v18 = (char *)v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v70 = sub_1B37A0BF0();
  long long v63 = *(void (***)(uint64_t, uint64_t, uint64_t))(v70 - 8);
  uint64_t v20 = MEMORY[0x1F4188790](v70);
  uint64_t v71 = (uint64_t)v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  long long v64 = (char *)v50 - v22;
  uint64_t v23 = v9[2];
  uint64_t v24 = v9[3];
  uint64_t v25 = v9 + 2;
  uint64_t v26 = v9[4];
  uint64_t v27 = v9[5];
  uint64_t v28 = v9[6];
  uint64_t v73 = v25[5];
  uint64_t v82 = v68;
  uint64_t v77 = a7;
  uint64_t v78 = v11;
  uint64_t v79 = a9;
  uint64_t v80 = v69;
  v81 = v75;
  uint64_t v67 = v24;
  uint64_t v68 = v23;
  uint64_t v65 = v27;
  uint64_t v66 = v26;
  sub_1B376EE78(v23);
  sub_1B37A0740();
  uint64_t v69 = v28;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  uint64_t v29 = v76;
  uint64_t v30 = sub_1B37A09F0();
  uint64_t v76 = v29;
  uint64_t v31 = sub_1B37A0A00();
  v50[1] = TupleTypeMetadata2 - 8;
  uint64_t v83 = v31;
  v63 += 4;
  v58 = (void (**)(char *, uint64_t, uint64_t))(v72 + 32);
  v57 = (void (**)(char *, uint64_t, uint64_t))(v74 + 32);
  uint64_t v59 = v25;
  v75 = v25 - 1;
  v55 = (void (**)(char *, uint64_t))(v74 + 8);
  v56 = (void (**)(char *, uint64_t))(v72 + 8);
  v74 = v15;
  uint64_t v72 = v30;
  uint64_t v54 = TupleTypeMetadata2;
  uint64_t v53 = a7;
  uint64_t v52 = v18;
  uint64_t v51 = v11;
  while (1)
  {
    if (v31 == MEMORY[0x1B3EB6BB0](v30, TupleTypeMetadata2))
    {
      uint64_t v32 = v71;
      __swift_storeEnumTagSinglePayload(v71, 1, 1, TupleTypeMetadata2);
      uint64_t v33 = (uint64_t)v64;
    }
    else
    {
      char v34 = sub_1B37A0A70();
      sub_1B37A0A10();
      uint64_t v32 = v71;
      if (v34)
      {
        (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 16))(v71, v30+ ((*(unsigned __int8 *)(*(void *)(TupleTypeMetadata2 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(TupleTypeMetadata2 - 8) + 80))+ *(void *)(*(void *)(TupleTypeMetadata2 - 8) + 72) * v31, TupleTypeMetadata2);
        uint64_t v15 = v74;
        uint64_t v35 = v30;
        uint64_t v33 = (uint64_t)v64;
      }
      else
      {
        uint64_t result = sub_1B37A0CA0();
        uint64_t v49 = *(void *)(TupleTypeMetadata2 - 8);
        if (*(void *)(v49 + 64) != 8) {
          goto LABEL_20;
        }
        uint64_t v82 = result;
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(v49 + 16))(v32, &v82, TupleTypeMetadata2);
        swift_unknownObjectRelease();
        uint64_t v15 = v74;
        uint64_t v33 = (uint64_t)v64;
        uint64_t v35 = v72;
      }
      swift_bridgeObjectRetain();
      MEMORY[0x1B3EB6BC0](&v83, v35, TupleTypeMetadata2);
      swift_bridgeObjectRelease();
      __swift_storeEnumTagSinglePayload(v32, 0, 1, TupleTypeMetadata2);
    }
    (*v63)(v33, v32, v70);
    if (__swift_getEnumTagSinglePayload(v33, 1, TupleTypeMetadata2) == 1)
    {
      swift_bridgeObjectRelease();
      sub_1B36C9B28(v68);
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    uint64_t v36 = v33 + *(int *)(TupleTypeMetadata2 + 48);
    (*v58)(v18, v33, a7);
    (*v57)(v15, v36, v11);
    sub_1B3786FB4(v60);
    sub_1B36DBED8(" {\n", (char *)3);
    uint64_t v37 = v76;
    if (qword_1EB5938A8 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
    sub_1B36DC17C();
    sub_1B36C9B28(v10[2]);
    uint64_t v38 = v59;
    *uint64_t v59 = 0u;
    v38[1] = 0u;
    if (qword_1E9CB95D0 != -1) {
      swift_once();
    }
    uint64_t v39 = qword_1E9CBB340;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v10[6] = v39;
    swift_bridgeObjectRelease();
    v10[7] = 0;
    v61(v10, v18, v15);
    if (v37)
    {
      sub_1B36C9B28(v68);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*v55)(v15, v11);
      (*v56)(v18, a7);
      return swift_bridgeObjectRelease();
    }
    uint64_t v76 = 0;
    uint64_t v40 = v73;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v10[7] = v40;
    uint64_t v41 = v69;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v10[6] = v41;
    uint64_t v42 = v10[2];
    uint64_t v43 = v67;
    uint64_t v44 = v68;
    uint64_t v46 = v65;
    uint64_t v45 = v66;
    sub_1B376EE78(v68);
    sub_1B36C9B28(v42);
    v10[2] = v44;
    v10[3] = v43;
    v10[4] = v45;
    v10[5] = v46;
    unint64_t v47 = *(void *)(v10[1] + 16);
    uint64_t result = v47 - 2;
    if (v47 < 2) {
      break;
    }
    sub_1B378BACC(result, v47);
    swift_bridgeObjectRetain();
    sub_1B36DC17C();
    sub_1B36DBED8("}\n", (char *)2);
    uint64_t v15 = v74;
    uint64_t v11 = v51;
    (*v55)(v74, v51);
    char v18 = v52;
    a7 = v53;
    (*v56)(v52, v53);
    uint64_t v31 = v83;
    TupleTypeMetadata2 = v54;
    uint64_t v30 = v72;
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_1B378B1BC(uint64_t a1, unint64_t a2)
{
  OUTLINED_FUNCTION_50_4();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  return sub_1B378A954(a1, a2, (uint64_t)sub_1B36EE4C8, v9, (void (*)(void *, char *, char *))sub_1B378BC00, (uint64_t)v8, AssociatedTypeWitness, v5, AssociatedConformanceWitness);
}

uint64_t sub_1B378B2D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, ValueMetadata *, _UNKNOWN **, uint64_t))(*(void *)(a6 + 8) + 48))(a2, 1, a1, &type metadata for TextFormatEncodingVisitor, &off_1F0C07008, a4);
  if (!v7) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, ValueMetadata *, _UNKNOWN **, uint64_t))(*(void *)(a7 + 8) + 48))(a3, 2, a1, &type metadata for TextFormatEncodingVisitor, &off_1F0C07008, a5);
  }
  return result;
}

uint64_t sub_1B378B38C()
{
  OUTLINED_FUNCTION_43_4();
  OUTLINED_FUNCTION_50_4();
  swift_getAssociatedTypeWitness();
  uint64_t v0 = OUTLINED_FUNCTION_67();
  return OUTLINED_FUNCTION_32_9(v0, v1, (uint64_t)sub_1B36EE4C8, v5, (void (*)(void *, char *, char *))sub_1B378BBE0, v2, v3, v0);
}

void sub_1B378B438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t, ValueMetadata *, _UNKNOWN **, uint64_t))(*(void *)(a6 + 8) + 48))(a2, 1, a1, &type metadata for TextFormatEncodingVisitor, &off_1F0C07008, a4);
  if (!v7) {
    sub_1B37883F4(a3, 2uLL, a5, a7);
  }
}

uint64_t sub_1B378B4CC()
{
  OUTLINED_FUNCTION_43_4();
  v10[2] = v0;
  v10[3] = v1;
  v10[4] = v2;
  v10[5] = v3;
  v10[6] = v4;
  v10[7] = v0;
  swift_getAssociatedTypeWitness();
  uint64_t v5 = OUTLINED_FUNCTION_67();
  return OUTLINED_FUNCTION_32_9(v5, v6, (uint64_t)sub_1B36EE418, v10, (void (*)(void *, char *, char *))sub_1B378BBBC, v7, v8, v5);
}

uint64_t sub_1B378B58C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, ValueMetadata *, _UNKNOWN **, uint64_t))(*(void *)(a6 + 8) + 48))(a2, 1, a1, &type metadata for TextFormatEncodingVisitor, &off_1F0C07008, a4);
  if (!v7) {
    return sub_1B3788458(a3, 2, a5, a7);
  }
  return result;
}

void sub_1B378B620(unint64_t a1, float a2)
{
}

void sub_1B378B638(unint64_t a1, double a2)
{
}

void sub_1B378B650(uint64_t a1, unint64_t a2)
{
}

void sub_1B378B668(uint64_t a1, unint64_t a2)
{
}

void sub_1B378B680(char a1, unint64_t a2)
{
}

void sub_1B378B698(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_1B378B6B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B3788458(a1, a2, a3, a4);
}

uint64_t sub_1B378B6C8(uint64_t a1, uint64_t a2)
{
  return sub_1B378886C(a1, a2);
}

uint64_t sub_1B378B6E0(uint64_t a1, uint64_t a2)
{
  return sub_1B37889E8(a1, a2);
}

void sub_1B378B6F8()
{
}

void sub_1B378B710()
{
}

void sub_1B378B728()
{
}

void sub_1B378B740()
{
}

void sub_1B378B758()
{
}

void sub_1B378B770()
{
}

uint64_t sub_1B378B788(uint64_t a1, uint64_t a2)
{
  return sub_1B3789244(a1, a2);
}

uint64_t sub_1B378B7A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B378964C(a1, a2, a3, a4);
}

uint64_t sub_1B378B7B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B3789918(a1, a2, a3, a4);
}

void sub_1B378B7D0(uint64_t a1, unint64_t a2)
{
}

void sub_1B378B7E8(uint64_t a1, unint64_t a2)
{
}

void sub_1B378B800(uint64_t a1, unint64_t a2)
{
}

void sub_1B378B818(uint64_t a1, unint64_t a2)
{
}

void sub_1B378B830()
{
}

uint64_t sub_1B378B848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B378A914(a1, a2, a3, a4);
}

uint64_t sub_1B378B860(uint64_t a1, unint64_t a2)
{
  return sub_1B378B1BC(a1, a2);
}

uint64_t sub_1B378B878()
{
  return sub_1B378B38C();
}

uint64_t sub_1B378B890()
{
  return sub_1B378B4CC();
}

uint64_t sub_1B378B8A8(uint64_t a1, unint64_t a2)
{
  return sub_1B3787234(a1, a2);
}

uint64_t sub_1B378B8C0(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1B37A0530();
  uint64_t v5 = result;
  if (result)
  {
    uint64_t result = sub_1B37A0560();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v5 += a1 - result;
  }
  BOOL v6 = __OFSUB__(a2, a1);
  uint64_t v7 = a2 - a1;
  if (v6)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v8 = sub_1B37A0550();
  if (v8 >= v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t v10 = v5 + v9;
  if (v5) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  return sub_1B3787390(v5, v11);
}

uint64_t sub_1B378B964(uint64_t result, uint64_t a2, uint64_t a3)
{
  __dst[20] = *(unsigned int **)MEMORY[0x1E4F143B8];
  uint64_t v3 = result;
  __int16 v4 = a2;
  char v5 = BYTE2(a2);
  char v6 = BYTE3(a2);
  char v7 = BYTE4(a2);
  char v8 = BYTE5(a2);
  if (a3 >= 1)
  {
    uint64_t v11 = 0;
    memset(v10, 0, sizeof(v10));
    LOWORD(__src[2]) = 1;
    *(_OWORD *)((char *)&__src[2] + 8) = 0u;
    *(_OWORD *)((char *)&__src[3] + 8) = 0u;
    *(_OWORD *)((char *)&__src[4] + 8) = 0u;
    *((void *)&__src[5] + 1) = 0;
    LOBYTE(__src[6]) = 1;
    __src[8] = xmmword_1B37A1AF0;
    __src[9] = xmmword_1B37A1AF0;
    *(void *)&__src[0] = &v3;
    *((void *)&__src[0] + 1) = a3;
    *(void *)&__src[1] = &v3;
    *((void *)&__src[1] + 1) = 0;
    sub_1B36C1F78((uint64_t)v10, (uint64_t)&__src[3]);
    *((void *)&__src[6] + 1) = 100;
    LOBYTE(__src[7]) = 1;
    *((void *)&__src[7] + 1) = 100;
    memcpy(__dst, __src, 0xA0uLL);
    sub_1B3787460(__dst, 10);
    return sub_1B36C3124((uint64_t)__dst);
  }
  return result;
}

void sub_1B378BACC(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (swift_isUniquelyReferenced_nonNull_native() && v9 <= *(void *)(v4 + 24) >> 1)
  {
    if (!v8) {
      goto LABEL_14;
    }
  }
  else
  {
    sub_1B36DE588();
    uint64_t v4 = v10;
    if (!v8)
    {
LABEL_14:
      *uint64_t v2 = v4;
      return;
    }
  }
  uint64_t v11 = *(void *)(v4 + 16);
  if (__OFSUB__(v11, a2)) {
    goto LABEL_20;
  }
  sub_1B36DEC58((char *)(v4 + 32 + a2), v11 - a2, (char *)(v4 + 32 + a1));
  uint64_t v12 = *(void *)(v4 + 16);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    *(void *)(v4 + 16) = v14;
    goto LABEL_14;
  }
LABEL_21:
  __break(1u);
}

uint64_t sub_1B378BBBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B378B58C(a1, a2, a3, v3[2], v3[3], v3[4], v3[5]);
}

void sub_1B378BBE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1B378B438(a1, a2, a3, v3[2], v3[3], v3[4], v3[5]);
}

uint64_t sub_1B378BC00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B378B2D4(a1, a2, a3, v3[2], v3[3], v3[4], v3[5]);
}

void sub_1B378BC20(uint64_t a1)
{
  sub_1B3785448(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

unint64_t sub_1B378BC4C()
{
  unint64_t result = qword_1E9CBB348;
  if (!qword_1E9CBB348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB348);
  }
  return result;
}

uint64_t sub_1B378BC98(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v40 = a5;
  uint64_t v41 = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v39);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(boxed_opaque_existential_1, a1, a5);
  sub_1B37852B4(a2, a3);
  sub_1B37588B4(" {\n", (char *)3, 2);
  if (qword_1EB5938A8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_1B36DC17C();
  uint64_t v12 = a4[2];
  uint64_t v13 = a4[3];
  uint64_t v14 = a4[4];
  uint64_t v15 = a4[5];
  uint64_t v16 = a4[6];
  uint64_t v17 = a4[7];
  __swift_project_boxed_opaque_existential_1(v39, v40);
  uint64_t DynamicType = swift_getDynamicType();
  uint64_t v33 = v17;
  if (dynamic_cast_existential_1_conditional(DynamicType))
  {
    OUTLINED_FUNCTION_39_9();
    uint64_t v20 = *(void (**)(uint64_t))(v19 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v21 = OUTLINED_FUNCTION_37_7();
    v20(v21);
    long long v22 = v36;
    long long v23 = v37;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    long long v22 = 0uLL;
    long long v23 = 0uLL;
  }
  *((_OWORD *)a4 + 1) = v22;
  *((_OWORD *)a4 + 2) = v23;
  uint64_t v24 = sub_1B37A0710();
  swift_bridgeObjectRelease();
  a4[6] = v24;
  sub_1B36C996C((uint64_t)v39, (uint64_t)v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB594728);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB594718);
  if (swift_dynamicCast())
  {
    __swift_project_boxed_opaque_existential_1(&v36, *((uint64_t *)&v37 + 1));
    OUTLINED_FUNCTION_38_10();
    v25();
    uint64_t v26 = v34;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
  }
  else
  {
    uint64_t v38 = 0;
    long long v36 = 0u;
    long long v37 = 0u;
    sub_1B36C99D0((uint64_t)&v36, &qword_1EB594720);
    uint64_t v26 = 0;
  }
  swift_bridgeObjectRelease();
  a4[7] = v26;
  sub_1B36C996C((uint64_t)v39, (uint64_t)&v36);
  if (swift_dynamicCast())
  {
    uint64_t v28 = v35[0];
    unint64_t v27 = v35[1];
    sub_1B36C8218(a4);
    sub_1B36B9E20(v28, v27);
    sub_1B36EF4BC((uint64_t)a4, v28, v27);
    sub_1B36C2E10(v28, v27);
    sub_1B36C2E10(v28, v27);
    swift_release();
  }
  else
  {
    uint64_t v29 = v40;
    uint64_t v30 = v41;
    __swift_project_boxed_opaque_existential_1(v39, v40);
    (*(void (**)(void *, ValueMetadata *, _UNKNOWN **, uint64_t, uint64_t))(v30 + 72))(a4, &type metadata for TextFormatEncodingVisitor, &off_1F0C07008, v29, v30);
  }
  swift_bridgeObjectRelease();
  a4[7] = v33;
  swift_bridgeObjectRelease();
  a4[6] = v16;
  OUTLINED_FUNCTION_27_11();
  uint64_t v31 = OUTLINED_FUNCTION_37_7();
  sub_1B36C9B28(v31);
  a4[2] = v12;
  a4[3] = v13;
  a4[4] = v14;
  a4[5] = v15;
  sub_1B37853E4();
  OUTLINED_FUNCTION_26_12();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
}

void OUTLINED_FUNCTION_40_7()
{
  sub_1B3785334(v0);
}

void sub_1B378C090()
{
  uint64_t v1 = *(void *)(v0 + 80);
  BOOL v2 = __OFSUB__(v1, 1);
  uint64_t v3 = v1 - 1;
  if (v2)
  {
    __break(1u);
    return;
  }
  *(void *)(v0 + 80) = v3;
  if (v3 < 0)
  {
    char v7 = 11;
LABEL_9:
    sub_1B36C9A2C();
    OUTLINED_FUNCTION_2();
    char *v8 = v7;
    swift_willThrow();
    return;
  }
  OUTLINED_FUNCTION_20_15();
  if (v5 || (int v6 = *v4, *(void *)(v0 + 40) = v4 + 1, sub_1B378EAD0(), v6 != 123) && v6 != 60)
  {
    char v7 = 0;
    goto LABEL_9;
  }
}

uint64_t sub_1B378C138()
{
  sub_1B378EAD0();
  OUTLINED_FUNCTION_20_15();
  if (v1 || *v0 != 91) {
    return 0;
  }
  else {
    return sub_1B378F7A8();
  }
}

void sub_1B378C190()
{
  OUTLINED_FUNCTION_20_15();
  if (!v2)
  {
    int v3 = *v1;
    if (v3 == 59 || v3 == 44)
    {
      *(void *)(v0 + 40) = v1 + 1;
      sub_1B378EAD0();
    }
  }
}

uint64_t sub_1B378C1C4(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4)
{
  uint64_t v7 = v5;
  OUTLINED_FUNCTION_27_12();
  if (!v21)
  {
    uint64_t v14 = v4;
    uint64_t v15 = v11;
    uint64_t v16 = v10;
    uint64_t v17 = *(void *)(v9 + 8);
    uint64_t v6 = *(void *)(v9 + 16);
    while (1)
    {
      uint64_t v18 = *v13;
      if (v18 > 0x23) {
        goto LABEL_23;
      }
      if (((1 << v18) & 0x100002600) != 0)
      {
        uint64_t v19 = v13 + 1;
        *(void *)(v14 + 40) = v13 + 1;
        goto LABEL_6;
      }
      if (v18 == 35)
      {
        OUTLINED_FUNCTION_8_18();
        if (v21) {
          break;
        }
        OUTLINED_FUNCTION_12_14();
        BOOL v21 = v21 || v20 == 13;
        if (!v21)
        {
          if (v19 == v12) {
            break;
          }
          OUTLINED_FUNCTION_11_16();
          if (!v21 && v22 != 13)
          {
            while (v19 != v12)
            {
              OUTLINED_FUNCTION_10_19();
              if (v21 || v24 == 13) {
                goto LABEL_6;
              }
            }
            break;
          }
        }
LABEL_6:
        uint64_t v13 = v19;
        if (v19 == v12) {
          break;
        }
      }
      else
      {
LABEL_23:
        if (v13 == v12) {
          break;
        }
        uint64_t v100 = v17;
        if (((v18 & 0xDF) - 91) >= 0xE6u)
        {
          uint64_t v32 = v13;
          while (1)
          {
            int v33 = *v32;
            if ((v33 & 0xFFFFFFDF) - 91 <= 0xFFFFFFE5 && v33 != 95 && (v33 - 48) > 9) {
              break;
            }
            *(void *)(v14 + 40) = ++v32;
            if (v32 == v12)
            {
              uint64_t v32 = v12;
              goto LABEL_38;
            }
          }
          if (v32 != v12)
          {
            uint64_t v46 = v32;
            do
            {
              uint64_t v47 = *v46;
              if (v47 > 0x23) {
                break;
              }
              if (((1 << v47) & 0x100002600) != 0)
              {
                uint64_t v48 = v46 + 1;
                *(void *)(v14 + 40) = v46 + 1;
              }
              else
              {
                if (v47 != 35) {
                  break;
                }
                *(void *)(v14 + 40) = v46 + 1;
                if (v46 + 1 == v12) {
                  break;
                }
                int v49 = v46[1];
                uint64_t v48 = v46 + 2;
                *(void *)(v14 + 40) = v46 + 2;
                if (v49 != 10 && v49 != 13)
                {
                  if (v48 == v12) {
                    break;
                  }
                  int v51 = v46[2];
                  uint64_t v48 = v46 + 3;
                  *(void *)(v14 + 40) = v46 + 3;
                  if (v51 != 10 && v51 != 13)
                  {
                    while (v48 != v12)
                    {
                      int v54 = *v48++;
                      int v53 = v54;
                      *(void *)(v14 + 40) = v48;
                      if (v54 == 10 || v53 == 13) {
                        goto LABEL_55;
                      }
                    }
                    break;
                  }
                }
              }
LABEL_55:
              uint64_t v46 = v48;
            }
            while (v48 != v12);
          }
LABEL_38:
          if (*(void *)(v6 + 16))
          {
            v98[0] = v13;
            v98[1] = v32;
            v98[2] = "";
            v98[3] = 0;
            __int16 v99 = 258;
            unint64_t v35 = sub_1B3771090(v98);
            if (v36) {
              return *(void *)(*(void *)(v6 + 56) + 8 * v35);
            }
          }
          if ((*(unsigned char *)(v14 + 72) & 1) == 0) {
            goto LABEL_173;
          }
        }
        else
        {
          uint64_t v94 = v6;
          if (v18 == 91)
          {
            uint64_t v93 = v16;
            uint64_t v25 = v15;
            uint64_t v26 = sub_1B378F7A8();
            if (v7) {
              return v6;
            }
            uint64_t v28 = v27;
            if (*(void *)(v14 + 24))
            {
              uint64_t v29 = v26;
              sub_1B36C996C(v14, (uint64_t)v95);
              uint64_t v30 = v96;
              uint64_t v92 = v97;
              __swift_project_boxed_opaque_existential_1(v95, v96);
              uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v92 + 16))(v93, v25, v29, v28, v30);
              LOBYTE(v29) = v31;
              swift_bridgeObjectRelease();
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v95);
              if ((v29 & 1) == 0) {
                return v6;
              }
            }
            else
            {
              swift_bridgeObjectRelease();
            }
            char v55 = *(unsigned char *)(v14 + 73);
            uint64_t v15 = v25;
            uint64_t v16 = v93;
          }
          else
          {
            if ((v18 - 58) < 0xF7u)
            {
              if ((a4 & 0x100) == 0 && v18 == a4)
              {
                sub_1B378D594();
                return 0;
              }
LABEL_179:
              sub_1B36C9A2C();
              OUTLINED_FUNCTION_2();
              unsigned char *v90 = 0;
LABEL_180:
              swift_willThrow();
              return v6;
            }
            uint64_t v6 = v18 - 48;
            OUTLINED_FUNCTION_8_18();
            if (!v21)
            {
              uint64_t v41 = *v39;
              if ((v41 - 58) < 0xFFFFFFF6) {
                goto LABEL_75;
              }
              uint64_t v42 = 0;
              uint64_t v6 = v41 + (int)v6 * (uint64_t)(int)v40 - 48;
              *(void *)(v14 + 40) = v38 + 2;
              while (1)
              {
                uint64_t v43 = (unsigned __int8 *)(v38 + v42 + 2);
                if (v43 == v37) {
                  break;
                }
                uint64_t v44 = *v43;
                if ((v44 - 58) < 0xFFFFFFF6)
                {
                  uint64_t v39 = (unsigned __int8 *)(v38 + v42 + 2);
LABEL_75:
                  while (1)
                  {
                    uint64_t v56 = *v39;
                    if (v56 > 0x23) {
                      goto LABEL_90;
                    }
                    if (((1 << v56) & 0x100002600) != 0)
                    {
                      *(void *)(v14 + 40) = ++v39;
                    }
                    else
                    {
                      if (v56 != 35) {
                        goto LABEL_90;
                      }
                      *(void *)(v14 + 40) = v39 + 1;
                      if (v39 + 1 == v37) {
                        goto LABEL_90;
                      }
                      int v57 = v39[1];
                      v39 += 2;
                      *(void *)(v14 + 40) = v39;
                      if (v57 != 10 && v57 != 13)
                      {
                        while (v39 != v37)
                        {
                          OUTLINED_FUNCTION_10_19();
                          if (v21 || v59 == 13) {
                            goto LABEL_78;
                          }
                        }
                        goto LABEL_90;
                      }
                    }
LABEL_78:
                    if (v39 == v37) {
                      goto LABEL_90;
                    }
                  }
                }
                uint64_t v6 = v44 + v6 * v40 - 48;
                *(void *)(v14 + 40) = v38 + v42 + 3;
                uint64_t v45 = v42 + 3;
                ++v42;
                if (v45 > 9) {
                  goto LABEL_179;
                }
              }
            }
LABEL_90:
            if (*(void *)(v17 + 16))
            {
              sub_1B3770FD4(v6);
              if (v60) {
                return v6;
              }
            }
            char v55 = *(unsigned char *)(v14 + 72);
          }
          uint64_t v6 = v94;
          if ((v55 & 1) == 0)
          {
LABEL_173:
            sub_1B36C9A2C();
            OUTLINED_FUNCTION_2();
            unsigned char *v89 = 7;
            goto LABEL_180;
          }
        }
        uint64_t v62 = *(unsigned char **)(v14 + 40);
        v61 = *(unsigned char **)(v14 + 48);
        if (v62 != v61)
        {
          while (1)
          {
            uint64_t v63 = *v62;
            if (v63 > 0x23) {
              break;
            }
            if (((1 << v63) & 0x100002600) != 0)
            {
              long long v64 = v62 + 1;
              *(void *)(v14 + 40) = v62 + 1;
            }
            else
            {
              if (v63 != 35) {
                break;
              }
              OUTLINED_FUNCTION_8_18();
              if (v21) {
                goto LABEL_141;
              }
              OUTLINED_FUNCTION_12_14();
              if (!v21 && v65 != 13)
              {
                if (v64 == v61) {
                  goto LABEL_141;
                }
                OUTLINED_FUNCTION_11_16();
                if (!v21 && v67 != 13)
                {
                  while (v64 != v61)
                  {
                    OUTLINED_FUNCTION_10_19();
                    if (v21 || v69 == 13) {
                      goto LABEL_98;
                    }
                  }
                  goto LABEL_141;
                }
              }
            }
LABEL_98:
            uint64_t v62 = v64;
            if (v64 == v61) {
              goto LABEL_141;
            }
          }
        }
        if (v62 != v61 && *v62 == 58)
        {
          OUTLINED_FUNCTION_8_18();
          if (v21) {
            goto LABEL_179;
          }
          while (1)
          {
            uint64_t v72 = *v71;
            if (v72 > 0x23) {
              break;
            }
            if (((1 << v72) & 0x100002600) != 0)
            {
              uint64_t v73 = v71 + 1;
              *(void *)(v14 + 40) = v71 + 1;
            }
            else
            {
              if (v72 != 35) {
                break;
              }
              *(void *)(v14 + 40) = v71 + 1;
              if (v71 + 1 == v70) {
                goto LABEL_179;
              }
              int v74 = v71[1];
              uint64_t v73 = v71 + 2;
              *(void *)(v14 + 40) = v71 + 2;
              if (v74 != 10 && v74 != 13)
              {
                if (v73 == v70) {
                  goto LABEL_179;
                }
                int v76 = v71[2];
                uint64_t v73 = v71 + 3;
                *(void *)(v14 + 40) = v71 + 3;
                if (v76 != 10 && v76 != 13)
                {
                  while (v73 != v70)
                  {
                    int v79 = *v73++;
                    int v78 = v79;
                    *(void *)(v14 + 40) = v73;
                    if (v79 == 10 || v78 == 13) {
                      goto LABEL_121;
                    }
                  }
                  goto LABEL_179;
                }
              }
            }
LABEL_121:
            uint64_t v71 = v73;
            if (v73 == v70) {
              goto LABEL_179;
            }
          }
          if (v71 == v70) {
            goto LABEL_179;
          }
          if (v72 != 123 && v72 != 60)
          {
            uint64_t v80 = v7;
            sub_1B378F8C8(1);
            goto LABEL_142;
          }
        }
LABEL_141:
        uint64_t v80 = v7;
        sub_1B378FB90();
LABEL_142:
        uint64_t v7 = v80;
        if (v80) {
          return v6;
        }
        uint64_t v17 = v100;
        uint64_t v13 = *(unsigned __int8 **)(v14 + 40);
        uint64_t v12 = *(unsigned __int8 **)(v14 + 48);
        if (v13 != v12)
        {
          int v81 = *v13;
          if (v81 == 59 || v81 == 44)
          {
            *(void *)(v14 + 40) = ++v13;
            if (v13 == v12)
            {
LABEL_167:
              uint64_t v13 = v12;
            }
            else
            {
              while (1)
              {
                uint64_t v82 = *v13;
                if (v82 > 0x23) {
                  break;
                }
                if (((1 << v82) & 0x100002600) != 0)
                {
                  uint64_t v83 = v13 + 1;
                  *(void *)(v14 + 40) = v13 + 1;
                }
                else
                {
                  if (v82 != 35) {
                    break;
                  }
                  OUTLINED_FUNCTION_8_18();
                  if (v21) {
                    goto LABEL_167;
                  }
                  OUTLINED_FUNCTION_12_14();
                  if (!v21 && v84 != 13)
                  {
                    if (v83 == v12) {
                      goto LABEL_167;
                    }
                    OUTLINED_FUNCTION_11_16();
                    if (!v21 && v86 != 13)
                    {
                      while (v83 != v12)
                      {
                        OUTLINED_FUNCTION_10_19();
                        if (v21 || v88 == 13) {
                          goto LABEL_150;
                        }
                      }
                      goto LABEL_167;
                    }
                  }
                }
LABEL_150:
                uint64_t v13 = v83;
                if (v83 == v12) {
                  goto LABEL_167;
                }
              }
            }
          }
        }
        if (v13 == v12) {
          break;
        }
      }
    }
  }
  if ((a4 & 0x100) == 0) {
    goto LABEL_179;
  }
  return 0;
}

uint64_t sub_1B378C8C8()
{
  uint64_t result = sub_1B378F414();
  if (v1)
  {
    uint64_t result = sub_1B378F6B0();
    if ((result & 1) == 0)
    {
      uint64_t result = sub_1B378F704();
      if ((result & 0x100000000) != 0)
      {
        sub_1B36C9A2C();
        uint64_t v2 = OUTLINED_FUNCTION_2();
        return OUTLINED_FUNCTION_15_0(v2, v3);
      }
    }
  }
  return result;
}

uint64_t sub_1B378C93C()
{
  OUTLINED_FUNCTION_20_15();
  if (v1 || *v0 != 91) {
    return 0;
  }
  else {
    return OUTLINED_FUNCTION_31_12((uint64_t)v0);
  }
}

uint64_t sub_1B378C970()
{
  OUTLINED_FUNCTION_20_15();
  if (v1 || *v0 != 93) {
    return 0;
  }
  else {
    return OUTLINED_FUNCTION_31_12((uint64_t)v0);
  }
}

uint64_t sub_1B378C9A4()
{
  uint64_t result = sub_1B378F414();
  if (v1)
  {
    uint64_t result = sub_1B378F6B0();
    if ((result & 1) == 0)
    {
      uint64_t result = sub_1B378F704();
      if ((result & 0x100000000) != 0)
      {
        sub_1B36C9A2C();
        uint64_t v2 = OUTLINED_FUNCTION_2();
        return OUTLINED_FUNCTION_15_0(v2, v3);
      }
    }
  }
  return result;
}

void sub_1B378CA18()
{
  OUTLINED_FUNCTION_27_12();
  if (v2) {
    goto LABEL_10;
  }
  if (*v1 == 45)
  {
    OUTLINED_FUNCTION_38_11();
    if (!v2 && *v3 - 58 > 0xFFFFFFF5)
    {
      sub_1B378CABC();
      if (v0 || (v4 & 0x8000000000000000) == 0 || v4 == 0x8000000000000000) {
        return;
      }
    }
LABEL_10:
    sub_1B36C9A2C();
    uint64_t v6 = OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_15_0(v6, v7);
    return;
  }
  sub_1B378CABC();
  if (!v0 && v5 < 0) {
    goto LABEL_10;
  }
}

void sub_1B378CABC()
{
  OUTLINED_FUNCTION_27_12();
  if (v3) {
    goto LABEL_36;
  }
  uint64_t v4 = v2 + 1;
  int v5 = *v2;
  *(void *)(v0 + 40) = v2 + 1;
  if (v5 == 48)
  {
    if (v4 != v1)
    {
      int v6 = *v4;
      if (v6 == 120)
      {
        OUTLINED_FUNCTION_38_11();
        if (!v3)
        {
          unint64_t v9 = 0;
          while (1)
          {
            char v10 = *v8;
            if ((*v8 - 58) > 0xF5u)
            {
              char v11 = -48;
            }
            else if ((v10 - 103) > 0xF9u)
            {
              char v11 = -87;
            }
            else
            {
              if ((v10 - 71) <= 0xF9u) {
                goto LABEL_39;
              }
              char v11 = -55;
            }
            if (v9 >> 60) {
              goto LABEL_36;
            }
            *(void *)(v0 + 40) = ++v8;
            unint64_t v9 = 16 * v9 + (v10 + v11);
            if (v8 == v7) {
              goto LABEL_39;
            }
          }
        }
      }
      else if ((v6 - 56) >= 0xF8u)
      {
        unint64_t v21 = 0;
        uint64_t v17 = v2 + 2;
        while (1)
        {
          unint64_t v21 = 8 * v21 + (v6 - 48);
          if (v17 == v1) {
            break;
          }
          LOBYTE(v6) = *v17;
          if ((*v17 - 56) < 0xF8u) {
            goto LABEL_38;
          }
          ++v17;
          if (v21 >> 61)
          {
            --v17;
            goto LABEL_35;
          }
        }
LABEL_37:
        *(void *)(v0 + 40) = v1;
      }
      goto LABEL_39;
    }
    return;
  }
  if ((v5 - 58) < 0xF7u)
  {
LABEL_36:
    sub_1B36C9A2C();
    uint64_t v22 = OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_15_0(v22, v23);
    return;
  }
  if (v4 == v1 || (unsigned __int8 v12 = *v4, (v12 - 58) < 0xF6u))
  {
LABEL_39:
    sub_1B378EAD0();
    return;
  }
  uint64_t v13 = (v12 - 48);
  uint64_t v14 = 10 * (v5 - 48);
  uint64_t v15 = v2 + 2;
  while (1)
  {
    unint64_t v16 = v14 + v13;
    if (__CFADD__(v14, v13)) {
      break;
    }
    uint64_t v17 = v15;
    if (v15 == v1) {
      goto LABEL_37;
    }
    unsigned __int8 v18 = *v15;
    if ((*v15 - 58) < 0xF6u)
    {
LABEL_38:
      *(void *)(v0 + 40) = v17;
      goto LABEL_39;
    }
    if (v16 <= 0x1999999999999999)
    {
      unsigned __int8 v19 = v18 - 48;
      uint64_t v13 = (v18 - 48);
      uint64_t v14 = 10 * v16;
      BOOL v20 = __CFADD__(10 * v16, v19);
      uint64_t v15 = v17 + 1;
      if (!v20) {
        continue;
      }
    }
LABEL_35:
    *(void *)(v0 + 40) = v17;
    goto LABEL_36;
  }
  __break(1u);
}

uint64_t sub_1B378CCC4()
{
  sub_1B378EAD0();
  char v1 = *(unsigned __int8 **)(v0 + 40);
  char v2 = *(unsigned __int8 **)(v0 + 48);
  if (v1 == v2) {
    goto LABEL_36;
  }
  int v5 = *v1;
  char v3 = v1 + 1;
  int v4 = v5;
  *(void *)(v0 + 40) = v3;
  if (v5 == 48)
  {
    if (v3 != v2)
    {
      LOBYTE(v2) = 0;
      unsigned int v10 = *v3;
      BOOL v11 = v10 > 0x3E || ((1 << v10) & 0x4800100900002600) == 0;
      if (v11 && v10 != 125 && v10 != 93) {
        goto LABEL_36;
      }
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  switch(v4)
  {
    case 't':
      goto LABEL_40;
    case 'F':
LABEL_15:
      if (v3 != v2)
      {
        sub_1B378F594((uint64_t)&unk_1F0BFFF30);
        uint64_t v8 = *(unsigned __int8 **)(v0 + 40);
        if (v8 != v2)
        {
          LOBYTE(v2) = 0;
          unsigned int v6 = *v8;
          goto LABEL_18;
        }
      }
LABEL_33:
      LOBYTE(v2) = 0;
      return v2 & 1;
    case 'T':
LABEL_40:
      if (v3 == v2) {
        goto LABEL_26;
      }
      sub_1B378F594((uint64_t)&unk_1F0BFFF08);
      uint64_t v7 = *(unsigned __int8 **)(v0 + 40);
      if (v7 == v2) {
        goto LABEL_26;
      }
      unsigned int v6 = *v7;
      LOBYTE(v2) = 1;
LABEL_18:
      if (v6 > 0x3E || ((1 << v6) & 0x4800100900002600) == 0)
      {
LABEL_23:
        if (v6 != 93 && v6 != 125) {
          goto LABEL_36;
        }
      }
LABEL_32:
      sub_1B378EAD0();
      return v2 & 1;
    case 'f':
      goto LABEL_15;
  }
  if (v4 != 49)
  {
LABEL_36:
    sub_1B36C9A2C();
    uint64_t v12 = OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_7_0(v12, v13);
    return v2 & 1;
  }
  if (v3 != v2)
  {
    unsigned int v6 = *v3;
    LOBYTE(v2) = 1;
    if (v6 > 0x3E || ((1 << v6) & 0x4800100900002600) == 0) {
      goto LABEL_23;
    }
    goto LABEL_32;
  }
LABEL_26:
  LOBYTE(v2) = 1;
  return v2 & 1;
}

uint64_t sub_1B378CE6C()
{
  uint64_t v1 = v0;
  sub_1B378EAD0();
  char v2 = *(unsigned __int8 **)(v0 + 40);
  char v3 = *(unsigned __int8 **)(v0 + 48);
  if (v2 == v3 || (int v4 = *v2, v4 != 39) && v4 != 34 || (*(void *)(v0 + 40) = v2 + 1, v5 = sub_1B378F2D8(v4), !v6))
  {
LABEL_63:
    sub_1B36C9A2C();
    uint64_t v38 = OUTLINED_FUNCTION_2();
    return OUTLINED_FUNCTION_7_0(v38, v39);
  }
  unint64_t v41 = v5;
  uint64_t v7 = *(unsigned __int8 **)(v0 + 40);
  if (v7 == v3) {
    return v41;
  }
  do
  {
    int v8 = *v7;
    if (v8 != 34 && v8 != 39) {
      return v41;
    }
    unint64_t v9 = (char *)(v7 + 1);
    *(void *)(v1 + 40) = v7 + 1;
    if (v7 + 1 == v3) {
      goto LABEL_62;
    }
    int v10 = *v9;
    if (v10 == v8)
    {
      char v11 = 0;
      uint64_t v12 = v7 + 1;
      goto LABEL_11;
    }
    char v11 = 0;
    uint64_t v12 = v7 + 1;
    while (2)
    {
      v12 += 2;
      while (1)
      {
        char v31 = v12 - 1;
        if (v10 == 10 || v10 == 13)
        {
          char v3 = v12 - 1;
LABEL_61:
          *(void *)(v1 + 40) = v3;
          goto LABEL_62;
        }
        if (v10 == 92) {
          break;
        }
        if (v31 == v3) {
          goto LABEL_61;
        }
        int v10 = *(v12++ - 1);
        if (v10 == v8)
        {
          v12 -= 2;
          goto LABEL_11;
        }
      }
      if (v31 == v3 || v12 == v3) {
        goto LABEL_61;
      }
      int v10 = *v12;
      char v11 = 1;
      if (v10 != v8) {
        continue;
      }
      break;
    }
LABEL_11:
    sub_1B36C17CC(v9, v12 - (unsigned __int8 *)v9);
    uint64_t v14 = v13;
    uint64_t v15 = v12 + 1;
    *(void *)(v1 + 40) = v12 + 1;
    uint64_t v7 = v3;
    if (v15 == v3)
    {
LABEL_53:
      if (!v14) {
        goto LABEL_62;
      }
    }
    else
    {
      while (1)
      {
        OUTLINED_FUNCTION_14_13();
        if (!v24 & v18) {
          break;
        }
        if (((1 << v17) & 0x100002600) != 0)
        {
          OUTLINED_FUNCTION_36_10(v16);
        }
        else
        {
          if (v17 != 35) {
            break;
          }
          OUTLINED_FUNCTION_36_10(v16);
          if (v20 == v3) {
            goto LABEL_52;
          }
          OUTLINED_FUNCTION_33_10(v19);
          BOOL v24 = v24 || v23 == 13;
          if (!v24)
          {
            if (v22 == v3) {
              goto LABEL_52;
            }
            OUTLINED_FUNCTION_32_10(v21);
            if (!v24 && v26 != 13)
            {
              while (v25 != v3)
              {
                int v29 = *v25++;
                int v28 = v29;
                *(void *)(v1 + 40) = v25;
                if (v29 == 10 || v28 == 13) {
                  goto LABEL_15;
                }
              }
LABEL_52:
              uint64_t v7 = v3;
              goto LABEL_53;
            }
          }
        }
LABEL_15:
        OUTLINED_FUNCTION_34_11();
        if (v24) {
          goto LABEL_52;
        }
      }
      uint64_t v7 = (unsigned __int8 *)v16;
      if (!v14)
      {
LABEL_62:
        swift_bridgeObjectRelease();
        goto LABEL_63;
      }
    }
    if (v11)
    {
      unint64_t v34 = OUTLINED_FUNCTION_485();
      sub_1B378D8E4(v34, v35);
      uint64_t v37 = v36;
      swift_bridgeObjectRelease();
      if (!v37) {
        goto LABEL_62;
      }
    }
    OUTLINED_FUNCTION_485();
    sub_1B37A08D0();
    swift_bridgeObjectRelease();
  }
  while (v7 != v3);
  return v41;
}

uint64_t sub_1B378D0D8()
{
  uint64_t v2 = v0;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  sub_1B378EAD0();
  char v3 = *(unsigned __int8 **)(v0 + 40);
  int v4 = *(unsigned __int8 **)(v0 + 48);
  if (v3 == v4 || (int v5 = *v3, v5 != 34) && v5 != 39)
  {
    sub_1B36C9A2C();
    uint64_t v9 = OUTLINED_FUNCTION_2();
    return OUTLINED_FUNCTION_7_0(v9, v10);
  }
  *(void *)(v0 + 40) = v3 + 1;
  char v39 = 0;
  uint64_t result = sub_1B378EC08(v5, &v39);
  if (v1) {
    return result;
  }
  uint64_t v7 = result;
  if (v39 == 1)
  {
    uint64_t v41 = MEMORY[0x1B3EB6730](result);
    uint64_t v42 = v8;
    sub_1B378FF8C(&v41, v2, v5);
  }
  else
  {
    uint64_t v11 = *(void *)(v2 + 40);
    uint64_t v41 = MEMORY[0x1B3EB6720](v11, result);
    uint64_t v42 = v12;
    if (__OFADD__(v7, 1))
    {
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
    }
    *(void *)(v2 + 40) = v11 + v7 + 1;
  }
  uint64_t v13 = *(unsigned __int8 **)(v2 + 40);
  if (v13 == v4) {
    return v41;
  }
  while (1)
  {
    while (1)
    {
      uint64_t v14 = *v13;
      if (v14 <= 0x23)
      {
        if (((1 << v14) & 0x100002600) != 0)
        {
          OUTLINED_FUNCTION_36_10((uint64_t)v13);
          goto LABEL_15;
        }
        if (v14 == 35) {
          break;
        }
      }
      if (v13 == v4 || v14 != 39 && v14 != 34) {
        return v41;
      }
      *(void *)(v2 + 40) = v13 + 1;
      char v38 = 0;
      int64_t v25 = sub_1B378EC08(v14, &v38);
      unint64_t v26 = v25;
      uint64_t v27 = v25 << 32;
      if (v38 == 1)
      {
        if (v25)
        {
          if (v25 <= 14)
          {
            if (v25 < 0) {
              goto LABEL_58;
            }
            uint64_t v27 = 0;
            unint64_t v30 = (unint64_t)v25 << 48;
          }
          else
          {
            sub_1B37A0570();
            swift_allocObject();
            uint64_t v28 = sub_1B37A0540();
            uint64_t v29 = v28;
            if (v26 >= 0x7FFFFFFF)
            {
              sub_1B37A05D0();
              uint64_t v27 = swift_allocObject();
              *(void *)(v27 + 16) = 0;
              *(void *)(v27 + 24) = v26;
              unint64_t v30 = v29 | 0x8000000000000000;
            }
            else
            {
              unint64_t v30 = v28 | 0x4000000000000000;
            }
          }
        }
        else
        {
          uint64_t v27 = 0;
          unint64_t v30 = 0xC000000000000000;
        }
        *(void *)&long long __dst = v27;
        *((void *)&__dst + 1) = v30;
        sub_1B378FF8C((uint64_t *)&__dst, v2, v14);
        long long v35 = __dst;
        uint64_t v36 = OUTLINED_FUNCTION_485();
        sub_1B36B9E20(v36, v37);
        OUTLINED_FUNCTION_485();
        sub_1B37A0650();
        sub_1B36C2E10(v35, *((unint64_t *)&v35 + 1));
        sub_1B36C2E10(v35, *((unint64_t *)&v35 + 1));
        goto LABEL_54;
      }
      char v31 = *(char **)(v2 + 40);
      if (v25)
      {
        if (v25 <= 14)
        {
          *(void *)((char *)&__dst + 6) = 0;
          *(void *)&long long __dst = 0;
          BYTE14(__dst) = v25;
          memcpy(&__dst, v31, v25);
          uint64_t v27 = __dst;
          unint64_t v34 = DWORD2(__dst) | ((unint64_t)BYTE12(__dst) << 32) | ((unint64_t)BYTE13(__dst) << 40) | ((unint64_t)BYTE14(__dst) << 48);
        }
        else
        {
          sub_1B37A0570();
          swift_allocObject();
          uint64_t v32 = sub_1B37A0520();
          uint64_t v33 = v32;
          if (v26 >= 0x7FFFFFFF)
          {
            sub_1B37A05D0();
            uint64_t v27 = swift_allocObject();
            *(void *)(v27 + 16) = 0;
            *(void *)(v27 + 24) = v26;
            unint64_t v34 = v33 | 0x8000000000000000;
          }
          else
          {
            unint64_t v34 = v32 | 0x4000000000000000;
          }
        }
      }
      else
      {
        uint64_t v27 = 0;
        unint64_t v34 = 0xC000000000000000;
      }
      sub_1B37A0650();
      sub_1B36C2E10(v27, v34);
      if (__OFADD__(v26, 1))
      {
        __break(1u);
        goto LABEL_57;
      }
      *(void *)(v2 + 40) = &v31[v26 + 1];
LABEL_54:
      uint64_t v13 = *(unsigned __int8 **)(v2 + 40);
      if (v13 == v4) {
        return v41;
      }
    }
    OUTLINED_FUNCTION_36_10((uint64_t)v13);
    if (v17 == v4) {
      return v41;
    }
    OUTLINED_FUNCTION_33_10(v16);
    BOOL v20 = v20 || v19 == 13;
    if (!v20)
    {
      if (v15 == v4) {
        return v41;
      }
      OUTLINED_FUNCTION_32_10(v18);
      if (!v20 && v21 != 13) {
        break;
      }
    }
LABEL_15:
    uint64_t v13 = v15;
    if (v15 == v4) {
      return v41;
    }
  }
  while (v15 != v4)
  {
    int v24 = *v15++;
    int v23 = v24;
    *(void *)(v2 + 40) = v15;
    if (v24 == 10 || v23 == 13) {
      goto LABEL_15;
    }
  }
  return v41;
}

unsigned __int8 *sub_1B378D4E8()
{
  sub_1B378EAD0();
  OUTLINED_FUNCTION_20_15();
  if (v1)
  {
    sub_1B36C9A2C();
    uint64_t v3 = OUTLINED_FUNCTION_2();
    return (unsigned __int8 *)OUTLINED_FUNCTION_7_0(v3, v4);
  }
  else if ((*v0 & 0xDFu) - 91 >= 0xFFFFFFE6)
  {
    return sub_1B378EB5C();
  }
  else
  {
    return 0;
  }
}

uint64_t sub_1B378D560()
{
  OUTLINED_FUNCTION_20_15();
  if (v1 || *v0 != 58) {
    return 0;
  }
  else {
    return OUTLINED_FUNCTION_31_12((uint64_t)v0);
  }
}

uint64_t sub_1B378D594()
{
  OUTLINED_FUNCTION_20_15();
  if (v3 || *v2 != v1) {
    return 0;
  }
  v0[5] = v2 + 1;
  sub_1B378EAD0();
  uint64_t v4 = v0[10];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5)
  {
    __break(1u);
  }
  else
  {
    v0[10] = v6;
    if (v0[8] >= v6) {
      return 1;
    }
  }
  OUTLINED_FUNCTION_15_16();
  uint64_t result = sub_1B37A0D40();
  __break(1u);
  return result;
}

char *sub_1B378D634(char a1)
{
  sub_1B378EAD0();
  BOOL v5 = *(unsigned __int8 **)(v1 + 40);
  uint64_t v4 = *(unsigned __int8 **)(v1 + 48);
  if (v5 == v4) {
    return 0;
  }
  int v6 = *v5;
  if (v6 == 91)
  {
    if (a1)
    {
      sub_1B37A08D0();
      sub_1B378F7A8();
      if (v2) {
        return (char *)swift_bridgeObjectRelease();
      }
      sub_1B37A08D0();
      swift_bridgeObjectRelease();
      sub_1B37A08D0();
      return 0;
    }
    sub_1B36C9A2C();
    OUTLINED_FUNCTION_2();
    unsigned char *v9 = 7;
    return (char *)swift_willThrow();
  }
  if ((v6 & 0xFFFFFFDF) - 91 >= 0xFFFFFFE6) {
    return sub_1B378EBD8();
  }
  if ((v6 - 58) < 0xFFFFFFF7)
  {
LABEL_9:
    sub_1B36C9A2C();
    OUTLINED_FUNCTION_2();
    unsigned char *v8 = 0;
    return (char *)swift_willThrow();
  }
  *(void *)(v1 + 40) = v5 + 1;
  if (v5 + 1 != v4 && v5[1] - 58 >= 0xFFFFFFF6)
  {
    uint64_t v10 = 0;
    *(void *)(v1 + 40) = v5 + 2;
    while (1)
    {
      uint64_t v11 = &v5[v10 + 2];
      if (v11 == v4 || *v11 - 58 < 0xFFFFFFF6) {
        break;
      }
      *(void *)(v1 + 40) = &v5[v10 + 3];
      uint64_t v12 = v10 + 3;
      ++v10;
      if (v12 > 9) {
        goto LABEL_9;
      }
    }
  }
  sub_1B378EAD0();
  uint64_t v13 = (char *)OUTLINED_FUNCTION_485();
  uint64_t result = (char *)sub_1B36C17CC(v13, v14);
  if (!v15) {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B378D814(char a1)
{
  unsigned int v1 = (a1 - 58);
  unsigned int v2 = (a1 - 71);
  unsigned int v3 = (a1 - 103);
  unsigned __int8 v4 = a1 - 87;
  BOOL v6 = v3 >= 0xFA;
  BOOL v5 = v3 < 0xFA;
  if (!v6) {
    unsigned __int8 v4 = 0;
  }
  BOOL v6 = v2 >= 0xFA;
  if (v2 >= 0xFA) {
    unsigned __int8 v7 = a1 - 55;
  }
  else {
    unsigned __int8 v7 = v4;
  }
  if (v6) {
    BOOL v5 = 0;
  }
  BOOL v8 = v1 >= 0xF6;
  if (v1 >= 0xF6) {
    unsigned __int8 v9 = a1 - 48;
  }
  else {
    unsigned __int8 v9 = v7;
  }
  int v10 = !v8 && v5;
  return v9 | (v10 << 8);
}

unint64_t sub_1B378D870(char a1)
{
  if ((a1 - 58) > 0xF5u)
  {
    char v3 = -48;
LABEL_8:
    unsigned __int8 v2 = 0;
    uint64_t v1 = (v3 + a1);
    return v1 | ((unint64_t)v2 << 32);
  }
  if ((a1 - 71) > 0xF9u)
  {
    char v3 = -55;
    goto LABEL_8;
  }
  if ((a1 - 103) >= 0xFAu)
  {
    char v3 = -87;
    goto LABEL_8;
  }
  uint64_t v1 = 0;
  unsigned __int8 v2 = 1;
  return v1 | ((unint64_t)v2 << 32);
}

uint64_t sub_1B378D8E4(unint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  unint64_t v3 = a1;
  uint64_t v4 = MEMORY[0x1E4FBC860];
  unint64_t v191 = a1;
  unint64_t v192 = a2;
  unint64_t v193 = 15;
  uint64_t v194 = MEMORY[0x1E4FBC860];
  BOOL v5 = (a2 & 0x2000000000000000) == 0;
  if ((a2 & 0x2000000000000000) != 0) {
    unint64_t v6 = HIBYTE(a2) & 0xF;
  }
  else {
    unint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
  }
  swift_bridgeObjectRetain();
  if (v6)
  {
    unint64_t v7 = 15;
    while (1)
    {
      uint64_t v8 = (v3 >> 59) & 1;
      if ((v2 & 0x1000000000000000) == 0) {
        LOBYTE(v8) = 1;
      }
      unint64_t v9 = v7;
      if ((v7 & 0xC) == 4 << v8) {
        unint64_t v9 = OUTLINED_FUNCTION_2_25();
      }
      unint64_t v10 = v9 >> 16;
      if (v9 >> 16 >= v6)
      {
        __break(1u);
LABEL_225:
        __break(1u);
LABEL_226:
        __break(1u);
LABEL_227:
        __break(1u);
LABEL_228:
        __break(1u);
LABEL_229:
        __break(1u);
LABEL_230:
        __break(1u);
LABEL_231:
        __break(1u);
LABEL_232:
        __break(1u);
LABEL_233:
        __break(1u);
LABEL_234:
        __break(1u);
LABEL_235:
        __break(1u);
LABEL_236:
        __break(1u);
LABEL_237:
        __break(1u);
        JUMPOUT(0x1B378E560);
      }
      if ((v2 & 0x1000000000000000) != 0)
      {
        char v12 = OUTLINED_FUNCTION_16_16();
      }
      else if (v5)
      {
        if ((v3 & 0x1000000000000000) != 0) {
          uint64_t v11 = OUTLINED_FUNCTION_18_14();
        }
        else {
          uint64_t v11 = OUTLINED_FUNCTION_19_12();
        }
        char v12 = *(unsigned char *)(v11 + v10);
      }
      else
      {
        OUTLINED_FUNCTION_14_15();
        char v12 = *(unsigned char *)(v13 + v10);
      }
      unint64_t v3 = v191;
      unint64_t v2 = v192;
      unint64_t v14 = (v191 >> 59) & 1;
      if ((v192 & 0x1000000000000000) == 0) {
        LOBYTE(v14) = 1;
      }
      uint64_t v15 = 4 << v14;
      if ((v7 & 0xC) == 4 << v14) {
        unint64_t v7 = OUTLINED_FUNCTION_2_25();
      }
      uint64_t v16 = HIBYTE(v2) & 0xF;
      if ((v2 & 0x1000000000000000) != 0)
      {
        unint64_t v154 = v3 & 0xFFFFFFFFFFFFLL;
        if ((v2 & 0x2000000000000000) != 0) {
          unint64_t v154 = HIBYTE(v2) & 0xF;
        }
        if (v154 <= v7 >> 16) {
          goto LABEL_232;
        }
        unint64_t v7 = OUTLINED_FUNCTION_17_14();
      }
      else
      {
        OUTLINED_FUNCTION_13_12();
      }
      unint64_t v193 = v7;
      if (v12 != 92)
      {
        if ((OUTLINED_FUNCTION_6_22() & 1) == 0)
        {
          OUTLINED_FUNCTION_10();
          unint64_t v7 = v155;
        }
        unint64_t v24 = *(void *)(v7 + 16);
        if (v24 >= *(void *)(v7 + 24) >> 1)
        {
          OUTLINED_FUNCTION_23();
          unint64_t v7 = v156;
        }
        *(void *)(v7 + 16) = v24 + 1;
        *(unsigned char *)(v7 + v24 + 32) = v12;
        uint64_t v194 = v7;
        uint64_t v17 = v2 & 0x2000000000000000;
        uint64_t v25 = v3 & 0xFFFFFFFFFFFFLL;
        goto LABEL_191;
      }
      uint64_t v17 = v2 & 0x2000000000000000;
      if ((v2 & 0x2000000000000000) != 0) {
        unint64_t v18 = HIBYTE(v2) & 0xF;
      }
      else {
        unint64_t v18 = v3 & 0xFFFFFFFFFFFFLL;
      }
      uint64_t v19 = 4 * v18;
      if (4 * v18 == v7 >> 14)
      {
LABEL_222:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 0;
      }
      uint64_t v185 = v3 & 0xFFFFFFFFFFFFLL;
      unint64_t v20 = OUTLINED_FUNCTION_22_9();
      if (v21) {
        unint64_t v20 = OUTLINED_FUNCTION_2_25();
      }
      unint64_t v22 = v20 >> 16;
      if (v20 >> 16 >= v18) {
        goto LABEL_225;
      }
      if ((v2 & 0x1000000000000000) != 0)
      {
        unint64_t v22 = OUTLINED_FUNCTION_16_16();
      }
      else if (v17)
      {
        OUTLINED_FUNCTION_29_12();
      }
      else
      {
        if ((v3 & 0x1000000000000000) != 0) {
          uint64_t v23 = OUTLINED_FUNCTION_18_14();
        }
        else {
          uint64_t v23 = OUTLINED_FUNCTION_19_12();
        }
        unint64_t v22 = *(unsigned __int8 *)(v23 + v22);
      }
      if (v6 == v15)
      {
        unint64_t v7 = OUTLINED_FUNCTION_2_25();
        if ((v2 & 0x1000000000000000) == 0)
        {
LABEL_45:
          OUTLINED_FUNCTION_13_12();
          goto LABEL_46;
        }
      }
      else if ((v2 & 0x1000000000000000) == 0)
      {
        goto LABEL_45;
      }
      if (v18 <= v7 >> 16) {
        goto LABEL_233;
      }
      unint64_t v7 = OUTLINED_FUNCTION_17_14();
LABEL_46:
      unint64_t v193 = v7;
      if ((v22 - 56) >= 0xF8u)
      {
        LODWORD(v183) = v22 - 48;
        if (v19 == v7 >> 14) {
          goto LABEL_99;
        }
        uint64_t v181 = HIBYTE(v2) & 0xF;
        unint64_t v30 = v7;
        if ((v7 & 0xC) == v15) {
          unint64_t v30 = OUTLINED_FUNCTION_2_25();
        }
        unint64_t v31 = v30 >> 16;
        if (v30 >> 16 >= v18) {
          goto LABEL_226;
        }
        if ((v2 & 0x1000000000000000) != 0)
        {
          char v33 = OUTLINED_FUNCTION_16_16();
        }
        else if (v17)
        {
          OUTLINED_FUNCTION_14_15();
          char v33 = *(unsigned char *)(v71 + v31);
        }
        else
        {
          if ((v3 & 0x1000000000000000) != 0) {
            uint64_t v32 = OUTLINED_FUNCTION_18_14();
          }
          else {
            uint64_t v32 = OUTLINED_FUNCTION_19_12();
          }
          char v33 = *(unsigned char *)(v32 + v31);
        }
        unint64_t v72 = v7;
        if ((v7 & 0xC) == v15) {
          unint64_t v72 = OUTLINED_FUNCTION_2_25();
        }
        uint64_t v16 = HIBYTE(v2) & 0xF;
        if ((v2 & 0x1000000000000000) != 0)
        {
          if (v18 <= v72 >> 16) {
            goto LABEL_234;
          }
          unint64_t v73 = OUTLINED_FUNCTION_17_14();
        }
        else
        {
          unint64_t v73 = (v72 & 0xFFFFFFFFFFFF0000) + 65540;
        }
        if ((v33 - 56) < 0xF8u)
        {
LABEL_99:
          uint64_t v74 = v194;
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1B36DE588();
            uint64_t v74 = v157;
          }
          unint64_t v75 = *(void *)(v74 + 16);
          if (v75 >= *(void *)(v74 + 24) >> 1)
          {
            sub_1B36DE588();
            uint64_t v74 = v158;
          }
          *(void *)(v74 + 16) = v75 + 1;
          *(unsigned char *)(v74 + v75 + 32) = v183;
          swift_bridgeObjectRelease();
          unint64_t v193 = v7;
          uint64_t v194 = v74;
          unint64_t v191 = v3;
          unint64_t v192 = v2;
          goto LABEL_190;
        }
        char v76 = v33 - 48;
        if (v19 == v73 >> 14) {
          goto LABEL_155;
        }
        uint64_t v77 = v73 & 0xC;
        unint64_t v78 = v73;
        uint64_t v179 = v73;
        if (v77 == v15) {
          unint64_t v78 = sub_1B36E07D4(v73, v3, v2);
        }
        unint64_t v79 = v78 >> 16;
        if (v78 >> 16 >= v18) {
          goto LABEL_227;
        }
        if ((v2 & 0x1000000000000000) != 0)
        {
          char v82 = OUTLINED_FUNCTION_16_16();
        }
        else
        {
          if (!v17)
          {
            if ((v3 & 0x1000000000000000) != 0) {
              uint64_t v80 = OUTLINED_FUNCTION_18_14();
            }
            else {
              uint64_t v80 = OUTLINED_FUNCTION_19_12();
            }
            unint64_t v81 = v179;
            char v82 = *(unsigned char *)(v80 + v79);
LABEL_151:
            unint64_t v108 = v81;
            if (v77 == v15)
            {
              unint64_t v108 = sub_1B36E07D4(v81, v3, v2);
              if ((v2 & 0x1000000000000000) != 0) {
                goto LABEL_210;
              }
LABEL_153:
              unint64_t v109 = OUTLINED_FUNCTION_35_10(v108);
            }
            else
            {
              if ((v2 & 0x1000000000000000) == 0) {
                goto LABEL_153;
              }
LABEL_210:
              if (v18 <= v108 >> 16) {
                goto LABEL_235;
              }
              unint64_t v109 = OUTLINED_FUNCTION_17_14();
              unint64_t v73 = v179;
            }
            unint64_t v193 = v109;
            if ((v82 - 56) >= 0xF8u)
            {
              swift_bridgeObjectRetain_n();
              uint64_t v114 = sub_1B374BB28();
              OUTLINED_FUNCTION_5_24(v114, v115, v116, v117, v118, v119, v120, v121, v179, v181, v183, v185, v187, v189, v191, v192, v193, v194);
              uint64_t v122 = sub_1B376D554(v77, ((_BYTE)v22 << 6) + 8 * v76 + v82 - 48);
              nullsub_1(v122);
              swift_bridgeObjectRelease_n();
              goto LABEL_190;
            }
LABEL_155:
            char v110 = v76 + 8 * v183;
            unint64_t v111 = v73;
            swift_bridgeObjectRetain_n();
            sub_1B374BB28();
            uint64_t v112 = *(void *)(v194 + 16);
            sub_1B374BA20(v112);
            uint64_t v113 = sub_1B376D554(v112, v110);
            nullsub_1(v113);
            swift_bridgeObjectRelease_n();
            unint64_t v193 = v111;
            goto LABEL_190;
          }
          OUTLINED_FUNCTION_14_15();
          char v82 = *(unsigned char *)(v107 + v79);
        }
        unint64_t v81 = v179;
        goto LABEL_151;
      }
      uint64_t v26 = v22 - 34;
      if (v26 > 0x3F) {
        goto LABEL_48;
      }
      if (((1 << (v22 - 34)) & 0x400000020000021) != 0)
      {
        uint64_t v34 = sub_1B374BB28();
        OUTLINED_FUNCTION_5_24(v34, v35, v36, v37, v38, v39, v40, v41, v179, v181, v183, v185, v187, v189, v191, v192, v193, v194);
        uint64_t v28 = 4 * v18;
        char v29 = v22;
        goto LABEL_179;
      }
      if (v26 == 51)
      {
LABEL_80:
        unint64_t v45 = sub_1B378E58C((uint64_t *)&v191);
        if ((v45 & 0x100000000) != 0) {
          goto LABEL_222;
        }
        uint64_t v46 = v45;
        if (v22 == 85)
        {
          unint64_t v47 = sub_1B378E58C((uint64_t *)&v191);
          if ((v47 & 0x100000000) != 0) {
            goto LABEL_222;
          }
          BOOL v42 = __CFADD__(v47, v46 << 16);
          uint64_t v46 = (v47 + (v46 << 16));
          if (v42) {
            goto LABEL_229;
          }
        }
        if (v46 > 0x7F)
        {
          char v48 = v46 & 0x3F | 0x80;
          if (v46 <= 0x7FF)
          {
            if ((OUTLINED_FUNCTION_6_22() & 1) == 0)
            {
              OUTLINED_FUNCTION_10();
              unint64_t v7 = v166;
            }
            unint64_t v104 = *(void *)(v7 + 16);
            unint64_t v105 = *(void *)(v7 + 24) >> 1;
            if (v105 <= v104)
            {
              OUTLINED_FUNCTION_23();
              unint64_t v7 = v167;
              unint64_t v105 = *(void *)(v167 + 24) >> 1;
            }
            *(void *)(v7 + 16) = v104 + 1;
            *(unsigned char *)(v7 + v104 + 32) = (v46 >> 6) - 64;
            uint64_t v194 = v7;
            if ((uint64_t)v105 < (uint64_t)(v104 + 2))
            {
              OUTLINED_FUNCTION_23();
              uint64_t v194 = v168;
            }
            uint64_t v106 = sub_1B376D554(v104 + 1, v46 & 0x3F | 0x80);
            nullsub_1(v106);
            uint64_t v16 = HIBYTE(v2) & 0xF;
          }
          else
          {
            unsigned int v49 = (v46 >> 6) & 0x3F | 0xFFFFFF80;
            if (WORD1(v46))
            {
              if (v46 >= 0x110000) {
                goto LABEL_222;
              }
              char v50 = OUTLINED_FUNCTION_6_22();
              uint64_t v194 = v7;
              if ((v50 & 1) == 0)
              {
                OUTLINED_FUNCTION_10();
                unint64_t v7 = v172;
                uint64_t v194 = v172;
              }
              unint64_t v51 = *(void *)(v7 + 16);
              if (v51 >= *(void *)(v7 + 24) >> 1)
              {
                unint64_t v173 = *(void *)(v7 + 16);
                OUTLINED_FUNCTION_23();
                uint64_t v175 = v174;
                unint64_t v51 = v173;
                uint64_t v194 = v175;
              }
              uint64_t v52 = sub_1B376D554(v51, (v46 >> 18) - 16);
              nullsub_1(v52);
              uint64_t v53 = sub_1B374BB28();
              OUTLINED_FUNCTION_5_24(v53, v54, v55, v56, v57, v58, v59, v60, v179, v181, v183, v185, v187, v189, v191, v192, v193, v194);
              uint64_t v61 = sub_1B376D554(v46, (v46 >> 12) & 0x3F | 0x80);
              nullsub_1(v61);
              uint64_t v62 = sub_1B374BB28();
              OUTLINED_FUNCTION_5_24(v62, v63, v64, v65, v66, v67, v68, v69, v180, v182, v184, v186, v188, v190, v191, v192, v193, v194);
              uint64_t v70 = v46;
            }
            else
            {
              if ((OUTLINED_FUNCTION_6_22() & 1) == 0)
              {
                OUTLINED_FUNCTION_10();
                unint64_t v7 = v169;
              }
              unint64_t v128 = *(void *)(v7 + 16);
              unint64_t v129 = *(void *)(v7 + 24) >> 1;
              uint64_t v130 = v128 + 1;
              if (v129 <= v128)
              {
                uint64_t v183 = v128 + 1;
                OUTLINED_FUNCTION_23();
                uint64_t v130 = v128 + 1;
                unint64_t v7 = v170;
                unint64_t v129 = *(void *)(v170 + 24) >> 1;
              }
              *(void *)(v7 + 16) = v130;
              *(unsigned char *)(v7 + v128 + 32) = (v46 >> 12) - 32;
              uint64_t v194 = v7;
              if ((uint64_t)v129 < (uint64_t)(v128 + 2))
              {
                uint64_t v46 = v130;
                OUTLINED_FUNCTION_23();
                uint64_t v130 = v46;
                uint64_t v194 = v171;
              }
              uint64_t v70 = v130;
            }
            uint64_t v131 = sub_1B376D554(v70, v49);
            nullsub_1(v131);
            uint64_t v132 = sub_1B374BB28();
            OUTLINED_FUNCTION_5_24(v132, v133, v134, v135, v136, v137, v138, v139, v179, v181, v183, v185, v187, v189, v191, v192, v193, v194);
            uint64_t v28 = v46;
            char v29 = v48;
LABEL_179:
            uint64_t v140 = sub_1B376D554(v28, v29);
            nullsub_1(v140);
          }
LABEL_190:
          uint64_t v25 = v185;
          goto LABEL_191;
        }
        if ((OUTLINED_FUNCTION_6_22() & 1) == 0)
        {
          OUTLINED_FUNCTION_10();
          unint64_t v7 = v165;
        }
        unint64_t v103 = *(void *)(v7 + 16);
        uint64_t v25 = v3 & 0xFFFFFFFFFFFFLL;
        if (v103 >= *(void *)(v7 + 24) >> 1)
        {
          OUTLINED_FUNCTION_23();
          OUTLINED_FUNCTION_25_10();
        }
        *(void *)(v7 + 16) = v103 + 1;
        *(unsigned char *)(v7 + v103 + 32) = v46;
      }
      else
      {
        if (v26 != 63)
        {
LABEL_48:
          switch((char)v22)
          {
            case 'n':
              char v27 = OUTLINED_FUNCTION_6_22();
              uint64_t v194 = v7;
              if ((v27 & 1) == 0)
              {
                OUTLINED_FUNCTION_10();
                unint64_t v7 = v159;
                uint64_t v194 = v159;
              }
              if (*(void *)(v7 + 16) >= *(void *)(v7 + 24) >> 1)
              {
                OUTLINED_FUNCTION_23();
                uint64_t v194 = v160;
              }
              uint64_t v28 = OUTLINED_FUNCTION_26_13();
              char v29 = 10;
              goto LABEL_179;
            case 'o':
            case 'p':
            case 'q':
            case 's':
            case 'w':
              goto LABEL_222;
            case 'r':
              char v83 = OUTLINED_FUNCTION_6_22();
              uint64_t v194 = v7;
              if ((v83 & 1) == 0)
              {
                OUTLINED_FUNCTION_10();
                unint64_t v7 = v161;
                uint64_t v194 = v161;
              }
              sub_1B374BA20(*(void *)(v7 + 16));
              uint64_t v28 = OUTLINED_FUNCTION_26_13();
              char v29 = 13;
              goto LABEL_179;
            case 't':
              uint64_t v84 = sub_1B374BB28();
              OUTLINED_FUNCTION_39_10(v84, v85, v86, v87, v88, v89, v90, v91, v179, v181, v183, v185, v187, v189, v191, v192, v193, v194);
              uint64_t v28 = OUTLINED_FUNCTION_26_13();
              char v29 = 9;
              goto LABEL_179;
            case 'u':
              goto LABEL_80;
            case 'v':
              uint64_t v92 = sub_1B374BB28();
              OUTLINED_FUNCTION_39_10(v92, v93, v94, v95, v96, v97, v98, v99, v179, v181, v183, v185, v187, v189, v191, v192, v193, v194);
              uint64_t v28 = OUTLINED_FUNCTION_26_13();
              char v29 = 11;
              goto LABEL_179;
            case 'x':
              if (v19 == v7 >> 14) {
                goto LABEL_222;
              }
              unint64_t v100 = OUTLINED_FUNCTION_22_9();
              if (v21) {
                unint64_t v100 = OUTLINED_FUNCTION_2_25();
              }
              unint64_t v101 = v100 >> 16;
              if (v100 >> 16 >= v18) {
                goto LABEL_228;
              }
              if ((v2 & 0x1000000000000000) != 0)
              {
                LOBYTE(v101) = OUTLINED_FUNCTION_16_16();
              }
              else if (v17)
              {
                OUTLINED_FUNCTION_29_12();
              }
              else
              {
                if ((v3 & 0x1000000000000000) != 0) {
                  uint64_t v102 = OUTLINED_FUNCTION_18_14();
                }
                else {
                  uint64_t v102 = OUTLINED_FUNCTION_19_12();
                }
                LOBYTE(v101) = *(unsigned char *)(v102 + v101);
              }
              if (v6 == v15)
              {
                unint64_t v7 = OUTLINED_FUNCTION_2_25();
                if ((v2 & 0x1000000000000000) == 0)
                {
LABEL_160:
                  OUTLINED_FUNCTION_13_12();
                  goto LABEL_161;
                }
              }
              else if ((v2 & 0x1000000000000000) == 0)
              {
                goto LABEL_160;
              }
              if (v18 <= v7 >> 16) {
                goto LABEL_236;
              }
              unint64_t v7 = OUTLINED_FUNCTION_17_14();
LABEL_161:
              __int16 v123 = sub_1B378D814(v101);
              if ((v123 & 0x100) != 0) {
                goto LABEL_222;
              }
              LOBYTE(v124) = v123;
              if (v19 == v7 >> 14) {
                goto LABEL_188;
              }
              unint64_t v125 = OUTLINED_FUNCTION_22_9();
              if (v21) {
                unint64_t v125 = OUTLINED_FUNCTION_2_25();
              }
              unint64_t v126 = v125 >> 16;
              if (v125 >> 16 >= v18) {
                goto LABEL_230;
              }
              if ((v2 & 0x1000000000000000) != 0)
              {
                uint64_t v19 = OUTLINED_FUNCTION_16_16();
              }
              else if (v17)
              {
                OUTLINED_FUNCTION_14_15();
                uint64_t v19 = *(unsigned __int8 *)(v141 + v126);
              }
              else
              {
                if ((v3 & 0x1000000000000000) != 0) {
                  uint64_t v127 = OUTLINED_FUNCTION_18_14();
                }
                else {
                  uint64_t v127 = OUTLINED_FUNCTION_19_12();
                }
                uint64_t v19 = *(unsigned __int8 *)(v127 + v126);
              }
              unint64_t v142 = v7;
              if (v6 == v15)
              {
                unint64_t v142 = OUTLINED_FUNCTION_2_25();
                if ((v2 & 0x1000000000000000) == 0)
                {
LABEL_184:
                  unint64_t v143 = OUTLINED_FUNCTION_35_10(v142);
                  goto LABEL_185;
                }
              }
              else if ((v2 & 0x1000000000000000) == 0)
              {
                goto LABEL_184;
              }
              if (v18 <= v142 >> 16) {
                goto LABEL_237;
              }
              unint64_t v143 = OUTLINED_FUNCTION_17_14();
LABEL_185:
              unint64_t v193 = v143;
              __int16 v144 = sub_1B378D814(v19);
              if ((v144 & 0x100) != 0)
              {
LABEL_188:
                unint64_t v193 = v7;
              }
              else
              {
                __int16 v124 = 16 * (v124 & 0xF) + v144;
                if ((v124 & 0x100) != 0) {
                  goto LABEL_231;
                }
              }
              swift_bridgeObjectRetain();
              uint64_t v145 = sub_1B374BB28();
              OUTLINED_FUNCTION_5_24(v145, v146, v147, v148, v149, v150, v151, v152, v179, v181, v183, v185, v187, v189, v191, v192, v193, v194);
              uint64_t v153 = sub_1B376D554(v19, v124);
              nullsub_1(v153);
              swift_bridgeObjectRelease();
              break;
            default:
              if (v22 == 98)
              {
                if ((OUTLINED_FUNCTION_6_22() & 1) == 0)
                {
                  OUTLINED_FUNCTION_10();
                  unint64_t v7 = v164;
                }
                OUTLINED_FUNCTION_24_11();
                uint64_t v25 = v3 & 0xFFFFFFFFFFFFLL;
                if (v42)
                {
                  OUTLINED_FUNCTION_23();
                  OUTLINED_FUNCTION_25_10();
                }
                *(void *)(v7 + 16) = v22;
                unint64_t v43 = v7 + v19;
                char v44 = 8;
              }
              else
              {
                if (v22 != 102) {
                  goto LABEL_222;
                }
                if ((OUTLINED_FUNCTION_6_22() & 1) == 0)
                {
                  OUTLINED_FUNCTION_10();
                  unint64_t v7 = v163;
                }
                OUTLINED_FUNCTION_24_11();
                uint64_t v25 = v3 & 0xFFFFFFFFFFFFLL;
                if (v42)
                {
                  OUTLINED_FUNCTION_23();
                  OUTLINED_FUNCTION_25_10();
                }
                *(void *)(v7 + 16) = v22;
                unint64_t v43 = v7 + v19;
                char v44 = 12;
              }
              goto LABEL_133;
          }
          goto LABEL_190;
        }
        if ((OUTLINED_FUNCTION_6_22() & 1) == 0)
        {
          OUTLINED_FUNCTION_10();
          unint64_t v7 = v162;
        }
        OUTLINED_FUNCTION_24_11();
        uint64_t v25 = v3 & 0xFFFFFFFFFFFFLL;
        if (v42)
        {
          OUTLINED_FUNCTION_23();
          OUTLINED_FUNCTION_25_10();
        }
        *(void *)(v7 + 16) = v22;
        unint64_t v43 = v7 + v19;
        char v44 = 7;
LABEL_133:
        *(unsigned char *)(v43 + 32) = v44;
      }
      uint64_t v194 = v7;
LABEL_191:
      unint64_t v7 = v193;
      BOOL v5 = v17 == 0;
      if (v17) {
        unint64_t v6 = v16;
      }
      else {
        unint64_t v6 = v25;
      }
      if (v193 >> 14 == 4 * v6)
      {
        uint64_t v4 = v194;
        break;
      }
    }
  }
  uint64_t v176 = *(void *)(v4 + 16);
  swift_bridgeObjectRetain();
  uint64_t v177 = sub_1B36C17CC((char *)(v4 + 32), v176);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  return v177;
}

unint64_t sub_1B378E58C(uint64_t *a1)
{
  unint64_t v2 = a1[2];
  unint64_t v4 = *a1;
  unint64_t v3 = a1[1];
  if ((v3 & 0x2000000000000000) != 0) {
    unint64_t v5 = HIBYTE(v3) & 0xF;
  }
  else {
    unint64_t v5 = *a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2 >> 14 == 4 * v5) {
    goto LABEL_84;
  }
  uint64_t v6 = (v4 >> 59) & 1;
  if ((v3 & 0x1000000000000000) == 0) {
    LOBYTE(v6) = 1;
  }
  if ((v2 & 0xC) == 4 << v6) {
    unint64_t v2 = sub_1B36E07D4(v2, *a1, a1[1]);
  }
  unint64_t v7 = v2 >> 16;
  if (v2 >> 16 >= v5)
  {
    __break(1u);
    goto LABEL_87;
  }
  if ((v3 & 0x1000000000000000) != 0)
  {
LABEL_87:
    char v9 = sub_1B37A0950();
    goto LABEL_16;
  }
  if ((v3 & 0x2000000000000000) != 0)
  {
    unint64_t v44 = v4;
    uint64_t v45 = v3 & 0xFFFFFFFFFFFFFFLL;
    char v9 = *((unsigned char *)&v44 + v7);
  }
  else
  {
    if ((v4 & 0x1000000000000000) != 0) {
      uint64_t v8 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
    }
    else {
      uint64_t v8 = sub_1B37A0CB0();
    }
    char v9 = *(unsigned char *)(v8 + v7);
  }
LABEL_16:
  unint64_t v11 = *a1;
  unint64_t v10 = a1[1];
  unint64_t result = a1[2];
  uint64_t v13 = ((unint64_t)*a1 >> 59) & 1;
  if ((v10 & 0x1000000000000000) == 0) {
    LOBYTE(v13) = 1;
  }
  uint64_t v14 = 4 << v13;
  if ((a1[2] & 0xC) == 4 << v13) {
    unint64_t result = sub_1B36E07D4(result, *a1, a1[1]);
  }
  unint64_t v15 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x1000000000000000) != 0)
  {
    unint64_t v40 = v11 & 0xFFFFFFFFFFFFLL;
    if ((v10 & 0x2000000000000000) != 0) {
      unint64_t v40 = HIBYTE(v10) & 0xF;
    }
    if (v40 <= result >> 16)
    {
      __break(1u);
      goto LABEL_118;
    }
    unint64_t v16 = sub_1B37A0910();
  }
  else
  {
    unint64_t v16 = (result & 0xFFFFFFFFFFFF0000) + 65540;
  }
  a1[2] = v16;
  unint64_t result = sub_1B378D870(v9);
  if ((result & 0x100000000) != 0) {
    goto LABEL_84;
  }
  if ((v10 & 0x2000000000000000) == 0) {
    unint64_t v15 = v11 & 0xFFFFFFFFFFFFLL;
  }
  if (v16 >> 14 == 4 * v15) {
    goto LABEL_84;
  }
  int v17 = result;
  if ((v16 & 0xC) == v14)
  {
    unint64_t result = sub_1B36E07D4(v16, v11, v10);
    unint64_t v16 = result;
  }
  unint64_t v18 = v16 >> 16;
  if (v16 >> 16 >= v15)
  {
    __break(1u);
LABEL_94:
    unint64_t result = sub_1B36E07D4(result, v16, v11);
    goto LABEL_39;
  }
  if ((v10 & 0x1000000000000000) != 0)
  {
    LOBYTE(v10) = sub_1B37A0950();
  }
  else if ((v10 & 0x2000000000000000) != 0)
  {
    unint64_t v44 = v11;
    uint64_t v45 = v10 & 0xFFFFFFFFFFFFFFLL;
    LOBYTE(v10) = *((unsigned char *)&v44 + v18);
  }
  else
  {
    if ((v11 & 0x1000000000000000) != 0) {
      uint64_t v19 = (v10 & 0xFFFFFFFFFFFFFFFLL) + 32;
    }
    else {
      uint64_t v19 = sub_1B37A0CB0();
    }
    LOBYTE(v10) = *(unsigned char *)(v19 + v18);
  }
  unint64_t v16 = *a1;
  unint64_t v11 = a1[1];
  unint64_t result = a1[2];
  uint64_t v20 = ((unint64_t)*a1 >> 59) & 1;
  if ((v11 & 0x1000000000000000) == 0) {
    LOBYTE(v20) = 1;
  }
  unint64_t v15 = 4 << v20;
  if ((a1[2] & 0xC) == 4 << v20) {
    goto LABEL_94;
  }
LABEL_39:
  unint64_t v21 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x1000000000000000) != 0)
  {
    unint64_t v41 = v16 & 0xFFFFFFFFFFFFLL;
    if ((v11 & 0x2000000000000000) != 0) {
      unint64_t v41 = HIBYTE(v11) & 0xF;
    }
    if (v41 > result >> 16)
    {
      unint64_t v22 = sub_1B37A0910();
      goto LABEL_41;
    }
LABEL_118:
    __break(1u);
    goto LABEL_119;
  }
  unint64_t v22 = (result & 0xFFFFFFFFFFFF0000) + 65540;
LABEL_41:
  a1[2] = v22;
  unint64_t result = sub_1B378D870(v10);
  if ((result & 0x100000000) == 0)
  {
    if ((v11 & 0x2000000000000000) == 0) {
      unint64_t v21 = v16 & 0xFFFFFFFFFFFFLL;
    }
    if (v22 >> 14 != 4 * v21)
    {
      int v23 = result;
      if ((v22 & 0xC) == v15)
      {
        unint64_t result = sub_1B36E07D4(v22, v16, v11);
        unint64_t v22 = result;
      }
      unint64_t v24 = v22 >> 16;
      if (v22 >> 16 >= v21)
      {
        __break(1u);
      }
      else
      {
        if ((v11 & 0x1000000000000000) != 0)
        {
          LOBYTE(v11) = sub_1B37A0950();
        }
        else if ((v11 & 0x2000000000000000) != 0)
        {
          unint64_t v44 = v16;
          uint64_t v45 = v11 & 0xFFFFFFFFFFFFFFLL;
          LOBYTE(v11) = *((unsigned char *)&v44 + v24);
        }
        else
        {
          if ((v16 & 0x1000000000000000) != 0) {
            uint64_t v25 = (v11 & 0xFFFFFFFFFFFFFFFLL) + 32;
          }
          else {
            uint64_t v25 = sub_1B37A0CB0();
          }
          LOBYTE(v11) = *(unsigned char *)(v25 + v24);
        }
        unint64_t v22 = *a1;
        unint64_t v16 = a1[1];
        unint64_t result = a1[2];
        uint64_t v26 = ((unint64_t)*a1 >> 59) & 1;
        if ((v16 & 0x1000000000000000) == 0) {
          LOBYTE(v26) = 1;
        }
        unint64_t v21 = 4 << v26;
        if ((a1[2] & 0xC) != 4 << v26) {
          goto LABEL_58;
        }
      }
      unint64_t result = sub_1B36E07D4(result, v22, v16);
LABEL_58:
      unint64_t v27 = HIBYTE(v16) & 0xF;
      if ((v16 & 0x1000000000000000) == 0)
      {
        unint64_t v28 = (result & 0xFFFFFFFFFFFF0000) + 65540;
LABEL_60:
        a1[2] = v28;
        unint64_t result = sub_1B378D870(v11);
        if ((result & 0x100000000) == 0)
        {
          if ((v16 & 0x2000000000000000) == 0) {
            unint64_t v27 = v22 & 0xFFFFFFFFFFFFLL;
          }
          if (v28 >> 14 != 4 * v27)
          {
            int v29 = result;
            if ((v28 & 0xC) == v21)
            {
              unint64_t result = sub_1B36E07D4(v28, v22, v16);
              unint64_t v28 = result;
            }
            unint64_t v30 = v28 >> 16;
            if (v28 >> 16 >= v27)
            {
              __break(1u);
              goto LABEL_108;
            }
            if ((v16 & 0x1000000000000000) != 0)
            {
              LOBYTE(v16) = sub_1B37A0950();
              goto LABEL_74;
            }
            if ((v16 & 0x2000000000000000) != 0)
            {
              unint64_t v44 = v22;
              uint64_t v45 = v16 & 0xFFFFFFFFFFFFFFLL;
              LOBYTE(v16) = *((unsigned char *)&v44 + v30);
              goto LABEL_74;
            }
            if ((v22 & 0x1000000000000000) == 0) {
              goto LABEL_116;
            }
            for (uint64_t i = (v16 & 0xFFFFFFFFFFFFFFFLL) + 32; ; uint64_t i = sub_1B37A0CB0())
            {
              LOBYTE(v16) = *(unsigned char *)(i + v30);
LABEL_74:
              unint64_t v22 = *a1;
              unint64_t v28 = a1[1];
              unint64_t result = a1[2];
              uint64_t v32 = ((unint64_t)*a1 >> 59) & 1;
              if ((v28 & 0x1000000000000000) == 0) {
                LOBYTE(v32) = 1;
              }
              if ((a1[2] & 0xC) == 4 << v32)
              {
LABEL_108:
                unint64_t result = sub_1B36E07D4(result, v22, v28);
                if ((v28 & 0x1000000000000000) == 0)
                {
LABEL_78:
                  uint64_t v33 = (result & 0xFFFFFFFFFFFF0000) + 65540;
                  goto LABEL_79;
                }
              }
              else if ((v28 & 0x1000000000000000) == 0)
              {
                goto LABEL_78;
              }
              unint64_t v43 = HIBYTE(v28) & 0xF;
              if ((v28 & 0x2000000000000000) == 0) {
                unint64_t v43 = v22 & 0xFFFFFFFFFFFFLL;
              }
              if (v43 <= result >> 16) {
                goto LABEL_120;
              }
              uint64_t v33 = sub_1B37A0910();
LABEL_79:
              a1[2] = v33;
              unint64_t v34 = sub_1B378D870(v16);
              if ((v34 & 0x100000000) != 0) {
                goto LABEL_84;
              }
              int v35 = (v17 << 12) + (v23 << 8);
              if (__CFADD__(v17 << 12, v23 << 8))
              {
                __break(1u);
LABEL_114:
                __break(1u);
                goto LABEL_115;
              }
              BOOL v36 = __CFADD__(v35, 16 * v29);
              int v37 = v35 + 16 * v29;
              if (v36) {
                goto LABEL_114;
              }
              BOOL v36 = __CFADD__(v37, v34);
              unsigned int v38 = v37 + v34;
              if (!v36)
              {
                unsigned __int8 v39 = 0;
                goto LABEL_85;
              }
LABEL_115:
              __break(1u);
LABEL_116:
              ;
            }
          }
        }
        goto LABEL_84;
      }
      unint64_t v42 = v22 & 0xFFFFFFFFFFFFLL;
      if ((v16 & 0x2000000000000000) != 0) {
        unint64_t v42 = HIBYTE(v16) & 0xF;
      }
      if (v42 > result >> 16)
      {
        unint64_t v28 = sub_1B37A0910();
        goto LABEL_60;
      }
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
      return result;
    }
  }
LABEL_84:
  unsigned int v38 = 0;
  unsigned __int8 v39 = 1;
LABEL_85:
  LOBYTE(v44) = v39;
  return v38 | ((unint64_t)v39 << 32);
}

void sub_1B378EAD0()
{
  OUTLINED_FUNCTION_20_15();
  if (!v5)
  {
    do
    {
      uint64_t v3 = *v1;
      if (v3 > 0x23) {
        break;
      }
      if (((1 << v3) & 0x100002600) != 0)
      {
        *(void *)(v0 + 40) = ++v1;
      }
      else
      {
        if (v3 != 35) {
          return;
        }
        *(void *)(v0 + 40) = v1 + 1;
        if (v1 + 1 == v2) {
          return;
        }
        int v4 = v1[1];
        for (v1 += 2; ; ++v1)
        {
          *(void *)(v0 + 40) = v1;
          BOOL v5 = v4 == 10 || v4 == 13;
          if (v5) {
            break;
          }
          if (v1 == v2) {
            return;
          }
          int v6 = *v1;
          int v4 = v6;
        }
      }
    }
    while (v1 != v2);
  }
}

unsigned __int8 *sub_1B378EB5C()
{
  unint64_t v2 = *(unsigned __int8 **)(v0 + 40);
  uint64_t v1 = *(unsigned __int8 **)(v0 + 48);
  if (v2 != v1)
  {
    uint64_t v3 = *(unsigned __int8 **)(v0 + 40);
    do
    {
      int v4 = *v3;
      if ((v4 & 0xFFFFFFDF) - 91 <= 0xFFFFFFE5 && v4 != 95 && (v4 - 48) > 9) {
        break;
      }
      *(void *)(v0 + 40) = ++v3;
    }
    while (v3 != v1);
  }
  sub_1B378EAD0();
  return v2;
}

char *sub_1B378EBD8()
{
  unint64_t result = (char *)sub_1B378EB5C();
  if (!result)
  {
    __break(1u);
    goto LABEL_5;
  }
  unint64_t result = (char *)sub_1B36C17CC(result, v1 - (void)result);
  if (!v2) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_1B378EC08(unsigned __int8 a1, unsigned char *a2)
{
  uint64_t v3 = *(unsigned __int8 **)(v2 + 40);
  *a2 = 0;
  int v4 = *(unsigned __int8 **)(v2 + 48);
  if (v3 == v4) {
    goto LABEL_10;
  }
  int v5 = a1;
  int v6 = v3 + 1;
  int v7 = *v3;
  *(void *)(v2 + 40) = v3 + 1;
  if (v7 == a1)
  {
    uint64_t result = 0;
LABEL_4:
    *(void *)(v2 + 40) = v3;
    return result;
  }
  if (v7 == 10 || v7 == 13)
  {
LABEL_10:
    sub_1B36C9A2C();
    uint64_t v10 = OUTLINED_FUNCTION_2();
    return OUTLINED_FUNCTION_7_0(v10, v11);
  }
  uint64_t result = 0;
  while (v7 == 92)
  {
    *a2 = 1;
    if (v6 == v4) {
      goto LABEL_10;
    }
    char v12 = v6 + 1;
    unsigned int v13 = *v6;
    *(void *)(v2 + 40) = v6 + 1;
    if (v13 - 56 < 0xFFFFFFF8)
    {
      if (v13 - 97 > 0x17) {
        goto LABEL_41;
      }
      if (((1 << (v13 - 97)) & 0x2A2023) == 0)
      {
        if (v13 == 117)
        {
          uint64_t v25 = 4;
          goto LABEL_56;
        }
        if (v13 == 120)
        {
          if (v12 == v4) {
            goto LABEL_10;
          }
          unsigned __int8 v14 = *v12;
          if ((v14 - 58) <= 0xF5u)
          {
            unsigned int v15 = v14 - 65;
            if (v15 > 0x25 || ((1 << v15) & 0x3F0000003FLL) == 0) {
              goto LABEL_10;
            }
          }
          unint64_t v16 = v6 + 2;
          *(void *)(v2 + 40) = v6 + 2;
          int v17 = v4;
          if (v6 + 2 != v4)
          {
            if ((*v16 - 58) > 0xF5u) {
              goto LABEL_26;
            }
            unsigned int v18 = *v16 - 65;
            if (v18 > 0x25)
            {
              int v17 = v6 + 2;
            }
            else
            {
              uint64_t v19 = 1 << v18;
              int v17 = v6 + 2;
              if ((v19 & 0x3F0000003FLL) != 0)
              {
LABEL_26:
                int v17 = v6 + 3;
                *(void *)(v2 + 40) = v6 + 3;
              }
            }
          }
          BOOL v20 = __OFADD__(result++, 1);
          if (v20) {
            goto LABEL_86;
          }
          goto LABEL_45;
        }
LABEL_41:
        uint64_t v21 = v13 - 34;
        if (v21 > 0x3A) {
          goto LABEL_10;
        }
        if (((1 << (v13 - 34)) & 0x400000020000021) == 0)
        {
          if (v21 != 51) {
            goto LABEL_10;
          }
          uint64_t v25 = 8;
LABEL_56:
          if (v4 - v12 < v25) {
            goto LABEL_10;
          }
          unsigned int v26 = 0;
          unint64_t v27 = v12;
          uint64_t v28 = v25;
          do
          {
            char v30 = *v27++;
            char v29 = v30;
            if ((v30 - 58) > 0xF5u)
            {
              char v31 = -48;
            }
            else if ((v29 - 71) > 0xF9u)
            {
              char v31 = -55;
            }
            else
            {
              if ((v29 - 103) < 0xFAu) {
                goto LABEL_10;
              }
              char v31 = -87;
            }
            unsigned int v26 = 16 * v26 + (v29 + v31);
            --v28;
          }
          while (v28);
          int v17 = &v12[v25];
          *(void *)(v2 + 40) = v17;
          if (v26 <= 0x7F)
          {
            BOOL v20 = __OFADD__(result++, 1);
            if (v20) {
              goto LABEL_87;
            }
          }
          else if (v26 <= 0x7FF)
          {
            BOOL v20 = __OFADD__(result, 2);
            result += 2;
            if (v20) {
              goto LABEL_88;
            }
          }
          else
          {
            if (v26 - 57344 > 0xFFFFF7FF) {
              goto LABEL_10;
            }
            if (v26 - 0x10000 >= 0xFFFF0800)
            {
              BOOL v20 = __OFADD__(result, 3);
              result += 3;
              if (v20) {
                goto LABEL_90;
              }
            }
            else
            {
              if (v26 - 1114112 < 0xFFF00000) {
                goto LABEL_10;
              }
              BOOL v20 = __OFADD__(result, 4);
              result += 4;
              if (v20) {
                goto LABEL_89;
              }
            }
          }
          goto LABEL_45;
        }
      }
      BOOL v20 = __OFADD__(result++, 1);
      if (v20) {
        goto LABEL_85;
      }
      int v17 = v12;
      goto LABEL_45;
    }
    int v17 = v4;
    if (v12 != v4)
    {
      int v17 = v6 + 1;
      if (*v12 - 56 >= 0xFFFFFFF8)
      {
        *(void *)(v2 + 40) = v6 + 2;
        int v17 = v4;
        if (v6 + 2 != v4)
        {
          int v17 = v6 + 2;
          if (v6[2] - 56 >= 0xFFFFFFF8)
          {
            if (v13 > 0x33) {
              goto LABEL_10;
            }
            int v17 = v6 + 3;
            *(void *)(v2 + 40) = v6 + 3;
          }
        }
      }
    }
    BOOL v20 = __OFADD__(result++, 1);
    if (v20) {
      goto LABEL_84;
    }
LABEL_45:
    if (v17 == v4) {
      goto LABEL_10;
    }
    int v23 = *v17;
    unint64_t v22 = v17 + 1;
    int v7 = v23;
    *(void *)(v2 + 40) = v22;
    if (v23 == v5) {
      goto LABEL_4;
    }
    BOOL v24 = v7 == 10 || v7 == 13;
    int v6 = v22;
    if (v24) {
      goto LABEL_10;
    }
  }
  BOOL v20 = __OFADD__(result++, 1);
  if (!v20)
  {
    int v17 = v6;
    goto LABEL_45;
  }
  __break(1u);
LABEL_84:
  __break(1u);
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
LABEL_87:
  __break(1u);
LABEL_88:
  __break(1u);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
  return result;
}

unsigned char *sub_1B378EF70(unsigned char *result, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (result && a2 - (uint64_t)result >= 1)
  {
    int v4 = a4;
    int v5 = *(unsigned __int8 **)(a3 + 40);
    unsigned int v6 = *v5;
    if (v6 == a4)
    {
LABEL_4:
      *(void *)(a3 + 40) = v5 + 1;
      return result;
    }
    while (1)
    {
      *(void *)(a3 + 40) = v5 + 1;
      if (v6 == 92)
      {
        int v7 = v5[1];
        uint64_t v8 = (char *)(v5 + 2);
        *(void *)(a3 + 40) = v5 + 2;
        if ((v7 - 56) < 0xF8u)
        {
          uint64_t v9 = 4;
          switch(v7)
          {
            case 'n':
              *uint64_t result = 10;
              goto LABEL_54;
            case 'o':
            case 'p':
            case 'q':
            case 's':
            case 'w':
              goto LABEL_32;
            case 'r':
              *uint64_t result = 13;
              goto LABEL_54;
            case 't':
              *uint64_t result = 9;
              goto LABEL_54;
            case 'u':
              goto LABEL_18;
            case 'v':
              *uint64_t result = 11;
              goto LABEL_54;
            case 'x':
              char v21 = *v8;
              if ((*v8 - 58) > 0xF5u)
              {
                char v22 = -48;
              }
              else if ((v21 - 71) > 0xF9u)
              {
                char v22 = -55;
              }
              else
              {
                if ((v21 - 103) < 0xFAu) {
                  goto LABEL_60;
                }
                char v22 = -87;
              }
              LOBYTE(v6) = v21 + v22;
              *(void *)(a3 + 40) = v5 + 3;
              unsigned __int8 v23 = v5[3];
              if ((v23 - 58) > 0xF5u)
              {
                char v24 = -48;
              }
              else if ((v23 - 71) > 0xF9u)
              {
                char v24 = -55;
              }
              else
              {
                if ((v23 - 103) < 0xFAu) {
                  goto LABEL_53;
                }
                char v24 = -87;
              }
              LOBYTE(v6) = v23 + v24 + 16 * v6;
              *(void *)(a3 + 40) = v5 + 4;
              goto LABEL_53;
            default:
              switch(v7)
              {
                case 'f':
                  *uint64_t result = 12;
                  goto LABEL_54;
                case 'a':
                  *uint64_t result = 7;
                  goto LABEL_54;
                case 'b':
                  *uint64_t result = 8;
                  goto LABEL_54;
              }
              if (v7 != 85)
              {
LABEL_32:
                *uint64_t result = v7;
                goto LABEL_54;
              }
              uint64_t v9 = 8;
LABEL_18:
              unsigned int v6 = 0;
              unsigned int v13 = (char *)(v5 + 2);
              uint64_t v14 = v9;
              do
              {
                char v16 = *v13++;
                char v15 = v16;
                if ((v16 - 58) > 0xF5u)
                {
                  char v17 = -48;
                }
                else if ((v15 - 71) > 0xF9u)
                {
                  char v17 = -55;
                }
                else
                {
                  if ((v15 - 103) < 0xFAu)
                  {
                    __break(1u);
                    goto LABEL_59;
                  }
                  char v17 = -87;
                }
                unsigned int v6 = 16 * v6 + (v15 + v17);
                --v14;
              }
              while (v14);
              *(void *)(a3 + 40) = &v8[v9];
              if (v6 <= 0x7F) {
                goto LABEL_53;
              }
              char v18 = v6 & 0x3F | 0x80;
              if (v6 <= 0x7FF)
              {
                *uint64_t result = (v6 >> 6) - 64;
                result[1] = v18;
                uint64_t v20 = 2;
              }
              else
              {
                int v19 = (v6 >> 6) & 0x3F | 0x80;
                if (HIWORD(v6))
                {
                  if (HIWORD(v6) <= 0x10u)
                  {
                    *uint64_t result = (v6 >> 18) - 16;
                    result[1] = (v6 >> 12) & 0x3F | 0x80;
                    result[2] = v19;
                    result[3] = v18;
                    uint64_t v20 = 4;
                    goto LABEL_55;
                  }
LABEL_59:
                  __break(1u);
LABEL_60:
                  __break(1u);
                  JUMPOUT(0x1B378F2ACLL);
                }
                *uint64_t result = (v6 >> 12) - 32;
                result[1] = v19;
                result[2] = v18;
                uint64_t v20 = 3;
              }
              break;
          }
          goto LABEL_55;
        }
        LOBYTE(v6) = v7 - 48;
        char v10 = *v8;
        if ((*v8 - 56) >= 0xF8u)
        {
          *(void *)(a3 + 40) = v5 + 3;
          char v11 = v10 - 48;
          unsigned __int8 v12 = v5[3];
          if ((v12 - 56) >= 0xF8u)
          {
            *(void *)(a3 + 40) = v5 + 4;
            LOBYTE(v6) = ((_BYTE)v7 << 6) + 8 * v11 + v12 - 48;
          }
          else
          {
            LOBYTE(v6) = v11 + 8 * v6;
          }
        }
      }
LABEL_53:
      *uint64_t result = v6;
LABEL_54:
      uint64_t v20 = 1;
LABEL_55:
      result += v20;
      int v5 = *(unsigned __int8 **)(a3 + 40);
      unsigned int v6 = *v5;
      if (v6 == v4) {
        goto LABEL_4;
      }
    }
  }
  return result;
}

unint64_t sub_1B378F2D8(unsigned __int8 a1)
{
  uint64_t v3 = *(char **)(v1 + 40);
  int v4 = *(char **)(v1 + 48);
  if (v3 == v4) {
    return 0;
  }
  int v5 = *v3;
  if (v5 == a1)
  {
    char v6 = 0;
    int v7 = *(unsigned __int8 **)(v1 + 40);
  }
  else
  {
    char v6 = 0;
    int v7 = *(unsigned __int8 **)(v1 + 40);
    while (2)
    {
      v7 += 2;
      while (1)
      {
        uint64_t v9 = v7 - 1;
        if (v5 == 10 || v5 == 13)
        {
          unint64_t v8 = 0;
          *(void *)(v1 + 40) = v9;
          return v8;
        }
        if (v5 == 92) {
          break;
        }
        if (v9 == (unsigned __int8 *)v4) {
          goto LABEL_21;
        }
        int v5 = *(v7++ - 1);
        if (v5 == a1)
        {
          v7 -= 2;
          goto LABEL_18;
        }
      }
      if (v9 == (unsigned __int8 *)v4 || v7 == (unsigned __int8 *)v4)
      {
LABEL_21:
        unint64_t v8 = 0;
        *(void *)(v1 + 40) = v4;
        return v8;
      }
      int v5 = *v7;
      char v6 = 1;
      if (v5 != a1) {
        continue;
      }
      break;
    }
  }
LABEL_18:
  unint64_t v8 = sub_1B36C17CC(v3, v7 - (unsigned __int8 *)v3);
  unint64_t v11 = v10;
  *(void *)(v1 + 40) = v7 + 1;
  sub_1B378EAD0();
  if (v11 && (v6 & 1) != 0)
  {
    unint64_t v8 = sub_1B378D8E4(v8, v11);
    swift_bridgeObjectRelease();
  }
  return v8;
}

uint64_t sub_1B378F414()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 40);
  uint64_t v2 = *(unsigned __int8 **)(v0 + 48);
  if (v1 != v2)
  {
    int v3 = *v1;
    int v4 = *(unsigned __int8 **)(v0 + 40);
    if (v3 == 45)
    {
      int v4 = v1 + 1;
      *(void *)(v0 + 40) = v1 + 1;
      if (v1 + 1 == v2) {
        goto LABEL_22;
      }
      int v3 = *v4;
    }
    if (v3 == 46)
    {
      *(void *)(v0 + 40) = ++v4;
      if (v4 == v2 || *v4 - 58 <= 0xFFFFFFF5) {
        goto LABEL_22;
      }
      goto LABEL_13;
    }
    if (v3 == 48)
    {
      *(void *)(v0 + 40) = ++v4;
      if (v4 == v2)
      {
LABEL_18:
        char v6 = v2;
        goto LABEL_19;
      }
      if (*v4 - 58 >= 0xFFFFFFF6) {
        goto LABEL_22;
      }
LABEL_13:
      char v6 = v4;
      while (1)
      {
        int v7 = *v6;
        if ((v7 - 58) <= 0xFFFFFFF5)
        {
          unsigned int v8 = v7 - 43;
          if (v8 > 0x3B) {
            goto LABEL_19;
          }
          if (((1 << v8) & 0x40000000400000DLL) == 0) {
            break;
          }
        }
        *(void *)(v0 + 40) = ++v6;
        ++v4;
        if (v6 == v2) {
          goto LABEL_18;
        }
      }
      if (((1 << v8) & 0x800000008000000) != 0)
      {
        sub_1B3739460((uint64_t)v1, (uint64_t)v4);
        uint64_t v5 = v11;
        *(void *)(v0 + 40) = v6 + 1;
        goto LABEL_20;
      }
LABEL_19:
      sub_1B3739460((uint64_t)v1, (uint64_t)v6);
      uint64_t v5 = v9;
LABEL_20:
      sub_1B378EAD0();
      return v5;
    }
    if ((v3 - 58) >= 0xFFFFFFF7) {
      goto LABEL_13;
    }
LABEL_22:
    uint64_t v5 = 0;
    *(void *)(v0 + 40) = v1;
    return v5;
  }
  return 0;
}

uint64_t sub_1B378F594(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    int v4 = *(unsigned __int8 **)(v1 + 40);
    int v3 = *(unsigned __int8 **)(v1 + 48);
    if (v4 != v3 && *v4 == *(unsigned __int8 *)(result + 32))
    {
      uint64_t v5 = &v4[v2];
      char v6 = v4 + 1;
      int v7 = (unsigned __int8 *)(result + 33);
      uint64_t v8 = v2 - 1;
      while (v8)
      {
        if (v6 != v3)
        {
          int v10 = *v7++;
          int v9 = v10;
          int v11 = *v6++;
          --v8;
          if (v11 == v9) {
            continue;
          }
        }
        return result;
      }
      *(void *)(v1 + 40) = v5;
    }
  }
  return result;
}

uint64_t sub_1B378F5F4(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(v1 + 40);
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    int v4 = *(unsigned char **)(v1 + 48);
    if (v2 != v4)
    {
      uint64_t v5 = 0;
      uint64_t v6 = v3 - 1;
      do
      {
        unsigned __int8 v7 = v2[v5];
        if ((v7 - 91) >= 0xE6u) {
          v7 += 32;
        }
        if (*(unsigned __int8 *)(a1 + 32 + v5) != v7) {
          break;
        }
        uint64_t v8 = &v2[v5 + 1];
        *(void *)(v1 + 40) = v8;
        if (v6 == v5) {
          goto LABEL_11;
        }
        ++v5;
      }
      while (&v2[v5] != v4);
    }
    goto LABEL_15;
  }
  int v4 = *(unsigned char **)(v1 + 48);
  uint64_t v8 = *(unsigned char **)(v1 + 40);
LABEL_11:
  if (v8 == v4) {
    return 1;
  }
  if ((*v8 & 0xDFu) - 91 < 0xFFFFFFE6)
  {
    sub_1B378EAD0();
    return 1;
  }
LABEL_15:
  uint64_t result = 0;
  *(void *)(v1 + 40) = v2;
  return result;
}

uint64_t sub_1B378F6B0()
{
  uint64_t v1 = *(unsigned char **)(v0 + 40);
  if (v1 != *(unsigned char **)(v0 + 48) && *v1 == 45) {
    *(void *)(v0 + 40) = v1 + 1;
  }
  char v2 = sub_1B378F5F4((uint64_t)&unk_1F0C07B58);
  if ((v2 & 1) == 0) {
    *(void *)(v0 + 40) = v1;
  }
  return v2 & 1;
}

unint64_t sub_1B378F704()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 40);
  if (v1 == *(unsigned __int8 **)(v0 + 48))
  {
    uint64_t v4 = 0;
LABEL_11:
    unsigned __int8 v3 = 1;
    return v4 | ((unint64_t)v3 << 32);
  }
  int v2 = *v1;
  if (v2 == 45) {
    *(void *)(v0 + 40) = v1 + 1;
  }
  if ((sub_1B378F5F4((uint64_t)&unk_1F0BFFEE0) & 1) == 0 && (sub_1B378F5F4((uint64_t)&unk_1F0BFFEB8) & 1) == 0)
  {
    uint64_t v4 = 0;
    *(void *)(v0 + 40) = v1;
    goto LABEL_11;
  }
  unsigned __int8 v3 = 0;
  uint64_t v4 = 2139095040;
  if (v2 == 45) {
    uint64_t v4 = 4286578688;
  }
  return v4 | ((unint64_t)v3 << 32);
}

uint64_t sub_1B378F7A8()
{
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  *(void *)(v0 + 40) = v3 + 1;
  if (v3 + 1 == v2) {
    goto LABEL_12;
  }
  if ((*(unsigned char *)(v3 + 1) & 0xDFu) - 91 < 0xFFFFFFE6) {
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_38_11();
  if (v12) {
    goto LABEL_12;
  }
  uint64_t v6 = 0;
  while (1)
  {
    int v7 = *(unsigned __int8 *)(v3 + v6 + 2);
    BOOL v8 = (v7 - 58) > 0xFFFFFFF5 || (v7 & 0xFFFFFFDF) - 91 > 0xFFFFFFE5;
    if (!v8 && (v7 - 46) >= 2 && v7 != 95) {
      break;
    }
    *(void *)(v0 + 40) = v3 + v6++ + 3;
    if (v3 + v6 + 2 == v5) {
      goto LABEL_12;
    }
  }
  BOOL v12 = v7 != 93 || v3 + v6 + 2 == v5;
  if (v12 || v7 != 93 || (uint64_t v13 = sub_1B36C17CC(v4, v6 + 1), !v14))
  {
LABEL_12:
    sub_1B36C9A2C();
    uint64_t v9 = OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_7_0(v9, v10);
  }
  else
  {
    uint64_t v1 = v13;
    *(void *)(v0 + 40) = v3 + v6 + 3;
    sub_1B378EAD0();
  }
  return v1;
}

void sub_1B378F8C8(char a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = *(unsigned __int8 **)(v1 + 40);
  int v5 = *v4;
  if (v5 == 39 || v5 == 34)
  {
    uint64_t v6 = sub_1B378D0D8();
    if (!v2) {
      sub_1B36C2E10(v6, v7);
    }
    return;
  }
  BOOL v8 = *(unsigned __int8 **)(v1 + 48);
  BOOL v9 = v5 != 91 || v4 == v8;
  if (v9)
  {
    sub_1B378D4E8();
    if (v2) {
      return;
    }
    if ((v10 & 1) == 0)
    {
LABEL_20:
      sub_1B378EAD0();
      return;
    }
    if (sub_1B378FEBC())
    {
      if (v5 == 45) {
        sub_1B378CA18();
      }
      else {
        sub_1B378CABC();
      }
    }
    else
    {
      sub_1B378C9A4();
    }
  }
  else
  {
    *(void *)(v1 + 40) = v4 + 1;
    sub_1B378EAD0();
    if ((a1 & 1) == 0) {
      goto LABEL_74;
    }
    BOOL v12 = *(unsigned __int8 **)(v1 + 40);
    if (v12 == v8) {
      goto LABEL_74;
    }
    LODWORD(v13) = *v12;
    if (v13 == 93)
    {
      uint64_t v14 = v12 + 1;
LABEL_19:
      *(void *)(v1 + 40) = v14;
      goto LABEL_20;
    }
    while (2)
    {
      if (v13 == 60 || v13 == 123)
      {
        uint64_t v15 = v3;
        sub_1B378FB90();
      }
      else
      {
        uint64_t v15 = v3;
        sub_1B378F8C8(0);
      }
      uint64_t v3 = v15;
      if (!v15)
      {
        OUTLINED_FUNCTION_27_12();
        if (!v9)
        {
          unsigned int v18 = *v17;
          if (v18 == 93)
          {
            uint64_t v14 = v17 + 1;
            goto LABEL_19;
          }
          while (v18 <= 0x23)
          {
            if (((1 << v18) & 0x100002600) != 0)
            {
              *(void *)(v1 + 40) = ++v17;
            }
            else
            {
              if (v18 != 35) {
                break;
              }
              *(void *)(v1 + 40) = v17 + 1;
              if (v17 + 1 == v16) {
                goto LABEL_74;
              }
              int v19 = v17[1];
              *(void *)(v1 + 40) = v17 + 2;
              if (v19 == 10 || v19 == 13)
              {
                v17 += 2;
              }
              else
              {
                if (v17 + 2 == v16) {
                  goto LABEL_74;
                }
                OUTLINED_FUNCTION_9_19();
                if (!v9 && v21 != 13)
                {
                  while (v17 != v16)
                  {
                    OUTLINED_FUNCTION_9_19();
                    if (v9 || v23 == 13) {
                      goto LABEL_31;
                    }
                  }
                  goto LABEL_74;
                }
              }
            }
LABEL_31:
            if (v17 == v16) {
              goto LABEL_74;
            }
            unsigned int v18 = *v17;
          }
        }
        if (v17 != v16 && *v17 == 44)
        {
          char v24 = v17 + 1;
          *(void *)(v1 + 40) = v17 + 1;
          if (v17 + 1 != v16)
          {
            while (1)
            {
              uint64_t v13 = *v24;
              if (v13 > 0x23) {
                break;
              }
              if (((1 << v13) & 0x100002600) != 0)
              {
                uint64_t v25 = v24 + 1;
                *(void *)(v1 + 40) = v24 + 1;
              }
              else
              {
                if (v13 != 35) {
                  break;
                }
                OUTLINED_FUNCTION_38_11();
                if (v9) {
                  goto LABEL_74;
                }
                int v27 = v26[1];
                uint64_t v25 = v26 + 2;
                *(void *)(v1 + 40) = v26 + 2;
                if (v27 != 10 && v27 != 13)
                {
                  if (v25 == v16) {
                    goto LABEL_74;
                  }
                  int v29 = v26[2];
                  uint64_t v25 = v26 + 3;
                  *(void *)(v1 + 40) = v26 + 3;
                  if (v29 != 10 && v29 != 13)
                  {
                    while (v25 != v16)
                    {
                      OUTLINED_FUNCTION_9_19();
                      if (v9 || v31 == 13) {
                        goto LABEL_56;
                      }
                    }
                    goto LABEL_74;
                  }
                }
              }
LABEL_56:
              char v24 = v25;
              if (v25 == v16) {
                goto LABEL_74;
              }
            }
            if (v24 != v16) {
              continue;
            }
          }
        }
LABEL_74:
        sub_1B36C9A2C();
        uint64_t v32 = OUTLINED_FUNCTION_2();
        OUTLINED_FUNCTION_7_0(v32, v33);
      }
      break;
    }
  }
}

void sub_1B378FB90()
{
  sub_1B378C090();
  if (!v1)
  {
    uint64_t v3 = (unsigned __int8 *)v0[5];
    uint64_t v4 = (unsigned __int8 *)v0[6];
    if (v3 == v4)
    {
LABEL_84:
      sub_1B36C9A2C();
      uint64_t v36 = OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_7_0(v36, v37);
    }
    else
    {
      unsigned __int8 v5 = v2;
      while (*v3 != v5)
      {
        sub_1B378D634(1);
        if (!v6) {
          goto LABEL_84;
        }
        swift_bridgeObjectRelease();
        if ((unsigned __int8 *)v0[5] != v4)
        {
          while (1)
          {
            OUTLINED_FUNCTION_14_13();
            if (!v12 & v9) {
              break;
            }
            if (((1 << v8) & 0x100002600) != 0)
            {
              v0[5] = v7 + 1;
            }
            else
            {
              if (v8 != 35) {
                break;
              }
              OUTLINED_FUNCTION_7_1(v7);
              if (v12) {
                goto LABEL_55;
              }
              OUTLINED_FUNCTION_9_19();
              BOOL v12 = v12 || v11 == 13;
              if (!v12)
              {
                if (v10 == v4) {
                  goto LABEL_55;
                }
                OUTLINED_FUNCTION_9_19();
                if (!v12 && v14 != 13)
                {
                  while (v13 != v4)
                  {
                    OUTLINED_FUNCTION_16_14();
                    if (v12) {
                      goto LABEL_10;
                    }
                  }
                  goto LABEL_55;
                }
              }
            }
LABEL_10:
            OUTLINED_FUNCTION_34_11();
            if (v12) {
              goto LABEL_55;
            }
          }
          if ((unsigned __int8 *)v7 != v4 && v8 == 58)
          {
            uint64_t v16 = v7 + 1;
            v0[5] = v16;
            if ((unsigned __int8 *)v16 == v4) {
              goto LABEL_84;
            }
            while (1)
            {
              OUTLINED_FUNCTION_14_13();
              if (!v12 & v9) {
                break;
              }
              if (((1 << v18) & 0x100002600) != 0)
              {
                v0[5] = v17 + 1;
              }
              else
              {
                if (v18 != 35) {
                  break;
                }
                OUTLINED_FUNCTION_7_1(v17);
                if (v12) {
                  goto LABEL_84;
                }
                OUTLINED_FUNCTION_9_19();
                if (!v12 && v20 != 13)
                {
                  if (v19 == v4) {
                    goto LABEL_84;
                  }
                  OUTLINED_FUNCTION_9_19();
                  if (!v12 && v23 != 13)
                  {
                    while (v22 != v4)
                    {
                      OUTLINED_FUNCTION_16_14();
                      if (v12) {
                        goto LABEL_34;
                      }
                    }
                    goto LABEL_84;
                  }
                }
              }
LABEL_34:
              OUTLINED_FUNCTION_34_11();
              if (v12) {
                goto LABEL_84;
              }
            }
            if ((unsigned __int8 *)v17 == v4) {
              goto LABEL_84;
            }
            if (v18 != 60 && v18 != 123)
            {
              sub_1B378F8C8(1);
              goto LABEL_56;
            }
          }
        }
LABEL_55:
        sub_1B378FB90();
LABEL_56:
        uint64_t v3 = (unsigned __int8 *)v0[5];
        uint64_t v4 = (unsigned __int8 *)v0[6];
        if (v3 != v4)
        {
          int v25 = *v3;
          if (v25 == 59 || v25 == 44)
          {
            unsigned int v26 = v3 + 1;
            v0[5] = v26;
            if (v26 == v4) {
              goto LABEL_84;
            }
            while (1)
            {
              OUTLINED_FUNCTION_14_13();
              if (!v12 & v9) {
                break;
              }
              if (((1 << v27) & 0x100002600) != 0)
              {
                v0[5] = v3 + 1;
              }
              else
              {
                if (v27 != 35) {
                  break;
                }
                OUTLINED_FUNCTION_7_1((uint64_t)v3);
                if (v12) {
                  goto LABEL_84;
                }
                OUTLINED_FUNCTION_9_19();
                if (!v12 && v29 != 13)
                {
                  if (v28 == v4) {
                    goto LABEL_84;
                  }
                  OUTLINED_FUNCTION_9_19();
                  if (!v12 && v32 != 13)
                  {
                    while (v31 != v4)
                    {
                      int v35 = *v31++;
                      int v34 = v35;
                      v0[5] = v31;
                      if (v35 == 10 || v34 == 13) {
                        goto LABEL_63;
                      }
                    }
                    goto LABEL_84;
                  }
                }
              }
LABEL_63:
              OUTLINED_FUNCTION_34_11();
              if (v12) {
                goto LABEL_84;
              }
            }
          }
        }
        if (v3 == v4) {
          goto LABEL_84;
        }
      }
      v0[5] = v3 + 1;
      sub_1B378EAD0();
      uint64_t v38 = v0[10];
      BOOL v39 = __OFADD__(v38, 1);
      uint64_t v40 = v38 + 1;
      if (v39) {
        goto LABEL_89;
      }
      v0[10] = v40;
      if (v0[8] < v40)
      {
        OUTLINED_FUNCTION_15_16();
        sub_1B37A0D40();
        __break(1u);
LABEL_89:
        __break(1u);
      }
    }
  }
}

BOOL sub_1B378FEBC()
{
  uint64_t v1 = *(unsigned __int8 **)(v0 + 40);
  int v2 = *v1;
  if (v2 == 45)
  {
    if (++v1 == *(unsigned __int8 **)(v0 + 48)) {
      return 0;
    }
    int v2 = *v1;
  }
  if (v2 != 48) {
    return 0;
  }
  uint64_t v3 = v1 + 1;
  if (v3 == *(unsigned __int8 **)(v0 + 48)) {
    return 1;
  }
  int v4 = *v3;
  return v4 == 120 || (v4 & 0xF8) == 48;
}

void sub_1B378FF24(unsigned __int8 a1)
{
  sub_1B378EAD0();
  OUTLINED_FUNCTION_20_15();
  if (v4 || *v3 != a1)
  {
    sub_1B36C9A2C();
    uint64_t v5 = OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_7_0(v5, v6);
  }
  else
  {
    *(void *)(v1 + 40) = v3 + 1;
    sub_1B378EAD0();
  }
}

unsigned char *sub_1B378FF8C(uint64_t *a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  unint64_t v3 = a1[1];
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v10 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_1B37A12E0;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v12 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_11;
      }
      if (v12 < (int)v4) {
        goto LABEL_16;
      }
      if (sub_1B37A0530() && __OFSUB__((int)v4, sub_1B37A0560())) {
        goto LABEL_17;
      }
      sub_1B37A0570();
      swift_allocObject();
      uint64_t v14 = sub_1B37A0510();
      swift_release();
      uint64_t v10 = v14;
      uint64_t v12 = v4 >> 32;
LABEL_11:
      if (v12 < (int)v4)
      {
        __break(1u);
LABEL_16:
        __break(1u);
LABEL_17:
        __break(1u);
      }
      uint64_t result = sub_1B3790224((int)v4, v12, v10, a2, a3);
      unint64_t v13 = v10 | 0x4000000000000000;
LABEL_13:
      *a1 = v4;
      a1[1] = v13;
      return result;
    case 2uLL:
      *(void *)&long long v15 = *a1;
      *((void *)&v15 + 1) = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1B37A05A0();
      uint64_t v4 = v15;
      uint64_t result = sub_1B3790224(*(void *)(v15 + 16), *(void *)(v15 + 24), *((uint64_t *)&v15 + 1), a2, a3);
      unint64_t v13 = *((void *)&v15 + 1) | 0x8000000000000000;
      goto LABEL_13;
    case 3uLL:
      *(void *)((char *)&v15 + 7) = 0;
      *(void *)&long long v15 = 0;
      return OUTLINED_FUNCTION_28_12(&v15, (uint64_t)&v15);
    default:
      *(void *)&long long v15 = *a1;
      WORD4(v15) = v3;
      BYTE10(v15) = BYTE2(v3);
      BYTE11(v15) = BYTE3(v3);
      BYTE12(v15) = BYTE4(v3);
      BYTE13(v15) = BYTE5(v3);
      BYTE14(v15) = BYTE6(v3);
      uint64_t result = OUTLINED_FUNCTION_28_12(&v15, (uint64_t)&v15 + BYTE6(v3));
      unint64_t v9 = DWORD2(v15) | ((unint64_t)BYTE12(v15) << 32) | ((unint64_t)BYTE13(v15) << 40) | ((unint64_t)BYTE14(v15) << 48);
      *a1 = v15;
      a1[1] = v9;
      return result;
  }
}

unsigned char *sub_1B3790224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result = (unsigned char *)sub_1B37A0530();
  if (!result) {
    goto LABEL_10;
  }
  uint64_t v10 = result;
  uint64_t result = (unsigned char *)sub_1B37A0560();
  uint64_t v11 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_9;
  }
  BOOL v12 = __OFSUB__(a2, a1);
  uint64_t v13 = a2 - a1;
  if (v12)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v14 = sub_1B37A0550();
  if (v14 >= v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v14;
  }
  return sub_1B378EF70(&v10[v11], (uint64_t)&v10[v11 + v15], a4, a5);
}

uint64_t destroy for TextFormatScanner(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  return swift_release();
}

uint64_t initializeWithCopy for TextFormatScanner(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    uint64_t v5 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = v5;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  *(_WORD *)(a1 + 72) = *(_WORD *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for TextFormatScanner(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 3);
  if (!*(void *)(a1 + 24))
  {
    if (v4)
    {
      *(void *)(a1 + 24) = v4;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      (**(void (***)(uint64_t, long long *))(v4 - 8))(a1, a2);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *a2;
    long long v6 = a2[1];
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
LABEL_8:
  *(void *)(a1 + 40) = *((void *)a2 + 5);
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  *(void *)(a1 + 56) = *((void *)a2 + 7);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *((void *)a2 + 8);
  *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
  *(unsigned char *)(a1 + 73) = *((unsigned char *)a2 + 73);
  *(void *)(a1 + 80) = *((void *)a2 + 10);
  return a1;
}

void *__swift_memcpy88_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t assignWithTake for TextFormatScanner(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for TextFormatScanner(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 88))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 56);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TextFormatScanner(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TextFormatScanner()
{
  return &type metadata for TextFormatScanner;
}

uint64_t Google_Protobuf_Timestamp.seconds.getter()
{
  return *(void *)v0;
}

uint64_t Google_Protobuf_Timestamp.seconds.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*Google_Protobuf_Timestamp.seconds.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Timestamp.nanos.getter()
{
  return *(unsigned int *)(v0 + 8);
}

uint64_t Google_Protobuf_Timestamp.nanos.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*Google_Protobuf_Timestamp.nanos.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Timestamp.unknownFields.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  *a1 = v2;
  a1[1] = v3;
  return sub_1B36B9E20(v2, v3);
}

uint64_t Google_Protobuf_Timestamp.unknownFields.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_1B36C2E10(*(void *)(v1 + 16), *(void *)(v1 + 24));
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v3;
  return result;
}

uint64_t (*Google_Protobuf_Timestamp.unknownFields.modify())(void)
{
  return nullsub_1;
}

unint64_t static Google_Protobuf_Timestamp.protoMessageName.getter()
{
  return 0xD000000000000019;
}

uint64_t sub_1B37906AC()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BF8EB0, &qword_1EB593388);
}

uint64_t static Google_Protobuf_Timestamp._protobuf_nameMap.getter@<X0>(void *a1@<X8>)
{
  if (qword_1EB593370 != -1) {
    swift_once();
  }
  uint64_t v2 = unk_1EB593390;
  uint64_t v3 = qword_1EB593398;
  uint64_t v4 = unk_1EB5933A0;
  *a1 = qword_1EB593388;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t Google_Protobuf_Timestamp.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v8 = *(_DWORD *)(v3 + 8);
  if (!*(void *)v3 || (OUTLINED_FUNCTION_267(), uint64_t result = v9(), !v4))
  {
    if (!v8) {
      return UnknownStorage.traverse<A>(visitor:)(a1, a2, a3);
    }
    OUTLINED_FUNCTION_267();
    uint64_t result = v11();
    if (!v4) {
      return UnknownStorage.traverse<A>(visitor:)(a1, a2, a3);
    }
  }
  return result;
}

uint64_t static Google_Protobuf_Timestamp.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2 || *(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 8)) {
    return 0;
  }
  uint64_t v5 = *(void *)(a2 + 16);
  unint64_t v4 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v6 = *(void *)(a1 + 24);
  sub_1B36B9E20(v7, v6);
  sub_1B36B9E20(v5, v4);
  char v8 = MEMORY[0x1B3EB6700](v7, v6, v5, v4);
  sub_1B36C2E10(v5, v4);
  sub_1B36C2E10(v7, v6);
  return v8 & 1;
}

uint64_t Google_Protobuf_Timestamp.hashValue.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *((unsigned int *)v0 + 2);
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  sub_1B37A0E20();
  sub_1B36D67E0(v6, v1, v2, v4, v3);
  return sub_1B37A0E80();
}

unint64_t sub_1B3790910()
{
  return 0xD000000000000019;
}

uint64_t sub_1B3790938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Google_Protobuf_Timestamp.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_1B3790954()
{
  return sub_1B379C9D0(*(void *)v0, *(unsigned int *)(v0 + 8), *(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_1B379096C(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_1B374735C();
  unint64_t result = sub_1B379099C();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1B379099C()
{
  unint64_t result = qword_1E9CBB358;
  if (!qword_1E9CBB358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB358);
  }
  return result;
}

unint64_t sub_1B37909EC()
{
  unint64_t result = qword_1E9CBB360;
  if (!qword_1E9CBB360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB360);
  }
  return result;
}

uint64_t sub_1B3790A38(uint64_t result)
{
  if (!result) {
    return 0;
  }
  if (!((int)result % 1000000))
  {
    if ((result & 0x80000000) == 0 || (BOOL v1 = __OFSUB__(0, result), result = -(int)result, !v1))
    {
      unint64_t result = ((int)result / 1000000);
      uint64_t v2 = 3;
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  if (!((int)result % 1000))
  {
    if ((result & 0x80000000) == 0 || (BOOL v1 = __OFSUB__(0, result), result = -(int)result, !v1))
    {
      unint64_t result = ((int)result / 1000);
      uint64_t v2 = 6;
      goto LABEL_14;
    }
LABEL_18:
    __break(1u);
    return result;
  }
  if ((result & 0x80000000) != 0)
  {
    BOOL v1 = __OFSUB__(0, result);
    unint64_t result = -(int)result;
    if (v1)
    {
      __break(1u);
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
  }
  uint64_t v2 = 9;
LABEL_14:
  sub_1B3778068(result, v2);
  sub_1B37A08D0();
  swift_bridgeObjectRelease();
  return 46;
}

int64_t sub_1B3790B20(unint64_t a1)
{
  unint64_t v1 = sub_1B3790CCC(a1);
  uint64_t v2 = sub_1B375067C(4 * v1 + 274277, 146097);
  uint64_t v3 = (unsigned __int128)(v2 * (__int128)3) >> 64;
  int64_t result = 3 * v2;
  if (v3 != result >> 63)
  {
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v5 = v1 + 1401;
  int64_t result = sub_1B375067C(result, 4);
  unint64_t v6 = v5 + result;
  if (__OFADD__(v5, result))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  BOOL v7 = __OFSUB__(v6, 38);
  unint64_t v8 = v6 - 38;
  if (v7)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if ((v8 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v9 = (4 * v8) | 3;
  uint64_t v10 = sub_1B37506E0(v9, 1461);
  int64_t result = sub_1B375067C(v10, 4);
  uint64_t v11 = 5 * result;
  if ((unsigned __int128)(result * (__int128)5) >> 64 != (5 * result) >> 63)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v12 = v11 + 2;
  uint64_t v13 = sub_1B37506E0(v11 + 2, 153);
  int64_t result = sub_1B375067C(v13, 5);
  uint64_t v14 = result + 1;
  if (__OFADD__(result, 1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v15 = sub_1B375067C(v12, 153);
  BOOL v7 = __OFADD__(v15, 2);
  int64_t result = v15 + 2;
  if (v7)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int64_t result = sub_1B37506E0(result, 12);
  uint64_t v16 = result + 1;
  if (__OFADD__(result, 1))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  int64_t result = sub_1B375067C(v9, 1461);
  int64_t v17 = result - 4716;
  if (__OFADD__(result, -4716))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  int64_t result = 14 - v16;
  if (__OFSUB__(14, v16))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v18 = sub_1B375067C(result, 12);
  BOOL v7 = __OFADD__(v17, v18);
  int64_t result = v17 + v18;
  if (v7)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (result > 0x7FFFFFFF)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v16 > 0x7FFFFFFF)
  {
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  if (v14 < (uint64_t)0xFFFFFFFF80000000
    || v16 < (uint64_t)0xFFFFFFFF80000000
    || result < (uint64_t)0xFFFFFFFF80000000)
  {
    goto LABEL_36;
  }
  if (v14 <= 0x7FFFFFFF) {
    return result | ((unint64_t)v16 << 32);
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_1B3790CCC(unint64_t result)
{
  unint64_t v1 = result + 0x3118A41200;
  if (__OFADD__(result, 0x3118A41200))
  {
    __break(1u);
  }
  else if ((v1 & 0x8000000000000000) != 0)
  {
    return ~(~v1 / 0x15180);
  }
  else
  {
    return v1 / 0x15180;
  }
  return result;
}

uint64_t sub_1B3790D08()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B3790D48()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B3790D88()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B3790DC8()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B3790E0C()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B3790E4C()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B3790E88()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B3790ED8()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B3790F28()
{
  return sub_1B37911AC();
}

uint64_t sub_1B3790F50()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B3790F98()
{
  return sub_1B37A0E30();
}

uint64_t sub_1B3790FCC()
{
  return sub_1B37A0E30();
}

uint64_t sub_1B3790FF8()
{
  return sub_1B37A0E30();
}

uint64_t sub_1B3791020()
{
  return sub_1B37A0E30();
}

uint64_t sub_1B3791054()
{
  return sub_1B37A0E30();
}

uint64_t sub_1B379107C()
{
  return sub_1B37A0E30();
}

uint64_t sub_1B37910B0()
{
  return sub_1B37A0E30();
}

uint64_t sub_1B37910DC()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B3791120()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B3791160()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B37911AC()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B37911F0()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B3791230()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B3791274()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B37912B4()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B37912F4()
{
  return sub_1B37A0E80();
}

uint64_t sub_1B3791330()
{
  return sub_1B37A0E80();
}

void Google_Protobuf_Syntax.init(rawValue:)(void *a1@<X8>, uint64_t a2@<X0>)
{
  *a1 = a2;
  OUTLINED_FUNCTION_30_12((uint64_t)a1);
}

void sub_1B379138C()
{
  qword_1E9CBB368 = (uint64_t)&unk_1F0BFEF88;
}

uint64_t static Google_Protobuf_Syntax.allCases.getter()
{
  return sub_1B3791E44(&qword_1E9CB95D8);
}

uint64_t sub_1B37913D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static Google_Protobuf_Syntax.allCases.getter();
  *a1 = result;
  return result;
}

void sub_1B37913F8(uint64_t *a1@<X0>, void *a2@<X8>)
{
}

uint64_t sub_1B3791400(uint64_t a1, uint64_t a2)
{
  return sub_1B36DB57C(*(void *)a1, *(unsigned __int8 *)(a1 + 8), *(void *)a2, *(unsigned __int8 *)(a2 + 8));
}

uint64_t Google_Protobuf_Type.name.getter()
{
  return OUTLINED_FUNCTION_55();
}

uint64_t Google_Protobuf_Type.name.setter()
{
  uint64_t result = OUTLINED_FUNCTION_115();
  *unint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*Google_Protobuf_Type.name.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Type.fields.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*Google_Protobuf_Type.fields.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Type.oneofs.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*Google_Protobuf_Type.oneofs.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Type.options.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Google_Protobuf_Type.options.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*Google_Protobuf_Type.options.modify())(void)
{
  return nullsub_1;
}

void Google_Protobuf_Type.sourceContext.getter(void *a1@<X8>)
{
  OUTLINED_FUNCTION_21_10(*(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104), *(void *)(v1 + 112), a1);
}

double sub_1B37915A8@<D0>(uint64_t a1@<X8>)
{
  Google_Protobuf_Type.sourceContext.getter(v4);
  uint64_t v2 = v4[1];
  *(void *)a1 = v4[0];
  *(void *)(a1 + 8) = v2;
  double result = *(double *)&v5;
  *(_OWORD *)(a1 + 16) = v5;
  return result;
}

double sub_1B379162C(unint64_t *a1)
{
  unint64_t v1 = a1[1];
  uint64_t v2 = a1[2];
  unint64_t v3 = a1[3];
  v5.n128_u64[0] = *a1;
  v5.n128_u64[1] = v1;
  uint64_t v6 = v2;
  unint64_t v7 = v3;
  swift_bridgeObjectRetain();
  sub_1B36B9E20(v2, v3);
  *(void *)&double result = Google_Protobuf_Type.sourceContext.setter(&v5).n128_u64[0];
  return result;
}

__n128 Google_Protobuf_Type.sourceContext.setter(__n128 *a1)
{
  __n128 v5 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unint64_t v3 = a1[1].n128_u64[1];
  sub_1B36D5208(*(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104), *(void *)(v1 + 112));
  __n128 result = v5;
  *(__n128 *)(v1 + 88) = v5;
  *(void *)(v1 + 104) = v2;
  *(void *)(v1 + 112) = v3;
  return result;
}

void (*Google_Protobuf_Type.sourceContext.modify(void *a1))()
{
  unint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  OUTLINED_FUNCTION_39_11();
  if (v4)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v10 = v6;
    uint64_t v12 = v7;
  }
  if (!v4) {
    unint64_t v9 = v8;
  }
  *unint64_t v3 = v11;
  v3[1] = v10;
  v3[2] = v12;
  v3[3] = v9;
  sub_1B36D51BC(v5, v6, v7, v8);
  return sub_1B3791754;
}

void sub_1B3791754()
{
  OUTLINED_FUNCTION_55_7();
  if (v6)
  {
    swift_bridgeObjectRetain();
    sub_1B36B9E20(v2, v1);
    OUTLINED_FUNCTION_145_0();
    v4[11] = v5;
    v4[12] = v3;
    v4[13] = v2;
    v4[14] = v1;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_107();
  }
  else
  {
    OUTLINED_FUNCTION_145_0();
    v4[11] = v5;
    v4[12] = v3;
    v4[13] = v2;
    v4[14] = v1;
  }
  free(v0);
}

BOOL Google_Protobuf_Type.hasSourceContext.getter()
{
  return *(void *)(v0 + 96) != 0;
}

Swift::Void __swiftcall Google_Protobuf_Type.clearSourceContext()()
{
  sub_1B36D5208(*(void *)(v0 + 88), *(void *)(v0 + 96), *(void *)(v0 + 104), *(void *)(v0 + 112));
  *(_OWORD *)(v0 + 104) = 0u;
  *(_OWORD *)(v0 + 88) = 0u;
}

void Google_Protobuf_Type.syntax.getter(uint64_t a1@<X8>)
{
}

uint64_t Google_Protobuf_Type.syntax.setter(uint64_t result)
{
  char v2 = *(unsigned char *)(result + 8);
  *(void *)(v1 + 40) = *(void *)result;
  *(unsigned char *)(v1 + 48) = v2;
  return result;
}

uint64_t (*Google_Protobuf_Type.syntax.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Type.edition.getter()
{
  return OUTLINED_FUNCTION_55();
}

uint64_t Google_Protobuf_Type.edition.setter()
{
  OUTLINED_FUNCTION_245();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 56) = v2;
  *(void *)(v1 + 64) = v0;
  return result;
}

uint64_t (*Google_Protobuf_Type.edition.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Type.unknownFields.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_46(*(void *)(v1 + 72), *(void *)(v1 + 80), a1);
}

uint64_t Google_Protobuf_Type.unknownFields.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_1B36C2E10(*(void *)(v1 + 72), *(void *)(v1 + 80));
  *(void *)(v1 + 72) = v2;
  *(void *)(v1 + 80) = v3;
  return result;
}

uint64_t (*Google_Protobuf_Type.unknownFields.modify())(void)
{
  return nullsub_1;
}

double Google_Protobuf_Type.init()@<D0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  uint64_t v1 = MEMORY[0x1E4FBC860];
  *(void *)(a1 + 16) = MEMORY[0x1E4FBC860];
  *(void *)(a1 + 24) = v1;
  *(void *)(a1 + 32) = v1;
  *(void *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 48) = 1;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0xE000000000000000;
  *(_OWORD *)(a1 + 72) = xmmword_1B37A12E0;
  double result = 0.0;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  return result;
}

void Google_Protobuf_Field.kind.getter(uint64_t a1@<X8>)
{
}

uint64_t Google_Protobuf_Field.kind.setter(uint64_t result)
{
  char v2 = *(unsigned char *)(result + 8);
  *(void *)uint64_t v1 = *(void *)result;
  *(unsigned char *)(v1 + 8) = v2;
  return result;
}

uint64_t (*Google_Protobuf_Field.kind.modify())(void)
{
  return nullsub_1;
}

void Google_Protobuf_Field.cardinality.getter(uint64_t a1@<X8>)
{
}

uint64_t Google_Protobuf_Field.cardinality.setter(uint64_t result)
{
  char v2 = *(unsigned char *)(result + 8);
  *(void *)(v1 + 16) = *(void *)result;
  *(unsigned char *)(v1 + 24) = v2;
  return result;
}

uint64_t (*Google_Protobuf_Field.cardinality.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Field.number.getter()
{
  return *(unsigned int *)(v0 + 28);
}

uint64_t Google_Protobuf_Field.number.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 28) = result;
  return result;
}

uint64_t (*Google_Protobuf_Field.number.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Field.name.getter()
{
  return OUTLINED_FUNCTION_55();
}

uint64_t Google_Protobuf_Field.name.setter()
{
  OUTLINED_FUNCTION_245();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v0;
  return result;
}

uint64_t (*Google_Protobuf_Field.name.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Field.typeURL.getter()
{
  return OUTLINED_FUNCTION_55();
}

uint64_t Google_Protobuf_Field.typeURL.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*Google_Protobuf_Field.typeURL.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Field.oneofIndex.getter()
{
  return *(unsigned int *)(v0 + 64);
}

uint64_t Google_Protobuf_Field.oneofIndex.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 64) = result;
  return result;
}

uint64_t (*Google_Protobuf_Field.oneofIndex.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Field.packed.getter()
{
  return *(unsigned __int8 *)(v0 + 68);
}

uint64_t Google_Protobuf_Field.packed.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 68) = result;
  return result;
}

uint64_t (*Google_Protobuf_Field.packed.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Field.options.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Google_Protobuf_Field.options.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 72) = a1;
  return result;
}

uint64_t (*Google_Protobuf_Field.options.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Field.jsonName.getter()
{
  return OUTLINED_FUNCTION_55();
}

uint64_t Google_Protobuf_Field.jsonName.setter()
{
  OUTLINED_FUNCTION_245();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = v2;
  *(void *)(v1 + 88) = v0;
  return result;
}

uint64_t (*Google_Protobuf_Field.jsonName.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Field.defaultValue.getter()
{
  return OUTLINED_FUNCTION_55();
}

uint64_t Google_Protobuf_Field.defaultValue.setter()
{
  OUTLINED_FUNCTION_245();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 96) = v2;
  *(void *)(v1 + 104) = v0;
  return result;
}

uint64_t (*Google_Protobuf_Field.defaultValue.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Field.unknownFields.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_46(*(void *)(v1 + 112), *(void *)(v1 + 120), a1);
}

uint64_t Google_Protobuf_Field.unknownFields.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_1B36C2E10(*(void *)(v1 + 112), *(void *)(v1 + 120));
  *(void *)(v1 + 112) = v2;
  *(void *)(v1 + 120) = v3;
  return result;
}

uint64_t (*Google_Protobuf_Field.unknownFields.modify())(void)
{
  return nullsub_1;
}

void Google_Protobuf_Field.Kind.init(rawValue:)(void *a1@<X8>, uint64_t a2@<X0>)
{
  *a1 = a2;
  OUTLINED_FUNCTION_30_12((uint64_t)a1);
}

void sub_1B3791D60()
{
  qword_1E9CBB370 = (uint64_t)&unk_1F0BFE8E0;
}

uint64_t static Google_Protobuf_Field.Kind.allCases.getter()
{
  return sub_1B3791E44(&qword_1E9CB95E0);
}

uint64_t sub_1B3791D9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static Google_Protobuf_Field.Kind.allCases.getter();
  *a1 = result;
  return result;
}

void sub_1B3791DC4(uint64_t *a1@<X0>, void *a2@<X8>)
{
}

uint64_t sub_1B3791DCC()
{
  return sub_1B3790ED8();
}

uint64_t sub_1B3791DD8()
{
  return sub_1B3791160();
}

void Google_Protobuf_Field.Cardinality.init()(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

void Google_Protobuf_Field.Cardinality.init(rawValue:)(void *a1@<X8>, uint64_t a2@<X0>)
{
  *a1 = a2;
  OUTLINED_FUNCTION_30_12((uint64_t)a1);
}

uint64_t Google_Protobuf_Field.Cardinality.rawValue.getter()
{
  return *(void *)v0;
}

void sub_1B3791E0C()
{
  qword_1E9CBB378 = (uint64_t)&unk_1F0BFE1E8;
}

uint64_t static Google_Protobuf_Field.Cardinality.allCases.getter()
{
  return sub_1B3791E44(&qword_1E9CB95E8);
}

uint64_t sub_1B3791E44(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B3791E94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static Google_Protobuf_Field.Cardinality.allCases.getter();
  *a1 = result;
  return result;
}

void sub_1B3791EBC(uint64_t *a1@<X0>, void *a2@<X8>)
{
}

uint64_t sub_1B3791EC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Google_Protobuf_Field.Cardinality.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1B3791EEC()
{
  return sub_1B3790F28();
}

uint64_t sub_1B3791EF8()
{
  return sub_1B3790FF8();
}

uint64_t sub_1B3791F04()
{
  return sub_1B37911AC();
}

BOOL sub_1B3791F24(uint64_t a1, uint64_t *a2)
{
  return sub_1B36D906C(*(void *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

double Google_Protobuf_Field.init()@<D0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = 1;
  *(_DWORD *)(a1 + 28) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0xE000000000000000;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0xE000000000000000;
  *(_DWORD *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 68) = 0;
  *(void *)(a1 + 72) = MEMORY[0x1E4FBC860];
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0xE000000000000000;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0xE000000000000000;
  double result = 0.0;
  *(_OWORD *)(a1 + 112) = xmmword_1B37A12E0;
  return result;
}

uint64_t Google_Protobuf_Enum.name.getter()
{
  return OUTLINED_FUNCTION_55();
}

uint64_t Google_Protobuf_Enum.name.setter()
{
  uint64_t result = OUTLINED_FUNCTION_115();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*Google_Protobuf_Enum.name.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Enum.enumvalue.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*Google_Protobuf_Enum.enumvalue.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Enum.options.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*Google_Protobuf_Enum.options.modify())(void)
{
  return nullsub_1;
}

void Google_Protobuf_Enum.sourceContext.getter(void *a1@<X8>)
{
  OUTLINED_FUNCTION_21_10(*(void *)(v1 + 80), *(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104), a1);
}

double sub_1B37920C8@<D0>(uint64_t a1@<X8>)
{
  Google_Protobuf_Enum.sourceContext.getter(v4);
  uint64_t v2 = v4[1];
  *(void *)a1 = v4[0];
  *(void *)(a1 + 8) = v2;
  double result = *(double *)&v5;
  *(_OWORD *)(a1 + 16) = v5;
  return result;
}

double sub_1B3792144(unint64_t *a1)
{
  unint64_t v1 = a1[1];
  uint64_t v2 = a1[2];
  unint64_t v3 = a1[3];
  v5.n128_u64[0] = *a1;
  v5.n128_u64[1] = v1;
  uint64_t v6 = v2;
  unint64_t v7 = v3;
  swift_bridgeObjectRetain();
  sub_1B36B9E20(v2, v3);
  *(void *)&double result = Google_Protobuf_Enum.sourceContext.setter(&v5).n128_u64[0];
  return result;
}

__n128 Google_Protobuf_Enum.sourceContext.setter(__n128 *a1)
{
  __n128 v5 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unint64_t v3 = a1[1].n128_u64[1];
  sub_1B36D5208(*(void *)(v1 + 80), *(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104));
  __n128 result = v5;
  *(__n128 *)(v1 + 80) = v5;
  *(void *)(v1 + 96) = v2;
  *(void *)(v1 + 104) = v3;
  return result;
}

void (*Google_Protobuf_Enum.sourceContext.modify(void *a1))()
{
  unint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  OUTLINED_FUNCTION_39_11();
  if (v4)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v10 = v6;
    uint64_t v12 = v7;
  }
  if (!v4) {
    unint64_t v9 = v8;
  }
  *unint64_t v3 = v11;
  v3[1] = v10;
  v3[2] = v12;
  v3[3] = v9;
  sub_1B36D51BC(v5, v6, v7, v8);
  return sub_1B379226C;
}

void sub_1B379226C()
{
  OUTLINED_FUNCTION_55_7();
  if (v6)
  {
    swift_bridgeObjectRetain();
    sub_1B36B9E20(v2, v1);
    OUTLINED_FUNCTION_145_0();
    v4[10] = v5;
    v4[11] = v3;
    v4[12] = v2;
    v4[13] = v1;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_107();
  }
  else
  {
    OUTLINED_FUNCTION_145_0();
    v4[10] = v5;
    v4[11] = v3;
    v4[12] = v2;
    v4[13] = v1;
  }
  free(v0);
}

BOOL Google_Protobuf_Enum.hasSourceContext.getter()
{
  return *(void *)(v0 + 88) != 0;
}

Swift::Void __swiftcall Google_Protobuf_Enum.clearSourceContext()()
{
  sub_1B36D5208(*(void *)(v0 + 80), *(void *)(v0 + 88), *(void *)(v0 + 96), *(void *)(v0 + 104));
  *(_OWORD *)(v0 + 80) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
}

void Google_Protobuf_Enum.syntax.getter(uint64_t a1@<X8>)
{
}

uint64_t Google_Protobuf_Enum.syntax.setter(uint64_t result)
{
  char v2 = *(unsigned char *)(result + 8);
  *(void *)(v1 + 32) = *(void *)result;
  *(unsigned char *)(v1 + 40) = v2;
  return result;
}

uint64_t (*Google_Protobuf_Enum.syntax.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Enum.edition.getter()
{
  return OUTLINED_FUNCTION_55();
}

uint64_t Google_Protobuf_Enum.edition.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*Google_Protobuf_Enum.edition.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Enum.unknownFields.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_46(*(void *)(v1 + 64), *(void *)(v1 + 72), a1);
}

uint64_t Google_Protobuf_Enum.unknownFields.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_1B36C2E10(*(void *)(v1 + 64), *(void *)(v1 + 72));
  *(void *)(v1 + 64) = v2;
  *(void *)(v1 + 72) = v3;
  return result;
}

uint64_t (*Google_Protobuf_Enum.unknownFields.modify())(void)
{
  return nullsub_1;
}

double Google_Protobuf_Enum.init()@<D0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  uint64_t v1 = MEMORY[0x1E4FBC860];
  *(void *)(a1 + 16) = MEMORY[0x1E4FBC860];
  *(void *)(a1 + 24) = v1;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0xE000000000000000;
  double result = 0.0;
  *(_OWORD *)(a1 + 64) = xmmword_1B37A12E0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  return result;
}

uint64_t Google_Protobuf_EnumValue.name.getter()
{
  return OUTLINED_FUNCTION_55();
}

uint64_t Google_Protobuf_EnumValue.name.setter()
{
  uint64_t result = OUTLINED_FUNCTION_115();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*Google_Protobuf_EnumValue.name.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_EnumValue.number.getter()
{
  return *(unsigned int *)(v0 + 16);
}

uint64_t Google_Protobuf_EnumValue.number.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*Google_Protobuf_EnumValue.number.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_EnumValue.options.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*Google_Protobuf_EnumValue.options.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_EnumValue.unknownFields.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_46(*(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t Google_Protobuf_EnumValue.unknownFields.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_1B36C2E10(*(void *)(v1 + 32), *(void *)(v1 + 40));
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v3;
  return result;
}

uint64_t (*Google_Protobuf_EnumValue.unknownFields.modify())(void)
{
  return nullsub_1;
}

double Google_Protobuf_EnumValue.init()@<D0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = MEMORY[0x1E4FBC860];
  double result = 0.0;
  *(_OWORD *)(a1 + 32) = xmmword_1B37A12E0;
  return result;
}

uint64_t Google_Protobuf_Option.name.getter()
{
  return OUTLINED_FUNCTION_55();
}

uint64_t Google_Protobuf_Option.name.setter()
{
  uint64_t result = OUTLINED_FUNCTION_115();
  *uint64_t v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*Google_Protobuf_Option.name.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Option.value.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v4 = v1[4];
  unint64_t v3 = v1[5];
  uint64_t v5 = v1[6];
  if (v5)
  {
    *a1 = v4;
    a1[1] = v3;
    a1[2] = v5;
  }
  else
  {
    *(_OWORD *)a1 = xmmword_1B37A12E0;
    if (qword_1EB5937C0 != -1) {
      swift_once();
    }
    a1[2] = qword_1EB5951F0;
    swift_retain();
  }
  return sub_1B36DB4B0(v4, v3, v5);
}

double sub_1B3792734@<D0>(uint64_t a1@<X8>)
{
  Google_Protobuf_Option.value.getter((uint64_t *)&v4);
  uint64_t v2 = v5;
  double result = *(double *)&v4;
  *(_OWORD *)a1 = v4;
  *(void *)(a1 + 16) = v2;
  return result;
}

double sub_1B3792794(unint64_t *a1)
{
  unint64_t v1 = a1[1];
  unint64_t v2 = a1[2];
  v4.n128_u64[0] = *a1;
  v4.n128_u64[1] = v1;
  unint64_t v5 = v2;
  sub_1B36B9E20(v4.n128_i64[0], v1);
  swift_retain();
  *(void *)&double result = Google_Protobuf_Option.value.setter(&v4).n128_u64[0];
  return result;
}

__n128 Google_Protobuf_Option.value.setter(__n128 *a1)
{
  __n128 v4 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  sub_1B36DB4F0(*(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
  __n128 result = v4;
  *(__n128 *)(v1 + 32) = v4;
  *(void *)(v1 + 48) = v2;
  return result;
}

uint64_t (*Google_Protobuf_Option.value.modify(void *a1))(uint64_t *a1, char a2)
{
  a1[3] = v1;
  uint64_t v3 = v1[4];
  uint64_t v4 = v1[5];
  uint64_t v5 = v1[6];
  if (v5)
  {
    *a1 = v3;
    a1[1] = v4;
    a1[2] = v5;
  }
  else
  {
    *(_OWORD *)a1 = xmmword_1B37A12E0;
    if (qword_1EB5937C0 != -1) {
      swift_once();
    }
    a1[2] = qword_1EB5951F0;
    swift_retain();
  }
  uint64_t v6 = OUTLINED_FUNCTION_12_0();
  sub_1B36DB4B0(v6, v7, v5);
  return sub_1B37928E4;
}

uint64_t sub_1B37928E4(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  unint64_t v2 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = *(void *)(v5 + 32);
  unint64_t v7 = *(void *)(v5 + 40);
  uint64_t v8 = *(void *)(v5 + 48);
  if (a2)
  {
    sub_1B36B9E20(*a1, v2);
    swift_retain();
    sub_1B36DB4F0(v6, v7, v8);
    *(void *)(v5 + 32) = v3;
    *(void *)(v5 + 40) = v2;
    *(void *)(v5 + 48) = v4;
    sub_1B36C2E10(v3, v2);
    return swift_release();
  }
  else
  {
    uint64_t result = sub_1B36DB4F0(*(void *)(v5 + 32), *(void *)(v5 + 40), *(void *)(v5 + 48));
    *(void *)(v5 + 32) = v3;
    *(void *)(v5 + 40) = v2;
    *(void *)(v5 + 48) = v4;
  }
  return result;
}

BOOL Google_Protobuf_Option.hasValue.getter()
{
  return *(void *)(v0 + 48) != 0;
}

Swift::Void __swiftcall Google_Protobuf_Option.clearValue()()
{
  sub_1B36DB4F0(*(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48));
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 48) = 0;
}

uint64_t Google_Protobuf_Option.unknownFields.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_46(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t Google_Protobuf_Option.unknownFields.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_1B36C2E10(*(void *)(v1 + 16), *(void *)(v1 + 24));
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v3;
  return result;
}

uint64_t (*Google_Protobuf_Option.unknownFields.modify())(void)
{
  return nullsub_1;
}

double Google_Protobuf_Option.init()@<D0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = xmmword_1B37A12E0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 32) = 0;
  return result;
}

uint64_t sub_1B3792A5C()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BFEEC0, qword_1E9CBB380);
}

uint64_t static Google_Protobuf_Syntax._protobuf_nameMap.getter()
{
  if (qword_1E9CB95F0 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CBB380);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

unint64_t static Google_Protobuf_Type.protoMessageName.getter()
{
  return OUTLINED_FUNCTION_25_11();
}

uint64_t sub_1B3792B08()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BFDF40, qword_1E9CBB3A0);
}

uint64_t static Google_Protobuf_Type._protobuf_nameMap.getter()
{
  if (qword_1E9CB95F8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CBB3A0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t Google_Protobuf_Type.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = OUTLINED_FUNCTION_38(a1, a2);
  uint64_t result = v6(v7);
  if (!v3)
  {
    while ((v9 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 7:
          OUTLINED_FUNCTION_20_16();
          v26();
          break;
        case 2:
          uint64_t v10 = OUTLINED_FUNCTION_18_0();
          sub_1B3792CE0(v10, v11, v12, v13);
          break;
        case 3:
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 352))(v2 + 24, v5, v4);
          break;
        case 4:
          uint64_t v14 = OUTLINED_FUNCTION_18_0();
          sub_1B3792D5C(v14, v15, v16, v17);
          break;
        case 5:
          uint64_t v18 = OUTLINED_FUNCTION_18_0();
          sub_1B36D5C24(v18, v19, v20, v21);
          break;
        case 6:
          uint64_t v22 = OUTLINED_FUNCTION_18_0();
          sub_1B3792DD8(v22, v23, v24, v25);
          break;
        default:
          break;
      }
      uint64_t v27 = OUTLINED_FUNCTION_152();
      uint64_t result = v6(v27);
    }
  }
  return result;
}

uint64_t sub_1B3792CE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a2 + 16;
  uint64_t v7 = *(uint64_t (**)(uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a4 + 416);
  unint64_t v8 = sub_1B379327C();
  return v7(v6, &type metadata for Google_Protobuf_Field, v8, a3, a4);
}

uint64_t sub_1B3792D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a2 + 32;
  uint64_t v7 = *(uint64_t (**)(uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a4 + 416);
  unint64_t v8 = sub_1B36D916C();
  return v7(v6, &type metadata for Google_Protobuf_Option, v8, a3, a4);
}

uint64_t sub_1B3792DD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a2 + 40;
  uint64_t v7 = *(uint64_t (**)(uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a4 + 384);
  unint64_t v8 = sub_1B36D9260();
  return v7(v6, &type metadata for Google_Protobuf_Syntax, v8, a3, a4);
}

void sub_1B3792E54(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_23_10();
  if (v6)
  {
    sub_1B37A0E30();
    sub_1B37A0870();
  }
  uint64_t v7 = v4[2];
  uint64_t v38 = v7;
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    uint64_t v20 = v4;
    uint64_t v22 = v2;
    sub_1B37A0E30();
    uint64_t v23 = *(void *)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 16);
    uint64_t v12 = *(void *)(a1 + 24);
    uint64_t v13 = (char *)(v7 + 32);
    uint64_t v14 = *(void *)a1;
    uint64_t v15 = *(void *)(a1 + 8);
    uint64_t v21 = (void *)a1;
    uint64_t v16 = *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    do
    {
      memcpy(__dst, v13, sizeof(__dst));
      uint64_t v25 = v14;
      uint64_t v26 = v15;
      uint64_t v27 = v11;
      uint64_t v28 = v12;
      uint64_t v29 = v9;
      uint64_t v30 = v10;
      uint64_t v31 = v23;
      uint64_t v32 = v16;
      uint64_t v33 = v24;
      sub_1B3797E60((uint64_t)__dst);
      sub_1B3793BD4((uint64_t)&v25);
      if (v22) {
        MEMORY[0x1B3EB71D0](v22);
      }
      uint64_t v22 = 0;
      sub_1B3797EE4((uint64_t)__dst);
      uint64_t v14 = v25;
      uint64_t v15 = v26;
      uint64_t v11 = v27;
      uint64_t v12 = v28;
      uint64_t v9 = v29;
      uint64_t v10 = v30;
      uint64_t v16 = v32;
      v13 += 128;
      uint64_t v23 = v31;
      uint64_t v24 = v33;
      --v8;
    }
    while (v8);
    sub_1B36DB424((uint64_t)&v38);
    uint64_t v17 = v16;
    a1 = (uint64_t)v21;
    *uint64_t v21 = v14;
    v21[1] = v15;
    v21[2] = v11;
    v21[3] = v12;
    v21[4] = v9;
    v21[5] = v10;
    uint64_t v3 = 0;
    v21[6] = v23;
    v21[7] = v17;
    v21[8] = v24;
    uint64_t v4 = v20;
  }
  if (*(void *)(v4[3] + 16))
  {
    sub_1B37A0E30();
    sub_1B379C024();
  }
  uint64_t v18 = v4[4];
  if (!*(void *)(v18 + 16) || (sub_1B3722560(v18), !v3))
  {
    sub_1B36D621C((uint64_t)v4, (long long *)a1);
    if (!v3)
    {
      sub_1B377BDBC(v4 + 5, (uint64_t)v34);
      sub_1B377BDBC(v34, (uint64_t)v37);
      if (v37[0])
      {
        sub_1B37A0E30();
        sub_1B377BDBC(v34, (uint64_t)&v36);
        sub_1B37A0E30();
      }
      OUTLINED_FUNCTION_23_10();
      if (v19)
      {
        sub_1B37A0E30();
        sub_1B37A0870();
      }
      sub_1B36EF624(a1, v4[9], v4[10]);
    }
  }
}

uint64_t Google_Protobuf_Type.traverse<A>(visitor:)()
{
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_302();
  memcpy(__dst, v1, sizeof(__dst));
  OUTLINED_FUNCTION_49();
  if (!v4 || (OUTLINED_FUNCTION_9_20(), result = v5(), (uint64_t v3 = v2) == 0))
  {
    if (!*(void *)(__dst[2] + 16)
      || (v7 = *(uint64_t (**)(void))(v0 + 280), sub_1B379327C(), OUTLINED_FUNCTION_41(), result = v7(), (uint64_t v3 = v2) == 0))
    {
      if (!*(void *)(__dst[3] + 16) || (uint64_t v2 = v3, result = (*(uint64_t (**)(void))(v0 + 256))(), !v3))
      {
        if (!*(void *)(__dst[4] + 16)
          || (uint64_t v8 = *(uint64_t (**)(void))(v0 + 280), sub_1B36D916C(), OUTLINED_FUNCTION_41(), result = v8(), !v2))
        {
          OUTLINED_FUNCTION_9_4();
          uint64_t result = sub_1B36D62FC(v9, v10, v11, v12);
          if (!v2)
          {
            sub_1B377BDBC(&__dst[5], (uint64_t)v18);
            sub_1B377BDBC(v18, (uint64_t)&v19);
            if (v19)
            {
              sub_1B377BDBC(v18, (uint64_t)&v16);
              uint64_t v13 = *(void (**)(void))(v0 + 128);
              sub_1B36D9260();
              OUTLINED_FUNCTION_29_13();
              v13();
            }
            OUTLINED_FUNCTION_49();
            if (v14)
            {
              OUTLINED_FUNCTION_9_20();
              v15();
            }
            return OUTLINED_FUNCTION_28();
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_1B379327C()
{
  unint64_t result = qword_1E9CBB480;
  if (!qword_1E9CBB480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB480);
  }
  return result;
}

uint64_t static Google_Protobuf_Type.== infix(_:_:)(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_19_13(a1);
  uint64_t v4 = *(void *)(v3 + 32);
  uint64_t v59 = *(void *)(v3 + 40);
  unsigned int v58 = *(unsigned __int8 *)(v3 + 48);
  uint64_t v50 = *(void *)(v3 + 64);
  uint64_t v52 = *(void *)(v3 + 56);
  uint64_t v5 = *(void *)(v3 + 88);
  uint64_t v42 = *(void *)(v3 + 80);
  uint64_t v44 = *(void *)(v3 + 72);
  uint64_t v6 = *(void *)(v3 + 96);
  uint64_t v62 = *(void *)(v3 + 104);
  unint64_t v63 = *(void *)(v3 + 112);
  uint64_t v7 = *(void *)(v2 + 32);
  uint64_t v56 = *(void *)(v2 + 40);
  unsigned int v55 = *(unsigned __int8 *)(v2 + 48);
  uint64_t v46 = *(void *)(v2 + 64);
  uint64_t v48 = *(void *)(v2 + 56);
  uint64_t v8 = *(void *)(v2 + 88);
  uint64_t v40 = *(void *)(v2 + 80);
  uint64_t v41 = *(void *)(v2 + 72);
  uint64_t v9 = *(void *)(v2 + 96);
  BOOL v10 = v1 == *(void *)v2 && *(void *)(v3 + 8) == *(void *)(v2 + 8);
  uint64_t v60 = *(void *)(v2 + 104);
  unint64_t v61 = *(void *)(v2 + 112);
  if (!v10 && (sub_1B37A0D90() & 1) == 0) {
    return 0;
  }
  if ((sub_1B36CB08C() & 1) == 0) {
    return 0;
  }
  uint64_t v11 = (void *)OUTLINED_FUNCTION_12_0();
  if ((sub_1B36CB124(v11, v12) & 1) == 0) {
    return 0;
  }
  uint64_t v13 = sub_1B36C9F68(v4, v7);
  if ((v13 & 1) == 0) {
    return 0;
  }
  if (v6)
  {
    if (v9)
    {
      uint64_t v21 = v9;
      BOOL v22 = v5 == v8 && v6 == v9;
      if (v22 || (sub_1B37A0D90() & 1) != 0)
      {
        LOBYTE(v9) = v63;
        sub_1B36D51BC(v5, v6, v62, v63);
        uint64_t v23 = OUTLINED_FUNCTION_47_7();
        sub_1B36D51BC(v23, v24, v25, v26);
        sub_1B36D51BC(v8, v21, v60, v61);
        sub_1B36B9E20(v62, v63);
        sub_1B36B9E20(v60, v61);
        char v27 = MEMORY[0x1B3EB6700](v62, v63, v60, v61);
        sub_1B36C2E10(v60, v61);
        sub_1B36C2E10(v62, v63);
        sub_1B36D5208(v8, v21, v60, v61);
        swift_bridgeObjectRelease();
        sub_1B36C2E10(v62, v63);
        uint64_t v28 = OUTLINED_FUNCTION_47_7();
        sub_1B36D5208(v28, v29, v30, v31);
        if ((v27 & 1) == 0) {
          return 0;
        }
        goto LABEL_19;
      }
      unint64_t v36 = v63;
      sub_1B36D51BC(v5, v6, v62, v63);
      swift_bridgeObjectRetain();
      sub_1B36B9E20(v62, v63);
      swift_bridgeObjectRelease();
      sub_1B36C2E10(v62, v63);
      uint64_t v37 = v5;
      uint64_t v38 = v6;
      uint64_t v39 = v62;
LABEL_28:
      sub_1B36D5208(v37, v38, v39, v36);
      return 0;
    }
    swift_bridgeObjectRetain();
    sub_1B36B9E20(v62, v63);
    swift_bridgeObjectRetain();
    sub_1B36B9E20(v62, v63);
    swift_bridgeObjectRelease();
    sub_1B36C2E10(v62, v63);
LABEL_27:
    uint64_t v34 = v9;
    uint64_t v35 = v9;
    unint64_t v36 = v61;
    sub_1B36D51BC(v8, v35, v60, v61);
    sub_1B36D5208(v5, v6, v62, v63);
    uint64_t v37 = v8;
    uint64_t v38 = v34;
    uint64_t v39 = v60;
    goto LABEL_28;
  }
  if (v9) {
    goto LABEL_27;
  }
LABEL_19:
  if ((OUTLINED_FUNCTION_44_7(v13, v14, v15, v16, v17, v18, v19, v20, v40, v41, v42, v44, v46, v48, v50, v52, v54, v55, v56,
          v57,
          v58,
          v59) & 1) != 0)
  {
    BOOL v32 = v53 == v49 && v51 == v47;
    if (v32 || (sub_1B37A0D90() & 1) != 0)
    {
      sub_1B36B9E20(v45, v43);
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_63_1();
      OUTLINED_FUNCTION_99_1();
      OUTLINED_FUNCTION_107();
      return v9 & 1;
    }
  }
  return 0;
}

uint64_t Google_Protobuf_Type.hashValue.getter()
{
  memcpy(__dst, v0, sizeof(__dst));
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_39();
  sub_1B3792E54(v1);
  return OUTLINED_FUNCTION_29(v2, v3, v4, v5, v6, v7, v8, v9, v11, v12, v13, v14, v15, v16, v17, v18, v19);
}

unint64_t sub_1B3793664()
{
  return 0xD000000000000014;
}

uint64_t sub_1B379368C(uint64_t a1, uint64_t a2)
{
  return Google_Protobuf_Type.decodeMessage<A>(decoder:)(a1, a2);
}

uint64_t sub_1B37936A4()
{
  return Google_Protobuf_Type.traverse<A>(visitor:)();
}

uint64_t sub_1B37936C0()
{
  memcpy(__dst, v0, sizeof(__dst));
  return sub_1B379CA10();
}

double sub_1B3793700(__n128 *a1)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_1B36D6A34(a1);
}

uint64_t sub_1B3793744()
{
  memcpy(__dst, v0, sizeof(__dst));
  sub_1B37A0E20();
  long long v2 = v12;
  long long v3 = v13;
  long long v4 = v14;
  long long v5 = v15;
  uint64_t v6 = v16;
  sub_1B3792E54((uint64_t)&v2);
  long long v7 = v2;
  long long v8 = v3;
  long long v9 = v4;
  long long v10 = v5;
  uint64_t v11 = v6;
  return sub_1B37A0E80();
}

unint64_t static Google_Protobuf_Field.protoMessageName.getter()
{
  return OUTLINED_FUNCTION_127(21);
}

uint64_t sub_1B3793810()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BFE248, qword_1E9CBB3C0);
}

uint64_t static Google_Protobuf_Field._protobuf_nameMap.getter()
{
  if (qword_1E9CB9600 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CBB3C0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t Google_Protobuf_Field.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = OUTLINED_FUNCTION_38(a1, a2);
  uint64_t result = v6(v7);
  if (!v3)
  {
    while ((v9 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          uint64_t v10 = OUTLINED_FUNCTION_18_0();
          sub_1B3793A5C(v10, v11, v12, v13);
          break;
        case 2:
          uint64_t v14 = OUTLINED_FUNCTION_18_0();
          sub_1B3793ADC(v14, v15, v16, v17);
          break;
        case 3:
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 72))(v2 + 28, v5, v4);
          break;
        case 4:
        case 6:
        case 10:
        case 11:
          OUTLINED_FUNCTION_20_16();
          v22();
          break;
        case 7:
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 72))(v2 + 64, v5, v4);
          break;
        case 8:
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 312))(v2 + 68, v5, v4);
          break;
        case 9:
          uint64_t v18 = OUTLINED_FUNCTION_18_0();
          sub_1B3793B58(v18, v19, v20, v21);
          break;
        default:
          break;
      }
      uint64_t v23 = OUTLINED_FUNCTION_152();
      uint64_t result = v6(v23);
    }
  }
  return result;
}

uint64_t sub_1B3793A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(uint64_t (**)(uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a4 + 384);
  unint64_t v8 = sub_1B37961A0();
  return v7(a2, &type metadata for Google_Protobuf_Field.Kind, v8, a3, a4);
}

uint64_t sub_1B3793ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a2 + 16;
  uint64_t v7 = *(uint64_t (**)(uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a4 + 384);
  unint64_t v8 = sub_1B37961EC();
  return v7(v6, &type metadata for Google_Protobuf_Field.Cardinality, v8, a3, a4);
}

uint64_t sub_1B3793B58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a2 + 72;
  uint64_t v7 = *(uint64_t (**)(uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a4 + 416);
  unint64_t v8 = sub_1B36D916C();
  return v7(v6, &type metadata for Google_Protobuf_Option, v8, a3, a4);
}

void sub_1B3793BD4(uint64_t a1)
{
  uint64_t v3 = v1;
  if (*(void *)v3)
  {
    sub_1B37A0E30();
    sub_1B3790FF8();
  }
  sub_1B377BDBC((uint64_t *)(v3 + 16), (uint64_t)v10);
  sub_1B377BDBC(v10, (uint64_t)&v12);
  if (v12)
  {
    sub_1B37A0E30();
    sub_1B377BDBC(v10, (uint64_t)&v11);
    sub_1B37A0E30();
  }
  if (*(_DWORD *)(v3 + 28))
  {
    sub_1B37A0E30();
    sub_1B37A0E60();
  }
  OUTLINED_FUNCTION_164();
  if (v5)
  {
    sub_1B37A0E30();
    OUTLINED_FUNCTION_11_17();
  }
  OUTLINED_FUNCTION_164();
  if (v6)
  {
    sub_1B37A0E30();
    OUTLINED_FUNCTION_11_17();
  }
  if (*(_DWORD *)(v3 + 64))
  {
    sub_1B37A0E30();
    sub_1B37A0E60();
  }
  if (*(unsigned char *)(v3 + 68))
  {
    sub_1B37A0E30();
    sub_1B37A0E40();
  }
  uint64_t v7 = *(void *)(v3 + 72);
  if (!*(void *)(v7 + 16) || (sub_1B3722560(v7), !v2))
  {
    OUTLINED_FUNCTION_164();
    if (v8)
    {
      sub_1B37A0E30();
      OUTLINED_FUNCTION_11_17();
    }
    OUTLINED_FUNCTION_164();
    if (v9)
    {
      sub_1B37A0E30();
      OUTLINED_FUNCTION_11_17();
    }
    sub_1B36EF624(a1, *(void *)(v3 + 112), *(void *)(v3 + 120));
  }
}

uint64_t Google_Protobuf_Field.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v4;
  uint64_t v8 = a1;
  uint64_t v9 = *v3;
  uint64_t v10 = v3[2];
  char v11 = *((unsigned char *)v3 + 24);
  int v12 = *((_DWORD *)v3 + 7);
  uint64_t v36 = v3[4];
  unint64_t v34 = v3[5];
  int v32 = *((unsigned __int8 *)v3 + 68);
  int v33 = *((_DWORD *)v3 + 16);
  uint64_t v31 = v3[9];
  long long v30 = *((_OWORD *)v3 + 7);
  if (!v9
    || (char v13 = *((unsigned char *)v3 + 8),
        *(void *)&long long v35 = v9,
        BYTE8(v35) = v13,
        uint64_t v15 = *(uint64_t (**)(long long *, uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a3 + 128),
        unint64_t v16 = sub_1B37961A0(),
        uint64_t result = v15(&v35, 1, &type metadata for Google_Protobuf_Field.Kind, v16, a2, a3),
        uint64_t v8 = a1,
        !v4))
  {
    if (!v10
      || (*(void *)&long long v35 = v10,
          BYTE8(v35) = v11,
          uint64_t v18 = *(uint64_t (**)(void))(a3 + 128),
          sub_1B37961EC(),
          OUTLINED_FUNCTION_34_12(),
          uint64_t result = v18(),
          (uint64_t v5 = v4) == 0))
    {
      if (!v12 || (OUTLINED_FUNCTION_27_13(), result = v19(), (uint64_t v5 = v4) == 0))
      {
        uint64_t v20 = HIBYTE(v34) & 0xF;
        if ((v34 & 0x2000000000000000) == 0) {
          uint64_t v20 = v36 & 0xFFFFFFFFFFFFLL;
        }
        if (!v20 || (OUTLINED_FUNCTION_40_8(), OUTLINED_FUNCTION_7_21(), result = v21(), (uint64_t v5 = v4) == 0))
        {
          OUTLINED_FUNCTION_49();
          if (!v22 || (OUTLINED_FUNCTION_40_8(), OUTLINED_FUNCTION_7_21(), result = v23(), (uint64_t v5 = v4) == 0))
          {
            if (!v33 || (OUTLINED_FUNCTION_27_13(), result = v24(), (uint64_t v5 = v4) == 0))
            {
              if (!v32
                || (uint64_t v4 = v5,
                    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 104))(1, 8, a2, a3), !v5))
              {
                if (!*(void *)(v31 + 16)
                  || (uint64_t v25 = *(uint64_t (**)(void))(a3 + 280),
                      sub_1B36D916C(),
                      OUTLINED_FUNCTION_34_12(),
                      uint64_t result = v25(),
                      !v4))
                {
                  OUTLINED_FUNCTION_49();
                  if (!v26 || (OUTLINED_FUNCTION_40_8(), OUTLINED_FUNCTION_7_21(), uint64_t result = v27(), !v4))
                  {
                    OUTLINED_FUNCTION_49();
                    if (!v28 || (OUTLINED_FUNCTION_40_8(), OUTLINED_FUNCTION_7_21(), uint64_t result = v29(), !v4))
                    {
                      long long v35 = v30;
                      return UnknownStorage.traverse<A>(visitor:)(v8, a2, a3);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t static Google_Protobuf_Field.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 24);
  int v4 = *(_DWORD *)(a1 + 28);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v34 = *(void *)(a1 + 56);
  uint64_t v35 = *(void *)(a1 + 48);
  int v31 = *(_DWORD *)(a1 + 64);
  int v29 = *(unsigned __int8 *)(a1 + 68);
  uint64_t v27 = *(void *)(a1 + 72);
  uint64_t v24 = *(void *)(a1 + 88);
  uint64_t v25 = *(void *)(a1 + 80);
  uint64_t v20 = *(void *)(a1 + 104);
  uint64_t v21 = *(void *)(a1 + 96);
  unint64_t v16 = *(void *)(a1 + 120);
  uint64_t v17 = *(void *)(a1 + 112);
  uint64_t v7 = *(void *)(a2 + 16);
  int v8 = *(_DWORD *)(a2 + 28);
  uint64_t v9 = *(void *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 40);
  uint64_t v32 = *(void *)(a2 + 56);
  uint64_t v33 = *(void *)(a2 + 48);
  int v30 = *(_DWORD *)(a2 + 64);
  int v28 = *(unsigned __int8 *)(a2 + 68);
  uint64_t v26 = *(void *)(a2 + 72);
  uint64_t v22 = *(void *)(a2 + 88);
  uint64_t v23 = *(void *)(a2 + 80);
  uint64_t v18 = *(void *)(a2 + 104);
  uint64_t v19 = *(void *)(a2 + 96);
  if ((sub_1B36DB57C(*(void *)a1, *(unsigned __int8 *)(a1 + 8), *(void *)a2, *(unsigned __int8 *)(a2 + 8)) & 1) == 0
    || !sub_1B36D906C(v2, v3, v7)
    || v4 != v8)
  {
    return 0;
  }
  BOOL v11 = v5 == v9 && v6 == v10;
  if (!v11 && (sub_1B37A0D90() & 1) == 0) {
    return 0;
  }
  BOOL v12 = v35 == v33 && v34 == v32;
  if (!v12 && (sub_1B37A0D90() & 1) == 0) {
    return 0;
  }
  if (v31 != v30 || ((v29 ^ v28) & 1) != 0 || (sub_1B36C9F68(v27, v26) & 1) == 0) {
    return 0;
  }
  BOOL v13 = v25 == v23 && v24 == v22;
  if (!v13 && (sub_1B37A0D90() & 1) == 0) {
    return 0;
  }
  BOOL v14 = v21 == v19 && v20 == v18;
  if (!v14 && (sub_1B37A0D90() & 1) == 0) {
    return 0;
  }
  sub_1B36B9E20(v17, v16);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_63_1();
  OUTLINED_FUNCTION_99_1();
  OUTLINED_FUNCTION_107();
  return v9 & 1;
}

uint64_t Google_Protobuf_Field.hashValue.getter()
{
  memcpy(__dst, v0, sizeof(__dst));
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_39();
  sub_1B3793BD4(v1);
  return OUTLINED_FUNCTION_29(v2, v3, v4, v5, v6, v7, v8, v9, v11, v12, v13, v14, v15, v16, v17, v18, v19);
}

unint64_t sub_1B37942CC()
{
  return 0xD000000000000015;
}

uint64_t (*sub_1B37942F4())(void)
{
  return nullsub_1;
}

uint64_t sub_1B3794314(uint64_t a1, uint64_t a2)
{
  return Google_Protobuf_Field.decodeMessage<A>(decoder:)(a1, a2);
}

uint64_t sub_1B379432C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Google_Protobuf_Field.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_1B3794348()
{
  memcpy(v2, v0, sizeof(v2));
  return sub_1B379CA24();
}

double sub_1B3794388(__n128 *a1)
{
  memcpy(v4, v1, sizeof(v4));
  return sub_1B36D68CC(a1);
}

uint64_t sub_1B37943CC()
{
  memcpy(__dst, v0, sizeof(__dst));
  sub_1B37A0E20();
  long long v2 = v12;
  long long v3 = v13;
  long long v4 = v14;
  long long v5 = v15;
  uint64_t v6 = v16;
  sub_1B3793BD4((uint64_t)&v2);
  long long v7 = v2;
  long long v8 = v3;
  long long v9 = v4;
  long long v10 = v5;
  uint64_t v11 = v6;
  return sub_1B37A0E80();
}

uint64_t sub_1B3794480()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BFE498, qword_1E9CBB3E0);
}

uint64_t static Google_Protobuf_Field.Kind._protobuf_nameMap.getter()
{
  if (qword_1E9CB9608 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CBB3E0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B3794520()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BFE0E8, qword_1E9CBB400);
}

uint64_t static Google_Protobuf_Field.Cardinality._protobuf_nameMap.getter()
{
  if (qword_1E9CB9610 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CBB400);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

unint64_t static Google_Protobuf_Enum.protoMessageName.getter()
{
  return OUTLINED_FUNCTION_25_11();
}

uint64_t sub_1B37945CC()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BFDDD0, qword_1E9CBB420);
}

uint64_t static Google_Protobuf_Enum._protobuf_nameMap.getter()
{
  if (qword_1E9CB9618 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CBB420);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t Google_Protobuf_Enum.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = OUTLINED_FUNCTION_45(a1, a2);
  uint64_t result = v6(v7);
  if (!v3)
  {
    while ((v9 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 336))(v2, v5, v4);
          break;
        case 2:
          uint64_t v10 = OUTLINED_FUNCTION_18_0();
          sub_1B3794774(v10, v11, v12, v13);
          break;
        case 3:
          uint64_t v14 = OUTLINED_FUNCTION_18_0();
          sub_1B37947F0(v14, v15, v16, v17);
          break;
        case 4:
          uint64_t v18 = OUTLINED_FUNCTION_18_0();
          sub_1B379486C(v18, v19, v20, v21);
          break;
        case 5:
          uint64_t v22 = OUTLINED_FUNCTION_18_0();
          sub_1B37948E8(v22, v23, v24, v25);
          break;
        case 6:
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 336))(v2 + 48, v5, v4);
          break;
        default:
          break;
      }
      uint64_t v26 = OUTLINED_FUNCTION_144();
      uint64_t result = v6(v26);
    }
  }
  return result;
}

uint64_t sub_1B3794774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a2 + 16;
  uint64_t v7 = *(uint64_t (**)(uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a4 + 416);
  unint64_t v8 = sub_1B3796238();
  return v7(v6, &type metadata for Google_Protobuf_EnumValue, v8, a3, a4);
}

uint64_t sub_1B37947F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a2 + 24;
  uint64_t v7 = *(uint64_t (**)(uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a4 + 416);
  unint64_t v8 = sub_1B36D916C();
  return v7(v6, &type metadata for Google_Protobuf_Option, v8, a3, a4);
}

uint64_t sub_1B379486C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a2 + 80;
  uint64_t v7 = *(uint64_t (**)(uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a4 + 408);
  unint64_t v8 = sub_1B36DB530();
  return v7(v6, &type metadata for Google_Protobuf_SourceContext, v8, a3, a4);
}

uint64_t sub_1B37948E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a2 + 32;
  uint64_t v7 = *(uint64_t (**)(uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a4 + 384);
  unint64_t v8 = sub_1B36D9260();
  return v7(v6, &type metadata for Google_Protobuf_Syntax, v8, a3, a4);
}

void sub_1B3794964(long long *a1)
{
  uint64_t v3 = v1;
  OUTLINED_FUNCTION_164();
  if (v5)
  {
    sub_1B37A0E30();
    OUTLINED_FUNCTION_11_17();
  }
  if (!*(void *)(v3[2] + 16) || (sub_1B37227B8(), !v2))
  {
    uint64_t v6 = v3[3];
    if (!*(void *)(v6 + 16) || (sub_1B3722560(v6), !v2))
    {
      sub_1B3794C24((uint64_t)v3, a1);
      if (!v2)
      {
        sub_1B377BDBC(v3 + 4, (uint64_t)v8);
        sub_1B377BDBC(v8, (uint64_t)&v10);
        if (v10)
        {
          sub_1B37A0E30();
          sub_1B377BDBC(v8, (uint64_t)&v9);
          sub_1B37A0E30();
        }
        OUTLINED_FUNCTION_164();
        if (v7)
        {
          sub_1B37A0E30();
          OUTLINED_FUNCTION_11_17();
        }
        sub_1B36EF624((uint64_t)a1, v3[8], v3[9]);
      }
    }
  }
}

uint64_t Google_Protobuf_Enum.traverse<A>(visitor:)()
{
  OUTLINED_FUNCTION_302();
  memcpy(__dst, v1, sizeof(__dst));
  OUTLINED_FUNCTION_49();
  if (!v3 || (OUTLINED_FUNCTION_9_20(), uint64_t result = v4(), !v2))
  {
    if (!*(void *)(*(void *)&__dst[1] + 16)
      || (uint64_t v6 = *(uint64_t (**)(void))(v0 + 280), sub_1B3796238(), OUTLINED_FUNCTION_41(), result = v6(), !v2))
    {
      if (!*(void *)(*((void *)&__dst[1] + 1) + 16)
        || (uint64_t v7 = *(uint64_t (**)(void))(v0 + 280), sub_1B36D916C(), OUTLINED_FUNCTION_41(), result = v7(), !v2))
      {
        OUTLINED_FUNCTION_9_4();
        uint64_t result = sub_1B3794D04(v8, v9, v10, v11);
        if (!v2)
        {
          sub_1B377BDBC((uint64_t *)&__dst[2], (uint64_t)v17);
          sub_1B377BDBC(v17, (uint64_t)&v18);
          if (v18)
          {
            sub_1B377BDBC(v17, (uint64_t)&v15);
            uint64_t v12 = *(void (**)(void))(v0 + 128);
            sub_1B36D9260();
            OUTLINED_FUNCTION_29_13();
            v12();
          }
          OUTLINED_FUNCTION_49();
          if (v13)
          {
            OUTLINED_FUNCTION_9_20();
            v14();
          }
          return OUTLINED_FUNCTION_28();
        }
      }
    }
  }
  return result;
}

uint64_t sub_1B3794C24(uint64_t a1, long long *a2)
{
  sub_1B36DB450(a1 + 80, (uint64_t)v20, &qword_1E9CB9768);
  uint64_t result = sub_1B36DB450((uint64_t)v20, (uint64_t)&v21, &qword_1E9CB9768);
  unint64_t v5 = v22;
  if (v22)
  {
    uint64_t v6 = v21;
    uint64_t v7 = v23;
    unint64_t v8 = v24;
    sub_1B37A0E30();
    uint64_t v9 = *((void *)a2 + 8);
    long long v10 = a2[1];
    long long v15 = *a2;
    long long v16 = v10;
    long long v11 = a2[3];
    long long v17 = a2[2];
    long long v18 = v11;
    uint64_t v19 = v9;
    uint64_t result = sub_1B377796C((uint64_t)&v15, v6, v5, v7, v8);
    if (v2) {
      uint64_t result = MEMORY[0x1B3EB71D0](v2);
    }
    uint64_t v12 = v19;
    long long v13 = v16;
    *a2 = v15;
    a2[1] = v13;
    long long v14 = v18;
    a2[2] = v17;
    a2[3] = v14;
    *((void *)a2 + 8) = v12;
  }
  return result;
}

uint64_t sub_1B3794D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1B36DB450(a1 + 80, (uint64_t)v10, &qword_1E9CB9768);
  uint64_t result = sub_1B36DB450((uint64_t)v10, (uint64_t)v11, &qword_1E9CB9768);
  if (*((void *)&v11[0] + 1))
  {
    v9[0] = v11[0];
    v9[1] = v11[1];
    uint64_t v7 = *(uint64_t (**)(_OWORD *, uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a4 + 136);
    unint64_t v8 = sub_1B36DB530();
    return v7(v9, 4, &type metadata for Google_Protobuf_SourceContext, v8, a3, a4);
  }
  return result;
}

uint64_t static Google_Protobuf_Enum.== infix(_:_:)(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_19_13(a1);
  uint64_t v4 = *(void *)(v3 + 24);
  unsigned int v63 = *(unsigned __int8 *)(v3 + 40);
  uint64_t v57 = *(void *)(v3 + 48);
  uint64_t v55 = *(void *)(v3 + 56);
  uint64_t v49 = *(void *)(v3 + 64);
  uint64_t v5 = *(void *)(v3 + 80);
  uint64_t v47 = *(void *)(v3 + 72);
  uint64_t v6 = *(void *)(v3 + 88);
  uint64_t v64 = *(void *)(v3 + 32);
  uint64_t v65 = *(void *)(v3 + 96);
  unint64_t v66 = *(void *)(v3 + 104);
  uint64_t v7 = *(void *)(v2 + 24);
  uint64_t v61 = *(void *)(v2 + 32);
  unsigned int v60 = *(unsigned __int8 *)(v2 + 40);
  uint64_t v51 = *(void *)(v2 + 56);
  uint64_t v53 = *(void *)(v2 + 48);
  uint64_t v8 = *(void *)(v2 + 80);
  uint64_t v45 = *(void *)(v2 + 72);
  uint64_t v46 = *(void *)(v2 + 64);
  uint64_t v10 = *(void *)(v2 + 88);
  uint64_t v9 = *(void *)(v2 + 96);
  BOOL v11 = v1 == *(void *)v2 && *(void *)(v3 + 8) == *(void *)(v2 + 8);
  unint64_t v12 = *(void *)(v2 + 104);
  if (!v11 && (sub_1B37A0D90() & 1) == 0) {
    return 0;
  }
  if ((sub_1B36CB1F4() & 1) == 0) {
    return 0;
  }
  uint64_t v13 = sub_1B36C9F68(v4, v7);
  if ((v13 & 1) == 0) {
    return 0;
  }
  if (v6)
  {
    if (v10)
    {
      BOOL v21 = v5 == v8 && v6 == v10;
      if (v21 || (OUTLINED_FUNCTION_50_7(), (sub_1B37A0D90() & 1) != 0))
      {
        uint64_t v22 = OUTLINED_FUNCTION_50_7();
        sub_1B36D51BC(v22, v23, v65, v66);
        uint64_t v24 = OUTLINED_FUNCTION_51_7();
        sub_1B36D51BC(v24, v25, v26, v27);
        uint64_t v28 = OUTLINED_FUNCTION_46_8();
        uint64_t v29 = v9;
        sub_1B36D51BC(v28, v30, v9, v12);
        sub_1B36B9E20(v65, v66);
        sub_1B36B9E20(v9, v12);
        LOBYTE(v9) = MEMORY[0x1B3EB6700](v65, v66, v9, v12);
        sub_1B36C2E10(v29, v12);
        sub_1B36C2E10(v65, v66);
        uint64_t v31 = OUTLINED_FUNCTION_46_8();
        sub_1B36D5208(v31, v32, v29, v12);
        swift_bridgeObjectRelease();
        sub_1B36C2E10(v65, v66);
        uint64_t v33 = OUTLINED_FUNCTION_51_7();
        sub_1B36D5208(v33, v34, v35, v36);
        if ((v9 & 1) == 0) {
          return 0;
        }
        goto LABEL_18;
      }
      uint64_t v43 = OUTLINED_FUNCTION_50_7();
      uint64_t v9 = v65;
      unint64_t v12 = v66;
      sub_1B36D51BC(v43, v44, v65, v66);
      swift_bridgeObjectRetain();
      sub_1B36B9E20(v65, v66);
      swift_bridgeObjectRelease();
      sub_1B36C2E10(v65, v66);
      uint64_t v41 = OUTLINED_FUNCTION_50_7();
LABEL_27:
      sub_1B36D5208(v41, v42, v9, v12);
      return 0;
    }
    swift_bridgeObjectRetain();
    sub_1B36B9E20(v65, v66);
    swift_bridgeObjectRetain();
    sub_1B36B9E20(v65, v66);
    swift_bridgeObjectRelease();
    sub_1B36C2E10(v65, v66);
LABEL_26:
    uint64_t v39 = OUTLINED_FUNCTION_46_8();
    sub_1B36D51BC(v39, v40, v9, v12);
    sub_1B36D5208(v5, v6, v65, v66);
    uint64_t v41 = OUTLINED_FUNCTION_46_8();
    goto LABEL_27;
  }
  if (v10) {
    goto LABEL_26;
  }
LABEL_18:
  if ((OUTLINED_FUNCTION_44_7(v13, v14, v15, v16, v17, v18, v19, v20, v45, v46, v47, v49, v51, v53, v55, v57, v59, v60, v61,
          v62,
          v63,
          v64) & 1) != 0)
  {
    BOOL v37 = v58 == v54 && v56 == v52;
    if (v37 || (sub_1B37A0D90() & 1) != 0)
    {
      sub_1B36B9E20(v50, v48);
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_63_1();
      OUTLINED_FUNCTION_99_1();
      OUTLINED_FUNCTION_107();
      return v9 & 1;
    }
  }
  return 0;
}

uint64_t Google_Protobuf_Enum.hashValue.getter()
{
  memcpy(__dst, v0, sizeof(__dst));
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_39();
  sub_1B3794964(v1);
  return OUTLINED_FUNCTION_29(v2, v3, v4, v5, v6, v7, v8, v9, v11, v12, v13, v14, v15, v16, v17, v18, v19);
}

unint64_t sub_1B3795130()
{
  return 0xD000000000000014;
}

uint64_t (*sub_1B3795158())(void)
{
  return nullsub_1;
}

uint64_t sub_1B3795178(uint64_t a1, uint64_t a2)
{
  return Google_Protobuf_Enum.decodeMessage<A>(decoder:)(a1, a2);
}

uint64_t sub_1B3795190()
{
  return Google_Protobuf_Enum.traverse<A>(visitor:)();
}

uint64_t sub_1B37951AC()
{
  memcpy(v2, v0, sizeof(v2));
  return sub_1B379CA5C();
}

double sub_1B37951EC(__n128 *a1)
{
  memcpy(v4, v1, sizeof(v4));
  return sub_1B36D6A64(a1);
}

uint64_t sub_1B3795230()
{
  memcpy(__dst, v0, sizeof(__dst));
  sub_1B37A0E20();
  long long v2 = v12;
  long long v3 = v13;
  long long v4 = v14;
  long long v5 = v15;
  uint64_t v6 = v16;
  sub_1B3794964(&v2);
  long long v7 = v2;
  long long v8 = v3;
  long long v9 = v4;
  long long v10 = v5;
  uint64_t v11 = v6;
  return sub_1B37A0E80();
}

unint64_t static Google_Protobuf_EnumValue.protoMessageName.getter()
{
  return OUTLINED_FUNCTION_127(25);
}

uint64_t sub_1B37952FC()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BF8CB0, qword_1E9CBB440);
}

uint64_t static Google_Protobuf_EnumValue._protobuf_nameMap.getter()
{
  if (qword_1E9CB9620 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CBB440);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t Google_Protobuf_EnumValue.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = OUTLINED_FUNCTION_45(a1, a2);
  uint64_t result = v6(v7);
  if (!v3)
  {
    while ((v9 & 1) == 0)
    {
      switch(result)
      {
        case 3:
          uint64_t v11 = OUTLINED_FUNCTION_18_0();
          sub_1B37947F0(v11, v12, v13, v14);
          break;
        case 2:
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 72))(v2 + 16, v5, v4);
          break;
        case 1:
          OUTLINED_FUNCTION_20_16();
          v10();
          break;
      }
      uint64_t v15 = OUTLINED_FUNCTION_144();
      uint64_t result = v6(v15);
    }
  }
  return result;
}

uint64_t sub_1B3795460()
{
  OUTLINED_FUNCTION_164();
  if (v2)
  {
    sub_1B37A0E30();
    OUTLINED_FUNCTION_11_17();
  }
  if (*(_DWORD *)(v0 + 16))
  {
    sub_1B37A0E30();
    sub_1B37A0E60();
  }
  uint64_t result = *(void *)(v0 + 24);
  if (!*(void *)(result + 16) || (uint64_t result = sub_1B3722560(result), !v1))
  {
    uint64_t v4 = *(void *)(v0 + 32);
    unint64_t v5 = *(void *)(v0 + 40);
    switch(v5 >> 62)
    {
      case 1uLL:
        uint64_t v6 = (int)v4;
        uint64_t v7 = v4 >> 32;
        goto LABEL_12;
      case 2uLL:
        uint64_t v6 = *(void *)(v4 + 16);
        uint64_t v7 = *(void *)(v4 + 24);
LABEL_12:
        if (v6 != v7) {
          goto LABEL_13;
        }
        return result;
      case 3uLL:
        return result;
      default:
        if ((v5 & 0xFF000000000000) == 0) {
          return result;
        }
LABEL_13:
        uint64_t result = sub_1B37A0610();
        break;
    }
  }
  return result;
}

uint64_t Google_Protobuf_EnumValue.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(unsigned int *)(v3 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  OUTLINED_FUNCTION_49();
  if (!v10 || (uint64_t result = (*(uint64_t (**)(void))(a3 + 112))(), !v4))
  {
    if (!v8
      || (uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 24))(v8, 2, a2, a3), !v4))
    {
      if (!*(void *)(v9 + 16)) {
        return UnknownStorage.traverse<A>(visitor:)(a1, a2, a3);
      }
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a3 + 280);
      unint64_t v13 = sub_1B36D916C();
      uint64_t result = v12(v9, 3, &type metadata for Google_Protobuf_Option, v13, a2, a3);
      if (!v4) {
        return UnknownStorage.traverse<A>(visitor:)(a1, a2, a3);
      }
    }
  }
  return result;
}

uint64_t static Google_Protobuf_EnumValue.== infix(_:_:)(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_19_13(a1);
  int v4 = *(_DWORD *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  int v6 = *(_DWORD *)(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  BOOL v8 = v1 == *(void *)v2 && *(void *)(v3 + 8) == *(void *)(v2 + 8);
  if (!v8 && (sub_1B37A0D90() & 1) == 0 || v4 != v6 || (sub_1B36C9F68(v5, v7) & 1) == 0) {
    return 0;
  }
  uint64_t v9 = OUTLINED_FUNCTION_55();
  sub_1B36B9E20(v9, v10);
  uint64_t v11 = OUTLINED_FUNCTION_12_0();
  sub_1B36B9E20(v11, v12);
  uint64_t v13 = OUTLINED_FUNCTION_55();
  char v14 = MEMORY[0x1B3EB6700](v13);
  uint64_t v15 = OUTLINED_FUNCTION_12_0();
  sub_1B36C2E10(v15, v16);
  uint64_t v17 = OUTLINED_FUNCTION_55();
  sub_1B36C2E10(v17, v18);
  return v14 & 1;
}

uint64_t Google_Protobuf_EnumValue.hashValue.getter()
{
  OUTLINED_FUNCTION_220();
  sub_1B37A0E20();
  OUTLINED_FUNCTION_39();
  uint64_t v0 = sub_1B3795460();
  return OUTLINED_FUNCTION_29(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10, v11, v12, v13, v14, v15, v16, v17);
}

unint64_t sub_1B37957C0()
{
  return 0xD000000000000019;
}

uint64_t sub_1B37957E8(uint64_t a1, uint64_t a2)
{
  return Google_Protobuf_EnumValue.decodeMessage<A>(decoder:)(a1, a2);
}

uint64_t sub_1B3795800(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Google_Protobuf_EnumValue.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_1B379581C()
{
  return sub_1B379CA94();
}

double sub_1B379585C(__n128 *a1)
{
  return sub_1B36D6AA8(a1);
}

uint64_t sub_1B3795898()
{
  return sub_1B37A0E80();
}

unint64_t static Google_Protobuf_Option.protoMessageName.getter()
{
  return OUTLINED_FUNCTION_127(22);
}

uint64_t sub_1B3795954()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BFEDD8, qword_1E9CBB460);
}

uint64_t static Google_Protobuf_Option._protobuf_nameMap.getter()
{
  if (qword_1E9CB9628 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CBB460);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t Google_Protobuf_Option.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 16);
  uint64_t result = v7(a2, a3);
  if (!v4)
  {
    while ((v9 & 1) == 0)
    {
      if (result == 2)
      {
        uint64_t v10 = OUTLINED_FUNCTION_18_0();
        sub_1B3795AB8(v10, v11, v12, v13);
      }
      else if (result == 1)
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 336))(v3, a2, a3);
      }
      uint64_t result = v7(a2, a3);
    }
  }
  return result;
}

uint64_t sub_1B3795AB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a2 + 32;
  uint64_t v7 = *(uint64_t (**)(uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a4 + 408);
  unint64_t v8 = sub_1B36C54B0();
  return v7(v6, &type metadata for Google_Protobuf_Any, v8, a3, a4);
}

uint64_t sub_1B3795B34()
{
  OUTLINED_FUNCTION_23_10();
  if (v1)
  {
    sub_1B37A0E30();
    sub_1B37A0870();
  }
  sub_1B36DB450(v0 + 32, (uint64_t)v7, &qword_1E9CBB5A0);
  uint64_t result = sub_1B36DB450((uint64_t)v7, (uint64_t)v8, &qword_1E9CBB5A0);
  if (v9)
  {
    sub_1B37A0E30();
    uint64_t result = sub_1B36C866C();
  }
  uint64_t v3 = *(void *)(v0 + 16);
  unint64_t v4 = *(void *)(v0 + 24);
  switch(v4 >> 62)
  {
    case 1uLL:
      uint64_t v5 = (int)v3;
      uint64_t v6 = v3 >> 32;
      goto LABEL_10;
    case 2uLL:
      uint64_t v5 = *(void *)(v3 + 16);
      uint64_t v6 = *(void *)(v3 + 24);
LABEL_10:
      if (v5 != v6) {
        return sub_1B37A0610();
      }
      return result;
    case 3uLL:
      return result;
    default:
      if ((v4 & 0xFF000000000000) == 0) {
        return result;
      }
      return sub_1B37A0610();
  }
}

uint64_t Google_Protobuf_Option.traverse<A>(visitor:)()
{
  OUTLINED_FUNCTION_302();
  long long v5 = *(_OWORD *)(v1 + 16);
  v8[0] = *(_OWORD *)v1;
  v8[1] = v5;
  uint64_t v8[2] = *(_OWORD *)(v1 + 32);
  uint64_t v9 = *(void *)(v1 + 48);
  OUTLINED_FUNCTION_49();
  if (!v6 || (uint64_t result = (*(uint64_t (**)(void))(v0 + 112))(), !v2))
  {
    uint64_t result = sub_1B3795CFC((uint64_t)v8, v4, v3, v0);
    if (!v2) {
      return UnknownStorage.traverse<A>(visitor:)(v4, v3, v0);
    }
  }
  return result;
}

uint64_t sub_1B3795CFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1B36DB450(a1 + 32, (uint64_t)v11, &qword_1E9CBB5A0);
  uint64_t result = sub_1B36DB450((uint64_t)v11, (uint64_t)&v12, &qword_1E9CBB5A0);
  if (v13)
  {
    long long v9 = v12;
    uint64_t v10 = v13;
    uint64_t v7 = *(uint64_t (**)(long long *, uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a4 + 136);
    unint64_t v8 = sub_1B36C54B0();
    return v7(&v9, 2, &type metadata for Google_Protobuf_Any, v8, a3, a4);
  }
  return result;
}

uint64_t static Google_Protobuf_Option.== infix(_:_:)(uint64_t a1)
{
  uint64_t v1 = OUTLINED_FUNCTION_19_13(a1);
  uint64_t v4 = v3[2];
  unint64_t v6 = v3[3];
  uint64_t v5 = v3[4];
  unint64_t v7 = v3[5];
  uint64_t v8 = v3[6];
  uint64_t v9 = v2[2];
  unint64_t v10 = v2[3];
  uint64_t v12 = v2[4];
  unint64_t v11 = v2[5];
  uint64_t v13 = (void *)v2[6];
  BOOL v14 = v1 == *v2 && v3[1] == v2[1];
  if (!v14 && (sub_1B37A0D90() & 1) == 0) {
    return 0;
  }
  if (!v8)
  {
    if (!v13) {
      goto LABEL_19;
    }
LABEL_14:
    sub_1B36DB4B0(v12, v11, (uint64_t)v13);
    sub_1B36DB4F0(v5, v7, v8);
    uint64_t v15 = v12;
    unint64_t v16 = v11;
    uint64_t v17 = (uint64_t)v13;
    goto LABEL_15;
  }
  if (!v13)
  {
    sub_1B36B9E20(v5, v7);
    swift_retain();
    sub_1B36B9E20(v5, v7);
    swift_retain();
    OUTLINED_FUNCTION_53_4();
    swift_release();
    goto LABEL_14;
  }
  sub_1B36DB4B0(v5, v7, v8);
  sub_1B36B9E20(v5, v7);
  if ((void *)v8 == v13)
  {
    swift_retain();
  }
  else
  {
    swift_retain();
    if ((sub_1B36C5780(v13) & 1) == 0)
    {
      OUTLINED_FUNCTION_53_4();
      swift_release();
      uint64_t v15 = v5;
      unint64_t v16 = v7;
      uint64_t v17 = v8;
LABEL_15:
      sub_1B36DB4F0(v15, v16, v17);
      return 0;
    }
  }
  sub_1B36B9E20(v5, v7);
  sub_1B36B9E20(v12, v11);
  char v19 = MEMORY[0x1B3EB6700](v5, v7, v12, v11);
  sub_1B36C2E10(v12, v11);
  OUTLINED_FUNCTION_53_4();
  OUTLINED_FUNCTION_53_4();
  swift_release();
  sub_1B36DB4F0(v5, v7, v8);
  if ((v19 & 1) == 0) {
    return 0;
  }
LABEL_19:
  OUTLINED_FUNCTION_13_0();
  sub_1B36B9E20(v9, v10);
  char v20 = MEMORY[0x1B3EB6700](v4, v6, v9, v10);
  sub_1B36C2E10(v9, v10);
  sub_1B36C2E10(v4, v6);
  return v20 & 1;
}

uint64_t Google_Protobuf_Option.hashValue.getter()
{
  OUTLINED_FUNCTION_220();
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_39();
  uint64_t v0 = sub_1B3795B34();
  return OUTLINED_FUNCTION_29(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10, v11, v12, v13, v14, v15, v16, v17);
}

unint64_t sub_1B379600C()
{
  return 0xD000000000000016;
}

uint64_t sub_1B3796034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Google_Protobuf_Option.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_1B379604C()
{
  return Google_Protobuf_Option.traverse<A>(visitor:)();
}

uint64_t sub_1B3796068()
{
  return sub_1B379CAA8();
}

double sub_1B37960B0(__n128 *a1)
{
  return sub_1B36D682C(a1);
}

uint64_t sub_1B37960F4()
{
  return sub_1B37A0E80();
}

unint64_t sub_1B37961A0()
{
  unint64_t result = qword_1E9CBB488;
  if (!qword_1E9CBB488)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB488);
  }
  return result;
}

unint64_t sub_1B37961EC()
{
  unint64_t result = qword_1E9CBB490;
  if (!qword_1E9CBB490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB490);
  }
  return result;
}

unint64_t sub_1B3796238()
{
  unint64_t result = qword_1E9CBB498;
  if (!qword_1E9CBB498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB498);
  }
  return result;
}

uint64_t sub_1B3796284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B3796C60(a1, a2, a3, (uint64_t (*)(void))sub_1B37962B0, (uint64_t (*)(void))sub_1B37962FC);
}

unint64_t sub_1B37962B0()
{
  unint64_t result = qword_1E9CBB4A0;
  if (!qword_1E9CBB4A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB4A0);
  }
  return result;
}

unint64_t sub_1B37962FC()
{
  unint64_t result = qword_1E9CBB4A8;
  if (!qword_1E9CBB4A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB4A8);
  }
  return result;
}

uint64_t sub_1B3796348()
{
  return sub_1B37293B0(&qword_1E9CBB4B0, &qword_1E9CBB4B8);
}

unint64_t sub_1B3796374()
{
  unint64_t result = qword_1E9CBB4C0;
  if (!qword_1E9CBB4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB4C0);
  }
  return result;
}

uint64_t sub_1B37963C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B3796C60(a1, a2, a3, (uint64_t (*)(void))sub_1B37963EC, (uint64_t (*)(void))sub_1B3796438);
}

unint64_t sub_1B37963EC()
{
  unint64_t result = qword_1E9CBB4C8;
  if (!qword_1E9CBB4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB4C8);
  }
  return result;
}

unint64_t sub_1B3796438()
{
  unint64_t result = qword_1E9CBB4D0;
  if (!qword_1E9CBB4D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB4D0);
  }
  return result;
}

uint64_t sub_1B3796484()
{
  return sub_1B37293B0(&qword_1E9CBB4D8, &qword_1E9CBB4E0);
}

unint64_t sub_1B37964B0()
{
  unint64_t result = qword_1E9CBB4E8;
  if (!qword_1E9CBB4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB4E8);
  }
  return result;
}

uint64_t sub_1B37964FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B3796C60(a1, a2, a3, (uint64_t (*)(void))sub_1B3796528, (uint64_t (*)(void))sub_1B3796574);
}

unint64_t sub_1B3796528()
{
  unint64_t result = qword_1E9CBB4F0;
  if (!qword_1E9CBB4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB4F0);
  }
  return result;
}

unint64_t sub_1B3796574()
{
  unint64_t result = qword_1E9CBB4F8;
  if (!qword_1E9CBB4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB4F8);
  }
  return result;
}

uint64_t sub_1B37965C0()
{
  return sub_1B37293B0(&qword_1E9CBB500, &qword_1E9CBB508);
}

unint64_t sub_1B37965EC()
{
  unint64_t result = qword_1E9CBB510;
  if (!qword_1E9CBB510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB510);
  }
  return result;
}

unint64_t sub_1B3796638(uint64_t a1)
{
  unint64_t result = sub_1B3796660();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B3796660()
{
  unint64_t result = qword_1E9CBB518;
  if (!qword_1E9CBB518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB518);
  }
  return result;
}

uint64_t sub_1B37966AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B3796C60(a1, a2, a3, (uint64_t (*)(void))sub_1B37966D8, (uint64_t (*)(void))sub_1B3796724);
}

unint64_t sub_1B37966D8()
{
  unint64_t result = qword_1E9CBB520;
  if (!qword_1E9CBB520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB520);
  }
  return result;
}

unint64_t sub_1B3796724()
{
  unint64_t result = qword_1E9CBB528;
  if (!qword_1E9CBB528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB528);
  }
  return result;
}

unint64_t sub_1B3796774()
{
  unint64_t result = qword_1E9CBB530;
  if (!qword_1E9CBB530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB530);
  }
  return result;
}

unint64_t sub_1B37967C0(uint64_t a1)
{
  unint64_t result = sub_1B37967E8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B37967E8()
{
  unint64_t result = qword_1E9CBB538;
  if (!qword_1E9CBB538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB538);
  }
  return result;
}

uint64_t sub_1B3796834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B3796C60(a1, a2, a3, (uint64_t (*)(void))sub_1B379327C, (uint64_t (*)(void))sub_1B3796860);
}

unint64_t sub_1B3796860()
{
  unint64_t result = qword_1E9CBB540;
  if (!qword_1E9CBB540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB540);
  }
  return result;
}

unint64_t sub_1B37968B0()
{
  unint64_t result = qword_1E9CBB548;
  if (!qword_1E9CBB548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB548);
  }
  return result;
}

unint64_t sub_1B37968FC(uint64_t a1)
{
  unint64_t result = sub_1B3796924();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B3796924()
{
  unint64_t result = qword_1E9CBB550;
  if (!qword_1E9CBB550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB550);
  }
  return result;
}

uint64_t sub_1B3796970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B3796C60(a1, a2, a3, (uint64_t (*)(void))sub_1B379699C, (uint64_t (*)(void))sub_1B37969E8);
}

unint64_t sub_1B379699C()
{
  unint64_t result = qword_1E9CBB558;
  if (!qword_1E9CBB558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB558);
  }
  return result;
}

unint64_t sub_1B37969E8()
{
  unint64_t result = qword_1E9CBB560;
  if (!qword_1E9CBB560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB560);
  }
  return result;
}

unint64_t sub_1B3796A38()
{
  unint64_t result = qword_1E9CBB568;
  if (!qword_1E9CBB568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB568);
  }
  return result;
}

unint64_t sub_1B3796A84(uint64_t a1)
{
  unint64_t result = sub_1B3796AAC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B3796AAC()
{
  unint64_t result = qword_1E9CBB570;
  if (!qword_1E9CBB570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB570);
  }
  return result;
}

uint64_t sub_1B3796AF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B3796C60(a1, a2, a3, (uint64_t (*)(void))sub_1B3796238, (uint64_t (*)(void))sub_1B3796B24);
}

unint64_t sub_1B3796B24()
{
  unint64_t result = qword_1E9CBB578;
  if (!qword_1E9CBB578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB578);
  }
  return result;
}

unint64_t sub_1B3796B74()
{
  unint64_t result = qword_1E9CBB580;
  if (!qword_1E9CBB580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB580);
  }
  return result;
}

unint64_t sub_1B3796BC0(uint64_t a1)
{
  unint64_t result = sub_1B3796BE8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B3796BE8()
{
  unint64_t result = qword_1E9CBB588;
  if (!qword_1E9CBB588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB588);
  }
  return result;
}

uint64_t sub_1B3796C34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B3796C60(a1, a2, a3, (uint64_t (*)(void))sub_1B36D916C, (uint64_t (*)(void))sub_1B3796C9C);
}

uint64_t sub_1B3796C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  *(void *)(a1 + 8) = a4();
  uint64_t result = a5();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1B3796C9C()
{
  unint64_t result = qword_1E9CBB590;
  if (!qword_1E9CBB590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB590);
  }
  return result;
}

unint64_t sub_1B3796CEC()
{
  unint64_t result = qword_1E9CBB598;
  if (!qword_1E9CBB598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB598);
  }
  return result;
}

void type metadata accessor for Google_Protobuf_Syntax()
{
}

uint64_t destroy for Google_Protobuf_Type(void *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B36C2E10(a1[9], a1[10]);
  uint64_t result = a1[12];
  if (result)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = a1[13];
    unint64_t v4 = a1[14];
    return sub_1B36C2E10(v3, v4);
  }
  return result;
}

uint64_t initializeWithCopy for Google_Protobuf_Type(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  uint64_t v8 = *(void *)(a2 + 72);
  unint64_t v9 = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B36B9E20(v8, v9);
  *(void *)(a1 + 72) = v8;
  *(void *)(a1 + 80) = v9;
  uint64_t v10 = *(void *)(a2 + 96);
  if (v10)
  {
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(void *)(a1 + 96) = v10;
    uint64_t v12 = *(void *)(a2 + 104);
    unint64_t v11 = *(void *)(a2 + 112);
    swift_bridgeObjectRetain();
    sub_1B36B9E20(v12, v11);
    *(void *)(a1 + 104) = v12;
    *(void *)(a1 + 112) = v11;
  }
  else
  {
    long long v13 = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 104) = v13;
  }
  return a1;
}

uint64_t assignWithCopy for Google_Protobuf_Type(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 72);
  unint64_t v6 = *(void *)(a2 + 80);
  sub_1B36B9E20(v5, v6);
  uint64_t v7 = *(void *)(a1 + 72);
  unint64_t v8 = *(void *)(a1 + 80);
  *(void *)(a1 + 72) = v5;
  *(void *)(a1 + 80) = v6;
  sub_1B36C2E10(v7, v8);
  unint64_t v9 = (_OWORD *)(a1 + 88);
  uint64_t v10 = (_OWORD *)(a2 + 88);
  uint64_t v11 = *(void *)(a2 + 96);
  if (*(void *)(a1 + 96))
  {
    if (v11)
    {
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v13 = *(void *)(a2 + 104);
      unint64_t v12 = *(void *)(a2 + 112);
      sub_1B36B9E20(v13, v12);
      uint64_t v14 = *(void *)(a1 + 104);
      unint64_t v15 = *(void *)(a1 + 112);
      *(void *)(a1 + 104) = v13;
      *(void *)(a1 + 112) = v12;
      sub_1B36C2E10(v14, v15);
    }
    else
    {
      sub_1B36D99D4(a1 + 88);
      long long v18 = *(_OWORD *)(a2 + 104);
      _OWORD *v9 = *v10;
      *(_OWORD *)(a1 + 104) = v18;
    }
  }
  else if (v11)
  {
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    uint64_t v17 = *(void *)(a2 + 104);
    unint64_t v16 = *(void *)(a2 + 112);
    swift_bridgeObjectRetain();
    sub_1B36B9E20(v17, v16);
    *(void *)(a1 + 104) = v17;
    *(void *)(a1 + 112) = v16;
  }
  else
  {
    long long v19 = *(_OWORD *)(a2 + 104);
    _OWORD *v9 = *v10;
    *(_OWORD *)(a1 + 104) = v19;
  }
  return a1;
}

uint64_t assignWithTake for Google_Protobuf_Type(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a1 + 72);
  unint64_t v7 = *(void *)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  sub_1B36C2E10(v6, v7);
  if (!*(void *)(a1 + 96)) {
    goto LABEL_5;
  }
  uint64_t v8 = *(void *)(a2 + 96);
  if (!v8)
  {
    sub_1B36D99D4(a1 + 88);
LABEL_5:
    long long v11 = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 104) = v11;
    return a1;
  }
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a1 + 104);
  unint64_t v10 = *(void *)(a1 + 112);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  sub_1B36C2E10(v9, v10);
  return a1;
}

void type metadata accessor for Google_Protobuf_Type()
{
}

uint64_t destroy for Google_Protobuf_Field(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 112);
  unint64_t v3 = *(void *)(a1 + 120);
  return sub_1B36C2E10(v2, v3);
}

uint64_t initializeWithCopy for Google_Protobuf_Field(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  uint64_t v3 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v3;
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  uint64_t v6 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v6;
  uint64_t v7 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  unint64_t v8 = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B36B9E20(v7, v8);
  *(void *)(a1 + 112) = v7;
  *(void *)(a1 + 120) = v8;
  return a1;
}

uint64_t assignWithCopy for Google_Protobuf_Field(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  uint64_t v5 = a2[2];
  *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(_DWORD *)(a1 + 28) = *((_DWORD *)a2 + 7);
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = a2[6];
  *(void *)(a1 + 56) = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 64) = *((_DWORD *)a2 + 16);
  *(unsigned char *)(a1 + 68) = *((unsigned char *)a2 + 68);
  *(void *)(a1 + 72) = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = a2[10];
  *(void *)(a1 + 88) = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = a2[12];
  *(void *)(a1 + 104) = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[14];
  unint64_t v6 = a2[15];
  sub_1B36B9E20(v7, v6);
  uint64_t v8 = *(void *)(a1 + 112);
  unint64_t v9 = *(void *)(a1 + 120);
  *(void *)(a1 + 112) = v7;
  *(void *)(a1 + 120) = v6;
  sub_1B36C2E10(v8, v9);
  return a1;
}

void *__swift_memcpy128_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x80uLL);
}

uint64_t assignWithTake for Google_Protobuf_Field(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a1 + 112);
  unint64_t v9 = *(void *)(a1 + 120);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  sub_1B36C2E10(v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for Google_Protobuf_Field(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 128))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 40);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Google_Protobuf_Field(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 128) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 128) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for Google_Protobuf_Field()
{
}

void type metadata accessor for Google_Protobuf_Field.Kind()
{
}

void type metadata accessor for Google_Protobuf_Field.Cardinality()
{
}

uint64_t destroy for Google_Protobuf_Enum(void *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B36C2E10(a1[8], a1[9]);
  uint64_t result = a1[11];
  if (result)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = a1[12];
    unint64_t v4 = a1[13];
    return sub_1B36C2E10(v3, v4);
  }
  return result;
}

uint64_t initializeWithCopy for Google_Protobuf_Enum(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 64);
  unint64_t v8 = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B36B9E20(v7, v8);
  *(void *)(a1 + 64) = v7;
  *(void *)(a1 + 72) = v8;
  uint64_t v9 = *(void *)(a2 + 88);
  if (v9)
  {
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(void *)(a1 + 88) = v9;
    uint64_t v11 = *(void *)(a2 + 96);
    unint64_t v10 = *(void *)(a2 + 104);
    swift_bridgeObjectRetain();
    sub_1B36B9E20(v11, v10);
    *(void *)(a1 + 96) = v11;
    *(void *)(a1 + 104) = v10;
  }
  else
  {
    long long v12 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v12;
  }
  return a1;
}

uint64_t assignWithCopy for Google_Protobuf_Enum(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 64);
  unint64_t v6 = *(void *)(a2 + 72);
  sub_1B36B9E20(v5, v6);
  uint64_t v7 = *(void *)(a1 + 64);
  unint64_t v8 = *(void *)(a1 + 72);
  *(void *)(a1 + 64) = v5;
  *(void *)(a1 + 72) = v6;
  sub_1B36C2E10(v7, v8);
  uint64_t v9 = (_OWORD *)(a1 + 80);
  unint64_t v10 = (_OWORD *)(a2 + 80);
  uint64_t v11 = *(void *)(a2 + 88);
  if (*(void *)(a1 + 88))
  {
    if (v11)
    {
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v13 = *(void *)(a2 + 96);
      unint64_t v12 = *(void *)(a2 + 104);
      sub_1B36B9E20(v13, v12);
      uint64_t v14 = *(void *)(a1 + 96);
      unint64_t v15 = *(void *)(a1 + 104);
      *(void *)(a1 + 96) = v13;
      *(void *)(a1 + 104) = v12;
      sub_1B36C2E10(v14, v15);
    }
    else
    {
      sub_1B36D99D4(a1 + 80);
      long long v18 = *(_OWORD *)(a2 + 96);
      _OWORD *v9 = *v10;
      *(_OWORD *)(a1 + 96) = v18;
    }
  }
  else if (v11)
  {
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    uint64_t v17 = *(void *)(a2 + 96);
    unint64_t v16 = *(void *)(a2 + 104);
    swift_bridgeObjectRetain();
    sub_1B36B9E20(v17, v16);
    *(void *)(a1 + 96) = v17;
    *(void *)(a1 + 104) = v16;
  }
  else
  {
    long long v19 = *(_OWORD *)(a2 + 96);
    _OWORD *v9 = *v10;
    *(_OWORD *)(a1 + 96) = v19;
  }
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t assignWithTake for Google_Protobuf_Enum(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a1 + 64);
  unint64_t v7 = *(void *)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  sub_1B36C2E10(v6, v7);
  if (!*(void *)(a1 + 88)) {
    goto LABEL_5;
  }
  uint64_t v8 = *(void *)(a2 + 88);
  if (!v8)
  {
    sub_1B36D99D4(a1 + 80);
LABEL_5:
    long long v11 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 96) = v11;
    return a1;
  }
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a1 + 96);
  unint64_t v10 = *(void *)(a1 + 104);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  sub_1B36C2E10(v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for Google_Protobuf_Enum(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 112))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Google_Protobuf_Enum(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for Google_Protobuf_Enum()
{
}

uint64_t initializeWithCopy for Google_Protobuf_EnumValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  unint64_t v5 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B36B9E20(v4, v5);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return a1;
}

uint64_t assignWithCopy for Google_Protobuf_EnumValue(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  unint64_t v4 = *(void *)(a2 + 40);
  sub_1B36B9E20(v5, v4);
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v4;
  sub_1B36C2E10(v6, v7);
  return a1;
}

uint64_t assignWithTake for Google_Protobuf_EnumValue(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a1 + 32);
  unint64_t v6 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  sub_1B36C2E10(v5, v6);
  return a1;
}

void type metadata accessor for Google_Protobuf_EnumValue()
{
}

uint64_t destroy for Google_Protobuf_Option(void *a1)
{
  swift_bridgeObjectRelease();
  uint64_t result = sub_1B36C2E10(a1[2], a1[3]);
  if (a1[6])
  {
    sub_1B36C2E10(a1[4], a1[5]);
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for Google_Protobuf_Option(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[2];
  unint64_t v6 = a2[3];
  swift_bridgeObjectRetain();
  sub_1B36B9E20(v5, v6);
  a1[2] = v5;
  a1[3] = v6;
  uint64_t v7 = a2[6];
  if (v7)
  {
    uint64_t v9 = a2[4];
    unint64_t v8 = a2[5];
    sub_1B36B9E20(v9, v8);
    a1[4] = v9;
    a1[5] = v8;
    a1[6] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    a1[6] = a2[6];
  }
  return a1;
}

void *assignWithCopy for Google_Protobuf_Option(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  unint64_t v5 = a2[3];
  sub_1B36B9E20(v4, v5);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  a1[2] = v4;
  a1[3] = v5;
  sub_1B36C2E10(v6, v7);
  unint64_t v8 = a1 + 4;
  uint64_t v9 = a2 + 4;
  uint64_t v10 = a2[6];
  if (a1[6])
  {
    if (v10)
    {
      uint64_t v11 = a2[4];
      unint64_t v12 = a2[5];
      sub_1B36B9E20(v11, v12);
      uint64_t v13 = a1[4];
      unint64_t v14 = a1[5];
      a1[4] = v11;
      a1[5] = v12;
      sub_1B36C2E10(v13, v14);
      a1[6] = a2[6];
      swift_retain();
      swift_release();
    }
    else
    {
      sub_1B3797CB0((uint64_t)(a1 + 4));
      uint64_t v17 = a2[6];
      _OWORD *v8 = *v9;
      a1[6] = v17;
    }
  }
  else if (v10)
  {
    uint64_t v15 = a2[4];
    unint64_t v16 = a2[5];
    sub_1B36B9E20(v15, v16);
    a1[4] = v15;
    a1[5] = v16;
    a1[6] = a2[6];
    swift_retain();
  }
  else
  {
    long long v18 = *v9;
    a1[6] = a2[6];
    _OWORD *v8 = v18;
  }
  return a1;
}

uint64_t sub_1B3797CB0(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for Google_Protobuf_Option(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a1[2];
  unint64_t v6 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_1B36C2E10(v5, v6);
  uint64_t v7 = a2 + 32;
  if (!a1[6]) {
    goto LABEL_5;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (!v8)
  {
    sub_1B3797CB0((uint64_t)(a1 + 4));
LABEL_5:
    *((_OWORD *)a1 + 2) = *(_OWORD *)v7;
    a1[6] = *(void *)(v7 + 16);
    return a1;
  }
  uint64_t v9 = a1[4];
  unint64_t v10 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)v7;
  sub_1B36C2E10(v9, v10);
  a1[6] = v8;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Google_Protobuf_Option(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Google_Protobuf_Option(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for Google_Protobuf_Option()
{
}

uint64_t sub_1B3797E60(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 112);
  unint64_t v3 = *(void *)(a1 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B36B9E20(v2, v3);
  return a1;
}

uint64_t sub_1B3797EE4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 112);
  unint64_t v3 = *(void *)(a1 + 120);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B36C2E10(v2, v3);
  return a1;
}

uint64_t sub_1B3797F68()
{
  return sub_1B37A0E40();
}

uint64_t OUTLINED_FUNCTION_47_7()
{
  return v0;
}

BOOL sub_1B3797FEC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v3 = (int)a1;
      uint64_t v2 = a1 >> 32;
      break;
    case 2uLL:
      uint64_t v3 = *(void *)(a1 + 16);
      uint64_t v2 = *(void *)(a1 + 24);
      break;
    case 3uLL:
      return v3 == v2;
    default:
      uint64_t v3 = 0;
      uint64_t v2 = BYTE6(a2);
      break;
  }
  return v3 == v2;
}

uint64_t UnknownStorage.data.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_1B36B9E20(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

void static UnknownStorage.== infix(_:_:)()
{
}

uint64_t sub_1B37980AC(unsigned int a1)
{
  uint64_t v1 = 2;
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  if (a1 >> 28) {
    uint64_t v3 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x4000) {
    uint64_t v1 = v2;
  }
  if (a1 >= 0x80) {
    return v1;
  }
  else {
    return 1;
  }
}

uint64_t sub_1B37980E4(unsigned int a1)
{
  if ((a1 & 0x80000000) != 0) {
    return sub_1B36C4398((int)a1);
  }
  uint64_t v1 = 2;
  uint64_t v2 = 3;
  uint64_t v3 = 4;
  if (a1 >> 28) {
    uint64_t v3 = 5;
  }
  if (a1 >= 0x200000) {
    uint64_t v2 = v3;
  }
  if (a1 >= 0x4000) {
    uint64_t v1 = v2;
  }
  if (a1 >= 0x80) {
    return v1;
  }
  else {
    return 1;
  }
}

uint64_t static Version.major.getter()
{
  return 1;
}

uint64_t static Version.minor.getter()
{
  return 28;
}

uint64_t static Version.revision.getter()
{
  return 1;
}

uint64_t sub_1B3798140()
{
  uint64_t v2 = sub_1B37A0D70();
  uint64_t v3 = v0;
  sub_1B37A08D0();
  sub_1B37A0D70();
  sub_1B37A08D0();
  swift_bridgeObjectRelease();
  sub_1B37A08D0();
  sub_1B37A0D70();
  sub_1B37A08D0();
  uint64_t result = swift_bridgeObjectRelease();
  qword_1E9CBB5A8 = v2;
  unk_1E9CBB5B0 = v3;
  return result;
}

uint64_t static Version.versionString.getter()
{
  if (qword_1E9CB9630 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1E9CBB5A8;
  swift_bridgeObjectRetain();
  return v0;
}

ValueMetadata *type metadata accessor for Version()
{
  return &type metadata for Version;
}

uint64_t sub_1B379829C()
{
  return sub_1B36F0648();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitExtensionFields(fields:start:end:)(InternalSwiftProtobuf::ExtensionFieldValueSet fields, Swift::Int start, Swift::Int end)
{
  ExtensionFieldValueSet.traverse<A>(visitor:start:end:)(v5, start, end, v3, v4);
}

void sub_1B37982EC(int a1, int a2)
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitSingularInt32Field(value:fieldNumber:)(Swift::Int32 value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_19_14();
  v2();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitSingularUInt32Field(value:fieldNumber:)(Swift::UInt32 value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_20_17();
  v2();
}

uint64_t sub_1B3798344(uint64_t a1, int a2)
{
  return sub_1B379835C(a1, a2);
}

uint64_t sub_1B379835C(uint64_t result, int a2)
{
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(unsigned char **)(v2 + 8);
    do
    {
      int v6 = *(_DWORD *)(result + 32 + 4 * v4);
      if (((8 * a2) | 5uLL) < 0x80)
      {
        LOBYTE(v8) = (8 * a2) | 5;
      }
      else
      {
        unint64_t v7 = (8 * a2) | 5;
        do
        {
          *v5++ = v7 | 0x80;
          unint64_t v8 = v7 >> 7;
          unint64_t v9 = v7 >> 14;
          v7 >>= 7;
        }
        while (v9);
      }
      ++v4;
      *uint64_t v5 = v8;
      *(_DWORD *)(v5 + 1) = v6;
      v5 += 5;
    }
    while (v4 != v3);
    *(void *)(v2 + 8) = v5;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitRepeatedFloatField(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_25();
  if (v2)
  {
    OUTLINED_FUNCTION_1_34();
    uint64_t v4 = *(void (**)(uint64_t))(v3 + 8);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_10_20();
    uint64_t v5 = OUTLINED_FUNCTION_22_10();
    v4(v5);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16_9();
}

uint64_t sub_1B3798444(uint64_t a1, int a2)
{
  return sub_1B379845C(a1, a2);
}

uint64_t sub_1B379845C(uint64_t result, int a2)
{
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(unsigned char **)(v2 + 8);
    do
    {
      uint64_t v6 = *(void *)(result + 32 + 8 * v4);
      if (((8 * a2) | 1uLL) < 0x80)
      {
        LOBYTE(v8) = (8 * a2) | 1;
      }
      else
      {
        unint64_t v7 = (8 * a2) | 1;
        do
        {
          *v5++ = v7 | 0x80;
          unint64_t v8 = v7 >> 7;
          unint64_t v9 = v7 >> 14;
          v7 >>= 7;
        }
        while (v9);
      }
      ++v4;
      *uint64_t v5 = v8;
      *(void *)(v5 + 1) = v6;
      v5 += 9;
    }
    while (v4 != v3);
    *(void *)(v2 + 8) = v5;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitRepeatedDoubleField(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_25();
  if (v2)
  {
    OUTLINED_FUNCTION_1_34();
    uint64_t v4 = *(void (**)(uint64_t))(v3 + 16);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_10_20();
    uint64_t v5 = OUTLINED_FUNCTION_22_10();
    v4(v5);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16_9();
}

uint64_t sub_1B3798540(uint64_t a1, int a2)
{
  return sub_1B3798558(a1, a2);
}

uint64_t sub_1B3798558(uint64_t result, int a2)
{
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(unsigned char **)(v2 + 8);
    do
    {
      unint64_t v6 = *(int *)(result + 32 + 4 * v4);
      if ((8 * a2) < 0x80uLL)
      {
        LOBYTE(v8) = 8 * a2;
      }
      else
      {
        unint64_t v7 = (8 * a2);
        do
        {
          *v5++ = v7 | 0x80;
          unint64_t v8 = v7 >> 7;
          unint64_t v9 = v7 >> 14;
          v7 >>= 7;
        }
        while (v9);
      }
      *uint64_t v5 = v8;
      unint64_t v10 = v5 + 1;
      if (v6 < 0x80)
      {
        LOBYTE(v11) = v6;
      }
      else
      {
        do
        {
          *v10++ = v6 | 0x80;
          unint64_t v11 = v6 >> 7;
          unint64_t v12 = v6 >> 14;
          v6 >>= 7;
        }
        while (v12);
      }
      ++v4;
      *unint64_t v10 = v11;
      uint64_t v5 = v10 + 1;
    }
    while (v4 != v3);
    *(void *)(v2 + 8) = v5;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitRepeatedInt32Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_25();
  if (v2)
  {
    OUTLINED_FUNCTION_1_34();
    uint64_t v4 = *(void (**)(void))(v3 + 24);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_10_20();
    OUTLINED_FUNCTION_0_33();
    v4();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16_9();
}

uint64_t sub_1B379865C(uint64_t a1, int a2)
{
  return sub_1B3798674(a1, a2);
}

uint64_t sub_1B3798674(uint64_t result, int a2)
{
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(unsigned char **)(v2 + 8);
    do
    {
      unint64_t v6 = *(void *)(result + 32 + 8 * v4);
      if ((8 * a2) < 0x80uLL)
      {
        LOBYTE(v8) = 8 * a2;
      }
      else
      {
        unint64_t v7 = (8 * a2);
        do
        {
          *v5++ = v7 | 0x80;
          unint64_t v8 = v7 >> 7;
          unint64_t v9 = v7 >> 14;
          v7 >>= 7;
        }
        while (v9);
      }
      *uint64_t v5 = v8;
      unint64_t v10 = v5 + 1;
      if (v6 < 0x80)
      {
        LOBYTE(v11) = v6;
      }
      else
      {
        do
        {
          *v10++ = v6 | 0x80;
          unint64_t v11 = v6 >> 7;
          unint64_t v12 = v6 >> 14;
          v6 >>= 7;
        }
        while (v12);
      }
      ++v4;
      *unint64_t v10 = v11;
      uint64_t v5 = v10 + 1;
    }
    while (v4 != v3);
    *(void *)(v2 + 8) = v5;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitRepeatedInt64Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_25();
  if (v2)
  {
    OUTLINED_FUNCTION_1_34();
    uint64_t v4 = *(void (**)(void))(v3 + 32);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_10_20();
    OUTLINED_FUNCTION_0_33();
    v4();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16_9();
}

uint64_t sub_1B3798778(uint64_t a1, int a2)
{
  return sub_1B3798790(a1, a2);
}

uint64_t sub_1B3798790(uint64_t result, int a2)
{
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(unsigned char **)(v2 + 8);
    do
    {
      unint64_t v6 = *(unsigned int *)(result + 32 + 4 * v4);
      if ((8 * a2) < 0x80uLL)
      {
        LOBYTE(v8) = 8 * a2;
      }
      else
      {
        unint64_t v7 = (8 * a2);
        do
        {
          *v5++ = v7 | 0x80;
          unint64_t v8 = v7 >> 7;
          unint64_t v9 = v7 >> 14;
          v7 >>= 7;
        }
        while (v9);
      }
      *uint64_t v5 = v8;
      unint64_t v10 = v5 + 1;
      if (v6 < 0x80)
      {
        LOBYTE(v11) = v6;
      }
      else
      {
        do
        {
          *v10++ = v6 | 0x80;
          unint64_t v11 = v6 >> 7;
          unint64_t v12 = v6 >> 14;
          v6 >>= 7;
        }
        while (v12);
      }
      ++v4;
      *unint64_t v10 = v11;
      uint64_t v5 = v10 + 1;
    }
    while (v4 != v3);
    *(void *)(v2 + 8) = v5;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitRepeatedUInt32Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_25();
  if (v2)
  {
    OUTLINED_FUNCTION_1_34();
    uint64_t v4 = *(void (**)(void))(v3 + 40);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_10_20();
    OUTLINED_FUNCTION_0_33();
    v4();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16_9();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitRepeatedUInt64Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_25();
  if (v2)
  {
    OUTLINED_FUNCTION_1_34();
    uint64_t v4 = *(void (**)(void))(v3 + 48);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_10_20();
    OUTLINED_FUNCTION_0_33();
    v4();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16_9();
}

uint64_t sub_1B379890C(uint64_t a1, int a2)
{
  return sub_1B3798924(a1, a2);
}

uint64_t sub_1B3798924(uint64_t result, int a2)
{
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(unsigned char **)(v2 + 8);
    do
    {
      uint64_t v6 = *(int *)(result + 32 + 4 * v4);
      if ((8 * a2) < 0x80uLL)
      {
        LOBYTE(v8) = 8 * a2;
      }
      else
      {
        unint64_t v7 = (8 * a2);
        do
        {
          *v5++ = v7 | 0x80;
          unint64_t v8 = v7 >> 7;
          unint64_t v9 = v7 >> 14;
          v7 >>= 7;
        }
        while (v9);
      }
      unint64_t v10 = (2 * v6) ^ (v6 >> 63);
      *uint64_t v5 = v8;
      unint64_t v11 = v5 + 1;
      if (v10 < 0x80)
      {
        LOBYTE(v12) = v10;
      }
      else
      {
        do
        {
          *v11++ = v10 | 0x80;
          unint64_t v12 = v10 >> 7;
          unint64_t v13 = v10 >> 14;
          v10 >>= 7;
        }
        while (v13);
      }
      ++v4;
      *unint64_t v11 = v12;
      uint64_t v5 = v11 + 1;
    }
    while (v4 != v3);
    *(void *)(v2 + 8) = v5;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitRepeatedSInt32Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_25();
  if (v2)
  {
    OUTLINED_FUNCTION_1_34();
    uint64_t v4 = *(void (**)(void))(v3 + 56);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_10_20();
    OUTLINED_FUNCTION_0_33();
    v4();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16_9();
}

uint64_t sub_1B3798A30(uint64_t a1, int a2)
{
  return sub_1B3798A48(a1, a2);
}

uint64_t sub_1B3798A48(uint64_t result, int a2)
{
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(unsigned char **)(v2 + 8);
    do
    {
      uint64_t v6 = *(void *)(result + 32 + 8 * v4);
      if ((8 * a2) < 0x80uLL)
      {
        LOBYTE(v8) = 8 * a2;
      }
      else
      {
        unint64_t v7 = (8 * a2);
        do
        {
          *v5++ = v7 | 0x80;
          unint64_t v8 = v7 >> 7;
          unint64_t v9 = v7 >> 14;
          v7 >>= 7;
        }
        while (v9);
      }
      unint64_t v10 = (2 * v6) ^ (v6 >> 63);
      *uint64_t v5 = v8;
      unint64_t v11 = v5 + 1;
      if (v10 < 0x80)
      {
        LOBYTE(v12) = v10;
      }
      else
      {
        do
        {
          *v11++ = v10 | 0x80;
          unint64_t v12 = v10 >> 7;
          unint64_t v13 = v10 >> 14;
          v10 >>= 7;
        }
        while (v13);
      }
      ++v4;
      *unint64_t v11 = v12;
      uint64_t v5 = v11 + 1;
    }
    while (v4 != v3);
    *(void *)(v2 + 8) = v5;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitRepeatedSInt64Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_25();
  if (v2)
  {
    OUTLINED_FUNCTION_1_34();
    uint64_t v4 = *(void (**)(void))(v3 + 64);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_10_20();
    OUTLINED_FUNCTION_0_33();
    v4();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16_9();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitRepeatedFixed32Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_25();
  if (v2)
  {
    OUTLINED_FUNCTION_1_34();
    uint64_t v4 = *(void (**)(void))(v3 + 72);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_10_20();
    OUTLINED_FUNCTION_0_33();
    v4();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16_9();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitRepeatedFixed64Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_25();
  if (v2)
  {
    OUTLINED_FUNCTION_1_34();
    uint64_t v4 = *(void (**)(void))(v3 + 80);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_10_20();
    OUTLINED_FUNCTION_0_33();
    v4();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16_9();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitRepeatedSFixed32Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_25();
  if (v2)
  {
    OUTLINED_FUNCTION_1_34();
    uint64_t v4 = *(void (**)(void))(v3 + 88);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_10_20();
    OUTLINED_FUNCTION_0_33();
    v4();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16_9();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitRepeatedSFixed64Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_25();
  if (v2)
  {
    OUTLINED_FUNCTION_1_34();
    uint64_t v4 = *(void (**)(void))(v3 + 96);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_10_20();
    OUTLINED_FUNCTION_0_33();
    v4();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16_9();
}

uint64_t sub_1B3798D34(uint64_t a1, int a2)
{
  return sub_1B3798D4C(a1, a2);
}

uint64_t sub_1B3798D4C(uint64_t result, int a2)
{
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(unsigned char **)(v2 + 8);
    do
    {
      char v6 = *(unsigned char *)(result + 32 + v4);
      if ((8 * a2) < 0x80uLL)
      {
        LOBYTE(v8) = 8 * a2;
      }
      else
      {
        unint64_t v7 = (8 * a2);
        do
        {
          *v5++ = v7 | 0x80;
          unint64_t v8 = v7 >> 7;
          unint64_t v9 = v7 >> 14;
          v7 >>= 7;
        }
        while (v9);
      }
      ++v4;
      *uint64_t v5 = v8;
      v5[1] = v6;
      v5 += 2;
    }
    while (v4 != v3);
    *(void *)(v2 + 8) = v5;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitRepeatedBoolField(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3_25();
  if (v2)
  {
    OUTLINED_FUNCTION_1_34();
    uint64_t v4 = *(void (**)(void))(v3 + 104);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_10_20();
    OUTLINED_FUNCTION_0_33();
    v4();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16_9();
}

void sub_1B3798E2C(uint64_t a1, int a2)
{
}

void sub_1B3798E44(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return;
  }
  uint64_t v4 = 0;
  uint64_t v5 = (unsigned char **)(v2 + 8);
  unint64_t v6 = (8 * a2) | 2;
  uint64_t v7 = a1 + 32;
  while (1)
  {
    unint64_t v8 = (uint64_t *)(v7 + 16 * v4);
    uint64_t v9 = *v8;
    unint64_t v10 = v8[1];
    unint64_t v11 = *v5;
    if (v6 < 0x80)
    {
      LOBYTE(v13) = v6;
    }
    else
    {
      unint64_t v12 = v6;
      do
      {
        *v11++ = v12 | 0x80;
        unint64_t v13 = v12 >> 7;
        unint64_t v14 = v12 >> 14;
        v12 >>= 7;
      }
      while (v14);
    }
    *unint64_t v11 = v13;
    uint64_t v15 = v11 + 1;
    *uint64_t v5 = v11 + 1;
    uint64_t v16 = HIBYTE(v10) & 0xF;
    if ((v10 & 0x1000000000000000) != 0) {
      break;
    }
    if ((v10 & 0x2000000000000000) != 0)
    {
      __src[0] = v9;
      __src[1] = v10 & 0xFFFFFFFFFFFFFFLL;
      v11[1] = v16;
      uint64_t v22 = v11 + 2;
      if (v16) {
        memmove(v11 + 2, __src, HIBYTE(v10) & 0xF);
      }
      uint64_t v23 = &v22[v16];
    }
    else
    {
      if ((v9 & 0x1000000000000000) != 0)
      {
        uint64_t v17 = (const void *)((v10 & 0xFFFFFFFFFFFFFFFLL) + 32);
        int64_t v18 = v9 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v17 = (const void *)sub_1B37A0CB0();
        int64_t v18 = v30;
      }
      if ((unint64_t)v18 < 0x80)
      {
        LOBYTE(v20) = v18;
      }
      else
      {
        unint64_t v19 = v18;
        do
        {
          *v15++ = v19 | 0x80;
          unint64_t v20 = v19 >> 7;
          unint64_t v21 = v19 >> 14;
          v19 >>= 7;
        }
        while (v21);
      }
      *uint64_t v15 = v20;
      uint64_t v24 = v15 + 1;
      *uint64_t v5 = v24;
      if (v17)
      {
        if (v18 >= 1) {
          memmove(v24, v17, v18);
        }
      }
      else
      {
        int64_t v18 = 0;
      }
      uint64_t v23 = &v24[v18];
    }
    *uint64_t v5 = v23;
LABEL_26:
    if (++v4 == v3) {
      return;
    }
  }
  unint64_t v25 = sub_1B37A0900();
  sub_1B36C40B8(v25);
  uint64_t v26 = v9 & 0xFFFFFFFFFFFFLL;
  if ((v10 & 0x2000000000000000) != 0) {
    uint64_t v26 = HIBYTE(v10) & 0xF;
  }
  unint64_t v34 = v26;
  if (!v26) {
    goto LABEL_26;
  }
  uint64_t v31 = 4 * v26;
  uint64_t v33 = 4 << ((v9 & 0x800000000000000) != 0);
  unint64_t v27 = 15;
  while (1)
  {
    unint64_t v28 = v27;
    if ((v27 & 0xC) == v33) {
      unint64_t v28 = sub_1B36E07D4(v27, v9, v10);
    }
    if (v34 <= v28 >> 16) {
      break;
    }
    char v32 = sub_1B37A0950();
    if ((v27 & 0xC) == v33) {
      unint64_t v27 = sub_1B36E07D4(v27, v9, v10);
    }
    if (v34 <= v27 >> 16) {
      goto LABEL_43;
    }
    unint64_t v27 = sub_1B37A0910();
    uint64_t v29 = *v5;
    *uint64_t v29 = v32;
    *uint64_t v5 = v29 + 1;
    if (v31 == v27 >> 14) {
      goto LABEL_26;
    }
  }
  __break(1u);
LABEL_43:
  __break(1u);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitRepeatedStringField(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_17();
  uint64_t v5 = v2;
  uint64_t v15 = v6;
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    uint64_t v9 = v4;
    uint64_t v10 = v3;
    unint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 112);
    unint64_t v12 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    while (1)
    {
      uint64_t v13 = *(v12 - 1);
      uint64_t v14 = *v12;
      swift_bridgeObjectRetain();
      v11(v13, v14, v10, v15, v9);
      if (v5) {
        break;
      }
      v12 += 2;
      swift_bridgeObjectRelease();
      if (!--v8) {
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
LABEL_7:
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_16_9();
}

uint64_t sub_1B3799168(uint64_t a1, int a2)
{
  return sub_1B3799180(a1, a2);
}

uint64_t sub_1B3799180(uint64_t result, int a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    unint64_t v4 = (8 * a2) | 2;
    uint64_t v5 = result + 32;
    uint64_t v6 = *(unsigned char **)(v2 + 8);
    swift_bridgeObjectRetain();
    uint64_t v7 = 0;
    uint64_t v35 = v3;
    uint64_t v36 = v5;
    unint64_t v37 = v4;
    while (2)
    {
      uint64_t v8 = (uint64_t *)(v5 + 16 * v7);
      uint64_t v10 = *v8;
      unint64_t v9 = v8[1];
      if (v4 < 0x80)
      {
        LOBYTE(v12) = v4;
      }
      else
      {
        unint64_t v11 = v4;
        do
        {
          *v6++ = v11 | 0x80;
          unint64_t v12 = v11 >> 7;
          unint64_t v13 = v11 >> 14;
          v11 >>= 7;
        }
        while (v13);
      }
      ++v7;
      *uint64_t v6 = v12;
      uint64_t v14 = v6 + 1;
      switch(v9 >> 62)
      {
        case 1uLL:
          LODWORD(v15) = HIDWORD(v10) - v10;
          if (__OFSUB__(HIDWORD(v10), v10))
          {
            __break(1u);
LABEL_50:
            __break(1u);
LABEL_51:
            __break(1u);
LABEL_52:
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
          }
          unint64_t v15 = (int)v15;
LABEL_13:
          if (v15 < 0x80)
          {
            LOBYTE(v19) = v15;
          }
          else
          {
            do
            {
              *v14++ = v15 | 0x80;
              unint64_t v19 = v15 >> 7;
              unint64_t v20 = v15 >> 14;
              v15 >>= 7;
            }
            while (v20);
          }
          *uint64_t v14 = v19;
          uint64_t v6 = v14 + 1;
          switch(v9 >> 62)
          {
            case 1uLL:
              if (v10 >> 32 < (int)v10) {
                goto LABEL_51;
              }
              sub_1B36B9E20(v10, v9);
              unint64_t v21 = (char *)sub_1B37A0530();
              if (!v21) {
                goto LABEL_25;
              }
              uint64_t v22 = sub_1B37A0560();
              if (__OFSUB__((int)v10, v22)) {
                goto LABEL_54;
              }
              v21 += (int)v10 - v22;
LABEL_25:
              uint64_t v23 = sub_1B37A0550();
              if (v23 >= (v10 >> 32) - (int)v10) {
                int64_t v24 = (v10 >> 32) - (int)v10;
              }
              else {
                int64_t v24 = v23;
              }
              if (v21 && v24 > 0)
              {
                memmove(v6, v21, v24);
                sub_1B36C2E10(v10, v9);
                v6 += v24;
              }
              else
              {
                sub_1B36C2E10(v10, v9);
              }
              goto LABEL_45;
            case 2uLL:
              uint64_t v25 = *(void *)(v10 + 16);
              uint64_t v26 = *(void *)(v10 + 24);
              sub_1B36B9E20(v10, v9);
              swift_retain();
              swift_retain();
              uint64_t v27 = sub_1B37A0530();
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = sub_1B37A0560();
                if (__OFSUB__(v25, v29)) {
                  goto LABEL_53;
                }
                int64_t v30 = (const void *)(v28 + v25 - v29);
              }
              else
              {
                int64_t v30 = 0;
              }
              BOOL v18 = __OFSUB__(v26, v25);
              int64_t v31 = v26 - v25;
              if (v18) {
                goto LABEL_52;
              }
              uint64_t v32 = sub_1B37A0550();
              if (v32 >= v31) {
                int64_t v33 = v31;
              }
              else {
                int64_t v33 = v32;
              }
              if (v30 && v33 > 0)
              {
                memmove(v6, v30, v33);
                swift_release();
                swift_release();
                sub_1B36C2E10(v10, v9);
                v6 += v33;
              }
              else
              {
                swift_release();
                swift_release();
                sub_1B36C2E10(v10, v9);
              }
              uint64_t v3 = v35;
LABEL_45:
              uint64_t v5 = v36;
              unint64_t v4 = v37;
LABEL_46:
              if (v7 != v3) {
                continue;
              }
              uint64_t result = swift_bridgeObjectRelease();
              *(void *)(v34 + 8) = v6;
              break;
            case 3uLL:
              goto LABEL_46;
            default:
              uint64_t __src = v10;
              __int16 v39 = v9;
              char v40 = BYTE2(v9);
              char v41 = BYTE3(v9);
              char v42 = BYTE4(v9);
              char v43 = BYTE5(v9);
              if (BYTE6(v9))
              {
                memmove(v6, &__src, BYTE6(v9));
                v6 += BYTE6(v9);
              }
              goto LABEL_46;
          }
          break;
        case 2uLL:
          uint64_t v17 = *(void *)(v10 + 16);
          uint64_t v16 = *(void *)(v10 + 24);
          BOOL v18 = __OFSUB__(v16, v17);
          unint64_t v15 = v16 - v17;
          if (!v18) {
            goto LABEL_13;
          }
          goto LABEL_50;
        case 3uLL:
          v6[1] = 0;
          v6 += 2;
          goto LABEL_46;
        default:
          unint64_t v15 = BYTE6(v9);
          goto LABEL_13;
      }
      break;
    }
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitRepeatedBytesField(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  uint64_t v12 = v2;
  uint64_t v5 = *((void *)value._rawValue + 2);
  if (v5)
  {
    uint64_t v6 = v3;
    uint64_t v7 = *(void (**)(uint64_t, unint64_t, Swift::Int, uint64_t, uint64_t))(v3 + 120);
    for (uint64_t i = (unint64_t *)(swift_bridgeObjectRetain() + 40); ; i += 2)
    {
      uint64_t v9 = *(i - 1);
      unint64_t v10 = *i;
      sub_1B36B9E20(v9, *i);
      v7(v9, v10, fieldNumber, v12, v6);
      if (v4) {
        break;
      }
      sub_1B36C2E10(v9, v10);
      if (!--v5)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
    swift_bridgeObjectRelease();
    sub_1B36C2E10(v9, v10);
  }
}

uint64_t sub_1B3799608()
{
  OUTLINED_FUNCTION_24_12();
  return Visitor.visitRepeatedEnumField<A>(value:fieldNumber:)(v0, v1, v2, v3, v4, v5);
}

uint64_t Visitor.visitRepeatedEnumField<A>(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  OUTLINED_FUNCTION_2_26(a1, a2, a3, a4, a5, a6);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_12_16();
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_21_11(v12, v13, v14, v15, v16, v17, v18, v19, v34);
  uint64_t v20 = sub_1B37A0A00();
  OUTLINED_FUNCTION_18_15(v20);
  if (v9 == v21) {
    return swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_15_17(v8 + 128);
  while (1)
  {
    sub_1B37A0A70();
    OUTLINED_FUNCTION_16_17();
    if (v7)
    {
      uint64_t v23 = OUTLINED_FUNCTION_6_23();
      v24(v23);
      goto LABEL_6;
    }
    uint64_t result = OUTLINED_FUNCTION_23_11();
    if (v35 != 8) {
      break;
    }
    uint64_t v32 = OUTLINED_FUNCTION_8_19(result);
    v33(v32);
    swift_unknownObjectRelease();
LABEL_6:
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_29_14();
    swift_bridgeObjectRelease();
    uint64_t v25 = OUTLINED_FUNCTION_14_16();
    v26(v25);
    uint64_t v27 = OUTLINED_FUNCTION_9_21();
    v28(v27);
    uint64_t v29 = OUTLINED_FUNCTION_11_18();
    v30(v29);
    if (!v6)
    {
      OUTLINED_FUNCTION_28_13();
      if (v9 != v31) {
        continue;
      }
    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1B3799760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return OUTLINED_FUNCTION_25_12(a1, a2, a3, a4, a5, a6);
}

uint64_t Visitor.visitRepeatedGroupField<A>(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  OUTLINED_FUNCTION_2_26(a1, a2, a3, a4, a5, a6);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_12_16();
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_21_11(v12, v13, v14, v15, v16, v17, v18, v19, v34);
  uint64_t v20 = sub_1B37A0A00();
  OUTLINED_FUNCTION_18_15(v20);
  if (v9 == v21) {
    return swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_15_17(v8 + 144);
  while (1)
  {
    sub_1B37A0A70();
    OUTLINED_FUNCTION_16_17();
    if (v7)
    {
      uint64_t v23 = OUTLINED_FUNCTION_6_23();
      v24(v23);
      goto LABEL_6;
    }
    uint64_t result = OUTLINED_FUNCTION_23_11();
    if (v35 != 8) {
      break;
    }
    uint64_t v32 = OUTLINED_FUNCTION_8_19(result);
    v33(v32);
    swift_unknownObjectRelease();
LABEL_6:
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_29_14();
    swift_bridgeObjectRelease();
    uint64_t v25 = OUTLINED_FUNCTION_14_16();
    v26(v25);
    uint64_t v27 = OUTLINED_FUNCTION_9_21();
    v28(v27);
    uint64_t v29 = OUTLINED_FUNCTION_11_18();
    v30(v29);
    if (!v6)
    {
      OUTLINED_FUNCTION_28_13();
      if (v9 != v31) {
        continue;
      }
    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1B37998B4()
{
  return sub_1B36F0664();
}

uint64_t sub_1B37998D0()
{
  return sub_1B37998E8();
}

uint64_t sub_1B37998E8()
{
  return sub_1B3752268();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitSingularFloatField(value:fieldNumber:)(Swift::Float value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_32_12();
  v2();
}

uint64_t sub_1B3799924()
{
  return sub_1B3799B10();
}

uint64_t sub_1B379993C()
{
  return sub_1B37999D4();
}

void sub_1B3799954(int a1, unint64_t a2)
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitSingularSInt32Field(value:fieldNumber:)(Swift::Int32 value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_34_13();
  v2();
}

uint64_t sub_1B3799988()
{
  return sub_1B3799C14();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitSingularSInt64Field(value:fieldNumber:)(Swift::Int64 value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_19_14();
  v2();
}

void sub_1B37999BC(unsigned int a1, unint64_t a2)
{
}

uint64_t sub_1B37999D4()
{
  return sub_1B37A0E60();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitSingularFixed32Field(value:fieldNumber:)(Swift::UInt32 value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_37_8();
  v2();
}

uint64_t sub_1B3799A28(unint64_t a1, unint64_t a2)
{
  sub_1B3786FB4(a2);
  sub_1B37588B4(": ", (char *)2, 2);
  sub_1B3785334(a1);
  sub_1B374BB28();
  uint64_t v4 = *(void *)(*v2 + 16);
  uint64_t result = sub_1B374BA20(v4);
  uint64_t v6 = *v2;
  *(void *)(v6 + 16) = v4 + 1;
  *(unsigned char *)(v6 + v4 + 32) = 10;
  *uint64_t v2 = v6;
  return result;
}

void sub_1B3799AA4(unint64_t a1, uint64_t a2)
{
  sub_1B3759E50(a2);
  if (!v3)
  {
    if (*(unsigned char *)(v2 + 56)) {
      sub_1B3758D08(a1);
    }
    else {
      sub_1B3758E5C(a1);
    }
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitSingularFixed64Field(value:fieldNumber:)(Swift::UInt64 value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_20_17();
  v2();
}

uint64_t sub_1B3799B10()
{
  return sub_1B37A0E60();
}

uint64_t sub_1B3799B48(unint64_t a1, unint64_t a2)
{
  sub_1B3786FB4(a2);
  sub_1B37588B4(": ", (char *)2, 2);
  sub_1B37854E8(a1);
  sub_1B374BB28();
  uint64_t v4 = *(void *)(*v2 + 16);
  uint64_t result = sub_1B374BA20(v4);
  uint64_t v6 = *v2;
  *(void *)(v6 + 16) = v4 + 1;
  *(unsigned char *)(v6 + v4 + 32) = 10;
  *uint64_t v2 = v6;
  return result;
}

void sub_1B3799BC4(unint64_t a1, uint64_t a2)
{
  sub_1B3759E50(a2);
  if (!v3)
  {
    if (*(unsigned char *)(v2 + 56)) {
      sub_1B3758DAC(a1);
    }
    else {
      sub_1B3758DB0(a1);
    }
  }
}

uint64_t sub_1B3799C14()
{
  return sub_1B37A0E60();
}

uint64_t sub_1B3799C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return OUTLINED_FUNCTION_26_14(a1, a2, a3, a4, a5, a6);
}

uint64_t Visitor.visitSingularGroupField<A>(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 136))(a1, a2, a4, a6, a3, a5);
}

uint64_t sub_1B3799CA0()
{
  return sub_1B379A0C4();
}

uint64_t sub_1B3799CCC(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1B3759E50(a2);
  if (!v3)
  {
    sub_1B374BB28();
    uint64_t v6 = *(void *)(*(void *)v2 + 16);
    sub_1B374BA20(v6);
    uint64_t v7 = *(void *)v2;
    *(void *)(v7 + 16) = v6 + 1;
    *(unsigned char *)(v7 + v6 + 32) = 91;
    *(void *)uint64_t v2 = v7;
    v2[4] = 256;
    uint64_t v8 = *(void *)(a1 + 16);
    if (v8)
    {
      swift_bridgeObjectRetain();
      char v9 = 0;
      for (uint64_t i = 0; i != v8; ++i)
      {
        float v11 = *(float *)(a1 + 4 * i + 32);
        if (v9)
        {
          uint64_t v12 = *(void *)v2;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1B36DE588();
            uint64_t v12 = v18;
          }
          unint64_t v13 = *(void *)(v12 + 16);
          if (v13 >= *(void *)(v12 + 24) >> 1)
          {
            sub_1B36DE588();
            uint64_t v12 = v19;
          }
          *(void *)(v12 + 16) = v13 + 1;
          *(unsigned char *)(v12 + v13 + 32) = 44;
          *(void *)uint64_t v2 = v12;
        }
        if ((~LODWORD(v11) & 0x7F800000) != 0)
        {
          uint64_t v16 = sub_1B37A0B70();
          sub_1B36DC054(v16, v17);
        }
        else
        {
          if ((LODWORD(v11) & 0x7FFFFF) != 0)
          {
            uint64_t v14 = "\"NaN\"";
            uint64_t v15 = 5;
          }
          else if (v11 >= 0.0)
          {
            uint64_t v14 = "\"Infinity\"";
            uint64_t v15 = 10;
          }
          else
          {
            uint64_t v14 = "\"-Infinity\"";
            uint64_t v15 = 11;
          }
          sub_1B36DBED8(v14, (char *)v15);
        }
        char v9 = 1;
      }
      swift_bridgeObjectRelease();
    }
    sub_1B374BB28();
    uint64_t v20 = *(void *)(*(void *)v2 + 16);
    uint64_t result = sub_1B374BA20(v20);
    uint64_t v21 = *(void *)v2;
    *(void *)(v21 + 16) = v20 + 1;
    *(unsigned char *)(v21 + v20 + 32) = 93;
    *(void *)uint64_t v2 = v21;
    v2[4] = 44;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitPackedFloatField(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_35_11();
  v2();
}

uint64_t sub_1B3799EC0()
{
  return sub_1B379A0C4();
}

uint64_t sub_1B3799EEC(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1B3759E50(a2);
  if (!v3)
  {
    sub_1B374BB28();
    uint64_t v6 = *(void *)(*(void *)v2 + 16);
    sub_1B374BA20(v6);
    uint64_t v7 = *(void *)v2;
    *(void *)(v7 + 16) = v6 + 1;
    *(unsigned char *)(v7 + v6 + 32) = 91;
    *(void *)uint64_t v2 = v7;
    v2[4] = 256;
    uint64_t v8 = *(void *)(a1 + 16);
    if (v8)
    {
      swift_bridgeObjectRetain();
      char v9 = 0;
      for (uint64_t i = 0; i != v8; ++i)
      {
        double v11 = *(double *)(a1 + 8 * i + 32);
        if (v9)
        {
          uint64_t v12 = *(void *)v2;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1B36DE588();
            uint64_t v12 = v18;
          }
          unint64_t v13 = *(void *)(v12 + 16);
          if (v13 >= *(void *)(v12 + 24) >> 1)
          {
            sub_1B36DE588();
            uint64_t v12 = v19;
          }
          *(void *)(v12 + 16) = v13 + 1;
          *(unsigned char *)(v12 + v13 + 32) = 44;
          *(void *)uint64_t v2 = v12;
        }
        if ((~*(void *)&v11 & 0x7FF0000000000000) != 0)
        {
          uint64_t v16 = sub_1B37A0B50();
          sub_1B36DC054(v16, v17);
        }
        else
        {
          if ((*(void *)&v11 & 0xFFFFFFFFFFFFFLL) != 0)
          {
            uint64_t v14 = "\"NaN\"";
            uint64_t v15 = 5;
          }
          else if (v11 >= 0.0)
          {
            uint64_t v14 = "\"Infinity\"";
            uint64_t v15 = 10;
          }
          else
          {
            uint64_t v14 = "\"-Infinity\"";
            uint64_t v15 = 11;
          }
          sub_1B36DBED8(v14, (char *)v15);
        }
        char v9 = 1;
      }
      swift_bridgeObjectRelease();
    }
    sub_1B374BB28();
    uint64_t v20 = *(void *)(*(void *)v2 + 16);
    uint64_t result = sub_1B374BA20(v20);
    uint64_t v21 = *(void *)v2;
    *(void *)(v21 + 16) = v20 + 1;
    *(unsigned char *)(v21 + v20 + 32) = 93;
    *(void *)uint64_t v2 = v21;
    v2[4] = 44;
  }
  return result;
}

uint64_t sub_1B379A0C4()
{
  OUTLINED_FUNCTION_17_15();
  return v0(v1, v2);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitPackedDoubleField(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_33_11();
  v2();
}

uint64_t sub_1B379A11C()
{
  return sub_1B379A33C();
}

uint64_t sub_1B379A148(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1B3759E50(a2);
  if (!v3)
  {
    sub_1B374BB28();
    uint64_t v6 = *(void *)(*(void *)v2 + 16);
    sub_1B374BA20(v6);
    uint64_t v7 = *(void *)v2;
    *(void *)(v7 + 16) = v6 + 1;
    *(unsigned char *)(v7 + v6 + 32) = 91;
    *(void *)uint64_t v2 = v7;
    v2[4] = 256;
    uint64_t v8 = *(void *)(a1 + 16);
    if (v8)
    {
      swift_bridgeObjectRetain();
      char v9 = 0;
      for (uint64_t i = 0; i != v8; ++i)
      {
        unint64_t v11 = *(int *)(a1 + 4 * i + 32);
        if (v9)
        {
          uint64_t v12 = *(void *)v2;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1B36DE588();
            uint64_t v12 = v16;
          }
          unint64_t v13 = *(void *)(v12 + 16);
          if (v13 >= *(void *)(v12 + 24) >> 1)
          {
            sub_1B36DE588();
            uint64_t v12 = v17;
          }
          *(void *)(v12 + 16) = v13 + 1;
          *(unsigned char *)(v12 + v13 + 32) = 44;
          *(void *)uint64_t v2 = v12;
        }
        if ((v11 & 0x80000000) != 0)
        {
          uint64_t v14 = *(void *)v2;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1B36DE588();
            uint64_t v14 = v18;
          }
          unint64_t v15 = *(void *)(v14 + 16);
          if (v15 >= *(void *)(v14 + 24) >> 1)
          {
            sub_1B36DE588();
            uint64_t v14 = v19;
          }
          *(void *)(v14 + 16) = v15 + 1;
          *(unsigned char *)(v14 + v15 + 32) = 45;
          *(void *)uint64_t v2 = v14;
          unint64_t v11 = -(uint64_t)v11;
        }
        sub_1B3758D08(v11);
        char v9 = 1;
      }
      swift_bridgeObjectRelease();
    }
    sub_1B374BB28();
    uint64_t v20 = *(void *)(*(void *)v2 + 16);
    uint64_t result = sub_1B374BA20(v20);
    uint64_t v21 = *(void *)v2;
    *(void *)(v21 + 16) = v20 + 1;
    *(unsigned char *)(v21 + v20 + 32) = 93;
    *(void *)uint64_t v2 = v21;
    v2[4] = 44;
  }
  return result;
}

uint64_t sub_1B379A33C()
{
  OUTLINED_FUNCTION_17_15();
  return v0(v1, v2);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitPackedInt32Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_40_9();
  v2();
}

uint64_t sub_1B379A394()
{
  return sub_1B379A33C();
}

uint64_t sub_1B379A3C0(uint64_t a1, uint64_t a2)
{
  int v5 = *((unsigned __int8 *)v2 + 56);
  uint64_t result = sub_1B3759E50(a2);
  if (v5 == 1)
  {
    if (v3) {
      return result;
    }
    sub_1B374BB28();
    uint64_t v7 = *(void *)(*v2 + 16);
    sub_1B374BA20(v7);
    uint64_t v8 = *v2;
    *(void *)(v8 + 16) = v7 + 1;
    *(unsigned char *)(v8 + v7 + 32) = 91;
    *uint64_t v2 = v8;
    *((_WORD *)v2 + 4) = 256;
    uint64_t v9 = *(void *)(a1 + 16);
    if (!v9) {
      goto LABEL_39;
    }
    swift_bridgeObjectRetain();
    char v10 = 0;
    for (uint64_t i = 0; i != v9; ++i)
    {
      unint64_t v12 = *(void *)(a1 + 8 * i + 32);
      if (v10)
      {
        uint64_t v13 = *v2;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1B36DE588();
          uint64_t v13 = v17;
        }
        unint64_t v14 = *(void *)(v13 + 16);
        if (v14 >= *(void *)(v13 + 24) >> 1)
        {
          sub_1B36DE588();
          uint64_t v13 = v18;
        }
        *(void *)(v13 + 16) = v14 + 1;
        *(unsigned char *)(v13 + v14 + 32) = 44;
        *uint64_t v2 = v13;
      }
      if ((v12 & 0x8000000000000000) != 0)
      {
        uint64_t v15 = *v2;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1B36DE588();
          uint64_t v15 = v19;
        }
        unint64_t v16 = *(void *)(v15 + 16);
        if (v16 >= *(void *)(v15 + 24) >> 1)
        {
          sub_1B36DE588();
          uint64_t v15 = v20;
        }
        *(void *)(v15 + 16) = v16 + 1;
        *(unsigned char *)(v15 + v16 + 32) = 45;
        *uint64_t v2 = v15;
        unint64_t v12 = -(uint64_t)v12;
      }
      sub_1B3758D08(v12);
      char v10 = 1;
    }
    goto LABEL_38;
  }
  if (v3) {
    return result;
  }
  sub_1B374BB28();
  uint64_t v21 = *(void *)(*v2 + 16);
  sub_1B374BA20(v21);
  uint64_t v22 = *v2;
  *(void *)(v22 + 16) = v21 + 1;
  *(unsigned char *)(v22 + v21 + 32) = 91;
  *uint64_t v2 = v22;
  *((_WORD *)v2 + 4) = 256;
  uint64_t v23 = *(void *)(a1 + 16);
  if (v23)
  {
    swift_bridgeObjectRetain();
    char v24 = 0;
    uint64_t v25 = 0;
    do
    {
      unint64_t v26 = *(void *)(a1 + 8 * v25 + 32);
      unint64_t v27 = *(void *)(v22 + 16);
      if (v24)
      {
        unint64_t v28 = v27 + 1;
        if (v27 >= *(void *)(v22 + 24) >> 1)
        {
          sub_1B36DE588();
          uint64_t v22 = v35;
        }
        *(void *)(v22 + 16) = v28;
        *(unsigned char *)(v22 + v27 + 32) = 44;
      }
      else
      {
        unint64_t v28 = *(void *)(v22 + 16);
      }
      unint64_t v29 = v28 + 1;
      if (v28 >= *(void *)(v22 + 24) >> 1)
      {
        sub_1B36DE588();
        uint64_t v22 = v32;
      }
      *(void *)(v22 + 16) = v29;
      *(unsigned char *)(v22 + v28 + 32) = 34;
      *uint64_t v2 = v22;
      if ((v26 & 0x8000000000000000) != 0)
      {
        uint64_t v30 = v28 + 2;
        if (v30 > *(void *)(v22 + 24) >> 1)
        {
          sub_1B36DE588();
          uint64_t v22 = v36;
        }
        *(void *)(v22 + 16) = v30;
        *(unsigned char *)(v22 + v29 + 32) = 45;
        *uint64_t v2 = v22;
        unint64_t v26 = -(uint64_t)v26;
      }
      sub_1B3758D08(v26);
      uint64_t v22 = *v2;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B36DE588();
        uint64_t v22 = v33;
      }
      unint64_t v31 = *(void *)(v22 + 16);
      if (v31 >= *(void *)(v22 + 24) >> 1)
      {
        sub_1B36DE588();
        uint64_t v22 = v34;
      }
      ++v25;
      *(void *)(v22 + 16) = v31 + 1;
      *(unsigned char *)(v22 + v31 + 32) = 34;
      *uint64_t v2 = v22;
      char v24 = 1;
    }
    while (v23 != v25);
LABEL_38:
    swift_bridgeObjectRelease();
  }
LABEL_39:
  sub_1B374BB28();
  uint64_t v37 = *(void *)(*v2 + 16);
  uint64_t result = sub_1B374BA20(v37);
  uint64_t v38 = *v2;
  *(void *)(v38 + 16) = v37 + 1;
  *(unsigned char *)(v38 + v37 + 32) = 93;
  *uint64_t v2 = v38;
  *((_WORD *)v2 + 4) = 44;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitPackedInt64Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_39_12();
  v2();
}

uint64_t sub_1B379A800(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1B3759E50(a2);
  if (!v3)
  {
    sub_1B374BB28();
    uint64_t v6 = *(void *)(*(void *)v2 + 16);
    sub_1B374BA20(v6);
    uint64_t v7 = *(void *)v2;
    *(void *)(v7 + 16) = v6 + 1;
    *(unsigned char *)(v7 + v6 + 32) = 91;
    *(void *)uint64_t v2 = v7;
    v2[4] = 256;
    uint64_t v8 = *(void *)(a1 + 16);
    if (v8)
    {
      swift_bridgeObjectRetain();
      char v9 = 0;
      for (uint64_t i = 0; i != v8; ++i)
      {
        unint64_t v11 = *(unsigned int *)(a1 + 4 * i + 32);
        if (v9)
        {
          uint64_t v12 = *(void *)v2;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1B36DE588();
            uint64_t v12 = v14;
          }
          unint64_t v13 = *(void *)(v12 + 16);
          if (v13 >= *(void *)(v12 + 24) >> 1)
          {
            sub_1B36DE588();
            uint64_t v12 = v15;
          }
          *(void *)(v12 + 16) = v13 + 1;
          *(unsigned char *)(v12 + v13 + 32) = 44;
          *(void *)uint64_t v2 = v12;
        }
        sub_1B3758D08(v11);
        char v9 = 1;
      }
      swift_bridgeObjectRelease();
    }
    sub_1B374BB28();
    uint64_t v16 = *(void *)(*(void *)v2 + 16);
    uint64_t result = sub_1B374BA20(v16);
    uint64_t v17 = *(void *)v2;
    *(void *)(v17 + 16) = v16 + 1;
    *(unsigned char *)(v17 + v16 + 32) = 93;
    *(void *)uint64_t v2 = v17;
    v2[4] = 44;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitPackedUInt32Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_38_12();
  v2();
}

uint64_t sub_1B379A9A4(uint64_t a1, uint64_t a2)
{
  int v5 = *((unsigned __int8 *)v2 + 56);
  uint64_t result = sub_1B3759E50(a2);
  if (v5 == 1)
  {
    if (v3) {
      return result;
    }
    sub_1B374BB28();
    uint64_t v7 = *(void *)(*v2 + 16);
    sub_1B374BA20(v7);
    uint64_t v8 = *v2;
    *(void *)(v8 + 16) = v7 + 1;
    *(unsigned char *)(v8 + v7 + 32) = 91;
    *uint64_t v2 = v8;
    *((_WORD *)v2 + 4) = 256;
    uint64_t v9 = *(void *)(a1 + 16);
    if (!v9) {
      goto LABEL_29;
    }
    swift_bridgeObjectRetain();
    char v10 = 0;
    for (uint64_t i = 0; i != v9; ++i)
    {
      unint64_t v12 = *(void *)(a1 + 8 * i + 32);
      if (v10)
      {
        uint64_t v13 = *v2;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1B36DE588();
          uint64_t v13 = v15;
        }
        unint64_t v14 = *(void *)(v13 + 16);
        if (v14 >= *(void *)(v13 + 24) >> 1)
        {
          sub_1B36DE588();
          uint64_t v13 = v16;
        }
        *(void *)(v13 + 16) = v14 + 1;
        *(unsigned char *)(v13 + v14 + 32) = 44;
        *uint64_t v2 = v13;
      }
      sub_1B3758D08(v12);
      char v10 = 1;
    }
    goto LABEL_28;
  }
  if (v3) {
    return result;
  }
  sub_1B374BB28();
  uint64_t v17 = *(void *)(*v2 + 16);
  sub_1B374BA20(v17);
  uint64_t v18 = *v2;
  *(void *)(v18 + 16) = v17 + 1;
  *(unsigned char *)(v18 + v17 + 32) = 91;
  *uint64_t v2 = v18;
  *((_WORD *)v2 + 4) = 256;
  uint64_t v19 = *(void *)(a1 + 16);
  if (v19)
  {
    swift_bridgeObjectRetain();
    char v20 = 0;
    uint64_t v21 = 0;
    do
    {
      unint64_t v22 = *(void *)(a1 + 8 * v21 + 32);
      unint64_t v23 = *(void *)(v18 + 16);
      if (v20)
      {
        unint64_t v24 = v23 + 1;
        if (v23 >= *(void *)(v18 + 24) >> 1)
        {
          sub_1B36DE588();
          uint64_t v18 = v29;
        }
        *(void *)(v18 + 16) = v24;
        *(unsigned char *)(v18 + v23 + 32) = 44;
      }
      else
      {
        unint64_t v24 = *(void *)(v18 + 16);
      }
      if (v24 >= *(void *)(v18 + 24) >> 1)
      {
        sub_1B36DE588();
        uint64_t v18 = v26;
      }
      *(void *)(v18 + 16) = v24 + 1;
      *(unsigned char *)(v18 + v24 + 32) = 34;
      *uint64_t v2 = v18;
      sub_1B3758D08(v22);
      uint64_t v18 = *v2;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B36DE588();
        uint64_t v18 = v27;
      }
      unint64_t v25 = *(void *)(v18 + 16);
      if (v25 >= *(void *)(v18 + 24) >> 1)
      {
        sub_1B36DE588();
        uint64_t v18 = v28;
      }
      ++v21;
      *(void *)(v18 + 16) = v25 + 1;
      *(unsigned char *)(v18 + v25 + 32) = 34;
      *uint64_t v2 = v18;
      char v20 = 1;
    }
    while (v19 != v21);
LABEL_28:
    swift_bridgeObjectRelease();
  }
LABEL_29:
  sub_1B374BB28();
  uint64_t v30 = *(void *)(*v2 + 16);
  uint64_t result = sub_1B374BA20(v30);
  uint64_t v31 = *v2;
  *(void *)(v31 + 16) = v30 + 1;
  *(unsigned char *)(v31 + v30 + 32) = 93;
  *uint64_t v2 = v31;
  *((_WORD *)v2 + 4) = 44;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitPackedUInt64Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_36_11();
  v2();
}

uint64_t sub_1B379AD1C()
{
  return sub_1B379ADC0();
}

uint64_t sub_1B379AD48(uint64_t a1, uint64_t a2)
{
  return sub_1B379A148(a1, a2);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitPackedSInt32Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_31_14();
  v2();
}

uint64_t sub_1B379AD7C()
{
  return sub_1B379ADC0();
}

uint64_t sub_1B379ADA8(uint64_t a1, uint64_t a2)
{
  return sub_1B379A3C0(a1, a2);
}

uint64_t sub_1B379ADC0()
{
  OUTLINED_FUNCTION_17_15();
  return v0(v1, v2);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitPackedSInt64Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_30_13();
  v2();
}

uint64_t sub_1B379AE18(uint64_t a1, uint64_t a2)
{
  return sub_1B379A800(a1, a2);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitPackedFixed32Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_43_10();
  v2();
}

uint64_t sub_1B379AE4C(uint64_t a1, uint64_t a2)
{
  return sub_1B379A9A4(a1, a2);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitPackedFixed64Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_42_8();
  v2();
}

uint64_t sub_1B379AE80()
{
  return sub_1B379A0C4();
}

uint64_t sub_1B379AEAC(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1B3759E50(a2);
  if (!v3)
  {
    sub_1B374BB28();
    uint64_t v6 = *(void *)(*(void *)v2 + 16);
    sub_1B374BA20(v6);
    uint64_t v7 = *(void *)v2;
    *(void *)(v7 + 16) = v6 + 1;
    *(unsigned char *)(v7 + v6 + 32) = 91;
    *(void *)uint64_t v2 = v7;
    v2[4] = 256;
    uint64_t v8 = *(void *)(a1 + 16);
    if (v8)
    {
      swift_bridgeObjectRetain();
      char v9 = 0;
      for (uint64_t i = 0; i != v8; ++i)
      {
        int v11 = *(unsigned __int8 *)(a1 + i + 32);
        if (v9)
        {
          uint64_t v12 = *(void *)v2;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1B36DE588();
            uint64_t v12 = v16;
          }
          unint64_t v13 = *(void *)(v12 + 16);
          if (v13 >= *(void *)(v12 + 24) >> 1)
          {
            sub_1B36DE588();
            uint64_t v12 = v17;
          }
          *(void *)(v12 + 16) = v13 + 1;
          *(unsigned char *)(v12 + v13 + 32) = 44;
          *(void *)uint64_t v2 = v12;
        }
        if (v11)
        {
          unint64_t v14 = "true";
          uint64_t v15 = 4;
        }
        else
        {
          unint64_t v14 = "false";
          uint64_t v15 = 5;
        }
        sub_1B36DBED8(v14, (char *)v15);
        char v9 = 1;
      }
      swift_bridgeObjectRelease();
    }
    sub_1B374BB28();
    uint64_t v18 = *(void *)(*(void *)v2 + 16);
    uint64_t result = sub_1B374BA20(v18);
    uint64_t v19 = *(void *)v2;
    *(void *)(v19 + 16) = v18 + 1;
    *(unsigned char *)(v19 + v18 + 32) = 93;
    *(void *)uint64_t v2 = v19;
    v2[4] = 44;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitPackedBoolField(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
  OUTLINED_FUNCTION_41_7();
  v2();
}

uint64_t sub_1B379B070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return OUTLINED_FUNCTION_27_14(a1, a2, a3, a4, a5, a6);
}

uint64_t Visitor.visitPackedEnumField<A>(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 272))(a1, a2, a4, a6, a3, a5);
}

uint64_t sub_1B379B0C4()
{
  return sub_1B36F069C();
}

uint64_t sub_1B379B0E0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379B0FC(*a1, a2, a3);
}

uint64_t sub_1B379B0FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B36F0068(v3, a2, a3, a1);
}

uint64_t sub_1B379B11C()
{
  return sub_1B36EFE90(v0);
}

uint64_t sub_1B379B13C()
{
  return sub_1B36EF6A0(v0);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitExtensionFieldsAsMessageSet(fields:start:end:)(InternalSwiftProtobuf::ExtensionFieldValueSet fields, Swift::Int start, Swift::Int end)
{
  uint64_t v4 = *(void *)fields.values._rawValue;
  (*(void (**)(uint64_t *, Swift::Int, Swift::Int))(v3 + 432))(&v4, start, end);
}

void sub_1B379B198(unint64_t a1, uint64_t a2)
{
}

void sub_1B379B1B0(unint64_t a1, uint64_t a2)
{
}

uint64_t sub_1B379B1C8(uint64_t a1, uint64_t a2)
{
  return sub_1B3799CCC(a1, a2);
}

uint64_t sub_1B379B1E0(uint64_t a1, uint64_t a2)
{
  return sub_1B3799EEC(a1, a2);
}

uint64_t sub_1B379B1F8(uint64_t a1, uint64_t a2)
{
  return sub_1B379AD48(a1, a2);
}

uint64_t sub_1B379B210(uint64_t a1, uint64_t a2)
{
  return sub_1B379ADA8(a1, a2);
}

uint64_t sub_1B379B228(uint64_t a1, uint64_t a2)
{
  return sub_1B379AE18(a1, a2);
}

uint64_t sub_1B379B240(uint64_t a1, uint64_t a2)
{
  return sub_1B379AE4C(a1, a2);
}

uint64_t sub_1B379B258(uint64_t a1, uint64_t a2)
{
  return sub_1B379AEAC(a1, a2);
}

uint64_t sub_1B379B270()
{
  return sub_1B36F0680();
}

uint64_t sub_1B379B28C()
{
  return sub_1B379B11C();
}

void sub_1B379B2A8(InternalSwiftProtobuf::ExtensionFieldValueSet a1, Swift::Int a2, Swift::Int a3)
{
}

void sub_1B379B2C0(InternalSwiftProtobuf::ExtensionFieldValueSet a1, Swift::Int a2, Swift::Int a3)
{
}

void sub_1B379B2D8(int a1, unint64_t a2)
{
}

uint64_t sub_1B379B2F0(unint64_t a1, unint64_t a2)
{
  return sub_1B3799B48(a1, a2);
}

void sub_1B379B308(unsigned int a1, unint64_t a2)
{
}

uint64_t sub_1B379B320(unint64_t a1, unint64_t a2)
{
  return sub_1B3799A28(a1, a2);
}

uint64_t sub_1B379B338()
{
  return sub_1B36F062C();
}

uint64_t sub_1B379B354()
{
  return sub_1B379B13C();
}

void sub_1B379B370(Swift::Int a1, Swift::Float a2)
{
}

void sub_1B379B388(Swift::Int32 a1, Swift::Int a2)
{
}

void sub_1B379B3A0(Swift::UInt32 a1, Swift::Int a2)
{
}

void sub_1B379B3B8(Swift::Int32 a1, Swift::Int a2)
{
}

void sub_1B379B3D0(Swift::Int64 a1, Swift::Int a2)
{
}

void sub_1B379B3E8(Swift::UInt32 a1, Swift::Int a2)
{
}

void sub_1B379B400(Swift::UInt64 a1, Swift::Int a2)
{
}

uint64_t sub_1B379B418(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Visitor.visitSingularGroupField<A>(value:fieldNumber:)(a1, a2, a5, a3, a6, a4);
}

void sub_1B379B444(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B45C(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B474(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B48C(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B4A4(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B4BC(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B4D4(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B4EC(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B504(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B51C(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B534(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B54C(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B564(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B57C(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B594(Swift::OpaquePointer a1, Swift::Int a2)
{
}

uint64_t sub_1B379B5AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Visitor.visitRepeatedEnumField<A>(value:fieldNumber:)(a1, a2, a5, a3, a6, a4);
}

uint64_t sub_1B379B5D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)(a1, a2, a5, a3, a6, a4);
}

uint64_t sub_1B379B604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Visitor.visitRepeatedGroupField<A>(value:fieldNumber:)(a1, a2, a5, a3, a6, a4);
}

void sub_1B379B630(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B648(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B660(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B678(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B690(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B6A8(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B6C0(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B6D8(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B6F0(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B708(Swift::OpaquePointer a1, Swift::Int a2)
{
}

void sub_1B379B720(Swift::OpaquePointer a1, Swift::Int a2)
{
}

uint64_t sub_1B379B738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Visitor.visitPackedEnumField<A>(value:fieldNumber:)(a1, a2, a5, a3, a6, a4);
}

void sub_1B379B764(InternalSwiftProtobuf::ExtensionFieldValueSet a1, Swift::Int a2, Swift::Int a3)
{
}

void sub_1B379B77C(InternalSwiftProtobuf::ExtensionFieldValueSet a1, Swift::Int a2, Swift::Int a3)
{
}

uint64_t dispatch thunk of Visitor.visitSingularFloatField(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of Visitor.visitSingularDoubleField(value:fieldNumber:)()
{
  OUTLINED_FUNCTION_32_12();
  return v0();
}

uint64_t dispatch thunk of Visitor.visitSingularInt32Field(value:fieldNumber:)()
{
  OUTLINED_FUNCTION_34_13();
  return v0();
}

uint64_t dispatch thunk of Visitor.visitSingularSInt32Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of Visitor.visitSingularFixed32Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of Visitor.visitSingularFixed64Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t dispatch thunk of Visitor.visitSingularSFixed32Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 88))();
}

uint64_t dispatch thunk of Visitor.visitSingularSFixed64Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t dispatch thunk of Visitor.visitSingularBoolField(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 104))();
}

uint64_t dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 112))();
}

uint64_t dispatch thunk of Visitor.visitSingularEnumField<A>(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 128))();
}

uint64_t dispatch thunk of Visitor.visitSingularGroupField<A>(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 144))();
}

uint64_t dispatch thunk of Visitor.visitRepeatedFloatField(value:fieldNumber:)()
{
  OUTLINED_FUNCTION_35_11();
  return v0();
}

uint64_t dispatch thunk of Visitor.visitRepeatedDoubleField(value:fieldNumber:)()
{
  OUTLINED_FUNCTION_33_11();
  return v0();
}

uint64_t dispatch thunk of Visitor.visitRepeatedInt32Field(value:fieldNumber:)()
{
  OUTLINED_FUNCTION_40_9();
  return v0();
}

uint64_t dispatch thunk of Visitor.visitRepeatedInt64Field(value:fieldNumber:)()
{
  OUTLINED_FUNCTION_39_12();
  return v0();
}

uint64_t dispatch thunk of Visitor.visitRepeatedUInt32Field(value:fieldNumber:)()
{
  OUTLINED_FUNCTION_38_12();
  return v0();
}

uint64_t dispatch thunk of Visitor.visitRepeatedUInt64Field(value:fieldNumber:)()
{
  OUTLINED_FUNCTION_36_11();
  return v0();
}

uint64_t dispatch thunk of Visitor.visitRepeatedSInt32Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 200))();
}

uint64_t dispatch thunk of Visitor.visitRepeatedSInt64Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 208))();
}

uint64_t dispatch thunk of Visitor.visitRepeatedFixed32Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 216))();
}

uint64_t dispatch thunk of Visitor.visitRepeatedFixed64Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 224))();
}

uint64_t dispatch thunk of Visitor.visitRepeatedSFixed32Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 232))();
}

uint64_t dispatch thunk of Visitor.visitRepeatedSFixed64Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 240))();
}

uint64_t dispatch thunk of Visitor.visitRepeatedBoolField(value:fieldNumber:)()
{
  OUTLINED_FUNCTION_41_7();
  return v0();
}

uint64_t dispatch thunk of Visitor.visitRepeatedStringField(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 256))();
}

uint64_t dispatch thunk of Visitor.visitRepeatedBytesField(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 264))();
}

uint64_t dispatch thunk of Visitor.visitRepeatedEnumField<A>(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 272))();
}

uint64_t dispatch thunk of Visitor.visitRepeatedGroupField<A>(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 288))();
}

uint64_t dispatch thunk of Visitor.visitPackedFloatField(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 296))();
}

uint64_t dispatch thunk of Visitor.visitPackedDoubleField(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 304))();
}

uint64_t dispatch thunk of Visitor.visitPackedInt32Field(value:fieldNumber:)()
{
  OUTLINED_FUNCTION_31_14();
  return v0();
}

uint64_t dispatch thunk of Visitor.visitPackedSInt32Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 344))();
}

uint64_t dispatch thunk of Visitor.visitPackedSInt64Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 352))();
}

uint64_t dispatch thunk of Visitor.visitPackedFixed32Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 360))();
}

uint64_t dispatch thunk of Visitor.visitPackedFixed64Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 368))();
}

uint64_t dispatch thunk of Visitor.visitPackedSFixed32Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 376))();
}

uint64_t dispatch thunk of Visitor.visitPackedSFixed64Field(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 384))();
}

uint64_t dispatch thunk of Visitor.visitPackedBoolField(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 392))();
}

uint64_t dispatch thunk of Visitor.visitPackedEnumField<A>(value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 400))();
}

uint64_t dispatch thunk of Visitor.visitMapField<A, B>(fieldType:value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 408))();
}

{
  return (*(uint64_t (**)(void))(a8 + 416))();
}

uint64_t dispatch thunk of Visitor.visitMapField<A, B>(fieldType:value:fieldNumber:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t))(a9 + 424))(a1);
}

uint64_t dispatch thunk of Visitor.visitExtensionFields(fields:start:end:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 432))();
}

uint64_t dispatch thunk of Visitor.visitExtensionFieldsAsMessageSet(fields:start:end:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 440))();
}

uint64_t dispatch thunk of Visitor.visitUnknown(bytes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 448))();
}

uint64_t sub_1B379BE64()
{
  uint64_t result = OUTLINED_FUNCTION_7_22();
  if (v0)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      v3 += 8;
      uint64_t result = sub_1B37A0E60();
      --v0;
    }
    while (v0);
  }
  return result;
}

uint64_t sub_1B379BEA4()
{
  uint64_t result = OUTLINED_FUNCTION_7_22();
  if (v0)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      v3 += 4;
      uint64_t result = sub_1B37A0E50();
      --v0;
    }
    while (v0);
  }
  return result;
}

uint64_t sub_1B379BEE4()
{
  uint64_t result = OUTLINED_FUNCTION_7_22();
  if (v0)
  {
    uint64_t v3 = (unint64_t *)(v1 + 40);
    do
    {
      uint64_t v4 = *(v3 - 1);
      unint64_t v5 = *v3;
      sub_1B36B9E20(v4, *v3);
      sub_1B37A0610();
      uint64_t result = sub_1B36C2E10(v4, v5);
      v3 += 2;
      --v0;
    }
    while (v0);
  }
  return result;
}

uint64_t sub_1B379BF54()
{
  uint64_t result = OUTLINED_FUNCTION_7_22();
  if (v0)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      v3 += 8;
      uint64_t result = sub_1B37A0E60();
      --v0;
    }
    while (v0);
  }
  return result;
}

uint64_t sub_1B379BF9C()
{
  uint64_t result = OUTLINED_FUNCTION_7_22();
  if (v0)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      v3 += 4;
      uint64_t result = sub_1B37A0E50();
      --v0;
    }
    while (v0);
  }
  return result;
}

uint64_t sub_1B379BFE4()
{
  uint64_t result = OUTLINED_FUNCTION_7_22();
  if (v0)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      ++v3;
      uint64_t result = sub_1B37A0E40();
      --v0;
    }
    while (v0);
  }
  return result;
}

uint64_t sub_1B379C024()
{
  uint64_t result = OUTLINED_FUNCTION_7_22();
  if (v0)
  {
    uint64_t v3 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_1B37A0870();
      uint64_t result = swift_bridgeObjectRelease();
      v3 += 16;
      --v0;
    }
    while (v0);
  }
  return result;
}

uint64_t sub_1B379C08C()
{
  uint64_t result = OUTLINED_FUNCTION_7_22();
  if (v0)
  {
    uint64_t v3 = v1 + 32;
    do
    {
      ++v3;
      uint64_t result = sub_1B37A0E30();
      --v0;
    }
    while (v0);
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitSingularSFixed32Field(value:fieldNumber:)(Swift::Int32 value, Swift::Int fieldNumber)
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitSingularSFixed64Field(value:fieldNumber:)(Swift::Int64 value, Swift::Int fieldNumber)
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitPackedSFixed32Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Visitor.visitPackedSFixed64Field(value:fieldNumber:)(Swift::OpaquePointer value, Swift::Int fieldNumber)
{
}

uint64_t sub_1B379C140()
{
  return sub_1B3790F50();
}

uint64_t sub_1B379C148()
{
  return sub_1B3797F68();
}

uint64_t sub_1B379C150()
{
  return sub_1B37910DC();
}

uint64_t sub_1B379C158@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1B36C3D78(*a1);
  *a2 = result;
  return result;
}

void sub_1B379C184(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t getEnumTagSinglePayload for WireFormat(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 5) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for WireFormat(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x1B379C2E4);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WireFormat()
{
  return &type metadata for WireFormat;
}

unint64_t sub_1B379C320()
{
  unint64_t result = qword_1E9CBB5B8;
  if (!qword_1E9CBB5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB5B8);
  }
  return result;
}

uint64_t sub_1B379C36C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379CB60(a1, a2, a3, (uint64_t)&type metadata for Google_Protobuf_Any, &qword_1E9CBB898);
}

uint64_t sub_1B379C380()
{
  return sub_1B379C5E0((uint64_t)&type metadata for Google_Protobuf_Api, &qword_1E9CBB890);
}

uint64_t sub_1B379C394()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C3CC()
{
  return sub_1B379C5E0((uint64_t)&type metadata for Google_Protobuf_Mixin, &qword_1E9CBB880);
}

uint64_t sub_1B379C3E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379CB60(a1, a2, a3, (uint64_t)&type metadata for Google_Protobuf_FileDescriptorSet, &qword_1E9CBB878);
}

uint64_t sub_1B379C3F4()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C42C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379CB60(a1, a2, a3, (uint64_t)&type metadata for Google_Protobuf_DescriptorProto, &qword_1E9CBB868);
}

uint64_t sub_1B379C440()
{
  return sub_1B379C5E0((uint64_t)&type metadata for Google_Protobuf_DescriptorProto.ExtensionRange, &qword_1E9CBB860);
}

uint64_t sub_1B379C454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B379C9E4(a1, a2, a3, a4, (uint64_t)&type metadata for Google_Protobuf_DescriptorProto.ReservedRange, &qword_1E9CBB858);
}

uint64_t sub_1B379C468()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C4A0()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C4D8()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C510()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C548()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B379C9E4(a1, a2, a3, a4, (uint64_t)&type metadata for Google_Protobuf_EnumDescriptorProto.EnumReservedRange, &qword_1E9CBB828);
}

uint64_t sub_1B379C594()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C5CC()
{
  return sub_1B379C5E0((uint64_t)&type metadata for Google_Protobuf_ServiceDescriptorProto, &qword_1E9CBB818);
}

uint64_t sub_1B379C5E0(uint64_t a1, uint64_t *a2)
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C604()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C63C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B379C9E4(a1, a2, a3, a4, (uint64_t)&type metadata for Google_Protobuf_FileOptions, &qword_1E9CBB808);
}

uint64_t sub_1B379C650()
{
  return sub_1B379C5E0((uint64_t)&type metadata for Google_Protobuf_MessageOptions, &qword_1E9CBB800);
}

uint64_t sub_1B379C664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B379C9E4(a1, a2, a3, a4, (uint64_t)&type metadata for Google_Protobuf_FieldOptions, &qword_1E9CBB7F8);
}

uint64_t sub_1B379C678()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C6B0()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C6E8()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C720()
{
  return sub_1B379C5E0((uint64_t)&type metadata for Google_Protobuf_EnumOptions, &qword_1E9CBB7D8);
}

uint64_t sub_1B379C734()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C76C()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C7A4()
{
  return sub_1B379C5E0((uint64_t)&type metadata for Google_Protobuf_MethodOptions, &qword_1E9CBB7C0);
}

uint64_t sub_1B379C7B8()
{
  return sub_1B379C5E0((uint64_t)&type metadata for Google_Protobuf_UninterpretedOption, &qword_1E9CBB7B8);
}

uint64_t sub_1B379C7CC()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B379C9E4(a1, a2, a3, a4, (uint64_t)&type metadata for Google_Protobuf_FeatureSet, &qword_1E9CBB7A8);
}

uint64_t sub_1B379C818()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C850()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379CB60(a1, a2, a3, (uint64_t)&type metadata for Google_Protobuf_SourceCodeInfo, &qword_1E9CBB790);
}

uint64_t sub_1B379C89C()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C8D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379CB60(a1, a2, a3, (uint64_t)&type metadata for Google_Protobuf_GeneratedCodeInfo, &qword_1E9CBB780);
}

uint64_t sub_1B379C8E8()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B379C9E4(a1, a2, a3, a4, (uint64_t)&type metadata for Google_Protobuf_Duration, &qword_1E9CBB770);
}

uint64_t sub_1B379C934()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379C96C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379CB60(a1, a2, a3, (uint64_t)&type metadata for Google_Protobuf_FieldMask, &qword_1E9CBB760);
}

uint64_t sub_1B379C980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B379C9E4(a1, a2, a3, a4, (uint64_t)&type metadata for Google_Protobuf_SourceContext, &qword_1E9CBB758);
}

uint64_t sub_1B379C994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379CB60(a1, a2, a3, (uint64_t)&type metadata for Google_Protobuf_Struct, &qword_1E9CBB750);
}

uint64_t sub_1B379C9A8()
{
  return sub_1B379C5E0((uint64_t)&type metadata for Google_Protobuf_Value, &qword_1E9CBB748);
}

uint64_t sub_1B379C9BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379CB60(a1, a2, a3, (uint64_t)&type metadata for Google_Protobuf_ListValue, &qword_1E9CBB740);
}

uint64_t sub_1B379C9D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B379C9E4(a1, a2, a3, a4, (uint64_t)&type metadata for Google_Protobuf_Timestamp, &qword_1EB593378);
}

uint64_t sub_1B379C9E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379CA10()
{
  return sub_1B379C5E0((uint64_t)&type metadata for Google_Protobuf_Type, &qword_1E9CBB738);
}

uint64_t sub_1B379CA24()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379CA5C()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379CA94()
{
  return sub_1B379C5E0((uint64_t)&type metadata for Google_Protobuf_EnumValue, &qword_1E9CBB720);
}

uint64_t sub_1B379CAA8()
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379CAE0()
{
  return sub_1B37A0800();
}

uint64_t sub_1B379CB20()
{
  return sub_1B37A0800();
}

uint64_t sub_1B379CB60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return OUTLINED_FUNCTION_2_27();
}

uint64_t sub_1B379CB8C()
{
  return sub_1B37A0800();
}

void sub_1B379CBCC(int a1, unint64_t a2)
{
  unint64_t v3 = a1;
  sub_1B3786FB4(a2);
  sub_1B37588B4(": ", (char *)2, 2);
  sub_1B37854E8(v3);
  sub_1B374BB28();
  sub_1B374BA20(*(void *)(*(void *)v2 + 16));
  OUTLINED_FUNCTION_0_32();
}

void sub_1B379CC2C(int a1, int a2)
{
  unint64_t v2 = a1;
  sub_1B36C40EC(a2, 0);
  sub_1B36C40B8(v2);
}

void sub_1B379CC74(unsigned int a1, unint64_t a2)
{
  unint64_t v3 = a1;
  sub_1B3786FB4(a2);
  sub_1B37588B4(": ", (char *)2, 2);
  sub_1B3785334(v3);
  sub_1B374BB28();
  sub_1B374BA20(*(void *)(*(void *)v2 + 16));
  OUTLINED_FUNCTION_0_32();
}

double Google_Protobuf_DoubleValue.value.getter()
{
  return *(double *)v0;
}

void Google_Protobuf_DoubleValue.value.setter(double a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*Google_Protobuf_DoubleValue.value.modify())(void)
{
  return nullsub_1;
}

void Google_Protobuf_FloatValue.init()(_DWORD *a1@<X8>)
{
  *a1 = 0;
  OUTLINED_FUNCTION_1_19((uint64_t)a1, (__n128)xmmword_1B37A12E0);
}

float Google_Protobuf_FloatValue.value.getter()
{
  return *(float *)v0;
}

void Google_Protobuf_FloatValue.value.setter(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*Google_Protobuf_FloatValue.value.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_Int64Value.value.getter()
{
  return *(void *)v0;
}

uint64_t Google_Protobuf_Int64Value.value.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*Google_Protobuf_Int64Value.value.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_UInt64Value.value.getter()
{
  return *(void *)v0;
}

uint64_t (*Google_Protobuf_UInt64Value.value.modify())(void)
{
  return nullsub_1;
}

void Google_Protobuf_Int32Value.init()(_DWORD *a1@<X8>)
{
  *a1 = 0;
  OUTLINED_FUNCTION_1_19((uint64_t)a1, (__n128)xmmword_1B37A12E0);
}

uint64_t Google_Protobuf_Int32Value.value.getter()
{
  return *v0;
}

uint64_t Google_Protobuf_Int32Value.value.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*Google_Protobuf_Int32Value.value.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_UInt32Value.value.getter()
{
  return *v0;
}

uint64_t (*Google_Protobuf_UInt32Value.value.modify())(void)
{
  return nullsub_1;
}

void Google_Protobuf_BoolValue.init()(unsigned char *a1@<X8>)
{
  *a1 = 0;
  OUTLINED_FUNCTION_1_19((uint64_t)a1, (__n128)xmmword_1B37A12E0);
}

uint64_t Google_Protobuf_BoolValue.value.getter()
{
  return *v0;
}

uint64_t Google_Protobuf_BoolValue.value.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*Google_Protobuf_BoolValue.value.modify())(void)
{
  return nullsub_1;
}

double Google_Protobuf_StringValue.init()@<D0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = xmmword_1B37A12E0;
  return result;
}

uint64_t Google_Protobuf_StringValue.value.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Google_Protobuf_StringValue.value.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*Google_Protobuf_StringValue.value.modify())(void)
{
  return nullsub_1;
}

double Google_Protobuf_BytesValue.init()@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = xmmword_1B37A12E0;
  a1[1] = xmmword_1B37A12E0;
  return result;
}

uint64_t Google_Protobuf_BytesValue.value.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_1B36B9E20(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t Google_Protobuf_BytesValue.value.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1B36C2E10(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*Google_Protobuf_BytesValue.value.modify())(void)
{
  return nullsub_1;
}

uint64_t (*Google_Protobuf_DoubleValue.unknownFields.modify())(void)
{
  return nullsub_1;
}

uint64_t (*Google_Protobuf_FloatValue.unknownFields.modify())(void)
{
  return nullsub_1;
}

uint64_t (*Google_Protobuf_Int64Value.unknownFields.modify())(void)
{
  return nullsub_1;
}

uint64_t (*Google_Protobuf_UInt64Value.unknownFields.modify())(void)
{
  return nullsub_1;
}

uint64_t (*Google_Protobuf_Int32Value.unknownFields.modify())(void)
{
  return nullsub_1;
}

uint64_t (*Google_Protobuf_UInt32Value.unknownFields.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_BoolValue.unknownFields.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_46(*(void *)(v1 + 8), *(void *)(v1 + 16), a1);
}

uint64_t (*Google_Protobuf_BoolValue.unknownFields.modify())(void)
{
  return nullsub_1;
}

uint64_t (*Google_Protobuf_StringValue.unknownFields.modify())(void)
{
  return nullsub_1;
}

uint64_t Google_Protobuf_BytesValue.unknownFields.getter@<X0>(uint64_t *a1@<X8>)
{
  return OUTLINED_FUNCTION_46(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t _s21InternalSwiftProtobuf07Google_C12_StringValueV13unknownFieldsAA14UnknownStorageVvs_0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_1B36C2E10(*(void *)(v1 + 16), *(void *)(v1 + 24));
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v3;
  return result;
}

uint64_t (*Google_Protobuf_BytesValue.unknownFields.modify())(void)
{
  return nullsub_1;
}

unint64_t static Google_Protobuf_DoubleValue.protoMessageName.getter()
{
  return OUTLINED_FUNCTION_12_17();
}

uint64_t sub_1B379D11C()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BF9E18, qword_1E9CB92F0);
}

uint64_t static Google_Protobuf_DoubleValue._protobuf_nameMap.getter()
{
  if (qword_1E9CB9310 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CB92F0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void Google_Protobuf_DoubleValue.decodeMessage<A>(decoder:)()
{
  OUTLINED_FUNCTION_316();
  uint64_t v4 = OUTLINED_FUNCTION_26_3(v2, v3);
  uint64_t v5 = v1(v4);
  if (!v0)
  {
    while ((v6 & 1) == 0)
    {
      if (v5 == 1)
      {
        uint64_t v7 = OUTLINED_FUNCTION_5_25();
        v8(v7);
      }
      uint64_t v9 = OUTLINED_FUNCTION_128();
      uint64_t v5 = v1(v9);
    }
  }
  OUTLINED_FUNCTION_324();
}

uint64_t Google_Protobuf_DoubleValue.traverse<A>(visitor:)()
{
  OUTLINED_FUNCTION_302();
  if (!*v0) {
    return OUTLINED_FUNCTION_8_20();
  }
  uint64_t v2 = OUTLINED_FUNCTION_27_15();
  uint64_t result = v3(v2);
  if (!v1) {
    return OUTLINED_FUNCTION_8_20();
  }
  return result;
}

uint64_t static Google_Protobuf_DoubleValue.== infix(_:_:)(double *a1, double *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  OUTLINED_FUNCTION_14_17((uint64_t)a1);
  OUTLINED_FUNCTION_404();
  OUTLINED_FUNCTION_13_15();
  OUTLINED_FUNCTION_18_16();
  OUTLINED_FUNCTION_88();
  return v2 & 1;
}

uint64_t Google_Protobuf_DoubleValue.hashValue.getter()
{
  return sub_1B37A0E80();
}

unint64_t sub_1B379D340()
{
  return 0xD00000000000001BLL;
}

void sub_1B379D368()
{
}

uint64_t sub_1B379D380()
{
  return Google_Protobuf_DoubleValue.traverse<A>(visitor:)();
}

uint64_t sub_1B379D39C()
{
  return sub_1B379CAE0();
}

uint64_t sub_1B379D3AC()
{
  return sub_1B37A0E80();
}

unint64_t static Google_Protobuf_FloatValue.protoMessageName.getter()
{
  return OUTLINED_FUNCTION_11_19();
}

uint64_t sub_1B379D414()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BF9D10, qword_1E9CB9108);
}

uint64_t static Google_Protobuf_FloatValue._protobuf_nameMap.getter()
{
  if (qword_1E9CB9128 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CB9108);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void Google_Protobuf_FloatValue.decodeMessage<A>(decoder:)()
{
  OUTLINED_FUNCTION_316();
  uint64_t v4 = OUTLINED_FUNCTION_26_3(v2, v3);
  uint64_t v5 = v1(v4);
  if (!v0)
  {
    while ((v6 & 1) == 0)
    {
      if (v5 == 1)
      {
        uint64_t v7 = OUTLINED_FUNCTION_5_25();
        v8(v7);
      }
      uint64_t v9 = OUTLINED_FUNCTION_128();
      uint64_t v5 = v1(v9);
    }
  }
  OUTLINED_FUNCTION_324();
}

uint64_t Google_Protobuf_FloatValue.traverse<A>(visitor:)()
{
  OUTLINED_FUNCTION_302();
  if (!*v0) {
    return OUTLINED_FUNCTION_8_20();
  }
  uint64_t v2 = OUTLINED_FUNCTION_27_15();
  uint64_t result = v3(v2);
  if (!v1) {
    return OUTLINED_FUNCTION_8_20();
  }
  return result;
}

uint64_t static Google_Protobuf_FloatValue.== infix(_:_:)(float *a1, float *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  OUTLINED_FUNCTION_14_17((uint64_t)a1);
  OUTLINED_FUNCTION_404();
  OUTLINED_FUNCTION_13_15();
  OUTLINED_FUNCTION_18_16();
  OUTLINED_FUNCTION_88();
  return v2 & 1;
}

uint64_t Google_Protobuf_FloatValue.hashValue.getter()
{
  return sub_1B37A0E80();
}

unint64_t sub_1B379D638()
{
  return 0xD00000000000001ALL;
}

void sub_1B379D658()
{
}

uint64_t sub_1B379D670()
{
  return Google_Protobuf_FloatValue.traverse<A>(visitor:)();
}

uint64_t sub_1B379D68C()
{
  return sub_1B379CB20();
}

uint64_t sub_1B379D69C()
{
  return sub_1B37A0E80();
}

unint64_t static Google_Protobuf_Int64Value.protoMessageName.getter()
{
  return OUTLINED_FUNCTION_11_19();
}

uint64_t sub_1B379D704()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BF9DC0, qword_1E9CBB5C0);
}

uint64_t static Google_Protobuf_Int64Value._protobuf_nameMap.getter()
{
  if (qword_1E9CB9638 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CBB5C0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void Google_Protobuf_Int64Value.decodeMessage<A>(decoder:)()
{
  OUTLINED_FUNCTION_316();
  uint64_t v4 = OUTLINED_FUNCTION_26_3(v2, v3);
  uint64_t v5 = v1(v4);
  if (!v0)
  {
    while ((v6 & 1) == 0)
    {
      if (v5 == 1)
      {
        uint64_t v7 = OUTLINED_FUNCTION_5_25();
        v8(v7);
      }
      uint64_t v9 = OUTLINED_FUNCTION_128();
      uint64_t v5 = v1(v9);
    }
  }
  OUTLINED_FUNCTION_324();
}

uint64_t Google_Protobuf_Int64Value.traverse<A>(visitor:)()
{
  OUTLINED_FUNCTION_29_15();
  if (!v1) {
    return OUTLINED_FUNCTION_6_24();
  }
  OUTLINED_FUNCTION_10_21();
  uint64_t result = v2();
  if (!v0) {
    return OUTLINED_FUNCTION_6_24();
  }
  return result;
}

unint64_t sub_1B379D868()
{
  return 0xD00000000000001ALL;
}

void sub_1B379D888()
{
}

uint64_t sub_1B379D8A0()
{
  return Google_Protobuf_Int64Value.traverse<A>(visitor:)();
}

uint64_t sub_1B379D8BC()
{
  return sub_1B379CB60(*v0, v0[1], v0[2], (uint64_t)&type metadata for Google_Protobuf_Int64Value, &qword_1E9CBB700);
}

unint64_t static Google_Protobuf_UInt64Value.protoMessageName.getter()
{
  return OUTLINED_FUNCTION_12_17();
}

uint64_t sub_1B379D904()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BFA600, qword_1E9CBB5E0);
}

uint64_t static Google_Protobuf_UInt64Value._protobuf_nameMap.getter()
{
  if (qword_1E9CB9640 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CBB5E0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void Google_Protobuf_UInt64Value.decodeMessage<A>(decoder:)()
{
  OUTLINED_FUNCTION_316();
  uint64_t v4 = OUTLINED_FUNCTION_26_3(v2, v3);
  uint64_t v5 = v1(v4);
  if (!v0)
  {
    while ((v6 & 1) == 0)
    {
      if (v5 == 1)
      {
        uint64_t v7 = OUTLINED_FUNCTION_5_25();
        v8(v7);
      }
      uint64_t v9 = OUTLINED_FUNCTION_128();
      uint64_t v5 = v1(v9);
    }
  }
  OUTLINED_FUNCTION_324();
}

uint64_t Google_Protobuf_UInt64Value.traverse<A>(visitor:)()
{
  OUTLINED_FUNCTION_29_15();
  if (!v1) {
    return OUTLINED_FUNCTION_6_24();
  }
  OUTLINED_FUNCTION_10_21();
  uint64_t result = v2();
  if (!v0) {
    return OUTLINED_FUNCTION_6_24();
  }
  return result;
}

uint64_t _s21InternalSwiftProtobuf07Google_C11_Int64ValueV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  OUTLINED_FUNCTION_14_17((uint64_t)a1);
  OUTLINED_FUNCTION_404();
  OUTLINED_FUNCTION_13_15();
  OUTLINED_FUNCTION_18_16();
  OUTLINED_FUNCTION_88();
  return v2 & 1;
}

uint64_t _s21InternalSwiftProtobuf07Google_C11_Int64ValueV04hashF0Sivg_0()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  unint64_t v3 = v0[2];
  int v4 = sub_1B37A0E20();
  uint64_t v12 = OUTLINED_FUNCTION_1_35(v4, v5, v6, v7, v8, v9, v10, v11, v23, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34,
          v35,
          v36,
          v37,
          v38);
  OUTLINED_FUNCTION_3_26((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, v24);
  if (v2)
  {
    OUTLINED_FUNCTION_31_15();
    OUTLINED_FUNCTION_38_13();
  }
  switch(v3 >> 62)
  {
    case 1uLL:
      OUTLINED_FUNCTION_28_14();
      goto LABEL_8;
    case 2uLL:
      uint64_t v20 = *(void *)(v1 + 16);
      uint64_t v21 = *(void *)(v1 + 24);
LABEL_8:
      if (v20 == v21) {
        return OUTLINED_FUNCTION_9_22();
      }
      OUTLINED_FUNCTION_32_13();
LABEL_10:
      OUTLINED_FUNCTION_17_16();
LABEL_11:
      OUTLINED_FUNCTION_33_12();
      return OUTLINED_FUNCTION_9_22();
    case 3uLL:
      goto LABEL_11;
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
  }
}

unint64_t sub_1B379DB80()
{
  return 0xD00000000000001BLL;
}

void sub_1B379DBA0()
{
}

uint64_t sub_1B379DBB8()
{
  return Google_Protobuf_UInt64Value.traverse<A>(visitor:)();
}

uint64_t sub_1B379DBD4()
{
  return sub_1B379CB60(*v0, v0[1], v0[2], (uint64_t)&type metadata for Google_Protobuf_UInt64Value, &qword_1E9CBB6F8);
}

uint64_t sub_1B379DC04()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  unint64_t v3 = v0[2];
  int v4 = sub_1B37A0E20();
  uint64_t v12 = OUTLINED_FUNCTION_1_35(v4, v5, v6, v7, v8, v9, v10, v11, v23, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34,
          v35,
          v36,
          v37,
          v38);
  OUTLINED_FUNCTION_3_26((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, v24);
  if (v2)
  {
    OUTLINED_FUNCTION_31_15();
    OUTLINED_FUNCTION_38_13();
  }
  switch(v3 >> 62)
  {
    case 1uLL:
      OUTLINED_FUNCTION_28_14();
      goto LABEL_8;
    case 2uLL:
      uint64_t v20 = *(void *)(v1 + 16);
      uint64_t v21 = *(void *)(v1 + 24);
LABEL_8:
      if (v20 == v21) {
        return OUTLINED_FUNCTION_9_22();
      }
      OUTLINED_FUNCTION_32_13();
LABEL_10:
      OUTLINED_FUNCTION_17_16();
LABEL_11:
      OUTLINED_FUNCTION_33_12();
      return OUTLINED_FUNCTION_9_22();
    case 3uLL:
      goto LABEL_11;
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
  }
}

unint64_t static Google_Protobuf_Int32Value.protoMessageName.getter()
{
  return OUTLINED_FUNCTION_11_19();
}

uint64_t sub_1B379DCCC()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BF9D68, qword_1E9CB9138);
}

uint64_t static Google_Protobuf_Int32Value._protobuf_nameMap.getter()
{
  if (qword_1E9CB9158 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CB9138);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void Google_Protobuf_Int32Value.decodeMessage<A>(decoder:)()
{
  OUTLINED_FUNCTION_316();
  uint64_t v4 = OUTLINED_FUNCTION_26_3(v2, v3);
  uint64_t v5 = v1(v4);
  if (!v0)
  {
    while ((v6 & 1) == 0)
    {
      if (v5 == 1)
      {
        uint64_t v7 = OUTLINED_FUNCTION_5_25();
        v8(v7);
      }
      uint64_t v9 = OUTLINED_FUNCTION_128();
      uint64_t v5 = v1(v9);
    }
  }
  OUTLINED_FUNCTION_324();
}

uint64_t Google_Protobuf_Int32Value.traverse<A>(visitor:)()
{
  OUTLINED_FUNCTION_30_14();
  if (!v1) {
    return OUTLINED_FUNCTION_6_24();
  }
  OUTLINED_FUNCTION_10_21();
  uint64_t result = v2();
  if (!v0) {
    return OUTLINED_FUNCTION_6_24();
  }
  return result;
}

uint64_t Google_Protobuf_Int32Value.hashValue.getter()
{
  int v3 = *v1;
  int v4 = OUTLINED_FUNCTION_36_12();
  uint64_t v12 = OUTLINED_FUNCTION_1_35(v4, v5, v6, v7, v8, v9, v10, v11, v23, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34,
          v35,
          v36,
          v37,
          v38);
  OUTLINED_FUNCTION_3_26((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, v24);
  if (v3)
  {
    OUTLINED_FUNCTION_31_15();
    OUTLINED_FUNCTION_38_13();
  }
  switch(v2 >> 62)
  {
    case 1uLL:
      OUTLINED_FUNCTION_28_14();
      goto LABEL_8;
    case 2uLL:
      uint64_t v20 = *(void *)(v0 + 16);
      uint64_t v21 = *(void *)(v0 + 24);
LABEL_8:
      if (v20 == v21) {
        return OUTLINED_FUNCTION_9_22();
      }
      OUTLINED_FUNCTION_32_13();
LABEL_10:
      OUTLINED_FUNCTION_17_16();
LABEL_11:
      OUTLINED_FUNCTION_33_12();
      return OUTLINED_FUNCTION_9_22();
    case 3uLL:
      goto LABEL_11;
    default:
      if ((v2 & 0xFF000000000000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
  }
}

unint64_t sub_1B379DEE0()
{
  return 0xD00000000000001ALL;
}

void sub_1B379DF00()
{
}

uint64_t sub_1B379DF18()
{
  return Google_Protobuf_Int32Value.traverse<A>(visitor:)();
}

uint64_t sub_1B379DF34()
{
  return sub_1B379CB60(*v0, *((void *)v0 + 1), *((void *)v0 + 2), (uint64_t)&type metadata for Google_Protobuf_Int32Value, &qword_1E9CBB6F0);
}

uint64_t sub_1B379DF68()
{
  int v1 = *v0;
  uint64_t v2 = *((void *)v0 + 1);
  unint64_t v3 = *((void *)v0 + 2);
  sub_1B37A0E20();
  memcpy(__dst, __src, 0x48uLL);
  long long v7 = __src[0];
  long long v8 = __src[1];
  long long v9 = __src[2];
  long long v10 = __src[3];
  uint64_t v11 = *(void *)&__src[4];
  if (v1)
  {
    sub_1B37A0E30();
    sub_1B37A0E60();
  }
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v4 = (int)v2;
      uint64_t v5 = v2 >> 32;
      goto LABEL_8;
    case 2uLL:
      uint64_t v4 = *(void *)(v2 + 16);
      uint64_t v5 = *(void *)(v2 + 24);
LABEL_8:
      if (v4 == v5) {
        goto LABEL_12;
      }
      sub_1B36B9E20(v2, v3);
LABEL_10:
      sub_1B37A0610();
LABEL_11:
      sub_1B36C2E10(v2, v3);
LABEL_12:
      __dst[0] = v7;
      __dst[1] = v8;
      __dst[2] = v9;
      __dst[3] = v10;
      *(void *)&__dst[4] = v11;
      return sub_1B37A0E80();
    case 3uLL:
      goto LABEL_11;
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
  }
}

unint64_t static Google_Protobuf_UInt32Value.protoMessageName.getter()
{
  return OUTLINED_FUNCTION_12_17();
}

uint64_t sub_1B379E0C0()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BFA5A8, qword_1E9CB9338);
}

uint64_t static Google_Protobuf_UInt32Value._protobuf_nameMap.getter()
{
  if (qword_1E9CB9358 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CB9338);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void Google_Protobuf_UInt32Value.decodeMessage<A>(decoder:)()
{
  OUTLINED_FUNCTION_316();
  uint64_t v4 = OUTLINED_FUNCTION_26_3(v2, v3);
  uint64_t v5 = v1(v4);
  if (!v0)
  {
    while ((v6 & 1) == 0)
    {
      if (v5 == 1)
      {
        uint64_t v7 = OUTLINED_FUNCTION_5_25();
        v8(v7);
      }
      uint64_t v9 = OUTLINED_FUNCTION_128();
      uint64_t v5 = v1(v9);
    }
  }
  OUTLINED_FUNCTION_324();
}

uint64_t Google_Protobuf_UInt32Value.traverse<A>(visitor:)()
{
  OUTLINED_FUNCTION_30_14();
  if (!v1) {
    return OUTLINED_FUNCTION_6_24();
  }
  OUTLINED_FUNCTION_10_21();
  uint64_t result = v2();
  if (!v0) {
    return OUTLINED_FUNCTION_6_24();
  }
  return result;
}

uint64_t _s21InternalSwiftProtobuf07Google_C11_Int32ValueV2eeoiySbAC_ACtFZ_0(_DWORD *a1, _DWORD *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  OUTLINED_FUNCTION_14_17((uint64_t)a1);
  OUTLINED_FUNCTION_404();
  OUTLINED_FUNCTION_13_15();
  OUTLINED_FUNCTION_18_16();
  OUTLINED_FUNCTION_88();
  return v2 & 1;
}

uint64_t Google_Protobuf_UInt32Value.hashValue.getter()
{
  int v3 = *v1;
  int v4 = OUTLINED_FUNCTION_36_12();
  uint64_t v12 = OUTLINED_FUNCTION_1_35(v4, v5, v6, v7, v8, v9, v10, v11, v23, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34,
          v35,
          v36,
          v37,
          v38);
  OUTLINED_FUNCTION_3_26((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, v24);
  if (v3)
  {
    OUTLINED_FUNCTION_31_15();
    OUTLINED_FUNCTION_38_13();
  }
  switch(v2 >> 62)
  {
    case 1uLL:
      OUTLINED_FUNCTION_28_14();
      goto LABEL_8;
    case 2uLL:
      uint64_t v20 = *(void *)(v0 + 16);
      uint64_t v21 = *(void *)(v0 + 24);
LABEL_8:
      if (v20 == v21) {
        return OUTLINED_FUNCTION_9_22();
      }
      OUTLINED_FUNCTION_32_13();
LABEL_10:
      OUTLINED_FUNCTION_17_16();
LABEL_11:
      OUTLINED_FUNCTION_33_12();
      return OUTLINED_FUNCTION_9_22();
    case 3uLL:
      goto LABEL_11;
    default:
      if ((v2 & 0xFF000000000000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
  }
}

unint64_t sub_1B379E32C()
{
  return 0xD00000000000001BLL;
}

void sub_1B379E34C()
{
}

uint64_t sub_1B379E364()
{
  return Google_Protobuf_UInt32Value.traverse<A>(visitor:)();
}

uint64_t sub_1B379E380()
{
  return sub_1B379CB60(*v0, *((void *)v0 + 1), *((void *)v0 + 2), (uint64_t)&type metadata for Google_Protobuf_UInt32Value, &qword_1E9CBB6E8);
}

uint64_t sub_1B379E3B4()
{
  int v1 = *v0;
  uint64_t v2 = *((void *)v0 + 1);
  unint64_t v3 = *((void *)v0 + 2);
  sub_1B37A0E20();
  memcpy(__dst, __src, 0x48uLL);
  long long v7 = __src[0];
  long long v8 = __src[1];
  long long v9 = __src[2];
  long long v10 = __src[3];
  uint64_t v11 = *(void *)&__src[4];
  if (v1)
  {
    sub_1B37A0E30();
    sub_1B37A0E60();
  }
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v4 = (int)v2;
      uint64_t v5 = v2 >> 32;
      goto LABEL_8;
    case 2uLL:
      uint64_t v4 = *(void *)(v2 + 16);
      uint64_t v5 = *(void *)(v2 + 24);
LABEL_8:
      if (v4 == v5) {
        goto LABEL_12;
      }
      sub_1B36B9E20(v2, v3);
LABEL_10:
      sub_1B37A0610();
LABEL_11:
      sub_1B36C2E10(v2, v3);
LABEL_12:
      __dst[0] = v7;
      __dst[1] = v8;
      __dst[2] = v9;
      __dst[3] = v10;
      *(void *)&__dst[4] = v11;
      return sub_1B37A0E80();
    case 3uLL:
      goto LABEL_11;
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
  }
}

unint64_t static Google_Protobuf_BoolValue.protoMessageName.getter()
{
  return 0xD000000000000019;
}

uint64_t sub_1B379E518()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BF8C58, qword_1E9CBB600);
}

uint64_t static Google_Protobuf_BoolValue._protobuf_nameMap.getter()
{
  if (qword_1E9CB9648 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CBB600);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void Google_Protobuf_BoolValue.decodeMessage<A>(decoder:)()
{
  OUTLINED_FUNCTION_316();
  uint64_t v4 = OUTLINED_FUNCTION_26_3(v2, v3);
  uint64_t v5 = v1(v4);
  if (!v0)
  {
    while ((v6 & 1) == 0)
    {
      if (v5 == 1)
      {
        uint64_t v7 = OUTLINED_FUNCTION_5_25();
        v8(v7);
      }
      uint64_t v9 = OUTLINED_FUNCTION_128();
      uint64_t v5 = v1(v9);
    }
  }
  OUTLINED_FUNCTION_324();
}

uint64_t Google_Protobuf_BoolValue.traverse<A>(visitor:)()
{
  OUTLINED_FUNCTION_302();
  if (*v0 != 1) {
    return OUTLINED_FUNCTION_6_24();
  }
  OUTLINED_FUNCTION_10_21();
  uint64_t result = v2();
  if (!v1) {
    return OUTLINED_FUNCTION_6_24();
  }
  return result;
}

uint64_t static Google_Protobuf_BoolValue.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  OUTLINED_FUNCTION_14_17((uint64_t)a1);
  OUTLINED_FUNCTION_404();
  OUTLINED_FUNCTION_13_15();
  OUTLINED_FUNCTION_18_16();
  OUTLINED_FUNCTION_88();
  return v2 & 1;
}

uint64_t Google_Protobuf_BoolValue.hashValue.getter()
{
  int v3 = *v1;
  int v4 = OUTLINED_FUNCTION_36_12();
  uint64_t v12 = OUTLINED_FUNCTION_1_35(v4, v5, v6, v7, v8, v9, v10, v11, v23, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34,
          v35,
          v36,
          v37,
          v38);
  OUTLINED_FUNCTION_3_26((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, v24);
  if (v3 == 1)
  {
    OUTLINED_FUNCTION_31_15();
    sub_1B37A0E40();
  }
  switch(v2 >> 62)
  {
    case 1uLL:
      OUTLINED_FUNCTION_28_14();
      goto LABEL_8;
    case 2uLL:
      uint64_t v20 = *(void *)(v0 + 16);
      uint64_t v21 = *(void *)(v0 + 24);
LABEL_8:
      if (v20 == v21) {
        return OUTLINED_FUNCTION_9_22();
      }
      OUTLINED_FUNCTION_32_13();
LABEL_10:
      OUTLINED_FUNCTION_17_16();
LABEL_11:
      OUTLINED_FUNCTION_33_12();
      return OUTLINED_FUNCTION_9_22();
    case 3uLL:
      goto LABEL_11;
    default:
      if ((v2 & 0xFF000000000000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
  }
}

unint64_t sub_1B379E7A0()
{
  return 0xD000000000000019;
}

void sub_1B379E7C0()
{
}

uint64_t sub_1B379E7D8()
{
  return Google_Protobuf_BoolValue.traverse<A>(visitor:)();
}

uint64_t sub_1B379E7F4()
{
  return sub_1B379CB8C();
}

uint64_t sub_1B379E804()
{
  int v1 = *v0;
  uint64_t v2 = *((void *)v0 + 1);
  unint64_t v3 = *((void *)v0 + 2);
  sub_1B37A0E20();
  memcpy(__dst, __src, 0x48uLL);
  long long v7 = __src[0];
  long long v8 = __src[1];
  long long v9 = __src[2];
  long long v10 = __src[3];
  uint64_t v11 = *(void *)&__src[4];
  if (v1 == 1)
  {
    sub_1B37A0E30();
    sub_1B37A0E40();
  }
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v4 = (int)v2;
      uint64_t v5 = v2 >> 32;
      goto LABEL_8;
    case 2uLL:
      uint64_t v4 = *(void *)(v2 + 16);
      uint64_t v5 = *(void *)(v2 + 24);
LABEL_8:
      if (v4 == v5) {
        goto LABEL_12;
      }
      sub_1B36B9E20(v2, v3);
LABEL_10:
      sub_1B37A0610();
LABEL_11:
      sub_1B36C2E10(v2, v3);
LABEL_12:
      __dst[0] = v7;
      __dst[1] = v8;
      __dst[2] = v9;
      __dst[3] = v10;
      *(void *)&__dst[4] = v11;
      return sub_1B37A0E80();
    case 3uLL:
      goto LABEL_11;
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
  }
}

unint64_t static Google_Protobuf_StringValue.protoMessageName.getter()
{
  return OUTLINED_FUNCTION_12_17();
}

uint64_t sub_1B379E960()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BFA550, qword_1E9CB9318);
}

uint64_t static Google_Protobuf_StringValue._protobuf_nameMap.getter()
{
  if (qword_1E9CB92E8 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CB9318);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void Google_Protobuf_StringValue.decodeMessage<A>(decoder:)()
{
  OUTLINED_FUNCTION_316();
  uint64_t v4 = OUTLINED_FUNCTION_26_3(v2, v3);
  uint64_t v5 = v1(v4);
  if (!v0)
  {
    while ((v6 & 1) == 0)
    {
      if (v5 == 1)
      {
        uint64_t v7 = OUTLINED_FUNCTION_5_25();
        v8(v7);
      }
      uint64_t v9 = OUTLINED_FUNCTION_128();
      uint64_t v5 = v1(v9);
    }
  }
  OUTLINED_FUNCTION_324();
}

uint64_t sub_1B379EA64(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v7 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v7 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (v7)
  {
    sub_1B37A0E30();
    uint64_t result = sub_1B37A0870();
  }
  switch(a5 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (int)a4;
      uint64_t v10 = a4 >> 32;
      goto LABEL_10;
    case 2uLL:
      uint64_t v9 = *(void *)(a4 + 16);
      uint64_t v10 = *(void *)(a4 + 24);
LABEL_10:
      if (v9 != v10) {
        return sub_1B37A0610();
      }
      return result;
    case 3uLL:
      return result;
    default:
      if ((a5 & 0xFF000000000000) == 0) {
        return result;
      }
      return sub_1B37A0610();
  }
}

uint64_t Google_Protobuf_StringValue.traverse<A>(visitor:)()
{
  OUTLINED_FUNCTION_302();
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3) {
    return OUTLINED_FUNCTION_6_24();
  }
  OUTLINED_FUNCTION_26_15();
  uint64_t result = v4();
  if (!v1) {
    return OUTLINED_FUNCTION_6_24();
  }
  return result;
}

uint64_t static Google_Protobuf_StringValue.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  unint64_t v5 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (!v6 && (sub_1B37A0D90() & 1) == 0) {
    return 0;
  }
  sub_1B36B9E20(v2, v3);
  sub_1B36B9E20(v4, v5);
  OUTLINED_FUNCTION_62_1();
  char v8 = v7;
  sub_1B36C2E10(v4, v5);
  sub_1B36C2E10(v2, v3);
  return v8 & 1;
}

uint64_t Google_Protobuf_StringValue.hashValue.getter()
{
  return sub_1B379F0C0((uint64_t (*)(__n128))sub_1B379EA64);
}

unint64_t sub_1B379EC6C()
{
  return 0xD00000000000001BLL;
}

void sub_1B379EC94()
{
}

uint64_t sub_1B379ECAC()
{
  return Google_Protobuf_StringValue.traverse<A>(visitor:)();
}

uint64_t sub_1B379ECC8()
{
  return sub_1B379C9E4(*v0, v0[1], v0[2], v0[3], (uint64_t)&type metadata for Google_Protobuf_StringValue, &qword_1E9CBB6D8);
}

uint64_t sub_1B379ECFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379F1D0(a1, a2, a3, (uint64_t (*)(__n128))sub_1B379EA64);
}

unint64_t static Google_Protobuf_BytesValue.protoMessageName.getter()
{
  return OUTLINED_FUNCTION_11_19();
}

uint64_t sub_1B379ED24()
{
  return _NameMap.init(dictionaryLiteral:)((uint64_t)&unk_1F0BF8F40, qword_1E9CBB620);
}

uint64_t static Google_Protobuf_BytesValue._protobuf_nameMap.getter()
{
  if (qword_1E9CB9650 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_71(qword_1E9CBB620);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void Google_Protobuf_BytesValue.decodeMessage<A>(decoder:)()
{
  OUTLINED_FUNCTION_316();
  uint64_t v4 = OUTLINED_FUNCTION_26_3(v2, v3);
  uint64_t v5 = v1(v4);
  if (!v0)
  {
    while ((v6 & 1) == 0)
    {
      if (v5 == 1)
      {
        uint64_t v7 = OUTLINED_FUNCTION_5_25();
        v8(v7);
      }
      uint64_t v9 = OUTLINED_FUNCTION_128();
      uint64_t v5 = v1(v9);
    }
  }
  OUTLINED_FUNCTION_324();
}

uint64_t sub_1B379EE28(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v7 = (int)a2;
      uint64_t v8 = a2 >> 32;
      goto LABEL_6;
    case 2uLL:
      uint64_t v7 = *(void *)(a2 + 16);
      uint64_t v8 = *(void *)(a2 + 24);
LABEL_6:
      if (v7 != v8) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((a3 & 0xFF000000000000) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      sub_1B37A0E30();
      uint64_t result = sub_1B37A0610();
LABEL_8:
      switch(a5 >> 62)
      {
        case 1uLL:
          uint64_t v10 = (int)a4;
          uint64_t v11 = a4 >> 32;
          goto LABEL_13;
        case 2uLL:
          uint64_t v10 = *(void *)(a4 + 16);
          uint64_t v11 = *(void *)(a4 + 24);
LABEL_13:
          if (v10 == v11) {
            return result;
          }
          sub_1B36B9E20(a4, a5);
LABEL_15:
          sub_1B37A0610();
          return sub_1B36C2E10(a4, a5);
        case 3uLL:
          return sub_1B36C2E10(a4, a5);
        default:
          if ((a5 & 0xFF000000000000) == 0) {
            return sub_1B36C2E10(a4, a5);
          }
          goto LABEL_15;
      }
  }
}

uint64_t Google_Protobuf_BytesValue.traverse<A>(visitor:)()
{
  uint64_t v2 = *v0;
  unint64_t v3 = v0[1];
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v4 = (int)v2;
      uint64_t v5 = v2 >> 32;
      goto LABEL_6;
    case 2uLL:
      uint64_t v4 = *(void *)(v2 + 16);
      uint64_t v5 = *(void *)(v2 + 24);
LABEL_6:
      if (v4 != v5) {
        goto LABEL_7;
      }
      return OUTLINED_FUNCTION_6_24();
    case 3uLL:
      return OUTLINED_FUNCTION_6_24();
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        return OUTLINED_FUNCTION_6_24();
      }
LABEL_7:
      OUTLINED_FUNCTION_26_15();
      uint64_t result = v6();
      if (!v1) {
        return OUTLINED_FUNCTION_6_24();
      }
      return result;
  }
}

uint64_t static Google_Protobuf_BytesValue.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  unint64_t v5 = a2[3];
  if ((MEMORY[0x1B3EB6700](*a1, a1[1], *a2, a2[1]) & 1) == 0) {
    return 0;
  }
  sub_1B36B9E20(v2, v3);
  sub_1B36B9E20(v4, v5);
  OUTLINED_FUNCTION_62_1();
  char v7 = v6;
  sub_1B36C2E10(v4, v5);
  sub_1B36C2E10(v2, v3);
  return v7 & 1;
}

uint64_t Google_Protobuf_BytesValue.hashValue.getter()
{
  return sub_1B379F0C0((uint64_t (*)(__n128))sub_1B379EE28);
}

uint64_t sub_1B379F0C0(uint64_t (*a1)(__n128))
{
  OUTLINED_FUNCTION_42_9();
  sub_1B37A0E20();
  __n128 v3 = OUTLINED_FUNCTION_15_18();
  uint64_t v4 = a1(v3);
  if (v1) {
    uint64_t v4 = MEMORY[0x1B3EB71D0](v1);
  }
  return OUTLINED_FUNCTION_20_18(v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20, v21);
}

unint64_t sub_1B379F128()
{
  return 0xD00000000000001ALL;
}

void sub_1B379F150()
{
}

uint64_t sub_1B379F168()
{
  return Google_Protobuf_BytesValue.traverse<A>(visitor:)();
}

uint64_t sub_1B379F184()
{
  return sub_1B379C9E4(*v0, v0[1], v0[2], v0[3], (uint64_t)&type metadata for Google_Protobuf_BytesValue, &qword_1E9CBB6D0);
}

uint64_t sub_1B379F1B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379F1D0(a1, a2, a3, (uint64_t (*)(__n128))sub_1B379EE28);
}

uint64_t sub_1B379F1D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(__n128))
{
  OUTLINED_FUNCTION_42_9();
  sub_1B37A0E20();
  __n128 v6 = OUTLINED_FUNCTION_15_18();
  uint64_t v7 = a4(v6);
  if (v4) {
    uint64_t v7 = MEMORY[0x1B3EB71D0](v4);
  }
  return OUTLINED_FUNCTION_20_18(v7, v8, v9, v10, v11, v12, v13, v14, v16, v17, v18, v19, v20, v21, v22, v23, v24);
}

unint64_t sub_1B379F230(uint64_t a1)
{
  unint64_t result = sub_1B379F258();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B379F258()
{
  unint64_t result = qword_1EB593880;
  if (!qword_1EB593880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB593880);
  }
  return result;
}

uint64_t sub_1B379F2A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379FCB0(a1, a2, a3, (uint64_t (*)(void))sub_1B3747148, (uint64_t (*)(void))sub_1B379F2D0);
}

unint64_t sub_1B379F2D0()
{
  unint64_t result = qword_1E9CBB640;
  if (!qword_1E9CBB640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB640);
  }
  return result;
}

unint64_t sub_1B379F320()
{
  unint64_t result = qword_1E9CBB648;
  if (!qword_1E9CBB648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB648);
  }
  return result;
}

unint64_t sub_1B379F36C(uint64_t a1)
{
  unint64_t result = sub_1B379F394();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B379F394()
{
  unint64_t result = qword_1E9CB92E0;
  if (!qword_1E9CB92E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CB92E0);
  }
  return result;
}

uint64_t sub_1B379F3E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379FCB0(a1, a2, a3, (uint64_t (*)(void))sub_1B3747194, (uint64_t (*)(void))sub_1B379F40C);
}

unint64_t sub_1B379F40C()
{
  unint64_t result = qword_1E9CBB650;
  if (!qword_1E9CBB650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB650);
  }
  return result;
}

unint64_t sub_1B379F45C()
{
  unint64_t result = qword_1E9CBB658;
  if (!qword_1E9CBB658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB658);
  }
  return result;
}

unint64_t sub_1B379F4A8(uint64_t a1)
{
  unint64_t result = sub_1B379F4D0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B379F4D0()
{
  unint64_t result = qword_1E9CB9170;
  if (!qword_1E9CB9170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CB9170);
  }
  return result;
}

uint64_t sub_1B379F51C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379FCB0(a1, a2, a3, (uint64_t (*)(void))sub_1B374722C, (uint64_t (*)(void))sub_1B379F548);
}

unint64_t sub_1B379F548()
{
  unint64_t result = qword_1E9CBB660;
  if (!qword_1E9CBB660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB660);
  }
  return result;
}

unint64_t sub_1B379F598()
{
  unint64_t result = qword_1E9CBB668;
  if (!qword_1E9CBB668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB668);
  }
  return result;
}

unint64_t sub_1B379F5E4(uint64_t a1)
{
  unint64_t result = sub_1B379F60C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B379F60C()
{
  unint64_t result = qword_1E9CB9198;
  if (!qword_1E9CB9198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CB9198);
  }
  return result;
}

uint64_t sub_1B379F658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379FCB0(a1, a2, a3, (uint64_t (*)(void))sub_1B37473F4, (uint64_t (*)(void))sub_1B379F684);
}

unint64_t sub_1B379F684()
{
  unint64_t result = qword_1E9CBB670;
  if (!qword_1E9CBB670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB670);
  }
  return result;
}

unint64_t sub_1B379F6D4()
{
  unint64_t result = qword_1E9CBB678;
  if (!qword_1E9CBB678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB678);
  }
  return result;
}

unint64_t sub_1B379F720(uint64_t a1)
{
  unint64_t result = sub_1B379F748();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B379F748()
{
  unint64_t result = qword_1E9CB9160;
  if (!qword_1E9CB9160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CB9160);
  }
  return result;
}

uint64_t sub_1B379F794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379FCB0(a1, a2, a3, (uint64_t (*)(void))sub_1B37471E0, (uint64_t (*)(void))sub_1B379F7C0);
}

unint64_t sub_1B379F7C0()
{
  unint64_t result = qword_1E9CBB680;
  if (!qword_1E9CBB680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB680);
  }
  return result;
}

unint64_t sub_1B379F810()
{
  unint64_t result = qword_1E9CBB688;
  if (!qword_1E9CBB688)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB688);
  }
  return result;
}

unint64_t sub_1B379F85C(uint64_t a1)
{
  unint64_t result = sub_1B379F884();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B379F884()
{
  unint64_t result = qword_1EB5937F0;
  if (!qword_1EB5937F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5937F0);
  }
  return result;
}

uint64_t sub_1B379F8D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379FCB0(a1, a2, a3, (uint64_t (*)(void))sub_1B37473A8, (uint64_t (*)(void))sub_1B379F8FC);
}

unint64_t sub_1B379F8FC()
{
  unint64_t result = qword_1E9CBB690;
  if (!qword_1E9CBB690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB690);
  }
  return result;
}

unint64_t sub_1B379F94C()
{
  unint64_t result = qword_1E9CBB698;
  if (!qword_1E9CBB698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB698);
  }
  return result;
}

unint64_t sub_1B379F998(uint64_t a1)
{
  unint64_t result = sub_1B379F9C0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B379F9C0()
{
  unint64_t result = qword_1E9CB90C8;
  if (!qword_1E9CB90C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CB90C8);
  }
  return result;
}

uint64_t sub_1B379FA0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379FCB0(a1, a2, a3, (uint64_t (*)(void))sub_1B37470B0, (uint64_t (*)(void))sub_1B379FA38);
}

unint64_t sub_1B379FA38()
{
  unint64_t result = qword_1E9CBB6A0;
  if (!qword_1E9CBB6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB6A0);
  }
  return result;
}

unint64_t sub_1B379FA88()
{
  unint64_t result = qword_1E9CBB6A8;
  if (!qword_1E9CBB6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB6A8);
  }
  return result;
}

unint64_t sub_1B379FAD4(uint64_t a1)
{
  unint64_t result = sub_1B379FAFC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B379FAFC()
{
  unint64_t result = qword_1EB5937E8;
  if (!qword_1EB5937E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB5937E8);
  }
  return result;
}

uint64_t sub_1B379FB48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379FCB0(a1, a2, a3, (uint64_t (*)(void))sub_1B37472C4, (uint64_t (*)(void))sub_1B379FB74);
}

unint64_t sub_1B379FB74()
{
  unint64_t result = qword_1E9CBB6B0;
  if (!qword_1E9CBB6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB6B0);
  }
  return result;
}

unint64_t sub_1B379FBC4()
{
  unint64_t result = qword_1E9CBB6B8;
  if (!qword_1E9CBB6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB6B8);
  }
  return result;
}

unint64_t sub_1B379FC10(uint64_t a1)
{
  unint64_t result = sub_1B379FC38();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1B379FC38()
{
  unint64_t result = qword_1E9CB90F8;
  if (!qword_1E9CB90F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CB90F8);
  }
  return result;
}

uint64_t sub_1B379FC84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B379FCB0(a1, a2, a3, (uint64_t (*)(void))sub_1B37470FC, (uint64_t (*)(void))sub_1B379FCEC);
}

uint64_t sub_1B379FCB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  *(void *)(a1 + 8) = a4();
  uint64_t result = a5();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1B379FCEC()
{
  unint64_t result = qword_1E9CBB6C0;
  if (!qword_1E9CBB6C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB6C0);
  }
  return result;
}

unint64_t sub_1B379FD3C()
{
  unint64_t result = qword_1E9CBB6C8;
  if (!qword_1E9CBB6C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9CBB6C8);
  }
  return result;
}

void *assignWithCopy for Google_Protobuf_DoubleValue(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  unint64_t v4 = a2[2];
  sub_1B36B9E20(v3, v4);
  uint64_t v5 = a1[1];
  unint64_t v6 = a1[2];
  a1[1] = v3;
  a1[2] = v4;
  sub_1B36C2E10(v5, v6);
  return a1;
}

void *assignWithTake for Google_Protobuf_DoubleValue(void *a1, uint64_t a2)
{
  *a1 = *(void *)a2;
  uint64_t v3 = a1[1];
  unint64_t v4 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  sub_1B36C2E10(v3, v4);
  return a1;
}

void type metadata accessor for Google_Protobuf_DoubleValue()
{
}

uint64_t assignWithCopy for Google_Protobuf_FloatValue(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_1B36B9E20(v3, v4);
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  sub_1B36C2E10(v5, v6);
  return a1;
}

uint64_t assignWithTake for Google_Protobuf_FloatValue(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_1B36C2E10(v3, v4);
  return a1;
}

void type metadata accessor for Google_Protobuf_FloatValue()
{
}

void type metadata accessor for Google_Protobuf_Int64Value()
{
}

void *_s21InternalSwiftProtobuf27Google_Protobuf_DoubleValueVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  unint64_t v4 = a2[2];
  sub_1B36B9E20(v3, v4);
  a1[1] = v3;
  a1[2] = v4;
  return a1;
}

void *_s21InternalSwiftProtobuf26Google_Protobuf_Int64ValueVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  OUTLINED_FUNCTION_22_11((uint64_t)a1, (uint64_t)a2);
  uint64_t v5 = a1[1];
  unint64_t v6 = a1[2];
  a1[1] = v2;
  a1[2] = v3;
  sub_1B36C2E10(v5, v6);
  return a1;
}

uint64_t _s21InternalSwiftProtobuf26Google_Protobuf_Int64ValueVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  sub_1B36C2E10(v4, v5);
  return a1;
}

void type metadata accessor for Google_Protobuf_UInt64Value()
{
}

void type metadata accessor for Google_Protobuf_Int32Value()
{
}

uint64_t _s21InternalSwiftProtobuf26Google_Protobuf_FloatValueVwCP_0(uint64_t a1, _DWORD *a2)
{
  *(_DWORD *)a1 = *a2;
  OUTLINED_FUNCTION_22_11(a1, (uint64_t)a2);
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  return a1;
}

uint64_t _s21InternalSwiftProtobuf26Google_Protobuf_Int32ValueVwca_0(uint64_t a1, _DWORD *a2)
{
  *(_DWORD *)a1 = *a2;
  OUTLINED_FUNCTION_22_11(a1, (uint64_t)a2);
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  sub_1B36C2E10(v5, v6);
  return a1;
}

uint64_t _s21InternalSwiftProtobuf26Google_Protobuf_Int32ValueVwta_0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_1B36C2E10(v3, v4);
  return a1;
}

uint64_t _s21InternalSwiftProtobuf27Google_Protobuf_DoubleValueVwet_0(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xD && *(unsigned char *)(a1 + 24))
    {
      unsigned int v2 = *(_DWORD *)a1 + 12;
    }
    else
    {
      unsigned int v2 = (((*(void *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 16) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xC) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t _s21InternalSwiftProtobuf27Google_Protobuf_DoubleValueVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 13;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2)
    {
      *(void *)(result + 8) = 0;
      *(void *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

void type metadata accessor for Google_Protobuf_UInt32Value()
{
}

uint64_t destroy for Google_Protobuf_BoolValue(uint64_t a1)
{
  return sub_1B36C2E10(*(void *)(a1 + 8), *(void *)(a1 + 16));
}

uint64_t _s21InternalSwiftProtobuf25Google_Protobuf_BoolValueVwCP_0(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)a1 = *a2;
  OUTLINED_FUNCTION_22_11(a1, (uint64_t)a2);
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  return a1;
}

uint64_t assignWithCopy for Google_Protobuf_BoolValue(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  sub_1B36B9E20(v3, v4);
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  sub_1B36C2E10(v5, v6);
  return a1;
}

uint64_t assignWithTake for Google_Protobuf_BoolValue(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_1B36C2E10(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for Google_Protobuf_BoolValue(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && a1[24])
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *a1;
      BOOL v4 = v3 >= 2;
      int v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Google_Protobuf_BoolValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for Google_Protobuf_BoolValue()
{
}

void type metadata accessor for Google_Protobuf_StringValue()
{
}

uint64_t destroy for Google_Protobuf_BytesValue(uint64_t *a1)
{
  sub_1B36C2E10(*a1, a1[1]);
  uint64_t v2 = a1[2];
  unint64_t v3 = a1[3];
  return sub_1B36C2E10(v2, v3);
}

uint64_t *initializeWithCopy for Google_Protobuf_BytesValue(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_1B36B9E20(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  uint64_t v7 = a2[2];
  unint64_t v6 = a2[3];
  sub_1B36B9E20(v7, v6);
  a1[2] = v7;
  a1[3] = v6;
  return a1;
}

uint64_t *assignWithCopy for Google_Protobuf_BytesValue(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_1B36B9E20(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_1B36C2E10(v6, v7);
  uint64_t v9 = a2[2];
  unint64_t v8 = a2[3];
  sub_1B36B9E20(v9, v8);
  uint64_t v10 = a1[2];
  unint64_t v11 = a1[3];
  a1[2] = v9;
  a1[3] = v8;
  sub_1B36C2E10(v10, v11);
  return a1;
}

uint64_t *assignWithTake for Google_Protobuf_BytesValue(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_1B36C2E10(v4, v5);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_1B36C2E10(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for Google_Protobuf_BytesValue(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xD && *(unsigned char *)(a1 + 32))
    {
      unsigned int v2 = *(_DWORD *)a1 + 12;
    }
    else
    {
      unsigned int v2 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xC) {
        unsigned int v2 = -1;
      }
    }
  }
  else
  {
    unsigned int v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for Google_Protobuf_BytesValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2)
    {
      *(void *)unint64_t result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

void type metadata accessor for Google_Protobuf_BytesValue()
{
}

uint64_t OUTLINED_FUNCTION_40_10(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledName(a2);
}

uint64_t sub_1B37A0510()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1B37A0520()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1B37A0530()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1B37A0540()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t sub_1B37A0550()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1B37A0560()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1B37A0570()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1B37A0580()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_1B37A0590()
{
  return MEMORY[0x1F40E4BB0]();
}

uint64_t sub_1B37A05A0()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1B37A05B0()
{
  return MEMORY[0x1F40E4BD8]();
}

uint64_t sub_1B37A05C0()
{
  return MEMORY[0x1F40E4C18]();
}

uint64_t sub_1B37A05D0()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1B37A05E0()
{
  return MEMORY[0x1F40E4D30]();
}

uint64_t sub_1B37A05F0()
{
  return MEMORY[0x1F40E4D70]();
}

uint64_t sub_1B37A0600()
{
  return MEMORY[0x1F40E4D80]();
}

uint64_t sub_1B37A0610()
{
  return MEMORY[0x1F40E4DB8]();
}

uint64_t sub_1B37A0620()
{
  return MEMORY[0x1F40E4DD0]();
}

uint64_t sub_1B37A0630()
{
  return MEMORY[0x1F40E4DE8]();
}

uint64_t sub_1B37A0640()
{
  return MEMORY[0x1F40E4DF0]();
}

uint64_t sub_1B37A0650()
{
  return MEMORY[0x1F40E4E30]();
}

uint64_t sub_1B37A0660()
{
  return MEMORY[0x1F40E4EA0]();
}

uint64_t sub_1B37A0670()
{
  return MEMORY[0x1F40E4EB8]();
}

uint64_t sub_1B37A0690()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1B37A06A0()
{
  return MEMORY[0x1F40E4EF8]();
}

uint64_t sub_1B37A06B0()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1B37A06C0()
{
  return MEMORY[0x1F4186C98]();
}

uint64_t sub_1B37A06D0()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1B37A06E0()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1B37A06F0()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1B37A0700()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1B37A0710()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1B37A0720()
{
  return MEMORY[0x1F41833D0]();
}

uint64_t sub_1B37A0730()
{
  return MEMORY[0x1F41833E8]();
}

uint64_t sub_1B37A0740()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1B37A0750()
{
  return MEMORY[0x1F41834D0]();
}

uint64_t sub_1B37A0760()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1B37A0770()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1B37A0780()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1B37A0790()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1B37A07A0()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1B37A07B0()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_1B37A07C0()
{
  return MEMORY[0x1F40E6200]();
}

uint64_t sub_1B37A07D0()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1B37A07E0()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1B37A07F0()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1B37A0800()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1B37A0810()
{
  return MEMORY[0x1F41838B0]();
}

uint64_t sub_1B37A0820()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1B37A0840()
{
  return MEMORY[0x1F4183940]();
}

uint64_t sub_1B37A0850()
{
  return MEMORY[0x1F4183950]();
}

uint64_t sub_1B37A0860()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1B37A0870()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1B37A0880()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1B37A0890()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1B37A08A0()
{
  return MEMORY[0x1F4183A00]();
}

uint64_t sub_1B37A08B0()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1B37A08C0()
{
  return MEMORY[0x1F4183A30]();
}

uint64_t sub_1B37A08D0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1B37A08F0()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1B37A0900()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1B37A0910()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1B37A0920()
{
  return MEMORY[0x1F4183A90]();
}

uint64_t sub_1B37A0930()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1B37A0950()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1B37A0960()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1B37A0970()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1B37A0980()
{
  return MEMORY[0x1F4183B48]();
}

uint64_t sub_1B37A0990()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1B37A09A0()
{
  return MEMORY[0x1F4183B88]();
}

uint64_t sub_1B37A09B0()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1B37A09C0()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1B37A09D0()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1B37A09E0()
{
  return MEMORY[0x1F4183C68]();
}

uint64_t sub_1B37A09F0()
{
  return MEMORY[0x1F4183C70]();
}

uint64_t sub_1B37A0A00()
{
  return MEMORY[0x1F4183E88]();
}

uint64_t sub_1B37A0A10()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1B37A0A20()
{
  return MEMORY[0x1F4183EB8]();
}

uint64_t sub_1B37A0A30()
{
  return MEMORY[0x1F4183EC0]();
}

uint64_t sub_1B37A0A40()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1B37A0A50()
{
  return MEMORY[0x1F4183EF8]();
}

uint64_t sub_1B37A0A60()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1B37A0A70()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1B37A0A80()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1B37A0A90()
{
  return MEMORY[0x1F4183F58]();
}

uint64_t sub_1B37A0AA0()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1B37A0AB0()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1B37A0AC0()
{
  return MEMORY[0x1F4183F88]();
}

uint64_t sub_1B37A0AD0()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1B37A0AE0()
{
  return MEMORY[0x1F4183FB8]();
}

uint64_t sub_1B37A0AF0()
{
  return MEMORY[0x1F4183FC8]();
}

uint64_t sub_1B37A0B00()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1B37A0B30()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_1B37A0B40()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1B37A0B50()
{
  return MEMORY[0x1F4184020]();
}

uint64_t sub_1B37A0B60()
{
  return MEMORY[0x1F4184098]();
}

uint64_t sub_1B37A0B70()
{
  return MEMORY[0x1F41840A8]();
}

uint64_t sub_1B37A0B80()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1B37A0B90()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1B37A0BA0()
{
  return MEMORY[0x1F4186FC0]();
}

uint64_t sub_1B37A0BB0()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1B37A0BC0()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1B37A0BD0()
{
  return MEMORY[0x1F41870C0]();
}

uint64_t sub_1B37A0BE0()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1B37A0BF0()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1B37A0C00()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1B37A0C10()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1B37A0C20()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1B37A0C30()
{
  return MEMORY[0x1F4184958]();
}

uint64_t sub_1B37A0C40()
{
  return MEMORY[0x1F4184B28]();
}

uint64_t sub_1B37A0C50()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1B37A0C60()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1B37A0C70()
{
  return MEMORY[0x1F4184CE0]();
}

uint64_t sub_1B37A0C80()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1B37A0C90()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1B37A0CA0()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1B37A0CB0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1B37A0CC0()
{
  return MEMORY[0x1F4184E70]();
}

uint64_t sub_1B37A0CD0()
{
  return MEMORY[0x1F4185048]();
}

uint64_t sub_1B37A0CE0()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1B37A0CF0()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1B37A0D00()
{
  return MEMORY[0x1F41851B8]();
}

uint64_t sub_1B37A0D10()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t sub_1B37A0D20()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1B37A0D30()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1B37A0D40()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1B37A0D50()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1B37A0D60()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1B37A0D70()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1B37A0D80()
{
  return MEMORY[0x1F4185A18]();
}

uint64_t sub_1B37A0D90()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B37A0DA0()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1B37A0DB0()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1B37A0DC0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1B37A0DD0()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1B37A0DE0()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1B37A0DF0()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1B37A0E00()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1B37A0E10()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1B37A0E20()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B37A0E30()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1B37A0E40()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1B37A0E50()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1B37A0E60()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1B37A0E70()
{
  return MEMORY[0x1F4185EF0]();
}

uint64_t sub_1B37A0E80()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1B37A0E90()
{
  return MEMORY[0x1F4186040]();
}

uint64_t sub_1B37A0EA0()
{
  return MEMORY[0x1F4186120]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x1F40CE260](a1, a2);
  return result;
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}