void (*sub_2396B5B68(void *a1))(void *a1)
{
  void *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = LowerStrictlyTriangularMatrix.subscript.modify();
  return sub_2394122B8;
}

uint64_t sub_2396B5BE0(uint64_t a1, uint64_t a2)
{
  return static LowerStrictlyTriangularMatrix.__derived_struct_equals(_:_:)(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void **)(a1 + 24), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(void **)(a2 + 24)) & 1;
}

uint64_t sub_2396B5C28()
{
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2396B5C64(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  sub_2396D0110();
  return a1;
}

void *sub_2396B5CA4(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  sub_2396D0110();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_2396B5D14(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t type metadata accessor for LowerStrictlyTriangularMatrix()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_3_106()
{
  return v0;
}

uint64_t UnsafeMatrixPointer.baseAddress.getter()
{
  return *(void *)v0;
}

uint64_t UnsafeMatrixPointer.baseAddress.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*UnsafeMatrixPointer.baseAddress.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeMatrixPointer.rowCount.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t UnsafeMatrixPointer.rowCount.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*UnsafeMatrixPointer.rowCount.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeMatrixPointer.columnCount.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t UnsafeMatrixPointer.columnCount.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*UnsafeMatrixPointer.columnCount.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeMatrixPointer.leadingDimension.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t UnsafeMatrixPointer.leadingDimension.setter(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t (*UnsafeMatrixPointer.leadingDimension.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeMatrixPointer.layout.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t UnsafeMatrixPointer.layout.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 32) = result & 1;
  return result;
}

uint64_t (*UnsafeMatrixPointer.layout.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeMatrixPointer.count.getter()
{
  if (*(unsigned char *)(v0 + 32))
  {
    uint64_t v2 = *(void *)(v0 + 16);
    uint64_t v1 = *(void *)(v0 + 24);
    uint64_t result = v1 * v2;
    if ((unsigned __int128)(v1 * (__int128)v2) >> 64 == (v1 * v2) >> 63) {
      return result;
    }
    __break(1u);
  }
  uint64_t v4 = *(void *)(v0 + 8);
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t result = v4 * v5;
  if ((unsigned __int128)(v4 * (__int128)v5) >> 64 != (v4 * v5) >> 63) {
    __break(1u);
  }
  return result;
}

uint64_t UnsafeMatrixPointer.init(start:rowCount:columnCount:leadingDimension:layout:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(unsigned char *)(a6 + 32) = a5 & 1;
  return result;
}

__n128 UnsafeMatrixPointer.init(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 24);
  char v3 = *(unsigned char *)(a1 + 32);
  *(void *)a2 = *(void *)a1;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  *(void *)(a2 + 24) = v2;
  *(unsigned char *)(a2 + 32) = v3;
  return result;
}

Swift::Void __swiftcall UnsafeMatrixPointer.deallocate()()
{
  MEMORY[0x270F9D588](*v1, *(void *)(v0 + 16));
}

uint64_t UnsafeMatrixPointer.accelerateMatrixOrder.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t UnsafeMatrixPointer.withUnsafeBufferPointer<A>(_:)(uint64_t (*a1)(uint64_t))
{
  UnsafeMatrixPointer.count.getter();
  uint64_t v2 = sub_2396D03F0();
  return a1(v2);
}

uint64_t UnsafeMatrixPointer.subscript.getter@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = *v4;
  uint64_t v6 = v4[3];
  if (v4[4])
  {
    uint64_t v7 = a2 * v6;
    if ((unsigned __int128)(a2 * (__int128)v6) >> 64 != (a2 * v6) >> 63)
    {
      __break(1u);
      goto LABEL_10;
    }
    uint64_t v6 = v7 + result;
    if (!__OFADD__(v7, result)) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a4, v5 + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 72) * v6);
    }
    __break(1u);
  }
  uint64_t v8 = result * v6;
  if ((unsigned __int128)(result * (__int128)v6) >> 64 != (result * v6) >> 63)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v6 = v8 + a2;
  if (!__OFADD__(v8, a2)) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a4, v5 + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 72) * v6);
  }
LABEL_11:
  __break(1u);
  return result;
}

void UnsafeMatrixPointer.subscript.getter(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(v2 + 32))
  {
    uint64_t v3 = *(void *)(a2 + 16);
    uint64_t v4 = *(void *)v2 + *(void *)(*(void *)(v3 - 8) + 72) * a1;
    uint64_t v5 = *(void *)(v2 + 16);
    uint64_t v6 = *(void *)(v2 + 24);
  }
  else
  {
    OUTLINED_FUNCTION_1_96();
    if (!v7)
    {
      __break(1u);
      return;
    }
    OUTLINED_FUNCTION_0_2();
    uint64_t v4 = v10 + *(void *)(v8 + 72) * v9;
    uint64_t v5 = *(void *)(v2 + 16);
    uint64_t v6 = 1;
  }
  UnsafeVectorPointer.init(start:count:stride:)(v4, v5, v6, v3);
}

{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(unsigned char *)(v2 + 32))
  {
    OUTLINED_FUNCTION_1_96();
    if (!v3)
    {
      __break(1u);
      return;
    }
    OUTLINED_FUNCTION_0_2();
    uint64_t v8 = v7 + *(void *)(v5 + 72) * v6;
    uint64_t v9 = *(void *)(v2 + 8);
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v4 = *(void *)(a2 + 16);
    uint64_t v9 = *(void *)(v2 + 8);
    uint64_t v8 = *(void *)v2 + *(void *)(*(void *)(v4 - 8) + 72) * a1;
    uint64_t v10 = *(void *)(v2 + 24);
  }
  UnsafeVectorPointer.init(start:count:stride:)(v8, v9, v10, v4);
}

uint64_t sub_2396B60F0()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_2396B60FC(uint64_t (*a1)(uint64_t))
{
  return UnsafeMatrixPointer.withUnsafeBufferPointer<A>(_:)(a1);
}

uint64_t UnsafeMatrixPointer.debugDescription.getter()
{
  return 0;
}

uint64_t sub_2396B62C0(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(unsigned char *)(a1 + 33))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
      BOOL v4 = v3 >= 2;
      int v2 = v3 - 2;
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

uint64_t sub_2396B62FC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = a2 + 1;
    }
  }
  return result;
}

uint64_t type metadata accessor for UnsafeMatrixPointer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t MatrixLayout.blasValue.getter(char a1)
{
  if (a1) {
    return 102;
  }
  else {
    return 101;
  }
}

uint64_t UnsafeMutableMatrixPointer<A>.addProduct(_:transposed:_:transposed:scaledBy:)()
{
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_40_29();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689D4E10);
  if (OUTLINED_FUNCTION_23_50())
  {
    OUTLINED_FUNCTION_5_104();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689D4E28);
    OUTLINED_FUNCTION_19_50();
    OUTLINED_FUNCTION_2_110();
    uint64_t v1 = OUTLINED_FUNCTION_4_96();
    v2(v1);
    OUTLINED_FUNCTION_41_25();
    uint64_t v3 = OUTLINED_FUNCTION_17_62();
    return UnsafeMutableMatrixPointer<A>.addProductFloat(_:transposed:_:transposed:scaledBy:)(v3, v4, v5, v6);
  }
  else
  {
    OUTLINED_FUNCTION_40_29();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689D4E18);
    if (OUTLINED_FUNCTION_23_50())
    {
      OUTLINED_FUNCTION_5_104();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2689D4E20);
      OUTLINED_FUNCTION_19_50();
      OUTLINED_FUNCTION_2_110();
      uint64_t v8 = OUTLINED_FUNCTION_4_96();
      v9(v8);
      OUTLINED_FUNCTION_41_25();
      uint64_t v10 = OUTLINED_FUNCTION_17_62();
      return UnsafeMutableMatrixPointer<A>.addProductDouble(_:transposed:_:transposed:scaledBy:)(v10, v11, v12, v13);
    }
    else
    {
      sub_2396D1200();
      swift_bridgeObjectRelease();
      sub_2396D2130();
      sub_2396D04E0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_16_54();
      uint64_t result = OUTLINED_FUNCTION_12_69();
      __break(1u);
    }
  }
  return result;
}

uint64_t UnsafeMutableMatrixPointer<A>.addProductFloat(_:transposed:_:transposed:scaledBy:)(uint64_t a1, char a2, uint64_t a3, char a4)
{
  int v5 = *(unsigned __int8 *)(a1 + 32);
  if (*(unsigned __int8 *)(v4 + 32) != v5 || v5 != *(unsigned __int8 *)(a3 + 32)) {
    goto LABEL_48;
  }
  uint64_t v6 = 16;
  if (a2) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 16;
  }
  if (a2) {
    uint64_t v8 = 16;
  }
  else {
    uint64_t v8 = 8;
  }
  uint64_t v9 = *(void *)(a1 + v7);
  if (a4) {
    uint64_t v10 = 8;
  }
  else {
    uint64_t v10 = 16;
  }
  if ((a4 & 1) == 0) {
    uint64_t v6 = 8;
  }
  if (v9 != *(void *)(a3 + v6))
  {
    OUTLINED_FUNCTION_44_26();
LABEL_52:
    OUTLINED_FUNCTION_132();
    goto LABEL_53;
  }
  if (*(void *)(v4 + 8) != *(void *)(a1 + v8))
  {
    OUTLINED_FUNCTION_43_25();
    goto LABEL_52;
  }
  if (*(void *)(v4 + 16) != *(void *)(a3 + v10))
  {
    OUTLINED_FUNCTION_42_25();
    goto LABEL_52;
  }
  OUTLINED_FUNCTION_32_32();
  if (!(v14 ^ v15 | v13))
  {
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (v11 > 0x7FFFFFFF) {
    goto LABEL_42;
  }
  if (v12 > 0x7FFFFFFF)
  {
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  OUTLINED_FUNCTION_31_24();
  if (!(v14 ^ v15 | v13)) {
    goto LABEL_44;
  }
  uint64_t v21 = *(void *)(v16 + 24);
  if (v21 > 0x7FFFFFFF)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  uint64_t v22 = *(void *)(v4 + 24);
  if (v18 >= (uint64_t)0xFFFFFFFF80000000
    && v20 >= (uint64_t)0xFFFFFFFF80000000
    && v17 >= (uint64_t)0xFFFFFFFF80000000
    && v19 >= (uint64_t)0xFFFFFFFF80000000
    && v21 >= (uint64_t)0xFFFFFFFF80000000
    && v22 >= (uint64_t)0xFFFFFFFF80000000)
  {
    if (v22 <= 0x7FFFFFFF)
    {
      OUTLINED_FUNCTION_24_56();
      OUTLINED_FUNCTION_39_24();
      return cblas_sgemm_NEWLAPACK();
    }
    goto LABEL_47;
  }
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  OUTLINED_FUNCTION_132();
  OUTLINED_FUNCTION_28_42();
LABEL_53:
  uint64_t result = OUTLINED_FUNCTION_12_69();
  __break(1u);
  return result;
}

uint64_t UnsafeMutableMatrixPointer<A>.addProductDouble(_:transposed:_:transposed:scaledBy:)(uint64_t a1, char a2, uint64_t a3, char a4)
{
  int v5 = *(unsigned __int8 *)(a1 + 32);
  if (*(unsigned __int8 *)(v4 + 32) != v5 || v5 != *(unsigned __int8 *)(a3 + 32)) {
    goto LABEL_48;
  }
  uint64_t v6 = 16;
  if (a2) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 16;
  }
  if (a2) {
    uint64_t v8 = 16;
  }
  else {
    uint64_t v8 = 8;
  }
  uint64_t v9 = *(void *)(a1 + v7);
  if (a4) {
    uint64_t v10 = 8;
  }
  else {
    uint64_t v10 = 16;
  }
  if ((a4 & 1) == 0) {
    uint64_t v6 = 8;
  }
  if (v9 != *(void *)(a3 + v6))
  {
    OUTLINED_FUNCTION_44_26();
LABEL_52:
    OUTLINED_FUNCTION_132();
    goto LABEL_53;
  }
  if (*(void *)(v4 + 8) != *(void *)(a1 + v8))
  {
    OUTLINED_FUNCTION_43_25();
    goto LABEL_52;
  }
  if (*(void *)(v4 + 16) != *(void *)(a3 + v10))
  {
    OUTLINED_FUNCTION_42_25();
    goto LABEL_52;
  }
  OUTLINED_FUNCTION_32_32();
  if (!(v14 ^ v15 | v13))
  {
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (v11 > 0x7FFFFFFF) {
    goto LABEL_42;
  }
  if (v12 > 0x7FFFFFFF)
  {
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  OUTLINED_FUNCTION_31_24();
  if (!(v14 ^ v15 | v13)) {
    goto LABEL_44;
  }
  uint64_t v21 = *(void *)(v16 + 24);
  if (v21 > 0x7FFFFFFF)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  uint64_t v22 = *(void *)(v4 + 24);
  if (v18 >= (uint64_t)0xFFFFFFFF80000000
    && v20 >= (uint64_t)0xFFFFFFFF80000000
    && v17 >= (uint64_t)0xFFFFFFFF80000000
    && v19 >= (uint64_t)0xFFFFFFFF80000000
    && v21 >= (uint64_t)0xFFFFFFFF80000000
    && v22 >= (uint64_t)0xFFFFFFFF80000000)
  {
    if (v22 <= 0x7FFFFFFF)
    {
      OUTLINED_FUNCTION_24_56();
      OUTLINED_FUNCTION_39_24();
      return cblas_dgemm_NEWLAPACK();
    }
    goto LABEL_47;
  }
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  OUTLINED_FUNCTION_132();
  OUTLINED_FUNCTION_28_42();
LABEL_53:
  uint64_t result = OUTLINED_FUNCTION_12_69();
  __break(1u);
  return result;
}

uint64_t UnsafeMutableVectorPointer<A>.addProduct(_:_:transposed:scaledBy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  OUTLINED_FUNCTION_35_28(a1, a2, a3, a4, a5, a6);
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_10();
  type metadata accessor for UnsafeMutableVectorPointer();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689D4E30);
  if (OUTLINED_FUNCTION_3_107())
  {
    OUTLINED_FUNCTION_14_68();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689D4E28);
    OUTLINED_FUNCTION_15_62();
    OUTLINED_FUNCTION_8_92();
    *(void *)(v9 - 256) = v7;
    type metadata accessor for UnsafeVectorPointer();
    __swift_instantiateConcreteTypeFromMangledName(qword_2689D4E48);
    OUTLINED_FUNCTION_15_62();
    OUTLINED_FUNCTION_18_52();
    OUTLINED_FUNCTION_9_71();
    v10();
    OUTLINED_FUNCTION_37_27();
    OUTLINED_FUNCTION_7_83();
    return UnsafeMutableVectorPointer<A>.addProductFloat(_:_:transposed:scaledBy:)();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689D4E38);
    if (OUTLINED_FUNCTION_3_107())
    {
      OUTLINED_FUNCTION_14_68();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2689D4E20);
      OUTLINED_FUNCTION_15_62();
      OUTLINED_FUNCTION_8_92();
      *(void *)(v12 - 256) = v7;
      type metadata accessor for UnsafeVectorPointer();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2689D4E40);
      OUTLINED_FUNCTION_15_62();
      OUTLINED_FUNCTION_18_52();
      OUTLINED_FUNCTION_9_71();
      v13();
      OUTLINED_FUNCTION_37_27();
      OUTLINED_FUNCTION_7_83();
      return UnsafeMutableVectorPointer<A>.addProductDouble(_:_:transposed:scaledBy:)();
    }
    else
    {
      OUTLINED_FUNCTION_30_33();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_6_92();
      sub_2396D04E0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_16_54();
      uint64_t result = OUTLINED_FUNCTION_12_69();
      __break(1u);
    }
  }
  return result;
}

uint64_t UnsafeMutableVectorPointer<A>.addProductFloat(_:_:transposed:scaledBy:)()
{
  OUTLINED_FUNCTION_33_30();
  if (!(v1 ^ v2 | v0))
  {
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  OUTLINED_FUNCTION_29_38();
  if (v1 != v2 || v5 < v8) {
    goto LABEL_31;
  }
  if (v5 > 0x7FFFFFFF)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    OUTLINED_FUNCTION_132();
    uint64_t result = OUTLINED_FUNCTION_1_97();
    __break(1u);
    return result;
  }
  if (v6) {
    uint64_t v10 = v4;
  }
  else {
    uint64_t v10 = v5;
  }
  if (v10 != v7) {
    goto LABEL_37;
  }
  if (*(uint64_t *)(v3 + 24) > 0x7FFFFFFF) {
    goto LABEL_33;
  }
  OUTLINED_FUNCTION_32_32();
  if (!(v1 ^ v2 | v0)) {
    goto LABEL_34;
  }
  if (v11 < (uint64_t)0xFFFFFFFF80000000 || v12 < (uint64_t)0xFFFFFFFF80000000 || v13 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_35;
  }
  OUTLINED_FUNCTION_31_24();
  if (!(v1 ^ v2 | v0)) {
    goto LABEL_36;
  }
  OUTLINED_FUNCTION_25_52();
  if (v0) {
    uint64_t v25 = v22;
  }
  else {
    uint64_t v25 = v22 + 1;
  }
  if (v21) {
    uint64_t v26 = 102;
  }
  else {
    uint64_t v26 = 101;
  }
  return OUTLINED_FUNCTION_21_51(v26, v25, v16, v17, v18, v19, v20, v23, v24);
}

{
  char v0;
  char v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  __n128 v23;
  __n128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;

  OUTLINED_FUNCTION_38_25();
  if (!(v1 ^ v2 | v0))
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  OUTLINED_FUNCTION_36_24();
  if (v1 != v2 || v5 < v9) {
    goto LABEL_29;
  }
  if (v5 > 0x7FFFFFFF)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (v6) {
    uint64_t v12 = v5;
  }
  else {
    uint64_t v12 = v4;
  }
  if (v12 != v3) {
    goto LABEL_35;
  }
  uint64_t v13 = *(void *)(v10 + 24);
  if (v13 > 0x7FFFFFFF) {
    goto LABEL_31;
  }
  if (v8 > 0x7FFFFFFF)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (v7 < (uint64_t)0xFFFFFFFF80000000 || v8 < (uint64_t)0xFFFFFFFF80000000 || v13 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_33;
  }
  if (v7 > 0x7FFFFFFF)
  {
LABEL_34:
    __break(1u);
LABEL_35:
    OUTLINED_FUNCTION_132();
    uint64_t result = OUTLINED_FUNCTION_1_97();
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_27_50();
  if (v0) {
    uint64_t v25 = v22 + 1;
  }
  else {
    uint64_t v25 = v22;
  }
  if (v21) {
    uint64_t v26 = 102;
  }
  else {
    uint64_t v26 = 101;
  }
  return OUTLINED_FUNCTION_21_51(v26, v25, v16, v17, v18, v19, v20, v23, v24);
}

uint64_t UnsafeMutableVectorPointer<A>.addProductDouble(_:_:transposed:scaledBy:)()
{
  OUTLINED_FUNCTION_33_30();
  if (!(v1 ^ v2 | v0))
  {
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  OUTLINED_FUNCTION_29_38();
  if (v1 != v2 || v5 < v8) {
    goto LABEL_31;
  }
  if (v5 > 0x7FFFFFFF)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    OUTLINED_FUNCTION_132();
    uint64_t result = OUTLINED_FUNCTION_1_97();
    __break(1u);
    return result;
  }
  if (v6) {
    uint64_t v10 = v4;
  }
  else {
    uint64_t v10 = v5;
  }
  if (v10 != v7) {
    goto LABEL_37;
  }
  if (*(uint64_t *)(v3 + 24) > 0x7FFFFFFF) {
    goto LABEL_33;
  }
  OUTLINED_FUNCTION_32_32();
  if (!(v1 ^ v2 | v0)) {
    goto LABEL_34;
  }
  if (v11 < (uint64_t)0xFFFFFFFF80000000 || v12 < (uint64_t)0xFFFFFFFF80000000 || v13 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_35;
  }
  OUTLINED_FUNCTION_31_24();
  if (!(v1 ^ v2 | v0)) {
    goto LABEL_36;
  }
  OUTLINED_FUNCTION_25_52();
  if (v0) {
    uint64_t v25 = v22;
  }
  else {
    uint64_t v25 = v22 + 1;
  }
  if (v21) {
    uint64_t v26 = 102;
  }
  else {
    uint64_t v26 = 101;
  }
  return OUTLINED_FUNCTION_20_55(v26, v25, v16, v17, v18, v19, v20, v23, v24);
}

{
  char v0;
  char v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  __n128 v23;
  __n128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;

  OUTLINED_FUNCTION_38_25();
  if (!(v1 ^ v2 | v0))
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  OUTLINED_FUNCTION_36_24();
  if (v1 != v2 || v5 < v9) {
    goto LABEL_29;
  }
  if (v5 > 0x7FFFFFFF)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (v6) {
    uint64_t v12 = v5;
  }
  else {
    uint64_t v12 = v4;
  }
  if (v12 != v3) {
    goto LABEL_35;
  }
  uint64_t v13 = *(void *)(v10 + 24);
  if (v13 > 0x7FFFFFFF) {
    goto LABEL_31;
  }
  if (v8 > 0x7FFFFFFF)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (v7 < (uint64_t)0xFFFFFFFF80000000 || v8 < (uint64_t)0xFFFFFFFF80000000 || v13 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_33;
  }
  if (v7 > 0x7FFFFFFF)
  {
LABEL_34:
    __break(1u);
LABEL_35:
    OUTLINED_FUNCTION_132();
    uint64_t result = OUTLINED_FUNCTION_1_97();
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_27_50();
  if (v0) {
    uint64_t v25 = v22 + 1;
  }
  else {
    uint64_t v25 = v22;
  }
  if (v21) {
    uint64_t v26 = 102;
  }
  else {
    uint64_t v26 = 101;
  }
  return OUTLINED_FUNCTION_20_55(v26, v25, v16, v17, v18, v19, v20, v23, v24);
}

uint64_t UnsafeMutableVectorPointer<A>.addProduct(_:_:transposed:scaledBy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  OUTLINED_FUNCTION_35_28(a1, a2, a3, a4, a5, a6);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_10();
  uint64_t v13 = v12 - v11;
  type metadata accessor for UnsafeMutableVectorPointer();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689D4E30);
  if (OUTLINED_FUNCTION_3_107())
  {
    OUTLINED_FUNCTION_22_53();
    __swift_instantiateConcreteTypeFromMangledName(qword_2689D4E48);
    OUTLINED_FUNCTION_15_62();
    OUTLINED_FUNCTION_10_82();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689D4E28);
    OUTLINED_FUNCTION_15_62();
    __n128 v14 = OUTLINED_FUNCTION_11_71();
    (*(void (**)(uint64_t, uint64_t, uint64_t, __n128))(*(void *)(v15 - 256) + 16))(v13, v20, a10, v14);
    OUTLINED_FUNCTION_37_27();
    OUTLINED_FUNCTION_34_28();
    OUTLINED_FUNCTION_45_20();
    return UnsafeMutableVectorPointer<A>.addProductFloat(_:_:transposed:scaledBy:)();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689D4E38);
    if (OUTLINED_FUNCTION_3_107())
    {
      OUTLINED_FUNCTION_22_53();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2689D4E40);
      OUTLINED_FUNCTION_15_62();
      OUTLINED_FUNCTION_10_82();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2689D4E20);
      OUTLINED_FUNCTION_15_62();
      OUTLINED_FUNCTION_11_71();
      OUTLINED_FUNCTION_9_71();
      v19(v17, v18);
      OUTLINED_FUNCTION_37_27();
      OUTLINED_FUNCTION_34_28();
      OUTLINED_FUNCTION_45_20();
      return UnsafeMutableVectorPointer<A>.addProductDouble(_:_:transposed:scaledBy:)();
    }
    else
    {
      OUTLINED_FUNCTION_30_33();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_6_92();
      sub_2396D04E0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_16_54();
      uint64_t result = OUTLINED_FUNCTION_12_69();
      __break(1u);
    }
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_97()
{
  return sub_2396D1650();
}

uint64_t OUTLINED_FUNCTION_3_107()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_5_104()
{
  long long v5 = v1[1];
  *(_OWORD *)(v3 - 144) = *v1;
  *(_OWORD *)(v3 - 128) = v5;
  *(unsigned char *)(v3 - 112) = *(unsigned char *)(v0 + 216);
  long long v6 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v0 + 144) = *(_OWORD *)v2;
  *(_OWORD *)(v0 + 160) = v6;
  *(unsigned char *)(v0 + 176) = *(unsigned char *)(v2 + 32);
  return type metadata accessor for UnsafeMatrixPointer();
}

uint64_t OUTLINED_FUNCTION_6_92()
{
  strcpy((char *)(v0 - 128), "Scalar type ");
  *(unsigned char *)(v0 - 115) = 0;
  *(_WORD *)(v0 - 114) = -5120;
  return sub_2396D2130();
}

uint64_t OUTLINED_FUNCTION_7_83()
{
  return v0 - 128;
}

__n128 OUTLINED_FUNCTION_8_92()
{
  __n128 result = *(__n128 *)(v1 - 264);
  long long v3 = *(_OWORD *)(v1 - 248);
  *(__n128 *)(v1 - 128) = result;
  *(_OWORD *)(v1 - 112) = v3;
  *(unsigned char *)(v1 - 96) = *(unsigned char *)(v1 - 232);
  *(void *)(v1 - 288) = v0;
  return result;
}

uint64_t OUTLINED_FUNCTION_10_82()
{
  long long v3 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 - 272) = *(_OWORD *)v0;
  *(_OWORD *)(v1 - 256) = v3;
  *(unsigned char *)(v1 - 240) = *(unsigned char *)(v0 + 32);
  return type metadata accessor for UnsafeMatrixPointer();
}

__n128 OUTLINED_FUNCTION_11_71()
{
  __n128 result = *(__n128 *)(v0 - 312);
  long long v2 = *(_OWORD *)(v0 - 296);
  *(__n128 *)(v0 - 128) = result;
  *(_OWORD *)(v0 - 112) = v2;
  *(unsigned char *)(v0 - 96) = *(unsigned char *)(v0 - 280);
  return result;
}

uint64_t OUTLINED_FUNCTION_12_69()
{
  return sub_2396D1650();
}

uint64_t OUTLINED_FUNCTION_14_68()
{
  long long v3 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 - 224) = *(_OWORD *)v0;
  *(_OWORD *)(v1 - 208) = v3;
  *(unsigned char *)(v1 - 192) = *(unsigned char *)(v0 + 32);
  return type metadata accessor for UnsafeMatrixPointer();
}

uint64_t OUTLINED_FUNCTION_15_62()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_16_54()
{
  return sub_2396D04E0();
}

uint64_t OUTLINED_FUNCTION_17_62()
{
  return v0 - 240;
}

uint64_t OUTLINED_FUNCTION_19_50()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_21_51@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>, __n128 a8@<Q0>, __n128 a9@<Q1>)
{
  a9.n128_u32[0] = 1.0;
  return MEMORY[0x270EDE458](a1, a2, a3, a4, v10, v9, a6, a7, a8, a9, a5);
}

uint64_t OUTLINED_FUNCTION_22_53()
{
  *(void *)(v3 - 200) = v0;
  *(void *)(v3 - 192) = v2;
  *(void *)(v3 - 184) = v1;
  return type metadata accessor for UnsafeVectorPointer();
}

uint64_t OUTLINED_FUNCTION_23_50()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_30_33()
{
  *(void *)(v0 - 128) = 0;
  *(void *)(v0 - 120) = 0xE000000000000000;
  return sub_2396D1200();
}

void OUTLINED_FUNCTION_35_28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  *(void *)(v6 - 336) = a6;
  *(_DWORD *)(v6 - 324) = a5;
}

uint64_t OUTLINED_FUNCTION_37_27()
{
  return swift_dynamicCast();
}

__n128 OUTLINED_FUNCTION_40_29()
{
  __n128 result = *(__n128 *)v1;
  long long v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v0 + 224) = *(_OWORD *)v1;
  *(_OWORD *)(v0 + 240) = v3;
  *(unsigned char *)(v0 + 256) = *(unsigned char *)(v1 + 32);
  return result;
}

uint64_t OUTLINED_FUNCTION_41_25()
{
  return swift_dynamicCast();
}

uint64_t DenseMatrix.indexed()()
{
  return OUTLINED_FUNCTION_1_98();
}

uint64_t DenseMatrix.Transpose.indexed()()
{
  return OUTLINED_FUNCTION_1_98();
}

uint64_t DenseMatrix.IndexedSequence.base.getter()
{
  return OUTLINED_FUNCTION_1_98();
}

uint64_t DenseMatrix.IndexedSequence.makeIterator()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)(a5 + 40) = 0;
  *(void *)(a5 + 48) = 0;
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(unsigned char *)(a5 + 16) = a3 & 1;
  *(void *)(a5 + 24) = a4;
  *(void *)(a5 + 32) = 0;
  return swift_retain();
}

uint64_t DenseMatrix.IndexedSequence.Iterator.init(base:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = result;
  *(void *)(a5 + 8) = a2;
  *(unsigned char *)(a5 + 16) = a3 & 1;
  *(void *)(a5 + 24) = a4;
  *(void *)(a5 + 32) = 0;
  *(void *)(a5 + 40) = 0;
  *(void *)(a5 + 48) = 0;
  return result;
}

uint64_t sub_2396B7724@<X0>(uint64_t a1@<X8>)
{
  DenseMatrix.IndexedSequence.makeIterator()(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), a1);

  return swift_release();
}

uint64_t DenseMatrix.IndexedSequence.Iterator.base.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t DenseMatrix.IndexedSequence.Iterator.row.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t DenseMatrix.IndexedSequence.Iterator.row.setter(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*DenseMatrix.IndexedSequence.Iterator.row.modify())(void, void)
{
  return nullsub_1;
}

uint64_t DenseMatrix.IndexedSequence.Iterator.column.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t DenseMatrix.IndexedSequence.Iterator.column.setter(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

uint64_t (*DenseMatrix.IndexedSequence.Iterator.column.modify())(void, void)
{
  return nullsub_1;
}

uint64_t DenseMatrix.IndexedSequence.Iterator.flatIndex.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t DenseMatrix.IndexedSequence.Iterator.flatIndex.setter(uint64_t result)
{
  *(void *)(v1 + 48) = result;
  return result;
}

uint64_t (*DenseMatrix.IndexedSequence.Iterator.flatIndex.modify())(void, void)
{
  return nullsub_1;
}

uint64_t DenseMatrix.IndexedSequence.Iterator.next()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  long long v3 = v2;
  v31 = a2;
  uint64_t v4 = *(void *)(a1 + 16);
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  MEMORY[0x270FA5388](TupleTypeMetadata3);
  uint64_t v7 = (char *)&v26 - v6;
  uint64_t v8 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = v2[5];
  uint64_t v10 = v2 + 5;
  uint64_t v11 = v12;
  uint64_t v13 = *(v10 - 4);
  if (v12 < v13)
  {
    uint64_t v14 = v3[4];
    if (v14 < *v3)
    {
      uint64_t v27 = *v3;
      uint64_t v30 = v14;
      uint64_t v29 = v3[6];
      _s13LinearAlgebra11DenseVectorV10_uncheckedxSi_tcig_0();
      uint64_t v15 = &v7[*(int *)(TupleTypeMetadata3 + 64)];
      uint64_t v16 = *(uint64_t (**)(void))(v8 + 32);
      v28 = v15;
      uint64_t result = v16();
      uint64_t v18 = v16;
      if (v3[2])
      {
        uint64_t v19 = v30;
        uint64_t v20 = v30 + 1;
        v3[4] = v30 + 1;
        uint64_t v21 = v11;
        unsigned int v22 = v10;
        uint64_t v10 = v3 + 4;
        if (v20 != v27)
        {
LABEL_11:
          if (__OFADD__(v29, 1))
          {
            __break(1u);
          }
          else
          {
            v3[6] = v29 + 1;
            uint64_t v24 = (uint64_t)v31;
            uint64_t v25 = (char *)v31 + *(int *)(TupleTypeMetadata3 + 64);
            void *v31 = v19;
            *(void *)(v24 + 8) = v11;
            ((void (*)(char *, char *, uint64_t))v18)(v25, v28, v4);
            return __swift_storeEnumTagSinglePayload(v24, 0, 1, TupleTypeMetadata3);
          }
          return result;
        }
      }
      else
      {
        *uint64_t v10 = v11 + 1;
        uint64_t v19 = v30;
        uint64_t v21 = v30;
        unsigned int v22 = v3 + 4;
        if (v11 + 1 != v13) {
          goto LABEL_11;
        }
      }
      *unsigned int v22 = v21 + 1;
      *uint64_t v10 = 0;
      goto LABEL_11;
    }
  }
  uint64_t v23 = (uint64_t)v31;

  return __swift_storeEnumTagSinglePayload(v23, 1, 1, TupleTypeMetadata3);
}

uint64_t sub_2396B7AB8()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for DenseMatrix.IndexedSequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2396B7AF0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t sub_2396B7B40(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t sub_2396B7BB8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t type metadata accessor for DenseMatrix.IndexedSequence.Iterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2396B7C28@<X0>(uint64_t a1@<X8>)
{
  return sub_2396B7C58((uint64_t (*)(void, void, void, void))DenseMatrix.Transpose.indexed(), a1);
}

uint64_t sub_2396B7C40@<X0>(uint64_t a1@<X8>)
{
  return sub_2396B7C58((uint64_t (*)(void, void, void, void))DenseMatrix.indexed(), a1);
}

uint64_t sub_2396B7C58@<X0>(uint64_t (*a1)(void, void, void, void)@<X2>, uint64_t a2@<X8>)
{
  uint64_t result = a1(*(void *)v2, *(void *)(v2 + 8), *(unsigned __int8 *)(v2 + 16), *(void *)(v2 + 24));
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = v6 & 1;
  *(void *)(a2 + 24) = v7;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_98()
{
  return v0;
}

uint64_t UpperStrictlyTriangularMatrix.indexed()()
{
  return OUTLINED_FUNCTION_3_106();
}

uint64_t UpperStrictlyTriangularMatrix.IndexedSequence.base.getter()
{
  return OUTLINED_FUNCTION_3_106();
}

uint64_t UpperStrictlyTriangularMatrix.IndexedSequence.makeIterator()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = a3;
  *(void *)(a5 + 24) = a4;
  *(_OWORD *)(a5 + 32) = xmmword_2396E3DB0;
  *(void *)(a5 + 48) = 0;
  swift_retain();

  return sub_2396D0110();
}

double UpperStrictlyTriangularMatrix.IndexedSequence.Iterator.init(base:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 16) = a3;
  *(void *)(a5 + 24) = a4;
  double result = 0.0;
  *(_OWORD *)(a5 + 32) = xmmword_2396E3DB0;
  *(void *)(a5 + 48) = 0;
  return result;
}

uint64_t sub_2396B7D94@<X0>(uint64_t a1@<X8>)
{
  UpperStrictlyTriangularMatrix.IndexedSequence.makeIterator()(*v1, v1[1], v1[2], v1[3], a1);
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t UpperStrictlyTriangularMatrix.IndexedSequence.Iterator.base.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  sub_2396D0110();
  return v1;
}

uint64_t UpperStrictlyTriangularMatrix.IndexedSequence.Iterator.row.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t UpperStrictlyTriangularMatrix.IndexedSequence.Iterator.row.setter(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*UpperStrictlyTriangularMatrix.IndexedSequence.Iterator.row.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UpperStrictlyTriangularMatrix.IndexedSequence.Iterator.column.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t UpperStrictlyTriangularMatrix.IndexedSequence.Iterator.column.setter(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

uint64_t (*UpperStrictlyTriangularMatrix.IndexedSequence.Iterator.column.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UpperStrictlyTriangularMatrix.IndexedSequence.Iterator.flatIndex.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t UpperStrictlyTriangularMatrix.IndexedSequence.Iterator.flatIndex.setter(uint64_t result)
{
  *(void *)(v1 + 48) = result;
  return result;
}

uint64_t (*UpperStrictlyTriangularMatrix.IndexedSequence.Iterator.flatIndex.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UpperStrictlyTriangularMatrix.IndexedSequence.Iterator.next()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  MEMORY[0x270FA5388](TupleTypeMetadata3);
  uint64_t v7 = (char *)&v22 - v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v2[5];
  uint64_t v13 = v2[1];
  if (v12 < v13)
  {
    uint64_t v14 = v2[4];
    if (v14 < *v2)
    {
      uint64_t v24 = v9;
      uint64_t v25 = v14;
      uint64_t v15 = v2[6];
      swift_retain();
      uint64_t v23 = v15;
      uint64_t v16 = v24;
      _s13LinearAlgebra11DenseVectorV10_uncheckedxSi_tcig_0();
      swift_release();
      uint64_t v17 = &v7[*(int *)(TupleTypeMetadata3 + 64)];
      uint64_t v18 = *(uint64_t (**)(char *, char *, uint64_t))(v16 + 32);
      uint64_t result = v18(v17, v11, v4);
      uint64_t v20 = v25;
      v2[5] = v12 + 1;
      if (v12 + 1 == v13)
      {
        v2[4] = v20 + 1;
        if (__OFADD__(v20, 2))
        {
LABEL_12:
          __break(1u);
          return result;
        }
        v2[5] = v20 + 2;
      }
      if (!__OFADD__(v23, 1))
      {
        v2[6] = v23 + 1;
        uint64_t v21 = (char *)a2 + *(int *)(TupleTypeMetadata3 + 64);
        *a2 = v20;
        a2[1] = v12;
        v18(v21, v17, v4);
        return __swift_storeEnumTagSinglePayload((uint64_t)a2, 0, 1, TupleTypeMetadata3);
      }
      __break(1u);
      goto LABEL_12;
    }
  }

  return __swift_storeEnumTagSinglePayload((uint64_t)a2, 1, 1, TupleTypeMetadata3);
}

uint64_t sub_2396B8108()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for UpperStrictlyTriangularMatrix.IndexedSequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2396B8144(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  sub_2396D0110();
  return a1;
}

void *sub_2396B8194(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  sub_2396D0110();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  return a1;
}

uint64_t sub_2396B821C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t sub_2396B8274(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
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

uint64_t sub_2396B82B4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for UpperStrictlyTriangularMatrix.IndexedSequence.Iterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2396B8318@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UpperStrictlyTriangularMatrix.indexed()();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return result;
}

uint64_t sub_2396B834C()
{
  uint64_t v0 = sub_2396CFD30();
  __swift_allocate_value_buffer(v0, static Logger.linearAlgebra);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.linearAlgebra);
  return sub_2396CFD20();
}

uint64_t Logger.linearAlgebra.unsafeMutableAddressor()
{
  if (qword_2689D4D08 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2396CFD30();

  return __swift_project_value_buffer(v0, (uint64_t)static Logger.linearAlgebra);
}

uint64_t static Logger.linearAlgebra.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_2689D4D08 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2396CFD30();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.linearAlgebra);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t UnsafeVectorPointer.baseAddress.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*UnsafeVectorPointer.baseAddress.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeVectorPointer.count.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*UnsafeVectorPointer.count.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeVectorPointer.stride.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t UnsafeVectorPointer.stride.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*UnsafeVectorPointer.stride.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeVectorPointer.init(_:)()
{
  uint64_t result = sub_2396D03E0();
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t UnsafeVectorPointer.Iterator.baseAddress.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*UnsafeVectorPointer.Iterator.baseAddress.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeVectorPointer.Iterator.stride.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t (*UnsafeVectorPointer.Iterator.stride.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeVectorPointer.Iterator.next()@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *v2;
  if (!*v2) {
    goto LABEL_5;
  }
  uint64_t v5 = v2[1];
  if (!v5)
  {
    __break(1u);
    return result;
  }
  if (v4 == v5)
  {
LABEL_5:
    uint64_t v11 = *(void *)(result + 16);
    uint64_t v9 = a2;
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v6 = *(void *)(result + 16);
    uint64_t v7 = *(void *)(v6 - 8);
    uint64_t v8 = *(void (**)(uint64_t))(v7 + 16);
    *uint64_t v2 = v4 + *(void *)(v7 + 72) * v2[2];
    v8(a2);
    uint64_t v9 = a2;
    uint64_t v10 = 0;
    uint64_t v11 = v6;
  }

  return __swift_storeEnumTagSinglePayload(v9, v10, 1, v11);
}

void UnsafeVectorPointer.makeIterator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unsigned __int128)(a2 * (__int128)a3) >> 64 != (a2 * a3) >> 63) {
    __break(1u);
  }
}

uint64_t UnsafeVectorPointer._copyContents(initializing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v33 = a1;
  uint64_t v11 = *(void *)(a6 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2396D0FA0();
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v30 - v15;
  uint64_t v34 = a3;
  uint64_t v35 = a4;
  uint64_t v36 = a5;
  type metadata accessor for UnsafeVectorPointer();
  swift_getWitnessTable();
  if (sub_2396D0D70())
  {
    UnsafeVectorPointer.makeIterator()(a3, a4, a5);
    uint64_t v18 = v17;
    sub_2396D0FE0();
    return v18;
  }
  uint64_t v19 = a4;
  uint64_t v32 = a3;
  uint64_t v20 = sub_2396D03E0();
  if (v20)
  {
    if (a2 < a4)
    {
      __break(1u);
    }
    else
    {
      uint64_t v21 = v20;
      uint64_t v22 = v19;
      if (a5 == 1)
      {
        uint64_t v23 = v32;
        sub_2396D0F30();
      }
      else
      {
        v30[1] = a2;
        uint64_t v31 = a5;
        UnsafeVectorPointer.makeIterator()(v32, v19, a5);
        uint64_t v34 = v24;
        uint64_t v35 = v25;
        uint64_t v36 = v26;
        uint64_t v27 = type metadata accessor for UnsafeVectorPointer.Iterator();
        UnsafeVectorPointer.Iterator.next()(v27, (uint64_t)v16);
        if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, a6) != 1)
        {
          v28 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
          do
          {
            v28(v13, v16, a6);
            v28((char *)v21, v13, a6);
            v21 += *(void *)(v11 + 72);
            UnsafeVectorPointer.Iterator.next()(v27, (uint64_t)v16);
          }
          while (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, a6) != 1);
        }
        a5 = v31;
        uint64_t v23 = v32;
      }
      if ((unsigned __int128)(v22 * (__int128)a5) >> 64 == (v22 * a5) >> 63)
      {
        uint64_t v18 = v23 + *(void *)(v11 + 72) * v22 * a5;
        sub_2396D0FE0();
        sub_2396D1000();
        return v18;
      }
    }
    __break(1u);
  }
  uint64_t result = sub_2396D1650();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for UnsafeVectorPointer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for UnsafeVectorPointer.Iterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2396B8A68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a2, a1);
}

void sub_2396B8A9C(void *a1@<X8>)
{
  UnsafeVectorPointer.makeIterator()(*v1, v1[1], v1[2]);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
}

uint64_t sub_2396B8AD8()
{
  swift_getWitnessTable();

  return sub_2396D0CD0();
}

uint64_t sub_2396B8B2C()
{
  return sub_2396D0D10();
}

uint64_t sub_2396B8B90(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *a1 = UnsafeVectorPointer._copyContents(initializing:)(a2, a3, *v4, v4[1], v4[2], *(void *)(a4 + 16));
  a1[1] = v6;
  a1[2] = v7;
  return v8;
}

uint64_t UnsafeVectorPointer.startIndex.getter()
{
  return 0;
}

Swift::Int __swiftcall UnsafeVectorPointer.index(after:)(Swift::Int after)
{
  return after + 1;
}

Swift::Void __swiftcall UnsafeVectorPointer.formIndex(after:)(Swift::Int *after)
{
}

Swift::Int __swiftcall UnsafeVectorPointer.index(before:)(Swift::Int before)
{
  return before - 1;
}

Swift::Void __swiftcall UnsafeVectorPointer.formIndex(before:)(Swift::Int *before)
{
}

Swift::Int __swiftcall UnsafeVectorPointer.index(_:offsetBy:)(Swift::Int _, Swift::Int offsetBy)
{
  return offsetBy + _;
}

Swift::Int_optional __swiftcall UnsafeVectorPointer.index(_:offsetBy:limitedBy:)(Swift::Int _, Swift::Int offsetBy, Swift::Int limitedBy)
{
  Swift::Int v4 = limitedBy - _;
  if (offsetBy < 1)
  {
    if (v4 <= 0 && v4 > offsetBy) {
      goto LABEL_4;
    }
LABEL_10:
    Swift::Bool v6 = 0;
    Swift::Int v5 = offsetBy + _;
    goto LABEL_11;
  }
  if (v4 < 0 || v4 >= (unint64_t)offsetBy) {
    goto LABEL_10;
  }
LABEL_4:
  Swift::Int v5 = 0;
  Swift::Bool v6 = 1;
LABEL_11:
  result.value = v5;
  result.is_nil = v6;
  return result;
}

Swift::Int __swiftcall UnsafeVectorPointer.distance(from:to:)(Swift::Int from, Swift::Int to)
{
  return to - from;
}

uint64_t UnsafeVectorPointer.indices.getter()
{
  return 0;
}

uint64_t _s13LinearAlgebra19UnsafeVectorPointerVyxSicig_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  if ((unsigned __int128)(result * (__int128)a3) >> 64 == (result * a3) >> 63) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(a5, a2 + *(void *)(*(void *)(a4 - 8) + 72) * result * a3, a4);
  }
  __break(1u);
  return result;
}

double UnsafeVectorPointer.subscript.getter@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for UnsafeVectorPointer();
  swift_getWitnessTable();
  sub_2396D1FC0();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 24) = v5;
  return result;
}

void sub_2396B8D5C(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 8);
}

void (*sub_2396B8D68(void *a1, uint64_t *a2, uint64_t a3))(void *a1)
{
  uint64_t v7 = malloc(0x28uLL);
  *a1 = v7;
  v7[4] = sub_2396B8DE0(v7, *a2, *v3, v3[1], v3[2], *(void *)(a3 + 16));
  return sub_23941786C;
}

void (*sub_2396B8DE0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(void *a1)
{
  uint64_t v8 = *(void *)(a6 - 8);
  *a1 = a6;
  a1[1] = v8;
  a1[2] = malloc(*(void *)(v8 + 64));
  UnsafeVectorPointer.subscript.getter(a2, a3);
  return sub_23941796C;
}

double sub_2396B8EA4@<D0>(uint64_t a1@<X8>)
{
  UnsafeVectorPointer.subscript.getter((uint64_t)v4);
  double result = *(double *)v4;
  long long v3 = v4[1];
  *(_OWORD *)a1 = v4[0];
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_2396B8F00@<X0>(void *a1@<X8>)
{
  uint64_t result = UnsafeVectorPointer.indices.getter();
  *a1 = 0;
  a1[1] = v3;
  return result;
}

Swift::Int sub_2396B8F38@<X0>(Swift::Int *a1@<X0>, Swift::Int *a2@<X8>)
{
  Swift::Int result = UnsafeVectorPointer.index(after:)(*a1);
  *a2 = result;
  return result;
}

Swift::Int sub_2396B8F68@<X0>(Swift::Int *a1@<X0>, Swift::Int *a2@<X8>)
{
  Swift::Int result = UnsafeVectorPointer.index(before:)(*a1);
  *a2 = result;
  return result;
}

Swift::Int sub_2396B8F98@<X0>(Swift::Int *a1@<X0>, Swift::Int a2@<X1>, Swift::Int *a3@<X8>)
{
  Swift::Int result = UnsafeVectorPointer.index(_:offsetBy:)(*a1, a2);
  *a3 = result;
  return result;
}

Swift::Int sub_2396B8FC4@<X0>(Swift::Int *a1@<X0>, Swift::Int a2@<X1>, Swift::Int *a3@<X2>, uint64_t a4@<X8>)
{
  Swift::Int_optional v6 = UnsafeVectorPointer.index(_:offsetBy:limitedBy:)(*a1, a2, *a3);
  *(void *)a4 = v6.value;
  *(unsigned char *)(a4 + 8) = v6.is_nil;
  return v6.value;
}

Swift::Int sub_2396B8FFC(Swift::Int *a1, Swift::Int *a2)
{
  return UnsafeVectorPointer.distance(from:to:)(*a1, *a2);
}

void *UnsafeVectorPointer.withContiguousStorageIfAvailable<A>(_:)@<X0>(void *(*a1)(void *__return_ptr, uint64_t, uint64_t, uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, void *a6@<X8>)
{
  if (a4 == 1)
  {
    Swift::Int result = a1(a6, a2, a3, 1);
    if (v6) {
      return result;
    }
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 1;
  }
  return (void *)__swift_storeEnumTagSinglePayload((uint64_t)a6, v10, 1, a5);
}

void UnsafeVectorPointer.init(rebasing:)()
{
  OUTLINED_FUNCTION_5_105();
  type metadata accessor for UnsafeVectorPointer();
  swift_getWitnessTable();
  sub_2396D1FF0();
  sub_2396D1FD0();
  OUTLINED_FUNCTION_1_99();
  OUTLINED_FUNCTION_4_97();
  OUTLINED_FUNCTION_7_84();
  if (v0)
  {
    OUTLINED_FUNCTION_3_108();
    OUTLINED_FUNCTION_2_111();
    OUTLINED_FUNCTION_0_55();
  }
  else
  {
    __break(1u);
  }
}

{
  char v0;

  OUTLINED_FUNCTION_5_105();
  type metadata accessor for UnsafeMutableVectorPointer();
  swift_getWitnessTable();
  sub_2396D1FF0();
  sub_2396D1FD0();
  OUTLINED_FUNCTION_1_99();
  OUTLINED_FUNCTION_4_97();
  OUTLINED_FUNCTION_7_84();
  if (v0)
  {
    OUTLINED_FUNCTION_3_108();
    OUTLINED_FUNCTION_2_111();
    OUTLINED_FUNCTION_0_55();
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall UnsafeVectorPointer.deallocate()()
{
}

uint64_t UnsafeVectorPointer.debugDescription.getter()
{
  return 0;
}

uint64_t sub_2396B9360()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396B937C()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396B9398()
{
  return sub_2396B947C();
}

uint64_t sub_2396B93B0()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396B93CC()
{
  return sub_2396B947C();
}

uint64_t sub_2396B93E4()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396B9448()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396B9464()
{
  return sub_2396B947C();
}

uint64_t sub_2396B947C()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396B94C8()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396B952C()
{
  return UnsafeVectorPointer.debugDescription.getter();
}

uint64_t sub_2396B9540()
{
  return sub_2396CDB50();
}

uint64_t sub_2396B95D0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 == 1 || !*(unsigned char *)(a1 + 24))
    {
      if (*(void *)a1) {
        int v2 = -1;
      }
      else {
        int v2 = 0;
      }
    }
    else
    {
      int v2 = *(_DWORD *)a1 + 1;
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_2396B960C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)Swift::Int result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)Swift::Int result = 0;
    }
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_99()
{
  return sub_2396D1FB0();
}

void OUTLINED_FUNCTION_3_108()
{
  JUMPOUT(0x23ECA2D50);
}

uint64_t OUTLINED_FUNCTION_5_105()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_6_93(uint64_t a1, uint64_t a2)
{
  return a2;
}

void *sub_2396B96F8(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_4_31();
LABEL_11:
    Swift::Int result = (void *)sub_2396D1750();
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_12_2();
  if (!v8 & v7) {
    BOOL v9 = v6 > v3;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    OUTLINED_FUNCTION_5_4();
    OUTLINED_FUNCTION_3_36();
    goto LABEL_11;
  }

  return memcpy(v5, v4, 8 * v2);
}

void static DenseMatrix.+= infix(_:_:)()
{
}

{
  sub_2396B9900();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void (**v14)(uint64_t);
  void (**v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t i;
  void (*v18)(void);
  void (*v19)(void);
  void (*v20)(void **);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (**v29)(uint64_t);
  void (**v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t j;
  void (*v33)(void);
  void (*v34)(void);
  void (*v35)(void **);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t *v41;
  void (*v42[4])(void **);

  OUTLINED_FUNCTION_5_1();
  uint64_t v1 = v0;
  OUTLINED_FUNCTION_1_3();
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_10();
  uint64_t v10 = v9 - v8;
  if (*v3 != v11 || v3[1] != v5)
  {
LABEL_39:
    OUTLINED_FUNCTION_21_14();
    OUTLINED_FUNCTION_132();
    OUTLINED_FUNCTION_92_2();
    OUTLINED_FUNCTION_10_87();
    OUTLINED_FUNCTION_33_5();
  }
  uint64_t v12 = *((unsigned __int8 *)v3 + 16);
  v37 = v10;
  if ((((v4) ^ v12))
  {
    v38 = v6;
    v39 = v5;
    if (v12)
    {
      if (v5 < 0)
      {
LABEL_37:
        __break(1u);
        goto LABEL_38;
      }
      if (v5)
      {
        uint64_t v13 = 0;
        uint64_t v14 = (void (**)(uint64_t))(v7 + 16);
        uint64_t v15 = (void (**)(uint64_t, uint64_t))(v7 + 8);
        v40 = v3;
        while (v13 != v5)
        {
          uint64_t v16 = *v3;
          if (*v3 < 0) {
            goto LABEL_33;
          }
          if (v16)
          {
            for (i = 0; i != v16; ++i)
            {
              OUTLINED_FUNCTION_34_29();
              uint64_t v19 = v18;
              (*v14)(v37);
              OUTLINED_FUNCTION_17_64();
              v19();
              type metadata accessor for DenseMatrix();
              uint64_t v20 = DenseMatrix.subscript.modify(v42, i, v13);
              OUTLINED_FUNCTION_15_65();
              (*v15)(v37, v1);
              uint64_t v21 = OUTLINED_FUNCTION_26_46();
              v20((void **)v21);
              uint64_t v5 = v39;
            }
          }
          ++v13;
          unint64_t v3 = v40;
          if (v13 == v5) {
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_32:
        __break(1u);
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
    }
    else
    {
      if (v6 < 0)
      {
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
      if (v6)
      {
        v28 = 0;
        uint64_t v29 = (void (**)(uint64_t))(v7 + 16);
        uint64_t v30 = (void (**)(uint64_t, uint64_t))(v7 + 8);
        v41 = v3;
        while (v28 != v6)
        {
          uint64_t v31 = v3[1];
          if (v31 < 0) {
            goto LABEL_34;
          }
          if (v31)
          {
            for (j = 0; j != v31; ++j)
            {
              OUTLINED_FUNCTION_34_29();
              uint64_t v34 = v33;
              (*v29)(v37);
              OUTLINED_FUNCTION_17_64();
              v34();
              type metadata accessor for DenseMatrix();
              uint64_t v35 = DenseMatrix.subscript.modify(v42, v28, j);
              sub_2396D1680();
              (*v30)(v37, v1);
              uint64_t v36 = OUTLINED_FUNCTION_26_46();
              v35((void **)v36);
              unint64_t v6 = v38;
            }
          }
          ++v28;
          unint64_t v3 = v41;
          if (v28 == v6) {
            goto LABEL_30;
          }
        }
        goto LABEL_32;
      }
    }
  }
  else
  {
    uint64_t v22 = v6 * v5;
    if ((unsigned __int128)(v6 * (__int128)v5) >> 64 != (v6 * v5) >> 63)
    {
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
    if (v22 < 0)
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v22)
    {
      uint64_t v23 = v7;
      uint64_t v24 = 0;
      uint64_t v25 = v3 + 3;
      do
      {
        _s13LinearAlgebra11DenseVectorV10_uncheckedxSi_tcig_0();
        uint64_t v26 = sub_2396D1470();
        sub_2396D13B0();
        sub_239636D6C(v24, *v25);
        OUTLINED_FUNCTION_15_65();
        (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v37, v1);
        nullsub_1(v26, v27);
        ++v24;
      }
      while (v22 != v24);
    }
  }
LABEL_30:
  OUTLINED_FUNCTION_4_1();
}

uint64_t static DenseMatrix.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_2396BA068(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (void (*)(uint64_t *))static DenseMatrix.+= infix(_:_:));
}

uint64_t static DenseMatrix.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = swift_retain();
  OUTLINED_FUNCTION_16_55(v5, v6, v7, v8, v9, v10, v11, v12, a5);
  static DenseMatrix.+= infix(_:_:)();
  return v15;
}

void static DenseMatrix.-= infix(_:_:)()
{
}

{
  sub_2396B9C6C();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_5_1();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_1_3();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_10_2();
  if (((v9 ^ *(unsigned __int8 *)(v6 + 16)) & 1) != 0 || *(void *)v6 != v7 || *(void *)(v6 + 8) != v8)
  {
LABEL_12:
    OUTLINED_FUNCTION_21_14();
    OUTLINED_FUNCTION_132();
    OUTLINED_FUNCTION_92_2();
    OUTLINED_FUNCTION_10_87();
    OUTLINED_FUNCTION_33_5();
  }
  uint64_t v10 = v7 * v8;
  if ((unsigned __int128)(v7 * (__int128)v8) >> 64 != (v7 * v8) >> 63)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v10 < 0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v10)
  {
    uint64_t v11 = 0;
    uint64_t v12 = (uint64_t *)(v6 + 24);
    do
    {
      _s13LinearAlgebra11DenseVectorV10_uncheckedxSi_tcig_0();
      uint64_t v13 = sub_2396D1470();
      sub_2396D13B0();
      sub_239636D6C(v11, *v12);
      sub_2396D1690();
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0, v2);
      nullsub_1(v13, v14);
      ++v11;
    }
    while (v10 != v11);
  }
  OUTLINED_FUNCTION_4_1();
}

void sub_2396B9900()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_10();
  uint64_t v35 = *v9;
  if (v35 != DenseMatrix.Transpose.rowCount.getter(v7, v8)
    || (uint64_t v10 = v5[1], v10 != DenseMatrix.Transpose.columnCount.getter(v3)))
  {
LABEL_30:
    OUTLINED_FUNCTION_38_26();
    OUTLINED_FUNCTION_132();
    OUTLINED_FUNCTION_11_72();
    OUTLINED_FUNCTION_33_5();
  }
  v39 = v1;
  if (v5[2])
  {
    uint64_t v11 = v10;
    if (v10 < 0)
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    if (v10)
    {
      uint64_t v12 = 0;
      uint64_t v34 = v11;
      v40 = v5;
      while (v12 != v11)
      {
        if (*v5 < 0) {
          goto LABEL_26;
        }
        if (*v5)
        {
          uint64_t v13 = 0;
          uint64_t v36 = *v5;
          do
          {
            OUTLINED_FUNCTION_45_21();
            OUTLINED_FUNCTION_42_26();
            uint64_t v14 = OUTLINED_FUNCTION_7_85();
            v15(v14);
            OUTLINED_FUNCTION_21_52();
            v1();
            type metadata accessor for DenseMatrix();
            uint64_t v16 = DenseMatrix.subscript.modify(v42, v13, v12);
            uint64_t v18 = OUTLINED_FUNCTION_6_94((uint64_t)v16, v17);
            v19(v18);
            OUTLINED_FUNCTION_10_83();
            v20();
            uint64_t v21 = OUTLINED_FUNCTION_44_27();
            ((void (*)(uint64_t))v1)(v21);
            uint64_t v1 = v39;
            uint64_t v13 = v38;
          }
          while (v36 != v38);
        }
        ++v12;
        uint64_t v11 = v34;
        uint64_t v5 = v40;
        if (v12 == v34) {
          goto LABEL_23;
        }
      }
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v22 = v35;
    if (v35 < 0)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    if (v35)
    {
      uint64_t v23 = 0;
      v41 = v5;
      while (v23 != v22)
      {
        uint64_t v24 = v5[1];
        if (v24 < 0) {
          goto LABEL_27;
        }
        if (v24)
        {
          uint64_t v25 = 0;
          uint64_t v37 = v5[1];
          do
          {
            OUTLINED_FUNCTION_45_21();
            OUTLINED_FUNCTION_42_26();
            uint64_t v26 = OUTLINED_FUNCTION_7_85();
            v27(v26);
            OUTLINED_FUNCTION_21_52();
            v1();
            type metadata accessor for DenseMatrix();
            v28 = DenseMatrix.subscript.modify(v42, v23, v25);
            uint64_t v30 = OUTLINED_FUNCTION_6_94((uint64_t)v28, v29);
            v31(v30);
            OUTLINED_FUNCTION_10_83();
            v32();
            uint64_t v33 = OUTLINED_FUNCTION_44_27();
            ((void (*)(uint64_t))v1)(v33);
            uint64_t v1 = v39;
            uint64_t v25 = v38;
          }
          while (v37 != v38);
        }
        ++v23;
        uint64_t v22 = v35;
        uint64_t v5 = v41;
        if (v23 == v35) {
          goto LABEL_23;
        }
      }
      goto LABEL_25;
    }
  }
LABEL_23:
  OUTLINED_FUNCTION_4_1();
}

void sub_2396B9C6C()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_1();
  uint64_t v44 = v4;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_10();
  uint64_t v8 = v7 - v6;
  v45 = v9;
  if (DenseMatrix.Transpose.rowCount.getter(*v9, v9[1]) != v3
    || (uint64_t v10 = OUTLINED_FUNCTION_18_53(),
        (void (*)(void **))DenseMatrix.Transpose.columnCount.getter(v10) != v1))
  {
LABEL_32:
    OUTLINED_FUNCTION_38_26();
    OUTLINED_FUNCTION_132();
    OUTLINED_FUNCTION_11_72();
    OUTLINED_FUNCTION_33_5();
  }
  uint64_t v11 = OUTLINED_FUNCTION_18_53();
  if (DenseMatrix.Transpose.layout.getter(v11, v12, v13))
  {
    uint64_t v27 = v1;
    if (((unint64_t)v1 & 0x8000000000000000) != 0)
    {
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    if (v1)
    {
      uint64_t v28 = v3;
      uint64_t v29 = 0;
      while (v29 != v27)
      {
        uint64_t v30 = OUTLINED_FUNCTION_43_26();
        uint64_t v32 = DenseMatrix.Transpose.rowCount.getter(v30, v31);
        if (v32 < 0) {
          goto LABEL_29;
        }
        uint64_t v33 = v28;
        uint64_t v34 = (uint64_t)v29;
        if (v32)
        {
          uint64_t v35 = 0;
          do
          {
            uint64_t v36 = v34;
            DenseMatrix.subscript.read();
            uint64_t v38 = v37;
            (*(void (**)(uint64_t))(v44 + 16))(v8);
            uint64_t v39 = OUTLINED_FUNCTION_25_53();
            v38(v39);
            type metadata accessor for DenseMatrix();
            uint64_t v40 = v35;
            uint64_t v35 = (uint64_t)v45;
            uint64_t v27 = DenseMatrix.subscript.modify(v46, v36, v40);
            OUTLINED_FUNCTION_49_16();
            v41();
            OUTLINED_FUNCTION_10_83();
            v42();
            uint64_t v43 = OUTLINED_FUNCTION_26_46();
            v27((void **)v43);
            OUTLINED_FUNCTION_33_31();
          }
          while (!v26);
        }
        uint64_t v28 = v33;
        uint64_t v29 = (void (*)(void **))(v34 + 1);
        if ((void (*)(void **))(v34 + 1) == v27) {
          goto LABEL_25;
        }
      }
      goto LABEL_27;
    }
  }
  else
  {
    if (v3 < 0)
    {
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    if (v3)
    {
      uint64_t v14 = 0;
      while (v14 != v3)
      {
        uint64_t v15 = OUTLINED_FUNCTION_43_26();
        uint64_t v16 = DenseMatrix.Transpose.columnCount.getter(v15);
        if (v16 < 0) {
          goto LABEL_28;
        }
        if (v16)
        {
          uint64_t v17 = 0;
          do
          {
            DenseMatrix.subscript.read();
            uint64_t v19 = v18;
            (*(void (**)(uint64_t))(v44 + 16))(v8);
            uint64_t v20 = OUTLINED_FUNCTION_25_53();
            v19(v20);
            type metadata accessor for DenseMatrix();
            uint64_t v21 = v17;
            uint64_t v17 = (uint64_t)v45;
            uint64_t v22 = DenseMatrix.subscript.modify(v46, v21, v14);
            OUTLINED_FUNCTION_49_16();
            v23();
            OUTLINED_FUNCTION_10_83();
            v24();
            uint64_t v25 = OUTLINED_FUNCTION_26_46();
            v22((void **)v25);
            OUTLINED_FUNCTION_33_31();
          }
          while (!v26);
        }
        if (++v14 == v3) {
          goto LABEL_25;
        }
      }
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
LABEL_25:
  OUTLINED_FUNCTION_4_1();
}

uint64_t static DenseMatrix.- infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_2396BA068(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (void (*)(uint64_t *))static DenseMatrix.-= infix(_:_:));
}

uint64_t sub_2396BA068(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void (*a11)(uint64_t *))
{
  uint64_t v11 = swift_retain();
  uint64_t v19 = OUTLINED_FUNCTION_16_55(v11, v12, v13, v14, v15, v16, v17, v18, a1);
  a11(v19);
  return v22;
}

void static DenseMatrix.- infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v22 = v21;
  OUTLINED_FUNCTION_0_1();
  uint64_t v24 = v23;
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_10();
  uint64_t v28 = v27 - v26;
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v29);
  swift_getAssociatedConformanceWitness();
  sub_2396D1ED0();
  sub_2396D1C40();
  static DenseMatrix.* infix(_:_:)(v22);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v28, a21);
  static DenseMatrix.+= infix(_:_:)();
  OUTLINED_FUNCTION_4_1();
}

void static DenseMatrix.* infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  LODWORD(v107) = v30;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v35 = a22;
  OUTLINED_FUNCTION_0_1();
  uint64_t v108 = v36;
  LODWORD(v38) = v37 & 1;
  MEMORY[0x270FA5388](v39);
  v41 = (char *)&v85 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_8_0();
  uint64_t v89 = v43;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_8_0();
  uint64_t v106 = v45;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x270FA5388](v46);
  v101 = (char *)&v85 - v47;
  uint64_t v88 = *(void *)(*(void *)(*(void *)(a22 + 16) + 16) + 8);
  uint64_t v92 = *(void *)(v88 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v48);
  v90 = (char *)&v85 - v49;
  uint64_t v98 = v27;
  uint64_t v99 = v25;
  uint64_t v100 = v23;
  if (DenseMatrix.Transpose.rowCount.getter(v27, v25) != v32) {
    goto LABEL_27;
  }
  v95 = v41;
  uint64_t v102 = v32;
  uint64_t v96 = v29;
  if (qword_2689D4D08 != -1) {
    goto LABEL_24;
  }
  while (1)
  {
    uint64_t v50 = sub_2396CFD30();
    __swift_project_value_buffer(v50, (uint64_t)static Logger.linearAlgebra);
    v51 = sub_2396CFD10();
    os_log_type_t v52 = sub_2396D0E30();
    BOOL v53 = os_log_type_enabled(v51, v52);
    uint64_t v104 = v34;
    int v97 = v38;
    if (v53)
    {
      v54 = (uint8_t *)swift_slowAlloc();
      v111[0] = swift_slowAlloc();
      *(_DWORD *)v54 = 136315138;
      uint64_t v55 = sub_2396D2130();
      uint64_t v57 = sub_2395580BC(v55, v56, v111);
      OUTLINED_FUNCTION_35_29(v57);
      uint64_t v58 = v104;
      sub_2396D1050();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2393EB000, v51, v52, "Using a slow implementation of matrix multiplication for %s. Prefer using Float or Double.", v54, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_43();
      OUTLINED_FUNCTION_3_43();

      uint64_t v59 = (uint64_t)v101;
    }
    else
    {

      uint64_t v59 = (uint64_t)v101;
      uint64_t v58 = v34;
    }
    uint64_t v34 = DenseMatrix.Transpose.columnCount.getter(v98);
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    sub_2396D1ED0();
    sub_2396D1C40();
    uint64_t v60 = v34;
    uint64_t v61 = DenseMatrix.init(rowCount:columnCount:layout:repeating:)(v58, v34, 0, v59, a21);
    OUTLINED_FUNCTION_47_16(v61, v62, v63, v64);
    uint64_t v65 = v102;
    if (v58 < 0)
    {
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      OUTLINED_FUNCTION_132();
      OUTLINED_FUNCTION_11_72();
      OUTLINED_FUNCTION_33_5();
    }
    if (!v58) {
      break;
    }
    if (v34 < 0) {
      goto LABEL_26;
    }
    uint64_t v66 = 0;
    uint64_t v67 = v58;
    v85 = (void (**)(uint64_t, uint64_t, uint64_t))(v108 + 24);
    LODWORD(v38) = v106;
    uint64_t v86 = v34;
    v105 = (void (**)(void))(v108 + 8);
    v94 = (void (**)(uint64_t))(v108 + 16);
    int v93 = v107 & 1;
    uint64_t v109 = v35;
    while (v66 != v67)
    {
      if (v60)
      {
        if (v65 < 0) {
          goto LABEL_23;
        }
        uint64_t v68 = 0;
        uint64_t v103 = v66;
        while (v68 != v60)
        {
          uint64_t v107 = v68;
          sub_2396D1ED0();
          sub_2396D1C40();
          uint64_t v69 = v35;
          uint64_t v70 = v89;
          uint64_t v71 = v88;
          if (v65)
          {
            uint64_t v72 = 0;
            do
            {
              uint64_t v108 = v72 + 1;
              DenseMatrix.subscript.read();
              v74 = v73;
              v75 = *v94;
              (*v94)(v70);
              OUTLINED_FUNCTION_21_52();
              v74();
              uint64_t v76 = v71;
              uint64_t v77 = v102;
              DenseMatrix.subscript.read();
              v79 = v78;
              v75((uint64_t)v95);
              v79(v110, 0);
              sub_2396D0BE0();
              v80 = *v105;
              uint64_t v65 = v77;
              uint64_t v71 = v76;
              OUTLINED_FUNCTION_27_4();
              v80();
              OUTLINED_FUNCTION_27_4();
              v80();
              sub_2396D1680();
              OUTLINED_FUNCTION_27_4();
              v80();
              uint64_t v69 = v109;
              uint64_t v66 = v103;
              uint64_t v72 = v108;
            }
            while (v65 != v108);
          }
          uint64_t v81 = v107;
          uint64_t v82 = v107 + 1;
          uint64_t v35 = v69;
          type metadata accessor for DenseMatrix();
          v83 = DenseMatrix.subscript.modify(v110, v66, v81);
          uint64_t v38 = v106;
          (*v85)(v84, v106, a21);
          ((void (*)(void (**)(void **), void))v83)(v110, 0);
          uint64_t v34 = (uint64_t)v105;
          ((void (*)(uint64_t, uint64_t))*v105)(v38, a21);
          uint64_t v68 = v82;
          uint64_t v60 = v86;
          if (v82 == v86) {
            goto LABEL_19;
          }
        }
        __break(1u);
        break;
      }
LABEL_19:
      ++v66;
      uint64_t v67 = v104;
      if (v66 == v104) {
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    swift_once();
  }
LABEL_20:
  OUTLINED_FUNCTION_4_1();
}

void static DenseMatrix.* infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void (**a21)(void **a1),uint64_t a22)
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v94 = v22;
  LODWORD(v24) = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  OUTLINED_FUNCTION_0_1();
  uint64_t v104 = v35;
  uint64_t v105 = v34;
  LODWORD(v37) = v36 & 1;
  MEMORY[0x270FA5388](v38);
  uint64_t v40 = (char *)&v83 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v41);
  OUTLINED_FUNCTION_8_0();
  uint64_t v88 = v42;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_8_0();
  uint64_t v102 = v44;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x270FA5388](v45);
  uint64_t v98 = (char *)&v83 - v46;
  uint64_t v87 = *(void *)(*(void *)(*(void *)(a22 + 16) + 16) + 8);
  uint64_t v91 = *(void *)(v87 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_3();
  MEMORY[0x270FA5388](v47);
  uint64_t v89 = (char *)&v83 - v48;
  uint64_t v99 = v28;
  uint64_t v100 = v32;
  uint64_t v49 = v32;
  uint64_t v50 = v30;
  if (DenseMatrix.Transpose.columnCount.getter(v49) != v26) {
    goto LABEL_26;
  }
  uint64_t v51 = v26;
  v95 = v40;
  uint64_t v107 = a22;
  if (qword_2689D4D08 != -1) {
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v52 = sub_2396CFD30();
    __swift_project_value_buffer(v52, (uint64_t)static Logger.linearAlgebra);
    BOOL v53 = sub_2396CFD10();
    os_log_type_t v54 = sub_2396D0E30();
    BOOL v55 = os_log_type_enabled(v53, v54);
    uint64_t v56 = v100;
    int v97 = v37;
    LODWORD(v106) = v24;
    if (v55)
    {
      uint64_t v57 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      v109[0] = v24;
      *(_DWORD *)uint64_t v57 = 136315138;
      uint64_t v58 = sub_2396D2130();
      uint64_t v60 = sub_2395580BC(v58, v59, v109);
      OUTLINED_FUNCTION_35_29(v60);
      sub_2396D1050();
      uint64_t v56 = v100;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2393EB000, v53, v54, "Using a slow implementation of matrix multiplication for %s. Prefer using Float or Double.", v57, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_43();
      OUTLINED_FUNCTION_3_43();
    }

    uint64_t v96 = v50;
    uint64_t v61 = DenseMatrix.Transpose.rowCount.getter(v56, v50);
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    sub_2396D1ED0();
    uint64_t v50 = (uint64_t)v98;
    uint64_t v62 = v61;
    char v63 = a21;
    sub_2396D1C40();
    uint64_t v64 = DenseMatrix.init(rowCount:columnCount:layout:repeating:)(v62, v105, 0, v50, (uint64_t)a21);
    OUTLINED_FUNCTION_47_16(v64, v65, v66, v67);
    if (v62 < 0)
    {
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      OUTLINED_FUNCTION_132();
      OUTLINED_FUNCTION_11_72();
      OUTLINED_FUNCTION_33_5();
    }
    if (!v62) {
      break;
    }
    if (v105 < 0) {
      goto LABEL_25;
    }
    uint64_t v37 = 0;
    v85 = (void (**)(uint64_t, uint64_t, void (**)(void **)))(v104 + 24);
    uint64_t v68 = v62;
    uint64_t v84 = v62;
    v101 = (void (**)(void))(v104 + 8);
    int v93 = v106 & 1;
    uint64_t v92 = (void (**)(uint64_t))(v104 + 16);
    while (v37 != v68)
    {
      if (v105)
      {
        if (v51 < 0) {
          goto LABEL_22;
        }
        uint64_t v24 = 0;
        uint64_t v103 = v37;
        while (v24 != v105)
        {
          a21 = v108;
          sub_2396D1ED0();
          sub_2396D1C40();
          uint64_t v104 = v24;
          if (v51)
          {
            uint64_t v69 = 0;
            do
            {
              uint64_t v106 = v69 + 1;
              OUTLINED_FUNCTION_46_20();
              DenseMatrix.subscript.read();
              uint64_t v70 = v51;
              uint64_t v72 = v71;
              v73 = *v92;
              uint64_t v74 = OUTLINED_FUNCTION_52_15();
              v73(v74);
              v72(v108, 0);
              OUTLINED_FUNCTION_46_20();
              DenseMatrix.subscript.read();
              uint64_t v76 = v75;
              uint64_t v77 = OUTLINED_FUNCTION_52_15();
              v73(v77);
              a21 = v108;
              v76(v108, 0);
              sub_2396D0BE0();
              v78 = *v101;
              OUTLINED_FUNCTION_27_4();
              v78();
              OUTLINED_FUNCTION_27_4();
              v78();
              sub_2396D1680();
              OUTLINED_FUNCTION_27_4();
              v78();
              uint64_t v69 = v106;
              uint64_t v51 = v70;
            }
            while (v70 != v106);
          }
          uint64_t v79 = v104;
          uint64_t v50 = v104 + 1;
          type metadata accessor for DenseMatrix();
          uint64_t v37 = v103;
          v80 = DenseMatrix.subscript.modify(v108, v103, v79);
          uint64_t v81 = v102;
          (*v85)(v82, v102, v63);
          ((void (*)(void (**)(void **), void))v80)(v108, 0);
          ((void (*)(uint64_t, void (**)(void **)))*v101)(v81, v63);
          uint64_t v24 = v50;
          if (v50 == v105) {
            goto LABEL_18;
          }
        }
        __break(1u);
        break;
      }
LABEL_18:
      ++v37;
      uint64_t v68 = v84;
      if (v37 == v84) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    swift_once();
  }
LABEL_19:
  OUTLINED_FUNCTION_4_1();
}

void static DenseMatrix<>.* infix(_:_:)()
{
  OUTLINED_FUNCTION_9_72();
  OUTLINED_FUNCTION_32_33(v0, v1, v2, v3, v4);
  if (v5)
  {
    OUTLINED_FUNCTION_15_63();
    sub_2396BB31C(v6, 0.0);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_239666B00();
    }
    OUTLINED_FUNCTION_48_19();
    OUTLINED_FUNCTION_5_106();
    UnsafeMutableMatrixPointer<A>.addProductFloat(_:transposed:_:transposed:scaledBy:)(v7, 0, v8, 1);
    OUTLINED_FUNCTION_51_18();
    OUTLINED_FUNCTION_8_93();
  }
  else
  {
    __break(1u);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_9_72();
  OUTLINED_FUNCTION_40_30(v0, v1, v2, v3, v4, v5);
  if (v6)
  {
    OUTLINED_FUNCTION_12_70();
    sub_2396BB31C(v7, 0.0);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_239666B00();
    }
    OUTLINED_FUNCTION_48_19();
    OUTLINED_FUNCTION_4_98();
    UnsafeMutableMatrixPointer<A>.addProductFloat(_:transposed:_:transposed:scaledBy:)(v8, 1, v9, 0);
    OUTLINED_FUNCTION_50_16();
    OUTLINED_FUNCTION_8_93();
  }
  else
  {
    __break(1u);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_9_72();
  OUTLINED_FUNCTION_32_33(v0, v1, v2, v3, v4);
  if (v5)
  {
    OUTLINED_FUNCTION_15_63();
    sub_23962D7B0(v6, 0.0);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_239666B30();
    }
    OUTLINED_FUNCTION_48_19();
    OUTLINED_FUNCTION_5_106();
    UnsafeMutableMatrixPointer<A>.addProductDouble(_:transposed:_:transposed:scaledBy:)(v7, 0, v8, 1);
    OUTLINED_FUNCTION_51_18();
    OUTLINED_FUNCTION_8_93();
  }
  else
  {
    __break(1u);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_9_72();
  OUTLINED_FUNCTION_40_30(v0, v1, v2, v3, v4, v5);
  if (v6)
  {
    OUTLINED_FUNCTION_12_70();
    sub_23962D7B0(v7, 0.0);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_239666B30();
    }
    OUTLINED_FUNCTION_48_19();
    OUTLINED_FUNCTION_4_98();
    UnsafeMutableMatrixPointer<A>.addProductDouble(_:transposed:_:transposed:scaledBy:)(v8, 1, v9, 0);
    OUTLINED_FUNCTION_50_16();
    OUTLINED_FUNCTION_8_93();
  }
  else
  {
    __break(1u);
  }
}

{
  char v0;
  char v1;
  char v2;

  OUTLINED_FUNCTION_4_102();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    sub_2396BB448();
  }
  OUTLINED_FUNCTION_6_99();
  if (!v0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_13_71();
  if (v1 != v2) {
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_12_73();
  if (v1 ^ v2 | v0)
  {
    OUTLINED_FUNCTION_45_22();
    OUTLINED_FUNCTION_1_98();
    return;
  }
LABEL_10:
  __break(1u);
}

{
  char v0;
  char v1;
  char v2;

  OUTLINED_FUNCTION_36_25();
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    sub_2396BB448();
  }
  OUTLINED_FUNCTION_6_99();
  if (!v0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_13_71();
  if (v1 != v2) {
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_12_73();
  if (v1 ^ v2 | v0)
  {
    OUTLINED_FUNCTION_45_22();
    OUTLINED_FUNCTION_1_98();
    return;
  }
LABEL_10:
  __break(1u);
}

{
  uint64_t v0;
  char v1;
  char v2;
  char v3;

  OUTLINED_FUNCTION_4_102();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    sub_23966F560(v0);
  }
  OUTLINED_FUNCTION_6_99();
  if (!v1)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_13_71();
  if (v2 != v3) {
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_12_73();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_44_28();
    OUTLINED_FUNCTION_1_98();
    return;
  }
LABEL_10:
  __break(1u);
}

{
  uint64_t v0;
  char v1;
  char v2;
  char v3;

  OUTLINED_FUNCTION_36_25();
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    sub_23966F560(v0);
  }
  OUTLINED_FUNCTION_6_99();
  if (!v1)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_13_71();
  if (v2 != v3) {
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_12_73();
  if (v2 ^ v3 | v1)
  {
    OUTLINED_FUNCTION_44_28();
    OUTLINED_FUNCTION_1_98();
    return;
  }
LABEL_10:
  __break(1u);
}

uint64_t sub_2396BB31C(uint64_t result, float a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = result;
    if (result)
    {
      Swift::Int result = sub_2396D0870();
      uint64_t v4 = 0;
      *(void *)(result + 16) = v2;
      do
      {
        uint64_t v5 = result + 4 * v4++;
        *(float *)(v5 + 32) = a2;
      }
      while (v2 != v4);
    }
    else
    {
      return MEMORY[0x263F8EE78];
    }
  }
  return result;
}

void sub_2396BB38C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    OUTLINED_FUNCTION_9_3();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_8_33();
    }
  }
  OUTLINED_FUNCTION_17_19();
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF62CA8);
    uint64_t v10 = (const void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    OUTLINED_FUNCTION_23(v11 - 32);
  }
  uint64_t v12 = (char *)OUTLINED_FUNCTION_19_51();
  if (a1)
  {
    sub_2396C636C(v12, v13, v14);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2396B96F8((uint64_t)v12, v13);
  }
  swift_release();
}

uint64_t OUTLINED_FUNCTION_6_94(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_7_85()
{
  return *(void *)(v0 - 144);
}

uint64_t OUTLINED_FUNCTION_11_72()
{
  return sub_2396D1650();
}

uint64_t *OUTLINED_FUNCTION_16_55(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return &a9;
}

uint64_t OUTLINED_FUNCTION_18_53()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_19_51()
{
  return v0 + 32;
}

uint64_t OUTLINED_FUNCTION_25_53()
{
  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_26_46()
{
  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_32_33(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return a1 * a5;
}

uint64_t OUTLINED_FUNCTION_33_31()
{
  return *(void *)(v0 - 144);
}

uint64_t OUTLINED_FUNCTION_35_29(uint64_t a1)
{
  *(void *)(v1 - 152) = a1;
  return v1 - 152;
}

uint64_t OUTLINED_FUNCTION_40_30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return a2 * a6;
}

void OUTLINED_FUNCTION_42_26()
{
  DenseMatrix.subscript.read();
}

uint64_t OUTLINED_FUNCTION_43_26()
{
  return *(void *)v0;
}

uint64_t OUTLINED_FUNCTION_44_27()
{
  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_45_21()
{
  *(void *)(v1 - 152) = v0 + 1;
  return v1 - 112;
}

uint64_t OUTLINED_FUNCTION_46_20()
{
  return v0 - 152;
}

uint64_t OUTLINED_FUNCTION_47_16(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v4 - 120) = result;
  *(void *)(v4 - 112) = a2;
  *(unsigned char *)(v4 - 104) = a3 & 1;
  *(void *)(v4 - 96) = a4;
  return result;
}

uint64_t OUTLINED_FUNCTION_50_16()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_51_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_52_15()
{
  return v0;
}

uint64_t DenseVector.Iterator.vector.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  void *v1 = a1;
  return result;
}

uint64_t (*DenseVector.Iterator.vector.modify())(void, void)
{
  return nullsub_1;
}

uint64_t DenseVector.Iterator.index.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t DenseVector.Iterator.index.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*DenseVector.Iterator.index.modify())(void, void)
{
  return nullsub_1;
}

uint64_t DenseVector.Iterator.next()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  uint64_t v4 = v2[1];
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  if (v4 >= DenseVector.count.getter())
  {
    return __swift_storeEnumTagSinglePayload(a2, 1, 1, v6);
  }
  else
  {
    DenseVector.subscript.getter(v4, v5, v6, v7);
    uint64_t result = __swift_storeEnumTagSinglePayload(a2, 0, 1, v6);
    uint64_t v9 = v2[1];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      __break(1u);
    }
    else {
      v2[1] = v11;
    }
  }
  return result;
}

uint64_t DenseVector.makeIterator()()
{
  return swift_retain();
}

uint64_t DenseVector._copyContents(initializing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  type metadata accessor for DenseVector();
  swift_getWitnessTable();
  if (sub_2396D0D70())
  {
    swift_retain();
    return v3;
  }
  if (sub_2396D03E0())
  {
    uint64_t v5 = DenseVector.count.getter();
    if (v5 <= a2)
    {
      MEMORY[0x270FA5388](v5);
      type metadata accessor for DenseVector.Iterator();
      swift_getTupleTypeMetadata2();
      DenseVector.withUnsafeVectorPointer<A>(_:)();
      return a3;
    }
    __break(1u);
  }
  uint64_t result = sub_2396D1650();
  __break(1u);
  return result;
}

uint64_t sub_2396BBA70@<X0>(uint64_t a1@<X4>, void *a2@<X8>)
{
  DenseVector.count.getter();
  sub_2396D0F30();
  swift_retain();
  uint64_t v4 = DenseVector.count.getter();
  *a2 = a1;
  a2[1] = v4;
  sub_2396D0FE0();
  DenseVector.count.getter();
  uint64_t result = sub_2396D1000();
  a2[2] = result;
  return result;
}

uint64_t sub_2396BBB50@<X0>(void *a1@<X8>)
{
  return sub_2396BBA70(*(void *)(v1 + 40), a1);
}

uint64_t type metadata accessor for DenseVector.Iterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2396BBB9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = DenseVector.makeIterator()();
  uint64_t v4 = v3;
  uint64_t result = swift_release();
  *a1 = v2;
  a1[1] = v4;
  return result;
}

uint64_t sub_2396BBBE4()
{
  swift_getWitnessTable();

  return sub_2396D0CD0();
}

uint64_t sub_2396BBC38()
{
  swift_getWitnessTable();

  return sub_2396D0D10();
}

uint64_t sub_2396BBC8C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = DenseVector._copyContents(initializing:)(a2, a3, *v3);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  swift_release();
  *a1 = v5;
  a1[1] = v7;
  return v9;
}

uint64_t sub_2396BBCF4()
{
  return DenseVector.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t DenseVector.withContiguousStorageIfAvailable<A>(_:)()
{
  return sub_2396D1340();
}

uint64_t DenseVector.startIndex.getter()
{
  return 0;
}

Swift::Int __swiftcall DenseVector.index(after:)(Swift::Int after)
{
  return after + 1;
}

Swift::Void __swiftcall DenseVector.formIndex(after:)(Swift::Int *after)
{
}

Swift::Int __swiftcall DenseVector.index(before:)(Swift::Int before)
{
  return before - 1;
}

Swift::Void __swiftcall DenseVector.formIndex(before:)(Swift::Int *before)
{
}

Swift::Int __swiftcall DenseVector.index(_:offsetBy:)(Swift::Int _, Swift::Int offsetBy)
{
  return offsetBy + _;
}

Swift::Int_optional __swiftcall DenseVector.index(_:offsetBy:limitedBy:)(Swift::Int _, Swift::Int offsetBy, Swift::Int limitedBy)
{
  Swift::Int v4 = limitedBy - _;
  if (offsetBy < 1)
  {
    if (v4 <= 0 && v4 > offsetBy) {
      goto LABEL_4;
    }
LABEL_10:
    Swift::Bool v6 = 0;
    Swift::Int v5 = offsetBy + _;
    goto LABEL_11;
  }
  if (v4 < 0 || v4 >= (unint64_t)offsetBy) {
    goto LABEL_10;
  }
LABEL_4:
  Swift::Int v5 = 0;
  Swift::Bool v6 = 1;
LABEL_11:
  result.value = v5;
  result.is_nil = v6;
  return result;
}

Swift::Int __swiftcall DenseVector.distance(from:to:)(Swift::Int from, Swift::Int to)
{
  return to - from;
}

uint64_t DenseVector.indices.getter()
{
  return 0;
}

void (*DenseVector.subscript.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  sub_2396D1470();
  v2[4] = sub_2396D14A0();
  return sub_2396BBE5C;
}

void sub_2396BBE5C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t DenseVector.subscript.setter(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = sub_2396D1470();
  sub_2396D13B0();
  uint64_t v8 = *v3;
  sub_239636D6C(a2, *v3);
  uint64_t v12 = *(void *)(v6 - 8);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v12 + 24))(v8+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(void *)(v12 + 72) * a2, a1, v6);
  nullsub_1(v7, v9);
  BOOL v10 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);

  return v10(a1, v6);
}

{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t vars8;

  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = sub_2396D1470();
  sub_2396D13B0();
  uint64_t v8 = *v3;
  sub_239636D6C(a2, *v3);
  OUTLINED_FUNCTION_0_1();
  uint64_t v14 = v9;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 24))(v8+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v10 + 72) * a2, a1, v6);
  nullsub_1(v7, v11);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8);

  return v12(a1, v6);
}

uint64_t DenseVector.subscript.getter()
{
  type metadata accessor for DenseVector();
  swift_retain();
  swift_getWitnessTable();
  sub_2396D1FC0();
  return v1;
}

uint64_t DenseVector.subscript.setter()
{
  return sub_2396D1380();
}

void (*DenseVector.subscript.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(void **a1, char a2)
{
  uint64_t v9 = malloc(0x38uLL);
  *a1 = v9;
  v9[5] = a4;
  v9[6] = v4;
  v9[3] = a2;
  v9[4] = a3;
  *uint64_t v9 = DenseVector.subscript.getter();
  v9[1] = v10;
  v9[2] = v11;
  return sub_2396BC18C;
}

void sub_2396BC18C(void **a1, char a2)
{
  uint64_t v2 = *a1;
  if (a2)
  {
    swift_retain();
    OUTLINED_FUNCTION_1_100();
    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_1_100();
  }

  free(v2);
}

uint64_t DenseVector.withContiguousMutableStorageIfAvailable<A>(_:)()
{
  return sub_2396D1350();
}

uint64_t sub_2396BC270(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  return DenseVector.subscript.setter(a1, *a2, a3);
}

void (*sub_2396BC278(void *a1, uint64_t *a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v7 = malloc(0x38uLL);
  *a1 = v7;
  *uint64_t v7 = v3;
  v7[1] = a3;
  uint64_t v8 = *(void *)(a3 + 16);
  v7[2] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v7[3] = v9;
  size_t v10 = *(void *)(v9 + 64);
  v7[4] = malloc(v10);
  uint64_t v11 = malloc(v10);
  uint64_t v12 = *a2;
  v7[5] = v11;
  v7[6] = v12;
  DenseVector.subscript.getter(v12, *v3, v8, *(void *)(a3 + 24));
  return sub_2396BC368;
}

void sub_2396BC368(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[5];
  unint64_t v4 = (*a1)[6];
  Swift::Int v5 = (void *)(*a1)[4];
  if (a2)
  {
    uint64_t v6 = v2[2];
    uint64_t v7 = v2[3];
    uint64_t v8 = v2[1];
    (*(void (**)(uint64_t, void *, uint64_t))(v7 + 16))((*a1)[4], v3, v6);
    DenseVector.subscript.setter((uint64_t)v5, v4, v8);
    (*(void (**)(void *, uint64_t))(v7 + 8))(v3, v6);
  }
  else
  {
    DenseVector.subscript.setter((*a1)[5], v4, v2[1]);
  }
  free(v3);
  free(v5);

  free(v2);
}

uint64_t sub_2396BC434()
{
  return DenseVector.subscript.setter();
}

void (*sub_2396BC450(void *a1, void *a2, uint64_t a3))(void **a1, char a2)
{
  uint64_t v7 = malloc(0x38uLL);
  *a1 = v7;
  v7[3] = v3;
  v7[4] = a3;
  uint64_t v8 = a2[1];
  v7[5] = *a2;
  v7[6] = v8;
  *uint64_t v7 = DenseVector.subscript.getter();
  v7[1] = v9;
  v7[2] = v10;
  return sub_2396BC4D4;
}

void sub_2396BC4D4(void **a1, char a2)
{
  uint64_t v2 = *a1;
  if (a2)
  {
    swift_retain();
    OUTLINED_FUNCTION_0_56();
    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_0_56();
  }

  free(v2);
}

uint64_t sub_2396BC550()
{
  return sub_2396D0360();
}

uint64_t sub_2396BC5D4()
{
  return sub_2396D0320();
}

uint64_t sub_2396BC5F8()
{
  return DenseVector.withContiguousMutableStorageIfAvailable<A>(_:)();
}

uint64_t sub_2396BC620@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = DenseVector.endIndex.getter(*v2, *(void *)(a1 + 16), *(void *)(a1 + 24));
  *a2 = result;
  return result;
}

void (*sub_2396BC654(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_2396C1988();
  return sub_23941786C;
}

uint64_t sub_2396BC6C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DenseVector.subscript.getter();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_2396BC708@<X0>(void *a1@<X8>)
{
  uint64_t result = DenseVector.indices.getter();
  *a1 = 0;
  a1[1] = v3;
  return result;
}

uint64_t sub_2396BC740()
{
  return DenseVector.count.getter();
}

Swift::Int sub_2396BC75C@<X0>(Swift::Int *a1@<X0>, Swift::Int *a2@<X8>)
{
  Swift::Int result = DenseVector.index(after:)(*a1);
  *a2 = result;
  return result;
}

Swift::Int sub_2396BC78C@<X0>(Swift::Int *a1@<X0>, Swift::Int *a2@<X8>)
{
  Swift::Int result = DenseVector.index(before:)(*a1);
  *a2 = result;
  return result;
}

Swift::Int sub_2396BC7BC@<X0>(Swift::Int *a1@<X0>, Swift::Int a2@<X1>, Swift::Int *a3@<X8>)
{
  Swift::Int result = DenseVector.index(_:offsetBy:)(*a1, a2);
  *a3 = result;
  return result;
}

Swift::Int sub_2396BC7E8@<X0>(Swift::Int *a1@<X0>, Swift::Int a2@<X1>, Swift::Int *a3@<X2>, uint64_t a4@<X8>)
{
  Swift::Int_optional v6 = DenseVector.index(_:offsetBy:limitedBy:)(*a1, a2, *a3);
  *(void *)a4 = v6.value;
  *(unsigned char *)(a4 + 8) = v6.is_nil;
  return v6.value;
}

Swift::Int sub_2396BC820(Swift::Int *a1, Swift::Int *a2)
{
  return DenseVector.distance(from:to:)(*a1, *a2);
}

uint64_t sub_2396BC82C()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396BC848()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396BC864()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396BC8C8()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396BC8E4()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396BC948()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396BC964()
{
  return swift_getWitnessTable();
}

void *sub_2396BC9C8(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_2396BC9F8()
{
  return swift_release();
}

void *sub_2396BCA00(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  return a1;
}

void *sub_2396BCA50(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_100()
{
  return DenseVector.subscript.setter();
}

uint64_t UnsafeMutableMatrixPointer.baseAddress.getter()
{
  return *(void *)v0;
}

uint64_t UnsafeMutableMatrixPointer.baseAddress.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*UnsafeMutableMatrixPointer.baseAddress.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeMutableMatrixPointer.rowCount.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t UnsafeMutableMatrixPointer.rowCount.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*UnsafeMutableMatrixPointer.rowCount.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeMutableMatrixPointer.columnCount.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t UnsafeMutableMatrixPointer.columnCount.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*UnsafeMutableMatrixPointer.columnCount.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeMutableMatrixPointer.leadingDimension.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t UnsafeMutableMatrixPointer.leadingDimension.setter(uint64_t result)
{
  *(void *)(v1 + 24) = result;
  return result;
}

uint64_t (*UnsafeMutableMatrixPointer.leadingDimension.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeMutableMatrixPointer.layout.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t UnsafeMutableMatrixPointer.layout.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 32) = result & 1;
  return result;
}

uint64_t (*UnsafeMutableMatrixPointer.layout.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeMutableMatrixPointer.count.getter()
{
  if (*(unsigned char *)(v0 + 32))
  {
    uint64_t v2 = *(void *)(v0 + 16);
    uint64_t v1 = *(void *)(v0 + 24);
    uint64_t result = v1 * v2;
    if ((unsigned __int128)(v1 * (__int128)v2) >> 64 == (v1 * v2) >> 63) {
      return result;
    }
    __break(1u);
  }
  uint64_t v4 = *(void *)(v0 + 8);
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t result = v4 * v5;
  if ((unsigned __int128)(v4 * (__int128)v5) >> 64 != (v4 * v5) >> 63) {
    __break(1u);
  }
  return result;
}

uint64_t UnsafeMutableMatrixPointer.accelerateMatrixOrder.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t UnsafeMutableMatrixPointer.init(start:rowCount:columnCount:leadingDimension:layout:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(unsigned char *)(a6 + 32) = a5 & 1;
  return result;
}

__n128 UnsafeMutableMatrixPointer.init(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  *(unsigned char *)(a2 + 32) = *(unsigned char *)(a1 + 32);
  return result;
}

__n128 UnsafeMutableMatrixPointer.init(mutating:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 24);
  char v3 = *(unsigned char *)(a1 + 32);
  *(void *)a2 = *(void *)a1;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  *(void *)(a2 + 24) = v2;
  *(unsigned char *)(a2 + 32) = v3;
  return result;
}

uint64_t UnsafeMutableMatrixPointer.withUnsafeBufferPointer<A>(_:)(uint64_t (*a1)(uint64_t))
{
  UnsafeMutableMatrixPointer.count.getter();
  uint64_t v2 = sub_2396D03F0();
  return a1(v2);
}

uint64_t UnsafeMutableMatrixPointer.withUnsafeMutableBufferPointer<A>(_:)(uint64_t (*a1)(void *))
{
  uint64_t v4 = *v1;
  UnsafeMutableMatrixPointer.count.getter();
  v8[0] = sub_2396D1010();
  v8[1] = v5;
  uint64_t result = a1(v8);
  if (!v2)
  {
    uint64_t result = sub_2396D03E0();
    if (result) {
      BOOL v7 = v4 == result;
    }
    else {
      BOOL v7 = 0;
    }
    if (!v7)
    {
      uint64_t result = sub_2396D1650();
      __break(1u);
    }
  }
  return result;
}

Swift::Void __swiftcall UnsafeMutableMatrixPointer.deallocate()()
{
  MEMORY[0x270F9D588](*v1, *(void *)(v0 + 16));
}

uint64_t static UnsafeMutableMatrixPointer.allocate(rowCount:columnCount:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = a1 * a2;
  if ((unsigned __int128)(a1 * (__int128)a2) >> 64 == result >> 63)
  {
    uint64_t result = sub_2396D0F70();
    *(void *)a3 = result;
    *(void *)(a3 + 8) = a1;
    *(void *)(a3 + 16) = a2;
    *(void *)(a3 + 24) = a2;
    *(unsigned char *)(a3 + 32) = 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void UnsafeMutableMatrixPointer.initialize(repeating:)(uint64_t a1, uint64_t a2)
{
}

void UnsafeMutableMatrixPointer.update(repeating:)(uint64_t a1, uint64_t a2)
{
}

void sub_2396BCE50(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  if (*(unsigned char *)(v3 + 32))
  {
    uint64_t v5 = *(void *)(v3 + 16);
    if (v5 < 0)
    {
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    if (v5)
    {
      unint64_t v6 = *(void *)(v3 + 24);
      while (is_mul_ok(0, v6))
      {
        OUTLINED_FUNCTION_1_101();
        sub_2396D1010();
        uint64_t v7 = OUTLINED_FUNCTION_0_57();
        a3(v7);
      }
      __break(1u);
LABEL_14:
      __break(1u);
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v8 = *(void *)(v3 + 8);
    if (v8 < 0)
    {
LABEL_16:
      __break(1u);
      return;
    }
    if (v8)
    {
      unint64_t v9 = *(void *)(v3 + 24);
      while (is_mul_ok(0, v9))
      {
        OUTLINED_FUNCTION_1_101();
        sub_2396D1010();
        uint64_t v10 = OUTLINED_FUNCTION_0_57();
        a3(v10);
      }
      goto LABEL_14;
    }
  }
}

uint64_t UnsafeMutableMatrixPointer.subscript.getter@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = *v4;
  uint64_t v6 = v4[3];
  if (v4[4])
  {
    uint64_t v7 = a2 * v6;
    if ((unsigned __int128)(a2 * (__int128)v6) >> 64 != (a2 * v6) >> 63)
    {
      __break(1u);
      goto LABEL_10;
    }
    uint64_t v6 = v7 + result;
    if (!__OFADD__(v7, result)) {
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a4, v5 + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 72) * v6);
    }
    __break(1u);
  }
  uint64_t v8 = result * v6;
  if ((unsigned __int128)(result * (__int128)v6) >> 64 != (result * v6) >> 63)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v6 = v8 + a2;
  if (!__OFADD__(v8, a2)) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a4, v5 + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 72) * v6);
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t (*UnsafeMutableMatrixPointer.subscript.modify(uint64_t a1, uint64_t a2, uint64_t a3))(void, void)
{
  uint64_t v4 = *(void *)(v3 + 24);
  if (*(unsigned char *)(v3 + 32))
  {
    uint64_t v5 = a3 * v4;
    if ((unsigned __int128)(a3 * (__int128)v4) >> 64 != (a3 * v4) >> 63)
    {
      __break(1u);
      goto LABEL_10;
    }
    uint64_t v4 = v5 + a2;
    if (!__OFADD__(v5, a2)) {
      return nullsub_1;
    }
    __break(1u);
  }
  if ((unsigned __int128)(a2 * (__int128)v4) >> 64 != (a2 * v4) >> 63)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (!__OFADD__(a2 * v4, a3)) {
    return nullsub_1;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t UnsafeMutableMatrixPointer.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void (*)(unsigned char *, void))UnsafeMutableMatrixPointer.subscript.modify((uint64_t)v11, a2, a3);
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v9, a1, v7);
  v6(v11, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
}

void UnsafeMutableMatrixPointer.subscript.getter(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(v2 + 32))
  {
    uint64_t v3 = *(void *)(a2 + 16);
    uint64_t v4 = *(void *)v2 + *(void *)(*(void *)(v3 - 8) + 72) * a1;
    uint64_t v5 = *(void *)(v2 + 16);
    uint64_t v6 = *(void *)(v2 + 24);
  }
  else
  {
    OUTLINED_FUNCTION_1_96();
    if (!v7)
    {
      __break(1u);
      return;
    }
    OUTLINED_FUNCTION_0_2();
    uint64_t v4 = v10 + *(void *)(v8 + 72) * v9;
    uint64_t v5 = *(void *)(v2 + 16);
    uint64_t v6 = 1;
  }
  UnsafeMutableVectorPointer.init(start:count:stride:)(v4, v5, v6, v3);
}

{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(unsigned char *)(v2 + 32))
  {
    OUTLINED_FUNCTION_1_96();
    if (!v3)
    {
      __break(1u);
      return;
    }
    OUTLINED_FUNCTION_0_2();
    uint64_t v8 = v7 + *(void *)(v5 + 72) * v6;
    uint64_t v9 = *(void *)(v2 + 8);
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v4 = *(void *)(a2 + 16);
    uint64_t v9 = *(void *)(v2 + 8);
    uint64_t v8 = *(void *)v2 + *(void *)(*(void *)(v4 - 8) + 72) * a1;
    uint64_t v10 = *(void *)(v2 + 24);
  }
  UnsafeMutableVectorPointer.init(start:count:stride:)(v8, v9, v10, v4);
}

uint64_t sub_2396BD224(uint64_t (*a1)(void *))
{
  return UnsafeMutableMatrixPointer.withUnsafeMutableBufferPointer<A>(_:)(a1);
}

uint64_t sub_2396BD268(uint64_t (*a1)(uint64_t))
{
  return UnsafeMutableMatrixPointer.withUnsafeBufferPointer<A>(_:)(a1);
}

uint64_t UnsafeMutableMatrixPointer.debugDescription.getter()
{
  return 0;
}

uint64_t sub_2396BD428()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for UnsafeMutableMatrixPointer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t DenseMatrix.Transpose.rowCount.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t DenseMatrix.Transpose.layout.getter(uint64_t a1, uint64_t a2, char a3)
{
  return a3 & 1;
}

void (*DenseMatrix.Transpose.subscript.modify(void (***a1)(void **a1), uint64_t a2, uint64_t a3))(uint64_t a1)
{
  uint64_t v6 = (void (**)(void **))malloc(0x28uLL);
  *a1 = v6;
  type metadata accessor for DenseMatrix();
  v6[4] = DenseMatrix.subscript.modify(v6, a3, a2);
  return sub_2396BD514;
}

void sub_2396BD514(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_7_86(a1);
  v3(v2);

  free(v1);
}

void (*DenseMatrix.Transpose.subscript.read(void *a1))(uint64_t a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  DenseMatrix.subscript.read();
  v2[4] = v3;
  return sub_2396BD608;
}

void sub_2396BD608(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_7_86(a1);
  v3(v2);

  free(v1);
}

uint64_t DenseMatrix.Transpose.base.getter()
{
  return OUTLINED_FUNCTION_1_98();
}

uint64_t DenseMatrix.Transpose.base.setter(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  char v8 = a3 & 1;
  uint64_t result = swift_release();
  *(void *)uint64_t v4 = a1;
  *(void *)(v4 + 8) = a2;
  *(unsigned char *)(v4 + 16) = v8;
  *(void *)(v4 + 24) = a4;
  return result;
}

uint64_t (*DenseMatrix.Transpose.base.modify())(void, void)
{
  return nullsub_1;
}

uint64_t DenseMatrix.Transpose.count.getter(uint64_t a1, uint64_t a2)
{
  return DenseMatrix.count.getter(a1, a2);
}

uint64_t DenseMatrix.Transpose.init(rowCount:columnCount:)(uint64_t a1, uint64_t a2)
{
  return DenseMatrix.init(rowCount:columnCount:)(a2, a1);
}

uint64_t DenseMatrix.Transpose.subscript.getter@<X0>(uint64_t a1@<X6>, uint64_t a2@<X8>)
{
  DenseMatrix.subscript.read();
  uint64_t v5 = v4;
  (*(void (**)(uint64_t))(*(void *)(a1 - 8) + 16))(a2);
  return v5(v7, 0);
}

uint64_t DenseMatrix.Transpose.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  type metadata accessor for DenseMatrix();
  char v8 = DenseMatrix.subscript.modify(v12, a3, a2);
  uint64_t v9 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(v10, a1, v7);
  ((void (*)(void (**)(void **), void))v8)(v12, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v7);
}

uint64_t DenseMatrix.Transpose.transposed()()
{
  return OUTLINED_FUNCTION_1_98();
}

uint64_t static DenseMatrix.Transpose.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  return static DenseMatrix.__derived_struct_equals(_:_:)(a1, a2, a3 & 1, a4, a5, a6, a7 & 1);
}

uint64_t sub_2396BD8E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = DenseMatrix.Transpose.init(rowCount:columnCount:)(a1, a2);
  *(void *)a3 = result;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = v6 & 1;
  *(void *)(a3 + 24) = v7;
  return result;
}

uint64_t sub_2396BD920@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = DenseMatrix.Transpose.transposed()();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_2396BD960@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  char v4 = DenseMatrix.Transpose.subscript.read(v6);
  (*(void (**)(uint64_t))(*(void *)(v3 - 8) + 16))(a2);
  return ((uint64_t (*)(void *, void))v4)(v6, 0);
}

uint64_t sub_2396BDA08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v6 = DenseMatrix.Transpose.subscript.modify(v11, a2, a3);
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v9, a1, v7);
  ((void (*)(void (***)(void **), void))v6)(v11, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
}

void (*sub_2396BDAD0(void (****a1)(void **a1), uint64_t a2, uint64_t a3))(void *a1)
{
  char v6 = (void (***)(void **))malloc(0x28uLL);
  *a1 = v6;
  void v6[4] = (void (**)(void **))DenseMatrix.Transpose.subscript.modify(v6, a2, a3);
  return sub_2394122B8;
}

uint64_t sub_2396BDB48(uint64_t a1, uint64_t a2)
{
  return static DenseMatrix.Transpose.__derived_struct_equals(_:_:)(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)(a1 + 24), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16)) & 1;
}

void static DenseMatrix.Transpose.+= infix(_:_:)()
{
  static DenseMatrix.+= infix(_:_:)();
}

uint64_t static DenseMatrix.Transpose.+ infix(_:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_2396BDC20(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (uint64_t (*)(uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, void))static DenseMatrix.+ infix(_:_:));
}

void static DenseMatrix.Transpose.-= infix(_:_:)()
{
  static DenseMatrix.-= infix(_:_:)();
}

uint64_t static DenseMatrix.Transpose.- infix(_:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_2396BDC20(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (uint64_t (*)(uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, void))static DenseMatrix.- infix(_:_:));
}

uint64_t sub_2396BDC20(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, void))
{
  return a11(a1, a2, a3 & 1, a4, a5, a6, a7 & 1);
}

uint64_t static DenseMatrix.Transpose.* infix(_:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_2396BDCB0(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(uint64_t, uint64_t, void))static DenseMatrix.* infix(_:_:));
}

uint64_t static DenseMatrix.Transpose.* infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return static DenseMatrix.* infix(_:_:)(a1, a2);
}

uint64_t static DenseMatrix.Transpose./ infix(_:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_2396BDCB0(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(uint64_t, uint64_t, void))static DenseMatrix./ infix(_:_:));
}

uint64_t sub_2396BDCB0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t, uint64_t, void))
{
  return a8(a1, a2, a3 & 1);
}

#error "2396BDD10: call analysis failed (funcsize=37)"

uint64_t static DenseMatrix.Transpose.* infix(_:_:)(void (**a1)(void), uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  LODWORD(v76) = a3;
  uint64_t v74 = a2;
  OUTLINED_FUNCTION_0_58();
  uint64_t v77 = v14;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_2_51();
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (void (*)(uint64_t))((char *)v65 - v17);
  MEMORY[0x270FA5388](v19);
  v73 = (char *)v65 - v20;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_1_102(v22, v23, v24, v25, v26, v27, v28);
  v65[6] = v29;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v31 = OUTLINED_FUNCTION_9_73(AssociatedTypeWitness);
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_16_56(v32, v65[0]);
  uint64_t v67 = a6;
  if ((void (**)(void))DenseVector.count.getter() == a1)
  {
    v65[1] = v7;
    uint64_t v70 = a4;
    if (qword_2689D4D08 != -1) {
      goto LABEL_21;
    }
    while (1)
    {
      uint64_t v33 = sub_2396CFD30();
      __swift_project_value_buffer(v33, (uint64_t)static Logger.linearAlgebra);
      uint64_t v34 = sub_2396CFD10();
      os_log_type_t v35 = sub_2396D0E30();
      BOOL v36 = os_log_type_enabled(v34, v35);
      uint64_t v69 = a1;
      v65[0] = (uint64_t)v18;
      char v66 = v8;
      if (v36)
      {
        uint64_t v37 = (uint8_t *)swift_slowAlloc();
        v78[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v37 = 136315138;
        uint64_t v38 = v67;
        uint64_t v39 = sub_2396D2130();
        uint64_t v41 = sub_2395580BC(v39, v40, v78);
        OUTLINED_FUNCTION_12_71(v41);
        sub_2396D1050();
        uint64_t v8 = v66;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2393EB000, v34, v35, "Using a slow implementation of matrix multiplication for %s. Prefer using Float or Double.", v37, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3_43();
        OUTLINED_FUNCTION_3_43();
      }
      else
      {

        uint64_t v38 = v67;
      }
      uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      OUTLINED_FUNCTION_15_64((uint64_t)&unk_2396DEEB0, v43, v44, AssociatedConformanceWitness);
      sub_2396D1C40();
      uint64_t v45 = v74;
      uint64_t result = DenseVector.init(repeating:count:)((uint64_t)v8, v74, v38);
      uint64_t v79 = result;
      if (v45 < 0) {
        break;
      }
      if (!v45) {
        return result;
      }
      uint64_t v18 = (void (*)(uint64_t))(v76 & 1);
      uint64_t v8 = (void (**)(uint64_t))(v77 + 16);
      a1 = (void (**)(void))(v77 + 8);
      OUTLINED_FUNCTION_10_84();
      uint64_t v48 = v73;
      uint64_t v75 = a5;
      uint64_t v76 = v8;
      int v68 = (int)v18;
      uint64_t v72 = a7;
      while (v47 != v45)
      {
        uint64_t v77 = v47;
        OUTLINED_FUNCTION_14_69();
        sub_2396D1C40();
        uint64_t v49 = a7;
        uint64_t v50 = DenseVector.count.getter();
        if (v50 < 0) {
          goto LABEL_20;
        }
        if (v50)
        {
          uint64_t v51 = 0;
          uint64_t v52 = v65[0];
          uint64_t v53 = v67;
          uint64_t v71 = v50;
          do
          {
            os_log_type_t v54 = a1;
            uint64_t v55 = v72;
            DenseMatrix.subscript.read();
            uint64_t v57 = v56;
            uint64_t v18 = *v76;
            (*v76)(v52);
            uint64_t v58 = OUTLINED_FUNCTION_4_99();
            v57(v58);
            uint64_t v59 = v55;
            a1 = v54;
            DenseVector.subscript.getter(v51, v75, v53, v59);
            sub_2396D0BE0();
            uint64_t v60 = *v54;
            OUTLINED_FUNCTION_6_95();
            v60();
            OUTLINED_FUNCTION_6_95();
            v60();
            sub_2396D1680();
            OUTLINED_FUNCTION_6_95();
            v60();
            uint64_t v61 = v77;
            ++v51;
          }
          while (v71 != v51);
          uint64_t v49 = v72;
          uint64_t v48 = v73;
          uint64_t v45 = v74;
        }
        else
        {
          uint64_t v18 = *v8;
          uint64_t v61 = v77;
        }
        uint64_t v62 = v61 + 1;
        uint64_t v63 = v67;
        ((void (*)(void (**)(uint64_t), char *, uint64_t))v18)(v66, v48, v67);
        a7 = v49;
        uint64_t v64 = type metadata accessor for DenseVector();
        OUTLINED_FUNCTION_11_73(v64);
        ((void (*)(char *, uint64_t))*a1)(v48, v63);
        uint64_t v47 = v62;
        a5 = v75;
        uint64_t v8 = v76;
        if (v62 == v45) {
          return v79;
        }
      }
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      swift_once();
    }
    __break(1u);
  }
  uint64_t result = sub_2396D1650();
  __break(1u);
  return result;
}

uint64_t static DenseMatrix.Transpose.* infix(_:_:)(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  LODWORD(v84) = a4;
  uint64_t v82 = a2;
  OUTLINED_FUNCTION_0_58();
  uint64_t v86 = v14;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_2_51();
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v73 - v17;
  MEMORY[0x270FA5388](v19);
  v85 = (char *)&v73 - v20;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_1_102(v22, v23, v24, v25, v26, v27, v28);
  uint64_t v75 = v29;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v31 = OUTLINED_FUNCTION_9_73(AssociatedTypeWitness);
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_16_56(v32, (uint64_t)v73);
  uint64_t v33 = a1;
  uint64_t v87 = a6;
  if (DenseVector.count.getter() == a3)
  {
    v73 = v18;
    uint64_t v74 = v7;
    uint64_t v80 = a5;
    uint64_t v34 = a7;
    if (qword_2689D4D08 != -1) {
      goto LABEL_21;
    }
    while (1)
    {
      uint64_t v35 = sub_2396CFD30();
      __swift_project_value_buffer(v35, (uint64_t)static Logger.linearAlgebra);
      BOOL v36 = sub_2396CFD10();
      os_log_type_t v37 = sub_2396D0E30();
      BOOL v38 = os_log_type_enabled(v36, v37);
      uint64_t v79 = a3;
      uint64_t v77 = v8;
      if (v38)
      {
        uint64_t v39 = (uint8_t *)swift_slowAlloc();
        v88[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v39 = 136315138;
        uint64_t v40 = v87;
        uint64_t v41 = sub_2396D2130();
        uint64_t v43 = sub_2395580BC(v41, v42, v88);
        OUTLINED_FUNCTION_12_71(v43);
        sub_2396D1050();
        uint64_t v8 = v77;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2393EB000, v36, v37, "Using a slow implementation of matrix multiplication for %s. Prefer using Float or Double.", v39, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3_43();
        OUTLINED_FUNCTION_3_43();

        uint64_t v44 = v33;
      }
      else
      {

        uint64_t v44 = v33;
        uint64_t v40 = v87;
      }
      uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      OUTLINED_FUNCTION_15_64((uint64_t)&unk_2396DEEB0, v46, v47, AssociatedConformanceWitness);
      sub_2396D1C40();
      uint64_t v48 = v82;
      uint64_t result = DenseVector.init(repeating:count:)((uint64_t)v8, v82, v40);
      uint64_t v89 = result;
      if (v48 < 0) {
        break;
      }
      if (!v48) {
        return result;
      }
      a3 = v34;
      uint64_t v33 = (void (*)(uint64_t))(v84 & 1);
      uint64_t v8 = (void (**)(uint64_t))(v86 + 16);
      uint64_t v50 = (void (**)(void))(v86 + 8);
      OUTLINED_FUNCTION_10_84();
      uint64_t v83 = v44;
      uint64_t v84 = v8;
      uint64_t v34 = v87;
      int v78 = (int)v33;
      uint64_t v81 = a3;
      uint64_t v76 = v50;
      while (v51 != v48)
      {
        uint64_t v52 = v48;
        uint64_t v86 = v51;
        OUTLINED_FUNCTION_14_69();
        uint64_t v53 = v85;
        sub_2396D1C40();
        uint64_t v54 = a3;
        uint64_t v55 = DenseVector.count.getter();
        if (v55 < 0) {
          goto LABEL_20;
        }
        if (v55)
        {
          uint64_t v56 = 0;
          uint64_t v57 = v74;
          uint64_t v58 = v76;
          do
          {
            uint64_t v59 = v56 + 1;
            uint64_t v60 = v55;
            DenseVector.subscript.getter(v56, v83, v34, v81);
            DenseMatrix.subscript.read();
            uint64_t v62 = v61;
            uint64_t v33 = *v84;
            (*v84)(v57);
            uint64_t v63 = OUTLINED_FUNCTION_4_99();
            v62(v63);
            sub_2396D0BE0();
            uint64_t v64 = *v58;
            OUTLINED_FUNCTION_54();
            v64(v65);
            OUTLINED_FUNCTION_54();
            v64(v66);
            uint64_t v34 = v87;
            sub_2396D1680();
            OUTLINED_FUNCTION_54();
            v64(v67);
            uint64_t v55 = v60;
            uint64_t v56 = v59;
          }
          while (v60 != v59);
          uint64_t v54 = v81;
          uint64_t v52 = v82;
          uint64_t v53 = v85;
        }
        else
        {
          uint64_t v33 = *v8;
        }
        uint64_t v68 = v86;
        uint64_t v69 = v86 + 1;
        ((void (*)(void (**)(uint64_t), char *, uint64_t))v33)(v77, v53, v34);
        a3 = v54;
        uint64_t v70 = type metadata accessor for DenseVector();
        OUTLINED_FUNCTION_11_73(v70);
        OUTLINED_FUNCTION_54();
        v72(v71);
        uint64_t v51 = v68 + 1;
        uint64_t v8 = v84;
        uint64_t v48 = v52;
        if (v69 == v52) {
          return v89;
        }
      }
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      swift_once();
    }
    __break(1u);
  }
  uint64_t result = sub_2396D1650();
  __break(1u);
  return result;
}

uint64_t static DenseMatrix.Transpose<>.* infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  return sub_2396BE924(a1, a2, a3, a4, a5, a6, a7);
}

{
  return sub_2396BE924(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t static DenseMatrix.Transpose<>.* infix(_:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  return sub_2396BE978(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2396C1AE8);
}

{
  return sub_2396BE978(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2396C1CD8);
}

uint64_t static DenseMatrix.Transpose<>.* infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  return sub_2396BEA10(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2396C1B64);
}

{
  return sub_2396BEA10(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2396C1D54);
}

uint64_t sub_2396BE924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7 = OUTLINED_FUNCTION_2_112(a1, a2, a7 & 1, a4, a5);
  return v8(v7);
}

uint64_t sub_2396BE978(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v11 = a3 & 1;
  swift_retain();
  swift_retain();
  return a6(a2, a5, a1, a2, v11, a4);
}

uint64_t sub_2396BEA10(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v11 = a4 & 1;
  swift_retain();
  swift_retain();
  return a6(a2, a1, a2, a3, v11, a5);
}

uint64_t sub_2396BEA8C()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396BEAA8()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for DenseMatrix.Transpose()
{
  return __swift_instantiateGenericMetadata();
}

void OUTLINED_FUNCTION_1_102(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 - 208) = *(void *)(*(void *)(*(void *)(a7 + 16) + 16) + 8);
}

uint64_t OUTLINED_FUNCTION_7_86(uint64_t a1)
{
  return *(void *)a1;
}

void OUTLINED_FUNCTION_10_84()
{
  *(void *)(v1 - 272) = v0 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
}

uint64_t OUTLINED_FUNCTION_11_73(uint64_t a1)
{
  return DenseVector.subscript.setter(v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_12_71(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_14_69()
{
  return sub_2396D1ED0();
}

uint64_t OUTLINED_FUNCTION_15_64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 - 264) = a4;
  return sub_2396D1ED0();
}

void OUTLINED_FUNCTION_16_56(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 256) = (char *)&a2 - a1;
}

void UnsafeMutableVectorPointer.initialize(repeating:)()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  OUTLINED_FUNCTION_0_1();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_10_2();
  if (v14)
  {
    BOOL v15 = v6 >= 0;
    if (v4 > 0) {
      BOOL v15 = v6 < 1;
    }
    if (!v15)
    {
      int64_t v16 = 0;
      uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
      uint64_t v17 = *(void *)(v12 + 72);
      do
      {
        if (__OFADD__(v16, v4)) {
          int64_t v18 = ((v16 + v4) >> 63) ^ 0x8000000000000000;
        }
        else {
          int64_t v18 = v16 + v4;
        }
        uint64_t v19 = v8 + v17 * v16;
        v21(v0, v10, v2);
        sub_2396B8A68(v0, v19, v2);
        BOOL v20 = v18 >= v6;
        if (v4 <= 0) {
          BOOL v20 = v18 <= v6;
        }
        int64_t v16 = v18;
      }
      while (!v20);
    }
    OUTLINED_FUNCTION_4_1();
  }
  else
  {
    __break(1u);
  }
}

uint64_t UnsafeMutableVectorPointer.baseAddress.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*UnsafeMutableVectorPointer.baseAddress.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeMutableVectorPointer.count.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t UnsafeMutableVectorPointer.count.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*UnsafeMutableVectorPointer.count.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeMutableVectorPointer.stride.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t UnsafeMutableVectorPointer.stride.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*UnsafeMutableVectorPointer.stride.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UnsafeMutableVectorPointer.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2396BED9C(a1, a2, a3, MEMORY[0x263F8D900]);
}

uint64_t UnsafeMutableVectorPointer.init(mutating:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2396BED9C(a1, a2, a3, MEMORY[0x263F8D228]);
}

uint64_t sub_2396BED9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result = a4();
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t UnsafeMutableVectorPointer.makeIterator()(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((unsigned __int128)(a2 * (__int128)a3) >> 64 == (a2 * a3) >> 63) {
    return UnsafeVectorPointer.Iterator.init(baseAddress:end:stride:)(result, result + *(void *)(*(void *)(a4 - 8) + 72) * a2 * a3);
  }
  __break(1u);
  return result;
}

void UnsafeMutableVectorPointer._copyContents(initializing:)()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v30 = v10;
  OUTLINED_FUNCTION_0_1();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  BOOL v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2396D0FA0();
  MEMORY[0x270FA5388](v16 - 8);
  int64_t v18 = (char *)v27 - v17;
  uint64_t v31 = v7;
  uint64_t v32 = v5;
  uint64_t v33 = v3;
  type metadata accessor for UnsafeMutableVectorPointer();
  swift_getWitnessTable();
  if (sub_2396D0D70())
  {
    UnsafeMutableVectorPointer.makeIterator()(v7, v5, v3, v1);
    sub_2396D0FE0();
LABEL_13:
    OUTLINED_FUNCTION_4_1();
    return;
  }
  uint64_t v28 = v7;
  uint64_t v29 = v5;
  uint64_t v19 = sub_2396D03E0();
  if (v19)
  {
    uint64_t v20 = v29;
    if (v9 < v29)
    {
      __break(1u);
    }
    else
    {
      uint64_t v21 = v19;
      if (v3 == 1)
      {
        uint64_t v22 = v28;
        sub_2396D0F30();
      }
      else
      {
        v27[1] = v9;
        uint64_t v31 = UnsafeMutableVectorPointer.makeIterator()(v28, v29, v3, v1);
        uint64_t v32 = v23;
        uint64_t v33 = v24;
        uint64_t v25 = type metadata accessor for UnsafeVectorPointer.Iterator();
        UnsafeVectorPointer.Iterator.next()(v25, (uint64_t)v18);
        if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v1) != 1)
        {
          uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
          do
          {
            v26(v15, v18, v1);
            sub_2396B8A68((uint64_t)v15, v21, v1);
            v21 += *(void *)(v12 + 72);
            UnsafeVectorPointer.Iterator.next()(v25, (uint64_t)v18);
          }
          while (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v1) != 1);
        }
        uint64_t v22 = v28;
        uint64_t v20 = v29;
      }
      if ((unsigned __int128)(v20 * (__int128)v3) >> 64 == (v20 * v3) >> 63)
      {
        UnsafeVectorPointer.Iterator.init(baseAddress:end:stride:)(v22 + *(void *)(v12 + 72) * v20 * v3, v22 + *(void *)(v12 + 72) * v20 * v3);
        sub_2396D0FE0();
        sub_2396D1000();
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  sub_2396D1650();
  __break(1u);
}

uint64_t type metadata accessor for UnsafeMutableVectorPointer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2396BF148@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = UnsafeMutableVectorPointer.makeIterator()(*v2, v2[1], v2[2], *(void *)(a1 + 16));
  *a2 = result;
  a2[1] = v5;
  a2[2] = v6;
  return result;
}

uint64_t sub_2396BF184()
{
  swift_getWitnessTable();

  return sub_2396D0CD0();
}

uint64_t sub_2396BF1D8()
{
  return sub_2396D0D10();
}

uint64_t sub_2396BF23C(void *a1)
{
  UnsafeMutableVectorPointer._copyContents(initializing:)();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  return v5;
}

uint64_t sub_2396BF288@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return UnsafeMutableVectorPointer.withContiguousStorageIfAvailable<A>(_:)(a1, *(void *)(v3 + 16), a2, a3);
}

uint64_t UnsafeMutableVectorPointer.withContiguousStorageIfAvailable<A>(_:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X4>, uint64_t a3@<X6>, uint64_t a4@<X8>)
{
  if (a2 == 1)
  {
    uint64_t v8 = sub_2396D03F0();
    uint64_t result = a1(v8);
    if (v4) {
      return result;
    }
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a4, v10, 1, a3);
}

uint64_t UnsafeMutableVectorPointer.startIndex.getter()
{
  return 0;
}

uint64_t UnsafeMutableVectorPointer.endIndex.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

Swift::Int __swiftcall UnsafeMutableVectorPointer.index(after:)(Swift::Int after)
{
  return after + 1;
}

Swift::Void __swiftcall UnsafeMutableVectorPointer.formIndex(after:)(Swift::Int *after)
{
}

Swift::Int __swiftcall UnsafeMutableVectorPointer.index(before:)(Swift::Int before)
{
  return before - 1;
}

Swift::Void __swiftcall UnsafeMutableVectorPointer.formIndex(before:)(Swift::Int *before)
{
}

Swift::Int __swiftcall UnsafeMutableVectorPointer.index(_:offsetBy:)(Swift::Int _, Swift::Int offsetBy)
{
  return offsetBy + _;
}

Swift::Int_optional __swiftcall UnsafeMutableVectorPointer.index(_:offsetBy:limitedBy:)(Swift::Int _, Swift::Int offsetBy, Swift::Int limitedBy)
{
  Swift::Int v4 = limitedBy - _;
  if (offsetBy < 1)
  {
    if (v4 <= 0 && v4 > offsetBy) {
      goto LABEL_4;
    }
LABEL_10:
    Swift::Bool v6 = 0;
    Swift::Int v5 = offsetBy + _;
    goto LABEL_11;
  }
  if (v4 < 0 || v4 >= (unint64_t)offsetBy) {
    goto LABEL_10;
  }
LABEL_4:
  Swift::Int v5 = 0;
  Swift::Bool v6 = 1;
LABEL_11:
  result.value = v5;
  result.is_nil = v6;
  return result;
}

Swift::Int __swiftcall UnsafeMutableVectorPointer.distance(from:to:)(Swift::Int from, Swift::Int to)
{
  return to - from;
}

uint64_t UnsafeMutableVectorPointer.indices.getter()
{
  return 0;
}

uint64_t (*UnsafeMutableVectorPointer.subscript.modify(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(void, void)
{
  if ((unsigned __int128)(a2 * (__int128)a5) >> 64 == (a2 * a5) >> 63) {
    return nullsub_1;
  }
  __break(1u);
  return result;
}

{
  uint64_t (*result)(void, void);

  if ((unsigned __int128)(a2 * (__int128)a5) >> 64 == (a2 * a5) >> 63) {
    return nullsub_1;
  }
  __break(1u);
  return result;
}

uint64_t _s13LinearAlgebra26UnsafeMutableVectorPointerVyxSicis_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if ((unsigned __int128)(a2 * (__int128)a5) >> 64 == (a2 * a5) >> 63) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a6 - 8) + 40))(a3 + *(void *)(*(void *)(a6 - 8) + 72) * a2 * a5, result, a6);
  }
  __break(1u);
  return result;
}

double UnsafeMutableVectorPointer.subscript.getter@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for UnsafeMutableVectorPointer();
  swift_getWitnessTable();
  sub_2396D1FC0();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 24) = v5;
  return result;
}

void UnsafeMutableVectorPointer.subscript.setter()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v1 = v0;
  uint64_t v21 = v2;
  uint64_t v4 = v3;
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v26 = v10;
  *((void *)&v26 + 1) = v11;
  long long v13 = v12[1];
  long long v29 = *v12;
  long long v30 = v13;
  uint64_t v31 = *((void *)v12 + 4);
  uint64_t v22 = v14;
  type metadata accessor for UnsafeMutableVectorPointer();
  swift_getWitnessTable();
  uint64_t v15 = sub_2396D1FF0();
  sub_2396D1FB0();
  uint64_t v16 = v23;
  long long v17 = v4[1];
  long long v29 = *v4;
  long long v30 = v17;
  uint64_t v31 = *((void *)v4 + 4);
  MEMORY[0x23ECA2D50](&v28, v15);
  if (v28 >= v16)
  {
    *(void *)&long long v29 = v16;
    *((void *)&v29 + 1) = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF62BD8);
    sub_2396BF7A8();
    sub_2396D1F20();
    long long v26 = v23;
    long long v27 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689D51D8);
    sub_2396D1230();
    __swift_instantiateConcreteTypeFromMangledName(qword_2689D51E0);
    sub_2396D1240();
    if (v24)
    {
LABEL_6:
      OUTLINED_FUNCTION_4_1();
      return;
    }
    uint64_t v18 = *((void *)&v23 + 1);
    uint64_t v19 = v23;
    while (1)
    {
      long long v20 = v4[1];
      long long v23 = *v4;
      long long v24 = v20;
      uint64_t v25 = *((void *)v4 + 4);
      *(void *)&long long v26 = v18;
      swift_getWitnessTable();
      sub_2396D2000();
      if ((unsigned __int128)(v19 * (__int128)v1) >> 64 != (v19 * v1) >> 63) {
        break;
      }
      (*(void (**)(uint64_t, char *, uint64_t))(v6 + 40))(v21 + *(void *)(v6 + 72) * v19 * v1, v9, v22);
      __swift_instantiateConcreteTypeFromMangledName(qword_2689D51E0);
      sub_2396D1240();
      uint64_t v18 = *((void *)&v23 + 1);
      uint64_t v19 = v23;
      if (v24 == 1) {
        goto LABEL_6;
      }
    }
    __break(1u);
  }
  __break(1u);
}

unint64_t sub_2396BF7A8()
{
  unint64_t result = qword_2689D51D0;
  if (!qword_2689D51D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AF62BD8);
    sub_239417D18();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689D51D0);
  }
  return result;
}

void (*UnsafeMutableVectorPointer.subscript.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7))(uint64_t *a1, char a2)
{
  uint64_t v14 = malloc(0xA8uLL);
  *a1 = v14;
  v14[19] = a6;
  v14[20] = a7;
  v14[17] = a4;
  v14[18] = a5;
  v14[15] = a2;
  v14[16] = a3;
  UnsafeMutableVectorPointer.subscript.getter((uint64_t)(v14 + 10));
  return sub_2396BF8CC;
}

void sub_2396BF8CC(uint64_t *a1, char a2)
{
  OUTLINED_FUNCTION_1_103(a1, a2);

  free(v2);
}

Swift::Void __swiftcall UnsafeMutableVectorPointer.swapAt(_:_:)(Swift::Int a1, Swift::Int a2)
{
  uint64_t v3 = v2;
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v15 = (char *)&v17 - v14;
  if (v10 != v11)
  {
    if ((unsigned __int128)(v10 * (__int128)v13) >> 64 == (v10 * v13) >> 63)
    {
      if ((unsigned __int128)(v11 * (__int128)v13) >> 64 == (v11 * v13) >> 63)
      {
        uint64_t v16 = v12 + *(void *)(v5 + 72) * v11 * v13;
        sub_2396D0F50();
        sub_2396D0F40();
        (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v15, v3);
        sub_2396B8A68((uint64_t)v8, v16, v3);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v15, v3);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

uint64_t sub_2396BFA44(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *v4;
  uint64_t v7 = v4[2];
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = (void (*)(unsigned char *, void))UnsafeMutableVectorPointer.subscript.modify((uint64_t)v13, *a2, v6, a4, v7);
  uint64_t v10 = *(void *)(v8 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(v11, a1, v8);
  v9(v13, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(a1, v8);
}

void (*sub_2396BFB1C(void *a1, uint64_t *a2))(uint64_t a1)
{
  uint64_t v5 = malloc(0x28uLL);
  *a1 = v5;
  v5[4] = UnsafeMutableVectorPointer.subscript.modify((uint64_t)v5, *a2, *v2, v6, v2[2]);
  return sub_2396BFB94;
}

void sub_2396BFB94(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_7_87(a1);
  v3(v2);

  free(v1);
}

void sub_2396BFBD0()
{
}

void (*sub_2396BFBEC(void *a1, void *a2, uint64_t a3))(uint64_t *a1, char a2)
{
  uint64_t v7 = malloc(0xA8uLL);
  *a1 = v7;
  uint64_t v8 = a2[1];
  v7[15] = *a2;
  v7[16] = v8;
  uint64_t v9 = v3[1];
  v7[17] = *v3;
  v7[18] = v9;
  uint64_t v10 = *(void *)(a3 + 16);
  v7[19] = v3[2];
  v7[20] = v10;
  UnsafeMutableVectorPointer.subscript.getter((uint64_t)(v7 + 10));
  return sub_2396BF8CC;
}

uint64_t sub_2396BFC78()
{
  return sub_2396D0360();
}

void sub_2396BFCF8(Swift::Int *a1, Swift::Int *a2)
{
}

uint64_t sub_2396BFD14(uint64_t (*a1)(void *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return UnsafeMutableVectorPointer.withContiguousMutableStorageIfAvailable<A>(_:)(a1, a2, a4, a3);
}

uint64_t UnsafeMutableVectorPointer.withContiguousMutableStorageIfAvailable<A>(_:)(uint64_t (*a1)(void *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_10_2();
  if (*(void *)(v4 + 16) == 1)
  {
    uint64_t v16 = v11;
    uint64_t v17 = v10;
    v18[0] = sub_2396D1010();
    v18[1] = v12;
    uint64_t v13 = sub_2396D03E0();
    uint64_t result = a1(v18);
    if (v5) {
      return result;
    }
    v18[3] = v13;
    sub_2396D03E0();
    sub_2396D0F80();
    sub_2396D0FA0();
    swift_getWitnessTable();
    swift_getWitnessTable();
    uint64_t result = sub_2396D1D10();
    if ((result & 1) == 0)
    {
      __break(1u);
      return result;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v17, v6, a4);
    uint64_t v10 = v17;
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v10, v15, 1, a4);
}

void (*sub_2396BFF10(void *a1, uint64_t *a2, uint64_t a3))(uint64_t a1)
{
  uint64_t v7 = malloc(0x28uLL);
  *a1 = v7;
  v7[4] = sub_2396BFFC4(v7, *a2, *v3, v3[1], v3[2], *(void *)(a3 + 16));
  return sub_2396BFF88;
}

void sub_2396BFF88(uint64_t a1)
{
  uint64_t v2 = OUTLINED_FUNCTION_7_87(a1);
  v3(v2);

  free(v1);
}

void (*sub_2396BFFC4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(void *a1)
{
  uint64_t v8 = *(void *)(a6 - 8);
  *a1 = a6;
  a1[1] = v8;
  a1[2] = malloc(*(void *)(v8 + 64));
  UnsafeMutableVectorPointer.subscript.getter(a2, a3);
  return sub_23941796C;
}

double sub_2396C0088@<D0>(uint64_t a1@<X8>)
{
  UnsafeMutableVectorPointer.subscript.getter((uint64_t)v4);
  double result = *(double *)v4;
  long long v3 = v4[1];
  *(_OWORD *)a1 = v4[0];
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_2396C00E4@<X0>(void *a1@<X8>)
{
  uint64_t result = UnsafeMutableVectorPointer.indices.getter();
  *a1 = 0;
  a1[1] = v3;
  return result;
}

Swift::Int sub_2396C0110@<X0>(Swift::Int *a1@<X0>, Swift::Int *a2@<X8>)
{
  Swift::Int result = UnsafeMutableVectorPointer.index(after:)(*a1);
  *a2 = result;
  return result;
}

Swift::Int sub_2396C0140@<X0>(Swift::Int *a1@<X0>, Swift::Int *a2@<X8>)
{
  Swift::Int result = UnsafeMutableVectorPointer.index(before:)(*a1);
  *a2 = result;
  return result;
}

Swift::Int sub_2396C0170@<X0>(Swift::Int *a1@<X0>, Swift::Int a2@<X1>, Swift::Int *a3@<X8>)
{
  Swift::Int result = UnsafeMutableVectorPointer.index(_:offsetBy:)(*a1, a2);
  *a3 = result;
  return result;
}

Swift::Int sub_2396C019C@<X0>(Swift::Int *a1@<X0>, Swift::Int a2@<X1>, Swift::Int *a3@<X2>, uint64_t a4@<X8>)
{
  Swift::Int_optional v6 = UnsafeMutableVectorPointer.index(_:offsetBy:limitedBy:)(*a1, a2, *a3);
  *(void *)a4 = v6.value;
  *(unsigned char *)(a4 + 8) = v6.is_nil;
  return v6.value;
}

Swift::Int sub_2396C01D4(Swift::Int *a1, Swift::Int *a2)
{
  return UnsafeMutableVectorPointer.distance(from:to:)(*a1, *a2);
}

uint64_t UnsafeMutableVectorPointer.init(rebasing:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for UnsafeMutableVectorPointer();
  swift_getWitnessTable();
  sub_2396D1FF0();
  sub_2396D1FD0();
  sub_2396D1FB0();
  OUTLINED_FUNCTION_3_109();
  uint64_t result = sub_2396D1FD0();
  if ((unsigned __int128)(v7 * (__int128)v6) >> 64 == (v7 * v6) >> 63)
  {
    uint64_t v4 = v8 + *(void *)(*(void *)(a2 - 8) + 72) * v7 * v6;
    uint64_t v5 = OUTLINED_FUNCTION_2_113();
    MEMORY[0x23ECA2D50](v5);
    OUTLINED_FUNCTION_3_109();
    sub_2396D1FB0();
    OUTLINED_FUNCTION_2_113();
    sub_2396D1FD0();
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall UnsafeMutableVectorPointer.deallocate()()
{
}

uint64_t static UnsafeMutableVectorPointer.allocate(capacity:)()
{
  return sub_2396D0F70();
}

void UnsafeMutableVectorPointer.update(repeating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    OUTLINED_FUNCTION_5_1();
    uint64_t v9 = v8;
    int64_t v10 = v6;
    BOOL v11 = v6 >= 0;
    if (v8 > 0) {
      BOOL v11 = v6 < 1;
    }
    if (!v11)
    {
      uint64_t v12 = v7;
      uint64_t v13 = v5;
      uint64_t v14 = v4;
      int64_t v15 = 0;
      uint64_t v16 = *(void *)(v7 - 8);
      uint64_t v17 = *(void (**)(int64_t, uint64_t, uint64_t))(v16 + 24);
      uint64_t v18 = *(void *)(v16 + 72);
      do
      {
        if (__OFADD__(v15, v9)) {
          int64_t v19 = ((v15 + v9) >> 63) ^ 0x8000000000000000;
        }
        else {
          int64_t v19 = v15 + v9;
        }
        v17(v13 + v18 * v15, v14, v12);
        BOOL v20 = v19 >= v10;
        if (v9 <= 0) {
          BOOL v20 = v19 <= v10;
        }
        int64_t v15 = v19;
      }
      while (!v20);
    }
    OUTLINED_FUNCTION_4_1();
  }
  else
  {
    __break(1u);
  }
}

uint64_t UnsafeMutableVectorPointer.debugDescription.getter()
{
  return 0;
}

uint64_t sub_2396C055C()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396C0578()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396C0594()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396C05F8()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396C0614()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396C0678()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396C0694()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396C06F8()
{
  return UnsafeMutableVectorPointer.debugDescription.getter();
}

uint64_t sub_2396C070C()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396C0728()
{
  return sub_2396CDB40();
}

uint64_t sub_2396C07B8()
{
  return sub_2396CDB50();
}

void OUTLINED_FUNCTION_1_103(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  if (a2) {
    uint64_t v4 = *a1;
  }
  else {
    uint64_t v4 = *a1 + 40;
  }
  long long v5 = *(_OWORD *)(v3 + 96);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)(v3 + 80);
  *(_OWORD *)(v4 + 16) = v5;
  *(void *)(v4 + 32) = *(void *)(v3 + 112);
  UnsafeMutableVectorPointer.subscript.setter();
}

uint64_t OUTLINED_FUNCTION_3_109()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7_87(uint64_t a1)
{
  return *(void *)a1;
}

BOOL static MatrixLayout.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2396C0914(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726F6A614D776F72 && a2 == 0xE800000000000000;
  if (v3 || (sub_2396D1C60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x614D6E6D756C6F63 && a2 == 0xEB00000000726F6ALL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_2396D1C60();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2396C0A0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2396C0914(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2396C0A34(uint64_t a1)
{
  unint64_t v2 = sub_2396C0DBC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2396C0A70(uint64_t a1)
{
  unint64_t v2 = sub_2396C0DBC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2396C0AAC(uint64_t a1)
{
  unint64_t v2 = sub_2396C0E08();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2396C0AE8(uint64_t a1)
{
  unint64_t v2 = sub_2396C0E08();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2396C0B24(uint64_t a1)
{
  unint64_t v2 = sub_2396C0E54();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2396C0B60(uint64_t a1)
{
  unint64_t v2 = sub_2396C0E54();

  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_2396C0DBC()
{
  unint64_t result = qword_2689D5280;
  if (!qword_2689D5280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689D5280);
  }
  return result;
}

unint64_t sub_2396C0E08()
{
  unint64_t result = qword_2689D5288;
  if (!qword_2689D5288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689D5288);
  }
  return result;
}

unint64_t sub_2396C0E54()
{
  unint64_t result = qword_2689D5290;
  if (!qword_2689D5290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689D5290);
  }
  return result;
}

BOOL sub_2396C126C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static MatrixLayout.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_2396C1278@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = MatrixLayout.init(from:)(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_2396C12A8(void *a1)
{
  return MatrixLayout.encode(to:)(a1, *v1);
}

uint64_t sub_2396C12C4()
{
  return MatrixLayout.debugDescription.getter(*v0);
}

unint64_t sub_2396C12D0()
{
  unint64_t result = qword_2689D52B0;
  if (!qword_2689D52B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689D52B0);
  }
  return result;
}

unsigned char *_s13LinearAlgebra12MatrixLayoutOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2396C13FCLL);
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

unint64_t sub_2396C1458()
{
  unint64_t result = qword_2689D52B8;
  if (!qword_2689D52B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689D52B8);
  }
  return result;
}

unint64_t sub_2396C14A8()
{
  unint64_t result = qword_2689D52C0;
  if (!qword_2689D52C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689D52C0);
  }
  return result;
}

unint64_t sub_2396C14F8()
{
  unint64_t result = qword_2689D52C8;
  if (!qword_2689D52C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689D52C8);
  }
  return result;
}

unint64_t sub_2396C1548()
{
  unint64_t result = qword_2689D52D0;
  if (!qword_2689D52D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689D52D0);
  }
  return result;
}

unint64_t sub_2396C1598()
{
  unint64_t result = qword_2689D52D8;
  if (!qword_2689D52D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689D52D8);
  }
  return result;
}

unint64_t sub_2396C15E8()
{
  unint64_t result = qword_2689D52E0;
  if (!qword_2689D52E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689D52E0);
  }
  return result;
}

unint64_t sub_2396C1638()
{
  unint64_t result = qword_2689D52E8[0];
  if (!qword_2689D52E8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2689D52E8);
  }
  return result;
}

uint64_t DenseVector.count.getter()
{
  swift_retain();
  uint64_t v0 = sub_2396D1400();
  swift_release();
  return v0;
}

uint64_t DenseVector.withUnsafeVectorPointer<A>(_:)()
{
  return sub_2396D13C0();
}

void (*DenseVector.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(unint64_t **a1, char a2)
{
  char v7 = malloc(0x38uLL);
  *a1 = v7;
  *char v7 = a2;
  v7[1] = a3;
  uint64_t v8 = *(void *)(a3 + 16);
  v7[2] = v3;
  v7[3] = v8;
  OUTLINED_FUNCTION_0_1();
  *(void *)(v9 + 32) = v10;
  size_t v12 = *(void *)(v11 + 64);
  v7[5] = malloc(v12);
  v7[6] = malloc(v12);
  _s13LinearAlgebra11DenseVectorV10_uncheckedxSi_tcig_0();
  return sub_2396C18BC;
}

void sub_2396C18BC(unint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[5];
  unsigned int v4 = (void *)(*a1)[6];
  if (a2)
  {
    unint64_t v5 = v2[3];
    unint64_t v6 = v2[4];
    uint64_t v7 = v2[1];
    unint64_t v8 = *v2;
    (*(void (**)(unint64_t, void *, unint64_t))(v6 + 16))((*a1)[5], v4, v5);
    DenseVector.subscript.setter((uint64_t)v3, v8, v7);
    (*(void (**)(void *, unint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    DenseVector.subscript.setter((*a1)[6], *v2, v2[1]);
  }
  free(v4);
  free(v3);

  free(v2);
}

void (*sub_2396C1988())(void *a1)
{
  OUTLINED_FUNCTION_17_63();
  OUTLINED_FUNCTION_0_1();
  void *v1 = v2;
  v1[1] = v3;
  *(void *)(v0 + 16) = malloc(*(void *)(v4 + 64));
  _s13LinearAlgebra11DenseVectorV10_uncheckedxSi_tcig_0();
  return sub_23941796C;
}

uint64_t DenseVector.init(repeating:count:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  double v8 = MEMORY[0x270FA5388](v7);
  (*(void (**)(char *, uint64_t, double))(v6 + 16))((char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  uint64_t v10 = sub_2396D1450();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, a3);
  return v10;
}

void sub_2396C1AE8(uint64_t a1)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_1_104();
    if (v1)
    {
      uint64_t v2 = sub_2396D0870();
      OUTLINED_FUNCTION_4_100(v2);
    }
    OUTLINED_FUNCTION_6_96();
    OUTLINED_FUNCTION_10_85();
    UnsafeMutableVectorPointer<A>.addProductFloat(_:_:transposed:scaledBy:)();
    OUTLINED_FUNCTION_13_70();
    swift_release();
    OUTLINED_FUNCTION_12_72();
    OUTLINED_FUNCTION_15_16();
  }
}

void sub_2396C1B64(uint64_t a1)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_1_104();
    if (v1)
    {
      uint64_t v2 = sub_2396D0870();
      OUTLINED_FUNCTION_4_100(v2);
    }
    OUTLINED_FUNCTION_8_94();
    OUTLINED_FUNCTION_10_85();
    UnsafeMutableVectorPointer<A>.addProductFloat(_:_:transposed:scaledBy:)();
    OUTLINED_FUNCTION_13_70();
    swift_release();
    OUTLINED_FUNCTION_12_72();
    OUTLINED_FUNCTION_15_16();
  }
}

void sub_2396C1BE0(uint64_t a1)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_1_104();
    if (v1)
    {
      uint64_t v2 = sub_2396D0870();
      OUTLINED_FUNCTION_4_100(v2);
    }
    OUTLINED_FUNCTION_6_96();
    OUTLINED_FUNCTION_11_74();
    UnsafeMutableVectorPointer<A>.addProductFloat(_:_:transposed:scaledBy:)();
    OUTLINED_FUNCTION_13_70();
    swift_release();
    OUTLINED_FUNCTION_12_72();
    OUTLINED_FUNCTION_15_16();
  }
}

void sub_2396C1C5C(uint64_t a1)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_1_104();
    if (v1)
    {
      uint64_t v2 = sub_2396D0870();
      OUTLINED_FUNCTION_4_100(v2);
    }
    OUTLINED_FUNCTION_8_94();
    OUTLINED_FUNCTION_11_74();
    UnsafeMutableVectorPointer<A>.addProductFloat(_:_:transposed:scaledBy:)();
    OUTLINED_FUNCTION_13_70();
    swift_release();
    OUTLINED_FUNCTION_12_72();
    OUTLINED_FUNCTION_15_16();
  }
}

void sub_2396C1CD8(uint64_t a1)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_1_104();
    if (v1)
    {
      uint64_t v2 = sub_2396D0870();
      OUTLINED_FUNCTION_5_107(v2);
    }
    OUTLINED_FUNCTION_7_88();
    OUTLINED_FUNCTION_10_85();
    UnsafeMutableVectorPointer<A>.addProductDouble(_:_:transposed:scaledBy:)();
    OUTLINED_FUNCTION_13_70();
    swift_release();
    OUTLINED_FUNCTION_12_72();
    OUTLINED_FUNCTION_15_16();
  }
}

void sub_2396C1D54(uint64_t a1)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_1_104();
    if (v1)
    {
      uint64_t v2 = sub_2396D0870();
      OUTLINED_FUNCTION_5_107(v2);
    }
    OUTLINED_FUNCTION_9_74();
    OUTLINED_FUNCTION_10_85();
    UnsafeMutableVectorPointer<A>.addProductDouble(_:_:transposed:scaledBy:)();
    OUTLINED_FUNCTION_13_70();
    swift_release();
    OUTLINED_FUNCTION_12_72();
    OUTLINED_FUNCTION_15_16();
  }
}

void sub_2396C1DD0(uint64_t a1)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_1_104();
    if (v1)
    {
      uint64_t v2 = sub_2396D0870();
      OUTLINED_FUNCTION_5_107(v2);
    }
    OUTLINED_FUNCTION_7_88();
    OUTLINED_FUNCTION_11_74();
    UnsafeMutableVectorPointer<A>.addProductDouble(_:_:transposed:scaledBy:)();
    OUTLINED_FUNCTION_13_70();
    swift_release();
    OUTLINED_FUNCTION_12_72();
    OUTLINED_FUNCTION_15_16();
  }
}

void sub_2396C1E4C(uint64_t a1)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_1_104();
    if (v1)
    {
      uint64_t v2 = sub_2396D0870();
      OUTLINED_FUNCTION_5_107(v2);
    }
    OUTLINED_FUNCTION_9_74();
    OUTLINED_FUNCTION_11_74();
    UnsafeMutableVectorPointer<A>.addProductDouble(_:_:transposed:scaledBy:)();
    OUTLINED_FUNCTION_13_70();
    swift_release();
    OUTLINED_FUNCTION_12_72();
    OUTLINED_FUNCTION_15_16();
  }
}

uint64_t DenseVector.init(unsafeUninitializedCapacity:initializingWith:)()
{
  return sub_2394615A0();
}

uint64_t DenseVector.storage.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  void *v1 = a1;
  return result;
}

uint64_t (*DenseVector.storage.modify())(void, void)
{
  return nullsub_1;
}

uint64_t DenseVector.init<A>(scalars:)()
{
  OUTLINED_FUNCTION_17_63();
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  double v5 = MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, double))(v3 + 16))((char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v1, v5);
  uint64_t v7 = sub_2396D0950();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
  return v7;
}

uint64_t sub_2396C2034(uint64_t *a1, void *a2, uint64_t a3, uint64_t (*a4)(void *), uint64_t a5, uint64_t a6)
{
  *a2 = a3;
  v13[0] = UnsafeMutableVectorPointer.init(_:)(*a1, a1[1], a6);
  v13[1] = v9;
  v13[2] = v10;
  uint64_t result = a4(v13);
  if (!v6)
  {
    uint64_t result = sub_2396D1010();
    *a1 = result;
    a1[1] = v12;
  }
  return result;
}

uint64_t DenseVector.squaredMagnitude.getter()
{
  return sub_2396C22F4();
}

uint64_t static DenseVector.__derived_struct_equals(_:_:)()
{
  return sub_2396D1480();
}

uint64_t sub_2396C20F4()
{
  return static DenseVector.__derived_struct_equals(_:_:)();
}

uint64_t DenseVector.init(arrayLiteral:)()
{
  return sub_2396D0950();
}

uint64_t sub_2396C2170@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DenseVector.init(arrayLiteral:)();
  *a1 = result;
  return result;
}

uint64_t sub_2396C219C(uint64_t a1, uint64_t a2)
{
  return sub_2396B4ACC(a1, a2, *(uint64_t (**)(uint64_t))(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 16));
}

void *DenseVector.withUnsafeMutableVectorPointer<A>(_:)(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 16);
  sub_2396D1470();
  sub_2396D13B0();
  uint64_t v7 = *(void *)(*(void *)v3 + 16);
  v10[0] = *(void *)v3
         + ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80));
  uint64_t v8 = v10[0];
  v10[1] = v7;
  sub_2396B4C94((uint64_t)v10, a1, a2, v6);
  return sub_239462E18(v10, v8, v7);
}

uint64_t DenseVector.magnitude.getter()
{
  return sub_2396C22F4();
}

uint64_t DenseVector.maximumAbsoluteValue.getter()
{
  return sub_2396C22F4();
}

uint64_t sub_2396C22F4()
{
  return swift_release();
}

uint64_t sub_2396C2378(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void, void, void, void, void))
{
  return a4(*a1, a1[1], a1[2], *(void *)(a3 + a2 - 16), *(void *)(*(void *)(a3 + a2 - 8) + 16));
}

Swift::Void __swiftcall DenseVector.negate()()
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v0 + 16);
  OUTLINED_FUNCTION_0_1();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)v21 - v10;
  uint64_t v13 = *(void *)(v12 + 24);
  swift_retain();
  uint64_t v14 = DenseVector.count.getter();
  swift_release();
  if (v14 < 0)
  {
    __break(1u);
  }
  else if (v14)
  {
    unint64_t v15 = 0;
    v21[1] = v5 + 40;
    v21[2] = v5 + 8;
    do
    {
      unint64_t v22 = v15 + 1;
      _s13LinearAlgebra11DenseVectorV10_uncheckedxSi_tcig_0();
      sub_2396D12F0();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
      uint64_t v16 = v13;
      uint64_t v17 = sub_2396D1470();
      sub_2396D13B0();
      uint64_t v18 = *v2;
      sub_239636D6C(v15, *v2);
      (*(void (**)(unint64_t, char *, uint64_t))(v5 + 40))(v18+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v15, v11, v3);
      uint64_t v19 = v17;
      uint64_t v13 = v16;
      nullsub_1(v19, v20);
      unint64_t v15 = v22;
    }
    while (v14 != v22);
  }
}

uint64_t static DenseVector.- prefix(_:)()
{
  return DenseVector.init(unsafeUninitializedCapacity:initializingWith:)();
}

void sub_2396C25D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = a4;
  uint64_t v19 = a2;
  uint64_t v5 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v17 - v9;
  uint64_t v18 = v11;
  uint64_t v12 = v11[1];
  if (v12 < 0)
  {
LABEL_8:
    __break(1u);
    return;
  }
  if (v12)
  {
    uint64_t v13 = 0;
    v17[1] = v5 + 40;
    while (1)
    {
      uint64_t v14 = *v18;
      uint64_t v15 = v18[2];
      _s13LinearAlgebra11DenseVectorV10_uncheckedxSi_tcig_0();
      sub_2396D12F0();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, a3);
      uint64_t v16 = v13 * v15;
      if ((unsigned __int128)(v13 * (__int128)v15) >> 64 != (v13 * v15) >> 63) {
        break;
      }
      ++v13;
      (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v14 + *(void *)(v5 + 72) * v16, v10, a3);
      if (v12 == v13) {
        return;
      }
    }
    __break(1u);
    goto LABEL_8;
  }
}

void *static DenseVector.+= infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2396C29BC(a1, a2, a3, a4, (uint64_t (*)(uint64_t))sub_2396C39C4);
}

uint64_t sub_2396C278C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v21 = a6;
  uint64_t v15 = *(void *)(a7 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2396C28B8();
  UnsafeMutableVectorPointer<A>.add(_:scaledBy:)(a1, a2, a3, (uint64_t)v17, a4, a5, v21, a7, a8, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28,
    v29,
    v30);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, a7);
}

uint64_t sub_2396C28B8()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  swift_getAssociatedConformanceWitness();
  sub_2396D1EC0();
  return sub_2396D1C00();
}

void *static DenseVector.-= infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2396C29BC(a1, a2, a3, a4, (uint64_t (*)(uint64_t))sub_2396C3A0C);
}

void *sub_2396C29BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  OUTLINED_FUNCTION_16_57();
  return DenseVector.withUnsafeMutableVectorPointer<A>(_:)(a5, (uint64_t)&v8, v6);
}

uint64_t sub_2396C2A0C()
{
  return DenseVector.withUnsafeVectorPointer<A>(_:)();
}

uint64_t sub_2396C2A58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v21 = a5;
  uint64_t v22 = a6;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v18 = a2;
  uint64_t v11 = *(void *)(a7 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  swift_getAssociatedConformanceWitness();
  sub_2396D1EC0();
  sub_2396D1C00();
  UnsafeMutableVectorPointer<A>.add(_:scaledBy:)(a1, v18, v19, (uint64_t)v13, v20, v21, v22, a7, a8, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25,
    v26,
    v27);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, a7);
}

uint64_t static DenseVector.+ infix(_:_:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2396C2C44(result, a2, a3, a4, (void (*)(uint64_t *, uint64_t, uint64_t, uint64_t))static DenseVector.+= infix(_:_:));
  return result;
}

uint64_t static DenseVector.- infix(_:_:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2396C2C44(result, a2, a3, a4, (void (*)(uint64_t *, uint64_t, uint64_t, uint64_t))static DenseVector.-= infix(_:_:));
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_2396C2C44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *, uint64_t, uint64_t, uint64_t))
{
  swift_retain();
  a5(&v9, a2, a3, a4);
}

void *static DenseVector.*= infix(_:_:)()
{
  OUTLINED_FUNCTION_16_57();
  return DenseVector.withUnsafeMutableVectorPointer<A>(_:)((uint64_t (*)(uint64_t))sub_2396C3A3C, (uint64_t)&v2, v0);
}

uint64_t sub_2396C2D00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 < 0)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  if (a2)
  {
    uint64_t v5 = 0;
    while ((unsigned __int128)(v5 * (__int128)a3) >> 64 == (v5 * a3) >> 63)
    {
      ++v5;
      uint64_t result = sub_2396D0BF0();
      if (a2 == v5) {
        return result;
      }
    }
    __break(1u);
    goto LABEL_8;
  }
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> static DenseVector.* infix(_:_:)()
{
}

uint64_t static DenseVector.* infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t static DenseVector./ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  OUTLINED_FUNCTION_0_1();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v16 - v12;
  uint64_t v17 = a1;
  swift_getAssociatedConformanceWitness();
  swift_retain();
  sub_2396D1EC0();
  sub_2396D1C00();
  sub_2396D01E0();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v7 + 8);
  v14(v10, a3);
  static DenseVector.*= infix(_:_:)();
  v14(v13, a3);
  return v17;
}

uint64_t static DenseVector<>.*= infix(_:_:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_239666B00();
    uint64_t v2 = v3;
  }
  uint64_t result = UnsafeMutableVectorPointer<A>.multiply(by:)(v2 + 32, *(void *)(v2 + 16), 1);
  *a1 = v2;
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_239666B30();
    uint64_t v2 = v3;
  }
  uint64_t result = UnsafeMutableVectorPointer<A>.multiply(by:)(v2 + 32, *(void *)(v2 + 16), 1);
  *a1 = v2;
  return result;
}

uint64_t static DenseVector<>.* infix(_:_:)(uint64_t a1)
{
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_239666B00();
    a1 = v2;
  }
  OUTLINED_FUNCTION_20_56();
  return a1;
}

{
  uint64_t v2;

  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_239666B00();
    a1 = v2;
  }
  OUTLINED_FUNCTION_20_56();
  return a1;
}

{
  uint64_t v2;

  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_239666B30();
    a1 = v2;
  }
  OUTLINED_FUNCTION_19_52();
  return a1;
}

{
  uint64_t v2;

  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_239666B30();
    a1 = v2;
  }
  OUTLINED_FUNCTION_19_52();
  return a1;
}

uint64_t static DenseVector<>./ infix(_:_:)(uint64_t a1)
{
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_239666B00();
    a1 = v2;
  }
  UnsafeMutableVectorPointer<A>.multiply(by:)(a1 + 32, *(void *)(a1 + 16), 1);
  return a1;
}

{
  uint64_t v2;

  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_239666B30();
    a1 = v2;
  }
  UnsafeMutableVectorPointer<A>.multiply(by:)(a1 + 32, *(void *)(a1 + 16), 1);
  return a1;
}

uint64_t sub_2396C3338()
{
  return DenseVector.withUnsafeVectorPointer<A>(_:)();
}

uint64_t sub_2396C3384@<X0>(uint64_t a1@<X0>, void (**a2)(char *, char *, uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v47 = a6;
  uint64_t v40 = a5;
  uint64_t v38 = a4;
  uint64_t v60 = a3;
  uint64_t v41 = a2;
  uint64_t v39 = a1;
  uint64_t v12 = *(void *)(a7 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v45 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v44 = (char *)&v37 - v15;
  MEMORY[0x270FA5388](v16);
  uint64_t v43 = (char *)&v37 - v17;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v19 = sub_2396D0FA0();
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v37 - v20;
  uint64_t v42 = *(void *)(*(void *)(*(void *)(a8 + 16) + 16) + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  swift_getAssociatedConformanceWitness();
  sub_2396D1ED0();
  uint64_t v46 = a9;
  sub_2396D1C40();
  uint64_t v56 = v38;
  uint64_t v57 = v40;
  uint64_t v58 = v47;
  uint64_t v48 = v39;
  *(void *)&long long v49 = v41;
  *((void *)&v49 + 1) = v60;
  uint64_t v23 = type metadata accessor for UnsafeVectorPointer();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_2396D1F20();
  uint64_t v47 = WitnessTable;
  uint64_t v48 = v52;
  long long v49 = v53;
  uint64_t v50 = v54;
  long long v51 = v55;
  uint64_t v56 = v23;
  uint64_t v57 = v23;
  uint64_t v60 = v23;
  uint64_t v58 = WitnessTable;
  uint64_t v59 = WitnessTable;
  sub_2396D1260();
  sub_2396D1230();
  uint64_t v41 = (void (**)(char *, char *, uint64_t))(v12 + 32);
  uint64_t v25 = (void (**)(char *, uint64_t))(v12 + 8);
  for (i = v43; ; v34(i, a7))
  {
    uint64_t v52 = v60;
    *(void *)&long long v53 = v60;
    *((void *)&v53 + 1) = v47;
    uint64_t v54 = v47;
    sub_2396D1250();
    sub_2396D1240();
    uint64_t result = __swift_getEnumTagSinglePayload((uint64_t)v21, 1, TupleTypeMetadata2);
    if (result == 1) {
      break;
    }
    uint64_t v28 = &v21[*(int *)(TupleTypeMetadata2 + 48)];
    uint64_t v29 = TupleTypeMetadata2;
    uint64_t v30 = *v41;
    (*v41)(i, v21, a7);
    uint64_t v31 = v21;
    uint64_t v32 = v44;
    v30(v44, v28, a7);
    uint64_t v33 = v45;
    sub_2396D0BE0();
    sub_2396D1680();
    uint64_t v34 = *v25;
    uint64_t v35 = v33;
    TupleTypeMetadata2 = v29;
    (*v25)(v35, a7);
    BOOL v36 = v32;
    uint64_t v21 = v31;
    v34(v36, a7);
  }
  return result;
}

uint64_t sub_2396C388C(uint64_t *a1, void *a2)
{
  return sub_2396C2034(a1, a2, *(void *)(v2 + 32), *(uint64_t (**)(void *))(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 16));
}

uint64_t sub_2396C38B0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2396C2378(a1, a2, a3, (uint64_t (*)(void, void, void, void, void))UnsafeVectorPointer<A>.squaredMagnitude.getter);
}

uint64_t sub_2396C38E4()
{
  return sub_2396C3964();
}

uint64_t sub_2396C38FC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2396C2378(a1, a2, a3, (uint64_t (*)(void, void, void, void, void))UnsafeVectorPointer<A>.magnitude.getter);
}

uint64_t sub_2396C3930(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2396C2378(a1, a2, a3, (uint64_t (*)(void, void, void, void, void))UnsafeVectorPointer<A>.maximumAbsoluteValue.getter);
}

uint64_t sub_2396C3964()
{
  return swift_getAtKeyPath();
}

void sub_2396C39A4(uint64_t a1)
{
  sub_2396C25D4(a1, v1[4], v1[2], v1[3]);
}

uint64_t sub_2396C39C4()
{
  return sub_2396C2A0C();
}

uint64_t type metadata accessor for DenseVector()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2396C3A0C()
{
  return sub_2396C2A0C();
}

uint64_t sub_2396C3A3C()
{
  OUTLINED_FUNCTION_21_53();
  return sub_2396C2D00(v0, v1, v2);
}

uint64_t sub_2396C3A58()
{
  return sub_2396C3338();
}

uint64_t sub_2396C3A74@<X0>(uint64_t a1@<X0>, void (**a2)(char *, char *, uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2396C3384(a1, a2, a3, v4[4], v4[5], v4[6], v4[2], v4[3], a4);
}

uint64_t sub_2396C3A98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2396C3AF0(a1, a2, a3, sub_2396C2A58);
}

uint64_t sub_2396C3AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2396C3AF0(a1, a2, a3, sub_2396C278C);
}

uint64_t sub_2396C3AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, void, void, void, void, void))
{
  return a4(a1, a2, a3, v4[4], v4[5], v4[6], v4[2], v4[3]);
}

void OUTLINED_FUNCTION_5_107(uint64_t a1)
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = (void *)(a1 + 32);
  bzero(v3, 8 * v1);
}

float OUTLINED_FUNCTION_6_96()
{
  return 1.0;
}

double OUTLINED_FUNCTION_7_88()
{
  return 1.0;
}

float OUTLINED_FUNCTION_8_94()
{
  return 1.0;
}

uint64_t OUTLINED_FUNCTION_12_72()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_13_70()
{
  *(void *)(v1 + 16) = v0;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_16_57()
{
  return type metadata accessor for DenseVector();
}

void *OUTLINED_FUNCTION_18_54()
{
  return static DenseVector.*= infix(_:_:)();
}

uint64_t OUTLINED_FUNCTION_19_52()
{
  uint64_t v2 = *(void *)(v0 + 16);
  return UnsafeMutableVectorPointer<A>.multiply(by:)(v0 + 32, v2, 1);
}

uint64_t SparseMatrix.indexed()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  char v5 = *((unsigned char *)v1 + 16);
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  char v9 = v5 & 1;
  uint64_t v12 = v7;
  uint64_t v13 = v6;
  uint64_t v11 = v8;
  sub_239518224((uint64_t)&v13);
  sub_239518224((uint64_t)&v12);
  uint64_t result = sub_2396C3D74((uint64_t)&v11);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v9;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  return result;
}

__n128 SparseMatrix.IndexedSequence.init(base:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 40);
  char v3 = *(unsigned char *)(a1 + 16) & 1;
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(unsigned char *)(a2 + 16) = v3;
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(a2 + 24) = result;
  *(void *)(a2 + 40) = v2;
  return result;
}

uint64_t sub_2396C3D74(uint64_t a1)
{
  return a1;
}

uint64_t SparseMatrix.Transpose.indexed()@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for SparseMatrix();

  return SparseMatrix.indexed()(a1);
}

uint64_t SparseMatrix.IndexedSequence.base.getter@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_0_59(a1);
  sub_2396D0110();

  return swift_retain();
}

double SparseMatrix.IndexedSequence.makeIterator()@<D0>(_OWORD *a1@<X8>)
{
  long long v3 = *v1;
  long long v4 = v1[2];
  long long v12 = v1[1];
  long long v13 = v4;
  uint64_t v14 = *((void *)&v12 + 1);
  long long v15 = v4;
  long long v11 = v3;
  sub_239518224((uint64_t)&v14);
  sub_239518224((uint64_t)&v15);
  sub_2396C3D74((uint64_t)&v15 + 8);
  SparseMatrix.IndexedSequence.Iterator.init(base:)((uint64_t)&v11, (uint64_t)v8);
  long long v5 = v8[1];
  *a1 = v8[0];
  a1[1] = v5;
  double result = *(double *)&v9;
  long long v7 = v10;
  a1[2] = v9;
  a1[3] = v7;
  return result;
}

uint64_t SparseMatrix.IndexedSequence.Iterator.init(base:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 24);
  long long v16 = *(_OWORD *)(a1 + 24);
  uint64_t v19 = v8;
  type metadata accessor for SparseMatrix();
  uint64_t result = SparseMatrix.majorCount.getter();
  if (result >= 1)
  {
    unint64_t v10 = *(void *)(v8 + 16);
    BOOL v11 = v10 >= 2;
    unint64_t v12 = v10 - 2;
    if (!v11)
    {
LABEL_14:
      __break(1u);
      return result;
    }
    if (*(uint64_t *)(v8 + 40) <= 0)
    {
      uint64_t v13 = 0;
      while (1)
      {
        if (result - 1 == v13)
        {
          uint64_t v13 = result;
          goto LABEL_6;
        }
        if (v12 == v13) {
          break;
        }
        uint64_t v15 = *(void *)(v8 + 48 + 8 * v13++);
        if (v15 >= 1) {
          goto LABEL_6;
        }
      }
      __break(1u);
      goto LABEL_14;
    }
  }
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = v14;
  sub_239518224((uint64_t)&v19);
  sub_239518224((uint64_t)&v18);
  sub_2396C3D74((uint64_t)&v17);
  uint64_t result = sub_2396C40E8(a1);
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v5;
  *(unsigned char *)(a2 + 16) = v6 & 1;
  *(_OWORD *)(a2 + 24) = v16;
  *(void *)(a2 + 40) = v7;
  *(void *)(a2 + 48) = v13;
  *(void *)(a2 + 56) = 0;
  return result;
}

double sub_2396C3FC0@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  SparseMatrix.IndexedSequence.makeIterator()(v9);
  uint64_t v14 = v3;
  sub_23944B680((uint64_t)&v14);
  uint64_t v13 = v4;
  sub_23944B680((uint64_t)&v13);
  uint64_t v12 = v5;
  sub_23967D6A0((uint64_t)&v12);
  long long v6 = v9[1];
  *a1 = v9[0];
  a1[1] = v6;
  double result = *(double *)&v10;
  long long v8 = v11;
  a1[2] = v10;
  a1[3] = v8;
  return result;
}

uint64_t SparseMatrix.IndexedSequence.Iterator.base.getter@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_0_59(a1);
  sub_2396D0110();

  return swift_retain();
}

uint64_t SparseMatrix.IndexedSequence.Iterator.majorIndex.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t SparseMatrix.IndexedSequence.Iterator.majorIndex.setter(uint64_t result)
{
  *(void *)(v1 + 48) = result;
  return result;
}

uint64_t (*SparseMatrix.IndexedSequence.Iterator.majorIndex.modify())(void, void)
{
  return nullsub_1;
}

uint64_t SparseMatrix.IndexedSequence.Iterator.flatIndex.getter()
{
  return *(void *)(v0 + 56);
}

uint64_t SparseMatrix.IndexedSequence.Iterator.flatIndex.setter(uint64_t result)
{
  *(void *)(v1 + 56) = result;
  return result;
}

uint64_t (*SparseMatrix.IndexedSequence.Iterator.flatIndex.modify())(void, void)
{
  return nullsub_1;
}

uint64_t sub_2396C40E8(uint64_t a1)
{
  return a1;
}

void SparseMatrix.IndexedSequence.Iterator.next()(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  MEMORY[0x270FA5388](TupleTypeMetadata3);
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = *(void *)(v2 + 48);
  if (*(unsigned char *)(v2 + 16))
  {
    if (v7 < *(void *)(v2 + 8))
    {
      unint64_t v8 = *(void *)(v2 + 56);
      if ((v8 & 0x8000000000000000) != 0)
      {
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }
      long long v9 = *(uint64_t **)(v2 + 32);
      if (v8 >= v9[2])
      {
LABEL_39:
        __break(1u);
        goto LABEL_40;
      }
      swift_retain();
      OUTLINED_FUNCTION_1_105();
      swift_release();
      int64_t v10 = v8 + 1;
      *(void *)(v2 + 56) = v10;
      uint64_t v11 = *(void *)(v2 + 24);
      OUTLINED_FUNCTION_2_114();
      uint64_t v12 = SparseMatrix.majorCount.getter();
      if (v7 < v12)
      {
        if (v7 < -1)
        {
LABEL_42:
          __break(1u);
          goto LABEL_43;
        }
        unint64_t v13 = *(void *)(v11 + 16);
        if (v7 + 1 >= v13)
        {
LABEL_43:
          __break(1u);
          goto LABEL_44;
        }
        if (v10 >= *(void *)(v11 + 8 * (v7 + 1) + 32))
        {
          uint64_t v14 = v7;
          while (1)
          {
            if (v14 + 1 >= v12)
            {
              uint64_t v14 = v12;
LABEL_30:
              *(void *)(v2 + 48) = v14;
              goto LABEL_31;
            }
            if (v14 + 2 >= v13) {
              break;
            }
            uint64_t v15 = *(void *)(v11 + 48 + 8 * v14++);
            if (v10 < v15) {
              goto LABEL_30;
            }
          }
          __break(1u);
LABEL_37:
          __break(1u);
          goto LABEL_38;
        }
      }
LABEL_31:
      uint64_t v23 = OUTLINED_FUNCTION_3_110();
      *long long v9 = v24;
      v9[1] = v7;
LABEL_35:
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v23, v26, v4);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, TupleTypeMetadata3);
      return;
    }
  }
  else if (v7 < *(void *)v2)
  {
    unint64_t v16 = *(void *)(v2 + 56);
    if ((v16 & 0x8000000000000000) != 0)
    {
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    long long v9 = *(uint64_t **)(v2 + 32);
    if (v16 >= v9[2])
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    swift_retain();
    OUTLINED_FUNCTION_1_105();
    swift_release();
    int64_t v17 = v16 + 1;
    *(void *)(v2 + 56) = v17;
    uint64_t v18 = *(void *)(v2 + 24);
    OUTLINED_FUNCTION_2_114();
    uint64_t v19 = SparseMatrix.majorCount.getter();
    if (v7 < v19)
    {
      if (v7 < -1)
      {
LABEL_44:
        __break(1u);
        goto LABEL_45;
      }
      unint64_t v20 = *(void *)(v18 + 16);
      if (v7 + 1 >= v20)
      {
LABEL_45:
        __break(1u);
        return;
      }
      if (v17 >= *(void *)(v18 + 8 * (v7 + 1) + 32))
      {
        uint64_t v21 = v7;
        while (v21 + 1 < v19)
        {
          if (v21 + 2 >= v20) {
            goto LABEL_37;
          }
          uint64_t v22 = *(void *)(v18 + 48 + 8 * v21++);
          if (v17 < v22) {
            goto LABEL_33;
          }
        }
        uint64_t v21 = v19;
LABEL_33:
        *(void *)(v2 + 48) = v21;
      }
    }
    uint64_t v23 = OUTLINED_FUNCTION_3_110();
    *long long v9 = v7;
    v9[1] = v25;
    goto LABEL_35;
  }

  __swift_storeEnumTagSinglePayload(a2, 1, 1, TupleTypeMetadata3);
}

uint64_t sub_2396C44A4()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396C44C8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  sub_2396D0110();
  sub_2396D0110();
  swift_retain();
  return a1;
}

uint64_t sub_2396C4528(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  sub_2396D0110();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_2396D0110();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2396C45B8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t type metadata accessor for SparseMatrix.IndexedSequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2396C4630()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_2396C4674(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  sub_2396D0110();
  sub_2396D0110();
  swift_retain();
  return a1;
}

uint64_t sub_2396C46DC(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  sub_2396D0110();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  sub_2396D0110();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

uint64_t sub_2396C477C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t type metadata accessor for SparseMatrix.IndexedSequence.Iterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_1_105()
{
  *(void *)(v1 - 144) = v0;
  return _s13LinearAlgebra11DenseVectorV10_uncheckedxSi_tcig_0();
}

uint64_t OUTLINED_FUNCTION_3_110()
{
  return *(void *)(v1 - 136) + *(int *)(v0 + 64);
}

uint64_t SparseMatrix.majorCount.getter()
{
  uint64_t v1 = 8;
  if (!*(unsigned char *)(v0 + 16)) {
    uint64_t v1 = 0;
  }
  return *(void *)(v0 + v1);
}

uint64_t SparseMatrix.rowCount.getter()
{
  return *(void *)v0;
}

uint64_t SparseMatrix.columnCount.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t SparseMatrix.layout.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t SparseMatrix.minorCount.getter()
{
  uint64_t v1 = 8;
  if (*(unsigned char *)(v0 + 16)) {
    uint64_t v1 = 0;
  }
  return *(void *)(v0 + v1);
}

uint64_t SparseMatrix.majorStarts.getter()
{
  return sub_2396D0110();
}

uint64_t SparseMatrix.majorStarts.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*SparseMatrix.majorStarts.modify())(void, void)
{
  return nullsub_1;
}

uint64_t SparseMatrix.minorIndices.getter()
{
  return sub_2396D0110();
}

uint64_t SparseMatrix.minorIndices.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*SparseMatrix.minorIndices.modify())(void, void)
{
  return nullsub_1;
}

uint64_t SparseMatrix.storage.getter()
{
  return swift_retain();
}

uint64_t SparseMatrix.storage.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 40) = a1;
  return result;
}

uint64_t (*SparseMatrix.storage.modify())(void, void)
{
  return nullsub_1;
}

uint64_t SparseMatrix.nonZeroValues.getter()
{
  return sub_2396D0950();
}

uint64_t SparseMatrix.count.getter()
{
  uint64_t v1 = v0[1];
  uint64_t result = *v0 * v1;
  if ((unsigned __int128)(*v0 * (__int128)v1) >> 64 != result >> 63) {
    __break(1u);
  }
  return result;
}

double SparseMatrix.init(rowCount:columnCount:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  SparseMatrix.init(rowCount:columnCount:layout:)(a1, a2, 0, (uint64_t)v6);
  long long v4 = v6[1];
  *a3 = v6[0];
  a3[1] = v4;
  double result = *(double *)&v7;
  a3[2] = v7;
  return result;
}

uint64_t SparseMatrix.init(rowCount:columnCount:layout:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v5 = result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = result + 1;
    if (!__OFADD__(result, 1)) {
      goto LABEL_6;
    }
    __break(1u);
  }
  uint64_t v7 = a2 + 1;
  if (!__OFADD__(a2, 1))
  {
LABEL_6:
    char v8 = a3 & 1;
    uint64_t v9 = sub_2396C6398(0, v7);
    sub_2396D0860();
    double result = sub_2396D1370();
    *(void *)a4 = v5;
    *(void *)(a4 + 8) = a2;
    *(unsigned char *)(a4 + 16) = v8;
    uint64_t v10 = MEMORY[0x263F8EE78];
    *(void *)(a4 + 24) = v9;
    *(void *)(a4 + 32) = v10;
    *(void *)(a4 + 40) = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t SparseMatrix.init(rowCount:columnCount:columnStarts:rowIndices:values:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  if (__OFADD__(a1, 1))
  {
    __break(1u);
  }
  else if (*(void *)(a2 + 16) == a1 + 1)
  {
    OUTLINED_FUNCTION_3_111();
    swift_getWitnessTable();
    uint64_t result = OUTLINED_FUNCTION_11_75();
    *(void *)a3 = v5;
    *(void *)(a3 + 8) = v4;
    *(unsigned char *)(a3 + 16) = 1;
    *(void *)(a3 + 24) = a2;
    *(void *)(a3 + 32) = v3;
    *(void *)(a3 + 40) = result;
    return result;
  }
  uint64_t result = sub_2396D1650();
  __break(1u);
  return result;
}

uint64_t SparseMatrix.init(rowCount:columnCount:rowStarts:columnIndices:values:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  if (__OFADD__(a1, 1))
  {
    __break(1u);
  }
  else if (*(void *)(a2 + 16) == a1 + 1)
  {
    OUTLINED_FUNCTION_3_111();
    swift_getWitnessTable();
    uint64_t result = OUTLINED_FUNCTION_11_75();
    *(void *)a3 = v5;
    *(void *)(a3 + 8) = v4;
    *(unsigned char *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = a2;
    *(void *)(a3 + 32) = v3;
    *(void *)(a3 + 40) = result;
    return result;
  }
  uint64_t result = sub_2396D1650();
  __break(1u);
  return result;
}

Swift::Void __swiftcall SparseMatrix.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
  sub_2396C4D50(keepingCapacity);
  uint64_t v3 = (uint64_t *)(v1 + 8);
  if ((*(unsigned char *)(v1 + 16) & 1) == 0) {
    uint64_t v3 = (uint64_t *)v1;
  }
  uint64_t v4 = *v3;
  uint64_t v5 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    sub_2396C4F10(v5, 0);
    sub_2396C4E30(keepingCapacity);
    sub_2396D1470();
    sub_2396D1440();
    return;
  }
  __break(1u);
}

unint64_t sub_2396C4D50(char a1)
{
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v3 = *v1;
    if (isUniquelyReferenced_nonNull_native)
    {
      int64_t v4 = *(void *)(v3 + 16);
      return sub_2396C615C(0, v4);
    }
    if (*(void *)(v3 + 24) >= 2uLL)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF62CA8);
      uint64_t v6 = (void *)swift_allocObject();
      size_t v7 = _swift_stdlib_malloc_size(v6);
      _OWORD v6[2] = 0;
      v6[3] = 2 * ((uint64_t)(v7 - 32) / 8);
    }
    else
    {
      uint64_t v6 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t *v1 = (uint64_t)v6;
  }
  else
  {
    uint64_t *v1 = MEMORY[0x263F8EE78];
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_2396C4E30(char a1)
{
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v3 = *v1;
    if (isUniquelyReferenced_nonNull_native)
    {
      int64_t v4 = *(void *)(v3 + 16);
      return sub_2396C606C(0, v4);
    }
    if (*(void *)(v3 + 24) >= 2uLL)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2689CBE18);
      uint64_t v6 = (void *)swift_allocObject();
      size_t v7 = _swift_stdlib_malloc_size(v6);
      _OWORD v6[2] = 0;
      v6[3] = 2 * ((uint64_t)(v7 - 32) / 4);
    }
    else
    {
      uint64_t v6 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t *v1 = (uint64_t)v6;
  }
  else
  {
    uint64_t *v1 = MEMORY[0x263F8EE78];
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_2396C4F10(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *v2;
  int64_t v4 = *((void *)*v2 + 2);
  int64_t v5 = v4 + result;
  if (__OFADD__(v4, result))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v7 = result;
  int isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v9 = *((void *)v3 + 3) >> 1, v9 < v5))
  {
    if (v4 <= v5) {
      int64_t v10 = v5;
    }
    else {
      int64_t v10 = v4;
    }
    uint64_t v3 = sub_2396C77BC(isUniquelyReferenced_nonNull_native, v10, 1, (uint64_t)v3);
    int64_t v9 = *((void *)v3 + 3) >> 1;
  }
  uint64_t v11 = *((void *)v3 + 2);
  uint64_t v12 = v9 - v11;
  uint64_t result = (uint64_t)sub_2396C5FEC(&v30, (uint64_t *)&v3[8 * v11 + 32], v9 - v11, v7, a2);
  if (result < v7) {
    goto LABEL_15;
  }
  if (result >= 1)
  {
    uint64_t v13 = *((void *)v3 + 2);
    BOOL v14 = __OFADD__(v13, result);
    uint64_t v15 = v13 + result;
    if (v14)
    {
      __break(1u);
LABEL_33:
      int64_t v25 = v5 + 1;
      goto LABEL_34;
    }
    *((void *)v3 + 2) = v15;
  }
  if (result != v12)
  {
LABEL_13:
    *uint64_t v2 = v3;
    return result;
  }
LABEL_16:
  uint64_t v16 = v32;
  uint64_t v17 = v30;
  if (v32 == v30) {
    goto LABEL_13;
  }
  int64_t v5 = *((void *)v3 + 2);
  uint64_t v18 = v31;
  uint64_t v19 = sub_2396C6450(v29, v32, v30, v31);
  uint64_t v21 = *v20;
  uint64_t result = ((uint64_t (*)(void *, void))v19)(v29, 0);
  if ((v16 & 0x8000000000000000) == 0 && v16 < v17)
  {
    uint64_t v22 = v16 + 1;
    while (1)
    {
      unint64_t v23 = *((void *)v3 + 3);
      int64_t v24 = v23 >> 1;
      int64_t v25 = v5 + 1;
      if ((uint64_t)(v23 >> 1) < v5 + 1)
      {
        uint64_t result = (uint64_t)sub_2396C77BC((char *)(v23 > 1), v5 + 1, 1, (uint64_t)v3);
        uint64_t v3 = (char *)result;
        int64_t v24 = *(void *)(result + 24) >> 1;
      }
      if (v5 < v24) {
        break;
      }
LABEL_31:
      *((void *)v3 + 2) = v5;
    }
    *(void *)&v3[8 * v5 + 32] = v21;
    if (v22 != v17)
    {
      uint64_t v26 = v22;
      while (1)
      {
        uint64_t v27 = sub_2396C6450(v29, v26, v17, v18);
        uint64_t v21 = *v28;
        uint64_t result = ((uint64_t (*)(void *, void))v27)(v29, 0);
        if (v22 < 0 || v26 >= v17) {
          break;
        }
        ++v26;
        if (v5 + 1 >= v24)
        {
          ++v5;
          uint64_t v22 = v26;
          goto LABEL_31;
        }
        *(void *)&v3[8 * v5++ + 40] = v21;
        if (v17 == v26) {
          goto LABEL_33;
        }
      }
      __break(1u);
      goto LABEL_36;
    }
LABEL_34:
    *((void *)v3 + 2) = v25;
    goto LABEL_13;
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t SparseMatrix.subscript.getter(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  OUTLINED_FUNCTION_6_97();
  if (v6) {
    uint64_t result = a2;
  }
  else {
    uint64_t result = a1;
  }
  if (v6) {
    unint64_t v8 = a1;
  }
  else {
    unint64_t v8 = a2;
  }
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v9 = *(void *)(v2 + 24);
  unint64_t v10 = *(void *)(v9 + 16);
  if (v8 >= v10)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v8 + 1 >= v10)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v11 = v9 + 32;
  uint64_t v12 = *(void *)(v11 + 8 * v8);
  uint64_t v13 = *(void *)(v11 + 8 * (v8 + 1));
  if (v12 == v13)
  {
LABEL_23:
    swift_getAssociatedConformanceWitness();
    sub_2396D1ED0();
    return sub_2396D1C40();
  }
  if (v13 < v12) {
    goto LABEL_27;
  }
  if (v12 < 0)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v14 = *(void *)(v2 + 32);
  unint64_t v15 = *(void *)(v14 + 16);
  if (v15 < v12 || (uint64_t)v15 < v13) {
    goto LABEL_29;
  }
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (result > 0x7FFFFFFF)
  {
LABEL_31:
    __break(1u);
    return result;
  }
  sub_2396C5320(result, v14, v14 + 32, v12, (2 * v13) | 1);
  if (v17) {
    goto LABEL_23;
  }

  return _s13LinearAlgebra11DenseVectorV10_uncheckedxSi_tcig_0();
}

uint64_t sub_2396C5320(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  int64_t v5 = a5 >> 1;
  if (a5 >> 1 == a4) {
    return 0;
  }
  if ((uint64_t)(a5 >> 1) > a4)
  {
    if (*(_DWORD *)(a3 + 4 * a4) == result) {
      return a4;
    }
    int64_t v6 = a4 + 1;
    while (1)
    {
      if (v5 == v6) {
        return 0;
      }
      if (v6 >= v5) {
        break;
      }
      int v7 = *(_DWORD *)(a3 + 4 * v6++);
      if (v7 == result) {
        return v6 - 1;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t SparseMatrix.subscript.setter(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void *)(a4 + 16);
  OUTLINED_FUNCTION_0_1();
  uint64_t v50 = v11;
  uint64_t v51 = v10;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_10();
  uint64_t v13 = *(uint64_t (**)(uint64_t))(*(void *)(v12 + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  OUTLINED_FUNCTION_6_97();
  if (v15) {
    uint64_t result = a3;
  }
  else {
    uint64_t result = a2;
  }
  if (!v15) {
    a2 = a3;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_46;
  }
  uint64_t v17 = v4[3];
  unint64_t v18 = *(void *)(v17 + 16);
  if (a2 >= v18)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  if (a2 + 1 >= v18)
  {
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  uint64_t v49 = a4;
  uint64_t v52 = v4;
  uint64_t v19 = v17 + 32;
  unint64_t v20 = *(void *)(v19 + 8 * a2);
  int64_t v21 = *(void *)(v19 + 8 * (a2 + 1));
  if (v20 == v21)
  {
    uint64_t v22 = result;
    swift_getAssociatedConformanceWitness();
    OUTLINED_FUNCTION_9_75();
    OUTLINED_FUNCTION_8_95();
    char v23 = OUTLINED_FUNCTION_4_101();
    uint64_t v24 = OUTLINED_FUNCTION_2_115();
    uint64_t result = v13(v24);
    if ((v23 & 1) == 0)
    {
      uint64_t v25 = v52[3];
      if (a2 < *(void *)(v25 + 16))
      {
        uint64_t v26 = *(void *)(v25 + 8 * a2 + 32);
        uint64_t v27 = a2;
        uint64_t v28 = v22;
        uint64_t v29 = v5;
        uint64_t v30 = v49;
LABEL_42:
        SparseMatrix.insert(index:major:minor:value:)(v26, v27, v28, v29, v30);
        return ((uint64_t (*)(uint64_t, uint64_t))v13)(v5, v9);
      }
      goto LABEL_55;
    }
    return ((uint64_t (*)(uint64_t, uint64_t))v13)(v5, v9);
  }
  if (v21 < (uint64_t)v20) {
    goto LABEL_48;
  }
  if ((v20 & 0x8000000000000000) != 0)
  {
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  uint64_t v31 = v4[4];
  unint64_t v32 = *(void *)(v31 + 16);
  if (v32 < v20 || (uint64_t)v32 < v21) {
    goto LABEL_50;
  }
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (result > 0x7FFFFFFF)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  uint64_t v46 = result;
  uint64_t v47 = sub_2396C5320(result, v31, v31 + 32, v20, (2 * v21) | 1);
  char v48 = v34;
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_9_75();
  OUTLINED_FUNCTION_8_95();
  char v35 = OUTLINED_FUNCTION_4_101();
  uint64_t v36 = OUTLINED_FUNCTION_2_115();
  uint64_t result = v13(v36);
  if ((v48 & 1) == 0)
  {
    if (v35)
    {
      SparseMatrix.remove(index:major:)(v47, a2);
    }
    else
    {
      uint64_t v40 = sub_2396D1470();
      sub_2396D13B0();
      uint64_t v41 = v52[5];
      sub_239636D6C(v47, v41);
      unint64_t v42 = v41 + ((*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80));
      uint64_t v5 = v51;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v50 + 24))(v42 + *(void *)(v50 + 72) * v47, v51, v9);
      nullsub_1(v40, v43);
    }
    return ((uint64_t (*)(void, void))v13)(v5, v9);
  }
  if (v35) {
    return ((uint64_t (*)(void, void))v13)(v5, v9);
  }
  uint64_t v37 = v52[4];
  unint64_t v38 = *(void *)(v37 + 16);
  if (v38 < v20 || v38 < v21) {
    goto LABEL_56;
  }
  uint64_t v28 = v46;
  if (v20 < v21)
  {
    if (*(_DWORD *)(v37 + 32 + 4 * v20) > (int)v46)
    {
LABEL_32:
      uint64_t v26 = v20;
      uint64_t v27 = a2;
      uint64_t v28 = v46;
LABEL_41:
      uint64_t v29 = v5;
      uint64_t v30 = v49;
      goto LABEL_42;
    }
    if (v20 + 1 == v21)
    {
LABEL_40:
      uint64_t v26 = v21;
      uint64_t v27 = a2;
      goto LABEL_41;
    }
    uint64_t v44 = v37 + 36;
    while ((uint64_t)(v20 + 1) < v21)
    {
      if (*(_DWORD *)(v44 + 4 * v20) > (int)v46)
      {
        ++v20;
        goto LABEL_32;
      }
      unint64_t v45 = v20 + 2;
      if (__OFADD__(v20 + 1, 1)) {
        goto LABEL_54;
      }
      ++v20;
      if (v45 == v21) {
        goto LABEL_40;
      }
    }
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
  }
  __break(1u);
  return result;
}

void SparseMatrix.insert(index:major:minor:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v10 = *(void *)(a5 + 16);
  OUTLINED_FUNCTION_0_1();
  uint64_t v12 = v11;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_10();
  uint64_t v17 = v16 - v15;
  if (v14 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_19;
  }
  if (v14 > 0x7FFFFFFF) {
    goto LABEL_20;
  }
  if (*(void *)(*(void *)(v5 + 32) + 16) < a1) {
    goto LABEL_21;
  }
  if (a1 < 0) {
    goto LABEL_22;
  }
  sub_2396C6260(a1, a1, v14);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v17, a4, v10);
  sub_2396D1470();
  sub_2396D1420();
  uint64_t v18 = a2 + 1;
  if (__OFADD__(a2, 1)) {
    goto LABEL_23;
  }
  uint64_t v19 = *(void *)(v5 + 24);
  a1 = *(void *)(v19 + 16);
  if (a1 < v18) {
    goto LABEL_24;
  }
  if (v18 != a1)
  {
    if (v18 >= a1) {
      goto LABEL_25;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_26;
    }
    while (a2 + 1 >= 0)
    {
      if ((unint64_t)(a2 + 1) >= *(void *)(v19 + 16)) {
        goto LABEL_17;
      }
      uint64_t v20 = v19 + 8 * a2;
      uint64_t v21 = *(void *)(v20 + 40);
      BOOL v22 = __OFADD__(v21, 1);
      uint64_t v23 = v21 + 1;
      if (v22)
      {
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        sub_23962FB5C();
        uint64_t v19 = v24;
      }
      else
      {
        *(void *)(v20 + 40) = v23;
        if (a1 - 1 == ++a2)
        {
          *(void *)(v6 + 24) = v19;
          return;
        }
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
}

Swift::Void __swiftcall SparseMatrix.remove(index:major:)(Swift::Int index, Swift::Int major)
{
  uint64_t v4 = v3;
  uint64_t v7 = *(void *)(v2 + 16);
  OUTLINED_FUNCTION_0_1();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_10();
  uint64_t v13 = v12 - v11;
  sub_2396C5BF0(v14);
  sub_2396D1470();
  sub_2396D1430();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v7);
  Swift::Int v15 = major + 1;
  if (__OFADD__(major, 1)) {
    goto LABEL_15;
  }
  uint64_t v16 = *(void *)(v3 + 24);
  index = *(void *)(v16 + 16);
  if (index < v15) {
    goto LABEL_16;
  }
  if (v15 != index)
  {
    if (v15 >= index) {
      goto LABEL_17;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_18;
    }
    while (major + 1 >= 0)
    {
      if ((unint64_t)(major + 1) >= *(void *)(v16 + 16)) {
        goto LABEL_13;
      }
      Swift::Int v17 = v16 + 8 * major;
      uint64_t v18 = *(void *)(v17 + 40);
      BOOL v19 = __OFSUB__(v18, 1);
      uint64_t v20 = v18 - 1;
      if (v19)
      {
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
LABEL_16:
        __break(1u);
LABEL_17:
        __break(1u);
LABEL_18:
        sub_23962FB5C();
        uint64_t v16 = v21;
      }
      else
      {
        *(void *)(v17 + 40) = v20;
        if (index - 1 == ++major)
        {
          *(void *)(v4 + 24) = v16;
          return;
        }
      }
    }
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
}

void (*SparseMatrix.subscript.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t *a1, char a2)
{
  uint64_t v9 = malloc(0x70uLL);
  *a1 = v9;
  v9[8] = a4;
  v9[9] = v4;
  v9[6] = a2;
  v9[7] = a3;
  v9[10] = *(void *)(a4 + 16);
  OUTLINED_FUNCTION_0_1();
  *(void *)(v10 + 88) = v11;
  size_t v13 = *(void *)(v12 + 64);
  v9[12] = malloc(v13);
  v9[13] = malloc(v13);
  long long v14 = v4[1];
  *(_OWORD *)uint64_t v9 = *v4;
  *((_OWORD *)v9 + 1) = v14;
  *((_OWORD *)v9 + 2) = v4[2];
  SparseMatrix.subscript.getter(a2, a3);
  return sub_2396C5B54;
}

void sub_2396C5B54(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void **)(*a1 + 96);
  uint64_t v4 = *(void **)(*a1 + 104);
  if (a2)
  {
    uint64_t v5 = OUTLINED_FUNCTION_1_106();
    v6(v5);
    OUTLINED_FUNCTION_10_86();
    uint64_t v7 = OUTLINED_FUNCTION_5_5();
    v8(v7);
  }
  else
  {
    SparseMatrix.subscript.setter(*(void *)(*a1 + 104), *(void *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 64));
  }
  free(v4);
  free(v3);

  free((void *)v2);
}

void sub_2396C5BF0(unint64_t a1)
{
  uint64_t v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_2396C6358();
    uint64_t v3 = v6;
  }
  unint64_t v4 = *(void *)(v3 + 16);
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v4 - 1;
    sub_2394B938C((char *)(v3 + 4 * a1 + 36), v4 - 1 - a1, (char *)(v3 + 4 * a1 + 32));
    *(void *)(v3 + 16) = v5;
    uint64_t *v1 = v3;
  }
}

double SparseMatrix.transposed()@<D0>(_OWORD *a1@<X8>)
{
  SparseMatrix.Transpose.init(base:)((uint64_t)v1, (uint64_t)v6);
  uint64_t v3 = v1[3];
  uint64_t v9 = v1[4];
  uint64_t v10 = v3;
  uint64_t v8 = v1[5];
  sub_239518224((uint64_t)&v10);
  sub_239518224((uint64_t)&v9);
  sub_2396C3D74((uint64_t)&v8);
  long long v4 = v6[1];
  *a1 = v6[0];
  a1[1] = v4;
  double result = *(double *)&v7;
  a1[2] = v7;
  return result;
}

uint64_t static SparseMatrix.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2
    || *(void *)(a1 + 8) != *(void *)(a2 + 8)
    || *(unsigned __int8 *)(a1 + 16) != *(unsigned __int8 *)(a2 + 16)
    || (sub_2393F3A2C(*(void **)(a1 + 24), *(void **)(a2 + 24)) & 1) == 0
    || !sub_2396C70C4(*(void *)(a1 + 32), *(void *)(a2 + 32)))
  {
    return 0;
  }

  return sub_2396D1480();
}

double sub_2396C5D9C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  SparseMatrix.init(rowCount:columnCount:)(a1, a2, v6);
  long long v4 = v6[1];
  *a3 = v6[0];
  a3[1] = v4;
  double result = *(double *)&v7;
  a3[2] = v7;
  return result;
}

double sub_2396C5DE4@<D0>(_OWORD *a1@<X8>)
{
  long long v3 = v1[1];
  long long v8 = *v1;
  long long v9 = v3;
  long long v10 = v1[2];
  SparseMatrix.transposed()(v6);
  long long v4 = v6[1];
  *a1 = v6[0];
  a1[1] = v4;
  double result = *(double *)&v7;
  a1[2] = v7;
  return result;
}

void (*sub_2396C5E40(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t *a1, char a2)
{
  long long v9 = malloc(0x70uLL);
  *a1 = v9;
  v9[8] = v4;
  v9[9] = a4;
  v9[6] = a2;
  v9[7] = a3;
  uint64_t v10 = *(void *)(a4 + 16);
  v9[10] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v9[11] = v11;
  size_t v12 = *(void *)(v11 + 64);
  v9[12] = malloc(v12);
  v9[13] = malloc(v12);
  long long v13 = v4[1];
  *(_OWORD *)long long v9 = *v4;
  *((_OWORD *)v9 + 1) = v13;
  *((_OWORD *)v9 + 2) = v4[2];
  SparseMatrix.subscript.getter(a2, a3);
  return sub_2396C5F44;
}

void sub_2396C5F44(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  long long v3 = *(void **)(*a1 + 96);
  long long v4 = *(void **)(*a1 + 104);
  if (a2)
  {
    uint64_t v5 = OUTLINED_FUNCTION_1_106();
    v6(v5);
    OUTLINED_FUNCTION_10_86();
    uint64_t v7 = OUTLINED_FUNCTION_5_5();
    v8(v7);
  }
  else
  {
    SparseMatrix.subscript.setter(*(void *)(*a1 + 104), *(void *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 72));
  }
  free(v4);
  free(v3);

  free((void *)v2);
}

uint64_t sub_2396C5FE0(uint64_t a1, uint64_t a2)
{
  return static SparseMatrix.__derived_struct_equals(_:_:)(a1, a2);
}

uint64_t *sub_2396C5FEC(uint64_t *result, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  if (!a3) {
    goto LABEL_11;
  }
  if (a3 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v5 = a4;
  if (!a4)
  {
LABEL_13:
    *double result = a4;
    result[1] = a5;
    result[2] = v5;
    return (uint64_t *)v5;
  }
  if (a4 >= 1)
  {
    *a2 = a5;
    if (a3 != 1)
    {
      uint64_t v6 = 1;
      while (a3 != v6)
      {
        if (a4 == v6)
        {
          uint64_t v5 = a4;
          goto LABEL_13;
        }
        a2[v6++] = a5;
        if (a3 == v6) {
          goto LABEL_11;
        }
      }
      __break(1u);
      goto LABEL_16;
    }
LABEL_11:
    uint64_t v5 = a3;
    goto LABEL_13;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_2396C606C(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  double result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v9 <= *(void *)(v4 + 24) >> 1)
  {
    if (!v8) {
      goto LABEL_17;
    }
  }
  else
  {
    if (v5 <= v9) {
      int64_t v10 = v5 + v8;
    }
    else {
      int64_t v10 = v5;
    }
    double result = (uint64_t)sub_2396C77D4((char *)result, v10, 1, v4);
    uint64_t v4 = result;
    if (!v8) {
      goto LABEL_17;
    }
  }
  uint64_t v11 = *(void *)(v4 + 16);
  if (__OFSUB__(v11, a2)) {
    goto LABEL_23;
  }
  double result = (uint64_t)sub_2396BB318((char *)(v4 + 32 + 4 * a2), v11 - a2, (char *)(v4 + 32 + 4 * v6));
  uint64_t v12 = *(void *)(v4 + 16);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    *(void *)(v4 + 16) = v14;
LABEL_17:
    *uint64_t v2 = v4;
    return result;
  }
LABEL_24:
  __break(1u);
  return result;
}

unint64_t sub_2396C615C(unint64_t result, int64_t a2)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  unint64_t v6 = result;
  unint64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  double result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v9 <= *(void *)(v4 + 24) >> 1)
  {
    if (!v8) {
      goto LABEL_22;
    }
  }
  else
  {
    if (v5 <= v9) {
      int64_t v10 = v5 + v8;
    }
    else {
      int64_t v10 = v5;
    }
    double result = (unint64_t)sub_2396C77BC((char *)result, v10, 1, v4);
    uint64_t v4 = result;
    if (!v8) {
      goto LABEL_22;
    }
  }
  uint64_t v11 = *(void *)(v4 + 16);
  uint64_t v12 = v11 - a2;
  if (__OFSUB__(v11, a2)) {
    goto LABEL_28;
  }
  BOOL v13 = (const void *)(v4 + 32 + 8 * a2);
  double result = v4 + 32 + 8 * v6;
  if (v6 != a2 || (unint64_t)v13 + 8 * v12 <= result)
  {
    double result = (unint64_t)memmove((void *)result, v13, 8 * v12);
    uint64_t v11 = *(void *)(v4 + 16);
  }
  BOOL v15 = __OFADD__(v11, v8);
  uint64_t v16 = v11 + v8;
  if (!v15)
  {
    *(void *)(v4 + 16) = v16;
LABEL_22:
    *uint64_t v2 = v4;
    return result;
  }
LABEL_29:
  __break(1u);
  return result;
}

void sub_2396C6260(uint64_t a1, uint64_t a2, int a3)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v8 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(v6, v9))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v6 + v9 > *(void *)(v5 + 24) >> 1)
  {
    sub_2394B7734();
    uint64_t v5 = v11;
  }
  uint64_t v12 = v5 + 32 + 4 * a1;
  if (!v9) {
    goto LABEL_13;
  }
  uint64_t v13 = *(void *)(v5 + 16);
  if (__OFSUB__(v13, a2)) {
    goto LABEL_19;
  }
  sub_2394B938C((char *)(v5 + 32 + 4 * a2), v13 - a2, (char *)(v12 + 4));
  uint64_t v14 = *(void *)(v5 + 16);
  BOOL v15 = __OFADD__(v14, v9);
  uint64_t v16 = v14 + v9;
  if (!v15)
  {
    *(void *)(v5 + 16) = v16;
LABEL_13:
    *(_DWORD *)uint64_t v12 = a3;
    *long long v3 = v5;
    return;
  }
LABEL_20:
  __break(1u);
}

void sub_2396C6358()
{
}

char *sub_2396C636C(char *__src, uint64_t a2, char *__dst)
{
  if (__dst != __src || &__src[8 * a2] <= __dst) {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_2396C6398(uint64_t result, uint64_t a2)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else if (a2)
  {
    uint64_t v3 = result;
    double result = sub_2396D0870();
    uint64_t v4 = 0;
    *(void *)(result + 16) = a2;
    do
    {
      uint64_t v5 = result + 8 * v4++;
      *(void *)(v5 + 32) = v3;
    }
    while (a2 != v4);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_2396C6400()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396C641C()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for SparseMatrix()
{
  return __swift_instantiateGenericMetadata();
}

void *sub_2396C6450(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 < 0 || a2 >= a3)
  {
    __break(1u);
  }
  else
  {
    *double result = a4;
    return nullsub_1;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_106()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_3_111()
{
  return sub_2396D0920();
}

uint64_t OUTLINED_FUNCTION_8_95()
{
  return sub_2396D1C40();
}

uint64_t OUTLINED_FUNCTION_10_86()
{
  return SparseMatrix.subscript.setter(v0, v3, v2, v1);
}

uint64_t OUTLINED_FUNCTION_11_75()
{
  return sub_2396D0950();
}

uint64_t sub_2396C6554@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = LowerStrictlyTriangularMatrix.indexed()();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return result;
}

uint64_t LowerStrictlyTriangularMatrix.indexed()()
{
  return OUTLINED_FUNCTION_3_106();
}

uint64_t LowerStrictlyTriangularMatrix.IndexedSequence.base.getter()
{
  return OUTLINED_FUNCTION_3_106();
}

uint64_t LowerStrictlyTriangularMatrix.IndexedSequence.makeIterator()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  a5[5] = 0;
  a5[6] = 0;
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  a5[4] = 1;
  swift_retain();

  return sub_2396D0110();
}

uint64_t LowerStrictlyTriangularMatrix.IndexedSequence.Iterator.init(base:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  a5[5] = 0;
  a5[6] = 0;
  a5[4] = 1;
  return result;
}

uint64_t sub_2396C665C@<X0>(void *a1@<X8>)
{
  LowerStrictlyTriangularMatrix.IndexedSequence.makeIterator()(*v1, v1[1], v1[2], v1[3], a1);
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t LowerStrictlyTriangularMatrix.IndexedSequence.Iterator.base.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  sub_2396D0110();
  return v1;
}

uint64_t LowerStrictlyTriangularMatrix.IndexedSequence.Iterator.row.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t LowerStrictlyTriangularMatrix.IndexedSequence.Iterator.row.setter(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t (*LowerStrictlyTriangularMatrix.IndexedSequence.Iterator.row.modify())(void, void)
{
  return nullsub_1;
}

uint64_t LowerStrictlyTriangularMatrix.IndexedSequence.Iterator.column.getter()
{
  return *(void *)(v0 + 40);
}

uint64_t LowerStrictlyTriangularMatrix.IndexedSequence.Iterator.column.setter(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

uint64_t (*LowerStrictlyTriangularMatrix.IndexedSequence.Iterator.column.modify())(void, void)
{
  return nullsub_1;
}

uint64_t LowerStrictlyTriangularMatrix.IndexedSequence.Iterator.flatIndex.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t LowerStrictlyTriangularMatrix.IndexedSequence.Iterator.flatIndex.setter(uint64_t result)
{
  *(void *)(v1 + 48) = result;
  return result;
}

uint64_t (*LowerStrictlyTriangularMatrix.IndexedSequence.Iterator.flatIndex.modify())(void, void)
{
  return nullsub_1;
}

uint64_t LowerStrictlyTriangularMatrix.IndexedSequence.Iterator.next()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  MEMORY[0x270FA5388](TupleTypeMetadata3);
  unint64_t v7 = (char *)&v23 - v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v2[5];
  if (v12 < v2[1])
  {
    uint64_t v13 = v2[4];
    uint64_t v14 = *v2;
    if (v13 < *v2)
    {
      uint64_t v25 = v9;
      uint64_t v26 = v13;
      uint64_t v15 = v2[6];
      swift_retain();
      uint64_t v24 = v15;
      uint64_t v16 = v25;
      _s13LinearAlgebra11DenseVectorV10_uncheckedxSi_tcig_0();
      swift_release();
      Swift::Int v17 = &v7[*(int *)(TupleTypeMetadata3 + 64)];
      uint64_t v18 = *(uint64_t (**)(char *, char *, uint64_t))(v16 + 32);
      uint64_t result = v18(v17, v11, v4);
      uint64_t v20 = v26;
      uint64_t v21 = v26 + 1;
      v2[4] = v26 + 1;
      if (v21 == v14)
      {
        v2[5] = v12 + 1;
        if (__OFADD__(v12, 2))
        {
LABEL_12:
          __break(1u);
          return result;
        }
        v2[4] = v12 + 2;
      }
      if (!__OFADD__(v24, 1))
      {
        v2[6] = v24 + 1;
        BOOL v22 = (char *)a2 + *(int *)(TupleTypeMetadata3 + 64);
        *a2 = v20;
        a2[1] = v12;
        v18(v22, v17, v4);
        return __swift_storeEnumTagSinglePayload((uint64_t)a2, 0, 1, TupleTypeMetadata3);
      }
      __break(1u);
      goto LABEL_12;
    }
  }

  return __swift_storeEnumTagSinglePayload((uint64_t)a2, 1, 1, TupleTypeMetadata3);
}

uint64_t sub_2396C69D0()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for LowerStrictlyTriangularMatrix.IndexedSequence()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for LowerStrictlyTriangularMatrix.IndexedSequence.Iterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t UpperStrictlyTriangularMatrix.unordered.getter()
{
  return sub_2396D0950();
}

void UpperStrictlyTriangularMatrix.init(rowCount:columnCount:)()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  swift_getAssociatedConformanceWitness();
  sub_2396D1ED0();
  uint64_t v9 = v1;
  sub_2396D1C40();
  static UpperStrictlyTriangularMatrix.dataSize(_:_:)(v5, v3);
  uint64_t v10 = sub_2396D1450();
  if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = (char *)MEMORY[0x263F8EE78];
    if (!v5)
    {
LABEL_8:
      unint64_t v7 = (char *)sub_2396D1400();
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_9;
      }
      goto LABEL_14;
    }
    v17[1] = v10;
    uint64_t v20 = (char *)MEMORY[0x263F8EE78];
    sub_2396C7BA4(0, v5, 0);
    uint64_t v11 = 0;
    unint64_t v7 = 0;
    uint64_t v9 = v20;
    while (v5 != v11)
    {
      uint64_t v18 = v11;
      sub_2396C7244(&v18, v3, &v19);
      uint64_t v12 = v19;
      uint64_t v20 = v9;
      unint64_t v14 = *((void *)v9 + 2);
      unint64_t v13 = *((void *)v9 + 3);
      if (v14 >= v13 >> 1)
      {
        sub_2396C7BA4(v13 > 1, v14 + 1, 1);
        uint64_t v9 = v20;
      }
      ++v11;
      *((void *)v9 + 2) = v14 + 1;
      *(void *)&v9[8 * v14 + 32] = v12;
      if (v5 == v11) {
        goto LABEL_8;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_14:
  uint64_t v9 = sub_2396C77EC(0, *((void *)v9 + 2) + 1, 1, (uint64_t)v9, (void (*)(uint64_t, uint64_t, char *))sub_2396C636C);
LABEL_9:
  unint64_t v16 = *((void *)v9 + 2);
  unint64_t v15 = *((void *)v9 + 3);
  if (v16 >= v15 >> 1) {
    uint64_t v9 = sub_2396C77EC((char *)(v15 > 1), v16 + 1, 1, (uint64_t)v9, (void (*)(uint64_t, uint64_t, char *))sub_2396C636C);
  }
  *((void *)v9 + 2) = v16 + 1;
  *(void *)&v9[8 * v16 + 32] = v7;
  OUTLINED_FUNCTION_4_1();
}

void UpperStrictlyTriangularMatrix.subscript.getter()
{
  OUTLINED_FUNCTION_5_1();
  Swift::Int v1 = v0;
  Swift::Int v3 = v2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  UpperStrictlyTriangularMatrix.checkBounds(row:column:)(v3, v1);
  if (v3 >= v1)
  {
    swift_getAssociatedConformanceWitness();
    sub_2396D1ED0();
    sub_2396D1C40();
    OUTLINED_FUNCTION_4_1();
  }
  else
  {
    UpperStrictlyTriangularMatrix.dataIndex(_:_:)(v3, v1);
    OUTLINED_FUNCTION_4_1();
    _s13LinearAlgebra11DenseVectorV10_uncheckedxSi_tcig_0();
  }
}

uint64_t UpperStrictlyTriangularMatrix.subscript.setter(uint64_t a1, Swift::Int row, Swift::Int column, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v9 = *(void *)(a4 + 16);
  UpperStrictlyTriangularMatrix.checkBounds(row:column:)(row, column);
  if (row >= column)
  {
    uint64_t result = sub_2396D1650();
    __break(1u);
  }
  else
  {
    Swift::Int v10 = UpperStrictlyTriangularMatrix.dataIndex(_:_:)(row, column);
    sub_2396D1470();
    sub_2396D13B0();
    uint64_t v11 = *(void *)(v4 + 16);
    sub_239636D6C(v10, *(void *)(v5 + 16));
    OUTLINED_FUNCTION_0_1();
    uint64_t v16 = v12;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v12 + 24))(v11+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(void *)(v13 + 72) * v10, a1, v9);
    unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 8);
    return v14(a1, v9);
  }
  return result;
}

uint64_t static UpperStrictlyTriangularMatrix.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  BOOL v8 = a1 == a5 && a2 == a6;
  if (!v8 || (sub_2396D1480() & 1) == 0) {
    return 0;
  }

  return sub_2393F3A2C(a4, a8);
}

BOOL sub_2396C70C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32)) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  uint64_t v5 = (int *)(a1 + 36);
  uint64_t v6 = (int *)(a2 + 36);
  do
  {
    int v8 = *v5++;
    int v7 = v8;
    int v10 = *v6++;
    int v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

uint64_t UpperStrictlyTriangularMatrix.columnCount.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t UpperStrictlyTriangularMatrix.storage.getter()
{
  return swift_retain();
}

uint64_t UpperStrictlyTriangularMatrix.storage.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*UpperStrictlyTriangularMatrix.storage.modify())(void, void)
{
  return nullsub_1;
}

uint64_t UpperStrictlyTriangularMatrix.rowStartIndices.getter()
{
  return sub_2396D0110();
}

uint64_t UpperStrictlyTriangularMatrix.rowStartIndices.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*UpperStrictlyTriangularMatrix.rowStartIndices.modify())(void, void)
{
  return nullsub_1;
}

uint64_t static UpperStrictlyTriangularMatrix.dataSize(_:_:)(uint64_t result, uint64_t a2)
{
  uint64_t v2 = a2 - 1;
  if (__OFSUB__(a2, 1))
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v3 = v2 * result;
  if ((unsigned __int128)(v2 * (__int128)result) >> 64 != (v2 * result) >> 63)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = result - 1;
  if (__OFSUB__(result, 1))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((unsigned __int128)(result * (__int128)v4) >> 64 != (result * v4) >> 63)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v5 = result * v4 / 2;
  uint64_t result = v3 - v5;
  if (__OFSUB__(v3, v5)) {
LABEL_11:
  }
    __break(1u);
  return result;
}

uint64_t sub_2396C7244@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t result = static UpperStrictlyTriangularMatrix.dataSize(_:_:)(*a1, a2);
  if (__OFSUB__(result, v4)) {
    __break(1u);
  }
  else {
    *a3 = result - v4;
  }
  return result;
}

Swift::Void __swiftcall UpperStrictlyTriangularMatrix.checkBounds(row:column:)(Swift::Int row, Swift::Int column)
{
  if (row < 0 || row >= v2 || column < 0 || column >= v3)
  {
    sub_2396D1650();
    __break(1u);
  }
}

Swift::Int __swiftcall UpperStrictlyTriangularMatrix.dataIndex(_:_:)(Swift::Int result, Swift::Int a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (*(void *)(v2 + 16) <= (unint64_t)result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  Swift::Int v3 = a2 - 1;
  if (__OFSUB__(a2, 1))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = *(void *)(v2 + 8 * result + 32);
  uint64_t result = v4 + v3;
  if (__OFADD__(v4, v3)) {
LABEL_9:
  }
    __break(1u);
  return result;
}

void (*UpperStrictlyTriangularMatrix.subscript.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  int v9 = malloc(0x40uLL);
  *a1 = v9;
  _OWORD v9[2] = a4;
  v9[3] = v4;
  *int v9 = a2;
  v9[1] = a3;
  v9[4] = *(void *)(a4 + 16);
  OUTLINED_FUNCTION_0_1();
  *(void *)(v10 + 40) = v11;
  size_t v13 = *(void *)(v12 + 64);
  v9[6] = malloc(v13);
  v9[7] = malloc(v13);
  UpperStrictlyTriangularMatrix.subscript.getter();
  return sub_2396C746C;
}

void sub_2396C746C()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v1 = (void *)(*v0)[6];
  uint64_t v2 = (void *)(*v0)[7];
  if (v3)
  {
    uint64_t v4 = OUTLINED_FUNCTION_2_116();
    v5(v4);
    OUTLINED_FUNCTION_6_98();
    uint64_t v6 = OUTLINED_FUNCTION_5_5();
    v7(v6);
  }
  else
  {
    UpperStrictlyTriangularMatrix.subscript.setter((*v0)[7], **v0, (*v0)[1], (*v0)[2]);
  }
  free(v2);
  free(v1);
  OUTLINED_FUNCTION_4_1();
  free(v8);
}

uint64_t UpperStrictlyTriangularMatrix.transposed()()
{
  uint64_t v0 = LowerStrictlyTriangularMatrix.init(base:)();
  swift_retain();
  sub_2396D0110();
  return v0;
}

void sub_2396C7560(void *a1@<X8>)
{
  UpperStrictlyTriangularMatrix.init(rowCount:columnCount:)();
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
}

uint64_t sub_2396C7594@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = UpperStrictlyTriangularMatrix.transposed()();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return result;
}

void sub_2396C75D0()
{
}

void (*sub_2396C75E8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  uint64_t v9 = malloc(0x40uLL);
  *a1 = v9;
  _OWORD v9[2] = v4;
  v9[3] = a4;
  *uint64_t v9 = a2;
  v9[1] = a3;
  uint64_t v10 = *(void *)(a4 + 16);
  v9[4] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v9[5] = v11;
  size_t v12 = *(void *)(v11 + 64);
  v9[6] = malloc(v12);
  v9[7] = malloc(v12);
  UpperStrictlyTriangularMatrix.subscript.getter();
  return sub_2396C76E8;
}

void sub_2396C76E8()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v1 = (void *)(*v0)[6];
  uint64_t v2 = (void *)(*v0)[7];
  if (v3)
  {
    uint64_t v4 = OUTLINED_FUNCTION_2_116();
    v5(v4);
    OUTLINED_FUNCTION_6_98();
    uint64_t v6 = OUTLINED_FUNCTION_5_5();
    v7(v6);
  }
  else
  {
    UpperStrictlyTriangularMatrix.subscript.setter((*v0)[7], **v0, (*v0)[1], (*v0)[3]);
  }
  free(v2);
  free(v1);
  OUTLINED_FUNCTION_4_1();
  free(v8);
}

uint64_t sub_2396C7774(uint64_t a1, uint64_t a2)
{
  return static UpperStrictlyTriangularMatrix.__derived_struct_equals(_:_:)(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void **)(a1 + 24), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(void **)(a2 + 24)) & 1;
}

char *sub_2396C77BC(char *a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_2396C77EC(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, char *))sub_2396C636C);
}

char *sub_2396C77D4(char *a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_2396C78EC(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, char *))sub_2396BB318);
}

char *sub_2396C77EC(char *result, int64_t a2, char a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, char *))
{
  char v7 = (char)result;
  if (a3)
  {
    unint64_t v8 = *(void *)(a4 + 24);
    uint64_t v9 = v8 >> 1;
    if ((uint64_t)(v8 >> 1) < a2)
    {
      if (v9 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v8 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v9 = a2;
      }
    }
  }
  else
  {
    uint64_t v9 = a2;
  }
  uint64_t v10 = *(void *)(a4 + 16);
  if (v9 <= v10) {
    uint64_t v11 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v11 = v9;
  }
  if (v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF62CA8);
    size_t v12 = (char *)swift_allocObject();
    size_t v13 = _swift_stdlib_malloc_size(v12);
    *((void *)v12 + 2) = v10;
    *((void *)v12 + 3) = 2 * ((uint64_t)(v13 - 32) / 8);
  }
  else
  {
    size_t v12 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v14 = v12 + 32;
  if (v7)
  {
    a5(a4 + 32, v10, v14);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2396C79EC(0, v10, v14, a4);
  }
  return v12;
}

char *sub_2396C78EC(char *result, int64_t a2, char a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, char *))
{
  char v7 = (char)result;
  if (a3)
  {
    unint64_t v8 = *(void *)(a4 + 24);
    uint64_t v9 = v8 >> 1;
    if ((uint64_t)(v8 >> 1) < a2)
    {
      if (v9 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v8 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v9 = a2;
      }
    }
  }
  else
  {
    uint64_t v9 = a2;
  }
  uint64_t v10 = *(void *)(a4 + 16);
  if (v9 <= v10) {
    uint64_t v11 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v11 = v9;
  }
  if (v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689CBE18);
    size_t v12 = (char *)swift_allocObject();
    size_t v13 = _swift_stdlib_malloc_size(v12);
    *((void *)v12 + 2) = v10;
    *((void *)v12 + 3) = 2 * ((uint64_t)(v13 - 32) / 4);
  }
  else
  {
    size_t v12 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v14 = v12 + 32;
  if (v7)
  {
    a5(a4 + 32, v10, v14);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2396C7AC8(0, v10, v14, a4);
  }
  return v12;
}

char *sub_2396C79EC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    uint64_t v6 = &__dst[8 * v4];
    if (v5 >= v6 || &v5[8 * v4] <= __dst)
    {
      memcpy(__dst, v5, 8 * v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  OUTLINED_FUNCTION_5_4();
  uint64_t result = (char *)sub_2396D1750();
  __break(1u);
  return result;
}

char *sub_2396C7AC8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    uint64_t v6 = &__dst[4 * v4];
    if (v5 >= v6 || &v5[4 * v4] <= __dst)
    {
      memcpy(__dst, v5, 4 * v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  OUTLINED_FUNCTION_5_4();
  uint64_t result = (char *)sub_2396D1750();
  __break(1u);
  return result;
}

void sub_2396C7BA4(char a1, uint64_t a2, char a3)
{
  sub_2396BB38C(a1, a2, a3, *v3);
  *char v3 = v4;
}

uint64_t sub_2396C7BC4()
{
  return swift_getWitnessTable();
}

uint64_t sub_2396C7BE0()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for UpperStrictlyTriangularMatrix()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t OUTLINED_FUNCTION_6_98()
{
  return UpperStrictlyTriangularMatrix.subscript.setter(v0, v3, v2, v1);
}

__n128 SparseMatrix.Transpose.init(base:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 40);
  char v3 = *(unsigned char *)(a1 + 16) & 1;
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(unsigned char *)(a2 + 16) = v3;
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(a2 + 24) = result;
  *(void *)(a2 + 40) = v2;
  return result;
}

uint64_t SparseMatrix.Transpose.base.getter@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_0_59(a1);
  sub_2396D0110();

  return swift_retain();
}

__n128 SparseMatrix.Transpose.base.setter(uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[5];
  char v6 = a1[2] & 1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  *(void *)uint64_t v1 = v3;
  *(void *)(v1 + 8) = v4;
  *(unsigned char *)(v1 + 16) = v6;
  __n128 result = *(__n128 *)(a1 + 3);
  *(__n128 *)(v1 + 24) = result;
  *(void *)(v1 + 40) = v5;
  return result;
}

uint64_t (*SparseMatrix.Transpose.base.modify())(void, void)
{
  return nullsub_1;
}

uint64_t SparseMatrix.Transpose.rowCount.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t SparseMatrix.Transpose.columnCount.getter()
{
  return *(void *)v0;
}

uint64_t SparseMatrix.Transpose.count.getter()
{
  return SparseMatrix.count.getter();
}

__n128 SparseMatrix.Transpose.init(rowCount:columnCount:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  SparseMatrix.init(rowCount:columnCount:)(a2, a1, &v7);
  char v4 = v8;
  uint64_t v5 = v10;
  __n128 result = v9;
  *(_OWORD *)a3 = v7;
  *(unsigned char *)(a3 + 16) = v4;
  *(__n128 *)(a3 + 24) = result;
  *(void *)(a3 + 40) = v5;
  return result;
}

void (*SparseMatrix.Transpose.subscript.read(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1)
{
  char v8 = malloc(0x48uLL);
  *a1 = v8;
  v8[6] = *(void *)(a4 + 16);
  OUTLINED_FUNCTION_0_1();
  *(void *)(v9 + 56) = v10;
  v8[8] = malloc(*(void *)(v11 + 64));
  OUTLINED_FUNCTION_2_117();
  type metadata accessor for SparseMatrix();
  SparseMatrix.subscript.getter(a3, a2);
  return sub_2396C7EA4;
}

void sub_2396C7EA4(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void **)(*(void *)a1 + 64);
  (*(void (**)(void *, void))(*(void *)(*(void *)a1 + 56) + 8))(v2, *(void *)(*(void *)a1 + 48));
  free(v2);

  free(v1);
}

void (*SparseMatrix.Transpose.subscript.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(unint64_t **a1, char a2)
{
  uint64_t v9 = malloc(0x70uLL);
  *a1 = v9;
  v9[6] = a2;
  v9[7] = a3;
  uint64_t v10 = *(void *)(a4 + 16);
  v9[8] = v4;
  v9[9] = v10;
  OUTLINED_FUNCTION_0_1();
  *(void *)(v11 + 80) = v12;
  size_t v14 = *(void *)(v13 + 64);
  v9[11] = malloc(v14);
  v9[12] = malloc(v14);
  OUTLINED_FUNCTION_2_117();
  v9[13] = type metadata accessor for SparseMatrix();
  SparseMatrix.subscript.getter(a3, a2);
  return sub_2396C7FE4;
}

void sub_2396C7FE4(unint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[12];
  uint64_t v4 = (*a1)[13];
  uint64_t v5 = (void *)(*a1)[11];
  if (a2)
  {
    unint64_t v6 = v2[9];
    unint64_t v7 = v2[10];
    unint64_t v8 = v2[7];
    unint64_t v9 = v2[6];
    (*(void (**)(unint64_t, void *, unint64_t))(v7 + 16))((*a1)[11], v3, v6);
    SparseMatrix.subscript.setter((uint64_t)v5, v8, v9, v4);
    (*(void (**)(void *, unint64_t))(v7 + 8))(v3, v6);
  }
  else
  {
    SparseMatrix.subscript.setter((*a1)[12], v2[7], v2[6], v4);
  }
  free(v3);
  free(v5);

  free(v2);
}

uint64_t SparseMatrix.Transpose.subscript.getter(uint64_t a1, uint64_t a2)
{
  return SparseMatrix.subscript.getter(a2, a1);
}

uint64_t SparseMatrix.Transpose.subscript.setter(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(a4 + 16);
  OUTLINED_FUNCTION_0_1();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v14 = v4[1];
  v17[0] = *v4;
  v17[1] = v14;
  void v17[2] = v4[2];
  uint64_t v15 = type metadata accessor for SparseMatrix();
  SparseMatrix.subscript.getter(a3, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 24))(v13, a1, v8);
  SparseMatrix.subscript.setter((uint64_t)v13, a3, a2, v15);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(a1, v8);
}

uint64_t SparseMatrix.Transpose.transposed()@<X0>(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_0_59(a1);
  sub_2396D0110();

  return swift_retain();
}

uint64_t static SparseMatrix.Transpose.__derived_struct_equals(_:_:)(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  v6[0] = *a1;
  v6[1] = v2;
  _OWORD v6[2] = a1[2];
  long long v3 = a2[1];
  v5[0] = *a2;
  v5[1] = v3;
  v5[2] = a2[2];
  return static SparseMatrix.__derived_struct_equals(_:_:)((uint64_t)v6, (uint64_t)v5) & 1;
}

uint64_t sub_2396C82E0()
{
  return swift_getWitnessTable();
}

double sub_2396C8304@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  SparseMatrix.Transpose.init(rowCount:columnCount:)(a1, a2, (uint64_t)v6);
  long long v4 = v6[1];
  *a3 = v6[0];
  a3[1] = v4;
  double result = *(double *)&v7;
  a3[2] = v7;
  return result;
}

uint64_t sub_2396C8350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6 = SparseMatrix.Transpose.subscript.read(v8, a1, a2, a3);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a4);
  return ((uint64_t (*)(void *, void))v6)(v8, 0);
}

uint64_t sub_2396C83E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6 = SparseMatrix.Transpose.subscript.modify(v11, a2, a3, a4);
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v9, a1, v7);
  v6((unint64_t **)v11, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
}

void (*sub_2396C84AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(void *a1)
{
  uint64_t v8 = malloc(0x28uLL);
  *a1 = v8;
  void v8[4] = SparseMatrix.Transpose.subscript.modify(v8, a2, a3, a4);
  return sub_2394122B8;
}

uint64_t sub_2396C8524(_OWORD *a1, _OWORD *a2)
{
  return static SparseMatrix.Transpose.__derived_struct_equals(_:_:)(a1, a2);
}

uint64_t type metadata accessor for SparseMatrix.Transpose()
{
  return __swift_instantiateGenericMetadata();
}

__n128 OUTLINED_FUNCTION_3_112()
{
  return v0[2];
}

void DenseMatrix.subscript.read()
{
  OUTLINED_FUNCTION_5_1();
  char v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  OUTLINED_FUNCTION_1_3();
  *uint64_t v12 = v13;
  v12[1] = v14;
  size_t v16 = *(void *)(v15 + 64);
  *(void *)(v11 + 16) = malloc(v16);
  *(void *)(v11 + 24) = malloc(v16);
  if ((v1 & 1) == 0)
  {
    if ((unsigned __int128)(v9 * (__int128)v3) >> 64 == (v9 * v3) >> 63)
    {
      if (!__OFADD__(v9 * v3, v7)) {
        goto LABEL_7;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_10;
  }
  if ((unsigned __int128)(v7 * (__int128)v5) >> 64 != (v7 * v5) >> 63)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (!__OFADD__(v7 * v5, v9))
  {
LABEL_7:
    _s13LinearAlgebra11DenseVectorV10_uncheckedxSi_tcig_0();
    OUTLINED_FUNCTION_4_1();
    return;
  }
LABEL_11:
  __break(1u);
}

void (*DenseMatrix.subscript.modify(void (**a1)(void **a1), uint64_t a2, uint64_t a3))(void **a1)
{
  double result = (void (*)(void **))malloc(0x30uLL);
  uint64_t v8 = result;
  *a1 = result;
  if (v3[2])
  {
    uint64_t v9 = a3 * *v3;
    if ((unsigned __int128)(a3 * (__int128)*v3) >> 64 == v9 >> 63)
    {
      if (!__OFADD__(v9, a2))
      {
        sub_2396D1470();
        *((void *)v8 + 5) = sub_2396D14A0();
        return sub_23966E988;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v11 = v3[1];
  if ((unsigned __int128)(a2 * (__int128)v11) >> 64 != (a2 * v11) >> 63)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (!__OFADD__(a2 * v11, a3))
  {
    sub_2396D1470();
    *((void *)v8 + 4) = sub_2396D14A0();
    return sub_239526B20;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t static DenseMatrix.* infix(_:_:)(uint64_t a1)
{
  swift_retain();
  OUTLINED_FUNCTION_46_21();
  return OUTLINED_FUNCTION_20_57(v1, v2, v3, v4, v5, v6, v7, v8, a1);
}

uint64_t DenseMatrix.init(rowCount:columnCount:layout:repeating:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  OUTLINED_FUNCTION_1_3();
  uint64_t v10 = v9;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_16_1();
  uint64_t result = v12();
  if ((unsigned __int128)(a1 * (__int128)a2) >> 64 == (a1 * a2) >> 63)
  {
    sub_2396D1450();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a4, a5);
    return OUTLINED_FUNCTION_54_8();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t DenseMatrix.withUnsafeMatrixPointer<A>(_:)()
{
  return sub_2396D13C0();
}

void *DenseMatrix.withUnsafeMutableMatrixPointer<A>(_:)(uint64_t (*a1)(unsigned char *))
{
  uint64_t v2 = (uint64_t *)(v1 + 8);
  if (*(unsigned char *)(v1 + 16)) {
    uint64_t v2 = (uint64_t *)v1;
  }
  uint64_t v3 = *v2;
  sub_2396D1470();
  sub_2396D13B0();
  uint64_t v4 = *(void *)(*(void *)(v1 + 24) + 16);
  OUTLINED_FUNCTION_8_96();
  v10[0] = v7 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  uint64_t v6 = v10[0];
  v10[1] = v4;
  sub_2396CACB8((uint64_t)v10, v1, v3, a1);
  return sub_239462E18(v10, v6, v4);
}

uint64_t DenseMatrix.count.getter(uint64_t a1, uint64_t a2)
{
  uint64_t result = a1 * a2;
  if ((unsigned __int128)(a1 * (__int128)a2) >> 64 != result >> 63) {
    __break(1u);
  }
  return result;
}

uint64_t static DenseMatrix.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  BOOL v7 = a1 == a5 && a2 == a6;
  if (!v7 || ((a3 ^ a7) & 1) != 0) {
    return 0;
  }
  else {
    return sub_2396D1480();
  }
}

uint64_t static DenseMatrix.+ infix(_:_:)()
{
  uint64_t v0 = OUTLINED_FUNCTION_9_76();
  OUTLINED_FUNCTION_16_55(v0, v1, v2, v3, v4, v5, v6, v7, v17);
  static DenseMatrix.+= infix(_:_:)();
  return OUTLINED_FUNCTION_20_57(v8, v9, v10, v11, v12, v13, v14, v15, v18);
}

uint64_t static DenseMatrix.- infix(_:_:)()
{
  uint64_t v0 = OUTLINED_FUNCTION_9_76();
  OUTLINED_FUNCTION_16_55(v0, v1, v2, v3, v4, v5, v6, v7, v17);
  static DenseMatrix.-= infix(_:_:)();
  return OUTLINED_FUNCTION_20_57(v8, v9, v10, v11, v12, v13, v14, v15, v18);
}

void static DenseMatrix.*= infix(_:_:)()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v1 = v0[1];
  uint64_t v2 = *v0 * v1;
  if ((unsigned __int128)(*v0 * (__int128)v1) >> 64 != v2 >> 63)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v2 < 0)
  {
LABEL_8:
    __break(1u);
    return;
  }
  if (v2)
  {
    uint64_t v3 = v0 + 3;
    uint64_t v4 = sub_2396D1470();
    sub_2396D13B0();
    nullsub_1(v4, v5);
    sub_2396D13B0();
    nullsub_1(v4, v6);
    for (unint64_t i = 0; i != v2; ++i)
    {
      sub_2396D13B0();
      sub_239636D6C(i, *v3);
      sub_2396D0BF0();
      nullsub_1(v4, v8);
    }
  }
  OUTLINED_FUNCTION_4_1();
}

uint64_t static DenseMatrix.* infix(_:_:)(uint64_t a1, uint64_t a2)
{
  swift_retain();
  OUTLINED_FUNCTION_46_21();
  return OUTLINED_FUNCTION_20_57(v2, v3, v4, v5, v6, v7, v8, v9, a2);
}

void static DenseMatrix./ infix(_:_:)()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v1 = v0;
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  int v21 = v8 & 1;
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_1_3();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_27_1();
  uint64_t v15 = (char *)(v13 - v14);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v20 - v17;
  uint64_t v24 = v7;
  uint64_t v25 = v22;
  char v26 = v21;
  uint64_t v27 = v5;
  swift_getAssociatedConformanceWitness();
  swift_retain();
  sub_2396D1EC0();
  sub_2396D1C00();
  sub_2396D01E0();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v11 + 8);
  v19(v15, v1);
  static DenseMatrix.*= infix(_:_:)();
  v19(v18, v1);
  OUTLINED_FUNCTION_4_1();
}

void static DenseMatrix.* infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v23 = v22;
  LODWORD(v98) = v24;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  int v91 = v31;
  uint64_t v33 = v32;
  uint64_t v95 = v34;
  OUTLINED_FUNCTION_1_3();
  uint64_t v97 = v35;
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_27_1();
  uint64_t v39 = v37 - v38;
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_43_27();
  MEMORY[0x270FA5388](v41);
  uint64_t v43 = (char *)&v81 - v42;
  MEMORY[0x270FA5388](v44);
  uint64_t v46 = (void (**)(void))((char *)&v81 - v45);
  uint64_t v89 = v47;
  uint64_t v99 = *(void *)(*(void *)(*(void *)(v47 + 16) + 16) + 8);
  uint64_t v88 = *(void *)(v99 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v48);
  uint64_t v86 = (char *)&v81 - v49;
  uint64_t v100 = v33;
  if (v33 != v28) {
    goto LABEL_27;
  }
  uint64_t v93 = v30;
  if (qword_2689D4D08 != -1) {
    goto LABEL_24;
  }
  while (1)
  {
    uint64_t v50 = sub_2396CFD30();
    __swift_project_value_buffer(v50, (uint64_t)static Logger.linearAlgebra);
    uint64_t v51 = sub_2396CFD10();
    os_log_type_t v52 = sub_2396D0E30();
    BOOL v53 = os_log_type_enabled(v51, v52);
    uint64_t v94 = v23;
    uint64_t v92 = v39;
    uint64_t v84 = v21;
    v85 = v46;
    if (v53)
    {
      uint64_t v54 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      v102[0] = v39;
      *(_DWORD *)uint64_t v54 = 136315138;
      uint64_t v55 = sub_2396D2130();
      v101[0] = (void (*)(void **))sub_2395580BC(v55, v56, v102);
      uint64_t v46 = v85;
      sub_2396D1050();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2393EB000, v51, v52, "Using a slow implementation of matrix multiplication for %s. Prefer using Float or Double.", v54, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_43();
      OUTLINED_FUNCTION_3_43();
    }

    uint64_t v23 = v100;
    swift_getAssociatedConformanceWitness();
    OUTLINED_FUNCTION_41_26();
    uint64_t v83 = v57;
    sub_2396D1ED0();
    sub_2396D1C40();
    char v58 = OUTLINED_FUNCTION_25_0();
    uint64_t v59 = v95;
    v102[0] = DenseMatrix.init(rowCount:columnCount:layout:repeating:)(v95, v26, v58 & 1, (uint64_t)v46, a21);
    v102[1] = v60;
    char v103 = v61 & 1;
    uint64_t v104 = v62;
    if (v59 < 0)
    {
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      OUTLINED_FUNCTION_21_14();
      uint64_t v81 = 560;
      OUTLINED_FUNCTION_132();
      OUTLINED_FUNCTION_92_2();
      OUTLINED_FUNCTION_10_87();
      OUTLINED_FUNCTION_33_5();
    }
    if (!v59) {
      break;
    }
    if (v26 < 0) {
      goto LABEL_26;
    }
    uint64_t v63 = 0;
    int v21 = (void (**)(void))(v97 + 16);
    uint64_t v46 = (void (**)(void))(v97 + 8);
    uint64_t v82 = (void (**)(uint64_t, char *, uint64_t))(v97 + 24);
    int v90 = v91 & 1;
    int v91 = v98 & 1;
    uint64_t v96 = v26;
    while (v63 != v59)
    {
      if (v26)
      {
        if (v23 < 0) {
          goto LABEL_23;
        }
        uint64_t v64 = 0;
        while (v64 != v26)
        {
          uint64_t v97 = v64;
          sub_2396D1ED0();
          sub_2396D1C40();
          uint64_t v65 = v63;
          if (v23)
          {
            uint64_t v66 = 0;
            do
            {
              uint64_t v98 = v66 + 1;
              DenseMatrix.subscript.read();
              uint64_t v68 = v67;
              uint64_t v69 = *v21;
              uint64_t v70 = OUTLINED_FUNCTION_42_27();
              v69(v70);
              OUTLINED_FUNCTION_17_64();
              v68();
              DenseMatrix.subscript.read();
              uint64_t v72 = v71;
              uint64_t v73 = OUTLINED_FUNCTION_42_27();
              v69(v73);
              OUTLINED_FUNCTION_17_64();
              v72();
              sub_2396D0BE0();
              uint64_t v74 = *v46;
              uint64_t v39 = v99;
              OUTLINED_FUNCTION_24_0();
              v74();
              OUTLINED_FUNCTION_24_0();
              v74();
              sub_2396D1680();
              OUTLINED_FUNCTION_24_0();
              v74();
              uint64_t v66 = v98;
            }
            while (v100 != v98);
          }
          uint64_t v75 = v97;
          uint64_t v76 = v97 + 1;
          type metadata accessor for DenseMatrix();
          uint64_t v77 = DenseMatrix.subscript.modify(v101, v65, v75);
          (*v82)(v78, v43, a21);
          ((void (*)(void (**)(void **), void))v77)(v101, 0);
          OUTLINED_FUNCTION_24_0();
          v79();
          uint64_t v64 = v75 + 1;
          uint64_t v26 = v96;
          BOOL v80 = v76 == v96;
          uint64_t v23 = v100;
          uint64_t v63 = v65;
          if (v80) {
            goto LABEL_19;
          }
        }
        __break(1u);
        break;
      }
LABEL_19:
      ++v63;
      uint64_t v59 = v95;
      if (v63 == v95) {
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    swift_once();
  }
LABEL_20:
  OUTLINED_FUNCTION_4_1();
}

uint64_t DenseMatrix.transposed()()
{
  DenseMatrix.Transpose.init(base:)();
  uint64_t v1 = v0;
  swift_retain();
  return v1;
}

uint64_t static DenseMatrix<>.* infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = OUTLINED_FUNCTION_35_30(a1, a2, a3, a4, a5, a6);
  if (v7)
  {
    OUTLINED_FUNCTION_16_58();
    sub_2396BB31C(v8, 0.0);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_239666B00();
    }
    OUTLINED_FUNCTION_5_108();
    UnsafeMutableMatrixPointer<A>.addProductFloat(_:transposed:_:transposed:scaledBy:)(v9, 0, v10, 0);
    return OUTLINED_FUNCTION_51_18();
  }
  else
  {
    __break(1u);
  }
  return result;
}

{
  uint64_t result;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  uint64_t result = OUTLINED_FUNCTION_35_30(a1, a2, a3, a4, a5, a6);
  if (v7)
  {
    OUTLINED_FUNCTION_16_58();
    sub_23962D7B0(v8, 0.0);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_239666B30();
    }
    OUTLINED_FUNCTION_5_108();
    UnsafeMutableMatrixPointer<A>.addProductDouble(_:transposed:_:transposed:scaledBy:)(v9, 0, v10, 0);
    return OUTLINED_FUNCTION_51_18();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t DenseMatrix.columnCount.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t DenseMatrix.layout.getter(uint64_t a1, uint64_t a2, char a3)
{
  return a3 & 1;
}

uint64_t DenseMatrix.leadingDimension.getter(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return a2;
  }
  return result;
}

uint64_t (*DenseMatrix.storage.modify())(void, void)
{
  return nullsub_1;
}

void DenseMatrix.init<A>(rowCount:columnCount:layout:scalars:)()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  OUTLINED_FUNCTION_1_3();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_16_1();
  v11();
  sub_2396D0950();
  swift_retain();
  uint64_t v12 = sub_2396D1400();
  if ((unsigned __int128)(v7 * (__int128)v5) >> 64 != (v7 * v5) >> 63)
  {
    __break(1u);
LABEL_5:
    sub_2396D1200();
    sub_2396D04E0();
    sub_2396D19D0();
    sub_2396D04E0();
    swift_bridgeObjectRelease();
    sub_2396D04E0();
    OUTLINED_FUNCTION_54_8();
    sub_2396D1400();
    swift_release();
    sub_2396D19D0();
    sub_2396D04E0();
    swift_bridgeObjectRelease();
    sub_2396D04E0();
    OUTLINED_FUNCTION_21_14();
    OUTLINED_FUNCTION_92_2();
    sub_2396D1650();
    OUTLINED_FUNCTION_33_5();
  }
  if (v12 != v7 * v5) {
    goto LABEL_5;
  }
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v3, v1);
  swift_release();
  OUTLINED_FUNCTION_4_1();
}

uint64_t DenseMatrix.init(rowCount:columnCount:layout:initializingWith:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = a1 * a2;
  if ((unsigned __int128)(a1 * (__int128)a2) >> 64 == result >> 63)
  {
    MEMORY[0x270FA5388](result);
    sub_2394615A0();
    if (v2) {
      return v5;
    }
    else {
      return a1;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t DenseMatrix.subscript.getter@<X0>(uint64_t a1@<X6>, uint64_t a2@<X8>)
{
  DenseMatrix.subscript.read();
  uint64_t v5 = v4;
  (*(void (**)(uint64_t))(*(void *)(a1 - 8) + 16))(a2);
  return v5(v7, 0);
}

Swift::Void __swiftcall DenseMatrix.transpose()()
{
  uint64_t v1 = *v0;
  if (*v0 == v0[1])
  {
    if (v1 < 0)
    {
LABEL_21:
      __break(1u);
      return;
    }
    if (v1)
    {
      uint64_t v2 = 0;
LABEL_5:
      if (v2 == v1) {
        goto LABEL_19;
      }
      if (v2 + 1 != v1)
      {
        if ((unsigned __int128)(v2 * (__int128)v1) >> 64 != (v2 * v1) >> 63)
        {
LABEL_20:
          __break(1u);
          goto LABEL_21;
        }
        uint64_t v3 = v2 + 1;
        while (!__OFADD__(v2 * v1, v3))
        {
          if ((unsigned __int128)(v3 * (__int128)v1) >> 64 != (v3 * v1) >> 63) {
            goto LABEL_17;
          }
          if (__OFADD__(v3 * v1, v2)) {
            goto LABEL_18;
          }
          ++v3;
          sub_2396D1470();
          swift_getWitnessTable();
          sub_2396D0330();
          if (v1 == v3)
          {
            ++v2;
            goto LABEL_5;
          }
        }
        __break(1u);
LABEL_17:
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
    }
  }
  else
  {
    DenseMatrix._transposed()();
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    char v9 = v8;
    uint64_t v11 = v10;
    swift_release();
    *uint64_t v0 = v5;
    v0[1] = v7;
    *((unsigned char *)v0 + 16) = v9 & 1;
    v0[3] = v11;
  }
}

void DenseMatrix._transposed()()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7 & 1;
  OUTLINED_FUNCTION_1_3();
  uint64_t v26 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_10_2();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v11);
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_41_26();
  sub_2396D1ED0();
  sub_2396D1C40();
  uint64_t v12 = v4;
  void v29[4] = (void (*)(void **))DenseMatrix.init(rowCount:columnCount:layout:repeating:)(v4, v6, v8, v0, v2);
  v29[5] = v13;
  char v30 = v14 & 1;
  uint64_t v31 = v15;
  if (v6 < 0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!v6)
  {
LABEL_10:
    OUTLINED_FUNCTION_4_1();
    return;
  }
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v16 = 0;
    uint64_t v28 = (void (**)(uint64_t))(v26 + 16);
    uint64_t v27 = (void (**)(uint64_t, uint64_t, uint64_t))(v26 + 40);
    while (v16 != v6)
    {
      uint64_t v17 = v16;
      if (v12)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          DenseMatrix.subscript.read();
          uint64_t v19 = v8;
          uint64_t v20 = v6;
          uint64_t v21 = v12;
          uint64_t v23 = v22;
          (*v28)(v0);
          OUTLINED_FUNCTION_17_64();
          v23();
          type metadata accessor for DenseMatrix();
          int v24 = DenseMatrix.subscript.modify(v29, i, v17);
          (*v27)(v25, v0, v2);
          ((void (*)(void (**)(void **), void))v24)(v29, 0);
          uint64_t v12 = v21;
          uint64_t v6 = v20;
          uint64_t v8 = v19;
        }
      }
      uint64_t v16 = v17 + 1;
      if (v17 + 1 == v6) {
        goto LABEL_10;
      }
    }
    __break(1u);
    goto LABEL_12;
  }
LABEL_13:
  __break(1u);
}

uint64_t static DenseMatrix.identity(rowCount:columnCount:)(uint64_t a1, uint64_t a2)
{
  return DenseMatrix.init(rowCount:columnCount:layout:initializingWith:)(a1, a2);
}

void sub_2396CA6CC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = a3;
  uint64_t v6 = *(void *)(a4 - 8);
  uint64_t v20 = a1;
  uint64_t v21 = v6;
  MEMORY[0x270FA5388](a1);
  uint64_t v19 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = *(void *)(v8 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  if (a2 < 0) {
    goto LABEL_15;
  }
  if (a2)
  {
    if (v26 < 0)
    {
LABEL_16:
      __break(1u);
      return;
    }
    uint64_t v27 = 0;
    uint64_t v9 = 0;
    uint64_t v17 = a2;
    uint64_t v18 = v21 + 40;
    uint64_t v10 = v19;
    while (v9 != a2)
    {
      if (v26)
      {
        uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
        uint64_t v12 = 0;
        uint64_t v22 = v27 - 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v23 = AssociatedConformanceWitness;
        while (1)
        {
          uint64_t v13 = v27 + v12;
          uint64_t v14 = v22 + v12;
          uint64_t v15 = *v20;
          sub_2396D1EC0();
          sub_2396D1C00();
          (*(void (**)(uint64_t, char *, uint64_t))(v21 + 40))(v15 + *(void *)(v21 + 72) * v13, v10, a4);
          if (!v14) {
            break;
          }
          if (v26 == ++v12)
          {
            v27 += v12;
            a2 = v17;
            goto LABEL_11;
          }
        }
        __break(1u);
        break;
      }
LABEL_11:
      if (++v9 == a2) {
        return;
      }
    }
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
}

uint64_t sub_2396CA928@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = DenseMatrix.init(rowCount:columnCount:)(a1, a2);
  *(void *)a3 = result;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = v6;
  return result;
}

uint64_t sub_2396CA960@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = DenseMatrix.transposed()();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_2396CA9A8@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  DenseMatrix.subscript.read();
  uint64_t v5 = v4;
  (*(void (**)(uint64_t))(*(void *)(v3 - 8) + 16))(a2);
  return v5(v7, 0);
}

uint64_t sub_2396CAA4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = DenseMatrix.subscript.modify(v11, a2, a3);
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v9, a1, v7);
  ((void (*)(void (**)(void **), void))v6)(v11, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
}

void (*sub_2396CAB14(void (***a1)(void **a1), uint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (**)(void **))malloc(0x28uLL);
  *a1 = v6;
  void v6[4] = DenseMatrix.subscript.modify(v6, a2, a3);
  return sub_2394122B8;
}

uint64_t sub_2396CAB8C(uint64_t a1, uint64_t a2)
{
  return static DenseMatrix.__derived_struct_equals(_:_:)(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16), *(void *)(a1 + 24), *(void *)a2, *(void *)(a2 + 8), *(unsigned __int8 *)(a2 + 16)) & 1;
}

uint64_t sub_2396CABDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t (*a7)(unsigned char *))
{
  uint64_t result = sub_2396D03E0();
  if (result)
  {
    if (a5) {
      uint64_t v12 = a3;
    }
    else {
      uint64_t v12 = a4;
    }
    UnsafeMatrixPointer.init(start:rowCount:columnCount:leadingDimension:layout:)(result, a3, a4, v12, a5 & 1, (uint64_t)v13);
    return a7(v13);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2396CAC78(uint64_t a1, uint64_t a2)
{
  return sub_2396CABDC(a1, a2, *(void *)(v2 + 40), *(void *)(v2 + 48), *(unsigned char *)(v2 + 56), *(void *)(v2 + 64), *(uint64_t (**)(unsigned char *))(v2 + 72));
}

uint64_t sub_2396CACB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(unsigned char *))
{
  uint64_t result = sub_2396D03E0();
  if (result)
  {
    UnsafeMutableMatrixPointer.init(start:rowCount:columnCount:leadingDimension:layout:)(result, *(void *)a2, *(void *)(a2 + 8), a3, *(unsigned char *)(a2 + 16), (uint64_t)v8);
    return a4(v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t DenseMatrix.withUnsafeVectorPointer<A>(row:_:)()
{
  return sub_2396CAFBC();
}

uint64_t sub_2396CAD90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t), uint64_t a9, uint64_t a10)
{
  uint64_t result = sub_2396D03E0();
  if (a5)
  {
    if (result) {
      goto LABEL_6;
    }
  }
  else
  {
    if (result)
    {
      if ((unsigned __int128)(a7 * (__int128)a4) >> 64 == (a7 * a4) >> 63)
      {
        a3 = 1;
        a7 *= a4;
LABEL_6:
        uint64_t v16 = UnsafeVectorPointer.init(start:count:stride:)(result + *(void *)(*(void *)(a10 - 8) + 72) * a7, a4, a3, a10);
        return a8(v16);
      }
      __break(1u);
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void *DenseMatrix.withUnsafeMutableVectorPointer<A>(row:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2396CB040(a1, a2, a3, a4, a5, (void (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))sub_2396CAE94);
}

uint64_t sub_2396CAE94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t a5, uint64_t a6)
{
  char v10 = *(unsigned char *)(a2 + 16);
  uint64_t result = sub_2396D03E0();
  if (v10)
  {
    if (result)
    {
      uint64_t v12 = result + *(void *)(*(void *)(a6 - 8) + 72) * a3;
      uint64_t v14 = *(void *)a2;
      uint64_t v13 = *(void *)(a2 + 8);
LABEL_7:
      uint64_t v15 = UnsafeMutableVectorPointer.init(start:count:stride:)(v12, v13, v14, a6);
      return a4(v15);
    }
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (result)
  {
    uint64_t v13 = *(void *)(a2 + 8);
    if ((unsigned __int128)(a3 * (__int128)v13) >> 64 == (a3 * v13) >> 63)
    {
      uint64_t v12 = result + *(void *)(*(void *)(a6 - 8) + 72) * a3 * v13;
      uint64_t v14 = 1;
      goto LABEL_7;
    }
    __break(1u);
    goto LABEL_9;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t DenseMatrix.withUnsafeVectorPointer<A>(column:_:)()
{
  return sub_2396CAFBC();
}

uint64_t sub_2396CAFBC()
{
  return sub_2396D13C0();
}

void *DenseMatrix.withUnsafeMutableVectorPointer<A>(column:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2396CB040(a1, a2, a3, a4, a5, (void (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))sub_2394621B4);
}

void *sub_2396CB040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))
{
  uint64_t v19 = a6;
  uint64_t v10 = *(void *)(a4 + 16);
  sub_2396D1470();
  sub_2396D13B0();
  uint64_t v11 = *(void *)(*(void *)(v6 + 24) + 16);
  OUTLINED_FUNCTION_8_96();
  v18[0] = v14 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v13 = v18[0];
  v18[1] = v11;
  v19(v18, v6, a1, a2, a3, v10, a5, *(void *)(a4 + 24));
  return sub_239462E18(v18, v13, v11);
}

void static DenseMatrix<>.*= infix(_:_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 24) = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_2396BB448();
    uint64_t v2 = v4;
    *(void *)(a1 + 24) = v4;
  }
  OUTLINED_FUNCTION_47_17();
  if (!v5)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_13_71();
  if (v6 != v7) {
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_12_73();
  if (v6 ^ v7 | v5)
  {
    cblas_sscal_NEWLAPACK();
    *(void *)(a1 + 24) = v2;
    return;
  }
LABEL_10:
  __break(1u);
}

{
  char *v2;
  char isUniquelyReferenced_nonNull_native;
  char v4;
  char v5;
  char v6;

  uint64_t v2 = *(char **)(a1 + 24);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 24) = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_23966F560((uint64_t)v2);
    *(void *)(a1 + 24) = v2;
  }
  OUTLINED_FUNCTION_47_17();
  if (!v4)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_13_71();
  if (v5 != v6) {
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_12_73();
  if (v5 ^ v6 | v4)
  {
    cblas_dscal_NEWLAPACK();
    *(void *)(a1 + 24) = v2;
    return;
  }
LABEL_10:
  __break(1u);
}

void static DenseMatrix<>./ infix(_:_:)()
{
  OUTLINED_FUNCTION_4_102();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    sub_2396BB448();
  }
  OUTLINED_FUNCTION_6_99();
  if (!v0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_13_71();
  if (v1 != v2) {
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_12_73();
  if (v1 ^ v2 | v0)
  {
    cblas_sscal_NEWLAPACK();
    OUTLINED_FUNCTION_1_98();
    return;
  }
LABEL_10:
  __break(1u);
}

{
  uint64_t v0;
  char v1;
  char v2;
  char v3;

  OUTLINED_FUNCTION_4_102();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    sub_23966F560(v0);
  }
  OUTLINED_FUNCTION_6_99();
  if (!v1)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_13_71();
  if (v2 != v3) {
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_12_73();
  if (v2 ^ v3 | v1)
  {
    cblas_dscal_NEWLAPACK();
    OUTLINED_FUNCTION_1_98();
    return;
  }
LABEL_10:
  __break(1u);
}

uint64_t static DenseMatrix<>.* infix(_:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  return sub_2396CB58C(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2396C1BE0);
}

{
  return sub_2396CB58C(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2396C1DD0);
}

uint64_t static DenseMatrix<>.* infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  return sub_2396CB624(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2396C1C5C);
}

{
  return sub_2396CB624(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2396C1E4C);
}

uint64_t sub_2396CB58C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v11 = a3 & 1;
  swift_retain();
  swift_retain();
  return a6(a1, a5, a1, a2, v11, a4);
}

uint64_t sub_2396CB624(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v11 = a4 & 1;
  swift_retain();
  swift_retain();
  return a6(a3, a1, a2, a3, v11, a5);
}

void static DenseMatrix.* infix(_:_:)()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  LODWORD(v73) = v9;
  uint64_t v11 = v10;
  uint64_t v76 = v12;
  OUTLINED_FUNCTION_1_3();
  uint64_t v78 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_27_1();
  uint64_t v17 = v15 - v16;
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_43_27();
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (void (*)(void))((char *)&v61 - v20);
  MEMORY[0x270FA5388](v22);
  int v24 = (char *)&v61 - v23;
  OUTLINED_FUNCTION_29_39(v25, v26, v27, v28, v29, v30, v31);
  uint64_t v67 = v32;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v33);
  uint64_t v65 = (char *)&v61 - v34;
  uint64_t v79 = v4;
  uint64_t v77 = v2;
  if (DenseVector.count.getter() != v11)
  {
LABEL_22:
    OUTLINED_FUNCTION_21_14();
    uint64_t v61 = 582;
    OUTLINED_FUNCTION_132();
    OUTLINED_FUNCTION_92_2();
    OUTLINED_FUNCTION_10_87();
    OUTLINED_FUNCTION_33_5();
  }
  uint64_t v62 = v17;
  uint64_t v71 = v11;
  uint64_t v72 = v8;
  if (qword_2689D4D08 != -1) {
    goto LABEL_20;
  }
  while (1)
  {
    uint64_t v35 = sub_2396CFD30();
    __swift_project_value_buffer(v35, (uint64_t)static Logger.linearAlgebra);
    uint64_t v36 = sub_2396CFD10();
    os_log_type_t v37 = sub_2396D0E30();
    BOOL v38 = os_log_type_enabled(v36, v37);
    uint64_t v61 = (uint64_t)v0;
    uint64_t v69 = v24;
    if (v38)
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      v80[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 136315138;
      uint64_t v40 = v79;
      uint64_t v41 = sub_2396D2130();
      uint64_t v43 = sub_2395580BC(v41, v42, v80);
      OUTLINED_FUNCTION_12_71(v43);
      sub_2396D1050();
      int v24 = v69;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2393EB000, v36, v37, "Using a slow implementation of matrix multiplication for %s. Prefer using Float or Double.", v39, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_43();
      OUTLINED_FUNCTION_3_43();

      char v0 = v21;
    }
    else
    {

      char v0 = v21;
      uint64_t v40 = v79;
    }
    swift_getAssociatedConformanceWitness();
    OUTLINED_FUNCTION_41_26();
    uint64_t v64 = v44;
    sub_2396D1ED0();
    sub_2396D1C40();
    uint64_t v45 = v76;
    v80[4] = DenseVector.init(repeating:count:)((uint64_t)v24, v76, v40);
    if (v45 < 0)
    {
      __break(1u);
      goto LABEL_22;
    }
    if (!v45) {
      break;
    }
    uint64_t v46 = v40;
    uint64_t v21 = 0;
    int v24 = (char *)(v73 & 1);
    unint64_t v63 = ((unint64_t)v78 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    int v70 = v73 & 1;
    uint64_t v73 = (char *)v78 + 16;
    uint64_t v74 = v6;
    uint64_t v75 = v0;
    uint64_t v68 = (void (**)(void (*)(void), uint64_t))((char *)v78 + 8);
    uint64_t v47 = (void (**)(uint64_t, uint64_t))((char *)v78 + 8);
    while (v21 != (void (*)(void))v45)
    {
      sub_2396D1ED0();
      sub_2396D1C40();
      uint64_t v48 = DenseVector.count.getter();
      if (v48 < 0) {
        goto LABEL_19;
      }
      uint64_t v78 = v21;
      if (v48)
      {
        uint64_t v49 = 0;
        uint64_t v50 = v62;
        uint64_t v51 = v61;
        os_log_type_t v52 = v69;
        do
        {
          uint64_t v53 = v48;
          DenseMatrix.subscript.read();
          uint64_t v55 = v54;
          OUTLINED_FUNCTION_48_20();
          OUTLINED_FUNCTION_16_1();
          v21();
          OUTLINED_FUNCTION_17_64();
          v55();
          DenseVector.subscript.getter(v49, v74, v46, v77);
          sub_2396D0BE0();
          unint64_t v56 = *v47;
          (*v47)(v50, v79);
          v56(v51, v79);
          uint64_t v46 = v79;
          sub_2396D1680();
          v56((uint64_t)v52, v46);
          uint64_t v48 = v53;
          ++v49;
        }
        while (v53 != v49);
        uint64_t v45 = v76;
        uint64_t v57 = v74;
        char v0 = v75;
      }
      else
      {
        uint64_t v57 = v6;
        OUTLINED_FUNCTION_48_20();
      }
      unint64_t v58 = (unint64_t)v78;
      uint64_t v59 = (char *)v78 + 1;
      int v24 = v69;
      ((void (*)(char *, void (*)(void), uint64_t))v21)(v69, v0, v46);
      uint64_t v60 = type metadata accessor for DenseVector();
      DenseVector.subscript.setter((uint64_t)v24, v58, v60);
      (*v68)(v0, v46);
      uint64_t v21 = (void (*)(void))(v58 + 1);
      uint64_t v6 = v57;
      if (v59 == (char *)v45) {
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    swift_once();
  }
LABEL_17:
  OUTLINED_FUNCTION_4_1();
}

{
  void (*v0)(void);
  void (*v1)(void);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (**v23)(void);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(void);
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  BOOL v38;
  uint8_t *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void (*v43)(void);
  uint64_t v44;
  uint64_t v45;
  void (*v46)(void);
  char *v47;
  void (*v48)(void);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(void);
  void (*v53)(void);
  void (*v54)(void);
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(void);
  void v60[8];
  void (**v61)(void);
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint8_t *v65;
  uint64_t v66;
  void (*v67)(void);
  uint64_t v68;
  uint64_t v69;
  char *v70;
  unint64_t v71;
  uint64_t v72[6];

  OUTLINED_FUNCTION_5_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v64 = v4;
  LODWORD(v71) = v5;
  uint64_t v68 = v6;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  OUTLINED_FUNCTION_1_3();
  uint64_t v66 = v11;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_27_1();
  uint64_t v15 = v13 - v14;
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)v60 - v17;
  MEMORY[0x270FA5388](v19);
  int v70 = (char *)v60 - v20;
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (void (**)(void))((char *)v60 - v22);
  OUTLINED_FUNCTION_29_39(v24, v25, v26, v27, v28, v29, v30);
  v60[7] = v31;
  v60[6] = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388](v32);
  v60[5] = (char *)v60 - v33;
  uint64_t v34 = v1;
  if (DenseVector.count.getter() != v8)
  {
LABEL_22:
    OUTLINED_FUNCTION_21_14();
    v60[0] = 602;
    OUTLINED_FUNCTION_132();
    OUTLINED_FUNCTION_92_2();
    OUTLINED_FUNCTION_10_87();
    OUTLINED_FUNCTION_33_5();
  }
  v60[1] = v18;
  v60[2] = v15;
  unint64_t v63 = v8;
  if (qword_2689D4D08 != -1) {
    goto LABEL_20;
  }
  while (1)
  {
    uint64_t v35 = sub_2396CFD30();
    __swift_project_value_buffer(v35, (uint64_t)static Logger.linearAlgebra);
    uint64_t v36 = sub_2396CFD10();
    os_log_type_t v37 = sub_2396D0E30();
    BOOL v38 = os_log_type_enabled(v36, v37);
    uint64_t v61 = v23;
    if (v38)
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      v72[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v39 = 136315138;
      uint64_t v65 = v39 + 4;
      uint64_t v40 = sub_2396D2130();
      unint64_t v42 = sub_2395580BC(v40, v41, v72);
      OUTLINED_FUNCTION_12_71(v42);
      sub_2396D1050();
      uint64_t v43 = v34;
      uint64_t v23 = v61;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2393EB000, v36, v37, "Using a slow implementation of matrix multiplication for %s. Prefer using Float or Double.", v39, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3_43();
      OUTLINED_FUNCTION_3_43();
    }
    else
    {

      uint64_t v43 = v34;
    }
    swift_getAssociatedConformanceWitness();
    OUTLINED_FUNCTION_41_26();
    v60[4] = v44;
    sub_2396D1ED0();
    sub_2396D1C40();
    uint64_t v45 = v68;
    v72[4] = DenseVector.init(repeating:count:)((uint64_t)v23, v68, v3);
    if (v45 < 0)
    {
      __break(1u);
      goto LABEL_22;
    }
    if (!v45) {
      break;
    }
    uint64_t v46 = v43;
    uint64_t v23 = (void (**)(void))(v66 + 8);
    uint64_t v34 = 0;
    v60[3] = (v66 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    uint64_t v62 = v71 & 1;
    uint64_t v65 = (uint8_t *)(v66 + 16);
    uint64_t v69 = v10;
    uint64_t v67 = v43;
    while (v34 != (void (*)(void))v45)
    {
      sub_2396D1ED0();
      uint64_t v47 = v70;
      sub_2396D1C40();
      uint64_t v48 = v46;
      uint64_t v49 = DenseVector.count.getter();
      if (v49 < 0) {
        goto LABEL_19;
      }
      uint64_t v71 = (unint64_t)v34;
      if (v49)
      {
        uint64_t v50 = 0;
        uint64_t v66 = v49;
        do
        {
          uint64_t v51 = v50 + 1;
          DenseVector.subscript.getter(v50, v69, v3, v67);
          DenseMatrix.subscript.read();
          uint64_t v53 = v52;
          OUTLINED_FUNCTION_48_20();
          OUTLINED_FUNCTION_16_1();
          v34();
          OUTLINED_FUNCTION_17_64();
          v53();
          sub_2396D0BE0();
          uint64_t v54 = *v23;
          OUTLINED_FUNCTION_7_44();
          v54();
          OUTLINED_FUNCTION_7_44();
          v54();
          sub_2396D1680();
          OUTLINED_FUNCTION_7_44();
          v54();
          uint64_t v50 = v51;
        }
        while (v66 != v51);
        uint64_t v48 = v67;
        uint64_t v45 = v68;
        uint64_t v47 = v70;
      }
      else
      {
        OUTLINED_FUNCTION_48_20();
      }
      uint64_t v55 = v71;
      unint64_t v56 = v71 + 1;
      uint64_t v57 = (uint64_t)v61;
      ((void (*)(void (**)(void), char *, uint64_t))v34)(v61, v47, v3);
      uint64_t v46 = v48;
      unint64_t v58 = type metadata accessor for DenseVector();
      DenseVector.subscript.setter(v57, v55, v58);
      OUTLINED_FUNCTION_7_44();
      v59();
      uint64_t v34 = (void (*)(void))(v55 + 1);
      uint64_t v10 = v69;
      if (v56 == v45) {
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    swift_once();
  }
LABEL_17:
  OUTLINED_FUNCTION_4_1();
}

void sub_2396CC228(uint64_t *a1)
{
  sub_2396CA6CC(a1, v1[4], v1[5], v1[2]);
}

uint64_t sub_2396CC248(uint64_t a1, uint64_t a2)
{
  return sub_2396CC2A0(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void))sub_2396CAD90);
}

uint64_t sub_2396CC274(uint64_t a1, uint64_t a2)
{
  return sub_2396CC2A0(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void))sub_239461FDC);
}

uint64_t sub_2396CC2A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void))
{
  return a3(a1, a2, *(void *)(v3 + 40), *(void *)(v3 + 48), *(unsigned __int8 *)(v3 + 56), *(void *)(v3 + 64), *(void *)(v3 + 72), *(void *)(v3 + 80), *(void *)(v3 + 88), *(void *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32));
}

uint64_t sub_2396CC2E8()
{
  return swift_getWitnessTable();
}

uint64_t OUTLINED_FUNCTION_6_99()
{
  return v1 * v0;
}

uint64_t OUTLINED_FUNCTION_10_87()
{
  return sub_2396D1650();
}

uint64_t OUTLINED_FUNCTION_15_65()
{
  return sub_2396D1680();
}

uint64_t OUTLINED_FUNCTION_27_51()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_29_39(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 - 208) = *(void *)(*(void *)(*(void *)(a7 + 16) + 16) + 8);
}

void OUTLINED_FUNCTION_34_29()
{
  DenseMatrix.subscript.read();
}

uint64_t OUTLINED_FUNCTION_35_30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return a1 * a6;
}

uint64_t OUTLINED_FUNCTION_42_27()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_44_28()
{
  return cblas_dscal_NEWLAPACK();
}

uint64_t OUTLINED_FUNCTION_45_22()
{
  return cblas_sscal_NEWLAPACK();
}

void OUTLINED_FUNCTION_46_21()
{
  static DenseMatrix.*= infix(_:_:)();
}

uint64_t OUTLINED_FUNCTION_47_17()
{
  return *v0 * v0[1];
}

uint64_t UnsafeMutableVectorPointer<A>.add(_:scaledBy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a5 != a2) {
    goto LABEL_19;
  }
  if (a5 > 0x7FFFFFFF)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (a3 > 0x7FFFFFFF)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a3 < (uint64_t)0xFFFFFFFF80000000 || a5 < (uint64_t)0xFFFFFFFF80000000 || a6 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_17;
  }
  if (a6 > 0x7FFFFFFF)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    OUTLINED_FUNCTION_8_97();
    OUTLINED_FUNCTION_19_53();
    OUTLINED_FUNCTION_14_70();
    OUTLINED_FUNCTION_3_113();
    OUTLINED_FUNCTION_18_55();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_107();
    OUTLINED_FUNCTION_3_113();
    OUTLINED_FUNCTION_17_65();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_7_89();
    OUTLINED_FUNCTION_20_58();
    uint64_t v10 = OUTLINED_FUNCTION_2_118();
    __break(1u);
    return MEMORY[0x270EDE408](v10, v11);
  }
  uint64_t v10 = a5;
  uint64_t v11 = a1;
  return MEMORY[0x270EDE408](v10, v11);
}

{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;

  if (a5 != a2) {
    goto LABEL_19;
  }
  if (a5 > 0x7FFFFFFF)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (a3 > 0x7FFFFFFF)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a3 < (uint64_t)0xFFFFFFFF80000000 || a5 < (uint64_t)0xFFFFFFFF80000000 || a6 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_17;
  }
  if (a6 > 0x7FFFFFFF)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    OUTLINED_FUNCTION_8_97();
    OUTLINED_FUNCTION_19_53();
    OUTLINED_FUNCTION_14_70();
    OUTLINED_FUNCTION_3_113();
    OUTLINED_FUNCTION_18_55();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_107();
    OUTLINED_FUNCTION_3_113();
    OUTLINED_FUNCTION_17_65();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_7_89();
    OUTLINED_FUNCTION_20_58();
    uint64_t v10 = OUTLINED_FUNCTION_2_118();
    __break(1u);
    return MEMORY[0x270EDE2F8](v10, v11);
  }
  uint64_t v10 = a5;
  uint64_t v11 = a1;
  return MEMORY[0x270EDE2F8](v10, v11);
}

uint64_t UnsafeMutableVectorPointer<A>.multiply(by:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 > 0x7FFFFFFF)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (a2 >= (uint64_t)0xFFFFFFFF80000000)
  {
    BOOL v4 = __OFSUB__(a3, 0xFFFFFFFF80000000);
    BOOL v3 = a3 + 0x80000000 < 0;
  }
  else
  {
    BOOL v4 = 0;
    BOOL v3 = 1;
  }
  if (v3 != v4) {
    goto LABEL_9;
  }
  if (a3 <= 0x7FFFFFFF) {
    return cblas_sscal_NEWLAPACK();
  }
LABEL_10:
  __break(1u);
  return result;
}

{
  BOOL v3;
  BOOL v4;
  uint64_t result;

  if (a2 > 0x7FFFFFFF)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (a2 >= (uint64_t)0xFFFFFFFF80000000)
  {
    BOOL v4 = __OFSUB__(a3, 0xFFFFFFFF80000000);
    BOOL v3 = a3 + 0x80000000 < 0;
  }
  else
  {
    BOOL v4 = 0;
    BOOL v3 = 1;
  }
  if (v3 != v4) {
    goto LABEL_9;
  }
  if (a3 <= 0x7FFFFFFF) {
    return cblas_dscal_NEWLAPACK();
  }
LABEL_10:
  __break(1u);
  return result;
}

void UnsafeVectorPointer<A>.squaredMagnitude.getter()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v1 = v0;
  uint64_t v29 = v2;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  OUTLINED_FUNCTION_0_1();
  uint64_t v31 = v7;
  MEMORY[0x270FA5388](v8);
  uint64_t v30 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v23[1] = (char *)v23 - v11;
  MEMORY[0x270FA5388](v12);
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_5_109();
  MEMORY[0x270FA5388](v13);
  swift_getAssociatedConformanceWitness();
  sub_2396D1ED0();
  sub_2396D1C40();
  uint64_t v14 = v29 * v1;
  if ((unsigned __int128)(v29 * (__int128)v1) >> 64 != (v29 * v1) >> 63)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v15 = v1;
  if (!v1)
  {
LABEL_15:
    __break(1u);
    return;
  }
  BOOL v16 = v14 >= 0;
  if (v1 > 0) {
    BOOL v16 = v14 < 1;
  }
  uint64_t v29 = v6;
  if (!v16)
  {
    int64_t v17 = 0;
    uint64_t v26 = *(void (**)(void))(v31 + 16);
    uint64_t v27 = v4;
    uint64_t v25 = *(void *)(v31 + 72);
    int v24 = (void (**)(void))(v31 + 8);
    uint64_t v28 = v14;
    v31 += 16;
    do
    {
      uint64_t v18 = v15;
      if (__OFADD__(v17, v15)) {
        int64_t v19 = ((v17 + v15) >> 63) ^ 0x8000000000000000;
      }
      else {
        int64_t v19 = v17 + v15;
      }
      uint64_t v20 = v26;
      OUTLINED_FUNCTION_11_76();
      v20();
      OUTLINED_FUNCTION_11_76();
      v20();
      sub_2396D0BE0();
      uint64_t v21 = *v24;
      OUTLINED_FUNCTION_1_7();
      v21();
      OUTLINED_FUNCTION_1_7();
      v21();
      sub_2396D1680();
      OUTLINED_FUNCTION_1_7();
      v21();
      BOOL v22 = v19 >= v28;
      uint64_t v15 = v18;
      if (v18 <= 0) {
        BOOL v22 = v28 >= v19;
      }
      int64_t v17 = v19;
    }
    while (!v22);
  }
  OUTLINED_FUNCTION_4_1();
}

uint64_t UnsafeVectorPointer<A>.magnitude.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_0_1();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  UnsafeVectorPointer<A>.squaredMagnitude.getter();
  sub_2396D01D0();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, a4);
}

void UnsafeVectorPointer<A>.maximumAbsoluteValue.getter()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v36 = v8;
  uint64_t v42 = *(void *)(*(void *)(v0 + 16) + 8);
  uint64_t v43 = v9;
  uint64_t v40 = *(void *)(v42 + 16);
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_5_109();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  BOOL v16 = (char *)&v34 - v15;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v34 - v19;
  if (v7 < 1)
  {
    sub_2396D0200();
LABEL_19:
    OUTLINED_FUNCTION_4_1();
    return;
  }
  uint64_t v35 = v18;
  uint64_t v41 = v1;
  swift_getAssociatedConformanceWitness();
  sub_2396D1ED0();
  sub_2396D1C40();
  uint64_t v21 = v7 * v5;
  if ((unsigned __int128)(v7 * (__int128)v5) >> 64 == (v7 * v5) >> 63)
  {
    uint64_t v22 = v5;
    if (v5)
    {
      BOOL v23 = v21 >= 0;
      if (v5 > 0) {
        BOOL v23 = v21 < 1;
      }
      if (!v23)
      {
        int64_t v24 = 0;
        uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 16);
        uint64_t v40 = v35 + 16;
        uint64_t v25 = *(void *)(v35 + 72);
        uint64_t v26 = (void (**)(char *, uint64_t))(v35 + 8);
        os_log_type_t v37 = (void (**)(char *, char *, uint64_t))(v35 + 32);
        uint64_t v38 = v25;
        do
        {
          uint64_t v27 = v22;
          BOOL v28 = __OFADD__(v24, v22);
          int64_t v29 = v24 + v22;
          unint64_t v30 = ((v24 + v22) >> 63) ^ 0x8000000000000000;
          if (v28) {
            int64_t v31 = v30;
          }
          else {
            int64_t v31 = v29;
          }
          v39(v13, v43 + v38 * v24, v3);
          sub_2396D0C00();
          uint64_t v32 = *v26;
          (*v26)(v13, v3);
          if (sub_2396D02B0())
          {
            v32(v20, v3);
            (*v37)(v20, v16, v3);
          }
          else
          {
            v32(v16, v3);
          }
          BOOL v33 = v31 >= v21;
          uint64_t v22 = v27;
          if (v27 <= 0) {
            BOOL v33 = v21 >= v31;
          }
          int64_t v24 = v31;
        }
        while (!v33);
      }
      (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(v36, v20, v3);
      goto LABEL_19;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void UnsafeMutableVectorPointer<A>.add(_:scaledBy:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v54 = v25;
  uint64_t v55 = v26;
  uint64_t v28 = v27;
  uint64_t v53 = v29;
  OUTLINED_FUNCTION_0_1();
  uint64_t v57 = v30;
  MEMORY[0x270FA5388](v31);
  OUTLINED_FUNCTION_6_100(v32, v50[0]);
  MEMORY[0x270FA5388](v33);
  uint64_t v51 = (char *)v50 - v36;
  if (v35 != v34) {
    goto LABEL_25;
  }
  uint64_t v58 = v35 * v24;
  if ((unsigned __int128)(v35 * (__int128)v24) >> 64 != (v35 * v24) >> 63)
  {
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v56 = v35 * v28;
  if ((unsigned __int128)(v35 * (__int128)v28) >> 64 != (v35 * v28) >> 63)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    uint64_t v61 = 0;
    unint64_t v62 = 0xE000000000000000;
    uint64_t v48 = v34;
    uint64_t v49 = v35;
    sub_2396D1200();
    sub_2396D04E0();
    uint64_t v60 = v49;
    OUTLINED_FUNCTION_4_103();
    sub_2396D04E0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_107();
    uint64_t v60 = v48;
    OUTLINED_FUNCTION_4_103();
    sub_2396D04E0();
    swift_bridgeObjectRelease();
    sub_2396D04E0();
    OUTLINED_FUNCTION_2_118();
    __break(1u);
    return;
  }
  if (!v28 || !v24) {
    goto LABEL_24;
  }
  BOOL v37 = v58 >= 0;
  if (v24 > 0) {
    BOOL v37 = v58 < 1;
  }
  if (!v37)
  {
    int64_t v38 = 0;
    int64_t v39 = 0;
    v50[2] = v57 + 16;
    v50[3] = a21;
    v50[1] = v57 + 8;
    uint64_t v40 = v51;
    do
    {
      BOOL v41 = v56 >= v38;
      if (v28 > 0) {
        BOOL v41 = v38 >= v56;
      }
      if (v41) {
        break;
      }
      if (__OFADD__(v39, v24)) {
        int64_t v42 = ((v39 + v24) >> 63) ^ 0x8000000000000000;
      }
      else {
        int64_t v42 = v39 + v24;
      }
      unint64_t v43 = v38 + v28;
      if (__OFADD__(v38, v28)) {
        unint64_t v43 = ((v38 + v28) >> 63) ^ 0x8000000000000000;
      }
      unint64_t v59 = v43;
      uint64_t v44 = v57;
      uint64_t v45 = v52;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 16))(v52, v53 + *(void *)(v57 + 72) * v38, v22);
      sub_2396D0BE0();
      uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
      v46(v45, v22);
      sub_2396D1680();
      v46((uint64_t)v40, v22);
      BOOL v47 = v42 >= v58;
      if (v24 <= 0) {
        BOOL v47 = v58 >= v42;
      }
      int64_t v38 = v59;
      int64_t v39 = v42;
    }
    while (!v47);
  }
  OUTLINED_FUNCTION_4_1();
}

uint64_t UnsafeMutableVectorPointer<A>.multiply(by:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a3 * a4;
  if ((unsigned __int128)(a3 * (__int128)a4) >> 64 != (a3 * a4) >> 63)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (!a4)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  BOOL v6 = v4 >= 0;
  if (a4 > 0) {
    BOOL v6 = v4 < 1;
  }
  if (!v6)
  {
    int64_t v7 = 0;
    do
    {
      if (__OFADD__(v7, a4)) {
        int64_t v8 = ((v7 + a4) >> 63) ^ 0x8000000000000000;
      }
      else {
        int64_t v8 = v7 + a4;
      }
      uint64_t result = sub_2396D0BF0();
      BOOL v10 = v8 >= v4;
      if (a4 <= 0) {
        BOOL v10 = v4 >= v8;
      }
      int64_t v7 = v8;
    }
    while (!v10);
  }
  return result;
}

void dot<A>(_:_:)()
{
  OUTLINED_FUNCTION_5_1();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v42 = v6;
  uint64_t v43 = v7;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v47 = v12;
  OUTLINED_FUNCTION_0_1();
  uint64_t v45 = v13;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_6_100(v15, v36[0]);
  MEMORY[0x270FA5388](v16);
  uint64_t v40 = (char *)v36 - v17;
  MEMORY[0x270FA5388](v18);
  int64_t v39 = (char *)v36 - v19;
  uint64_t v38 = *(void *)(*(void *)(v20 + 16) + 8);
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_5_109();
  MEMORY[0x270FA5388](v21);
  if (v11 != v5) {
    goto LABEL_25;
  }
  uint64_t v46 = v11 * v9;
  if ((unsigned __int128)(v11 * (__int128)v9) >> 64 != (v11 * v9) >> 63)
  {
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v44 = v11 * v3;
  if ((unsigned __int128)(v11 * (__int128)v3) >> 64 != (v11 * v3) >> 63)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    uint64_t v50 = 0;
    unint64_t v51 = 0xE000000000000000;
    sub_2396D1200();
    sub_2396D04E0();
    uint64_t v49 = v11;
    OUTLINED_FUNCTION_4_103();
    sub_2396D04E0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_107();
    uint64_t v49 = v5;
    OUTLINED_FUNCTION_4_103();
    sub_2396D04E0();
    swift_bridgeObjectRelease();
    sub_2396D04E0();
    OUTLINED_FUNCTION_2_118();
    __break(1u);
    return;
  }
  if (!v9 || !v3) {
    goto LABEL_24;
  }
  swift_getAssociatedConformanceWitness();
  sub_2396D1ED0();
  sub_2396D1C40();
  BOOL v22 = v46 >= 0;
  if (v9 > 0) {
    BOOL v22 = v46 < 1;
  }
  if (!v22)
  {
    int64_t v23 = 0;
    int64_t v24 = 0;
    v36[1] = v45 + 8;
    v36[2] = v45 + 16;
    uint64_t v37 = v3;
    uint64_t v25 = v40;
    uint64_t v26 = v41;
    do
    {
      BOOL v27 = v44 >= v23;
      if (v3 > 0) {
        BOOL v27 = v23 >= v44;
      }
      if (v27) {
        break;
      }
      if (__OFADD__(v24, v9)) {
        int64_t v28 = ((v24 + v9) >> 63) ^ 0x8000000000000000;
      }
      else {
        int64_t v28 = v24 + v9;
      }
      unint64_t v29 = v23 + v3;
      if (__OFADD__(v23, v3)) {
        unint64_t v29 = ((v23 + v3) >> 63) ^ 0x8000000000000000;
      }
      unint64_t v48 = v29;
      uint64_t v30 = v45;
      uint64_t v31 = v9;
      uint64_t v32 = *(void (**)(void))(v45 + 16);
      ((void (*)(char *, uint64_t, uint64_t))v32)(v25, v42 + *(void *)(v45 + 72) * v24, v1);
      OUTLINED_FUNCTION_11_76();
      v32();
      uint64_t v9 = v31;
      uint64_t v33 = v39;
      sub_2396D0BE0();
      uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
      v34(v26, v1);
      v34((uint64_t)v25, v1);
      sub_2396D1680();
      v34((uint64_t)v33, v1);
      uint64_t v3 = v37;
      BOOL v35 = v28 >= v46;
      if (v9 <= 0) {
        BOOL v35 = v46 >= v28;
      }
      int64_t v23 = v48;
      int64_t v24 = v28;
    }
    while (!v35);
  }
  OUTLINED_FUNCTION_4_1();
}

uint64_t UnsafeVectorPointer<A>.magnitude.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 > 0x7FFFFFFF)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000 || a3 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_9;
  }
  if (a3 <= 0x7FFFFFFF) {
    return MEMORY[0x270EDE480](a2, a1);
  }
LABEL_10:
  __break(1u);
  return MEMORY[0x270EDE480](a1, a2);
}

{
  if (a2 > 0x7FFFFFFF)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000 || a3 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_9;
  }
  if (a3 <= 0x7FFFFFFF) {
    return MEMORY[0x270EDE360](a2, a1);
  }
LABEL_10:
  __break(1u);
  return MEMORY[0x270EDE360](a1, a2);
}

uint64_t UnsafeVectorPointer<A>.maximumAbsoluteValue.getter(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2 >= 1)
  {
    if ((unint64_t)a2 >> 31)
    {
      __break(1u);
    }
    else if (a3 >= (uint64_t)0xFFFFFFFF80000000)
    {
      if (a3 <= 0x7FFFFFFF)
      {
        OUTLINED_FUNCTION_16_59(result, a2);
        return cblas_isamax_NEWLAPACK();
      }
      goto LABEL_9;
    }
    __break(1u);
LABEL_9:
    __break(1u);
  }
  return result;
}

{
  if (a2 >= 1)
  {
    if ((unint64_t)a2 >> 31)
    {
      __break(1u);
    }
    else if (a3 >= (uint64_t)0xFFFFFFFF80000000)
    {
      if (a3 <= 0x7FFFFFFF)
      {
        OUTLINED_FUNCTION_16_59(result, a2);
        return cblas_idamax_NEWLAPACK();
      }
      goto LABEL_9;
    }
    __break(1u);
LABEL_9:
    __break(1u);
  }
  return result;
}

uint64_t dot(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2 != a5) {
    goto LABEL_19;
  }
  if (a2 > 0x7FFFFFFF)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (a3 > 0x7FFFFFFF)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000 || a3 < (uint64_t)0xFFFFFFFF80000000 || a6 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_17;
  }
  if (a6 > 0x7FFFFFFF)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    OUTLINED_FUNCTION_9_77();
    OUTLINED_FUNCTION_19_53();
    OUTLINED_FUNCTION_13_72();
    OUTLINED_FUNCTION_3_113();
    OUTLINED_FUNCTION_18_55();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_107();
    OUTLINED_FUNCTION_3_113();
    OUTLINED_FUNCTION_17_65();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_7_89();
    OUTLINED_FUNCTION_20_58();
    uint64_t v10 = OUTLINED_FUNCTION_2_118();
    __break(1u);
    return MEMORY[0x270EDE428](v10, v11);
  }
  uint64_t v10 = a2;
  uint64_t v11 = a1;
  return MEMORY[0x270EDE428](v10, v11);
}

{
  uint64_t v6;
  uint64_t result;

  if (a2 != a5) {
    goto LABEL_19;
  }
  if (a2 > 0x7FFFFFFF)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (a3 > 0x7FFFFFFF)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000 || a3 < (uint64_t)0xFFFFFFFF80000000 || a6 < (uint64_t)0xFFFFFFFF80000000) {
    goto LABEL_17;
  }
  if (a6 > 0x7FFFFFFF)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    OUTLINED_FUNCTION_9_77();
    OUTLINED_FUNCTION_19_53();
    OUTLINED_FUNCTION_13_72();
    OUTLINED_FUNCTION_3_113();
    OUTLINED_FUNCTION_18_55();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_107();
    OUTLINED_FUNCTION_3_113();
    OUTLINED_FUNCTION_17_65();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_7_89();
    OUTLINED_FUNCTION_20_58();
    uint64_t result = OUTLINED_FUNCTION_2_118();
    __break(1u);
    return result;
  }
  return cblas_ddot_NEWLAPACK();
}

uint64_t OUTLINED_FUNCTION_1_107()
{
  return sub_2396D04E0();
}

uint64_t OUTLINED_FUNCTION_3_113()
{
  return sub_2396D19D0();
}

void OUTLINED_FUNCTION_6_100(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_7_89()
{
  return sub_2396D04E0();
}

uint64_t OUTLINED_FUNCTION_8_97()
{
  return sub_2396D1200();
}

uint64_t OUTLINED_FUNCTION_13_72()
{
  return sub_2396D04E0();
}

uint64_t OUTLINED_FUNCTION_14_70()
{
  return sub_2396D04E0();
}

uint64_t OUTLINED_FUNCTION_16_59(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_17_65()
{
  return sub_2396D04E0();
}

uint64_t OUTLINED_FUNCTION_18_55()
{
  return sub_2396D04E0();
}

uint64_t sub_2396CDB40()
{
  return MEMORY[0x270F9C918]();
}

uint64_t sub_2396CDB50()
{
  return MEMORY[0x270F9C930]();
}

uint64_t sub_2396CDB60()
{
  return MEMORY[0x270EEDD68]();
}

uint64_t sub_2396CDB70()
{
  return MEMORY[0x270EEDD70]();
}

uint64_t sub_2396CDB80()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_2396CDB90()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_2396CDBA0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_2396CDBB0()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_2396CDBC0()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_2396CDBD0()
{
  return MEMORY[0x270EEE218]();
}

uint64_t sub_2396CDBE0()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_2396CDBF0()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_2396CDC00()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_2396CDC10()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2396CDC20()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2396CDC30()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2396CDC40()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_2396CDC50()
{
  return MEMORY[0x270EEE6D0]();
}

uint64_t sub_2396CDC60()
{
  return MEMORY[0x270EEE700]();
}

uint64_t sub_2396CDC70()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_2396CDC80()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_2396CDC90()
{
  return MEMORY[0x270EEE800]();
}

uint64_t sub_2396CDCA0()
{
  return MEMORY[0x270EEE828]();
}

uint64_t sub_2396CDCB0()
{
  return MEMORY[0x270EEE848]();
}

uint64_t sub_2396CDCC0()
{
  return MEMORY[0x270EEE870]();
}

uint64_t sub_2396CDCD0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_2396CDCE0()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_2396CDCF0()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_2396CDD00()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_2396CDD10()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_2396CDD20()
{
  return MEMORY[0x270EEF0A0]();
}

uint64_t sub_2396CDD30()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2396CDD40()
{
  return MEMORY[0x270EEFBA8]();
}

uint64_t sub_2396CDD50()
{
  return MEMORY[0x270EEFBD0]();
}

uint64_t sub_2396CDD60()
{
  return MEMORY[0x270EEFC00]();
}

uint64_t sub_2396CDD70()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_2396CDD80()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_2396CDD90()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_2396CDDA0()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_2396CDDB0()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_2396CDDC0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2396CDDD0()
{
  return MEMORY[0x270EEFD58]();
}

uint64_t sub_2396CDDE0()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_2396CDDF0()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t sub_2396CDE00()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_2396CDE10()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_2396CDE20()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2396CDE30()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_2396CDE40()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2396CDE50()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_2396CDE60()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2396CDE70()
{
  return MEMORY[0x270EEFF98]();
}

uint64_t sub_2396CDE80()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_2396CDE90()
{
  return MEMORY[0x270EEFFB8]();
}

uint64_t sub_2396CDEA0()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_2396CDEB0()
{
  return MEMORY[0x270EEFFE8]();
}

uint64_t sub_2396CDEC0()
{
  return MEMORY[0x270EF0008]();
}

uint64_t sub_2396CDED0()
{
  return MEMORY[0x270EF0018]();
}

uint64_t sub_2396CDEE0()
{
  return MEMORY[0x270EF0048]();
}

uint64_t sub_2396CDEF0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_2396CDF00()
{
  return MEMORY[0x270EF0078]();
}

uint64_t sub_2396CDF10()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_2396CDF20()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_2396CDF30()
{
  return MEMORY[0x270EF00D0]();
}

uint64_t sub_2396CDF40()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2396CDF50()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2396CDF60()
{
  return MEMORY[0x270EF01B0]();
}

uint64_t sub_2396CDF70()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_2396CDF80()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_2396CDF90()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2396CDFA0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2396CDFB0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2396CDFC0()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_2396CDFD0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2396CDFE0()
{
  return MEMORY[0x270EF10F0]();
}

uint64_t sub_2396CDFF0()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_2396CE000()
{
  return MEMORY[0x270EF13A8]();
}

uint64_t sub_2396CE010()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_2396CE020()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_2396CE030()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_2396CE040()
{
  return MEMORY[0x270F05850]();
}

uint64_t sub_2396CE050()
{
  return MEMORY[0x270F05858]();
}

uint64_t sub_2396CE060()
{
  return MEMORY[0x270F05860]();
}

uint64_t sub_2396CE070()
{
  return MEMORY[0x270F05918]();
}

uint64_t sub_2396CE080()
{
  return MEMORY[0x270F05930]();
}

uint64_t sub_2396CE090()
{
  return MEMORY[0x270F05938]();
}

uint64_t sub_2396CE0A0()
{
  return MEMORY[0x270F05940]();
}

uint64_t sub_2396CE0B0()
{
  return MEMORY[0x270F05948]();
}

uint64_t sub_2396CE0D0()
{
  return MEMORY[0x270F05960]();
}

uint64_t sub_2396CE0E0()
{
  return MEMORY[0x270F05968]();
}

uint64_t sub_2396CE0F0()
{
  return MEMORY[0x270F05978]();
}

uint64_t sub_2396CE100()
{
  return MEMORY[0x270F05980]();
}

uint64_t sub_2396CE110()
{
  return MEMORY[0x270F05988]();
}

uint64_t sub_2396CE120()
{
  return MEMORY[0x270F05998]();
}

uint64_t sub_2396CE130()
{
  return MEMORY[0x270F059A0]();
}

uint64_t sub_2396CE140()
{
  return MEMORY[0x270F059A8]();
}

uint64_t sub_2396CE150()
{
  return MEMORY[0x270F059D0]();
}

uint64_t sub_2396CE160()
{
  return MEMORY[0x270F05A40]();
}

uint64_t sub_2396CE170()
{
  return MEMORY[0x270F05A50]();
}

uint64_t sub_2396CE180()
{
  return MEMORY[0x270F05A60]();
}

uint64_t sub_2396CE190()
{
  return MEMORY[0x270F05A68]();
}

uint64_t sub_2396CE1A0()
{
  return MEMORY[0x270F05A70]();
}

uint64_t sub_2396CE1B0()
{
  return MEMORY[0x270F05A78]();
}

uint64_t sub_2396CE1C0()
{
  return MEMORY[0x270F05A80]();
}

uint64_t sub_2396CE1D0()
{
  return MEMORY[0x270F05A88]();
}

uint64_t sub_2396CE1E0()
{
  return MEMORY[0x270F05A98]();
}

uint64_t sub_2396CE1F0()
{
  return MEMORY[0x270F05AB0]();
}

uint64_t sub_2396CE200()
{
  return MEMORY[0x270F05AC0]();
}

uint64_t sub_2396CE210()
{
  return MEMORY[0x270F05AD0]();
}

uint64_t sub_2396CE220()
{
  return MEMORY[0x270F05AE0]();
}

uint64_t sub_2396CE230()
{
  return MEMORY[0x270F05AE8]();
}

uint64_t sub_2396CE240()
{
  return MEMORY[0x270F05AF0]();
}

uint64_t sub_2396CE250()
{
  return MEMORY[0x270F05B08]();
}

uint64_t sub_2396CE260()
{
  return MEMORY[0x270F05B10]();
}

uint64_t sub_2396CE270()
{
  return MEMORY[0x270F05B18]();
}

uint64_t sub_2396CE280()
{
  return MEMORY[0x270F05B28]();
}

uint64_t sub_2396CE290()
{
  return MEMORY[0x270F9C7E8]();
}

uint64_t sub_2396CE2A0()
{
  return MEMORY[0x270F9C800]();
}

uint64_t sub_2396CE2B0()
{
  return MEMORY[0x270F9C810]();
}

uint64_t sub_2396CE2C0()
{
  return MEMORY[0x270F9C820]();
}

uint64_t sub_2396CE2D0()
{
  return MEMORY[0x270F9C890]();
}

uint64_t sub_2396CE2E0()
{
  return MEMORY[0x270FA12A8]();
}

uint64_t sub_2396CE2F0()
{
  return MEMORY[0x270FA12B0]();
}

uint64_t sub_2396CE300()
{
  return MEMORY[0x270FA12D0]();
}

uint64_t sub_2396CE310()
{
  return MEMORY[0x270FA12F8]();
}

uint64_t sub_2396CE320()
{
  return MEMORY[0x270FA1308]();
}

uint64_t sub_2396CE330()
{
  return MEMORY[0x270FA1310]();
}

uint64_t sub_2396CE350()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_2396CE360()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_2396CE370()
{
  return MEMORY[0x270F4DD50]();
}

uint64_t sub_2396CE380()
{
  return MEMORY[0x270F4DD58]();
}

uint64_t sub_2396CE390()
{
  return MEMORY[0x270F4DD60]();
}

uint64_t sub_2396CE3A0()
{
  return MEMORY[0x270F4DD98]();
}

uint64_t sub_2396CE3B0()
{
  return MEMORY[0x270F4DDA0]();
}

uint64_t sub_2396CE3C0()
{
  return MEMORY[0x270F4DDB0]();
}

uint64_t sub_2396CE3D0()
{
  return MEMORY[0x270F4DDB8]();
}

uint64_t sub_2396CE3E0()
{
  return MEMORY[0x270F4DDC0]();
}

uint64_t sub_2396CE3F0()
{
  return MEMORY[0x270F4DDD8]();
}

uint64_t sub_2396CE400()
{
  return MEMORY[0x270F4DDE0]();
}

uint64_t sub_2396CE410()
{
  return MEMORY[0x270F4DDE8]();
}

uint64_t sub_2396CE420()
{
  return MEMORY[0x270F4DDF0]();
}

uint64_t sub_2396CE430()
{
  return MEMORY[0x270F4DDF8]();
}

uint64_t sub_2396CE440()
{
  return MEMORY[0x270F4DE00]();
}

uint64_t sub_2396CE450()
{
  return MEMORY[0x270F4DE08]();
}

uint64_t sub_2396CE460()
{
  return MEMORY[0x270F4DE10]();
}

uint64_t sub_2396CE470()
{
  return MEMORY[0x270F4DE20]();
}

uint64_t sub_2396CE480()
{
  return MEMORY[0x270F4DE28]();
}

uint64_t sub_2396CE490()
{
  return MEMORY[0x270F4DE30]();
}

uint64_t sub_2396CE4A0()
{
  return MEMORY[0x270F4DE38]();
}

uint64_t sub_2396CE4B0()
{
  return MEMORY[0x270F4DE40]();
}

uint64_t sub_2396CE4C0()
{
  return MEMORY[0x270F4DE50]();
}

uint64_t sub_2396CE4D0()
{
  return MEMORY[0x270F4DE58]();
}

uint64_t sub_2396CE4E0()
{
  return MEMORY[0x270F4DE60]();
}

uint64_t sub_2396CE4F0()
{
  return MEMORY[0x270F4DE68]();
}

uint64_t sub_2396CE500()
{
  return MEMORY[0x270F4DE78]();
}

uint64_t sub_2396CE510()
{
  return MEMORY[0x270F4DE80]();
}

uint64_t sub_2396CE520()
{
  return MEMORY[0x270F4DE88]();
}

uint64_t sub_2396CE530()
{
  return MEMORY[0x270F4DE90]();
}

uint64_t sub_2396CE540()
{
  return MEMORY[0x270F4DE98]();
}

uint64_t sub_2396CE550()
{
  return MEMORY[0x270F4DEA0]();
}

uint64_t sub_2396CE560()
{
  return MEMORY[0x270F4DEA8]();
}

uint64_t sub_2396CE570()
{
  return MEMORY[0x270F4DEB0]();
}

uint64_t sub_2396CE580()
{
  return MEMORY[0x270F4DEB8]();
}

uint64_t sub_2396CE590()
{
  return MEMORY[0x270F4DEC0]();
}

uint64_t sub_2396CE5A0()
{
  return MEMORY[0x270F4DED8]();
}

uint64_t sub_2396CE5B0()
{
  return MEMORY[0x270F4DEE0]();
}

uint64_t sub_2396CE5C0()
{
  return MEMORY[0x270F4DEE8]();
}

uint64_t sub_2396CE5D0()
{
  return MEMORY[0x270F4DEF0]();
}

uint64_t sub_2396CE5E0()
{
  return MEMORY[0x270F4DEF8]();
}

uint64_t sub_2396CE5F0()
{
  return MEMORY[0x270F4DF08]();
}

uint64_t sub_2396CE600()
{
  return MEMORY[0x270F4DF10]();
}

uint64_t sub_2396CE610()
{
  return MEMORY[0x270F4DF18]();
}

uint64_t sub_2396CE620()
{
  return MEMORY[0x270F4DF20]();
}

uint64_t sub_2396CE630()
{
  return MEMORY[0x270F4DF28]();
}

uint64_t sub_2396CE640()
{
  return MEMORY[0x270F4DF30]();
}

uint64_t sub_2396CE650()
{
  return MEMORY[0x270F4DF38]();
}

uint64_t sub_2396CE660()
{
  return MEMORY[0x270F4DF40]();
}

uint64_t sub_2396CE670()
{
  return MEMORY[0x270F4DF48]();
}

uint64_t sub_2396CE680()
{
  return MEMORY[0x270F4DF50]();
}

uint64_t sub_2396CE690()
{
  return MEMORY[0x270F4DF58]();
}

uint64_t sub_2396CE6A0()
{
  return MEMORY[0x270F4DF60]();
}

uint64_t sub_2396CE6B0()
{
  return MEMORY[0x270F4DF68]();
}

uint64_t sub_2396CE6C0()
{
  return MEMORY[0x270F4DF70]();
}

uint64_t sub_2396CE6D0()
{
  return MEMORY[0x270F4DF78]();
}

uint64_t sub_2396CE6E0()
{
  return MEMORY[0x270F4DF80]();
}

uint64_t sub_2396CE6F0()
{
  return MEMORY[0x270F4DF90]();
}

uint64_t sub_2396CE700()
{
  return MEMORY[0x270F4DF98]();
}

uint64_t sub_2396CE710()
{
  return MEMORY[0x270F4DFA0]();
}

uint64_t sub_2396CE720()
{
  return MEMORY[0x270F4DFA8]();
}

uint64_t sub_2396CE730()
{
  return MEMORY[0x270F4DFB0]();
}

uint64_t sub_2396CE740()
{
  return MEMORY[0x270F4DFB8]();
}

uint64_t sub_2396CE750()
{
  return MEMORY[0x270F4DFC0]();
}

uint64_t sub_2396CE760()
{
  return MEMORY[0x270F4DFC8]();
}

uint64_t sub_2396CE770()
{
  return MEMORY[0x270F4DFD0]();
}

uint64_t sub_2396CE780()
{
  return MEMORY[0x270F4DFD8]();
}

uint64_t sub_2396CE790()
{
  return MEMORY[0x270F4DFE0]();
}

uint64_t sub_2396CE7A0()
{
  return MEMORY[0x270F4DFE8]();
}

uint64_t sub_2396CE7B0()
{
  return MEMORY[0x270F4E000]();
}

uint64_t sub_2396CE7C0()
{
  return MEMORY[0x270F4E008]();
}

uint64_t sub_2396CE7D0()
{
  return MEMORY[0x270F4E010]();
}

uint64_t sub_2396CE7E0()
{
  return MEMORY[0x270F4E028]();
}

uint64_t sub_2396CE7F0()
{
  return MEMORY[0x270F4E030]();
}

uint64_t sub_2396CE800()
{
  return MEMORY[0x270F4E038]();
}

uint64_t sub_2396CE810()
{
  return MEMORY[0x270F4E040]();
}

uint64_t sub_2396CE820()
{
  return MEMORY[0x270F4E048]();
}

uint64_t sub_2396CE840()
{
  return MEMORY[0x270F4E058]();
}

uint64_t sub_2396CE850()
{
  return MEMORY[0x270F4E060]();
}

uint64_t sub_2396CE860()
{
  return MEMORY[0x270F4E080]();
}

uint64_t sub_2396CE870()
{
  return MEMORY[0x270F4E088]();
}

uint64_t sub_2396CE880()
{
  return MEMORY[0x270F4E090]();
}

uint64_t sub_2396CE890()
{
  return MEMORY[0x270F4E098]();
}

uint64_t sub_2396CE8A0()
{
  return MEMORY[0x270F4E0B0]();
}

uint64_t sub_2396CE8B0()
{
  return MEMORY[0x270F4E0C0]();
}

uint64_t sub_2396CE8C0()
{
  return MEMORY[0x270F4E128]();
}

uint64_t sub_2396CE8D0()
{
  return MEMORY[0x270F4E130]();
}

uint64_t sub_2396CE8E0()
{
  return MEMORY[0x270F4E140]();
}

uint64_t sub_2396CE8F0()
{
  return MEMORY[0x270F4E170]();
}

uint64_t sub_2396CE900()
{
  return MEMORY[0x270F4E178]();
}

uint64_t sub_2396CE910()
{
  return MEMORY[0x270F4E180]();
}

uint64_t sub_2396CE920()
{
  return MEMORY[0x270F4E190]();
}

uint64_t sub_2396CE930()
{
  return MEMORY[0x270F4E1A0]();
}

uint64_t sub_2396CE940()
{
  return MEMORY[0x270F4E1B0]();
}

uint64_t sub_2396CE950()
{
  return MEMORY[0x270F4E1C0]();
}

uint64_t sub_2396CE960()
{
  return MEMORY[0x270F4E1E0]();
}

uint64_t sub_2396CE970()
{
  return MEMORY[0x270F4E1E8]();
}

uint64_t sub_2396CE980()
{
  return MEMORY[0x270F4E228]();
}

uint64_t sub_2396CE990()
{
  return MEMORY[0x270F4E238]();
}

uint64_t sub_2396CE9A0()
{
  return MEMORY[0x270F4E248]();
}

uint64_t sub_2396CE9B0()
{
  return MEMORY[0x270F4E250]();
}

uint64_t sub_2396CE9C0()
{
  return MEMORY[0x270F4E270]();
}

uint64_t sub_2396CE9D0()
{
  return MEMORY[0x270F4E278]();
}

uint64_t sub_2396CE9E0()
{
  return MEMORY[0x270F4E280]();
}

uint64_t sub_2396CE9F0()
{
  return MEMORY[0x270F4E288]();
}

uint64_t sub_2396CEA00()
{
  return MEMORY[0x270F4E290]();
}

uint64_t sub_2396CEA10()
{
  return MEMORY[0x270F4E2A0]();
}

uint64_t sub_2396CEA30()
{
  return MEMORY[0x270F4E2B0]();
}

uint64_t sub_2396CEA40()
{
  return MEMORY[0x270F4E2C8]();
}

uint64_t sub_2396CEA50()
{
  return MEMORY[0x270F4E2D0]();
}

uint64_t sub_2396CEA60()
{
  return MEMORY[0x270F4E2D8]();
}

uint64_t sub_2396CEA70()
{
  return MEMORY[0x270F4E2E0]();
}

uint64_t sub_2396CEA80()
{
  return MEMORY[0x270F4E2F0]();
}

uint64_t sub_2396CEA90()
{
  return MEMORY[0x270F4E2F8]();
}

uint64_t sub_2396CEAA0()
{
  return MEMORY[0x270F4E300]();
}

uint64_t sub_2396CEAB0()
{
  return MEMORY[0x270F4E308]();
}

uint64_t sub_2396CEAC0()
{
  return MEMORY[0x270F4E318]();
}

uint64_t sub_2396CEAD0()
{
  return MEMORY[0x270F4E328]();
}

uint64_t sub_2396CEAE0()
{
  return MEMORY[0x270F4E330]();
}

uint64_t sub_2396CEAF0()
{
  return MEMORY[0x270F4E338]();
}

uint64_t sub_2396CEB00()
{
  return MEMORY[0x270F4E348]();
}

uint64_t sub_2396CEB10()
{
  return MEMORY[0x270F4E350]();
}

uint64_t sub_2396CEB20()
{
  return MEMORY[0x270F4E358]();
}

uint64_t sub_2396CEB30()
{
  return MEMORY[0x270F4E360]();
}

uint64_t sub_2396CEB40()
{
  return MEMORY[0x270F4E368]();
}

uint64_t sub_2396CEB50()
{
  return MEMORY[0x270F4E378]();
}

uint64_t sub_2396CEB60()
{
  return MEMORY[0x270F4E388]();
}

uint64_t sub_2396CEB70()
{
  return MEMORY[0x270F4E398]();
}

uint64_t sub_2396CEB80()
{
  return MEMORY[0x270F4E3A0]();
}

uint64_t sub_2396CEB90()
{
  return MEMORY[0x270F4E3B0]();
}

uint64_t sub_2396CEBA0()
{
  return MEMORY[0x270F4E3C0]();
}

uint64_t sub_2396CEBB0()
{
  return MEMORY[0x270F4E3D8]();
}

uint64_t sub_2396CEBC0()
{
  return MEMORY[0x270F4E3E8]();
}

uint64_t sub_2396CEBD0()
{
  return MEMORY[0x270F4E3F8]();
}

uint64_t sub_2396CEBE0()
{
  return MEMORY[0x270F4E400]();
}

uint64_t sub_2396CEBF0()
{
  return MEMORY[0x270FA2990]();
}

uint64_t sub_2396CEC00()
{
  return MEMORY[0x270FA29D0]();
}

uint64_t sub_2396CEC10()
{
  return MEMORY[0x270FA29F8]();
}

uint64_t sub_2396CEC20()
{
  return MEMORY[0x270FA2A28]();
}

uint64_t sub_2396CEC30()
{
  return MEMORY[0x270FA1390]();
}

uint64_t sub_2396CEC40()
{
  return MEMORY[0x270FA2A70]();
}

uint64_t sub_2396CEC50()
{
  return MEMORY[0x270FA2AB0]();
}

uint64_t sub_2396CEC60()
{
  return MEMORY[0x270FA2AB8]();
}

uint64_t sub_2396CEC70()
{
  return MEMORY[0x270F488F0]();
}

uint64_t sub_2396CEC80()
{
  return MEMORY[0x270F488F8]();
}

uint64_t sub_2396CEC90()
{
  return MEMORY[0x270F48900]();
}

uint64_t sub_2396CECA0()
{
  return MEMORY[0x270F48908]();
}

uint64_t sub_2396CECB0()
{
  return MEMORY[0x270F48918]();
}

uint64_t sub_2396CECC0()
{
  return MEMORY[0x270F48920]();
}

uint64_t sub_2396CECD0()
{
  return MEMORY[0x270F48928]();
}

uint64_t sub_2396CECE0()
{
  return MEMORY[0x270F48930]();
}

uint64_t sub_2396CECF0()
{
  return MEMORY[0x270F48938]();
}

uint64_t sub_2396CED00()
{
  return MEMORY[0x270F48950]();
}

uint64_t sub_2396CED10()
{
  return MEMORY[0x270F48958]();
}

uint64_t sub_2396CED20()
{
  return MEMORY[0x270F48960]();
}

uint64_t sub_2396CED30()
{
  return MEMORY[0x270F48968]();
}

uint64_t sub_2396CED40()
{
  return MEMORY[0x270F48970]();
}

uint64_t sub_2396CED50()
{
  return MEMORY[0x270F48978]();
}

uint64_t sub_2396CED60()
{
  return MEMORY[0x270F48980]();
}

uint64_t sub_2396CED70()
{
  return MEMORY[0x270F48988]();
}

uint64_t sub_2396CED80()
{
  return MEMORY[0x270F48990]();
}

uint64_t sub_2396CED90()
{
  return MEMORY[0x270F48998]();
}

uint64_t sub_2396CEDA0()
{
  return MEMORY[0x270F489A0]();
}

uint64_t sub_2396CEDB0()
{
  return MEMORY[0x270F489A8]();
}

uint64_t sub_2396CEDC0()
{
  return MEMORY[0x270F489B0]();
}

uint64_t sub_2396CEDD0()
{
  return MEMORY[0x270F489B8]();
}

uint64_t sub_2396CEDE0()
{
  return MEMORY[0x270F489C0]();
}

uint64_t sub_2396CEDF0()
{
  return MEMORY[0x270F489C8]();
}

uint64_t sub_2396CEE00()
{
  return MEMORY[0x270F489D0]();
}

uint64_t sub_2396CEE10()
{
  return MEMORY[0x270F489D8]();
}

uint64_t sub_2396CEE20()
{
  return MEMORY[0x270F489E0]();
}

uint64_t sub_2396CEE30()
{
  return MEMORY[0x270F489E8]();
}

uint64_t sub_2396CEE40()
{
  return MEMORY[0x270F489F0]();
}

uint64_t sub_2396CEE50()
{
  return MEMORY[0x270F489F8]();
}

uint64_t sub_2396CEE60()
{
  return MEMORY[0x270F48A00]();
}

uint64_t sub_2396CEE70()
{
  return MEMORY[0x270F48A08]();
}

uint64_t sub_2396CEE80()
{
  return MEMORY[0x270F48A10]();
}

uint64_t sub_2396CEE90()
{
  return MEMORY[0x270F48A18]();
}

uint64_t sub_2396CEEA0()
{
  return MEMORY[0x270F48A20]();
}

uint64_t sub_2396CEEB0()
{
  return MEMORY[0x270F48A28]();
}

uint64_t sub_2396CEEC0()
{
  return MEMORY[0x270F48A30]();
}

uint64_t sub_2396CEED0()
{
  return MEMORY[0x270F48A38]();
}

uint64_t sub_2396CEEE0()
{
  return MEMORY[0x270F48A40]();
}

uint64_t sub_2396CEEF0()
{
  return MEMORY[0x270F48A48]();
}

uint64_t sub_2396CEF00()
{
  return MEMORY[0x270F48A50]();
}

uint64_t sub_2396CEF10()
{
  return MEMORY[0x270F48A58]();
}

uint64_t sub_2396CEF20()
{
  return MEMORY[0x270F48A68]();
}

uint64_t sub_2396CEF30()
{
  return MEMORY[0x270F48A70]();
}

uint64_t sub_2396CEF40()
{
  return MEMORY[0x270F48A78]();
}

uint64_t sub_2396CEF50()
{
  return MEMORY[0x270F48A90]();
}

uint64_t sub_2396CEF60()
{
  return MEMORY[0x270F48AA8]();
}

uint64_t sub_2396CEF70()
{
  return MEMORY[0x270F48BC0]();
}

uint64_t sub_2396CEF80()
{
  return MEMORY[0x270F48BD8]();
}

uint64_t sub_2396CEF90()
{
  return MEMORY[0x270F48BE0]();
}

uint64_t sub_2396CEFA0()
{
  return MEMORY[0x270F48BE8]();
}

uint64_t sub_2396CEFB0()
{
  return MEMORY[0x270F48C30]();
}

uint64_t sub_2396CEFC0()
{
  return MEMORY[0x270F48C48]();
}

uint64_t sub_2396CEFD0()
{
  return MEMORY[0x270F48C60]();
}

uint64_t sub_2396CEFE0()
{
  return MEMORY[0x270F48C80]();
}

uint64_t sub_2396CEFF0()
{
  return MEMORY[0x270F48C88]();
}

uint64_t sub_2396CF000()
{
  return MEMORY[0x270F48CB8]();
}

uint64_t sub_2396CF010()
{
  return MEMORY[0x270F48D10]();
}

uint64_t sub_2396CF020()
{
  return MEMORY[0x270F48D18]();
}

uint64_t sub_2396CF030()
{
  return MEMORY[0x270F48D20]();
}

uint64_t sub_2396CF040()
{
  return MEMORY[0x270F48D28]();
}

uint64_t sub_2396CF050()
{
  return MEMORY[0x270F48D30]();
}

uint64_t sub_2396CF060()
{
  return MEMORY[0x270F48D40]();
}

uint64_t sub_2396CF070()
{
  return MEMORY[0x270F48D48]();
}

uint64_t sub_2396CF080()
{
  return MEMORY[0x270F48D50]();
}

uint64_t sub_2396CF090()
{
  return MEMORY[0x270F48D58]();
}

uint64_t sub_2396CF0A0()
{
  return MEMORY[0x270F48D60]();
}

uint64_t sub_2396CF0B0()
{
  return MEMORY[0x270F48D68]();
}

uint64_t sub_2396CF0C0()
{
  return MEMORY[0x270F48D70]();
}

uint64_t sub_2396CF0D0()
{
  return MEMORY[0x270F48D78]();
}

uint64_t sub_2396CF0E0()
{
  return MEMORY[0x270F48D80]();
}

uint64_t sub_2396CF0F0()
{
  return MEMORY[0x270F48D88]();
}

uint64_t sub_2396CF100()
{
  return MEMORY[0x270F48D90]();
}

uint64_t sub_2396CF110()
{
  return MEMORY[0x270F48D98]();
}

uint64_t sub_2396CF120()
{
  return MEMORY[0x270F48DA0]();
}

uint64_t sub_2396CF130()
{
  return MEMORY[0x270F48DA8]();
}

uint64_t sub_2396CF140()
{
  return MEMORY[0x270F48DB0]();
}

uint64_t sub_2396CF150()
{
  return MEMORY[0x270F48DC0]();
}

uint64_t sub_2396CF160()
{
  return MEMORY[0x270F48DC8]();
}

uint64_t sub_2396CF170()
{
  return MEMORY[0x270F48DD8]();
}

uint64_t sub_2396CF180()
{
  return MEMORY[0x270F48DE0]();
}

uint64_t sub_2396CF190()
{
  return MEMORY[0x270F48DE8]();
}

uint64_t sub_2396CF1A0()
{
  return MEMORY[0x270F48DF0]();
}

uint64_t sub_2396CF1B0()
{
  return MEMORY[0x270F48E00]();
}

uint64_t sub_2396CF1C0()
{
  return MEMORY[0x270F48E08]();
}

uint64_t sub_2396CF1D0()
{
  return MEMORY[0x270F48E10]();
}

uint64_t sub_2396CF1E0()
{
  return MEMORY[0x270F48E20]();
}

uint64_t sub_2396CF1F0()
{
  return MEMORY[0x270F48E38]();
}

uint64_t sub_2396CF200()
{
  return MEMORY[0x270F48E40]();
}

uint64_t sub_2396CF210()
{
  return MEMORY[0x270F48E48]();
}

uint64_t sub_2396CF220()
{
  return MEMORY[0x270F48E50]();
}

uint64_t sub_2396CF230()
{
  return MEMORY[0x270F48E58]();
}

uint64_t sub_2396CF240()
{
  return MEMORY[0x270F48E60]();
}

uint64_t sub_2396CF250()
{
  return MEMORY[0x270F48E68]();
}

uint64_t sub_2396CF260()
{
  return MEMORY[0x270F48E70]();
}

uint64_t sub_2396CF270()
{
  return MEMORY[0x270F48E78]();
}

uint64_t sub_2396CF280()
{
  return MEMORY[0x270F48E80]();
}

uint64_t sub_2396CF290()
{
  return MEMORY[0x270F48E88]();
}

uint64_t sub_2396CF2A0()
{
  return MEMORY[0x270F48E90]();
}

uint64_t sub_2396CF2B0()
{
  return MEMORY[0x270F48E98]();
}

uint64_t sub_2396CF2C0()
{
  return MEMORY[0x270F48EA0]();
}

uint64_t sub_2396CF2D0()
{
  return MEMORY[0x270F48EA8]();
}

uint64_t sub_2396CF2E0()
{
  return MEMORY[0x270F48EB0]();
}

uint64_t sub_2396CF2F0()
{
  return MEMORY[0x270F48EB8]();
}

uint64_t sub_2396CF300()
{
  return MEMORY[0x270F48EC0]();
}

uint64_t sub_2396CF310()
{
  return MEMORY[0x270F48EC8]();
}

uint64_t sub_2396CF320()
{
  return MEMORY[0x270F48ED0]();
}

uint64_t sub_2396CF330()
{
  return MEMORY[0x270F48ED8]();
}

uint64_t sub_2396CF340()
{
  return MEMORY[0x270F48EE0]();
}

uint64_t sub_2396CF350()
{
  return MEMORY[0x270F48EE8]();
}

uint64_t sub_2396CF360()
{
  return MEMORY[0x270F48F00]();
}

uint64_t sub_2396CF370()
{
  return MEMORY[0x270F48F08]();
}

uint64_t sub_2396CF380()
{
  return MEMORY[0x270F48F10]();
}

uint64_t sub_2396CF390()
{
  return MEMORY[0x270F48F18]();
}

uint64_t sub_2396CF3A0()
{
  return MEMORY[0x270F48F20]();
}

uint64_t sub_2396CF3B0()
{
  return MEMORY[0x270F48F30]();
}

uint64_t sub_2396CF3C0()
{
  return MEMORY[0x270F48F38]();
}

uint64_t sub_2396CF3D0()
{
  return MEMORY[0x270F48F40]();
}

uint64_t sub_2396CF3E0()
{
  return MEMORY[0x270F48F48]();
}

uint64_t sub_2396CF3F0()
{
  return MEMORY[0x270F48F50]();
}

uint64_t sub_2396CF400()
{
  return MEMORY[0x270F48F58]();
}

uint64_t sub_2396CF410()
{
  return MEMORY[0x270F48F60]();
}

uint64_t sub_2396CF420()
{
  return MEMORY[0x270F48F68]();
}

uint64_t sub_2396CF430()
{
  return MEMORY[0x270F48F70]();
}

uint64_t sub_2396CF440()
{
  return MEMORY[0x270F48F78]();
}

uint64_t sub_2396CF450()
{
  return MEMORY[0x270F48F80]();
}

uint64_t sub_2396CF460()
{
  return MEMORY[0x270F48F88]();
}

uint64_t sub_2396CF470()
{
  return MEMORY[0x270F48F90]();
}

uint64_t sub_2396CF480()
{
  return MEMORY[0x270F48F98]();
}

uint64_t sub_2396CF490()
{
  return MEMORY[0x270F48FA0]();
}

uint64_t sub_2396CF4A0()
{
  return MEMORY[0x270F48FA8]();
}

uint64_t sub_2396CF4B0()
{
  return MEMORY[0x270F48FB8]();
}

uint64_t sub_2396CF4C0()
{
  return MEMORY[0x270F48FC0]();
}

uint64_t sub_2396CF4D0()
{
  return MEMORY[0x270F48FC8]();
}

uint64_t sub_2396CF4E0()
{
  return MEMORY[0x270F48FD0]();
}

uint64_t sub_2396CF4F0()
{
  return MEMORY[0x270F48FD8]();
}

uint64_t sub_2396CF500()
{
  return MEMORY[0x270F48FE0]();
}

uint64_t sub_2396CF510()
{
  return MEMORY[0x270F48FE8]();
}

uint64_t sub_2396CF520()
{
  return MEMORY[0x270F48FF0]();
}

uint64_t sub_2396CF530()
{
  return MEMORY[0x270F48FF8]();
}

uint64_t sub_2396CF540()
{
  return MEMORY[0x270F49010]();
}

uint64_t sub_2396CF550()
{
  return MEMORY[0x270F49018]();
}

uint64_t sub_2396CF560()
{
  return MEMORY[0x270F49020]();
}

uint64_t sub_2396CF570()
{
  return MEMORY[0x270F49028]();
}

uint64_t sub_2396CF580()
{
  return MEMORY[0x270F49030]();
}

uint64_t sub_2396CF590()
{
  return MEMORY[0x270F49038]();
}

uint64_t sub_2396CF5A0()
{
  return MEMORY[0x270F49040]();
}

uint64_t sub_2396CF5B0()
{
  return MEMORY[0x270F49048]();
}

uint64_t sub_2396CF5C0()
{
  return MEMORY[0x270F49050]();
}

uint64_t sub_2396CF5D0()
{
  return MEMORY[0x270F49058]();
}

uint64_t sub_2396CF5E0()
{
  return MEMORY[0x270F49060]();
}

uint64_t sub_2396CF5F0()
{
  return MEMORY[0x270F49068]();
}

uint64_t sub_2396CF600()
{
  return MEMORY[0x270F49070]();
}

uint64_t sub_2396CF610()
{
  return MEMORY[0x270F49078]();
}

uint64_t sub_2396CF620()
{
  return MEMORY[0x270F49080]();
}

uint64_t sub_2396CF630()
{
  return MEMORY[0x270F49088]();
}

uint64_t sub_2396CF650()
{
  return MEMORY[0x270F49098]();
}

uint64_t sub_2396CF660()
{
  return MEMORY[0x270F490A0]();
}

uint64_t sub_2396CF670()
{
  return MEMORY[0x270F490A8]();
}

uint64_t sub_2396CF680()
{
  return MEMORY[0x270F490B0]();
}

uint64_t sub_2396CF690()
{
  return MEMORY[0x270F490C8]();
}

uint64_t sub_2396CF6A0()
{
  return MEMORY[0x270F490D0]();
}

uint64_t sub_2396CF6B0()
{
  return MEMORY[0x270F490D8]();
}

uint64_t sub_2396CF6C0()
{
  return MEMORY[0x270F490E0]();
}

uint64_t sub_2396CF6D0()
{
  return MEMORY[0x270F490F0]();
}

uint64_t sub_2396CF6E0()
{
  return MEMORY[0x270F490F8]();
}

uint64_t sub_2396CF6F0()
{
  return MEMORY[0x270F49100]();
}

uint64_t sub_2396CF700()
{
  return MEMORY[0x270F49108]();
}

uint64_t sub_2396CF710()
{
  return MEMORY[0x270F49110]();
}

uint64_t sub_2396CF720()
{
  return MEMORY[0x270F49118]();
}

uint64_t sub_2396CF730()
{
  return MEMORY[0x270F49120]();
}

uint64_t sub_2396CF740()
{
  return MEMORY[0x270F49128]();
}

uint64_t sub_2396CF750()
{
  return MEMORY[0x270F49130]();
}

uint64_t sub_2396CF760()
{
  return MEMORY[0x270F49138]();
}

uint64_t sub_2396CF770()
{
  return MEMORY[0x270F49140]();
}

uint64_t sub_2396CF780()
{
  return MEMORY[0x270F49148]();
}

uint64_t sub_2396CF790()
{
  return MEMORY[0x270F49150]();
}

uint64_t sub_2396CF7A0()
{
  return MEMORY[0x270F49158]();
}

uint64_t sub_2396CF7B0()
{
  return MEMORY[0x270F49160]();
}

uint64_t sub_2396CF7C0()
{
  return MEMORY[0x270F49168]();
}

uint64_t sub_2396CF7D0()
{
  return MEMORY[0x270F49170]();
}

uint64_t sub_2396CF7E0()
{
  return MEMORY[0x270F49178]();
}

uint64_t sub_2396CF7F0()
{
  return MEMORY[0x270F49180]();
}

uint64_t sub_2396CF800()
{
  return MEMORY[0x270F49198]();
}

uint64_t sub_2396CF810()
{
  return MEMORY[0x270F491A0]();
}

uint64_t sub_2396CF820()
{
  return MEMORY[0x270F491A8]();
}

uint64_t sub_2396CF830()
{
  return MEMORY[0x270F491B0]();
}

uint64_t sub_2396CF840()
{
  return MEMORY[0x270F491B8]();
}

uint64_t sub_2396CF850()
{
  return MEMORY[0x270F491C0]();
}

uint64_t sub_2396CF860()
{
  return MEMORY[0x270F491C8]();
}

uint64_t sub_2396CF870()
{
  return MEMORY[0x270F491D8]();
}

uint64_t sub_2396CF880()
{
  return MEMORY[0x270F491E0]();
}

uint64_t sub_2396CF890()
{
  return MEMORY[0x270F491F0]();
}

uint64_t sub_2396CF8A0()
{
  return MEMORY[0x270F491F8]();
}

uint64_t sub_2396CF8B0()
{
  return MEMORY[0x270F49200]();
}

uint64_t sub_2396CF8C0()
{
  return MEMORY[0x270F49210]();
}

uint64_t sub_2396CF8D0()
{
  return MEMORY[0x270F49218]();
}

uint64_t sub_2396CF8E0()
{
  return MEMORY[0x270F49220]();
}

uint64_t sub_2396CF8F0()
{
  return MEMORY[0x270F49228]();
}

uint64_t sub_2396CF900()
{
  return MEMORY[0x270F49230]();
}

uint64_t sub_2396CF910()
{
  return MEMORY[0x270F49238]();
}

uint64_t sub_2396CF920()
{
  return MEMORY[0x270F49240]();
}

uint64_t sub_2396CF930()
{
  return MEMORY[0x270F49248]();
}

uint64_t sub_2396CF940()
{
  return MEMORY[0x270F49250]();
}

uint64_t sub_2396CF950()
{
  return MEMORY[0x270F49268]();
}

uint64_t sub_2396CF960()
{
  return MEMORY[0x270F49270]();
}

uint64_t sub_2396CF970()
{
  return MEMORY[0x270F49280]();
}

uint64_t sub_2396CF980()
{
  return MEMORY[0x270F49288]();
}

uint64_t sub_2396CF990()
{
  return MEMORY[0x270F49290]();
}

uint64_t sub_2396CF9A0()
{
  return MEMORY[0x270F49298]();
}

uint64_t sub_2396CF9B0()
{
  return MEMORY[0x270F492A0]();
}

uint64_t sub_2396CF9C0()
{
  return MEMORY[0x270F492A8]();
}

uint64_t sub_2396CF9D0()
{
  return MEMORY[0x270F492B0]();
}

uint64_t sub_2396CF9E0()
{
  return MEMORY[0x270F492B8]();
}

uint64_t sub_2396CF9F0()
{
  return MEMORY[0x270F492C0]();
}

uint64_t sub_2396CFA00()
{
  return MEMORY[0x270F492C8]();
}

uint64_t sub_2396CFA10()
{
  return MEMORY[0x270F492D0]();
}

uint64_t sub_2396CFA20()
{
  return MEMORY[0x270F492D8]();
}

uint64_t sub_2396CFA30()
{
  return MEMORY[0x270F492E0]();
}

uint64_t sub_2396CFA40()
{
  return MEMORY[0x270F492E8]();
}

uint64_t sub_2396CFA50()
{
  return MEMORY[0x270F492F0]();
}

uint64_t sub_2396CFA60()
{
  return MEMORY[0x270F492F8]();
}

uint64_t sub_2396CFA70()
{
  return MEMORY[0x270F49300]();
}

uint64_t sub_2396CFA80()
{
  return MEMORY[0x270F49308]();
}

uint64_t sub_2396CFA90()
{
  return MEMORY[0x270F49310]();
}

uint64_t sub_2396CFAA0()
{
  return MEMORY[0x270F49318]();
}

uint64_t sub_2396CFAB0()
{
  return MEMORY[0x270F49320]();
}

uint64_t sub_2396CFAC0()
{
  return MEMORY[0x270F49328]();
}

uint64_t sub_2396CFAD0()
{
  return MEMORY[0x270F49330]();
}

uint64_t sub_2396CFAE0()
{
  return MEMORY[0x270F49338]();
}

uint64_t sub_2396CFAF0()
{
  return MEMORY[0x270F49348]();
}

uint64_t sub_2396CFB00()
{
  return MEMORY[0x270F49350]();
}

uint64_t sub_2396CFB10()
{
  return MEMORY[0x270F49358]();
}

uint64_t sub_2396CFB20()
{
  return MEMORY[0x270F49360]();
}

uint64_t sub_2396CFB30()
{
  return MEMORY[0x270F49368]();
}

uint64_t sub_2396CFB40()
{
  return MEMORY[0x270F49370]();
}

uint64_t sub_2396CFB50()
{
  return MEMORY[0x270F49380]();
}

uint64_t sub_2396CFB60()
{
  return MEMORY[0x270F49388]();
}

uint64_t sub_2396CFB70()
{
  return MEMORY[0x270F49390]();
}

uint64_t sub_2396CFB80()
{
  return MEMORY[0x270F493A8]();
}

uint64_t sub_2396CFB90()
{
  return MEMORY[0x270F493B0]();
}

uint64_t sub_2396CFBA0()
{
  return MEMORY[0x270F493B8]();
}

uint64_t sub_2396CFBB0()
{
  return MEMORY[0x270F493C0]();
}

uint64_t sub_2396CFBC0()
{
  return MEMORY[0x270F493C8]();
}

uint64_t sub_2396CFBD0()
{
  return MEMORY[0x270F493D0]();
}

uint64_t sub_2396CFBE0()
{
  return MEMORY[0x270F493D8]();
}

uint64_t sub_2396CFBF0()
{
  return MEMORY[0x270F493E0]();
}

uint64_t sub_2396CFC00()
{
  return MEMORY[0x270F493E8]();
}

uint64_t sub_2396CFC10()
{
  return MEMORY[0x270F493F0]();
}

uint64_t sub_2396CFC20()
{
  return MEMORY[0x270F493F8]();
}

uint64_t sub_2396CFC30()
{
  return MEMORY[0x270F49400]();
}

uint64_t sub_2396CFC40()
{
  return MEMORY[0x270F49408]();
}

uint64_t sub_2396CFC50()
{
  return MEMORY[0x270F49410]();
}

uint64_t sub_2396CFC60()
{
  return MEMORY[0x270F49420]();
}

uint64_t sub_2396CFC70()
{
  return MEMORY[0x270F49428]();
}

uint64_t sub_2396CFC80()
{
  return MEMORY[0x270F49430]();
}

uint64_t sub_2396CFC90()
{
  return MEMORY[0x270F49438]();
}

uint64_t sub_2396CFCA0()
{
  return MEMORY[0x270F49440]();
}

uint64_t sub_2396CFCB0()
{
  return MEMORY[0x270F49448]();
}

uint64_t sub_2396CFCC0()
{
  return MEMORY[0x270F49450]();
}

uint64_t sub_2396CFCD0()
{
  return MEMORY[0x270FA1750]();
}

uint64_t sub_2396CFCE0()
{
  return MEMORY[0x270FA1800]();
}

uint64_t sub_2396CFCF0()
{
  return MEMORY[0x270FA18E0]();
}

uint64_t sub_2396CFD00()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_2396CFD10()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2396CFD20()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2396CFD30()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2396CFD40()
{
  return MEMORY[0x270EE74F8]();
}

uint64_t sub_2396CFD50()
{
  return MEMORY[0x270EE7508]();
}

uint64_t sub_2396CFD60()
{
  return MEMORY[0x270EE7510]();
}

uint64_t sub_2396CFD80()
{
  return MEMORY[0x270EE7528]();
}

uint64_t sub_2396CFD90()
{
  return MEMORY[0x270EE7530]();
}

uint64_t sub_2396CFDA0()
{
  return MEMORY[0x270EE7538]();
}

uint64_t sub_2396CFDB0()
{
  return MEMORY[0x270EE7540]();
}

uint64_t sub_2396CFDC0()
{
  return MEMORY[0x270EE7548]();
}

uint64_t sub_2396CFDD0()
{
  return MEMORY[0x270EE7558]();
}

uint64_t sub_2396CFDE0()
{
  return MEMORY[0x270EE7568]();
}

uint64_t sub_2396CFDF0()
{
  return MEMORY[0x270EE7570]();
}

uint64_t sub_2396CFE00()
{
  return MEMORY[0x270EE7578]();
}

uint64_t sub_2396CFE10()
{
  return MEMORY[0x270EE7590]();
}

uint64_t sub_2396CFE20()
{
  return MEMORY[0x270EE75A0]();
}

uint64_t sub_2396CFE30()
{
  return MEMORY[0x270EE75D0]();
}

uint64_t sub_2396CFE50()
{
  return MEMORY[0x270EE7600]();
}

uint64_t sub_2396CFE60()
{
  return MEMORY[0x270EE7608]();
}

uint64_t sub_2396CFE70()
{
  return MEMORY[0x270EE7610]();
}

uint64_t sub_2396CFE80()
{
  return MEMORY[0x270EE7618]();
}

uint64_t sub_2396CFE90()
{
  return MEMORY[0x270EE7620]();
}

uint64_t sub_2396CFEA0()
{
  return MEMORY[0x270EE7628]();
}

uint64_t sub_2396CFEB0()
{
  return MEMORY[0x270EE7638]();
}

uint64_t sub_2396CFEC0()
{
  return MEMORY[0x270EE7650]();
}

uint64_t sub_2396CFED0()
{
  return MEMORY[0x270EE7660]();
}

uint64_t sub_2396CFEE0()
{
  return MEMORY[0x270EE7668]();
}

uint64_t sub_2396CFEF0()
{
  return MEMORY[0x270EE7670]();
}

uint64_t sub_2396CFF00()
{
  return MEMORY[0x270EE7678]();
}

uint64_t sub_2396CFF10()
{
  return MEMORY[0x270EE7680]();
}

uint64_t sub_2396CFF20()
{
  return MEMORY[0x270EE7688]();
}

uint64_t sub_2396CFF30()
{
  return MEMORY[0x270EE76B0]();
}

uint64_t sub_2396CFF40()
{
  return MEMORY[0x270EE3BD0]();
}

uint64_t sub_2396CFF50()
{
  return MEMORY[0x270EE4020]();
}

uint64_t sub_2396CFF60()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2396CFF70()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2396CFF80()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2396CFF90()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_2396CFFA0()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_2396CFFB0()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_2396CFFC0()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t sub_2396CFFD0()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_2396CFFE0()
{
  return MEMORY[0x270F9CFC8]();
}

uint64_t sub_2396CFFF0()
{
  return MEMORY[0x270F9CFD8]();
}

uint64_t sub_2396D0000()
{
  return MEMORY[0x270F9CFE0]();
}

uint64_t sub_2396D0010()
{
  return MEMORY[0x270F9CFE8]();
}

uint64_t sub_2396D0020()
{
  return MEMORY[0x270F9CFF0]();
}

uint64_t sub_2396D0030()
{
  return MEMORY[0x270F9D008]();
}

uint64_t sub_2396D0040()
{
  return MEMORY[0x270F9D010]();
}

uint64_t sub_2396D0050()
{
  return MEMORY[0x270F9D018]();
}

uint64_t sub_2396D0060()
{
  return MEMORY[0x270F9D020]();
}

uint64_t sub_2396D0070()
{
  return MEMORY[0x270F9D030]();
}

uint64_t sub_2396D0080()
{
  return MEMORY[0x270F9D040]();
}

uint64_t sub_2396D0090()
{
  return MEMORY[0x270F9D048]();
}

uint64_t sub_2396D00A0()
{
  return MEMORY[0x270F9D050]();
}

uint64_t sub_2396D00B0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2396D00C0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2396D00D0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_2396D00E0()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_2396D00F0()
{
  return MEMORY[0x270F9D0B0]();
}

uint64_t sub_2396D0100()
{
  return MEMORY[0x270F9D0E8]();
}

uint64_t sub_2396D0110()
{
  return MEMORY[0x270F9D0F0]();
}

uint64_t sub_2396D0120()
{
  return MEMORY[0x270F9D148]();
}

uint64_t sub_2396D0130()
{
  return MEMORY[0x270F9D150]();
}

uint64_t sub_2396D0140()
{
  return MEMORY[0x270F9D160]();
}

uint64_t sub_2396D0150()
{
  return MEMORY[0x270F9D1C0]();
}

uint64_t sub_2396D0160()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_2396D0170()
{
  return MEMORY[0x270F9D1D8]();
}

uint64_t sub_2396D0190()
{
  return MEMORY[0x270F9D1F0]();
}

uint64_t sub_2396D01A0()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_2396D01B0()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_2396D01C0()
{
  return MEMORY[0x270F9D220]();
}

uint64_t sub_2396D01D0()
{
  return MEMORY[0x270F9D230]();
}

uint64_t sub_2396D01E0()
{
  return MEMORY[0x270F9D260]();
}

uint64_t sub_2396D01F0()
{
  return MEMORY[0x270F9D280]();
}

uint64_t sub_2396D0200()
{
  return MEMORY[0x270F9D290]();
}

uint64_t sub_2396D0210()
{
  return MEMORY[0x270F9D2A0]();
}

uint64_t sub_2396D0220()
{
  return MEMORY[0x270F9D2B8]();
}

uint64_t sub_2396D0230()
{
  return MEMORY[0x270F9D2D8]();
}

uint64_t sub_2396D0240()
{
  return MEMORY[0x270F9D2E0]();
}

uint64_t sub_2396D0250()
{
  return MEMORY[0x270F9D2F0]();
}

uint64_t sub_2396D0260()
{
  return MEMORY[0x270F9D2F8]();
}

uint64_t sub_2396D0270()
{
  return MEMORY[0x270F9D300]();
}

uint64_t sub_2396D0280()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2396D0290()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2396D02A0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2396D02B0()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_2396D02C0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_2396D02D0()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_2396D02E0()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_2396D02F0()
{
  return MEMORY[0x270F9D4A0]();
}

uint64_t sub_2396D0300()
{
  return MEMORY[0x270F9D4A8]();
}

uint64_t sub_2396D0310()
{
  return MEMORY[0x270F9D4B0]();
}

uint64_t sub_2396D0320()
{
  return MEMORY[0x270F9D4D0]();
}

uint64_t sub_2396D0330()
{
  return MEMORY[0x270F9D4D8]();
}

uint64_t sub_2396D0340()
{
  return MEMORY[0x270F9D4E8]();
}

uint64_t sub_2396D0350()
{
  return MEMORY[0x270F9D4F0]();
}

uint64_t sub_2396D0360()
{
  return MEMORY[0x270F9D500]();
}

uint64_t sub_2396D0370()
{
  return MEMORY[0x270F9D518]();
}

uint64_t sub_2396D0380()
{
  return MEMORY[0x270F9D538]();
}

uint64_t sub_2396D0390()
{
  return MEMORY[0x270F9D550]();
}

uint64_t sub_2396D03A0()
{
  return MEMORY[0x270F9D558]();
}

uint64_t sub_2396D03C0()
{
  return MEMORY[0x270F9D590]();
}

uint64_t sub_2396D03D0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2396D03E0()
{
  return MEMORY[0x270F9D5A0]();
}

uint64_t sub_2396D03F0()
{
  return MEMORY[0x270F9D5A8]();
}

uint64_t sub_2396D0400()
{
  return MEMORY[0x270F9D5C0]();
}

uint64_t sub_2396D0410()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2396D0420()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2396D0430()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2396D0440()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2396D0450()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_2396D0460()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_2396D0470()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_2396D0480()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2396D0490()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_2396D04A0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2396D04B0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_2396D04C0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2396D04D0()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_2396D04E0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2396D04F0()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_2396D0500()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2396D0510()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2396D0520()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2396D0540()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2396D0550()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2396D0560()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_2396D0570()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_2396D0580()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2396D0590()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2396D05A0()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_2396D05B0()
{
  return MEMORY[0x270F9D900]();
}

uint64_t sub_2396D05C0()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_2396D05D0()
{
  return MEMORY[0x270F9D910]();
}

uint64_t sub_2396D05E0()
{
  return MEMORY[0x270F9D920]();
}

uint64_t sub_2396D05F0()
{
  return MEMORY[0x270F9D928]();
}

uint64_t sub_2396D0600()
{
  return MEMORY[0x270F9D930]();
}

uint64_t sub_2396D0610()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_2396D0620()
{
  return MEMORY[0x270F9D940]();
}

uint64_t sub_2396D0630()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_2396D0640()
{
  return MEMORY[0x270F9D958]();
}

uint64_t sub_2396D0650()
{
  return MEMORY[0x270F9D960]();
}

uint64_t sub_2396D0660()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_2396D0670()
{
  return MEMORY[0x270F9D980]();
}

uint64_t sub_2396D0680()
{
  return MEMORY[0x270F9D988]();
}

uint64_t sub_2396D0690()
{
  return MEMORY[0x270F9D990]();
}

uint64_t sub_2396D06A0()
{
  return MEMORY[0x270F9D9A8]();
}

uint64_t sub_2396D06B0()
{
  return MEMORY[0x270F9D9B0]();
}

uint64_t sub_2396D06C0()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_2396D06D0()
{
  return MEMORY[0x270F9D9E8]();
}

uint64_t sub_2396D06E0()
{
  return MEMORY[0x270F9D9F0]();
}

uint64_t sub_2396D06F0()
{
  return MEMORY[0x270F9D9F8]();
}

uint64_t sub_2396D0700()
{
  return MEMORY[0x270F9DA00]();
}

uint64_t sub_2396D0710()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t sub_2396D0720()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2396D0730()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_2396D0740()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_2396D0780()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_2396D0790()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_2396D07A0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2396D07B0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2396D07C0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2396D07D0()
{
  return MEMORY[0x270F9DBA8]();
}

uint64_t sub_2396D07E0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2396D07F0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2396D0800()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_2396D0810()
{
  return MEMORY[0x270F4E410]();
}

uint64_t sub_2396D0820()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_2396D0830()
{
  return MEMORY[0x270F9DBE0]();
}

uint64_t sub_2396D0840()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2396D0850()
{
  return MEMORY[0x270F9DC08]();
}

uint64_t sub_2396D0860()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_2396D0870()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2396D0880()
{
  return MEMORY[0x270F9DC28]();
}

uint64_t sub_2396D0890()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_2396D08A0()
{
  return MEMORY[0x270F9DC38]();
}

uint64_t sub_2396D08B0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2396D08C0()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_2396D08D0()
{
  return MEMORY[0x270F9DC80]();
}

uint64_t sub_2396D08E0()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_2396D08F0()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_2396D0900()
{
  return MEMORY[0x270F9DCB8]();
}

uint64_t sub_2396D0910()
{
  return MEMORY[0x270F9DCC8]();
}

uint64_t sub_2396D0920()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_2396D0930()
{
  return MEMORY[0x270F9DCE8]();
}

uint64_t sub_2396D0940()
{
  return MEMORY[0x270F9DCF8]();
}

uint64_t sub_2396D0950()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_2396D0960()
{
  return MEMORY[0x270F9DD10]();
}

uint64_t sub_2396D0970()
{
  return MEMORY[0x270F9DD18]();
}

uint64_t sub_2396D0980()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_2396D0990()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2396D09A0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2396D09B0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2396D09C0()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_2396D09D0()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_2396D0A10()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2396D0A20()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2396D0A30()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_2396D0A40()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_2396D0A50()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_2396D0A70()
{
  return MEMORY[0x270FA2068]();
}

uint64_t sub_2396D0A80()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_2396D0A90()
{
  return MEMORY[0x270FA2098]();
}

uint64_t sub_2396D0AA0()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_2396D0AB0()
{
  return MEMORY[0x270F9DD98]();
}

uint64_t sub_2396D0AC0()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_2396D0AD0()
{
  return MEMORY[0x270F9DDF0]();
}

uint64_t sub_2396D0AE0()
{
  return MEMORY[0x270F9DDF8]();
}

uint64_t sub_2396D0AF0()
{
  return MEMORY[0x270F9DE38]();
}

uint64_t sub_2396D0B00()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_2396D0B10()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2396D0B20()
{
  return MEMORY[0x270F9DF38]();
}

uint64_t sub_2396D0B30()
{
  return MEMORY[0x270F9DF48]();
}

uint64_t sub_2396D0B40()
{
  return MEMORY[0x270F9DF50]();
}

uint64_t sub_2396D0B50()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t sub_2396D0B60()
{
  return MEMORY[0x270F9DF70]();
}

uint64_t sub_2396D0B70()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_2396D0B80()
{
  return MEMORY[0x270F9DF90]();
}

uint64_t sub_2396D0B90()
{
  return MEMORY[0x270F9DFB8]();
}

uint64_t sub_2396D0BA0()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_2396D0BB0()
{
  return MEMORY[0x270F9DFE8]();
}

uint64_t sub_2396D0BC0()
{
  return MEMORY[0x270EF1CD8]();
}

uint64_t sub_2396D0BE0()
{
  return MEMORY[0x270F9E018]();
}

uint64_t sub_2396D0BF0()
{
  return MEMORY[0x270F9E020]();
}

uint64_t sub_2396D0C00()
{
  return MEMORY[0x270F9E030]();
}

uint64_t sub_2396D0C10()
{
  return MEMORY[0x270F9E050]();
}

uint64_t sub_2396D0C20()
{
  return MEMORY[0x270F9E070]();
}

uint64_t sub_2396D0C40()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_2396D0C50()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_2396D0C60()
{
  return MEMORY[0x270F9E0B8]();
}

uint64_t sub_2396D0C70()
{
  return MEMORY[0x270F9E0C0]();
}

uint64_t sub_2396D0C80()
{
  return MEMORY[0x270F9E0C8]();
}

uint64_t sub_2396D0C90()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_2396D0CA0()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2396D0CB0()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t sub_2396D0CC0()
{
  return MEMORY[0x270F9E100]();
}

uint64_t sub_2396D0CD0()
{
  return MEMORY[0x270F9E108]();
}

uint64_t sub_2396D0CE0()
{
  return MEMORY[0x270F9E110]();
}

uint64_t sub_2396D0CF0()
{
  return MEMORY[0x270F9E118]();
}

uint64_t sub_2396D0D00()
{
  return MEMORY[0x270F9E120]();
}

uint64_t sub_2396D0D10()
{
  return MEMORY[0x270F9E128]();
}

uint64_t sub_2396D0D20()
{
  return MEMORY[0x270F9E138]();
}

uint64_t sub_2396D0D30()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_2396D0D40()
{
  return MEMORY[0x270F9E148]();
}

uint64_t sub_2396D0D50()
{
  return MEMORY[0x270F9E150]();
}

uint64_t sub_2396D0D60()
{
  return MEMORY[0x270F9E168]();
}

uint64_t sub_2396D0D70()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_2396D0D80()
{
  return MEMORY[0x270F9E180]();
}

uint64_t sub_2396D0D90()
{
  return MEMORY[0x270F9E190]();
}

uint64_t sub_2396D0DA0()
{
  return MEMORY[0x270F9E1B8]();
}

uint64_t sub_2396D0DB0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2396D0DC0()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_2396D0DD0()
{
  return MEMORY[0x270F9E350]();
}

uint64_t sub_2396D0DE0()
{
  return MEMORY[0x270FA0790]();
}

uint64_t sub_2396D0DF0()
{
  return MEMORY[0x270EE7918]();
}

uint64_t sub_2396D0E00()
{
  return MEMORY[0x270EF1DD8]();
}

uint64_t sub_2396D0E10()
{
  return MEMORY[0x270EF1DF0]();
}

uint64_t sub_2396D0E20()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2396D0E30()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2396D0E40()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2396D0E50()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2396D0E60()
{
  return MEMORY[0x270FA0D38]();
}

uint64_t sub_2396D0E70()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2396D0E80()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2396D0E90()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2396D0EB0()
{
  return MEMORY[0x270FA0888]();
}

uint64_t sub_2396D0EE0()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_2396D0EF0()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_2396D0F00()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2396D0F10()
{
  return MEMORY[0x270EF22F0]();
}

uint64_t sub_2396D0F20()
{
  return MEMORY[0x270F9E358]();
}

uint64_t sub_2396D0F30()
{
  return MEMORY[0x270F9E360]();
}

uint64_t sub_2396D0F40()
{
  return MEMORY[0x270F9E380]();
}

uint64_t sub_2396D0F50()
{
  return MEMORY[0x270F9E388]();
}

uint64_t sub_2396D0F60()
{
  return MEMORY[0x270F9E390]();
}

uint64_t sub_2396D0F70()
{
  return MEMORY[0x270F9E398]();
}

uint64_t sub_2396D0F80()
{
  return MEMORY[0x270F9E3A0]();
}

uint64_t sub_2396D0FA0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2396D0FC0()
{
  return MEMORY[0x270F9E3E8]();
}

uint64_t sub_2396D0FD0()
{
  return MEMORY[0x270F9E3F0]();
}

uint64_t sub_2396D0FE0()
{
  return MEMORY[0x270F9E3F8]();
}

uint64_t sub_2396D0FF0()
{
  return MEMORY[0x270F9E400]();
}

uint64_t sub_2396D1000()
{
  return MEMORY[0x270F9E410]();
}

uint64_t sub_2396D1010()
{
  return MEMORY[0x270F9E418]();
}

uint64_t sub_2396D1020()
{
  return MEMORY[0x270EE7968]();
}

uint64_t sub_2396D1030()
{
  return MEMORY[0x270F9E450]();
}

uint64_t sub_2396D1040()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_2396D1050()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2396D1060()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2396D1070()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_2396D1080()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_2396D1090()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_2396D10A0()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_2396D10B0()
{
  return MEMORY[0x270F9E640]();
}

uint64_t sub_2396D10C0()
{
  return MEMORY[0x270F9E648]();
}

uint64_t sub_2396D10D0()
{
  return MEMORY[0x270F9E650]();
}

uint64_t sub_2396D10E0()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_2396D10F0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2396D1100()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_2396D1110()
{
  return MEMORY[0x270F9E718]();
}

uint64_t sub_2396D1130()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2396D1140()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2396D1150()
{
  return MEMORY[0x270F9E7F8]();
}

uint64_t sub_2396D1160()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_2396D1170()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_2396D1180()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_2396D1190()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_2396D11A0()
{
  return MEMORY[0x270F9E910]();
}

uint64_t sub_2396D11B0()
{
  return MEMORY[0x270F9E918]();
}

uint64_t sub_2396D11C0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2396D11D0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2396D11E0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2396D11F0()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_2396D1200()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2396D1210()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2396D1220()
{
  return MEMORY[0x270F9E9E0]();
}

uint64_t sub_2396D1230()
{
  return MEMORY[0x270F9E9F0]();
}

uint64_t sub_2396D1240()
{
  return MEMORY[0x270F9E9F8]();
}

uint64_t sub_2396D1250()
{
  return MEMORY[0x270F9EA00]();
}

uint64_t sub_2396D1260()
{
  return MEMORY[0x270F9EA08]();
}

uint64_t sub_2396D1270()
{
  return MEMORY[0x270F9EA20]();
}

uint64_t sub_2396D1280()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_2396D1290()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2396D12A0()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2396D12B0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2396D12C0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2396D12D0()
{
  return MEMORY[0x270F9EAA0]();
}

uint64_t sub_2396D12E0()
{
  return MEMORY[0x270F9EAB8]();
}

uint64_t sub_2396D12F0()
{
  return MEMORY[0x270F9EB00]();
}

uint64_t sub_2396D1300()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2396D1310()
{
  return MEMORY[0x270F9EB38]();
}

uint64_t sub_2396D1320()
{
  return MEMORY[0x270F9EB80]();
}

uint64_t sub_2396D1330()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2396D1340()
{
  return MEMORY[0x270F9EBA0]();
}

uint64_t sub_2396D1350()
{
  return MEMORY[0x270F9EBA8]();
}

uint64_t sub_2396D1360()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2396D1370()
{
  return MEMORY[0x270F9EBC8]();
}

uint64_t sub_2396D1380()
{
  return MEMORY[0x270F9EBD0]();
}

uint64_t sub_2396D1390()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_2396D13A0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2396D13B0()
{
  return MEMORY[0x270F9EBF0]();
}

uint64_t sub_2396D13C0()
{
  return MEMORY[0x270F9EBF8]();
}

uint64_t sub_2396D13D0()
{
  return MEMORY[0x270F9EC00]();
}

uint64_t sub_2396D13E0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2396D13F0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2396D1400()
{
  return MEMORY[0x270F9EC18]();
}

uint64_t sub_2396D1410()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_2396D1420()
{
  return MEMORY[0x270F9EC50]();
}

uint64_t sub_2396D1430()
{
  return MEMORY[0x270F9EC58]();
}

uint64_t sub_2396D1440()
{
  return MEMORY[0x270F9EC78]();
}

uint64_t sub_2396D1450()
{
  return MEMORY[0x270F9EC80]();
}

uint64_t sub_2396D1460()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_2396D1470()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_2396D1480()
{
  return MEMORY[0x270F9EC98]();
}

uint64_t sub_2396D1490()
{
  return MEMORY[0x270F9ECA0]();
}

uint64_t sub_2396D14A0()
{
  return MEMORY[0x270F9ECB0]();
}

uint64_t _s13LinearAlgebra11DenseVectorV10_uncheckedxSi_tcig_0()
{
  return MEMORY[0x270F9ECB8]();
}

uint64_t sub_2396D14C0()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_2396D14D0()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_2396D14E0()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_2396D14F0()
{
  return MEMORY[0x270F9ECD0]();
}

uint64_t sub_2396D1500()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_2396D1510()
{
  return MEMORY[0x270F9ECE8]();
}

uint64_t sub_2396D1520()
{
  return MEMORY[0x270F9ECF0]();
}

uint64_t sub_2396D1530()
{
  return MEMORY[0x270F9ECF8]();
}

uint64_t sub_2396D1540()
{
  return MEMORY[0x270F9ED00]();
}

uint64_t sub_2396D1550()
{
  return MEMORY[0x270F9ED10]();
}

uint64_t sub_2396D1560()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_2396D1570()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2396D1580()
{
  return MEMORY[0x270F9ED90]();
}

uint64_t sub_2396D1590()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t sub_2396D15A0()
{
  return MEMORY[0x270F9EE90]();
}

uint64_t sub_2396D15B0()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_2396D15C0()
{
  return MEMORY[0x270F9EF18]();
}

uint64_t sub_2396D15D0()
{
  return MEMORY[0x270F9EF20]();
}

uint64_t sub_2396D15E0()
{
  return MEMORY[0x270F9EF28]();
}

uint64_t sub_2396D15F0()
{
  return MEMORY[0x270F9EF40]();
}

uint64_t sub_2396D1600()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_2396D1620()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_2396D1630()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_2396D1640()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2396D1650()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2396D1660()
{
  return MEMORY[0x270F9F010]();
}

uint64_t sub_2396D1670()
{
  return MEMORY[0x270F9F018]();
}

uint64_t sub_2396D1680()
{
  return MEMORY[0x270F9F020]();
}

uint64_t sub_2396D1690()
{
  return MEMORY[0x270F9F028]();
}

uint64_t sub_2396D16A0()
{
  return MEMORY[0x270F9F030]();
}

uint64_t sub_2396D16B0()
{
  return MEMORY[0x270F9F038]();
}

uint64_t sub_2396D16C0()
{
  return MEMORY[0x270F9F040]();
}

uint64_t sub_2396D16D0()
{
  return MEMORY[0x270F9F048]();
}

uint64_t sub_2396D16E0()
{
  return MEMORY[0x270F9F050]();
}

uint64_t sub_2396D16F0()
{
  return MEMORY[0x270F9F060]();
}

uint64_t sub_2396D1700()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2396D1710()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2396D1720()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2396D1730()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_2396D1740()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2396D1750()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2396D1760()
{
  return MEMORY[0x270F9F0E8]();
}

uint64_t sub_2396D1770()
{
  return MEMORY[0x270F9F140]();
}

uint64_t sub_2396D1780()
{
  return MEMORY[0x270F9F148]();
}

uint64_t sub_2396D1790()
{
  return MEMORY[0x270F9F168]();
}

uint64_t sub_2396D17B0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2396D17D0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2396D17E0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2396D17F0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2396D1800()
{
  return MEMORY[0x270F9F288]();
}

uint64_t sub_2396D1810()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_2396D1820()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2396D1830()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2396D1840()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_2396D1850()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_2396D1860()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_2396D1870()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_2396D1880()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_2396D1890()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2396D18A0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2396D18B0()
{
  return MEMORY[0x270F9F368]();
}

uint64_t sub_2396D18C0()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_2396D18D0()
{
  return MEMORY[0x270F9F380]();
}

uint64_t sub_2396D18E0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_2396D18F0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2396D1900()
{
  return MEMORY[0x270F9F3C8]();
}

uint64_t sub_2396D1910()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_2396D1920()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2396D1930()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2396D1940()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_2396D1950()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_2396D1960()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_2396D1970()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_2396D1980()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_2396D1990()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2396D19A0()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_2396D19B0()
{
  return MEMORY[0x270F9F4B0]();
}

uint64_t sub_2396D19C0()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2396D19D0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2396D19E0()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_2396D1A00()
{
  return MEMORY[0x270FA2328]();
}

uint64_t sub_2396D1A10()
{
  return MEMORY[0x270F9F5B0]();
}

uint64_t sub_2396D1A20()
{
  return MEMORY[0x270F9F5B8]();
}

uint64_t sub_2396D1A30()
{
  return MEMORY[0x270F9F5C0]();
}

uint64_t sub_2396D1A40()
{
  return MEMORY[0x270F9F5C8]();
}

uint64_t sub_2396D1A50()
{
  return MEMORY[0x270F9F5D0]();
}

uint64_t sub_2396D1A60()
{
  return MEMORY[0x270F9F5D8]();
}

uint64_t sub_2396D1A70()
{
  return MEMORY[0x270F9F5E0]();
}

uint64_t sub_2396D1A80()
{
  return MEMORY[0x270F9F5E8]();
}

uint64_t sub_2396D1A90()
{
  return MEMORY[0x270F9F5F0]();
}

uint64_t sub_2396D1AA0()
{
  return MEMORY[0x270F9F5F8]();
}

uint64_t sub_2396D1AB0()
{
  return MEMORY[0x270F9F688]();
}

uint64_t sub_2396D1AC0()
{
  return MEMORY[0x270F9F690]();
}

uint64_t sub_2396D1AD0()
{
  return MEMORY[0x270F9F698]();
}

uint64_t sub_2396D1AE0()
{
  return MEMORY[0x270F9F6A0]();
}

uint64_t sub_2396D1AF0()
{
  return MEMORY[0x270F9F6A8]();
}

uint64_t sub_2396D1B00()
{
  return MEMORY[0x270F9F6B0]();
}

uint64_t sub_2396D1B10()
{
  return MEMORY[0x270F9F6B8]();
}

uint64_t sub_2396D1B20()
{
  return MEMORY[0x270F9F6C0]();
}

uint64_t sub_2396D1B30()
{
  return MEMORY[0x270F9F6C8]();
}

uint64_t sub_2396D1B40()
{
  return MEMORY[0x270F9F6D0]();
}

uint64_t sub_2396D1B50()
{
  return MEMORY[0x270F9F6D8]();
}

uint64_t sub_2396D1B60()
{
  return MEMORY[0x270F9F6E0]();
}

uint64_t sub_2396D1B70()
{
  return MEMORY[0x270F9F6E8]();
}

uint64_t sub_2396D1B80()
{
  return MEMORY[0x270F9F6F0]();
}

uint64_t sub_2396D1B90()
{
  return MEMORY[0x270F9F6F8]();
}

uint64_t sub_2396D1BA0()
{
  return MEMORY[0x270F9F700]();
}

uint64_t sub_2396D1BB0()
{
  return MEMORY[0x270F9F708]();
}

uint64_t sub_2396D1BC0()
{
  return MEMORY[0x270F9F710]();
}

uint64_t sub_2396D1BD0()
{
  return MEMORY[0x270F9F718]();
}

uint64_t sub_2396D1BE0()
{
  return MEMORY[0x270F9F720]();
}

uint64_t sub_2396D1BF0()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_2396D1C00()
{
  return MEMORY[0x270F9F740]();
}

uint64_t sub_2396D1C10()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_2396D1C20()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_2396D1C30()
{
  return MEMORY[0x270F9F7A8]();
}

uint64_t sub_2396D1C40()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_2396D1C50()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2396D1C60()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2396D1C80()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_2396D1C90()
{
  return MEMORY[0x270F9F858]();
}

uint64_t sub_2396D1CA0()
{
  return MEMORY[0x270F9F860]();
}

uint64_t sub_2396D1CB0()
{
  return MEMORY[0x270F9F868]();
}

uint64_t sub_2396D1CC0()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_2396D1CD0()
{
  return MEMORY[0x270F9F8F0]();
}

uint64_t sub_2396D1CE0()
{
  return MEMORY[0x270F9F8F8]();
}

uint64_t sub_2396D1CF0()
{
  return MEMORY[0x270F9F900]();
}

uint64_t sub_2396D1D00()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_2396D1D10()
{
  return MEMORY[0x270F9F938]();
}

uint64_t sub_2396D1D30()
{
  return MEMORY[0x270F9F960]();
}

uint64_t sub_2396D1D40()
{
  return MEMORY[0x270F9F968]();
}

uint64_t sub_2396D1D50()
{
  return MEMORY[0x270F9F970]();
}

uint64_t sub_2396D1D60()
{
  return MEMORY[0x270F9F978]();
}

uint64_t sub_2396D1D70()
{
  return MEMORY[0x270F9F980]();
}

uint64_t sub_2396D1D80()
{
  return MEMORY[0x270F9F988]();
}

uint64_t sub_2396D1D90()
{
  return MEMORY[0x270F9F990]();
}

uint64_t sub_2396D1DA0()
{
  return MEMORY[0x270F9F998]();
}

uint64_t sub_2396D1DB0()
{
  return MEMORY[0x270F9F9A0]();
}

uint64_t sub_2396D1DC0()
{
  return MEMORY[0x270F9F9A8]();
}

uint64_t sub_2396D1DD0()
{
  return MEMORY[0x270F9F9B0]();
}

uint64_t sub_2396D1DE0()
{
  return MEMORY[0x270F9F9B8]();
}

uint64_t sub_2396D1DF0()
{
  return MEMORY[0x270F9F9C0]();
}

uint64_t sub_2396D1E00()
{
  return MEMORY[0x270F9F9C8]();
}

uint64_t sub_2396D1E10()
{
  return MEMORY[0x270F9F9D0]();
}

uint64_t sub_2396D1E20()
{
  return MEMORY[0x270F9F9D8]();
}

uint64_t sub_2396D1E30()
{
  return MEMORY[0x270F9F9E0]();
}

uint64_t sub_2396D1E40()
{
  return MEMORY[0x270F9F9E8]();
}

uint64_t sub_2396D1E50()
{
  return MEMORY[0x270F9F9F0]();
}

uint64_t sub_2396D1E60()
{
  return MEMORY[0x270F9F9F8]();
}

uint64_t sub_2396D1E70()
{
  return MEMORY[0x270F9FA00]();
}

uint64_t sub_2396D1E80()
{
  return MEMORY[0x270F9FA08]();
}

uint64_t sub_2396D1E90()
{
  return MEMORY[0x270F9FA10]();
}

uint64_t sub_2396D1EB0()
{
  return MEMORY[0x270F9FA60]();
}

uint64_t sub_2396D1EC0()
{
  return MEMORY[0x270F9FA70]();
}

uint64_t sub_2396D1ED0()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_2396D1EE0()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_2396D1EF0()
{
  return MEMORY[0x270F9FA90]();
}

uint64_t sub_2396D1F00()
{
  return MEMORY[0x270F9FA98]();
}

uint64_t sub_2396D1F10()
{
  return MEMORY[0x270F9FAA8]();
}

uint64_t sub_2396D1F20()
{
  return MEMORY[0x270F9FAB8]();
}

uint64_t sub_2396D1F30()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2396D1F40()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2396D1F50()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_2396D1F70()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2396D1F80()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2396D1F90()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2396D1FA0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2396D1FB0()
{
  return MEMORY[0x270F9FBA0]();
}

uint64_t sub_2396D1FC0()
{
  return MEMORY[0x270F9FBA8]();
}

uint64_t sub_2396D1FD0()
{
  return MEMORY[0x270F9FBB0]();
}

uint64_t sub_2396D1FE0()
{
  return MEMORY[0x270F9FBC8]();
}

uint64_t sub_2396D1FF0()
{
  return MEMORY[0x270F9FBD8]();
}

uint64_t sub_2396D2000()
{
  return MEMORY[0x270F9FBE8]();
}

uint64_t sub_2396D2010()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_2396D2020()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_2396D2030()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2396D2040()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2396D2050()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2396D2060()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_2396D2070()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_2396D2080()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2396D2090()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_2396D20A0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2396D20B0()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_2396D20C0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_2396D20D0()
{
  return MEMORY[0x270F9FDB8]();
}

uint64_t sub_2396D20E0()
{
  return MEMORY[0x270FA0070]();
}

uint64_t sub_2396D20F0()
{
  return MEMORY[0x270FA0090]();
}

uint64_t sub_2396D2100()
{
  return MEMORY[0x270FA0098]();
}

uint64_t sub_2396D2130()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x270EE5980](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C48](sbuf);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

uint64_t XGBGetLastError()
{
  return MEMORY[0x270F872F0]();
}

uint64_t XGBoosterCreate()
{
  return MEMORY[0x270F872F8]();
}

uint64_t XGBoosterEvalOneIter()
{
  return MEMORY[0x270F87300]();
}

uint64_t XGBoosterFree()
{
  return MEMORY[0x270F87308]();
}

uint64_t XGBoosterGetNumFeature()
{
  return MEMORY[0x270F87310]();
}

uint64_t XGBoosterLoadModelFromBuffer()
{
  return MEMORY[0x270F87318]();
}

uint64_t XGBoosterPredictFromDMatrix()
{
  return MEMORY[0x270F87320]();
}

uint64_t XGBoosterSaveModelToBuffer()
{
  return MEMORY[0x270F87328]();
}

uint64_t XGBoosterSetParam()
{
  return MEMORY[0x270F87330]();
}

uint64_t XGBoosterUpdateOneIter()
{
  return MEMORY[0x270F87338]();
}

uint64_t XGDMatrixCreateFromMat()
{
  return MEMORY[0x270F87340]();
}

uint64_t XGDMatrixFree()
{
  return MEMORY[0x270F87348]();
}

uint64_t XGDMatrixSetDenseInfo()
{
  return MEMORY[0x270F87350]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x270FA0150]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x270FA0170]();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x270FA0178]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cblas_ddot_NEWLAPACK()
{
  return MEMORY[0x270EDE320]();
}

uint64_t cblas_dgemm_NEWLAPACK()
{
  return MEMORY[0x270EDE330]();
}

uint64_t cblas_dscal_NEWLAPACK()
{
  return MEMORY[0x270EDE370]();
}

uint64_t cblas_idamax_NEWLAPACK()
{
  return MEMORY[0x270EDE3E0]();
}

uint64_t cblas_isamax_NEWLAPACK()
{
  return MEMORY[0x270EDE3F0]();
}

uint64_t cblas_sgemm_NEWLAPACK()
{
  return MEMORY[0x270EDE440]();
}

uint64_t cblas_sscal_NEWLAPACK()
{
  return MEMORY[0x270EDE490]();
}

uint64_t dgelsd_NEWLAPACK()
{
  return MEMORY[0x270EDE540]();
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

void free(void *a1)
{
}

long double log1p(long double __x)
{
  MEMORY[0x270EDA0C0](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x270FA0360]();
}

uint64_t swift_getExtendedExistentialTypeMetadata_unique()
{
  return MEMORY[0x270FA0368]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_isClassType()
{
  return MEMORY[0x270FA0490]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_dotprD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Length __N)
{
}

void vvexp(double *a1, const double *a2, const int *a3)
{
}