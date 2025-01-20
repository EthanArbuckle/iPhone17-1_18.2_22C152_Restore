uint64_t SKStoreProductViewController.loadProduct(parameters:impression:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v3[20] = a2;
  v3[21] = v2;
  v3[19] = a1;
  sub_246540968();
  v3[22] = sub_246540958();
  v5 = sub_246540948();
  v3[23] = v5;
  v3[24] = v4;
  return MEMORY[0x270FA2498](sub_24653E9E0, v5, v4);
}

uint64_t sub_24653E9E0()
{
  v1 = *(void **)(v0 + 168);
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_2465408C8();
  uint64_t v4 = v3;
  uint64_t v5 = sub_2465408A8();
  *(void *)(v0 + 104) = MEMORY[0x263F8D310];
  *(void *)(v0 + 80) = v5;
  *(void *)(v0 + 88) = v6;
  sub_24653EDB4((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 120));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_24653F6C4((_OWORD *)(v0 + 120), v2, v4, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_246540918();
  *(void *)(v0 + 200) = v8;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_24653EBA0;
  uint64_t v9 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_24653EDC4;
  *(void *)(v0 + 104) = &block_descriptor;
  *(void *)(v0 + 112) = v9;
  objc_msgSend(v1, sel_loadProductWithParameters_completionBlock_, v8, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_24653EBA0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 208) = v2;
  uint64_t v3 = *(void *)(v1 + 192);
  uint64_t v4 = *(void *)(v1 + 184);
  if (v2) {
    uint64_t v5 = sub_24653ED3C;
  }
  else {
    uint64_t v5 = sub_24653ECD0;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24653ECD0()
{
  uint64_t v1 = *(void **)(v0 + 200);
  swift_release();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24653ED3C()
{
  uint64_t v1 = *(void **)(v0 + 200);
  swift_release();
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

_OWORD *sub_24653EDB4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24653EDC4(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8ABD8);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return MEMORY[0x270FA2408](v3);
  }
}

uint64_t SKStoreProductViewController.loadProduct(parameters:impression:reengagementURL:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[21] = a3;
  v4[22] = v3;
  v4[19] = a1;
  v4[20] = a2;
  sub_246540968();
  v4[23] = sub_246540958();
  uint64_t v6 = sub_246540948();
  v4[24] = v6;
  v4[25] = v5;
  return MEMORY[0x270FA2498](sub_24653EF14, v6, v5);
}

uint64_t sub_24653EF14()
{
  uint64_t v1 = v0;
  id v15 = *(id *)(v0 + 176);
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_2465408C8();
  uint64_t v4 = v3;
  uint64_t v5 = sub_2465408A8();
  uint64_t v6 = MEMORY[0x263F8D310];
  *(void *)(v0 + 104) = MEMORY[0x263F8D310];
  *(void *)(v0 + 80) = v5;
  *(void *)(v0 + 88) = v7;
  sub_24653EDB4((_OWORD *)(v1 + 80), (_OWORD *)(v1 + 120));
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_24653F6C4((_OWORD *)(v0 + 120), v2, v4, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_246540868();
  *(void *)(v0 + 104) = v6;
  *(void *)(v0 + 80) = v9;
  *(void *)(v0 + 88) = v10;
  sub_24653EDB4((_OWORD *)(v1 + 80), (_OWORD *)(v1 + 120));
  char v11 = swift_isUniquelyReferenced_nonNull_native();
  sub_24653F6C4((_OWORD *)(v0 + 120), 0xD000000000000013, 0x8000000246540CA0, v11);
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_246540918();
  *(void *)(v0 + 208) = v12;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_24653F138;
  uint64_t v13 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_24653EDC4;
  *(void *)(v0 + 104) = &block_descriptor_2;
  *(void *)(v0 + 112) = v13;
  objc_msgSend(v15, sel_loadProductWithParameters_completionBlock_, v12, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_24653F138()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 216) = v2;
  uint64_t v3 = *(void *)(v1 + 200);
  uint64_t v4 = *(void *)(v1 + 192);
  if (v2) {
    uint64_t v5 = sub_24653F2D4;
  }
  else {
    uint64_t v5 = sub_24653F268;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24653F268()
{
  uint64_t v1 = *(void **)(v0 + 208);
  swift_release();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24653F2D4()
{
  uint64_t v1 = *(void **)(v0 + 208);
  swift_release();
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_24653F34C(uint64_t a1, uint64_t a2)
{
  sub_2465409F8();
  sub_246540938();
  uint64_t v4 = sub_246540A08();

  return sub_24653F8C8(a1, a2, v4);
}

uint64_t sub_24653F3C4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8ABE0);
  uint64_t v6 = sub_2465409B8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_24653EDB4(v24, v35);
      }
      else
      {
        sub_24653FBE4((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_2465409F8();
      sub_246540938();
      uint64_t result = sub_246540A08();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      id v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *id v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_24653EDB4(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_24653F6C4(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_24653F34C(a2, a3);
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
      sub_24653F9AC();
      goto LABEL_7;
    }
    sub_24653F3C4(v15, a4 & 1);
    unint64_t v21 = sub_24653F34C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_2465409E8();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return sub_24653EDB4(a1, v19);
  }
LABEL_13:
  sub_24653F85C(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
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

_OWORD *sub_24653F85C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_24653EDB4(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_24653F8C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2465409D8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2465409D8() & 1) == 0);
    }
  }
  return v6;
}

void *sub_24653F9AC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F8ABE0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2465409A8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
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
      goto LABEL_30;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_24653FBE4(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_24653EDB4(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
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

uint64_t sub_24653FBE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t SKOverlayAppConfiguration.appImpression.getter@<X0>(uint64_t a1@<X8>)
{
  sub_246540908();
  MEMORY[0x270FA5388]();
  uint64_t v3 = sub_2465408B8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0) + 48;
  sub_2465408C8();
  unint64_t v7 = (void *)sub_246540928();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v1, sel_additionalValueForKey_, v7);

  if (v8)
  {
    sub_246540998();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
  }
  sub_246540038((uint64_t)v12, (uint64_t)v13);
  if (!v13[3])
  {
    sub_24654075C((uint64_t)v13, &qword_268F8ABE8);
    goto LABEL_8;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v9 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(a1, v9, 1, v3);
  }
  sub_246540898();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(a1, v6, v3);
  uint64_t v9 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(a1, v9, 1, v3);
}

uint64_t sub_246540038(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8ABE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t SKOverlayAppConfiguration.appImpression.setter(uint64_t a1)
{
  return sub_2465403B8(a1, &qword_268F8ABF8, MEMORY[0x263EFB5E8], MEMORY[0x263EFB5E0], MEMORY[0x263EFB5F0]);
}

void (*SKOverlayAppConfiguration.appImpression.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  size_t v3 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8ABF8) - 8) + 64);
  a1[1] = malloc(v3);
  uint64_t v4 = malloc(v3);
  a1[2] = v4;
  SKOverlayAppConfiguration.appImpression.getter((uint64_t)v4);
  return sub_246540174;
}

void sub_246540174(uint64_t a1, char a2)
{
}

uint64_t SKOverlayAppConfiguration.adAttributionReengagementURL.getter@<X0>(uint64_t a1@<X8>)
{
  sub_2465408D8();
  size_t v3 = (void *)sub_246540928();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v1, sel_additionalValueForKey_, v3);

  if (v4)
  {
    sub_246540998();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_246540038((uint64_t)v7, (uint64_t)v8);
  if (v9)
  {
    if (swift_dynamicCast())
    {
      sub_246540878();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_24654075C((uint64_t)v8, &qword_268F8ABE8);
  }
  uint64_t v6 = sub_246540888();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a1, 1, 1, v6);
}

uint64_t sub_2465402CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(char *))
{
  __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2465406F8(a1, (uint64_t)v10, a5);
  return a6(v10);
}

uint64_t SKOverlayAppConfiguration.adAttributionReengagementURL.setter(uint64_t a1)
{
  return sub_2465403B8(a1, &qword_268F8AC00, MEMORY[0x263F06EA8], MEMORY[0x263F06E80], MEMORY[0x263EFB5F8]);
}

uint64_t sub_2465403B8(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void), void (*a5)(uint64_t))
{
  uint64_t v10 = v5;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  MEMORY[0x270FA5388]();
  int64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2465406F8(a1, (uint64_t)v13, a2);
  uint64_t v14 = a3(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    uint64_t v16 = sub_24654075C((uint64_t)v13, a2);
    uint64_t v17 = 0;
  }
  else
  {
    v21[0] = a4();
    v21[1] = v18;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v13, v14);
    uint64_t v17 = sub_2465409C8();
    uint64_t v16 = sub_2465406A4((uint64_t)v21);
  }
  a5(v16);
  uint64_t v19 = (void *)sub_246540928();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setAdditionalValue_forKey_, v17, v19);
  swift_unknownObjectRelease();

  return sub_24654075C(a1, a2);
}

void (*SKOverlayAppConfiguration.adAttributionReengagementURL.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  size_t v3 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268F8AC00) - 8) + 64);
  a1[1] = malloc(v3);
  id v4 = malloc(v3);
  a1[2] = v4;
  SKOverlayAppConfiguration.adAttributionReengagementURL.getter((uint64_t)v4);
  return sub_2465405F0;
}

void sub_2465405F0(uint64_t a1, char a2)
{
}

void sub_246540610(uint64_t a1, char a2, void (*a3)(void *), uint64_t *a4)
{
  uint64_t v5 = *(void **)(a1 + 8);
  uint64_t v6 = *(void **)(a1 + 16);
  if (a2)
  {
    sub_2465406F8(*(void *)(a1 + 16), (uint64_t)v5, a4);
    a3(v5);
    sub_24654075C((uint64_t)v6, a4);
  }
  else
  {
    a3(*(void **)(a1 + 16));
  }
  free(v6);

  free(v5);
}

uint64_t sub_2465406A4(uint64_t a1)
{
  return a1;
}

uint64_t sub_2465406F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24654075C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2465407B8@<X0>(uint64_t a1@<X8>)
{
  return SKOverlayAppConfiguration.appImpression.getter(a1);
}

uint64_t sub_2465407DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2465402CC(a1, a2, a3, a4, &qword_268F8ABF8, (uint64_t (*)(char *))SKOverlayAppConfiguration.appImpression.setter);
}

uint64_t sub_246540810@<X0>(uint64_t a1@<X8>)
{
  return SKOverlayAppConfiguration.adAttributionReengagementURL.getter(a1);
}

uint64_t sub_246540834(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2465402CC(a1, a2, a3, a4, &qword_268F8AC00, (uint64_t (*)(char *))SKOverlayAppConfiguration.adAttributionReengagementURL.setter);
}

uint64_t sub_246540868()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_246540878()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_246540888()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_246540898()
{
  return MEMORY[0x270EE0918]();
}

uint64_t sub_2465408A8()
{
  return MEMORY[0x270EE0920]();
}

uint64_t sub_2465408B8()
{
  return MEMORY[0x270EE0928]();
}

uint64_t sub_2465408C8()
{
  return MEMORY[0x270EE0930]();
}

uint64_t sub_2465408D8()
{
  return MEMORY[0x270EE0938]();
}

uint64_t sub_2465408E8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2465408F8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_246540908()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_246540918()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_246540928()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_246540938()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_246540948()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_246540958()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_246540968()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_246540978()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_246540988()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_246540998()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2465409A8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2465409B8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2465409C8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2465409D8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2465409E8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2465409F8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_246540A08()
{
  return MEMORY[0x270F9FC90]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}