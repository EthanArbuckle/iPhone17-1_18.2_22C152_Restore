unint64_t sub_2523A6B18()
{
  unint64_t result;

  result = qword_269C02DF0;
  if (!qword_269C02DF0)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C02DF0);
  }
  return result;
}

unint64_t sub_2523A6B70()
{
  unint64_t result = qword_269C02DF8;
  if (!qword_269C02DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C02DF8);
  }
  return result;
}

uint64_t sub_2523A6BC4(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = 0x747865746E6F632ELL;
  }
  else
  {
    sub_2523C7598();
    swift_bridgeObjectRelease();
    uint64_t v3 = 0x656C69666F72702ELL;
    sub_2523A73D8();
    sub_2523C7498();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
  }
  sub_2523C76F8();
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  return v3;
}

unint64_t sub_2523A6D80@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_2523A7360(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4;
  return result;
}

void sub_2523A6DB0(void *a1@<X8>)
{
  uint64_t v2 = __ROR8__(*(void *)v1, 32);
  uint64_t v3 = *(void *)v1;
  if (!*(unsigned char *)(v1 + 8)) {
    uint64_t v3 = v2;
  }
  *a1 = v3;
}

uint64_t sub_2523A6DD0()
{
  return sub_2523C74D8();
}

uint64_t sub_2523A6E30()
{
  return sub_2523C74B8();
}

uint64_t sub_2523A6E80()
{
  return sub_2523C7B28();
}

uint64_t sub_2523A6ED8()
{
  return sub_2523C7B18();
}

uint64_t sub_2523A6F18()
{
  return sub_2523C7B28();
}

uint64_t sub_2523A6F6C()
{
  return sub_2523A6BC4(*(void *)v0, *(unsigned char *)(v0 + 8));
}

BOOL sub_2523A6F78(uint64_t a1, uint64_t a2)
{
  return sub_2523AB25C(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8));
}

uint64_t sub_2523A6F94()
{
  return 0;
}

void sub_2523A6FA0()
{
}

uint64_t sub_2523A6FFC()
{
  if (*(unsigned char *)(v0 + 8) == 1) {
    return *(void *)v0;
  }
  uint64_t result = __ROR8__(*(void *)v0, 32);
  if (result < 0) {
    __break(1u);
  }
  return result;
}

void sub_2523A702C()
{
}

uint64_t sub_2523A7088(uint64_t a1)
{
  unint64_t v2 = sub_2523A7384();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2523A70C4(uint64_t a1)
{
  unint64_t v2 = sub_2523A7384();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2523A7100(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  if (swift_dynamicCast())
  {
    unint64_t v6 = v11;
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
    return v6;
  }
  uint64_t v7 = sub_2523C7B38();
  if (v8)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
    return 0;
  }
  unint64_t v6 = v7;
  if ((v7 & 0x8000000000000000) == 0)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
    if (v6 - 256 >= 0xFFFFFF00)
    {
      uint64_t v9 = __ROR8__(v6, 32);
      if (!HIDWORD(v6)) {
        uint64_t v9 = 0;
      }
      if (v6 >= 0x100) {
        return v9;
      }
      return v6;
    }
    return 0;
  }
  uint64_t result = sub_2523C7658();
  __break(1u);
  return result;
}

unint64_t sub_2523A72E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  char v4 = *((unsigned char *)v1 + 8);
  *(void *)(a1 + 24) = &_s3TagO14CodingKeyProxyVN;
  unint64_t result = sub_2523A7384();
  *(void *)(a1 + 32) = result;
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_2523A7334@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = sub_2523A7100(a1, a2);
  *(void *)a3 = result;
  *(unsigned char *)(a3 + 8) = v5;
  return result;
}

unint64_t sub_2523A7360(unint64_t result)
{
  uint64_t v1 = __ROR8__(result, 32);
  if (!HIDWORD(result)) {
    uint64_t v1 = 0;
  }
  if (result > 0xFF) {
    return v1;
  }
  return result;
}

unint64_t sub_2523A7384()
{
  unint64_t result = qword_269C02E00;
  if (!qword_269C02E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C02E00);
  }
  return result;
}

unint64_t sub_2523A73D8()
{
  unint64_t result = qword_269C02E08;
  if (!qword_269C02E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C02E08);
  }
  return result;
}

uint64_t __swift_memcpy9_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

ValueMetadata *_s3TagO14CodingKeyProxyVMa()
{
  return &_s3TagO14CodingKeyProxyVN;
}

uint64_t _s3TagOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s3TagOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2523A74E8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_2523A74F4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *_s3TagOMa()
{
  return &_s3TagON;
}

unint64_t sub_2523A7514()
{
  unint64_t result = qword_269C02E10;
  if (!qword_269C02E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C02E10);
  }
  return result;
}

unint64_t sub_2523A7568()
{
  unint64_t result = qword_269C02E18;
  if (!qword_269C02E18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C02E18);
  }
  return result;
}

void *_s15_CodingPathNodeOwCP(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t _s15_CodingPathNodeOwxx()
{
  return swift_release();
}

void *_s15_CodingPathNodeOwca(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void *_s15_CodingPathNodeOwta(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t _s15_CodingPathNodeOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7E && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t _s15_CodingPathNodeOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(void *)unint64_t result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)unint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_2523A7730(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 2;
  }
}

void *sub_2523A774C(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_2523A775C(unint64_t *result, uint64_t a2)
{
  if (a2 < 2)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 62;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 2);
    unint64_t v3 = 0x8000000000000000;
  }
  *unint64_t result = v2 | v3;
  return result;
}

ValueMetadata *_s15_CodingPathNodeOMa()
{
  return &_s15_CodingPathNodeON;
}

uint64_t sub_2523A7798(unint64_t a1)
{
  v10[14] = *MEMORY[0x263EF8340];
  if (a1 >> 62)
  {
    if (a1 >> 62 == 1)
    {
      uint64_t v2 = *(void *)((a1 & 0x3FFFFFFFFFFFFFFFLL) + 0x10);
      uint64_t v1 = *(void *)((a1 & 0x3FFFFFFFFFFFFFFFLL) + 0x18);
      swift_retain();
      uint64_t v3 = sub_2523A7798(v1);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
      *(void *)(inited + 56) = &_s10_CodingKeyON;
      *(void *)(inited + 64) = sub_2523A797C();
      uint64_t v5 = swift_allocObject();
      *(void *)(inited + 32) = v5;
      *(void *)(v5 + 16) = v2;
      *(void *)(v5 + 24) = 0;
      *(void *)(v5 + 32) = 0;
      *(unsigned char *)(v5 + 40) = 2;
      sub_2523A7E38(inited);
      swift_release();
      return v3;
    }
    else
    {
      return MEMORY[0x263F8EE78];
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 56);
    sub_2523A7FB0(a1 + 16, (uint64_t)v10);
    swift_retain();
    uint64_t v6 = sub_2523A7798(v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
    uint64_t v8 = swift_initStackObject();
    *(_OWORD *)(v8 + 16) = xmmword_2523C8C60;
    sub_2523A7FB0((uint64_t)v10, v8 + 32);
    sub_2523A7E38(v8);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  return v6;
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

unint64_t sub_2523A797C()
{
  unint64_t result = qword_269C02E28;
  if (!qword_269C02E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C02E28);
  }
  return result;
}

uint64_t sub_2523A79D0()
{
  sub_2523A7A10(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
  return MEMORY[0x270FA0238](v0, 41, 7);
}

uint64_t sub_2523A7A10(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4 == 3 || a4 == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2523A7A2C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 1:
      a1 = sub_2523C76F8();
      break;
    case 2:
      sub_2523C76F8();
      sub_2523C7488();
      swift_bridgeObjectRelease();
      a1 = 0x207865646E49;
      break;
    default:
      swift_bridgeObjectRetain();
      break;
  }
  return a1;
}

uint64_t sub_2523A7B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2523A7A2C(*(void *)v3, *(void *)(v3 + 8), a3, *(unsigned char *)(v3 + 24));
}

uint64_t sub_2523A7B1C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  *(void *)(a3 + 16) = 0;
  *(unsigned char *)(a3 + 24) = 0;
  return result;
}

uint64_t sub_2523A7B2C()
{
  if (*(unsigned __int8 *)(v0 + 24) - 1 < 2) {
    return *(void *)v0;
  }
  if (*(unsigned char *)(v0 + 24)) {
    return *(void *)(v0 + 16);
  }
  return 0;
}

uint64_t sub_2523A7B64@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_2523A7B78(uint64_t a1)
{
  unint64_t v2 = sub_2523A797C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2523A7BB4(uint64_t a1)
{
  unint64_t v2 = sub_2523A797C();
  return MEMORY[0x270FA00B8](a1, v2);
}

void *sub_2523A7BF0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
      v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x263F8EE78];
      v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2523A8064(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2523A7D14(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E38);
      v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x263F8EE78];
      v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2523A8178(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2523A7E38(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
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
  uint64_t v3 = sub_2523A7BF0(isUniquelyReferenced_nonNull_native, v15, 1, v3);
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
  unint64_t v10 = (unint64_t)&v3[5 * v9 + 4];
  if (a1 + 32 < v10 + 40 * v8 && v10 < a1 + 32 + 40 * v8) {
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E30);
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
  uint64_t result = sub_2523C76B8();
  __break(1u);
  return result;
}

uint64_t sub_2523A7FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_2523A8064(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E30);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2523C76B8();
  __break(1u);
  return result;
}

uint64_t sub_2523A8178(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2523C76B8();
  __break(1u);
  return result;
}

uint64_t _s10_CodingKeyOwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_2523A82A4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4 == 3 || a4 == 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t _s10_CodingKeyOwxx(uint64_t a1)
{
  return sub_2523A7A10(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t _s10_CodingKeyOwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_2523A82A4(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t _s10_CodingKeyOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_2523A82A4(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  char v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  sub_2523A7A10(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s10_CodingKeyOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  char v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v4;
  sub_2523A7A10(v5, v7, v6, v8);
  return a1;
}

uint64_t _s10_CodingKeyOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s10_CodingKeyOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2523A8498(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_2523A84A0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *_s10_CodingKeyOMa()
{
  return &_s10_CodingKeyON;
}

unint64_t sub_2523A84BC()
{
  unint64_t result = qword_269C02E40;
  if (!qword_269C02E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C02E40);
  }
  return result;
}

unint64_t sub_2523A8514()
{
  unint64_t result = qword_269C02E48;
  if (!qword_269C02E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C02E48);
  }
  return result;
}

uint64_t sub_2523A8570(uint64_t result, unint64_t a2, char a3)
{
  switch(a3)
  {
    case 5:
    case 9:
      unint64_t result = swift_bridgeObjectRetain();
      break;
    case 6:
      unint64_t result = sub_2523A85C8(result, a2);
      break;
    case 7:
    case 8:
      unint64_t result = swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2523A85C8(uint64_t a1, unint64_t a2)
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

uint64_t _s5ValueOwxx(uint64_t a1)
{
  return sub_2523A8630(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_2523A8630(uint64_t result, unint64_t a2, char a3)
{
  switch(a3)
  {
    case 5:
    case 9:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 6:
      uint64_t result = sub_2523A8688(result, a2);
      break;
    case 7:
    case 8:
      uint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2523A8688(uint64_t a1, unint64_t a2)
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

uint64_t _s5ValueOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_2523A8570(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s5ValueOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_2523A8570(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_2523A8630(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t _s5ValueOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_2523A8630(v4, v5, v6);
  return a1;
}

uint64_t _s5ValueOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF6 && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 246);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 0xA) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s5ValueOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF5)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 246;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xF6) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF6) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2523A886C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 9u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 10);
  }
}

uint64_t sub_2523A8884(uint64_t result, unsigned int a2)
{
  if (a2 >= 0xA)
  {
    *(void *)__n128 result = a2 - 10;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 10;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *_s5ValueOMa()
{
  return &_s5ValueON;
}

uint64_t sub_2523A88AC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result = 1819242338;
  switch(a3)
  {
    case 1:
      uint64_t result = 7630441;
      break;
    case 2:
      uint64_t result = 1953393013;
      break;
    case 3:
      uint64_t result = 0x74616F6C66;
      break;
    case 4:
      uint64_t result = 0x656C62756F64;
      break;
    case 5:
      uint64_t result = 0x676E69727473;
      break;
    case 6:
      uint64_t result = 1635017060;
      break;
    case 7:
      uint64_t result = 0x7961727261;
      break;
    case 8:
      uint64_t result = 0x7275746375727473;
      break;
    case 9:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
    case 10:
      uint64_t result = 1819047278;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2523A89C0(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  switch(a4)
  {
    case 1:
    case 2:
    case 4:
      sub_2523C7AD8();
      uint64_t result = sub_2523C7B18();
      break;
    case 3:
      sub_2523C7AD8();
      uint64_t result = sub_2523C7B08();
      break;
    case 5:
    case 9:
      sub_2523C7AD8();
      uint64_t result = MEMORY[0x270F9D708](a1, a2, a3);
      break;
    case 6:
      sub_2523C7AD8();
      sub_2523A85C8(a2, a3);
      sub_2523C7458();
      uint64_t result = sub_2523A8630(a2, a3, 6);
      break;
    case 7:
      uint64_t v8 = *(void *)(a2 + 16);
      sub_2523C7AD8();
      uint64_t result = sub_2523C7AD8();
      uint64_t v9 = *(void *)(v8 + 16);
      if (v9)
      {
        char v10 = (unsigned __int8 *)(v8 + 48);
        do
        {
          uint64_t v11 = *((void *)v10 - 2);
          unint64_t v12 = *((void *)v10 - 1);
          unsigned int v13 = *v10;
          v10 += 24;
          sub_2523A8570(v11, v12, v13);
          sub_2523A89C0(a1, v11, v12, v13);
          uint64_t result = sub_2523A8630(v11, v12, v13);
          --v9;
        }
        while (v9);
      }
      break;
    case 8:
      uint64_t v14 = *(void *)(a2 + 16);
      sub_2523C7AD8();
      uint64_t result = sub_2523AA298(a1, v14);
      break;
    case 10:
      uint64_t result = sub_2523C7AD8();
      break;
    default:
      sub_2523C7AD8();
      uint64_t result = sub_2523C7AE8();
      break;
  }
  return result;
}

uint64_t sub_2523A8BEC()
{
  uint64_t v1 = *(void *)v0;
  unint64_t v2 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  sub_2523C7AC8();
  sub_2523A89C0((uint64_t)v5, v1, v2, v3);
  return sub_2523C7B28();
}

uint64_t sub_2523A8C48(uint64_t a1)
{
  return sub_2523A89C0(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
}

uint64_t sub_2523A8C54()
{
  uint64_t v1 = *(void *)v0;
  unint64_t v2 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  sub_2523C7AC8();
  sub_2523A89C0((uint64_t)v5, v1, v2, v3);
  return sub_2523C7B28();
}

uint64_t sub_2523A8CAC(uint64_t a1, uint64_t a2)
{
  return sub_2523AA768(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

unint64_t sub_2523A8CCC()
{
  unint64_t result = qword_269C02E50;
  if (!qword_269C02E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C02E50);
  }
  return result;
}

uint64_t sub_2523A8D20(uint64_t a1, uint64_t a2)
{
  __s1[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    char v3 = (uint64_t *)(a2 + 48);
    int v4 = (uint64_t *)(a1 + 48);
    while (1)
    {
      uint64_t v7 = *(v4 - 2);
      unint64_t v6 = *(v4 - 1);
      uint64_t v9 = *(v3 - 2);
      unint64_t v8 = *(v3 - 1);
      int v11 = *(unsigned __int8 *)v3;
      v3 += 3;
      int v10 = v11;
      int v12 = *(unsigned __int8 *)v4;
      v4 += 3;
      switch(v12)
      {
        case 1:
          BOOL v14 = v10 == 1;
          goto LABEL_17;
        case 2:
          BOOL v14 = v10 == 2;
LABEL_17:
          if (!v14 || v7 != v9) {
            return 0;
          }
          goto LABEL_10;
        case 3:
          if (v10 != 3 || *(float *)&v7 != *(float *)&v9) {
            return 0;
          }
          goto LABEL_10;
        case 4:
          if (v10 != 4 || *(double *)&v7 != *(double *)&v9) {
            return 0;
          }
          goto LABEL_10;
        case 5:
          if (v10 != 5) {
            return 0;
          }
          goto LABEL_39;
        case 6:
          if (v10 != 6) {
            return 0;
          }
          break;
        case 7:
          if (v10 != 7) {
            return 0;
          }
          uint64_t v18 = *(void *)(v7 + 16);
          uint64_t v19 = *(void *)(v9 + 16);
          sub_2523A8570(v7, v6, 7);
          sub_2523A8570(v9, v8, 7);
          char v20 = sub_2523A8D20(v18, v19);
          sub_2523A8630(v9, v8, 7);
          uint64_t v21 = v7;
          unint64_t v22 = v6;
          char v23 = 7;
          goto LABEL_36;
        case 8:
          if (v10 != 8) {
            return 0;
          }
          uint64_t v24 = *(void *)(v7 + 16);
          uint64_t v25 = *(void *)(v9 + 16);
          sub_2523A8570(v7, v6, 8);
          sub_2523A8570(v9, v8, 8);
          char v20 = sub_2523A9980(v24, v25);
          sub_2523A8630(v9, v8, 8);
          uint64_t v21 = v7;
          unint64_t v22 = v6;
          char v23 = 8;
LABEL_36:
          sub_2523A8630(v21, v22, v23);
          if ((v20 & 1) == 0) {
            return 0;
          }
          goto LABEL_10;
        case 9:
          if (v10 != 9) {
            return 0;
          }
LABEL_39:
          BOOL v26 = v7 == v9 && v6 == v8;
          if (!v26 && (sub_2523C78F8() & 1) == 0) {
            return 0;
          }
          goto LABEL_10;
        case 10:
          if (v10 != 10 || (v8 | v9) != 0) {
            return 0;
          }
          goto LABEL_10;
        default:
          uint64_t result = 0;
          if (v10 || ((((v7 & 1) == 0) ^ v9) & 1) == 0) {
            return result;
          }
          goto LABEL_10;
      }
      uint64_t v17 = 0;
      switch(v6 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v7), v7))
          {
            __break(1u);
LABEL_168:
            __break(1u);
LABEL_169:
            __break(1u);
LABEL_170:
            __break(1u);
LABEL_171:
            __break(1u);
LABEL_172:
            __break(1u);
LABEL_173:
            __break(1u);
LABEL_174:
            __break(1u);
LABEL_175:
            __break(1u);
LABEL_176:
            __break(1u);
LABEL_177:
            __break(1u);
LABEL_178:
            __break(1u);
LABEL_179:
            __break(1u);
LABEL_180:
            __break(1u);
LABEL_181:
            __break(1u);
LABEL_182:
            __break(1u);
LABEL_183:
            __break(1u);
LABEL_184:
            __break(1u);
LABEL_185:
            __break(1u);
LABEL_186:
            __break(1u);
LABEL_187:
            __break(1u);
LABEL_188:
            __break(1u);
LABEL_189:
            __break(1u);
          }
          uint64_t v17 = HIDWORD(v7) - (int)v7;
LABEL_53:
          sub_2523A85C8(v7, v6);
          break;
        case 2uLL:
          uint64_t v29 = *(void *)(v7 + 16);
          uint64_t v28 = *(void *)(v7 + 24);
          uint64_t v17 = v28 - v29;
          if (!__OFSUB__(v28, v29)) {
            goto LABEL_53;
          }
          goto LABEL_168;
        case 3uLL:
          break;
        default:
          uint64_t v17 = BYTE6(v6);
          break;
      }
      unint64_t v30 = v8 >> 62;
      switch(v8 >> 62)
      {
        case 1uLL:
          LODWORD(v31) = HIDWORD(v9) - v9;
          if (__OFSUB__(HIDWORD(v9), v9)) {
            goto LABEL_169;
          }
          uint64_t v31 = (int)v31;
LABEL_59:
          if (v17 != v31)
          {
LABEL_164:
            sub_2523A8630(v7, v6, 6);
            return 0;
          }
          if (v17 < 1)
          {
LABEL_70:
            sub_2523A8630(v7, v6, 6);
          }
          else
          {
            switch(v6 >> 62)
            {
              case 1uLL:
                if ((int)v7 > v7 >> 32) {
                  goto LABEL_171;
                }
                sub_2523A8570(v9, v8, 6);
                sub_2523A8570(v7, v6, 6);
                sub_2523A8570(v9, v8, 6);
                uint64_t v39 = sub_2523C7428();
                if (v39)
                {
                  v89 = (char *)v39;
                  uint64_t v40 = sub_2523C7448();
                  if (__OFSUB__((int)v7, v40)) {
                    goto LABEL_173;
                  }
                  v41 = &v89[(int)v7 - v40];
                }
                else
                {
                  v41 = 0;
                }
                sub_2523C7438();
                if (!v30)
                {
                  __s1[0] = v9;
                  LOWORD(__s1[1]) = v8;
                  BYTE2(__s1[1]) = BYTE2(v8);
                  BYTE3(__s1[1]) = BYTE3(v8);
                  BYTE4(__s1[1]) = BYTE4(v8);
                  BYTE5(__s1[1]) = BYTE5(v8);
                  if (!v41) {
                    goto LABEL_197;
                  }
                  int v49 = memcmp(v41, __s1, BYTE6(v8));
                  goto LABEL_159;
                }
                v90 = v41;
                if (v30 == 1)
                {
                  if (v9 >> 32 < (int)v9) {
                    goto LABEL_182;
                  }
                  swift_retain();
                  uint64_t v53 = sub_2523C7428();
                  if (v53)
                  {
                    v86 = (char *)v53;
                    uint64_t v54 = sub_2523C7448();
                    if (__OFSUB__((int)v9, v54)) {
                      goto LABEL_189;
                    }
                    v55 = &v86[(int)v9 - v54];
                  }
                  else
                  {
                    v55 = 0;
                  }
                  uint64_t v80 = sub_2523C7438();
                  if (v80 >= (v9 >> 32) - (int)v9) {
                    size_t v81 = (v9 >> 32) - (int)v9;
                  }
                  else {
                    size_t v81 = v80;
                  }
                  if (!v41) {
                    goto LABEL_202;
                  }
                  if (!v55) {
                    goto LABEL_203;
                  }
                  int v49 = memcmp(v41, v55, v81);
                  sub_2523A8630(v9, v8, 6);
                  goto LABEL_159;
                }
                uint64_t v72 = *(void *)(v9 + 16);
                v87 = *(char **)(v9 + 24);
                swift_retain();
                swift_retain();
                v73 = (char *)sub_2523C7428();
                if (v73)
                {
                  uint64_t v74 = sub_2523C7448();
                  if (__OFSUB__(v72, v74)) {
                    goto LABEL_188;
                  }
                  v73 += v72 - v74;
                }
                BOOL v34 = __OFSUB__(v87, v72);
                v75 = &v87[-v72];
                if (v34) {
                  goto LABEL_183;
                }
                uint64_t v76 = sub_2523C7438();
                if (v76 >= (uint64_t)v75) {
                  size_t v77 = (size_t)v75;
                }
                else {
                  size_t v77 = v76;
                }
                if (!v90) {
                  goto LABEL_198;
                }
                if (!v73) {
                  goto LABEL_199;
                }
                int v64 = memcmp(v90, v73, v77);
                swift_release();
                goto LABEL_142;
              case 2uLL:
                v84 = *(char **)(v7 + 16);
                sub_2523A8570(v9, v8, 6);
                sub_2523A8570(v7, v6, 6);
                sub_2523A8570(v9, v8, 6);
                swift_retain();
                swift_retain();
                uint64_t v42 = sub_2523C7428();
                if (v42)
                {
                  uint64_t v43 = v42;
                  uint64_t v44 = sub_2523C7448();
                  if (__OFSUB__(v84, v44)) {
                    goto LABEL_172;
                  }
                  v85 = &v84[v43 - v44];
                }
                else
                {
                  v85 = 0;
                }
                sub_2523C7438();
                if (v30)
                {
                  if (v30 == 1)
                  {
                    if (v9 >> 32 < (int)v9) {
                      goto LABEL_176;
                    }
                    swift_retain();
                    uint64_t v50 = sub_2523C7428();
                    if (v50)
                    {
                      uint64_t v82 = v50;
                      uint64_t v51 = sub_2523C7448();
                      if (__OFSUB__((int)v9, v51)) {
                        goto LABEL_187;
                      }
                      v52 = (const void *)(v82 + (int)v9 - v51);
                    }
                    else
                    {
                      v52 = 0;
                    }
                    uint64_t v78 = sub_2523C7438();
                    if (v78 >= (v9 >> 32) - (int)v9) {
                      size_t v79 = (v9 >> 32) - (int)v9;
                    }
                    else {
                      size_t v79 = v78;
                    }
                    if (!v85) {
                      goto LABEL_200;
                    }
                    if (!v52) {
                      goto LABEL_201;
                    }
                    int v49 = memcmp(v85, v52, v79);
                    sub_2523A8630(v9, v8, 6);
                    swift_release();
                    swift_release();
LABEL_159:
                    sub_2523A8630(v9, v8, 6);
LABEL_160:
                    sub_2523A8630(v7, v6, 6);
                    sub_2523A8630(v9, v8, 6);
LABEL_161:
                    sub_2523A8630(v7, v6, 6);
                    if (v49) {
                      return 0;
                    }
                  }
                  else
                  {
                    uint64_t v65 = *(void *)(v9 + 16);
                    uint64_t v83 = *(void *)(v9 + 24);
                    swift_retain();
                    swift_retain();
                    v66 = (char *)sub_2523C7428();
                    if (v66)
                    {
                      uint64_t v67 = sub_2523C7448();
                      if (__OFSUB__(v65, v67)) {
                        goto LABEL_186;
                      }
                      v66 += v65 - v67;
                    }
                    BOOL v34 = __OFSUB__(v83, v65);
                    int64_t v68 = v83 - v65;
                    if (v34) {
                      goto LABEL_181;
                    }
                    uint64_t v69 = sub_2523C7438();
                    if (v69 >= v68) {
                      size_t v70 = v68;
                    }
                    else {
                      size_t v70 = v69;
                    }
                    if (!v85) {
                      goto LABEL_195;
                    }
                    if (!v66) {
                      goto LABEL_196;
                    }
                    int v71 = memcmp(v85, v66, v70);
                    swift_release();
                    swift_release();
                    swift_release();
                    swift_release();
                    sub_2523A8630(v9, v8, 6);
                    sub_2523A8630(v7, v6, 6);
                    sub_2523A8630(v9, v8, 6);
                    sub_2523A8630(v7, v6, 6);
                    if (v71) {
                      return 0;
                    }
                  }
                }
                else
                {
                  __s1[0] = v9;
                  LOWORD(__s1[1]) = v8;
                  BYTE2(__s1[1]) = BYTE2(v8);
                  BYTE3(__s1[1]) = BYTE3(v8);
                  BYTE4(__s1[1]) = BYTE4(v8);
                  BYTE5(__s1[1]) = BYTE5(v8);
                  if (!v85) {
                    goto LABEL_194;
                  }
                  int v64 = memcmp(v85, __s1, BYTE6(v8));
                  swift_release();
LABEL_142:
                  swift_release();
                  sub_2523A8630(v9, v8, 6);
LABEL_143:
                  sub_2523A8630(v7, v6, 6);
                  sub_2523A8630(v9, v8, 6);
                  sub_2523A8630(v7, v6, 6);
                  if (v64) {
                    return 0;
                  }
                }
                break;
              case 3uLL:
                memset(__s1, 0, 14);
                if (!v30) {
                  goto LABEL_87;
                }
                if (v30 == 1)
                {
                  v88 = (void *)((v9 >> 32) - (int)v9);
                  if (v9 >> 32 < (int)v9) {
                    goto LABEL_175;
                  }
                  sub_2523A8570(v7, v6, 6);
                  sub_2523A8570(v9, v8, 6);
                  uint64_t v45 = sub_2523C7428();
                  if (!v45) {
                    goto LABEL_191;
                  }
                  uint64_t v36 = v45;
                  uint64_t v46 = sub_2523C7448();
                  uint64_t v38 = (int)v9 - v46;
                  if (__OFSUB__((int)v9, v46)) {
                    goto LABEL_180;
                  }
LABEL_83:
                  uint64_t v47 = sub_2523C7438();
                  if (v47 >= (uint64_t)v88) {
                    size_t v48 = (size_t)v88;
                  }
                  else {
                    size_t v48 = v47;
                  }
                  int v49 = memcmp(__s1, (const void *)(v36 + v38), v48);
                  goto LABEL_160;
                }
                uint64_t v61 = *(void *)(v9 + 16);
                v92 = *(char **)(v9 + 24);
                sub_2523A8570(v7, v6, 6);
                sub_2523A8570(v9, v8, 6);
                swift_retain();
                swift_retain();
                v57 = (char *)sub_2523C7428();
                if (v57)
                {
                  uint64_t v62 = sub_2523C7448();
                  if (__OFSUB__(v61, v62)) {
                    goto LABEL_185;
                  }
                  v57 += v61 - v62;
                }
                BOOL v34 = __OFSUB__(v92, v61);
                v59 = &v92[-v61];
                if (v34) {
                  goto LABEL_178;
                }
                uint64_t v60 = sub_2523C7438();
                if (!v57) {
                  goto LABEL_193;
                }
LABEL_113:
                if (v60 >= (uint64_t)v59) {
                  size_t v63 = (size_t)v59;
                }
                else {
                  size_t v63 = v60;
                }
                int v64 = memcmp(__s1, v57, v63);
                swift_release();
                swift_release();
                goto LABEL_143;
              default:
                __s1[0] = v7;
                LOWORD(__s1[1]) = v6;
                BYTE2(__s1[1]) = BYTE2(v6);
                BYTE3(__s1[1]) = BYTE3(v6);
                BYTE4(__s1[1]) = BYTE4(v6);
                BYTE5(__s1[1]) = BYTE5(v6);
                if (!v30)
                {
LABEL_87:
                  uint64_t __s2 = v9;
                  __int16 v94 = v8;
                  char v95 = BYTE2(v8);
                  char v96 = BYTE3(v8);
                  char v97 = BYTE4(v8);
                  char v98 = BYTE5(v8);
                  int v49 = memcmp(__s1, &__s2, BYTE6(v8));
                  goto LABEL_161;
                }
                if (v30 == 1)
                {
                  v88 = (void *)((v9 >> 32) - (int)v9);
                  if (v9 >> 32 < (int)v9) {
                    goto LABEL_174;
                  }
                  sub_2523A8570(v7, v6, 6);
                  sub_2523A8570(v9, v8, 6);
                  uint64_t v35 = sub_2523C7428();
                  if (!v35)
                  {
                    sub_2523C7438();
                    __break(1u);
LABEL_191:
                    sub_2523C7438();
                    __break(1u);
LABEL_192:
                    __break(1u);
LABEL_193:
                    __break(1u);
LABEL_194:
                    __break(1u);
LABEL_195:
                    __break(1u);
LABEL_196:
                    __break(1u);
LABEL_197:
                    __break(1u);
LABEL_198:
                    __break(1u);
LABEL_199:
                    __break(1u);
LABEL_200:
                    __break(1u);
LABEL_201:
                    __break(1u);
LABEL_202:
                    __break(1u);
LABEL_203:
                    __break(1u);
                    JUMPOUT(0x2523A9924);
                  }
                  uint64_t v36 = v35;
                  uint64_t v37 = sub_2523C7448();
                  uint64_t v38 = (int)v9 - v37;
                  if (__OFSUB__((int)v9, v37)) {
                    goto LABEL_179;
                  }
                  goto LABEL_83;
                }
                uint64_t v56 = *(void *)(v9 + 16);
                v91 = *(char **)(v9 + 24);
                sub_2523A8570(v7, v6, 6);
                sub_2523A8570(v9, v8, 6);
                swift_retain();
                swift_retain();
                v57 = (char *)sub_2523C7428();
                if (v57)
                {
                  uint64_t v58 = sub_2523C7448();
                  if (__OFSUB__(v56, v58)) {
                    goto LABEL_184;
                  }
                  v57 += v56 - v58;
                }
                BOOL v34 = __OFSUB__(v91, v56);
                v59 = &v91[-v56];
                if (v34) {
                  goto LABEL_177;
                }
                uint64_t v60 = sub_2523C7438();
                if (!v57) {
                  goto LABEL_192;
                }
                goto LABEL_113;
            }
          }
LABEL_10:
          if (!--v2) {
            return 1;
          }
          break;
        case 2uLL:
          uint64_t v33 = *(void *)(v9 + 16);
          uint64_t v32 = *(void *)(v9 + 24);
          BOOL v34 = __OFSUB__(v32, v33);
          uint64_t v31 = v32 - v33;
          if (!v34) {
            goto LABEL_59;
          }
          goto LABEL_170;
        case 3uLL:
          if (!v17) {
            goto LABEL_70;
          }
          goto LABEL_164;
        default:
          uint64_t v31 = BYTE6(v8);
          goto LABEL_59;
      }
    }
  }
  return 1;
}

uint64_t sub_2523A9980(uint64_t a1, uint64_t a2)
{
  void __s1[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v38 = 0;
    char v3 = (unsigned __int8 *)(a2 + 64);
    int v4 = (unsigned char *)(a1 + 64);
    while (2)
    {
      uint64_t v6 = __ROR8__(*((void *)v4 - 4), 32);
      uint64_t v7 = *((void *)v4 - 4);
      if (!*(v4 - 24)) {
        uint64_t v7 = v6;
      }
      uint64_t v8 = __ROR8__(*((void *)v3 - 4), 32);
      if (*(v3 - 24)) {
        uint64_t v8 = *((void *)v3 - 4);
      }
      if (v7 == v8)
      {
        uint64_t v9 = *((uint64_t *)v4 - 2);
        unint64_t v10 = *((void *)v4 - 1);
        double v11 = *((double *)v3 - 2);
        unint64_t v12 = *((void *)v3 - 1);
        int v14 = *v3;
        v3 += 40;
        int v13 = v14;
        switch(*v4)
        {
          case 1:
            if (v13 != 1 || v9 != *(void *)&v11) {
              return 0;
            }
            goto LABEL_10;
          case 2:
            if (v13 != 2 || v9 != *(void *)&v11) {
              return 0;
            }
            goto LABEL_10;
          case 3:
            if (v13 != 3 || *(float *)&v9 != *(float *)&v11) {
              return 0;
            }
            goto LABEL_10;
          case 4:
            if (v13 != 4 || *(double *)&v9 != v11) {
              return 0;
            }
            goto LABEL_10;
          case 5:
            if (v13 != 5) {
              return 0;
            }
            goto LABEL_47;
          case 6:
            if (v13 != 6) {
              return 0;
            }
            uint64_t v19 = 0;
            switch(v10 >> 62)
            {
              case 1uLL:
                LODWORD(v19) = HIDWORD(v9) - v9;
                if (__OFSUB__(HIDWORD(v9), v9))
                {
                  __break(1u);
LABEL_89:
                  __break(1u);
LABEL_90:
                  __break(1u);
LABEL_91:
                  __break(1u);
LABEL_92:
                  __break(1u);
LABEL_93:
                  __break(1u);
LABEL_94:
                  __break(1u);
LABEL_95:
                  __break(1u);
                }
                uint64_t v19 = (int)v19;
LABEL_59:
                switch(v12 >> 62)
                {
                  case 1uLL:
                    LODWORD(v28) = HIDWORD(v11) - LODWORD(v11);
                    if (__OFSUB__(HIDWORD(v11), LODWORD(v11))) {
                      goto LABEL_90;
                    }
                    uint64_t v28 = (int)v28;
LABEL_64:
                    if (v19 != v28) {
                      return 0;
                    }
                    if (v19 < 1) {
                      goto LABEL_10;
                    }
                    switch(v10 >> 62)
                    {
                      case 1uLL:
                        if (v9 >> 32 < (int)v9) {
                          goto LABEL_92;
                        }
                        sub_2523A8570(v9, v10, 6);
                        sub_2523A8570(v9, v10, 6);
                        sub_2523A8570(*(uint64_t *)&v11, v12, 6);
                        uint64_t v31 = sub_2523C7428();
                        if (!v31) {
                          goto LABEL_74;
                        }
                        uint64_t v32 = sub_2523C7448();
                        if (__OFSUB__((int)v9, v32)) {
                          goto LABEL_94;
                        }
                        v31 += (int)v9 - v32;
LABEL_74:
                        uint64_t v33 = v38;
                        sub_2523C7438();
                        sub_2523AA024(v31, *(uint64_t *)&v11, v12, (char *)__s1);
                        sub_2523A8630(v9, v10, 6);
                        break;
                      case 2uLL:
                        uint64_t v34 = *(void *)(v9 + 16);
                        uint64_t v37 = *(void *)(v9 + 24);
                        sub_2523A8570(v9, v10, 6);
                        sub_2523A8570(*(uint64_t *)&v11, v12, 6);
                        swift_retain();
                        swift_retain();
                        uint64_t v35 = sub_2523C7428();
                        if (!v35) {
                          goto LABEL_78;
                        }
                        uint64_t v36 = sub_2523C7448();
                        if (__OFSUB__(v34, v36)) {
                          goto LABEL_95;
                        }
                        v35 += v34 - v36;
LABEL_78:
                        if (__OFSUB__(v37, v34)) {
                          goto LABEL_93;
                        }
                        sub_2523C7438();
                        uint64_t v33 = v38;
                        sub_2523AA024(v35, *(uint64_t *)&v11, v12, (char *)__s1);
                        swift_release();
                        swift_release();
                        break;
                      case 3uLL:
                        memset(__s1, 0, 14);
                        sub_2523A8570(v9, v10, 6);
                        sub_2523A8570(*(uint64_t *)&v11, v12, 6);
                        goto LABEL_83;
                      default:
                        __s1[0] = *((void *)v4 - 2);
                        LOWORD(__s1[1]) = v10;
                        BYTE2(__s1[1]) = BYTE2(v10);
                        BYTE3(__s1[1]) = BYTE3(v10);
                        BYTE4(__s1[1]) = BYTE4(v10);
                        BYTE5(__s1[1]) = BYTE5(v10);
                        sub_2523A8570(v9, v10, 6);
                        sub_2523A8570(*(uint64_t *)&v11, v12, 6);
LABEL_83:
                        uint64_t v33 = v38;
                        sub_2523AA024((uint64_t)__s1, *(uint64_t *)&v11, v12, &v39);
                        sub_2523A8630(*(uint64_t *)&v11, v12, 6);
                        sub_2523A8630(v9, v10, 6);
                        if (v39) {
                          goto LABEL_84;
                        }
                        return 0;
                    }
                    sub_2523A8630(*(uint64_t *)&v11, v12, 6);
                    sub_2523A8630(v9, v10, 6);
                    if ((__s1[0] & 1) == 0) {
                      return 0;
                    }
LABEL_84:
                    uint64_t v38 = v33;
                    break;
                  case 2uLL:
                    uint64_t v30 = *(void *)(*(void *)&v11 + 16);
                    uint64_t v29 = *(void *)(*(void *)&v11 + 24);
                    BOOL v27 = __OFSUB__(v29, v30);
                    uint64_t v28 = v29 - v30;
                    if (!v27) {
                      goto LABEL_64;
                    }
                    goto LABEL_91;
                  case 3uLL:
                    if (v19) {
                      return 0;
                    }
                    goto LABEL_10;
                  default:
                    uint64_t v28 = BYTE6(v12);
                    goto LABEL_64;
                }
                break;
              case 2uLL:
                uint64_t v26 = *(void *)(v9 + 16);
                uint64_t v25 = *(void *)(v9 + 24);
                BOOL v27 = __OFSUB__(v25, v26);
                uint64_t v19 = v25 - v26;
                if (!v27) {
                  goto LABEL_59;
                }
                goto LABEL_89;
              case 3uLL:
                goto LABEL_59;
              default:
                uint64_t v19 = BYTE6(v10);
                goto LABEL_59;
            }
            goto LABEL_10;
          case 7:
            if (v13 != 7) {
              return 0;
            }
            uint64_t v20 = *(void *)(v9 + 16);
            uint64_t v21 = *(void *)(*(void *)&v11 + 16);
            sub_2523A8570(*((void *)v4 - 2), *((void *)v4 - 1), 7);
            sub_2523A8570(*(uint64_t *)&v11, v12, 7);
            LOBYTE(v20) = sub_2523A8D20(v20, v21);
            sub_2523A8630(*(uint64_t *)&v11, v12, 7);
            sub_2523A8630(v9, v10, 7);
            if ((v20 & 1) == 0) {
              return 0;
            }
            goto LABEL_10;
          case 8:
            if (v13 != 8) {
              return 0;
            }
            uint64_t v22 = *(void *)(v9 + 16);
            uint64_t v23 = *(void *)(*(void *)&v11 + 16);
            sub_2523A8570(*((void *)v4 - 2), *((void *)v4 - 1), 8);
            sub_2523A8570(*(uint64_t *)&v11, v12, 8);
            LOBYTE(v22) = sub_2523A9980(v22, v23);
            sub_2523A8630(*(uint64_t *)&v11, v12, 8);
            sub_2523A8630(v9, v10, 8);
            if ((v22 & 1) == 0) {
              return 0;
            }
            goto LABEL_10;
          case 9:
            if (v13 != 9) {
              return 0;
            }
LABEL_47:
            if ((v9 != *(void *)&v11 || v10 != v12) && (sub_2523C78F8() & 1) == 0) {
              return 0;
            }
            goto LABEL_10;
          case 0xA:
            if (v13 != 10 || (v12 | *(void *)&v11) != 0) {
              return 0;
            }
            goto LABEL_10;
          default:
            uint64_t result = 0;
            if (v13 || ((((*((void *)v4 - 2) & 1) == 0) ^ LODWORD(v11)) & 1) == 0) {
              return result;
            }
LABEL_10:
            v4 += 40;
            if (--v2) {
              continue;
            }
            return 1;
        }
      }
      return 0;
    }
  }
  return 1;
}

uint64_t sub_2523AA024@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_2523A85C8(a2, a3);
      unint64_t v10 = (char *)sub_2523C7428();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_2523C7448();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_2523C7438();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x2523AA288);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_2523A8688(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_2523C7428();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_2523C7448();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_2523C7438();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_2523AA298(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t result = sub_2523C7AD8();
  if (v4)
  {
    uint64_t v6 = (unsigned __int8 *)(a2 + 64);
    do
    {
      uint64_t v7 = *((void *)v6 - 2);
      unint64_t v8 = *((void *)v6 - 1);
      unsigned int v9 = *v6;
      v6 += 40;
      sub_2523C7B18();
      sub_2523A8570(v7, v8, v9);
      sub_2523A89C0(a1, v7, v8, v9);
      uint64_t result = sub_2523A8630(v7, v8, v9);
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t sub_2523AA340(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_2523AA024((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_2523AA418(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_2523C7428();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_2523C7448();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_2523C7438();
  sub_2523AA024(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_2523AA4D0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x2523AA738);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_2523A85C8(a3, a4);
                  sub_2523A85C8(a1, a2);
                  char v17 = sub_2523AA418((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_2523A8688(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_2523A85C8(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_2523AA418(v21, v22, v20, a3, a4);
                  sub_2523A8688(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_2523A85C8(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_2523A85C8(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_2523AA340(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_2523A8688(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_2523AA768(uint64_t a1, unint64_t a2, char a3, uint64_t a4, unint64_t a5, char a6)
{
  switch(a3)
  {
    case 1:
      if (a6 == 1) {
        goto LABEL_7;
      }
      goto LABEL_33;
    case 2:
      if (a6 != 2) {
        goto LABEL_33;
      }
LABEL_7:
      char v10 = a1 == a4;
      return v10 & 1;
    case 3:
      if (a6 != 3) {
        goto LABEL_33;
      }
      char v10 = *(float *)&a1 == *(float *)&a4;
      return v10 & 1;
    case 4:
      if (a6 != 4) {
        goto LABEL_33;
      }
      char v10 = *(double *)&a1 == *(double *)&a4;
      return v10 & 1;
    case 5:
      if (a6 == 5) {
        goto LABEL_21;
      }
      goto LABEL_33;
    case 6:
      if (a6 != 6) {
        goto LABEL_33;
      }
      sub_2523A8570(a1, a2, 6);
      sub_2523A8570(a4, a5, 6);
      char v11 = sub_2523AA4D0(a1, a2, a4, a5);
      sub_2523A8630(a4, a5, 6);
      sub_2523A8630(a1, a2, 6);
      return v11 & 1;
    case 7:
      if (a6 != 7) {
        goto LABEL_33;
      }
      uint64_t v13 = *(void *)(a1 + 16);
      uint64_t v14 = *(void *)(a4 + 16);
      return sub_2523A8D20(v13, v14);
    case 8:
      if (a6 != 8) {
        goto LABEL_33;
      }
      uint64_t v15 = *(void *)(a1 + 16);
      uint64_t v16 = *(void *)(a4 + 16);
      return sub_2523A9980(v15, v16);
    case 9:
      if (a6 != 9) {
        goto LABEL_33;
      }
LABEL_21:
      if (a1 == a4 && a2 == a5)
      {
LABEL_32:
        char v10 = 1;
        return v10 & 1;
      }
      else
      {
        return sub_2523C78F8();
      }
    case 10:
      if (a6 == 10 && !(a5 | a4)) {
        goto LABEL_32;
      }
      goto LABEL_33;
    default:
      if (a6) {
LABEL_33:
      }
        char v10 = 0;
      else {
        char v10 = ((a1 & 1) == 0) ^ a4;
      }
      return v10 & 1;
  }
}

uint64_t sub_2523AA9E0()
{
  uint64_t v1 = v0;
  sub_2523C7AC8();
  sub_2523AAEE0(v0, (uint64_t)v7);
  sub_2523AAEE0((uint64_t)v7, (uint64_t)&v8);
  sub_2523C7B18();
  uint64_t v2 = *(void *)(v0 + 16);
  unint64_t v3 = *(void *)(v1 + 24);
  char v4 = *(unsigned char *)(v1 + 32);
  sub_2523AAF3C(v1);
  sub_2523A89C0((uint64_t)&v6, v2, v3, v4);
  sub_2523AAF70(v1);
  return sub_2523C7B28();
}

uint64_t sub_2523AAA98()
{
  return sub_2523AA9E0();
}

uint64_t sub_2523AAAD4(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  unint64_t v4 = *(void *)(v1 + 24);
  char v5 = *(unsigned char *)(v1 + 32);
  sub_2523C7B18();
  sub_2523A8570(v3, v4, v5);
  sub_2523A89C0(a1, v3, v4, v5);
  return sub_2523A8630(v3, v4, v5);
}

uint64_t sub_2523AAB6C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  unint64_t v2 = *(void *)(v0 + 24);
  char v3 = *(unsigned char *)(v0 + 32);
  sub_2523C7AC8();
  sub_2523C7B18();
  sub_2523A8570(v1, v2, v3);
  sub_2523A89C0((uint64_t)v5, v1, v2, v3);
  sub_2523A8630(v1, v2, v3);
  return sub_2523C7B28();
}

uint64_t sub_2523AAC0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void *)(a1 + 24);
  char v4 = *(unsigned char *)(a1 + 32);
  uint64_t v5 = *(void *)(a2 + 16);
  unint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  if (!sub_2523AB25C(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8))) {
    return 0;
  }
  return sub_2523AA768(v2, v3, v4, v5, v6, v7);
}

uint64_t _s11TaggedValueVwxx(uint64_t a1)
{
  return sub_2523A8630(*(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t _s11TaggedValueVwcp(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  unint64_t v4 = *(void *)(a2 + 24);
  char v5 = *(unsigned char *)(a2 + 32);
  sub_2523A8570(v3, v4, v5);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  return a1;
}

uint64_t _s11TaggedValueVwca(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v3;
  uint64_t v4 = a2[2];
  unint64_t v5 = a2[3];
  char v6 = *((unsigned char *)a2 + 32);
  sub_2523A8570(v4, v5, v6);
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v6;
  sub_2523A8630(v7, v8, v9);
  return a1;
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

uint64_t _s11TaggedValueVwta(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)(a1 + 16);
  unint64_t v5 = *(void *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  char v6 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_2523A8630(v4, v5, v6);
  return a1;
}

uint64_t _s11TaggedValueVwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s11TaggedValueVwst(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *_s11TaggedValueVMa()
{
  return &_s11TaggedValueVN;
}

unint64_t sub_2523AAE8C()
{
  unint64_t result = qword_269C02E58;
  if (!qword_269C02E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C02E58);
  }
  return result;
}

uint64_t sub_2523AAEE0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2523AAF3C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2523AAF70(uint64_t a1)
{
  return a1;
}

uint64_t sub_2523AAFA4()
{
  sub_2523AB03C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  return MEMORY[0x270FA0228](v0, 33, 7);
}

uint64_t _s14ValueReferenceCMa()
{
  return self;
}

uint64_t sub_2523AB008(uint64_t result, unint64_t a2, char a3)
{
  int v3 = a3 >> 6;
  if (v3 == 2 || v3 == 1) {
    return swift_bridgeObjectRetain();
  }
  if (!(a3 >> 6)) {
    return sub_2523A8570(result, a2, a3);
  }
  return result;
}

uint64_t _s14ValueReferenceC7BackingOwxx(uint64_t a1)
{
  return sub_2523AB03C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_2523AB03C(uint64_t result, unint64_t a2, char a3)
{
  int v3 = a3 >> 6;
  if (v3 == 2 || v3 == 1) {
    return swift_bridgeObjectRelease();
  }
  if (!(a3 >> 6)) {
    return sub_2523A8630(result, a2, a3);
  }
  return result;
}

uint64_t _s14ValueReferenceC7BackingOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_2523AB008(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s14ValueReferenceC7BackingOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_2523AB008(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_2523AB03C(v6, v7, v8);
  return a1;
}

uint64_t _s14ValueReferenceC7BackingOwta(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_2523AB03C(v4, v5, v6);
  return a1;
}

uint64_t _s14ValueReferenceC7BackingOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 16) >> 2) & 0xC | (*(unsigned __int8 *)(a1 + 16) >> 6)) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t _s14ValueReferenceC7BackingOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2)
    {
      *(void *)unint64_t result = 0;
      *(void *)(result + 8) = 0;
      *(unsigned char *)(result + 16) = 16 * (((-a2 >> 2) & 3) - 4 * a2);
    }
  }
  return result;
}

uint64_t sub_2523AB1F4(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 16) >> 6;
  if (v1 == 3) {
    return (*(_DWORD *)a1 + 3);
  }
  else {
    return v1;
  }
}

uint64_t sub_2523AB210(uint64_t result)
{
  *(unsigned char *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_2523AB220(uint64_t result, unsigned int a2)
{
  if (a2 < 3)
  {
    *(unsigned char *)(result + 16) = *(unsigned char *)(result + 16) & 0xF | ((_BYTE)a2 << 6);
  }
  else
  {
    *(void *)unint64_t result = a2 - 3;
    *(void *)(result + 8) = 0;
    *(unsigned char *)(result + 16) = -64;
  }
  return result;
}

ValueMetadata *_s14ValueReferenceC7BackingOMa()
{
  return &_s14ValueReferenceC7BackingON;
}

BOOL sub_2523AB25C(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v4 = __ROR8__(a1, 32);
  if (a2) {
    uint64_t v4 = a1;
  }
  uint64_t v5 = __ROR8__(a3, 32);
  if (a4) {
    uint64_t v5 = a3;
  }
  return v4 == v5;
}

uint64_t sub_2523AB288(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = a5;
  uint64_t v29 = a8;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v27 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v40 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v26 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v30 = *(void *)(v15 - 8);
  uint64_t v31 = v15;
  MEMORY[0x270FA5388](v15);
  char v17 = (char *)&v26 - v16;
  uint64_t v18 = sub_2523C7558();
  if (!v18) {
    return sub_2523C7518();
  }
  uint64_t v19 = v18;
  uint64_t v43 = sub_2523C7628();
  uint64_t v32 = sub_2523C7638();
  sub_2523C7608();
  uint64_t v36 = v8;
  uint64_t result = sub_2523C7548();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v34 = (void (**)(char *))(v33 + 2);
    uint64_t v35 = v14;
    ++v33;
    while (1)
    {
      uint64_t v21 = (void (*)(char *, void))sub_2523C7578();
      uint64_t v22 = v12;
      int v23 = v12;
      uint64_t v24 = AssociatedTypeWitness;
      (*v34)(v22);
      v21(v42, 0);
      uint64_t v25 = v41;
      v38(v23, v40);
      if (v25) {
        break;
      }
      uint64_t v41 = 0;
      (*v33)(v23, v24);
      sub_2523C7618();
      sub_2523C7568();
      --v19;
      uint64_t v12 = v23;
      if (!v19)
      {
        (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
        return v43;
      }
    }
    (*v33)(v23, v24);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v29, v40, v28);
  }
  return result;
}

uint64_t sub_2523AB688@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, void *a4@<X8>)
{
  sub_2523C7598();
  swift_bridgeObjectRelease();
  sub_2523A88AC(a1, a2, a3);
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
  *a4 = MEMORY[0x263F06F78];
  swift_bridgeObjectRetain();
  sub_2523C75C8();
  uint64_t v8 = *MEMORY[0x263F8DCB0];
  uint64_t v9 = sub_2523C75D8();
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  return v10(a4, v8, v9);
}

uint64_t sub_2523AB7E0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, void *a4@<X8>)
{
  sub_2523C7598();
  swift_bridgeObjectRelease();
  sub_2523A88AC(a1, a2, a3);
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
  *a4 = MEMORY[0x263F8D4F8];
  swift_bridgeObjectRetain();
  sub_2523C75C8();
  uint64_t v8 = *MEMORY[0x263F8DCB0];
  uint64_t v9 = sub_2523C75D8();
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  return v10(a4, v8, v9);
}

uint64_t sub_2523AB938@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, void *a4@<X8>)
{
  sub_2523C7598();
  swift_bridgeObjectRelease();
  sub_2523A88AC(a1, a2, a3);
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
  *a4 = MEMORY[0x263F8D310];
  swift_bridgeObjectRetain();
  sub_2523C75C8();
  uint64_t v8 = *MEMORY[0x263F8DCB0];
  uint64_t v9 = sub_2523C75D8();
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  return v10(a4, v8, v9);
}

uint64_t sub_2523ABA90@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, void *a4@<X8>)
{
  sub_2523C7598();
  swift_bridgeObjectRelease();
  sub_2523A88AC(a1, a2, a3);
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
  *a4 = MEMORY[0x263F8D538];
  swift_bridgeObjectRetain();
  sub_2523C75C8();
  uint64_t v8 = *MEMORY[0x263F8DCB0];
  uint64_t v9 = sub_2523C75D8();
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  return v10(a4, v8, v9);
}

uint64_t sub_2523ABBE8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, void *a4@<X8>)
{
  sub_2523C7598();
  swift_bridgeObjectRelease();
  sub_2523A88AC(a1, a2, a3);
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
  *a4 = MEMORY[0x263F8D5C8];
  swift_bridgeObjectRetain();
  sub_2523C75C8();
  uint64_t v8 = *MEMORY[0x263F8DCB0];
  uint64_t v9 = sub_2523C75D8();
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  return v10(a4, v8, v9);
}

uint64_t sub_2523ABD40@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, void *a4@<X8>)
{
  sub_2523C7598();
  swift_bridgeObjectRelease();
  sub_2523A88AC(a1, a2, a3);
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
  *a4 = MEMORY[0x263F8D6C8];
  swift_bridgeObjectRetain();
  sub_2523C75C8();
  uint64_t v8 = *MEMORY[0x263F8DCB0];
  uint64_t v9 = sub_2523C75D8();
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  return v10(a4, v8, v9);
}

uint64_t sub_2523ABE98@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, void *a4@<X8>)
{
  sub_2523C7598();
  swift_bridgeObjectRelease();
  sub_2523A88AC(a1, a2, a3);
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
  *a4 = MEMORY[0x263F8E498];
  swift_bridgeObjectRetain();
  sub_2523C75C8();
  uint64_t v8 = *MEMORY[0x263F8DCB0];
  uint64_t v9 = sub_2523C75D8();
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  return v10(a4, v8, v9);
}

uint64_t sub_2523ABFF0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, void *a4@<X8>)
{
  sub_2523C7598();
  swift_bridgeObjectRelease();
  sub_2523A88AC(a1, a2, a3);
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
  *a4 = MEMORY[0x263F8E4F0];
  swift_bridgeObjectRetain();
  sub_2523C75C8();
  uint64_t v8 = *MEMORY[0x263F8DCB0];
  uint64_t v9 = sub_2523C75D8();
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  return v10(a4, v8, v9);
}

uint64_t sub_2523AC148@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, void *a4@<X8>)
{
  sub_2523C7598();
  swift_bridgeObjectRelease();
  sub_2523A88AC(a1, a2, a3);
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
  *a4 = MEMORY[0x263F8E548];
  swift_bridgeObjectRetain();
  sub_2523C75C8();
  uint64_t v8 = *MEMORY[0x263F8DCB0];
  uint64_t v9 = sub_2523C75D8();
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  return v10(a4, v8, v9);
}

uint64_t sub_2523AC2A0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, void *a4@<X8>)
{
  sub_2523C7598();
  swift_bridgeObjectRelease();
  sub_2523A88AC(a1, a2, a3);
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
  *a4 = MEMORY[0x263F8E5C0];
  swift_bridgeObjectRetain();
  sub_2523C75C8();
  uint64_t v8 = *MEMORY[0x263F8DCB0];
  uint64_t v9 = sub_2523C75D8();
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  return v10(a4, v8, v9);
}

uint64_t sub_2523AC3F8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, void *a4@<X8>)
{
  sub_2523C7598();
  swift_bridgeObjectRelease();
  sub_2523A88AC(a1, a2, a3);
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
  *a4 = MEMORY[0x263F8D9D0];
  swift_bridgeObjectRetain();
  sub_2523C75C8();
  uint64_t v8 = *MEMORY[0x263F8DCB0];
  uint64_t v9 = sub_2523C75D8();
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  return v10(a4, v8, v9);
}

uint64_t sub_2523AC550@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, void *a4@<X8>)
{
  sub_2523C7598();
  swift_bridgeObjectRelease();
  sub_2523A88AC(a1, a2, a3);
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
  *a4 = MEMORY[0x263F8E778];
  swift_bridgeObjectRetain();
  sub_2523C75C8();
  uint64_t v8 = *MEMORY[0x263F8DCB0];
  uint64_t v9 = sub_2523C75D8();
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  return v10(a4, v8, v9);
}

uint64_t sub_2523AC6A8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, void *a4@<X8>)
{
  sub_2523C7598();
  swift_bridgeObjectRelease();
  sub_2523A88AC(a1, a2, a3);
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
  *a4 = MEMORY[0x263F8E888];
  swift_bridgeObjectRetain();
  sub_2523C75C8();
  uint64_t v8 = *MEMORY[0x263F8DCB0];
  uint64_t v9 = sub_2523C75D8();
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  return v10(a4, v8, v9);
}

uint64_t sub_2523AC800@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, void *a4@<X8>)
{
  sub_2523C7598();
  swift_bridgeObjectRelease();
  sub_2523A88AC(a1, a2, a3);
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
  *a4 = MEMORY[0x263F8E8F8];
  swift_bridgeObjectRetain();
  sub_2523C75C8();
  uint64_t v8 = *MEMORY[0x263F8DCB0];
  uint64_t v9 = sub_2523C75D8();
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  return v10(a4, v8, v9);
}

uint64_t sub_2523AC958@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, void *a4@<X8>)
{
  sub_2523C7598();
  swift_bridgeObjectRelease();
  sub_2523A88AC(a1, a2, a3);
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
  *a4 = MEMORY[0x263F8E970];
  swift_bridgeObjectRetain();
  sub_2523C75C8();
  uint64_t v8 = *MEMORY[0x263F8DCB0];
  uint64_t v9 = sub_2523C75D8();
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 104);
  return v10(a4, v8, v9);
}

uint64_t sub_2523ACAB0@<X0>(uint64_t a1@<X8>)
{
  sub_2523C7598();
  sub_2523C7488();
  sub_2523C7488();
  sub_2523C7488();
  sub_2523C7648();
  sub_2523C7488();
  swift_bridgeObjectRetain();
  sub_2523C75C8();
  uint64_t v2 = *MEMORY[0x263F8DCB8];
  uint64_t v3 = sub_2523C75D8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_2523ACC20@<X0>(char *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t result = swift_beginAccess();
  uint64_t v8 = *(void *)(v3 + 24);
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    uint64_t v10 = v8 + 24 * v9;
    uint64_t v11 = *(void *)(v10 + 8);
    unint64_t v12 = *(void *)(v10 + 16);
    unint64_t v13 = *(void *)(v3 + 32);
    int v14 = *(unsigned __int8 *)(v10 + 24);
    memset(v16, 0, sizeof(v16));
    char v17 = -1;
    sub_2523A8570(v11, v12, v14);
    unint64_t v15 = sub_2523A797C();
    swift_retain();
    sub_2523AE75C(v11, v12, v14, a1, v13, (uint64_t)v16, (uint64_t)a1, (uint64_t)&_s10_CodingKeyON, a3, a2, v15);
    swift_release();
    return sub_2523A8630(v11, v12, v14);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523ACD38()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 24;
  uint64_t result = swift_beginAccess();
  if (*(void *)(*(void *)(v1 + 24) + 16))
  {
    sub_2523B8434((uint64_t)&v7);
    char v4 = v9;
    if (v9 == 255)
    {
      sub_2523B8258(*(void *)(*(void *)v2 + 16) - 1, (uint64_t)&v7);
      uint64_t v6 = v7;
      unint64_t v5 = v8;
      char v4 = v9;
    }
    else
    {
      uint64_t v6 = v7;
      unint64_t v5 = v8;
    }
    swift_endAccess();
    return sub_2523A8630(v6, v5, v4);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523ACDE0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t _s12ValueDecoderV14ImplementationCMa()
{
  return self;
}

uint64_t sub_2523ACE54()
{
  return sub_2523C76D8();
}

uint64_t sub_2523ACF10()
{
  uint64_t v1 = v0;
  uint64_t result = swift_beginAccess();
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = v3 + 24 * v4;
    uint64_t v6 = *(void *)(v5 + 8);
    unint64_t v7 = *(void *)(v5 + 16);
    int v8 = *(unsigned __int8 *)(v5 + 24);
    if (v8 == 8)
    {
      swift_retain();
      sub_2523ACE54();
      return sub_2523A8630(v6, v7, 8);
    }
    if (v8 == 10 && (v7 | v6) == 0)
    {
      uint64_t v16 = sub_2523C75D8();
      swift_allocError();
      uint64_t v18 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      *uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E88);
      unint64_t v19 = *(void *)(v1 + 32);
      swift_retain();
      sub_2523A7798(v19);
      swift_release();
      sub_2523C75C8();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCC0], v16);
      return swift_willThrow();
    }
    uint64_t v10 = sub_2523C75D8();
    swift_allocError();
    unint64_t v12 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
    uint64_t *v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E88);
    unint64_t v13 = *(void *)(v0 + 32);
    swift_retain();
    sub_2523A7798(v13);
    swift_release();
    sub_2523C7598();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v0 + 24);
    uint64_t v15 = *(void *)(v14 + 16);
    if (v15)
    {
      sub_2523A88AC(*(void *)(v14 + 24 * v15 + 8), *(void *)(v14 + 24 * v15 + 16), *(unsigned char *)(v14 + 24 * v15 + 24));
      sub_2523C7488();
      swift_bridgeObjectRelease();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v10 - 8) + 104))(v12, *MEMORY[0x263F8DCB0], v10);
      return swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2523AD214@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t result = swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 24);
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v7 = v5 + 24 * v6;
    uint64_t v10 = *(void *)(v7 + 8);
    uint64_t v9 = v7 + 8;
    uint64_t v8 = v10;
    int v11 = *(unsigned __int8 *)(v9 + 16);
    if (v11 == 7)
    {
      uint64_t v18 = *(void *)(v8 + 16);
      uint64_t v19 = *(void *)(v2 + 32);
      a1[3] = (uint64_t)&_s12ValueDecoderV16UnkeyedContainerVN;
      a1[4] = sub_2523B5DFC();
      uint64_t v20 = swift_allocObject();
      *a1 = v20;
      *(void *)(v20 + 16) = v2;
      *(void *)(v20 + 24) = v19;
      *(void *)(v20 + 32) = v18;
      *(void *)(v20 + 40) = 0;
      *(void *)(v20 + 48) = 0;
      *(void *)(v20 + 56) = 0;
      *(unsigned char *)(v20 + 64) = -1;
      swift_retain();
      swift_bridgeObjectRetain();
      return swift_retain();
    }
    if (v11 == 10 && !(*(void *)(v9 + 8) | v8))
    {
      uint64_t v21 = sub_2523C75D8();
      swift_allocError();
      int v23 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      *int v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E78);
      unint64_t v24 = *(void *)(v2 + 32);
      swift_retain();
      sub_2523A7798(v24);
      swift_release();
      sub_2523C75C8();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCC0], v21);
      return swift_willThrow();
    }
    uint64_t v12 = sub_2523C75D8();
    swift_allocError();
    uint64_t v14 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
    *uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E78);
    unint64_t v15 = *(void *)(v2 + 32);
    swift_retain();
    sub_2523A7798(v15);
    swift_release();
    sub_2523C7598();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v16 = *(void *)(v2 + 24);
    uint64_t v17 = *(void *)(v16 + 16);
    if (v17)
    {
      sub_2523A88AC(*(void *)(v16 + 24 * v17 + 8), *(void *)(v16 + 24 * v17 + 16), *(unsigned char *)(v16 + 24 * v17 + 24));
      sub_2523C7488();
      swift_bridgeObjectRelease();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v12 - 8) + 104))(v14, *MEMORY[0x263F8DCB0], v12);
      return swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2523AD544()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2523AD550()
{
  return sub_2523ACF10();
}

uint64_t sub_2523AD574@<X0>(uint64_t *a1@<X8>)
{
  return sub_2523AD214(a1);
}

uint64_t sub_2523AD598@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *v2;
  a2[3] = a1;
  a2[4] = sub_2523B5DB8(&qword_269C02E68);
  *a2 = v4;
  return swift_retain();
}

uint64_t sub_2523AD600()
{
  uint64_t result = swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v2 + 24 * v3;
    BOOL v6 = *(unsigned char *)(v4 + 24) == 10;
    uint64_t v5 = *(void *)(v4 + 16) | *(void *)(v4 + 8);
    return v6 && v5 == 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523AD660(uint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      uint64_t v21 = sub_2523C75D8();
      swift_allocError();
      int v23 = v22;
      *uint64_t v22 = MEMORY[0x263F8D4F8];
      if (a8 == -1)
      {
        sub_2523A7798(a4);
      }
      else
      {
        sub_2523A82A4(a5, a6, a7, a8);
        sub_2523A7798(a4);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s10_CodingKeyON;
        *(void *)(inited + 64) = sub_2523A797C();
        uint64_t v25 = swift_allocObject();
        *(void *)(inited + 32) = v25;
        *(void *)(v25 + 16) = a5;
        *(void *)(v25 + 24) = a6;
        *(void *)(v25 + 32) = a7;
        *(unsigned char *)(v25 + 40) = a8;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCC0], v21);
      goto LABEL_6;
    }
LABEL_5:
    unint64_t v13 = *(void *)(v8 + 32);
    swift_retain();
    sub_2523A7798(v13);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523AB7E0(a1, a2, a3, v14);
    swift_bridgeObjectRelease();
LABEL_6:
    swift_willThrow();
    return v12 & 1;
  }
  if (a3) {
    goto LABEL_5;
  }
  char v12 = a1 & 1;
  return v12 & 1;
}

uint64_t sub_2523AD944(uint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      int v16 = a6;
      uint64_t v17 = sub_2523C75D8();
      swift_allocError();
      uint64_t v19 = v18;
      *uint64_t v18 = MEMORY[0x263F8D4F8];
      sub_2523A7798(a4);
      if (v16 != 255)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s3TagO14CodingKeyProxyVN;
        *(void *)(inited + 64) = sub_2523A7384();
        *(void *)(inited + 32) = a5;
        *(unsigned char *)(inited + 40) = v16 & 1;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x263F8DCC0], v17);
      goto LABEL_6;
    }
LABEL_5:
    unint64_t v11 = *(void *)(v6 + 32);
    swift_retain();
    sub_2523A7798(v11);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523AB7E0(a1, a2, a3, v12);
    swift_bridgeObjectRelease();
LABEL_6:
    swift_willThrow();
    return v10 & 1;
  }
  if (a3) {
    goto LABEL_5;
  }
  char v10 = a1 & 1;
  return v10 & 1;
}

double sub_2523ADBE4(uint64_t a1, unint64_t a2, char a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a3 == 3)
  {
    double v9 = *(float *)&a1;
    goto LABEL_6;
  }
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      uint64_t v21 = sub_2523C75D8();
      swift_allocError();
      int v23 = v22;
      *uint64_t v22 = MEMORY[0x263F8D538];
      if (a8 == -1)
      {
        sub_2523A7798(a4);
      }
      else
      {
        sub_2523A82A4(a5, a6, a7, a8);
        sub_2523A7798(a4);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s10_CodingKeyON;
        *(void *)(inited + 64) = sub_2523A797C();
        uint64_t v25 = swift_allocObject();
        *(void *)(inited + 32) = v25;
        *(void *)(v25 + 16) = a5;
        *(void *)(v25 + 24) = a6;
        *(void *)(v25 + 32) = a7;
        *(unsigned char *)(v25 + 40) = a8;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCC0], v21);
      goto LABEL_9;
    }
LABEL_8:
    unint64_t v13 = *(void *)(v8 + 32);
    swift_retain();
    sub_2523A7798(v13);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523ABA90(a1, a2, a3, v14);
    swift_bridgeObjectRelease();
LABEL_9:
    swift_willThrow();
    return v9;
  }
  if (a3 != 4) {
    goto LABEL_8;
  }
  double v9 = *(double *)&a1;
LABEL_6:
  sub_2523A8570(a1, a2, a3);
  return v9;
}

double sub_2523ADEFC(uint64_t a1, unint64_t a2, char a3, unint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a3 == 3)
  {
    double v7 = *(float *)&a1;
    goto LABEL_6;
  }
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      int v16 = a6;
      uint64_t v17 = sub_2523C75D8();
      swift_allocError();
      uint64_t v19 = v18;
      *uint64_t v18 = MEMORY[0x263F8D538];
      sub_2523A7798(a4);
      if (v16 != 255)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s3TagO14CodingKeyProxyVN;
        *(void *)(inited + 64) = sub_2523A7384();
        *(void *)(inited + 32) = a5;
        *(unsigned char *)(inited + 40) = v16 & 1;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x263F8DCC0], v17);
      goto LABEL_9;
    }
LABEL_8:
    unint64_t v11 = *(void *)(v6 + 32);
    swift_retain();
    sub_2523A7798(v11);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523ABA90(a1, a2, a3, v12);
    swift_bridgeObjectRelease();
LABEL_9:
    swift_willThrow();
    return v7;
  }
  if (a3 != 4) {
    goto LABEL_8;
  }
  double v7 = *(double *)&a1;
LABEL_6:
  sub_2523A8570(a1, a2, a3);
  return v7;
}

uint64_t sub_2523AE1D0(uint64_t result, uint64_t a2, char a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v11 = result;
  if (a3 == 10)
  {
    if (!(a2 | result))
    {
      uint64_t v19 = sub_2523C75D8();
      swift_allocError();
      uint64_t v21 = v20;
      *uint64_t v20 = MEMORY[0x263F8D5C8];
      if (a8 == -1)
      {
        sub_2523A7798(a4);
      }
      else
      {
        sub_2523A82A4(a5, a6, a7, a8);
        sub_2523A7798(a4);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s10_CodingKeyON;
        *(void *)(inited + 64) = sub_2523A797C();
        uint64_t v23 = swift_allocObject();
        *(void *)(inited + 32) = v23;
        *(void *)(v23 + 16) = a5;
        *(void *)(v23 + 24) = a6;
        *(void *)(v23 + 32) = a7;
        *(unsigned char *)(v23 + 40) = a8;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, *MEMORY[0x263F8DCC0], v19);
      return swift_willThrow();
    }
LABEL_5:
    unint64_t v12 = *(void *)(v8 + 32);
    swift_retain();
    sub_2523A7798(v12);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523ABBE8(v11, a2, a3, v13);
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  if (a3 != 3) {
    goto LABEL_5;
  }
  return result;
}

uint64_t sub_2523AE4B8(uint64_t result, uint64_t a2, char a3, unint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v9 = result;
  if (a3 == 10)
  {
    if (!(a2 | result))
    {
      int v14 = a6;
      uint64_t v15 = sub_2523C75D8();
      swift_allocError();
      uint64_t v17 = v16;
      *int v16 = MEMORY[0x263F8D5C8];
      sub_2523A7798(a4);
      if (v14 != 255)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s3TagO14CodingKeyProxyVN;
        *(void *)(inited + 64) = sub_2523A7384();
        *(void *)(inited + 32) = a5;
        *(unsigned char *)(inited + 40) = v14 & 1;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v15 - 8) + 104))(v17, *MEMORY[0x263F8DCC0], v15);
      return swift_willThrow();
    }
LABEL_5:
    unint64_t v10 = *(void *)(v6 + 32);
    swift_retain();
    sub_2523A7798(v10);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523ABBE8(v9, a2, a3, v11);
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  if (a3 != 3) {
    goto LABEL_5;
  }
  return result;
}

uint64_t sub_2523AE75C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, char *a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  v101 = a4;
  uint64_t v102 = a6;
  v105 = (uint64_t *)a5;
  LODWORD(v100) = a3;
  uint64_t v98 = a1;
  unint64_t v99 = a2;
  uint64_t v91 = a9;
  uint64_t v95 = *(void *)(a8 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](a1);
  v88 = (char *)v87 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v90 = (char *)v87 - v15;
  uint64_t v16 = sub_2523C7588();
  uint64_t v96 = *(void *)(v16 - 8);
  char v97 = (char *)v16;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)v87 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)v87 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)v87 - v24;
  MEMORY[0x270FA5388](v23);
  v92 = (char *)v87 - v26;
  uint64_t v27 = sub_2523C7588();
  uint64_t v28 = MEMORY[0x270FA5388](v27);
  uint64_t v30 = (char *)v87 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v34 = (char *)v87 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v101 != (char *)MEMORY[0x263F06F78])
  {
    uint64_t v35 = v102;
    uint64_t v89 = a11;
    v101 = (char *)a8;
    if (swift_conformsToProtocol2()) {
      uint64_t v36 = a7;
    }
    else {
      uint64_t v36 = 0;
    }
    if (v36)
    {
      uint64_t v103 = 0;
      unint64_t v104 = 0xE000000000000000;
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7B78();
      sub_2523C7488();
      swift_bridgeObjectRelease();
      sub_2523C7488();
      unint64_t v99 = v104;
      uint64_t v100 = v103;
      uint64_t v37 = (void *)sub_2523C75D8();
      swift_allocError();
      uint64_t v98 = v38;
      uint64_t v39 = v96;
      uint64_t v22 = v97;
      uint64_t v40 = *(void (**)(char *, uint64_t, char *))(v96 + 16);
      uint64_t v41 = v92;
      v40(v92, v35, v97);
      v40(v25, (uint64_t)v41, v22);
      uint64_t v42 = v95;
      uint64_t v43 = v101;
      if ((*(unsigned int (**)(char *, uint64_t, char *))(v95 + 48))(v25, 1, v101) == 1)
      {
        uint64_t v44 = *(void (**)(char *, char *))(v39 + 8);
        v44(v41, v22);
        v44(v25, v22);
        uint64_t v45 = v105;
        swift_retain();
LABEL_22:
        sub_2523A7798((unint64_t)v45);
        swift_release();
        uint64_t v78 = v98;
        sub_2523C75C8();
        (*(void (**)(uint64_t, void, void *))(*(v37 - 1) + 104))(v78, *MEMORY[0x263F8DCB8], v37);
        return swift_willThrow();
      }
      v66 = *(void (**)(char *, char *, void *))(v42 + 32);
      uint64_t v67 = v90;
      v66(v90, v25, v43);
      uint64_t v45 = (uint64_t *)swift_allocObject();
      uint64_t v68 = v89;
      v45[5] = (uint64_t)v43;
      v45[6] = v68;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v45 + 2);
      v66((char *)boxed_opaque_existential_1, v67, v43);
      (*(void (**)(char *, char *))(v39 + 8))(v92, v22);
      unint64_t v70 = (unint64_t)v105;
      v45[7] = (uint64_t)v105;
      if (v70 >> 62)
      {
        if (v70 >> 62 != 1)
        {
          uint64_t v77 = 1;
          goto LABEL_21;
        }
        int v71 = (uint64_t *)((v70 & 0x3FFFFFFFFFFFFFFFLL) + 32);
      }
      else
      {
        int v71 = (uint64_t *)(v70 + 64);
      }
      uint64_t v76 = *v71;
      swift_retain();
      uint64_t v77 = v76 + 1;
      if (!__OFADD__(v76, 1))
      {
LABEL_21:
        v45[8] = v77;
        goto LABEL_22;
      }
      __break(1u);
    }
    else
    {
      uint64_t v57 = v96;
      uint64_t v56 = v97;
      uint64_t v58 = *(void (**)(char *, uint64_t, char *))(v96 + 16);
      v58(v22, v35, v97);
      v58(v19, (uint64_t)v22, v56);
      uint64_t v59 = v95;
      uint64_t v37 = v101;
      int v60 = (*(uint64_t (**)(char *, uint64_t, char *))(v95 + 48))(v19, 1, v101);
      v87[1] = a7;
      if (v60 == 1)
      {
        uint64_t v61 = *(void (**)(char *, char *))(v57 + 8);
        v61(v22, v56);
        v61(v19, v56);
        unint64_t v62 = (unint64_t)v105;
        swift_retain();
        char v63 = v100;
        uint64_t v65 = v98;
        unint64_t v64 = v99;
        goto LABEL_28;
      }
      uint64_t v72 = *(void (**)(char *, char *, void *))(v59 + 32);
      uint64_t v43 = v88;
      v72(v88, v19, v37);
      uint64_t v45 = (uint64_t *)swift_allocObject();
      uint64_t v73 = v89;
      v45[5] = (uint64_t)v37;
      v45[6] = v73;
      uint64_t v74 = __swift_allocate_boxed_opaque_existential_1(v45 + 2);
      v72((char *)v74, v43, v37);
      (*(void (**)(char *, char *))(v57 + 8))(v22, v56);
      unint64_t v70 = (unint64_t)v105;
      v45[7] = (uint64_t)v105;
      if (v70 >> 62)
      {
        uint64_t v65 = v98;
        unint64_t v64 = v99;
        if (v70 >> 62 != 1)
        {
          char v63 = v100;
          uint64_t v80 = 1;
LABEL_27:
          v45[8] = v80;
          unint64_t v62 = (unint64_t)v45;
LABEL_28:
          unint64_t v81 = v93;
          uint64_t v22 = *(char **)(v93 + 32);
          uint64_t v37 = (void *)(v93 + 24);
          *(void *)(v93 + 32) = v62;
          unint64_t v70 = v81;
          swift_retain();
          swift_beginAccess();
          uint64_t v43 = *(char **)(v81 + 24);
          sub_2523A8570(v65, v64, v63);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(void *)(v70 + 24) = v43;
          if (isUniquelyReferenced_nonNull_native)
          {
LABEL_29:
            unint64_t v84 = *((void *)v43 + 2);
            unint64_t v83 = *((void *)v43 + 3);
            if (v84 >= v83 >> 1)
            {
              uint64_t v43 = (char *)sub_2523A7D14((void *)(v83 > 1), v84 + 1, 1, v43);
              *uint64_t v37 = v43;
            }
            *((void *)v43 + 2) = v84 + 1;
            v85 = &v43[24 * v84];
            uint64_t v86 = v99;
            *((void *)v85 + 4) = v98;
            *((void *)v85 + 5) = v86;
            v85[48] = v100;
            swift_endAccess();
            sub_2523B2690();
            *(void *)(v70 + 32) = v22;
            swift_retain();
            swift_release();
            sub_2523ACD38();
            swift_release();
            return swift_release();
          }
LABEL_35:
          uint64_t v43 = (char *)sub_2523A7D14(0, *((void *)v43 + 2) + 1, 1, v43);
          *uint64_t v37 = v43;
          goto LABEL_29;
        }
        v75 = (uint64_t *)((v70 & 0x3FFFFFFFFFFFFFFFLL) + 32);
        char v63 = v100;
LABEL_26:
        uint64_t v79 = *v75;
        swift_retain();
        uint64_t v80 = v79 + 1;
        if (__OFADD__(v79, 1))
        {
          __break(1u);
          goto LABEL_35;
        }
        goto LABEL_27;
      }
    }
    v75 = (uint64_t *)(v70 + 64);
    char v63 = v100;
    uint64_t v65 = v98;
    unint64_t v64 = v99;
    goto LABEL_26;
  }
  uint64_t v46 = v32;
  uint64_t v47 = v31;
  uint64_t v48 = v94;
  uint64_t result = sub_2523B85B0(v98, v99, v100, (unint64_t)v105, v102, a8, a11);
  if (!v48)
  {
    uint64_t v51 = result;
    unint64_t v52 = v50;
    uint64_t v103 = result;
    unint64_t v104 = v50;
    sub_2523A85C8(result, v50);
    sub_2523A85C8(v51, v52);
    int v53 = swift_dynamicCast();
    uint64_t v54 = *(void (**)(char *, void, uint64_t, uint64_t))(v46 + 56);
    if (v53)
    {
      v54(v30, 0, 1, a7);
      sub_2523A8688(v51, v52);
      v55 = *(void (**)(char *, char *, uint64_t))(v46 + 32);
      v55(v34, v30, a7);
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v55)(v91, v34, a7);
    }
    else
    {
      v54(v30, 1, 1, a7);
      (*(void (**)(char *, uint64_t))(v47 + 8))(v30, v27);
      uint64_t result = sub_2523C7668();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_2523AF130(uint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v11 = a1;
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      uint64_t v22 = sub_2523C75D8();
      swift_allocError();
      uint64_t v24 = v23;
      *uint64_t v23 = MEMORY[0x263F8E498];
      if (a8 == -1)
      {
        sub_2523A7798(a4);
      }
      else
      {
        sub_2523A82A4(a5, a6, a7, a8);
        sub_2523A7798(a4);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s10_CodingKeyON;
        *(void *)(inited + 64) = sub_2523A797C();
        uint64_t v26 = swift_allocObject();
        *(void *)(inited + 32) = v26;
        *(void *)(v26 + 16) = a5;
        *(void *)(v26 + 24) = a6;
        *(void *)(v26 + 32) = a7;
        *(unsigned char *)(v26 + 40) = a8;
        sub_2523A7E38(inited);
      }
      uint64_t v11 = (uint64_t)v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70) + 48);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x263F8DCC0], v22);
      goto LABEL_8;
    }
  }
  else if (a3 == 1)
  {
    if (a1 == (char)a1) {
      return v11;
    }
    unint64_t v12 = *(void *)(v8 + 32);
    swift_retain();
    sub_2523A7798(v12);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523ACAB0(v13);
    goto LABEL_7;
  }
  unint64_t v14 = *(void *)(v8 + 32);
  swift_retain();
  sub_2523A7798(v14);
  swift_release();
  sub_2523C75D8();
  swift_allocError();
  sub_2523ABE98(v11, a2, a3, v15);
LABEL_7:
  swift_bridgeObjectRelease();
LABEL_8:
  swift_willThrow();
  return v11;
}

uint64_t sub_2523AF488(uint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v11 = a1;
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      uint64_t v22 = sub_2523C75D8();
      swift_allocError();
      uint64_t v24 = v23;
      *uint64_t v23 = MEMORY[0x263F8E4F0];
      if (a8 == -1)
      {
        sub_2523A7798(a4);
      }
      else
      {
        sub_2523A82A4(a5, a6, a7, a8);
        sub_2523A7798(a4);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s10_CodingKeyON;
        *(void *)(inited + 64) = sub_2523A797C();
        uint64_t v26 = swift_allocObject();
        *(void *)(inited + 32) = v26;
        *(void *)(v26 + 16) = a5;
        *(void *)(v26 + 24) = a6;
        *(void *)(v26 + 32) = a7;
        *(unsigned char *)(v26 + 40) = a8;
        sub_2523A7E38(inited);
      }
      uint64_t v11 = (uint64_t)v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70) + 48);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x263F8DCC0], v22);
      goto LABEL_8;
    }
  }
  else if (a3 == 1)
  {
    if (a1 == (__int16)a1) {
      return v11;
    }
    unint64_t v12 = *(void *)(v8 + 32);
    swift_retain();
    sub_2523A7798(v12);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523ACAB0(v13);
    goto LABEL_7;
  }
  unint64_t v14 = *(void *)(v8 + 32);
  swift_retain();
  sub_2523A7798(v14);
  swift_release();
  sub_2523C75D8();
  swift_allocError();
  sub_2523ABFF0(v11, a2, a3, v15);
LABEL_7:
  swift_bridgeObjectRelease();
LABEL_8:
  swift_willThrow();
  return v11;
}

uint64_t sub_2523AF7E8(uint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v11 = a1;
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      uint64_t v22 = sub_2523C75D8();
      swift_allocError();
      uint64_t v24 = v23;
      *uint64_t v23 = MEMORY[0x263F8E548];
      if (a8 == -1)
      {
        sub_2523A7798(a4);
      }
      else
      {
        sub_2523A82A4(a5, a6, a7, a8);
        sub_2523A7798(a4);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s10_CodingKeyON;
        *(void *)(inited + 64) = sub_2523A797C();
        uint64_t v26 = swift_allocObject();
        *(void *)(inited + 32) = v26;
        *(void *)(v26 + 16) = a5;
        *(void *)(v26 + 24) = a6;
        *(void *)(v26 + 32) = a7;
        *(unsigned char *)(v26 + 40) = a8;
        sub_2523A7E38(inited);
      }
      uint64_t v11 = (uint64_t)v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70) + 48);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x263F8DCC0], v22);
      goto LABEL_8;
    }
  }
  else if (a3 == 1)
  {
    if (a1 == (int)a1) {
      return v11;
    }
    unint64_t v12 = *(void *)(v8 + 32);
    swift_retain();
    sub_2523A7798(v12);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523ACAB0(v13);
    goto LABEL_7;
  }
  unint64_t v14 = *(void *)(v8 + 32);
  swift_retain();
  sub_2523A7798(v14);
  swift_release();
  sub_2523C75D8();
  swift_allocError();
  sub_2523AC148(v11, a2, a3, v15);
LABEL_7:
  swift_bridgeObjectRelease();
LABEL_8:
  swift_willThrow();
  return v11;
}

uint64_t sub_2523AFB48(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, void (*a10)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      uint64_t v26 = sub_2523C75D8();
      swift_allocError();
      uint64_t v23 = v22;
      *uint64_t v22 = a9;
      if (a8 == -1)
      {
        sub_2523A7798(a4);
      }
      else
      {
        sub_2523A82A4(a5, a6, a7, a8);
        sub_2523A7798(a4);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s10_CodingKeyON;
        *(void *)(inited + 64) = sub_2523A797C();
        uint64_t v25 = swift_allocObject();
        *(void *)(inited + 32) = v25;
        *(void *)(v25 + 16) = a5;
        *(void *)(v25 + 24) = a6;
        *(void *)(v25 + 32) = a7;
        *(unsigned char *)(v25 + 40) = a8;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void))(*(void *)(v26 - 8) + 104))(v23, *MEMORY[0x263F8DCC0]);
      goto LABEL_6;
    }
LABEL_5:
    unint64_t v14 = *(void *)(v10 + 32);
    swift_retain();
    uint64_t v15 = sub_2523A7798(v14);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    a10(v15, a1, a2, a3);
    swift_bridgeObjectRelease();
LABEL_6:
    swift_willThrow();
    return a1;
  }
  if (a3 != 1) {
    goto LABEL_5;
  }
  return a1;
}

uint64_t sub_2523AFE3C(uint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v9 = a1;
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      int v17 = a6;
      uint64_t v18 = sub_2523C75D8();
      swift_allocError();
      uint64_t v20 = v19;
      *uint64_t v19 = MEMORY[0x263F8E498];
      sub_2523A7798(a4);
      if (v17 != 255)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s3TagO14CodingKeyProxyVN;
        *(void *)(inited + 64) = sub_2523A7384();
        *(void *)(inited + 32) = a5;
        *(unsigned char *)(inited + 40) = v17 & 1;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      uint64_t v9 = 0xD000000000000019;
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCC0], v18);
      goto LABEL_8;
    }
  }
  else if (a3 == 1)
  {
    if (a1 == (char)a1) {
      return v9;
    }
    unint64_t v10 = *(void *)(v6 + 32);
    swift_retain();
    sub_2523A7798(v10);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523ACAB0(v11);
    goto LABEL_7;
  }
  unint64_t v12 = *(void *)(v6 + 32);
  swift_retain();
  sub_2523A7798(v12);
  swift_release();
  sub_2523C75D8();
  swift_allocError();
  sub_2523ABE98(v9, a2, a3, v13);
LABEL_7:
  swift_bridgeObjectRelease();
LABEL_8:
  swift_willThrow();
  return v9;
}

uint64_t sub_2523B0150(uint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v9 = a1;
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      int v17 = a6;
      uint64_t v18 = sub_2523C75D8();
      swift_allocError();
      uint64_t v20 = v19;
      *uint64_t v19 = MEMORY[0x263F8E4F0];
      sub_2523A7798(a4);
      if (v17 != 255)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s3TagO14CodingKeyProxyVN;
        *(void *)(inited + 64) = sub_2523A7384();
        *(void *)(inited + 32) = a5;
        *(unsigned char *)(inited + 40) = v17 & 1;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      uint64_t v9 = 0xD000000000000019;
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCC0], v18);
      goto LABEL_8;
    }
  }
  else if (a3 == 1)
  {
    if (a1 == (__int16)a1) {
      return v9;
    }
    unint64_t v10 = *(void *)(v6 + 32);
    swift_retain();
    sub_2523A7798(v10);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523ACAB0(v11);
    goto LABEL_7;
  }
  unint64_t v12 = *(void *)(v6 + 32);
  swift_retain();
  sub_2523A7798(v12);
  swift_release();
  sub_2523C75D8();
  swift_allocError();
  sub_2523ABFF0(v9, a2, a3, v13);
LABEL_7:
  swift_bridgeObjectRelease();
LABEL_8:
  swift_willThrow();
  return v9;
}

uint64_t sub_2523B046C(uint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v9 = a1;
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      int v17 = a6;
      uint64_t v18 = sub_2523C75D8();
      swift_allocError();
      uint64_t v20 = v19;
      *uint64_t v19 = MEMORY[0x263F8E548];
      sub_2523A7798(a4);
      if (v17 != 255)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s3TagO14CodingKeyProxyVN;
        *(void *)(inited + 64) = sub_2523A7384();
        *(void *)(inited + 32) = a5;
        *(unsigned char *)(inited + 40) = v17 & 1;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      uint64_t v9 = 0xD000000000000019;
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCC0], v18);
      goto LABEL_8;
    }
  }
  else if (a3 == 1)
  {
    if (a1 == (int)a1) {
      return v9;
    }
    unint64_t v10 = *(void *)(v6 + 32);
    swift_retain();
    sub_2523A7798(v10);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523ACAB0(v11);
    goto LABEL_7;
  }
  unint64_t v12 = *(void *)(v6 + 32);
  swift_retain();
  sub_2523A7798(v12);
  swift_release();
  sub_2523C75D8();
  swift_allocError();
  sub_2523AC148(v9, a2, a3, v13);
LABEL_7:
  swift_bridgeObjectRelease();
LABEL_8:
  swift_willThrow();
  return v9;
}

uint64_t sub_2523B0788(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      int v19 = a6;
      uint64_t v20 = sub_2523C75D8();
      swift_allocError();
      uint64_t v22 = v21;
      *uint64_t v21 = a7;
      sub_2523A7798(a4);
      if (v19 != 255)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s3TagO14CodingKeyProxyVN;
        *(void *)(inited + 64) = sub_2523A7384();
        *(void *)(inited + 32) = a5;
        *(unsigned char *)(inited + 40) = v19 & 1;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCC0], v20);
      goto LABEL_6;
    }
LABEL_5:
    unint64_t v13 = *(void *)(v8 + 32);
    swift_retain();
    uint64_t v14 = sub_2523A7798(v13);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    a8(v14, a1, a2, a3);
    swift_bridgeObjectRelease();
LABEL_6:
    swift_willThrow();
    return a1;
  }
  if (a3 != 1) {
    goto LABEL_5;
  }
  return a1;
}

uint64_t sub_2523B0A3C(unint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v11 = a1;
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      uint64_t v22 = sub_2523C75D8();
      swift_allocError();
      uint64_t v24 = v23;
      *uint64_t v23 = MEMORY[0x263F8E778];
      if (a8 == -1)
      {
        sub_2523A7798(a4);
      }
      else
      {
        sub_2523A82A4(a5, a6, a7, a8);
        sub_2523A7798(a4);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s10_CodingKeyON;
        *(void *)(inited + 64) = sub_2523A797C();
        uint64_t v26 = swift_allocObject();
        *(void *)(inited + 32) = v26;
        *(void *)(v26 + 16) = a5;
        *(void *)(v26 + 24) = a6;
        *(void *)(v26 + 32) = a7;
        *(unsigned char *)(v26 + 40) = a8;
        sub_2523A7E38(inited);
      }
      uint64_t v11 = (uint64_t)v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70) + 48);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x263F8DCC0], v22);
      goto LABEL_8;
    }
  }
  else if (a3 == 2)
  {
    if (a1 <= 0xFF) {
      return v11;
    }
    unint64_t v12 = *(void *)(v8 + 32);
    swift_retain();
    sub_2523A7798(v12);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523ACAB0(v13);
    goto LABEL_7;
  }
  unint64_t v14 = *(void *)(v8 + 32);
  swift_retain();
  sub_2523A7798(v14);
  swift_release();
  sub_2523C75D8();
  swift_allocError();
  sub_2523AC550(v11, a2, a3, v15);
LABEL_7:
  swift_bridgeObjectRelease();
LABEL_8:
  swift_willThrow();
  return v11;
}

uint64_t sub_2523B0D9C(unint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v11 = a1;
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      uint64_t v22 = sub_2523C75D8();
      swift_allocError();
      uint64_t v24 = v23;
      *uint64_t v23 = MEMORY[0x263F8E888];
      if (a8 == -1)
      {
        sub_2523A7798(a4);
      }
      else
      {
        sub_2523A82A4(a5, a6, a7, a8);
        sub_2523A7798(a4);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s10_CodingKeyON;
        *(void *)(inited + 64) = sub_2523A797C();
        uint64_t v26 = swift_allocObject();
        *(void *)(inited + 32) = v26;
        *(void *)(v26 + 16) = a5;
        *(void *)(v26 + 24) = a6;
        *(void *)(v26 + 32) = a7;
        *(unsigned char *)(v26 + 40) = a8;
        sub_2523A7E38(inited);
      }
      uint64_t v11 = (uint64_t)v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70) + 48);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x263F8DCC0], v22);
      goto LABEL_8;
    }
  }
  else if (a3 == 2)
  {
    if (!(a1 >> 16)) {
      return v11;
    }
    unint64_t v12 = *(void *)(v8 + 32);
    swift_retain();
    sub_2523A7798(v12);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523ACAB0(v13);
    goto LABEL_7;
  }
  unint64_t v14 = *(void *)(v8 + 32);
  swift_retain();
  sub_2523A7798(v14);
  swift_release();
  sub_2523C75D8();
  swift_allocError();
  sub_2523AC6A8(v11, a2, a3, v15);
LABEL_7:
  swift_bridgeObjectRelease();
LABEL_8:
  swift_willThrow();
  return v11;
}

uint64_t sub_2523B10FC(unint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v11 = a1;
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      uint64_t v22 = sub_2523C75D8();
      swift_allocError();
      uint64_t v24 = v23;
      *uint64_t v23 = MEMORY[0x263F8E8F8];
      if (a8 == -1)
      {
        sub_2523A7798(a4);
      }
      else
      {
        sub_2523A82A4(a5, a6, a7, a8);
        sub_2523A7798(a4);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s10_CodingKeyON;
        *(void *)(inited + 64) = sub_2523A797C();
        uint64_t v26 = swift_allocObject();
        *(void *)(inited + 32) = v26;
        *(void *)(v26 + 16) = a5;
        *(void *)(v26 + 24) = a6;
        *(void *)(v26 + 32) = a7;
        *(unsigned char *)(v26 + 40) = a8;
        sub_2523A7E38(inited);
      }
      uint64_t v11 = (uint64_t)v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70) + 48);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x263F8DCC0], v22);
      goto LABEL_8;
    }
  }
  else if (a3 == 2)
  {
    if (!HIDWORD(a1)) {
      return v11;
    }
    unint64_t v12 = *(void *)(v8 + 32);
    swift_retain();
    sub_2523A7798(v12);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523ACAB0(v13);
    goto LABEL_7;
  }
  unint64_t v14 = *(void *)(v8 + 32);
  swift_retain();
  sub_2523A7798(v14);
  swift_release();
  sub_2523C75D8();
  swift_allocError();
  sub_2523AC800(v11, a2, a3, v15);
LABEL_7:
  swift_bridgeObjectRelease();
LABEL_8:
  swift_willThrow();
  return v11;
}

uint64_t sub_2523B145C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, void (*a10)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      uint64_t v26 = sub_2523C75D8();
      swift_allocError();
      uint64_t v23 = v22;
      *uint64_t v22 = a9;
      if (a8 == -1)
      {
        sub_2523A7798(a4);
      }
      else
      {
        sub_2523A82A4(a5, a6, a7, a8);
        sub_2523A7798(a4);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s10_CodingKeyON;
        *(void *)(inited + 64) = sub_2523A797C();
        uint64_t v25 = swift_allocObject();
        *(void *)(inited + 32) = v25;
        *(void *)(v25 + 16) = a5;
        *(void *)(v25 + 24) = a6;
        *(void *)(v25 + 32) = a7;
        *(unsigned char *)(v25 + 40) = a8;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void))(*(void *)(v26 - 8) + 104))(v23, *MEMORY[0x263F8DCC0]);
      goto LABEL_6;
    }
LABEL_5:
    unint64_t v14 = *(void *)(v10 + 32);
    swift_retain();
    uint64_t v15 = sub_2523A7798(v14);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    a10(v15, a1, a2, a3);
    swift_bridgeObjectRelease();
LABEL_6:
    swift_willThrow();
    return a1;
  }
  if (a3 != 2) {
    goto LABEL_5;
  }
  return a1;
}

uint64_t sub_2523B1750(unint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v9 = a1;
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      int v17 = a6;
      uint64_t v18 = sub_2523C75D8();
      swift_allocError();
      uint64_t v20 = v19;
      *int v19 = MEMORY[0x263F8E778];
      sub_2523A7798(a4);
      if (v17 != 255)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s3TagO14CodingKeyProxyVN;
        *(void *)(inited + 64) = sub_2523A7384();
        *(void *)(inited + 32) = a5;
        *(unsigned char *)(inited + 40) = v17 & 1;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      uint64_t v9 = 0xD000000000000019;
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCC0], v18);
      goto LABEL_8;
    }
  }
  else if (a3 == 2)
  {
    if (a1 <= 0xFF) {
      return v9;
    }
    unint64_t v10 = *(void *)(v6 + 32);
    swift_retain();
    sub_2523A7798(v10);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523ACAB0(v11);
    goto LABEL_7;
  }
  unint64_t v12 = *(void *)(v6 + 32);
  swift_retain();
  sub_2523A7798(v12);
  swift_release();
  sub_2523C75D8();
  swift_allocError();
  sub_2523AC550(v9, a2, a3, v13);
LABEL_7:
  swift_bridgeObjectRelease();
LABEL_8:
  swift_willThrow();
  return v9;
}

uint64_t sub_2523B1A6C(unint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v9 = a1;
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      int v17 = a6;
      uint64_t v18 = sub_2523C75D8();
      swift_allocError();
      uint64_t v20 = v19;
      *int v19 = MEMORY[0x263F8E888];
      sub_2523A7798(a4);
      if (v17 != 255)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s3TagO14CodingKeyProxyVN;
        *(void *)(inited + 64) = sub_2523A7384();
        *(void *)(inited + 32) = a5;
        *(unsigned char *)(inited + 40) = v17 & 1;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      uint64_t v9 = 0xD000000000000019;
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCC0], v18);
      goto LABEL_8;
    }
  }
  else if (a3 == 2)
  {
    if (!(a1 >> 16)) {
      return v9;
    }
    unint64_t v10 = *(void *)(v6 + 32);
    swift_retain();
    sub_2523A7798(v10);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523ACAB0(v11);
    goto LABEL_7;
  }
  unint64_t v12 = *(void *)(v6 + 32);
  swift_retain();
  sub_2523A7798(v12);
  swift_release();
  sub_2523C75D8();
  swift_allocError();
  sub_2523AC6A8(v9, a2, a3, v13);
LABEL_7:
  swift_bridgeObjectRelease();
LABEL_8:
  swift_willThrow();
  return v9;
}

uint64_t sub_2523B1D88(unint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v9 = a1;
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      int v17 = a6;
      uint64_t v18 = sub_2523C75D8();
      swift_allocError();
      uint64_t v20 = v19;
      *int v19 = MEMORY[0x263F8E8F8];
      sub_2523A7798(a4);
      if (v17 != 255)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s3TagO14CodingKeyProxyVN;
        *(void *)(inited + 64) = sub_2523A7384();
        *(void *)(inited + 32) = a5;
        *(unsigned char *)(inited + 40) = v17 & 1;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      uint64_t v9 = 0xD000000000000019;
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCC0], v18);
      goto LABEL_8;
    }
  }
  else if (a3 == 2)
  {
    if (!HIDWORD(a1)) {
      return v9;
    }
    unint64_t v10 = *(void *)(v6 + 32);
    swift_retain();
    sub_2523A7798(v10);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    sub_2523ACAB0(v11);
    goto LABEL_7;
  }
  unint64_t v12 = *(void *)(v6 + 32);
  swift_retain();
  sub_2523A7798(v12);
  swift_release();
  sub_2523C75D8();
  swift_allocError();
  sub_2523AC800(v9, a2, a3, v13);
LABEL_7:
  swift_bridgeObjectRelease();
LABEL_8:
  swift_willThrow();
  return v9;
}

uint64_t sub_2523B20A4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      int v19 = a6;
      uint64_t v20 = sub_2523C75D8();
      swift_allocError();
      uint64_t v22 = v21;
      *uint64_t v21 = a7;
      sub_2523A7798(a4);
      if (v19 != 255)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s3TagO14CodingKeyProxyVN;
        *(void *)(inited + 64) = sub_2523A7384();
        *(void *)(inited + 32) = a5;
        *(unsigned char *)(inited + 40) = v19 & 1;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCC0], v20);
      goto LABEL_6;
    }
LABEL_5:
    unint64_t v13 = *(void *)(v8 + 32);
    swift_retain();
    uint64_t v14 = sub_2523A7798(v13);
    swift_release();
    sub_2523C75D8();
    swift_allocError();
    a8(v14, a1, a2, a3);
    swift_bridgeObjectRelease();
LABEL_6:
    swift_willThrow();
    return a1;
  }
  if (a3 != 2) {
    goto LABEL_5;
  }
  return a1;
}

uint64_t sub_2523B2358()
{
  unint64_t v1 = *(void *)(*(void *)v0 + 32);
  swift_retain();
  uint64_t v2 = sub_2523A7798(v1);
  swift_release();
  return v2;
}

uint64_t sub_2523B23A0()
{
  return sub_2523AD600() & 1;
}

uint64_t sub_2523B23C8()
{
  return sub_2523B8A5C() & 1;
}

uint64_t sub_2523B23F0()
{
  return sub_2523B8E2C();
}

uint64_t sub_2523B2414()
{
  return sub_2523B91CC();
}

uint64_t sub_2523B2438()
{
  return sub_2523B92B0();
}

uint64_t sub_2523B245C()
{
  return sub_2523B9394();
}

uint64_t sub_2523B2480()
{
  return sub_2523B96C8((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, void, void, void, uint64_t))sub_2523AF130);
}

uint64_t sub_2523B24B8()
{
  return sub_2523B97B4((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, void, void, void, uint64_t))sub_2523AF488);
}

uint64_t sub_2523B24F0()
{
  return sub_2523B98A0((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, void, void, void, uint64_t))sub_2523AF7E8);
}

uint64_t sub_2523B2528()
{
  return sub_2523B94A4();
}

uint64_t sub_2523B254C()
{
  return sub_2523C7908();
}

uint64_t sub_2523B2564()
{
  return sub_2523B95B8();
}

uint64_t sub_2523B2588()
{
  return sub_2523B96C8((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, void, void, void, uint64_t))sub_2523B0A3C);
}

uint64_t sub_2523B25C0()
{
  return sub_2523B97B4((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, void, void, void, uint64_t))sub_2523B0D9C);
}

uint64_t sub_2523B25F8()
{
  return sub_2523B98A0((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, void, void, void, uint64_t))sub_2523B10FC);
}

uint64_t sub_2523B2630()
{
  return sub_2523B998C();
}

uint64_t sub_2523B2654()
{
  return sub_2523C7918();
}

uint64_t sub_2523B266C@<X0>(char *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_2523ACC20(a1, a2, a3);
}

uint64_t sub_2523B2690()
{
  return sub_2523C7538();
}

void sub_2523B2748()
{
  uint64_t v1 = *(void *)(v0 + 32);
  unint64_t v2 = *(void *)(v0 + 40);
  int v3 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v4 = v1;
  unint64_t v5 = v2;
  int v6 = v3;
  if (v3 != 255) {
    goto LABEL_5;
  }
  uint64_t v7 = *(void *)(v0 + 16);
  uint64_t v8 = *(void *)(v0 + 24);
  if (v8 < *(void *)(v7 + 16))
  {
    if (v8 < 0)
    {
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    uint64_t v9 = v7 + 24 * v8;
    uint64_t v4 = *(void *)(v9 + 32);
    unint64_t v5 = *(void *)(v9 + 40);
    int v6 = *(unsigned __int8 *)(v9 + 48);
    *(void *)(v0 + 32) = v4;
    *(void *)(v0 + 40) = v5;
    *(unsigned char *)(v0 + 48) = v6;
    sub_2523A8570(v4, v5, v6);
    sub_2523A8570(v4, v5, v6);
LABEL_5:
    sub_2523B9B30(v1, v2, v3);
    if (v6 != 10 || (v5 | v4) != 0)
    {
      sub_2523A8630(v4, v5, v6);
      return;
    }
    sub_2523B9B1C(0, 0, 10);
    uint64_t v11 = *(void *)(v0 + 24);
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (!v12)
    {
      *(void *)(v0 + 24) = v13;
      *(void *)(v0 + 32) = 0;
      *(void *)(v0 + 40) = 0;
      *(unsigned char *)(v0 + 48) = -1;
      return;
    }
    __break(1u);
    goto LABEL_20;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
  uint64_t v14 = MEMORY[0x263F8E628];
  uint64_t v15 = sub_2523C75D8();
  swift_allocError();
  int v17 = v16;
  *uint64_t v16 = v14;
  unint64_t v18 = *(void *)(v0 + 8);
  uint64_t v19 = *(void *)(v0 + 24);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  *(void *)(v20 + 24) = v18;
  if (v18 >> 62)
  {
    uint64_t v21 = 0;
    if (v18 >> 62 != 1) {
      goto LABEL_17;
    }
    uint64_t v22 = (uint64_t *)((v18 & 0x3FFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    uint64_t v22 = (uint64_t *)(v18 + 64);
  }
  uint64_t v21 = *v22;
  swift_retain();
LABEL_17:
  if (!__OFADD__(v21, 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
    *(void *)(v20 + 32) = v21 + 1;
    sub_2523A7798(v20 | 0x4000000000000000);
    swift_release();
    sub_2523C75C8();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v15 - 8) + 104))(v17, *MEMORY[0x263F8DCC0], v15);
    swift_willThrow();
    return;
  }
LABEL_21:
  __break(1u);
}

uint64_t sub_2523B29D8@<X0>(uint64_t result@<X0>, ValueMetadata *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = v4;
  uint64_t v7 = *(void *)(v4 + 32);
  unint64_t v8 = *(void *)(v4 + 40);
  int v9 = *(unsigned __int8 *)(v4 + 48);
  uint64_t v10 = v7;
  unint64_t v11 = v8;
  int v12 = v9;
  uint64_t v39 = a4;
  uint64_t v36 = (char *)result;
  if (v9 == 255)
  {
    uint64_t v13 = a2;
    uint64_t v15 = *(void *)(v4 + 16);
    uint64_t v14 = *(void *)(v4 + 24);
    if (v14 < *(void *)(v15 + 16))
    {
      uint64_t v32 = a3;
      if (v14 < 0)
      {
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      uint64_t v16 = v15 + 24 * v14;
      uint64_t v10 = *(void *)(v16 + 32);
      unint64_t v11 = *(void *)(v16 + 40);
      int v12 = *(unsigned __int8 *)(v16 + 48);
      *(void *)(v4 + 32) = v10;
      *(void *)(v4 + 40) = v11;
      *(unsigned char *)(v4 + 48) = v12;
      sub_2523A8570(v10, v11, v12);
      sub_2523A8570(v10, v11, v12);
      a2 = v13;
      a3 = v32;
      goto LABEL_5;
    }
    uint64_t v23 = result;
    if (a2 != &_s12ValueDecoderV16UnkeyedContainerVN) {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
    }
    uint64_t v24 = sub_2523C75D8();
    swift_allocError();
    uint64_t v26 = v25;
    *uint64_t v25 = v23;
    unint64_t v27 = *(void *)(v4 + 8);
    uint64_t v28 = *(void *)(v6 + 24);
    uint64_t result = swift_allocObject();
    uint64_t v29 = result;
    *(void *)(result + 16) = v28;
    *(void *)(result + 24) = v27;
    if (v27 >> 62)
    {
      uint64_t v30 = 0;
      if (v27 >> 62 != 1)
      {
LABEL_15:
        if (__OFADD__(v30, 1))
        {
LABEL_20:
          __break(1u);
          return result;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
        *(void *)(v29 + 32) = v30 + 1;
        swift_retain();
        sub_2523A7798(v29 | 0x4000000000000000);
        swift_release();
        sub_2523C75C8();
        (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v24 - 8) + 104))(v26, *MEMORY[0x263F8DCC0], v24);
        swift_willThrow();
        return swift_release();
      }
      uint64_t v31 = (uint64_t *)((v27 & 0x3FFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      uint64_t v31 = (uint64_t *)(v27 + 64);
    }
    uint64_t v30 = *v31;
    uint64_t result = swift_retain();
    goto LABEL_15;
  }
LABEL_5:
  uint64_t v34 = (uint64_t)a2;
  unint64_t v35 = *(void *)(v4 + 8);
  uint64_t v17 = *(void *)(v4 + 24);
  v37[1] = 0;
  v37[2] = 0;
  uint64_t v33 = v17;
  v37[0] = v17;
  char v38 = 2;
  int v18 = v12;
  unint64_t v19 = v11;
  uint64_t v20 = v10;
  uint64_t v21 = a3;
  swift_retain();
  sub_2523B9B30(v7, v8, v9);
  unint64_t v22 = sub_2523A797C();
  sub_2523AE75C(v20, v19, v18, v36, v35, (uint64_t)v37, v34, (uint64_t)&_s10_CodingKeyON, v39, v21, v22);
  swift_release();
  uint64_t result = sub_2523A8630(v20, v19, v18);
  if (!v5)
  {
    uint64_t result = sub_2523B9B1C(v20, v19, v18);
    if (!__OFADD__(v33, 1))
    {
      *(void *)(v4 + 24) = v33 + 1;
      *(void *)(v4 + 32) = 0;
      *(void *)(v4 + 40) = 0;
      *(unsigned char *)(v4 + 48) = -1;
      return result;
    }
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

uint64_t sub_2523B2D3C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  uint64_t result = sub_2523C76C8();
  uint64_t v4 = v0[4];
  unint64_t v5 = v0[5];
  char v38 = v0 + 4;
  uint64_t v7 = v4;
  unint64_t v41 = v5;
  unsigned __int8 v8 = *((unsigned char *)v0 + 48);
  char v6 = v8;
  if (v8 == 255)
  {
    uint64_t v9 = v1[2];
    uint64_t v10 = v1[3];
    if (v10 >= *(void *)(v9 + 16)) {
      goto LABEL_20;
    }
    if (v10 < 0)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    uint64_t v11 = v9 + 24 * v10;
    uint64_t v7 = *(void *)(v11 + 32);
    unint64_t v12 = *(void *)(v11 + 40);
    char v13 = *(unsigned char *)(v11 + 48);
    v1[4] = v7;
    v1[5] = v12;
    *((unsigned char *)v1 + 48) = v13;
    sub_2523A8570(v7, v12, v13);
    unint64_t v41 = v12;
    unint64_t v14 = v12;
    unsigned __int8 v8 = v13;
    sub_2523A8570(v7, v14, v13);
  }
  char v40 = v8;
  unint64_t v15 = v1[1];
  uint64_t v16 = v1[3];
  uint64_t v17 = swift_allocObject();
  uint64_t v37 = v16;
  *(void *)(v17 + 16) = v16;
  *(void *)(v17 + 24) = v15;
  if (v15 >> 62)
  {
    if (v15 >> 62 != 1)
    {
      uint64_t v20 = 1;
      goto LABEL_10;
    }
    int v18 = (uint64_t *)((v15 & 0x3FFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    int v18 = (uint64_t *)(v15 + 64);
  }
  uint64_t v19 = *v18;
  uint64_t result = swift_retain_n();
  uint64_t v20 = v19 + 1;
  if (!__OFADD__(v19, 1))
  {
LABEL_10:
    *(void *)(v17 + 32) = v20;
    swift_retain();
    sub_2523B9B30(v4, v5, v6);
    swift_release();
    uint64_t v21 = *(void *)(v2 + 32);
    *(void *)(v2 + 32) = v17 | 0x4000000000000000;
    swift_retain();
    swift_beginAccess();
    unint64_t v22 = *(void **)(v2 + 24);
    sub_2523A8570(v7, v41, v40);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v2 + 24) = v22;
    uint64_t v24 = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v22 = sub_2523A7D14(0, v22[2] + 1, 1, v22);
      *(void *)(v2 + 24) = v22;
    }
    unint64_t v26 = v22[2];
    unint64_t v25 = v22[3];
    if (v26 >= v25 >> 1)
    {
      unint64_t v22 = sub_2523A7D14((void *)(v25 > 1), v26 + 1, 1, v22);
      *(void *)(v2 + 24) = v22;
    }
    v22[2] = v26 + 1;
    unint64_t v27 = &v22[3 * v26];
    v27[4] = v24;
    v27[5] = v41;
    *((unsigned char *)v27 + 48) = v40;
    swift_endAccess();
    swift_retain();
    sub_2523ACF10();
    swift_release();
    if (v39)
    {
      *(void *)(v2 + 32) = v21;
      swift_retain();
      swift_release();
      sub_2523ACD38();
      swift_release();
      swift_release();
      sub_2523A8630(v24, v41, v40);
      return swift_release();
    }
    *(void *)(v2 + 32) = v21;
    swift_retain();
    swift_release();
    sub_2523ACD38();
    swift_release();
    swift_release();
    sub_2523A8630(v24, v41, v40);
    swift_release();
    uint64_t result = sub_2523B9B1C(v24, v41, v40);
    if (!__OFADD__(v37, 1))
    {
      v1[3] = v37 + 1;
      *char v38 = 0;
      v38[1] = 0;
      *((unsigned char *)v1 + 48) = -1;
      return result;
    }
    __break(1u);
    goto LABEL_29;
  }
  __break(1u);
LABEL_20:
  uint64_t v28 = result;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
  uint64_t v29 = sub_2523C75D8();
  swift_allocError();
  uint64_t v31 = v30;
  *uint64_t v30 = v28;
  unint64_t v32 = v1[1];
  uint64_t v33 = v1[3];
  uint64_t result = swift_allocObject();
  uint64_t v34 = result;
  *(void *)(result + 16) = v33;
  *(void *)(result + 24) = v32;
  if (v32 >> 62)
  {
    uint64_t v35 = 0;
    if (v32 >> 62 != 1) {
      goto LABEL_25;
    }
    uint64_t v36 = (uint64_t *)((v32 & 0x3FFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    uint64_t v36 = (uint64_t *)(v32 + 64);
  }
  uint64_t v35 = *v36;
  uint64_t result = swift_retain();
LABEL_25:
  if (!__OFADD__(v35, 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
    *(void *)(v34 + 32) = v35 + 1;
    swift_retain();
    sub_2523A7798(v34 | 0x4000000000000000);
    swift_release();
    sub_2523C75C8();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v29 - 8) + 104))(v31, *MEMORY[0x263F8DCC0], v29);
    swift_willThrow();
    return swift_release();
  }
LABEL_30:
  __break(1u);
  return result;
}

void sub_2523B3214(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  uint64_t v4 = v2[4];
  unint64_t v5 = v2[5];
  int v6 = *((unsigned __int8 *)v2 + 48);
  uint64_t v7 = v4;
  unint64_t v39 = v5;
  char v38 = *((unsigned char *)v2 + 48);
  if (v6 == 255)
  {
    uint64_t v8 = v2[2];
    uint64_t v9 = v2[3];
    if (v9 >= *(void *)(v8 + 16)) {
      goto LABEL_20;
    }
    if (v9 < 0)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    uint64_t v10 = v8 + 24 * v9;
    uint64_t v7 = *(void *)(v10 + 32);
    unint64_t v11 = *(void *)(v10 + 40);
    char v12 = *(unsigned char *)(v10 + 48);
    v2[4] = v7;
    v2[5] = v11;
    *((unsigned char *)v2 + 48) = v12;
    sub_2523A8570(v7, v11, v12);
    unint64_t v39 = v11;
    char v38 = v12;
    sub_2523A8570(v7, v11, v12);
  }
  uint64_t v37 = v7;
  unint64_t v13 = v2[1];
  uint64_t v14 = v2[3];
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v13;
  if (v13 >> 62)
  {
    if (v13 >> 62 != 1)
    {
      uint64_t v18 = 1;
      goto LABEL_10;
    }
    uint64_t v16 = (uint64_t *)((v13 & 0x3FFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    uint64_t v16 = (uint64_t *)(v13 + 64);
  }
  uint64_t v17 = *v16;
  swift_retain_n();
  uint64_t v18 = v17 + 1;
  if (!__OFADD__(v17, 1))
  {
LABEL_10:
    uint64_t v34 = v14;
    *(void *)(v15 + 32) = v18;
    swift_retain();
    sub_2523B9B30(v4, v5, v6);
    swift_release();
    uint64_t v19 = *(void *)(v3 + 32);
    *(void *)(v3 + 32) = v15 | 0x4000000000000000;
    uint64_t v20 = (void *)(v3 + 24);
    swift_retain();
    swift_beginAccess();
    uint64_t v21 = *(void **)(v3 + 24);
    sub_2523A8570(v37, v39, v38);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v3 + 24) = v21;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v21 = sub_2523A7D14(0, v21[2] + 1, 1, v21);
      *uint64_t v20 = v21;
    }
    unint64_t v24 = v21[2];
    unint64_t v23 = v21[3];
    if (v24 >= v23 >> 1)
    {
      uint64_t v21 = sub_2523A7D14((void *)(v23 > 1), v24 + 1, 1, v21);
      *uint64_t v20 = v21;
    }
    v21[2] = v24 + 1;
    unint64_t v25 = &v21[3 * v24];
    v25[4] = v37;
    v25[5] = v39;
    *((unsigned char *)v25 + 48) = v38;
    swift_endAccess();
    swift_retain();
    sub_2523AD214(a1);
    if (v36)
    {
      swift_release();
      *(void *)(v3 + 32) = v19;
      swift_retain();
      swift_release();
      sub_2523ACD38();
      swift_release();
      swift_release();
      sub_2523A8630(v37, v39, v38);
LABEL_27:
      swift_release();
      return;
    }
    swift_release();
    *(void *)(v3 + 32) = v19;
    swift_retain();
    swift_release();
    sub_2523ACD38();
    swift_release();
    swift_release();
    sub_2523A8630(v37, v39, v38);
    swift_release();
    sub_2523B9B1C(v37, v39, v38);
    if (!__OFADD__(v34, 1))
    {
      v2[3] = v34 + 1;
      v2[4] = 0;
      v2[5] = 0;
      *((unsigned char *)v2 + 48) = -1;
      return;
    }
    __break(1u);
    goto LABEL_29;
  }
  __break(1u);
LABEL_20:
  uint64_t v26 = sub_2523C75D8();
  swift_allocError();
  uint64_t v28 = v27;
  *unint64_t v27 = &_s12ValueDecoderV16UnkeyedContainerVN;
  unint64_t v29 = v2[1];
  uint64_t v30 = v2[3];
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v30;
  *(void *)(v31 + 24) = v29;
  if (v29 >> 62)
  {
    uint64_t v32 = 0;
    if (v29 >> 62 != 1) {
      goto LABEL_25;
    }
    uint64_t v33 = (uint64_t *)((v29 & 0x3FFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    uint64_t v33 = (uint64_t *)(v29 + 64);
  }
  uint64_t v32 = *v33;
  swift_retain();
LABEL_25:
  if (!__OFADD__(v32, 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
    *(void *)(v31 + 32) = v32 + 1;
    swift_retain();
    sub_2523A7798(v31 | 0x4000000000000000);
    swift_release();
    sub_2523C75C8();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCC0], v26);
    swift_willThrow();
    goto LABEL_27;
  }
LABEL_30:
  __break(1u);
}

uint64_t sub_2523B367C@<X0>(void *a1@<X8>)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
  uint64_t v3 = *(void *)(v1 + 32);
  unint64_t v4 = *(void *)(v1 + 40);
  int v5 = *(unsigned __int8 *)(v1 + 48);
  uint64_t v6 = v3;
  unint64_t v7 = v4;
  char v8 = *(unsigned char *)(v1 + 48);
  if (v5 == 255)
  {
    uint64_t v9 = *(void *)(v1 + 16);
    uint64_t v10 = *(void *)(v1 + 24);
    if (v10 >= *(void *)(v9 + 16)) {
      goto LABEL_14;
    }
    if (v10 < 0)
    {
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    uint64_t v11 = v9 + 24 * v10;
    uint64_t v6 = *(void *)(v11 + 32);
    unint64_t v12 = *(void *)(v11 + 40);
    char v8 = *(unsigned char *)(v11 + 48);
    *(void *)(v1 + 32) = v6;
    *(void *)(v1 + 40) = v12;
    *(unsigned char *)(v1 + 48) = v8;
    sub_2523A8570(v6, v12, v8);
    sub_2523A8570(v6, v12, v8);
    unint64_t v7 = v12;
  }
  char v33 = v8;
  unint64_t v34 = v7;
  unint64_t v13 = *(void *)(v1 + 8);
  uint64_t v14 = *(void *)(v1 + 24);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v13;
  if (v13 >> 62)
  {
    if (v13 >> 62 != 1)
    {
      uint64_t v18 = 1;
      goto LABEL_10;
    }
    uint64_t v16 = (uint64_t *)((v13 & 0x3FFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    uint64_t v16 = (uint64_t *)(v13 + 64);
  }
  uint64_t v17 = *v16;
  uint64_t result = swift_retain();
  uint64_t v18 = v17 + 1;
  if (!__OFADD__(v17, 1))
  {
LABEL_10:
    *(void *)(v15 + 32) = v18;
    uint64_t v19 = *(void *)(*(void *)v1 + 16);
    uint64_t v20 = _s12ValueDecoderV14ImplementationCMa();
    uint64_t v32 = v14;
    uint64_t v21 = (void *)swift_allocObject();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E38);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_2523C8C60;
    *(void *)(v22 + 32) = v6;
    *(void *)(v22 + 40) = v34;
    *(unsigned char *)(v22 + 48) = v33;
    v21[3] = v22;
    v21[4] = v15 | 0x4000000000000000;
    v21[2] = v19;
    a1[3] = v20;
    a1[4] = sub_2523B5DB8(&qword_269C02E60);
    sub_2523B9B30(v3, v4, v5);
    swift_bridgeObjectRetain();
    uint64_t result = sub_2523B9B1C(v6, v34, v33);
    *a1 = v21;
    if (!__OFADD__(v32, 1))
    {
      *(void *)(v1 + 24) = v32 + 1;
      *(void *)(v1 + 32) = 0;
      *(void *)(v1 + 40) = 0;
      *(unsigned char *)(v1 + 48) = -1;
      return result;
    }
    __break(1u);
    goto LABEL_23;
  }
  __break(1u);
LABEL_14:
  uint64_t v23 = result;
  uint64_t v24 = sub_2523C75D8();
  swift_allocError();
  uint64_t v26 = v25;
  *unint64_t v25 = v23;
  unint64_t v27 = *(void *)(v1 + 8);
  uint64_t v28 = *(void *)(v1 + 24);
  uint64_t result = swift_allocObject();
  uint64_t v29 = result;
  *(void *)(result + 16) = v28;
  *(void *)(result + 24) = v27;
  if (v27 >> 62)
  {
    uint64_t v30 = 0;
    if (v27 >> 62 != 1) {
      goto LABEL_19;
    }
    uint64_t v31 = (uint64_t *)((v27 & 0x3FFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    uint64_t v31 = (uint64_t *)(v27 + 64);
  }
  uint64_t v30 = *v31;
  uint64_t result = swift_retain();
LABEL_19:
  if (__OFADD__(v30, 1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
  *(void *)(v29 + 32) = v30 + 1;
  sub_2523A7798(v29 | 0x4000000000000000);
  swift_release();
  sub_2523C75C8();
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v24 - 8) + 104))(v26, *MEMORY[0x263F8DCC0], v24);
  uint64_t result = swift_willThrow();
  if (!__OFADD__(v28, 1))
  {
    *(void *)(v1 + 24) = v28 + 1;
    uint64_t result = sub_2523B9B1C(*(void *)(v1 + 32), *(void *)(v1 + 40), *(unsigned char *)(v1 + 48));
    *(void *)(v1 + 32) = 0;
    *(void *)(v1 + 40) = 0;
    *(unsigned char *)(v1 + 48) = -1;
    return result;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2523B3A4C()
{
  return *(void *)(*(void *)(v0 + 16) + 16);
}

BOOL sub_2523B3A5C()
{
  return *(void *)(v0 + 24) >= *(void *)(*(void *)(v0 + 16) + 16);
}

uint64_t sub_2523B3A70()
{
  return *(void *)(v0 + 24);
}

uint64_t sub_2523B3A78()
{
  sub_2523B2748();
  return v0 & 1;
}

uint64_t sub_2523B3A94()
{
  sub_2523B9B44();
  return v0 & 1;
}

void sub_2523B3AB0()
{
}

void sub_2523B3AC8()
{
}

void sub_2523B3AE0()
{
}

void sub_2523B3AF8()
{
}

void sub_2523B3B10()
{
}

void sub_2523B3B28()
{
}

void sub_2523B3B40()
{
}

void sub_2523B3B58()
{
}

uint64_t sub_2523B3B70()
{
  return sub_2523C7788();
}

void sub_2523B3B88()
{
}

void sub_2523B3BA0()
{
}

void sub_2523B3BB8()
{
}

void sub_2523B3BD0()
{
}

void sub_2523B3BE8()
{
}

uint64_t sub_2523B3C00()
{
  return sub_2523C7798();
}

uint64_t sub_2523B3C18@<X0>(uint64_t a1@<X0>, ValueMetadata *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2523B29D8(a1, a2, a3, a4);
}

uint64_t sub_2523B3C30()
{
  return sub_2523C7718();
}

uint64_t sub_2523B3C48()
{
  return sub_2523C7708();
}

uint64_t sub_2523B3C60()
{
  uint64_t result = sub_2523C7728();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2523B3C84(uint64_t a1, uint64_t a2)
{
  return sub_2523B3EB0(a1, a2, MEMORY[0x263F8E110]);
}

uint64_t sub_2523B3CB0()
{
  uint64_t result = sub_2523C7738();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2523B3CD4(uint64_t a1, uint64_t a2)
{
  return sub_2523B3DF8(a1, a2, MEMORY[0x263F8E118]);
}

uint64_t sub_2523B3D00(uint64_t a1, uint64_t a2)
{
  return sub_2523B3E54(a1, a2, MEMORY[0x263F8E120]);
}

uint64_t sub_2523B3D2C(uint64_t a1, uint64_t a2)
{
  return sub_2523B3EB0(a1, a2, MEMORY[0x263F8E128]);
}

uint64_t sub_2523B3D58()
{
  uint64_t result = sub_2523C7768();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2523B3D7C(uint64_t a1, uint64_t a2)
{
  return sub_2523B3F38(a1, a2, MEMORY[0x263F8E138]);
}

uint64_t sub_2523B3DA8()
{
  uint64_t result = sub_2523C7748();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2523B3DCC(uint64_t a1, uint64_t a2)
{
  return sub_2523B3DF8(a1, a2, MEMORY[0x263F8E130]);
}

uint64_t sub_2523B3DF8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FF;
}

uint64_t sub_2523B3E28(uint64_t a1, uint64_t a2)
{
  return sub_2523B3E54(a1, a2, MEMORY[0x263F8E140]);
}

uint64_t sub_2523B3E54(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FFFF;
}

uint64_t sub_2523B3E84(uint64_t a1, uint64_t a2)
{
  return sub_2523B3EB0(a1, a2, MEMORY[0x263F8E148]);
}

uint64_t sub_2523B3EB0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  unint64_t v3 = a3();
  return v3 | ((HIDWORD(v3) & 1) << 32);
}

uint64_t sub_2523B3EE8()
{
  uint64_t result = sub_2523C7778();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2523B3F0C(uint64_t a1, uint64_t a2)
{
  return sub_2523B3F38(a1, a2, MEMORY[0x263F8E150]);
}

uint64_t sub_2523B3F38(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (v3) {
    return v5;
  }
  return result;
}

uint64_t sub_2523B3F64()
{
  return sub_2523C7758();
}

uint64_t sub_2523B3F90()
{
  return sub_2523B2D3C();
}

void sub_2523B3FA8(uint64_t *a1@<X8>)
{
}

uint64_t sub_2523B3FC0@<X0>(void *a1@<X8>)
{
  return sub_2523B367C(a1);
}

uint64_t sub_2523B3FD8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v14 = v1;
  int64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_2523B80C8(0, v2, 0);
    uint64_t v3 = v13;
    unint64_t v4 = *(void *)(v13 + 16);
    uint64_t v5 = 12 * v4;
    uint64_t v6 = (unsigned char *)(v1 + 40);
    do
    {
      uint64_t v7 = *((void *)v6 - 1);
      char v8 = *v6;
      unint64_t v9 = *(void *)(v13 + 24);
      unint64_t v10 = v4 + 1;
      if (v4 >= v9 >> 1) {
        sub_2523B80C8(v9 > 1, v4 + 1, 1);
      }
      v6 += 40;
      *(void *)(v13 + 16) = v10;
      uint64_t v11 = v13 + v5;
      *(void *)(v11 + 32) = v7;
      *(unsigned char *)(v11 + 40) = v8;
      v5 += 12;
      unint64_t v4 = v10;
      --v2;
    }
    while (v2);
    sub_2523BE320((uint64_t)&v14);
  }
  return v3;
}

BOOL sub_2523B40D0(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = *(void *)(v3 + 16);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = __ROR8__(a1, 32);
  if (a2) {
    uint64_t v5 = a1;
  }
  uint64_t v6 = v4 - 1;
  uint64_t v7 = (unsigned __int8 *)(v3 + 40);
  do
  {
    uint64_t v10 = *((void *)v7 - 1);
    int v8 = *v7;
    v7 += 40;
    uint64_t v9 = __ROR8__(v10, 32);
    uint64_t v10 = v10;
    if (!v8) {
      uint64_t v10 = v9;
    }
    BOOL result = v10 == v5;
  }
  while (v10 != v5 && v6-- != 0);
  return result;
}

uint64_t sub_2523B412C(uint64_t a1, char a2)
{
  int v4 = a2 & 1;
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v7 = __ROR8__(a1, 32);
    if (a2) {
      uint64_t v7 = a1;
    }
    int v8 = (unsigned char *)(v5 + 64);
    while (1)
    {
      uint64_t v9 = __ROR8__(*((void *)v8 - 4), 32);
      uint64_t v10 = *((void *)v8 - 4);
      if (!*(v8 - 24)) {
        uint64_t v10 = v9;
      }
      if (v10 == v7) {
        break;
      }
      v8 += 40;
      if (!--v6) {
        goto LABEL_9;
      }
    }
    if (*v8 == 10 && *((_OWORD *)v8 - 1) == 0)
    {
      sub_2523A8570(0, 0, 10);
      char v14 = 1;
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
LABEL_9:
    uint64_t v11 = sub_2523C75D8();
    swift_allocError();
    uint64_t v13 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E98);
    *(void *)(v13 + 24) = &_s3TagO14CodingKeyProxyVN;
    *(void *)(v13 + 32) = sub_2523A7384();
    *(void *)uint64_t v13 = a1;
    *(unsigned char *)(v13 + 8) = v4 != 0;
    sub_2523A7798(*(void *)(v2 + 8));
    sub_2523C7598();
    swift_bridgeObjectRelease();
    sub_2523A6BC4(a1, v4);
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523A6B70();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523C75C8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCA8], v11);
    swift_willThrow();
  }
  return v14 & 1;
}

uint64_t sub_2523B438C@<X0>(uint64_t a1@<X1>, char a2@<W2>, char *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  int v8 = a2 & 1;
  uint64_t v9 = v5[2];
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    uint64_t v13 = __ROR8__(a1, 32);
    if (a2) {
      uint64_t v13 = a1;
    }
    char v14 = (unsigned __int8 *)(v9 + 64);
    while (1)
    {
      uint64_t v15 = __ROR8__(*((void *)v14 - 4), 32);
      uint64_t v16 = *((void *)v14 - 4);
      if (!*(v14 - 24)) {
        uint64_t v16 = v15;
      }
      if (v16 == v13) {
        break;
      }
      v14 += 40;
      if (!--v10) {
        goto LABEL_9;
      }
    }
    uint64_t v21 = *((void *)v14 - 2);
    unint64_t v22 = *((void *)v14 - 1);
    uint64_t v23 = *v5;
    unint64_t v24 = v5[1];
    uint64_t v29 = v23;
    int v25 = *v14;
    unint64_t v27 = a1;
    LOBYTE(v28) = a2 & 1;
    sub_2523A8570(v21, v22, v25);
    unint64_t v26 = sub_2523A7384();
    sub_2523AE75C(v21, v22, v25, a3, v24, (uint64_t)&v27, (uint64_t)a3, (uint64_t)&_s3TagO14CodingKeyProxyVN, a5, a4, v26);
    return sub_2523A8630(v21, v22, v25);
  }
  else
  {
LABEL_9:
    uint64_t v17 = sub_2523C75D8();
    swift_allocError();
    uint64_t v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E98);
    *(void *)(v19 + 24) = &_s3TagO14CodingKeyProxyVN;
    *(void *)(v19 + 32) = sub_2523A7384();
    *(void *)uint64_t v19 = a1;
    *(unsigned char *)(v19 + 8) = v8 != 0;
    sub_2523A7798(v5[1]);
    sub_2523C7598();
    swift_bridgeObjectRelease();
    unint64_t v27 = 0xD00000000000001DLL;
    unint64_t v28 = 0x80000002523CAE10;
    sub_2523A6BC4(a1, v8);
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523A6B70();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523C75C8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x263F8DCA8], v17);
    return swift_willThrow();
  }
}

uint64_t sub_2523B4638(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = a2;
  int v5 = a3 & 1;
  uint64_t v6 = v3[2];
  uint64_t v7 = *(void *)(v6 + 16);
  if (!v7)
  {
LABEL_9:
    uint64_t v12 = sub_2523C75D8();
    swift_allocError();
    uint64_t v14 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E98);
    *(void *)(v14 + 24) = &_s3TagO14CodingKeyProxyVN;
    *(void *)(v14 + 32) = sub_2523A7384();
    *(void *)uint64_t v14 = v4;
    *(unsigned char *)(v14 + 8) = v5 != 0;
    sub_2523A7798(v3[1]);
    sub_2523C7598();
    swift_bridgeObjectRelease();
    sub_2523A6BC4(v4, v5);
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523A6B70();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523C75C8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v12 - 8) + 104))(v14, *MEMORY[0x263F8DCA8], v12);
    return swift_willThrow();
  }
  uint64_t v8 = __ROR8__(a2, 32);
  if (a3) {
    uint64_t v8 = a2;
  }
  uint64_t v9 = (char *)(v6 + 64);
  while (1)
  {
    uint64_t v10 = __ROR8__(*((void *)v9 - 4), 32);
    uint64_t v11 = *((void *)v9 - 4);
    if (!*(v9 - 24)) {
      uint64_t v11 = v10;
    }
    if (v11 == v8) {
      break;
    }
    v9 += 40;
    if (!--v7) {
      goto LABEL_9;
    }
  }
  uint64_t v16 = v5 != 0;
  unint64_t v18 = *((void *)v9 - 2);
  unint64_t v17 = *((void *)v9 - 1);
  char v19 = *v9;
  sub_2523BC5B8((uint64_t)(v3 + 1), (uint64_t)v32);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 40) = &_s3TagO14CodingKeyProxyVN;
  *(void *)(v20 + 48) = sub_2523A7384();
  *(void *)(v20 + 16) = v4;
  *(unsigned char *)(v20 + 24) = v16;
  sub_2523BC5B8((uint64_t)v32, v20 + 56);
  sub_2523BC5B8((uint64_t)v32, (uint64_t)&v33);
  unint64_t v21 = v33;
  if (v33 >> 62)
  {
    if (v33 >> 62 != 1)
    {
      uint64_t v24 = 1;
      goto LABEL_15;
    }
    v33 &= 0x3FFFFFFFFFFFFFFFuLL;
    unint64_t v22 = (void **)((v21 & 0x3FFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    v33 &= 0x3FFFFFFFFFFFFFFFuLL;
    unint64_t v22 = (void **)((v21 & 0x3FFFFFFFFFFFFFFFLL) + 64);
  }
  uint64_t v23 = *v22;
  sub_2523BC614((uint64_t)v32);
  uint64_t v24 = (uint64_t)v23 + 1;
  if (__OFADD__(v23, 1))
  {
    __break(1u);
    goto LABEL_21;
  }
LABEL_15:
  uint64_t v4 = *v3;
  *(void *)(v20 + 64) = v24;
  uint64_t v16 = *(void *)(v4 + 32);
  *(void *)(v4 + 32) = v20;
  sub_2523A8570(v18, v17, v19);
  swift_retain();
  uint64_t v30 = (void *)(v4 + 24);
  swift_beginAccess();
  uint64_t v23 = *(void **)(v4 + 24);
  uint64_t v31 = v18;
  uint64_t v25 = v18;
  unint64_t v18 = v17;
  sub_2523A8570(v25, v17, v19);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v4 + 24) = v23;
  LOBYTE(v17) = v19;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_21:
    uint64_t v23 = sub_2523A7D14(0, v23[2] + 1, 1, v23);
    *uint64_t v30 = v23;
  }
  unint64_t v28 = v23[2];
  unint64_t v27 = v23[3];
  if (v28 >= v27 >> 1)
  {
    uint64_t v23 = sub_2523A7D14((void *)(v27 > 1), v28 + 1, 1, v23);
    *uint64_t v30 = v23;
  }
  v23[2] = v28 + 1;
  uint64_t v29 = &v23[3 * v28];
  v29[4] = v31;
  v29[5] = v18;
  *((unsigned char *)v29 + 48) = v17;
  swift_endAccess();
  sub_2523ACF10();
  *(void *)(v4 + 32) = v16;
  swift_retain();
  swift_release();
  sub_2523ACD38();
  swift_release();
  swift_release();
  return sub_2523A8630(v31, v18, v17);
}

uint64_t sub_2523B4A90@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = a1;
  int v6 = a2 & 1;
  uint64_t v7 = v3[2];
  uint64_t v8 = *(void *)(v7 + 16);
  if (!v8)
  {
LABEL_9:
    uint64_t v14 = sub_2523C75D8();
    swift_allocError();
    uint64_t v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E98);
    *(void *)(v16 + 24) = &_s3TagO14CodingKeyProxyVN;
    *(void *)(v16 + 32) = sub_2523A7384();
    *(void *)uint64_t v16 = v5;
    *(unsigned char *)(v16 + 8) = v6 != 0;
    sub_2523A7798(v3[1]);
    sub_2523C7598();
    swift_bridgeObjectRelease();
    sub_2523A6BC4(v5, v6);
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523A6B70();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523C75C8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x263F8DCA8], v14);
    return swift_willThrow();
  }
  char v9 = v4;
  uint64_t v10 = __ROR8__(a1, 32);
  if (a2) {
    uint64_t v10 = a1;
  }
  uint64_t v11 = (char *)(v7 + 64);
  while (1)
  {
    uint64_t v12 = __ROR8__(*((void *)v11 - 4), 32);
    uint64_t v13 = *((void *)v11 - 4);
    if (!*(v11 - 24)) {
      uint64_t v13 = v12;
    }
    if (v13 == v10) {
      break;
    }
    v11 += 40;
    if (!--v8) {
      goto LABEL_9;
    }
  }
  BOOL v18 = v6 != 0;
  uint64_t v20 = *((void *)v11 - 2);
  unint64_t v19 = *((void *)v11 - 1);
  char v21 = *v11;
  sub_2523BC5B8((uint64_t)(v3 + 1), (uint64_t)v34);
  uint64_t v22 = swift_allocObject();
  uint64_t v23 = (void *)(v22 + 56);
  *(void *)(v22 + 40) = &_s3TagO14CodingKeyProxyVN;
  *(void *)(v22 + 48) = sub_2523A7384();
  *(void *)(v22 + 16) = v5;
  *(unsigned char *)(v22 + 24) = v18;
  sub_2523BC5B8((uint64_t)v34, v22 + 56);
  sub_2523BC5B8((uint64_t)v34, (uint64_t)&v35);
  unint64_t v24 = v35;
  if (v35 >> 62)
  {
    if (v35 >> 62 != 1)
    {
      uint64_t v27 = 1;
      goto LABEL_15;
    }
    v35 &= 0x3FFFFFFFFFFFFFFFuLL;
    uint64_t v25 = (uint64_t *)((v24 & 0x3FFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    v35 &= 0x3FFFFFFFFFFFFFFFuLL;
    uint64_t v25 = (uint64_t *)((v24 & 0x3FFFFFFFFFFFFFFFLL) + 64);
  }
  uint64_t v26 = *v25;
  sub_2523BC614((uint64_t)v34);
  uint64_t v27 = v26 + 1;
  if (__OFADD__(v26, 1))
  {
    __break(1u);
    goto LABEL_21;
  }
LABEL_15:
  uint64_t v3 = (void *)*v3;
  *(void *)(v22 + 64) = v27;
  uint64_t v5 = v3[4];
  v3[4] = v22;
  sub_2523A8570(v20, v19, v21);
  swift_retain();
  uint64_t v32 = v3 + 3;
  swift_beginAccess();
  uint64_t v23 = (void *)v3[3];
  sub_2523A8570(v20, v19, v21);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v3[3] = v23;
  uint64_t v26 = v20;
  char v9 = v21;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_21:
    uint64_t v23 = sub_2523A7D14(0, v23[2] + 1, 1, v23);
    *uint64_t v32 = v23;
  }
  unint64_t v30 = v23[2];
  unint64_t v29 = v23[3];
  if (v30 >= v29 >> 1)
  {
    uint64_t v23 = sub_2523A7D14((void *)(v29 > 1), v30 + 1, 1, v23);
    *uint64_t v32 = v23;
  }
  v23[2] = v30 + 1;
  uint64_t v31 = &v23[3 * v30];
  v31[4] = v26;
  v31[5] = v19;
  *((unsigned char *)v31 + 48) = v9;
  swift_endAccess();
  sub_2523AD214(a3);
  v3[4] = v5;
  swift_retain();
  swift_release();
  sub_2523ACD38();
  swift_release();
  swift_release();
  return sub_2523A8630(v26, v19, v9);
}

uint64_t sub_2523B4EC4@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X8>)
{
  uint64_t v4 = v3;
  int v6 = a2 & 1;
  uint64_t v7 = *(void *)(v3 + 16);
  uint64_t v8 = *(void *)(v7 + 16);
  unint64_t v35 = a3;
  if (v8)
  {
    uint64_t v9 = __ROR8__(a1, 32);
    if (a2) {
      uint64_t v9 = a1;
    }
    uint64_t v10 = (char *)(v7 + 64);
    while (1)
    {
      uint64_t v11 = __ROR8__(*((void *)v10 - 4), 32);
      uint64_t v12 = *((void *)v10 - 4);
      if (!*(v10 - 24)) {
        uint64_t v12 = v11;
      }
      if (v12 == v9) {
        break;
      }
      v10 += 40;
      if (!--v8) {
        goto LABEL_9;
      }
    }
    uint64_t v16 = *((void *)v10 - 2);
    unint64_t v17 = *((void *)v10 - 1);
    char v18 = *v10;
    sub_2523A8570(v16, v17, *v10);
  }
  else
  {
LABEL_9:
    uint64_t v13 = sub_2523C75D8();
    uint64_t v31 = swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E98);
    *(void *)(v15 + 24) = &_s3TagO14CodingKeyProxyVN;
    *(void *)(v15 + 32) = sub_2523A7384();
    *(void *)uint64_t v15 = a1;
    *(unsigned char *)(v15 + 8) = v6 != 0;
    sub_2523A7798(*(void *)(v3 + 8));
    sub_2523C7598();
    swift_bridgeObjectRelease();
    v34[0] = 0xD00000000000001DLL;
    v34[1] = 0x80000002523CAE10;
    sub_2523A6BC4(a1, v6);
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    uint64_t v32 = a1;
    BOOL v33 = v6 != 0;
    sub_2523A6B70();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523C75C8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCA8], v13);
    swift_willThrow();
    MEMORY[0x2533B4160](v31);
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    char v18 = 10;
  }
  BOOL v19 = v6 != 0;
  sub_2523BC5B8(v4 + 8, (uint64_t)&v32);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 40) = &_s3TagO14CodingKeyProxyVN;
  *(void *)(v20 + 48) = sub_2523A7384();
  *(void *)(v20 + 16) = a1;
  *(unsigned char *)(v20 + 24) = v19;
  sub_2523BC5B8((uint64_t)&v32, v20 + 56);
  sub_2523BC5B8((uint64_t)&v32, (uint64_t)v34);
  uint64_t v21 = v34[0];
  if (v34[0] >> 62)
  {
    if (v34[0] >> 62 != 1)
    {
      uint64_t v25 = 1;
      goto LABEL_16;
    }
    v34[0] &= 0x3FFFFFFFFFFFFFFFuLL;
    uint64_t v22 = (uint64_t *)((v21 & 0x3FFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    v34[0] &= 0x3FFFFFFFFFFFFFFFuLL;
    uint64_t v22 = (uint64_t *)((v21 & 0x3FFFFFFFFFFFFFFFLL) + 64);
  }
  uint64_t v23 = *v22;
  uint64_t result = sub_2523BC614((uint64_t)&v32);
  uint64_t v25 = v23 + 1;
  if (!__OFADD__(v23, 1))
  {
LABEL_16:
    *(void *)(v20 + 64) = v25;
    uint64_t v26 = *(void *)(*(void *)v4 + 16);
    uint64_t v27 = _s12ValueDecoderV14ImplementationCMa();
    unint64_t v28 = (void *)swift_allocObject();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E38);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_2523C8C60;
    *(void *)(v29 + 32) = v16;
    *(void *)(v29 + 40) = v17;
    *(unsigned char *)(v29 + 48) = v18;
    v28[3] = v29;
    v28[4] = v20;
    v28[2] = v26;
    unint64_t v30 = v35;
    v35[3] = v27;
    v30[4] = sub_2523B5DB8(&qword_269C02E60);
    *unint64_t v30 = v28;
    return swift_bridgeObjectRetain();
  }
  __break(1u);
  return result;
}

uint64_t sub_2523B5268()
{
  return sub_2523A7798(*(void *)(v0 + 8));
}

uint64_t sub_2523B5270()
{
  return sub_2523B3FD8();
}

BOOL sub_2523B52B4(uint64_t a1)
{
  return sub_2523B40D0(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_2523B5308(uint64_t a1)
{
  return sub_2523B412C(*(void *)a1, *(unsigned char *)(a1 + 8)) & 1;
}

unint64_t sub_2523B535C(uint64_t a1)
{
  return sub_2523BC644(*(void *)a1, *(unsigned char *)(a1 + 8)) & 1;
}

void *sub_2523B53B0(uint64_t a1)
{
  return sub_2523BC8CC(*(void *)a1, *(unsigned char *)(a1 + 8));
}

double sub_2523B5400(uint64_t a1)
{
  return sub_2523BCB78(*(void *)a1, *(unsigned char *)(a1 + 8));
}

float sub_2523B5450(uint64_t a1)
{
  return sub_2523BCE08(*(void *)a1, *(unsigned char *)(a1 + 8));
}

void *sub_2523B54A0(uint64_t a1)
{
  return sub_2523BD098(*(void *)a1, *(unsigned char *)(a1 + 8));
}

void *sub_2523B54F0(uint64_t a1)
{
  return sub_2523BD8B8(*(void *)a1, *(unsigned char *)(a1 + 8), (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2523AFE3C);
}

void *sub_2523B5554(uint64_t a1)
{
  return sub_2523BDB48(*(void *)a1, *(unsigned char *)(a1 + 8), (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2523B0150);
}

void *sub_2523B55B8(uint64_t a1)
{
  return sub_2523BDDD8(*(void *)a1, *(unsigned char *)(a1 + 8), (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2523B046C);
}

void *sub_2523B561C(uint64_t a1)
{
  return sub_2523BD34C(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_2523B566C()
{
  return sub_2523C79C8();
}

void *sub_2523B5684(uint64_t a1)
{
  return sub_2523BD604(*(void *)a1, *(unsigned char *)(a1 + 8));
}

void *sub_2523B56D4(uint64_t a1)
{
  return sub_2523BD8B8(*(void *)a1, *(unsigned char *)(a1 + 8), (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2523B1750);
}

void *sub_2523B5738(uint64_t a1)
{
  return sub_2523BDB48(*(void *)a1, *(unsigned char *)(a1 + 8), (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2523B1A6C);
}

void *sub_2523B579C(uint64_t a1)
{
  return sub_2523BDDD8(*(void *)a1, *(unsigned char *)(a1 + 8), (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2523B1D88);
}

void *sub_2523B5800(uint64_t a1)
{
  return sub_2523BE068(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_2523B5850()
{
  return sub_2523C79D8();
}

uint64_t sub_2523B5868@<X0>(uint64_t a1@<X1>, char *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  return sub_2523B438C(*(void *)a1, *(unsigned char *)(a1 + 8), a2, a3, a4);
}

uint64_t sub_2523B58C0()
{
  return sub_2523C7958();
}

uint64_t sub_2523B58D8()
{
  return sub_2523C7948();
}

uint64_t sub_2523B58F0()
{
  uint64_t result = sub_2523C7968();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2523B5914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2523B5B40(a1, a2, a3, MEMORY[0x263F8E340]);
}

uint64_t sub_2523B5940()
{
  uint64_t result = sub_2523C7978();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2523B5964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2523B5A88(a1, a2, a3, MEMORY[0x263F8E358]);
}

uint64_t sub_2523B5990(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2523B5AE4(a1, a2, a3, MEMORY[0x263F8E360]);
}

uint64_t sub_2523B59BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2523B5B40(a1, a2, a3, MEMORY[0x263F8E368]);
}

uint64_t sub_2523B59E8()
{
  uint64_t result = sub_2523C79A8();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2523B5A0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2523B5BC8(a1, a2, a3, MEMORY[0x263F8E380]);
}

uint64_t sub_2523B5A38()
{
  uint64_t result = sub_2523C7988();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2523B5A5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2523B5A88(a1, a2, a3, MEMORY[0x263F8E378]);
}

uint64_t sub_2523B5A88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FF;
}

uint64_t sub_2523B5AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2523B5AE4(a1, a2, a3, MEMORY[0x263F8E388]);
}

uint64_t sub_2523B5AE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FFFF;
}

uint64_t sub_2523B5B14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2523B5B40(a1, a2, a3, MEMORY[0x263F8E390]);
}

uint64_t sub_2523B5B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v4 = a4();
  return v4 | ((HIDWORD(v4) & 1) << 32);
}

uint64_t sub_2523B5B78()
{
  uint64_t result = sub_2523C79B8();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2523B5B9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2523B5BC8(a1, a2, a3, MEMORY[0x263F8E3A0]);
}

uint64_t sub_2523B5BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result = a4();
  if (v4) {
    return v6;
  }
  return result;
}

uint64_t sub_2523B5BF4()
{
  return sub_2523C7998();
}

uint64_t sub_2523B5C20(uint64_t a1, uint64_t a2)
{
  return sub_2523B4638(a1, *(void *)a2, *(unsigned char *)(a2 + 8));
}

uint64_t sub_2523B5C78@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2523B4A90(*(void *)a1, *(unsigned char *)(a1 + 8), a2);
}

void sub_2523B5CC8()
{
}

uint64_t sub_2523B5D24@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_2523B4EC4(*(void *)a1, *(unsigned char *)(a1 + 8), a2);
}

uint64_t sub_2523B5D74(uint64_t a1)
{
  uint64_t result = sub_2523B5DB8(&qword_269C02E60);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2523B5DB8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    _s12ValueDecoderV14ImplementationCMa();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2523B5DFC()
{
  unint64_t result = qword_269C02E80;
  if (!qword_269C02E80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C02E80);
  }
  return result;
}

uint64_t sub_2523B5E50()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  int v1 = *(unsigned __int8 *)(v0 + 64);
  if (v1 != 255) {
    sub_2523A8630(*(void *)(v0 + 48), *(void *)(v0 + 56), v1);
  }
  return MEMORY[0x270FA0238](v0, 65, 7);
}

uint64_t _s12ValueDecoderV21GenericKeyedContainerVMa()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2523B5EC8(uint64_t a1)
{
  long long v3 = v1[1];
  long long v12 = *v1;
  long long v13 = v3;
  long long v14 = v1[2];
  char v15 = *((unsigned char *)v1 + 48);
  uint64_t v11 = sub_2523B3FD8();
  long long v10 = *(_OWORD *)(a1 + 16);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C02F28);
  unint64_t v5 = sub_2523BE7B4();
  uint64_t v7 = sub_2523AB288((void (*)(char *, char *))sub_2523BE794, (uint64_t)v9, v4, v10, MEMORY[0x263F8E628], v5, MEMORY[0x263F8E658], v6);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_2523B5F90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_2523C7588();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v11 - v7;
  if (*(unsigned char *)(a1 + 8) != 1 && (uint64_t result = __ROR8__(*(void *)a1, 32), result < 0))
  {
    __break(1u);
  }
  else
  {
    sub_2523C7B48();
    uint64_t v10 = *(void *)(a2 - 8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, a2);
    if (result != 1) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a3, v8, a2);
    }
  }
  __break(1u);
  return result;
}

BOOL sub_2523B60C0()
{
  uint64_t v0 = sub_2523C7B38();
  if (v1) {
    return 0;
  }
  uint64_t v2 = v0;
  uint64_t v3 = sub_2523B3FD8();
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = v4 - 1;
    uint64_t v6 = (unsigned char *)(v3 + 40);
    while (1)
    {
      if (*v6 == 1)
      {
        uint64_t v7 = *((void *)v6 - 1);
      }
      else
      {
        uint64_t v7 = __ROR8__(*((void *)v6 - 1), 32);
        if (v7 < 0)
        {
          __break(1u);
          return 0;
        }
      }
      v6 += 12;
      BOOL v8 = v7 == v2;
      if (v7 == v2 || v5-- == 0) {
        goto LABEL_14;
      }
    }
  }
  BOOL v8 = 0;
LABEL_14:
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_2523B6188(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  BOOL v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v16 - v9;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)v16 - v9, a1, v4);
  uint64_t v12 = sub_2523A7100((uint64_t)v10, v4);
  if (v13 == -1)
  {
    v11(v8, a1, v4);
    *(void *)&v16[0] = 0;
    *((void *)&v16[0] + 1) = 0xE000000000000000;
    sub_2523C7598();
    sub_2523C7488();
    sub_2523C78E8();
    uint64_t result = sub_2523C7668();
    __break(1u);
  }
  else
  {
    long long v14 = *(_OWORD *)(v2 + 16);
    v16[0] = *(_OWORD *)v2;
    v16[1] = v14;
    v16[2] = *(_OWORD *)(v2 + 32);
    char v17 = *(unsigned char *)(v2 + 48);
    return sub_2523B412C(v12, v13 & 1) & 1;
  }
  return result;
}

unint64_t sub_2523B6370(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  BOOL v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v16 - v9;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)v16 - v9, a1, v4);
  uint64_t v12 = sub_2523A7100((uint64_t)v10, v4);
  if (v13 == -1)
  {
    v11(v8, a1, v4);
    *(void *)&v16[0] = 0;
    *((void *)&v16[0] + 1) = 0xE000000000000000;
    sub_2523C7598();
    sub_2523C7488();
    sub_2523C78E8();
    unint64_t result = sub_2523C7668();
    __break(1u);
  }
  else
  {
    long long v14 = *(_OWORD *)(v2 + 16);
    v16[0] = *(_OWORD *)v2;
    v16[1] = v14;
    v16[2] = *(_OWORD *)(v2 + 32);
    char v17 = *(unsigned char *)(v2 + 48);
    return sub_2523BC644(v12, v13 & 1) & 1;
  }
  return result;
}

void *sub_2523B6558(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  BOOL v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v16 - v9;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)v16 - v9, a1, v4);
  uint64_t v12 = sub_2523A7100((uint64_t)v10, v4);
  if (v13 == -1)
  {
    v11(v8, a1, v4);
    *(void *)&v16[0] = 0;
    *((void *)&v16[0] + 1) = 0xE000000000000000;
    sub_2523C7598();
    sub_2523C7488();
    sub_2523C78E8();
    unint64_t result = (void *)sub_2523C7668();
    __break(1u);
  }
  else
  {
    long long v14 = *(_OWORD *)(v2 + 16);
    v16[0] = *(_OWORD *)v2;
    v16[1] = v14;
    v16[2] = *(_OWORD *)(v2 + 32);
    char v17 = *(unsigned char *)(v2 + 48);
    return sub_2523BC8CC(v12, v13 & 1);
  }
  return result;
}

void sub_2523B673C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  BOOL v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v15 - v9;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)v15 - v9, a1, v4);
  uint64_t v12 = sub_2523A7100((uint64_t)v10, v4);
  if (v13 == -1)
  {
    v11(v8, a1, v4);
    *(void *)&v15[0] = 0;
    *((void *)&v15[0] + 1) = 0xE000000000000000;
    sub_2523C7598();
    sub_2523C7488();
    sub_2523C78E8();
    sub_2523C7668();
    __break(1u);
  }
  else
  {
    long long v14 = *(_OWORD *)(v2 + 16);
    v15[0] = *(_OWORD *)v2;
    v15[1] = v14;
    v15[2] = *(_OWORD *)(v2 + 32);
    char v16 = *(unsigned char *)(v2 + 48);
    sub_2523BCB78(v12, v13 & 1);
  }
}

void sub_2523B6920(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  BOOL v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v15 - v9;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)v15 - v9, a1, v4);
  uint64_t v12 = sub_2523A7100((uint64_t)v10, v4);
  if (v13 == -1)
  {
    v11(v8, a1, v4);
    *(void *)&v15[0] = 0;
    *((void *)&v15[0] + 1) = 0xE000000000000000;
    sub_2523C7598();
    sub_2523C7488();
    sub_2523C78E8();
    sub_2523C7668();
    __break(1u);
  }
  else
  {
    long long v14 = *(_OWORD *)(v2 + 16);
    v15[0] = *(_OWORD *)v2;
    v15[1] = v14;
    v15[2] = *(_OWORD *)(v2 + 32);
    char v16 = *(unsigned char *)(v2 + 48);
    sub_2523BCE08(v12, v13 & 1);
  }
}

uint64_t sub_2523B6B04(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, void))
{
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  BOOL v19 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v17 - v10;
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v12((char *)v17 - v10, a1, v6);
  uint64_t v13 = sub_2523A7100((uint64_t)v11, v6);
  if (v14 == -1)
  {
    v12(v19, a1, v6);
    *(void *)&v17[0] = 0;
    *((void *)&v17[0] + 1) = 0xE000000000000000;
    sub_2523C7598();
    sub_2523C7488();
    sub_2523C78E8();
    uint64_t result = sub_2523C7668();
    __break(1u);
  }
  else
  {
    long long v15 = *(_OWORD *)(v3 + 16);
    v17[0] = *(_OWORD *)v3;
    v17[1] = v15;
    v17[2] = *(_OWORD *)(v3 + 32);
    char v18 = *(unsigned char *)(v3 + 48);
    return a3(v13, v14 & 1);
  }
  return result;
}

void *sub_2523B6CF8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  BOOL v19 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v17 - v10;
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v12((char *)v17 - v10, a1, v6);
  uint64_t v13 = sub_2523A7100((uint64_t)v11, v6);
  if (v14 == -1)
  {
    v12(v19, a1, v6);
    *(void *)&v17[0] = 0;
    *((void *)&v17[0] + 1) = 0xE000000000000000;
    sub_2523C7598();
    sub_2523C7488();
    sub_2523C78E8();
    uint64_t result = (void *)sub_2523C7668();
    __break(1u);
  }
  else
  {
    long long v15 = *(_OWORD *)(v3 + 16);
    v17[0] = *(_OWORD *)v3;
    v17[1] = v15;
    v17[2] = *(_OWORD *)(v3 + 32);
    char v18 = *(unsigned char *)(v3 + 48);
    return sub_2523BD8B8(v13, v14 & 1, a3);
  }
  return result;
}

void *sub_2523B6EEC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  BOOL v19 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v17 - v10;
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v12((char *)v17 - v10, a1, v6);
  uint64_t v13 = sub_2523A7100((uint64_t)v11, v6);
  if (v14 == -1)
  {
    v12(v19, a1, v6);
    *(void *)&v17[0] = 0;
    *((void *)&v17[0] + 1) = 0xE000000000000000;
    sub_2523C7598();
    sub_2523C7488();
    sub_2523C78E8();
    uint64_t result = (void *)sub_2523C7668();
    __break(1u);
  }
  else
  {
    long long v15 = *(_OWORD *)(v3 + 16);
    v17[0] = *(_OWORD *)v3;
    v17[1] = v15;
    v17[2] = *(_OWORD *)(v3 + 32);
    char v18 = *(unsigned char *)(v3 + 48);
    return sub_2523BDB48(v13, v14 & 1, a3);
  }
  return result;
}

void *sub_2523B70E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1);
  BOOL v19 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v17 - v10;
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v12((char *)v17 - v10, a1, v6);
  uint64_t v13 = sub_2523A7100((uint64_t)v11, v6);
  if (v14 == -1)
  {
    v12(v19, a1, v6);
    *(void *)&v17[0] = 0;
    *((void *)&v17[0] + 1) = 0xE000000000000000;
    sub_2523C7598();
    sub_2523C7488();
    sub_2523C78E8();
    uint64_t result = (void *)sub_2523C7668();
    __break(1u);
  }
  else
  {
    long long v15 = *(_OWORD *)(v3 + 16);
    v17[0] = *(_OWORD *)v3;
    v17[1] = v15;
    v17[2] = *(_OWORD *)(v3 + 32);
    char v18 = *(unsigned char *)(v3 + 48);
    return sub_2523BDDD8(v13, v14 & 1, a3);
  }
  return result;
}

uint64_t sub_2523B72D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v22 = a5;
  uint64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](a1);
  uint64_t v21 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  long long v15 = (char *)&v21 - v14;
  char v16 = *(void (**)(char *))(v11 + 16);
  v16((char *)&v21 - v14);
  uint64_t v17 = sub_2523A7100((uint64_t)v15, v10);
  if (v18 == -1)
  {
    ((void (*)(char *, uint64_t, uint64_t))v16)(v21, a2, v10);
    *(void *)&long long v23 = 0;
    *((void *)&v23 + 1) = 0xE000000000000000;
    sub_2523C7598();
    sub_2523C7488();
    sub_2523C78E8();
    uint64_t result = sub_2523C7668();
    __break(1u);
  }
  else
  {
    long long v19 = v6[1];
    long long v23 = *v6;
    long long v24 = v19;
    long long v25 = v6[2];
    char v26 = *((unsigned char *)v6 + 48);
    return sub_2523B438C(v17, v18 & 1, a4, v22, a6);
  }
  return result;
}

uint64_t sub_2523B74E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v21 = a4;
  uint64_t v22 = a5;
  uint64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  uint64_t v20 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v19 - v12;
  uint64_t v14 = *(void (**)(char *))(v9 + 16);
  v14((char *)&v19 - v12);
  uint64_t v15 = sub_2523A7100((uint64_t)v13, v8);
  if (v16 == -1)
  {
    ((void (*)(char *, uint64_t, uint64_t))v14)(v20, a2, v8);
    *(void *)&long long v23 = 0;
    *((void *)&v23 + 1) = 0xE000000000000000;
    sub_2523C7598();
    sub_2523C7488();
    sub_2523C78E8();
    uint64_t result = sub_2523C7668();
    __break(1u);
  }
  else
  {
    long long v17 = v5[1];
    long long v23 = *v5;
    long long v24 = v17;
    long long v25 = v5[2];
    char v26 = *((unsigned char *)v5 + 48);
    return sub_2523B4638(a1, v15, v16 & 1);
  }
  return result;
}

uint64_t sub_2523B76E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, void))
{
  uint64_t v22 = a3;
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  long long v17 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v16 - v9;
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v11((char *)&v16 - v9, a1, v5);
  uint64_t v12 = sub_2523A7100((uint64_t)v10, v5);
  if (v13 == -1)
  {
    v11(v17, a1, v5);
    *(void *)&long long v18 = 0;
    *((void *)&v18 + 1) = 0xE000000000000000;
    sub_2523C7598();
    sub_2523C7488();
    sub_2523C78E8();
    uint64_t result = sub_2523C7668();
    __break(1u);
  }
  else
  {
    long long v14 = v3[1];
    long long v18 = *v3;
    long long v19 = v14;
    long long v20 = v3[2];
    char v21 = *((unsigned char *)v3 + 48);
    return v22(v12, v13 & 1);
  }
  return result;
}

uint64_t sub_2523B78E8()
{
  return sub_2523B5268();
}

uint64_t sub_2523B792C(uint64_t a1)
{
  return sub_2523B5EC8(a1);
}

BOOL sub_2523B7970()
{
  return sub_2523B60C0();
}

uint64_t sub_2523B79B8(uint64_t a1, uint64_t a2)
{
  return sub_2523B6188(a1, a2) & 1;
}

unint64_t sub_2523B7A00(uint64_t a1, uint64_t a2)
{
  return sub_2523B6370(a1, a2) & 1;
}

void *sub_2523B7A48(uint64_t a1, uint64_t a2)
{
  return sub_2523B6558(a1, a2);
}

void sub_2523B7A8C(uint64_t a1, uint64_t a2)
{
}

void sub_2523B7AD0(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_2523B7B14(uint64_t a1, uint64_t a2)
{
  return sub_2523B6B04(a1, a2, (uint64_t (*)(uint64_t, void))sub_2523BD098);
}

void *sub_2523B7B6C(uint64_t a1, uint64_t a2)
{
  return sub_2523B6CF8(a1, a2, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2523AFE3C);
}

void *sub_2523B7BC4(uint64_t a1, uint64_t a2)
{
  return sub_2523B6EEC(a1, a2, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2523B0150);
}

void *sub_2523B7C1C(uint64_t a1, uint64_t a2)
{
  return sub_2523B70E0(a1, a2, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2523B046C);
}

uint64_t sub_2523B7C74(uint64_t a1, uint64_t a2)
{
  return sub_2523B6B04(a1, a2, (uint64_t (*)(uint64_t, void))sub_2523BD34C);
}

uint64_t sub_2523B7CCC(uint64_t a1, uint64_t a2)
{
  return sub_2523B6B04(a1, a2, (uint64_t (*)(uint64_t, void))sub_2523BD604);
}

void *sub_2523B7D24(uint64_t a1, uint64_t a2)
{
  return sub_2523B6CF8(a1, a2, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2523B1750);
}

void *sub_2523B7D7C(uint64_t a1, uint64_t a2)
{
  return sub_2523B6EEC(a1, a2, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2523B1A6C);
}

void *sub_2523B7DD4(uint64_t a1, uint64_t a2)
{
  return sub_2523B70E0(a1, a2, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2523B1D88);
}

uint64_t sub_2523B7E2C(uint64_t a1, uint64_t a2)
{
  return sub_2523B6B04(a1, a2, (uint64_t (*)(uint64_t, void))sub_2523BE068);
}

uint64_t sub_2523B7E84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return sub_2523B72D4(a1, a2, a5, a3, a4, a6);
}

uint64_t sub_2523B7ED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2523B74E0(a1, a2, a5, a3, a4);
}

uint64_t sub_2523B7F2C(uint64_t a1, uint64_t a2)
{
  return sub_2523B76E8(a1, a2, (uint64_t (*)(uint64_t, void))sub_2523B4A90);
}

void sub_2523B7F84()
{
}

uint64_t sub_2523B7FC8(uint64_t a1, uint64_t a2)
{
  return sub_2523B76E8(a1, a2, (uint64_t (*)(uint64_t, void))sub_2523B4EC4);
}

uint64_t sub_2523B8020()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  char v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_2523B80C8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2523B80E8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2523B80E8(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_269C02EA0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 12);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  char v13 = a4 + 32;
  size_t v14 = 12 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    memcpy(v12, v13, v14);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2523C76B8();
  __break(1u);
  return result;
}

uint64_t sub_2523B8258@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = sub_2523B8520(v5);
  }
  unint64_t v6 = v5[2];
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    int64_t v7 = &v5[3 * a1];
    long long v9 = *((_OWORD *)v7 + 2);
    uint64_t v8 = v7 + 4;
    char v10 = v8[16];
    unint64_t v11 = v6 - 1;
    *(_OWORD *)a2 = v9;
    *(unsigned char *)(a2 + 16) = v10;
    uint64_t v12 = v6 - 1 - a1;
    if (v12 >= 0)
    {
      uint64_t result = (uint64_t)memmove(v8, v8 + 24, 24 * v12);
      v5[2] = v11;
      *uint64_t v2 = v5;
      return result;
    }
  }
  uint64_t result = sub_2523C76B8();
  __break(1u);
  return result;
}

uint64_t sub_2523B8348(unint64_t a1)
{
  unint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *char v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    sub_2523B8534(v3);
    unint64_t v3 = v5;
    *char v1 = v5;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v7 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v7 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v8 = v7 - 1;
    uint64_t v9 = v7 - 1 - a1;
    if (v9 >= 0)
    {
      uint64_t v10 = v6 + 8 * a1;
      uint64_t v11 = *(void *)(v10 + 32);
      memmove((void *)(v10 + 32), (const void *)(v10 + 40), 8 * v9);
      *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
      sub_2523C74F8();
      return v11;
    }
  }
  uint64_t result = sub_2523C76B8();
  __break(1u);
  return result;
}

uint64_t sub_2523B8434@<X0>(uint64_t a1@<X8>)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    uint64_t v5 = v3[2];
    if (v5)
    {
LABEL_3:
      uint64_t v6 = v5 - 1;
      unint64_t v7 = &v3[3 * v6];
      char v8 = *((unsigned char *)v7 + 48);
      *(_OWORD *)a1 = *((_OWORD *)v7 + 2);
      *(unsigned char *)(a1 + 16) = v8;
      v3[2] = v6;
      *char v1 = v3;
      return result;
    }
  }
  else
  {
    uint64_t result = (uint64_t)sub_2523B8520(v3);
    unint64_t v3 = (void *)result;
    uint64_t v5 = *(void *)(result + 16);
    if (v5) {
      goto LABEL_3;
    }
  }
  __break(1u);
  return result;
}

void sub_2523B84B0()
{
  unint64_t v1 = *v0;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v0 = v1;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v1 & 0x8000000000000000) != 0
    || (v1 & 0x4000000000000000) != 0)
  {
    sub_2523B8534(v1);
    unint64_t v1 = v3;
    *uint64_t v0 = v3;
  }
  uint64_t v4 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v4 - 1;
    sub_2523C74F8();
  }
  else
  {
    __break(1u);
  }
}

void *sub_2523B8520(void *a1)
{
  return sub_2523A7D14(0, a1[2], 0, a1);
}

void sub_2523B8534(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2523C7678();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x2533B3A20);
}

uint64_t sub_2523B85B0(uint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t v40 = a7;
  uint64_t v42 = a5;
  unint64_t v43 = a4;
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v44 = *(void *)(a6 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  unint64_t v41 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2523C7588();
  uint64_t v15 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  long long v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  long long v20 = (char *)&v37 - v19;
  if (a3 != 6)
  {
    if (a3 == 10 && !(a2 | a1))
    {
      uint64_t v24 = v18;
      uint64_t v25 = sub_2523C75D8();
      uint64_t v39 = swift_allocError();
      char v38 = v26;
      *char v26 = MEMORY[0x263F06F78];
      uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 16);
      v27(v20, v42, v14);
      v27(v17, (uint64_t)v20, v14);
      uint64_t v28 = v44;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v17, 1, a6) == 1)
      {
        uint64_t v29 = *(void (**)(char *, uint64_t))(v24 + 8);
        v29(v17, v14);
        sub_2523A7798(v43);
        v29(v20, v14);
      }
      else
      {
        unint64_t v30 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
        uint64_t v42 = v25;
        uint64_t v31 = v41;
        v30(v41, v17, a6);
        uint64_t v32 = sub_2523A7798(v43);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        uint64_t v34 = v40;
        *(void *)(inited + 56) = a6;
        *(void *)(inited + 64) = v34;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 32));
        (*(void (**)(uint64_t *, char *, uint64_t))(v28 + 16))(boxed_opaque_existential_1, v31, a6);
        uint64_t v45 = v32;
        sub_2523A7E38(inited);
        (*(void (**)(char *, uint64_t))(v24 + 8))(v20, v14);
        uint64_t v36 = v31;
        uint64_t v25 = v42;
        (*(void (**)(char *, uint64_t))(v28 + 8))(v36, a6);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      a1 = (uint64_t)v38;
      uint64_t v45 = 0;
      unint64_t v46 = 0xE000000000000000;
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v25 - 8) + 104))(a1, *MEMORY[0x263F8DCC0], v25);
    }
    else
    {
      unint64_t v21 = *(void *)(v8 + 32);
      swift_retain();
      sub_2523A7798(v21);
      swift_release();
      sub_2523C75D8();
      swift_allocError();
      sub_2523AB688(a1, a2, a3, v22);
      swift_bridgeObjectRelease();
    }
    swift_willThrow();
  }
  return a1;
}

uint64_t sub_2523B8A5C()
{
  uint64_t result = swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v2 + 24 * v3;
    uint64_t v5 = *(void *)(v4 + 8);
    unint64_t v6 = *(void *)(v4 + 16);
    unint64_t v7 = *(void *)(v0 + 32);
    char v8 = *(unsigned char *)(v4 + 24);
    sub_2523A8570(v5, v6, v8);
    swift_retain();
    char v9 = sub_2523AD660(v5, v6, v8, v7, 0, 0, 0, 255);
    swift_release();
    sub_2523A8630(v5, v6, v8);
    return v9 & 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523B8B40(uint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v11 = a1;
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      uint64_t v20 = sub_2523C75D8();
      swift_allocError();
      uint64_t v11 = (uint64_t)v21;
      *unint64_t v21 = MEMORY[0x263F8D310];
      if (a8 == -1)
      {
        sub_2523A7798(a4);
      }
      else
      {
        sub_2523A82A4(a5, a6, a7, a8);
        sub_2523A7798(a4);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s10_CodingKeyON;
        *(void *)(inited + 64) = sub_2523A797C();
        uint64_t v23 = swift_allocObject();
        *(void *)(inited + 32) = v23;
        *(void *)(v23 + 16) = a5;
        *(void *)(v23 + 24) = a6;
        *(void *)(v23 + 32) = a7;
        *(unsigned char *)(v23 + 40) = a8;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v20 - 8) + 104))(v11, *MEMORY[0x263F8DCC0], v20);
      goto LABEL_6;
    }
  }
  else if (a3 == 5)
  {
    return v11;
  }
  unint64_t v12 = *(void *)(v8 + 32);
  swift_retain();
  sub_2523A7798(v12);
  swift_release();
  sub_2523C75D8();
  swift_allocError();
  sub_2523AB938(v11, a2, a3, v13);
  swift_bridgeObjectRelease();
LABEL_6:
  swift_willThrow();
  return v11;
}

uint64_t sub_2523B8E2C()
{
  uint64_t result = swift_beginAccess();
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = v3 + 24 * v4;
    uint64_t v6 = *(void *)(v5 + 8);
    unint64_t v7 = *(void *)(v5 + 16);
    char v8 = *(unsigned char *)(v5 + 24);
    unint64_t v9 = *(void *)(v0 + 32);
    sub_2523A8570(v6, v7, v8);
    swift_retain();
    uint64_t v10 = sub_2523B8B40(v6, v7, v8, v9, 0, 0, 0, 255);
    if (!v1) {
      swift_bridgeObjectRetain();
    }
    swift_release();
    sub_2523A8630(v6, v7, v8);
    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523B8F24(uint64_t a1, uint64_t a2, char a3, unint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  uint64_t v9 = a1;
  if (a3 == 10)
  {
    if (!(a2 | a1))
    {
      int v15 = a6;
      uint64_t v9 = sub_2523C75D8();
      swift_allocError();
      long long v17 = v16;
      *uint64_t v16 = MEMORY[0x263F8D310];
      sub_2523A7798(a4);
      if (v15 != 255)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E20);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2523C8C60;
        *(void *)(inited + 56) = &_s3TagO14CodingKeyProxyVN;
        *(void *)(inited + 64) = sub_2523A7384();
        *(void *)(inited + 32) = a5;
        *(unsigned char *)(inited + 40) = v15 & 1;
        sub_2523A7E38(inited);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
      sub_2523C7598();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C7488();
      sub_2523C75C8();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v9 - 8) + 104))(v17, *MEMORY[0x263F8DCC0], v9);
      goto LABEL_6;
    }
  }
  else if (a3 == 5)
  {
    return v9;
  }
  unint64_t v10 = *(void *)(v6 + 32);
  swift_retain();
  sub_2523A7798(v10);
  swift_release();
  sub_2523C75D8();
  swift_allocError();
  sub_2523AB938(v9, a2, a3, v11);
  swift_bridgeObjectRelease();
LABEL_6:
  swift_willThrow();
  return v9;
}

uint64_t sub_2523B91CC()
{
  uint64_t result = swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v2 + 24 * v3;
    uint64_t v5 = *(void *)(v4 + 8);
    unint64_t v6 = *(void *)(v4 + 16);
    unint64_t v7 = *(void *)(v0 + 32);
    char v8 = *(unsigned char *)(v4 + 24);
    sub_2523A8570(v5, v6, v8);
    swift_retain();
    sub_2523ADBE4(v5, v6, v8, v7, 0, 0, 0, 255);
    swift_release();
    return sub_2523A8630(v5, v6, v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523B92B0()
{
  uint64_t result = swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v2 + 24 * v3;
    uint64_t v5 = *(void *)(v4 + 8);
    unint64_t v6 = *(void *)(v4 + 16);
    unint64_t v7 = *(void *)(v0 + 32);
    char v8 = *(unsigned char *)(v4 + 24);
    sub_2523A8570(v5, v6, v8);
    swift_retain();
    sub_2523AE1D0(v5, v6, v8, v7, 0, 0, 0, 255);
    swift_release();
    return sub_2523A8630(v5, v6, v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523B9394()
{
  uint64_t result = swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v2 + 24 * v3;
    uint64_t v5 = *(void *)(v4 + 8);
    unint64_t v6 = *(void *)(v4 + 16);
    unint64_t v7 = *(void *)(v0 + 32);
    uint64_t v8 = *(unsigned __int8 *)(v4 + 24);
    sub_2523A8570(v5, v6, *(unsigned char *)(v4 + 24));
    swift_retain();
    uint64_t v9 = sub_2523AFB48(v5, v6, v8, v7, 0, 0, 0, 255, MEMORY[0x263F8D6C8], (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2523ABD40);
    swift_release();
    sub_2523A8630(v5, v6, v8);
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523B94A4()
{
  uint64_t result = swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v2 + 24 * v3;
    uint64_t v5 = *(void *)(v4 + 8);
    unint64_t v6 = *(void *)(v4 + 16);
    unint64_t v7 = *(void *)(v0 + 32);
    uint64_t v8 = *(unsigned __int8 *)(v4 + 24);
    sub_2523A8570(v5, v6, *(unsigned char *)(v4 + 24));
    swift_retain();
    uint64_t v9 = sub_2523AFB48(v5, v6, v8, v7, 0, 0, 0, 255, MEMORY[0x263F8E5C0], (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2523AC2A0);
    swift_release();
    sub_2523A8630(v5, v6, v8);
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523B95B8()
{
  uint64_t result = swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v2 + 24 * v3;
    uint64_t v5 = *(void *)(v4 + 8);
    unint64_t v6 = *(void *)(v4 + 16);
    unint64_t v7 = *(void *)(v0 + 32);
    uint64_t v8 = *(unsigned __int8 *)(v4 + 24);
    sub_2523A8570(v5, v6, *(unsigned char *)(v4 + 24));
    swift_retain();
    uint64_t v9 = sub_2523B145C(v5, v6, v8, v7, 0, 0, 0, 255, MEMORY[0x263F8D9D0], (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2523AC3F8);
    swift_release();
    sub_2523A8630(v5, v6, v8);
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523B96C8(uint64_t (*a1)(uint64_t, unint64_t, uint64_t, uint64_t, void, void, void, uint64_t))
{
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v6 = v4 + 24 * v5;
    uint64_t v7 = *(void *)(v6 + 8);
    unint64_t v8 = *(void *)(v6 + 16);
    uint64_t v9 = *(void *)(v1 + 32);
    uint64_t v10 = *(unsigned __int8 *)(v6 + 24);
    sub_2523A8570(v7, v8, *(unsigned char *)(v6 + 24));
    swift_retain();
    uint64_t v11 = a1(v7, v8, v10, v9, 0, 0, 0, 255);
    swift_release();
    sub_2523A8630(v7, v8, v10);
    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523B97B4(uint64_t (*a1)(uint64_t, unint64_t, uint64_t, uint64_t, void, void, void, uint64_t))
{
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v6 = v4 + 24 * v5;
    uint64_t v7 = *(void *)(v6 + 8);
    unint64_t v8 = *(void *)(v6 + 16);
    uint64_t v9 = *(void *)(v1 + 32);
    uint64_t v10 = *(unsigned __int8 *)(v6 + 24);
    sub_2523A8570(v7, v8, *(unsigned char *)(v6 + 24));
    swift_retain();
    uint64_t v11 = a1(v7, v8, v10, v9, 0, 0, 0, 255);
    swift_release();
    sub_2523A8630(v7, v8, v10);
    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523B98A0(uint64_t (*a1)(uint64_t, unint64_t, uint64_t, uint64_t, void, void, void, uint64_t))
{
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v6 = v4 + 24 * v5;
    uint64_t v7 = *(void *)(v6 + 8);
    unint64_t v8 = *(void *)(v6 + 16);
    uint64_t v9 = *(void *)(v1 + 32);
    uint64_t v10 = *(unsigned __int8 *)(v6 + 24);
    sub_2523A8570(v7, v8, *(unsigned char *)(v6 + 24));
    swift_retain();
    uint64_t v11 = a1(v7, v8, v10, v9, 0, 0, 0, 255);
    swift_release();
    sub_2523A8630(v7, v8, v10);
    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523B998C()
{
  uint64_t result = swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v2 + 24 * v3;
    uint64_t v5 = *(void *)(v4 + 8);
    unint64_t v6 = *(void *)(v4 + 16);
    unint64_t v7 = *(void *)(v0 + 32);
    uint64_t v8 = *(unsigned __int8 *)(v4 + 24);
    sub_2523A8570(v5, v6, *(unsigned char *)(v4 + 24));
    swift_retain();
    uint64_t v9 = sub_2523B145C(v5, v6, v8, v7, 0, 0, 0, 255, MEMORY[0x263F8E970], (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2523AC958);
    swift_release();
    sub_2523A8630(v5, v6, v8);
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523B9AA0()
{
  sub_2523A7A10(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
  return MEMORY[0x270FA0238](v0, 41, 7);
}

uint64_t sub_2523B9AE0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2523B9B1C(uint64_t result, unint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_2523A8630(result, a2, a3);
  }
  return result;
}

uint64_t sub_2523B9B30(uint64_t result, unint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_2523A8570(result, a2, a3);
  }
  return result;
}

void sub_2523B9B44()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);
  int v4 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v22 = v2;
  unint64_t v5 = v3;
  char v6 = *(unsigned char *)(v0 + 48);
  if (v4 == 255)
  {
    uint64_t v7 = *(void *)(v0 + 16);
    uint64_t v8 = *(void *)(v0 + 24);
    if (v8 < *(void *)(v7 + 16))
    {
      if (v8 < 0)
      {
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v9 = v7 + 24 * v8;
      uint64_t v10 = *(void *)(v9 + 32);
      unint64_t v5 = *(void *)(v9 + 40);
      char v6 = *(unsigned char *)(v9 + 48);
      *(void *)(v0 + 32) = v10;
      *(void *)(v0 + 40) = v5;
      *(unsigned char *)(v0 + 48) = v6;
      sub_2523A8570(v10, v5, v6);
      uint64_t v22 = v10;
      sub_2523A8570(v10, v5, v6);
      goto LABEL_5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
    uint64_t v13 = MEMORY[0x263F8D4F8];
    uint64_t v14 = sub_2523C75D8();
    swift_allocError();
    uint64_t v16 = v15;
    *int v15 = v13;
    unint64_t v17 = *(void *)(v0 + 8);
    uint64_t v18 = *(void *)(v0 + 24);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v18;
    *(void *)(v19 + 24) = v17;
    if (v17 >> 62)
    {
      uint64_t v20 = 0;
      if (v17 >> 62 != 1)
      {
LABEL_13:
        if (__OFADD__(v20, 1))
        {
LABEL_18:
          __break(1u);
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
        *(void *)(v19 + 32) = v20 + 1;
        swift_retain();
        sub_2523A7798(v19 | 0x4000000000000000);
        swift_release();
        sub_2523C75C8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x263F8DCC0], v14);
        swift_willThrow();
        swift_release();
        return;
      }
      unint64_t v21 = (uint64_t *)((v17 & 0x3FFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      unint64_t v21 = (uint64_t *)(v17 + 64);
    }
    uint64_t v20 = *v21;
    swift_retain();
    goto LABEL_13;
  }
LABEL_5:
  unint64_t v11 = *(void *)(v0 + 8);
  uint64_t v12 = *(void *)(v0 + 24);
  swift_retain();
  sub_2523B9B30(v2, v3, v4);
  sub_2523AD660(v22, v5, v6, v11, v12, 0, 0, 2);
  swift_release();
  sub_2523A8630(v22, v5, v6);
  if (!v1)
  {
    sub_2523B9B1C(v22, v5, v6);
    if (!__OFADD__(v12, 1))
    {
      *(void *)(v0 + 24) = v12 + 1;
      *(void *)(v0 + 32) = 0;
      *(void *)(v0 + 40) = 0;
      *(unsigned char *)(v0 + 48) = -1;
      return;
    }
    __break(1u);
    goto LABEL_17;
  }
}

void sub_2523B9E3C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);
  int v4 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v22 = v2;
  unint64_t v5 = v3;
  char v6 = *(unsigned char *)(v0 + 48);
  if (v4 != 255) {
    goto LABEL_5;
  }
  uint64_t v7 = *(void *)(v0 + 16);
  uint64_t v8 = *(void *)(v0 + 24);
  if (v8 < *(void *)(v7 + 16))
  {
    if (v8 < 0)
    {
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
    uint64_t v9 = v7 + 24 * v8;
    uint64_t v10 = *(void *)(v9 + 32);
    unint64_t v5 = *(void *)(v9 + 40);
    char v6 = *(unsigned char *)(v9 + 48);
    *(void *)(v0 + 32) = v10;
    *(void *)(v0 + 40) = v5;
    *(unsigned char *)(v0 + 48) = v6;
    sub_2523A8570(v10, v5, v6);
    uint64_t v22 = v10;
    sub_2523A8570(v10, v5, v6);
LABEL_5:
    unint64_t v11 = *(void *)(v0 + 8);
    uint64_t v12 = *(void *)(v0 + 24);
    swift_retain();
    sub_2523B9B30(v2, v3, v4);
    sub_2523B8B40(v22, v5, v6, v11, v12, 0, 0, 2);
    if (v1)
    {
      swift_release();
      sub_2523A8630(v22, v5, v6);
      return;
    }
    swift_bridgeObjectRetain();
    swift_release();
    sub_2523A8630(v22, v5, v6);
    sub_2523B9B1C(v22, v5, v6);
    if (!__OFADD__(v12, 1))
    {
      *(void *)(v0 + 24) = v12 + 1;
      *(void *)(v0 + 32) = 0;
      *(void *)(v0 + 40) = 0;
      *(unsigned char *)(v0 + 48) = -1;
      return;
    }
    __break(1u);
    goto LABEL_17;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
  uint64_t v13 = MEMORY[0x263F8D310];
  uint64_t v14 = sub_2523C75D8();
  swift_allocError();
  uint64_t v16 = v15;
  *int v15 = v13;
  unint64_t v17 = *(void *)(v0 + 8);
  uint64_t v18 = *(void *)(v0 + 24);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  *(void *)(v19 + 24) = v17;
  if (v17 >> 62)
  {
    uint64_t v20 = 0;
    if (v17 >> 62 != 1) {
      goto LABEL_14;
    }
    unint64_t v21 = (uint64_t *)((v17 & 0x3FFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    unint64_t v21 = (uint64_t *)(v17 + 64);
  }
  uint64_t v20 = *v21;
  swift_retain();
LABEL_14:
  if (!__OFADD__(v20, 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
    *(void *)(v19 + 32) = v20 + 1;
    swift_retain();
    sub_2523A7798(v19 | 0x4000000000000000);
    swift_release();
    sub_2523C75C8();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x263F8DCC0], v14);
    swift_willThrow();
    swift_release();
    return;
  }
LABEL_18:
  __break(1u);
}

void sub_2523BA160()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);
  int v4 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v22 = v2;
  unint64_t v5 = v3;
  char v6 = *(unsigned char *)(v0 + 48);
  if (v4 == 255)
  {
    uint64_t v7 = *(void *)(v0 + 16);
    uint64_t v8 = *(void *)(v0 + 24);
    if (v8 < *(void *)(v7 + 16))
    {
      if (v8 < 0)
      {
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v9 = v7 + 24 * v8;
      uint64_t v10 = *(void *)(v9 + 32);
      unint64_t v5 = *(void *)(v9 + 40);
      char v6 = *(unsigned char *)(v9 + 48);
      *(void *)(v0 + 32) = v10;
      *(void *)(v0 + 40) = v5;
      *(unsigned char *)(v0 + 48) = v6;
      sub_2523A8570(v10, v5, v6);
      uint64_t v22 = v10;
      sub_2523A8570(v10, v5, v6);
      goto LABEL_5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
    uint64_t v13 = MEMORY[0x263F8D538];
    uint64_t v14 = sub_2523C75D8();
    swift_allocError();
    uint64_t v16 = v15;
    *int v15 = v13;
    unint64_t v17 = *(void *)(v0 + 8);
    uint64_t v18 = *(void *)(v0 + 24);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v18;
    *(void *)(v19 + 24) = v17;
    if (v17 >> 62)
    {
      uint64_t v20 = 0;
      if (v17 >> 62 != 1)
      {
LABEL_13:
        if (__OFADD__(v20, 1))
        {
LABEL_18:
          __break(1u);
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
        *(void *)(v19 + 32) = v20 + 1;
        swift_retain();
        sub_2523A7798(v19 | 0x4000000000000000);
        swift_release();
        sub_2523C75C8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x263F8DCC0], v14);
        swift_willThrow();
        swift_release();
        return;
      }
      unint64_t v21 = (uint64_t *)((v17 & 0x3FFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      unint64_t v21 = (uint64_t *)(v17 + 64);
    }
    uint64_t v20 = *v21;
    swift_retain();
    goto LABEL_13;
  }
LABEL_5:
  unint64_t v11 = *(void *)(v0 + 8);
  uint64_t v12 = *(void *)(v0 + 24);
  swift_retain();
  sub_2523B9B30(v2, v3, v4);
  sub_2523ADBE4(v22, v5, v6, v11, v12, 0, 0, 2);
  swift_release();
  sub_2523A8630(v22, v5, v6);
  if (!v1)
  {
    sub_2523B9B1C(v22, v5, v6);
    if (!__OFADD__(v12, 1))
    {
      *(void *)(v0 + 24) = v12 + 1;
      *(void *)(v0 + 32) = 0;
      *(void *)(v0 + 40) = 0;
      *(unsigned char *)(v0 + 48) = -1;
      return;
    }
    __break(1u);
    goto LABEL_17;
  }
}

void sub_2523BA460()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);
  int v4 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v22 = v2;
  unint64_t v5 = v3;
  char v6 = *(unsigned char *)(v0 + 48);
  if (v4 == 255)
  {
    uint64_t v7 = *(void *)(v0 + 16);
    uint64_t v8 = *(void *)(v0 + 24);
    if (v8 < *(void *)(v7 + 16))
    {
      if (v8 < 0)
      {
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v9 = v7 + 24 * v8;
      uint64_t v10 = *(void *)(v9 + 32);
      unint64_t v5 = *(void *)(v9 + 40);
      char v6 = *(unsigned char *)(v9 + 48);
      *(void *)(v0 + 32) = v10;
      *(void *)(v0 + 40) = v5;
      *(unsigned char *)(v0 + 48) = v6;
      sub_2523A8570(v10, v5, v6);
      uint64_t v22 = v10;
      sub_2523A8570(v10, v5, v6);
      goto LABEL_5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
    uint64_t v13 = MEMORY[0x263F8D5C8];
    uint64_t v14 = sub_2523C75D8();
    swift_allocError();
    uint64_t v16 = v15;
    *int v15 = v13;
    unint64_t v17 = *(void *)(v0 + 8);
    uint64_t v18 = *(void *)(v0 + 24);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v18;
    *(void *)(v19 + 24) = v17;
    if (v17 >> 62)
    {
      uint64_t v20 = 0;
      if (v17 >> 62 != 1)
      {
LABEL_13:
        if (__OFADD__(v20, 1))
        {
LABEL_18:
          __break(1u);
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
        *(void *)(v19 + 32) = v20 + 1;
        swift_retain();
        sub_2523A7798(v19 | 0x4000000000000000);
        swift_release();
        sub_2523C75C8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x263F8DCC0], v14);
        swift_willThrow();
        swift_release();
        return;
      }
      unint64_t v21 = (uint64_t *)((v17 & 0x3FFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      unint64_t v21 = (uint64_t *)(v17 + 64);
    }
    uint64_t v20 = *v21;
    swift_retain();
    goto LABEL_13;
  }
LABEL_5:
  unint64_t v11 = *(void *)(v0 + 8);
  uint64_t v12 = *(void *)(v0 + 24);
  swift_retain();
  sub_2523B9B30(v2, v3, v4);
  sub_2523AE1D0(v22, v5, v6, v11, v12, 0, 0, 2);
  swift_release();
  sub_2523A8630(v22, v5, v6);
  if (!v1)
  {
    sub_2523B9B1C(v22, v5, v6);
    if (!__OFADD__(v12, 1))
    {
      *(void *)(v0 + 24) = v12 + 1;
      *(void *)(v0 + 32) = 0;
      *(void *)(v0 + 40) = 0;
      *(unsigned char *)(v0 + 48) = -1;
      return;
    }
    __break(1u);
    goto LABEL_17;
  }
}

void sub_2523BA760()
{
  uint64_t v2 = v0;
  uint64_t v3 = *(void *)(v0 + 32);
  unint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v6 = v3;
  unint64_t v7 = v4;
  uint64_t v8 = v5;
  if (v5 == 255)
  {
    uint64_t v9 = *(void *)(v0 + 16);
    uint64_t v10 = *(void *)(v0 + 24);
    if (v10 < *(void *)(v9 + 16))
    {
      if (v10 < 0)
      {
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v11 = v9 + 24 * v10;
      uint64_t v6 = *(void *)(v11 + 32);
      unint64_t v7 = *(void *)(v11 + 40);
      uint64_t v8 = *(unsigned __int8 *)(v11 + 48);
      *(void *)(v0 + 32) = v6;
      *(void *)(v0 + 40) = v7;
      *(unsigned char *)(v0 + 48) = v8;
      sub_2523A8570(v6, v7, v8);
      sub_2523A8570(v6, v7, v8);
      goto LABEL_5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
    uint64_t v13 = MEMORY[0x263F8D6C8];
    uint64_t v14 = sub_2523C75D8();
    swift_allocError();
    uint64_t v16 = v15;
    *int v15 = v13;
    unint64_t v17 = *(void *)(v2 + 8);
    uint64_t v18 = *(void *)(v2 + 24);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v18;
    *(void *)(v19 + 24) = v17;
    if (v17 >> 62)
    {
      uint64_t v20 = 0;
      if (v17 >> 62 != 1)
      {
LABEL_13:
        if (__OFADD__(v20, 1))
        {
LABEL_18:
          __break(1u);
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
        *(void *)(v19 + 32) = v20 + 1;
        swift_retain();
        sub_2523A7798(v19 | 0x4000000000000000);
        swift_release();
        sub_2523C75C8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x263F8DCC0], v14);
        swift_willThrow();
        swift_release();
        return;
      }
      unint64_t v21 = (uint64_t *)((v17 & 0x3FFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      unint64_t v21 = (uint64_t *)(v17 + 64);
    }
    uint64_t v20 = *v21;
    swift_retain();
    goto LABEL_13;
  }
LABEL_5:
  unint64_t v22 = *(void *)(v0 + 8);
  uint64_t v12 = *(void *)(v0 + 24);
  swift_retain();
  sub_2523B9B30(v3, v4, v5);
  sub_2523AFB48(v6, v7, v8, v22, v12, 0, 0, 2, MEMORY[0x263F8D6C8], (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2523ABD40);
  swift_release();
  sub_2523A8630(v6, v7, v8);
  if (!v1)
  {
    sub_2523B9B1C(v6, v7, v8);
    if (!__OFADD__(v12, 1))
    {
      *(void *)(v0 + 24) = v12 + 1;
      *(void *)(v0 + 32) = 0;
      *(void *)(v0 + 40) = 0;
      *(unsigned char *)(v0 + 48) = -1;
      return;
    }
    __break(1u);
    goto LABEL_17;
  }
}

void sub_2523BAA80()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);
  int v4 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v22 = v2;
  unint64_t v5 = v3;
  char v6 = *(unsigned char *)(v0 + 48);
  if (v4 == 255)
  {
    uint64_t v7 = *(void *)(v0 + 16);
    uint64_t v8 = *(void *)(v0 + 24);
    if (v8 < *(void *)(v7 + 16))
    {
      if (v8 < 0)
      {
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v9 = v7 + 24 * v8;
      uint64_t v10 = *(void *)(v9 + 32);
      unint64_t v5 = *(void *)(v9 + 40);
      char v6 = *(unsigned char *)(v9 + 48);
      *(void *)(v0 + 32) = v10;
      *(void *)(v0 + 40) = v5;
      *(unsigned char *)(v0 + 48) = v6;
      sub_2523A8570(v10, v5, v6);
      uint64_t v22 = v10;
      sub_2523A8570(v10, v5, v6);
      goto LABEL_5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
    uint64_t v13 = MEMORY[0x263F8E498];
    uint64_t v14 = sub_2523C75D8();
    swift_allocError();
    uint64_t v16 = v15;
    *int v15 = v13;
    unint64_t v17 = *(void *)(v0 + 8);
    uint64_t v18 = *(void *)(v0 + 24);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v18;
    *(void *)(v19 + 24) = v17;
    if (v17 >> 62)
    {
      uint64_t v20 = 0;
      if (v17 >> 62 != 1)
      {
LABEL_13:
        if (__OFADD__(v20, 1))
        {
LABEL_18:
          __break(1u);
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
        *(void *)(v19 + 32) = v20 + 1;
        swift_retain();
        sub_2523A7798(v19 | 0x4000000000000000);
        swift_release();
        sub_2523C75C8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x263F8DCC0], v14);
        swift_willThrow();
        swift_release();
        return;
      }
      unint64_t v21 = (uint64_t *)((v17 & 0x3FFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      unint64_t v21 = (uint64_t *)(v17 + 64);
    }
    uint64_t v20 = *v21;
    swift_retain();
    goto LABEL_13;
  }
LABEL_5:
  unint64_t v11 = *(void *)(v0 + 8);
  uint64_t v12 = *(void *)(v0 + 24);
  swift_retain();
  sub_2523B9B30(v2, v3, v4);
  sub_2523AF130(v22, v5, v6, v11, v12, 0, 0, 2);
  swift_release();
  sub_2523A8630(v22, v5, v6);
  if (!v1)
  {
    sub_2523B9B1C(v22, v5, v6);
    if (!__OFADD__(v12, 1))
    {
      *(void *)(v0 + 24) = v12 + 1;
      *(void *)(v0 + 32) = 0;
      *(void *)(v0 + 40) = 0;
      *(unsigned char *)(v0 + 48) = -1;
      return;
    }
    __break(1u);
    goto LABEL_17;
  }
}

void sub_2523BAD78()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);
  int v4 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v22 = v2;
  unint64_t v5 = v3;
  char v6 = *(unsigned char *)(v0 + 48);
  if (v4 == 255)
  {
    uint64_t v7 = *(void *)(v0 + 16);
    uint64_t v8 = *(void *)(v0 + 24);
    if (v8 < *(void *)(v7 + 16))
    {
      if (v8 < 0)
      {
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v9 = v7 + 24 * v8;
      uint64_t v10 = *(void *)(v9 + 32);
      unint64_t v5 = *(void *)(v9 + 40);
      char v6 = *(unsigned char *)(v9 + 48);
      *(void *)(v0 + 32) = v10;
      *(void *)(v0 + 40) = v5;
      *(unsigned char *)(v0 + 48) = v6;
      sub_2523A8570(v10, v5, v6);
      uint64_t v22 = v10;
      sub_2523A8570(v10, v5, v6);
      goto LABEL_5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
    uint64_t v13 = MEMORY[0x263F8E4F0];
    uint64_t v14 = sub_2523C75D8();
    swift_allocError();
    uint64_t v16 = v15;
    *int v15 = v13;
    unint64_t v17 = *(void *)(v0 + 8);
    uint64_t v18 = *(void *)(v0 + 24);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v18;
    *(void *)(v19 + 24) = v17;
    if (v17 >> 62)
    {
      uint64_t v20 = 0;
      if (v17 >> 62 != 1)
      {
LABEL_13:
        if (__OFADD__(v20, 1))
        {
LABEL_18:
          __break(1u);
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
        *(void *)(v19 + 32) = v20 + 1;
        swift_retain();
        sub_2523A7798(v19 | 0x4000000000000000);
        swift_release();
        sub_2523C75C8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x263F8DCC0], v14);
        swift_willThrow();
        swift_release();
        return;
      }
      unint64_t v21 = (uint64_t *)((v17 & 0x3FFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      unint64_t v21 = (uint64_t *)(v17 + 64);
    }
    uint64_t v20 = *v21;
    swift_retain();
    goto LABEL_13;
  }
LABEL_5:
  unint64_t v11 = *(void *)(v0 + 8);
  uint64_t v12 = *(void *)(v0 + 24);
  swift_retain();
  sub_2523B9B30(v2, v3, v4);
  sub_2523AF488(v22, v5, v6, v11, v12, 0, 0, 2);
  swift_release();
  sub_2523A8630(v22, v5, v6);
  if (!v1)
  {
    sub_2523B9B1C(v22, v5, v6);
    if (!__OFADD__(v12, 1))
    {
      *(void *)(v0 + 24) = v12 + 1;
      *(void *)(v0 + 32) = 0;
      *(void *)(v0 + 40) = 0;
      *(unsigned char *)(v0 + 48) = -1;
      return;
    }
    __break(1u);
    goto LABEL_17;
  }
}

void sub_2523BB070()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);
  int v4 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v22 = v2;
  unint64_t v5 = v3;
  char v6 = *(unsigned char *)(v0 + 48);
  if (v4 == 255)
  {
    uint64_t v7 = *(void *)(v0 + 16);
    uint64_t v8 = *(void *)(v0 + 24);
    if (v8 < *(void *)(v7 + 16))
    {
      if (v8 < 0)
      {
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v9 = v7 + 24 * v8;
      uint64_t v10 = *(void *)(v9 + 32);
      unint64_t v5 = *(void *)(v9 + 40);
      char v6 = *(unsigned char *)(v9 + 48);
      *(void *)(v0 + 32) = v10;
      *(void *)(v0 + 40) = v5;
      *(unsigned char *)(v0 + 48) = v6;
      sub_2523A8570(v10, v5, v6);
      uint64_t v22 = v10;
      sub_2523A8570(v10, v5, v6);
      goto LABEL_5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
    uint64_t v13 = MEMORY[0x263F8E548];
    uint64_t v14 = sub_2523C75D8();
    swift_allocError();
    uint64_t v16 = v15;
    *int v15 = v13;
    unint64_t v17 = *(void *)(v0 + 8);
    uint64_t v18 = *(void *)(v0 + 24);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v18;
    *(void *)(v19 + 24) = v17;
    if (v17 >> 62)
    {
      uint64_t v20 = 0;
      if (v17 >> 62 != 1)
      {
LABEL_13:
        if (__OFADD__(v20, 1))
        {
LABEL_18:
          __break(1u);
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
        *(void *)(v19 + 32) = v20 + 1;
        swift_retain();
        sub_2523A7798(v19 | 0x4000000000000000);
        swift_release();
        sub_2523C75C8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x263F8DCC0], v14);
        swift_willThrow();
        swift_release();
        return;
      }
      unint64_t v21 = (uint64_t *)((v17 & 0x3FFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      unint64_t v21 = (uint64_t *)(v17 + 64);
    }
    uint64_t v20 = *v21;
    swift_retain();
    goto LABEL_13;
  }
LABEL_5:
  unint64_t v11 = *(void *)(v0 + 8);
  uint64_t v12 = *(void *)(v0 + 24);
  swift_retain();
  sub_2523B9B30(v2, v3, v4);
  sub_2523AF7E8(v22, v5, v6, v11, v12, 0, 0, 2);
  swift_release();
  sub_2523A8630(v22, v5, v6);
  if (!v1)
  {
    sub_2523B9B1C(v22, v5, v6);
    if (!__OFADD__(v12, 1))
    {
      *(void *)(v0 + 24) = v12 + 1;
      *(void *)(v0 + 32) = 0;
      *(void *)(v0 + 40) = 0;
      *(unsigned char *)(v0 + 48) = -1;
      return;
    }
    __break(1u);
    goto LABEL_17;
  }
}

void sub_2523BB368()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v5 = v2;
  unint64_t v6 = v3;
  uint64_t v7 = v4;
  if (v4 == 255)
  {
    uint64_t v8 = *(void *)(v0 + 16);
    uint64_t v9 = *(void *)(v0 + 24);
    if (v9 < *(void *)(v8 + 16))
    {
      if (v9 < 0)
      {
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v10 = v8 + 24 * v9;
      uint64_t v5 = *(void *)(v10 + 32);
      unint64_t v6 = *(void *)(v10 + 40);
      uint64_t v7 = *(unsigned __int8 *)(v10 + 48);
      *(void *)(v0 + 32) = v5;
      *(void *)(v0 + 40) = v6;
      *(unsigned char *)(v0 + 48) = v7;
      sub_2523A8570(v5, v6, v7);
      sub_2523A8570(v5, v6, v7);
      goto LABEL_5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
    uint64_t v12 = MEMORY[0x263F8E5C0];
    uint64_t v13 = sub_2523C75D8();
    swift_allocError();
    int v15 = v14;
    *uint64_t v14 = v12;
    unint64_t v16 = *(void *)(v0 + 8);
    uint64_t v17 = *(void *)(v0 + 24);
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v17;
    *(void *)(v18 + 24) = v16;
    if (v16 >> 62)
    {
      uint64_t v19 = 0;
      if (v16 >> 62 != 1)
      {
LABEL_13:
        if (__OFADD__(v19, 1))
        {
LABEL_18:
          __break(1u);
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
        *(void *)(v18 + 32) = v19 + 1;
        swift_retain();
        sub_2523A7798(v18 | 0x4000000000000000);
        swift_release();
        sub_2523C75C8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCC0], v13);
        swift_willThrow();
        swift_release();
        return;
      }
      uint64_t v20 = (uint64_t *)((v16 & 0x3FFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      uint64_t v20 = (uint64_t *)(v16 + 64);
    }
    uint64_t v19 = *v20;
    swift_retain();
    goto LABEL_13;
  }
LABEL_5:
  unint64_t v21 = *(void *)(v0 + 8);
  uint64_t v11 = *(void *)(v0 + 24);
  swift_retain();
  sub_2523B9B30(v2, v3, v4);
  sub_2523AFB48(v5, v6, v7, v21, v11, 0, 0, 2, MEMORY[0x263F8E5C0], (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2523AC2A0);
  swift_release();
  sub_2523A8630(v5, v6, v7);
  if (!v1)
  {
    sub_2523B9B1C(v5, v6, v7);
    if (!__OFADD__(v11, 1))
    {
      *(void *)(v0 + 24) = v11 + 1;
      *(void *)(v0 + 32) = 0;
      *(void *)(v0 + 40) = 0;
      *(unsigned char *)(v0 + 48) = -1;
      return;
    }
    __break(1u);
    goto LABEL_17;
  }
}

void sub_2523BB68C()
{
  uint64_t v2 = v0;
  uint64_t v3 = *(void *)(v0 + 32);
  unint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v6 = v3;
  unint64_t v7 = v4;
  uint64_t v8 = v5;
  if (v5 == 255)
  {
    uint64_t v9 = *(void *)(v0 + 16);
    uint64_t v10 = *(void *)(v0 + 24);
    if (v10 < *(void *)(v9 + 16))
    {
      if (v10 < 0)
      {
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v11 = v9 + 24 * v10;
      uint64_t v6 = *(void *)(v11 + 32);
      unint64_t v7 = *(void *)(v11 + 40);
      uint64_t v8 = *(unsigned __int8 *)(v11 + 48);
      *(void *)(v0 + 32) = v6;
      *(void *)(v0 + 40) = v7;
      *(unsigned char *)(v0 + 48) = v8;
      sub_2523A8570(v6, v7, v8);
      sub_2523A8570(v6, v7, v8);
      goto LABEL_5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
    uint64_t v13 = MEMORY[0x263F8D9D0];
    uint64_t v14 = sub_2523C75D8();
    swift_allocError();
    unint64_t v16 = v15;
    *int v15 = v13;
    unint64_t v17 = *(void *)(v2 + 8);
    uint64_t v18 = *(void *)(v2 + 24);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v18;
    *(void *)(v19 + 24) = v17;
    if (v17 >> 62)
    {
      uint64_t v20 = 0;
      if (v17 >> 62 != 1)
      {
LABEL_13:
        if (__OFADD__(v20, 1))
        {
LABEL_18:
          __break(1u);
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
        *(void *)(v19 + 32) = v20 + 1;
        swift_retain();
        sub_2523A7798(v19 | 0x4000000000000000);
        swift_release();
        sub_2523C75C8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x263F8DCC0], v14);
        swift_willThrow();
        swift_release();
        return;
      }
      unint64_t v21 = (uint64_t *)((v17 & 0x3FFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      unint64_t v21 = (uint64_t *)(v17 + 64);
    }
    uint64_t v20 = *v21;
    swift_retain();
    goto LABEL_13;
  }
LABEL_5:
  unint64_t v22 = *(void *)(v0 + 8);
  uint64_t v12 = *(void *)(v0 + 24);
  swift_retain();
  sub_2523B9B30(v3, v4, v5);
  sub_2523B145C(v6, v7, v8, v22, v12, 0, 0, 2, MEMORY[0x263F8D9D0], (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2523AC3F8);
  swift_release();
  sub_2523A8630(v6, v7, v8);
  if (!v1)
  {
    sub_2523B9B1C(v6, v7, v8);
    if (!__OFADD__(v12, 1))
    {
      *(void *)(v0 + 24) = v12 + 1;
      *(void *)(v0 + 32) = 0;
      *(void *)(v0 + 40) = 0;
      *(unsigned char *)(v0 + 48) = -1;
      return;
    }
    __break(1u);
    goto LABEL_17;
  }
}

void sub_2523BB9AC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);
  int v4 = *(unsigned __int8 *)(v0 + 48);
  unint64_t v22 = v2;
  unint64_t v5 = v3;
  char v6 = *(unsigned char *)(v0 + 48);
  if (v4 == 255)
  {
    uint64_t v7 = *(void *)(v0 + 16);
    uint64_t v8 = *(void *)(v0 + 24);
    if (v8 < *(void *)(v7 + 16))
    {
      if (v8 < 0)
      {
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v9 = v7 + 24 * v8;
      uint64_t v10 = *(void *)(v9 + 32);
      unint64_t v5 = *(void *)(v9 + 40);
      char v6 = *(unsigned char *)(v9 + 48);
      *(void *)(v0 + 32) = v10;
      *(void *)(v0 + 40) = v5;
      *(unsigned char *)(v0 + 48) = v6;
      sub_2523A8570(v10, v5, v6);
      unint64_t v22 = v10;
      sub_2523A8570(v10, v5, v6);
      goto LABEL_5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
    uint64_t v13 = MEMORY[0x263F8E778];
    uint64_t v14 = sub_2523C75D8();
    swift_allocError();
    unint64_t v16 = v15;
    *int v15 = v13;
    unint64_t v17 = *(void *)(v0 + 8);
    uint64_t v18 = *(void *)(v0 + 24);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v18;
    *(void *)(v19 + 24) = v17;
    if (v17 >> 62)
    {
      uint64_t v20 = 0;
      if (v17 >> 62 != 1)
      {
LABEL_13:
        if (__OFADD__(v20, 1))
        {
LABEL_18:
          __break(1u);
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
        *(void *)(v19 + 32) = v20 + 1;
        swift_retain();
        sub_2523A7798(v19 | 0x4000000000000000);
        swift_release();
        sub_2523C75C8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x263F8DCC0], v14);
        swift_willThrow();
        swift_release();
        return;
      }
      unint64_t v21 = (uint64_t *)((v17 & 0x3FFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      unint64_t v21 = (uint64_t *)(v17 + 64);
    }
    uint64_t v20 = *v21;
    swift_retain();
    goto LABEL_13;
  }
LABEL_5:
  unint64_t v11 = *(void *)(v0 + 8);
  uint64_t v12 = *(void *)(v0 + 24);
  swift_retain();
  sub_2523B9B30(v2, v3, v4);
  sub_2523B0A3C(v22, v5, v6, v11, v12, 0, 0, 2);
  swift_release();
  sub_2523A8630(v22, v5, v6);
  if (!v1)
  {
    sub_2523B9B1C(v22, v5, v6);
    if (!__OFADD__(v12, 1))
    {
      *(void *)(v0 + 24) = v12 + 1;
      *(void *)(v0 + 32) = 0;
      *(void *)(v0 + 40) = 0;
      *(unsigned char *)(v0 + 48) = -1;
      return;
    }
    __break(1u);
    goto LABEL_17;
  }
}

void sub_2523BBCA4()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);
  int v4 = *(unsigned __int8 *)(v0 + 48);
  unint64_t v22 = v2;
  unint64_t v5 = v3;
  char v6 = *(unsigned char *)(v0 + 48);
  if (v4 == 255)
  {
    uint64_t v7 = *(void *)(v0 + 16);
    uint64_t v8 = *(void *)(v0 + 24);
    if (v8 < *(void *)(v7 + 16))
    {
      if (v8 < 0)
      {
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v9 = v7 + 24 * v8;
      uint64_t v10 = *(void *)(v9 + 32);
      unint64_t v5 = *(void *)(v9 + 40);
      char v6 = *(unsigned char *)(v9 + 48);
      *(void *)(v0 + 32) = v10;
      *(void *)(v0 + 40) = v5;
      *(unsigned char *)(v0 + 48) = v6;
      sub_2523A8570(v10, v5, v6);
      unint64_t v22 = v10;
      sub_2523A8570(v10, v5, v6);
      goto LABEL_5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
    uint64_t v13 = MEMORY[0x263F8E888];
    uint64_t v14 = sub_2523C75D8();
    swift_allocError();
    unint64_t v16 = v15;
    *int v15 = v13;
    unint64_t v17 = *(void *)(v0 + 8);
    uint64_t v18 = *(void *)(v0 + 24);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v18;
    *(void *)(v19 + 24) = v17;
    if (v17 >> 62)
    {
      uint64_t v20 = 0;
      if (v17 >> 62 != 1)
      {
LABEL_13:
        if (__OFADD__(v20, 1))
        {
LABEL_18:
          __break(1u);
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
        *(void *)(v19 + 32) = v20 + 1;
        swift_retain();
        sub_2523A7798(v19 | 0x4000000000000000);
        swift_release();
        sub_2523C75C8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x263F8DCC0], v14);
        swift_willThrow();
        swift_release();
        return;
      }
      unint64_t v21 = (uint64_t *)((v17 & 0x3FFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      unint64_t v21 = (uint64_t *)(v17 + 64);
    }
    uint64_t v20 = *v21;
    swift_retain();
    goto LABEL_13;
  }
LABEL_5:
  unint64_t v11 = *(void *)(v0 + 8);
  uint64_t v12 = *(void *)(v0 + 24);
  swift_retain();
  sub_2523B9B30(v2, v3, v4);
  sub_2523B0D9C(v22, v5, v6, v11, v12, 0, 0, 2);
  swift_release();
  sub_2523A8630(v22, v5, v6);
  if (!v1)
  {
    sub_2523B9B1C(v22, v5, v6);
    if (!__OFADD__(v12, 1))
    {
      *(void *)(v0 + 24) = v12 + 1;
      *(void *)(v0 + 32) = 0;
      *(void *)(v0 + 40) = 0;
      *(unsigned char *)(v0 + 48) = -1;
      return;
    }
    __break(1u);
    goto LABEL_17;
  }
}

void sub_2523BBF9C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);
  int v4 = *(unsigned __int8 *)(v0 + 48);
  unint64_t v22 = v2;
  unint64_t v5 = v3;
  char v6 = *(unsigned char *)(v0 + 48);
  if (v4 == 255)
  {
    uint64_t v7 = *(void *)(v0 + 16);
    uint64_t v8 = *(void *)(v0 + 24);
    if (v8 < *(void *)(v7 + 16))
    {
      if (v8 < 0)
      {
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v9 = v7 + 24 * v8;
      uint64_t v10 = *(void *)(v9 + 32);
      unint64_t v5 = *(void *)(v9 + 40);
      char v6 = *(unsigned char *)(v9 + 48);
      *(void *)(v0 + 32) = v10;
      *(void *)(v0 + 40) = v5;
      *(unsigned char *)(v0 + 48) = v6;
      sub_2523A8570(v10, v5, v6);
      unint64_t v22 = v10;
      sub_2523A8570(v10, v5, v6);
      goto LABEL_5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
    uint64_t v13 = MEMORY[0x263F8E8F8];
    uint64_t v14 = sub_2523C75D8();
    swift_allocError();
    unint64_t v16 = v15;
    *int v15 = v13;
    unint64_t v17 = *(void *)(v0 + 8);
    uint64_t v18 = *(void *)(v0 + 24);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v18;
    *(void *)(v19 + 24) = v17;
    if (v17 >> 62)
    {
      uint64_t v20 = 0;
      if (v17 >> 62 != 1)
      {
LABEL_13:
        if (__OFADD__(v20, 1))
        {
LABEL_18:
          __break(1u);
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
        *(void *)(v19 + 32) = v20 + 1;
        swift_retain();
        sub_2523A7798(v19 | 0x4000000000000000);
        swift_release();
        sub_2523C75C8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x263F8DCC0], v14);
        swift_willThrow();
        swift_release();
        return;
      }
      unint64_t v21 = (uint64_t *)((v17 & 0x3FFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      unint64_t v21 = (uint64_t *)(v17 + 64);
    }
    uint64_t v20 = *v21;
    swift_retain();
    goto LABEL_13;
  }
LABEL_5:
  unint64_t v11 = *(void *)(v0 + 8);
  uint64_t v12 = *(void *)(v0 + 24);
  swift_retain();
  sub_2523B9B30(v2, v3, v4);
  sub_2523B10FC(v22, v5, v6, v11, v12, 0, 0, 2);
  swift_release();
  sub_2523A8630(v22, v5, v6);
  if (!v1)
  {
    sub_2523B9B1C(v22, v5, v6);
    if (!__OFADD__(v12, 1))
    {
      *(void *)(v0 + 24) = v12 + 1;
      *(void *)(v0 + 32) = 0;
      *(void *)(v0 + 40) = 0;
      *(unsigned char *)(v0 + 48) = -1;
      return;
    }
    __break(1u);
    goto LABEL_17;
  }
}

void sub_2523BC294()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v5 = v2;
  unint64_t v6 = v3;
  uint64_t v7 = v4;
  if (v4 == 255)
  {
    uint64_t v8 = *(void *)(v0 + 16);
    uint64_t v9 = *(void *)(v0 + 24);
    if (v9 < *(void *)(v8 + 16))
    {
      if (v9 < 0)
      {
LABEL_17:
        __break(1u);
        goto LABEL_18;
      }
      uint64_t v10 = v8 + 24 * v9;
      uint64_t v5 = *(void *)(v10 + 32);
      unint64_t v6 = *(void *)(v10 + 40);
      uint64_t v7 = *(unsigned __int8 *)(v10 + 48);
      *(void *)(v0 + 32) = v5;
      *(void *)(v0 + 40) = v6;
      *(unsigned char *)(v0 + 48) = v7;
      sub_2523A8570(v5, v6, v7);
      sub_2523A8570(v5, v6, v7);
      goto LABEL_5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
    uint64_t v12 = MEMORY[0x263F8E970];
    uint64_t v13 = sub_2523C75D8();
    swift_allocError();
    int v15 = v14;
    *uint64_t v14 = v12;
    unint64_t v16 = *(void *)(v0 + 8);
    uint64_t v17 = *(void *)(v0 + 24);
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v17;
    *(void *)(v18 + 24) = v16;
    if (v16 >> 62)
    {
      uint64_t v19 = 0;
      if (v16 >> 62 != 1)
      {
LABEL_13:
        if (__OFADD__(v19, 1))
        {
LABEL_18:
          __break(1u);
          return;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E70);
        *(void *)(v18 + 32) = v19 + 1;
        swift_retain();
        sub_2523A7798(v18 | 0x4000000000000000);
        swift_release();
        sub_2523C75C8();
        (*(void (**)(void *, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCC0], v13);
        swift_willThrow();
        swift_release();
        return;
      }
      uint64_t v20 = (uint64_t *)((v16 & 0x3FFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      uint64_t v20 = (uint64_t *)(v16 + 64);
    }
    uint64_t v19 = *v20;
    swift_retain();
    goto LABEL_13;
  }
LABEL_5:
  unint64_t v21 = *(void *)(v0 + 8);
  uint64_t v11 = *(void *)(v0 + 24);
  swift_retain();
  sub_2523B9B30(v2, v3, v4);
  sub_2523B145C(v5, v6, v7, v21, v11, 0, 0, 2, MEMORY[0x263F8E970], (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2523AC958);
  swift_release();
  sub_2523A8630(v5, v6, v7);
  if (!v1)
  {
    sub_2523B9B1C(v5, v6, v7);
    if (!__OFADD__(v11, 1))
    {
      *(void *)(v0 + 24) = v11 + 1;
      *(void *)(v0 + 32) = 0;
      *(void *)(v0 + 40) = 0;
      *(unsigned char *)(v0 + 48) = -1;
      return;
    }
    __break(1u);
    goto LABEL_17;
  }
}

uint64_t sub_2523BC5B8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2523BC614(uint64_t a1)
{
  return a1;
}

unint64_t sub_2523BC644(uint64_t a1, char a2)
{
  int v4 = a2 & 1;
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v7 = __ROR8__(a1, 32);
    if (a2) {
      uint64_t v7 = a1;
    }
    uint64_t v8 = (char *)(v5 + 64);
    while (1)
    {
      uint64_t v9 = __ROR8__(*((void *)v8 - 4), 32);
      uint64_t v10 = *((void *)v8 - 4);
      if (!*(v8 - 24)) {
        uint64_t v10 = v9;
      }
      if (v10 == v7) {
        break;
      }
      v8 += 40;
      if (!--v6) {
        goto LABEL_9;
      }
    }
    uint64_t v15 = *((void *)v8 - 2);
    unint64_t v16 = *((void *)v8 - 1);
    unint64_t v14 = *(void *)(v2 + 8);
    char v17 = *v8;
    sub_2523A8570(v15, v16, *v8);
    LOBYTE(v14) = sub_2523AD944(v15, v16, v17, v14, a1, v4);
    sub_2523A8630(v15, v16, v17);
  }
  else
  {
LABEL_9:
    uint64_t v11 = sub_2523C75D8();
    swift_allocError();
    uint64_t v13 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E98);
    *(void *)(v13 + 24) = &_s3TagO14CodingKeyProxyVN;
    *(void *)(v13 + 32) = sub_2523A7384();
    *(void *)uint64_t v13 = a1;
    *(unsigned char *)(v13 + 8) = v4 != 0;
    sub_2523A7798(*(void *)(v2 + 8));
    sub_2523C7598();
    swift_bridgeObjectRelease();
    v19[0] = 0xD00000000000001DLL;
    v19[1] = 0x80000002523CAE10;
    sub_2523A6BC4(a1, v4);
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523A6B70();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    unint64_t v14 = (unint64_t)v19;
    sub_2523C7488();
    sub_2523C75C8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCA8], v11);
    swift_willThrow();
  }
  return v14 & 1;
}

void *sub_2523BC8CC(uint64_t a1, char a2)
{
  int v5 = a2 & 1;
  uint64_t v6 = v2[2];
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v8 = __ROR8__(a1, 32);
    if (a2) {
      uint64_t v8 = a1;
    }
    uint64_t v9 = (char *)(v6 + 64);
    while (1)
    {
      uint64_t v10 = __ROR8__(*((void *)v9 - 4), 32);
      uint64_t v11 = *((void *)v9 - 4);
      if (!*(v9 - 24)) {
        uint64_t v11 = v10;
      }
      if (v11 == v8) {
        break;
      }
      v9 += 40;
      if (!--v7) {
        goto LABEL_9;
      }
    }
    uint64_t v16 = *((void *)v9 - 2);
    unint64_t v17 = *((void *)v9 - 1);
    char v18 = *v9;
    uint64_t v20 = (void *)*v2;
    unint64_t v19 = v2[1];
    sub_2523A8570(v16, v17, *v9);
    unint64_t v21 = v19;
    uint64_t v15 = v20;
    uint64_t v22 = sub_2523B8F24(v16, v17, v18, v21, a1, v5);
    if (!v3)
    {
      uint64_t v15 = (void *)v22;
      swift_bridgeObjectRetain();
    }
    sub_2523A8630(v16, v17, v18);
  }
  else
  {
LABEL_9:
    uint64_t v12 = sub_2523C75D8();
    swift_allocError();
    uint64_t v14 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E98);
    *(void *)(v14 + 24) = &_s3TagO14CodingKeyProxyVN;
    *(void *)(v14 + 32) = sub_2523A7384();
    *(void *)uint64_t v14 = a1;
    *(unsigned char *)(v14 + 8) = v5 != 0;
    sub_2523A7798(v2[1]);
    sub_2523C7598();
    swift_bridgeObjectRelease();
    v24[0] = 0xD00000000000001DLL;
    v24[1] = 0x80000002523CAE10;
    sub_2523A6BC4(a1, v5);
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523A6B70();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    uint64_t v15 = v24;
    sub_2523C7488();
    sub_2523C75C8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v12 - 8) + 104))(v14, *MEMORY[0x263F8DCA8], v12);
    swift_willThrow();
  }
  return v15;
}

double sub_2523BCB78(uint64_t a1, char a2)
{
  int v5 = a2 & 1;
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v8 = __ROR8__(a1, 32);
    if (a2) {
      uint64_t v8 = a1;
    }
    uint64_t v9 = (char *)(v6 + 64);
    while (1)
    {
      uint64_t v10 = __ROR8__(*((void *)v9 - 4), 32);
      uint64_t v11 = *((void *)v9 - 4);
      if (!*(v9 - 24)) {
        uint64_t v11 = v10;
      }
      if (v11 == v8) {
        break;
      }
      v9 += 40;
      if (!--v7) {
        goto LABEL_9;
      }
    }
    uint64_t v15 = *((void *)v9 - 2);
    unint64_t v16 = *((void *)v9 - 1);
    unint64_t v17 = *(void *)(v2 + 8);
    char v18 = *v9;
    sub_2523A8570(v15, v16, *v9);
    double v3 = sub_2523ADEFC(v15, v16, v18, v17, a1, v5);
    sub_2523A8630(v15, v16, v18);
  }
  else
  {
LABEL_9:
    uint64_t v12 = sub_2523C75D8();
    swift_allocError();
    uint64_t v14 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E98);
    *(void *)(v14 + 24) = &_s3TagO14CodingKeyProxyVN;
    *(void *)(v14 + 32) = sub_2523A7384();
    *(void *)uint64_t v14 = a1;
    *(unsigned char *)(v14 + 8) = v5 != 0;
    sub_2523A7798(*(void *)(v2 + 8));
    sub_2523C7598();
    swift_bridgeObjectRelease();
    sub_2523A6BC4(a1, v5);
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523A6B70();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523C75C8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v12 - 8) + 104))(v14, *MEMORY[0x263F8DCA8], v12);
    swift_willThrow();
  }
  return v3;
}

float sub_2523BCE08(uint64_t a1, char a2)
{
  int v5 = a2 & 1;
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v8 = __ROR8__(a1, 32);
    if (a2) {
      uint64_t v8 = a1;
    }
    uint64_t v9 = (char *)(v6 + 64);
    while (1)
    {
      uint64_t v10 = __ROR8__(*((void *)v9 - 4), 32);
      uint64_t v11 = *((void *)v9 - 4);
      if (!*(v9 - 24)) {
        uint64_t v11 = v10;
      }
      if (v11 == v8) {
        break;
      }
      v9 += 40;
      if (!--v7) {
        goto LABEL_9;
      }
    }
    uint64_t v15 = *((void *)v9 - 2);
    unint64_t v16 = *((void *)v9 - 1);
    unint64_t v17 = *(void *)(v2 + 8);
    char v18 = *v9;
    sub_2523A8570(v15, v16, *v9);
    sub_2523AE4B8(v15, v16, v18, v17, a1, v5);
    float v3 = v19;
    sub_2523A8630(v15, v16, v18);
  }
  else
  {
LABEL_9:
    uint64_t v12 = sub_2523C75D8();
    swift_allocError();
    uint64_t v14 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E98);
    *(void *)(v14 + 24) = &_s3TagO14CodingKeyProxyVN;
    *(void *)(v14 + 32) = sub_2523A7384();
    *(void *)uint64_t v14 = a1;
    *(unsigned char *)(v14 + 8) = v5 != 0;
    sub_2523A7798(*(void *)(v2 + 8));
    sub_2523C7598();
    swift_bridgeObjectRelease();
    sub_2523A6BC4(a1, v5);
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523A6B70();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523C75C8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v12 - 8) + 104))(v14, *MEMORY[0x263F8DCA8], v12);
    swift_willThrow();
  }
  return v3;
}

void *sub_2523BD098(uint64_t a1, char a2)
{
  int v4 = a2 & 1;
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v7 = __ROR8__(a1, 32);
    if (a2) {
      uint64_t v7 = a1;
    }
    uint64_t v8 = (char *)(v5 + 64);
    while (1)
    {
      uint64_t v9 = __ROR8__(*((void *)v8 - 4), 32);
      uint64_t v10 = *((void *)v8 - 4);
      if (!*(v8 - 24)) {
        uint64_t v10 = v9;
      }
      if (v10 == v7) {
        break;
      }
      v8 += 40;
      if (!--v6) {
        goto LABEL_9;
      }
    }
    uint64_t v15 = *((void *)v8 - 2);
    unint64_t v16 = *((void *)v8 - 1);
    unint64_t v17 = *(void *)(v2 + 8);
    uint64_t v18 = *v8;
    sub_2523A8570(v15, v16, *v8);
    uint64_t v14 = (void *)sub_2523B0788(v15, v16, v18, v17, a1, v4, MEMORY[0x263F8D6C8], (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2523ABD40);
    sub_2523A8630(v15, v16, v18);
  }
  else
  {
LABEL_9:
    uint64_t v11 = sub_2523C75D8();
    swift_allocError();
    uint64_t v13 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E98);
    *(void *)(v13 + 24) = &_s3TagO14CodingKeyProxyVN;
    *(void *)(v13 + 32) = sub_2523A7384();
    *(void *)uint64_t v13 = a1;
    *(unsigned char *)(v13 + 8) = v4 != 0;
    sub_2523A7798(*(void *)(v2 + 8));
    sub_2523C7598();
    swift_bridgeObjectRelease();
    v20[0] = 0xD00000000000001DLL;
    v20[1] = 0x80000002523CAE10;
    sub_2523A6BC4(a1, v4);
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523A6B70();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    uint64_t v14 = v20;
    sub_2523C7488();
    sub_2523C75C8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCA8], v11);
    swift_willThrow();
  }
  return v14;
}

void *sub_2523BD34C(uint64_t a1, char a2)
{
  int v4 = a2 & 1;
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v7 = __ROR8__(a1, 32);
    if (a2) {
      uint64_t v7 = a1;
    }
    uint64_t v8 = (char *)(v5 + 64);
    while (1)
    {
      uint64_t v9 = __ROR8__(*((void *)v8 - 4), 32);
      uint64_t v10 = *((void *)v8 - 4);
      if (!*(v8 - 24)) {
        uint64_t v10 = v9;
      }
      if (v10 == v7) {
        break;
      }
      v8 += 40;
      if (!--v6) {
        goto LABEL_9;
      }
    }
    uint64_t v15 = *((void *)v8 - 2);
    unint64_t v16 = *((void *)v8 - 1);
    unint64_t v17 = *(void *)(v2 + 8);
    uint64_t v18 = *v8;
    sub_2523A8570(v15, v16, *v8);
    uint64_t v14 = (void *)sub_2523B0788(v15, v16, v18, v17, a1, v4, MEMORY[0x263F8E5C0], (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2523AC2A0);
    sub_2523A8630(v15, v16, v18);
  }
  else
  {
LABEL_9:
    uint64_t v11 = sub_2523C75D8();
    swift_allocError();
    uint64_t v13 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E98);
    *(void *)(v13 + 24) = &_s3TagO14CodingKeyProxyVN;
    *(void *)(v13 + 32) = sub_2523A7384();
    *(void *)uint64_t v13 = a1;
    *(unsigned char *)(v13 + 8) = v4 != 0;
    sub_2523A7798(*(void *)(v2 + 8));
    sub_2523C7598();
    swift_bridgeObjectRelease();
    v20[0] = 0xD00000000000001DLL;
    v20[1] = 0x80000002523CAE10;
    sub_2523A6BC4(a1, v4);
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523A6B70();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    uint64_t v14 = v20;
    sub_2523C7488();
    sub_2523C75C8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCA8], v11);
    swift_willThrow();
  }
  return v14;
}

void *sub_2523BD604(uint64_t a1, char a2)
{
  int v4 = a2 & 1;
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v7 = __ROR8__(a1, 32);
    if (a2) {
      uint64_t v7 = a1;
    }
    uint64_t v8 = (char *)(v5 + 64);
    while (1)
    {
      uint64_t v9 = __ROR8__(*((void *)v8 - 4), 32);
      uint64_t v10 = *((void *)v8 - 4);
      if (!*(v8 - 24)) {
        uint64_t v10 = v9;
      }
      if (v10 == v7) {
        break;
      }
      v8 += 40;
      if (!--v6) {
        goto LABEL_9;
      }
    }
    uint64_t v15 = *((void *)v8 - 2);
    unint64_t v16 = *((void *)v8 - 1);
    unint64_t v17 = *(void *)(v2 + 8);
    uint64_t v18 = *v8;
    sub_2523A8570(v15, v16, *v8);
    uint64_t v14 = (void *)sub_2523B20A4(v15, v16, v18, v17, a1, v4, MEMORY[0x263F8D9D0], (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2523AC3F8);
    sub_2523A8630(v15, v16, v18);
  }
  else
  {
LABEL_9:
    uint64_t v11 = sub_2523C75D8();
    swift_allocError();
    uint64_t v13 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E98);
    *(void *)(v13 + 24) = &_s3TagO14CodingKeyProxyVN;
    *(void *)(v13 + 32) = sub_2523A7384();
    *(void *)uint64_t v13 = a1;
    *(unsigned char *)(v13 + 8) = v4 != 0;
    sub_2523A7798(*(void *)(v2 + 8));
    sub_2523C7598();
    swift_bridgeObjectRelease();
    v20[0] = 0xD00000000000001DLL;
    v20[1] = 0x80000002523CAE10;
    sub_2523A6BC4(a1, v4);
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523A6B70();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    uint64_t v14 = v20;
    sub_2523C7488();
    sub_2523C75C8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCA8], v11);
    swift_willThrow();
  }
  return v14;
}

void *sub_2523BD8B8(uint64_t a1, char a2, uint64_t (*a3)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = a2 & 1;
  uint64_t v6 = *(void *)(v3 + 16);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v9 = __ROR8__(a1, 32);
    if (a2) {
      uint64_t v9 = a1;
    }
    uint64_t v10 = (char *)(v6 + 64);
    while (1)
    {
      uint64_t v11 = __ROR8__(*((void *)v10 - 4), 32);
      uint64_t v12 = *((void *)v10 - 4);
      if (!*(v10 - 24)) {
        uint64_t v12 = v11;
      }
      if (v12 == v9) {
        break;
      }
      v10 += 40;
      if (!--v7) {
        goto LABEL_9;
      }
    }
    uint64_t v17 = *((void *)v10 - 2);
    unint64_t v18 = *((void *)v10 - 1);
    uint64_t v19 = *(void *)(v3 + 8);
    uint64_t v20 = *v10;
    sub_2523A8570(v17, v18, *v10);
    unint64_t v16 = (void *)a3(v17, v18, v20, v19, a1, v5);
    sub_2523A8630(v17, v18, v20);
  }
  else
  {
LABEL_9:
    uint64_t v13 = sub_2523C75D8();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E98);
    *(void *)(v15 + 24) = &_s3TagO14CodingKeyProxyVN;
    *(void *)(v15 + 32) = sub_2523A7384();
    *(void *)uint64_t v15 = a1;
    *(unsigned char *)(v15 + 8) = v5 != 0;
    sub_2523A7798(*(void *)(v3 + 8));
    sub_2523C7598();
    swift_bridgeObjectRelease();
    v22[0] = 0xD00000000000001DLL;
    v22[1] = 0x80000002523CAE10;
    sub_2523A6BC4(a1, v5);
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523A6B70();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    unint64_t v16 = v22;
    sub_2523C7488();
    sub_2523C75C8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCA8], v13);
    swift_willThrow();
  }
  return v16;
}

void *sub_2523BDB48(uint64_t a1, char a2, uint64_t (*a3)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = a2 & 1;
  uint64_t v6 = *(void *)(v3 + 16);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v9 = __ROR8__(a1, 32);
    if (a2) {
      uint64_t v9 = a1;
    }
    uint64_t v10 = (char *)(v6 + 64);
    while (1)
    {
      uint64_t v11 = __ROR8__(*((void *)v10 - 4), 32);
      uint64_t v12 = *((void *)v10 - 4);
      if (!*(v10 - 24)) {
        uint64_t v12 = v11;
      }
      if (v12 == v9) {
        break;
      }
      v10 += 40;
      if (!--v7) {
        goto LABEL_9;
      }
    }
    uint64_t v17 = *((void *)v10 - 2);
    unint64_t v18 = *((void *)v10 - 1);
    uint64_t v19 = *(void *)(v3 + 8);
    uint64_t v20 = *v10;
    sub_2523A8570(v17, v18, *v10);
    unint64_t v16 = (void *)a3(v17, v18, v20, v19, a1, v5);
    sub_2523A8630(v17, v18, v20);
  }
  else
  {
LABEL_9:
    uint64_t v13 = sub_2523C75D8();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E98);
    *(void *)(v15 + 24) = &_s3TagO14CodingKeyProxyVN;
    *(void *)(v15 + 32) = sub_2523A7384();
    *(void *)uint64_t v15 = a1;
    *(unsigned char *)(v15 + 8) = v5 != 0;
    sub_2523A7798(*(void *)(v3 + 8));
    sub_2523C7598();
    swift_bridgeObjectRelease();
    v22[0] = 0xD00000000000001DLL;
    v22[1] = 0x80000002523CAE10;
    sub_2523A6BC4(a1, v5);
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523A6B70();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    unint64_t v16 = v22;
    sub_2523C7488();
    sub_2523C75C8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCA8], v13);
    swift_willThrow();
  }
  return v16;
}

void *sub_2523BDDD8(uint64_t a1, char a2, uint64_t (*a3)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = a2 & 1;
  uint64_t v6 = *(void *)(v3 + 16);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v9 = __ROR8__(a1, 32);
    if (a2) {
      uint64_t v9 = a1;
    }
    uint64_t v10 = (char *)(v6 + 64);
    while (1)
    {
      uint64_t v11 = __ROR8__(*((void *)v10 - 4), 32);
      uint64_t v12 = *((void *)v10 - 4);
      if (!*(v10 - 24)) {
        uint64_t v12 = v11;
      }
      if (v12 == v9) {
        break;
      }
      v10 += 40;
      if (!--v7) {
        goto LABEL_9;
      }
    }
    uint64_t v17 = *((void *)v10 - 2);
    unint64_t v18 = *((void *)v10 - 1);
    uint64_t v19 = *(void *)(v3 + 8);
    uint64_t v20 = *v10;
    sub_2523A8570(v17, v18, *v10);
    unint64_t v16 = (void *)a3(v17, v18, v20, v19, a1, v5);
    sub_2523A8630(v17, v18, v20);
  }
  else
  {
LABEL_9:
    uint64_t v13 = sub_2523C75D8();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E98);
    *(void *)(v15 + 24) = &_s3TagO14CodingKeyProxyVN;
    *(void *)(v15 + 32) = sub_2523A7384();
    *(void *)uint64_t v15 = a1;
    *(unsigned char *)(v15 + 8) = v5 != 0;
    sub_2523A7798(*(void *)(v3 + 8));
    sub_2523C7598();
    swift_bridgeObjectRelease();
    v22[0] = 0xD00000000000001DLL;
    v22[1] = 0x80000002523CAE10;
    sub_2523A6BC4(a1, v5);
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523A6B70();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    unint64_t v16 = v22;
    sub_2523C7488();
    sub_2523C75C8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCA8], v13);
    swift_willThrow();
  }
  return v16;
}

void *sub_2523BE068(uint64_t a1, char a2)
{
  int v4 = a2 & 1;
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v7 = __ROR8__(a1, 32);
    if (a2) {
      uint64_t v7 = a1;
    }
    uint64_t v8 = (char *)(v5 + 64);
    while (1)
    {
      uint64_t v9 = __ROR8__(*((void *)v8 - 4), 32);
      uint64_t v10 = *((void *)v8 - 4);
      if (!*(v8 - 24)) {
        uint64_t v10 = v9;
      }
      if (v10 == v7) {
        break;
      }
      v8 += 40;
      if (!--v6) {
        goto LABEL_9;
      }
    }
    uint64_t v15 = *((void *)v8 - 2);
    unint64_t v16 = *((void *)v8 - 1);
    unint64_t v17 = *(void *)(v2 + 8);
    uint64_t v18 = *v8;
    sub_2523A8570(v15, v16, *v8);
    uint64_t v14 = (void *)sub_2523B20A4(v15, v16, v18, v17, a1, v4, MEMORY[0x263F8E970], (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_2523AC958);
    sub_2523A8630(v15, v16, v18);
  }
  else
  {
LABEL_9:
    uint64_t v11 = sub_2523C75D8();
    swift_allocError();
    uint64_t v13 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E98);
    *(void *)(v13 + 24) = &_s3TagO14CodingKeyProxyVN;
    *(void *)(v13 + 32) = sub_2523A7384();
    *(void *)uint64_t v13 = a1;
    *(unsigned char *)(v13 + 8) = v4 != 0;
    sub_2523A7798(*(void *)(v2 + 8));
    sub_2523C7598();
    swift_bridgeObjectRelease();
    v20[0] = 0xD00000000000001DLL;
    v20[1] = 0x80000002523CAE10;
    sub_2523A6BC4(a1, v4);
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    sub_2523A6B70();
    sub_2523C76F8();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    uint64_t v14 = v20;
    sub_2523C7488();
    sub_2523C75C8();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCA8], v11);
    swift_willThrow();
  }
  return v14;
}

uint64_t sub_2523BE320(uint64_t a1)
{
  return a1;
}

uint64_t sub_2523BE34C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_2523BE360(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

ValueMetadata *_s12ValueDecoderV16UnkeyedContainerVMa()
{
  return &_s12ValueDecoderV16UnkeyedContainerVN;
}

uint64_t _s12ValueDecoderV14KeyedContainerVwxx_0(uint64_t a1)
{
  swift_release();
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  int v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 != 255)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = *(void *)(a1 + 40);
    return sub_2523A8630(v4, v5, v3);
  }
  return result;
}

uint64_t _s12ValueDecoderV14KeyedContainerVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  int v6 = *(unsigned __int8 *)(a2 + 48);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  if (v6 == 255)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  }
  else
  {
    uint64_t v8 = *(void *)(a2 + 32);
    unint64_t v7 = *(void *)(a2 + 40);
    sub_2523A8570(v8, v7, v6);
    *(void *)(a1 + 32) = v8;
    *(void *)(a1 + 40) = v7;
    *(unsigned char *)(a1 + 48) = v6;
  }
  return a1;
}

uint64_t _s12ValueDecoderV14KeyedContainerVwca_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = (long long *)(a1 + 32);
  uint64_t v5 = (long long *)(a2 + 32);
  int v6 = *(unsigned __int8 *)(a2 + 48);
  if (*(unsigned __int8 *)(a1 + 48) == 255)
  {
    if (v6 == 255)
    {
      long long v15 = *v5;
      *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
      *uint64_t v4 = v15;
    }
    else
    {
      uint64_t v13 = *(void *)(a2 + 32);
      unint64_t v12 = *(void *)(a2 + 40);
      sub_2523A8570(v13, v12, v6);
      *(void *)(a1 + 32) = v13;
      *(void *)(a1 + 40) = v12;
      *(unsigned char *)(a1 + 48) = v6;
    }
  }
  else if (v6 == 255)
  {
    sub_2523BE360(a1 + 32);
    char v14 = *(unsigned char *)(a2 + 48);
    *uint64_t v4 = *v5;
    *(unsigned char *)(a1 + 48) = v14;
  }
  else
  {
    uint64_t v8 = *(void *)(a2 + 32);
    unint64_t v7 = *(void *)(a2 + 40);
    sub_2523A8570(v8, v7, v6);
    uint64_t v9 = *(void *)(a1 + 32);
    unint64_t v10 = *(void *)(a1 + 40);
    *(void *)(a1 + 32) = v8;
    *(void *)(a1 + 40) = v7;
    char v11 = *(unsigned char *)(a1 + 48);
    *(unsigned char *)(a1 + 48) = v6;
    sub_2523A8630(v9, v10, v11);
  }
  return a1;
}

uint64_t _s12ValueDecoderV14KeyedContainerVwta_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = (_OWORD *)(a2 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 48);
  if (v5 == 255) {
    goto LABEL_5;
  }
  int v6 = *(unsigned __int8 *)(a2 + 48);
  if (v6 == 255)
  {
    sub_2523BE360(a1 + 32);
LABEL_5:
    *(_OWORD *)(a1 + 32) = *v4;
    *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
    return a1;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *v4;
  *(unsigned char *)(a1 + 48) = v6;
  sub_2523A8630(v7, v8, v5);
  return a1;
}

uint64_t _s12ValueDecoderV14KeyedContainerVwet_0(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_2523BE72C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s12ValueDecoderV14KeyedContainerVMa()
{
  return &_s12ValueDecoderV14KeyedContainerVN;
}

uint64_t sub_2523BE78C(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

uint64_t sub_2523BE794@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2523B5F90(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_2523BE7B4()
{
  unint64_t result = qword_269C02F30;
  if (!qword_269C02F30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C02F28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C02F30);
  }
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

ValueMetadata *_s12ValueDecoderVMa()
{
  return &_s12ValueDecoderVN;
}

uint64_t sub_2523BE8A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2523A7FB0(a1, (uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02F48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02F50);
  if (swift_dynamicCast())
  {
    sub_2523BECE0(v11, (uint64_t)v14);
    uint64_t v8 = v15;
    uint64_t v9 = v16;
    __swift_project_boxed_opaque_existential_1(v14, v15);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16))(a2, a3, a4, v8, v9);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  else
  {
    uint64_t v12 = 0;
    memset(v11, 0, sizeof(v11));
    sub_2523BECF8((uint64_t)v11, &qword_269C02F58);
    sub_2523A7FB0(a1, (uint64_t)v14);
    v13[0] = 0;
    v13[1] = 0xE000000000000000;
    sub_2523C7598();
    sub_2523C7488();
    __swift_project_boxed_opaque_existential_1(v14, v15);
    swift_getDynamicType();
    sub_2523C7B78();
    sub_2523C7488();
    swift_bridgeObjectRelease();
    sub_2523C7488();
    uint64_t result = sub_2523C7668();
    __break(1u);
  }
  return result;
}

uint64_t sub_2523BEA6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_2523BEABC(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_2523BEA9C(uint64_t a1)
{
  return sub_2523BE8A0(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_2523BEABC(uint64_t a1)
{
  sub_2523A7FB0(a1, (uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02E90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02F38);
  if (swift_dynamicCast())
  {
    sub_2523BECE0(v8, (uint64_t)v11);
    uint64_t v2 = *__swift_project_boxed_opaque_existential_1(v11, v12);
    swift_beginAccess();
    uint64_t v3 = *(void *)(v2 + 24);
    uint64_t v4 = *(void *)(v3 + 16);
    if (v4)
    {
      uint64_t v5 = v3 + 24 * v4;
      uint64_t v6 = *(void *)(v5 + 8);
      sub_2523A8570(v6, *(void *)(v5 + 16), *(unsigned char *)(v5 + 24));
      __swift_destroy_boxed_opaque_existential_1(a1);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
      return v6;
    }
    __break(1u);
  }
  uint64_t v9 = 0;
  memset(v8, 0, sizeof(v8));
  sub_2523BECF8((uint64_t)v8, &qword_269C02F40);
  sub_2523A7FB0(a1, (uint64_t)v11);
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  sub_2523C7598();
  sub_2523C7488();
  __swift_project_boxed_opaque_existential_1(v11, v12);
  swift_getDynamicType();
  sub_2523C7B78();
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  uint64_t result = sub_2523C7668();
  __break(1u);
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2523BECE0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2523BECF8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t _s7AdapterV15ServerAttributeCMa()
{
  return self;
}

uint64_t sub_2523BED78()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t _s7AdapterV13ServerClusterCMa()
{
  return self;
}

uint64_t _s7AdapterV14ServerEndpointCMa()
{
  return self;
}

_UNKNOWN **sub_2523BEDF8()
{
  return &off_26BB72CA8;
}

_UNKNOWN **sub_2523BEE04()
{
  return &off_2702972E0;
}

ValueMetadata *_s7AdapterVMa()
{
  return &_s7AdapterVN;
}

_UNKNOWN **sub_2523BEE20()
{
  return &off_26BB72D20;
}

_UNKNOWN **sub_2523BEE2C()
{
  return &off_26BB72C60;
}

ValueMetadata *_s7AdapterV21ServerEndpointFactoryVMa()
{
  return &_s7AdapterV21ServerEndpointFactoryVN;
}

_WORD *sub_2523BEE4C@<X0>(_WORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_WORD *)a2 = *result;
  *(unsigned char *)(a2 + 2) = 0;
  return result;
}

void sub_2523BEE5C(_WORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_2523BEE68()
{
  return sub_2523C74C8();
}

uint64_t sub_2523BEEC8()
{
  return sub_2523C74A8();
}

uint64_t sub_2523BEF18()
{
  return sub_2523C7B28();
}

uint64_t sub_2523BEF60()
{
  return sub_2523C7AF8();
}

uint64_t sub_2523BEF8C()
{
  return sub_2523C7B28();
}

uint64_t sub_2523BEFD0()
{
  strcpy((char *)v1, "Vendor.ID(0x");
  sub_2523A73D8();
  sub_2523C7498();
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  return v1[0];
}

ValueMetadata *_s6VendorOMa()
{
  return &_s6VendorON;
}

ValueMetadata *_s6VendorO2IDVMa()
{
  return &_s6VendorO2IDVN;
}

BOOL sub_2523BF084(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_2523BF09C()
{
  unint64_t result = qword_269C02F60;
  if (!qword_269C02F60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C02F60);
  }
  return result;
}

unint64_t sub_2523BF0F0()
{
  unint64_t result = qword_269C02F68;
  if (!qword_269C02F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C02F68);
  }
  return result;
}

uint64_t sub_2523BF144(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v102 = a7;
  uint64_t v100 = a6;
  uint64_t v107 = a2;
  v108 = a1;
  uint64_t v9 = *(void *)(a5 - 8);
  uint64_t v103 = a3;
  uint64_t v104 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  v106 = (char *)v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  unint64_t v99 = (char *)v91 - v12;
  uint64_t v13 = sub_2523C7588();
  uint64_t v105 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)v91 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)v91 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (void *)((char *)v91 - v24);
  uint64_t v26 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)v91 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (swift_dynamicCastMetatype())
  {
    (*(void (**)(char *, void *, uint64_t))(v26 + 16))(v28, v108, a4);
    swift_dynamicCast();
    uint64_t v29 = v109;
    unint64_t v30 = v110;
    _s14ValueReferenceCMa();
    unint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = v29;
    *(void *)(v31 + 24) = v30;
    *(unsigned char *)(v31 + 32) = 6;
    return v31;
  }
  uint64_t v94 = v26;
  v92 = v16;
  uint64_t v95 = v22;
  unint64_t v93 = v19;
  uint64_t v96 = v25;
  uint64_t v97 = a5;
  uint64_t v32 = v106;
  uint64_t v98 = v13;
  if (swift_conformsToProtocol2()) {
    uint64_t v33 = a4;
  }
  else {
    uint64_t v33 = 0;
  }
  if (!v33)
  {
    unint64_t v35 = v101;
    uint64_t v96 = v101 + 2;
    swift_beginAccess();
    unint64_t v50 = v35[3];
    uint64_t v95 = v35 + 3;
    v91[1] = a4;
    if (v50 >> 62) {
      goto LABEL_52;
    }
    unint64_t v99 = *(char **)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_11;
  }
  uint64_t v109 = 0;
  unint64_t v110 = 0xE000000000000000;
  sub_2523C7598();
  sub_2523C7488();
  sub_2523C7B78();
  sub_2523C7488();
  swift_bridgeObjectRelease();
  sub_2523C7488();
  uint64_t v34 = v109;
  v106 = (char *)v110;
  unint64_t v35 = (void *)sub_2523C75F8();
  uint64_t v111 = swift_allocError();
  uint64_t v37 = v36;
  v36[3] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v36);
  (*(void (**)(uint64_t *, void *, uint64_t))(v94 + 16))(boxed_opaque_existential_1, v108, a4);
  uint64_t v39 = v105;
  uint64_t v40 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v105 + 16);
  unint64_t v41 = (unint64_t)v96;
  uint64_t v42 = v98;
  v40(v96, v103, v98);
  unint64_t v43 = v95;
  v40(v95, v41, v42);
  uint64_t v44 = (char *)v43;
  uint64_t v45 = v104;
  unint64_t v46 = v43;
  uint64_t v47 = v97;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v104 + 48))(v46, 1, v97) == 1)
  {
    uint64_t v48 = *(void (**)(unint64_t, uint64_t))(v39 + 8);
    v48(v41, v42);
    v48((unint64_t)v44, v42);
    uint64_t v49 = v107;
    unint64_t v31 = v107 & 0x3FFFFFFFFFFFFFFFLL;
    swift_retain();
LABEL_22:
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C02F90);
    sub_2523A7798(v49);
    swift_release();
    sub_2523C75C8();
    (*(void (**)(uint64_t *, void, void *))(*(v35 - 1) + 104))(v37, *MEMORY[0x263F8DCE0], v35);
LABEL_23:
    swift_willThrow();
    return v31;
  }
  uint64_t v103 = v34;
  v108 = v35;
  uint64_t v61 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
  unint64_t v62 = v99;
  v61(v99, v44, v47);
  uint64_t v49 = swift_allocObject();
  uint64_t v63 = v102;
  *(void *)(v49 + 40) = v47;
  *(void *)(v49 + 48) = v63;
  unint64_t v64 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v49 + 16));
  v61((char *)v64, v62, v47);
  (*(void (**)(unint64_t, uint64_t))(v39 + 8))(v41, v42);
  unint64_t v65 = v107;
  *(void *)(v49 + 56) = v107;
  if (v65 >> 62)
  {
    if (v65 >> 62 != 1)
    {
      unint64_t v35 = v108;
      uint64_t v74 = 1;
      goto LABEL_21;
    }
    v66 = (uint64_t *)((v65 & 0x3FFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    v66 = (uint64_t *)(v65 + 64);
  }
  unint64_t v35 = v108;
  uint64_t v73 = *v66;
  swift_retain();
  uint64_t v74 = v73 + 1;
  if (!__OFADD__(v73, 1))
  {
LABEL_21:
    *(void *)(v49 + 64) = v74;
    unint64_t v31 = v49 & 0x3FFFFFFFFFFFFFFFLL;
    goto LABEL_22;
  }
  __break(1u);
LABEL_27:
  uint64_t v72 = (uint64_t *)(v107 + 64);
  uint64_t v32 = (char *)v111;
  while (1)
  {
    uint64_t v76 = *v72;
    swift_retain();
    uint64_t v77 = v76 + 1;
    if (!__OFADD__(v76, 1)) {
      break;
    }
    __break(1u);
LABEL_52:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v99 = (char *)sub_2523C7678();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_11:
    uint64_t v51 = v32;
    uint64_t v52 = v105;
    int v53 = *(void (**)(char *, uint64_t, uint64_t))(v105 + 16);
    uint64_t v54 = v93;
    uint64_t v56 = v97;
    uint64_t v55 = v98;
    v53(v93, v103, v98);
    uint64_t v57 = v92;
    v53(v92, (uint64_t)v54, v55);
    uint64_t v58 = v104;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v104 + 48))(v57, 1, v56) == 1)
    {
      uint64_t v59 = *(void (**)(char *, uint64_t))(v52 + 8);
      v59(v54, v55);
      v59(v57, v55);
      unint64_t v41 = v107;
      uint64_t v60 = v107 & 0x3FFFFFFFFFFFFFFFLL;
      swift_retain();
      uint64_t v32 = (char *)v111;
      goto LABEL_30;
    }
    uint64_t v67 = *(void (**)(char *, char *, uint64_t))(v58 + 32);
    v67(v51, v57, v56);
    unint64_t v41 = swift_allocObject();
    uint64_t v68 = v102;
    *(void *)(v41 + 40) = v56;
    *(void *)(v41 + 48) = v68;
    uint64_t v69 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v41 + 16));
    v67((char *)v69, v51, v56);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v93, v55);
    unint64_t v70 = v107;
    *(void *)(v41 + 56) = v107;
    unint64_t v71 = v70 >> 62;
    if (!v71) {
      goto LABEL_27;
    }
    uint64_t v32 = (char *)v111;
    if (v71 != 1)
    {
      uint64_t v77 = 1;
      break;
    }
    uint64_t v72 = (uint64_t *)((v107 & 0x3FFFFFFFFFFFFFFFLL) + 32);
  }
  *(void *)(v41 + 64) = v77;
  uint64_t v60 = v41 & 0x3FFFFFFFFFFFFFFFLL;
LABEL_30:
  uint64_t v79 = v35[4];
  uint64_t v78 = v35[5];
  v35[4] = v41;
  swift_retain_n();
  if (!(v41 >> 62))
  {
    uint64_t v80 = (uint64_t *)(v41 + 64);
    goto LABEL_34;
  }
  if (v41 >> 62 == 1)
  {
    uint64_t v80 = (uint64_t *)(v60 + 32);
LABEL_34:
    uint64_t v81 = *v80;
    swift_release();
    goto LABEL_36;
  }
  uint64_t v81 = 0;
LABEL_36:
  uint64_t v82 = (uint64_t)v108;
  unint64_t v83 = v101;
  v101[5] = v81;
  sub_2523C1474(v82, (uint64_t)v83);
  if (v32)
  {
    v83[4] = v79;
    swift_retain();
    swift_release();
    v83[5] = v78;
    swift_release();
    swift_release();
    unint64_t v31 = v83[3];
    if (v31 >> 62)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v84 = sub_2523C7678();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v84 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if ((uint64_t)v99 >= v84) {
      goto LABEL_23;
    }
    swift_beginAccess();
    if (*v95 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v89 = sub_2523C7678();
      swift_bridgeObjectRelease();
      if (v89) {
        goto LABEL_42;
      }
    }
    else if (*(void *)((*v95 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_42:
      sub_2523BFCB4();
      unint64_t v31 = v85;
      swift_endAccess();
      swift_release();
      goto LABEL_23;
    }
    __break(1u);
LABEL_57:
    swift_bridgeObjectRetain();
    uint64_t v90 = sub_2523C7678();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v90) {
      goto LABEL_58;
    }
LABEL_48:
    sub_2523BFCB4();
    unint64_t v31 = v88;
    swift_endAccess();
    return v31;
  }
  v83[4] = v79;
  swift_retain();
  swift_release();
  v83[5] = v78;
  swift_release();
  swift_release();
  unint64_t v86 = v83[3];
  if (v86 >> 62)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v87 = sub_2523C7678();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v87 = *(void *)((v86 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((uint64_t)v99 >= v87) {
    return 0;
  }
  uint64_t result = swift_beginAccess();
  if (*v95 >> 62) {
    goto LABEL_57;
  }
  if (*(void *)((*v95 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_48;
  }
LABEL_58:
  __break(1u);
  return result;
}

BOOL sub_2523BFC10()
{
  swift_beginAccess();
  unint64_t v1 = *(void *)(v0 + 24);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2523C7678();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v2 == *(void *)(v0 + 40);
}

void sub_2523BFCB4()
{
  if (*v0 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_2523C7678();
    swift_bridgeObjectRelease();
    if (!v4) {
      return;
    }
  }
  else if (!*(void *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return;
  }
  sub_2523B84B0();
  if (!v1)
  {
    if (*v0 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_2523C7678();
      swift_bridgeObjectRelease();
      unint64_t v3 = v5 - 1;
      if (!__OFSUB__(v5, 1)) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v2 = *(void *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
      unint64_t v3 = v2 - 1;
      if (!__OFSUB__(v2, 1))
      {
LABEL_6:
        sub_2523B8348(v3);
        return;
      }
    }
    __break(1u);
  }
}

uint64_t sub_2523BFD80()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t _s26ValueEncoderImplementationCMa()
{
  return self;
}

uint64_t sub_2523BFDF8()
{
  uint64_t v1 = v0;
  if ((*(uint64_t (**)(void))(*v0 + 192))())
  {
    swift_beginAccess();
    unint64_t v2 = sub_2523C6794(MEMORY[0x263F8EE78]);
    _s14ValueReferenceCMa();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v2;
    *(void *)(v3 + 24) = 0;
    *(unsigned char *)(v3 + 32) = 0x80;
    uint64_t v4 = swift_retain();
    MEMORY[0x2533B3950](v4);
    if (*(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2523C7508();
    }
    sub_2523C7528();
    sub_2523C74F8();
    swift_endAccess();
    goto LABEL_13;
  }
  swift_beginAccess();
  unint64_t v5 = v0[3];
  if (!(v5 >> 62))
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_7;
    }
LABEL_15:
    unint64_t v7 = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_2523C7678();
  if (!v6) {
    goto LABEL_15;
  }
LABEL_7:
  unint64_t v7 = v6 - 1;
  if (__OFSUB__(v6, 1))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if ((v5 & 0xC000000000000001) == 0)
  {
    if ((v7 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v7 < *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v8 = *(void *)(v5 + 8 * v7 + 32);
      swift_retain();
      goto LABEL_12;
    }
    __break(1u);
    goto LABEL_20;
  }
LABEL_17:
  uint64_t v8 = MEMORY[0x2533B3A10](v7, v5);
LABEL_12:
  swift_bridgeObjectRelease();
  if ((*(unsigned char *)(v8 + 32) & 0xC0) == 0x80)
  {
LABEL_13:
    _s12ValueEncoderV14KeyedContainerVMa();
    swift_retain();
    swift_retain();
    swift_getWitnessTable();
    return sub_2523C76E8();
  }
LABEL_20:
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_2523C0048@<X0>(void *a1@<X8>)
{
  unint64_t v2 = v1;
  if ((*(uint64_t (**)(void))(*v1 + 192))())
  {
    swift_beginAccess();
    _s14ValueReferenceCMa();
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = MEMORY[0x263F8EE78];
    *(void *)(v4 + 24) = 0;
    *(unsigned char *)(v4 + 32) = 64;
    uint64_t v5 = swift_retain();
    MEMORY[0x2533B3950](v5);
    if (*(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2523C7508();
    }
    sub_2523C7528();
    sub_2523C74F8();
    swift_endAccess();
    uint64_t v6 = v1[4];
    a1[3] = &_s12ValueEncoderV16UnkeyedContainerVN;
    a1[4] = sub_2523C5CDC();
    *a1 = v2;
    a1[1] = v4;
    a1[2] = v6;
    swift_retain();
    return swift_retain();
  }
  else
  {
    uint64_t result = sub_2523C7668();
    __break(1u);
  }
  return result;
}

uint64_t sub_2523C01B8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2523C01FC()
{
  return sub_2523BFDF8();
}

uint64_t sub_2523C0220@<X0>(void *a1@<X8>)
{
  return sub_2523C0048(a1);
}

uint64_t sub_2523C0244@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  a1[3] = _s26ValueEncoderImplementationCMa();
  a1[4] = sub_2523C6AB0(&qword_269C02F78, (void (*)(uint64_t))_s26ValueEncoderImplementationCMa);
  *a1 = v3;
  return swift_retain();
}

uint64_t sub_2523C02C4()
{
  if (((*(uint64_t (**)(void))(*v0 + 192))() & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  _s14ValueReferenceCMa();
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = 0;
  *(unsigned char *)(v1 + 32) = 10;
  swift_beginAccess();
  uint64_t v2 = swift_retain();
  MEMORY[0x2533B3950](v2);
  if (*(void *)((v0[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v0[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_5:
  }
    sub_2523C7508();
  sub_2523C7528();
  sub_2523C74F8();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2523C03BC(char a1)
{
  if (((*(uint64_t (**)(void))(*v1 + 192))() & 1) == 0)
  {
    __break(1u);
LABEL_8:
    sub_2523C7508();
    goto LABEL_6;
  }
  _s14ValueReferenceCMa();
  uint64_t v3 = swift_allocObject();
  if (a1)
  {
    *(_OWORD *)(v3 + 16) = xmmword_2523C9810;
  }
  else
  {
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = 0;
  }
  *(unsigned char *)(v3 + 32) = 0;
  swift_beginAccess();
  uint64_t v4 = swift_retain();
  MEMORY[0x2533B3950](v4);
  if (*(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_8;
  }
LABEL_6:
  sub_2523C7528();
  sub_2523C74F8();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2523C04D8(uint64_t a1, uint64_t a2)
{
  if (((*(uint64_t (**)(void))(*v2 + 192))() & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  _s14ValueReferenceCMa();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  *(unsigned char *)(v5 + 32) = 5;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_retain();
  MEMORY[0x2533B3950](v6);
  if (*(void *)((v2[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v2[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_5:
  }
    sub_2523C7508();
  sub_2523C7528();
  sub_2523C74F8();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2523C05E8(double a1)
{
  if (((*(uint64_t (**)(void))(*v1 + 192))() & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  _s14ValueReferenceCMa();
  uint64_t v3 = swift_allocObject();
  *(double *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = 0;
  *(unsigned char *)(v3 + 32) = 4;
  swift_beginAccess();
  uint64_t v4 = swift_retain();
  MEMORY[0x2533B3950](v4);
  if (*(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_5:
  }
    sub_2523C7508();
  sub_2523C7528();
  sub_2523C74F8();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2523C06F0(float a1)
{
  if (((*(uint64_t (**)(void))(*v1 + 192))() & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  _s14ValueReferenceCMa();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = LODWORD(a1);
  *(void *)(v3 + 24) = 0;
  *(unsigned char *)(v3 + 32) = 3;
  swift_beginAccess();
  uint64_t v4 = swift_retain();
  MEMORY[0x2533B3950](v4);
  if (*(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_5:
  }
    sub_2523C7508();
  sub_2523C7528();
  sub_2523C74F8();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2523C07F8(char a1)
{
  if (((*(uint64_t (**)(void))(*v1 + 192))() & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  _s14ValueReferenceCMa();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = 0;
  *(unsigned char *)(v3 + 32) = 1;
  swift_beginAccess();
  uint64_t v4 = swift_retain();
  MEMORY[0x2533B3950](v4);
  if (*(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_5:
  }
    sub_2523C7508();
  sub_2523C7528();
  sub_2523C74F8();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2523C08F8(__int16 a1)
{
  if (((*(uint64_t (**)(void))(*v1 + 192))() & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  _s14ValueReferenceCMa();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = 0;
  *(unsigned char *)(v3 + 32) = 1;
  swift_beginAccess();
  uint64_t v4 = swift_retain();
  MEMORY[0x2533B3950](v4);
  if (*(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_5:
  }
    sub_2523C7508();
  sub_2523C7528();
  sub_2523C74F8();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2523C09F8(int a1)
{
  if (((*(uint64_t (**)(void))(*v1 + 192))() & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  _s14ValueReferenceCMa();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = 0;
  *(unsigned char *)(v3 + 32) = 1;
  swift_beginAccess();
  uint64_t v4 = swift_retain();
  MEMORY[0x2533B3950](v4);
  if (*(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_5:
  }
    sub_2523C7508();
  sub_2523C7528();
  sub_2523C74F8();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2523C0AF8(uint64_t a1)
{
  if (((*(uint64_t (**)(void))(*v1 + 192))() & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  _s14ValueReferenceCMa();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = 0;
  *(unsigned char *)(v3 + 32) = 1;
  swift_beginAccess();
  uint64_t v4 = swift_retain();
  MEMORY[0x2533B3950](v4);
  if (*(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_5:
  }
    sub_2523C7508();
  sub_2523C7528();
  sub_2523C74F8();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2523C0BFC(unsigned __int8 a1)
{
  if (((*(uint64_t (**)(void))(*v1 + 192))() & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  _s14ValueReferenceCMa();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = 0;
  *(unsigned char *)(v3 + 32) = 2;
  swift_beginAccess();
  uint64_t v4 = swift_retain();
  MEMORY[0x2533B3950](v4);
  if (*(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_5:
  }
    sub_2523C7508();
  sub_2523C7528();
  sub_2523C74F8();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2523C0CFC(unsigned __int16 a1)
{
  if (((*(uint64_t (**)(void))(*v1 + 192))() & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  _s14ValueReferenceCMa();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = 0;
  *(unsigned char *)(v3 + 32) = 2;
  swift_beginAccess();
  uint64_t v4 = swift_retain();
  MEMORY[0x2533B3950](v4);
  if (*(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_5:
  }
    sub_2523C7508();
  sub_2523C7528();
  sub_2523C74F8();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2523C0DFC(unsigned int a1)
{
  if (((*(uint64_t (**)(void))(*v1 + 192))() & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  _s14ValueReferenceCMa();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = 0;
  *(unsigned char *)(v3 + 32) = 2;
  swift_beginAccess();
  uint64_t v4 = swift_retain();
  MEMORY[0x2533B3950](v4);
  if (*(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_5:
  }
    sub_2523C7508();
  sub_2523C7528();
  sub_2523C74F8();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2523C0EFC(uint64_t a1)
{
  if (((*(uint64_t (**)(void))(*v1 + 192))() & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  _s14ValueReferenceCMa();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = 0;
  *(unsigned char *)(v3 + 32) = 2;
  swift_beginAccess();
  uint64_t v4 = swift_retain();
  MEMORY[0x2533B3950](v4);
  if (*(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v1[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_5:
  }
    sub_2523C7508();
  sub_2523C7528();
  sub_2523C74F8();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2523C1000(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  if (((*(uint64_t (**)(void))(*v3 + 192))() & 1) == 0)
  {
    __break(1u);
LABEL_9:
    sub_2523C7508();
LABEL_6:
    sub_2523C7528();
    sub_2523C74F8();
    swift_endAccess();
    return swift_release();
  }
  uint64_t v10 = v3[4];
  memset(v17, 0, sizeof(v17));
  char v18 = -1;
  unint64_t v11 = sub_2523A797C();
  swift_retain();
  uint64_t v12 = sub_2523BF144(a1, v10, (uint64_t)v17, a2, (uint64_t)&_s10_CodingKeyON, a3, v11);
  if (!v5)
  {
    if (!v12)
    {
      unint64_t v13 = sub_2523C6794(MEMORY[0x263F8EE78]);
      _s14ValueReferenceCMa();
      uint64_t v14 = swift_allocObject();
      *(void *)(v14 + 16) = v13;
      *(void *)(v14 + 24) = 0;
      *(unsigned char *)(v14 + 32) = 0x80;
    }
    swift_release();
    swift_beginAccess();
    uint64_t v15 = swift_retain();
    MEMORY[0x2533B3950](v15);
    if (*(void *)((v6[3] & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v6[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  return swift_release();
}

uint64_t sub_2523C1198(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  uint64_t v12 = __swift_project_boxed_opaque_existential_1(a1, v10);
  uint64_t result = sub_2523BF144(v12, a2, a3, v10, a4, v11, a5);
  if (!v5 && !result)
  {
    unint64_t v14 = sub_2523C6794(MEMORY[0x263F8EE78]);
    _s14ValueReferenceCMa();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v14;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0x80;
  }
  return result;
}

uint64_t sub_2523C124C()
{
  return sub_2523C02C4();
}

uint64_t sub_2523C1270(char a1)
{
  return sub_2523C03BC(a1);
}

uint64_t sub_2523C1294(uint64_t a1, uint64_t a2)
{
  return sub_2523C04D8(a1, a2);
}

uint64_t sub_2523C12B8(double a1)
{
  return sub_2523C05E8(a1);
}

uint64_t sub_2523C12DC(float a1)
{
  return sub_2523C06F0(a1);
}

uint64_t sub_2523C1300(uint64_t a1)
{
  return sub_2523C0AF8(a1);
}

uint64_t sub_2523C1324(char a1)
{
  return sub_2523C07F8(a1);
}

uint64_t sub_2523C1348(__int16 a1)
{
  return sub_2523C08F8(a1);
}

uint64_t sub_2523C136C(int a1)
{
  return sub_2523C09F8(a1);
}

uint64_t sub_2523C1390()
{
  return sub_2523C7928();
}

uint64_t sub_2523C13A8(uint64_t a1)
{
  return sub_2523C0EFC(a1);
}

uint64_t sub_2523C13CC(unsigned __int8 a1)
{
  return sub_2523C0BFC(a1);
}

uint64_t sub_2523C13F0(unsigned __int16 a1)
{
  return sub_2523C0CFC(a1);
}

uint64_t sub_2523C1414(unsigned int a1)
{
  return sub_2523C0DFC(a1);
}

uint64_t sub_2523C1438()
{
  return sub_2523C7938();
}

uint64_t sub_2523C1450(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_2523C1000(a1, a2, a3);
}

uint64_t sub_2523C1474(uint64_t a1, uint64_t a2)
{
  v4[3] = _s26ValueEncoderImplementationCMa();
  v4[4] = sub_2523C6AB0(&qword_269C02F70, (void (*)(uint64_t))_s26ValueEncoderImplementationCMa);
  v4[0] = a2;
  swift_retain();
  sub_2523C7468();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
}

uint64_t sub_2523C1534(uint64_t a1, unint64_t a2, char a3)
{
  if (((*(uint64_t (**)(void))(*v3 + 192))() & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  _s14ValueReferenceCMa();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  *(unsigned char *)(v7 + 32) = a3;
  swift_beginAccess();
  sub_2523A8570(a1, a2, a3);
  uint64_t v8 = swift_retain();
  MEMORY[0x2533B3950](v8);
  if (*(void *)((v3[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v3[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_5:
  }
    sub_2523C7508();
  sub_2523C7528();
  sub_2523C74F8();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_2523C1654(uint64_t a1, unint64_t a2, char a3)
{
  return sub_2523C1534(a1, a2, a3);
}

uint64_t sub_2523C1678()
{
  uint64_t v1 = *(void *)(v0 + 8);
  _s14ValueReferenceCMa();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = 0;
  *(unsigned char *)(result + 32) = 10;
  char v3 = *(unsigned char *)(v1 + 32);
  if ((v3 & 0xC0) == 0x40)
  {
    unint64_t v4 = *(void *)(v1 + 24);
    uint64_t v10 = *(void *)(v1 + 16);
    *(void *)(v1 + 16) = 0;
    *(void *)(v1 + 24) = 0;
    *(unsigned char *)(v1 + 32) = -64;
    uint64_t v5 = swift_bridgeObjectRetain();
    sub_2523AB03C(v5, v4, v3);
    uint64_t v6 = swift_retain();
    MEMORY[0x2533B3950](v6);
    if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2523C7508();
    }
    sub_2523C7528();
    sub_2523C74F8();
    uint64_t v7 = *(void *)(v1 + 16);
    unint64_t v8 = *(void *)(v1 + 24);
    *(void *)(v1 + 16) = v10;
    *(void *)(v1 + 24) = 0;
    char v9 = *(unsigned char *)(v1 + 32);
    *(unsigned char *)(v1 + 32) = 64;
    sub_2523AB03C(v7, v8, v9);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523C178C(char a1)
{
  uint64_t v3 = *(void *)(v1 + 8);
  _s14ValueReferenceCMa();
  uint64_t result = swift_allocObject();
  if (a1)
  {
    *(_OWORD *)(result + 16) = xmmword_2523C9810;
  }
  else
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
  }
  *(unsigned char *)(result + 32) = 0;
  char v5 = *(unsigned char *)(v3 + 32);
  if ((v5 & 0xC0) == 0x40)
  {
    unint64_t v6 = *(void *)(v3 + 24);
    uint64_t v12 = *(void *)(v3 + 16);
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = 0;
    *(unsigned char *)(v3 + 32) = -64;
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_2523AB03C(v7, v6, v5);
    uint64_t v8 = swift_retain();
    MEMORY[0x2533B3950](v8);
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2523C7508();
    }
    sub_2523C7528();
    sub_2523C74F8();
    uint64_t v9 = *(void *)(v3 + 16);
    unint64_t v10 = *(void *)(v3 + 24);
    *(void *)(v3 + 16) = v12;
    *(void *)(v3 + 24) = 0;
    char v11 = *(unsigned char *)(v3 + 32);
    *(unsigned char *)(v3 + 32) = 64;
    sub_2523AB03C(v9, v10, v11);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523C18BC(char a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = a1;
  _s14ValueReferenceCMa();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v3;
  *(void *)(result + 24) = 0;
  *(unsigned char *)(result + 32) = 1;
  char v5 = *(unsigned char *)(v2 + 32);
  if ((v5 & 0xC0) == 0x40)
  {
    unint64_t v6 = *(void *)(v2 + 24);
    uint64_t v12 = *(void *)(v2 + 16);
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
    *(unsigned char *)(v2 + 32) = -64;
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_2523AB03C(v7, v6, v5);
    uint64_t v8 = swift_retain();
    MEMORY[0x2533B3950](v8);
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2523C7508();
    }
    sub_2523C7528();
    sub_2523C74F8();
    uint64_t v9 = *(void *)(v2 + 16);
    unint64_t v10 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v12;
    *(void *)(v2 + 24) = 0;
    char v11 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 64;
    sub_2523AB03C(v9, v10, v11);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523C19D4(__int16 a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = a1;
  _s14ValueReferenceCMa();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v3;
  *(void *)(result + 24) = 0;
  *(unsigned char *)(result + 32) = 1;
  char v5 = *(unsigned char *)(v2 + 32);
  if ((v5 & 0xC0) == 0x40)
  {
    unint64_t v6 = *(void *)(v2 + 24);
    uint64_t v12 = *(void *)(v2 + 16);
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
    *(unsigned char *)(v2 + 32) = -64;
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_2523AB03C(v7, v6, v5);
    uint64_t v8 = swift_retain();
    MEMORY[0x2533B3950](v8);
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2523C7508();
    }
    sub_2523C7528();
    sub_2523C74F8();
    uint64_t v9 = *(void *)(v2 + 16);
    unint64_t v10 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v12;
    *(void *)(v2 + 24) = 0;
    char v11 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 64;
    sub_2523AB03C(v9, v10, v11);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523C1AEC(int a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = a1;
  _s14ValueReferenceCMa();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v3;
  *(void *)(result + 24) = 0;
  *(unsigned char *)(result + 32) = 1;
  char v5 = *(unsigned char *)(v2 + 32);
  if ((v5 & 0xC0) == 0x40)
  {
    unint64_t v6 = *(void *)(v2 + 24);
    uint64_t v12 = *(void *)(v2 + 16);
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
    *(unsigned char *)(v2 + 32) = -64;
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_2523AB03C(v7, v6, v5);
    uint64_t v8 = swift_retain();
    MEMORY[0x2533B3950](v8);
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2523C7508();
    }
    sub_2523C7528();
    sub_2523C74F8();
    uint64_t v9 = *(void *)(v2 + 16);
    unint64_t v10 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v12;
    *(void *)(v2 + 24) = 0;
    char v11 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 64;
    sub_2523AB03C(v9, v10, v11);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523C1C04(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 8);
  _s14ValueReferenceCMa();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = 0;
  *(unsigned char *)(result + 32) = 1;
  char v5 = *(unsigned char *)(v3 + 32);
  if ((v5 & 0xC0) == 0x40)
  {
    unint64_t v6 = *(void *)(v3 + 24);
    uint64_t v12 = *(void *)(v3 + 16);
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = 0;
    *(unsigned char *)(v3 + 32) = -64;
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_2523AB03C(v7, v6, v5);
    uint64_t v8 = swift_retain();
    MEMORY[0x2533B3950](v8);
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2523C7508();
    }
    sub_2523C7528();
    sub_2523C74F8();
    uint64_t v9 = *(void *)(v3 + 16);
    unint64_t v10 = *(void *)(v3 + 24);
    *(void *)(v3 + 16) = v12;
    *(void *)(v3 + 24) = 0;
    char v11 = *(unsigned char *)(v3 + 32);
    *(unsigned char *)(v3 + 32) = 64;
    sub_2523AB03C(v9, v10, v11);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523C1D1C(unsigned __int8 a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = a1;
  _s14ValueReferenceCMa();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v3;
  *(void *)(result + 24) = 0;
  *(unsigned char *)(result + 32) = 2;
  char v5 = *(unsigned char *)(v2 + 32);
  if ((v5 & 0xC0) == 0x40)
  {
    unint64_t v6 = *(void *)(v2 + 24);
    uint64_t v12 = *(void *)(v2 + 16);
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
    *(unsigned char *)(v2 + 32) = -64;
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_2523AB03C(v7, v6, v5);
    uint64_t v8 = swift_retain();
    MEMORY[0x2533B3950](v8);
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2523C7508();
    }
    sub_2523C7528();
    sub_2523C74F8();
    uint64_t v9 = *(void *)(v2 + 16);
    unint64_t v10 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v12;
    *(void *)(v2 + 24) = 0;
    char v11 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 64;
    sub_2523AB03C(v9, v10, v11);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523C1E34(unsigned __int16 a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = a1;
  _s14ValueReferenceCMa();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v3;
  *(void *)(result + 24) = 0;
  *(unsigned char *)(result + 32) = 2;
  char v5 = *(unsigned char *)(v2 + 32);
  if ((v5 & 0xC0) == 0x40)
  {
    unint64_t v6 = *(void *)(v2 + 24);
    uint64_t v12 = *(void *)(v2 + 16);
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
    *(unsigned char *)(v2 + 32) = -64;
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_2523AB03C(v7, v6, v5);
    uint64_t v8 = swift_retain();
    MEMORY[0x2533B3950](v8);
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2523C7508();
    }
    sub_2523C7528();
    sub_2523C74F8();
    uint64_t v9 = *(void *)(v2 + 16);
    unint64_t v10 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v12;
    *(void *)(v2 + 24) = 0;
    char v11 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 64;
    sub_2523AB03C(v9, v10, v11);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523C1F4C(unsigned int a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = a1;
  _s14ValueReferenceCMa();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v3;
  *(void *)(result + 24) = 0;
  *(unsigned char *)(result + 32) = 2;
  char v5 = *(unsigned char *)(v2 + 32);
  if ((v5 & 0xC0) == 0x40)
  {
    unint64_t v6 = *(void *)(v2 + 24);
    uint64_t v12 = *(void *)(v2 + 16);
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
    *(unsigned char *)(v2 + 32) = -64;
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_2523AB03C(v7, v6, v5);
    uint64_t v8 = swift_retain();
    MEMORY[0x2533B3950](v8);
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2523C7508();
    }
    sub_2523C7528();
    sub_2523C74F8();
    uint64_t v9 = *(void *)(v2 + 16);
    unint64_t v10 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v12;
    *(void *)(v2 + 24) = 0;
    char v11 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 64;
    sub_2523AB03C(v9, v10, v11);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523C2064(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 8);
  _s14ValueReferenceCMa();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = 0;
  *(unsigned char *)(result + 32) = 2;
  char v5 = *(unsigned char *)(v3 + 32);
  if ((v5 & 0xC0) == 0x40)
  {
    unint64_t v6 = *(void *)(v3 + 24);
    uint64_t v12 = *(void *)(v3 + 16);
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = 0;
    *(unsigned char *)(v3 + 32) = -64;
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_2523AB03C(v7, v6, v5);
    uint64_t v8 = swift_retain();
    MEMORY[0x2533B3950](v8);
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2523C7508();
    }
    sub_2523C7528();
    sub_2523C74F8();
    uint64_t v9 = *(void *)(v3 + 16);
    unint64_t v10 = *(void *)(v3 + 24);
    *(void *)(v3 + 16) = v12;
    *(void *)(v3 + 24) = 0;
    char v11 = *(unsigned char *)(v3 + 32);
    *(unsigned char *)(v3 + 32) = 64;
    sub_2523AB03C(v9, v10, v11);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523C217C(float a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = LODWORD(a1);
  _s14ValueReferenceCMa();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v3;
  *(void *)(result + 24) = 0;
  *(unsigned char *)(result + 32) = 3;
  char v5 = *(unsigned char *)(v2 + 32);
  if ((v5 & 0xC0) == 0x40)
  {
    unint64_t v6 = *(void *)(v2 + 24);
    uint64_t v12 = *(void *)(v2 + 16);
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
    *(unsigned char *)(v2 + 32) = -64;
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_2523AB03C(v7, v6, v5);
    uint64_t v8 = swift_retain();
    MEMORY[0x2533B3950](v8);
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2523C7508();
    }
    sub_2523C7528();
    sub_2523C74F8();
    uint64_t v9 = *(void *)(v2 + 16);
    unint64_t v10 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v12;
    *(void *)(v2 + 24) = 0;
    char v11 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 64;
    sub_2523AB03C(v9, v10, v11);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523C2294(double a1)
{
  uint64_t v3 = *(void *)(v1 + 8);
  _s14ValueReferenceCMa();
  uint64_t result = swift_allocObject();
  *(double *)(result + 16) = a1;
  *(void *)(result + 24) = 0;
  *(unsigned char *)(result + 32) = 4;
  char v5 = *(unsigned char *)(v3 + 32);
  if ((v5 & 0xC0) == 0x40)
  {
    unint64_t v6 = *(void *)(v3 + 24);
    uint64_t v12 = *(void *)(v3 + 16);
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = 0;
    *(unsigned char *)(v3 + 32) = -64;
    uint64_t v7 = swift_bridgeObjectRetain();
    sub_2523AB03C(v7, v6, v5);
    uint64_t v8 = swift_retain();
    MEMORY[0x2533B3950](v8);
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2523C7508();
    }
    sub_2523C7528();
    sub_2523C74F8();
    uint64_t v9 = *(void *)(v3 + 16);
    unint64_t v10 = *(void *)(v3 + 24);
    *(void *)(v3 + 16) = v12;
    *(void *)(v3 + 24) = 0;
    char v11 = *(unsigned char *)(v3 + 32);
    *(unsigned char *)(v3 + 32) = 64;
    sub_2523AB03C(v9, v10, v11);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523C23C0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 8);
  _s14ValueReferenceCMa();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(unsigned char *)(result + 32) = 5;
  char v7 = *(unsigned char *)(v5 + 32);
  if ((v7 & 0xC0) == 0x40)
  {
    uint64_t v9 = *(void *)(v5 + 16);
    unint64_t v8 = *(void *)(v5 + 24);
    *(void *)(v5 + 16) = 0;
    *(void *)(v5 + 24) = 0;
    *(unsigned char *)(v5 + 32) = -64;
    swift_bridgeObjectRetain();
    sub_2523AB008(v9, v8, v7);
    sub_2523AB03C(v9, v8, v7);
    uint64_t v10 = swift_retain();
    MEMORY[0x2533B3950](v10);
    if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2523C7508();
    }
    sub_2523C7528();
    sub_2523C74F8();
    uint64_t v11 = *(void *)(v5 + 16);
    unint64_t v12 = *(void *)(v5 + 24);
    *(void *)(v5 + 16) = v9;
    *(void *)(v5 + 24) = 0;
    char v13 = *(unsigned char *)(v5 + 32);
    *(unsigned char *)(v5 + 32) = 64;
    sub_2523AB03C(v11, v12, v13);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523C24FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t v37 = a3;
  uint64_t v7 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (uint64_t *)((char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = *v3;
  uint64_t result = (*(uint64_t (**)(void *))(v7 + 16))(v9);
  uint64_t v12 = v5[1];
  char v13 = *(unsigned char *)(v12 + 32);
  if ((v13 & 0xC0) != 0x40)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t v33 = v5;
  uint64_t v34 = v4;
  uint64_t v14 = *(void *)(v10 + 32);
  unint64_t v15 = *(void *)(v12 + 16);
  if (v15 >> 62)
  {
    unint64_t v32 = *(void *)(v12 + 24);
    unint64_t v30 = v32;
    swift_retain();
    sub_2523AB008(v15, v30, v13);
    uint64_t v16 = sub_2523C7678();
    sub_2523AB03C(v15, v32, v13);
  }
  else
  {
    uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_retain();
  }
  v35[1] = 0;
  v35[2] = 0;
  v35[0] = v16;
  char v36 = 2;
  unint64_t v17 = sub_2523A797C();
  uint64_t v18 = v34;
  uint64_t v19 = sub_2523BF144(v9, v14, (uint64_t)v35, a2, (uint64_t)&_s10_CodingKeyON, v37, v17);
  if (v18)
  {
    swift_release();
    return (*(uint64_t (**)(void *, uint64_t))(v7 + 8))(v9, a2);
  }
  if (!v19)
  {
    unint64_t v20 = sub_2523C6794(MEMORY[0x263F8EE78]);
    _s14ValueReferenceCMa();
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v20;
    *(void *)(v21 + 24) = 0;
    *(unsigned char *)(v21 + 32) = 0x80;
  }
  swift_release();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v7 + 8))(v9, a2);
  uint64_t v22 = v33[1];
  char v23 = *(unsigned char *)(v22 + 32);
  if ((v23 & 0xC0) != 0x40) {
    goto LABEL_14;
  }
  unint64_t v24 = *(void *)(v22 + 24);
  v35[0] = *(void *)(v22 + 16);
  *(void *)(v22 + 16) = 0;
  *(void *)(v22 + 24) = 0;
  *(unsigned char *)(v22 + 32) = -64;
  uint64_t v25 = swift_bridgeObjectRetain();
  sub_2523AB03C(v25, v24, v23);
  uint64_t v26 = swift_retain();
  MEMORY[0x2533B3950](v26);
  if (*(void *)((v35[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v35[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2523C7508();
  }
  sub_2523C7528();
  sub_2523C74F8();
  uint64_t v27 = *(void *)(v22 + 16);
  unint64_t v28 = *(void *)(v22 + 24);
  *(void *)(v22 + 16) = v35[0];
  *(void *)(v22 + 24) = 0;
  char v29 = *(unsigned char *)(v22 + 32);
  *(unsigned char *)(v22 + 32) = 64;
  sub_2523AB03C(v27, v28, v29);
  return swift_release();
}

void sub_2523C27E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 8);
  char v3 = *(unsigned char *)(v2 + 32);
  if ((v3 & 0xC0) == 0x40)
  {
    unint64_t v4 = *(void *)(v2 + 16);
    if (v4 >> 62)
    {
      unint64_t v20 = *(void *)(v2 + 24);
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_2523C7678();
      sub_2523AB03C(v4, v20, v3);
    }
    else
    {
      uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    unint64_t v6 = sub_2523C6794(MEMORY[0x263F8EE78]);
    _s14ValueReferenceCMa();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    *(void *)(v7 + 24) = 0;
    *(unsigned char *)(v7 + 32) = 0x80;
    char v8 = *(unsigned char *)(v2 + 32);
    if ((v8 & 0xC0) != 0x40) {
      goto LABEL_17;
    }
    unint64_t v9 = *(void *)(v2 + 24);
    uint64_t v21 = *(void *)(v2 + 16);
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
    *(unsigned char *)(v2 + 32) = -64;
    uint64_t v10 = swift_bridgeObjectRetain();
    sub_2523AB03C(v10, v9, v8);
    uint64_t v11 = swift_retain();
    MEMORY[0x2533B3950](v11);
    if (*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2523C7508();
    }
    sub_2523C7528();
    sub_2523C74F8();
    uint64_t v12 = *(void *)(v2 + 16);
    unint64_t v13 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v21;
    *(void *)(v2 + 24) = 0;
    char v14 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 64;
    sub_2523AB03C(v12, v13, v14);
    unint64_t v15 = *(void *)(v1 + 16);
    uint64_t v16 = (void *)swift_allocObject();
    v16[5] = &_s10_CodingKeyON;
    v16[6] = sub_2523A797C();
    uint64_t v17 = swift_allocObject();
    v16[2] = v17;
    *(void *)(v17 + 24) = 0;
    *(void *)(v17 + 32) = 0;
    *(void *)(v17 + 16) = v5;
    *(unsigned char *)(v17 + 40) = 2;
    v16[7] = v15;
    if (v15 >> 62)
    {
      uint64_t v18 = 0;
      if (v15 >> 62 != 1)
      {
LABEL_12:
        if (!__OFADD__(v18, 1))
        {
          v16[8] = v18 + 1;
          _s12ValueEncoderV14KeyedContainerVMa();
          swift_retain();
          swift_getWitnessTable();
          sub_2523C76E8();
          return;
        }
        __break(1u);
        goto LABEL_16;
      }
      uint64_t v19 = (uint64_t *)((v15 & 0x3FFFFFFFFFFFFFFFLL) + 32);
    }
    else
    {
      uint64_t v19 = (uint64_t *)(v15 + 64);
    }
    uint64_t v18 = *v19;
    swift_retain();
    goto LABEL_12;
  }
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
}

void sub_2523C2A78(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = v1[1];
  char v5 = *(unsigned char *)(v4 + 32);
  if ((v5 & 0xC0) != 0x40) {
    goto LABEL_18;
  }
  unint64_t v6 = *(void *)(v4 + 16);
  if (v6 >> 62)
  {
    unint64_t v23 = *(void *)(v4 + 24);
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2523C7678();
    sub_2523AB03C(v6, v23, v5);
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  _s14ValueReferenceCMa();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v8 + 24) = 0;
  *(unsigned char *)(v8 + 32) = 64;
  char v9 = *(unsigned char *)(v4 + 32);
  if ((v9 & 0xC0) != 0x40) {
    goto LABEL_19;
  }
  uint64_t v10 = v8;
  unint64_t v11 = *(void *)(v4 + 24);
  uint64_t v24 = *(void *)(v4 + 16);
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 24) = 0;
  *(unsigned char *)(v4 + 32) = -64;
  uint64_t v12 = swift_bridgeObjectRetain();
  sub_2523AB03C(v12, v11, v9);
  uint64_t v13 = swift_retain();
  MEMORY[0x2533B3950](v13);
  if (*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2523C7508();
  }
  sub_2523C7528();
  sub_2523C74F8();
  uint64_t v14 = *(void *)(v4 + 16);
  unint64_t v15 = *(void *)(v4 + 24);
  *(void *)(v4 + 16) = v24;
  *(void *)(v4 + 24) = 0;
  char v16 = *(unsigned char *)(v4 + 32);
  *(unsigned char *)(v4 + 32) = 64;
  sub_2523AB03C(v14, v15, v16);
  uint64_t v17 = *v2;
  unint64_t v18 = v2[2];
  uint64_t v19 = (void *)swift_allocObject();
  v19[5] = &_s10_CodingKeyON;
  v19[6] = sub_2523A797C();
  uint64_t v20 = swift_allocObject();
  void v19[2] = v20;
  *(void *)(v20 + 24) = 0;
  *(void *)(v20 + 32) = 0;
  *(void *)(v20 + 16) = v7;
  *(unsigned char *)(v20 + 40) = 2;
  v19[7] = v18;
  if (v18 >> 62)
  {
    uint64_t v21 = 0;
    if (v18 >> 62 != 1) {
      goto LABEL_12;
    }
    uint64_t v22 = (uint64_t *)((v18 & 0x3FFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    uint64_t v22 = (uint64_t *)(v18 + 64);
  }
  uint64_t v21 = *v22;
  swift_retain();
LABEL_12:
  if (__OFADD__(v21, 1))
  {
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    return;
  }
  v19[8] = v21 + 1;
  a1[3] = &_s12ValueEncoderV16UnkeyedContainerVN;
  a1[4] = sub_2523C5CDC();
  *a1 = v17;
  a1[1] = v10;
  a1[2] = v19;
  swift_retain();
}

void sub_2523C2CCC(uint64_t *a1@<X8>)
{
  uint64_t v3 = v1[1];
  char v4 = *(unsigned char *)(v3 + 32);
  if ((v4 & 0xC0) == 0x40)
  {
    uint64_t v5 = *v1;
    unint64_t v6 = *(void *)(v3 + 16);
    if (v6 >> 62)
    {
      unint64_t v11 = *(void *)(v3 + 24);
      swift_retain();
      sub_2523AB008(v6, v11, v4);
      uint64_t v7 = sub_2523C7678();
      sub_2523AB03C(v6, v11, v4);
    }
    else
    {
      uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_retain();
    }
    unint64_t v8 = *(void *)(v5 + 32);
    uint64_t v9 = _s23ValueReferencingEncoderCMa();
    swift_allocObject();
    swift_retain();
    swift_retain();
    uint64_t v10 = sub_2523C698C(v5, v7, v8, v3);
    swift_release();
    a1[3] = v9;
    a1[4] = sub_2523C6AB0(qword_269C02F98, (void (*)(uint64_t))_s23ValueReferencingEncoderCMa);
    *a1 = v10;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2523C2E14()
{
  return sub_2523A7798(*(void *)(v0 + 16));
}

uint64_t sub_2523C2E1C()
{
  return sub_2523C6904(*(void *)(v0 + 8));
}

uint64_t sub_2523C2E24()
{
  return sub_2523C1678();
}

uint64_t sub_2523C2E3C(char a1)
{
  return sub_2523C178C(a1);
}

uint64_t sub_2523C2E54(uint64_t a1, uint64_t a2)
{
  return sub_2523C23C0(a1, a2);
}

uint64_t sub_2523C2E6C(double a1)
{
  return sub_2523C2294(a1);
}

uint64_t sub_2523C2E84(float a1)
{
  return sub_2523C217C(a1);
}

uint64_t sub_2523C2E9C(uint64_t a1)
{
  return sub_2523C1C04(a1);
}

uint64_t sub_2523C2EB4(char a1)
{
  return sub_2523C18BC(a1);
}

uint64_t sub_2523C2ECC(__int16 a1)
{
  return sub_2523C19D4(a1);
}

uint64_t sub_2523C2EE4(int a1)
{
  return sub_2523C1AEC(a1);
}

uint64_t sub_2523C2EFC()
{
  return sub_2523C78C8();
}

uint64_t sub_2523C2F14(uint64_t a1)
{
  return sub_2523C2064(a1);
}

uint64_t sub_2523C2F2C(unsigned __int8 a1)
{
  return sub_2523C1D1C(a1);
}

uint64_t sub_2523C2F44(unsigned __int16 a1)
{
  return sub_2523C1E34(a1);
}

uint64_t sub_2523C2F5C(unsigned int a1)
{
  return sub_2523C1F4C(a1);
}

uint64_t sub_2523C2F74()
{
  return sub_2523C78D8();
}

uint64_t sub_2523C2F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2523C24FC(a1, a2, a3);
}

uint64_t sub_2523C2FA4()
{
  return sub_2523C77A8();
}

uint64_t sub_2523C2FD0()
{
  return sub_2523C77D8();
}

uint64_t sub_2523C2FFC()
{
  return sub_2523C77C8();
}

uint64_t sub_2523C3028()
{
  return sub_2523C77E8();
}

uint64_t sub_2523C3054()
{
  return sub_2523C77F8();
}

uint64_t sub_2523C3080()
{
  return sub_2523C7808();
}

uint64_t sub_2523C30AC()
{
  return sub_2523C7828();
}

uint64_t sub_2523C30D8()
{
  return sub_2523C7838();
}

uint64_t sub_2523C3104()
{
  return sub_2523C7848();
}

uint64_t sub_2523C3130()
{
  return sub_2523C7858();
}

uint64_t sub_2523C315C()
{
  return sub_2523C7878();
}

uint64_t sub_2523C3188()
{
  return sub_2523C7818();
}

uint64_t sub_2523C31B4()
{
  return sub_2523C7868();
}

uint64_t sub_2523C31E0()
{
  return sub_2523C7888();
}

uint64_t sub_2523C320C()
{
  return sub_2523C7898();
}

uint64_t sub_2523C3238()
{
  return sub_2523C78A8();
}

uint64_t sub_2523C3264()
{
  return sub_2523C78B8();
}

uint64_t sub_2523C3290()
{
  return sub_2523C77B8();
}

uint64_t sub_2523C32D0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_2523A7798(a3);
}

unint64_t sub_2523C32D8()
{
  uint64_t v1 = *(void *)(v0 + 8);
  _s14ValueReferenceCMa();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = 0;
  *(unsigned char *)(v2 + 32) = 10;
  unint64_t result = sub_2523C6B74();
  char v5 = *(unsigned char *)(v1 + 32);
  if ((v5 & 0xC0) == 0x80)
  {
    uint64_t v6 = result;
    char v7 = v4 & 1;
    uint64_t v8 = *(void *)(v1 + 16);
    unint64_t v9 = *(void *)(v1 + 24);
    *(void *)(v1 + 16) = 0;
    *(void *)(v1 + 24) = 0;
    *(unsigned char *)(v1 + 32) = -64;
    uint64_t v10 = swift_bridgeObjectRetain();
    sub_2523AB03C(v10, v9, v5);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2523C60C8(v2, v6, v7, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v1 + 16);
    unint64_t v13 = *(void *)(v1 + 24);
    *(void *)(v1 + 16) = v8;
    *(void *)(v1 + 24) = 0;
    char v14 = *(unsigned char *)(v1 + 32);
    *(unsigned char *)(v1 + 32) = 0x80;
    sub_2523AB03C(v12, v13, v14);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2523C33E8(char a1)
{
  uint64_t v3 = *(void *)(v1 + 8);
  _s14ValueReferenceCMa();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = v4;
  if (a1)
  {
    *(_OWORD *)(v4 + 16) = xmmword_2523C9810;
  }
  else
  {
    *(void *)(v4 + 16) = 0;
    *(void *)(v4 + 24) = 0;
  }
  *(unsigned char *)(v4 + 32) = 0;
  unint64_t result = sub_2523C6B74();
  char v8 = *(unsigned char *)(v3 + 32);
  if ((v8 & 0xC0) == 0x80)
  {
    uint64_t v9 = result;
    char v10 = v7 & 1;
    uint64_t v11 = *(void *)(v3 + 16);
    unint64_t v12 = *(void *)(v3 + 24);
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = 0;
    *(unsigned char *)(v3 + 32) = -64;
    uint64_t v13 = swift_bridgeObjectRetain();
    sub_2523AB03C(v13, v12, v8);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2523C60C8(v5, v9, v10, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    uint64_t v15 = *(void *)(v3 + 16);
    unint64_t v16 = *(void *)(v3 + 24);
    *(void *)(v3 + 16) = v11;
    *(void *)(v3 + 24) = 0;
    char v17 = *(unsigned char *)(v3 + 32);
    *(unsigned char *)(v3 + 32) = 0x80;
    sub_2523AB03C(v15, v16, v17);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2523C3514(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 8);
  _s14ValueReferenceCMa();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  *(unsigned char *)(v6 + 32) = 5;
  swift_bridgeObjectRetain();
  unint64_t result = sub_2523C6B74();
  char v9 = *(unsigned char *)(v5 + 32);
  if ((v9 & 0xC0) == 0x80)
  {
    uint64_t v10 = result;
    char v11 = v8 & 1;
    uint64_t v12 = *(void *)(v5 + 16);
    unint64_t v13 = *(void *)(v5 + 24);
    *(void *)(v5 + 16) = 0;
    *(void *)(v5 + 24) = 0;
    *(unsigned char *)(v5 + 32) = -64;
    uint64_t v14 = swift_bridgeObjectRetain();
    sub_2523AB03C(v14, v13, v9);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2523C60C8(v6, v10, v11, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void *)(v5 + 16);
    unint64_t v17 = *(void *)(v5 + 24);
    *(void *)(v5 + 16) = v12;
    *(void *)(v5 + 24) = 0;
    char v18 = *(unsigned char *)(v5 + 32);
    *(unsigned char *)(v5 + 32) = 0x80;
    sub_2523AB03C(v16, v17, v18);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2523C3644(double a1)
{
  uint64_t v3 = *(void *)(v1 + 8);
  _s14ValueReferenceCMa();
  uint64_t v4 = swift_allocObject();
  *(double *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = 0;
  *(unsigned char *)(v4 + 32) = 4;
  unint64_t result = sub_2523C6B74();
  char v7 = *(unsigned char *)(v3 + 32);
  if ((v7 & 0xC0) == 0x80)
  {
    uint64_t v8 = result;
    char v9 = v6 & 1;
    uint64_t v10 = *(void *)(v3 + 16);
    unint64_t v11 = *(void *)(v3 + 24);
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = 0;
    *(unsigned char *)(v3 + 32) = -64;
    uint64_t v12 = swift_bridgeObjectRetain();
    sub_2523AB03C(v12, v11, v7);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2523C60C8(v4, v8, v9, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v3 + 16);
    unint64_t v15 = *(void *)(v3 + 24);
    *(void *)(v3 + 16) = v10;
    *(void *)(v3 + 24) = 0;
    char v16 = *(unsigned char *)(v3 + 32);
    *(unsigned char *)(v3 + 32) = 0x80;
    sub_2523AB03C(v14, v15, v16);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2523C376C(float a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = LODWORD(a1);
  _s14ValueReferenceCMa();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = 0;
  *(unsigned char *)(v4 + 32) = 3;
  unint64_t result = sub_2523C6B74();
  char v7 = *(unsigned char *)(v2 + 32);
  if ((v7 & 0xC0) == 0x80)
  {
    uint64_t v8 = result;
    char v9 = v6 & 1;
    uint64_t v10 = *(void *)(v2 + 16);
    unint64_t v11 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
    *(unsigned char *)(v2 + 32) = -64;
    uint64_t v12 = swift_bridgeObjectRetain();
    sub_2523AB03C(v12, v11, v7);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2523C60C8(v4, v8, v9, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v2 + 16);
    unint64_t v15 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v10;
    *(void *)(v2 + 24) = 0;
    char v16 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 0x80;
    sub_2523AB03C(v14, v15, v16);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2523C3880(char a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = a1;
  _s14ValueReferenceCMa();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = 0;
  *(unsigned char *)(v4 + 32) = 1;
  unint64_t result = sub_2523C6B74();
  char v7 = *(unsigned char *)(v2 + 32);
  if ((v7 & 0xC0) == 0x80)
  {
    uint64_t v8 = result;
    char v9 = v6 & 1;
    uint64_t v10 = *(void *)(v2 + 16);
    unint64_t v11 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
    *(unsigned char *)(v2 + 32) = -64;
    uint64_t v12 = swift_bridgeObjectRetain();
    sub_2523AB03C(v12, v11, v7);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2523C60C8(v4, v8, v9, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v2 + 16);
    unint64_t v15 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v10;
    *(void *)(v2 + 24) = 0;
    char v16 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 0x80;
    sub_2523AB03C(v14, v15, v16);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2523C3994(__int16 a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = a1;
  _s14ValueReferenceCMa();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = 0;
  *(unsigned char *)(v4 + 32) = 1;
  unint64_t result = sub_2523C6B74();
  char v7 = *(unsigned char *)(v2 + 32);
  if ((v7 & 0xC0) == 0x80)
  {
    uint64_t v8 = result;
    char v9 = v6 & 1;
    uint64_t v10 = *(void *)(v2 + 16);
    unint64_t v11 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
    *(unsigned char *)(v2 + 32) = -64;
    uint64_t v12 = swift_bridgeObjectRetain();
    sub_2523AB03C(v12, v11, v7);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2523C60C8(v4, v8, v9, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v2 + 16);
    unint64_t v15 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v10;
    *(void *)(v2 + 24) = 0;
    char v16 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 0x80;
    sub_2523AB03C(v14, v15, v16);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2523C3AA8(int a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = a1;
  _s14ValueReferenceCMa();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = 0;
  *(unsigned char *)(v4 + 32) = 1;
  unint64_t result = sub_2523C6B74();
  char v7 = *(unsigned char *)(v2 + 32);
  if ((v7 & 0xC0) == 0x80)
  {
    uint64_t v8 = result;
    char v9 = v6 & 1;
    uint64_t v10 = *(void *)(v2 + 16);
    unint64_t v11 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
    *(unsigned char *)(v2 + 32) = -64;
    uint64_t v12 = swift_bridgeObjectRetain();
    sub_2523AB03C(v12, v11, v7);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2523C60C8(v4, v8, v9, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v2 + 16);
    unint64_t v15 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v10;
    *(void *)(v2 + 24) = 0;
    char v16 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 0x80;
    sub_2523AB03C(v14, v15, v16);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2523C3BBC(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 8);
  _s14ValueReferenceCMa();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = 0;
  *(unsigned char *)(v4 + 32) = 1;
  unint64_t result = sub_2523C6B74();
  char v7 = *(unsigned char *)(v3 + 32);
  if ((v7 & 0xC0) == 0x80)
  {
    uint64_t v8 = result;
    char v9 = v6 & 1;
    uint64_t v10 = *(void *)(v3 + 16);
    unint64_t v11 = *(void *)(v3 + 24);
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = 0;
    *(unsigned char *)(v3 + 32) = -64;
    uint64_t v12 = swift_bridgeObjectRetain();
    sub_2523AB03C(v12, v11, v7);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2523C60C8(v4, v8, v9, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v3 + 16);
    unint64_t v15 = *(void *)(v3 + 24);
    *(void *)(v3 + 16) = v10;
    *(void *)(v3 + 24) = 0;
    char v16 = *(unsigned char *)(v3 + 32);
    *(unsigned char *)(v3 + 32) = 0x80;
    sub_2523AB03C(v14, v15, v16);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2523C3CD0(unsigned __int8 a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = a1;
  _s14ValueReferenceCMa();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = 0;
  *(unsigned char *)(v4 + 32) = 2;
  unint64_t result = sub_2523C6B74();
  char v7 = *(unsigned char *)(v2 + 32);
  if ((v7 & 0xC0) == 0x80)
  {
    uint64_t v8 = result;
    char v9 = v6 & 1;
    uint64_t v10 = *(void *)(v2 + 16);
    unint64_t v11 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
    *(unsigned char *)(v2 + 32) = -64;
    uint64_t v12 = swift_bridgeObjectRetain();
    sub_2523AB03C(v12, v11, v7);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2523C60C8(v4, v8, v9, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v2 + 16);
    unint64_t v15 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v10;
    *(void *)(v2 + 24) = 0;
    char v16 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 0x80;
    sub_2523AB03C(v14, v15, v16);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2523C3DE4(unsigned __int16 a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = a1;
  _s14ValueReferenceCMa();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = 0;
  *(unsigned char *)(v4 + 32) = 2;
  unint64_t result = sub_2523C6B74();
  char v7 = *(unsigned char *)(v2 + 32);
  if ((v7 & 0xC0) == 0x80)
  {
    uint64_t v8 = result;
    char v9 = v6 & 1;
    uint64_t v10 = *(void *)(v2 + 16);
    unint64_t v11 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
    *(unsigned char *)(v2 + 32) = -64;
    uint64_t v12 = swift_bridgeObjectRetain();
    sub_2523AB03C(v12, v11, v7);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2523C60C8(v4, v8, v9, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v2 + 16);
    unint64_t v15 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v10;
    *(void *)(v2 + 24) = 0;
    char v16 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 0x80;
    sub_2523AB03C(v14, v15, v16);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2523C3EF8(unsigned int a1)
{
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v3 = a1;
  _s14ValueReferenceCMa();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = 0;
  *(unsigned char *)(v4 + 32) = 2;
  unint64_t result = sub_2523C6B74();
  char v7 = *(unsigned char *)(v2 + 32);
  if ((v7 & 0xC0) == 0x80)
  {
    uint64_t v8 = result;
    char v9 = v6 & 1;
    uint64_t v10 = *(void *)(v2 + 16);
    unint64_t v11 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
    *(unsigned char *)(v2 + 32) = -64;
    uint64_t v12 = swift_bridgeObjectRetain();
    sub_2523AB03C(v12, v11, v7);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2523C60C8(v4, v8, v9, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v2 + 16);
    unint64_t v15 = *(void *)(v2 + 24);
    *(void *)(v2 + 16) = v10;
    *(void *)(v2 + 24) = 0;
    char v16 = *(unsigned char *)(v2 + 32);
    *(unsigned char *)(v2 + 32) = 0x80;
    sub_2523AB03C(v14, v15, v16);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2523C400C(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 8);
  _s14ValueReferenceCMa();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = 0;
  *(unsigned char *)(v4 + 32) = 2;
  unint64_t result = sub_2523C6B74();
  char v7 = *(unsigned char *)(v3 + 32);
  if ((v7 & 0xC0) == 0x80)
  {
    uint64_t v8 = result;
    char v9 = v6 & 1;
    uint64_t v10 = *(void *)(v3 + 16);
    unint64_t v11 = *(void *)(v3 + 24);
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = 0;
    *(unsigned char *)(v3 + 32) = -64;
    uint64_t v12 = swift_bridgeObjectRetain();
    sub_2523AB03C(v12, v11, v7);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_2523C60C8(v4, v8, v9, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v3 + 16);
    unint64_t v15 = *(void *)(v3 + 24);
    *(void *)(v3 + 16) = v10;
    *(void *)(v3 + 24) = 0;
    char v16 = *(unsigned char *)(v3 + 32);
    *(unsigned char *)(v3 + 32) = 0x80;
    sub_2523AB03C(v14, v15, v16);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2523C4120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = *(void *)(a3 + 16);
  uint64_t v42 = sub_2523C7588();
  uint64_t v12 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v14 = (char *)&v38 - v13;
  uint64_t v39 = v5;
  uint64_t v15 = *v5;
  v41[3] = a4;
  v41[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v41);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(boxed_opaque_existential_1, a1, a4);
  uint64_t v17 = *(void *)(v15 + 32);
  uint64_t v18 = *(void *)(v11 - 8);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  uint64_t v38 = a2;
  v19(v14, a2, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v14, 0, 1, v11);
  uint64_t v20 = *(void *)(a3 + 24);
  swift_retain();
  uint64_t v21 = v40;
  uint64_t v22 = sub_2523C1198(v41, v17, (uint64_t)v14, v11, v20);
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v42);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  }
  else
  {
    uint64_t v24 = v22;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v42);
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
    uint64_t v25 = v39[1];
    unint64_t result = sub_2523C6B74();
    uint64_t v27 = *(unsigned __int8 *)(v25 + 32);
    if ((v27 & 0xC0) == 0x80)
    {
      uint64_t v28 = result;
      char v29 = v26 & 1;
      uint64_t v30 = *(void *)(v25 + 16);
      unint64_t v31 = *(void *)(v25 + 24);
      *(void *)(v25 + 16) = 0;
      *(void *)(v25 + 24) = 0;
      *(unsigned char *)(v25 + 32) = -64;
      uint64_t v32 = swift_bridgeObjectRetain();
      sub_2523AB03C(v32, v31, v27);
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v41[0] = v30;
      sub_2523C60C8(v24, v28, v29, isUniquelyReferenced_nonNull_native);
      uint64_t v34 = v41[0];
      swift_bridgeObjectRelease();
      uint64_t v35 = *(void *)(v25 + 16);
      unint64_t v36 = *(void *)(v25 + 24);
      *(void *)(v25 + 16) = v34;
      *(void *)(v25 + 24) = 0;
      char v37 = *(unsigned char *)(v25 + 32);
      *(unsigned char *)(v25 + 32) = 0x80;
      sub_2523AB03C(v35, v36, v37);
      return swift_release();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_2523C43EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v59 = a4;
  uint64_t v11 = *(void *)(a3 + 16);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_2523C7588();
  uint64_t v64 = *(void *)(v15 - 8);
  uint64_t v65 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v63 = (char *)&v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v55 - v18;
  unint64_t v62 = v6;
  uint64_t v20 = v6[1];
  uint64_t v21 = *(void *)(a3 + 24);
  uint64_t result = sub_2523C6B74();
  if ((*(unsigned char *)(v20 + 32) & 0xC0) != 0x80) {
    goto LABEL_20;
  }
  uint64_t v24 = result;
  uint64_t v61 = a2;
  uint64_t v55 = v14;
  uint64_t v56 = v21;
  uint64_t v57 = a5;
  uint64_t v58 = a6;
  int v25 = v23 & 1;
  uint64_t v26 = *(void *)(v20 + 16);
  if (*(void *)(v26 + 16))
  {
    uint64_t result = sub_2523C5D48(result, v23 & 1);
    if (v27)
    {
      uint64_t v28 = *(void *)(*(void *)(v26 + 56) + 8 * result);
      if ((*(unsigned char *)(v28 + 32) & 0xC0) != 0x80)
      {
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
      swift_retain();
LABEL_8:
      uint64_t v60 = *v62;
      unint64_t v39 = v62[2];
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v19, v61, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v19, 0, 1, v11);
      uint64_t v40 = v63;
      uint64_t v41 = v64;
      uint64_t v42 = v65;
      (*(void (**)(char *, char *, uint64_t))(v64 + 16))(v63, v19, v65);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v40, 1, v11) == 1)
      {
        unint64_t v43 = *(void (**)(char *, uint64_t))(v41 + 8);
        uint64_t v44 = v60;
        swift_retain();
        v43(v19, v42);
        v43(v40, v42);
        swift_retain();
        uint64_t v45 = v44;
LABEL_16:
        uint64_t v66 = v45;
        uint64_t v67 = v28;
        unint64_t v68 = v39;
        _s12ValueEncoderV14KeyedContainerVMa();
        swift_getWitnessTable();
        return sub_2523C76E8();
      }
      unint64_t v46 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
      uint64_t v47 = v55;
      v46(v55, v40, v11);
      uint64_t v48 = (uint64_t *)swift_allocObject();
      uint64_t v49 = v56;
      v48[5] = v11;
      v48[6] = v49;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v48 + 2);
      v46((char *)boxed_opaque_existential_1, v47, v11);
      uint64_t v51 = *(void (**)(char *, uint64_t))(v41 + 8);
      uint64_t v45 = v60;
      swift_retain();
      v51(v19, v42);
      v48[7] = v39;
      if (v39 >> 62)
      {
        if (v39 >> 62 != 1)
        {
          uint64_t v54 = 1;
          goto LABEL_15;
        }
        uint64_t v52 = (uint64_t *)((v39 & 0x3FFFFFFFFFFFFFFFLL) + 32);
      }
      else
      {
        uint64_t v52 = (uint64_t *)(v39 + 64);
      }
      uint64_t v53 = *v52;
      uint64_t result = swift_retain();
      uint64_t v54 = v53 + 1;
      if (!__OFADD__(v53, 1))
      {
LABEL_15:
        v48[8] = v54;
        unint64_t v39 = (unint64_t)v48;
        goto LABEL_16;
      }
      __break(1u);
      goto LABEL_19;
    }
  }
  LODWORD(v60) = v25;
  uint64_t v29 = v24;
  unint64_t v30 = sub_2523C6794(MEMORY[0x263F8EE78]);
  _s14ValueReferenceCMa();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v30;
  *(void *)(result + 24) = 0;
  *(unsigned char *)(result + 32) = 0x80;
  char v31 = *(unsigned char *)(v20 + 32);
  if ((v31 & 0xC0) == 0x80)
  {
    uint64_t v28 = result;
    uint64_t v33 = *(void *)(v20 + 16);
    unint64_t v32 = *(void *)(v20 + 24);
    *(void *)(v20 + 16) = 0;
    *(void *)(v20 + 24) = 0;
    *(unsigned char *)(v20 + 32) = -64;
    swift_retain();
    sub_2523AB008(v33, v32, v31);
    sub_2523AB03C(v33, v32, v31);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v66 = v33;
    sub_2523C60C8(v28, v29, v60, isUniquelyReferenced_nonNull_native);
    uint64_t v35 = v66;
    swift_bridgeObjectRelease();
    uint64_t v36 = *(void *)(v20 + 16);
    unint64_t v37 = *(void *)(v20 + 24);
    *(void *)(v20 + 16) = v35;
    *(void *)(v20 + 24) = 0;
    char v38 = *(unsigned char *)(v20 + 32);
    *(unsigned char *)(v20 + 32) = 0x80;
    sub_2523AB03C(v36, v37, v38);
    swift_release();
    goto LABEL_8;
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_2523C48C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2523C7588();
  uint64_t v55 = *(void *)(v11 - 8);
  uint64_t v56 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v54 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v49 - v14;
  uint64_t v53 = v3;
  uint64_t v16 = v3[1];
  uint64_t v17 = *(void *)(a2 + 24);
  uint64_t result = sub_2523C6B74();
  uint64_t v57 = result;
  if ((*(unsigned char *)(v16 + 32) & 0xC0) != 0x80) {
    goto LABEL_20;
  }
  uint64_t v51 = a3;
  uint64_t v52 = a1;
  uint64_t v49 = v17;
  unint64_t v50 = v10;
  char v20 = v19 & 1;
  uint64_t v21 = *(void *)(v16 + 16);
  if (*(void *)(v21 + 16))
  {
    uint64_t result = sub_2523C5D48(v57, v19 & 1);
    if (v22)
    {
      uint64_t v23 = *(void *)(*(void *)(v21 + 56) + 8 * result);
      if ((*(unsigned char *)(v23 + 32) & 0xC0) != 0x40)
      {
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
      swift_retain();
LABEL_8:
      uint64_t v32 = *v53;
      unint64_t v33 = v53[2];
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v15, v52, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v15, 0, 1, v7);
      uint64_t v34 = v54;
      uint64_t v35 = v55;
      uint64_t v36 = v56;
      (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v54, v15, v56);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v34, 1, v7) == 1)
      {
        unint64_t v37 = *(void (**)(char *, uint64_t))(v35 + 8);
        swift_retain();
        v37(v15, v36);
        v37(v34, v36);
        swift_retain();
LABEL_16:
        uint64_t v48 = v51;
        v51[3] = (uint64_t)&_s12ValueEncoderV16UnkeyedContainerVN;
        uint64_t result = sub_2523C5CDC();
        v48[4] = result;
        *uint64_t v48 = v32;
        v48[1] = v23;
        v48[2] = v33;
        return result;
      }
      char v38 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
      uint64_t v57 = v32;
      unint64_t v39 = v50;
      v38(v50, v34, v7);
      uint64_t v40 = (uint64_t *)swift_allocObject();
      uint64_t v41 = v49;
      v40[5] = v7;
      v40[6] = v41;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v40 + 2);
      unint64_t v43 = v39;
      uint64_t v32 = v57;
      v38((char *)boxed_opaque_existential_1, v43, v7);
      uint64_t v44 = *(void (**)(char *, uint64_t))(v35 + 8);
      swift_retain();
      v44(v15, v36);
      v40[7] = v33;
      if (v33 >> 62)
      {
        if (v33 >> 62 != 1)
        {
          uint64_t v47 = 1;
          goto LABEL_15;
        }
        uint64_t v45 = (uint64_t *)((v33 & 0x3FFFFFFFFFFFFFFFLL) + 32);
      }
      else
      {
        uint64_t v45 = (uint64_t *)(v33 + 64);
      }
      uint64_t v46 = *v45;
      uint64_t result = swift_retain();
      uint64_t v47 = v46 + 1;
      if (!__OFADD__(v46, 1))
      {
LABEL_15:
        v40[8] = v47;
        unint64_t v33 = (unint64_t)v40;
        goto LABEL_16;
      }
      __break(1u);
      goto LABEL_19;
    }
  }
  _s14ValueReferenceCMa();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = MEMORY[0x263F8EE78];
  *(void *)(result + 24) = 0;
  *(unsigned char *)(result + 32) = 64;
  char v24 = *(unsigned char *)(v16 + 32);
  if ((v24 & 0xC0) == 0x80)
  {
    uint64_t v23 = result;
    uint64_t v25 = *(void *)(v16 + 16);
    unint64_t v26 = *(void *)(v16 + 24);
    *(void *)(v16 + 16) = 0;
    *(void *)(v16 + 24) = 0;
    *(unsigned char *)(v16 + 32) = -64;
    swift_retain();
    sub_2523AB008(v25, v26, v24);
    sub_2523AB03C(v25, v26, v24);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v58 = v25;
    sub_2523C60C8(v23, v57, v20, isUniquelyReferenced_nonNull_native);
    uint64_t v28 = v58;
    swift_bridgeObjectRelease();
    uint64_t v29 = *(void *)(v16 + 16);
    unint64_t v30 = *(void *)(v16 + 24);
    *(void *)(v16 + 16) = v28;
    *(void *)(v16 + 24) = 0;
    char v31 = *(unsigned char *)(v16 + 32);
    *(unsigned char *)(v16 + 32) = 0x80;
    sub_2523AB03C(v29, v30, v31);
    swift_release();
    goto LABEL_8;
  }
LABEL_21:
  __break(1u);
  return result;
}

void sub_2523C4D48()
{
}

uint64_t sub_2523C4DA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v7 = _s23ValueReferencingEncoderCMa();
  uint64_t v9 = *v3;
  uint64_t v8 = v3[1];
  uint64_t v11 = *(void *)(a2 + 16);
  uint64_t v10 = *(void *)(a2 + 24);
  swift_retain();
  unint64_t v12 = sub_2523C6B74();
  char v14 = v13 & 1;
  unint64_t v15 = *(void *)(v9 + 32);
  swift_retain();
  swift_retain();
  uint64_t v16 = sub_2523C707C(v9, a1, v12, v14, v15, v8, v7, v11, v10);
  swift_release();
  a3[3] = v7;
  uint64_t result = sub_2523C6AB0(qword_269C02F98, (void (*)(uint64_t))_s23ValueReferencingEncoderCMa);
  a3[4] = result;
  *a3 = v16;
  return result;
}

uint64_t sub_2523C4EB0()
{
  return sub_2523C32D0(*(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16));
}

unint64_t sub_2523C4EC4()
{
  return sub_2523C32D8();
}

unint64_t sub_2523C4EDC(char a1)
{
  return sub_2523C33E8(a1);
}

unint64_t sub_2523C4EF4(uint64_t a1, uint64_t a2)
{
  return sub_2523C3514(a1, a2);
}

unint64_t sub_2523C4F0C(double a1)
{
  return sub_2523C3644(a1);
}

unint64_t sub_2523C4F24(float a1)
{
  return sub_2523C376C(a1);
}

unint64_t sub_2523C4F3C(uint64_t a1)
{
  return sub_2523C3BBC(a1);
}

unint64_t sub_2523C4F54(char a1)
{
  return sub_2523C3880(a1);
}

unint64_t sub_2523C4F6C(__int16 a1)
{
  return sub_2523C3994(a1);
}

unint64_t sub_2523C4F84(int a1)
{
  return sub_2523C3AA8(a1);
}

uint64_t sub_2523C4F9C()
{
  return sub_2523C7A98();
}

unint64_t sub_2523C4FB4(uint64_t a1)
{
  return sub_2523C400C(a1);
}

unint64_t sub_2523C4FCC(unsigned __int8 a1)
{
  return sub_2523C3CD0(a1);
}

unint64_t sub_2523C4FE4(unsigned __int16 a1)
{
  return sub_2523C3DE4(a1);
}

unint64_t sub_2523C4FFC(unsigned int a1)
{
  return sub_2523C3EF8(a1);
}

uint64_t sub_2523C5014()
{
  return sub_2523C7AA8();
}

unint64_t sub_2523C502C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2523C4120(a1, a2, a5, a3, a4);
}

uint64_t sub_2523C5054()
{
  return sub_2523C7A88();
}

uint64_t sub_2523C5080()
{
  return sub_2523C79F8();
}

uint64_t sub_2523C5098()
{
  return sub_2523C79E8();
}

uint64_t sub_2523C50B0()
{
  return sub_2523C7A08();
}

uint64_t sub_2523C50CC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2523C52C0(a1, a2, a3, a4, MEMORY[0x263F8E3C0]);
}

uint64_t sub_2523C50F8()
{
  return sub_2523C7A18();
}

uint64_t sub_2523C5114(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2523C5218(a1, a2, a3, a4, MEMORY[0x263F8E3D8]);
}

uint64_t sub_2523C5140(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2523C526C(a1, a2, a3, a4, MEMORY[0x263F8E3E0]);
}

uint64_t sub_2523C516C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2523C52C0(a1, a2, a3, a4, MEMORY[0x263F8E3E8]);
}

uint64_t sub_2523C5198()
{
  return sub_2523C7A48();
}

uint64_t sub_2523C51B4()
{
  return sub_2523C7A58();
}

uint64_t sub_2523C51D0()
{
  return sub_2523C7A28();
}

uint64_t sub_2523C51EC(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2523C5218(a1, a2, a3, a4, MEMORY[0x263F8E3F8]);
}

uint64_t sub_2523C5218(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5(a1 & 0x1FF);
}

uint64_t sub_2523C5240(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2523C526C(a1, a2, a3, a4, MEMORY[0x263F8E408]);
}

uint64_t sub_2523C526C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5(a1 & 0x1FFFF);
}

uint64_t sub_2523C5294(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2523C52C0(a1, a2, a3, a4, MEMORY[0x263F8E410]);
}

uint64_t sub_2523C52C0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  return a5(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2523C52F0()
{
  return sub_2523C7A68();
}

uint64_t sub_2523C530C()
{
  return sub_2523C7A78();
}

uint64_t sub_2523C5328()
{
  return sub_2523C7A38();
}

uint64_t sub_2523C5354@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return sub_2523C43EC(a1, a2, a5, a3, a4, a6);
}

BOOL sub_2523C5374()
{
  swift_beginAccess();
  unint64_t v1 = v0[3];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2523C7678();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v3 = v0[4];
  swift_retain();
  uint64_t v4 = sub_2523A7798(v3);
  swift_release();
  uint64_t v5 = *(void *)(v4 + 16);
  swift_bridgeObjectRelease();
  unint64_t v6 = *(void *)(v0[9] + 32);
  swift_retain();
  uint64_t v7 = sub_2523A7798(v6);
  swift_release();
  uint64_t v8 = *(void *)(v7 + 16);
  swift_bridgeObjectRelease();
  return v2 == v5 + ~v8;
}

uint64_t sub_2523C5480()
{
  j__swift_release(*(void *)(v0 + 48), *(void *)(v0 + 56), *(unsigned __int8 *)(v0 + 64));
  return swift_release();
}

uint64_t sub_2523C54B4()
{
  uint64_t v4 = v0;
  uint64_t v5 = (uint64_t *)(v0 + 16);
  swift_beginAccess();
  unint64_t v8 = *(void *)(v0 + 24);
  unint64_t v6 = (uint64_t *)(v0 + 24);
  unint64_t v7 = v8;
  if (v8 >> 62)
  {
    uint64_t v1 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2523C7678();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v9) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v9)
    {
LABEL_15:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      j__swift_release(*(void *)(v4 + 48), *(void *)(v4 + 56), *(unsigned __int8 *)(v4 + 64));
      swift_release();
      return v4;
    }
  }
  if (v9 == 1)
  {
    swift_beginAccess();
    uint64_t v10 = *v6;
    if ((unint64_t)*v6 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_2523C7678();
      swift_bridgeObjectRelease();
      if (v11)
      {
LABEL_6:
        sub_2523BFCB4();
        uint64_t v1 = v12;
        swift_endAccess();
        uint64_t v10 = *(void *)(v4 + 48);
        uint64_t v11 = *(void *)(v4 + 56);
        uint64_t v9 = *(char *)(v4 + 64);
        if ((v9 & 0x80000000) != 0)
        {
          char v18 = *(unsigned char *)(v10 + 32);
          if ((v18 & 0xC0) == 0x80)
          {
            uint64_t v20 = *(void *)(v10 + 16);
            unint64_t v19 = *(void *)(v10 + 24);
            *(void *)(v10 + 16) = 0;
            *(void *)(v10 + 24) = 0;
            *(unsigned char *)(v10 + 32) = -64;
            swift_retain();
            j__swift_retain(v10, v11, v9);
            sub_2523AB008(v20, v19, v18);
            sub_2523AB03C(v20, v19, v18);
            swift_retain();
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            sub_2523C60C8(v1, v11, v9 & 1, isUniquelyReferenced_nonNull_native);
            swift_bridgeObjectRelease();
            uint64_t v14 = *(void *)(v10 + 16);
            unint64_t v15 = *(void *)(v10 + 24);
            *(void *)(v10 + 16) = v20;
            *(void *)(v10 + 24) = 0;
            char v16 = *(unsigned char *)(v10 + 32);
            char v17 = 0x80;
            goto LABEL_14;
          }
          goto LABEL_24;
        }
        unint64_t v2 = *(void *)(v10 + 16);
        LOBYTE(v6) = *(unsigned char *)(v10 + 32);
        if ((v6 & 0xC0) != 0x40)
        {
LABEL_23:
          __break(1u);
LABEL_24:
          __break(1u);
          goto LABEL_25;
        }
        unint64_t v3 = *(void *)(v10 + 24);
        uint64_t v24 = *(void *)(v10 + 16);
        *(void *)(v10 + 16) = 0;
        *(void *)(v10 + 24) = 0;
        *(unsigned char *)(v10 + 32) = -64;
        swift_retain();
        j__swift_retain(v10, v11, v9);
        sub_2523AB008(v2, v3, (char)v6);
        sub_2523AB03C(v2, v3, (char)v6);
        if (!(v2 >> 62))
        {
          uint64_t v13 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_retain();
          if (v13 >= v11) {
            goto LABEL_10;
          }
          goto LABEL_21;
        }
LABEL_20:
        swift_retain();
        sub_2523AB008(v2, v3, (char)v6);
        uint64_t v23 = sub_2523C7678();
        sub_2523AB03C(v2, v3, (char)v6);
        if (v23 >= v11)
        {
LABEL_10:
          if ((v11 & 0x8000000000000000) == 0)
          {
            sub_2523C64A8(v11, v11, v1);
            uint64_t v14 = *(void *)(v10 + 16);
            unint64_t v15 = *(void *)(v10 + 24);
            *(void *)(v10 + 16) = v24;
            *(void *)(v10 + 24) = 0;
            char v16 = *(unsigned char *)(v10 + 32);
            char v17 = 64;
LABEL_14:
            *(unsigned char *)(v10 + 32) = v17;
            sub_2523AB03C(v14, v15, v16);
            swift_release_n();
            j__swift_release(v10, v11, v9);
            goto LABEL_15;
          }
          goto LABEL_22;
        }
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v11) {
        goto LABEL_6;
      }
    }
    __break(1u);
    goto LABEL_20;
  }
LABEL_25:
  uint64_t result = sub_2523C7668();
  __break(1u);
  return result;
}

uint64_t sub_2523C5840()
{
  uint64_t v0 = sub_2523C54B4();
  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t _s23ValueReferencingEncoderCMa()
{
  return self;
}

uint64_t _s23ValueReferencingEncoderC9ReferenceOwxx(uint64_t a1)
{
  return j__swift_release(*(void *)a1, *(void *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
}

uint64_t _s23ValueReferencingEncoderC9ReferenceOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = *((unsigned __int8 *)a2 + 16);
  j__swift_retain(*a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t *_s23ValueReferencingEncoderC9ReferenceOwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = *((unsigned __int8 *)a2 + 16);
  j__swift_retain(*a2, v4, v5);
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  uint64_t v8 = *((unsigned __int8 *)a1 + 16);
  *((unsigned char *)a1 + 16) = v5;
  j__swift_release(v6, v7, v8);
  return a1;
}

uint64_t *_s23ValueReferencingEncoderC9ReferenceOwta(uint64_t *a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = *((unsigned __int8 *)a1 + 16);
  *((unsigned char *)a1 + 16) = v3;
  j__swift_release(v4, v5, v6);
  return a1;
}

uint64_t _s23ValueReferencingEncoderC9ReferenceOwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x3FFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 0x3FFF);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 16) >> 7) | (2
                                              * ((*(void *)a1 >> 57) & 0x78 | *(void *)a1 & 7 | (((*(unsigned __int8 *)(a1 + 16) >> 1) & 0x3F) << 7)))) ^ 0x3FFF;
  if (v3 >= 0x3FFE) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t _s23ValueReferencingEncoderC9ReferenceOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3FFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 0x3FFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x3FFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3FFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 1) & 0x1FFF | ((-a2 & 0x3FFF) << 13);
      *(void *)uint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
      *(void *)(result + 8) = 0;
      *(unsigned char *)(result + 16) = (v3 >> 6) & 0xFE;
    }
  }
  return result;
}

uint64_t sub_2523C5A80(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 7;
}

uint64_t sub_2523C5A8C(uint64_t result)
{
  *(unsigned char *)(result + 16) &= ~0x80u;
  return result;
}

uint64_t sub_2523C5A9C(uint64_t result, char a2)
{
  char v2 = *(unsigned char *)(result + 16) & 1 | (a2 << 7);
  *(void *)result &= 0xFFFFFFFFFFFFFF8uLL;
  *(unsigned char *)(result + 16) = v2;
  return result;
}

ValueMetadata *_s23ValueReferencingEncoderC9ReferenceOMa()
{
  return &_s23ValueReferencingEncoderC9ReferenceON;
}

uint64_t _s26ValueEncoderImplementationC7StorageVwxx()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s26ValueEncoderImplementationC7StorageVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s26ValueEncoderImplementationC7StorageVwca(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *_s26ValueEncoderImplementationC7StorageVwta(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s26ValueEncoderImplementationC7StorageVwet(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s26ValueEncoderImplementationC7StorageVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *_s26ValueEncoderImplementationC7StorageVMa()
{
  return &_s26ValueEncoderImplementationC7StorageVN;
}

uint64_t sub_2523C5C84(uint64_t a1)
{
  uint64_t result = sub_2523C6AB0(&qword_269C02F70, (void (*)(uint64_t))_s26ValueEncoderImplementationCMa);
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2523C5CDC()
{
  unint64_t result = qword_269C02F80;
  if (!qword_269C02F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C02F80);
  }
  return result;
}

uint64_t _s12ValueEncoderV14KeyedContainerVMa()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_2523C5D48(uint64_t a1, char a2)
{
  sub_2523C7AC8();
  sub_2523C7B18();
  uint64_t v4 = sub_2523C7B28();
  return sub_2523C6254(a1, a2 & 1, v4);
}

uint64_t sub_2523C5DC8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02F88);
  char v34 = a2;
  uint64_t result = sub_2523C7698();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    unint64_t v33 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v32 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v32) {
          goto LABEL_33;
        }
        unint64_t v21 = v33[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v21 = v33[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v32)
            {
LABEL_33:
              if ((v34 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
              if (v31 >= 64) {
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *unint64_t v33 = -1 << v31;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v33[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v32) {
                  goto LABEL_33;
                }
                unint64_t v21 = v33[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(void *)(v5 + 48) + 12 * v19;
      uint64_t v28 = *(void *)v27;
      char v29 = *(unsigned char *)(v27 + 8);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + 8 * v19);
      if ((v34 & 1) == 0) {
        swift_retain();
      }
      sub_2523C7AC8();
      sub_2523C7B18();
      uint64_t result = sub_2523C7B28();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v17 = *(void *)(v7 + 48) + 12 * v16;
      *(void *)uint64_t v17 = v28;
      *(unsigned char *)(v17 + 8) = v29;
      *(void *)(*(void *)(v7 + 56) + 8 * v16) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_2523C60C8(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v5 = (void **)v4;
  char v9 = a3 & 1;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_2523C5D48(a2, a3 & 1);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    unint64_t v18 = *v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      unint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2523C62EC();
    goto LABEL_7;
  }
  sub_2523C5DC8(v15, a4 & 1);
  unint64_t v21 = sub_2523C5D48(a2, v9);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_15:
    unint64_t result = sub_2523C7AB8();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  unint64_t v18 = *v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  return sub_2523C6200(v12, a2, v9, a1, v18);
}

unint64_t sub_2523C6200(unint64_t result, uint64_t a2, char a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = a5[6] + 12 * result;
  *(void *)uint64_t v5 = a2;
  *(unsigned char *)(v5 + 8) = a3 & 1;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_2523C6254(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t result = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = __ROR8__(a1, 32);
    a1 = a1;
    if ((a2 & 1) == 0) {
      a1 = v8;
    }
    do
    {
      uint64_t v9 = *(void *)(v3 + 48) + 12 * result;
      uint64_t v10 = __ROR8__(*(void *)v9, 32);
      if (*(unsigned char *)(v9 + 8)) {
        uint64_t v11 = *(void *)v9;
      }
      else {
        uint64_t v11 = v10;
      }
      if (v11 == a1) {
        break;
      }
      unint64_t result = (result + 1) & v7;
    }
    while (((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

void *sub_2523C62EC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02F88);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2523C7688();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v16 = 12 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 12 * v15;
    uint64_t v18 = *(void *)v17;
    LOBYTE(v17) = *(unsigned char *)(v17 + 8);
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v21 = v18;
    *(unsigned char *)(v21 + 8) = v17;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    unint64_t result = (void *)swift_retain();
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

uint64_t sub_2523C64A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = a1;
    unint64_t v7 = *v4;
    if (!(*v4 >> 62))
    {
      if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_2523C7678();
  swift_bridgeObjectRelease();
  if (v23 < v5) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v9 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v8 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2523C7678();
    swift_bridgeObjectRelease();
    uint64_t v11 = v10 + v8;
    if (!__OFADD__(v10, v8)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_2523C7678();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  unint64_t v7 = *v4;
  if (*v4 >> 62) {
    goto LABEL_36;
  }
  uint64_t v10 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v11 = v10 + v8;
  if (__OFADD__(v10, v8)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v7 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v4 = v7;
  uint64_t v10 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v7 & 0x8000000000000000) == 0 && (v7 & 0x4000000000000000) == 0)
  {
    uint64_t v13 = v7 & 0xFFFFFFFFFFFFFF8;
    if (v11 <= *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v10 = 1;
  }
  if (v7 >> 62) {
    goto LABEL_39;
  }
  uint64_t v14 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v14 <= v11) {
    uint64_t v14 = v11;
  }
  swift_bridgeObjectRetain();
  unint64_t v7 = MEMORY[0x2533B3A20](v10, v14, 1, v7);
  swift_bridgeObjectRelease();
  *uint64_t v4 = v7;
  uint64_t v13 = v7 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  unint64_t v15 = (void *)(v13 + 32 + 8 * v6);
  _s14ValueReferenceCMa();
  swift_arrayDestroy();
  if (v8)
  {
    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_2523C7678();
      swift_bridgeObjectRelease();
      uint64_t v17 = v24 - v5;
      if (!__OFSUB__(v24, v5))
      {
LABEL_21:
        if (v17 < 0)
        {
LABEL_46:
          uint64_t result = sub_2523C76B8();
          __break(1u);
          return result;
        }
        uint64_t v18 = (char *)(v15 + 1);
        uint64_t v19 = (char *)(v13 + 32 + 8 * v5);
        if (v15 + 1 != (void *)v19 || v18 >= &v19[8 * v17]) {
          memmove(v18, v19, 8 * v17);
        }
        if (!(v7 >> 62))
        {
          uint64_t v20 = *(void *)(v13 + 16);
          uint64_t v21 = v20 + v8;
          if (!__OFADD__(v20, v8))
          {
LABEL_27:
            *(void *)(v13 + 16) = v21;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_2523C7678();
        swift_bridgeObjectRelease();
        uint64_t v21 = v25 + v8;
        if (!__OFADD__(v25, v8)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v16 = *(void *)(v13 + 16);
      uint64_t v17 = v16 - v5;
      if (!__OFSUB__(v16, v5)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:
  *unint64_t v15 = v3;
  return sub_2523C74F8();
}

unint64_t sub_2523C6794(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C02F88);
  uint64_t v3 = (void *)sub_2523C76A8();
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  unint64_t result = sub_2523C5D48(v4, v5);
  if (v8)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }
  uint64_t v9 = (void *)(a1 + 72);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = v3[6] + 12 * result;
    *(void *)uint64_t v10 = v4;
    *(unsigned char *)(v10 + 8) = v5 & 1;
    *(void *)(v3[7] + 8 * result) = v6;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v3[2] = v13;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v14 = v9 + 3;
    uint64_t v4 = *(v9 - 2);
    char v5 = *((unsigned char *)v9 - 8);
    uint64_t v15 = *v9;
    swift_retain();
    unint64_t result = sub_2523C5D48(v4, v5);
    uint64_t v9 = v14;
    uint64_t v6 = v15;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2523C68C0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2523C6904(uint64_t result)
{
  char v1 = *(unsigned char *)(result + 32);
  if ((v1 & 0xC0) == 0x40)
  {
    unint64_t v2 = *(void *)(result + 16);
    if (v2 >> 62)
    {
      unint64_t v3 = *(void *)(result + 24);
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_2523C7678();
      sub_2523AB03C(v2, v3, v1);
      return v4;
    }
    else
    {
      return *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2523C698C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 72) = a1;
  *(void *)(v4 + 48) = a4;
  *(void *)(v4 + 56) = a2;
  *(unsigned char *)(v4 + 64) = 0;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  unint64_t v9 = a3 >> 62;
  if (a3 >> 62)
  {
    if (v9 != 1)
    {
      uint64_t v12 = 1;
      goto LABEL_6;
    }
    uint64_t v10 = (uint64_t *)((a3 & 0x3FFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    uint64_t v10 = (uint64_t *)(a3 + 64);
  }
  uint64_t v11 = *v10;
  swift_retain();
  uint64_t v12 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_11;
  }
LABEL_6:
  *(void *)(v8 + 32) = v12;
  if (!v9)
  {
LABEL_11:
    uint64_t v13 = *(void *)(a3 + 64);
    goto LABEL_12;
  }
  if (v9 != 1)
  {
    swift_retain();
    uint64_t v13 = 0;
    goto LABEL_14;
  }
  uint64_t v13 = *(void *)((a3 & 0x3FFFFFFFFFFFFFFFLL) + 0x20);
LABEL_12:
  swift_retain();
  swift_release();
LABEL_14:
  swift_beginAccess();
  uint64_t v14 = MEMORY[0x263F8EE78];
  *(void *)(v4 + 16) = *(void *)(a1 + 16);
  *(void *)(v4 + 24) = v14;
  *(void *)(v4 + 32) = v8 | 0x4000000000000000;
  *(void *)(v4 + 40) = v13;
  swift_bridgeObjectRetain();
  return v4;
}

uint64_t sub_2523C6AB0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2523C6AF8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2523C6B34()
{
  sub_2523A7A10(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
  return MEMORY[0x270FA0238](v0, 41, 7);
}

unint64_t sub_2523C6B74()
{
  unint64_t v0 = sub_2523C7B38();
  if (v1)
  {
LABEL_5:
    sub_2523C7668();
    __break(1u);
    goto LABEL_6;
  }
  if ((v0 & 0x8000000000000000) == 0)
  {
    unint64_t result = sub_2523A7360(v0);
    if (v3 != -1) {
      return result;
    }
    __break(1u);
    goto LABEL_5;
  }
LABEL_6:
  unint64_t result = sub_2523C7658();
  __break(1u);
  return result;
}

uint64_t sub_2523C6C5C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v48 = a5;
  *(void *)&long long v50 = a8;
  *((void *)&v50 + 1) = a9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v49);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a8 - 8) + 32))(boxed_opaque_existential_1, a2, a8);
  uint64_t v46 = a6;
  uint64_t v47 = a1;
  *(void *)(a7 + 72) = a1;
  *(void *)(a7 + 48) = a6;
  *(void *)(a7 + 56) = a3;
  uint64_t v45 = (void *)a7;
  *(unsigned char *)(a7 + 64) = a4 & 1 | 0x80;
  long long v44 = v50;
  uint64_t v17 = v50;
  uint64_t v18 = __swift_project_boxed_opaque_existential_1(v49, v50);
  uint64_t v19 = sub_2523C7588();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(void *)(v20 + 64);
  MEMORY[0x270FA5388](v19);
  int64_t v22 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = *(void *)(v17 - 8);
  (*(void (**)(char *, void *, uint64_t))(v23 + 16))(v22, v18, v17);
  uint64_t v24 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v22, 0, 1, v17);
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v44 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v22, v22, v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v22, 1, v17) == 1)
  {
    uint64_t v28 = *(void (**)(char *, uint64_t))(v20 + 8);
    uint64_t v29 = v47;
    swift_retain();
    swift_retain();
    v28(v22, v19);
    v28(v22, v19);
    unint64_t v30 = v48;
    swift_retain();
    swift_release();
    unint64_t v31 = v30 >> 62;
    uint64_t v32 = v30;
    if (v30 >> 62)
    {
LABEL_3:
      if (v31 != 1)
      {
        uint64_t v38 = 0;
LABEL_14:
        uint64_t v42 = v45;
        swift_beginAccess();
        uint64_t v43 = MEMORY[0x263F8EE78];
        v42[2] = *(void *)(v29 + 16);
        v42[3] = v43;
        v42[4] = v32;
        v42[5] = v38;
        swift_bridgeObjectRetain();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
        return (uint64_t)v42;
      }
      unint64_t v33 = (uint64_t *)((v30 & 0x3FFFFFFFFFFFFFFFLL) + 32);
LABEL_13:
      uint64_t v38 = *v33;
      swift_release();
      goto LABEL_14;
    }
LABEL_12:
    unint64_t v33 = (uint64_t *)(v30 + 64);
    goto LABEL_13;
  }
  char v34 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
  v34(v27, v22, v17);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 40) = v44;
  uint64_t v35 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v32 + 16));
  v34((char *)v35, v27, v17);
  uint64_t v36 = *(void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v29 = v47;
  swift_retain();
  swift_retain();
  v36(v22, v19);
  unint64_t v30 = v48;
  *(void *)(v32 + 56) = v48;
  unint64_t v31 = v30 >> 62;
  if (v30 >> 62)
  {
    if (v31 != 1)
    {
      uint64_t v41 = 1;
LABEL_11:
      *(void *)(v32 + 64) = v41;
      swift_release();
      if (v31) {
        goto LABEL_3;
      }
      goto LABEL_12;
    }
    unint64_t v37 = (uint64_t *)((v30 & 0x3FFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    unint64_t v37 = (uint64_t *)(v30 + 64);
  }
  uint64_t v39 = *v37;
  uint64_t result = swift_retain();
  uint64_t v41 = v39 + 1;
  if (!__OFADD__(v39, 1)) {
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_2523C707C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v21 = a6;
  uint64_t v14 = *(void *)(a8 - 8);
  char v15 = a4 & 1;
  MEMORY[0x270FA5388](a1);
  uint64_t v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s23ValueReferencingEncoderCMa();
  uint64_t v18 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, a2, a8);
  return sub_2523C6C5C(a1, (uint64_t)v17, a3, v15, a5, v21, v18, a8, a9);
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *_s12ValueEncoderV16UnkeyedContainerVMa()
{
  return &_s12ValueEncoderV16UnkeyedContainerVN;
}

uint64_t sub_2523C71E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t _s12ValueEncoderV16UnkeyedContainerVwxx_0()
{
  swift_release();
  swift_release();
  return swift_release();
}

void *_s12ValueEncoderV16UnkeyedContainerVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *_s12ValueEncoderV16UnkeyedContainerVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s12ValueEncoderV16UnkeyedContainerVwta_0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t _s12ValueEncoderV16UnkeyedContainerVwet_0(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_2523C73A8(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_2523C73E8(uint64_t a1)
{
  return sub_2523C1300(a1);
}

uint64_t sub_2523C7400(uint64_t a1)
{
  return sub_2523C13A8(a1);
}

ValueMetadata *type metadata accessor for MTR()
{
  return &type metadata for MTR;
}

uint64_t sub_2523C7428()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2523C7438()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2523C7448()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2523C7458()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_2523C7468()
{
  return MEMORY[0x270F9D220]();
}

uint64_t sub_2523C7488()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2523C7498()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t sub_2523C74A8()
{
  return MEMORY[0x270F9DAD0]();
}

uint64_t sub_2523C74B8()
{
  return MEMORY[0x270F9DAE0]();
}

uint64_t sub_2523C74C8()
{
  return MEMORY[0x270F9DB50]();
}

uint64_t sub_2523C74D8()
{
  return MEMORY[0x270F9DB60]();
}

uint64_t sub_2523C74E8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2523C74F8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2523C7508()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2523C7518()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_2523C7528()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2523C7538()
{
  return MEMORY[0x270F9DDF0]();
}

uint64_t sub_2523C7548()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_2523C7558()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_2523C7568()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2523C7578()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2523C7588()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2523C7598()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2523C75A8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2523C75B8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2523C75C8()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2523C75D8()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2523C75E8()
{
  return MEMORY[0x270F9EAA0]();
}

uint64_t sub_2523C75F8()
{
  return MEMORY[0x270F9EAB8]();
}

uint64_t sub_2523C7608()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_2523C7618()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_2523C7628()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_2523C7638()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_2523C7648()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2523C7658()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2523C7668()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2523C7678()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2523C7688()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2523C7698()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2523C76A8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2523C76B8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2523C76C8()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_2523C76D8()
{
  return MEMORY[0x270F9F380]();
}

uint64_t sub_2523C76E8()
{
  return MEMORY[0x270F9F4B0]();
}

uint64_t sub_2523C76F8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2523C7708()
{
  return MEMORY[0x270F9F5B0]();
}

uint64_t sub_2523C7718()
{
  return MEMORY[0x270F9F5B8]();
}

uint64_t sub_2523C7728()
{
  return MEMORY[0x270F9F5C0]();
}

uint64_t sub_2523C7738()
{
  return MEMORY[0x270F9F5C8]();
}

uint64_t sub_2523C7748()
{
  return MEMORY[0x270F9F5D0]();
}

uint64_t sub_2523C7758()
{
  return MEMORY[0x270F9F5D8]();
}

uint64_t sub_2523C7768()
{
  return MEMORY[0x270F9F5E0]();
}

uint64_t sub_2523C7778()
{
  return MEMORY[0x270F9F5E8]();
}

uint64_t sub_2523C7788()
{
  return MEMORY[0x270F9F5F0]();
}

uint64_t sub_2523C7798()
{
  return MEMORY[0x270F9F5F8]();
}

uint64_t sub_2523C77A8()
{
  return MEMORY[0x270F9F688]();
}

uint64_t sub_2523C77B8()
{
  return MEMORY[0x270F9F690]();
}

uint64_t sub_2523C77C8()
{
  return MEMORY[0x270F9F698]();
}

uint64_t sub_2523C77D8()
{
  return MEMORY[0x270F9F6A0]();
}

uint64_t sub_2523C77E8()
{
  return MEMORY[0x270F9F6A8]();
}

uint64_t sub_2523C77F8()
{
  return MEMORY[0x270F9F6B0]();
}

uint64_t sub_2523C7808()
{
  return MEMORY[0x270F9F6B8]();
}

uint64_t sub_2523C7818()
{
  return MEMORY[0x270F9F6C0]();
}

uint64_t sub_2523C7828()
{
  return MEMORY[0x270F9F6C8]();
}

uint64_t sub_2523C7838()
{
  return MEMORY[0x270F9F6D0]();
}

uint64_t sub_2523C7848()
{
  return MEMORY[0x270F9F6D8]();
}

uint64_t sub_2523C7858()
{
  return MEMORY[0x270F9F6E0]();
}

uint64_t sub_2523C7868()
{
  return MEMORY[0x270F9F6E8]();
}

uint64_t sub_2523C7878()
{
  return MEMORY[0x270F9F6F0]();
}

uint64_t sub_2523C7888()
{
  return MEMORY[0x270F9F6F8]();
}

uint64_t sub_2523C7898()
{
  return MEMORY[0x270F9F700]();
}

uint64_t sub_2523C78A8()
{
  return MEMORY[0x270F9F708]();
}

uint64_t sub_2523C78B8()
{
  return MEMORY[0x270F9F710]();
}

uint64_t sub_2523C78C8()
{
  return MEMORY[0x270F9F718]();
}

uint64_t sub_2523C78D8()
{
  return MEMORY[0x270F9F720]();
}

uint64_t sub_2523C78E8()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_2523C78F8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2523C7908()
{
  return MEMORY[0x270F9F860]();
}

uint64_t sub_2523C7918()
{
  return MEMORY[0x270F9F868]();
}

uint64_t sub_2523C7928()
{
  return MEMORY[0x270F9F8F8]();
}

uint64_t sub_2523C7938()
{
  return MEMORY[0x270F9F900]();
}

uint64_t sub_2523C7948()
{
  return MEMORY[0x270F9F960]();
}

uint64_t sub_2523C7958()
{
  return MEMORY[0x270F9F968]();
}

uint64_t sub_2523C7968()
{
  return MEMORY[0x270F9F970]();
}

uint64_t sub_2523C7978()
{
  return MEMORY[0x270F9F978]();
}

uint64_t sub_2523C7988()
{
  return MEMORY[0x270F9F980]();
}

uint64_t sub_2523C7998()
{
  return MEMORY[0x270F9F988]();
}

uint64_t sub_2523C79A8()
{
  return MEMORY[0x270F9F990]();
}

uint64_t sub_2523C79B8()
{
  return MEMORY[0x270F9F998]();
}

uint64_t sub_2523C79C8()
{
  return MEMORY[0x270F9F9A0]();
}

uint64_t sub_2523C79D8()
{
  return MEMORY[0x270F9F9A8]();
}

uint64_t sub_2523C79E8()
{
  return MEMORY[0x270F9F9B0]();
}

uint64_t sub_2523C79F8()
{
  return MEMORY[0x270F9F9B8]();
}

uint64_t sub_2523C7A08()
{
  return MEMORY[0x270F9F9C0]();
}

uint64_t sub_2523C7A18()
{
  return MEMORY[0x270F9F9C8]();
}

uint64_t sub_2523C7A28()
{
  return MEMORY[0x270F9F9D0]();
}

uint64_t sub_2523C7A38()
{
  return MEMORY[0x270F9F9D8]();
}

uint64_t sub_2523C7A48()
{
  return MEMORY[0x270F9F9E0]();
}

uint64_t sub_2523C7A58()
{
  return MEMORY[0x270F9F9E8]();
}

uint64_t sub_2523C7A68()
{
  return MEMORY[0x270F9F9F0]();
}

uint64_t sub_2523C7A78()
{
  return MEMORY[0x270F9F9F8]();
}

uint64_t sub_2523C7A88()
{
  return MEMORY[0x270F9FA00]();
}

uint64_t sub_2523C7A98()
{
  return MEMORY[0x270F9FA08]();
}

uint64_t sub_2523C7AA8()
{
  return MEMORY[0x270F9FA10]();
}

uint64_t sub_2523C7AB8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2523C7AC8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2523C7AD8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2523C7AE8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2523C7AF8()
{
  return MEMORY[0x270F9FC70]();
}

uint64_t sub_2523C7B08()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_2523C7B18()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_2523C7B28()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2523C7B38()
{
  return MEMORY[0x270FA00A0]();
}

uint64_t sub_2523C7B48()
{
  return MEMORY[0x270FA00A8]();
}

uint64_t sub_2523C7B78()
{
  return MEMORY[0x270FA0128]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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