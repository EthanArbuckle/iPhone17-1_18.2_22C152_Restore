uint64_t sub_2453E51A4()
{
  return MEMORY[0x270FA2498](sub_2453E51C0, 0, 0);
}

uint64_t sub_2453E51C0()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F297B0]), sel_init);
  v2 = (void *)qword_268EE3460;
  qword_268EE3460 = (uint64_t)v1;

  v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_2453E5240@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t result = swift_beginAccess();
  uint64_t v9 = *(void *)(a1 + 16);
  if (*(void *)(v9 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_2452A7064(a2, a3);
    if (v11)
    {
      uint64_t v12 = *(void *)(*(void *)(v9 + 56) + 8 * v10);
      swift_retain();
    }
    else
    {
      uint64_t v12 = 0;
    }
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
  }
  *a4 = v12;
  return result;
}

uint64_t sub_2453E5300(uint64_t a1, uint64_t a2)
{
  type metadata accessor for AvatarItem();
  v4 = (void *)swift_allocObject();
  uint64_t v5 = MEMORY[0x263F8EE78];
  v4[5] = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEEB0);
  uint64_t v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 0;
  v4[6] = v6;
  id v7 = objc_msgSend((id)swift_unknownObjectRetain(), sel_identifier);
  uint64_t v8 = sub_2453FFB38();
  uint64_t v10 = v9;

  v4[2] = v8;
  v4[3] = v10;
  v4[4] = a1;
  int64_t v11 = *(void *)(a2 + 16);
  if (v11)
  {
    sub_2452523F0(0, v11, 0);
    uint64_t v12 = (uint64_t *)(a2 + 40);
    do
    {
      uint64_t v13 = *(v12 - 1);
      uint64_t v14 = *v12;
      unint64_t v16 = *(void *)(v5 + 16);
      unint64_t v15 = *(void *)(v5 + 24);
      swift_bridgeObjectRetain();
      if (v16 >= v15 >> 1) {
        sub_2452523F0(v15 > 1, v16 + 1, 1);
      }
      v12 += 2;
      *(void *)(v5 + 16) = v16 + 1;
      v17 = (void *)(v5 + 24 * v16);
      v17[4] = v13;
      v17[5] = v14;
      v17[6] = 0;
      --v11;
    }
    while (v11);
  }
  swift_beginAccess();
  v4[5] = v5;
  uint64_t v18 = swift_bridgeObjectRelease();
  MEMORY[0x270FA5388](v18);
  MEMORY[0x270FA5388](v19);
  v21 = v20 + 4;
  os_unfair_lock_lock(v20 + 4);
  sub_24522F0EC(v22);
  os_unfair_lock_unlock(v21);
  return swift_release();
}

uint64_t sub_2453E54FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = 0x8000000000000000;
  sub_2453EA3B0(a2, v4, v5, isUniquelyReferenced_nonNull_native);
  *(void *)(a1 + 16) = v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_2453E55BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[9] = a4;
  v5[10] = v4;
  v5[7] = a2;
  v5[8] = a3;
  v5[6] = a1;
  return MEMORY[0x270FA2498](sub_2453E55E4, 0, 0);
}

uint64_t sub_2453E55E4()
{
  v28 = v0;
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[7];
  uint64_t v4 = *(os_unfair_lock_s **)(v2 + 24);
  v0[11] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v5[2] = v2;
  v5[3] = v1;
  v5[4] = v3;
  uint64_t v6 = swift_task_alloc();
  *(void *)(v6 + 16) = sub_2453E627C;
  *(void *)(v6 + 24) = v5;
  v4 += 4;
  os_unfair_lock_lock(v4);
  sub_24522E9D8(v27);
  v0[12] = 0;
  os_unfair_lock_unlock(v4);
  uint64_t v7 = v27[0];
  v0[13] = v27[0];
  swift_task_dealloc();
  swift_task_dealloc();
  if (v7)
  {
    swift_beginAccess();
    uint64_t v8 = *(void *)(v7 + 40);
    uint64_t v9 = *(void *)(v8 + 16);
    if (!v9) {
      goto LABEL_17;
    }
    uint64_t v10 = (void **)(v8 + 48);
    while (1)
    {
      int64_t v11 = *v10;
      BOOL v12 = *(v10 - 2) == (void *)v0[8] && *(v10 - 1) == (void *)v0[9];
      if (v12 || (sub_245400BA8() & 1) != 0) {
        break;
      }
      v10 += 3;
      if (!--v9) {
        goto LABEL_17;
      }
    }
    id v20 = v11;
    if (!v11)
    {
LABEL_17:
      uint64_t v21 = *(void *)(v7 + 32);
      v0[14] = v21;
      swift_unknownObjectRetain();
      uint64_t v22 = (void *)swift_task_alloc();
      v0[15] = v22;
      *uint64_t v22 = v0;
      v22[1] = sub_2453E59B8;
      uint64_t v23 = v0[9];
      v22[18] = v0[8];
      v22[19] = v23;
      v22[17] = v21;
      return MEMORY[0x270FA2498](sub_2453EC4A4, 0, 0);
    }
    swift_release();
  }
  else
  {
    if (qword_268ECF4E0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_2453FDBB8();
    __swift_project_value_buffer(v13, (uint64_t)qword_268ED65C0);
    swift_bridgeObjectRetain_n();
    uint64_t v14 = sub_2453FDB98();
    os_log_type_t v15 = sub_2454000D8();
    BOOL v16 = os_log_type_enabled(v14, v15);
    unint64_t v17 = v0[7];
    if (v16)
    {
      uint64_t v26 = v0[6];
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v27[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      v0[5] = sub_245227298(v26, v17, v27);
      sub_2454005E8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2451E4000, v14, v15, "Requested sticker is unavailable. Avatar %s could not be found.", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2456A0410](v19, -1, -1);
      MEMORY[0x2456A0410](v18, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    int64_t v11 = 0;
  }
  v24 = (uint64_t (*)(void *))v0[1];
  return v24(v11);
}

uint64_t sub_2453E59B8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 128) = a1;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA2498](sub_2453E5AD8, 0, 0);
}

uint64_t sub_2453E5AD8()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[13];
  if (v1)
  {
    uint64_t v3 = v0[12];
    uint64_t v5 = v0[8];
    uint64_t v4 = v0[9];
    uint64_t v6 = (os_unfair_lock_s *)(v0[11] + 16);
    uint64_t v7 = (void *)swift_task_alloc();
    v7[2] = v2;
    v7[3] = v1;
    v7[4] = v5;
    v7[5] = v4;
    uint64_t v8 = swift_task_alloc();
    *(void *)(v8 + 16) = sub_2453ECB28;
    *(void *)(v8 + 24) = v7;
    os_unfair_lock_lock(v6);
    sub_24522C728(v9);
    os_unfair_lock_unlock(v6);
    if (v3)
    {
      return swift_task_dealloc();
    }
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = v0[16];
  }
  else
  {
    swift_release();
    uint64_t v11 = 0;
  }
  BOOL v12 = (uint64_t (*)(uint64_t))v0[1];
  return v12(v11);
}

void sub_2453E5C08(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 48) + 16);
  os_unfair_lock_lock(v2);
  sub_24522F0EC(v3);
  os_unfair_lock_unlock(v2);
  if (v1) {
    __break(1u);
  }
}

uint64_t sub_2453E5C94(uint64_t result, void *a2)
{
  if (result)
  {
    *a2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_initWithCGImage_, result);
    return MEMORY[0x270F9A758]();
  }
  return result;
}

void sub_2453E5CF4(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v11 = *(void (**)(void *, double, double, double, double))(a1 + 32);
  id v12 = a2;
  v11(a2, a3, a4, a5, a6);
}

uint64_t sub_2453E5D80()
{
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AvatarStickerImageProvider()
{
  return self;
}

uint64_t sub_2453E5DF4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = (void *)(a1 + 40);
  swift_beginAccess();
  uint64_t v9 = *(void **)(a1 + 40);
  id v10 = a4;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 40) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v9 = sub_24538F3DC(0, v9[2] + 1, 1, v9);
    *uint64_t v8 = v9;
  }
  unint64_t v13 = v9[2];
  unint64_t v12 = v9[3];
  if (v13 >= v12 >> 1)
  {
    uint64_t v9 = sub_24538F3DC((void *)(v12 > 1), v13 + 1, 1, v9);
    *uint64_t v8 = v9;
  }
  v9[2] = v13 + 1;
  uint64_t v14 = &v9[3 * v13];
  v14[4] = a2;
  v14[5] = a3;
  v14[6] = a4;
  return swift_endAccess();
}

void sub_2453E5EF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_beginAccess();
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    id v10 = (void *)(v8 + 40);
    while (*(v10 - 1) != a2 || *v10 != a3)
    {
      uint64_t v7 = sub_245400BA8();
      if (v7) {
        break;
      }
      v10 += 3;
      if (!--v9) {
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    MEMORY[0x270FA5388](v7);
    MEMORY[0x270FA5388](v12);
    uint64_t v14 = v13 + 4;
    swift_bridgeObjectRetain();
    os_unfair_lock_lock(v14);
    sub_24522F0EC(v15);
    if (v3)
    {
      os_unfair_lock_unlock(v14);
      __break(1u);
    }
    else
    {
      os_unfair_lock_unlock(v14);
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_2453E6038()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AvatarItem()
{
  return self;
}

void destroy for AvatarPoseItem(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 16);
}

void *_s10StickerKit14AvatarPoseItemVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for AvatarPoseItem(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[2];
  id v5 = (void *)a2[2];
  a1[2] = v5;
  id v6 = v5;

  return a1;
}

uint64_t assignWithTake for AvatarPoseItem(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for AvatarPoseItem(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AvatarPoseItem(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AvatarPoseItem()
{
  return &type metadata for AvatarPoseItem;
}

uint64_t sub_2453E626C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24);
  *a1 = *(void *)(*(void *)v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2453E627C@<X0>(void *a1@<X8>)
{
  return sub_2453E5240(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_2453E629C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED16D0);
  char v39 = a2;
  uint64_t v6 = sub_245400A08();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v38 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  v36 = v2;
  int64_t v37 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v13);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v13);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    v31 = *(void **)(*(void *)(v5 + 48) + v30);
    v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((v39 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    sub_2453FFB38();
    sub_245400CB8();
    sub_2453FFBA8();
    uint64_t v14 = sub_245400CF8();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = v14 & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2453E65CC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED1630);
  char v38 = a2;
  uint64_t v6 = sub_245400A08();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_245400CB8();
    swift_bridgeObjectRetain();
    sub_2453FFBA8();
    swift_bridgeObjectRelease();
    uint64_t result = sub_245400CF8();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  int64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2453E68EC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED1620);
  char v38 = a2;
  uint64_t v6 = sub_245400A08();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      id v33 = v32;
      swift_bridgeObjectRetain();
    }
    sub_245400CB8();
    swift_bridgeObjectRetain();
    sub_2453FFBA8();
    swift_bridgeObjectRelease();
    uint64_t result = sub_245400CF8();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  int64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2453E6C0C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ED1680);
  char v37 = a2;
  uint64_t v6 = sub_245400A08();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_245400CB8();
    sub_2453FFBA8();
    uint64_t result = sub_245400CF8();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2453E6F14(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ED1710);
  uint64_t result = sub_245400A08();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v32 = -1 << v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = v3;
    int64_t v35 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v21 >= v35) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v35)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v34;
                goto LABEL_40;
              }
              if (v33 >= 64) {
                bzero((void *)(v5 + 64), 8 * v35);
              }
              else {
                *uint64_t v9 = v32;
              }
              uint64_t v3 = v34;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void **)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        id v31 = v30;
      }
      uint64_t result = sub_245400CA8();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2453E71C8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ED1520);
  char v37 = a2;
  uint64_t v6 = sub_245400A08();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_245400CB8();
    sub_2453FFBA8();
    uint64_t result = sub_245400CF8();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  unint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2453E74D4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED1760);
  uint64_t v6 = sub_245400A08();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
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
                  *uint64_t v34 = -1 << v32;
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
      int64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      int64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_245274B84(v24, v35);
      }
      else
      {
        sub_245227DB8((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_245400CB8();
      sub_2453FFBA8();
      uint64_t result = sub_245400CF8();
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
      unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *unint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_245274B84(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2453E77D4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ED66B0);
  char v36 = a2;
  uint64_t v6 = sub_245400A08();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }
    sub_245400CB8();
    sub_2453FFBA8();
    uint64_t result = sub_245400CF8();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2453E7AEC(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ED15F8);
  int v50 = a2;
  uint64_t v6 = sub_245400A08();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    v46 = v2;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 64);
    v48 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    int64_t v47 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v14 << 6);
      }
      else
      {
        int64_t v19 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v19 >= v47) {
          goto LABEL_34;
        }
        unint64_t v20 = v48[v19];
        ++v14;
        if (!v20)
        {
          int64_t v14 = v19 + 1;
          if (v19 + 1 >= v47) {
            goto LABEL_34;
          }
          unint64_t v20 = v48[v14];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v47)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v46;
              if (v50)
              {
                uint64_t v44 = 1 << *(unsigned char *)(v5 + 32);
                if (v44 >= 64) {
                  bzero(v48, ((unint64_t)(v44 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v48 = -1 << v44;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v20 = v48[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v14 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_41;
                }
                if (v14 >= v47) {
                  goto LABEL_34;
                }
                unint64_t v20 = v48[v14];
                ++v21;
                if (v20) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v14 = v21;
          }
        }
LABEL_21:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v14 << 6);
      }
      uint64_t v22 = sub_2453FCD48();
      uint64_t v23 = *(void *)(v22 - 8);
      __n128 v25 = MEMORY[0x270FA5388](v22);
      unint64_t v26 = (char *)&v45 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v28 = *(void *)(v27 + 72);
      unint64_t v29 = *(void *)(v5 + 48) + v28 * v18;
      uint64_t v53 = v30;
      if (v50)
      {
        (*(void (**)(char *, unint64_t, uint64_t, __n128))(v23 + 32))((char *)&v45 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v29, v22, v25);
        uint64_t v31 = *(void *)(v5 + 56) + 40 * v18;
        id v32 = *(id *)v31;
        long long v33 = *(_OWORD *)(v31 + 24);
        long long v51 = *(_OWORD *)(v31 + 8);
        long long v52 = v33;
      }
      else
      {
        (*(void (**)(char *, unint64_t, uint64_t, __n128))(v23 + 16))((char *)&v45 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v29, v22, v25);
        uint64_t v34 = *(void *)(v5 + 56) + 40 * v18;
        uint64_t v35 = *(void **)v34;
        long long v36 = *(_OWORD *)(v34 + 24);
        long long v51 = *(_OWORD *)(v34 + 8);
        long long v52 = v36;
        id v32 = v35;
      }
      sub_2453ECCE8(&qword_268ED66E0, MEMORY[0x270FA9978]);
      uint64_t result = sub_2453FFA78();
      uint64_t v37 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v38 = result & ~v37;
      unint64_t v39 = v38 >> 6;
      if (((-1 << v38) & ~*(void *)(v12 + 8 * (v38 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v38) & ~*(void *)(v12 + 8 * (v38 >> 6)))) | v38 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v40 = 0;
        unint64_t v41 = (unint64_t)(63 - v37) >> 6;
        do
        {
          if (++v39 == v41 && (v40 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v42 = v39 == v41;
          if (v39 == v41) {
            unint64_t v39 = 0;
          }
          v40 |= v42;
          uint64_t v43 = *(void *)(v12 + 8 * v39);
        }
        while (v43 == -1);
        unint64_t v15 = __clz(__rbit64(~v43)) + (v39 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v23 + 32))(*(void *)(v7 + 48) + v28 * v15, v26, v22);
      uint64_t v16 = *(void *)(v7 + 56) + 40 * v15;
      *(void *)uint64_t v16 = v32;
      *(_OWORD *)(v16 + 8) = v51;
      *(_OWORD *)(v16 + 24) = v52;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2453E7F2C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED1610);
  uint64_t v6 = sub_245400A08();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  long long v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    id v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_245400438();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2453E8200(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED1640);
  int v44 = a2;
  uint64_t v6 = sub_245400A08();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 64);
  BOOL v42 = (void *)(v5 + 64);
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  char v40 = v2;
  int64_t v41 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  for (i = v5; ; uint64_t v5 = i)
  {
    if (v11)
    {
      unint64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v41) {
      break;
    }
    uint64_t v19 = v42;
    unint64_t v20 = v42[v18];
    ++v14;
    if (!v20)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v20 = v42[v14];
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v44 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = v42[v21];
        if (!v20)
        {
          while (1)
          {
            int64_t v14 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v41) {
              goto LABEL_34;
            }
            unint64_t v20 = v42[v14];
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v21;
      }
    }
LABEL_21:
    unint64_t v11 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_22:
    uint64_t v22 = sub_2453FCCB8();
    uint64_t v23 = *(void *)(v22 - 8);
    __n128 v25 = MEMORY[0x270FA5388](v22);
    char v26 = (char *)&v40 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v28 = *(void *)(v27 + 72);
    unint64_t v29 = *(void *)(v5 + 48) + v28 * v17;
    uint64_t v45 = v30;
    if (v44)
    {
      (*(void (**)(char *, unint64_t, uint64_t, __n128))(v23 + 32))((char *)&v40 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v29, v22, v25);
      id v31 = *(id *)(*(void *)(v5 + 56) + 8 * v17);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t, __n128))(v23 + 16))((char *)&v40 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v29, v22, v25);
      id v31 = *(id *)(*(void *)(v5 + 56) + 8 * v17);
    }
    sub_2453ECCE8((unint64_t *)&qword_268ECEC30, MEMORY[0x270FA96E0]);
    uint64_t result = sub_2453FFA78();
    uint64_t v32 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v33 = result & ~v32;
    unint64_t v34 = v33 >> 6;
    if (((-1 << v33) & ~*(void *)(v12 + 8 * (v33 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v33) & ~*(void *)(v12 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v35 = 0;
      unint64_t v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v37 = v34 == v36;
        if (v34 == v36) {
          unint64_t v34 = 0;
        }
        v35 |= v37;
        uint64_t v38 = *(void *)(v12 + 8 * v34);
      }
      while (v38 == -1);
      unint64_t v15 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v23 + 32))(*(void *)(v7 + 48) + v28 * v15, v26, v22);
    *(void *)(*(void *)(v7 + 56) + 8 * v15) = v31;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  uint64_t v19 = v42;
  if ((v44 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v39 = 1 << *(unsigned char *)(v5 + 32);
  if (v39 >= 64) {
    bzero(v19, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v19 = -1 << v39;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2453E8614(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED1650);
  int v45 = a2;
  uint64_t v6 = sub_245400A08();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 64);
  uint64_t v43 = (void *)(v5 + 64);
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  int64_t v41 = v2;
  int64_t v42 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  for (i = v5; ; uint64_t v5 = i)
  {
    if (v11)
    {
      unint64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v42) {
      break;
    }
    uint64_t v19 = v43;
    unint64_t v20 = v43[v18];
    ++v14;
    if (!v20)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v42) {
        goto LABEL_34;
      }
      unint64_t v20 = v43[v14];
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v42)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v41;
          if ((v45 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = v43[v21];
        if (!v20)
        {
          while (1)
          {
            int64_t v14 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v42) {
              goto LABEL_34;
            }
            unint64_t v20 = v43[v14];
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v21;
      }
    }
LABEL_21:
    unint64_t v11 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_22:
    uint64_t v22 = sub_2453FCCB8();
    uint64_t v23 = *(void *)(v22 - 8);
    __n128 v25 = MEMORY[0x270FA5388](v22);
    char v26 = (char *)&v41 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v28 = *(void *)(v27 + 72);
    unint64_t v29 = *(void *)(v5 + 48) + v28 * v17;
    uint64_t v46 = v30;
    if (v45)
    {
      (*(void (**)(char *, unint64_t, uint64_t, __n128))(v23 + 32))((char *)&v41 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v29, v22, v25);
      id v31 = *(void **)(*(void *)(v5 + 56) + 8 * v17);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t, __n128))(v23 + 16))((char *)&v41 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), v29, v22, v25);
      id v31 = *(void **)(*(void *)(v5 + 56) + 8 * v17);
      id v32 = v31;
    }
    sub_2453ECCE8((unint64_t *)&qword_268ECEC30, MEMORY[0x270FA96E0]);
    uint64_t result = sub_2453FFA78();
    uint64_t v33 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v12 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v34) & ~*(void *)(v12 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v12 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v15 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v23 + 32))(*(void *)(v7 + 48) + v28 * v15, v26, v22);
    *(void *)(*(void *)(v7 + 56) + 8 * v15) = v31;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v41;
  uint64_t v19 = v43;
  if ((v45 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v5 + 32);
  if (v40 >= 64) {
    bzero(v19, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v19 = -1 << v40;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2453E8A24(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v37 = a2;
  uint64_t v7 = sub_245400A08();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35) {
      break;
    }
    uint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v35) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_245400CB8();
    sub_2453FFBA8();
    uint64_t result = sub_245400CF8();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *uint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v23 = (void *)(v6 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v4 = v8;
  return result;
}

uint64_t sub_2453E8D38(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED66D0);
  char v38 = a2;
  uint64_t v6 = sub_245400A08();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_245400CB8();
    sub_2453FFBA8();
    uint64_t result = sub_245400CF8();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  int64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2453E9048(uint64_t a1, char a2)
{
  return sub_2453E9054(a1, a2, (uint64_t *)&unk_268ED4910);
}

uint64_t sub_2453E9054(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v37 = a2;
  uint64_t v7 = sub_245400A08();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35) {
      break;
    }
    unint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v35) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_245400CB8();
    sub_2453FFBA8();
    uint64_t result = sub_245400CF8();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  unint64_t v23 = (void *)(v6 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v4 = v8;
  return result;
}

void sub_2453E9368(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2452A6FDC(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2453EA910();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_2453E65CC(v15, a4 & 1);
  unint64_t v20 = sub_2452A6FDC(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_245400C08();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  int64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *int64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

uint64_t sub_2453E94D8(uint64_t a1, uint64_t a2, char a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2452A7064(a1, a2);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2453EAC7C();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(double *)(v18[7] + 8 * v12) = a4;
      return result;
    }
    goto LABEL_11;
  }
  sub_2453E6C0C(result, a3 & 1);
  uint64_t result = sub_2452A7064(a1, a2);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_245400C08();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v20 = a1;
  v20[1] = a2;
  *(double *)(v18[7] + 8 * v12) = a4;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;

  return swift_bridgeObjectRetain();
}

void sub_2453E9640(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_2452A72E8(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_2453EAE2C();
LABEL_7:
    char v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];

      *(void *)(v17 + 8 * v10) = a1;
      return;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v20 = 8 * v10;
    *(void *)(v16[6] + v20) = a2;
    *(void *)(v16[7] + v20) = a1;
    uint64_t v21 = v16[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (!v22)
    {
      v16[2] = v23;
      return;
    }
    goto LABEL_14;
  }
  sub_2453E6F14(v13, a3 & 1);
  unint64_t v18 = sub_2452A72E8(a2);
  if ((v14 & 1) == (v19 & 1))
  {
    unint64_t v10 = v18;
    char v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  sub_245400C08();
  __break(1u);
}

uint64_t sub_2453E977C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2452A7064(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2453EAFD0();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(void *)(v18[7] + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_2453E71C8(result, a4 & 1);
  uint64_t result = sub_2452A7064(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_245400C08();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v20 = a2;
  v20[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;

  return swift_bridgeObjectRetain();
}

_OWORD *sub_2453E98E0(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_2452A7064(a2, a3);
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
      sub_2453EB180();
      goto LABEL_7;
    }
    sub_2453E74D4(v15, a4 & 1);
    unint64_t v21 = sub_2452A7064(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_245400C08();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    char v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    return sub_245274B84(a1, v19);
  }
LABEL_13:
  sub_2453EA578(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

void sub_2453E9A34(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_2452A73C4(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 >= v13 && (a3 & 1) != 0)
  {
LABEL_7:
    char v16 = *v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7] + 40 * v10;

      long long v18 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)uint64_t v17 = *(_OWORD *)a1;
      *(_OWORD *)(v17 + 16) = v18;
      *(void *)(v17 + 32) = *(void *)(a1 + 32);
      return;
    }
    goto LABEL_11;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_2453EB520();
    goto LABEL_7;
  }
  sub_2453E7AEC(v13, a3 & 1);
  unint64_t v19 = sub_2452A73C4(a2);
  if ((v14 & 1) != (v20 & 1))
  {
LABEL_14:
    sub_2453FCD48();
    sub_245400C08();
    __break(1u);
    return;
  }
  unint64_t v10 = v19;
  char v16 = *v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v21 = sub_2453FCD48();
  __n128 v22 = MEMORY[0x270FA5388](v21);
  BOOL v24 = (char *)&v26 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, __n128))(v25 + 16))(v24, a2, v22);
  sub_2453EA5E4(v10, (uint64_t)v24, a1, v16);
}

void sub_2453E9BEC(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_2452A7468((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_2453EB81C();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_2453E7F2C(v12, a3 & 1);
  unint64_t v17 = sub_2452A7468((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    sub_2452C8A50();
    sub_245400C08();
    __break(1u);
    return;
  }
  unint64_t v9 = v17;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v19 = 8 * v9;
  *(void *)(v15[6] + v19) = a2;
  *(void *)(v15[7] + v19) = a1;
  uint64_t v20 = v15[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v22;

  id v23 = a2;
}

void sub_2453E9D50(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  char v8 = (void *)*v3;
  unint64_t v10 = sub_2452A71B4(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 >= v13 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v16 = *v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];

      *(void *)(v17 + 8 * v10) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_2453EB9C4();
    goto LABEL_7;
  }
  sub_2453E8200(v13, a3 & 1);
  unint64_t v18 = sub_2452A71B4(a2);
  if ((v14 & 1) != (v19 & 1))
  {
LABEL_14:
    sub_2453FCCB8();
    sub_245400C08();
    __break(1u);
    return;
  }
  unint64_t v10 = v18;
  uint64_t v16 = *v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v20 = sub_2453FCCB8();
  __n128 v21 = MEMORY[0x270FA5388](v20);
  id v23 = (char *)&v25 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, __n128))(v24 + 16))(v23, a2, v21);
  sub_2453EA6B0(v10, (uint64_t)v23, a1, v16);
}

void sub_2453E9EF8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  char v8 = (void *)*v3;
  unint64_t v10 = sub_2452A71B4(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 >= v13 && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v16 = *v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];

      *(void *)(v17 + 8 * v10) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_2453EBC8C();
    goto LABEL_7;
  }
  sub_2453E8614(v13, a3 & 1);
  unint64_t v18 = sub_2452A71B4(a2);
  if ((v14 & 1) != (v19 & 1))
  {
LABEL_14:
    sub_2453FCCB8();
    sub_245400C08();
    __break(1u);
    return;
  }
  unint64_t v10 = v18;
  uint64_t v16 = *v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v20 = sub_2453FCCB8();
  __n128 v21 = MEMORY[0x270FA5388](v20);
  id v23 = (char *)&v25 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, __n128))(v24 + 16))(v23, a2, v21);
  sub_2453EA6B0(v10, (uint64_t)v23, a1, v16);
}

uint64_t sub_2453EA0A0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_2453EA0B8(a1, a2, a3, a4, &qword_268ED15D0);
}

uint64_t sub_2453EA0AC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_2453EA0B8(a1, a2, a3, a4, &qword_268ED15D8);
}

uint64_t sub_2453EA0B8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_2452A7064(a2, a3);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a4 & 1) == 0)
  {
    sub_2453EBF60(a5);
LABEL_7:
    uint64_t v20 = (void *)*v7;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_2453E8A24(v17, a4 & 1, a5);
  unint64_t v23 = sub_2452A7064(a2, a3);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_245400C08();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v7;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  uint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *uint64_t v25 = a2;
  v25[1] = a3;
  *(void *)(v20[7] + 8 * v14) = a1;
  uint64_t v26 = v20[2];
  BOOL v27 = __OFADD__(v26, 1);
  uint64_t v28 = v26 + 1;
  if (v27)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v28;

  return swift_bridgeObjectRetain();
}

void sub_2453EA240(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2452A7064(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2453EC110();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_2453E8D38(v15, a4 & 1);
  unint64_t v20 = sub_2452A7064(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_245400C08();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

uint64_t sub_2453EA3B0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2452A7064(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2453EC2D0(&qword_268ED1550);
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_2453E9054(v15, a4 & 1, &qword_268ED1550);
  unint64_t v21 = sub_2452A7064(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_245400C08();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *uint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

unint64_t sub_2453EA530(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
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

_OWORD *sub_2453EA578(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_245274B84(a4, (_OWORD *)(a5[7] + 32 * a1));
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

uint64_t sub_2453EA5E4(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_2453FCD48();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v11 = a4[7] + 40 * a1;
  *(void *)(v11 + 32) = *(void *)(a3 + 32);
  long long v12 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)uint64_t v11 = *(_OWORD *)a3;
  *(_OWORD *)(v11 + 16) = v12;
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

uint64_t sub_2453EA6B0(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_2453FCCB8();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

id sub_2453EA768()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED16D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2454009F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    char v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2453EA910()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED1630);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2454009F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    int64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
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

void *sub_2453EAAC4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED1620);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2454009F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      int64_t v9 = v24 + 1;
      if (v24 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v6 + 8 * v9);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    uint64_t v20 = 8 * v15;
    unint64_t v21 = *(void **)(*(void *)(v2 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v22 = v18;
    v22[1] = v19;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    id v23 = v21;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v13) {
    goto LABEL_26;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    int64_t v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2453EAC7C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ED1680);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2454009F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    id result = (void *)swift_bridgeObjectRetain();
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

id sub_2453EAE2C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ED1710);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2454009F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2453EAFD0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ED1520);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2454009F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2453EB180()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED1760);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2454009F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v25 = v1;
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    sub_245227DB8(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_245274B84(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
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

void *sub_2453EB368()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ED66B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2454009F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_unknownObjectRetain();
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

id sub_2453EB520()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ED15F8);
  char v37 = v0;
  uint64_t v1 = *v0;
  uint64_t v2 = sub_2454009F8();
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v41 = v2;
  if (!v3)
  {
    id result = (id)swift_release();
    uint64_t v35 = v41;
    uint64_t v34 = v37;
LABEL_28:
    *uint64_t v34 = v35;
    return result;
  }
  uint64_t v4 = v2;
  id result = (id)(v2 + 64);
  unint64_t v6 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v1 || (unint64_t)result >= v1 + 64 + 8 * v6)
  {
    id result = memmove(result, (const void *)(v1 + 64), 8 * v6);
    uint64_t v4 = v41;
  }
  int64_t v8 = 0;
  *(void *)(v4 + 16) = *(void *)(v1 + 16);
  uint64_t v9 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v40 = v1;
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(v1 + 64);
  uint64_t v38 = v1 + 64;
  int64_t v39 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v41;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v8 << 6);
      uint64_t v15 = v40;
      goto LABEL_12;
    }
    int64_t v31 = v8 + 1;
    uint64_t v15 = v40;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v31 >= v39) {
      goto LABEL_26;
    }
    unint64_t v32 = *(void *)(v38 + 8 * v31);
    ++v8;
    if (!v32)
    {
      int64_t v8 = v31 + 1;
      if (v31 + 1 >= v39) {
        goto LABEL_26;
      }
      unint64_t v32 = *(void *)(v38 + 8 * v8);
      if (!v32) {
        break;
      }
    }
LABEL_25:
    unint64_t v11 = (v32 - 1) & v32;
    unint64_t v14 = __clz(__rbit64(v32)) + (v8 << 6);
LABEL_12:
    uint64_t v16 = sub_2453FCD48();
    uint64_t v17 = *(void *)(v16 - 8);
    __n128 v18 = MEMORY[0x270FA5388](v16);
    uint64_t v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    unint64_t v22 = *(void *)(v21 + 72) * v14;
    (*(void (**)(char *, unint64_t, uint64_t, __n128))(v17 + 16))(v20, *(void *)(v15 + 48) + v22, v16, v18);
    uint64_t v23 = 40 * v14;
    uint64_t v24 = *(void *)(v15 + 56) + v23;
    int64_t v25 = *(void **)v24;
    uint64_t v26 = *(void *)(v24 + 8);
    uint64_t v27 = *(void *)(v24 + 32);
    unint64_t v28 = *(void *)(v12 + 48) + v22;
    uint64_t v29 = *(void (**)(unint64_t, char *, uint64_t))(v17 + 32);
    long long v42 = *(_OWORD *)(v24 + 16);
    v29(v28, v20, v16);
    uint64_t v30 = *(void *)(v12 + 56) + v23;
    *(void *)uint64_t v30 = v25;
    *(void *)(v30 + 8) = v26;
    *(_OWORD *)(v30 + 16) = v42;
    *(void *)(v30 + 32) = v27;
    id result = v25;
  }
  int64_t v33 = v31 + 2;
  if (v33 >= v39)
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t v34 = v37;
    uint64_t v35 = v41;
    goto LABEL_28;
  }
  unint64_t v32 = *(void *)(v38 + 8 * v33);
  if (v32)
  {
    int64_t v8 = v33;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v8 = v33 + 1;
    if (__OFADD__(v33, 1)) {
      break;
    }
    if (v8 >= v39) {
      goto LABEL_26;
    }
    unint64_t v32 = *(void *)(v38 + 8 * v8);
    ++v33;
    if (v32) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_2453EB81C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED1610);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2454009F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    __n128 v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2453EB9C4()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED1640);
  int64_t v31 = v0;
  uint64_t v1 = *v0;
  uint64_t v2 = sub_2454009F8();
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v35 = v2;
  if (!v3)
  {
    id result = (id)swift_release();
    uint64_t v29 = v35;
    unint64_t v28 = v31;
LABEL_28:
    uint64_t *v28 = v29;
    return result;
  }
  uint64_t v4 = v2;
  id result = (id)(v2 + 64);
  unint64_t v6 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v1 || (unint64_t)result >= v1 + 64 + 8 * v6)
  {
    id result = memmove(result, (const void *)(v1 + 64), 8 * v6);
    uint64_t v4 = v35;
  }
  int64_t v8 = 0;
  *(void *)(v4 + 16) = *(void *)(v1 + 16);
  uint64_t v9 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v34 = v1;
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(v1 + 64);
  uint64_t v32 = v1 + 64;
  int64_t v33 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v35;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v8 << 6);
      uint64_t v15 = v34;
      goto LABEL_12;
    }
    int64_t v25 = v8 + 1;
    uint64_t v15 = v34;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v25);
    ++v8;
    if (!v26)
    {
      int64_t v8 = v25 + 1;
      if (v25 + 1 >= v33) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v32 + 8 * v8);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v11 = (v26 - 1) & v26;
    unint64_t v14 = __clz(__rbit64(v26)) + (v8 << 6);
LABEL_12:
    uint64_t v16 = sub_2453FCCB8();
    uint64_t v17 = *(void *)(v16 - 8);
    __n128 v18 = MEMORY[0x270FA5388](v16);
    int64_t v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    unint64_t v22 = *(void *)(v21 + 72) * v14;
    (*(void (**)(char *, unint64_t, uint64_t, __n128))(v17 + 16))(v20, *(void *)(v15 + 48) + v22, v16, v18);
    uint64_t v23 = 8 * v14;
    uint64_t v24 = *(void **)(*(void *)(v15 + 56) + v23);
    (*(void (**)(unint64_t, char *, uint64_t))(v17 + 32))(*(void *)(v12 + 48) + v22, v20, v16);
    *(void *)(*(void *)(v12 + 56) + v23) = v24;
    id result = v24;
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    id result = (id)swift_release();
    unint64_t v28 = v31;
    uint64_t v29 = v35;
    goto LABEL_28;
  }
  unint64_t v26 = *(void *)(v32 + 8 * v27);
  if (v26)
  {
    int64_t v8 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v8 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v8 >= v33) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v8);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_2453EBC8C()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED1650);
  int64_t v31 = v0;
  uint64_t v1 = *v0;
  uint64_t v2 = sub_2454009F8();
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v35 = v2;
  if (!v3)
  {
    id result = (id)swift_release();
    uint64_t v29 = v35;
    unint64_t v28 = v31;
LABEL_28:
    uint64_t *v28 = v29;
    return result;
  }
  uint64_t v4 = v2;
  id result = (id)(v2 + 64);
  unint64_t v6 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v1 || (unint64_t)result >= v1 + 64 + 8 * v6)
  {
    id result = memmove(result, (const void *)(v1 + 64), 8 * v6);
    uint64_t v4 = v35;
  }
  int64_t v8 = 0;
  *(void *)(v4 + 16) = *(void *)(v1 + 16);
  uint64_t v9 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v34 = v1;
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(v1 + 64);
  uint64_t v32 = v1 + 64;
  int64_t v33 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v35;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v8 << 6);
      uint64_t v15 = v34;
      goto LABEL_12;
    }
    int64_t v25 = v8 + 1;
    uint64_t v15 = v34;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v25);
    ++v8;
    if (!v26)
    {
      int64_t v8 = v25 + 1;
      if (v25 + 1 >= v33) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v32 + 8 * v8);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v11 = (v26 - 1) & v26;
    unint64_t v14 = __clz(__rbit64(v26)) + (v8 << 6);
LABEL_12:
    uint64_t v16 = sub_2453FCCB8();
    uint64_t v17 = *(void *)(v16 - 8);
    __n128 v18 = MEMORY[0x270FA5388](v16);
    int64_t v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    unint64_t v22 = *(void *)(v21 + 72) * v14;
    (*(void (**)(char *, unint64_t, uint64_t, __n128))(v17 + 16))(v20, *(void *)(v15 + 48) + v22, v16, v18);
    uint64_t v23 = 8 * v14;
    uint64_t v24 = *(void **)(*(void *)(v15 + 56) + v23);
    (*(void (**)(unint64_t, char *, uint64_t))(v17 + 32))(*(void *)(v12 + 48) + v22, v20, v16);
    *(void *)(*(void *)(v12 + 56) + v23) = v24;
    id result = v24;
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    id result = (id)swift_release();
    unint64_t v28 = v31;
    uint64_t v29 = v35;
    goto LABEL_28;
  }
  unint64_t v26 = *(void *)(v32 + 8 * v27);
  if (v26)
  {
    int64_t v8 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v8 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v8 >= v33) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v32 + 8 * v8);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2453EBF54()
{
  return sub_2453EBF60(&qword_268ED15D8);
}

void *sub_2453EBF60(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_2454009F8();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    __n128 v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v3 + 56) + v20);
    unint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *unint64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2453EC110()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED66D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2454009F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
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

void *sub_2453EC2C4()
{
  return sub_2453EC2D0((uint64_t *)&unk_268ED4910);
}

void *sub_2453EC2D0(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_2454009F8();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v3 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *int64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    id result = (void *)swift_retain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2453EC480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[18] = a2;
  v3[19] = a3;
  v3[17] = a1;
  return MEMORY[0x270FA2498](sub_2453EC4A4, 0, 0);
}

uint64_t sub_2453EC4A4()
{
  uint64_t v1 = (void *)qword_268EE3460;
  v0[20] = qword_268EE3460;
  if (v1)
  {
    uint64_t v2 = v0[17];
    id v3 = v1;
    uint64_t v4 = sub_2453FFB08();
    v0[21] = v4;
    v0[2] = v0;
    v0[7] = v0 + 16;
    v0[3] = sub_2453EC628;
    uint64_t v5 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_24524D208;
    v0[13] = &block_descriptor_1;
    v0[14] = v5;
    objc_msgSend(v3, sel_imageForAvatarRecord_poseName_completionHandler_, v2, v4, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6(0);
  }
}

uint64_t sub_2453EC628()
{
  return MEMORY[0x270FA2498](sub_2453EC708, 0, 0);
}

uint64_t sub_2453EC708()
{
  uint64_t v29 = v0;
  uint64_t v2 = (uint64_t *)(v0 + 128);
  uint64_t v1 = *(void **)(v0 + 128);

  if (!v1)
  {
    if (qword_268ECF4E0 == -1)
    {
LABEL_6:
      uint64_t v11 = sub_2453FDBB8();
      __swift_project_value_buffer(v11, (uint64_t)qword_268ED65C0);
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v12 = sub_2453FDB98();
      os_log_type_t v13 = sub_2454000D8();
      BOOL v14 = os_log_type_enabled(v12, v13);
      unint64_t v16 = *(void *)(v0 + 152);
      unint64_t v15 = *(void **)(v0 + 160);
      if (v14)
      {
        uint64_t v17 = *(void **)(v0 + 136);
        uint64_t v25 = *(void *)(v0 + 144);
        int64_t v27 = *(void **)(v0 + 160);
        uint64_t v18 = swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        uint64_t v28 = v26;
        *(_DWORD *)uint64_t v18 = 136315394;
        id v19 = objc_msgSend(v17, sel_identifier);
        uint64_t v20 = sub_2453FFB38();
        unint64_t v22 = v21;

        *(void *)(v0 + 80) = sub_245227298(v20, v22, &v28);
        sub_2454005E8();
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease_n();
        *(_WORD *)(v18 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 80) = sub_245227298(v25, v16, &v28);
        sub_2454005E8();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2451E4000, v12, v13, "Could not render requested image for %s/%s", (uint8_t *)v18, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2456A0410](v26, -1, -1);
        MEMORY[0x2456A0410](v18, -1, -1);
      }
      else
      {
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      uint64_t v9 = 0;
      goto LABEL_12;
    }
LABEL_16:
    swift_once();
    goto LABEL_6;
  }
  *(void *)(v0 + 128) = 0;
  id v3 = objc_msgSend(v1, sel_CGImage);
  uint64_t v4 = *(void **)(v0 + 160);
  if (!v3)
  {

    uint64_t v9 = 0;
    int64_t v10 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = v3;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_2453ECB98;
  *(void *)(v7 + 24) = v6;
  *(void *)(v0 + 112) = sub_2453ECBB0;
  *(void *)(v0 + 120) = v7;
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 1107296256;
  *(void *)(v0 + 96) = sub_2453E5CF4;
  *(void *)(v0 + 104) = &block_descriptor_27_0;
  uint64_t v8 = _Block_copy((const void *)(v0 + 80));
  swift_retain();
  swift_release();
  itk_cgImageCropZeroAlpha();

  _Block_release(v8);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v8)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v9 = *v2;
  int64_t v10 = sub_2453ECB98;
LABEL_9:
  sub_245203EB8((uint64_t)v10);
LABEL_12:
  int64_t v23 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v23(v9);
}

void sub_2453ECB28()
{
  sub_2453E5C08(*(void *)(v0 + 16));
}

void sub_2453ECB48()
{
  sub_2453E5EF4(v0[2], v0[3], v0[4]);
}

uint64_t sub_2453ECB68()
{
  return sub_2453E5DF4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_2453ECB88()
{
  return swift_deallocObject();
}

uint64_t sub_2453ECB98(uint64_t a1)
{
  return sub_2453E5C94(a1, *(void **)(v1 + 16));
}

uint64_t sub_2453ECBA0()
{
  return swift_deallocObject();
}

uint64_t sub_2453ECBB0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_42(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_42()
{
  return swift_release();
}

uint64_t sub_2453ECBF0()
{
  return sub_2453E54FC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2453ECC0C()
{
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_2453ECC44()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_245200928;
  return MEMORY[0x270FA2498](sub_2453E51C0, 0, 0);
}

uint64_t sub_2453ECCE8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2453ECD30()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2453FDFA8();
  swift_release();
  swift_release();
  return v1;
}

id sub_2453ECDA4()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF8D8]), sel_init);
  qword_268EE3468 = (uint64_t)result;
  return result;
}

id sub_2453ECDD8()
{
  id v0 = objc_msgSend(self, sel_imageDescriptorNamed_, *MEMORY[0x263F4B588]);
  id result = objc_msgSend(v0, sel_setDrawBorder_, 1);
  qword_268EE3470 = (uint64_t)v0;
  return result;
}

id sub_2453ECE40(void *a1)
{
  *(unsigned char *)(v1 + 80) = 0;
  uint64_t v3 = a1[7];
  *(void *)(v1 + 32) = a1[6];
  *(void *)(v1 + 40) = v3;
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  *(void *)(v1 + 48) = v5;
  *(void *)(v1 + 56) = v4;
  uint64_t v6 = a1[5];
  *(void *)(v1 + 64) = a1[4];
  *(void *)(v1 + 72) = v6;
  *(void *)(v1 + 16) = v5;
  *(void *)(v1 + 24) = v4;
  uint64_t v7 = qword_268ECF4F0;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 != -1) {
    swift_once();
  }
  id v8 = (id)qword_268EE3468;
  uint64_t v9 = (void *)sub_2453FFB08();
  id v10 = objc_msgSend(v8, sel_objectForKey_, v9);

  if (v10)
  {
    id v11 = v10;
    sub_2453FEEF8();
    swift_beginAccess();
    sub_2453FDF68();
    swift_endAccess();

LABEL_18:
    swift_release();
    return (id)v1;
  }
  type metadata accessor for iMessageAppBalloonPlugin();
  uint64_t v12 = swift_dynamicCastClass();
  if (v12)
  {
    os_log_type_t v13 = *(void **)(v12 + 80);
    BOOL v14 = self;
    swift_retain();
    id v15 = v13;
    id v16 = objc_msgSend(v14, sel_currentTraitCollection);
    id v17 = objc_msgSend(v16, sel_userInterfaceStyle);

    id v18 = objc_msgSend(v15, sel___ck_browserImageForInterfaceStyle_, v17);
    if (v18)
    {
      if (qword_268ECF4F8 != -1) {
        swift_once();
      }
      objc_msgSend((id)qword_268EE3470, sel_size);
      double v20 = v19;
      objc_msgSend(v18, sel_size);
      double v22 = v20 / v21;
      objc_msgSend(v18, sel_size);
      CGFloat v24 = v22 * v23;
      objc_msgSend((id)qword_268EE3470, sel_scale);
      CGFloat v26 = v25;
      v38.width = v24;
      v38.height = v20;
      UIGraphicsBeginImageContextWithOptions(v38, 0, v26);
      objc_msgSend(v18, sel_drawInRect_, 0.0, 0.0, v24, v20);
      int64_t v27 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      if (v27)
      {
        uint64_t v28 = v27;
        sub_2453FEEF8();
        swift_beginAccess();
        sub_2453FDF68();
        swift_endAccess();

        swift_release();
        goto LABEL_18;
      }
    }
    swift_release();
  }
  id v29 = objc_allocWithZone(MEMORY[0x263F4B540]);
  swift_bridgeObjectRetain();
  uint64_t v30 = (void *)sub_2453FFB08();
  swift_bridgeObjectRelease();
  id v31 = objc_msgSend(v29, sel_initWithBundleIdentifier_, v30);

  if (qword_268ECF4F8 != -1) {
    swift_once();
  }
  id result = objc_msgSend(v31, sel_imageForDescriptor_, qword_268EE3470);
  if (result)
  {
    int64_t v33 = result;
    *(unsigned char *)(v1 + 80) = objc_msgSend(result, sel_placeholder);
    id result = objc_msgSend(v33, sel_CGImage);
    if (result)
    {
      uint64_t v34 = result;
      objc_msgSend(v33, sel_scale);
      id v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_initWithCGImage_scale_orientation_, v34, 0, v35);

      id v37 = v36;
      sub_2453FEEF8();
      swift_beginAccess();
      sub_2453FDF68();
      swift_endAccess();

      goto LABEL_18;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_2453ED2E4()
{
  if (*((unsigned char *)v0 + 80) == 1)
  {
    uint64_t v1 = *v0;
    *((unsigned char *)v0 + 80) = 0;
    if (qword_268ECF4F8 != -1) {
      swift_once();
    }
    uint64_t v2 = (void *)qword_268EE3470;
    id v3 = objc_allocWithZone(MEMORY[0x263F4B540]);
    id v4 = v2;
    swift_bridgeObjectRetain();
    uint64_t v5 = (void *)sub_2453FFB08();
    swift_bridgeObjectRelease();
    id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_, v5);

    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v0;
    *(void *)(v7 + 24) = v1;
    v9[4] = sub_2453EDCA0;
    v9[5] = v7;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 1107296256;
    v9[2] = sub_2452789E8;
    v9[3] = &block_descriptor_44;
    id v8 = _Block_copy(v9);
    swift_retain();
    swift_release();
    objc_msgSend(v6, sel_getImageForImageDescriptor_completion_, v4, v8);
    _Block_release(v8);
  }
}

void sub_2453ED4A0(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    id v22 = a1;
    if (objc_msgSend(v22, sel_placeholder))
    {
    }
    else
    {
      id v5 = objc_msgSend(v22, sel_CGImage);
      if (v5)
      {
        id v6 = v5;
        objc_msgSend(v22, sel_scale);
        id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_initWithCGImage_scale_orientation_, v6, 0, v7);

        sub_2452322C0();
        uint64_t v21 = sub_245400288();
        uint64_t v9 = (void *)swift_allocObject();
        v9[2] = v8;
        v9[3] = a2;
        v9[4] = a3;
        aBlock[4] = sub_2453EDD00;
        aBlock[5] = v9;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_2452934DC;
        aBlock[3] = &block_descriptor_17;
        id v10 = _Block_copy(aBlock);
        v20[0] = v8;
        swift_retain();
        swift_release();
        uint64_t v11 = sub_2453FF418();
        v20[1] = v20;
        uint64_t v12 = *(void *)(v11 - 8);
        MEMORY[0x270FA5388](v11);
        BOOL v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
        sub_2453FF3E8();
        uint64_t v15 = sub_2453FF3C8();
        uint64_t v16 = *(void *)(v15 - 8);
        MEMORY[0x270FA5388](v15);
        id v18 = (char *)v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
        aBlock[0] = MEMORY[0x263F8EE78];
        sub_2452580BC();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEDF0);
        sub_24524506C();
        sub_2454006D8();
        double v19 = (void *)v21;
        MEMORY[0x24569E550](0, v14, v18, v10);
        _Block_release(v10);

        (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
        (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      }
      else
      {
        __break(1u);
      }
    }
  }
}

uint64_t sub_2453ED818(void *a1)
{
  if (qword_268ECF4F0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_268EE3468;
  id v3 = (void *)sub_2453FFB08();
  objc_msgSend(v2, sel_setObject_forKey_, a1, v3);

  id v4 = a1;
  sub_2453FEEF8();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2453FDFB8();
}

uint64_t sub_2453ED914()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC10StickerKit20StickerPackStripItem__icon;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED6708);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_2453ED9D8()
{
  return type metadata accessor for StickerPackStripItem();
}

uint64_t type metadata accessor for StickerPackStripItem()
{
  uint64_t result = qword_268ED66F0;
  if (!qword_268ED66F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2453EDA2C()
{
  sub_2453EDAD8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_2453EDAD8()
{
  if (!qword_268ED6700)
  {
    unint64_t v0 = sub_2453FDFC8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268ED6700);
    }
  }
}

uint64_t sub_2453EDB30@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for StickerPackStripItem();
  uint64_t result = sub_2453FDF58();
  *a1 = result;
  return result;
}

unint64_t sub_2453EDB70()
{
  return 0xD000000000000016;
}

unint64_t sub_2453EDC44()
{
  return sub_2453EDB70();
}

uint64_t sub_2453EDC68()
{
  swift_release();

  return swift_deallocObject();
}

void sub_2453EDCA0(void *a1)
{
  sub_2453ED4A0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t block_copy_helper_43(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_43()
{
  return swift_release();
}

uint64_t sub_2453EDCC0()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2453EDD00()
{
  return sub_2453ED818(*(void **)(v0 + 16));
}

uint64_t sub_2453EDD0C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2453FDFA8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2453EDD90()
{
  return sub_2453FDFB8();
}

id LiveButton.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

uint64_t sub_2453EDE4C()
{
  id v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10StickerKit10LiveButton_isLive);
  swift_beginAccess();
  return *v1;
}

id sub_2453EDE94(char a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC10StickerKit10LiveButton_isLive];
  swift_beginAccess();
  *uint64_t v3 = a1;
  return objc_msgSend(v1, sel_setNeedsUpdateConfiguration);
}

id (*sub_2453EDEF8(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_2453EDF58;
}

id sub_2453EDF58(uint64_t a1, char a2)
{
  id result = (id)swift_endAccess();
  if ((a2 & 1) == 0)
  {
    id v5 = *(void **)(a1 + 24);
    return objc_msgSend(v5, sel_setNeedsUpdateConfiguration);
  }
  return result;
}

id LiveButton.init()()
{
  v0[OBJC_IVAR____TtC10StickerKit10LiveButton_isLive] = 0;
  double v1 = *MEMORY[0x263F001A8];
  double v2 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v3 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 24);
  v55.receiver = v0;
  v55.super_class = (Class)type metadata accessor for LiveButton();
  id v5 = objc_msgSendSuper2(&v55, sel_initWithFrame_, v1, v2, v3, v4);
  id v6 = self;
  uint64_t v7 = *MEMORY[0x263F835B0];
  id v8 = v5;
  id v9 = objc_msgSend(v6, sel_preferredFontDescriptorWithTextStyle_, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ED6718);
  uint64_t inited = swift_initStackObject();
  long long v53 = xmmword_245406420;
  *(_OWORD *)(inited + 16) = xmmword_245406420;
  uint64_t v11 = (void *)*MEMORY[0x263F81858];
  *(void *)(inited + 32) = *MEMORY[0x263F81858];
  *(void *)(inited + 40) = *MEMORY[0x263F81820];
  id v12 = v9;
  id v13 = v11;
  unint64_t v14 = sub_245261ED8(inited);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ED06C8);
  uint64_t v15 = swift_initStackObject();
  *(_OWORD *)(v15 + 16) = v53;
  uint64_t v16 = (void *)*MEMORY[0x263F817A8];
  *(void *)(v15 + 32) = *MEMORY[0x263F817A8];
  *(void *)(v15 + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED6720);
  *(void *)(v15 + 40) = v14;
  id v17 = v16;
  sub_245260CF8(v15);
  type metadata accessor for AttributeName(0);
  sub_2453EE6C0();
  id v18 = (void *)sub_2453FFA58();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(v12, sel_fontDescriptorByAddingAttributes_, v18);

  id v20 = v19;
  objc_msgSend(v20, sel_pointSize);
  id v22 = objc_msgSend(self, sel_fontWithDescriptor_size_, v20, v21);

  uint64_t v23 = sub_245400548();
  uint64_t v24 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  CGFloat v26 = (char *)&aBlock[-1] - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245400508();
  int64_t v27 = self;
  id v28 = objc_msgSend(v27, sel_tertiarySystemFillColor);
  sub_2454004C8();
  id v29 = objc_msgSend(v27, sel_secondaryLabelColor);
  sub_2454004D8();
  sub_2453FFB98();
  sub_245400538();
  sub_2454004B8();
  uint64_t v30 = sub_245400498();
  __n128 v31 = MEMORY[0x270FA5388](v30);
  (*(void (**)(char *, void, __n128))(v33 + 104))((char *)&aBlock[-1] - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F821B0], v31);
  sub_2454004A8();
  uint64_t v34 = sub_2454004F8();
  __n128 v35 = MEMORY[0x270FA5388](v34);
  (*(void (**)(char *, void, __n128))(v37 + 104))((char *)&aBlock[-1] - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x263F821F8], v35);
  sub_245400488();
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED6728);
  MEMORY[0x270FA5388](v38 - 8);
  uint64_t v40 = (char *)&aBlock[-1] - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(swift_allocObject() + 16) = v22;
  id v41 = v22;
  sub_2453FDF28();
  uint64_t v42 = sub_2453FDF18();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v40, 0, 1, v42);
  sub_2454004E8();
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED3CA0);
  __n128 v44 = MEMORY[0x270FA5388](v43 - 8);
  uint64_t v46 = (char *)&aBlock[-1] - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t, __n128))(v24 + 16))(v46, v26, v23, v44);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v46, 0, 1, v23);
  id v47 = v8;
  sub_245400578();

  uint64_t v48 = swift_allocObject();
  *(void *)(v48 + 16) = v41;
  *(void *)(v48 + 24) = v47;
  aBlock[4] = sub_2453EEC60;
  aBlock[5] = v48;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_245311E20;
  aBlock[3] = &block_descriptor_45;
  v49 = _Block_copy(aBlock);
  id v50 = v47;
  id v51 = v41;
  swift_release();
  objc_msgSend(v50, sel_setConfigurationUpdateHandler_, v49);

  _Block_release(v49);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
  return v50;
}

uint64_t type metadata accessor for LiveButton()
{
  return self;
}

unint64_t sub_2453EE6C0()
{
  unint64_t result = qword_268ECF890;
  if (!qword_268ECF890)
  {
    type metadata accessor for AttributeName(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ECF890);
  }
  return result;
}

uint64_t sub_2453EE718@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_2453FC9E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a3, a1, v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2453EEFA4();
  id v7 = a2;
  return sub_2453FC9D8();
}

uint64_t sub_2453EE7D4()
{
  return swift_deallocObject();
}

uint64_t sub_2453EE80C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2453EE718(a1, *(void **)(v2 + 16), a2);
}

uint64_t sub_2453EE814()
{
  return sub_2453FFAF8() & 1;
}

uint64_t sub_2453EE870(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_245400548();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED3CA0);
  uint64_t v9 = *(void *)(*(void *)(v8 - 8) + 64);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_245400568();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))((char *)&v24 - v10, 1, v4) == 1) {
    return sub_245323F6C((uint64_t)&v24 - v10);
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, (char *)&v24 - v10, v4);
  id v12 = self;
  id v13 = objc_msgSend(v12, sel_tertiarySystemFillColor);
  sub_2454004C8();
  id v14 = objc_msgSend(v12, sel_secondaryLabelColor);
  sub_2454004D8();
  objc_msgSend(a2, sel_pointSize);
  id v16 = objc_msgSend(self, sel_configurationWithPointSize_weight_scale_, 5, 1, v15);
  swift_beginAccess();
  id v17 = v16;
  id v18 = (void *)sub_2453FFB08();
  swift_bridgeObjectRelease();
  id v19 = objc_msgSend(self, sel_systemImageNamed_withConfiguration_, v18, v17);
  uint64_t v24 = a1;
  id v20 = v19;

  id v21 = v20;
  sub_245400518();
  sub_2453FFB98();
  swift_bridgeObjectRelease();
  uint64_t v22 = sub_245400538();
  __n128 v23 = MEMORY[0x270FA5388](v22);
  (*(void (**)(char *, char *, uint64_t, __n128))(v5 + 16))((char *)&v24 - v10, v7, v4, v23);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))((char *)&v24 - v10, 0, 1, v4);
  sub_245400578();

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2453EEC20()
{
  return swift_deallocObject();
}

uint64_t sub_2453EEC60(uint64_t a1)
{
  return sub_2453EE870(a1, *(void **)(v1 + 16));
}

uint64_t block_copy_helper_44(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_44()
{
  return swift_release();
}

id LiveButton.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void LiveButton.init(frame:)()
{
}

id LiveButton.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LiveButton();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2453EEE14@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  double v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC10StickerKit10LiveButton_isLive);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

id sub_2453EEE68(char *a1, void **a2)
{
  char v2 = *a1;
  double v3 = *a2;
  uint64_t v4 = (char *)*a2 + OBJC_IVAR____TtC10StickerKit10LiveButton_isLive;
  swift_beginAccess();
  unsigned char *v4 = v2;
  return objc_msgSend(v3, sel_setNeedsUpdateConfiguration);
}

uint64_t method lookup function for LiveButton(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LiveButton);
}

uint64_t dispatch thunk of LiveButton.isLive.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of LiveButton.isLive.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of LiveButton.isLive.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

void sub_2453EEF84()
{
}

unint64_t sub_2453EEFA4()
{
  unint64_t result = qword_268ED6730;
  if (!qword_268ED6730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED6730);
  }
  return result;
}

void sub_2453EEFEC()
{
}

uint64_t sub_2453EF014()
{
  return 8;
}

uint64_t sub_2453EF020()
{
  return swift_release();
}

uint64_t sub_2453EF028(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_2453EF038()
{
  return sub_2453FFA98();
}

void *sub_2453EF080(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2453EF08C(char a1)
{
  char v2 = v1;
  type metadata accessor for StickerPhotosCreationResult();
  id v4 = objc_msgSend(v2, sel_info);
  if (!v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v14, &qword_268ECEFA0);
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectForSetting_, 1);

  if (v6)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_245260080((uint64_t)v18, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return 0;
  }
  long long v7 = v18[0];
  if (a1)
  {
    uint64_t v8 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v9 = sub_2453FC9F8();
    unint64_t v10 = (unint64_t *)&unk_268ED68D0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v8 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v9 = sub_2453FC7D8();
    unint64_t v10 = (unint64_t *)&unk_268ED68E0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v13 = sub_2453FBE88(v10, 255, v11);
  *((void *)&v15 + 1) = v8;
  uint64_t v16 = v13;
  *(void *)&long long v14 = v9;
  __swift_project_boxed_opaque_existential_1(&v14, v8);
  v18[0] = v7;
  sub_2453FBE88(&qword_268ED6980, 255, (void (*)(uint64_t))type metadata accessor for StickerPhotosCreationResult);
  sub_2453FDF38();
  sub_24520E508(v7, *((unint64_t *)&v7 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return v17;
}

uint64_t sub_2453EF438(char a1)
{
  char v2 = v1;
  type metadata accessor for CategoryChange();
  id v4 = objc_msgSend(v2, sel_info);
  if (!v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v14, &qword_268ECEFA0);
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectForSetting_, 1);

  if (v6)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_245260080((uint64_t)v18, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return 0;
  }
  long long v7 = v18[0];
  if (a1)
  {
    uint64_t v8 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v9 = sub_2453FC9F8();
    unint64_t v10 = (unint64_t *)&unk_268ED68D0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v8 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v9 = sub_2453FC7D8();
    unint64_t v10 = (unint64_t *)&unk_268ED68E0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v13 = sub_2453FBE88(v10, 255, v11);
  *((void *)&v15 + 1) = v8;
  uint64_t v16 = v13;
  *(void *)&long long v14 = v9;
  __swift_project_boxed_opaque_existential_1(&v14, v8);
  v18[0] = v7;
  sub_2453FBE88(&qword_268ED6978, 255, (void (*)(uint64_t))type metadata accessor for CategoryChange);
  sub_2453FDF38();
  sub_24520E508(v7, *((unint64_t *)&v7 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return v17;
}

uint64_t sub_2453EF7EC(char a1)
{
  char v2 = v1;
  type metadata accessor for EmojiSearchResult();
  id v4 = objc_msgSend(v2, sel_info);
  if (!v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v14, &qword_268ECEFA0);
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectForSetting_, 1);

  if (v6)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_245260080((uint64_t)v18, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return 0;
  }
  long long v7 = v18[0];
  if (a1)
  {
    uint64_t v8 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v9 = sub_2453FC9F8();
    unint64_t v10 = (unint64_t *)&unk_268ED68D0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v8 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v9 = sub_2453FC7D8();
    unint64_t v10 = (unint64_t *)&unk_268ED68E0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v13 = sub_2453FBE88(v10, 255, v11);
  *((void *)&v15 + 1) = v8;
  uint64_t v16 = v13;
  *(void *)&long long v14 = v9;
  __swift_project_boxed_opaque_existential_1(&v14, v8);
  v18[0] = v7;
  sub_2453FBE88(&qword_268ED6958, 255, (void (*)(uint64_t))type metadata accessor for EmojiSearchResult);
  sub_2453FDF38();
  sub_24520E508(v7, *((unint64_t *)&v7 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return v17;
}

uint64_t sub_2453EFB98(char a1)
{
  char v2 = v1;
  type metadata accessor for StickerSearchResult();
  id v4 = objc_msgSend(v2, sel_info);
  if (!v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v14, &qword_268ECEFA0);
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectForSetting_, 1);

  if (v6)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_245260080((uint64_t)v18, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return 0;
  }
  long long v7 = v18[0];
  if (a1)
  {
    uint64_t v8 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v9 = sub_2453FC9F8();
    unint64_t v10 = (unint64_t *)&unk_268ED68D0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v8 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v9 = sub_2453FC7D8();
    unint64_t v10 = (unint64_t *)&unk_268ED68E0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v13 = sub_2453FBE88(v10, 255, v11);
  *((void *)&v15 + 1) = v8;
  uint64_t v16 = v13;
  *(void *)&long long v14 = v9;
  __swift_project_boxed_opaque_existential_1(&v14, v8);
  v18[0] = v7;
  sub_2453FBE88((unint64_t *)&unk_268ED6960, 255, (void (*)(uint64_t))type metadata accessor for StickerSearchResult);
  sub_2453FDF38();
  sub_24520E508(v7, *((unint64_t *)&v7 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return v17;
}

uint64_t sub_2453EFF44(char a1)
{
  char v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEE10);
  id v4 = objc_msgSend(v2, sel_info);
  if (!v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v14, &qword_268ECEFA0);
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectForSetting_, 1);

  if (v6)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_245260080((uint64_t)v18, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return 0;
  }
  long long v7 = v18[0];
  if (a1)
  {
    uint64_t v8 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v9 = sub_2453FC9F8();
    unint64_t v10 = (unint64_t *)&unk_268ED68D0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v8 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v9 = sub_2453FC7D8();
    unint64_t v10 = (unint64_t *)&unk_268ED68E0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v13 = sub_2453FBE88(v10, 255, v11);
  *((void *)&v15 + 1) = v8;
  uint64_t v16 = v13;
  *(void *)&long long v14 = v9;
  __swift_project_boxed_opaque_existential_1(&v14, v8);
  v18[0] = v7;
  sub_2453FC018(&qword_268ED6970, &qword_268ECEE10);
  sub_2453FDF38();
  sub_24520E508(v7, *((unint64_t *)&v7 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return v17;
}

uint64_t sub_2453F02F8(char a1)
{
  char v2 = v1;
  type metadata accessor for StickerSearchQuery();
  id v4 = objc_msgSend(v2, sel_info);
  if (!v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v14, &qword_268ECEFA0);
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectForSetting_, 1);

  if (v6)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_245260080((uint64_t)v18, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return 0;
  }
  long long v7 = v18[0];
  if (a1)
  {
    uint64_t v8 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v9 = sub_2453FC9F8();
    unint64_t v10 = (unint64_t *)&unk_268ED68D0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v8 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v9 = sub_2453FC7D8();
    unint64_t v10 = (unint64_t *)&unk_268ED68E0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v13 = sub_2453FBE88(v10, 255, v11);
  *((void *)&v15 + 1) = v8;
  uint64_t v16 = v13;
  *(void *)&long long v14 = v9;
  __swift_project_boxed_opaque_existential_1(&v14, v8);
  v18[0] = v7;
  sub_2453FBE88(&qword_268ED6948, 255, (void (*)(uint64_t))type metadata accessor for StickerSearchQuery);
  sub_2453FDF38();
  sub_24520E508(v7, *((unint64_t *)&v7 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return v17;
}

uint64_t sub_2453F06A4(char a1)
{
  char v2 = v1;
  type metadata accessor for StickerSearchConfiguration();
  id v4 = objc_msgSend(v2, sel_info);
  if (!v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v14, &qword_268ECEFA0);
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectForSetting_, 1);

  if (v6)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_245260080((uint64_t)v18, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return 0;
  }
  long long v7 = v18[0];
  if (a1)
  {
    uint64_t v8 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v9 = sub_2453FC9F8();
    unint64_t v10 = (unint64_t *)&unk_268ED68D0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v8 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v9 = sub_2453FC7D8();
    unint64_t v10 = (unint64_t *)&unk_268ED68E0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v13 = sub_2453FBE88(v10, 255, v11);
  *((void *)&v15 + 1) = v8;
  uint64_t v16 = v13;
  *(void *)&long long v14 = v9;
  __swift_project_boxed_opaque_existential_1(&v14, v8);
  v18[0] = v7;
  sub_2453FBE88(&qword_268ED6940, 255, (void (*)(uint64_t))type metadata accessor for StickerSearchConfiguration);
  sub_2453FDF38();
  sub_24520E508(v7, *((unint64_t *)&v7 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return v17;
}

uint64_t sub_2453F0A50(char a1)
{
  char v2 = v1;
  id v4 = objc_msgSend(v2, sel_info);
  if (!v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v14, &qword_268ECEFA0);
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectForSetting_, 1);

  if (v6)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_245260080((uint64_t)v18, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return 0;
  }
  long long v7 = v18[0];
  if (a1)
  {
    uint64_t v8 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v9 = sub_2453FC9F8();
    unint64_t v10 = (unint64_t *)&unk_268ED68D0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v8 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v9 = sub_2453FC7D8();
    unint64_t v10 = (unint64_t *)&unk_268ED68E0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v13 = sub_2453FBE88(v10, 255, v11);
  *((void *)&v15 + 1) = v8;
  uint64_t v16 = v13;
  *(void *)&long long v14 = v9;
  __swift_project_boxed_opaque_existential_1(&v14, v8);
  v18[0] = v7;
  sub_2453FBFC4();
  sub_2453FDF38();
  sub_24520E508(v7, *((unint64_t *)&v7 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return v17;
}

uint64_t sub_2453F0DC0(char a1)
{
  char v2 = v1;
  type metadata accessor for EmojiGenerationAddResult();
  id v4 = objc_msgSend(v2, sel_info);
  if (!v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v14, &qword_268ECEFA0);
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectForSetting_, 1);

  if (v6)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_245260080((uint64_t)v18, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return 0;
  }
  long long v7 = v18[0];
  if (a1)
  {
    uint64_t v8 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v9 = sub_2453FC9F8();
    unint64_t v10 = (unint64_t *)&unk_268ED68D0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v8 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v9 = sub_2453FC7D8();
    unint64_t v10 = (unint64_t *)&unk_268ED68E0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v13 = sub_2453FBE88(v10, 255, v11);
  *((void *)&v15 + 1) = v8;
  uint64_t v16 = v13;
  *(void *)&long long v14 = v9;
  __swift_project_boxed_opaque_existential_1(&v14, v8);
  v18[0] = v7;
  sub_2453FBE88(&qword_268ED6938, 255, (void (*)(uint64_t))type metadata accessor for EmojiGenerationAddResult);
  sub_2453FDF38();
  sub_24520E508(v7, *((unint64_t *)&v7 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return v17;
}

uint64_t sub_2453F116C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  double v3 = v2;
  uint64_t v6 = type metadata accessor for EmojiGenerationHostToClientAction.SearchQuery();
  uint64_t v7 = *(void *)(v6 - 8);
  *(void *)&double v8 = MEMORY[0x270FA5388](v6).n128_u64[0];
  unint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(v3, sel_info, v8);
  if (!v11)
  {
    long long v23 = 0u;
    long long v24 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v23, &qword_268ECEFA0);
    goto LABEL_11;
  }
  id v12 = v11;
  id v13 = objc_msgSend(v11, sel_objectForSetting_, 1);

  if (v13)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v26, 0, sizeof(v26));
  }
  sub_245260080((uint64_t)v26, (uint64_t)&v23);
  if (!*((void *)&v24 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast())
  {
LABEL_11:
    uint64_t v19 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a2, v19, 1, v6);
  }
  long long v14 = v26[0];
  if (a1)
  {
    uint64_t v15 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v16 = sub_2453FC9F8();
    uint64_t v17 = (unint64_t *)&unk_268ED68D0;
    id v18 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v15 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v16 = sub_2453FC7D8();
    uint64_t v17 = (unint64_t *)&unk_268ED68E0;
    id v18 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v21 = sub_2453FBE88(v17, 255, v18);
  *((void *)&v24 + 1) = v15;
  uint64_t v25 = v21;
  *(void *)&long long v23 = v16;
  __swift_project_boxed_opaque_existential_1(&v23, v15);
  v26[0] = v14;
  sub_2453FBE88(&qword_268ED6930, 255, (void (*)(uint64_t))type metadata accessor for EmojiGenerationHostToClientAction.SearchQuery);
  sub_2453FDF38();
  sub_24520E508(v14, *((unint64_t *)&v14 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
  sub_2452C8A90((uint64_t)v10, a2);
  uint64_t v19 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a2, v19, 1, v6);
}

uint64_t sub_2453F15E0@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  double v3 = v2;
  id v6 = objc_msgSend(v3, sel_info);
  if (!v6)
  {
    long long v19 = 0u;
    long long v20 = 0u;
LABEL_10:
    uint64_t result = sub_245203CD8((uint64_t)&v19, &qword_268ECEFA0);
    goto LABEL_11;
  }
  uint64_t v7 = v6;
  id v8 = objc_msgSend(v6, sel_objectForSetting_, 1);

  if (v8)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
  }
  sub_245260080((uint64_t)&v22, (uint64_t)&v19);
  if (!*((void *)&v20 + 1)) {
    goto LABEL_10;
  }
  uint64_t result = swift_dynamicCast();
  if (!result)
  {
LABEL_11:
    long long v15 = 0uLL;
    char v16 = 2;
    long long v17 = 0uLL;
    goto LABEL_12;
  }
  long long v10 = v22;
  if (a1)
  {
    uint64_t v11 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v12 = sub_2453FC9F8();
    id v13 = (unint64_t *)&unk_268ED68D0;
    long long v14 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v11 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v12 = sub_2453FC7D8();
    id v13 = (unint64_t *)&unk_268ED68E0;
    long long v14 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v18 = sub_2453FBE88(v13, 255, v14);
  *((void *)&v20 + 1) = v11;
  uint64_t v21 = v18;
  *(void *)&long long v19 = v12;
  __swift_project_boxed_opaque_existential_1(&v19, v11);
  sub_2453FBF70();
  sub_2453FDF38();
  sub_24520E508(v10, *((unint64_t *)&v10 + 1));
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v19);
  long long v15 = v22;
  long long v17 = v23;
  char v16 = v24;
LABEL_12:
  *(_OWORD *)a2 = v15;
  *(_OWORD *)(a2 + 16) = v17;
  *(unsigned char *)(a2 + 32) = v16;
  return result;
}

uint64_t sub_2453F1970(char a1)
{
  char v2 = v1;
  type metadata accessor for EmojiSelection();
  id v4 = objc_msgSend(v2, sel_info);
  if (!v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v15, &qword_268ECEFA0);
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectForSetting_, 1);

  if (v6)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v19, 0, sizeof(v19));
  }
  sub_245260080((uint64_t)v19, (uint64_t)&v15);
  if (!*((void *)&v16 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return 0;
  }
  long long v7 = v19[0];
  if (a1)
  {
    uint64_t v8 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v9 = sub_2453FC9F8();
    long long v10 = (unint64_t *)&unk_268ED68D0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v8 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v9 = sub_2453FC7D8();
    long long v10 = (unint64_t *)&unk_268ED68E0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v13 = sub_2453FBE88(v10, 255, v11);
  *((void *)&v16 + 1) = v8;
  uint64_t v17 = v13;
  *(void *)&long long v15 = v9;
  __swift_project_boxed_opaque_existential_1(&v15, v8);
  v19[0] = v7;
  sub_2453FBE88(&qword_268ED68D8, v14, (void (*)(uint64_t))type metadata accessor for EmojiSelection);
  sub_2453FDF38();
  sub_24520E508(v7, *((unint64_t *)&v7 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v15);
  return v18;
}

uint64_t sub_2453F1D1C(char a1)
{
  char v2 = v1;
  type metadata accessor for UIStickerWrapper();
  id v4 = objc_msgSend(v2, sel_info);
  if (!v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v14, &qword_268ECEFA0);
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectForSetting_, 1);

  if (v6)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_245260080((uint64_t)v18, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return 0;
  }
  long long v7 = v18[0];
  if (a1)
  {
    uint64_t v8 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v9 = sub_2453FC9F8();
    long long v10 = (unint64_t *)&unk_268ED68D0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v8 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v9 = sub_2453FC7D8();
    long long v10 = (unint64_t *)&unk_268ED68E0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v13 = sub_2453FBE88(v10, 255, v11);
  *((void *)&v15 + 1) = v8;
  uint64_t v16 = v13;
  *(void *)&long long v14 = v9;
  __swift_project_boxed_opaque_existential_1(&v14, v8);
  v18[0] = v7;
  sub_2453FBE88(&qword_268ED68E8, 255, (void (*)(uint64_t))type metadata accessor for UIStickerWrapper);
  sub_2453FDF38();
  sub_24520E508(v7, *((unint64_t *)&v7 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return v17;
}

uint64_t sub_2453F20C8(char a1)
{
  char v2 = v1;
  type metadata accessor for EditSticker(0);
  id v4 = objc_msgSend(v2, sel_info);
  if (!v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v14, &qword_268ECEFA0);
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectForSetting_, 1);

  if (v6)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_245260080((uint64_t)v18, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return 0;
  }
  long long v7 = v18[0];
  if (a1)
  {
    uint64_t v8 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v9 = sub_2453FC9F8();
    long long v10 = (unint64_t *)&unk_268ED68D0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v8 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v9 = sub_2453FC7D8();
    long long v10 = (unint64_t *)&unk_268ED68E0;
    uint64_t v11 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v13 = sub_2453FBE88(v10, 255, v11);
  *((void *)&v15 + 1) = v8;
  uint64_t v16 = v13;
  *(void *)&long long v14 = v9;
  __swift_project_boxed_opaque_existential_1(&v14, v8);
  v18[0] = v7;
  sub_2453FBE88(&qword_268ED68F0, 255, (void (*)(uint64_t))type metadata accessor for EditSticker);
  sub_2453FDF38();
  sub_24520E508(v7, *((unint64_t *)&v7 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return v17;
}

uint64_t sub_2453F2478@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  double v3 = v2;
  uint64_t v6 = sub_2453FCCB8();
  id v7 = objc_msgSend(v3, sel_info);
  if (!v7)
  {
    long long v22 = 0u;
    long long v23 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v22, &qword_268ECEFA0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a2, 1, 1, v6);
  }
  uint64_t v8 = v7;
  id v9 = objc_msgSend(v7, sel_objectForSetting_, 1);

  if (v9)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v25, 0, sizeof(v25));
  }
  sub_245260080((uint64_t)v25, (uint64_t)&v22);
  if (!*((void *)&v23 + 1)) {
    goto LABEL_10;
  }
  uint64_t v10 = swift_dynamicCast();
  if (!v10) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a2, 1, 1, v6);
  }
  v21[2] = v21;
  long long v11 = v25[0];
  uint64_t v12 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v10);
  long long v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v15 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v16 = sub_2453FC9F8();
    uint64_t v17 = (unint64_t *)&unk_268ED68D0;
    uint64_t v18 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v15 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v16 = sub_2453FC7D8();
    uint64_t v17 = (unint64_t *)&unk_268ED68E0;
    uint64_t v18 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v20 = sub_2453FBE88(v17, 255, v18);
  *((void *)&v23 + 1) = v15;
  uint64_t v24 = v20;
  *(void *)&long long v22 = v16;
  __swift_project_boxed_opaque_existential_1(&v22, v15);
  v25[0] = v11;
  sub_2453FBF28(&qword_268ED1430, MEMORY[0x270FA9510]);
  sub_2453FDF38();
  sub_24520E508(v11, *((unint64_t *)&v11 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(a2, v14, v6);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(a2, 0, 1, v6);
}

uint64_t sub_2453F2900(char a1)
{
  char v2 = v1;
  id v4 = objc_msgSend(v2, sel_info);
  if (!v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v14, &qword_268ECEFA0);
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectForSetting_, 1);

  if (v6)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_245260080((uint64_t)v17, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return 0;
  }
  long long v7 = v17[0];
  if (a1)
  {
    uint64_t v8 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v9 = sub_2453FC9F8();
    uint64_t v10 = (unint64_t *)&unk_268ED68D0;
    long long v11 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v8 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v9 = sub_2453FC7D8();
    uint64_t v10 = (unint64_t *)&unk_268ED68E0;
    long long v11 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v13 = sub_2453FBE88(v10, 255, v11);
  *((void *)&v15 + 1) = v8;
  uint64_t v16 = v13;
  *(void *)&long long v14 = v9;
  __swift_project_boxed_opaque_existential_1(&v14, v8);
  sub_2453FDF38();
  sub_24520E508(v7, *((unint64_t *)&v7 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return *(void *)&v17[0];
}

uint64_t sub_2453F2C68(char a1)
{
  char v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEDE0);
  id v4 = objc_msgSend(v2, sel_info);
  if (!v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v14, &qword_268ECEFA0);
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectForSetting_, 1);

  if (v6)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_245260080((uint64_t)v17, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return 0;
  }
  long long v7 = v17[0];
  if (a1)
  {
    uint64_t v8 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v9 = sub_2453FC9F8();
    uint64_t v10 = (unint64_t *)&unk_268ED68D0;
    long long v11 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v8 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v9 = sub_2453FC7D8();
    uint64_t v10 = (unint64_t *)&unk_268ED68E0;
    long long v11 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v13 = sub_2453FBE88(v10, 255, v11);
  *((void *)&v15 + 1) = v8;
  uint64_t v16 = v13;
  *(void *)&long long v14 = v9;
  __swift_project_boxed_opaque_existential_1(&v14, v8);
  sub_2453FC018(&qword_268ED68F8, &qword_268ECEDE0);
  sub_2453FDF38();
  sub_24520E508(v7, *((unint64_t *)&v7 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return *(void *)&v17[0];
}

uint64_t sub_2453F303C(char a1)
{
  char v2 = v1;
  id v4 = objc_msgSend(v2, sel_info);
  if (!v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v14, &qword_268ECEFA0);
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectForSetting_, 1);

  if (v6)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_245260080((uint64_t)v18, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return 0;
  }
  long long v7 = v18[0];
  if (a1)
  {
    uint64_t v8 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v9 = sub_2453FC9F8();
    uint64_t v10 = (unint64_t *)&unk_268ED68D0;
    long long v11 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v8 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v9 = sub_2453FC7D8();
    uint64_t v10 = (unint64_t *)&unk_268ED68E0;
    long long v11 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v13 = sub_2453FBE88(v10, 255, v11);
  *((void *)&v15 + 1) = v8;
  uint64_t v16 = v13;
  *(void *)&long long v14 = v9;
  __swift_project_boxed_opaque_existential_1(&v14, v8);
  v18[0] = v7;
  sub_2453965E0();
  sub_2453FDF38();
  sub_24520E508(v7, *((unint64_t *)&v7 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return v17;
}

uint64_t sub_2453F33D8(char a1)
{
  char v2 = v1;
  id v4 = objc_msgSend(v2, sel_info);
  if (!v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v14, &qword_268ECEFA0);
    return 2;
  }
  uint64_t v5 = v4;
  id v6 = objc_msgSend(v4, sel_objectForSetting_, 1);

  if (v6)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_245260080((uint64_t)v18, (uint64_t)&v14);
  if (!*((void *)&v15 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return 2;
  }
  long long v7 = v18[0];
  if (a1)
  {
    uint64_t v8 = sub_2453FCA08();
    swift_allocObject();
    uint64_t v9 = sub_2453FC9F8();
    uint64_t v10 = (unint64_t *)&unk_268ED68D0;
    long long v11 = (void (*)(uint64_t))MEMORY[0x270FA8810];
  }
  else
  {
    uint64_t v8 = sub_2453FC7E8();
    swift_allocObject();
    uint64_t v9 = sub_2453FC7D8();
    uint64_t v10 = (unint64_t *)&unk_268ED68E0;
    long long v11 = (void (*)(uint64_t))MEMORY[0x270FA7DB0];
  }
  uint64_t v13 = sub_2453FBE88(v10, 255, v11);
  *((void *)&v15 + 1) = v8;
  uint64_t v16 = v13;
  *(void *)&long long v14 = v9;
  __swift_project_boxed_opaque_existential_1(&v14, v8);
  v18[0] = v7;
  sub_2453FDF38();
  sub_24520E508(v7, *((unint64_t *)&v7 + 1));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return v17;
}

uint64_t sub_2453F3738(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t sub_2453F3754()
{
  id v1 = objc_msgSend(v0, sel_info);
  if (!v1)
  {
    long long v6 = 0u;
    long long v7 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v6, &qword_268ECEFA0);
    return 0;
  }
  char v2 = v1;
  id v3 = objc_msgSend(v1, sel_objectForSetting_, 2);

  if (v3)
  {
    sub_2454006B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_245260080((uint64_t)v5, (uint64_t)&v6);
  if (!*((void *)&v7 + 1)) {
    goto LABEL_10;
  }
  sub_245203D98(0, &qword_268ED6908);
  if (swift_dynamicCast()) {
    return *(void *)&v5[0];
  }
  else {
    return 0;
  }
}

uint64_t sub_2453F3858()
{
  uint64_t v0 = sub_2453FDBB8();
  __swift_allocate_value_buffer(v0, qword_268ED6740);
  __swift_project_value_buffer(v0, (uint64_t)qword_268ED6740);
  return sub_2453FDBA8();
}

uint64_t sub_2453F38D8()
{
  if (*v0) {
    return 0x7373696D736964;
  }
  else {
    return 0x696A6F6D65;
  }
}

uint64_t sub_2453F3910@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2453FA908(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2453F3938(uint64_t a1)
{
  unint64_t v2 = sub_2453FBCFC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2453F3974(uint64_t a1)
{
  unint64_t v2 = sub_2453FBCFC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2453F39B0()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_2453F39E8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED6920);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  long long v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2453FBCFC();
  sub_245400D18();
  v8[15] = 0;
  swift_bridgeObjectRetain();
  sub_245400AF8();
  if (v1)
  {
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v8[14] = 1;
    sub_245400B08();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_2453F3B84(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED6838);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v1 + 32) = 1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2453FBCFC();
  sub_245400D08();
  if (v2)
  {
    type metadata accessor for EmojiSelection();
    swift_deallocPartialClassInstance();
  }
  else
  {
    char v14 = 0;
    *(void *)(v1 + 16) = sub_245400A98();
    *(void *)(v1 + 24) = v10;
    char v13 = 1;
    char v11 = sub_245400AA8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(unsigned char *)(v3 + 32) = v11 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t sub_2453F3D6C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for EmojiSelection();
  uint64_t v5 = swift_allocObject();
  uint64_t result = sub_2453F3B84(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_2453F3DC4(void *a1)
{
  return sub_2453F39E8(a1);
}

uint64_t sub_2453F3DE8()
{
  if (*v0) {
    return 0x6552656372756F73;
  }
  else {
    return 0xD000000000000011;
  }
}

uint64_t sub_2453F3E2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2453FA9F4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2453F3E54(uint64_t a1)
{
  unint64_t v2 = sub_2453FBD50();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2453F3E90(uint64_t a1)
{
  unint64_t v2 = sub_2453FBD50();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2453F3ECC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10StickerKit11EditSticker_stickerIdentifier;
  uint64_t v2 = sub_2453FCCB8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_2453F3F6C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED6910);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2453FBD50();
  sub_245400D18();
  uint64_t v9 = sub_2453FCCB8();
  uint64_t v10 = *(void *)(v9 - 8);
  __n128 v11 = MEMORY[0x270FA5388](v9);
  char v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v10 + 16))(v13, v3 + OBJC_IVAR____TtC10StickerKit11EditSticker_stickerIdentifier, v9, v11);
  LOBYTE(v16[0]) = 0;
  sub_2453FBF28((unint64_t *)&unk_268ED6890, MEMORY[0x270FA9510]);
  sub_245400B28();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  if (!v2)
  {
    long long v14 = *(_OWORD *)(v3 + OBJC_IVAR____TtC10StickerKit11EditSticker_sourceRect + 16);
    v16[0] = *(_OWORD *)(v3 + OBJC_IVAR____TtC10StickerKit11EditSticker_sourceRect);
    v16[1] = v14;
    char v17 = 1;
    type metadata accessor for CGRect(0);
    sub_2453FBF28(&qword_268ED4480, type metadata accessor for CGRect);
    sub_245400B28();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_2453F421C(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED6848);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2453FBD50();
  sub_245400D08();
  if (v2)
  {
    type metadata accessor for EditSticker(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v15 = v5;
    uint64_t v8 = sub_2453FCCB8();
    uint64_t v14 = *(void *)(v8 - 8);
    MEMORY[0x270FA5388](v8);
    LOBYTE(v16) = 0;
    sub_2453FBF28(&qword_268ED1430, MEMORY[0x270FA9510]);
    sub_245400AC8();
    uint64_t v9 = *(void (**)(void))(v14 + 32);
    v13[1] = v1 + OBJC_IVAR____TtC10StickerKit11EditSticker_stickerIdentifier;
    v9();
    type metadata accessor for CGRect(0);
    char v18 = 1;
    sub_2453FBF28(&qword_268ED4470, type metadata accessor for CGRect);
    sub_245400AC8();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v4);
    __n128 v11 = (_OWORD *)(v1 + OBJC_IVAR____TtC10StickerKit11EditSticker_sourceRect);
    long long v12 = v17;
    *__n128 v11 = v16;
    v11[1] = v12;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t sub_2453F456C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for EditSticker(0);
  uint64_t v5 = swift_allocObject();
  uint64_t result = sub_2453F421C(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_2453F45C8(void *a1)
{
  return sub_2453F3F6C(a1);
}

void sub_2453F45EC(void *a1)
{
  uint64_t v3 = (void *)sub_2453F3754();
  objc_msgSend(v3, sel_invalidate);

  if (objc_msgSend(a1, sel_delegate))
  {
    id v47 = &unk_26FA477F0;
    uint64_t v4 = swift_dynamicCastObjCProtocolConditional();
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      id v6 = objc_msgSend(v1, sel_info);
      if (v6)
      {
        uint64_t v7 = v6;
        id v8 = objc_msgSend(v6, sel_objectForSetting_, 0);

        if (v8)
        {
          sub_2454006B8();
          swift_unknownObjectRelease();
        }
        else
        {
          memset(v44, 0, sizeof(v44));
        }
        sub_245260080((uint64_t)v44, (uint64_t)&v45);
        if (*((void *)&v46 + 1))
        {
          if (swift_dynamicCast())
          {
            switch(*(void *)&v44[0])
            {
              case 0:
                uint64_t v9 = sub_2453F1970(0);
                if (!v9) {
                  goto LABEL_33;
                }
                uint64_t v10 = v9;
                swift_bridgeObjectRetain();
                __n128 v11 = (void *)sub_2453FFB08();
                swift_bridgeObjectRelease();
                objc_msgSend(v5, sel_didSelectEmoji_dismiss_, v11, *(unsigned __int8 *)(v10 + 32));
                swift_release();
                goto LABEL_32;
              case 1:
                uint64_t v12 = sub_2453F1D1C(0);
                if (!v12) {
                  goto LABEL_33;
                }
                uint64_t v13 = v12;
                uint64_t v14 = sub_2453F8CEC();
                if (v14)
                {
                  uint64_t v15 = (void *)v14;
                  objc_msgSend(v5, sel_didSelectSticker_dismiss_, v14, *(unsigned __int8 *)(v13 + 32));

                  swift_unknownObjectRelease();
                  swift_release();
                  return;
                }
                swift_release();
                break;
              case 2:
                uint64_t v16 = sub_2453F20C8(0);
                if (!v16) {
                  goto LABEL_33;
                }
                uint64_t v17 = v16;
                uint64_t v18 = sub_2453FCCB8();
                uint64_t v19 = *(void *)(v18 - 8);
                __n128 v20 = MEMORY[0x270FA5388](v18);
                long long v22 = (char *)v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0) + 96;
                (*(void (**)(char *, uint64_t, uint64_t, __n128))(v19 + 16))(v22, v17 + OBJC_IVAR____TtC10StickerKit11EditSticker_stickerIdentifier, v18, v20);
                long long v23 = (void *)sub_2453FCC78();
                (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
                objc_msgSend(v5, sel_didSelectEditWithStickerIdentifer_sourceRect_, v23, *(double *)(v17 + OBJC_IVAR____TtC10StickerKit11EditSticker_sourceRect), *(double *)(v17 + OBJC_IVAR____TtC10StickerKit11EditSticker_sourceRect + 8), *(double *)(v17 + OBJC_IVAR____TtC10StickerKit11EditSticker_sourceRect + 16), *(double *)(v17 + OBJC_IVAR____TtC10StickerKit11EditSticker_sourceRect + 24));
                swift_release();
                swift_unknownObjectRelease();

                return;
              case 3:
                objc_msgSend(v5, sel_didSelectPresentPicker);
                goto LABEL_33;
              case 4:
                uint64_t v24 = sub_2453FCCB8();
                uint64_t v25 = *(void *)(v24 - 8);
                MEMORY[0x270FA5388](v24);
                int64_t v27 = (char *)v44 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0) + 96;
                uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEC40);
                MEMORY[0x270FA5388](v28 - 8);
                uint64_t v30 = (char *)v44 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0) + 96;
                sub_2453F2478(0, (uint64_t)v30);
                if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v30, 1, v24) == 1)
                {
                  sub_245203CD8((uint64_t)v30, (uint64_t *)&unk_268ECEC40);
                  sub_2453F2900(0);
                  if (v31)
                  {
                    uint64_t v32 = (void *)sub_2453FFB08();
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    uint64_t v32 = 0;
                  }
                  objc_msgSend(v5, sel_didSelectCreate_queryString_, 0, v32);
                  swift_unknownObjectRelease();
                }
                else
                {
                  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v27, v30, v24);
                  id v41 = (void *)sub_2453FCC78();
                  objc_msgSend(v5, sel_didSelectCreate_queryString_, v41, 0);
                  swift_unknownObjectRelease();

                  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
                }
                return;
              case 5:
                uint64_t v33 = sub_2453F2C68(0);
                unint64_t v35 = v34;
                uint64_t v36 = (void *)sub_2453FFB08();
                id v37 = objc_msgSend(self, sel_defaultCenter);
                if (v35 >= 2)
                {
                  __swift_instantiateConcreteTypeFromMangledName(&qword_268ED14E0);
                  uint64_t inited = swift_initStackObject();
                  *(_OWORD *)(inited + 16) = xmmword_245406420;
                  *(void *)&long long v45 = 0x6C6F686563616C50;
                  *((void *)&v45 + 1) = 0xEB00000000726564;
                  sub_2454007C8();
                  *(void *)(inited + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEDE0);
                  *(void *)(inited + 72) = v33;
                  *(void *)(inited + 80) = v35;
                  sub_2452614DC(inited);
                  __n128 v11 = (void *)sub_2453FFA58();
                  swift_bridgeObjectRelease();
                }
                else
                {
                  __n128 v11 = 0;
                }
                objc_msgSend(v37, sel_postNotificationName_object_userInfo_, v36, 0, v11);

LABEL_32:
                goto LABEL_33;
              case 6:
                uint64_t v38 = sub_2453F303C(0);
                if ((v39 & 1) == 0) {
                  objc_msgSend(v5, sel_didPinch_, *(double *)&v38);
                }
                goto LABEL_33;
              case 7:
                char v40 = sub_2453F33D8(0);
                if (v40 != 2) {
                  objc_msgSend(v5, sel_didBeingDrag_, v40 & 1);
                }
                goto LABEL_33;
              default:
                goto LABEL_33;
            }
          }
          goto LABEL_33;
        }
      }
      else
      {
        long long v45 = 0u;
        long long v46 = 0u;
      }
      swift_unknownObjectRelease();
      sub_245203CD8((uint64_t)&v45, &qword_268ECEFA0);
      return;
    }
LABEL_33:
    swift_unknownObjectRelease();
  }
}

id sub_2453F4DA0(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5)
{
  if (a3)
  {
    v14[4] = a3;
    v14[5] = a4;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 1107296256;
    v14[2] = sub_245311E20;
    v14[3] = &block_descriptor_71;
    uint64_t v10 = _Block_copy(v14);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v10 = 0;
  }
  __n128 v11 = (objc_class *)type metadata accessor for EmojiAndStickerClientToHostAction();
  v15.receiver = v5;
  v15.super_class = v11;
  id v12 = objc_msgSendSuper2(&v15, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, a1, a2, v10, a5);
  sub_245203EB8(a3);

  _Block_release(v10);
  return v12;
}

id sub_2453F4FBC(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for EmojiAndStickerClientToHostAction();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id sub_2453F500C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmojiAndStickerClientToHostAction();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2453F5044()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_disableInsets);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2453F508C(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_disableInsets);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_2453F50D8())()
{
  return j_j__swift_endAccess;
}

void sub_2453F5134(void **a1, void *a2)
{
  objc_super v2 = *a1;
  uint64_t v3 = (void **)(*a2 + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_configuration);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = v2;
  id v5 = v2;
}

void *sub_2453F5198()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_configuration);
  swift_beginAccess();
  objc_super v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_2453F51E8(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_configuration);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_2453F523C())()
{
  return j__swift_endAccess;
}

uint64_t sub_2453F5298()
{
  uint64_t v1 = OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController____lazy_storage___dataSource;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController____lazy_storage___dataSource))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController____lazy_storage___dataSource);
  }
  else
  {
    uint64_t v3 = v0;
    type metadata accessor for CombinedSearchDataSource();
    swift_allocObject();
    sub_2453257C0();
    uint64_t v2 = v4;
    *(void *)(v3 + v1) = v4;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_2453F5314()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_245400168();
  swift_release();
  swift_release();
  return v1;
}

void sub_2453F5388()
{
  uint64_t v1 = v0;
  if (qword_268ECF500 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2453FDBB8();
  __swift_project_value_buffer(v2, (uint64_t)qword_268ED6740);
  uint64_t v3 = sub_2453FDB98();
  os_log_type_t v4 = sub_2454000C8();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2451E4000, v3, v4, "viewDidLoad", v5, 2u);
    MEMORY[0x2456A0410](v5, -1, -1);
  }

  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82A48]), sel_initWithTarget_action_, v1, sel_handleWithPinch_);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v25 = v6;
  id v7 = v1;
  sub_245400178();
  id v8 = objc_msgSend(v7, sel_view);
  if (!v8)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v9 = v8;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_245400168();
  swift_release();
  swift_release();
  objc_msgSend(v9, sel_addGestureRecognizer_, v25);

  id v10 = objc_msgSend(v7, sel_view);
  if (!v10)
  {
LABEL_11:
    __break(1u);
    return;
  }
  __n128 v11 = v10;
  id v12 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v11, sel_setBackgroundColor_, v12);

  uint64_t v13 = self;
  id v14 = objc_msgSend(v13, sel_defaultCenter);
  objc_super v15 = (void *)sub_2453FFB08();
  objc_msgSend(v14, sel_addObserver_selector_name_object_, v7, sel_didTapToInsertSticker_, v15, 0);

  id v16 = objc_msgSend(v13, sel_defaultCenter);
  uint64_t v17 = (void *)sub_2453FFB08();
  objc_msgSend(v16, sel_addObserver_selector_name_object_, v7, sel_didTapToEdit_, v17, 0);

  id v18 = objc_msgSend(v13, sel_defaultCenter);
  uint64_t v19 = (void *)sub_2453FFB08();
  objc_msgSend(v18, sel_addObserver_selector_name_object_, v7, sel_didTapToPresentPicker_, v19, 0);

  id v20 = objc_msgSend(v13, sel_defaultCenter);
  uint64_t v21 = (void *)sub_2453FFB08();
  objc_msgSend(v20, sel_addObserver_selector_name_object_, v7, sel_didTapToCreateNew_, v21, 0);

  id v22 = objc_msgSend(v13, sel_defaultCenter);
  long long v23 = (void *)sub_2453FFB08();
  objc_msgSend(v22, sel_addObserver_selector_name_object_, v7, sel_didChangePlaceholder_, v23, 0);

  id v24 = objc_msgSend(v13, sel_defaultCenter);
  if (qword_268ECF238 != -1) {
    swift_once();
  }
  objc_msgSend(v24, sel_addObserver_selector_name_object_, v7, sel_stickerViewDidBeginDrag_, qword_268EE3080, 0);
}

id sub_2453F58E4(char *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268ECF500 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_2453FDBB8();
  __swift_project_value_buffer(v7, (uint64_t)qword_268ED6740);
  id v8 = sub_2453FDB98();
  os_log_type_t v9 = sub_2454000C8();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_2451E4000, v8, v9, "search", v10, 2u);
    MEMORY[0x2456A0410](v10, -1, -1);
  }

  uint64_t v11 = OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_searchTask;
  if (*(void *)(v2 + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_searchTask))
  {
    swift_retain();
    sub_2453FFE98();
    swift_release();
  }
  id v12 = &a1[OBJC_IVAR___STKStickerSearchQuery_exactQuery];
  swift_beginAccess();
  unint64_t v13 = *((void *)v12 + 1);
  if (v13
    && ((v13 & 0x2000000000000000) != 0 ? (uint64_t v14 = HIBYTE(v13) & 0xF) : (uint64_t v14 = *(void *)v12 & 0xFFFFFFFFFFFFLL), v14))
  {
    uint64_t v15 = sub_2453FFE78();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v6, 1, 1, v15);
    uint64_t v16 = swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_2453FFE28();
    swift_retain();
    uint64_t v17 = a1;
    uint64_t v18 = sub_2453FFE18();
    uint64_t v19 = (void *)swift_allocObject();
    uint64_t v20 = MEMORY[0x263F8F500];
    _OWORD v19[2] = v18;
    v19[3] = v20;
    v19[4] = v16;
    v19[5] = v17;
    swift_release();
    *(void *)(v2 + v11) = sub_245262154((uint64_t)v6, (uint64_t)&unk_268ED6788, (uint64_t)v19);
    return (id)swift_release();
  }
  else
  {
    id result = *(id *)(v2
                   + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_uiEmojiAndStickerCollectionViewController);
    if (result) {
      return objc_msgSend(result, sel_setSearchResults_, 0);
    }
  }
  return result;
}

uint64_t sub_2453F5BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  sub_2453FFE28();
  v5[7] = sub_2453FFE18();
  uint64_t v7 = sub_2453FFDB8();
  v5[8] = v7;
  v5[9] = v6;
  return MEMORY[0x270FA2498](sub_2453F5C4C, v7, v6);
}

uint64_t sub_2453F5C4C()
{
  uint64_t v1 = v0[5] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x2456A0530](v1);
  v0[10] = v2;
  if (v2)
  {
    v0[11] = sub_2453F5298();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[12] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_2453F5D54;
    uint64_t v4 = v0[6];
    return sub_24532435C(v4);
  }
  else
  {
    swift_release();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_2453F5D54(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[13] = a1;
  v3[14] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = v3[8];
    uint64_t v5 = v3[9];
    uint64_t v6 = sub_2453F61B8;
  }
  else
  {
    swift_release();
    uint64_t v4 = v3[8];
    uint64_t v5 = v3[9];
    uint64_t v6 = sub_2453F5E70;
  }
  return MEMORY[0x270FA2498](v6, v4, v5);
}

uint64_t sub_2453F5E70()
{
  uint64_t v29 = v0;
  uint64_t v1 = *(void **)(v0 + 112);
  swift_release();
  sub_2453FFEB8();
  uint64_t v2 = *(void *)(v0 + 104);
  if (v1)
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)(v2 + 16);
    if (v3)
    {
      uint64_t v25 = v0;
      unint64_t v26 = MEMORY[0x263F8EE78];
      sub_2454008E8();
      uint64_t v4 = (unsigned char *)(v2 + 81);
      do
      {
        uint64_t v6 = *(void **)(v4 - 49);
        if (*v4)
        {
          id v5 = v6;
        }
        else
        {
          uint64_t v7 = *(void *)(v4 - 9);
          uint64_t v8 = *(void *)(v4 - 17);
          uint64_t v9 = *(void *)(v4 - 25);
          uint64_t v10 = *(void *)(v4 - 33);
          uint64_t v11 = *(void *)(v4 - 41);
          char v12 = *(v4 - 1);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEC40);
          uint64_t v13 = swift_task_alloc();
          uint64_t v14 = sub_2453FCCB8();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
          v27[0] = (uint64_t)v6;
          v27[1] = v11;
          uint64_t v27[2] = v10;
          v27[3] = v9;
          v27[4] = v8;
          v27[5] = v7;
          char v28 = v12;
          __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
          uint64_t v15 = swift_task_alloc();
          uint64_t v16 = sub_2453FCDC8();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
          id v17 = objc_allocWithZone((Class)type metadata accessor for ImageGlyph(0));
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_245212328(v8, v7, v12);
          ImageGlyph.init(stickerUUID:stickerEffectType:stickerSourceType:avatarIdentifier:poseIdentifier:emoji:emojiString:indexPath:)(v13, 0, 0, 0, 0, 0, 0, v27, 0, 0, v15);
          swift_task_dealloc();
          swift_task_dealloc();
        }
        sub_2454008C8();
        sub_2454008F8();
        sub_245400908();
        sub_2454008D8();
        v4 += 56;
        --v3;
      }
      while (v3);
      uint64_t v0 = v25;
      unint64_t v18 = v26;
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      unint64_t v18 = MEMORY[0x263F8EE78];
    }
    uint64_t v19 = *(char **)(v0 + 80);
    uint64_t v20 = *(void **)&v19[OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_uiEmojiAndStickerCollectionViewController];
    if (v20)
    {
      id v21 = v20;
      sub_2453CD590(v18);
      swift_bridgeObjectRelease();
      uint64_t v22 = (void *)sub_2453FFCF8();
      swift_bridgeObjectRelease();
      objc_msgSend(v21, sel_setSearchResults_, v22);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  long long v23 = *(uint64_t (**)(void))(v0 + 8);
  return v23();
}

uint64_t sub_2453F61B8()
{
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = (void *)v0[10];
  swift_release();

  swift_release();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

id sub_2453F623C(uint64_t a1)
{
  return objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_uiEmojiAndStickerCollectionViewController), sel_handleKeyEvent_, a1);
}

void sub_2453F6270(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = objc_msgSend(v3, sel__hostedWindowScene);
  if (v6)
  {
    uint64_t v7 = v6;
    type metadata accessor for EmojiSelection();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a1;
    *(void *)(v8 + 24) = a2;
    *(unsigned char *)(v8 + 32) = 1;
    swift_bridgeObjectRetain();
    id v9 = sub_2453F957C(0, v8, 0, 0);
    swift_release();
    objc_msgSend(v7, sel_sendAction_, v9);
  }
}

void sub_2453F63B8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  id v8 = objc_msgSend(v4, sel__hostedWindowScene);
  if (v8)
  {
    id v9 = v8;
    type metadata accessor for EmojiSelection();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = a1;
    *(void *)(v10 + 24) = a2;
    *(unsigned char *)(v10 + 32) = a3 & 1;
    swift_bridgeObjectRetain();
    id v11 = sub_2453F957C(0, v10, 0, 0);
    swift_release();
    objc_msgSend(v9, sel_sendAction_, v11);
  }
}

void sub_2453F6514(char a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(v2, sel__hostedWindowScene);
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = sub_2453F9C0C(7, a1 & 1, 0, 0);
    objc_msgSend(v5, sel_sendAction_, v6);
  }
}

void sub_2453F6654()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2453FF778();
  uint64_t v3 = *(void **)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2453FF698();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FC8F8();
  if (!v97)
  {
    sub_245203CD8((uint64_t)aBlock, &qword_268ECEFA0);
    return;
  }
  sub_245203D98(0, &qword_268ED6888);
  if ((swift_dynamicCast() & 1) == 0) {
    return;
  }
  v91 = v3;
  id v10 = (id)v100;
  uint64_t v11 = sub_2453FC908();
  v92 = v0;
  id v93 = v10;
  if (!v11)
  {
    long long v100 = 0u;
    long long v101 = 0u;
LABEL_16:
    sub_245203CD8((uint64_t)&v100, &qword_268ECEFA0);
LABEL_17:
    uint64_t v22 = sub_2453FC908();
    uint64_t v89 = v2;
    v88 = (void (*)(void, void))v5;
    if (v22)
    {
      uint64_t v23 = v22;
      *(void *)&long long v100 = 0xD000000000000041;
      *((void *)&v100 + 1) = 0x800000024541DED0;
      sub_2454007C8();
      if (*(void *)(v23 + 16) && (unint64_t v24 = sub_2452A70DC((uint64_t)aBlock), (v25 & 1) != 0))
      {
        sub_245227DB8(*(void *)(v23 + 56) + 32 * v24, (uint64_t)&v100);
      }
      else
      {
        long long v100 = 0u;
        long long v101 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_2452AACA4((uint64_t)aBlock);
      if (*((void *)&v101 + 1))
      {
        if (swift_dynamicCast())
        {
          int v26 = LOBYTE(aBlock[0]);
          goto LABEL_28;
        }
LABEL_27:
        int v26 = 1;
LABEL_28:
        LODWORD(v90) = v26;
        sub_2452767D0(v10);
        (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F79888], v6);
        sub_2453FF708();
        swift_allocObject();
        uint64_t v27 = sub_2453FF688();
        uint64_t v28 = sub_2453FCCB8();
        uint64_t v29 = *(void *)(v28 - 8);
        MEMORY[0x270FA5388](v28);
        uint64_t v31 = (char *)v78 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEC40);
        *(void *)&double v33 = MEMORY[0x270FA5388](v32 - 8).n128_u64[0];
        unint64_t v35 = (char *)v78 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
        id v36 = objc_msgSend(v10, sel_identifier, v33);
        sub_2453FFB38();

        sub_2453FCC58();
        uint64_t v37 = v28;
        uint64_t v38 = v29;
        swift_bridgeObjectRelease();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v35, 1, v37) == 1)
        {
          swift_release();
          sub_245203CD8((uint64_t)v35, (uint64_t *)&unk_268ECEC40);
          id v39 = v93;
        }
        else
        {
          v87 = v78;
          (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v31, v35, v37);
          char v40 = v91;
          id v41 = v88;
          uint64_t v42 = v89;
          ((void (*)(void (*)(void, void), void, uint64_t))v91[13])(v88, *MEMORY[0x263F798F0], v89);
          uint64_t v43 = (void *)sub_2453FF6C8();
          ((void (*)(void, uint64_t))v40[1])(v41, v42);
          id v39 = v93;
          if (v43)
          {
            uint64_t v44 = sub_2453FF908();
            uint64_t v86 = v37;
            v85 = v31;
            id v84 = v43;
            uint64_t v83 = v27;
            if (!v45)
            {
              uint64_t v44 = sub_2453FF758();
              if (!v45) {
                uint64_t v44 = sub_2453FFB98();
              }
            }
            sub_2452749AC(v44, v45);
            swift_bridgeObjectRelease();
            sub_245203D98(0, (unint64_t *)&qword_268ECEE60);
            uint64_t v89 = sub_245400288();
            uint64_t v46 = sub_2453FF438();
            v91 = v78;
            uint64_t v81 = v46;
            uint64_t v47 = *(void *)(v46 - 8);
            MEMORY[0x270FA5388](v46);
            v49 = (char *)v78 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
            MEMORY[0x270FA5388](v50);
            long long v52 = (char *)v78 - v51;
            sub_2453FF428();
            uint64_t v53 = sub_2453FF3B8();
            uint64_t v54 = *(void *)(v53 - 8);
            __n128 v55 = MEMORY[0x270FA5388](v53);
            v57 = (void *)((char *)v78 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0));
            void *v57 = 2;
            (*(void (**)(void *, void, uint64_t, __n128))(v54 + 104))(v57, *MEMORY[0x263F8F020], v53, v55);
            MEMORY[0x24569D700](v52, v57);
            (*(void (**)(void *, uint64_t))(v54 + 8))(v57, v53);
            v58 = *(void (**)(void, void))(v47 + 8);
            uint64_t v82 = v47 + 8;
            v88 = v58;
            v58(v52, v46);
            uint64_t v59 = swift_allocObject();
            swift_unknownObjectWeakInit();
            v98 = sub_2453FBED0;
            uint64_t v99 = v59;
            aBlock[0] = MEMORY[0x263EF8330];
            aBlock[1] = 1107296256;
            aBlock[2] = sub_2452934DC;
            v97 = &block_descriptor_46;
            v60 = _Block_copy(aBlock);
            swift_release();
            uint64_t v79 = sub_2453FF418();
            v80 = v78;
            uint64_t v61 = *(void *)(v79 - 8);
            MEMORY[0x270FA5388](v79);
            v63 = (char *)v78 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0);
            sub_2453FF3E8();
            uint64_t v64 = sub_2453FF3C8();
            v78[1] = v78;
            uint64_t v65 = *(void *)(v64 - 8);
            MEMORY[0x270FA5388](v64);
            v67 = (char *)v78 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
            aBlock[0] = MEMORY[0x263F8EE78];
            sub_2453FBF28((unint64_t *)&qword_268ECED90, MEMORY[0x270FCDA08]);
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEDF0);
            sub_24524506C();
            sub_2454006D8();
            v68 = (void *)v89;
            MEMORY[0x24569E4C0](v49, v63, v67, v60);
            swift_release();
            _Block_release(v60);

            (*(void (**)(char *, uint64_t))(v65 + 8))(v67, v64);
            (*(void (**)(char *, uint64_t))(v61 + 8))(v63, v79);
            v88(v49, v81);
            (*(void (**)(char *, uint64_t))(v38 + 8))(v85, v86);
            v69 = v92;
            id v39 = v93;
            goto LABEL_42;
          }
          (*(void (**)(char *, uint64_t))(v38 + 8))(v31, v37);
          swift_release();
        }
        v69 = v92;
LABEL_42:
        id v74 = objc_msgSend(v69, sel__hostedWindowScene);
        if (v74)
        {
          v75 = v74;
          type metadata accessor for UIStickerWrapper();
          swift_allocObject();
          id v39 = v39;
          uint64_t v76 = sub_2453F8A4C(v39, (char)v90);
          id v77 = sub_2453F98C4(1, v76, 0, 0, (void (*)(void))type metadata accessor for UIStickerWrapper, (unint64_t *)&unk_268ED68B0, (void (*)(uint64_t))type metadata accessor for UIStickerWrapper);
          swift_release();
          objc_msgSend(v75, sel_sendAction_, v77);
        }
        return;
      }
    }
    else
    {
      long long v100 = 0u;
      long long v101 = 0u;
    }
    sub_245203CD8((uint64_t)&v100, &qword_268ECEFA0);
    goto LABEL_27;
  }
  uint64_t v12 = v11;
  unint64_t v94 = 0xD000000000000039;
  unint64_t v95 = 0x800000024541DF20;
  sub_2454007C8();
  if (*(void *)(v12 + 16) && (unint64_t v13 = sub_2452A70DC((uint64_t)aBlock), (v14 & 1) != 0))
  {
    sub_245227DB8(*(void *)(v12 + 56) + 32 * v13, (uint64_t)&v100);
  }
  else
  {
    long long v100 = 0u;
    long long v101 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_2452AACA4((uint64_t)aBlock);
  if (!*((void *)&v101 + 1)) {
    goto LABEL_16;
  }
  sub_245203D98(0, (unint64_t *)&qword_268ED39E0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_17;
  }
  id v90 = (id)aBlock[0];
  id v15 = objc_msgSend(v1, sel_view);
  if (!v15)
  {
    __break(1u);
    return;
  }
  uint64_t v16 = v15;
  id v17 = objc_msgSend(v15, sel_window);

  id v18 = objc_msgSend(v17, sel_windowScene);
  if (v18)
  {
    id v19 = v90;
    id v20 = v18;
    char v21 = sub_245400448();

    if (v21)
    {

      id v10 = v93;
      goto LABEL_17;
    }
  }
  if (qword_268ECF500 != -1) {
    swift_once();
  }
  uint64_t v70 = sub_2453FDBB8();
  __swift_project_value_buffer(v70, (uint64_t)qword_268ED6740);
  v71 = sub_2453FDB98();
  os_log_type_t v72 = sub_2454000F8();
  if (os_log_type_enabled(v71, v72))
  {
    v73 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v73 = 0;
    _os_log_impl(&dword_2451E4000, v71, v72, "Ignoring sticker insertion from a different scene", v73, 2u);
    MEMORY[0x2456A0410](v73, -1, -1);
  }
  else
  {
  }
}

void sub_2453F7678(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x2456A0530](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = (void *)sub_2453FFB08();
    id v5 = objc_msgSend(self, sel_defaultCenter);
    objc_msgSend(v5, sel_postNotificationName_object_userInfo_, v4, 0, 0);
  }
}

void sub_2453F774C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2453FCCB8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEC40);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FC8F8();
  if (!v32[3])
  {
    sub_245203CD8((uint64_t)v32, &qword_268ECEFA0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
    goto LABEL_8;
  }
  int v9 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v8, v9 ^ 1u, 1, v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
LABEL_8:
    sub_245203CD8((uint64_t)v8, (uint64_t *)&unk_268ECEC40);
    return;
  }
  id v10 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
  v10((char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v8, v2);
  uint64_t v11 = sub_2453FC908();
  if (!v11)
  {
    long long v33 = 0u;
    long long v34 = 0u;
LABEL_15:
    sub_245203CD8((uint64_t)&v33, &qword_268ECEFA0);
    goto LABEL_16;
  }
  uint64_t v12 = v11;
  v31[1] = 0xD00000000000003CLL;
  v31[2] = 0x800000024541DE90;
  sub_2454007C8();
  if (*(void *)(v12 + 16) && (unint64_t v13 = sub_2452A70DC((uint64_t)v32), (v14 & 1) != 0))
  {
    sub_245227DB8(*(void *)(v12 + 56) + 32 * v13, (uint64_t)&v33);
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_2452AACA4((uint64_t)v32);
  if (!*((void *)&v34 + 1)) {
    goto LABEL_15;
  }
  sub_245203D98(0, &qword_268ED5268);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_16:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return;
  }
  id v15 = v32[0];
  objc_msgSend(v32[0], sel_CGRectValue);
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  id v24 = objc_msgSend(v1, sel__hostedWindowScene);
  if (v24)
  {
    char v25 = v24;
    __n128 v26 = MEMORY[0x270FA5388](v24);
    uint64_t v27 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t, __n128))(v3 + 16))(v27, v5, v2, v26);
    type metadata accessor for EditSticker(0);
    uint64_t v28 = swift_allocObject();
    v10((char *)(v28 + OBJC_IVAR____TtC10StickerKit11EditSticker_stickerIdentifier), v27, v2);
    uint64_t v29 = (void *)(v28 + OBJC_IVAR____TtC10StickerKit11EditSticker_sourceRect);
    *uint64_t v29 = v17;
    v29[1] = v19;
    v29[2] = v21;
    v29[3] = v23;
    id v30 = sub_2453F98C4(2, v28, 0, 1, (void (*)(void))type metadata accessor for EditSticker, (unint64_t *)&unk_268ED68A0, (void (*)(uint64_t))type metadata accessor for EditSticker);
    swift_release();
    objc_msgSend(v25, sel_sendAction_, v30);

    goto LABEL_16;
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))((char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
}

uint64_t sub_2453F7D0C()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEC40);
  uint64_t v3 = *(void *)(*(void *)(v2 - 8) + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FC8F8();
  if (v23)
  {
    uint64_t v5 = sub_2453FCCB8();
    int v6 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))((char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v6 ^ 1u, 1, v5);
  }
  else
  {
    sub_245203CD8((uint64_t)v22, &qword_268ECEFA0);
    uint64_t v7 = sub_2453FCCB8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))((char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v7);
  }
  sub_2453FC8F8();
  if (v23)
  {
    int v8 = swift_dynamicCast();
    if (v8) {
      uint64_t v9 = v21[0];
    }
    else {
      uint64_t v9 = 0;
    }
    if (v8) {
      uint64_t v10 = v21[1];
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    sub_245203CD8((uint64_t)v22, &qword_268ECEFA0);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(v1, sel__hostedWindowScene);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_2453FCCB8();
    uint64_t v14 = *(void *)(v13 - 8);
    MEMORY[0x270FA5388](v13);
    uint64_t v16 = (char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    MEMORY[0x270FA5388](v17);
    uint64_t v18 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_245212DC4((uint64_t)v4, (uint64_t)v18);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v18, 1, v13) == 1)
    {
      sub_245203CD8((uint64_t)v18, (uint64_t *)&unk_268ECEC40);
      swift_bridgeObjectRetain();
      id v19 = sub_2453FA2C4(4, v9, v10, 0, 0);
      swift_bridgeObjectRelease_n();
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v18, v13);
      id v19 = sub_2453F9F00(4, (uint64_t)v16, 0, 0);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v12, sel_sendAction_, v19);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return sub_245203CD8((uint64_t)v4, (uint64_t *)&unk_268ECEC40);
}

void sub_2453F80AC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2453FC908();
  if (!v2)
  {
    long long v12 = 0u;
    long long v13 = 0u;
LABEL_10:
    sub_245203CD8((uint64_t)&v12, &qword_268ECEFA0);
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  uint64_t v3 = v2;
  sub_2454007C8();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_2452A70DC((uint64_t)v11), (v5 & 1) != 0))
  {
    sub_245227DB8(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v12);
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_2452AACA4((uint64_t)v11);
  if (!*((void *)&v13 + 1)) {
    goto LABEL_10;
  }
  if (!swift_dynamicCast()) {
    return;
  }
  uint64_t v7 = v11[0];
  uint64_t v6 = v11[1];
LABEL_11:
  id v8 = objc_msgSend(v1, sel__hostedWindowScene);
  if (v8)
  {
    uint64_t v9 = v8;
    swift_bridgeObjectRetain();
    id v10 = sub_2453FA2C4(5, v7, v6, 0, 0);
    swift_bridgeObjectRelease_n();
    objc_msgSend(v9, sel_sendAction_, v10);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void sub_2453F8250()
{
  sub_2453FC8F8();
  if (v7)
  {
    type metadata accessor for StickerView();
    if (!swift_dynamicCast()) {
      return;
    }
    uint64_t v1 = v5;
  }
  else
  {
    sub_245203CD8((uint64_t)v6, &qword_268ECEFA0);
    uint64_t v1 = 0;
  }
  id v2 = objc_msgSend(v0, sel__hostedWindowScene);
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = sub_2453F9C0C(7, 1, 0, 0);
    objc_msgSend(v3, sel_sendAction_, v4);
  }
}

uint64_t sub_2453F834C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v6 = sub_2453FC918();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FC8D8();
  id v10 = a1;
  a4(v9);

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

id LocalEmojiAndStickerCollectionViewController.__deallocating_deinit()
{
  uint64_t v1 = v0;
  if (qword_268ECF500 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2453FDBB8();
  __swift_project_value_buffer(v2, (uint64_t)qword_268ED6740);
  uint64_t v3 = sub_2453FDB98();
  os_log_type_t v4 = sub_2454000C8();
  if (os_log_type_enabled(v3, v4))
  {
    char v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_2451E4000, v3, v4, "deinit", v5, 2u);
    MEMORY[0x2456A0410](v5, -1, -1);
  }

  id v6 = objc_msgSend(self, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_, v1);

  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for LocalEmojiAndStickerCollectionViewController(0);
  return objc_msgSendSuper2(&v8, sel_dealloc);
}

id LocalEmojiAndStickerCollectionViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  os_log_type_t v4 = v3;
  if (a2)
  {
    id v6 = (void *)sub_2453FFB08();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id LocalEmojiAndStickerCollectionViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_uiEmojiAndStickerCollectionViewController] = 0;
  v3[OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_disableInsets] = 0;
  *(void *)&v3[OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_configuration] = 0;
  *(void *)&v3[OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_searchTask] = 0;
  *(void *)&v3[OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController____lazy_storage___dataSource] = 0;
  sub_245203D98(0, &qword_268ED67A0);
  sub_245400188();
  if (a2)
  {
    id v6 = (void *)sub_2453FFB08();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for LocalEmojiAndStickerCollectionViewController(0);
  id v7 = objc_msgSendSuper2(&v9, sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id LocalEmojiAndStickerCollectionViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id LocalEmojiAndStickerCollectionViewController.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_uiEmojiAndStickerCollectionViewController] = 0;
  v1[OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_disableInsets] = 0;
  *(void *)&v1[OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_configuration] = 0;
  *(void *)&v1[OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_searchTask] = 0;
  *(void *)&v1[OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController____lazy_storage___dataSource] = 0;
  sub_245203D98(0, &qword_268ED67A0);
  sub_245400188();
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for LocalEmojiAndStickerCollectionViewController(0);
  id v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

uint64_t sub_2453F8A4C(void *a1, char a2)
{
  uint64_t v3 = v2;
  v22[1] = *(id *)MEMORY[0x263EF8340];
  *(unsigned char *)(v2 + 32) = a2;
  v22[0] = 0;
  id v5 = objc_msgSend(self, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a1, 1, v22);
  id v6 = v22[0];
  if (v5)
  {
    uint64_t v7 = sub_2453FCBE8();
    unint64_t v9 = v8;
  }
  else
  {
    id v10 = v6;
    id v11 = (void *)sub_2453FCAC8();

    swift_willThrow();
    if (qword_268ECF500 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_2453FDBB8();
    __swift_project_value_buffer(v12, (uint64_t)qword_268ED6740);
    id v13 = v11;
    id v14 = v11;
    uint64_t v15 = sub_2453FDB98();
    os_log_type_t v16 = sub_2454000D8();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      v22[0] = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      swift_getErrorValue();
      uint64_t v19 = sub_245400C58();
      sub_245227298(v19, v20, (uint64_t *)v22);
      sub_2454005E8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2451E4000, v15, v16, "Failed to encode sticker: %s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2456A0410](v18, -1, -1);
      MEMORY[0x2456A0410](v17, -1, -1);
    }
    else
    {
    }
    uint64_t v7 = 0;
    unint64_t v9 = 0xF000000000000000;
  }
  *(void *)(v3 + 16) = v7;
  *(void *)(v3 + 24) = v9;
  return v3;
}

uint64_t sub_2453F8CEC()
{
  uint64_t v1 = 0;
  unint64_t v2 = *(void *)(v0 + 24);
  if (v2 >> 60 != 15)
  {
    uint64_t v3 = *(void *)(v0 + 16);
    sub_245203D98(0, &qword_268ED6880);
    sub_245203D98(0, &qword_268ED6888);
    sub_24520E49C(v3, v2);
    uint64_t v1 = sub_2454001D8();
    sub_24520E4F4(v3, v2);
  }
  return v1;
}

uint64_t sub_2453F8F74()
{
  if (*v0) {
    return 0x7373696D736964;
  }
  else {
    return 1635017060;
  }
}

uint64_t sub_2453F8FA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2453FC4B8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2453F8FD0(uint64_t a1)
{
  unint64_t v2 = sub_2453FBDA4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2453F900C(uint64_t a1)
{
  unint64_t v2 = sub_2453FBDA4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2453F9048()
{
  sub_24520E4F4(*(void *)(v0 + 16), *(void *)(v0 + 24));

  return swift_deallocClassInstance();
}

uint64_t sub_2453F9080(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED6870);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2453FBDA4();
  sub_245400D18();
  long long v11 = *(_OWORD *)(v3 + 16);
  v10[15] = 0;
  sub_2453FBE40();
  sub_245400AE8();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_245400B08();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_2453F91F8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ED6858);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2453FBDA4();
  sub_245400D08();
  if (v2)
  {
    type metadata accessor for UIStickerWrapper();
    swift_deallocPartialClassInstance();
  }
  else
  {
    char v12 = 0;
    sub_2453FBDF8();
    sub_245400A88();
    *(_OWORD *)(v1 + 16) = v11;
    LOBYTE(v11) = 1;
    char v10 = sub_245400AA8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(unsigned char *)(v3 + 32) = v10 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t sub_2453F93FC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for UIStickerWrapper();
  swift_allocObject();
  uint64_t result = sub_2453F91F8(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_2453F945C(void *a1)
{
  return sub_2453F9080(a1);
}

uint64_t sub_2453F9480@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_245400168();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2453F9504(void **a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v2;
  id v5 = v3;
  return sub_245400178();
}

id sub_2453F957C(uint64_t a1, uint64_t a2, char a3, char a4)
{
  v20[5] = a2;
  id v6 = objc_allocWithZone(MEMORY[0x263F29C78]);
  swift_retain();
  id v7 = objc_msgSend(v6, sel_init);
  if (a3)
  {
    uint64_t v8 = sub_2453FCA28();
    swift_allocObject();
    uint64_t v9 = sub_2453FCA18();
    char v10 = (unint64_t *)&unk_268ED1870;
    long long v11 = (void (*)(uint64_t))MEMORY[0x270FA8870];
  }
  else
  {
    uint64_t v8 = sub_2453FC818();
    swift_allocObject();
    uint64_t v9 = sub_2453FC808();
    char v10 = (unint64_t *)&unk_268ED1880;
    long long v11 = (void (*)(uint64_t))MEMORY[0x270FA7E18];
  }
  v20[3] = v8;
  v20[4] = sub_2453FBE88(v10, 255, v11);
  v20[0] = v9;
  __swift_project_boxed_opaque_existential_1(v20, v8);
  type metadata accessor for EmojiSelection();
  sub_2453FBE88(&qword_268ED6988, v12, (void (*)(uint64_t))type metadata accessor for EmojiSelection);
  sub_2453FDF48();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  id v13 = (void *)sub_2453FCBC8();
  objc_msgSend(v7, sel_setObject_forSetting_, v13, 1);

  if (a4)
  {
    id v14 = objc_msgSend(self, sel__synchronizedDrawingFence);
    objc_msgSend(v7, sel_setObject_forSetting_, v14, 2);
    sub_24520E508(v18, v19);
  }
  else
  {
    sub_24520E508(v18, v19);
  }
  uint64_t v15 = (void *)sub_2453FFFC8();
  objc_msgSend(v7, sel_setObject_forSetting_, v15, 0);

  type metadata accessor for EmojiAndStickerClientToHostAction();
  id v16 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInfo_responder_, v7, 0);

  swift_release();
  return v16;
}

id sub_2453F98C4(uint64_t a1, uint64_t a2, char a3, char a4, void (*a5)(void), unint64_t *a6, void (*a7)(uint64_t))
{
  v25[5] = a2;
  id v12 = objc_allocWithZone(MEMORY[0x263F29C78]);
  swift_retain();
  id v13 = objc_msgSend(v12, sel_init);
  if (a3)
  {
    uint64_t v14 = sub_2453FCA28();
    swift_allocObject();
    uint64_t v15 = sub_2453FCA18();
    id v16 = (unint64_t *)&unk_268ED1870;
    uint64_t v17 = (void (*)(uint64_t))MEMORY[0x270FA8870];
  }
  else
  {
    uint64_t v14 = sub_2453FC818();
    swift_allocObject();
    uint64_t v15 = sub_2453FC808();
    id v16 = (unint64_t *)&unk_268ED1880;
    uint64_t v17 = (void (*)(uint64_t))MEMORY[0x270FA7E18];
  }
  v25[3] = v14;
  v25[4] = sub_2453FBE88(v16, 255, v17);
  v25[0] = v15;
  __swift_project_boxed_opaque_existential_1(v25, v14);
  a5(0);
  sub_2453FBE88(a6, 255, a7);
  sub_2453FDF48();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  uint64_t v18 = (void *)sub_2453FCBC8();
  objc_msgSend(v13, sel_setObject_forSetting_, v18, 1);

  if (a4)
  {
    id v19 = objc_msgSend(self, sel__synchronizedDrawingFence);
    objc_msgSend(v13, sel_setObject_forSetting_, v19, 2);
    sub_24520E508(v23, v24);
  }
  else
  {
    sub_24520E508(v23, v24);
  }
  unint64_t v20 = (void *)sub_2453FFFC8();
  objc_msgSend(v13, sel_setObject_forSetting_, v20, 0);

  type metadata accessor for EmojiAndStickerClientToHostAction();
  id v21 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInfo_responder_, v13, 0);

  swift_release();
  return v21;
}

id sub_2453F9C0C(uint64_t a1, char a2, char a3, char a4)
{
  char v19 = a2;
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C78]), sel_init);
  if (a3)
  {
    uint64_t v7 = sub_2453FCA28();
    swift_allocObject();
    uint64_t v8 = sub_2453FCA18();
    uint64_t v9 = (unint64_t *)&unk_268ED1870;
    char v10 = (void (*)(uint64_t))MEMORY[0x270FA8870];
  }
  else
  {
    uint64_t v7 = sub_2453FC818();
    swift_allocObject();
    uint64_t v8 = sub_2453FC808();
    uint64_t v9 = (unint64_t *)&unk_268ED1880;
    char v10 = (void (*)(uint64_t))MEMORY[0x270FA7E18];
  }
  v18[3] = v7;
  v18[4] = sub_2453FBE88(v9, 255, v10);
  v18[0] = v8;
  __swift_project_boxed_opaque_existential_1(v18, v7);
  sub_2453FDF48();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  long long v11 = (void *)sub_2453FCBC8();
  objc_msgSend(v6, sel_setObject_forSetting_, v11, 1);

  if (a4)
  {
    id v12 = objc_msgSend(self, sel__synchronizedDrawingFence);
    objc_msgSend(v6, sel_setObject_forSetting_, v12, 2);
    sub_24520E508(v16, v17);
  }
  else
  {
    sub_24520E508(v16, v17);
  }
  id v13 = (void *)sub_2453FFFC8();
  objc_msgSend(v6, sel_setObject_forSetting_, v13, 0);

  type metadata accessor for EmojiAndStickerClientToHostAction();
  id v14 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInfo_responder_, v6, 0);

  return v14;
}

id sub_2453F9F00(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v7 = sub_2453FCCB8();
  uint64_t v8 = *(void *)(v7 - 8);
  __n128 v9 = MEMORY[0x270FA5388](v7);
  long long v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v8 + 16))(v11, a2, v7, v9);
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C78]), sel_init);
  if (a3)
  {
    uint64_t v13 = sub_2453FCA28();
    swift_allocObject();
    uint64_t v14 = sub_2453FCA18();
    uint64_t v15 = (unint64_t *)&unk_268ED1870;
    uint64_t v16 = (void (*)(uint64_t))MEMORY[0x270FA8870];
  }
  else
  {
    uint64_t v13 = sub_2453FC818();
    swift_allocObject();
    uint64_t v14 = sub_2453FC808();
    uint64_t v15 = (unint64_t *)&unk_268ED1880;
    uint64_t v16 = (void (*)(uint64_t))MEMORY[0x270FA7E18];
  }
  uint64_t v17 = sub_2453FBE88(v15, 255, v16);
  v26[3] = v13;
  v26[4] = v17;
  v26[0] = v14;
  __swift_project_boxed_opaque_existential_1(v26, v13);
  sub_2453FBF28((unint64_t *)&unk_268ED6890, MEMORY[0x270FA9510]);
  sub_2453FDF48();
  uint64_t v18 = v25[1];
  unint64_t v19 = v25[2];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  unint64_t v20 = (void *)sub_2453FCBC8();
  objc_msgSend(v12, sel_setObject_forSetting_, v20, 1);

  if (a4)
  {
    id v21 = objc_msgSend(self, sel__synchronizedDrawingFence);
    objc_msgSend(v12, sel_setObject_forSetting_, v21, 2);
    sub_24520E508(v18, v19);
  }
  else
  {
    sub_24520E508(v18, v19);
  }
  uint64_t v22 = (void *)sub_2453FFFC8();
  objc_msgSend(v12, sel_setObject_forSetting_, v22, 0);

  type metadata accessor for EmojiAndStickerClientToHostAction();
  id v23 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInfo_responder_, v12, 0);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v23;
}

id sub_2453FA2C4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  v20[5] = a2;
  void v20[6] = a3;
  id v7 = objc_allocWithZone(MEMORY[0x263F29C78]);
  swift_bridgeObjectRetain();
  id v8 = objc_msgSend(v7, sel_init);
  if (a4)
  {
    uint64_t v9 = sub_2453FCA28();
    swift_allocObject();
    uint64_t v10 = sub_2453FCA18();
    long long v11 = (unint64_t *)&unk_268ED1870;
    id v12 = (void (*)(uint64_t))MEMORY[0x270FA8870];
  }
  else
  {
    uint64_t v9 = sub_2453FC818();
    swift_allocObject();
    uint64_t v10 = sub_2453FC808();
    long long v11 = (unint64_t *)&unk_268ED1880;
    id v12 = (void (*)(uint64_t))MEMORY[0x270FA7E18];
  }
  v20[3] = v9;
  v20[4] = sub_2453FBE88(v11, 255, v12);
  v20[0] = v10;
  __swift_project_boxed_opaque_existential_1(v20, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEDE0);
  sub_2453FC018((unint64_t *)&qword_268ED1A30, &qword_268ECEDE0);
  sub_2453FDF48();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  uint64_t v13 = (void *)sub_2453FCBC8();
  objc_msgSend(v8, sel_setObject_forSetting_, v13, 1);

  if (a5)
  {
    id v14 = objc_msgSend(self, sel__synchronizedDrawingFence);
    objc_msgSend(v8, sel_setObject_forSetting_, v14, 2);
    sub_24520E508(v18, v19);
  }
  else
  {
    sub_24520E508(v18, v19);
  }
  uint64_t v15 = (void *)sub_2453FFFC8();
  objc_msgSend(v8, sel_setObject_forSetting_, v15, 0);

  type metadata accessor for EmojiAndStickerClientToHostAction();
  id v16 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInfo_responder_, v8, 0);

  swift_bridgeObjectRelease();
  return v16;
}

id sub_2453FA610(double a1, uint64_t a2, char a3, char a4)
{
  *(double *)&void v18[5] = a1;
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F29C78]), sel_init);
  if (a3)
  {
    uint64_t v7 = sub_2453FCA28();
    swift_allocObject();
    uint64_t v8 = sub_2453FCA18();
    uint64_t v9 = (unint64_t *)&unk_268ED1870;
    uint64_t v10 = (void (*)(uint64_t))MEMORY[0x270FA8870];
  }
  else
  {
    uint64_t v7 = sub_2453FC818();
    swift_allocObject();
    uint64_t v8 = sub_2453FC808();
    uint64_t v9 = (unint64_t *)&unk_268ED1880;
    uint64_t v10 = (void (*)(uint64_t))MEMORY[0x270FA7E18];
  }
  v18[3] = v7;
  v18[4] = sub_2453FBE88(v9, 255, v10);
  v18[0] = v8;
  __swift_project_boxed_opaque_existential_1(v18, v7);
  sub_2453961DC();
  sub_2453FDF48();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  long long v11 = (void *)sub_2453FCBC8();
  objc_msgSend(v6, sel_setObject_forSetting_, v11, 1);

  if (a4)
  {
    id v12 = objc_msgSend(self, sel__synchronizedDrawingFence);
    objc_msgSend(v6, sel_setObject_forSetting_, v12, 2);
    sub_24520E508(v16, v17);
  }
  else
  {
    sub_24520E508(v16, v17);
  }
  uint64_t v13 = (void *)sub_2453FFFC8();
  objc_msgSend(v6, sel_setObject_forSetting_, v13, 0);

  type metadata accessor for EmojiAndStickerClientToHostAction();
  id v14 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInfo_responder_, v6, 0);

  return v14;
}

uint64_t sub_2453FA908(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696A6F6D65 && a2 == 0xE500000000000000;
  if (v2 || (sub_245400BA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7373696D736964 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_245400BA8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2453FA9F4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x80000002454131A0 || (sub_245400BA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6552656372756F73 && a2 == 0xEA00000000007463)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_245400BA8();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

void sub_2453FAAF0()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED18B0);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268ECF500 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2453FDBB8();
  __swift_project_value_buffer(v5, (uint64_t)qword_268ED6740);
  char v6 = sub_2453FDB98();
  os_log_type_t v7 = sub_2454000C8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_2451E4000, v6, v7, "viewIsAppearing", v8, 2u);
    MEMORY[0x2456A0410](v8, -1, -1);
  }

  uint64_t v9 = OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_uiEmojiAndStickerCollectionViewController;
  if (!*(void *)&v1[OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_uiEmojiAndStickerCollectionViewController])
  {
    id v10 = objc_msgSend(v1, sel_view);
    if (v10)
    {
      long long v11 = v10;
      id v12 = objc_msgSend(v10, sel_window);

      if (v12)
      {
        id v13 = objc_msgSend(v12, sel_windowScene);

        if (v13)
        {
          id v14 = v13;
          sub_245400418();

          uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ED6990);
          uint64_t v16 = *(void *)(v15 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v4, 1, v15) == 1)
          {
            sub_245203CD8((uint64_t)v4, (uint64_t *)&unk_268ED18B0);
            uint64_t v17 = 0;
          }
          else
          {
            swift_getOpaqueTypeConformance2();
            sub_2452B01E8();
            uint64_t v17 = sub_2453FDDF8();
            (*(void (**)(char *, uint64_t))(v16 + 8))(v4, v15);
          }
          uint64_t v18 = (void **)&v1[OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_configuration];
          swift_beginAccess();
          unint64_t v19 = *v18;
          *uint64_t v18 = (void *)v17;
        }
      }
      unint64_t v20 = self;
      id v21 = (id *)&v1[OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_configuration];
      swift_beginAccess();
      id v22 = objc_msgSend(v20, sel_newInstanceWithConfiguration_, *v21);
      objc_msgSend(v22, sel_setDelegate_, v1);
      objc_msgSend(v1, sel_addChildViewController_, v22);
      id v23 = objc_msgSend(v22, sel_view);
      if (v23)
      {
        unint64_t v24 = v23;
        id v25 = objc_msgSend(self, sel_clearColor);
        objc_msgSend(v24, sel_setBackgroundColor_, v25);

        id v26 = objc_msgSend(v24, sel_layer);
        id v27 = objc_msgSend(self, sel_currentDevice);
        id v28 = objc_msgSend(v27, sel_userInterfaceIdiom);

        objc_msgSend(v26, sel_setHitTestsAsOpaque_, v28 == 0);
        id v29 = objc_msgSend(v1, sel_view);
        if (!v29)
        {
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
          goto LABEL_38;
        }
        id v30 = v29;
        id v77 = v21;
        objc_msgSend(v29, sel_addSubview_, v24);

        objc_msgSend(v24, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
        uint64_t v31 = &v1[OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_disableInsets];
        swift_beginAccess();
        double v32 = 0.0;
        double v33 = 0.0;
        double v34 = 0.0;
        double v35 = 0.0;
        if ((*v31 & 1) == 0)
        {
          objc_msgSend(self, sel_additionalInsets);
          double v32 = v36;
          double v33 = v37;
          double v34 = v38;
          double v35 = v39;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26B0D6180);
        uint64_t v40 = swift_allocObject();
        *(_OWORD *)(v40 + 16) = xmmword_24540A000;
        id v41 = objc_msgSend(v24, sel_topAnchor);
        id v42 = objc_msgSend(v1, sel_view);
        if (!v42) {
          goto LABEL_37;
        }
        uint64_t v43 = v42;
        id v44 = objc_msgSend(v42, sel_topAnchor);

        id v45 = objc_msgSend(v41, sel_constraintEqualToAnchor_constant_, v44, v32);
        *(void *)(v40 + 32) = v45;
        id v46 = objc_msgSend(v24, sel_bottomAnchor);
        id v47 = objc_msgSend(v1, sel_view);
        if (!v47)
        {
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
        uint64_t v48 = v47;
        uint64_t v76 = v9;
        id v49 = objc_msgSend(v47, sel_bottomAnchor);

        id v50 = objc_msgSend(v46, sel_constraintEqualToAnchor_constant_, v49, -v34);
        *(void *)(v40 + 40) = v50;
        id v51 = objc_msgSend(v24, sel_leftAnchor);
        id v52 = objc_msgSend(v1, sel_view);
        if (!v52)
        {
LABEL_39:
          __break(1u);
          goto LABEL_40;
        }
        uint64_t v53 = v52;
        id v54 = objc_msgSend(v52, sel_leftAnchor);

        id v55 = objc_msgSend(v51, sel_constraintEqualToAnchor_constant_, v54, v33);
        *(void *)(v40 + 48) = v55;
        id v56 = objc_msgSend(v24, sel_rightAnchor);
        id v57 = objc_msgSend(v1, (SEL)&selRef_commitSticker_withDragTarget_draggedSticker_);
        if (!v57)
        {
LABEL_40:
          __break(1u);
          return;
        }
        v58 = v57;
        uint64_t v59 = self;
        id v60 = objc_msgSend(v58, sel_rightAnchor);

        id v61 = objc_msgSend(v56, sel_constraintEqualToAnchor_constant_, v60, -v35);
        *(void *)(v40 + 56) = v61;
        uint64_t v78 = v40;
        sub_2453FFD38();
        sub_245203D98(0, (unint64_t *)&qword_268ECF590);
        uint64_t v62 = (void *)sub_2453FFCF8();
        swift_bridgeObjectRelease();
        objc_msgSend(v59, sel_activateConstraints_, v62);

        id v63 = v24;
        uint64_t v64 = (void *)sub_2453FFB08();
        objc_msgSend(v63, sel_setAccessibilityIdentifier_, v64);

        uint64_t v9 = v76;
        id v21 = v77;
      }
      objc_msgSend(v22, sel_didMoveToParentViewController_, v1);
      if (qword_268ECECB8 != -1) {
        swift_once();
      }
      uint64_t v65 = (uint64_t)*v21;
      id v66 = *v21;
      id v67 = objc_msgSend(v1, sel_view);
      if (v67)
      {
        v68 = v67;
        id v69 = objc_msgSend(v67, sel_window);

        if (v69)
        {
          id v70 = objc_msgSend(v69, sel_screen);

          objc_msgSend(v70, sel_scale);
          double v72 = v71;
        }
        else
        {
          double v72 = 1.0;
        }
        id v73 = objc_allocWithZone((Class)type metadata accessor for ImageGlyphViewConfiguration());
        id v74 = sub_2453E4498(v65, v72);

        sub_24536CAAC((uint64_t)v74);
        if (qword_268ECF428 != -1) {
          swift_once();
        }
        sub_24539C9F8(objc_msgSend(v22, sel_emojiKeyManager));
        swift_unknownObjectRelease();
        if (qword_268ECECF0 != -1) {
          swift_once();
        }
        qword_268EE2EF0 = (uint64_t)sub_2453AB524();
        swift_bridgeObjectRelease();
        sub_24524B748();
        sub_24539D400();
        v75 = *(void **)&v1[v9];
        *(void *)&v1[v9] = v22;

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_36;
  }
}

uint64_t sub_2453FB5CC()
{
  swift_unknownObjectWeakDestroy();

  return swift_deallocObject();
}

uint64_t sub_2453FB604()
{
  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2453FB64C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_245200928;
  return sub_2453F5BB4(a1, v4, v5, v7, v6);
}

uint64_t type metadata accessor for EmojiSelection()
{
  return self;
}

uint64_t type metadata accessor for LocalEmojiAndStickerCollectionViewController(uint64_t a1)
{
  return sub_245209434(a1, (uint64_t *)&unk_268ED6818);
}

uint64_t sub_2453FB750@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_disableInsets);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2453FB7A4(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_disableInsets);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

id sub_2453FB7F4@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_configuration);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;

  return v4;
}

uint64_t sub_2453FB85C()
{
  return type metadata accessor for EditSticker(0);
}

uint64_t type metadata accessor for EditSticker(uint64_t a1)
{
  return sub_245209434(a1, (uint64_t *)&unk_268ED67A8);
}

uint64_t sub_2453FB884()
{
  uint64_t result = sub_2453FCCB8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for EmojiAndStickerClientToHostAction()
{
  return self;
}

uint64_t sub_2453FB940()
{
  return type metadata accessor for LocalEmojiAndStickerCollectionViewController(0);
}

void sub_2453FB948()
{
  sub_2453FBC70();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for LocalEmojiAndStickerCollectionViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LocalEmojiAndStickerCollectionViewController);
}

uint64_t dispatch thunk of LocalEmojiAndStickerCollectionViewController.disableInsets.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of LocalEmojiAndStickerCollectionViewController.disableInsets.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of LocalEmojiAndStickerCollectionViewController.disableInsets.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of LocalEmojiAndStickerCollectionViewController.configuration.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of LocalEmojiAndStickerCollectionViewController.configuration.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of LocalEmojiAndStickerCollectionViewController.configuration.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of LocalEmojiAndStickerCollectionViewController.search(query:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of LocalEmojiAndStickerCollectionViewController.handleKeyEvent(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of LocalEmojiAndStickerCollectionViewController.didSelectEmoji(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of LocalEmojiAndStickerCollectionViewController.didSelectEmoji(_:dismiss:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of LocalEmojiAndStickerCollectionViewController.didBeginDrag(withShouldDismiss:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

void sub_2453FBC70()
{
  if (!qword_268ED6828)
  {
    sub_245203D98(255, &qword_268ED67A0);
    unint64_t v0 = sub_245400198();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268ED6828);
    }
  }
}

uint64_t type metadata accessor for UIStickerWrapper()
{
  return self;
}

unint64_t sub_2453FBCFC()
{
  unint64_t result = qword_268ED6840;
  if (!qword_268ED6840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED6840);
  }
  return result;
}

unint64_t sub_2453FBD50()
{
  unint64_t result = qword_268ED6850;
  if (!qword_268ED6850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED6850);
  }
  return result;
}

unint64_t sub_2453FBDA4()
{
  unint64_t result = qword_268ED6860;
  if (!qword_268ED6860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED6860);
  }
  return result;
}

unint64_t sub_2453FBDF8()
{
  unint64_t result = qword_268ED6868;
  if (!qword_268ED6868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED6868);
  }
  return result;
}

unint64_t sub_2453FBE40()
{
  unint64_t result = qword_268ED6878;
  if (!qword_268ED6878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED6878);
  }
  return result;
}

uint64_t sub_2453FBE88(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_2453FBED0()
{
  sub_2453F7678(v0);
}

uint64_t block_copy_helper_45(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_45()
{
  return swift_release();
}

uint64_t sub_2453FBEF0()
{
  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_2453FBF28(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2453FBF70()
{
  unint64_t result = qword_268ED6928;
  if (!qword_268ED6928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED6928);
  }
  return result;
}

unint64_t sub_2453FBFC4()
{
  unint64_t result = qword_268ED6950;
  if (!qword_268ED6950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED6950);
  }
  return result;
}

uint64_t sub_2453FC018(unint64_t *a1, uint64_t *a2)
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

ValueMetadata *type metadata accessor for UIStickerWrapper.CodingKeys()
{
  return &type metadata for UIStickerWrapper.CodingKeys;
}

ValueMetadata *type metadata accessor for EditSticker.CodingKeys()
{
  return &type metadata for EditSticker.CodingKeys;
}

unsigned char *_s10StickerKit16UIStickerWrapperC10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2453FC168);
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

ValueMetadata *type metadata accessor for EmojiSelection.CodingKeys()
{
  return &type metadata for EmojiSelection.CodingKeys;
}

unint64_t sub_2453FC1A4()
{
  unint64_t result = qword_268ED69A0;
  if (!qword_268ED69A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED69A0);
  }
  return result;
}

unint64_t sub_2453FC1FC()
{
  unint64_t result = qword_268ED69A8;
  if (!qword_268ED69A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED69A8);
  }
  return result;
}

unint64_t sub_2453FC254()
{
  unint64_t result = qword_268ED69B0;
  if (!qword_268ED69B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED69B0);
  }
  return result;
}

unint64_t sub_2453FC2AC()
{
  unint64_t result = qword_268ED69B8;
  if (!qword_268ED69B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED69B8);
  }
  return result;
}

unint64_t sub_2453FC304()
{
  unint64_t result = qword_268ED69C0;
  if (!qword_268ED69C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED69C0);
  }
  return result;
}

unint64_t sub_2453FC35C()
{
  unint64_t result = qword_268ED69C8;
  if (!qword_268ED69C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED69C8);
  }
  return result;
}

unint64_t sub_2453FC3B4()
{
  unint64_t result = qword_268ED69D0;
  if (!qword_268ED69D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED69D0);
  }
  return result;
}

unint64_t sub_2453FC40C()
{
  unint64_t result = qword_268ED69D8;
  if (!qword_268ED69D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED69D8);
  }
  return result;
}

unint64_t sub_2453FC464()
{
  unint64_t result = qword_268ED69E0;
  if (!qword_268ED69E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268ED69E0);
  }
  return result;
}

uint64_t sub_2453FC4B8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1635017060 && a2 == 0xE400000000000000;
  if (v2 || (sub_245400BA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7373696D736964 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_245400BA8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id sub_2453FC5C8()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_268ED69F0 = (uint64_t)result;
  return result;
}

uint64_t sub_2453FC620(uint64_t a1)
{
  return sub_2453FC70C(a1, qword_268EE3488);
}

uint64_t sub_2453FC64C(uint64_t a1)
{
  return sub_2453FC70C(a1, qword_268EE34A0);
}

uint64_t sub_2453FC674(uint64_t a1)
{
  return sub_2453FC70C(a1, qword_268EE34B8);
}

uint64_t sub_2453FC698(uint64_t a1)
{
  return sub_2453FC70C(a1, qword_268EE34D0);
}

uint64_t sub_2453FC6C4(uint64_t a1)
{
  return sub_2453FC70C(a1, qword_268EE34E8);
}

uint64_t sub_2453FC6E4(uint64_t a1)
{
  return sub_2453FC70C(a1, qword_268EE3500);
}

uint64_t sub_2453FC70C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2453FD9E8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_268ECF508 != -1) {
    swift_once();
  }
  id v4 = (id)qword_268ED69F0;
  return sub_2453FD9D8();
}

void __getLSPlugInKitProxyClass_block_invoke_cold_1()
{
}

uint64_t sub_2453FC7D8()
{
  return MEMORY[0x270EEDE08]();
}

uint64_t sub_2453FC7E8()
{
  return MEMORY[0x270EEDE20]();
}

uint64_t sub_2453FC7F8()
{
  return MEMORY[0x270EEDEF0]();
}

uint64_t sub_2453FC808()
{
  return MEMORY[0x270EEDF28]();
}

uint64_t sub_2453FC818()
{
  return MEMORY[0x270EEDF40]();
}

uint64_t sub_2453FC828()
{
  return MEMORY[0x270EEE0A8]();
}

uint64_t sub_2453FC838()
{
  return MEMORY[0x270EEE138]();
}

uint64_t sub_2453FC848()
{
  return MEMORY[0x270EEE178]();
}

uint64_t sub_2453FC858()
{
  return MEMORY[0x270EEE180]();
}

uint64_t sub_2453FC868()
{
  return MEMORY[0x270EEE1B0]();
}

uint64_t sub_2453FC878()
{
  return MEMORY[0x270EEE1C0]();
}

uint64_t sub_2453FC888()
{
  return MEMORY[0x270EEE1F8]();
}

uint64_t sub_2453FC898()
{
  return MEMORY[0x270EEE230]();
}

uint64_t sub_2453FC8A8()
{
  return MEMORY[0x270EEE240]();
}

uint64_t sub_2453FC8B8()
{
  return MEMORY[0x270EEE250]();
}

uint64_t sub_2453FC8C8()
{
  return MEMORY[0x270EEE368]();
}

uint64_t sub_2453FC8D8()
{
  return MEMORY[0x270EEE370]();
}

uint64_t sub_2453FC8E8()
{
  return MEMORY[0x270EEE380]();
}

uint64_t sub_2453FC8F8()
{
  return MEMORY[0x270EEE3A0]();
}

uint64_t sub_2453FC908()
{
  return MEMORY[0x270EEE3B0]();
}

uint64_t sub_2453FC918()
{
  return MEMORY[0x270EEE3C8]();
}

uint64_t sub_2453FC928()
{
  return MEMORY[0x270EEE3D8]();
}

uint64_t sub_2453FC938()
{
  return MEMORY[0x270EEE418]();
}

uint64_t sub_2453FC948()
{
  return MEMORY[0x270EEE498]();
}

uint64_t sub_2453FC958()
{
  return MEMORY[0x270EEE4B8]();
}

uint64_t sub_2453FC968()
{
  return MEMORY[0x270EEE528]();
}

uint64_t sub_2453FC978()
{
  return MEMORY[0x270EEE540]();
}

uint64_t sub_2453FC988()
{
  return MEMORY[0x270EEE5B0]();
}

uint64_t sub_2453FC998()
{
  return MEMORY[0x270EEE600]();
}

uint64_t sub_2453FC9A8()
{
  return MEMORY[0x270EEE608]();
}

uint64_t sub_2453FC9B8()
{
  return MEMORY[0x270F816B8]();
}

uint64_t sub_2453FC9C8()
{
  return MEMORY[0x270EEEEB8]();
}

uint64_t sub_2453FC9D8()
{
  return MEMORY[0x270EEF018]();
}

uint64_t sub_2453FC9E8()
{
  return MEMORY[0x270EEF078]();
}

uint64_t sub_2453FC9F8()
{
  return MEMORY[0x270EEF258]();
}

uint64_t sub_2453FCA08()
{
  return MEMORY[0x270EEF260]();
}

uint64_t sub_2453FCA18()
{
  return MEMORY[0x270EEF2B0]();
}

uint64_t sub_2453FCA28()
{
  return MEMORY[0x270EEF2C0]();
}

uint64_t sub_2453FCA38()
{
  return MEMORY[0x270EEF780]();
}

uint64_t sub_2453FCA48()
{
  return MEMORY[0x270EEF798]();
}

uint64_t sub_2453FCA58()
{
  return MEMORY[0x270EEF7A8]();
}

uint64_t sub_2453FCA68()
{
  return MEMORY[0x270EEF7B0]();
}

uint64_t sub_2453FCA78()
{
  return MEMORY[0x270EEF7D8]();
}

uint64_t sub_2453FCA88()
{
  return MEMORY[0x270EEF7F0]();
}

uint64_t sub_2453FCA98()
{
  return MEMORY[0x270EEF7F8]();
}

uint64_t sub_2453FCAA8()
{
  return MEMORY[0x270F816E0]();
}

uint64_t sub_2453FCAB8()
{
  return MEMORY[0x270EEF828]();
}

uint64_t sub_2453FCAC8()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_2453FCAD8()
{
  return MEMORY[0x270EEFC18]();
}

uint64_t sub_2453FCAE8()
{
  return MEMORY[0x270EEFC60]();
}

uint64_t sub_2453FCAF8()
{
  return MEMORY[0x270EEFCA8]();
}

uint64_t sub_2453FCB08()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_2453FCB18()
{
  return MEMORY[0x270EEFD40]();
}

uint64_t sub_2453FCB28()
{
  return MEMORY[0x270EEFDC8]();
}

uint64_t sub_2453FCB38()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_2453FCB48()
{
  return MEMORY[0x270EEFE70]();
}

uint64_t sub_2453FCB58()
{
  return MEMORY[0x270EEFE78]();
}

uint64_t sub_2453FCB68()
{
  return MEMORY[0x270EEFED0]();
}

uint64_t sub_2453FCB78()
{
  return MEMORY[0x270EEFF08]();
}

uint64_t sub_2453FCB88()
{
  return MEMORY[0x270EEFF10]();
}

uint64_t sub_2453FCB98()
{
  return MEMORY[0x270EEFF50]();
}

uint64_t sub_2453FCBA8()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_2453FCBB8()
{
  return MEMORY[0x270EEFFD0]();
}

uint64_t sub_2453FCBC8()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_2453FCBD8()
{
  return MEMORY[0x270EF0160]();
}

uint64_t sub_2453FCBE8()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_2453FCBF8()
{
  return MEMORY[0x270EF01C8]();
}

uint64_t sub_2453FCC08()
{
  return MEMORY[0x270EF01E8]();
}

uint64_t sub_2453FCC18()
{
  return MEMORY[0x270EF07D8]();
}

uint64_t sub_2453FCC28()
{
  return MEMORY[0x270EF0990]();
}

uint64_t sub_2453FCC38()
{
  return MEMORY[0x270EF0BC0]();
}

uint64_t sub_2453FCC48()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_2453FCC58()
{
  return MEMORY[0x270EF0C50]();
}

uint64_t sub_2453FCC68()
{
  return MEMORY[0x270EF0C60]();
}

uint64_t sub_2453FCC78()
{
  return MEMORY[0x270EF0C90]();
}

uint64_t sub_2453FCC88()
{
  return MEMORY[0x270EF0CA8]();
}

uint64_t sub_2453FCC98()
{
  return MEMORY[0x270EF0CC0]();
}

uint64_t sub_2453FCCA8()
{
  return MEMORY[0x270EF0D00]();
}

uint64_t sub_2453FCCB8()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_2453FCCC8()
{
  return MEMORY[0x270EF0D70]();
}

uint64_t sub_2453FCCD8()
{
  return MEMORY[0x270EF0DC0]();
}

uint64_t sub_2453FCCE8()
{
  return MEMORY[0x270EF0DD0]();
}

uint64_t sub_2453FCCF8()
{
  return MEMORY[0x270EF0EE8]();
}

uint64_t sub_2453FCD08()
{
  return MEMORY[0x270EF10B0]();
}

uint64_t sub_2453FCD18()
{
  return MEMORY[0x270EF1488]();
}

uint64_t sub_2453FCD28()
{
  return MEMORY[0x270EF14A8]();
}

uint64_t sub_2453FCD38()
{
  return MEMORY[0x270EF1500]();
}

uint64_t sub_2453FCD48()
{
  return MEMORY[0x270EF1548]();
}

uint64_t sub_2453FCD58()
{
  return MEMORY[0x270EF16E8]();
}

uint64_t sub_2453FCD68()
{
  return MEMORY[0x270EF1708]();
}

uint64_t sub_2453FCD78()
{
  return MEMORY[0x270F81708]();
}

uint64_t sub_2453FCD88()
{
  return MEMORY[0x270F81720]();
}

uint64_t sub_2453FCD98()
{
  return MEMORY[0x270F81730]();
}

uint64_t sub_2453FCDA8()
{
  return MEMORY[0x270F81738]();
}

uint64_t sub_2453FCDB8()
{
  return MEMORY[0x270EF1710]();
}

uint64_t sub_2453FCDC8()
{
  return MEMORY[0x270EF1740]();
}

uint64_t sub_2453FCDD8()
{
  return MEMORY[0x270FA1160]();
}

uint64_t sub_2453FCDE8()
{
  return MEMORY[0x270F77518]();
}

uint64_t sub_2453FCDF8()
{
  return MEMORY[0x270FA11B8]();
}

uint64_t sub_2453FCE08()
{
  return MEMORY[0x270FA1200]();
}

uint64_t sub_2453FCE18()
{
  return MEMORY[0x270FA1210]();
}

uint64_t sub_2453FCE28()
{
  return MEMORY[0x270FA1218]();
}

uint64_t sub_2453FCE38()
{
  return MEMORY[0x270FA1230]();
}

uint64_t sub_2453FCE48()
{
  return MEMORY[0x270FA1240]();
}

uint64_t sub_2453FCE58()
{
  return MEMORY[0x270FA1248]();
}

uint64_t sub_2453FCE68()
{
  return MEMORY[0x270F9C7E8]();
}

uint64_t sub_2453FCE78()
{
  return MEMORY[0x270F9C818]();
}

uint64_t sub_2453FCE88()
{
  return MEMORY[0x270F9C820]();
}

uint64_t sub_2453FCE98()
{
  return MEMORY[0x270EE5800]();
}

uint64_t sub_2453FCEA8()
{
  return MEMORY[0x270EF17A8]();
}

uint64_t sub_2453FCEB8()
{
  return MEMORY[0x270EF17C0]();
}

uint64_t sub_2453FCEC8()
{
  return MEMORY[0x270EF17C8]();
}

uint64_t sub_2453FCED8()
{
  return MEMORY[0x270EF17D8]();
}

uint64_t sub_2453FCEE8()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_2453FCEF8()
{
  return MEMORY[0x270FA06B0]();
}

uint64_t sub_2453FCF08()
{
  return MEMORY[0x270FA06C0]();
}

uint64_t sub_2453FCF18()
{
  return MEMORY[0x270FA06D0]();
}

uint64_t sub_2453FCF28()
{
  return MEMORY[0x270F287E0]();
}

uint64_t sub_2453FCF38()
{
  return MEMORY[0x270F28808]();
}

uint64_t sub_2453FCF48()
{
  return MEMORY[0x270F28810]();
}

uint64_t sub_2453FCF58()
{
  return MEMORY[0x270F28850]();
}

uint64_t sub_2453FCF88()
{
  return MEMORY[0x270F288A8]();
}

uint64_t sub_2453FCF98()
{
  return MEMORY[0x270F28900]();
}

uint64_t sub_2453FCFA8()
{
  return MEMORY[0x270F28988]();
}

uint64_t sub_2453FCFB8()
{
  return MEMORY[0x270F289A8]();
}

uint64_t sub_2453FCFC8()
{
  return MEMORY[0x270F289D8]();
}

uint64_t sub_2453FCFD8()
{
  return MEMORY[0x270F289F8]();
}

uint64_t sub_2453FCFE8()
{
  return MEMORY[0x270F28A20]();
}

uint64_t sub_2453FCFF8()
{
  return MEMORY[0x270F28AD8]();
}

uint64_t sub_2453FD008()
{
  return MEMORY[0x270EF50A0]();
}

uint64_t sub_2453FD018()
{
  return MEMORY[0x270EF50A8]();
}

uint64_t sub_2453FD028()
{
  return MEMORY[0x270EF50B0]();
}

uint64_t sub_2453FD038()
{
  return MEMORY[0x270EF50B8]();
}

uint64_t sub_2453FD048()
{
  return MEMORY[0x270EF50C0]();
}

uint64_t sub_2453FD058()
{
  return MEMORY[0x270EF50C8]();
}

uint64_t sub_2453FD068()
{
  return MEMORY[0x270EF50D0]();
}

uint64_t sub_2453FD078()
{
  return MEMORY[0x270EF50D8]();
}

uint64_t sub_2453FD088()
{
  return MEMORY[0x270EF50E0]();
}

uint64_t sub_2453FD098()
{
  return MEMORY[0x270EF50E8]();
}

uint64_t sub_2453FD0A8()
{
  return MEMORY[0x270EF50F0]();
}

uint64_t sub_2453FD0B8()
{
  return MEMORY[0x270EF50F8]();
}

uint64_t sub_2453FD0C8()
{
  return MEMORY[0x270EF5100]();
}

uint64_t sub_2453FD0D8()
{
  return MEMORY[0x270EF5108]();
}

uint64_t sub_2453FD0E8()
{
  return MEMORY[0x270EF5110]();
}

uint64_t sub_2453FD0F8()
{
  return MEMORY[0x270EF5118]();
}

uint64_t sub_2453FD108()
{
  return MEMORY[0x270EF5120]();
}

uint64_t sub_2453FD118()
{
  return MEMORY[0x270EF5128]();
}

uint64_t sub_2453FD128()
{
  return MEMORY[0x270EF5130]();
}

uint64_t sub_2453FD138()
{
  return MEMORY[0x270EF5138]();
}

uint64_t sub_2453FD168()
{
  return MEMORY[0x270EF5150]();
}

uint64_t sub_2453FD178()
{
  return MEMORY[0x270EF5158]();
}

uint64_t sub_2453FD188()
{
  return MEMORY[0x270EF5160]();
}

uint64_t sub_2453FD198()
{
  return MEMORY[0x270EF5168]();
}

uint64_t sub_2453FD1A8()
{
  return MEMORY[0x270EF5170]();
}

uint64_t sub_2453FD1B8()
{
  return MEMORY[0x270EF5178]();
}

uint64_t sub_2453FD1C8()
{
  return MEMORY[0x270F2F860]();
}

uint64_t sub_2453FD1D8()
{
  return MEMORY[0x270F2F898]();
}

uint64_t sub_2453FD1E8()
{
  return MEMORY[0x270F2F8B0]();
}

uint64_t sub_2453FD1F8()
{
  return MEMORY[0x270F2F8C8]();
}

uint64_t sub_2453FD208()
{
  return MEMORY[0x270F2F900]();
}

uint64_t sub_2453FD218()
{
  return MEMORY[0x270F2F910]();
}

uint64_t sub_2453FD228()
{
  return MEMORY[0x270F2F948]();
}

uint64_t sub_2453FD238()
{
  return MEMORY[0x270F2F950]();
}

uint64_t sub_2453FD248()
{
  return MEMORY[0x270F2F990]();
}

uint64_t sub_2453FD258()
{
  return MEMORY[0x270F2F9A8]();
}

uint64_t sub_2453FD268()
{
  return MEMORY[0x270F2FA50]();
}

uint64_t sub_2453FD278()
{
  return MEMORY[0x270F2FA88]();
}

uint64_t sub_2453FD288()
{
  return MEMORY[0x270F2FA98]();
}

uint64_t sub_2453FD298()
{
  return MEMORY[0x270F2FCB0]();
}

uint64_t sub_2453FD2A8()
{
  return MEMORY[0x270F2FCB8]();
}

uint64_t sub_2453FD2B8()
{
  return MEMORY[0x270F2FCE0]();
}

uint64_t sub_2453FD2C8()
{
  return MEMORY[0x270F2FCE8]();
}

uint64_t sub_2453FD2D8()
{
  return MEMORY[0x270F2FD70]();
}

uint64_t sub_2453FD2E8()
{
  return MEMORY[0x270F2FD88]();
}

uint64_t sub_2453FD2F8()
{
  return MEMORY[0x270F2FD98]();
}

uint64_t sub_2453FD308()
{
  return MEMORY[0x270F2FDA0]();
}

uint64_t sub_2453FD318()
{
  return MEMORY[0x270F2FB90]();
}

uint64_t sub_2453FD328()
{
  return MEMORY[0x270F2FB98]();
}

uint64_t sub_2453FD348()
{
  return MEMORY[0x270F2FDD8]();
}

uint64_t sub_2453FD358()
{
  return MEMORY[0x270F83C60]();
}

uint64_t sub_2453FD368()
{
  return MEMORY[0x270F83C90]();
}

uint64_t sub_2453FD378()
{
  return MEMORY[0x270F83CA8]();
}

uint64_t sub_2453FD388()
{
  return MEMORY[0x270F83CB0]();
}

uint64_t sub_2453FD398()
{
  return MEMORY[0x270F83CB8]();
}

uint64_t sub_2453FD3A8()
{
  return MEMORY[0x270F83CC0]();
}

uint64_t sub_2453FD3B8()
{
  return MEMORY[0x270F83CC8]();
}

uint64_t sub_2453FD3C8()
{
  return MEMORY[0x270F83CD0]();
}

uint64_t sub_2453FD3D8()
{
  return MEMORY[0x270F83CD8]();
}

uint64_t sub_2453FD3E8()
{
  return MEMORY[0x270F83CE0]();
}

uint64_t sub_2453FD3F8()
{
  return MEMORY[0x270F83CE8]();
}

uint64_t sub_2453FD408()
{
  return MEMORY[0x270F83D00]();
}

uint64_t sub_2453FD418()
{
  return MEMORY[0x270F83D08]();
}

uint64_t sub_2453FD428()
{
  return MEMORY[0x270F83D10]();
}

uint64_t sub_2453FD438()
{
  return MEMORY[0x270F83D18]();
}

uint64_t sub_2453FD448()
{
  return MEMORY[0x270F83D20]();
}

uint64_t sub_2453FD458()
{
  return MEMORY[0x270F83D28]();
}

uint64_t sub_2453FD468()
{
  return MEMORY[0x270F83D38]();
}

uint64_t sub_2453FD478()
{
  return MEMORY[0x270F83D40]();
}

uint64_t sub_2453FD488()
{
  return MEMORY[0x270F83D48]();
}

uint64_t sub_2453FD498()
{
  return MEMORY[0x270F83D50]();
}

uint64_t sub_2453FD4A8()
{
  return MEMORY[0x270F83D70]();
}

uint64_t sub_2453FD4B8()
{
  return MEMORY[0x270F83D80]();
}

uint64_t sub_2453FD4C8()
{
  return MEMORY[0x270F83D88]();
}

uint64_t sub_2453FD4D8()
{
  return MEMORY[0x270F83D90]();
}

uint64_t sub_2453FD4E8()
{
  return MEMORY[0x270F83D98]();
}

uint64_t sub_2453FD4F8()
{
  return MEMORY[0x270F83DA0]();
}

uint64_t sub_2453FD508()
{
  return MEMORY[0x270F83DA8]();
}

uint64_t sub_2453FD518()
{
  return MEMORY[0x270F83DB0]();
}

uint64_t sub_2453FD528()
{
  return MEMORY[0x270F83F88]();
}

uint64_t sub_2453FD538()
{
  return MEMORY[0x270F83F90]();
}

uint64_t sub_2453FD568()
{
  return MEMORY[0x270F83FA8]();
}

uint64_t sub_2453FD578()
{
  return MEMORY[0x270F83FB0]();
}

uint64_t sub_2453FD588()
{
  return MEMORY[0x270F83FE0]();
}

uint64_t sub_2453FD598()
{
  return MEMORY[0x270F83FE8]();
}

uint64_t sub_2453FD5A8()
{
  return MEMORY[0x270F83FF0]();
}

uint64_t sub_2453FD5B8()
{
  return MEMORY[0x270F83FF8]();
}

uint64_t sub_2453FD5C8()
{
  return MEMORY[0x270F84000]();
}

uint64_t sub_2453FD5D8()
{
  return MEMORY[0x270F84008]();
}

uint64_t sub_2453FD5E8()
{
  return MEMORY[0x270F84010]();
}

uint64_t sub_2453FD5F8()
{
  return MEMORY[0x270F84018]();
}

uint64_t sub_2453FD608()
{
  return MEMORY[0x270F84020]();
}

uint64_t sub_2453FD618()
{
  return MEMORY[0x270F84028]();
}

uint64_t sub_2453FD648()
{
  return MEMORY[0x270F84040]();
}

uint64_t sub_2453FD658()
{
  return MEMORY[0x270F84048]();
}

uint64_t sub_2453FD668()
{
  return MEMORY[0x270F84050]();
}

uint64_t sub_2453FD678()
{
  return MEMORY[0x270F84060]();
}

uint64_t sub_2453FD688()
{
  return MEMORY[0x270F84068]();
}

uint64_t sub_2453FD698()
{
  return MEMORY[0x270F84070]();
}

uint64_t sub_2453FD6A8()
{
  return MEMORY[0x270F84078]();
}

uint64_t sub_2453FD6B8()
{
  return MEMORY[0x270F84080]();
}

uint64_t sub_2453FD6C8()
{
  return MEMORY[0x270F84088]();
}

uint64_t sub_2453FD6D8()
{
  return MEMORY[0x270F84090]();
}

uint64_t sub_2453FD6E8()
{
  return MEMORY[0x270F84098]();
}

uint64_t sub_2453FD6F8()
{
  return MEMORY[0x270F840A0]();
}

uint64_t sub_2453FD708()
{
  return MEMORY[0x270F840A8]();
}

uint64_t sub_2453FD718()
{
  return MEMORY[0x270F840B0]();
}

uint64_t sub_2453FD728()
{
  return MEMORY[0x270F840B8]();
}

uint64_t sub_2453FD738()
{
  return MEMORY[0x270F840C0]();
}

uint64_t sub_2453FD748()
{
  return MEMORY[0x270F840D0]();
}

uint64_t sub_2453FD758()
{
  return MEMORY[0x270F840D8]();
}

uint64_t sub_2453FD768()
{
  return MEMORY[0x270F840E0]();
}

uint64_t sub_2453FD778()
{
  return MEMORY[0x270F840E8]();
}

uint64_t sub_2453FD788()
{
  return MEMORY[0x270F840F0]();
}

uint64_t sub_2453FD798()
{
  return MEMORY[0x270F840F8]();
}

uint64_t sub_2453FD7A8()
{
  return MEMORY[0x270F84100]();
}

uint64_t sub_2453FD7C8()
{
  return MEMORY[0x270F84110]();
}

uint64_t sub_2453FD7D8()
{
  return MEMORY[0x270F84118]();
}

uint64_t sub_2453FD7E8()
{
  return MEMORY[0x270F84120]();
}

uint64_t sub_2453FD808()
{
  return MEMORY[0x270F84130]();
}

uint64_t sub_2453FD818()
{
  return MEMORY[0x270F84138]();
}

uint64_t sub_2453FD828()
{
  return MEMORY[0x270F84140]();
}

uint64_t sub_2453FD838()
{
  return MEMORY[0x270F84148]();
}

uint64_t sub_2453FD848()
{
  return MEMORY[0x270F84150]();
}

uint64_t sub_2453FD858()
{
  return MEMORY[0x270F84158]();
}

uint64_t sub_2453FD868()
{
  return MEMORY[0x270F84160]();
}

uint64_t sub_2453FD878()
{
  return MEMORY[0x270F84168]();
}

uint64_t sub_2453FD888()
{
  return MEMORY[0x270F84170]();
}

uint64_t sub_2453FD898()
{
  return MEMORY[0x270F84178]();
}

uint64_t sub_2453FD8A8()
{
  return MEMORY[0x270F84180]();
}

uint64_t sub_2453FD8B8()
{
  return MEMORY[0x270F84188]();
}

uint64_t sub_2453FD8C8()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_2453FD8D8()
{
  return MEMORY[0x270FA2A78]();
}

uint64_t sub_2453FD8E8()
{
  return MEMORY[0x270FA2AA0]();
}

uint64_t sub_2453FD8F8()
{
  return MEMORY[0x270F18140]();
}

uint64_t sub_2453FD908()
{
  return MEMORY[0x270F18150]();
}

uint64_t sub_2453FD918()
{
  return MEMORY[0x270F18158]();
}

uint64_t sub_2453FD928()
{
  return MEMORY[0x270F18160]();
}

uint64_t sub_2453FD938()
{
  return MEMORY[0x270F18168]();
}

uint64_t sub_2453FD948()
{
  return MEMORY[0x270F18170]();
}

uint64_t sub_2453FD958()
{
  return MEMORY[0x270F18180]();
}

uint64_t sub_2453FD968()
{
  return MEMORY[0x270F18188]();
}

uint64_t sub_2453FD978()
{
  return MEMORY[0x270F18190]();
}

uint64_t sub_2453FD988()
{
  return MEMORY[0x270F18198]();
}

uint64_t sub_2453FD998()
{
  return MEMORY[0x270F181A0]();
}

uint64_t sub_2453FD9A8()
{
  return MEMORY[0x270F181A8]();
}

uint64_t sub_2453FD9B8()
{
  return MEMORY[0x270F181B0]();
}

uint64_t sub_2453FD9D8()
{
  return MEMORY[0x270EEB1C8]();
}

uint64_t sub_2453FD9E8()
{
  return MEMORY[0x270EEB1E8]();
}

uint64_t sub_2453FD9F8()
{
  return MEMORY[0x270FA16A8]();
}

uint64_t sub_2453FDA08()
{
  return MEMORY[0x270FA1798]();
}

uint64_t sub_2453FDA18()
{
  return MEMORY[0x270FA17C0]();
}

uint64_t sub_2453FDA28()
{
  return MEMORY[0x270FA1808]();
}

uint64_t sub_2453FDA38()
{
  return MEMORY[0x270FA1828]();
}

uint64_t sub_2453FDA48()
{
  return MEMORY[0x270FA1860]();
}

uint64_t sub_2453FDA58()
{
  return MEMORY[0x270FA18E0]();
}

uint64_t sub_2453FDA68()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_2453FDA78()
{
  return MEMORY[0x270FA1948]();
}

uint64_t sub_2453FDA88()
{
  return MEMORY[0x270F2EDE0]();
}

uint64_t sub_2453FDA98()
{
  return MEMORY[0x270F2EDF0]();
}

uint64_t sub_2453FDAA8()
{
  return MEMORY[0x270F2EDF8]();
}

uint64_t sub_2453FDAB8()
{
  return MEMORY[0x270F5CFA8]();
}

uint64_t sub_2453FDAC8()
{
  return MEMORY[0x270F5CFB0]();
}

uint64_t sub_2453FDAD8()
{
  return MEMORY[0x270F5CFB8]();
}

uint64_t sub_2453FDAE8()
{
  return MEMORY[0x270F2F078]();
}

uint64_t sub_2453FDAF8()
{
  return MEMORY[0x270F2F080]();
}

uint64_t sub_2453FDB08()
{
  return MEMORY[0x270F2F088]();
}

uint64_t sub_2453FDB18()
{
  return MEMORY[0x270F2F130]();
}

uint64_t sub_2453FDB28()
{
  return MEMORY[0x270F2F140]();
}

uint64_t sub_2453FDB38()
{
  return MEMORY[0x270F2F150]();
}

uint64_t sub_2453FDB48()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_2453FDB58()
{
  return MEMORY[0x270FA2C90]();
}

uint64_t sub_2453FDB68()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_2453FDB78()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_2453FDB88()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_2453FDB98()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2453FDBA8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2453FDBB8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2453FDBC8()
{
  return MEMORY[0x270F81780]();
}

uint64_t sub_2453FDBD8()
{
  return MEMORY[0x270F81790]();
}

uint64_t sub_2453FDBE8()
{
  return MEMORY[0x270F817B8]();
}

uint64_t sub_2453FDBF8()
{
  return MEMORY[0x270F817C0]();
}

uint64_t sub_2453FDC08()
{
  return MEMORY[0x270F817C8]();
}

uint64_t sub_2453FDC18()
{
  return MEMORY[0x270F817E0]();
}

uint64_t sub_2453FDC28()
{
  return MEMORY[0x270F817F0]();
}

uint64_t sub_2453FDC38()
{
  return MEMORY[0x270F817F8]();
}

uint64_t sub_2453FDC48()
{
  return MEMORY[0x270F81818]();
}

uint64_t sub_2453FDC58()
{
  return MEMORY[0x270F81830]();
}

uint64_t sub_2453FDC68()
{
  return MEMORY[0x270F81848]();
}

uint64_t sub_2453FDC78()
{
  return MEMORY[0x270F81858]();
}

uint64_t sub_2453FDC88()
{
  return MEMORY[0x270F81860]();
}

uint64_t sub_2453FDC98()
{
  return MEMORY[0x270F81870]();
}

uint64_t sub_2453FDCA8()
{
  return MEMORY[0x270F81880]();
}

uint64_t sub_2453FDCB8()
{
  return MEMORY[0x270F81890]();
}

uint64_t sub_2453FDCC8()
{
  return MEMORY[0x270F818B8]();
}

uint64_t sub_2453FDCD8()
{
  return MEMORY[0x270F818C0]();
}

uint64_t sub_2453FDCE8()
{
  return MEMORY[0x270F818D0]();
}

uint64_t sub_2453FDCF8()
{
  return MEMORY[0x270F818D8]();
}

uint64_t sub_2453FDD08()
{
  return MEMORY[0x270F818F0]();
}

uint64_t sub_2453FDD18()
{
  return MEMORY[0x270F81900]();
}

uint64_t sub_2453FDD28()
{
  return MEMORY[0x270F81908]();
}

uint64_t sub_2453FDD38()
{
  return MEMORY[0x270F81920]();
}

uint64_t sub_2453FDD48()
{
  return MEMORY[0x270F81930]();
}

uint64_t sub_2453FDD58()
{
  return MEMORY[0x270F819D8]();
}

uint64_t sub_2453FDD68()
{
  return MEMORY[0x270F81A08]();
}

uint64_t sub_2453FDD78()
{
  return MEMORY[0x270F81AF8]();
}

uint64_t sub_2453FDD88()
{
  return MEMORY[0x270F81B10]();
}

uint64_t sub_2453FDD98()
{
  return MEMORY[0x270F81BB8]();
}

uint64_t sub_2453FDDA8()
{
  return MEMORY[0x270F81BC8]();
}

uint64_t sub_2453FDDB8()
{
  return MEMORY[0x270F81BD8]();
}

uint64_t sub_2453FDDC8()
{
  return MEMORY[0x270F81BE8]();
}

uint64_t sub_2453FDDD8()
{
  return MEMORY[0x270F81BF8]();
}

uint64_t sub_2453FDDE8()
{
  return MEMORY[0x270F81C18]();
}

uint64_t sub_2453FDDF8()
{
  return MEMORY[0x270F81C20]();
}

uint64_t sub_2453FDE08()
{
  return MEMORY[0x270F81C30]();
}

uint64_t sub_2453FDE18()
{
  return MEMORY[0x270F81EE8]();
}

uint64_t sub_2453FDE28()
{
  return MEMORY[0x270F81F58]();
}

uint64_t sub_2453FDE38()
{
  return MEMORY[0x270F81FA0]();
}

uint64_t sub_2453FDE48()
{
  return MEMORY[0x270F81FB8]();
}

uint64_t sub_2453FDE58()
{
  return MEMORY[0x270F81FF8]();
}

uint64_t sub_2453FDE68()
{
  return MEMORY[0x270F82008]();
}

uint64_t sub_2453FDE78()
{
  return MEMORY[0x270F82010]();
}

uint64_t sub_2453FDE88()
{
  return MEMORY[0x270F82030]();
}

uint64_t sub_2453FDE98()
{
  return MEMORY[0x270F82038]();
}

uint64_t sub_2453FDEA8()
{
  return MEMORY[0x270F82060]();
}

uint64_t sub_2453FDEB8()
{
  return MEMORY[0x270F82070]();
}

uint64_t sub_2453FDEC8()
{
  return MEMORY[0x270F82110]();
}

uint64_t sub_2453FDED8()
{
  return MEMORY[0x270F82278]();
}

uint64_t sub_2453FDEE8()
{
  return MEMORY[0x270F82290]();
}

uint64_t sub_2453FDEF8()
{
  return MEMORY[0x270F822C8]();
}

uint64_t sub_2453FDF08()
{
  return MEMORY[0x270F822E8]();
}

uint64_t sub_2453FDF18()
{
  return MEMORY[0x270F823E8]();
}

uint64_t sub_2453FDF28()
{
  return MEMORY[0x270F823F0]();
}

uint64_t sub_2453FDF38()
{
  return MEMORY[0x270EE3BF8]();
}

uint64_t sub_2453FDF48()
{
  return MEMORY[0x270EE3C00]();
}

uint64_t sub_2453FDF58()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_2453FDF68()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_2453FDF78()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_2453FDF88()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_2453FDF98()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_2453FDFA8()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_2453FDFB8()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_2453FDFC8()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_2453FDFD8()
{
  return MEMORY[0x270EE3EC0]();
}

uint64_t sub_2453FDFE8()
{
  return MEMORY[0x270EE3F18]();
}

uint64_t sub_2453FDFF8()
{
  return MEMORY[0x270EE3F90]();
}

uint64_t sub_2453FE008()
{
  return MEMORY[0x270EE3FD8]();
}

uint64_t sub_2453FE018()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_2453FE028()
{
  return MEMORY[0x270EE4018]();
}

uint64_t sub_2453FE038()
{
  return MEMORY[0x270EF7570]();
}

uint64_t sub_2453FE048()
{
  return MEMORY[0x270EF7578]();
}

uint64_t sub_2453FE058()
{
  return MEMORY[0x270EF7590]();
}

uint64_t sub_2453FE068()
{
  return MEMORY[0x270EF7598]();
}

uint64_t sub_2453FE078()
{
  return MEMORY[0x270EF75A0]();
}

uint64_t sub_2453FE088()
{
  return MEMORY[0x270EF75A8]();
}

uint64_t sub_2453FE098()
{
  return MEMORY[0x270EF77B0]();
}

uint64_t sub_2453FE0A8()
{
  return MEMORY[0x270EF77B8]();
}

uint64_t sub_2453FE0B8()
{
  return MEMORY[0x270EF77C0]();
}

uint64_t sub_2453FE0C8()
{
  return MEMORY[0x270EF77D0]();
}

uint64_t sub_2453FE0D8()
{
  return MEMORY[0x270EFEBD0]();
}

uint64_t sub_2453FE0E8()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_2453FE0F8()
{
  return MEMORY[0x270EFED38]();
}

uint64_t sub_2453FE108()
{
  return MEMORY[0x270EFED40]();
}

uint64_t sub_2453FE118()
{
  return MEMORY[0x270EFED68]();
}

uint64_t sub_2453FE128()
{
  return MEMORY[0x270EFEDF0]();
}

uint64_t sub_2453FE138()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_2453FE148()
{
  return MEMORY[0x270EFEEA0]();
}

uint64_t sub_2453FE158()
{
  return MEMORY[0x270EFEEA8]();
}

uint64_t sub_2453FE168()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_2453FE178()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_2453FE188()
{
  return MEMORY[0x270EFEF58]();
}

uint64_t sub_2453FE198()
{
  return MEMORY[0x270EFEFA0]();
}

uint64_t sub_2453FE1A8()
{
  return MEMORY[0x270EFEFB8]();
}

uint64_t sub_2453FE1B8()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_2453FE1C8()
{
  return MEMORY[0x270EFF008]();
}

uint64_t sub_2453FE1D8()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_2453FE1E8()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_2453FE1F8()
{
  return MEMORY[0x270EFF230]();
}

uint64_t sub_2453FE208()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_2453FE218()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_2453FE228()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_2453FE238()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_2453FE248()
{
  return MEMORY[0x270EFF638]();
}

uint64_t sub_2453FE258()
{
  return MEMORY[0x270EFF640]();
}

uint64_t sub_2453FE268()
{
  return MEMORY[0x270EFF648]();
}

uint64_t sub_2453FE278()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_2453FE288()
{
  return MEMORY[0x270EFF6E8]();
}

uint64_t sub_2453FE298()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_2453FE2A8()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_2453FE2B8()
{
  return MEMORY[0x270EFFA08]();
}

uint64_t sub_2453FE2C8()
{
  return MEMORY[0x270EFFA10]();
}

uint64_t sub_2453FE2D8()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_2453FE2E8()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_2453FE2F8()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_2453FE308()
{
  return MEMORY[0x270F00050]();
}

uint64_t sub_2453FE318()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_2453FE328()
{
  return MEMORY[0x270F000D0]();
}

uint64_t sub_2453FE338()
{
  return MEMORY[0x270F00138]();
}

uint64_t sub_2453FE348()
{
  return MEMORY[0x270F00170]();
}

uint64_t sub_2453FE358()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_2453FE368()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_2453FE378()
{
  return MEMORY[0x270F00240]();
}

uint64_t sub_2453FE388()
{
  return MEMORY[0x270F00248]();
}

uint64_t sub_2453FE398()
{
  return MEMORY[0x270F00268]();
}

uint64_t sub_2453FE3A8()
{
  return MEMORY[0x270F00270]();
}

uint64_t sub_2453FE3B8()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_2453FE3C8()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_2453FE3D8()
{
  return MEMORY[0x270F00588]();
}

uint64_t sub_2453FE3E8()
{
  return MEMORY[0x270F00590]();
}

uint64_t sub_2453FE3F8()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_2453FE408()
{
  return MEMORY[0x270F005F8]();
}

uint64_t sub_2453FE418()
{
  return MEMORY[0x270F00670]();
}

uint64_t sub_2453FE428()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_2453FE438()
{
  return MEMORY[0x270F00728]();
}

uint64_t sub_2453FE448()
{
  return MEMORY[0x270F00738]();
}

uint64_t sub_2453FE458()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_2453FE468()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_2453FE478()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_2453FE488()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_2453FE498()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_2453FE4A8()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_2453FE4B8()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_2453FE4C8()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_2453FE4D8()
{
  return MEMORY[0x270F00B98]();
}

uint64_t sub_2453FE4E8()
{
  return MEMORY[0x270F00BA0]();
}

uint64_t sub_2453FE4F8()
{
  return MEMORY[0x270F00C48]();
}

uint64_t sub_2453FE508()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_2453FE518()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_2453FE528()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_2453FE538()
{
  return MEMORY[0x270F00E40]();
}

uint64_t sub_2453FE548()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_2453FE558()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_2453FE568()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_2453FE578()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_2453FE588()
{
  return MEMORY[0x270F00FA0]();
}

uint64_t sub_2453FE598()
{
  return MEMORY[0x270F00FA8]();
}

uint64_t sub_2453FE5A8()
{
  return MEMORY[0x270F01040]();
}

uint64_t sub_2453FE5B8()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_2453FE5C8()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_2453FE5D8()
{
  return MEMORY[0x270F01198]();
}

uint64_t sub_2453FE5E8()
{
  return MEMORY[0x270F011A0]();
}

uint64_t sub_2453FE5F8()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_2453FE608()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_2453FE618()
{
  return MEMORY[0x270F013D0]();
}

uint64_t sub_2453FE628()
{
  return MEMORY[0x270F013E8]();
}

uint64_t sub_2453FE638()
{
  return MEMORY[0x270F01420]();
}

uint64_t sub_2453FE648()
{
  return MEMORY[0x270F01430]();
}

uint64_t sub_2453FE658()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_2453FE668()
{
  return MEMORY[0x270F01468]();
}

uint64_t sub_2453FE678()
{
  return MEMORY[0x270F01470]();
}

uint64_t sub_2453FE688()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_2453FE698()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_2453FE6A8()
{
  return MEMORY[0x270F01528]();
}

uint64_t sub_2453FE6B8()
{
  return MEMORY[0x270F015C0]();
}

uint64_t sub_2453FE6C8()
{
  return MEMORY[0x270F015C8]();
}

uint64_t sub_2453FE6D8()
{
  return MEMORY[0x270F01678]();
}

uint64_t sub_2453FE6E8()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_2453FE6F8()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_2453FE708()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_2453FE718()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_2453FE738()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_2453FE748()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_2453FE758()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_2453FE768()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_2453FE778()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_2453FE788()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_2453FE7A8()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_2453FE7B8()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_2453FE7C8()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_2453FE7D8()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_2453FE7E8()
{
  return MEMORY[0x270F018D8]();
}

uint64_t sub_2453FE7F8()
{
  return MEMORY[0x270F01B78]();
}

uint64_t sub_2453FE808()
{
  return MEMORY[0x270F01B98]();
}

uint64_t sub_2453FE818()
{
  return MEMORY[0x270F01BA0]();
}

uint64_t sub_2453FE828()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_2453FE838()
{
  return MEMORY[0x270F01CB0]();
}

uint64_t sub_2453FE848()
{
  return MEMORY[0x270F01D30]();
}

uint64_t sub_2453FE858()
{
  return MEMORY[0x270F01E28]();
}

uint64_t sub_2453FE868()
{
  return MEMORY[0x270F01F70]();
}

uint64_t sub_2453FE878()
{
  return MEMORY[0x270F01F98]();
}

uint64_t sub_2453FE888()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_2453FE898()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_2453FE8A8()
{
  return MEMORY[0x270F02100]();
}

uint64_t sub_2453FE8B8()
{
  return MEMORY[0x270F02120]();
}

uint64_t sub_2453FE8C8()
{
  return MEMORY[0x270F02128]();
}

uint64_t sub_2453FE8D8()
{
  return MEMORY[0x270F022F0]();
}

uint64_t sub_2453FE8E8()
{
  return MEMORY[0x270F02390]();
}

uint64_t sub_2453FE8F8()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_2453FE908()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_2453FE918()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_2453FE928()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_2453FE938()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_2453FE958()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_2453FE968()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_2453FE978()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_2453FE998()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_2453FE9A8()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_2453FE9B8()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_2453FE9C8()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_2453FE9D8()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_2453FE9E8()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_2453FE9F8()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2453FEA08()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_2453FEA18()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_2453FEA28()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_2453FEA38()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_2453FEA48()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_2453FEA58()
{
  return MEMORY[0x270F02AB8]();
}

uint64_t sub_2453FEA68()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_2453FEA78()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_2453FEA88()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_2453FEA98()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_2453FEAA8()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_2453FEAB8()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_2453FEAC8()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_2453FEAD8()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_2453FEAE8()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_2453FEAF8()
{
  return MEMORY[0x270F02CA0]();
}

uint64_t sub_2453FEB08()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_2453FEB18()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_2453FEB28()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_2453FEB38()
{
  return MEMORY[0x270F02D68]();
}

uint64_t sub_2453FEB48()
{
  return MEMORY[0x270F02D78]();
}

uint64_t sub_2453FEB58()
{
  return MEMORY[0x270F02F00]();
}

uint64_t sub_2453FEB68()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_2453FEB78()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_2453FEB88()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_2453FEB98()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_2453FEBA8()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_2453FEBB8()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2453FEBC8()
{
  return MEMORY[0x270EF5180]();
}

uint64_t sub_2453FEBD8()
{
  return MEMORY[0x270EF5188]();
}

uint64_t sub_2453FEBE8()
{
  return MEMORY[0x270EF5190]();
}

uint64_t sub_2453FEBF8()
{
  return MEMORY[0x270EF5198]();
}

uint64_t sub_2453FEC08()
{
  return MEMORY[0x270EF51A0]();
}

uint64_t sub_2453FEC18()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2453FEC28()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2453FEC38()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_2453FEC48()
{
  return MEMORY[0x270F03388]();
}

uint64_t sub_2453FEC58()
{
  return MEMORY[0x270F03400]();
}

uint64_t sub_2453FEC68()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_2453FEC78()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_2453FEC88()
{
  return MEMORY[0x270F035D0]();
}

uint64_t sub_2453FEC98()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_2453FECA8()
{
  return MEMORY[0x270F03688]();
}

uint64_t sub_2453FECB8()
{
  return MEMORY[0x270F036B0]();
}

uint64_t sub_2453FECC8()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2453FECD8()
{
  return MEMORY[0x270F03728]();
}

uint64_t sub_2453FECE8()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_2453FECF8()
{
  return MEMORY[0x270F037B8]();
}

uint64_t sub_2453FED08()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_2453FED18()
{
  return MEMORY[0x270F03A78]();
}

uint64_t sub_2453FED28()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_2453FED38()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_2453FED48()
{
  return MEMORY[0x270F03C68]();
}

uint64_t sub_2453FED58()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_2453FED68()
{
  return MEMORY[0x270F03DB8]();
}

uint64_t sub_2453FED78()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_2453FED88()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_2453FED98()
{
  return MEMORY[0x270F040A8]();
}

uint64_t sub_2453FEDA8()
{
  return MEMORY[0x270F040B0]();
}

uint64_t sub_2453FEDB8()
{
  return MEMORY[0x270F040D8]();
}

uint64_t sub_2453FEDC8()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_2453FEDD8()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_2453FEDE8()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_2453FEDF8()
{
  return MEMORY[0x270F041C0]();
}

uint64_t sub_2453FEE08()
{
  return MEMORY[0x270F041F8]();
}

uint64_t sub_2453FEE18()
{
  return MEMORY[0x270F042A8]();
}

uint64_t sub_2453FEE28()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_2453FEE38()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_2453FEE48()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_2453FEE58()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_2453FEE68()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_2453FEE78()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_2453FEE88()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_2453FEE98()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_2453FEEA8()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_2453FEEB8()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_2453FEEC8()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_2453FEED8()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_2453FEEE8()
{
  return MEMORY[0x270F04580]();
}

uint64_t sub_2453FEEF8()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_2453FEF08()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2453FEF18()
{
  return MEMORY[0x270F04670]();
}

uint64_t sub_2453FEF28()
{
  return MEMORY[0x270F04680]();
}

uint64_t sub_2453FEF38()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_2453FEF48()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_2453FEF58()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_2453FEF68()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_2453FEF78()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_2453FEF88()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_2453FEF98()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_2453FEFA8()
{
  return MEMORY[0x270F04740]();
}

uint64_t sub_2453FEFB8()
{
  return MEMORY[0x270F04760]();
}

uint64_t sub_2453FEFE8()
{
  return MEMORY[0x270F047D8]();
}

uint64_t sub_2453FF008()
{
  return MEMORY[0x270F047E8]();
}

uint64_t sub_2453FF028()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_2453FF038()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_2453FF048()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_2453FF058()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_2453FF068()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_2453FF078()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_2453FF088()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_2453FF098()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_2453FF0A8()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_2453FF0B8()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_2453FF0C8()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_2453FF0D8()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_2453FF0E8()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_2453FF0F8()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_2453FF108()
{
  return MEMORY[0x270F04B58]();
}

uint64_t sub_2453FF118()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_2453FF128()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_2453FF138()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_2453FF148()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_2453FF158()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_2453FF168()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_2453FF178()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_2453FF188()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_2453FF198()
{
  return MEMORY[0x270F04CC0]();
}

uint64_t sub_2453FF1A8()
{
  return MEMORY[0x270F04CE8]();
}

uint64_t sub_2453FF1B8()
{
  return MEMORY[0x270F04CF0]();
}

uint64_t sub_2453FF1C8()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_2453FF1D8()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_2453FF1E8()
{
  return MEMORY[0x270F04EC8]();
}

uint64_t sub_2453FF1F8()
{
  return MEMORY[0x270F04ED8]();
}

uint64_t sub_2453FF208()
{
  return MEMORY[0x270F04EF0]();
}

uint64_t sub_2453FF218()
{
  return MEMORY[0x270F04F00]();
}

uint64_t sub_2453FF228()
{
  return MEMORY[0x270F04F10]();
}

uint64_t sub_2453FF238()
{
  return MEMORY[0x270F04F68]();
}

uint64_t sub_2453FF248()
{
  return MEMORY[0x270F04F98]();
}

uint64_t sub_2453FF258()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_2453FF268()
{
  return MEMORY[0x270F05010]();
}

uint64_t sub_2453FF278()
{
  return MEMORY[0x270F05058]();
}

uint64_t sub_2453FF288()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2453FF298()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_2453FF2A8()
{
  return MEMORY[0x270F050C0]();
}

uint64_t sub_2453FF2B8()
{
  return MEMORY[0x270F050D0]();
}

uint64_t sub_2453FF2C8()
{
  return MEMORY[0x270F050E8]();
}

uint64_t sub_2453FF2D8()
{
  return MEMORY[0x270F05110]();
}

uint64_t sub_2453FF2E8()
{
  return MEMORY[0x270F05120]();
}

uint64_t sub_2453FF2F8()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_2453FF308()
{
  return MEMORY[0x270F05148]();
}

uint64_t sub_2453FF318()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_2453FF328()
{
  return MEMORY[0x270F05198]();
}

uint64_t sub_2453FF338()
{
  return MEMORY[0x270F051B8]();
}

uint64_t sub_2453FF348()
{
  return MEMORY[0x270F051C0]();
}

uint64_t sub_2453FF358()
{
  return MEMORY[0x270F05238]();
}

uint64_t sub_2453FF368()
{
  return MEMORY[0x270F052C0]();
}

uint64_t sub_2453FF378()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_2453FF388()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_2453FF398()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_2453FF3A8()
{
  return MEMORY[0x270F053D0]();
}

uint64_t sub_2453FF3B8()
{
  return MEMORY[0x270FA0978]();
}

uint64_t sub_2453FF3C8()
{
  return MEMORY[0x270FA09A0]();
}

uint64_t sub_2453FF3D8()
{
  return MEMORY[0x270FA09C8]();
}

uint64_t sub_2453FF3E8()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_2453FF3F8()
{
  return MEMORY[0x270FA09F8]();
}

uint64_t sub_2453FF408()
{
  return MEMORY[0x270FA0A08]();
}

uint64_t sub_2453FF418()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_2453FF428()
{
  return MEMORY[0x270FA0AB8]();
}

uint64_t sub_2453FF438()
{
  return MEMORY[0x270FA0AF8]();
}

uint64_t sub_2453FF448()
{
  return MEMORY[0x270FA0BB8]();
}

uint64_t sub_2453FF458()
{
  return MEMORY[0x270FA0BC0]();
}

uint64_t sub_2453FF468()
{
  return MEMORY[0x270F28710]();
}

uint64_t sub_2453FF478()
{
  return MEMORY[0x270F28750]();
}

uint64_t sub_2453FF488()
{
  return MEMORY[0x270EFA348]();
}

uint64_t sub_2453FF498()
{
  return MEMORY[0x270EFA350]();
}

uint64_t sub_2453FF4A8()
{
  return MEMORY[0x270EFA358]();
}

uint64_t sub_2453FF4B8()
{
  return MEMORY[0x270EFA360]();
}

uint64_t sub_2453FF4C8()
{
  return MEMORY[0x270EFA370]();
}

uint64_t sub_2453FF4D8()
{
  return MEMORY[0x270EFA378]();
}

uint64_t sub_2453FF4E8()
{
  return MEMORY[0x270EFA380]();
}

uint64_t sub_2453FF4F8()
{
  return MEMORY[0x270EFA390]();
}

uint64_t sub_2453FF508()
{
  return MEMORY[0x270EFA398]();
}

uint64_t sub_2453FF518()
{
  return MEMORY[0x270EFA3C8]();
}

uint64_t sub_2453FF528()
{
  return MEMORY[0x270EFA3E0]();
}

uint64_t sub_2453FF538()
{
  return MEMORY[0x270EFA3E8]();
}

uint64_t sub_2453FF548()
{
  return MEMORY[0x270EFA440]();
}

uint64_t sub_2453FF558()
{
  return MEMORY[0x270EFA448]();
}

uint64_t sub_2453FF568()
{
  return MEMORY[0x270EFA488]();
}

uint64_t sub_2453FF578()
{
  return MEMORY[0x270EFA4B8]();
}

uint64_t sub_2453FF588()
{
  return MEMORY[0x270EFA4C8]();
}

uint64_t sub_2453FF598()
{
  return MEMORY[0x270EFA4D0]();
}

uint64_t sub_2453FF5A8()
{
  return MEMORY[0x270F77288]();
}

uint64_t sub_2453FF5B8()
{
  return MEMORY[0x270F77290]();
}

uint64_t sub_2453FF5C8()
{
  return MEMORY[0x270F77298]();
}

uint64_t sub_2453FF5D8()
{
  return MEMORY[0x270F772A0]();
}

uint64_t sub_2453FF5E8()
{
  return MEMORY[0x270F772A8]();
}

uint64_t sub_2453FF5F8()
{
  return MEMORY[0x270F772B0]();
}

uint64_t sub_2453FF608()
{
  return MEMORY[0x270F772B8]();
}

uint64_t sub_2453FF618()
{
  return MEMORY[0x270F772C0]();
}

uint64_t sub_2453FF628()
{
  return MEMORY[0x270F772C8]();
}

uint64_t sub_2453FF638()
{
  return MEMORY[0x270F772D0]();
}

uint64_t sub_2453FF648()
{
  return MEMORY[0x270F772D8]();
}

uint64_t sub_2453FF658()
{
  return MEMORY[0x270F772E0]();
}

uint64_t sub_2453FF668()
{
  return MEMORY[0x270F772E8]();
}

uint64_t sub_2453FF678()
{
  return MEMORY[0x270F772F0]();
}

uint64_t sub_2453FF688()
{
  return MEMORY[0x270F772F8]();
}

uint64_t sub_2453FF698()
{
  return MEMORY[0x270F77300]();
}

uint64_t sub_2453FF6A8()
{
  return MEMORY[0x270F77308]();
}

uint64_t sub_2453FF6B8()
{
  return MEMORY[0x270F77310]();
}

uint64_t sub_2453FF6C8()
{
  return MEMORY[0x270F77318]();
}

uint64_t sub_2453FF6D8()
{
  return MEMORY[0x270F77320]();
}

uint64_t sub_2453FF6E8()
{
  return MEMORY[0x270F77330]();
}

uint64_t sub_2453FF6F8()
{
  return MEMORY[0x270F77338]();
}

uint64_t sub_2453FF708()
{
  return MEMORY[0x270F77340]();
}

uint64_t sub_2453FF718()
{
  return MEMORY[0x270F77350]();
}

uint64_t sub_2453FF728()
{
  return MEMORY[0x270F77360]();
}

uint64_t sub_2453FF738()
{
  return MEMORY[0x270F77370]();
}

uint64_t sub_2453FF748()
{
  return MEMORY[0x270F77378]();
}

uint64_t sub_2453FF758()
{
  return MEMORY[0x270F77380]();
}

uint64_t sub_2453FF768()
{
  return MEMORY[0x270F77388]();
}

uint64_t sub_2453FF778()
{
  return MEMORY[0x270F77398]();
}

uint64_t sub_2453FF788()
{
  return MEMORY[0x270F773A0]();
}

uint64_t sub_2453FF798()
{
  return MEMORY[0x270F773B0]();
}

uint64_t sub_2453FF7A8()
{
  return MEMORY[0x270F773B8]();
}

uint64_t sub_2453FF7B8()
{
  return MEMORY[0x270F773C0]();
}

uint64_t sub_2453FF7C8()
{
  return MEMORY[0x270F773C8]();
}

uint64_t sub_2453FF7D8()
{
  return MEMORY[0x270F773D0]();
}

uint64_t sub_2453FF7E8()
{
  return MEMORY[0x270F773D8]();
}

uint64_t sub_2453FF7F8()
{
  return MEMORY[0x270F773E0]();
}

uint64_t sub_2453FF808()
{
  return MEMORY[0x270F773E8]();
}

uint64_t sub_2453FF818()
{
  return MEMORY[0x270F773F0]();
}

uint64_t sub_2453FF828()
{
  return MEMORY[0x270F77400]();
}

uint64_t sub_2453FF838()
{
  return MEMORY[0x270F77408]();
}

uint64_t sub_2453FF848()
{
  return MEMORY[0x270F77410]();
}

uint64_t sub_2453FF858()
{
  return MEMORY[0x270F77418]();
}

uint64_t sub_2453FF868()
{
  return MEMORY[0x270F77420]();
}

uint64_t sub_2453FF878()
{
  return MEMORY[0x270F77428]();
}

uint64_t sub_2453FF888()
{
  return MEMORY[0x270F77430]();
}

uint64_t sub_2453FF898()
{
  return MEMORY[0x270F77438]();
}

uint64_t sub_2453FF8A8()
{
  return MEMORY[0x270F77440]();
}

uint64_t sub_2453FF8B8()
{
  return MEMORY[0x270F77448]();
}

uint64_t sub_2453FF8C8()
{
  return MEMORY[0x270F77450]();
}

uint64_t sub_2453FF8D8()
{
  return MEMORY[0x270F77458]();
}

uint64_t sub_2453FF8E8()
{
  return MEMORY[0x270F77460]();
}

uint64_t sub_2453FF8F8()
{
  return MEMORY[0x270F77468]();
}

uint64_t sub_2453FF908()
{
  return MEMORY[0x270F77470]();
}

uint64_t sub_2453FF918()
{
  return MEMORY[0x270F77478]();
}

uint64_t sub_2453FF928()
{
  return MEMORY[0x270F77480]();
}

uint64_t sub_2453FF938()
{
  return MEMORY[0x270F77488]();
}

uint64_t sub_2453FF948()
{
  return MEMORY[0x270F77490]();
}

uint64_t sub_2453FF958()
{
  return MEMORY[0x270F77498]();
}

uint64_t sub_2453FF968()
{
  return MEMORY[0x270F774A0]();
}

uint64_t sub_2453FF978()
{
  return MEMORY[0x270F774A8]();
}

uint64_t sub_2453FF988()
{
  return MEMORY[0x270F774B0]();
}

uint64_t sub_2453FF998()
{
  return MEMORY[0x270F774B8]();
}

uint64_t sub_2453FF9A8()
{
  return MEMORY[0x270F774C8]();
}

uint64_t sub_2453FF9B8()
{
  return MEMORY[0x270F774D0]();
}

uint64_t sub_2453FF9C8()
{
  return MEMORY[0x270F774D8]();
}

uint64_t sub_2453FF9D8()
{
  return MEMORY[0x270F774E0]();
}

uint64_t sub_2453FF9E8()
{
  return MEMORY[0x270F774E8]();
}

uint64_t sub_2453FF9F8()
{
  return MEMORY[0x270F774F0]();
}

uint64_t sub_2453FFA08()
{
  return MEMORY[0x270F774F8]();
}

uint64_t sub_2453FFA18()
{
  return MEMORY[0x270F77500]();
}

uint64_t sub_2453FFA28()
{
  return MEMORY[0x270F77508]();
}

uint64_t sub_2453FFA38()
{
  return MEMORY[0x270F77510]();
}

uint64_t sub_2453FFA48()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_2453FFA58()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_2453FFA68()
{
  return MEMORY[0x270EF1848]();
}

uint64_t sub_2453FFA78()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2453FFA88()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2453FFA98()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_2453FFAA8()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_2453FFAB8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2453FFAC8()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_2453FFAD8()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_2453FFAE8()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_2453FFAF8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2453FFB08()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_2453FFB18()
{
  return MEMORY[0x270EF19D0]();
}

uint64_t sub_2453FFB28()
{
  return MEMORY[0x270EF19D8]();
}

uint64_t sub_2453FFB38()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_2453FFB48()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2453FFB58()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_2453FFB68()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2453FFB78()
{
  return MEMORY[0x270F9D660]();
}

uint64_t sub_2453FFB88()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_2453FFB98()
{
  return MEMORY[0x270F77280]();
}

uint64_t sub_2453FFBA8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2453FFBB8()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2453FFBC8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2453FFBD8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2453FFBE8()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2453FFBF8()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2453FFC08()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_2453FFC18()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2453FFC28()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2453FFC38()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_2453FFC48()
{
  return MEMORY[0x270F9D888]();
}

uint64_t sub_2453FFC58()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2453FFC68()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2453FFC78()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_2453FFC88()
{
  return MEMORY[0x270F9D908]();
}

uint64_t sub_2453FFC98()
{
  return MEMORY[0x270F9D910]();
}

uint64_t sub_2453FFCA8()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t sub_2453FFCB8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2453FFCC8()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_2453FFCD8()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_2453FFCE8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2453FFCF8()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_2453FFD08()
{
  return MEMORY[0x270EF1BA0]();
}

uint64_t sub_2453FFD18()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_2453FFD28()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2453FFD38()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2453FFD48()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2453FFD58()
{
  return MEMORY[0x270F9DBF8]();
}

uint64_t sub_2453FFD68()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2453FFD78()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2453FFD88()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_2453FFD98()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_2453FFDA8()
{
  return MEMORY[0x270EF1BD0]();
}

uint64_t sub_2453FFDB8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2453FFDC8()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2453FFDD8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2453FFDE8()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_2453FFDF8()
{
  return MEMORY[0x270FA1E48]();
}

uint64_t sub_2453FFE18()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2453FFE28()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2453FFE38()
{
  return MEMORY[0x270FA1EB0]();
}

uint64_t sub_2453FFE48()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_2453FFE58()
{
  return MEMORY[0x270FA1EF8]();
}

uint64_t sub_2453FFE68()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2453FFE78()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2453FFE98()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_2453FFEB8()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_2453FFEE8()
{
  return MEMORY[0x270FA2068]();
}

uint64_t sub_2453FFEF8()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_2453FFF08()
{
  return MEMORY[0x270FA20C0]();
}

uint64_t sub_2453FFF18()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_2453FFF28()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_2453FFF38()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_2453FFF58()
{
  return MEMORY[0x270FA2120]();
}

uint64_t sub_2453FFF68()
{
  return MEMORY[0x270EF1C10]();
}

uint64_t sub_2453FFF88()
{
  return MEMORY[0x270EF1CA0]();
}

uint64_t sub_2453FFF98()
{
  return MEMORY[0x270EF1CC8]();
}

uint64_t sub_2453FFFA8()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_2453FFFB8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2453FFFC8()
{
  return MEMORY[0x270EF1CE8]();
}

uint64_t sub_2453FFFD8()
{
  return MEMORY[0x270FA0788]();
}

uint64_t sub_2453FFFE8()
{
  return MEMORY[0x270FA0790]();
}

uint64_t sub_2453FFFF8()
{
  return MEMORY[0x270FA07A0]();
}

uint64_t sub_245400008()
{
  return MEMORY[0x270FA07A8]();
}

uint64_t sub_245400018()
{
  return MEMORY[0x270EE85C8]();
}

uint64_t sub_245400028()
{
  return MEMORY[0x270EE85D0]();
}

uint64_t sub_245400038()
{
  return MEMORY[0x270EE85D8]();
}

uint64_t sub_245400048()
{
  return MEMORY[0x270EE85E0]();
}

uint64_t sub_245400058()
{
  return MEMORY[0x270EE85E8]();
}

uint64_t sub_245400068()
{
  return MEMORY[0x270EF1DC0]();
}

uint64_t sub_245400078()
{
  return MEMORY[0x270F53C98]();
}

uint64_t sub_245400088()
{
  return MEMORY[0x270EE5850]();
}

uint64_t sub_245400098()
{
  return MEMORY[0x270EE5868]();
}

uint64_t sub_2454000A8()
{
  return MEMORY[0x270EE5890]();
}

uint64_t sub_2454000B8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2454000C8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2454000D8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2454000E8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2454000F8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_245400108()
{
  return MEMORY[0x270FA2F20]();
}

uint64_t sub_245400118()
{
  return MEMORY[0x270FA1950]();
}

uint64_t sub_245400128()
{
  return MEMORY[0x270FA1960]();
}

uint64_t sub_245400138()
{
  return MEMORY[0x270FA1290]();
}

uint64_t sub_245400148()
{
  return MEMORY[0x270F824D0]();
}

uint64_t sub_245400158()
{
  return MEMORY[0x270F82500]();
}

uint64_t sub_245400168()
{
  return MEMORY[0x270F82528]();
}

uint64_t sub_245400178()
{
  return MEMORY[0x270F82530]();
}

uint64_t sub_245400188()
{
  return MEMORY[0x270F82538]();
}

uint64_t sub_245400198()
{
  return MEMORY[0x270F82540]();
}

uint64_t sub_2454001A8()
{
  return MEMORY[0x270F82550]();
}

uint64_t sub_2454001B8()
{
  return MEMORY[0x270F82560]();
}

uint64_t sub_2454001C8()
{
  return MEMORY[0x270F82570]();
}

uint64_t sub_2454001D8()
{
  return MEMORY[0x270EF1F68]();
}

uint64_t sub_2454001E8()
{
  return MEMORY[0x270EF1F78]();
}

uint64_t sub_2454001F8()
{
  return MEMORY[0x270FA0C58]();
}

uint64_t sub_245400208()
{
  return MEMORY[0x270FA0C80]();
}

uint64_t sub_245400218()
{
  return MEMORY[0x270FA0CD8]();
}

uint64_t sub_245400228()
{
  return MEMORY[0x270FA0CF8]();
}

uint64_t sub_245400238()
{
  return MEMORY[0x270FA0D18]();
}

uint64_t sub_245400248()
{
  return MEMORY[0x270FA0D30]();
}

uint64_t sub_245400258()
{
  return MEMORY[0x270FA0D40]();
}

uint64_t sub_245400268()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_245400278()
{
  return MEMORY[0x270FA0D58]();
}

uint64_t sub_245400288()
{
  return MEMORY[0x270FA0D68]();
}

uint64_t sub_245400298()
{
  return MEMORY[0x270FA0D98]();
}

uint64_t sub_2454002A8()
{
  return MEMORY[0x270FA0DC0]();
}

uint64_t sub_2454002B8()
{
  return MEMORY[0x270FA0DD8]();
}

uint64_t sub_2454002C8()
{
  return MEMORY[0x270F825B8]();
}

uint64_t sub_2454002D8()
{
  return MEMORY[0x270F3D640]();
}

uint64_t sub_2454002E8()
{
  return MEMORY[0x270F3D648]();
}

uint64_t sub_2454002F8()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_245400308()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_245400318()
{
  return MEMORY[0x270EF2008]();
}

uint64_t sub_245400328()
{
  return MEMORY[0x270EF2018]();
}

uint64_t sub_245400338()
{
  return MEMORY[0x270F82660]();
}

uint64_t sub_245400348()
{
  return MEMORY[0x270EFA518]();
}

uint64_t sub_245400358()
{
  return MEMORY[0x270EFA520]();
}

uint64_t sub_245400368()
{
  return MEMORY[0x270F82710]();
}

uint64_t sub_245400388()
{
  return MEMORY[0x270EE5900]();
}

uint64_t sub_245400398()
{
  return MEMORY[0x270F3D650]();
}

uint64_t sub_2454003A8()
{
  return MEMORY[0x270EE5918]();
}

uint64_t sub_2454003B8()
{
  return MEMORY[0x270FA0870]();
}

uint64_t sub_2454003C8()
{
  return MEMORY[0x270FA0888]();
}

uint64_t sub_2454003D8()
{
  return MEMORY[0x270FA0890]();
}

uint64_t sub_2454003E8()
{
  return MEMORY[0x270F828B0]();
}

uint64_t sub_2454003F8()
{
  return MEMORY[0x270F82910]();
}

uint64_t sub_245400408()
{
  return MEMORY[0x270F82938]();
}

uint64_t sub_245400418()
{
  return MEMORY[0x270F82948]();
}

uint64_t sub_245400428()
{
  return MEMORY[0x270EF2190]();
}

uint64_t sub_245400438()
{
  return MEMORY[0x270FA1178]();
}

uint64_t sub_245400448()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_245400458()
{
  return MEMORY[0x270FA11A8]();
}

uint64_t sub_245400468()
{
  return MEMORY[0x270F82958]();
}

uint64_t sub_245400478()
{
  return MEMORY[0x270F82970]();
}

uint64_t sub_245400488()
{
  return MEMORY[0x270F829A0]();
}

uint64_t sub_245400498()
{
  return MEMORY[0x270F829A8]();
}

uint64_t sub_2454004A8()
{
  return MEMORY[0x270F829C0]();
}

uint64_t sub_2454004B8()
{
  return MEMORY[0x270F829D0]();
}

uint64_t sub_2454004C8()
{
  return MEMORY[0x270F82A60]();
}

uint64_t sub_2454004D8()
{
  return MEMORY[0x270F82A70]();
}

uint64_t sub_2454004E8()
{
  return MEMORY[0x270F82AB8]();
}

uint64_t sub_2454004F8()
{
  return MEMORY[0x270F82AC8]();
}

uint64_t sub_245400508()
{
  return MEMORY[0x270F82AD8]();
}

uint64_t sub_245400518()
{
  return MEMORY[0x270F82AF8]();
}

uint64_t sub_245400528()
{
  return MEMORY[0x270F82B08]();
}

uint64_t sub_245400538()
{
  return MEMORY[0x270F82B20]();
}

uint64_t sub_245400548()
{
  return MEMORY[0x270F82B50]();
}

uint64_t sub_245400558()
{
  return MEMORY[0x270F82B68]();
}

uint64_t sub_245400568()
{
  return MEMORY[0x270F82B70]();
}

uint64_t sub_245400578()
{
  return MEMORY[0x270F82B80]();
}

uint64_t sub_245400588()
{
  return MEMORY[0x270EF21E0]();
}

uint64_t sub_245400598()
{
  return MEMORY[0x270EE5948]();
}

uint64_t sub_2454005A8()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_2454005B8()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_2454005C8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2454005D8()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_2454005E8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2454005F8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_245400608()
{
  return MEMORY[0x270F9E570]();
}

uint64_t sub_245400618()
{
  return MEMORY[0x270F9E578]();
}

uint64_t sub_245400628()
{
  return MEMORY[0x270EF23E0]();
}

uint64_t sub_245400638()
{
  return MEMORY[0x270EF2440]();
}

uint64_t sub_245400648()
{
  return MEMORY[0x270EF2480]();
}

uint64_t sub_245400658()
{
  return MEMORY[0x270EF24A8]();
}

uint64_t sub_245400668()
{
  return MEMORY[0x270EF24C8]();
}

uint64_t sub_245400678()
{
  return MEMORY[0x270EF2538]();
}

uint64_t sub_245400688()
{
  return MEMORY[0x270EF25A8]();
}

uint64_t sub_245400698()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_2454006A8()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_2454006B8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2454006D8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2454006E8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2454006F8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_245400708()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_245400718()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_245400728()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_245400738()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_245400748()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_245400758()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_245400768()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_245400778()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_245400788()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_245400798()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_2454007A8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2454007B8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2454007C8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2454007D8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2454007E8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2454007F8()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_245400808()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_245400818()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_245400828()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_245400838()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_245400848()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_245400858()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_245400868()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_245400878()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_245400888()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_245400898()
{
  return MEMORY[0x270F9EB00]();
}

uint64_t sub_2454008A8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2454008C8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2454008D8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2454008E8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2454008F8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_245400908()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_245400918()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_245400928()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_245400938()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_245400948()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_245400958()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_245400968()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_245400978()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_245400988()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_245400998()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_2454009A8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2454009B8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2454009C8()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_2454009D8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2454009E8()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_2454009F8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_245400A08()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_245400A18()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_245400A28()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_245400A38()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_245400A48()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_245400A58()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_245400A78()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_245400A88()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_245400A98()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_245400AA8()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_245400AB8()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_245400AC8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_245400AD8()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_245400AE8()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_245400AF8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_245400B08()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_245400B18()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_245400B28()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_245400B38()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_245400B48()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_245400B58()
{
  return MEMORY[0x270FA2310]();
}

uint64_t sub_245400B68()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_245400B88()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_245400B98()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_245400BA8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_245400BB8()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_245400BC8()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_245400BE8()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_245400BF8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_245400C08()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_245400C18()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_245400C38()
{
  return MEMORY[0x270EF2660]();
}

uint64_t sub_245400C48()
{
  return MEMORY[0x270EF2678]();
}

uint64_t sub_245400C58()
{
  return MEMORY[0x270EF2688]();
}

uint64_t sub_245400C68()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_245400C78()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_245400C88()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_245400C98()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_245400CA8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_245400CB8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_245400CC8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_245400CD8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_245400CE8()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_245400CF8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_245400D08()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_245400D18()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_245400D28()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_245400D58()
{
  return MEMORY[0x270FA00C0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x270EFB930](retstr, m);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB940](retstr, sx, sy, sz);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47D8](allocator, capacity);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B80]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA8](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5958](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D0](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x270EE5A68]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CB0](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F28](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F40](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6788](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6798](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67B8](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D0](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CFArrayRef CGImageSourceCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x270EF5010]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5028](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5048](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x270EF5068](isrc);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7178]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7198]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE7200]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7208]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7240]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7258]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7298]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGSize CGSizeApplyAffineTransform(CGSize size, CGAffineTransform *t)
{
  MEMORY[0x270EE7338](t, (__n128)size, *(__n128 *)&size.height);
  result.height = v3;
  result.width = v2;
  return result;
}

uint64_t CMPhotoCompressionSessionAddAuxiliaryImage()
{
  return MEMORY[0x270F12E28]();
}

uint64_t CMPhotoCompressionSessionAddImageToSequence()
{
  return MEMORY[0x270F12E50]();
}

uint64_t CMPhotoCompressionSessionCloseContainerAndCopyBacking()
{
  return MEMORY[0x270F12E78]();
}

uint64_t CMPhotoCompressionSessionCreate()
{
  return MEMORY[0x270F12E80]();
}

uint64_t CMPhotoCompressionSessionEndImageSequence()
{
  return MEMORY[0x270F12E90]();
}

uint64_t CMPhotoCompressionSessionOpenEmptyContainer()
{
  return MEMORY[0x270F12EA8]();
}

uint64_t CMPhotoCompressionSessionStartImageSequence()
{
  return MEMORY[0x270F12EC0]();
}

uint64_t CMPhotoDecompressionContainerCreateDictionaryDescription()
{
  return MEMORY[0x270F12F00]();
}

uint64_t CMPhotoDecompressionContainerCreateImageForIndex()
{
  return MEMORY[0x270F12F08]();
}

uint64_t CMPhotoDecompressionContainerCreateSequenceContainer()
{
  return MEMORY[0x270F12F10]();
}

uint64_t CMPhotoDecompressionContainerGetImageCountWithOptions()
{
  return MEMORY[0x270F12F48]();
}

uint64_t CMPhotoDecompressionSessionCreate()
{
  return MEMORY[0x270F12F78]();
}

uint64_t CMPhotoDecompressionSessionCreateContainer()
{
  return MEMORY[0x270F12F80]();
}

uint64_t CMPhotoJPEGCreateCGImageFromJPEG()
{
  return MEMORY[0x270F12F88]();
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7D98](retstr, lhs, rhs);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x270EE7E20](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7F08](retstr, lhs, rhs);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x270EE7FD0](videoDesc);
}

CFStringRef CTFontCopyName(CTFontRef font, CFStringRef nameKey)
{
  return (CFStringRef)MEMORY[0x270EE9A68](font, nameKey);
}

CGFloat CTFontGetSize(CTFontRef font)
{
  MEMORY[0x270EE9C48](font);
  return result;
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x270EEA0D8](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x270EEA0E8](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x270EEA108](image);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA198](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B8](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA268](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA280](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA290](allocator, pixelBufferPool, pixelBufferOut);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA338](pixelBuffer, unlockFlags);
}

uint64_t IMBalloonExtensionIDWithSuffix()
{
  return MEMORY[0x270F3D000]();
}

uint64_t IMDAuditTokenTaskCopyValueForEntitlement()
{
  return MEMORY[0x270F3CCE0]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x270F3CEA8]();
}

uint64_t ITKAspectRatio()
{
  return MEMORY[0x270F3D4B0]();
}

uint64_t ITKCenterOfRect()
{
  return MEMORY[0x270F3D4C0]();
}

uint64_t ITKClamp()
{
  return MEMORY[0x270F3D4C8]();
}

uint64_t ITKClampSizeToMaxLength()
{
  return MEMORY[0x270F3D4D0]();
}

uint64_t ITKDynamicCast()
{
  return MEMORY[0x270F3D4F0]();
}

uint64_t ITKFitOrFillSizeInRect()
{
  return MEMORY[0x270F3D4F8]();
}

uint64_t ITKFitOrFillSizeInSize()
{
  return MEMORY[0x270F3D500]();
}

uint64_t ITKFloorSize()
{
  return MEMORY[0x270F3D518]();
}

uint64_t ITKMix()
{
  return MEMORY[0x270F3D530]();
}

uint64_t ITKMixFloats()
{
  return MEMORY[0x270F3D538]();
}

uint64_t ITKRectHasArea()
{
  return MEMORY[0x270F3D5A8]();
}

uint64_t ITKRectWithCenterAndSize()
{
  return MEMORY[0x270F3D5B0]();
}

uint64_t ITKScaleSizeWithinSize()
{
  return MEMORY[0x270F3D5D0]();
}

uint64_t ITKSizeGetMaxDimension()
{
  return MEMORY[0x270F3D5D8]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E18]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C50]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2C60](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D78]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DE0](image);
}

uint64_t UIKeyboardInputModeLanguageMatchesLocaleLanguage()
{
  return MEMORY[0x270F82E10]();
}

uint64_t UIPointRoundToScale()
{
  return MEMORY[0x270F82E48]();
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x270F82ED0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _UIStickerCreateDownsampledHEICS()
{
  return MEMORY[0x270F82FE8]();
}

uint64_t _UIStickerCreateDownsampledImage()
{
  return MEMORY[0x270F82FF0]();
}

uint64_t _UIStickerCreateImageFromData()
{
  return MEMORY[0x270F82FF8]();
}

uint64_t _UIStickerCreateSquareSticker()
{
  return MEMORY[0x270F83000]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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
  return MEMORY[0x270ED95A8](when, delta);
}

void exit(int a1)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

uint64_t itk_cgImageCropZeroAlpha()
{
  return MEMORY[0x270F3D658]();
}

uint64_t itk_cgImageFromPixelBuffer()
{
  return MEMORY[0x270F3D660]();
}

uint64_t itk_dataFromCGImage()
{
  return MEMORY[0x270F3D668]();
}

uint64_t itk_dispatchMainAfterDelay()
{
  return MEMORY[0x270F3D610]();
}

uint64_t itk_isMacOS()
{
  return MEMORY[0x270F3D620]();
}

uint64_t itk_isiOS()
{
  return MEMORY[0x270F3D630]();
}

uint64_t itk_isiPad()
{
  return MEMORY[0x270F3D670]();
}

uint64_t itk_isiPhone()
{
  return MEMORY[0x270F3D678]();
}

uint64_t itk_performBlockOnMainThread()
{
  return MEMORY[0x270F3D638]();
}

uint64_t itk_sizeForCGImage()
{
  return MEMORY[0x270F3D680]();
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
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

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
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

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x270FA0248]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x270FA04B0]();
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

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x270FA2470]();
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

uint64_t vk_imageOrientationFromTransform()
{
  return MEMORY[0x270F83C48]();
}