void sub_22504D348(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22504D5A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HearingMLHelperSecureCodingClasses()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  return objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
}

id HearingMLHelperServiceInterface()
{
  if (HearingMLHelperServiceInterface_onceToken != -1) {
    dispatch_once(&HearingMLHelperServiceInterface_onceToken, &__block_literal_global);
  }
  v0 = (void *)HearingMLHelperServiceInterface__Interface;
  return v0;
}

void __HearingMLHelperServiceInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D86F6B0];
  uint64_t v1 = (void *)HearingMLHelperServiceInterface__Interface;
  HearingMLHelperServiceInterface__Interface = v0;

  HearingMLHelperSecureCodingClasses();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [(id)HearingMLHelperServiceInterface__Interface setClasses:v2 forSelector:sel_trainWithDetectorID_hallucinatorPath_pretrainedWeightsPath_resultHandler_ argumentIndex:0 ofReply:0];
  [(id)HearingMLHelperServiceInterface__Interface setClasses:v2 forSelector:sel_trainWithDetectorID_hallucinatorPath_pretrainedWeightsPath_resultHandler_ argumentIndex:1 ofReply:0];
  [(id)HearingMLHelperServiceInterface__Interface setClasses:v2 forSelector:sel_trainWithDetectorID_hallucinatorPath_pretrainedWeightsPath_resultHandler_ argumentIndex:2 ofReply:0];
  [(id)HearingMLHelperServiceInterface__Interface setClasses:v2 forSelector:sel_trainWithDetectorID_hallucinatorPath_pretrainedWeightsPath_resultHandler_ argumentIndex:0 ofReply:1];
  [(id)HearingMLHelperServiceInterface__Interface setClasses:v2 forSelector:sel_trainWithDetectorID_hallucinatorPath_pretrainedWeightsPath_resultHandler_ argumentIndex:1 ofReply:1];
}

uint64_t sub_22504D980@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v76 = a3;
  uint64_t v77 = a4;
  uint64_t v70 = a5;
  uint64_t v7 = sub_22504F000();
  uint64_t v66 = *(void *)(v7 - 8);
  uint64_t v67 = v7;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v82 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680BFDC0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v74 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22504EFE0();
  uint64_t v80 = *(void *)(v10 - 8);
  uint64_t v81 = v10;
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v75 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v84 = (char *)&v66 - v13;
  uint64_t v14 = sub_22504EFB0();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  v73 = (char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v19 = (char *)&v66 - v18;
  uint64_t v20 = sub_22504EFA0();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v72 = (char *)&v66 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  v25 = (char *)&v66 - v24;
  uint64_t v85 = qword_2680BFD80;
  v86 = off_2680BFD88;
  swift_bridgeObjectRetain();
  uint64_t v68 = a1;
  uint64_t v69 = a2;
  sub_22504F030();
  sub_22504EF60();
  swift_bridgeObjectRelease();
  uint64_t v78 = v21;
  v26 = *(char **)(v21 + 16);
  v71 = v25;
  uint64_t v27 = v20;
  ((void (*)(char *, char *, uint64_t))v26)(v19, v25, v20);
  uint64_t v28 = *MEMORY[0x263F042D8];
  uint64_t v29 = v15;
  v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 104);
  v31 = v19;
  uint64_t v79 = v14;
  uint64_t result = v30(v19, v28, v14);
  uint64_t v34 = qword_2680BFDB0;
  uint64_t v33 = unk_2680BFDB8;
  uint64_t v35 = HIBYTE(unk_2680BFDB8) & 0xFLL;
  uint64_t v36 = qword_2680BFDB0 & 0xFFFFFFFFFFFFLL;
  if ((unk_2680BFDB8 & 0x2000000000000000) != 0) {
    uint64_t v37 = HIBYTE(unk_2680BFDB8) & 0xFLL;
  }
  else {
    uint64_t v37 = qword_2680BFDB0 & 0xFFFFFFFFFFFFLL;
  }
  if (v37)
  {
    if ((unk_2680BFDB8 & 0x1000000000000000) == 0)
    {
      if ((unk_2680BFDB8 & 0x2000000000000000) == 0)
      {
        v38 = v26;
        v26 = v83;
        if ((qword_2680BFDB0 & 0x1000000000000000) == 0) {
          goto LABEL_60;
        }
        for (i = (unsigned __int8 *)((unk_2680BFDB8 & 0xFFFFFFFFFFFFFFFLL) + 32); ; i = (unsigned __int8 *)sub_22504F0B0())
        {
          sub_22504E610(i, v36, 10);
          v83 = v26;
          v40 = v84;
          if ((v41 & 1) == 0) {
            break;
          }
LABEL_59:
          __break(1u);
LABEL_60:
          ;
        }
        goto LABEL_35;
      }
      uint64_t v85 = qword_2680BFDB0;
      v86 = (void *)(unk_2680BFDB8 & 0xFFFFFFFFFFFFFFLL);
      if (qword_2680BFDB0 == 43)
      {
        v40 = v84;
        if (!v35) {
          goto LABEL_63;
        }
        if (v35 == 1) {
          goto LABEL_61;
        }
        if ((BYTE1(qword_2680BFDB0) - 48) > 9u) {
          goto LABEL_32;
        }
        if (v35 == 2) {
          goto LABEL_39;
        }
        v38 = v26;
        if ((BYTE2(qword_2680BFDB0) - 48) > 9u) {
          goto LABEL_33;
        }
        uint64_t v42 = 10 * (BYTE1(qword_2680BFDB0) - 48) + (BYTE2(qword_2680BFDB0) - 48);
        uint64_t v43 = v35 - 3;
        if (v35 != 3)
        {
          v44 = (unsigned __int8 *)&v85 + 3;
          while (1)
          {
            unsigned int v45 = *v44 - 48;
            if (v45 > 9) {
              goto LABEL_33;
            }
            uint64_t v46 = 10 * v42;
            if ((unsigned __int128)(v42 * (__int128)10) >> 64 != (10 * v42) >> 63) {
              goto LABEL_33;
            }
            uint64_t v42 = v46 + v45;
            if (__OFADD__(v46, v45)) {
              goto LABEL_33;
            }
            LOBYTE(v35) = 0;
            ++v44;
            if (!--v43) {
              goto LABEL_34;
            }
          }
        }
      }
      else
      {
        v40 = v84;
        if (qword_2680BFDB0 == 45)
        {
          if (v35)
          {
            if (v35 != 1)
            {
              if ((BYTE1(qword_2680BFDB0) - 48) <= 9u)
              {
                v38 = v26;
                if (v35 == 2)
                {
                  LOBYTE(v35) = 0;
                  goto LABEL_34;
                }
                if ((BYTE2(qword_2680BFDB0) - 48) <= 9u)
                {
                  uint64_t v60 = -10 * (BYTE1(qword_2680BFDB0) - 48)
                      - (BYTE2(qword_2680BFDB0) - 48);
                  uint64_t v61 = v35 - 3;
                  if (v35 == 3) {
                    goto LABEL_50;
                  }
                  v62 = (unsigned __int8 *)&v85 + 3;
                  while (1)
                  {
                    unsigned int v63 = *v62 - 48;
                    if (v63 > 9) {
                      break;
                    }
                    uint64_t v64 = 10 * v60;
                    if ((unsigned __int128)(v60 * (__int128)10) >> 64 != (10 * v60) >> 63) {
                      break;
                    }
                    uint64_t v60 = v64 - v63;
                    if (__OFSUB__(v64, v63)) {
                      break;
                    }
                    LOBYTE(v35) = 0;
                    ++v62;
                    if (!--v61) {
                      goto LABEL_34;
                    }
                  }
                }
LABEL_33:
                LOBYTE(v35) = 1;
                goto LABEL_34;
              }
LABEL_32:
              v38 = v26;
              goto LABEL_33;
            }
LABEL_61:
            v38 = v26;
LABEL_34:
            if (v35) {
              goto LABEL_59;
            }
            goto LABEL_35;
          }
          __break(1u);
LABEL_63:
          __break(1u);
          return result;
        }
        if (!v35 || (qword_2680BFDB0 - 48) > 9u) {
          goto LABEL_32;
        }
        if (v35 == 1)
        {
LABEL_39:
          v38 = v26;
          LOBYTE(v35) = 0;
          goto LABEL_34;
        }
        v38 = v26;
        if ((BYTE1(qword_2680BFDB0) - 48) > 9u) {
          goto LABEL_33;
        }
        uint64_t v55 = 10 * (qword_2680BFDB0 - 48) + (BYTE1(qword_2680BFDB0) - 48);
        uint64_t v56 = v35 - 2;
        if (v35 != 2)
        {
          v57 = (unsigned __int8 *)&v85 + 2;
          while (1)
          {
            unsigned int v58 = *v57 - 48;
            if (v58 > 9) {
              goto LABEL_33;
            }
            uint64_t v59 = 10 * v55;
            if ((unsigned __int128)(v55 * (__int128)10) >> 64 != (10 * v55) >> 63) {
              goto LABEL_33;
            }
            uint64_t v55 = v59 + v58;
            if (__OFADD__(v59, v58)) {
              goto LABEL_33;
            }
            LOBYTE(v35) = 0;
            ++v57;
            if (!--v56) {
              goto LABEL_34;
            }
          }
        }
      }
LABEL_50:
      LOBYTE(v35) = 0;
      goto LABEL_34;
    }
  }
  else
  {
    __break(1u);
  }
  v38 = v26;
  swift_bridgeObjectRetain();
  sub_22504E528(v34, v33, 10);
  v26 = v65;
  swift_bridgeObjectRelease();
  v40 = v84;
  if (v26) {
    goto LABEL_59;
  }
LABEL_35:
  ((void (*)(char *, uint64_t, uint64_t))v38)(v72, v76, v27);
  v47 = v74;
  ((void (*)(char *, uint64_t, uint64_t))v38)(v74, v77, v27);
  uint64_t v48 = v78;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v78 + 56))(v47, 0, 1, v27);
  sub_22504EFD0();
  uint64_t v49 = v79;
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v73, v31, v79);
  v50 = v40;
  uint64_t v52 = v80;
  uint64_t v51 = v81;
  (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v75, v50, v81);
  v53 = v83;
  sub_22504EFC0();
  if (v53)
  {
    (*(void (**)(char *, uint64_t))(v52 + 8))(v84, v51);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v49);
    return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v71, v27);
  }
  else
  {
    uint64_t v77 = v27;
    v83 = v31;
    uint64_t v85 = qword_2680BFD90;
    v86 = off_2680BFD98;
    swift_bridgeObjectRetain();
    sub_22504F030();
    swift_bridgeObjectRetain();
    sub_22504F030();
    swift_bridgeObjectRelease();
    sub_22504EF70();
    swift_bridgeObjectRelease();
    v54 = v82;
    sub_22504EFF0();
    (*(void (**)(char *, uint64_t))(v66 + 8))(v54, v67);
    (*(void (**)(char *, uint64_t))(v80 + 8))(v84, v81);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v83, v79);
    return (*(uint64_t (**)(char *, uint64_t))(v78 + 8))(v71, v77);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unsigned __int8 *sub_22504E528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_22504F090();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_22504E88C();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_22504F0B0();
  }
LABEL_7:
  uint64_t v11 = sub_22504E610(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_22504E610(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_22504E88C()
{
  unint64_t v0 = sub_22504F0A0();
  uint64_t v4 = sub_22504E90C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22504E90C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_22504EA64(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_22504EB64(v9, 0);
      unint64_t v12 = sub_22504EBCC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_22504F0B0();
LABEL_4:
        JUMPOUT(0x22A629F80);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x22A629F80](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x22A629F80]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_22504EA64(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_22504EDE0(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_22504EDE0(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

void *sub_22504EB64(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2680BFDC8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_22504EBCC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_22504EDE0(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_22504F070();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_22504F0B0();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_22504EDE0(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_22504F040();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_22504EDE0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_22504F080();
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
    uint64_t v5 = MEMORY[0x22A629FB0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_22504EF50()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_22504EF60()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_22504EF70()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_22504EF80()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_22504EF90()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_22504EFA0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_22504EFB0()
{
  return MEMORY[0x270EEA378]();
}

uint64_t sub_22504EFC0()
{
  return MEMORY[0x270EEA380]();
}

uint64_t sub_22504EFD0()
{
  return MEMORY[0x270EEA388]();
}

uint64_t sub_22504EFE0()
{
  return MEMORY[0x270EEA390]();
}

uint64_t sub_22504EFF0()
{
  return MEMORY[0x270EEA398]();
}

uint64_t sub_22504F000()
{
  return MEMORY[0x270EEA3A0]();
}

uint64_t sub_22504F010()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22504F020()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_22504F030()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22504F040()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_22504F050()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_22504F070()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_22504F080()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_22504F090()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_22504F0A0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_22504F0B0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t AXLogUltronKShot()
{
  return MEMORY[0x270F093E8]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}