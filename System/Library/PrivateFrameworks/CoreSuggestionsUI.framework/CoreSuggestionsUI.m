void OUTLINED_FUNCTION_30()
{
  unsigned char *v0;
  unsigned char *v1;

  v0[16] = v1[16];
  v0[17] = v1[17];
  v0[18] = v1[18];
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_getEnumCaseMultiPayload();
}

void OUTLINED_FUNCTION_30_1(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 200) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_41()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_41_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(void *)(v11 + *(int *)(v12 + 60)) = *(void *)(v13 + *(int *)(v12 + 60));
  *(unsigned char *)(v11 + *(int *)(v12 + 64)) = *(unsigned char *)(v13 + *(int *)(v12 + 64));
  *(unsigned char *)(v10 + *(int *)(a10 + 28)) = *(unsigned char *)(a9 + *(int *)(a10 + 28));
  return v10;
}

uint64_t OUTLINED_FUNCTION_41_2(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return sub_1B5BC92E0();
}

double OUTLINED_FUNCTION_41_4(double *a1)
{
  double result = *a1;
  *(double *)(v1 + 16) = *a1;
  *(void *)(v1 + 32) = *v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_beginAccess();
}

id OUTLINED_FUNCTION_6_1(uint64_t a1, uint64_t a2, void *a3)
{
  return a3;
}

void OUTLINED_FUNCTION_0()
{
  JUMPOUT(0x1BA9A8090);
}

uint64_t OUTLINED_FUNCTION_6_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, long long a10)
{
  *(void *)(v10 + 64) = a1;
  *(_OWORD *)(v10 + 32) = a10;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  *(unsigned char *)(v2 + 16) = *(unsigned char *)(v0 + 16);
  *(unsigned char *)(v2 + 17) = *(unsigned char *)(v0 + 17);
  uint64_t v6 = *(int *)(v1 + 56);
  v7 = (void *)(v3 + v6);
  void *v7 = *(void *)(v4 + v6);
  v7[1] = *(void *)(v4 + v6 + 8);
  v7[2] = *(void *)(v4 + v6 + 16);
  v7[3] = *(void *)(v4 + v6 + 24);
  v7[4] = *(void *)(v4 + v6 + 32);
  v7[5] = *(void *)(v4 + v6 + 40);
  v7[6] = *(void *)(v4 + v6 + 48);
  v7[7] = *(void *)(v4 + v6 + 56);
  v7[8] = *(void *)(v4 + v6 + 64);
  v7[9] = *(void *)(v4 + v6 + 72);
  return type metadata accessor for SGBannerPaddingParams(0);
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  sub_1B5BAB558();
  sub_1B5BAB77C();
  return sub_1B5BC9830();
}

id OUTLINED_FUNCTION_6_8()
{
  return sub_1B5B72B30();
}

uint64_t OUTLINED_FUNCTION_6_9()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_5_1(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  return sub_1B5BC9340();
}

uint64_t OUTLINED_FUNCTION_53()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_3(uint64_t a1)
{
  uint64_t v4 = *(int *)(a1 + 48);
  uint64_t v5 = v1 + v4;
  *(unsigned char *)uint64_t v5 = *(unsigned char *)(v2 + v4);
  *(_WORD *)(v5 + 1) = *(_WORD *)(v2 + v4 + 1);
  *(_OWORD *)(v5 + 8) = *(_OWORD *)(v2 + v4 + 8);
  *(void *)(v5 + 24) = *(void *)(v2 + v4 + 24);
  long long v6 = *(_OWORD *)(v2 + v4 + 48);
  *(_OWORD *)(v5 + 32) = *(_OWORD *)(v2 + v4 + 32);
  *(_OWORD *)(v5 + 48) = v6;
  long long v7 = *(_OWORD *)(v2 + v4 + 80);
  *(_OWORD *)(v5 + 64) = *(_OWORD *)(v2 + v4 + 64);
  *(_OWORD *)(v5 + 80) = v7;
  *(void *)(v5 + 96) = *(void *)(v2 + v4 + 96);
  return type metadata accessor for SGBannerIconParams(0);
}

id OUTLINED_FUNCTION_5_4(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_5_5@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = v2 + a1;
  uint64_t v5 = v3 + a1;
  uint64_t v6 = *(void *)(v5 + 8);
  *(void *)uint64_t v4 = *(void *)v5;
  *(void *)(v4 + 8) = v6;
  *(_WORD *)(v4 + 16) = *(_WORD *)(v5 + 16);
  long long v7 = (_OWORD *)(v2 + v1);
  long long v8 = *(_OWORD *)(v3 + v1 + 16);
  _OWORD *v7 = *(_OWORD *)(v3 + v1);
  v7[1] = v8;
  long long v9 = *(_OWORD *)(v3 + v1 + 48);
  v7[2] = *(_OWORD *)(v3 + v1 + 32);
  v7[3] = v9;
  v7[4] = *(_OWORD *)(v3 + v1 + 64);
  type metadata accessor for SGBannerPaddingParams(0);
  return swift_retain();
}

id OUTLINED_FUNCTION_5_6()
{
  return sub_1B5B72B30();
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return 0x2E2E2E646461;
}

uint64_t OUTLINED_FUNCTION_43()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return v0;
}

id OUTLINED_FUNCTION_14_2()
{
  return [v0 (SEL)(v1 + 1168)];
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186498](a1, a2, 7);
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_0_4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  a1[7] = a2;
  a1[8] = v2;
  a1[4] = 1;
  return sub_1B5BC9F10();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_22()
{
  uint64_t v4 = *(int *)(v0 + 56);
  uint64_t v5 = (_OWORD *)(v1 + v4);
  long long v6 = *(_OWORD *)(v2 + v4 + 16);
  *uint64_t v5 = *(_OWORD *)(v2 + v4);
  v5[1] = v6;
  long long v7 = *(_OWORD *)(v2 + v4 + 48);
  v5[2] = *(_OWORD *)(v2 + v4 + 32);
  v5[3] = v7;
  v5[4] = *(_OWORD *)(v2 + v4 + 64);
  return type metadata accessor for SGBannerPaddingParams(0);
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, long long a12, uint64_t a13, long long a14)
{
  a14 = a12;
  return sub_1B5B8D840((uint64_t)&a14);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_2_3@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + a2) = a1;
  return MEMORY[0x1F41817F8]();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_beginAccess();
}

BOOL OUTLINED_FUNCTION_7_2(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  *(unsigned char *)uint64_t v0 = *(unsigned char *)v1;
  *(unsigned char *)(v0 + 1) = *(unsigned char *)(v1 + 1);
  *(unsigned char *)(v0 + 2) = *(unsigned char *)(v1 + 2);
  *(unsigned char *)(v0 + 3) = *(unsigned char *)(v1 + 3);
  *(unsigned char *)(v0 + 4) = *(unsigned char *)(v1 + 4);
  *(unsigned char *)(v0 + 5) = *(unsigned char *)(v1 + 5);
  *(unsigned char *)(v0 + 6) = *(unsigned char *)(v1 + 6);
  *(void *)(v0 + 8) = *(void *)(v1 + 8);
  *(void *)(v0 + 16) = *(void *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_7_4()
{
  return sub_1B5B72B30();
}

id OUTLINED_FUNCTION_7_6()
{
  return [v0 (SEL)(v1 + 1944)];
}

unsigned char *OUTLINED_FUNCTION_7_7(unsigned char *result, unsigned char *a2)
{
  *double result = *a2;
  result[1] = a2[1];
  result[2] = a2[2];
  result[3] = a2[3];
  result[4] = a2[4];
  result[5] = a2[5];
  result[6] = a2[6];
  return result;
}

uint64_t OUTLINED_FUNCTION_7_8()
{
  return 0x7261646E656C6163;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_8@<X0>(uint64_t a1@<X8>)
{
  v2[7] = a1;
  v2[8] = v1;
  v2[4] = v3;
  return sub_1B5BC9F10();
}

id OUTLINED_FUNCTION_3_1()
{
  return [v0 (SEL)(v1 + 1048)];
}

uint64_t OUTLINED_FUNCTION_3_4(_OWORD *a1, _OWORD *a2)
{
  long long v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  long long v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  return sub_1B5BC9230();
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return 1;
}

__n128 OUTLINED_FUNCTION_8_0()
{
  *(unsigned char *)(v6 - 112) = v3;
  *(unsigned char *)(v6 - 120) = v5;
  *(_DWORD *)(v2 + 153) = *(_DWORD *)(v0 + 48);
  *(_DWORD *)(v2 + 156) = *(_DWORD *)(v0 + 51);
  *(_DWORD *)(v2 + 169) = *(_DWORD *)(v6 - 127);
  *(_DWORD *)(v2 + 172) = *(_DWORD *)(v6 - 124);
  *(void *)(v2 + 144) = v1;
  *(unsigned char *)(v2 + 152) = v3;
  *(void *)(v2 + 160) = v4;
  *(unsigned char *)(v2 + 168) = v5;
  __n128 result = *(__n128 *)(v0 + 224);
  *(__n128 *)(v2 + 176) = result;
  *(unsigned char *)(v2 + 192) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return v0;
}

void OUTLINED_FUNCTION_64(uint64_t a1@<X8>)
{
  *(void *)(a1 + 8) = v1;
  *(void *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = 0;
}

uint64_t OUTLINED_FUNCTION_8_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = v1 + a1;
  *(unsigned char *)uint64_t v4 = *(unsigned char *)(v2 + a1);
  *(unsigned char *)(v4 + 1) = *(unsigned char *)(v2 + a1 + 1);
  *(unsigned char *)(v4 + 2) = *(unsigned char *)(v2 + a1 + 2);
  *(unsigned char *)(v4 + 3) = *(unsigned char *)(v2 + a1 + 3);
  *(unsigned char *)(v4 + 4) = *(unsigned char *)(v2 + a1 + 4);
  *(unsigned char *)(v4 + 5) = *(unsigned char *)(v2 + a1 + 5);
  *(unsigned char *)(v4 + 6) = *(unsigned char *)(v2 + a1 + 6);
  uint64_t v5 = *(void *)(v2 + a1 + 16);
  *(void *)(v4 + 8) = *(void *)(v2 + a1 + 8);
  *(void *)(v4 + 16) = v5;
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_8_4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

__n128 OUTLINED_FUNCTION_8_5()
{
  *(unsigned char *)uint64_t v0 = *(unsigned char *)v1;
  *(_WORD *)(v0 + 1) = *(_WORD *)(v1 + 1);
  __n128 result = *(__n128 *)(v1 + 8);
  *(__n128 *)(v0 + 8) = result;
  uint64_t v3 = *(void *)(v1 + 32);
  *(void *)(v0 + 24) = *(void *)(v1 + 24);
  *(void *)(v0 + 32) = v3;
  uint64_t v4 = *(void *)(v1 + 48);
  *(void *)(v0 + 40) = *(void *)(v1 + 40);
  *(void *)(v0 + 48) = v4;
  uint64_t v5 = *(void *)(v1 + 64);
  *(void *)(v0 + 56) = *(void *)(v1 + 56);
  *(void *)(v0 + 64) = v5;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t objectdestroyTm()
{
  OUTLINED_FUNCTION_21_0();
  uint64_t v1 = type metadata accessor for SGBannerContainerView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  uint64_t v4 = (char *)v3 + *(int *)(v1 + 20);
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for SGBannerViewModel(0);
  uint64_t v6 = (id *)&v4[*(int *)(v5 + 48)];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  type metadata accessor for SGBannerIconParams(0);
  uint64_t v7 = sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  long long v9 = *(void (**)(uint64_t))(v8 + 8);
  uint64_t v10 = OUTLINED_FUNCTION_88();
  v9(v10);
  swift_release();
  swift_release();
  uint64_t v11 = *(int *)(v5 + 56);
  uint64_t v12 = type metadata accessor for SGBannerPaddingParams(0);
  ((void (*)(char *, uint64_t))v9)(&v4[v11 + *(int *)(v12 + 56)], v7);

  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
  if (OUTLINED_FUNCTION_90() == 1)
  {
    sub_1B5BC9340();
    OUTLINED_FUNCTION_1_0();
    uint64_t v13 = OUTLINED_FUNCTION_29_0();
    v14(v13);
  }
  else
  {
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
  if (OUTLINED_FUNCTION_90() == 1)
  {
    sub_1B5BC96C0();
    OUTLINED_FUNCTION_1_0();
    uint64_t v15 = OUTLINED_FUNCTION_29_0();
    v16(v15);
  }
  else
  {
    swift_release();
  }
  swift_release();
  OUTLINED_FUNCTION_20();
  return MEMORY[0x1F4186498](v17, v18, v19);
}

uint64_t objectdestroyTm_0()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41866C8](a1, a2, 110, 167, 101, 1);
}

uint64_t OUTLINED_FUNCTION_59_0(uint64_t a1)
{
  *uint64_t v1 = a1;
  return swift_retain();
}

id OUTLINED_FUNCTION_11_1()
{
  return sub_1B5B72B30();
}

void OUTLINED_FUNCTION_11_2(uint64_t a1)
{
  uint64_t v4 = *(int *)(a1 + 48);
  uint64_t v5 = v1 + v4;
  uint64_t v6 = v2 + v4;
  *(unsigned char *)uint64_t v5 = *(unsigned char *)(v2 + v4);
  *(unsigned char *)(v5 + 1) = *(unsigned char *)(v2 + v4 + 1);
  *(unsigned char *)(v5 + 2) = *(unsigned char *)(v2 + v4 + 2);
  *(_OWORD *)(v5 + 8) = *(_OWORD *)(v2 + v4 + 8);
  *(void *)(v5 + 24) = *(void *)(v2 + v4 + 24);
  uint64_t v7 = *(void **)(v1 + v4 + 32);
  *(void *)(v5 + 32) = *(void *)(v6 + 32);
}

id OUTLINED_FUNCTION_11_3()
{
  return sub_1B5B72B30();
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  *(void *)(v3 + *(int *)(v1 + 36)) = 0x3FF0000000000000;
  return sub_1B5BAC250(v2, v0);
}

uint64_t OUTLINED_FUNCTION_18_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long a13)
{
  *(_OWORD *)(a1 + 16) = a13;
  *(void *)(a1 + 32) = v13;
  return sub_1B5BC9FF0();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_18_1()
{
  uint64_t v4 = v2[6];
  uint64_t v5 = v2[7];
  uint64_t v6 = *(void **)(v1 + v4);
  *(void *)(v0 + v4) = v6;
  uint64_t v7 = (void *)(v0 + v5);
  uint64_t v8 = (void *)(v1 + v5);
  uint64_t v9 = v8[1];
  void *v7 = *v8;
  v7[1] = v9;
  *(unsigned char *)(v0 + v2[8]) = *(unsigned char *)(v1 + v2[8]);
  return v6;
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return sub_1B5BC9F00();
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_18_4()
{
  return sub_1B5B743FC();
}

uint64_t OUTLINED_FUNCTION_18_5@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 + 88) = v1;
  *(void *)(v2 + 96) = a1;
  type metadata accessor for SGBannerIconParams(0);
  return sub_1B5BC9230();
}

uint64_t OUTLINED_FUNCTION_19_1(uint64_t a1)
{
  return a1 - 8;
}

id OUTLINED_FUNCTION_9_0()
{
  return [v0 (SEL)(v1 + 1168)];
}

id OUTLINED_FUNCTION_9_1(uint64_t a1)
{
  uint64_t v4 = *(int *)(a1 + 48);
  uint64_t v5 = v1 + v4;
  *(unsigned char *)uint64_t v5 = *(unsigned char *)(v2 + v4);
  *(unsigned char *)(v5 + 1) = *(unsigned char *)(v2 + v4 + 1);
  *(unsigned char *)(v5 + 2) = *(unsigned char *)(v2 + v4 + 2);
  *(void *)(v5 + 8) = *(void *)(v2 + v4 + 8);
  *(void *)(v5 + 16) = *(void *)(v2 + v4 + 16);
  *(void *)(v5 + 24) = *(void *)(v2 + v4 + 24);
  uint64_t v6 = *(void **)(v2 + v4 + 32);
  *(void *)(v5 + 32) = v6;
  return v6;
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  uint64_t v5 = (void *)(v2 + *(int *)(v1 + 36));
  *uint64_t v5 = v3;
  v5[1] = v0;
  return swift_retain();
}

id OUTLINED_FUNCTION_9_5()
{
  return objc_msgSend(v0, (SEL)(v2 + 750), v1);
}

uint64_t OUTLINED_FUNCTION_9_6()
{
  uint64_t v3 = *(int *)(v0 + 64);
  *(void *)(v2 + *(int *)(v0 + 60)) = *(void *)(v1 + *(int *)(v0 + 60));
  *(unsigned char *)(v2 + v3) = *(unsigned char *)(v1 + v3);
  return v2;
}

uint64_t OUTLINED_FUNCTION_9_7(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  a1[2].n128_u64[0] = v2;
  return sub_1B5BC9FF0();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_slowAlloc();
}

id OUTLINED_FUNCTION_1_4()
{
  return objc_msgSend(v0, (SEL)(v2 + 750), v1);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
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

uint64_t OUTLINED_FUNCTION_21()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_87()
{
  return sub_1B5BC9230();
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return sub_1B5BC9830();
}

void OUTLINED_FUNCTION_21_3()
{
  *(void *)(v1 + *(int *)(v0 + 60)) = *(void *)(v2 + *(int *)(v0 + 60));
  *(unsigned char *)(v1 + *(int *)(v0 + 64)) = *(unsigned char *)(v2 + *(int *)(v0 + 64));
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_35()
{
  return v0;
}

id OUTLINED_FUNCTION_24_2()
{
  return [v0 (SEL)(v1 + 1944)];
}

uint64_t OUTLINED_FUNCTION_24_3()
{
  return sub_1B5BAC1FC(v1, v0, v2);
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

void OUTLINED_FUNCTION_17_0()
{
  *(unsigned char *)(v0 + *(int *)(v2 + 44)) = *(unsigned char *)(v1 + *(int *)(v2 + 44));
}

uint64_t OUTLINED_FUNCTION_17_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(void *)(v13 + *(int *)(v12 + 60)) = *(void *)(v14 + *(int *)(v12 + 60));
  *(unsigned char *)(v13 + *(int *)(v12 + 64)) = *(unsigned char *)(v14 + *(int *)(v12 + 64));
  *(unsigned char *)(v10 + *(int *)(a10 + 28)) = *(unsigned char *)(v11 + *(int *)(a10 + 28));
  return v10;
}

id OUTLINED_FUNCTION_17_3()
{
  return sub_1B5B72B30();
}

uint64_t OUTLINED_FUNCTION_17_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_6()
{
  *(void *)(v2 + *(int *)(v1 + 60)) = *(void *)(v3 + *(int *)(v1 + 60));
  *(unsigned char *)(v2 + *(int *)(v1 + 64)) = *(unsigned char *)(v3 + *(int *)(v1 + 64));
  return v0;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_10_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18)
{
  return sub_1B5B77EE8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v18 + 48, 0.0, 1, 0.0, 1, a1, a2, a15, a16, a17, a18);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  uint64_t v4 = *(void *)(v2 - 184);
  return sub_1B5BAC1FC(v1, v4, v0);
}

id OUTLINED_FUNCTION_10_5()
{
  return [v0 (SEL)(v1 + 1944)];
}

char *OUTLINED_FUNCTION_10_6()
{
  long long v2 = v1[1];
  *uint64_t v0 = *v1;
  v0[1] = v2;
  long long v3 = v1[3];
  v0[2] = v1[2];
  v0[3] = v3;
  v0[4] = v1[4];
  return (char *)v0 + *(int *)(type metadata accessor for SGBannerPaddingParams(0) + 56);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return 0;
}

void OUTLINED_FUNCTION_13_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_13_3()
{
}

uint64_t OUTLINED_FUNCTION_13_4(uint64_t result, uint64_t a2)
{
  *(_DWORD *)__n128 result = *(_DWORD *)a2;
  *(unsigned char *)(result + 4) = *(unsigned char *)(a2 + 4);
  *(_WORD *)(result + 5) = *(_WORD *)(a2 + 5);
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
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

uint64_t OUTLINED_FUNCTION_51_2()
{
  return sub_1B5BAC250(v1, v0);
}

uint64_t OUTLINED_FUNCTION_51_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_53_1()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_53_2()
{
  uint64_t v4 = *(void *)(v2 - 104);
  return sub_1B5BAC1FC(v1, v4, v0);
}

uint64_t OUTLINED_FUNCTION_55()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_55_0(uint64_t a1)
{
  return v1 + *(int *)(a1 + 56);
}

uint64_t OUTLINED_FUNCTION_55_1@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = result + a3;
  *(_DWORD *)uint64_t v3 = *(_DWORD *)(a2 + a3);
  *(unsigned char *)(v3 + 4) = *(unsigned char *)(a2 + a3 + 4);
  *(_WORD *)(v3 + 5) = *(_WORD *)(a2 + a3 + 5);
  return result;
}

uint64_t OUTLINED_FUNCTION_57(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
}

uint64_t OUTLINED_FUNCTION_115()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_63(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, a1);
}

uint64_t OUTLINED_FUNCTION_63_0@<X0>(uint64_t a1@<X8>)
{
  return v1 + a1;
}

unsigned char *OUTLINED_FUNCTION_39()
{
  v1[16] = v0[16];
  v1[17] = v0[17];
  v1[18] = v0[18];
  return v1;
}

uint64_t OUTLINED_FUNCTION_39_0@<X0>(void *a1@<X8>)
{
  return SGBannerContainerView.init(_:store:updateBannerView:)(v1, 0, a1);
}

uint64_t OUTLINED_FUNCTION_39_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_56()
{
  return 0;
}

id OUTLINED_FUNCTION_12(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, 0, v3, 0, v4);
}

void OUTLINED_FUNCTION_12_1(uint64_t a1@<X8>)
{
  uint64_t v3 = (unsigned char *)(v1 + a1);
  *uint64_t v3 = *(unsigned char *)(v2 + a1);
  v3[1] = *(unsigned char *)(v2 + a1 + 1);
  v3[2] = *(unsigned char *)(v2 + a1 + 2);
  v3[3] = *(unsigned char *)(v2 + a1 + 3);
  v3[4] = *(unsigned char *)(v2 + a1 + 4);
  v3[5] = *(unsigned char *)(v2 + a1 + 5);
  v3[6] = *(unsigned char *)(v2 + a1 + 6);
}

uint64_t OUTLINED_FUNCTION_72_0()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_12_2()
{
  return 0xD00000000000002ELL;
}

unint64_t OUTLINED_FUNCTION_12_3()
{
  return 0xD000000000000025;
}

unsigned char *OUTLINED_FUNCTION_12_4(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  result[1] = a2[1];
  result[2] = a2[2];
  return result;
}

uint64_t OUTLINED_FUNCTION_76_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_76_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_16_3()
{
  return sub_1B5BCA0C0();
}

uint64_t OUTLINED_FUNCTION_16_4()
{
  uint64_t v4 = *(int *)(v0 + 52);
  uint64_t v5 = v2 + v4;
  uint64_t v6 = v1 + v4;
  uint64_t v7 = *(void *)(v6 + 8);
  *(void *)uint64_t v5 = *(void *)v6;
  *(void *)(v5 + 8) = v7;
  *(_WORD *)(v5 + 16) = *(_WORD *)(v6 + 16);
  uint64_t v8 = *(int *)(v0 + 56);
  uint64_t v9 = (_OWORD *)(v2 + v8);
  uint64_t v10 = (_OWORD *)(v1 + v8);
  long long v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  long long v12 = v10[3];
  v9[2] = v10[2];
  v9[3] = v12;
  v9[4] = v10[4];
  return type metadata accessor for SGBannerPaddingParams(0);
}

uint64_t OUTLINED_FUNCTION_16_5()
{
  uint64_t v4 = *(int *)(v2 + 36);
  uint64_t v5 = (void *)(v0 + v4);
  uint64_t v6 = (void *)(v1 + v4);
  uint64_t v7 = v6[1];
  *uint64_t v5 = *v6;
  v5[1] = v7;
  return sub_1B5BCA080();
}

unint64_t OUTLINED_FUNCTION_16_6()
{
  return sub_1B5BB518C();
}

__n128 OUTLINED_FUNCTION_16_7(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  __n128 result = *(__n128 *)(a2 + 8);
  *(__n128 *)(a1 + 8) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  return sub_1B5BC91A0();
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  *(_DWORD *)uint64_t v0 = *(_DWORD *)v1;
  *(unsigned char *)(v0 + 4) = *(unsigned char *)(v1 + 4);
  *(_WORD *)(v0 + 5) = *(_WORD *)(v1 + 5);
  *(_OWORD *)(v0 + 8) = *(_OWORD *)(v1 + 8);
  return type metadata accessor for SGBannerViewModel(0);
}

uint64_t OUTLINED_FUNCTION_20_4()
{
  return sub_1B5BAC1FC(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_20_5()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_20_6()
{
  *(void *)(v0 + 96) = *(void *)(v1 + 96);
  return sub_1B5BC9230();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_34(uint64_t result)
{
  *(void *)uint64_t v1 = v2;
  *(void *)(v1 + 8) = v3;
  *(unsigned char *)(v1 + 16) = v4 & 1;
  *(void *)(v1 + 24) = v5;
  *(void *)(v1 + 32) = result;
  *(void *)(v1 + 40) = 1;
  *(unsigned char *)(v1 + 48) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_34_0@<X0>(uint64_t a1@<X8>)
{
  char v4 = (_OWORD *)(v2 + a1);
  long long v5 = v4[1];
  *uint64_t v1 = *v4;
  v1[1] = v5;
  long long v6 = v4[3];
  v1[2] = v4[2];
  v1[3] = v6;
  v1[4] = v4[4];
  return type metadata accessor for SGBannerPaddingParams(0);
}

uint64_t OUTLINED_FUNCTION_34_1()
{
  *(void *)(v0 + 64) = *(void *)(v1 + 64);
  *(void *)(v0 + 72) = *(void *)(v1 + 72);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_34_2()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_73@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_40_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  *(void *)(v13 + *(int *)(v12 + 60)) = *(void *)(v14 + *(int *)(v12 + 60));
  *(unsigned char *)(v13 + *(int *)(v12 + 64)) = *(unsigned char *)(v14 + *(int *)(v12 + 64));
  *(unsigned char *)(v10 + *(int *)(a10 + 24)) = *(unsigned char *)(v11 + *(int *)(a10 + 24));
  return v10;
}

void OUTLINED_FUNCTION_37(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_137(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)uint64_t v4 = result;
  *(void *)(v4 + 8) = a2;
  *(unsigned char *)(v4 + 16) = a3 & 1;
  *(void *)(v4 + 24) = a4;
  return result;
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_101()
{
  return v0;
}

void OUTLINED_FUNCTION_101_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_103_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 248) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_72_1()
{
  uint64_t v3 = *(void *)(v1 + 56);
  *(void *)(v0 + 48) = *(void *)(v1 + 48);
  *(void *)(v0 + 56) = v3;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_42()
{
  return sub_1B5BC9830();
}

uint64_t OUTLINED_FUNCTION_45(uint64_t a1)
{
  return *(void *)a1;
}

void OUTLINED_FUNCTION_42_0()
{
  *(void *)(v1 + *(int *)(v0 + 60)) = *(void *)(v2 + *(int *)(v0 + 60));
  *(unsigned char *)(v1 + *(int *)(v0 + 64)) = *(unsigned char *)(v2 + *(int *)(v0 + 64));
}

void OUTLINED_FUNCTION_42_1()
{
  *(void *)(v0 + *(int *)(v2 + 60)) = *(void *)(v1 + *(int *)(v2 + 60));
  *(unsigned char *)(v0 + *(int *)(v2 + 64)) = *(unsigned char *)(v1 + *(int *)(v2 + 64));
}

uint64_t OUTLINED_FUNCTION_42_2()
{
  return type metadata accessor for SGSuggestionsTableView(0);
}

uint64_t OUTLINED_FUNCTION_42_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 248) = (char *)&a9 - v9;
  return 0;
}

double OUTLINED_FUNCTION_42_4(double *a1)
{
  double result = *a1;
  *(double *)(v1 + 64) = *a1;
  return result;
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return swift_storeEnumTagMultiPayload();
}

__n128 OUTLINED_FUNCTION_46_1(uint64_t a1)
{
  uint64_t v3 = *(int *)(a1 + 48);
  uint64_t v4 = v2 + v3;
  *(unsigned char *)uint64_t v4 = *(unsigned char *)(v1 + v3);
  *(_WORD *)(v4 + 1) = *(_WORD *)(v1 + v3 + 1);
  __n128 result = *(__n128 *)(v1 + v3 + 8);
  *(__n128 *)(v4 + 8) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_46_2()
{
  uint64_t v4 = *(void *)(v2 - 152);
  return sub_1B5BAC1FC(v1, v4, v0);
}

uint64_t OUTLINED_FUNCTION_46_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_109()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_86_0(uint64_t a1)
{
  return v1 + *(int *)(a1 + 56);
}

id OUTLINED_FUNCTION_49(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  return v3;
}

uint64_t OUTLINED_FUNCTION_49_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_49_3()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_49_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_98()
{
  return type metadata accessor for SGBannerContainerView(0);
}

uint64_t OUTLINED_FUNCTION_112()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_114()
{
  return type metadata accessor for SGBannerViewModel(0);
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  uint64_t v10 = v3 + *(int *)(*(void *)(v4 - 232) + 36);
  *(unsigned char *)uint64_t v10 = v0;
  *(void *)(v10 + 8) = v6;
  *(void *)(v10 + 16) = v7;
  *(void *)(v10 + 24) = v8;
  *(void *)(v10 + 32) = v9;
  *(unsigned char *)(v10 + 40) = 0;
  return sub_1B5B7E758(v1, v2);
}

uint64_t OUTLINED_FUNCTION_22_3(uint64_t a1)
{
  return v1 + *(int *)(a1 + 56);
}

uint64_t OUTLINED_FUNCTION_22_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  *(void *)(v0 + 48) = *(void *)(v1 + 48);
  *(void *)(v0 + 56) = *(void *)(v1 + 56);
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_35_1()
{
  return objc_msgSend(v0, (SEL)(v2 + 750), v1);
}

uint64_t OUTLINED_FUNCTION_35_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_35_3()
{
  uint64_t v7 = (void *)(v3 + *(int *)(v1 + 36));
  void *v7 = v4;
  v7[1] = v0;
  return sub_1B5BAC250(v2, v5);
}

void OUTLINED_FUNCTION_60_0(uint64_t a1@<X8>)
{
  *(_WORD *)(a1 + 8) = 256;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void __swift_store_extra_inhabitant_indexTm()
{
  OUTLINED_FUNCTION_91();
  if (v3)
  {
    *uint64_t v1 = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    type metadata accessor for SGBannerViewModel(0);
    uint64_t v5 = OUTLINED_FUNCTION_63_0(*(int *)(v4 + 20));
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void OUTLINED_FUNCTION_38_0()
{
  sub_1B5B82F08();
}

id OUTLINED_FUNCTION_38_1()
{
  return [v0 (SEL)(v1 + 1944)];
}

uint64_t OUTLINED_FUNCTION_38_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_120()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return v0;
}

void OUTLINED_FUNCTION_29_2(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 240) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_66_0(uint64_t a1)
{
  return __swift_storeEnumTagSinglePayload(v1, 0, 1, a1);
}

__n128 OUTLINED_FUNCTION_44_0()
{
  uint64_t v3 = v0 + *(int *)(v1 + 36);
  long long v4 = *(_OWORD *)(v2 - 96);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(v2 - 112);
  *(_OWORD *)(v3 + 16) = v4;
  __n128 result = *(__n128 *)(v2 - 80);
  *(__n128 *)(v3 + 32) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_44_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_144()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_44_2()
{
  return sub_1B5BC9F00();
}

uint64_t OUTLINED_FUNCTION_44_3(uint64_t result)
{
  *(unsigned char *)(v1 - 1) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_50_1()
{
  *(_DWORD *)uint64_t v1 = *(_DWORD *)v0;
  *(unsigned char *)(v1 + 4) = *(unsigned char *)(v0 + 4);
  *(_WORD *)(v1 + 5) = *(_WORD *)(v0 + 5);
  uint64_t v3 = *(void *)(v0 + 16);
  *(void *)(v1 + 8) = *(void *)(v0 + 8);
  *(void *)(v1 + 16) = v3;
  return type metadata accessor for SGBannerViewModel(0);
}

uint64_t OUTLINED_FUNCTION_50_2()
{
  return sub_1B5BAC250(v0, v1);
}

uint64_t OUTLINED_FUNCTION_50_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_54_0(uint64_t result)
{
  *(unsigned char *)(v1 + *(int *)(result + 48)) = *(unsigned char *)(v2 + *(int *)(result + 48));
  return result;
}

void OUTLINED_FUNCTION_54_1(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *(void *)uint64_t v1 = *(void *)a1;
  *(void *)(v1 + 8) = v2;
  *(_WORD *)(v1 + 16) = *(_WORD *)(a1 + 16);
}

unint64_t OUTLINED_FUNCTION_54_2()
{
  return sub_1B5BA1FB4();
}

uint64_t OUTLINED_FUNCTION_54_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_133()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_71(uint64_t result, int a2)
{
  *(void *)(result + 8) = (a2 - 1);
  return result;
}

uint64_t OUTLINED_FUNCTION_71_1()
{
  uint64_t v3 = *(void *)(v1 + 72);
  *(void *)(v0 + 64) = *(void *)(v1 + 64);
  *(void *)(v0 + 72) = v3;
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_94_0(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *(void *)uint64_t v1 = *(void *)a1;
  *(void *)(v1 + 8) = v2;
  *(_WORD *)(v1 + 16) = *(_WORD *)(a1 + 16);
}

uint64_t OUTLINED_FUNCTION_97_0()
{
  return v0;
}

void *OUTLINED_FUNCTION_64_0(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_73_1()
{
  return sub_1B5BC9080();
}

uint64_t OUTLINED_FUNCTION_65_0()
{
  return v0;
}

void OUTLINED_FUNCTION_65_1(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = v1;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = 0;
}

uint64_t OUTLINED_FUNCTION_75()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_75_0()
{
  return v0;
}

void OUTLINED_FUNCTION_75_1(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = v1;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = 0;
}

uint64_t OUTLINED_FUNCTION_130()
{
  return sub_1B5BC9230();
}

void OUTLINED_FUNCTION_106()
{
  *(unsigned char *)(v0 + *(int *)(v2 + 32)) = *(unsigned char *)(v1 + *(int *)(v2 + 32));
}

uint64_t OUTLINED_FUNCTION_68()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_68_0()
{
  *(void *)(v0 + 8) = *(void *)(v1 + 8);
  return swift_release();
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void *OUTLINED_FUNCTION_36()
{
  return memcpy(v1, (const void *)(v0 + 240), 0x90uLL);
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_36_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_36_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return a9;
}

uint64_t OUTLINED_FUNCTION_33()
{
  return sub_1B5BC93C0();
}

uint64_t OUTLINED_FUNCTION_33_0(uint64_t a1)
{
  return v1 + *(int *)(a1 + 56);
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  return v0;
}

unint64_t OUTLINED_FUNCTION_110()
{
  return sub_1B5B8AE2C();
}

uint64_t OUTLINED_FUNCTION_110_0()
{
  return swift_initStructMetadata();
}

uint64_t OUTLINED_FUNCTION_83()
{
  return type metadata accessor for SGSuggestionsTableCell(0);
}

void OUTLINED_FUNCTION_83_0()
{
  *(void *)(v0 + *(int *)(v2 + 60)) = *(void *)(v1 + *(int *)(v2 + 60));
}

id OUTLINED_FUNCTION_83_1()
{
  uint64_t v3 = *(void **)(v1 + 40);
  *(void *)(v0 + 40) = v3;
  return v3;
}

uint64_t OUTLINED_FUNCTION_113()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return v0;
}

void *OUTLINED_FUNCTION_70(void *result, int a2)
{
  *uint64_t result = (a2 - 1);
  return result;
}

void OUTLINED_FUNCTION_47_0()
{
  uint64_t v3 = *(int *)(v0 + 28);
  *(void *)(v2 + *(int *)(v0 + 24)) = *(void *)(v1 + *(int *)(v0 + 24));
  *(unsigned char *)(v2 + v3) = *(unsigned char *)(v1 + v3);
}

uint64_t OUTLINED_FUNCTION_47_1()
{
  return sub_1B5BCA080();
}

uint64_t OUTLINED_FUNCTION_47_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_28()
{
  uint64_t v8 = v1 + *(int *)(*(void *)(v3 - 216) + 36);
  *(unsigned char *)uint64_t v8 = v0;
  *(void *)(v8 + 8) = v4;
  *(void *)(v8 + 16) = v5;
  *(void *)(v8 + 24) = v6;
  *(void *)(v8 + 32) = v7;
  *(unsigned char *)(v8 + 40) = 0;
  return v2;
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  *(void *)(v1 + *(int *)(v0 + 52)) = *(void *)(v2 + *(int *)(v0 + 52));
  return swift_release();
}

void OUTLINED_FUNCTION_28_2()
{
  *(unsigned char *)(v0 + 16) = *(unsigned char *)(v1 + 16);
  *(unsigned char *)(v0 + 17) = *(unsigned char *)(v1 + 17);
}

void OUTLINED_FUNCTION_28_3(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 184) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_28_5()
{
  *(unsigned char *)(v1 + 16) = *(unsigned char *)(v0 + 16);
  *(unsigned char *)(v1 + 17) = *(unsigned char *)(v0 + 17);
  return v1;
}

uint64_t OUTLINED_FUNCTION_99()
{
  *uint64_t v0 = *v1;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_31_1()
{
  return v0;
}

void OUTLINED_FUNCTION_31_2(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_31_4()
{
  return sub_1B5BC9230();
}

uint64_t OUTLINED_FUNCTION_129()
{
  return sub_1B5BC9230();
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_37_1(uint64_t a1, uint64_t a2)
{
  *(_WORD *)(v2 + 16) = *(_WORD *)(a2 + 16);
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_37_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_37_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_78_0()
{
  *(void *)(v0 + 96) = *(void *)(v1 + 96);
  return type metadata accessor for SGBannerIconParams(0);
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_48_1()
{
  return 0;
}

void OUTLINED_FUNCTION_48_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  *(void *)(v21 + *(int *)(v23 + 60)) = *(void *)(v22 + *(int *)(v23 + 60));
  *(unsigned char *)(v21 + *(int *)(v23 + 64)) = *(unsigned char *)(v22 + *(int *)(v23 + 64));
  *(unsigned char *)(v20 + *(int *)(a19 + 28)) = *(unsigned char *)(a20 + *(int *)(a19 + 28));
}

void OUTLINED_FUNCTION_48_3()
{
  *(_DWORD *)(v1 + *(int *)(v0 + 36)) = v2;
}

void OUTLINED_FUNCTION_67()
{
  v0[10] = 0;
  v0[11] = 0;
  v0[12] = 0;
  v0[2] = 0;
}

uint64_t OUTLINED_FUNCTION_70_0()
{
  return type metadata accessor for SGBannerContainerView(0);
}

uint64_t OUTLINED_FUNCTION_70_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 0, 1, a4);
}

void OUTLINED_FUNCTION_77_0()
{
  uint64_t v3 = *(void **)(v0 + 88);
  *(void *)(v0 + 88) = *(void *)(v1 + 88);
}

void OUTLINED_FUNCTION_79_1()
{
  uint64_t v3 = *(void **)(v0 + 40);
  *(void *)(v0 + 40) = *(void *)(v1 + 40);
}

uint64_t OUTLINED_FUNCTION_90()
{
  return swift_getEnumCaseMultiPayload();
}

void OUTLINED_FUNCTION_90_0()
{
  uint64_t v3 = *(void **)(v0 + 80);
  *(void *)(v0 + 80) = *(void *)(v1 + 80);
}

id OUTLINED_FUNCTION_81_0()
{
  uint64_t v3 = *(void **)(v1 + 80);
  *(void *)(v0 + 80) = v3;
  return v3;
}

uint64_t OUTLINED_FUNCTION_61(uint64_t result, uint64_t a2)
{
  *(_WORD *)(result + 16) = *(_WORD *)(a2 + 16);
  *(unsigned char *)(result + 18) = *(unsigned char *)(a2 + 18);
  return result;
}

uint64_t OUTLINED_FUNCTION_61_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_61_1()
{
  uint64_t v3 = v1[8];
  v0[7] = v1[7];
  v0[8] = v3;
  uint64_t v4 = v1[10];
  v0[9] = v1[9];
  v0[10] = v4;
  uint64_t v5 = v1[12];
  v0[11] = v1[11];
  v0[12] = v5;
  return type metadata accessor for SGBannerIconParams(0);
}

id OUTLINED_FUNCTION_80_0()
{
  uint64_t v3 = *(void **)(v1 + 88);
  *(void *)(v0 + 88) = v3;
  return v3;
}

void OUTLINED_FUNCTION_91_0(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + *(int *)(a1 + 48) + 32);
}

void OUTLINED_FUNCTION_85_0(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = v1;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = 0;
}

void *OUTLINED_FUNCTION_118(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_92()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_74_0()
{
  return v0;
}

void OUTLINED_FUNCTION_74_1(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;
}

void OUTLINED_FUNCTION_102_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 232) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_93()
{
  *(unsigned char *)(v2 + *(int *)(v0 + 36)) = *(unsigned char *)(v1 + *(int *)(v0 + 36));
  return v2;
}

void OUTLINED_FUNCTION_93_0()
{
  *(void *)(v1 + *(int *)(v0 + 60)) = *(void *)(v2 + *(int *)(v0 + 60));
  *(unsigned char *)(v1 + *(int *)(v0 + 64)) = *(unsigned char *)(v2 + *(int *)(v0 + 64));
}

uint64_t OUTLINED_FUNCTION_128()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_108()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_96()
{
  return sub_1B5B843B8();
}

uint64_t OUTLINED_FUNCTION_96_0@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 + 88) = v1;
  *(void *)(v2 + 96) = a1;
  return type metadata accessor for SGBannerIconParams(0);
}

void OUTLINED_FUNCTION_100()
{
  sub_1B5B82F08();
}

uint64_t OUTLINED_FUNCTION_52@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  *uint64_t v0 = *v1;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_52_1()
{
  return sub_1B5BC9230();
}

uint64_t OUTLINED_FUNCTION_52_2()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_52_3()
{
  return v0;
}

void OUTLINED_FUNCTION_45_1()
{
  *(void *)(v2 - 120) = v1;
  *(void *)(v2 - 144) = v0;
}

unsigned char *OUTLINED_FUNCTION_45_2(unsigned char *result, char a2)
{
  *uint64_t result = a2 + 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_45_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return sub_1B5BC93C0();
}

uint64_t OUTLINED_FUNCTION_32_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return a10;
}

uint64_t OUTLINED_FUNCTION_23_2(uint64_t a1)
{
  return v1 + *(int *)(a1 + 56);
}

uint64_t OUTLINED_FUNCTION_23_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_23_4()
{
  uint64_t v4 = *(void *)(v2 - 112);
  return sub_1B5BAC1FC(v1, v4, v0);
}

uint64_t OUTLINED_FUNCTION_69()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_69_0()
{
  *(void *)(v0 + 96) = *(void *)(v1 + 96);
  return type metadata accessor for SGBannerIconParams(0);
}

id OUTLINED_FUNCTION_56_1(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2, v9 & 1);
}

id OUTLINED_FUNCTION_19_3()
{
  return sub_1B5BA0B84(v0, v2, 2, (void *)(v3 - 144), v1);
}

uint64_t OUTLINED_FUNCTION_19_4()
{
  return sub_1B5B7E3E8(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_19_5()
{
  return sub_1B5BC9340();
}

double OUTLINED_FUNCTION_19_6(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  double result = *(double *)(a2 + 24);
  *(double *)(a1 + 24) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_43_1()
{
  *(void *)(v1 + *(int *)(v0 + 52)) = *(void *)(v2 + *(int *)(v0 + 52));
  return swift_retain();
}

id OUTLINED_FUNCTION_43_2()
{
  return sub_1B5B72B30();
}

double OUTLINED_FUNCTION_43_5(double *a1)
{
  double result = *a1;
  *(double *)(v1 + 40) = *a1;
  return result;
}

uint64_t OUTLINED_FUNCTION_88()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_121()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_62()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_62_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_62_1@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 + a1) = *(void *)(v3 + a1);
  uint64_t v4 = v2 + v1;
  uint64_t v5 = (uint64_t *)(v3 + v1);
  uint64_t result = *v5;
  uint64_t v7 = v5[1];
  *(void *)uint64_t v4 = *v5;
  *(void *)(v4 + 8) = v7;
  *(unsigned char *)(v4 + 16) = *((unsigned char *)v5 + 16);
  return result;
}

uint64_t __swift_get_extra_inhabitant_indexTm()
{
  OUTLINED_FUNCTION_132();
  if (v3) {
    return OUTLINED_FUNCTION_73(*v1);
  }
  uint64_t v5 = OUTLINED_FUNCTION_114();
  uint64_t v6 = (uint64_t)v1 + *(int *)(v2 + 20);
  return __swift_getEnumTagSinglePayload(v6, v0, v5);
}

id OUTLINED_FUNCTION_84_0(void **a1, void **a2)
{
  char v3 = *a2;
  *a1 = *a2;
  return v3;
}

uint64_t OUTLINED_FUNCTION_127()
{
  return type metadata accessor for SGBannerPaddingParams(0);
}

uint64_t OUTLINED_FUNCTION_104()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_104_0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 256) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void *OUTLINED_FUNCTION_89(uint64_t a1, uint64_t a2, size_t a3)
{
  return memcpy(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_89_0()
{
  long long v3 = v1[1];
  *uint64_t v0 = *v1;
  v0[1] = v3;
  long long v4 = v1[3];
  v0[2] = v1[2];
  v0[3] = v4;
  v0[4] = v1[4];
  return type metadata accessor for SGBannerPaddingParams(0);
}

uint64_t OUTLINED_FUNCTION_82()
{
  return 0;
}

void OUTLINED_FUNCTION_82_0()
{
  v1[8] = v0[8];
  v1[9] = v0[9];
  v1[10] = v0[10];
}

__n128 OUTLINED_FUNCTION_107_0()
{
  *(unsigned char *)uint64_t v1 = *(unsigned char *)v0;
  *(_WORD *)(v1 + 1) = *(_WORD *)(v0 + 1);
  __n128 result = *(__n128 *)(v0 + 8);
  *(__n128 *)(v1 + 8) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_122()
{
  return v0;
}

uint64_t __swift_memcpy3_1(uint64_t result, __int16 *a2)
{
  __int16 v2 = *a2;
  *(unsigned char *)(result + 2) = *((unsigned char *)a2 + 2);
  *(_WORD *)__n128 result = v2;
  return result;
}

void *sub_1B5B72644()
{
  return &unk_1B5BCC250;
}

void *sub_1B5B72650()
{
  return &unk_1B5BCC258;
}

void *sub_1B5B7265C()
{
  return &unk_1B5BCC260;
}

void *sub_1B5B72668()
{
  return &unk_1B5BCC268;
}

void *sub_1B5B72674()
{
  return &unk_1B5BCC270;
}

void *sub_1B5B72680()
{
  return &unk_1B5BCC278;
}

void *sub_1B5B7268C()
{
  return &unk_1B5BCC280;
}

void *sub_1B5B72698()
{
  return &unk_1B5BCC288;
}

void *sub_1B5B726A4()
{
  return &unk_1B5BCC290;
}

void *sub_1B5B726B0()
{
  return &unk_1B5BCC298;
}

void *sub_1B5B726BC()
{
  return &unk_1B5BCC2A0;
}

void *sub_1B5B726C8()
{
  return &unk_1B5BCC2A8;
}

void *sub_1B5B726D4()
{
  return &unk_1B5BCC2B0;
}

void *sub_1B5B726E0()
{
  return &unk_1B5BCC2B8;
}

void *sub_1B5B726EC()
{
  return &unk_1B5BCC2C0;
}

void *sub_1B5B726F8()
{
  return &unk_1B5BCC2C8;
}

void *sub_1B5B72704()
{
  return &unk_1B5BCC2D0;
}

void *sub_1B5B72710()
{
  return &unk_1B5BCC2D8;
}

void *sub_1B5B7271C()
{
  return &unk_1B5BCC2E0;
}

void *sub_1B5B72728()
{
  return &unk_1B5BCC2E8;
}

void *sub_1B5B72734()
{
  return &unk_1B5BCC2F0;
}

void *sub_1B5B72740()
{
  return &unk_1B5BCC2F8;
}

void *sub_1B5B7274C()
{
  return &unk_1B5BCC300;
}

void *sub_1B5B72758()
{
  return &unk_1B5BCC308;
}

void *sub_1B5B72764()
{
  return &unk_1B5BCC310;
}

void *sub_1B5B72770()
{
  return &unk_1B5BCC318;
}

void *sub_1B5B7277C()
{
  return &unk_1B5BCC328;
}

void *sub_1B5B72788()
{
  return &unk_1B5BCC330;
}

void *sub_1B5B72794()
{
  return &unk_1B5BCC340;
}

void *sub_1B5B727A0()
{
  return &unk_1B5BCC348;
}

void *sub_1B5B727AC()
{
  return &unk_1B5BCC350;
}

void *sub_1B5B727B8()
{
  return &unk_1B5BCC358;
}

void *sub_1B5B727C4()
{
  return &unk_1B5BCC360;
}

void *sub_1B5B727D0()
{
  return &unk_1B5BCC368;
}

void *sub_1B5B727DC()
{
  return &unk_1B5BCC370;
}

void *sub_1B5B727E8()
{
  return &unk_1B5BCC378;
}

void *sub_1B5B727F4()
{
  return &unk_1B5BCC380;
}

void *sub_1B5B72800()
{
  return &unk_1B5BCC390;
}

void *sub_1B5B7280C()
{
  return &unk_1B5BCC398;
}

void *sub_1B5B72818()
{
  return &unk_1B5BCC3A0;
}

void *sub_1B5B72824()
{
  return &unk_1B5BCC3A8;
}

void *sub_1B5B72830()
{
  return &unk_1B5BCC3B0;
}

void *sub_1B5B7283C()
{
  return &unk_1B5BCC3B8;
}

void *sub_1B5B72848()
{
  return &unk_1B5BCC3C0;
}

void *sub_1B5B72854()
{
  return &unk_1B5BCC3C8;
}

void *sub_1B5B72860()
{
  return &unk_1B5BCC3D0;
}

void *sub_1B5B7286C()
{
  return &unk_1B5BCC3D8;
}

void *sub_1B5B72878()
{
  return &unk_1B5BCC3E0;
}

void *sub_1B5B72884()
{
  return &unk_1B5BCC3E8;
}

void *sub_1B5B72890()
{
  return &unk_1B5BCC3F0;
}

void *sub_1B5B7289C()
{
  return &unk_1B5BCC3F8;
}

void *sub_1B5B728A8()
{
  return &unk_1B5BCC400;
}

void *sub_1B5B728B4()
{
  return &unk_1B5BCC408;
}

void *sub_1B5B728C0()
{
  return &unk_1B5BCC410;
}

void *sub_1B5B728CC()
{
  return &unk_1B5BCC418;
}

void sub_1B5B728D8()
{
  qword_1E9D966F8 = 0;
}

uint64_t *sub_1B5B728E4()
{
  if (qword_1E9D955F0 != -1) {
    swift_once();
  }
  return &qword_1E9D966F8;
}

void *sub_1B5B72930()
{
  return &unk_1B5BCC420;
}

void *sub_1B5B7293C()
{
  return &unk_1B5BCC430;
}

void *sub_1B5B72948()
{
  return &unk_1B5BCC438;
}

void *sub_1B5B72954()
{
  return &unk_1E612E020;
}

void *sub_1B5B72960()
{
  return &unk_1E612E030;
}

void *sub_1B5B7296C()
{
  return &unk_1E612E040;
}

void *sub_1B5B72978()
{
  return &unk_1E612E050;
}

void *sub_1B5B72984()
{
  return &unk_1E612E060;
}

void *sub_1B5B72990()
{
  return &unk_1E612E070;
}

void *sub_1B5B7299C()
{
  return &unk_1E612E080;
}

void *sub_1B5B729A8()
{
  return &unk_1E612E090;
}

void *sub_1B5B729B4()
{
  return &unk_1E612E0A0;
}

void *sub_1B5B729C0()
{
  return &unk_1E612E0B0;
}

const char *sub_1B5B729CC()
{
  return "suggestions";
}

unint64_t sub_1B5B729D8(unint64_t result)
{
  if (result >= 3) {
    return 3;
  }
  return result;
}

uint64_t sub_1B5B729E8(uint64_t result)
{
  return result;
}

BOOL sub_1B5B729F0(char *a1, char *a2)
{
  return sub_1B5B729FC(*a1, *a2);
}

BOOL sub_1B5B729FC(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1B5B72A0C()
{
  return sub_1B5B72A14();
}

uint64_t sub_1B5B72A14()
{
  return sub_1B5BCA1E0();
}

uint64_t sub_1B5B72A5C()
{
  return sub_1B5B72A64();
}

uint64_t sub_1B5B72A64()
{
  return sub_1B5BCA1D0();
}

uint64_t sub_1B5B72A8C()
{
  return sub_1B5B72A94();
}

uint64_t sub_1B5B72A94()
{
  return sub_1B5BCA1E0();
}

unint64_t sub_1B5B72AD8@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1B5B729D8(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1B5B72B04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B5B729E8(*v1);
  *a1 = result;
  return result;
}

id sub_1B5B72B30()
{
  sub_1B5B7447C(0, &qword_1EB841560);
  id result = sub_1B5B72BE8();
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = sub_1B5BC90B0();

    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1B5B72BE8()
{
  uint64_t v0 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleWithIdentifier_, v0);

  return v1;
}

uint64_t sub_1B5B72C4C()
{
  uint64_t v1 = sub_1B5BC9340();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  OUTLINED_FUNCTION_16_1();
  id v3 = objc_msgSend(self, sel_currentDevice);
  id v4 = objc_msgSend(v3, sel_userInterfaceIdiom);

  if (v4 == (id)6)
  {
    sub_1B5B7447C(0, &qword_1E9D93CC8);
    sub_1B5B72DE0(15461355);
    JUMPOUT(0x1BA9A7260);
  }
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v0, *MEMORY[0x1E4F3C5B8], v1);
  char v5 = sub_1B5BC9330();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  if (v5) {
    sub_1B5B93D78();
  }
  else {
    sub_1B5B93CD0();
  }
  return swift_retain();
}

id sub_1B5B72DE0(int a1)
{
  return sub_1B5B74404(BYTE2(a1), BYTE1(a1), a1);
}

uint64_t sub_1B5B72DF4()
{
  LOBYTE(v25[0]) = 0;
  OUTLINED_FUNCTION_6();
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(v0 + 344))();
  if (!v1)
  {
    OUTLINED_FUNCTION_7_0();
    v9 += 40;
    uint64_t v10 = *v9;
    (*v9)();
    if (v11 && (uint64_t v12 = sub_1B5BC9F70(), swift_bridgeObjectRelease(), v12 > 0) && (OUTLINED_FUNCTION_23_1(), v10(), v13))
    {
      sub_1B5B7447C(0, (unint64_t *)&unk_1E9D93CD0);
      OUTLINED_FUNCTION_22_1();
    }
    else
    {
      sub_1B5B7447C(0, (unint64_t *)&unk_1E9D93CD0);
      OUTLINED_FUNCTION_13();
    }
    id v2 = sub_1B5B73374();
    goto LABEL_10;
  }
  id v2 = v1;
  objc_msgSend(v1, sel_length);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v25;
  uint64_t v4 = OUTLINED_FUNCTION_27_0();
  *(void *)(v4 + 16) = sub_1B5B74634;
  *(void *)(v4 + 24) = v3;
  uint64_t v23 = sub_1B5B74648;
  uint64_t v24 = v4;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 1107296256;
  uint64_t v21 = sub_1B5B732B8;
  uint64_t v22 = &block_descriptor;
  char v5 = _Block_copy(&v19);
  swift_retain();
  uint64_t v6 = swift_release();
  OUTLINED_FUNCTION_12(v6, sel_enumerateAttributesInRange_options_usingBlock_);
  _Block_release(v5);
  char v7 = OUTLINED_FUNCTION_11_0(v4, (uint64_t)"");
  uint64_t result = swift_release();
  if ((v7 & 1) == 0)
  {
    swift_release();
LABEL_10:
    id v14 = objc_msgSend(v2, sel_string);
    uint64_t v15 = sub_1B5BC9F40();
    uint64_t v17 = v16;

    uint64_t v19 = v15;
    uint64_t v20 = v17;
    v25[0] = 10;
    v25[1] = 0xE100000000000000;
    sub_1B5B744B8();
    uint64_t v18 = sub_1B5BCA0D0();

    swift_bridgeObjectRelease();
    return v18;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B5B73098(uint64_t a1, char *a2)
{
  sub_1B5B74F10(a1, v27);
  uint64_t v3 = v27[0];
  int64_t v4 = v27[3];
  unint64_t v5 = v27[4];
  uint64_t v23 = v27[1];
  int64_t v24 = (unint64_t)(v27[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v7 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v8 = v7 | (v4 << 6);
  while (1)
  {
    uint64_t v13 = *(void **)(*(void *)(v3 + 48) + 8 * v8);
    sub_1B5B750B8(*(void *)(v3 + 56) + 32 * v8, (uint64_t)&v26);
    v25 = v13;
    uint64_t v14 = sub_1B5BC9F40();
    uint64_t v16 = v15;
    if (v14 == sub_1B5BC9F40() && v16 == v17)
    {
      id v22 = v13;
      swift_bridgeObjectRelease_n();
      char v21 = 1;
    }
    else
    {
      char v19 = sub_1B5BCA1B0();
      id v20 = v13;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v21 = v19 & 1;
    }
    *a2 = v21;
    uint64_t result = sub_1B5B75114((uint64_t)&v25);
    if (v5) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v9 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v9 >= v24) {
      return swift_release();
    }
    unint64_t v10 = *(void *)(v23 + 8 * v9);
    int64_t v11 = v4 + 1;
    if (!v10)
    {
      int64_t v11 = v4 + 2;
      if (v4 + 2 >= v24) {
        return swift_release();
      }
      unint64_t v10 = *(void *)(v23 + 8 * v11);
      if (!v10)
      {
        int64_t v11 = v4 + 3;
        if (v4 + 3 >= v24) {
          return swift_release();
        }
        unint64_t v10 = *(void *)(v23 + 8 * v11);
        if (!v10)
        {
          int64_t v11 = v4 + 4;
          if (v4 + 4 >= v24) {
            return swift_release();
          }
          unint64_t v10 = *(void *)(v23 + 8 * v11);
          if (!v10)
          {
            int64_t v11 = v4 + 5;
            if (v4 + 5 >= v24) {
              return swift_release();
            }
            unint64_t v10 = *(void *)(v23 + 8 * v11);
            if (!v10)
            {
              int64_t v12 = v4 + 6;
              while (v12 < v24)
              {
                unint64_t v10 = *(void *)(v23 + 8 * v12++);
                if (v10)
                {
                  int64_t v11 = v12 - 1;
                  goto LABEL_18;
                }
              }
              return swift_release();
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v5 = (v10 - 1) & v10;
    unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
    int64_t v4 = v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B5B732B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  type metadata accessor for Key(0);
  sub_1B5B74E98(&qword_1E9D93D78);
  uint64_t v9 = sub_1B5BC9EC0();
  v8(v9, a3, a4, a5);
  return swift_bridgeObjectRelease();
}

id sub_1B5B73374()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithString_, v1);

  return v2;
}

uint64_t sub_1B5B733E8(void *a1)
{
  uint64_t v2 = sub_1B5BC90D0();
  MEMORY[0x1F4188790](v2 - 8);
  OUTLINED_FUNCTION_16_1();
  uint64_t v3 = (void *)MEMORY[0x1E4FBC8C8];
  OUTLINED_FUNCTION_2_0();
  if ((*(uint64_t (**)(void))(v4 + 296))())
  {
    return MEMORY[0x1F40E3F10]();
  }
  else
  {
    (*(void (**)(void))((*v3 & *a1) + 0x110))();
    sub_1B5BC90C0();
    return sub_1B5BC9090();
  }
}

char *sub_1B5B734F8(void *a1)
{
  if (a1)
  {
    id v6 = a1;
    unint64_t v7 = &off_1E612E000;
    id v8 = objc_msgSend(v6, sel_count);
    if (((unint64_t)v8 & 0x8000000000000000) == 0)
    {
      uint64_t v1 = (char *)v8;
      if (!v8) {
        goto LABEL_25;
      }
      int64_t v4 = 0;
      uint64_t v2 = 0;
      do
      {
        id v10 = objc_msgSend(v6, sel_objectAtIndexedSubscript_, v2);
        id v3 = objc_msgSend(v10, sel_count);

        if (v3)
        {
          if (__OFADD__(v4++, 1))
          {
            __break(1u);
            goto LABEL_31;
          }
        }
        ++v2;
      }
      while (v1 != v2);
      if (!v4) {
        goto LABEL_25;
      }
      if (v4 == 1)
      {
        uint64_t v2 = (char *)objc_msgSend(v6, sel_objectAtIndexedSubscript_, 0);
        id v12 = objc_msgSend(v2, sel_category);
        if (!v12)
        {

          uint64_t v1 = (char *)MEMORY[0x1E4FBC860];
          goto LABEL_27;
        }
        id v13 = objc_msgSend(v12, sel_suggestionCategoryTitle);
        id v3 = (id)sub_1B5BC9F40();
        unint64_t v7 = v14;

        uint64_t v1 = sub_1B5B74708(0, 1, 1, MEMORY[0x1E4FBC860]);
        unint64_t v5 = *((void *)v1 + 2);
        unint64_t v9 = *((void *)v1 + 3);
        int64_t v4 = v5 + 1;
        if (v5 >= v9 >> 1) {
          goto LABEL_33;
        }
        goto LABEL_12;
      }
      unint64_t v16 = (unint64_t)objc_msgSend(v6, sel_count);
      if ((v16 & 0x8000000000000000) != 0) {
        goto LABEL_32;
      }
      unint64_t v17 = v16;
      if (v16)
      {
        uint64_t v18 = 0;
        uint64_t v1 = (char *)MEMORY[0x1E4FBC860];
        do
        {
          id v19 = objc_msgSend(v6, sel_objectAtIndexedSubscript_, v18);
          id v20 = objc_msgSend(v19, sel_category);

          if (v20)
          {
            id v21 = objc_msgSend(v20, sel_suggestionCategoryTitle);
            uint64_t v22 = sub_1B5BC9F40();
            uint64_t v24 = v23;

            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v1 = sub_1B5B74708(0, *((void *)v1 + 2) + 1, 1, v1);
            }
            unint64_t v26 = *((void *)v1 + 2);
            unint64_t v25 = *((void *)v1 + 3);
            if (v26 >= v25 >> 1) {
              uint64_t v1 = sub_1B5B74708((char *)(v25 > 1), v26 + 1, 1, v1);
            }
            *((void *)v1 + 2) = v26 + 1;
            v27 = &v1[16 * v26];
            *((void *)v27 + 4) = v22;
            *((void *)v27 + 5) = v24;
            swift_unknownObjectRelease();
          }
          ++v18;
        }
        while (v17 != v18);
      }
      else
      {
LABEL_25:
        uint64_t v1 = (char *)MEMORY[0x1E4FBC860];
      }
      uint64_t v2 = (char *)v6;
      goto LABEL_27;
    }
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    uint64_t v1 = sub_1B5B74708((char *)(v9 > 1), v4, 1, v1);
LABEL_12:
    *((void *)v1 + 2) = v4;
    uint64_t v15 = &v1[16 * v5];
    *((void *)v15 + 4) = v3;
    *((void *)v15 + 5) = v7;

    swift_unknownObjectRelease();
LABEL_27:

    return v1;
  }
  return (char *)MEMORY[0x1E4FBC860];
}

uint64_t sub_1B5B737C4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = MEMORY[0x1E4FBC860];
  uint64_t v81 = MEMORY[0x1E4FBC860];
  if (a3)
  {
    id v6 = a3;
    sub_1B5B73F10(a1, a2, v6);
    if (v7 == -1)
    {
    }
    else
    {
      id v72 = objc_msgSend(v6, sel_objectAtIndexedSubscript_, v7);
      uint64_t result = (uint64_t)objc_msgSend(v72, sel_count);
      if (result < 0)
      {
LABEL_38:
        __break(1u);
        return result;
      }
      uint64_t v8 = result;
      if (result)
      {
        v69 = v6;
        uint64_t v71 = type metadata accessor for SGBannerContent();
        uint64_t v9 = 0;
        id v10 = &selRef_invalidateBannerView;
        int64_t v11 = &selRef_invalidateBannerView;
        long long v73 = xmmword_1B5BCC240;
        uint64_t v70 = v8;
        while (1)
        {
          id v12 = objc_msgSend(v72, sel_objectAtIndexedSubscript_, v9, v69);
          id v13 = SGBannerContent.__allocating_init()();
          uint64_t v14 = OUTLINED_FUNCTION_27_0();
          *(void *)(v14 + 16) = v13;
          *(void *)(v14 + 24) = v12;
          v79 = sub_1B5B74848;
          uint64_t v80 = v14;
          uint64_t aBlock = MEMORY[0x1E4F143A8];
          uint64_t v76 = 1107296256;
          v77 = sub_1B5B74054;
          v78 = &block_descriptor_20;
          uint64_t v15 = _Block_copy(&aBlock);
          id v16 = v13;
          swift_unknownObjectRetain();
          swift_release();
          dispatchInContext(1, (uint64_t)v15);
          _Block_release(v15);
          if (objc_msgSend(v12, v11[277], v10[181]))
          {
            id v17 = [v12 v10[181]];
            if (!v17)
            {
              OUTLINED_FUNCTION_19_2();
              (*(void (**)(void))(v18 + 400))();
              goto LABEL_11;
            }
          }
          else
          {
            id v17 = objc_msgSend(objc_msgSend((id)swift_unknownObjectRetain(), sel_suggestionCategory), sel_suggestionCategoryImage);
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
          }
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB8419C0);
          uint64_t v19 = swift_allocObject();
          OUTLINED_FUNCTION_18_0(v19, v20, v21, v22, v23, v24, v25, v26, (uint64_t)v69, v70, v71, (uint64_t)v72, v73);
          OUTLINED_FUNCTION_1_1();
          v28 = *(void (**)(uint64_t))(v27 + 400);
          id v29 = v17;
          uint64_t v30 = OUTLINED_FUNCTION_21();
          v28(v30);

LABEL_11:
          if (objc_msgSend(v12, v11[277], sel_suggestionImageSGView))
          {
            id v31 = objc_msgSend(v12, sel_suggestionImageSGView);
            if (!v31) {
              goto LABEL_18;
            }
          }
          else
          {
            id v32 = objc_msgSend((id)swift_unknownObjectRetain(), sel_suggestionCategory);
            if ((objc_msgSend(v32, v11[277], sel_suggestionCategoryImageSGView) & 1) == 0)
            {
              swift_unknownObjectRelease();
              swift_unknownObjectRelease();
LABEL_18:
              OUTLINED_FUNCTION_19_2();
              (*(void (**)(void))(v45 + 568))(0);
              goto LABEL_19;
            }
            id v31 = objc_msgSend(v32, sel_suggestionCategoryImageSGView);
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
          }
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB8419C0);
          uint64_t v33 = swift_allocObject();
          OUTLINED_FUNCTION_18_0(v33, v34, v35, v36, v37, v38, v39, v40, (uint64_t)v69, v70, v71, (uint64_t)v72, v73);
          OUTLINED_FUNCTION_1_1();
          v42 = *(void (**)(uint64_t))(v41 + 568);
          id v43 = v31;
          uint64_t v44 = OUTLINED_FUNCTION_21();
          v42(v44);

LABEL_19:
          if (objc_msgSend(v12, v11[277], sel_suggestionAttributedSubtitle))
          {
            id v46 = objc_msgSend((id)swift_unknownObjectRetain(), sel_suggestionAttributedSubtitle);
            OUTLINED_FUNCTION_1_1();
            (*(void (**)(void))(v47 + 352))();
            swift_unknownObjectRelease();
          }
          OUTLINED_FUNCTION_20_0();
          v49 = *(void (**)(uint64_t))(v48 + 448);
          uint64_t v50 = swift_unknownObjectRetain();
          v49(v50);
          char v74 = 0;
          OUTLINED_FUNCTION_5();
          v52 = (void *)(*(uint64_t (**)(void))(v51 + 344))();
          if (v52)
          {
            id v53 = v52;
            id v54 = objc_msgSend(v52, sel_length);
            uint64_t v55 = swift_allocObject();
            *(void *)(v55 + 16) = &v74;
            uint64_t v56 = OUTLINED_FUNCTION_27_0();
            *(void *)(v56 + 16) = sub_1B5B75178;
            *(void *)(v56 + 24) = v55;
            v79 = sub_1B5B75174;
            uint64_t v80 = v56;
            uint64_t aBlock = MEMORY[0x1E4F143A8];
            uint64_t v76 = 1107296256;
            v77 = sub_1B5B732B8;
            v78 = &block_descriptor_31;
            v57 = _Block_copy(&aBlock);
            swift_retain();
            swift_release();
            objc_msgSend(v53, sel_enumerateAttributesInRange_options_usingBlock_, 0, v54, 0, v57);
            _Block_release(v57);
            LOBYTE(v54) = OUTLINED_FUNCTION_11_0(v56, (uint64_t)"");
            swift_release();
            uint64_t result = swift_release();
            if (v54)
            {
              __break(1u);
              goto LABEL_38;
            }
          }
          else
          {
            OUTLINED_FUNCTION_20_0();
            v59 = *(void (**)(void))(v58 + 320);
            OUTLINED_FUNCTION_23_1();
            v59();
            if (v60
              && (uint64_t v61 = sub_1B5BC9F70(), swift_bridgeObjectRelease(), v61 > 0)
              && (OUTLINED_FUNCTION_23_1(), v59(), v62))
            {
              sub_1B5B7447C(0, (unint64_t *)&unk_1E9D93CD0);
            }
            else
            {
              sub_1B5B7447C(0, (unint64_t *)&unk_1E9D93CD0);
              OUTLINED_FUNCTION_13();
            }
            id v53 = sub_1B5B73374();
          }
          id v63 = objc_msgSend(v53, sel_string);
          uint64_t v64 = sub_1B5BC9F40();
          uint64_t v66 = v65;

          OUTLINED_FUNCTION_5();
          (*(void (**)(uint64_t, uint64_t))(v67 + 328))(v64, v66);
          id v68 = v16;
          MEMORY[0x1BA9A75E0]();
          if (*(void *)((v81 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v81 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1B5BCA000();
          }
          ++v9;
          sub_1B5BCA010();
          sub_1B5BC9FF0();
          swift_unknownObjectRelease();

          id v10 = &selRef_invalidateBannerView;
          int64_t v11 = &selRef_invalidateBannerView;
          if (v70 == v9)
          {

            return v81;
          }
        }
      }
    }
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void sub_1B5B73F10(uint64_t a1, uint64_t a2, id a3)
{
  unint64_t v6 = (unint64_t)objc_msgSend(a3, sel_count);
  if ((v6 & 0x8000000000000000) != 0)
  {
LABEL_16:
    __break(1u);
    return;
  }
  unint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = 0;
    while (v7 != v8)
    {
      id v9 = objc_msgSend(a3, sel_objectAtIndexedSubscript_, v8);
      id v10 = objc_msgSend(v9, sel_category);

      if (v10)
      {
        id v11 = objc_msgSend(v10, sel_suggestionCategoryTitle);
        swift_unknownObjectRelease();
        uint64_t v12 = sub_1B5BC9F40();
        uint64_t v14 = v13;

        if (v12 == a1 && v14 == a2)
        {
          swift_bridgeObjectRelease();
          return;
        }
        char v16 = sub_1B5BCA1B0();
        swift_bridgeObjectRelease();
        if (v16) {
          return;
        }
      }
      if (v7 == ++v8) {
        return;
      }
    }
    __break(1u);
    goto LABEL_16;
  }
}

uint64_t sub_1B5B74054(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1B5B74098()
{
  OUTLINED_FUNCTION_6();
  unint64_t v1 = (*(uint64_t (**)(void))(v0 + 560))();
  if (!v1)
  {
LABEL_10:
    OUTLINED_FUNCTION_7_0();
    uint64_t v8 = (void *)(*(uint64_t (**)(void))(v7 + 440))();
    if (v8)
    {
      id v9 = v8;
      if (objc_msgSend(v8, sel_respondsToSelector_, sel_suggestionImageSGView))
      {
        id v6 = objc_msgSend(v9, sel_suggestionImageSGView);
        swift_unknownObjectRelease();
        return (uint64_t)v6;
      }
      swift_unknownObjectRelease();
    }
    return 0;
  }
  unint64_t v2 = v1;
  uint64_t v3 = v1 & 0xFFFFFFFFFFFFFF8;
  if (!(v1 >> 62))
  {
    uint64_t result = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t result = sub_1B5BCA170();
  if (!result)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
LABEL_4:
  if ((v2 & 0xC000000000000001) != 0)
  {
    id v5 = (id)MEMORY[0x1BA9A7760](0, v2);
    goto LABEL_7;
  }
  if (*(void *)(v3 + 16))
  {
    id v5 = *(id *)(v2 + 32);
LABEL_7:
    id v6 = v5;
    swift_bridgeObjectRelease();
    return (uint64_t)v6;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B5B741DC()
{
  OUTLINED_FUNCTION_6();
  unint64_t v1 = (*(uint64_t (**)(void))(v0 + 392))();
  if (!v1)
  {
LABEL_10:
    OUTLINED_FUNCTION_7_0();
    uint64_t v8 = (void *)(*(uint64_t (**)(void))(v7 + 440))();
    if (v8)
    {
      id v9 = v8;
      if (objc_msgSend(v8, sel_respondsToSelector_, sel_suggestionImage))
      {
        id v6 = objc_msgSend(v9, sel_suggestionImage);
        swift_unknownObjectRelease();
        return (uint64_t)v6;
      }
      swift_unknownObjectRelease();
    }
    return 0;
  }
  unint64_t v2 = v1;
  uint64_t v3 = v1 & 0xFFFFFFFFFFFFFF8;
  if (!(v1 >> 62))
  {
    uint64_t result = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (result) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t result = sub_1B5BCA170();
  if (!result)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
LABEL_4:
  if ((v2 & 0xC000000000000001) != 0)
  {
    id v5 = (id)MEMORY[0x1BA9A7760](0, v2);
    goto LABEL_7;
  }
  if (*(void *)(v3 + 16))
  {
    id v5 = *(id *)(v2 + 32);
LABEL_7:
    id v6 = v5;
    swift_bridgeObjectRelease();
    return (uint64_t)v6;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B5B74320()
{
  return 0x726F707075736E55;
}

uint64_t sub_1B5B743FC()
{
  return 0;
}

id sub_1B5B74404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v6, sel_initWithRed_green_blue_alpha_, (double)a1 / 255.0, (double)a2 / 255.0, (double)a3 / 255.0, 1.0);
}

uint64_t sub_1B5B7447C(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1B5B744B8()
{
  unint64_t result = qword_1EB841698;
  if (!qword_1EB841698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB841698);
  }
  return result;
}

uint64_t sub_1B5B74504()
{
  return sub_1B5B75078(*v0, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1B5B7453C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B5B75040();
  *a1 = result;
  return result;
}

uint64_t sub_1B5B74564()
{
  return sub_1B5B74A18();
}

uint64_t sub_1B5B74570()
{
  return sub_1B5B75078(*v0, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1B5B745A0()
{
  return sub_1B5B74AA0();
}

uint64_t sub_1B5B745A8()
{
  return sub_1B5B74AF4();
}

uint64_t sub_1B5B745B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1B5BC9F00();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1B5B745F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B5B74624(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1B5B74628()
{
  return OUTLINED_FUNCTION_0_0(v0, 24);
}

uint64_t sub_1B5B74634(uint64_t a1)
{
  return sub_1B5B73098(a1, *(char **)(v1 + 16));
}

uint64_t sub_1B5B7463C()
{
  return OUTLINED_FUNCTION_0_0(v0, 32);
}

uint64_t sub_1B5B74648()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B5B74670(uint64_t a1)
{
  uint64_t v2 = sub_1B5B74E98(&qword_1E9D93D78);
  uint64_t v3 = sub_1B5B74E98(&qword_1E9D93D80);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];
  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

char *sub_1B5B74708(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93D88);
    id v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    id v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
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

uint64_t sub_1B5B74808()
{
  swift_unknownObjectRelease();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_1B5B74848()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 16);
  uint64_t v3 = *(void **)(v1 + 24);
  id v4 = objc_msgSend(v3, sel_suggestionTitle);
  uint64_t v5 = sub_1B5BC9F40();
  uint64_t v7 = v6;

  uint64_t v8 = (void *)MEMORY[0x1E4FBC8C8];
  OUTLINED_FUNCTION_2_0();
  (*(void (**)(uint64_t, uint64_t))(v9 + 280))(v5, v7);
  id v20 = objc_msgSend(v3, sel_suggestionPrimaryAction);
  id v10 = objc_msgSend(v20, sel_title);
  uint64_t v11 = sub_1B5BC9F40();
  uint64_t v13 = v12;

  OUTLINED_FUNCTION_2_0();
  (*(void (**)(uint64_t, uint64_t))(v14 + 424))(v11, v13);
  if (objc_msgSend(v3, sel_respondsToSelector_, sel_suggestionSubtitle))
  {
    id v15 = objc_msgSend((id)swift_unknownObjectRetain(), sel_suggestionSubtitle);
    if (v15)
    {
      char v16 = v15;
      uint64_t v17 = sub_1B5BC9F40();
      uint64_t v19 = v18;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v19 = 0;
    }
    (*(void (**)(uint64_t, uint64_t))((*v8 & *v2) + 0x148))(v17, v19);
    swift_unknownObjectRelease();
  }
}

uint64_t sub_1B5B74A00()
{
  return OUTLINED_FUNCTION_0_0(v0, 24);
}

uint64_t sub_1B5B74A0C()
{
  return OUTLINED_FUNCTION_0_0(v0, 32);
}

uint64_t sub_1B5B74A18()
{
  uint64_t v0 = sub_1B5BC9F40();
  uint64_t v2 = v1;
  if (v0 == sub_1B5BC9F40() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1B5BCA1B0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1B5B74AA0()
{
  sub_1B5BC9F40();
  sub_1B5BC9F60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B5B74AF4()
{
  sub_1B5BC9F40();
  sub_1B5BCA1C0();
  sub_1B5BC9F60();
  uint64_t v0 = sub_1B5BCA1E0();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_1B5B74B6C()
{
  unint64_t result = qword_1E9D93D48;
  if (!qword_1E9D93D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D93D48);
  }
  return result;
}

void type metadata accessor for SGBannerConstants()
{
}

void type metadata accessor for SGBannerConstants.SGUIAccessibilityIdentifier()
{
}

uint64_t sub_1B5B74BD0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_1B5B74C58(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B5B74D24);
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

uint64_t sub_1B5B74D4C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1B5B74D58(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

void type metadata accessor for MultiBannerSectionTypes()
{
}

void type metadata accessor for SGBannerHelpers()
{
}

uint64_t sub_1B5B74D78(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1B5B74D98(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
}

void type metadata accessor for Key(uint64_t a1)
{
}

void sub_1B5B74DE8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1B5B74E30()
{
  return sub_1B5B74E98((unint64_t *)&unk_1E9D93D60);
}

uint64_t sub_1B5B74E64()
{
  return sub_1B5B74E98(&qword_1E9D95220);
}

uint64_t sub_1B5B74E98(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B5B74EDC()
{
  return sub_1B5B74E98(&qword_1E9D93D70);
}

uint64_t sub_1B5B74F10@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_1B5B74F48(uint64_t a1, id *a2)
{
  uint64_t result = sub_1B5BC9F20();
  *a2 = 0;
  return result;
}

uint64_t sub_1B5B74FC0(uint64_t a1, id *a2)
{
  char v3 = sub_1B5BC9F30();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1B5B75040()
{
  sub_1B5BC9F40();
  uint64_t v0 = sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B5B75078(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_1B5BC9F40();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1B5B750B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1B5B75114(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D93D90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1B5B75184()
{
  OUTLINED_FUNCTION_60();
  uint64_t v3 = sub_1B5BC9280();
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_16_1();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D93E00);
  uint64_t v8 = OUTLINED_FUNCTION_19_1(v7);
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_12_0();
  sub_1B5BC9250();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_27();
  double v10 = *(double *)sub_1B5B72884();
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14D0]), sel_initWithFrame_, 0.0, 0.0, v10, v10);
  objc_msgSend(v11, sel_addTarget_action_forControlEvents_, v0, sel_dismissalPressed_, 64);
  sub_1B5B7447C(0, &qword_1EB840B10);
  id v12 = sub_1B5B753E8();
  objc_msgSend(v11, sel_setImage_forState_, v12, 0);

  sub_1B5B7447C(0, (unint64_t *)&unk_1E9D93E10);
  id v13 = v11;
  sub_1B5BC9240();
  sub_1B5BC9270();
  sub_1B5B72890();
  sub_1B5BC9260();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  __swift_storeEnumTagSinglePayload(v2, 0, 1, v3);
  uint64_t v14 = (void *)sub_1B5BCA020();
  objc_msgSend(v13, sel_setHoverStyle_, v14);

  objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithCustomView_, v13);
  OUTLINED_FUNCTION_53_0();
}

id sub_1B5B753E8()
{
  uint64_t v0 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_systemImageNamed_, v0);

  return v1;
}

void sub_1B5B7544C()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_72();
  id v1 = (void *)(*(uint64_t (**)(void))(v0 + 128))();
  uint64_t v2 = sub_1B5B7B0B0(v1);
  if (v2) {
    unint64_t v3 = v2;
  }
  else {
    unint64_t v3 = MEMORY[0x1E4FBC860];
  }
  if (v3 >> 62) {
    goto LABEL_18;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    uint64_t v5 = 4;
    while (1)
    {
      if ((v3 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = (void *)MEMORY[0x1BA9A7760](v5 - 4, v3);
      }
      else
      {
        uint64_t v6 = *(void **)(v3 + 8 * v5);
        swift_unknownObjectRetain();
      }
      uint64_t v7 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      if ((objc_msgSend(v6, sel_respondsToSelector_, sel_suggestionActionButtonType) & 1) != 0
        && (objc_msgSend(v6, sel_respondsToSelector_, sel_suggestionActionButtonType) & 1) != 0)
      {
        objc_msgSend(v6, sel_suggestionActionButtonType);
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        goto LABEL_16;
      }
      swift_unknownObjectRelease();
      ++v5;
      if (v7 == v4) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1B5BCA170();
    swift_bridgeObjectRelease();
  }
LABEL_14:
  swift_bridgeObjectRelease();
LABEL_16:
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1B5B755BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, char a4@<W4>, uint64_t a5@<X8>)
{
  id v10 = objc_msgSend(self, sel_currentDevice);
  id v11 = objc_msgSend(v10, sel_userInterfaceIdiom);

  type metadata accessor for SGSuggestionStoreWrapper(0);
  sub_1B5B7B1E0((uint64_t)&qword_1E9D94A00);
  uint64_t result = sub_1B5BC9410();
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = a3;
  *(unsigned char *)(a5 + 24) = a4;
  *(void *)(a5 + 32) = v11;
  *(void *)(a5 + 40) = result;
  *(void *)(a5 + 48) = v13;
  return result;
}

uint64_t sub_1B5B756A4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)v0;
  uint64_t v3 = *(void *)(v0 + 8);
  long long v9 = *(_OWORD *)(v0 + 40);
  uint64_t v4 = *(uint64_t (**)(void))(**((void **)&v9 + 1) + 96);
  swift_retain();
  uint64_t v5 = (void *)v4();
  sub_1B5B7B11C((uint64_t)&v9);
  sub_1B5B737C4(v2, v3, v5);

  swift_getKeyPath();
  uint64_t v6 = swift_allocObject();
  long long v7 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v6 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v6 + 32) = v7;
  *(_OWORD *)(v6 + 48) = *(_OWORD *)(v1 + 32);
  *(void *)(v6 + 64) = *(void *)(v1 + 48);
  sub_1B5B7B198(v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93E20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93E28);
  sub_1B5B7E718((uint64_t)&unk_1E9D93E30);
  sub_1B5B7B1E0((uint64_t)&unk_1E9D93E38);
  sub_1B5B7B224();
  return sub_1B5BC9E30();
}

void sub_1B5B75858()
{
  OUTLINED_FUNCTION_18();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v154 = v6;
  uint64_t v133 = type metadata accessor for SGSuggestionsTableCell(0);
  OUTLINED_FUNCTION_1_0();
  ((void (*)(void))MEMORY[0x1F4188790])();
  OUTLINED_FUNCTION_59();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93EB0);
  OUTLINED_FUNCTION_1_0();
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  id v10 = (char *)&v127 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  id v12 = (char *)&v127 - v11;
  uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94218);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_4_1();
  uint64_t v132 = v14;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_37(v16);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94220);
  uint64_t v18 = OUTLINED_FUNCTION_19_1(v17);
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_3();
  uint64_t v140 = v19;
  OUTLINED_FUNCTION_56();
  uint64_t v20 = sub_1B5BC94E0();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_25();
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94228);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_3();
  uint64_t v25 = v24;
  uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94230);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_37(v27);
  uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94238);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v28);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_37(v29);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94240);
  uint64_t v31 = OUTLINED_FUNCTION_19_1(v30);
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_4_1();
  uint64_t v138 = v32;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v33);
  OUTLINED_FUNCTION_15_0();
  uint64_t v143 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94248);
  OUTLINED_FUNCTION_0_1();
  uint64_t v141 = v36;
  uint64_t v142 = v35;
  MEMORY[0x1F4188790](v35);
  OUTLINED_FUNCTION_3();
  uint64_t v151 = v37;
  uint64_t v150 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93E88);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v38);
  OUTLINED_FUNCTION_4_1();
  uint64_t v139 = v39;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v40);
  OUTLINED_FUNCTION_15_0();
  uint64_t v144 = v41;
  uint64_t v152 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94250);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v42);
  OUTLINED_FUNCTION_3();
  uint64_t v153 = v43;
  uint64_t v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94258);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v44);
  OUTLINED_FUNCTION_3();
  v148 = v45;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93E50);
  OUTLINED_FUNCTION_1_0();
  uint64_t v47 = MEMORY[0x1F4188790](v46);
  v49 = *v5;
  if ((*(unsigned char *)(v3 + 24) & 1) != 0 && *(void *)(v3 + 32) == 6)
  {
    uint64_t v50 = *(void **)(v3 + 16);
    uint64_t v51 = (char *)&v127 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
    id v52 = v49;
    id v53 = v50;
    sub_1B5BA0864();
    id v54 = v148;
    void *v148 = v52;
    v54[1] = v53;
    *((unsigned char *)v54 + 16) = v55 & 1;
    *((unsigned char *)v54 + 17) = v56 & 1;
    *((unsigned char *)v54 + 18) = v57 & 1;
    *(_OWORD *)(v54 + 3) = 0u;
    *(_OWORD *)(v54 + 5) = 0u;
    *((unsigned char *)v54 + 56) = 0;
    swift_storeEnumTagMultiPayload();
    id v58 = v52;
    id v59 = v53;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93E60);
    sub_1B5B7B31C();
    sub_1B5B7B408();
    OUTLINED_FUNCTION_69();
    sub_1B5BC9830();
    sub_1B5B7E444((uint64_t)v51, v153, &qword_1E9D93E50);
    swift_storeEnumTagMultiPayload();
    sub_1B5B7B2A0();
    sub_1B5B7B520();
    sub_1B5BC9830();
    sub_1B5B7E758((uint64_t)v51, &qword_1E9D93E50);
  }
  else
  {
    v130 = (char *)&v127 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v146 = v47;
    uint64_t v147 = v7;
    char v60 = sub_1B5B743FC();
    uint64_t v61 = *(void **)(v3 + 16);
    if (v60)
    {
      id v62 = v49;
      id v63 = v61;
      uint64_t v64 = (void *)sub_1B5BACFC8(v62);
      uint64_t v66 = v65;
      *(void *)&long long v155 = v64;
      *((void *)&v155 + 1) = v65;
      LOWORD(v156) = v67 & 0x101;
      BYTE2(v156) = v68 & 1;
      sub_1B5BC9380();
      sub_1B5B7B4D4();
      sub_1B5BC9BA0();

      uint64_t v129 = v20;
      v69 = &v1[*(int *)(v20 + 20)];
      LODWORD(v133) = *MEMORY[0x1E4F3D4A0];
      uint64_t v70 = v133;
      uint64_t v71 = sub_1B5BC9660();
      OUTLINED_FUNCTION_1_0();
      v128 = *(void (**)(char *, uint64_t, uint64_t))(v72 + 104);
      v128(v69, v70, v71);
      __asm { FMOV            V0.2D, #5.0 }
      long long v127 = _Q0;
      *(_OWORD *)uint64_t v1 = _Q0;
      uint64_t v78 = sub_1B5BC9C60();
      char v79 = sub_1B5BC99A0();
      uint64_t v80 = (void (*)(void))MEMORY[0x1E4F3CDB8];
      uint64_t v81 = v25;
      sub_1B5B7E33C((uint64_t)v1, v25, MEMORY[0x1E4F3CDB8]);
      uint64_t v82 = v25 + *(int *)(v22 + 36);
      *(void *)uint64_t v82 = v78;
      *(unsigned char *)(v82 + 8) = v79;
      sub_1B5B7E398();
      v83 = self;
      uint64_t v84 = MEMORY[0x1BA9A72D0](objc_msgSend(v83, sel_systemGray6Color));
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v86 = v25;
      uint64_t v87 = v135;
      sub_1B5B7E444(v86, v135, &qword_1E9D94228);
      v88 = (uint64_t *)(v87 + *(int *)(v134 + 36));
      uint64_t *v88 = KeyPath;
      v88[1] = v84;
      sub_1B5B7E758(v81, &qword_1E9D94228);
      v128(&v1[*(int *)(v129 + 20)], v133, v71);
      *(_OWORD *)uint64_t v1 = v127;
      uint64_t v89 = MEMORY[0x1BA9A72D0](objc_msgSend(v83, sel_systemGray4Color));
      sub_1B5BC9370();
      uint64_t v90 = v140;
      sub_1B5B7E33C((uint64_t)v1, v140, v80);
      uint64_t v91 = v90 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94260) + 36);
      long long v92 = v156;
      *(_OWORD *)uint64_t v91 = v155;
      *(_OWORD *)(v91 + 16) = v92;
      *(void *)(v91 + 32) = v157;
      uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94268);
      *(void *)(v90 + *(int *)(v93 + 52)) = v89;
      *(_WORD *)(v90 + *(int *)(v93 + 56)) = 256;
      uint64_t v94 = sub_1B5BC9E80();
      uint64_t v96 = v95;
      v97 = (uint64_t *)(v90 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94270) + 36));
      uint64_t *v97 = v94;
      v97[1] = v96;
      sub_1B5B7E398();
      uint64_t v98 = sub_1B5BC9E80();
      uint64_t v100 = v99;
      uint64_t v101 = v137;
      uint64_t v102 = v137 + *(int *)(v136 + 36);
      sub_1B5B7E444(v90, v102, &qword_1E9D94220);
      v103 = (uint64_t *)(v102 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94278) + 36));
      uint64_t *v103 = v98;
      v103[1] = v100;
      sub_1B5B7E444(v87, v101, &qword_1E9D94230);
      sub_1B5B7E758(v90, &qword_1E9D94220);
      sub_1B5B7E758(v87, &qword_1E9D94230);
      uint64_t v104 = *(void *)sub_1B5B72788();
      uint64_t v105 = *(void *)sub_1B5B7277C();
      LOBYTE(v98) = sub_1B5BC99A0();
      uint64_t v106 = v143;
      sub_1B5B7E444(v101, v143, &qword_1E9D94238);
      uint64_t v107 = v145;
      uint64_t v108 = v106 + *(int *)(v145 + 36);
      *(unsigned char *)uint64_t v108 = v98;
      *(void *)(v108 + 8) = v104;
      *(void *)(v108 + 16) = v105;
      *(void *)(v108 + 24) = 0;
      *(void *)(v108 + 32) = v105;
      *(unsigned char *)(v108 + 40) = 0;
      sub_1B5B7E758(v101, &qword_1E9D94238);
      __swift_storeEnumTagSinglePayload(v106, 0, 1, v107);
      uint64_t v109 = v138;
      sub_1B5B7E444(v106, v138, &qword_1E9D94240);
      uint64_t v110 = 0;
      if (__swift_getEnumTagSinglePayload(v109, 1, v107) != 1)
      {
        uint64_t v111 = v109;
        uint64_t v112 = v131;
        sub_1B5B7E3E8(v111, v131, &qword_1E9D94218);
        sub_1B5B7E444(v112, v132, &qword_1E9D94218);
        sub_1B5B7E49C((uint64_t)&unk_1E9D94280);
        uint64_t v110 = sub_1B5BC9DC0();
        sub_1B5B7E758(v112, &qword_1E9D94218);
      }
      uint64_t v113 = v139;
      OUTLINED_FUNCTION_80();
      v114();
      *(void *)(v113 + *(int *)(v150 + 36)) = v110;
      sub_1B5B7E758(v106, &qword_1E9D94240);
      OUTLINED_FUNCTION_81();
      v115();
      v116 = &qword_1E9D93E88;
      uint64_t v117 = v144;
      sub_1B5B7E3E8(v113, v144, &qword_1E9D93E88);
      sub_1B5B7E444(v117, (uint64_t)v148, &qword_1E9D93E88);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93E60);
      sub_1B5B7B31C();
      sub_1B5B7B408();
      uint64_t v118 = (uint64_t)v130;
      sub_1B5BC9830();
      sub_1B5B7E444(v118, v153, &qword_1E9D93E50);
      swift_storeEnumTagMultiPayload();
      sub_1B5B7B2A0();
      sub_1B5B7B520();
      sub_1B5BC9830();
      sub_1B5B7E758(v118, &qword_1E9D93E50);
      uint64_t v119 = v117;
    }
    else
    {
      v120 = (uint64_t *)(v0 + *(int *)(v133 + 28));
      uint64_t *v120 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D93EC0);
      swift_storeEnumTagMultiPayload();
      *(void *)uint64_t v0 = v49;
      *(void *)(v0 + 8) = v61;
      id v121 = v49;
      id v122 = v61;
      sub_1B5BA0864();
      *(unsigned char *)(v0 + 16) = v123 & 1;
      *(unsigned char *)(v0 + 17) = v124 & 1;
      *(unsigned char *)(v0 + 18) = v125 & 1;
      sub_1B5B7E33C(v0, (uint64_t)v10, (void (*)(void))type metadata accessor for SGSuggestionsTableCell);
      v126 = &v10[*(int *)(v147 + 36)];
      v126[32] = 0;
      *(_OWORD *)v126 = 0u;
      *((_OWORD *)v126 + 1) = 0u;
      sub_1B5B7E398();
      v116 = &qword_1E9D93EB0;
      sub_1B5B7E3E8((uint64_t)v10, (uint64_t)v12, &qword_1E9D93EB0);
      sub_1B5B7E444((uint64_t)v12, v153, &qword_1E9D93EB0);
      swift_storeEnumTagMultiPayload();
      sub_1B5B7B2A0();
      sub_1B5B7B520();
      sub_1B5BC9830();
      uint64_t v119 = (uint64_t)v12;
    }
    sub_1B5B7E758(v119, v116);
  }
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1B5B764B0()
{
  return sub_1B5BC9B90();
}

uint64_t sub_1B5B764CC()
{
  return sub_1B5B756A4();
}

uint64_t sub_1B5B76510()
{
  sub_1B5BC91A0();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_43();
  return v1(v0);
}

void sub_1B5B7656C()
{
}

uint64_t sub_1B5B765F0()
{
  sub_1B5B7B664(v0, v1, v2);
  return swift_bridgeObjectRelease();
}

void sub_1B5B76620()
{
}

uint64_t sub_1B5B76628@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B5BC9630();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D93EC0);
  MEMORY[0x1F4188790](v8);
  id v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5B7E444(v2, (uint64_t)v10, (uint64_t *)&unk_1E9D93EC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_1B5BC9440();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_1B5BCA060();
    uint64_t v14 = sub_1B5BC9990();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v18 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_1B5B7AAF8(0x5463696D616E7944, 0xEF657A6953657079, &v18);
      _os_log_impl(&dword_1B5B6C000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9A8090](v16, -1, -1);
      MEMORY[0x1BA9A8090](v15, -1, -1);
    }

    sub_1B5BC9620();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1B5B768BC()
{
  return sub_1B5BC9570();
}

uint64_t sub_1B5B768E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B5B7AFA4(a1, a2, a3, a4, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3CFE8]);
}

double sub_1B5B7690C()
{
  OUTLINED_FUNCTION_82();
  uint64_t v1 = sub_1B5BC9440();
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_79();
  v5();
  sub_1B5B7B1E0((uint64_t)&unk_1E9D93ED0);
  char v6 = sub_1B5BC9EF0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  double v7 = *(double *)sub_1B5B7271C();
  if ((v6 & 1) == 0) {
    return v7 + *(double *)sub_1B5B72728();
  }
  return v7;
}

void sub_1B5B76A20()
{
  OUTLINED_FUNCTION_18();
  sub_1B5BC94D0();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v1);
  OUTLINED_FUNCTION_12_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93ED8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_24();
  uint64_t v3 = sub_1B5BC9640();
  uint64_t v4 = *(void *)sub_1B5B72710();
  *(void *)uint64_t v0 = v3;
  *(void *)(v0 + 8) = v4;
  *(unsigned char *)(v0 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93EE0);
  sub_1B5B76BA8();
  sub_1B5BC94C0();
  sub_1B5B7E718((uint64_t)&unk_1E9D93EE8);
  sub_1B5B7B1E0((uint64_t)&unk_1E9D93EF0);
  sub_1B5BC9B60();
  uint64_t v5 = OUTLINED_FUNCTION_55();
  v6(v5);
  uint64_t v7 = OUTLINED_FUNCTION_69();
  sub_1B5B7E758(v7, v8);
  OUTLINED_FUNCTION_17();
}

void sub_1B5B76BA8()
{
  OUTLINED_FUNCTION_18();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94180);
  uint64_t v5 = OUTLINED_FUNCTION_19_1(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_4_1();
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v8);
  id v10 = (char *)&v43 - v9;
  if (*(unsigned char *)(v1 + 16) == 1)
  {
    uint64_t v11 = sub_1B5BC96D0();
    id v12 = *(void **)v1;
    OUTLINED_FUNCTION_72();
    uint64_t v14 = (*(uint64_t (**)(void))(v13 + 560))();
    swift_bridgeObjectRelease();
    uint64_t v44 = (char *)v1;
    v49 = v12;
    if (v14) {
      __int16 v50 = 0;
    }
    else {
      __int16 v50 = 256;
    }
    sub_1B5B7D6A8();
    sub_1B5B7D6F4();
    id v19 = v12;
    sub_1B5BC9830();
    id v20 = v51;
    unsigned int v21 = v52;
    int v22 = v53;
    id v23 = v51;
    id v16 = v20;

    unsigned __int8 v24 = sub_1B5BC99D0();
    sub_1B5B72710();
    sub_1B5BC9320();
    uint64_t v47 = v26;
    uint64_t v48 = v25;
    uint64_t v45 = v28;
    uint64_t v46 = v27;
    uint64_t v29 = 256;
    if (!v22) {
      uint64_t v29 = 0;
    }
    uint64_t v18 = v29 | v21;
    uint64_t v17 = v24;
    uint64_t v15 = 1;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v15 = 0;
    id v16 = 0;
    uint64_t v17 = 0;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    uint64_t v18 = 65280;
  }
  uint64_t v43 = v17;
  *(void *)id v10 = sub_1B5BC96E0();
  *((void *)v10 + 1) = 0;
  v10[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94188);
  sub_1B5B76E50();
  sub_1B5B7E444((uint64_t)v10, v7, &qword_1E9D94180);
  *(void *)uint64_t v3 = v11;
  *(void *)(v3 + 8) = 0;
  *(void *)(v3 + 16) = v15;
  *(void *)(v3 + 24) = v16;
  *(void *)(v3 + 32) = v18;
  *(void *)(v3 + 40) = 0;
  *(void *)(v3 + 48) = v15;
  *(void *)(v3 + 56) = v17;
  uint64_t v30 = v47;
  *(void *)(v3 + 64) = v48;
  *(void *)(v3 + 72) = v30;
  uint64_t v44 = v10;
  uint64_t v31 = v45;
  *(void *)(v3 + 80) = v46;
  *(void *)(v3 + 88) = v31;
  *(unsigned char *)(v3 + 96) = 0;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94190);
  sub_1B5B7E444(v7, v3 + *(int *)(v32 + 48), &qword_1E9D94180);
  int v33 = OUTLINED_FUNCTION_16_2();
  sub_1B5B7D5F8(v33, v34, v35, v36, v37);
  sub_1B5B7E758((uint64_t)v44, &qword_1E9D94180);
  sub_1B5B7E758(v7, &qword_1E9D94180);
  int v38 = OUTLINED_FUNCTION_16_2();
  sub_1B5B7D684(v38, v39, v40, v41, v42);
  OUTLINED_FUNCTION_17();
}

void sub_1B5B76E50()
{
  OUTLINED_FUNCTION_46();
  uint64_t v179 = v3;
  v170 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94AE0);
  uint64_t v6 = OUTLINED_FUNCTION_19_1(v5);
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_4_1();
  uint64_t v158 = v7;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_15_0();
  uint64_t v157 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D941A0);
  uint64_t v11 = OUTLINED_FUNCTION_19_1(v10);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_4_1();
  uint64_t v181 = v12;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_15_0();
  uint64_t v178 = v14;
  uint64_t v15 = OUTLINED_FUNCTION_56();
  uint64_t v16 = type metadata accessor for SGSuggestionsTableCell(v15);
  v164 = *(void (**)(void))(v16 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v16 - 8);
  uint64_t v156 = (uint64_t)v155 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v165 = v18;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_15_0();
  uint64_t v163 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94B10);
  OUTLINED_FUNCTION_0_1();
  uint64_t v194 = v21;
  uint64_t v195 = v20;
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_4_1();
  uint64_t v193 = v22;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v23);
  v167 = (char *)v155 - v24;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_15_0();
  uint64_t v192 = v26;
  OUTLINED_FUNCTION_56();
  uint64_t v172 = sub_1B5BC9E20();
  OUTLINED_FUNCTION_0_1();
  uint64_t v180 = v27;
  MEMORY[0x1F4188790](v28);
  OUTLINED_FUNCTION_4_1();
  uint64_t v168 = v29;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v30);
  OUTLINED_FUNCTION_15_0();
  v171 = v31;
  uint64_t v166 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D941B0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v32);
  OUTLINED_FUNCTION_4_1();
  uint64_t v196 = v33;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_15_0();
  uint64_t v191 = v35;
  uint64_t v36 = sub_1B5BC9A60();
  OUTLINED_FUNCTION_0_1();
  uint64_t v38 = v37;
  MEMORY[0x1F4188790](v39);
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_2_0();
  uint64_t v202 = (*(uint64_t (**)(void))(v40 + 272))();
  uint64_t v203 = v41;
  unint64_t v188 = sub_1B5B744B8();
  uint64_t v42 = sub_1B5BC9B30();
  uint64_t v44 = v43;
  char v46 = v45 & 1;
  sub_1B5BC9A00();
  uint64_t v47 = *(void *)(v38 + 104);
  LODWORD(v187) = *MEMORY[0x1E4F3E0F8];
  uint64_t v185 = v38 + 104;
  uint64_t v186 = v47;
  OUTLINED_FUNCTION_78();
  v48();
  sub_1B5BC9A70();
  swift_release();
  v184 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
  uint64_t v189 = v38 + 8;
  uint64_t v190 = v36;
  v184(v0, v36);
  sub_1B5BC9A20();
  swift_release();
  uint64_t v49 = sub_1B5BC9B10();
  uint64_t v175 = v50;
  uint64_t v176 = v49;
  int v52 = v51;
  uint64_t v54 = v53;
  swift_release();
  sub_1B5B7B664(v42, v44, v46);
  uint64_t v55 = v179;
  swift_bridgeObjectRelease();
  int v56 = sub_1B5BC99B0();
  sub_1B5B726F8();
  sub_1B5BC9320();
  uint64_t v58 = v57;
  uint64_t v60 = v59;
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  int v65 = sub_1B5BC99F0();
  sub_1B5B72710();
  uint64_t v66 = sub_1B5BC9320();
  uint64_t v159 = v68;
  uint64_t v160 = v67;
  int v169 = v52;
  unsigned __int8 v228 = v52 & 1;
  unsigned __int8 v225 = 0;
  unsigned __int8 v222 = 0;
  int v69 = *(unsigned __int8 *)(v55 + 17);
  uint64_t v177 = v54;
  int v173 = v65;
  int v174 = v56;
  uint64_t v161 = v71;
  uint64_t v162 = v70;
  if (v69 == 1)
  {
    uint64_t v72 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **(void **)v55) + 0x140))(v66);
    uint64_t v74 = v60;
    uint64_t v75 = v58;
    if (v73)
    {
      uint64_t v202 = v72;
      uint64_t v203 = v73;
      sub_1B5BC9B30();
      char v77 = v76 & 1;
      sub_1B5BC9A00();
      uint64_t v78 = v190;
      OUTLINED_FUNCTION_78();
      v79();
      sub_1B5BC9A70();
      swift_release();
      v184(v0, v78);
      uint64_t v80 = sub_1B5BC9B10();
      uint64_t v189 = v81;
      uint64_t v190 = v80;
      LOBYTE(v78) = v82;
      unint64_t v188 = v83;
      swift_release();
      uint64_t v187 = v78 & 1;
      uint64_t v84 = OUTLINED_FUNCTION_41();
      sub_1B5B7B664(v84, v85, v77);
      swift_bridgeObjectRelease();
      unsigned __int8 v86 = sub_1B5BC99F0();
      sub_1B5BC9320();
      uint64_t v185 = v88;
      uint64_t v186 = v87;
      v184 = v89;
      uint64_t v182 = v90;
      uint64_t v183 = v86;
    }
    else
    {
      uint64_t v189 = 0;
      uint64_t v190 = 0;
      uint64_t v187 = 0;
      unint64_t v188 = 0;
      uint64_t v183 = 0;
      v184 = 0;
      uint64_t v185 = 0;
      uint64_t v186 = 0;
      uint64_t v182 = 0;
    }
  }
  else
  {
    uint64_t v74 = v60;
    uint64_t v75 = v58;
    uint64_t v189 = 0;
    uint64_t v190 = 0;
    uint64_t v186 = 0;
    uint64_t v187 = 0;
    uint64_t v183 = 0;
    v184 = 0;
    uint64_t v185 = 0;
    uint64_t v182 = 0;
    unint64_t v188 = 1;
  }
  uint64_t v91 = v196;
  uint64_t v92 = v180;
  uint64_t v94 = v164;
  uint64_t v93 = v165;
  uint64_t v95 = v163;
  sub_1B5BC9E10();
  char v96 = sub_1B5BC99B0();
  sub_1B5B72704();
  sub_1B5BC9320();
  OUTLINED_FUNCTION_7();
  v164 = *(void (**)(void))(v92 + 16);
  uint64_t v165 = v92 + 16;
  OUTLINED_FUNCTION_80();
  v97();
  uint64_t v98 = v91 + *(int *)(v166 + 36);
  *(unsigned char *)uint64_t v98 = v96;
  *(void *)(v98 + 8) = v58;
  *(void *)(v98 + 16) = v60;
  *(void *)(v98 + 24) = v1;
  *(void *)(v98 + 32) = v2;
  *(unsigned char *)(v98 + 40) = 0;
  uint64_t v99 = OUTLINED_FUNCTION_69();
  uint64_t v180 = v92 + 8;
  uint64_t v166 = (uint64_t)v100;
  v100(v99);
  sub_1B5B7E3E8(v91, v191, (uint64_t *)&unk_1E9D941B0);
  uint64_t v101 = v179;
  sub_1B5B7E33C(v179, v95, (void (*)(void))type metadata accessor for SGSuggestionsTableCell);
  unint64_t v102 = (*((unsigned __int8 *)v94 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v94 + 80);
  v155[1] = v102 + v93;
  uint64_t v103 = swift_allocObject();
  uint64_t v104 = sub_1B5B7DDA4(v95, v103 + v102);
  MEMORY[0x1F4188790](v104);
  uint64_t v153 = v101;
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94B20);
  sub_1B5B7DEC0();
  uint64_t v106 = v167;
  uint64_t v163 = v105;
  sub_1B5BC9D70();
  (*(void (**)(uint64_t, char *, uint64_t))(v194 + 32))(v192, v106, v195);
  if (*(unsigned char *)(v101 + 18) == 1)
  {
    uint64_t v107 = sub_1B5BC9E10();
    uint64_t v108 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **(void **)v101) + 0x1B8))(v107);
    uint64_t v109 = v75;
    if (v108)
    {
      uint64_t v110 = v108;
      if (objc_msgSend(v108, sel_respondsToSelector_, sel_suggestionDismissAction))
      {
        id v111 = objc_msgSend(v110, sel_suggestionDismissAction);
        swift_unknownObjectRelease();
        uint64_t v112 = v74;
        if (v111)
        {
          id v113 = objc_msgSend(v111, sel_title);

          uint64_t v114 = sub_1B5BC9F40();
          uint64_t v116 = v115;

          uint64_t v117 = v179;
          uint64_t v118 = v156;
          sub_1B5B7E33C(v179, v156, (void (*)(void))type metadata accessor for SGSuggestionsTableCell);
          uint64_t v119 = swift_allocObject();
          uint64_t v120 = sub_1B5B7DDA4(v118, v119 + v102);
          MEMORY[0x1F4188790](v120);
          v155[-4] = v114;
          v155[-3] = v116;
          uint64_t v153 = v117;
          uint64_t v121 = v157;
          sub_1B5BC9D70();
          swift_bridgeObjectRelease();
          uint64_t v122 = 0;
          uint64_t v123 = v181;
        }
        else
        {
          uint64_t v122 = 1;
          uint64_t v123 = v181;
          uint64_t v121 = v157;
        }
        uint64_t v124 = v158;
        goto LABEL_15;
      }
      swift_unknownObjectRelease();
    }
    uint64_t v122 = 1;
    uint64_t v123 = v181;
    uint64_t v121 = v157;
    uint64_t v124 = v158;
    uint64_t v112 = v74;
LABEL_15:
    uint64_t v127 = v161;
    uint64_t v126 = v162;
    uint64_t v129 = v159;
    uint64_t v128 = v160;
    __swift_storeEnumTagSinglePayload(v121, v122, 1, v195);
    v130 = v164;
    OUTLINED_FUNCTION_66();
    v130();
    sub_1B5B7E444(v121, v124, &qword_1E9D94AE0);
    OUTLINED_FUNCTION_66();
    v130();
    uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94208);
    sub_1B5B7E444(v124, v123 + *(int *)(v131 + 48), &qword_1E9D94AE0);
    sub_1B5B7E758(v121, &qword_1E9D94AE0);
    uint64_t v132 = (void (*)(void))v166;
    OUTLINED_FUNCTION_40();
    v132();
    sub_1B5B7E758(v124, &qword_1E9D94AE0);
    OUTLINED_FUNCTION_40();
    v132();
    uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D941F8);
    __swift_storeEnumTagSinglePayload(v123, 0, 1, v133);
    sub_1B5B7E3E8(v123, v178, (uint64_t *)&unk_1E9D941A0);
    goto LABEL_16;
  }
  uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D941F8);
  __swift_storeEnumTagSinglePayload(v178, 1, 1, v125);
  uint64_t v109 = v75;
  uint64_t v112 = v74;
  uint64_t v127 = v161;
  uint64_t v126 = v162;
  uint64_t v129 = v159;
  uint64_t v128 = v160;
LABEL_16:
  unsigned __int8 v134 = v228;
  LODWORD(v172) = v228;
  v200[0] = *(_DWORD *)v227;
  *(_DWORD *)((char *)v200 + 3) = *(_DWORD *)&v227[3];
  v199[0] = *(_DWORD *)v226;
  *(_DWORD *)((char *)v199 + 3) = *(_DWORD *)&v226[3];
  unsigned __int8 v135 = v225;
  LODWORD(v179) = v225;
  v198[0] = *(_DWORD *)v224;
  *(_DWORD *)((char *)v198 + 3) = *(_DWORD *)&v224[3];
  *(_DWORD *)((char *)v197 + 3) = *(_DWORD *)&v223[3];
  v197[0] = *(_DWORD *)v223;
  unsigned __int8 v136 = v222;
  LODWORD(v180) = v222;
  sub_1B5B7E444(v191, v196, (uint64_t *)&unk_1E9D941B0);
  v171 = *(void (**)(uint64_t, uint64_t, uint64_t))(v194 + 16);
  v171(v193, v192, v195);
  uint64_t v137 = OUTLINED_FUNCTION_41();
  sub_1B5B7E444(v137, v138, v139);
  v201[0] = v176;
  v201[1] = v175;
  LOBYTE(v201[2]) = v134;
  *(_DWORD *)((char *)&v201[2] + 1) = *(_DWORD *)v227;
  HIDWORD(v201[2]) = *(_DWORD *)&v227[3];
  v201[3] = v177;
  LOBYTE(v201[4]) = v174;
  *(_DWORD *)((char *)&v201[4] + 1) = *(_DWORD *)v226;
  HIDWORD(v201[4]) = *(_DWORD *)&v226[3];
  v201[5] = v109;
  v201[6] = v112;
  v201[7] = v62;
  v201[8] = v64;
  LOBYTE(v201[9]) = v135;
  HIDWORD(v201[9]) = *(_DWORD *)&v224[3];
  *(_DWORD *)((char *)&v201[9] + 1) = *(_DWORD *)v224;
  LOBYTE(v201[10]) = v173;
  HIDWORD(v201[10]) = *(_DWORD *)&v223[3];
  *(_DWORD *)((char *)&v201[10] + 1) = *(_DWORD *)v223;
  v201[11] = v126;
  v201[12] = v127;
  v201[13] = v128;
  v201[14] = v129;
  LOBYTE(v201[15]) = v136;
  uint64_t v140 = v170;
  memcpy(v170, v201, 0x79uLL);
  uint64_t v141 = v189;
  v140[16] = v190;
  v140[17] = v141;
  uint64_t v143 = v187;
  uint64_t v142 = v188;
  v140[18] = v187;
  v140[19] = v142;
  uint64_t v187 = v143;
  unint64_t v188 = v142;
  uint64_t v189 = v141;
  uint64_t v144 = v182;
  uint64_t v145 = v186;
  v140[20] = v183;
  v140[21] = v145;
  uint64_t v146 = v184;
  v140[22] = v185;
  v140[23] = v146;
  v140[24] = v144;
  uint64_t v182 = v144;
  *((unsigned char *)v140 + 200) = 0;
  uint64_t v147 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94200);
  sub_1B5B7E444(v196, (uint64_t)v140 + v147[16], (uint64_t *)&unk_1E9D941B0);
  v171((uint64_t)v140 + v147[20], v193, v195);
  sub_1B5B7E444(v181, (uint64_t)v140 + v147[24], (uint64_t *)&unk_1E9D941A0);
  sub_1B5B7D740((uint64_t)v201);
  char v154 = 0;
  uint64_t v153 = v144;
  sub_1B5B7D790(v190, v141, v143, v142);
  char v148 = v169 & 1;
  uint64_t v150 = v175;
  uint64_t v149 = v176;
  sub_1B5B7D780(v176, v175, v169 & 1);
  uint64_t v151 = v177;
  swift_bridgeObjectRetain();
  sub_1B5B7E758(v178, (uint64_t *)&unk_1E9D941A0);
  uint64_t v152 = *(void (**)(void))(v194 + 8);
  OUTLINED_FUNCTION_81();
  v152();
  sub_1B5B7E758(v191, (uint64_t *)&unk_1E9D941B0);
  sub_1B5B7B664(v149, v150, v148);
  swift_bridgeObjectRelease();
  sub_1B5B7E758(v181, (uint64_t *)&unk_1E9D941A0);
  OUTLINED_FUNCTION_81();
  v152();
  sub_1B5B7E758(v196, (uint64_t *)&unk_1E9D941B0);
  char v154 = 0;
  uint64_t v153 = v182;
  sub_1B5B7D7F4(v190, v189, v187, v188);
  uint64_t v202 = v149;
  uint64_t v203 = v150;
  char v204 = v172;
  *(_DWORD *)v205 = v200[0];
  *(_DWORD *)&v205[3] = *(_DWORD *)((char *)v200 + 3);
  uint64_t v206 = v151;
  char v207 = v174;
  *(_DWORD *)v208 = v199[0];
  *(_DWORD *)&v208[3] = *(_DWORD *)((char *)v199 + 3);
  uint64_t v209 = v109;
  uint64_t v210 = v112;
  uint64_t v211 = v62;
  uint64_t v212 = v64;
  char v213 = v179;
  *(_DWORD *)&v214[3] = *(_DWORD *)((char *)v198 + 3);
  *(_DWORD *)v214 = v198[0];
  char v215 = v173;
  *(_DWORD *)&v216[3] = *(_DWORD *)((char *)v197 + 3);
  *(_DWORD *)v216 = v197[0];
  uint64_t v217 = v126;
  uint64_t v218 = v127;
  uint64_t v219 = v128;
  uint64_t v220 = v129;
  char v221 = v180;
  sub_1B5B7D858((uint64_t)&v202);
  OUTLINED_FUNCTION_51_0();
}

void sub_1B5B77CC0()
{
  OUTLINED_FUNCTION_60();
  sub_1B5BC9440();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v0);
  OUTLINED_FUNCTION_3();
  uint64_t v31 = v1;
  OUTLINED_FUNCTION_2_0();
  v33[0] = (*(uint64_t (**)(void))(v2 + 416))();
  v33[1] = v3;
  sub_1B5B744B8();
  uint64_t v4 = sub_1B5BC9B30();
  uint64_t v6 = v5;
  char v8 = v7;
  if (qword_1E9D95880 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1B5BC9AF0();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  sub_1B5B7B664(v4, v6, v8 & 1);
  swift_bridgeObjectRelease();
  uint64_t v16 = sub_1B5BC9E90();
  OUTLINED_FUNCTION_10_0(v16, v17, v18, v19, v20, v21, v22, v23, v25, v26, v27, v28, v29, v30, v9, v11, v15, v13);
  sub_1B5B7B664(v9, v11, v15);
  swift_bridgeObjectRelease();
  memcpy(v33, v32, sizeof(v33));
  OUTLINED_FUNCTION_83();
  sub_1B5B76628(v31);
  sub_1B5B7690C();
  OUTLINED_FUNCTION_38();
  v24();
  sub_1B5BC9E80();
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_53_0();
}

uint64_t *sub_1B5B77E9C()
{
  if (qword_1E9D95880 != -1) {
    swift_once();
  }
  return &qword_1E9D96700;
}

uint64_t sub_1B5B77EE8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
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
    sub_1B5BCA060();
    uint64_t v31 = (void *)sub_1B5BC9990();
    sub_1B5BC9200();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  sub_1B5BC9500();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  char v32 = v21 & 1;
  *(unsigned char *)(a9 + 16) = v32;
  *(void *)(a9 + 24) = v20;
  memcpy((void *)(a9 + 32), __src, 0x70uLL);
  sub_1B5B7D780(a16, v22, v32);
  return swift_bridgeObjectRetain();
}

void *sub_1B5B780C4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
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
    sub_1B5BCA060();
    uint64_t v23 = (void *)sub_1B5BC9990();
    sub_1B5BC9200();
  }
  sub_1B5BC9500();
  sub_1B5B7E444(v13, a9, &qword_1E9D93EF8);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93F00);
  return memcpy((void *)(a9 + *(int *)(v24 + 36)), __src, 0x70uLL);
}

uint64_t sub_1B5B78264(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94178);
    uint64_t v2 = sub_1B5BCA180();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    char v15 = (void *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v16 = v15[1];
    *(void *)&v36[0] = *v15;
    *((void *)&v36[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_1B5B7DD88(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_1B5B7DD88(v35, v36);
    sub_1B5B7DD88(v36, &v32);
    uint64_t result = sub_1B5BCA0F0();
    uint64_t v17 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)(v6 + 8 * (v18 >> 6))) == 0)
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v17) >> 6;
      while (++v19 != v22 || (v21 & 1) == 0)
      {
        BOOL v23 = v19 == v22;
        if (v19 == v22) {
          unint64_t v19 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)(v6 + 8 * v19);
        if (v24 != -1)
        {
          unint64_t v20 = __clz(__rbit64(~v24)) + (v19 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v20 = __clz(__rbit64((-1 << v18) & ~*(void *)(v6 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)(v6 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    uint64_t v25 = *(void *)(v2 + 48) + 40 * v20;
    *(_OWORD *)uint64_t v25 = v28;
    *(_OWORD *)(v25 + 16) = v29;
    *(void *)(v25 + 32) = v30;
    uint64_t result = (uint64_t)sub_1B5B7DD88(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v20));
    ++*(void *)(v2 + 16);
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v26) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v27 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v27 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v27 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }
  int64_t v14 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_36:
    swift_release();
    sub_1B5B7DD98();
    return v2;
  }
  unint64_t v12 = *(void *)(v27 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v26) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_1B5B78608()
{
  OUTLINED_FUNCTION_60();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_1B5BC9440();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_3();
  uint64_t v33 = v5;
  v35[0] = v3;
  v35[1] = v1;
  sub_1B5B744B8();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1B5BC9B30();
  uint64_t v8 = v7;
  char v10 = v9;
  if (qword_1E9D95880 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1B5BC9AF0();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  char v17 = v16 & 1;
  sub_1B5B7B664(v6, v8, v10 & 1);
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_1B5BC9E90();
  OUTLINED_FUNCTION_10_0(v18, v19, v20, v21, v22, v23, v24, v25, v27, v28, v29, v30, v31, v32, v11, v13, v17, v15);
  sub_1B5B7B664(v11, v13, v17);
  swift_bridgeObjectRelease();
  memcpy(v35, v34, sizeof(v35));
  OUTLINED_FUNCTION_83();
  sub_1B5B76628(v33);
  sub_1B5B7690C();
  OUTLINED_FUNCTION_38();
  v26();
  sub_1B5BC9E80();
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_53_0();
}

void sub_1B5B787DC()
{
  OUTLINED_FUNCTION_18();
  char v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  sub_1B5BC9E60();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_12_0();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93EF8);
  uint64_t v12 = OUTLINED_FUNCTION_19_1(v11);
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_25();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93F00);
  uint64_t v14 = OUTLINED_FUNCTION_19_1(v13);
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_27();
  uint64_t v15 = sub_1B5BC9640();
  uint64_t v16 = *(void *)sub_1B5B72878();
  *(void *)uint64_t v1 = v15;
  *(void *)(v1 + 8) = v16;
  *(unsigned char *)(v1 + 16) = 0;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93F08);
  sub_1B5B789F4(v7, v5, v3 & 1, v1 + *(int *)(v17 + 44));
  sub_1B5BC9E90();
  sub_1B5B780C4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v0, 0.0, 1, 0.0, 1);
  sub_1B5B7E758(v1, &qword_1E9D93EF8);
  sub_1B5BC9E50();
  LOBYTE(v5) = sub_1B5BC99A0();
  uint64_t v18 = v9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D93F10) + 36);
  OUTLINED_FUNCTION_80();
  v19();
  *(unsigned char *)(v18 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB840B08) + 36)) = v5;
  sub_1B5B7E444(v0, v9, &qword_1E9D93F00);
  uint64_t v20 = OUTLINED_FUNCTION_55();
  v21(v20);
  sub_1B5B7E758(v0, &qword_1E9D93F00);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1B5B789F4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D940D8);
  uint64_t v13 = OUTLINED_FUNCTION_19_1(v12);
  uint64_t v14 = MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v35 - v17;
  if (a3)
  {
    uint64_t v36 = sub_1B5BC96D0();
    OUTLINED_FUNCTION_2_0();
    uint64_t v20 = (*(uint64_t (**)(void))(v19 + 560))();
    swift_bridgeObjectRelease();
    uint64_t v37 = a2;
    uint64_t v38 = a4;
    uint64_t v44 = (uint64_t)a1;
    if (v20) {
      __int16 v21 = 1;
    }
    else {
      __int16 v21 = 257;
    }
    LOWORD(v45) = v21;
    sub_1B5B7D6A8();
    sub_1B5B7D6F4();
    id v22 = a1;
    sub_1B5BC9830();
    id v23 = v64;
    char v24 = v65;
    char v25 = v66;
    id v26 = v64;

    char v27 = sub_1B5BC99D0();
    sub_1B5B72878();
    sub_1B5BC9320();
    OUTLINED_FUNCTION_7();
    char v28 = sub_1B5BC99B0();
    sub_1B5B7286C();
    sub_1B5BC9320();
    v43[0] = 1;
    v42[0] = v25;
    char v41 = 1;
    char v40 = 0;
    char v39 = 0;
    uint64_t v44 = v36;
    uint64_t v45 = 0;
    char v46 = 1;
    id v47 = v23;
    char v48 = v24;
    char v49 = v25;
    uint64_t v50 = 0;
    char v51 = 1;
    char v52 = v27;
    uint64_t v53 = v4;
    uint64_t v54 = v5;
    uint64_t v55 = v6;
    uint64_t v56 = v7;
    char v57 = 0;
    char v58 = v28;
    uint64_t v59 = v29;
    uint64_t v60 = v30;
    uint64_t v61 = v31;
    uint64_t v62 = v32;
    char v63 = 0;
    nullsub_1(&v44);
    sub_1B5B7E3E8((uint64_t)&v44, (uint64_t)&v64, &qword_1E9D940E0);
    a4 = v38;
  }
  else
  {
    sub_1B5B7D5C8((uint64_t)&v44);
    sub_1B5B7E3E8((uint64_t)&v44, (uint64_t)&v64, &qword_1E9D940E0);
  }
  *(void *)uint64_t v18 = sub_1B5BC96E0();
  *((void *)v18 + 1) = 0;
  v18[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D940E8);
  sub_1B5B78D50();
  sub_1B5B7E3E8((uint64_t)&v64, (uint64_t)v42, &qword_1E9D940E0);
  sub_1B5B7E444((uint64_t)v18, (uint64_t)v16, &qword_1E9D940D8);
  sub_1B5B7E3E8((uint64_t)v42, (uint64_t)v43, &qword_1E9D940E0);
  sub_1B5B7E3E8((uint64_t)v43, a4, &qword_1E9D940E0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D940F0);
  sub_1B5B7E444((uint64_t)v16, a4 + *(int *)(v33 + 48), &qword_1E9D940D8);
  sub_1B5B7D61C((uint64_t)v43);
  sub_1B5B7E758((uint64_t)v18, &qword_1E9D940D8);
  sub_1B5B7E758((uint64_t)v16, &qword_1E9D940D8);
  sub_1B5B7E3E8((uint64_t)v42, (uint64_t)&v44, &qword_1E9D940E0);
  return sub_1B5B7D61C((uint64_t)&v44);
}

void sub_1B5B78D50()
{
  OUTLINED_FUNCTION_46();
  int v74 = v4;
  uint64_t v71 = v5;
  uint64_t v7 = v6;
  uint64_t v68 = v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94108);
  uint64_t v10 = OUTLINED_FUNCTION_19_1(v9);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_4_1();
  uint64_t v86 = v11;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_15_0();
  uint64_t v73 = v13;
  sub_1B5BC9A60();
  OUTLINED_FUNCTION_0_1();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2_0();
  char v76 = v7;
  uint64_t v90 = (*(uint64_t (**)(void))(v17 + 272))();
  uint64_t v91 = v18;
  unint64_t v80 = sub_1B5B744B8();
  uint64_t v19 = sub_1B5BC9B30();
  uint64_t v21 = v20;
  LOBYTE(v7) = v22 & 1;
  sub_1B5BC9A90();
  LODWORD(v78) = *MEMORY[0x1E4F3E0F8];
  uint64_t v79 = v15 + 104;
  OUTLINED_FUNCTION_79();
  v23();
  sub_1B5BC9A70();
  swift_release();
  OUTLINED_FUNCTION_40();
  v24();
  OUTLINED_FUNCTION_69();
  uint64_t v25 = sub_1B5BC9B10();
  uint64_t v83 = v26;
  uint64_t v84 = v25;
  uint64_t v28 = v27;
  uint64_t v85 = v29;
  swift_release();
  int v30 = v74;
  sub_1B5B7B664(v19, v21, (char)v7);
  swift_bridgeObjectRelease();
  char v82 = sub_1B5BC99B0();
  sub_1B5B7286C();
  sub_1B5BC9320();
  OUTLINED_FUNCTION_7();
  char v81 = sub_1B5BC99F0();
  sub_1B5B72878();
  uint64_t v31 = sub_1B5BC9320();
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  char v116 = v28 & 1;
  char v113 = 0;
  char v110 = 0;
  if ((v74 & 0x100) != 0)
  {
    char v41 = v76;
    uint64_t v42 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v76) + 0x140))(v31);
    if (v43)
    {
      uint64_t v90 = v42;
      uint64_t v91 = v43;
      sub_1B5BC9B30();
      char v45 = v44 & 1;
      sub_1B5BC9A80();
      OUTLINED_FUNCTION_79();
      v46();
      sub_1B5BC9A70();
      swift_release();
      OUTLINED_FUNCTION_40();
      v47();
      uint64_t v70 = sub_1B5BC9B10();
      uint64_t v87 = v49;
      uint64_t v88 = v48;
      char v51 = v50;
      swift_release();
      uint64_t v69 = v51 & 1;
      uint64_t v52 = OUTLINED_FUNCTION_41();
      char v41 = v76;
      int v30 = v74;
      sub_1B5B7B664(v52, v53, v45);
      swift_bridgeObjectRelease();
      unsigned __int8 v54 = sub_1B5BC99F0();
      sub_1B5BC9320();
      uint64_t v78 = v55;
      uint64_t v79 = v56;
      unint64_t v80 = v57;
      uint64_t v67 = v58;
      uint64_t v28 = v54;
    }
    else
    {
      uint64_t v69 = 0;
      uint64_t v70 = 0;
      uint64_t v87 = 0;
      uint64_t v88 = 0;
      OUTLINED_FUNCTION_67();
    }
    int v40 = 256;
  }
  else
  {
    int v40 = 0;
    uint64_t v69 = 0;
    uint64_t v70 = 0;
    OUTLINED_FUNCTION_67();
    uint64_t v87 = 1;
    uint64_t v88 = 0;
    char v41 = v76;
  }
  uint64_t v59 = sub_1B5BC9640();
  uint64_t v60 = *(void *)sub_1B5B72860();
  *(void *)uint64_t v73 = v59;
  *(void *)(v73 + 8) = v60;
  *(unsigned char *)(v73 + 16) = 0;
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94110);
  sub_1B5B7936C(v41, v71, v30 & 0x10001 | v40, v73 + *(int *)(v61 + 44));
  char v62 = v116;
  char v63 = v113;
  char v72 = v113;
  LOBYTE(v59) = v110;
  char v75 = v110;
  char v77 = v116;
  sub_1B5B7E444(v73, v86, &qword_1E9D94108);
  v89[0] = v84;
  v89[1] = v83;
  LOBYTE(v89[2]) = v62;
  *(_DWORD *)((char *)&v89[2] + 1) = *(_DWORD *)v115;
  HIDWORD(v89[2]) = *(_DWORD *)&v115[3];
  v89[3] = v85;
  LOBYTE(v89[4]) = v82;
  *(_DWORD *)((char *)&v89[4] + 1) = *(_DWORD *)v114;
  HIDWORD(v89[4]) = *(_DWORD *)&v114[3];
  v89[5] = v0;
  v89[6] = v1;
  v89[7] = v2;
  v89[8] = v3;
  LOBYTE(v89[9]) = v63;
  HIDWORD(v89[9]) = *(_DWORD *)&v112[3];
  *(_DWORD *)((char *)&v89[9] + 1) = *(_DWORD *)v112;
  LOBYTE(v89[10]) = v81;
  HIDWORD(v89[10]) = *(_DWORD *)&v111[3];
  *(_DWORD *)((char *)&v89[10] + 1) = *(_DWORD *)v111;
  v89[11] = v33;
  v89[12] = v35;
  v89[13] = v37;
  v89[14] = v39;
  LOBYTE(v89[15]) = v59;
  memcpy((void *)v68, v89, 0x79uLL);
  *(void *)(v68 + 128) = v70;
  *(void *)(v68 + 136) = v88;
  *(void *)(v68 + 144) = v69;
  *(void *)(v68 + 152) = v87;
  *(void *)(v68 + 160) = v28;
  *(void *)(v68 + 168) = v78;
  *(void *)(v68 + 176) = v80;
  *(void *)(v68 + 184) = v79;
  *(void *)(v68 + 192) = v67;
  *(unsigned char *)(v68 + 200) = 0;
  uint64_t v64 = v68 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94118) + 64);
  sub_1B5B7E444(v86, v64, &qword_1E9D94108);
  sub_1B5B7D740((uint64_t)v89);
  uint64_t v65 = OUTLINED_FUNCTION_75();
  sub_1B5B7D790(v65, v88, v69, v87);
  sub_1B5B7E758(v73, &qword_1E9D94108);
  sub_1B5B7E758(v86, &qword_1E9D94108);
  uint64_t v66 = OUTLINED_FUNCTION_75();
  sub_1B5B7D7F4(v66, v88, v69, v87);
  uint64_t v90 = v84;
  uint64_t v91 = v83;
  char v92 = v77;
  *(_DWORD *)uint64_t v93 = *(_DWORD *)v115;
  *(_DWORD *)&v93[3] = *(_DWORD *)&v115[3];
  uint64_t v94 = v85;
  char v95 = v82;
  *(_DWORD *)char v96 = *(_DWORD *)v114;
  *(_DWORD *)&v96[3] = *(_DWORD *)&v114[3];
  uint64_t v97 = v0;
  uint64_t v98 = v1;
  uint64_t v99 = v2;
  uint64_t v100 = v3;
  char v101 = v72;
  *(_DWORD *)&v102[3] = *(_DWORD *)&v112[3];
  *(_DWORD *)unint64_t v102 = *(_DWORD *)v112;
  char v103 = v81;
  *(_DWORD *)&v104[3] = *(_DWORD *)&v111[3];
  *(_DWORD *)uint64_t v104 = *(_DWORD *)v111;
  uint64_t v105 = v33;
  uint64_t v106 = v35;
  uint64_t v107 = v37;
  uint64_t v108 = v39;
  char v109 = v75;
  sub_1B5B7D858((uint64_t)&v90);
  OUTLINED_FUNCTION_51_0();
}

uint64_t sub_1B5B7936C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X8>)
{
  unsigned int v151 = a3;
  uint64_t v142 = a2;
  uint64_t v138 = a4;
  uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94120);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_37(v12);
  uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94128);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_37(v14);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94130);
  uint64_t v16 = OUTLINED_FUNCTION_19_1(v15);
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_4_1();
  uint64_t v137 = v17;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_37(v19);
  uint64_t v149 = sub_1B5BC9350();
  OUTLINED_FUNCTION_0_1();
  uint64_t v21 = v20;
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_3();
  uint64_t v148 = v23;
  OUTLINED_FUNCTION_56();
  uint64_t v147 = sub_1B5BC96A0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v152 = v24;
  MEMORY[0x1F4188790](v25);
  uint64_t v27 = (char *)&v105 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB840D08);
  OUTLINED_FUNCTION_0_1();
  uint64_t v30 = v29;
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_26();
  uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94140);
  OUTLINED_FUNCTION_0_1();
  uint64_t v33 = v32;
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_59();
  uint64_t v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94148);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v35);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_37(v36);
  uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94150);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v37);
  OUTLINED_FUNCTION_3();
  uint64_t v141 = v38;
  uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94158);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v39);
  OUTLINED_FUNCTION_4_1();
  uint64_t v139 = v40;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v41);
  OUTLINED_FUNCTION_15_0();
  uint64_t v150 = v42;
  uint64_t v43 = swift_allocObject();
  char v44 = (void *)v142;
  *(void *)(v43 + 16) = a1;
  *(void *)(v43 + 24) = v44;
  unsigned int v45 = v151;
  *(unsigned char *)(v43 + 32) = v151 & 1;
  *(unsigned char *)(v43 + 33) = BYTE1(v45) & 1;
  *(unsigned char *)(v43 + 34) = BYTE2(v45) & 1;
  uint64_t v153 = a1;
  char v154 = v44;
  char v46 = a1;
  id v47 = v44;
  int v122 = v45 & 1;
  __int16 v155 = v45 & 0x101;
  int v121 = (v45 >> 8) & 1;
  char v156 = BYTE2(v45) & 1;
  unsigned __int8 v135 = v46;
  id v123 = v47;
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840C60);
  unint64_t v49 = sub_1B5B7DA24();
  uint64_t v125 = v48;
  unint64_t v124 = v49;
  sub_1B5BC9D70();
  sub_1B5BC9690();
  unint64_t v50 = sub_1B5B7E718((uint64_t)&unk_1EB840D00);
  unint64_t v51 = sub_1B5B7B1E0((uint64_t)&unk_1EB840C68);
  unint64_t v120 = v50;
  unint64_t v119 = v51;
  sub_1B5BC9B60();
  uint64_t v52 = *(void *)(v152 + 8);
  uint64_t v129 = v27;
  v152 += 8;
  uint64_t v118 = v52;
  OUTLINED_FUNCTION_38();
  v53();
  uint64_t v54 = *(void *)(v30 + 8);
  uint64_t v126 = v5;
  uint64_t v128 = v28;
  uint64_t v127 = v30 + 8;
  uint64_t v117 = v54;
  OUTLINED_FUNCTION_40();
  v55();
  uint64_t v56 = v21[13];
  uint64_t v57 = v148;
  int v116 = *MEMORY[0x1E4F3C610];
  uint64_t v58 = v149;
  uint64_t v115 = v56;
  char v109 = v21 + 13;
  OUTLINED_FUNCTION_78();
  v59();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v61 = v140;
  char v62 = (uint64_t *)(v140 + *(int *)(v143 + 36));
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840CC0);
  uint64_t v63 = (uint64_t)(v21 + 2);
  uint64_t v114 = v21[2];
  OUTLINED_FUNCTION_66();
  v64();
  *char v62 = KeyPath;
  uint64_t v65 = v33 + 16;
  OUTLINED_FUNCTION_55();
  uint64_t v112 = v66;
  OUTLINED_FUNCTION_74();
  v67();
  uint64_t v68 = (void (*)(void, void))v21[1];
  uint64_t v131 = v21 + 1;
  id v111 = v68;
  v68(v57, v58);
  uint64_t v69 = v141;
  uint64_t v70 = v139;
  uint64_t v71 = *(void *)(v33 + 8);
  uint64_t v142 = v4;
  uint64_t v72 = v151;
  uint64_t v130 = v33 + 8;
  uint64_t v110 = v71;
  OUTLINED_FUNCTION_81();
  v73();
  uint64_t v74 = v61;
  sub_1B5BC99B0();
  char v75 = sub_1B5B7286C();
  sub_1B5BC9320();
  OUTLINED_FUNCTION_7();
  sub_1B5B7E444(v61, v69, &qword_1E9D94148);
  OUTLINED_FUNCTION_22_2();
  sub_1B5BC99C0();
  sub_1B5BC9320();
  OUTLINED_FUNCTION_7();
  char v76 = &qword_1E9D94150;
  sub_1B5B7E444(v69, v70, &qword_1E9D94150);
  uint64_t v77 = OUTLINED_FUNCTION_28();
  sub_1B5B7E758(v77, &qword_1E9D94150);
  uint64_t v78 = v150;
  uint64_t v79 = sub_1B5B7E3E8(v70, v150, (uint64_t *)&unk_1E9D94158);
  if ((v72 & 0x10000) != 0)
  {
    char v76 = v135;
    char v81 = v135;
    char v82 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v135) + 0x1B8))(v79);
    if (!v82)
    {
      OUTLINED_FUNCTION_14_0();
LABEL_11:
      __swift_storeEnumTagSinglePayload((uint64_t)v81, v102, 1, v65);
      sub_1B5B7E3E8((uint64_t)v81, v63, &qword_1E9D94128);
      uint64_t v80 = 0;
      goto LABEL_12;
    }
    char v81 = v82;
    uint64_t v108 = v75;
    if (objc_msgSend(v82, sel_respondsToSelector_, sel_suggestionDismissAction))
    {
      id v83 = objc_msgSend(v81, sel_suggestionDismissAction);
      swift_unknownObjectRelease();
      if (v83)
      {
        unsigned int v151 = (v72 & 0x10000) >> 16;
        id v84 = objc_msgSend(v83, sel_title);

        uint64_t v106 = sub_1B5BC9F40();
        uint64_t v86 = v85;
        uint64_t v105 = v85;

        uint64_t v87 = swift_allocObject();
        uint64_t v107 = &v105;
        uint64_t v88 = v123;
        *(void *)(v87 + 16) = v76;
        *(void *)(v87 + 24) = v88;
        *(unsigned char *)(v87 + 32) = v122;
        *(unsigned char *)(v87 + 33) = v121;
        *(unsigned char *)(v87 + 34) = v151;
        MEMORY[0x1F4188790](v87);
        *(&v105 - 2) = v106;
        *(&v105 - 1) = v86;
        uint64_t v89 = v76;
        id v90 = v88;
        sub_1B5BC9D70();
        swift_bridgeObjectRelease();
        sub_1B5BC9690();
        sub_1B5BC9B60();
        OUTLINED_FUNCTION_55();
        OUTLINED_FUNCTION_31();
        v91();
        OUTLINED_FUNCTION_31();
        v92();
        OUTLINED_FUNCTION_78();
        v93();
        uint64_t v94 = swift_getKeyPath();
        char v95 = (uint64_t *)(v74 + *(int *)(v143 + 36));
        OUTLINED_FUNCTION_66();
        v96();
        *char v95 = v94;
        uint64_t v63 = v142;
        OUTLINED_FUNCTION_74();
        v97();
        OUTLINED_FUNCTION_31();
        v98();
        OUTLINED_FUNCTION_31();
        v99();
        sub_1B5BC99B0();
        sub_1B5BC9320();
        OUTLINED_FUNCTION_7();
        char v76 = &qword_1E9D94148;
        sub_1B5B7E444(v74, v69, &qword_1E9D94148);
        OUTLINED_FUNCTION_22_2();
        sub_1B5BC99C0();
        sub_1B5BC9320();
        OUTLINED_FUNCTION_7();
        sub_1B5B7E444(v69, v70, &qword_1E9D94150);
        uint64_t v100 = OUTLINED_FUNCTION_28();
        sub_1B5B7E758(v100, &qword_1E9D94150);
        uint64_t v72 = sub_1B5BC99F0();
        sub_1B5B72878();
        sub_1B5BC9320();
        OUTLINED_FUNCTION_7();
        uint64_t v74 = v132;
        sub_1B5B7E444(v70, v132, (uint64_t *)&unk_1E9D94158);
        uint64_t v65 = v134;
        uint64_t v101 = v74 + *(int *)(v134 + 36);
        *(unsigned char *)uint64_t v101 = v72;
        *(void *)(v101 + 8) = v6;
        *(void *)(v101 + 16) = v7;
        *(void *)(v101 + 24) = v8;
        *(void *)(v101 + 32) = v9;
        *(unsigned char *)(v101 + 40) = 0;
        sub_1B5B7E758(v70, (uint64_t *)&unk_1E9D94158);
        char v81 = v133;
        sub_1B5B7E3E8(v74, (uint64_t)v133, &qword_1E9D94120);
        OUTLINED_FUNCTION_29();
LABEL_10:
        uint64_t v78 = v150;
        goto LABEL_11;
      }
    }
    else
    {
      swift_unknownObjectRelease();
    }
    OUTLINED_FUNCTION_14_0();
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_29();
LABEL_12:
  __swift_storeEnumTagSinglePayload(v63, v80, 1, v72);
  sub_1B5B7E444(v78, v70, (uint64_t *)&unk_1E9D94158);
  sub_1B5B7E444(v63, (uint64_t)v76, (uint64_t *)&unk_1E9D94130);
  sub_1B5B7E444(v70, v74, (uint64_t *)&unk_1E9D94158);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94168);
  sub_1B5B7E444((uint64_t)v76, v74 + *(int *)(v103 + 48), (uint64_t *)&unk_1E9D94130);
  sub_1B5B7E758(v63, (uint64_t *)&unk_1E9D94130);
  sub_1B5B7E758(v78, (uint64_t *)&unk_1E9D94158);
  sub_1B5B7E758((uint64_t)v76, (uint64_t *)&unk_1E9D94130);
  return sub_1B5B7E758(v70, (uint64_t *)&unk_1E9D94158);
}

void sub_1B5B79F40()
{
}

uint64_t sub_1B5B79F74()
{
  sub_1B5BC9CF0();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v0);
  OUTLINED_FUNCTION_27();
  uint64_t v1 = (void *)sub_1B5B741DC();
  if (v1)
  {
    id v2 = v1;
    sub_1B5BC9CD0();
    OUTLINED_FUNCTION_79();
    v3();
    sub_1B5BC9D20();
    swift_release();
    OUTLINED_FUNCTION_40();
    v4();
    id v5 = objc_msgSend(self, sel_currentDevice);
    objc_msgSend(v5, sel_userInterfaceIdiom);

    double v6 = *(double *)sub_1B5B726F8();
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93F28);
    unint64_t v8 = sub_1B5B7B674();
    sub_1B5BB0668(v7, v8, v6);
    swift_release();

    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93F20);
    return OUTLINED_FUNCTION_63(v9);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93F20);
    uint64_t v11 = OUTLINED_FUNCTION_62();
    return __swift_storeEnumTagSinglePayload(v11, v12, v13, v14);
  }
}

uint64_t sub_1B5B7A164()
{
  return sub_1B5B79F74();
}

uint64_t sub_1B5B7A170()
{
  uint64_t v0 = (void *)sub_1B5B74098();
  if (v0)
  {
    id v1 = v0;
    id v2 = (void *)nullsub_1(v1);
    id v3 = objc_msgSend(self, sel_currentDevice);
    objc_msgSend(v3, sel_userInterfaceIdiom);

    double v4 = *(double *)sub_1B5B726F8();
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93F80);
    unint64_t v6 = sub_1B5B7B850();
    sub_1B5BB0668(v5, v6, v4);

    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93F78);
    return OUTLINED_FUNCTION_63(v7);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93F78);
    uint64_t v9 = OUTLINED_FUNCTION_62();
    return __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
  }
}

uint64_t sub_1B5B7A29C()
{
  return sub_1B5B7A170();
}

uint64_t sub_1B5B7A2A8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93FA8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_26();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93FB0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_16_1();
  if (sub_1B5B743FC()) {
    sub_1B5B72734();
  }
  else {
    sub_1B5B726EC();
  }
  sub_1B5BC9E70();
  OUTLINED_FUNCTION_33();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93FB8);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_23_0();
  v4();
  OUTLINED_FUNCTION_44_0();
  sub_1B5B7E444(v1, v0, &qword_1E9D93FB0);
  swift_storeEnumTagMultiPayload();
  sub_1B5B7B994();
  sub_1B5BC9830();
  return sub_1B5B7E758(v1, &qword_1E9D93FB0);
}

uint64_t sub_1B5B7A474()
{
  return sub_1B5BC93B0();
}

uint64_t sub_1B5B7A494()
{
  id v0 = objc_msgSend(self, sel_linkColor);
  uint64_t result = MEMORY[0x1BA9A7260](v0);
  qword_1E9D96700 = result;
  return result;
}

void sub_1B5B7A4D4()
{
  OUTLINED_FUNCTION_18();
  uint64_t v3 = v2;
  char v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93FD0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_26();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93FD8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_24();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93FE0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_58();
  if ((v5 & 1) != 0 && v3 == 6)
  {
    sub_1B5BC9380();
    sub_1B5B7E718((uint64_t)&unk_1E9D93FE8);
    sub_1B5BC9BA0();
    OUTLINED_FUNCTION_80();
    v15();
    swift_storeEnumTagMultiPayload();
    swift_getOpaqueTypeConformance2();
    OUTLINED_FUNCTION_47();
    sub_1B5BC9830();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v11);
  }
  else
  {
    uint64_t v16 = *(void (**)(void))(v8 + 16);
    OUTLINED_FUNCTION_74();
    v16();
    OUTLINED_FUNCTION_74();
    v16();
    swift_storeEnumTagMultiPayload();
    sub_1B5B7E718((uint64_t)&unk_1E9D93FE8);
    swift_getOpaqueTypeConformance2();
    OUTLINED_FUNCTION_47();
    sub_1B5BC9830();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0, v6);
  }
  OUTLINED_FUNCTION_17();
}

void sub_1B5B7A75C()
{
}

void sub_1B5B7A768()
{
  OUTLINED_FUNCTION_18();
  uint64_t v14 = v3;
  char v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93FF0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93FF8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_16_1();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94000);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_25();
  uint64_t v13 = *(void (**)(void))(v8 + 16);
  if ((v5 & 1) != 0 && v14 == 6)
  {
    OUTLINED_FUNCTION_54();
    v13();
    *(_WORD *)(v2 + *(int *)(v11 + 36)) = 256;
    sub_1B5B7E444(v2, v0, &qword_1E9D94000);
    swift_storeEnumTagMultiPayload();
    sub_1B5B7BA34();
    sub_1B5B7E718((uint64_t)&unk_1E9D94010);
    OUTLINED_FUNCTION_42();
    sub_1B5B7E758(v2, &qword_1E9D94000);
  }
  else
  {
    OUTLINED_FUNCTION_54();
    v13();
    OUTLINED_FUNCTION_54();
    v13();
    swift_storeEnumTagMultiPayload();
    sub_1B5B7BA34();
    sub_1B5B7E718((uint64_t)&unk_1E9D94010);
    OUTLINED_FUNCTION_42();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v6);
  }
  OUTLINED_FUNCTION_17();
}

void sub_1B5B7A978()
{
}

uint64_t sub_1B5B7A984(char a1, uint64_t a2, uint64_t a3)
{
  return sub_1B5B7A990(a1, a2, a3, (uint64_t)&unk_1F0ED0FC0);
}

uint64_t sub_1B5B7A990(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = objc_msgSend(self, sel_currentDevice);
  id v9 = objc_msgSend(v8, sel_userInterfaceIdiom);

  v11[0] = a1;
  id v12 = v9;
  return MEMORY[0x1BA9A7230](v11, a2, a4, a3);
}

void sub_1B5B7AA38(uint64_t a1@<X8>)
{
  sub_1B5B7AA6C();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_1B5B7AA74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1B5B7AAA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B5BC9580();
  *a1 = result;
  return result;
}

uint64_t sub_1B5B7AACC()
{
  return sub_1B5BC9590();
}

unint64_t sub_1B5B7AAF8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_1B5B7ABCC(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1B5B750B8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1B5B750B8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_1B5B7ABCC(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    unint64_t result = sub_1B5B7ACCC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_1B5BCA140();
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

uint64_t sub_1B5B7ACCC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1B5B7AD64(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_1B5B7AE68(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_1B5B7AE68((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B5B7AD64(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1B5B7AE00(v2, 0);
      uint64_t result = sub_1B5BCA120();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_1B5BC9FA0();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1B5B7AE00(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB8419B0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1B5B7AE68(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB8419B0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  id v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[v8] <= v12) {
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

uint64_t sub_1B5B7AF54()
{
  return sub_1B5BC9530();
}

uint64_t sub_1B5B7AF78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B5B7AFA4(a1, a2, a3, a4, MEMORY[0x1E4F3C620], MEMORY[0x1E4F3CF28]);
}

uint64_t sub_1B5B7AFA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v13 - v9, a1);
  return a6(v10);
}

uint64_t sub_1B5B7B04C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1B5BC9600();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1B5B7B080()
{
  return sub_1B5BC9610();
}

uint64_t sub_1B5B7B0B0(void *a1)
{
  id v2 = objc_msgSend(a1, sel_suggestions);

  if (!v2) {
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D942B0);
  uint64_t v3 = sub_1B5BC9FE0();

  return v3;
}

uint64_t sub_1B5B7B11C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B5B7B148()
{
  swift_bridgeObjectRelease();

  swift_release();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

void sub_1B5B7B190()
{
}

uint64_t sub_1B5B7B198(uint64_t a1)
{
  id v2 = *(void **)(a1 + 16);
  swift_bridgeObjectRetain();
  id v3 = v2;
  swift_retain();
  return a1;
}

unint64_t sub_1B5B7B1E0(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1B5B7B224()
{
  unint64_t result = qword_1E9D93E40;
  if (!qword_1E9D93E40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D93E28);
    sub_1B5B7B2A0();
    sub_1B5B7B520();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D93E40);
  }
  return result;
}

unint64_t sub_1B5B7B2A0()
{
  unint64_t result = qword_1E9D93E48;
  if (!qword_1E9D93E48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D93E50);
    sub_1B5B7B31C();
    sub_1B5B7B408();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D93E48);
  }
  return result;
}

unint64_t sub_1B5B7B31C()
{
  unint64_t result = qword_1E9D93E58;
  if (!qword_1E9D93E58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D93E60);
    sub_1B5B7B3BC();
    sub_1B5B7E718((uint64_t)&unk_1E9D93E70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D93E58);
  }
  return result;
}

unint64_t sub_1B5B7B3BC()
{
  unint64_t result = qword_1E9D93E68;
  if (!qword_1E9D93E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D93E68);
  }
  return result;
}

unint64_t sub_1B5B7B408()
{
  unint64_t result = qword_1E9D93E80;
  if (!qword_1E9D93E80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D93E88);
    sub_1B5B7B4D4();
    swift_getOpaqueTypeConformance2();
    sub_1B5B7E718((uint64_t)&unk_1E9D93E98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D93E80);
  }
  return result;
}

unint64_t sub_1B5B7B4D4()
{
  unint64_t result = qword_1E9D93E90;
  if (!qword_1E9D93E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D93E90);
  }
  return result;
}

unint64_t sub_1B5B7B520()
{
  unint64_t result = qword_1E9D93EA8;
  if (!qword_1E9D93EA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D93EB0);
    sub_1B5B7B1E0((uint64_t)&unk_1E9D93EB8);
    sub_1B5B7E718((uint64_t)&unk_1E9D93E70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D93EA8);
  }
  return result;
}

uint64_t type metadata accessor for SGSuggestionsTableCell(uint64_t a1)
{
  return sub_1B5B7B630(a1, qword_1EB842A80);
}

uint64_t type metadata accessor for SectionName(uint64_t a1)
{
  return sub_1B5B7B630(a1, qword_1EB842FE0);
}

uint64_t sub_1B5B7B630(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B5B7B664(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_1B5B7B674()
{
  unint64_t result = qword_1E9D93F30;
  if (!qword_1E9D93F30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D93F28);
    sub_1B5B7E49C((uint64_t)&unk_1E9D93F38);
    sub_1B5B7B804();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D93F30);
  }
  return result;
}

unint64_t sub_1B5B7B71C()
{
  unint64_t result = qword_1E9D93F48;
  if (!qword_1E9D93F48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D93F50);
    sub_1B5B7DFFC((uint64_t)&unk_1E9D93F58);
    sub_1B5B7B7B8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D93F48);
  }
  return result;
}

unint64_t sub_1B5B7B7B8()
{
  unint64_t result = qword_1E9D93F68;
  if (!qword_1E9D93F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D93F68);
  }
  return result;
}

unint64_t sub_1B5B7B804()
{
  unint64_t result = qword_1E9D93F70;
  if (!qword_1E9D93F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D93F70);
  }
  return result;
}

unint64_t sub_1B5B7B850()
{
  unint64_t result = qword_1E9D93F88;
  if (!qword_1E9D93F88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D93F80);
    sub_1B5B7B8CC();
    sub_1B5B7B7B8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D93F88);
  }
  return result;
}

unint64_t sub_1B5B7B8CC()
{
  unint64_t result = qword_1E9D93F90;
  if (!qword_1E9D93F90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D93F98);
    sub_1B5B7B948();
    sub_1B5B7B804();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D93F90);
  }
  return result;
}

unint64_t sub_1B5B7B948()
{
  unint64_t result = qword_1E9D93FA0;
  if (!qword_1E9D93FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D93FA0);
  }
  return result;
}

unint64_t sub_1B5B7B994()
{
  unint64_t result = qword_1E9D93FC0;
  if (!qword_1E9D93FC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D93FB0);
    sub_1B5B7E718((uint64_t)&unk_1E9D93FC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D93FC0);
  }
  return result;
}

unint64_t sub_1B5B7BA34()
{
  unint64_t result = qword_1E9D94008;
  if (!qword_1E9D94008)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94000);
    sub_1B5B7E718((uint64_t)&unk_1E9D94010);
    sub_1B5B7E718((uint64_t)&unk_1E9D94018);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94008);
  }
  return result;
}

uint64_t sub_1B5B7BAF8()
{
  return OUTLINED_FUNCTION_5_0();
}

unint64_t sub_1B5B7BB10()
{
  return sub_1B5B7B1E0((uint64_t)&unk_1E9D94028);
}

uint64_t sub_1B5B7BB58()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5B7BB70()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5B7BB88()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5B7BBA0()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5B7BBB8()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5B7BBD0()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5B7BBE8()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5B7BC00()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t initializeBufferWithCopyOfBuffer for SGSuggestionTableControllerRepresentable(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_1B5B7BC4C(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_1B5B7BC90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  unint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  id v5 = v4;
  swift_retain();
  return a1;
}

uint64_t sub_1B5B7BCF4(void *a1, void *a2)
{
  OUTLINED_FUNCTION_64_0(a1, a2);
  *(void *)(v3 + 8) = *(void *)(v4 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v5 = *(void **)(v2 + 16);
  unint64_t v6 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v5;
  id v7 = v5;

  *(unsigned char *)(v3 + 24) = *(unsigned char *)(v2 + 24);
  *(void *)(v3 + 32) = *(void *)(v2 + 32);
  *(void *)(v3 + 40) = *(void *)(v2 + 40);
  *(void *)(v3 + 48) = *(void *)(v2 + 48);
  swift_retain();
  swift_release();
  return v3;
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

uint64_t sub_1B5B7BD98(void *a1, void *a2)
{
  OUTLINED_FUNCTION_64_0(a1, a2);
  swift_bridgeObjectRelease();
  long long v4 = *(void **)(v3 + 16);
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(v2 + 8);

  *(unsigned char *)(v3 + 24) = *(unsigned char *)(v2 + 24);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)(v2 + 32);
  *(void *)(v3 + 48) = *(void *)(v2 + 48);
  swift_release();
  return v3;
}

uint64_t sub_1B5B7BDF4(uint64_t a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_52(-1);
  }
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
  return OUTLINED_FUNCTION_52(v2);
}

uint64_t sub_1B5B7BE30(uint64_t result, int a2, int a3)
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
      return OUTLINED_FUNCTION_71(result, a2);
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      return OUTLINED_FUNCTION_71(result, a2);
    }
  }
  return result;
}

void type metadata accessor for SGListView()
{
}

void *sub_1B5B7BE80(void *a1, void *a2)
{
  OUTLINED_FUNCTION_6_0();
  if ((*(_DWORD *)(v5 + 80) & 0x20000) != 0)
  {
    *a1 = *a2;
    OUTLINED_FUNCTION_68();
  }
  else
  {
    uint64_t v6 = v4;
    sub_1B5BC91A0();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_23_0();
    v7();
    uint64_t v8 = *(int *)(v6 + 20);
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1B5B7BF1C()
{
  sub_1B5BC91A0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_38();
  v0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B5B7BF88()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_23_0();
  v1();
  OUTLINED_FUNCTION_50();
  uint64_t v3 = v2[1];
  *uint64_t v4 = *v2;
  v4[1] = v3;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1B5B7BFEC()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_1_0();
  uint64_t v1 = OUTLINED_FUNCTION_35();
  v2(v1);
  OUTLINED_FUNCTION_50();
  *uint64_t v4 = *v3;
  v4[1] = v3[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B5B7C060()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = OUTLINED_FUNCTION_35();
  v4(v3);
  *(_OWORD *)(v2 + *(int *)(v0 + 20)) = *(_OWORD *)(v1 + *(int *)(v0 + 20));
  return v2;
}

uint64_t sub_1B5B7C0BC()
{
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_1_0();
  uint64_t v1 = OUTLINED_FUNCTION_35();
  v2(v1);
  OUTLINED_FUNCTION_50();
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  *uint64_t v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1B5B7C120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B5B7C134);
}

uint64_t sub_1B5B7C134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_82();
  sub_1B5BC91A0();
  OUTLINED_FUNCTION_6_0();
  if (*(_DWORD *)(v7 + 84) != a2) {
    return OUTLINED_FUNCTION_73(*(void *)(v3 + *(int *)(a3 + 20) + 8));
  }
  return __swift_getEnumTagSinglePayload(v3, a2, v6);
}

uint64_t sub_1B5B7C1B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B5B7C1CC);
}

void sub_1B5B7C1CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1B5BC91A0();
  OUTLINED_FUNCTION_6_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
}

uint64_t sub_1B5B7C25C()
{
  uint64_t result = sub_1B5BC91A0();
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_9(result);
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_1B5B7C2D0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1B5B7C300()
{
  return swift_bridgeObjectRelease();
}

void *sub_1B5B7C308(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_1B5B7C34C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B5B7C380(uint64_t a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_52(-1);
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16))
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
  return OUTLINED_FUNCTION_52(v2);
}

uint64_t sub_1B5B7C3BC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
      return OUTLINED_FUNCTION_71(result, a2);
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      return OUTLINED_FUNCTION_71(result, a2);
    }
  }
  return result;
}

void type metadata accessor for SectionHeader()
{
}

uint64_t sub_1B5B7C3FC(uint64_t a1)
{
  OUTLINED_FUNCTION_6_0();
  int v5 = *(_DWORD *)(v4 + 80);
  uint64_t v6 = *(void **)v2;
  *(void *)a1 = *(void *)v2;
  if ((v5 & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_68();
  }
  else
  {
    uint64_t v7 = *(void **)(v2 + 8);
    *(void *)(a1 + 8) = v7;
    *(_WORD *)(a1 + 16) = *(_WORD *)(v2 + 16);
    *(unsigned char *)(a1 + 18) = *(unsigned char *)(v2 + 18);
    uint64_t v8 = *(int *)(v3 + 28);
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (void *)(v2 + v8);
    id v11 = v6;
    id v12 = v7;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D93EC0);
    if (OUTLINED_FUNCTION_48_0() == 1)
    {
      sub_1B5BC9440();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_23_0();
      v13();
    }
    else
    {
      *uint64_t v9 = *v10;
      swift_retain();
    }
    OUTLINED_FUNCTION_41();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1B5B7C4E0(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 28);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D93EC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1B5BC9440();
    OUTLINED_FUNCTION_1_0();
    uint64_t v7 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
    return v7(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

void *sub_1B5B7C598(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = OUTLINED_FUNCTION_61((uint64_t)a1, (uint64_t)a2);
  uint64_t v6 = *(int *)(v5 + 28);
  uint64_t v7 = (void *)(v4 + v6);
  uint64_t v9 = (void *)(v8 + v6);
  id v11 = v10;
  id v12 = v3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D93EC0);
  if (OUTLINED_FUNCTION_48_0() == 1)
  {
    sub_1B5BC9440();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_23_0();
    v13();
  }
  else
  {
    void *v7 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_1B5B7C650()
{
  OUTLINED_FUNCTION_76();
  uint64_t v4 = *v3;
  *uint64_t v3 = v5;
  id v6 = v5;

  uint64_t v7 = *(void **)(v2 + 8);
  uint64_t v8 = *(void **)(v0 + 8);
  *(void *)(v0 + 8) = v7;
  id v9 = v7;

  OUTLINED_FUNCTION_30();
  if (!v10)
  {
    uint64_t v11 = *(int *)(v1 + 28);
    id v12 = (void *)(v0 + v11);
    uint64_t v13 = (void *)(v2 + v11);
    uint64_t v14 = OUTLINED_FUNCTION_41();
    sub_1B5B7E758(v14, v15);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D93EC0);
    if (OUTLINED_FUNCTION_48_0() == 1)
    {
      sub_1B5BC9440();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_23_0();
      v16();
    }
    else
    {
      *id v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v0;
}

uint64_t sub_1B5B7C72C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = (void *)(a1 + v4);
  id v6 = (const void *)(a2 + v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D93EC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1B5BC9440();
    OUTLINED_FUNCTION_1_0();
    uint64_t v8 = OUTLINED_FUNCTION_65_0();
    v9(v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_1B5B7C7FC()
{
  OUTLINED_FUNCTION_76();
  uint64_t v4 = *v3;
  *uint64_t v3 = v5;

  id v6 = *(void **)(v0 + 8);
  *(void *)(v0 + 8) = *(void *)(v2 + 8);

  OUTLINED_FUNCTION_30();
  if (!v7)
  {
    uint64_t v8 = *(int *)(v1 + 28);
    id v9 = (void *)(v0 + v8);
    char v10 = (const void *)(v2 + v8);
    sub_1B5B7E758(v0 + v8, (uint64_t *)&unk_1E9D93EC0);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D93EC0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_1B5BC9440();
      OUTLINED_FUNCTION_1_0();
      uint64_t v12 = OUTLINED_FUNCTION_65_0();
      v13(v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  return v0;
}

uint64_t sub_1B5B7C8E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B5B7C8FC);
}

uint64_t sub_1B5B7C8FC(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return OUTLINED_FUNCTION_73(*a1);
  }
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94030);
  uint64_t v8 = (uint64_t)a1 + *(int *)(a3 + 28);
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t sub_1B5B7C97C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B5B7C990);
}

void *sub_1B5B7C990(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94030);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 28);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_1B5B7CA14()
{
  sub_1B5B7CABC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1B5B7CABC()
{
  if (!qword_1E9D94040)
  {
    sub_1B5BC9440();
    unint64_t v0 = sub_1B5BC9360();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9D94040);
    }
  }
}

void *sub_1B5B7CB14(void *a1, void *a2)
{
  uint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  OUTLINED_FUNCTION_61((uint64_t)a1, (uint64_t)a2);
  id v5 = v4;
  id v6 = v3;
  return a1;
}

void sub_1B5B7CB4C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

unsigned char *sub_1B5B7CB88(void **a1, void **a2)
{
  OUTLINED_FUNCTION_49(a1, a2);

  id v5 = *(void **)(v2 + 8);
  id v6 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v5;
  id v7 = v5;

  return OUTLINED_FUNCTION_39();
}

__n128 __swift_memcpy19_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_DWORD *)(a1 + 15) = *(_DWORD *)(a2 + 15);
  *(__n128 *)a1 = result;
  return result;
}

unsigned char *sub_1B5B7CBE0(uint64_t a1, _OWORD *a2)
{
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return OUTLINED_FUNCTION_39();
}

uint64_t sub_1B5B7CC20(uint64_t *a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_52(-1);
  }
  if (a2 < 0 && *((unsigned char *)a1 + 19))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    uint64_t v2 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v2) = -1;
    }
  }
  return OUTLINED_FUNCTION_52(v2);
}

void *sub_1B5B7CC5C(void *result, int a2, int a3)
{
  if (a2 < 0)
  {
    *((unsigned char *)result + 18) = 0;
    *((_WORD *)result + 8) = 0;
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
    if (a3 < 0) {
      *((unsigned char *)result + 19) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
      return OUTLINED_FUNCTION_70(result, a2);
    }
    *((unsigned char *)result + 19) = 0;
    if (a2) {
      return OUTLINED_FUNCTION_70(result, a2);
    }
  }
  return result;
}

void type metadata accessor for SGSuggestionsCustomizationBTableCell()
{
}

void type metadata accessor for ImageView()
{
}

uint64_t sub_1B5B7CCB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  id v4 = v3;
  return a1;
}

void sub_1B5B7CCF0(id *a1)
{
}

uint64_t sub_1B5B7CCF8(void **a1, void **a2)
{
  OUTLINED_FUNCTION_49(a1, a2);

  *(unsigned char *)(v3 + 8) = *(unsigned char *)(v2 + 8);
  return v3;
}

uint64_t sub_1B5B7CD30(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  return a1;
}

uint64_t sub_1B5B7CD70(uint64_t *a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_52(-1);
  }
  if (a2 < 0 && *((unsigned char *)a1 + 9))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    uint64_t v2 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v2) = -1;
    }
  }
  return OUTLINED_FUNCTION_52(v2);
}

void *sub_1B5B7CDAC(void *result, int a2, int a3)
{
  if (a2 < 0)
  {
    *((unsigned char *)result + 8) = 0;
    *__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *((unsigned char *)result + 9) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
      return OUTLINED_FUNCTION_70(result, a2);
    }
    *((unsigned char *)result + 9) = 0;
    if (a2) {
      return OUTLINED_FUNCTION_70(result, a2);
    }
  }
  return result;
}

void type metadata accessor for ImageSGView()
{
}

void type metadata accessor for ImageSizeModifier()
{
}

void type metadata accessor for CustomizationBCellModifier()
{
}

uint64_t sub_1B5B7CE10(unsigned __int8 *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && a1[16])
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

uint64_t sub_1B5B7CE5C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for ImageClipShapeModifier()
{
}

unint64_t sub_1B5B7CEAC()
{
  unint64_t result = qword_1E9D94048;
  if (!qword_1E9D94048)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94050);
    sub_1B5B7B224();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94048);
  }
  return result;
}

uint64_t sub_1B5B7CF20()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B5B7CF70()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1B5B7D044()
{
  unint64_t result = qword_1E9D94058;
  if (!qword_1E9D94058)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1E9D93F10);
    sub_1B5B7D0E4();
    sub_1B5B7E718((uint64_t)&unk_1EB840B00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94058);
  }
  return result;
}

unint64_t sub_1B5B7D0E4()
{
  unint64_t result = qword_1E9D94060;
  if (!qword_1E9D94060)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D93F00);
    sub_1B5B7E718((uint64_t)&unk_1E9D94068);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94060);
  }
  return result;
}

unint64_t sub_1B5B7D184()
{
  return sub_1B5B7D20C((uint64_t)&unk_1E9D94078);
}

unint64_t sub_1B5B7D1C8()
{
  return sub_1B5B7D20C((uint64_t)&unk_1E9D94088);
}

unint64_t sub_1B5B7D20C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    OUTLINED_FUNCTION_57(0, v5);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1B5B7D2AC()
{
  unint64_t result = qword_1E9D94098;
  if (!qword_1E9D94098)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D940A0);
    sub_1B5B7B994();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94098);
  }
  return result;
}

unint64_t sub_1B5B7D324()
{
  unint64_t result = qword_1E9D940A8;
  if (!qword_1E9D940A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D940B0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D93FD0);
    sub_1B5B7E718((uint64_t)&unk_1E9D93FE8);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D940A8);
  }
  return result;
}

unint64_t sub_1B5B7D400()
{
  unint64_t result = qword_1E9D940B8;
  if (!qword_1E9D940B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D940C0);
    sub_1B5B7BA34();
    sub_1B5B7E718((uint64_t)&unk_1E9D94010);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D940B8);
  }
  return result;
}

uint64_t sub_1B5B7D4A0(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB026CustomizationBCellModifierVGAaBHPxAaBHD1__AgA0cJ0HPyHCHCTm(a1, (uint64_t)&unk_1F0ED0FC0, (void (*)(void))sub_1B5B7D4C0);
}

unint64_t sub_1B5B7D4C0()
{
  unint64_t result = qword_1E9D940C8;
  if (!qword_1E9D940C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D940C8);
  }
  return result;
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB026CustomizationBCellModifierVGAaBHPxAaBHD1__AgA0cJ0HPyHCHCTm(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return swift_getWitnessTable();
}

void type metadata accessor for UIUserInterfaceIdiom()
{
  if (!qword_1EB841780)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EB841780);
    }
  }
}

double sub_1B5B7D5C8(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 32) = 65280;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 129) = 0u;
  return result;
}

id sub_1B5B7D5F8(int a1, int a2, int a3, id a4, __int16 a5)
{
  if ((~a5 & 0xFF00) != 0) {
    return a4;
  }
  return result;
}

uint64_t sub_1B5B7D61C(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_45(a1);
  char v5 = *(unsigned char *)(v1 + 144);
  v3(v2, *(void *)(v1 + 8), *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88), *(void *)(v1 + 96), *(void *)(v1 + 104), *(void *)(v1 + 112), *(void *)(v1 + 120), *(void *)(v1 + 128), *(void *)(v1 + 136), v5);
  return v1;
}

void sub_1B5B7D684(int a1, int a2, int a3, id a4, __int16 a5)
{
  if ((~a5 & 0xFF00) != 0) {
}
  }

unint64_t sub_1B5B7D6A8()
{
  unint64_t result = qword_1E9D940F8;
  if (!qword_1E9D940F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D940F8);
  }
  return result;
}

unint64_t sub_1B5B7D6F4()
{
  unint64_t result = qword_1E9D94100;
  if (!qword_1E9D94100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94100);
  }
  return result;
}

uint64_t sub_1B5B7D740(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B5B7D780(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1B5B7D790(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4 != 1) {
    return sub_1B5B7D7B0(result, a2, a3, a4);
  }
  return result;
}

uint64_t sub_1B5B7D7B0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1B5B7D780(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1B5B7D7F4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4 != 1) {
    return sub_1B5B7D814(result, a2, a3, a4);
  }
  return result;
}

uint64_t sub_1B5B7D814(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1B5B7B664(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1B5B7D858(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B5B7D898()
{
  return MEMORY[0x1F4186498](v0, 35, 7);
}

void *sub_1B5B7D8D8()
{
  OUTLINED_FUNCTION_72();
  unint64_t result = (void *)(*(uint64_t (**)(void))(v0 + 440))();
  if (result)
  {
    id v2 = objc_msgSend(result, sel_suggestionPrimaryAction);
    objc_msgSend(v2, sel_execute);

    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1B5B7D980()
{
  OUTLINED_FUNCTION_72();
  (*(void (**)(void))(v0 + 416))();
  sub_1B5B744B8();
  sub_1B5BC9B30();
  OUTLINED_FUNCTION_77();
  uint64_t KeyPath = swift_getKeyPath();
  return OUTLINED_FUNCTION_34(KeyPath);
}

unint64_t sub_1B5B7DA24()
{
  unint64_t result = qword_1EB840C58;
  if (!qword_1EB840C58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840C60);
    sub_1B5B7E718((uint64_t)&unk_1EB841650);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840C58);
  }
  return result;
}

void sub_1B5B7DAC4()
{
  uint64_t v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **(void **)(v0 + 16)) + 0x1B8))();
  if (v1)
  {
    id v2 = v1;
    if (objc_msgSend(v1, sel_respondsToSelector_, sel_suggestionDismissAction))
    {
      id v3 = objc_msgSend(v2, sel_suggestionDismissAction);
      objc_msgSend(v3, sel_execute);
    }
    swift_unknownObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94170);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B5BCC700;
  char v5 = (uint64_t *)sub_1B5B9F5F8();
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  *(void *)(inited + 32) = v7;
  *(void *)(inited + 40) = v6;
  *(void *)(inited + 48) = 0;
  swift_bridgeObjectRetain();
  uint64_t v8 = (uint64_t *)sub_1B5B9F604();
  uint64_t v10 = *v8;
  uint64_t v9 = v8[1];
  *(void *)(inited + 56) = v10;
  *(void *)(inited + 64) = v9;
  *(void *)(inited + 72) = 0;
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_1B5BC9ED0();
  id v12 = objc_msgSend(self, sel_defaultCenter);
  sub_1B5B9F5EC();
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_1B5B78264(v11);
  swift_bridgeObjectRelease();
  uint64_t v15 = OUTLINED_FUNCTION_55();
  sub_1B5B7DCEC(v15, v16, v14, v12);
}

uint64_t sub_1B5B7DC74()
{
  sub_1B5B744B8();
  swift_bridgeObjectRetain();
  sub_1B5BC9B30();
  OUTLINED_FUNCTION_77();
  uint64_t KeyPath = swift_getKeyPath();
  return OUTLINED_FUNCTION_34(KeyPath);
}

void sub_1B5B7DCEC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = (id)sub_1B5BC9EB0();
  swift_bridgeObjectRelease();
  objc_msgSend(a4, sel_postNotificationName_object_userInfo_, a1, a2, v7);
}

_OWORD *sub_1B5B7DD88(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1B5B7DD98()
{
  return swift_release();
}

uint64_t sub_1B5B7DDA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SGSuggestionsTableCell(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *sub_1B5B7DE08()
{
  uint64_t v0 = type metadata accessor for SGSuggestionsTableCell(0);
  OUTLINED_FUNCTION_9(v0);
  OUTLINED_FUNCTION_2_0();
  unint64_t result = (void *)(*(uint64_t (**)(void))(v1 + 440))();
  if (result)
  {
    id v3 = objc_msgSend(result, sel_suggestionPrimaryAction);
    objc_msgSend(v3, sel_execute);

    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void sub_1B5B7DEB8()
{
}

unint64_t sub_1B5B7DEC0()
{
  unint64_t result = qword_1E9D941C0;
  if (!qword_1E9D941C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1E9D94B20);
    sub_1B5B7DF60();
    sub_1B5B7E718((uint64_t)&unk_1E9D94B50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D941C0);
  }
  return result;
}

unint64_t sub_1B5B7DF60()
{
  unint64_t result = qword_1E9D94B30;
  if (!qword_1E9D94B30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1E9D941D0);
    sub_1B5B7DFFC((uint64_t)&unk_1E9D94B40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94B30);
  }
  return result;
}

unint64_t sub_1B5B7DFFC(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    OUTLINED_FUNCTION_57(0, v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t objectdestroy_46Tm()
{
  uint64_t v1 = *(void *)(type metadata accessor for SGSuggestionsTableCell(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D93EC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1B5BC9440();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_38();
    v5();
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, v3 + v4, v2 | 7);
}

void sub_1B5B7E174()
{
  uint64_t v1 = type metadata accessor for SGSuggestionsTableCell(0);
  OUTLINED_FUNCTION_9(v1);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  OUTLINED_FUNCTION_2_0();
  char v5 = (void *)(*(uint64_t (**)(void))(v4 + 440))();
  if (v5)
  {
    uint64_t v6 = v5;
    if (objc_msgSend(v5, sel_respondsToSelector_, sel_suggestionDismissAction))
    {
      id v7 = objc_msgSend(v6, sel_suggestionDismissAction);
      objc_msgSend(v7, sel_execute);
    }
    swift_unknownObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94170);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B5BCC700;
  uint64_t v9 = (uint64_t *)sub_1B5B9F5F8();
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *(void *)(inited + 32) = v11;
  *(void *)(inited + 40) = v10;
  *(void *)(inited + 48) = 0;
  swift_bridgeObjectRetain();
  id v12 = (uint64_t *)sub_1B5B9F604();
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *(void *)(inited + 56) = v14;
  *(void *)(inited + 64) = v13;
  *(void *)(inited + 72) = 0;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1B5BC9ED0();
  id v16 = objc_msgSend(self, sel_defaultCenter);
  sub_1B5B9F5EC();
  swift_bridgeObjectRetain();
  uint64_t v17 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(v3 + 8);
  uint64_t v19 = sub_1B5B78264(v15);
  swift_bridgeObjectRelease();
  sub_1B5B7DCEC((uint64_t)v17, v18, v19, v16);
}

void sub_1B5B7E330()
{
}

uint64_t sub_1B5B7E33C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_23_0();
  v4();
  return a2;
}

uint64_t sub_1B5B7E398()
{
  uint64_t v1 = OUTLINED_FUNCTION_82();
  v2(v1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_38();
  v3();
  return v0;
}

uint64_t sub_1B5B7E3E8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_1B5B7E444(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_23_0();
  v4();
  return a2;
}

unint64_t sub_1B5B7E49C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    OUTLINED_FUNCTION_57(0, v4);
    v2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1B5B7E508()
{
  unint64_t result = qword_1E9D94288;
  if (!qword_1E9D94288)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94238);
    sub_1B5B7E5A8();
    sub_1B5B7E718((uint64_t)&unk_1E9D942A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94288);
  }
  return result;
}

unint64_t sub_1B5B7E5A8()
{
  unint64_t result = qword_1E9D94290;
  if (!qword_1E9D94290)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94230);
    sub_1B5B7E648();
    sub_1B5B7E718((uint64_t)&unk_1EB841158);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94290);
  }
  return result;
}

unint64_t sub_1B5B7E648()
{
  unint64_t result = qword_1E9D94298;
  if (!qword_1E9D94298)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94228);
    sub_1B5B7B1E0((uint64_t)&unk_1E9D942A0);
    sub_1B5B7E718((uint64_t)&unk_1EB840AE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94298);
  }
  return result;
}

unint64_t sub_1B5B7E718(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_1B5B7E758(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_38();
  v3();
  return a1;
}

id SGBannerContent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id SGBannerContent.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_attributedTitle] = 0;
  id v1 = &v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_subtitle];
  *(void *)id v1 = 0;
  *((void *)v1 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_attributedSubtitle] = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_images];
  *(void *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_images] = 0;
  uint64_t v3 = &v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_suggestion];
  *(void *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_suggestion] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v4 = &v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_imageSGViews];
  *(void *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_imageSGViews] = 0;
  uint64_t v5 = &v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_listTitle];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  uint64_t v22 = (void **)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_backgroundVisualEffectView];
  *(void *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_backgroundVisualEffectView] = 0;
  uint64_t v6 = (void **)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_backgroundColor];
  *(void *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_backgroundColor] = 0;
  id v7 = (void **)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_bannerDivider];
  *(void *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_bannerDivider] = 0;
  uint64_t v23 = (void **)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_primaryAction];
  *(void *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_primaryAction] = 0;
  uint64_t v24 = (void **)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_dismissAction];
  *(void *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_dismissAction] = 0;
  uint64_t v25 = &v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_iconSFSymbols];
  *(void *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_iconSFSymbols] = 0;
  uint64_t v8 = self;
  uint64_t v9 = v0;
  id v10 = objc_msgSend(v8, sel_currentDevice);
  id v11 = objc_msgSend(v10, sel_userInterfaceIdiom);

  uint64_t v12 = OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_bannerForVisionDevice;
  v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_bannerForVisionDevice] = v11 == (id)6;
  uint64_t v13 = &v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_title];
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0xE000000000000000;
  OUTLINED_FUNCTION_3_0();
  *(_OWORD *)id v1 = xmmword_1B5BCCC90;
  swift_bridgeObjectRelease();
  *(void *)&v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_accessoryType] = 0;
  OUTLINED_FUNCTION_3_0();
  *(void *)uint64_t v2 = 0;
  swift_bridgeObjectRelease();
  uint64_t v14 = &v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_actionTitle];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0xE000000000000000;
  OUTLINED_FUNCTION_3_0();
  *(void *)uint64_t v3 = 0;
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_3_0();
  swift_unknownObjectWeakAssign();
  *(void *)&v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_primaryActionButtonWidth] = 0;
  *(void *)&v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_closeButtonWidth] = 0;
  uint64_t v15 = 1;
  if (v9[v12]) {
    uint64_t v15 = 2;
  }
  *(void *)&v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_actionButtonType] = v15;
  OUTLINED_FUNCTION_3_0();
  *(void *)uint64_t v4 = 0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_0();
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_0();
  id v16 = *v6;
  *uint64_t v6 = 0;

  OUTLINED_FUNCTION_3_0();
  uint64_t v17 = *v7;
  void *v7 = 0;

  OUTLINED_FUNCTION_3_0();
  uint64_t v18 = *v22;
  *uint64_t v22 = 0;

  v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_suggestionCategorySupportsBatchDismissal] = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v19 = *v23;
  *uint64_t v23 = 0;

  OUTLINED_FUNCTION_3_0();
  uint64_t v20 = *v24;
  *uint64_t v24 = 0;

  *(void *)&v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_closeButtonXAnchorOffset] = 0;
  v9[OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_prominentActionButton] = 0;
  OUTLINED_FUNCTION_3_0();
  *(void *)uint64_t v25 = 0;

  swift_bridgeObjectRelease();
  v26.receiver = v9;
  v26.super_class = (Class)type metadata accessor for SGBannerContent();
  return objc_msgSendSuper2(&v26, sel_init);
}

uint64_t sub_1B5B7EBB4()
{
  return sub_1B5B7F83C();
}

uint64_t sub_1B5B7EBD8(uint64_t a1, uint64_t a2)
{
  return sub_1B5B7F908(a1, a2);
}

uint64_t sub_1B5B7EBE4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x110))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1B5B7EC48(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x118);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t (*sub_1B5B7ECC8())()
{
  return j_j__swift_endAccess;
}

void *sub_1B5B7ED44()
{
  OUTLINED_FUNCTION_1();
  id v1 = *v0;
  id v2 = v1;
  return v1;
}

void sub_1B5B7EDC8(void *a1)
{
}

uint64_t sub_1B5B7EDD4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x128))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B7EE38(id *a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x130);
  id v4 = *a1;
  return v3(v2);
}

void (*sub_1B5B7EEA8(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  OUTLINED_FUNCTION_7_1();
  id v4 = *v1;
  v3[3] = *v1;
  id v5 = v4;
  return sub_1B5B7EF1C;
}

void sub_1B5B7EF1C(uint64_t a1, char a2)
{
}

uint64_t sub_1B5B7EF4C()
{
  return sub_1B5B7F83C();
}

uint64_t sub_1B5B7EF70(uint64_t a1, uint64_t a2)
{
  return sub_1B5B7F908(a1, a2);
}

uint64_t sub_1B5B7EF7C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x140))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1B5B7EFE0(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x148);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t (*sub_1B5B7F060())()
{
  return j_j__swift_endAccess;
}

void *sub_1B5B7F0DC()
{
  OUTLINED_FUNCTION_1();
  id v1 = *v0;
  id v2 = v1;
  return v1;
}

void sub_1B5B7F160(void *a1)
{
}

void sub_1B5B7F16C(id a1, void *a2)
{
  uint64_t v4 = v2;
  if (a1
    && (objc_msgSend(a1, sel_mutableCopy),
        sub_1B5BCA0E0(),
        swift_unknownObjectRelease(),
        sub_1B5B7447C(0, (unint64_t *)&unk_1E9D93CD0),
        swift_dynamicCast()))
  {
    id v6 = v11;
  }
  else
  {
    sub_1B5B7447C(0, (unint64_t *)&unk_1E9D93CD0);
    id v6 = sub_1B5B73374();
  }
  id v7 = (void **)(v4 + *a2);
  OUTLINED_FUNCTION_3_0();
  uint64_t v8 = *v7;
  void *v7 = v6;

  uint64_t v9 = (void **)(v4 + *a2);
  OUTLINED_FUNCTION_3_0();
  id v10 = *v9;
  *uint64_t v9 = a1;
}

uint64_t sub_1B5B7F284@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x158))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B7F2E8(id *a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x160);
  id v4 = *a1;
  return v3(v2);
}

void (*sub_1B5B7F358(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  OUTLINED_FUNCTION_7_1();
  id v4 = *v1;
  v3[3] = *v1;
  id v5 = v4;
  return sub_1B5B7F3CC;
}

void sub_1B5B7F3CC(uint64_t a1, char a2)
{
}

void sub_1B5B7F3E4(uint64_t a1, char a2, void (*a3)(id))
{
  id v4 = *(void **)a1;
  id v6 = (id *)(*(void *)a1 + 24);
  id v5 = *v6;
  if (a2)
  {
    id v7 = v5;
    a3(v5);
  }
  else
  {
    a3(*(id *)(*(void *)a1 + 24));
  }
  free(v4);
}

uint64_t sub_1B5B7F488()
{
  OUTLINED_FUNCTION_1();
  return *(void *)v0;
}

uint64_t sub_1B5B7F4E4(uint64_t a1)
{
  uint64_t result = OUTLINED_FUNCTION_2();
  *id v1 = a1;
  return result;
}

uint64_t sub_1B5B7F51C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x170))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B7F580(void *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x178))(*a1);
}

uint64_t (*sub_1B5B7F5E0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B5B7F650()
{
  return sub_1B5B81918(&OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_images, MEMORY[0x1E4FBC8A8]);
}

uint64_t sub_1B5B7F698(uint64_t a1)
{
  return sub_1B5B819FC(a1, (uint64_t)&OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_images, MEMORY[0x1E4FBC898]);
}

uint64_t sub_1B5B7F6B8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x188))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B7F71C(uint64_t a1, void **a2)
{
  id v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x190);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t (*sub_1B5B7F788())()
{
  return j_j__swift_endAccess;
}

id sub_1B5B7F7E8(void *a1, uint64_t a2, void (*a3)(void))
{
  a3();
  sub_1B5BC9F00();
  OUTLINED_FUNCTION_10();
  return a1;
}

uint64_t sub_1B5B7F830()
{
  return sub_1B5B7F83C();
}

uint64_t sub_1B5B7F83C()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void sub_1B5B7F894(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  sub_1B5BC9F40();
  id v6 = a1;
  uint64_t v7 = OUTLINED_FUNCTION_8_1();
  a4(v7);
}

uint64_t sub_1B5B7F8FC(uint64_t a1, uint64_t a2)
{
  return sub_1B5B7F908(a1, a2);
}

uint64_t sub_1B5B7F908(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_2();
  *id v2 = a1;
  v2[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B5B7F950@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x1A0))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1B5B7F9B4(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x1A8);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t (*sub_1B5B7FA34())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B5B7FAB0()
{
  return sub_1B5B81918(&OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_suggestion, MEMORY[0x1E4FBC900]);
}

uint64_t sub_1B5B7FB24(uint64_t a1)
{
  return sub_1B5B819FC(a1, (uint64_t)&OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_suggestion, MEMORY[0x1E4FBC8F8]);
}

uint64_t sub_1B5B7FB44@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x1B8))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B7FBA8(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x1C0);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t (*sub_1B5B7FC14())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B5B7FC94()
{
  OUTLINED_FUNCTION_1();
  return MEMORY[0x1BA9A8120](v0);
}

uint64_t sub_1B5B7FD20()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_1B5B7FD68@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x1D0))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B7FDCC(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x1D8);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

void (*sub_1B5B7FE38(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_delegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1BA9A8120](v5);
  return sub_1B5B7FEBC;
}

void sub_1B5B7FEBC(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

double sub_1B5B7FF60()
{
  OUTLINED_FUNCTION_1();
  return *(double *)v0;
}

uint64_t sub_1B5B7FFB8(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_primaryActionButtonWidth);
  uint64_t result = OUTLINED_FUNCTION_3_0();
  *uint64_t v3 = a1;
  return result;
}

void sub_1B5B80004(void **a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x1E8))();
}

uint64_t sub_1B5B80068(double *a1, void **a2)
{
  return (*(uint64_t (**)(double))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x1F0))(*a1);
}

uint64_t (*sub_1B5B800C8())()
{
  return j_j__swift_endAccess;
}

double sub_1B5B80134()
{
  OUTLINED_FUNCTION_1();
  return *(double *)v0;
}

uint64_t sub_1B5B8018C(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_closeButtonWidth);
  uint64_t result = OUTLINED_FUNCTION_3_0();
  *uint64_t v3 = a1;
  return result;
}

void sub_1B5B801D8(void **a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x200))();
}

uint64_t sub_1B5B8023C(double *a1, void **a2)
{
  return (*(uint64_t (**)(double))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x208))(*a1);
}

uint64_t (*sub_1B5B8029C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B5B80308()
{
  OUTLINED_FUNCTION_1();
  return *(void *)v0;
}

uint64_t sub_1B5B80364(uint64_t a1)
{
  uint64_t result = OUTLINED_FUNCTION_2();
  *uint64_t v1 = a1;
  return result;
}

uint64_t sub_1B5B8039C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x218))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B80400(void *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x220))(*a1);
}

uint64_t (*sub_1B5B80460())()
{
  return j_j__swift_endAccess;
}

id sub_1B5B804D0(void *a1, uint64_t a2, uint64_t (*a3)(void), unint64_t *a4)
{
  if (a3())
  {
    sub_1B5B7447C(0, a4);
    sub_1B5BC9FC0();
    OUTLINED_FUNCTION_10();
  }
  else
  {
    a1 = 0;
  }
  return a1;
}

uint64_t sub_1B5B8054C()
{
  return sub_1B5B81918(&OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_imageSGViews, MEMORY[0x1E4FBC8A8]);
}

void sub_1B5B80594(void *a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, void (*a6)(uint64_t))
{
  uint64_t v7 = a3;
  if (a3)
  {
    sub_1B5B7447C(0, a4);
    uint64_t v7 = sub_1B5BC9FE0();
  }
  id v9 = a1;
  a6(v7);
}

uint64_t sub_1B5B80620(uint64_t a1)
{
  return sub_1B5B819FC(a1, (uint64_t)&OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_imageSGViews, MEMORY[0x1E4FBC898]);
}

uint64_t sub_1B5B80640@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x230))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B806A4(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x238);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t (*sub_1B5B80710())()
{
  return j_j__swift_endAccess;
}

id sub_1B5B80770(void *a1, uint64_t a2, void (*a3)(void))
{
  a3();
  if (v4)
  {
    sub_1B5BC9F00();
    OUTLINED_FUNCTION_10();
  }
  else
  {
    a1 = 0;
  }
  return a1;
}

uint64_t sub_1B5B807C4()
{
  return sub_1B5B7F83C();
}

void sub_1B5B807E8(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  if (a3) {
    sub_1B5BC9F40();
  }
  id v6 = a1;
  uint64_t v7 = OUTLINED_FUNCTION_8_1();
  a4(v7);
}

uint64_t sub_1B5B80860(uint64_t a1, uint64_t a2)
{
  return sub_1B5B7F908(a1, a2);
}

uint64_t sub_1B5B8086C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x248))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1B5B808D0(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x250);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t (*sub_1B5B80950())()
{
  return j_j__swift_endAccess;
}

void *sub_1B5B809CC()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  id v2 = v1;
  return v1;
}

void sub_1B5B80A50(void *a1)
{
}

uint64_t sub_1B5B80A5C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x260))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B80AC0(id *a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x268);
  id v4 = *a1;
  return v3(v2);
}

uint64_t (*sub_1B5B80B30())()
{
  return j_j__swift_endAccess;
}

void *sub_1B5B80BAC()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  id v2 = v1;
  return v1;
}

void sub_1B5B80C30(void *a1)
{
}

uint64_t sub_1B5B80C3C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x278))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B80CA0(id *a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x280);
  id v4 = *a1;
  return v3(v2);
}

uint64_t (*sub_1B5B80D10())()
{
  return j_j__swift_endAccess;
}

void *sub_1B5B80D8C()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  id v2 = v1;
  return v1;
}

void sub_1B5B80E10(void *a1)
{
}

uint64_t sub_1B5B80E1C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x290))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B80E80(id *a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x298);
  id v4 = *a1;
  return v3(v2);
}

uint64_t (*sub_1B5B80EF0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B5B80F60()
{
  OUTLINED_FUNCTION_1();
  return *v0;
}

uint64_t sub_1B5B80FBC(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_2();
  *uint64_t v1 = a1;
  return result;
}

uint64_t sub_1B5B80FF4@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x2A8))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B5B8105C(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x2B0))(*a1);
}

uint64_t (*sub_1B5B810BC())()
{
  return j_j__swift_endAccess;
}

void *sub_1B5B81138()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  id v2 = v1;
  return v1;
}

void sub_1B5B811BC(void *a1)
{
}

uint64_t sub_1B5B811C8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x2C0))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B8122C(id *a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x2C8);
  id v4 = *a1;
  return v3(v2);
}

uint64_t (*sub_1B5B8129C())()
{
  return j_j__swift_endAccess;
}

void *sub_1B5B81318()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  id v2 = v1;
  return v1;
}

void sub_1B5B8139C(void *a1)
{
}

void sub_1B5B813A8(void *a1)
{
  OUTLINED_FUNCTION_2();
  uint64_t v3 = *v1;
  *uint64_t v1 = a1;
}

uint64_t sub_1B5B813E4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x2D8))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B81448(id *a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x2E0);
  id v4 = *a1;
  return v3(v2);
}

uint64_t (*sub_1B5B814B8())()
{
  return j_j__swift_endAccess;
}

double sub_1B5B81524()
{
  OUTLINED_FUNCTION_1();
  return *(double *)v0;
}

uint64_t sub_1B5B8157C(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_closeButtonXAnchorOffset);
  uint64_t result = OUTLINED_FUNCTION_3_0();
  *uint64_t v3 = a1;
  return result;
}

void sub_1B5B815C8(void **a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x2F0))();
}

uint64_t sub_1B5B8162C(double *a1, void **a2)
{
  return (*(uint64_t (**)(double))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x2F8))(*a1);
}

uint64_t (*sub_1B5B8168C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B5B816FC()
{
  OUTLINED_FUNCTION_1();
  return *v0;
}

uint64_t sub_1B5B81758(char a1)
{
  uint64_t result = OUTLINED_FUNCTION_2();
  *uint64_t v1 = a1;
  return result;
}

uint64_t sub_1B5B81790@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x308))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B5B817F8(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x310))(*a1);
}

uint64_t (*sub_1B5B81858())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B5B818F8()
{
  return sub_1B5B81918(&OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_iconSFSymbols, MEMORY[0x1E4FBC8A8]);
}

uint64_t sub_1B5B81918(void *a1, uint64_t (*a2)(void))
{
  id v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  return a2(*v4);
}

uint64_t sub_1B5B819DC(uint64_t a1)
{
  return sub_1B5B819FC(a1, (uint64_t)&OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_iconSFSymbols, MEMORY[0x1E4FBC898]);
}

uint64_t sub_1B5B819FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  OUTLINED_FUNCTION_2();
  uint64_t v6 = *v3;
  *uint64_t v3 = a1;
  return a3(v6);
}

uint64_t sub_1B5B81A48@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x320))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B81AAC(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x328);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t (*sub_1B5B81B18())()
{
  return j_j__swift_endAccess;
}

id SGBannerContent.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SGBannerContent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SGBannerContent()
{
  return self;
}

uint64_t sub_1B5B81CF4(uint64_t a1)
{
  return a1;
}

uint64_t method lookup function for SGBannerContent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SGBannerContent);
}

uint64_t dispatch thunk of SGBannerContent.title.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of SGBannerContent.title.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of SGBannerContent.title.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of SGBannerContent.attributedTitle.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of SGBannerContent.attributedTitle.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of SGBannerContent.attributedTitle.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of SGBannerContent.subtitle.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of SGBannerContent.subtitle.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of SGBannerContent.subtitle.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of SGBannerContent.attributedSubtitle.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of SGBannerContent.attributedSubtitle.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of SGBannerContent.attributedSubtitle.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of SGBannerContent.accessoryType.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of SGBannerContent.accessoryType.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of SGBannerContent.accessoryType.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of SGBannerContent.images.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of SGBannerContent.images.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of SGBannerContent.images.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of SGBannerContent.actionTitle.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of SGBannerContent.actionTitle.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of SGBannerContent.actionTitle.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of SGBannerContent.suggestion.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of SGBannerContent.suggestion.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of SGBannerContent.suggestion.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of SGBannerContent.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of SGBannerContent.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of SGBannerContent.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of SGBannerContent.primaryActionButtonWidth.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of SGBannerContent.primaryActionButtonWidth.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of SGBannerContent.primaryActionButtonWidth.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of SGBannerContent.closeButtonWidth.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x200))();
}

uint64_t dispatch thunk of SGBannerContent.closeButtonWidth.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x208))();
}

uint64_t dispatch thunk of SGBannerContent.closeButtonWidth.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x210))();
}

uint64_t dispatch thunk of SGBannerContent.actionButtonType.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x218))();
}

uint64_t dispatch thunk of SGBannerContent.actionButtonType.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x220))();
}

uint64_t dispatch thunk of SGBannerContent.actionButtonType.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x228))();
}

uint64_t dispatch thunk of SGBannerContent.imageSGViews.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x230))();
}

uint64_t dispatch thunk of SGBannerContent.imageSGViews.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x238))();
}

uint64_t dispatch thunk of SGBannerContent.imageSGViews.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x240))();
}

uint64_t dispatch thunk of SGBannerContent.listTitle.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x248))();
}

uint64_t dispatch thunk of SGBannerContent.listTitle.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x250))();
}

uint64_t dispatch thunk of SGBannerContent.listTitle.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x258))();
}

uint64_t dispatch thunk of SGBannerContent.backgroundVisualEffectView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x260))();
}

uint64_t dispatch thunk of SGBannerContent.backgroundVisualEffectView.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x268))();
}

uint64_t dispatch thunk of SGBannerContent.backgroundVisualEffectView.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x270))();
}

uint64_t dispatch thunk of SGBannerContent.backgroundColor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x278))();
}

uint64_t dispatch thunk of SGBannerContent.backgroundColor.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x280))();
}

uint64_t dispatch thunk of SGBannerContent.backgroundColor.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x288))();
}

uint64_t dispatch thunk of SGBannerContent.bannerDivider.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x290))();
}

uint64_t dispatch thunk of SGBannerContent.bannerDivider.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x298))();
}

uint64_t dispatch thunk of SGBannerContent.bannerDivider.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of SGBannerContent.suggestionCategorySupportsBatchDismissal.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of SGBannerContent.suggestionCategorySupportsBatchDismissal.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of SGBannerContent.suggestionCategorySupportsBatchDismissal.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2B8))();
}

uint64_t dispatch thunk of SGBannerContent.primaryAction.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2C0))();
}

uint64_t dispatch thunk of SGBannerContent.primaryAction.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of SGBannerContent.primaryAction.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2D0))();
}

uint64_t dispatch thunk of SGBannerContent.dismissAction.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of SGBannerContent.dismissAction.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of SGBannerContent.dismissAction.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of SGBannerContent.closeButtonXAnchorOffset.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of SGBannerContent.closeButtonXAnchorOffset.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of SGBannerContent.closeButtonXAnchorOffset.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x300))();
}

uint64_t dispatch thunk of SGBannerContent.prominentActionButton.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x308))();
}

uint64_t dispatch thunk of SGBannerContent.prominentActionButton.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x310))();
}

uint64_t dispatch thunk of SGBannerContent.prominentActionButton.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x318))();
}

uint64_t dispatch thunk of SGBannerContent.iconSFSymbols.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x320))();
}

uint64_t dispatch thunk of SGBannerContent.iconSFSymbols.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x328))();
}

uint64_t dispatch thunk of SGBannerContent.iconSFSymbols.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x330))();
}

void type metadata accessor for SGBannerActionButtonType(uint64_t a1)
{
}

void type metadata accessor for SGBannerAccessoryType(uint64_t a1)
{
}

void sub_1B5B82D8C()
{
  qword_1E9D96708 = 0;
}

uint64_t *sub_1B5B82D98()
{
  if (qword_1EB8429E0 != -1) {
    swift_once();
  }
  return &qword_1E9D96708;
}

double sub_1B5B82DE4(double *a1, void (*a2)(double *__return_ptr))
{
  a2(&v4);
  double result = v4;
  *a1 = v4;
  return result;
}

double sub_1B5B82E24@<D0>(void *a1@<X8>)
{
  return sub_1B5B82EC8((void (*)(void))sub_1B5B82D98, (double *)&qword_1E9D96708, a1);
}

void sub_1B5B82E50()
{
  qword_1E9D96710 = 0;
}

uint64_t *sub_1B5B82E5C()
{
  if (qword_1EB8429E8 != -1) {
    swift_once();
  }
  return &qword_1E9D96710;
}

double sub_1B5B82EA8@<D0>(void *a1@<X8>)
{
  return sub_1B5B82EC8((void (*)(void))sub_1B5B82E5C, (double *)&qword_1E9D96710, a1);
}

double sub_1B5B82EC8@<D0>(void (*a1)(void)@<X2>, double *a2@<X3>, void *a3@<X8>)
{
  a1();
  OUTLINED_FUNCTION_104();
  double result = *a2;
  *a3 = *(void *)a2;
  return result;
}

void sub_1B5B82F08()
{
  OUTLINED_FUNCTION_18();
  unint64_t v22 = v1;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = sub_1B5BC9630();
  OUTLINED_FUNCTION_1_2();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_16_1();
  __swift_instantiateConcreteTypeFromMangledName(v7);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_94();
  sub_1B5B7E444(v13, v14, v15);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5(0);
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_24_1();
    v17(v16);
  }
  else
  {
    os_log_type_t v18 = sub_1B5BCA060();
    uint64_t v19 = sub_1B5BC9990();
    if (os_log_type_enabled(v19, v18))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v23 = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      *(void *)(v20 + 4) = sub_1B5B7AAF8(v3, v22, &v23);
      _os_log_impl(&dword_1B5B6C000, v19, v18, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9A8090](v21, -1, -1);
      MEMORY[0x1BA9A8090](v20, -1, -1);
    }

    sub_1B5BC9620();
    OUTLINED_FUNCTION_61_0();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v0, v8);
  }
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1B5B83120()
{
  return sub_1B5BC9560();
}

uint64_t sub_1B5B83144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B5B8464C(a1, a2, a3, a4, MEMORY[0x1E4F3D5D8], MEMORY[0x1E4F3CF98]);
}

uint64_t type metadata accessor for AccessibilityAdaptiveStack()
{
  return __swift_instantiateGenericMetadata();
}

void sub_1B5B83188()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_94();
  sub_1B5BC9DB0();
  OUTLINED_FUNCTION_94();
  sub_1B5BC9D90();
  sub_1B5BC9840();
  uint64_t v0 = sub_1B5BC9CC0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_32();
  uint64_t v6 = v4 - v5;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_58_0();
  swift_getWitnessTable();
  swift_getWitnessTable();
  swift_getWitnessTable();
  sub_1B5BC9CB0();
  swift_getWitnessTable();
  uint64_t v8 = *(void (**)(void))(v2 + 16);
  OUTLINED_FUNCTION_28_0();
  v8();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v9(v6, v0);
  OUTLINED_FUNCTION_28_0();
  v8();
  uint64_t v10 = OUTLINED_FUNCTION_61_0();
  ((void (*)(uint64_t))v9)(v10);
  OUTLINED_FUNCTION_17();
}

void sub_1B5B83370()
{
  OUTLINED_FUNCTION_18();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v52 = v4;
  sub_1B5BC9D90();
  OUTLINED_FUNCTION_1_2();
  uint64_t v46 = v5;
  MEMORY[0x1F4188790](v6);
  unsigned int v45 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v8);
  char v44 = (char *)v42 - v9;
  OUTLINED_FUNCTION_56();
  sub_1B5BC9DB0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v43 = v10;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_43_0();
  MEMORY[0x1F4188790](v12);
  v42[1] = (char *)v42 - v13;
  OUTLINED_FUNCTION_56();
  uint64_t v14 = sub_1B5BC96C0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v16 = v15;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_32();
  uint64_t v20 = v18 - v19;
  MEMORY[0x1F4188790](v21);
  uint64_t v23 = (char *)v42 - v22;
  sub_1B5BC9840();
  OUTLINED_FUNCTION_1_2();
  uint64_t v50 = v25;
  uint64_t v51 = v24;
  MEMORY[0x1F4188790](v24);
  uint64_t v48 = v1;
  unint64_t v49 = (char *)v42 - v26;
  OUTLINED_FUNCTION_56();
  uint64_t v47 = v3;
  type metadata accessor for AccessibilityAdaptiveStack();
  OUTLINED_FUNCTION_100();
  (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v20, *MEMORY[0x1E4F3D598], v14);
  LOBYTE(v1) = sub_1B5B83844((uint64_t)v23, v20);
  uint64_t v27 = *(void (**)(void))(v16 + 8);
  OUTLINED_FUNCTION_41_0();
  v27();
  OUTLINED_FUNCTION_41_0();
  v27();
  if (v1)
  {
    sub_1B5BC96E0();
    OUTLINED_FUNCTION_103();
    sub_1B5BC9DA0();
    swift_getWitnessTable();
    uint64_t v28 = v43;
    uint64_t v29 = *(void (**)(void))(v43 + 16);
    OUTLINED_FUNCTION_28_0();
    v29();
    uint64_t v30 = *(void (**)(void))(v28 + 8);
    OUTLINED_FUNCTION_41_0();
    v30();
    OUTLINED_FUNCTION_28_0();
    v29();
    swift_getWitnessTable();
    uint64_t v31 = OUTLINED_FUNCTION_74_0();
    sub_1B5B83C5C(v31, v32);
  }
  else
  {
    sub_1B5BC9650();
    OUTLINED_FUNCTION_103();
    sub_1B5BC9D80();
    swift_getWitnessTable();
    uint64_t v33 = v46;
    uint64_t v29 = *(void (**)(void))(v46 + 16);
    OUTLINED_FUNCTION_28_0();
    v29();
    uint64_t v30 = *(void (**)(void))(v33 + 8);
    OUTLINED_FUNCTION_41_0();
    v30();
    OUTLINED_FUNCTION_28_0();
    v29();
    swift_getWitnessTable();
    uint64_t v34 = OUTLINED_FUNCTION_74_0();
    sub_1B5B83D54(v34, v35, v36);
  }
  OUTLINED_FUNCTION_41_0();
  v30();
  OUTLINED_FUNCTION_41_0();
  v30();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v38 = swift_getWitnessTable();
  uint64_t v53 = WitnessTable;
  uint64_t v54 = v38;
  uint64_t v39 = v51;
  swift_getWitnessTable();
  uint64_t v40 = v50;
  OUTLINED_FUNCTION_80();
  v41();
  (*(void (**)(void (*)(void), uint64_t))(v40 + 8))(v29, v39);
  OUTLINED_FUNCTION_17();
}

void sub_1B5B83838()
{
}

BOOL sub_1B5B83844(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a2;
  uint64_t v3 = sub_1B5BC96C0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v18 - v8;
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v10((char *)&v18 - v8, a1, v3);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t))(v4 + 88);
  int v12 = v11(v9, v3);
  unint64_t v13 = 0;
  int v14 = *MEMORY[0x1E4F3D588];
  if (v12 != *MEMORY[0x1E4F3D588])
  {
    if (v12 == *MEMORY[0x1E4F3D5C0])
    {
      unint64_t v13 = 1;
      goto LABEL_24;
    }
    if (v12 == *MEMORY[0x1E4F3D5C8])
    {
      unint64_t v13 = 2;
      goto LABEL_24;
    }
    if (v12 == *MEMORY[0x1E4F3D5B8]) {
      goto LABEL_7;
    }
    if (v12 == *MEMORY[0x1E4F3D580])
    {
      unint64_t v13 = 4;
    }
    else if (v12 == *MEMORY[0x1E4F3D590])
    {
      unint64_t v13 = 5;
    }
    else if (v12 == *MEMORY[0x1E4F3D560])
    {
      unint64_t v13 = 6;
    }
    else if (v12 == *MEMORY[0x1E4F3D5A0])
    {
      unint64_t v13 = 7;
    }
    else if (v12 == *MEMORY[0x1E4F3D598])
    {
      unint64_t v13 = 8;
    }
    else if (v12 == *MEMORY[0x1E4F3D5A8])
    {
      unint64_t v13 = 9;
    }
    else if (v12 == *MEMORY[0x1E4F3D570])
    {
      unint64_t v13 = 10;
    }
    else
    {
      if (v12 != *MEMORY[0x1E4F3D578])
      {
        (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
LABEL_7:
        unint64_t v13 = 3;
        goto LABEL_24;
      }
      unint64_t v13 = 11;
    }
  }
LABEL_24:
  v10(v7, v19, v3);
  int v15 = v11(v7, v3);
  if (v15 == v14)
  {
    unint64_t v16 = 0;
  }
  else if (v15 == *MEMORY[0x1E4F3D5C0])
  {
    unint64_t v16 = 1;
  }
  else if (v15 == *MEMORY[0x1E4F3D5C8])
  {
    unint64_t v16 = 2;
  }
  else
  {
    if (v15 != *MEMORY[0x1E4F3D5B8])
    {
      if (v15 == *MEMORY[0x1E4F3D580])
      {
        unint64_t v16 = 4;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x1E4F3D590])
      {
        unint64_t v16 = 5;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x1E4F3D560])
      {
        unint64_t v16 = 6;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x1E4F3D5A0])
      {
        unint64_t v16 = 7;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x1E4F3D598])
      {
        unint64_t v16 = 8;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x1E4F3D5A8])
      {
        unint64_t v16 = 9;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x1E4F3D570])
      {
        unint64_t v16 = 10;
        return v13 >= v16;
      }
      if (v15 == *MEMORY[0x1E4F3D578])
      {
        unint64_t v16 = 11;
        return v13 >= v16;
      }
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    unint64_t v16 = 3;
  }
  return v13 >= v16;
}

uint64_t sub_1B5B83C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B5BC9820();
  MEMORY[0x1F4188790](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_1B5BC9830();
}

uint64_t sub_1B5B83D54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1B5BC9820();
  MEMORY[0x1F4188790](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_1B5BC9830();
}

uint64_t sub_1B5B83E50()
{
  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_107();
  sub_1B5BC92F0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B5B83EC0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 88))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B5B83F10(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 96))(*a1);
}

uint64_t sub_1B5B83F58()
{
  return sub_1B5BC9300();
}

void (*sub_1B5B83FC8(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1B5BC92E0();
  return sub_1B5B84054;
}

void sub_1B5B84054(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_1B5B840BC()
{
  return swift_endAccess();
}

uint64_t sub_1B5B84118()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D949E0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x1F4188790](v0);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_80();
  v1();
  OUTLINED_FUNCTION_53();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8416A0);
  sub_1B5BC92D0();
  swift_endAccess();
  uint64_t v2 = OUTLINED_FUNCTION_50_0();
  return v3(v2);
}

void (*sub_1B5B841FC(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D949E0);
  v3[4] = v4;
  OUTLINED_FUNCTION_23(v4);
  v3[5] = v5;
  size_t v7 = *(void *)(v6 + 64);
  v3[6] = malloc(v7);
  v3[7] = malloc(v7);
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_53();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8416A0);
  sub_1B5BC92C0();
  swift_endAccess();
  return sub_1B5B842CC;
}

void sub_1B5B842CC(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 48);
  uint64_t v4 = *(void **)(*(void *)a1 + 56);
  if (a2)
  {
    OUTLINED_FUNCTION_80();
    v5();
    sub_1B5B84118();
    uint64_t v6 = OUTLINED_FUNCTION_88();
    v7(v6);
  }
  else
  {
    sub_1B5B84118();
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t sub_1B5B84378()
{
  uint64_t v0 = swift_allocObject();
  sub_1B5B843B8();
  return v0;
}

uint64_t sub_1B5B843B8()
{
  OUTLINED_FUNCTION_53();
  sub_1B5BC92B0();
  swift_endAccess();
  return v0;
}

uint64_t BannerUpdateViewModel.deinit()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8416A0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_38();
  v1();
  return v0;
}

uint64_t BannerUpdateViewModel.__deallocating_deinit()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8416A0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_38();
  v1();
  uint64_t v2 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v3 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v2, v3);
}

uint64_t sub_1B5B84518@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for BannerUpdateViewModel(0);
  uint64_t result = sub_1B5BC9290();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for SGBannerContainerView(uint64_t a1)
{
  return sub_1B5B7B630(a1, qword_1EB8429F0);
}

uint64_t sub_1B5B84578(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SGBannerViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for BannerUpdateViewModel(uint64_t a1)
{
  return sub_1B5B7B630(a1, (uint64_t *)&unk_1EB842C40);
}

uint64_t sub_1B5B845FC()
{
  return sub_1B5BC9520();
}

uint64_t sub_1B5B84620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B5B8464C(a1, a2, a3, a4, MEMORY[0x1E4F3C5D0], MEMORY[0x1E4F3CF08]);
}

uint64_t sub_1B5B8464C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v13 - v9, a1);
  return a6(v10);
}

uint64_t SGBannerContainerView.init(_:store:updateBannerView:)@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = (int *)type metadata accessor for SGBannerContainerView(0);
  uint64_t v7 = v6[6];
  *(void *)((char *)a3 + v7) = 0;
  *((unsigned char *)a3 + v6[8]) = 1;
  uint64_t v8 = (void *)((char *)a3 + v6[9]);
  *uint64_t v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = (void *)((char *)a3 + v6[10]);
  *uint64_t v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = (char *)a3 + v6[11];
  sub_1B5BC9D30();
  *uint64_t v10 = v19;
  *((void *)v10 + 1) = v20;
  *a3 = a1;
  uint64_t v11 = *(void **)((char *)a3 + v7);
  *(void *)((char *)a3 + v7) = a2;
  id v12 = a1;
  id v13 = a2;

  int v14 = (void *)((char *)a3 + v6[7]);
  type metadata accessor for BannerUpdateViewModel(0);
  sub_1B5B8AD9C((uint64_t)&unk_1EB8418E0);
  swift_retain();
  OUTLINED_FUNCTION_94();
  *int v14 = sub_1B5BC9410();
  v14[1] = v15;
  if (a2) {
    objc_msgSend(v13, sel_hostApp);
  }
  uint64_t v16 = (uint64_t)a3 + v6[5];
  id v17 = v12;
  sub_1B5BB62E4(v17, v16);

  return swift_release();
}

uint64_t SGBannerContainerView.body.getter()
{
  uint64_t v6 = v0;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB8411A0);
  uint64_t v8 = OUTLINED_FUNCTION_19_1(v7);
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_65();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB840EB8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_16_1();
  *(void *)uint64_t v11 = sub_1B5BC96E0();
  *(void *)(v11 + 8) = 0;
  *(unsigned char *)(v11 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840F70);
  sub_1B5B84AF0();
  unsigned __int8 v14 = sub_1B5BC99D0();
  unsigned __int8 v15 = sub_1B5BC99F0();
  char v16 = sub_1B5BC99E0();
  sub_1B5BC99E0();
  if (sub_1B5BC99E0() != v14) {
    char v16 = sub_1B5BC99E0();
  }
  sub_1B5BC99E0();
  if (sub_1B5BC99E0() != v15) {
    char v16 = sub_1B5BC99E0();
  }
  id v17 = objc_msgSend(self, sel_currentDevice);
  id v18 = objc_msgSend(v17, sel_userInterfaceIdiom);

  OUTLINED_FUNCTION_98();
  uint64_t v20 = *(void **)(v6 + v19);
  if (v20 && ((id v21 = objc_msgSend(v20, sel_hostApp), v18 == (id)6) ? (v22 = v21 == (id)1) : (v22 = 0), v22))
  {
    uint64_t v2 = 0;
    char v23 = 1;
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  else
  {
    sub_1B5BC9320();
    OUTLINED_FUNCTION_7();
    char v23 = 0;
  }
  uint64_t v24 = OUTLINED_FUNCTION_41();
  sub_1B5B7E444(v24, v25, qword_1EB8411A0);
  uint64_t v26 = v1 + *(int *)(v12 + 36);
  *(unsigned char *)uint64_t v26 = v16;
  *(void *)(v26 + 8) = v2;
  *(void *)(v26 + 16) = v3;
  *(void *)(v26 + 24) = v4;
  *(void *)(v26 + 32) = v5;
  *(unsigned char *)(v26 + 40) = v23;
  sub_1B5B7E758(v11, qword_1EB8411A0);
  uint64_t v27 = OUTLINED_FUNCTION_62_0();
  return sub_1B5B8B2E4(v27, v28, v29);
}

void sub_1B5B84AF0()
{
  OUTLINED_FUNCTION_18();
  uint64_t v3 = v2;
  uint64_t v131 = v4;
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841050);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_3();
  uint64_t v117 = v6;
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841020);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v108 = v8;
  OUTLINED_FUNCTION_56();
  sub_1B5BC9340();
  OUTLINED_FUNCTION_1_2();
  uint64_t v122 = v10;
  uint64_t v123 = v9;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_4_1();
  uint64_t v119 = v11;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_15_0();
  uint64_t v121 = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841188);
  uint64_t v15 = OUTLINED_FUNCTION_19_1(v14);
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_3();
  uint64_t v134 = v16;
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840FD8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v17);
  unint64_t v124 = (char *)&v107 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8410C8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_4_1();
  uint64_t v110 = v20;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_15_0();
  uint64_t v113 = v22;
  uint64_t v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841170);
  OUTLINED_FUNCTION_1_2();
  uint64_t v118 = v23;
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_32();
  uint64_t v27 = v25 - v26;
  MEMORY[0x1F4188790](v28);
  OUTLINED_FUNCTION_31_0();
  uint64_t v126 = v29;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v30);
  OUTLINED_FUNCTION_15_0();
  uint64_t v133 = v31;
  OUTLINED_FUNCTION_56();
  uint64_t v32 = sub_1B5BC9E20();
  OUTLINED_FUNCTION_1_2();
  uint64_t v34 = v33;
  MEMORY[0x1F4188790](v35);
  OUTLINED_FUNCTION_65();
  uint64_t v38 = v37 - v36;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8416B8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v40);
  OUTLINED_FUNCTION_24();
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8416C0);
  uint64_t v42 = OUTLINED_FUNCTION_19_1(v41);
  MEMORY[0x1F4188790](v42);
  uint64_t v129 = (uint64_t)&v107 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v44);
  OUTLINED_FUNCTION_31_0();
  uint64_t v135 = v45;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v46);
  OUTLINED_FUNCTION_31_0();
  uint64_t v114 = v47;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v48);
  OUTLINED_FUNCTION_57_0();
  uint64_t v132 = type metadata accessor for SGBannerContainerView(0);
  unint64_t v49 = v3;
  uint64_t v50 = (char *)v3 + *(int *)(v132 + 20);
  uint64_t v51 = &v50[*(int *)(type metadata accessor for SGBannerViewModel(0) + 52)];
  BOOL v52 = v51[16] == 1;
  uint64_t v137 = v0;
  uint64_t v130 = v27;
  uint64_t v109 = v32;
  uint64_t v127 = v38;
  uint64_t v128 = v34;
  uint64_t v125 = v1;
  unint64_t v120 = v51;
  if (v52)
  {
    sub_1B5BC9E10();
    uint64_t v53 = *(void *)v51;
    OUTLINED_FUNCTION_80();
    v54();
    uint64_t v55 = (void *)(v1 + *(int *)(v39 + 36));
    *uint64_t v55 = v53;
    OUTLINED_FUNCTION_60_0((uint64_t)v55);
    uint64_t v56 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
    swift_retain();
    v56(v38, v32);
    uint64_t v0 = v137;
    sub_1B5B8B2E4(v1, v137, &qword_1EB8416B8);
    uint64_t v57 = 0;
  }
  else
  {
    uint64_t v57 = 1;
  }
  uint64_t v58 = (uint64_t)v124;
  uint64_t v59 = (void **)v49;
  uint64_t v60 = v132;
  unint64_t v124 = (char *)v39;
  __swift_storeEnumTagSinglePayload(v0, v57, 1, v39);
  uint64_t v61 = sub_1B5BC9650();
  char v62 = v134;
  *uint64_t v134 = v61;
  v62[1] = 0;
  *((unsigned char *)v62 + 16) = 0;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840F68);
  sub_1B5B854C4((uint64_t)v49, (uint64_t)v62 + *(int *)(v63 + 44));
  uint64_t v64 = *(void **)((char *)v49 + *(int *)(v60 + 24));
  uint64_t v111 = *(int *)(v60 + 24);
  if (v64) {
    objc_msgSend(v64, sel_hostApp);
  }
  uint64_t v65 = v121;
  OUTLINED_FUNCTION_38_0();
  uint64_t v66 = (void *)*v49;
  uint64_t v67 = v122;
  uint64_t v68 = v123;
  OUTLINED_FUNCTION_80();
  v69();
  uint64_t v70 = v66;
  uint64_t v71 = v58;
  sub_1B5B87AF4();
  sub_1B5B7E444((uint64_t)v134, v58, &qword_1EB841188);
  (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v65, v68);
  uint64_t v72 = OUTLINED_FUNCTION_43();
  sub_1B5B7E758(v72, v73);
  uint64_t v74 = v58;
  if (*((unsigned char *)v59 + *(int *)(v132 + 32)) == 1)
  {
    uint64_t v75 = v108;
    sub_1B5B7E444(v74, v108, &qword_1EB840FD8);
    *(_WORD *)(v75 + *(int *)(v116 + 36)) = 256;
    sub_1B5B7E444(v75, v117, &qword_1EB841020);
    swift_storeEnumTagMultiPayload();
    sub_1B5B8AF18((uint64_t)&unk_1EB841018);
    sub_1B5B8AF94();
    uint64_t v76 = v110;
    sub_1B5BC9830();
    sub_1B5B7E758(v75, &qword_1EB841020);
  }
  else
  {
    sub_1B5B7E444(v58, v117, &qword_1EB840FD8);
    swift_storeEnumTagMultiPayload();
    sub_1B5B8AF18((uint64_t)&unk_1EB841018);
    sub_1B5B8AF94();
    uint64_t v76 = v110;
    sub_1B5BC9830();
  }
  uint64_t v77 = v118;
  uint64_t v78 = v133;
  uint64_t v79 = v115;
  uint64_t v80 = v113;
  uint64_t v81 = v111;
  sub_1B5B8B2E4(v76, v113, &qword_1EB8410C8);
  sub_1B5B7E758(v71, &qword_1EB840FD8);
  char v82 = *(void **)((char *)v59 + v81);
  if (v82) {
    char v83 = objc_msgSend(v82, sel_hostApp) == (id)1;
  }
  else {
    char v83 = 0;
  }
  uint64_t v84 = (uint64_t)v124;
  uint64_t v85 = v128;
  uint64_t v86 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **v59) + 0x218))();
  unint64_t v87 = sub_1B5B8B064();
  uint64_t v88 = v126;
  sub_1B5BAB22C(v83, v86, v79, v87);
  sub_1B5B7E758(v80, &qword_1EB8410C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v77 + 32))(v78, v88, v136);
  uint64_t v89 = v120;
  uint64_t v90 = v127;
  uint64_t v91 = v125;
  if (v120[17] == 1)
  {
    sub_1B5BC9E10();
    uint64_t v92 = *((void *)v89 + 1);
    uint64_t v93 = v109;
    OUTLINED_FUNCTION_80();
    v94();
    char v95 = (void *)(v91 + *(int *)(v84 + 36));
    *char v95 = v92;
    OUTLINED_FUNCTION_60_0((uint64_t)v95);
    char v96 = *(void (**)(uint64_t, uint64_t))(v85 + 8);
    swift_retain();
    v96(v90, v93);
    uint64_t v97 = v114;
    sub_1B5B8B2E4(v91, v114, &qword_1EB8416B8);
    uint64_t v98 = 0;
    uint64_t v99 = v137;
  }
  else
  {
    uint64_t v98 = 1;
    uint64_t v99 = v137;
    uint64_t v97 = v114;
  }
  __swift_storeEnumTagSinglePayload(v97, v98, 1, v84);
  uint64_t v100 = v135;
  sub_1B5B7E444(v99, v135, &qword_1EB8416C0);
  uint64_t v101 = *(void (**)(void))(v77 + 16);
  OUTLINED_FUNCTION_84();
  v101();
  uint64_t v102 = v129;
  sub_1B5B7E444(v97, v129, &qword_1EB8416C0);
  uint64_t v103 = v100;
  uint64_t v104 = v131;
  sub_1B5B7E444(v103, v131, &qword_1EB8416C0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840FF0);
  OUTLINED_FUNCTION_84();
  v101();
  sub_1B5B7E444(v102, v104 + *(int *)(v105 + 64), &qword_1EB8416C0);
  sub_1B5B7E758(v97, &qword_1EB8416C0);
  uint64_t v106 = *(void (**)(void))(v77 + 8);
  OUTLINED_FUNCTION_51_1();
  v106();
  sub_1B5B7E758(v137, &qword_1EB8416C0);
  sub_1B5B7E758(v102, &qword_1EB8416C0);
  OUTLINED_FUNCTION_51_1();
  v106();
  sub_1B5B7E758(v135, &qword_1EB8416C0);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1B5B854C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v8 = type metadata accessor for SGBannerContainerView(0);
  OUTLINED_FUNCTION_1_2();
  uint64_t v89 = v9;
  MEMORY[0x1F4188790](v10);
  uint64_t v90 = v11;
  uint64_t v93 = (uint64_t)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840F48);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_49_0();
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v82 - v14;
  uint64_t v94 = type metadata accessor for SGBannerViewModel(0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v16);
  uint64_t v86 = (uint64_t)&v82 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v82 - v19;
  uint64_t v21 = type metadata accessor for CloseButtonView(0);
  uint64_t v22 = OUTLINED_FUNCTION_19_1(v21);
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_4_1();
  unint64_t v87 = v23;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_57_0();
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8413D8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_4_1();
  uint64_t v85 = v26;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v27);
  OUTLINED_FUNCTION_31_0();
  uint64_t v84 = v28;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_73_0();
  MEMORY[0x1F4188790](v30);
  OUTLINED_FUNCTION_58_0();
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8413E0);
  uint64_t v32 = OUTLINED_FUNCTION_19_1(v31);
  MEMORY[0x1F4188790](v32);
  OUTLINED_FUNCTION_4_1();
  uint64_t v96 = v33;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_31_0();
  uint64_t v97 = v35;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_43_0();
  MEMORY[0x1F4188790](v37);
  uint64_t v41 = (char *)&v82 - v40;
  uint64_t v42 = a1 + *(int *)(v39 + 20);
  int v43 = *(unsigned __int8 *)(v42 + 1);
  uint64_t v88 = v39;
  uint64_t v98 = (uint64_t)&v82 - v40;
  uint64_t v92 = v8;
  if (v43 == 1)
  {
    char v82 = v15;
    uint64_t v83 = a2;
    uint64_t v44 = *v38;
    uint64_t v45 = v38;
    uint64_t v46 = *(void **)((char *)v38 + *(int *)(v39 + 24));
    sub_1B5B88A24(v42, (uint64_t)v20, (void (*)(void))type metadata accessor for SGBannerViewModel);
    id v47 = v44;
    if (v46) {
      char v48 = objc_msgSend(v46, sel_hostApp) == (id)1;
    }
    else {
      char v48 = 0;
    }
    sub_1B5B92DC0((uint64_t)v44, (uint64_t)v46, v48, v4);
    char v52 = sub_1B5BC99D0();
    sub_1B5BC9320();
    OUTLINED_FUNCTION_7();
    sub_1B5B88A24((uint64_t)v4, v5, (void (*)(void))type metadata accessor for CloseButtonView);
    uint64_t v51 = v95;
    uint64_t v53 = (unsigned char *)(v5 + *(int *)(v95 + 36));
    *uint64_t v53 = v52;
    OUTLINED_FUNCTION_64((uint64_t)v53);
    sub_1B5B8AEC4((uint64_t)v4, (void (*)(void))type metadata accessor for CloseButtonView);
    sub_1B5B8B2E4(v5, v3, &qword_1EB8413D8);
    uint64_t v54 = v3;
    uint64_t v55 = v98;
    sub_1B5B8B2E4(v54, v98, &qword_1EB8413D8);
    uint64_t v41 = (char *)v55;
    uint64_t v50 = 0;
    uint64_t v15 = v82;
    uint64_t v49 = v83;
  }
  else
  {
    uint64_t v45 = v38;
    uint64_t v49 = a2;
    uint64_t v50 = 1;
    uint64_t v51 = v95;
  }
  uint64_t v56 = 1;
  __swift_storeEnumTagSinglePayload((uint64_t)v41, v50, 1, v51);
  uint64_t v57 = v93;
  sub_1B5B88A24((uint64_t)v45, v93, (void (*)(void))type metadata accessor for SGBannerContainerView);
  unint64_t v58 = (*(unsigned __int8 *)(v89 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80);
  uint64_t v59 = swift_allocObject();
  sub_1B5B8B150(v57, v59 + v58, (void (*)(void))type metadata accessor for SGBannerContainerView);
  uint64_t v60 = (uint64_t *)((char *)v2 + *(int *)(v91 + 36));
  *uint64_t v60 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
  swift_storeEnumTagMultiPayload();
  *uint64_t v2 = sub_1B5B8B108;
  v2[1] = (uint64_t (*)())v59;
  sub_1B5B8B2E4((uint64_t)v2, (uint64_t)v15, &qword_1EB840F48);
  uint64_t v61 = v51;
  uint64_t v62 = v49;
  uint64_t v63 = v92;
  if (*(unsigned char *)(v42 + 2) == 1)
  {
    uint64_t v64 = *v45;
    uint64_t v65 = *(void **)((char *)v45 + *(int *)(v88 + 24));
    sub_1B5B88A24(v42, v86, (void (*)(void))type metadata accessor for SGBannerViewModel);
    id v66 = v64;
    if (v65) {
      char v67 = objc_msgSend(v65, sel_hostApp) == (id)1;
    }
    else {
      char v67 = 0;
    }
    uint64_t v68 = v87;
    sub_1B5B92DC0((uint64_t)v64, (uint64_t)v65, v67, v87);
    char v69 = sub_1B5BC99F0();
    sub_1B5BC9320();
    OUTLINED_FUNCTION_7();
    uint64_t v70 = v85;
    sub_1B5B88A24((uint64_t)v68, v85, (void (*)(void))type metadata accessor for CloseButtonView);
    uint64_t v71 = (unsigned char *)(v70 + *(int *)(v61 + 36));
    *uint64_t v71 = v69;
    OUTLINED_FUNCTION_64((uint64_t)v71);
    sub_1B5B8AEC4((uint64_t)v68, (void (*)(void))type metadata accessor for CloseButtonView);
    uint64_t v72 = v84;
    OUTLINED_FUNCTION_107();
    sub_1B5B8B2E4(v73, v74, v75);
    sub_1B5B8B2E4(v72, v63, &qword_1EB8413D8);
    uint64_t v56 = 0;
  }
  __swift_storeEnumTagSinglePayload(v63, v56, 1, v61);
  uint64_t v76 = v97;
  sub_1B5B7E444(v98, v97, &qword_1EB8413E0);
  sub_1B5B7E444((uint64_t)v15, (uint64_t)v2, &qword_1EB840F48);
  uint64_t v77 = v96;
  sub_1B5B7E444(v63, v96, &qword_1EB8413E0);
  sub_1B5B7E444(v76, v62, &qword_1EB8413E0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840F78);
  sub_1B5B7E444((uint64_t)v2, v62 + *(int *)(v78 + 48), &qword_1EB840F48);
  sub_1B5B7E444(v77, v62 + *(int *)(v78 + 64), &qword_1EB8413E0);
  sub_1B5B7E758(v63, &qword_1EB8413E0);
  sub_1B5B7E758((uint64_t)v15, &qword_1EB840F48);
  uint64_t v79 = OUTLINED_FUNCTION_50_0();
  sub_1B5B7E758(v79, v80);
  sub_1B5B7E758(v77, &qword_1EB8413E0);
  sub_1B5B7E758((uint64_t)v2, &qword_1EB840F48);
  return sub_1B5B7E758(v76, &qword_1EB8413E0);
}

uint64_t sub_1B5B85BE0@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v141 = a2;
  uint64_t v139 = type metadata accessor for PrimaryActionButtonView(0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_4_1();
  uint64_t v129 = v7;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_15_0();
  uint64_t v128 = v9;
  uint64_t v10 = OUTLINED_FUNCTION_56();
  uint64_t v11 = type metadata accessor for SGBannerContainerView(v10);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_3();
  uint64_t v143 = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841570);
  uint64_t v15 = OUTLINED_FUNCTION_19_1(v14);
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_4_1();
  uint64_t v140 = v16;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_15_0();
  uint64_t v138 = v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841678);
  uint64_t v20 = OUTLINED_FUNCTION_19_1(v19);
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_3();
  uint64_t v142 = v21;
  uint64_t v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8415C0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_3();
  uint64_t v147 = v23;
  uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841178);
  OUTLINED_FUNCTION_1_2();
  uint64_t v151 = v24;
  MEMORY[0x1F4188790](v25);
  uint64_t v145 = (char *)v125 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v27);
  OUTLINED_FUNCTION_31_0();
  uint64_t v144 = v28;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v29);
  uint64_t v150 = (char *)v125 - v30;
  uint64_t v31 = OUTLINED_FUNCTION_56();
  uint64_t v136 = type metadata accessor for IconView(v31);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v32);
  OUTLINED_FUNCTION_4_1();
  uint64_t v132 = v33;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_15_0();
  uint64_t v126 = v35;
  uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8414C8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_3();
  uint64_t v135 = v37;
  uint64_t v38 = OUTLINED_FUNCTION_56();
  uint64_t v39 = type metadata accessor for SGBannerViewModel(v38);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v40);
  OUTLINED_FUNCTION_4_1();
  uint64_t v127 = v41;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v42);
  OUTLINED_FUNCTION_31_0();
  uint64_t v131 = v43;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v44);
  OUTLINED_FUNCTION_15_0();
  uint64_t v130 = v45;
  uint64_t v46 = OUTLINED_FUNCTION_56();
  uint64_t v133 = type metadata accessor for BannerIconSGView(v46);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v47);
  OUTLINED_FUNCTION_43_0();
  MEMORY[0x1F4188790](v48);
  uint64_t v50 = (char *)v125 - v49;
  uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8414E8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v51);
  OUTLINED_FUNCTION_12_0();
  uint64_t v52 = sub_1B5BC96C0();
  OUTLINED_FUNCTION_1_2();
  uint64_t v54 = v53;
  MEMORY[0x1F4188790](v55);
  OUTLINED_FUNCTION_16();
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8414F0);
  uint64_t v57 = OUTLINED_FUNCTION_19_1(v56);
  MEMORY[0x1F4188790](v57);
  OUTLINED_FUNCTION_4_1();
  uint64_t v149 = v58;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v59);
  uint64_t v152 = (uint64_t)v125 - v60;
  uint64_t v61 = (int *)v11;
  uint64_t v62 = a1;
  OUTLINED_FUNCTION_100();
  LOBYTE(a1) = sub_1B5BC96B0();
  (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v3, v52);
  uint64_t v63 = 0x1E612E000;
  if (a1)
  {
    uint64_t v64 = 1;
    uint64_t v65 = v62;
    uint64_t v66 = v142;
    uint64_t v67 = v143;
    uint64_t v68 = v152;
    uint64_t v69 = v137;
  }
  else
  {
    v125[0] = v4;
    uint64_t v70 = v132;
    v125[2] = v2;
    uint64_t v71 = (uint64_t)v62 + v61[5];
    uint64_t v72 = *(void *)(v71 + *(int *)(v39 + 48) + 80);
    uint64_t v73 = *v62;
    uint64_t v65 = v62;
    v125[1] = (void *)v39;
    if (v72)
    {
      uint64_t v70 = v130;
      sub_1B5B88A24(v71, v130, (void (*)(void))type metadata accessor for SGBannerViewModel);
      uint64_t v74 = *(void **)((char *)v62 + v61[6]);
      uint64_t v66 = v142;
      id v75 = v73;
      if (v74) {
        char v76 = objc_msgSend(v74, sel_hostApp) == (id)1;
      }
      else {
        char v76 = 0;
      }
      uint64_t v79 = (uint64_t)v50;
      uint64_t v80 = v125[0];
      sub_1B5B908B4((uint64_t)v73, v76, v125[0]);
      sub_1B5B8B150((uint64_t)v80, v79, (void (*)(void))type metadata accessor for BannerIconSGView);
      sub_1B5B88A24(v79, v135, (void (*)(void))type metadata accessor for BannerIconSGView);
      OUTLINED_FUNCTION_61_0();
      swift_storeEnumTagMultiPayload();
      sub_1B5B8AD9C((uint64_t)&unk_1EB8416A8);
      sub_1B5B8AD9C((uint64_t)&unk_1EB8416B0);
      OUTLINED_FUNCTION_75_0();
      sub_1B5BC9830();
      sub_1B5B8AEC4(v79, (void (*)(void))type metadata accessor for BannerIconSGView);
      uint64_t v67 = v143;
      uint64_t v68 = v152;
    }
    else
    {
      sub_1B5B88A24(v71, v131, (void (*)(void))type metadata accessor for SGBannerViewModel);
      uint64_t v77 = *(void **)((char *)v62 + v61[6]);
      uint64_t v66 = v142;
      id v78 = v73;
      if (v77) {
        objc_msgSend(v77, sel_hostApp);
      }
      uint64_t v67 = v143;
      uint64_t v68 = v152;
      uint64_t v81 = OUTLINED_FUNCTION_109();
      sub_1B5B8F7F8(v81, v82, v83);
      uint64_t v84 = v126;
      sub_1B5B8B150(v70, v126, (void (*)(void))type metadata accessor for IconView);
      uint64_t v85 = OUTLINED_FUNCTION_41();
      sub_1B5B88A24(v85, v86, v87);
      swift_storeEnumTagMultiPayload();
      sub_1B5B8AD9C((uint64_t)&unk_1EB8416A8);
      sub_1B5B8AD9C((uint64_t)&unk_1EB8416B0);
      OUTLINED_FUNCTION_75_0();
      sub_1B5BC9830();
      sub_1B5B8AEC4(v84, (void (*)(void))type metadata accessor for IconView);
    }
    sub_1B5B8B2E4(v70, v68, &qword_1EB8414E8);
    uint64_t v64 = 0;
    uint64_t v63 = (uint64_t)&off_1E612E000;
    uint64_t v69 = v137;
  }
  __swift_storeEnumTagSinglePayload(v68, v64, 1, v69);
  *(void *)uint64_t v66 = sub_1B5BC96E0();
  *(void *)(v66 + 8) = 0;
  *(unsigned char *)(v66 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841578);
  sub_1B5B868FC();
  char v88 = sub_1B5BC99C0();
  uint64_t v89 = (uint64_t)v65 + v61[5];
  sub_1B5BC9320();
  OUTLINED_FUNCTION_7();
  uint64_t v90 = v147;
  sub_1B5B7E444(v66, v147, &qword_1EB841678);
  uint64_t v91 = (unsigned char *)(v90 + *(int *)(v148 + 36));
  *uint64_t v91 = v88;
  OUTLINED_FUNCTION_64((uint64_t)v91);
  sub_1B5B7E758(v66, &qword_1EB841678);
  uint64_t v92 = (void *)v61[6];
  uint64_t v93 = *(void **)((char *)v92 + (void)v65);
  if (v93) {
    BOOL v94 = [v93 *(SEL *)(v63 + 3776)] == (id)1;
  }
  else {
    BOOL v94 = 0;
  }
  sub_1B5B8B1AC((uint64_t)&unk_1EB840FE0);
  uint64_t v95 = v144;
  uint64_t v96 = v94;
  uint64_t v97 = v147;
  sub_1B5BAB2D8(v96);
  sub_1B5B7E758(v97, &qword_1EB8415C0);
  uint64_t v98 = v146;
  (*(void (**)(char *, uint64_t, uint64_t))(v151 + 32))(v150, v95, v146);
  uint64_t v99 = (void *)MEMORY[0x1E4FBC8C8];
  OUTLINED_FUNCTION_2_0();
  uint64_t v101 = (*(uint64_t (**)(void))(v100 + 536))();
  sub_1B5B88A24((uint64_t)v65, v67, (void (*)(void))type metadata accessor for SGBannerContainerView);
  if (v101 == 1)
  {
    sub_1B5B8AEC4(v67, (void (*)(void))type metadata accessor for SGBannerContainerView);
LABEL_20:
    OUTLINED_FUNCTION_56_0();
    uint64_t v108 = v138;
    goto LABEL_23;
  }
  char v102 = *(unsigned char *)(v67 + v61[5] + 3);
  uint64_t v103 = sub_1B5B8AEC4(v67, (void (*)(void))type metadata accessor for SGBannerContainerView);
  if ((v102 & 1) == 0) {
    goto LABEL_20;
  }
  uint64_t v104 = *v65;
  (*(void (**)(uint64_t))((*v99 & *(void *)*v65) + 0x1A0))(v103);
  uint64_t v92 = *(void **)((char *)v92 + (void)v65);
  uint64_t v105 = v104;
  if (v92) {
    uint64_t v63 = [v92 *(SEL *)(v63 + 3776)] == (id)1;
  }
  else {
    uint64_t v63 = 0;
  }
  uint64_t v109 = (char *)v65 + v61[11];
  char v110 = *v109;
  uint64_t v111 = *((void *)v109 + 1);
  char v153 = v110;
  uint64_t v154 = v111;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840E68);
  sub_1B5BC9D60();
  sub_1B5B88A24(v89, v127, (void (*)(void))type metadata accessor for SGBannerViewModel);
  uint64_t v112 = v129;
  OUTLINED_FUNCTION_88();
  sub_1B5B91DFC();
  uint64_t v113 = v128;
  sub_1B5B8B150(v112, v128, (void (*)(void))type metadata accessor for PrimaryActionButtonView);
  uint64_t v108 = v138;
  sub_1B5B8B150(v113, v138, (void (*)(void))type metadata accessor for PrimaryActionButtonView);
  OUTLINED_FUNCTION_56_0();
  uint64_t v98 = v146;
  uint64_t v68 = v152;
LABEL_23:
  __swift_storeEnumTagSinglePayload(v108, v106, 1, v107);
  sub_1B5B7E444(v68, v149, &qword_1EB8414F0);
  uint64_t v114 = v150;
  uint64_t v115 = v151;
  uint64_t v116 = *(void (**)(void))(v151 + 16);
  uint64_t v117 = v145;
  OUTLINED_FUNCTION_107();
  v116();
  sub_1B5B7E444(v108, v63, &qword_1EB841570);
  uint64_t v118 = OUTLINED_FUNCTION_109();
  sub_1B5B7E444(v118, v119, &qword_1EB8414F0);
  uint64_t v120 = v63;
  uint64_t v121 = v98;
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841088);
  ((void (*)(char *, char *, uint64_t))v116)((char *)v92 + *(int *)(v122 + 48), v117, v121);
  sub_1B5B7E444(v120, (uint64_t)v92 + *(int *)(v122 + 64), &qword_1EB841570);
  sub_1B5B7E758(v108, &qword_1EB841570);
  uint64_t v123 = *(void (**)(char *, uint64_t))(v115 + 8);
  v123(v114, v121);
  sub_1B5B7E758(v152, &qword_1EB8414F0);
  sub_1B5B7E758(v120, &qword_1EB841570);
  v123(v117, v121);
  return sub_1B5B7E758(v149, &qword_1EB8414F0);
}

void sub_1B5B868FC()
{
  OUTLINED_FUNCTION_18();
  uint64_t v6 = v5;
  uint64_t v25 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8414D0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_16_1();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8415B8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_59();
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841670);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_24();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8415F8);
  uint64_t v13 = OUTLINED_FUNCTION_19_1(v12);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_73_0();
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v24 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841600);
  uint64_t v18 = OUTLINED_FUNCTION_19_1(v17);
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_58();
  sub_1B5B86C08();
  uint64_t v19 = *(int *)(type metadata accessor for SGBannerContainerView(0) + 32);
  if (*(unsigned char *)(v6 + v19) == 1)
  {
    sub_1B5B7E444(v2, v0, &qword_1EB841670);
    *(_WORD *)(v0 + *(int *)(v9 + 36)) = 256;
    uint64_t v20 = OUTLINED_FUNCTION_50_0();
    sub_1B5B7E444(v20, v21, v22);
    swift_storeEnumTagMultiPayload();
    sub_1B5B8AF18((uint64_t)&unk_1EB8415B0);
    sub_1B5B8B244();
    OUTLINED_FUNCTION_76_0();
    sub_1B5BC9830();
    sub_1B5B7E758(v0, &qword_1EB8415B8);
  }
  else
  {
    sub_1B5B7E444(v2, v1, &qword_1EB841670);
    swift_storeEnumTagMultiPayload();
    sub_1B5B8AF18((uint64_t)&unk_1EB8415B0);
    sub_1B5B8B244();
    OUTLINED_FUNCTION_76_0();
    sub_1B5BC9830();
  }
  sub_1B5B8B2E4(v4, (uint64_t)v16, &qword_1EB8415F8);
  sub_1B5B7E758(v2, &qword_1EB841670);
  char v23 = MEMORY[0x1F4188790](*(unsigned __int8 *)(v6 + v19));
  *(&v24 - 2) = v6;
  sub_1B5B870A0(v23, (uint64_t)sub_1B5B8B2DC, v3);
  sub_1B5B7E758((uint64_t)v16, &qword_1EB8415F8);
  sub_1B5B8B2E4(v3, v25, &qword_1EB841600);
  OUTLINED_FUNCTION_17();
}

void sub_1B5B86C08()
{
  OUTLINED_FUNCTION_18();
  uint64_t v5 = v4;
  uint64_t v56 = v6;
  uint64_t v7 = (int *)type metadata accessor for SGBannerContainerView(0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_16();
  uint64_t v9 = type metadata accessor for SGBannerViewModel(0);
  uint64_t v10 = OUTLINED_FUNCTION_19_1(v9);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_58();
  uint64_t v11 = sub_1B5BC9080();
  uint64_t v12 = OUTLINED_FUNCTION_19_1(v11);
  MEMORY[0x1F4188790](v12);
  uint64_t v13 = OUTLINED_FUNCTION_48_1();
  uint64_t v14 = type metadata accessor for TitleView(v13);
  uint64_t v15 = OUTLINED_FUNCTION_19_1(v14);
  MEMORY[0x1F4188790](v15);
  uint64_t v55 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_73_0();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_57_0();
  uint64_t v19 = *(void **)v5;
  sub_1B5B733E8(*(void **)v5);
  uint64_t v20 = v5 + v7[5];
  sub_1B5B88A24(v20, v2, (void (*)(void))type metadata accessor for SGBannerViewModel);
  uint64_t v21 = *(void **)(v5 + v7[6]);
  id v22 = v19;
  if (v21) {
    char v23 = objc_msgSend(v21, sel_hostApp) == (id)1;
  }
  else {
    char v23 = 0;
  }
  sub_1B5B91014((uint64_t)v19, v23, v3);
  sub_1B5B8B150(v3, v0, (void (*)(void))type metadata accessor for TitleView);
  if (*(unsigned char *)(v20 + 4) == 1)
  {
    uint64_t v24 = sub_1B5B72DF4();
    char v26 = v25;
    uint64_t v5 = *(unsigned __int8 *)(v5 + v7[8]);
    uint64_t v27 = *(unsigned __int8 *)(v20 + 5);
    id v28 = v19;
    if (v21) {
      char v29 = objc_msgSend(v21, sel_hostApp) == (id)1;
    }
    else {
      char v29 = 0;
    }
    uint64_t v34 = (uint64_t)v55;
    uint64_t v33 = v56;
    uint64_t v57 = sub_1B5B910C8(v24, v26 & 1, v5, v27, (uint64_t)v19, v29);
    uint64_t v58 = v43 & 0x10101;
    uint64_t v59 = v44;
    __int16 v60 = v45 & 1;
    sub_1B5B8B64C();
    sub_1B5B8B698();
    sub_1B5BC9830();
    OUTLINED_FUNCTION_71_0();
    if (v41) {
      __int16 v42 = 0;
    }
    else {
      __int16 v42 = 256;
    }
LABEL_17:
    LOWORD(v1) = v42 | v40;
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_86();
  uint64_t v31 = (*(uint64_t (**)(void))(v30 + 536))();
  sub_1B5B88A24(v5, v1, (void (*)(void))type metadata accessor for SGBannerContainerView);
  if (v31 == 1)
  {
    char v32 = *(unsigned char *)(v1 + v7[5] + 3);
    sub_1B5B8AEC4(v1, (void (*)(void))type metadata accessor for SGBannerContainerView);
    uint64_t v34 = (uint64_t)v55;
    uint64_t v33 = v56;
    if ((v32 & 1) == 0)
    {
      OUTLINED_FUNCTION_97();
      goto LABEL_18;
    }
    uint64_t v19 = *(void **)v5;
    OUTLINED_FUNCTION_86();
    (*(void (**)(void))(v35 + 416))();
    id v36 = v19;
    uint64_t v37 = OUTLINED_FUNCTION_50_0();
    uint64_t v57 = nullsub_1(v37);
    uint64_t v58 = v38;
    uint64_t v59 = v39;
    __int16 v60 = 256;
    sub_1B5B8B64C();
    sub_1B5B8B698();
    sub_1B5BC9830();
    OUTLINED_FUNCTION_71_0();
    if (v41) {
      __int16 v42 = 0;
    }
    else {
      __int16 v42 = 256;
    }
    goto LABEL_17;
  }
  sub_1B5B8AEC4(v1, (void (*)(void))type metadata accessor for SGBannerContainerView);
  OUTLINED_FUNCTION_97();
  uint64_t v34 = (uint64_t)v55;
  uint64_t v33 = v56;
LABEL_18:
  sub_1B5B88A24(v0, v34, (void (*)(void))type metadata accessor for TitleView);
  sub_1B5B88A24(v34, v33, (void (*)(void))type metadata accessor for TitleView);
  uint64_t v46 = v33 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB8413D0) + 48);
  *(void *)uint64_t v46 = v19;
  *(void *)(v46 + 8) = v5;
  *(void *)(v46 + 16) = v7;
  *(_WORD *)(v46 + 24) = v1;
  uint64_t v47 = OUTLINED_FUNCTION_108();
  sub_1B5B8B59C(v47, v48, v49, v50);
  sub_1B5B8AEC4(v0, (void (*)(void))type metadata accessor for TitleView);
  uint64_t v51 = OUTLINED_FUNCTION_108();
  sub_1B5B8B5F4(v51, v52, v53, v54);
  sub_1B5B8AEC4(v34, (void (*)(void))type metadata accessor for TitleView);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1B5B870A0@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  v19[0] = a2;
  v19[1] = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8415F8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8415E8);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841660);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    ((void (*)(uint64_t))v19[0])(v4);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v11, v15, v12);
    swift_storeEnumTagMultiPayload();
    unint64_t v16 = sub_1B5B8B33C();
    uint64_t v20 = v6;
    unint64_t v21 = v16;
    swift_getOpaqueTypeConformance2();
    sub_1B5BC9830();
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  else
  {
    sub_1B5B7E444(v4, (uint64_t)v8, &qword_1EB8415F8);
    sub_1B5B7E444((uint64_t)v8, (uint64_t)v11, &qword_1EB8415F8);
    swift_storeEnumTagMultiPayload();
    unint64_t v18 = sub_1B5B8B33C();
    uint64_t v20 = v6;
    unint64_t v21 = v18;
    swift_getOpaqueTypeConformance2();
    sub_1B5BC9830();
    return sub_1B5B7E758((uint64_t)v8, &qword_1EB8415F8);
  }
}

void sub_1B5B8734C()
{
  OUTLINED_FUNCTION_18();
  uint64_t v54 = v0;
  uint64_t v56 = v2;
  uint64_t v57 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v50 = v8;
  uint64_t v51 = v7;
  int v53 = v9;
  uint64_t v11 = v10;
  OUTLINED_FUNCTION_1_2();
  uint64_t v52 = v12;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_49_0();
  MEMORY[0x1F4188790](v14);
  unint64_t v16 = (char *)&v50 - v15;
  OUTLINED_FUNCTION_1_2();
  uint64_t v18 = v17;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_32();
  uint64_t v22 = v20 - v21;
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_58_0();
  uint64_t v55 = sub_1B5BC9840();
  OUTLINED_FUNCTION_1_2();
  uint64_t v25 = v24;
  MEMORY[0x1F4188790](v26);
  id v28 = (char *)&v50 - v27;
  if (v53)
  {
    v51(v54);
    char v29 = *(void (**)(uint64_t))(v18 + 16);
    OUTLINED_FUNCTION_62_0();
    OUTLINED_FUNCTION_28_0();
    v29(v30);
    uint64_t v54 = v11;
    uint64_t v31 = *(void (**)(uint64_t))(v18 + 8);
    OUTLINED_FUNCTION_51_1();
    v31(v32);
    OUTLINED_FUNCTION_50_0();
    OUTLINED_FUNCTION_28_0();
    v29(v33);
    sub_1B5B83C5C(v22, v4);
    OUTLINED_FUNCTION_51_1();
    v31(v34);
    OUTLINED_FUNCTION_61_0();
    OUTLINED_FUNCTION_51_1();
    v31(v35);
  }
  else
  {
    uint64_t v36 = v52;
    uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v52 + 16);
    OUTLINED_FUNCTION_84();
    v37(v38, v39);
    OUTLINED_FUNCTION_84();
    v37(v40, v41);
    uint64_t v42 = OUTLINED_FUNCTION_109();
    sub_1B5B83D54(v42, v43, v6);
    uint64_t v44 = *(void (**)(char *, uint64_t))(v36 + 8);
    OUTLINED_FUNCTION_51_1();
    v44(v45, v46);
    v44(v16, v6);
  }
  uint64_t v47 = v55;
  uint64_t v58 = v56;
  uint64_t v59 = v57;
  swift_getWitnessTable();
  OUTLINED_FUNCTION_80();
  v49(v48);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v28, v47);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1B5B87608()
{
  uint64_t v0 = OUTLINED_FUNCTION_70_0();
  uint64_t v1 = OUTLINED_FUNCTION_23(v0);
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x1F4188790](v1);
  uint64_t v6 = OUTLINED_FUNCTION_61_0();
  sub_1B5B88A24(v6, v7, v8);
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = swift_allocObject();
  sub_1B5B8B150((uint64_t)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9, (void (*)(void))type metadata accessor for SGBannerContainerView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8415F8);
  sub_1B5B8B33C();
  sub_1B5BC9B70();
  return swift_release();
}

void sub_1B5B87734(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_1B5BC96D0();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D943F0);
  sub_1B5B8777C();
}

void sub_1B5B8777C()
{
  OUTLINED_FUNCTION_18();
  uint64_t v2 = v1;
  uint64_t v3 = type metadata accessor for SGBannerContainerView(0);
  uint64_t v4 = OUTLINED_FUNCTION_19_1(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_4_1();
  uint64_t v34 = v5;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_31_0();
  uint64_t v33 = v7;
  OUTLINED_FUNCTION_11();
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v31 - v10;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_31_0();
  uint64_t v13 = v12;
  uint64_t v15 = MEMORY[0x1F4188790](v14);
  uint64_t v17 = (void **)((char *)&v31 - v16);
  uint64_t v18 = MEMORY[0x1F4188790](v15);
  uint64_t v20 = (void **)((char *)&v31 - v19);
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_43_0();
  MEMORY[0x1F4188790](v21);
  uint64_t v23 = (void **)((char *)&v31 - v22);
  sub_1B5BB9B68();
  type metadata accessor for BannerUpdateViewModel(0);
  swift_allocObject();
  OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_39_0(v23);
  sub_1B5BB9484();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_96();
  uint64_t v31 = v0;
  OUTLINED_FUNCTION_39_0(v0);
  sub_1B5BB968C();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_39_0(v20);
  sub_1B5BB9DA4();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_39_0(v17);
  uint64_t v32 = v13;
  sub_1B5B88A24((uint64_t)v23, v13, (void (*)(void))type metadata accessor for SGBannerContainerView);
  sub_1B5B88A24((uint64_t)v0, (uint64_t)v11, (void (*)(void))type metadata accessor for SGBannerContainerView);
  uint64_t v24 = v33;
  sub_1B5B88A24((uint64_t)v20, v33, (void (*)(void))type metadata accessor for SGBannerContainerView);
  uint64_t v25 = v34;
  sub_1B5B88A24((uint64_t)v17, v34, (void (*)(void))type metadata accessor for SGBannerContainerView);
  uint64_t v26 = OUTLINED_FUNCTION_109();
  sub_1B5B88A24(v26, v27, (void (*)(void))type metadata accessor for SGBannerContainerView);
  id v28 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94438);
  sub_1B5B88A24((uint64_t)v11, v2 + v28[12], (void (*)(void))type metadata accessor for SGBannerContainerView);
  sub_1B5B88A24(v24, v2 + v28[16], (void (*)(void))type metadata accessor for SGBannerContainerView);
  sub_1B5B88A24(v25, v2 + v28[20], (void (*)(void))type metadata accessor for SGBannerContainerView);
  sub_1B5B8AEC4((uint64_t)v17, (void (*)(void))type metadata accessor for SGBannerContainerView);
  sub_1B5B8AEC4((uint64_t)v20, (void (*)(void))type metadata accessor for SGBannerContainerView);
  sub_1B5B8AEC4((uint64_t)v31, (void (*)(void))type metadata accessor for SGBannerContainerView);
  sub_1B5B8AEC4((uint64_t)v23, (void (*)(void))type metadata accessor for SGBannerContainerView);
  uint64_t v29 = OUTLINED_FUNCTION_62_0();
  sub_1B5B8AEC4(v29, v30);
  sub_1B5B8AEC4(v24, (void (*)(void))type metadata accessor for SGBannerContainerView);
  sub_1B5B8AEC4((uint64_t)v11, (void (*)(void))type metadata accessor for SGBannerContainerView);
  sub_1B5B8AEC4(v32, (void (*)(void))type metadata accessor for SGBannerContainerView);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1B5B87A5C(uint64_t a1)
{
  unint64_t v2 = sub_1B5B8AE78();
  return MEMORY[0x1F40F8C48](a1, v2);
}

uint64_t sub_1B5B87AA8(uint64_t a1)
{
  unint64_t v2 = sub_1B5B8AE78();
  return MEMORY[0x1F40F8C40](a1, v2);
}

void sub_1B5B87AF4()
{
  OUTLINED_FUNCTION_21_0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  char v5 = v4;
  uint64_t v7 = v6;
  *uint64_t v6 = v4;
  uint64_t v8 = (int *)type metadata accessor for BannerViewBackgroundModifier(0);
  sub_1B5BC9340();
  OUTLINED_FUNCTION_6_0();
  uint64_t v10 = v9;
  uint64_t v23 = v11;
  OUTLINED_FUNCTION_80();
  v12();
  *(void *)&v7[v8[6]] = v1;
  uint64_t v13 = self;
  uint64_t v14 = v1;
  id v15 = objc_msgSend(v13, sel_currentDevice);
  id v16 = objc_msgSend(v15, sel_userInterfaceIdiom);

  v7[v8[7]] = v16 == (id)6;
  id v17 = objc_msgSend(v13, sel_currentDevice);
  id v18 = objc_msgSend(v17, sel_userInterfaceIdiom);

  *(void *)&v7[v8[8]] = v18;
  if (v5)
  {

    BOOL v19 = 1;
LABEL_7:
    uint64_t v21 = v23;
    goto LABEL_8;
  }
  if (v16 != (id)6)
  {

    BOOL v19 = 0;
    goto LABEL_7;
  }
  uint64_t v20 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v14) + 0x218);
  uint64_t v21 = v23;
  if (v20() == 2)
  {

    BOOL v19 = 1;
  }
  else
  {
    uint64_t v22 = v20();

    BOOL v19 = v22 == 3;
  }
LABEL_8:
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v3, v21);
  v7[v8[9]] = v19;
  OUTLINED_FUNCTION_20();
}

void sub_1B5B87CCC()
{
  OUTLINED_FUNCTION_18();
  uint64_t v86 = v3;
  uint64_t v89 = v4;
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841070);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_3();
  uint64_t v82 = v6;
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841108);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_3();
  uint64_t v79 = v8;
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841048);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v9);
  id v75 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = OUTLINED_FUNCTION_56();
  uint64_t v12 = type metadata accessor for BannerViewBackgroundModifier(v11);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_3();
  uint64_t v76 = v14;
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8410B8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_3();
  uint64_t v78 = v16;
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840FB8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_3();
  uint64_t v83 = v18;
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841068);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_65();
  uint64_t v22 = v21 - v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841040);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_16_1();
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8410A8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v24);
  uint64_t v26 = (char *)&v72 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840FA8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v28);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_2_0();
  uint64_t v30 = (void *)(*(uint64_t (**)(void))(v29 + 632))();
  if (!v30)
  {
    uint64_t v72 = v0;
    uint64_t v73 = v22;
    uint64_t v74 = v27;
    OUTLINED_FUNCTION_86();
    uint64_t v38 = (void *)(*(uint64_t (**)(void))(v37 + 608))();
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = sub_1B5BC9E80();
      uint64_t v42 = v41;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841148);
      OUTLINED_FUNCTION_1_0();
      uint64_t v43 = v83;
      OUTLINED_FUNCTION_23_0();
      v44();
      char v45 = (void *)(v43 + *(int *)(v84 + 36));
      *char v45 = v39;
      v45[1] = v40;
      v45[2] = v42;
      uint64_t v35 = &qword_1EB840FB8;
      sub_1B5B7E444(v43, v1, &qword_1EB840FB8);
      OUTLINED_FUNCTION_62_0();
      swift_storeEnumTagMultiPayload();
      sub_1B5B88864();
      sub_1B5B887A0();
      sub_1B5BC9830();
      sub_1B5B7E444((uint64_t)v26, v73, &qword_1EB8410A8);
      swift_storeEnumTagMultiPayload();
      sub_1B5B88928();
      sub_1B5B889E8();
      OUTLINED_FUNCTION_102();
      sub_1B5BC9830();

      sub_1B5B7E758((uint64_t)v26, &qword_1EB8410A8);
      uint64_t v36 = v43;
      goto LABEL_5;
    }
    uint64_t v47 = v12;
    if (v72[*(int *)(v12 + 36)] != 1)
    {
      uint64_t v64 = sub_1B5B72C4C();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841148);
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_23_0();
      v65();
      uint64_t v66 = (uint64_t *)(v2 + *(int *)(v74 + 36));
      *uint64_t v66 = v64;
      OUTLINED_FUNCTION_60_0((uint64_t)v66);
      uint64_t v67 = &qword_1EB840FA8;
      sub_1B5B7E444(v2, v82, &qword_1EB840FA8);
      swift_storeEnumTagMultiPayload();
      sub_1B5B88764();
      sub_1B5B88864();
      uint64_t v68 = v79;
      sub_1B5BC9830();
      sub_1B5B7E444(v68, v73, &qword_1EB841108);
      swift_storeEnumTagMultiPayload();
      sub_1B5B88928();
      sub_1B5B889E8();
      OUTLINED_FUNCTION_102();
      sub_1B5BC9830();
      sub_1B5B7E758(v68, &qword_1EB841108);
      uint64_t v36 = v2;
LABEL_15:
      uint64_t v46 = v67;
      goto LABEL_6;
    }
    int v48 = *v72;
    uint64_t v49 = v76;
    sub_1B5B88A24((uint64_t)v72, v76, (void (*)(void))type metadata accessor for BannerViewBackgroundModifier);
    if (v48 == 1)
    {
      uint64_t v50 = *(void *)(v49 + *(int *)(v47 + 32));
      sub_1B5B8AEC4(v49, (void (*)(void))type metadata accessor for BannerViewBackgroundModifier);
      uint64_t v51 = v73;
      uint64_t v52 = v79;
      uint64_t v53 = (uint64_t)v75;
      if (v50 == 6)
      {
        id v54 = objc_msgSend(self, sel_effectWithStyle_, 18);
        id v55 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1F00]), sel_initWithEffect_, v54);

        uint64_t v56 = sub_1B5BC9E80();
        uint64_t v58 = v57;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841148);
        OUTLINED_FUNCTION_1_0();
        uint64_t v59 = v83;
        OUTLINED_FUNCTION_23_0();
        v60();
        uint64_t v61 = (void *)(v59 + *(int *)(v84 + 36));
        *uint64_t v61 = v55;
        v61[1] = v56;
        v61[2] = v58;
        uint64_t v62 = &qword_1EB840FB8;
        sub_1B5B7E444(v59, v53, &qword_1EB840FB8);
        swift_storeEnumTagMultiPayload();
        sub_1B5B887A0();
        sub_1B5B88864();
        OUTLINED_FUNCTION_101();
        sub_1B5BC9830();
        uint64_t v63 = v59;
LABEL_14:
        sub_1B5B7E758(v63, v62);
        uint64_t v67 = &qword_1EB8410B8;
        sub_1B5B7E444(v53, v82, &qword_1EB8410B8);
        swift_storeEnumTagMultiPayload();
        sub_1B5B88764();
        sub_1B5B88864();
        sub_1B5BC9830();
        sub_1B5B7E444(v52, v51, &qword_1EB841108);
        swift_storeEnumTagMultiPayload();
        sub_1B5B88928();
        sub_1B5B889E8();
        OUTLINED_FUNCTION_102();
        sub_1B5BC9830();
        sub_1B5B7E758(v52, &qword_1EB841108);
        uint64_t v36 = v53;
        goto LABEL_15;
      }
    }
    else
    {
      sub_1B5B8AEC4(v49, (void (*)(void))type metadata accessor for BannerViewBackgroundModifier);
      uint64_t v51 = v73;
      uint64_t v52 = v79;
      uint64_t v53 = (uint64_t)v75;
    }
    uint64_t v69 = sub_1B5B72C4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841148);
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_23_0();
    v70();
    uint64_t v71 = (uint64_t *)(v2 + *(int *)(v74 + 36));
    *uint64_t v71 = v69;
    OUTLINED_FUNCTION_60_0((uint64_t)v71);
    uint64_t v62 = &qword_1EB840FA8;
    sub_1B5B7E444(v2, v53, &qword_1EB840FA8);
    swift_storeEnumTagMultiPayload();
    sub_1B5B887A0();
    sub_1B5B88864();
    OUTLINED_FUNCTION_101();
    sub_1B5BC9830();
    uint64_t v63 = v2;
    goto LABEL_14;
  }
  id v31 = v30;
  uint64_t v32 = MEMORY[0x1BA9A7260]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841148);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_23_0();
  v33();
  uint64_t v34 = (uint64_t *)(v2 + *(int *)(v27 + 36));
  *uint64_t v34 = v32;
  OUTLINED_FUNCTION_60_0((uint64_t)v34);
  uint64_t v35 = &qword_1EB840FA8;
  sub_1B5B7E444(v2, v1, &qword_1EB840FA8);
  OUTLINED_FUNCTION_62_0();
  swift_storeEnumTagMultiPayload();
  sub_1B5B88864();
  sub_1B5B887A0();
  sub_1B5BC9830();
  sub_1B5B7E444((uint64_t)v26, v22, &qword_1EB8410A8);
  swift_storeEnumTagMultiPayload();
  sub_1B5B88928();
  sub_1B5B889E8();
  OUTLINED_FUNCTION_102();
  sub_1B5BC9830();

  sub_1B5B7E758((uint64_t)v26, &qword_1EB8410A8);
  uint64_t v36 = v2;
LABEL_5:
  uint64_t v46 = v35;
LABEL_6:
  sub_1B5B7E758(v36, v46);
  OUTLINED_FUNCTION_17();
}

id sub_1B5B88638()
{
  return *v0;
}

uint64_t sub_1B5B88650()
{
  return sub_1B5BC9780();
}

uint64_t sub_1B5B88694()
{
  OUTLINED_FUNCTION_110();
  uint64_t v0 = OUTLINED_FUNCTION_72_0();
  return MEMORY[0x1F40F9EF0](v0);
}

uint64_t sub_1B5B886D8()
{
  OUTLINED_FUNCTION_110();
  uint64_t v0 = OUTLINED_FUNCTION_72_0();
  return MEMORY[0x1F40F9E78](v0);
}

void sub_1B5B8871C()
{
}

uint64_t type metadata accessor for BannerViewBackgroundModifier(uint64_t a1)
{
  return sub_1B5B7B630(a1, qword_1EB841F70);
}

unint64_t sub_1B5B88764()
{
  return sub_1B5B88964((uint64_t)&unk_1EB8410B0);
}

unint64_t sub_1B5B887A0()
{
  unint64_t result = qword_1EB840FB0;
  if (!qword_1EB840FB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840FB8);
    sub_1B5B7E718((uint64_t)&unk_1EB841140);
    sub_1B5B7E718((uint64_t)&unk_1EB8416D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840FB0);
  }
  return result;
}

unint64_t sub_1B5B88864()
{
  unint64_t result = qword_1EB840FA0;
  if (!qword_1EB840FA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840FA8);
    sub_1B5B7E718((uint64_t)&unk_1EB841140);
    sub_1B5B7E718((uint64_t)&unk_1EB8416E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840FA0);
  }
  return result;
}

unint64_t sub_1B5B88928()
{
  return sub_1B5B88964((uint64_t)&unk_1EB8410A0);
}

unint64_t sub_1B5B88964(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    uint64_t v6 = v5;
    uint64_t v7 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v7();
    v6();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1B5B889E8()
{
  return sub_1B5B88964((uint64_t)&unk_1EB841100);
}

uint64_t sub_1B5B88A24(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_23_0();
  v4();
  return a2;
}

uint64_t sub_1B5B88A80()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B5B88AC4()
{
  return MEMORY[0x1E4F1ABE8];
}

uint64_t sub_1B5B88AD0()
{
  return OUTLINED_FUNCTION_5_0();
}

unint64_t sub_1B5B88AEC()
{
  unint64_t result = qword_1E9D943F8;
  if (!qword_1E9D943F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D943F8);
  }
  return result;
}

uint64_t sub_1B5B88B38()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5B88B50()
{
  return OUTLINED_FUNCTION_5_0();
}

unint64_t sub_1B5B88B6C()
{
  unint64_t result = qword_1E9D94400;
  if (!qword_1E9D94400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94400);
  }
  return result;
}

uint64_t sub_1B5B88BB8()
{
  return MEMORY[0x1E4F3F158];
}

void type metadata accessor for CloseButtonWidthPreferenceKey()
{
}

void type metadata accessor for ActionButtonWidthPreferenceKey()
{
}

uint64_t sub_1B5B88BDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 24);
}

void sub_1B5B88BE4()
{
  sub_1B5B8A670(319, (unint64_t *)&qword_1EB841758, MEMORY[0x1E4F3D5D8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_1B5B88C9C(uint64_t *a1)
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v5 = *v2;
  if ((*(_DWORD *)(v4 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_59_0(v5);
  }
  else
  {
    uint64_t v6 = v2[1];
    *a1 = v5;
    a1[1] = v6;
    uint64_t v7 = *(int *)(v3 + 36);
    uint64_t v8 = (uint64_t *)((char *)a1 + v7);
    uint64_t v9 = (uint64_t *)((char *)v2 + v7);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
    if (OUTLINED_FUNCTION_48_0() == 1)
    {
      sub_1B5BC96C0();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_23_0();
      v10();
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    OUTLINED_FUNCTION_41();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1B5B88D6C(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1B5BC96C0();
    OUTLINED_FUNCTION_1_0();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v7(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

void *sub_1B5B88E1C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 36);
  uint64_t v6 = (void *)((char *)a1 + v5);
  uint64_t v7 = (void *)((char *)a2 + v5);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
  if (OUTLINED_FUNCTION_48_0() == 1)
  {
    sub_1B5BC96C0();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_23_0();
    v8();
  }
  else
  {
    *uint64_t v6 = *v7;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_1B5B88ECC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 36);
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_1B5B7E758((uint64_t)a1 + v7, &qword_1EB841750);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
    if (OUTLINED_FUNCTION_48_0() == 1)
    {
      sub_1B5BC96C0();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_23_0();
      v10();
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_1B5B88FA8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 36);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1B5BC96C0();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_24_1();
    v8();
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

_OWORD *sub_1B5B89070(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 36);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_1B5B7E758((uint64_t)a1 + v6, &qword_1EB841750);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_1B5BC96C0();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_24_1();
      v10();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1B5B89160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B5B89174);
}

uint64_t sub_1B5B89174(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return OUTLINED_FUNCTION_73(*a1);
  }
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94408);
  uint64_t v8 = (uint64_t)a1 + *(int *)(a3 + 36);
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t sub_1B5B891F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B5B89208);
}

void sub_1B5B89208()
{
  OUTLINED_FUNCTION_91();
  if (v3)
  {
    *uint64_t v1 = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94408);
    uint64_t v5 = OUTLINED_FUNCTION_63_0(*(int *)(v4 + 36));
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
}

uint64_t sub_1B5B89278()
{
  return type metadata accessor for BannerUpdateViewModel(0);
}

void sub_1B5B89280()
{
  sub_1B5B8ADE0(319, (unint64_t *)&qword_1EB841998, MEMORY[0x1E4FBB390], MEMORY[0x1E4F1AC70]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for BannerUpdateViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BannerUpdateViewModel);
}

char *initializeBufferWithCopyOfBuffer for SGBannerContainerView()
{
  OUTLINED_FUNCTION_6_0();
  int v4 = *(_DWORD *)(v3 + 80);
  uint64_t v5 = (char *)*v1;
  *unint64_t v0 = *v1;
  if ((v4 & 0x20000) != 0)
  {
    id v39 = &v5[(v4 + 16) & ~(unint64_t)v4];
  }
  else
  {
    uint64_t v6 = v0;
    uint64_t v7 = *(int *)(v2 + 20);
    uint64_t v8 = (char *)v0 + v7;
    uint64_t v9 = (char *)v1 + v7;
    *(_DWORD *)uint64_t v8 = *(_DWORD *)((char *)v1 + v7);
    v8[4] = *((unsigned char *)v1 + v7 + 4);
    *(_WORD *)(v8 + 5) = *(_WORD *)((char *)v1 + v7 + 5);
    uint64_t v10 = *(uint64_t *)((char *)v1 + v7 + 16);
    *((void *)v8 + 1) = *(void **)((char *)v1 + v7 + 8);
    *((void *)v8 + 2) = v10;
    uint64_t v49 = (int *)type metadata accessor for SGBannerViewModel(0);
    uint64_t v11 = v49[12];
    uint64_t v12 = &v8[v11];
    uint64_t v13 = &v9[v11];
    *uint64_t v12 = v9[v11];
    *(_WORD *)(v12 + 1) = *(_WORD *)&v9[v11 + 1];
    *(_OWORD *)(v12 + 8) = *(_OWORD *)&v9[v11 + 8];
    uint64_t v14 = *(void **)&v9[v11 + 32];
    *((void *)v12 + 3) = *(void *)&v9[v11 + 24];
    *((void *)v12 + 4) = v14;
    uint64_t v16 = *(void **)&v9[v11 + 40];
    uint64_t v15 = *(void *)&v9[v11 + 48];
    *((void *)v12 + 5) = v16;
    *((void *)v12 + 6) = v15;
    uint64_t v18 = *((void *)v13 + 7);
    uint64_t v17 = *((void *)v13 + 8);
    *((void *)v12 + 7) = v18;
    *((void *)v12 + 8) = v17;
    uint64_t v20 = *((void *)v13 + 9);
    uint64_t v19 = (void *)*((void *)v13 + 10);
    uint64_t v50 = v6;
    *((void *)v12 + 9) = v20;
    *((void *)v12 + 10) = v19;
    uint64_t v47 = v19;
    int v48 = (void *)*((void *)v13 + 11);
    uint64_t v21 = *((void *)v13 + 12);
    *((void *)v12 + 11) = v48;
    *((void *)v12 + 12) = v21;
    uint64_t v22 = *(int *)(type metadata accessor for SGBannerIconParams(0) + 68);
    char v45 = &v13[v22];
    uint64_t v46 = &v12[v22];
    uint64_t v23 = sub_1B5BC9230();
    OUTLINED_FUNCTION_95();
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
    uint64_t v26 = v5;
    swift_bridgeObjectRetain();
    id v27 = v14;
    id v28 = v16;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v29 = v47;
    id v30 = v48;
    v25(v46, v45, v23);
    uint64_t v31 = v49[13];
    uint64_t v32 = &v8[v31];
    uint64_t v33 = &v9[v31];
    uint64_t v34 = *((void *)v33 + 1);
    *(void *)uint64_t v32 = *(void *)v33;
    *((void *)v32 + 1) = v34;
    *((_WORD *)v32 + 8) = *((_WORD *)v33 + 8);
    uint64_t v35 = v49[14];
    uint64_t v36 = &v8[v35];
    OUTLINED_FUNCTION_34_0(v35);
    OUTLINED_FUNCTION_111();
    swift_retain();
    swift_retain();
    ((void (*)(uint64_t, uint64_t))v25)(v18, v20);
    OUTLINED_FUNCTION_83_0();
    v36[v37] = v38;
    id v39 = (char *)v50;
    OUTLINED_FUNCTION_18_1();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
    if (OUTLINED_FUNCTION_19() == 1)
    {
      sub_1B5BC9340();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_23_0();
      v40();
    }
    else
    {
      OUTLINED_FUNCTION_52_0();
    }
    OUTLINED_FUNCTION_46_0();
    OUTLINED_FUNCTION_79_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
    if (OUTLINED_FUNCTION_19() == 1)
    {
      sub_1B5BC96C0();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_23_0();
      v41();
    }
    else
    {
      OUTLINED_FUNCTION_52_0();
    }
    OUTLINED_FUNCTION_46_0();
    OUTLINED_FUNCTION_17_0();
    *(void *)(v43 + 8) = *(void *)(v42 + 8);
  }
  swift_retain();
  return v39;
}

uint64_t destroy for SGBannerContainerView(id *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for SGBannerViewModel(0);
  uint64_t v6 = (id *)&v4[*(int *)(v5 + 48)];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  type metadata accessor for SGBannerIconParams(0);
  uint64_t v7 = sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  uint64_t v9 = *(void (**)(uint64_t))(v8 + 8);
  uint64_t v10 = OUTLINED_FUNCTION_88();
  v9(v10);
  swift_release();
  swift_release();
  uint64_t v11 = &v4[*(int *)(v5 + 56)];
  uint64_t v12 = type metadata accessor for SGBannerPaddingParams(0);
  ((void (*)(char *, uint64_t))v9)(&v11[*(int *)(v12 + 56)], v7);

  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
  if (OUTLINED_FUNCTION_90() == 1)
  {
    sub_1B5BC9340();
    OUTLINED_FUNCTION_1_0();
    uint64_t v13 = OUTLINED_FUNCTION_29_0();
    v14(v13);
  }
  else
  {
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
  if (OUTLINED_FUNCTION_90() == 1)
  {
    sub_1B5BC96C0();
    OUTLINED_FUNCTION_1_0();
    uint64_t v15 = OUTLINED_FUNCTION_29_0();
    v16(v15);
  }
  else
  {
    swift_release();
  }
  return swift_release();
}

void **initializeWithCopy for SGBannerContainerView(void **a1, void **a2, uint64_t a3)
{
  uint64_t v42 = *a2;
  *a1 = *a2;
  uint64_t v3 = *(int *)(a3 + 20);
  int v4 = (char *)a1 + v3;
  uint64_t v5 = (char *)a2 + v3;
  *(_DWORD *)int v4 = *(_DWORD *)((char *)a2 + v3);
  v4[4] = *((unsigned char *)a2 + v3 + 4);
  *(_WORD *)(v4 + 5) = *(_WORD *)((char *)a2 + v3 + 5);
  uint64_t v6 = *(uint64_t *)((char *)a2 + v3 + 16);
  *((void *)v4 + 1) = *(void **)((char *)a2 + v3 + 8);
  *((void *)v4 + 2) = v6;
  uint64_t v43 = (int *)type metadata accessor for SGBannerViewModel(0);
  uint64_t v7 = v43[12];
  uint64_t v8 = &v4[v7];
  uint64_t v9 = &v5[v7];
  *uint64_t v8 = v5[v7];
  *(_WORD *)(v8 + 1) = *(_WORD *)&v5[v7 + 1];
  *(_OWORD *)(v8 + 8) = *(_OWORD *)&v5[v7 + 8];
  uint64_t v10 = *(void **)&v5[v7 + 32];
  *((void *)v8 + 3) = *(void *)&v5[v7 + 24];
  *((void *)v8 + 4) = v10;
  uint64_t v12 = *(void **)&v5[v7 + 40];
  uint64_t v11 = *(void *)&v5[v7 + 48];
  *((void *)v8 + 5) = v12;
  *((void *)v8 + 6) = v11;
  uint64_t v13 = *((void *)v9 + 8);
  *((void *)v8 + 7) = *((void *)v9 + 7);
  *((void *)v8 + 8) = v13;
  uint64_t v15 = *((void *)v9 + 9);
  uint64_t v14 = (void *)*((void *)v9 + 10);
  *((void *)v8 + 9) = v15;
  *((void *)v8 + 10) = v14;
  uint64_t v16 = *((void *)v9 + 12);
  uint64_t v41 = (void *)*((void *)v9 + 11);
  *((void *)v8 + 11) = v41;
  *((void *)v8 + 12) = v16;
  uint64_t v17 = *(int *)(type metadata accessor for SGBannerIconParams(0) + 68);
  id v39 = &v9[v17];
  uint64_t v40 = &v8[v17];
  uint64_t v18 = sub_1B5BC9230();
  OUTLINED_FUNCTION_95();
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  id v21 = v42;
  swift_bridgeObjectRetain();
  id v22 = v10;
  id v23 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v24 = v14;
  id v25 = v41;
  v20(v40, v39, v18);
  uint64_t v26 = v43[13];
  id v27 = &v4[v26];
  id v28 = &v5[v26];
  uint64_t v29 = *((void *)v28 + 1);
  *(void *)id v27 = *(void *)v28;
  *((void *)v27 + 1) = v29;
  *((_WORD *)v27 + 8) = *((_WORD *)v28 + 8);
  uint64_t v30 = v43[14];
  uint64_t v31 = &v4[v30];
  OUTLINED_FUNCTION_34_0(v30);
  OUTLINED_FUNCTION_111();
  swift_retain();
  swift_retain();
  ((void (*)(uint64_t, void *))v20)(v15, v12);
  OUTLINED_FUNCTION_83_0();
  v31[v32] = v33;
  OUTLINED_FUNCTION_18_1();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
  if (OUTLINED_FUNCTION_19() == 1)
  {
    sub_1B5BC9340();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_23_0();
    v34();
  }
  else
  {
    OUTLINED_FUNCTION_52_0();
  }
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_79_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
  if (OUTLINED_FUNCTION_19() == 1)
  {
    sub_1B5BC96C0();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_23_0();
    v35();
  }
  else
  {
    OUTLINED_FUNCTION_52_0();
  }
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_17_0();
  *(void *)(v37 + 8) = *(void *)(v36 + 8);
  swift_retain();
  return a1;
}

void assignWithCopy for SGBannerContainerView()
{
  OUTLINED_FUNCTION_21_0();
  uint64_t v3 = v2;
  uint64_t v52 = v2;
  uint64_t v53 = v4;
  uint64_t v6 = v5;
  uint64_t v7 = *v4;
  uint64_t v8 = *v5;
  *uint64_t v5 = *v4;
  id v9 = v7;

  OUTLINED_FUNCTION_12_1(v3[5]);
  *(void *)(v0 + 8) = *(void *)(v1 + 8);
  *(void *)(v0 + 16) = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = (int *)type metadata accessor for SGBannerViewModel(0);
  uint64_t v11 = v10[12];
  uint64_t v12 = v0 + v11;
  uint64_t v13 = (void *)(v1 + v11);
  *(unsigned char *)uint64_t v12 = *(unsigned char *)(v1 + v11);
  *(unsigned char *)(v12 + 1) = *(unsigned char *)(v1 + v11 + 1);
  *(unsigned char *)(v12 + 2) = *(unsigned char *)(v1 + v11 + 2);
  *(void *)(v12 + 8) = *(void *)(v1 + v11 + 8);
  *(void *)(v12 + 16) = *(void *)(v1 + v11 + 16);
  *(void *)(v12 + 24) = *(void *)(v1 + v11 + 24);
  uint64_t v14 = *(void **)(v0 + v11 + 32);
  uint64_t v15 = *(void **)(v1 + v11 + 32);
  *(void *)(v12 + 32) = v15;
  id v16 = v15;

  uint64_t v17 = *(void **)(v12 + 40);
  uint64_t v18 = (void *)v13[5];
  *(void *)(v12 + 40) = v18;
  id v19 = v18;

  *(void *)(v12 + 48) = v13[6];
  *(void *)(v12 + 56) = v13[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v12 + 64) = v13[8];
  *(void *)(v12 + 72) = v13[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void **)(v12 + 80);
  id v21 = (void *)v13[10];
  *(void *)(v12 + 80) = v21;
  id v22 = v21;

  id v23 = *(void **)(v12 + 88);
  id v24 = (void *)v13[11];
  *(void *)(v12 + 88) = v24;
  id v25 = v24;

  *(void *)(v12 + 96) = v13[12];
  uint64_t v26 = *(int *)(type metadata accessor for SGBannerIconParams(0) + 68);
  uint64_t v27 = v12 + v26;
  id v28 = (char *)v13 + v26;
  uint64_t v29 = sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  uint64_t v31 = *(void (**)(uint64_t, char *, uint64_t))(v30 + 24);
  v31(v27, v28, v29);
  uint64_t v32 = v10[13];
  uint64_t v33 = v0 + v32;
  uint64_t v34 = v1 + v32;
  *(void *)(v0 + v32) = *(void *)(v1 + v32);
  swift_retain();
  swift_release();
  *(void *)(v33 + 8) = *(void *)(v34 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(v33 + 16) = *(unsigned char *)(v34 + 16);
  *(unsigned char *)(v33 + 17) = *(unsigned char *)(v34 + 17);
  uint64_t v35 = v10[14];
  uint64_t v36 = (void *)(v0 + v35);
  uint64_t v37 = v1 + v35;
  *uint64_t v36 = *(void *)(v1 + v35);
  v36[1] = *(void *)(v1 + v35 + 8);
  _OWORD v36[2] = *(void *)(v1 + v35 + 16);
  v36[3] = *(void *)(v1 + v35 + 24);
  v36[4] = *(void *)(v1 + v35 + 32);
  v36[5] = *(void *)(v1 + v35 + 40);
  v36[6] = *(void *)(v1 + v35 + 48);
  v36[7] = *(void *)(v1 + v35 + 56);
  v36[8] = *(void *)(v1 + v35 + 64);
  v36[9] = *(void *)(v1 + v35 + 72);
  char v38 = (int *)type metadata accessor for SGBannerPaddingParams(0);
  v31((uint64_t)v36 + v38[14], (char *)(v37 + v38[14]), v29);
  *(void *)((char *)v36 + v38[15]) = *(void *)(v37 + v38[15]);
  *((unsigned char *)v36 + v38[16]) = *(unsigned char *)(v37 + v38[16]);
  uint64_t v39 = v52[6];
  uint64_t v40 = *(void **)((char *)v6 + v39);
  uint64_t v41 = *(void **)((char *)v53 + v39);
  *(void **)((char *)v6 + v39) = v41;
  id v42 = v41;

  uint64_t v43 = v52[7];
  uint64_t v44 = (void **)((char *)v6 + v43);
  char v45 = (void **)((char *)v53 + v43);
  *uint64_t v44 = *v45;
  v44[1] = v45[1];
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_106();
  if (!v46)
  {
    uint64_t v47 = (uint64_t)v6 + v52[9];
    sub_1B5B7E758(v47, &qword_1EB841760);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
    if (OUTLINED_FUNCTION_19() == 1)
    {
      sub_1B5BC9340();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_23_0();
      v48();
    }
    else
    {
      OUTLINED_FUNCTION_52_0();
    }
    OUTLINED_FUNCTION_46_0();
    OUTLINED_FUNCTION_79_0();
    sub_1B5B7E758(v47, &qword_1EB841750);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
    if (OUTLINED_FUNCTION_19() == 1)
    {
      sub_1B5BC96C0();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_23_0();
      v49();
    }
    else
    {
      OUTLINED_FUNCTION_52_0();
    }
    OUTLINED_FUNCTION_46_0();
  }
  OUTLINED_FUNCTION_17_0();
  *(void *)(v51 + 8) = *(void *)(v50 + 8);
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_20();
}

void initializeWithTake for SGBannerContainerView()
{
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_85();
  *uint64_t v5 = v6;
  uint64_t v8 = *(int *)(v7 + 20);
  id v9 = (char *)v5 + v8;
  uint64_t v11 = v10 + v8;
  *(_DWORD *)id v9 = *(_DWORD *)(v10 + v8);
  v9[4] = *(unsigned char *)(v10 + v8 + 4);
  *(_WORD *)(v9 + 5) = *(_WORD *)(v10 + v8 + 5);
  *(_OWORD *)(v9 + 8) = *(_OWORD *)(v10 + v8 + 8);
  uint64_t v12 = type metadata accessor for SGBannerViewModel(0);
  OUTLINED_FUNCTION_54_0(v12);
  *(_WORD *)(v3 + 1) = *(_WORD *)(v4 + 1);
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(v4 + 8);
  *(void *)(v3 + 24) = *(void *)(v4 + 24);
  long long v13 = *(_OWORD *)(v4 + 48);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)(v4 + 32);
  *(_OWORD *)(v3 + 48) = v13;
  long long v14 = *(_OWORD *)(v4 + 80);
  *(_OWORD *)(v3 + 64) = *(_OWORD *)(v4 + 64);
  *(_OWORD *)(v3 + 80) = v14;
  *(void *)(v3 + 96) = *(void *)(v4 + 96);
  type metadata accessor for SGBannerIconParams(0);
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_1_0();
  id v16 = *(void (**)(uint64_t))(v15 + 32);
  uint64_t v17 = (int *)(v15 + 32);
  uint64_t v18 = OUTLINED_FUNCTION_92();
  v16(v18);
  uint64_t v19 = *(int *)(v2 + 52);
  uint64_t v20 = &v9[v19];
  uint64_t v21 = v11 + v19;
  *(_OWORD *)uint64_t v20 = *(_OWORD *)v21;
  *((_WORD *)v20 + 8) = *(_WORD *)(v21 + 16);
  uint64_t v22 = OUTLINED_FUNCTION_22();
  uint64_t v23 = OUTLINED_FUNCTION_55_0(v22);
  v16(v23);
  OUTLINED_FUNCTION_42_0();
  uint64_t v24 = v17[7];
  *(void *)(v0 + v17[6]) = *(void *)(v1 + v17[6]);
  *(_OWORD *)(v0 + v24) = *(_OWORD *)(v1 + v24);
  *(unsigned char *)(v0 + v17[8]) = *(unsigned char *)(v1 + v17[8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
  uint64_t v25 = OUTLINED_FUNCTION_36_0();
  if (v25 == 1)
  {
    sub_1B5BC9340();
    OUTLINED_FUNCTION_1_0();
    uint64_t v27 = OUTLINED_FUNCTION_14_1();
    v28(v27);
    OUTLINED_FUNCTION_37_0();
  }
  else
  {
    uint64_t v29 = *(void *)(v4 - 8);
    v4 -= 8;
    OUTLINED_FUNCTION_89(v25, v26, *(void *)(v29 + 64));
  }
  OUTLINED_FUNCTION_105();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
  uint64_t v30 = OUTLINED_FUNCTION_36_0();
  if (v30 == 1)
  {
    sub_1B5BC96C0();
    OUTLINED_FUNCTION_1_0();
    uint64_t v32 = OUTLINED_FUNCTION_14_1();
    v33(v32);
    OUTLINED_FUNCTION_37_0();
  }
  else
  {
    OUTLINED_FUNCTION_89(v30, v31, *(void *)(*(void *)(v4 - 8) + 64));
  }
  *(_OWORD *)(v0 + v17[11]) = *(_OWORD *)(v1 + v17[11]);
  OUTLINED_FUNCTION_20();
}

void assignWithTake for SGBannerContainerView()
{
  OUTLINED_FUNCTION_21_0();
  uint64_t v8 = v7;
  OUTLINED_FUNCTION_85();
  uint64_t v10 = *v9;
  *id v9 = v11;

  OUTLINED_FUNCTION_12_1(*(int *)(v8 + 20));
  uint64_t v12 = *(void *)(v6 + 16);
  *(void *)(v5 + 8) = *(void *)(v6 + 8);
  *(void *)(v5 + 16) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = type metadata accessor for SGBannerViewModel(0);
  OUTLINED_FUNCTION_54_0(v13);
  *(unsigned char *)(v3 + 1) = *(unsigned char *)(v4 + 1);
  *(unsigned char *)(v3 + 2) = *(unsigned char *)(v4 + 2);
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(v4 + 8);
  *(void *)(v3 + 24) = *(void *)(v4 + 24);
  long long v14 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = *(void *)(v4 + 32);

  uint64_t v15 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = *(void *)(v4 + 40);

  uint64_t v16 = *(void *)(v4 + 56);
  *(void *)(v3 + 48) = *(void *)(v4 + 48);
  *(void *)(v3 + 56) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(v4 + 72);
  *(void *)(v3 + 64) = *(void *)(v4 + 64);
  *(void *)(v3 + 72) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = *(void *)(v4 + 80);

  uint64_t v19 = *(void **)(v3 + 88);
  *(void *)(v3 + 88) = *(void *)(v4 + 88);

  *(void *)(v3 + 96) = *(void *)(v4 + 96);
  type metadata accessor for SGBannerIconParams(0);
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_1_0();
  uint64_t v21 = *(void (**)(uint64_t))(v20 + 40);
  uint64_t v22 = v20 + 40;
  uint64_t v23 = OUTLINED_FUNCTION_92();
  v21(v23);
  uint64_t v24 = *(int *)(v2 + 52);
  uint64_t v25 = v5 + v24;
  uint64_t v26 = v6 + v24;
  *(void *)(v5 + v24) = *(void *)(v6 + v24);
  swift_release();
  *(void *)(v25 + 8) = *(void *)(v26 + 8);
  swift_release();
  *(unsigned char *)(v25 + 16) = *(unsigned char *)(v26 + 16);
  *(unsigned char *)(v25 + 17) = *(unsigned char *)(v26 + 17);
  uint64_t v27 = OUTLINED_FUNCTION_22();
  uint64_t v28 = OUTLINED_FUNCTION_55_0(v27);
  v21(v28);
  OUTLINED_FUNCTION_42_0();
  uint64_t v29 = *(int *)(v22 + 24);
  uint64_t v30 = *(void **)(v0 + v29);
  *(void *)(v0 + v29) = *(void *)(v1 + v29);

  uint64_t v31 = *(int *)(v22 + 28);
  uint64_t v32 = (void *)(v0 + v31);
  uint64_t v33 = (uint64_t *)(v1 + v31);
  uint64_t v35 = *v33;
  uint64_t v34 = v33[1];
  *uint64_t v32 = v35;
  v32[1] = v34;
  swift_release();
  OUTLINED_FUNCTION_106();
  if (!v36)
  {
    OUTLINED_FUNCTION_105();
    sub_1B5B7E758(v2, &qword_1EB841760);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
    uint64_t v37 = OUTLINED_FUNCTION_36_0();
    if (v37 == 1)
    {
      sub_1B5BC9340();
      OUTLINED_FUNCTION_1_0();
      uint64_t v39 = OUTLINED_FUNCTION_14_1();
      v40(v39);
      OUTLINED_FUNCTION_37_0();
    }
    else
    {
      OUTLINED_FUNCTION_89(v37, v38, *(void *)(qword_1EB841758 + 64));
    }
    OUTLINED_FUNCTION_105();
    sub_1B5B7E758(v2, &qword_1EB841750);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
    uint64_t v41 = OUTLINED_FUNCTION_36_0();
    if (v41 == 1)
    {
      sub_1B5BC96C0();
      OUTLINED_FUNCTION_1_0();
      uint64_t v43 = OUTLINED_FUNCTION_14_1();
      v44(v43);
      OUTLINED_FUNCTION_37_0();
    }
    else
    {
      OUTLINED_FUNCTION_89(v41, v42, *(void *)(qword_1EB841748 + 64));
    }
  }
  OUTLINED_FUNCTION_17_0();
  *(void *)(v46 + 8) = *(void *)(v45 + 8);
  swift_release();
  OUTLINED_FUNCTION_20();
}

uint64_t getEnumTagSinglePayload for SGBannerContainerView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B5B8A370);
}

uint64_t sub_1B5B8A370(unint64_t *a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF) {
    return OUTLINED_FUNCTION_73(*a1);
  }
  type metadata accessor for SGBannerViewModel(0);
  OUTLINED_FUNCTION_6_0();
  if (*(_DWORD *)(v8 + 84) == a2)
  {
    uint64_t v9 = v7;
    uint64_t v10 = a3[5];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94410);
    OUTLINED_FUNCTION_6_0();
    if (*(_DWORD *)(v12 + 84) == a2)
    {
      uint64_t v9 = v11;
      uint64_t v10 = a3[9];
    }
    else
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94408);
      uint64_t v10 = a3[10];
    }
  }
  return __swift_getEnumTagSinglePayload((uint64_t)a1 + v10, a2, v9);
}

uint64_t storeEnumTagSinglePayload for SGBannerContainerView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B5B8A458);
}

void sub_1B5B8A458()
{
  OUTLINED_FUNCTION_91();
  if (v4)
  {
    *uint64_t v1 = (v0 - 1);
  }
  else
  {
    uint64_t v5 = v3;
    int v6 = v2;
    type metadata accessor for SGBannerViewModel(0);
    OUTLINED_FUNCTION_6_0();
    if (*(_DWORD *)(v7 + 84) == v6)
    {
      uint64_t v8 = v5[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94410);
      OUTLINED_FUNCTION_6_0();
      if (*(_DWORD *)(v9 + 84) == v6)
      {
        uint64_t v8 = v5[9];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94408);
        uint64_t v8 = v5[10];
      }
    }
    uint64_t v10 = OUTLINED_FUNCTION_63_0(v8);
    __swift_storeEnumTagSinglePayload(v10, v11, v12, v13);
  }
}

void sub_1B5B8A520()
{
  type metadata accessor for SGBannerViewModel(319);
  if (v0 <= 0x3F)
  {
    sub_1B5B8A670(319, (unint64_t *)&qword_1EB841768, MEMORY[0x1E4F3C5D0]);
    if (v1 <= 0x3F)
    {
      sub_1B5B8A670(319, (unint64_t *)&qword_1EB841758, MEMORY[0x1E4F3D5D8]);
      if (v3 <= 0x3F)
      {
        OUTLINED_FUNCTION_9(v2);
        swift_initStructMetadata();
      }
    }
  }
}

void sub_1B5B8A670(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1B5BC9360();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void type metadata accessor for SGBannerContainerView_Previews()
{
}

unsigned char *sub_1B5B8A6D0(unsigned char *a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_6_0();
  if ((*(_DWORD *)(v5 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_59_0(*a2);
  }
  else
  {
    int v6 = v4;
    *a1 = *(unsigned char *)a2;
    OUTLINED_FUNCTION_105();
    sub_1B5BC9340();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_23_0();
    v7();
    uint64_t v8 = v6[6];
    uint64_t v9 = v6[7];
    uint64_t v10 = *(void **)((char *)a2 + v8);
    *(void *)&a1[v8] = v10;
    a1[v9] = *((unsigned char *)a2 + v9);
    uint64_t v11 = v6[9];
    *(void *)&a1[v6[8]] = *(uint64_t *)((char *)a2 + v6[8]);
    a1[v11] = *((unsigned char *)a2 + v11);
    id v12 = v10;
  }
  return a1;
}

void sub_1B5B8A794(uint64_t a1, uint64_t a2)
{
  sub_1B5BC9340();
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = OUTLINED_FUNCTION_29_0();
  v5(v4);
  int v6 = *(void **)(a1 + *(int *)(a2 + 24));
}

uint64_t sub_1B5B8A808(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_5_1(a1, a2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_23_0();
  v4();
  OUTLINED_FUNCTION_47_0();
  *(void *)(v3 + v5) = *(void *)(v2 + v5);
  *(unsigned char *)(v3 + v6) = *(unsigned char *)(v2 + v6);
  id v8 = v7;
  return v3;
}

uint64_t sub_1B5B8A87C(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_5_1(a1, a2);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v5, v6);
  uint64_t v8 = v2[6];
  uint64_t v9 = *(void **)(v3 + v8);
  uint64_t v10 = *(void **)(v4 + v8);
  *(void *)(v4 + v8) = v9;
  id v11 = v9;

  *(unsigned char *)(v4 + v2[7]) = *(unsigned char *)(v3 + v2[7]);
  *(void *)(v4 + v2[8]) = *(void *)(v3 + v2[8]);
  return OUTLINED_FUNCTION_93();
}

uint64_t sub_1B5B8A90C(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_5_1(a1, a2);
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = OUTLINED_FUNCTION_14_1();
  v5(v4);
  OUTLINED_FUNCTION_47_0();
  *(void *)(v3 + v6) = *(void *)(v2 + v6);
  *(unsigned char *)(v3 + v7) = *(unsigned char *)(v2 + v7);
  return v3;
}

uint64_t sub_1B5B8A974(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_5_1(a1, a2);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v5, v6);
  uint64_t v8 = v2[6];
  uint64_t v9 = *(void **)(v4 + v8);
  *(void *)(v4 + v8) = *(void *)(v3 + v8);

  uint64_t v10 = v2[8];
  *(unsigned char *)(v4 + v2[7]) = *(unsigned char *)(v3 + v2[7]);
  *(void *)(v4 + v10) = *(void *)(v3 + v10);
  return OUTLINED_FUNCTION_93();
}

uint64_t sub_1B5B8A9FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B5B8AA10);
}

uint64_t sub_1B5B8AA10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1B5BC9340();
  OUTLINED_FUNCTION_6_0();
  if (*(_DWORD *)(v7 + 84) != a2) {
    return OUTLINED_FUNCTION_73(*(void *)(a1 + *(int *)(a3 + 24)));
  }
  uint64_t v8 = v6;
  uint64_t v9 = a1 + *(int *)(a3 + 20);
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t sub_1B5B8AA98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B5B8AAAC);
}

void sub_1B5B8AAAC(uint64_t a1, int a2, int a3, uint64_t a4)
{
  sub_1B5BC9340();
  OUTLINED_FUNCTION_6_0();
  if (*(_DWORD *)(v8 + 84) == a3)
  {
    uint64_t v9 = OUTLINED_FUNCTION_63_0(*(int *)(a4 + 20));
    __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
}

uint64_t sub_1B5B8AB34()
{
  uint64_t result = sub_1B5BC9340();
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_9(result);
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for VisualEffectView()
{
}

uint64_t sub_1B5B8ABD8()
{
  return swift_getWitnessTable();
}

unint64_t sub_1B5B8ACD8()
{
  return sub_1B5B8B1AC((uint64_t)&unk_1EB840FE8);
}

unint64_t sub_1B5B8AD10()
{
  return sub_1B5B7E718((uint64_t)&unk_1E9D94418);
}

unint64_t sub_1B5B8AD4C()
{
  return sub_1B5B88964((uint64_t)&unk_1EB8410F0);
}

unint64_t sub_1B5B8AD9C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

void sub_1B5B8ADE0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_1B5B8AE2C()
{
  unint64_t result = qword_1E9D94428;
  if (!qword_1E9D94428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94428);
  }
  return result;
}

unint64_t sub_1B5B8AE78()
{
  unint64_t result = qword_1E9D94430;
  if (!qword_1E9D94430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94430);
  }
  return result;
}

uint64_t sub_1B5B8AEC4(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_38();
  v3();
  return a1;
}

unint64_t sub_1B5B8AF18(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    unint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1B5B8AF94()
{
  unint64_t result = qword_1EB840FD0;
  if (!qword_1EB840FD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840FD8);
    sub_1B5B7E718((uint64_t)&unk_1EB841180);
    sub_1B5B8AD9C((uint64_t)&unk_1EB840F50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840FD0);
  }
  return result;
}

unint64_t sub_1B5B8B064()
{
  unint64_t result = qword_1EB8410C0;
  if (!qword_1EB8410C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB8410C8);
    sub_1B5B8AF18((uint64_t)&unk_1EB841018);
    sub_1B5B8AF94();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB8410C0);
  }
  return result;
}

uint64_t sub_1B5B8B108()
{
  uint64_t v2 = OUTLINED_FUNCTION_70_0();
  OUTLINED_FUNCTION_9(v2);
  uint64_t v4 = (void **)(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
  return sub_1B5B85BE0(v4, v0);
}

uint64_t sub_1B5B8B150(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_24_1();
  v4();
  return a2;
}

unint64_t sub_1B5B8B1AC(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    sub_1B5B7E718(v5);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1B5B8B244()
{
  unint64_t result = qword_1EB841668;
  if (!qword_1EB841668)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB841670);
    sub_1B5B7E718((uint64_t)&unk_1EB841680);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB841668);
  }
  return result;
}

uint64_t sub_1B5B8B2DC()
{
  return sub_1B5B87608();
}

uint64_t sub_1B5B8B2E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_24_1();
  v4();
  return a2;
}

unint64_t sub_1B5B8B33C()
{
  unint64_t result = qword_1EB8415F0;
  if (!qword_1EB8415F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB8415F8);
    sub_1B5B8AF18((uint64_t)&unk_1EB8415B0);
    sub_1B5B8B244();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB8415F0);
  }
  return result;
}

void sub_1B5B8B3E0()
{
  type metadata accessor for SGBannerContainerView(0);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(v0 + 440))();
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_suggestionPrimaryAction);
    objc_msgSend(v2, sel_execute);

    swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_86();
    uint64_t v4 = (void *)(*(uint64_t (**)(void))(v3 + 704))();
    if (v4)
    {
      id v5 = v4;
      objc_msgSend(v4, sel_execute);
    }
    else
    {
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840E68);
      sub_1B5BC9D40();
      sub_1B5BC9D50();
      swift_release();
    }
  }
}

uint64_t sub_1B5B8B59C(uint64_t a1, uint64_t a2, void *a3, __int16 a4)
{
  if (HIBYTE(a4) != 255) {
    return (uint64_t)sub_1B5B8B5B4(a1, a2, a3);
  }
  return a1;
}

id sub_1B5B8B5B4(uint64_t a1, uint64_t a2, void *a3)
{
  swift_bridgeObjectRetain();
  return a3;
}

void sub_1B5B8B5F4(uint64_t a1, uint64_t a2, void *a3, __int16 a4)
{
  if (HIBYTE(a4) != 255) {
    sub_1B5B8B60C(a1, a2, a3);
  }
}

void sub_1B5B8B60C(uint64_t a1, uint64_t a2, void *a3)
{
  swift_bridgeObjectRelease();
}

unint64_t sub_1B5B8B64C()
{
  unint64_t result = qword_1EB840E40;
  if (!qword_1EB840E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840E40);
  }
  return result;
}

unint64_t sub_1B5B8B698()
{
  unint64_t result = qword_1EB840E48;
  if (!qword_1EB840E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840E48);
  }
  return result;
}

uint64_t sub_1B5B8B718()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_suggestionDelegate;
  swift_beginAccess();
  return MEMORY[0x1BA9A8120](v1);
}

uint64_t sub_1B5B8B7C4()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_1B5B8B820@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x80))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B8B87C(uint64_t a1, void **a2)
{
  id v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x88);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

void (*sub_1B5B8B8E0(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_suggestionDelegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  OUTLINED_FUNCTION_41();
  swift_beginAccess();
  v3[3] = MEMORY[0x1BA9A8120](v5);
  return sub_1B5B7FEBC;
}

id SGContactSuggestion.__allocating_init(sgContact:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SGContactSuggestion.init(sgContact:)(a1);
}

id SGContactSuggestion.init(sgContact:)(void *a1)
{
  uint64_t v3 = sub_1B5BC9230();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  uint64_t v7 = &v1[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_kStringKeyLabeledValueFormat];
  *(void *)uint64_t v7 = 0xD00000000000002BLL;
  *((void *)v7 + 1) = 0x80000001B5BCF400;
  *(void *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_contactViewController] = 0;
  *(void *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact] = a1;
  uint64_t v8 = v1;
  id v9 = a1;
  sub_1B5B729C0();
  swift_bridgeObjectRetain();
  sub_1B5BC9220();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v8[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_logger], v6, v3);
  id v10 = objc_msgSend(self, sel_currentDevice);
  id v11 = objc_msgSend(v10, sel_userInterfaceIdiom);

  v8[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_bannerForVisionDevice] = v11 == (id)6;
  uint64_t v12 = (objc_class *)type metadata accessor for SGContactSuggestion();
  v15.receiver = v8;
  v15.super_class = v12;
  id v13 = objc_msgSendSuper2(&v15, sel_init);

  return v13;
}

uint64_t sub_1B5B8BBA8()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact);
  if (!OUTLINED_FUNCTION_14_2())
  {
    if (!currentUIContext())
    {
      if (objc_msgSend(v1, sel_state) != 1)
      {
        id v48 = objc_msgSend(v1, sel_contact);
        sub_1B5BA795C(v48, (uint64_t)&v59);

        sub_1B5BA7CB8(v61);
        OUTLINED_FUNCTION_17_1();
        long long v63 = v59;
        uint64_t v49 = sub_1B5B8D840((uint64_t)&v63);
        OUTLINED_FUNCTION_4_2(v49, v50, v51, v52, v53, v54, v55, v56, v57, v59, *((uint64_t *)&v59 + 1), v60, v61, v62);
        return OUTLINED_FUNCTION_41();
      }
      OUTLINED_FUNCTION_5_2();
      sub_1B5B72B30();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
      uint64_t v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_1B5BCD260;
      uint64_t v18 = MEMORY[0x1E4FBB5C8];
      *(void *)(v17 + 56) = MEMORY[0x1E4FBB550];
      *(void *)(v17 + 64) = v18;
      *(void *)(v17 + 32) = 1;
      sub_1B5BC9F10();
      OUTLINED_FUNCTION_17_1();
      goto LABEL_17;
    }
    id v2 = objc_msgSend(v1, sel_contact);
    sub_1B5BA795C(v2, (uint64_t)&v59);

    unsigned int v3 = objc_msgSend(v1, sel_state);
    id v4 = objc_msgSend(v1, sel_contact);
    id v5 = objc_msgSend(v4, sel_name);

    if (v3 == 1)
    {
      if (v5)
      {
        OUTLINED_FUNCTION_12_2();
        sub_1B5B72B30();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
        uint64_t v6 = swift_allocObject();
        *(_OWORD *)(v6 + 16) = xmmword_1B5BCC700;
        long long v63 = v59;
        uint64_t v7 = MEMORY[0x1E4FBB1A0];
        *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
        unint64_t v8 = sub_1B5B8D86C();
        OUTLINED_FUNCTION_6_2(v8, v9, v10, v11, v12, v13, v14, v15, v57, v59);
        id v16 = objc_msgSend(v5, sel_fullName);
LABEL_16:
        id v27 = v16;
        uint64_t v28 = sub_1B5BC9F40();
        uint64_t v30 = v29;

        *(void *)(v6 + 96) = v7;
        *(void *)(v6 + 104) = v4;
        *(void *)(v6 + 72) = v28;
        *(void *)(v6 + 80) = v30;
        uint64_t v31 = sub_1B5B8D840((uint64_t)&v63);
        OUTLINED_FUNCTION_4_2(v31, v32, v33, v34, v35, v36, v37, v38, v58, v59, *((uint64_t *)&v59 + 1), v60, v61, v62);
        sub_1B5BC9F10();

LABEL_17:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return OUTLINED_FUNCTION_41();
      }
    }
    else if (v5)
    {
      OUTLINED_FUNCTION_5_2();
      sub_1B5B72B30();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_1B5BCC700;
      long long v63 = v59;
      uint64_t v7 = MEMORY[0x1E4FBB1A0];
      *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v19 = sub_1B5B8D86C();
      OUTLINED_FUNCTION_6_2(v19, v20, v21, v22, v23, v24, v25, v26, v57, v59);
      id v16 = objc_msgSend(v5, sel_fullName);
      goto LABEL_16;
    }
    long long v63 = v59;
    uint64_t v39 = sub_1B5B8D840((uint64_t)&v63);
    OUTLINED_FUNCTION_4_2(v39, v40, v41, v42, v43, v44, v45, v46, v57, v59, *((uint64_t *)&v59 + 1), v60, v61, v62);
    return OUTLINED_FUNCTION_41();
  }
  if (objc_msgSend(v1, sel_state) == 1) {
    goto LABEL_20;
  }
  if (OUTLINED_FUNCTION_14_2() == 2)
  {
    OUTLINED_FUNCTION_12_2();
LABEL_21:
    sub_1B5B72B30();
    OUTLINED_FUNCTION_17_1();
    return OUTLINED_FUNCTION_41();
  }
  if (OUTLINED_FUNCTION_14_2() == 1 || OUTLINED_FUNCTION_14_2() == 3)
  {
LABEL_20:
    OUTLINED_FUNCTION_5_2();
    goto LABEL_21;
  }
  return OUTLINED_FUNCTION_41();
}

id sub_1B5B8BFE0()
{
  sub_1B5B7447C(0, &qword_1E9D94468);
  id v1 = sub_1B5BA6CDC();
  uint64_t v3 = v2;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v0;
  id v5 = v0;
  return sub_1B5B8C07C((uint64_t)v1, v3, (uint64_t)sub_1B5B8D8F0, v4);
}

id sub_1B5B8C07C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  v10[4] = a3;
  v10[5] = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = sub_1B5B8C160;
  v10[3] = &block_descriptor_17;
  uint64_t v7 = _Block_copy(v10);
  id v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_actionWithTitle_handler_, v6, v7);

  _Block_release(v7);
  swift_release();
  return v8;
}

void sub_1B5B8C160(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_1B5B8C20C()
{
}

void sub_1B5B8C21C()
{
}

void sub_1B5B8C22C(const char *a1, char a2)
{
  uint64_t v6 = v2;
  uint64_t v7 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *(void *)v2) + 0x80))();
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = *(void **)&v2[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_contactViewController];
    if (v9)
    {
      id v13 = v9;
      uint64_t v10 = sub_1B5BC9210();
      os_log_type_t v11 = sub_1B5BCA070();
      if (OUTLINED_FUNCTION_7_2(v11))
      {
        uint64_t v12 = (uint8_t *)OUTLINED_FUNCTION_1_3();
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_1B5B6C000, v10, v3, a1, v12, 2u);
        OUTLINED_FUNCTION_0();
      }

      objc_msgSend(v6, sel_confirm_suggestion_completion_, a2 & 1, *(void *)&v6[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact], 0);
      objc_msgSend(v8, sel_suggestion_actionFinished_, v6, 1);
      objc_msgSend(v8, sel_dismissViewController_, v13);
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_1B5B8C3D8(void *a1)
{
  aBlock[6] = *(id *)MEMORY[0x1E4F143B8];
  os_log_type_t v3 = *(void **)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact);
  id v4 = objc_msgSend(v3, sel_cnContactIdentifier);
  if (!v4) {
    goto LABEL_7;
  }
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB8419C0);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1B5BCC240;
  *(void *)(v6 + 32) = objc_msgSend(self, sel_descriptorForRequiredKeys);
  sub_1B5BC9FF0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D944E0);
  uint64_t v7 = (void *)sub_1B5BC9FC0();
  swift_bridgeObjectRelease();
  aBlock[0] = 0;
  id v8 = objc_msgSend(a1, sel_unifiedContactWithIdentifier_keysToFetch_error_, v5, v7, aBlock);

  if (!v8)
  {
    id v11 = aBlock[0];
    uint64_t v12 = (void *)sub_1B5BC90F0();

    swift_willThrow();
LABEL_7:
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  id v9 = aBlock[0];
  objc_msgSend(v8, sel_mutableCopy);

  sub_1B5BCA0E0();
  swift_unknownObjectRelease();
  sub_1B5B7447C(0, &qword_1E9D944E8);
  if (swift_dynamicCast()) {
    uint64_t v10 = v50;
  }
  else {
    uint64_t v10 = 0;
  }
LABEL_8:
  if ((objc_msgSend(v3, sel_updatedFields) & 1) != 0 && v10)
  {
    id v13 = self;
    id v14 = v10;
    id v15 = objc_msgSend(v3, sel_contact);
    id v16 = objc_msgSend(v13, sel_contactFromSuggestedContact_, v15);

    id v17 = objc_msgSend(v16, sel_givenName);
    if (!v17)
    {
      sub_1B5BC9F40();
      id v17 = (id)sub_1B5BC9F00();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v14, sel_setGivenName_, v17);

    id v18 = v14;
    id v19 = objc_msgSend(v3, sel_contact);
    id v20 = objc_msgSend(v13, sel_contactFromSuggestedContact_, v19);

    id v21 = objc_msgSend(v20, sel_familyName);
    if (!v21)
    {
      sub_1B5BC9F40();
      id v21 = (id)sub_1B5BC9F00();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v18, sel_setFamilyName_, v21);
  }
  if ((objc_msgSend(v3, sel_updatedFields) & 2) != 0)
  {
    uint64_t v22 = sub_1B5B8DFB8(objc_msgSend(v3, sel_contact));
    if (v23)
    {
      uint64_t v24 = v23;
      if (v10)
      {
        uint64_t v25 = v22;
        objc_allocWithZone(MEMORY[0x1E4F1C9B8]);
        id v26 = v10;
        id v27 = sub_1B5B8D71C(v25, v24, 0);
        objc_msgSend(v26, sel_setImageData_, v27);
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1BAA8]), sel_init);
  uint64_t v29 = v28;
  if (v10) {
    objc_msgSend(v28, sel_updateContact_, v10);
  }
  uint64_t v30 = swift_allocObject();
  *(unsigned char *)(v30 + 16) = 1;
  aBlock[0] = 0;
  id v31 = objc_msgSend(a1, sel_executeSaveRequest_error_, v29, aBlock);
  if (v31)
  {
    id v32 = aBlock[0];
  }
  else
  {
    uint64_t v47 = v10;
    id v48 = v3;
    id v33 = aBlock[0];
    uint64_t v34 = (void *)sub_1B5BC90F0();

    swift_willThrow();
    id v35 = v34;
    id v36 = v34;
    uint64_t v37 = sub_1B5BC9210();
    os_log_type_t v38 = sub_1B5BCA070();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 138412290;
      id v41 = v34;
      uint64_t v42 = (void *)_swift_stdlib_bridgeErrorToNSError();
      aBlock[0] = v42;
      sub_1B5BCA0C0();
      *uint64_t v40 = v42;

      _os_log_impl(&dword_1B5B6C000, v37, v38, "SGContactSuggestion: error saving contact %@", v39, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94470);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {
    }
    uint64_t v10 = v47;
    os_log_type_t v3 = v48;
    *(unsigned char *)(v30 + 16) = 0;
  }
  uint64_t v43 = (void *)swift_allocObject();
  v43[2] = v49;
  v43[3] = v30;
  aBlock[4] = sub_1B5B8E078;
  aBlock[5] = v43;
  aBlock[0] = (id)MEMORY[0x1E4F143A8];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_1B5B8CB28;
  aBlock[3] = &block_descriptor_0;
  uint64_t v44 = _Block_copy(aBlock);
  id v45 = v49;
  swift_retain();
  swift_release();
  objc_msgSend(v45, sel_confirm_suggestion_completion_, v31, v3, v44);

  _Block_release(v44);
  return swift_release();
}

void sub_1B5B8CB28(uint64_t a1, void *a2)
{
  os_log_type_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id sub_1B5B8CB94()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact);
  id v2 = objc_msgSend(v1, sel_contact);
  if (!OUTLINED_FUNCTION_9_0()) {
    goto LABEL_11;
  }
  if (objc_msgSend(v1, sel_state) == 1 || OUTLINED_FUNCTION_9_0() == 2) {
    goto LABEL_4;
  }
  if (OUTLINED_FUNCTION_9_0() != 1)
  {
    if (OUTLINED_FUNCTION_9_0() == 3)
    {
      sub_1B5B72B30();

      return (id)OUTLINED_FUNCTION_41();
    }
LABEL_11:
    id v7 = objc_msgSend(v1, sel_contact);
    sub_1B5BA795C(v7, (uint64_t)&v8);

    long long v9 = v8;
    sub_1B5B8D840((uint64_t)&v9);
    return (id)OUTLINED_FUNCTION_41();
  }
  id v3 = objc_msgSend(v2, sel_name);

  if (!v3)
  {
LABEL_4:

    return (id)OUTLINED_FUNCTION_41();
  }
  id result = objc_msgSend(v2, sel_name);
  if (result)
  {
    id v5 = result;
    id v6 = objc_msgSend(result, sel_fullName);

    sub_1B5BC9F40();
    return (id)OUTLINED_FUNCTION_41();
  }
  __break(1u);
  return result;
}

id sub_1B5B8CDA4()
{
  sub_1B5B7447C(0, &qword_1E9D94468);
  id v1 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact], sel_contact);
  sub_1B5BA6660(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;

  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v0;
  id v7 = v0;
  return sub_1B5B8C07C(v3, v5, (uint64_t)sub_1B5B8E270, v6);
}

uint64_t sub_1B5B8CEAC()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_bannerForVisionDevice)) {
    return 4;
  }
  else {
    return 0;
  }
}

Class sub_1B5B8CEEC()
{
  sub_1B5B8DFB8(objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                                      + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact), sel_contact)));
  if (v1)
  {
    sub_1B5B7447C(0, &qword_1EB840B10);
    return (Class)sub_1B5B8CF88();
  }
  else
  {
    return SGContactSuggestion.contactImage()().super.isa;
  }
}

id sub_1B5B8CF88()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithContentsOfFile_, v1);

  return v2;
}

unint64_t sub_1B5B8D040()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_bannerForVisionDevice)) {
    return 0xD000000000000012;
  }
  else {
    return 0;
  }
}

uint64_t sub_1B5B8D08C()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_1B5B8D0CC()
{
  uint64_t v0 = *(void *)sub_1B5B729B4();
  swift_bridgeObjectRetain();
  return v0;
}

id sub_1B5B8D160()
{
  return sub_1B5B72B30();
}

id sub_1B5B8D194(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  uint64_t v5 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  return v5;
}

id sub_1B5B8D204(uint64_t a1)
{
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v2 = a1;
    }
    else {
      uint64_t v2 = a1 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    sub_1B5BCA170();
    OUTLINED_FUNCTION_10();
    if (v2) {
      return 0;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return 0;
  }
  return sub_1B5B72B30();
}

uint64_t sub_1B5B8D29C(unint64_t a1)
{
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B5BCD260;
  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_15();
    sub_1B5BCA170();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_8(MEMORY[0x1E4FBB550]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_41();
}

id sub_1B5B8D410(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D942B0);
  uint64_t v6 = sub_1B5BC9FE0();
  id v7 = a1;
  a4(v6);

  swift_bridgeObjectRelease();
  long long v8 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  return v8;
}

id sub_1B5B8D4EC(void *a1, uint64_t a2, void (*a3)(void))
{
  a3();
  if (v4)
  {
    sub_1B5BC9F00();
    OUTLINED_FUNCTION_10();
  }
  else
  {
    a1 = 0;
  }
  return a1;
}

id sub_1B5B8D540()
{
  id ContactSuggestion = getContactSuggestion(*(void **)(v0
                                                    + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact));
  return ContactSuggestion;
}

id SGContactSuggestion.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SGContactSuggestion.init()()
{
}

id SGContactSuggestion.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SGContactSuggestion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1B5B8D71C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithContentsOfFile_options_error_, v5, a3, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_1B5BC90F0();

    swift_willThrow();
  }
  return v6;
}

uint64_t type metadata accessor for SGContactSuggestion()
{
  uint64_t result = qword_1EB8422A8;
  if (!qword_1EB8422A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B5B8D840(uint64_t a1)
{
  return a1;
}

unint64_t sub_1B5B8D86C()
{
  unint64_t result = qword_1E9D94460;
  if (!qword_1E9D94460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94460);
  }
  return result;
}

uint64_t sub_1B5B8D8B8()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B5B8D8F0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  objc_super v2 = self;
  id v3 = objc_msgSend(v2, sel_retrieveContactStore);
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact);
  if (objc_msgSend(v4, sel_state) == 2 && objc_msgSend(v4, sel_updatedFields) == 3)
  {
    OUTLINED_FUNCTION_2_1();
    (*(void (**)(id))(v5 + 216))(v3);
  }
  sub_1B5B8DFB8(objc_msgSend(v4, sel_contact));
  if (v6)
  {
    OUTLINED_FUNCTION_17_1();
    id v7 = objc_msgSend(v4, sel_contact);
    id v8 = objc_msgSend(v2, sel_contactFromSuggestedContact_, v7);

    objc_msgSend(v8, sel_mutableCopy);
    sub_1B5BCA0E0();
    swift_unknownObjectRelease();
    sub_1B5B7447C(0, &qword_1E9D944E8);
    swift_dynamicCast();
    long long v9 = v40;
    id v10 = objc_allocWithZone(MEMORY[0x1E4F1C9B8]);
    uint64_t v11 = OUTLINED_FUNCTION_41();
    id v13 = sub_1B5B8D71C(v11, v12, 0);
    [v40 setImageData:v13];
  }
  else
  {
    id v13 = objc_msgSend(v4, sel_contact);
    long long v9 = objc_msgSend(v2, sel_contactFromSuggestedContact_, v13);
  }

  if (objc_msgSend(v4, sel_state) == 1)
  {
    if (!v9)
    {
      long long v9 = sub_1B5BC9210();
      os_log_type_t v32 = sub_1B5BCA070();
      if (os_log_type_enabled(v9, v32))
      {
        id v33 = (uint8_t *)OUTLINED_FUNCTION_1_3();
        *(_WORD *)id v33 = 0;
        _os_log_impl(&dword_1B5B6C000, v9, v32, "SGContactSuggestion: Contact is nil while initializing view controller for unknown contact", v33, 2u);
        OUTLINED_FUNCTION_0();
      }
      goto LABEL_29;
    }
    id v14 = objc_msgSend(self, sel_viewControllerForUnknownContact_, v9);
    id v15 = sub_1B5BC9210();
    os_log_type_t v16 = sub_1B5BCA070();
    if (OUTLINED_FUNCTION_7_2(v16))
    {
      id v17 = (uint8_t *)OUTLINED_FUNCTION_1_3();
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_1B5B6C000, v15, (os_log_type_t)v2, "SGContactSuggestion: Viewcontroller for presenting new contact suggestion initialized", v17, 2u);
      OUTLINED_FUNCTION_0();
    }
LABEL_18:

    if (v14)
    {
      id v27 = v14;
      objc_msgSend(v27, sel_setContactStore_, v3);
      objc_msgSend(v27, sel_setDelegate_, v1);
      objc_msgSend(v27, sel_setModalPresentationStyle_, -1);
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_10_1();
      uint64_t v29 = (void *)v28();
      if (v29)
      {
        objc_msgSend(v29, sel_presentViewController_, v27);

        swift_unknownObjectRelease();
LABEL_30:

        return;
      }
    }
LABEL_29:

    goto LABEL_30;
  }
  if (objc_msgSend(v4, sel_state) != 2)
  {
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_10_1();
    id v31 = (void *)v30();
    if (v31)
    {
      objc_msgSend(v31, sel_suggestion_actionFinished_, v1, 0);
      swift_unknownObjectRelease();
    }
    goto LABEL_29;
  }
  id v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1B980]), sel_init);
  id v19 = objc_msgSend(v4, sel_cnContactIdentifier);
  if (v19)
  {
    id v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB8419C0);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_1B5BCC240;
    *(void *)(v21 + 32) = objc_msgSend(self, sel_descriptorForRequiredKeys);
    sub_1B5BC9FF0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D944E0);
    uint64_t v22 = (void *)sub_1B5BC9FC0();
    swift_bridgeObjectRelease();
    v41[0] = 0;
    id v23 = objc_msgSend(v18, sel_unifiedContactWithIdentifier_keysToFetch_error_, v20, v22, v41);

    if (!v23)
    {
      id v34 = v41[0];
      id v35 = (void *)sub_1B5BC90F0();

      swift_willThrow();
      id v36 = sub_1B5BC9210();
      os_log_type_t v37 = sub_1B5BCA050();
      if (os_log_type_enabled(v36, v37))
      {
        *(_WORD *)OUTLINED_FUNCTION_1_3() = 0;
        OUTLINED_FUNCTION_13_0(&dword_1B5B6C000, v38, v39, "SGContactSuggestion: Encountered exception while fetching contact from contactStore");
        OUTLINED_FUNCTION_0();
      }

      goto LABEL_29;
    }
    if (v9)
    {
      id v24 = v41[0];
      id v14 = objc_msgSend(v2, sel_viewControllerForUpdatingContact_additionalContact_, v23, v9);
      id v15 = sub_1B5BC9210();
      os_log_type_t v25 = sub_1B5BCA070();
      if (OUTLINED_FUNCTION_7_2(v25))
      {
        id v26 = (uint8_t *)OUTLINED_FUNCTION_1_3();
        *(_WORD *)id v26 = 0;
        _os_log_impl(&dword_1B5B6C000, v15, (os_log_type_t)v2, "SGContactSuggestion: Viewcontroller for presenting contact suggestion update initialized", v26, 2u);
        OUTLINED_FUNCTION_0();
      }

      goto LABEL_18;
    }
  }
  else
  {

    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1B5B8DFB8(void *a1)
{
  id v2 = objc_msgSend(a1, sel_photoPath);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1B5BC9F40();

  return v3;
}

uint64_t sub_1B5B8E028()
{
  return MEMORY[0x1F4186498](v0, 17, 7);
}

uint64_t sub_1B5B8E038()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B5B8E078(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = (unsigned __int8 *)(*(void *)(v1 + 24) + 16);
  id v5 = a1;
  id v6 = a1;
  id v7 = sub_1B5BC9210();
  os_log_type_t v8 = sub_1B5BCA050();
  if (os_log_type_enabled(v7, v8))
  {
    long long v9 = (uint8_t *)swift_slowAlloc();
    id v10 = (void *)swift_slowAlloc();
    *(_DWORD *)long long v9 = 138412290;
    if (a1)
    {
      id v11 = a1;
      uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
      OUTLINED_FUNCTION_16_3();
    }
    else
    {
      OUTLINED_FUNCTION_16_3();
      uint64_t v12 = 0;
    }
    *id v10 = v12;

    _os_log_impl(&dword_1B5B6C000, v7, v8, "SGContactSuggestion: error confirming realcontact: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94470);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {
  }
  swift_beginAccess();
  *uint64_t v4 = 0;
  OUTLINED_FUNCTION_10_1();
  uint64_t result = v13();
  if (result)
  {
    id v15 = (void *)result;
    swift_beginAccess();
    objc_msgSend(v15, sel_suggestion_actionFinished_, v3, *v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

void *sub_1B5B8E270()
{
  uint64_t v1 = *(char **)(v0 + 16);
  id v2 = sub_1B5BC9210();
  os_log_type_t v3 = sub_1B5BCA070();
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)OUTLINED_FUNCTION_1_3() = 0;
    OUTLINED_FUNCTION_13_0(&dword_1B5B6C000, v4, v5, "SGContactSuggestion: Contact delegate for dismissing suggested contact");
    OUTLINED_FUNCTION_0();
  }

  objc_msgSend(v1, sel_confirm_suggestion_completion_, 0, *(void *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact], 0);
  OUTLINED_FUNCTION_10_1();
  uint64_t result = (void *)v6();
  if (result)
  {
    objc_msgSend(result, sel_suggestion_actionFinished_, v1, 1);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1B5B8E388()
{
  return type metadata accessor for SGContactSuggestion();
}

uint64_t sub_1B5B8E390()
{
  uint64_t result = sub_1B5BC9230();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SGContactSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SGContactSuggestion);
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of SGContactSuggestion.__allocating_init(sgContact:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionTitle()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionPrimaryAction()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionSubtitle()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionDismissAction()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionActionButtonType()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionImage()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionIconSFSymbol()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategory()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategoryId()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategoryImage()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategoryTitle()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategoryTitle(forItems:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategorySubtitle(forItems:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategoryLocalizedCount(ofItems:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategoryActionButtonType()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of SGContactSuggestion.suggestionCategoryIconSFSymbol()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of SGContactSuggestion.realtimeSuggestion()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x150))();
}

uint64_t type metadata accessor for IconView(uint64_t a1)
{
  return sub_1B5B7B630(a1, (uint64_t *)&unk_1EB8420E0);
}

void sub_1B5B8E920()
{
  OUTLINED_FUNCTION_44();
  uint64_t v54 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8416D0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_3();
  uint64_t v48 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8414E0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_3();
  uint64_t v53 = v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841518);
  uint64_t v14 = OUTLINED_FUNCTION_19_1(v13);
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_3();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB841548);
  uint64_t v16 = OUTLINED_FUNCTION_19_1(v15);
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_57_1();
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841420);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_12_0();
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841450);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_16_1();
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841480);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_32();
  uint64_t v22 = v20 - v21;
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_15_0();
  uint64_t v51 = v24;
  uint64_t v25 = type metadata accessor for IconView(0);
  id v26 = (char *)v0 + *(int *)(v25 + 20);
  id v27 = &v26[*(int *)(type metadata accessor for SGBannerViewModel(0) + 48)];
  if (v27[2] == 1)
  {
    *os_log_type_t v3 = sub_1B5BC9E80();
    v3[1] = v28;
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D946E0);
    sub_1B5B8EFA4(v0, (uint64_t)v3 + *(int *)(v29 + 44));
    sub_1B5BC99D0();
    sub_1B5BC9320();
    OUTLINED_FUNCTION_7();
    sub_1B5B9923C((uint64_t)v3, v2, (uint64_t *)&unk_1EB841548);
    OUTLINED_FUNCTION_146(v2 + *(int *)(v49 + 36));
    sub_1B5B7E758((uint64_t)v3, (uint64_t *)&unk_1EB841548);
    char v30 = sub_1B5BC99F0();
    sub_1B5BC9320();
    OUTLINED_FUNCTION_7();
    sub_1B5B9923C(v2, v1, &qword_1EB841420);
    uint64_t v31 = v1 + *(int *)(v50 + 36);
    *(unsigned char *)uint64_t v31 = v30;
    *(void *)(v31 + 8) = v4;
    *(void *)(v31 + 16) = v5;
    *(void *)(v31 + 24) = v6;
    *(void *)(v31 + 32) = v7;
    *(unsigned char *)(v31 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = 0;
    sub_1B5B7E758(v2, &qword_1EB841420);
    sub_1B5BC99C0();
    sub_1B5BC9320();
    OUTLINED_FUNCTION_7();
    os_log_type_t v32 = &qword_1EB841450;
    sub_1B5B9923C(v1, v22, &qword_1EB841450);
    OUTLINED_FUNCTION_75_1(v22 + *(int *)(v52 + 36));
    sub_1B5B7E758(v1, &qword_1EB841450);
    id v33 = &qword_1EB841480;
    sub_1B5B991E8(v22, v51, &qword_1EB841480);
    sub_1B5B9923C(v51, v53, &qword_1EB841480);
    swift_storeEnumTagMultiPayload();
    sub_1B5B8F4F8((uint64_t)&unk_1EB841478);
    sub_1B5B8F700();
    OUTLINED_FUNCTION_141();
    sub_1B5BC9830();
    uint64_t v34 = v51;
LABEL_5:
    sub_1B5B7E758(v34, v33);
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841510);
    OUTLINED_FUNCTION_66_0(v42);
    sub_1B5B991E8((uint64_t)v32, v54, &qword_1EB841518);
    OUTLINED_FUNCTION_24_0();
    return;
  }
  if (v27[1] == 1)
  {
    id v35 = v0;
    id v36 = (void *)*((void *)v27 + 5);
    os_log_type_t v37 = *v35;
    char v38 = *((unsigned char *)v35 + *(int *)(v25 + 24));
    uint64_t v39 = *((void *)v27 + 8);
    uint64_t v40 = *((void *)v27 + 9);
    swift_bridgeObjectRetain();
    id v41 = v36;
    sub_1B5B8F3EC(v36, v37, v38, v39, v40, (uint64_t)v55);
    sub_1B5BC9E80();
    OUTLINED_FUNCTION_95_0();
    OUTLINED_FUNCTION_147();
    sub_1B5BC99D0();
    sub_1B5BC9320();
    sub_1B5B72984();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8415D0);
    os_log_type_t v32 = (uint64_t *)MEMORY[0x1E4F3CAA8];
    sub_1B5B8F4F8((uint64_t)&unk_1EB8415C8);
    sub_1B5BC9B80();
    swift_bridgeObjectRelease();
    sub_1B5B991E8((uint64_t)v55, (uint64_t)v58, &qword_1E9D946D0);
    sub_1B5B8F5B0(v58);

    sub_1B5B991E8((uint64_t)&v56, (uint64_t)v57, &qword_1E9D946D8);
    sub_1B5B8D840((uint64_t)v57);
    id v33 = &qword_1EB8416D0;
    sub_1B5B9923C(v48, v53, &qword_1EB8416D0);
    swift_storeEnumTagMultiPayload();
    sub_1B5B8F4F8((uint64_t)&unk_1EB841478);
    sub_1B5B8F700();
    OUTLINED_FUNCTION_141();
    sub_1B5BC9830();
    uint64_t v34 = v48;
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841510);
  OUTLINED_FUNCTION_24_0();
  __swift_storeEnumTagSinglePayload(v43, v44, v45, v46);
}

uint64_t sub_1B5B8EFA4@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v56 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94910);
  uint64_t v4 = OUTLINED_FUNCTION_19_1(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_4_1();
  uint64_t v55 = v5;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_15_0();
  uint64_t v53 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94918);
  uint64_t v9 = OUTLINED_FUNCTION_19_1(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_4_1();
  uint64_t v54 = v10;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)&v50 - v12;
  uint64_t v14 = type metadata accessor for IconView(0);
  uint64_t v15 = (char *)a1 + *(int *)(v14 + 20);
  uint64_t v16 = &v15[*(int *)(type metadata accessor for SGBannerViewModel(0) + 48)];
  uint64_t v17 = (void *)*((void *)v16 + 5);
  uint64_t v18 = *a1;
  unsigned __int8 v19 = *((unsigned char *)a1 + *(int *)(v14 + 24));
  int v52 = v19;
  uint64_t v20 = *((void *)v16 + 8);
  uint64_t v21 = *((void *)v16 + 9);
  swift_bridgeObjectRetain();
  id v22 = v17;
  id v23 = v18;
  sub_1B5B8F3EC(v17, v23, v19, v20, v21, (uint64_t)v65);
  uint64_t v24 = v65[0];
  uint64_t v25 = v65[1];
  id v26 = v66;
  char v27 = v67;
  uint64_t v51 = v68;
  uint64_t v28 = v68[0];
  uint64_t v29 = v68[1];
  sub_1B5BC9E80();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_143();
  uint64_t v57 = v24;
  uint64_t v58 = v25;
  id v59 = v26;
  char v60 = v27;
  uint64_t v61 = v28;
  uint64_t v62 = v29;
  OUTLINED_FUNCTION_140(v68[2]);
  long long v63 = v69;
  sub_1B5B72990();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841588);
  sub_1B5B8F4C8();
  sub_1B5BC9B80();
  swift_bridgeObjectRelease();
  sub_1B5B991E8((uint64_t)v65, (uint64_t)v78, &qword_1E9D946D0);
  sub_1B5B8F5B0(v78);

  sub_1B5B991E8((uint64_t)v51, (uint64_t)v77, &qword_1E9D946D8);
  sub_1B5B8D840((uint64_t)v77);
  char v30 = (void *)*((void *)v16 + 4);
  uint64_t v31 = *((void *)v16 + 6);
  uint64_t v32 = *((void *)v16 + 7);
  swift_bridgeObjectRetain();
  id v33 = v23;
  id v34 = v30;
  id v35 = (void *)OUTLINED_FUNCTION_41();
  sub_1B5B8F3EC(v35, v36, v52, v31, v32, v37);
  uint64_t v38 = v70[0];
  uint64_t v39 = v70[1];
  id v40 = v71;
  LOBYTE(v32) = v72;
  uint64_t v41 = v73[0];
  uint64_t v42 = v73[1];
  sub_1B5BC9E80();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_143();
  uint64_t v57 = v38;
  uint64_t v58 = v39;
  id v59 = v40;
  char v60 = v32;
  uint64_t v61 = v41;
  uint64_t v62 = v42;
  OUTLINED_FUNCTION_140(v73[2]);
  long long v43 = *((_OWORD *)v16 + 1);
  long long v63 = v74;
  long long v64 = v43;
  sub_1B5B7299C();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94920);
  sub_1B5B8F4F8((uint64_t)&unk_1E9D94928);
  uint64_t v44 = v53;
  OUTLINED_FUNCTION_88();
  sub_1B5BC9B80();
  swift_bridgeObjectRelease();
  sub_1B5B991E8((uint64_t)v70, (uint64_t)&v76, &qword_1E9D946D0);
  sub_1B5B8F5B0(&v76);

  sub_1B5B991E8((uint64_t)v73, (uint64_t)v75, &qword_1E9D946D8);
  sub_1B5B8D840((uint64_t)v75);
  uint64_t v45 = v54;
  sub_1B5B9923C((uint64_t)v13, v54, &qword_1E9D94918);
  uint64_t v46 = v55;
  sub_1B5B9923C(v44, v55, &qword_1E9D94910);
  uint64_t v47 = v56;
  sub_1B5B9923C(v45, v56, &qword_1E9D94918);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94930);
  sub_1B5B9923C(v46, v47 + *(int *)(v48 + 48), &qword_1E9D94910);
  sub_1B5B7E758(v44, &qword_1E9D94910);
  sub_1B5B7E758((uint64_t)v13, &qword_1E9D94918);
  sub_1B5B7E758(v46, &qword_1E9D94910);
  return sub_1B5B7E758(v45, &qword_1E9D94918);
}

void sub_1B5B8F3EC(void *a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = self;
  swift_bridgeObjectRetain();
  id v13 = a1;
  id v14 = a2;
  id v15 = objc_msgSend(v12, sel_mainScreen);
  objc_msgSend(v15, sel_scale);
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();

  *(void *)a6 = a1;
  *(void *)(a6 + 8) = v17;
  *(void *)(a6 + 16) = v14;
  *(unsigned char *)(a6 + 24) = a3;
  *(void *)(a6 + 32) = a4;
  *(void *)(a6 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = a5;
}

unint64_t sub_1B5B8F4C8()
{
  return sub_1B5B8F4F8((uint64_t)&unk_1EB841580);
}

unint64_t sub_1B5B8F4F8(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    OUTLINED_FUNCTION_57(0, v4);
    v2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1B5B8F564()
{
  unint64_t result = qword_1EB841568;
  if (!qword_1EB841568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB841568);
  }
  return result;
}

id *sub_1B5B8F5B0(id *a1)
{
  return a1;
}

unint64_t sub_1B5B8F5DC()
{
  unint64_t result = qword_1EB841448;
  if (!qword_1EB841448)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB841450);
    sub_1B5B8F678((uint64_t)&unk_1EB841418);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB841448);
  }
  return result;
}

unint64_t sub_1B5B8F678(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    OUTLINED_FUNCTION_57(0, v3);
    uint64_t v4 = OUTLINED_FUNCTION_97_0();
    sub_1B5B7E718(v4);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1B5B8F700()
{
  unint64_t result = qword_1EB8416C8;
  if (!qword_1EB8416C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB8416D0);
    sub_1B5B8F4F8((uint64_t)&unk_1EB8415C8);
    sub_1B5B8F7A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB8416C8);
  }
  return result;
}

unint64_t sub_1B5B8F7A8()
{
  unint64_t result = qword_1EB841168;
  if (!qword_1EB841168)
  {
    sub_1B5BC9980();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB841168);
  }
  return result;
}

uint64_t sub_1B5B8F7F8@<X0>(uint64_t a1@<X0>, char a2@<W2>, void *a3@<X8>)
{
  return sub_1B5B908CC(a1, a2, type metadata accessor for IconView, a3);
}

uint64_t type metadata accessor for BannerIconSGView(uint64_t a1)
{
  return sub_1B5B7B630(a1, qword_1EB842050);
}

void sub_1B5B8F834()
{
  OUTLINED_FUNCTION_44();
  uint64_t v78 = v4;
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D946E8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_37((uint64_t)v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D946F0);
  OUTLINED_FUNCTION_0_1();
  v67[1] = v7;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_37((uint64_t)v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D946F8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_37(v11);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94700);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_37(v13);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94708);
  uint64_t v15 = OUTLINED_FUNCTION_19_1(v14);
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_37((uint64_t)v67 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94710);
  uint64_t v18 = OUTLINED_FUNCTION_19_1(v17);
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_16_1();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94718);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_57_1();
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94720);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_59();
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94728);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_32();
  uint64_t v25 = v23 - v24;
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_15_0();
  uint64_t v72 = v27;
  uint64_t v28 = type metadata accessor for BannerIconSGView(0);
  uint64_t v29 = v1 + *(int *)(v28 + 20);
  uint64_t v30 = v29 + *(int *)(type metadata accessor for SGBannerViewModel(0) + 48);
  if (*(unsigned char *)(v30 + 2) == 1)
  {
    *uint64_t v2 = sub_1B5BC9E80();
    v2[1] = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94788);
    sub_1B5B90238();
    sub_1B5BC99D0();
    sub_1B5BC9320();
    OUTLINED_FUNCTION_7();
    sub_1B5B9923C((uint64_t)v2, v3, &qword_1E9D94710);
    OUTLINED_FUNCTION_146(v3 + *(int *)(v19 + 36));
    sub_1B5B7E758((uint64_t)v2, &qword_1E9D94710);
    sub_1B5BC99F0();
    sub_1B5BC9320();
    OUTLINED_FUNCTION_7();
    sub_1B5B9923C(v3, v0, &qword_1E9D94718);
    OUTLINED_FUNCTION_65_1(v0 + *(int *)(v71 + 36));
    sub_1B5B7E758(v3, &qword_1E9D94718);
    sub_1B5BC99C0();
    sub_1B5BC9320();
    OUTLINED_FUNCTION_7();
    sub_1B5B9923C(v0, v25, &qword_1E9D94720);
    OUTLINED_FUNCTION_65_1(v25 + *(int *)(v73 + 36));
    sub_1B5B7E758(v0, &qword_1E9D94720);
    uint64_t v32 = v25;
    uint64_t v33 = v72;
    sub_1B5B991E8(v32, v72, &qword_1E9D94728);
    sub_1B5B9923C(v33, v75, &qword_1E9D94728);
    swift_storeEnumTagMultiPayload();
    sub_1B5B8F4F8((uint64_t)&unk_1E9D94738);
    sub_1B5B900B8();
    OUTLINED_FUNCTION_155();
    sub_1B5BC9830();
    sub_1B5B7E758(v33, &qword_1E9D94728);
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94730);
    OUTLINED_FUNCTION_66_0(v34);
    id v35 = &qword_1E9D94720;
LABEL_11:
    sub_1B5B991E8((uint64_t)v35, v78, &qword_1E9D94708);
    OUTLINED_FUNCTION_24_0();
    return;
  }
  uint64_t v71 = v28;
  uint64_t v72 = v1;
  if (*(unsigned char *)(v30 + 1) == 1)
  {
    id v36 = *(void **)(v30 + 80);
    if (v36)
    {
      id v37 = v36;
      sub_1B5BC9E80();
      OUTLINED_FUNCTION_95_0();
      OUTLINED_FUNCTION_147();
      uint64_t v38 = v92;
      char v39 = v93;
      uint64_t v40 = v94;
      char v41 = v95;
      uint64_t v43 = v96;
      uint64_t v42 = v97;
      char v44 = sub_1B5BC99D0();
      sub_1B5BC9320();
      id v79 = v37;
      uint64_t v80 = v38;
      char v81 = v39;
      uint64_t v82 = v40;
      char v83 = v41;
      uint64_t v84 = v43;
      uint64_t v85 = v42;
      char v86 = v44;
      uint64_t v87 = v45;
      uint64_t v88 = v46;
      uint64_t v89 = v47;
      uint64_t v90 = v48;
      char v91 = 0;
      sub_1B5B72984();
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94770);
      sub_1B5B8F4F8((uint64_t)&unk_1E9D94768);
      uint64_t v49 = v67[2];
      sub_1B5BC9B80();
      swift_bridgeObjectRelease();
      LOBYTE(v38) = *(unsigned char *)(v72 + *(int *)(v71 + 24));
      OUTLINED_FUNCTION_2_0();
      uint64_t v51 = (*(uint64_t (**)(void))(v50 + 536))();
      sub_1B5B90160();
      OUTLINED_FUNCTION_155();
      sub_1B5BAB238(v38, v51, v68, v52);

      sub_1B5B7E758(v49, &qword_1E9D946E8);
      uint64_t v53 = v70;
      uint64_t v54 = OUTLINED_FUNCTION_144();
      uint64_t v55 = v69;
      v56(v54);
      uint64_t v57 = 0;
    }
    else
    {
      uint64_t v57 = 1;
      uint64_t v53 = v70;
      uint64_t v55 = v69;
    }
    __swift_storeEnumTagSinglePayload(v53, v57, 1, v55);
    sub_1B5B9923C(v53, v75, &qword_1E9D946F8);
    swift_storeEnumTagMultiPayload();
    sub_1B5B8F4F8((uint64_t)&unk_1E9D94738);
    sub_1B5B900B8();
    uint64_t v63 = v76;
    sub_1B5BC9830();
    sub_1B5B7E758(v53, &qword_1E9D946F8);
    uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94730);
    OUTLINED_FUNCTION_70_1(v63, v65, v66, v64);
    id v35 = (uint64_t *)v63;
    goto LABEL_11;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94730);
  OUTLINED_FUNCTION_24_0();
  __swift_storeEnumTagSinglePayload(v58, v59, v60, v61);
}

unint64_t sub_1B5B9001C()
{
  unint64_t result = qword_1E9D94740;
  if (!qword_1E9D94740)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94720);
    sub_1B5B8F678((uint64_t)&unk_1E9D94748);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94740);
  }
  return result;
}

unint64_t sub_1B5B900B8()
{
  unint64_t result = qword_1E9D94758;
  if (!qword_1E9D94758)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D946F8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D946E8);
    sub_1B5B90160();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94758);
  }
  return result;
}

unint64_t sub_1B5B90160()
{
  unint64_t result = qword_1E9D94760;
  if (!qword_1E9D94760)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D946E8);
    sub_1B5B8F4F8((uint64_t)&unk_1E9D94768);
    sub_1B5B8F7A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94760);
  }
  return result;
}

unint64_t sub_1B5B90208()
{
  return sub_1B5B8F4F8((uint64_t)&unk_1E9D94778);
}

void sub_1B5B90238()
{
  OUTLINED_FUNCTION_18();
  uint64_t v2 = v1;
  uint64_t v66 = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D948B8);
  uint64_t v5 = OUTLINED_FUNCTION_19_1(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_65();
  uint64_t v8 = v7 - v6;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D948C0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_37(v10);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D948C8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_4_1();
  uint64_t v62 = v15;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_37(v17);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D948D0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_27();
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D948D8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v64 = v20;
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_4_1();
  uint64_t v63 = v22;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_15_0();
  uint64_t v67 = v24;
  uint64_t v25 = type metadata accessor for BannerIconSGView(0);
  uint64_t v26 = v2 + *(int *)(v25 + 20);
  uint64_t v27 = v26 + *(int *)(type metadata accessor for SGBannerViewModel(0) + 48);
  uint64_t v28 = *(void **)(v27 + 80);
  if (v28 && (uint64_t v29 = *(void **)(v27 + 88)) != 0)
  {
    id v58 = v28;
    id v54 = v29;
    sub_1B5BC9E80();
    OUTLINED_FUNCTION_95_0();
    OUTLINED_FUNCTION_145();
    uint64_t v57 = v8;
    uint64_t v30 = *(void *)sub_1B5B72990();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94780);
    uint64_t v56 = v11;
    sub_1B5B90208();
    OUTLINED_FUNCTION_88();
    sub_1B5BC9B80();
    swift_bridgeObjectRelease();
    char v31 = *(unsigned char *)(v2 + *(int *)(v25 + 24));
    OUTLINED_FUNCTION_59_1();
    uint64_t v33 = (*(uint64_t (**)(void))(v32 + 536))();
    sub_1B5B990C4();
    OUTLINED_FUNCTION_155();
    sub_1B5BAB238(v31, v33, v18, v34);
    sub_1B5B7E758(v0, &qword_1E9D948D0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 32))(v67, v30, v65);
    id v35 = v54;
    sub_1B5BC9E80();
    OUTLINED_FUNCTION_95_0();
    OUTLINED_FUNCTION_145();
    uint64_t v55 = v35;
    uint64_t v36 = *((void *)sub_1B5B7299C() + 1);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D948F0);
    sub_1B5B8F4F8((uint64_t)&unk_1E9D948F8);
    sub_1B5BC9B80();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_59_1();
    uint64_t v38 = (*(uint64_t (**)(void))(v37 + 536))();
    unint64_t v39 = sub_1B5B99140();
    sub_1B5BAB238(v31, v38, v60, v39);
    sub_1B5B7E758(v59, &qword_1E9D948C0);
    OUTLINED_FUNCTION_155();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v61, v62, v56);
    char v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 16);
    v41(v63, v67, v65);
    uint64_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16);
    v42(v62, v61, v56);
    v41(v57, v63, v65);
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94908);
    v42(v57 + *(int *)(v43 + 48), v62, v56);

    char v44 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v44(v61, v56);
    uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
    v45(v67, v65);
    v44(v62, v56);
    v45(v63, v65);
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D948E0);
    OUTLINED_FUNCTION_70_1(v57, v47, v48, v46);
    sub_1B5B991E8(v57, v66, &qword_1E9D948B8);
    OUTLINED_FUNCTION_17();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D948E0);
    OUTLINED_FUNCTION_17();
    __swift_storeEnumTagSinglePayload(v49, v50, v51, v52);
  }
}

uint64_t sub_1B5B908B4@<X0>(uint64_t a1@<X0>, char a2@<W2>, void *a3@<X8>)
{
  return sub_1B5B908CC(a1, a2, type metadata accessor for BannerIconSGView, a3);
}

uint64_t sub_1B5B908CC@<X0>(uint64_t a1@<X0>, char a2@<W2>, uint64_t (*a3)(void)@<X3>, void *a4@<X8>)
{
  *a4 = a1;
  uint64_t v6 = a3(0);
  uint64_t result = sub_1B5B948A0();
  *((unsigned char *)a4 + *(int *)(v6 + 24)) = a2;
  return result;
}

uint64_t sub_1B5B90940()
{
  OUTLINED_FUNCTION_139();
  uint64_t v0 = OUTLINED_FUNCTION_72_0();
  return MEMORY[0x1F40F9EF0](v0);
}

uint64_t sub_1B5B90984()
{
  OUTLINED_FUNCTION_139();
  uint64_t v0 = OUTLINED_FUNCTION_72_0();
  return MEMORY[0x1F40F9E78](v0);
}

void sub_1B5B909C8()
{
}

uint64_t type metadata accessor for TitleView(uint64_t a1)
{
  return sub_1B5B7B630(a1, (uint64_t *)&unk_1EB8420F0);
}

void sub_1B5B90A10()
{
  OUTLINED_FUNCTION_44();
  uint64_t v3 = v1;
  uint64_t v51 = v1;
  uint64_t v65 = v4;
  uint64_t v5 = sub_1B5BC9080();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_65();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8415A8);
  uint64_t v13 = OUTLINED_FUNCTION_19_1(v12);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_37((uint64_t)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8415E0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_12_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841538);
  OUTLINED_FUNCTION_0_1();
  uint64_t v60 = v17;
  uint64_t v61 = v16;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_103_0(v18, v50);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841410) - 8;
  MEMORY[0x1F4188790](v56);
  OUTLINED_FUNCTION_59();
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841440) - 8;
  MEMORY[0x1F4188790](v58);
  OUTLINED_FUNCTION_104_0(v19, v50);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841470) - 8;
  MEMORY[0x1F4188790](v57);
  OUTLINED_FUNCTION_3();
  uint64_t v55 = v20;
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841490) - 8;
  MEMORY[0x1F4188790](v62);
  OUTLINED_FUNCTION_3();
  uint64_t v59 = v21;
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8414A0) - 8;
  MEMORY[0x1F4188790](v64);
  OUTLINED_FUNCTION_101_0(v22, v50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v11, v3, v5);
  uint64_t v23 = sub_1B5BC9B20();
  uint64_t v25 = v24;
  uint64_t v66 = v23;
  uint64_t v67 = v24;
  LOBYTE(v5) = v26 & 1;
  char v68 = v26 & 1;
  uint64_t v69 = v27;
  sub_1B5B72954();
  swift_bridgeObjectRetain();
  uint64_t v28 = v52;
  sub_1B5BC9B80();
  swift_bridgeObjectRelease();
  sub_1B5B7B664(v23, v25, v5);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v30 = OUTLINED_FUNCTION_144();
  sub_1B5B9923C(v30, v31, &qword_1EB8415A8);
  uint64_t v32 = v53;
  uint64_t v33 = v2 + *(int *)(v53 + 36);
  *(void *)uint64_t v33 = KeyPath;
  *(void *)(v33 + 8) = 3;
  *(unsigned char *)(v33 + 16) = 0;
  sub_1B5B7E758(v28, &qword_1EB8415A8);
  type metadata accessor for TitleView(0);
  OUTLINED_FUNCTION_2_0();
  uint64_t v35 = (*(uint64_t (**)(void))(v34 + 536))();
  unint64_t v36 = sub_1B5B9413C();
  sub_1B5BAB194(v35, v32, v36);
  sub_1B5B7E758(v2, &qword_1EB8415E0);
  uint64_t v37 = swift_getKeyPath();
  OUTLINED_FUNCTION_80();
  v38();
  uint64_t v39 = v0 + *(int *)(v56 + 44);
  *(void *)uint64_t v39 = v37;
  *(unsigned char *)(v39 + 8) = 1;
  OUTLINED_FUNCTION_38();
  v40();
  LODWORD(v37) = sub_1B5BC98A0();
  uint64_t v41 = v54;
  sub_1B5B9923C(v0, v54, &qword_1EB841410);
  *(_DWORD *)(v41 + *(int *)(v58 + 44)) = v37;
  sub_1B5B7E758(v0, &qword_1EB841410);
  uint64_t v42 = sub_1B5BC96E0();
  uint64_t v43 = v55;
  sub_1B5B9923C(v41, v55, &qword_1EB841440);
  char v44 = (uint64_t *)(v43 + *(int *)(v57 + 44));
  *char v44 = v42;
  v44[1] = (uint64_t)sub_1B5B90FEC;
  v44[2] = 0;
  sub_1B5B7E758(v41, &qword_1EB841440);
  sub_1B5BC99B0();
  type metadata accessor for SGBannerViewModel(0);
  sub_1B5BC9320();
  uint64_t v45 = OUTLINED_FUNCTION_121();
  uint64_t v46 = v59;
  sub_1B5B9923C(v45, v59, &qword_1EB841470);
  OUTLINED_FUNCTION_85_0(v46 + *(int *)(v62 + 44));
  sub_1B5B7E758(v43, &qword_1EB841470);
  sub_1B5BC99D0();
  sub_1B5BC9320();
  OUTLINED_FUNCTION_7();
  uint64_t v47 = v63;
  sub_1B5B9923C(v46, v63, &qword_1EB841490);
  OUTLINED_FUNCTION_85_0(v47 + *(int *)(v64 + 44));
  sub_1B5B7E758(v46, &qword_1EB841490);
  sub_1B5BC99F0();
  sub_1B5BC9320();
  OUTLINED_FUNCTION_7();
  uint64_t v48 = v65;
  sub_1B5B9923C(v47, v65, &qword_1EB8414A0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8414B0);
  OUTLINED_FUNCTION_85_0(v48 + *(int *)(v49 + 36));
  sub_1B5B7E758(v47, &qword_1EB8414A0);
  OUTLINED_FUNCTION_24_0();
}

uint64_t sub_1B5B90FEC()
{
  uint64_t v0 = sub_1B5BC96E0();
  return MEMORY[0x1BA9A6A50](v0);
}

uint64_t sub_1B5B91014@<X0>(uint64_t a1@<X1>, char a2@<W3>, uint64_t a3@<X8>)
{
  sub_1B5BC9080();
  OUTLINED_FUNCTION_1_0();
  uint64_t v6 = OUTLINED_FUNCTION_144();
  v7(v6);
  uint64_t v8 = type metadata accessor for TitleView(0);
  *(void *)(a3 + *(int *)(v8 + 20)) = a1;
  uint64_t result = sub_1B5B948A0();
  *(unsigned char *)(a3 + *(int *)(v8 + 28)) = a2;
  return result;
}

uint64_t sub_1B5B910C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  id v8 = objc_msgSend(self, sel_currentDevice);
  id v9 = objc_msgSend(v8, sel_userInterfaceIdiom);

  if (v9 == (id)6 && (a6 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94BA0);
    sub_1B5B7E718((uint64_t)&unk_1E9D94790);
    uint64_t v10 = sub_1B5BC9EE0();
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D93D88);
    a1 = swift_allocObject();
    *(_OWORD *)(a1 + 16) = xmmword_1B5BCD260;
    *(void *)(a1 + 32) = v10;
    *(void *)(a1 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v12;
  }
  return a1;
}

uint64_t sub_1B5B9121C(uint64_t a1, int a2, void *a3, char a4)
{
  swift_getKeyPath();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(unsigned char *)(v8 + 24) = a2 & 1;
  *(unsigned char *)(v8 + 25) = BYTE1(a2) & 1;
  *(unsigned char *)(v8 + 26) = BYTE2(a2) & 1;
  *(void *)(v8 + 32) = a3;
  *(unsigned char *)(v8 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = a4;
  swift_bridgeObjectRetain_n();
  id v9 = a3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94BA0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94798);
  sub_1B5B7E718((uint64_t)&unk_1E9D947A0);
  sub_1B5B94324();
  return sub_1B5BC9E30();
}

void sub_1B5B9135C()
{
  OUTLINED_FUNCTION_18();
  uint64_t v48 = v0;
  uint64_t v2 = v1;
  uint64_t v51 = v3;
  BOOL v50 = (v4 & 0x100) == 0;
  unsigned int v44 = HIWORD(v4) & 1;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D947D8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_65();
  uint64_t v8 = v7 - v6;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D947D0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v49 = v9;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_37((uint64_t)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D948B0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v45 = v12;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_37(v14);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D947C8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_104_0(v16, v41[0]);
  uint64_t v17 = *v2;
  unint64_t v18 = v2[1];
  uint64_t v57 = v17;
  unint64_t v58 = v18;
  sub_1B5B744B8();
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_1B5BC9B30();
  uint64_t v21 = v20;
  uint64_t v52 = v19;
  unint64_t v53 = v20;
  char v23 = v22 & 1;
  LOBYTE(v54) = v22 & 1;
  uint64_t v55 = v24;
  sub_1B5B8734C();
  sub_1B5B7B664(v19, v21, v23);
  swift_bridgeObjectRelease();
  uint64_t v25 = v57;
  uint64_t v26 = v58;
  char v27 = v59;
  uint64_t v52 = v57;
  unint64_t v53 = v58;
  uint64_t v54 = v59;
  uint64_t v55 = v60;
  char v56 = v61;
  sub_1B5B72960();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D947F0);
  sub_1B5B945CC();
  sub_1B5BC9B80();
  swift_bridgeObjectRelease();
  sub_1B5B99088(v25, v26, v27);
  unint64_t v28 = sub_1B5B94550();
  uint64_t v29 = v42;
  sub_1B5BAB2A8(v44);
  sub_1B5B7E758(v8, &qword_1E9D947D8);
  OUTLINED_FUNCTION_2_0();
  uint64_t v31 = (*(uint64_t (**)(void))(v30 + 536))();
  uint64_t v57 = v29;
  unint64_t v58 = v28;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v33 = v41[1];
  sub_1B5BAB1C8(v31, v46, OpaqueTypeConformance2);
  OUTLINED_FUNCTION_38();
  v34();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v36 = v45;
  uint64_t v37 = v41[2];
  uint64_t v38 = v47;
  OUTLINED_FUNCTION_80();
  v39();
  uint64_t v40 = v37 + *(int *)(v43 + 36);
  *(void *)uint64_t v40 = KeyPath;
  *(unsigned char *)(v40 + 8) = 1;
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v33, v38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D947B8);
  sub_1B5B94440();
  sub_1B5B943A0();
  sub_1B5B8734C();
  sub_1B5B7E758(v37, &qword_1E9D947C8);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1B5B9177C()
{
  uint64_t v0 = sub_1B5BC9AE0();
  return OUTLINED_FUNCTION_137(v0, v1, v2, v3);
}

uint64_t sub_1B5B917C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v3 = OUTLINED_FUNCTION_43();
  sub_1B5B9923C(v3, v4, v5);
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D947B8);
  uint64_t v7 = (uint64_t *)(a1 + *(int *)(result + 36));
  uint64_t *v7 = KeyPath;
  v7[1] = 0x4000000000000000;
  return result;
}

uint64_t sub_1B5B91828()
{
  if (*(unsigned char *)(v0 + 9)) {
    int v1 = 256;
  }
  else {
    int v1 = 0;
  }
  int v2 = v1 | *(unsigned __int8 *)(v0 + 8);
  if (*(unsigned char *)(v0 + 10)) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  return sub_1B5B9121C(*(void *)v0, v2 | v3, *(void **)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_1B5B91864(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  id v7 = a3;
  return sub_1B5BC9D70();
}

uint64_t sub_1B5B91924()
{
  return sub_1B5B91864(*(void *)v0, *(void *)(v0 + 8), *(void **)(v0 + 16));
}

uint64_t sub_1B5B91930@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1B5BC95E0();
  *a1 = result;
  return result;
}

uint64_t sub_1B5B9195C()
{
  return sub_1B5BC95F0();
}

uint64_t sub_1B5B91988@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B5BC9630();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5B9923C(v2, (uint64_t)v10, &qword_1EB841750);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_1B5BC96C0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_1B5BCA060();
    uint64_t v14 = sub_1B5BC9990();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v18 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_1B5B7AAF8(0xD000000000000013, 0x80000001B5BCF3E0, &v18);
      _os_log_impl(&dword_1B5B6C000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9A8090](v16, -1, -1);
      MEMORY[0x1BA9A8090](v15, -1, -1);
    }

    sub_1B5BC9620();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1B5B91C14(uint64_t a1, char a2)
{
  uint64_t v4 = sub_1B5BC9630();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v8 = sub_1B5BCA060();
    uint64_t v9 = sub_1B5BC9990();
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v14 = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      *(void *)(v10 + 4) = sub_1B5B7AAF8(0x6C616E6F6974704FLL, 0xEE003E746E6F463CLL, &v14);
      _os_log_impl(&dword_1B5B6C000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9A8090](v11, -1, -1);
      MEMORY[0x1BA9A8090](v10, -1, -1);
    }

    sub_1B5BC9620();
    swift_getAtKeyPath();
    j__swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

void sub_1B5B91DFC()
{
  OUTLINED_FUNCTION_21_0();
  v21[0] = v0;
  uint64_t v20 = v1;
  uint64_t v3 = v2;
  char v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  *(void *)(v14 + 24) = 0;
  uint64_t v16 = (int *)type metadata accessor for PrimaryActionButtonView(0);
  uint64_t v17 = v15 + v16[11];
  *(void *)uint64_t v17 = swift_getKeyPath();
  *(unsigned char *)(v17 + 8) = 0;
  uint64_t v18 = (uint64_t *)(v15 + v16[12]);
  *uint64_t v18 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
  swift_storeEnumTagMultiPayload();
  *(void *)uint64_t v15 = v13;
  *(void *)(v15 + 8) = v11;
  *(void *)(v15 + 16) = v9;

  *(void *)(v15 + 24) = v7;
  *(unsigned char *)(v15 + 32) = v5;
  sub_1B5B948A0();
  *(void *)(v15 + v16[9]) = 0;
  uint64_t v19 = v15 + v16[10];
  *(void *)uint64_t v19 = v3;
  *(void *)(v19 + 8) = v20;
  *(unsigned char *)(v19 + 16) = v21[0];
  OUTLINED_FUNCTION_20();
}

double sub_1B5B91F0C(uint64_t a1)
{
  sub_1B5BC96C0();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_79();
  v4();
  LOBYTE(asub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = sub_1B5B83844(a1, v1);
  uint64_t v5 = OUTLINED_FUNCTION_97_0();
  v6(v5);
  double result = 0.0;
  if (a1) {
    return *(double *)sub_1B5B726B0();
  }
  return result;
}

void sub_1B5B91FD0()
{
  OUTLINED_FUNCTION_44();
  uint64_t v93 = v1;
  sub_1B5BC96C0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v91 = v3;
  uint64_t v92 = v2;
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_102_0(v4, v65[0]);
  uint64_t v87 = sub_1B5BC9350();
  OUTLINED_FUNCTION_0_1();
  uint64_t v86 = v5;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v84 = v7;
  uint64_t v8 = type metadata accessor for PrimaryActionButtonView(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v94 = v8 - 8;
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840C40);
  OUTLINED_FUNCTION_0_1();
  uint64_t v68 = v11;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_27();
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840B68);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_37(v14);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840C20);
  OUTLINED_FUNCTION_0_1();
  uint64_t v72 = v15;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_37(v17);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840B48);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_37(v19);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840B88);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_37((uint64_t)v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840BE8);
  uint64_t v23 = OUTLINED_FUNCTION_19_1(v22);
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_37((uint64_t)v65 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840B28) - 8;
  MEMORY[0x1F4188790](v81);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_37(v25);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840B78) - 8;
  MEMORY[0x1F4188790](v85);
  OUTLINED_FUNCTION_37((uint64_t)v65 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840BA8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v27);
  OUTLINED_FUNCTION_103_0(v28, v65[0]);
  sub_1B5B94850();
  uint64_t v29 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v30 = (v29 + 16) & ~v29;
  uint64_t v79 = v30 + v10;
  uint64_t v78 = v29 | 7;
  swift_allocObject();
  uint64_t v80 = v30;
  sub_1B5B948A0();
  uint64_t v95 = v0;
  v65[0] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840C28);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840C60);
  unint64_t v32 = sub_1B5B7DA24();
  uint64_t v99 = v31;
  unint64_t v100 = v32;
  swift_getOpaqueTypeConformance2();
  sub_1B5BC9D70();
  uint64_t v76 = (char *)v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = type metadata accessor for PrimaryActionButtonView;
  sub_1B5B94850();
  uint64_t v33 = swift_allocObject();
  sub_1B5B948A0();
  uint64_t v34 = sub_1B5BC9E80();
  uint64_t v36 = v35;
  uint64_t v37 = v65[1];
  OUTLINED_FUNCTION_80();
  v38();
  uint64_t v39 = (void *)(v37 + *(int *)(v66 + 36));
  *uint64_t v39 = sub_1B5B92C10;
  v39[1] = 0;
  v39[2] = sub_1B5B94C90;
  v39[3] = v33;
  v39[4] = v34;
  v39[5] = v36;
  OUTLINED_FUNCTION_38();
  v40();
  uint64_t v41 = v65[0];
  uint64_t v42 = *(unsigned __int8 *)(v65[0] + *(int *)(v94 + 40) + 6);
  sub_1B5B94CFC();
  sub_1B5BAB278(v42);
  sub_1B5B7E758(v37, &qword_1EB840B68);
  OUTLINED_FUNCTION_79();
  v43();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v45 = v67;
  uint64_t v46 = (uint64_t *)(v67 + *(int *)(v69 + 36));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840CC0);
  OUTLINED_FUNCTION_80();
  v47();
  *uint64_t v46 = KeyPath;
  OUTLINED_FUNCTION_80();
  v48();
  OUTLINED_FUNCTION_38();
  v49();
  OUTLINED_FUNCTION_38();
  v50();
  sub_1B5B72978();
  sub_1B5B94E14();
  swift_bridgeObjectRetain();
  uint64_t v51 = v71;
  OUTLINED_FUNCTION_41();
  sub_1B5BC9B80();
  swift_bridgeObjectRelease();
  sub_1B5B7E758(v45, &qword_1EB840B48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840BB8);
  sub_1B5B94EE8();
  sub_1B5B94F64();
  uint64_t v52 = v73;
  sub_1B5B8734C();
  sub_1B5B7E758(v51, &qword_1EB840B88);
  sub_1B5BC99F0();
  type metadata accessor for SGBannerViewModel(0);
  sub_1B5BC9320();
  uint64_t v53 = OUTLINED_FUNCTION_121();
  uint64_t v54 = v77;
  sub_1B5B9923C(v53, v77, &qword_1EB840BE8);
  OUTLINED_FUNCTION_75_1(v54 + *(int *)(v81 + 44));
  sub_1B5B7E758(v52, &qword_1EB840BE8);
  sub_1B5BC99D0();
  sub_1B5BC9320();
  OUTLINED_FUNCTION_7();
  uint64_t v55 = v82;
  sub_1B5B9923C(v54, v82, &qword_1EB840B28);
  OUTLINED_FUNCTION_75_1(v55 + *(int *)(v85 + 44));
  uint64_t v56 = OUTLINED_FUNCTION_144();
  sub_1B5B7E758(v56, v57);
  sub_1B5BC99C0();
  uint64_t v58 = v94;
  uint64_t v59 = v90;
  sub_1B5B91988(v90);
  sub_1B5B91F0C(v59);
  OUTLINED_FUNCTION_38();
  v60();
  sub_1B5BC9320();
  OUTLINED_FUNCTION_7();
  uint64_t v61 = v88;
  sub_1B5B9923C(v55, v88, &qword_1EB840B78);
  OUTLINED_FUNCTION_65_1(v61 + *(int *)(v89 + 36));
  sub_1B5B7E758(v55, &qword_1EB840B78);
  uint64_t v62 = v41 + *(int *)(v58 + 48);
  uint64_t v63 = *(void *)v62;
  uint64_t v64 = *(void *)(v62 + 8);
  LOBYTE(v62) = *(unsigned char *)(v62 + 16);
  uint64_t v96 = v63;
  uint64_t v97 = v64;
  char v98 = v62;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB840CF0);
  sub_1B5BC9DF0();
  sub_1B5B94850();
  swift_allocObject();
  sub_1B5B948A0();
  sub_1B5B8F4F8((uint64_t)&unk_1EB840BA0);
  sub_1B5B95180();
  sub_1B5BC9BE0();
  swift_release();
  swift_release();
  swift_release();
  sub_1B5B7E758(v61, &qword_1EB840BA8);
  OUTLINED_FUNCTION_24_0();
}

void sub_1B5B929F8()
{
  OUTLINED_FUNCTION_18();
  uint64_t v1 = v0;
  uint64_t v25 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840C28);
  OUTLINED_FUNCTION_0_1();
  uint64_t v23 = v4;
  uint64_t v24 = v3;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_101_0(v5, v21);
  sub_1B5B744B8();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1B5BC9B30();
  uint64_t v8 = v7;
  char v10 = v9;
  uint64_t v11 = v1 + *(int *)(type metadata accessor for PrimaryActionButtonView(0) + 44);
  uint64_t v12 = *(void *)v11;
  char v13 = *(unsigned char *)(v11 + 8);
  j__swift_retain();
  uint64_t v14 = sub_1B5B91C14(v12, v13);
  j__swift_release();
  if (!v14) {
    sub_1B5BC9A00();
  }
  sub_1B5BC9A30();
  sub_1B5BC9A50();
  swift_release();
  uint64_t v15 = sub_1B5BC9B10();
  uint64_t v17 = v16;
  char v19 = v18 & 1;
  sub_1B5B7B664(v6, v8, v10 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  uint64_t v20 = *(unsigned __int8 *)(v1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840C60);
  sub_1B5B7DA24();
  sub_1B5BAB1FC(v20);
  sub_1B5B7B664(v15, v17, v19);
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v25, v22, v24);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1B5B92C14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D948A8);
  uint64_t v4 = OUTLINED_FUNCTION_19_1(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_12_0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v6 = sub_1B5BC9E60();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v6);
  uint64_t v7 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB840BB8) + 36));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840CD0);
  sub_1B5B9923C(v1, (uint64_t)v7 + *(int *)(v8 + 28), &qword_1E9D948A8);
  uint64_t *v7 = KeyPath;
  uint64_t v9 = OUTLINED_FUNCTION_97_0();
  sub_1B5B9923C(v9, v10, v11);
  return sub_1B5B7E758(v1, &qword_1E9D948A8);
}

uint64_t sub_1B5B92D04()
{
  return sub_1B5BC95C0();
}

uint64_t sub_1B5B92D28(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D948A8);
  MEMORY[0x1F4188790](v2 - 8);
  sub_1B5B9923C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1E9D948A8);
  return sub_1B5BC95D0();
}

uint64_t sub_1B5B92DC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W3>, void *a4@<X8>)
{
  *a4 = a1;
  a4[1] = a2;
  uint64_t v6 = type metadata accessor for CloseButtonView(0);
  uint64_t result = sub_1B5B948A0();
  *((unsigned char *)a4 + *(int *)(v6 + 28)) = a3;
  return result;
}

void sub_1B5B92E2C()
{
  OUTLINED_FUNCTION_18();
  uint64_t v55 = v0;
  uint64_t v70 = v4;
  sub_1B5BC9680();
  OUTLINED_FUNCTION_0_1();
  uint64_t v68 = v6;
  uint64_t v69 = v5;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_3();
  uint64_t v67 = v7;
  type metadata accessor for CloseButtonView(0);
  OUTLINED_FUNCTION_45_0();
  uint64_t v65 = v8;
  uint64_t v64 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v10);
  uint64_t v61 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840E60);
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_12_0();
  uint64_t v13 = sub_1B5BC9D10();
  OUTLINED_FUNCTION_0_1();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_16();
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840FC8);
  uint64_t v18 = v17 - 8;
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_16_1();
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841010);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_65();
  uint64_t v22 = v21 - v20;
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840C30);
  OUTLINED_FUNCTION_0_1();
  uint64_t v60 = v23;
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_102_0(v25, v54);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840B58);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_3();
  uint64_t v57 = v27;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840B98);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v28);
  OUTLINED_FUNCTION_4_1();
  uint64_t v58 = v29;
  OUTLINED_FUNCTION_11();
  MEMORY[0x1F4188790](v30);
  OUTLINED_FUNCTION_15_0();
  uint64_t v63 = v31;
  swift_bridgeObjectRetain();
  uint64_t v32 = sub_1B5BC9CE0();
  OUTLINED_FUNCTION_79();
  v33();
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_80();
  v35();
  *uint64_t v2 = KeyPath;
  sub_1B5B9923C((uint64_t)v2, (uint64_t)v1 + *(int *)(v18 + 44), &qword_1EB840E60);
  *uint64_t v1 = v32;
  swift_retain();
  uint64_t v36 = OUTLINED_FUNCTION_88();
  sub_1B5B7E758(v36, v37);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v3, v13);
  swift_release();
  LODWORD(v32) = sub_1B5BC98B0();
  sub_1B5B9923C((uint64_t)v1, v22, &qword_1EB840FC8);
  *(_DWORD *)(v22 + *(int *)(v56 + 36)) = v32;
  sub_1B5B7E758((uint64_t)v1, &qword_1EB840FC8);
  sub_1B5B94850();
  swift_allocObject();
  sub_1B5B948A0();
  sub_1B5B95320((uint64_t)&unk_1EB841008);
  sub_1B5BC9B70();
  swift_release();
  sub_1B5B7E758(v22, &qword_1EB841010);
  sub_1B5B94850();
  uint64_t v38 = swift_allocObject();
  sub_1B5B948A0();
  uint64_t v39 = sub_1B5BC9E80();
  uint64_t v41 = v40;
  uint64_t v42 = v57;
  OUTLINED_FUNCTION_80();
  v43();
  unsigned int v44 = (void *)(v42 + *(int *)(v59 + 36));
  *unsigned int v44 = sub_1B5B92C10;
  v44[1] = 0;
  v44[2] = sub_1B5B955F8;
  v44[3] = v38;
  v44[4] = v39;
  v44[5] = v41;
  OUTLINED_FUNCTION_38();
  v45();
  sub_1B5BC9670();
  sub_1B5B95660();
  uint64_t v46 = v58;
  sub_1B5BC9BC0();
  OUTLINED_FUNCTION_38();
  v47();
  sub_1B5B7E758(v42, &qword_1EB840B58);
  sub_1B5B7296C();
  swift_bridgeObjectRetain();
  uint64_t v48 = v63;
  sub_1B5BC9450();
  swift_bridgeObjectRelease();
  sub_1B5B7E758(v46, &qword_1EB840B98);
  id v71 = sub_1B5B72B30();
  uint64_t v72 = v49;
  sub_1B5B744B8();
  uint64_t v50 = sub_1B5BC9B30();
  uint64_t v52 = v51;
  LOBYTE(v42) = v53 & 1;
  sub_1B5BC9460();
  sub_1B5B7B664(v50, v52, v42);
  swift_bridgeObjectRelease();
  sub_1B5B7E758(v48, &qword_1EB840B98);
  OUTLINED_FUNCTION_17();
}

void sub_1B5B9349C()
{
  OUTLINED_FUNCTION_152();
  uint64_t v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x1B8))();
  if (v2)
  {
    if (objc_msgSend(v2, sel_respondsToSelector_, sel_suggestionDismissAction))
    {
      id v3 = objc_msgSend((id)swift_unknownObjectRetain(), sel_suggestionDismissAction);
      if (v3)
      {
        id v10 = v3;
        objc_msgSend(v3, sel_execute);
        swift_unknownObjectRelease_n();
LABEL_9:

        return;
      }
      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_51();
  uint64_t v5 = (void *)(*(uint64_t (**)(void))(v4 + 728))();
  if (v5)
  {
    id v10 = v5;
    objc_msgSend(v5, sel_execute);
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_51();
  if ((*(uint64_t (**)(void))(v6 + 680))())
  {
    OUTLINED_FUNCTION_51();
    uint64_t v8 = (void *)(*(uint64_t (**)(void))(v7 + 464))();
    if (v8)
    {
      uint64_t v9 = v8;
      if (objc_msgSend(v8, sel_respondsToSelector_, sel_suggestionBatchDismissal)
        && (objc_msgSend(v9, sel_respondsToSelector_, sel_suggestionBatchDismissal) & 1) != 0)
      {
        objc_msgSend(v9, sel_suggestionBatchDismissal);
      }
      swift_unknownObjectRelease();
    }
  }
  else
  {
    objc_msgSend(v0, sel_dismissAllSuggestions);
  }
}

uint64_t sub_1B5B936D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1B5BC9C60();
  uint64_t result = sub_1B5BC93D0();
  *a1 = v2;
  a1[1] = v4;
  return result;
}

void sub_1B5B93718()
{
  OUTLINED_FUNCTION_18();
  uint64_t v69 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94808);
  OUTLINED_FUNCTION_0_1();
  uint64_t v62 = v5;
  uint64_t v63 = v6;
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_3();
  uint64_t v64 = v7;
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94810);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_32();
  uint64_t v11 = v9 - v10;
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v59 - v13;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94818);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_12_0();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94820);
  uint64_t v17 = OUTLINED_FUNCTION_19_1(v16);
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_3();
  uint64_t v67 = v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94828);
  uint64_t v20 = OUTLINED_FUNCTION_19_1(v19);
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_16();
  sub_1B5BC9CF0();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_57_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94830);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_16_1();
  if (*(void *)(v0 + 40))
  {
    uint64_t v65 = v23;
    swift_bridgeObjectRetain();
    sub_1B5BC9CE0();
    OUTLINED_FUNCTION_79();
    v24();
    OUTLINED_FUNCTION_120();
    sub_1B5BC9D20();
    swift_release();
    uint64_t v25 = OUTLINED_FUNCTION_115();
    v26(v25);
    sub_1B5BC96F0();
    uint64_t v27 = sub_1B5BC9700();
    OUTLINED_FUNCTION_70_1(v3, v28, v29, v27);
    uint64_t v30 = sub_1B5BC9D00();
    swift_release();
    sub_1B5B7E758(v3, &qword_1E9D94828);
    uint64_t v31 = sub_1B5BC9C70();
    uint64_t v32 = sub_1B5BC9C40();
    uint64_t v70 = v30;
    uint64_t v71 = v31;
    uint64_t v72 = v32;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94850);
    sub_1B5B957DC();
    sub_1B5BC9BB0();
    swift_release();
    swift_release();
    swift_release();
    sub_1B5B9923C(v1, v2, &qword_1E9D94830);
    swift_storeEnumTagMultiPayload();
    sub_1B5B95760();
    sub_1B5B9587C();
    uint64_t v33 = v67;
    sub_1B5BC9830();
    sub_1B5B7E758(v1, &qword_1E9D94830);
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94838);
    OUTLINED_FUNCTION_70_1(v33, v35, v36, v34);
    uint64_t v37 = v33;
LABEL_5:
    sub_1B5B991E8(v37, v69, &qword_1E9D94820);
    OUTLINED_FUNCTION_17();
    return;
  }
  uint64_t v60 = v11;
  uint64_t v61 = v14;
  uint64_t v38 = *(void **)v0;
  if (*(void *)v0)
  {
    uint64_t v65 = v23;
    id v39 = v38;
    sub_1B5BC9CD0();
    OUTLINED_FUNCTION_79();
    v40();
    OUTLINED_FUNCTION_120();
    uint64_t v41 = sub_1B5BC9D20();
    swift_release();
    uint64_t v42 = OUTLINED_FUNCTION_115();
    v43(v42);
    uint64_t v70 = v41;
    char v44 = *(unsigned char *)(v0 + 24);
    OUTLINED_FUNCTION_2_0();
    uint64_t v46 = (*(uint64_t (**)(void))(v45 + 536))();
    uint64_t v47 = MEMORY[0x1E4F3EC98];
    uint64_t v48 = MEMORY[0x1E4F3EC88];
    sub_1B5BAB238(v44, v46, MEMORY[0x1E4F3EC98], MEMORY[0x1E4F3EC88]);
    swift_release();
    uint64_t v70 = v47;
    uint64_t v71 = v48;
    swift_getOpaqueTypeConformance2();
    uint64_t v49 = v60;
    sub_1B5BC9BB0();
    OUTLINED_FUNCTION_38();
    v50();
    uint64_t v51 = (uint64_t)v61;
    sub_1B5B991E8(v49, (uint64_t)v61, &qword_1E9D94810);
    sub_1B5B9923C(v51, v2, &qword_1E9D94810);
    swift_storeEnumTagMultiPayload();
    sub_1B5B95760();
    sub_1B5B9587C();
    uint64_t v52 = v67;
    sub_1B5BC9830();

    sub_1B5B7E758(v51, &qword_1E9D94810);
    uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94838);
    OUTLINED_FUNCTION_66_0(v53);
    uint64_t v37 = v52;
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94838);
  OUTLINED_FUNCTION_17();
  __swift_storeEnumTagSinglePayload(v54, v55, v56, v57);
}

uint64_t sub_1B5B93CBC(uint64_t a1)
{
  return sub_1B5B93D30(a1, (SEL *)&selRef_systemBackgroundColor, &qword_1EB843108);
}

uint64_t *sub_1B5B93CD0()
{
  if (qword_1EB841CD0 != -1) {
    swift_once();
  }
  return &qword_1EB843108;
}

uint64_t sub_1B5B93D1C(uint64_t a1)
{
  return sub_1B5B93D30(a1, (SEL *)&selRef_secondarySystemBackgroundColor, &qword_1EB8430F0);
}

uint64_t sub_1B5B93D30(uint64_t a1, SEL *a2, uint64_t *a3)
{
  id v4 = [self *a2];
  uint64_t result = MEMORY[0x1BA9A7260](v4);
  *a3 = result;
  return result;
}

uint64_t *sub_1B5B93D78()
{
  if (qword_1EB841AA8 != -1) {
    swift_once();
  }
  return &qword_1EB8430F0;
}

uint64_t sub_1B5B93DC4(uint64_t a1)
{
  return sub_1B5B93EBC(a1, MEMORY[0x1E4F3E050], &qword_1EB8430F8);
}

uint64_t *sub_1B5B93DE4()
{
  if (qword_1EB841B30 != -1) {
    swift_once();
  }
  return &qword_1EB8430F8;
}

uint64_t sub_1B5B93E30(uint64_t a1)
{
  return sub_1B5B93FE4(a1, MEMORY[0x1E4F3E050], &qword_1EB843100);
}

uint64_t *sub_1B5B93E50()
{
  if (qword_1EB841F88 != -1) {
    swift_once();
  }
  return &qword_1EB843100;
}

uint64_t sub_1B5B93E9C(uint64_t a1)
{
  return sub_1B5B93EBC(a1, MEMORY[0x1E4F3E120], &qword_1E9D96720);
}

uint64_t sub_1B5B93EBC(uint64_t a1, void (*a2)(void), uint64_t *a3)
{
  sub_1B5BC9A60();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_100_0();
  a2();
  OUTLINED_FUNCTION_79();
  v6();
  sub_1B5BC9A70();
  swift_release();
  uint64_t v7 = OUTLINED_FUNCTION_122();
  v8(v7);
  uint64_t v9 = sub_1B5BC9A20();
  uint64_t result = swift_release();
  *a3 = v9;
  return result;
}

uint64_t *sub_1B5B93F98()
{
  if (qword_1EB8422A0 != -1) {
    swift_once();
  }
  return &qword_1E9D96720;
}

uint64_t sub_1B5B93FE4(uint64_t a1, void (*a2)(void), uint64_t *a3)
{
  sub_1B5BC9A60();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_100_0();
  a2();
  OUTLINED_FUNCTION_79();
  v6();
  uint64_t v7 = sub_1B5BC9A70();
  swift_release();
  uint64_t v8 = OUTLINED_FUNCTION_122();
  uint64_t result = v9(v8);
  *a3 = v7;
  return result;
}

uint64_t sub_1B5B940AC()
{
  sub_1B5BC9A80();
  sub_1B5BC9A40();
  uint64_t v0 = sub_1B5BC9A50();
  uint64_t result = swift_release();
  qword_1E9D96728 = v0;
  return result;
}

uint64_t *sub_1B5B940F0()
{
  if (qword_1EB8422C0 != -1) {
    swift_once();
  }
  return &qword_1E9D96728;
}

unint64_t sub_1B5B9413C()
{
  unint64_t result = qword_1EB8415D8;
  if (!qword_1EB8415D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB8415E0);
    sub_1B5B941DC();
    sub_1B5B7E718((uint64_t)&unk_1EB841650);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB8415D8);
  }
  return result;
}

unint64_t sub_1B5B941DC()
{
  unint64_t result = qword_1EB8415A0;
  if (!qword_1EB8415A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB8415A8);
    sub_1B5B8F7A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB8415A0);
  }
  return result;
}

uint64_t sub_1B5B94258@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1B5BC95A0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1B5B94288()
{
  return sub_1B5BC95B0();
}

uint64_t sub_1B5B942B0()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 41, 7);
}

void sub_1B5B942F0()
{
}

unint64_t sub_1B5B94324()
{
  unint64_t result = qword_1E9D947A8;
  if (!qword_1E9D947A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94798);
    sub_1B5B943A0();
    sub_1B5B94440();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D947A8);
  }
  return result;
}

unint64_t sub_1B5B943A0()
{
  unint64_t result = qword_1E9D947B0;
  if (!qword_1E9D947B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D947B8);
    sub_1B5B94440();
    sub_1B5B7E718((uint64_t)&unk_1E9D947F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D947B0);
  }
  return result;
}

unint64_t sub_1B5B94440()
{
  unint64_t result = qword_1E9D947C0;
  if (!qword_1E9D947C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D947C8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D947D0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D947D8);
    sub_1B5B94550();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_1B5B7E718((uint64_t)&unk_1EB841638);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D947C0);
  }
  return result;
}

unint64_t sub_1B5B94550()
{
  unint64_t result = qword_1E9D947E0;
  if (!qword_1E9D947E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D947D8);
    sub_1B5B945CC();
    sub_1B5B8F7A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D947E0);
  }
  return result;
}

unint64_t sub_1B5B945CC()
{
  unint64_t result = qword_1E9D947E8;
  if (!qword_1E9D947E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D947F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D947E8);
  }
  return result;
}

uint64_t sub_1B5B94638()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_1B5B94678()
{
  OUTLINED_FUNCTION_7_0();
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(v0 + 440))();
  if (v1)
  {
    id v3 = objc_msgSend(v1, sel_suggestionPrimaryAction);
    swift_unknownObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_7_0();
    id v3 = (id)(*(uint64_t (**)(void))(v2 + 704))();
  }
  objc_msgSend(v3, sel_execute);
}

uint64_t sub_1B5B94754@<X0>(uint64_t a1@<X8>)
{
  sub_1B5B744B8();
  swift_bridgeObjectRetain();
  sub_1B5BC9B30();
  char v3 = v2 & 1;
  sub_1B5BC9A80();
  uint64_t v4 = sub_1B5BC9B10();
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  swift_release();
  uint64_t v11 = OUTLINED_FUNCTION_41();
  sub_1B5B7B664(v11, v12, v3);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v8 & 1;
  *(void *)(a1 + 24) = v10;
  return result;
}

uint64_t type metadata accessor for PrimaryActionButtonView(uint64_t a1)
{
  return sub_1B5B7B630(a1, qword_1EB842550);
}

uint64_t sub_1B5B94850()
{
  uint64_t v1 = OUTLINED_FUNCTION_154();
  v2(v1);
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = OUTLINED_FUNCTION_49_1();
  v4(v3);
  return v0;
}

uint64_t sub_1B5B948A0()
{
  uint64_t v1 = OUTLINED_FUNCTION_154();
  v2(v1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_60_1();
  v3();
  return v0;
}

void sub_1B5B948EC()
{
  type metadata accessor for PrimaryActionButtonView(0);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(v0 + 440))();
  if (v1)
  {
    id v4 = objc_msgSend(v1, sel_suggestionPrimaryAction);
    swift_unknownObjectRelease();
    objc_msgSend(v4, sel_execute);
  }
  else
  {
    OUTLINED_FUNCTION_51();
    uint64_t v3 = (void *)(*(uint64_t (**)(void))(v2 + 704))();
    if (!v3)
    {
      swift_retain();
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB840CF0);
      MEMORY[0x1BA9A7400](&v5);
      sub_1B5BC9DE0();
      swift_release();
      swift_release();
      return;
    }
    id v4 = v3;
    objc_msgSend(v3, sel_execute);
  }
}

void sub_1B5B94A8C()
{
}

uint64_t objectdestroy_19Tm()
{
  OUTLINED_FUNCTION_21_0();
  type metadata accessor for PrimaryActionButtonView(0);
  OUTLINED_FUNCTION_45_0();
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  swift_bridgeObjectRelease();

  uint64_t v4 = v3 + *(int *)(v0 + 40);
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for SGBannerViewModel(0);
  uint64_t v6 = (id *)(v4 + *(int *)(v5 + 48));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  type metadata accessor for SGBannerIconParams(0);
  uint64_t v7 = sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  uint64_t v9 = *(void (**)(uint64_t))(v8 + 8);
  uint64_t v10 = OUTLINED_FUNCTION_88();
  v9(v10);
  swift_release();
  swift_release();
  uint64_t v11 = *(int *)(v5 + 56);
  uint64_t v12 = type metadata accessor for SGBannerPaddingParams(0);
  ((void (*)(uint64_t, uint64_t))v9)(v4 + v11 + *(int *)(v12 + 56), v7);
  swift_release();
  swift_release();
  j__swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1B5BC96C0();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_38();
    v13();
  }
  else
  {
    swift_release();
  }
  OUTLINED_FUNCTION_20();
  return MEMORY[0x1F4186498](v14, v15, v16);
}

uint64_t sub_1B5B94C90()
{
  uint64_t v0 = type metadata accessor for PrimaryActionButtonView(0);
  OUTLINED_FUNCTION_9(v0);
  OUTLINED_FUNCTION_2_0();
  return (*(uint64_t (**)(void))(v1 + 496))();
}

unint64_t sub_1B5B94CFC()
{
  unint64_t result = qword_1EB840B60;
  if (!qword_1EB840B60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840B68);
    sub_1B5B7E718((uint64_t)&unk_1EB840C38);
    sub_1B5B7E718((uint64_t)&unk_1EB840C70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840B60);
  }
  return result;
}

uint64_t sub_1B5B94DC0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1B5BC9540();
  *a1 = v3;
  return result;
}

uint64_t sub_1B5B94DEC()
{
  return sub_1B5BC9550();
}

unint64_t sub_1B5B94E14()
{
  unint64_t result = qword_1EB840B40;
  if (!qword_1EB840B40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840B48);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840B68);
    sub_1B5B94CFC();
    swift_getOpaqueTypeConformance2();
    sub_1B5B7E718((uint64_t)&unk_1EB840CB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840B40);
  }
  return result;
}

unint64_t sub_1B5B94EE8()
{
  unint64_t result = qword_1EB840B80;
  if (!qword_1EB840B80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840B88);
    sub_1B5B94E14();
    sub_1B5B8F7A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840B80);
  }
  return result;
}

unint64_t sub_1B5B94F64()
{
  unint64_t result = qword_1EB840BB0;
  if (!qword_1EB840BB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840BB8);
    sub_1B5B94EE8();
    sub_1B5B7E718((uint64_t)&unk_1EB840CC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840BB0);
  }
  return result;
}

uint64_t sub_1B5B95008()
{
  uint64_t v1 = type metadata accessor for PrimaryActionButtonView(0);
  OUTLINED_FUNCTION_9(v1);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  OUTLINED_FUNCTION_150();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB840CF0);
  sub_1B5BC9DF0();
  id v4 = *(id *)(v3 + 16);
  OUTLINED_FUNCTION_41();
  sub_1B5B9C318();
  return OUTLINED_FUNCTION_137(v5, v6, v7, v8);
}

unint64_t sub_1B5B950A4()
{
  return sub_1B5B8F4F8((uint64_t)&unk_1EB840B70);
}

unint64_t sub_1B5B950D4()
{
  return sub_1B5B8F4F8((uint64_t)&unk_1EB840B20);
}

unint64_t sub_1B5B95104()
{
  unint64_t result = qword_1EB840BE0;
  if (!qword_1EB840BE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840BE8);
    sub_1B5B94F64();
    sub_1B5B94EE8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840BE0);
  }
  return result;
}

unint64_t sub_1B5B95180()
{
  unint64_t result = qword_1EB840E50;
  if (!qword_1EB840E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840E50);
  }
  return result;
}

uint64_t type metadata accessor for CloseButtonView(uint64_t a1)
{
  return sub_1B5B7B630(a1, (uint64_t *)&unk_1EB842040);
}

uint64_t sub_1B5B951EC()
{
  return sub_1B5BC9510();
}

uint64_t sub_1B5B95210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B5B9523C(a1, a2, a3, a4, MEMORY[0x1E4F3EC78], MEMORY[0x1E4F3CEE8]);
}

uint64_t sub_1B5B9523C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v13 - v9, a1);
  return a6(v10);
}

void sub_1B5B952E8()
{
  uint64_t v0 = type metadata accessor for CloseButtonView(0);
  OUTLINED_FUNCTION_9(v0);
  sub_1B5B9349C();
}

unint64_t sub_1B5B95320(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v5();
    sub_1B5B7E718((uint64_t)&unk_1EB841618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1B5B953C0()
{
  unint64_t result = qword_1EB840FC0;
  if (!qword_1EB840FC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840FC8);
    sub_1B5B7E718((uint64_t)&unk_1EB840E58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840FC0);
  }
  return result;
}

uint64_t objectdestroy_34Tm()
{
  OUTLINED_FUNCTION_18();
  uint64_t v1 = (int *)(type metadata accessor for CloseButtonView(0) - 8);
  uint64_t v2 = (id *)(v0
            + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80)));

  uint64_t v3 = (char *)v2 + v1[8];
  swift_bridgeObjectRelease();
  uint64_t v4 = type metadata accessor for SGBannerViewModel(0);
  uint64_t v5 = (id *)&v3[*(int *)(v4 + 48)];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v6 = (char *)v5 + *(int *)(type metadata accessor for SGBannerIconParams(0) + 68);
  uint64_t v7 = sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v8 + 8);
  v9(v6, v7);
  swift_release();
  swift_release();
  uint64_t v10 = *(int *)(v4 + 56);
  uint64_t v11 = type metadata accessor for SGBannerPaddingParams(0);
  v9(&v3[v10 + *(int *)(v11 + 56)], v7);
  OUTLINED_FUNCTION_17();
  return MEMORY[0x1F4186498](v12, v13, v14);
}

uint64_t sub_1B5B955F8()
{
  uint64_t v0 = type metadata accessor for CloseButtonView(0);
  OUTLINED_FUNCTION_9(v0);
  OUTLINED_FUNCTION_2_0();
  return (*(uint64_t (**)(void))(v1 + 520))();
}

unint64_t sub_1B5B95660()
{
  unint64_t result = qword_1EB840B50;
  if (!qword_1EB840B50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840B58);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB841010);
    sub_1B5B95320((uint64_t)&unk_1EB841008);
    swift_getOpaqueTypeConformance2();
    sub_1B5B7E718((uint64_t)&unk_1EB8414B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840B50);
  }
  return result;
}

unint64_t sub_1B5B95760()
{
  unint64_t result = qword_1E9D94840;
  if (!qword_1E9D94840)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94830);
    sub_1B5B957DC();
    sub_1B5B8F7A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94840);
  }
  return result;
}

unint64_t sub_1B5B957DC()
{
  unint64_t result = qword_1E9D94848;
  if (!qword_1E9D94848)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94850);
    sub_1B5B7E718((uint64_t)&unk_1E9D94858);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94848);
  }
  return result;
}

unint64_t sub_1B5B9587C()
{
  unint64_t result = qword_1E9D94868;
  if (!qword_1E9D94868)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94810);
    swift_getOpaqueTypeConformance2();
    sub_1B5B8F7A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94868);
  }
  return result;
}

uint64_t sub_1B5B95928()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5B95940()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5B9595C()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5B95974()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5B9598C()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5B959A4()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5B959BC()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5B959D4()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5B95A04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t sub_1B5B95A1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

void sub_1B5B95A38()
{
  OUTLINED_FUNCTION_64_1();
  OUTLINED_FUNCTION_6_0();
  int v4 = *(_DWORD *)(v3 + 80);
  uint64_t v5 = *v1;
  *uint64_t v0 = *v1;
  if ((v4 & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_112();
  }
  else
  {
    uint64_t v6 = v0;
    uint64_t v7 = *(int *)(v2 + 20);
    uint64_t v8 = (char *)v0 + v7;
    uint64_t v9 = (char *)v1 + v7;
    *(_DWORD *)uint64_t v8 = *(_DWORD *)((char *)v1 + v7);
    v8[4] = *((unsigned char *)v1 + v7 + 4);
    *(_WORD *)(v8 + 5) = *(_WORD *)((char *)v1 + v7 + 5);
    uint64_t v10 = *(uint64_t *)((char *)v1 + v7 + 16);
    *((void *)v8 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = *(void **)((char *)v1 + v7 + 8);
    *((void *)v8 + 2) = v10;
    uint64_t v36 = v2;
    uint64_t v37 = v1;
    uint64_t v35 = type metadata accessor for SGBannerViewModel(0);
    uint64_t v11 = *(int *)(v35 + 48);
    uint64_t v12 = &v8[v11];
    uint64_t v13 = &v9[v11];
    *uint64_t v12 = v9[v11];
    *(_WORD *)(v12 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = *(_WORD *)&v9[v11 + 1];
    *(_OWORD *)(v12 + 8) = *(_OWORD *)&v9[v11 + 8];
    uint64_t v14 = *(void **)&v9[v11 + 32];
    *((void *)v12 + 3) = *(void *)&v9[v11 + 24];
    *((void *)v12 + 4) = v14;
    uint64_t v16 = *(void **)&v9[v11 + 40];
    uint64_t v15 = *(void *)&v9[v11 + 48];
    *((void *)v12 + 5) = v16;
    *((void *)v12 + 6) = v15;
    uint64_t v17 = *((void *)v13 + 8);
    *((void *)v12 + 7) = *((void *)v13 + 7);
    *((void *)v12 + 8) = v17;
    uint64_t v32 = v16;
    uint64_t v33 = (void *)*((void *)v13 + 10);
    *((void *)v12 + 9) = *((void *)v13 + 9);
    *((void *)v12 + 1sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v33;
    uint64_t v34 = (void *)*((void *)v13 + 11);
    OUTLINED_FUNCTION_96_0(*((void *)v13 + 12));
    sub_1B5BC9230();
    OUTLINED_FUNCTION_2_2();
    uint64_t v19 = *(void (**)(void))(v18 + 16);
    id v20 = v5;
    swift_bridgeObjectRetain();
    id v21 = v14;
    id v22 = v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v23 = v33;
    id v24 = v34;
    OUTLINED_FUNCTION_66();
    v19();
    OUTLINED_FUNCTION_54_1((uint64_t)&v9[*(int *)(v35 + 52)]);
    uint64_t v26 = &v8[v25];
    uint64_t v27 = &v9[v25];
    long long v28 = *((_OWORD *)v27 + 1);
    *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
    *((_OWORD *)v26 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = v28;
    long long v29 = *((_OWORD *)v27 + 3);
    *((_OWORD *)v26 + 2) = *((_OWORD *)v27 + 2);
    *((_OWORD *)v26 + 3) = v29;
    *((_OWORD *)v26 + 4) = *((_OWORD *)v27 + 4);
    uint64_t v30 = type metadata accessor for SGBannerPaddingParams(0);
    swift_retain();
    swift_retain();
    OUTLINED_FUNCTION_66();
    v31();
    *(void *)&v26[*(int *)(v30 + 60)] = *(void *)&v27[*(int *)(v30 + 60)];
    v26[*(int *)(v30 + 64)] = v27[*(int *)(v30 + 64)];
    *((unsigned char *)v6 + *(int *)(v36 + 24)) = *((unsigned char *)v37 + *(int *)(v36 + 24));
  }
  OUTLINED_FUNCTION_63_1();
}

uint64_t sub_1B5B95C3C(id *a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = type metadata accessor for SGBannerViewModel(0);
  OUTLINED_FUNCTION_91_0(v2);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  type metadata accessor for SGBannerIconParams(0);
  uint64_t v3 = OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(id *, uint64_t))(v4 + 8))(a1, v3);
  OUTLINED_FUNCTION_128();
  swift_release();
  uint64_t v5 = OUTLINED_FUNCTION_127();
  uint64_t v6 = OUTLINED_FUNCTION_86_0(v5);
  return v7(v6);
}

void **sub_1B5B95D28(void **a1, void **a2, uint64_t a3)
{
  uint64_t v19 = *a2;
  *a1 = *a2;
  uint64_t v6 = OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_46_1(v6);
  uint64_t v7 = (void *)v5[4];
  v4[3] = v5[3];
  v4[4] = v7;
  uint64_t v9 = (void *)v5[5];
  uint64_t v8 = v5[6];
  v4[5] = v9;
  v4[6] = v8;
  OUTLINED_FUNCTION_61_1();
  OUTLINED_FUNCTION_130();
  OUTLINED_FUNCTION_2_2();
  uint64_t v11 = *(void (**)(void))(v10 + 16);
  id v12 = v19;
  swift_bridgeObjectRetain();
  id v13 = v7;
  id v14 = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v15 = v3;
  id v16 = v18;
  OUTLINED_FUNCTION_66();
  v11();
  OUTLINED_FUNCTION_16_4();
  OUTLINED_FUNCTION_53_1();
  swift_retain();
  OUTLINED_FUNCTION_66();
  v11();
  OUTLINED_FUNCTION_42_1();
  unint64_t result = a1;
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return result;
}

void sub_1B5B95E50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_84_0(v14, v15);

  OUTLINED_FUNCTION_7_3();
  swift_bridgeObjectRelease();
  uint64_t v16 = type metadata accessor for SGBannerViewModel(0);
  OUTLINED_FUNCTION_9_1(v16);

  OUTLINED_FUNCTION_83_1();
  OUTLINED_FUNCTION_35_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_34_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_81_0();

  OUTLINED_FUNCTION_80_0();
  OUTLINED_FUNCTION_78_0();
  OUTLINED_FUNCTION_52_1();
  OUTLINED_FUNCTION_1_0();
  uint64_t v18 = *(void (**)(uint64_t))(v17 + 24);
  uint64_t v19 = OUTLINED_FUNCTION_31_1();
  v18(v19);
  OUTLINED_FUNCTION_43_1();
  swift_release();
  OUTLINED_FUNCTION_136();
  swift_release();
  uint64_t v20 = OUTLINED_FUNCTION_6_3();
  uint64_t v21 = OUTLINED_FUNCTION_33_0(v20);
  v18(v21);
  *(void *)(v11 + *(int *)(v16 + 60)) = *(void *)(v13 + *(int *)(v16 + 60));
  *(unsigned char *)(v11 + *(int *)(v16 + 64)) = *(unsigned char *)(v13 + *(int *)(v16 + 64));
  *(unsigned char *)(v10 + *(int *)(a10 + 24)) = *(unsigned char *)(a9 + *(int *)(a10 + 24));
  OUTLINED_FUNCTION_20();
}

#error "1B5B95FDC: call analysis failed (funcsize=39)"

#error "1B5B9608C: call analysis failed (funcsize=44)"

uint64_t sub_1B5B960A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0);
}

uint64_t sub_1B5B960BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0);
}

uint64_t sub_1B5B960D4()
{
  uint64_t result = type metadata accessor for SGBannerViewModel(319);
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_9(result);
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for BannerIconSGViewRepresentable()
{
}

#error "1B5B96310: call analysis failed (funcsize=116)"

uint64_t sub_1B5B96334(id *a1, uint64_t a2)
{
  sub_1B5BC9080();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_38();
  v4();

  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for SGBannerViewModel(0);
  OUTLINED_FUNCTION_91_0(v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  type metadata accessor for SGBannerIconParams(0);
  uint64_t v6 = OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(id *, uint64_t))(v7 + 8))(a1, v6);
  OUTLINED_FUNCTION_128();
  swift_release();
  uint64_t v8 = OUTLINED_FUNCTION_127();
  uint64_t v9 = OUTLINED_FUNCTION_86_0(v8);
  return v10(v9);
}

uint64_t sub_1B5B96450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_73_1();
  OUTLINED_FUNCTION_1_0();
  uint64_t v9 = OUTLINED_FUNCTION_49_1();
  v10(v9);
  uint64_t v26 = v3;
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v25 = *(void **)(v4 + v11);
  *(void *)(v3 + v1sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = v25;
  uint64_t v12 = OUTLINED_FUNCTION_50_1();
  OUTLINED_FUNCTION_46_1(v12);
  uint64_t v13 = (void *)v7[4];
  v6[3] = v7[3];
  v6[4] = v13;
  id v15 = (void *)v7[5];
  uint64_t v14 = v7[6];
  v6[5] = v15;
  v6[6] = v14;
  OUTLINED_FUNCTION_61_1();
  OUTLINED_FUNCTION_130();
  OUTLINED_FUNCTION_2_2();
  uint64_t v17 = *(void (**)(void))(v16 + 16);
  id v18 = v25;
  swift_bridgeObjectRetain();
  id v19 = v13;
  id v20 = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v21 = v5;
  id v22 = v24;
  OUTLINED_FUNCTION_66();
  v17();
  OUTLINED_FUNCTION_16_4();
  OUTLINED_FUNCTION_53_1();
  swift_retain();
  OUTLINED_FUNCTION_66();
  v17();
  OUTLINED_FUNCTION_42_1();
  uint64_t result = v26;
  *(unsigned char *)(v26 + *(int *)(a3 + 28)) = *(unsigned char *)(v4 + *(int *)(a3 + 28));
  return result;
}

#error "1B5B966B4: call analysis failed (funcsize=75)"

#error "1B5B96784: call analysis failed (funcsize=52)"

#error "1B5B9687C: call analysis failed (funcsize=62)"

uint64_t sub_1B5B96894(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B5B968A8);
}

uint64_t sub_1B5B968A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1B5BC9080();
  OUTLINED_FUNCTION_6_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
  }
  else
  {
    if (a2 == 0x7FFFFFFF) {
      return OUTLINED_FUNCTION_73(*(void *)(a1 + *(int *)(a3 + 20)));
    }
    uint64_t v8 = type metadata accessor for SGBannerViewModel(0);
    uint64_t v9 = a1 + *(int *)(a3 + 24);
  }
  return __swift_getEnumTagSinglePayload(v9, a2, v8);
}

uint64_t sub_1B5B96950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B5B96964);
}

void sub_1B5B96964(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_1B5BC9080();
  OUTLINED_FUNCTION_6_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      return;
    }
    uint64_t v10 = type metadata accessor for SGBannerViewModel(0);
    uint64_t v11 = a1 + *(int *)(a4 + 24);
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t sub_1B5B96A14()
{
  uint64_t result = sub_1B5BC9080();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SGBannerViewModel(319);
    if (v2 <= 0x3F)
    {
      OUTLINED_FUNCTION_9(result);
      OUTLINED_FUNCTION_110_0();
      return 0;
    }
  }
  return result;
}

void sub_1B5B96ABC(uint64_t a1)
{
  OUTLINED_FUNCTION_45(a1);
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void **)(v1 + 16);
}

uint64_t sub_1B5B96AF4(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_WORD *)(a1 + 9) = *(_WORD *)(a2 + 9);
  uint64_t v3 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  id v4 = v3;
  return a1;
}

uint64_t sub_1B5B96B48()
{
  OUTLINED_FUNCTION_152();
  *(void *)uint64_t v1 = *v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_82_0();
  uint64_t v3 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v4;
  id v5 = v4;

  *(unsigned char *)(v1 + 24) = *(unsigned char *)(v0 + 24);
  return v1;
}

uint64_t sub_1B5B96BA8(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_82_0();
  id v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v5;

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t sub_1B5B96BF8(uint64_t *a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_52(-1);
  }
  if (a2 < 0 && *((unsigned char *)a1 + 25))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    uint64_t v2 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v2) = -1;
    }
  }
  return OUTLINED_FUNCTION_52(v2);
}

uint64_t sub_1B5B96C34(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for SubtitleView()
{
}

void sub_1B5B96C88(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 16);
}

void *sub_1B5B96CC4(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

uint64_t sub_1B5B96D00(void *a1, void *a2)
{
  OUTLINED_FUNCTION_64_0(a1, a2);
  *(void *)(v3 + 8) = *(void *)(v4 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v5 = *(void **)(v2 + 16);
  uint64_t v6 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v5;
  id v7 = v5;

  return v3;
}

uint64_t sub_1B5B96D58(void *a1, void *a2)
{
  OUTLINED_FUNCTION_64_0(a1, a2);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(v3 + 16);
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(v2 + 8);

  return v3;
}

uint64_t sub_1B5B96D94(uint64_t a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_52(-1);
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24))
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
  return OUTLINED_FUNCTION_52(v2);
}

uint64_t sub_1B5B96DD0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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

void type metadata accessor for EmbeddedActionButtonView()
{
}

uint64_t sub_1B5B96E1C(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_6_0();
  if ((*(_DWORD *)(v5 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_99();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)(a2 + 8);
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v52 = *(void **)(a2 + 16);
    uint64_t v53 = *(void **)(a2 + 24);
    *(void *)(a1 + 16) = v52;
    *(void *)(a1 + 24) = v53;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    uint64_t v8 = v4[8];
    uint64_t v9 = a1 + v8;
    uint64_t v10 = a2 + v8;
    *(_DWORD *)uint64_t v9 = *(_DWORD *)(a2 + v8);
    *(unsigned char *)(v9 + 4) = *(unsigned char *)(a2 + v8 + 4);
    *(_WORD *)(v9 + 5) = *(_WORD *)(a2 + v8 + 5);
    uint64_t v11 = *(void *)(a2 + v8 + 16);
    *(void *)(v9 + 8) = *(void *)(a2 + v8 + 8);
    *(void *)(v9 + 16) = v11;
    uint64_t v54 = type metadata accessor for SGBannerViewModel(0);
    uint64_t v12 = *(int *)(v54 + 48);
    uint64_t v13 = v9 + v12;
    uint64_t v14 = (void *)(v10 + v12);
    *(unsigned char *)uint64_t v13 = *(unsigned char *)(v10 + v12);
    *(_WORD *)(v13 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = *(_WORD *)(v10 + v12 + 1);
    *(_OWORD *)(v13 + 8) = *(_OWORD *)(v10 + v12 + 8);
    id v15 = *(void **)(v10 + v12 + 32);
    *(void *)(v13 + 24) = *(void *)(v10 + v12 + 24);
    *(void *)(v13 + 32) = v15;
    uint64_t v17 = *(void **)(v10 + v12 + 40);
    uint64_t v16 = *(void *)(v10 + v12 + 48);
    uint64_t v49 = v17;
    *(void *)(v13 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v17;
    *(void *)(v13 + 48) = v16;
    uint64_t v18 = v14[8];
    *(void *)(v13 + 56) = v14[7];
    *(void *)(v13 + 64) = v18;
    id v19 = (void *)v14[10];
    *(void *)(v13 + 72) = v14[9];
    *(void *)(v13 + 8sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v19;
    uint64_t v50 = v19;
    uint64_t v51 = (void *)v14[11];
    uint64_t v20 = v14[12];
    *(void *)(v13 + 88) = v51;
    *(void *)(v13 + 96) = v20;
    uint64_t v21 = *(int *)(type metadata accessor for SGBannerIconParams(0) + 68);
    uint64_t v47 = (char *)v14 + v21;
    uint64_t v48 = v13 + v21;
    uint64_t v46 = (_OWORD *)sub_1B5BC9230();
    OUTLINED_FUNCTION_2_2();
    id v23 = *(void (**)(uint64_t, char *, _OWORD *))(v22 + 16);
    swift_bridgeObjectRetain();
    id v24 = v52;
    id v25 = v53;
    swift_bridgeObjectRetain();
    id v26 = v15;
    id v27 = v49;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v28 = v50;
    id v29 = v51;
    v23(v48, v47, v46);
    OUTLINED_FUNCTION_94_0(v10 + *(int *)(v54 + 52));
    uint64_t v31 = v10 + v30;
    long long v32 = *(_OWORD *)(v10 + v30 + 16);
    *uint64_t v46 = *(_OWORD *)(v10 + v30);
    v46[1] = v32;
    long long v33 = *(_OWORD *)(v10 + v30 + 48);
    v46[2] = *(_OWORD *)(v10 + v30 + 32);
    v46[3] = v33;
    v46[4] = *(_OWORD *)(v10 + v30 + 64);
    uint64_t v34 = type metadata accessor for SGBannerPaddingParams(0);
    swift_retain();
    swift_retain();
    OUTLINED_FUNCTION_80();
    v35();
    *(void *)((char *)v46 + *(int *)(v34 + 60)) = *(void *)(v31 + *(int *)(v34 + 60));
    *((unsigned char *)v46 + *(int *)(v34 + 64)) = *(unsigned char *)(v31 + *(int *)(v34 + 64));
    OUTLINED_FUNCTION_62_1(v6[9]);
    uint64_t v36 = v6[11];
    uint64_t v37 = a1 + v36;
    uint64_t v38 = (uint64_t *)(a2 + v36);
    uint64_t v39 = *v38;
    LOBYTE(v15) = *((unsigned char *)v38 + 8);
    swift_retain();
    swift_retain();
    j__swift_retain();
    *(void *)uint64_t v37 = v39;
    *(unsigned char *)(v37 + 8) = (_BYTE)v15;
    uint64_t v40 = v6[12];
    uint64_t v41 = (void *)(a1 + v40);
    uint64_t v42 = (void *)(a2 + v40);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
    if (OUTLINED_FUNCTION_133() == 1)
    {
      sub_1B5BC96C0();
      OUTLINED_FUNCTION_1_0();
      uint64_t v43 = OUTLINED_FUNCTION_76_1();
      v44(v43);
    }
    else
    {
      *uint64_t v41 = *v42;
      swift_retain();
    }
    OUTLINED_FUNCTION_97_0();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1B5B97120(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();

  uint64_t v4 = a1 + *(int *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for SGBannerViewModel(0);
  uint64_t v6 = (id *)(v4 + *(int *)(v5 + 48));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  type metadata accessor for SGBannerIconParams(0);
  uint64_t v7 = sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  uint64_t v9 = *(void (**)(uint64_t))(v8 + 8);
  uint64_t v10 = OUTLINED_FUNCTION_88();
  v9(v10);
  swift_release();
  swift_release();
  uint64_t v11 = v4 + *(int *)(v5 + 56);
  uint64_t v12 = type metadata accessor for SGBannerPaddingParams(0);
  ((void (*)(uint64_t, uint64_t))v9)(v11 + *(int *)(v12 + 56), v7);
  swift_release();
  swift_release();
  j__swift_release();
  uint64_t v13 = a1 + *(int *)(a2 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1B5BC96C0();
    OUTLINED_FUNCTION_1_0();
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
    return v16(v13, v14);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_1B5B97304(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v7 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v7;
  uint64_t v49 = *(void **)(a2 + 16);
  uint64_t v50 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v49;
  *(void *)(a1 + 24) = v50;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  OUTLINED_FUNCTION_55_1(a1, a2, a3[8]);
  *(void *)(v4 + 8) = v8;
  *(void *)(v4 + 16) = v9;
  uint64_t v51 = type metadata accessor for SGBannerViewModel(0);
  uint64_t v10 = *(int *)(v51 + 48);
  uint64_t v11 = v4 + v10;
  uint64_t v12 = (void *)(v3 + v10);
  *(unsigned char *)uint64_t v11 = *(unsigned char *)(v3 + v10);
  *(_WORD *)(v11 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = *(_WORD *)(v3 + v10 + 1);
  *(_OWORD *)(v11 + 8) = *(_OWORD *)(v3 + v10 + 8);
  uint64_t v13 = *(_OWORD **)(v3 + v10 + 32);
  *(void *)(v11 + 24) = *(void *)(v3 + v10 + 24);
  *(void *)(v11 + 32) = v13;
  uint64_t v15 = *(void **)(v3 + v10 + 40);
  uint64_t v14 = *(void *)(v3 + v10 + 48);
  *(void *)(v11 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v15;
  *(void *)(v11 + 48) = v14;
  uint64_t v16 = v12[8];
  *(void *)(v11 + 56) = v12[7];
  *(void *)(v11 + 64) = v16;
  uint64_t v46 = v15;
  uint64_t v47 = (void *)v12[10];
  *(void *)(v11 + 72) = v12[9];
  *(void *)(v11 + 8sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v47;
  uint64_t v17 = v12[12];
  uint64_t v48 = (void *)v12[11];
  *(void *)(v11 + 88) = v48;
  *(void *)(v11 + 96) = v17;
  uint64_t v18 = *(int *)(type metadata accessor for SGBannerIconParams(0) + 68);
  char v44 = (char *)v12 + v18;
  uint64_t v45 = v11 + v18;
  uint64_t v43 = sub_1B5BC9230();
  OUTLINED_FUNCTION_2_2();
  uint64_t v20 = *(void (**)(uint64_t, char *, uint64_t))(v19 + 16);
  swift_bridgeObjectRetain();
  id v21 = v49;
  id v22 = v50;
  swift_bridgeObjectRetain();
  id v23 = v13;
  id v24 = v46;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v25 = v47;
  id v26 = v48;
  v20(v45, v44, v43);
  OUTLINED_FUNCTION_94_0(v3 + *(int *)(v51 + 52));
  id v28 = (_OWORD *)(v3 + v27);
  long long v29 = v28[1];
  *uint64_t v13 = *v28;
  v13[1] = v29;
  long long v30 = v28[3];
  v13[2] = v28[2];
  v13[3] = v30;
  v13[4] = v28[4];
  uint64_t v31 = type metadata accessor for SGBannerPaddingParams(0);
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_80();
  v32();
  *(void *)((char *)v13 + *(int *)(v31 + 60)) = *(void *)((char *)v28 + *(int *)(v31 + 60));
  *((unsigned char *)v13 + *(int *)(v31 + 64)) = *((unsigned char *)v28 + *(int *)(v31 + 64));
  OUTLINED_FUNCTION_62_1(a3[9]);
  uint64_t v33 = a3[11];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = (uint64_t *)(a2 + v33);
  uint64_t v36 = *v35;
  LOBYTE(v2sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = *((unsigned char *)v35 + 8);
  swift_retain();
  swift_retain();
  j__swift_retain();
  *(void *)uint64_t v34 = v36;
  *(unsigned char *)(v34 + 8) = (_BYTE)v20;
  uint64_t v37 = a3[12];
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = (void *)(a2 + v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
  if (OUTLINED_FUNCTION_133() == 1)
  {
    sub_1B5BC96C0();
    OUTLINED_FUNCTION_1_0();
    uint64_t v40 = OUTLINED_FUNCTION_76_1();
    v41(v40);
  }
  else
  {
    *uint64_t v38 = *v39;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void sub_1B5B975CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int *a10)
{
  OUTLINED_FUNCTION_21_0();
  uint64_t v13 = v12;
  OUTLINED_FUNCTION_118(v14, v15);
  *(void *)(v10 + 8) = *(void *)(v16 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void **)(v11 + 16);
  uint64_t v18 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v17;
  id v19 = v17;

  uint64_t v20 = *(void **)(v10 + 24);
  id v21 = *(void **)(v11 + 24);
  *(void *)(v10 + 24) = v21;
  id v22 = v21;

  *(unsigned char *)(v10 + 32) = *(unsigned char *)(v11 + 32);
  uint64_t v23 = *(int *)(v13 + 32);
  uint64_t v24 = v10 + v23;
  uint64_t v25 = v11 + v23;
  OUTLINED_FUNCTION_7_3();
  swift_bridgeObjectRelease();
  uint64_t v26 = type metadata accessor for SGBannerViewModel(0);
  OUTLINED_FUNCTION_9_1(v26);

  OUTLINED_FUNCTION_83_1();
  OUTLINED_FUNCTION_35_0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_34_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_81_0();

  OUTLINED_FUNCTION_80_0();
  OUTLINED_FUNCTION_78_0();
  uint64_t v27 = OUTLINED_FUNCTION_52_1();
  OUTLINED_FUNCTION_1_0();
  uint64_t v52 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 24);
  uint64_t v29 = OUTLINED_FUNCTION_31_1();
  v30(v29);
  uint64_t v31 = *(int *)(v26 + 52);
  uint64_t v32 = v24 + v31;
  uint64_t v33 = v25 + v31;
  *(void *)(v24 + v3sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = *(void *)(v25 + v31);
  swift_retain();
  swift_release();
  *(void *)(v32 + 8) = *(void *)(v33 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(v32 + 16) = *(unsigned char *)(v33 + 16);
  *(unsigned char *)(v32 + 17) = *(unsigned char *)(v33 + 17);
  uint64_t v34 = *(int *)(v26 + 56);
  uint64_t v35 = (char *)(v24 + v34);
  uint64_t v36 = v25 + v34;
  *(void *)uint64_t v35 = *(void *)(v25 + v34);
  *((void *)v35 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = *(void *)(v25 + v34 + 8);
  *((void *)v35 + 2) = *(void *)(v25 + v34 + 16);
  *((void *)v35 + 3) = *(void *)(v25 + v34 + 24);
  *((void *)v35 + 4) = *(void *)(v25 + v34 + 32);
  *((void *)v35 + 5) = *(void *)(v25 + v34 + 40);
  *((void *)v35 + 6) = *(void *)(v25 + v34 + 48);
  *((void *)v35 + 7) = *(void *)(v25 + v34 + 56);
  *((void *)v35 + 8) = *(void *)(v25 + v34 + 64);
  *((void *)v35 + 9) = *(void *)(v25 + v34 + 72);
  uint64_t v37 = (int *)type metadata accessor for SGBannerPaddingParams(0);
  v52(&v35[v37[14]], v36 + v37[14], v27);
  *(void *)&v35[v37[15]] = *(void *)(v36 + v37[15]);
  v35[v37[16]] = *(unsigned char *)(v36 + v37[16]);
  *(void *)(v10 + a10[9]) = *(void *)(v11 + a10[9]);
  uint64_t v38 = a10[10];
  uint64_t v39 = v10 + v38;
  uint64_t v40 = v11 + v38;
  *(void *)(v10 + v38) = *(void *)(v11 + v38);
  swift_retain();
  swift_release();
  *(void *)(v39 + 8) = *(void *)(v40 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(v39 + 16) = *(unsigned char *)(v40 + 16);
  uint64_t v41 = a10[11];
  uint64_t v42 = v10 + v41;
  uint64_t v43 = (uint64_t *)(v11 + v41);
  uint64_t v44 = *v43;
  LOBYTE(v4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = *((unsigned char *)v43 + 8);
  j__swift_retain();
  *(void *)uint64_t v42 = v44;
  *(unsigned char *)(v42 + 8) = v40;
  j__swift_release();
  if (v10 != v11)
  {
    uint64_t v45 = a10[12];
    uint64_t v46 = (void *)(v10 + v45);
    uint64_t v47 = (void *)(v11 + v45);
    uint64_t v48 = OUTLINED_FUNCTION_97_0();
    sub_1B5B7E758(v48, v49);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
    if (OUTLINED_FUNCTION_133() == 1)
    {
      sub_1B5BC96C0();
      OUTLINED_FUNCTION_1_0();
      uint64_t v50 = OUTLINED_FUNCTION_76_1();
      v51(v50);
    }
    else
    {
      *uint64_t v46 = *v47;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  OUTLINED_FUNCTION_20();
}

void sub_1B5B978CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int *a10)
{
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_117();
  long long v14 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v13;
  *(_OWORD *)(v15 + 16) = v14;
  *(unsigned char *)(v15 + 32) = *(unsigned char *)(v13 + 32);
  uint64_t v17 = *(int *)(v16 + 32);
  uint64_t v18 = v15 + v17;
  uint64_t v19 = v13 + v17;
  uint64_t v20 = OUTLINED_FUNCTION_20_2();
  OUTLINED_FUNCTION_5_3(v20);
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_1_0();
  id v22 = *(void (**)(void))(v21 + 32);
  OUTLINED_FUNCTION_29_1();
  v22();
  uint64_t v23 = *(int *)(v12 + 52);
  uint64_t v24 = v18 + v23;
  uint64_t v25 = v19 + v23;
  *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
  *(_WORD *)(v24 + 16) = *(_WORD *)(v25 + 16);
  uint64_t v26 = OUTLINED_FUNCTION_22();
  uint64_t v27 = OUTLINED_FUNCTION_22_3(v26);
  ((void (*)(uint64_t))v22)(v27);
  OUTLINED_FUNCTION_93_0();
  uint64_t v28 = a10[10];
  *(void *)(v10 + a10[9]) = *(void *)(v11 + a10[9]);
  uint64_t v29 = v10 + v28;
  uint64_t v30 = v11 + v28;
  *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
  *(unsigned char *)(v29 + 16) = *(unsigned char *)(v30 + 16);
  uint64_t v31 = a10[11];
  uint64_t v32 = a10[12];
  uint64_t v33 = v10 + v31;
  uint64_t v34 = v11 + v31;
  *(unsigned char *)(v33 + 8) = *(unsigned char *)(v34 + 8);
  *(void *)uint64_t v33 = *(void *)v34;
  uint64_t v35 = (void *)(v10 + v32);
  uint64_t v36 = (const void *)(v11 + v32);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1B5BC96C0();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_60_1();
    v38();
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
  }
  OUTLINED_FUNCTION_20();
}

void sub_1B5B97A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int *a10)
{
  OUTLINED_FUNCTION_21_0();
  uint64_t v15 = v14;
  OUTLINED_FUNCTION_117();
  uint64_t v17 = v16[1];
  *(void *)uint64_t v10 = *v16;
  *(void *)(v10 + 8) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = *(void *)(v11 + 16);

  uint64_t v19 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = *(void *)(v11 + 24);

  *(unsigned char *)(v10 + 32) = *(unsigned char *)(v11 + 32);
  OUTLINED_FUNCTION_8_2(*(int *)(v15 + 32));
  uint64_t v20 = type metadata accessor for SGBannerViewModel(0);
  OUTLINED_FUNCTION_11_2(v20);
  OUTLINED_FUNCTION_79_1();
  OUTLINED_FUNCTION_72_1();
  OUTLINED_FUNCTION_71_1();
  OUTLINED_FUNCTION_90_0();
  OUTLINED_FUNCTION_77_0();
  OUTLINED_FUNCTION_69_0();
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_1_0();
  id v22 = *(void (**)(void))(v21 + 40);
  OUTLINED_FUNCTION_30_0();
  v22();
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_68_0();
  *(unsigned char *)(v12 + 16) = *(unsigned char *)(v13 + 16);
  *(unsigned char *)(v12 + 17) = *(unsigned char *)(v13 + 17);
  uint64_t v23 = OUTLINED_FUNCTION_22();
  uint64_t v24 = OUTLINED_FUNCTION_23_2(v23);
  ((void (*)(uint64_t))v22)(v24);
  OUTLINED_FUNCTION_93_0();
  uint64_t v25 = a10[10];
  *(void *)(v10 + a10[9]) = *(void *)(v11 + a10[9]);
  uint64_t v26 = v10 + v25;
  uint64_t v27 = v11 + v25;
  *(void *)(v10 + v25) = *(void *)(v11 + v25);
  swift_release();
  *(void *)(v26 + 8) = *(void *)(v27 + 8);
  swift_release();
  *(unsigned char *)(v26 + 16) = *(unsigned char *)(v27 + 16);
  uint64_t v28 = a10[11];
  uint64_t v29 = v10 + v28;
  uint64_t v30 = (uint64_t *)(v11 + v28);
  uint64_t v31 = *v30;
  LOBYTE(v3sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = *((unsigned char *)v30 + 8);
  *(void *)uint64_t v29 = v31;
  *(unsigned char *)(v29 + 8) = (_BYTE)v30;
  j__swift_release();
  if (v10 != v11)
  {
    uint64_t v32 = a10[12];
    uint64_t v33 = (void *)(v10 + v32);
    uint64_t v34 = (const void *)(v11 + v32);
    sub_1B5B7E758(v10 + v32, &qword_1EB841750);
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841750);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_1B5BC96C0();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_60_1();
      v36();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v33, v34, *(void *)(*(void *)(v35 - 8) + 64));
    }
  }
  OUTLINED_FUNCTION_20();
}

uint64_t sub_1B5B97C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B5B97C64);
}

uint64_t sub_1B5B97C64()
{
  OUTLINED_FUNCTION_132();
  if (v3) {
    return OUTLINED_FUNCTION_73(*(void *)(v1 + 8));
  }
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_6_0();
  if (*(_DWORD *)(v6 + 84) == v0)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(int *)(v2 + 32);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94408);
    uint64_t v8 = *(int *)(v2 + 48);
  }
  return __swift_getEnumTagSinglePayload(v1 + v8, v0, v7);
}

uint64_t sub_1B5B97CF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B5B97D0C);
}

void sub_1B5B97D0C()
{
  OUTLINED_FUNCTION_91();
  if (v4)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    uint64_t v5 = v3;
    int v6 = v2;
    type metadata accessor for SGBannerViewModel(0);
    OUTLINED_FUNCTION_6_0();
    if (*(_DWORD *)(v7 + 84) == v6)
    {
      uint64_t v8 = *(int *)(v5 + 32);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94408);
      uint64_t v8 = *(int *)(v5 + 48);
    }
    uint64_t v9 = OUTLINED_FUNCTION_63_0(v8);
    __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
  }
}

void sub_1B5B97DA8()
{
  type metadata accessor for SGBannerViewModel(319);
  if (v0 <= 0x3F)
  {
    sub_1B5B97EBC();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1B5B97EBC()
{
  if (!qword_1EB841758)
  {
    sub_1B5BC96C0();
    unint64_t v0 = sub_1B5BC9360();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB841758);
    }
  }
}

#error "1B5B98080: call analysis failed (funcsize=100)"

uint64_t sub_1B5B980A4(id *a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = type metadata accessor for SGBannerViewModel(0);
  OUTLINED_FUNCTION_91_0(v2);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  type metadata accessor for SGBannerIconParams(0);
  uint64_t v3 = OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(id *, uint64_t))(v4 + 8))(a1, v3);
  OUTLINED_FUNCTION_128();
  swift_release();
  uint64_t v5 = OUTLINED_FUNCTION_127();
  uint64_t v6 = OUTLINED_FUNCTION_86_0(v5);
  return v7(v6);
}

void sub_1B5B98198()
{
  OUTLINED_FUNCTION_64_1();
  uint64_t v26 = v0;
  uint64_t v27 = v1;
  uint64_t v28 = v2;
  uint64_t v24 = *(void **)v0;
  uint64_t v25 = *(void **)(v0 + 8);
  *uint64_t v2 = *(void *)v0;
  v2[1] = v25;
  uint64_t v3 = *(int *)(v1 + 24);
  uint64_t v4 = (char *)v2 + v3;
  uint64_t v5 = v0 + v3;
  *(_DWORD *)uint64_t v4 = *(_DWORD *)(v0 + v3);
  v4[4] = *(unsigned char *)(v0 + v3 + 4);
  *(_WORD *)(v4 + 5) = *(_WORD *)(v0 + v3 + 5);
  uint64_t v6 = *(void *)(v0 + v3 + 16);
  *((void *)v4 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = *(void *)(v0 + v3 + 8);
  *((void *)v4 + 2) = v6;
  uint64_t v7 = *(int *)(type metadata accessor for SGBannerViewModel(0) + 48);
  uint64_t v8 = &v4[v7];
  uint64_t v9 = (void *)(v5 + v7);
  *uint64_t v8 = *(unsigned char *)(v5 + v7);
  *(_WORD *)(v8 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = *(_WORD *)(v5 + v7 + 1);
  *(_OWORD *)(v8 + 8) = *(_OWORD *)(v5 + v7 + 8);
  uint64_t v10 = *(void **)(v5 + v7 + 32);
  *((void *)v8 + 3) = *(void *)(v5 + v7 + 24);
  *((void *)v8 + 4) = v10;
  uint64_t v12 = *(void **)(v5 + v7 + 40);
  uint64_t v11 = *(void *)(v5 + v7 + 48);
  *((void *)v8 + 5) = v12;
  *((void *)v8 + 6) = v11;
  uint64_t v13 = v9[8];
  *((void *)v8 + 7) = v9[7];
  *((void *)v8 + 8) = v13;
  uint64_t v14 = (void *)v9[10];
  *((void *)v8 + 9) = v9[9];
  *((void *)v8 + 1sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v14;
  uint64_t v23 = (void *)v9[11];
  OUTLINED_FUNCTION_96_0(v9[12]);
  sub_1B5BC9230();
  OUTLINED_FUNCTION_2_2();
  uint64_t v16 = *(void (**)(void))(v15 + 16);
  id v17 = v24;
  id v18 = v25;
  swift_bridgeObjectRetain();
  id v19 = v10;
  id v20 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v21 = v14;
  id v22 = v23;
  OUTLINED_FUNCTION_66();
  v16();
  OUTLINED_FUNCTION_16_4();
  OUTLINED_FUNCTION_53_1();
  swift_retain();
  OUTLINED_FUNCTION_66();
  v16();
  OUTLINED_FUNCTION_42_1();
  *((unsigned char *)v28 + *(int *)(v27 + 28)) = *(unsigned char *)(v26 + *(int *)(v27 + 28));
  OUTLINED_FUNCTION_63_1();
}

#error "1B5B98408: call analysis failed (funcsize=61)"

#error "1B5B984AC: call analysis failed (funcsize=41)"

#error "1B5B9856C: call analysis failed (funcsize=48)"

uint64_t sub_1B5B98584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B5B98598);
}

uint64_t sub_1B5B98598()
{
  OUTLINED_FUNCTION_132();
  if (v3) {
    return OUTLINED_FUNCTION_73(*v1);
  }
  uint64_t v5 = OUTLINED_FUNCTION_114();
  uint64_t v6 = (uint64_t)v1 + *(int *)(v2 + 24);
  return __swift_getEnumTagSinglePayload(v6, v0, v5);
}

uint64_t sub_1B5B98600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B5B98614);
}

void sub_1B5B98614()
{
  OUTLINED_FUNCTION_91();
  if (v3)
  {
    *uint64_t v1 = (v0 - 1);
  }
  else
  {
    uint64_t v4 = v2;
    type metadata accessor for SGBannerViewModel(0);
    uint64_t v5 = OUTLINED_FUNCTION_63_0(*(int *)(v4 + 24));
    __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
}

uint64_t sub_1B5B98680()
{
  uint64_t result = type metadata accessor for SGBannerViewModel(319);
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_9(result);
    OUTLINED_FUNCTION_110_0();
    return 0;
  }
  return result;
}

uint64_t sub_1B5B986F8(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B5B9873C(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v6;
  id v7 = v3;
  id v8 = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1B5B98798()
{
  OUTLINED_FUNCTION_152();
  char v3 = *v2;
  uint64_t v5 = *v4;
  *uint64_t v2 = *v4;
  id v6 = v5;

  *(void *)(v1 + 8) = *(void *)(v0 + 8);
  id v7 = *(void **)(v0 + 16);
  id v8 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v7;
  id v9 = v7;

  *(unsigned char *)(v1 + 24) = *(unsigned char *)(v0 + 24);
  *(void *)(v1 + 32) = *(void *)(v0 + 32);
  *(void *)(v1 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1B5B9881C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B5B98884(uint64_t a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_52(-1);
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48))
  {
    LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
  }
  else
  {
    unint64_t v2 = *(void *)(a1 + 16);
    if (v2 >= 0xFFFFFFFF) {
      LODWORD(v2) = -1;
    }
  }
  return OUTLINED_FUNCTION_52(v2);
}

uint64_t sub_1B5B988C0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for IconImageView()
{
}

unint64_t sub_1B5B98918()
{
  return sub_1B5B98A60((uint64_t)&unk_1EB841520);
}

unint64_t sub_1B5B98968()
{
  unint64_t result = qword_1EB841508;
  if (!qword_1EB841508)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB841510);
    sub_1B5B8F4F8((uint64_t)&unk_1EB841478);
    sub_1B5B8F700();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB841508);
  }
  return result;
}

unint64_t sub_1B5B98A10()
{
  return sub_1B5B98A60((uint64_t)&unk_1E9D94870);
}

unint64_t sub_1B5B98A60(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    OUTLINED_FUNCTION_57(0, v4);
    v2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1B5B98ABC()
{
  unint64_t result = qword_1E9D94878;
  if (!qword_1E9D94878)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94730);
    sub_1B5B8F4F8((uint64_t)&unk_1E9D94738);
    sub_1B5B900B8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94878);
  }
  return result;
}

unint64_t sub_1B5B98B64()
{
  return sub_1B5B8F4F8((uint64_t)&unk_1EB8414A8);
}

unint64_t sub_1B5B98BA8()
{
  return sub_1B5B8F4F8((uint64_t)&unk_1EB841498);
}

unint64_t sub_1B5B98BD8()
{
  return sub_1B5B8F4F8((uint64_t)&unk_1EB841488);
}

unint64_t sub_1B5B98C08()
{
  unint64_t result = qword_1EB841468;
  if (!qword_1EB841468)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB841470);
    sub_1B5B95320((uint64_t)&unk_1EB841438);
    sub_1B5B98D7C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB841468);
  }
  return result;
}

unint64_t sub_1B5B98CA8()
{
  unint64_t result = qword_1EB841408;
  if (!qword_1EB841408)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB841410);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB8415E0);
    sub_1B5B9413C();
    swift_getOpaqueTypeConformance2();
    sub_1B5B7E718((uint64_t)&unk_1EB841638);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB841408);
  }
  return result;
}

unint64_t sub_1B5B98D7C()
{
  unint64_t result = qword_1EB841150;
  if (!qword_1EB841150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB841150);
  }
  return result;
}

unint64_t sub_1B5B98DC8()
{
  return sub_1B5B98A60((uint64_t)&unk_1E9D94880);
}

unint64_t sub_1B5B98E18()
{
  return sub_1B5B7E718((uint64_t)&unk_1EB840E70);
}

uint64_t sub_1B5B98E54()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1B5B98EF4()
{
  unint64_t result = qword_1EB840B90;
  if (!qword_1EB840B90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840B98);
    sub_1B5B95660();
    sub_1B5B8F7A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840B90);
  }
  return result;
}

unint64_t sub_1B5B98F70()
{
  return sub_1B5B98A60((uint64_t)&unk_1E9D94890);
}

unint64_t sub_1B5B98FC0()
{
  unint64_t result = qword_1E9D94898;
  if (!qword_1E9D94898)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94838);
    sub_1B5B95760();
    sub_1B5B9587C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94898);
  }
  return result;
}

unint64_t sub_1B5B9903C()
{
  unint64_t result = qword_1E9D948A0;
  if (!qword_1E9D948A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D948A0);
  }
  return result;
}

uint64_t sub_1B5B99088(uint64_t a1, uint64_t a2, char a3)
{
  sub_1B5B7B664(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_1B5B990C4()
{
  unint64_t result = qword_1E9D948E8;
  if (!qword_1E9D948E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D948D0);
    sub_1B5B90208();
    sub_1B5B8F7A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D948E8);
  }
  return result;
}

unint64_t sub_1B5B99140()
{
  unint64_t result = qword_1E9D94900;
  if (!qword_1E9D94900)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D948C0);
    sub_1B5B8F4F8((uint64_t)&unk_1E9D948F8);
    sub_1B5B8F7A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94900);
  }
  return result;
}

uint64_t sub_1B5B991E8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_60_1();
  v4();
  return a2;
}

uint64_t sub_1B5B9923C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = OUTLINED_FUNCTION_49_1();
  v5(v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_136()
{
  *(void *)(v1 + 8) = *(void *)(v0 + 8);
  return swift_retain();
}

unint64_t OUTLINED_FUNCTION_139()
{
  return sub_1B5B9903C();
}

void OUTLINED_FUNCTION_140(uint64_t a1@<X8>)
{
  *(void *)(v4 + 104) = a1;
  *(unsigned char *)(v4 + 112) = v1;
  *(void *)(v4 + 12sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v2;
  *(unsigned char *)(v4 + 128) = v3;
}

uint64_t OUTLINED_FUNCTION_141()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_143()
{
  return sub_1B5BC93C0();
}

uint64_t OUTLINED_FUNCTION_145()
{
  return sub_1B5BC93C0();
}

void OUTLINED_FUNCTION_146(uint64_t a1@<X8>)
{
  *(unsigned char *)a1 = v1;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = 0;
}

uint64_t OUTLINED_FUNCTION_147()
{
  return sub_1B5BC93C0();
}

uint64_t OUTLINED_FUNCTION_154()
{
  return 0;
}

uint64_t sub_1B5B993D0()
{
  OUTLINED_FUNCTION_1();
  return MEMORY[0x1BA9A8120](v0);
}

uint64_t sub_1B5B99468()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_1B5B994B0@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x90))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B9950C(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x98);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

void (*sub_1B5B99570(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_suggestionDelegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_53();
  v3[3] = MEMORY[0x1BA9A8120](v5);
  return sub_1B5B7FEBC;
}

uint64_t sub_1B5B995E8()
{
  OUTLINED_FUNCTION_1();
  return *v0;
}

uint64_t sub_1B5B9961C(int a1)
{
  uint64_t result = OUTLINED_FUNCTION_2();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*sub_1B5B99654())()
{
  return j_j__swift_endAccess;
}

id sub_1B5B9969C()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  return v1;
}

void sub_1B5B996E0(void *a1)
{
}

uint64_t (*sub_1B5B996EC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B5B99734@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_orderBundleURL;
  OUTLINED_FUNCTION_4_3();
  return sub_1B5B99780(v3, a1);
}

uint64_t sub_1B5B99780(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94C10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B5B997E8()
{
  OUTLINED_FUNCTION_53();
  uint64_t v0 = OUTLINED_FUNCTION_43();
  sub_1B5B99838(v0, v1);
  return swift_endAccess();
}

uint64_t sub_1B5B99838(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94C10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_1B5B998A0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B5B998E8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B5B99920(uint64_t a1)
{
  OUTLINED_FUNCTION_2();
  *uint64_t v1 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B5B99960())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B5B999A8()
{
  OUTLINED_FUNCTION_4_3();
  sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_43();
  return v1(v0);
}

uint64_t sub_1B5B99A18(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_logger;
  OUTLINED_FUNCTION_53();
  sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 40))(v3, a1);
  return swift_endAccess();
}

uint64_t (*sub_1B5B99A94())()
{
  return j_j__swift_endAccess;
}

id sub_1B5B99ADC()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  return v1;
}

void sub_1B5B99B20(void *a1)
{
}

uint64_t (*sub_1B5B99B2C())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B5B99B74()
{
  OUTLINED_FUNCTION_72();
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(v0 + 192))();
  return sub_1B5B9B970(v1);
}

uint64_t SGWalletOrderSuggestion.__allocating_init(realtimeWalletOrder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SGWalletOrderSuggestion.init(realtimeWalletOrder:)(a1);
}

uint64_t SGWalletOrderSuggestion.init(realtimeWalletOrder:)(void *a1)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  uint64_t v80 = sub_1B5BC9100();
  OUTLINED_FUNCTION_0_1();
  uint64_t v79 = v3;
  MEMORY[0x1F4188790](v4);
  uint64_t v78 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94C10);
  MEMORY[0x1F4188790](v6 - 8);
  OUTLINED_FUNCTION_4_1();
  uint64_t v76 = v7;
  MEMORY[0x1F4188790](v8);
  uint64_t v77 = (char *)&v69 - v9;
  uint64_t v10 = sub_1B5BC9230();
  OUTLINED_FUNCTION_0_1();
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_4_1();
  uint64_t v81 = v14;
  MEMORY[0x1F4188790](v15);
  id v17 = (char *)&v69 - v16;
  swift_unknownObjectWeakInit();
  uint64_t v18 = (uint64_t)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_orderBundleURL];
  uint64_t v19 = sub_1B5BC9140();
  uint64_t v75 = v18;
  uint64_t v74 = v19;
  __swift_storeEnumTagSinglePayload(v18, 1, 1, v19);
  id v20 = (uint64_t *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_orderDictionary];
  *(void *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_orderDictionary] = 0;
  id v21 = v1;
  unsigned int v22 = objc_msgSend(a1, sel_state);
  *(_DWORD *)&v21[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_state] = v22;
  sub_1B5B729C0();
  swift_bridgeObjectRetain();
  sub_1B5BC9220();
  uint64_t v23 = &v21[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_logger];
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v21[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_logger], v17, v10);
  uint64_t v24 = self;
  id v25 = objc_msgSend(a1, sel_walletOrderDictData);
  uint64_t v26 = sub_1B5BC9160();
  unint64_t v28 = v27;

  uint64_t v29 = (void *)sub_1B5BC9150();
  sub_1B5B9B9E0(v26, v28);
  *(void *)&v85[0] = 0;
  id v30 = objc_msgSend(v24, sel_JSONObjectWithData_options_error_, v29, 0, v85);

  if (v30)
  {
    id v31 = *(id *)&v85[0];
    sub_1B5BCA0E0();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94970);
    if (swift_dynamicCast())
    {
      uint64_t v32 = v83;
      swift_beginAccess();
      *id v20 = v32;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    id v33 = *(id *)&v85[0];
    uint64_t v34 = (void *)sub_1B5BC90F0();

    swift_willThrow();
    OUTLINED_FUNCTION_4_3();
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(v81, v23, v10);
    id v35 = v34;
    id v36 = v34;
    uint64_t v37 = sub_1B5BC9210();
    os_log_type_t v38 = sub_1B5BCA050();
    int v39 = v38;
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v40 = swift_slowAlloc();
      uint64_t v72 = (void *)swift_slowAlloc();
      uint64_t v73 = swift_slowAlloc();
      *(void *)&v85[0] = v73;
      *(_DWORD *)uint64_t v40 = 136315394;
      uint64_t v69 = v40 + 4;
      type metadata accessor for SGWalletOrderSuggestion();
      ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
      uint64_t v42 = NSStringFromClass(ObjCClassFromMetadata);
      os_log_t v71 = v37;
      uint64_t v43 = v42;
      uint64_t v44 = sub_1B5BC9F40();
      int v70 = v39;
      uint64_t v45 = v44;
      unint64_t v47 = v46;

      *(void *)&long long v83 = sub_1B5B7AAF8(v45, v47, (uint64_t *)v85);
      sub_1B5BCA0C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 12) = 2112;
      id v48 = v34;
      uint64_t v49 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)&long long v83 = v49;
      sub_1B5BCA0C0();
      uint64_t v50 = v72;
      *uint64_t v72 = v49;

      os_log_t v51 = v71;
      _os_log_impl(&dword_1B5B6C000, v71, (os_log_type_t)v70, "%s - Encountered Error while resolving orderDictionary: %@", (uint8_t *)v40, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94470);
      swift_arrayDestroy();
      MEMORY[0x1BA9A8090](v50, -1, -1);
      uint64_t v52 = v73;
      swift_arrayDestroy();
      MEMORY[0x1BA9A8090](v52, -1, -1);
      MEMORY[0x1BA9A8090](v40, -1, -1);
    }
    else
    {
    }
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v81, v10);
  }
  OUTLINED_FUNCTION_4_3();
  uint64_t v53 = *v20;
  if (*v20)
  {
    swift_bridgeObjectRetain();
    sub_1B5B9A42C(0x68746150656C6966, 0xE800000000000000, v53, &v83);
    uint64_t result = swift_bridgeObjectRelease();
    if (!v84)
    {
      __break(1u);
      return result;
    }
    sub_1B5B7DD88(&v83, v85);
    swift_dynamicCast();
    uint64_t v55 = v74;
    __swift_storeEnumTagSinglePayload(v76, 1, 1, v74);
    (*(void (**)(char *, void, uint64_t))(v79 + 104))(v78, *MEMORY[0x1E4F276C0], v80);
    uint64_t v56 = (uint64_t)v77;
    OUTLINED_FUNCTION_41();
    sub_1B5BC9130();
    __swift_storeEnumTagSinglePayload(v56, 0, 1, v55);
    uint64_t v57 = v75;
    OUTLINED_FUNCTION_53();
    sub_1B5B99838(v56, v57);
    swift_endAccess();
  }
  sub_1B5B7447C(0, (unint64_t *)&unk_1E9D94960);
  id v58 = objc_msgSend(a1, sel_walletOrderData);
  uint64_t v59 = sub_1B5BC9160();
  unint64_t v61 = v60;

  id v62 = sub_1B5B9A490(v59, v61);
  if (!v62) {
    __break(1u);
  }
  *(void *)&v21[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_orderHelpers] = v62;
  *(void *)&v21[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_realtimeOrderSuggestion] = a1;
  uint64_t v63 = self;
  id v64 = a1;
  id v65 = objc_msgSend(v63, sel_currentDevice);
  id v66 = objc_msgSend(v65, sel_userInterfaceIdiom);

  v21[OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_bannerForVisionDevice] = v66 == (id)6;
  uint64_t v67 = (objc_class *)type metadata accessor for SGWalletOrderSuggestion();
  v82.receiver = v21;
  v82.super_class = v67;
  id v68 = objc_msgSendSuper2(&v82, sel_init);

  return (uint64_t)v68;
}

double sub_1B5B9A42C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_1B5B9B814(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_1B5B750B8(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

id sub_1B5B9A490(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = (void *)sub_1B5BC9150();
  id v6 = objc_msgSend(v4, sel_initWithOrderData_, v5);
  sub_1B5B9B9E0(a1, a2);

  return v6;
}

uint64_t sub_1B5B9A568()
{
  if (currentUIContext())
  {
    uint64_t v1 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1C8);
    return v1();
  }
  else
  {
    sub_1B5B72B30();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
    uint64_t v3 = OUTLINED_FUNCTION_16_0();
    *(_OWORD *)(v3 + 16) = xmmword_1B5BCD260;
    uint64_t v4 = MEMORY[0x1E4FBB5C8];
    *(void *)(v3 + 56) = MEMORY[0x1E4FBB550];
    *(void *)(v3 + 64) = v4;
    *(void *)(v3 + 32) = 1;
    OUTLINED_FUNCTION_43();
    uint64_t v5 = sub_1B5BC9F10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v5;
  }
}

uint64_t sub_1B5B9A6E0()
{
  OUTLINED_FUNCTION_72();
  uint64_t v1 = (*(uint64_t (**)(void))(v0 + 312))();
  if (v2)
  {
    uint64_t v3 = v1;
    uint64_t v4 = v2;
    sub_1B5B72B30();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
    uint64_t v5 = OUTLINED_FUNCTION_16_0();
    *(_OWORD *)(v5 + 16) = xmmword_1B5BCD260;
    *(void *)(v5 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v5 + 64) = sub_1B5B8D86C();
    *(void *)(v5 + 32) = v3;
    *(void *)(v5 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v4;
    sub_1B5BC9F10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return OUTLINED_FUNCTION_43();
}

id sub_1B5B9A858()
{
  OUTLINED_FUNCTION_72();
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(v0 + 192))();
  id v2 = objc_msgSend(v1, sel_attributedSubtitle);

  return v2;
}

id sub_1B5B9A90C()
{
  sub_1B5B7447C(0, &qword_1E9D94468);
  uint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1C0))();
  uint64_t v3 = v2;
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  return sub_1B5B8C07C(v1, v3, (uint64_t)sub_1B5B9BAB8, v4);
}

uint64_t sub_1B5B9AA34()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94C10);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1B5BC9140();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_16_1();
  uint64_t v9 = (void *)MEMORY[0x1E4FBC8C8];
  (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD8))();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1) {
    return sub_1B5B9BB5C((uint64_t)v4);
  }
  uint64_t v11 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(v1, v4, v5);
  uint64_t v12 = (void *)(*(uint64_t (**)(uint64_t))((*v9 & *v0) + 0xC0))(v11);
  uint64_t v13 = (void *)sub_1B5BC9110();
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_1B5B9C180;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1B5B9AC88;
  aBlock[3] = &block_descriptor_1;
  uint64_t v15 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v12, sel_saveOrderForURL_completion_, v13, v15);
  _Block_release(v15);

  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v1, v5);
}

void sub_1B5B9AC88(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_1B5B9AD00()
{
  v23[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94C10);
  MEMORY[0x1F4188790](v1 - 8);
  OUTLINED_FUNCTION_16_1();
  uint64_t v2 = sub_1B5BC9140();
  OUTLINED_FUNCTION_0_1();
  uint64_t v4 = v3;
  uint64_t v6 = MEMORY[0x1F4188790](v5);
  uint64_t v8 = &v22[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = &v22[-v9];
  OUTLINED_FUNCTION_72();
  uint64_t v12 = (void *)(*(uint64_t (**)(void))(v11 + 192))();
  id v13 = objc_msgSend(v12, sel_orderDeepLink);

  if (!v13)
  {
    __swift_storeEnumTagSinglePayload(v0, 1, 1, v2);
    goto LABEL_7;
  }
  sub_1B5BC9120();

  uint64_t v14 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v4 + 32);
  v14(v0, v8, v2);
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v2);
  if (__swift_getEnumTagSinglePayload(v0, 1, v2) == 1)
  {
LABEL_7:
    sub_1B5B9BB5C(v0);
    return (id)sub_1B5B9AA34();
  }
  v14((uint64_t)v10, (unsigned char *)v0, v2);
  id result = objc_msgSend(self, sel_defaultWorkspace);
  if (result)
  {
    uint64_t v16 = result;
    id v17 = (void *)sub_1B5BC9110();
    v23[0] = 0;
    id v18 = objc_msgSend(v16, sel_openURL_configuration_error_, v17, 0, v23);

    if (v18)
    {
      id v19 = v23[0];
    }
    else
    {
      id v20 = v23[0];
      id v21 = (void *)sub_1B5BC90F0();

      swift_willThrow();
    }
    return (id)(*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v10, v2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1B5B9AFBC()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI23SGWalletOrderSuggestion_bannerForVisionDevice)) {
    return 4;
  }
  else {
    return 0;
  }
}

uint64_t sub_1B5B9AFFC()
{
  return OUTLINED_FUNCTION_43();
}

id sub_1B5B9B044()
{
  OUTLINED_FUNCTION_72();
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(v0 + 192))();
  id v2 = objc_msgSend(v1, sel_walletLogo);

  if (v2) {
    return v2;
  }
  id v4 = objc_msgSend(self, sel_spotlightIconImageWithBundleIdentifier_, *MEMORY[0x1E4F5DC70]);
  return v4;
}

id sub_1B5B9B140()
{
  return OUTLINED_FUNCTION_7_4();
}

id sub_1B5B9B170(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  uint64_t v5 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  return v5;
}

id sub_1B5B9B1E0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1B5BCA170();
    swift_bridgeObjectRelease();
    if (v2) {
      return sub_1B5B72B30();
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return sub_1B5B72B30();
  }
  return 0;
}

uint64_t sub_1B5B9B280(unint64_t a1)
{
  *(_OWORD *)(OUTLINED_FUNCTION_16_0() + 16) = xmmword_1B5BCD260;
  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_15();
    sub_1B5BCA170();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_8(MEMORY[0x1E4FBB550]);
  OUTLINED_FUNCTION_13_1();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_41();
}

id sub_1B5B9B3E8(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D942B0);
  uint64_t v6 = sub_1B5BC9FE0();
  id v7 = a1;
  a4(v6);

  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1B5B9B4AC()
{
  currentUIContext();
  OUTLINED_FUNCTION_72();
  switch((*(unsigned int (**)(void))(v0 + 168))())
  {
    case 1u:
    case 2u:
    case 3u:
    case 4u:
      sub_1B5B72B30();
      OUTLINED_FUNCTION_13_1();
      break;
    default:
      return OUTLINED_FUNCTION_41();
  }
  return OUTLINED_FUNCTION_41();
}

id sub_1B5B9B618()
{
  return OUTLINED_FUNCTION_7_4();
}

uint64_t sub_1B5B9B630()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
}

id SGWalletOrderSuggestion.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SGWalletOrderSuggestion.init()()
{
}

id SGWalletOrderSuggestion.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SGWalletOrderSuggestion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1B5B9B814(uint64_t a1, uint64_t a2)
{
  sub_1B5BCA1C0();
  sub_1B5BC9F60();
  uint64_t v4 = sub_1B5BCA1E0();
  return sub_1B5B9B88C(a1, a2, v4);
}

unint64_t sub_1B5B9B88C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1B5BCA1B0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1B5BCA1B0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1B5B9B970(void *a1)
{
  id v2 = objc_msgSend(a1, sel_merchantName);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1B5BC9F40();

  return v3;
}

uint64_t sub_1B5B9B9E0(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for SGWalletOrderSuggestion()
{
  uint64_t result = qword_1EB841CC0;
  if (!qword_1EB841CC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B5B9BA80()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B5B9BAB8()
{
  OUTLINED_FUNCTION_4_3();
  id v1 = (void *)MEMORY[0x1BA9A8120](v0 + 16);
  if (v1)
  {
    id v2 = v1;
    unsigned int v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0xA8))();
    if (v3 >= 2 && (v3 - 3 < 2 || v3 == 2)) {
      sub_1B5B9AD00();
    }
    else {
      sub_1B5B9AA34();
    }
  }
}

uint64_t sub_1B5B9BB5C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94C10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B5B9BBBC()
{
  return type metadata accessor for SGWalletOrderSuggestion();
}

void sub_1B5B9BBC4()
{
  sub_1B5B9C0DC();
  if (v0 <= 0x3F)
  {
    sub_1B5BC9230();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for SGWalletOrderSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SGWalletOrderSuggestion);
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.__allocating_init(realtimeWalletOrder:)()
{
  return (*(uint64_t (**)(void))(v0 + 320))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionCategory()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionTitle()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionSubtitle()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionAttributedSubtitle()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionPrimaryAction()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionActionButtonType()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionCategoryId()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionCategoryImage()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionCategoryTitle()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionCategoryTitle(forItems:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionCategorySubtitle(forItems:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionCategoryLocalizedCount(ofItems:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.suggestionCategoryActionButtonType()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of SGWalletOrderSuggestion.realtimeSuggestion()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1D0))();
}

void sub_1B5B9C0DC()
{
  if (!qword_1E9D94978)
  {
    sub_1B5BC9140();
    unint64_t v0 = sub_1B5BCA0B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9D94978);
    }
  }
}

void type metadata accessor for SGRealtimeWalletOrderState()
{
  if (!qword_1E9D94980)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1E9D94980);
    }
  }
}

void sub_1B5B9C180(int a1)
{
  OUTLINED_FUNCTION_4_3();
  uint64_t v3 = MEMORY[0x1BA9A8120](v1 + 16);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    if ((a1 - 1) <= 1)
    {
      OUTLINED_FUNCTION_72();
      unint64_t v6 = (void *)(*(uint64_t (**)(void))(v5 + 144))();
      if (v6)
      {
        objc_msgSend(v6, sel_suggestionWasUpdated_, v4);
        swift_unknownObjectRelease();
      }
    }
  }
}

id sub_1B5B9C22C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *a5) + 0x1D0))();
  if (v5)
  {
    unint64_t v6 = v5;
    if ((objc_msgSend(v5, sel_respondsToSelector_, sel_tableViewController) & 1) == 0
      || (id v7 = objc_msgSend(v6, sel_tableViewController)) == 0)
    {
      id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EC0]), sel_init);
    }
    id v8 = v7;
    swift_unknownObjectRelease();
    return v8;
  }
  else
  {
    id v10 = objc_allocWithZone(MEMORY[0x1E4FB1EC0]);
    return objc_msgSend(v10, sel_init);
  }
}

id sub_1B5B9C320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1B5B9C22C(a1, a2, a3, 0, *(void **)(v3 + 24));
}

uint64_t sub_1B5B9C338()
{
  return sub_1B5BC9910();
}

uint64_t sub_1B5B9C374()
{
  OUTLINED_FUNCTION_54_2();
  uint64_t v0 = OUTLINED_FUNCTION_72_0();
  return MEMORY[0x1F40FAB70](v0);
}

uint64_t sub_1B5B9C3B8()
{
  OUTLINED_FUNCTION_54_2();
  uint64_t v0 = OUTLINED_FUNCTION_72_0();
  return MEMORY[0x1F40FAB28](v0);
}

void sub_1B5B9C3FC()
{
}

id sub_1B5B9C424()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  return v1;
}

void sub_1B5B9C468(void *a1)
{
}

uint64_t (*sub_1B5B9C474())()
{
  return j_j__swift_endAccess;
}

void *sub_1B5B9C4BC()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  id v2 = v1;
  return v1;
}

void sub_1B5B9C4F8(void *a1)
{
}

uint64_t (*sub_1B5B9C504())()
{
  return j_j__swift_endAccess;
}

void *sub_1B5B9C54C()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  id v2 = v1;
  return v1;
}

void sub_1B5B9C588(void *a1)
{
}

uint64_t (*sub_1B5B9C594())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B5B9C5DC()
{
  OUTLINED_FUNCTION_1();
  return MEMORY[0x1BA9A8120](v0);
}

uint64_t sub_1B5B9C614()
{
  return swift_unknownObjectRelease();
}

void (*sub_1B5B9C65C(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_presenterDelegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  OUTLINED_FUNCTION_53();
  v3[3] = MEMORY[0x1BA9A8120](v5);
  return sub_1B5B7FEBC;
}

id sub_1B5B9C6D8()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  return v1;
}

void sub_1B5B9C71C(void *a1)
{
}

uint64_t (*sub_1B5B9C728())()
{
  return j_j__swift_endAccess;
}

id sub_1B5B9C770()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  return v1;
}

void sub_1B5B9C7B4(void *a1)
{
}

uint64_t (*sub_1B5B9C7C0())()
{
  return j_j__swift_endAccess;
}

id SGSuggestionTableController.__allocating_init(store:delegate:suggestionPresenter:suggestionList:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  return SGSuggestionTableController.init(store:delegate:suggestionPresenter:suggestionList:)(a1, a2, a3, a4);
}

id SGSuggestionTableController.init(store:delegate:suggestionPresenter:suggestionList:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)&v4[OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_tableViewController] = 0;
  *(void *)&v4[OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_hostingController] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v4[OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_store] = a1;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  *(void *)&v4[OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_suggestionPresenter] = a3;
  *(void *)&v4[OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_suggestionList] = a4;
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for SGSuggestionTableController();
  id v8 = a1;
  id v9 = objc_msgSendSuper2(&v11, sel_initWithNibName_bundle_, 0, 0);

  swift_unknownObjectRelease();
  return v9;
}

uint64_t type metadata accessor for SGSuggestionTableController()
{
  return self;
}

void sub_1B5B9C9EC()
{
  *(void *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_tableViewController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI27SGSuggestionTableController_hostingController] = 0;
  swift_unknownObjectWeakInit();

  sub_1B5BCA160();
  __break(1u);
}

id SGSuggestionTableController.__deallocating_deinit()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  id v2 = (void *)OUTLINED_FUNCTION_18_2();
  sub_1B5BC9F40();
  uint64_t v3 = (void *)sub_1B5BC9F00();

  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_removeObserver_, v3);

  _suggestionViewControllerPresenter = 0;
  swift_unknownObjectRelease();
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for SGSuggestionTableController();
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

void sub_1B5B9CC14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  OUTLINED_FUNCTION_36_1();
  a17 = v18;
  a18 = v19;
  id v21 = v20;
  uint64_t v22 = type metadata accessor for SGSuggestionsTableView(0);
  uint64_t v23 = OUTLINED_FUNCTION_19_1(v22);
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_32();
  uint64_t v26 = v24 - v25;
  uint64_t v28 = MEMORY[0x1F4188790](v27);
  id v30 = (char *)&a9 - v29;
  MEMORY[0x1F4188790](v28);
  uint64_t v32 = (char *)&a9 - v31;
  OUTLINED_FUNCTION_48();
  uint64_t v34 = *(void (**)(void))(v33 + 136);
  id v35 = v21;
  v34();
  OUTLINED_FUNCTION_48();
  uint64_t v37 = (*(uint64_t (**)(void))(v36 + 176))();
  if (v37)
  {
    os_log_type_t v38 = (void *)v37;
    sub_1B5BC9740();

    sub_1B5BA0D28(v26, (uint64_t)v30);
    sub_1B5BA0D28((uint64_t)v30, (uint64_t)v32);
    int v39 = (void *)*((void *)v32 + 1);
    id v40 = v35;

    *((void *)v32 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = v35;
    sub_1B5BA0D8C((uint64_t)v32);
  }
  OUTLINED_FUNCTION_26_0();
}

#error "1B5B9CD80: call analysis failed (funcsize=23)"

void sub_1B5B9CDB0()
{
  OUTLINED_FUNCTION_18();
  id v2 = v0;
  uint64_t v3 = type metadata accessor for SGSuggestionsTableView(0);
  uint64_t v4 = OUTLINED_FUNCTION_19_1(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_16_1();
  v83.receiver = v0;
  v83.super_class = (Class)type metadata accessor for SGSuggestionTableController();
  id v5 = objc_msgSendSuper2(&v83, sel_viewDidLoad);
  unint64_t v6 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8);
  id v7 = (void *)((uint64_t (*)(id))v6)(v5);
  sub_1B5BA0DE8(v7);
  uint64_t v9 = v8;
  uint64_t v10 = swift_bridgeObjectRelease();
  if (v9)
  {
    objc_super v11 = (void *)((uint64_t (*)(uint64_t))v6)(v10);
    sub_1B5BA0DE8(v11);
    if (v12)
    {
      id v13 = (void *)sub_1B5BC9F00();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v13 = 0;
    }
    objc_msgSend(v2, sel_setTitle_, v13);
  }
  else
  {
    id v14 = sub_1B5B72B30();
    sub_1B5BA0E58((uint64_t)v14, v15, v2);
  }
  uint64_t v16 = (void *)v6();
  objc_msgSend(v16, sel_supportsDismissAll);

  id v17 = objc_msgSend(self, sel_currentDevice);
  id v18 = objc_msgSend(v17, sel_userInterfaceIdiom);

  if (v18 == (id)6)
  {
    sub_1B5B7544C();
    if (v19)
    {
      sub_1B5B75184();
      id v21 = v20;
      id v22 = objc_msgSend(v2, sel_navigationItem);
      id v23 = v22;
      uint64_t v24 = sel_setLeftBarButtonItem_;
    }
    else
    {
      OUTLINED_FUNCTION_43_2();
      OUTLINED_FUNCTION_45_1();
      id v27 = objc_allocWithZone(MEMORY[0x1E4FB14A8]);
      id v28 = v2;
      id v21 = OUTLINED_FUNCTION_19_3();
      id v22 = objc_msgSend(v1, sel_navigationItem);
      id v23 = v22;
      uint64_t v24 = sel_setRightBarButtonItem_;
    }
    objc_msgSend(v22, v24, v21);
  }
  else
  {
    if (sub_1B5B743FC()) {
      goto LABEL_15;
    }
    OUTLINED_FUNCTION_43_2();
    OUTLINED_FUNCTION_45_1();
    id v25 = objc_allocWithZone(MEMORY[0x1E4FB14A8]);
    id v26 = v2;
    id v23 = OUTLINED_FUNCTION_19_3();
    id v21 = objc_msgSend(v1, sel_navigationItem);
    objc_msgSend(v21, sel_setRightBarButtonItem_, v23);
  }

LABEL_15:
  id v29 = objc_msgSend(v2, sel_navigationController);
  if (v29)
  {
    id v30 = v29;
    id v31 = objc_msgSend(v29, sel_navigationBar);

    objc_msgSend(v31, sel_setShadowImage_, 0);
  }
  sub_1B5B7544C();
  OUTLINED_FUNCTION_17_4();
  (*(void (**)(void))(v32 + 128))();
  type metadata accessor for SectionHeadersUpdateModel(0);
  swift_allocObject();
  sub_1B5B9E920();
  sub_1B5B9D644();
  id v33 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D949B8));
  uint64_t v34 = (void *)sub_1B5BC9720();
  OUTLINED_FUNCTION_17_4();
  uint64_t v36 = *(void (**)(void *))(v35 + 184);
  id v37 = v34;
  v36(v34);
  OUTLINED_FUNCTION_17_4();
  int v39 = *(void (**)(void *))(v38 + 160);
  id v40 = v37;
  v39(v34);
  objc_msgSend(v2, sel_addChildViewController_, v40);
  id v41 = OUTLINED_FUNCTION_24_2();
  if (!v41)
  {
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v42 = v41;
  objc_msgSend(v41, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v43 = OUTLINED_FUNCTION_38_1();
  if (!v43)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v44 = v43;
  id v45 = OUTLINED_FUNCTION_24_2();
  if (!v45)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  unint64_t v46 = v45;
  objc_msgSend(v44, sel_addSubview_, v45);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB8419C0);
  uint64_t v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = xmmword_1B5BCDA00;
  id v48 = OUTLINED_FUNCTION_24_2();
  if (!v48)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v49 = v48;
  id v50 = objc_msgSend(v48, sel_leadingAnchor);

  id v51 = OUTLINED_FUNCTION_38_1();
  if (!v51)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v52 = v51;
  id v53 = objc_msgSend(v51, sel_leadingAnchor);

  id v54 = OUTLINED_FUNCTION_35_1();
  *(void *)(v47 + 32) = v54;
  id v55 = OUTLINED_FUNCTION_24_2();
  if (!v55)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v56 = v55;
  id v57 = objc_msgSend(v55, sel_trailingAnchor);

  id v58 = OUTLINED_FUNCTION_38_1();
  if (!v58)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v59 = v58;
  id v60 = objc_msgSend(v58, sel_trailingAnchor);

  id v61 = OUTLINED_FUNCTION_35_1();
  *(void *)(v47 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v61;
  id v62 = OUTLINED_FUNCTION_24_2();
  if (!v62)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v63 = v62;
  id v64 = objc_msgSend(v62, sel_topAnchor);

  id v65 = OUTLINED_FUNCTION_38_1();
  if (!v65)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  id v66 = v65;
  id v67 = objc_msgSend(v65, sel_topAnchor);

  id v68 = OUTLINED_FUNCTION_35_1();
  *(void *)(v47 + 48) = v68;
  id v69 = OUTLINED_FUNCTION_24_2();
  if (!v69)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  int v70 = v69;
  id v71 = objc_msgSend(v69, sel_bottomAnchor);

  id v72 = OUTLINED_FUNCTION_38_1();
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = self;
    id v75 = objc_msgSend(v73, sel_bottomAnchor);

    id v76 = objc_msgSend(v71, sel_constraintEqualToAnchor_, v75);
    *(void *)(v47 + 56) = v76;
    v82[0] = v47;
    sub_1B5BC9FF0();
    sub_1B5B7447C(0, (unint64_t *)&qword_1EB841778);
    uint64_t v77 = (void *)sub_1B5BC9FC0();
    swift_bridgeObjectRelease();
    objc_msgSend(v74, sel_activateConstraints_, v77);

    id v78 = objc_msgSend(self, sel_defaultCenter);
    uint64_t v79 = (void *)sub_1B5BC9F00();
    uint64_t v80 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v82[4] = sub_1B5BA0F14;
    v82[5] = v80;
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 1107296256;
    v82[2] = sub_1B5B9D868;
    v82[3] = &block_descriptor_2;
    uint64_t v81 = _Block_copy(v82);
    swift_release();
    objc_msgSend(v78, sel_addObserverForName_object_queue_usingBlock_, v79, 0, 0, v81);
    _Block_release(v81);
    swift_unknownObjectRelease();

    objc_msgSend(v40, sel_didMoveToParentViewController_, v2);
    OUTLINED_FUNCTION_17();
    return;
  }
LABEL_39:
  __break(1u);
}

uint64_t sub_1B5B9D604()
{
  uint64_t v0 = swift_allocObject();
  sub_1B5B9E920();
  return v0;
}

void sub_1B5B9D644()
{
  OUTLINED_FUNCTION_18();
  char v1 = v0;
  char v3 = v2;
  id v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for SGSuggestionsTableView(0);
  *(void *)uint64_t v7 = 0;
  *(void *)(v7 + 8) = 0;
  uint64_t v9 = (uint64_t *)(v7 + *(int *)(v8 + 32));
  *uint64_t v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
  swift_storeEnumTagMultiPayload();
  id v10 = objc_msgSend(self, sel_defaultCenter);
  objc_super v11 = (void *)OUTLINED_FUNCTION_44_2();
  sub_1B5BCA090();

  if (v5)
  {
    uint64_t v12 = *(void **)(v7 + 8);
    id v13 = v5;

    *(void *)(v7 + 8) = v5;
    id v14 = (uint64_t *)(v7 + *(int *)(v8 + 36));
    type metadata accessor for SectionHeadersUpdateModel(0);
    sub_1B5BA0FC0(&qword_1E9D949C8, (void (*)(uint64_t))type metadata accessor for SectionHeadersUpdateModel);
    swift_retain();
    *id v14 = sub_1B5BC9410();
    v14[1] = v15;
    type metadata accessor for SGSuggestionStoreWrapper(0);
    uint64_t v16 = swift_allocObject();
    sub_1B5B9F03C();

    swift_release();
    *(void *)uint64_t v7 = v16;
  }
  else
  {
    type metadata accessor for SectionHeadersUpdateModel(0);
    swift_allocObject();
    sub_1B5B9E920();
    id v17 = (uint64_t *)(v7 + *(int *)(v8 + 36));
    sub_1B5BA0FC0(&qword_1E9D949C8, (void (*)(uint64_t))type metadata accessor for SectionHeadersUpdateModel);
    uint64_t v18 = sub_1B5BC9410();
    uint64_t v20 = v19;
    swift_release();
    *id v17 = v18;
    v17[1] = v20;
  }
  *(unsigned char *)(v7 + 16) = v3 & 1;
  *(unsigned char *)(v7 + 17) = v1 & 1;
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1B5B9D868(uint64_t a1)
{
  uint64_t v2 = sub_1B5BC9040();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  id v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_1B5BC9030();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_1B5B9D9A4()
{
  v20.receiver = v0;
  v20.super_class = (Class)type metadata accessor for SGSuggestionTableController();
  OUTLINED_FUNCTION_56_1((uint64_t)v20.super_class, sel_viewWillAppear_, v1, v2, v3, v4, v5, v6, v20);
  if (objc_msgSend(v0, sel_isMovingToParentViewController))
  {
    _suggestionViewControllerPresenter = (uint64_t)v0;
    swift_unknownObjectRelease();
    id v7 = v0;
  }
  id v8 = objc_msgSend(v0, sel_navigationController);
  if (v8)
  {
    uint64_t v9 = v8;
    objc_msgSend(v8, sel_setToolbarHidden_animated_, 1, 0);
  }
  OUTLINED_FUNCTION_4_0();
  uint64_t v11 = (*(uint64_t (**)(void))(v10 + 152))();
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    OUTLINED_FUNCTION_4_0();
    id v14 = (void *)(*(uint64_t (**)(void))(v13 + 200))();
    if (v14)
    {
      uint64_t v15 = v14;
      if (objc_msgSend(v14, sel_respondsToSelector_, sel_suggestionPresenter_willPresentViewController_))
      {
        if ((objc_msgSend(v15, sel_respondsToSelector_, sel_suggestionPresenter_willPresentViewController_) & 1) == 0)
        {

          swift_unknownObjectRelease();
          return;
        }
        OUTLINED_FUNCTION_4_0();
        id v17 = *(uint64_t (**)(uint64_t))(v16 + 224);
        uint64_t v18 = swift_unknownObjectRetain();
        uint64_t v19 = (void *)v17(v18);
        objc_msgSend(v15, sel_suggestionPresenter_willPresentViewController_, v19, v12);

        swift_unknownObjectRelease_n();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
}

void sub_1B5B9DB90()
{
  v17.receiver = v0;
  v17.super_class = (Class)type metadata accessor for SGSuggestionTableController();
  OUTLINED_FUNCTION_56_1((uint64_t)v17.super_class, sel_viewDidAppear_, v1, v2, v3, v4, v5, v6, v17);
  OUTLINED_FUNCTION_4_0();
  uint64_t v8 = (*(uint64_t (**)(void))(v7 + 152))();
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    OUTLINED_FUNCTION_4_0();
    uint64_t v11 = (void *)(*(uint64_t (**)(void))(v10 + 200))();
    if (v11)
    {
      uint64_t v12 = v11;
      if (objc_msgSend(v11, sel_respondsToSelector_, sel_suggestionPresenter_didPresentViewController_))
      {
        if ((objc_msgSend(v12, sel_respondsToSelector_, sel_suggestionPresenter_didPresentViewController_) & 1) == 0)
        {

          swift_unknownObjectRelease();
          return;
        }
        OUTLINED_FUNCTION_4_0();
        id v14 = *(uint64_t (**)(uint64_t))(v13 + 224);
        uint64_t v15 = swift_unknownObjectRetain();
        uint64_t v16 = (void *)v14(v15);
        objc_msgSend(v12, sel_suggestionPresenter_didPresentViewController_, v16, v9);

        swift_unknownObjectRelease_n();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
}

id sub_1B5B9DD18()
{
  id v1 = objc_msgSend(v0, sel_navigationController);
  if (v1)
  {
    uint64_t v2 = v1;
    if (objc_msgSend(v1, sel_isBeingDismissed))
    {
      _suggestionViewControllerPresenter = 0;

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
  if (_suggestionViewControllerPresenter && objc_msgSend(v0, sel_isMovingFromParentViewController))
  {
    _suggestionViewControllerPresenter = 0;
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_51();
  uint64_t v4 = (*(uint64_t (**)(void))(v3 + 152))();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    OUTLINED_FUNCTION_51();
    uint64_t v7 = (void *)(*(uint64_t (**)(void))(v6 + 200))();
    if (v7)
    {
      uint64_t v8 = v7;
      if (objc_msgSend(v7, sel_respondsToSelector_, sel_suggestionPresenter_willDismissViewController_))
      {
        if ((objc_msgSend(v8, sel_respondsToSelector_, sel_suggestionPresenter_willDismissViewController_) & 1) == 0)
        {

          swift_unknownObjectRelease();
          goto LABEL_15;
        }
        OUTLINED_FUNCTION_51();
        uint64_t v10 = *(uint64_t (**)(uint64_t))(v9 + 224);
        uint64_t v11 = swift_unknownObjectRetain();
        uint64_t v12 = (void *)v10(v11);
        objc_msgSend(v8, sel_suggestionPresenter_willDismissViewController_, v12, v5);

        swift_unknownObjectRelease_n();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
LABEL_15:
  v20.receiver = v0;
  v20.super_class = (Class)type metadata accessor for SGSuggestionTableController();
  return OUTLINED_FUNCTION_56_1((uint64_t)v20.super_class, sel_viewWillDisappear_, v13, v14, v15, v16, v17, v18, v20);
}

id sub_1B5B9DF24()
{
  OUTLINED_FUNCTION_51();
  uint64_t v2 = (*(uint64_t (**)(void))(v1 + 152))();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    OUTLINED_FUNCTION_51();
    uint64_t v5 = (void *)(*(uint64_t (**)(void))(v4 + 200))();
    if (v5)
    {
      uint64_t v6 = v5;
      if (objc_msgSend(v5, sel_respondsToSelector_, sel_suggestionPresenter_didDismissViewController_))
      {
        if ((objc_msgSend(v6, sel_respondsToSelector_, sel_suggestionPresenter_didDismissViewController_) & 1) == 0)
        {

          swift_unknownObjectRelease();
          goto LABEL_8;
        }
        OUTLINED_FUNCTION_51();
        uint64_t v8 = *(uint64_t (**)(uint64_t))(v7 + 224);
        uint64_t v9 = swift_unknownObjectRetain();
        uint64_t v10 = (void *)v8(v9);
        objc_msgSend(v6, sel_suggestionPresenter_didDismissViewController_, v10, v3);

        swift_unknownObjectRelease_n();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
LABEL_8:
  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for SGSuggestionTableController();
  return OUTLINED_FUNCTION_56_1((uint64_t)v18.super_class, sel_viewDidDisappear_, v11, v12, v13, v14, v15, v16, v18);
}

void sub_1B5B9E0B4(void *a1)
{
  self;
  if (swift_dynamicCastObjCClass())
  {
    objc_msgSend(a1, sel_setModalPresentationStyle_, 7);
    objc_msgSend(v1, sel_presentViewController_animated_completion_, a1, 1, 0);
  }
  else
  {
    id v3 = objc_msgSend(a1, sel_modalPresentationStyle);
    id v4 = objc_msgSend(v1, sel_navigationController);
    if (v3 == (id)-1)
    {
      if (!v4) {
        return;
      }
    }
    else if (!v4)
    {
      return;
    }
    OUTLINED_FUNCTION_27_1();
    [v5 v6];
  }
}

void sub_1B5B9E238(void *a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(v1, sel_navigationController);
  id v5 = objc_msgSend(a1, sel_navigationController);
  SEL v6 = v5;
  if (!v4)
  {
    if (!v5) {
      goto LABEL_6;
    }
LABEL_9:

    goto LABEL_10;
  }
  if (!v5)
  {
    SEL v6 = v4;
    goto LABEL_9;
  }
  sub_1B5B7447C(0, (unint64_t *)&unk_1E9D949D0);
  id v7 = v4;
  char v8 = sub_1B5BCA0A0();

  if (v8)
  {
LABEL_6:
    if (!objc_msgSend(v2, sel_navigationController)) {
      return;
    }
    OUTLINED_FUNCTION_27_1();

    goto LABEL_15;
  }
LABEL_10:
  id v11 = objc_msgSend(v2, sel_navigationController);
  if (!v11) {
    return;
  }
  uint64_t v12 = v11;
  id v13 = objc_msgSend(v11, sel_presentedViewController);

  if (!v13) {
    return;
  }

  id v14 = objc_msgSend(v2, sel_navigationController);
  if (!v14) {
    return;
  }
  uint64_t v15 = v14;
  id v16 = objc_msgSend(v14, sel_presentedViewController);

  if (!v16) {
    return;
  }
  objc_msgSend(v16, sel_dismissViewControllerAnimated_completion_, 0, 0);
LABEL_15:
}

uint64_t sub_1B5B9E454()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x138))();
}

id sub_1B5B9E4F0()
{
  _suggestionViewControllerPresenter = 0;
  swift_unknownObjectRelease();
  return objc_msgSend(v0, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

id SGSuggestionTableController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    SEL v6 = (void *)sub_1B5BC9F00();
    swift_bridgeObjectRelease();
  }
  else
  {
    SEL v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void SGSuggestionTableController.init(nibName:bundle:)()
{
}

uint64_t sub_1B5B9E60C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B5BC92F0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B5B9E680@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 88))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1B5B9E6D0(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 96))(*a1);
}

uint64_t sub_1B5B9E718()
{
  return sub_1B5BC9300();
}

void (*sub_1B5B9E788(void *a1))(void *)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  uint64_t KeyPath = swift_getKeyPath();
  v2[6] = OUTLINED_FUNCTION_41_2(KeyPath);
  return sub_1B5B9E800;
}

uint64_t sub_1B5B9E804()
{
  return sub_1B5B9ECD4((uint64_t)&OBJC_IVAR____TtC17CoreSuggestionsUI25SectionHeadersUpdateModel__updateSectionHeaders, &qword_1EB8416A0);
}

void sub_1B5B9E818()
{
}

void (*sub_1B5B9E834(void *a1))()
{
  id v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D949E0);
  v3[4] = v4;
  OUTLINED_FUNCTION_23(v4);
  v3[5] = v5;
  size_t v7 = *(void *)(v6 + 64);
  v3[6] = malloc(v7);
  v3[7] = malloc(v7);
  OUTLINED_FUNCTION_53();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8416A0);
  sub_1B5BC92C0();
  swift_endAccess();
  return sub_1B5B9E908;
}

void sub_1B5B9E908()
{
}

uint64_t sub_1B5B9E920()
{
  OUTLINED_FUNCTION_53();
  sub_1B5BC92B0();
  swift_endAccess();
  return v0;
}

uint64_t SectionHeadersUpdateModel.deinit()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8416A0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_38();
  v1();
  return v0;
}

uint64_t SectionHeadersUpdateModel.__deallocating_deinit()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8416A0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_38();
  v1();
  uint64_t v2 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v3 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v2, v3);
}

uint64_t sub_1B5B9EA80@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SectionHeadersUpdateModel(0);
  uint64_t result = sub_1B5BC9290();
  *a1 = result;
  return result;
}

uint64_t sub_1B5B9EAC0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1B5BC92F0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1B5B9EB34@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 96))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5B9EB80(id *a1, uint64_t a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))(**(void **)a2 + 104);
  id v4 = *a1;
  return v3(v2);
}

uint64_t sub_1B5B9EBD8()
{
  return sub_1B5BC9300();
}

void (*sub_1B5B9EC48(void *a1))(void *)
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  uint64_t KeyPath = swift_getKeyPath();
  v2[6] = OUTLINED_FUNCTION_41_2(KeyPath);
  return sub_1B5B9E800;
}

uint64_t sub_1B5B9ECC0()
{
  return sub_1B5B9ECD4((uint64_t)&OBJC_IVAR____TtC17CoreSuggestionsUI24SGSuggestionStoreWrapper__store, &qword_1E9D949F0);
}

uint64_t sub_1B5B9ECD4(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

void sub_1B5B9ED34()
{
}

void sub_1B5B9ED50()
{
  OUTLINED_FUNCTION_36_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(v4);
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_80();
  v9();
  OUTLINED_FUNCTION_53();
  __swift_instantiateConcreteTypeFromMangledName(v1);
  sub_1B5BC92D0();
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v3, v5);
  OUTLINED_FUNCTION_26_0();
}

void (*sub_1B5B9EE44(void *a1))()
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D949F8);
  v3[4] = v4;
  OUTLINED_FUNCTION_23(v4);
  v3[5] = v5;
  size_t v7 = *(void *)(v6 + 64);
  v3[6] = malloc(v7);
  v3[7] = malloc(v7);
  OUTLINED_FUNCTION_53();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D949F0);
  sub_1B5BC92C0();
  swift_endAccess();
  return sub_1B5B9EF18;
}

void sub_1B5B9EF18()
{
}

void sub_1B5B9EF30()
{
  OUTLINED_FUNCTION_36_1();
  uint64_t v2 = v1;
  uint64_t v3 = *v0;
  uint64_t v4 = *(void **)(*v0 + 48);
  uint64_t v5 = *(void **)(*v0 + 56);
  if (v6)
  {
    uint64_t v7 = *(void *)(v3 + 32);
    uint64_t v8 = *(void *)(v3 + 40);
    OUTLINED_FUNCTION_80();
    v9();
    v2(v4);
    (*(void (**)(void *, uint64_t))(v8 + 8))(v5, v7);
  }
  else
  {
    v1(*(void **)(*v0 + 56));
  }
  free(v5);
  free(v4);
  OUTLINED_FUNCTION_26_0();
  free(v10);
}

uint64_t sub_1B5B9EFEC()
{
  uint64_t v0 = swift_allocObject();
  sub_1B5B9F03C();
  return v0;
}

void sub_1B5B9F03C()
{
  OUTLINED_FUNCTION_18();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D949F0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_24();
  uint64_t v10 = v0 + OBJC_IVAR____TtC17CoreSuggestionsUI24SGSuggestionStoreWrapper__store;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D949E8);
  sub_1B5BC92B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v10, v1, v6);
  OUTLINED_FUNCTION_53();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  id v12 = v5;
  v11(v10, v6);
  sub_1B5BC92B0();
  swift_endAccess();

  *(void *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI24SGSuggestionStoreWrapper_updateSectionHeaders) = v3;
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1B5B9F168()
{
  OUTLINED_FUNCTION_49_2();
  uint64_t v1 = *(uint64_t (**)(unsigned char *))(v0 + 104);
  swift_retain();
  uint64_t v2 = (void (*)(unsigned char *, void))v1(v5);
  *uint64_t v3 = !*v3;
  v2(v5, 0);
  swift_release();
  type metadata accessor for SGSuggestionStoreWrapper(0);
  sub_1B5BA0FC0(&qword_1E9D94A00, (void (*)(uint64_t))type metadata accessor for SGSuggestionStoreWrapper);
  sub_1B5BC9290();
  sub_1B5BC92A0();
  return swift_release();
}

uint64_t sub_1B5B9F26C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D949F0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_38();
  v1();
  swift_release();
  uint64_t v2 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v3 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v2, v3);
}

uint64_t sub_1B5B9F31C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for SGSuggestionStoreWrapper(0);
  uint64_t result = sub_1B5BC9290();
  *a1 = result;
  return result;
}

uint64_t sub_1B5B9F35C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1B5BC9630();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5BA28D4(v2, (uint64_t)v10, &qword_1EB841760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_1B5BC9340();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_1B5BCA060();
    id v14 = sub_1B5BC9990();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v18 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_1B5B7AAF8(0x686353726F6C6F43, 0xEB00000000656D65, &v18);
      _os_log_impl(&dword_1B5B6C000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1BA9A8090](v16, -1, -1);
      MEMORY[0x1BA9A8090](v15, -1, -1);
    }

    sub_1B5BC9620();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

void *sub_1B5B9F5EC()
{
  return &unk_1E612E328;
}

void *sub_1B5B9F5F8()
{
  return &unk_1E612E338;
}

void *sub_1B5B9F604()
{
  return &unk_1E612E348;
}

void sub_1B5B9F610()
{
  uint64_t v1 = (void *)v0[1];
  if (v1) {
    unint64_t v2 = (unint64_t)objc_msgSend(v1, sel_count);
  }
  else {
    unint64_t v2 = 0;
  }
  if (*v0)
  {
    OUTLINED_FUNCTION_49_2();
    uint64_t v4 = (void *)(*(uint64_t (**)(void))(v3 + 96))();
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = objc_msgSend(v4, sel_items);

      sub_1B5B7447C(0, &qword_1E9D94A08);
      unint64_t v7 = sub_1B5BC9FE0();

      if (v7 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = sub_1B5BCA170();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (!(v8 | v2))
      {
        id v9 = objc_msgSend(self, sel_defaultCenter);
        id v10 = (id)OUTLINED_FUNCTION_18_2();
        objc_msgSend(v9, sel_postNotificationName_object_, v10, 0);
      }
    }
  }
}

void sub_1B5B9F798()
{
  id v0 = objc_msgSend(self, sel_defaultCenter);
  id v1 = (id)OUTLINED_FUNCTION_18_2();
  objc_msgSend(v0, sel_postNotificationName_object_, v1, 0);
}

void sub_1B5B9F820()
{
  OUTLINED_FUNCTION_18();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94A10);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v0);
  OUTLINED_FUNCTION_12_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94A18);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94A20);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94A28);
  sub_1B5BA2708(&qword_1E9D94A30, &qword_1E9D94A28);
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  sub_1B5BC9400();
  sub_1B5BA2708(&qword_1E9D94A38, &qword_1E9D94A10);
  sub_1B5BB07A4();
}

void sub_1B5B9F98C()
{
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
  OUTLINED_FUNCTION_17();
}

void sub_1B5B9F9BC()
{
  OUTLINED_FUNCTION_18();
  uint64_t v1 = v0;
  v26[16] = v2;
  v26[17] = sub_1B5BC9340();
  OUTLINED_FUNCTION_0_1();
  v26[15] = v3;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_3();
  v26[14] = v5;
  v26[11] = sub_1B5BCA080();
  OUTLINED_FUNCTION_0_1();
  v26[20] = v6;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_3();
  v26[9] = v8;
  uint64_t v9 = type metadata accessor for SGSuggestionsTableView(0);
  uint64_t v10 = OUTLINED_FUNCTION_23(v9);
  uint64_t v12 = v11;
  uint64_t v14 = *(void *)(v13 + 64);
  v26[4] = v10;
  MEMORY[0x1F4188790](v10);
  v26[8] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94AB8);
  OUTLINED_FUNCTION_0_1();
  v26[6] = v15;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_12_0();
  v26[7] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94A28);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_3();
  v26[5] = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94A20);
  OUTLINED_FUNCTION_0_1();
  v26[12] = v19;
  v26[13] = v20;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_3();
  v26[10] = v21;
  sub_1B5BA2000(v1, (uint64_t)v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v23 = (v22 + 16) & ~v22;
  v26[18] = v22 | 7;
  v26[19] = v23 + v14;
  uint64_t v24 = swift_allocObject();
  v26[3] = v23;
  sub_1B5BA0D28((uint64_t)v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94AC0);
  sub_1B5BA2708(&qword_1E9D94AC8, &qword_1E9D94AC0);
  v26[21] = nullsub_1(sub_1B5BA2068);
  v26[22] = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94AD0);
  sub_1B5BA2708(&qword_1E9D94AD8, &qword_1E9D94AD0);
  sub_1B5BB07C4();
}

void sub_1B5B9FC8C()
{
  swift_release();
  uint64_t v5 = *(int *)(v1 + 48);
  *(void *)(v4 - 256) = v2;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 112) + 16);
  uint64_t v7 = *(void *)(v4 - 200);
  uint64_t v8 = *(void *)(v4 - 184);
  v6(v7, v2 + v5, v8);
  *(void *)(v4 - 264) = v3;
  sub_1B5BA2000(v2, v3);
  uint64_t v9 = swift_allocObject();
  sub_1B5BA0D28(v3, v9 + v0);
  uint64_t v11 = *(void *)(v4 - 232);
  uint64_t v10 = *(void *)(v4 - 224);
  uint64_t v12 = *(void *)(v4 - 208);
  OUTLINED_FUNCTION_80();
  v13();
  uint64_t v14 = *(void *)(v4 - 216);
  v6(v11 + *(int *)(v14 + 52), v7, v8);
  uint64_t v15 = (void (**)())(v11 + *(int *)(v14 + 56));
  *uint64_t v15 = sub_1B5BA2214;
  v15[1] = (void (*)())v9;
  OUTLINED_FUNCTION_38();
  v16();
  (*(void (**)(void, uint64_t))(v10 + 8))(*(void *)(v4 - 272), v12);
  uint64_t v17 = *(void *)(v4 - 264);
  sub_1B5BA2000(*(void *)(v4 - 256), v17);
  uint64_t v18 = swift_allocObject();
  sub_1B5BA0D28(v17, v18 + *(void *)(v4 - 248));
  uint64_t v19 = sub_1B5BA2708(&qword_1E9D94A30, &qword_1E9D94A28);
  sub_1B5BB06A0((uint64_t)sub_1B5BA227C, v18, v14);
  swift_release();
  sub_1B5B7E758(v11, &qword_1E9D94A28);
  uint64_t v20 = *(void *)(v4 - 160);
  sub_1B5B9F35C(v20);
  *(void *)(v4 - 104) = v14;
  *(void *)(v4 - 96) = v19;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_1B5BB06D8(v20, *(void *)(v4 - 176), OpaqueTypeConformance2);
  OUTLINED_FUNCTION_38();
  v22();
  OUTLINED_FUNCTION_38();
  v23();
  OUTLINED_FUNCTION_17();
}

void sub_1B5B9FEDC()
{
  OUTLINED_FUNCTION_18();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94AE0);
  uint64_t v6 = OUTLINED_FUNCTION_19_1(v5);
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_32();
  uint64_t v9 = v7 - v8;
  MEMORY[0x1F4188790](v10);
  id v68 = (char *)v62 - v11;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94AE8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_24();
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94AF0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_16_1();
  uint64_t v16 = type metadata accessor for SGSuggestionsTableView(0);
  uint64_t v17 = OUTLINED_FUNCTION_23(v16);
  uint64_t v70 = v18;
  MEMORY[0x1F4188790](v17);
  uint64_t v71 = v19;
  uint64_t v72 = (uint64_t)v62 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94AF8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v21 = v20;
  MEMORY[0x1F4188790](v22);
  uint64_t v24 = (char *)v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94B00);
  uint64_t v26 = OUTLINED_FUNCTION_19_1(v25);
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_32();
  uint64_t v29 = v27 - v28;
  MEMORY[0x1F4188790](v30);
  uint64_t v67 = (uint64_t)v62 - v31;
  uint64_t v32 = (uint64_t)v2;
  id v33 = *v2;
  uint64_t v69 = v4;
  if (v33)
  {
    OUTLINED_FUNCTION_49_2();
    id v33 = (void *)(*(uint64_t (**)(void))(v34 + 96))();
  }
  uint64_t v35 = sub_1B5B734F8(v33);

  unint64_t v36 = *((void *)v35 + 2);
  if (v36 < 2)
  {
    if (v36 != 1)
    {
      swift_bridgeObjectRelease();
      uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94B08);
      uint64_t v49 = v67;
      __swift_storeEnumTagSinglePayload(v67, 1, 1, v48);
      goto LABEL_12;
    }
    uint64_t v44 = *((void *)v35 + 4);
    unint64_t v43 = *((void *)v35 + 5);
    swift_bridgeObjectRetain();
    uint64_t v45 = swift_bridgeObjectRelease();
    uint64_t v63 = v62;
    MEMORY[0x1F4188790](v45);
    v62[1] = &v62[-6];
    v62[-4] = v32;
    v62[-3] = v44;
    unint64_t v61 = v43;
    if (*(unsigned char *)(v32 + 17))
    {
      uint64_t v46 = 0;
      uint64_t v47 = 0;
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v46 = nullsub_1(v44);
    }
    uint64_t v73 = v46;
    uint64_t v74 = v47;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94B60);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94B68);
    sub_1B5BA245C(&qword_1E9D94B70, &qword_1E9D94B60, (void (*)(void))sub_1B5BA2324);
    sub_1B5BA2370();
    sub_1B5BC9E40();
    swift_bridgeObjectRelease();
    uint64_t v50 = v66;
    OUTLINED_FUNCTION_80();
    v51();
    swift_storeEnumTagMultiPayload();
    sub_1B5BA245C(&qword_1E9D94B90, &qword_1E9D94AF8, (void (*)(void))sub_1B5BA24C8);
    sub_1B5BA24C8();
    sub_1B5BC9830();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v0, v50);
  }
  else
  {
    uint64_t v73 = (uint64_t)v35;
    swift_getKeyPath();
    uint64_t v37 = v72;
    sub_1B5BA2000(v32, v72);
    uint64_t v38 = *(unsigned __int8 *)(v70 + 80);
    uint64_t v63 = (void *)v9;
    uint64_t v39 = (v38 + 16) & ~v38;
    uint64_t v40 = swift_allocObject();
    sub_1B5BA0D28(v37, v40 + v39);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94BA0);
    sub_1B5BA2708(&qword_1E9D947A0, (uint64_t *)&unk_1E9D94BA0);
    unint64_t v61 = sub_1B5BA24C8();
    sub_1B5BC9E30();
    uint64_t v41 = v65;
    OUTLINED_FUNCTION_80();
    v42();
    swift_storeEnumTagMultiPayload();
    sub_1B5BA245C(&qword_1E9D94B90, &qword_1E9D94AF8, (void (*)(void))sub_1B5BA24C8);
    uint64_t v9 = (uint64_t)v63;
    sub_1B5BC9830();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v41);
  }
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94B08);
  __swift_storeEnumTagSinglePayload(v29, 0, 1, v52);
  uint64_t v49 = v67;
  sub_1B5BA2588(v29, v67);
LABEL_12:
  uint64_t v54 = (uint64_t)v68;
  uint64_t v53 = v69;
  if (*(unsigned char *)(v32 + 16) == 1)
  {
    uint64_t v55 = v72;
    sub_1B5BA2000(v32, v72);
    unint64_t v56 = (*(unsigned __int8 *)(v70 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80);
    uint64_t v57 = swift_allocObject();
    sub_1B5BA0D28(v55, v57 + v56);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94B20);
    sub_1B5B7DEC0();
    sub_1B5BC9D70();
    uint64_t v58 = 0;
  }
  else
  {
    uint64_t v58 = 1;
  }
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94B10);
  __swift_storeEnumTagSinglePayload(v54, v58, 1, v59);
  sub_1B5BA28D4(v49, v29, &qword_1E9D94B00);
  sub_1B5BA28D4(v54, v9, &qword_1E9D94AE0);
  sub_1B5BA28D4(v29, v53, &qword_1E9D94B00);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94B18);
  sub_1B5BA28D4(v9, v53 + *(int *)(v60 + 48), &qword_1E9D94AE0);
  sub_1B5B7E758(v54, &qword_1E9D94AE0);
  sub_1B5B7E758(v49, &qword_1E9D94B00);
  sub_1B5B7E758(v9, &qword_1E9D94AE0);
  sub_1B5B7E758(v29, &qword_1E9D94B00);
  OUTLINED_FUNCTION_17();
}

void sub_1B5BA067C()
{
  OUTLINED_FUNCTION_18();
  uint64_t v1 = v0;
  v27[0] = sub_1B5B72B30();
  v27[1] = v2;
  sub_1B5B744B8();
  uint64_t v3 = sub_1B5BC9B30();
  uint64_t v5 = v4;
  char v7 = v6 & 1;
  sub_1B5B77E9C();
  swift_retain();
  uint64_t v8 = sub_1B5BC9AF0();
  uint64_t v10 = v9;
  char v12 = v11;
  uint64_t v14 = v13;
  swift_release();
  sub_1B5B7B664(v3, v5, v7);
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_1B5BC9E90();
  sub_1B5B77EE8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, v15, v16, v8, v10, v12 & 1, v14);
  sub_1B5B7B664(v8, v10, v12 & 1);
  swift_bridgeObjectRelease();
  memcpy(v27, __src, sizeof(v27));
  sub_1B5B7271C();
  sub_1B5BC9E80();
  sub_1B5BC93C0();
  uint64_t v17 = v21;
  LOBYTE(v5) = v22;
  uint64_t v18 = v23;
  char v19 = v24;
  *(_DWORD *)(v1 + 153) = __src[0];
  *(_DWORD *)(v1 + 156) = *(_DWORD *)((char *)__src + 3);
  *(_DWORD *)(v1 + 169) = v26[0];
  *(_DWORD *)(v1 + 172) = *(_DWORD *)((char *)v26 + 3);
  memcpy((void *)v1, v27, 0x90uLL);
  *(void *)(v1 + 144) = v17;
  *(unsigned char *)(v1 + 152) = v5;
  *(void *)(v1 + 16sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v18;
  *(unsigned char *)(v1 + 168) = v19;
  *(_OWORD *)(v1 + 176) = v25;
  *(unsigned char *)(v1 + 192) = 0;
  OUTLINED_FUNCTION_17();
}

void sub_1B5BA0864()
{
  OUTLINED_FUNCTION_36_1();
  uint64_t v1 = v0;
  unint64_t v2 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x230))();
  if (!v2
    || (v2 >> 62 ? (uint64_t v3 = sub_1B5BCA170()) : (uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)),
        swift_bridgeObjectRelease(),
        !v3))
  {
    OUTLINED_FUNCTION_4_0();
    unint64_t v5 = (*(uint64_t (**)(void))(v4 + 392))();
    if (v5)
    {
      if (v5 >> 62) {
        sub_1B5BCA170();
      }
      swift_bridgeObjectRelease();
    }
  }
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(void))(v6 + 320))();
  if (v7) {
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_4_0();
  uint64_t v9 = (void *)(*(uint64_t (**)(void))(v8 + 440))();
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v10 = v9;
  if ((objc_msgSend(v9, sel_respondsToSelector_, sel_suggestionListSupportsDismissal) & 1) == 0)
  {
    if (objc_msgSend(v10, sel_respondsToSelector_, sel_suggestionDismissAction))
    {
      id v12 = objc_msgSend((id)swift_unknownObjectRetain(), sel_performSelector_, sel_suggestionDismissAction);
      id v13 = v10;
      if (v12)
      {

LABEL_22:
        swift_unknownObjectRelease();
        goto LABEL_26;
      }
      if (objc_msgSend(v13, sel_respondsToSelector_, sel_suggestionDismissAction))
      {

        swift_unknownObjectRelease_n();
        goto LABEL_26;
      }
    }
    swift_unknownObjectRelease();

    goto LABEL_26;
  }
  if ((objc_msgSend(v10, sel_respondsToSelector_, sel_suggestionList) & 1) == 0)
  {
    swift_unknownObjectRelease();
LABEL_20:

    goto LABEL_26;
  }
  id v11 = objc_msgSend((id)swift_unknownObjectRetain(), sel_suggestionList);
  if ((objc_msgSend(v11, sel_respondsToSelector_, sel_suggestionListSupportsDismissal) & 1) == 0)
  {
    swift_unknownObjectRelease_n();

    goto LABEL_22;
  }
  objc_msgSend(v11, sel_suggestionListSupportsDismissal);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease_n();

LABEL_26:
  OUTLINED_FUNCTION_26_0();
}

id sub_1B5BA0B84(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v6 = v5;
  if (a2)
  {
    uint64_t v10 = (void *)sub_1B5BC9F00();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = a4[3];
  if (v11)
  {
    id v12 = __swift_project_boxed_opaque_existential_0(a4, a4[3]);
    uint64_t v13 = *(void *)(v11 - 8);
    MEMORY[0x1F4188790](v12);
    uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    uint64_t v16 = sub_1B5BCA1A0();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a4);
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = objc_msgSend(v6, sel_initWithTitle_style_target_action_, v10, a3, v16, a5);

  swift_unknownObjectRelease();
  return v17;
}

uint64_t type metadata accessor for SGSuggestionsTableView(uint64_t a1)
{
  return sub_1B5B7B630(a1, qword_1EB842210);
}

uint64_t sub_1B5BA0D28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SGSuggestionsTableView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B5BA0D8C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SGSuggestionsTableView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B5BA0DE8(void *a1)
{
  id v2 = objc_msgSend(a1, sel_listTitle);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_1B5BC9F40();

  return v3;
}

void sub_1B5BA0E58(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setTitle_, v4);
}

uint64_t type metadata accessor for SectionHeadersUpdateModel(uint64_t a1)
{
  return sub_1B5B7B630(a1, (uint64_t *)&unk_1E9D95E00);
}

uint64_t sub_1B5BA0EDC()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B5BA0F14()
{
  swift_beginAccess();
  uint64_t v1 = (void *)MEMORY[0x1BA9A8120](v0 + 16);
  if (v1)
  {
    id v2 = v1;
    (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x138))();
  }
}

uint64_t type metadata accessor for SGSuggestionStoreWrapper(uint64_t a1)
{
  return sub_1B5B7B630(a1, qword_1E9D95E10);
}

uint64_t sub_1B5BA0FC0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1B5BA1008()
{
}

uint64_t sub_1B5BA1014()
{
  return swift_getOpaqueTypeConformance2();
}

void destroy for SGSuggestionTableControllerRepresentable(uint64_t a1)
{
  swift_release();
  swift_release();
  id v2 = *(void **)(a1 + 24);
}

uint64_t initializeWithCopy for SGSuggestionTableControllerRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  id v4 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v4;
  swift_retain();
  swift_retain();
  id v5 = v4;
  return a1;
}

uint64_t assignWithCopy for SGSuggestionTableControllerRepresentable(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  id v4 = *(void **)(a2 + 24);
  id v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  id v6 = v4;

  return a1;
}

uint64_t assignWithTake for SGSuggestionTableControllerRepresentable(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  id v4 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for SGSuggestionTableControllerRepresentable(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
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

uint64_t storeEnumTagSinglePayload for SGSuggestionTableControllerRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SGSuggestionTableControllerRepresentable()
{
  return &type metadata for SGSuggestionTableControllerRepresentable;
}

uint64_t method lookup function for SGSuggestionTableController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SGSuggestionTableController);
}

uint64_t dispatch thunk of SGSuggestionTableController.__allocating_init(store:delegate:suggestionPresenter:suggestionList:)()
{
  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of SGSuggestionTableController.update(suggestionStore:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of SGSuggestionTableController.present(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of SGSuggestionTableController.dismiss(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x128))();
}

uint64_t sub_1B5BA130C()
{
  return type metadata accessor for SectionHeadersUpdateModel(0);
}

void sub_1B5BA1314()
{
  sub_1B5BA13BC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for SectionHeadersUpdateModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SectionHeadersUpdateModel);
}

void sub_1B5BA13BC()
{
  if (!qword_1EB841998)
  {
    unint64_t v0 = sub_1B5BC9310();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB841998);
    }
  }
}

uint64_t sub_1B5BA1408()
{
  return type metadata accessor for SGSuggestionStoreWrapper(0);
}

void sub_1B5BA1410()
{
  sub_1B5BA148C();
  if (v1 <= 0x3F)
  {
    OUTLINED_FUNCTION_9(v0);
    swift_updateClassMetadata2();
  }
}

void sub_1B5BA148C()
{
  if (!qword_1E9D94AA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D949E8);
    unint64_t v0 = sub_1B5BC9310();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9D94AA0);
    }
  }
}

void sub_1B5BA14E8()
{
  OUTLINED_FUNCTION_36_1();
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_6_0();
  int v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *v4;
  *uint64_t v3 = *v4;
  if ((v6 & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_39_1();
    swift_retain();
  }
  else
  {
    uint64_t v8 = (void *)v4[1];
    v3[1] = (uint64_t)v8;
    OUTLINED_FUNCTION_37_1(v7, (uint64_t)v4);
    id v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
    if (OUTLINED_FUNCTION_19() == 1)
    {
      sub_1B5BC9340();
      OUTLINED_FUNCTION_1_0();
      uint64_t v10 = OUTLINED_FUNCTION_23_3();
      v11(v10);
    }
    else
    {
      *unint64_t v0 = *v1;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    OUTLINED_FUNCTION_16_5();
    OUTLINED_FUNCTION_1_0();
    uint64_t v13 = *(void (**)(uint64_t))(v12 + 16);
    swift_retain();
    uint64_t v14 = OUTLINED_FUNCTION_52_2();
    v13(v14);
  }
  OUTLINED_FUNCTION_26_0();
}

uint64_t sub_1B5BA15F4(uint64_t a1, uint64_t a2)
{
  swift_release();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1B5BC9340();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_38();
    v4();
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 40);
  sub_1B5BCA080();
  OUTLINED_FUNCTION_1_0();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v8(v5, v6);
}

void sub_1B5BA16E4()
{
  OUTLINED_FUNCTION_36_1();
  OUTLINED_FUNCTION_20_3();
  uint64_t v4 = *v3;
  uint64_t v5 = (void *)v3[1];
  *unint64_t v0 = *v3;
  v0[1] = (uint64_t)v5;
  OUTLINED_FUNCTION_37_1(v4, (uint64_t)v3);
  id v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
  if (OUTLINED_FUNCTION_19() == 1)
  {
    sub_1B5BC9340();
    OUTLINED_FUNCTION_1_0();
    uint64_t v7 = OUTLINED_FUNCTION_23_3();
    v8(v7);
  }
  else
  {
    *uint64_t v1 = *v2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_16_5();
  OUTLINED_FUNCTION_1_0();
  uint64_t v10 = *(void (**)(uint64_t))(v9 + 16);
  swift_retain();
  uint64_t v11 = OUTLINED_FUNCTION_52_2();
  v10(v11);
  OUTLINED_FUNCTION_26_0();
}

void *sub_1B5BA17BC()
{
  OUTLINED_FUNCTION_20_3();
  *unint64_t v0 = *v3;
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)v0[1];
  uint64_t v5 = *(void **)(v1 + 8);
  v0[1] = v5;
  id v6 = v5;

  OUTLINED_FUNCTION_28_2();
  if (!v7)
  {
    uint64_t v8 = *(int *)(v2 + 32);
    uint64_t v9 = (void *)((char *)v0 + v8);
    uint64_t v10 = (void *)(v1 + v8);
    sub_1B5B7E758((uint64_t)v0 + v8, &qword_1EB841760);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
    if (OUTLINED_FUNCTION_19() == 1)
    {
      sub_1B5BC9340();
      OUTLINED_FUNCTION_1_0();
      uint64_t v11 = OUTLINED_FUNCTION_23_3();
      v12(v11);
    }
    else
    {
      *uint64_t v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v13 = *(int *)(v2 + 36);
  uint64_t v14 = (void *)((char *)v0 + v13);
  uint64_t v15 = (void *)(v1 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_47_1();
  OUTLINED_FUNCTION_1_0();
  uint64_t v16 = OUTLINED_FUNCTION_35();
  v17(v16);
  return v0;
}

uint64_t sub_1B5BA18F8()
{
  OUTLINED_FUNCTION_20_3();
  *(_OWORD *)uint64_t v4 = *(_OWORD *)v3;
  *(_WORD *)(v4 + 16) = *(_WORD *)(v3 + 16);
  uint64_t v6 = *(int *)(v5 + 32);
  char v7 = (void *)(v4 + v6);
  uint64_t v8 = (const void *)(v3 + v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1B5BC9340();
    OUTLINED_FUNCTION_1_0();
    uint64_t v10 = OUTLINED_FUNCTION_14_1();
    v11(v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  *(_OWORD *)(v0 + *(int *)(v2 + 36)) = *(_OWORD *)(v1 + *(int *)(v2 + 36));
  sub_1B5BCA080();
  OUTLINED_FUNCTION_1_0();
  uint64_t v12 = OUTLINED_FUNCTION_35();
  v13(v12);
  return v0;
}

void *sub_1B5BA1A08()
{
  OUTLINED_FUNCTION_20_3();
  *uint64_t v0 = *v3;
  swift_release();
  uint64_t v4 = (void *)v0[1];
  v0[1] = *(void *)(v1 + 8);

  OUTLINED_FUNCTION_28_2();
  if (!v5)
  {
    uint64_t v6 = *(int *)(v2 + 32);
    char v7 = (char *)v0 + v6;
    uint64_t v8 = (const void *)(v1 + v6);
    sub_1B5B7E758((uint64_t)v0 + v6, &qword_1EB841760);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_1B5BC9340();
      OUTLINED_FUNCTION_1_0();
      uint64_t v10 = OUTLINED_FUNCTION_14_1();
      v11(v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  uint64_t v12 = *(int *)(v2 + 36);
  uint64_t v13 = (void *)((char *)v0 + v12);
  uint64_t v14 = (uint64_t *)(v1 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_release();
  OUTLINED_FUNCTION_47_1();
  OUTLINED_FUNCTION_1_0();
  uint64_t v17 = OUTLINED_FUNCTION_35();
  v18(v17);
  return v0;
}

uint64_t sub_1B5BA1B44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B5BA1B58);
}

uint64_t sub_1B5BA1B58(uint64_t a1, uint64_t a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94410);
  OUTLINED_FUNCTION_6_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a3[8];
LABEL_8:
    return __swift_getEnumTagSinglePayload(a1 + v9, a2, v8);
  }
  if (a2 != 0x7FFFFFFF)
  {
    uint64_t v8 = sub_1B5BCA080();
    uint64_t v9 = a3[10];
    goto LABEL_8;
  }
  unint64_t v10 = *(void *)(a1 + a3[9] + 8);
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v1sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = -1;
  }
  return (v10 + 1);
}

uint64_t sub_1B5BA1C14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B5BA1C28);
}

void sub_1B5BA1C28(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94410);
  OUTLINED_FUNCTION_6_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a4[8];
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + a4[9] + 8) = (a2 - 1);
      return;
    }
    uint64_t v10 = sub_1B5BCA080();
    uint64_t v11 = a4[10];
  }
  __swift_storeEnumTagSinglePayload(a1 + v11, a2, a2, v10);
}

void sub_1B5BA1CE0()
{
  sub_1B5BA1DC8();
  if (v0 <= 0x3F)
  {
    sub_1B5BCA080();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1B5BA1DC8()
{
  if (!qword_1EB841768)
  {
    sub_1B5BC9340();
    unint64_t v0 = sub_1B5BC9360();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB841768);
    }
  }
}

uint64_t getEnumTagSinglePayload for SGSuggestionsTableCellModel(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v3 = -1;
    return (v3 + 1);
  }
  if (a2 >= 0xFF)
  {
    if ((a2 + 33554177) >> 24)
    {
      int v2 = *((unsigned __int8 *)a1 + 3);
      if (*((unsigned char *)a1 + 3)) {
        goto LABEL_5;
      }
    }
    else
    {
      int v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3))
      {
LABEL_5:
        int v3 = (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776962;
        return (v3 + 1);
      }
    }
  }
  unsigned int v4 = *(unsigned __int8 *)a1;
  BOOL v5 = v4 >= 2;
  int v3 = (v4 + 2147483646) & 0x7FFFFFFF;
  if (!v5) {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for SGSuggestionsTableCellModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if ((a3 + 33554177) >> 24) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3 <= 0xFE) {
    int v3 = 0;
  }
  if (a2 > 0xFE)
  {
    *(_WORD *)uint64_t result = a2 - 255;
    *(unsigned char *)(result + 2) = (a2 - 255) >> 16;
    if (v3)
    {
      unsigned int v4 = ((a2 - 255) >> 24) + 1;
      if (v3 == 2) {
        *(_WORD *)(result + 3) = v4;
      }
      else {
        *(unsigned char *)(result + 3) = v4;
      }
    }
  }
  else
  {
    if (!v3) {
      goto LABEL_10;
    }
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2) {
        return result;
      }
LABEL_16:
      *(unsigned char *)uint64_t result = a2 + 1;
      return result;
    }
    *(unsigned char *)(result + 3) = 0;
    if (a2) {
      goto LABEL_16;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SGSuggestionsTableCellModel()
{
  return &type metadata for SGSuggestionsTableCellModel;
}

uint64_t sub_1B5BA1F34()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1B5BA1FB4()
{
  unint64_t result = qword_1E9D94AB0;
  if (!qword_1E9D94AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94AB0);
  }
  return result;
}

uint64_t sub_1B5BA2000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SGSuggestionsTableView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1B5BA2068()
{
  uint64_t v0 = OUTLINED_FUNCTION_42_2();
  OUTLINED_FUNCTION_9(v0);
  OUTLINED_FUNCTION_39_1();
  sub_1B5B9FEDC();
}

uint64_t objectdestroy_31Tm()
{
  OUTLINED_FUNCTION_36_1();
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(type metadata accessor for SGSuggestionsTableView(0) - 8) + 80);
  swift_release();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1B5BC9340();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_38();
    v2();
  }
  else
  {
    swift_release();
  }
  swift_release();
  sub_1B5BCA080();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_38();
  v3();
  OUTLINED_FUNCTION_26_0();
  return MEMORY[0x1F4186498](v4, v5, v6);
}

void sub_1B5BA2214()
{
  uint64_t v1 = type metadata accessor for SGSuggestionsTableView(0);
  OUTLINED_FUNCTION_9(v1);
  OUTLINED_FUNCTION_39_1();
  if (*(void *)(v0 + v2))
  {
    OUTLINED_FUNCTION_49_2();
    (*(void (**)(void))(v3 + 176))();
  }
  sub_1B5B9F610();
}

void sub_1B5BA227C()
{
}

void sub_1B5BA22A0()
{
  uint64_t v1 = type metadata accessor for SGSuggestionsTableView(0);
  OUTLINED_FUNCTION_9(v1);
  OUTLINED_FUNCTION_39_1();
  uint64_t v3 = *(void **)(v0 + v2 + 8);
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v4, sel_dismissAllSuggestions);
    sub_1B5B9F610();
  }
}

unint64_t sub_1B5BA2324()
{
  unint64_t result = qword_1E9D94B78;
  if (!qword_1E9D94B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94B78);
  }
  return result;
}

unint64_t sub_1B5BA2370()
{
  unint64_t result = qword_1E9D94B80;
  if (!qword_1E9D94B80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94B68);
    sub_1B5BA2410();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94B80);
  }
  return result;
}

unint64_t sub_1B5BA2410()
{
  unint64_t result = qword_1E9D94B88;
  if (!qword_1E9D94B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94B88);
  }
  return result;
}

uint64_t sub_1B5BA245C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1B5BA24C8()
{
  unint64_t result = qword_1E9D94B98;
  if (!qword_1E9D94B98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94AE8);
    sub_1B5BA245C(&qword_1E9D94B70, &qword_1E9D94B60, (void (*)(void))sub_1B5BA2324);
    sub_1B5BA2370();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94B98);
  }
  return result;
}

uint64_t sub_1B5BA2588(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94B00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B5BA25F4(uint64_t *a1)
{
  OUTLINED_FUNCTION_42_2();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_39_1();
  uint64_t v4 = v1 + v3;
  uint64_t v5 = *a1;
  if ((*(unsigned char *)(v4 + 17) & 1) == 0)
  {
    swift_bridgeObjectRetain();
    nullsub_1(v5);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94B60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94B68);
  sub_1B5BA245C(&qword_1E9D94B70, &qword_1E9D94B60, (void (*)(void))sub_1B5BA2324);
  sub_1B5BA2370();
  return sub_1B5BC9E40();
}

uint64_t sub_1B5BA2708(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B5BA274C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1[2];
  if (*(void *)v3 && (uint64_t v4 = *(void **)(v3 + 8)) != 0)
  {
    uint64_t v6 = v1[3];
    uint64_t v5 = v1[4];
    char v7 = *(unsigned char *)(v3 + 17);
    swift_retain_n();
    id v8 = v4;
    swift_bridgeObjectRetain();
    sub_1B5B755BC(v6, v5, (uint64_t)v8, v7, (uint64_t)&v13);
    unint64_t v9 = sub_1B5BA2410();
    sub_1B5B7A984(v7, (uint64_t)&unk_1F0ED0D08, v9);

    swift_release();
    sub_1B5BA2890((uint64_t)&v13);
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94BB0);
    return __swift_storeEnumTagSinglePayload(a1, 0, 1, v10);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94BB0);
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v12);
  }
}

uint64_t sub_1B5BA2890(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  swift_release();

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1B5BA28D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1_0();
  uint64_t v4 = OUTLINED_FUNCTION_43();
  v5(v4);
  return a2;
}

uint64_t sub_1B5BA2960()
{
  OUTLINED_FUNCTION_1();
  return MEMORY[0x1BA9A8120](v0);
}

uint64_t sub_1B5BA29F8()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_1B5BA2A3C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x78))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5BA2A98(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x80);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

void (*sub_1B5BA2AFC(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC17CoreSuggestionsUI20SGReminderSuggestion_suggestionDelegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  OUTLINED_FUNCTION_41();
  swift_beginAccess();
  v3[3] = MEMORY[0x1BA9A8120](v5);
  return sub_1B5B7FEBC;
}

id sub_1B5BA2B7C()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  return v1;
}

void sub_1B5BA2BC0(void *a1)
{
  OUTLINED_FUNCTION_2();
  uint64_t v3 = *v1;
  *uint64_t v1 = a1;
}

uint64_t (*sub_1B5BA2C00())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B5BA2C48()
{
  return OUTLINED_FUNCTION_6_4();
}

uint64_t sub_1B5BA2C88(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_2();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B5BA2CD4())()
{
  return j__swift_endAccess;
}

id SGReminderSuggestion.__allocating_init(realtimeReminder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SGReminderSuggestion.init(realtimeReminder:)(a1);
}

id SGReminderSuggestion.init(realtimeReminder:)(void *a1)
{
  uint64_t v3 = sub_1B5BC9230();
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_65();
  uint64_t v9 = v8 - v7;
  swift_unknownObjectWeakInit();
  uint64_t v10 = (uint64_t *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI20SGReminderSuggestion_reminderNotes];
  *uint64_t v10 = 0;
  v10[1] = 0;
  uint64_t v11 = v1;
  id result = objc_msgSend(a1, sel_reminder);
  if (result)
  {
    *(void *)&v11[OBJC_IVAR____TtC17CoreSuggestionsUI20SGReminderSuggestion_reminder] = result;
    sub_1B5BA4E7C(a1, (SEL *)&selRef_notes);
    uint64_t v14 = v13;
    swift_bridgeObjectRelease();
    if (v14)
    {
      uint64_t v15 = sub_1B5BA4E7C(a1, (SEL *)&selRef_notes);
      uint64_t v17 = v16;
      swift_beginAccess();
      *uint64_t v10 = v15;
      v10[1] = v17;
      swift_bridgeObjectRelease();
    }
    sub_1B5B729C0();
    swift_bridgeObjectRetain();
    sub_1B5BC9220();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(&v11[OBJC_IVAR____TtC17CoreSuggestionsUI20SGReminderSuggestion_logger], v9, v3);
    id v18 = objc_msgSend(self, sel_currentDevice);
    id v19 = objc_msgSend(v18, sel_userInterfaceIdiom);

    v11[OBJC_IVAR____TtC17CoreSuggestionsUI20SGReminderSuggestion_bannerForVisionDevice] = v19 == (id)6;
    v21.receiver = v11;
    v21.super_class = (Class)type metadata accessor for SGReminderSuggestion();
    id v20 = objc_msgSendSuper2(&v21, sel_init);

    return v20;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1B5BA2FC8()
{
  sub_1B5B7447C(0, &qword_1E9D94BD8);
  OUTLINED_FUNCTION_72();
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(v0 + 144))();
  id v2 = objc_msgSend(v1, sel_title);

  uint64_t v3 = sub_1B5BC9F40();
  uint64_t v5 = v4;

  return sub_1B5BA3B0C(v3, v5, (SEL *)&selRef_initWithString_);
}

id sub_1B5BA30C8()
{
  OUTLINED_FUNCTION_72();
  (*(void (**)(void))(v0 + 168))();
  if (!v1) {
    return 0;
  }
  OUTLINED_FUNCTION_13_2();
  sub_1B5B7447C(0, &qword_1E9D94BD8);
  uint64_t v2 = OUTLINED_FUNCTION_43();
  return sub_1B5BA3B0C(v2, v3, v4);
}

uint64_t sub_1B5BA323C@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_72();
  uint64_t v3 = (void *)(*(uint64_t (**)(void))(v2 + 144))();
  id v4 = objc_msgSend(v3, sel_dueDateComponents);

  if (v4)
  {
    sub_1B5BC9060();

    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 1;
  }
  uint64_t v6 = sub_1B5BC9070();
  return __swift_storeEnumTagSinglePayload(a1, v5, 1, v6);
}

id sub_1B5BA3340()
{
  uint64_t v1 = sub_1B5BC9190();
  uint64_t v2 = OUTLINED_FUNCTION_19_1(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_72();
  id v4 = *(uint64_t (**)(void))(v3 + 144);
  uint64_t v5 = (void *)v4();
  id v6 = objc_msgSend(v5, sel_dueLocation);

  if (!v6) {
    return 0;
  }
  sub_1B5B7447C(0, &qword_1E9D94BE0);
  objc_msgSend(v6, sel_latitude);
  CLLocationDegrees v8 = v7;
  objc_msgSend(v6, sel_longitude);
  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(v8, v9);
  objc_msgSend(v6, sel_accuracy);
  double v12 = v11;
  objc_msgSend(v6, sel_accuracy);
  double v14 = v13;
  OUTLINED_FUNCTION_10_2();
  uint64_t v15 = (void *)v4();
  id v16 = objc_msgSend(v15, sel_creationDate);

  sub_1B5BC9180();
  id v17 = sub_1B5BA34F0(v0, v10.latitude, v10.longitude, 0.0, v12, v14);

  return v17;
}

id sub_1B5BA34F0(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  id v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  double v13 = (void *)sub_1B5BC9170();
  id v14 = objc_msgSend(v12, sel_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_, v13, a2, a3, a4, a5, a6);

  uint64_t v15 = sub_1B5BC9190();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(a1, v15);
  return v14;
}

uint64_t sub_1B5BA3640()
{
  OUTLINED_FUNCTION_72();
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(v0 + 144))();
  id v2 = objc_msgSend(v1, sel_dueLocation);

  if (v2)
  {
    id v3 = objc_msgSend(v2, sel_label);
    if (v3)
    {
      id v4 = v3;
      sub_1B5BC9F40();
    }
  }
  return OUTLINED_FUNCTION_41();
}

uint64_t sub_1B5BA37D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1B5BC9140();
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v2);
}

void sub_1B5BA3864()
{
  OUTLINED_FUNCTION_72();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 144);
  uint64_t v2 = (void *)v1();
  id v3 = objc_msgSend(v2, sel_sourceURL);

  if (v3)
  {
    OUTLINED_FUNCTION_10_2();
    id v4 = (void *)v1();
    id v5 = objc_msgSend(v4, sel_origin);

    id v6 = objc_msgSend(v5, sel_type);
    if (v6 == (id)1
      || (OUTLINED_FUNCTION_10_2(),
          double v7 = (void *)v1(),
          id v8 = objc_msgSend(v7, sel_origin),
          v7,
          id v9 = objc_msgSend(v8, sel_type),
          v8,
          v9 == (id)4))
    {
      sub_1B5B7447C(0, &qword_1E9D94BE8);
      uint64_t v10 = sub_1B5BC9F40();
      id v12 = sub_1B5BA3B0C(v10, v11, (SEL *)&selRef_initWithActivityType_);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94BF0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1B5BCD260;
      uint64_t v14 = MEMORY[0x1E4FBB1A0];
      sub_1B5BCA100();
      uint64_t v15 = sub_1B5BA4E7C(v3, (SEL *)&selRef_absoluteString);
      *(void *)(inited + 96) = v14;
      if (v16) {
        uint64_t v17 = v15;
      }
      else {
        uint64_t v17 = 0;
      }
      unint64_t v18 = 0xE000000000000000;
      if (v16) {
        unint64_t v18 = v16;
      }
      *(void *)(inited + 72) = v17;
      *(void *)(inited + 8sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v18;
      uint64_t v19 = sub_1B5BC9ED0();
      sub_1B5BA4A94(v19, v12);
    }
    else
    {
    }
  }
  else
  {
    __break(1u);
  }
}

id sub_1B5BA3B0C(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v5 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, *a3, v5);

  return v6;
}

uint64_t sub_1B5BA3B88()
{
  return 1;
}

uint64_t sub_1B5BA3BC4()
{
  OUTLINED_FUNCTION_72();
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(v0 + 144))();
  unsigned int v2 = objc_msgSend(v1, sel_dueLocationTrigger);

  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

void sub_1B5BA3C3C(uint64_t a1, char a2)
{
  id v5 = v2;
  id v6 = sub_1B5BC9210();
  os_log_type_t v7 = sub_1B5BCA070();
  BOOL v8 = os_log_type_enabled(v6, v7);
  id v9 = (void *)MEMORY[0x1E4FBC8C8];
  if (v8)
  {
    uint64_t v10 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v11 = (void *)(*(uint64_t (**)(void))((*v9 & *v5) + 0x90))();
    id v12 = objc_msgSend(v11, sel_loggingIdentifier);

    uint64_t v13 = sub_1B5BC9F40();
    uint64_t v23 = a1;
    unint64_t v15 = v14;

    sub_1B5B7AAF8(v13, v15, aBlock);
    sub_1B5BCA0C0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    if (a2) {
      uint64_t v16 = 32;
    }
    else {
      uint64_t v16 = 7630670;
    }
    if (a2) {
      unint64_t v17 = 0xE100000000000000;
    }
    else {
      unint64_t v17 = 0xE300000000000000;
    }
    sub_1B5B7AAF8(v16, v17, aBlock);
    sub_1B5BCA0C0();
    a1 = v23;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B5B6C000, v6, v7, "SGReminderSuggestion - SGReminder %s ViewController dismissed. %s confirming reminder", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {
  }
  objc_msgSend(v5, sel_dismissViewController_finished_, a1, a2 & 1);
  if (a2)
  {
    id v18 = objc_msgSend(self, sel_serviceForReminders);
    uint64_t v19 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v5) + 0x90))();
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v5;
    aBlock[4] = (uint64_t)sub_1B5BA4B4C;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1B5B8CB28;
    aBlock[3] = (uint64_t)&block_descriptor_3;
    objc_super v21 = _Block_copy(aBlock);
    char v22 = v5;
    swift_release();
    objc_msgSend(v18, sel_confirmRealtimeReminder_withCompletion_, v19, v21);
    _Block_release(v21);
    swift_unknownObjectRelease();
  }
}

uint64_t sub_1B5BA4010()
{
  return OUTLINED_FUNCTION_41();
}

id sub_1B5BA408C()
{
  id v0 = objc_msgSend(self, sel_spotlightIconImageWithBundleIdentifier_, *MEMORY[0x1E4F5DC58]);
  return v0;
}

uint64_t sub_1B5BA40D8()
{
  uint64_t v1 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v2 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x130))();
  uint64_t v4 = v3;
  (*(void (**)(void))((*v1 & *v0) + 0x138))();
  OUTLINED_FUNCTION_13_2();
  if (v4 && v0)
  {
    sub_1B5B72B30();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1B5BCC700;
    uint64_t v6 = MEMORY[0x1E4FBB1A0];
    *(void *)(v5 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v7 = sub_1B5B8D86C();
    *(void *)(v5 + 32) = v2;
    *(void *)(v5 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v4;
    *(void *)(v5 + 96) = v6;
    *(void *)(v5 + 104) = v7;
    *(void *)(v5 + 64) = v7;
    *(void *)(v5 + 72) = v1;
    *(void *)(v5 + 8sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v0;
    sub_1B5BC9F10();
    OUTLINED_FUNCTION_13_2();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return OUTLINED_FUNCTION_43();
}

uint64_t sub_1B5BA423C()
{
  OUTLINED_FUNCTION_72();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 144);
  uint64_t v2 = (void *)v1();
  id v3 = objc_msgSend(v2, sel_dueLocation);

  if (!v3) {
    return 0;
  }
  uint64_t v4 = (void *)v1();
  unsigned int v5 = objc_msgSend(v4, sel_dueLocationTrigger);

  if (!v5) {
    goto LABEL_7;
  }
  if (v5 != 2)
  {
    if (v5 == 1)
    {
      sub_1B5B72B30();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
      uint64_t v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_1B5BCD260;
      uint64_t result = sub_1B5BA4E7C(v3, (SEL *)&selRef_label);
      if (!v8)
      {
        __break(1u);
        goto LABEL_7;
      }
LABEL_10:
      uint64_t v10 = result;
      uint64_t v11 = v8;
      *(void *)(v6 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v6 + 64) = sub_1B5B8D86C();
      *(void *)(v6 + 32) = v10;
      *(void *)(v6 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v11;
      uint64_t v9 = sub_1B5BC9F10();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9;
    }
LABEL_7:

    return 0;
  }
  sub_1B5B72B30();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1B5BCD260;
  uint64_t result = sub_1B5BA4E7C(v3, (SEL *)&selRef_label);
  if (v8) {
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

id sub_1B5BA4424()
{
  uint64_t v55 = sub_1B5BC9190();
  OUTLINED_FUNCTION_0_1();
  uint64_t v50 = v0;
  MEMORY[0x1F4188790](v1);
  OUTLINED_FUNCTION_65();
  uint64_t v49 = v3 - v2;
  sub_1B5BC91F0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v51 = v5;
  uint64_t v52 = v4;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_65();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94C50);
  uint64_t v7 = OUTLINED_FUNCTION_19_1(v6);
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  uint64_t v53 = (uint64_t)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v56 = (uint64_t)&v47 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94C00);
  uint64_t v12 = OUTLINED_FUNCTION_19_1(v11);
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_65();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = sub_1B5BC9070();
  OUTLINED_FUNCTION_0_1();
  uint64_t v18 = v17;
  uint64_t v20 = MEMORY[0x1F4188790](v19);
  char v22 = (char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v54 = (char *)&v47 - v23;
  OUTLINED_FUNCTION_72();
  long long v25 = *(uint64_t (**)(void))(v24 + 144);
  uint64_t v26 = (void *)v25();
  id v27 = objc_msgSend(v26, sel_dueDateComponents);

  if (!v27)
  {
    __swift_storeEnumTagSinglePayload(v15, 1, 1, v16);
    goto LABEL_6;
  }
  sub_1B5BC9060();

  uint64_t v48 = v18;
  uint64_t v28 = *(void (**)(uint64_t, char *, uint64_t))(v18 + 32);
  v28(v15, v22, v16);
  __swift_storeEnumTagSinglePayload(v15, 0, 1, v16);
  if (__swift_getEnumTagSinglePayload(v15, 1, v16) == 1)
  {
LABEL_6:
    unint64_t v36 = (uint64_t *)&unk_1E9D94C00;
    uint64_t v35 = v15;
    goto LABEL_7;
  }
  uint64_t v29 = v54;
  v28((uint64_t)v54, (char *)v15, v16);
  sub_1B5BC91E0();
  uint64_t v30 = v56;
  sub_1B5BC91D0();
  OUTLINED_FUNCTION_38();
  v31();
  uint64_t v32 = v53;
  sub_1B5BA4ED4(v30, v53);
  uint64_t v33 = v55;
  if (__swift_getEnumTagSinglePayload(v32, 1, v55) == 1)
  {
    sub_1B5BA4F3C(v30, &qword_1E9D94C50);
    OUTLINED_FUNCTION_38();
    v34();
    uint64_t v35 = OUTLINED_FUNCTION_6_4();
LABEL_7:
    sub_1B5BA4F3C(v35, v36);
    return (id)OUTLINED_FUNCTION_41();
  }
  uint64_t v38 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v50 + 32))(v49, v32, v33);
  uint64_t v39 = (void *)((uint64_t (*)(uint64_t))v25)(v38);
  unsigned int v40 = objc_msgSend(v39, sel_isAllDay);

  uint64_t v41 = self;
  if (v40)
  {
    id result = objc_msgSend(v41, sel_reminderAllDayDateFormatter);
    uint64_t v42 = v48;
    if (result) {
      goto LABEL_13;
    }
    __break(1u);
  }
  else
  {
    id result = objc_msgSend(v41, sel_reminderDateTimeFormatter);
    uint64_t v42 = v48;
    if (result)
    {
LABEL_13:
      unint64_t v43 = result;
      uint64_t v44 = (void *)sub_1B5BC9170();
      id v45 = objc_msgSend(v43, sel_stringFromDate_, v44);

      sub_1B5BC9F40();
      OUTLINED_FUNCTION_38();
      v46();
      sub_1B5BA4F3C(v56, &qword_1E9D94C50);
      (*(void (**)(char *, uint64_t))(v42 + 8))(v29, v16);
      return (id)OUTLINED_FUNCTION_41();
    }
  }
  __break(1u);
  return result;
}

id SGReminderSuggestion.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SGReminderSuggestion.init()()
{
}

id SGReminderSuggestion.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SGReminderSuggestion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SGReminderSuggestion()
{
  uint64_t result = qword_1EB842100;
  if (!qword_1EB842100) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1B5BA4A94(uint64_t a1, void *a2)
{
  id v3 = (id)sub_1B5BC9EB0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setUserInfo_, v3);
}

uint64_t sub_1B5BA4B14()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B5BA4B4C(void *a1)
{
  if (a1)
  {
    id v3 = *(id *)(v1 + 16);
    id v4 = a1;
    uint64_t v5 = v3;
    id v6 = a1;
    uint64_t v7 = sub_1B5BC9210();
    os_log_type_t v8 = sub_1B5BCA050();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = swift_slowAlloc();
      uint64_t v21 = (void *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315650;
      uint64_t v10 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v5) + 0x90);
      os_log_type_t type = v8;
      OUTLINED_FUNCTION_10_2();
      uint64_t v11 = (void *)v10();
      id v12 = objc_msgSend(v11, sel_loggingIdentifier);

      uint64_t v13 = sub_1B5BC9F40();
      unint64_t v15 = v14;

      sub_1B5B7AAF8(v13, v15, &v23);
      sub_1B5BCA0C0();
      swift_bridgeObjectRelease();

      *(_WORD *)(v9 + 12) = 2112;
      OUTLINED_FUNCTION_10_2();
      uint64_t v16 = (void *)v10();
      id v17 = objc_msgSend(v16, sel_recordId);

      sub_1B5BCA0C0();
      *uint64_t v21 = v17;

      *(_WORD *)(v9 + 22) = 2080;
      id v18 = a1;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94C20);
      uint64_t v19 = sub_1B5BC9F50();
      sub_1B5B7AAF8(v19, v20, &v23);
      sub_1B5BCA0C0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1B5B6C000, v7, type, "SGReminderSuggestion - SGReminder %s\nUnable to confirm reminder with recordId: %@ err: %s", (uint8_t *)v9, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94470);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {
    }
  }
}

uint64_t sub_1B5BA4E7C(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (v2)
  {
    id v3 = v2;
    sub_1B5BC9F40();
    OUTLINED_FUNCTION_13_2();
  }
  return OUTLINED_FUNCTION_43();
}

uint64_t sub_1B5BA4ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94C50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B5BA4F3C(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_38();
  v3();
  return a1;
}

uint64_t sub_1B5BA4F90()
{
  return type metadata accessor for SGReminderSuggestion();
}

uint64_t sub_1B5BA4F98()
{
  uint64_t result = sub_1B5BC9230();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SGReminderSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SGReminderSuggestion);
}

uint64_t dispatch thunk of SGReminderSuggestion.suggestionDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SGReminderSuggestion.suggestionDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SGReminderSuggestion.suggestionDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SGReminderSuggestion.__allocating_init(realtimeReminder:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of SGReminderSuggestion.title.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of SGReminderSuggestion.notes.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of SGReminderSuggestion.dueDateComponents.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of SGReminderSuggestion.location.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of SGReminderSuggestion.locationString.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of SGReminderSuggestion.url.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of SGReminderSuggestion.userActivity.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of SGReminderSuggestion.wantsExtendedDetailOnlyView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of SGReminderSuggestion.locationProximity.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of SGReminderSuggestion.reminderCreationViewController(_:didCreateReminder:error:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t sub_1B5BA533C(uint64_t a1)
{
  return OUTLINED_FUNCTION_2_3(a1, OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_banner);
}

uint64_t sub_1B5BA5348(uint64_t a1)
{
  return OUTLINED_FUNCTION_2_3(a1, OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_suggestionStore);
}

char *SGBannerContentHostingView.__allocating_init(banner:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SGBannerContentHostingView.init(banner:)(a1);
}

char *SGBannerContentHostingView.init(banner:)(void *a1)
{
  uint64_t v3 = type metadata accessor for SGBannerContainerView(0);
  MEMORY[0x1F4188790](v3 - 8);
  OUTLINED_FUNCTION_65();
  id v6 = (void *)(v5 - v4);
  uint64_t v7 = OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController;
  *(void *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController] = 0;
  uint64_t v8 = OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_suggestionStore;
  *(void *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_suggestionStore] = 0;
  uint64_t v9 = OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_updateViewModel;
  type metadata accessor for BannerUpdateViewModel(0);
  uint64_t v10 = v1;
  *(void *)&v1[v9] = sub_1B5B84378();
  *(void *)&v10[OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_banner] = a1;
  uint64_t v11 = *(void **)&v1[v8];
  id v12 = v11;
  id v13 = a1;
  swift_retain();
  SGBannerContainerView.init(_:store:updateBannerView:)(v13, v11, v6);
  id v14 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EB841770));
  uint64_t v15 = sub_1B5BC9720();
  uint64_t v16 = *(void **)&v1[v7];
  *(void *)&v1[v7] = v15;

  v10[OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_invalidateBannerConstraints] = 0;
  v10[OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_computeViewBounds] = 0;

  v43.receiver = v10;
  v43.super_class = (Class)type metadata accessor for SGBannerContentHostingView();
  uint64_t result = (char *)objc_msgSendSuper2(&v43, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v18 = OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController;
  uint64_t v19 = *(void **)&result[OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController];
  if (!v19)
  {
    __break(1u);
    goto LABEL_12;
  }
  unint64_t v20 = result;
  uint64_t v21 = result;
  id v22 = v19;
  sub_1B5BC9710();

  uint64_t result = *(char **)&v20[v18];
  if (!result)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  id v23 = objc_msgSend(result, sel_view);
  if (v23)
  {
    uint64_t v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB8419A0);
    if (swift_dynamicCastClass()) {
      sub_1B5BC9430();
    }
  }
  uint64_t result = *(char **)&v20[v18];
  if (!result) {
    goto LABEL_13;
  }
  id v25 = objc_msgSend(result, sel_view);
  if (v25)
  {
    uint64_t v26 = v25;
    objc_msgSend(v21, sel_bounds);
    objc_msgSend(v26, sel_setFrame_);
    objc_msgSend(v26, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v27 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v26, sel_setBackgroundColor_, v27);

    objc_msgSend(v21, sel_addSubview_, v26);
    uint64_t v28 = self;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB8419C0);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_1B5BCDA00;
    id v30 = objc_msgSend(v26, sel_leadingAnchor);
    id v31 = objc_msgSend(v21, sel_leadingAnchor);
    id v32 = OUTLINED_FUNCTION_1_4();

    *(void *)(v29 + 32) = v32;
    id v33 = objc_msgSend(v26, sel_trailingAnchor);
    id v34 = objc_msgSend(v21, sel_trailingAnchor);
    id v35 = OUTLINED_FUNCTION_1_4();

    *(void *)(v29 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v35;
    id v36 = objc_msgSend(v26, sel_topAnchor);
    id v37 = objc_msgSend(v21, sel_topAnchor);
    id v38 = OUTLINED_FUNCTION_1_4();

    *(void *)(v29 + 48) = v38;
    id v39 = objc_msgSend(v26, sel_bottomAnchor);
    id v40 = objc_msgSend(v21, sel_bottomAnchor);
    id v41 = OUTLINED_FUNCTION_1_4();

    *(void *)(v29 + 56) = v41;
    sub_1B5BC9FF0();
    sub_1B5BA5810();
    uint64_t v42 = (void *)sub_1B5BC9FC0();
    swift_bridgeObjectRelease();
    objc_msgSend(v28, sel_activateConstraints_, v42);
  }
  return v21;
}

uint64_t type metadata accessor for SGBannerContentHostingView()
{
  return self;
}

unint64_t sub_1B5BA5810()
{
  unint64_t result = qword_1EB841778;
  if (!qword_1EB841778)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB841778);
  }
  return result;
}

void sub_1B5BA5878()
{
  *(void *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_suggestionStore] = 0;
  uint64_t v1 = OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_updateViewModel;
  type metadata accessor for BannerUpdateViewModel(0);
  *(void *)&v0[v1] = sub_1B5B84378();

  sub_1B5BCA160();
  __break(1u);
}

void sub_1B5BA5934()
{
  uint64_t v1 = type metadata accessor for SGBannerViewModel(0);
  MEMORY[0x1F4188790](v1 - 8);
  OUTLINED_FUNCTION_65();
  uint64_t v4 = v3 - v2;
  uint64_t v5 = *(uint64_t (**)(unsigned char *))(**(void **)(v0
                                                       + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_updateViewModel)
                                         + 104);
  swift_retain();
  id v6 = (void (*)(unsigned char *, void))v5(v16);
  BOOL *v7 = !*v7;
  v6(v16, 0);
  swift_release();
  uint64_t v8 = *(void **)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_suggestionStore);
  if (v8) {
    objc_msgSend(v8, sel_hostApp);
  }
  uint64_t v9 = *(void **)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController);
  if (v9)
  {
    uint64_t v10 = *(void **)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_banner);
    id v11 = v9;
    sub_1B5BB62E4(v10, v4);
    id v12 = (void (*)(unsigned char *, void))sub_1B5BC9730();
    uint64_t v14 = v13;
    uint64_t v15 = type metadata accessor for SGBannerContainerView(0);
    sub_1B5B84578(v4, v14 + *(int *)(v15 + 20));
    v12(v16, 0);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1B5BA5B10(void *a1)
{
  sub_1B5BA533C((uint64_t)a1);
  uint64_t v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x138);
  return v2();
}

uint64_t sub_1B5BA5BDC(void *a1)
{
  id v2 = a1;
  return sub_1B5BA5348((uint64_t)a1);
}

void sub_1B5BA5C70()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_invalidateBannerConstraints) = 1;
}

void sub_1B5BA5CA8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for SGBannerContainerView(0);
  MEMORY[0x1F4188790](v2 - 8);
  OUTLINED_FUNCTION_65();
  uint64_t v5 = (void *)(v4 - v3);
  uint64_t v6 = OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController;
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_banner);
  uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_suggestionStore);
  id v10 = v9;
  swift_retain();
  id v11 = v7;
  SGBannerContainerView.init(_:store:updateBannerView:)(v8, v9, v5);
  sub_1B5BC9750();

  uint64_t v12 = OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_invalidateBannerConstraints;
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_invalidateBannerConstraints) == 1)
  {
    uint64_t v13 = *(void **)(v1 + v6);
    if (!v13)
    {
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    id v14 = objc_msgSend(v13, sel_view);
    if (!v14)
    {
LABEL_21:
      __break(1u);
      goto LABEL_22;
    }
    uint64_t v15 = v14;
    objc_msgSend(v14, sel_invalidateIntrinsicContentSize);

    *(unsigned char *)(v1 + v12) = 0;
    *(unsigned char *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_computeViewBounds) = 0;
  }
  uint64_t v16 = *(void **)(v1 + v6);
  if (!v16) {
    goto LABEL_18;
  }
  id v17 = v16;
  sub_1B5BC9710();

  uint64_t v18 = *(void **)(v1 + v6);
  if (!v18)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  id v19 = objc_msgSend(v18, sel_view);
  if (v19)
  {
    unint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB8419A0);
    if (swift_dynamicCastClass()) {
      sub_1B5BC9430();
    }
  }
  uint64_t v21 = OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_computeViewBounds;
  if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_computeViewBounds) & 1) == 0)
  {
    id v22 = *(void **)(v1 + v6);
    if (v22)
    {
      id v23 = objc_msgSend(v22, sel_view);
      if (v23)
      {
        uint64_t v24 = v23;
        objc_msgSend(v23, sel_sizeToFit);

        *(unsigned char *)(v1 + v2sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = 1;
        return;
      }
LABEL_23:
      __break(1u);
      return;
    }
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
}

double sub_1B5BA5EE8()
{
  OUTLINED_FUNCTION_0_3();
  uint64_t v1 = *(double (**)(void))(v0 + 512);
  id v3 = v2;
  double v4 = v1();

  if (v4 == 0.0)
  {
    OUTLINED_FUNCTION_0_3();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 368);
    id v8 = v7;
    uint64_t v9 = v6();

    if (!v9) {
      double v4 = *(double *)sub_1B5B726D4();
    }
  }
  OUTLINED_FUNCTION_0_3();
  id v11 = *(double (**)(void))(v10 + 488);
  id v13 = v12;
  double v14 = v11();

  double v15 = v4 + v14 + *(double *)sub_1B5B7268C();
  double v16 = v15 + *(double *)sub_1B5B72698();
  return v16 + *(double *)sub_1B5B726A4();
}

void sub_1B5BA60A0()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController);
  if (v1)
  {
    id v2 = objc_msgSend(v1, sel_view);
    if (v2)
    {
      id v3 = v2;
      objc_msgSend(v2, sel_intrinsicContentSize);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id SGBannerContentHostingView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void SGBannerContentHostingView.init(frame:)()
{
}

id SGBannerContentHostingView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SGBannerContentHostingView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SGBannerContentHostingView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SGBannerContentHostingView);
}

uint64_t dispatch thunk of SGBannerContentHostingView.__allocating_init(banner:)()
{
  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of SGBannerContentHostingView.updateBannerViews()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of SGBannerContentHostingView.update(banner:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of SGBannerContentHostingView.setSuggestion(store:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of SGBannerContentHostingView.invalidateBannerView()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of SGBannerContentHostingView.reload()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of SGBannerContentHostingView.actionButtonLeadingEdgeOffset()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x140))();
}

unint64_t sub_1B5BA63E8(unint64_t result)
{
  if (result >= 5) {
    return 5;
  }
  return result;
}

unint64_t sub_1B5BA63F8@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1B5BA63E8(*a1);
  *a2 = result;
  return result;
}

Swift::Void __swiftcall SGContactSuggestion.contactViewController(_:didCompleteWith:)(CNContactViewController *_, CNContact_optional didCompleteWith)
{
  id v3 = v2;
  Class isa = didCompleteWith.value.super.isa;
  if (didCompleteWith.value.super.isa)
  {
    uint64_t v6 = sub_1B5BC9210();
    os_log_type_t v7 = sub_1B5BCA070();
    if (os_log_type_enabled(v6, v7))
    {
      id v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1B5B6C000, v6, v7, "SGContactSuggestion: Contact delegate for confirming contact", v8, 2u);
      MEMORY[0x1BA9A8090](v8, -1, -1);
    }

    objc_msgSend(v3, sel_confirm_suggestion_completion_, 1, *(void *)((char *)v3 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact), 0);
  }
  id v9 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v3) + 0x80))();
  if (v9)
  {
    uint64_t v10 = v9;
    objc_msgSend(v9, sel_suggestion_actionFinished_, v3, isa != 0);
    objc_msgSend(v10, sel_dismissViewController_, _);
    swift_unknownObjectRelease();
  }
}

UIImage __swiftcall SGContactSuggestion.contactImage()()
{
  id v0 = objc_msgSend(self, sel_spotlightIconImageWithBundleIdentifier_, *MEMORY[0x1E4F5DC00]);
  return (UIImage)v0;
}

void sub_1B5BA6660(void *a1)
{
  id v2 = objc_msgSend(a1, sel_emailAddresses);
  sub_1B5B7447C(0, &qword_1E9D94C30);
  unint64_t v3 = sub_1B5BC9FE0();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1B5BCA170();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(a1, sel_phones);
  sub_1B5B7447C(0, &qword_1E9D94C38);
  unint64_t v6 = sub_1B5BC9FE0();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1B5BCA170();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(a1, sel_postalAddresses);
  sub_1B5B7447C(0, (unint64_t *)&unk_1E9D94C40);
  unint64_t v9 = sub_1B5BC9FE0();

  if (v9 >> 62)
  {
    OUTLINED_FUNCTION_15_1();
    uint64_t v10 = sub_1B5BCA170();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(a1, sel_birthday);

  BOOL v12 = v11 != 0;
  uint64_t v13 = v4 + v7;
  if (__OFADD__(v4, v7))
  {
    __break(1u);
    goto LABEL_25;
  }
  BOOL v14 = __OFADD__(v13, v10);
  uint64_t v15 = v13 + v10;
  if (v14)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  BOOL v14 = __OFADD__(v15, v12);
  uint64_t v16 = v15 + v12;
  if (v14)
  {
LABEL_26:
    __break(1u);
    return;
  }
  if (v16 <= 1)
  {
    if (v4 >= 1 || v7 >= 1 || v10 >= 1 || v11)
    {
      sub_1B5B72B30();
      OUTLINED_FUNCTION_13_2();
    }
    else
    {
      uint64_t v4 = 0xE000000000000000;
    }
    sub_1B5B72B30();
    OUTLINED_FUNCTION_7_5();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_1B5BCD260;
    *(void *)(v17 + 56) = MEMORY[0x1E4FBB1A0];
    *(void *)(v17 + 64) = sub_1B5B8D86C();
    *(void *)(v17 + 32) = v11;
    *(void *)(v17 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v4;
    sub_1B5BC9F10();
    OUTLINED_FUNCTION_13_2();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_43();
  }
  else
  {
    OUTLINED_FUNCTION_12_3();
    sub_1B5B72B30();
  }
}

void SGContactSuggestion.confirm(_:suggestion:completion:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_msgSend(self, sel_serviceForContacts);
  uint64_t v10 = (void *)swift_allocObject();
  id v10[2] = v4;
  v10[3] = a3;
  v10[4] = a4;
  if (a1)
  {
    id v19 = sub_1B5BA8078;
    unint64_t v20 = v10;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_1B5B8CB28;
    uint64_t v18 = &block_descriptor_7;
    id v11 = _Block_copy(&v15);
    id v12 = v4;
    sub_1B5BA8064(a3);
    swift_release();
    objc_msgSend(v9, sel_confirmContact_withCompletion_, a2, v11);
    swift_unknownObjectRelease();
    _Block_release(v11);
  }
  else
  {
    id v19 = sub_1B5BA8058;
    unint64_t v20 = v10;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_1B5B8CB28;
    uint64_t v18 = &block_descriptor_4;
    uint64_t v13 = _Block_copy(&v15);
    id v14 = v4;
    sub_1B5BA8064(a3);
    swift_release();
    objc_msgSend(v9, sel_rejectContact_withCompletion_, a2, v13);
    _Block_release(v13);
    swift_unknownObjectRelease();
  }
}

void sub_1B5BA6C78(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_1B5BC90E0();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

id sub_1B5BA6CDC()
{
  currentUIContext();
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI19SGContactSuggestion_realtimeContact), sel_state);
  id v1 = sub_1B5B72B30();
  swift_bridgeObjectRelease();
  return v1;
}

id sub_1B5BA6DA0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = sub_1B5BC9070();
  OUTLINED_FUNCTION_0_1();
  uint64_t v53 = v6;
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_65();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94C00);
  MEMORY[0x1F4188790](v11 - 8);
  OUTLINED_FUNCTION_65();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_1B5BC91B0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v17 = v16;
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_65();
  uint64_t v21 = v20 - v19;
  uint64_t v51 = sub_1B5BC91F0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v23 = v22;
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_65();
  uint64_t v27 = v26 - v25;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94C50);
  MEMORY[0x1F4188790](v28 - 8);
  OUTLINED_FUNCTION_65();
  uint64_t v31 = v30 - v29;
  uint64_t v52 = sub_1B5BC9190();
  OUTLINED_FUNCTION_0_1();
  uint64_t v48 = v32;
  MEMORY[0x1F4188790](v33);
  OUTLINED_FUNCTION_65();
  uint64_t v47 = v35 - v34;
  uint64_t v57 = a2;
  uint64_t v58 = a3;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_10_3();
  id v55 = sub_1B5B72B30();
  uint64_t v49 = v36;
  (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v21, *MEMORY[0x1E4F27B20], v15);
  sub_1B5BC91C0();
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v21, v15);
  id v37 = objc_msgSend(a1, sel_birthday);
  if (!v37)
  {
    __break(1u);
    goto LABEL_10;
  }
  id v38 = v37;
  id v39 = objc_msgSend(v37, sel_dateComponents);

  if (!v39)
  {
LABEL_10:
    id result = (id)__swift_storeEnumTagSinglePayload(v14, 1, 1, v5);
    goto LABEL_11;
  }
  sub_1B5BC9060();

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 32))(v14, v10, v5);
  __swift_storeEnumTagSinglePayload(v14, 0, 1, v5);
  id result = (id)__swift_getEnumTagSinglePayload(v14, 1, v5);
  if (result == 1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  sub_1B5BC91D0();
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v27, v51);
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v14, v5);
  if (__swift_getEnumTagSinglePayload(v31, 1, v52) == 1)
  {
    sub_1B5BA8244(v31);
    id v41 = v55;
    uint64_t v42 = v49;
    id result = (id)sub_1B5BC9F80();
    uint64_t v43 = a4;
LABEL_8:
    *(void *)uint64_t v43 = v41;
    *(void *)(v43 + 8) = v42;
    *(void *)(v43 + 16) = v57;
    *(void *)(v43 + 24) = v58;
    *(unsigned char *)(v43 + 32) = 4;
    return result;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 32))(v47, v31, v52);
  id result = objc_msgSend(self, sel_birthdayFormatter);
  if (result)
  {
    uint64_t v44 = result;
    id v45 = (void *)sub_1B5BC9170();
    id v46 = objc_msgSend(v44, sel_stringFromDate_, v45);

    sub_1B5BC9F40();
    sub_1B5BC9F80();
    swift_bridgeObjectRelease();
    id result = (id)(*(uint64_t (**)(uint64_t, uint64_t))(v48 + 8))(v47, v52);
    uint64_t v42 = v49;
    uint64_t v43 = a4;
    id v41 = v55;
    goto LABEL_8;
  }
LABEL_12:
  __break(1u);
  return result;
}

void sub_1B5BA7230()
{
  OUTLINED_FUNCTION_8_3();
  id v1 = v0;
  uint64_t v3 = v2;
  uint64_t v29 = v4;
  uint64_t v30 = v5;
  swift_bridgeObjectRetain();
  id v6 = objc_msgSend(v1, sel_emailAddresses);
  sub_1B5B7447C(0, &qword_1E9D94C30);
  uint64_t v7 = sub_1B5BC9FE0();

  if (!((unint64_t)v7 >> 62))
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v8) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  if (v7 < 0) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v7 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  sub_1B5BCA170();
  OUTLINED_FUNCTION_2_4();
  if (!v8) {
    goto LABEL_13;
  }
LABEL_3:
  if ((v7 & 0xC000000000000001) != 0)
  {
LABEL_14:
    id v9 = (id)MEMORY[0x1BA9A7760](0, v7);
    goto LABEL_6;
  }
  if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    return;
  }
  id v9 = *(id *)(v7 + 32);
LABEL_6:
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_7_5();
  id v11 = v10;
  sub_1B5BA82A4(v11, (SEL *)&selRef_label);
  uint64_t v13 = v12;
  id v14 = objc_msgSend(v11, sel_emailAddress);
  uint64_t v15 = sub_1B5BC9F40();
  uint64_t v17 = v16;

  if (v13)
  {
    uint64_t v18 = self;
    uint64_t v19 = (void *)sub_1B5BC9F00();
    swift_bridgeObjectRelease();
    id v20 = objc_msgSend(v18, sel_localizedStringForLabel_, v19);

    uint64_t v21 = sub_1B5BC9F40();
    uint64_t v27 = v22;
    uint64_t v28 = v21;

    sub_1B5B72B30();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
    uint64_t v23 = v7;
    uint64_t v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_1B5BCC700;
    uint64_t v25 = MEMORY[0x1E4FBB1A0];
    *(void *)(v24 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v26 = sub_1B5B8D86C();
    *(void *)(v24 + 32) = v28;
    *(void *)(v24 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v27;
    *(void *)(v24 + 96) = v25;
    *(void *)(v24 + 104) = v26;
    *(void *)(v24 + 64) = v26;
    *(void *)(v24 + 72) = v15;
    *(void *)(v24 + 8sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v17;
    sub_1B5BC9F10();
    swift_bridgeObjectRelease();
    uint64_t v7 = v23;
    swift_bridgeObjectRelease();
  }
  sub_1B5BC9F80();
  swift_bridgeObjectRelease();

  *(void *)uint64_t v3 = v7;
  *(void *)(v3 + 8) = v8;
  *(void *)(v3 + 16) = v29;
  *(void *)(v3 + 24) = v30;
  *(unsigned char *)(v3 + 32) = 2;
  OUTLINED_FUNCTION_6_5();
}

void sub_1B5BA74C0(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4 = a3;
  uint64_t v5 = a2;
  swift_bridgeObjectRetain();
  id v8 = objc_msgSend(a1, sel_phones);
  sub_1B5B7447C(0, &qword_1E9D94C38);
  unint64_t v9 = sub_1B5BC9FE0();

  if (!(v9 >> 62))
  {
    if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  OUTLINED_FUNCTION_15_1();
  uint64_t v17 = sub_1B5BCA170();
  swift_bridgeObjectRelease();
  if (!v17) {
    goto LABEL_13;
  }
LABEL_3:
  if ((v9 & 0xC000000000000001) != 0)
  {
LABEL_14:
    id v10 = (id)MEMORY[0x1BA9A7760](0, v9);
    goto LABEL_6;
  }
  if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    return;
  }
  id v10 = *(id *)(v9 + 32);
LABEL_6:
  id v11 = v10;
  swift_bridgeObjectRelease();
  id v12 = OUTLINED_FUNCTION_11_3();
  uint64_t v14 = v13;
  id v15 = objc_msgSend(v11, sel_phoneNumber);
  if (!v15)
  {
    sub_1B5BC9F40();
    id v15 = (id)sub_1B5BC9F00();
    swift_bridgeObjectRelease();
  }
  id v16 = objc_msgSend(self, sel_formattedStringForPhone_, v15);

  if (v16)
  {
    sub_1B5BC9F40();

    sub_1B5BC9F80();
    swift_bridgeObjectRelease();

    uint64_t v5 = a2;
    uint64_t v4 = a3;
  }
  else
  {
  }
  *(void *)a4 = v12;
  *(void *)(a4 + 8) = v14;
  *(void *)(a4 + 16) = v5;
  *(void *)(a4 + 24) = v4;
  *(unsigned char *)(a4 + 32) = 3;
}

void sub_1B5BA76A0()
{
  OUTLINED_FUNCTION_8_3();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  id v6 = v5;
  uint64_t v8 = v7;
  uint64_t v34 = v3;
  uint64_t v35 = v1;
  swift_bridgeObjectRetain();
  id v9 = objc_msgSend(v6, sel_postalAddresses);
  sub_1B5B7447C(0, (unint64_t *)&unk_1E9D94C40);
  unint64_t v10 = sub_1B5BC9FE0();

  if (!(v10 >> 62))
  {
    if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_1B5BCA170();
  swift_bridgeObjectRelease();
  if (!v31) {
    goto LABEL_11;
  }
LABEL_3:
  if ((v10 & 0xC000000000000001) != 0)
  {
LABEL_12:
    id v11 = (id)MEMORY[0x1BA9A7760](0, v10);
    goto LABEL_6;
  }
  if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    return;
  }
  id v11 = *(id *)(v10 + 32);
LABEL_6:
  id v12 = v11;
  swift_bridgeObjectRelease();
  id v13 = v12;
  sub_1B5BA82A4(v13, (SEL *)&selRef_label);
  uint64_t v15 = v14;
  OUTLINED_FUNCTION_10_3();
  id v16 = sub_1B5B72B30();
  uint64_t v32 = v17;
  id v33 = v16;
  id v18 = objc_msgSend(v0, sel_mailingAddressFromPostalAddress_, v13);
  uint64_t v19 = sub_1B5BC9F40();
  uint64_t v21 = v20;

  if (v15)
  {
    uint64_t v22 = self;
    uint64_t v23 = (void *)sub_1B5BC9F00();
    swift_bridgeObjectRelease();
    id v24 = objc_msgSend(v22, sel_localizedStringForLabel_, v23);

    uint64_t v25 = sub_1B5BC9F40();
    uint64_t v27 = v26;

    sub_1B5B72B30();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
    uint64_t v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_1B5BCC700;
    uint64_t v29 = MEMORY[0x1E4FBB1A0];
    *(void *)(v28 + 56) = MEMORY[0x1E4FBB1A0];
    unint64_t v30 = sub_1B5B8D86C();
    *(void *)(v28 + 32) = v25;
    *(void *)(v28 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v27;
    *(void *)(v28 + 96) = v29;
    *(void *)(v28 + 104) = v30;
    *(void *)(v28 + 64) = v30;
    *(void *)(v28 + 72) = v19;
    *(void *)(v28 + 8sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v21;
    sub_1B5BC9F10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1B5BC9F80();
    swift_bridgeObjectRelease();

    uint64_t v4 = v34;
    uint64_t v2 = v35;
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  *(void *)uint64_t v8 = v33;
  *(void *)(v8 + 8) = v32;
  *(void *)(v8 + 16) = v4;
  *(void *)(v8 + 24) = v2;
  *(unsigned char *)(v8 + 32) = 1;
  OUTLINED_FUNCTION_6_5();
}

void sub_1B5BA795C(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = 0;
  unint64_t v32 = 0xE000000000000000;
  if (!currentUIContext())
  {
    id v4 = objc_msgSend(a1, sel_name);
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = objc_msgSend(v4, sel_fullName);
      uint64_t v7 = sub_1B5BC9F40();
      unint64_t v9 = v8;

      uint64_t v31 = v7;
      unint64_t v32 = v9;
      sub_1B5BC9F80();
    }
  }
  id v10 = objc_msgSend(a1, sel_birthday);

  if (v10)
  {
    id v11 = (void *)OUTLINED_FUNCTION_17_5();
    sub_1B5BA6DA0(v11, v12, v13, v14);
    goto LABEL_12;
  }
  id v15 = objc_msgSend(a1, sel_emailAddresses);
  sub_1B5B7447C(0, &qword_1E9D94C30);
  unint64_t v16 = sub_1B5BC9FE0();

  if (v16 >> 62)
  {
    OUTLINED_FUNCTION_4_4();
    uint64_t v22 = sub_1B5BCA170();
    swift_bridgeObjectRelease();
    if (v22) {
      goto LABEL_9;
    }
  }
  else if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_9:
    if ((v16 & 0xC000000000000001) != 0)
    {
      MEMORY[0x1BA9A7760](0, v16);
      swift_unknownObjectRelease();
      goto LABEL_11;
    }
    if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_11:
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_9_2();
      sub_1B5BA7230();
LABEL_12:
      swift_bridgeObjectRelease();
      char v17 = v37;
      uint64_t v18 = v35;
      unint64_t v19 = v36;
      uint64_t v20 = v33;
      unint64_t v21 = v34;
LABEL_13:
      *(void *)a2 = v20;
      *(void *)(a2 + 8) = v21;
      *(void *)(a2 + 16) = v18;
      *(void *)(a2 + 24) = v19;
      *(unsigned char *)(a2 + 32) = v17;
      return;
    }
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(a1, sel_phones);
  sub_1B5B7447C(0, &qword_1E9D94C38);
  unint64_t v16 = sub_1B5BC9FE0();

  if (!(v16 >> 62))
  {
    if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_23;
    }
LABEL_17:
    if ((v16 & 0xC000000000000001) != 0)
    {
      MEMORY[0x1BA9A7760](0, v16);
      swift_unknownObjectRelease();
    }
    else if (!*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_30;
    }
    swift_bridgeObjectRelease();
    id v24 = (void *)OUTLINED_FUNCTION_17_5();
    sub_1B5BA74C0(v24, v25, v26, v27);
    goto LABEL_12;
  }
LABEL_22:
  OUTLINED_FUNCTION_4_4();
  uint64_t v28 = sub_1B5BCA170();
  swift_bridgeObjectRelease();
  if (v28) {
    goto LABEL_17;
  }
LABEL_23:
  swift_bridgeObjectRelease();
  id v29 = objc_msgSend(a1, sel_postalAddresses);
  sub_1B5B7447C(0, (unint64_t *)&unk_1E9D94C40);
  unint64_t v16 = sub_1B5BC9FE0();

  if (!(v16 >> 62))
  {
    if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_25;
    }
LABEL_31:
    swift_bridgeObjectRelease();
    uint64_t v20 = 0;
    char v17 = 0;
    unint64_t v21 = 0xE000000000000000;
    uint64_t v18 = v31;
    unint64_t v19 = v32;
    goto LABEL_13;
  }
LABEL_30:
  OUTLINED_FUNCTION_4_4();
  uint64_t v30 = sub_1B5BCA170();
  swift_bridgeObjectRelease();
  if (!v30) {
    goto LABEL_31;
  }
LABEL_25:
  if ((v16 & 0xC000000000000001) != 0)
  {
    MEMORY[0x1BA9A7760](0, v16);
    swift_unknownObjectRelease();
    goto LABEL_27;
  }
  if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_27:
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_2();
    sub_1B5BA76A0();
    goto LABEL_12;
  }
  __break(1u);
}

unint64_t sub_1B5BA7CB8(unint64_t result)
{
  id result = result;
  switch((char)result)
  {
    case 1:
    case 4:
      OUTLINED_FUNCTION_10_3();
      goto LABEL_4;
    case 2:
    case 3:
      OUTLINED_FUNCTION_12_3();
LABEL_4:
      id result = (unint64_t)sub_1B5B72B30();
      break;
    default:
      return result;
  }
  return result;
}

void *SGContactSuggestion.mailingAddressFromPostalAddress(_:)(void *a1)
{
  sub_1B5BA82A4(objc_msgSend(a1, sel_components), (SEL *)&selRef_street);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1BA58]), sel_init);
    id v7 = OUTLINED_FUNCTION_3_1();
    sub_1B5BA82A4(v7, (SEL *)&selRef_street);
    if (v8)
    {
      uint64_t v1 = v8;
      sub_1B5BC9F00();
      uint64_t v9 = OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_5_4(v9, sel_setStreet_);
    }
    id v10 = OUTLINED_FUNCTION_3_1();
    sub_1B5BA82A4(v10, (SEL *)&selRef_city);
    if (v11)
    {
      uint64_t v1 = v11;
      sub_1B5BC9F00();
      uint64_t v12 = OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_5_4(v12, sel_setCity_);
    }
    id v13 = OUTLINED_FUNCTION_3_1();
    sub_1B5BA82A4(v13, (SEL *)&selRef_state);
    if (v14)
    {
      uint64_t v1 = v14;
      sub_1B5BC9F00();
      uint64_t v15 = OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_5_4(v15, sel_setState_);
    }
    id v16 = OUTLINED_FUNCTION_3_1();
    sub_1B5BA82A4(v16, (SEL *)&selRef_postalCode);
    if (v17)
    {
      uint64_t v1 = v17;
      sub_1B5BC9F00();
      uint64_t v18 = OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_5_4(v18, sel_setPostalCode_);
    }
    id v19 = OUTLINED_FUNCTION_3_1();
    sub_1B5BA82A4(v19, (SEL *)&selRef_subLocality);
    if (v20)
    {
      uint64_t v1 = v20;
      sub_1B5BC9F00();
      uint64_t v21 = OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_5_4(v21, sel_setSubLocality_);
    }
    id v22 = OUTLINED_FUNCTION_3_1();
    sub_1B5BA82A4(v22, (SEL *)&selRef_subAdministrativeArea);
    if (v23)
    {
      uint64_t v1 = v23;
      sub_1B5BC9F00();
      uint64_t v24 = OUTLINED_FUNCTION_2_4();
      OUTLINED_FUNCTION_5_4(v24, sel_setSubAdministrativeArea_);
    }
    id v25 = OUTLINED_FUNCTION_3_1();
    sub_1B5BA82A4(v25, (SEL *)&selRef_isoCountryCode);
    if (v26)
    {
      uint64_t v1 = (void *)sub_1B5BC9F00();
      swift_bridgeObjectRelease();
      objc_msgSend(v6, sel_setISOCountryCode_, v1);
    }
    id v27 = objc_msgSend(self, sel_stringFromPostalAddress_style_, v6, 0);
    sub_1B5BC9F40();
    OUTLINED_FUNCTION_7_5();
  }
  else
  {
    id v27 = objc_msgSend(a1, sel_address);
    sub_1B5BC9F40();
    OUTLINED_FUNCTION_7_5();
  }

  return v1;
}

void sub_1B5BA8058(int a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_1B5BA8084(a1, (int)"Error: rejectContact failed: %s", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24);
}

uint64_t sub_1B5BA8064(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void sub_1B5BA8078(int a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_1B5BA8084(a1, (int)"Error: confirmContact failed: %s", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24);
}

void sub_1B5BA8084(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *format, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_8_3();
  a23 = v25;
  a24 = v28;
  id v29 = v26;
  uint64_t v30 = *(void (**)(void *))(v24 + 24);
  if (v26)
  {
    uint64_t v31 = v27;
    id v32 = v26;
    id v33 = v29;
    unint64_t v34 = sub_1B5BC9210();
    os_log_type_t v35 = sub_1B5BCA050();
    if (!os_log_type_enabled(v34, v35))
    {

      if (!v30) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    unint64_t v36 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    a12 = v37;
    *(_DWORD *)unint64_t v36 = 136315138;
    id v38 = v29;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94C20);
    uint64_t v39 = sub_1B5BC9F50();
    sub_1B5B7AAF8(v39, v40, &a12);
    sub_1B5BCA0C0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1B5B6C000, v34, v35, v31, v36, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1BA9A8090](v37, -1, -1);
    MEMORY[0x1BA9A8090](v36, -1, -1);
  }
  if (v30)
  {
LABEL_5:
    swift_retain();
    v30(v29);
    sub_1B5BA86CC((uint64_t)v30);
  }
LABEL_6:
  OUTLINED_FUNCTION_6_5();
}

uint64_t sub_1B5BA8244(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94C50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B5BA82A4(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = sub_1B5BC9F40();

  return v4;
}

unint64_t sub_1B5BA8314()
{
  unint64_t result = qword_1E9D94C58;
  if (!qword_1E9D94C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94C58);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SGContactCategoryType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
    if (a2 + 4 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 4) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SGContactCategoryType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1B5BA84B4);
      case 4:
        *(_DWORD *)(result + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = v6;
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
        *(_WORD *)(result + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SGContactCategoryType()
{
  return &type metadata for SGContactCategoryType;
}

uint64_t destroy for SGContactCategory()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SGContactCategory(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SGContactCategory(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t assignWithTake for SGContactCategory(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SGContactCategory(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 33))
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

uint64_t storeEnumTagSinglePayload for SGContactCategory(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 33) = 1;
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
    *(unsigned char *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SGContactCategory()
{
  return &type metadata for SGContactCategory;
}

uint64_t sub_1B5BA86CC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1B5BA86DC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B5BA8714(uint64_t a1)
{
  sub_1B5BA6C78(a1, *(void *)(v1 + 16));
}

void sub_1B5BA8720()
{
  OUTLINED_FUNCTION_18();
  uint64_t v4 = v3;
  uint64_t v74 = v5;
  uint64_t v79 = v6;
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841400);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_29_2(v8, v61);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841058);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_3();
  uint64_t v68 = v10;
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8410D8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_30_1(v12, v61);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840F98);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_57_1();
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841000);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_25();
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841030);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_32();
  uint64_t v18 = v16 - v17;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_15_0();
  uint64_t v64 = v20;
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841080);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_3();
  uint64_t v77 = v22;
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841078);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_3();
  uint64_t v73 = v24;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8414D8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_28_3(v26, v61);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841500);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v27);
  OUTLINED_FUNCTION_31_2(v28, v61);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841118);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_8_4(v30, v61);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8413F0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841430);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v32);
  unint64_t v34 = (char *)&v61 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841460);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_27_2();
  MEMORY[0x1F4188790](v37);
  OUTLINED_FUNCTION_15_0();
  switch(v4)
  {
    case 0:
      uint64_t v39 = v38;
      sub_1B5BC98A0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841530);
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_3_2();
      v40();
      OUTLINED_FUNCTION_48_3();
      sub_1B5B93DE4();
      swift_getKeyPath();
      OUTLINED_FUNCTION_24_3();
      OUTLINED_FUNCTION_9_3();
      OUTLINED_FUNCTION_50_2();
      OUTLINED_FUNCTION_20_4();
      OUTLINED_FUNCTION_11_4();
      id v41 = &qword_1EB841460;
      OUTLINED_FUNCTION_19_4();
      OUTLINED_FUNCTION_10_4();
      goto LABEL_8;
    case 1:
      uint64_t v39 = v38;
      sub_1B5BC98A0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841530);
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_3_2();
      v49();
      OUTLINED_FUNCTION_48_3();
      sub_1B5B93E50();
      swift_getKeyPath();
      OUTLINED_FUNCTION_24_3();
      OUTLINED_FUNCTION_9_3();
      OUTLINED_FUNCTION_50_2();
      OUTLINED_FUNCTION_20_4();
      OUTLINED_FUNCTION_11_4();
      id v41 = &qword_1EB841460;
      OUTLINED_FUNCTION_19_4();
      OUTLINED_FUNCTION_10_4();
      goto LABEL_8;
    case 2:
      uint64_t v39 = v38;
      sub_1B5BC98A0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841530);
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_3_2();
      v50();
      OUTLINED_FUNCTION_48_3();
      sub_1B5B940F0();
      swift_getKeyPath();
      OUTLINED_FUNCTION_24_3();
      OUTLINED_FUNCTION_9_3();
      OUTLINED_FUNCTION_50_2();
      OUTLINED_FUNCTION_20_4();
      *(void *)(v0 + *(int *)(v35 + 36)) = 0x3FE0000000000000;
      sub_1B5BAC250((uint64_t)v34, &qword_1EB841430);
      id v41 = &qword_1EB841460;
      OUTLINED_FUNCTION_19_4();
      OUTLINED_FUNCTION_10_4();
      goto LABEL_8;
    case 3:
      uint64_t v39 = v38;
      sub_1B5BC98A0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841530);
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_3_2();
      v51();
      OUTLINED_FUNCTION_48_3();
      sub_1B5B93F98();
      swift_getKeyPath();
      OUTLINED_FUNCTION_24_3();
      OUTLINED_FUNCTION_9_3();
      OUTLINED_FUNCTION_50_2();
      OUTLINED_FUNCTION_20_4();
      OUTLINED_FUNCTION_11_4();
      id v41 = &qword_1EB841460;
      OUTLINED_FUNCTION_19_4();
      OUTLINED_FUNCTION_10_4();
LABEL_8:
      swift_storeEnumTagMultiPayload();
      sub_1B5BABB5C((uint64_t)&unk_1EB841458);
      OUTLINED_FUNCTION_21_1();
      OUTLINED_FUNCTION_46_2();
      swift_storeEnumTagMultiPayload();
      sub_1B5BAB580();
      sub_1B5BC9830();
      sub_1B5BAC250((uint64_t)v34, &qword_1EB841500);
      OUTLINED_FUNCTION_23_4();
      swift_storeEnumTagMultiPayload();
      OUTLINED_FUNCTION_6_6();
      OUTLINED_FUNCTION_51_2();
      uint64_t v48 = v39;
      break;
    case 4:
      uint64_t v52 = sub_1B5BC9C50();
      uint64_t KeyPath = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841530);
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_3_2();
      v54();
      id v55 = (uint64_t *)(v1 + *(int *)(v62 + 36));
      *id v55 = KeyPath;
      v55[1] = v52;
      uint64_t v56 = *sub_1B5B93F98();
      uint64_t v57 = swift_getKeyPath();
      sub_1B5BAC1FC(v1, v2, &qword_1EB840F98);
      uint64_t v58 = (uint64_t *)(v2 + *(int *)(v63 + 36));
      *uint64_t v58 = v57;
      v58[1] = v56;
      swift_retain();
      sub_1B5BAC250(v1, &qword_1EB840F98);
      sub_1B5BAC1FC(v2, v18, &qword_1EB841000);
      *(void *)(v18 + *(int *)(v66 + 36)) = 0x3FF0000000000000;
      sub_1B5BAC250(v2, &qword_1EB841000);
      id v41 = &qword_1EB841030;
      uint64_t v59 = v18;
      uint64_t v60 = v64;
      sub_1B5B7E3E8(v59, v64, &qword_1EB841030);
      sub_1B5BAC1FC(v60, v68, &qword_1EB841030);
      swift_storeEnumTagMultiPayload();
      sub_1B5BAB308();
      sub_1B5BAB494();
      sub_1B5BC9830();
      OUTLINED_FUNCTION_23_4();
      OUTLINED_FUNCTION_49_3();
      OUTLINED_FUNCTION_6_6();
      OUTLINED_FUNCTION_51_2();
      uint64_t v48 = v60;
      break;
    default:
      uint64_t v42 = *sub_1B5B93E50();
      uint64_t v43 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841530);
      OUTLINED_FUNCTION_1_0();
      uint64_t v44 = v65;
      OUTLINED_FUNCTION_3_2();
      v45();
      uint64_t v46 = v68;
      uint64_t v47 = (uint64_t *)(v44 + *(int *)(v69 + 36));
      *uint64_t v47 = v43;
      v47[1] = v42;
      id v41 = &qword_1EB841400;
      sub_1B5BAC1FC(v44, v46, &qword_1EB841400);
      swift_storeEnumTagMultiPayload();
      sub_1B5BAB308();
      sub_1B5BAB494();
      swift_retain();
      sub_1B5BC9830();
      OUTLINED_FUNCTION_23_4();
      OUTLINED_FUNCTION_49_3();
      OUTLINED_FUNCTION_6_6();
      OUTLINED_FUNCTION_51_2();
      uint64_t v48 = v44;
      break;
  }
  sub_1B5BAC250(v48, v41);
  OUTLINED_FUNCTION_17();
}

void sub_1B5BA90D8()
{
}

void sub_1B5BA90E0()
{
  OUTLINED_FUNCTION_18();
  uint64_t v97 = v4;
  uint64_t v102 = v5;
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94CC0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_3();
  uint64_t v85 = v7;
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94CC8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_29_2(v9, v80);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94CD0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_32();
  uint64_t v82 = v11 - v12;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_15_0();
  uint64_t v86 = v14;
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94CD8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_30_1(v16, v80);
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94CE0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_28_3(v18, v80);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94CE8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_16();
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94CF0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_32();
  uint64_t v24 = v22 - v23;
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_15_0();
  uint64_t v80 = v26;
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94CF8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v27);
  OUTLINED_FUNCTION_3();
  uint64_t v101 = v28;
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94D00);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_31_2(v30, v80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94D08);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_27();
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94D10);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v32);
  OUTLINED_FUNCTION_59();
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94D18);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v33);
  OUTLINED_FUNCTION_8_4(v34, v80);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94D20);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v35);
  OUTLINED_FUNCTION_25();
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94D28);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v37);
  OUTLINED_FUNCTION_32();
  uint64_t v40 = v38 - v39;
  MEMORY[0x1F4188790](v41);
  uint64_t v43 = (char *)&v80 - v42;
  switch(v44)
  {
    case 0:
    case 1:
      uint64_t v45 = *sub_1B5B93E50();
      uint64_t KeyPath = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94D30);
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_3_2();
      v47();
      uint64_t v48 = (uint64_t *)(v3 + *(int *)(v98 + 36));
      *uint64_t v48 = KeyPath;
      v48[1] = v45;
      swift_retain();
      LODWORD(v45) = sub_1B5BC98B0();
      sub_1B5BAC1FC(v3, v40, &qword_1E9D94D20);
      *(_DWORD *)(v40 + *(int *)(v36 + 36)) = v45;
      sub_1B5BAC250(v3, &qword_1E9D94D20);
      sub_1B5B7E3E8(v40, (uint64_t)v43, &qword_1E9D94D28);
      sub_1B5BAC1FC((uint64_t)v43, v1, &qword_1E9D94D28);
      swift_storeEnumTagMultiPayload();
      sub_1B5BAB830();
      sub_1B5BAB8D0();
      OUTLINED_FUNCTION_54_3();
      sub_1B5BC9830();
      sub_1B5BAC1FC(v0, v94, &qword_1E9D94D10);
      swift_storeEnumTagMultiPayload();
      sub_1B5BAB7F4();
      sub_1B5BAB994();
      uint64_t v49 = v96;
      sub_1B5BC9830();
      sub_1B5BAC250(v0, &qword_1E9D94D10);
      OUTLINED_FUNCTION_53_2();
      OUTLINED_FUNCTION_34_2();
      sub_1B5BAB7B8();
      OUTLINED_FUNCTION_35_2();
      sub_1B5BC9830();
      sub_1B5BAC250(v49, &qword_1E9D94D18);
      uint64_t v50 = (uint64_t)v43;
      uint64_t v51 = &qword_1E9D94D28;
      break;
    case 2:
      uint64_t v56 = *sub_1B5B940F0();
      uint64_t v57 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94D30);
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_3_2();
      v58();
      uint64_t v59 = (uint64_t *)(v3 + *(int *)(v98 + 36));
      *uint64_t v59 = v57;
      v59[1] = v56;
      sub_1B5BAC1FC(v3, v1, &qword_1E9D94D20);
      swift_storeEnumTagMultiPayload();
      sub_1B5BAB830();
      sub_1B5BAB8D0();
      swift_retain();
      OUTLINED_FUNCTION_54_3();
      sub_1B5BC9830();
      sub_1B5BAC1FC(v0, v94, &qword_1E9D94D10);
      swift_storeEnumTagMultiPayload();
      sub_1B5BAB7F4();
      sub_1B5BAB994();
      uint64_t v60 = v96;
      sub_1B5BC9830();
      sub_1B5BAC250(v0, &qword_1E9D94D10);
      OUTLINED_FUNCTION_53_2();
      OUTLINED_FUNCTION_34_2();
      sub_1B5BAB7B8();
      OUTLINED_FUNCTION_35_2();
      sub_1B5BC9830();
      sub_1B5BAC250(v60, &qword_1E9D94D18);
      goto LABEL_5;
    case 3:
      int v61 = sub_1B5BC98C0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94D30);
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_3_2();
      v62();
      *(_DWORD *)(v2 + *(int *)(v19 + 36)) = v61;
      uint64_t v63 = *sub_1B5B940F0();
      uint64_t v64 = swift_getKeyPath();
      sub_1B5BAC1FC(v2, v24, &qword_1E9D94CE8);
      uint64_t v65 = (uint64_t *)(v24 + *(int *)(v87 + 36));
      *uint64_t v65 = v64;
      v65[1] = v63;
      swift_retain();
      sub_1B5BAC250(v2, &qword_1E9D94CE8);
      uint64_t v66 = &qword_1E9D94CF0;
      uint64_t v67 = v80;
      sub_1B5B7E3E8(v24, v80, &qword_1E9D94CF0);
      sub_1B5BAC1FC(v67, v89, &qword_1E9D94CF0);
      swift_storeEnumTagMultiPayload();
      sub_1B5BAB9D0();
      sub_1B5BABB34();
      uint64_t v68 = v91;
      goto LABEL_8;
    case 4:
      uint64_t v69 = sub_1B5BC9C50();
      uint64_t v70 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94D30);
      OUTLINED_FUNCTION_1_0();
      uint64_t v71 = v85;
      OUTLINED_FUNCTION_3_2();
      v72();
      uint64_t v73 = (uint64_t *)(v71 + *(int *)(v81 + 36));
      *uint64_t v73 = v70;
      v73[1] = v69;
      uint64_t v74 = *sub_1B5B940F0();
      uint64_t v75 = swift_getKeyPath();
      uint64_t v76 = v84;
      sub_1B5BAC1FC(v71, v84, &qword_1E9D94CC0);
      uint64_t v77 = (uint64_t *)(v76 + *(int *)(v83 + 36));
      uint64_t *v77 = v75;
      v77[1] = v74;
      swift_retain();
      sub_1B5BAC250(v71, &qword_1E9D94CC0);
      uint64_t v78 = v82;
      sub_1B5BAC1FC(v76, v82, &qword_1E9D94CC8);
      *(void *)(v78 + *(int *)(v90 + 36)) = 0x3FE0000000000000;
      sub_1B5BAC250(v76, &qword_1E9D94CC8);
      uint64_t v66 = &qword_1E9D94CD0;
      uint64_t v67 = v86;
      sub_1B5B7E3E8(v78, v86, &qword_1E9D94CD0);
      sub_1B5BAC1FC(v67, v89, &qword_1E9D94CD0);
      swift_storeEnumTagMultiPayload();
      sub_1B5BAB9D0();
      sub_1B5BABB34();
      uint64_t v68 = v91;
LABEL_8:
      sub_1B5BC9830();
      sub_1B5BAC1FC(v68, v94, &qword_1E9D94CE0);
      swift_storeEnumTagMultiPayload();
      sub_1B5BAB7F4();
      sub_1B5BAB994();
      uint64_t v79 = v96;
      sub_1B5BC9830();
      sub_1B5BAC250(v68, &qword_1E9D94CE0);
      sub_1B5BAC1FC(v79, v101, &qword_1E9D94D18);
      OUTLINED_FUNCTION_34_2();
      sub_1B5BAB7B8();
      sub_1B5BAB8D0();
      sub_1B5BC9830();
      OUTLINED_FUNCTION_51_2();
      uint64_t v50 = v67;
      uint64_t v51 = v66;
      break;
    default:
      uint64_t v52 = *sub_1B5B93E50();
      uint64_t v53 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94D30);
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_3_2();
      v54();
      id v55 = (uint64_t *)(v3 + *(int *)(v98 + 36));
      *id v55 = v53;
      v55[1] = v52;
      sub_1B5BAC1FC(v3, v101, &qword_1E9D94D20);
      swift_storeEnumTagMultiPayload();
      sub_1B5BAB7B8();
      sub_1B5BAB8D0();
      swift_retain();
      sub_1B5BC9830();
LABEL_5:
      uint64_t v50 = v3;
      uint64_t v51 = &qword_1E9D94D20;
      break;
  }
  sub_1B5BAC250(v50, v51);
  OUTLINED_FUNCTION_17();
}

void sub_1B5BA9B94()
{
}

void sub_1B5BA9B9C()
{
  OUTLINED_FUNCTION_18();
  char v20 = v4;
  uint64_t v23 = v5;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840C08);
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_3();
  uint64_t v21 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840BC8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_27();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840BC0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_16_1();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840B38);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_25();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840BD8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_59();
  id v15 = objc_msgSend(self, sel_currentDevice);
  id v16 = objc_msgSend(v15, sel_userInterfaceIdiom);

  if (v16 == (id)6)
  {
    if (v20) {
      sub_1B5BC9C70();
    }
    else {
      sub_1B5BC9C50();
    }
    uint64_t v17 = OUTLINED_FUNCTION_25_0();
    v18(v17);
    *(void *)(v3 + *(int *)(v12 + 36)) = v7;
    sub_1B5BAC1FC(v3, v1, &qword_1EB840B38);
    swift_storeEnumTagMultiPayload();
    sub_1B5BABDB0();
    sub_1B5BC9830();
    sub_1B5BAC250(v3, &qword_1EB840B38);
    sub_1B5BAC1FC(v0, v2, &qword_1EB840BD8);
    swift_storeEnumTagMultiPayload();
    sub_1B5BABD3C((uint64_t)&unk_1EB840BD0);
    sub_1B5B7E718((uint64_t)&unk_1EB840C00);
    OUTLINED_FUNCTION_47_2();
    sub_1B5BC9830();
    sub_1B5BAC250(v0, &qword_1EB840BD8);
  }
  else
  {
    uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    v19(v21, v23, v22);
    v19(v2, v21, v22);
    swift_storeEnumTagMultiPayload();
    sub_1B5BABD3C((uint64_t)&unk_1EB840BD0);
    sub_1B5B7E718((uint64_t)&unk_1EB840C00);
    OUTLINED_FUNCTION_47_2();
    sub_1B5BC9830();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v21, v22);
  }
  OUTLINED_FUNCTION_17();
}

void sub_1B5BA9F58()
{
}

void sub_1B5BA9F60()
{
  OUTLINED_FUNCTION_18();
  uint64_t v39 = v5;
  uint64_t v40 = v4;
  int v36 = v6;
  uint64_t v38 = v7;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841060);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_25();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841138);
  OUTLINED_FUNCTION_0_1();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_58();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841038);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_16();
  uint64_t v15 = sub_1B5BC9E00();
  MEMORY[0x1F4188790](v15 - 8);
  OUTLINED_FUNCTION_24();
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840F88);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_26_1();
  MEMORY[0x1F4188790](v18);
  char v20 = (char *)v35 - v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841098);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_40_1();
  if (v39 == 3)
  {
    v35[1] = v22;
    _OWORD v35[2] = v13;
    uint64_t v39 = v16;
    uint64_t v24 = v3;
    uint64_t v25 = v23;
    if (v36)
    {
      uint64_t v26 = *MEMORY[0x1E4F3D4A0];
      sub_1B5BC9660();
      OUTLINED_FUNCTION_1_0();
      (*(void (**)(uint64_t, uint64_t))(v27 + 104))(v1, v26);
      uint64_t v28 = v0 + *(int *)(v39 + 36);
      sub_1B5BABFD8(v1, v28);
      *(_WORD *)(v28 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB840F60) + 36)) = 256;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v0, v40, v9);
      sub_1B5BAC03C(v1);
      sub_1B5B7E3E8(v0, (uint64_t)v20, &qword_1EB840F88);
      sub_1B5BAC1FC((uint64_t)v20, v2, &qword_1EB840F88);
      swift_storeEnumTagMultiPayload();
      sub_1B5BABF14();
      sub_1B5B7E718((uint64_t)&unk_1EB841130);
      sub_1B5BC9830();
      sub_1B5BAC250((uint64_t)v20, &qword_1EB840F88);
    }
    else
    {
      uint64_t v32 = *(void (**)(void))(v11 + 16);
      OUTLINED_FUNCTION_22_4();
      v32();
      OUTLINED_FUNCTION_22_4();
      v32();
      OUTLINED_FUNCTION_49_3();
      sub_1B5BABF14();
      sub_1B5B7E718((uint64_t)&unk_1EB841130);
      sub_1B5BC9830();
      uint64_t v33 = OUTLINED_FUNCTION_52_3();
      v34(v33);
    }
    sub_1B5BAC1FC(v25, v24, &qword_1EB841098);
    swift_storeEnumTagMultiPayload();
    sub_1B5BABE74();
    sub_1B5B7E718((uint64_t)&unk_1EB841130);
    sub_1B5BC9830();
    sub_1B5BAC250(v25, &qword_1EB841098);
  }
  else
  {
    uint64_t v29 = *(void (**)(void))(v11 + 16);
    OUTLINED_FUNCTION_22_4();
    v29();
    OUTLINED_FUNCTION_22_4();
    v29();
    swift_storeEnumTagMultiPayload();
    sub_1B5BABE74();
    sub_1B5B7E718((uint64_t)&unk_1EB841130);
    sub_1B5BC9830();
    uint64_t v30 = OUTLINED_FUNCTION_52_3();
    v31(v30);
  }
  OUTLINED_FUNCTION_17();
}

void sub_1B5BAA3FC()
{
}

void sub_1B5BAA408()
{
  OUTLINED_FUNCTION_18();
  uint64_t v45 = v6;
  uint64_t v46 = v5;
  int v42 = v7;
  uint64_t v43 = v8;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94D90);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_24();
  uint64_t v10 = sub_1B5BC9E00();
  MEMORY[0x1F4188790](v10 - 8);
  OUTLINED_FUNCTION_57_1();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94D98);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_27_2();
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)v38 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94DA0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_58();
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94DA8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v20 = v19;
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_27();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94DB0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_40_1();
  if (v46 == 3)
  {
    v38[0] = v2;
    v38[1] = v23;
    uint64_t v40 = v3;
    uint64_t v41 = v16;
    uint64_t v46 = v24;
    uint64_t v39 = v0;
    uint64_t v25 = v43;
    if (v42)
    {
      uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
      v26(v1, v43, v18);
      v26(v40, v1, v18);
      swift_storeEnumTagMultiPayload();
      sub_1B5B7E718((uint64_t)&unk_1E9D94DC0);
      sub_1B5BAC138();
      uint64_t v27 = v46;
      sub_1B5BC9830();
      uint64_t v28 = OUTLINED_FUNCTION_33_1();
      v29(v28);
    }
    else
    {
      uint64_t v33 = *MEMORY[0x1E4F3D4A0];
      sub_1B5BC9660();
      OUTLINED_FUNCTION_1_0();
      (*(void (**)(uint64_t, uint64_t))(v34 + 104))(v4, v33);
      uint64_t v35 = v38[0];
      uint64_t v36 = v38[0] + *(int *)(v11 + 36);
      sub_1B5BABFD8(v4, v36);
      *(_WORD *)(v36 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB840F60) + 36)) = 256;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v35, v25, v18);
      sub_1B5BAC03C(v4);
      uint64_t v37 = (uint64_t)v15;
      sub_1B5B7E3E8(v35, (uint64_t)v15, &qword_1E9D94D98);
      sub_1B5BAC1FC((uint64_t)v15, v40, &qword_1E9D94D98);
      OUTLINED_FUNCTION_49_3();
      sub_1B5B7E718((uint64_t)&unk_1E9D94DC0);
      sub_1B5BAC138();
      uint64_t v27 = v46;
      sub_1B5BC9830();
      sub_1B5BAC250(v37, &qword_1E9D94D98);
    }
    sub_1B5BAC1FC(v27, v39, &qword_1E9D94DB0);
    swift_storeEnumTagMultiPayload();
    sub_1B5BAC098();
    sub_1B5B7E718((uint64_t)&unk_1E9D94DC0);
    sub_1B5BC9830();
    sub_1B5BAC250(v27, &qword_1E9D94DB0);
  }
  else
  {
    uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
    v30(v1, v43, v18);
    v30(v0, v1, v18);
    swift_storeEnumTagMultiPayload();
    sub_1B5BAC098();
    sub_1B5B7E718((uint64_t)&unk_1E9D94DC0);
    sub_1B5BC9830();
    uint64_t v31 = OUTLINED_FUNCTION_33_1();
    v32(v31);
  }
  OUTLINED_FUNCTION_17();
}

void sub_1B5BAA8D8()
{
}

void sub_1B5BAA8E4()
{
  OUTLINED_FUNCTION_18();
  char v4 = v3;
  uint64_t v45 = v5;
  uint64_t v50 = v6;
  uint64_t v48 = sub_1B5BC96A0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v42 = v7;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_25();
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB840CE0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_26_1();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_15_0();
  uint64_t v43 = v13;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840C80);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_8_4(v15, v41);
  uint64_t v16 = sub_1B5BC98E0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v18 = v17;
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_16_1();
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840CD8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v21 = v20;
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_32();
  uint64_t v25 = v23 - v24;
  MEMORY[0x1F4188790](v26);
  uint64_t v28 = (char *)&v41 - v27;
  if (v4)
  {
    sub_1B5BC98D0();
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840CA0);
    unint64_t v30 = sub_1B5B7E718((uint64_t)&unk_1EB840C98);
    unint64_t v31 = sub_1B5BAC2A4((uint64_t)&unk_1EB840CA8);
    sub_1B5BC9B60();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v1, v16);
    uint64_t v32 = v25;
    uint64_t v33 = v46;
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 32))(v28, v32, v46);
    (*(void (**)(uint64_t, char *, uint64_t))(v21 + 16))(v47, v28, v33);
    swift_storeEnumTagMultiPayload();
    uint64_t v51 = v29;
    uint64_t v52 = v16;
    unint64_t v53 = v30;
    unint64_t v54 = v31;
    swift_getOpaqueTypeConformance2();
    unint64_t v34 = sub_1B5BAC2A4((uint64_t)&unk_1EB840C68);
    uint64_t v51 = v29;
    uint64_t v52 = v48;
    unint64_t v53 = v30;
    unint64_t v54 = v34;
    swift_getOpaqueTypeConformance2();
    sub_1B5BC9830();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v28, v33);
  }
  else
  {
    sub_1B5BC9690();
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840CA0);
    unint64_t v36 = sub_1B5B7E718((uint64_t)&unk_1EB840C98);
    unint64_t v41 = sub_1B5BAC2A4((uint64_t)&unk_1EB840C68);
    uint64_t v37 = v48;
    sub_1B5BC9B60();
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v2, v37);
    uint64_t v38 = v43;
    uint64_t v39 = v49;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v43, v0, v49);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v47, v38, v39);
    swift_storeEnumTagMultiPayload();
    unint64_t v40 = sub_1B5BAC2A4((uint64_t)&unk_1EB840CA8);
    uint64_t v51 = v35;
    uint64_t v52 = v16;
    unint64_t v53 = v36;
    unint64_t v54 = v40;
    swift_getOpaqueTypeConformance2();
    uint64_t v51 = v35;
    uint64_t v52 = v37;
    unint64_t v53 = v36;
    unint64_t v54 = v41;
    swift_getOpaqueTypeConformance2();
    sub_1B5BC9830();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v38, v39);
  }
  OUTLINED_FUNCTION_17();
}

void sub_1B5BAAE38()
{
}

uint64_t sub_1B5BAAE40@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94DD0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_43_3();
  v5();
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94DD8);
  uint64_t v7 = a2 + *(int *)(result + 36);
  uint64_t v8 = 3;
  if (a1) {
    uint64_t v8 = 1;
  }
  *(void *)uint64_t v7 = KeyPath;
  *(void *)(v7 + 8) = v8;
  *(unsigned char *)(v7 + 16) = 0;
  return result;
}

uint64_t sub_1B5BAAED8@<X0>(uint64_t a1@<X8>)
{
  return sub_1B5BAAE40(*v1, a1);
}

void *sub_1B5BAAEE0@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  sub_1B5BC9E90();
  if (a1)
  {
    uint64_t v4 = OUTLINED_FUNCTION_18_3();
    return sub_1B5BAAFC0(*(double *)&v4, v5, v6, v7, v8, v9, v10, v11, v12, 0.0, 1, INFINITY, 0);
  }
  else
  {
    OUTLINED_FUNCTION_18_3();
    sub_1B5BC9500();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841610);
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_43_3();
    v20(v14, v15, v16, v17, v18, v19);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841598);
    return memcpy((void *)(a2 + *(int *)(v21 + 36)), __src, 0x70uLL);
  }
}

void *sub_1B5BAAFC0@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
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
    sub_1B5BCA060();
    uint64_t v23 = (void *)sub_1B5BC9990();
    sub_1B5BC9200();
  }
  sub_1B5BC9500();
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841610);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB841598);
  return memcpy((void *)(a9 + *(int *)(v25 + 36)), __src, 0x70uLL);
}

void *sub_1B5BAB18C@<X0>(uint64_t a1@<X8>)
{
  return sub_1B5BAAEE0(*v1, a1);
}

uint64_t sub_1B5BAB194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1;
  return MEMORY[0x1BA9A7230](&v4, a2, &unk_1F0ED1B28, a3);
}

uint64_t sub_1B5BAB1C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1;
  return MEMORY[0x1BA9A7230](&v4, a2, &unk_1F0ED1B50, a3);
}

uint64_t sub_1B5BAB1FC(uint64_t a1)
{
  OUTLINED_FUNCTION_44_3(a1);
  return MEMORY[0x1BA9A7230](&v2);
}

uint64_t sub_1B5BAB22C(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B5BAB244(a1, a2, a3, a4, (uint64_t)&unk_1F0ED1C50);
}

uint64_t sub_1B5BAB238(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1B5BAB244(a1, a2, a3, a4, (uint64_t)&unk_1F0ED1CD0);
}

uint64_t sub_1B5BAB244(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a1;
  uint64_t v7 = a2;
  return MEMORY[0x1BA9A7230](v6, a3, a5);
}

uint64_t sub_1B5BAB278(uint64_t a1)
{
  OUTLINED_FUNCTION_44_3(a1);
  return MEMORY[0x1BA9A7230](&v2);
}

uint64_t sub_1B5BAB2A8(uint64_t a1)
{
  OUTLINED_FUNCTION_44_3(a1);
  return MEMORY[0x1BA9A7230](&v2);
}

uint64_t sub_1B5BAB2D8(uint64_t a1)
{
  OUTLINED_FUNCTION_44_3(a1);
  return MEMORY[0x1BA9A7230](&v2);
}

unint64_t sub_1B5BAB308()
{
  return sub_1B5BABB5C((uint64_t)&unk_1EB841028);
}

unint64_t sub_1B5BAB330()
{
  unint64_t result = qword_1EB840FF8;
  if (!qword_1EB840FF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB841000);
    sub_1B5BAB3D0();
    sub_1B5B7E718((uint64_t)&unk_1EB841628);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840FF8);
  }
  return result;
}

unint64_t sub_1B5BAB3D0()
{
  unint64_t result = qword_1EB840F90;
  if (!qword_1EB840F90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840F98);
    sub_1B5B7E718((uint64_t)&unk_1EB841528);
    sub_1B5B7E718((uint64_t)&unk_1EB841158);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840F90);
  }
  return result;
}

unint64_t sub_1B5BAB494()
{
  unint64_t result = qword_1EB8413F8;
  if (!qword_1EB8413F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB841400);
    sub_1B5B7E718((uint64_t)&unk_1EB841528);
    sub_1B5B7E718((uint64_t)&unk_1EB841628);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB8413F8);
  }
  return result;
}

unint64_t sub_1B5BAB558()
{
  return sub_1B5BABD3C((uint64_t)&unk_1EB841110);
}

unint64_t sub_1B5BAB580()
{
  unint64_t result = qword_1EB8414F8;
  if (!qword_1EB8414F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB841500);
    sub_1B5BABB5C((uint64_t)&unk_1EB841458);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB8414F8);
  }
  return result;
}

unint64_t sub_1B5BAB618()
{
  unint64_t result = qword_1EB841428;
  if (!qword_1EB841428)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB841430);
    sub_1B5BAB6B8();
    sub_1B5B7E718((uint64_t)&unk_1EB841628);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB841428);
  }
  return result;
}

unint64_t sub_1B5BAB6B8()
{
  unint64_t result = qword_1EB8413E8;
  if (!qword_1EB8413E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB8413F0);
    sub_1B5B7E718((uint64_t)&unk_1EB841528);
    sub_1B5B7E718((uint64_t)&unk_1EB841618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB8413E8);
  }
  return result;
}

unint64_t sub_1B5BAB77C()
{
  return sub_1B5BAC620((uint64_t)&unk_1EB8410D0);
}

unint64_t sub_1B5BAB7B8()
{
  return sub_1B5BAC620((uint64_t)&unk_1E9D94D38);
}

unint64_t sub_1B5BAB7F4()
{
  return sub_1B5BAC620((uint64_t)&unk_1E9D94D40);
}

unint64_t sub_1B5BAB830()
{
  unint64_t result = qword_1E9D94D48;
  if (!qword_1E9D94D48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94D28);
    sub_1B5BAB8D0();
    sub_1B5B7E718((uint64_t)&unk_1EB841618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94D48);
  }
  return result;
}

unint64_t sub_1B5BAB8D0()
{
  unint64_t result = qword_1E9D94D50;
  if (!qword_1E9D94D50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94D20);
    sub_1B5B7E718((uint64_t)&unk_1E9D94D58);
    sub_1B5B7E718((uint64_t)&unk_1EB841628);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94D50);
  }
  return result;
}

unint64_t sub_1B5BAB994()
{
  return sub_1B5BAC620((uint64_t)&unk_1E9D94D60);
}

unint64_t sub_1B5BAB9D0()
{
  unint64_t result = qword_1E9D94D68;
  if (!qword_1E9D94D68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94CF0);
    sub_1B5BABA70();
    sub_1B5B7E718((uint64_t)&unk_1EB841628);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94D68);
  }
  return result;
}

unint64_t sub_1B5BABA70()
{
  unint64_t result = qword_1E9D94D70;
  if (!qword_1E9D94D70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94CE8);
    sub_1B5B7E718((uint64_t)&unk_1E9D94D58);
    sub_1B5B7E718((uint64_t)&unk_1EB841618);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94D70);
  }
  return result;
}

unint64_t sub_1B5BABB34()
{
  return sub_1B5BABB5C((uint64_t)&unk_1E9D94D78);
}

unint64_t sub_1B5BABB5C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    char v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1B5BABBD8()
{
  unint64_t result = qword_1E9D94D80;
  if (!qword_1E9D94D80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94CC8);
    sub_1B5BABC78();
    sub_1B5B7E718((uint64_t)&unk_1EB841628);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94D80);
  }
  return result;
}

unint64_t sub_1B5BABC78()
{
  unint64_t result = qword_1E9D94D88;
  if (!qword_1E9D94D88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94CC0);
    sub_1B5B7E718((uint64_t)&unk_1E9D94D58);
    sub_1B5B7E718((uint64_t)&unk_1EB841158);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94D88);
  }
  return result;
}

unint64_t sub_1B5BABD3C(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    char v5 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v5();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1B5BABDB0()
{
  unint64_t result = qword_1EB840B30;
  if (!qword_1EB840B30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840B38);
    sub_1B5B7E718((uint64_t)&unk_1EB840C00);
    sub_1B5B7E718((uint64_t)&unk_1EB840C10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840B30);
  }
  return result;
}

unint64_t sub_1B5BABE74()
{
  unint64_t result = qword_1EB841090;
  if (!qword_1EB841090)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB841098);
    sub_1B5BABF14();
    sub_1B5B7E718((uint64_t)&unk_1EB841130);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB841090);
  }
  return result;
}

unint64_t sub_1B5BABF14()
{
  unint64_t result = qword_1EB840F80;
  if (!qword_1EB840F80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840F88);
    sub_1B5B7E718((uint64_t)&unk_1EB841130);
    sub_1B5B7E718((uint64_t)&unk_1EB840F58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840F80);
  }
  return result;
}

uint64_t sub_1B5BABFD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B5BC9E00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B5BAC03C(uint64_t a1)
{
  uint64_t v2 = sub_1B5BC9E00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1B5BAC098()
{
  unint64_t result = qword_1E9D94DB8;
  if (!qword_1E9D94DB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94DB0);
    sub_1B5B7E718((uint64_t)&unk_1E9D94DC0);
    sub_1B5BAC138();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94DB8);
  }
  return result;
}

unint64_t sub_1B5BAC138()
{
  unint64_t result = qword_1E9D94DC8;
  if (!qword_1E9D94DC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94D98);
    sub_1B5B7E718((uint64_t)&unk_1E9D94DC0);
    sub_1B5B7E718((uint64_t)&unk_1EB840F58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94DC8);
  }
  return result;
}

uint64_t sub_1B5BAC1FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_43_3();
  v4();
  return a2;
}

uint64_t sub_1B5BAC250(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

unint64_t sub_1B5BAC2A4(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    v3(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t sub_1B5BAC2E8()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5BAC300()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5BAC318()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5BAC330()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5BAC348()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5BAC360()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5BAC378()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5BAC390()
{
  return OUTLINED_FUNCTION_5_0();
}

void type metadata accessor for TitleFontStyleModifier()
{
}

void type metadata accessor for SubtitleFontStyleModifier()
{
}

void type metadata accessor for PlatformActionButtonForegroundColor()
{
}

void type metadata accessor for BannerShapeModifier()
{
}

unsigned char *sub_1B5BAC3E4(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)unint64_t result = a2 - 255;
    *((void *)result + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = 0;
    if (a3 >= 0xFF) {
      result[16] = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      result[16] = 0;
    }
    if (a2) {
      return OUTLINED_FUNCTION_45_2(result, a2);
    }
  }
  return result;
}

void type metadata accessor for IconShapeModifier()
{
}

void type metadata accessor for ButtonStyleModifier()
{
}

void type metadata accessor for LineLimitModifier()
{
}

uint64_t sub_1B5BAC440(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 1 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 1) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_1B5BAC4D8(unsigned char *result, unsigned int a2, unsigned int a3)
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
        *(_WORD *)(result + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1B5BAC59CLL);
      case 4:
        *(_DWORD *)(result + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = v6;
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
        *(_WORD *)(result + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          unint64_t result = OUTLINED_FUNCTION_45_2(result, a2);
        break;
    }
  }
  return result;
}

void type metadata accessor for FrameParameterModifier()
{
}

unint64_t sub_1B5BAC5D0()
{
  return sub_1B5BAC620((uint64_t)&unk_1EB841120);
}

unint64_t sub_1B5BAC620(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_45(a1);
  if (!result)
  {
    unsigned int v6 = v5;
    BOOL v7 = v4;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    v7();
    v6();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1B5BAC6A4()
{
  return sub_1B5BAC620((uint64_t)&unk_1E9D94DE0);
}

unint64_t sub_1B5BAC6F8()
{
  unint64_t result = qword_1EB840BF0;
  if (!qword_1EB840BF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840BF8);
    sub_1B5BABD3C((uint64_t)&unk_1EB840BD0);
    sub_1B5B7E718((uint64_t)&unk_1EB840C00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840BF0);
  }
  return result;
}

unint64_t sub_1B5BAC7C0()
{
  unint64_t result = qword_1EB8410E0;
  if (!qword_1EB8410E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB8410E8);
    sub_1B5BABE74();
    sub_1B5B7E718((uint64_t)&unk_1EB841130);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB8410E0);
  }
  return result;
}

unint64_t sub_1B5BAC864()
{
  unint64_t result = qword_1E9D94DF0;
  if (!qword_1E9D94DF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94DF8);
    sub_1B5BAC098();
    sub_1B5B7E718((uint64_t)&unk_1E9D94DC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94DF0);
  }
  return result;
}

unint64_t sub_1B5BAC908()
{
  unint64_t result = qword_1EB840C88;
  if (!qword_1EB840C88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840C90);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB840CA0);
    sub_1B5BC98E0();
    sub_1B5B7E718((uint64_t)&unk_1EB840C98);
    sub_1B5BAC2A4((uint64_t)&unk_1EB840CA8);
    swift_getOpaqueTypeConformance2();
    sub_1B5BC96A0();
    sub_1B5BAC2A4((uint64_t)&unk_1EB840C68);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840C88);
  }
  return result;
}

unint64_t sub_1B5BACA90()
{
  unint64_t result = qword_1E9D94E00;
  if (!qword_1E9D94E00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94DD8);
    sub_1B5B7E718((uint64_t)&unk_1E9D94E08);
    sub_1B5B7E718((uint64_t)&unk_1EB841650);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94E00);
  }
  return result;
}

unint64_t sub_1B5BACB58()
{
  unint64_t result = qword_1EB841590;
  if (!qword_1EB841590)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB841598);
    sub_1B5B7E718((uint64_t)&unk_1EB841608);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB841590);
  }
  return result;
}

uint64_t sub_1B5BACBF8(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB022TitleFontStyleModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1F0ED1B28, (void (*)(void))sub_1B5BACC18);
}

unint64_t sub_1B5BACC18()
{
  unint64_t result = qword_1EB8412B8[0];
  if (!qword_1EB8412B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EB8412B8);
  }
  return result;
}

uint64_t sub_1B5BACC64(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB022TitleFontStyleModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1F0ED1B50, (void (*)(void))sub_1B5BACC84);
}

unint64_t sub_1B5BACC84()
{
  unint64_t result = qword_1E9D94E10;
  if (!qword_1E9D94E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94E10);
  }
  return result;
}

uint64_t sub_1B5BACCD0(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB022TitleFontStyleModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1F0ED1BD0, (void (*)(void))sub_1B5BACCF0);
}

unint64_t sub_1B5BACCF0()
{
  unint64_t result = qword_1EB840B18;
  if (!qword_1EB840B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840B18);
  }
  return result;
}

uint64_t sub_1B5BACD3C(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB022TitleFontStyleModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1F0ED1C50, (void (*)(void))sub_1B5BACD5C);
}

unint64_t sub_1B5BACD5C()
{
  unint64_t result = qword_1E9D94E18;
  if (!qword_1E9D94E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94E18);
  }
  return result;
}

uint64_t sub_1B5BACDA8(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB022TitleFontStyleModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1F0ED1CD0, (void (*)(void))sub_1B5BACDC8);
}

unint64_t sub_1B5BACDC8()
{
  unint64_t result = qword_1E9D94E20;
  if (!qword_1E9D94E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94E20);
  }
  return result;
}

uint64_t sub_1B5BACE14(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB022TitleFontStyleModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1F0ED1D50, (void (*)(void))sub_1B5BACE34);
}

unint64_t sub_1B5BACE34()
{
  unint64_t result = qword_1EB840C48;
  if (!qword_1EB840C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB840C48);
  }
  return result;
}

uint64_t sub_1B5BACE80(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB022TitleFontStyleModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1F0ED1DD0, (void (*)(void))sub_1B5BACEA0);
}

unint64_t sub_1B5BACEA0()
{
  unint64_t result = qword_1E9D94E28;
  if (!qword_1E9D94E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94E28);
  }
  return result;
}

uint64_t sub_1B5BACEEC(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB022TitleFontStyleModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1F0ED1E50, (void (*)(void))sub_1B5BACF7C);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB022TitleFontStyleModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return swift_getWitnessTable();
}

unint64_t sub_1B5BACF7C()
{
  unint64_t result = qword_1E9D94E30;
  if (!qword_1E9D94E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94E30);
  }
  return result;
}

uint64_t sub_1B5BACFC8(void *a1)
{
  id v1 = a1;
  sub_1B5BA0864();
  return OUTLINED_FUNCTION_6_4();
}

void sub_1B5BAD004()
{
  OUTLINED_FUNCTION_44();
  char v4 = v3;
  uint64_t v6 = v5;
  double v8 = v7;
  uint64_t v27 = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94E38);
  uint64_t v11 = OUTLINED_FUNCTION_19_1(v10);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_16();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94E40);
  uint64_t v13 = v12 - 8;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_24();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94E48);
  uint64_t v15 = OUTLINED_FUNCTION_19_1(v14);
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_16_1();
  uint64_t v16 = sub_1B5BC96E0();
  uint64_t v17 = *(void *)sub_1B5B72764();
  *(void *)uint64_t v0 = v16;
  *(void *)(v0 + 8) = v17;
  *(unsigned char *)(v0 + 16) = 0;
  uint64_t v18 = v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94E50) + 44);
  uint64_t v19 = sub_1B5BC9640();
  uint64_t v20 = *(void *)sub_1B5B72758();
  *(void *)uint64_t v2 = v19;
  *(void *)(v2 + 8) = v20;
  *(unsigned char *)(v2 + 16) = 0;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94E58);
  sub_1B5BAD250(v8, v6, v4 & 1, v2 + *(int *)(v21 + 44));
  LOBYTE(v19) = sub_1B5BC99B0();
  sub_1B5BC9320();
  OUTLINED_FUNCTION_7();
  sub_1B5B7E444(v2, v1, &qword_1E9D94E38);
  uint64_t v22 = (unsigned char *)(v1 + *(int *)(v13 + 44));
  *uint64_t v22 = v19;
  OUTLINED_FUNCTION_64((uint64_t)v22);
  sub_1B5BAC250(v2, &qword_1E9D94E38);
  LOBYTE(v19) = sub_1B5BC99C0();
  sub_1B5BC9320();
  OUTLINED_FUNCTION_7();
  uint64_t v23 = OUTLINED_FUNCTION_45_3();
  sub_1B5B7E444(v23, v24, &qword_1E9D94E40);
  uint64_t v25 = (unsigned char *)(v18 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94E60) + 36));
  unsigned char *v25 = v19;
  OUTLINED_FUNCTION_64((uint64_t)v25);
  sub_1B5BAC250(v1, &qword_1E9D94E40);
  LOBYTE(v19) = sub_1B5BC99B0();
  sub_1B5BC9320();
  OUTLINED_FUNCTION_7();
  sub_1B5B7E444(v0, v27, &qword_1E9D94E48);
  uint64_t v26 = (unsigned char *)(v27 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94E68) + 36));
  *uint64_t v26 = v19;
  OUTLINED_FUNCTION_64((uint64_t)v26);
  sub_1B5BAC250(v0, &qword_1E9D94E48);
  OUTLINED_FUNCTION_24_0();
}

void sub_1B5BAD250(void *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v63 = a2;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D95050);
  uint64_t v14 = OUTLINED_FUNCTION_19_1(v13);
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_27();
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D95058);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_9_4();
  uint64_t v17 = MEMORY[0x1F4188790](v16);
  uint64_t v19 = (char *)&v53 - v18;
  if (a3)
  {
    uint64_t v22 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *a1) + 0x230))(v17);
    swift_bridgeObjectRelease();
    uint64_t v23 = a1;
    if (v22)
    {
      sub_1B5B76E48();
      v73[0] = v24;
      LOWORD(v73[1]) = v25 & 1;
    }
    else
    {
      sub_1B5B7E7B0();
      v73[0] = v26;
      LOBYTE(v73[1]) = v27 & 1;
      BYTE1(v73[1]) = 1;
    }
    sub_1B5B7D6A8();
    sub_1B5B7D6F4();
    sub_1B5BC9830();
    uint64_t v20 = v74;
    if (BYTE1(v75)) {
      int v28 = 256;
    }
    else {
      int v28 = 0;
    }
    int v21 = v28 | v75;
  }
  else
  {
    uint64_t v20 = 0;
    int v21 = 65280;
  }
  int v62 = v21;
  id v55 = v20;
  uint64_t v65 = sub_1B5BC96E0();
  uint64_t v61 = *(void *)sub_1B5B72770();
  sub_1B5BAD6E0();
  unsigned __int8 v29 = v76;
  uint64_t v59 = v77;
  uint64_t v60 = v75;
  uint64_t v58 = v78;
  uint64_t v68 = v79;
  uint64_t v69 = (uint64_t)v74;
  uint64_t v66 = v81;
  uint64_t v67 = v80;
  int v57 = sub_1B5BC99F0();
  sub_1B5B72740();
  sub_1B5BC9320();
  OUTLINED_FUNCTION_7();
  unsigned __int8 v72 = 0;
  unsigned __int8 v71 = v29;
  unsigned __int8 v70 = 0;
  uint64_t v30 = sub_1B5BC9640();
  uint64_t v31 = *(void *)sub_1B5B7274C();
  *(void *)uint64_t v5 = v30;
  *(void *)(v5 + 8) = v31;
  *(unsigned char *)(v5 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D95060);
  sub_1B5BADB14();
  LOBYTE(v3sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = sub_1B5BC99C0();
  sub_1B5B72764();
  sub_1B5BC9320();
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  sub_1B5B7E444(v5, v4, &qword_1E9D95050);
  uint64_t v40 = v4 + *(int *)(v64 + 36);
  *(unsigned char *)uint64_t v40 = v30;
  *(void *)(v40 + 8) = v33;
  *(void *)(v40 + 16) = v35;
  *(void *)(v40 + 24) = v37;
  *(void *)(v40 + 32) = v39;
  *(unsigned char *)(v40 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = 0;
  sub_1B5BAC250(v5, &qword_1E9D95050);
  unint64_t v54 = v19;
  sub_1B5B7E3E8(v4, (uint64_t)v19, &qword_1E9D95058);
  unsigned __int8 v41 = v72;
  LODWORD(v63) = v72;
  unsigned __int8 v42 = v71;
  LODWORD(v64) = v71;
  LOBYTE(v3sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v70;
  int v56 = v70;
  uint64_t v43 = OUTLINED_FUNCTION_144();
  sub_1B5B7E444(v43, v44, &qword_1E9D95058);
  *(void *)a4 = v20;
  __int16 v45 = v62;
  *(_WORD *)(a4 + 8) = v62;
  uint64_t v46 = v61;
  v73[0] = v65;
  v73[1] = v61;
  LOBYTE(v73[2]) = v41;
  uint64_t v48 = v59;
  uint64_t v47 = v60;
  void v73[3] = v69;
  v73[4] = v60;
  LOBYTE(v73[5]) = v42;
  uint64_t v49 = v58;
  v73[6] = v59;
  v73[7] = v58;
  v73[8] = v68;
  v73[9] = v67;
  v73[10] = v66;
  LOWORD(v73[11]) = 256;
  char v50 = v57;
  LOBYTE(v73[12]) = v57;
  v73[13] = v6;
  v73[14] = v7;
  v73[15] = v8;
  v73[16] = v9;
  LOBYTE(v73[17]) = v30;
  memcpy((void *)(a4 + 16), v73, 0x89uLL);
  *(void *)(a4 + 16sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = 0;
  *(unsigned char *)(a4 + 168) = 1;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D95068);
  sub_1B5B7E444(v4, a4 + *(int *)(v51 + 80), &qword_1E9D95058);
  id v52 = v55;
  sub_1B5BB1B0C(v55, v45);
  sub_1B5BB1B24((uint64_t)v73);
  sub_1B5BAC250((uint64_t)v54, &qword_1E9D95058);
  sub_1B5BAC250(v4, &qword_1E9D95058);
  uint64_t v74 = (void *)v65;
  uint64_t v75 = v46;
  unsigned __int8 v76 = v63;
  uint64_t v77 = v69;
  uint64_t v78 = v47;
  LOBYTE(v79) = v64;
  uint64_t v80 = v48;
  uint64_t v81 = v49;
  uint64_t v82 = v68;
  uint64_t v83 = v67;
  uint64_t v84 = v66;
  __int16 v85 = 256;
  char v86 = v50;
  uint64_t v87 = v6;
  uint64_t v88 = v7;
  uint64_t v89 = v8;
  uint64_t v90 = v9;
  char v91 = v56;
  sub_1B5BB1BA0((uint64_t)&v74);
  sub_1B5BB1C1C(v52, v45);
}

void sub_1B5BAD6E0()
{
  OUTLINED_FUNCTION_18();
  __int16 v58 = v1;
  char v3 = v2;
  uint64_t v59 = v4;
  uint64_t v5 = sub_1B5BC9A60();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_16();
  (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v3) + 0x110))();
  sub_1B5B744B8();
  sub_1B5BC9B30();
  char v10 = v9 & 1;
  sub_1B5BC9A10();
  unsigned int v52 = *MEMORY[0x1E4F3E0F8];
  uint64_t v51 = *(void (**)(uint64_t))(v7 + 104);
  v51(v0);
  sub_1B5BC9A70();
  swift_release();
  uint64_t v53 = v0;
  uint64_t v56 = v5;
  char v50 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v50(v0, v5);
  sub_1B5BC9A20();
  swift_release();
  uint64_t v11 = sub_1B5BC9B10();
  uint64_t v13 = v12;
  LOBYTE(v5) = v14;
  swift_release();
  uint64_t v15 = OUTLINED_FUNCTION_45_3();
  sub_1B5B7B664(v15, v16, v10);
  swift_bridgeObjectRelease();
  sub_1B5BC98A0();
  uint64_t v17 = sub_1B5BC9B00();
  uint64_t v19 = v18;
  char v21 = v20;
  uint64_t v23 = v22;
  sub_1B5B7B664(v11, v13, v5 & 1);
  uint64_t v24 = swift_bridgeObjectRelease();
  if ((v58 & 0x100) != 0)
  {
    (*(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v3) + 0x140))(v24);
    if (v29)
    {
      uint64_t v30 = sub_1B5BC9B30();
      uint64_t v32 = v31;
      char v34 = v33 & 1;
      sub_1B5BC9A10();
      ((void (*)(uint64_t, void, uint64_t))v51)(v53, v52, v56);
      sub_1B5BC9A70();
      swift_release();
      v50(v53, v56);
      uint64_t v35 = sub_1B5BC9B10();
      uint64_t v55 = v36;
      uint64_t v57 = v35;
      char v38 = v37;
      swift_release();
      char v54 = v38 & 1;
      sub_1B5B7B664(v30, v32, v34);
      swift_bridgeObjectRelease();
      sub_1B5BC98C0();
      uint64_t v25 = sub_1B5BC9B00();
      uint64_t v26 = v39;
      uint64_t v28 = v40;
      uint64_t v27 = v41 & 1;
      sub_1B5B7B664(v57, v55, v54);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      uint64_t v28 = 0;
    }
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 1;
  }
  *(void *)uint64_t v59 = v17;
  *(void *)(v59 + 8) = v19;
  *(unsigned char *)(v59 + 16) = v21 & 1;
  *(void *)(v59 + 24) = v23;
  *(void *)(v59 + 32) = v25;
  *(void *)(v59 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v26;
  *(void *)(v59 + 48) = v27;
  *(void *)(v59 + 56) = v28;
  sub_1B5B7D780(v17, v19, v21 & 1);
  swift_bridgeObjectRetain();
  uint64_t v42 = OUTLINED_FUNCTION_50_3();
  sub_1B5BB1B90(v42, v43, v44, v45);
  uint64_t v46 = OUTLINED_FUNCTION_50_3();
  sub_1B5BB1C0C(v46, v47, v48, v49);
  sub_1B5B7B664(v17, v19, v21 & 1);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17();
}

void sub_1B5BADB14()
{
  OUTLINED_FUNCTION_44();
  unsigned int v123 = v3;
  uint64_t v117 = v5;
  uint64_t v118 = v4;
  uint64_t v7 = v6;
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D95070);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_3();
  uint64_t v110 = v9;
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D95078);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_3();
  uint64_t v111 = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D95080);
  uint64_t v13 = OUTLINED_FUNCTION_19_1(v12);
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_32();
  uint64_t v116 = v14 - v15;
  uint64_t v17 = MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_42_3(v17, v18, v19, v20, v21, v22, v23, v24, v92[0]);
  uint64_t v121 = sub_1B5BC9350();
  OUTLINED_FUNCTION_0_1();
  uint64_t v124 = v25;
  MEMORY[0x1F4188790](v26);
  OUTLINED_FUNCTION_3();
  uint64_t v120 = v27;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB840E78);
  OUTLINED_FUNCTION_0_1();
  uint64_t v30 = v29;
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_26();
  uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D95088);
  OUTLINED_FUNCTION_0_1();
  uint64_t v33 = v32;
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_16_1();
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D95090);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_29_3();
  MEMORY[0x1F4188790](v37);
  uint64_t v122 = (uint64_t)v92 - v38;
  uint64_t v39 = swift_allocObject();
  uint64_t v40 = v118;
  *(void *)(v39 + 16) = v7;
  *(void *)(v39 + 24) = v40;
  unsigned int v41 = v123;
  *(unsigned char *)(v39 + 32) = v123 & 1;
  *(unsigned char *)(v39 + 33) = BYTE1(v41) & 1;
  *(unsigned char *)(v39 + 34) = BYTE2(v41) & 1;
  uint64_t v125 = v7;
  uint64_t v126 = v40;
  uint64_t v42 = v7;
  uint64_t v43 = v40;
  int v103 = v41 & 1;
  __int16 v127 = v41 & 0x101;
  int v102 = (v41 >> 8) & 1;
  char v128 = BYTE2(v41) & 1;
  uint64_t v113 = v42;
  id v104 = v43;
  sub_1B5BC9D70();
  uint64_t v105 = sub_1B5BA2708(&qword_1EB840E70, qword_1EB840E78);
  sub_1B5BAB278(0);
  char v44 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
  uint64_t v107 = v0;
  uint64_t v109 = v28;
  uint64_t v45 = v2;
  uint64_t v108 = v30 + 8;
  uint64_t v101 = v44;
  v44(v0, v28);
  uint64_t v46 = v123;
  uint64_t v47 = v124;
  char v48 = *(void (**)(void))(v124 + 104);
  uint64_t v49 = v120;
  unsigned int v100 = *MEMORY[0x1E4F3C610];
  uint64_t v50 = v121;
  uint64_t v99 = (void (*)(void *, void, uint64_t))v48;
  uint64_t v98 = v124 + 104;
  v48(v120);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v106 = v35;
  unsigned int v52 = (uint64_t *)(v45 + *(int *)(v35 + 36));
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB840CC0);
  uint64_t v53 = v49;
  uint64_t v97 = *(void *)(v47 + 16);
  v92[2] = v47 + 16;
  OUTLINED_FUNCTION_23_0();
  v54();
  uint64_t *v52 = KeyPath;
  uint64_t v55 = v33 + 16;
  uint64_t v56 = *(void (**)(void))(v33 + 16);
  uint64_t v57 = v119;
  OUTLINED_FUNCTION_84();
  v56();
  uint64_t v95 = *(void (**)(void *, uint64_t))(v47 + 8);
  uint64_t v124 = v47 + 8;
  v95(v53, v50);
  uint64_t v59 = *(void (**)(char **, uint64_t))(v33 + 8);
  __int16 v58 = (void *)(v33 + 8);
  uint64_t v93 = v1;
  uint64_t v118 = v58;
  uint64_t v94 = v59;
  v59(v1, v57);
  uint64_t v60 = v45;
  uint64_t v61 = v122;
  uint64_t v62 = sub_1B5B7E3E8(v45, v122, &qword_1E9D95090);
  if ((v46 & 0x10000) != 0)
  {
    uint64_t v64 = v46;
    v92[1] = (uint64_t)v56;
    uint64_t v65 = (uint64_t)v113;
    uint64_t v66 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & *v113) + 0x1B8))(v62);
    if (!v66)
    {
      OUTLINED_FUNCTION_21_2();
LABEL_11:
      __swift_storeEnumTagSinglePayload(v65, v88, 1, (uint64_t)v53);
      sub_1B5B7E3E8(v65, (uint64_t)v58, &qword_1E9D95078);
      uint64_t v63 = 0;
      goto LABEL_12;
    }
    __int16 v58 = v66;
    uint64_t v53 = (void *)v65;
    __int16 v1 = &selRef_invalidateBannerView;
    if (objc_msgSend(v66, sel_respondsToSelector_, sel_suggestionDismissAction))
    {
      __int16 v1 = (char **)objc_msgSend(v58, sel_suggestionDismissAction);
      swift_unknownObjectRelease();
      if (v1)
      {
        id v67 = objc_msgSend(v1, sel_title);

        uint64_t v68 = sub_1B5BC9F40();
        uint64_t v70 = v69;

        uint64_t v71 = swift_allocObject();
        unsigned __int8 v72 = v104;
        *(void *)(v71 + 16) = v53;
        *(void *)(v71 + 24) = v72;
        *(unsigned char *)(v71 + 32) = v103;
        *(unsigned char *)(v71 + 33) = v102;
        *(unsigned char *)(v71 + 34) = (v46 & 0x10000) >> 16;
        MEMORY[0x1F4188790](v71);
        v92[-2] = v68;
        v92[-1] = v70;
        id v73 = v53;
        id v74 = v72;
        uint64_t v75 = v107;
        sub_1B5BC9D70();
        swift_bridgeObjectRelease();
        unsigned __int8 v76 = v93;
        uint64_t v77 = v109;
        sub_1B5BAB278(0);
        v101(v75, v77);
        uint64_t v79 = v120;
        uint64_t v78 = v121;
        v99(v120, v100, v121);
        uint64_t v80 = swift_getKeyPath();
        uint64_t v81 = (uint64_t *)(v60 + *(int *)(v106 + 36));
        OUTLINED_FUNCTION_23_0();
        v82();
        *uint64_t v81 = v80;
        uint64_t v83 = v119;
        OUTLINED_FUNCTION_84();
        v84();
        v95(v79, v78);
        v94(v76, v83);
        char v85 = sub_1B5BC99F0();
        sub_1B5B72740();
        sub_1B5BC9320();
        OUTLINED_FUNCTION_7();
        uint64_t v86 = v110;
        sub_1B5B7E444(v60, v110, &qword_1E9D95090);
        uint64_t v53 = (void *)v112;
        uint64_t v87 = (unsigned char *)(v86 + *(int *)(v112 + 36));
        *uint64_t v87 = v85;
        OUTLINED_FUNCTION_64((uint64_t)v87);
        sub_1B5BAC250(v60, &qword_1E9D95090);
        uint64_t v65 = v111;
        sub_1B5B7E3E8(v86, v111, &qword_1E9D95070);
        uint64_t v88 = 0;
        uint64_t v64 = v116;
        __int16 v1 = v117;
        __int16 v58 = v114;
        uint64_t v55 = v115;
LABEL_10:
        uint64_t v61 = v122;
        goto LABEL_11;
      }
    }
    else
    {
      swift_unknownObjectRelease();
    }
    OUTLINED_FUNCTION_21_2();
    goto LABEL_10;
  }
  uint64_t v63 = 1;
  uint64_t v64 = v116;
  __int16 v1 = v117;
  __int16 v58 = v114;
  uint64_t v55 = v115;
LABEL_12:
  __swift_storeEnumTagSinglePayload((uint64_t)v58, v63, 1, v55);
  sub_1B5B7E444(v61, v60, &qword_1E9D95090);
  uint64_t v89 = OUTLINED_FUNCTION_144();
  sub_1B5B7E444(v89, v90, &qword_1E9D95080);
  sub_1B5B7E444(v60, (uint64_t)v1, &qword_1E9D95090);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D95098);
  sub_1B5B7E444(v64, (uint64_t)v1 + *(int *)(v91 + 48), &qword_1E9D95080);
  sub_1B5BAC250((uint64_t)v58, &qword_1E9D95080);
  sub_1B5BAC250(v61, &qword_1E9D95090);
  sub_1B5BAC250(v64, &qword_1E9D95080);
  sub_1B5BAC250(v60, &qword_1E9D95090);
  OUTLINED_FUNCTION_24_0();
}

void sub_1B5BAE430()
{
}

void sub_1B5BAE464()
{
  OUTLINED_FUNCTION_18();
  sub_1B5BC9AB0();
  sub_1B5BC9AD0();
  sub_1B5BC9840();
  sub_1B5BC9CC0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v1 = v0;
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_9_4();
  MEMORY[0x1F4188790](v3);
  swift_getWitnessTable();
  swift_getWitnessTable();
  swift_getWitnessTable();
  sub_1B5BC9CB0();
  swift_getWitnessTable();
  uint64_t v4 = *(void (**)(void))(v1 + 16);
  OUTLINED_FUNCTION_43_4();
  OUTLINED_FUNCTION_84();
  v4();
  uint64_t v5 = *(void (**)(void))(v1 + 8);
  OUTLINED_FUNCTION_34_3();
  v5();
  OUTLINED_FUNCTION_84();
  v4();
  OUTLINED_FUNCTION_34_3();
  v5();
  OUTLINED_FUNCTION_17();
}

void sub_1B5BAE65C()
{
  OUTLINED_FUNCTION_18();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v48 = v4;
  uint64_t v49 = v5;
  uint64_t v52 = v6;
  uint64_t v60 = v2;
  uint64_t v59 = MEMORY[0x1E4FBC248];
  uint64_t v61 = MEMORY[0x1E4FBC258];
  uint64_t v62 = v0;
  uint64_t v7 = sub_1B5BC9AD0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v47 = v8;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_29_3();
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_42_3(v11, v12, v13, v14, v15, v16, v17, v18, v46[0]);
  sub_1B5BC9AB0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v20 = v19;
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_32();
  MEMORY[0x1F4188790](v22);
  OUTLINED_FUNCTION_43_4();
  sub_1B5BC9840();
  OUTLINED_FUNCTION_0_1();
  uint64_t v50 = v24;
  uint64_t v51 = v23;
  MEMORY[0x1F4188790](v23);
  uint64_t v26 = (char *)v46 - v25;
  char v27 = sub_1B5B743FC();
  uint64_t v53 = v3;
  uint64_t v54 = v1;
  uint64_t v55 = v48;
  uint64_t v56 = v49;
  if (v27)
  {
    sub_1B5BC9AA0();
    swift_getWitnessTable();
    uint64_t v28 = *(void (**)(void))(v20 + 16);
    OUTLINED_FUNCTION_31_3();
    v28();
    uint64_t v29 = *(void (**)(void))(v20 + 8);
    OUTLINED_FUNCTION_33_2();
    v29();
    OUTLINED_FUNCTION_31_3();
    v28();
    swift_getWitnessTable();
    OUTLINED_FUNCTION_43_4();
    sub_1B5B83C5C(v30, v31);
    OUTLINED_FUNCTION_33_2();
    v29();
    OUTLINED_FUNCTION_33_2();
    v29();
  }
  else
  {
    sub_1B5BC9AC0();
    swift_getWitnessTable();
    uint64_t v33 = v46[1];
    uint64_t v32 = v47;
    uint64_t v34 = *(void (**)(void))(v47 + 16);
    OUTLINED_FUNCTION_31_3();
    v34();
    uint64_t v35 = *(void (**)(uint64_t))(v32 + 8);
    uint64_t v36 = OUTLINED_FUNCTION_51_3();
    v35(v36);
    OUTLINED_FUNCTION_31_3();
    v34();
    swift_getWitnessTable();
    OUTLINED_FUNCTION_43_4();
    sub_1B5B83D54(v37, v38, v39);
    uint64_t v40 = OUTLINED_FUNCTION_51_3();
    v35(v40);
    ((void (*)(uint64_t, uint64_t))v35)(v33, v7);
  }
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v42 = swift_getWitnessTable();
  uint64_t v57 = WitnessTable;
  uint64_t v58 = v42;
  uint64_t v43 = v51;
  swift_getWitnessTable();
  uint64_t v44 = v50;
  OUTLINED_FUNCTION_80();
  v45();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v26, v43);
  OUTLINED_FUNCTION_17();
}

void sub_1B5BAEA3C()
{
}

uint64_t sub_1B5BAEA48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 - 8);
  MEMORY[0x1F4188790](a1);
  OUTLINED_FUNCTION_9_4();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_41_3();
  v8();
  uint64_t v9 = *(void (**)(void))(v6 + 16);
  OUTLINED_FUNCTION_144();
  OUTLINED_FUNCTION_54();
  v9();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v10(v3, a3);
  OUTLINED_FUNCTION_54();
  v9();
  return ((uint64_t (*)(uint64_t, uint64_t))v10)(v4, a3);
}

void sub_1B5BAEB58()
{
}

void sub_1B5BAEB68()
{
  OUTLINED_FUNCTION_18();
  v24[1] = v1;
  uint64_t v26 = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94E70);
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94E78);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_24();
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94E80);
  OUTLINED_FUNCTION_0_1();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  uint64_t v11 = OUTLINED_FUNCTION_18_4();
  if (v11)
  {
    v24[0] = v24;
    MEMORY[0x1F4188790](v11);
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94E88);
    uint64_t v13 = sub_1B5BA2708(&qword_1E9D94E90, &qword_1E9D94E70);
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94E98);
    uint64_t v15 = sub_1B5BA2708(&qword_1E9D94EA0, &qword_1E9D94E98);
    uint64_t v27 = v14;
    uint64_t v28 = v15;
    uint64_t v16 = OUTLINED_FUNCTION_20_5();
    sub_1B5BC9BF0();
    uint64_t v17 = v25;
    OUTLINED_FUNCTION_80();
    v18();
    OUTLINED_FUNCTION_45_3();
    swift_storeEnumTagMultiPayload();
    uint64_t v27 = v3;
    uint64_t v28 = v12;
    uint64_t v29 = v13;
    uint64_t v30 = v16;
    OUTLINED_FUNCTION_20_5();
    sub_1B5BC9830();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0, v17);
  }
  else
  {
    uint64_t v19 = *(void (**)(void))(v5 + 16);
    OUTLINED_FUNCTION_54();
    v19();
    OUTLINED_FUNCTION_54();
    v19();
    OUTLINED_FUNCTION_45_3();
    swift_storeEnumTagMultiPayload();
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94E88);
    uint64_t v21 = sub_1B5BA2708(&qword_1E9D94E90, &qword_1E9D94E70);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94E98);
    sub_1B5BA2708(&qword_1E9D94EA0, &qword_1E9D94E98);
    uint64_t v27 = v3;
    uint64_t v28 = v20;
    uint64_t v29 = v21;
    uint64_t v30 = OUTLINED_FUNCTION_20_5();
    OUTLINED_FUNCTION_20_5();
    sub_1B5BC9830();
    uint64_t v22 = OUTLINED_FUNCTION_46_3();
    v23(v22);
  }
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1B5BAEEF8()
{
  uint64_t v1 = sub_1B5BC9860();
  uint64_t v2 = OUTLINED_FUNCTION_19_1(v1);
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_27();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94E98);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_16();
  sub_1B5BC9850();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D95030);
  sub_1B5BA2708(&qword_1E9D95038, &qword_1E9D95030);
  sub_1B5BC94F0();
  uint64_t v5 = sub_1B5BA2708(&qword_1E9D94EA0, &qword_1E9D94E98);
  MEMORY[0x1BA9A6EC0](v0, v3, v5);
  OUTLINED_FUNCTION_34_3();
  return v6();
}

uint64_t sub_1B5BAF070()
{
  return sub_1B5BAEEF8();
}

void sub_1B5BAF078()
{
  OUTLINED_FUNCTION_44();
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB840E78);
  OUTLINED_FUNCTION_0_1();
  uint64_t v11 = v10;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_27();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D95040);
  uint64_t v14 = v13 - 8;
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_28_4();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_41_3();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v6;
  *(void *)(v16 + 24) = v4;
  swift_retain();
  sub_1B5BC9D70();
  LOBYTE(v4) = sub_1B5BC99F0();
  sub_1B5B7274C();
  sub_1B5BC9320();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_80();
  v17();
  uint64_t v18 = (unsigned char *)(v0 + *(int *)(v14 + 44));
  *uint64_t v18 = v4;
  OUTLINED_FUNCTION_64((uint64_t)v18);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v9);
  sub_1B5B7E3E8(v0, v1, &qword_1E9D95040);
  sub_1B5B7E444(v1, v0, &qword_1E9D95040);
  *(void *)uint64_t v8 = 0;
  *(unsigned char *)(v8 + 8) = 1;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D95048);
  sub_1B5B7E444(v0, v8 + *(int *)(v19 + 48), &qword_1E9D95040);
  sub_1B5BAC250(v1, &qword_1E9D95040);
  sub_1B5BAC250(v0, &qword_1E9D95040);
  OUTLINED_FUNCTION_24_0();
}

uint64_t sub_1B5BAF27C()
{
  sub_1B5B72B30();
  sub_1B5B744B8();
  uint64_t v0 = sub_1B5BC9B30();
  return OUTLINED_FUNCTION_137(v0, v1, v2, v3);
}

void sub_1B5BAF2E0()
{
}

void sub_1B5BAF2E8()
{
  OUTLINED_FUNCTION_18();
  v25[1] = v4;
  v25[3] = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94EA8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_16();
  void v25[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94EB0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_12_0();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94EB8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12;
  MEMORY[0x1F4188790](v14);
  OUTLINED_FUNCTION_25();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94EC0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_28_4();
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)v25 - v18;
  if (sub_1B5B743FC())
  {
    v25[0] = sub_1B5BA2708(&qword_1E9D94ED0, &qword_1E9D94EA8);
    sub_1B5BC9BD0();
    uint64_t v20 = *sub_1B5B93CD0();
    swift_retain();
    char v21 = sub_1B5BC99A0();
    OUTLINED_FUNCTION_80();
    v22();
    uint64_t v23 = v0 + *(int *)(v15 + 36);
    *(void *)uint64_t v23 = v20;
    *(unsigned char *)(v23 + 8) = v21;
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v3, v11);
    sub_1B5B7E3E8(v0, (uint64_t)v19, &qword_1E9D94EC0);
    sub_1B5B7E444((uint64_t)v19, v1, &qword_1E9D94EC0);
    swift_storeEnumTagMultiPayload();
    sub_1B5BAF5D8();
    OUTLINED_FUNCTION_49_4();
    sub_1B5BC9830();
    sub_1B5BAC250((uint64_t)v19, &qword_1E9D94EC0);
  }
  else
  {
    uint64_t v24 = *(void (**)(void))(v8 + 16);
    OUTLINED_FUNCTION_31_3();
    v24();
    OUTLINED_FUNCTION_31_3();
    v24();
    swift_storeEnumTagMultiPayload();
    sub_1B5BAF5D8();
    sub_1B5BA2708(&qword_1E9D94ED0, &qword_1E9D94EA8);
    OUTLINED_FUNCTION_49_4();
    sub_1B5BC9830();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v2, v6);
  }
  OUTLINED_FUNCTION_17();
}

unint64_t sub_1B5BAF5D8()
{
  unint64_t result = qword_1E9D94EC8;
  if (!qword_1E9D94EC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94EC0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94EA8);
    sub_1B5BA2708(&qword_1E9D94ED0, &qword_1E9D94EA8);
    swift_getOpaqueTypeConformance2();
    sub_1B5BA2708(&qword_1EB840AE8, (uint64_t *)&unk_1EB840AF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94EC8);
  }
  return result;
}

void sub_1B5BAF6D8()
{
}

void sub_1B5BAF6F0()
{
  OUTLINED_FUNCTION_18();
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94ED8);
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94EE0);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_12_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94EE8);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v10);
  if (OUTLINED_FUNCTION_18_4())
  {
    double v11 = *(double *)sub_1B5B727AC();
    double v12 = *(double *)sub_1B5B727A0();
    double v13 = *(double *)sub_1B5B72794();
    sub_1B5BC9E80();
    sub_1B5BAF9EC(v11, 0, 0.0, 1, v12, 0, v13, 0, v2, 0.0, 1, INFINITY, 0);
    sub_1B5B7E444(v2, v0, &qword_1E9D94EE8);
    swift_storeEnumTagMultiPayload();
    sub_1B5BAF94C();
    sub_1B5BA2708(&qword_1E9D94EF8, &qword_1E9D94ED8);
    OUTLINED_FUNCTION_37_2();
    sub_1B5BC9830();
    sub_1B5BAC250(v2, &qword_1E9D94EE8);
  }
  else
  {
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    v14(v1, v4, v5);
    v14(v0, v1, v5);
    swift_storeEnumTagMultiPayload();
    sub_1B5BAF94C();
    sub_1B5BA2708(&qword_1E9D94EF8, &qword_1E9D94ED8);
    OUTLINED_FUNCTION_37_2();
    sub_1B5BC9830();
    uint64_t v15 = OUTLINED_FUNCTION_46_3();
    v16(v15);
  }
  OUTLINED_FUNCTION_17();
}

unint64_t sub_1B5BAF94C()
{
  unint64_t result = qword_1E9D94EF0;
  if (!qword_1E9D94EF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94EE8);
    sub_1B5BA2708(&qword_1E9D94EF8, &qword_1E9D94ED8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94EF0);
  }
  return result;
}

void *sub_1B5BAF9EC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
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
    sub_1B5BCA060();
    uint64_t v23 = (void *)sub_1B5BC9990();
    sub_1B5BC9200();
  }
  sub_1B5BC9500();
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94ED8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94EE8);
  return memcpy((void *)(a9 + *(int *)(v25 + 36)), __src, 0x70uLL);
}

void sub_1B5BAFBBC()
{
  OUTLINED_FUNCTION_44();
  uint64_t v4 = v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94F00);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94F08);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_12_0();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94F10);
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = v9;
  MEMORY[0x1F4188790](v11);
  if (OUTLINED_FUNCTION_18_4())
  {
    double v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
    v12(v2, v4, v8);
    v12(v0, v2, v8);
    swift_storeEnumTagMultiPayload();
    sub_1B5BA2708(&qword_1E9D94F18, &qword_1E9D94F10);
    sub_1B5BAFDFC();
    OUTLINED_FUNCTION_36_2();
    sub_1B5BC9830();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v2, v8);
  }
  else
  {
    char v13 = sub_1B5BC99B0();
    sub_1B5BC9320();
    OUTLINED_FUNCTION_7();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v1, v4, v8);
    uint64_t v14 = (unsigned char *)(v1 + *(int *)(v5 + 36));
    *uint64_t v14 = v13;
    OUTLINED_FUNCTION_64((uint64_t)v14);
    uint64_t v15 = OUTLINED_FUNCTION_144();
    sub_1B5B7E444(v15, v16, &qword_1E9D94F00);
    swift_storeEnumTagMultiPayload();
    sub_1B5BA2708(&qword_1E9D94F18, &qword_1E9D94F10);
    sub_1B5BAFDFC();
    OUTLINED_FUNCTION_36_2();
    sub_1B5BC9830();
    sub_1B5BAC250(v1, &qword_1E9D94F00);
  }
  OUTLINED_FUNCTION_24_0();
}

unint64_t sub_1B5BAFDFC()
{
  unint64_t result = qword_1E9D94F20;
  if (!qword_1E9D94F20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94F00);
    sub_1B5BA2708(&qword_1E9D94F18, &qword_1E9D94F10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94F20);
  }
  return result;
}

void sub_1B5BAFE9C()
{
}

void sub_1B5BAFEA4()
{
  OUTLINED_FUNCTION_18();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94F28);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_26();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94F30);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_27();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94F38);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_32();
  uint64_t v9 = v7 - v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_41_3();
  if (sub_1B5B743FC())
  {
    uint64_t v11 = *sub_1B5B93DE4();
    uint64_t KeyPath = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94F40);
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_23_0();
    v13();
    uint64_t v14 = (uint64_t *)(v2 + *(int *)(v4 + 36));
    *uint64_t v14 = KeyPath;
    v14[1] = v11;
    swift_retain();
    sub_1B5BC9C80();
  }
  else
  {
    uint64_t v15 = sub_1B5BC9A80();
    uint64_t v16 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94F40);
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_23_0();
    v17();
    uint64_t v18 = (uint64_t *)(v2 + *(int *)(v4 + 36));
    *uint64_t v18 = v16;
    v18[1] = v15;
    sub_1B5BC9C90();
  }
  swift_getKeyPath();
  sub_1B5B7E444(v2, v9, &qword_1E9D94F30);
  OUTLINED_FUNCTION_35_3();
  sub_1B5B7E3E8(v9, v1, &qword_1E9D94F38);
  sub_1B5B7E444(v1, v0, &qword_1E9D94F38);
  swift_storeEnumTagMultiPayload();
  sub_1B5BB07D4();
  sub_1B5BC9830();
  sub_1B5BAC250(v1, &qword_1E9D94F38);
  OUTLINED_FUNCTION_17();
}

void sub_1B5BB0174()
{
  OUTLINED_FUNCTION_18();
  uint64_t v48 = v2;
  uint64_t v46 = sub_1B5BC9880();
  OUTLINED_FUNCTION_0_1();
  uint64_t v41 = v3;
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_25();
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94F60);
  OUTLINED_FUNCTION_0_1();
  uint64_t v42 = v5;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_32();
  uint64_t v9 = v7 - v8;
  MEMORY[0x1F4188790](v10);
  double v12 = (char *)&v41 - v11;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94F68);
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v13);
  OUTLINED_FUNCTION_3();
  uint64_t v45 = v14;
  uint64_t v15 = sub_1B5BC94B0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v17 = v16;
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_16_1();
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94F70);
  OUTLINED_FUNCTION_0_1();
  uint64_t v20 = v19;
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_32();
  uint64_t v24 = v22 - v23;
  MEMORY[0x1F4188790](v25);
  uint64_t v27 = (char *)&v41 - v26;
  if (sub_1B5B743FC())
  {
    sub_1B5BC9EA0();
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94F78);
    uint64_t v29 = sub_1B5BA2708(&qword_1E9D94F80, &qword_1E9D94F78);
    uint64_t v30 = sub_1B5BB1888(&qword_1E9D94F88, MEMORY[0x1E4F3CCE8]);
    sub_1B5BC9C10();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v0, v15);
    uint64_t v31 = v44;
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))(v27, v24, v44);
    OUTLINED_FUNCTION_80();
    v32();
    swift_storeEnumTagMultiPayload();
    uint64_t v49 = v28;
    uint64_t v50 = v15;
    uint64_t v51 = v29;
    uint64_t v52 = v30;
    OUTLINED_FUNCTION_20_5();
    uint64_t v49 = v28;
    uint64_t v50 = v46;
    uint64_t v51 = v29;
    uint64_t v52 = MEMORY[0x1E4F3D8F0];
    OUTLINED_FUNCTION_20_5();
    sub_1B5BC9830();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v27, v31);
  }
  else
  {
    sub_1B5BC9870();
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94F78);
    uint64_t v34 = sub_1B5BA2708(&qword_1E9D94F80, &qword_1E9D94F78);
    uint64_t v35 = MEMORY[0x1E4F3D8F0];
    uint64_t v36 = v46;
    sub_1B5BC9C20();
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v1, v36);
    uint64_t v37 = v42;
    uint64_t v38 = v47;
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 32))(v12, v9, v47);
    OUTLINED_FUNCTION_80();
    v39();
    swift_storeEnumTagMultiPayload();
    uint64_t v40 = sub_1B5BB1888(&qword_1E9D94F88, MEMORY[0x1E4F3CCE8]);
    uint64_t v49 = v33;
    uint64_t v50 = v15;
    uint64_t v51 = v34;
    uint64_t v52 = v40;
    OUTLINED_FUNCTION_20_5();
    uint64_t v49 = v33;
    uint64_t v50 = v36;
    uint64_t v51 = v34;
    uint64_t v52 = v35;
    OUTLINED_FUNCTION_20_5();
    sub_1B5BC9830();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v12, v38);
  }
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1B5BB0668(uint64_t a1, uint64_t a2, double a3)
{
  double v4 = a3;
  return MEMORY[0x1BA9A7230](&v4, a1, &unk_1F0ED1FF8, a2);
}

uint64_t sub_1B5BB06A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = a1;
  v4[1] = a2;
  return MEMORY[0x1BA9A7230](v4, a3, &unk_1F0ED1FB0);
}

uint64_t sub_1B5BB06D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CatalystContentBackgroundModifier();
  OUTLINED_FUNCTION_1_0();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_16();
  sub_1B5BC9340();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_23_0();
  v8();
  MEMORY[0x1BA9A7230](v3, a2, v6, a3);
  return sub_1B5BB0980(v3);
}

void sub_1B5BB07A4()
{
}

void sub_1B5BB07B4()
{
}

void sub_1B5BB07C4()
{
}

unint64_t sub_1B5BB07D4()
{
  unint64_t result = qword_1E9D94F48;
  if (!qword_1E9D94F48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94F38);
    sub_1B5BB0874();
    sub_1B5BA2708(&qword_1EB841158, &qword_1EB841160);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94F48);
  }
  return result;
}

unint64_t sub_1B5BB0874()
{
  unint64_t result = qword_1E9D94F50;
  if (!qword_1E9D94F50)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94F30);
    sub_1B5BA2708(&qword_1E9D94F58, &qword_1E9D94F40);
    sub_1B5BA2708(&qword_1EB841628, &qword_1EB841630);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94F50);
  }
  return result;
}

uint64_t type metadata accessor for CatalystContentBackgroundModifier()
{
  uint64_t result = qword_1E9D963E0;
  if (!qword_1E9D963E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B5BB0980(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CatalystContentBackgroundModifier();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B5BB09DC()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5BB09F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B5BB0A38()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5BB0A50()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5BB0A68()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5BB0A80()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5BB0A98()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5BB0AB0()
{
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_1B5BB0AC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  double v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  id v5 = v3;
  id v6 = v4;
  return a1;
}

unsigned char *sub_1B5BB0B0C(uint64_t a1, uint64_t a2)
{
  double v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 8);
  uint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return OUTLINED_FUNCTION_39();
}

uint64_t sub_1B5BB0B64(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 19))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

void type metadata accessor for SGSuggestionsCatalystTableCell()
{
}

uint64_t type metadata accessor for CatalystTableListViewModel()
{
  return __swift_instantiateGenericMetadata();
}

void *sub_1B5BB0BD4(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_1B5BB0C04()
{
  return swift_release();
}

void *sub_1B5BB0C0C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1B5BB0C48(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_1B5BB0C7C(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

void *sub_1B5BB0CBC(void *result, int a2, int a3)
{
  if (a2 < 0)
  {
    *uint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
    if (a3 < 0) {
      *((unsigned char *)result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
      return OUTLINED_FUNCTION_70(result, a2);
    }
    *((unsigned char *)result + 16) = 0;
    if (a2) {
      return OUTLINED_FUNCTION_70(result, a2);
    }
  }
  return result;
}

void type metadata accessor for CatalystToolBarModifier()
{
}

uint64_t sub_1B5BB0CFC()
{
  OUTLINED_FUNCTION_19_5();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_6_4();
  return v1(v0);
}

uint64_t sub_1B5BB0D50(uint64_t a1)
{
  sub_1B5BC9340();
  OUTLINED_FUNCTION_1_0();
  double v4 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);
  return v4(a1, v2);
}

uint64_t sub_1B5BB0DAC()
{
  OUTLINED_FUNCTION_19_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_23_0();
  v1();
  return v0;
}

uint64_t sub_1B5BB0DF8()
{
  OUTLINED_FUNCTION_19_5();
  OUTLINED_FUNCTION_1_0();
  uint64_t v1 = OUTLINED_FUNCTION_26_2();
  v2(v1);
  return v0;
}

uint64_t sub_1B5BB0E40()
{
  OUTLINED_FUNCTION_19_5();
  OUTLINED_FUNCTION_1_0();
  uint64_t v1 = OUTLINED_FUNCTION_26_2();
  v2(v1);
  return v0;
}

uint64_t sub_1B5BB0E88()
{
  OUTLINED_FUNCTION_19_5();
  OUTLINED_FUNCTION_1_0();
  uint64_t v1 = OUTLINED_FUNCTION_26_2();
  v2(v1);
  return v0;
}

uint64_t sub_1B5BB0ED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B5BB0EE4);
}

uint64_t sub_1B5BB0EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B5BC9340();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t sub_1B5BB0F2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B5BB0F40);
}

uint64_t sub_1B5BB0F40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1B5BC9340();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t sub_1B5BB0F8C()
{
  uint64_t result = sub_1B5BC9340();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for NavigationViewFrameSizeModifier()
{
}

void type metadata accessor for TopImagePaddingModifier()
{
}

void type metadata accessor for SectionFontNameModifier()
{
}

void type metadata accessor for FormListStyleModifier()
{
}

unint64_t sub_1B5BB104C()
{
  unint64_t result = qword_1E9D94F90;
  if (!qword_1E9D94F90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94E68);
    sub_1B5BA2708(&qword_1E9D94F98, &qword_1E9D94E48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94F90);
  }
  return result;
}

uint64_t sub_1B5BB10EC()
{
  return swift_getWitnessTable();
}

unint64_t sub_1B5BB1204()
{
  unint64_t result = qword_1E9D94FA0;
  if (!qword_1E9D94FA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94FA8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94E70);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94E88);
    sub_1B5BA2708(&qword_1E9D94E90, &qword_1E9D94E70);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94E98);
    sub_1B5BA2708(&qword_1E9D94EA0, &qword_1E9D94E98);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94FA0);
  }
  return result;
}

unint64_t sub_1B5BB1358()
{
  unint64_t result = qword_1E9D94FB0;
  if (!qword_1E9D94FB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94FB8);
    sub_1B5BAF5D8();
    sub_1B5BA2708(&qword_1E9D94ED0, &qword_1E9D94EA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94FB0);
  }
  return result;
}

unint64_t sub_1B5BB13FC()
{
  unint64_t result = qword_1E9D94FC0;
  if (!qword_1E9D94FC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94FC8);
    sub_1B5BAF94C();
    sub_1B5BA2708(&qword_1E9D94EF8, &qword_1E9D94ED8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94FC0);
  }
  return result;
}

unint64_t sub_1B5BB14A0()
{
  unint64_t result = qword_1E9D94FD0;
  if (!qword_1E9D94FD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94FD8);
    sub_1B5BA2708(&qword_1E9D94F18, &qword_1E9D94F10);
    sub_1B5BAFDFC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94FD0);
  }
  return result;
}

unint64_t sub_1B5BB1544()
{
  unint64_t result = qword_1E9D94FE0;
  if (!qword_1E9D94FE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94FE8);
    sub_1B5BB07D4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94FE0);
  }
  return result;
}

unint64_t sub_1B5BB15BC()
{
  unint64_t result = qword_1E9D94FF0;
  if (!qword_1E9D94FF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94FF8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D94F78);
    sub_1B5BC94B0();
    sub_1B5BA2708(&qword_1E9D94F80, &qword_1E9D94F78);
    sub_1B5BB1888(&qword_1E9D94F88, MEMORY[0x1E4F3CCE8]);
    swift_getOpaqueTypeConformance2();
    sub_1B5BC9880();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D94FF0);
  }
  return result;
}

uint64_t sub_1B5BB1714(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB023TopImagePaddingModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1F0ED1FF8, (void (*)(void))sub_1B5BB1734);
}

unint64_t sub_1B5BB1734()
{
  unint64_t result = qword_1E9D95000;
  if (!qword_1E9D95000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D95000);
  }
  return result;
}

uint64_t sub_1B5BB1780(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB023TopImagePaddingModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1F0ED1FB0, (void (*)(void))sub_1B5BB17A0);
}

unint64_t sub_1B5BB17A0()
{
  unint64_t result = qword_1E9D95008;
  if (!qword_1E9D95008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D95008);
  }
  return result;
}

uint64_t sub_1B5BB17EC()
{
  return swift_getWitnessTable();
}

uint64_t sub_1B5BB1888(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1B5BB18D0(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB023TopImagePaddingModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1F0ED1FD8, (void (*)(void))sub_1B5BB18F0);
}

unint64_t sub_1B5BB18F0()
{
  unint64_t result = qword_1E9D95018;
  if (!qword_1E9D95018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D95018);
  }
  return result;
}

uint64_t sub_1B5BB193C(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB023TopImagePaddingModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1F0ED2020, (void (*)(void))sub_1B5BB195C);
}

unint64_t sub_1B5BB195C()
{
  unint64_t result = qword_1E9D95020;
  if (!qword_1E9D95020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D95020);
  }
  return result;
}

uint64_t sub_1B5BB19A8(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB023TopImagePaddingModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(a1, (uint64_t)&unk_1F0ED2040, (void (*)(void))sub_1B5BB1A38);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyx015CoreSuggestionsB023TopImagePaddingModifierVGAaBHPxAaBHD1__AgA0cK0HPyHCHCTm(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return swift_getWitnessTable();
}

unint64_t sub_1B5BB1A38()
{
  unint64_t result = qword_1E9D95028;
  if (!qword_1E9D95028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D95028);
  }
  return result;
}

void sub_1B5BB1A84()
{
}

uint64_t sub_1B5BB1A8C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1B5BB1AC4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1B5BB1AEC()
{
  return sub_1B5BAEA48(v0[4], v0[5], v0[2]);
}

id sub_1B5BB1B0C(id result, __int16 a2)
{
  if (HIBYTE(a2) != 255) {
    return result;
  }
  return result;
}

uint64_t sub_1B5BB1B24(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 80);
  sub_1B5B7D780(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_1B5BB1B90(v2, v3, v4, v5);
  return a1;
}

uint64_t sub_1B5BB1B90(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4 != 1) {
    return sub_1B5B7D7B0(result, a2, a3, a4);
  }
  return result;
}

uint64_t sub_1B5BB1BA0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 80);
  sub_1B5B7B664(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_1B5BB1C0C(v2, v3, v4, v5);
  return a1;
}

uint64_t sub_1B5BB1C0C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4 != 1) {
    return sub_1B5B7D814(result, a2, a3, a4);
  }
  return result;
}

void sub_1B5BB1C1C(id a1, __int16 a2)
{
  if (HIBYTE(a2) != 255) {
}
  }

uint64_t sub_1B5BB1C34()
{
  return MEMORY[0x1F4186498](v0, 35, 7);
}

void *sub_1B5BB1C74()
{
  unint64_t result = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **(void **)(v0 + 16)) + 0x1B8))();
  if (result)
  {
    id v2 = objc_msgSend(result, sel_suggestionPrimaryAction);
    objc_msgSend(v2, sel_execute);

    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1B5BB1D20()
{
  (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & **(void **)(v0 + 16)) + 0x1A0))();
  sub_1B5B744B8();
  uint64_t v1 = sub_1B5BC9B30();
  return OUTLINED_FUNCTION_137(v1, v2, v3, v4);
}

void sub_1B5BB1DA8()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **(void **)(v0 + 16)) + 0x1B8))();
  if (v2)
  {
    char v3 = v2;
    if (objc_msgSend(v2, sel_respondsToSelector_, sel_suggestionDismissAction))
    {
      id v4 = objc_msgSend(v3, sel_suggestionDismissAction);
      objc_msgSend(v4, sel_execute);
    }
    swift_unknownObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94170);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B5BCC700;
  id v6 = (uint64_t *)sub_1B5B9F5F8();
  uint64_t v8 = *v6;
  uint64_t v7 = v6[1];
  *(void *)(inited + 32) = v8;
  *(void *)(inited + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v7;
  *(void *)(inited + 48) = 0;
  swift_bridgeObjectRetain();
  id v9 = (uint64_t *)sub_1B5B9F604();
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *(void *)(inited + 56) = v11;
  *(void *)(inited + 64) = v10;
  *(void *)(inited + 72) = 0;
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1B5BC9ED0();
  id v13 = objc_msgSend(self, sel_defaultCenter);
  sub_1B5B9F5EC();
  swift_bridgeObjectRetain();
  uint64_t v14 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_1B5B78264(v12);
  swift_bridgeObjectRelease();
  sub_1B5B7DCEC((uint64_t)v14, v1, v15, v13);
}

uint64_t sub_1B5BB1F5C()
{
  sub_1B5B744B8();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_1B5BC9B30();
  return OUTLINED_FUNCTION_137(v0, v1, v2, v3);
}

uint64_t sub_1B5BB2008()
{
  OUTLINED_FUNCTION_1();
  return MEMORY[0x1BA9A8120](v0);
}

uint64_t sub_1B5BB20A0()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_1B5BB20E8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x90))();
  *a2 = result;
  return result;
}

uint64_t sub_1B5BB2144(uint64_t a1, void **a2)
{
  char v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x98);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

void (*sub_1B5BB21A8(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_suggestionDelegate;
  v3[4] = v1;
  v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1BA9A8120](v5);
  return sub_1B5B7FEBC;
}

uint64_t sub_1B5BB222C()
{
  OUTLINED_FUNCTION_1();
  return *v0;
}

uint64_t sub_1B5BB2260(int a1)
{
  uint64_t result = OUTLINED_FUNCTION_2();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*sub_1B5BB2298())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B5BB22E0()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1B5BB2324(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_2();
  *char v2 = a1;
  v2[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B5BB2370())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B5BB23B8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B5BB23F0(uint64_t a1)
{
  OUTLINED_FUNCTION_2();
  *uint64_t v1 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B5BB2430())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B5BB2478()
{
  swift_beginAccess();
  sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  uint64_t v0 = OUTLINED_FUNCTION_43();
  return v1(v0);
}

uint64_t sub_1B5BB24F0(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_logger;
  swift_beginAccess();
  sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 40))(v3, a1);
  return swift_endAccess();
}

uint64_t (*sub_1B5BB2574())()
{
  return j_j__swift_endAccess;
}

id sub_1B5BB25BC()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  return v1;
}

void sub_1B5BB2600(void *a1)
{
}

uint64_t (*sub_1B5BB260C())()
{
  return j_j__swift_endAccess;
}

id sub_1B5BB2654()
{
  OUTLINED_FUNCTION_1();
  uint64_t v1 = *v0;
  return v1;
}

void sub_1B5BB2698(void *a1)
{
}

uint64_t (*sub_1B5BB26A4())()
{
  return j_j__swift_endAccess;
}

id SGWalletPassSuggestion.__allocating_init(realtimeWalletPass:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return SGWalletPassSuggestion.init(realtimeWalletPass:)(a1);
}

id SGWalletPassSuggestion.init(realtimeWalletPass:)(void *a1)
{
  v61[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sub_1B5BC9230();
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  uint64_t v56 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v53 - v9;
  swift_unknownObjectWeakInit();
  uint64_t v11 = (uint64_t *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_passDictionary];
  *(void *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_passDictionary] = 0;
  *(void *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_realtime] = a1;
  uint64_t v12 = v1;
  id v13 = a1;
  unsigned int v14 = objc_msgSend(v13, sel_state);
  *(_DWORD *)&v12[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_state] = v14;
  id v15 = objc_msgSend(v13, sel_identifier);
  uint64_t v16 = sub_1B5BC9F40();
  uint64_t v18 = v17;

  uint64_t v19 = (uint64_t *)&v12[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_identifier];
  *uint64_t v19 = v16;
  v19[1] = v18;
  sub_1B5B729C0();
  swift_bridgeObjectRetain();
  sub_1B5BC9220();
  uint64_t v20 = &v12[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_logger];
  uint64_t v57 = v5;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v12[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_logger], v10, v3);
  uint64_t v21 = self;
  id v22 = objc_msgSend(v13, sel_walletPassDictionaryData);
  uint64_t v23 = sub_1B5BC9160();
  unint64_t v25 = v24;

  uint64_t v26 = (void *)sub_1B5BC9150();
  sub_1B5B9B9E0(v23, v25);
  v60[0] = 0;
  id v27 = objc_msgSend(v21, sel_JSONObjectWithData_options_error_, v26, 0, v60);

  if (v27)
  {
    id v28 = v60[0];
    sub_1B5BCA0E0();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D94970);
    if (swift_dynamicCast())
    {
      uint64_t v29 = v61[0];
      swift_beginAccess();
      *uint64_t v11 = v29;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    id v30 = v60[0];
    uint64_t v31 = (void *)sub_1B5BC90F0();

    swift_willThrow();
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v56, v20, v3);
    id v32 = v31;
    id v33 = v31;
    uint64_t v34 = sub_1B5BC9210();
    os_log_type_t v35 = sub_1B5BCA050();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = swift_slowAlloc();
      uint64_t v54 = (void *)swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      v61[0] = v55;
      *(_DWORD *)uint64_t v36 = 136315394;
      v53[1] = v36 + 4;
      type metadata accessor for SGWalletPassSuggestion();
      ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
      uint64_t v38 = NSStringFromClass(ObjCClassFromMetadata);
      uint64_t v39 = sub_1B5BC9F40();
      unint64_t v41 = v40;

      unint64_t v58 = sub_1B5B7AAF8(v39, v41, v61);
      sub_1B5BCA0C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v36 + 12) = 2112;
      id v42 = v31;
      uint64_t v43 = _swift_stdlib_bridgeErrorToNSError();
      unint64_t v58 = v43;
      sub_1B5BCA0C0();
      *uint64_t v54 = v43;

      _os_log_impl(&dword_1B5B6C000, v34, v35, "%s - Encountered Error while resolving passDictionary: %@", (uint8_t *)v36, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94470);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_0();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v57 + 8))(v56, v3);
  }
  sub_1B5B7447C(0, (unint64_t *)&unk_1E9D950C0);
  id v44 = objc_msgSend(v13, sel_walletPassData);
  uint64_t v45 = sub_1B5BC9160();
  unint64_t v47 = v46;

  *(void *)&v12[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_passViewManager] = sub_1B5BB2D0C(v45, v47);
  id v48 = objc_msgSend(self, sel_currentDevice);
  id v49 = objc_msgSend(v48, sel_userInterfaceIdiom);

  v12[OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_bannerForVisionDevice] = v49 == (id)6;
  uint64_t v50 = (objc_class *)type metadata accessor for SGWalletPassSuggestion();
  v59.receiver = v12;
  v59.super_class = v50;
  id v51 = objc_msgSendSuper2(&v59, sel_init);

  return v51;
}

id sub_1B5BB2D0C(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v5 = (void *)sub_1B5BC9150();
  id v6 = objc_msgSend(v4, sel_initWithData_, v5);
  sub_1B5B9B9E0(a1, a2);

  return v6;
}

uint64_t sub_1B5BB2DE4()
{
  if (currentUIContext())
  {
    (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B8))();
  }
  else
  {
    switch((*(unsigned int (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA8))())
    {
      case 1u:
      case 2u:
      case 3u:
      case 4u:
        sub_1B5B72B30();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
        uint64_t v1 = swift_allocObject();
        *(_OWORD *)(v1 + 16) = xmmword_1B5BCD260;
        uint64_t v2 = MEMORY[0x1E4FBB5C8];
        *(void *)(v1 + 56) = MEMORY[0x1E4FBB550];
        *(void *)(v1 + 64) = v2;
        *(void *)(v1 + 32) = 1;
        sub_1B5BC9F10();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
      default:
        return OUTLINED_FUNCTION_43();
    }
  }
  return OUTLINED_FUNCTION_43();
}

id sub_1B5BB2FF4()
{
  OUTLINED_FUNCTION_51();
  id result = (id)(*(uint64_t (**)(void))(v0 + 216))();
  if (result)
  {
    sub_1B5B9A42C(0x7470697263736564, 0xEB000000006E6F69, (uint64_t)result, &v18);
    swift_bridgeObjectRelease();
    if (v19)
    {
      if (swift_dynamicCast())
      {
        OUTLINED_FUNCTION_3_3();
        v2 += 36;
        uint64_t v3 = *v2;
        id v4 = (void *)(*v2)();
        id v5 = objc_msgSend(v4, sel_passStyle);

        uint64_t v6 = sub_1B5BC9F40();
        uint64_t v8 = v7;

        *(void *)&long long v18 = v6;
        *((void *)&v18 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = v8;
        swift_bridgeObjectRetain();
        sub_1B5BC9F80();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_1B5BC9F80();
        swift_bridgeObjectRelease();
        uint64_t v9 = swift_bridgeObjectRelease();
        long long v10 = v18;
        uint64_t v11 = (void *)((uint64_t (*)(uint64_t))v3)(v9);
        objc_msgSend(v11, sel_passTimeInterval);
        double v13 = v12;

        id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1C9C8]), sel_initWithTimeIntervalSinceReferenceDate_, v13);
        long long v18 = v10;
        swift_bridgeObjectRetain();
        sub_1B5BC9F80();
        swift_bridgeObjectRelease();
        long long v15 = v18;
        id result = objc_msgSend(self, sel_fullDayFormatter);
        if (result)
        {
          uint64_t v16 = result;
          id v17 = objc_msgSend(result, sel_stringFromDate_, v14);

          sub_1B5BC9F40();
          long long v18 = v15;
          swift_bridgeObjectRetain();
          sub_1B5BC9F80();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return (id)v18;
        }
        else
        {
          __break(1u);
        }
        return result;
      }
    }
    else
    {
      sub_1B5BB4AE8((uint64_t)&v18);
    }
    return 0;
  }
  return result;
}

id sub_1B5BB3314()
{
  sub_1B5B7447C(0, &qword_1E9D94468);
  uint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A8))();
  uint64_t v3 = v2;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v0;
  id v5 = v0;
  return sub_1B5B8C07C(v1, v3, (uint64_t)sub_1B5BB4B80, v4);
}

void sub_1B5BB33F4()
{
  uint64_t v0 = sub_1B5BC9230();
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  id v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(void))(v6 + 240))();
  uint64_t v7 = sub_1B5BC9210();
  os_log_type_t v8 = sub_1B5BCA040();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v30 = v0;
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v32 = v29;
    *(_DWORD *)uint64_t v9 = 136315138;
    v28[1] = v9 + 4;
    type metadata accessor for SGWalletPassSuggestion();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    uint64_t v11 = NSStringFromClass(ObjCClassFromMetadata);
    uint64_t v12 = sub_1B5BC9F40();
    unint64_t v14 = v13;

    unint64_t v31 = sub_1B5B7AAF8(v12, v14, &v32);
    sub_1B5BCA0C0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B5B6C000, v7, v8, "%s - SGWalletPassSuggestion primary action initiated", v9, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v30);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v0);
  }
  OUTLINED_FUNCTION_3_3();
  int v16 = (*(uint64_t (**)(void))(v15 + 168))();
  if ((v16 - 1) < 2)
  {
    OUTLINED_FUNCTION_3_3();
    uint64_t v18 = (*(uint64_t (**)(void))(v17 + 144))();
    if (!v18) {
      return;
    }
    uint64_t v19 = (void *)v18;
    OUTLINED_FUNCTION_3_3();
    uint64_t v21 = (void *)(*(uint64_t (**)(void))(v20 + 288))();
    id v22 = objc_msgSend(v21, sel_addPassViewController);

    if (!v22)
    {
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_11;
  }
  if (v16 == 3)
  {
    OUTLINED_FUNCTION_3_3();
    uint64_t v24 = (*(uint64_t (**)(void))(v23 + 144))();
    if (v24)
    {
      uint64_t v19 = (void *)v24;
      OUTLINED_FUNCTION_3_3();
      uint64_t v26 = (*(uint64_t (**)(void))(v25 + 288))();
      id v27 = objc_allocWithZone((Class)type metadata accessor for PKViewPassController());
      id v22 = sub_1B5BB416C(v26);
LABEL_11:
      objc_msgSend(v19, sel_presentViewController_, v22);
      swift_unknownObjectRelease();
    }
  }
}

id sub_1B5BB3760(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_1B5BB416C(a1);
}

uint64_t sub_1B5BB37D8()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI22SGWalletPassSuggestion_bannerForVisionDevice)) {
    return 4;
  }
  else {
    return 0;
  }
}

uint64_t sub_1B5BB3830()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v1 = (void *)(*(uint64_t (**)(void))(v0 + 288))();
  id v2 = objc_msgSend(v1, sel_icon);

  if (v2) {
    return (uint64_t)v2;
  }
  OUTLINED_FUNCTION_4_0();
  id v5 = *(uint64_t (**)(void))(v4 + 432);
  return v5();
}

id sub_1B5BB3934()
{
  return OUTLINED_FUNCTION_7_4();
}

id sub_1B5BB3964(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  id v5 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1B5BB39EC(unint64_t a1)
{
  OUTLINED_FUNCTION_17_3();
  OUTLINED_FUNCTION_19_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1B5BCD260;
  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_15();
    sub_1B5BCA170();
    swift_bridgeObjectRelease();
  }
  uint64_t v2 = OUTLINED_FUNCTION_8(MEMORY[0x1E4FBB550]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

id sub_1B5BB3B6C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D942B0);
  uint64_t v6 = sub_1B5BC9FE0();
  id v7 = a1;
  a4(v6);

  swift_bridgeObjectRelease();
  os_log_type_t v8 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1B5BB3C30()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x108))();
}

uint64_t sub_1B5BB3CB0()
{
  uint64_t v0 = sub_1B5BC9230();
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = v1;
  MEMORY[0x1F4188790](v3);
  id v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  currentUIContext();
  OUTLINED_FUNCTION_51();
  switch((*(unsigned int (**)(void))(v6 + 168))())
  {
    case 0u:
      OUTLINED_FUNCTION_51();
      (*(void (**)(void))(v7 + 240))();
      os_log_type_t v8 = sub_1B5BC9210();
      os_log_type_t v9 = sub_1B5BCA050();
      if (os_log_type_enabled(v8, v9))
      {
        long long v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)long long v10 = 0;
        _os_log_impl(&dword_1B5B6C000, v8, v9, "Error: Encountered Wallet Pass with \"Unknown\" state", v10, 2u);
        OUTLINED_FUNCTION_0();
      }

      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v0);
      break;
    case 1u:
    case 2u:
    case 3u:
    case 4u:
      sub_1B5B72B30();
      swift_bridgeObjectRelease();
      break;
    default:
      return OUTLINED_FUNCTION_43();
  }
  return OUTLINED_FUNCTION_43();
}

id sub_1B5BB3F24()
{
  id v0 = objc_msgSend(self, sel_spotlightIconImageWithBundleIdentifier_, *MEMORY[0x1E4F5DC78]);
  return v0;
}

id sub_1B5BB3F70()
{
  return OUTLINED_FUNCTION_7_4();
}

id SGWalletPassSuggestion.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SGWalletPassSuggestion.init()()
{
}

id SGWalletPassSuggestion.__deallocating_deinit()
{
  return sub_1B5BB48D8(0, type metadata accessor for SGWalletPassSuggestion);
}

id sub_1B5BB40D4()
{
  OUTLINED_FUNCTION_1();
  id v1 = *v0;
  return v1;
}

void sub_1B5BB4118(void *a1)
{
}

uint64_t (*sub_1B5BB4124())()
{
  return j__swift_endAccess;
}

id sub_1B5BB416C(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC17CoreSuggestionsUI20PKViewPassController_passViewManager] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for PKViewPassController();
  return objc_msgSendSuper2(&v3, sel_initWithNibName_bundle_, 0, 0);
}

void sub_1B5BB41B4()
{
}

void sub_1B5BB4220()
{
  id v1 = (objc_class *)type metadata accessor for PKViewPassController();
  v58.receiver = v0;
  v58.super_class = v1;
  id v2 = objc_msgSendSuper2(&v58, sel_viewDidLoad);
  objc_super v3 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x58);
  uint64_t v4 = (void *)((uint64_t (*)(id))v3)(v2);
  id v5 = objc_msgSend(v4, sel_title);

  uint64_t v6 = sub_1B5BC9F40();
  uint64_t v8 = v7;

  sub_1B5BA0E58(v6, v8, v0);
  id v9 = sub_1B5B72B30();
  uint64_t v11 = v10;
  v57[3] = v1;
  v57[0] = v0;
  objc_allocWithZone(MEMORY[0x1E4FB14A8]);
  uint64_t v12 = v0;
  id v13 = sub_1B5BA0B84((uint64_t)v9, v11, 2, v57, (uint64_t)sel_dismissalPressed_);
  id v14 = objc_msgSend(v12, sel_navigationItem, v57[0]);
  objc_msgSend(v14, sel_setRightBarButtonItem_, v13);

  id v15 = objc_msgSend(v12, sel_navigationController);
  if (v15)
  {
    int v16 = v15;
    id v17 = objc_msgSend(v15, sel_navigationBar);

    objc_msgSend(v17, sel_setShadowImage_, 0);
  }
  v57[0] = v3();
  id v18 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9D950E8));
  uint64_t v19 = (void *)sub_1B5BC9720();
  objc_msgSend(v12, sel_addChildViewController_, v19);
  id v20 = OUTLINED_FUNCTION_7_6();
  if (!v20)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v21 = v20;
  objc_msgSend(v20, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v22 = OUTLINED_FUNCTION_10_5();
  if (!v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v23 = v22;
  id v24 = OUTLINED_FUNCTION_7_6();
  if (!v24)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v25 = v24;
  objc_msgSend(v23, sel_addSubview_, v24);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB8419C0);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_1B5BCDA00;
  id v27 = OUTLINED_FUNCTION_7_6();
  if (!v27)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v28 = v27;
  id v29 = objc_msgSend(v27, sel_leadingAnchor);

  id v30 = OUTLINED_FUNCTION_10_5();
  if (!v30)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  unint64_t v31 = v30;
  id v32 = objc_msgSend(v30, sel_leadingAnchor);

  id v33 = OUTLINED_FUNCTION_9_5();
  *(void *)(v26 + 32) = v33;
  id v34 = OUTLINED_FUNCTION_7_6();
  if (!v34)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  os_log_type_t v35 = v34;
  id v36 = objc_msgSend(v34, sel_trailingAnchor);

  id v37 = OUTLINED_FUNCTION_10_5();
  if (!v37)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v38 = v37;
  id v39 = objc_msgSend(v37, sel_trailingAnchor);

  id v40 = OUTLINED_FUNCTION_9_5();
  *(void *)(v26 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v40;
  id v41 = OUTLINED_FUNCTION_7_6();
  if (!v41)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  id v42 = v41;
  id v43 = objc_msgSend(v41, sel_topAnchor);

  id v44 = OUTLINED_FUNCTION_10_5();
  if (!v44)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v45 = v44;
  id v46 = objc_msgSend(v44, sel_topAnchor);

  id v47 = OUTLINED_FUNCTION_9_5();
  *(void *)(v26 + 48) = v47;
  id v48 = OUTLINED_FUNCTION_7_6();
  if (!v48)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v49 = v48;
  id v50 = objc_msgSend(v48, sel_bottomAnchor);

  id v51 = OUTLINED_FUNCTION_10_5();
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = self;
    id v54 = objc_msgSend(v52, sel_bottomAnchor);

    id v55 = objc_msgSend(v50, sel_constraintEqualToAnchor_, v54);
    *(void *)(v26 + 56) = v55;
    v57[0] = v26;
    sub_1B5BC9FF0();
    sub_1B5B7447C(0, (unint64_t *)&qword_1EB841778);
    uint64_t v56 = (void *)sub_1B5BC9FC0();
    swift_bridgeObjectRelease();
    objc_msgSend(v53, sel_activateConstraints_, v56);

    objc_msgSend(v19, sel_didMoveToParentViewController_, v12);
    return;
  }
LABEL_25:
  __break(1u);
}

CoreSuggestionsUI::PKPassHostingView __swiftcall PKPassHostingView.init(_:)(CoreSuggestionsUI::PKPassHostingView result)
{
  *id v1 = result.passViewController.super.isa;
  return result;
}

uint64_t sub_1B5BB47BC()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

id sub_1B5BB4850()
{
  return objc_msgSend(v0, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

void sub_1B5BB4868()
{
}

id sub_1B5BB48C0(uint64_t a1)
{
  return sub_1B5BB48D8(a1, type metadata accessor for PKViewPassController);
}

id sub_1B5BB48D8(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

id sub_1B5BB4920(int a1, id a2)
{
  id result = objc_msgSend(a2, sel_passView);
  if (!result)
  {
    id v3 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
    return objc_msgSend(v3, sel_init);
  }
  return result;
}

id sub_1B5BB497C(int a1)
{
  return sub_1B5BB4920(a1, *v1);
}

uint64_t sub_1B5BB4984()
{
  OUTLINED_FUNCTION_16_6();
  uint64_t v0 = OUTLINED_FUNCTION_72_0();
  return MEMORY[0x1F40F9EF0](v0);
}

uint64_t sub_1B5BB49C8()
{
  OUTLINED_FUNCTION_16_6();
  uint64_t v0 = OUTLINED_FUNCTION_72_0();
  return MEMORY[0x1F40F9E78](v0);
}

void sub_1B5BB4A0C()
{
}

id PKPassHostingView.body.getter@<X0>(uint64_t a1@<X8>)
{
  id v4 = *v1;
  *(void *)a1 = sub_1B5BC9650();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(unsigned char *)(a1 + 32) = 1;
  *(void *)(a1 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = 0;
  *(unsigned char *)(a1 + 48) = 1;
  *(void *)(a1 + 56) = v4;
  return v4;
}

uint64_t type metadata accessor for SGWalletPassSuggestion()
{
  uint64_t result = qword_1E9D96590;
  if (!qword_1E9D96590) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B5BB4AE8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D950D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B5BB4B48()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B5BB4B80()
{
}

uint64_t type metadata accessor for PKViewPassController()
{
  return self;
}

unint64_t sub_1B5BB4BB0()
{
  unint64_t result = qword_1E9D950F0;
  if (!qword_1E9D950F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D950F0);
  }
  return result;
}

uint64_t sub_1B5BB4BFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1B5BB4C18()
{
  return type metadata accessor for SGWalletPassSuggestion();
}

uint64_t sub_1B5BB4C20()
{
  uint64_t result = sub_1B5BC9230();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for SGWalletPassSuggestion(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for SGWalletPassSuggestion);
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionDelegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionDelegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionDelegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.__allocating_init(realtimeWalletPass:)()
{
  return (*(uint64_t (**)(void))(v0 + 312))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionCategory()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionTitle()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionSubtitle()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionPrimaryAction()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionActionButtonType()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionCategoryId()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionCategoryImage()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionCategoryTitle()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionCategoryTitle(forItems:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionCategorySubtitle(forItems:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionCategoryLocalizedCount(ofItems:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.suggestionCategoryActionButtonType()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of SGWalletPassSuggestion.realtimeSuggestion()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A0))();
}

ValueMetadata *type metadata accessor for PKPassViewRepresentable()
{
  return &type metadata for PKPassViewRepresentable;
}

ValueMetadata *type metadata accessor for PKPassHostingView()
{
  return &type metadata for PKPassHostingView;
}

unint64_t sub_1B5BB50EC()
{
  unint64_t result = qword_1E9D95168;
  if (!qword_1E9D95168)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D95170);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D95168);
  }
  return result;
}

void type metadata accessor for SGRealtimeWalletPassState()
{
  if (!qword_1E9D95178)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1E9D95178);
    }
  }
}

unint64_t sub_1B5BB518C()
{
  unint64_t result = qword_1E9D95188;
  if (!qword_1E9D95188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D95188);
  }
  return result;
}

void sub_1B5BB51DC(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = type metadata accessor for SGBannerPaddingParams(0);
  uint64_t v6 = *(int *)(v5 + 60);
  uint64_t v7 = self;
  id v8 = objc_msgSend(v7, sel_currentDevice);
  id v9 = objc_msgSend(v8, sel_userInterfaceIdiom);

  *(void *)((char *)a2 + v6) = v9;
  uint64_t v10 = *(int *)(v5 + 64);
  id v11 = objc_msgSend(v7, sel_currentDevice);
  id v12 = objc_msgSend(v11, sel_userInterfaceIdiom);

  *((unsigned char *)a2 + v1sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v12 == (id)6;
  sub_1B5B729C0();
  swift_bridgeObjectRetain();
  sub_1B5B729CC();
  swift_bridgeObjectRetain();
  sub_1B5BC9220();
  id v13 = a1;
  id v14 = sub_1B5BC9210();
  os_log_type_t v15 = sub_1B5BCA070();
  if (os_log_type_enabled(v14, v15))
  {
    int v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)int v16 = 136315138;
    uint64_t v71 = v17;
    (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & *v13) + 0x218))();
    uint64_t v18 = sub_1B5B74320();
    sub_1B5B7AAF8(v18, v19, &v71);
    sub_1B5BCA0C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B5B6C000, v14, v15, "SGBannerPaddingParams: Action Button: %s", v16, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {
  }
  OUTLINED_FUNCTION_4_5();
  switch((*(uint64_t (**)(uint64_t, uint64_t))(v20 + 536))(v21, v22))
  {
    case 0:
      uint64_t v23 = sub_1B5B72698();
      *a2 = *v23;
      a2[9] = 0;
      id v24 = (double *)sub_1B5B726B0();
      double v25 = *v24;
      a2[1] = *(void *)v24;
      uint64_t v26 = (double *)sub_1B5B72674();
      OUTLINED_FUNCTION_41_4(v26);
      id v27 = (double *)sub_1B5B72680();
      OUTLINED_FUNCTION_43_5(v27);
      id v28 = (double *)sub_1B5B7268C();
      OUTLINED_FUNCTION_42_4(v28);
      a2[3] = 0;
      a2[7] = 0;
      OUTLINED_FUNCTION_4_5();
      id v30 = *(double (**)(uint64_t, uint64_t))(v29 + 752);
      if (v30(v31, v32) <= 0.0) {
        double v35 = *(double *)v23;
      }
      else {
        double v35 = v30(v33, v34) + *(double *)v23;
      }
      goto LABEL_15;
    case 1:
      *a2 = 0;
      a2[9] = 0;
      id v36 = sub_1B5B726B0();
      a2[1] = *v36;
      a2[2] = *(void *)sub_1B5B727B8();
      a2[4] = *v36;
      a2[3] = *(void *)sub_1B5B727C4();
      a2[5] = 0;
      a2[7] = 0;
      a2[8] = 0;
      OUTLINED_FUNCTION_4_5();
      uint64_t v38 = *(double (**)(uint64_t, uint64_t))(v37 + 752);
      OUTLINED_FUNCTION_14_3();
      if (v38(v39, v40) <= 0.0)
      {
        uint64_t v49 = *(void *)sub_1B5B72698();
LABEL_19:

        a2[6] = v49;
      }
      else
      {
        OUTLINED_FUNCTION_14_3();
        double v43 = v38(v41, v42);
        double v44 = *(double *)sub_1B5B72698();

        *((double *)a2 + 6) = v43 + v44;
      }
      return;
    case 2:
      uint64_t v45 = sub_1B5B727D0();
      *a2 = *v45;
      a2[9] = 0;
      id v46 = sub_1B5B726B0();
      a2[1] = *v46;
      a2[2] = *(void *)sub_1B5B727DC();
      a2[4] = *v46;
      id v47 = (double *)sub_1B5B727E8();
      OUTLINED_FUNCTION_43_5(v47);
      id v48 = (double *)sub_1B5B727F4();
      OUTLINED_FUNCTION_42_4(v48);
      a2[7] = 0;
      a2[3] = 0;
      uint64_t v49 = *v45;
      goto LABEL_19;
    case 3:
      *a2 = *(void *)sub_1B5B72818();
      a2[9] = 0;
      id v50 = (double *)sub_1B5B72848();
      double v25 = *v50;
      a2[1] = *(void *)v50;
      id v51 = (double *)sub_1B5B72824();
      OUTLINED_FUNCTION_41_4(v51);
      uint64_t v52 = (double *)sub_1B5B72830();
      OUTLINED_FUNCTION_43_5(v52);
      uint64_t v53 = (double *)sub_1B5B7283C();
      OUTLINED_FUNCTION_42_4(v53);
      a2[7] = *(void *)sub_1B5B7280C();
      a2[3] = 0;
      OUTLINED_FUNCTION_4_5();
      id v55 = *(double (**)(uint64_t, uint64_t))(v54 + 752);
      OUTLINED_FUNCTION_14_3();
      double v58 = v55(v56, v57);
      double v35 = 0.0;
      if (v58 > 0.0)
      {
        OUTLINED_FUNCTION_14_3();
        v55(v59, v60);
      }
LABEL_15:
      *((double *)a2 + 6) = v35;
      OUTLINED_FUNCTION_4_5();
      uint64_t v67 = (*(uint64_t (**)(uint64_t, uint64_t))(v64 + 320))(v65, v66);
      char v69 = sub_1B5BB57B4(v67, v68, 1u);
      swift_bridgeObjectRelease();
      if (v69)
      {
      }
      else
      {
        *((double *)a2 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = v25 + *(double *)sub_1B5B726BC();
        double v70 = *(double *)sub_1B5B726C8();

        *((double *)a2 + 4) = v2 + v70;
      }
      return;
    case 4:
      *a2 = *(void *)sub_1B5B7289C();
      a2[9] = *(void *)sub_1B5B726E0();
      a2[1] = *(void *)sub_1B5B728B4();
      a2[2] = *(void *)sub_1B5B728A8();
      a2[4] = *(void *)sub_1B5B728C0();
      uint64_t v61 = (double *)sub_1B5B7293C();
      OUTLINED_FUNCTION_43_5(v61);
      uint64_t v62 = (double *)sub_1B5B72948();
      OUTLINED_FUNCTION_42_4(v62);
      a2[7] = *sub_1B5B728E4();
      uint64_t v63 = *(void *)sub_1B5B72930();

      a2[6] = v63;
      a2[3] = 0;
      return;
    default:

      *((_OWORD *)a2 + 3) = 0u;
      *((_OWORD *)a2 + 4) = 0u;
      *((_OWORD *)a2 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = 0u;
      *((_OWORD *)a2 + 2) = 0u;
      *(_OWORD *)a2 = 0u;
      return;
  }
}

uint64_t sub_1B5BB57B4(uint64_t a1, unint64_t a2, unsigned __int8 a3)
{
  if (a2)
  {
    uint64_t v3 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x2000000000000000) == 0) {
      uint64_t v3 = a1 & 0xFFFFFFFFFFFFLL;
    }
    int v4 = (v3 != 0) & a3;
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t result = sub_1B5BC9F90();
      if (!v6)
      {
        int v10 = 256;
LABEL_23:
        swift_bridgeObjectRelease();
        return v10 | v4;
      }
      if (!((v6 & 0x2000000000000000) != 0 ? HIBYTE(v6) & 0xF : result & 0xFFFFFFFFFFFFLL)) {
        break;
      }
      if ((v6 & 0x1000000000000000) != 0)
      {
        int v8 = sub_1B5BCA110();
      }
      else
      {
        if ((v6 & 0x2000000000000000) == 0 && (result & 0x1000000000000000) == 0) {
          sub_1B5BCA140();
        }
        int v8 = sub_1B5BCA150();
      }
      int v9 = v8;
      swift_bridgeObjectRelease();
      if ((v9 - 14) > 0xFFFFFFFB)
      {
        int v10 = 0;
        goto LABEL_23;
      }
      int v10 = 0;
      if ((v9 - 8232) < 2 || v9 == 133) {
        goto LABEL_23;
      }
    }
    __break(1u);
  }
  else
  {
    int v10 = 0;
    int v4 = 0;
    return v10 | v4;
  }
  return result;
}

void sub_1B5BB58EC(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)(a2 + 8sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  id v46 = (void *)(a2 + 64);
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  id v47 = (id *)(a2 + 32);
  id v4 = objc_msgSend(self, sel_currentDevice);
  id v5 = objc_msgSend(v4, sel_userInterfaceIdiom);

  *(unsigned char *)a2 = v5 == (id)6;
  sub_1B5B729C0();
  swift_bridgeObjectRetain();
  sub_1B5B729CC();
  type metadata accessor for SGBannerIconParams(0);
  swift_bridgeObjectRetain();
  sub_1B5BC9220();
  *(_WORD *)(a2 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = 0;
  OUTLINED_FUNCTION_6_7();
  uint64_t v7 = *(uint64_t (**)(void))(v6 + 536);
  OUTLINED_FUNCTION_30_2();
  BOOL v49 = v7() == 0;
  *(void *)(a2 + 96) = 0;
  if (v5 == (id)6)
  {
    *(void *)(a2 + 96) = *(void *)sub_1B5B72854();
    OUTLINED_FUNCTION_30_2();
    if (v7() == 3)
    {
      BOOL v8 = 1;
    }
    else
    {
      OUTLINED_FUNCTION_30_2();
      BOOL v8 = v7() == 4;
    }
    BOOL v49 = v8;
  }
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  int v9 = a1;
  uint64_t v10 = sub_1B5BC9210();
  os_log_type_t v11 = sub_1B5BCA070();
  if (os_log_type_enabled((os_log_t)v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    v48[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    OUTLINED_FUNCTION_30_2();
    v13();
    uint64_t v14 = sub_1B5B74320();
    sub_1B5B7AAF8(v14, v15, v48);
    sub_1B5BCA0C0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 1024;
    sub_1B5BCA0C0();
    _os_log_impl(&dword_1B5B6C000, (os_log_t)v10, v11, "SGBanner Type: %s Supports: %{BOOL}d", (uint8_t *)v12, 0x12u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {
  }
  int v16 = (void *)MEMORY[0x1E4FBC8C8];
  uint64_t v17 = swift_beginAccess();
  if (!v49)
  {

    return;
  }
  unint64_t v18 = (*(uint64_t (**)(uint64_t))((*v16 & *v9) + 0x230))(v17);
  if (!v18)
  {

    uint64_t v10 = 0;
    *(void *)(a2 + 8sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = 0;
    goto LABEL_30;
  }
  unint64_t v19 = v18;
  uint64_t v20 = v18 & 0xFFFFFFFFFFFFFF8;
  if (v18 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1B5BCA170();
    OUTLINED_FUNCTION_39_2();
    if (v10 >= 1)
    {
      swift_bridgeObjectRetain();
      if (sub_1B5BCA170()) {
        goto LABEL_14;
      }
      swift_bridgeObjectRelease();
      __break(1u);
    }
  }
  else
  {
    uint64_t v10 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10)
    {
      swift_bridgeObjectRetain();
LABEL_14:
      if ((v19 & 0xC000000000000001) != 0)
      {
        id v21 = (id)MEMORY[0x1BA9A7760](0, v19);
      }
      else
      {
        if (!*(void *)(v20 + 16))
        {
          __break(1u);
          goto LABEL_62;
        }
        id v21 = *(id *)(v19 + 32);
      }
      id v22 = v21;
      swift_bridgeObjectRelease();
      goto LABEL_24;
    }
  }
  id v22 = 0;
LABEL_24:

  *(void *)(a2 + 8sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v22;
  if (v10 <= 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = 0;
    goto LABEL_30;
  }
  if ((v19 & 0xC000000000000001) != 0) {
    goto LABEL_63;
  }
  if (*(void *)(v20 + 16) <= 1uLL) {
    goto LABEL_66;
  }
  id v23 = *(id *)(v19 + 40);
  while (1)
  {
    OUTLINED_FUNCTION_39_2();
LABEL_30:

    *(void *)(a2 + 88) = v10;
    OUTLINED_FUNCTION_6_7();
    unint64_t v25 = (*(uint64_t (**)(void))(v24 + 392))();
    if (!v25)
    {

      uint64_t v10 = 0;
      *(void *)(a2 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = 0;
      goto LABEL_49;
    }
    unint64_t v19 = v25;
    uint64_t v26 = v25 & 0xFFFFFFFFFFFFFF8;
    if (!(v25 >> 62))
    {
      uint64_t v10 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v10) {
        goto LABEL_42;
      }
      swift_bridgeObjectRetain();
      goto LABEL_34;
    }
    swift_bridgeObjectRetain();
    sub_1B5BCA170();
    OUTLINED_FUNCTION_39_2();
    if (v10 < 1) {
      goto LABEL_42;
    }
    swift_bridgeObjectRetain();
    if (!sub_1B5BCA170()) {
      break;
    }
LABEL_34:
    if ((v19 & 0xC000000000000001) != 0)
    {
      id v27 = (id)MEMORY[0x1BA9A7760](0, v19);
      goto LABEL_37;
    }
    if (*(void *)(v26 + 16))
    {
      id v27 = *(id *)(v19 + 32);
LABEL_37:
      id v28 = v27;
      swift_bridgeObjectRelease();
      goto LABEL_43;
    }
LABEL_62:
    __break(1u);
LABEL_63:
    MEMORY[0x1BA9A7760](1, v19);
  }
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_42:
  id v28 = 0;
LABEL_43:

  *(void *)(a2 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v28;
  if (v10 <= 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = 0;
  }
  else
  {
    if ((v19 & 0xC000000000000001) != 0)
    {
      MEMORY[0x1BA9A7760](1, v19);
    }
    else
    {
      if (*(void *)(v26 + 16) <= 1uLL) {
        goto LABEL_67;
      }
      id v29 = *(id *)(v19 + 40);
    }
    OUTLINED_FUNCTION_39_2();
  }
LABEL_49:

  *id v47 = (id)v10;
  OUTLINED_FUNCTION_6_7();
  uint64_t v31 = (void *)(*(uint64_t (**)(void))(v30 + 800))();
  if (!v31)
  {
    swift_bridgeObjectRelease();
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    *id v46 = 0;
    v46[1] = 0;
    goto LABEL_58;
  }
  uint64_t v32 = v31;
  unint64_t v33 = v31[2];
  if (v33)
  {
    uint64_t v35 = v31[4];
    uint64_t v34 = v31[5];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v35 = 0;
    uint64_t v34 = 0;
  }
  swift_bridgeObjectRelease();
  *(void *)(a2 + 64) = v35;
  *(void *)(a2 + 72) = v34;
  if (v33 < 2)
  {
    swift_bridgeObjectRelease();
    uint64_t v36 = 0;
    uint64_t v37 = 0;
LABEL_58:
    swift_bridgeObjectRelease();
    *(void *)(a2 + 48) = v36;
    *(void *)(a2 + 56) = v37;
    unsigned __int16 v38 = sub_1B5BB5FA4(v9);
    char v39 = v38 > 0xFFu;
    *(unsigned char *)(a2 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = v38 & 1;
    *(unsigned char *)(a2 + 2) = v39;
    uint64_t v40 = v7();
    double v41 = sub_1B5BB612C(v40, v39);
    uint64_t v43 = v42;
    uint64_t v45 = v44;

    *(double *)(a2 + 8) = v41;
    *(void *)(a2 + 16) = v43;
    *(void *)(a2 + 24) = v45;
  }
  else
  {
    if (v32[2] >= 2uLL)
    {
      uint64_t v36 = v32[6];
      uint64_t v37 = v32[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_58;
    }
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
  }
}

uint64_t sub_1B5BB5FA4(void *a1)
{
  unint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *a1) + 0x230))();
  if (v1)
  {
    if (v1 >> 62) {
      uint64_t v2 = sub_1B5BCA170();
    }
    else {
      uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    BOOL v3 = v2 > 1;
    if (v2 > 0) {
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  OUTLINED_FUNCTION_4_0();
  unint64_t v5 = (*(uint64_t (**)(void))(v4 + 392))();
  if (!v5
    || (v5 >> 62 ? (uint64_t v6 = sub_1B5BCA170()) : (uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10)),
        swift_bridgeObjectRelease(),
        BOOL v3 = v6 > 1,
        v6 <= 0))
  {
    OUTLINED_FUNCTION_4_0();
    uint64_t v9 = (*(uint64_t (**)(void))(v8 + 800))();
    if (v9)
    {
      unint64_t v10 = *(void *)(v9 + 16);
      swift_bridgeObjectRelease();
      BOOL v7 = v10 != 0;
      BOOL v3 = v10 > 1;
    }
    else
    {
      BOOL v7 = 0;
    }
    goto LABEL_15;
  }
LABEL_11:
  BOOL v7 = 1;
LABEL_15:
  if (v3) {
    int v11 = 256;
  }
  else {
    int v11 = 0;
  }
  return v11 | v7;
}

double sub_1B5BB612C(uint64_t a1, char a2)
{
  if (a2)
  {
    if (a1 == 4)
    {
      uint64_t v2 = (double *)sub_1B5B728CC();
    }
    else if (a1 == 3)
    {
      uint64_t v2 = (double *)sub_1B5B72800();
    }
    else if (a1)
    {
      uint64_t v2 = (double *)sub_1B5B72644();
    }
    else
    {
      uint64_t v2 = (double *)sub_1B5B72650();
    }
    double v4 = *v2;
    sub_1B5B7265C();
    sub_1B5B72668();
  }
  else
  {
    if (a1 == 4)
    {
      BOOL v3 = sub_1B5B728CC();
    }
    else if (a1 == 3)
    {
      BOOL v3 = sub_1B5B72800();
    }
    else
    {
      BOOL v3 = sub_1B5B72644();
    }
    return *(double *)v3;
  }
  return v4;
}

uint64_t sub_1B5BB61C8(void *a1)
{
  uint64_t v2 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *a1) + 0x290))();
  BOOL v3 = v2;
  if (v2)
  {
    unsigned __int8 v4 = objc_msgSend(v2, sel_position);
    if (v4) {
      uint64_t v5 = MEMORY[0x1BA9A7260](objc_msgSend(v3, sel_color));
    }
    else {
      uint64_t v5 = sub_1B5BC9C50();
    }
    uint64_t v6 = v5;
    if ((v4 & 2) != 0) {
      MEMORY[0x1BA9A7260](objc_msgSend(v3, sel_color));
    }
    else {
      sub_1B5BC9C50();
    }
  }
  else
  {
    sub_1B5BC9C50();
    uint64_t v6 = sub_1B5BC9C50();
  }

  return v6;
}

void sub_1B5BB62E4(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = objc_msgSend(self, sel_currentDevice);
  id v5 = objc_msgSend(v4, sel_userInterfaceIdiom);

  *(unsigned char *)a2 = v5 == (id)6;
  OUTLINED_FUNCTION_1_5();
  uint64_t v7 = (*(uint64_t (**)(void))(v6 + 416))();
  unint64_t v9 = v8;
  swift_bridgeObjectRelease();
  uint64_t v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0) {
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  *(unsigned char *)(a2 + 3) = v10 != 0;
  *(void *)(a2 + 8) = 0x6B72616D78;
  *(void *)(a2 + 16) = 0xE500000000000000;
  OUTLINED_FUNCTION_1_5();
  uint64_t v12 = *(uint64_t (**)(void))(v11 + 368);
  uint64_t v13 = v12();
  if (v5 == (id)6)
  {
    if (v13 == 1)
    {
      OUTLINED_FUNCTION_48();
      v14 += 67;
      unint64_t v15 = *v14;
      BOOL v16 = (*v14)() == 2 || v15() == 4;
    }
    else
    {
      BOOL v16 = 0;
    }
    *(unsigned char *)(a2 + 2) = v16;
    uint64_t v20 = v12();
    BOOL v21 = !v16;
    if (v20 != 1) {
      BOOL v21 = 0;
    }
    *(unsigned char *)(a2 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = v21;
    OUTLINED_FUNCTION_1_5();
    id v23 = *(uint64_t (**)(void))(v22 + 536);
    if (v23() == 4)
    {
      unsigned __int8 v24 = 1;
      goto LABEL_25;
    }
    OUTLINED_FUNCTION_30_2();
    BOOL v25 = v23() == 3;
  }
  else
  {
    if (v13 == 1)
    {
      OUTLINED_FUNCTION_48();
      v17 += 67;
      unint64_t v18 = *v17;
      if ((*v17)()) {
        BOOL v19 = v18() == 1;
      }
      else {
        BOOL v19 = 1;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
    *(unsigned char *)(a2 + 2) = v19;
    uint64_t v26 = v12();
    BOOL v27 = !v19;
    if (v26 != 1) {
      BOOL v27 = 0;
    }
    *(unsigned char *)(a2 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = v27;
    OUTLINED_FUNCTION_1_5();
    BOOL v25 = (*(uint64_t (**)(void))(v28 + 536))() == 0;
  }
  unsigned __int8 v24 = v25;
LABEL_25:
  OUTLINED_FUNCTION_48();
  uint64_t v30 = (*(uint64_t (**)(void))(v29 + 320))();
  unsigned __int16 v32 = sub_1B5BB57B4(v30, v31, v24);
  char v33 = v32;
  BOOL v34 = v32 > 0xFFu;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a2 + 4) = v33 & 1;
  *(unsigned char *)(a2 + 5) = v34;
  OUTLINED_FUNCTION_1_5();
  *(unsigned char *)(a2 + 6) = (*(uint64_t (**)(void))(v35 + 776))() & 1;
  uint64_t v36 = (int *)type metadata accessor for SGBannerViewModel(0);
  uint64_t v37 = a2 + v36[12];
  id v38 = a1;
  sub_1B5BB58EC(v38, v37);
  char v39 = v38;
  uint64_t v40 = sub_1B5BB61C8(v39);
  uint64_t v41 = a2 + v36[13];
  *(void *)uint64_t v41 = v40;
  *(void *)(v41 + 8) = v42;
  *(unsigned char *)(v41 + 16) = v43 & 1;
  *(unsigned char *)(v41 + 17) = v44 & 1;
  sub_1B5BB51DC(v39, (void *)(a2 + v36[14]));
}

uint64_t type metadata accessor for SGBannerPaddingParams(uint64_t a1)
{
  return sub_1B5B7B630(a1, qword_1EB842C50);
}

uint64_t type metadata accessor for SGBannerIconParams(uint64_t a1)
{
  return sub_1B5B7B630(a1, qword_1EB842BA0);
}

uint64_t type metadata accessor for SGBannerViewModel(uint64_t a1)
{
  return sub_1B5B7B630(a1, (uint64_t *)&unk_1EB842B90);
}

_OWORD *sub_1B5BB6678(_OWORD *a1, uint64_t a2)
{
  OUTLINED_FUNCTION_6_0();
  if ((*(_DWORD *)(v5 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_59_0(*(void *)a2);
  }
  else
  {
    uint64_t v6 = v4;
    long long v7 = *(_OWORD *)(a2 + 16);
    *a1 = *(_OWORD *)a2;
    a1[1] = v7;
    long long v8 = *(_OWORD *)(a2 + 48);
    a1[2] = *(_OWORD *)(a2 + 32);
    a1[3] = v8;
    a1[4] = *(_OWORD *)(a2 + 64);
    sub_1B5BC9230();
    OUTLINED_FUNCTION_1_0();
    uint64_t v9 = OUTLINED_FUNCTION_38_2();
    v10(v9);
    uint64_t v11 = *(int *)(v6 + 64);
    *(void *)((char *)a1 + *(int *)(v6 + 60)) = *(void *)(a2 + *(int *)(v6 + 60));
    *((unsigned char *)a1 + v1sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = *(unsigned char *)(a2 + v11);
  }
  return a1;
}

uint64_t sub_1B5BB6730(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 56);
  sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
  return v5(v2, v3);
}

uint64_t sub_1B5BB6790(_OWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_4(a1, a2);
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = OUTLINED_FUNCTION_38_2();
  v3(v2);
  return OUTLINED_FUNCTION_9_6();
}

void *sub_1B5BB67E4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  OUTLINED_FUNCTION_19_6((uint64_t)a1, (uint64_t)a2);
  v7[4] = v6[4];
  v7[5] = v6[5];
  v7[6] = v6[6];
  v7[7] = v6[7];
  v7[8] = v6[8];
  v7[9] = v6[9];
  sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  uint64_t v8 = OUTLINED_FUNCTION_25_1();
  v9(v8);
  *(void *)((char *)a1 + *(int *)(a3 + 60)) = *(void *)((char *)a2 + *(int *)(a3 + 60));
  *((unsigned char *)a1 + *(int *)(a3 + 64)) = *((unsigned char *)a2 + *(int *)(a3 + 64));
  return a1;
}

uint64_t sub_1B5BB68AC(_OWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_4(a1, a2);
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = OUTLINED_FUNCTION_25_1();
  v3(v2);
  return OUTLINED_FUNCTION_9_6();
}

uint64_t sub_1B5BB6904(_OWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_4(a1, a2);
  OUTLINED_FUNCTION_1_0();
  uint64_t v2 = OUTLINED_FUNCTION_25_1();
  v3(v2);
  return OUTLINED_FUNCTION_9_6();
}

uint64_t sub_1B5BB695C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B5BB6970);
}

uint64_t sub_1B5BB6970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1B5BC9230();
  OUTLINED_FUNCTION_6_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 56);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  else
  {
    unsigned int v11 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 64));
    if (v11 >= 2) {
      return ((v11 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_1B5BB6A14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B5BB6A28);
}

void sub_1B5BB6A28(uint64_t a1, char a2, int a3, uint64_t a4)
{
  sub_1B5BC9230();
  OUTLINED_FUNCTION_6_0();
  if (*(_DWORD *)(v8 + 84) == a3)
  {
    uint64_t v9 = OUTLINED_FUNCTION_63_0(*(int *)(a4 + 56));
    __swift_storeEnumTagSinglePayload(v9, v10, v11, v12);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 64)) = a2 + 1;
  }
}

uint64_t sub_1B5BB6AB0()
{
  uint64_t result = sub_1B5BC9230();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1B5BB6B68(uint64_t a1)
{
  OUTLINED_FUNCTION_6_0();
  if ((*(_DWORD *)(v4 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_59_0(*(void *)v2);
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)v2;
    *(_WORD *)(a1 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = *(_WORD *)(v2 + 1);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(v2 + 8);
    uint64_t v5 = *(void **)(v2 + 32);
    *(void *)(a1 + 24) = *(void *)(v2 + 24);
    *(void *)(a1 + 32) = v5;
    uint64_t v7 = *(void **)(v2 + 40);
    uint64_t v6 = *(void *)(v2 + 48);
    *(void *)(a1 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v7;
    *(void *)(a1 + 48) = v6;
    uint64_t v8 = *(void *)(v2 + 64);
    *(void *)(a1 + 56) = *(void *)(v2 + 56);
    *(void *)(a1 + 64) = v8;
    uint64_t v9 = *(void **)(v2 + 80);
    *(void *)(a1 + 72) = *(void *)(v2 + 72);
    *(void *)(a1 + 8sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v9;
    uint64_t v11 = *(void **)(v2 + 88);
    uint64_t v10 = *(void *)(v2 + 96);
    uint64_t v27 = a1 + *(int *)(v3 + 68);
    *(void *)(a1 + 88) = v11;
    *(void *)(a1 + 96) = v10;
    sub_1B5BC9230();
    OUTLINED_FUNCTION_1_0();
    uint64_t v13 = *(void (**)(uint64_t))(v12 + 16);
    id v14 = v5;
    id v15 = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v16 = v9;
    id v17 = v11;
    uint64_t v25 = OUTLINED_FUNCTION_36_3((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24, v27);
    v13(v25);
  }
  return a1;
}

uint64_t sub_1B5BB6C68()
{
  OUTLINED_FUNCTION_152();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v3 = (char *)v1 + *(int *)(v0 + 68);
  sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
  return v6(v3, v4);
}

uint64_t sub_1B5BB6CFC(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_16_7(a1, a2);
  uint64_t v4 = (void *)v3[4];
  v5[3] = v3[3];
  v5[4] = v4;
  uint64_t v7 = (void *)v3[5];
  uint64_t v6 = v3[6];
  v5[5] = v7;
  v5[6] = v6;
  uint64_t v8 = v3[8];
  v5[7] = v3[7];
  v5[8] = v8;
  uint64_t v9 = (void *)v3[10];
  v5[9] = v3[9];
  v5[10] = v9;
  uint64_t v11 = (void *)v3[11];
  uint64_t v10 = v3[12];
  uint64_t v28 = (uint64_t)v5 + *(int *)(v12 + 68);
  v5[11] = v11;
  v5[12] = v10;
  sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  id v14 = *(void (**)(uint64_t))(v13 + 16);
  id v15 = v4;
  id v16 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v17 = v9;
  id v18 = v11;
  uint64_t v26 = OUTLINED_FUNCTION_36_3((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25, v28);
  v14(v26);
  return v2;
}

void *sub_1B5BB6DC8(unsigned char *a1, unsigned char *a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_12_4(a1, a2);
  OUTLINED_FUNCTION_19_6((uint64_t)v4, v5);
  uint64_t v7 = *(void **)(v6 + 32);
  uint64_t v9 = *(void **)(v8 + 32);
  *(void *)(v6 + 32) = v9;
  id v10 = v9;

  uint64_t v11 = (void *)v2[5];
  uint64_t v12 = (void *)v3[5];
  v2[5] = v12;
  id v13 = v12;

  v2[6] = v3[6];
  v2[7] = v3[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v2[8] = v3[8];
  v2[9] = v3[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v14 = (void *)v2[10];
  id v15 = (void *)v3[10];
  v2[10] = v15;
  id v16 = v15;

  id v17 = (void *)v2[11];
  id v18 = (void *)v3[11];
  v2[11] = v18;
  id v19 = v18;

  OUTLINED_FUNCTION_20_6();
  OUTLINED_FUNCTION_1_0();
  uint64_t v20 = OUTLINED_FUNCTION_35();
  v21(v20);
  return v2;
}

uint64_t sub_1B5BB6EB0(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_16_7(a1, a2);
  *(void *)(v4 + 24) = *(void *)(v3 + 24);
  long long v5 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)(v4 + 32) = *(_OWORD *)(v3 + 32);
  *(_OWORD *)(v4 + 48) = v5;
  long long v6 = *(_OWORD *)(v3 + 80);
  *(_OWORD *)(v4 + 64) = *(_OWORD *)(v3 + 64);
  *(_OWORD *)(v4 + 8sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v6;
  *(void *)(v4 + 96) = *(void *)(v3 + 96);
  sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  uint64_t v7 = OUTLINED_FUNCTION_35();
  v8(v7);
  return v2;
}

void *sub_1B5BB6F34(unsigned char *a1, unsigned char *a2)
{
  uint64_t v4 = OUTLINED_FUNCTION_12_4(a1, a2);
  *(_OWORD *)(v4 + 8) = *(_OWORD *)(v5 + 8);
  *((void *)v4 + 3) = *(void *)(v5 + 24);
  long long v6 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = *(void *)(v5 + 32);

  uint64_t v7 = (void *)v2[5];
  v2[5] = v3[5];

  uint64_t v8 = v3[7];
  v2[6] = v3[6];
  v2[7] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = v3[9];
  v2[8] = v3[8];
  v2[9] = v9;
  swift_bridgeObjectRelease();
  id v10 = (void *)v2[10];
  v2[10] = v3[10];

  uint64_t v11 = (void *)v2[11];
  v2[11] = v3[11];

  OUTLINED_FUNCTION_20_6();
  OUTLINED_FUNCTION_1_0();
  uint64_t v12 = OUTLINED_FUNCTION_35();
  v13(v12);
  return v2;
}

uint64_t sub_1B5BB6FF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B5BB700C);
}

uint64_t sub_1B5BB700C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_1B5BC9230();
    uint64_t v10 = a1 + *(int *)(a3 + 68);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t sub_1B5BB70A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B5BB70B4);
}

uint64_t sub_1B5BB70B4(uint64_t result, unsigned int a2, int a3, uint64_t a4)
{
  if (a3 == 2147483646)
  {
    *(void *)(result + 32) = a2;
  }
  else
  {
    sub_1B5BC9230();
    uint64_t v5 = OUTLINED_FUNCTION_63_0(*(int *)(a4 + 68));
    return __swift_storeEnumTagSinglePayload(v5, v6, v7, v8);
  }
  return result;
}

uint64_t sub_1B5BB712C()
{
  uint64_t result = sub_1B5BC9230();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1B5BB71FC()
{
  swift_release();
  return swift_release();
}

uint64_t sub_1B5BB7238(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_1B5BB7278()
{
  OUTLINED_FUNCTION_152();
  *unint64_t v1 = *v2;
  swift_retain();
  swift_release();
  v1[1] = *(void *)(v0 + 8);
  swift_retain();
  swift_release();
  return OUTLINED_FUNCTION_28_5();
}

uint64_t sub_1B5BB72D4()
{
  OUTLINED_FUNCTION_152();
  swift_release();
  *unint64_t v1 = *v0;
  swift_release();
  return OUTLINED_FUNCTION_28_5();
}

uint64_t sub_1B5BB7310(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 18))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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

uint64_t sub_1B5BB7350(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 18) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 18) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for SGBannerDividerParams()
{
}

uint64_t sub_1B5BB739C(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_6_0();
  if ((*(_DWORD *)(v7 + 80) & 0x20000) != 0)
  {
    OUTLINED_FUNCTION_59_0(*(void *)a2);
  }
  else
  {
    uint64_t v8 = v6;
    *(_DWORD *)a1 = *(_DWORD *)a2;
    *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
    *(_WORD *)(a1 + 5) = *(_WORD *)(a2 + 5);
    uint64_t v9 = *(void *)(a2 + 16);
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = v9;
    uint64_t v10 = *(int *)(v6 + 48);
    uint64_t v11 = a1 + v10;
    uint64_t v12 = (void *)(a2 + v10);
    OUTLINED_FUNCTION_8_5();
    id v13 = (void *)v12[10];
    *(void *)(v11 + 72) = v12[9];
    *(void *)(v11 + 8sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v13;
    unsigned __int16 v32 = v13;
    char v33 = (void *)v12[11];
    OUTLINED_FUNCTION_18_5(v12[12]);
    OUTLINED_FUNCTION_26_3();
    id v15 = *(void (**)(uint64_t))(v14 + 16);
    swift_bridgeObjectRetain();
    id v16 = v3;
    id v17 = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v18 = v32;
    id v19 = v33;
    uint64_t v27 = OUTLINED_FUNCTION_32_1((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26, v30, v31);
    v15(v27);
    OUTLINED_FUNCTION_5_5(*(int *)(v8 + 52));
    swift_retain();
    uint64_t v28 = OUTLINED_FUNCTION_22_5();
    v15(v28);
    OUTLINED_FUNCTION_21_3();
  }
  return a1;
}

uint64_t sub_1B5BB74C4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  unint64_t v4 = (id *)(a1 + *(int *)(a2 + 48));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v5 = (char *)v4 + *(int *)(type metadata accessor for SGBannerIconParams(0) + 68);
  uint64_t v6 = sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v7 + 8);
  v11(v5, v6);
  swift_release();
  swift_release();
  uint64_t v8 = a1 + *(int *)(a2 + 56);
  uint64_t v9 = v8 + *(int *)(type metadata accessor for SGBannerPaddingParams(0) + 56);
  return ((uint64_t (*)(uint64_t, uint64_t))v11)(v9, v6);
}

uint64_t sub_1B5BB75D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = OUTLINED_FUNCTION_13_4(a1, a2);
  uint64_t v8 = *(void *)(v7 + 16);
  *(void *)(v6 + 8) = *(void *)(v7 + 8);
  *(void *)(v6 + 16) = v8;
  uint64_t v10 = *(int *)(v9 + 48);
  uint64_t v11 = v6 + v10;
  uint64_t v12 = (void *)(v7 + v10);
  OUTLINED_FUNCTION_8_5();
  id v13 = (void *)v12[10];
  *(void *)(v11 + 72) = v12[9];
  *(void *)(v11 + 8sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v13;
  unsigned __int16 v32 = (void *)v12[11];
  OUTLINED_FUNCTION_18_5(v12[12]);
  OUTLINED_FUNCTION_26_3();
  id v15 = *(void (**)(uint64_t))(v14 + 16);
  swift_bridgeObjectRetain();
  id v16 = v5;
  id v17 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v18 = v13;
  id v19 = v32;
  uint64_t v27 = OUTLINED_FUNCTION_32_1((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26, v30, v31);
  v15(v27);
  OUTLINED_FUNCTION_5_5(*(int *)(a3 + 52));
  swift_retain();
  uint64_t v28 = OUTLINED_FUNCTION_22_5();
  v15(v28);
  OUTLINED_FUNCTION_21_3();
  return v3;
}

uint64_t sub_1B5BB76C0(unsigned char *a1, unsigned char *a2)
{
  uint64_t v5 = OUTLINED_FUNCTION_7_7(a1, a2);
  *((void *)v5 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = *(void *)(v6 + 8);
  *(void *)(v2 + 16) = *(void *)(v6 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = v4[12];
  uint64_t v8 = v2 + v7;
  uint64_t v9 = (void *)(v3 + v7);
  *(unsigned char *)uint64_t v8 = *(unsigned char *)(v3 + v7);
  *(unsigned char *)(v8 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = *(unsigned char *)(v3 + v7 + 1);
  *(unsigned char *)(v8 + 2) = *(unsigned char *)(v3 + v7 + 2);
  *(void *)(v8 + 8) = *(void *)(v3 + v7 + 8);
  *(void *)(v8 + 16) = *(void *)(v3 + v7 + 16);
  *(void *)(v8 + 24) = *(void *)(v3 + v7 + 24);
  uint64_t v10 = *(void **)(v2 + v7 + 32);
  uint64_t v11 = *(void **)(v3 + v7 + 32);
  *(void *)(v8 + 32) = v11;
  id v12 = v11;

  id v13 = *(void **)(v8 + 40);
  uint64_t v14 = (void *)v9[5];
  *(void *)(v8 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v14;
  id v15 = v14;

  *(void *)(v8 + 48) = v9[6];
  *(void *)(v8 + 56) = v9[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v8 + 64) = v9[8];
  *(void *)(v8 + 72) = v9[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v16 = *(void **)(v8 + 80);
  id v17 = (void *)v9[10];
  *(void *)(v8 + 8sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v17;
  id v18 = v17;

  id v19 = *(void **)(v8 + 88);
  uint64_t v20 = (void *)v9[11];
  *(void *)(v8 + 88) = v20;
  id v21 = v20;

  *(void *)(v8 + 96) = v9[12];
  uint64_t v22 = *(int *)(type metadata accessor for SGBannerIconParams(0) + 68);
  uint64_t v23 = v8 + v22;
  uint64_t v24 = (char *)v9 + v22;
  uint64_t v25 = sub_1B5BC9230();
  OUTLINED_FUNCTION_1_0();
  uint64_t v27 = *(void (**)(uint64_t, char *, uint64_t))(v26 + 24);
  v27(v23, v24, v25);
  uint64_t v28 = v4[13];
  uint64_t v29 = v2 + v28;
  uint64_t v30 = v3 + v28;
  *(void *)(v2 + v28) = *(void *)(v3 + v28);
  swift_retain();
  swift_release();
  *(void *)(v29 + 8) = *(void *)(v30 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(v29 + 16) = *(unsigned char *)(v30 + 16);
  *(unsigned char *)(v29 + 17) = *(unsigned char *)(v30 + 17);
  uint64_t v31 = v4[14];
  unsigned __int16 v32 = (void *)(v2 + v31);
  uint64_t v33 = v3 + v31;
  *unsigned __int16 v32 = *(void *)(v3 + v31);
  v32[1] = *(void *)(v3 + v31 + 8);
  v32[2] = *(void *)(v3 + v31 + 16);
  v32[3] = *(void *)(v3 + v31 + 24);
  v32[4] = *(void *)(v3 + v31 + 32);
  v32[5] = *(void *)(v3 + v31 + 40);
  v32[6] = *(void *)(v3 + v31 + 48);
  v32[7] = *(void *)(v3 + v31 + 56);
  v32[8] = *(void *)(v3 + v31 + 64);
  v32[9] = *(void *)(v3 + v31 + 72);
  BOOL v34 = (int *)type metadata accessor for SGBannerPaddingParams(0);
  v27((uint64_t)v32 + v34[14], (char *)(v33 + v34[14]), v25);
  *(void *)((char *)v32 + v34[15]) = *(void *)(v33 + v34[15]);
  *((unsigned char *)v32 + v34[16]) = *(unsigned char *)(v33 + v34[16]);
  return v2;
}

uint64_t sub_1B5BB792C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = OUTLINED_FUNCTION_13_4(a1, a2);
  *(_OWORD *)(v6 + 8) = *(_OWORD *)(v7 + 8);
  uint64_t v9 = *(int *)(v8 + 48);
  uint64_t v10 = v6 + v9;
  *(unsigned char *)uint64_t v10 = *(unsigned char *)(v7 + v9);
  *(_WORD *)(v10 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = *(_WORD *)(v7 + v9 + 1);
  *(_OWORD *)(v10 + 8) = *(_OWORD *)(v7 + v9 + 8);
  *(void *)(v10 + 24) = *(void *)(v7 + v9 + 24);
  long long v11 = *(_OWORD *)(v7 + v9 + 48);
  *(_OWORD *)(v10 + 32) = *(_OWORD *)(v7 + v9 + 32);
  *(_OWORD *)(v10 + 48) = v11;
  long long v12 = *(_OWORD *)(v7 + v9 + 80);
  *(_OWORD *)(v10 + 64) = *(_OWORD *)(v7 + v9 + 64);
  *(_OWORD *)(v10 + 8sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v12;
  *(void *)(v10 + 96) = *(void *)(v7 + v9 + 96);
  type metadata accessor for SGBannerIconParams(0);
  OUTLINED_FUNCTION_31_4();
  OUTLINED_FUNCTION_1_0();
  uint64_t v14 = *(void (**)(uint64_t))(v13 + 32);
  uint64_t v15 = OUTLINED_FUNCTION_37_3();
  v14(v15);
  uint64_t v16 = *(int *)(a3 + 52);
  uint64_t v17 = v3 + v16;
  uint64_t v18 = v4 + v16;
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  *(_WORD *)(v17 + 16) = *(_WORD *)(v18 + 16);
  id v19 = OUTLINED_FUNCTION_10_6();
  v14((uint64_t)v19);
  return OUTLINED_FUNCTION_17_6();
}

uint64_t sub_1B5BB7A18(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_7_7(a1, a2);
  uint64_t v6 = *(void *)(v5 + 16);
  *(void *)(v2 + 8) = *(void *)(v5 + 8);
  *(void *)(v2 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(v4 + 48);
  uint64_t v8 = v2 + v7;
  uint64_t v9 = (void *)(v3 + v7);
  *(unsigned char *)uint64_t v8 = *(unsigned char *)(v3 + v7);
  *(unsigned char *)(v8 + sub_1B5B8C22C("SGContactSuggestion: Contact delegate for confirming suggested contact", 1) = *(unsigned char *)(v3 + v7 + 1);
  *(unsigned char *)(v8 + 2) = *(unsigned char *)(v3 + v7 + 2);
  *(_OWORD *)(v8 + 8) = *(_OWORD *)(v3 + v7 + 8);
  *(void *)(v8 + 24) = *(void *)(v3 + v7 + 24);
  uint64_t v10 = *(void **)(v2 + v7 + 32);
  *(void *)(v8 + 32) = v9[4];

  long long v11 = *(void **)(v8 + 40);
  *(void *)(v8 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v9[5];

  uint64_t v12 = v9[7];
  *(void *)(v8 + 48) = v9[6];
  *(void *)(v8 + 56) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = v9[9];
  *(void *)(v8 + 64) = v9[8];
  *(void *)(v8 + 72) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void **)(v8 + 80);
  *(void *)(v8 + 8sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = v9[10];

  uint64_t v15 = *(void **)(v8 + 88);
  *(void *)(v8 + 88) = v9[11];

  *(void *)(v8 + 96) = v9[12];
  type metadata accessor for SGBannerIconParams(0);
  OUTLINED_FUNCTION_31_4();
  OUTLINED_FUNCTION_1_0();
  uint64_t v17 = *(void (**)(uint64_t))(v16 + 40);
  uint64_t v18 = OUTLINED_FUNCTION_37_3();
  v17(v18);
  uint64_t v19 = *(int *)(v4 + 52);
  uint64_t v20 = v2 + v19;
  uint64_t v21 = v3 + v19;
  *(void *)(v2 + v19) = *(void *)(v3 + v19);
  swift_release();
  *(void *)(v20 + 8) = *(void *)(v21 + 8);
  swift_release();
  *(unsigned char *)(v20 + 16) = *(unsigned char *)(v21 + 16);
  *(unsigned char *)(v20 + 17) = *(unsigned char *)(v21 + 17);
  uint64_t v22 = OUTLINED_FUNCTION_10_6();
  v17((uint64_t)v22);
  return OUTLINED_FUNCTION_17_6();
}

uint64_t sub_1B5BB7B84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1B5BB7B98);
}

uint64_t sub_1B5BB7B98(uint64_t a1, uint64_t a2, uint64_t a3)
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
    type metadata accessor for SGBannerIconParams(0);
    OUTLINED_FUNCTION_6_0();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 48);
    }
    else
    {
      uint64_t v10 = type metadata accessor for SGBannerPaddingParams(0);
      uint64_t v11 = *(int *)(a3 + 56);
    }
    return __swift_getEnumTagSinglePayload(a1 + v11, a2, v10);
  }
}

uint64_t sub_1B5BB7C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1B5BB7C5C);
}

uint64_t sub_1B5BB7C5C(uint64_t result, int a2, int a3, uint64_t a4)
{
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    type metadata accessor for SGBannerIconParams(0);
    OUTLINED_FUNCTION_6_0();
    if (*(_DWORD *)(v6 + 84) == a3)
    {
      uint64_t v7 = *(int *)(a4 + 48);
    }
    else
    {
      type metadata accessor for SGBannerPaddingParams(0);
      uint64_t v7 = *(int *)(a4 + 56);
    }
    uint64_t v8 = OUTLINED_FUNCTION_63_0(v7);
    return __swift_storeEnumTagSinglePayload(v8, v9, v10, v11);
  }
  return result;
}

uint64_t sub_1B5BB7D00()
{
  uint64_t result = type metadata accessor for SGBannerIconParams(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for SGBannerPaddingParams(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

Swift::Void __swiftcall SGReminderSuggestion.dismissViewController(_:finished:)(UIViewController *_, Swift::Bool finished)
{
  OUTLINED_FUNCTION_72();
  uint64_t v6 = (void *)(*(uint64_t (**)(void))(v5 + 120))();
  if (v6)
  {
    uint64_t v7 = v6;
    objc_msgSend(v6, sel_dismissViewController_, _);
    objc_msgSend(v7, sel_suggestion_actionFinished_, v2, finished);
    swift_unknownObjectRelease();
  }
}

Swift::String __swiftcall SGReminderSuggestion.suggestionTitle()()
{
  if (currentUIContext())
  {
    OUTLINED_FUNCTION_72();
    unint64_t v1 = (void *)(*(uint64_t (**)(void))(v0 + 144))();
    id v2 = objc_msgSend(v1, sel_title);

    uint64_t v3 = sub_1B5BC9F40();
    uint64_t v5 = v4;

    uint64_t v6 = v3;
    uint64_t v7 = v5;
  }
  else
  {
    OUTLINED_FUNCTION_5_6();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
    uint64_t v8 = OUTLINED_FUNCTION_16_0();
    *(_OWORD *)(v8 + 16) = xmmword_1B5BCD260;
    uint64_t v9 = OUTLINED_FUNCTION_0_4((void *)v8, MEMORY[0x1E4FBB550]);
    uint64_t v11 = v10;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v6 = v9;
    uint64_t v7 = v11;
  }
  result._object = v7;
  result._countAndFlagsBits = v6;
  return result;
}

SGSuggestionAction __swiftcall SGReminderSuggestion.suggestionPrimaryAction()()
{
  unint64_t v1 = v0;
  id v2 = sub_1B5BC9210();
  os_log_type_t v3 = sub_1B5BCA040();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = (void *)MEMORY[0x1E4FBC8C8];
  if (v4)
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v7 = (void *)(*(uint64_t (**)(void))((*v5 & *v1) + 0x90))();
    id v8 = objc_msgSend(v7, sel_loggingIdentifier);

    uint64_t v9 = sub_1B5BC9F40();
    unint64_t v11 = v10;

    sub_1B5B7AAF8(v9, v11, &v20);
    sub_1B5BCA0C0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B5B6C000, v2, v3, "SGReminderSuggestion - SGReminder %s primary action initialized", v6, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
  }
  else
  {
  }
  sub_1B5B7447C(0, &qword_1E9D94468);
  uint64_t v12 = (*(uint64_t (**)(void))((*v5 & *v1) + 0x118))();
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v1;
  uint64_t v16 = v1;
  sub_1B5B8C07C(v12, v14, (uint64_t)sub_1B5BB8F7C, v15);
  OUTLINED_FUNCTION_6_5();
  result._handler = v19;
  result._title = v18;
  result.super.Class isa = v17;
  return result;
}

UIImage_optional __swiftcall SGReminderSuggestion.suggestionImage()()
{
  unint64_t v1 = (objc_class *)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
  result.value.super.Class isa = v1;
  result.is_nil = v2;
  return result;
}

SGSuggestionAction_optional __swiftcall SGReminderSuggestion.suggestionDismissAction()()
{
  sub_1B5B7447C(0, &qword_1E9D94468);
  id v1 = sub_1B5B72B30();
  uint64_t v3 = v2;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v0;
  id v5 = v0;
  uint64_t v6 = (objc_class *)sub_1B5B8C07C((uint64_t)v1, v3, (uint64_t)sub_1B5BB9038, v4);
  result.value._handler = v8;
  result.value._title = v7;
  result.value.super.Class isa = v6;
  result.is_nil = v9;
  return result;
}

Swift::String_optional __swiftcall SGReminderSuggestion.suggestionSubtitle()()
{
  OUTLINED_FUNCTION_5_6();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
  uint64_t v0 = OUTLINED_FUNCTION_16_0();
  *(_OWORD *)(v0 + 16) = xmmword_1B5BCD260;
  uint64_t v1 = OUTLINED_FUNCTION_0_4((void *)v0, MEMORY[0x1E4FBB550]);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = v1;
  id v5 = v3;
  result.value._object = v5;
  result.value._countAndFlagsBits = v4;
  return result;
}

NSAttributedString_optional __swiftcall SGReminderSuggestion.suggestionAttributedSubtitle()()
{
  uint64_t v1 = v0;
  sub_1B5B7447C(0, (unint64_t *)&unk_1E9D93CD0);
  uint64_t v2 = (void *)MEMORY[0x1E4FBC8C8];
  OUTLINED_FUNCTION_4_6();
  uint64_t v4 = (void *)(*(uint64_t (**)(void))(v3 + 144))();
  id v5 = objc_msgSend(v4, sel_title);

  sub_1B5BC9F40();
  id v6 = sub_1B5B73374();
  sub_1B5B7447C(0, &qword_1E9D94BD8);
  id v7 = sub_1B5B73374();
  objc_msgSend(v6, sel_appendAttributedString_, v7);

  uint64_t v8 = (*(uint64_t (**)(void))((*v2 & *v1) + 0x128))();
  if (v9)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v9;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D951A0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1B5BCD260;
    uint64_t v13 = sub_1B5BC9F00();
    *(void *)(inited + 64) = MEMORY[0x1E4FBB1A0];
    *(void *)(inited + 32) = v13;
    *(void *)(inited + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = 5457241;
    *(void *)(inited + 48) = 0xE300000000000000;
    type metadata accessor for Key(0);
    sub_1B5B74E98(&qword_1E9D93D78);
    uint64_t v14 = sub_1B5BC9ED0();
    id v15 = objc_allocWithZone(MEMORY[0x1E4F28E48]);
    id v16 = sub_1B5BB8E80(v10, v11, v14);
    objc_msgSend(v6, sel_appendAttributedString_, v16);
  }
  uint64_t v17 = (objc_class *)v6;
  result.is_nil = v9;
  result.value.super.Class isa = v17;
  return result;
}

uint64_t SGReminderSuggestion.suggestionActionButtonType()()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC17CoreSuggestionsUI20SGReminderSuggestion_bannerForVisionDevice)) {
    return 4;
  }
  else {
    return 0;
  }
}

uint64_t SGReminderSuggestion.suggestionCategory()()
{
  return swift_unknownObjectRetain();
}

Swift::String __swiftcall SGReminderSuggestion.suggestionCategoryId()()
{
  uint64_t v0 = (uint64_t *)sub_1B5B729A8();
  uint64_t v1 = *v0;
  uint64_t v2 = (void *)v0[1];
  swift_bridgeObjectRetain();
  uint64_t v3 = v1;
  uint64_t v4 = v2;
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

UIImage __swiftcall SGReminderSuggestion.suggestionCategoryImage()()
{
  return (UIImage)(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
}

Swift::String __swiftcall SGReminderSuggestion.suggestionCategoryTitle()()
{
  id v0 = sub_1B5B72B30();
  result._object = v1;
  result._countAndFlagsBits = (uint64_t)v0;
  return result;
}

id sub_1B5BB89C0(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  id v5 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  return v5;
}

Swift::String __swiftcall SGReminderSuggestion.suggestionCategoryTitle(forItems:)(Swift::OpaquePointer forItems)
{
  if ((unint64_t)forItems._rawValue >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1B5BCA170();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    id v1 = 0;
    uint64_t v2 = (void *)0xE000000000000000;
    goto LABEL_6;
  }
  if (!*(void *)(((unint64_t)forItems._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_5;
  }
LABEL_3:
  id v1 = sub_1B5B72B30();
LABEL_6:
  result._object = v2;
  result._countAndFlagsBits = (uint64_t)v1;
  return result;
}

Swift::String_optional __swiftcall SGReminderSuggestion.suggestionCategorySubtitle(forItems:)(Swift::OpaquePointer forItems)
{
  OUTLINED_FUNCTION_6_8();
  OUTLINED_FUNCTION_19_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
  *(_OWORD *)(OUTLINED_FUNCTION_16_0() + 16) = xmmword_1B5BCD260;
  if ((unint64_t)forItems._rawValue >> 62)
  {
    OUTLINED_FUNCTION_15();
    sub_1B5BCA170();
    swift_bridgeObjectRelease();
  }
  uint64_t v2 = OUTLINED_FUNCTION_8(MEMORY[0x1E4FBB550]);
  id v4 = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v2;
  id v6 = v4;
  result.value._object = v6;
  result.value._countAndFlagsBits = v5;
  return result;
}

Swift::String __swiftcall SGReminderSuggestion.suggestionCategoryLocalizedCount(ofItems:)(Swift::OpaquePointer ofItems)
{
  OUTLINED_FUNCTION_6_8();
  OUTLINED_FUNCTION_19_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D95190);
  *(_OWORD *)(OUTLINED_FUNCTION_16_0() + 16) = xmmword_1B5BCD260;
  if ((unint64_t)ofItems._rawValue >> 62)
  {
    OUTLINED_FUNCTION_15();
    sub_1B5BCA170();
    swift_bridgeObjectRelease();
  }
  uint64_t v2 = OUTLINED_FUNCTION_8(MEMORY[0x1E4FBB550]);
  id v4 = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v2;
  id v6 = v4;
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

id sub_1B5BB8D08(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D942B0);
  uint64_t v6 = sub_1B5BC9FE0();
  id v7 = a1;
  a4(v6);

  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  return v8;
}

void SGReminderSuggestion.realtimeSuggestion()()
{
  OUTLINED_FUNCTION_72();
  id v1 = (void *)(*(uint64_t (**)(void))(v0 + 144))();
  id v2 = getReminderSuggestion(v1);

  if (!v2) {
    __break(1u);
  }
}

id sub_1B5BB8E80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)sub_1B5BC9F00();
  swift_bridgeObjectRelease();
  if (a3)
  {
    type metadata accessor for Key(0);
    sub_1B5B74E98(&qword_1E9D93D78);
    uint64_t v6 = (void *)sub_1B5BC9EB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(v3, sel_initWithString_attributes_, v5, v6);

  return v7;
}

uint64_t sub_1B5BB8F44()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1B5BB8F7C()
{
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F95D78]), sel_initWithDelegate_, *(void *)(v0 + 16));
  objc_msgSend(v3, sel_setModalPresentationStyle_, 3);
  OUTLINED_FUNCTION_72();
  id v2 = (void *)(*(uint64_t (**)(void))(v1 + 120))();
  if (v2)
  {
    objc_msgSend(v2, sel_presentViewController_, v3);
    swift_unknownObjectRelease();
  }
}

uint64_t sub_1B5BB9038()
{
  uint64_t v1 = *(void **)(v0 + 16);
  id v2 = objc_msgSend(self, sel_serviceForReminders);
  OUTLINED_FUNCTION_4_6();
  id v4 = (void *)(*(uint64_t (**)(void))(v3 + 144))();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v1;
  v11[4] = sub_1B5BB91D4;
  v11[5] = v5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1107296256;
  v11[2] = sub_1B5B8CB28;
  v11[3] = &block_descriptor_5;
  uint64_t v6 = _Block_copy(v11);
  id v7 = v1;
  swift_release();
  objc_msgSend(v2, sel_rejectRealtimeReminder_withCompletion_, v4, v6);
  _Block_release(v6);

  OUTLINED_FUNCTION_4_6();
  BOOL v9 = (void *)(*(uint64_t (**)(void))(v8 + 120))();
  if (v9)
  {
    objc_msgSend(v9, sel_suggestion_actionFinished_, v7, 1);
    swift_unknownObjectRelease();
  }
  return swift_unknownObjectRelease();
}

void sub_1B5BB91D4(uint64_t a1)
{
  if (!a1) {
    goto LABEL_4;
  }
  id v16 = *(id *)(v1 + 16);
  id v2 = sub_1B5BC9210();
  os_log_type_t v3 = sub_1B5BCA050();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v6 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v16) + 0x90);
    id v7 = (void *)v6();
    id v8 = objc_msgSend(v7, sel_loggingIdentifier);

    uint64_t v9 = sub_1B5BC9F40();
    unint64_t v11 = v10;

    sub_1B5B7AAF8(v9, v11, &v17);
    sub_1B5BCA0C0();
    swift_bridgeObjectRelease();

    *(_WORD *)(v4 + 12) = 2112;
    uint64_t v12 = (void *)v6();
    id v13 = objc_msgSend(v12, sel_recordId);

    sub_1B5BCA0C0();
    *uint64_t v5 = v13;

    _os_log_impl(&dword_1B5B6C000, v2, v3, "SGReminderSuggestionBase: Unable to reject SGReminder %s with recordId: %@", (uint8_t *)v4, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9D94470);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();

LABEL_4:
    OUTLINED_FUNCTION_6_5();
    return;
  }

  OUTLINED_FUNCTION_6_5();
}

id sub_1B5BB9484()
{
  type metadata accessor for SGBannerContent();
  id v0 = SGBannerContent.__allocating_init()();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_8_6();
  v1();
  OUTLINED_FUNCTION_0_5();
  uint64_t v2 = OUTLINED_FUNCTION_4_7();
  v3(v2);
  sub_1B5B7447C(0, &qword_1E9D94BD8);
  sub_1B5B73374();
  OUTLINED_FUNCTION_0_5();
  (*(void (**)(void))(v4 + 352))();
  sub_1B5B7447C(0, &qword_1EB840B10);
  OUTLINED_FUNCTION_7_8();
  id result = sub_1B5B753E8();
  if (result)
  {
    uint64_t v6 = result;
    id v7 = objc_msgSend(self, sel_redColor);
    id v8 = objc_msgSend(v6, sel_imageWithTintColor_, v7);

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB8419C0);
    uint64_t v9 = (__n128 *)swift_allocObject();
    OUTLINED_FUNCTION_9_7(v9, (__n128)xmmword_1B5BCC240);
    OUTLINED_FUNCTION_0_5();
    unint64_t v11 = *(void (**)(uint64_t))(v10 + 400);
    id v12 = v8;
    uint64_t v13 = OUTLINED_FUNCTION_6_9();
    v11(v13);
    OUTLINED_FUNCTION_0_5();
    uint64_t v14 = OUTLINED_FUNCTION_5_7();
    v15(v14);
    OUTLINED_FUNCTION_0_5();
    uint64_t v16 = OUTLINED_FUNCTION_3_5();
    v17(v16);

    return v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1B5BB968C()
{
  uint64_t v0 = sub_1B5BC9230();
  uint64_t v35 = *(void *)(v0 - 8);
  uint64_t v36 = v0;
  MEMORY[0x1F4188790](v0);
  uint64_t v2 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SGBannerContent();
  id v3 = SGBannerContent.__allocating_init()();
  sub_1B5B729C0();
  swift_bridgeObjectRetain();
  sub_1B5B729CC();
  swift_bridgeObjectRetain();
  sub_1B5BC9220();
  OUTLINED_FUNCTION_1_6();
  (*(void (**)(unint64_t, unint64_t))(v4 + 280))(0xD000000000000013, 0x80000001B5BD0B70);
  OUTLINED_FUNCTION_1_6();
  uint64_t v5 = OUTLINED_FUNCTION_4_7();
  v6(v5);
  sub_1B5B7447C(0, &qword_1E9D94BD8);
  sub_1B5B73374();
  OUTLINED_FUNCTION_1_6();
  (*(void (**)(void))(v7 + 352))();
  sub_1B5B7447C(0, &qword_1EB840B10);
  OUTLINED_FUNCTION_7_8();
  id result = sub_1B5B753E8();
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = self;
    id v11 = objc_msgSend(v10, sel_redColor);
    id v12 = objc_msgSend(v9, sel_imageWithTintColor_renderingMode_, v11, 1);

    id v13 = v12;
    id result = sub_1B5B753E8();
    if (result)
    {
      uint64_t v14 = result;
      id v15 = objc_msgSend(v10, sel_greenColor);
      id v16 = objc_msgSend(v14, sel_imageWithTintColor_renderingMode_, v15, 1);

      id v17 = objc_allocWithZone(MEMORY[0x1E4F1CA48]);
      id v18 = v16;
      id v19 = objc_msgSend(v17, sel_init);
      objc_msgSend(v19, sel_addObject_, v13);

      objc_msgSend(v19, sel_addObject_, v18);
      OUTLINED_FUNCTION_1_6();
      (*(void (**)(uint64_t, unint64_t))(v20 + 424))(0x2E2E2E646461, 0xE600000000000000);
      OUTLINED_FUNCTION_1_6();
      uint64_t v21 = OUTLINED_FUNCTION_3_5();
      v22(v21);
      uint64_t v37 = 0;
      id v23 = v19;
      sub_1B5BC9FD0();

      uint64_t v24 = v37;
      OUTLINED_FUNCTION_1_6();
      if ((*(uint64_t (**)(void))(v25 + 392))())
      {
        uint64_t v26 = v36;
        if (v24)
        {
          swift_bridgeObjectRetain();
          uint64_t v27 = swift_bridgeObjectRetain();
          unsigned __int8 v28 = sub_1B5BB9F50(v27, v24);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          if ((v28 & 1) == 0)
          {
LABEL_11:
            uint64_t v29 = sub_1B5BC9210();
            os_log_type_t v30 = sub_1B5BCA040();
            if (os_log_type_enabled(v29, v30))
            {
              uint64_t v31 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v31 = 0;
              unsigned __int16 v32 = "Unable to assign image in preview code";
              goto LABEL_13;
            }
            goto LABEL_14;
          }
LABEL_8:
          uint64_t v29 = sub_1B5BC9210();
          os_log_type_t v30 = sub_1B5BCA030();
          if (os_log_type_enabled(v29, v30))
          {
            uint64_t v31 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v31 = 0;
            unsigned __int16 v32 = "Multiple Test Event";
LABEL_13:
            _os_log_impl(&dword_1B5B6C000, v29, v30, v32, v31, 2u);
            MEMORY[0x1BA9A8090](v31, -1, -1);
          }
LABEL_14:
          uint64_t v33 = v35;

          (*(void (**)(char *, uint64_t))(v33 + 8))(v2, v26);
          return v3;
        }
      }
      else
      {
        uint64_t v26 = v36;
        if (!v24) {
          goto LABEL_8;
        }
      }
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_1B5BB9B68()
{
  type metadata accessor for SGBannerContent();
  id v0 = SGBannerContent.__allocating_init()();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_8_6();
  v1();
  OUTLINED_FUNCTION_0_5();
  uint64_t v2 = OUTLINED_FUNCTION_4_7();
  v3(v2);
  sub_1B5B7447C(0, &qword_1E9D94BD8);
  sub_1B5B73374();
  OUTLINED_FUNCTION_0_5();
  (*(void (**)(void))(v4 + 352))();
  sub_1B5B7447C(0, &qword_1EB840B10);
  id result = sub_1B5B753E8();
  if (result)
  {
    uint64_t v6 = result;
    id v7 = objc_msgSend(self, sel_redColor);
    id v8 = objc_msgSend(v6, sel_imageWithTintColor_renderingMode_, v7, 1);

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB8419C0);
    uint64_t v9 = (__n128 *)swift_allocObject();
    OUTLINED_FUNCTION_9_7(v9, (__n128)xmmword_1B5BCC240);
    OUTLINED_FUNCTION_0_5();
    id v11 = *(void (**)(uint64_t))(v10 + 400);
    id v12 = v8;
    uint64_t v13 = OUTLINED_FUNCTION_6_9();
    v11(v13);
    OUTLINED_FUNCTION_0_5();
    (*(void (**)(uint64_t, unint64_t))(v14 + 424))(0x2E64646120202020, 0xEA00000000002E2ELL);
    OUTLINED_FUNCTION_0_5();
    uint64_t v15 = OUTLINED_FUNCTION_3_5();
    v16(v15);

    return v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1B5BB9DA4()
{
  type metadata accessor for SGBannerContent();
  id v0 = SGBannerContent.__allocating_init()();
  sub_1B5B7447C(0, (unint64_t *)&unk_1E9D93CD0);
  id v1 = sub_1B5B73374();
  id v2 = objc_msgSend(v1, sel_length);
  uint64_t v3 = *MEMORY[0x1E4FB06F8];
  id v4 = objc_msgSend(self, sel_boldSystemFontOfSize_, 16.0);
  objc_msgSend(v1, sel_addAttribute_value_range_, v3, v4, 0, v2);

  OUTLINED_FUNCTION_0_5();
  uint64_t v6 = *(void (**)(id))(v5 + 304);
  id v7 = v1;
  v6(v1);
  id v8 = objc_msgSend(v7, sel_string);
  sub_1B5BC9F40();

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_8_6();
  v9();
  OUTLINED_FUNCTION_0_5();
  uint64_t v10 = OUTLINED_FUNCTION_5_7();
  v11(v10);
  OUTLINED_FUNCTION_0_5();
  uint64_t v12 = OUTLINED_FUNCTION_3_5();
  v13(v12);

  return v0;
}

id sub_1B5BB9F50(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)((unint64_t)a1 >> 62);
  if ((unint64_t)a1 >> 62)
  {
LABEL_40:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1B5BCA170();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_1B5BCA170();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v5 != v6) {
    goto LABEL_25;
  }
  if (!v5) {
    goto LABEL_24;
  }
  uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
  if (a1 < 0) {
    uint64_t v7 = a1;
  }
  if (!v4) {
    uint64_t v7 = (a1 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v8 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v9 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v8 = a2;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v9 = v8;
  }
  if (v7 == v9)
  {
LABEL_24:
    char v14 = 1;
    return (id)(v14 & 1);
  }
  if (v5 < 0) {
    goto LABEL_43;
  }
  unint64_t v20 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0) {
LABEL_44:
  }
    id result = (id)MEMORY[0x1BA9A7760](0, a1);
  else {
    id result = *(id *)(a1 + 32);
  }
  id v4 = result;
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v11 = (id)MEMORY[0x1BA9A7760](0, a2);
LABEL_22:
    uint64_t v12 = v11;
    sub_1B5B7447C(0, &qword_1EB840B10);
    char v13 = sub_1B5BCA0A0();

    if (v13)
    {
      if (v5 != 1)
      {
        uint64_t v15 = 5;
        while (1)
        {
          if (v15 - 4 >= v5)
          {
            __break(1u);
            goto LABEL_40;
          }
          if (v20) {
            id v16 = (id)MEMORY[0x1BA9A7760](v15 - 4, a1);
          }
          else {
            id v16 = *(id *)(a1 + 8 * v15);
          }
          id v4 = v16;
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v17 = (id)MEMORY[0x1BA9A7760](v15 - 4, a2);
          }
          else
          {
            if ((unint64_t)(v15 - 4) >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
LABEL_43:
              __break(1u);
              goto LABEL_44;
            }
            id v17 = *(id *)(a2 + 8 * v15);
          }
          id v18 = v17;
          char v14 = sub_1B5BCA0A0();

          if (v14)
          {
            uint64_t v19 = 2 - v5 + v15++;
            if (v19 != 5) {
              continue;
            }
          }
          return (id)(v14 & 1);
        }
      }
      goto LABEL_24;
    }
LABEL_25:
    char v14 = 0;
    return (id)(v14 & 1);
  }
  if (*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v11 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for SGBannerContainerPreviewData()
{
  return &type metadata for SGBannerContainerPreviewData;
}

uint64_t sub_1B5BBA1BC()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_1B5BBA3F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSGMailClientUtilClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreSuggestionsInternalsLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    void v4[2] = 3221225472;
    v4[3] = __CoreSuggestionsInternalsLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E612E3A0;
    uint64_t v6 = 0;
    CoreSuggestionsInternalsLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!CoreSuggestionsInternalsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SGMailClientUtil");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getSGMailClientUtilClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreSuggestionsInternalsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreSuggestionsInternalsLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1B5BBBC10(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1B5BBBF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class __getEKEventViewControllerClass_block_invoke(uint64_t a1)
{
  EventKitUILibrary();
  Class result = objc_getClass("EKEventViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getEKEventViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__44__SGEventSuggestion_suggestionPrimaryAction__block_invoke_28(v3);
  }
  return result;
}

void EventKitUILibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!EventKitUILibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __EventKitUILibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E612E480;
    uint64_t v3 = 0;
    EventKitUILibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (EventKitUILibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __EventKitUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  EventKitUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getEKEventEditViewControllerClass_block_invoke(uint64_t a1)
{
  EventKitUILibrary();
  Class result = objc_getClass("EKEventEditViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getEKEventEditViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (SGEventSuggestion *)abort_report_np();
    return (Class)[(SGEventSuggestion *)v3 suggestionAttributedSubtitle];
  }
  return result;
}

void sub_1B5BBC6D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getFKSaveOrderClass_block_invoke(uint64_t a1)
{
  FinanceKitUILibrary();
  Class result = objc_getClass("FKSaveOrder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFKSaveOrderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__61__SGWalletOrderSuggestionHelpers_saveOrderForURL_completion___block_invoke(v3);
  }
  return result;
}

void FinanceKitUILibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!FinanceKitUILibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __FinanceKitUILibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E612E4C0;
    uint64_t v3 = 0;
    FinanceKitUILibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (FinanceKitUILibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __FinanceKitUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FinanceKitUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1B5BBCC74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFKOrderImportPreviewControllerProviderClass_block_invoke(uint64_t a1)
{
  FinanceKitUILibrary();
  Class result = objc_getClass("FKOrderImportPreviewControllerProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFKOrderImportPreviewControllerProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__74__SGWalletOrderSuggestionHelpers_orderPreviewControllerForURL_completion___block_invoke(v3);
  }
  return result;
}

void sub_1B5BBD158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFKSuggestionsOrderBannerClass_block_invoke(uint64_t a1)
{
  FinanceKitUILibrary();
  Class result = objc_getClass("FKSuggestionsOrderBanner");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getFKSuggestionsOrderBannerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)abort_report_np();
    return (Class)+[SGContactSuggestionHelpers formattedStringForPhone:v5];
  }
  return result;
}

uint64_t currentUIContext()
{
  return _currentContext;
}

uint64_t dispatchInContext(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = _currentContext;
  if (_currentContext == a1)
  {
    uint64_t v3 = *(uint64_t (**)(uint64_t))(a2 + 16);
    return v3(a2);
  }
  else
  {
    _currentContext = a1;
    uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
    _currentContext = v2;
  }
  return result;
}

id suggestionImage(void *a1)
{
  id v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v1 suggestionImage], (uint64_t v2 = objc_claimAutoreleasedReturnValue()) == 0)
    && _currentContext)
  {
    uint64_t v3 = [v1 suggestionCategory];
    uint64_t v2 = [v3 suggestionCategoryImage];
  }
  return v2;
}

id suggestionImageSGView(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [v1 suggestionImageSGView];
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v1 suggestionCategory];
    uint64_t v2 = [v3 suggestionCategoryImageSGView];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void runOnMainThread(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F29060];
  block = a1;
  if ([v1 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void runOnMainThreadSync(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    block = v1;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      block[2]();
    }
    else {
      dispatch_sync(MEMORY[0x1E4F14428], block);
    }
    id v1 = block;
  }
}

id getReminderSuggestion(void *a1)
{
  id v1 = a1;
  return v1;
}

id getContactSuggestion(void *a1)
{
  id v1 = a1;
  return v1;
}

id getRealtimeSuggestion(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [v1 realtimeSuggestion];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *SGUserInterfaceIdiomToNSString(unint64_t a1)
{
  if (a1 > 6) {
    return @"Unspecified";
  }
  else {
    return *(&off_1E612E4D8 + a1);
  }
}

void sub_1B5BBDB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPKAddPassesViewControllerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PKAddPassesViewController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKAddPassesViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    PassKitUILibrary();
  }
}

void PassKitUILibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!PassKitUILibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __PassKitUILibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E612E528;
    uint64_t v3 = 0;
    PassKitUILibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (PassKitUILibraryCore_frameworkLibrary)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t __PassKitUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitUILibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1B5BBDDFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKPassViewClass_block_invoke(uint64_t a1)
{
  PassKitUILibrary();
  Class result = objc_getClass("PKPassView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPKPassViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (SGWalletPassViewManager *)abort_report_np();
    return (Class)[(SGWalletPassViewManager *)v3 icon];
  }
  return result;
}

void sub_1B5BBE34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKPassClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!PassKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    void v4[2] = 3221225472;
    v4[3] = __PassKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E612E510;
    uint64_t v6 = 0;
    PassKitLibraryCore_frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!PassKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PKPass");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getPKPassClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PassKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PassKitLibraryCore_frameworkLibrary = result;
  return result;
}

__CFString *timeStringForDate(void *a1)
{
  id v1 = a1;
  long long v2 = [v1 startDate];
  uint64_t v3 = [v1 endDate];
  SEL v4 = &stru_1F0ED27A8;
  long long v5 = &stru_1F0ED27A8;
  if (([v1 isAllDay] & 1) == 0)
  {
    if (v3)
    {
      if (isMultiDayEvent(v1))
      {
        uint64_t v6 = +[SGUIDateFormatting multiDayDateFormatter];
        uint64_t v7 = [v6 stringFromDate:v2];

        uint64_t v8 = NSString;
        uint64_t v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
        uint64_t v10 = [v9 localizedStringForKey:@"SuggestionsBannerMultiEventsTimeFormat" value:&stru_1F0ED27A8 table:0];
        objc_msgSend(v8, "localizedStringWithFormat:", v10, v7);
        long long v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v11 = +[SGUIDateFormatting singleDayTimeFormatter];
        uint64_t v7 = [v11 stringFromDate:v2];

        uint64_t v12 = +[SGUIDateFormatting singleDayTimeFormatter];
        uint64_t v9 = [v12 stringFromDate:v3];

        char v13 = NSString;
        uint64_t v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
        char v14 = [v10 localizedStringForKey:@"SuggestionsBannerSingleEventTimeFormat%1$@%2$@" value:&stru_1F0ED27A8 table:0];
        objc_msgSend(v13, "localizedStringWithFormat:", v14, v7, v9);
        long long v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v7 = +[SGUIDateFormatting fullDayTimeFormatter];
      long long v5 = [v7 stringFromDate:v2];
    }

    if (v5) {
      uint64_t v15 = v5;
    }
    else {
      uint64_t v15 = &stru_1F0ED27A8;
    }
    SEL v4 = v15;
  }

  return v4;
}

BOOL isMultiDayEvent(void *a1)
{
  id v1 = a1;
  long long v2 = [v1 endDate];
  uint64_t v3 = [v1 startDate];

  [v2 timeIntervalSinceDate:v3];
  BOOL v5 = v4 >= 86400.0;

  return v5;
}

__CFString *dateStringForDate(void *a1)
{
  id v1 = a1;
  long long v2 = [v1 startDate];
  uint64_t v3 = [v1 endDate];
  if ([v1 isAllDay])
  {
    double v4 = +[SGUIDateFormatting allDayFormatter];
    BOOL v5 = v4;
LABEL_8:
    uint64_t v15 = [v4 stringFromDate:v2];
    uint64_t v6 = (void *)v15;
    id v16 = &stru_1F0ED27A8;
    if (v15) {
      id v16 = (__CFString *)v15;
    }
    char v14 = v16;
    goto LABEL_11;
  }
  if (!isMultiDayEvent(v1))
  {
    BOOL v5 = +[SGUIDateFormatting allDayFormatter];
    [v5 setDoesRelativeDateFormatting:1];
    double v4 = v5;
    goto LABEL_8;
  }
  BOOL v5 = +[SGUIDateFormatting singleDayDateFormatter];
  uint64_t v6 = [v5 stringFromDate:v2];
  uint64_t v7 = [v5 stringFromDate:v3];
  uint64_t v8 = NSString;
  uint64_t v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreSuggestionsUI"];
  uint64_t v10 = [v9 localizedStringForKey:@"SuggestionsBannerSingleEventMultiDayFormat%1$@%2$@" value:&stru_1F0ED27A8 table:0];
  uint64_t v11 = objc_msgSend(v8, "localizedStringWithFormat:", v10, v6, v7);
  uint64_t v12 = (void *)v11;
  char v13 = &stru_1F0ED27A8;
  if (v11) {
    char v13 = (__CFString *)v11;
  }
  char v14 = v13;

LABEL_11:
  return v14;
}

uint64_t SGSuggestionEventTrailingComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = getRealtimeSuggestion(a2);
  uint64_t v6 = getRealtimeSuggestion(v4);

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v7 = v6;
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    if (v5 && v7)
    {
      uint64_t v10 = [v5 event];
      uint64_t v11 = [v10 start];

      uint64_t v12 = [v8 event];
      char v13 = [v12 start];

      uint64_t v9 = [v11 compare:v13];
    }
  }
  else
  {
    char v14 = sgEventsLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_fault_impl(&dword_1B5B6C000, v14, OS_LOG_TYPE_FAULT, "Unsupported SGRealtimeEvent Class found. Returning...", v16, 2u);
    }

    uint64_t v9 = 0;
  }

  return v9;
}

void sub_1B5BC2DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5BC3114(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id serialQueue()
{
  if (serialQueue__pasOnceToken2[0] != -1) {
    dispatch_once(serialQueue__pasOnceToken2, &__block_literal_global_732);
  }
  uint64_t v0 = (void *)serialQueue__pasExprOnceResult;
  return v0;
}

void __serialQueue_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1BA9A7A20]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.suggestions.CoreSuggestionsUI" qosClass:25];
  long long v2 = (void *)serialQueue__pasExprOnceResult;
  serialQueue__pasExprOnceResult = v1;
}

void sub_1B5BC60A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getEKICSPreviewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!EventKitUILibraryCore_frameworkLibrary_958)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    void v4[2] = 3221225472;
    v4[3] = __EventKitUILibraryCore_block_invoke_959;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E612E860;
    uint64_t v6 = 0;
    EventKitUILibraryCore_frameworkLibrary_958 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!EventKitUILibraryCore_frameworkLibrary_958)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("EKICSPreviewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getEKICSPreviewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __EventKitUILibraryCore_block_invoke_959()
{
  uint64_t result = _sl_dlopen();
  EventKitUILibraryCore_frameworkLibrary_958 = result;
  return result;
}

void sub_1B5BC86E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1008(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4sub_1B5B8C22C("SGContactSuggestion: Contact delegate for ignoring suggested contact", 0) = 0;
  return result;
}

void __Block_byref_object_dispose__1009(uint64_t a1)
{
}

uint64_t sub_1B5BC9030()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1B5BC9040()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1B5BC9050()
{
  return MEMORY[0x1F40E38D0]();
}

uint64_t sub_1B5BC9060()
{
  return MEMORY[0x1F40E38E8]();
}

uint64_t sub_1B5BC9070()
{
  return MEMORY[0x1F40E3A58]();
}

uint64_t sub_1B5BC9080()
{
  return MEMORY[0x1F40E3EA0]();
}

uint64_t sub_1B5BC9090()
{
  return MEMORY[0x1F40E3EB0]();
}

uint64_t sub_1B5BC90B0()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1B5BC90C0()
{
  return MEMORY[0x1F40E4090]();
}

uint64_t sub_1B5BC90D0()
{
  return MEMORY[0x1F40E40A0]();
}

uint64_t sub_1B5BC90E0()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1B5BC90F0()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1B5BC9100()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1B5BC9110()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1B5BC9120()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1B5BC9130()
{
  return MEMORY[0x1F40E4B30]();
}

uint64_t sub_1B5BC9140()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1B5BC9150()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1B5BC9160()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1B5BC9170()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1B5BC9180()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1B5BC9190()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1B5BC91A0()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1B5BC91B0()
{
  return MEMORY[0x1F40E58A8]();
}

uint64_t sub_1B5BC91C0()
{
  return MEMORY[0x1F40E58B0]();
}

uint64_t sub_1B5BC91D0()
{
  return MEMORY[0x1F40E5A40]();
}

uint64_t sub_1B5BC91E0()
{
  return MEMORY[0x1F40E5AB8]();
}

uint64_t sub_1B5BC91F0()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_1B5BC9200()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1B5BC9210()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1B5BC9220()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1B5BC9230()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1B5BC9240()
{
  return MEMORY[0x1F4165798]();
}

uint64_t sub_1B5BC9250()
{
  return MEMORY[0x1F4165B28]();
}

uint64_t sub_1B5BC9260()
{
  return MEMORY[0x1F4166440]();
}

uint64_t sub_1B5BC9270()
{
  return MEMORY[0x1F4166448]();
}

uint64_t sub_1B5BC9280()
{
  return MEMORY[0x1F4166450]();
}

uint64_t sub_1B5BC9290()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1B5BC92A0()
{
  return MEMORY[0x1F40D6AB0]();
}

uint64_t sub_1B5BC92B0()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1B5BC92C0()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1B5BC92D0()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_1B5BC92E0()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_1B5BC92F0()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1B5BC9300()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1B5BC9310()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_1B5BC9320()
{
  return MEMORY[0x1F40F7E80]();
}

uint64_t sub_1B5BC9330()
{
  return MEMORY[0x1F40F8030]();
}

uint64_t sub_1B5BC9340()
{
  return MEMORY[0x1F40F8050]();
}

uint64_t sub_1B5BC9350()
{
  return MEMORY[0x1F40F8068]();
}

uint64_t sub_1B5BC9360()
{
  return MEMORY[0x1F40F80A0]();
}

uint64_t sub_1B5BC9370()
{
  return MEMORY[0x1F40F8118]();
}

uint64_t sub_1B5BC9380()
{
  return MEMORY[0x1F40F8318]();
}

uint64_t sub_1B5BC9390()
{
  return MEMORY[0x1F40F8350]();
}

uint64_t sub_1B5BC93A0()
{
  return MEMORY[0x1F40F8360]();
}

uint64_t sub_1B5BC93B0()
{
  return MEMORY[0x1F40F8378]();
}

uint64_t sub_1B5BC93C0()
{
  return MEMORY[0x1F40F83E0]();
}

uint64_t sub_1B5BC93D0()
{
  return MEMORY[0x1F40F84B8]();
}

uint64_t sub_1B5BC93E0()
{
  return MEMORY[0x1F40F85C8]();
}

uint64_t sub_1B5BC93F0()
{
  return MEMORY[0x1F40F85D8]();
}

uint64_t sub_1B5BC9400()
{
  return MEMORY[0x1F40F87E0]();
}

uint64_t sub_1B5BC9410()
{
  return MEMORY[0x1F40F87F0]();
}

uint64_t sub_1B5BC9420()
{
  return MEMORY[0x1F40F8930]();
}

uint64_t sub_1B5BC9430()
{
  return MEMORY[0x1F40F8988]();
}

uint64_t sub_1B5BC9440()
{
  return MEMORY[0x1F40F8A28]();
}

uint64_t sub_1B5BC9450()
{
  return MEMORY[0x1F40F8B20]();
}

uint64_t sub_1B5BC9460()
{
  return MEMORY[0x1F40F8B38]();
}

uint64_t sub_1B5BC9470()
{
  return MEMORY[0x1F40F8C00]();
}

uint64_t sub_1B5BC9480()
{
  return MEMORY[0x1F40F8C38]();
}

uint64_t sub_1B5BC94B0()
{
  return MEMORY[0x1F40F8D58]();
}

uint64_t sub_1B5BC94C0()
{
  return MEMORY[0x1F40F8DE8]();
}

uint64_t sub_1B5BC94D0()
{
  return MEMORY[0x1F40F8DF0]();
}

uint64_t sub_1B5BC94E0()
{
  return MEMORY[0x1F40F8EA0]();
}

uint64_t sub_1B5BC94F0()
{
  return MEMORY[0x1F40F8EF0]();
}

uint64_t sub_1B5BC9500()
{
  return MEMORY[0x1F40F8F50]();
}

uint64_t sub_1B5BC9510()
{
  return MEMORY[0x1F40F9100]();
}

uint64_t sub_1B5BC9520()
{
  return MEMORY[0x1F40F9138]();
}

uint64_t sub_1B5BC9530()
{
  return MEMORY[0x1F40F9160]();
}

uint64_t sub_1B5BC9540()
{
  return MEMORY[0x1F40F9188]();
}

uint64_t sub_1B5BC9550()
{
  return MEMORY[0x1F40F91A0]();
}

uint64_t sub_1B5BC9560()
{
  return MEMORY[0x1F40F9208]();
}

uint64_t sub_1B5BC9570()
{
  return MEMORY[0x1F40F9268]();
}

uint64_t sub_1B5BC9580()
{
  return MEMORY[0x1F40F9280]();
}

uint64_t sub_1B5BC9590()
{
  return MEMORY[0x1F40F9298]();
}

uint64_t sub_1B5BC95A0()
{
  return MEMORY[0x1F40F92D0]();
}

uint64_t sub_1B5BC95B0()
{
  return MEMORY[0x1F40F92E8]();
}

uint64_t sub_1B5BC95C0()
{
  return MEMORY[0x1F40F9388]();
}

uint64_t sub_1B5BC95D0()
{
  return MEMORY[0x1F40F9390]();
}

uint64_t sub_1B5BC95E0()
{
  return MEMORY[0x1F40F9550]();
}

uint64_t sub_1B5BC95F0()
{
  return MEMORY[0x1F40F9568]();
}

uint64_t sub_1B5BC9600()
{
  return MEMORY[0x1F40F9660]();
}

uint64_t sub_1B5BC9610()
{
  return MEMORY[0x1F40F9670]();
}

uint64_t sub_1B5BC9620()
{
  return MEMORY[0x1F40F96C8]();
}

uint64_t sub_1B5BC9630()
{
  return MEMORY[0x1F40F96D8]();
}

uint64_t sub_1B5BC9640()
{
  return MEMORY[0x1F40F98A0]();
}

uint64_t sub_1B5BC9650()
{
  return MEMORY[0x1F40F98C0]();
}

uint64_t sub_1B5BC9660()
{
  return MEMORY[0x1F40F9B68]();
}

uint64_t sub_1B5BC9670()
{
  return MEMORY[0x1F40F9C30]();
}

uint64_t sub_1B5BC9680()
{
  return MEMORY[0x1F40F9C58]();
}

uint64_t sub_1B5BC9690()
{
  return MEMORY[0x1F40F9C60]();
}

uint64_t sub_1B5BC96A0()
{
  return MEMORY[0x1F40F9C68]();
}

uint64_t sub_1B5BC96B0()
{
  return MEMORY[0x1F40F9C80]();
}

uint64_t sub_1B5BC96C0()
{
  return MEMORY[0x1F40F9C98]();
}

uint64_t sub_1B5BC96D0()
{
  return MEMORY[0x1F40F9CD8]();
}

uint64_t sub_1B5BC96E0()
{
  return MEMORY[0x1F40F9CE8]();
}

uint64_t sub_1B5BC96F0()
{
  return MEMORY[0x1F40F9D90]();
}

uint64_t sub_1B5BC9700()
{
  return MEMORY[0x1F40F9D98]();
}

uint64_t sub_1B5BC9710()
{
  return MEMORY[0x1F40F9DF0]();
}

uint64_t sub_1B5BC9720()
{
  return MEMORY[0x1F40F9E10]();
}

uint64_t sub_1B5BC9730()
{
  return MEMORY[0x1F40F9E20]();
}

uint64_t sub_1B5BC9740()
{
  return MEMORY[0x1F40F9E28]();
}

uint64_t sub_1B5BC9750()
{
  return MEMORY[0x1F40F9E30]();
}

uint64_t sub_1B5BC9760()
{
  return MEMORY[0x1F40F9E50]();
}

uint64_t sub_1B5BC9770()
{
  return MEMORY[0x1F40F9E60]();
}

uint64_t sub_1B5BC9780()
{
  return MEMORY[0x1F40F9E70]();
}

uint64_t sub_1B5BC97A0()
{
  return MEMORY[0x1F40F9E90]();
}

uint64_t sub_1B5BC97B0()
{
  return MEMORY[0x1F40F9E98]();
}

uint64_t sub_1B5BC97C0()
{
  return MEMORY[0x1F40F9EB0]();
}

uint64_t sub_1B5BC97D0()
{
  return MEMORY[0x1F40F9EC0]();
}

uint64_t sub_1B5BC97E0()
{
  return MEMORY[0x1F40F9ED0]();
}

uint64_t sub_1B5BC97F0()
{
  return MEMORY[0x1F40F9EE0]();
}

uint64_t sub_1B5BC9810()
{
  return MEMORY[0x1F40F9F00]();
}

uint64_t sub_1B5BC9820()
{
  return MEMORY[0x1F40F9F90]();
}

uint64_t sub_1B5BC9830()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_1B5BC9840()
{
  return MEMORY[0x1F40F9FB8]();
}

uint64_t sub_1B5BC9850()
{
  return MEMORY[0x1F40FA190]();
}

uint64_t sub_1B5BC9860()
{
  return MEMORY[0x1F40FA1A8]();
}

uint64_t sub_1B5BC9870()
{
  return MEMORY[0x1F40FA288]();
}

uint64_t sub_1B5BC9880()
{
  return MEMORY[0x1F40FA298]();
}

uint64_t sub_1B5BC9890()
{
  return MEMORY[0x1F40FA2E0]();
}

uint64_t sub_1B5BC98A0()
{
  return MEMORY[0x1F40FA3A0]();
}

uint64_t sub_1B5BC98B0()
{
  return MEMORY[0x1F40FA3A8]();
}

uint64_t sub_1B5BC98C0()
{
  return MEMORY[0x1F40FA3B8]();
}

uint64_t sub_1B5BC98D0()
{
  return MEMORY[0x1F40FAAA8]();
}

uint64_t sub_1B5BC98E0()
{
  return MEMORY[0x1F40FAAC0]();
}

uint64_t sub_1B5BC98F0()
{
  return MEMORY[0x1F40FAB00]();
}

uint64_t sub_1B5BC9900()
{
  return MEMORY[0x1F40FAB08]();
}

uint64_t sub_1B5BC9910()
{
  return MEMORY[0x1F40FAB18]();
}

uint64_t sub_1B5BC9930()
{
  return MEMORY[0x1F40FAB38]();
}

uint64_t sub_1B5BC9940()
{
  return MEMORY[0x1F40FAB48]();
}

uint64_t sub_1B5BC9950()
{
  return MEMORY[0x1F40FAB58]();
}

uint64_t sub_1B5BC9970()
{
  return MEMORY[0x1F40FAB80]();
}

uint64_t sub_1B5BC9980()
{
  return MEMORY[0x1F40FABE8]();
}

uint64_t sub_1B5BC9990()
{
  return MEMORY[0x1F40FAD68]();
}

uint64_t sub_1B5BC99A0()
{
  return MEMORY[0x1F40FADC0]();
}

uint64_t sub_1B5BC99B0()
{
  return MEMORY[0x1F40FADD8]();
}

uint64_t sub_1B5BC99C0()
{
  return MEMORY[0x1F40FADE0]();
}

uint64_t sub_1B5BC99D0()
{
  return MEMORY[0x1F40FADF8]();
}

uint64_t sub_1B5BC99E0()
{
  return MEMORY[0x1F40FAE00]();
}

uint64_t sub_1B5BC99F0()
{
  return MEMORY[0x1F40FAE18]();
}

uint64_t sub_1B5BC9A00()
{
  return MEMORY[0x1F40FAE68]();
}

uint64_t sub_1B5BC9A10()
{
  return MEMORY[0x1F40FAF00]();
}

uint64_t sub_1B5BC9A20()
{
  return MEMORY[0x1F40FAF08]();
}

uint64_t sub_1B5BC9A30()
{
  return MEMORY[0x1F40FAF80]();
}

uint64_t sub_1B5BC9A40()
{
  return MEMORY[0x1F40FAFE0]();
}

uint64_t sub_1B5BC9A50()
{
  return MEMORY[0x1F40FB088]();
}

uint64_t sub_1B5BC9A60()
{
  return MEMORY[0x1F40FB0C8]();
}

uint64_t sub_1B5BC9A70()
{
  return MEMORY[0x1F40FB0F8]();
}

uint64_t sub_1B5BC9A80()
{
  return MEMORY[0x1F40FB120]();
}

uint64_t sub_1B5BC9A90()
{
  return MEMORY[0x1F40FB130]();
}

uint64_t sub_1B5BC9AA0()
{
  return MEMORY[0x1F40FB198]();
}

uint64_t sub_1B5BC9AB0()
{
  return MEMORY[0x1F40FB1A0]();
}

uint64_t sub_1B5BC9AC0()
{
  return MEMORY[0x1F40FB1E0]();
}

uint64_t sub_1B5BC9AD0()
{
  return MEMORY[0x1F40FB1F0]();
}

uint64_t sub_1B5BC9AE0()
{
  return MEMORY[0x1F40FB390]();
}

uint64_t sub_1B5BC9AF0()
{
  return MEMORY[0x1F40FB3B0]();
}

uint64_t sub_1B5BC9B00()
{
  return MEMORY[0x1F40FB3C0]();
}

uint64_t sub_1B5BC9B10()
{
  return MEMORY[0x1F40FB460]();
}

uint64_t sub_1B5BC9B20()
{
  return MEMORY[0x1F40FB568]();
}

uint64_t sub_1B5BC9B30()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_1B5BC9B40()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_1B5BC9B50()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_1B5BC9B60()
{
  return MEMORY[0x1F40FB6C8]();
}

uint64_t sub_1B5BC9B70()
{
  return MEMORY[0x1F40FB850]();
}

uint64_t sub_1B5BC9B80()
{
  return MEMORY[0x1F40FB880]();
}

uint64_t sub_1B5BC9B90()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_1B5BC9BA0()
{
  return MEMORY[0x1F40FBAA8]();
}

uint64_t sub_1B5BC9BB0()
{
  return MEMORY[0x1F40FBCB8]();
}

uint64_t sub_1B5BC9BC0()
{
  return MEMORY[0x1F40FBDF8]();
}

uint64_t sub_1B5BC9BD0()
{
  return MEMORY[0x1F40FBE70]();
}

uint64_t sub_1B5BC9BE0()
{
  return MEMORY[0x1F40FC018]();
}

uint64_t sub_1B5BC9BF0()
{
  return MEMORY[0x1F40FC108]();
}

uint64_t sub_1B5BC9C00()
{
  return MEMORY[0x1F40FC140]();
}

uint64_t sub_1B5BC9C10()
{
  return MEMORY[0x1F40FC208]();
}

uint64_t sub_1B5BC9C20()
{
  return MEMORY[0x1F40FC240]();
}

uint64_t sub_1B5BC9C30()
{
  return MEMORY[0x1F40FC2E0]();
}

uint64_t sub_1B5BC9C40()
{
  return MEMORY[0x1F40FC380]();
}

uint64_t sub_1B5BC9C50()
{
  return MEMORY[0x1F40FC3B8]();
}

uint64_t sub_1B5BC9C60()
{
  return MEMORY[0x1F40FC3D0]();
}

uint64_t sub_1B5BC9C70()
{
  return MEMORY[0x1F40FC3E8]();
}

uint64_t sub_1B5BC9C80()
{
  return MEMORY[0x1F40FC450]();
}

uint64_t sub_1B5BC9C90()
{
  return MEMORY[0x1F40FC498]();
}

uint64_t sub_1B5BC9CA0()
{
  return MEMORY[0x1F40FC4E8]();
}

uint64_t sub_1B5BC9CB0()
{
  return MEMORY[0x1F40FC518]();
}

uint64_t sub_1B5BC9CC0()
{
  return MEMORY[0x1F40FC520]();
}

uint64_t sub_1B5BC9CD0()
{
  return MEMORY[0x1F40FC530]();
}

uint64_t sub_1B5BC9CE0()
{
  return MEMORY[0x1F40FC550]();
}

uint64_t sub_1B5BC9CF0()
{
  return MEMORY[0x1F40FC568]();
}

uint64_t sub_1B5BC9D00()
{
  return MEMORY[0x1F40FC5A8]();
}

uint64_t sub_1B5BC9D10()
{
  return MEMORY[0x1F40FC5D0]();
}

uint64_t sub_1B5BC9D20()
{
  return MEMORY[0x1F40FC5E8]();
}

uint64_t sub_1B5BC9D30()
{
  return MEMORY[0x1F40FC6F0]();
}

uint64_t sub_1B5BC9D40()
{
  return MEMORY[0x1F40FC700]();
}

uint64_t sub_1B5BC9D50()
{
  return MEMORY[0x1F40FC708]();
}

uint64_t sub_1B5BC9D60()
{
  return MEMORY[0x1F40FC718]();
}

uint64_t sub_1B5BC9D70()
{
  return MEMORY[0x1F40FC760]();
}

uint64_t sub_1B5BC9D80()
{
  return MEMORY[0x1F40FC7C8]();
}

uint64_t sub_1B5BC9D90()
{
  return MEMORY[0x1F40FC7D0]();
}

uint64_t sub_1B5BC9DA0()
{
  return MEMORY[0x1F40FC8B8]();
}

uint64_t sub_1B5BC9DB0()
{
  return MEMORY[0x1F40FC8C8]();
}

uint64_t sub_1B5BC9DC0()
{
  return MEMORY[0x1F40FC8F8]();
}

uint64_t sub_1B5BC9DD0()
{
  return MEMORY[0x1F40FC910]();
}

uint64_t sub_1B5BC9DE0()
{
  return MEMORY[0x1F40FC920]();
}

uint64_t sub_1B5BC9DF0()
{
  return MEMORY[0x1F40FC940]();
}

uint64_t sub_1B5BC9E00()
{
  return MEMORY[0x1F40FC980]();
}

uint64_t sub_1B5BC9E10()
{
  return MEMORY[0x1F40FC998]();
}

uint64_t sub_1B5BC9E20()
{
  return MEMORY[0x1F40FC9A0]();
}

uint64_t sub_1B5BC9E30()
{
  return MEMORY[0x1F40FC9B8]();
}

uint64_t sub_1B5BC9E40()
{
  return MEMORY[0x1F40FCA20]();
}

uint64_t sub_1B5BC9E50()
{
  return MEMORY[0x1F40FCB90]();
}

uint64_t sub_1B5BC9E60()
{
  return MEMORY[0x1F40FCBD8]();
}

uint64_t sub_1B5BC9E70()
{
  return MEMORY[0x1F40FCBE8]();
}

uint64_t sub_1B5BC9E80()
{
  return MEMORY[0x1F40FCC30]();
}

uint64_t sub_1B5BC9E90()
{
  return MEMORY[0x1F40FCC40]();
}

uint64_t sub_1B5BC9EA0()
{
  return MEMORY[0x1F40FCD48]();
}

uint64_t sub_1B5BC9EB0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1B5BC9EC0()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1B5BC9ED0()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1B5BC9EE0()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1B5BC9EF0()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1B5BC9F00()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1B5BC9F10()
{
  return MEMORY[0x1F40E61A0]();
}

uint64_t sub_1B5BC9F20()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1B5BC9F30()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1B5BC9F40()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1B5BC9F50()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1B5BC9F60()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1B5BC9F70()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1B5BC9F80()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1B5BC9F90()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1B5BC9FA0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1B5BC9FB0()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1B5BC9FC0()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1B5BC9FD0()
{
  return MEMORY[0x1F40E6360]();
}

uint64_t sub_1B5BC9FE0()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1B5BC9FF0()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1B5BCA000()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1B5BCA010()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1B5BCA020()
{
  return MEMORY[0x1F4166488]();
}

uint64_t sub_1B5BCA030()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1B5BCA040()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1B5BCA050()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1B5BCA060()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1B5BCA070()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1B5BCA080()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t sub_1B5BCA090()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t sub_1B5BCA0A0()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1B5BCA0B0()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1B5BCA0C0()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1B5BCA0D0()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1B5BCA0E0()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1B5BCA0F0()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1B5BCA100()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1B5BCA110()
{
  return MEMORY[0x1F4184CE0]();
}

uint64_t sub_1B5BCA120()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1B5BCA130()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1B5BCA140()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1B5BCA150()
{
  return MEMORY[0x1F4184E70]();
}

uint64_t sub_1B5BCA160()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1B5BCA170()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1B5BCA180()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1B5BCA1A0()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1B5BCA1B0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B5BCA1C0()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B5BCA1D0()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1B5BCA1E0()
{
  return MEMORY[0x1F4185EF8]();
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

uint64_t sgEventsLogHandle()
{
  return MEMORY[0x1F4115520]();
}

uint64_t sgLogHandle()
{
  return MEMORY[0x1F4115530]();
}

uint64_t sgRemindersLogHandle()
{
  return MEMORY[0x1F4115560]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}