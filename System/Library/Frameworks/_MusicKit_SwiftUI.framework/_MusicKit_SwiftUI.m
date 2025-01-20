uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(void *)(a2 + 40);
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

uint64_t OUTLINED_FUNCTION_20(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
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

void OUTLINED_FUNCTION_0_2()
{
  v3 = *(void **)(v1 + 184);
  uint64_t v4 = *(void *)(v1 + 192);
  uint64_t v5 = *(void *)(v1 + 200);
  uint64_t v6 = *(void *)(v1 + 208);
  uint64_t v7 = *(void *)(v1 + 216);
  uint64_t v8 = *(void *)(v1 + 224);
  uint64_t v9 = *(void *)(v1 + 232);
  uint64_t v10 = *(void *)(v1 + 240);
  __int16 v15 = *(_WORD *)(v1 + 304);
  uint64_t v14 = *(void *)(v1 + 296);
  long long v12 = *(_OWORD *)(v0 + 248);
  long long v13 = *(_OWORD *)(v1 + 280);
  long long v11 = *(_OWORD *)(v1 + 248);
  sub_2351BB344(v3, v4, v5, v6, v7, v8, v9, v10, v11, *((uint64_t *)&v11 + 1), v12, *((uint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1), v14, v15, SHIBYTE(v15));
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  sub_2351C3AB8((uint64_t)va, a1);
}

void *OUTLINED_FUNCTION_0_4(void *a1)
{
  return memcpy(a1, v1, 0x8AuLL);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return sub_2351CA690();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_2351C9C30();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

void OUTLINED_FUNCTION_16(uint64_t a1@<X8>)
{
  v2[5] = a1;
  *uint64_t v2 = v1;
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  *(unsigned char *)(v1 - 65) = 0;
  return v0;
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1, uint64_t a2, ...)
{
  va_start(va, a2);
  return MEMORY[0x270FA1208](va, v2, a1);
}

void *OUTLINED_FUNCTION_17()
{
  return malloc(0x40uLL);
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1)
{
  return MEMORY[0x270FA1228](v1, a1, v2);
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return v0;
}

void OUTLINED_FUNCTION_9_0(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, void *a6@<X8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  ArtworkImage.init(artwork:width:height:idealAspectRatio:contentMode:backgroundColor:rawCropStyle:rawImageFormat:reusePolicy:externalLoader:)(a1, a2, a3, a4, a5, 0, 1, 2, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return sub_2351CA4C0();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void OUTLINED_FUNCTION_6()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_2351CA400();
}

uint64_t OUTLINED_FUNCTION_6_1@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_6_2@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = v2;
  a2[1] = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_4(uint64_t a1)
{
  *(void *)(v1 + 48) = a1;
  return MEMORY[0x270FA1208](v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return v0 + 8;
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_15_0@<X0>(uint64_t a1@<X8>)
{
  return *(void *)a1;
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

uint64_t OUTLINED_FUNCTION_14(uint64_t result)
{
  *uint64_t v1 = result;
  *(void *)(result + 32) = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return sub_2351CA5E0();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_10_0@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return sub_2351CA710();
}

uint64_t OUTLINED_FUNCTION_21(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_3()
{
  uint64_t v3 = *(void *)(v1 - 112);
  return sub_2351AF55C(v0, v3);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_beginAccess();
}

char *OUTLINED_FUNCTION_3_1@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t OUTLINED_FUNCTION_3_4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return sub_2351CA710();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
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

void sub_2351AD24C(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t EnvironmentValues.artworkLoadingObserver.getter()
{
  sub_2351AD294();
  sub_2351CA020();
  return v1;
}

unint64_t sub_2351AD294()
{
  unint64_t result = qword_2687F40B8;
  if (!qword_2687F40B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F40B8);
  }
  return result;
}

uint64_t sub_2351AD2E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.artworkLoadingObserver.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2351AD30C()
{
  return EnvironmentValues.artworkLoadingObserver.setter();
}

uint64_t EnvironmentValues.artworkLoadingObserver.setter()
{
  return sub_2351CA030();
}

uint64_t (*EnvironmentValues.artworkLoadingObserver.modify(uint64_t a1))(void *a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  *(void *)(a1 + 24) = sub_2351AD294();
  sub_2351CA020();
  return sub_2351AD3D4;
}

uint64_t sub_2351AD3D4(void *a1, char a2)
{
  a1[1] = *a1;
  if ((a2 & 1) == 0) {
    return sub_2351CA030();
  }
  swift_retain();
  sub_2351CA030();

  return swift_release();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2351AD474(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2351AD494(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
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

void type metadata accessor for CGSize(uint64_t a1)
{
}

ValueMetadata *_s15LoadingObserverVMa()
{
  return &_s15LoadingObserverVN;
}

uint64_t sub_2351AD4E0(uint64_t a1, id *a2)
{
  uint64_t result = sub_2351CA460();
  *a2 = 0;
  return result;
}

uint64_t sub_2351AD558(uint64_t a1, id *a2)
{
  char v3 = sub_2351CA470();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2351AD5D8()
{
  sub_2351CA480();
  uint64_t v0 = sub_2351CA450();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2351AD610()
{
  return sub_2351AD6A0(*v0, MEMORY[0x263F07B58]);
}

uint64_t sub_2351AD648@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2351AD5D8();
  *a1 = result;
  return result;
}

uint64_t sub_2351AD670()
{
  return sub_2351AD6A0(*v0, MEMORY[0x263F8D308]);
}

uint64_t sub_2351AD6A0(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_2351CA480();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2351AD6E0()
{
  return sub_2351AD6E8();
}

uint64_t sub_2351AD6E8()
{
  sub_2351CA480();
  sub_2351CA4A0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2351AD73C()
{
  return sub_2351C3B80();
}

uint64_t sub_2351AD744()
{
  return sub_2351C1D3C();
}

uint64_t sub_2351AD750@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2351CA450();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2351AD798@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2351C3BF4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void type metadata accessor for MusicKit_SPI_SKCloudServiceSetupOptionsKey(uint64_t a1)
{
}

void sub_2351AD7D8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_2351AD820(uint64_t a1)
{
  uint64_t v2 = sub_2351AD920((unint64_t *)&qword_2687F40E0);
  uint64_t v3 = sub_2351AD920(&qword_2687F40E8);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2351AD8B8()
{
  return sub_2351AD920(&qword_2687F40C8);
}

uint64_t sub_2351AD8EC()
{
  return sub_2351AD920(&qword_2687F40D0);
}

uint64_t sub_2351AD920(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for MusicKit_SPI_SKCloudServiceSetupOptionsKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2351AD964()
{
  return sub_2351AD920(&qword_2687F40D8);
}

uint64_t static Artwork._LoadingError.== infix(_:_:)()
{
  return 1;
}

uint64_t Artwork._LoadingError.hash(into:)()
{
  return sub_2351CA700();
}

uint64_t Artwork._LoadingError.hashValue.getter()
{
  return sub_2351CA730();
}

uint64_t sub_2351ADA1C()
{
  return 1;
}

uint64_t sub_2351ADA24()
{
  return Artwork._LoadingError.hashValue.getter();
}

uint64_t sub_2351ADA3C()
{
  return Artwork._LoadingError.hash(into:)();
}

uint64_t sub_2351ADA54()
{
  return sub_2351CA730();
}

unint64_t sub_2351ADA98()
{
  unint64_t result = qword_2687F40F0;
  if (!qword_2687F40F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F40F0);
  }
  return result;
}

uint64_t _s13_LoadingErrorOwet(unsigned int *a1, int a2)
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

unsigned char *_s13_LoadingErrorOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2351ADBD4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2351ADBFC()
{
  return 0;
}

ValueMetadata *type metadata accessor for Artwork._LoadingError()
{
  return &type metadata for Artwork._LoadingError;
}

uint64_t sub_2351ADC18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t sub_2351ADC20()
{
  uint64_t result = sub_2351CA300();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2351CA2B0();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_2351ADCF0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      uint64_t v8 = *(void *)(a3 + 16);
      uint64_t v9 = *(int *)(sub_2351CA2B0() + 32);
      uint64_t v10 = (char *)a1 + v9;
      long long v11 = (char *)a2 + v9;
      long long v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
      swift_retain();
      swift_retain();
      v12(v10, v11, v8);
    }
    else
    {
      uint64_t v14 = sub_2351CA2F0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v14 - 8) + 16))(a1, a2, v14);
      uint64_t v15 = sub_2351CA300();
      *(uint64_t *)((char *)a1 + *(int *)(v15 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v15 + 28));
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2351ADE88(uint64_t a1, uint64_t a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_release();
    swift_release();
    uint64_t v4 = *(void *)(a2 + 16);
    uint64_t v5 = a1 + *(int *)(sub_2351CA2B0() + 32);
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v6(v5, v4);
  }
  else
  {
    uint64_t v8 = sub_2351CA2F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
    sub_2351CA300();
    return swift_release();
  }
}

void *sub_2351ADF88(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = *(void *)(a3 + 16);
    uint64_t v8 = *(int *)(sub_2351CA2B0() + 32);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    long long v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    swift_retain();
    swift_retain();
    v11(v9, v10, v7);
  }
  else
  {
    uint64_t v12 = sub_2351CA2F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
    uint64_t v13 = sub_2351CA300();
    *(void *)((char *)a1 + *(int *)(v13 + 28)) = *(void *)((char *)a2 + *(int *)(v13 + 28));
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_2351AE0D0(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    (*(void (**)(void *, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      uint64_t v6 = *(void *)(a3 + 16);
      uint64_t v7 = *(int *)(sub_2351CA2B0() + 32);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16);
      swift_retain();
      swift_retain();
      v10(v8, v9, v6);
    }
    else
    {
      uint64_t v11 = sub_2351CA2F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      uint64_t v12 = sub_2351CA300();
      *(void *)((char *)a1 + *(int *)(v12 + 28)) = *(void *)((char *)a2 + *(int *)(v12 + 28));
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_2351AE258(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = v6;
    uint64_t v7 = *(void *)(a3 + 16);
    uint64_t v8 = sub_2351CA2B0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(&a1[*(int *)(v8 + 32)], &a2[*(int *)(v8 + 32)], v7);
  }
  else
  {
    uint64_t v9 = sub_2351CA2F0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
    uint64_t v10 = sub_2351CA300();
    *(void *)&a1[*(int *)(v10 + 28)] = *(void *)&a2[*(int *)(v10 + 28)];
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *sub_2351AE36C(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    (*(void (**)(char *, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = *((void *)a2 + 1);
      *(void *)a1 = *(void *)a2;
      *((void *)a1 + 1) = v6;
      uint64_t v7 = *(void *)(a3 + 16);
      uint64_t v8 = sub_2351CA2B0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(&a1[*(int *)(v8 + 32)], &a2[*(int *)(v8 + 32)], v7);
    }
    else
    {
      uint64_t v9 = sub_2351CA2F0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
      uint64_t v10 = sub_2351CA300();
      *(void *)&a1[*(int *)(v10 + 28)] = *(void *)&a2[*(int *)(v10 + 28)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2351AE4C4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata accessor for MusicLazyStateOrBinding()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2351AE4EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270EFFE88](a1, a2, a3, a4, a6, a5);
}

uint64_t *sub_2351AE504(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2351CA400();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v10;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    uint64_t v11 = a3[8];
    *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
    uint64_t v12 = (uint64_t *)((char *)a1 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    uint64_t v14 = v13[1];
    *uint64_t v12 = *v13;
    v12[1] = v14;
    uint64_t v15 = a3[9];
    v16 = (uint64_t *)((char *)a1 + v15);
    v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    void *v16 = *v17;
    v16[1] = v18;
    id v19 = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2351AE61C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2351AE6B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v10 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  uint64_t v14 = a3[9];
  uint64_t v15 = (void *)(a1 + v14);
  v16 = (void *)(a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  id v18 = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2351AE778(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  uint64_t v14 = a3[8];
  uint64_t v15 = (void *)(a1 + v14);
  v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[9];
  id v18 = (void *)(a1 + v17);
  id v19 = (void *)(a2 + v17);
  *id v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2351AE880(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  return a1;
}

uint64_t sub_2351AE924(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  uint64_t v10 = a3[8];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[9];
  v16 = (void *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  void *v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2351AE9F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2351AEA08);
}

uint64_t sub_2351AEA08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2351CA400();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_2351AEA94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2351AEAA8);
}

void sub_2351AEAA8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_2351CA400();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
}

uint64_t _s10ParametersVMa()
{
  uint64_t result = qword_26AD832E0;
  if (!qword_26AD832E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2351AEB78()
{
  uint64_t result = sub_2351CA400();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2351AEC34()
{
  return sub_2351AF514(&qword_2687F40F8, (void (*)(uint64_t))_s10ParametersVMa);
}

uint64_t sub_2351AEC7C(uint64_t a1, uint64_t a2)
{
  uint64_t v69 = _s10ParametersVMa();
  MEMORY[0x270FA5388](v69);
  v75 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_2();
  uint64_t v76 = v6;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_2();
  uint64_t v73 = v8;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_2();
  uint64_t v74 = v10;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_2();
  uint64_t v72 = v12;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_2();
  uint64_t v71 = v14;
  OUTLINED_FUNCTION_1();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_2();
  uint64_t v70 = v16;
  OUTLINED_FUNCTION_1();
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v69 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  v23 = (char *)&v69 - v22;
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  v26 = (char *)&v69 - v25;
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  v29 = (char *)&v69 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  v32 = (char *)&v69 - v31;
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  v35 = (char *)&v69 - v34;
  MEMORY[0x270FA5388](v33);
  v37 = (char *)&v69 - v36;
  sub_2351AF55C(a1, (uint64_t)&v69 - v36);
  sub_2351AF55C(a2, (uint64_t)v35);
  char v38 = sub_2351CA3F0();
  uint64_t v39 = (uint64_t)v35;
  uint64_t v40 = a2;
  sub_2351AF5C0(v39);
  sub_2351AF5C0((uint64_t)v37);
  sub_2351AF55C(a1, (uint64_t)v32);
  sub_2351AF55C(a2, (uint64_t)v29);
  if ((v38 & 1) == 0)
  {
    sub_2351AF5C0((uint64_t)v32);
    sub_2351AF5C0((uint64_t)v29);
    sub_2351AF55C(a1, (uint64_t)v26);
    sub_2351AF55C(a2, (uint64_t)v23);
    uint64_t v44 = v73;
    uint64_t v43 = v74;
    uint64_t v45 = v70;
    goto LABEL_15;
  }
  v41 = (int *)v69;
  unsigned int v42 = objc_msgSend(*(id *)&v32[*(int *)(v69 + 20)], sel_isArtworkVisuallyIdenticalToCatalog_, *(void *)&v29[*(int *)(v69 + 20)]);
  sub_2351AF5C0((uint64_t)v32);
  sub_2351AF5C0((uint64_t)v29);
  sub_2351AF55C(a1, (uint64_t)v26);
  sub_2351AF55C(v40, (uint64_t)v23);
  uint64_t v44 = v73;
  uint64_t v43 = v74;
  uint64_t v45 = v70;
  if (!v42)
  {
LABEL_15:
    sub_2351AF5C0((uint64_t)v23);
    sub_2351AF5C0((uint64_t)v26);
    sub_2351AF55C(a1, (uint64_t)v20);
    sub_2351AF55C(v40, v45);
    goto LABEL_16;
  }
  double v46 = *(double *)&v26[v41[6]];
  sub_2351AF5C0((uint64_t)v26);
  double v47 = *(double *)&v23[v41[6]];
  sub_2351AF5C0((uint64_t)v23);
  sub_2351AF55C(a1, (uint64_t)v20);
  sub_2351AF55C(v40, v45);
  if (v46 != v47)
  {
LABEL_16:
    sub_2351AF5C0(v45);
    sub_2351AF5C0((uint64_t)v20);
    uint64_t v50 = v71;
    sub_2351AF55C(a1, v71);
    uint64_t v51 = v72;
    sub_2351AF55C(v40, v72);
    goto LABEL_17;
  }
  double v48 = *(double *)&v20[v41[7]];
  sub_2351AF5C0((uint64_t)v20);
  double v49 = *(double *)(v45 + v41[7]);
  sub_2351AF5C0(v45);
  uint64_t v50 = v71;
  sub_2351AF55C(a1, v71);
  uint64_t v51 = v72;
  sub_2351AF55C(v40, v72);
  if (v48 != v49)
  {
LABEL_17:
    sub_2351AF5C0(v51);
    sub_2351AF5C0(v50);
    sub_2351AF55C(a1, v43);
    sub_2351AF55C(v40, v44);
    uint64_t v54 = v76;
    goto LABEL_18;
  }
  double v52 = *(double *)(v50 + v41[7] + 8);
  sub_2351AF5C0(v50);
  double v53 = *(double *)(v51 + v41[7] + 8);
  sub_2351AF5C0(v51);
  sub_2351AF55C(a1, v43);
  sub_2351AF55C(v40, v44);
  uint64_t v54 = v76;
  if (v52 != v53)
  {
LABEL_18:
    sub_2351AF5C0(v44);
    sub_2351AF5C0(v43);
LABEL_19:
    sub_2351AF55C(a1, v54);
    OUTLINED_FUNCTION_3();
    goto LABEL_20;
  }
  uint64_t v55 = v41[8];
  v56 = (void *)(v43 + v55);
  uint64_t v57 = *(void *)(v43 + v55 + 8);
  v58 = (void *)(v44 + v55);
  uint64_t v59 = v58[1];
  if (!v57)
  {
    swift_bridgeObjectRetain();
    sub_2351AF5C0(v44);
    sub_2351AF5C0(v43);
    if (!v59)
    {
LABEL_28:
      sub_2351AF55C(a1, v54);
      OUTLINED_FUNCTION_3();
      goto LABEL_29;
    }
    goto LABEL_26;
  }
  if (!v59)
  {
    swift_bridgeObjectRetain();
    sub_2351AF5C0(v44);
    sub_2351AF5C0(v43);
LABEL_26:
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  if (*v56 == *v58 && v57 == v59)
  {
    swift_bridgeObjectRetain();
    sub_2351AF5C0(v44);
    sub_2351AF5C0(v43);
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
  char v61 = sub_2351CA690();
  swift_bridgeObjectRetain();
  sub_2351AF5C0(v44);
  sub_2351AF5C0(v43);
  swift_bridgeObjectRelease();
  sub_2351AF55C(a1, v54);
  OUTLINED_FUNCTION_3();
  if ((v61 & 1) == 0)
  {
LABEL_20:
    sub_2351AF5C0(a1);
    sub_2351AF5C0(v54);
LABEL_21:
    LOBYTE(v62) = 0;
    return v62 & 1;
  }
LABEL_29:
  uint64_t v64 = v41[9];
  v65 = (void *)(v54 + v64);
  uint64_t v66 = *(void *)(v54 + v64 + 8);
  v67 = (void *)(a1 + v64);
  uint64_t v62 = v67[1];
  if (!v66)
  {
    swift_bridgeObjectRetain();
    sub_2351AF5C0(a1);
    sub_2351AF5C0(v54);
    if (!v62)
    {
      LOBYTE(v62) = 1;
      return v62 & 1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  if (v62)
  {
    if (*v65 == *v67 && v66 == v62) {
      LOBYTE(v62) = 1;
    }
    else {
      LOBYTE(v62) = sub_2351CA690();
    }
  }
  swift_bridgeObjectRetain();
  sub_2351AF5C0(a1);
  sub_2351AF5C0(v54);
  swift_bridgeObjectRelease();
  return v62 & 1;
}

uint64_t sub_2351AF2A4()
{
  sub_2351CA400();
  sub_2351AF514(&qword_2687F4100, MEMORY[0x263F13CB0]);
  sub_2351CA430();
  unint64_t v1 = (int *)_s10ParametersVMa();
  id v2 = objc_msgSend(*(id *)(v0 + v1[5]), sel_visualIdenticalityIdentifier);
  if (v2)
  {
    objc_msgSend(v2, sel_hash);
    swift_unknownObjectRelease();
    sub_2351CA710();
    sub_2351CA700();
  }
  else
  {
    sub_2351CA710();
  }
  sub_2351CA720();
  sub_2351CA720();
  sub_2351CA720();
  if (*(void *)(v0 + v1[8] + 8))
  {
    sub_2351CA710();
    swift_bridgeObjectRetain();
    sub_2351CA4A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2351CA710();
  }
  if (!*(void *)(v0 + v1[9] + 8)) {
    return sub_2351CA710();
  }
  sub_2351CA710();
  swift_bridgeObjectRetain();
  sub_2351CA4A0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2351AF48C()
{
  return sub_2351CA730();
}

uint64_t sub_2351AF4D8()
{
  return sub_2351CA730();
}

uint64_t sub_2351AF514(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2351AF55C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s10ParametersVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2351AF5C0(uint64_t a1)
{
  uint64_t v2 = _s10ParametersVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2351AF61C()
{
  sub_2351CA390();
  if (v3)
  {
    sub_2351AF7F4();
    if (swift_dynamicCast()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_2351AF834((uint64_t)v2);
    return 0;
  }
}

uint64_t sub_2351AF68C()
{
  sub_2351CA380();
  sub_2351CA350();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_2351CA370();
  sub_2351AF7F4();
  if (swift_dynamicCast())
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    return v1;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    v2[0] = 0;
    v2[1] = 0xE000000000000000;
    sub_2351CA5E0();
    sub_2351CA4C0();
    sub_2351CA360();
    sub_2351CA610();
    sub_2351CA4C0();
    uint64_t result = sub_2351CA650();
    __break(1u);
  }
  return result;
}

unint64_t sub_2351AF7F4()
{
  unint64_t result = qword_26AD835E0;
  if (!qword_26AD835E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AD835E0);
  }
  return result;
}

uint64_t sub_2351AF834(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD83188);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _ArtworkImageReader.init(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
  MEMORY[0x270FA5388]();
  OUTLINED_FUNCTION_1_0();
  type metadata accessor for _ArtworkImageReader();
  uint64_t v7 = type metadata accessor for ArtworkImage._Proxy();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v7);
  uint64_t result = sub_2351AF96C(v3);
  *a3 = a1;
  a3[1] = a2;
  return result;
}

uint64_t type metadata accessor for _ArtworkImageReader()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2351AF96C(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
  MEMORY[0x270FA5388]();
  sub_2351B0DFC(a1, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2351CA240();
  return sub_2351AFE54(a1);
}

uint64_t sub_2351AFA10()
{
  return sub_2351CA250();
}

uint64_t sub_2351AFA4C(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
  MEMORY[0x270FA5388]();
  sub_2351B0DFC(a1, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4110);
  sub_2351CA260();
  return sub_2351AFE54(a1);
}

uint64_t _ArtworkImageReader.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v37 = a2;
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = v5;
  uint64_t v34 = *(void *)(v7 + 64);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v32 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a1 + 16);
  OUTLINED_FUNCTION_0_0();
  uint64_t v36 = v12;
  ((void (*)(void))MEMORY[0x270FA5388])();
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F4108);
  uint64_t v13 = sub_2351C9FB0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v35 = v14;
  uint64_t v15 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v31 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v33 = (char *)&v30 - v17;
  uint64_t v18 = *v2;
  sub_2351AFA10();
  v18(v10);
  sub_2351AFE54((uint64_t)v10);
  uint64_t v19 = v32;
  (*(void (**)(char *, void (**)(char *), uint64_t))(v6 + 16))(v32, v2, a1);
  unint64_t v20 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v21 = swift_allocObject();
  uint64_t v22 = *(void *)(a1 + 24);
  *(void *)(v21 + 16) = v11;
  *(void *)(v21 + 24) = v22;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v21 + v20, v19, a1);
  sub_2351B0130();
  sub_2351B017C();
  v23 = v31;
  sub_2351CA160();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v3, v11);
  unint64_t v24 = sub_2351B0240();
  uint64_t v38 = v22;
  unint64_t v39 = v24;
  swift_getWitnessTable();
  uint64_t v25 = v35;
  v26 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
  uint64_t v27 = v33;
  v26(v33, v23, v13);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v25 + 8);
  v28(v23, v13);
  v26(v37, v27, v13);
  return ((uint64_t (*)(char *, uint64_t))v28)(v27, v13);
}

uint64_t sub_2351AFE54(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2351AFEB4(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2351B0DFC(a1, (uint64_t)v3);
  type metadata accessor for _ArtworkImageReader();
  return sub_2351AFA4C((uint64_t)v3);
}

uint64_t sub_2351AFF68()
{
  uint64_t v1 = (int *)(type metadata accessor for _ArtworkImageReader() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  uint64_t v5 = v0 + v3 + v1[11];
  uint64_t v6 = type metadata accessor for ArtworkImage._Proxy();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6))
  {
    uint64_t v7 = sub_2351CA400();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4110);
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_2351B00A4(uint64_t a1)
{
  type metadata accessor for _ArtworkImageReader();

  return sub_2351AFEB4(a1);
}

unint64_t sub_2351B0130()
{
  unint64_t result = qword_2687F4118;
  if (!qword_2687F4118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F4118);
  }
  return result;
}

unint64_t sub_2351B017C()
{
  unint64_t result = qword_2687F4120;
  if (!qword_2687F4120)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD831D8);
    sub_2351B01F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F4120);
  }
  return result;
}

unint64_t sub_2351B01F0()
{
  unint64_t result = qword_2687F4128;
  if (!qword_2687F4128)
  {
    type metadata accessor for ArtworkImage._Proxy();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F4128);
  }
  return result;
}

unint64_t sub_2351B0240()
{
  unint64_t result = qword_2687F4130[0];
  if (!qword_2687F4130[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F4108);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2687F4130);
  }
  return result;
}

uint64_t sub_2351B0294()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2351B02E0()
{
  return sub_2351CA150();
}

uint64_t sub_2351B0300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

void sub_2351B0308()
{
  sub_2351B0D30();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *sub_2351B03A4(void *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *a1 = v5;
    a1 = (void *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = v5;
    a1[1] = v6;
    uint64_t v7 = *(int *)(a3 + 36);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for ArtworkImage._Proxy();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
      memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      uint64_t v12 = sub_2351CA400();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v8, v9, v12);
      *(_OWORD *)&v8[*(int *)(v10 + 20)] = *(_OWORD *)&v9[*(int *)(v10 + 20)];
      uint64_t v13 = *(int *)(v10 + 24);
      uint64_t v14 = *(void **)&v9[v13];
      *(void *)&v8[v13] = v14;
      id v15 = v14;
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
    }
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4110);
    *(void *)&v8[*(int *)(v16 + 28)] = *(void *)&v9[*(int *)(v16 + 28)];
  }
  swift_retain();
  return a1;
}

uint64_t sub_2351B0518(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = type metadata accessor for ArtworkImage._Proxy();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
  {
    uint64_t v6 = sub_2351CA400();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4110);

  return swift_release();
}

void *sub_2351B05D4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 36);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for ArtworkImage._Proxy();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
    memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    uint64_t v10 = sub_2351CA400();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v6, v7, v10);
    *(_OWORD *)&v6[*(int *)(v8 + 20)] = *(_OWORD *)&v7[*(int *)(v8 + 20)];
    uint64_t v11 = *(int *)(v8 + 24);
    uint64_t v12 = *(void **)&v7[v11];
    *(void *)&v6[v11] = v12;
    id v13 = v12;
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v8);
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4110);
  *(void *)&v6[*(int *)(v14 + 28)] = *(void *)&v7[*(int *)(v14 + 28)];
  swift_retain();
  return a1;
}

void *sub_2351B06FC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for ArtworkImage._Proxy();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    if (!v12)
    {
      uint64_t v20 = sub_2351CA400();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 24))(v8, v9, v20);
      uint64_t v21 = *(int *)(v10 + 20);
      uint64_t v22 = &v8[v21];
      v23 = &v9[v21];
      *(void *)uint64_t v22 = *(void *)v23;
      *((void *)v22 + 1) = *((void *)v23 + 1);
      uint64_t v24 = *(int *)(v10 + 24);
      uint64_t v25 = *(void **)&v8[v24];
      v26 = *(void **)&v9[v24];
      *(void *)&v8[v24] = v26;
      id v27 = v26;

      goto LABEL_7;
    }
    sub_2351B08D8((uint64_t)v8);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
    memcpy(v8, v9, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v13 = sub_2351CA400();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v8, v9, v13);
  *(_OWORD *)&v8[*(int *)(v10 + 20)] = *(_OWORD *)&v9[*(int *)(v10 + 20)];
  uint64_t v14 = *(int *)(v10 + 24);
  id v15 = *(void **)&v9[v14];
  *(void *)&v8[v14] = v15;
  id v16 = v15;
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4110);
  *(void *)&v8[*(int *)(v18 + 28)] = *(void *)&v9[*(int *)(v18 + 28)];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2351B08D8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ArtworkImage._Proxy();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_2351B0934(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 36);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = type metadata accessor for ArtworkImage._Proxy();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = sub_2351CA400();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v5, v6, v9);
    *(_OWORD *)&v5[*(int *)(v7 + 20)] = *(_OWORD *)&v6[*(int *)(v7 + 20)];
    *(void *)&v5[*(int *)(v7 + 24)] = *(void *)&v6[*(int *)(v7 + 24)];
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4110);
  *(void *)&v5[*(int *)(v10 + 28)] = *(void *)&v6[*(int *)(v10 + 28)];
  return a1;
}

_OWORD *sub_2351B0A44(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for ArtworkImage._Proxy();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    if (!v11)
    {
      uint64_t v16 = sub_2351CA400();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 40))(v7, v8, v16);
      *(_OWORD *)&v7[*(int *)(v9 + 20)] = *(_OWORD *)&v8[*(int *)(v9 + 20)];
      uint64_t v17 = *(int *)(v9 + 24);
      uint64_t v18 = *(void **)&v7[v17];
      *(void *)&v7[v17] = *(void *)&v8[v17];

      goto LABEL_7;
    }
    sub_2351B08D8((uint64_t)v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v12 = sub_2351CA400();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v7, v8, v12);
  *(_OWORD *)&v7[*(int *)(v9 + 20)] = *(_OWORD *)&v8[*(int *)(v9 + 20)];
  *(void *)&v7[*(int *)(v9 + 24)] = *(void *)&v8[*(int *)(v9 + 24)];
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
LABEL_7:
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4110);
  *(void *)&v7[*(int *)(v14 + 28)] = *(void *)&v8[*(int *)(v14 + 28)];
  swift_release();
  return a1;
}

uint64_t sub_2351B0BF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2351B0C0C);
}

uint64_t sub_2351B0C0C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4110);
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 36);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_2351B0C98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2351B0CAC);
}

void *sub_2351B0CAC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4110);
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 36);
    return (void *)__swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void sub_2351B0D30()
{
  if (!qword_2687F41B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD831D8);
    unint64_t v0 = sub_2351CA280();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2687F41B8);
    }
  }
}

uint64_t sub_2351B0D8C()
{
  return swift_getWitnessTable();
}

uint64_t sub_2351B0DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ArtworkLoader.__allocating_init(shouldEnforceUsageOnMainThread:)(char a1)
{
  uint64_t v2 = swift_allocObject();
  ArtworkLoader.init(shouldEnforceUsageOnMainThread:)(a1);
  return v2;
}

uint64_t ArtworkLoader.init(shouldEnforceUsageOnMainThread:)(char a1)
{
  *(unsigned char *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = 0;
  *(void *)(v1 + 32) = 0;
  *(unsigned char *)(v1 + 40) = 1;
  *(void *)(v1 + 48) = 0;
  uint64_t v3 = v1 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastParameters;
  uint64_t v4 = _s10ParametersVMa();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v4);
  uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastLoadingStatusHandler);
  *uint64_t v5 = 0;
  v5[1] = 0;
  *(void *)(v1 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_cachedCloudArtworkCatalog) = 0;
  sub_2351C9E50();
  *(unsigned char *)(v1 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_shouldEnforceUsageOnMainThread) = a1;
  return v1;
}

uint64_t sub_2351B0F44()
{
  return swift_release();
}

uint64_t ArtworkLoader.deinit()
{
  unsigned __int8 v4 = 3;
  sub_2351B35AC(&v4, 0, 1);

  sub_2351B490C(v0 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastParameters, &qword_26AD83328);
  sub_2351B3CF4(*(void *)(v0 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastLoadingStatusHandler));

  uint64_t v1 = v0 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader___observationRegistrar;
  sub_2351C9E60();
  OUTLINED_FUNCTION_2_0();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  return v0;
}

uint64_t ArtworkLoader.__deallocating_deinit()
{
  ArtworkLoader.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t (*sub_2351B10CC())()
{
  return j__swift_endAccess;
}

uint64_t sub_2351B1114@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2351B11C4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2351B1144@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2351B11C4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2351B1174()
{
  return sub_2351B0F44();
}

uint64_t sub_2351B119C()
{
  return sub_2351B0F44();
}

uint64_t sub_2351B11C4()
{
  swift_getKeyPath();
  uint64_t v1 = sub_2351B51B0(&qword_26AD83090, (void (*)(uint64_t))type metadata accessor for ArtworkLoader);
  OUTLINED_FUNCTION_11(v1, v2);
  swift_release();
  OUTLINED_FUNCTION_3_0();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_2351B1264(uint64_t a1, char a2)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(a1 + 16) = a2;
  return result;
}

uint64_t sub_2351B12B8()
{
  return sub_2351B1264(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

void (*sub_2351B12D8())(void *a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14((uint64_t)v2);
  swift_getKeyPath();
  OUTLINED_FUNCTION_16(OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader___observationRegistrar);
  uint64_t v3 = sub_2351B51B0(&qword_26AD83090, (void (*)(uint64_t))type metadata accessor for ArtworkLoader);
  OUTLINED_FUNCTION_4(v3);
  swift_release();
  *uint64_t v1 = v0;
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_8(KeyPath);
  swift_release();
  v1[7] = sub_2351B10CC();
  return sub_2351B13B4;
}

void sub_2351B13B4(void *a1)
{
}

uint64_t (*sub_2351B13C0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2351B1404@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_2351B146C();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  return result;
}

uint64_t sub_2351B1438()
{
  return sub_2351B1510();
}

uint64_t sub_2351B146C()
{
  swift_getKeyPath();
  uint64_t v1 = sub_2351B51B0(&qword_26AD83090, (void (*)(uint64_t))type metadata accessor for ArtworkLoader);
  OUTLINED_FUNCTION_11(v1, v2);
  swift_release();
  OUTLINED_FUNCTION_3_0();
  return *(void *)(v0 + 24);
}

uint64_t sub_2351B1510()
{
  return swift_release();
}

uint64_t sub_2351B1598(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result = swift_beginAccess();
  *(void *)(a1 + 24) = a2;
  *(void *)(a1 + 32) = a3;
  *(unsigned char *)(a1 + 40) = a4 & 1;
  return result;
}

void (*sub_2351B1604())(void *a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14((uint64_t)v2);
  swift_getKeyPath();
  OUTLINED_FUNCTION_16(OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader___observationRegistrar);
  uint64_t v3 = sub_2351B51B0(&qword_26AD83090, (void (*)(uint64_t))type metadata accessor for ArtworkLoader);
  OUTLINED_FUNCTION_4(v3);
  swift_release();
  *uint64_t v1 = v0;
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_8(KeyPath);
  swift_release();
  v1[7] = sub_2351B13C0();
  return sub_2351B16E0;
}

void sub_2351B16E0(void *a1)
{
}

void sub_2351B16EC(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 48);
  *(void *)(v1 + 48) = a1;
}

uint64_t (*sub_2351B1734())()
{
  return j_j__swift_endAccess;
}

void *sub_2351B1778@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_2351B17D4();
  *a1 = result;
  return result;
}

void sub_2351B17A4(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_2351B187C(v1);
}

void *sub_2351B17D4()
{
  swift_getKeyPath();
  uint64_t v1 = sub_2351B51B0(&qword_26AD83090, (void (*)(uint64_t))type metadata accessor for ArtworkLoader);
  OUTLINED_FUNCTION_11(v1, v2);
  swift_release();
  OUTLINED_FUNCTION_3_0();
  uint64_t v3 = *(void **)(v0 + 48);
  id v4 = v3;
  return v3;
}

void sub_2351B187C(void *a1)
{
}

void sub_2351B18EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_2351B16EC((uint64_t)a2);
}

void (*sub_2351B1930())(void *a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_14((uint64_t)v2);
  swift_getKeyPath();
  OUTLINED_FUNCTION_16(OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader___observationRegistrar);
  uint64_t v3 = sub_2351B51B0(&qword_26AD83090, (void (*)(uint64_t))type metadata accessor for ArtworkLoader);
  OUTLINED_FUNCTION_4(v3);
  swift_release();
  *uint64_t v1 = v0;
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_8(KeyPath);
  swift_release();
  v1[7] = sub_2351B1734();
  return sub_2351B1A0C;
}

void sub_2351B1A0C(void *a1)
{
}

void sub_2351B1A18(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 56))(*a1, 0);
  *uint64_t v1 = v1[4];
  swift_getKeyPath();
  sub_2351C9E30();
  swift_release();

  free(v1);
}

uint64_t sub_2351B1AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastLoadingStatusHandler);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastLoadingStatusHandler);
  void *v3 = a1;
  v3[1] = a2;
  return sub_2351B3CF4(v4);
}

uint64_t sub_2351B1AC4(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_cachedCloudArtworkCatalog) = a1;
  return MEMORY[0x270F9A758]();
}

void sub_2351B1AD8(uint64_t a1, uint64_t a2, unsigned char *a3, uint64_t a4, uint64_t a5, char *a6, void (*a7)(void *), uint64_t a8, double a9, double a10, double a11, double a12, double a13, uint64_t a14, uint64_t a15)
{
  uint64_t v107 = a8;
  v106 = a7;
  v124 = a6;
  uint64_t v122 = a5;
  uint64_t v118 = a4;
  v116 = a3;
  uint64_t v117 = a2;
  uint64_t v125 = a1;
  uint64_t v119 = __swift_instantiateConcreteTypeFromMangledName(qword_26AD83330);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_9();
  id v121 = v23;
  uint64_t v123 = sub_2351CA400();
  OUTLINED_FUNCTION_0_1();
  uint64_t v120 = v24;
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_9();
  v108 = v26;
  v115 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26AD835D0);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_9();
  uint64_t v110 = v28;
  v29 = (int *)_s10ParametersVMa();
  OUTLINED_FUNCTION_2_0();
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  uint64_t v33 = &v103[-((v32 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v31);
  v113 = &v103[-v34];
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD83328);
  uint64_t v36 = OUTLINED_FUNCTION_18(v35);
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_6();
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_6();
  MEMORY[0x270FA5388](v38);
  OUTLINED_FUNCTION_6();
  uint64_t v40 = MEMORY[0x270FA5388](v39);
  unsigned int v42 = &v103[-v41];
  MEMORY[0x270FA5388](v40);
  uint64_t v44 = &v103[-v43];
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD835C8);
  uint64_t v46 = OUTLINED_FUNCTION_18(v45);
  MEMORY[0x270FA5388](v46);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_6();
  uint64_t v48 = MEMORY[0x270FA5388](v47);
  uint64_t v50 = &v103[-v49];
  MEMORY[0x270FA5388](v48);
  double v52 = &v103[-v51];
  uint64_t v53 = sub_2351C9E00();
  OUTLINED_FUNCTION_0_1();
  uint64_t v55 = v54;
  MEMORY[0x270FA5388](v56);
  OUTLINED_FUNCTION_5();
  int v109 = *v124;
  v124 = v15;
  double v57 = COERCE_DOUBLE(sub_2351B146C());
  if ((v59 & 1) != 0 || (v57 == a12 ? (BOOL v60 = v58 == a13) : (BOOL v60 = 0), !v60)) {
    sub_2351B1510();
  }
  sub_2351C9DF0();
  sub_2351C9DE0();
  double v62 = v61;
  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v16, v53);
  uint64_t v63 = sub_2351AF61C();
  if (v63)
  {
    id v64 = (id)v63;
    uint64_t v65 = (uint64_t)v121;
    uint64_t v66 = *(int **)(v120 + 16);
    v67 = v124;
    uint64_t v50 = v116;
    uint64_t v68 = v122;
    goto LABEL_27;
  }
  uint64_t v69 = (uint64_t)&v124[OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastParameters];
  OUTLINED_FUNCTION_3_0();
  sub_2351B40A8(v69, (uint64_t)v44, &qword_26AD83328);
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v44, 1, (uint64_t)v29);
  uint64_t v71 = (int **)(v120 + 16);
  if (EnumTagSinglePayload)
  {
    sub_2351B490C((uint64_t)v44, &qword_26AD83328);
    uint64_t v68 = v123;
    __swift_storeEnumTagSinglePayload((uint64_t)v52, 1, 1, v123);
    uint64_t v72 = *v71;
  }
  else
  {
    uint64_t v73 = v113;
    sub_2351AF55C((uint64_t)v44, (uint64_t)v113);
    sub_2351B490C((uint64_t)v44, &qword_26AD83328);
    uint64_t v74 = *v71;
    uint64_t v68 = v123;
    ((void (*)(unsigned char *, unsigned char *, uint64_t))*v71)(v52, v73, v123);
    uint64_t v72 = v74;
    sub_2351AF5C0((uint64_t)v73);
    __swift_storeEnumTagSinglePayload((uint64_t)v52, 0, 1, v68);
  }
  uint64_t v65 = v110;
  v75 = v115;
  v115 = v72;
  ((void (*)(unsigned char *, uint64_t, uint64_t))v72)(v50, v125, v68);
  __swift_storeEnumTagSinglePayload((uint64_t)v50, 0, 1, v68);
  uint64_t v76 = v65 + v75[12];
  v67 = (char *)&qword_26AD835C8;
  sub_2351B40A8((uint64_t)v52, v65, &qword_26AD835C8);
  sub_2351B40A8((uint64_t)v50, v76, &qword_26AD835C8);
  OUTLINED_FUNCTION_21(v65);
  if (v60)
  {
    sub_2351B490C((uint64_t)v50, &qword_26AD835C8);
    sub_2351B490C((uint64_t)v52, &qword_26AD835C8);
    OUTLINED_FUNCTION_21(v76);
    if (v60)
    {
      sub_2351B490C(v65, &qword_26AD835C8);
      OUTLINED_FUNCTION_7();
      goto LABEL_23;
    }
LABEL_20:
    sub_2351B490C(v65, &qword_26AD835D0);
    OUTLINED_FUNCTION_7();
LABEL_22:
    sub_2351B1AC4(0);
    goto LABEL_23;
  }
  v67 = v105;
  sub_2351B40A8(v65, (uint64_t)v105, &qword_26AD835C8);
  OUTLINED_FUNCTION_21(v76);
  if (v77)
  {
    sub_2351B490C((uint64_t)v50, &qword_26AD835C8);
    sub_2351B490C((uint64_t)v52, &qword_26AD835C8);
    (*(void (**)(char *, uint64_t))(v120 + 8))(v67, v68);
    goto LABEL_20;
  }
  uint64_t v65 = (uint64_t)v108;
  (*(void (**)(void *, uint64_t, uint64_t))(v120 + 32))(v108, v76, v68);
  sub_2351B51B0(&qword_26AD835C0, MEMORY[0x263F13CB0]);
  int v104 = sub_2351CA440();
  uint64_t v68 = v120 + 8;
  v78 = *(void (**)(uint64_t, uint64_t))(v120 + 8);
  v78(v65, v123);
  v67 = (char *)&qword_26AD835C8;
  sub_2351B490C((uint64_t)v50, &qword_26AD835C8);
  sub_2351B490C((uint64_t)v52, &qword_26AD835C8);
  v78((uint64_t)v105, v123);
  sub_2351B490C(v110, &qword_26AD835C8);
  OUTLINED_FUNCTION_7();
  if ((v104 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_23:
  v79 = *(void **)&v67[OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_cachedCloudArtworkCatalog];
  if (v79)
  {
    id v64 = v79;
  }
  else
  {
    v80 = (void *)sub_2351AF68C();
    id v121 = v80;
    uint64_t v68 = v122;
    sub_2351B1AC4((uint64_t)v80);
    id v64 = v121;
  }
  uint64_t v66 = v115;
LABEL_27:
  v115 = v66;
  ((void (*)(unsigned char *, uint64_t, uint64_t))v66)(v33, v125, v123);
  id v121 = v64;
  *(void *)&v33[v29[5]] = sub_2351C5F08();
  *(double *)&v33[v29[6]] = a9;
  v81 = (double *)&v33[v29[7]];
  double *v81 = a10;
  v81[1] = a11;
  v82 = &v33[v29[8]];
  void *v82 = v117;
  v82[1] = v50;
  v83 = &v33[v29[9]];
  void *v83 = v118;
  v83[1] = v68;
  uint64_t v84 = (uint64_t)&v67[OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastParameters];
  OUTLINED_FUNCTION_3_0();
  sub_2351AF55C((uint64_t)v33, (uint64_t)v42);
  __swift_storeEnumTagSinglePayload((uint64_t)v42, 0, 1, (uint64_t)v29);
  uint64_t v85 = v65 + *(int *)(v119 + 48);
  sub_2351B40A8(v84, v65, &qword_26AD83328);
  sub_2351B40A8((uint64_t)v42, v85, &qword_26AD83328);
  OUTLINED_FUNCTION_20(v65);
  if (v60)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2351B490C((uint64_t)v42, &qword_26AD83328);
    OUTLINED_FUNCTION_20(v85);
    id v86 = v121;
    if (v60)
    {
      sub_2351B490C(v65, &qword_26AD83328);
LABEL_39:
      sub_2351AF5C0((uint64_t)v33);

      return;
    }
    goto LABEL_35;
  }
  uint64_t v87 = v111;
  sub_2351B40A8(v65, v111, &qword_26AD83328);
  OUTLINED_FUNCTION_20(v85);
  if (v88)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2351B490C((uint64_t)v42, &qword_26AD83328);
    sub_2351AF5C0(v87);
LABEL_35:
    sub_2351B490C(v65, qword_26AD83330);
    goto LABEL_36;
  }
  v92 = v113;
  sub_2351B416C(v85, (uint64_t)v113);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v93 = sub_2351AEC7C(v87, (uint64_t)v92);
  sub_2351AF5C0((uint64_t)v92);
  sub_2351B490C((uint64_t)v42, &qword_26AD83328);
  sub_2351AF5C0(v87);
  sub_2351B490C(v65, &qword_26AD83328);
  id v86 = v121;
  if (v93) {
    goto LABEL_39;
  }
LABEL_36:
  uint64_t v89 = v114;
  sub_2351B40A8(v84, v114, &qword_26AD83328);
  if (__swift_getEnumTagSinglePayload(v89, 1, (uint64_t)v29))
  {
    sub_2351B490C(v89, &qword_26AD83328);
    uint64_t v90 = 0;
    uint64_t v91 = 0;
  }
  else
  {
    v94 = v113;
    sub_2351AF55C(v89, (uint64_t)v113);
    sub_2351B490C(v89, &qword_26AD83328);
    v95 = v108;
    uint64_t v96 = v123;
    ((void (*)(void *, unsigned char *, uint64_t))v115)(v108, v94, v123);
    sub_2351AF5C0((uint64_t)v94);
    uint64_t v90 = sub_2351CA3E0();
    uint64_t v91 = v97;
    (*(void (**)(void *, uint64_t))(v120 + 8))(v95, v96);
  }
  uint64_t v98 = sub_2351CA3E0();
  if (v91)
  {
    if (v99)
    {
      if (v90 == v98 && v91 == v99)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v102 = v112;
        goto LABEL_55;
      }
      int v101 = sub_2351CA690();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v102 = v112;
      if ((v101 | v109)) {
        goto LABEL_55;
      }
      goto LABEL_53;
    }
    uint64_t v102 = v112;
  }
  else
  {
    uint64_t v102 = v112;
    if (!v99) {
      goto LABEL_55;
    }
  }
  swift_bridgeObjectRelease();
  if ((v109 & 1) == 0) {
LABEL_53:
  }
    sub_2351B187C(0);
LABEL_55:
  sub_2351AF55C((uint64_t)v33, v102);
  __swift_storeEnumTagSinglePayload(v102, 0, 1, (uint64_t)v29);
  swift_beginAccess();
  sub_2351B4104(v102, v84);
  swift_endAccess();
  sub_2351B3910(v125, a14, a15, a10, a11, v62);
  v126[0] = 0;
  sub_2351B35AC(v126, 2u, 0);
  if (sub_2351CA3B0())
  {
    v126[0] = 2;
    sub_2351B35AC(v126, 2u, 0);
  }
  else
  {
    sub_2351B2694((uint64_t)v33, v106);
  }

  sub_2351AF5C0((uint64_t)v33);
}

uint64_t sub_2351B2694(uint64_t a1, void (*a2)(void *))
{
  uint64_t v5 = (int *)_s10ParametersVMa();
  uint64_t v6 = (double *)(a1 + v5[7]);
  double v7 = *(double *)(a1 + v5[6]);
  double v8 = *v6;
  double v9 = v6[1];
  uint64_t v10 = *(void **)(a1 + v5[5]);
  id v11 = objc_msgSend(v10, sel_token);
  sub_2351CA5C0();
  swift_unknownObjectRelease();
  sub_2351B50FC(0, &qword_26AD83178);
  if (swift_dynamicCast())
  {
    uint64_t v12 = (uint64_t *)(a1 + v5[8]);
    uint64_t v13 = v12[1];
    if (v13)
    {
      uint64_t v14 = *v12;
      id v15 = (uint64_t *)(a1 + v5[9]);
      if (v15[1])
      {
        uint64_t v16 = *v15;
        uint64_t v17 = v15[1];
      }
      else
      {
        uint64_t v16 = sub_2351CA480();
        uint64_t v17 = v18;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2351B4E70(v14, v13, v22);
      swift_bridgeObjectRelease();
      sub_2351B4EC8(v16, v17, v22);
    }
  }
  if (a2)
  {
    v23[3] = sub_2351B50FC(0, (unint64_t *)&qword_26AD835E0);
    v23[0] = v10;
    sub_2351B4E0C((uint64_t)a2);
    id v19 = v10;
    a2(v23);
    sub_2351B3CF4((uint64_t)a2);
    sub_2351B4E1C((uint64_t)v23);
  }
  objc_msgSend(v10, sel_setFittingSize_, v8 / v7, v9 / v7);
  uint64_t v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_2351B2AA0(v2, 1, (uint64_t)sub_2351B4E04, v20);
  return swift_release();
}

void sub_2351B28CC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = _s10ParametersVMa();
  MEMORY[0x270FA5388](v6);
  double v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD83328);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = a3 + 16;
  uint64_t v13 = *a1 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastParameters;
  swift_beginAccess();
  sub_2351B40A8(v13, (uint64_t)v11, &qword_26AD83328);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v6))
  {
    sub_2351B490C((uint64_t)v11, &qword_26AD83328);
    id v14 = 0;
  }
  else
  {
    sub_2351AF55C((uint64_t)v11, (uint64_t)v8);
    sub_2351B490C((uint64_t)v11, &qword_26AD83328);
    id v14 = *(id *)&v8[*(int *)(v6 + 20)];
    sub_2351AF5C0((uint64_t)v8);
  }
  swift_beginAccess();
  id v15 = (void *)MEMORY[0x237DD7370](v12);
  char v16 = sub_2351C6148(v15, v14);

  if (v16)
  {
    id v17 = objc_msgSend(a2, sel_imageRepresentation);
    sub_2351B2BA8(v17);
  }
}

uint64_t sub_2351B2AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(void *)(v9 + 24) = a4;
  v12[4] = sub_2351B4F2C;
  v12[5] = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_2351B4AB0;
  v12[3] = &block_descriptor_0;
  uint64_t v10 = _Block_copy(v12);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_setMainThreadBoundDestination_forRepresentationKinds_configurationBlock_, a1, a2, v10);
  _Block_release(v10);
  return swift_release();
}

void sub_2351B2BA8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD835D8);
  uint64_t v6 = OUTLINED_FUNCTION_18(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_15();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = _s10ParametersVMa();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_5();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD83328);
  uint64_t v13 = OUTLINED_FUNCTION_18(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_15();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = v3 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastParameters;
  OUTLINED_FUNCTION_3_0();
  sub_2351B40A8(v17, v16, &qword_26AD83328);
  if (__swift_getEnumTagSinglePayload(v16, 1, v10))
  {
    sub_2351B490C(v16, &qword_26AD83328);
    id v18 = 0;
    if (a1) {
      goto LABEL_3;
    }
LABEL_6:
    sub_2351B354C(0);
    goto LABEL_8;
  }
  sub_2351AF55C(v16, v2);
  sub_2351B490C(v16, &qword_26AD83328);
  id v18 = *(id *)(v2 + *(int *)(v10 + 20));
  sub_2351AF5C0(v2);
  if (!a1) {
    goto LABEL_6;
  }
LABEL_3:
  id v19 = a1;
  id v20 = sub_2351C61A4();
  if (v20)
  {
    uint64_t v21 = v20;
    id v22 = v20;
    sub_2351B354C(v21);
  }
  else
  {
    uint64_t v23 = sub_2351CA530();
    __swift_storeEnumTagSinglePayload(v9, 1, 1, v23);
    uint64_t v24 = swift_allocObject();
    swift_weakInit();
    sub_2351CA510();
    id v25 = v18;
    swift_retain();
    id v26 = v19;
    uint64_t v27 = sub_2351CA500();
    uint64_t v28 = (void *)swift_allocObject();
    uint64_t v29 = MEMORY[0x263F8F500];
    v28[2] = v27;
    v28[3] = v29;
    v28[4] = v18;
    v28[5] = v24;
    v28[6] = v26;
    swift_release();
    sub_2351B33DC(v9, (uint64_t)&unk_2687F41D0, (uint64_t)v28);
    swift_release();

    id v18 = v25;
  }
LABEL_8:
}

uint64_t sub_2351B2E40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[18] = a5;
  v6[19] = a6;
  v6[17] = a4;
  v6[20] = _s10ParametersVMa();
  v6[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD83328);
  v6[22] = swift_task_alloc();
  v6[23] = swift_task_alloc();
  sub_2351CA510();
  v6[24] = sub_2351CA500();
  uint64_t v8 = sub_2351CA4F0();
  v6[25] = v8;
  v6[26] = v7;
  return MEMORY[0x270FA2498](sub_2351B2F4C, v8, v7);
}

uint64_t sub_2351B2F4C()
{
  OUTLINED_FUNCTION_3_0();
  uint64_t Strong = swift_weakLoadStrong();
  id v2 = (id)Strong;
  if (Strong)
  {
    uint64_t v3 = *(void *)(v0 + 184);
    uint64_t v4 = *(void *)(v0 + 160);
    uint64_t v5 = Strong + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastParameters;
    OUTLINED_FUNCTION_3_0();
    sub_2351B40A8(v5, v3, &qword_26AD83328);
    swift_release();
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v3, 1, v4);
    uint64_t v7 = *(void *)(v0 + 184);
    if (EnumTagSinglePayload)
    {
      sub_2351B490C(*(void *)(v0 + 184), &qword_26AD83328);
      id v2 = 0;
    }
    else
    {
      uint64_t v9 = *(void *)(v0 + 160);
      uint64_t v8 = *(void *)(v0 + 168);
      sub_2351AF55C(*(void *)(v0 + 184), v8);
      sub_2351B490C(v7, &qword_26AD83328);
      id v2 = *(id *)(v8 + *(int *)(v9 + 20));
      sub_2351AF5C0(v8);
    }
  }
  char v10 = sub_2351C6148(v2, *(id *)(v0 + 136));

  if (v10)
  {
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 216) = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_2351B3118;
    return sub_2351C61EC();
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_12();
    return v13();
  }
}

uint64_t sub_2351B3118()
{
  OUTLINED_FUNCTION_19();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_13();
  void *v3 = v2;
  uint64_t v4 = *v0;
  OUTLINED_FUNCTION_13();
  *uint64_t v5 = v4;
  *(void *)(v7 + 224) = v6;
  swift_task_dealloc();
  uint64_t v8 = *(void *)(v1 + 208);
  uint64_t v9 = *(void *)(v1 + 200);
  return MEMORY[0x270FA2498](sub_2351B3234, v9, v8);
}

uint64_t sub_2351B3234()
{
  swift_release();
  OUTLINED_FUNCTION_3_0();
  uint64_t Strong = swift_weakLoadStrong();
  id v2 = (id)Strong;
  if (Strong)
  {
    uint64_t v3 = *(void *)(v0 + 176);
    uint64_t v4 = *(void *)(v0 + 160);
    uint64_t v5 = Strong + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastParameters;
    OUTLINED_FUNCTION_3_0();
    sub_2351B40A8(v5, v3, &qword_26AD83328);
    swift_release();
    int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v3, 1, v4);
    uint64_t v7 = *(void *)(v0 + 176);
    if (EnumTagSinglePayload)
    {
      sub_2351B490C(*(void *)(v0 + 176), &qword_26AD83328);
      id v2 = 0;
    }
    else
    {
      uint64_t v9 = *(void *)(v0 + 160);
      uint64_t v8 = *(void *)(v0 + 168);
      sub_2351AF55C(*(void *)(v0 + 176), v8);
      sub_2351B490C(v7, &qword_26AD83328);
      id v2 = *(id *)(v8 + *(int *)(v9 + 20));
      sub_2351AF5C0(v8);
    }
  }
  char v10 = sub_2351C6148(v2, *(id *)(v0 + 136));

  if (v10)
  {
    OUTLINED_FUNCTION_3_0();
    uint64_t v11 = swift_weakLoadStrong();
    uint64_t v12 = *(void **)(v0 + 224);
    if (v11)
    {
      sub_2351B354C(*(void **)(v0 + 224));
      swift_release();
    }
  }
  else
  {
    uint64_t v12 = *(void **)(v0 + 224);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_12();
  return v13();
}

uint64_t sub_2351B33DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2351CA530();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_2351B490C(a1, &qword_26AD835D8);
  }
  else
  {
    sub_2351CA520();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2351CA4F0();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

void sub_2351B354C(void *a1)
{
  id v2 = a1;
  sub_2351B187C(a1);
  if (a1)
  {
    char v4 = 1;
    uint64_t v3 = &v4;
  }
  else
  {
    char v5 = 2;
    uint64_t v3 = &v5;
  }
  sub_2351B35AC((unsigned __int8 *)v3, 2u, 0);
}

void sub_2351B35AC(unsigned __int8 *a1, unsigned __int8 a2, char a3)
{
  int v7 = a2;
  uint64_t v8 = sub_2351CA310();
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_15();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_2351CA330();
  OUTLINED_FUNCTION_0_1();
  uint64_t v24 = v16;
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_5();
  int v18 = *a1;
  if (v7 == 2)
  {
    if ((*(unsigned char *)(v3 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_shouldEnforceUsageOnMainThread) & 1) == 0) {
      goto LABEL_6;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_6;
  }
  if (!objc_msgSend(self, sel_isMainThread))
  {
    __break(1u);
    return;
  }
LABEL_6:
  id v19 = *(void (**)(void *))(v3
                                        + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastLoadingStatusHandler);
  if (v19)
  {
    uint64_t v20 = *(void *)(v3 + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastLoadingStatusHandler + 8);
    if ((v18 - 1) >= 2)
    {
      swift_retain();
      if ((a3 & 1) == 0) {
        goto LABEL_9;
      }
    }
    else
    {
      swift_retain();
      sub_2351B1AA4(0, 0);
      if ((a3 & 1) == 0)
      {
LABEL_9:
        LOBYTE(aBlock[0]) = v18;
        v19(aBlock);
        sub_2351B3CF4((uint64_t)v19);
        return;
      }
    }
    sub_2351B50FC(0, qword_26AD83620);
    uint64_t v23 = (void *)sub_2351CA560();
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v19;
    *(void *)(v21 + 24) = v20;
    *(unsigned char *)(v21 + 32) = v18;
    aBlock[4] = sub_2351B5170;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2351B38CC;
    aBlock[3] = &block_descriptor_56;
    id v22 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_2351CA320();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_2351B51B0(&qword_26AD836D0, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836D8);
    sub_2351B51F8();
    sub_2351CA5D0();
    MEMORY[0x237DD6B20](0, v4, v14, v22);
    _Block_release(v22);

    sub_2351B3CF4((uint64_t)v19);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v8);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v4, v15);
  }
}

uint64_t sub_2351B38CC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_2351B3910(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  uint64_t v12 = sub_2351CA400();
  OUTLINED_FUNCTION_0_1();
  uint64_t v14 = v13;
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388](v17);
  int v18 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned __int8 v26 = 3;
  sub_2351B35AC(&v26, 2u, 0);
  uint64_t v19 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v18, a1, v12);
  unint64_t v20 = (*(unsigned __int8 *)(v14 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v21 = (v16 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v19;
  *(double *)(v22 + 24) = a6;
  *(void *)(v22 + 32) = a2;
  *(void *)(v22 + 40) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v22 + v20, v18, v12);
  uint64_t v23 = (double *)(v22 + v21);
  double *v23 = a4;
  v23[1] = a5;
  sub_2351B4E0C(a2);
  return sub_2351B1AA4((uint64_t)sub_2351B5050, v22);
}

uint64_t sub_2351B3AB0(unsigned __int8 *a1, double a2, double a3, double a4, uint64_t a5, uint64_t (*a6)(uint64_t, double *, double, double), uint64_t a7, uint64_t a8)
{
  uint64_t v14 = sub_2351C9E00();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&double v18 = *a1;
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    LOBYTE(v24) = LOBYTE(v18);
    sub_2351B3C8C((unsigned __int8 *)&v24);
    swift_release();
  }
  sub_2351C9DF0();
  sub_2351C9DE0();
  double v20 = v19;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  char v22 = 3;
  switch(LODWORD(v18))
  {
    case 1:
      char v22 = 0;
      double v18 = v20 - a2;
      if (a6) {
        goto LABEL_8;
      }
      return result;
    case 2:
      double v18 = v20 - a2;
      char v22 = 1;
      goto LABEL_7;
    case 3:
      double v18 = v20 - a2;
      char v22 = 2;
      if (!a6) {
        return result;
      }
      goto LABEL_8;
    default:
LABEL_7:
      if (a6)
      {
LABEL_8:
        double v24 = v18;
        char v25 = v22;
        return a6(a8, &v24, a3, a4);
      }
      return result;
  }
}

uint64_t sub_2351B3C8C(unsigned __int8 *a1)
{
  BOOL v1 = *a1 == 2;
  uint64_t result = sub_2351B11C4();
  if ((result & 1) != v1)
  {
    return sub_2351B0F44();
  }
  return result;
}

uint64_t sub_2351B3CF4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for ArtworkLoader()
{
  uint64_t result = qword_26AD83398;
  if (!qword_26AD83398) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2351B3D54()
{
  return sub_2351B1598(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
}

uint64_t sub_2351B3D78()
{
  return sub_2351C9E10();
}

void *sub_2351B3E34@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_2351B17D4();
  *a1 = result;
  return result;
}

void sub_2351B3E64()
{
  sub_2351B18EC(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

BOOL sub_2351B3E80(unsigned char *a1, unsigned char *a2)
{
  int v2 = *a2;
  switch(*a1)
  {
    case 1:
      return v2 == 1;
    case 2:
      return v2 == 2;
    case 3:
      return v2 == 3;
    default:
      return !*a2;
  }
}

uint64_t sub_2351B3EEC()
{
  switch(*v0)
  {
    case 2:
      sub_2351CA700();
      break;
    default:
      return sub_2351CA700();
  }
  return sub_2351CA700();
}

uint64_t sub_2351B3F68()
{
  uint64_t v1 = *v0;
  sub_2351CA6F0();
  switch(v1)
  {
    case 2:
      sub_2351CA700();
      break;
    default:
      break;
  }
  sub_2351CA700();
  return sub_2351CA730();
}

uint64_t sub_2351B4010()
{
  uint64_t v1 = *v0;
  sub_2351CA6F0();
  switch(v1)
  {
    case 2:
      sub_2351CA700();
      break;
    default:
      break;
  }
  sub_2351CA700();
  return sub_2351CA730();
}

uint64_t sub_2351B40A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_2351B4104(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD83328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2351B416C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s10ParametersVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2351B41D0()
{
  return type metadata accessor for ArtworkLoader();
}

void sub_2351B41D8()
{
  sub_2351B44B4();
  if (v0 <= 0x3F)
  {
    sub_2351C9E60();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for ArtworkLoader(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ArtworkLoader);
}

uint64_t dispatch thunk of ArtworkLoader.__allocating_init(shouldEnforceUsageOnMainThread:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of ArtworkLoader.didFailToLoadArtwork.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of ArtworkLoader.didFailToLoadArtwork.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of ArtworkLoader.didFailToLoadArtwork.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of ArtworkLoader.containerSize.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of ArtworkLoader.containerSize.setter(uint64_t a1, uint64_t a2, char a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)v3 + 232))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of ArtworkLoader.containerSize.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of ArtworkLoader.image.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of ArtworkLoader.image.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of ArtworkLoader.image.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of ArtworkLoader.load(_:for:width:height:containerSize:rawCropStyle:rawImageFormat:reusePolicy:configurationHandler:loadingObserverHandler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

void sub_2351B44B4()
{
  if (!qword_26AD82E98)
  {
    _s10ParametersVMa();
    unint64_t v0 = sub_2351CA590();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AD82E98);
    }
  }
}

uint64_t getEnumTagSinglePayload for ArtworkLoader.SimplifiedLoadingStatus(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ArtworkLoader.SimplifiedLoadingStatus(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2351B4660);
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

uint64_t sub_2351B4688(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2351B4690(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ArtworkLoader.SimplifiedLoadingStatus()
{
  return &type metadata for ArtworkLoader.SimplifiedLoadingStatus;
}

unint64_t sub_2351B46AC()
{
  unint64_t result = qword_2687F41C0;
  if (!qword_2687F41C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2687F41C0);
  }
  return result;
}

uint64_t sub_2351B46F8()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2351B4730()
{
  swift_unknownObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2351B4780(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_2351B4848;
  return sub_2351B2E40(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2351B4848()
{
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_13();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_12();
  return v3();
}

uint64_t sub_2351B490C(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_2351B4960(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *, uint64_t))
{
  sub_2351B4F34(a1, (uint64_t)v9);
  type metadata accessor for ArtworkLoader();
  if (swift_dynamicCast() && v8)
  {
    uint64_t v7 = v8;
    a3(&v7, a2);
    return swift_release();
  }
  else
  {
    sub_2351B4F34(a1, (uint64_t)v9);
    sub_2351CA5E0();
    sub_2351CA4C0();
    sub_2351CA610();
    sub_2351CA4C0();
    uint64_t result = sub_2351CA650();
    __break(1u);
  }
  return result;
}

uint64_t sub_2351B4AB0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, id))(a1 + 32);
  v8[3] = swift_getObjectType();
  v8[0] = a2;
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(v8, v6);
  swift_release();

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t sub_2351B4B38(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2351B4C14;
  return v6(a1);
}

uint64_t sub_2351B4C14()
{
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_13();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_12();
  return v3();
}

uint64_t sub_2351B4CDC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2351B4D14(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2351B4848;
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2687F41D8 + dword_2687F41D8);
  return v6(a1, v4);
}

uint64_t sub_2351B4DCC()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2351B4E04(void *a1, void *a2)
{
  sub_2351B28CC(a1, a2, v2);
}

uint64_t sub_2351B4E0C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2351B4E1C(uint64_t a1)
{
  return a1;
}

void sub_2351B4E70(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_2351CA450();
  objc_msgSend(a3, sel_setCropStyle_, v4);
}

void sub_2351B4EC8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)sub_2351CA450();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setFormat_, v4);
}

uint64_t sub_2351B4F2C(uint64_t a1, uint64_t a2)
{
  return sub_2351B4960(a1, a2, *(void (**)(uint64_t *, uint64_t))(v2 + 16));
}

uint64_t sub_2351B4F34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2351B4F90()
{
  uint64_t v1 = sub_2351CA400();
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = *(void *)(v5 + 64);
  swift_release();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }
  uint64_t v7 = (v4 + 48) & ~v4;
  unint64_t v8 = ((v6 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);

  return MEMORY[0x270FA0238](v0, v8, v4 | 7);
}

uint64_t sub_2351B5050(unsigned __int8 *a1)
{
  uint64_t v3 = *(void *)(sub_2351CA400() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *((void *)v1 + 2);
  double v6 = v1[3];
  uint64_t v7 = (uint64_t (*)(uint64_t, double *, double, double))*((void *)v1 + 4);
  uint64_t v8 = *((void *)v1 + 5);
  uint64_t v9 = (uint64_t)v1 + v4;
  uint64_t v10 = (double *)((char *)v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  double v11 = *v10;
  double v12 = v10[1];

  return sub_2351B3AB0(a1, v6, v11, v12, v5, v7, v8, v9);
}

uint64_t sub_2351B50FC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2351B5138()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_2351B5170()
{
  uint64_t v1 = *(uint64_t (**)(char *))(v0 + 16);
  char v3 = *(unsigned char *)(v0 + 32);
  return v1(&v3);
}

uint64_t sub_2351B51B0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2351B51F8()
{
  unint64_t result = qword_26AD836E0;
  if (!qword_26AD836E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD836D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD836E0);
  }
  return result;
}

uint64_t sub_2351B525C()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836C8);
  MEMORY[0x270FA5388](v2);
  unint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836A8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (void *)((char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2351B8644(v1, (uint64_t)v7, &qword_26AD836A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    uint64_t v10 = v7[2];
    v13[0] = v8;
    v13[1] = v9;
    v13[2] = v10;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD83170);
    MEMORY[0x237DD6840](&v14, v11);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    sub_2351B8694((uint64_t)v7, (uint64_t)v4, &qword_26AD836C8);
    sub_2351CA2E0();
    sub_2351B86E4((uint64_t)v4, &qword_26AD836C8);
  }
  return v14;
}

void ArtworkImage.init(artwork:width:height:idealAspectRatio:contentMode:backgroundColor:rawCropStyle:rawImageFormat:reusePolicy:externalLoader:)(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, int a7@<W6>, int a8@<W7>, void *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char *a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  int v61 = a7;
  int v62 = a8;
  int v57 = a5;
  uint64_t v63 = a17;
  uint64_t v53 = a16;
  uint64_t v54 = a18;
  uint64_t v59 = a13;
  uint64_t v60 = a6;
  uint64_t v65 = a10;
  uint64_t v55 = a11;
  uint64_t v56 = a12;
  uint64_t v58 = a14;
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836A8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_22();
  uint64_t v51 = v24;
  MEMORY[0x270FA5388](v25);
  uint64_t v52 = (uint64_t)&v50 - v26;
  char v27 = *a15;
  uint64_t v28 = (int *)type metadata accessor for ArtworkImage(0);
  uint64_t v29 = (char *)a9 + v28[5];
  uint64_t v30 = sub_2351CA400();
  OUTLINED_FUNCTION_0();
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v29, a1, v30);
  uint64_t v32 = (char *)a9 + v28[6];
  *(void *)uint64_t v32 = a2;
  v32[8] = a3 & 1;
  uint64_t v33 = (char *)a9 + v28[7];
  *(void *)uint64_t v33 = a4;
  v33[8] = v57 & 1;
  uint64_t v34 = (char *)a9 + v28[8];
  *(void *)uint64_t v34 = v60;
  v34[8] = v61 & 1;
  *((unsigned char *)a9 + v28[9]) = v62;
  uint64_t v35 = (void *)((char *)a9 + v28[10]);
  uint64_t v36 = v56;
  void *v35 = v55;
  v35[1] = v36;
  uint64_t v37 = (void *)((char *)a9 + v28[11]);
  uint64_t v38 = v58;
  void *v37 = v59;
  v37[1] = v38;
  *((unsigned char *)a9 + v28[12]) = v27;
  GenericRGB = (void *)sub_2351CA3D0();
  if (!GenericRGB) {
    GenericRGB = CGColorCreateGenericRGB(0.0, 0.0, 0.0, 0.0);
  }
  uint64_t v40 = GenericRGB;
  uint64_t v41 = v63;
  if (v65) {
    uint64_t v42 = v65;
  }
  else {
    uint64_t v42 = MEMORY[0x237DD67B0](GenericRGB);
  }
  *(void *)((char *)a9 + v28[13]) = v42;
  if (v41)
  {

    uint64_t v43 = OUTLINED_FUNCTION_13_0();
    v44(v43);
    *a9 = v53;
    a9[1] = v41;
    a9[2] = v54;
    OUTLINED_FUNCTION_11_0();
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    type metadata accessor for ArtworkLoader();
    swift_allocObject();
    swift_retain();
    ArtworkLoader.init(shouldEnforceUsageOnMainThread:)(1);
    uint64_t v46 = v51;
    sub_2351CA2D0();
    swift_storeEnumTagMultiPayload();
    uint64_t v47 = v52;
    sub_2351B8694(v46, v52, &qword_26AD836A8);

    swift_release();
    uint64_t v48 = OUTLINED_FUNCTION_13_0();
    v49(v48);
    sub_2351B8694(v47, (uint64_t)a9, &qword_26AD836A8);
    OUTLINED_FUNCTION_11_0();
  }
}

uint64_t type metadata accessor for ArtworkImage(uint64_t a1)
{
  return sub_2351B70DC(a1, qword_26AD82EA0);
}

uint64_t ArtworkImage.init(_:width:height:)()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = OUTLINED_FUNCTION_3_1(v1, v12);
  v3(v2);
  uint64_t v4 = OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9_0(v4, v5, v6, v7, 0, v8, v13, v14, v15, v16, v17, v18, v19, v20, v21);
  uint64_t v9 = OUTLINED_FUNCTION_4_0();
  return v10(v9);
}

uint64_t ArtworkImage.init(_:width:)()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = OUTLINED_FUNCTION_3_1(v1, v11);
  v3(v2);
  uint64_t v4 = OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9_0(v4, v5, v6, 0, 1, v7, v12, v13, v14, v15, v16, v17, v18, v19, v20);
  uint64_t v8 = OUTLINED_FUNCTION_4_0();
  return v9(v8);
}

uint64_t ArtworkImage.init(_:height:)(double a1)
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v4);
  char v6 = OUTLINED_FUNCTION_3_1(v5, v11);
  v7(v6);
  char v12 = 0;
  OUTLINED_FUNCTION_9_0(v2, 0, 1, *(uint64_t *)&a1, 0, v1, 0, 0, 0, 0, 0, &v12, 0, 0, 0);
  uint64_t v8 = OUTLINED_FUNCTION_4_0();
  return v9(v8);
}

void static ArtworkImage.automaticallySized(with:)()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_15();
  uint64_t v5 = v4 - v3;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v4 - v3, v0);
  char v7 = 0;
  OUTLINED_FUNCTION_9_0(v5, 0, 1, 0, 1, v1, 0, 0, 0, 0, 0, &v7, 0, 0, 0);
}

void ArtworkImage.init(base:idealAspectRatio:contentMode:backgroundColor:rawCropStyle:rawImageFormat:reusePolicy:externalLoader:)(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, unsigned __int8 *a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v74 = a8;
  uint64_t v75 = a6;
  uint64_t v76 = a2;
  uint64_t v77 = a7;
  int v78 = a4;
  LODWORD(v73) = a3;
  uint64_t v72 = a9;
  uint64_t v16 = (int *)type metadata accessor for ArtworkImage(0);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v17);
  OUTLINED_FUNCTION_22();
  uint64_t v19 = v18;
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v23 = &v64[-v22];
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  uint64_t v26 = &v64[-v25];
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  uint64_t v29 = &v64[-v28];
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v32 = &v64[-v31];
  MEMORY[0x270FA5388](v30);
  uint64_t v34 = &v64[-v33];
  sub_2351CA400();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_15();
  uint64_t v38 = v37 - v36;
  int v67 = *a11;
  uint64_t v40 = *(void (**)(void))(v39 + 16);
  uint64_t v66 = v38;
  v40();
  uint64_t v41 = v16[7];
  uint64_t v42 = a1 + v16[6];
  uint64_t v43 = *(void *)v42;
  int v70 = *(unsigned __int8 *)(v42 + 8);
  uint64_t v44 = a1 + v41;
  uint64_t v45 = *(void *)(a1 + v41);
  uint64_t v68 = v43;
  uint64_t v69 = v45;
  int v46 = *(unsigned __int8 *)(v44 + 8);
  uint64_t v47 = OUTLINED_FUNCTION_12_0();
  sub_2351B71AC(v47, v48, v49);
  int v71 = v46;
  if (v73)
  {
    uint64_t v50 = &v34[v16[8]];
    uint64_t v76 = *(void *)v50;
    int v65 = v50[8];
  }
  else
  {
    int v65 = 0;
  }
  sub_2351B7200((uint64_t)v34, (void (*)(void))type metadata accessor for ArtworkImage);
  uint64_t v51 = OUTLINED_FUNCTION_16_0();
  sub_2351B71AC(v51, v52, (void (*)(void))type metadata accessor for ArtworkImage);
  if (v78 == 2) {
    int v78 = v32[v16[9]];
  }
  sub_2351B7200((uint64_t)v32, (void (*)(void))type metadata accessor for ArtworkImage);
  sub_2351B71AC(a1, (uint64_t)v29, (void (*)(void))type metadata accessor for ArtworkImage);
  uint64_t v53 = a5;
  if (!a5)
  {
    uint64_t v53 = *(void *)&v29[v16[13]];
    swift_retain();
  }
  uint64_t v54 = a10;
  swift_retain();
  sub_2351B7200((uint64_t)v29, (void (*)(void))type metadata accessor for ArtworkImage);
  sub_2351B71AC(a1, (uint64_t)v26, (void (*)(void))type metadata accessor for ArtworkImage);
  if (!v77)
  {
    uint64_t v55 = (uint64_t *)&v26[v16[10]];
    uint64_t v56 = v55[1];
    uint64_t v75 = *v55;
    uint64_t v77 = v56;
    swift_bridgeObjectRetain();
  }
  uint64_t v73 = a5;
  sub_2351B7200((uint64_t)v26, (void (*)(void))type metadata accessor for ArtworkImage);
  sub_2351B71AC(a1, (uint64_t)v23, (void (*)(void))type metadata accessor for ArtworkImage);
  if (!a10)
  {
    int v57 = (uint64_t *)&v23[v16[11]];
    uint64_t v54 = v57[1];
    uint64_t v74 = *v57;
    swift_bridgeObjectRetain();
  }
  sub_2351B7200((uint64_t)v23, (void (*)(void))type metadata accessor for ArtworkImage);
  sub_2351B71AC(a1, v19, (void (*)(void))type metadata accessor for ArtworkImage);
  if (v67 == 2) {
    char v58 = *(unsigned char *)(v19 + v16[12]);
  }
  else {
    char v58 = v67 & 1;
  }
  uint64_t v59 = v76;
  uint64_t v60 = v19;
  uint64_t v61 = v66;
  sub_2351B7200(v60, (void (*)(void))type metadata accessor for ArtworkImage);
  char v79 = v58;
  ArtworkImage.init(artwork:width:height:idealAspectRatio:contentMode:backgroundColor:rawCropStyle:rawImageFormat:reusePolicy:externalLoader:)(v61, v68, v70, v69, v71, v59, v65, v78, v72, v53, v75, v77, v74, v54, &v79, a12, a13, a14);
  swift_release();
  uint64_t v62 = OUTLINED_FUNCTION_12_0();
  sub_2351B7200(v62, v63);
  OUTLINED_FUNCTION_11_0();
}

uint64_t ArtworkImage.artwork.getter()
{
  type metadata accessor for ArtworkImage(0);
  sub_2351CA400();
  OUTLINED_FUNCTION_2_0();
  uint64_t v0 = OUTLINED_FUNCTION_16_0();

  return v1(v0);
}

uint64_t ArtworkImage.width.getter()
{
  uint64_t v0 = type metadata accessor for ArtworkImage(0);
  return OUTLINED_FUNCTION_10_0(*(int *)(v0 + 24));
}

uint64_t ArtworkImage.height.getter()
{
  uint64_t v0 = type metadata accessor for ArtworkImage(0);
  return OUTLINED_FUNCTION_10_0(*(int *)(v0 + 28));
}

uint64_t ArtworkImage.idealAspectRatio.getter()
{
  uint64_t v0 = type metadata accessor for ArtworkImage(0);
  return OUTLINED_FUNCTION_10_0(*(int *)(v0 + 32));
}

uint64_t ArtworkImage.contentMode.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ArtworkImage(0) + 36));
}

uint64_t ArtworkImage.rawCropStyle.getter()
{
  return OUTLINED_FUNCTION_16_0();
}

uint64_t ArtworkImage.rawImageFormat.getter()
{
  return OUTLINED_FUNCTION_16_0();
}

uint64_t ArtworkImage.reusePolicy.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for ArtworkImage(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 48));
  return result;
}

uint64_t ArtworkImage.backgroundColor.getter()
{
  type metadata accessor for ArtworkImage(0);

  return swift_retain();
}

uint64_t ArtworkImage.containerSize.getter()
{
  uint64_t v1 = (int *)type metadata accessor for ArtworkImage(0);
  uint64_t v2 = sub_2351CA3A0();
  uint64_t v3 = sub_2351CA3C0();
  sub_2351C6AEC(v2, v3, *(double *)(v0 + v1[6]), *(unsigned char *)(v0 + v1[6] + 8), *(double *)(v0 + v1[7]), *(unsigned char *)(v0 + v1[7] + 8), *(double *)(v0 + v1[8]), *(unsigned char *)(v0 + v1[8] + 8), (uint64_t)v5, *(unsigned char *)(v0 + v1[9]));
  sub_2351B8694((uint64_t)v5, (uint64_t)v6, &qword_26AD83080);
  if ((unint64_t)v6[57] << 8 == 768) {
    return 0;
  }
  else {
    return v7;
  }
}

void ArtworkImage.body.getter(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v58 = a1;
  uint64_t v3 = (int *)type metadata accessor for ArtworkImage(0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v52 = v4;
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v7);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD83150);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_9();
  int v57 = v9;
  uint64_t v10 = (int *)_s9BaseImageV18ArtworkLoaderImageVMa(0);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_15();
  uint64_t v14 = v13 - v12;
  sub_2351CA400();
  OUTLINED_FUNCTION_0_1();
  uint64_t v54 = v16;
  uint64_t v55 = v15;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_9();
  uint64_t v53 = v17;
  uint64_t v59 = _s9BaseImageVMa(0);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_15();
  uint64_t v21 = (void *)(v20 - v19);
  uint64_t v22 = v1 + v3[5];
  uint64_t v23 = sub_2351CA3A0();
  uint64_t v24 = sub_2351CA3C0();
  sub_2351C6AEC(v23, v24, *(double *)(v2 + v3[6]), *(unsigned char *)(v2 + v3[6] + 8), *(double *)(v2 + v3[7]), *(unsigned char *)(v2 + v3[7] + 8), *(double *)(v2 + v3[8]), *(unsigned char *)(v2 + v3[8] + 8), (uint64_t)v60, *(unsigned char *)(v2 + v3[9]));
  sub_2351B8694((uint64_t)v60, (uint64_t)v61, &qword_26AD83080);
  if ((unint64_t)v61[57] << 8 == 768)
  {
    sub_2351B71AC(v2, (uint64_t)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for ArtworkImage);
    unint64_t v25 = (*(unsigned __int8 *)(v52 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
    uint64_t v26 = swift_allocObject();
    sub_2351B7158((uint64_t)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v26 + v25, (void (*)(void))type metadata accessor for ArtworkImage);
    uint64_t v27 = v57;
    *int v57 = sub_2351B6F94;
    v27[1] = v26;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD830E8);
    sub_2351B7110(&qword_26AD83060, (void (*)(uint64_t))_s9BaseImageVMa);
    sub_2351B7014();
    sub_2351CA050();
  }
  else
  {
    memcpy(__dst, v61, sizeof(__dst));
    uint64_t v28 = v53;
    uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 16);
    v29(v53, v22, v55);
    uint64_t v30 = sub_2351B525C();
    uint64_t v31 = v3[12];
    uint64_t v52 = *(void *)(v2 + v3[13]);
    uint64_t v32 = v52;
    uint64_t v33 = v3[11];
    uint64_t v34 = (uint64_t *)(v2 + v3[10]);
    uint64_t v35 = *v34;
    uint64_t v36 = v34[1];
    uint64_t v37 = *(void *)(v2 + v33 + 8);
    uint64_t v49 = *(void *)(v2 + v33);
    uint64_t v50 = v30;
    uint64_t v47 = v35;
    uint64_t v48 = v37;
    int v51 = *(unsigned __int8 *)(v2 + v31);
    uint64_t v38 = (char *)v21 + *(int *)(v59 + 28);
    *(void *)uint64_t v38 = swift_getKeyPath();
    v38[8] = 0;
    memcpy(v21, __dst, 0x60uLL);
    v21[12] = v32;
    v29(v14, v28, v55);
    *(void *)(v14 + v10[5]) = v50;
    memcpy((void *)(v14 + v10[6]), __dst, 0x60uLL);
    uint64_t v39 = (void *)(v14 + v10[7]);
    uint64_t v40 = v48;
    *uint64_t v39 = v47;
    v39[1] = v36;
    uint64_t v41 = (void *)(v14 + v10[8]);
    void *v41 = v49;
    v41[1] = v40;
    *(unsigned char *)(v14 + v10[9]) = v51;
    uint64_t v42 = v14 + v10[10];
    *(void *)uint64_t v42 = swift_getKeyPath();
    *(unsigned char *)(v42 + 8) = 0;
    uint64_t v43 = v14 + v10[11];
    *(void *)uint64_t v43 = swift_getKeyPath();
    *(unsigned char *)(v43 + 40) = 0;
    uint64_t v44 = v14 + v10[12];
    type metadata accessor for ArtworkLoadingObserver(0);
    sub_2351B7110((unint64_t *)&qword_26AD830A0, (void (*)(uint64_t))type metadata accessor for ArtworkLoadingObserver);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    *(void *)uint64_t v44 = sub_2351C9EC0();
    *(unsigned char *)(v44 + 8) = v45 & 1;
    OUTLINED_FUNCTION_8_0();
    v46();
    sub_2351B7158(v14, (uint64_t)v21 + *(int *)(v59 + 24), (void (*)(void))_s9BaseImageV18ArtworkLoaderImageVMa);
    sub_2351B71AC((uint64_t)v21, (uint64_t)v57, (void (*)(void))_s9BaseImageVMa);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD830E8);
    sub_2351B7110(&qword_26AD83060, (void (*)(uint64_t))_s9BaseImageVMa);
    sub_2351B7014();
    sub_2351CA050();
    sub_2351B7200((uint64_t)v21, (void (*)(void))_s9BaseImageVMa);
  }
  OUTLINED_FUNCTION_11_0();
}

uint64_t sub_2351B6640@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v40 = a3;
  uint64_t v38 = sub_2351CA400();
  uint64_t v5 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v39 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2351C9F20();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (int *)type metadata accessor for ArtworkImage(0);
  uint64_t v12 = a2 + v11[5];
  uint64_t v37 = sub_2351CA3A0();
  uint64_t v13 = sub_2351CA3C0();
  sub_2351C9F10();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v18 = a2 + v11[8];
  double v19 = *(double *)v18;
  char v20 = *(unsigned char *)(v18 + 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  if (v20)
  {
    sub_2351C9F10();
    double v22 = v21;
    sub_2351C9F10();
    double v24 = v23;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    double v19 = v22 / v24;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  char v25 = *(unsigned char *)(a2 + v11[9]);
  v42[0] = v37;
  v42[1] = v13;
  v42[2] = v15;
  char v43 = 0;
  uint64_t v44 = v17;
  char v45 = 0;
  double v46 = v19;
  char v47 = 0;
  char v48 = v25;
  uint64_t v49 = v15;
  uint64_t v50 = v17;
  uint64_t v51 = v15;
  uint64_t v52 = v17;
  uint64_t v26 = (uint64_t)v39;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v39, v12, v38);
  uint64_t v27 = sub_2351B525C();
  uint64_t v28 = v11[12];
  uint64_t v29 = *(void *)(a2 + v11[13]);
  uint64_t v30 = v11[11];
  uint64_t v31 = (uint64_t *)(a2 + v11[10]);
  uint64_t v32 = *v31;
  uint64_t v33 = v31[1];
  uint64_t v34 = *(void *)(a2 + v30);
  uint64_t v35 = *(void *)(a2 + v30 + 8);
  char v41 = *(unsigned char *)(a2 + v28);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return sub_2351BF42C(v26, v27, v42, v29, v32, v33, v34, v35, v40, &v41);
}

double sub_2351B6918()
{
  qword_26AD83618 = 0;
  double result = 0.0;
  xmmword_26AD835F8 = 0u;
  unk_26AD83608 = 0u;
  return result;
}

long long *sub_2351B6930()
{
  if (qword_26AD83078 != -1) {
    swift_once();
  }
  return &xmmword_26AD835F8;
}

uint64_t sub_2351B697C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2351B6930();
  return sub_2351B8644((uint64_t)v2, a1, &qword_26AD830B8);
}

uint64_t EnvironmentValues.artworkCatalogConfigurationHandler.getter()
{
  sub_2351B7254();

  return sub_2351CA020();
}

uint64_t sub_2351B69FC()
{
  return EnvironmentValues.artworkCatalogConfigurationHandler.getter();
}

uint64_t sub_2351B6A20(uint64_t a1)
{
  sub_2351B8644(a1, (uint64_t)v2, &qword_26AD830B8);
  return EnvironmentValues.artworkCatalogConfigurationHandler.setter((uint64_t)v2);
}

uint64_t EnvironmentValues.artworkCatalogConfigurationHandler.setter(uint64_t a1)
{
  sub_2351B8644(a1, (uint64_t)v4, &qword_26AD830B8);
  sub_2351B7254();
  sub_2351CA030();
  uint64_t v1 = OUTLINED_FUNCTION_12_0();
  return sub_2351B86E4(v1, v2);
}

void (*EnvironmentValues.artworkCatalogConfigurationHandler.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[15] = v1;
  v3[16] = sub_2351B7254();
  sub_2351CA020();
  return sub_2351B6B40;
}

void sub_2351B6B40(void **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (uint64_t)*a1 + 40;
  if (a2)
  {
    uint64_t v4 = OUTLINED_FUNCTION_12_0();
    sub_2351B8644(v4, v5, &qword_26AD830B8);
    sub_2351B8644(v3, (uint64_t)v2 + 80, &qword_26AD830B8);
    sub_2351CA030();
    sub_2351B86E4(v3, &qword_26AD830B8);
  }
  else
  {
    uint64_t v6 = OUTLINED_FUNCTION_12_0();
    sub_2351B8644(v6, v7, &qword_26AD830B8);
    sub_2351CA030();
  }
  sub_2351B86E4((uint64_t)v2, &qword_26AD830B8);

  free(v2);
}

uint64_t _ArtworkCatalogConfigurationParameters.rawArtworkCatalog.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2351B4F34(v1, a1);
}

uint64_t ArtworkLoadingObserver.__allocating_init(handler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_2351C9E50();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  return v4;
}

uint64_t ArtworkLoadingObserver.init(handler:)(uint64_t a1, uint64_t a2)
{
  sub_2351C9E50();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return v2;
}

uint64_t ArtworkLoadingObserver.deinit()
{
  swift_release();
  sub_2351C9E60();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_0();
  v1();
  return v0;
}

uint64_t ArtworkLoadingObserver.__deallocating_deinit()
{
  swift_release();
  sub_2351C9E60();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_0();
  v1();
  uint64_t v2 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v3 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v2, v3);
}

uint64_t sub_2351B6DC8@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_2351C9FD0();
  *a1 = v3;
  return result;
}

uint64_t sub_2351B6DF4@<X0>(void *a1@<X8>)
{
  *a1 = v1;
  return swift_retain();
}

uint64_t sub_2351B6E00()
{
  uint64_t v1 = *(void *)(type metadata accessor for ArtworkImage(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_release();
    swift_release();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836C0);
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_8_0();
    v4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836C8);
  }
  swift_release();
  sub_2351CA400();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_0();
  v5();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, ((v2 + 16) & ~v2) + v3, v2 | 7);
}

uint64_t sub_2351B6F94@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ArtworkImage(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_2351B6640(a1, v6, a2);
}

unint64_t sub_2351B7014()
{
  unint64_t result = qword_26AD830E0;
  if (!qword_26AD830E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD830E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD830E0);
  }
  return result;
}

uint64_t sub_2351B7068@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_2351C9FD0();
  *a1 = v3;
  return result;
}

uint64_t sub_2351B7094()
{
  return EnvironmentValues.artworkCatalogConfigurationHandler.getter();
}

uint64_t type metadata accessor for ArtworkLoadingObserver(uint64_t a1)
{
  return sub_2351B70DC(a1, (uint64_t *)&unk_26AD830A8);
}

uint64_t sub_2351B70DC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2351B7110(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2351B7158(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_2_0();
  uint64_t v4 = OUTLINED_FUNCTION_17_0();
  v5(v4);
  return a2;
}

uint64_t sub_2351B71AC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_2_0();
  uint64_t v4 = OUTLINED_FUNCTION_18_0();
  v5(v4);
  return a2;
}

uint64_t sub_2351B7200(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_0();
  v3();
  return a1;
}

unint64_t sub_2351B7254()
{
  unint64_t result = qword_26AD83190;
  if (!qword_26AD83190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD83190);
  }
  return result;
}

uint64_t sub_2351B72A0()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for ArtworkImage(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v4 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = a2[1];
      *uint64_t v4 = *a2;
      v4[1] = v7;
      v4[2] = a2[2];
      swift_retain();
      swift_retain();
    }
    else
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836C0);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v4, a2, v9);
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836C8);
      *(void *)((char *)v4 + *(int *)(v10 + 28)) = *(void *)((char *)a2 + *(int *)(v10 + 28));
    }
    swift_retain();
    swift_storeEnumTagMultiPayload();
    uint64_t v11 = a3[5];
    uint64_t v12 = (char *)v4 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_2351CA400();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    uint64_t v15 = a3[6];
    uint64_t v16 = a3[7];
    uint64_t v17 = (char *)v4 + v15;
    uint64_t v18 = (char *)a2 + v15;
    *(void *)uint64_t v17 = *(void *)v18;
    v17[8] = v18[8];
    double v19 = (char *)v4 + v16;
    char v20 = (char *)a2 + v16;
    *(void *)double v19 = *(void *)v20;
    v19[8] = v20[8];
    uint64_t v21 = a3[8];
    uint64_t v22 = a3[9];
    double v23 = (char *)v4 + v21;
    double v24 = (char *)a2 + v21;
    *(void *)double v23 = *(void *)v24;
    v23[8] = v24[8];
    *((unsigned char *)v4 + v22) = *((unsigned char *)a2 + v22);
    uint64_t v25 = a3[10];
    uint64_t v26 = a3[11];
    uint64_t v27 = (void *)((char *)v4 + v25);
    uint64_t v28 = (void *)((char *)a2 + v25);
    uint64_t v29 = v28[1];
    *uint64_t v27 = *v28;
    v27[1] = v29;
    uint64_t v30 = (void *)((char *)v4 + v26);
    uint64_t v31 = (void *)((char *)a2 + v26);
    uint64_t v32 = v31[1];
    *uint64_t v30 = *v31;
    v30[1] = v32;
    uint64_t v33 = a3[13];
    *((unsigned char *)v4 + a3[12]) = *((unsigned char *)a2 + a3[12]);
    *(void *)((char *)v4 + v33) = *(void *)((char *)a2 + v33);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for ArtworkImage(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_release();
    swift_release();
  }
  else
  {
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836C0);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836C8);
  }
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

void *initializeWithCopy for ArtworkImage(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    a1[2] = a2[2];
    swift_retain();
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836C0);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836C8);
    *(void *)((char *)a1 + *(int *)(v8 + 28)) = *(void *)((char *)a2 + *(int *)(v8 + 28));
  }
  swift_retain();
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = a3[5];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_2351CA400();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v13;
  uint64_t v16 = (char *)a2 + v13;
  *(void *)uint64_t v15 = *(void *)v16;
  v15[8] = v16[8];
  uint64_t v17 = (char *)a1 + v14;
  uint64_t v18 = (char *)a2 + v14;
  *(void *)uint64_t v17 = *(void *)v18;
  v17[8] = v18[8];
  uint64_t v19 = a3[8];
  uint64_t v20 = a3[9];
  uint64_t v21 = (char *)a1 + v19;
  uint64_t v22 = (char *)a2 + v19;
  *(void *)uint64_t v21 = *(void *)v22;
  v21[8] = v22[8];
  *((unsigned char *)a1 + v20) = *((unsigned char *)a2 + v20);
  uint64_t v23 = a3[10];
  uint64_t v24 = a3[11];
  uint64_t v25 = (void *)((char *)a1 + v23);
  uint64_t v26 = (void *)((char *)a2 + v23);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  uint64_t v28 = (void *)((char *)a1 + v24);
  uint64_t v29 = (void *)((char *)a2 + v24);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  uint64_t v31 = a3[13];
  *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
  *(void *)((char *)a1 + v31) = *(void *)((char *)a2 + v31);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ArtworkImage(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_2351B86E4((uint64_t)a1, &qword_26AD836A8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      swift_retain();
      swift_retain();
    }
    else
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836C0);
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836C8);
      *(void *)((char *)a1 + *(int *)(v7 + 28)) = *(void *)((char *)a2 + *(int *)(v7 + 28));
    }
    swift_retain();
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_2351CA400();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = *(void *)v14;
  v13[8] = v14[8];
  *(void *)uint64_t v13 = v15;
  uint64_t v16 = a3[7];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  LOBYTE(v15) = v18[8];
  *(void *)uint64_t v17 = *(void *)v18;
  v17[8] = v15;
  uint64_t v19 = a3[8];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  LOBYTE(v15) = v21[8];
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v15;
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  uint64_t v22 = a3[10];
  uint64_t v23 = (void *)((char *)a1 + v22);
  uint64_t v24 = (void *)((char *)a2 + v22);
  void *v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[11];
  uint64_t v26 = (void *)((char *)a1 + v25);
  uint64_t v27 = (void *)((char *)a2 + v25);
  void *v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[12]) = *((unsigned char *)a2 + a3[12]);
  *(void *)((char *)a1 + a3[13]) = *(void *)((char *)a2 + a3[13]);
  swift_retain();
  swift_release();
  return a1;
}

char *initializeWithTake for ArtworkImage(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836A8);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836C0);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836C8);
    *(void *)&a1[*(int *)(v8 + 28)] = *(void *)&a2[*(int *)(v8 + 28)];
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_2351CA400();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v13];
  uint64_t v16 = &a2[v13];
  *(void *)uint64_t v15 = *(void *)v16;
  v15[8] = v16[8];
  uint64_t v17 = &a1[v14];
  uint64_t v18 = &a2[v14];
  *(void *)uint64_t v17 = *(void *)v18;
  v17[8] = v18[8];
  uint64_t v19 = a3[8];
  uint64_t v20 = a3[9];
  uint64_t v21 = &a1[v19];
  uint64_t v22 = &a2[v19];
  *(void *)uint64_t v21 = *(void *)v22;
  v21[8] = v22[8];
  a1[v20] = a2[v20];
  uint64_t v23 = a3[11];
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  *(_OWORD *)&a1[v23] = *(_OWORD *)&a2[v23];
  uint64_t v24 = a3[13];
  a1[a3[12]] = a2[a3[12]];
  *(void *)&a1[v24] = *(void *)&a2[v24];
  return a1;
}

char *assignWithTake for ArtworkImage(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_2351B86E4((uint64_t)a1, &qword_26AD836A8);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836A8);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836C0);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836C8);
      *(void *)&a1[*(int *)(v8 + 28)] = *(void *)&a2[*(int *)(v8 + 28)];
      swift_storeEnumTagMultiPayload();
    }
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_2351CA400();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v13];
  uint64_t v16 = &a2[v13];
  *(void *)uint64_t v15 = *(void *)v16;
  v15[8] = v16[8];
  uint64_t v17 = &a1[v14];
  uint64_t v18 = &a2[v14];
  *(void *)uint64_t v17 = *(void *)v18;
  v17[8] = v18[8];
  uint64_t v19 = a3[8];
  uint64_t v20 = a3[9];
  uint64_t v21 = &a1[v19];
  uint64_t v22 = &a2[v19];
  *(void *)uint64_t v21 = *(void *)v22;
  v21[8] = v22[8];
  a1[v20] = a2[v20];
  uint64_t v23 = a3[10];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  uint64_t v27 = *(void *)v25;
  uint64_t v26 = *((void *)v25 + 1);
  *(void *)uint64_t v24 = v27;
  *((void *)v24 + 1) = v26;
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[11];
  uint64_t v29 = &a1[v28];
  uint64_t v30 = &a2[v28];
  uint64_t v32 = *(void *)v30;
  uint64_t v31 = *((void *)v30 + 1);
  *(void *)uint64_t v29 = v32;
  *((void *)v29 + 1) = v31;
  swift_bridgeObjectRelease();
  uint64_t v33 = a3[13];
  a1[a3[12]] = a2[a3[12]];
  *(void *)&a1[v33] = *(void *)&a2[v33];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArtworkImage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2351B7E14);
}

uint64_t sub_2351B7E14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836A8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  sub_2351CA400();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 52));
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t storeEnumTagSinglePayload for ArtworkImage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2351B7EE0);
}

void sub_2351B7EE0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD836A8);
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_2351CA400();
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 52)) = (a2 - 1);
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }

  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_2351B7F94()
{
  sub_2351B8098();
  if (v0 <= 0x3F)
  {
    sub_2351CA400();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_2351B8098()
{
  if (!qword_26AD836B0)
  {
    type metadata accessor for ArtworkLoader();
    unint64_t v0 = type metadata accessor for MusicLazyStateOrBinding();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AD836B0);
    }
  }
}

uint64_t dispatch thunk of ArtworkCatalogConfigurationHandler.updateConfiguration(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t initializeBufferWithCopyOfBuffer for _ArtworkCatalogConfigurationParameters(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for _ArtworkCatalogConfigurationParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for _ArtworkCatalogConfigurationParameters(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        uint64_t *v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          uint64_t *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
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

_OWORD *assignWithTake for _ArtworkCatalogConfigurationParameters(_OWORD *a1, _OWORD *a2)
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  return a1;
}

uint64_t getEnumTagSinglePayload for _ArtworkCatalogConfigurationParameters(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for _ArtworkCatalogConfigurationParameters(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _ArtworkCatalogConfigurationParameters()
{
  return &type metadata for _ArtworkCatalogConfigurationParameters;
}

uint64_t sub_2351B84B0()
{
  return type metadata accessor for ArtworkLoadingObserver(0);
}

uint64_t sub_2351B84B8()
{
  uint64_t result = sub_2351C9E60();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ArtworkLoadingObserver(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ArtworkLoadingObserver);
}

uint64_t dispatch thunk of ArtworkLoadingObserver.__allocating_init(handler:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

unint64_t sub_2351B8588()
{
  unint64_t result = qword_26AD83158;
  if (!qword_26AD83158)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD83160);
    sub_2351B7110(&qword_26AD83060, (void (*)(uint64_t))_s9BaseImageVMa);
    sub_2351B7014();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD83158);
  }
  return result;
}

ValueMetadata *type metadata accessor for ArtworkImage.CatalogConfigurationHandlerKey()
{
  return &type metadata for ArtworkImage.CatalogConfigurationHandlerKey;
}

uint64_t sub_2351B8644(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_0();
  uint64_t v4 = OUTLINED_FUNCTION_18_0();
  v5(v4);
  return a2;
}

uint64_t sub_2351B8694(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_2_0();
  uint64_t v4 = OUTLINED_FUNCTION_17_0();
  v5(v4);
  return a2;
}

uint64_t sub_2351B86E4(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_0();
  v3();
  return a1;
}

uint64_t sub_2351B8734@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v61 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F41F8);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v52 = v3;
  uint64_t v53 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v62 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4200);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v54 = v6;
  uint64_t v55 = v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v51 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4208);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v57 = v9;
  uint64_t v58 = v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v63 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4210);
  uint64_t v59 = *(void *)(v12 - 8);
  uint64_t v60 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v56 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(v70, v2, sizeof(v70));
  v65[0] = *(_OWORD *)v2;
  LOBYTE(v65[1]) = v2[16];
  uint64_t v14 = *((void *)&v70[1] + 1);
  uint64_t v15 = *(void *)&v70[2];
  uint64_t v48 = *((void *)&v70[3] + 1);
  uint64_t v16 = *(void *)&v70[3];
  uint64_t v49 = *((void *)&v70[2] + 1);
  uint64_t v17 = *(void *)&v70[4];
  uint64_t v46 = *((void *)&v70[5] + 1);
  uint64_t v18 = *(void *)&v70[5];
  uint64_t v47 = *((void *)&v70[4] + 1);
  uint64_t v19 = *(void *)&v70[6];
  uint64_t v44 = *((void *)&v70[7] + 1);
  uint64_t v20 = *(void *)&v70[7];
  uint64_t v45 = *((void *)&v70[6] + 1);
  uint64_t v21 = *(void *)&v70[8];
  sub_2351BBE84((uint64_t)v70);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4218);
  MEMORY[0x237DD6840](v72, v22);
  char v23 = v72[0];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2351BB1C8((uint64_t)v70);
  LOBYTE(v65[0]) = v23;
  *((void *)&v65[0] + 1) = v14;
  *(void *)&v65[1] = v15;
  *((void *)&v65[1] + 1) = v49;
  *(void *)&v65[2] = v16;
  *((void *)&v65[2] + 1) = v48;
  *(void *)&v65[3] = v17;
  *((void *)&v65[3] + 1) = v47;
  *(void *)&v65[4] = v18;
  *((void *)&v65[4] + 1) = v46;
  *(void *)&v65[5] = v19;
  *((void *)&v65[5] + 1) = v45;
  *(void *)&v65[6] = v20;
  *((void *)&v65[6] + 1) = v44;
  *(void *)&v65[7] = v21;
  uint64_t v24 = swift_allocObject();
  memcpy((void *)(v24 + 16), v70, 0x140uLL);
  sub_2351BBE84((uint64_t)v70);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4220);
  unint64_t v26 = sub_2351BC010();
  unint64_t v27 = sub_2351BC064();
  sub_2351CA1A0();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v71 = v70[19];
  v65[0] = v70[19];
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4238);
  sub_2351CA250();
  uint64_t v28 = swift_allocObject();
  memcpy((void *)(v28 + 16), v70, 0x140uLL);
  sub_2351BBE84((uint64_t)v70);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F41E8);
  *(void *)&v65[0] = v25;
  *((void *)&v65[0] + 1) = &type metadata for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext;
  *(void *)&v65[1] = v26;
  *((void *)&v65[1] + 1) = v27;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  unint64_t v31 = sub_2351BC0BC();
  uint64_t v33 = v51;
  uint64_t v32 = v52;
  uint64_t v34 = v62;
  sub_2351CA1A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v34, v32);
  memcpy(v65, (char *)&v70[10] + 8, 0x88uLL);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4250);
  sub_2351CA250();
  sub_2351BB16C((uint64_t)&v66, (uint64_t)v72);
  sub_2351BB16C((uint64_t)v72, (uint64_t)v64);
  uint64_t v35 = swift_allocObject();
  memcpy((void *)(v35 + 16), v70, 0x140uLL);
  sub_2351BBE84((uint64_t)v70);
  *(void *)&v65[0] = v32;
  *((void *)&v65[0] + 1) = v29;
  *(void *)&v65[1] = OpaqueTypeConformance2;
  *((void *)&v65[1] + 1) = v31;
  uint64_t v36 = swift_getOpaqueTypeConformance2();
  unint64_t v37 = sub_2351BC188();
  uint64_t v38 = v54;
  sub_2351CA1A0();
  swift_release();
  sub_2351BB16C((uint64_t)v64, (uint64_t)v65);
  sub_2351BC1D4((uint64_t)v65);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v33, v38);
  v64[0] = *(_OWORD *)((char *)&v70[9] + 8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4260);
  sub_2351CA270();
  uint64_t v39 = swift_allocObject();
  memcpy((void *)(v39 + 16), v70, 0x140uLL);
  sub_2351BBE84((uint64_t)v70);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4268);
  uint64_t v66 = v38;
  int v67 = &_s17PresentationStateON;
  uint64_t v68 = v36;
  unint64_t v69 = v37;
  swift_getOpaqueTypeConformance2();
  sub_2351BC2F4();
  char v41 = v56;
  uint64_t v40 = v57;
  uint64_t v42 = v63;
  sub_2351CA180();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v42, v40);
  v64[0] = v71;
  sub_2351CA270();
  sub_2351BA324(v66, (uint64_t)v67, v68, v61);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v41, v60);
}

__n128 sub_2351B8EF8(int a1, char *a2, void *__src)
{
  char v4 = *a2;
  long long v10 = *(_OWORD *)(a2 + 8);
  uint64_t v5 = *((void *)a2 + 3);
  uint64_t v6 = *((void *)a2 + 4);
  memcpy(__dst, __src, sizeof(__dst));
  LOBYTE(v11) = v4;
  long long v12 = v10;
  uint64_t v13 = v5;
  uint64_t v14 = v6;
  long long v7 = *(_OWORD *)(a2 + 56);
  long long v15 = *(_OWORD *)(a2 + 40);
  long long v16 = v7;
  long long v8 = *(_OWORD *)(a2 + 88);
  long long v17 = *(_OWORD *)(a2 + 72);
  long long v18 = v8;
  long long v19 = *(_OWORD *)(a2 + 104);
  sub_2351B8F8C(&v11);
  return result;
}

void sub_2351B8F8C(void *a1)
{
  int v2 = *(unsigned __int8 *)a1;
  uint64_t v3 = a1[2];
  uint64_t v4 = a1[4];
  uint64_t v83 = a1[1];
  uint64_t v84 = a1[3];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[8];
  uint64_t v85 = a1[5];
  uint64_t v86 = a1[7];
  uint64_t v7 = a1[10];
  uint64_t v8 = a1[12];
  uint64_t v87 = a1[9];
  *(void *)type = a1[11];
  uint64_t v9 = a1[14];
  os_log_t log = (os_log_t)a1[13];
  sub_2351BB16C(v1 + 168, (uint64_t)v112);
  uint64_t v10 = *(void *)(v1 + 296);
  if (v2 != 1)
  {
    char v12 = *(unsigned char *)(v1 + 304);
    uint64_t v13 = *(void *)(v1 + 312);
    sub_2351BB16C((uint64_t)v112, (uint64_t)__src);
    __src[16] = v10;
    memcpy(__dst, __src, sizeof(__dst));
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4250);
    sub_2351CA250();
    sub_2351BB16C((uint64_t)v108, (uint64_t)v110);
    sub_2351BB16C((uint64_t)v110, (uint64_t)v111);
    int v14 = sub_2351BC5D8((uint64_t)v111);
    if (v14)
    {
      if (v14 != 1) {
        return;
      }
      nullsub_1(v111);
      sub_2351BC1D4((uint64_t)v110);
    }
    else
    {
      uint64_t v47 = nullsub_1(v111);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v48 = *(unsigned __int8 *)(v47 + 120);
      if (v48 != 2 && v48 != 3)
      {
        sub_2351BB148((uint64_t)&v91);
        memcpy(__dst, __src, sizeof(__dst));
        sub_2351BB16C((uint64_t)&v91, (uint64_t)v90);
        sub_2351CA260();
        LOBYTE(__dst[0]) = v12;
        __dst[1] = v13;
        v90[0] = 2;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4238);
        goto LABEL_17;
      }
    }
    sub_2351BB148((uint64_t)&v91);
    memcpy(__dst, __src, sizeof(__dst));
    sub_2351BB16C((uint64_t)&v91, (uint64_t)v90);
LABEL_17:
    sub_2351CA260();
    return;
  }
  sub_2351BB16C((uint64_t)v112, (uint64_t)__src);
  __src[16] = v10;
  memcpy(__dst, __src, sizeof(__dst));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4250);
  sub_2351CA250();
  sub_2351BB16C((uint64_t)v108, (uint64_t)v110);
  sub_2351BB16C((uint64_t)v110, (uint64_t)v111);
  int v11 = sub_2351BC5D8((uint64_t)v111);
  if (v11)
  {
    if (v11 == 1)
    {
      nullsub_1(v111);
      sub_2351BC1D4((uint64_t)v110);
    }
    id v91 = objc_msgSend(objc_allocWithZone((Class)MusicKit_SPI_SKCloudServiceSetupViewController), sel_init);
    uint64_t v92 = v83;
    uint64_t v93 = v3;
    uint64_t v94 = v84;
    uint64_t v95 = v4;
    uint64_t v96 = v85;
    uint64_t v97 = v5;
    uint64_t v98 = v86;
    uint64_t v99 = v6;
    uint64_t v100 = v87;
    uint64_t v101 = v7;
    uint64_t v102 = *(void *)type;
    uint64_t v103 = v8;
    os_log_t v104 = log;
    uint64_t v105 = v9;
    char v106 = 2;
    sub_2351BC6F0((uint64_t)&v91);
    memcpy(__dst, __src, sizeof(__dst));
    sub_2351BB16C((uint64_t)&v91, (uint64_t)v90);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_17;
  }
  uint64_t v15 = nullsub_1(v111);
  id v16 = *(id *)(v15 + 8);
  uint64_t v76 = *(void **)v15;
  uint64_t v17 = *(void *)(v15 + 16);
  uint64_t v18 = *(void *)(v15 + 24);
  uint64_t v19 = v6;
  uint64_t v21 = *(void *)(v15 + 32);
  uint64_t v20 = *(void *)(v15 + 40);
  uint64_t v23 = *(void *)(v15 + 48);
  uint64_t v22 = *(void *)(v15 + 56);
  uint64_t v25 = *(void *)(v15 + 64);
  uint64_t v24 = *(void *)(v15 + 72);
  uint64_t v27 = *(void *)(v15 + 80);
  uint64_t v26 = *(void *)(v15 + 88);
  uint64_t v29 = *(void *)(v15 + 96);
  uint64_t v28 = *(void *)(v15 + 104);
  uint64_t v30 = *(NSObject **)(v15 + 112);
  char v63 = *(unsigned char *)(v15 + 120);
  __dst[0] = v83;
  __dst[1] = v3;
  __dst[2] = v84;
  uint64_t v31 = v4;
  uint64_t v32 = v27;
  __dst[3] = v31;
  __dst[4] = v85;
  uint64_t v33 = v5;
  uint64_t v34 = v25;
  uint64_t v78 = v33;
  uint64_t v79 = v3;
  __dst[5] = v33;
  __dst[6] = v86;
  uint64_t v81 = v19;
  uint64_t v82 = v17;
  __dst[7] = v19;
  __dst[8] = v87;
  __dst[9] = v7;
  __dst[10] = *(void *)type;
  __dst[11] = v8;
  __dst[12] = log;
  __dst[13] = v9;
  uint64_t v71 = v18;
  *(void *)uint64_t v72 = v16;
  id v91 = v16;
  uint64_t v92 = v17;
  uint64_t v93 = v18;
  uint64_t v94 = v21;
  uint64_t v69 = v22;
  uint64_t v70 = v20;
  uint64_t v95 = v20;
  uint64_t v96 = v23;
  uint64_t v97 = v22;
  uint64_t v98 = v25;
  uint64_t v67 = v26;
  uint64_t v68 = v24;
  uint64_t v99 = v24;
  uint64_t v100 = v27;
  uint64_t v101 = v26;
  uint64_t v102 = v29;
  uint64_t v66 = v28;
  uint64_t v103 = v28;
  os_log_t v104 = v30;
  uint64_t v80 = v29;
  uint64_t v74 = v30;
  uint64_t v75 = v31;
  if (static MusicSubscriptionOffer.Options.== infix(_:_:)(__dst, &v91))
  {
    uint64_t v73 = v32;
    uint64_t v65 = v23;
    if (qword_2687F4060 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_2351C9E90();
    __swift_project_value_buffer(v35, (uint64_t)qword_2687F5750);
    swift_bridgeObjectRetain();
    id v36 = v76;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    id v77 = v36;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v37 = sub_2351C9E70();
    os_log_type_t v38 = sub_2351CA550();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = swift_slowAlloc();
      uint64_t v62 = (void *)swift_slowAlloc();
      id v61 = (id)swift_slowAlloc();
      id v91 = v61;
      *(_DWORD *)uint64_t v39 = 136446978;
      __dst[0] = v83;
      __dst[1] = v3;
      __dst[2] = v84;
      __dst[3] = v75;
      __dst[4] = v85;
      __dst[5] = v78;
      __dst[6] = v86;
      __dst[7] = v81;
      __dst[8] = v87;
      __dst[9] = v7;
      __dst[10] = *(void *)type;
      __dst[11] = v8;
      __dst[12] = log;
      __dst[13] = v9;
      uint64_t v40 = MusicSubscriptionOffer.Options.description.getter();
      __dst[0] = sub_2351C0DF8(v40, v41, (uint64_t *)&v91);
      sub_2351CA5A0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v39 + 12) = 2114;
      __dst[0] = v77;
      id v42 = v77;
      sub_2351CA5A0();
      *uint64_t v62 = v77;

      *(_WORD *)(v39 + 22) = 2082;
      __dst[0] = *(void *)v72;
      __dst[1] = v82;
      __dst[2] = v71;
      __dst[3] = v21;
      __dst[4] = v70;
      __dst[5] = v65;
      __dst[6] = v69;
      __dst[7] = v34;
      __dst[8] = v68;
      __dst[9] = v73;
      __dst[10] = v67;
      __dst[11] = v80;
      __dst[12] = v66;
      __dst[13] = v74;
      uint64_t v43 = MusicSubscriptionOffer.Options.description.getter();
      __dst[0] = sub_2351C0DF8(v43, v44, (uint64_t *)&v91);
      sub_2351CA5A0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v39 + 32) = 2082;
      LOBYTE(__dst[0]) = v63;
      uint64_t v45 = sub_2351CA490();
      __dst[0] = sub_2351C0DF8(v45, v46, (uint64_t *)&v91);
      sub_2351CA5A0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2351AA000, v37, v38, "Unexpectedly changed presentation context for subscription offer to isPresented: true, options: %{public}s while internal presentation state is .active(%{public}@, %{public}s, %{public}s.", (uint8_t *)v39, 0x2Au);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687F42A0);
      swift_arrayDestroy();
      MEMORY[0x237DD72C0](v62, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x237DD72C0](v61, -1, -1);
      MEMORY[0x237DD72C0](v39, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (qword_2687F4060 != -1) {
      swift_once();
    }
    uint64_t v49 = sub_2351C9E90();
    __swift_project_value_buffer(v49, (uint64_t)qword_2687F5750);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v50 = v21;
    swift_bridgeObjectRetain();
    uint64_t v51 = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v52 = v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v53 = sub_2351C9E70();
    os_log_type_t v54 = sub_2351CA540();
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v55 = v52;
      uint64_t v56 = swift_slowAlloc();
      id v64 = (id)swift_slowAlloc();
      id v91 = v64;
      *(_DWORD *)uint64_t v56 = 136446466;
      __dst[0] = *(void *)v72;
      __dst[1] = v82;
      __dst[2] = v71;
      __dst[3] = v50;
      __dst[4] = v70;
      __dst[5] = v51;
      __dst[6] = v69;
      __dst[7] = v34;
      __dst[8] = v68;
      __dst[9] = v55;
      __dst[10] = v67;
      __dst[11] = v80;
      __dst[12] = v66;
      __dst[13] = v74;
      uint64_t v57 = MusicSubscriptionOffer.Options.description.getter();
      __dst[0] = sub_2351C0DF8(v57, v58, (uint64_t *)&v91);
      sub_2351CA5A0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v56 + 12) = 2082;
      __dst[0] = v83;
      __dst[1] = v79;
      __dst[2] = v84;
      __dst[3] = v75;
      __dst[4] = v85;
      __dst[5] = v78;
      __dst[6] = v86;
      __dst[7] = v81;
      __dst[8] = v87;
      __dst[9] = v7;
      __dst[10] = *(void *)type;
      __dst[11] = v8;
      __dst[12] = log;
      __dst[13] = v9;
      uint64_t v59 = MusicSubscriptionOffer.Options.description.getter();
      __dst[0] = sub_2351C0DF8(v59, v60, (uint64_t *)&v91);
      sub_2351CA5A0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2351AA000, v53, v54, "Updating subscription offer options while the subscription offer is presented is not supported. Attempting to update options from %{public}s to %{public}s.", (uint8_t *)v56, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x237DD72C0](v64, -1, -1);
      MEMORY[0x237DD72C0](v56, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
  }
}

void *sub_2351B9D9C(uint64_t a1, unsigned char *a2)
{
  if (*a2 == 2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4218);
    __n128 result = MEMORY[0x237DD6840](&v3);
    if (v3)
    {
      LOBYTE(v3) = 0;
      return (void *)sub_2351CA2A0();
    }
  }
  return result;
}

void sub_2351B9E30(uint64_t a1, uint64_t a2, const void *a3)
{
  sub_2351BB16C(a2, (uint64_t)v6);
  memcpy(__dst, a3, sizeof(__dst));
  sub_2351BB16C((uint64_t)v6, (uint64_t)v4);
  sub_2351B9E94((uint64_t)v4);
}

void sub_2351B9E94(uint64_t a1)
{
  sub_2351BB16C(a1, (uint64_t)v47);
  memcpy(__dst, v1, sizeof(__dst));
  sub_2351BB16C((uint64_t)v47, (uint64_t)v48);
  int v2 = sub_2351BC5D8((uint64_t)v48);
  if (v2)
  {
    if (v2 == 1)
    {
      uint64_t v3 = *(void *)nullsub_1(v48);
      uint64_t v4 = (void (*)(uint64_t))*((void *)&__dst[8] + 1);
      sub_2351BB16C((uint64_t)v47, (uint64_t)&aBlock);
      id v5 = *(id *)nullsub_1(&aBlock);
      v4(v3);
      sub_2351BC1D4((uint64_t)v47);
    }
    else
    {
      long long v46 = *(_OWORD *)((char *)&__dst[9] + 8);
      long long aBlock = *(_OWORD *)((char *)&__dst[9] + 8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4260);
      sub_2351CA250();
      if (v42 == 1)
      {
        long long aBlock = v46;
        LOBYTE(v42) = 0;
        sub_2351CA260();
      }
      long long aBlock = __dst[0];
      LOBYTE(v30) = __dst[1];
      long long v42 = __dst[0];
      char v43 = __dst[1];
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4218);
      MEMORY[0x237DD6840](&v44);
      if (v44 == 1)
      {
        long long v42 = aBlock;
        char v43 = (char)v30;
        char v44 = 0;
        sub_2351CA2A0();
      }
    }
  }
  else
  {
    uint64_t v6 = nullsub_1(v48);
    int v7 = *(unsigned __int8 *)(v6 + 120);
    if (v7 == 2)
    {
      uint64_t v9 = *(void **)v6;
      uint64_t v10 = *(void *)(v6 + 16);
      uint64_t v27 = *(void *)(v6 + 24);
      uint64_t v28 = *(void *)(v6 + 8);
      uint64_t v11 = *(void *)(v6 + 32);
      uint64_t v12 = *(void *)(v6 + 48);
      uint64_t v26 = *(void *)(v6 + 40);
      uint64_t v13 = *(void *)(v6 + 64);
      uint64_t v14 = *(void *)(v6 + 80);
      uint64_t v23 = *(void *)(v6 + 88);
      uint64_t v24 = *(void *)(v6 + 72);
      uint64_t v15 = *(void *)(v6 + 96);
      uint64_t v22 = *(void *)(v6 + 104);
      uint64_t v16 = *(void *)(v6 + 112);
      uint64_t v34 = *(void *)(v6 + 56);
      uint64_t v25 = v34;
      uint64_t v35 = v13;
      uint64_t v36 = v24;
      uint64_t v37 = v14;
      uint64_t v38 = v23;
      uint64_t v39 = v15;
      uint64_t v40 = v22;
      uint64_t v41 = v16;
      swift_bridgeObjectRetain();
      id v17 = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2351C1B00();
      type metadata accessor for MusicKit_SPI_SKCloudServiceSetupOptionsKey(0);
      sub_2351BCE0C((unint64_t *)&qword_2687F40E0, type metadata accessor for MusicKit_SPI_SKCloudServiceSetupOptionsKey);
      uint64_t v18 = (void *)sub_2351CA410();
      swift_bridgeObjectRelease();
      uint64_t v19 = (void *)swift_allocObject();
      memcpy(v19 + 2, __dst, 0x140uLL);
      v19[42] = v17;
      v19[43] = v28;
      v19[44] = v10;
      v19[45] = v27;
      v19[46] = v11;
      v19[47] = v26;
      v19[48] = v12;
      v19[49] = v25;
      v19[50] = v13;
      v19[51] = v24;
      v19[52] = v14;
      v19[53] = v23;
      v19[54] = v15;
      v19[55] = v22;
      v19[56] = v16;
      uint64_t v32 = sub_2351BC6E0;
      uint64_t v33 = v19;
      *(void *)&long long aBlock = MEMORY[0x263EF8330];
      *((void *)&aBlock + 1) = 1107296256;
      uint64_t v30 = sub_2351BAACC;
      uint64_t v31 = &block_descriptor_1;
      uint64_t v20 = _Block_copy(&aBlock);
      id v21 = v17;
      sub_2351BBE84((uint64_t)__dst);
      swift_release();
      objc_msgSend(v21, sel_musicKit_loadWithOptions_completionHandler_, v18, v20);
      _Block_release(v20);
    }
    else
    {
      if (v7 == 3)
      {
        long long aBlock = *(_OWORD *)((char *)&__dst[9] + 8);
        LOBYTE(v42) = 1;
        uint64_t v8 = &qword_2687F4260;
      }
      else
      {
        long long aBlock = __dst[19];
        LOBYTE(v42) = v7 & 1;
        uint64_t v8 = &qword_2687F4238;
      }
      __swift_instantiateConcreteTypeFromMangledName(v8);
      sub_2351CA260();
      (*((void (**)(void))&__dst[8] + 1))(0);
    }
  }
}

void *sub_2351BA294@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  memcpy(__dst, (const void *)(a1 + 168), 0x88uLL);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4250);
  sub_2351CA270();
  memcpy(__dst, v6, 0x8AuLL);
  char v3 = sub_2351CA110();
  uint64_t v4 = sub_2351C9FC0();
  __n128 result = memcpy((void *)a2, __dst, 0x90uLL);
  *(void *)(a2 + 144) = v4;
  *(unsigned char *)(a2 + 152) = v3;
  return result;
}

uint64_t sub_2351BA324@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4280);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v25[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = &v25[-v13];
  uint64_t v15 = _s20FailureAlertModifierVMa();
  uint64_t v16 = v15 - 8;
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = &v25[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)uint64_t v18 = a1;
  *((void *)v18 + 1) = a2;
  v18[16] = a3;
  v25[15] = 0;
  swift_retain();
  swift_retain();
  sub_2351CA240();
  uint64_t v19 = v26;
  unsigned char v18[24] = v25[16];
  *((void *)v18 + 4) = v19;
  uint64_t v20 = sub_2351CA1F0();
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v20);
  sub_2351BC3BC((uint64_t)v14, (uint64_t)v12);
  sub_2351CA240();
  sub_2351BC424((uint64_t)v14);
  id v21 = (uint64_t *)&v18[*(int *)(v16 + 36)];
  *id v21 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4288);
  swift_storeEnumTagMultiPayload();
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4210);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(a4, v4, v22);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4290);
  return sub_2351BC574((uint64_t)v18, a4 + *(int *)(v23 + 36));
}

void sub_2351BA548(char a1, void *a2, uint64_t a3, void *a4, uint64_t *a5)
{
  uint64_t v24 = a5[1];
  uint64_t v25 = *a5;
  uint64_t v22 = a5[3];
  uint64_t v23 = a5[2];
  uint64_t v20 = a5[5];
  uint64_t v21 = a5[4];
  uint64_t v18 = a5[7];
  uint64_t v19 = a5[6];
  uint64_t v7 = a5[9];
  uint64_t v17 = a5[8];
  uint64_t v8 = a5[10];
  uint64_t v9 = a5[11];
  uint64_t v10 = (const void *)(a3 + 168);
  uint64_t v11 = a5[12];
  uint64_t v12 = a5[13];
  memcpy(__dst, (const void *)(a3 + 168), 0x88uLL);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4250);
  sub_2351CA250();
  sub_2351BB16C((uint64_t)v30, (uint64_t)v32);
  sub_2351BB16C((uint64_t)v32, (uint64_t)v33);
  if (sub_2351BC5D8((uint64_t)v33))
  {
    sub_2351BC1D4((uint64_t)v32);
  }
  else
  {
    uint64_t v13 = nullsub_1(v33);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(unsigned char *)(v13 + 120) == 2)
    {
      if (a2)
      {
        memcpy(__dst, (const void *)a3, sizeof(__dst));
        id v14 = a2;
        sub_2351BA810(a4, a2);
      }
      else if (a1)
      {
        v30[0] = a4;
        v30[1] = v25;
        v30[2] = v24;
        v30[3] = v23;
        v30[4] = v22;
        v30[5] = v21;
        v30[6] = v20;
        v30[7] = v19;
        v30[8] = v18;
        v30[9] = v17;
        v30[10] = v7;
        v30[11] = v8;
        v30[12] = v9;
        v30[13] = v11;
        v30[14] = v12;
        char v31 = 3;
        sub_2351BC6F0((uint64_t)v30);
        memcpy(__dst, v10, 0x88uLL);
        sub_2351BB16C((uint64_t)v30, (uint64_t)v29);
        id v15 = a4;
        sub_2351BC6F8((uint64_t)a5);
        sub_2351CA260();
      }
      else
      {
        sub_2351CA650();
        __break(1u);
      }
    }
  }
}

uint64_t sub_2351BA810(void *a1, void *a2)
{
  uint64_t v5 = v2[3];
  uint64_t v4 = v2[4];
  uint64_t v6 = v2[6];
  uint64_t v25 = v2[7];
  uint64_t v26 = v2[5];
  uint64_t v30 = v2[10];
  uint64_t v31 = v2[8];
  uint64_t v23 = v2[11];
  uint64_t v24 = v2[9];
  uint64_t v27 = v2[12];
  uint64_t v29 = v2[14];
  uint64_t v7 = v2[16];
  uint64_t v21 = v2[15];
  uint64_t v22 = v2[13];
  sub_2351BB16C((uint64_t)(v2 + 21), (uint64_t)v37);
  uint64_t v8 = v2[37];
  uint64_t v9 = (void *)sub_2351C9DA0();
  id v10 = objc_msgSend(v9, sel_domain);
  uint64_t v11 = sub_2351CA480();
  uint64_t v13 = v12;

  if (v11 == sub_2351CA480() && v13 == v14)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v16 = sub_2351CA690();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0) {
      goto LABEL_9;
    }
  }
  if (!objc_msgSend(v9, sel_code))
  {
    sub_2351BC870();
    id v18 = sub_2351BAB44(0xD000000000000022, 0x80000002351CC710);
    if (!v18)
    {
      v34[0] = a1;
      v34[1] = v5;
      v34[2] = v4;
      v34[3] = v26;
      v34[4] = v6;
      v34[5] = v25;
      v34[6] = v31;
      v34[7] = v24;
      v34[8] = v30;
      v34[9] = v23;
      v34[10] = v27;
      v34[11] = v22;
      v34[12] = v29;
      v34[13] = v21;
      v34[14] = v7;
      char v35 = 0;
      sub_2351BC6F0((uint64_t)v34);
      sub_2351BB16C((uint64_t)v37, (uint64_t)__src);
      __src[16] = v8;
      memcpy(__dst, __src, sizeof(__dst));
      sub_2351BB16C((uint64_t)v34, (uint64_t)v32);
      swift_bridgeObjectRetain();
      id v19 = a1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2351BC790((uint64_t)__src);
      goto LABEL_12;
    }
  }
LABEL_9:
  v34[0] = a2;
  sub_2351BC784((uint64_t)v34);
  sub_2351BB16C((uint64_t)v37, (uint64_t)__src);
  __src[16] = v8;
  memcpy(__dst, __src, sizeof(__dst));
  sub_2351BB16C((uint64_t)v34, (uint64_t)v32);
  sub_2351BC790((uint64_t)__src);
  id v17 = a2;
LABEL_12:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4250);
  sub_2351CA260();

  return sub_2351BC800((uint64_t)__src);
}

void sub_2351BAACC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_2351BAB44(uint64_t a1, uint64_t a2)
{
  v7[1] = *(id *)MEMORY[0x263EF8340];
  if (a2)
  {
    int v2 = (void *)sub_2351CA450();
    swift_bridgeObjectRelease();
  }
  else
  {
    int v2 = 0;
  }
  v7[0] = 0;
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_extensionWithIdentifier_error_, v2, v7);

  if (v3)
  {
    id v4 = v7[0];
  }
  else
  {
    id v5 = v7[0];
    sub_2351C9DB0();

    swift_willThrow();
  }
  return v3;
}

uint64_t sub_2351BAC28(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 == *a2)
  {
    uint64_t v4 = *((void *)a2 + 3);
    uint64_t v3 = *((void *)a2 + 4);
    long long v5 = *(_OWORD *)(a2 + 8);
    uint64_t v7 = *((void *)a1 + 3);
    uint64_t v6 = *((void *)a1 + 4);
    long long v21 = *(_OWORD *)(a1 + 8);
    uint64_t v22 = v7;
    uint64_t v23 = v6;
    long long v8 = *(_OWORD *)(a1 + 56);
    long long v24 = *(_OWORD *)(a1 + 40);
    long long v25 = v8;
    long long v9 = *(_OWORD *)(a1 + 88);
    long long v26 = *(_OWORD *)(a1 + 72);
    long long v27 = v9;
    long long v28 = *(_OWORD *)(a1 + 104);
    long long v13 = v5;
    uint64_t v14 = v4;
    uint64_t v15 = v3;
    long long v10 = *(_OWORD *)(a2 + 56);
    long long v16 = *(_OWORD *)(a2 + 40);
    long long v17 = v10;
    long long v11 = *(_OWORD *)(a2 + 88);
    long long v18 = *(_OWORD *)(a2 + 72);
    long long v19 = v11;
    long long v20 = *(_OWORD *)(a2 + 104);
    char v2 = static MusicSubscriptionOffer.Options.== infix(_:_:)(&v21, &v13);
  }
  else
  {
    char v2 = 0;
  }
  return v2 & 1;
}

uint64_t sub_2351BACCC()
{
  return MusicSubscriptionOffer.Options.hash(into:)();
}

uint64_t sub_2351BAD6C()
{
  return sub_2351CA730();
}

uint64_t sub_2351BAE38()
{
  return sub_2351CA730();
}

uint64_t sub_2351BAEFC()
{
  return sub_2351C9EF0();
}

uint64_t View.musicSubscriptionOffer(isPresented:options:onLoadCompletion:)(uint64_t a1, uint64_t a2, char a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a4[1];
  uint64_t v10 = a4[3];
  uint64_t v28 = a4[2];
  uint64_t v29 = *a4;
  uint64_t v26 = a4[6];
  uint64_t v27 = a4[4];
  uint64_t v19 = a4[7];
  uint64_t v20 = a4[5];
  uint64_t v11 = a4[9];
  uint64_t v12 = a4[11];
  uint64_t v24 = a4[10];
  uint64_t v25 = a4[8];
  uint64_t v13 = a4[13];
  uint64_t v23 = a4[12];
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2351CA240();
  char v14 = v37[0];
  uint64_t v15 = v37[1];
  sub_2351BB148((uint64_t)v35);
  sub_2351BB16C((uint64_t)v35, (uint64_t)v37);
  sub_2351CA240();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F41E8);
  sub_2351CA240();
  char v16 = v37[0];
  uint64_t v17 = v37[1];
  v37[0] = a1;
  v37[1] = a2;
  LOBYTE(v37[2]) = a3;
  v37[3] = v29;
  v37[4] = v9;
  v37[5] = v28;
  v37[6] = v10;
  v37[7] = v27;
  v37[8] = v20;
  v37[9] = v26;
  v37[10] = v19;
  v37[11] = v25;
  v37[12] = v11;
  v37[13] = v24;
  v37[14] = v12;
  v37[15] = v23;
  v37[16] = v13;
  v37[17] = a5;
  v37[18] = a6;
  LOBYTE(v37[19]) = v14;
  v37[20] = v15;
  memcpy(&v37[21], __src, 0x88uLL);
  LOBYTE(v37[38]) = v16;
  v37[39] = v17;
  memcpy(__dst, v37, sizeof(__dst));
  MEMORY[0x237DD6740](__dst, a7, &type metadata for MusicSubscriptionOffer.SheetPresentationModifier, a8);
  return sub_2351BB1C8((uint64_t)v37);
}

double sub_2351BB148(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 105) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(unsigned char *)(a1 + 121) = 2;
  return result;
}

uint64_t sub_2351BB16C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2351BB1C8(uint64_t a1)
{
  uint64_t v14 = *(void *)(a1 + 176);
  uint64_t v15 = *(void **)(a1 + 168);
  uint64_t v12 = *(void *)(a1 + 192);
  uint64_t v13 = *(void *)(a1 + 184);
  uint64_t v10 = *(void *)(a1 + 208);
  uint64_t v11 = *(void *)(a1 + 200);
  uint64_t v9 = *(void *)(a1 + 216);
  long long v7 = *(_OWORD *)(a1 + 232);
  long long v6 = *(_OWORD *)(a1 + 248);
  long long v5 = *(_OWORD *)(a1 + 264);
  uint64_t v2 = *(void *)(a1 + 280);
  __int16 v3 = *(_WORD *)(a1 + 288);
  uint64_t v8 = *(void *)(a1 + 224);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_2351BB344(v15, v14, v13, v12, v11, v10, v9, v8, v7, *((uint64_t *)&v7 + 1), v6, *((uint64_t *)&v6 + 1), v5, *((uint64_t *)&v5 + 1), v2, v3, SHIBYTE(v3));
  swift_release();
  swift_release();
  return a1;
}

void sub_2351BB344(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, char a17)
{
  if (a17 == 1)
  {
  }
  else if (!a17)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

ValueMetadata *type metadata accessor for MusicSubscriptionOffer()
{
  return &type metadata for MusicSubscriptionOffer;
}

uint64_t sub_2351BB43C()
{
  return swift_getWitnessTable();
}

unint64_t sub_2351BB4A0()
{
  unint64_t result = qword_2687F41F0;
  if (!qword_2687F41F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F41F0);
  }
  return result;
}

id sub_2351BB4EC(id result, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, char a17)
{
  id v17 = result;
  if (a17 == 1)
  {
    return result;
  }
  else if (!a17)
  {
    swift_bridgeObjectRetain();
    id v18 = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (id)swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for MusicSubscriptionOffer.SheetPresentationModifier(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 168);
  uint64_t v3 = *(void *)(a1 + 176);
  a1 += 168;
  sub_2351BB344(v2, v3, *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(_WORD *)(a1 + 120), HIBYTE(*(_WORD *)(a1 + 120)));
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for MusicSubscriptionOffer.SheetPresentationModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  uint64_t v9 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v9;
  uint64_t v10 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v10;
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  uint64_t v11 = *(void *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(void *)(a1 + 144) = v11;
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  uint64_t v12 = *(void **)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  uint64_t v25 = *(void *)(a2 + 176);
  uint64_t v26 = v12;
  uint64_t v23 = *(void *)(a2 + 192);
  uint64_t v24 = *(void *)(a2 + 184);
  uint64_t v21 = *(void *)(a2 + 208);
  uint64_t v22 = *(void *)(a2 + 200);
  uint64_t v19 = *(void *)(a2 + 224);
  uint64_t v20 = *(void *)(a2 + 216);
  uint64_t v29 = *(void *)(a2 + 240);
  uint64_t v30 = *(void *)(a2 + 232);
  uint64_t v13 = *(void *)(a2 + 264);
  uint64_t v27 = *(void *)(a2 + 256);
  uint64_t v28 = *(void *)(a2 + 248);
  uint64_t v15 = *(void *)(a2 + 272);
  uint64_t v14 = *(void *)(a2 + 280);
  char v16 = *(unsigned char *)(a2 + 288);
  char v17 = *(unsigned char *)(a2 + 289);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_2351BB4EC(v26, v25, v24, v23, v22, v21, v20, v19, v30, v29, v28, v27, v13, v15, v14, v16, v17);
  *(void *)(a1 + 168) = v26;
  *(void *)(a1 + 176) = v25;
  *(void *)(a1 + 184) = v24;
  *(void *)(a1 + 192) = v23;
  *(void *)(a1 + 200) = v22;
  *(void *)(a1 + 208) = v21;
  *(void *)(a1 + 216) = v20;
  *(void *)(a1 + 224) = v19;
  *(void *)(a1 + 232) = v30;
  *(void *)(a1 + 240) = v29;
  *(void *)(a1 + 248) = v28;
  *(void *)(a1 + 256) = v27;
  *(void *)(a1 + 264) = v13;
  *(void *)(a1 + 272) = v15;
  *(void *)(a1 + 280) = v14;
  *(unsigned char *)(a1 + 288) = v16;
  *(unsigned char *)(a1 + 289) = v17;
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  *(unsigned char *)(a1 + 304) = *(unsigned char *)(a2 + 304);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for MusicSubscriptionOffer.SheetPresentationModifier(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v4;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_retain();
  swift_release();
  uint64_t v5 = *(void **)(a2 + 168);
  uint64_t v6 = *(void *)(a2 + 176);
  uint64_t v7 = *(void *)(a2 + 184);
  uint64_t v8 = *(void *)(a2 + 192);
  uint64_t v9 = *(void *)(a2 + 200);
  uint64_t v10 = *(void *)(a2 + 208);
  uint64_t v11 = *(void *)(a2 + 216);
  uint64_t v12 = *(void *)(a2 + 224);
  uint64_t v27 = *(void *)(a2 + 232);
  uint64_t v28 = *(void *)(a2 + 240);
  uint64_t v29 = *(void *)(a2 + 248);
  uint64_t v30 = *(void *)(a2 + 256);
  uint64_t v31 = *(void *)(a2 + 264);
  uint64_t v32 = *(void *)(a2 + 272);
  uint64_t v33 = *(void *)(a2 + 280);
  char v34 = *(unsigned char *)(a2 + 288);
  char v35 = *(unsigned char *)(a2 + 289);
  sub_2351BB4EC(v5, v6, v7, v8, v9, v10, v11, v12, v27, v28, v29, v30, v31, v32, v33, v34, v35);
  uint64_t v13 = *(void **)(a1 + 168);
  uint64_t v14 = *(void *)(a1 + 176);
  uint64_t v15 = *(void *)(a1 + 184);
  uint64_t v16 = *(void *)(a1 + 192);
  uint64_t v17 = *(void *)(a1 + 200);
  uint64_t v18 = *(void *)(a1 + 208);
  uint64_t v19 = *(void *)(a1 + 216);
  uint64_t v20 = *(void *)(a1 + 224);
  long long v21 = *(_OWORD *)(a1 + 232);
  long long v22 = *(_OWORD *)(a1 + 248);
  long long v23 = *(_OWORD *)(a1 + 264);
  uint64_t v24 = *(void *)(a1 + 280);
  __int16 v25 = *(_WORD *)(a1 + 288);
  *(void *)(a1 + 168) = v5;
  *(void *)(a1 + 176) = v6;
  *(void *)(a1 + 184) = v7;
  *(void *)(a1 + 192) = v8;
  *(void *)(a1 + 200) = v9;
  *(void *)(a1 + 208) = v10;
  *(void *)(a1 + 216) = v11;
  *(void *)(a1 + 224) = v12;
  *(void *)(a1 + 232) = v27;
  *(void *)(a1 + 240) = v28;
  *(void *)(a1 + 248) = v29;
  *(void *)(a1 + 256) = v30;
  *(void *)(a1 + 264) = v31;
  *(void *)(a1 + 272) = v32;
  *(void *)(a1 + 280) = v33;
  *(unsigned char *)(a1 + 288) = v34;
  *(unsigned char *)(a1 + 289) = v35;
  sub_2351BB344(v13, v14, v15, v16, v17, v18, v19, v20, v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, *((uint64_t *)&v23 + 1), v24, v25, SHIBYTE(v25));
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 304) = *(unsigned char *)(a2 + 304);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy320_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x140uLL);
}

uint64_t assignWithTake for MusicSubscriptionOffer.SheetPresentationModifier(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  swift_release();
  *(void *)(a1 + 8) = v2[1];
  swift_release();
  *(unsigned char *)(a1 + 16) = *((unsigned char *)v2 + 16);
  uint64_t v4 = v2[4];
  *(void *)(a1 + 24) = v2[3];
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = v2[6];
  *(void *)(a1 + 40) = v2[5];
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = v2[8];
  *(void *)(a1 + 56) = v2[7];
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = v2[10];
  *(void *)(a1 + 72) = v2[9];
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = v2[12];
  *(void *)(a1 + 88) = v2[11];
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = v2[14];
  *(void *)(a1 + 104) = v2[13];
  *(void *)(a1 + 112) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = v2[16];
  *(void *)(a1 + 120) = v2[15];
  *(void *)(a1 + 128) = v10;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(v2 + 17);
  swift_release();
  *(unsigned char *)(a1 + 152) = *((unsigned char *)v2 + 152);
  *(void *)(a1 + 160) = v2[20];
  swift_release();
  long long v11 = *(_OWORD *)(v2 + 21);
  v2 += 21;
  uint64_t v12 = v2[14];
  __int16 v13 = *((_WORD *)v2 + 60);
  uint64_t v14 = *(void **)(a1 + 168);
  uint64_t v15 = *(void *)(a1 + 176);
  uint64_t v16 = *(void *)(a1 + 184);
  uint64_t v17 = *(void *)(a1 + 192);
  uint64_t v18 = *(void *)(a1 + 200);
  uint64_t v19 = *(void *)(a1 + 208);
  uint64_t v20 = *(void *)(a1 + 216);
  uint64_t v21 = *(void *)(a1 + 224);
  long long v22 = *(_OWORD *)(a1 + 232);
  long long v23 = *(_OWORD *)(a1 + 248);
  *(_OWORD *)(a1 + 168) = v11;
  long long v24 = *((_OWORD *)v2 + 2);
  *(_OWORD *)(a1 + 184) = *((_OWORD *)v2 + 1);
  *(_OWORD *)(a1 + 200) = v24;
  long long v25 = *((_OWORD *)v2 + 4);
  *(_OWORD *)(a1 + 216) = *((_OWORD *)v2 + 3);
  *(_OWORD *)(a1 + 232) = v25;
  long long v26 = *((_OWORD *)v2 + 6);
  *(_OWORD *)(a1 + 248) = *((_OWORD *)v2 + 5);
  long long v27 = *(_OWORD *)(a1 + 264);
  uint64_t v28 = *(void *)(a1 + 280);
  __int16 v29 = *(_WORD *)(a1 + 288);
  *(_OWORD *)(a1 + 264) = v26;
  *(void *)(a1 + 280) = v12;
  *(_WORD *)(a1 + 288) = v13;
  sub_2351BB344(v14, v15, v16, v17, v18, v19, v20, v21, v22, *((uint64_t *)&v22 + 1), v23, *((uint64_t *)&v23 + 1), v27, *((uint64_t *)&v27 + 1), v28, v29, SHIBYTE(v29));
  *(void *)(a1 + 296) = v2[16];
  swift_release();
  *(unsigned char *)(a1 + 304) = *((unsigned char *)v2 + 136);
  *(void *)(a1 + 312) = v2[18];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicSubscriptionOffer.SheetPresentationModifier(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 320))
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

uint64_t storeEnumTagSinglePayload for MusicSubscriptionOffer.SheetPresentationModifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 312) = 0;
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
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 320) = 1;
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
    *(unsigned char *)(result + 320) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicSubscriptionOffer.SheetPresentationModifier()
{
  return &type metadata for MusicSubscriptionOffer.SheetPresentationModifier;
}

uint64_t sub_2351BBE68()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2351BBE84(uint64_t a1)
{
  uint64_t v14 = *(void *)(a1 + 176);
  uint64_t v15 = *(void **)(a1 + 168);
  uint64_t v12 = *(void *)(a1 + 192);
  uint64_t v13 = *(void *)(a1 + 184);
  uint64_t v10 = *(void *)(a1 + 208);
  uint64_t v11 = *(void *)(a1 + 200);
  uint64_t v9 = *(void *)(a1 + 216);
  *(void *)uint64_t v8 = *(void *)(a1 + 224);
  *(_OWORD *)uint64_t v7 = *(_OWORD *)(a1 + 232);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)(a1 + 248);
  long long v5 = *(_OWORD *)(a1 + 264);
  uint64_t v2 = *(void *)(a1 + 280);
  __int16 v3 = *(_WORD *)(a1 + 288);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2351BB4EC(v15, v14, v13, v12, v11, v10, v9, v8[0], v7[0], v7[1], v6[0], v6[1], v5, *((uint64_t *)&v5 + 1), v2, v3, SHIBYTE(v3));
  swift_retain();
  swift_retain();
  return a1;
}

double sub_2351BC008(int a1, char *a2)
{
  *(void *)&double result = sub_2351B8EF8(a1, a2, (void *)(v2 + 16)).n128_u64[0];
  return result;
}

unint64_t sub_2351BC010()
{
  unint64_t result = qword_2687F4228;
  if (!qword_2687F4228)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F4220);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F4228);
  }
  return result;
}

unint64_t sub_2351BC064()
{
  unint64_t result = qword_2687F4230;
  if (!qword_2687F4230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F4230);
  }
  return result;
}

void *sub_2351BC0B4(uint64_t a1, unsigned char *a2)
{
  return sub_2351B9D9C(a1, a2);
}

unint64_t sub_2351BC0BC()
{
  unint64_t result = qword_2687F4240;
  if (!qword_2687F4240)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F41E8);
    sub_2351BC130();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F4240);
  }
  return result;
}

unint64_t sub_2351BC130()
{
  unint64_t result = qword_2687F4248;
  if (!qword_2687F4248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F4248);
  }
  return result;
}

void sub_2351BC180(uint64_t a1, uint64_t a2)
{
  sub_2351B9E30(a1, a2, (const void *)(v2 + 16));
}

unint64_t sub_2351BC188()
{
  unint64_t result = qword_2687F4258;
  if (!qword_2687F4258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F4258);
  }
  return result;
}

uint64_t sub_2351BC1D4(uint64_t a1)
{
  return a1;
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_0_2();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 336, 7);
}

void *sub_2351BC2EC@<X0>(uint64_t a1@<X8>)
{
  return sub_2351BA294(v1 + 16, a1);
}

unint64_t sub_2351BC2F4()
{
  unint64_t result = qword_2687F4270;
  if (!qword_2687F4270)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F4268);
    sub_2351BC370();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F4270);
  }
  return result;
}

unint64_t sub_2351BC370()
{
  unint64_t result = qword_2687F4278;
  if (!qword_2687F4278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F4278);
  }
  return result;
}

uint64_t sub_2351BC3BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4280);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2351BC424(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4280);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2351BC484()
{
  return sub_2351C9FE0();
}

uint64_t sub_2351BC4A8(uint64_t a1)
{
  uint64_t v2 = sub_2351C9F40();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2351C9FF0();
}

uint64_t sub_2351BC574(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s20FailureAlertModifierVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2351BC5D8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 121) <= 1u) {
    return *(unsigned __int8 *)(a1 + 121);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_2351BC5F0()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_0_2();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 456, 7);
}

void sub_2351BC6E0(char a1, void *a2)
{
  sub_2351BA548(a1, a2, v2 + 16, *(void **)(v2 + 336), (uint64_t *)(v2 + 344));
}

uint64_t sub_2351BC6F0(uint64_t result)
{
  *(unsigned char *)(result + 121) = 0;
  return result;
}

uint64_t sub_2351BC6F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_2351BC784(uint64_t result)
{
  *(unsigned char *)(result + 121) = 1;
  return result;
}

uint64_t sub_2351BC790(uint64_t a1)
{
  return a1;
}

uint64_t sub_2351BC800(uint64_t a1)
{
  return a1;
}

unint64_t sub_2351BC870()
{
  unint64_t result = qword_2687F4298;
  if (!qword_2687F4298)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2687F4298);
  }
  return result;
}

uint64_t destroy for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  uint64_t v9 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy120_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x78uLL);
}

uint64_t assignWithTake for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 120))
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
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext(uint64_t result, int a2, int a3)
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
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext()
{
  return &type metadata for MusicSubscriptionOffer.SheetPresentationModifier.PresentationContext;
}

unint64_t sub_2351BCC34()
{
  unint64_t result = qword_2687F42A8;
  if (!qword_2687F42A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F4290);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F4208);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F4268);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F4200);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F41F8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F41E8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F4220);
    sub_2351BC010();
    sub_2351BC064();
    swift_getOpaqueTypeConformance2();
    sub_2351BC0BC();
    swift_getOpaqueTypeConformance2();
    sub_2351BC188();
    swift_getOpaqueTypeConformance2();
    sub_2351BC2F4();
    swift_getOpaqueTypeConformance2();
    sub_2351BCE0C(&qword_2687F42B0, (void (*)(uint64_t))_s20FailureAlertModifierVMa);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F42A8);
  }
  return result;
}

uint64_t sub_2351BCE0C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t ArtworkImage._Proxy.artwork.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2351CA400();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

double ArtworkImage._Proxy.size.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for ArtworkImage._Proxy() + 20));
}

uint64_t type metadata accessor for ArtworkImage._Proxy()
{
  uint64_t result = qword_26AD83198;
  if (!qword_26AD83198) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *ArtworkImage._Proxy.image.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for ArtworkImage._Proxy() + 24));
  id v2 = v1;
  return v1;
}

BOOL static ArtworkImage._Proxy.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_2351CA3F0() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for ArtworkImage._Proxy();
  uint64_t v5 = *(int *)(v4 + 20);
  double v6 = *(double *)(a1 + v5);
  double v7 = *(double *)(a1 + v5 + 8);
  uint64_t v8 = (double *)(a2 + v5);
  if (v6 != *v8 || v7 != v8[1]) {
    return 0;
  }
  uint64_t v11 = *(int *)(v4 + 24);
  uint64_t v12 = *(void **)(a1 + v11);
  uint64_t v13 = *(void **)(a2 + v11);
  if (v12)
  {
    if (v13)
    {
      sub_2351BD020();
      id v14 = v13;
      id v15 = v12;
      char v16 = sub_2351CA580();

      if (v16) {
        return 1;
      }
    }
    return 0;
  }
  return !v13;
}

unint64_t sub_2351BD020()
{
  unint64_t result = qword_26AD83180;
  if (!qword_26AD83180)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AD83180);
  }
  return result;
}

uint64_t *_s6_ProxyVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2351CA400();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
    uint64_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

void _s6_ProxyVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 24));
}

uint64_t _s6_ProxyVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t _s6_ProxyVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  id v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = *(void **)(a1 + v10);
  uint64_t v12 = *(void **)(a2 + v10);
  *(void *)(a1 + v10) = v12;
  id v13 = v12;

  return a1;
}

uint64_t _s6_ProxyVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t _s6_ProxyVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t _s6_ProxyVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2351BD400);
}

uint64_t sub_2351BD400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2351CA400();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    int v10 = v9 - 1;
    if (v10 < 0) {
      int v10 = -1;
    }
    return (v10 + 1);
  }
}

uint64_t _s6_ProxyVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2351BD4AC);
}

void sub_2351BD4AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_2351CA400();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = a2;
  }
}

uint64_t sub_2351BD534()
{
  uint64_t result = sub_2351CA400();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *_s18ProxyPreferenceKeyVMa()
{
  return &_s18ProxyPreferenceKeyVN;
}

uint64_t sub_2351BD5E4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
  __swift_allocate_value_buffer(v0, qword_2687F5720);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2687F5720);
  uint64_t v2 = type metadata accessor for ArtworkImage._Proxy();

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
}

uint64_t sub_2351BD658()
{
  if (qword_2687F4050 != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);

  return __swift_project_value_buffer(v0, (uint64_t)qword_2687F5720);
}

uint64_t sub_2351BD6C0(uint64_t a1, void (*a2)(void))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v12 - v8;
  sub_2351BD81C(a1, (uint64_t)v7);
  uint64_t v10 = type metadata accessor for ArtworkImage._Proxy();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v10) == 1)
  {
    a2();
    sub_2351AFE54((uint64_t)v7);
  }
  else
  {
    sub_2351BD884((uint64_t)v7, (uint64_t)v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v10);
  }
  return sub_2351BD81C((uint64_t)v9, a1);
}

uint64_t sub_2351BD7D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2351BD658();

  return sub_2351B0DFC(v2, a1);
}

uint64_t sub_2351BD81C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2351BD884(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ArtworkImage._Proxy();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2351BD8E8(uint64_t a1)
{
  return sub_2351BD92C(a1, qword_2687F5738);
}

uint64_t sub_2351BD908(uint64_t a1)
{
  return sub_2351BD92C(a1, qword_2687F5750);
}

uint64_t sub_2351BD92C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2351C9E90();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2351C9E80();
}

void *sub_2351BD9A4(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *a1 = *a2;
    a1 = (void *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2351CA400();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    memcpy((char *)a1 + v8, (char *)a2 + v8, 0x60uLL);
    uint64_t v9 = a3[7];
    uint64_t v10 = a3[8];
    uint64_t v11 = (void *)((char *)a1 + v9);
    uint64_t v12 = (void *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    id v14 = (void *)((char *)a1 + v10);
    id v15 = (void *)((char *)a2 + v10);
    uint64_t v16 = v15[1];
    *id v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = a3[10];
    *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = *(void *)((char *)a2 + v17);
    char v20 = *((unsigned char *)a2 + v17 + 8);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2351BDBAC(v19, v20);
    *(void *)uint64_t v18 = v19;
    v18[8] = v20;
    uint64_t v21 = a3[11];
    long long v22 = (char *)a1 + v21;
    long long v23 = (char *)a2 + v21;
    if (*((unsigned char *)a2 + v21 + 40))
    {
      uint64_t v24 = *((void *)v23 + 3);
      if (v24)
      {
        uint64_t v25 = *((void *)v23 + 4);
        *((void *)v22 + 3) = v24;
        *((void *)v22 + 4) = v25;
        (**(void (***)(char *))(v24 - 8))(v22);
      }
      else
      {
        long long v27 = *((_OWORD *)v23 + 1);
        *(_OWORD *)long long v22 = *(_OWORD *)v23;
        *((_OWORD *)v22 + 1) = v27;
        *((void *)v22 + 4) = *((void *)v23 + 4);
      }
      v22[40] = 1;
    }
    else
    {
      *(void *)long long v22 = *(void *)v23;
      v22[40] = 0;
      swift_retain();
    }
    uint64_t v28 = a3[12];
    __int16 v29 = (char *)a1 + v28;
    uint64_t v30 = (char *)a2 + v28;
    uint64_t v31 = *(void *)v30;
    char v32 = v30[8];
    j__swift_retain();
    *(void *)__int16 v29 = v31;
    v29[8] = v32;
  }
  return a1;
}

uint64_t sub_2351BDBAC(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2351BDBBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2351BDCA0(*(void *)(a1 + *(int *)(a2 + 40)), *(unsigned char *)(a1 + *(int *)(a2 + 40) + 8));
  uint64_t v5 = a1 + *(int *)(a2 + 44);
  if (*(unsigned char *)(v5 + 40))
  {
    if (*(void *)(v5 + 24)) {
      __swift_destroy_boxed_opaque_existential_1(v5);
    }
  }
  else
  {
    swift_release();
  }

  return j__swift_release();
}

uint64_t sub_2351BDCA0(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2351BDCB0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  memcpy((void *)(a1 + v7), (const void *)(a2 + v7), 0x60uLL);
  uint64_t v8 = a3[7];
  uint64_t v9 = a3[8];
  uint64_t v10 = (void *)(a1 + v8);
  uint64_t v11 = (void *)(a2 + v8);
  uint64_t v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = (void *)(a1 + v9);
  id v14 = (void *)(a2 + v9);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = *(void *)(a2 + v16);
  char v19 = *(unsigned char *)(a2 + v16 + 8);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2351BDBAC(v18, v19);
  *(void *)uint64_t v17 = v18;
  *(unsigned char *)(v17 + 8) = v19;
  uint64_t v20 = a3[11];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  if (*(unsigned char *)(a2 + v20 + 40))
  {
    uint64_t v23 = *(void *)(v22 + 24);
    if (v23)
    {
      uint64_t v24 = *(void *)(v22 + 32);
      *(void *)(v21 + 24) = v23;
      *(void *)(v21 + 32) = v24;
      (**(void (***)(uint64_t))(v23 - 8))(v21);
    }
    else
    {
      long long v25 = *(_OWORD *)(v22 + 16);
      *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
      *(_OWORD *)(v21 + 16) = v25;
      *(void *)(v21 + 32) = *(void *)(v22 + 32);
    }
    *(unsigned char *)(v21 + 40) = 1;
  }
  else
  {
    *(void *)uint64_t v21 = *(void *)v22;
    *(unsigned char *)(v21 + 40) = 0;
    swift_retain();
  }
  uint64_t v26 = a3[12];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = (uint64_t *)(a2 + v26);
  uint64_t v29 = *v28;
  char v30 = *((unsigned char *)v28 + 8);
  j__swift_retain();
  *(void *)uint64_t v27 = v29;
  *(unsigned char *)(v27 + 8) = v30;
  return a1;
}

uint64_t sub_2351BDE68(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_retain();
  swift_release();
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)uint64_t v8 = *(void *)v9;
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  uint64_t v10 = *(void *)(v9 + 16);
  *(unsigned char *)(v8 + 24) = *(unsigned char *)(v9 + 24);
  *(void *)(v8 + 16) = v10;
  uint64_t v11 = *(void *)(v9 + 32);
  *(unsigned char *)(v8 + 40) = *(unsigned char *)(v9 + 40);
  *(void *)(v8 + 32) = v11;
  uint64_t v12 = *(void *)(v9 + 48);
  *(unsigned char *)(v8 + 56) = *(unsigned char *)(v9 + 56);
  *(void *)(v8 + 48) = v12;
  *(unsigned char *)(v8 + 57) = *(unsigned char *)(v9 + 57);
  *(void *)(v8 + 64) = *(void *)(v9 + 64);
  *(void *)(v8 + 72) = *(void *)(v9 + 72);
  *(void *)(v8 + 80) = *(void *)(v9 + 80);
  *(void *)(v8 + 88) = *(void *)(v9 + 88);
  uint64_t v13 = a3[7];
  id v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *id v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  void *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v19 = a3[10];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = *(void *)v21;
  char v23 = *(unsigned char *)(v21 + 8);
  sub_2351BDBAC(*(void *)v21, v23);
  uint64_t v24 = *(void *)v20;
  char v25 = *(unsigned char *)(v20 + 8);
  *(void *)uint64_t v20 = v22;
  *(unsigned char *)(v20 + 8) = v23;
  sub_2351BDCA0(v24, v25);
  if (a1 != a2)
  {
    uint64_t v26 = a3[11];
    uint64_t v27 = a1 + v26;
    uint64_t v28 = (long long *)(a2 + v26);
    sub_2351B490C(a1 + v26, &qword_26AD830C8);
    if (*((unsigned char *)v28 + 40))
    {
      uint64_t v29 = *((void *)v28 + 3);
      if (v29)
      {
        *(void *)(v27 + 24) = v29;
        *(void *)(v27 + 32) = *((void *)v28 + 4);
        (**(void (***)(uint64_t, long long *))(v29 - 8))(v27, v28);
      }
      else
      {
        long long v30 = *v28;
        long long v31 = v28[1];
        *(void *)(v27 + 32) = *((void *)v28 + 4);
        *(_OWORD *)uint64_t v27 = v30;
        *(_OWORD *)(v27 + 16) = v31;
      }
      *(unsigned char *)(v27 + 40) = 1;
    }
    else
    {
      *(void *)uint64_t v27 = *(void *)v28;
      *(unsigned char *)(v27 + 40) = 0;
      swift_retain();
    }
  }
  uint64_t v32 = a3[12];
  uint64_t v33 = a1 + v32;
  char v34 = (uint64_t *)(a2 + v32);
  uint64_t v35 = *v34;
  char v36 = *((unsigned char *)v34 + 8);
  j__swift_retain();
  *(void *)uint64_t v33 = v35;
  *(unsigned char *)(v33 + 8) = v36;
  j__swift_release();
  return a1;
}

uint64_t sub_2351BE0DC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  memcpy((void *)(a1 + v7), (const void *)(a2 + v7), 0x60uLL);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(void *)uint64_t v10 = *(void *)v11;
  *(unsigned char *)(v10 + 8) = *(unsigned char *)(v11 + 8);
  uint64_t v12 = a3[11];
  uint64_t v13 = a3[12];
  id v14 = (_OWORD *)(a1 + v12);
  uint64_t v15 = (_OWORD *)(a2 + v12);
  long long v16 = v15[1];
  *id v14 = *v15;
  v14[1] = v16;
  *(_OWORD *)((char *)v14 + 25) = *(_OWORD *)((char *)v15 + 25);
  uint64_t v17 = a1 + v13;
  uint64_t v18 = a2 + v13;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  *(void *)uint64_t v17 = *(void *)v18;
  return a1;
}

uint64_t sub_2351BE1D4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_release();
  uint64_t v7 = a3[6];
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(void *)(v9 + 16) = *(void *)(v10 + 16);
  *(unsigned char *)(v9 + 24) = *(unsigned char *)(v10 + 24);
  *(void *)(v9 + 32) = *(void *)(v10 + 32);
  *(unsigned char *)(v9 + 40) = *(unsigned char *)(v10 + 40);
  *(void *)(v9 + 48) = *(void *)(v10 + 48);
  *(_WORD *)(v9 + 56) = *(_WORD *)(v10 + 56);
  long long v11 = *(_OWORD *)(v10 + 80);
  *(_OWORD *)(v9 + 64) = *(_OWORD *)(v10 + 64);
  *(_OWORD *)(v9 + 80) = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (uint64_t *)(a2 + v8);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  void *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  uint64_t v22 = a1 + v21;
  char v23 = (uint64_t *)(a2 + v21);
  uint64_t v24 = *v23;
  LOBYTE(v23) = *((unsigned char *)v23 + 8);
  uint64_t v25 = *(void *)v22;
  char v26 = *(unsigned char *)(v22 + 8);
  *(void *)uint64_t v22 = v24;
  *(unsigned char *)(v22 + 8) = (_BYTE)v23;
  sub_2351BDCA0(v25, v26);
  if (a1 != a2)
  {
    uint64_t v27 = a3[11];
    uint64_t v28 = (_OWORD *)(a2 + v27);
    uint64_t v29 = (_OWORD *)(a1 + v27);
    sub_2351B490C(a1 + v27, &qword_26AD830C8);
    long long v30 = v28[1];
    _OWORD *v29 = *v28;
    v29[1] = v30;
    *(_OWORD *)((char *)v29 + 25) = *(_OWORD *)((char *)v28 + 25);
  }
  uint64_t v31 = a3[12];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = (uint64_t *)(a2 + v31);
  uint64_t v34 = *v33;
  LOBYTE(v33) = *((unsigned char *)v33 + 8);
  *(void *)uint64_t v32 = v34;
  *(unsigned char *)(v32 + 8) = (_BYTE)v33;
  j__swift_release();
  return a1;
}

uint64_t sub_2351BE36C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2351BE380);
}

uint64_t sub_2351BE380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2351CA400();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v7 + 84) != a2) {
    return OUTLINED_FUNCTION_6_1(*(void *)(a1 + *(int *)(a3 + 20)));
  }

  return __swift_getEnumTagSinglePayload(a1, a2, v6);
}

uint64_t sub_2351BE400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2351BE414);
}

void sub_2351BE414(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_2351CA400();
  OUTLINED_FUNCTION_0();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
}

uint64_t _s9BaseImageV18ArtworkLoaderImageVMa(uint64_t a1)
{
  return sub_2351B70DC(a1, (uint64_t *)&unk_26AD83050);
}

uint64_t sub_2351BE4BC()
{
  uint64_t result = sub_2351CA400();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_2351BE58C(void *__dst, char *__src, uint64_t a3)
{
  uint64_t v4 = __dst;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v30 = *(void *)__src;
    *uint64_t v4 = *(void *)__src;
    uint64_t v4 = (void *)(v30 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    memcpy(__dst, __src, 0x60uLL);
    v4[12] = *((void *)__src + 12);
    uint64_t v42 = a3;
    char v43 = __src;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)v4 + v7;
    uint64_t v9 = &__src[v7];
    uint64_t v10 = sub_2351CA400();
    long long v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_retain();
    v11(v8, v9, v10);
    uint64_t v12 = (int *)_s9BaseImageV18ArtworkLoaderImageVMa(0);
    *(void *)&v8[v12[5]] = *(void *)&v9[v12[5]];
    memcpy(&v8[v12[6]], &v9[v12[6]], 0x60uLL);
    uint64_t v13 = v12[7];
    uint64_t v14 = &v8[v13];
    uint64_t v15 = &v9[v13];
    uint64_t v16 = *((void *)v15 + 1);
    *(void *)uint64_t v14 = *(void *)v15;
    *((void *)v14 + 1) = v16;
    uint64_t v17 = v12[8];
    uint64_t v18 = &v8[v17];
    uint64_t v19 = &v9[v17];
    uint64_t v20 = *((void *)v19 + 1);
    *(void *)uint64_t v18 = *(void *)v19;
    *((void *)v18 + 1) = v20;
    v8[v12[9]] = v9[v12[9]];
    uint64_t v21 = v12[10];
    uint64_t v22 = &v8[v21];
    char v23 = &v9[v21];
    uint64_t v24 = *(void *)v23;
    LOBYTE(v11) = v23[8];
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2351BDBAC(v24, (char)v11);
    *(void *)uint64_t v22 = v24;
    v22[8] = (char)v11;
    uint64_t v25 = v12[11];
    char v26 = &v8[v25];
    uint64_t v27 = &v9[v25];
    if (v9[v25 + 40])
    {
      uint64_t v28 = *((void *)v27 + 3);
      if (v28)
      {
        uint64_t v29 = *((void *)v27 + 4);
        *((void *)v26 + 3) = v28;
        *((void *)v26 + 4) = v29;
        (**(void (***)(char *))(v28 - 8))(v26);
      }
      else
      {
        long long v31 = *((_OWORD *)v27 + 1);
        *(_OWORD *)char v26 = *(_OWORD *)v27;
        *((_OWORD *)v26 + 1) = v31;
        *((void *)v26 + 4) = *((void *)v27 + 4);
      }
      v26[40] = 1;
    }
    else
    {
      *(void *)char v26 = *(void *)v27;
      v26[40] = 0;
      swift_retain();
    }
    uint64_t v32 = v12[12];
    uint64_t v33 = &v8[v32];
    uint64_t v34 = &v9[v32];
    uint64_t v35 = *(void *)v34;
    char v36 = v34[8];
    j__swift_retain();
    *(void *)uint64_t v33 = v35;
    v33[8] = v36;
    uint64_t v37 = *(int *)(v42 + 28);
    uint64_t v38 = (char *)v4 + v37;
    uint64_t v39 = &v43[v37];
    uint64_t v40 = *(void *)v39;
    LOBYTE(v35) = v39[8];
    sub_2351BDBAC(*(void *)v39, v35);
    *(void *)uint64_t v38 = v40;
    v38[8] = v35;
  }
  return v4;
}

uint64_t sub_2351BE814(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = _s9BaseImageV18ArtworkLoaderImageVMa(0);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2351BDCA0(*(void *)(v4 + *(int *)(v6 + 40)), *(unsigned char *)(v4 + *(int *)(v6 + 40) + 8));
  uint64_t v7 = v4 + *(int *)(v6 + 44);
  if (*(unsigned char *)(v7 + 40))
  {
    if (*(void *)(v7 + 24)) {
      __swift_destroy_boxed_opaque_existential_1(v7);
    }
  }
  else
  {
    swift_release();
  }
  j__swift_release();
  uint64_t v8 = a1 + *(int *)(a2 + 28);
  uint64_t v9 = *(void *)v8;
  char v10 = *(unsigned char *)(v8 + 8);

  return sub_2351BDCA0(v9, v10);
}

void *sub_2351BE930(void *a1, void *a2, uint64_t a3)
{
  memcpy(a1, a2, 0x60uLL);
  a1[12] = a2[12];
  uint64_t v40 = a3;
  uint64_t v41 = a2;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2351CA400();
  char v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_retain();
  v10(v7, v8, v9);
  long long v11 = (int *)_s9BaseImageV18ArtworkLoaderImageVMa(0);
  *(void *)&v7[v11[5]] = *(void *)&v8[v11[5]];
  memcpy(&v7[v11[6]], &v8[v11[6]], 0x60uLL);
  uint64_t v12 = v11[7];
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = v15;
  uint64_t v16 = v11[8];
  uint64_t v17 = &v7[v16];
  uint64_t v18 = &v8[v16];
  uint64_t v19 = *((void *)v18 + 1);
  *(void *)uint64_t v17 = *(void *)v18;
  *((void *)v17 + 1) = v19;
  v7[v11[9]] = v8[v11[9]];
  uint64_t v20 = v11[10];
  uint64_t v21 = &v7[v20];
  uint64_t v22 = &v8[v20];
  uint64_t v23 = *(void *)v22;
  LOBYTE(v10) = v22[8];
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2351BDBAC(v23, (char)v10);
  *(void *)uint64_t v21 = v23;
  v21[8] = (char)v10;
  uint64_t v24 = v11[11];
  uint64_t v25 = &v7[v24];
  char v26 = &v8[v24];
  if (v8[v24 + 40])
  {
    uint64_t v27 = *((void *)v26 + 3);
    if (v27)
    {
      uint64_t v28 = *((void *)v26 + 4);
      *((void *)v25 + 3) = v27;
      *((void *)v25 + 4) = v28;
      (**(void (***)(char *))(v27 - 8))(v25);
    }
    else
    {
      long long v29 = *((_OWORD *)v26 + 1);
      *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
      *((_OWORD *)v25 + 1) = v29;
      *((void *)v25 + 4) = *((void *)v26 + 4);
    }
    v25[40] = 1;
  }
  else
  {
    *(void *)uint64_t v25 = *(void *)v26;
    v25[40] = 0;
    swift_retain();
  }
  uint64_t v30 = v11[12];
  long long v31 = &v7[v30];
  uint64_t v32 = &v8[v30];
  uint64_t v33 = *(void *)v32;
  char v34 = v32[8];
  j__swift_retain();
  *(void *)long long v31 = v33;
  v31[8] = v34;
  uint64_t v35 = *(int *)(v40 + 28);
  char v36 = (char *)a1 + v35;
  uint64_t v37 = (char *)v41 + v35;
  uint64_t v38 = *(void *)v37;
  LOBYTE(v33) = v37[8];
  sub_2351BDBAC(*(void *)v37, v33);
  *(void *)char v36 = v38;
  v36[8] = v33;
  return a1;
}

uint64_t sub_2351BEB60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v7;
  uint64_t v8 = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = (int *)_s9BaseImageV18ArtworkLoaderImageVMa(0);
  *(void *)(v10 + v13[5]) = *(void *)(v11 + v13[5]);
  swift_retain();
  swift_release();
  uint64_t v14 = v13[6];
  uint64_t v15 = v10 + v14;
  uint64_t v16 = v11 + v14;
  *(void *)uint64_t v15 = *(void *)v16;
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  uint64_t v17 = *(void *)(v16 + 16);
  *(unsigned char *)(v15 + 24) = *(unsigned char *)(v16 + 24);
  *(void *)(v15 + 16) = v17;
  uint64_t v18 = *(void *)(v16 + 32);
  *(unsigned char *)(v15 + 40) = *(unsigned char *)(v16 + 40);
  *(void *)(v15 + 32) = v18;
  uint64_t v19 = *(void *)(v16 + 48);
  *(unsigned char *)(v15 + 56) = *(unsigned char *)(v16 + 56);
  *(void *)(v15 + 48) = v19;
  *(unsigned char *)(v15 + 57) = *(unsigned char *)(v16 + 57);
  *(void *)(v15 + 64) = *(void *)(v16 + 64);
  *(void *)(v15 + 72) = *(void *)(v16 + 72);
  *(void *)(v15 + 80) = *(void *)(v16 + 80);
  *(void *)(v15 + 88) = *(void *)(v16 + 88);
  uint64_t v20 = v13[7];
  uint64_t v21 = (void *)(v10 + v20);
  uint64_t v22 = (void *)(v11 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = v13[8];
  uint64_t v24 = (void *)(v10 + v23);
  uint64_t v25 = (void *)(v11 + v23);
  *uint64_t v24 = *v25;
  v24[1] = v25[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v10 + v13[9]) = *(unsigned char *)(v11 + v13[9]);
  uint64_t v26 = v13[10];
  uint64_t v27 = v10 + v26;
  uint64_t v28 = v11 + v26;
  uint64_t v29 = *(void *)v28;
  char v30 = *(unsigned char *)(v28 + 8);
  sub_2351BDBAC(*(void *)v28, v30);
  uint64_t v31 = *(void *)v27;
  char v32 = *(unsigned char *)(v27 + 8);
  *(void *)uint64_t v27 = v29;
  *(unsigned char *)(v27 + 8) = v30;
  sub_2351BDCA0(v31, v32);
  if (a1 != a2)
  {
    uint64_t v33 = v13[11];
    uint64_t v34 = v10 + v33;
    uint64_t v35 = (long long *)(v11 + v33);
    sub_2351B490C(v10 + v33, &qword_26AD830C8);
    if (*((unsigned char *)v35 + 40))
    {
      uint64_t v36 = *((void *)v35 + 3);
      if (v36)
      {
        *(void *)(v34 + 24) = v36;
        *(void *)(v34 + 32) = *((void *)v35 + 4);
        (**(void (***)(uint64_t, long long *))(v36 - 8))(v34, v35);
      }
      else
      {
        long long v37 = *v35;
        long long v38 = v35[1];
        *(void *)(v34 + 32) = *((void *)v35 + 4);
        *(_OWORD *)uint64_t v34 = v37;
        *(_OWORD *)(v34 + 16) = v38;
      }
      *(unsigned char *)(v34 + 40) = 1;
    }
    else
    {
      *(void *)uint64_t v34 = *(void *)v35;
      *(unsigned char *)(v34 + 40) = 0;
      swift_retain();
    }
  }
  uint64_t v39 = v13[12];
  uint64_t v40 = v10 + v39;
  uint64_t v41 = (uint64_t *)(v11 + v39);
  uint64_t v42 = *v41;
  char v43 = *((unsigned char *)v41 + 8);
  j__swift_retain();
  *(void *)uint64_t v40 = v42;
  *(unsigned char *)(v40 + 8) = v43;
  j__swift_release();
  uint64_t v44 = *(int *)(a3 + 28);
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  uint64_t v47 = *(void *)v46;
  char v48 = *(unsigned char *)(v46 + 8);
  sub_2351BDBAC(*(void *)v46, v48);
  uint64_t v49 = *(void *)v45;
  char v50 = *(unsigned char *)(v45 + 8);
  *(void *)uint64_t v45 = v47;
  *(unsigned char *)(v45 + 8) = v48;
  sub_2351BDCA0(v49, v50);
  return a1;
}

void *sub_2351BEEB0(void *a1, void *a2, uint64_t a3)
{
  memcpy(a1, a2, 0x60uLL);
  a1[12] = a2[12];
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2351CA400();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = (int *)_s9BaseImageV18ArtworkLoaderImageVMa(0);
  *(void *)&v7[v10[5]] = *(void *)&v8[v10[5]];
  memcpy(&v7[v10[6]], &v8[v10[6]], 0x60uLL);
  *(_OWORD *)&v7[v10[7]] = *(_OWORD *)&v8[v10[7]];
  *(_OWORD *)&v7[v10[8]] = *(_OWORD *)&v8[v10[8]];
  v7[v10[9]] = v8[v10[9]];
  uint64_t v11 = v10[10];
  uint64_t v12 = &v7[v11];
  uint64_t v13 = &v8[v11];
  v12[8] = v13[8];
  *(void *)uint64_t v12 = *(void *)v13;
  uint64_t v14 = v10[11];
  uint64_t v15 = &v7[v14];
  uint64_t v16 = &v8[v14];
  *(_OWORD *)(v15 + 25) = *(_OWORD *)(v16 + 25);
  long long v17 = *((_OWORD *)v16 + 1);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  *((_OWORD *)v15 + 1) = v17;
  uint64_t v18 = v10[12];
  uint64_t v19 = &v7[v18];
  uint64_t v20 = &v8[v18];
  *(void *)uint64_t v19 = *(void *)v20;
  v19[8] = v20[8];
  uint64_t v21 = *(int *)(a3 + 28);
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  v22[8] = v23[8];
  *(void *)uint64_t v22 = *(void *)v23;
  return a1;
}

uint64_t sub_2351BF004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  long long v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_release();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2351CA400();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = (int *)_s9BaseImageV18ArtworkLoaderImageVMa(0);
  *(void *)(v8 + v11[5]) = *(void *)(v9 + v11[5]);
  swift_release();
  uint64_t v12 = v11[6];
  uint64_t v13 = v8 + v12;
  uint64_t v14 = v9 + v12;
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *(void *)(v13 + 16) = *(void *)(v14 + 16);
  *(unsigned char *)(v13 + 24) = *(unsigned char *)(v14 + 24);
  *(void *)(v13 + 32) = *(void *)(v14 + 32);
  *(unsigned char *)(v13 + 40) = *(unsigned char *)(v14 + 40);
  *(void *)(v13 + 48) = *(void *)(v14 + 48);
  *(_WORD *)(v13 + 56) = *(_WORD *)(v14 + 56);
  long long v15 = *(_OWORD *)(v14 + 80);
  *(_OWORD *)(v13 + 64) = *(_OWORD *)(v14 + 64);
  *(_OWORD *)(v13 + 80) = v15;
  uint64_t v16 = v11[7];
  long long v17 = (void *)(v8 + v16);
  uint64_t v18 = (uint64_t *)(v9 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  void *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = v11[8];
  uint64_t v22 = (void *)(v8 + v21);
  uint64_t v23 = (uint64_t *)(v9 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *uint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v8 + v11[9]) = *(unsigned char *)(v9 + v11[9]);
  uint64_t v26 = v11[10];
  uint64_t v27 = v8 + v26;
  uint64_t v28 = (uint64_t *)(v9 + v26);
  uint64_t v29 = *v28;
  LOBYTE(v28) = *((unsigned char *)v28 + 8);
  uint64_t v30 = *(void *)v27;
  char v31 = *(unsigned char *)(v27 + 8);
  *(void *)uint64_t v27 = v29;
  *(unsigned char *)(v27 + 8) = (_BYTE)v28;
  sub_2351BDCA0(v30, v31);
  if (a1 != a2)
  {
    uint64_t v32 = v11[11];
    uint64_t v33 = (_OWORD *)(v9 + v32);
    uint64_t v34 = (_OWORD *)(v8 + v32);
    sub_2351B490C(v8 + v32, &qword_26AD830C8);
    long long v35 = v33[1];
    *uint64_t v34 = *v33;
    v34[1] = v35;
    *(_OWORD *)((char *)v34 + 25) = *(_OWORD *)((char *)v33 + 25);
  }
  uint64_t v36 = v11[12];
  uint64_t v37 = v8 + v36;
  long long v38 = (uint64_t *)(v9 + v36);
  uint64_t v39 = *v38;
  LOBYTE(v38) = *((unsigned char *)v38 + 8);
  *(void *)uint64_t v37 = v39;
  *(unsigned char *)(v37 + 8) = (_BYTE)v38;
  j__swift_release();
  uint64_t v40 = *(int *)(a3 + 28);
  uint64_t v41 = a1 + v40;
  uint64_t v42 = (uint64_t *)(a2 + v40);
  uint64_t v43 = *v42;
  LOBYTE(v42) = *((unsigned char *)v42 + 8);
  uint64_t v44 = *(void *)v41;
  char v45 = *(unsigned char *)(v41 + 8);
  *(void *)uint64_t v41 = v43;
  *(unsigned char *)(v41 + 8) = (_BYTE)v42;
  sub_2351BDCA0(v44, v45);
  return a1;
}

uint64_t sub_2351BF23C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2351BF250);
}

uint64_t sub_2351BF250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return OUTLINED_FUNCTION_6_1(*(void *)(a1 + 96));
  }
  uint64_t v7 = _s9BaseImageV18ArtworkLoaderImageVMa(0);
  uint64_t v8 = a1 + *(int *)(a3 + 24);

  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t sub_2351BF2CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2351BF2E0);
}

uint64_t sub_2351BF2E0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 96) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = _s9BaseImageV18ArtworkLoaderImageVMa(0);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t _s9BaseImageVMa(uint64_t a1)
{
  return sub_2351B70DC(a1, (uint64_t *)&unk_26AD83068);
}

uint64_t sub_2351BF380()
{
  uint64_t result = _s9BaseImageV18ArtworkLoaderImageVMa(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2351BF42C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, const void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, char *a10)
{
  uint64_t v16 = _s9BaseImageV18ArtworkLoaderImageVMa(0);
  long long v17 = (int *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_5_1();
  char v18 = *a10;
  uint64_t v19 = _s9BaseImageVMa(0);
  uint64_t v20 = (char *)a9 + *(int *)(v19 + 28);
  *(void *)uint64_t v20 = swift_getKeyPath();
  v20[8] = 0;
  memcpy(a9, a3, 0x60uLL);
  a9[12] = a4;
  uint64_t v21 = sub_2351CA400();
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v22;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v10, a1, v21);
  *(void *)(v10 + v17[7]) = a2;
  memcpy((void *)(v10 + v17[8]), a3, 0x60uLL);
  uint64_t v24 = (void *)(v10 + v17[9]);
  *uint64_t v24 = a5;
  v24[1] = a6;
  uint64_t v25 = (void *)(v10 + v17[10]);
  *uint64_t v25 = a7;
  v25[1] = a8;
  *(unsigned char *)(v10 + v17[11]) = v18;
  uint64_t v26 = v10 + v17[12];
  *(void *)uint64_t v26 = swift_getKeyPath();
  *(unsigned char *)(v26 + 8) = 0;
  uint64_t v27 = v10 + v17[13];
  *(void *)uint64_t v27 = swift_getKeyPath();
  *(unsigned char *)(v27 + 40) = 0;
  uint64_t v28 = v10 + v17[14];
  type metadata accessor for ArtworkLoadingObserver(0);
  sub_2351C167C();
  *(void *)uint64_t v28 = sub_2351C9EC0();
  *(unsigned char *)(v28 + 8) = v29 & 1;
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(a1, v21);
  return sub_2351C16CC(v10, (uint64_t)a9 + *(int *)(v19 + 24), (void (*)(void))_s9BaseImageV18ArtworkLoaderImageVMa);
}

uint64_t sub_2351BF630@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD835B8);
  MEMORY[0x270FA5388](v3 - 8);
  OUTLINED_FUNCTION_9();
  uint64_t v37 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
  MEMORY[0x270FA5388](v5 - 8);
  OUTLINED_FUNCTION_9();
  uint64_t v36 = v6;
  uint64_t v7 = sub_2351CA220();
  OUTLINED_FUNCTION_0_1();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_15();
  uint64_t v13 = v12 - v11;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD83148);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_15();
  uint64_t v17 = v16 - v15;
  memcpy(__dst, v1, sizeof(__dst));
  swift_getKeyPath();
  char v18 = &v1[*(int *)(_s9BaseImageVMa(0) + 28)];
  uint64_t v19 = *(void *)v18;
  char v20 = v18[8];
  sub_2351BDBAC(*(void *)v18, v20);
  double v21 = sub_2351C0500(v19, v20);
  sub_2351BDCA0(v19, v20);
  sub_2351C6BE4(v21);
  swift_release();
  _s9BaseImageV18ArtworkLoaderImageVMa(0);
  if (!sub_2351B17D4())
  {
    if (qword_26AD83048 != -1) {
      swift_once();
    }
    id v22 = (id)qword_26AD83040;
  }
  sub_2351CA210();
  (*(void (**)(uint64_t, void, uint64_t))(v9 + 104))(v13, *MEMORY[0x263F1B4B8], v7);
  uint64_t v34 = sub_2351CA230();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v7);
  memcpy(v45, v2, sizeof(v45));
  uint64_t v23 = sub_2351B17D4();
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = v2;
  }
  else
  {
    if (qword_26AD83048 != -1) {
      swift_once();
    }
    uint64_t v25 = v2;
    id v24 = (id)qword_26AD83040;
  }
  objc_msgSend(v24, sel_size);
  uint64_t v27 = v26;
  uint64_t v29 = v28;

  BOOL v33 = sub_2351C6C48(v27, v29, 0);
  sub_2351CA2C0();
  sub_2351C9F00();
  uint64_t v30 = v25[12];
  swift_retain();
  char v31 = sub_2351CA100();
  sub_2351BFB24(v36);
  sub_2351B40A8(v36, v37, &qword_26AD831D8);
  sub_2351B40A8(v37, v17 + *(int *)(v35 + 36), &qword_26AD835B8);
  *(void *)uint64_t v17 = v34;
  *(void *)(v17 + 8) = 0;
  *(unsigned char *)(v17 + 16) = 1;
  *(unsigned char *)(v17 + 17) = v33;
  *(_WORD *)(v17 + 18) = 0;
  *(unsigned char *)(v17 + 20) = 1;
  *(void *)(v17 + 24) = v39;
  *(unsigned char *)(v17 + 32) = v40;
  *(void *)(v17 + 40) = v41;
  *(unsigned char *)(v17 + 48) = v42;
  *(void *)(v17 + 56) = v43;
  *(void *)(v17 + 64) = v44;
  *(void *)(v17 + 72) = v30;
  *(unsigned char *)(v17 + 80) = v31;
  swift_retain();
  swift_retain();
  sub_2351B490C(v37, &qword_26AD835B8);
  sub_2351B490C(v36, &qword_26AD831D8);
  swift_release();
  swift_release();
  return sub_2351B8694(v17, a1, &qword_26AD83148);
}

uint64_t sub_2351BFB24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2351CA400();
  uint64_t v33 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD831D8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD83328);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _s10ParametersVMa();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for ArtworkImage._Proxy();
  uint64_t v32 = a1;
  __swift_storeEnumTagSinglePayload(a1, 1, 1, v15);
  uint64_t v16 = v1 + *(int *)(_s9BaseImageVMa(0) + 24);
  uint64_t v17 = *(void *)(v16 + *(int *)(_s9BaseImageV18ArtworkLoaderImageVMa(0) + 20))
      + OBJC_IVAR____TtC17_MusicKit_SwiftUI13ArtworkLoader_lastParameters;
  swift_beginAccess();
  sub_2351B40A8(v17, (uint64_t)v11, &qword_26AD83328);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1) {
    return sub_2351B490C((uint64_t)v11, &qword_26AD83328);
  }
  sub_2351C16CC((uint64_t)v11, (uint64_t)v14, (void (*)(void))_s10ParametersVMa);
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v5, v14, v3);
  uint64_t v19 = &v14[*(int *)(v12 + 28)];
  uint64_t v20 = *(void *)v19;
  uint64_t v21 = *((void *)v19 + 1);
  id v22 = sub_2351B17D4();
  if (v22)
  {
    id v23 = v22;
    if (qword_26AD83048 != -1) {
      swift_once();
    }
  }
  else
  {
    if (qword_26AD83048 != -1) {
      swift_once();
    }
    id v23 = (id)qword_26AD83040;
  }
  id v24 = (void *)qword_26AD83040;
  sub_2351BD020();
  id v25 = v24;
  char v26 = sub_2351CA580();

  uint64_t v27 = 0;
  if ((v26 & 1) == 0)
  {
    uint64_t v27 = sub_2351B17D4();
    if (!v27)
    {
      uint64_t v27 = (void *)qword_26AD83040;
      id v28 = (id)qword_26AD83040;
    }
  }
  sub_2351AF5C0((uint64_t)v14);
  uint64_t v29 = v32;
  sub_2351B490C(v32, &qword_26AD831D8);
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v8, v5, v3);
  uint64_t v30 = &v8[*(int *)(v15 + 20)];
  *(void *)uint64_t v30 = v20;
  *((void *)v30 + 1) = v21;
  *(void *)&v8[*(int *)(v15 + 24)] = v27;
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v15);
  return sub_2351B8694((uint64_t)v8, v29, &qword_26AD831D8);
}

uint64_t sub_2351BFF0C()
{
  uint64_t v1 = _s9BaseImageV18ArtworkLoaderImageVMa(0);
  memcpy(v3, (const void *)(v0 + *(int *)(v1 + 24)), sizeof(v3));
  return sub_2351BFF50(v0);
}

uint64_t sub_2351BFF50(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = (int *)_s9BaseImageV18ArtworkLoaderImageVMa(0);
  uint64_t v3 = v1 + v2[10];
  uint64_t v4 = *(void *)v3;
  char v5 = *(unsigned char *)(v3 + 8);
  sub_2351BDBAC(*(void *)v3, v5);
  double v6 = sub_2351C0500(v4, v5);
  sub_2351BDCA0(v4, v5);
  double v7 = sub_2351C6BE4(v6);
  double v9 = v8;
  swift_release();
  swift_getKeyPath();
  sub_2351BDBAC(v4, v5);
  double v10 = sub_2351C0500(v4, v5);
  sub_2351BDCA0(v4, v5);
  double v11 = sub_2351C6BE4(v10);
  double v13 = v12;
  swift_release();
  sub_2351BDBAC(v4, v5);
  double v14 = sub_2351C0500(v4, v5);
  sub_2351BDCA0(v4, v5);
  uint64_t v15 = v2[8];
  uint64_t v16 = (uint64_t *)(v1 + v2[7]);
  uint64_t v17 = *v16;
  char v18 = (unsigned char *)v16[1];
  uint64_t v19 = *(void *)(v1 + v15);
  uint64_t v20 = *(void *)(v1 + v15 + 8);
  v34[0] = *(unsigned char *)(v1 + v2[9]);
  sub_2351C0744((uint64_t)v32);
  if (v33)
  {
    sub_2351C15B4((uint64_t)v32, (uint64_t)v31);
    uint64_t v21 = swift_allocObject();
    sub_2351C1650(v31, v21 + 16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
    id v22 = sub_2351C1668;
  }
  else
  {
    sub_2351B490C((uint64_t)v32, &qword_26AD830B8);
    id v22 = 0;
    uint64_t v21 = 0;
  }
  uint64_t v23 = v1 + v2[12];
  uint64_t v24 = *(void *)v23;
  char v25 = *(unsigned char *)(v23 + 8);
  j__swift_retain();
  uint64_t v26 = sub_2351C097C(v24, v25);
  j__swift_release();
  if (v26)
  {
    uint64_t v27 = *(void *)(v26 + 16);
    uint64_t v28 = *(void *)(v26 + 24);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v28 = 0;
  }
  sub_2351B1AD8(a1, v17, v18, v19, v20, v34, (void (*)(void *))v22, v21, v14, v7, v9, v11, v13, v27, v28);
  sub_2351B3CF4(v27);
  return sub_2351B3CF4((uint64_t)v22);
}

uint64_t sub_2351C0200(uint64_t a1, void *a2)
{
  uint64_t v3 = a2[3];
  uint64_t v4 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, v3, v4);
}

uint64_t sub_2351C025C()
{
  uint64_t result = sub_2351C027C();
  qword_26AD83040 = result;
  return result;
}

uint64_t sub_2351C027C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827A0]), sel_initWithSize_, 1.0, 1.0);
  uint64_t v1 = swift_allocObject();
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(v1 + 16) = _Q0;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_2351C0710;
  *(void *)(v7 + 24) = v1;
  v11[4] = sub_2351C071C;
  v11[5] = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = sub_2351C0494;
  v11[3] = &block_descriptor_2;
  double v8 = _Block_copy(v11);
  swift_retain();
  swift_release();
  id v9 = objc_msgSend(v0, sel_imageWithActions_, v8);

  _Block_release(v8);
  LOBYTE(v0) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v0 & 1) == 0) {
    return (uint64_t)v9;
  }
  __break(1u);
  return result;
}

id sub_2351C0404(void *a1, double a2, double a3)
{
  id v6 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v6, sel_setFill);

  return objc_msgSend(a1, sel_fillRect_, 0.0, 0.0, a2, a3);
}

void sub_2351C0494(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_2351C04E4()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_2351C0500(uint64_t a1, char a2)
{
  uint64_t v4 = sub_2351CA010();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = sub_2351CA550();
  id v9 = sub_2351CA0F0();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    double v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    double v15 = *(double *)&v12;
    *(_DWORD *)double v11 = 136315138;
    uint64_t v14 = sub_2351C0DF8(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v15);
    sub_2351CA5A0();
    _os_log_impl(&dword_2351AA000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DD72C0](v12, -1, -1);
    MEMORY[0x237DD72C0](v11, -1, -1);
  }

  sub_2351CA000();
  swift_getAtKeyPath();
  sub_2351BDCA0(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

id sub_2351C0710(void *a1)
{
  return sub_2351C0404(a1, *(double *)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t sub_2351C071C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2351C0744@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2351CA010();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2351B40A8(v2, (uint64_t)v17, &qword_26AD830C8);
  if (v18 == 1) {
    return sub_2351B8694((uint64_t)v17, a1, &qword_26AD830B8);
  }
  os_log_type_t v9 = sub_2351CA550();
  os_log_type_t v10 = sub_2351CA0F0();
  os_log_type_t v11 = v9;
  if (os_log_type_enabled(v10, v9))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    v15[1] = a1;
    uint64_t v14 = v13;
    uint64_t v16 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    v15[2] = sub_2351C0DF8(0xD00000000000002CLL, 0x80000002351CCAE0, &v16);
    sub_2351CA5A0();
    _os_log_impl(&dword_2351AA000, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x237DD72C0](v14, -1, -1);
    MEMORY[0x237DD72C0](v12, -1, -1);
  }

  sub_2351CA000();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2351C097C(uint64_t a1, char a2)
{
  uint64_t v4 = sub_2351CA010();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v8 = sub_2351CA550();
    os_log_type_t v9 = sub_2351CA0F0();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v15 = v12;
      *(_DWORD *)os_log_type_t v11 = 136315138;
      uint64_t v14 = sub_2351C0DF8(0xD000000000000020, 0x80000002351CCAB0, &v15);
      sub_2351CA5A0();
      _os_log_impl(&dword_2351AA000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DD72C0](v12, -1, -1);
      MEMORY[0x237DD72C0](v11, -1, -1);
    }

    sub_2351CA000();
    swift_getAtKeyPath();
    j__swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v15;
  }
  return a1;
}

uint64_t sub_2351C0B88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_2351CA010();
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_5_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4288);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_15();
  uint64_t v12 = v11 - v10;
  sub_2351B40A8(v3, v11 - v10, &qword_2687F4288);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2351C9F40();
    OUTLINED_FUNCTION_2_0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 32))(a1, v12);
  }
  else
  {
    os_log_type_t v15 = sub_2351CA550();
    uint64_t v16 = sub_2351CA0F0();
    os_log_type_t v17 = v15;
    if (os_log_type_enabled(v16, v15))
    {
      char v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      uint64_t v20 = v19;
      *(_DWORD *)char v18 = 136315138;
      sub_2351C0DF8(0x414C52556E65704FLL, 0xED00006E6F697463, &v20);
      sub_2351CA5A0();
      _os_log_impl(&dword_2351AA000, v16, v17, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x237DD72C0](v19, -1, -1);
      MEMORY[0x237DD72C0](v18, -1, -1);
    }

    sub_2351CA000();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v2, v5);
  }
}

uint64_t sub_2351C0DF8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2351C0ECC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2351B4F34((uint64_t)v12, *a3);
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
      sub_2351B4F34((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2351C0ECC(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_2351C1024((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2351CA5B0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_2351C10FC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_2351CA600();
    if (!v8)
    {
      uint64_t result = sub_2351CA640();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_2351C1024(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_2351CA660();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_2351C10FC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2351C1194(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_2351C1370(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_2351C1370((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2351C1194(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_2351CA4D0();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_2351C1308(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_2351CA5F0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_2351CA660();
  __break(1u);
LABEL_14:
  uint64_t result = sub_2351CA640();
  __break(1u);
  return result;
}

void *sub_2351C1308(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F42B8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2351C1370(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687F42B8);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_2351C1520(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2351C1448(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2351C1448(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_2351CA660();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_2351C1520(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2351CA660();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_2351C15B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2351C1618()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2351C1650(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2351C1668(uint64_t a1)
{
  return sub_2351C0200(a1, (void *)(v1 + 16));
}

unint64_t sub_2351C167C()
{
  unint64_t result = qword_26AD830A0;
  if (!qword_26AD830A0)
  {
    type metadata accessor for ArtworkLoadingObserver(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD830A0);
  }
  return result;
}

uint64_t sub_2351C16CC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_2_0();
  uint64_t v4 = OUTLINED_FUNCTION_17_0();
  v5(v4);
  return a2;
}

unint64_t sub_2351C1724()
{
  unint64_t result = qword_26AD83140;
  if (!qword_26AD83140)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD83148);
    sub_2351C17C4();
    sub_2351C1ABC(&qword_26AD835B0, &qword_26AD835B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD83140);
  }
  return result;
}

unint64_t sub_2351C17C4()
{
  unint64_t result = qword_26AD83130;
  if (!qword_26AD83130)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD83138);
    sub_2351C1864();
    sub_2351C1ABC(&qword_26AD835A0, &qword_26AD835A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD83130);
  }
  return result;
}

unint64_t sub_2351C1864()
{
  unint64_t result = qword_26AD83120;
  if (!qword_26AD83120)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD83128);
    sub_2351C18E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD83120);
  }
  return result;
}

unint64_t sub_2351C18E0()
{
  unint64_t result = qword_26AD83110;
  if (!qword_26AD83110)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD83118);
    sub_2351C195C();
    sub_2351C1A70();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD83110);
  }
  return result;
}

unint64_t sub_2351C195C()
{
  unint64_t result = qword_26AD83100;
  if (!qword_26AD83100)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD83108);
    sub_2351C19FC();
    sub_2351C1ABC(&qword_26AD830D0, &qword_26AD830D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD83100);
  }
  return result;
}

unint64_t sub_2351C19FC()
{
  unint64_t result = qword_26AD830F0;
  if (!qword_26AD830F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD830F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD830F0);
  }
  return result;
}

unint64_t sub_2351C1A70()
{
  unint64_t result = qword_26AD83168;
  if (!qword_26AD83168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD83168);
  }
  return result;
}

uint64_t sub_2351C1ABC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2351C1B00()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v7 = v0[7];
  uint64_t v8 = v0[9];
  uint64_t v46 = v0[6];
  uint64_t v47 = v0[8];
  uint64_t v9 = v0[11];
  uint64_t v48 = v0[10];
  uint64_t v49 = v0[12];
  uint64_t v50 = v0[13];
  type metadata accessor for MusicKit_SPI_SKCloudServiceSetupOptionsKey(0);
  sub_2351C3A68();
  uint64_t v54 = sub_2351CA420();
  uint64_t v10 = MEMORY[0x263F8D310];
  uint64_t v53 = MEMORY[0x263F8D310];
  uint64_t v51 = v2;
  uint64_t v52 = v1;
  size_t v11 = @"musicKit_action";
  swift_bridgeObjectRetain();
  sub_2351C3AB8((uint64_t)&v51, v11);
  if (v5)
  {
    uint64_t v53 = v10;
    uint64_t v51 = v6;
    uint64_t v52 = v5;
    swift_bridgeObjectRetain();
    uint64_t v12 = @"musicKit_iTunesItemIdentifier";
    OUTLINED_FUNCTION_0_3(v12, v13, v14, v15, v16, v17);
  }
  uint64_t v53 = v10;
  uint64_t v51 = v3;
  uint64_t v52 = v4;
  char v18 = @"musicKit_messageIdentifier";
  swift_bridgeObjectRetain();
  sub_2351C3AB8((uint64_t)&v51, v18);
  if (v7)
  {
    uint64_t v53 = v10;
    uint64_t v51 = v46;
    uint64_t v52 = v7;
    swift_bridgeObjectRetain();
    uint64_t v19 = @"musicKit_affiliateToken";
    OUTLINED_FUNCTION_0_3(v19, v20, v21, v22, v23, v24);
  }
  if (v8)
  {
    uint64_t v53 = v10;
    uint64_t v51 = v47;
    uint64_t v52 = v8;
    swift_bridgeObjectRetain();
    char v25 = @"musicKit_campaignToken";
    OUTLINED_FUNCTION_0_3(v25, v26, v27, v28, v29, v30);
  }
  if (v9)
  {
    uint64_t v31 = qword_2687F4090;
    swift_bridgeObjectRetain();
    if (v31 != -1) {
      swift_once();
    }
    uint64_t v53 = v10;
    uint64_t v51 = v48;
    uint64_t v52 = v9;
    id v32 = (id)qword_2687F5768;
    OUTLINED_FUNCTION_0_3(v32, v33, v34, v35, v36, v37);
  }
  if (v50)
  {
    uint64_t v38 = qword_2687F4098;
    swift_bridgeObjectRetain();
    if (v38 != -1) {
      swift_once();
    }
    uint64_t v53 = v10;
    uint64_t v51 = v49;
    uint64_t v52 = v50;
    id v39 = (id)qword_2687F5770;
    OUTLINED_FUNCTION_0_3(v39, v40, v41, v42, v43, v44);
  }
  return v54;
}

uint64_t sub_2351C1D3C()
{
  uint64_t v0 = sub_2351CA480();
  uint64_t v2 = v1;
  if (v0 == sub_2351CA480() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2351CA690();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2351C1DC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return sub_2351CA690();
  }
}

uint64_t static MusicSubscriptionOffer.Options.default.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_2687F4088 != -1) {
    swift_once();
  }
  uint64_t v2 = *((void *)&xmmword_2687F4300 + 1);
  uint64_t v3 = qword_2687F4310;
  uint64_t v4 = unk_2687F4318;
  uint64_t v5 = xmmword_2687F4320;
  uint64_t v6 = qword_2687F4368;
  *(void *)a1 = xmmword_2687F4300;
  *(void *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 40) = *(long long *)((char *)&xmmword_2687F4320 + 8);
  *(_OWORD *)(a1 + 56) = unk_2687F4338;
  *(_OWORD *)(a1 + 72) = *(long long *)((char *)&xmmword_2687F4340 + 8);
  *(_OWORD *)(a1 + 88) = unk_2687F4358;
  *(void *)(a1 + 104) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

void sub_2351C1EE0()
{
  BYTE5(qword_2687F42C8) = 0;
  HIWORD(qword_2687F42C8) = -5120;
}

uint64_t static MusicSubscriptionOffer.Action.subscribe.getter@<X0>(void *a1@<X8>)
{
  return sub_2351C2180(&qword_2687F4068, &qword_2687F42C0, &qword_2687F42C8, a1);
}

void *sub_2351C1F34@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_2351C21FC(a1, (void *(*)(void *__return_ptr, void, void))MusicSubscriptionOffer.Action.init(rawValue:), a2);
}

uint64_t sub_2351C1F4C()
{
  return sub_2351CA730();
}

uint64_t sub_2351C1FAC()
{
  swift_bridgeObjectRetain();
  sub_2351CA4A0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2351C2008()
{
  return sub_2351CA730();
}

uint64_t MusicSubscriptionOffer.MessageIdentifier.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t MusicSubscriptionOffer.MessageIdentifier.init(rawValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t MusicSubscriptionOffer.MessageIdentifier.rawValue.getter()
{
  return OUTLINED_FUNCTION_16_0();
}

void sub_2351C20A0()
{
  qword_2687F42D0 = 1852403562;
  qword_2687F42D8 = 0xE400000000000000;
}

uint64_t static MusicSubscriptionOffer.MessageIdentifier.join.getter@<X0>(void *a1@<X8>)
{
  return sub_2351C2180(&qword_2687F4070, &qword_2687F42D0, &qword_2687F42D8, a1);
}

void sub_2351C20E4()
{
  qword_2687F42E0 = 0x636973754D646461;
  *(void *)algn_2687F42E8 = 0xE800000000000000;
}

uint64_t static MusicSubscriptionOffer.MessageIdentifier.addMusic.getter@<X0>(void *a1@<X8>)
{
  return sub_2351C2180(&qword_2687F4078, &qword_2687F42E0, (uint64_t *)algn_2687F42E8, a1);
}

void sub_2351C2130()
{
  qword_2687F42F0 = 0x6973754D79616C70;
  *(void *)algn_2687F42F8 = 0xE900000000000063;
}

uint64_t static MusicSubscriptionOffer.MessageIdentifier.playMusic.getter@<X0>(void *a1@<X8>)
{
  return sub_2351C2180(&qword_2687F4080, &qword_2687F42F0, (uint64_t *)algn_2687F42F8, a1);
}

uint64_t sub_2351C2180@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = *a3;
  *a4 = *a2;
  a4[1] = v7;

  return swift_bridgeObjectRetain();
}

void *sub_2351C21E4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_2351C21FC(a1, (void *(*)(void *__return_ptr, void, void))MusicSubscriptionOffer.MessageIdentifier.init(rawValue:), a2);
}

void *sub_2351C21FC@<X0>(void *a1@<X0>, void *(*a2)(void *__return_ptr, void, void)@<X3>, void *a3@<X8>)
{
  uint64_t result = a2(v6, *a1, a1[1]);
  uint64_t v5 = v6[1];
  *a3 = v6[0];
  a3[1] = v5;
  return result;
}

uint64_t sub_2351C2240@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MusicSubscriptionOffer.MessageIdentifier.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2351C2268(uint64_t *a1, uint64_t *a2)
{
  return sub_2351C1DC4(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_2351C227C()
{
  return sub_2351C1F4C();
}

uint64_t sub_2351C2298()
{
  return sub_2351C1FAC();
}

uint64_t sub_2351C22B4()
{
  return sub_2351C2008();
}

uint64_t MusicSubscriptionOffer.Options.action.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_2(*(void *)(v1 + 8), a1);
}

uint64_t MusicSubscriptionOffer.Options.action.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*MusicSubscriptionOffer.Options.action.modify())()
{
  return nullsub_1;
}

uint64_t MusicSubscriptionOffer.Options.messageIdentifier.getter@<X0>(void *a1@<X8>)
{
  return OUTLINED_FUNCTION_6_2(*(void *)(v1 + 24), a1);
}

uint64_t MusicSubscriptionOffer.Options.messageIdentifier.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v3;
  return result;
}

uint64_t (*MusicSubscriptionOffer.Options.messageIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t MusicSubscriptionOffer.Options.itemID.getter()
{
  return OUTLINED_FUNCTION_16_0();
}

uint64_t MusicSubscriptionOffer.Options.itemID.setter()
{
  OUTLINED_FUNCTION_9_1();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v0;
  return result;
}

uint64_t (*MusicSubscriptionOffer.Options.itemID.modify())()
{
  return nullsub_1;
}

uint64_t MusicSubscriptionOffer.Options.affiliateToken.getter()
{
  return OUTLINED_FUNCTION_16_0();
}

uint64_t MusicSubscriptionOffer.Options.affiliateToken.setter()
{
  OUTLINED_FUNCTION_9_1();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = v2;
  *(void *)(v1 + 56) = v0;
  return result;
}

uint64_t (*MusicSubscriptionOffer.Options.affiliateToken.modify())()
{
  return nullsub_1;
}

uint64_t MusicSubscriptionOffer.Options.campaignToken.getter()
{
  return OUTLINED_FUNCTION_16_0();
}

uint64_t MusicSubscriptionOffer.Options.campaignToken.setter()
{
  OUTLINED_FUNCTION_9_1();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 64) = v2;
  *(void *)(v1 + 72) = v0;
  return result;
}

uint64_t (*MusicSubscriptionOffer.Options.campaignToken.modify())()
{
  return nullsub_1;
}

uint64_t MusicSubscriptionOffer.Options._figaroCampaignToken.getter()
{
  return OUTLINED_FUNCTION_16_0();
}

uint64_t MusicSubscriptionOffer.Options._figaroCampaignToken.setter()
{
  OUTLINED_FUNCTION_9_1();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = v2;
  *(void *)(v1 + 88) = v0;
  return result;
}

uint64_t (*MusicSubscriptionOffer.Options._figaroCampaignToken.modify())()
{
  return nullsub_1;
}

uint64_t MusicSubscriptionOffer.Options._figaroCampaignGroup.getter()
{
  return OUTLINED_FUNCTION_16_0();
}

uint64_t MusicSubscriptionOffer.Options._figaroCampaignGroup.setter()
{
  OUTLINED_FUNCTION_9_1();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 96) = v2;
  *(void *)(v1 + 104) = v0;
  return result;
}

uint64_t (*MusicSubscriptionOffer.Options._figaroCampaignGroup.modify())()
{
  return nullsub_1;
}

double sub_2351C2608()
{
  if (qword_2687F4068 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_2687F42C0;
  uint64_t v0 = qword_2687F42C8;
  uint64_t v2 = qword_2687F4070;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_2687F42D0;
  uint64_t v3 = qword_2687F42D8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease_n();
  *(void *)&xmmword_2687F4300 = v1;
  *((void *)&xmmword_2687F4300 + 1) = v0;
  qword_2687F4310 = v4;
  unk_2687F4318 = v3;
  double result = 0.0;
  xmmword_2687F4320 = 0u;
  unk_2687F4330 = 0u;
  xmmword_2687F4340 = 0u;
  unk_2687F4350 = 0u;
  unk_2687F4360 = 0u;
  return result;
}

double MusicSubscriptionOffer.Options.init(action:messageIdentifier:itemID:affiliateToken:campaignToken:)@<D0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v13 = *a1;
  uint64_t v14 = a1[1];
  uint64_t v15 = *a2;
  uint64_t v16 = a2[1];
  if (qword_2687F4068 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_2687F4070;
  swift_bridgeObjectRetain();
  if (v17 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)a9 = v13;
  *(void *)(a9 + 8) = v14;
  *(void *)(a9 + 16) = v15;
  *(void *)(a9 + 24) = v16;
  *(void *)(a9 + 32) = a3;
  *(void *)(a9 + 40) = a4;
  *(void *)(a9 + 48) = a5;
  *(void *)(a9 + 56) = a6;
  *(void *)(a9 + 64) = a7;
  *(void *)(a9 + 72) = a8;
  double result = 0.0;
  *(_OWORD *)(a9 + 80) = 0u;
  *(_OWORD *)(a9 + 96) = 0u;
  return result;
}

uint64_t static MusicSubscriptionOffer.Options.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v38 = a1[6];
  uint64_t v6 = a1[7];
  uint64_t v34 = a1[8];
  uint64_t v39 = a1[9];
  uint64_t v31 = a1[10];
  uint64_t v27 = a1[12];
  uint64_t v29 = a1[13];
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  uint64_t v9 = a2[4];
  uint64_t v10 = a2[5];
  uint64_t v11 = a2[7];
  uint64_t v37 = a2[6];
  uint64_t v35 = a1[11];
  uint64_t v36 = a2[9];
  uint64_t v30 = a2[10];
  uint64_t v32 = a2[11];
  uint64_t v33 = a2[8];
  BOOL v12 = *a1 == *a2 && a1[1] == a2[1];
  uint64_t v26 = a2[12];
  uint64_t v28 = a2[13];
  if (v12 || (sub_2351CA690(), uint64_t result = OUTLINED_FUNCTION_4_1(), (v14 & 1) != 0))
  {
    BOOL v15 = v2 == v7 && v3 == v8;
    if (v15 || (sub_2351CA690(), uint64_t result = OUTLINED_FUNCTION_4_1(), (v16 & 1) != 0))
    {
      if (v5)
      {
        if (!v10) {
          return 0;
        }
        if (v4 != v9 || v5 != v10)
        {
          sub_2351CA690();
          uint64_t result = OUTLINED_FUNCTION_4_1();
          if ((v18 & 1) == 0) {
            return result;
          }
        }
      }
      else if (v10)
      {
        return 0;
      }
      if (v6)
      {
        if (!v11) {
          return 0;
        }
        if (v38 != v37 || v6 != v11)
        {
          sub_2351CA690();
          uint64_t result = OUTLINED_FUNCTION_4_1();
          if ((v20 & 1) == 0) {
            return result;
          }
        }
      }
      else if (v11)
      {
        return 0;
      }
      if (v39)
      {
        if (!v36) {
          return 0;
        }
        if (v34 != v33 || v39 != v36)
        {
          sub_2351CA690();
          uint64_t result = OUTLINED_FUNCTION_4_1();
          if ((v22 & 1) == 0) {
            return result;
          }
        }
      }
      else if (v36)
      {
        return 0;
      }
      if (v35)
      {
        if (!v32) {
          return 0;
        }
        if (v31 != v30 || v35 != v32)
        {
          sub_2351CA690();
          uint64_t result = OUTLINED_FUNCTION_4_1();
          if ((v24 & 1) == 0) {
            return result;
          }
        }
      }
      else if (v32)
      {
        return 0;
      }
      if (v29)
      {
        if (v28)
        {
          BOOL v25 = v27 == v26 && v29 == v28;
          if (v25 || (sub_2351CA690() & 1) != 0) {
            return 1;
          }
        }
      }
      else if (!v28)
      {
        return 1;
      }
      return 0;
    }
  }
  return result;
}

uint64_t MusicSubscriptionOffer.Options.hash(into:)()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[13];
  uint64_t v6 = v0[11];
  swift_bridgeObjectRetain();
  sub_2351CA4A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2351CA4A0();
  swift_bridgeObjectRelease();
  if (v1)
  {
    OUTLINED_FUNCTION_10_1();
    swift_bridgeObjectRetain();
    sub_2351CA4A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_7_0();
  }
  if (v2)
  {
    OUTLINED_FUNCTION_10_1();
    swift_bridgeObjectRetain();
    sub_2351CA4A0();
    swift_bridgeObjectRelease();
    if (v3) {
      goto LABEL_6;
    }
  }
  else
  {
    OUTLINED_FUNCTION_7_0();
    if (v3)
    {
LABEL_6:
      OUTLINED_FUNCTION_10_1();
      swift_bridgeObjectRetain();
      sub_2351CA4A0();
      swift_bridgeObjectRelease();
      if (v6) {
        goto LABEL_7;
      }
LABEL_13:
      OUTLINED_FUNCTION_7_0();
      if (v4) {
        goto LABEL_8;
      }
      return OUTLINED_FUNCTION_7_0();
    }
  }
  OUTLINED_FUNCTION_7_0();
  if (!v6) {
    goto LABEL_13;
  }
LABEL_7:
  OUTLINED_FUNCTION_10_1();
  swift_bridgeObjectRetain();
  sub_2351CA4A0();
  swift_bridgeObjectRelease();
  if (!v4) {
    return OUTLINED_FUNCTION_7_0();
  }
LABEL_8:
  OUTLINED_FUNCTION_10_1();
  swift_bridgeObjectRetain();
  sub_2351CA4A0();

  return swift_bridgeObjectRelease();
}

uint64_t MusicSubscriptionOffer.Options.hashValue.getter()
{
  return sub_2351CA730();
}

uint64_t sub_2351C2CF0()
{
  return sub_2351CA730();
}

uint64_t MusicSubscriptionOffer.Options.description.getter()
{
  uint64_t v1 = *v0;
  unint64_t v2 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v7 = v0[6];
  uint64_t v8 = v0[7];
  uint64_t v9 = v0[8];
  uint64_t v10 = v0[9];
  uint64_t v12 = v0[10];
  uint64_t v11 = v0[11];
  uint64_t v14 = v0[12];
  uint64_t v13 = v0[13];
  uint64_t v33 = *v0;
  unint64_t v34 = v2;
  uint64_t v35 = v4;
  uint64_t v36 = v3;
  uint64_t v37 = v6;
  uint64_t v38 = v5;
  uint64_t v39 = v7;
  uint64_t v40 = v8;
  uint64_t v41 = v9;
  uint64_t v42 = v10;
  uint64_t v22 = v10;
  uint64_t v23 = v11;
  uint64_t v43 = v12;
  uint64_t v44 = v11;
  uint64_t v45 = v14;
  uint64_t v46 = v13;
  uint64_t v24 = v13;
  if (qword_2687F4088 != -1) {
    swift_once();
  }
  long long v25 = xmmword_2687F4300;
  uint64_t v26 = qword_2687F4310;
  uint64_t v27 = unk_2687F4318;
  long long v28 = xmmword_2687F4320;
  long long v29 = unk_2687F4330;
  long long v30 = xmmword_2687F4340;
  long long v31 = unk_2687F4350;
  long long v32 = unk_2687F4360;
  if (static MusicSubscriptionOffer.Options.== infix(_:_:)(&v33, &v25)) {
    return 0x746C75616665642ELL;
  }
  uint64_t v33 = 0;
  unint64_t v34 = 0xE000000000000000;
  uint64_t v16 = qword_2687F4068;
  swift_bridgeObjectRetain();
  if (v16 != -1) {
    swift_once();
  }
  if (v1 == qword_2687F42C0 && v2 == qword_2687F42C8)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v18 = sub_2351CA690();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
    {
      *(void *)&long long v25 = 0x203A6E6F69746361;
      *((void *)&v25 + 1) = 0xE800000000000000;
      BOOL v19 = qword_2687F42C0 == v1 && qword_2687F42C8 == v2;
      if (v19 || (sub_2351CA690() & 1) != 0)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        OUTLINED_FUNCTION_8_1();
        swift_bridgeObjectRetain_n();
        sub_2351CA4C0();
        swift_bridgeObjectRelease();
        sub_2351CA4C0();
      }
      sub_2351CA4C0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2351CA4C0();
      swift_bridgeObjectRelease();
      unint64_t v21 = v34;
      uint64_t v20 = v33 & 0xFFFFFFFFFFFFLL;
      goto LABEL_22;
    }
  }
  uint64_t v20 = 0;
  unint64_t v21 = 0xE000000000000000;
LABEL_22:
  if ((v21 & 0x2000000000000000) != 0) {
    uint64_t v20 = HIBYTE(v21) & 0xF;
  }
  if (v20) {
    sub_2351CA4C0();
  }
  OUTLINED_FUNCTION_3_3();
  sub_2351CA5E0();
  swift_bridgeObjectRelease();
  *(void *)&long long v25 = 0xD000000000000013;
  *((void *)&v25 + 1) = 0x80000002351CCB10;
  swift_bridgeObjectRetain();
  MusicSubscriptionOffer.MessageIdentifier.description.getter();
  sub_2351CA4C0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2351CA4C0();
  swift_bridgeObjectRelease();
  if (v5)
  {
    *(void *)&long long v25 = 0x44496D657469202CLL;
    *((void *)&v25 + 1) = 0xEA0000000000203ALL;
    sub_2351CA340();
    sub_2351CA4C0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_2();
    swift_bridgeObjectRelease();
  }
  if (v8)
  {
    OUTLINED_FUNCTION_3_3();
    sub_2351CA5E0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_14_0();
    sub_2351CA4C0();
    OUTLINED_FUNCTION_1_2();
    swift_bridgeObjectRelease();
  }
  if (v22)
  {
    OUTLINED_FUNCTION_3_3();
    sub_2351CA5E0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_14_0();
    sub_2351CA4C0();
    OUTLINED_FUNCTION_1_2();
    swift_bridgeObjectRelease();
  }
  if (v23)
  {
    OUTLINED_FUNCTION_13_1();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_11_1();
    sub_2351CA4C0();
    OUTLINED_FUNCTION_1_2();
    swift_bridgeObjectRelease();
  }
  if (v24)
  {
    OUTLINED_FUNCTION_13_1();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_11_1();
    sub_2351CA4C0();
    OUTLINED_FUNCTION_1_2();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_3_3();
  sub_2351CA5E0();
  swift_bridgeObjectRelease();
  *(void *)&long long v25 = 0xD00000000000001FLL;
  *((void *)&v25 + 1) = 0x80000002351CCB30;
  sub_2351CA4C0();
  swift_bridgeObjectRelease();
  sub_2351CA4C0();
  return v25;
}

uint64_t MusicSubscriptionOffer.Action.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  if (qword_2687F4068 != -1) {
    swift_once();
  }
  uint64_t v2 = 0x697263736275732ELL;
  OUTLINED_FUNCTION_15_0((uint64_t)&qword_2687F42C0);
  BOOL v4 = v4 && v3 == v1;
  if (!v4 && (OUTLINED_FUNCTION_2_1() & 1) == 0)
  {
    OUTLINED_FUNCTION_8_1();
    uint64_t v7 = v5;
    swift_bridgeObjectRetain();
    sub_2351CA4C0();
    swift_bridgeObjectRelease();
    sub_2351CA4C0();
    return v7;
  }
  return v2;
}

unint64_t MusicSubscriptionOffer.MessageIdentifier.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  if (qword_2687F4070 != -1) {
    swift_once();
  }
  uint64_t v2 = 0x6E696F6A2ELL;
  OUTLINED_FUNCTION_15_0((uint64_t)&qword_2687F42D0);
  BOOL v4 = v4 && v3 == v1;
  if (!v4 && (OUTLINED_FUNCTION_2_1() & 1) == 0)
  {
    if (qword_2687F4078 != -1) {
      swift_once();
    }
    uint64_t v2 = 0x6973754D6464612ELL;
    OUTLINED_FUNCTION_15_0((uint64_t)&qword_2687F42E0);
    BOOL v7 = v4 && v6 == v1;
    if (!v7 && (OUTLINED_FUNCTION_2_1() & 1) == 0)
    {
      if (qword_2687F4080 != -1) {
        swift_once();
      }
      uint64_t v2 = 0x73754D79616C702ELL;
      OUTLINED_FUNCTION_15_0((uint64_t)&qword_2687F42F0);
      BOOL v9 = v4 && v8 == v1;
      if (!v9 && (OUTLINED_FUNCTION_2_1() & 1) == 0)
      {
        sub_2351CA5E0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_2351CA4C0();
        swift_bridgeObjectRelease();
        sub_2351CA4C0();
        return 0xD000000000000013;
      }
    }
  }
  return v2;
}

unint64_t sub_2351C34C8()
{
  unint64_t result = qword_2687F4370;
  if (!qword_2687F4370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F4370);
  }
  return result;
}

unint64_t sub_2351C3518()
{
  unint64_t result = qword_2687F4378;
  if (!qword_2687F4378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F4378);
  }
  return result;
}

unint64_t sub_2351C3568()
{
  unint64_t result = qword_2687F4380;
  if (!qword_2687F4380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F4380);
  }
  return result;
}

void type metadata accessor for MusicSubscriptionOffer.Action()
{
}

void *_s17MessageIdentifierVwCP(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s17MessageIdentifierVwxx()
{
  return swift_bridgeObjectRelease();
}

void *_s6ActionVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *_s17MessageIdentifierVwta(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6ActionVwet_0(uint64_t a1, int a2)
{
  if (a2)
  {
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
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_2351C36BC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for MusicSubscriptionOffer.MessageIdentifier()
{
}

uint64_t _s7OptionsVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s7OptionsVwcp(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  uint64_t v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  uint64_t v9 = a2[13];
  a1[12] = a2[12];
  a1[13] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s7OptionsVwca(void *a1, void *a2)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

void *_s7OptionsVwta(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s7OptionsVwet(uint64_t a1, int a2)
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

uint64_t _s7OptionsVwst(uint64_t result, int a2, int a3)
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
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

void type metadata accessor for MusicSubscriptionOffer.Options()
{
}

unint64_t sub_2351C3A68()
{
  unint64_t result = qword_2687F40E0;
  if (!qword_2687F40E0)
  {
    type metadata accessor for MusicKit_SPI_SKCloudServiceSetupOptionsKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F40E0);
  }
  return result;
}

void sub_2351C3AB8(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_2351C3DC0((_OWORD *)a1, v3);
    sub_2351C3DD0(v3, a2);
  }
  else
  {
    sub_2351AF834(a1);
    sub_2351C3C8C((uint64_t)a2, v3);

    sub_2351AF834((uint64_t)v3);
  }
}

uint64_t sub_2351C3B20()
{
  uint64_t result = sub_2351CA450();
  qword_2687F5768 = result;
  return result;
}

uint64_t sub_2351C3B50()
{
  uint64_t result = sub_2351CA450();
  qword_2687F5770 = result;
  return result;
}

uint64_t sub_2351C3B80()
{
  sub_2351CA480();
  sub_2351CA6F0();
  sub_2351CA4A0();
  uint64_t v0 = sub_2351CA730();
  swift_bridgeObjectRelease();
  return v0;
}

unint64_t sub_2351C3BF8(uint64_t a1)
{
  sub_2351CA480();
  sub_2351CA6F0();
  sub_2351CA4A0();
  uint64_t v2 = sub_2351CA730();
  swift_bridgeObjectRelease();

  return sub_2351C3FE8(a1, v2);
}

double sub_2351C3C8C@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_2351C3BF8(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4388);
    sub_2351CA620();

    sub_2351C3DC0((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    type metadata accessor for MusicKit_SPI_SKCloudServiceSetupOptionsKey(0);
    sub_2351C3A68();
    sub_2351CA630();
    uint64_t *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

_OWORD *sub_2351C3DC0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2351C3DD0(_OWORD *a1, void *a2)
{
  swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v2;
  *long long v2 = 0x8000000000000000;
  sub_2351C3E50(a1, a2);
  *long long v2 = v6;

  return swift_bridgeObjectRelease();
}

_OWORD *sub_2351C3E50(_OWORD *a1, void *a2)
{
  uint64_t v3 = (void **)v2;
  uint64_t v5 = (void *)*v2;
  unint64_t v6 = sub_2351C3BF8((uint64_t)a2);
  if (__OFADD__(v5[2], (v7 & 1) == 0))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v8 = v6;
  char v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4388);
  if ((sub_2351CA620() & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v10 = sub_2351C3BF8((uint64_t)a2);
  if ((v9 & 1) != (v11 & 1))
  {
LABEL_13:
    type metadata accessor for MusicKit_SPI_SKCloudServiceSetupOptionsKey(0);
    double result = (_OWORD *)sub_2351CA6A0();
    __break(1u);
    return result;
  }
  unint64_t v8 = v10;
LABEL_5:
  uint64_t v12 = *v3;
  if (v9)
  {
    uint64_t v13 = (_OWORD *)(v12[7] + 32 * v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    return sub_2351C3DC0(a1, v13);
  }
  else
  {
    sub_2351C3F80(v8, (uint64_t)a2, a1, v12);
    return a2;
  }
}

_OWORD *sub_2351C3F80(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  double result = sub_2351C3DC0(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

unint64_t sub_2351C3FE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_2351CA480();
    uint64_t v8 = v7;
    if (v6 == sub_2351CA480() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_2351CA690();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_2351CA480();
          uint64_t v15 = v14;
          if (v13 == sub_2351CA480() && v15 == v16) {
            break;
          }
          char v18 = sub_2351CA690();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

void destroy for CloudServiceSetupView(uint64_t a1)
{
}

uint64_t initializeWithCopy for CloudServiceSetupView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v20 = *(void *)(a2 + 24);
  unint64_t v21 = *(void **)(a2 + 16);
  uint64_t v18 = *(void *)(a2 + 40);
  uint64_t v19 = *(void *)(a2 + 32);
  uint64_t v16 = *(void *)(a2 + 56);
  uint64_t v17 = *(void *)(a2 + 48);
  uint64_t v14 = *(void *)(a2 + 72);
  uint64_t v15 = *(void *)(a2 + 64);
  uint64_t v4 = *(void *)(a2 + 88);
  uint64_t v5 = *(void *)(a2 + 96);
  uint64_t v6 = *(void *)(a2 + 104);
  uint64_t v7 = *(void *)(a2 + 112);
  uint64_t v8 = *(void *)(a2 + 120);
  uint64_t v13 = *(void *)(a2 + 80);
  uint64_t v9 = *(void *)(a2 + 128);
  char v10 = *(unsigned char *)(a2 + 136);
  char v11 = *(unsigned char *)(a2 + 137);
  swift_retain();
  swift_retain();
  sub_2351BB4EC(v21, v20, v19, v18, v17, v16, v15, v14, v13, v4, v5, v6, v7, v8, v9, v10, v11);
  *(void *)(a1 + 16) = v21;
  *(void *)(a1 + 24) = v20;
  *(void *)(a1 + 32) = v19;
  *(void *)(a1 + 40) = v18;
  *(void *)(a1 + 48) = v17;
  *(void *)(a1 + 56) = v16;
  *(void *)(a1 + 64) = v15;
  *(void *)(a1 + 72) = v14;
  *(void *)(a1 + 80) = v13;
  *(void *)(a1 + 88) = v4;
  *(void *)(a1 + 96) = v5;
  *(void *)(a1 + 104) = v6;
  *(void *)(a1 + 112) = v7;
  *(void *)(a1 + 120) = v8;
  *(void *)(a1 + 128) = v9;
  *(unsigned char *)(a1 + 136) = v10;
  *(unsigned char *)(a1 + 137) = v11;
  return a1;
}

uint64_t assignWithCopy for CloudServiceSetupView(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = v2[1];
  swift_retain();
  swift_release();
  uint64_t v4 = (void *)v2[2];
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  uint64_t v7 = v2[5];
  uint64_t v8 = v2[6];
  uint64_t v9 = v2[7];
  uint64_t v10 = v2[8];
  uint64_t v11 = v2[9];
  uint64_t v26 = v2[10];
  uint64_t v27 = v2[11];
  uint64_t v28 = v2[12];
  uint64_t v29 = v2[13];
  uint64_t v30 = v2[14];
  uint64_t v31 = v2[15];
  uint64_t v32 = v2[16];
  char v33 = *((unsigned char *)v2 + 136);
  LOBYTE(v2) = *((unsigned char *)v2 + 137);
  sub_2351BB4EC(v4, v5, v6, v7, v8, v9, v10, v11, v26, v27, v28, v29, v30, v31, v32, v33, (char)v2);
  uint64_t v12 = *(void **)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 56);
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v19 = *(void *)(a1 + 72);
  long long v20 = *(_OWORD *)(a1 + 80);
  long long v21 = *(_OWORD *)(a1 + 96);
  long long v22 = *(_OWORD *)(a1 + 112);
  uint64_t v23 = *(void *)(a1 + 128);
  __int16 v24 = *(_WORD *)(a1 + 136);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = v10;
  *(void *)(a1 + 72) = v11;
  *(void *)(a1 + 80) = v26;
  *(void *)(a1 + 88) = v27;
  *(void *)(a1 + 96) = v28;
  *(void *)(a1 + 104) = v29;
  *(void *)(a1 + 112) = v30;
  *(void *)(a1 + 120) = v31;
  *(void *)(a1 + 128) = v32;
  *(unsigned char *)(a1 + 136) = v33;
  *(unsigned char *)(a1 + 137) = (_BYTE)v2;
  sub_2351BB344(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, v24, SHIBYTE(v24));
  return a1;
}

void *__swift_memcpy138_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x8AuLL);
}

uint64_t assignWithTake for CloudServiceSetupView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 128);
  __int16 v5 = *(_WORD *)(a2 + 136);
  uint64_t v6 = *(void **)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  long long v14 = *(_OWORD *)(a1 + 80);
  long long v15 = *(_OWORD *)(a1 + 96);
  long long v16 = *(_OWORD *)(a1 + 112);
  uint64_t v17 = *(void *)(a1 + 128);
  __int16 v18 = *(_WORD *)(a1 + 136);
  long long v19 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v19;
  long long v20 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v20;
  long long v21 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v21;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = v4;
  *(_WORD *)(a1 + 136) = v5;
  sub_2351BB344(v6, v7, v8, v9, v10, v11, v12, v13, v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17, v18, SHIBYTE(v18));
  return a1;
}

uint64_t getEnumTagSinglePayload for CloudServiceSetupView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 138))
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

uint64_t storeEnumTagSinglePayload for CloudServiceSetupView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 136) = 0;
    *(void *)double result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 138) = 1;
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
    *(unsigned char *)(result + 138) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CloudServiceSetupView()
{
  return &type metadata for CloudServiceSetupView;
}

uint64_t sub_2351C4634()
{
  return MEMORY[0x263F1BB58];
}

id sub_2351C4640()
{
  OUTLINED_FUNCTION_0_4(v2);
  _s11CoordinatorCMa();
  OUTLINED_FUNCTION_0_4(v1);
  sub_2351C4A28((uint64_t)v2);
  return sub_2351C4B40(v1);
}

uint64_t sub_2351C469C()
{
  OUTLINED_FUNCTION_0_4(__src);
  OUTLINED_FUNCTION_0_4(__dst);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687F4410);
  MEMORY[0x237DD6840](v7);
  sub_2351BB16C((uint64_t)v7, (uint64_t)v9);
  sub_2351BB16C((uint64_t)v9, (uint64_t)v10);
  if (sub_2351BC5D8((uint64_t)v10))
  {
    sub_2351BC1D4((uint64_t)v9);
    __dst[0] = 0;
    __dst[1] = 0xE000000000000000;
    sub_2351C4A28((uint64_t)__src);
    sub_2351CA5E0();
    v5[16] = __dst[0];
    v5[17] = __dst[1];
    sub_2351CA4C0();
    memcpy(__dst, __src, 0x8AuLL);
    MEMORY[0x237DD6840](v5, v0);
    sub_2351BB16C((uint64_t)v5, (uint64_t)__dst);
    sub_2351BB16C((uint64_t)__dst, (uint64_t)v4);
    sub_2351CA610();
    sub_2351BC1D4((uint64_t)__dst);
    sub_2351CA4C0();
    uint64_t result = sub_2351CA650();
    __break(1u);
  }
  else
  {
    uint64_t v1 = *(void **)nullsub_1(v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4390);
    sub_2351CA0E0();
    unint64_t v2 = (void *)__dst[0];
    objc_msgSend(v1, sel_musicKit_setDelegate_, __dst[0]);

    return (uint64_t)v1;
  }
  return result;
}

id sub_2351C48D0@<X0>(void *a1@<X8>)
{
  id result = sub_2351C4640();
  *a1 = result;
  return result;
}

uint64_t sub_2351C48F8()
{
  return sub_2351CA080();
}

uint64_t sub_2351C4934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2351C4AF4();

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_2351C4998(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2351C4AF4();

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_2351C49FC()
{
}

uint64_t sub_2351C4A28(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 24);
  long long v15 = *(void **)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)(a1 + 80);
  long long v11 = *(_OWORD *)(a1 + 112);
  uint64_t v8 = *(void *)(a1 + 128);
  __int16 v9 = *(_WORD *)(a1 + 136);
  swift_retain();
  swift_retain();
  sub_2351BB4EC(v15, v14, v2, v3, v4, v5, v6, v7, v13[0], v13[1], v12[0], v12[1], v11, *((uint64_t *)&v11 + 1), v8, v9, SHIBYTE(v9));
  return a1;
}

unint64_t sub_2351C4AF4()
{
  unint64_t result = qword_2687F4398;
  if (!qword_2687F4398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F4398);
  }
  return result;
}

id sub_2351C4B40(const void *a1)
{
  uint64_t v3 = (char *)objc_allocWithZone(v1);
  memcpy(&v3[OBJC_IVAR____TtCV17_MusicKit_SwiftUI21CloudServiceSetupView11Coordinator_parent], a1, 0x8AuLL);
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t sub_2351C4BA8()
{
  memcpy(__dst, (const void *)(v0 + OBJC_IVAR____TtCV17_MusicKit_SwiftUI21CloudServiceSetupView11Coordinator_parent), sizeof(__dst));
  sub_2351BB148((uint64_t)v5);
  memcpy(v3, __dst, sizeof(v3));
  sub_2351BB16C((uint64_t)v5, (uint64_t)&v2);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2687F4410);
  return sub_2351CA2A0();
}

void sub_2351C4C84()
{
}

id sub_2351C4CC4()
{
  v2.receiver = v0;
  v2.super_class = (Class)_s11CoordinatorCMa();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s11CoordinatorCMa()
{
  return self;
}

uint64_t sub_2351C4D58(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 24);
  long long v15 = *(void **)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  long long v12 = *(_OWORD *)(a1 + 96);
  long long v13 = *(_OWORD *)(a1 + 80);
  long long v11 = *(_OWORD *)(a1 + 112);
  uint64_t v8 = *(void *)(a1 + 128);
  __int16 v9 = *(_WORD *)(a1 + 136);
  swift_release();
  swift_release();
  sub_2351BB344(v15, v14, v2, v3, v4, v5, v6, v7, v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v11, *((uint64_t *)&v11 + 1), v8, v9, SHIBYTE(v9));
  return a1;
}

void _s17PresentationStateOwxx(uint64_t a1)
{
}

uint64_t _s17PresentationStateOwcp(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  uint64_t v15 = *(void *)(a2 + 88);
  uint64_t v16 = *(void *)(a2 + 96);
  uint64_t v17 = *(void *)(a2 + 104);
  uint64_t v18 = *(void *)(a2 + 112);
  char v19 = *(unsigned char *)(a2 + 120);
  char v20 = *(unsigned char *)(a2 + 121);
  sub_2351BB4EC(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  *(void *)(a1 + 112) = v18;
  *(unsigned char *)(a1 + 120) = v19;
  *(unsigned char *)(a1 + 121) = v20;
  return a1;
}

uint64_t _s17PresentationStateOwca(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v26 = *(void *)(a2 + 72);
  uint64_t v27 = *(void *)(a2 + 80);
  uint64_t v28 = *(void *)(a2 + 88);
  uint64_t v29 = *(void *)(a2 + 96);
  uint64_t v30 = *(void *)(a2 + 104);
  uint64_t v31 = *(void *)(a2 + 112);
  char v32 = *(unsigned char *)(a2 + 120);
  char v33 = *(unsigned char *)(a2 + 121);
  sub_2351BB4EC(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v26, v27, v28, v29, v30, v31, v32, v33);
  long long v12 = *(void **)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 80);
  long long v22 = *(_OWORD *)(a1 + 96);
  uint64_t v23 = *(void *)(a1 + 112);
  __int16 v24 = *(_WORD *)(a1 + 120);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v26;
  *(void *)(a1 + 80) = v27;
  *(void *)(a1 + 88) = v28;
  *(void *)(a1 + 96) = v29;
  *(void *)(a1 + 104) = v30;
  *(void *)(a1 + 112) = v31;
  *(unsigned char *)(a1 + 120) = v32;
  *(unsigned char *)(a1 + 121) = v33;
  sub_2351BB344(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, v24, SHIBYTE(v24));
  return a1;
}

void *__swift_memcpy122_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x7AuLL);
}

uint64_t _s17PresentationStateOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 112);
  __int16 v4 = *(_WORD *)(a2 + 120);
  uint64_t v5 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  long long v13 = *(_OWORD *)(a1 + 64);
  long long v14 = *(_OWORD *)(a1 + 80);
  long long v15 = *(_OWORD *)(a1 + 96);
  uint64_t v16 = *(void *)(a1 + 112);
  __int16 v17 = *(_WORD *)(a1 + 120);
  long long v18 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v18;
  long long v19 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v19;
  long long v20 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v20;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(void *)(a1 + 112) = v3;
  *(_WORD *)(a1 + 120) = v4;
  sub_2351BB344(v5, v7, v6, v8, v9, v10, v11, v12, v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, v17, SHIBYTE(v17));
  return a1;
}

uint64_t _s17PresentationStateOwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 122))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 121);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s17PresentationStateOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 120) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 122) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 122) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 121) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2351C5218(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)unint64_t result = a2 - 2;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    LOBYTE(a2) = 2;
    *(unsigned char *)(result + 120) = 0;
  }
  *(unsigned char *)(result + 121) = a2;
  return result;
}

ValueMetadata *_s17PresentationStateOMa()
{
  return &_s17PresentationStateON;
}

BOOL sub_2351C5268(unsigned __int8 a1, unsigned __int8 a2)
{
  if (a1 == 2) {
    return a2 == 2;
  }
  if (a1 == 3) {
    return a2 == 3;
  }
  if ((a2 & 0xFE) == 2) {
    return 0;
  }
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2351C52C0(uint64_t a1, char a2)
{
  if (a2 != 2 && a2 != 3) {
    sub_2351CA700();
  }
  return sub_2351CA700();
}

uint64_t sub_2351C5318(char a1)
{
  if (a1 != 2 && a1 != 3) {
    sub_2351CA700();
  }
  sub_2351CA700();
  return sub_2351CA730();
}

BOOL sub_2351C5390(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2351C5268(*a1, *a2);
}

uint64_t sub_2351C539C()
{
  return sub_2351C5318(*v0);
}

uint64_t sub_2351C53A4(uint64_t a1)
{
  return sub_2351C52C0(a1, *v1);
}

uint64_t sub_2351C53AC()
{
  int v1 = *v0;
  sub_2351CA6F0();
  if (v1 != 2 && v1 != 3) {
    sub_2351CA700();
  }
  sub_2351CA700();
  return sub_2351CA730();
}

BOOL sub_2351C5420(uint64_t a1, uint64_t a2)
{
  sub_2351BB16C(a1, (uint64_t)v37);
  sub_2351BB16C(a2, (uint64_t)v38);
  sub_2351BB16C((uint64_t)v37, (uint64_t)v39);
  sub_2351BB16C((uint64_t)v38, (uint64_t)&v40);
  sub_2351BB16C((uint64_t)v37, (uint64_t)v41);
  int v3 = sub_2351BC5D8((uint64_t)v41);
  if (v3)
  {
    if (v3 == 1)
    {
      nullsub_1(v41);
      sub_2351BB16C((uint64_t)v38, (uint64_t)v36);
      if (sub_2351BC5D8((uint64_t)v36) == 1)
      {
        nullsub_1(v36);
        sub_2351C5834((uint64_t)v38);
        sub_2351C5834((uint64_t)v37);
LABEL_9:
        sub_2351C5898((uint64_t)v39);
        return 1;
      }
    }
    else
    {
      sub_2351BB16C((uint64_t)v38, (uint64_t)v36);
      if (sub_2351BC5D8((uint64_t)v36) == 2) {
        goto LABEL_9;
      }
    }
    goto LABEL_10;
  }
  uint64_t v4 = nullsub_1(v41);
  sub_2351BB16C((uint64_t)v38, (uint64_t)v36);
  if (sub_2351BC5D8((uint64_t)v36))
  {
LABEL_10:
    sub_2351C5834((uint64_t)v38);
    sub_2351C5834((uint64_t)v37);
    sub_2351C5898((uint64_t)v39);
    return 0;
  }
  uint64_t v5 = nullsub_1(v36);
  uint64_t v6 = *(void *)(v4 + 24);
  uint64_t v7 = *(void *)(v4 + 32);
  unsigned __int8 v8 = *(unsigned char *)(v4 + 120);
  long long v9 = *(_OWORD *)(v5 + 8);
  uint64_t v10 = *(void *)(v5 + 24);
  uint64_t v11 = *(void *)(v5 + 32);
  unsigned __int8 v12 = *(unsigned char *)(v5 + 120);
  long long v28 = *(_OWORD *)(v4 + 8);
  uint64_t v29 = v6;
  uint64_t v30 = v7;
  long long v13 = *(_OWORD *)(v4 + 56);
  long long v31 = *(_OWORD *)(v4 + 40);
  long long v32 = v13;
  long long v14 = *(_OWORD *)(v4 + 88);
  long long v33 = *(_OWORD *)(v4 + 72);
  long long v34 = v14;
  long long v35 = *(_OWORD *)(v4 + 104);
  long long v20 = v9;
  uint64_t v21 = v10;
  uint64_t v22 = v11;
  long long v15 = *(_OWORD *)(v5 + 56);
  long long v23 = *(_OWORD *)(v5 + 40);
  long long v24 = v15;
  long long v16 = *(_OWORD *)(v5 + 88);
  long long v25 = *(_OWORD *)(v5 + 72);
  long long v26 = v16;
  long long v27 = *(_OWORD *)(v5 + 104);
  char v17 = static MusicSubscriptionOffer.Options.== infix(_:_:)(&v28, &v20);
  sub_2351C5834((uint64_t)v38);
  sub_2351C5834((uint64_t)v37);
  sub_2351C5898((uint64_t)v39);
  if ((v17 & 1) == 0) {
    return 0;
  }
  return sub_2351C5268(v8, v12);
}

uint64_t sub_2351C5600()
{
  sub_2351BB16C(v0, (uint64_t)v4);
  sub_2351BB16C((uint64_t)v4, (uint64_t)v5);
  int v1 = sub_2351BC5D8((uint64_t)v5);
  if (v1)
  {
    if (v1 == 1) {
      nullsub_1(v5);
    }
    return sub_2351CA4A0();
  }
  else
  {
    int v2 = *(unsigned __int8 *)(nullsub_1(v5) + 120);
    sub_2351CA4A0();
    MusicSubscriptionOffer.Options.hash(into:)();
    if (v2 != 3 && v2 != 2) {
      sub_2351CA700();
    }
    return sub_2351CA700();
  }
}

uint64_t sub_2351C5768()
{
  sub_2351BB16C(v0, (uint64_t)v3);
  sub_2351BB16C((uint64_t)v3, (uint64_t)v2);
  sub_2351CA6F0();
  sub_2351C5600();
  return sub_2351CA730();
}

uint64_t sub_2351C57CC()
{
  sub_2351BB16C(v0, (uint64_t)v3);
  sub_2351BB16C((uint64_t)v3, (uint64_t)v2);
  sub_2351CA6F0();
  sub_2351C5600();
  return sub_2351CA730();
}

uint64_t sub_2351C5834(uint64_t a1)
{
  return a1;
}

uint64_t sub_2351C5898(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 136);
  long long v15 = *(void **)(a1 + 128);
  uint64_t v3 = *(void *)(a1 + 144);
  uint64_t v4 = *(void *)(a1 + 152);
  uint64_t v5 = *(void *)(a1 + 160);
  uint64_t v6 = *(void *)(a1 + 168);
  uint64_t v7 = *(void *)(a1 + 176);
  uint64_t v8 = *(void *)(a1 + 184);
  long long v13 = *(_OWORD *)(a1 + 208);
  long long v14 = *(_OWORD *)(a1 + 192);
  long long v12 = *(_OWORD *)(a1 + 224);
  uint64_t v9 = *(void *)(a1 + 240);
  __int16 v10 = *(_WORD *)(a1 + 248);
  sub_2351BB344(*(void **)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(_WORD *)(a1 + 120), HIBYTE(*(_WORD *)(a1 + 120)));
  sub_2351BB344(v15, v2, v3, v4, v5, v6, v7, v8, v14, *((uint64_t *)&v14 + 1), v13, *((uint64_t *)&v13 + 1), v12, *((uint64_t *)&v12 + 1), v9, v10, SHIBYTE(v10));
  return a1;
}

uint64_t _s17PresentationStateO14ActiveSubstateOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD)
  {
    unsigned int v2 = a2 + 3;
    if (a2 + 3 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 3;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 3;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x2351C5A3CLL);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 3;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  if (v7 >= 2) {
    unsigned int v8 = v7 - 1;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 >= 3) {
    return v8 - 2;
  }
  else {
    return 0;
  }
}

unsigned char *_s17PresentationStateO14ActiveSubstateOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 3;
  if (a3 + 3 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFD) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v7 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x2351C5B24);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_2351C5B4C(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 2) {
    return v1 - 1;
  }
  else {
    return 0;
  }
}

unsigned char *sub_2351C5B60(unsigned char *result, int a2)
{
  if (a2) {
    *unint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *_s17PresentationStateO14ActiveSubstateOMa()
{
  return &_s17PresentationStateO14ActiveSubstateON;
}

unint64_t sub_2351C5B84()
{
  unint64_t result = qword_2687F4480;
  if (!qword_2687F4480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F4480);
  }
  return result;
}

BOOL static ArtworkImage._ReusePolicy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ArtworkImage._ReusePolicy.hash(into:)()
{
  return sub_2351CA700();
}

void *static ArtworkImage._ReusePolicy.allCases.getter()
{
  return &unk_26E877728;
}

uint64_t ArtworkImage._ReusePolicy.hashValue.getter()
{
  return sub_2351CA730();
}

void sub_2351C5C68(void *a1@<X8>)
{
  *a1 = &unk_26E877728;
}

uint64_t sub_2351C5C84()
{
  return sub_2351CA730();
}

unint64_t sub_2351C5CCC()
{
  unint64_t result = qword_2687F4488;
  if (!qword_2687F4488)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F4490);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F4488);
  }
  return result;
}

unint64_t sub_2351C5D24()
{
  unint64_t result = qword_2687F4498;
  if (!qword_2687F4498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2687F4498);
  }
  return result;
}

uint64_t _s12_ReusePolicyOwet(unsigned __int8 *a1, unsigned int a2)
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
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s12_ReusePolicyOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2351C5EC4);
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

unsigned char *sub_2351C5EEC(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ArtworkImage._ReusePolicy()
{
  return &type metadata for ArtworkImage._ReusePolicy;
}

id sub_2351C5F08()
{
  id v1 = objc_msgSend(v0, sel_dataSource);
  if (v1)
  {
    uint64_t v2 = (uint64_t)v1;
    id v3 = objc_msgSend(v0, sel_token);
    sub_2351CA5C0();
    swift_unknownObjectRelease();
    id v4 = objc_allocWithZone(MEMORY[0x263F11D30]);
    return sub_2351C65B4(v13, v2);
  }
  else
  {
    if (qword_2687F4058 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_2351C9E90();
    __swift_project_value_buffer(v6, (uint64_t)qword_2687F5738);
    id v12 = v0;
    BOOL v7 = sub_2351C9E70();
    os_log_type_t v8 = sub_2351CA550();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      __int16 v10 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 138543362;
      v13[0] = v12;
      id v11 = v12;
      sub_2351CA5A0();
      *__int16 v10 = v12;

      _os_log_impl(&dword_2351AA000, v7, v8, "Data source for artwork catalog %{public}@ was deallocated prematurely. Unable to make a proper fresh instance.", v9, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2687F42A0);
      swift_arrayDestroy();
      MEMORY[0x237DD72C0](v10, -1, -1);
      MEMORY[0x237DD72C0](v9, -1, -1);
    }
    else
    {
    }
    return v12;
  }
}

uint64_t sub_2351C6148(id a1, id a2)
{
  if (!a2) {
    return a1 == 0;
  }
  if (!a1) {
    return 0;
  }
  if (a2 == a1) {
    return 1;
  }
  return (uint64_t)objc_msgSend(a2, sel_isArtworkVisuallyIdenticalToCatalog_, a1, v2, v3);
}

id sub_2351C61A4()
{
  if (objc_msgSend(v0, sel_isImagePrepared)) {
    return objc_msgSend(v0, sel_image);
  }
  else {
    return 0;
  }
}

uint64_t sub_2351C61EC()
{
  *(void *)(v1 + 128) = v0;
  return MEMORY[0x270FA2498](sub_2351C620C, 0, 0);
}

uint64_t sub_2351C620C()
{
  id v1 = sub_2351C61A4();
  if (v1
    || (id v4 = objc_msgSend(*(id *)(v0 + 128), sel_image),
        (*(void *)(v0 + 136) = v4) == 0))
  {
    uint64_t v2 = *(uint64_t (**)(id))(v0 + 8);
    return v2(v1);
  }
  else
  {
    uint64_t v5 = v4;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_2351C6370;
    uint64_t v6 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_2351C64B8;
    *(void *)(v0 + 104) = &block_descriptor;
    *(void *)(v0 + 112) = v6;
    objc_msgSend(v5, sel_prepareForDisplayWithCompletionHandler_, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
}

uint64_t sub_2351C6370()
{
  return MEMORY[0x270FA2498](sub_2351C6450, 0, 0);
}

uint64_t sub_2351C6450()
{
  uint64_t v1 = *(void *)(v0 + 120);

  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2351C64B8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;

  return sub_2351C64F8(v3, (uint64_t)a2);
}

uint64_t sub_2351C64F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  sub_2351C654C((uint64_t)&v3, *(void *)(*(void *)(a1 + 64) + 40));
  return swift_continuation_resume();
}

uint64_t sub_2351C654C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD835F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_2351C65B4(void *a1, uint64_t a2)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  id v5 = objc_msgSend(v2, sel_initWithToken_dataSource_, sub_2351CA680(), a2);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v5;
}

id sub_2351C6630()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_2351C668C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MusicKit_SwiftUI_FinalClass()
{
  return self;
}

id sub_2351C66E8()
{
  type metadata accessor for MusicKit_SwiftUI_FinalClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2687F5778 = (uint64_t)result;
  return result;
}

BOOL static Artwork._LoadingStatus.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a2 + 8);
  switch(*(unsigned char *)(a1 + 8))
  {
    case 1:
      if (v2 != 1) {
        goto LABEL_14;
      }
      goto LABEL_13;
    case 2:
      if (v2 != 2) {
        goto LABEL_14;
      }
      goto LABEL_13;
    case 3:
      if (v2 != 3 || *(void *)a2 != 0) {
        goto LABEL_14;
      }
      BOOL result = 1;
      break;
    default:
      if (*(unsigned char *)(a2 + 8)) {
LABEL_14:
      }
        BOOL result = 0;
      else {
LABEL_13:
      }
        BOOL result = *(double *)a1 == *(double *)a2;
      break;
  }
  return result;
}

uint64_t Artwork._LoadingStatus.hash(into:)()
{
  switch(*(unsigned char *)(v0 + 8))
  {
    case 1:
      sub_2351CA700();
      sub_2351CA720();
      goto LABEL_3;
    case 3:
LABEL_3:
      uint64_t result = sub_2351CA700();
      break;
    default:
      sub_2351CA700();
      uint64_t result = sub_2351CA720();
      break;
  }
  return result;
}

uint64_t Artwork._LoadingStatus.hashValue.getter()
{
  return sub_2351CA730();
}

uint64_t sub_2351C68C8()
{
  return sub_2351CA730();
}

unint64_t sub_2351C691C()
{
  unint64_t result = qword_2687F44A8;
  if (!qword_2687F44A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2687F44A8);
  }
  return result;
}

uint64_t _s14_LoadingStatusOwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFD && *(unsigned char *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 3) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s14_LoadingStatusOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 253;
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

uint64_t sub_2351C69EC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_2351C6A04(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)unint64_t result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Artwork._LoadingStatus()
{
  return &type metadata for Artwork._LoadingStatus;
}

void *__swift_memcpy96_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

uint64_t _s8GeometryVwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 96))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      if (*(unsigned __int8 *)(a1 + 57) <= 2u) {
        int v3 = 2;
      }
      else {
        int v3 = *(unsigned __int8 *)(a1 + 57);
      }
      int v4 = v3 - 3;
      if (*(unsigned __int8 *)(a1 + 57) < 2u) {
        int v2 = -1;
      }
      else {
        int v2 = v4;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s8GeometryVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 96) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 96) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 57) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *_s8GeometryVMa()
{
  return &_s8GeometryVN;
}

uint64_t sub_2351C6AEC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, unsigned __int8 a10)
{
  uint64_t v10 = a4 & 1;
  uint64_t v11 = a6 & 1;
  double v12 = 1.0;
  if (result >= 1 && a2 >= 1) {
    double v12 = (double)result / (double)a2;
  }
  if ((a4 & 1) == 0)
  {
    if ((a6 & 1) == 0)
    {
      double v14 = a5;
      double v15 = a3;
      double v16 = a3;
      double v17 = a5;
      double v18 = a5;
      if (a8) {
        goto LABEL_20;
      }
      goto LABEL_15;
    }
    double v15 = a3;
    double v14 = a3 / v12;
    if ((a8 & 1) == 0)
    {
      double v17 = a3 / a7;
      double v16 = a3;
      goto LABEL_15;
    }
    double v16 = a3;
    goto LABEL_19;
  }
  if ((a6 & 1) == 0)
  {
    double v14 = a5;
    double v16 = v12 * a5;
    if ((a8 & 1) == 0)
    {
      double v15 = a5 * a7;
      double v17 = a5;
LABEL_15:
      double v18 = v17;
LABEL_20:
      unint64_t v19 = a8 & 1 | ((unint64_t)a10 << 8);
      goto LABEL_21;
    }
    double v15 = v16;
LABEL_19:
    double v18 = v14;
    goto LABEL_20;
  }
  unint64_t result = 0;
  a2 = 0;
  a3 = 0.0;
  uint64_t v10 = 0;
  a5 = 0.0;
  uint64_t v11 = 0;
  a7 = 0.0;
  double v16 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  unint64_t v19 = 768;
  double v18 = 0.0;
LABEL_21:
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(double *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = v10;
  *(double *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = v11;
  *(double *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = v19;
  *(double *)(a9 + 64) = v16;
  *(double *)(a9 + 72) = v14;
  *(double *)(a9 + 80) = v15;
  *(double *)(a9 + 88) = v18;
  return result;
}

double sub_2351C6BE4(double a1)
{
  memcpy(__dst, v1, sizeof(__dst));
  swift_getAtKeyPath();
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(vrndaq_f64(vdivq_f64(v4, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a1, 0))), a1);
  return result;
}

BOOL sub_2351C6C48(uint64_t a1, uint64_t a2, char a3)
{
  sub_2351C6E7C(v3 + 57, (uint64_t)&v10, &qword_26AD830C0);
  sub_2351C6E7C((uint64_t)&v10, (uint64_t)&v11, &qword_26AD830C0);
  if (v11 != 2) {
    return v11 & 1;
  }
  if (a3) {
    return 0;
  }
  sub_2351C6E7C(v3 + 48, (uint64_t)v9, &qword_26AD83038);
  sub_2351C6E7C((uint64_t)v9, (uint64_t)&v12, &qword_26AD83038);
  if (v13) {
    return 0;
  }
  double v7 = fabs((*(double *)&a1 / *(double *)&a2 - v12) / v12);
  if (v7 <= 2.22044605e-16) {
    return 0;
  }
  return v7 < 0.1;
}

BOOL sub_2351C6D3C(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2 || *(void *)(a1 + 8) != *(void *)(a2 + 8)) {
    return 0;
  }
  char v4 = *(unsigned char *)(a2 + 24);
  if (*(unsigned char *)(a1 + 24))
  {
    if (!*(unsigned char *)(a2 + 24)) {
      return 0;
    }
  }
  else
  {
    if (*(double *)(a1 + 16) != *(double *)(a2 + 16)) {
      char v4 = 1;
    }
    if (v4) {
      return 0;
    }
  }
  char v5 = *(unsigned char *)(a2 + 40);
  if (*(unsigned char *)(a1 + 40))
  {
    if (!*(unsigned char *)(a2 + 40)) {
      return 0;
    }
  }
  else
  {
    if (*(double *)(a1 + 32) != *(double *)(a2 + 32)) {
      char v5 = 1;
    }
    if (v5) {
      return 0;
    }
  }
  char v6 = *(unsigned char *)(a2 + 56);
  if (*(unsigned char *)(a1 + 56))
  {
    if (!*(unsigned char *)(a2 + 56)) {
      return 0;
    }
  }
  else
  {
    if (*(double *)(a1 + 48) != *(double *)(a2 + 48)) {
      char v6 = 1;
    }
    if (v6) {
      return 0;
    }
  }
  int v7 = *(unsigned __int8 *)(a2 + 57);
  if (*(unsigned char *)(a1 + 57) == 2)
  {
    if (v7 != 2) {
      return 0;
    }
  }
  else if (v7 == 2 || (sub_2351C9EA0() & 1) == 0)
  {
    return 0;
  }
  return *(double *)(a1 + 64) == *(double *)(a2 + 64)
      && *(double *)(a1 + 72) == *(double *)(a2 + 72)
      && *(double *)(a1 + 80) == *(double *)(a2 + 80)
      && *(double *)(a1 + 88) == *(double *)(a2 + 88);
}

uint64_t sub_2351C6E7C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unsigned char *_s18FailureAlertReasonOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *double result = a2 + 1;
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
        JUMPOUT(0x2351C6FACLL);
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
          *double result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *_s18FailureAlertReasonOMa()
{
  return &_s18FailureAlertReasonON;
}

uint64_t sub_2351C6FE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v32[2] = a1;
  uint64_t v37 = a2;
  uint64_t v3 = _s20FailureAlertModifierVMa();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  unsigned int v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4510);
  OUTLINED_FUNCTION_0_1();
  uint64_t v33 = v7;
  uint64_t v34 = v8;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_9();
  uint64_t v38 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4518);
  OUTLINED_FUNCTION_0_1();
  uint64_t v35 = v10;
  uint64_t v36 = v11;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_9();
  v32[3] = v12;
  uint64_t v13 = *(void *)(v2 + 8);
  char v14 = *(unsigned char *)(v2 + 16);
  uint64_t v41 = *(void *)v2;
  uint64_t v42 = v13;
  LOBYTE(v43) = v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4520);
  MEMORY[0x237DD6840](v40, v15);
  sub_2351C96A8(v2, (uint64_t)v6);
  uint64_t v16 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v17 = (v16 + 16) & ~v16;
  v32[1] = v16 | 7;
  uint64_t v18 = swift_allocObject();
  sub_2351BC574((uint64_t)v6, v18 + v17);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4528);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F41E8);
  uint64_t v21 = sub_2351C1ABC(&qword_2687F4530, &qword_2687F4528);
  unint64_t v22 = sub_2351BC0BC();
  sub_2351CA1A0();
  swift_release();
  uint64_t v23 = *(void *)(v2 + 32);
  LOBYTE(v41) = *(unsigned char *)(v2 + 24);
  uint64_t v42 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4260);
  sub_2351CA250();
  sub_2351C96A8(v2, (uint64_t)v6);
  uint64_t v24 = swift_allocObject();
  sub_2351BC574((uint64_t)v6, v24 + v17);
  uint64_t v41 = v19;
  uint64_t v42 = v20;
  uint64_t v43 = v21;
  unint64_t v44 = v22;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v26 = MEMORY[0x263F8D4F8];
  uint64_t v27 = v33;
  sub_2351CA1A0();
  swift_release();
  OUTLINED_FUNCTION_8_0();
  v28();
  uint64_t v29 = *(void *)(v2 + 32);
  LOBYTE(v40[0]) = *(unsigned char *)(v2 + 24);
  v40[1] = v29;
  sub_2351CA270();
  uint64_t v39 = v2;
  uint64_t v41 = v27;
  uint64_t v42 = v26;
  uint64_t v43 = OpaqueTypeConformance2;
  unint64_t v44 = MEMORY[0x263F8D510];
  swift_getOpaqueTypeConformance2();
  sub_2351CA170();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_8_0();
  return v30();
}

uint64_t sub_2351C73F4(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4280);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v16[-v9];
  int v11 = *a2;
  if (v11 == 2)
  {
    uint64_t v12 = *(void *)(a3 + 32);
    char v18 = *(unsigned char *)(a3 + 24);
    uint64_t v19 = v12;
    char v17 = 0;
  }
  else
  {
    sub_2351C77BC(v11 & 1, (uint64_t)&v16[-v9]);
    uint64_t v13 = sub_2351CA1F0();
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v13);
    _s20FailureAlertModifierVMa();
    sub_2351BC3BC((uint64_t)v10, (uint64_t)v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687F44E0);
    sub_2351CA260();
    sub_2351C9A30((uint64_t)v10, &qword_2687F4280);
    uint64_t v14 = *(void *)(a3 + 32);
    char v18 = *(unsigned char *)(a3 + 24);
    uint64_t v19 = v14;
    char v17 = 1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4260);
  return sub_2351CA260();
}

uint64_t sub_2351C7560(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = _s20FailureAlertModifierVMa();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(a2) = *a2;
  sub_2351C96A8(a3, (uint64_t)v7);
  if (a2 == 1) {
    return sub_2351C97C0((uint64_t)v7);
  }
  uint64_t v9 = *((void *)v7 + 1);
  char v10 = v7[16];
  uint64_t v15 = *(void *)v7;
  uint64_t v16 = v9;
  char v17 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4520);
  MEMORY[0x237DD6840](&v18);
  int v11 = v18;
  uint64_t result = sub_2351C97C0((uint64_t)v7);
  if (v11 != 2)
  {
    uint64_t v12 = *(void *)(a3 + 8);
    char v13 = *(unsigned char *)(a3 + 16);
    uint64_t v15 = *(void *)a3;
    uint64_t v16 = v12;
    char v17 = v13;
    LOBYTE(v18) = 2;
    return sub_2351CA2A0();
  }
  return result;
}

uint64_t sub_2351C7664@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4280);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s20FailureAlertModifierVMa();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F44E0);
  sub_2351CA250();
  uint64_t v5 = sub_2351CA1F0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, v4, v5);
  }
  sub_2351C9A30((uint64_t)v4, &qword_2687F4280);
  uint64_t result = sub_2351CA650();
  __break(1u);
  return result;
}

uint64_t sub_2351C77BC@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  if ((a1 & 1) == 0)
  {
    id v3 = objc_msgSend(self, sel_mainBundle);
    uint64_t v4 = sub_2351C9994(v3);
    if (v5)
    {
      uint64_t v6 = v4;
      uint64_t v7 = v5;
      if (qword_2687F40A8 != -1) {
        swift_once();
      }
      if (qword_2687F44B8)
      {
        BOOL v8 = v6 == qword_2687F44B0 && v7 == qword_2687F44B8;
        if (v8 || (sub_2351CA690() & 1) != 0) {
          goto LABEL_23;
        }
      }
      if (qword_2687F40B0 != -1) {
        swift_once();
      }
      if (qword_2687F44C8)
      {
        if (v6 != qword_2687F44C0 || v7 != qword_2687F44C8)
        {
          char v10 = sub_2351CA690();
          swift_bridgeObjectRelease();
          if ((v10 & 1) == 0) {
            goto LABEL_28;
          }
          goto LABEL_24;
        }
LABEL_23:
        swift_bridgeObjectRelease();
LABEL_24:
        return sub_2351C795C(a2);
      }
      swift_bridgeObjectRelease();
    }
LABEL_28:
    return sub_2351C7D08(a2);
  }

  return sub_2351C80B8(a2);
}

uint64_t sub_2351C795C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v1 = _s20FailureAlertModifierVMa();
  uint64_t v30 = *(void *)(v1 - 8);
  uint64_t v2 = *(void *)(v30 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = sub_2351CA1E0();
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  long long v32 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  sub_2351CA040();
  if (qword_2687F40A0 != -1) {
    swift_once();
  }
  id v6 = (id)qword_2687F5778;
  uint64_t v7 = sub_2351CA120();
  uint64_t v28 = v8;
  uint64_t v29 = v7;
  int v26 = v9;
  uint64_t v27 = v10;
  sub_2351CA040();
  id v11 = v6;
  uint64_t v12 = sub_2351CA120();
  v25[2] = v13;
  v25[3] = v12;
  v25[0] = v14 & 1;
  v25[1] = v15;
  sub_2351CA040();
  id v16 = v11;
  uint64_t v17 = sub_2351CA120();
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  sub_2351C96A8(v31, (uint64_t)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v22 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v23 = swift_allocObject();
  sub_2351BC574((uint64_t)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
  sub_2351CA1D0();
  sub_2351C9A20(v17, v19, v21);
  swift_release();
  swift_bridgeObjectRelease();
  sub_2351CA1C0();
  return sub_2351CA1B0();
}

uint64_t sub_2351C7D08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v1 = _s20FailureAlertModifierVMa();
  uint64_t v30 = *(void *)(v1 - 8);
  uint64_t v2 = *(void *)(v30 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = sub_2351CA1E0();
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  long long v32 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  sub_2351CA040();
  if (qword_2687F40A0 != -1) {
    swift_once();
  }
  id v6 = (id)qword_2687F5778;
  uint64_t v7 = sub_2351CA120();
  uint64_t v28 = v8;
  uint64_t v29 = v7;
  int v26 = v9;
  uint64_t v27 = v10;
  sub_2351CA040();
  id v11 = v6;
  uint64_t v12 = sub_2351CA120();
  v25[2] = v13;
  v25[3] = v12;
  v25[0] = v14 & 1;
  v25[1] = v15;
  sub_2351CA040();
  id v16 = v11;
  uint64_t v17 = sub_2351CA120();
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  sub_2351C96A8(v31, (uint64_t)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v22 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v23 = swift_allocObject();
  sub_2351BC574((uint64_t)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
  sub_2351CA1D0();
  sub_2351C9A20(v17, v19, v21);
  swift_release();
  swift_bridgeObjectRelease();
  sub_2351CA1C0();
  return sub_2351CA1B0();
}

uint64_t sub_2351C80B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v1 = _s20FailureAlertModifierVMa();
  uint64_t v30 = *(void *)(v1 - 8);
  uint64_t v2 = *(void *)(v30 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = sub_2351CA1E0();
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  long long v32 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  sub_2351CA040();
  if (qword_2687F40A0 != -1) {
    swift_once();
  }
  id v6 = (id)qword_2687F5778;
  uint64_t v7 = sub_2351CA120();
  uint64_t v28 = v8;
  uint64_t v29 = v7;
  int v26 = v9;
  uint64_t v27 = v10;
  sub_2351CA040();
  id v11 = v6;
  uint64_t v12 = sub_2351CA120();
  v25[2] = v13;
  v25[3] = v12;
  v25[0] = v14 & 1;
  v25[1] = v15;
  sub_2351CA040();
  id v16 = v11;
  uint64_t v17 = sub_2351CA120();
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  sub_2351C96A8(v31, (uint64_t)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v22 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v23 = swift_allocObject();
  sub_2351BC574((uint64_t)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
  sub_2351CA1D0();
  sub_2351C9A20(v17, v19, v21);
  swift_release();
  swift_bridgeObjectRelease();
  sub_2351CA1C0();
  return sub_2351CA1B0();
}

uint64_t sub_2351C8468()
{
  uint64_t v0 = sub_2351C9F40();
  OUTLINED_FUNCTION_0_1();
  uint64_t v2 = v1;
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_15();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4538);
  MEMORY[0x270FA5388](v7 - 8);
  OUTLINED_FUNCTION_15();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_2351C9DD0();
  OUTLINED_FUNCTION_0_1();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_15();
  uint64_t v17 = v16 - v15;
  sub_2351C9DC0();
  if (__swift_getEnumTagSinglePayload(v10, 1, v11) == 1) {
    return sub_2351C9A30(v10, &qword_2687F4538);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v17, v10, v11);
  _s20FailureAlertModifierVMa();
  sub_2351C0B88(v6);
  sub_2351C9F30();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v6, v0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v17, v11);
}

BOOL sub_2351C8634(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2351C8644()
{
  return sub_2351CA700();
}

uint64_t sub_2351C866C()
{
  return sub_2351CA730();
}

void sub_2351C86B8(void *a1@<X8>)
{
  *a1 = &unk_26E877750;
}

BOOL sub_2351C86C8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2351C8634(*a1, *a2);
}

uint64_t sub_2351C86D4()
{
  return sub_2351C866C();
}

uint64_t sub_2351C86DC()
{
  return sub_2351C8644();
}

uint64_t sub_2351C86E4()
{
  return sub_2351C1ABC(&qword_2687F44D0, &qword_2687F44D8);
}

uint64_t sub_2351C8720(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = v4 + ((v3 + 16) & ~(unint64_t)v3);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    *(void *)(a1 + 8) = a2[1];
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(unsigned char *)(a1 + 24) = *((unsigned char *)a2 + 24);
    *(void *)(a1 + 32) = a2[4];
    uint64_t v8 = *(int *)(a3 + 24);
    uint64_t v9 = (char *)(a1 + v8);
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2351CA1F0();
    swift_retain();
    swift_retain();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4280);
      memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F44E0);
    *(void *)&v9[*(int *)(v13 + 28)] = *(void *)&v10[*(int *)(v13 + 28)];
    uint64_t v14 = *(int *)(a3 + 28);
    uint64_t v15 = (void *)(v7 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4288);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_2351C9F40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *uint64_t v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v7;
}

uint64_t sub_2351C8950(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_2351CA1F0();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F44E0);
  swift_release();
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4288);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_2351C9F40();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_2351C8A94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = sub_2351CA1F0();
  swift_retain();
  swift_retain();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4280);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F44E0);
  *(void *)&v8[*(int *)(v12 + 28)] = *(void *)&v9[*(int *)(v12 + 28)];
  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4288);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = sub_2351C9F40();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  else
  {
    *uint64_t v14 = *v15;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_2351C8C68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = sub_2351CA1F0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4280);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F44E0);
  *(void *)&v7[*(int *)(v14 + 28)] = *(void *)&v8[*(int *)(v14 + 28)];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v15 = *(int *)(a3 + 28);
    uint64_t v16 = (void *)(a1 + v15);
    uint64_t v17 = (void *)(a2 + v15);
    sub_2351C9A30(a1 + v15, &qword_2687F4288);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4288);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_2351C9F40();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    }
    else
    {
      void *v16 = *v17;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2351C8EF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = sub_2351CA1F0();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4280);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F44E0);
  *(void *)&v7[*(int *)(v11 + 28)] = *(void *)&v8[*(int *)(v11 + 28)];
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4288);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = sub_2351C9F40();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v16 - 8) + 32))(v13, v14, v16);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  return a1;
}

uint64_t sub_2351C90A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = sub_2351CA1F0();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4280);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F44E0);
  *(void *)&v7[*(int *)(v14 + 28)] = *(void *)&v8[*(int *)(v14 + 28)];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v15 = *(int *)(a3 + 28);
    uint64_t v16 = (void *)(a1 + v15);
    uint64_t v17 = (const void *)(a2 + v15);
    sub_2351C9A30(a1 + v15, &qword_2687F4288);
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4288);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_2351C9F40();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v19 - 8) + 32))(v16, v17, v19);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2351C9328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2351C933C);
}

uint64_t sub_2351C933C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687F44E0);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 24);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F44E8);
      uint64_t v11 = *(int *)(a3 + 28);
    }
    return __swift_getEnumTagSinglePayload(a1 + v11, a2, v10);
  }
}

uint64_t sub_2351C93F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2351C9404);
}

uint64_t sub_2351C9404(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687F44E0);
    OUTLINED_FUNCTION_0();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 24);
    }
    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2687F44E8);
      uint64_t v11 = *(int *)(a4 + 28);
    }
    return __swift_storeEnumTagSinglePayload(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t _s20FailureAlertModifierVMa()
{
  uint64_t result = qword_2687F44F0;
  if (!qword_2687F44F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2351C94FC()
{
  sub_2351C95D8();
  if (v0 <= 0x3F)
  {
    sub_2351C9634();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_2351C95D8()
{
  if (!qword_2687F4500)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2687F4280);
    unint64_t v0 = sub_2351CA280();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2687F4500);
    }
  }
}

void sub_2351C9634()
{
  if (!qword_2687F4508)
  {
    sub_2351C9F40();
    unint64_t v0 = sub_2351C9EB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2687F4508);
    }
  }
}

uint64_t sub_2351C968C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2351C96A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s20FailureAlertModifierVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2351C9710(uint64_t a1, uint64_t a2)
{
  return sub_2351C9744(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2351C73F4);
}

uint64_t sub_2351C972C(uint64_t a1, uint64_t a2)
{
  return sub_2351C9744(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2351C7560);
}

uint64_t sub_2351C9744(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = _s20FailureAlertModifierVMa();
  OUTLINED_FUNCTION_3_4(v6);
  uint64_t v8 = v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return a3(a1, a2, v8);
}

uint64_t sub_2351C97B8@<X0>(uint64_t a1@<X8>)
{
  return sub_2351C7664(a1);
}

uint64_t sub_2351C97C0(uint64_t a1)
{
  uint64_t v2 = _s20FailureAlertModifierVMa();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2351C981C()
{
  uint64_t v0 = MRMediaRemoteCopyLocalDeviceSystemClassicalRoomApplicationDisplayID();
  if (v0)
  {
    uint64_t v1 = (void *)v0;
    uint64_t v2 = sub_2351CA480();
    uint64_t v4 = v3;

    qword_2687F44B0 = v2;
    qword_2687F44B8 = v4;
  }
  else
  {
    __break(1u);
  }
}

void sub_2351C986C()
{
  if (qword_2687F40A8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_2687F44B0;
  if (qword_2687F44B8)
  {
    swift_bridgeObjectRetain();
    uint64_t v0 = sub_2351C9914();
    uint64_t v2 = v1;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = 0;
  }
  qword_2687F44C0 = v0;
  qword_2687F44C8 = v2;
}

uint64_t sub_2351C9914()
{
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_2351CA4E0();
  sub_2351CA4B0();
  return v1;
}

uint64_t sub_2351C9994(void *a1)
{
  id v2 = objc_msgSend(a1, sel_bundleIdentifier);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_2351CA480();

  return v3;
}

uint64_t sub_2351C9A08()
{
  return OUTLINED_FUNCTION_2_2();
}

uint64_t sub_2351C9A20(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2351C9A30(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_8_0();
  v3();
  return a1;
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = _s20FailureAlertModifierVMa();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 24);
  uint64_t v6 = sub_2351CA1F0();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F44E0);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687F4288);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2351C9F40();
    OUTLINED_FUNCTION_5_2();
    OUTLINED_FUNCTION_8_0();
    v7();
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_2351C9C18()
{
  return OUTLINED_FUNCTION_2_2();
}

uint64_t sub_2351C9C30()
{
  uint64_t v0 = _s20FailureAlertModifierVMa();
  OUTLINED_FUNCTION_3_4(v0);
  return sub_2351C8468();
}

uint64_t sub_2351C9C84()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2351C9DA0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2351C9DB0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2351C9DC0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2351C9DD0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2351C9DE0()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_2351C9DF0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_2351C9E00()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2351C9E10()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_2351C9E30()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_2351C9E50()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_2351C9E60()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_2351C9E70()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2351C9E80()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2351C9E90()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2351C9EA0()
{
  return MEMORY[0x270EFEF40]();
}

uint64_t sub_2351C9EB0()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_2351C9EC0()
{
  return MEMORY[0x270EFEFE0]();
}

uint64_t sub_2351C9ED0()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_2351C9EE0()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_2351C9EF0()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_2351C9F00()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_2351C9F10()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_2351C9F20()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_2351C9F30()
{
  return MEMORY[0x270EFF800]();
}

uint64_t sub_2351C9F40()
{
  return MEMORY[0x270EFF850]();
}

uint64_t sub_2351C9F50()
{
  return MEMORY[0x270EFF888]();
}

uint64_t sub_2351C9F60()
{
  return MEMORY[0x270EFF898]();
}

uint64_t sub_2351C9F70()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_2351C9F90()
{
  return MEMORY[0x270EFFE90]();
}

uint64_t sub_2351C9FA0()
{
  return MEMORY[0x270EFFEA8]();
}

uint64_t sub_2351C9FB0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_2351C9FC0()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_2351C9FD0()
{
  return MEMORY[0x270F00918]();
}

uint64_t sub_2351C9FE0()
{
  return MEMORY[0x270F00DF0]();
}

uint64_t sub_2351C9FF0()
{
  return MEMORY[0x270F00E00]();
}

uint64_t sub_2351CA000()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_2351CA010()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_2351CA020()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_2351CA030()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_2351CA040()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_2351CA050()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_2351CA060()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_2351CA070()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_2351CA080()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_2351CA0A0()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_2351CA0B0()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_2351CA0C0()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_2351CA0E0()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_2351CA0F0()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_2351CA100()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2351CA110()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_2351CA120()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_2351CA130()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2351CA140()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2351CA150()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2351CA160()
{
  return MEMORY[0x270F03A88]();
}

uint64_t sub_2351CA170()
{
  return MEMORY[0x270F03F68]();
}

uint64_t sub_2351CA180()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_2351CA190()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_2351CA1A0()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_2351CA1B0()
{
  return MEMORY[0x270F042E8]();
}

uint64_t sub_2351CA1C0()
{
  return MEMORY[0x270F04310]();
}

uint64_t sub_2351CA1D0()
{
  return MEMORY[0x270F04320]();
}

uint64_t sub_2351CA1E0()
{
  return MEMORY[0x270F04330]();
}

uint64_t sub_2351CA1F0()
{
  return MEMORY[0x270F04338]();
}

uint64_t sub_2351CA200()
{
  return MEMORY[0x270F04360]();
}

uint64_t sub_2351CA210()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_2351CA220()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_2351CA230()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_2351CA240()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_2351CA250()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_2351CA260()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_2351CA270()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_2351CA280()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_2351CA290()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_2351CA2A0()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_2351CA2B0()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_2351CA2C0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2351CA2D0()
{
  return MEMORY[0x270F051C8]();
}

uint64_t sub_2351CA2E0()
{
  return MEMORY[0x270F051D0]();
}

uint64_t sub_2351CA2F0()
{
  return MEMORY[0x270F051E8]();
}

uint64_t sub_2351CA300()
{
  return MEMORY[0x270F051F0]();
}

uint64_t sub_2351CA310()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2351CA320()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2351CA330()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2351CA340()
{
  return MEMORY[0x270EF6920]();
}

uint64_t sub_2351CA350()
{
  return MEMORY[0x270EF6AE0]();
}

uint64_t sub_2351CA360()
{
  return MEMORY[0x270EF6AE8]();
}

uint64_t sub_2351CA370()
{
  return MEMORY[0x270EF6B50]();
}

uint64_t sub_2351CA380()
{
  return MEMORY[0x270EF6E00]();
}

uint64_t sub_2351CA390()
{
  return MEMORY[0x270EF6E08]();
}

uint64_t sub_2351CA3A0()
{
  return MEMORY[0x270EF6E20]();
}

uint64_t sub_2351CA3B0()
{
  return MEMORY[0x270EF6E38]();
}

uint64_t sub_2351CA3C0()
{
  return MEMORY[0x270EF6E40]();
}

uint64_t sub_2351CA3D0()
{
  return MEMORY[0x270EF6E48]();
}

uint64_t sub_2351CA3E0()
{
  return MEMORY[0x270EF6E68]();
}

uint64_t sub_2351CA3F0()
{
  return MEMORY[0x270EF6E70]();
}

uint64_t sub_2351CA400()
{
  return MEMORY[0x270EF6E78]();
}

uint64_t sub_2351CA410()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2351CA420()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_2351CA430()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2351CA440()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2351CA450()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2351CA460()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2351CA470()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2351CA480()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2351CA490()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2351CA4A0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2351CA4B0()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_2351CA4C0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2351CA4D0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2351CA4E0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2351CA4F0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2351CA500()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2351CA510()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2351CA520()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2351CA530()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2351CA540()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2351CA550()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2351CA560()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2351CA570()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2351CA580()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2351CA590()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2351CA5A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2351CA5B0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2351CA5C0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2351CA5D0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2351CA5E0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2351CA5F0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2351CA600()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2351CA610()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2351CA620()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_2351CA630()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_2351CA640()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2351CA650()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2351CA660()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2351CA680()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2351CA690()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2351CA6A0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2351CA6B0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2351CA6C0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2351CA6D0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2351CA6E0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2351CA6F0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2351CA700()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2351CA710()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2351CA720()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_2351CA730()
{
  return MEMORY[0x270F9FC90]();
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B80](red, green, blue, alpha);
}

uint64_t MRMediaRemoteCopyLocalDeviceSystemClassicalRoomApplicationDisplayID()
{
  return MEMORY[0x270F49EF0]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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