uint64_t MSeries.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t vars8;

  v3 = v1 + OBJC_IVAR____TtC14BookFoundation7MSeries_url;
  v4 = sub_2289DE880();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

id MSeries.__allocating_init(with:config:)(uint64_t a1, unsigned __int8 *a2)
{
  id v5 = objc_allocWithZone(v2);
  return MSeries.init(with:config:)(a1, a2);
}

unint64_t sub_2289D6234(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr))(a1 + 136))(&v2);
  unint64_t result = 0x6F622D6F69647561;
  switch((char)v2)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x73726F68747561;
      break;
    case 3:
      unint64_t result = 0x736B6F6F62;
      break;
    case 4:
      unint64_t result = 0x7265732D6B6F6F62;
      break;
    case 5:
      unint64_t result = 0x7365726E6567;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2289D6418()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC14BookFoundation7MSeries_url;
  uint64_t v2 = sub_2289DE880();
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

id MSeries.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MSeries();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t MSeries.isExplicit.getter()
{
  swift_getObjectType();
  uint64_t v0 = sub_2289D49E0(0);
  sub_2289D4D60();
  sub_2289B3B60(v0, MEMORY[0x263F8D310], (uint64_t)&v3);
  swift_bridgeObjectRelease();
  if (v4)
  {
    if (v3 == 0x746963696C707865 && v4 == 0xE800000000000000) {
      char v1 = 1;
    }
    else {
      char v1 = sub_2289DF480();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v1 = 0;
  }
  return v1 & 1;
}

uint64_t MSeries.fetchNextAssets()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_2289D66A4, 0, 0);
}

uint64_t sub_2289D66A4()
{
  uint64_t v1 = MSeries.assetsResourceSet.getter();
  v0[3] = v1;
  if (v1)
  {
    id v2 = objc_msgSend(self, sel_defaultBag);
    v0[4] = v2;
    uint64_t v3 = (void *)swift_task_alloc();
    v0[5] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_2289D67B8;
    return sub_228972468((uint64_t)v2, (uint64_t)&unk_2682843A0, 0);
  }
  else
  {
    id v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_2289D67B8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2289D85E8, 0, 0);
  }
  else
  {

    swift_release();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t MSeries.fetchAllAssets()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_2289D6920, 0, 0);
}

uint64_t sub_2289D6920()
{
  uint64_t v1 = MSeries.assetsResourceSet.getter();
  v0[3] = v1;
  if (v1)
  {
    if (*(void *)(v1 + 48))
    {
      id v2 = objc_msgSend(self, sel_defaultBag);
      v0[4] = v2;
      uint64_t v3 = (void *)swift_task_alloc();
      v0[5] = v3;
      *uint64_t v3 = v0;
      v3[1] = sub_2289D6A48;
      return sub_228972468((uint64_t)v2, (uint64_t)&unk_2682843A0, 0);
    }
    swift_release();
  }
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_2289D6A48()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_2289D6C7C;
  }
  else
  {

    uint64_t v3 = sub_2289D6B64;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_2289D6B64()
{
  if (*(void *)(v0[3] + 48))
  {
    id v1 = objc_msgSend(self, sel_defaultBag);
    v0[4] = v1;
    uint64_t v2 = (void *)swift_task_alloc();
    v0[5] = v2;
    void *v2 = v0;
    v2[1] = sub_2289D6A48;
    return sub_228972468((uint64_t)v1, (uint64_t)&unk_2682843A0, 0);
  }
  else
  {
    swift_release();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
}

uint64_t sub_2289D6C7C()
{
  swift_release();
  id v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2289D6CE8@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_2289DF3F0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t MSeries.authorNames.getter()
{
  swift_getObjectType();
  uint64_t v0 = sub_2289D49E0(0);
  uint64_t v1 = sub_228952BB0(&qword_268284000);
  sub_2289D4D60();
  sub_2289B3B60(v0, v1, (uint64_t)&v5);
  swift_bridgeObjectRelease();
  uint64_t v2 = v5;
  uint64_t v3 = sub_228952BB0(&qword_2682843F0);
  sub_2289D4DB4();
  sub_2289B3B60(v2, v3, (uint64_t)&v5);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2289D6EA4()
{
  return sub_2289DF590();
}

uint64_t sub_2289D6F00()
{
  return sub_2289DEC40();
}

uint64_t sub_2289D6F20()
{
  return sub_2289DF590();
}

uint64_t sub_2289D6F78@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_2289DF3F0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_2289D6FCC(void *a1@<X8>)
{
  *a1 = 0x53746E6572727563;
  a1[1] = 0xEB0000000074726FLL;
}

uint64_t MSeries.authors.getter()
{
  return sub_22896BAC8(@"authors");
}

unint64_t sub_2289D7000(unsigned __int8 a1)
{
  int v2 = a1;
  sub_2289DF560();
  sub_2289DF580();
  if (v2 != 6) {
    sub_2289DF570();
  }
  uint64_t v3 = sub_2289DF590();

  return sub_2289D7214(a1, v3);
}

unint64_t sub_2289D7094(uint64_t a1, uint64_t a2)
{
  sub_2289DF560();
  sub_2289DEC40();
  uint64_t v4 = sub_2289DF590();

  return sub_2289D72A0(a1, a2, v4);
}

unint64_t sub_2289D710C()
{
  unint64_t result = qword_268284EE8;
  if (!qword_268284EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268284EE8);
  }
  return result;
}

unint64_t sub_2289D7160(uint64_t a1)
{
  uint64_t v2 = sub_2289DF1E0();

  return sub_2289D7384(a1, v2);
}

unint64_t sub_2289D71A4(char a1)
{
  char v1 = a1 & 1;
  sub_2289DF560();
  sub_2289DF570();
  uint64_t v2 = sub_2289DF590();

  return sub_2289D744C(v1, v2);
}

unint64_t sub_2289D7214(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v6 = ~v4;
    do
    {
      int v7 = *(unsigned __int8 *)(*(void *)(v2 + 48) + result);
      if (v7 == 6)
      {
        if (a1 == 6) {
          return result;
        }
      }
      else if (a1 != 6 && v7 == a1)
      {
        return result;
      }
      unint64_t result = (result + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_2289D72A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2289DF480() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2289DF480() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2289D7384(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_22898D274(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x22A6A1DE0](v9, a1);
      sub_228952AFC((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_2289D744C(char a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if ((((a1 & 1) == 0) ^ *(unsigned char *)(v7 + result))) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_2289D7508(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_2289D7094(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_228998898();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_2289D7890(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

double sub_2289D75D8@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_2289D7160(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_228998A50();
      uint64_t v9 = v11;
    }
    sub_228952AFC(*(void *)(v9 + 48) + 40 * v6);
    sub_22897D02C((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_2289D7A68(v6, v9);
    *uint64_t v3 = v9;
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

unint64_t sub_2289D76D4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_2289DF1D0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2289DF560();
        sub_2289DF570();
        double result = sub_2289DF590();
        unint64_t v10 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (unsigned char *)(v11 + v3);
          v13 = (unsigned char *)(v11 + v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          v15 = (_OWORD *)(v14 + 32 * v3);
          v16 = (_OWORD *)(v14 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 2))
          {
            long long v9 = v16[1];
            _OWORD *v15 = *v16;
            v15[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_2289D7890(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_2289DF1D0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2289DF560();
        swift_bridgeObjectRetain();
        sub_2289DEC40();
        uint64_t v9 = sub_2289DF590();
        double result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          v15 = (void *)(v14 + 8 * v3);
          v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            void *v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_2289D7A68(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_2289DF1D0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_22898D274(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        uint64_t v10 = sub_2289DF1E0();
        double result = sub_228952AFC((uint64_t)v28);
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            v16 = (long long *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              long long v17 = *v16;
              long long v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            uint64_t v20 = (_OWORD *)(v19 + 32 * v3);
            BOOL v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              long long v9 = v21[1];
              *uint64_t v20 = *v21;
              v20[1] = v9;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *uint64_t v22 = v24 & v23;
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

void (*sub_2289D7C34(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_2289D7CE4(v6, a2, a3);
  return sub_2289D7C9C;
}

void sub_2289D7C9C(void *a1)
{
  char v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_2289D7CE4(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  int64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x22A6A1E70](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)int64_t v3 = v4;
    return sub_2289D7D64;
  }
  __break(1u);
  return result;
}

void sub_2289D7D64(id *a1)
{
}

uint64_t sub_2289D7D6C(unint64_t a1)
{
  uint64_t v9 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_2289DF380())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x22A6A1E70](i - 4, a1) : *(id *)(a1 + 8 * i);
      uint64_t v5 = v4;
      uint64_t v6 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      uint64_t v7 = MAsset.enrichIfNeeded(with:)();

      if (v7)
      {
        MEMORY[0x22A6A19F0]();
        if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_2289DEE40();
        }
        sub_2289DEE80();
        sub_2289DEE30();
      }
      if (v6 == v2)
      {
        swift_bridgeObjectRelease();
        return v9;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

unint64_t sub_2289D7EE4()
{
  unint64_t result = qword_268284EF0;
  if (!qword_268284EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268284EF0);
  }
  return result;
}

uint64_t type metadata accessor for MSeries()
{
  uint64_t result = qword_268284F28;
  if (!qword_268284F28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2289D7F84()
{
  return type metadata accessor for MSeries();
}

uint64_t sub_2289D7F8C()
{
  uint64_t result = sub_2289DE880();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for MSeries(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MSeries);
}

uint64_t dispatch thunk of MSeries.isBookSeries.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of MSeries.isAudiobookSeries.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

unsigned char *storeEnumTagSinglePayload for MSeries.MetaKeys(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2289D8168);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for MSeries.MetaKeys()
{
  return &type metadata for MSeries.MetaKeys;
}

unsigned char *storeEnumTagSinglePayload for MSeries.AuthorAttributes(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2289D826CLL);
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

ValueMetadata *type metadata accessor for MSeries.AuthorAttributes()
{
  return &type metadata for MSeries.AuthorAttributes;
}

uint64_t getEnumTagSinglePayload for MSeries.Attributes(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MSeries.Attributes(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x2289D8400);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MSeries.Attributes()
{
  return &type metadata for MSeries.Attributes;
}

unint64_t sub_2289D843C()
{
  unint64_t result = qword_268284F38;
  if (!qword_268284F38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268284F38);
  }
  return result;
}

unint64_t sub_2289D8494()
{
  unint64_t result = qword_268284F40;
  if (!qword_268284F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268284F40);
  }
  return result;
}

unint64_t sub_2289D84EC()
{
  unint64_t result = qword_268284F48;
  if (!qword_268284F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268284F48);
  }
  return result;
}

uint64_t sub_2289D8540()
{
  unint64_t v0 = sub_2289DF3F0();
  swift_bridgeObjectRelease();
  if (v0 >= 9) {
    return 9;
  }
  else {
    return v0;
  }
}

unint64_t sub_2289D858C()
{
  unint64_t result = qword_268284F60;
  if (!qword_268284F60)
  {
    sub_2289550A8(&qword_268284F58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268284F60);
  }
  return result;
}

BookFoundation::AssetArtistInfo __swiftcall AssetArtistInfo.init(id:name:)(Swift::String id, Swift::String name)
{
  Swift::String *v2 = id;
  v2[1] = name;
  result.name = name;
  result.id = id;
  return result;
}

uint64_t AssetArtistInfo.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AssetArtistInfo.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t destroy for AssetArtistInfo()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AssetArtistInfo(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AssetArtistInfo(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for AssetArtistInfo(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AssetArtistInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AssetArtistInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)BookFoundation::AssetArtistInfo result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for AssetArtistInfo()
{
  return &type metadata for AssetArtistInfo;
}

uint64_t BooksAppleAccountFeatureFlag.hash(into:)()
{
  return sub_2289DF570();
}

uint64_t BooksAppleAccountFeatureFlag.init(rawValue:)@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v2 = sub_2289DF270();
  uint64_t v4 = v3;
  if (v2 == sub_2289DF270() && v4 == v5)
  {
    uint64_t result = swift_bridgeObjectRelease_n();
    char v9 = 0;
  }
  else
  {
    char v7 = sub_2289DF480();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    char v9 = v7 ^ 1;
  }
  *a1 = v9 & 1;
  return result;
}

uint64_t BooksAppleAccountFeatureFlag.hashValue.getter()
{
  return sub_2289DF590();
}

void BooksAppleAccountFeatureFlag.rawValue.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = "AABranding";
  *(void *)(a1 + 8) = 10;
  *(unsigned char *)(a1 + 16) = 2;
}

uint64_t sub_2289D896C()
{
  uint64_t v0 = sub_2289DF270();
  uint64_t v2 = v1;
  if (v0 == sub_2289DF270() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2289DF480();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2289D8A0C()
{
  return sub_2289DF590();
}

uint64_t sub_2289D8A50()
{
  return sub_2289DF570();
}

uint64_t sub_2289D8A78()
{
  return sub_2289DF590();
}

uint64_t sub_2289D8AB8@<X0>(unsigned char *a1@<X8>)
{
  return BooksAppleAccountFeatureFlag.init(rawValue:)(a1);
}

void sub_2289D8AEC(uint64_t a1@<X8>)
{
  *(void *)a1 = "AABranding";
  *(void *)(a1 + 8) = 10;
  *(unsigned char *)(a1 + 16) = 2;
}

const char *sub_2289D8B08()
{
  return "AppleAccount";
}

const char *sub_2289D8B1C()
{
  return "AABranding";
}

uint64_t sub_2289D8B30()
{
  uint64_t v9 = MEMORY[0x263F8EE78];
  sub_22896C5B8(0, 1, 0);
  uint64_t v0 = v9;
  uint64_t v1 = sub_2289DF270();
  uint64_t v3 = v2;
  unint64_t v5 = *(void *)(v9 + 16);
  unint64_t v4 = *(void *)(v9 + 24);
  if (v5 >= v4 >> 1)
  {
    sub_22896C5B8(v4 > 1, v5 + 1, 1);
    uint64_t v0 = v9;
  }
  *(void *)(v0 + 16) = v5 + 1;
  uint64_t v6 = v0 + 16 * v5;
  *(void *)(v6 + 32) = v1;
  *(void *)(v6 + 40) = v3;
  sub_228952BB0(&qword_268284890);
  uint64_t v9 = sub_2289DF3B0();
  char v7 = (void *)swift_bridgeObjectRetain();
  sub_2289D8FC8(v7, 1, &v9);
  uint64_t result = swift_release();
  off_268284F68 = (_UNKNOWN *)v9;
  return result;
}

void *static BooksAppleAccountFeatureFlag.allCases.getter()
{
  return &unk_26DD0B1F0;
}

uint64_t BooksAppleAccountFeatureFlag.init(key:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (qword_268283EC0 != -1) {
    swift_once();
  }
  if (*((void *)off_268284F68 + 2))
  {
    sub_2289D7094(a1, a2);
    char v7 = v6;
    uint64_t result = swift_bridgeObjectRelease();
    char v9 = v7 ^ 1;
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v9 = 1;
  }
  *a3 = v9 & 1;
  return result;
}

void sub_2289D8D00(void *a1@<X8>)
{
  *a1 = &unk_26DD0B218;
}

uint64_t isFeatureEnabled(_:)()
{
  uint64_t v3 = &type metadata for BooksAppleAccountFeatureFlag;
  unint64_t v4 = sub_2289D8D60();
  char v0 = sub_2289DE9E0();
  sub_2289559D0((uint64_t)v2);
  return v0 & 1;
}

unint64_t sub_2289D8D60()
{
  unint64_t result = qword_268284F70;
  if (!qword_268284F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268284F70);
  }
  return result;
}

unint64_t sub_2289D8DB8()
{
  unint64_t result = qword_268284F78;
  if (!qword_268284F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268284F78);
  }
  return result;
}

_UNKNOWN **sub_2289D8E0C()
{
  return &protocol witness table for FeatureFlagsDomain.AppleAccount;
}

unint64_t sub_2289D8E18(uint64_t a1)
{
  unint64_t result = sub_2289D8E40();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2289D8E40()
{
  unint64_t result = qword_268284F80;
  if (!qword_268284F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268284F80);
  }
  return result;
}

unint64_t sub_2289D8E98()
{
  unint64_t result = qword_268284F88;
  if (!qword_268284F88)
  {
    sub_2289550A8(&qword_268284F90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268284F88);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for BooksAppleAccountFeatureFlag(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2289D8F90);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for BooksAppleAccountFeatureFlag()
{
  return &type metadata for BooksAppleAccountFeatureFlag;
}

void sub_2289D8FC8(void *a1, char a2, uint64_t *a3)
{
  LOBYTE(v4) = a2;
  uint64_t v6 = a1[2];
  swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_23;
  }
  uint64_t v8 = a1[4];
  uint64_t v7 = a1[5];
  swift_bridgeObjectRetain();
  if (!v7) {
    goto LABEL_23;
  }
  uint64_t v9 = *a3;
  unint64_t v10 = sub_2289D7094(v8, v7);
  uint64_t v12 = *(void *)(v9 + 16);
  BOOL v13 = (v11 & 1) == 0;
  BOOL v14 = __OFADD__(v12, v13);
  uint64_t v15 = v12 + v13;
  if (v14)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char v16 = v11;
  if (*(void *)(v9 + 24) < v15)
  {
    sub_228997F18(v15, v4 & 1);
    unint64_t v10 = sub_2289D7094(v8, v7);
    if ((v16 & 1) == (v17 & 1)) {
      goto LABEL_8;
    }
LABEL_6:
    unint64_t v10 = sub_2289DF500();
    __break(1u);
  }
  if (v4)
  {
LABEL_8:
    if (v16) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  unint64_t v20 = v10;
  sub_228999218();
  unint64_t v10 = v20;
  if (v16)
  {
LABEL_9:
    long long v18 = (void *)swift_allocError();
    swift_willThrow();
    id v19 = v18;
    sub_228952BB0(&qword_268284630);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_28;
  }
LABEL_12:
  uint64_t v21 = *a3;
  *(void *)(*a3 + 8 * (v10 >> 6) + 64) |= 1 << v10;
  uint64_t v22 = (uint64_t *)(*(void *)(v21 + 48) + 16 * v10);
  *uint64_t v22 = v8;
  v22[1] = v7;
  uint64_t v23 = *(void *)(v21 + 16);
  BOOL v14 = __OFADD__(v23, 1);
  uint64_t v24 = v23 + 1;
  if (v14)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    sub_2289DF250();
    sub_2289DEC90();
    sub_2289DF320();
    sub_2289DEC90();
    sub_2289DF340();
    __break(1u);
    return;
  }
  *(void *)(v21 + 16) = v24;
  if (v6 != 1)
  {
    unsigned int v4 = a1 + 7;
    unint64_t v25 = 1;
    while (v25 < a1[2])
    {
      uint64_t v8 = *(v4 - 1);
      uint64_t v7 = *v4;
      swift_bridgeObjectRetain();
      if (!v7) {
        goto LABEL_23;
      }
      uint64_t v26 = *a3;
      unint64_t v27 = sub_2289D7094(v8, v7);
      uint64_t v29 = *(void *)(v26 + 16);
      BOOL v30 = (v28 & 1) == 0;
      BOOL v14 = __OFADD__(v29, v30);
      uint64_t v31 = v29 + v30;
      if (v14) {
        goto LABEL_25;
      }
      char v16 = v28;
      if (*(void *)(v26 + 24) < v31)
      {
        sub_228997F18(v31, 1);
        unint64_t v27 = sub_2289D7094(v8, v7);
        if ((v16 & 1) != (v32 & 1)) {
          goto LABEL_6;
        }
      }
      if (v16) {
        goto LABEL_9;
      }
      uint64_t v33 = *a3;
      *(void *)(*a3 + 8 * (v27 >> 6) + 64) |= 1 << v27;
      v34 = (uint64_t *)(*(void *)(v33 + 48) + 16 * v27);
      uint64_t *v34 = v8;
      v34[1] = v7;
      uint64_t v35 = *(void *)(v33 + 16);
      BOOL v14 = __OFADD__(v35, 1);
      uint64_t v36 = v35 + 1;
      if (v14) {
        goto LABEL_26;
      }
      ++v25;
      *(void *)(v33 + 16) = v36;
      v4 += 2;
      if (v6 == v25) {
        goto LABEL_23;
      }
    }
    goto LABEL_27;
  }
LABEL_23:
  swift_bridgeObjectRelease_n();
}

uint64_t Comparable.clamped(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  if (sub_2289DEB50())
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16);
LABEL_4:
    uint64_t v10 = a3;
    uint64_t v11 = a1;
    goto LABEL_6;
  }
  a1 += *(int *)(sub_2289DEB70() + 36);
  char v9 = sub_2289DEB40();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16);
  if (v9) {
    goto LABEL_4;
  }
  uint64_t v10 = a3;
  uint64_t v11 = v4;
LABEL_6:

  return v8(v10, v11, a2);
}

uint64_t JSONDecoder.decode<A>(_:withJSONObject:options:)(uint64_t a1, void *a2, uint64_t a3)
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = self;
  sub_22895598C(a2, a2[3]);
  v13[0] = 0;
  id v6 = objc_msgSend(v5, sel_dataWithJSONObject_options_error_, sub_2289DF470(), a3, v13);
  swift_unknownObjectRelease();
  id v7 = v13[0];
  if (v6)
  {
    uint64_t v8 = sub_2289DE8A0();
    unint64_t v10 = v9;

    sub_2289DE5C0();
    return sub_2289A5FD8(v8, v10);
  }
  else
  {
    uint64_t v12 = v7;
    sub_2289DE7E0();

    return swift_willThrow();
  }
}

uint64_t MGenre.parentId.getter()
{
  return sub_2289D95D8();
}

unint64_t sub_2289D957C()
{
  unint64_t result = qword_268284F98;
  if (!qword_268284F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268284F98);
  }
  return result;
}

uint64_t MGenre.parentName.getter()
{
  return sub_2289D95D8();
}

uint64_t sub_2289D95D8()
{
  swift_getObjectType();
  uint64_t v0 = sub_2289D49E0(0);
  sub_2289D957C();
  sub_2289B3B60(v0, MEMORY[0x263F8D310], (uint64_t)&v2);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_2289D9668(char *a1, char *a2)
{
  return sub_228965A4C(*a1, *a2);
}

uint64_t sub_2289D9674()
{
  return sub_2289DF590();
}

uint64_t sub_2289D9754()
{
  sub_2289DEC40();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2289D981C()
{
  return sub_2289DF590();
}

uint64_t sub_2289D98F8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2289DA58C();
  *a1 = result;
  return result;
}

void sub_2289D9928(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE200000000000000;
  uint64_t v3 = 25705;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1701667182;
      goto LABEL_3;
    case 2:
      *a1 = 0x6449746E65726170;
      a1[1] = 0xE800000000000000;
      break;
    case 3:
      *a1 = 0x614E746E65726170;
      a1[1] = 0xEA0000000000656DLL;
      break;
    case 4:
      *a1 = 7107189;
      a1[1] = 0xE300000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t MGenre.name.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14BookFoundation6MGenre_name);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MGenre.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC14BookFoundation6MGenre_url;
  swift_beginAccess();
  uint64_t v4 = sub_2289DE880();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t MGenre.url.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC14BookFoundation6MGenre_url;
  swift_beginAccess();
  uint64_t v4 = sub_2289DE880();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*MGenre.url.modify())()
{
  return j__swift_endAccess;
}

id MGenre.__allocating_init(with:config:)(uint64_t a1, unsigned __int8 *a2)
{
  id v5 = objc_allocWithZone(v2);
  return MGenre.init(with:config:)(a1, a2);
}

id MGenre.init(with:config:)(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = sub_228952BB0(&qword_2682841E0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2289DE880();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(v36) = *a2;
  BOOL v13 = (void *)*((void *)a2 + 1);
  LOBYTE(v39) = 0;
  BOOL v14 = v2;
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_228952BB0(&qword_268284000);
  sub_22897B700();
  sub_2289B3B60(a1, v15, (uint64_t)&v37);
  swift_bridgeObjectRelease();
  uint64_t v16 = v37;
  if (!v37)
  {

LABEL_10:
    if (qword_26AECF788 != -1) {
      swift_once();
    }
    if (qword_268283E70 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_2289DEA10();
    sub_228952BF4(v20, (uint64_t)qword_268284188);
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_2289DE9F0();
    os_log_type_t v22 = sub_2289DF0A0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v35 = v24;
      *(_DWORD *)uint64_t v23 = 136315394;
      uint64_t v36 = ObjectType;
      uint64_t v37 = v24;
      uint64_t v39 = sub_22897ACBC(0x7365726E6567, 0xE600000000000000, &v37);
      sub_2289DF150();
      *(_WORD *)(v23 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_2289DEA90();
      unint64_t v27 = v26;
      swift_bridgeObjectRelease();
      uint64_t v39 = sub_22897ACBC(v25, v27, &v37);
      sub_2289DF150();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22894E000, v21, v22, "Missing genre data for %s: %s", (uint8_t *)v23, 0x16u);
      uint64_t v28 = v35;
      swift_arrayDestroy();
      MEMORY[0x22A6A29E0](v28, -1, -1);
      MEMORY[0x22A6A29E0](v23, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v35 = v10;
  LOBYTE(v39) = 1;
  sub_2289D957C();
  swift_bridgeObjectRetain();
  uint64_t v17 = ObjectType;
  sub_2289B3B60(v16, MEMORY[0x263F8D310], (uint64_t)&v37);
  swift_bridgeObjectRelease();
  uint64_t v18 = v38;
  if (!v38)
  {
    swift_bridgeObjectRelease();

    uint64_t ObjectType = v17;
    goto LABEL_10;
  }
  uint64_t v34 = v37;
  LOBYTE(v39) = 4;
  sub_2289B3B60(v16, MEMORY[0x263F8D310], (uint64_t)&v37);
  swift_bridgeObjectRelease();
  if (!v38)
  {
    swift_bridgeObjectRelease();

    goto LABEL_9;
  }
  sub_2289DE860();
  swift_bridgeObjectRelease();
  uint64_t v19 = v35;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v8, 1, v9) == 1)
  {
    swift_bridgeObjectRelease();

    sub_2289742D4((uint64_t)v8);
LABEL_9:
    uint64_t ObjectType = v17;
    goto LABEL_10;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v12, v8, v9);
  uint64_t v31 = (uint64_t *)&v14[OBJC_IVAR____TtC14BookFoundation6MGenre_name];
  *uint64_t v31 = v34;
  v31[1] = v18;
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(&v14[OBJC_IVAR____TtC14BookFoundation6MGenre_url], v12, v9);

  LOBYTE(v37) = v36;
  uint64_t v38 = (uint64_t)v13;
  id v29 = MResource.init(with:config:)(a1, (char *)&v37);
  char v32 = *(void (**)(char *, uint64_t))(v19 + 8);
  id v33 = v29;
  v32(v12, v9);
  if (v29) {

  }
  return v29;
}

void static MGenre.type.getter(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_2289DA204()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC14BookFoundation6MGenre_url;
  uint64_t v2 = sub_2289DE880();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

id MGenre.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2289DA340()
{
  return type metadata accessor for MGenre();
}

uint64_t type metadata accessor for MGenre()
{
  uint64_t result = qword_268284FA8;
  if (!qword_268284FA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2289DA394()
{
  uint64_t result = sub_2289DE880();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for MGenre.Attributes(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x2289DA4FCLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MGenre.Attributes()
{
  return &type metadata for MGenre.Attributes;
}

unint64_t sub_2289DA538()
{
  unint64_t result = qword_268284FB8;
  if (!qword_268284FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268284FB8);
  }
  return result;
}

uint64_t sub_2289DA58C()
{
  unint64_t v0 = sub_2289DF3F0();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t static MResourceType.classType(for:)(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  sub_2289DA77C(a1, a2, &v5);
  uint64_t result = 0;
  switch(v5)
  {
    case 1:
      uint64_t result = type metadata accessor for MAudiobookSeries();
      break;
    case 2:
      uint64_t result = type metadata accessor for MAuthor();
      break;
    case 3:
      uint64_t result = type metadata accessor for MBook();
      break;
    case 4:
      uint64_t result = type metadata accessor for MBookSeries();
      break;
    case 5:
      uint64_t result = type metadata accessor for MGenre();
      break;
    case 6:
      return result;
    default:
      uint64_t result = type metadata accessor for MAudiobook();
      break;
  }
  return result;
}

unint64_t MResourceType.name.getter()
{
  unint64_t result = 0x6F622D6F69647561;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x73726F68747561;
      break;
    case 3:
      unint64_t result = 0x736B6F6F62;
      break;
    case 4:
      unint64_t result = 0x7265732D6B6F6F62;
      break;
    case 5:
      unint64_t result = 0x7365726E6567;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2289DA77C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  if (a1 == 0x6F622D6F69647561 && a2 == 0xEB00000000736B6FLL || (sub_2289DF480() & 1) != 0)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002289E5C70 || (sub_2289DF480() & 1) != 0)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 1;
  }
  else if (a1 == 0x73726F68747561 && a2 == 0xE700000000000000 || (sub_2289DF480() & 1) != 0)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 2;
  }
  else if (a1 == 0x736B6F6F62 && a2 == 0xE500000000000000 || (sub_2289DF480() & 1) != 0)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 3;
  }
  else if (a1 == 0x7265732D6B6F6F62 && a2 == 0xEB00000000736569 || (sub_2289DF480() & 1) != 0)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 4;
  }
  else if (a1 == 0x7365726E6567 && a2 == 0xE600000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 5;
  }
  else
  {
    char v8 = sub_2289DF480();
    uint64_t result = swift_bridgeObjectRelease();
    if (v8) {
      char v7 = 5;
    }
    else {
      char v7 = 6;
    }
  }
  *a3 = v7;
  return result;
}

BookFoundation::MResourceType_optional __swiftcall MResourceType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 6;
  if ((unint64_t)rawValue < 6) {
    char v2 = rawValue;
  }
  *unint64_t v1 = v2;
  return (BookFoundation::MResourceType_optional)rawValue;
}

BookFoundation::MResourceType_optional sub_2289DAA24(Swift::Int *a1)
{
  return MResourceType.init(rawValue:)(*a1);
}

void sub_2289DAA2C(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t MResourceType.init(_:)@<X0>(unint64_t result@<X0>, unsigned char *a2@<X8>)
{
  if (result >= 6)
  {
    sub_2289DF250();
    sub_2289DEC90();
    type metadata accessor for __BFMResourceType(0);
    sub_2289DF320();
    sub_2289DEC90();
    uint64_t result = sub_2289DF340();
    __break(1u);
  }
  else
  {
    *a2 = result;
  }
  return result;
}

uint64_t MResourceType.bfmType.getter()
{
  return *v0;
}

unint64_t sub_2289DAB28()
{
  unint64_t result = qword_268284FC0;
  if (!qword_268284FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268284FC0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MResourceType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MResourceType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2289DACD8);
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

ValueMetadata *type metadata accessor for MResourceType()
{
  return &type metadata for MResourceType;
}

uint64_t sub_2289DAD14()
{
  return sub_2289DAD6C((uint64_t (*)(void))type metadata accessor for LibraryAudiobookInfo, (uint64_t (*)(void))type metadata accessor for LibraryAudiobookInfo);
}

uint64_t sub_2289DAD40()
{
  return sub_2289DAD6C((uint64_t (*)(void))type metadata accessor for LibraryBookInfo, (uint64_t (*)(void))type metadata accessor for LibraryBookInfo);
}

uint64_t sub_2289DAD6C(uint64_t (*a1)(void), uint64_t (*a2)(void))
{
  uint64_t v5 = sub_2289DF5D0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[3] = a1(0);
  uint64_t v9 = sub_22896EC88(v14);
  sub_2289DD5A0(v2, (uint64_t)v9, a2);
  sub_2289DF5A0();
  sub_2289DF5B0();
  v14[0] = sub_2289DF620();
  v14[1] = v10;
  sub_2289DEC90();
  sub_2289DF5C0();
  uint64_t v11 = sub_22898E834();
  swift_release();
  BOOL v13 = v11;
  sub_228952BB0(&qword_2682843F0);
  sub_2289746BC();
  sub_2289DEB30();
  swift_bridgeObjectRelease();
  sub_2289DEC90();
  swift_bridgeObjectRelease();
  sub_2289DEC90();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v14[0];
}

uint64_t sub_2289DAF28()
{
  return sub_2289DAD6C((uint64_t (*)(void))type metadata accessor for LibraryBookSeriesInfo, (uint64_t (*)(void))type metadata accessor for LibraryBookSeriesInfo);
}

uint64_t sub_2289DAF54()
{
  return sub_2289DAD6C((uint64_t (*)(void))type metadata accessor for BookInfo, (uint64_t (*)(void))type metadata accessor for BookInfo);
}

uint64_t sub_2289DAF80()
{
  return sub_2289DAD6C((uint64_t (*)(void))type metadata accessor for AudiobookInfo, (uint64_t (*)(void))type metadata accessor for AudiobookInfo);
}

uint64_t sub_2289DAFAC()
{
  return sub_2289DAD6C((uint64_t (*)(void))type metadata accessor for LibraryPDFInfo, (uint64_t (*)(void))type metadata accessor for LibraryPDFInfo);
}

uint64_t sub_2289DAFD8()
{
  return sub_2289DAD6C((uint64_t (*)(void))type metadata accessor for AudiobookSeriesInfo, (uint64_t (*)(void))type metadata accessor for AudiobookSeriesInfo);
}

uint64_t sub_2289DB004()
{
  return sub_2289DAD6C((uint64_t (*)(void))type metadata accessor for CommonLibraryAssetInfo, (uint64_t (*)(void))type metadata accessor for CommonLibraryAssetInfo);
}

uint64_t sub_2289DB030()
{
  return sub_2289DAD6C((uint64_t (*)(void))type metadata accessor for LibraryAudiobookSeriesInfo, (uint64_t (*)(void))type metadata accessor for LibraryAudiobookSeriesInfo);
}

uint64_t sub_2289DB05C()
{
  return sub_2289DAD6C((uint64_t (*)(void))type metadata accessor for PDFInfo, (uint64_t (*)(void))type metadata accessor for PDFInfo);
}

uint64_t BookSeriesInfo.init(dataSource:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_2289DB0C0(a1, a2);
  uint64_t result = type metadata accessor for BookSeriesInfo();
  *(void *)(a2 + *(int *)(result + 20)) = 0;
  return result;
}

uint64_t sub_2289DB0C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_228952BB0(&qword_2682846F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for BookSeriesInfo()
{
  uint64_t result = qword_268284FE0;
  if (!qword_268284FE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t BookSeriesInfo.init(dataSource:additionalStoreAssetsForEnrichment:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_2289DB0C0(a1, a3);
  uint64_t result = type metadata accessor for BookSeriesInfo();
  *(void *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t BookSeriesInfo.contentKind.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22899EA2C();
  swift_release();

  return swift_release();
}

void BookSeriesInfo.seriesType.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t BookSeriesInfo.dataSource.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2289DB23C(v1, a1);
}

uint64_t sub_2289DB23C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_228952BB0(&qword_2682846F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t BookSeriesInfo.additionalStoreAssetsForEnrichment.getter()
{
  type metadata accessor for BookSeriesInfo();

  return swift_bridgeObjectRetain();
}

uint64_t sub_2289DB2D8()
{
  return sub_2289DB584(&qword_268284228, (void (*)(uint64_t))type metadata accessor for BookInfo);
}

uint64_t sub_2289DB320()
{
  return sub_2289DB584(&qword_2682849B0, (void (*)(uint64_t))type metadata accessor for LibraryBookSeriesInfo);
}

void sub_2289DB368(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2289DB374()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22899EA2C();
  swift_release();

  return swift_release();
}

uint64_t sub_2289DB3E8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2289DB3F4(uint64_t a1)
{
  uint64_t result = sub_2289DB584(&qword_268284FC8, (void (*)(uint64_t))type metadata accessor for BookSeriesInfo);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2289DB44C()
{
  return sub_2289DB584(&qword_2682849A8, (void (*)(uint64_t))type metadata accessor for LibraryBookSeriesInfo);
}

uint64_t sub_2289DB494@<X0>(uint64_t a1@<X8>)
{
  return sub_2289DB23C(v1, a1);
}

uint64_t sub_2289DB4A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = sub_2289DB0C0(a1, a3);
  *(void *)(a3 + *(int *)(a2 + 20)) = 0;
  return result;
}

uint64_t sub_2289DB4D4(uint64_t a1)
{
  uint64_t result = sub_2289DB584(&qword_268284FD0, (void (*)(uint64_t))type metadata accessor for BookSeriesInfo);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2289DB52C(uint64_t a1)
{
  uint64_t result = sub_2289DB584(&qword_268284FD8, (void (*)(uint64_t))type metadata accessor for BookSeriesInfo);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2289DB584(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2289DB5CC()
{
  return sub_2289DAD6C((uint64_t (*)(void))type metadata accessor for BookSeriesInfo, (uint64_t (*)(void))type metadata accessor for BookSeriesInfo);
}

char *initializeBufferWithCopyOfBuffer for BookSeriesInfo(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *(void *)a1 = *a2;
    a1 = &v20[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    sub_228952BB0(&qword_2682846F8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v21 = *a2;
      *(void *)a1 = *a2;
      os_log_type_t v22 = v21;
    }
    else if (EnumCaseMultiPayload == 1)
    {
      int v8 = a2[1];
      *(void *)a1 = *a2;
      *((void *)a1 + 1) = v8;
      uint64_t v9 = a2[3];
      *((void *)a1 + 2) = a2[2];
      *((void *)a1 + 3) = v9;
      uint64_t v10 = a2[5];
      *((void *)a1 + 4) = a2[4];
      *((void *)a1 + 5) = v10;
      uint64_t v11 = a2[7];
      *((void *)a1 + 6) = a2[6];
      *((void *)a1 + 7) = v11;
      uint64_t v12 = a2[9];
      *((void *)a1 + 8) = a2[8];
      *((void *)a1 + 9) = v12;
      *((void *)a1 + 10) = a2[10];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      BOOL v13 = (int *)sub_228952BB0(&qword_268284858);
      uint64_t v14 = v13[14];
      uint64_t v15 = &a1[v14];
      uint64_t v16 = (char *)a2 + v14;
      uint64_t v17 = sub_2289DE880();
      uint64_t v18 = *(void *)(v17 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
      {
        uint64_t v19 = sub_228952BB0(&qword_2682841E0);
        memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      }
      *(void *)&a1[v13[15]] = *(char **)((char *)a2 + v13[15]);
      uint64_t v35 = v13[16];
      uint64_t v36 = &a1[v35];
      uint64_t v37 = (char *)a2 + v35;
      *(void *)uint64_t v36 = *(void *)v37;
      v36[8] = v37[8];
      *(void *)&a1[v13[17]] = *(char **)((char *)a2 + v13[17]);
      a1[v13[18]] = *((unsigned char *)a2 + v13[18]);
      *(void *)&a1[v13[19]] = *(char **)((char *)a2 + v13[19]);
      a1[v13[20]] = *((unsigned char *)a2 + v13[20]);
      a1[v13[21]] = *((unsigned char *)a2 + v13[21]);
      uint64_t v38 = v13[22];
      uint64_t v39 = &a1[v38];
      v40 = (char *)a2 + v38;
      uint64_t v41 = *((void *)v40 + 1);
      *(void *)uint64_t v39 = *(void *)v40;
      *((void *)v39 + 1) = v41;
      v39[16] = v40[16];
      uint64_t v42 = v13[23];
      v43 = &a1[v42];
      v44 = (char *)a2 + v42;
      *(void *)v43 = *(void *)v44;
      v43[8] = v44[8];
      *(void *)&a1[v13[24]] = *(char **)((char *)a2 + v13[24]);
      a1[v13[25]] = *((unsigned char *)a2 + v13[25]);
      uint64_t v45 = type metadata accessor for LibraryBookSeriesInfo();
      a1[*(int *)(v45 + 20)] = *((unsigned char *)a2 + *(int *)(v45 + 20));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v23 = a2[1];
      *(void *)a1 = *a2;
      *((void *)a1 + 1) = v23;
      uint64_t v24 = a2[3];
      *((void *)a1 + 2) = a2[2];
      *((void *)a1 + 3) = v24;
      uint64_t v25 = a2[5];
      *((void *)a1 + 4) = a2[4];
      *((void *)a1 + 5) = v25;
      unint64_t v26 = a2[7];
      *((void *)a1 + 6) = a2[6];
      *((void *)a1 + 7) = v26;
      unint64_t v27 = a2[9];
      *((void *)a1 + 8) = a2[8];
      *((void *)a1 + 9) = v27;
      *((void *)a1 + 10) = a2[10];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v28 = (int *)sub_228952BB0(&qword_268284858);
      uint64_t v29 = v28[14];
      BOOL v30 = &a1[v29];
      uint64_t v31 = (char *)a2 + v29;
      uint64_t v32 = sub_2289DE880();
      uint64_t v33 = *(void *)(v32 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
      {
        uint64_t v34 = sub_228952BB0(&qword_2682841E0);
        memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
      }
      *(void *)&a1[v28[15]] = *(char **)((char *)a2 + v28[15]);
      uint64_t v46 = v28[16];
      v47 = &a1[v46];
      v48 = (char *)a2 + v46;
      *(void *)v47 = *(void *)v48;
      v47[8] = v48[8];
      *(void *)&a1[v28[17]] = *(char **)((char *)a2 + v28[17]);
      a1[v28[18]] = *((unsigned char *)a2 + v28[18]);
      *(void *)&a1[v28[19]] = *(char **)((char *)a2 + v28[19]);
      a1[v28[20]] = *((unsigned char *)a2 + v28[20]);
      a1[v28[21]] = *((unsigned char *)a2 + v28[21]);
      uint64_t v49 = v28[22];
      v50 = &a1[v49];
      v51 = (char *)a2 + v49;
      uint64_t v52 = *((void *)v51 + 1);
      *(void *)v50 = *(void *)v51;
      *((void *)v50 + 1) = v52;
      v50[16] = v51[16];
      uint64_t v53 = v28[23];
      v54 = &a1[v53];
      v55 = (char *)a2 + v53;
      *(void *)v54 = *(void *)v55;
      v54[8] = v55[8];
      *(void *)&a1[v28[24]] = *(char **)((char *)a2 + v28[24]);
      a1[v28[25]] = *((unsigned char *)a2 + v28[25]);
      uint64_t v56 = type metadata accessor for LibraryBookSeriesInfo();
      a1[*(int *)(v56 + 20)] = *((unsigned char *)a2 + *(int *)(v56 + 20));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v57 = *(int *)(sub_228952BB0(&qword_2682846F0) + 48);
      v58 = *(char **)((char *)a2 + v57);
      *(void *)&a1[v57] = v58;
      id v59 = v58;
    }
    swift_storeEnumTagMultiPayload();
    *(void *)&a1[*(int *)(a3 + 20)] = *(char **)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for BookSeriesInfo(void **a1)
{
  sub_228952BB0(&qword_2682846F8);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v6 = *a1;
LABEL_8:

    goto LABEL_12;
  }
  if (EnumCaseMultiPayload != 1)
  {
    if (EnumCaseMultiPayload) {
      goto LABEL_12;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int v3 = (char *)a1 + *(int *)(sub_228952BB0(&qword_268284858) + 56);
    uint64_t v4 = sub_2289DE880();
    uint64_t v5 = *(void *)(v4 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4)) {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v6 = *(void **)((char *)a1 + *(int *)(sub_228952BB0(&qword_2682846F0) + 48));
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = (char *)a1 + *(int *)(sub_228952BB0(&qword_268284858) + 56);
  uint64_t v8 = sub_2289DE880();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_12:

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for BookSeriesInfo(void *a1, uint64_t a2, uint64_t a3)
{
  sub_228952BB0(&qword_2682846F8);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v19 = *(void **)a2;
    *a1 = *(void *)a2;
    id v20 = v19;
  }
  else
  {
    uint64_t v59 = a3;
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = *(void *)(a2 + 8);
      *a1 = *(void *)a2;
      a1[1] = v7;
      uint64_t v8 = *(void *)(a2 + 24);
      a1[2] = *(void *)(a2 + 16);
      a1[3] = v8;
      uint64_t v9 = *(void *)(a2 + 40);
      a1[4] = *(void *)(a2 + 32);
      a1[5] = v9;
      uint64_t v10 = *(void *)(a2 + 56);
      a1[6] = *(void *)(a2 + 48);
      a1[7] = v10;
      uint64_t v11 = *(void *)(a2 + 72);
      a1[8] = *(void *)(a2 + 64);
      a1[9] = v11;
      a1[10] = *(void *)(a2 + 80);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v12 = (int *)sub_228952BB0(&qword_268284858);
      uint64_t v13 = v12[14];
      uint64_t v14 = (char *)a1 + v13;
      uint64_t v15 = (const void *)(a2 + v13);
      uint64_t v16 = sub_2289DE880();
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
      {
        uint64_t v18 = sub_228952BB0(&qword_2682841E0);
        memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      }
      *(void *)((char *)a1 + v12[15]) = *(void *)(a2 + v12[15]);
      uint64_t v33 = v12[16];
      uint64_t v34 = (char *)a1 + v33;
      uint64_t v35 = a2 + v33;
      *(void *)uint64_t v34 = *(void *)v35;
      v34[8] = *(unsigned char *)(v35 + 8);
      *(void *)((char *)a1 + v12[17]) = *(void *)(a2 + v12[17]);
      *((unsigned char *)a1 + v12[18]) = *(unsigned char *)(a2 + v12[18]);
      *(void *)((char *)a1 + v12[19]) = *(void *)(a2 + v12[19]);
      *((unsigned char *)a1 + v12[20]) = *(unsigned char *)(a2 + v12[20]);
      *((unsigned char *)a1 + v12[21]) = *(unsigned char *)(a2 + v12[21]);
      uint64_t v36 = v12[22];
      uint64_t v37 = (char *)a1 + v36;
      uint64_t v38 = a2 + v36;
      uint64_t v39 = *(void *)(v38 + 8);
      *(void *)uint64_t v37 = *(void *)v38;
      *((void *)v37 + 1) = v39;
      v37[16] = *(unsigned char *)(v38 + 16);
      uint64_t v40 = v12[23];
      uint64_t v41 = (char *)a1 + v40;
      uint64_t v42 = a2 + v40;
      *(void *)uint64_t v41 = *(void *)v42;
      v41[8] = *(unsigned char *)(v42 + 8);
      *(void *)((char *)a1 + v12[24]) = *(void *)(a2 + v12[24]);
      *((unsigned char *)a1 + v12[25]) = *(unsigned char *)(a2 + v12[25]);
      uint64_t v43 = type metadata accessor for LibraryBookSeriesInfo();
      *((unsigned char *)a1 + *(int *)(v43 + 20)) = *(unsigned char *)(a2 + *(int *)(v43 + 20));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v21 = *(void *)(a2 + 8);
      *a1 = *(void *)a2;
      a1[1] = v21;
      uint64_t v22 = *(void *)(a2 + 24);
      a1[2] = *(void *)(a2 + 16);
      a1[3] = v22;
      uint64_t v23 = *(void *)(a2 + 40);
      a1[4] = *(void *)(a2 + 32);
      a1[5] = v23;
      uint64_t v24 = *(void *)(a2 + 56);
      a1[6] = *(void *)(a2 + 48);
      a1[7] = v24;
      uint64_t v25 = *(void *)(a2 + 72);
      a1[8] = *(void *)(a2 + 64);
      a1[9] = v25;
      a1[10] = *(void *)(a2 + 80);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v26 = (int *)sub_228952BB0(&qword_268284858);
      uint64_t v27 = v26[14];
      uint64_t v28 = (char *)a1 + v27;
      uint64_t v29 = (const void *)(a2 + v27);
      uint64_t v30 = sub_2289DE880();
      uint64_t v31 = *(void *)(v30 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
      {
        uint64_t v32 = sub_228952BB0(&qword_2682841E0);
        memcpy(v28, v29, *(void *)(*(void *)(v32 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, const void *, uint64_t))(v31 + 16))(v28, v29, v30);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
      }
      *(void *)((char *)a1 + v26[15]) = *(void *)(a2 + v26[15]);
      uint64_t v44 = v26[16];
      uint64_t v45 = (char *)a1 + v44;
      uint64_t v46 = a2 + v44;
      *(void *)uint64_t v45 = *(void *)v46;
      v45[8] = *(unsigned char *)(v46 + 8);
      *(void *)((char *)a1 + v26[17]) = *(void *)(a2 + v26[17]);
      *((unsigned char *)a1 + v26[18]) = *(unsigned char *)(a2 + v26[18]);
      *(void *)((char *)a1 + v26[19]) = *(void *)(a2 + v26[19]);
      *((unsigned char *)a1 + v26[20]) = *(unsigned char *)(a2 + v26[20]);
      *((unsigned char *)a1 + v26[21]) = *(unsigned char *)(a2 + v26[21]);
      uint64_t v47 = v26[22];
      v48 = (char *)a1 + v47;
      uint64_t v49 = a2 + v47;
      uint64_t v50 = *(void *)(v49 + 8);
      *(void *)v48 = *(void *)v49;
      *((void *)v48 + 1) = v50;
      v48[16] = *(unsigned char *)(v49 + 16);
      uint64_t v51 = v26[23];
      uint64_t v52 = (char *)a1 + v51;
      uint64_t v53 = a2 + v51;
      *(void *)uint64_t v52 = *(void *)v53;
      v52[8] = *(unsigned char *)(v53 + 8);
      *(void *)((char *)a1 + v26[24]) = *(void *)(a2 + v26[24]);
      *((unsigned char *)a1 + v26[25]) = *(unsigned char *)(a2 + v26[25]);
      uint64_t v54 = type metadata accessor for LibraryBookSeriesInfo();
      *((unsigned char *)a1 + *(int *)(v54 + 20)) = *(unsigned char *)(a2 + *(int *)(v54 + 20));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v55 = *(int *)(sub_228952BB0(&qword_2682846F0) + 48);
      uint64_t v56 = *(void **)(a2 + v55);
      *(void *)((char *)a1 + v55) = v56;
      id v57 = v56;
    }
    a3 = v59;
  }
  swift_storeEnumTagMultiPayload();
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for BookSeriesInfo(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2289DC93C((uint64_t)a1);
    sub_228952BB0(&qword_2682846F8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v14 = (void *)*a2;
      *a1 = *a2;
      id v15 = v14;
    }
    else if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      a1[4] = a2[4];
      a1[5] = a2[5];
      a1[6] = a2[6];
      a1[7] = a2[7];
      a1[8] = a2[8];
      a1[9] = a2[9];
      a1[10] = a2[10];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v7 = (int *)sub_228952BB0(&qword_268284858);
      uint64_t v8 = v7[14];
      uint64_t v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = sub_2289DE880();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
      {
        uint64_t v13 = sub_228952BB0(&qword_2682841E0);
        memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      }
      *(void *)((char *)a1 + v7[15]) = *(void *)((char *)a2 + v7[15]);
      uint64_t v23 = v7[16];
      uint64_t v24 = (char *)a1 + v23;
      uint64_t v25 = (char *)a2 + v23;
      uint64_t v26 = *(void *)v25;
      v24[8] = v25[8];
      *(void *)uint64_t v24 = v26;
      *(void *)((char *)a1 + v7[17]) = *(void *)((char *)a2 + v7[17]);
      *((unsigned char *)a1 + v7[18]) = *((unsigned char *)a2 + v7[18]);
      *(void *)((char *)a1 + v7[19]) = *(void *)((char *)a2 + v7[19]);
      *((unsigned char *)a1 + v7[20]) = *((unsigned char *)a2 + v7[20]);
      *((unsigned char *)a1 + v7[21]) = *((unsigned char *)a2 + v7[21]);
      uint64_t v27 = v7[22];
      uint64_t v28 = (char *)a1 + v27;
      uint64_t v29 = (char *)a2 + v27;
      *(void *)uint64_t v28 = *(void *)v29;
      *((void *)v28 + 1) = *((void *)v29 + 1);
      v28[16] = v29[16];
      uint64_t v30 = v7[23];
      uint64_t v31 = (char *)a1 + v30;
      uint64_t v32 = (char *)a2 + v30;
      uint64_t v33 = *(void *)v32;
      v31[8] = v32[8];
      *(void *)uint64_t v31 = v33;
      *(void *)((char *)a1 + v7[24]) = *(void *)((char *)a2 + v7[24]);
      *((unsigned char *)a1 + v7[25]) = *((unsigned char *)a2 + v7[25]);
      uint64_t v34 = type metadata accessor for LibraryBookSeriesInfo();
      *((unsigned char *)a1 + *(int *)(v34 + 20)) = *((unsigned char *)a2 + *(int *)(v34 + 20));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      a1[4] = a2[4];
      a1[5] = a2[5];
      a1[6] = a2[6];
      a1[7] = a2[7];
      a1[8] = a2[8];
      a1[9] = a2[9];
      a1[10] = a2[10];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v16 = (int *)sub_228952BB0(&qword_268284858);
      uint64_t v17 = v16[14];
      uint64_t v18 = (char *)a1 + v17;
      uint64_t v19 = (char *)a2 + v17;
      uint64_t v20 = sub_2289DE880();
      uint64_t v21 = *(void *)(v20 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
      {
        uint64_t v22 = sub_228952BB0(&qword_2682841E0);
        memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      }
      *(void *)((char *)a1 + v16[15]) = *(void *)((char *)a2 + v16[15]);
      uint64_t v35 = v16[16];
      uint64_t v36 = (char *)a1 + v35;
      uint64_t v37 = (char *)a2 + v35;
      uint64_t v38 = *(void *)v37;
      v36[8] = v37[8];
      *(void *)uint64_t v36 = v38;
      *(void *)((char *)a1 + v16[17]) = *(void *)((char *)a2 + v16[17]);
      *((unsigned char *)a1 + v16[18]) = *((unsigned char *)a2 + v16[18]);
      *(void *)((char *)a1 + v16[19]) = *(void *)((char *)a2 + v16[19]);
      *((unsigned char *)a1 + v16[20]) = *((unsigned char *)a2 + v16[20]);
      *((unsigned char *)a1 + v16[21]) = *((unsigned char *)a2 + v16[21]);
      uint64_t v39 = v16[22];
      uint64_t v40 = (char *)a1 + v39;
      uint64_t v41 = (char *)a2 + v39;
      *(void *)uint64_t v40 = *(void *)v41;
      *((void *)v40 + 1) = *((void *)v41 + 1);
      v40[16] = v41[16];
      uint64_t v42 = v16[23];
      uint64_t v43 = (char *)a1 + v42;
      uint64_t v44 = (char *)a2 + v42;
      uint64_t v45 = *(void *)v44;
      v43[8] = v44[8];
      *(void *)uint64_t v43 = v45;
      *(void *)((char *)a1 + v16[24]) = *(void *)((char *)a2 + v16[24]);
      *((unsigned char *)a1 + v16[25]) = *((unsigned char *)a2 + v16[25]);
      uint64_t v46 = type metadata accessor for LibraryBookSeriesInfo();
      *((unsigned char *)a1 + *(int *)(v46 + 20)) = *((unsigned char *)a2 + *(int *)(v46 + 20));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v47 = *(int *)(sub_228952BB0(&qword_2682846F0) + 48);
      v48 = *(void **)((char *)a2 + v47);
      *(void *)((char *)a1 + v47) = v48;
      id v49 = v48;
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2289DC93C(uint64_t a1)
{
  uint64_t v2 = sub_228952BB0(&qword_2682846F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *initializeWithTake for BookSeriesInfo(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_228952BB0(&qword_2682846F8);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((void *)a1 + 2) = *((void *)a2 + 2);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    id v15 = (int *)sub_228952BB0(&qword_268284858);
    uint64_t v16 = v15[14];
    uint64_t v17 = &a1[v16];
    uint64_t v18 = &a2[v16];
    uint64_t v19 = sub_2289DE880();
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      uint64_t v21 = sub_228952BB0(&qword_2682841E0);
      memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v17, v18, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
    *(void *)&a1[v15[15]] = *(void *)&a2[v15[15]];
    uint64_t v33 = v15[16];
    uint64_t v34 = &a1[v33];
    uint64_t v35 = &a2[v33];
    *(void *)uint64_t v34 = *(void *)v35;
    v34[8] = v35[8];
    *(void *)&a1[v15[17]] = *(void *)&a2[v15[17]];
    a1[v15[18]] = a2[v15[18]];
    *(void *)&a1[v15[19]] = *(void *)&a2[v15[19]];
    a1[v15[20]] = a2[v15[20]];
    a1[v15[21]] = a2[v15[21]];
    uint64_t v36 = v15[22];
    uint64_t v37 = &a1[v36];
    uint64_t v38 = &a2[v36];
    *(_OWORD *)uint64_t v37 = *(_OWORD *)v38;
    v37[16] = v38[16];
    uint64_t v39 = v15[23];
    uint64_t v40 = &a1[v39];
    uint64_t v41 = &a2[v39];
    *(void *)uint64_t v40 = *(void *)v41;
    v40[8] = v41[8];
    *(void *)&a1[v15[24]] = *(void *)&a2[v15[24]];
    a1[v15[25]] = a2[v15[25]];
    uint64_t v42 = type metadata accessor for LibraryBookSeriesInfo();
    a1[*(int *)(v42 + 20)] = a2[*(int *)(v42 + 20)];
    goto LABEL_12;
  }
  if (!EnumCaseMultiPayload)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((void *)a1 + 2) = *((void *)a2 + 2);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    uint64_t v8 = (int *)sub_228952BB0(&qword_268284858);
    uint64_t v9 = v8[14];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = sub_2289DE880();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = sub_228952BB0(&qword_2682841E0);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    *(void *)&a1[v8[15]] = *(void *)&a2[v8[15]];
    uint64_t v22 = v8[16];
    uint64_t v23 = &a1[v22];
    uint64_t v24 = &a2[v22];
    *(void *)uint64_t v23 = *(void *)v24;
    v23[8] = v24[8];
    *(void *)&a1[v8[17]] = *(void *)&a2[v8[17]];
    a1[v8[18]] = a2[v8[18]];
    *(void *)&a1[v8[19]] = *(void *)&a2[v8[19]];
    a1[v8[20]] = a2[v8[20]];
    a1[v8[21]] = a2[v8[21]];
    uint64_t v25 = v8[22];
    uint64_t v26 = &a1[v25];
    uint64_t v27 = &a2[v25];
    *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
    v26[16] = v27[16];
    uint64_t v28 = v8[23];
    uint64_t v29 = &a1[v28];
    uint64_t v30 = &a2[v28];
    *(void *)uint64_t v29 = *(void *)v30;
    v29[8] = v30[8];
    *(void *)&a1[v8[24]] = *(void *)&a2[v8[24]];
    a1[v8[25]] = a2[v8[25]];
    uint64_t v31 = type metadata accessor for LibraryBookSeriesInfo();
    a1[*(int *)(v31 + 20)] = a2[*(int *)(v31 + 20)];
    uint64_t v32 = sub_228952BB0(&qword_2682846F0);
    *(void *)&a1[*(int *)(v32 + 48)] = *(void *)&a2[*(int *)(v32 + 48)];
LABEL_12:
    swift_storeEnumTagMultiPayload();
    goto LABEL_13;
  }
  memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
LABEL_13:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *assignWithTake for BookSeriesInfo(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2289DC93C((uint64_t)a1);
    uint64_t v6 = sub_228952BB0(&qword_2682846F8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((void *)a1 + 2) = *((void *)a2 + 2);
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
      id v15 = (int *)sub_228952BB0(&qword_268284858);
      uint64_t v16 = v15[14];
      uint64_t v17 = &a1[v16];
      uint64_t v18 = &a2[v16];
      uint64_t v19 = sub_2289DE880();
      uint64_t v20 = *(void *)(v19 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
      {
        uint64_t v21 = sub_228952BB0(&qword_2682841E0);
        memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v17, v18, v19);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      }
      *(void *)&a1[v15[15]] = *(void *)&a2[v15[15]];
      uint64_t v33 = v15[16];
      uint64_t v34 = &a1[v33];
      uint64_t v35 = &a2[v33];
      *(void *)uint64_t v34 = *(void *)v35;
      v34[8] = v35[8];
      *(void *)&a1[v15[17]] = *(void *)&a2[v15[17]];
      a1[v15[18]] = a2[v15[18]];
      *(void *)&a1[v15[19]] = *(void *)&a2[v15[19]];
      a1[v15[20]] = a2[v15[20]];
      a1[v15[21]] = a2[v15[21]];
      uint64_t v36 = v15[22];
      uint64_t v37 = &a1[v36];
      uint64_t v38 = &a2[v36];
      *(_OWORD *)uint64_t v37 = *(_OWORD *)v38;
      v37[16] = v38[16];
      uint64_t v39 = v15[23];
      uint64_t v40 = &a1[v39];
      uint64_t v41 = &a2[v39];
      *(void *)uint64_t v40 = *(void *)v41;
      v40[8] = v41[8];
      *(void *)&a1[v15[24]] = *(void *)&a2[v15[24]];
      a1[v15[25]] = a2[v15[25]];
      uint64_t v42 = type metadata accessor for LibraryBookSeriesInfo();
      a1[*(int *)(v42 + 20)] = a2[*(int *)(v42 + 20)];
      goto LABEL_13;
    }
    if (!EnumCaseMultiPayload)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((void *)a1 + 2) = *((void *)a2 + 2);
      *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
      uint64_t v8 = (int *)sub_228952BB0(&qword_268284858);
      uint64_t v9 = v8[14];
      uint64_t v10 = &a1[v9];
      uint64_t v11 = &a2[v9];
      uint64_t v12 = sub_2289DE880();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
      {
        uint64_t v14 = sub_228952BB0(&qword_2682841E0);
        memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      }
      *(void *)&a1[v8[15]] = *(void *)&a2[v8[15]];
      uint64_t v22 = v8[16];
      uint64_t v23 = &a1[v22];
      uint64_t v24 = &a2[v22];
      *(void *)uint64_t v23 = *(void *)v24;
      v23[8] = v24[8];
      *(void *)&a1[v8[17]] = *(void *)&a2[v8[17]];
      a1[v8[18]] = a2[v8[18]];
      *(void *)&a1[v8[19]] = *(void *)&a2[v8[19]];
      a1[v8[20]] = a2[v8[20]];
      a1[v8[21]] = a2[v8[21]];
      uint64_t v25 = v8[22];
      uint64_t v26 = &a1[v25];
      uint64_t v27 = &a2[v25];
      *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
      v26[16] = v27[16];
      uint64_t v28 = v8[23];
      uint64_t v29 = &a1[v28];
      uint64_t v30 = &a2[v28];
      *(void *)uint64_t v29 = *(void *)v30;
      v29[8] = v30[8];
      *(void *)&a1[v8[24]] = *(void *)&a2[v8[24]];
      a1[v8[25]] = a2[v8[25]];
      uint64_t v31 = type metadata accessor for LibraryBookSeriesInfo();
      a1[*(int *)(v31 + 20)] = a2[*(int *)(v31 + 20)];
      uint64_t v32 = sub_228952BB0(&qword_2682846F0);
      *(void *)&a1[*(int *)(v32 + 48)] = *(void *)&a2[*(int *)(v32 + 48)];
LABEL_13:
      swift_storeEnumTagMultiPayload();
      goto LABEL_14;
    }
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
LABEL_14:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BookSeriesInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2289DD300);
}

uint64_t sub_2289DD300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_228952BB0(&qword_2682846F8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for BookSeriesInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2289DD3E4);
}

uint64_t sub_2289DD3E4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_228952BB0(&qword_2682846F8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

void sub_2289DD4A4()
{
  sub_2289DD538();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2289DD538()
{
  if (!qword_268284FF0)
  {
    type metadata accessor for LibraryBookSeriesInfo();
    type metadata accessor for MBookSeries();
    unint64_t v0 = type metadata accessor for ContentDataSource();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268284FF0);
    }
  }
}

uint64_t sub_2289DD5A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t BooksUIKitFeatureFlag.hash(into:)()
{
  return sub_2289DF570();
}

uint64_t BooksUIKitFeatureFlag.init(rawValue:)@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_2289DF270();
  uint64_t v4 = v3;
  if (v2 == sub_2289DF270() && v4 == v5)
  {
    char v9 = 0;
    goto LABEL_10;
  }
  char v7 = sub_2289DF480();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  char v9 = 0;
  if ((v7 & 1) == 0)
  {
    uint64_t v10 = sub_2289DF270();
    uint64_t v12 = v11;
    if (v10 == sub_2289DF270() && v12 == v13)
    {
      char v9 = 1;
LABEL_10:
      uint64_t result = swift_bridgeObjectRelease_n();
      goto LABEL_11;
    }
    char v14 = sub_2289DF480();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v14)
    {
      char v9 = 1;
      goto LABEL_11;
    }
    char v9 = 2;
    uint64_t v15 = sub_2289DF270();
    uint64_t v17 = v16;
    if (v15 == sub_2289DF270() && v17 == v18) {
      goto LABEL_10;
    }
    char v19 = sub_2289DF480();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_11;
    }
    uint64_t v20 = sub_2289DF270();
    uint64_t v22 = v21;
    char v9 = 3;
    if (v20 == sub_2289DF270() && v22 == v23) {
      goto LABEL_10;
    }
    char v24 = sub_2289DF480();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v24) {
      char v9 = 3;
    }
    else {
      char v9 = 4;
    }
  }
LABEL_11:
  *a1 = v9;
  return result;
}

uint64_t BooksUIKitFeatureFlag.hashValue.getter()
{
  return sub_2289DF590();
}

void BooksUIKitFeatureFlag.rawValue.getter(int64x2_t *a1@<X8>)
{
  int64x2_t v2 = vdupq_n_s64(0x14uLL);
  v2.i64[0] = (uint64_t)"uip_floating_tab_bar";
  switch(*v1)
  {
    case 1:
      int64x2_t v2 = vdupq_n_s64(0x19uLL);
      uint64_t v3 = "uip_floating_tab_bar_only";
      goto LABEL_5;
    case 2:
      int64x2_t v2 = vdupq_n_s64(0x15uLL);
      uint64_t v3 = "uip_fluid_transitions";
      goto LABEL_5;
    case 3:
      int64x2_t v2 = vdupq_n_s64(0x19uLL);
      uint64_t v3 = "uip_document_landing_page";
LABEL_5:
      v2.i64[0] = (uint64_t)v3;
      break;
    default:
      break;
  }
  *a1 = v2;
  a1[1].i8[0] = 2;
}

uint64_t sub_2289DD944()
{
  return sub_2289663EC();
}

uint64_t sub_2289DD950@<X0>(char *a1@<X8>)
{
  return BooksUIKitFeatureFlag.init(rawValue:)(a1);
}

void sub_2289DD984(int64x2_t *a1@<X8>)
{
  int64x2_t v2 = vdupq_n_s64(0x14uLL);
  v2.i64[0] = (uint64_t)"uip_floating_tab_bar";
  switch(*v1)
  {
    case 1:
      int64x2_t v2 = vdupq_n_s64(0x19uLL);
      uint64_t v3 = "uip_floating_tab_bar_only";
      goto LABEL_5;
    case 2:
      int64x2_t v2 = vdupq_n_s64(0x15uLL);
      uint64_t v3 = "uip_fluid_transitions";
      goto LABEL_5;
    case 3:
      int64x2_t v2 = vdupq_n_s64(0x19uLL);
      uint64_t v3 = "uip_document_landing_page";
LABEL_5:
      v2.i64[0] = (uint64_t)v3;
      break;
    default:
      break;
  }
  *a1 = v2;
  a1[1].i8[0] = 2;
}

const char *sub_2289DDA18()
{
  return "UIKit";
}

const char *sub_2289DDA2C()
{
  uint64_t result = "uip_floating_tab_bar";
  switch(*v0)
  {
    case 1:
      uint64_t result = "uip_floating_tab_bar_only";
      break;
    case 2:
      uint64_t result = "uip_fluid_transitions";
      break;
    case 3:
      uint64_t result = "uip_document_landing_page";
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2289DDAA0()
{
  uint64_t v31 = MEMORY[0x263F8EE78];
  sub_22896C5D8(0, 4, 0);
  uint64_t v0 = v31;
  char v1 = byte_26DD0B2F8;
  uint64_t v2 = sub_2289DF270();
  uint64_t v4 = v3;
  unint64_t v6 = *(void *)(v31 + 16);
  unint64_t v5 = *(void *)(v31 + 24);
  if (v6 >= v5 >> 1)
  {
    sub_22896C5D8(v5 > 1, v6 + 1, 1);
    uint64_t v0 = v31;
  }
  *(void *)(v0 + 16) = v6 + 1;
  unint64_t v7 = v0 + 24 * v6;
  *(void *)(v7 + 32) = v2;
  *(void *)(v7 + 40) = v4;
  *(unsigned char *)(v7 + 48) = v1;
  char v8 = byte_26DD0B2F9;
  uint64_t v9 = sub_2289DF270();
  uint64_t v11 = v10;
  uint64_t v31 = v0;
  unint64_t v13 = *(void *)(v0 + 16);
  unint64_t v12 = *(void *)(v0 + 24);
  if (v13 >= v12 >> 1)
  {
    sub_22896C5D8(v12 > 1, v13 + 1, 1);
    uint64_t v0 = v31;
  }
  *(void *)(v0 + 16) = v13 + 1;
  unint64_t v14 = v0 + 24 * v13;
  *(void *)(v14 + 32) = v9;
  *(void *)(v14 + 40) = v11;
  *(unsigned char *)(v14 + 48) = v8;
  char v15 = byte_26DD0B2FA;
  uint64_t v16 = sub_2289DF270();
  uint64_t v18 = v17;
  uint64_t v31 = v0;
  unint64_t v20 = *(void *)(v0 + 16);
  unint64_t v19 = *(void *)(v0 + 24);
  if (v20 >= v19 >> 1)
  {
    sub_22896C5D8(v19 > 1, v20 + 1, 1);
    uint64_t v0 = v31;
  }
  *(void *)(v0 + 16) = v20 + 1;
  unint64_t v21 = v0 + 24 * v20;
  *(void *)(v21 + 32) = v16;
  *(void *)(v21 + 40) = v18;
  *(unsigned char *)(v21 + 48) = v15;
  char v22 = byte_26DD0B2FB;
  uint64_t v23 = sub_2289DF270();
  uint64_t v25 = v24;
  uint64_t v31 = v0;
  unint64_t v27 = *(void *)(v0 + 16);
  unint64_t v26 = *(void *)(v0 + 24);
  if (v27 >= v26 >> 1)
  {
    sub_22896C5D8(v26 > 1, v27 + 1, 1);
    uint64_t v0 = v31;
  }
  *(void *)(v0 + 16) = v27 + 1;
  unint64_t v28 = v0 + 24 * v27;
  *(void *)(v28 + 32) = v23;
  *(void *)(v28 + 40) = v25;
  *(unsigned char *)(v28 + 48) = v22;
  sub_228952BB0(&qword_268284888);
  uint64_t v31 = sub_2289DF3B0();
  uint64_t v29 = swift_bridgeObjectRetain();
  sub_2289DE234(v29, 1, &v31);
  uint64_t result = swift_release();
  off_268284FF8 = (_UNKNOWN *)v31;
  return result;
}

void *static BooksUIKitFeatureFlag.allCases.getter()
{
  return &unk_26DD0B300;
}

BookFoundation::BooksUIKitFeatureFlag_optional __swiftcall BooksUIKitFeatureFlag.init(key:)(Swift::String key)
{
  object = key._object;
  uint64_t countAndFlagsBits = key._countAndFlagsBits;
  uint64_t v4 = v1;
  if (qword_268283EC8 != -1) {
    swift_once();
  }
  unint64_t v5 = off_268284FF8;
  if (*((void *)off_268284FF8 + 2) && (unint64_t v6 = sub_2289D7094(countAndFlagsBits, (uint64_t)object), (v7 & 1) != 0)) {
    char v8 = *(unsigned char *)(v5[7] + v6);
  }
  else {
    char v8 = 4;
  }
  result.value = swift_bridgeObjectRelease();
  *uint64_t v4 = v8;
  return result;
}

void sub_2289DDF34(void *a1@<X8>)
{
  *a1 = &unk_26DD0B328;
}

Swift::Bool __swiftcall isFeatureEnabled(_:)(BookFoundation::BooksUIKitFeatureFlag a1)
{
  char v1 = *(unsigned char *)a1;
  unint64_t v5 = &type metadata for BooksUIKitFeatureFlag;
  unint64_t v6 = sub_2289DDF9C();
  v4[0] = v1;
  char v2 = sub_2289DE9E0();
  sub_2289559D0((uint64_t)v4);
  return v2 & 1;
}

unint64_t sub_2289DDF9C()
{
  unint64_t result = qword_268285000;
  if (!qword_268285000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268285000);
  }
  return result;
}

unint64_t sub_2289DDFF4()
{
  unint64_t result = qword_268285008;
  if (!qword_268285008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268285008);
  }
  return result;
}

_UNKNOWN **sub_2289DE048()
{
  return &protocol witness table for FeatureFlagsDomain.UIKit;
}

unint64_t sub_2289DE054(uint64_t a1)
{
  unint64_t result = sub_2289DE07C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2289DE07C()
{
  unint64_t result = qword_268285010;
  if (!qword_268285010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268285010);
  }
  return result;
}

unint64_t sub_2289DE0D4()
{
  unint64_t result = qword_268285018;
  if (!qword_268285018)
  {
    sub_2289550A8((uint64_t *)&unk_268285020);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268285018);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for BooksUIKitFeatureFlag(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2289DE1FCLL);
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

ValueMetadata *type metadata accessor for BooksUIKitFeatureFlag()
{
  return &type metadata for BooksUIKitFeatureFlag;
}

void sub_2289DE234(uint64_t a1, char a2, void *a3)
{
  LOBYTE(v4) = a2;
  uint64_t v6 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_23;
  }
  LOBYTE(v7) = *(unsigned char *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  swift_bridgeObjectRetain();
  if (!v8) {
    goto LABEL_23;
  }
  uint64_t v10 = (void *)*a3;
  unint64_t v11 = sub_2289D7094(v9, v8);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  BOOL v15 = __OFADD__(v13, v14);
  uint64_t v16 = v13 + v14;
  if (v15)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  char v17 = v12;
  if (v10[3] < v16)
  {
    sub_22899820C(v16, v4 & 1);
    unint64_t v11 = sub_2289D7094(v9, v8);
    if ((v17 & 1) == (v18 & 1)) {
      goto LABEL_8;
    }
LABEL_6:
    unint64_t v11 = sub_2289DF500();
    __break(1u);
  }
  if (v4)
  {
LABEL_8:
    if (v17) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  unint64_t v21 = v11;
  sub_2289993B8();
  unint64_t v11 = v21;
  if (v17)
  {
LABEL_9:
    unint64_t v19 = (void *)swift_allocError();
    swift_willThrow();
    id v20 = v19;
    sub_228952BB0(&qword_268284630);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_28;
  }
LABEL_12:
  char v22 = (void *)*a3;
  *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
  uint64_t v23 = (uint64_t *)(v22[6] + 16 * v11);
  *uint64_t v23 = v9;
  v23[1] = v8;
  *(unsigned char *)(v22[7] + v11) = v7;
  uint64_t v24 = v22[2];
  BOOL v15 = __OFADD__(v24, 1);
  uint64_t v25 = v24 + 1;
  if (v15)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    sub_2289DF250();
    sub_2289DEC90();
    sub_2289DF320();
    sub_2289DEC90();
    sub_2289DF340();
    __break(1u);
    sub_2289DE5C0();
    return;
  }
  v22[2] = v25;
  if (v6 != 1)
  {
    unsigned int v4 = (unsigned char *)(a1 + 72);
    unint64_t v7 = 1;
    while (v7 < *(void *)(a1 + 16))
    {
      char v26 = *v4;
      uint64_t v9 = *((void *)v4 - 2);
      uint64_t v8 = *((void *)v4 - 1);
      swift_bridgeObjectRetain();
      if (!v8) {
        goto LABEL_23;
      }
      unint64_t v27 = (void *)*a3;
      unint64_t v28 = sub_2289D7094(v9, v8);
      uint64_t v30 = v27[2];
      BOOL v31 = (v29 & 1) == 0;
      BOOL v15 = __OFADD__(v30, v31);
      uint64_t v32 = v30 + v31;
      if (v15) {
        goto LABEL_25;
      }
      char v17 = v29;
      if (v27[3] < v32)
      {
        sub_22899820C(v32, 1);
        unint64_t v28 = sub_2289D7094(v9, v8);
        if ((v17 & 1) != (v33 & 1)) {
          goto LABEL_6;
        }
      }
      if (v17) {
        goto LABEL_9;
      }
      uint64_t v34 = (void *)*a3;
      *(void *)(*a3 + 8 * (v28 >> 6) + 64) |= 1 << v28;
      uint64_t v35 = (uint64_t *)(v34[6] + 16 * v28);
      *uint64_t v35 = v9;
      v35[1] = v8;
      *(unsigned char *)(v34[7] + v28) = v26;
      uint64_t v36 = v34[2];
      BOOL v15 = __OFADD__(v36, 1);
      uint64_t v37 = v36 + 1;
      if (v15) {
        goto LABEL_26;
      }
      ++v7;
      v34[2] = v37;
      v4 += 24;
      if (v6 == v7) {
        goto LABEL_23;
      }
    }
    goto LABEL_27;
  }
LABEL_23:
  swift_bridgeObjectRelease_n();
}

uint64_t sub_2289DE5C0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_2289DE5D0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_2289DE5E0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_2289DE5F0()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_2289DE600()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_2289DE610()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_2289DE620()
{
  return MEMORY[0x270EEE100]();
}

uint64_t sub_2289DE630()
{
  return MEMORY[0x270EEE1E0]();
}

uint64_t sub_2289DE640()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_2289DE650()
{
  return MEMORY[0x270EEE2F0]();
}

uint64_t sub_2289DE660()
{
  return MEMORY[0x270EEE308]();
}

uint64_t sub_2289DE670()
{
  return MEMORY[0x270EEE388]();
}

uint64_t sub_2289DE680()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_2289DE690()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_2289DE6A0()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_2289DE6B0()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_2289DE6C0()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_2289DE6D0()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_2289DE6E0()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_2289DE6F0()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_2289DE700()
{
  return MEMORY[0x270EEE548]();
}

uint64_t sub_2289DE710()
{
  return MEMORY[0x270EEE568]();
}

uint64_t sub_2289DE720()
{
  return MEMORY[0x270EEE5B8]();
}

uint64_t sub_2289DE730()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_2289DE740()
{
  return MEMORY[0x270EEE5F8]();
}

uint64_t sub_2289DE750()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_2289DE760()
{
  return MEMORY[0x270EEE780]();
}

uint64_t sub_2289DE770()
{
  return MEMORY[0x270EEE7C8]();
}

uint64_t sub_2289DE780()
{
  return MEMORY[0x270EEE7F0]();
}

uint64_t sub_2289DE790()
{
  return MEMORY[0x270EEE810]();
}

uint64_t sub_2289DE7A0()
{
  return MEMORY[0x270EEE818]();
}

uint64_t sub_2289DE7B0()
{
  return MEMORY[0x270EEE838]();
}

uint64_t sub_2289DE7C0()
{
  return MEMORY[0x270EEE890]();
}

uint64_t sub_2289DE7D0()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_2289DE7E0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2289DE7F0()
{
  return MEMORY[0x270EEFBD0]();
}

uint64_t sub_2289DE800()
{
  return MEMORY[0x270EEFC00]();
}

uint64_t sub_2289DE810()
{
  return MEMORY[0x270EEFC70]();
}

uint64_t sub_2289DE820()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2289DE830()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_2289DE840()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2289DE850()
{
  return MEMORY[0x270EEFEA8]();
}

uint64_t sub_2289DE860()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_2289DE870()
{
  return MEMORY[0x270EEFF28]();
}

uint64_t sub_2289DE880()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2289DE890()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2289DE8A0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2289DE8B0()
{
  return MEMORY[0x270EF07A0]();
}

uint64_t sub_2289DE8C0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2289DE8D0()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_2289DE8E0()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_2289DE8F0()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_2289DE900()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2289DE910()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2289DE920()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2289DE930()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_2289DE940()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_2289DE950()
{
  return MEMORY[0x270EF1248]();
}

uint64_t sub_2289DE960()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_2289DE970()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_2289DE980()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_2289DE990()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_2289DE9A0()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_2289DE9B0()
{
  return MEMORY[0x270EF15D0]();
}

uint64_t sub_2289DE9C0()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_2289DE9D0()
{
  return MEMORY[0x270EF17B0]();
}

uint64_t sub_2289DE9E0()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_2289DE9F0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2289DEA00()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2289DEA10()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2289DEA20()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_2289DEA30()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2289DEA40()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2289DEA50()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2289DEA60()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_2289DEA70()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2289DEA80()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2289DEA90()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_2289DEAA0()
{
  return MEMORY[0x270F9D130]();
}

uint64_t sub_2289DEAB0()
{
  return MEMORY[0x270F9D168]();
}

uint64_t sub_2289DEAC0()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_2289DEAD0()
{
  return MEMORY[0x270F9D1D8]();
}

uint64_t sub_2289DEAE0()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_2289DEAF0()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_2289DEB00()
{
  return MEMORY[0x270F9D260]();
}

uint64_t sub_2289DEB10()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2289DEB20()
{
  return MEMORY[0x270F9D428]();
}

uint64_t sub_2289DEB30()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2289DEB40()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_2289DEB50()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_2289DEB60()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_2289DEB70()
{
  return MEMORY[0x270F9D550]();
}

uint64_t sub_2289DEB80()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2289DEB90()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2289DEBA0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2289DEBB0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2289DEBC0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2289DEBD0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_2289DEBE0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2289DEBF0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_2289DEC00()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_2289DEC10()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2289DEC30()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_2289DEC40()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2289DEC50()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2289DEC60()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_2289DEC70()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_2289DEC80()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_2289DEC90()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2289DECA0()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_2289DECB0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2289DECC0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2289DECD0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2289DECF0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2289DED00()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2289DED10()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_2289DED20()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_2289DED30()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2289DED40()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2289DED50()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_2289DED60()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_2289DED70()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_2289DED80()
{
  return MEMORY[0x270F9D9B0]();
}

uint64_t sub_2289DED90()
{
  return MEMORY[0x270F9DA18]();
}

uint64_t _sSY14BookFoundation12FeatureFlags0cD3Key8RawValueRpzrlE3keyAEvg_0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2289DEDB0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_2289DEDF0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_2289DEE00()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2289DEE10()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2289DEE20()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2289DEE30()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2289DEE40()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2289DEE50()
{
  return MEMORY[0x270F9DC00]();
}

uint64_t sub_2289DEE60()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_2289DEE70()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2289DEE80()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2289DEE90()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_2289DEEA0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_2289DEEB0()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_2289DEEC0()
{
  return MEMORY[0x270F9DD10]();
}

uint64_t sub_2289DEED0()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_2289DEEE0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2289DEEF0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2289DEF00()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2289DEF10()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2289DEF20()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2289DEF30()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_2289DEF40()
{
  return MEMORY[0x270FA2040]();
}

uint64_t sub_2289DEF60()
{
  return MEMORY[0x270FA2060]();
}

uint64_t sub_2289DEF70()
{
  return MEMORY[0x270FA2070]();
}

uint64_t sub_2289DEF80()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_2289DEF90()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2289DEFA0()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_2289DEFB0()
{
  return MEMORY[0x270F9E018]();
}

uint64_t sub_2289DEFC0()
{
  return MEMORY[0x270F9E038]();
}

uint64_t sub_2289DEFD0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_2289DEFE0()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_2289DEFF0()
{
  return MEMORY[0x270F9E0C0]();
}

uint64_t sub_2289DF000()
{
  return MEMORY[0x270F9E0C8]();
}

uint64_t sub_2289DF010()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_2289DF020()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2289DF030()
{
  return MEMORY[0x270F9E0F0]();
}

uint64_t sub_2289DF040()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_2289DF050()
{
  return MEMORY[0x270F9E168]();
}

uint64_t sub_2289DF060()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_2289DF070()
{
  return MEMORY[0x270F9E1C0]();
}

uint64_t sub_2289DF080()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2289DF090()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2289DF0A0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2289DF0B0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2289DF0C0()
{
  return MEMORY[0x270FA0C08]();
}

uint64_t sub_2289DF0D0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2289DF0E0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2289DF0F0()
{
  return MEMORY[0x270EF2250]();
}

uint64_t sub_2289DF100()
{
  return MEMORY[0x270EF2258]();
}

uint64_t sub_2289DF110()
{
  return MEMORY[0x270EF2268]();
}

uint64_t sub_2289DF120()
{
  return MEMORY[0x270EF22C0]();
}

uint64_t sub_2289DF130()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2289DF140()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_2289DF150()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2289DF160()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2289DF170()
{
  return MEMORY[0x270EF24B0]();
}

uint64_t sub_2289DF180()
{
  return MEMORY[0x270EF24F0]();
}

uint64_t sub_2289DF190()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_2289DF1A0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2289DF1B0()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_2289DF1C0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2289DF1D0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2289DF1E0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2289DF1F0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2289DF200()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2289DF210()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2289DF220()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2289DF230()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2289DF240()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_2289DF250()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2289DF260()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2289DF270()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_2289DF280()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2289DF290()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2289DF2A0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2289DF2B0()
{
  return MEMORY[0x270F9EB80]();
}

uint64_t sub_2289DF2C0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_2289DF2D0()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_2289DF2E0()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_2289DF2F0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_2289DF300()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t sub_2289DF310()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_2289DF320()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2289DF330()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2289DF340()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2289DF350()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_2289DF360()
{
  return MEMORY[0x270F9F010]();
}

uint64_t sub_2289DF370()
{
  return MEMORY[0x270F9F018]();
}

uint64_t sub_2289DF380()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2289DF390()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2289DF3A0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2289DF3B0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2289DF3C0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2289DF3D0()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_2289DF3F0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2289DF410()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2289DF420()
{
  return MEMORY[0x270F9F330]();
}

uint64_t sub_2289DF430()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2289DF440()
{
  return MEMORY[0x270F9F470]();
}

uint64_t sub_2289DF450()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2289DF460()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_2289DF470()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2289DF480()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2289DF490()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_2289DF4A0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_2289DF4C0()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_2289DF4E0()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_2289DF4F0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2289DF500()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2289DF510()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_2289DF520()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2289DF530()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2289DF540()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2289DF550()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2289DF560()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2289DF570()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2289DF580()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2289DF590()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2289DF5A0()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_2289DF5B0()
{
  return MEMORY[0x270F9FCB0]();
}

uint64_t sub_2289DF5C0()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_2289DF5D0()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_2289DF5E0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2289DF5F0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_2289DF620()
{
  return MEMORY[0x270FA0128]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

float __exp10f(float a1)
{
  MEMORY[0x270ED7DD0](a1);
  return result;
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}