uint64_t _s11HearingTest29HTFaultCheckStatusWithReasonsO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unsigned __int8 v7;
  char v8;

  v2 = *(void *)a1;
  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = *(void *)a2;
  v5 = *(unsigned __int8 *)(a2 + 8);
  if (*(unsigned char *)(a1 + 8))
  {
    if (v3 == 1)
    {
      if (v5 == 1)
      {
        LOBYTE(v3) = 1;
        sub_251343BBC(*(void *)a2, 1u);
        v6 = v2;
        v7 = 1;
LABEL_9:
        sub_251343BBC(v6, v7);
        v8 = sub_251348794(v2, v4);
        goto LABEL_11;
      }
    }
    else if (v5 == 2)
    {
      LOBYTE(v3) = 2;
      sub_251343BBC(*(void *)a2, 2u);
      v6 = v2;
      v7 = 2;
      goto LABEL_9;
    }
LABEL_10:
    sub_251343BBC(*(void *)a2, *(unsigned char *)(a2 + 8));
    sub_251343BBC(v2, v3);
    v8 = 0;
    goto LABEL_11;
  }
  if (*(unsigned char *)(a2 + 8)) {
    goto LABEL_10;
  }
  sub_251343BBC(*(void *)a2, 0);
  sub_251343BBC(v2, 0);
  v8 = sub_251348794(v2, v4);
  LOBYTE(v3) = 0;
LABEL_11:
  sub_2513439B0(v2, v3);
  sub_2513439B0(v4, v5);
  return v8 & 1;
}

uint64_t sub_251369A20(uint64_t a1)
{
  return a1;
}

uint64_t sub_251369A4C(uint64_t a1, uint64_t a2)
{
  int64_t v3 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v3)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_2512FABF8(0, v3, 0);
    uint64_t result = v11;
    v6 = (double *)(a1 + 32);
    double v7 = *(double *)(a2 + 144);
    do
    {
      double v8 = *v6;
      uint64_t v12 = result;
      unint64_t v10 = *(void *)(result + 16);
      unint64_t v9 = *(void *)(result + 24);
      if (v10 >= v9 >> 1)
      {
        sub_2512FABF8(v9 > 1, v10 + 1, 1);
        uint64_t result = v12;
      }
      *(void *)(result + 16) = v10 + 1;
      *(double *)(result + 8 * v10 + 32) = v7 * v8;
      ++v6;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_251369B24(uint64_t a1, uint64_t a2)
{
  int64_t v3 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v3)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_2512FABF8(0, v3, 0);
    uint64_t result = v11;
    v6 = (double *)(a1 + 32);
    double v7 = 1.0 - *(double *)(a2 + 144);
    do
    {
      double v8 = *v6;
      uint64_t v12 = result;
      unint64_t v10 = *(void *)(result + 16);
      unint64_t v9 = *(void *)(result + 24);
      if (v10 >= v9 >> 1)
      {
        sub_2512FABF8(v9 > 1, v10 + 1, 1);
        uint64_t result = v12;
      }
      *(void *)(result + 16) = v10 + 1;
      *(double *)(result + 8 * v10 + 32) = v7 * v8;
      ++v6;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_251369C04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, double a11@<D1>, double a12@<D2>, double a13@<D3>, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v24 = sub_2513809F0();
  *(void *)(v24 + 16) = 20;
  *(_OWORD *)(v24 + 32) = 0u;
  *(_OWORD *)(v24 + 48) = 0u;
  *(_OWORD *)(v24 + 64) = 0u;
  *(_OWORD *)(v24 + 80) = 0u;
  *(_OWORD *)(v24 + 96) = 0u;
  *(_OWORD *)(v24 + 112) = 0u;
  *(_OWORD *)(v24 + 128) = 0u;
  *(_OWORD *)(v24 + 144) = 0u;
  *(_OWORD *)(v24 + 160) = 0u;
  *(_OWORD *)(v24 + 176) = 0u;
  uint64_t v25 = sub_2513809F0();
  *(void *)(v25 + 16) = 50;
  *(_OWORD *)(v25 + 32) = 0u;
  *(_OWORD *)(v25 + 48) = 0u;
  *(_OWORD *)(v25 + 64) = 0u;
  *(_OWORD *)(v25 + 80) = 0u;
  *(_OWORD *)(v25 + 96) = 0u;
  *(_OWORD *)(v25 + 112) = 0u;
  *(_OWORD *)(v25 + 128) = 0u;
  *(_OWORD *)(v25 + 144) = 0u;
  *(_OWORD *)(v25 + 160) = 0u;
  *(_OWORD *)(v25 + 176) = 0u;
  *(_OWORD *)(v25 + 192) = 0u;
  *(_OWORD *)(v25 + 208) = 0u;
  *(_OWORD *)(v25 + 224) = 0u;
  *(_OWORD *)(v25 + 240) = 0u;
  *(_OWORD *)(v25 + 256) = 0u;
  *(_OWORD *)(v25 + 272) = 0u;
  *(_OWORD *)(v25 + 288) = 0u;
  *(_OWORD *)(v25 + 304) = 0u;
  *(_OWORD *)(v25 + 320) = 0u;
  *(_OWORD *)(v25 + 336) = 0u;
  *(_OWORD *)(v25 + 352) = 0u;
  *(_OWORD *)(v25 + 368) = 0u;
  *(_OWORD *)(v25 + 384) = 0u;
  *(_OWORD *)(v25 + 400) = 0u;
  *(_OWORD *)(v25 + 416) = 0u;
  uint64_t v26 = sub_2513809F0();
  *(void *)(v26 + 16) = 50;
  *(_OWORD *)(v26 + 32) = 0u;
  *(_OWORD *)(v26 + 48) = 0u;
  *(_OWORD *)(v26 + 64) = 0u;
  *(_OWORD *)(v26 + 80) = 0u;
  *(_OWORD *)(v26 + 96) = 0u;
  *(_OWORD *)(v26 + 112) = 0u;
  *(_OWORD *)(v26 + 128) = 0u;
  *(_OWORD *)(v26 + 144) = 0u;
  *(_OWORD *)(v26 + 160) = 0u;
  *(_OWORD *)(v26 + 176) = 0u;
  *(_OWORD *)(v26 + 192) = 0u;
  *(_OWORD *)(v26 + 208) = 0u;
  *(_OWORD *)(v26 + 224) = 0u;
  *(_OWORD *)(v26 + 240) = 0u;
  *(_OWORD *)(v26 + 256) = 0u;
  *(_OWORD *)(v26 + 272) = 0u;
  *(_OWORD *)(v26 + 288) = 0u;
  *(_OWORD *)(v26 + 304) = 0u;
  *(_OWORD *)(v26 + 320) = 0u;
  *(_OWORD *)(v26 + 336) = 0u;
  *(_OWORD *)(v26 + 352) = 0u;
  *(_OWORD *)(v26 + 368) = 0u;
  *(_OWORD *)(v26 + 384) = 0u;
  *(_OWORD *)(v26 + 400) = 0u;
  *(_OWORD *)(v26 + 416) = 0u;
  uint64_t v27 = sub_2513809F0();
  *(void *)(v27 + 16) = 50;
  *(_OWORD *)(v27 + 32) = 0u;
  *(_OWORD *)(v27 + 48) = 0u;
  *(_OWORD *)(v27 + 64) = 0u;
  *(_OWORD *)(v27 + 80) = 0u;
  *(_OWORD *)(v27 + 96) = 0u;
  *(_OWORD *)(v27 + 112) = 0u;
  *(_OWORD *)(v27 + 128) = 0u;
  *(_OWORD *)(v27 + 144) = 0u;
  *(_OWORD *)(v27 + 160) = 0u;
  *(_OWORD *)(v27 + 176) = 0u;
  *(_OWORD *)(v27 + 192) = 0u;
  *(_OWORD *)(v27 + 208) = 0u;
  *(_OWORD *)(v27 + 224) = 0u;
  *(_OWORD *)(v27 + 240) = 0u;
  *(_OWORD *)(v27 + 256) = 0u;
  *(_OWORD *)(v27 + 272) = 0u;
  *(_OWORD *)(v27 + 288) = 0u;
  *(_OWORD *)(v27 + 304) = 0u;
  *(_OWORD *)(v27 + 320) = 0u;
  *(_OWORD *)(v27 + 336) = 0u;
  *(_OWORD *)(v27 + 352) = 0u;
  *(_OWORD *)(v27 + 368) = 0u;
  *(_OWORD *)(v27 + 384) = 0u;
  *(_OWORD *)(v27 + 400) = 0u;
  *(_OWORD *)(v27 + 416) = 0u;
  uint64_t v28 = sub_2513809F0();
  *(void *)(v28 + 16) = 50;
  *(_OWORD *)(v28 + 32) = 0u;
  *(_OWORD *)(v28 + 48) = 0u;
  *(_OWORD *)(v28 + 64) = 0u;
  *(_OWORD *)(v28 + 80) = 0u;
  *(_OWORD *)(v28 + 96) = 0u;
  *(_OWORD *)(v28 + 112) = 0u;
  *(_OWORD *)(v28 + 128) = 0u;
  *(_OWORD *)(v28 + 144) = 0u;
  *(_OWORD *)(v28 + 160) = 0u;
  *(_OWORD *)(v28 + 176) = 0u;
  *(_OWORD *)(v28 + 192) = 0u;
  *(_OWORD *)(v28 + 208) = 0u;
  *(_OWORD *)(v28 + 224) = 0u;
  *(_OWORD *)(v28 + 240) = 0u;
  *(_OWORD *)(v28 + 256) = 0u;
  *(_OWORD *)(v28 + 272) = 0u;
  *(_OWORD *)(v28 + 288) = 0u;
  *(_OWORD *)(v28 + 304) = 0u;
  *(_OWORD *)(v28 + 320) = 0u;
  *(_OWORD *)(v28 + 336) = 0u;
  *(_OWORD *)(v28 + 352) = 0u;
  *(_OWORD *)(v28 + 368) = 0u;
  *(_OWORD *)(v28 + 384) = 0u;
  *(_OWORD *)(v28 + 400) = 0u;
  *(_OWORD *)(v28 + 416) = 0u;
  uint64_t v29 = sub_2513809F0();
  *(void *)(v29 + 16) = 20;
  *(_OWORD *)(v29 + 32) = 0u;
  *(_OWORD *)(v29 + 48) = 0u;
  *(_OWORD *)(v29 + 64) = 0u;
  *(_OWORD *)(v29 + 80) = 0u;
  *(_OWORD *)(v29 + 96) = 0u;
  *(_OWORD *)(v29 + 112) = 0u;
  *(_OWORD *)(v29 + 128) = 0u;
  *(_OWORD *)(v29 + 144) = 0u;
  *(_OWORD *)(v29 + 160) = 0u;
  *(_OWORD *)(v29 + 176) = 0u;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(double *)(a9 + 24) = a10;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  *(double *)(a9 + 48) = a11;
  *(void *)(a9 + 56) = a6;
  *(void *)(a9 + 64) = a7;
  *(double *)(a9 + 72) = a12;
  *(void *)(a9 + 80) = a8;
  *(void *)(a9 + 88) = a14;
  *(double *)(a9 + 96) = a13;
  *(void *)(a9 + 104) = a15;
  *(void *)(a9 + 112) = a16;
  return result;
}

uint64_t sub_251369F08()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_251369F40(uint64_t a1)
{
  return sub_251358874(a1, v1, (void (*)(uint64_t))sub_251349AAC);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_251369F88(uint64_t a1)
{
  return sub_251358874(a1, v1, (void (*)(uint64_t))sub_25134D790);
}

uint64_t sub_251369FB8()
{
  return objectdestroy_17Tm(40);
}

id sub_251369FC0(void *a1, char a2)
{
  return sub_251354B40(a1, a2, v2[2], v2[3], v2[4]);
}

void sub_251369FCC(id a1, unsigned __int8 a2)
{
  if (a2 != 0xFF) {
    sub_251369FE0(a1, a2);
  }
}

void sub_251369FE0(id a1, unsigned __int8 a2)
{
  if (a2 <= 3u) {
}
  }

uint64_t sub_251369FF4(uint64_t a1)
{
  return a1;
}

uint64_t sub_25136A020(uint64_t a1, int a2)
{
  if ((~a2 & 0xFEFE) != 0) {
    return sub_25136A034(a1, a2);
  }
  return a1;
}

uint64_t sub_25136A034(uint64_t a1, unsigned __int16 a2)
{
  if ((unsigned __int16)(a2 >> 14) <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25136A048(uint64_t a1, int a2)
{
  if ((~a2 & 0xFEFE) != 0) {
    return j__swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25136A060(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0xFEFEFEFEFEFELL) != 0x1EFEFEFEFELL) {
    return sub_25136A084(a1, a2);
  }
  return a1;
}

uint64_t sub_25136A084(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 46) & 3) != 3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25136A098(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 0xFDu) {
    return j__swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25136A0AC()
{
  return objectdestroy_24Tm((void (*)(void, void))sub_25136A034);
}

uint64_t sub_25136A0C4()
{
  return objectdestroy_24Tm((void (*)(void, void))j__swift_bridgeObjectRelease);
}

uint64_t objectdestroy_24Tm(void (*a1)(void, void))
{
  a1(*(void *)(v1 + 16), *(unsigned __int16 *)(v1 + 24));
  return MEMORY[0x270FA0238](v1, 26, 7);
}

uint64_t sub_25136A120()
{
  sub_25136A084(*(void *)(v0 + 16), *(unsigned int *)(v0 + 24) | ((unint64_t)*(unsigned __int16 *)(v0 + 28) << 32));
  return MEMORY[0x270FA0238](v0, 30, 7);
}

uint64_t sub_25136A164()
{
  j__swift_bridgeObjectRelease(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned __int8 *)(v0 + 32));
  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_25136A1A4(uint64_t a1, void *a2)
{
  return sub_25135AD74(a1, a2, v2[2], v2[3], v2[4], v2[5]);
}

void sub_25136A1C8()
{
  sub_251348E54(v0 + 16, *(void (**)(uint64_t, void))(v0 + 64));
}

uint64_t sub_25136A1D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25136A220(uint64_t a1, unsigned __int16 a2)
{
  if ((unsigned __int16)(a2 >> 14) <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25136A234(uint64_t a1, unint64_t a2)
{
  if (((a2 >> 46) & 3) != 3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25136A248@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v9 = *a3;
  uint64_t v10 = a3[1];
  Swift::Double v11 = *(double *)a4;
  Swift::Double v12 = *(double *)(a4 + 8);
  uint64_t v13 = *(unsigned __int8 *)(a4 + 16);
  char v14 = *(unsigned char *)(a4 + 32);
  uint64_t v15 = sub_2513809F0();
  *(void *)(v15 + 16) = 8;
  *(_OWORD *)(v15 + 32) = 0u;
  *(_OWORD *)(v15 + 48) = 0u;
  *(_OWORD *)(v15 + 64) = 0u;
  *(_OWORD *)(v15 + 80) = 0u;
  if (v13 == 2)
  {
    swift_bridgeObjectRelease();
    uint64_t v16 = 0;
    Swift::Double v11 = 0.0;
    Swift::Double v12 = 0.0;
    Swift::Double v17 = 0.0;
  }
  else
  {
    v40[0] = v9;
    v40[1] = v10;
    uint64_t v13 = (uint64_t)v40;
    Swift::Double v17 = HTHeadphoneCalibration.dBFS(fromdBHL:atFrequency:)(v12, v11);
    swift_bridgeObjectRelease();
    if (v14) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = -1;
    }
  }
  switch(a2 >> 62)
  {
    case 1uLL:
      if ((int)a1 > a1 >> 32) {
        goto LABEL_49;
      }
      uint64_t v13 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      sub_2513430F0(a1, a2);
      uint64_t v20 = sub_251380470();
      if (!v20)
      {
        sub_251380480();
        __break(1u);
LABEL_55:
        sub_251380480();
        __break(1u);
        JUMPOUT(0x25136A608);
      }
      uint64_t v21 = v20;
      uint64_t v22 = sub_251380490();
      uint64_t v23 = (int)a1 - v22;
      if (__OFSUB__((int)a1, v22)) {
        goto LABEL_51;
      }
      sub_251380480();
      sub_2512FA390(a1, a2);
      LODWORD(v18) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_53;
      }
      v19 = (char *)(v21 + v23);
      uint64_t v18 = (int)v18;
      if ((int)v18 <= 59) {
        goto LABEL_14;
      }
      goto LABEL_19;
    case 2uLL:
      uint64_t v13 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v28 = *(void *)(a1 + 16);
      swift_retain();
      swift_retain();
      uint64_t v29 = sub_251380470();
      if (!v29) {
        goto LABEL_55;
      }
      uint64_t v30 = v29;
      uint64_t v31 = sub_251380490();
      BOOL v32 = __OFSUB__(v28, v31);
      uint64_t v33 = v28 - v31;
      if (v32) {
        goto LABEL_50;
      }
      sub_251380480();
      swift_release();
      swift_release();
      uint64_t v35 = *(void *)(a1 + 16);
      uint64_t v34 = *(void *)(a1 + 24);
      BOOL v32 = __OFSUB__(v34, v35);
      uint64_t v18 = v34 - v35;
      if (v32) {
        goto LABEL_52;
      }
      v19 = (char *)(v30 + v33);
      if (v18 > 59)
      {
LABEL_19:
        uint64_t v36 = sub_2512ECA18(v19, (unint64_t)v18 >> 2);
        if (*(void *)(v36 + 16) < 4uLL)
        {
          __break(1u);
        }
        else
        {
          uint64_t v13 = v36;
          float v5 = *(float *)(v36 + 44);
          if (swift_isUniquelyReferenced_nonNull_native())
          {
            unint64_t v37 = *(void *)(v15 + 16);
            if (v37) {
              goto LABEL_22;
            }
            goto LABEL_37;
          }
        }
        uint64_t v15 = (uint64_t)sub_2512F75D4((void *)v15);
        unint64_t v37 = *(void *)(v15 + 16);
        if (v37)
        {
LABEL_22:
          *(double *)(v15 + 32) = v5;
          unint64_t v38 = *(void *)(v13 + 16);
          if (v38 >= 0xB)
          {
            if (v37 >= 2)
            {
              *(double *)(v15 + 40) = *(float *)(v13 + 48);
              if (v37 != 2)
              {
                *(double *)(v15 + 48) = *(float *)(v13 + 52);
                if (v37 >= 4)
                {
                  *(double *)(v15 + 56) = *(float *)(v13 + 56);
                  if (v37 != 4)
                  {
                    *(double *)(v15 + 64) = *(float *)(v13 + 60);
                    if (v37 >= 6)
                    {
                      *(double *)(v15 + 72) = *(float *)(v13 + 64);
                      if (v37 != 6)
                      {
                        *(double *)(v15 + 80) = *(float *)(v13 + 68);
                        if (v37 >= 8)
                        {
                          *(double *)(v15 + 88) = *(float *)(v13 + 72);
                          if (v38 >= 0xC)
                          {
                            if (v38 != 12)
                            {
                              if (v38 >= 0xE)
                              {
                                double v27 = *(float *)(v13 + 76);
                                double v26 = *(float *)(v13 + 80);
                                float v39 = *(float *)(v13 + 84);
                                swift_release();
                                uint64_t result = sub_2512FA390(a1, a2);
                                double v25 = v39;
                                goto LABEL_34;
                              }
LABEL_48:
                              __break(1u);
LABEL_49:
                              __break(1u);
LABEL_50:
                              __break(1u);
LABEL_51:
                              __break(1u);
LABEL_52:
                              __break(1u);
LABEL_53:
                              __break(1u);
                            }
LABEL_47:
                            __break(1u);
                            goto LABEL_48;
                          }
LABEL_46:
                          __break(1u);
                          goto LABEL_47;
                        }
LABEL_45:
                        __break(1u);
                        goto LABEL_46;
                      }
LABEL_44:
                      __break(1u);
                      goto LABEL_45;
                    }
LABEL_43:
                    __break(1u);
                    goto LABEL_44;
                  }
LABEL_42:
                  __break(1u);
                  goto LABEL_43;
                }
LABEL_41:
                __break(1u);
                goto LABEL_42;
              }
LABEL_40:
              __break(1u);
              goto LABEL_41;
            }
LABEL_39:
            __break(1u);
            goto LABEL_40;
          }
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
LABEL_37:
        __break(1u);
        goto LABEL_38;
      }
LABEL_14:
      uint64_t result = sub_2512FA390(a1, a2);
      double v25 = 0.0;
      double v26 = 0.0;
      double v27 = 0.0;
LABEL_34:
      *(void *)a5 = v15;
      *(double *)(a5 + 8) = v27;
      *(Swift::Double *)(a5 + 16) = v17;
      *(Swift::Double *)(a5 + 24) = v12;
      *(Swift::Double *)(a5 + 32) = v11;
      *(void *)(a5 + 40) = v16;
      *(double *)(a5 + 48) = v26;
      *(double *)(a5 + 56) = v25;
      return result;
    case 3uLL:
      goto LABEL_14;
    default:
      uint64_t v18 = BYTE6(a2);
      v19 = &v41;
      if (BYTE6(a2) > 0x3BuLL) {
        goto LABEL_19;
      }
      goto LABEL_14;
  }
}

uint64_t sub_25136A618(uint64_t a1)
{
  return a1;
}

uint64_t sub_25136A644()
{
  return objectdestroy_17Tm(32);
}

uint64_t objectdestroy_17Tm(uint64_t a1)
{
  swift_release();
  return MEMORY[0x270FA0238](v1, a1, 7);
}

void sub_25136A698(char a1)
{
  sub_25135D5C8(a1, *(void *)(v1 + 16));
}

void sub_25136A6A0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B31D58);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  int64_t v3 = (char *)v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  float v5 = (char *)v30 - v4;
  id v6 = objc_msgSend(self, sel_processInfo);
  id v7 = objc_msgSend(v6, sel_processName);

  uint64_t v8 = sub_251380850();
  id v9 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v10 = (void *)sub_251380840();
  id v11 = objc_msgSend(v9, sel_initWithSuiteName_, v10);

  if (!v11)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  Swift::Double v12 = (void *)sub_251380840();
  id v13 = objc_msgSend(v11, sel_stringForKey_, v12);

  if (v13)
  {
    sub_251380850();
    swift_bridgeObjectRelease();

    return;
  }

  if (qword_269B316A0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_2513806D0();
  __swift_project_value_buffer(v14, (uint64_t)qword_269B31B88);
  uint64_t v15 = sub_2513806B0();
  os_log_type_t v16 = sub_251380C40();
  if (os_log_type_enabled(v15, v16))
  {
    Swift::Double v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)Swift::Double v17 = 0;
    _os_log_impl(&dword_2512DB000, v15, v16, "Marking current session timestamp", v17, 2u);
    MEMORY[0x25339CCC0](v17, -1, -1);
  }
  v30[1] = v8;

  id v18 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  v19 = (void *)sub_251380840();
  id v20 = objc_msgSend(v18, sel_initWithSuiteName_, v19);

  if (!v20) {
    goto LABEL_14;
  }
  sub_251380580();
  uint64_t v21 = sub_251380590();
  uint64_t v22 = *(void *)(v21 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v5, 0, 1, v21);
  sub_2512F4B18((uint64_t)v5, (uint64_t)v3, &qword_269B31D58);
  uint64_t v23 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v3, 1, v21) != 1)
  {
    uint64_t v23 = sub_251380550();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v3, v21);
  }
  uint64_t v24 = (void *)sub_251380840();
  objc_msgSend(v20, sel_setValue_forKey_, v23, v24);
  swift_unknownObjectRelease();

  sub_251307F68((uint64_t)v5, &qword_269B31D58);
  id v25 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  double v26 = (void *)sub_251380840();
  id v27 = objc_msgSend(v25, sel_initWithSuiteName_, v26);

  if (v27)
  {
    swift_bridgeObjectRetain();
    uint64_t v28 = (void *)sub_251380840();
    swift_bridgeObjectRelease();
    uint64_t v29 = (void *)sub_251380840();
    objc_msgSend(v27, sel_setValue_forKey_, v28, v29);

    return;
  }
LABEL_15:
  __break(1u);
}

uint64_t sub_25136AB50(uint64_t a1, unsigned __int8 a2)
{
  if (a2 != 0xFF) {
    return sub_2513439B0(a1, a2);
  }
  return a1;
}

void sub_25136AB64(uint64_t a1)
{
  sub_251361B50(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(_DWORD *)(v1 + 40), *(void **)(v1 + 48), *(void *)(v1 + 56));
}

id sub_25136AB78(id result, unsigned __int8 a2)
{
  if (a2 <= 3u) {
    return result;
  }
  return result;
}

id sub_25136AB8C(id result, unsigned __int8 a2)
{
  if (a2 != 0xFF) {
    return sub_25136AB78(result, a2);
  }
  return result;
}

unint64_t sub_25136ABA4()
{
  unint64_t result = qword_269B323F8;
  if (!qword_269B323F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B323F8);
  }
  return result;
}

uint64_t sub_25136ABF8()
{
  return sub_2512F7D40(&qword_269B32400, &qword_269B32408);
}

unint64_t sub_25136AC38()
{
  unint64_t result = qword_269B32410;
  if (!qword_269B32410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B32410);
  }
  return result;
}

uint64_t sub_25136AC8C()
{
  return sub_2512F7D40(&qword_269B32418, &qword_269B32420);
}

unint64_t sub_25136ACCC()
{
  unint64_t result = qword_269B32428;
  if (!qword_269B32428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B32428);
  }
  return result;
}

uint64_t sub_25136AD20()
{
  return sub_2512F7D40(&qword_269B32430, &qword_269B32438);
}

unint64_t sub_25136AD60()
{
  unint64_t result = qword_269B32440;
  if (!qword_269B32440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B32440);
  }
  return result;
}

unint64_t sub_25136ADB8()
{
  unint64_t result = qword_269B32448;
  if (!qword_269B32448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B32448);
  }
  return result;
}

unint64_t sub_25136AE10()
{
  unint64_t result = qword_269B32450;
  if (!qword_269B32450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B32450);
  }
  return result;
}

unint64_t sub_25136AE68()
{
  unint64_t result = qword_269B32458;
  if (!qword_269B32458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B32458);
  }
  return result;
}

unint64_t sub_25136AEC0()
{
  unint64_t result = qword_269B32460;
  if (!qword_269B32460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B32460);
  }
  return result;
}

unint64_t sub_25136AF18()
{
  unint64_t result = qword_269B32468;
  if (!qword_269B32468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B32468);
  }
  return result;
}

__n128 sub_25136AF6C@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  char v4 = *(unsigned char *)(v3 + 152);
  __n128 result = *(__n128 *)(v3 + 120);
  long long v6 = *(_OWORD *)(v3 + 136);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 32) = v4;
  return result;
}

__n128 sub_25136AFC0(__n128 *a1, uint64_t *a2)
{
  __n128 v7 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unint64_t v3 = a1[1].n128_u64[1];
  unsigned __int8 v4 = a1[2].n128_u8[0];
  uint64_t v5 = *a2;
  swift_beginAccess();
  __n128 result = v7;
  *(__n128 *)(v5 + 120) = v7;
  *(void *)(v5 + 136) = v2;
  *(void *)(v5 + 144) = v3;
  *(unsigned char *)(v5 + 152) = v4;
  return result;
}

ValueMetadata *type metadata accessor for HTFaultState()
{
  return &type metadata for HTFaultState;
}

uint64_t getEnumTagSinglePayload for HTHearingTestFaultState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HTHearingTestFaultState(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x25136B194);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTHearingTestFaultState()
{
  return &type metadata for HTHearingTestFaultState;
}

uint64_t getEnumTagSinglePayload for HTFaultStatusWithReason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for HTFaultStatusWithReason(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *__n128 result = a2 + 7;
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
        JUMPOUT(0x25136B328);
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
          *__n128 result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTFaultStatusWithReason()
{
  return &type metadata for HTFaultStatusWithReason;
}

uint64_t getEnumTagSinglePayload for HTFaultCheckFailReason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xEA) {
    goto LABEL_17;
  }
  if (a2 + 22 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 22) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 22;
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
      return (*a1 | (v4 << 8)) - 22;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 22;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x17;
  int v8 = v6 - 23;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for HTFaultCheckFailReason(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 22 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 22) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE9)
  {
    unsigned int v6 = ((a2 - 234) >> 8) + 1;
    *__n128 result = a2 + 22;
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
        JUMPOUT(0x25136B4BCLL);
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
          *__n128 result = a2 + 22;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTFaultCheckFailReason()
{
  return &type metadata for HTFaultCheckFailReason;
}

uint64_t initializeBufferWithCopyOfBuffer for HTFaultCheckStatusWithReasons(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_251343BBC(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for HTFaultCheckStatusWithReasons(uint64_t a1)
{
  return sub_2513439B0(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t *assignWithCopy for HTFaultCheckStatusWithReasons(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_25136BE88(a1, a2, a3, (void (*)(void, void))sub_251343BBC, (void (*)(uint64_t, uint64_t))sub_2513439B0);
}

uint64_t assignWithTake for HTFaultCheckStatusWithReasons(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  unsigned __int8 v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_2513439B0(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTFaultCheckStatusWithReasons(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HTFaultCheckStatusWithReasons(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTFaultCheckStatusWithReasons()
{
  return &type metadata for HTFaultCheckStatusWithReasons;
}

uint64_t getEnumTagSinglePayload for HTFaultCheckStatus(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x7F) {
    goto LABEL_17;
  }
  if (a2 + 129 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 129) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 129;
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
      return (*a1 | (v4 << 8)) - 129;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 129;
    }
  }
LABEL_17:
  unsigned int v6 = (*a1 & 0x7E | (*a1 >> 7)) ^ 0x7F;
  if (v6 >= 0x7E) {
    unsigned int v6 = -1;
  }
  return v6 + 1;
}

unsigned char *storeEnumTagSinglePayload for HTFaultCheckStatus(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 129 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 129) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x7F) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x7E)
  {
    unsigned int v6 = ((a2 - 127) >> 8) + 1;
    *__n128 result = a2 - 127;
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
        JUMPOUT(0x25136B7C8);
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
          *__n128 result = 2 * (((-a2 >> 1) & 0x3F) - ((_BYTE)a2 << 6));
        break;
    }
  }
  return result;
}

uint64_t sub_25136B7F0(unsigned __int8 *a1)
{
  return *a1 >> 7;
}

unsigned char *sub_25136B7FC(unsigned char *result)
{
  *result &= ~0x80u;
  return result;
}

unsigned char *sub_25136B80C(unsigned char *result, char a2)
{
  *__n128 result = *result & 1 | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for HTFaultCheckStatus()
{
  return &type metadata for HTFaultCheckStatus;
}

unsigned char *_s11HearingTest25HTNoiseInterruptionStatusOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x25136B8FCLL);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTNoiseInterruptionStatus()
{
  return &type metadata for HTNoiseInterruptionStatus;
}

uint64_t sub_25136B938(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HTEnvironmentNoiseData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  return a1;
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t assignWithTake for HTEnvironmentNoiseData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTEnvironmentNoiseData(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 10)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTEnvironmentNoiseData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 10) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 10) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTEnvironmentNoiseData()
{
  return &type metadata for HTEnvironmentNoiseData;
}

uint64_t sub_25136BAC0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_WORD *)(a1 + 12) = *(_WORD *)(a2 + 12);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HTEnviNoiseData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(unsigned char *)(a1 + 10) = *(unsigned char *)(a2 + 10);
  *(unsigned char *)(a1 + 11) = *(unsigned char *)(a2 + 11);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  *(unsigned char *)(a1 + 13) = *(unsigned char *)(a2 + 13);
  return a1;
}

void *__swift_memcpy14_8(void *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(void *)((char *)result + 6) = *(uint64_t *)((char *)a2 + 6);
  *__n128 result = v2;
  return result;
}

uint64_t assignWithTake for HTEnviNoiseData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(unsigned char *)(a1 + 10) = *(unsigned char *)(a2 + 10);
  *(unsigned char *)(a1 + 11) = *(unsigned char *)(a2 + 11);
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(a2 + 12);
  *(unsigned char *)(a1 + 13) = *(unsigned char *)(a2 + 13);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTEnviNoiseData(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 14)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTEnviNoiseData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 14) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 14) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTEnviNoiseData()
{
  return &type metadata for HTEnviNoiseData;
}

uint64_t sub_25136BC94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HTEnvNoiseData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for HTEnvNoiseData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTEnvNoiseData(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTEnvNoiseData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTEnvNoiseData()
{
  return &type metadata for HTEnvNoiseData;
}

uint64_t initializeBufferWithCopyOfBuffer for HTAudioDeviceStatus(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_25136AB78(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

void destroy for HTAudioDeviceStatus(uint64_t a1)
{
}

uint64_t *assignWithCopy for HTAudioDeviceStatus(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_25136BE88(a1, a2, a3, (void (*)(void, void))sub_25136AB78, (void (*)(uint64_t, uint64_t))sub_251369FE0);
}

uint64_t *sub_25136BE88(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, void), void (*a5)(uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  unsigned __int8 v8 = *((unsigned char *)a2 + 8);
  a4(*a2, v8);
  uint64_t v9 = *a1;
  *a1 = v7;
  uint64_t v10 = *((unsigned __int8 *)a1 + 8);
  *((unsigned char *)a1 + 8) = v8;
  a5(v9, v10);
  return a1;
}

uint64_t assignWithTake for HTAudioDeviceStatus(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  unsigned __int8 v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  unsigned __int8 v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_251369FE0(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTAudioDeviceStatus(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HTAudioDeviceStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25136BFB4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_25136BFBC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for HTAudioDeviceStatus()
{
  return &type metadata for HTAudioDeviceStatus;
}

uint64_t *assignWithCopy for HTEnvironmentNoiseStatus(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_25136C36C(a1, a2, a3, (void (*)(void, void))j_j__swift_bridgeObjectRetain, (void (*)(uint64_t, uint64_t))j_j__swift_bridgeObjectRelease);
}

uint64_t getEnumTagSinglePayload for HTEnvironmentNoiseStatus(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x3FFF && *(unsigned char *)(a1 + 10)) {
    return (*(_DWORD *)a1 + 0x3FFF);
  }
  unsigned int v3 = (*(_WORD *)(a1 + 8) & 0xFE | (*(unsigned __int16 *)(a1 + 8) >> 15) | (*(unsigned __int16 *)(a1 + 8) >> 1) & 0x3F00) ^ 0x3FFF;
  if (v3 >= 0x3FFE) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for HTEnvironmentNoiseStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3FFE)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 0x3FFF;
    if (a3 >= 0x3FFF) {
      *(unsigned char *)(result + 10) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3FFF) {
      *(unsigned char *)(result + 10) = 0;
    }
    if (a2)
    {
      unsigned int v3 = ((-a2 >> 1) & 0x1FFF) - (a2 << 13);
      *(void *)__n128 result = 0;
      *(_WORD *)(result + 8) = (4 * v3) & 0xFE00 | (2 * (v3 & 0x7F));
    }
  }
  return result;
}

uint64_t sub_25136C0D4(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 8) >> 15;
}

uint64_t sub_25136C0E0(uint64_t result)
{
  *(_WORD *)(result + 8) &= ~0x8000u;
  return result;
}

uint64_t sub_25136C0F0(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 8) = *(_WORD *)(result + 8) & 0x101 | (a2 << 15);
  return result;
}

ValueMetadata *type metadata accessor for HTEnvironmentNoiseStatus()
{
  return &type metadata for HTEnvironmentNoiseStatus;
}

uint64_t initializeBufferWithCopyOfBuffer for HTNoiseStatus(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unsigned __int16 v4 = *(_WORD *)(a2 + 8);
  sub_25136A220(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(_WORD *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for HTNoiseStatus(uint64_t a1)
{
  return sub_25136A034(*(void *)a1, *(_WORD *)(a1 + 8));
}

uint64_t *assignWithCopy for HTNoiseStatus(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_25136C36C(a1, a2, a3, (void (*)(void, void))sub_25136A220, (void (*)(uint64_t, uint64_t))sub_25136A034);
}

uint64_t assignWithTake for HTNoiseStatus(uint64_t a1, uint64_t a2)
{
  __int16 v3 = *(_WORD *)(a2 + 8);
  uint64_t v4 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  unsigned __int16 v5 = *(_WORD *)(a1 + 8);
  *(_WORD *)(a1 + 8) = v3;
  sub_25136A034(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTNoiseStatus(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x3FFE && *(unsigned char *)(a1 + 10)) {
    return (*(_DWORD *)a1 + 16382);
  }
  unsigned int v3 = (*(_WORD *)(a1 + 8) & 0x3E00 | (*(unsigned __int16 *)(a1 + 8) >> 14) & 0xFFFFFE03 | (4
                                                                                          * (*(_WORD *)(a1 + 8) >> 1))) ^ 0x3FFF;
  if (v3 >= 0x3FFD) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for HTNoiseStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3FFD)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 16382;
    if (a3 >= 0x3FFE) {
      *(unsigned char *)(result + 10) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3FFE) {
      *(unsigned char *)(result + 10) = 0;
    }
    if (a2)
    {
      unsigned int v3 = ((-a2 >> 2) & 0xFFF) - (a2 << 12);
      *(void *)__n128 result = 0;
      *(_WORD *)(result + 8) = (4 * v3) & 0xFE00 | (2 * (v3 & 0x7F));
    }
  }
  return result;
}

uint64_t sub_25136C2A8(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 8) >> 14;
}

uint64_t sub_25136C2B4(uint64_t result)
{
  *(_WORD *)(result + 8) &= 0x3FFFu;
  return result;
}

uint64_t sub_25136C2C4(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 8) = *(_WORD *)(result + 8) & 0x101 | (a2 << 14);
  return result;
}

ValueMetadata *type metadata accessor for HTNoiseStatus()
{
  return &type metadata for HTNoiseStatus;
}

uint64_t initializeBufferWithCopyOfBuffer for HTEnvNoiseStatus(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unsigned __int16 v4 = *((_WORD *)a2 + 4);
  j__swift_bridgeObjectRetain(*a2, v4);
  *(void *)a1 = v3;
  *(_WORD *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for HTEnvNoiseStatus(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return j__swift_bridgeObjectRelease(*(void *)a1, *(unsigned __int16 *)(a1 + 8), a3);
}

uint64_t *assignWithCopy for HTEnvNoiseStatus(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_25136C36C(a1, a2, a3, (void (*)(void, void))j__swift_bridgeObjectRetain, (void (*)(uint64_t, uint64_t))j__swift_bridgeObjectRelease);
}

uint64_t *sub_25136C36C(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, void), void (*a5)(uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  unsigned __int16 v8 = *((_WORD *)a2 + 4);
  a4(*a2, v8);
  uint64_t v9 = *a1;
  *a1 = v7;
  uint64_t v10 = *((unsigned __int16 *)a1 + 4);
  *((_WORD *)a1 + 4) = v8;
  a5(v9, v10);
  return a1;
}

uint64_t *assignWithTake for HTEnvNoiseStatus(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  __int16 v4 = *((_WORD *)a2 + 4);
  uint64_t v5 = *a1;
  *a1 = *a2;
  uint64_t v6 = *((unsigned __int16 *)a1 + 4);
  *((_WORD *)a1 + 4) = v4;
  j__swift_bridgeObjectRelease(v5, v6, a3);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTEnvNoiseStatus(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x3FFD && *(unsigned char *)(a1 + 10)) {
    return (*(_DWORD *)a1 + 16381);
  }
  unsigned int v3 = (*(_WORD *)(a1 + 8) & 0x3E00 | (*(unsigned __int16 *)(a1 + 8) >> 14) & 0xFFFFFE03 | (4
                                                                                          * (*(_WORD *)(a1 + 8) >> 1))) ^ 0x3FFF;
  if (v3 >> 2 >= 0xFFF) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for HTEnvNoiseStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3FFC)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 16381;
    if (a3 >= 0x3FFD) {
      *(unsigned char *)(result + 10) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3FFD) {
      *(unsigned char *)(result + 10) = 0;
    }
    if (a2)
    {
      unsigned int v3 = ((-a2 >> 2) & 0xFFF) - (a2 << 12);
      *(void *)__n128 result = 0;
      *(_WORD *)(result + 8) = (4 * v3) & 0xFE00 | (2 * (v3 & 0x7F));
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTEnvNoiseStatus()
{
  return &type metadata for HTEnvNoiseStatus;
}

uint64_t initializeBufferWithCopyOfBuffer for HTEnviNoiseStatus(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(unsigned __int16 *)(a2 + 12);
  uint64_t v5 = *(unsigned int *)(a2 + 8);
  sub_25136A234(*(void *)a2, v5 | (v4 << 32));
  *(void *)a1 = v3;
  *(_WORD *)(a1 + 12) = v4;
  *(_DWORD *)(a1 + 8) = v5;
  return a1;
}

uint64_t destroy for HTEnviNoiseStatus(uint64_t a1)
{
  return sub_25136A084(*(void *)a1, *(unsigned int *)(a1 + 8) | ((unint64_t)*(unsigned __int16 *)(a1 + 12) << 32));
}

uint64_t assignWithCopy for HTEnviNoiseStatus(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(unsigned __int16 *)(a2 + 12);
  uint64_t v5 = *(unsigned int *)(a2 + 8);
  sub_25136A234(*(void *)a2, v5 | (v4 << 32));
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(unsigned int *)(a1 + 8) | ((unint64_t)*(unsigned __int16 *)(a1 + 12) << 32);
  *(void *)a1 = v3;
  *(_DWORD *)(a1 + 8) = v5;
  *(_WORD *)(a1 + 12) = v4;
  sub_25136A084(v6, v7);
  return a1;
}

uint64_t assignWithTake for HTEnviNoiseStatus(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  __int16 v4 = *((_WORD *)a2 + 6);
  int v5 = *((_DWORD *)a2 + 2);
  uint64_t v6 = a1 + 8;
  uint64_t v7 = *(unsigned int *)(a1 + 8);
  uint64_t v8 = *(void *)a1;
  unint64_t v9 = v7 | ((unint64_t)*(unsigned __int16 *)(v6 + 4) << 32);
  *(void *)a1 = v3;
  *(_DWORD *)uint64_t v6 = v5;
  *(_WORD *)(v6 + 4) = v4;
  sub_25136A084(v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTEnviNoiseStatus(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 14)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = (const float *)(a1 + 8);
  uint32x4_t v3 = (uint32x4_t)vld1q_dup_f32(v2);
  int8x16_t v4 = vandq_s8((int8x16_t)vshlq_u32(v3, (uint32x4_t)xmmword_251383970), (int8x16_t)xmmword_251383980);
  *(int8x8_t *)v4.i8 = vorr_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL));
  unsigned int v5 = v4.i32[0] | v4.i32[1] | (*(unsigned __int16 *)(a1 + 12) >> 1 << 28);
  if (v5 > 0x80000000) {
    int v6 = ~v5;
  }
  else {
    int v6 = -1;
  }
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for HTEnviNoiseStatus(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 14) = 1;
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
      *(void *)__n128 result = 0;
      *(_WORD *)(result + 12) = (-a2 >> 27) & 0x1E;
      *(_DWORD *)(result + 8) = (-4 * a2) & 0xFE00 | (2 * (-(char)a2 & 0x7F)) | (((-a2 >> 14) & 0x7F) << 17) & 0x1FFFFFF | ((-a2 >> 21) << 25);
      return result;
    }
    *(unsigned char *)(result + 14) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_25136C708(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 12) >> 14;
}

uint64_t sub_25136C714(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  uint64_t result = a1 + 8;
  unint64_t v3 = v2 | ((unint64_t)*(unsigned __int16 *)(result + 4) << 32);
  *(_DWORD *)uint64_t result = v2;
  *(_WORD *)(result + 4) = WORD2(v3) & 0x3FFF;
  return result;
}

uint64_t sub_25136C730(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 8);
  uint64_t result = a1 + 8;
  unint64_t v4 = (v3 | ((unint64_t)*(unsigned __int16 *)(result + 4) << 32)) & 0x101010101010101 | (a2 << 46);
  *(_DWORD *)uint64_t result = v3 & 0x1010101;
  *(_WORD *)(result + 4) = WORD2(v4);
  return result;
}

ValueMetadata *type metadata accessor for HTEnviNoiseStatus()
{
  return &type metadata for HTEnviNoiseStatus;
}

uint64_t destroy for HTEnvironmentalNoiseStatus(uint64_t a1)
{
  return j__swift_bridgeObjectRelease(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
}

uint64_t _s11HearingTest26HTEnvironmentalNoiseStatusOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  j__swift_bridgeObjectRetain(*a2, v4);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t *assignWithCopy for HTEnvironmentalNoiseStatus(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  j__swift_bridgeObjectRetain(*a2, v4);
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  uint64_t v8 = *((unsigned __int8 *)a1 + 16);
  *((unsigned char *)a1 + 16) = v5;
  j__swift_bridgeObjectRelease(v6, v7, v8);
  return a1;
}

uint64_t *assignWithTake for HTEnvironmentalNoiseStatus(uint64_t *a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = *((unsigned __int8 *)a1 + 16);
  *((unsigned char *)a1 + 16) = v3;
  j__swift_bridgeObjectRelease(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for HTEnvironmentalNoiseStatus(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7D && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 125);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 16) >> 6) & 0xFFFFFF83 | (4 * ((*(unsigned __int8 *)(a1 + 16) >> 1) & 0x1F))) ^ 0x7F;
  if (v3 >= 0x7C) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for HTEnvironmentalNoiseStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7C)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 125;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7D) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7D) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(void *)(result + 8) = 0;
      *(unsigned char *)(result + 16) = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

uint64_t sub_25136C90C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 6;
}

uint64_t sub_25136C918(uint64_t result)
{
  *(unsigned char *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_25136C928(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = *(unsigned char *)(result + 16) & 1 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for HTEnvironmentalNoiseStatus()
{
  return &type metadata for HTEnvironmentalNoiseStatus;
}

uint64_t dispatch thunk of HTRequirementStatusObserver.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HTRequirementStatusObserver.faultCheckStatusChanged(status:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of HTRequirementStatusObserver.environmentNoiseStatusChanged(status:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of HTRequirementStatusObserver.noiseStatusChanged(status:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of HTRequirementStatusObserver.envNoiseStatusChanged(status:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of HTRequirementStatusObserver.enviNoiseStatusChanged(status:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of HTRequirementStatusObserver.environmentalNoiseStatusChanged(status:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of HTRequirementStatusObserver.inEarStatusChanged(status:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

ValueMetadata *type metadata accessor for HTRequirementCheckType()
{
  return &type metadata for HTRequirementCheckType;
}

uint64_t dispatch thunk of HTRequirementStatusProviding.faultCheckStatus()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HTRequirementStatusProviding.hearingTestFaultCheckState()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HTRequirementStatusProviding.faultCheckStatusWithReasons()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of HTRequirementStatusProviding.hearingTestFaultCheckStatusWithReason()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of HTRequirementStatusProviding.hearingTestFaultCheckStatusWithReasonFetchOnDemand()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 40) + **(int **)(a3 + 40));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_251308058;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of HTRequirementStatusProviding.environmentNoiseStatus()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of HTRequirementStatusProviding.noiseStatus()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of HTRequirementStatusProviding.envNoiseStatus()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of HTRequirementStatusProviding.enviNoiseStatus()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of HTRequirementStatusProviding.environmentalNoiseStatus()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of HTRequirementStatusProviding.compatibleAudioDeviceStatus()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of HTRequirementStatusProviding.addObserver(_:for:queue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 96))();
}

uint64_t dispatch thunk of HTRequirementStatusProviding.removeObserver(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 104))();
}

uint64_t dispatch thunk of HTRequirementInterferenceFlagProviding.interferenceFlag(fromResponse:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for HTRequirementStatusManager()
{
  return self;
}

uint64_t method lookup function for HTRequirementStatusManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HTRequirementStatusManager);
}

uint64_t dispatch thunk of HTRequirementStatusManager.response.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 584))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.response.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 592))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.response.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 600))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 1344))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.NoiseUpdated(NoiseInterruption:Drum_OctBand16:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1360))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.interferenceFlag(fromResponse:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1368))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.isDiscoveryActivated()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1392))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.isDiscoveryActivated(timeOutInSeconds:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 1400) + **(int **)(*(void *)v1 + 1400));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_251306E2C;
  return v6(a1);
}

uint64_t dispatch thunk of HTRequirementStatusManager.otherHearingTestAlreadyActive()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1408))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.startListeningEnvNoise()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1448))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.stopListeningEnvNoise()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1456))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.faultCheckStatus()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1464))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.hearingTestFaultCheckState()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1472))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.faultCheckStatusWithReasons()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1480))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.hearingTestFaultCheckStatusWithReason()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1488))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.hearingTestFaultCheckStatusWithReasonFetchOnDemand()(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 1496) + **(int **)(*(void *)v1 + 1496));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_251306C34;
  return v6(a1);
}

uint64_t dispatch thunk of HTRequirementStatusManager.environmentNoiseStatus()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1528))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.noiseStatus()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1536))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.envNoiseStatus()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1544))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.enviNoiseStatus()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1552))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.environmentalNoiseStatus()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1560))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.compatibleAudioDeviceStatus()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1568))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.addObserver(_:for:queue:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1576))();
}

uint64_t dispatch thunk of HTRequirementStatusManager.removeObserver(_:for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 1584))();
}

ValueMetadata *type metadata accessor for HTRequirementStatusManagerInstance()
{
  return &type metadata for HTRequirementStatusManagerInstance;
}

uint64_t destroy for NoiseTuning()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NoiseTuning(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for NoiseTuning(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  a1[16] = a2[16];
  a1[17] = a2[17];
  a1[18] = a2[18];
  a1[19] = a2[19];
  a1[20] = a2[20];
  a1[21] = a2[21];
  a1[22] = a2[22];
  a1[23] = a2[23];
  a1[24] = a2[24];
  a1[25] = a2[25];
  a1[26] = a2[26];
  a1[27] = a2[27];
  a1[28] = a2[28];
  return a1;
}

__n128 __swift_memcpy232_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  long long v7 = a2[7];
  long long v8 = a2[8];
  long long v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  __n128 result = (__n128)a2[11];
  long long v11 = a2[12];
  long long v12 = a2[13];
  *(void *)(a1 + 224) = *((void *)a2 + 28);
  *(_OWORD *)(a1 + 192) = v11;
  *(_OWORD *)(a1 + 208) = v12;
  *(__n128 *)(a1 + 176) = result;
  return result;
}

uint64_t assignWithTake for NoiseTuning(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  long long v4 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v4;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  return a1;
}

uint64_t getEnumTagSinglePayload for NoiseTuning(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 232)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NoiseTuning(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 216) = 0u;
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
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 232) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 232) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NoiseTuning()
{
  return &type metadata for NoiseTuning;
}

uint64_t destroy for NoiseBuffer()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for NoiseBuffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v4 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for NoiseBuffer(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for NoiseBuffer(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  uint64_t v4 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NoiseBuffer(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NoiseBuffer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NoiseBuffer()
{
  return &type metadata for NoiseBuffer;
}

void *sub_25136D98C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for NoiseOutput(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

void *assignWithTake for NoiseOutput(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for NoiseOutput(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NoiseOutput(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NoiseOutput()
{
  return &type metadata for NoiseOutput;
}

uint64_t destroy for HTRequirementStatusObservationRequest(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HTRequirementStatusObservationRequest(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)swift_unknownObjectWeakCopyInit();
  uint64_t v5 = a2[2];
  v4[1] = a2[1];
  v4[2] = v5;
  long long v6 = (void *)a2[3];
  uint64_t v7 = a2[4];
  v4[3] = v6;
  v4[4] = v7;
  v4[5] = a2[5];
  id v8 = v6;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HTRequirementStatusObservationRequest(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)swift_unknownObjectWeakCopyAssign();
  v4[1] = a2[1];
  v4[2] = a2[2];
  uint64_t v5 = (void *)a2[3];
  long long v6 = (void *)v4[3];
  v4[3] = v5;
  id v7 = v5;

  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for HTRequirementStatusObservationRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_unknownObjectWeakTakeInit();
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(v3 + 24) = *(void *)(a2 + 24);
  __n128 result = *(__n128 *)(a2 + 32);
  *(__n128 *)(v3 + 32) = result;
  return result;
}

uint64_t assignWithTake for HTRequirementStatusObservationRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_unknownObjectWeakTakeAssign();
  *(_OWORD *)(v4 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = *(void *)(a2 + 24);

  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HTRequirementStatusObservationRequest(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  if ((*(void *)(a1 + 8) & 0xF000000000000007) != 0) {
    int v2 = *(_DWORD *)a1 & 0x7FFFFFFF;
  }
  else {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HTRequirementStatusObservationRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      *(void *)(result + 8) = 1;
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HTRequirementStatusObservationRequest()
{
  return &type metadata for HTRequirementStatusObservationRequest;
}

unint64_t sub_25136DD3C()
{
  unint64_t result = qword_269B32490;
  if (!qword_269B32490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B32490);
  }
  return result;
}

uint64_t sub_25136DD90(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_25136DDEC(uint64_t a1)
{
  return a1;
}

uint64_t sub_25136DE40()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25136DE78(uint64_t a1, uint64_t a2)
{
  sub_251359650(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_25136DE84()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_25136DEBC(uint64_t a1, uint64_t a2)
{
  sub_25134EA9C(a1, a2, *(void **)(v2 + 16), 2);
}

void sub_25136DEE0(uint64_t a1, uint64_t a2)
{
  sub_25134EA9C(a1, a2, *(void **)(v2 + 16), 1);
}

void sub_25136DF04(uint64_t a1, uint64_t a2)
{
  sub_25134EA9C(a1, a2, *(void **)(v2 + 16), 0);
}

void sub_25136DF28(uint64_t a1, uint64_t a2)
{
  sub_25134EA9C(a1, a2, *(void **)(v2 + 16), 3);
}

uint64_t sub_25136DF4C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B324A0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

void sub_25136DFFC(int a1, void *a2)
{
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B324A0) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_251361D54(a1, a2, v2 + v6, v7);
}

uint64_t sub_25136E0B8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25136E0F0()
{
  return sub_2513498F4();
}

uint64_t sub_25136E0F8(uint64_t a1)
{
  return a1;
}

void sub_25136E124(NSObject *a1)
{
  sub_25135BC2C(a1, *(void *)(v1 + 16));
}

uint64_t sub_25136E12C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_25136E16C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  sub_251354CBC(a1, a2, a3, a4, a5, a6, *(void *)(v6 + 16), *(unsigned __int16 **)(v6 + 24), *(void *)(v6 + 32));
}

void sub_25136E198()
{
  sub_251357BA4(*(void *)(v0 + 16));
}

uint64_t objectdestroy_36Tm()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t objectdestroy_39Tm()
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t type metadata accessor for Vector()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_25136E344()
{
  return swift_getWitnessTable();
}

uint64_t sub_25136E36C(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_25136E368(*a1, *a2, *(void *)(a3 + 16), *(void *)(a4 - 8));
}

uint64_t sub_25136E384()
{
  return sub_2513811E0();
}

uint64_t sub_25136E3E4()
{
  return sub_25136E384();
}

uint64_t sub_25136E3F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25136E380(a1, *v3, *(void *)(a2 + 16), *(void *)(a3 - 8));
}

uint64_t sub_25136E40C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  sub_2513811B0();
  sub_25136E380(v7, *v3, *(void *)(a2 + 16), v5);
  return sub_2513811E0();
}

uint64_t sub_25136E464@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void sub_25136E470(uint64_t a1)
{
  sub_25136E46C(*v1, *(void *)(a1 + 16));
}

void sub_25136E484(uint64_t a1)
{
  sub_25136E480(*v1, *(void *)(a1 + 16));
}

void sub_25136E494(uint64_t a1)
{
  sub_25136E360(*v1, *(void *)(a1 + 16));
}

uint64_t sub_25136E4A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return sub_25130809C(a1, a2, a4, a3, WitnessTable);
}

uint64_t sub_25136E530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9E078](a1, a2, a3, a4, MEMORY[0x263F8D708]);
}

uint64_t sub_25136E53C()
{
  swift_getWitnessTable();
  return sub_251380B50();
}

uint64_t sub_25136E5AC(void *a1)
{
  swift_getWitnessTable();
  uint64_t result = sub_251380B50();
  *a1 = v3;
  return result;
}

uint64_t sub_25136E61C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E078](a1, a2, a3, WitnessTable, v7);
}

void sub_25136E690(uint64_t a1)
{
  sub_25136E524(*v1, *(void *)(a1 + 16));
}

uint64_t sub_25136E6B4(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

void (*sub_25136E6C4(void *a1, uint64_t *a2, uint64_t a3))(void *a1)
{
  uint64_t v7 = malloc(0x28uLL);
  *a1 = v7;
  v7[4] = sub_25136E780(v7, *a2, *v3, *(void *)(a3 + 16));
  return sub_25136E738;
}

void sub_25136E738(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_25136E780(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(void *a1)
{
  uint64_t v4 = *(void *)(a4 - 8);
  *a1 = a4;
  a1[1] = v4;
  a1[2] = malloc(*(void *)(v4 + 64));
  sub_251380A80();
  return sub_25136E83C;
}

void sub_25136E83C(void *a1)
{
  uint64_t v1 = (void *)a1[2];
  (*(void (**)(void *, void))(a1[1] + 8))(v1, *a1);
  free(v1);
}

uint64_t sub_25136E88C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v3 = MEMORY[0x263F8D708];
  return MEMORY[0x270F9E070](a1, WitnessTable, v3);
}

void sub_25136E8FC(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

void *sub_25136E90C@<X0>(void *result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (__OFADD__(*result, a2)) {
    __break(1u);
  }
  else {
    *a3 = *result + a2;
  }
  return result;
}

uint64_t sub_25136E924@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = sub_25136F278(*a1, a2, *a3);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t sub_25136E95C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25136EDF8(a1, a2, a3, a4, MEMORY[0x263F8D870], MEMORY[0x263F8D170]);
}

uint64_t sub_25136E99C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_25136EDF8(a1, a2, a3, a4, MEMORY[0x263F8D1A0], MEMORY[0x263F8D180]);
}

void *sub_25136E9E0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1;
  }
  return result;
}

void *sub_25136E9F8(void *result)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    ++*result;
  }
  return result;
}

void sub_25136EA10(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
}

uint64_t sub_25136EA1C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t sub_25136EA70()
{
  return 2;
}

uint64_t sub_25136EA78()
{
  swift_getWitnessTable();
  uint64_t v0 = sub_25136F068();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25136EAD8()
{
  return sub_251380910();
}

uint64_t sub_25136EAFC()
{
  return swift_getWitnessTable();
}

uint64_t sub_25136EB18()
{
  return MEMORY[0x263F8D6E0];
}

uint64_t sub_25136EB24()
{
  return sub_25136EC78(&qword_269B32530);
}

uint64_t sub_25136EB58()
{
  return swift_getWitnessTable();
}

uint64_t sub_25136EB74()
{
  return swift_getWitnessTable();
}

uint64_t sub_25136EB90()
{
  return sub_25136EC78(&qword_269B32538);
}

uint64_t sub_25136EBC4()
{
  return swift_getWitnessTable();
}

uint64_t sub_25136EC28()
{
  return swift_getWitnessTable();
}

uint64_t sub_25136EC44()
{
  return sub_25136EC78(&qword_269B32540);
}

uint64_t sub_25136EC78(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B32300);
    sub_2513476E0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25136ECE8()
{
  return swift_getWitnessTable();
}

uint64_t sub_25136ED4C()
{
  return swift_getWitnessTable();
}

uint64_t sub_25136ED68()
{
  return MEMORY[0x263F8D6E8];
}

uint64_t sub_25136ED74(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25136EDB0()
{
  return swift_getWitnessTable();
}

uint64_t sub_25136EDF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t), uint64_t (*a6)(char *, char *, uint64_t, uint64_t))
{
  uint64_t v23 = a6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v11 = a5(0, AssociatedTypeWitness, AssociatedConformanceWitness);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v16 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v13);
  id v18 = (char *)&v22 - v17;
  char v19 = sub_251380820();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a2, v11);
  if ((v19 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
    goto LABEL_5;
  }
  char v20 = v23(v18, &v15[*(int *)(v11 + 36)], AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
  if ((v20 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_25136F06C(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v5 = sub_251380C00();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  long long v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v17 - v10;
  v17[1] = AssociatedConformanceWitness;
  LOBYTE(AssociatedConformanceWitness) = sub_251380820();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12(v11, a1, v5);
  v12(v9, a2, v5);
  if ((AssociatedConformanceWitness & 1) == 0)
  {
    uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
    v16(v9, v5);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v16)(v11, v5);
    goto LABEL_5;
  }
  char v13 = sub_251380820();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v14)(v11, v5);
  if ((v13 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_25136F278(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
    goto LABEL_12;
  }
  if (a2 >= 1)
  {
    if (v3 < 0 || v3 >= (unint64_t)a2) {
      goto LABEL_9;
    }
    return 0;
  }
  if (v3 <= 0 && v3 > a2) {
    return 0;
  }
LABEL_9:
  BOOL v4 = __OFADD__(result, a2);
  result += a2;
  if (v4) {
LABEL_12:
  }
    __break(1u);
  return result;
}

void sub_25136F2D8()
{
  qword_269B32548 = (uint64_t)&unk_270228720;
}

uint64_t static HTHearingTestSession.defaultFrequencies.getter()
{
  if (qword_269B31720 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

double static HTHearingTestSession.defaultInitialLevel.getter()
{
  return 60.0;
}

double static HTHearingTestSession.defaultMinLevel.getter()
{
  return -10.0;
}

double static HTHearingTestSession.defaultMaxLevel.getter()
{
  return 85.0;
}

uint64_t (*sub_25136F36C())()
{
  return j__swift_endAccess;
}

uint64_t HTHearingTestSession.__allocating_init(on:with:frequencies:initialLevel:minLevel:maxLevel:)(unsigned __int8 *a1, uint64_t *a2, uint64_t a3, double a4, double a5, double a6)
{
  uint64_t v12 = swift_allocObject();
  HTHearingTestSession.init(on:with:frequencies:initialLevel:minLevel:maxLevel:)(a1, a2, a3, a4, a5, a6);
  return v12;
}

uint64_t HTHearingTestSession.init(on:with:frequencies:initialLevel:minLevel:maxLevel:)(unsigned __int8 *a1, uint64_t *a2, uint64_t a3, double a4, double a5, double a6)
{
  uint64_t v7 = (void *)v6;
  unsigned __int8 v12 = *a1;
  uint64_t v13 = *a2;
  *(_OWORD *)(v6 + 56) = 0u;
  *(_OWORD *)(v6 + 72) = 0u;
  *(_OWORD *)(v6 + 88) = 0u;
  *(unsigned char *)(v6 + 104) = 0;
  *(void *)(v6 + 120) = 0;
  *(void *)(v6 + 128) = 0;
  *(void *)(v6 + 112) = 0;
  id v14 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v15 = (void *)sub_251380840();
  id v16 = objc_msgSend(v14, sel_initWithSuiteName_, v15);

  if (v16)
  {
    uint64_t v17 = sub_251308574();

    v7[18] = 0;
    v7[19] = 0;
    v7[17] = v17;
    v31[0] = v12;
    id v18 = (objc_class *)type metadata accessor for HTAudiometry();
    id v19 = objc_allocWithZone(v18);
    HTAudiometry.init(channel:initialLevel:minLevel:maxLevel:frequencies:kernelLength:)(v31, a3, a4, a5, a6, 4.0);
    v7[2] = v20;
    v7[5] = v18;
    v7[6] = &off_2702288E8;
    if (v13)
    {
      uint64_t v21 = sub_25136F6A0(v13);
      swift_bridgeObjectRelease();
      if (*(void *)(v21 + 16))
      {
        __swift_instantiateConcreteTypeFromMangledName(qword_269B32270);
        uint64_t v22 = sub_251380FC0();
      }
      else
      {
        uint64_t v22 = MEMORY[0x263F8EE80];
      }
      *(void *)uint64_t v31 = v22;
      uint64_t v23 = (double *)swift_bridgeObjectRetain();
      sub_2512ECB50(v23, 1, v31);
      swift_bridgeObjectRelease();
      uint64_t v24 = *(void *)v31;
      swift_beginAccess();
      uint64_t v25 = v7[5];
      uint64_t v26 = v7[6];
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v7 + 2), v25);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 64))(v24, v25, v26);
      swift_endAccess();
    }
    if (qword_269B31700 != -1) {
      swift_once();
    }
    id v27 = (void *)qword_269B36238;
    uint64_t v28 = (void *)v7[18];
    v7[18] = qword_269B36238;
    id v29 = v27;

    return (uint64_t)v7;
  }
  else
  {
    __break(1u);
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t sub_25136F6A0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    sub_2512FAC18(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = v9;
    do
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B32600);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B31D90);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2512FAC18(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_2512FAC18(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      *(void *)(v2 + 16) = v6 + 1;
      *(_OWORD *)(v2 + 16 * v6 + 32) = v8;
      v4 += 16;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t HTHearingTestSession.__allocating_init(on:with:statusManager:frequencies:initialLevel:minLevel:maxLevel:)(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  uint64_t v14 = swift_allocObject();
  HTHearingTestSession.init(on:with:statusManager:frequencies:initialLevel:minLevel:maxLevel:)(a1, a2, a3, a4, a5, a6, a7);
  return v14;
}

uint64_t HTHearingTestSession.init(on:with:statusManager:frequencies:initialLevel:minLevel:maxLevel:)(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  long long v8 = (void *)v7;
  char v14 = *a1;
  uint64_t v15 = *a2;
  *(_OWORD *)(v7 + 56) = 0u;
  uint64_t v16 = v7 + 56;
  *(_OWORD *)(v7 + 72) = 0u;
  *(_OWORD *)(v7 + 88) = 0u;
  *(unsigned char *)(v7 + 104) = 0;
  *(void *)(v7 + 120) = 0;
  *(void *)(v7 + 128) = 0;
  *(void *)(v7 + 112) = 0;
  id v17 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  id v18 = (void *)sub_251380840();
  id v19 = objc_msgSend(v17, sel_initWithSuiteName_, v18);

  if (v19)
  {
    uint64_t v20 = sub_251308574();

    v8[17] = v20;
    v8[18] = 0;
    uint64_t v21 = (void **)(v8 + 18);
    v8[19] = 0;
    LOBYTE(v55) = v14;
    uint64_t v22 = (objc_class *)type metadata accessor for HTAudiometry();
    id v23 = objc_allocWithZone(v22);
    HTAudiometry.init(channel:initialLevel:minLevel:maxLevel:frequencies:kernelLength:)((unsigned __int8 *)&v55, a4, a5, a6, a7, 4.0);
    v8[2] = v24;
    v8[5] = v22;
    v8[6] = &off_2702288E8;
    if (v15)
    {
      uint64_t v25 = sub_25136F6A0(v15);
      swift_bridgeObjectRelease();
      if (*(void *)(v25 + 16))
      {
        __swift_instantiateConcreteTypeFromMangledName(qword_269B32270);
        uint64_t v26 = sub_251380FC0();
      }
      else
      {
        uint64_t v26 = MEMORY[0x263F8EE80];
      }
      *(void *)&long long v55 = v26;
      id v27 = (double *)swift_bridgeObjectRetain();
      sub_2512ECB50(v27, 1, &v55);
      swift_bridgeObjectRelease();
      uint64_t v28 = v55;
      swift_beginAccess();
      uint64_t v29 = v8[5];
      uint64_t v30 = v8[6];
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v8 + 2), v29);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 64))(v28, v29, v30);
      swift_endAccess();
    }
    if (a3)
    {
      *((void *)&v56 + 1) = type metadata accessor for HTRequirementStatusManager();
      v57 = &protocol witness table for HTRequirementStatusManager;
      *(void *)&long long v55 = a3;
    }
    else
    {
      v57 = 0;
      long long v55 = 0u;
      long long v56 = 0u;
    }
    swift_beginAccess();
    swift_retain();
    sub_251377EB0((uint64_t)&v55, v16);
    swift_endAccess();
    if (qword_269B31700 != -1) {
      swift_once();
    }
    uint64_t v31 = (void *)qword_269B36238;
    BOOL v32 = *v21;
    *uint64_t v21 = (void *)qword_269B36238;
    id v33 = v31;

    if (qword_269B31698 != -1) {
      swift_once();
    }
    uint64_t v34 = (void *)qword_269B36218;
    uint64_t v35 = (void *)v8[19];
    v8[19] = qword_269B36218;
    id v36 = v34;

    unint64_t v37 = (void *)v8[19];
    if (v37)
    {
      uint64_t v38 = qword_269B316F0;
      id v39 = v37;
      if (v38 != -1) {
        swift_once();
      }
      if (byte_269B36232 == 1)
      {
        if (qword_269B316B0 != -1) {
          swift_once();
        }
        uint64_t v40 = sub_2513806D0();
        __swift_project_value_buffer(v40, (uint64_t)qword_269B31BB8);
        char v41 = sub_2513806B0();
        os_log_type_t v42 = sub_251380C40();
        if (os_log_type_enabled(v41, v42))
        {
          v43 = (uint8_t *)swift_slowAlloc();
          uint64_t v44 = swift_slowAlloc();
          *(void *)&long long v55 = v44;
          *(_DWORD *)v43 = 136446210;
          uint64_t v45 = sub_251381230();
          sub_2512F6F6C(v45, v46, (uint64_t *)&v55);
          sub_251380DB0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2512DB000, v41, v42, "[%{public}s] reset noise counter at session init", v43, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x25339CCC0](v44, -1, -1);
          MEMORY[0x25339CCC0](v43, -1, -1);
        }
      }
      sub_2512FBDB8();
    }
    else
    {
      if (qword_269B316F0 != -1) {
        swift_once();
      }
      if (byte_269B36232)
      {
        if (qword_269B316B0 != -1) {
          swift_once();
        }
        uint64_t v47 = sub_2513806D0();
        __swift_project_value_buffer(v47, (uint64_t)qword_269B31BB8);
        v48 = sub_2513806B0();
        os_log_type_t v49 = sub_251380C30();
        if (os_log_type_enabled(v48, v49))
        {
          v50 = (uint8_t *)swift_slowAlloc();
          uint64_t v51 = swift_slowAlloc();
          *(void *)&long long v55 = v51;
          *(_DWORD *)v50 = 136446210;
          uint64_t v52 = sub_251381230();
          sub_2512F6F6C(v52, v53, (uint64_t *)&v55);
          sub_251380DB0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2512DB000, v48, v49, "[%{public}s] failed to reset noise counter", v50, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x25339CCC0](v51, -1, -1);
          MEMORY[0x25339CCC0](v50, -1, -1);
        }
      }
    }
    swift_release();
    return (uint64_t)v8;
  }
  else
  {
    __break(1u);
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t sub_25136FED8(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 312) = a1;
  *(void *)(v3 + 320) = v2;
  *(void *)(v3 + 328) = *v2;
  uint64_t v5 = sub_2513806A0();
  *(void *)(v3 + 336) = v5;
  *(void *)(v3 + 344) = *(void *)(v5 - 8);
  *(void *)(v3 + 352) = swift_task_alloc();
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 360) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 376) = v6;
  *(unsigned char *)(v3 + 129) = *(unsigned char *)(a2 + 32);
  return MEMORY[0x270FA2498](sub_25136FFE0, 0, 0);
}

uint64_t sub_25136FFE0()
{
  uint64_t v101 = v0;
  if (!os_variant_has_internal_content()
    || (uint64_t v1 = *(void *)(v0 + 320), swift_beginAccess(), !*(void *)(v1 + 136)))
  {
    uint64_t v7 = *(unsigned __int8 *)(v0 + 376);
    if (v7 == 2) {
      goto LABEL_49;
    }
    uint64_t v8 = *(unsigned char *)(v0 + 129) & 1;
    sub_251380D40();
    if (qword_269B316B8 != -1) {
      swift_once();
    }
    uint64_t v96 = v8;
    if (qword_269B316C0 != -1) {
      swift_once();
    }
    uint64_t v10 = *(void *)(v0 + 360);
    uint64_t v9 = *(void *)(v0 + 368);
    uint64_t v12 = *(void *)(v0 + 344);
    uint64_t v11 = *(void *)(v0 + 352);
    uint64_t v13 = *(void *)(v0 + 336);
    uint64_t v14 = *(void *)(v0 + 320);
    uint64_t v15 = __swift_project_value_buffer(v13, (uint64_t)qword_269B31BD8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v15, v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B31C80);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_251381E60;
    unint64_t v17 = sub_251377F20();
    uint64_t v18 = 20302;
    if (v96) {
      uint64_t v18 = 5457241;
    }
    unint64_t v19 = 0xE200000000000000;
    if (v96) {
      unint64_t v19 = 0xE300000000000000;
    }
    *(void *)(v16 + 56) = MEMORY[0x263F8D310];
    *(void *)(v16 + 64) = v17;
    *(void *)(v16 + 32) = v18;
    *(void *)(v16 + 40) = v19;
    uint64_t v20 = MEMORY[0x263F8D538];
    uint64_t v21 = MEMORY[0x263F8D5B8];
    *(void *)(v16 + 96) = MEMORY[0x263F8D538];
    *(void *)(v16 + 104) = v21;
    *(void *)(v16 + 72) = v10;
    *(void *)(v16 + 136) = v20;
    *(void *)(v16 + 144) = v21;
    *(void *)(v16 + 112) = v9;
    LOBYTE(v86) = 2;
    sub_251380680();
    swift_bridgeObjectRelease();
    id v23 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    uint64_t v22 = v12 + 8;
    v23(v11, v13);
    uint64_t v24 = *(void *)(v14 + 112);
    BOOL v25 = __OFADD__(v24, v96);
    uint64_t v26 = v24 + v96;
    if (v25)
    {
      __break(1u);
      goto LABEL_53;
    }
    uint64_t v22 = v96;
    v7 &= 1u;
    uint64_t v27 = *(void *)(v0 + 320);
    *(void *)(v14 + 112) = v26;
    uint64_t v28 = v27 + 56;
    swift_beginAccess();
    sub_251377F74(v28, v0 + 16);
    if (*(void *)(v0 + 40))
    {
      uint64_t v29 = *(void *)(v0 + 384);
      uint64_t v30 = v7;
      uint64_t v32 = *(void *)(v0 + 360);
      uint64_t v31 = *(void *)(v0 + 368);
      sub_25137803C(v0 + 16, v0 + 56);
      sub_251377FDC(v0 + 16);
      uint64_t v33 = *(void *)(v0 + 80);
      uint64_t v34 = *(void *)(v0 + 88);
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), v33);
      v97[0] = v32;
      v97[1] = v31;
      uint64_t v7 = v30;
      char v98 = v30;
      uint64_t v99 = v29;
      char v100 = v96;
      char v35 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v34 + 8))(v97, v33, v34);
      id v37 = v36;
      uint64_t v38 = __swift_destroy_boxed_opaque_existential_0(v0 + 56);
      if (v35)
      {
        uint64_t v46 = *(void *)(v0 + 320);
        uint64_t v47 = *(void *)(v46 + 120);
        BOOL v25 = __OFADD__(v47, 1);
        uint64_t v48 = v47 + 1;
        if (v25)
        {
LABEL_55:
          __break(1u);
          goto LABEL_56;
        }
        *(void *)(v46 + 120) = v48;
        uint64_t v49 = *(void *)(v46 + 96);
        BOOL v25 = __OFADD__(v49, 1);
        uint64_t v50 = v49 + 1;
        if (v25)
        {
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }
        uint64_t v16 = 1;
LABEL_24:
        uint64_t v13 = *(void *)(v0 + 320);
        *(void *)(v13 + 96) = v50;
        id v95 = v37;
        if (v50 >= (uint64_t)v37) {
          LOBYTE(v9) = 1;
        }
        else {
          LOBYTE(v9) = v16 ^ 1;
        }
        if (qword_269B316F8 == -1)
        {
LABEL_28:
          if (byte_269B36233 == 1)
          {
            if (qword_269B316A0 != -1) {
              swift_once();
            }
            uint64_t v55 = sub_2513806D0();
            __swift_project_value_buffer(v55, (uint64_t)qword_269B31B88);
            long long v56 = sub_2513806B0();
            os_log_type_t v57 = sub_251380C40();
            if (!os_log_type_enabled(v56, v57)) {
              goto LABEL_38;
            }
            uint64_t v91 = *(void *)(v0 + 384);
            uint64_t v87 = *(void *)(v0 + 360);
            uint64_t v89 = *(void *)(v0 + 368);
            uint64_t v58 = swift_slowAlloc();
            uint64_t v93 = swift_slowAlloc();
            v97[0] = v93;
            *(_DWORD *)uint64_t v58 = 136448002;
            uint64_t v59 = sub_251381230();
            *(void *)(v0 + 256) = sub_2512F6F6C(v59, v60, v97);
            sub_251380DB0();
            swift_bridgeObjectRelease();
            *(_WORD *)(v58 + 12) = 2048;
            *(void *)(v0 + 264) = v87;
            uint64_t v22 = v96;
            sub_251380DB0();
            *(_WORD *)(v58 + 22) = 2048;
            *(void *)(v0 + 272) = v89;
            sub_251380DB0();
            *(_WORD *)(v58 + 32) = 2048;
            *(void *)(v0 + 280) = v91;
            sub_251380DB0();
            *(_WORD *)(v58 + 42) = 2048;
            *(void *)(v0 + 288) = v7;
            sub_251380DB0();
            *(_WORD *)(v58 + 52) = 1024;
            *(_DWORD *)(v0 + 420) = v96;
            sub_251380DB0();
            *(_WORD *)(v58 + 58) = 1024;
            uint64_t v16 = v16;
            *(_DWORD *)(v0 + 132) = v16;
            sub_251380DB0();
            *(_WORD *)(v58 + 64) = 2048;
            *(void *)(v0 + 304) = v95;
            sub_251380DB0();
            _os_log_impl(&dword_2512DB000, v56, v57, "[%{public}s] Current Tone freq %f lv %f dur %f ch %ld Response %{BOOL}d; Current Tone interferenceFlag %{b"
              "ool}d, When tone interference flag is true, repeat previous tone %ld times.",
              (uint8_t *)v58,
              0x4Au);
            swift_arrayDestroy();
            uint64_t v61 = v93;
          }
          else
          {
            if (qword_269B316A0 != -1) {
              swift_once();
            }
            uint64_t v62 = sub_2513806D0();
            __swift_project_value_buffer(v62, (uint64_t)qword_269B31B88);
            long long v56 = sub_2513806B0();
            os_log_type_t v63 = sub_251380C40();
            if (!os_log_type_enabled(v56, v63)) {
              goto LABEL_38;
            }
            uint64_t v92 = *(void *)(v0 + 384);
            uint64_t v88 = *(void *)(v0 + 360);
            uint64_t v90 = *(void *)(v0 + 368);
            uint64_t v58 = swift_slowAlloc();
            uint64_t v94 = v13;
            uint64_t v64 = swift_slowAlloc();
            v97[0] = v64;
            *(_DWORD *)uint64_t v58 = 136447746;
            uint64_t v65 = sub_251381230();
            *(void *)(v0 + 248) = sub_2512F6F6C(v65, v66, v97);
            uint64_t v22 = v96;
            sub_251380DB0();
            swift_bridgeObjectRelease();
            *(_WORD *)(v58 + 12) = 2048;
            *(void *)(v0 + 208) = v88;
            sub_251380DB0();
            *(_WORD *)(v58 + 22) = 2048;
            *(void *)(v0 + 216) = v90;
            uint64_t v16 = v16;
            sub_251380DB0();
            *(_WORD *)(v58 + 32) = 2048;
            *(void *)(v0 + 224) = v92;
            sub_251380DB0();
            *(_WORD *)(v58 + 42) = 2048;
            *(void *)(v0 + 232) = v7;
            sub_251380DB0();
            *(_WORD *)(v58 + 52) = 1024;
            *(_DWORD *)(v0 + 424) = v16;
            sub_251380DB0();
            *(_WORD *)(v58 + 58) = 2048;
            *(void *)(v0 + 240) = v95;
            sub_251380DB0();
            _os_log_impl(&dword_2512DB000, v56, v63, "[%{public}s] Current Tone freq %f lv %f dur %f ch %ld; Current Tone interferenceFlag %{BOOL}d, When tone i"
              "nterference flag is true, repeat previous tone %ld times.",
              (uint8_t *)v58,
              0x44u);
            swift_arrayDestroy();
            uint64_t v61 = v64;
            uint64_t v13 = v94;
          }
          MEMORY[0x25339CCC0](v61, -1, -1);
          MEMORY[0x25339CCC0](v58, -1, -1);
LABEL_38:

          if (v22) {
            char v67 = 1;
          }
          else {
            char v67 = v9;
          }
          if (v67)
          {
            uint64_t v68 = *(void *)(v0 + 320);
            *(unsigned char *)(v68 + 104) = 0;
            *(void *)(v13 + 96) = 0;
            uint64_t v69 = v68 + 16;
            swift_beginAccess();
            uint64_t v70 = *(void *)(v68 + 40);
            uint64_t v71 = *(void *)(v68 + 48);
            __swift_mutable_project_boxed_opaque_existential_1(v69, v70);
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v71 + 80))(v22, v16, v70, v71);
            swift_endAccess();
            goto LABEL_49;
          }
          if (qword_269B316A0 != -1) {
            swift_once();
          }
          uint64_t v72 = sub_2513806D0();
          __swift_project_value_buffer(v72, (uint64_t)qword_269B31B88);
          v73 = sub_2513806B0();
          os_log_type_t v74 = sub_251380C40();
          if (os_log_type_enabled(v73, v74))
          {
            uint64_t v75 = swift_slowAlloc();
            uint64_t v76 = swift_slowAlloc();
            v97[0] = v76;
            *(_DWORD *)uint64_t v75 = 136446466;
            uint64_t v77 = sub_251381230();
            *(void *)(v0 + 296) = sub_2512F6F6C(v77, v78, v97);
            sub_251380DB0();
            swift_bridgeObjectRelease();
            *(_WORD *)(v75 + 12) = 1024;
            *(_DWORD *)(v0 + 416) = 1;
            sub_251380DB0();
            _os_log_impl(&dword_2512DB000, v73, v74, "[%{public}s] Repeat Tone Flag %{BOOL}d", (uint8_t *)v75, 0x12u);
            swift_arrayDestroy();
            MEMORY[0x25339CCC0](v76, -1, -1);
            MEMORY[0x25339CCC0](v75, -1, -1);
          }

          uint64_t v79 = *(void *)(v0 + 320);
          uint64_t v80 = *(void *)(v79 + 128);
          BOOL v25 = __OFADD__(v80, 1);
          uint64_t v81 = v80 + 1;
          if (!v25)
          {
            *(void *)(v79 + 128) = v81;
LABEL_49:
            uint64_t v83 = *(void *)(v0 + 320);
            uint64_t v82 = *(void *)(v0 + 328);
            uint64_t v84 = swift_task_alloc();
            *(void *)(v0 + 400) = v84;
            *(void *)(v84 + 16) = v83;
            *(void *)(v84 + 24) = v82;
            v85 = (void *)swift_task_alloc();
            *(void *)(v0 + 408) = v85;
            void *v85 = v0;
            v85[1] = sub_251379034;
            uint64_t v38 = *(void *)(v0 + 312);
            unint64_t v42 = 0x8000000251386D70;
            uint64_t v45 = &type metadata for HTHearingTestSessionStatus;
            v43 = sub_251377F18;
            uint64_t v39 = 0;
            uint64_t v40 = 0;
            unint64_t v41 = 0xD000000000000017;
            uint64_t v44 = v84;
            return MEMORY[0x270FA2318](v38, v39, v40, v41, v42, v43, v44, v45);
          }
          __break(1u);
          goto LABEL_55;
        }
LABEL_53:
        swift_once();
        goto LABEL_28;
      }
    }
    else
    {
      sub_251377FDC(v0 + 16);
      id v51 = objc_allocWithZone(MEMORY[0x263EFFA40]);
      uint64_t v52 = (void *)sub_251380840();
      id v53 = objc_msgSend(v51, sel_initWithSuiteName_, v52, 36, v86, v16);

      if (!v53)
      {
LABEL_57:
        __break(1u);
        return MEMORY[0x270FA2318](v38, v39, v40, v41, v42, v43, v44, v45);
      }
      v54 = (void *)sub_251380840();
      id v37 = objc_msgSend(v53, sel_integerForKey_, v54);
    }
    uint64_t v16 = 0;
    uint64_t v50 = 0;
    goto LABEL_24;
  }
  char v2 = *(unsigned char *)(v0 + 129);
  long long v3 = *(_OWORD *)(v0 + 376);
  *(_OWORD *)(v0 + 96) = *(_OWORD *)(v0 + 360);
  *(_OWORD *)(v0 + 112) = v3;
  *(unsigned char *)(v0 + 128) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_251379038;
  uint64_t v5 = *(void *)(v0 + 312);
  return sub_251375EA4(v5, v0 + 96);
}

uint64_t sub_251370C18(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B325F8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v38 = v8;
  uint64_t v9 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t)(a2 + 2);
  swift_beginAccess();
  __swift_project_boxed_opaque_existential_1(a2 + 2, a2[5]);
  sub_2512DF094((uint64_t)v41);
  uint64_t v11 = __swift_project_boxed_opaque_existential_1(a2 + 2, a2[5]);
  uint64_t v12 = *v11;
  uint64_t v13 = (unsigned char *)(*v11 + OBJC_IVAR____TtC11HearingTest12HTAudiometry_testEnded);
  swift_beginAccess();
  double v14 = 1.0;
  if ((*v13 & 1) == 0) {
    double v14 = *(float *)(v12 + OBJC_IVAR____TtC11HearingTest12HTAudiometry_lastProgress);
  }
  if (qword_269B316A0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_2513806D0();
  __swift_project_value_buffer(v15, (uint64_t)qword_269B31B88);
  uint64_t v16 = sub_2513806B0();
  os_log_type_t v17 = sub_251380C40();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    id v37 = v9;
    uint64_t v19 = v18;
    uint64_t v35 = swift_slowAlloc();
    v40[0] = v35;
    *(_DWORD *)uint64_t v19 = 136446466;
    v34[1] = v19 + 4;
    uint64_t v20 = sub_251381230();
    uint64_t v36 = a1;
    uint64_t v39 = sub_2512F6F6C(v20, v21, v40);
    sub_251380DB0();
    uint64_t v10 = (uint64_t)(a2 + 2);
    a1 = v36;
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2048;
    uint64_t v39 = *(void *)&v14;
    sub_251380DB0();
    _os_log_impl(&dword_2512DB000, v16, v17, "[%{public}s] HT session progress %f", (uint8_t *)v19, 0x16u);
    uint64_t v22 = v35;
    swift_arrayDestroy();
    MEMORY[0x25339CCC0](v22, -1, -1);
    uint64_t v23 = v19;
    uint64_t v9 = v37;
    MEMORY[0x25339CCC0](v23, -1, -1);
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  unint64_t v24 = (*(unsigned __int8 *)(v7 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v25 = (v38 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = swift_allocObject();
  long long v27 = v41[3];
  *(_OWORD *)(v26 + 48) = v41[2];
  *(_OWORD *)(v26 + 64) = v27;
  uint64_t v28 = v42;
  long long v29 = v41[1];
  *(_OWORD *)(v26 + 16) = v41[0];
  *(_OWORD *)(v26 + 32) = v29;
  *(void *)(v26 + 80) = v28;
  *(void *)(v26 + 88) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v26 + v24, v9, v6);
  *(void *)(v26 + v25) = a3;
  swift_beginAccess();
  uint64_t v30 = a2[5];
  uint64_t v31 = a2[6];
  __swift_mutable_project_boxed_opaque_existential_1(v10, v30);
  uint64_t v32 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v31 + 96);
  swift_retain();
  v32(sub_251378F08, v26, v30, v31);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_25137102C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v127 = *a2;
  uint64_t v129 = a2[1];
  uint64_t v5 = a2[4];
  uint64_t v130 = a2[2];
  uint64_t v132 = a2[3];
  uint64_t v7 = a2[5];
  uint64_t v6 = a2[6];
  uint64_t v8 = a2[7];
  uint64_t v9 = a2[8];
  sub_2512EF6C0(a1, (uint64_t)v161);
  sub_2512EF6C0((uint64_t)v161, (uint64_t)v162);
  int v10 = sub_251310AAC((uint64_t)v162);
  uint64_t v11 = nullsub_1(v162);
  if (v10 == 1)
  {
    uint64_t v12 = v11 + 16;
    if (*(unsigned char *)(v11 + 8) == 1)
    {
      long long v13 = *(_OWORD *)(v11 + 192);
      long long v157 = *(_OWORD *)(v11 + 176);
      long long v158 = v13;
      long long v159 = *(_OWORD *)(v11 + 208);
      uint64_t v160 = *(void *)(v11 + 224);
      long long v14 = *(_OWORD *)(v11 + 128);
      long long v153 = *(_OWORD *)(v11 + 112);
      long long v154 = v14;
      long long v15 = *(_OWORD *)(v11 + 160);
      long long v155 = *(_OWORD *)(v11 + 144);
      long long v156 = v15;
      long long v16 = *(_OWORD *)(v11 + 64);
      long long v149 = *(_OWORD *)(v11 + 48);
      long long v150 = v16;
      long long v17 = *(_OWORD *)(v11 + 96);
      long long v151 = *(_OWORD *)(v11 + 80);
      long long v152 = v17;
      long long v18 = *(_OWORD *)(v11 + 32);
      long long v147 = *(_OWORD *)v12;
      long long v148 = v18;
      sub_251375990((uint64_t *)&v147, v134);
      *(_OWORD *)&v136[166] = *(_OWORD *)&v134[160];
      *(_OWORD *)&v136[182] = *(_OWORD *)&v134[176];
      *(_OWORD *)&v136[198] = *(_OWORD *)&v134[192];
      *(_OWORD *)&v136[102] = *(_OWORD *)&v134[96];
      *(_OWORD *)&v136[118] = *(_OWORD *)&v134[112];
      *(void *)&v136[214] = *(void *)&v134[208];
      *(_OWORD *)&v136[134] = *(_OWORD *)&v134[128];
      *(_OWORD *)&v136[150] = *(_OWORD *)&v134[144];
      *(_OWORD *)&v136[38] = *(_OWORD *)&v134[32];
      *(_OWORD *)&v136[54] = *(_OWORD *)&v134[48];
      *(_OWORD *)&v136[70] = *(_OWORD *)&v134[64];
      *(_OWORD *)&v136[86] = *(_OWORD *)&v134[80];
      *(_OWORD *)&v136[6] = *(_OWORD *)v134;
      *(_OWORD *)&v136[22] = *(_OWORD *)&v134[16];
      long long v144 = *(_OWORD *)&v136[160];
      long long v145 = *(_OWORD *)&v136[176];
      v146[0] = *(_OWORD *)&v136[192];
      *(_OWORD *)((char *)v146 + 14) = *(_OWORD *)&v136[206];
      *(_OWORD *)&v140[98] = *(_OWORD *)&v136[96];
      long long v141 = *(_OWORD *)&v136[112];
      long long v142 = *(_OWORD *)&v136[128];
      long long v143 = *(_OWORD *)&v136[144];
      *(_OWORD *)&v140[34] = *(_OWORD *)&v136[32];
      *(_OWORD *)&v140[50] = *(_OWORD *)&v136[48];
      *(_OWORD *)&v140[66] = *(_OWORD *)&v136[64];
      *(_OWORD *)&v140[82] = *(_OWORD *)&v136[80];
      *(_OWORD *)&v140[2] = *(_OWORD *)v136;
      uint64_t v139 = 0;
      *(_WORD *)v140 = 256;
      *(_OWORD *)&v140[18] = *(_OWORD *)&v136[16];
      sub_2512EF6B8((uint64_t)&v139);
      uint64_t v19 = *(void **)(a3 + 152);
      if (v19)
      {
        uint64_t v20 = qword_269B316F0;
        id v21 = v19;
        if (v20 != -1) {
          swift_once();
        }
        if (byte_269B36232 == 1)
        {
          if (qword_269B316B0 != -1) {
            swift_once();
          }
          uint64_t v22 = sub_2513806D0();
          __swift_project_value_buffer(v22, (uint64_t)qword_269B31BB8);
          uint64_t v23 = sub_2513806B0();
          os_log_type_t v24 = sub_251380C40();
          if (os_log_type_enabled(v23, v24))
          {
            unint64_t v25 = (uint8_t *)swift_slowAlloc();
            uint64_t v26 = swift_slowAlloc();
            *(void *)&long long v147 = v26;
            *(_DWORD *)unint64_t v25 = 136446210;
            uint64_t v27 = sub_251381230();
            *(void *)&v137[0] = sub_2512F6F6C(v27, v28, (uint64_t *)&v147);
            sub_251380DB0();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2512DB000, v23, v24, "[%{public}s] reset noise counter", v25, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x25339CCC0](v26, -1, -1);
            MEMORY[0x25339CCC0](v25, -1, -1);
          }
        }
        sub_2512FBDB8();
        sub_2512FC034();
      }
      else
      {
        if (qword_269B316F0 != -1) {
          swift_once();
        }
        if (byte_269B36232)
        {
          if (qword_269B316B0 != -1) {
            swift_once();
          }
          uint64_t v75 = sub_2513806D0();
          __swift_project_value_buffer(v75, (uint64_t)qword_269B31BB8);
          uint64_t v76 = sub_2513806B0();
          os_log_type_t v77 = sub_251380C30();
          if (os_log_type_enabled(v76, v77))
          {
            unint64_t v78 = (uint8_t *)swift_slowAlloc();
            uint64_t v79 = swift_slowAlloc();
            *(void *)&long long v147 = v79;
            *(_DWORD *)unint64_t v78 = 136446210;
            uint64_t v80 = sub_251381230();
            *(void *)&v137[0] = sub_2512F6F6C(v80, v81, (uint64_t *)&v147);
            sub_251380DB0();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2512DB000, v76, v77, "[%{public}s] failed to reset noise counter", v78, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x25339CCC0](v79, -1, -1);
            MEMORY[0x25339CCC0](v78, -1, -1);
          }
        }
      }
      sub_251380D40();
      if (qword_269B316B8 != -1) {
        swift_once();
      }
      if (qword_269B316C0 != -1) {
        swift_once();
      }
      uint64_t v82 = sub_2513806A0();
      __swift_project_value_buffer(v82, (uint64_t)qword_269B31BD8);
      sub_251380680();
      char v67 = &v139;
    }
    else
    {
      char v131 = *(unsigned char *)(v11 + 8);
      double v133 = *(double *)v11;
      sub_2512EF6C0((uint64_t)v161, (uint64_t)&v139);
      uint64_t v47 = nullsub_1(&v139);
      sub_25136E0F8(v47);
      if (qword_269B316F8 != -1) {
        swift_once();
      }
      uint64_t v123 = a3;
      if (byte_269B36233 == 1)
      {
        if (qword_269B316A0 != -1) {
          swift_once();
        }
        uint64_t v48 = sub_2513806D0();
        __swift_project_value_buffer(v48, (uint64_t)qword_269B31B88);
        sub_2512EF6C0((uint64_t)v161, (uint64_t)&v147);
        uint64_t v49 = nullsub_1(&v147);
        sub_251378FB0((uint64_t)v161, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_251311DFC);
        sub_25136E0F8(v49);
        uint64_t v50 = sub_2513806B0();
        os_log_type_t v51 = sub_251380C40();
        if (os_log_type_enabled(v50, v51))
        {
          uint64_t v52 = swift_slowAlloc();
          uint64_t v128 = swift_slowAlloc();
          *(void *)v136 = v128;
          *(_DWORD *)uint64_t v52 = 136446466;
          uint64_t v53 = sub_251381230();
          sub_2512F6F6C(v53, v54, (uint64_t *)v136);
          sub_251380DB0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v52 + 12) = 2080;
          sub_25136E0F8(v47);
          uint64_t v55 = MEMORY[0x25339BD50](*(void *)&v133, &type metadata for HTHearingTestThreshold);
          unint64_t v57 = v56;
          sub_251378FB0((uint64_t)v161, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_251311E98);
          *(void *)v134 = sub_2512F6F6C(v55, v57, (uint64_t *)v136);
          sub_251380DB0();
          swift_bridgeObjectRelease();
          sub_251378FB0((uint64_t)v161, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_251311E98);
          sub_251378FB0((uint64_t)v161, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_251311E98);
          _os_log_impl(&dword_2512DB000, v50, v51, "[%{public}s] Test completed, result %s", (uint8_t *)v52, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x25339CCC0](v128, -1, -1);
          uint64_t v58 = v52;
          a3 = v123;
          MEMORY[0x25339CCC0](v58, -1, -1);
        }
        else
        {
          sub_251378FB0((uint64_t)v161, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_251311E98);
          sub_251378FB0((uint64_t)v161, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_251311E98);
        }
      }
      else
      {
        if (qword_269B316A0 != -1) {
          swift_once();
        }
        uint64_t v68 = sub_2513806D0();
        __swift_project_value_buffer(v68, (uint64_t)qword_269B31B88);
        uint64_t v69 = sub_2513806B0();
        os_log_type_t v70 = sub_251380C40();
        if (os_log_type_enabled(v69, v70))
        {
          uint64_t v71 = (uint8_t *)swift_slowAlloc();
          uint64_t v72 = swift_slowAlloc();
          *(void *)&long long v147 = v72;
          *(_DWORD *)uint64_t v71 = 136446210;
          uint64_t v73 = sub_251381230();
          *(void *)v136 = sub_2512F6F6C(v73, v74, (uint64_t *)&v147);
          sub_251380DB0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2512DB000, v69, v70, "[%{public}s] Test completed", v71, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x25339CCC0](v72, -1, -1);
          MEMORY[0x25339CCC0](v71, -1, -1);
        }

        a3 = v123;
      }
      long long v83 = *(_OWORD *)(v12 + 176);
      long long v157 = *(_OWORD *)(v12 + 160);
      long long v158 = v83;
      long long v159 = *(_OWORD *)(v12 + 192);
      uint64_t v160 = *(void *)(v12 + 208);
      long long v84 = *(_OWORD *)(v12 + 112);
      long long v153 = *(_OWORD *)(v12 + 96);
      long long v154 = v84;
      long long v85 = *(_OWORD *)(v12 + 144);
      long long v155 = *(_OWORD *)(v12 + 128);
      long long v156 = v85;
      long long v86 = *(_OWORD *)(v12 + 48);
      long long v149 = *(_OWORD *)(v12 + 32);
      long long v150 = v86;
      long long v87 = *(_OWORD *)(v12 + 80);
      long long v151 = *(_OWORD *)(v12 + 64);
      long long v152 = v87;
      long long v88 = *(_OWORD *)(v12 + 16);
      long long v147 = *(_OWORD *)v12;
      long long v148 = v88;
      sub_251375990((uint64_t *)&v147, v137);
      uint64_t v89 = *(void *)(a3 + 152);
      if (v89)
      {
        uint64_t v90 = *(void *)(v89 + OBJC_IVAR____TtC11HearingTest15HTNoiseMetadata_mean_drum_dBA_Inst);
        uint64_t v91 = (uint64_t *)(v89 + OBJC_IVAR____TtC11HearingTest15HTNoiseMetadata_metrics);
        swift_beginAccess();
        uint64_t v92 = *v91;
        uint64_t v93 = v91[1];
      }
      else
      {
        uint64_t v93 = 0;
        uint64_t v92 = 0;
        uint64_t v90 = 0;
      }
      if (qword_269B316F0 != -1) {
        swift_once();
      }
      if (byte_269B36232 == 1)
      {
        if (qword_269B316B0 != -1) {
          swift_once();
        }
        uint64_t v94 = sub_2513806D0();
        __swift_project_value_buffer(v94, (uint64_t)qword_269B31BB8);
        id v95 = sub_2513806B0();
        os_log_type_t v96 = sub_251380C40();
        if (os_log_type_enabled(v95, v96))
        {
          uint64_t v97 = swift_slowAlloc();
          uint64_t v98 = swift_slowAlloc();
          *(void *)&long long v147 = v98;
          *(_DWORD *)uint64_t v97 = 136446978;
          uint64_t v99 = sub_251381230();
          *(void *)v136 = sub_2512F6F6C(v99, v100, (uint64_t *)&v147);
          sub_251380DB0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v97 + 12) = 2048;
          *(void *)v136 = v90;
          sub_251380DB0();
          *(_WORD *)(v97 + 22) = 2048;
          *(void *)v136 = v93;
          sub_251380DB0();
          *(_WORD *)(v97 + 32) = 2048;
          *(void *)v136 = v92;
          sub_251380DB0();
          _os_log_impl(&dword_2512DB000, v95, v96, "[%{public}s] current session inst noise mean %f, noise meta data inst %f, stat %f", (uint8_t *)v97, 0x2Au);
          swift_arrayDestroy();
          MEMORY[0x25339CCC0](v98, -1, -1);
          MEMORY[0x25339CCC0](v97, -1, -1);
        }

        a3 = v123;
      }
      uint64_t v101 = *(void **)(a3 + 152);
      if (v101)
      {
        if (byte_269B36232)
        {
          uint64_t v102 = qword_269B316B0;
          id v103 = v101;
          if (v102 != -1) {
            swift_once();
          }
          uint64_t v104 = sub_2513806D0();
          __swift_project_value_buffer(v104, (uint64_t)qword_269B31BB8);
          v105 = sub_2513806B0();
          os_log_type_t v106 = sub_251380C40();
          if (os_log_type_enabled(v105, v106))
          {
            v107 = (uint8_t *)swift_slowAlloc();
            uint64_t v108 = swift_slowAlloc();
            *(void *)&long long v147 = v108;
            *(_DWORD *)v107 = 136446210;
            uint64_t v109 = sub_251381230();
            *(void *)v136 = sub_2512F6F6C(v109, v110, (uint64_t *)&v147);
            sub_251380DB0();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2512DB000, v105, v106, "[%{public}s] reset noise counter", v107, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x25339CCC0](v108, -1, -1);
            MEMORY[0x25339CCC0](v107, -1, -1);
          }
        }
        else
        {
          id v118 = v101;
        }
        sub_2512FBDB8();
        sub_2512FC034();
      }
      else if (byte_269B36232)
      {
        if (qword_269B316B0 != -1) {
          swift_once();
        }
        uint64_t v111 = sub_2513806D0();
        __swift_project_value_buffer(v111, (uint64_t)qword_269B31BB8);
        v112 = sub_2513806B0();
        os_log_type_t v113 = sub_251380C30();
        if (os_log_type_enabled(v112, v113))
        {
          v114 = (uint8_t *)swift_slowAlloc();
          uint64_t v115 = swift_slowAlloc();
          *(void *)&long long v147 = v115;
          *(_DWORD *)v114 = 136446210;
          uint64_t v116 = sub_251381230();
          *(void *)v136 = sub_2512F6F6C(v116, v117, (uint64_t *)&v147);
          sub_251380DB0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2512DB000, v112, v113, "[%{public}s] failed to reset noise counter", v114, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x25339CCC0](v115, -1, -1);
          MEMORY[0x25339CCC0](v114, -1, -1);
        }
      }
      *(_OWORD *)&v134[166] = v137[10];
      *(_OWORD *)&v134[182] = v137[11];
      *(_OWORD *)&v134[198] = v137[12];
      *(_OWORD *)&v134[102] = v137[6];
      *(_OWORD *)&v134[118] = v137[7];
      *(_OWORD *)&v134[134] = v137[8];
      *(_OWORD *)&v134[150] = v137[9];
      *(_OWORD *)&v134[38] = v137[2];
      *(_OWORD *)&v134[54] = v137[3];
      *(_OWORD *)&v134[70] = v137[4];
      *(_OWORD *)&v134[86] = v137[5];
      *(_OWORD *)&v134[6] = v137[0];
      char v135 = 0;
      *(void *)&v134[214] = v138;
      *(_OWORD *)&v134[22] = v137[1];
      sub_251380D40();
      if (qword_269B316B8 != -1) {
        swift_once();
      }
      if (qword_269B316C0 != -1) {
        swift_once();
      }
      uint64_t v119 = sub_2513806A0();
      __swift_project_value_buffer(v119, (uint64_t)qword_269B31BD8);
      sub_251380680();
      *(_OWORD *)&v136[170] = *(_OWORD *)&v134[160];
      *(_OWORD *)&v136[186] = *(_OWORD *)&v134[176];
      *(_OWORD *)&v136[202] = *(_OWORD *)&v134[192];
      *(_OWORD *)&v136[216] = *(_OWORD *)&v134[206];
      *(_OWORD *)&v136[106] = *(_OWORD *)&v134[96];
      *(_OWORD *)&v136[122] = *(_OWORD *)&v134[112];
      *(_OWORD *)&v136[138] = *(_OWORD *)&v134[128];
      *(_OWORD *)&v136[154] = *(_OWORD *)&v134[144];
      *(_OWORD *)&v136[42] = *(_OWORD *)&v134[32];
      *(_OWORD *)&v136[58] = *(_OWORD *)&v134[48];
      *(_OWORD *)&v136[74] = *(_OWORD *)&v134[64];
      *(_OWORD *)&v136[90] = *(_OWORD *)&v134[80];
      *(_OWORD *)&v136[10] = *(_OWORD *)v134;
      *(double *)v136 = v133;
      v136[8] = v131;
      v136[9] = v135;
      *(_OWORD *)&v136[26] = *(_OWORD *)&v134[16];
      sub_2512EF6B8((uint64_t)v136);
      char v67 = (uint64_t *)v136;
    }
  }
  else
  {
    uint64_t v124 = v7;
    uint64_t v125 = v5;
    double v30 = *(double *)v11;
    double v29 = *(double *)(v11 + 8);
    uint64_t v126 = *(unsigned __int8 *)(v11 + 16);
    uint64_t v31 = *(void *)(v11 + 24);
    int v32 = *(_DWORD *)(v11 + 32);
    if (qword_269B316A0 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_2513806D0();
    __swift_project_value_buffer(v33, (uint64_t)qword_269B31B88);
    uint64_t v34 = sub_2513806B0();
    os_log_type_t v35 = sub_251380C40();
    uint64_t v121 = v6;
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v122 = a3;
      uint64_t v36 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      *(void *)&long long v147 = v37;
      *(_DWORD *)uint64_t v36 = 136447234;
      uint64_t v38 = sub_251381230();
      sub_2512F6F6C(v38, v39, (uint64_t *)&v147);
      sub_251380DB0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2048;
      sub_251380DB0();
      *(_WORD *)(v36 + 22) = 2048;
      sub_251380DB0();
      *(_WORD *)(v36 + 32) = 2048;
      sub_251380DB0();
      *(_WORD *)(v36 + 42) = 2048;
      uint64_t v139 = v126;
      sub_251380DB0();
      _os_log_impl(&dword_2512DB000, v34, v35, "[%{public}s] Continue test, next stimulus freq %f, level %f, duration %f, ch %ld", (uint8_t *)v36, 0x34u);
      swift_arrayDestroy();
      MEMORY[0x25339CCC0](v37, -1, -1);
      uint64_t v40 = v36;
      a3 = v122;
      MEMORY[0x25339CCC0](v40, -1, -1);
    }

    uint64_t v41 = v124;
    uint64_t v42 = *(void **)(a3 + 144);
    if (v42)
    {
      if (v126) {
        int v45 = 2;
      }
      else {
        int v45 = 1;
      }
      sub_251378D9C((uint64_t)a2);
      id v46 = v42;
      float v43 = v30;
      float v44 = v29;
      sub_251332228(v45, v43, v44);

      uint64_t v139 = *(void *)&v30;
      *(double *)v140 = v29;
      v140[8] = v126;
      *(void *)&v140[16] = v31;
      *(_DWORD *)&v140[24] = v32;
      *(void *)&v140[32] = v127;
      *(void *)&v140[40] = v129;
      *(void *)&v140[48] = v130;
      *(void *)&v140[56] = v132;
      *(void *)&v140[64] = v125;
      *(void *)&v140[72] = v124;
      *(void *)&v140[80] = v121;
      *(void *)&v140[88] = v8;
    }
    else
    {
      uint64_t v59 = v8;
      sub_251378D9C((uint64_t)a2);
      unint64_t v60 = sub_2513806B0();
      os_log_type_t v61 = sub_251380C30();
      if (os_log_type_enabled(v60, v61))
      {
        uint64_t v62 = (uint8_t *)swift_slowAlloc();
        uint64_t v63 = swift_slowAlloc();
        *(void *)&long long v147 = v63;
        *(_DWORD *)uint64_t v62 = 136446210;
        uint64_t v64 = sub_251381230();
        uint64_t v139 = sub_2512F6F6C(v64, v65, (uint64_t *)&v147);
        sub_251380DB0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2512DB000, v60, v61, "[%{public}s] Accessory manager not found", v62, 0xCu);
        swift_arrayDestroy();
        uint64_t v66 = v63;
        uint64_t v41 = v124;
        MEMORY[0x25339CCC0](v66, -1, -1);
        MEMORY[0x25339CCC0](v62, -1, -1);
      }

      uint64_t v139 = *(void *)&v30;
      *(double *)v140 = v29;
      v140[8] = v126;
      *(void *)&v140[16] = v31;
      *(_DWORD *)&v140[24] = v32;
      *(void *)&v140[32] = v127;
      *(void *)&v140[40] = v129;
      *(void *)&v140[48] = v130;
      *(void *)&v140[56] = v132;
      *(void *)&v140[64] = v125;
      *(void *)&v140[72] = v41;
      *(void *)&v140[80] = v6;
      *(void *)&v140[88] = v59;
    }
    *(void *)&v140[96] = v9;
    sub_2512EF71C((uint64_t)&v139);
    char v67 = &v139;
  }
  sub_2513780A8((uint64_t)v67, (uint64_t)&v147);
  sub_2513780A8((uint64_t)&v147, (uint64_t)&v139);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B325F8);
  return sub_251380AA0();
}

uint64_t sub_2513725A0(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 312) = a1;
  *(void *)(v3 + 320) = v2;
  *(void *)(v3 + 328) = *v2;
  uint64_t v5 = sub_2513806A0();
  *(void *)(v3 + 336) = v5;
  *(void *)(v3 + 344) = *(void *)(v5 - 8);
  *(void *)(v3 + 352) = swift_task_alloc();
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 360) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 376) = v6;
  *(unsigned char *)(v3 + 129) = *(unsigned char *)(a2 + 32);
  return MEMORY[0x270FA2498](sub_2513726A8, 0, 0);
}

uint64_t sub_2513726A8()
{
  uint64_t v104 = v0;
  if (!os_variant_has_internal_content()
    || (uint64_t v1 = *(void *)(v0 + 320), swift_beginAccess(), !*(void *)(v1 + 136)))
  {
    uint64_t v7 = *(unsigned __int8 *)(v0 + 376);
    if (v7 == 2) {
      goto LABEL_49;
    }
    uint64_t v8 = *(unsigned char *)(v0 + 129) & 1;
    LODWORD(v98) = sub_251380D40();
    if (qword_269B316B8 != -1) {
      swift_once();
    }
    uint64_t v99 = v8;
    if (qword_269B316C0 != -1) {
      swift_once();
    }
    uint64_t v9 = *(void *)(v0 + 360);
    uint64_t v10 = *(void *)(v0 + 368);
    uint64_t v12 = *(void *)(v0 + 344);
    uint64_t v11 = *(void *)(v0 + 352);
    uint64_t v13 = *(void *)(v0 + 336);
    long long v14 = *(void **)(v0 + 320);
    uint64_t v15 = __swift_project_value_buffer(v13, (uint64_t)qword_269B31BD8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v15, v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B31C80);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_251381E60;
    unint64_t v17 = sub_251377F20();
    uint64_t v18 = 20302;
    if (v99) {
      uint64_t v18 = 5457241;
    }
    unint64_t v19 = 0xE200000000000000;
    if (v99) {
      unint64_t v19 = 0xE300000000000000;
    }
    *(void *)(v16 + 56) = MEMORY[0x263F8D310];
    *(void *)(v16 + 64) = v17;
    *(void *)(v16 + 32) = v18;
    *(void *)(v16 + 40) = v19;
    uint64_t v20 = MEMORY[0x263F8D538];
    uint64_t v21 = MEMORY[0x263F8D5B8];
    *(void *)(v16 + 96) = MEMORY[0x263F8D538];
    *(void *)(v16 + 104) = v21;
    *(void *)(v16 + 72) = v9;
    *(void *)(v16 + 136) = v20;
    *(void *)(v16 + 144) = v21;
    *(void *)(v16 + 112) = v10;
    LOBYTE(v90) = 2;
    sub_251380680();
    swift_bridgeObjectRelease();
    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    uint64_t v22 = v12 + 8;
    v23(v11, v13);
    uint64_t v24 = v14[14];
    BOOL v25 = __OFADD__(v24, v99);
    uint64_t v26 = v24 + v99;
    if (v25)
    {
      __break(1u);
      goto LABEL_53;
    }
    uint64_t v22 = v99;
    char v27 = v7 & 1;
    uint64_t v28 = *(void *)(v0 + 320);
    v14[14] = v26;
    uint64_t v29 = v28 + 56;
    swift_beginAccess();
    sub_251377F74(v29, v0 + 16);
    uint64_t v98 = v7 & 1;
    if (*(void *)(v0 + 40))
    {
      uint64_t v30 = *(void *)(v0 + 384);
      uint64_t v32 = *(void *)(v0 + 360);
      uint64_t v31 = *(void *)(v0 + 368);
      sub_25137803C(v0 + 16, v0 + 56);
      sub_251377FDC(v0 + 16);
      uint64_t v33 = *(void *)(v0 + 80);
      uint64_t v34 = *(void *)(v0 + 88);
      __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), v33);
      v100[0] = v32;
      v100[1] = v31;
      char v101 = v27;
      uint64_t v102 = v30;
      char v103 = v99;
      char v35 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v34 + 8))(v100, v33, v34);
      long long v14 = v36;
      uint64_t v37 = __swift_destroy_boxed_opaque_existential_0(v0 + 56);
      if (v35)
      {
        uint64_t v45 = *(void *)(v0 + 320);
        uint64_t v46 = *(void *)(v45 + 120);
        BOOL v25 = __OFADD__(v46, 1);
        uint64_t v47 = v46 + 1;
        if (v25)
        {
LABEL_55:
          __break(1u);
          goto LABEL_56;
        }
        *(void *)(v45 + 120) = v47;
        uint64_t v48 = *(void *)(v45 + 96);
        BOOL v25 = __OFADD__(v48, 1);
        uint64_t v49 = v48 + 1;
        if (v25)
        {
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }
        uint64_t v16 = 1;
LABEL_24:
        uint64_t v13 = *(void *)(v0 + 320);
        *(void *)(v13 + 96) = v49;
        if (v49 >= (uint64_t)v14) {
          LOBYTE(v7) = 1;
        }
        else {
          LOBYTE(v7) = v16 ^ 1;
        }
        if (qword_269B316F8 == -1)
        {
LABEL_28:
          if (byte_269B36233 == 1)
          {
            if (qword_269B316A0 != -1) {
              swift_once();
            }
            uint64_t v54 = sub_2513806D0();
            __swift_project_value_buffer(v54, (uint64_t)qword_269B31B88);
            uint64_t v55 = sub_2513806B0();
            os_log_type_t v56 = sub_251380C40();
            if (!os_log_type_enabled(v55, v56)) {
              goto LABEL_38;
            }
            uint64_t v95 = *(void *)(v0 + 384);
            uint64_t v93 = *(void *)(v0 + 360);
            uint64_t v94 = *(void *)(v0 + 368);
            uint64_t v57 = swift_slowAlloc();
            uint64_t v97 = v13;
            uint64_t v58 = swift_slowAlloc();
            v100[0] = v58;
            *(_DWORD *)uint64_t v57 = 136448002;
            uint64_t v59 = sub_251381230();
            *(void *)(v0 + 256) = sub_2512F6F6C(v59, v60, v100);
            sub_251380DB0();
            uint64_t v22 = v99;
            swift_bridgeObjectRelease();
            *(_WORD *)(v57 + 12) = 2048;
            *(void *)(v0 + 264) = v93;
            sub_251380DB0();
            *(_WORD *)(v57 + 22) = 2048;
            *(void *)(v0 + 272) = v94;
            sub_251380DB0();
            *(_WORD *)(v57 + 32) = 2048;
            *(void *)(v0 + 280) = v95;
            sub_251380DB0();
            *(_WORD *)(v57 + 42) = 2048;
            *(void *)(v0 + 288) = v98;
            sub_251380DB0();
            *(_WORD *)(v57 + 52) = 1024;
            *(_DWORD *)(v0 + 420) = v99;
            sub_251380DB0();
            *(_WORD *)(v57 + 58) = 1024;
            uint64_t v16 = v16;
            *(_DWORD *)(v0 + 132) = v16;
            sub_251380DB0();
            *(_WORD *)(v57 + 64) = 2048;
            *(void *)(v0 + 304) = v14;
            sub_251380DB0();
            os_log_type_t v61 = "[%{public}s] Current Tone freq %f lv %f dur %f ch %ld Response %{BOOL}d; Current Tone interferenceFlag"
                  " %{BOOL}d, When tone interference flag is true, repeat previous tone %ld times.";
            uint64_t v62 = v55;
            os_log_type_t v63 = v56;
            uint64_t v64 = (uint8_t *)v57;
            uint32_t v65 = 74;
          }
          else
          {
            if (qword_269B316A0 != -1) {
              swift_once();
            }
            uint64_t v66 = sub_2513806D0();
            __swift_project_value_buffer(v66, (uint64_t)qword_269B31B88);
            uint64_t v55 = sub_2513806B0();
            os_log_type_t v67 = sub_251380C40();
            if (!os_log_type_enabled(v55, v67)) {
              goto LABEL_38;
            }
            uint64_t v96 = *(void *)(v0 + 384);
            uint64_t v92 = *(void *)(v0 + 368);
            uint64_t v91 = *(void *)(v0 + 360);
            uint64_t v57 = swift_slowAlloc();
            uint64_t v97 = v13;
            uint64_t v58 = swift_slowAlloc();
            v100[0] = v58;
            *(_DWORD *)uint64_t v57 = 136447746;
            uint64_t v68 = sub_251381230();
            *(void *)(v0 + 248) = sub_2512F6F6C(v68, v69, v100);
            sub_251380DB0();
            swift_bridgeObjectRelease();
            *(_WORD *)(v57 + 12) = 2048;
            *(void *)(v0 + 208) = v91;
            uint64_t v22 = v99;
            sub_251380DB0();
            *(_WORD *)(v57 + 22) = 2048;
            *(void *)(v0 + 216) = v92;
            uint64_t v16 = v16;
            sub_251380DB0();
            *(_WORD *)(v57 + 32) = 2048;
            *(void *)(v0 + 224) = v96;
            sub_251380DB0();
            *(_WORD *)(v57 + 42) = 2048;
            *(void *)(v0 + 232) = v98;
            sub_251380DB0();
            *(_WORD *)(v57 + 52) = 1024;
            *(_DWORD *)(v0 + 424) = v16;
            sub_251380DB0();
            *(_WORD *)(v57 + 58) = 2048;
            *(void *)(v0 + 240) = v14;
            sub_251380DB0();
            os_log_type_t v61 = "[%{public}s] Current Tone freq %f lv %f dur %f ch %ld; Current Tone interferenceFlag %{BOOL}d, When to"
                  "ne interference flag is true, repeat previous tone %ld times.";
            uint64_t v62 = v55;
            os_log_type_t v63 = v67;
            uint64_t v64 = (uint8_t *)v57;
            uint32_t v65 = 68;
          }
          _os_log_impl(&dword_2512DB000, v62, v63, v61, v64, v65);
          swift_arrayDestroy();
          uint64_t v70 = v58;
          uint64_t v13 = v97;
          MEMORY[0x25339CCC0](v70, -1, -1);
          MEMORY[0x25339CCC0](v57, -1, -1);
LABEL_38:

          if (v22) {
            char v71 = 1;
          }
          else {
            char v71 = v7;
          }
          if (v71)
          {
            uint64_t v72 = *(void *)(v0 + 320);
            *(unsigned char *)(v72 + 104) = 0;
            *(void *)(v13 + 96) = 0;
            uint64_t v73 = v72 + 16;
            swift_beginAccess();
            uint64_t v74 = *(void *)(v72 + 40);
            uint64_t v75 = *(void *)(v72 + 48);
            __swift_mutable_project_boxed_opaque_existential_1(v73, v74);
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v75 + 80))(v22, v16, v74, v75);
            swift_endAccess();
            goto LABEL_49;
          }
          if (qword_269B316A0 != -1) {
            swift_once();
          }
          uint64_t v76 = sub_2513806D0();
          __swift_project_value_buffer(v76, (uint64_t)qword_269B31B88);
          os_log_type_t v77 = sub_2513806B0();
          os_log_type_t v78 = sub_251380C40();
          if (os_log_type_enabled(v77, v78))
          {
            uint64_t v79 = swift_slowAlloc();
            uint64_t v80 = swift_slowAlloc();
            v100[0] = v80;
            *(_DWORD *)uint64_t v79 = 136446466;
            uint64_t v81 = sub_251381230();
            *(void *)(v0 + 296) = sub_2512F6F6C(v81, v82, v100);
            sub_251380DB0();
            swift_bridgeObjectRelease();
            *(_WORD *)(v79 + 12) = 1024;
            *(_DWORD *)(v0 + 416) = 1;
            sub_251380DB0();
            _os_log_impl(&dword_2512DB000, v77, v78, "[%{public}s] Repeat Tone Flag %{BOOL}d", (uint8_t *)v79, 0x12u);
            swift_arrayDestroy();
            MEMORY[0x25339CCC0](v80, -1, -1);
            MEMORY[0x25339CCC0](v79, -1, -1);
          }

          uint64_t v83 = *(void *)(v0 + 320);
          uint64_t v84 = *(void *)(v83 + 128);
          BOOL v25 = __OFADD__(v84, 1);
          uint64_t v85 = v84 + 1;
          if (!v25)
          {
            *(void *)(v83 + 128) = v85;
LABEL_49:
            uint64_t v87 = *(void *)(v0 + 320);
            uint64_t v86 = *(void *)(v0 + 328);
            uint64_t v88 = swift_task_alloc();
            *(void *)(v0 + 400) = v88;
            *(void *)(v88 + 16) = v87;
            *(void *)(v88 + 24) = v86;
            uint64_t v89 = (void *)swift_task_alloc();
            *(void *)(v0 + 408) = v89;
            *uint64_t v89 = v0;
            v89[1] = sub_2513733E0;
            uint64_t v37 = *(void *)(v0 + 312);
            unint64_t v40 = 0xD000000000000027;
            unint64_t v41 = 0x8000000251386DC0;
            float v44 = &type metadata for HTHearingTestSessionStatusWithAverageNoise;
            uint64_t v42 = sub_2513780A0;
            uint64_t v38 = 0;
            uint64_t v39 = 0;
            uint64_t v43 = v88;
            return MEMORY[0x270FA2318](v37, v38, v39, v40, v41, v42, v43, v44);
          }
          __break(1u);
          goto LABEL_55;
        }
LABEL_53:
        swift_once();
        goto LABEL_28;
      }
    }
    else
    {
      sub_251377FDC(v0 + 16);
      id v50 = objc_allocWithZone(MEMORY[0x263EFFA40]);
      os_log_type_t v51 = (void *)sub_251380840();
      id v52 = objc_msgSend(v50, sel_initWithSuiteName_, v51, 36, v90, v16);

      if (!v52)
      {
LABEL_57:
        __break(1u);
        return MEMORY[0x270FA2318](v37, v38, v39, v40, v41, v42, v43, v44);
      }
      uint64_t v53 = (void *)sub_251380840();
      long long v14 = objc_msgSend(v52, sel_integerForKey_, v53);
    }
    uint64_t v16 = 0;
    uint64_t v49 = 0;
    goto LABEL_24;
  }
  char v2 = *(unsigned char *)(v0 + 129);
  long long v3 = *(_OWORD *)(v0 + 376);
  *(_OWORD *)(v0 + 96) = *(_OWORD *)(v0 + 360);
  *(_OWORD *)(v0 + 112) = v3;
  *(unsigned char *)(v0 + 128) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2513732D0;
  uint64_t v5 = *(void *)(v0 + 312);
  return sub_251376E34(v5, v0 + 96);
}

uint64_t sub_2513732D0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2513733E0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_251373514(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B325F0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v38 = v8;
  uint64_t v9 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t)(a2 + 2);
  swift_beginAccess();
  __swift_project_boxed_opaque_existential_1(a2 + 2, a2[5]);
  sub_2512DF094((uint64_t)v41);
  uint64_t v11 = __swift_project_boxed_opaque_existential_1(a2 + 2, a2[5]);
  uint64_t v12 = *v11;
  uint64_t v13 = (unsigned char *)(*v11 + OBJC_IVAR____TtC11HearingTest12HTAudiometry_testEnded);
  swift_beginAccess();
  double v14 = 1.0;
  if ((*v13 & 1) == 0) {
    double v14 = *(float *)(v12 + OBJC_IVAR____TtC11HearingTest12HTAudiometry_lastProgress);
  }
  if (qword_269B316A0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_2513806D0();
  __swift_project_value_buffer(v15, (uint64_t)qword_269B31B88);
  uint64_t v16 = sub_2513806B0();
  os_log_type_t v17 = sub_251380C40();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v37 = v9;
    uint64_t v19 = v18;
    uint64_t v35 = swift_slowAlloc();
    v40[0] = v35;
    *(_DWORD *)uint64_t v19 = 136446466;
    v34[1] = v19 + 4;
    uint64_t v20 = sub_251381230();
    uint64_t v36 = a1;
    uint64_t v39 = sub_2512F6F6C(v20, v21, v40);
    sub_251380DB0();
    uint64_t v10 = (uint64_t)(a2 + 2);
    a1 = v36;
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2048;
    uint64_t v39 = *(void *)&v14;
    sub_251380DB0();
    _os_log_impl(&dword_2512DB000, v16, v17, "[%{public}s] HT session progress %f", (uint8_t *)v19, 0x16u);
    uint64_t v22 = v35;
    swift_arrayDestroy();
    MEMORY[0x25339CCC0](v22, -1, -1);
    uint64_t v23 = v19;
    uint64_t v9 = v37;
    MEMORY[0x25339CCC0](v23, -1, -1);
  }

  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  unint64_t v24 = (*(unsigned __int8 *)(v7 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v25 = (v38 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = swift_allocObject();
  long long v27 = v41[3];
  *(_OWORD *)(v26 + 48) = v41[2];
  *(_OWORD *)(v26 + 64) = v27;
  uint64_t v28 = v42;
  long long v29 = v41[1];
  *(_OWORD *)(v26 + 16) = v41[0];
  *(_OWORD *)(v26 + 32) = v29;
  *(void *)(v26 + 80) = v28;
  *(void *)(v26 + 88) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v26 + v24, v9, v6);
  *(void *)(v26 + v25) = a3;
  swift_beginAccess();
  uint64_t v30 = a2[5];
  uint64_t v31 = a2[6];
  __swift_mutable_project_boxed_opaque_existential_1(v10, v30);
  uint64_t v32 = *(void (**)(uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v31 + 104);
  swift_retain();
  v32(sub_251378CE4, v26, v30, v31);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_251373928(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v133 = *a2;
  uint64_t v136 = a2[1];
  uint64_t v5 = a2[3];
  uint64_t v141 = a2[2];
  uint64_t v6 = a2[4];
  uint64_t v7 = a2[5];
  uint64_t v8 = a2[6];
  uint64_t v9 = a2[7];
  uint64_t v132 = a2[8];
  sub_2512EF5F0(a1, (uint64_t)v192);
  sub_2512EF5F0((uint64_t)v192, (uint64_t)v193);
  int v10 = sub_251310D74((uint64_t)v193);
  uint64_t v11 = sub_251310D80((uint64_t)v193);
  if (v10 == 1)
  {
    uint64_t v12 = v11 + 24;
    if (*(unsigned char *)(v11 + 16) == 1)
    {
      long long v13 = *(_OWORD *)(v11 + 232);
      long long v188 = *(_OWORD *)(v11 + 216);
      long long v189 = v13;
      long long v190 = *(_OWORD *)(v11 + 248);
      uint64_t v191 = *(void *)(v11 + 264);
      long long v14 = *(_OWORD *)(v11 + 168);
      long long v184 = *(_OWORD *)(v11 + 152);
      long long v185 = v14;
      long long v15 = *(_OWORD *)(v11 + 200);
      long long v186 = *(_OWORD *)(v11 + 184);
      long long v187 = v15;
      long long v16 = *(_OWORD *)(v11 + 104);
      long long v180 = *(_OWORD *)(v11 + 88);
      long long v181 = v16;
      long long v17 = *(_OWORD *)(v11 + 136);
      long long v182 = *(_OWORD *)(v11 + 120);
      long long v183 = v17;
      long long v18 = *(_OWORD *)(v11 + 40);
      long long v176 = *(_OWORD *)v12;
      long long v177 = v18;
      long long v19 = *(_OWORD *)(v11 + 72);
      long long v178 = *(_OWORD *)(v11 + 56);
      long long v179 = v19;
      sub_251375BA0(&v176, &v160);
      uint64_t v20 = *(void **)(a3 + 152);
      if (v20)
      {
        uint64_t v21 = qword_269B316F0;
        id v22 = v20;
        if (v21 != -1) {
          swift_once();
        }
        if (byte_269B36232 == 1)
        {
          if (qword_269B316B0 != -1) {
            swift_once();
          }
          uint64_t v23 = sub_2513806D0();
          __swift_project_value_buffer(v23, (uint64_t)qword_269B31BB8);
          unint64_t v24 = sub_2513806B0();
          os_log_type_t v25 = sub_251380C40();
          if (os_log_type_enabled(v24, v25))
          {
            uint64_t v26 = (uint8_t *)swift_slowAlloc();
            uint64_t v27 = swift_slowAlloc();
            *(void *)&long long v176 = v27;
            *(_DWORD *)uint64_t v26 = 136446210;
            uint64_t v28 = sub_251381230();
            uint64_t v144 = sub_2512F6F6C(v28, v29, (uint64_t *)&v176);
            sub_251380DB0();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2512DB000, v24, v25, "[%{public}s] reset noise counter", v26, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x25339CCC0](v27, -1, -1);
            MEMORY[0x25339CCC0](v26, -1, -1);
          }
        }
        sub_2512FBDB8();
        sub_2512FC034();
      }
      else
      {
        if (qword_269B316F0 != -1) {
          swift_once();
        }
        if (byte_269B36232)
        {
          if (qword_269B316B0 != -1) {
            swift_once();
          }
          uint64_t v72 = sub_2513806D0();
          __swift_project_value_buffer(v72, (uint64_t)qword_269B31BB8);
          uint64_t v73 = sub_2513806B0();
          os_log_type_t v74 = sub_251380C30();
          if (os_log_type_enabled(v73, v74))
          {
            uint64_t v75 = (uint8_t *)swift_slowAlloc();
            uint64_t v76 = swift_slowAlloc();
            *(void *)&long long v176 = v76;
            *(_DWORD *)uint64_t v75 = 136446210;
            uint64_t v77 = sub_251381230();
            uint64_t v144 = sub_2512F6F6C(v77, v78, (uint64_t *)&v176);
            sub_251380DB0();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2512DB000, v73, v74, "[%{public}s] failed to reset noise counter", v75, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x25339CCC0](v76, -1, -1);
            MEMORY[0x25339CCC0](v75, -1, -1);
          }
        }
      }
      *(_OWORD *)&v143[198] = v172;
      *(_OWORD *)&v143[214] = v173;
      *(_OWORD *)&v143[230] = v174;
      *(_OWORD *)&v143[134] = v168;
      *(_OWORD *)&v143[150] = v169;
      *(_OWORD *)&v143[166] = v170;
      *(_OWORD *)&v143[182] = v171;
      *(_OWORD *)&v143[70] = v164;
      *(_OWORD *)&v143[86] = v165;
      *(_OWORD *)&v143[102] = v166;
      *(_OWORD *)&v143[118] = v167;
      *(_OWORD *)&v143[6] = v160;
      *(_OWORD *)&v143[22] = v161;
      *(_OWORD *)&v143[38] = v162;
      char v158 = 1;
      *(void *)&v143[246] = v175;
      *(_OWORD *)&v143[54] = v163;
      sub_251380D40();
      if (qword_269B316B8 != -1) {
        swift_once();
      }
      if (qword_269B316C0 != -1) {
        swift_once();
      }
      uint64_t v79 = sub_2513806A0();
      __swift_project_value_buffer(v79, (uint64_t)qword_269B31BD8);
      sub_251380680();
      long long v155 = *(_OWORD *)&v143[192];
      long long v156 = *(_OWORD *)&v143[208];
      *(_OWORD *)long long v157 = *(_OWORD *)&v143[224];
      *(_OWORD *)&v157[14] = *(_OWORD *)&v143[238];
      long long v151 = *(_OWORD *)&v143[128];
      long long v152 = *(_OWORD *)&v143[144];
      long long v153 = *(_OWORD *)&v143[160];
      long long v154 = *(_OWORD *)&v143[176];
      *(_OWORD *)&v148[64] = *(_OWORD *)&v143[64];
      *(_OWORD *)&v148[80] = *(_OWORD *)&v143[80];
      long long v149 = *(_OWORD *)&v143[96];
      long long v150 = *(_OWORD *)&v143[112];
      *(_OWORD *)long long v148 = *(_OWORD *)v143;
      *(_OWORD *)&v148[16] = *(_OWORD *)&v143[16];
      long long v80 = *(_OWORD *)&v143[48];
      *(_OWORD *)&v148[32] = *(_OWORD *)&v143[32];
      uint64_t v144 = 0;
      double v145 = 0.0;
      char v146 = 0;
      char v81 = v158;
LABEL_85:
      char v147 = v81;
      *(_OWORD *)&v148[48] = v80;
      sub_251378D8C((uint64_t)&v144);
      goto LABEL_86;
    }
    char v142 = *(unsigned char *)(v11 + 16);
    double v48 = *(double *)(v11 + 8);
    if (qword_269B316F8 != -1) {
      swift_once();
    }
    uint64_t v129 = a3;
    if (byte_269B36233 == 1)
    {
      if (qword_269B316A0 != -1) {
        swift_once();
      }
      uint64_t v49 = sub_2513806D0();
      __swift_project_value_buffer(v49, (uint64_t)qword_269B31B88);
      swift_bridgeObjectRetain_n();
      id v50 = sub_2513806B0();
      os_log_type_t v51 = sub_251380C40();
      if (!os_log_type_enabled(v50, v51))
      {

        swift_bridgeObjectRelease_n();
        goto LABEL_53;
      }
      uint64_t v52 = swift_slowAlloc();
      uint64_t v137 = swift_slowAlloc();
      *(void *)&long long v176 = v137;
      *(_DWORD *)uint64_t v52 = 136446466;
      uint64_t v53 = sub_251381230();
      sub_2512F6F6C(v53, v54, (uint64_t *)&v176);
      sub_251380DB0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v52 + 12) = 2080;
      uint64_t v55 = swift_bridgeObjectRetain();
      uint64_t v56 = MEMORY[0x25339BD50](v55, &type metadata for HTHearingTestThreshold);
      unint64_t v58 = v57;
      swift_bridgeObjectRelease();
      uint64_t v144 = sub_2512F6F6C(v56, v58, (uint64_t *)&v176);
      sub_251380DB0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2512DB000, v50, v51, "[%{public}s] Test completed, result %s", (uint8_t *)v52, 0x16u);
      swift_arrayDestroy();
      uint64_t v59 = v137;
    }
    else
    {
      if (qword_269B316A0 != -1) {
        swift_once();
      }
      uint64_t v67 = sub_2513806D0();
      __swift_project_value_buffer(v67, (uint64_t)qword_269B31B88);
      id v50 = sub_2513806B0();
      os_log_type_t v68 = sub_251380C40();
      if (!os_log_type_enabled(v50, v68)) {
        goto LABEL_38;
      }
      uint64_t v52 = swift_slowAlloc();
      double v138 = v48;
      uint64_t v69 = swift_slowAlloc();
      *(void *)&long long v176 = v69;
      *(_DWORD *)uint64_t v52 = 136446210;
      uint64_t v70 = sub_251381230();
      uint64_t v144 = sub_2512F6F6C(v70, v71, (uint64_t *)&v176);
      sub_251380DB0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2512DB000, v50, v68, "[%{public}s] Test completed", (uint8_t *)v52, 0xCu);
      swift_arrayDestroy();
      uint64_t v59 = v69;
      double v48 = v138;
    }
    MEMORY[0x25339CCC0](v59, -1, -1);
    MEMORY[0x25339CCC0](v52, -1, -1);
LABEL_38:

LABEL_53:
    long long v82 = *(_OWORD *)(v12 + 208);
    long long v188 = *(_OWORD *)(v12 + 192);
    long long v189 = v82;
    long long v190 = *(_OWORD *)(v12 + 224);
    uint64_t v191 = *(void *)(v12 + 240);
    long long v83 = *(_OWORD *)(v12 + 144);
    long long v184 = *(_OWORD *)(v12 + 128);
    long long v185 = v83;
    long long v84 = *(_OWORD *)(v12 + 176);
    long long v186 = *(_OWORD *)(v12 + 160);
    long long v187 = v84;
    long long v85 = *(_OWORD *)(v12 + 80);
    long long v180 = *(_OWORD *)(v12 + 64);
    long long v181 = v85;
    long long v86 = *(_OWORD *)(v12 + 112);
    long long v182 = *(_OWORD *)(v12 + 96);
    long long v183 = v86;
    long long v87 = *(_OWORD *)(v12 + 16);
    long long v176 = *(_OWORD *)v12;
    long long v177 = v87;
    long long v88 = *(_OWORD *)(v12 + 48);
    long long v178 = *(_OWORD *)(v12 + 32);
    long long v179 = v88;
    uint64_t v89 = a3;
    sub_251375BA0(&v176, &v160);
    uint64_t v159 = 0;
    uint64_t v90 = *(void *)(a3 + 152);
    if (v90)
    {
      uint64_t v159 = *(void *)(v90 + OBJC_IVAR____TtC11HearingTest15HTNoiseMetadata_mean_drum_dBA_Inst);
      uint64_t v91 = (uint64_t *)(v90 + OBJC_IVAR____TtC11HearingTest15HTNoiseMetadata_metrics);
      swift_beginAccess();
      uint64_t v92 = *v91;
    }
    else
    {
      uint64_t v92 = 0;
    }
    if (qword_269B316F0 != -1) {
      swift_once();
    }
    if (byte_269B36232 == 1)
    {
      if (qword_269B316B0 != -1) {
        swift_once();
      }
      uint64_t v93 = sub_2513806D0();
      __swift_project_value_buffer(v93, (uint64_t)qword_269B31BB8);
      uint64_t v94 = sub_2513806B0();
      os_log_type_t v95 = sub_251380C40();
      if (os_log_type_enabled(v94, v95))
      {
        uint64_t v96 = swift_slowAlloc();
        double v139 = v48;
        uint64_t v97 = swift_slowAlloc();
        *(void *)&long long v176 = v97;
        *(_DWORD *)uint64_t v96 = 136446978;
        uint64_t v98 = sub_251381230();
        sub_2512F6F6C(v98, v99, (uint64_t *)&v176);
        sub_251380DB0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v96 + 12) = 2048;
        sub_251380DB0();
        *(_WORD *)(v96 + 22) = 2048;
        sub_251380DB0();
        *(_WORD *)(v96 + 32) = 2048;
        uint64_t v144 = v92;
        sub_251380DB0();
        _os_log_impl(&dword_2512DB000, v94, v95, "[%{public}s] current session inst noise mean %f, noise meta data inst %f, stat %f", (uint8_t *)v96, 0x2Au);
        swift_arrayDestroy();
        uint64_t v100 = v97;
        double v48 = v139;
        MEMORY[0x25339CCC0](v100, -1, -1);
        MEMORY[0x25339CCC0](v96, -1, -1);
      }

      uint64_t v89 = v129;
    }
    swift_beginAccess();
    uint64_t v101 = v159;
    uint64_t v102 = *(void **)(v89 + 152);
    if (v102)
    {
      if (byte_269B36232)
      {
        uint64_t v103 = qword_269B316B0;
        swift_bridgeObjectRetain();
        id v104 = v102;
        if (v103 != -1) {
          swift_once();
        }
        uint64_t v105 = sub_2513806D0();
        __swift_project_value_buffer(v105, (uint64_t)qword_269B31BB8);
        os_log_type_t v106 = sub_2513806B0();
        os_log_type_t v107 = sub_251380C40();
        if (os_log_type_enabled(v106, v107))
        {
          uint64_t v134 = v159;
          uint64_t v108 = (uint8_t *)swift_slowAlloc();
          double v140 = v48;
          uint64_t v109 = swift_slowAlloc();
          *(void *)&long long v176 = v109;
          *(_DWORD *)uint64_t v108 = 136446210;
          uint64_t v110 = sub_251381230();
          uint64_t v144 = sub_2512F6F6C(v110, v111, (uint64_t *)&v176);
          sub_251380DB0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2512DB000, v106, v107, "[%{public}s] reset noise counter", v108, 0xCu);
          swift_arrayDestroy();
          uint64_t v112 = v109;
          double v48 = v140;
          MEMORY[0x25339CCC0](v112, -1, -1);
          os_log_type_t v113 = v108;
          uint64_t v101 = v134;
          MEMORY[0x25339CCC0](v113, -1, -1);
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        id v122 = v102;
      }
      sub_2512FBDB8();
      sub_2512FC034();
    }
    else if (byte_269B36232)
    {
      uint64_t v135 = v159;
      uint64_t v114 = qword_269B316B0;
      swift_bridgeObjectRetain();
      if (v114 != -1) {
        swift_once();
      }
      uint64_t v115 = sub_2513806D0();
      __swift_project_value_buffer(v115, (uint64_t)qword_269B31BB8);
      uint64_t v116 = sub_2513806B0();
      os_log_type_t v117 = sub_251380C30();
      if (os_log_type_enabled(v116, v117))
      {
        id v118 = (uint8_t *)swift_slowAlloc();
        uint64_t v119 = swift_slowAlloc();
        *(void *)&long long v176 = v119;
        *(_DWORD *)id v118 = 136446210;
        uint64_t v120 = sub_251381230();
        uint64_t v144 = sub_2512F6F6C(v120, v121, (uint64_t *)&v176);
        sub_251380DB0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2512DB000, v116, v117, "[%{public}s] failed to reset noise counter", v118, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25339CCC0](v119, -1, -1);
        MEMORY[0x25339CCC0](v118, -1, -1);
      }

      uint64_t v101 = v135;
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    *(_OWORD *)&v143[198] = v172;
    *(_OWORD *)&v143[214] = v173;
    *(_OWORD *)&v143[230] = v174;
    *(_OWORD *)&v143[134] = v168;
    *(_OWORD *)&v143[150] = v169;
    *(_OWORD *)&v143[166] = v170;
    *(_OWORD *)&v143[182] = v171;
    *(_OWORD *)&v143[70] = v164;
    *(_OWORD *)&v143[86] = v165;
    *(_OWORD *)&v143[102] = v166;
    *(_OWORD *)&v143[118] = v167;
    *(_OWORD *)&v143[6] = v160;
    *(_OWORD *)&v143[22] = v161;
    *(_OWORD *)&v143[38] = v162;
    *(void *)&v143[246] = v175;
    *(_OWORD *)&v143[54] = v163;
    sub_251380D40();
    if (qword_269B316B8 != -1) {
      swift_once();
    }
    if (qword_269B316C0 != -1) {
      swift_once();
    }
    uint64_t v123 = sub_2513806A0();
    __swift_project_value_buffer(v123, (uint64_t)qword_269B31BD8);
    sub_251380680();
    long long v155 = *(_OWORD *)&v143[192];
    long long v156 = *(_OWORD *)&v143[208];
    *(_OWORD *)long long v157 = *(_OWORD *)&v143[224];
    *(_OWORD *)&v157[14] = *(_OWORD *)&v143[238];
    long long v151 = *(_OWORD *)&v143[128];
    long long v152 = *(_OWORD *)&v143[144];
    long long v153 = *(_OWORD *)&v143[160];
    long long v154 = *(_OWORD *)&v143[176];
    *(_OWORD *)&v148[64] = *(_OWORD *)&v143[64];
    *(_OWORD *)&v148[80] = *(_OWORD *)&v143[80];
    long long v149 = *(_OWORD *)&v143[96];
    long long v150 = *(_OWORD *)&v143[112];
    *(_OWORD *)long long v148 = *(_OWORD *)v143;
    *(_OWORD *)&v148[16] = *(_OWORD *)&v143[16];
    long long v80 = *(_OWORD *)&v143[48];
    *(_OWORD *)&v148[32] = *(_OWORD *)&v143[32];
    uint64_t v144 = v101;
    double v145 = v48;
    char v146 = v142;
    char v81 = 0;
    goto LABEL_85;
  }
  uint64_t v127 = v5;
  uint64_t v128 = v6;
  double v31 = *(double *)v11;
  double v30 = *(double *)(v11 + 8);
  uint64_t v131 = *(unsigned __int8 *)(v11 + 16);
  uint64_t v32 = *(void *)(v11 + 24);
  int v33 = *(_DWORD *)(v11 + 32);
  if (qword_269B316A0 != -1) {
    swift_once();
  }
  uint64_t v34 = sub_2513806D0();
  __swift_project_value_buffer(v34, (uint64_t)qword_269B31B88);
  uint64_t v35 = sub_2513806B0();
  os_log_type_t v36 = sub_251380C40();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v126 = v9;
    uint64_t v37 = swift_slowAlloc();
    uint64_t v125 = swift_slowAlloc();
    *(void *)&long long v176 = v125;
    *(_DWORD *)uint64_t v37 = 136447234;
    uint64_t v38 = sub_251381230();
    sub_2512F6F6C(v38, v39, (uint64_t *)&v176);
    sub_251380DB0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v37 + 12) = 2048;
    sub_251380DB0();
    *(_WORD *)(v37 + 22) = 2048;
    sub_251380DB0();
    *(_WORD *)(v37 + 32) = 2048;
    sub_251380DB0();
    *(_WORD *)(v37 + 42) = 2048;
    uint64_t v144 = v131;
    sub_251380DB0();
    _os_log_impl(&dword_2512DB000, v35, v36, "[%{public}s] Continue test, next stimulus freq %f, level %f, duration %f, ch %ld", (uint8_t *)v37, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x25339CCC0](v125, -1, -1);
    uint64_t v40 = v37;
    uint64_t v9 = v126;
    MEMORY[0x25339CCC0](v40, -1, -1);
  }

  uint64_t v42 = v127;
  uint64_t v41 = v128;
  uint64_t v43 = *(void **)(a3 + 144);
  if (v43)
  {
    if (v131) {
      int v46 = 2;
    }
    else {
      int v46 = 1;
    }
    sub_251378D9C((uint64_t)a2);
    id v47 = v43;
    float v44 = v31;
    float v45 = v30;
    sub_251332228(v46, v44, v45);

    uint64_t v144 = *(void *)&v31;
    double v145 = v30;
    char v146 = v131;
    *(void *)&v148[6] = v32;
    *(_DWORD *)&v148[14] = v33;
    *(void *)&v148[22] = v133;
    *(void *)&v148[30] = v136;
    *(void *)&v148[38] = v141;
    *(void *)&v148[46] = v127;
    *(void *)&v148[54] = v128;
    *(void *)&v148[62] = v7;
    *(void *)&v148[70] = v8;
  }
  else
  {
    uint64_t v130 = v8;
    sub_251378D9C((uint64_t)a2);
    unint64_t v60 = sub_2513806B0();
    os_log_type_t v61 = sub_251380C30();
    if (os_log_type_enabled(v60, v61))
    {
      uint64_t v62 = (uint8_t *)swift_slowAlloc();
      uint64_t v63 = swift_slowAlloc();
      *(void *)&long long v176 = v63;
      *(_DWORD *)uint64_t v62 = 136446210;
      uint64_t v64 = sub_251381230();
      uint64_t v144 = sub_2512F6F6C(v64, v65, (uint64_t *)&v176);
      sub_251380DB0();
      uint64_t v42 = v127;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2512DB000, v60, v61, "[%{public}s] Accessory manager not found", v62, 0xCu);
      swift_arrayDestroy();
      uint64_t v66 = v63;
      uint64_t v41 = v128;
      MEMORY[0x25339CCC0](v66, -1, -1);
      MEMORY[0x25339CCC0](v62, -1, -1);
    }

    uint64_t v144 = *(void *)&v31;
    double v145 = v30;
    char v146 = v131;
    *(void *)&v148[6] = v32;
    *(_DWORD *)&v148[14] = v33;
    *(void *)&v148[22] = v133;
    *(void *)&v148[30] = v136;
    *(void *)&v148[38] = v141;
    *(void *)&v148[46] = v42;
    *(void *)&v148[54] = v41;
    *(void *)&v148[62] = v7;
    *(void *)&v148[70] = v130;
  }
  *(void *)&v148[78] = v9;
  *(void *)&v148[86] = v132;
  sub_251378C68((uint64_t)&v144);
LABEL_86:
  sub_251378C7C((uint64_t)&v144, (uint64_t)&v176);
  sub_251378C7C((uint64_t)&v176, (uint64_t)&v144);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B325F0);
  return sub_251380AA0();
}

uint64_t sub_251374E3C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 776) = a1;
  char v3 = *(unsigned char *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v2 + 736) = *(_OWORD *)a2;
  *(_OWORD *)(v2 + 752) = v4;
  *(unsigned char *)(v2 + 768) = v3;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 784) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_251374EF8;
  return sub_25136FED8(v2 + 496, v2 + 736);
}

uint64_t sub_251374EF8()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_251374FF4, 0, 0);
}

uint64_t sub_251374FF4()
{
  sub_2513780A8(v0 + 496, v0 + 256);
  sub_2513780A8(v0 + 256, v0 + 16);
  if (sub_251310AAC(v0 + 16) == 1)
  {
    uint64_t v1 = *(void *)(v0 + 776);
    uint64_t v2 = nullsub_1(v0 + 16);
    uint64_t v3 = *(unsigned __int8 *)(v2 + 16);
    uint64_t v4 = *(void *)(v2 + 24);
    uint64_t v5 = *(void *)(v2 + 104);
    unint64_t v6 = *(unsigned int *)(v2 + 32) | 0x8000000000000000;
    long long v7 = *(_OWORD *)(v2 + 40);
    long long v8 = *(_OWORD *)(v2 + 56);
    long long v9 = *(_OWORD *)(v2 + 72);
    long long v10 = *(_OWORD *)(v2 + 88);
    *(_OWORD *)uint64_t v1 = *(_OWORD *)v2;
    *(void *)(v1 + 16) = v3;
    *(void *)(v1 + 24) = v4;
    *(void *)(v1 + 32) = v6;
    *(_OWORD *)(v1 + 40) = v7;
    *(_OWORD *)(v1 + 56) = v8;
    *(_OWORD *)(v1 + 72) = v9;
    *(_OWORD *)(v1 + 88) = v10;
    *(void *)(v1 + 104) = v5;
  }
  else
  {
    uint64_t v11 = nullsub_1(v0 + 16);
    uint64_t v12 = *(void *)(v0 + 776);
    if (*(unsigned char *)(v11 + 9))
    {
      sub_251378104();
      uint64_t v13 = swift_allocError();
      sub_251378FB0(v0 + 256, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_251310964);
      uint64_t v14 = 256;
      *(void *)uint64_t v12 = v13;
    }
    else
    {
      uint64_t v14 = *(unsigned __int8 *)(v11 + 8);
      *(void *)uint64_t v12 = *(void *)v11;
    }
    *(void *)(v12 + 8) = v14;
    *(_OWORD *)(v12 + 16) = 0u;
    *(_OWORD *)(v12 + 32) = 0u;
    *(_OWORD *)(v12 + 48) = 0u;
    *(_OWORD *)(v12 + 64) = 0u;
    *(_OWORD *)(v12 + 80) = 0u;
    *(_OWORD *)(v12 + 96) = 0u;
  }
  long long v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t sub_251375158()
{
  uint64_t v1 = v0;
  if (qword_269B316A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2513806D0();
  __swift_project_value_buffer(v2, (uint64_t)qword_269B31B88);
  uint64_t v3 = sub_2513806B0();
  os_log_type_t v4 = sub_251380C40();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v13[0] = v6;
    *(_DWORD *)uint64_t v5 = 136447234;
    uint64_t v7 = sub_251381230();
    sub_2512F6F6C(v7, v8, v13);
    sub_251380DB0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2048;
    sub_251380DB0();
    *(_WORD *)(v5 + 22) = 2048;
    sub_251380DB0();
    *(_WORD *)(v5 + 32) = 2048;
    sub_251380DB0();
    *(_WORD *)(v5 + 42) = 2048;
    sub_251380DB0();
    _os_log_impl(&dword_2512DB000, v3, v4, "[%{public}s] HT session received playback confirmation for Tone freq %f, level %f, duration %f, ch %ld", (uint8_t *)v5, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x25339CCC0](v6, -1, -1);
    MEMORY[0x25339CCC0](v5, -1, -1);
  }

  uint64_t v9 = v1 + 16;
  swift_beginAccess();
  uint64_t v11 = *(void *)(v1 + 40);
  uint64_t v10 = *(void *)(v1 + 48);
  __swift_mutable_project_boxed_opaque_existential_1(v9, v11);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 88))(v11, v10);
}

uint64_t sub_2513753DC()
{
  *(void *)(v1 + 40) = v0;
  *(void *)(v1 + 48) = *v0;
  return MEMORY[0x270FA2498](sub_251375424, 0, 0);
}

uint64_t sub_251375424()
{
  uint64_t v23 = v0;
  uint64_t v1 = v0[5];
  if (*(unsigned char *)(v1 + 104) == 1)
  {
    if (qword_269B316A0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2513806D0();
    __swift_project_value_buffer(v2, (uint64_t)qword_269B31B88);
    uint64_t v3 = sub_2513806B0();
    os_log_type_t v4 = sub_251380C40();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      uint64_t v22 = v6;
      *(_DWORD *)uint64_t v5 = 136446210;
      uint64_t v7 = sub_251381230();
      v0[2] = sub_2512F6F6C(v7, v8, &v22);
      sub_251380DB0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2512DB000, v3, v4, "[%{public}s] Evaluation paused, already rolled back samples", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25339CCC0](v6, -1, -1);
      MEMORY[0x25339CCC0](v5, -1, -1);
    }
  }
  else
  {
    if (qword_269B316A0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2513806D0();
    __swift_project_value_buffer(v9, (uint64_t)qword_269B31B88);
    uint64_t v10 = sub_2513806B0();
    os_log_type_t v11 = sub_251380C40();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v22 = v13;
      *(_DWORD *)uint64_t v12 = 136446210;
      uint64_t v14 = sub_251381230();
      v0[2] = sub_2512F6F6C(v14, v15, &v22);
      sub_251380DB0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2512DB000, v10, v11, "[%{public}s] Evaluation paused, rolling back 2 samples", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25339CCC0](v13, -1, -1);
      MEMORY[0x25339CCC0](v12, -1, -1);
    }

    uint64_t v16 = v0[5];
    *(unsigned char *)(v1 + 104) = 1;
    uint64_t v17 = v16 + 16;
    swift_beginAccess();
    uint64_t v18 = *(void *)(v16 + 40);
    uint64_t v19 = *(void *)(v16 + 48);
    __swift_mutable_project_boxed_opaque_existential_1(v17, v18);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 112))(2, v18, v19);
    swift_endAccess();
  }
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_25137578C()
{
  *(void *)(v1 + 24) = *v0;
  return MEMORY[0x270FA2498](sub_2513757D0, 0, 0);
}

uint64_t sub_2513757D0()
{
  uint64_t v11 = v0;
  if (qword_269B316A0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2513806D0();
  __swift_project_value_buffer(v1, (uint64_t)qword_269B31B88);
  uint64_t v2 = sub_2513806B0();
  os_log_type_t v3 = sub_251380C40();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v10 = v5;
    *(_DWORD *)os_log_type_t v4 = 136446210;
    uint64_t v6 = sub_251381230();
    *(void *)(v0 + 16) = sub_2512F6F6C(v6, v7, &v10);
    sub_251380DB0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2512DB000, v2, v3, "[%{public}s] Evaluation resumed", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25339CCC0](v5, -1, -1);
    MEMORY[0x25339CCC0](v4, -1, -1);
  }

  unint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_251375990@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v26 = a1[1];
  uint64_t v27 = *a1;
  uint64_t v24 = a1[3];
  uint64_t v25 = a1[2];
  uint64_t v22 = a1[5];
  uint64_t v23 = a1[4];
  uint64_t v20 = a1[7];
  uint64_t v21 = a1[6];
  uint64_t v19 = a1[8];
  uint64_t v4 = a1[12];
  uint64_t v5 = a1[13];
  uint64_t v6 = a1[14];
  uint64_t v7 = a1[15];
  uint64_t v8 = a1[17];
  uint64_t v14 = a1[18];
  uint64_t v15 = a1[16];
  uint64_t v32 = a1[20];
  uint64_t v33 = a1[19];
  uint64_t v30 = a1[22];
  uint64_t v31 = a1[21];
  uint64_t v9 = a1[25];
  uint64_t v28 = a1[24];
  uint64_t v29 = a1[23];
  uint64_t v10 = a1[26];
  uint64_t v17 = v2[15];
  uint64_t v18 = v2[14];
  uint64_t v16 = v2[16];
  swift_beginAccess();
  sub_251377F74((uint64_t)(v2 + 7), (uint64_t)v35);
  if (!v36)
  {
    uint64_t result = sub_251377FDC((uint64_t)v35);
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B325E8);
  type metadata accessor for HTRequirementStatusManager();
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_5:
    uint64_t v13 = v14;
    uint64_t v12 = v15;
    goto LABEL_6;
  }
  uint64_t v4 = v34[92];
  uint64_t v5 = v34[93];
  uint64_t v6 = v34[94];
  uint64_t v7 = v34[95];
  uint64_t v12 = v34[96];
  uint64_t v8 = v34[97];
  uint64_t v13 = v34[98];
  uint64_t v32 = v34[100];
  uint64_t v33 = v34[99];
  uint64_t v30 = v34[102];
  uint64_t v31 = v34[101];
  uint64_t v28 = v34[104];
  uint64_t v29 = v34[103];
  uint64_t v9 = v34[105];
  uint64_t v10 = v34[106];
  uint64_t result = swift_release();
LABEL_6:
  *a2 = v27;
  a2[1] = v26;
  a2[2] = v25;
  a2[3] = v24;
  a2[4] = v23;
  a2[5] = v22;
  a2[6] = v21;
  a2[7] = v20;
  a2[8] = v19;
  a2[9] = v18;
  a2[10] = v17;
  a2[11] = v16;
  a2[12] = v4;
  a2[13] = v5;
  a2[14] = v6;
  a2[15] = v7;
  a2[16] = v12;
  a2[17] = v8;
  a2[18] = v13;
  a2[19] = v33;
  a2[20] = v32;
  a2[21] = v31;
  a2[22] = v30;
  a2[23] = v29;
  a2[24] = v28;
  a2[25] = v9;
  a2[26] = v10;
  return result;
}

uint64_t sub_251375BA0@<X0>(long long *a1@<X0>, void *a2@<X8>)
{
  long long v4 = a1[13];
  long long v62 = a1[12];
  long long v63 = v4;
  long long v64 = a1[14];
  uint64_t v65 = *((void *)a1 + 30);
  long long v5 = a1[9];
  long long v58 = a1[8];
  long long v59 = v5;
  long long v6 = a1[11];
  long long v60 = a1[10];
  long long v61 = v6;
  long long v7 = a1[5];
  long long v54 = a1[4];
  long long v55 = v7;
  long long v8 = a1[7];
  long long v56 = a1[6];
  long long v57 = v8;
  long long v9 = a1[1];
  long long v50 = *a1;
  long long v51 = v9;
  long long v10 = a1[3];
  long long v52 = a1[2];
  long long v53 = v10;
  uint64_t v35 = *((void *)&v50 + 1);
  uint64_t v36 = v50;
  uint64_t v33 = *((void *)&v51 + 1);
  uint64_t v34 = v51;
  uint64_t v31 = *((void *)&v52 + 1);
  uint64_t v32 = v52;
  uint64_t v29 = *((void *)&v10 + 1);
  uint64_t v30 = v10;
  uint64_t v28 = v54;
  uint64_t v45 = *((void *)&v56 + 1);
  uint64_t v46 = v56;
  uint64_t v43 = *((void *)&v57 + 1);
  uint64_t v44 = v57;
  uint64_t v41 = *((void *)&v58 + 1);
  uint64_t v42 = v58;
  uint64_t v39 = *((void *)&v59 + 1);
  uint64_t v40 = v59;
  uint64_t v11 = v61;
  uint64_t v37 = *((void *)&v60 + 1);
  uint64_t v38 = v60;
  uint64_t v12 = *((void *)&v61 + 1);
  uint64_t v14 = *((void *)&v62 + 1);
  uint64_t v13 = v62;
  uint64_t v16 = *((void *)&v63 + 1);
  uint64_t v15 = v63;
  uint64_t v17 = *((void *)&v64 + 1);
  uint64_t v19 = v64;
  uint64_t v18 = v65;
  uint64_t v26 = v2[15];
  uint64_t v27 = v2[14];
  uint64_t v25 = v2[16];
  swift_beginAccess();
  sub_251377F74((uint64_t)(v2 + 7), (uint64_t)v48);
  if (!v49)
  {
    sub_251378960((uint64_t)&v50);
    uint64_t result = sub_251377FDC((uint64_t)v48);
    uint64_t v21 = v2[19];
    if (!v21) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  sub_251378960((uint64_t)&v50);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B325E8);
  type metadata accessor for HTRequirementStatusManager();
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    uint64_t v45 = v47[93];
    uint64_t v46 = v47[92];
    uint64_t v43 = v47[95];
    uint64_t v44 = v47[94];
    uint64_t v41 = v47[97];
    uint64_t v42 = v47[96];
    uint64_t v39 = v47[99];
    uint64_t v40 = v47[98];
    uint64_t v37 = v47[101];
    uint64_t v38 = v47[100];
    uint64_t v11 = v47[102];
    uint64_t v12 = v47[103];
    uint64_t v13 = v47[104];
    uint64_t v14 = v47[105];
    uint64_t v15 = v47[106];
    uint64_t result = swift_release();
  }
  uint64_t v21 = v2[19];
  if (v21)
  {
LABEL_5:
    uint64_t v22 = (uint64_t *)(v21 + OBJC_IVAR____TtC11HearingTest15HTNoiseMetadata_metrics);
    swift_beginAccess();
    uint64_t v16 = *v22;
    uint64_t v19 = v22[1];
    uint64_t v24 = v22[2];
    uint64_t v23 = v22[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v17 = v24;
    uint64_t v18 = v23;
  }
LABEL_6:
  *a2 = v36;
  a2[1] = v35;
  a2[2] = v34;
  a2[3] = v33;
  a2[4] = v32;
  a2[5] = v31;
  a2[6] = v30;
  a2[7] = v29;
  a2[8] = v28;
  a2[9] = v27;
  a2[10] = v26;
  a2[11] = v25;
  a2[12] = v46;
  a2[13] = v45;
  a2[14] = v44;
  a2[15] = v43;
  a2[16] = v42;
  a2[17] = v41;
  a2[18] = v40;
  a2[19] = v39;
  a2[20] = v38;
  a2[21] = v37;
  a2[22] = v11;
  a2[23] = v12;
  a2[24] = v13;
  a2[25] = v14;
  a2[26] = v15;
  a2[27] = v16;
  a2[28] = v19;
  a2[29] = v17;
  a2[30] = v18;
  return result;
}

uint64_t sub_251375EA4(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 656) = v2;
  *(void *)(v3 + 648) = a1;
  *(void *)(v3 + 664) = *v2;
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 672) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 688) = v4;
  *(unsigned char *)(v3 + 249) = *(unsigned char *)(a2 + 32);
  return MEMORY[0x270FA2498](sub_251375F00, 0, 0);
}

void sub_251375F00()
{
  uint64_t v99 = v0;
  uint64_t v4 = *(void *)(v0 + 656) + 136;
  swift_beginAccess();
  if (*(void *)v4 && *(void *)(*(void *)v4 + 16))
  {
    uint64_t v5 = *(void *)(v0 + 656);
    long long v7 = sub_25136F36C();
    uint64_t v8 = *v6;
    if (*v6)
    {
      if (!*(void *)(v8 + 16))
      {
        __break(1u);
        goto LABEL_49;
      }
      uint64_t v5 = (uint64_t)v6;
      long long v9 = *(void **)(v8 + 32);
      swift_bridgeObjectRetain();
      sub_251378AF4(0, 1);
      ((void (*)(uint64_t, void))v7)(v0 + 376, 0);
      if (v9[2] <= 3uLL)
      {
        swift_bridgeObjectRelease();
        if (qword_269B316A0 != -1) {
          swift_once();
        }
        uint64_t v10 = sub_2513806D0();
        __swift_project_value_buffer(v10, (uint64_t)qword_269B31B88);
        uint64_t v5 = sub_2513806B0();
        os_log_type_t v11 = sub_251380C40();
        if (os_log_type_enabled((os_log_t)v5, v11))
        {
          uint64_t v12 = (uint8_t *)swift_slowAlloc();
          uint64_t v13 = swift_slowAlloc();
          *(void *)&long long v94 = v13;
          *(_DWORD *)uint64_t v12 = 136446210;
          uint64_t v14 = sub_251381230();
          *(void *)(v0 + 640) = sub_2512F6F6C(v14, v15, (uint64_t *)&v94);
          sub_251380DB0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2512DB000, (os_log_t)v5, v11, "[%{public}s] On demand tones should have 4 parameters: frequency, soundLevel, channel(L:0, R:1) and toneDuration. Ex: '(1000, 50, 0, 1)' '(2000, 40, 1, 1)'", v12, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x25339CCC0](v13, -1, -1);
          MEMORY[0x25339CCC0](v12, -1, -1);
        }

        long long v9 = &unk_270228770;
      }
      uint64_t v16 = *(unsigned __int8 *)(v0 + 688);
      if (v16 == 2)
      {
LABEL_38:
        unint64_t v64 = v9[2];
        if (v64)
        {
          if (v64 != 1)
          {
            if (v64 >= 3)
            {
              if (v64 != 3)
              {
                uint64_t v1 = v9[4];
                uint64_t v2 = v9[5];
                uint64_t v5 = v9[6];
                uint64_t v3 = v9[7];
                swift_bridgeObjectRelease();
                if (qword_269B316A0 == -1)
                {
LABEL_43:
                  uint64_t v65 = v5 & 0x7FFFFFFFFFFFFFFFLL;
                  uint64_t v66 = sub_2513806D0();
                  __swift_project_value_buffer(v66, (uint64_t)qword_269B31B88);
                  uint64_t v67 = sub_2513806B0();
                  os_log_type_t v68 = sub_251380C40();
                  if (os_log_type_enabled(v67, v68))
                  {
                    BOOL v90 = v65 != 0;
                    uint64_t v92 = v65;
                    uint64_t v69 = swift_slowAlloc();
                    uint64_t v70 = swift_slowAlloc();
                    *(void *)&long long v94 = v70;
                    *(_DWORD *)uint64_t v69 = 136447234;
                    uint64_t v71 = sub_251381230();
                    *(void *)(v0 + 504) = sub_2512F6F6C(v71, v72, (uint64_t *)&v94);
                    sub_251380DB0();
                    swift_bridgeObjectRelease();
                    *(_WORD *)(v69 + 12) = 2048;
                    *(void *)(v0 + 544) = v1;
                    sub_251380DB0();
                    *(_WORD *)(v69 + 22) = 2048;
                    *(void *)(v0 + 552) = v2;
                    sub_251380DB0();
                    *(_WORD *)(v69 + 32) = 2048;
                    *(void *)(v0 + 520) = v3;
                    sub_251380DB0();
                    *(_WORD *)(v69 + 42) = 2048;
                    *(void *)(v0 + 512) = v90;
                    sub_251380DB0();
                    _os_log_impl(&dword_2512DB000, v67, v68, "[%{public}s] Continue test, next on demand tone freq %f, level %f, duration %f, ch %ld", (uint8_t *)v69, 0x34u);
                    swift_arrayDestroy();
                    MEMORY[0x25339CCC0](v70, -1, -1);
                    uint64_t v73 = v69;
                    uint64_t v65 = v92;
                    MEMORY[0x25339CCC0](v73, -1, -1);
                  }

                  uint64_t v74 = *(void *)(v0 + 656);
                  uint64_t v75 = *(void *)(v0 + 648);
                  swift_beginAccess();
                  __swift_project_boxed_opaque_existential_1((void *)(v74 + 16), *(void *)(v74 + 40));
                  sub_2512DF094((uint64_t)&v94);
                  uint64_t v76 = v98;
                  *(void *)(v0 + 16) = v1;
                  *(void *)(v0 + 24) = v2;
                  *(unsigned char *)(v0 + 32) = v65 != 0;
                  *(void *)(v0 + 40) = v3;
                  *(_DWORD *)(v0 + 48) = 0;
                  long long v77 = v95;
                  *(_OWORD *)(v0 + 56) = v94;
                  *(_OWORD *)(v0 + 72) = v77;
                  long long v78 = v97;
                  *(_OWORD *)(v0 + 88) = v96;
                  *(_OWORD *)(v0 + 104) = v78;
                  *(void *)(v0 + 120) = v76;
                  sub_2512EF71C(v0 + 16);
                  sub_2513780A8(v0 + 16, v75);
                  uint64_t v79 = *(void (**)(void))(v0 + 8);
                  v79();
                  return;
                }
LABEL_53:
                swift_once();
                goto LABEL_43;
              }
LABEL_52:
              __break(1u);
              goto LABEL_53;
            }
LABEL_51:
            __break(1u);
            goto LABEL_52;
          }
LABEL_50:
          __break(1u);
          goto LABEL_51;
        }
LABEL_49:
        __break(1u);
        goto LABEL_50;
      }
      uint64_t v17 = v0 + 296;
      long long v88 = (void *)(v0 + 256);
      uint64_t v89 = v16 & 1;
      unsigned int v91 = *(unsigned char *)(v0 + 249) & 1;
      if (qword_269B316F8 != -1) {
        swift_once();
      }
      if (byte_269B36233 == 1)
      {
        if (qword_269B316A0 != -1) {
          swift_once();
        }
        uint64_t v18 = sub_2513806D0();
        __swift_project_value_buffer(v18, (uint64_t)qword_269B31B88);
        uint64_t v19 = sub_2513806B0();
        os_log_type_t v20 = sub_251380C40();
        if (!os_log_type_enabled(v19, v20)) {
          goto LABEL_29;
        }
        uint64_t v83 = *(void *)(v0 + 696);
        uint64_t v80 = *(void *)(v0 + 672);
        uint64_t v81 = *(void *)(v0 + 680);
        uint64_t v87 = v0 + 296;
        uint64_t v21 = swift_slowAlloc();
        uint64_t v86 = swift_slowAlloc();
        *(void *)&long long v94 = v86;
        *(_DWORD *)uint64_t v21 = 136447490;
        uint64_t v22 = sub_251381230();
        *(void *)(v0 + 600) = sub_2512F6F6C(v22, v23, (uint64_t *)&v94);
        sub_251380DB0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v21 + 12) = 2048;
        *(void *)(v0 + 608) = v80;
        sub_251380DB0();
        *(_WORD *)(v21 + 22) = 2048;
        *(void *)(v0 + 616) = v81;
        sub_251380DB0();
        *(_WORD *)(v21 + 32) = 2048;
        *(void *)(v0 + 624) = v83;
        sub_251380DB0();
        *(_WORD *)(v21 + 42) = 2048;
        *(void *)(v0 + 632) = v89;
        sub_251380DB0();
        *(_WORD *)(v21 + 52) = 1024;
        *(_DWORD *)(v0 + 252) = v91;
        sub_251380DB0();
        _os_log_impl(&dword_2512DB000, v19, v20, "[%{public}s] Current Tone freq %f lv %f dur %f ch %ld Response %{BOOL}d", (uint8_t *)v21, 0x3Au);
        swift_arrayDestroy();
        uint64_t v24 = v86;
      }
      else
      {
        if (qword_269B316A0 != -1) {
          swift_once();
        }
        uint64_t v34 = sub_2513806D0();
        __swift_project_value_buffer(v34, (uint64_t)qword_269B31B88);
        uint64_t v19 = sub_2513806B0();
        os_log_type_t v35 = sub_251380C40();
        if (!os_log_type_enabled(v19, v35)) {
          goto LABEL_29;
        }
        uint64_t v85 = *(void *)(v0 + 696);
        uint64_t v84 = *(void *)(v0 + 680);
        uint64_t v82 = *(void *)(v0 + 672);
        uint64_t v87 = v0 + 296;
        uint64_t v21 = swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        *(void *)&long long v94 = v36;
        *(_DWORD *)uint64_t v21 = 136447234;
        uint64_t v37 = sub_251381230();
        *(void *)(v0 + 560) = sub_2512F6F6C(v37, v38, (uint64_t *)&v94);
        sub_251380DB0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v21 + 12) = 2048;
        *(void *)(v0 + 568) = v82;
        sub_251380DB0();
        *(_WORD *)(v21 + 22) = 2048;
        *(void *)(v0 + 576) = v84;
        sub_251380DB0();
        *(_WORD *)(v21 + 32) = 2048;
        *(void *)(v0 + 584) = v85;
        sub_251380DB0();
        *(_WORD *)(v21 + 42) = 2048;
        *(void *)(v0 + 592) = v89;
        sub_251380DB0();
        _os_log_impl(&dword_2512DB000, v19, v35, "[%{public}s] Current Tone freq %f lv %f dur %f ch %ld", (uint8_t *)v21, 0x34u);
        swift_arrayDestroy();
        uint64_t v24 = v36;
      }
      MEMORY[0x25339CCC0](v24, -1, -1);
      uint64_t v39 = v21;
      uint64_t v17 = v87;
      MEMORY[0x25339CCC0](v39, -1, -1);
LABEL_29:

      uint64_t v40 = *(void *)(v0 + 656) + 56;
      swift_beginAccess();
      sub_251377F74(v40, v17);
      if (*(void *)(v0 + 320))
      {
        uint64_t v41 = *(void *)(v0 + 696);
        uint64_t v42 = *(void *)(v0 + 680);
        uint64_t v43 = *(void *)(v0 + 672);
        sub_25137803C(v17, (uint64_t)v88);
        sub_251377FDC(v17);
        uint64_t v44 = *(void *)(v0 + 280);
        uint64_t v45 = *(void *)(v0 + 288);
        __swift_project_boxed_opaque_existential_1(v88, v44);
        *(void *)&long long v94 = v43;
        *((void *)&v94 + 1) = v42;
        LOBYTE(v95) = v89;
        *((void *)&v95 + 1) = v41;
        LOBYTE(v96) = v91;
        char v46 = (*(uint64_t (**)(long long *, uint64_t, uint64_t))(v45 + 8))(&v94, v44, v45);
        id v48 = v47;
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v88);
LABEL_33:
        if (qword_269B316A0 != -1) {
          swift_once();
        }
        uint64_t v53 = sub_2513806D0();
        __swift_project_value_buffer(v53, (uint64_t)qword_269B31B88);
        long long v54 = sub_2513806B0();
        os_log_type_t v55 = sub_251380C40();
        if (os_log_type_enabled(v54, v55))
        {
          uint64_t v56 = swift_slowAlloc();
          uint64_t v57 = swift_slowAlloc();
          *(void *)&long long v94 = v57;
          *(_DWORD *)uint64_t v56 = 136446722;
          uint64_t v58 = sub_251381230();
          *(void *)(v0 + 528) = sub_2512F6F6C(v58, v59, (uint64_t *)&v94);
          sub_251380DB0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v56 + 12) = 1024;
          *(_DWORD *)(v0 + 372) = v46 & 1;
          sub_251380DB0();
          *(_WORD *)(v56 + 18) = 2048;
          *(void *)(v0 + 536) = v48;
          sub_251380DB0();
          _os_log_impl(&dword_2512DB000, v54, v55, "[%{public}s] Current Tone interferenceFlag %{BOOL}d, repeat the previous tone for up to %ld times", (uint8_t *)v56, 0x1Cu);
          swift_arrayDestroy();
          MEMORY[0x25339CCC0](v57, -1, -1);
          MEMORY[0x25339CCC0](v56, -1, -1);
        }

        uint64_t v60 = *(void *)(v0 + 656);
        uint64_t v61 = v60 + 16;
        swift_beginAccess();
        uint64_t v62 = *(void *)(v60 + 40);
        uint64_t v63 = *(void *)(v60 + 48);
        uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1(v61, v62);
        (*(void (**)(void, void, uint64_t, uint64_t))(v63 + 80))(v91, v46 & 1, v62, v63);
        swift_endAccess();
        goto LABEL_38;
      }
      sub_251377FDC(v17);
      id v49 = objc_allocWithZone(MEMORY[0x263EFFA40]);
      long long v50 = (void *)sub_251380840();
      id v51 = objc_msgSend(v49, sel_initWithSuiteName_, v50);

      if (v51)
      {
        long long v52 = (void *)sub_251380840();
        id v48 = objc_msgSend(v51, sel_integerForKey_, v52);

        char v46 = 0;
        goto LABEL_33;
      }
LABEL_55:
      __break(1u);
      return;
    }
    ((void (*)(uint64_t, void))v7)(v0 + 376, 0);
  }
  id v25 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v26 = (void *)sub_251380840();
  id v27 = objc_msgSend(v25, sel_initWithSuiteName_, v26);

  if (!v27)
  {
    __break(1u);
    goto LABEL_55;
  }
  char v28 = *(unsigned char *)(v0 + 249);
  uint64_t v29 = *(void *)(v0 + 696);
  uint64_t v30 = *(void *)(v0 + 688);
  long long v93 = *(_OWORD *)(v0 + 672);
  uint64_t v31 = sub_251308574();

  *(void *)uint64_t v4 = v31;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v0 + 336) = v93;
  *(void *)(v0 + 352) = v30;
  *(void *)(v0 + 360) = v29;
  *(unsigned char *)(v0 + 368) = v28;
  uint64_t v32 = (void *)swift_task_alloc();
  *(void *)(v0 + 704) = v32;
  *uint64_t v32 = v0;
  v32[1] = sub_251376D40;
  uint64_t v33 = *(void *)(v0 + 648);
  sub_25136FED8(v33, v0 + 336);
}

uint64_t sub_251376D40()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_251376E34(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 688) = v2;
  *(void *)(v3 + 680) = a1;
  *(void *)(v3 + 696) = *v2;
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 704) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 720) = v4;
  *(unsigned char *)(v3 + 401) = *(unsigned char *)(a2 + 32);
  return MEMORY[0x270FA2498](sub_251376E90, 0, 0);
}

void sub_251376E90()
{
  uint64_t v98 = v0;
  uint64_t v4 = *(void *)(v0 + 688) + 136;
  swift_beginAccess();
  if (*(void *)v4 && *(void *)(*(void *)v4 + 16))
  {
    uint64_t v5 = *(void *)(v0 + 688);
    long long v7 = sub_25136F36C();
    uint64_t v8 = *v6;
    if (*v6)
    {
      if (!*(void *)(v8 + 16))
      {
        __break(1u);
        goto LABEL_50;
      }
      uint64_t v5 = (uint64_t)v6;
      long long v9 = *(void **)(v8 + 32);
      swift_bridgeObjectRetain();
      sub_251378AF4(0, 1);
      ((void (*)(uint64_t, void))v7)(v0 + 408, 0);
      unint64_t v10 = 0x269B31000uLL;
      if (v9[2] <= 3uLL)
      {
        swift_bridgeObjectRelease();
        if (qword_269B316A0 != -1) {
          swift_once();
        }
        uint64_t v11 = sub_2513806D0();
        __swift_project_value_buffer(v11, (uint64_t)qword_269B31B88);
        uint64_t v5 = sub_2513806B0();
        os_log_type_t v12 = sub_251380C40();
        if (os_log_type_enabled((os_log_t)v5, v12))
        {
          uint64_t v13 = (uint8_t *)swift_slowAlloc();
          uint64_t v14 = swift_slowAlloc();
          *(void *)&long long v93 = v14;
          *(_DWORD *)uint64_t v13 = 136446210;
          uint64_t v15 = sub_251381230();
          *(void *)(v0 + 672) = sub_2512F6F6C(v15, v16, (uint64_t *)&v93);
          unint64_t v10 = 0x269B31000uLL;
          sub_251380DB0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2512DB000, (os_log_t)v5, v12, "[%{public}s] On demand tones should have 4 parameters: frequency, soundLevel, channel(L:0, R:1) and toneDuration. Ex: '(1000, 50, 0, 1)' '(2000, 40, 1, 1)'", v13, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x25339CCC0](v14, -1, -1);
          MEMORY[0x25339CCC0](v13, -1, -1);
        }

        long long v9 = &unk_2702287B0;
      }
      uint64_t v17 = *(unsigned __int8 *)(v0 + 720);
      if (v17 == 2)
      {
LABEL_39:
        unint64_t v63 = v9[2];
        if (v63)
        {
          if (v63 != 1)
          {
            if (v63 >= 3)
            {
              if (v63 != 3)
              {
                uint64_t v1 = v9[4];
                uint64_t v2 = v9[5];
                uint64_t v5 = v9[6];
                uint64_t v3 = v9[7];
                swift_bridgeObjectRelease();
                if (*(void *)(v10 + 1696) == -1)
                {
LABEL_44:
                  uint64_t v64 = v5 & 0x7FFFFFFFFFFFFFFFLL;
                  uint64_t v65 = sub_2513806D0();
                  __swift_project_value_buffer(v65, (uint64_t)qword_269B31B88);
                  uint64_t v66 = sub_2513806B0();
                  os_log_type_t v67 = sub_251380C40();
                  if (os_log_type_enabled(v66, v67))
                  {
                    BOOL v89 = v64 != 0;
                    uint64_t v91 = v64;
                    uint64_t v68 = swift_slowAlloc();
                    uint64_t v69 = swift_slowAlloc();
                    *(void *)&long long v93 = v69;
                    *(_DWORD *)uint64_t v68 = 136447234;
                    uint64_t v70 = sub_251381230();
                    *(void *)(v0 + 536) = sub_2512F6F6C(v70, v71, (uint64_t *)&v93);
                    sub_251380DB0();
                    swift_bridgeObjectRelease();
                    *(_WORD *)(v68 + 12) = 2048;
                    *(void *)(v0 + 576) = v1;
                    sub_251380DB0();
                    *(_WORD *)(v68 + 22) = 2048;
                    *(void *)(v0 + 584) = v2;
                    sub_251380DB0();
                    *(_WORD *)(v68 + 32) = 2048;
                    *(void *)(v0 + 552) = v3;
                    sub_251380DB0();
                    *(_WORD *)(v68 + 42) = 2048;
                    *(void *)(v0 + 544) = v89;
                    sub_251380DB0();
                    _os_log_impl(&dword_2512DB000, v66, v67, "[%{public}s] Continue test, next on demand tone freq %f, level %f, duration %f, ch %ld", (uint8_t *)v68, 0x34u);
                    swift_arrayDestroy();
                    MEMORY[0x25339CCC0](v69, -1, -1);
                    uint64_t v72 = v68;
                    uint64_t v64 = v91;
                    MEMORY[0x25339CCC0](v72, -1, -1);
                  }

                  uint64_t v73 = *(void *)(v0 + 688);
                  uint64_t v74 = *(void *)(v0 + 680);
                  swift_beginAccess();
                  __swift_project_boxed_opaque_existential_1((void *)(v73 + 16), *(void *)(v73 + 40));
                  sub_2512DF094((uint64_t)&v93);
                  uint64_t v75 = v97;
                  *(void *)(v0 + 16) = v1;
                  *(void *)(v0 + 24) = v2;
                  *(unsigned char *)(v0 + 32) = v64 != 0;
                  *(void *)(v0 + 40) = v3;
                  *(_DWORD *)(v0 + 48) = 0;
                  long long v76 = v94;
                  *(_OWORD *)(v0 + 56) = v93;
                  *(_OWORD *)(v0 + 72) = v76;
                  long long v77 = v96;
                  *(_OWORD *)(v0 + 88) = v95;
                  *(_OWORD *)(v0 + 104) = v77;
                  *(void *)(v0 + 120) = v75;
                  sub_251378C68(v0 + 16);
                  sub_251378C7C(v0 + 16, v74);
                  long long v78 = *(void (**)(void))(v0 + 8);
                  v78();
                  return;
                }
LABEL_54:
                swift_once();
                goto LABEL_44;
              }
LABEL_53:
              __break(1u);
              goto LABEL_54;
            }
LABEL_52:
            __break(1u);
            goto LABEL_53;
          }
LABEL_51:
          __break(1u);
          goto LABEL_52;
        }
LABEL_50:
        __break(1u);
        goto LABEL_51;
      }
      uint64_t v87 = v17 & 1;
      unsigned int v90 = *(unsigned char *)(v0 + 401) & 1;
      if (qword_269B316F8 != -1) {
        swift_once();
      }
      if (byte_269B36233 == 1)
      {
        if (qword_269B316A0 != -1) {
          swift_once();
        }
        uint64_t v18 = sub_2513806D0();
        __swift_project_value_buffer(v18, (uint64_t)qword_269B31B88);
        uint64_t v19 = sub_2513806B0();
        os_log_type_t v20 = sub_251380C40();
        if (!os_log_type_enabled(v19, v20)) {
          goto LABEL_29;
        }
        uint64_t v82 = *(void *)(v0 + 728);
        uint64_t v79 = *(void *)(v0 + 704);
        uint64_t v80 = *(void *)(v0 + 712);
        uint64_t v21 = swift_slowAlloc();
        uint64_t v85 = swift_slowAlloc();
        *(void *)&long long v93 = v85;
        *(_DWORD *)uint64_t v21 = 136447490;
        uint64_t v22 = sub_251381230();
        *(void *)(v0 + 632) = sub_2512F6F6C(v22, v23, (uint64_t *)&v93);
        sub_251380DB0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v21 + 12) = 2048;
        *(void *)(v0 + 640) = v79;
        sub_251380DB0();
        *(_WORD *)(v21 + 22) = 2048;
        *(void *)(v0 + 648) = v80;
        sub_251380DB0();
        *(_WORD *)(v21 + 32) = 2048;
        *(void *)(v0 + 656) = v82;
        sub_251380DB0();
        *(_WORD *)(v21 + 42) = 2048;
        *(void *)(v0 + 664) = v87;
        sub_251380DB0();
        *(_WORD *)(v21 + 52) = 1024;
        *(_DWORD *)(v0 + 404) = v90;
        sub_251380DB0();
        _os_log_impl(&dword_2512DB000, v19, v20, "[%{public}s] Current Tone freq %f lv %f dur %f ch %ld Response %{BOOL}d", (uint8_t *)v21, 0x3Au);
        swift_arrayDestroy();
        MEMORY[0x25339CCC0](v85, -1, -1);
        uint64_t v24 = v21;
      }
      else
      {
        if (qword_269B316A0 != -1) {
          swift_once();
        }
        uint64_t v34 = sub_2513806D0();
        __swift_project_value_buffer(v34, (uint64_t)qword_269B31B88);
        uint64_t v19 = sub_2513806B0();
        os_log_type_t v35 = sub_251380C40();
        if (!os_log_type_enabled(v19, v35)) {
          goto LABEL_29;
        }
        uint64_t v84 = *(void *)(v0 + 728);
        uint64_t v83 = *(void *)(v0 + 712);
        uint64_t v81 = *(void *)(v0 + 704);
        uint64_t v36 = swift_slowAlloc();
        uint64_t v37 = swift_slowAlloc();
        *(void *)&long long v93 = v37;
        *(_DWORD *)uint64_t v36 = 136447234;
        uint64_t v38 = sub_251381230();
        *(void *)(v0 + 592) = sub_2512F6F6C(v38, v39, (uint64_t *)&v93);
        sub_251380DB0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v36 + 12) = 2048;
        *(void *)(v0 + 600) = v81;
        sub_251380DB0();
        *(_WORD *)(v36 + 22) = 2048;
        *(void *)(v0 + 608) = v83;
        sub_251380DB0();
        *(_WORD *)(v36 + 32) = 2048;
        *(void *)(v0 + 616) = v84;
        sub_251380DB0();
        *(_WORD *)(v36 + 42) = 2048;
        *(void *)(v0 + 624) = v87;
        sub_251380DB0();
        _os_log_impl(&dword_2512DB000, v19, v35, "[%{public}s] Current Tone freq %f lv %f dur %f ch %ld", (uint8_t *)v36, 0x34u);
        swift_arrayDestroy();
        MEMORY[0x25339CCC0](v37, -1, -1);
        uint64_t v24 = v36;
      }
      MEMORY[0x25339CCC0](v24, -1, -1);
LABEL_29:

      uint64_t v40 = *(void *)(v0 + 688) + 56;
      swift_beginAccess();
      sub_251377F74(v40, v0 + 328);
      if (*(void *)(v0 + 352))
      {
        uint64_t v41 = *(void *)(v0 + 728);
        uint64_t v42 = *(void *)(v0 + 712);
        uint64_t v43 = *(void *)(v0 + 704);
        sub_25137803C(v0 + 328, v0 + 288);
        sub_251377FDC(v0 + 328);
        uint64_t v44 = *(void *)(v0 + 312);
        uint64_t v45 = *(void *)(v0 + 320);
        __swift_project_boxed_opaque_existential_1((void *)(v0 + 288), v44);
        *(void *)&long long v93 = v43;
        *((void *)&v93 + 1) = v42;
        LOBYTE(v94) = v87;
        *((void *)&v94 + 1) = v41;
        LOBYTE(v95) = v90;
        char v46 = (*(uint64_t (**)(long long *, uint64_t, uint64_t))(v45 + 8))(&v93, v44, v45);
        id v48 = v47;
        __swift_destroy_boxed_opaque_existential_0(v0 + 288);
LABEL_33:
        if (qword_269B316A0 != -1) {
          swift_once();
        }
        uint64_t v53 = sub_2513806D0();
        __swift_project_value_buffer(v53, (uint64_t)qword_269B31B88);
        long long v54 = sub_2513806B0();
        os_log_type_t v55 = sub_251380C40();
        if (os_log_type_enabled(v54, v55))
        {
          id v86 = v48;
          uint64_t v56 = swift_slowAlloc();
          uint64_t v88 = swift_slowAlloc();
          *(void *)&long long v93 = v88;
          *(_DWORD *)uint64_t v56 = 136446722;
          uint64_t v57 = sub_251381230();
          *(void *)(v0 + 560) = sub_2512F6F6C(v57, v58, (uint64_t *)&v93);
          sub_251380DB0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v56 + 12) = 1024;
          *(_DWORD *)(v0 + 744) = v46 & 1;
          sub_251380DB0();
          *(_WORD *)(v56 + 18) = 2048;
          *(void *)(v0 + 568) = v86;
          sub_251380DB0();
          _os_log_impl(&dword_2512DB000, v54, v55, "[%{public}s] Current Tone interferenceFlag %{BOOL}d, repeat the previous tone for up to %ld times", (uint8_t *)v56, 0x1Cu);
          swift_arrayDestroy();
          unint64_t v10 = 0x269B31000;
          MEMORY[0x25339CCC0](v88, -1, -1);
          MEMORY[0x25339CCC0](v56, -1, -1);
        }
        else
        {

          unint64_t v10 = 0x269B31000uLL;
        }
        uint64_t v59 = *(void *)(v0 + 688);
        uint64_t v60 = v59 + 16;
        swift_beginAccess();
        uint64_t v61 = *(void *)(v59 + 40);
        uint64_t v62 = *(void *)(v59 + 48);
        uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1(v60, v61);
        (*(void (**)(void, void, uint64_t, uint64_t))(v62 + 80))(v90, v46 & 1, v61, v62);
        swift_endAccess();
        goto LABEL_39;
      }
      sub_251377FDC(v0 + 328);
      id v49 = objc_allocWithZone(MEMORY[0x263EFFA40]);
      long long v50 = (void *)sub_251380840();
      id v51 = objc_msgSend(v49, sel_initWithSuiteName_, v50);

      if (v51)
      {
        long long v52 = (void *)sub_251380840();
        id v48 = objc_msgSend(v51, sel_integerForKey_, v52);

        char v46 = 0;
        goto LABEL_33;
      }
LABEL_56:
      __break(1u);
      return;
    }
    ((void (*)(uint64_t, void))v7)(v0 + 408, 0);
  }
  id v25 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v26 = (void *)sub_251380840();
  id v27 = objc_msgSend(v25, sel_initWithSuiteName_, v26);

  if (!v27)
  {
    __break(1u);
    goto LABEL_56;
  }
  char v28 = *(unsigned char *)(v0 + 401);
  uint64_t v29 = *(void *)(v0 + 728);
  uint64_t v30 = *(void *)(v0 + 720);
  long long v92 = *(_OWORD *)(v0 + 704);
  uint64_t v31 = sub_251308574();

  *(void *)uint64_t v4 = v31;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v0 + 368) = v92;
  *(void *)(v0 + 384) = v30;
  *(void *)(v0 + 392) = v29;
  *(unsigned char *)(v0 + 400) = v28;
  uint64_t v32 = (void *)swift_task_alloc();
  *(void *)(v0 + 736) = v32;
  *uint64_t v32 = v0;
  v32[1] = sub_251377CD4;
  uint64_t v33 = *(void *)(v0 + 680);
  sub_2513725A0(v33, v0 + 368);
}

uint64_t sub_251377CD4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t HTHearingTestSession.deinit()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  sub_251377FDC(v0 + 56);
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t HTHearingTestSession.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  sub_251377FDC(v0 + 56);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 160, 7);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_251377EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B32550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_251377F18(uint64_t a1)
{
  return sub_251370C18(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

unint64_t sub_251377F20()
{
  unint64_t result = qword_269B32560;
  if (!qword_269B32560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_269B32560);
  }
  return result;
}

uint64_t sub_251377F74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B32550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_251377FDC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B32550);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25137803C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2513780A0(uint64_t a1)
{
  return sub_251373514(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2513780A8(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_251378104()
{
  unint64_t result = qword_269B32588[0];
  if (!qword_269B32588[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269B32588);
  }
  return result;
}

uint64_t type metadata accessor for HTHearingTestSession()
{
  return self;
}

uint64_t method lookup function for HTHearingTestSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HTHearingTestSession);
}

uint64_t dispatch thunk of HTHearingTestSession.__allocating_init(on:with:frequencies:initialLevel:minLevel:maxLevel:)()
{
  return (*(uint64_t (**)(void))(v0 + 400))();
}

uint64_t dispatch thunk of HTHearingTestSession.__allocating_init(on:with:statusManager:frequencies:initialLevel:minLevel:maxLevel:)()
{
  return (*(uint64_t (**)(void))(v0 + 408))();
}

uint64_t dispatch thunk of HTHearingTestSession.hearingTestStatus(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 416) + **(int **)(*(void *)v2 + 416));
  long long v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_251308058;
  return v8(a1, a2);
}

uint64_t dispatch thunk of HTHearingTestSession.hearingTestStatusWithAverageNoise(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 424) + **(int **)(*(void *)v2 + 424));
  long long v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_251306C34;
  return v8(a1, a2);
}

uint64_t dispatch thunk of HTHearingTestSession.hearingTestStatus(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 432) + **(int **)(*(void *)v2 + 432));
  long long v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_251308058;
  return v8(a1, a2);
}

uint64_t dispatch thunk of HTHearingTestSession.scheduledPlayback(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of HTHearingTestSession.beginEvaluation(channel:)(uint64_t a1)
{
  long long v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 448) + **(int **)(*(void *)v1 + 448));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_251308058;
  return v6(a1);
}

uint64_t dispatch thunk of HTHearingTestSession.endEvaluation(channel:)(uint64_t a1)
{
  long long v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 456) + **(int **)(*(void *)v1 + 456));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_251308058;
  return v6(a1);
}

uint64_t dispatch thunk of HTHearingTestSession.pauseEvaluation(channel:)(uint64_t a1)
{
  long long v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 464) + **(int **)(*(void *)v1 + 464));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_251308058;
  return v6(a1);
}

uint64_t dispatch thunk of HTHearingTestSession.resumeEvaluation(channel:)(uint64_t a1)
{
  long long v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 472) + **(int **)(*(void *)v1 + 472));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_251308058;
  return v6(a1);
}

uint64_t sub_251378960(uint64_t a1)
{
  return a1;
}

char *sub_251378998(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  unint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v9 <= *((void *)v4 + 3) >> 1)
  {
    if (!v8) {
      goto LABEL_21;
    }
  }
  else
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t result = (char *)sub_2512EB2F0(result, v11, 1, v4);
    uint64_t v4 = result;
    if (!v8) {
      goto LABEL_21;
    }
  }
  uint64_t v12 = *((void *)v4 + 2);
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_27;
  }
  if ((v14 & 0x8000000000000000) == 0)
  {
    unint64_t result = &v4[8 * a1 + 32];
    uint64_t v15 = &v4[8 * a2 + 32];
    if (a1 != a2 || result >= &v15[8 * v14]) {
      unint64_t result = (char *)memmove(result, v15, 8 * v14);
    }
    uint64_t v16 = *((void *)v4 + 2);
    BOOL v13 = __OFADD__(v16, v8);
    uint64_t v17 = v16 + v8;
    if (!v13)
    {
      *((void *)v4 + 2) = v17;
LABEL_21:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  unint64_t result = (char *)sub_251380FD0();
  __break(1u);
  return result;
}

uint64_t sub_251378AF4(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_2512EBDF8(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B31A10);
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v13 = v4[2];
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14) {
    goto LABEL_26;
  }
  if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v16 = (char *)&v4[a2 + 4];
    if (a1 != a2 || &v4[a1 + 4] >= (void *)&v16[8 * v15]) {
      uint64_t result = (uint64_t)memmove(&v4[a1 + 4], v16, 8 * v15);
    }
    uint64_t v17 = v4[2];
    BOOL v14 = __OFADD__(v17, v8);
    uint64_t v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(void *)uint64_t v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = sub_251380FD0();
  __break(1u);
  return result;
}

uint64_t sub_251378C68(uint64_t result)
{
  *(void *)(result + 16) = *(void *)(result + 16) & 0x1FFLL | 0x8000000000000000;
  return result;
}

uint64_t sub_251378C7C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_251378CD8()
{
  return objectdestroyTm_0(&qword_269B325F0);
}

uint64_t sub_251378CE4(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B325F0);
  uint64_t v3 = *(void *)(v1 + 88);
  return sub_251373928(a1, (uint64_t *)(v1 + 16), v3);
}

uint64_t sub_251378D8C(uint64_t result)
{
  *(void *)(result + 16) &= 0x1FFuLL;
  return result;
}

uint64_t sub_251378D9C(uint64_t a1)
{
  return a1;
}

uint64_t sub_251378E00()
{
  return objectdestroyTm_0(&qword_269B325F8);
}

uint64_t objectdestroyTm_0(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 96) & ~v4;
  uint64_t v6 = v4 | 7;
  unint64_t v7 = ((*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return MEMORY[0x270FA0238](v1, v7, v6);
}

uint64_t sub_251378F08(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B325F8);
  uint64_t v3 = *(void *)(v1 + 88);
  return sub_25137102C(a1, (uint64_t *)(v1 + 16), v3);
}

uint64_t sub_251378FB0(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 232);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    *(void *)(a1 + 224),
    v4);
  return a1;
}

uint64_t sub_25137903C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for CapturedPort()
{
  return self;
}

uint64_t sub_2513790A0()
{
  id v1 = objc_msgSend(v0, sel_currentRoute);
  id v2 = objc_msgSend(v1, sel_outputs);
  sub_2512F54B4(0, &qword_269B31D60);
  unint64_t v3 = sub_251380970();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_251380F90();
    uint64_t v4 = result;
    id v25 = v1;
    if (result) {
      goto LABEL_3;
    }
LABEL_23:
    unint64_t v7 = (void *)MEMORY[0x263F8EE78];
LABEL_24:
    swift_bridgeObjectRelease_n();
    uint64_t v24 = sub_2512F467C((uint64_t)v7);

    swift_bridgeObjectRelease();
    return v24;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  id v25 = v1;
  if (!v4) {
    goto LABEL_23;
  }
LABEL_3:
  if (v4 >= 1)
  {
    uint64_t v6 = 0;
    unint64_t v7 = (void *)MEMORY[0x263F8EE78];
    while (1)
    {
      id v8 = (v3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x25339C280](v6, v3) : *(id *)(v3 + 8 * v6 + 32);
      int64_t v9 = v8;
      id v10 = objc_msgSend(v8, sel_portType, v25);
      uint64_t v11 = sub_251380850();
      uint64_t v13 = v12;
      if (v11 == sub_251380850() && v13 == v14) {
        break;
      }
      char v16 = sub_2513810E0();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v16) {
        goto LABEL_17;
      }

LABEL_6:
      if (v4 == ++v6) {
        goto LABEL_24;
      }
    }

    swift_bridgeObjectRelease_n();
LABEL_17:
    id v17 = objc_msgSend(v9, sel_portName);
    uint64_t v18 = sub_251380850();
    uint64_t v20 = v19;

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v7 = sub_2512EBF28(0, v7[2] + 1, 1, v7);
    }
    unint64_t v22 = v7[2];
    unint64_t v21 = v7[3];
    if (v22 >= v21 >> 1) {
      unint64_t v7 = sub_2512EBF28((void *)(v21 > 1), v22 + 1, 1, v7);
    }
    v7[2] = v22 + 1;
    unint64_t v23 = &v7[2 * v22];
    v23[4] = v18;
    v23[5] = v20;
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_251379348()
{
  id v1 = objc_msgSend(v0, sel_currentRoute);
  id v2 = objc_msgSend(v1, sel_outputs);
  sub_2512F54B4(0, &qword_269B31D60);
  unint64_t v3 = sub_251380970();

  uint64_t v27 = MEMORY[0x263F8EE78];
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_251380F90();
    uint64_t v4 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_22:
    swift_bridgeObjectRelease();
    uint64_t v25 = MEMORY[0x263F8EE78];
LABEL_23:
    swift_bridgeObjectRelease();

    return v25;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v4) {
    goto LABEL_22;
  }
LABEL_3:
  if (v4 >= 1)
  {
    uint64_t v6 = 0;
    id v26 = v1;
    while (1)
    {
      id v7 = (v3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x25339C280](v6, v3) : *(id *)(v3 + 8 * v6 + 32);
      id v8 = v7;
      id v9 = objc_msgSend(v7, sel_portType);
      uint64_t v10 = sub_251380850();
      uint64_t v12 = v11;
      if (v10 == sub_251380850() && v12 == v13) {
        break;
      }
      char v15 = sub_2513810E0();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v15) {
        goto LABEL_17;
      }

LABEL_6:
      if (v4 == ++v6)
      {
        swift_bridgeObjectRelease();
        uint64_t v25 = v27;
        id v1 = v26;
        goto LABEL_23;
      }
    }

    swift_bridgeObjectRelease_n();
LABEL_17:
    id v16 = objc_msgSend(v8, sel_UID);
    uint64_t v17 = sub_251380850();
    uint64_t v19 = v18;

    id v20 = objc_msgSend(v8, sel_portName);
    uint64_t v21 = sub_251380850();
    uint64_t v23 = v22;

    type metadata accessor for CapturedPort();
    uint64_t v24 = (void *)swift_allocObject();
    v24[2] = v17;
    v24[3] = v19;
    v24[4] = v21;
    v24[5] = v23;

    MEMORY[0x25339BD20]();
    if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2513809A0();
    }
    sub_251380A00();
    sub_251380990();
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_251379620()
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v2 = self;
  unint64_t v3 = v0;
  id v4 = objc_msgSend(v2, sel_sharedInstance);
  uint64_t v5 = sub_251379348();

  *(void *)&v3[OBJC_IVAR____TtC11HearingTestP33_E1CF8936D0F3BEC6A29D15D29986B99914CapturedDevice_capturedPorts] = v5;
  v36.receiver = v3;
  v36.super_class = ObjectType;
  id v6 = objc_msgSendSuper2(&v36, sel_init);
  uint64_t v7 = qword_269B316A0;
  id v8 = v6;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_2513806D0();
  __swift_project_value_buffer(v9, (uint64_t)qword_269B31B88);
  uint64_t v10 = (char *)v8;
  uint64_t v11 = sub_2513806B0();
  os_log_type_t v12 = sub_251380C10();
  if (!os_log_type_enabled(v11, v12))
  {

LABEL_19:
    return (uint64_t)v10;
  }
  uint64_t v13 = swift_slowAlloc();
  uint64_t v14 = swift_slowAlloc();
  uint64_t v35 = v14;
  *(_DWORD *)uint64_t v13 = 136446466;
  uint64_t v15 = sub_251381230();
  sub_2512F6F6C(v15, v16, &v35);
  sub_251380DB0();
  swift_bridgeObjectRelease();
  *(_WORD *)(v13 + 12) = 2080;
  unint64_t v17 = *(void *)&v10[OBJC_IVAR____TtC11HearingTestP33_E1CF8936D0F3BEC6A29D15D29986B99914CapturedDevice_capturedPorts];
  if (!(v17 >> 62))
  {
    uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v18) {
      goto LABEL_6;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    uint64_t v21 = MEMORY[0x263F8EE78];
LABEL_18:
    sub_2512F467C(v21);
    swift_bridgeObjectRelease();
    uint64_t v28 = sub_251380B20();
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
    sub_2512F6F6C(v28, v30, &v35);
    sub_251380DB0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2512DB000, v11, v12, "[%{public}s] capture device ports %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25339CCC0](v14, -1, -1);
    MEMORY[0x25339CCC0](v13, -1, -1);

    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_251380F90();
  if (!v18) {
    goto LABEL_17;
  }
LABEL_6:
  uint64_t v34 = MEMORY[0x263F8EE78];
  uint64_t result = sub_2512FAD28(0, v18 & ~(v18 >> 63), 0);
  if ((v18 & 0x8000000000000000) == 0)
  {
    uint64_t v31 = v14;
    uint64_t v32 = v13;
    uint64_t v33 = v11;
    uint64_t v20 = 0;
    uint64_t v21 = v34;
    do
    {
      if ((v17 & 0xC000000000000001) != 0)
      {
        uint64_t v22 = MEMORY[0x25339C280](v20, v17);
      }
      else
      {
        uint64_t v22 = *(void *)(v17 + 8 * v20 + 32);
        swift_retain();
      }
      uint64_t v23 = *(void *)(v22 + 32);
      uint64_t v24 = *(void *)(v22 + 40);
      swift_bridgeObjectRetain();
      swift_release();
      unint64_t v26 = *(void *)(v34 + 16);
      unint64_t v25 = *(void *)(v34 + 24);
      if (v26 >= v25 >> 1) {
        sub_2512FAD28(v25 > 1, v26 + 1, 1);
      }
      ++v20;
      *(void *)(v34 + 16) = v26 + 1;
      unint64_t v27 = v34 + 16 * v26;
      *(void *)(v27 + 32) = v23;
      *(void *)(v27 + 40) = v24;
    }
    while (v18 != v20);
    swift_bridgeObjectRelease();
    uint64_t v13 = v32;
    uint64_t v11 = v33;
    uint64_t v14 = v31;
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_2513799F8()
{
  unint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC11HearingTestP33_E1CF8936D0F3BEC6A29D15D29986B99914CapturedDevice_capturedPorts);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    uint64_t v4 = MEMORY[0x263F8EE78];
LABEL_17:
    uint64_t v19 = sub_2512F467C(v4);
    swift_bridgeObjectRelease();
    return v19;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_251380F90();
  if (!v2) {
    goto LABEL_16;
  }
LABEL_3:
  uint64_t v20 = MEMORY[0x263F8EE78];
  uint64_t result = sub_2512FAD28(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = v20;
    if ((v1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      do
      {
        uint64_t v6 = MEMORY[0x25339C280](v5, v1);
        uint64_t v8 = *(void *)(v6 + 32);
        uint64_t v7 = *(void *)(v6 + 40);
        swift_bridgeObjectRetain();
        swift_unknownObjectRelease();
        unint64_t v10 = *(void *)(v20 + 16);
        unint64_t v9 = *(void *)(v20 + 24);
        if (v10 >= v9 >> 1) {
          sub_2512FAD28(v9 > 1, v10 + 1, 1);
        }
        ++v5;
        *(void *)(v20 + 16) = v10 + 1;
        unint64_t v11 = v20 + 16 * v10;
        *(void *)(v11 + 32) = v8;
        *(void *)(v11 + 40) = v7;
      }
      while (v2 != v5);
    }
    else
    {
      uint64_t v12 = 0;
      do
      {
        uint64_t v13 = *(void *)(v1 + 8 * v12 + 32);
        uint64_t v15 = *(void *)(v13 + 32);
        uint64_t v14 = *(void *)(v13 + 40);
        unint64_t v16 = *(void *)(v20 + 16);
        unint64_t v17 = *(void *)(v20 + 24);
        swift_bridgeObjectRetain();
        if (v16 >= v17 >> 1) {
          sub_2512FAD28(v17 > 1, v16 + 1, 1);
        }
        ++v12;
        *(void *)(v20 + 16) = v16 + 1;
        unint64_t v18 = v20 + 16 * v16;
        *(void *)(v18 + 32) = v15;
        *(void *)(v18 + 40) = v14;
      }
      while (v2 != v12);
    }
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

id sub_251379BF4()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CapturedDevice()
{
  return self;
}

id sub_251379C60()
{
  type metadata accessor for HTAudioRouteRequirementManager();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_269B32608 = (uint64_t)result;
  return result;
}

id sub_251379CB4(uint64_t a1, uint64_t a2)
{
  ObjectType = (objc_class *)swift_getObjectType();
  v2[OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_isInterrupted] = 0;
  *(void *)&v2[OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_capturedDevice] = 0;
  *(void *)&v2[OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_player] = 0;
  uint64_t v6 = &v2[OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_externalInterruptionHandler];
  void *v6 = a1;
  v6[1] = a2;
  v21.receiver = v2;
  v21.super_class = ObjectType;
  swift_retain();
  id v7 = objc_msgSendSuper2(&v21, sel_init);
  uint64_t v8 = qword_269B316A0;
  id v9 = v7;
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_2513806D0();
  __swift_project_value_buffer(v10, (uint64_t)qword_269B31B88);
  unint64_t v11 = sub_2513806B0();
  os_log_type_t v12 = sub_251380C10();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v20 = v14;
    *(_DWORD *)uint64_t v13 = 136446210;
    uint64_t v15 = sub_251381230();
    sub_2512F6F6C(v15, v16, &v20);
    sub_251380DB0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2512DB000, v11, v12, "[%{public}s] init", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25339CCC0](v14, -1, -1);
    MEMORY[0x25339CCC0](v13, -1, -1);
  }

  sub_25137A0F0();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v9;
  id v18 = v9;
  sub_25137A70C((uint64_t)sub_25137FA5C, v17);
  swift_release();

  swift_release();
  return v18;
}

void sub_25137A0F0()
{
  swift_getObjectType();
  id v1 = objc_msgSend(self, sel_defaultCenter);
  id v9 = objc_msgSend(self, sel_sharedInstance);
  objc_msgSend(v1, sel_addObserver_selector_name_object_, v0, sel_audioSessionRouteChangeHander_, *MEMORY[0x263EF9248]);
  if (qword_269B316A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2513806D0();
  __swift_project_value_buffer(v2, (uint64_t)qword_269B31B88);
  unint64_t v3 = sub_2513806B0();
  os_log_type_t v4 = sub_251380C10();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v10 = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v7 = sub_251381230();
    sub_2512F6F6C(v7, v8, &v10);
    sub_251380DB0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2512DB000, v3, v4, "[%{public}s] setup notifications", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25339CCC0](v6, -1, -1);
    MEMORY[0x25339CCC0](v5, -1, -1);
  }
  else
  {
  }
}

uint64_t sub_25137A330(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CapturedDevice()), sel_init);
  unint64_t v3 = *(void **)(a1 + OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_capturedDevice);
  *(void *)(a1 + OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_capturedDevice) = v2;

  return sub_25137A380();
}

uint64_t sub_25137A380()
{
  uint64_t v1 = v0;
  unint64_t v2 = 0xD000000000000011;
  swift_getObjectType();
  unint64_t v3 = *(char **)(v0 + OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_capturedDevice);
  if (v3)
  {
    unint64_t v4 = *(void *)&v3[OBJC_IVAR____TtC11HearingTestP33_E1CF8936D0F3BEC6A29D15D29986B99914CapturedDevice_capturedPorts];
    if (v4 >> 62)
    {
      id v18 = v3;
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_251380F90();

      swift_bridgeObjectRelease();
      if (v5) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v5)
      {
LABEL_4:
        sub_251380E90();
        swift_bridgeObjectRelease();
        v21[0] = 0x6465727574706143;
        v21[1] = 0xE900000000000020;
        sub_2513810B0();
        sub_2513808A0();
        swift_bridgeObjectRelease();
        sub_2513808A0();
        int v6 = 0;
        unint64_t v2 = 0x6465727574706143;
        unint64_t v7 = 0xE900000000000020;
        goto LABEL_7;
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  unint64_t v7 = 0x8000000251387050;
  int v6 = 1;
LABEL_7:
  if (qword_269B316A0 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_2513806D0();
  __swift_project_value_buffer(v8, (uint64_t)qword_269B31B88);
  swift_bridgeObjectRetain();
  id v9 = sub_2513806B0();
  os_log_type_t v10 = sub_251380C10();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v19 = v2;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    v21[0] = v20;
    *(_DWORD *)uint64_t v11 = 136446466;
    uint64_t v12 = sub_251381230();
    sub_2512F6F6C(v12, v13, v21);
    sub_251380DB0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_2512F6F6C(v19, v7, v21);
    sub_251380DB0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2512DB000, v9, v10, "[%{public}s] update interruptions based on capture count - status: %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25339CCC0](v20, -1, -1);
    MEMORY[0x25339CCC0](v11, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(unsigned char *)(v1 + OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_isInterrupted) = v5 > 0;
  if (v6)
  {
    uint64_t v14 = &unk_270230E68;
    uint64_t v15 = &block_descriptor_13_1;
    unint64_t v16 = sub_25137FA1C;
  }
  else
  {
    uint64_t v14 = &unk_270230E18;
    uint64_t v15 = &block_descriptor_5;
    unint64_t v16 = sub_25137DC6C;
  }
  return sub_25137B4A8((uint64_t)v14, (uint64_t)v16, (uint64_t)v15);
}

uint64_t sub_25137A70C(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v24 = a1;
  uint64_t v25 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = sub_2513806F0();
  uint64_t v28 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  int v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_251380730();
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v27 = v7;
  MEMORY[0x270FA5388](v7);
  id v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_251380700();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512F54B4(0, (unint64_t *)&unk_269B31AA0);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F8F060], v10);
  uint64_t v14 = (void *)sub_251380CC0();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v16 = v24;
  uint64_t v17 = v25;
  v15[2] = v3;
  v15[3] = v16;
  uint64_t v18 = ObjectType;
  v15[4] = v17;
  v15[5] = v18;
  aBlock[4] = sub_25137FAAC;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2512E07AC;
  aBlock[3] = &block_descriptor_28;
  uint64_t v19 = _Block_copy(aBlock);
  id v20 = v3;
  swift_retain();
  sub_251380710();
  aBlock[7] = MEMORY[0x263F8EE78];
  sub_25137DC8C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B31B00);
  sub_25137DCE4();
  sub_251380E10();
  MEMORY[0x25339C060](0, v9, v6, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v27);
  return swift_release();
}

uint64_t sub_25137AA7C()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v1 = sub_2513806F0();
  uint64_t v21 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_251380730();
  uint64_t v19 = *(void *)(v4 - 8);
  uint64_t v20 = v4;
  MEMORY[0x270FA5388](v4);
  int v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_251380700();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512F54B4(0, (unint64_t *)&unk_269B31AA0);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F8F060], v7);
  uint64_t v11 = (void *)sub_251380CC0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = ObjectType;
  *(void *)(v12 + 16) = v0;
  *(void *)(v12 + 24) = v13;
  aBlock[4] = sub_25137FA64;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2512E07AC;
  aBlock[3] = &block_descriptor_22;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = v0;
  sub_251380710();
  aBlock[7] = MEMORY[0x263F8EE78];
  sub_25137DC8C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B31B00);
  sub_25137DCE4();
  sub_251380E10();
  MEMORY[0x25339C060](0, v6, v3, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v6, v20);
  return swift_release();
}

void sub_25137ADD8()
{
  swift_getObjectType();
  id v1 = objc_msgSend(self, sel_defaultCenter);
  id v9 = objc_msgSend(self, sel_sharedInstance);
  objc_msgSend(v1, sel_removeObserver_name_object_, v0, *MEMORY[0x263EF9248]);
  if (qword_269B316A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2513806D0();
  __swift_project_value_buffer(v2, (uint64_t)qword_269B31B88);
  unint64_t v3 = sub_2513806B0();
  os_log_type_t v4 = sub_251380C10();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v10 = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v7 = sub_251381230();
    sub_2512F6F6C(v7, v8, &v10);
    sub_251380DB0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2512DB000, v3, v4, "[%{public}s] cleanup notifications", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25339CCC0](v6, -1, -1);
    MEMORY[0x25339CCC0](v5, -1, -1);
  }
  else
  {
  }
}

void sub_25137B010()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_capturedDevice;
  unint64_t v3 = *(char **)(v0 + OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_capturedDevice);
  if (v3)
  {
    unint64_t v4 = *(void *)&v3[OBJC_IVAR____TtC11HearingTestP33_E1CF8936D0F3BEC6A29D15D29986B99914CapturedDevice_capturedPorts];
    if (v4 >> 62)
    {
      uint64_t v19 = v3;
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_251380F90();

      swift_bridgeObjectRelease();
      if (v20) {
        return;
      }
    }
    else if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      return;
    }
  }
  if (qword_269B316A0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2513806D0();
  __swift_project_value_buffer(v5, (uint64_t)qword_269B31B88);
  uint64_t v6 = sub_2513806B0();
  os_log_type_t v7 = sub_251380C10();
  if (os_log_type_enabled(v6, v7))
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v9 = v28;
    *(_DWORD *)unint64_t v8 = 136446210;
    uint64_t v10 = sub_251381230();
    uint64_t v30 = sub_2512F6F6C(v10, v11, &v28);
    sub_251380DB0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2512DB000, v6, v7, "[%{public}s] no current captured output ports - attempting to capture session BT A2DP output ports", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25339CCC0](v9, -1, -1);
    MEMORY[0x25339CCC0](v8, -1, -1);
  }

  uint64_t v12 = 0xD000000000000011;
  id v13 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CapturedDevice()), sel_init);
  uint64_t v14 = *(void **)(v1 + v2);
  *(void *)(v1 + v2) = v13;

  id v15 = *(char **)(v1 + v2);
  if (v15)
  {
    unint64_t v16 = *(void *)&v15[OBJC_IVAR____TtC11HearingTestP33_E1CF8936D0F3BEC6A29D15D29986B99914CapturedDevice_capturedPorts];
    if (v16 >> 62)
    {
      uint64_t v21 = v15;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_251380F90();

      swift_bridgeObjectRelease();
      if (v17 >= 1) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v17 >= 1)
      {
LABEL_11:
        uint64_t v28 = 0;
        unint64_t v29 = 0xE000000000000000;
        sub_251380E90();
        swift_bridgeObjectRelease();
        uint64_t v28 = 0x6465727574706143;
        unint64_t v29 = 0xE900000000000020;
        uint64_t v30 = v17;
        sub_2513810B0();
        sub_2513808A0();
        swift_bridgeObjectRelease();
        sub_2513808A0();
        uint64_t v12 = v28;
        unint64_t v18 = v29;
        goto LABEL_16;
      }
    }
  }
  unint64_t v18 = 0x8000000251387050;
LABEL_16:
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_2513806B0();
  os_log_type_t v23 = sub_251380C10();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v28 = v25;
    *(_DWORD *)uint64_t v24 = 136446466;
    uint64_t v26 = sub_251381230();
    uint64_t v30 = sub_2512F6F6C(v26, v27, &v28);
    sub_251380DB0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_2512F6F6C(v12, v18, &v28);
    sub_251380DB0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2512DB000, v22, v23, "[%{public}s] status: %s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25339CCC0](v25, -1, -1);
    MEMORY[0x25339CCC0](v24, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_25137B4A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = sub_2513806F0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_251380730();
  uint64_t v9 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  unint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2512F54B4(0, (unint64_t *)&unk_269B31AA0);
  uint64_t v12 = (void *)sub_251380C80();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v3;
  *(void *)(v13 + 24) = ObjectType;
  aBlock[4] = v18;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2512E07AC;
  aBlock[3] = v19;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = v3;
  swift_release();
  sub_251380710();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_25137DC8C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B31B00);
  sub_25137DCE4();
  sub_251380E10();
  MEMORY[0x25339C060](0, v11, v8, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v20);
}

id sub_25137B734()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_25137ADD8();
  if (qword_269B316A0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_2513806D0();
  __swift_project_value_buffer(v3, (uint64_t)qword_269B31B88);
  unint64_t v4 = sub_2513806B0();
  os_log_type_t v5 = sub_251380C10();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v11 = v7;
    *(_DWORD *)uint64_t v6 = 136446210;
    uint64_t v8 = sub_251381230();
    sub_2512F6F6C(v8, v9, &v11);
    sub_251380DB0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2512DB000, v4, v5, "[%{public}s] deinit", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25339CCC0](v7, -1, -1);
    MEMORY[0x25339CCC0](v6, -1, -1);
  }

  v12.receiver = v1;
  v12.super_class = ObjectType;
  return objc_msgSendSuper2(&v12, sel_dealloc);
}

void sub_25137B968()
{
  swift_getObjectType();
  uint64_t v0 = sub_251380440();
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v31 = sub_251380850();
    sub_251380E50();
    if (*(void *)(v1 + 16) && (unint64_t v2 = sub_251368878((uint64_t)v32), (v3 & 1) != 0))
    {
      sub_2512F7C9C(*(void *)(v1 + 56) + 32 * v2, (uint64_t)&v33);
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_25136DDEC((uint64_t)v32);
    if (*((void *)&v34 + 1))
    {
      if (swift_dynamicCast())
      {
        if (qword_269B316A0 != -1) {
          swift_once();
        }
        uint64_t v4 = sub_2513806D0();
        __swift_project_value_buffer(v4, (uint64_t)qword_269B31B88);
        os_log_type_t v5 = sub_2513806B0();
        os_log_type_t v6 = sub_251380C10();
        if (os_log_type_enabled(v5, v6))
        {
          uint64_t v7 = (uint8_t *)swift_slowAlloc();
          uint64_t v8 = swift_slowAlloc();
          v32[0] = v8;
          *(_DWORD *)uint64_t v7 = 136446210;
          uint64_t v9 = sub_251381230();
          *(void *)&long long v33 = sub_2512F6F6C(v9, v10, v32);
          sub_251380DB0();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2512DB000, v5, v6, "[%{public}s] audio session route change  - capture route BT ports if none", v7, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x25339CCC0](v8, -1, -1);
          MEMORY[0x25339CCC0](v7, -1, -1);
        }

        sub_25137B010();
        uint64_t v11 = sub_2513806B0();
        os_log_type_t v12 = sub_251380C10();
        if (os_log_type_enabled(v11, v12))
        {
          uint64_t v13 = swift_slowAlloc();
          uint64_t v14 = swift_slowAlloc();
          v32[0] = v14;
          *(_DWORD *)uint64_t v13 = 136446466;
          uint64_t v15 = sub_251381230();
          *(void *)&long long v33 = sub_2512F6F6C(v15, v16, v32);
          sub_251380DB0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v13 + 12) = 2048;
          *(void *)&long long v33 = v31;
          sub_251380DB0();
          _os_log_impl(&dword_2512DB000, v11, v12, "[%{public}s] audio session route change reason: %lu", (uint8_t *)v13, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x25339CCC0](v14, -1, -1);
          MEMORY[0x25339CCC0](v13, -1, -1);
        }

        if (v31 == 1)
        {
          sub_25137BFEC();
        }
        else if (v31 == 2 || v31 == 4)
        {
          sub_25137B4A8((uint64_t)&unk_270230E68, (uint64_t)sub_25137FA1C, (uint64_t)&block_descriptor_13_1);
        }
        return;
      }
    }
    else
    {
      sub_25137DBD4((uint64_t)&v33);
    }
    if (qword_269B316A0 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_2513806D0();
    __swift_project_value_buffer(v23, (uint64_t)qword_269B31B88);
    uint64_t v24 = sub_2513806B0();
    os_log_type_t v25 = sub_251380C10();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      v32[0] = v27;
      *(_DWORD *)uint64_t v26 = 136446210;
      uint64_t v28 = sub_251381230();
      *(void *)&long long v33 = sub_2512F6F6C(v28, v29, v32);
      sub_251380DB0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2512DB000, v24, v25, "[%{public}s] audio session route change  - no reason", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25339CCC0](v27, -1, -1);
      MEMORY[0x25339CCC0](v26, -1, -1);
    }
  }
  else
  {
    if (qword_269B316A0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_2513806D0();
    __swift_project_value_buffer(v17, (uint64_t)qword_269B31B88);
    oslog = sub_2513806B0();
    os_log_type_t v18 = sub_251380C10();
    if (os_log_type_enabled(oslog, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      v32[0] = v20;
      *(_DWORD *)uint64_t v19 = 136446210;
      uint64_t v21 = sub_251381230();
      *(void *)&long long v33 = sub_2512F6F6C(v21, v22, v32);
      sub_251380DB0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2512DB000, oslog, v18, "[%{public}s] audio session route change  - no userInfo", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25339CCC0](v20, -1, -1);
      MEMORY[0x25339CCC0](v19, -1, -1);
    }
    else
    {
    }
  }
}

void sub_25137BFEC()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  if (qword_269B316A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2513806D0();
  __swift_project_value_buffer(v2, (uint64_t)qword_269B31B88);
  char v3 = sub_2513806B0();
  os_log_type_t v4 = sub_251380C10();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v57 = v6;
    *(_DWORD *)os_log_type_t v5 = 136446210;
    uint64_t v7 = sub_251381230();
    sub_2512F6F6C(v7, v8, &v57);
    sub_251380DB0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2512DB000, v3, v4, "[%{public}s] searching for expected audio route", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25339CCC0](v6, -1, -1);
    MEMORY[0x25339CCC0](v5, -1, -1);
  }

  id v9 = objc_msgSend(self, sel_sharedInstance);
  id v10 = objc_msgSend(v9, sel_currentRoute);
  id v11 = objc_msgSend(v10, sel_outputs);
  sub_2512F54B4(0, &qword_269B31D60);
  unint64_t v12 = sub_251380970();

  if (!(v12 >> 62))
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRelease();

    if (v13 >= 1) {
      goto LABEL_7;
    }
LABEL_34:
    uint64_t v26 = sub_2513806B0();
    os_log_type_t v27 = sub_251380C10();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v57 = v29;
      *(_DWORD *)uint64_t v28 = 136446210;
      uint64_t v52 = sub_251381230();
      sub_2512F6F6C(v52, v53, &v57);
      sub_251380DB0();
      swift_bridgeObjectRelease();
      uint64_t v32 = "[%{public}s] searching - session has no outputs";
      goto LABEL_36;
    }
LABEL_37:

    goto LABEL_38;
  }
  swift_bridgeObjectRetain();
  uint64_t v51 = sub_251380F90();

  swift_bridgeObjectRelease_n();
  if (v51 < 1) {
    goto LABEL_34;
  }
LABEL_7:
  uint64_t v14 = sub_2513790A0();
  if (!*(void *)(v14 + 16))
  {
    swift_bridgeObjectRelease();
    uint64_t v26 = sub_2513806B0();
    os_log_type_t v27 = sub_251380C10();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v57 = v29;
      *(_DWORD *)uint64_t v28 = 136446210;
      uint64_t v30 = sub_251381230();
      sub_2512F6F6C(v30, v31, &v57);
      sub_251380DB0();
      swift_bridgeObjectRelease();
      uint64_t v32 = "[%{public}s] searching - session has no output names";
LABEL_36:
      _os_log_impl(&dword_2512DB000, v26, v27, v32, v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25339CCC0](v29, -1, -1);
      MEMORY[0x25339CCC0](v28, -1, -1);
      goto LABEL_37;
    }
    goto LABEL_37;
  }
  uint64_t v15 = OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_capturedDevice;
  unint64_t v16 = *(void **)(v1 + OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_capturedDevice);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = sub_2513799F8();

    if (*(void *)(v18 + 16))
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = swift_bridgeObjectRetain();
      uint64_t v20 = *(void *)(sub_25137CFF4(v19, v14) + 16);
      uint64_t v21 = *(void *)(v14 + 16);
      swift_bridgeObjectRelease();
      unint64_t v22 = *(char **)(v1 + v15);
      if (v22)
      {
        unint64_t v23 = *(void *)&v22[OBJC_IVAR____TtC11HearingTestP33_E1CF8936D0F3BEC6A29D15D29986B99914CapturedDevice_capturedPorts];
        if (v23 >> 62)
        {
          uint64_t v56 = v22;
          swift_bridgeObjectRetain();
          uint64_t v24 = sub_251380F90();

          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        BOOL v25 = v20 == v24;
      }
      else
      {
        BOOL v25 = v20 == 0;
      }
      char v39 = v25;
      if (v20 == v21 && (v39 & 1) != 0)
      {
        int v40 = 1;
        unint64_t v41 = 0xE800000000000000;
        uint64_t v42 = 0x676E69686374616DLL;
      }
      else
      {
        int v40 = 0;
        unint64_t v41 = 0xEC000000474E4948;
        uint64_t v42 = 0x4354414D20544F4ELL;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_2513806B0();
      os_log_type_t v44 = sub_251380C10();
      if (os_log_type_enabled(v43, v44))
      {
        os_log_type_t type = v44;
        uint64_t v45 = swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        uint64_t v57 = v55;
        *(_DWORD *)uint64_t v45 = 136446978;
        uint64_t v46 = sub_251381230();
        sub_2512F6F6C(v46, v47, &v57);
        sub_251380DB0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v45 + 12) = 2048;
        swift_bridgeObjectRelease();
        sub_251380DB0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v45 + 22) = 2048;
        swift_bridgeObjectRelease();
        sub_251380DB0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v45 + 32) = 2080;
        swift_bridgeObjectRetain();
        sub_2512F6F6C(v42, v41, &v57);
        sub_251380DB0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2512DB000, v43, type, "[%{public}s] searching - expected %ld ports, session port count: %ld - port name sets are %s", (uint8_t *)v45, 0x2Au);
        swift_arrayDestroy();
        MEMORY[0x25339CCC0](v55, -1, -1);
        MEMORY[0x25339CCC0](v45, -1, -1);

        if (!v40) {
          goto LABEL_38;
        }
LABEL_32:
        id v48 = &unk_270230E18;
        id v49 = &block_descriptor_5;
        long long v50 = sub_25137DC6C;
LABEL_39:
        sub_25137B4A8((uint64_t)v48, (uint64_t)v50, (uint64_t)v49);
        goto LABEL_40;
      }

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      if (v40) {
        goto LABEL_32;
      }
LABEL_38:
      id v48 = &unk_270230E68;
      id v49 = &block_descriptor_13_1;
      long long v50 = sub_25137FA1C;
      goto LABEL_39;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  long long v33 = sub_2513806B0();
  os_log_type_t v34 = sub_251380C10();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v57 = v36;
    *(_DWORD *)uint64_t v35 = 136446210;
    uint64_t v37 = sub_251381230();
    sub_2512F6F6C(v37, v38, &v57);
    sub_251380DB0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2512DB000, v33, v34, "[%{public}s] searching - expected port name list is empty", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25339CCC0](v36, -1, -1);
    MEMORY[0x25339CCC0](v35, -1, -1);
  }

LABEL_40:
}

void sub_25137C98C(uint64_t a1)
{
  uint64_t v1 = OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_isInterrupted;
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_isInterrupted))
  {
    if (qword_269B316A0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_2513806D0();
    __swift_project_value_buffer(v2, (uint64_t)qword_269B31B88);
    oslog = sub_2513806B0();
    os_log_type_t v3 = sub_251380C10();
    if (os_log_type_enabled(oslog, v3))
    {
      os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = swift_slowAlloc();
      uint64_t v17 = v5;
      *(_DWORD *)os_log_type_t v4 = 136446210;
      uint64_t v6 = sub_251381230();
      sub_2512F6F6C(v6, v7, &v17);
      sub_251380DB0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2512DB000, oslog, v3, "[%{public}s] lost route - but it was already lost previously", v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25339CCC0](v5, -1, -1);
      MEMORY[0x25339CCC0](v4, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    if (qword_269B316A0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2513806D0();
    __swift_project_value_buffer(v9, (uint64_t)qword_269B31B88);
    id v10 = sub_2513806B0();
    os_log_type_t v11 = sub_251380C10();
    if (os_log_type_enabled(v10, v11))
    {
      unint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v17 = v13;
      *(_DWORD *)unint64_t v12 = 136446210;
      uint64_t v14 = sub_251381230();
      sub_2512F6F6C(v14, v15, &v17);
      sub_251380DB0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2512DB000, v10, v11, "[%{public}s] lost route", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25339CCC0](v13, -1, -1);
      MEMORY[0x25339CCC0](v12, -1, -1);
    }

    *(unsigned char *)(a1 + v1) = 1;
    (*(void (**)(uint64_t))(a1
                                    + OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_externalInterruptionHandler))(1);
  }
}

void sub_25137CCC0(uint64_t a1)
{
  uint64_t v1 = OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_isInterrupted;
  if (*(unsigned char *)(a1 + OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_isInterrupted) == 1)
  {
    if (qword_269B316A0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_2513806D0();
    __swift_project_value_buffer(v3, (uint64_t)qword_269B31B88);
    os_log_type_t v4 = sub_2513806B0();
    os_log_type_t v5 = sub_251380C10();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      uint64_t v17 = v7;
      *(_DWORD *)uint64_t v6 = 136446210;
      uint64_t v8 = sub_251381230();
      sub_2512F6F6C(v8, v9, &v17);
      sub_251380DB0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2512DB000, v4, v5, "[%{public}s] found route", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25339CCC0](v7, -1, -1);
      MEMORY[0x25339CCC0](v6, -1, -1);
    }

    *(unsigned char *)(a1 + v1) = 0;
    (*(void (**)(void))(a1
                                   + OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_externalInterruptionHandler))(0);
  }
  else
  {
    if (qword_269B316A0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_2513806D0();
    __swift_project_value_buffer(v10, (uint64_t)qword_269B31B88);
    oslog = sub_2513806B0();
    os_log_type_t v11 = sub_251380C10();
    if (os_log_type_enabled(oslog, v11))
    {
      unint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v17 = v13;
      *(_DWORD *)unint64_t v12 = 136446210;
      uint64_t v14 = sub_251381230();
      sub_2512F6F6C(v14, v15, &v17);
      sub_251380DB0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2512DB000, oslog, v11, "[%{public}s] found route - but it was already found previously", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25339CCC0](v13, -1, -1);
      MEMORY[0x25339CCC0](v12, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_25137CFF4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  int64_t v3 = 0;
  uint64_t v18 = a2;
  uint64_t v4 = result + 56;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      int64_t v3 = v14 + 1;
      if (v14 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v15 = *(void *)(v4 + 8 * v3);
      if (!v15)
      {
        int64_t v3 = v14 + 2;
        if (v14 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v15 = *(void *)(v4 + 8 * v3);
        if (!v15)
        {
          int64_t v3 = v14 + 3;
          if (v14 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v15 = *(void *)(v4 + 8 * v3);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    os_log_type_t v11 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_25137DE50(&v17, v12, v13);
    id result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v15 = *(void *)(v4 + 8 * v3);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_25137D174(uint64_t a1, void (*a2)(void))
{
  uint64_t v52 = a2;
  v56[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = sub_2513804E0();
  uint64_t v54 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  int64_t v8 = (char *)&v51 - v7;
  if (qword_269B31728 != -1) {
    swift_once();
  }
  id v9 = (id)qword_269B32608;
  unint64_t v10 = (void *)sub_251380840();
  os_log_type_t v11 = (void *)sub_251380840();
  id v12 = objc_msgSend(v9, sel_pathForResource_ofType_, v10, v11);

  if (v12)
  {
    sub_251380850();

    sub_2513804C0();
    swift_bridgeObjectRelease();
    id v13 = objc_msgSend(self, sel_sharedInstance);
    v56[0] = 0;
    unsigned int v14 = objc_msgSend(v13, sel_setActive_error_, 1, v56);
    unint64_t v15 = (void *)v56[0];
    uint64_t v53 = v3;
    if (!v14) {
      goto LABEL_8;
    }
    uint64_t v16 = *MEMORY[0x263EF9060];
    v56[0] = 0;
    id v17 = v15;
    unsigned int v18 = objc_msgSend(v13, sel_setCategory_error_, v16, v56);
    unint64_t v15 = (void *)v56[0];
    if (!v18) {
      goto LABEL_8;
    }
    uint64_t v19 = *MEMORY[0x263EF9138];
    v56[0] = 0;
    id v20 = v15;
    unsigned int v21 = objc_msgSend(v13, sel_setMode_error_, v19, v56);
    unint64_t v15 = (void *)v56[0];
    if (v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v6, v8, v3);
      objc_allocWithZone(MEMORY[0x263EF93B8]);
      id v22 = v15;
      id v23 = sub_25137DA58((uint64_t)v6);
      uint64_t v37 = OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_player;
      unint64_t v38 = *(void **)(a1 + OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_player);
      *(void *)(a1 + OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_player) = v23;

      char v39 = *(void **)(a1 + v37);
      if (v39)
      {
        objc_msgSend(v39, sel_setVolume_, 0.0);
        int v40 = *(void **)(a1 + v37);
        if (v40)
        {
          objc_msgSend(v40, sel_setNumberOfLoops_, -1);
          unint64_t v41 = *(void **)(a1 + v37);
          if (v41)
          {
            objc_msgSend(v41, sel_prepareToPlay);
            uint64_t v42 = *(void **)(a1 + v37);
            if (v42) {
              objc_msgSend(v42, sel_play);
            }
          }
        }
      }
      if (qword_269B316A0 != -1) {
        swift_once();
      }
      uint64_t v43 = sub_2513806D0();
      __swift_project_value_buffer(v43, (uint64_t)qword_269B31B88);
      os_log_type_t v44 = sub_2513806B0();
      os_log_type_t v45 = sub_251380C10();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v46 = (uint8_t *)swift_slowAlloc();
        uint64_t v47 = swift_slowAlloc();
        v56[0] = v47;
        *(_DWORD *)uint64_t v46 = 136446210;
        uint64_t v48 = sub_251381230();
        uint64_t v55 = sub_2512F6F6C(v48, v49, v56);
        sub_251380DB0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2512DB000, v44, v45, "[%{public}s] player playing", v46, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25339CCC0](v47, -1, -1);
        MEMORY[0x25339CCC0](v46, -1, -1);
      }

      uint64_t v50 = v53;
      v52();

      (*(void (**)(char *, uint64_t))(v54 + 8))(v8, v50);
    }
    else
    {
LABEL_8:
      id v24 = v15;
      BOOL v25 = (void *)sub_2513804B0();

      swift_willThrow();
      if (qword_269B316A0 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_2513806D0();
      __swift_project_value_buffer(v26, (uint64_t)qword_269B31B88);
      id v27 = v25;
      id v28 = v25;
      uint64_t v29 = sub_2513806B0();
      os_log_type_t v30 = sub_251380C30();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = swift_slowAlloc();
        uint64_t v32 = swift_slowAlloc();
        v56[0] = v32;
        *(_DWORD *)uint64_t v31 = 136446466;
        uint64_t v33 = sub_251381230();
        uint64_t v55 = sub_2512F6F6C(v33, v34, v56);
        sub_251380DB0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v31 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v35 = sub_251381140();
        uint64_t v55 = sub_2512F6F6C(v35, v36, v56);
        sub_251380DB0();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_2512DB000, v29, v30, "[%{public}s] setupPlayer failed to start player! %s", (uint8_t *)v31, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25339CCC0](v32, -1, -1);
        MEMORY[0x25339CCC0](v31, -1, -1);
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v54 + 8))(v8, v53);
    }
  }
}

id sub_25137D84C(uint64_t a1)
{
  if (qword_269B316A0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2513806D0();
  __swift_project_value_buffer(v2, (uint64_t)qword_269B31B88);
  uint64_t v3 = sub_2513806B0();
  os_log_type_t v4 = sub_251380C10();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v11 = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v7 = sub_251381230();
    sub_2512F6F6C(v7, v8, &v11);
    sub_251380DB0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2512DB000, v3, v4, "[%{public}s] stop playing", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25339CCC0](v6, -1, -1);
    MEMORY[0x25339CCC0](v5, -1, -1);
  }

  uint64_t v9 = OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_player;
  id result = *(id *)(a1 + OBJC_IVAR____TtC11HearingTest30HTAudioRouteRequirementManager_player);
  if (result)
  {
    id result = objc_msgSend(result, sel_isPlaying);
    if (result)
    {
      id result = *(id *)(a1 + v9);
      if (result) {
        return objc_msgSend(result, sel_stop);
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for HTAudioRouteRequirementManager()
{
  return self;
}

id sub_25137DA58(uint64_t a1)
{
  uint64_t v2 = v1;
  v13[1] = *(id *)MEMORY[0x263EF8340];
  os_log_type_t v4 = (void *)sub_2513804D0();
  v13[0] = 0;
  id v5 = objc_msgSend(v2, sel_initWithContentsOfURL_error_, v4, v13);

  id v6 = v13[0];
  if (v5)
  {
    uint64_t v7 = sub_2513804E0();
    unint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    id v9 = v6;
    v8(a1, v7);
  }
  else
  {
    id v10 = v13[0];
    sub_2513804B0();

    swift_willThrow();
    uint64_t v11 = sub_2513804E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

uint64_t sub_25137DBA4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_25137DBD4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B31D40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25137DC34()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_25137DC6C()
{
  sub_25137CCC0(*(void *)(v0 + 16));
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

unint64_t sub_25137DC8C()
{
  unint64_t result = qword_269B31970;
  if (!qword_269B31970)
  {
    sub_2513806F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B31970);
  }
  return result;
}

unint64_t sub_25137DCE4()
{
  unint64_t result = qword_269B31978;
  if (!qword_269B31978)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B31B00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B31978);
  }
  return result;
}

uint64_t sub_25137DD40(double *a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_2513811A0();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_8:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_25137E884(v9, isUniquelyReferenced_nonNull_native, a2);
    *uint64_t v3 = v15;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_9;
  }
  uint64_t v10 = *(void *)(v6 + 48);
  double v11 = *(double *)(v10 + 8 * v9);
  if (v11 != a2)
  {
    uint64_t v13 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v13;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_8;
      }
      double v11 = *(double *)(v10 + 8 * v9);
    }
    while (v11 != a2);
  }
  uint64_t result = 0;
  a2 = v11;
LABEL_9:
  *a1 = a2;
  return result;
}

uint64_t sub_25137DE50(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_2513811B0();
  swift_bridgeObjectRetain();
  sub_251380880();
  uint64_t v8 = sub_2513811E0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    id v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2513810E0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unsigned int v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      unsigned int v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_2513810E0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25137E9B8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25137E000()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B32648);
  uint64_t result = sub_251380E70();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    id v27 = v1;
    int64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v26 = -1 << v7;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64) {
                  bzero((void *)(v2 + 56), 8 * v10);
                }
                else {
                  uint64_t *v6 = v26;
                }
                uint64_t v1 = v27;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      uint64_t result = sub_2513811A0();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_25137E298()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B32638);
  uint64_t v3 = sub_251380E70();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    os_log_type_t v30 = (void *)(v2 + 56);
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
                  *os_log_type_t v30 = -1 << v29;
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
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_2513811B0();
      sub_251380880();
      uint64_t result = sub_2513811E0();
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
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_25137E578()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B32640);
  uint64_t v2 = sub_251380E70();
  uint64_t v3 = v2;
  if (*(void *)(v1 + 16))
  {
    uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
    char v25 = (void *)(v1 + 56);
    if (v4 < 64) {
      uint64_t v5 = ~(-1 << v4);
    }
    else {
      uint64_t v5 = -1;
    }
    unint64_t v6 = v5 & *(void *)(v1 + 56);
    int64_t v7 = (unint64_t)(v4 + 63) >> 6;
    uint64_t v8 = v2 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v6)
      {
        unint64_t v12 = __clz(__rbit64(v6));
        v6 &= v6 - 1;
        unint64_t v13 = v12 | (v10 << 6);
      }
      else
      {
        int64_t v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v7) {
          goto LABEL_33;
        }
        unint64_t v15 = v25[v14];
        ++v10;
        if (!v15)
        {
          int64_t v10 = v14 + 1;
          if (v14 + 1 >= v7) {
            goto LABEL_33;
          }
          unint64_t v15 = v25[v10];
          if (!v15)
          {
            int64_t v10 = v14 + 2;
            if (v14 + 2 >= v7) {
              goto LABEL_33;
            }
            unint64_t v15 = v25[v10];
            if (!v15)
            {
              int64_t v16 = v14 + 3;
              if (v16 >= v7)
              {
LABEL_33:
                swift_release();
                uint64_t v24 = 1 << *(unsigned char *)(v1 + 32);
                if (v24 > 63) {
                  bzero(v25, ((unint64_t)(v24 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v25 = -1 << v24;
                }
                *(void *)(v1 + 16) = 0;
                break;
              }
              unint64_t v15 = v25[v16];
              if (!v15)
              {
                while (1)
                {
                  int64_t v10 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v7) {
                    goto LABEL_33;
                  }
                  unint64_t v15 = v25[v10];
                  ++v16;
                  if (v15) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v16;
            }
          }
        }
LABEL_23:
        unint64_t v6 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      sub_251344C20(*(void *)(v1 + 48) + 48 * v13, (uint64_t)v26);
      sub_2513811B0();
      swift_bridgeObjectRetain();
      sub_251380880();
      swift_bridgeObjectRelease();
      sub_2513811C0();
      uint64_t result = sub_2513811E0();
      uint64_t v17 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v18 = result & ~v17;
      unint64_t v19 = v18 >> 6;
      if (((-1 << v18) & ~*(void *)(v8 + 8 * (v18 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v18) & ~*(void *)(v8 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v20 = 0;
        unint64_t v21 = (unint64_t)(63 - v17) >> 6;
        do
        {
          if (++v19 == v21 && (v20 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v22 = v19 == v21;
          if (v19 == v21) {
            unint64_t v19 = 0;
          }
          v20 |= v22;
          uint64_t v23 = *(void *)(v8 + 8 * v19);
        }
        while (v23 == -1);
        unint64_t v11 = __clz(__rbit64(~v23)) + (v19 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      uint64_t result = sub_251344C20((uint64_t)v26, *(void *)(v3 + 48) + 48 * v11);
      ++*(void *)(v3 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v0 = v3;
  return result;
}

uint64_t sub_25137E884(uint64_t result, char a2, double a3)
{
  unint64_t v4 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a2 & 1) != 0) {
    goto LABEL_14;
  }
  if (a2)
  {
    sub_25137E000();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_25137ED14();
      goto LABEL_14;
    }
    sub_25137F224();
  }
  uint64_t v8 = *v3;
  uint64_t result = sub_2513811A0();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  unint64_t v4 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(double *)(v10 + 8 * v4) == a3)
    {
LABEL_13:
      uint64_t result = sub_251381120();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        unint64_t v4 = (v4 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
          break;
        }
        if (*(double *)(v10 + 8 * v4) == a3) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (v4 >> 6) + 56) |= 1 << v4;
  *(double *)(*(void *)(v12 + 48) + 8 * v4) = a3;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

uint64_t sub_25137E9B8(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_25137E298();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_25137EEAC();
      goto LABEL_22;
    }
    sub_25137F498();
  }
  uint64_t v11 = *v4;
  sub_2513811B0();
  sub_251380880();
  uint64_t result = sub_2513811E0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_2513810E0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_251381120();
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
          uint64_t result = sub_2513810E0();
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
  unint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
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

uint64_t sub_25137EB54(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v4 = v3;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_16;
  }
  if (a3)
  {
    sub_25137E578();
  }
  else
  {
    if (v8 > v7)
    {
      sub_25137F060();
      goto LABEL_16;
    }
    sub_25137F748();
  }
  uint64_t v9 = *v3;
  sub_2513811B0();
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  swift_bridgeObjectRetain();
  sub_251380880();
  swift_bridgeObjectRelease();
  sub_2513811C0();
  uint64_t v12 = sub_2513811E0();
  uint64_t v13 = -1 << *(unsigned char *)(v9 + 32);
  a2 = v12 & ~v13;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v14 = ~v13;
    do
    {
      sub_251344B70(*(void *)(v9 + 48) + 48 * a2, (uint64_t)v22);
      if (v23 == v10 && v24 == v11) {
        goto LABEL_19;
      }
      char v16 = sub_2513810E0();
      sub_251344BCC((uint64_t)v22);
      if (v16) {
        goto LABEL_20;
      }
      a2 = (a2 + 1) & v14;
    }
    while (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_16:
  uint64_t v17 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_251344C20(a1, *(void *)(v17 + 48) + 48 * a2);
  uint64_t v19 = *(void *)(v17 + 16);
  BOOL v20 = __OFADD__(v19, 1);
  uint64_t v21 = v19 + 1;
  if (!v20)
  {
    *(void *)(v17 + 16) = v21;
    return result;
  }
  __break(1u);
LABEL_19:
  sub_251344BCC((uint64_t)v22);
LABEL_20:
  uint64_t result = sub_251381120();
  __break(1u);
  return result;
}

void *sub_25137ED14()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B32648);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_251380E60();
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_25137EEAC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B32638);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_251380E60();
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
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

void *sub_25137F060()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B32640);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_251380E60();
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v13) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 48 * v15;
    sub_251344B70(*(void *)(v2 + 48) + 48 * v15, (uint64_t)v20);
    uint64_t result = (void *)sub_251344C20((uint64_t)v20, *(void *)(v4 + 48) + v16);
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v13) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25137F224()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B32648);
  uint64_t result = sub_251380E70();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t v26 = v1;
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    uint64_t result = sub_2513811A0();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v26;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25137F498()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B32638);
  uint64_t v3 = sub_251380E70();
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_2513811B0();
    swift_bridgeObjectRetain();
    sub_251380880();
    uint64_t result = sub_2513811E0();
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
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *unint64_t v13 = v20;
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

uint64_t sub_25137F748()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B32640);
  uint64_t v2 = sub_251380E70();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v0 = v3;
    return result;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v5 = v1 + 56;
  if (v4 < 64) {
    uint64_t v6 = ~(-1 << v4);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v1 + 56);
  int64_t v24 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v8 = v2 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v24) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v24) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v5 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v24) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v5 + 8 * v10);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    sub_251344B70(*(void *)(v1 + 48) + 48 * v13, (uint64_t)v25);
    sub_2513811B0();
    swift_bridgeObjectRetain();
    sub_251380880();
    swift_bridgeObjectRelease();
    sub_2513811C0();
    uint64_t result = sub_2513811E0();
    uint64_t v17 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)(v8 + 8 * (v18 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v18) & ~*(void *)(v8 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v20 = 0;
      unint64_t v21 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v21 && (v20 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v22 = v19 == v21;
        if (v19 == v21) {
          unint64_t v19 = 0;
        }
        v20 |= v22;
        uint64_t v23 = *(void *)(v8 + 8 * v19);
      }
      while (v23 == -1);
      unint64_t v11 = __clz(__rbit64(~v23)) + (v19 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    uint64_t result = sub_251344C20((uint64_t)v25, *(void *)(v3 + 48) + 48 * v11);
    ++*(void *)(v3 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v24)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v5 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v24) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v5 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_25137FA1C()
{
  sub_25137C98C(*(void *)(v0 + 16));
}

uint64_t sub_25137FA24()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25137FA5C()
{
  return sub_25137A330(*(void *)(v0 + 16));
}

id sub_25137FA64()
{
  return sub_25137D84C(*(void *)(v0 + 16));
}

uint64_t sub_25137FA6C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_25137FAAC()
{
  sub_25137D174(*(void *)(v0 + 16), *(void (**)(void))(v0 + 24));
}

BOOL static MockHTRequirementStatusEventType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MockHTRequirementStatusEventType.hash(into:)()
{
  return sub_2513811C0();
}

void *static MockHTRequirementStatusEventType.allCases.getter()
{
  return &unk_2702287F0;
}

uint64_t MockHTRequirementStatusEventType.hashValue.getter()
{
  return sub_2513811E0();
}

void sub_25137FB6C(void *a1@<X8>)
{
  *a1 = &unk_270228818;
}

void MockHTRequirementStatusEvent.eventType.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *MockHTRequirementStatusEvent.eventType.setter(unsigned char *result)
{
  *uint64_t v1 = *result;
  return result;
}

uint64_t (*MockHTRequirementStatusEvent.eventType.modify())()
{
  return nullsub_1;
}

float MockHTRequirementStatusEvent.startTime.getter()
{
  return *(float *)(v0 + 4);
}

void MockHTRequirementStatusEvent.startTime.setter(float a1)
{
  *(float *)(v1 + 4) = a1;
}

uint64_t (*MockHTRequirementStatusEvent.startTime.modify())()
{
  return nullsub_1;
}

float MockHTRequirementStatusEvent.duration.getter()
{
  return *(float *)(v0 + 8);
}

void MockHTRequirementStatusEvent.duration.setter(float a1)
{
  *(float *)(v1 + 8) = a1;
}

uint64_t (*MockHTRequirementStatusEvent.duration.modify())()
{
  return nullsub_1;
}

unint64_t sub_25137FC18()
{
  unint64_t result = qword_269B32650;
  if (!qword_269B32650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B32650);
  }
  return result;
}

uint64_t sub_25137FC6C()
{
  return sub_2512F7D40(&qword_269B32658, (uint64_t *)&unk_269B32660);
}

unsigned char *storeEnumTagSinglePayload for MockHTRequirementStatusEventType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25137FD74);
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

ValueMetadata *type metadata accessor for MockHTRequirementStatusEventType()
{
  return &type metadata for MockHTRequirementStatusEventType;
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for MockHTRequirementStatusEvent(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && a1[12]) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 4;
  int v5 = v3 - 4;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MockHTRequirementStatusEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_DWORD *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 12) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 12) = 0;
    }
    if (a2) {
      *(unsigned char *)unint64_t result = a2 + 3;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MockHTRequirementStatusEvent()
{
  return &type metadata for MockHTRequirementStatusEvent;
}

uint64_t sub_25137FE58(void *a1)
{
  swift_allocObject();
  sub_25137FF44(a1);
  uint64_t v3 = v2;

  return v3;
}

uint64_t sub_25137FEA0()
{
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_25137FED0()
{
  uint64_t v0 = HTRequirementStatusManager.deinit();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0228](v0, 913, 7);
}

uint64_t type metadata accessor for MockHTRequirementStatusManager()
{
  return self;
}

void sub_25137FF44(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2513806E0();
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v36 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  unint64_t v34 = (char **)((char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v5);
  uint64_t v33 = (char **)((char *)&v30 - v7);
  uint64_t v8 = sub_251380750();
  uint64_t v31 = *(void *)(v8 - 8);
  uint64_t v32 = v8;
  MEMORY[0x270FA5388](v8);
  os_log_type_t v30 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_251380CE0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_251380700();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x263F8EE78];
  *(void *)(v2 + 888) = MEMORY[0x263F8EE78];
  if (a1)
  {
    swift_retain();
    unint64_t v19 = a1;
  }
  else
  {
    sub_2512F54B4(0, (unint64_t *)&unk_269B31AA0);
    (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x263F8F080], v14);
    swift_retain();
    unint64_t v19 = (void *)sub_251380CC0();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  *(void *)(v2 + 904) = 0;
  *(unsigned char *)(v2 + 912) = 1;
  sub_2512F54B4(0, (unint64_t *)&unk_269B31AB0);
  uint64_t v37 = v18;
  sub_2513803D8();
  id v20 = a1;
  id v21 = v19;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B31AC0);
  sub_2512F7D40((unint64_t *)&unk_269B32680, (uint64_t *)&unk_269B31AC0);
  sub_251380E10();
  uint64_t v22 = sub_251380CF0();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  *(void *)(v2 + 896) = v22;
  uint64_t ObjectType = swift_getObjectType();
  swift_unknownObjectRetain();
  int64_t v24 = v30;
  sub_251380740();
  char v25 = v33;
  *uint64_t v33 = 1000;
  uint64_t v27 = v35;
  uint64_t v26 = v36;
  (*(void (**)(void *, void, uint64_t))(v35 + 104))(v25, *MEMORY[0x263F8F000], v36);
  uint64_t v28 = v34;
  sub_2512F671C(v34);
  MEMORY[0x25339C150](v24, v25, v28, ObjectType);

  swift_release();
  swift_unknownObjectRelease();
  int64_t v29 = *(void (**)(void *, uint64_t))(v27 + 8);
  v29(v28, v26);
  v29(v25, v26);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v24, v32);
  HTRequirementStatusManager.init(_:)(0);
}

unint64_t sub_2513803D8()
{
  unint64_t result = qword_269B32670;
  if (!qword_269B32670)
  {
    sub_251380CE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B32670);
  }
  return result;
}

uint64_t sub_251380430()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_251380440()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_251380450()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_251380460()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_251380470()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_251380480()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_251380490()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2513804A0()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_2513804B0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2513804C0()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_2513804D0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2513804E0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2513804F0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_251380500()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_251380510()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_251380520()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_251380530()
{
  return MEMORY[0x270EF0250]();
}

uint64_t sub_251380540()
{
  return MEMORY[0x270EF02A8]();
}

uint64_t sub_251380550()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_251380560()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_251380570()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_251380580()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_251380590()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2513805A0()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_2513805B0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2513805C0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_2513805D0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_2513805E0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2513805F0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_251380600()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_251380610()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_251380620()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_251380630()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_251380640()
{
  return MEMORY[0x270FA1168]();
}

uint64_t sub_251380660()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_251380670()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_251380680()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_251380690()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_2513806A0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_2513806B0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2513806C0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2513806D0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2513806E0()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_2513806F0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_251380700()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_251380710()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_251380720()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_251380730()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_251380740()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_251380750()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_251380760()
{
  return MEMORY[0x270FA0B30]();
}

uint64_t sub_251380770()
{
  return MEMORY[0x270FA0B60]();
}

uint64_t sub_251380780()
{
  return MEMORY[0x270FA0B70]();
}

uint64_t sub_251380790()
{
  return MEMORY[0x270FA0B98]();
}

uint64_t sub_2513807A0()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_2513807B0()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_2513807C0()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_2513807D0()
{
  return MEMORY[0x270F17CC0]();
}

uint64_t sub_2513807E0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2513807F0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_251380800()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_251380810()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_251380820()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_251380830()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_251380840()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_251380850()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_251380860()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_251380870()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_251380880()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_251380890()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2513808A0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2513808B0()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_2513808C0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2513808D0()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_2513808E0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2513808F0()
{
  return MEMORY[0x270F9D930]();
}

uint64_t sub_251380900()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_251380910()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_251380920()
{
  return MEMORY[0x270F9DA20]();
}

uint64_t sub_251380930()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_251380940()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_251380950()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_251380960()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_251380970()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_251380980()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_251380990()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2513809A0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2513809B0()
{
  return MEMORY[0x270F9DBF8]();
}

uint64_t sub_2513809C0()
{
  return MEMORY[0x270F9DC08]();
}

uint64_t sub_2513809D0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_2513809E0()
{
  return MEMORY[0x270F9DC18]();
}

uint64_t sub_2513809F0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_251380A00()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_251380A10()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_251380A20()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_251380A30()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_251380A40()
{
  return MEMORY[0x270F9DCE8]();
}

uint64_t sub_251380A50()
{
  return MEMORY[0x270F9DCF8]();
}

uint64_t sub_251380A60()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_251380A70()
{
  return MEMORY[0x270F9DD10]();
}

uint64_t sub_251380A80()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_251380A90()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_251380AA0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_251380AB0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_251380AC0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_251380AD0()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_251380AE0()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_251380B00()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_251380B10()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_251380B20()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_251380B30()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_251380B40()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_251380B50()
{
  return MEMORY[0x270F9E060]();
}

uint64_t sub_251380B80()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_251380B90()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_251380BA0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_251380BC0()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_251380BD0()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_251380BE0()
{
  return MEMORY[0x270F9E1D0]();
}

uint64_t sub_251380BF0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_251380C00()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_251380C10()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_251380C20()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_251380C30()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_251380C40()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_251380C50()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_251380C60()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_251380C70()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_251380C80()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_251380C90()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_251380CA0()
{
  return MEMORY[0x270FA0DB0]();
}

uint64_t sub_251380CB0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_251380CC0()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_251380CD0()
{
  return MEMORY[0x270FA0DE0]();
}

uint64_t sub_251380CE0()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_251380CF0()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_251380D00()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_251380D10()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_251380D20()
{
  return MEMORY[0x270FA0EC8]();
}

uint64_t sub_251380D30()
{
  return MEMORY[0x270FA0ED8]();
}

uint64_t sub_251380D40()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_251380D50()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_251380D60()
{
  return MEMORY[0x270FA0F30]();
}

uint64_t sub_251380D70()
{
  return MEMORY[0x270FA0F48]();
}

uint64_t sub_251380D80()
{
  return MEMORY[0x270FA0F58]();
}

uint64_t sub_251380D90()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_251380DA0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_251380DB0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_251380DC0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_251380DD0()
{
  return MEMORY[0x270EF25A0]();
}

uint64_t sub_251380DE0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_251380DF0()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_251380E10()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_251380E20()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_251380E30()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_251380E40()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_251380E50()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_251380E60()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_251380E70()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_251380E80()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_251380E90()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_251380EA0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_251380EB0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_251380EC0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_251380ED0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_251380EE0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_251380EF0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_251380F00()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_251380F10()
{
  return MEMORY[0x270F9ECD0]();
}

uint64_t sub_251380F20()
{
  return MEMORY[0x270F9ECE8]();
}

uint64_t sub_251380F30()
{
  return MEMORY[0x270F9ECF0]();
}

uint64_t sub_251380F40()
{
  return MEMORY[0x270F9ECF8]();
}

uint64_t sub_251380F50()
{
  return MEMORY[0x270F9ED00]();
}

uint64_t sub_251380F60()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_251380F70()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_251380F80()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_251380F90()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_251380FA0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_251380FB0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_251380FC0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_251380FD0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_251380FE0()
{
  return MEMORY[0x270F9F148]();
}

uint64_t sub_251380FF0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_251381000()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_251381010()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_251381020()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_251381030()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_251381040()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_251381050()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_251381060()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_251381070()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_251381080()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_251381090()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2513810A0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2513810B0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2513810D0()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_2513810E0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2513810F0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_251381100()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_251381110()
{
  return MEMORY[0x270F9FA60]();
}

uint64_t sub_251381120()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_251381130()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_251381140()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_251381150()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_251381160()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_251381170()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_251381180()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_251381190()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_2513811A0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_2513811B0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2513811C0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2513811D0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_2513811E0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2513811F0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_251381200()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_251381230()
{
  return MEMORY[0x270FA0128]();
}

OSStatus AudioServicesDisposeSystemSoundID(SystemSoundID inSystemSoundID)
{
  return MEMORY[0x270EE2210](*(void *)&inSystemSoundID);
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x270EE2230]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x270FA0150]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cblas_dcopy_NEWLAPACK()
{
  return MEMORY[0x270EDE308]();
}

uint64_t cblas_dgemm_NEWLAPACK()
{
  return MEMORY[0x270EDE330]();
}

uint64_t dgetrf_NEWLAPACK()
{
  return MEMORY[0x270EDE598]();
}

uint64_t dgetri_NEWLAPACK()
{
  return MEMORY[0x270EDE5A8]();
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

void free(void *a1)
{
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

uint64_t lroundf(float a1)
{
  return MEMORY[0x270EDA110](a1);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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

void vDSP_maxvD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
}

void vDSP_maxviD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length *__I, vDSP_Length __N)
{
}

void vDSP_meanvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
}

void vDSP_minvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
}

void vDSP_mtransD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
}

void vDSP_svdivD(const double *__A, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_sveD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
}

void vDSP_vabsD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vclipD(const double *__A, vDSP_Stride __IA, const double *__B, const double *__C, double *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vgenpD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __M)
{
}

void vDSP_vmulD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vnegD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsaddD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsdivD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsubD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}