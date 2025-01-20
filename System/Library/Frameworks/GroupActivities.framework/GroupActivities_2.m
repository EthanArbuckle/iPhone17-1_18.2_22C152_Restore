id specialized _NativeDictionary.copy()(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id result;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = type metadata accessor for UUID();
  v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v26 = v1;
  v7 = *v1;
  v8 = static _DictionaryStorage.copy(original:)();
  v9 = v8;
  if (!*(void *)(v7 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v26 = v9;
    return result;
  }
  result = (id)(v8 + 64);
  v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11) {
    result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  }
  v27 = v7 + 64;
  v13 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  v14 = 1 << *(unsigned char *)(v7 + 32);
  v15 = -1;
  if (v14 < 64) {
    v15 = ~(-1 << v14);
  }
  v16 = v15 & *(void *)(v7 + 64);
  v30 = v4 + 16;
  v28 = (unint64_t)(v14 + 63) >> 6;
  v29 = v4 + 32;
  while (1)
  {
    if (v16)
    {
      v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v18 = v17 | (v13 << 6);
      goto LABEL_12;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v28) {
      goto LABEL_26;
    }
    v23 = *(void *)(v27 + 8 * v22);
    ++v13;
    if (!v23)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v28) {
        goto LABEL_26;
      }
      v23 = *(void *)(v27 + 8 * v13);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    v16 = (v23 - 1) & v23;
    v18 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    v19 = *(void *)(v4 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(void *)(v7 + 48) + v19, v3);
    v20 = 8 * v18;
    v21 = *(void **)(*(void *)(v7 + 56) + v20);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(void *)(v9 + 48) + v19, v6, v3);
    *(void *)(*(void *)(v9 + 56) + v20) = v21;
    result = v21;
  }
  v24 = v22 + 2;
  if (v24 >= v28) {
    goto LABEL_26;
  }
  v23 = *(void *)(v27 + 8 * v24);
  if (v23)
  {
    v13 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v28) {
      goto LABEL_26;
    }
    v23 = *(void *)(v27 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *specialized _NativeDictionary.copy()(uint64_t *a1)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v26 = v1;
  uint64_t v7 = *v1;
  uint64_t v8 = static _DictionaryStorage.copy(original:)();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    uint64_t *v26 = v9;
    return result;
  }
  result = (void *)(v8 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11) {
    result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  }
  int64_t v13 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v7 + 64);
  uint64_t v27 = v7 + 64;
  int64_t v28 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v29 = v4 + 32;
  uint64_t v30 = v4 + 16;
  while (1)
  {
    if (v16)
    {
      unint64_t v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v28) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v28) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v27 + 8 * v13);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v16 = (v23 - 1) & v23;
    unint64_t v18 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    unint64_t v19 = *(void *)(v4 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(void *)(v7 + 48) + v19, v3);
    uint64_t v20 = 8 * v18;
    uint64_t v21 = *(void *)(*(void *)(v7 + 56) + 8 * v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(void *)(v9 + 48) + v19, v6, v3);
    *(void *)(*(void *)(v9 + 56) + v20) = v21;
    result = (void *)swift_retain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v28) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v27 + 8 * v24);
  if (v23)
  {
    int64_t v13 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v28) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *specialized _NativeDictionary.copy()(uint64_t *a1, void (*a2)(unsigned char *, uint64_t))
{
  uint64_t v4 = v2;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v5 = *v2;
  uint64_t v6 = static _DictionaryStorage.copy(original:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *uint64_t v4 = v7;
    return result;
  }
  uint64_t v27 = v4;
  result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    int64_t v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v28 + 8 * v24);
    ++v11;
    if (!v25)
    {
      int64_t v11 = v24 + 1;
      if (v24 + 1 >= v15) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v28 + 8 * v11);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v14 = (v25 - 1) & v25;
    unint64_t v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    uint64_t v22 = 40 * v17;
    outlined init with copy of AudioSessionAssertionManager(*(void *)(v5 + 56) + 40 * v17, (uint64_t)v29);
    unint64_t v23 = (void *)(*(void *)(v7 + 48) + v18);
    *unint64_t v23 = v20;
    v23[1] = v21;
    a2(v29, *(void *)(v7 + 56) + v22);
    result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    result = (void *)swift_release();
    uint64_t v4 = v27;
    goto LABEL_28;
  }
  unint64_t v25 = *(void *)(v28 + 8 * v26);
  if (v25)
  {
    int64_t v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v11 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v28 + 8 * v11);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized _NativeDictionary.extractDictionary(using:count:)(unint64_t *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t *a5)
{
  uint64_t v49 = type metadata accessor for UUID();
  uint64_t v44 = *(void *)(v49 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v49);
  v48 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  v43 = (char *)&v38 - v12;
  if (!a3) {
    return MEMORY[0x1E4FBC868];
  }
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t result = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v14 = result;
  v39 = a1;
  uint64_t v40 = a2;
  if (a2 < 1) {
    unint64_t v15 = 0;
  }
  else {
    unint64_t v15 = *a1;
  }
  uint64_t v16 = 0;
  v41 = a4;
  uint64_t v42 = v44 + 16;
  uint64_t v47 = v44 + 32;
  uint64_t v17 = result + 64;
  uint64_t v18 = v49;
  while (1)
  {
    if (v15)
    {
      uint64_t v45 = (v15 - 1) & v15;
      uint64_t v46 = v16;
      unint64_t v19 = __clz(__rbit64(v15)) | (v16 << 6);
    }
    else
    {
      uint64_t v20 = v16 + 1;
      if (__OFADD__(v16, 1)) {
        goto LABEL_40;
      }
      if (v20 >= v40) {
        return v14;
      }
      unint64_t v21 = v39[v20];
      uint64_t v22 = v16 + 1;
      if (!v21)
      {
        uint64_t v22 = v16 + 2;
        if (v16 + 2 >= v40) {
          return v14;
        }
        unint64_t v21 = v39[v22];
        if (!v21)
        {
          uint64_t v22 = v16 + 3;
          if (v16 + 3 >= v40) {
            return v14;
          }
          unint64_t v21 = v39[v22];
          if (!v21)
          {
            uint64_t v23 = v16 + 4;
            if (v16 + 4 >= v40) {
              return v14;
            }
            unint64_t v21 = v39[v23];
            if (!v21)
            {
              while (1)
              {
                uint64_t v22 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v22 >= v40) {
                  return v14;
                }
                unint64_t v21 = v39[v22];
                ++v23;
                if (v21) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v22 = v16 + 4;
          }
        }
      }
LABEL_24:
      uint64_t v45 = (v21 - 1) & v21;
      uint64_t v46 = v22;
      unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
    }
    int64_t v24 = v43;
    uint64_t v25 = v44;
    uint64_t v26 = *(void *)(v44 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v44 + 16))(v43, a4[6] + v26 * v19, v18);
    uint64_t v27 = *(void *)(a4[7] + 8 * v19);
    uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
    v28(v48, v24, v18);
    _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_4((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, 255, MEMORY[0x1E4F27990]);
    swift_retain();
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v29 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v30 = result & ~v29;
    unint64_t v31 = v30 >> 6;
    if (((-1 << v30) & ~*(void *)(v17 + 8 * (v30 >> 6))) != 0)
    {
      unint64_t v32 = __clz(__rbit64((-1 << v30) & ~*(void *)(v17 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v35 = v31 == v34;
        if (v31 == v34) {
          unint64_t v31 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v17 + 8 * v31);
      }
      while (v36 == -1);
      unint64_t v32 = __clz(__rbit64(~v36)) + (v31 << 6);
    }
    *(void *)(v17 + ((v32 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v32;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v28)(*(void *)(v14 + 48) + v32 * v26, v48, v49);
    *(void *)(*(void *)(v14 + 56) + 8 * v32) = v27;
    ++*(void *)(v14 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v41;
    unint64_t v15 = v45;
    uint64_t v16 = v46;
    if (!a3) {
      return v14;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

void specialized Set.subscript.getter(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
}

{
  specialized Set.subscript.getter(a1, a2, a3, a4, &lazy cache variable for type metadata for CPParticipant);
}

void specialized Set.subscript.getter(uint64_t a1, uint64_t a2, char a3, uint64_t a4, unint64_t *a5)
{
  unint64_t v7 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v8 = a4;
      }
      else {
        uint64_t v8 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x1A624E820](a1, a2, v8);
      type metadata accessor for OS_dispatch_queue(0, a5);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  __CocoaSet.Index.element.getter();
  type metadata accessor for OS_dispatch_queue(0, a5);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  a5 = v18;
  swift_unknownObjectRelease();
  Swift::Int v9 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v7 = v9 & ~v10;
  if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v11 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
  char v12 = static NSObject.== infix(_:_:)();

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = ~v10;
    do
    {
      unint64_t v7 = (v7 + 1) & v13;
      if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        goto LABEL_26;
      }
      id v14 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
      char v15 = static NSObject.== infix(_:_:)();
    }
    while ((v15 & 1) == 0);
  }

LABEL_20:
  uint64_t v16 = *(void **)(*(void *)(a4 + 48) + 8 * v7);

  id v17 = v16;
}

uint64_t specialized _NativeSet.startIndex.getter(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  Swift::Int v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

void *specialized BackgroundGroupSessionManager.init(client:)(void *a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v4 - 8);
  unsigned int v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  uint64_t v7 = MEMORY[0x1E4FBC868];
  a2[16] = MEMORY[0x1E4FBC868];
  a2[17] = v7;
  a2[18] = v7;
  a2[19] = 0;
  uint64_t v8 = type metadata accessor for BackgroundAudioSessionAssertionManager();
  uint64_t inited = swift_initStaticObject();
  a2[23] = v8;
  a2[24] = &protocol witness table for BackgroundAudioSessionAssertionManager;
  a2[20] = inited;
  unint64_t v10 = MEMORY[0x1E4FBC860];
  unint64_t v19 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E4FBC860]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentValueSubject<[UUID : TUConversationActivitySessionContainer], Never>);
  swift_allocObject();
  a2[25] = CurrentValueSubject.init(_:)();
  unint64_t v19 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentValueSubject<[GroupSession<AnyGroupActivity>], Never>);
  swift_allocObject();
  a2[26] = CurrentValueSubject.init(_:)();
  a2[27] = 0;
  uint64_t v11 = MEMORY[0x1E4F5B100];
  a2[14] = a1;
  a2[15] = v11;
  _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_4(&lazy protocol witness table cache variable for type BackgroundGroupSessionManager and conformance BackgroundGroupSessionManager, v12, (void (*)(uint64_t))type metadata accessor for BackgroundGroupSessionManager);
  type metadata accessor for BackgroundSessionManagerClient();
  swift_unknownObjectRetain();
  id v13 = a1;
  swift_retain();
  dispatch thunk of BackgroundSessionManagerClientProtocol.delegate.setter();

  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 1, 1, v14);
  uint64_t v15 = swift_allocObject();
  swift_weakInit();
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v15;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v6, (uint64_t)&closure #1 in BackgroundGroupSessionManager.init(client:)partial apply, (uint64_t)v16);
  swift_release();

  return a2;
}

void *specialized BackgroundGroupSessionManager.init(client:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v7 - 8);
  Swift::Int v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  uint64_t v10 = MEMORY[0x1E4FBC868];
  a2[16] = MEMORY[0x1E4FBC868];
  a2[17] = v10;
  a2[18] = v10;
  a2[19] = 0;
  uint64_t v11 = type metadata accessor for BackgroundAudioSessionAssertionManager();
  uint64_t inited = swift_initStaticObject();
  a2[23] = v11;
  a2[24] = &protocol witness table for BackgroundAudioSessionAssertionManager;
  a2[20] = inited;
  unint64_t v13 = MEMORY[0x1E4FBC860];
  unint64_t v20 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E4FBC860]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentValueSubject<[UUID : TUConversationActivitySessionContainer], Never>);
  swift_allocObject();
  a2[25] = CurrentValueSubject.init(_:)();
  unint64_t v20 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentValueSubject<[GroupSession<AnyGroupActivity>], Never>);
  swift_allocObject();
  a2[26] = CurrentValueSubject.init(_:)();
  a2[27] = 0;
  a2[14] = a1;
  a2[15] = a4;
  _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_4(&lazy protocol witness table cache variable for type BackgroundGroupSessionManager and conformance BackgroundGroupSessionManager, v14, (void (*)(uint64_t))type metadata accessor for BackgroundGroupSessionManager);
  swift_unknownObjectRetain_n();
  swift_retain();
  dispatch thunk of BackgroundSessionManagerClientProtocol.delegate.setter();
  swift_unknownObjectRelease();
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 1, 1, v15);
  uint64_t v16 = swift_allocObject();
  swift_weakInit();
  id v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = v16;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&async function pointer to partial apply for closure #1 in BackgroundGroupSessionManager.init(client:), (uint64_t)v17);
  swift_unknownObjectRelease();
  swift_release();
  return a2;
}

uint64_t specialized PresenceSession.init(provider:serviceProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v46 = a3;
  uint64_t v42 = a1;
  uint64_t v43 = a2;
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v44 = *(void *)(v5 - 8);
  uint64_t v45 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v41 = (uint64_t)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncStream<@Sendable ()>.Continuation.BufferingPolicy);
  uint64_t v39 = *(void *)(v7 - 8);
  uint64_t v40 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v38 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v9 - 8);
  v37 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentSubject<PresenceSessionInfo>);
  uint64_t v11 = *(void *)(v36 - 8);
  MEMORY[0x1F4188790](v36);
  unint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentSubject<Set<AddressableMember>>);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  id v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentSubject<PresenceSession.State>);
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  unint64_t v21 = (char *)&v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = a4 + OBJC_IVAR____TtC15GroupActivities15PresenceSession__state;
  LOBYTE(v48) = 0;
  CurrentSubject.init(wrappedValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v22, v21, v18);
  uint64_t v23 = MEMORY[0x1E4FBC870];
  *(void *)(a4 + OBJC_IVAR____TtC15GroupActivities15PresenceSession_activeParticipants) = MEMORY[0x1E4FBC870];
  uint64_t v24 = a4 + OBJC_IVAR____TtC15GroupActivities15PresenceSession__members;
  uint64_t v48 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Set<AddressableMember>);
  CurrentSubject.init(wrappedValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v24, v17, v14);
  uint64_t v25 = a4 + OBJC_IVAR____TtC15GroupActivities15PresenceSession__sessionInfo;
  uint64_t v48 = v23;
  CurrentSubject.init(wrappedValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v25, v13, v36);
  uint64_t v26 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v37, 1, 1, v26);
  (*(void (**)(char *, void, uint64_t))(v39 + 104))(v38, *MEMORY[0x1E4FBD028], v40);
  AsyncSerialQueue.init(priority:bufferingPolicy:)();
  *(void *)(a4 + OBJC_IVAR____TtC15GroupActivities15PresenceSession_observers) = v23;
  uint64_t v27 = a4 + OBJC_IVAR____TtC15GroupActivities15PresenceSession_provider;
  *(void *)(a4 + OBJC_IVAR____TtC15GroupActivities15PresenceSession_provider + 8) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(a4 + OBJC_IVAR____TtC15GroupActivities15PresenceSession_connection) = 0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v29 = v43;
  uint64_t v30 = *(void *)(v43 + 8);
  uint64_t v31 = v41;
  GroupSessionProvider.uuid.getter(ObjectType, v30, v41);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32))(a4 + OBJC_IVAR____TtC15GroupActivities15PresenceSession_id, v31, v45);
  swift_beginAccess();
  *(void *)(v27 + 8) = v29;
  swift_unknownObjectWeakAssign();
  unint64_t v32 = (void *)(a4 + OBJC_IVAR____TtC15GroupActivities15PresenceSession_serviceProvider);
  *unint64_t v32 = v46;
  v32[1] = &protocol witness table for BackgroundGroupSessionManager;
  char v33 = *(uint64_t (**)(uint64_t, uint64_t))(v30 + 72);
  swift_unknownObjectRetain();
  uint64_t v47 = v33(ObjectType, v30);
  swift_allocObject();
  swift_weakInit();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentValueSubject<Set<AddressableMember>, Never>);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type CurrentValueSubject<Set<AddressableMember>, Never> and conformance CurrentValueSubject<A, B>, &demangling cache variable for type metadata for CurrentValueSubject<Set<AddressableMember>, Never>);
  Publisher<>.sink(receiveValue:)();
  swift_release();
  swift_release();
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  return a4;
}

uint64_t specialized TopicManager.init(provider:featureFlags:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[UUID : TopicManager.ConversationClient]>);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0) + 8;
  v20[3] = type metadata accessor for BackgroundGroupSessionManager();
  v20[4] = _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_4(&lazy protocol witness table cache variable for type BackgroundGroupSessionManager and conformance BackgroundGroupSessionManager, v10, (void (*)(uint64_t))type metadata accessor for BackgroundGroupSessionManager);
  v20[0] = a1;
  uint64_t v11 = a3 + OBJC_IVAR____TtC15GroupActivities12TopicManager__conversationClientsByGroupUUID;
  uint64_t v12 = MEMORY[0x1E4FBC860];
  unint64_t v19 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E4FBC860]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [UUID : TopicManager.ConversationClient]);
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v11, v9, v6);
  if ((v12 & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    unint64_t v13 = specialized Set.init(_nonEmptyArrayLiteral:)(MEMORY[0x1E4FBC860]);
  }
  else {
    unint64_t v13 = MEMORY[0x1E4FBC870];
  }
  *(void *)(a3 + OBJC_IVAR____TtC15GroupActivities12TopicManager_cancellables) = v13;
  uint64_t v14 = OBJC_IVAR____TtC15GroupActivities12TopicManager_lock;
  type metadata accessor for Lock();
  swift_allocObject();
  *(void *)(a3 + v14) = Lock.init()();
  outlined init with copy of AudioSessionAssertionManager((uint64_t)v20, a3 + OBJC_IVAR____TtC15GroupActivities12TopicManager_provider);
  *(void *)(a3 + OBJC_IVAR____TtC15GroupActivities12TopicManager_featureFlags) = a2;
  uint64_t v15 = *(void *)(a1 + 200);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PublisherBox<CurrentValueSubject<[UUID : TUConversationActivitySessionContainer], Never>>);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  unint64_t v19 = v16;
  id v17 = a2;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never>);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never> and conformance AnyPublisher<A, B>, &demangling cache variable for type metadata for AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never>);
  Publisher<>.sink(receiveValue:)();
  swift_release();
  swift_release();
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  return a3;
}

uint64_t type metadata accessor for BackgroundGroupSessionManager()
{
  return self;
}

uint64_t partial apply for closure #1 in BackgroundGroupSessionManager.leave(identifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return closure #1 in BackgroundGroupSessionManager.leave(identifier:)(a1, a2, v6, v7, v9, v8);
}

unint64_t lazy protocol witness table accessor for type TUHandle and conformance NSObject()
{
  unint64_t result = lazy protocol witness table cache variable for type TUHandle and conformance NSObject;
  if (!lazy protocol witness table cache variable for type TUHandle and conformance NSObject)
  {
    type metadata accessor for OS_dispatch_queue(255, (unint64_t *)&lazy cache variable for type metadata for TUHandle);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TUHandle and conformance NSObject);
  }
  return result;
}

uint64_t specialized Sequence.flatMap<A>(_:)(unint64_t a1)
{
  uint64_t v9 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_11;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = _CocoaArrayWrapper.endIndex.getter())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1A624E900](i - 4, a1) : *(id *)(a1 + 8 * i);
      uint64_t v5 = v4;
      uint64_t v6 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      Swift::Int v7 = specialized InternalGroupSessionProvider.groupSessions(for:)(v4);

      specialized Array.append<A>(contentsOf:)(v7);
      if (v6 == v2)
      {
        swift_bridgeObjectRelease();
        return v9;
      }
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E4FBC860];
}

uint64_t specialized _ArrayProtocol.filter(_:)(unint64_t a1)
{
  uint64_t v10 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x1A624E900](v3, a1);
LABEL_9:
        uint64_t v5 = v4;
        unint64_t v6 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_18;
        }
        unint64_t v7 = specialized InternalGroupSessionProvider.groupSessions(for:)(v4);
        if (v7 >> 62) {
          uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
        }
        else {
          uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        if (v8)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        else
        {
        }
        ++v3;
        if (v6 == v2) {
          return v10;
        }
      }
      if (v3 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    id v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x1E4FBC860];
}

uint64_t specialized BackgroundGroupSessionManager.updateShare(_:activityID:)()
{
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Log.default);
  unint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    unint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v3 = 0;
    _os_log_impl(&dword_1A375F000, v1, v2, "Updating CKShare", v3, 2u);
    MEMORY[0x1A624F870](v3, -1, -1);
  }

  lazy protocol witness table accessor for type BackgroundGroupSessionManagerError and conformance BackgroundGroupSessionManagerError();
  swift_allocError();
  *id v4 = 5;
  return swift_willThrow();
}

uint64_t partial apply for closure #2 in BackgroundGroupSessionManager.updateProviders(for:)(uint64_t a1, uint64_t a2)
{
  return closure #2 in BackgroundGroupSessionManager.updateProviders(for:)(a1, a2, v2);
}

uint64_t specialized BackgroundGroupSessionManager.didDisconnect(client:)()
{
  v1[7] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest)?);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  v1[10] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for UUID();
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  v1[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: GroupSessionProviderObserver)?);
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  return MEMORY[0x1F4188298](specialized BackgroundGroupSessionManager.didDisconnect(client:), v0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void (**v27)(uint64_t, void, uint64_t, uint64_t);
  unsigned int (**v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  void (*v30)(void, uint64_t, uint64_t, void);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  void (*v40)(uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  void *v43;
  int64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  int64_t v61;
  int64_t v62;
  uint64_t v63;
  unint64_t v64;
  int64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  char v75;
  NSObject *v76;
  os_log_type_t v77;
  BOOL v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  int64_t v86;
  uint64_t (*v87)(void);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(uint64_t, uint64_t, uint64_t);
  NSObject *v93;
  os_log_type_t v94;
  BOOL v95;
  uint64_t v96;
  uint64_t v97;
  void (**v98)(uint64_t, uint64_t);
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  void (*v103)(uint64_t, uint64_t);
  uint64_t ObjectType;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void (*v113)(uint64_t, unint64_t, uint64_t);
  int64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;

  v116 = v0;
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  unint64_t v1 = type metadata accessor for Logger();
  *(void *)(v0 + 192) = __swift_project_value_buffer(v1, (uint64_t)static Log.default);
  uint64_t v2 = Logger.logObject.getter();
  unint64_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A375F000, v2, v3, "Disconnected", v4, 2u);
    MEMORY[0x1A624F870](v4, -1, -1);
  }
  uint64_t v5 = *(void *)(v0 + 56);

  swift_beginAccess();
  unint64_t v6 = *(void *)(v5 + 136);
  *(void *)(v0 + 200) = v6;
  unint64_t v7 = *(unsigned char *)(v6 + 32);
  *(unsigned char *)(v0 + 384) = v7;
  uint64_t v8 = -1;
  uint64_t v9 = -1 << v7;
  if (-(-1 << v7) < 64) {
    uint64_t v8 = ~(-1 << -(char)(-1 << v7));
  }
  uint64_t v10 = v8 & *(void *)(v6 + 64);
  uint64_t v11 = MEMORY[0x1E4FBC860];
  *(void *)(v0 + 208) = MEMORY[0x1E4FBC868];
  *(void *)(v0 + 216) = v11;
  swift_bridgeObjectRetain();
  if (v10)
  {
    uint64_t v12 = 0;
    unint64_t v13 = __clz(__rbit64(v10));
    uint64_t v14 = (v10 - 1) & v10;
LABEL_9:
    uint64_t v15 = *(void *)(v0 + 176);
    (*(void (**)(uint64_t, unint64_t, void))(*(void *)(v0 + 96) + 16))(v15, *(void *)(v6 + 48) + *(void *)(*(void *)(v0 + 96) + 72) * v13, *(void *)(v0 + 88));
    uint64_t v16 = *(void *)(v6 + 56);
    id v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: GroupSessionProviderObserver));
    *(void *)(v15 + *(int *)(v17 + 48)) = *(void *)(v16 + 8 * v13);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 0, 1, v17);
    swift_retain();
    goto LABEL_16;
  }
  uint64_t v18 = 63 - v9;
  if ((unint64_t)(63 - v9) <= 0x7F)
  {
    uint64_t v12 = 0;
  }
  else
  {
    unint64_t v19 = *(void *)(v6 + 72);
    if (v19)
    {
      uint64_t v12 = 1;
LABEL_13:
      uint64_t v14 = (v19 - 1) & v19;
      unint64_t v13 = __clz(__rbit64(v19)) + (v12 << 6);
      goto LABEL_9;
    }
    if (v18 < 0xC0)
    {
      uint64_t v12 = 1;
    }
    else
    {
      unint64_t v19 = *(void *)(v6 + 80);
      if (v19)
      {
        uint64_t v12 = 2;
        goto LABEL_13;
      }
      if (v18 < 0x100)
      {
        uint64_t v12 = 2;
      }
      else
      {
        unint64_t v19 = *(void *)(v6 + 88);
        if (v19)
        {
          uint64_t v12 = 3;
          goto LABEL_13;
        }
        if (v18 < 0x140)
        {
LABEL_81:
          uint64_t v12 = 3;
        }
        else
        {
          unint64_t v19 = *(void *)(v6 + 96);
          if (v19)
          {
            uint64_t v12 = 4;
            goto LABEL_13;
          }
          v106 = 0;
          v107 = v18 >> 6;
          v108 = 5;
          if (v107 > 5) {
            v108 = v107;
          }
          v109 = v108 - 5;
          while (v109 != v106)
          {
            unint64_t v19 = *(void *)(v6 + 104 + 8 * v106++);
            if (v19)
            {
              uint64_t v12 = v106 + 4;
              goto LABEL_13;
            }
          }
          uint64_t v12 = v107 - 1;
        }
      }
    }
  }
  uint64_t v20 = *(void *)(v0 + 176);
  unint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: GroupSessionProviderObserver));
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 1, 1, v21);
  uint64_t v14 = 0;
LABEL_16:
  *(void *)(v0 + 224) = v12;
  *(void *)(v0 + 232) = v14;
  uint64_t v22 = *(void *)(v0 + 184);
  outlined init with take of Date?(*(void *)(v0 + 176), v22, &demangling cache variable for type metadata for (key: UUID, value: GroupSessionProviderObserver)?);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: GroupSessionProviderObserver));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 48))(v22, 1, v23) == 1)
  {
    swift_release();
    uint64_t v24 = *(void *)(v11 + 16);
    uint64_t v25 = *(void *)(v0 + 96);
    if (v24)
    {
      uint64_t v26 = v11 + ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80));
      v111 = *(void *)(v25 + 72);
      v113 = *(void (**)(uint64_t, unint64_t, uint64_t))(v25 + 16);
      uint64_t v27 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v25 + 56);
      uint64_t v28 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48);
      swift_bridgeObjectRetain();
      while (1)
      {
        uint64_t v11 = *(void *)(v0 + 88);
        uint64_t v29 = *(void *)(v0 + 80);
        v113(v29, v26, v11);
        uint64_t v30 = *v27;
        (*v27)(v29, 0, 1, v11);
        if ((*v28)(v29, 1, v11) == 1) {
          break;
        }
        uint64_t v11 = *(void *)(v0 + 152);
        uint64_t v31 = *(void *)(v0 + 88);
        unint64_t v32 = *(void *)(v0 + 96);
        char v33 = *(void *)(v0 + 56);
        (*(void (**)(uint64_t, void, uint64_t))(v32 + 32))(v11, *(void *)(v0 + 80), v31);
        invalidateProvider #1 (id:) in BackgroundGroupSessionManager.didDisconnect(client:)(v11, v33);
        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v11, v31);
        v26 += v111;
        if (!--v24) {
          goto LABEL_26;
        }
      }
    }
    else
    {
      uint64_t v30 = *(void (**)(void, uint64_t, uint64_t, void))(v25 + 56);
      swift_bridgeObjectRetain();
LABEL_26:
      v30(*(void *)(v0 + 80), 1, 1, *(void *)(v0 + 88));
    }
    swift_bridgeObjectRelease_n();
    uint64_t v45 = 0;
    uint64_t v46 = MEMORY[0x1E4FBC868];
    uint64_t v47 = *(unsigned char *)(MEMORY[0x1E4FBC868] + 32);
    *(unsigned char *)(v0 + 385) = v47;
    uint64_t v48 = 1 << v47;
    if (v48 < 64) {
      uint64_t v49 = ~(-1 << v48);
    }
    else {
      uint64_t v49 = -1;
    }
    v50 = v49 & *(void *)(v46 + 64);
    while (!v50)
    {
      v61 = v45 + 1;
      if (__OFADD__(v45, 1))
      {
        __break(1u);
        goto LABEL_81;
      }
      v62 = (unint64_t)((1 << *(unsigned char *)(v0 + 385)) + 63) >> 6;
      if (v61 >= v62)
      {
        v65 = v45;
      }
      else
      {
        v55 = *(void *)(v0 + 208);
        v63 = v55 + 64;
        v64 = *(void *)(v55 + 64 + 8 * v61);
        if (v64) {
          goto LABEL_39;
        }
        v65 = v45 + 1;
        if (v45 + 2 < v62)
        {
          v64 = *(void *)(v63 + 8 * (v45 + 2));
          if (v64)
          {
            v61 = v45 + 2;
            goto LABEL_39;
          }
          v65 = v45 + 2;
          if (v45 + 3 < v62)
          {
            v64 = *(void *)(v63 + 8 * (v45 + 3));
            if (v64)
            {
              v61 = v45 + 3;
LABEL_39:
              v50 = (v64 - 1) & v64;
              v54 = __clz(__rbit64(v64)) + (v61 << 6);
              uint64_t v45 = v61;
LABEL_35:
              v56 = *(void *)(v0 + 64);
              (*(void (**)(uint64_t, unint64_t, void))(*(void *)(v0 + 96) + 16))(v56, *(void *)(v55 + 48) + *(void *)(*(void *)(v0 + 96) + 72) * v54, *(void *)(v0 + 88));
              v57 = *(void *)(v55 + 56);
              v58 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest));
              v59 = *(void **)(v57 + 8 * v54);
              *(void *)(v56 + *(int *)(v58 + 48)) = v59;
              (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v56, 0, 1, v58);
              v60 = v59;
              goto LABEL_42;
            }
            v61 = v45 + 4;
            v65 = v45 + 3;
            if (v45 + 4 < v62)
            {
              v64 = *(void *)(v63 + 8 * v61);
              if (v64) {
                goto LABEL_39;
              }
              v65 = v62 - 1;
              v86 = v62 - 5;
              while (v86 != v45)
              {
                v64 = *(void *)(v55 + 104 + 8 * v45++);
                if (v64)
                {
                  v61 = v45 + 4;
                  goto LABEL_39;
                }
              }
            }
          }
        }
      }
      v66 = *(void *)(v0 + 64);
      v67 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest));
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v66, 1, 1, v67);
      v50 = 0;
      uint64_t v45 = v65;
LABEL_42:
      *(void *)(v0 + 304) = v45;
      *(void *)(v0 + 312) = v50;
      v68 = *(void *)(v0 + 72);
      outlined init with take of Date?(*(void *)(v0 + 64), v68, &demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest)?);
      v69 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest));
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v69 - 8) + 48))(v68, 1, v69) == 1)
      {
        swift_release();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        v87 = *(uint64_t (**)(void))(v0 + 8);
        return v87();
      }
      v70 = *(void *)(v0 + 144);
      v71 = *(void *)(v0 + 96);
      v72 = *(void *)(v0 + 56);
      v73 = *(void **)(*(void *)(v0 + 72) + *(int *)(v69 + 48));
      *(void *)(v0 + 320) = v73;
      (*(void (**)(uint64_t))(v71 + 32))(v70);
      if (*(void *)(*(void *)(v72 + 136) + 16))
      {
        v74 = *(void *)(v0 + 144);
        swift_bridgeObjectRetain();
        specialized __RawDictionaryStorage.find<A>(_:)(v74);
        if (v75)
        {
          v89 = *(void *)(v0 + 136);
          v88 = *(void *)(v0 + 144);
          v90 = *(void *)(v0 + 88);
          v91 = *(void *)(v0 + 96);
          swift_bridgeObjectRelease();
          v92 = *(void (**)(uint64_t, uint64_t, uint64_t))(v91 + 16);
          *(void *)(v0 + 328) = v92;
          *(void *)(v0 + 336) = (v91 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
          v92(v89, v88, v90);
          v93 = Logger.logObject.getter();
          v94 = static os_log_type_t.default.getter();
          v95 = os_log_type_enabled(v93, v94);
          v96 = *(void *)(v0 + 136);
          v97 = *(void *)(v0 + 88);
          v98 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 96) + 8);
          if (v95)
          {
            v99 = swift_slowAlloc();
            v100 = swift_slowAlloc();
            v115 = v100;
            *(_DWORD *)v99 = 136315138;
            _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_4((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, 255, MEMORY[0x1E4F27990]);
            v101 = dispatch thunk of CustomStringConvertible.description.getter();
            *(void *)(v99 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v101, v102, &v115);
            swift_bridgeObjectRelease();
            v103 = *v98;
            (*v98)(v96, v97);
            _os_log_impl(&dword_1A375F000, v93, v94, "Attempting to recover providerID: %s", (uint8_t *)v99, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1A624F870](v100, -1, -1);
            MEMORY[0x1A624F870](v99, -1, -1);
          }
          else
          {
            v103 = *v98;
            (*v98)(*(void *)(v0 + 136), *(void *)(v0 + 88));
          }

          *(void *)(v0 + 344) = v103;
          uint64_t ObjectType = swift_getObjectType();
          v105 = (void *)swift_task_alloc();
          *(void *)(v0 + 352) = v105;
          *v105 = v0;
          v105[1] = specialized BackgroundGroupSessionManager.didDisconnect(client:);
          return MEMORY[0x1F4113750](v73, ObjectType);
        }
        swift_bridgeObjectRelease();
      }
      v112 = v73;
      v114 = v45;
      (*(void (**)(void, void, void))(*(void *)(v0 + 96) + 16))(*(void *)(v0 + 120), *(void *)(v0 + 144), *(void *)(v0 + 88));
      v76 = Logger.logObject.getter();
      v77 = static os_log_type_t.default.getter();
      v78 = os_log_type_enabled(v76, v77);
      v79 = *(void *)(v0 + 144);
      uint64_t v11 = *(void *)(v0 + 120);
      v81 = *(void *)(v0 + 88);
      v80 = *(void *)(v0 + 96);
      if (v78)
      {
        v110 = *(void *)(v0 + 144);
        v82 = swift_slowAlloc();
        v83 = swift_slowAlloc();
        v115 = v83;
        *(_DWORD *)v82 = 136315138;
        _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_4((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, 255, MEMORY[0x1E4F27990]);
        v84 = dispatch thunk of CustomStringConvertible.description.getter();
        *(void *)(v82 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v84, v85, &v115);
        swift_bridgeObjectRelease();
        v51 = *(void (**)(uint64_t, uint64_t))(v80 + 8);
        v51(v11, v81);
        swift_arrayDestroy();
        MEMORY[0x1A624F870](v83, -1, -1);
        MEMORY[0x1A624F870](v82, -1, -1);

        v52 = v110;
      }
      else
      {

        v51 = *(void (**)(uint64_t, uint64_t))(v80 + 8);
        v51(v11, v81);
        v52 = v79;
      }
      v51(v52, v81);
      uint64_t v45 = v114;
    }
    v53 = __clz(__rbit64(v50));
    v50 &= v50 - 1;
    v54 = v53 | (v45 << 6);
    v55 = *(void *)(v0 + 208);
    goto LABEL_35;
  }
  uint64_t v35 = *(void *)(v0 + 160);
  unint64_t v34 = *(void *)(v0 + 168);
  uint64_t v36 = *(void *)(v0 + 88);
  v37 = *(void *)(v0 + 96);
  uint64_t v38 = *(void *)(*(void *)(v0 + 184) + *(int *)(v23 + 48));
  *(void *)(v0 + 240) = v38;
  uint64_t v39 = *(void (**)(uint64_t))(v37 + 32);
  *(void *)(v0 + 248) = v39;
  *(void *)(v0 + 256) = (v37 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
  v39(v34);
  uint64_t v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16);
  *(void *)(v0 + 264) = v40;
  *(void *)(v0 + 272) = (v37 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v40(v35, v34, v36);
  uint64_t v41 = *(void *)(v38 + 40);
  uint64_t v42 = swift_getObjectType();
  uint64_t v43 = (void *)swift_task_alloc();
  *(void *)(v0 + 280) = v43;
  char *v43 = v0;
  v43[1] = specialized BackgroundGroupSessionManager.didDisconnect(client:);
  return GroupSessionProvider.backgroundSessionCreationRequest.getter(v42, v41);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (**v33)(uint64_t, void, uint64_t, uint64_t);
  unsigned int (**v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  void (*v37)(void, uint64_t, uint64_t, void);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t);
  void (*v48)(uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  void *v51;
  int64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  void (*v58)(uint64_t, uint64_t);
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  int64_t v68;
  int64_t v69;
  uint64_t v70;
  unint64_t v71;
  int64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  char v82;
  NSObject *v83;
  os_log_type_t v84;
  BOOL v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  int64_t v94;
  uint64_t (*v95)(void);
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void (*v100)(uint64_t, uint64_t, uint64_t);
  NSObject *v101;
  os_log_type_t v102;
  BOOL v103;
  uint64_t v104;
  uint64_t v105;
  void (**v106)(uint64_t, uint64_t);
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  void (*v111)(uint64_t, uint64_t);
  uint64_t ObjectType;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void (*v118)(uint64_t, uint64_t, uint64_t);
  int64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;

  v121 = v0;
  unint64_t v1 = *(void *)(v0 + 296);
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v4 = *(void *)(v0 + 160);
  unint64_t v3 = *(void *)(v0 + 168);
  uint64_t v5 = *(void *)(v0 + 88);
  unint64_t v6 = *(void *)(v0 + 96);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v120 = v2;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v1, v4, isUniquelyReferenced_nonNull_native);
  uint64_t v8 = v2;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v9(v4, v5);
  swift_release();
  uint64_t v10 = ((uint64_t (*)(uint64_t, uint64_t))v9)(v3, v5);
  unint64_t v13 = *(void *)(v0 + 224);
  uint64_t v12 = *(void *)(v0 + 232);
  uint64_t v14 = *(void *)(v0 + 216);
  *(void *)(v0 + 208) = v2;
  if (!v12)
  {
    unint64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
      return MEMORY[0x1F4113750](v10, v11);
    }
    uint64_t v22 = (unint64_t)((1 << *(unsigned char *)(v0 + 384)) + 63) >> 6;
    if (v21 < v22)
    {
      id v17 = *(void *)(v0 + 200);
      uint64_t v23 = v17 + 64;
      uint64_t v24 = *(void *)(v17 + 64 + 8 * v21);
      if (v24)
      {
LABEL_7:
        uint64_t v15 = (v24 - 1) & v24;
        uint64_t v16 = __clz(__rbit64(v24)) + (v21 << 6);
        unint64_t v13 = v21;
        goto LABEL_3;
      }
      uint64_t v25 = v13 + 2;
      ++v13;
      if (v21 + 1 < v22)
      {
        uint64_t v24 = *(void *)(v23 + 8 * v25);
        if (v24)
        {
LABEL_10:
          unint64_t v21 = v25;
          goto LABEL_7;
        }
        unint64_t v13 = v21 + 1;
        if (v21 + 2 < v22)
        {
          uint64_t v24 = *(void *)(v23 + 8 * (v21 + 2));
          if (v24)
          {
            v21 += 2;
            goto LABEL_7;
          }
          uint64_t v25 = v21 + 3;
          unint64_t v13 = v21 + 2;
          if (v21 + 3 < v22)
          {
            uint64_t v24 = *(void *)(v23 + 8 * v25);
            if (v24) {
              goto LABEL_10;
            }
            while (1)
            {
              unint64_t v21 = v25 + 1;
              if (__OFADD__(v25, 1)) {
                goto LABEL_77;
              }
              if (v21 >= v22) {
                break;
              }
              uint64_t v24 = *(void *)(v23 + 8 * v21);
              ++v25;
              if (v24) {
                goto LABEL_7;
              }
            }
            unint64_t v13 = v22 - 1;
          }
        }
      }
    }
    uint64_t v26 = *(void *)(v0 + 176);
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: GroupSessionProviderObserver));
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v26, 1, 1, v27);
    uint64_t v15 = 0;
    goto LABEL_22;
  }
  uint64_t v15 = (v12 - 1) & v12;
  uint64_t v16 = __clz(__rbit64(v12)) | (v13 << 6);
  id v17 = *(void *)(v0 + 200);
LABEL_3:
  uint64_t v18 = *(void *)(v0 + 176);
  (*(void (**)(uint64_t, unint64_t, void))(*(void *)(v0 + 96) + 16))(v18, *(void *)(v17 + 48) + *(void *)(*(void *)(v0 + 96) + 72) * v16, *(void *)(v0 + 88));
  unint64_t v19 = *(void *)(v17 + 56);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: GroupSessionProviderObserver));
  *(void *)(v18 + *(int *)(v20 + 48)) = *(void *)(v19 + 8 * v16);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v18, 0, 1, v20);
  swift_retain();
LABEL_22:
  *(void *)(v0 + 224) = v13;
  *(void *)(v0 + 232) = v15;
  uint64_t v28 = *(void *)(v0 + 184);
  outlined init with take of Date?(*(void *)(v0 + 176), v28, &demangling cache variable for type metadata for (key: UUID, value: GroupSessionProviderObserver)?);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: GroupSessionProviderObserver));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 48))(v28, 1, v29) == 1)
  {
    v114 = v8;
    swift_release();
    uint64_t v30 = *(void *)(v14 + 16);
    uint64_t v31 = *(void *)(v0 + 96);
    if (v30)
    {
      unint64_t v32 = v14 + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80));
      v116 = *(void *)(v31 + 72);
      v118 = *(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16);
      char v33 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v31 + 56);
      unint64_t v34 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48);
      swift_bridgeObjectRetain();
      while (1)
      {
        uint64_t v35 = *(void *)(v0 + 88);
        uint64_t v36 = *(void *)(v0 + 80);
        v118(v36, v32, v35);
        v37 = *v33;
        (*v33)(v36, 0, 1, v35);
        if ((*v34)(v36, 1, v35) == 1) {
          break;
        }
        uint64_t v38 = *(void *)(v0 + 152);
        uint64_t v39 = *(void *)(v0 + 88);
        uint64_t v40 = *(void *)(v0 + 96);
        uint64_t v41 = *(void *)(v0 + 56);
        (*(void (**)(uint64_t, void, uint64_t))(v40 + 32))(v38, *(void *)(v0 + 80), v39);
        invalidateProvider #1 (id:) in BackgroundGroupSessionManager.didDisconnect(client:)(v38, v41);
        (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v38, v39);
        v32 += v116;
        if (!--v30) {
          goto LABEL_32;
        }
      }
    }
    else
    {
      v37 = *(void (**)(void, uint64_t, uint64_t, void))(v31 + 56);
      swift_bridgeObjectRetain();
LABEL_32:
      v37(*(void *)(v0 + 80), 1, 1, *(void *)(v0 + 88));
    }
    uint64_t v10 = swift_bridgeObjectRelease_n();
    v53 = 0;
    v54 = *(unsigned char *)(v114 + 32);
    *(unsigned char *)(v0 + 385) = v54;
    v55 = 1 << v54;
    if (v55 < 64) {
      v56 = ~(-1 << v55);
    }
    else {
      v56 = -1;
    }
    v57 = v56 & *(void *)(v114 + 64);
    while (!v57)
    {
      v68 = v53 + 1;
      if (__OFADD__(v53, 1))
      {
        __break(1u);
        goto LABEL_76;
      }
      v69 = (unint64_t)((1 << *(unsigned char *)(v0 + 385)) + 63) >> 6;
      if (v68 >= v69)
      {
        v72 = v53;
      }
      else
      {
        v62 = *(void *)(v0 + 208);
        v70 = v62 + 64;
        v71 = *(void *)(v62 + 64 + 8 * v68);
        if (v71) {
          goto LABEL_45;
        }
        v72 = v53 + 1;
        if (v53 + 2 < v69)
        {
          v71 = *(void *)(v70 + 8 * (v53 + 2));
          if (v71)
          {
            v68 = v53 + 2;
            goto LABEL_45;
          }
          v72 = v53 + 2;
          if (v53 + 3 < v69)
          {
            v71 = *(void *)(v70 + 8 * (v53 + 3));
            if (v71)
            {
              v68 = v53 + 3;
LABEL_45:
              v57 = (v71 - 1) & v71;
              v61 = __clz(__rbit64(v71)) + (v68 << 6);
              v53 = v68;
LABEL_41:
              v63 = *(void *)(v0 + 64);
              (*(void (**)(uint64_t, unint64_t, void))(*(void *)(v0 + 96) + 16))(v63, *(void *)(v62 + 48) + *(void *)(*(void *)(v0 + 96) + 72) * v61, *(void *)(v0 + 88));
              v64 = *(void *)(v62 + 56);
              v65 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest));
              v66 = *(void **)(v64 + 8 * v61);
              *(void *)(v63 + *(int *)(v65 + 48)) = v66;
              (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v63, 0, 1, v65);
              v67 = v66;
              goto LABEL_48;
            }
            v68 = v53 + 4;
            v72 = v53 + 3;
            if (v53 + 4 < v69)
            {
              v71 = *(void *)(v70 + 8 * v68);
              if (v71) {
                goto LABEL_45;
              }
              v72 = v69 - 1;
              v94 = v69 - 5;
              while (v94 != v53)
              {
                v71 = *(void *)(v62 + 104 + 8 * v53++);
                if (v71)
                {
                  v68 = v53 + 4;
                  goto LABEL_45;
                }
              }
            }
          }
        }
      }
      v73 = *(void *)(v0 + 64);
      v74 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest));
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 56))(v73, 1, 1, v74);
      v57 = 0;
      v53 = v72;
LABEL_48:
      *(void *)(v0 + 304) = v53;
      *(void *)(v0 + 312) = v57;
      v75 = *(void *)(v0 + 72);
      outlined init with take of Date?(*(void *)(v0 + 64), v75, &demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest)?);
      v76 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest));
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v76 - 8) + 48))(v75, 1, v76) == 1)
      {
        swift_release();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        v95 = *(uint64_t (**)(void))(v0 + 8);
        return v95();
      }
      v77 = *(void *)(v0 + 144);
      v78 = *(void *)(v0 + 96);
      v79 = *(void *)(v0 + 56);
      v80 = *(void **)(*(void *)(v0 + 72) + *(int *)(v76 + 48));
      *(void *)(v0 + 320) = v80;
      (*(void (**)(uint64_t))(v78 + 32))(v77);
      if (*(void *)(*(void *)(v79 + 136) + 16))
      {
        v81 = *(void *)(v0 + 144);
        swift_bridgeObjectRetain();
        specialized __RawDictionaryStorage.find<A>(_:)(v81);
        if (v82)
        {
          v97 = *(void *)(v0 + 136);
          v96 = *(void *)(v0 + 144);
          v98 = *(void *)(v0 + 88);
          v99 = *(void *)(v0 + 96);
          swift_bridgeObjectRelease();
          v100 = *(void (**)(uint64_t, uint64_t, uint64_t))(v99 + 16);
          *(void *)(v0 + 328) = v100;
          *(void *)(v0 + 336) = (v99 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
          v100(v97, v96, v98);
          v101 = Logger.logObject.getter();
          v102 = static os_log_type_t.default.getter();
          v103 = os_log_type_enabled(v101, v102);
          v104 = *(void *)(v0 + 136);
          v105 = *(void *)(v0 + 88);
          v106 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 96) + 8);
          if (v103)
          {
            v107 = swift_slowAlloc();
            v108 = swift_slowAlloc();
            v120 = v108;
            *(_DWORD *)v107 = 136315138;
            _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_4((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, 255, MEMORY[0x1E4F27990]);
            v109 = dispatch thunk of CustomStringConvertible.description.getter();
            *(void *)(v107 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v109, v110, &v120);
            swift_bridgeObjectRelease();
            v111 = *v106;
            (*v106)(v104, v105);
            _os_log_impl(&dword_1A375F000, v101, v102, "Attempting to recover providerID: %s", (uint8_t *)v107, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1A624F870](v108, -1, -1);
            MEMORY[0x1A624F870](v107, -1, -1);
          }
          else
          {
            v111 = *v106;
            (*v106)(*(void *)(v0 + 136), *(void *)(v0 + 88));
          }

          *(void *)(v0 + 344) = v111;
          uint64_t ObjectType = swift_getObjectType();
          v113 = (void *)swift_task_alloc();
          *(void *)(v0 + 352) = v113;
          *v113 = v0;
          v113[1] = specialized BackgroundGroupSessionManager.didDisconnect(client:);
          uint64_t v10 = (uint64_t)v80;
          uint64_t v11 = ObjectType;
          return MEMORY[0x1F4113750](v10, v11);
        }
        swift_bridgeObjectRelease();
      }
      v117 = v80;
      v119 = v53;
      (*(void (**)(void, void, void))(*(void *)(v0 + 96) + 16))(*(void *)(v0 + 120), *(void *)(v0 + 144), *(void *)(v0 + 88));
      v83 = Logger.logObject.getter();
      v84 = static os_log_type_t.default.getter();
      v85 = os_log_type_enabled(v83, v84);
      v86 = *(void *)(v0 + 144);
      v87 = *(void *)(v0 + 120);
      v89 = *(void *)(v0 + 88);
      v88 = *(void *)(v0 + 96);
      if (v85)
      {
        v115 = *(void *)(v0 + 144);
        v90 = swift_slowAlloc();
        v91 = swift_slowAlloc();
        v120 = v91;
        *(_DWORD *)v90 = 136315138;
        _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_4((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, 255, MEMORY[0x1E4F27990]);
        v92 = dispatch thunk of CustomStringConvertible.description.getter();
        *(void *)(v90 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v92, v93, &v120);
        swift_bridgeObjectRelease();
        v58 = *(void (**)(uint64_t, uint64_t))(v88 + 8);
        v58(v87, v89);
        swift_arrayDestroy();
        MEMORY[0x1A624F870](v91, -1, -1);
        MEMORY[0x1A624F870](v90, -1, -1);

        v59 = v115;
      }
      else
      {

        v58 = *(void (**)(uint64_t, uint64_t))(v88 + 8);
        v58(v87, v89);
        v59 = v86;
      }
      uint64_t v10 = ((uint64_t (*)(uint64_t, uint64_t))v58)(v59, v89);
      v53 = v119;
    }
    v60 = __clz(__rbit64(v57));
    v57 &= v57 - 1;
    v61 = v60 | (v53 << 6);
    v62 = *(void *)(v0 + 208);
    goto LABEL_41;
  }
  uint64_t v43 = *(void *)(v0 + 160);
  uint64_t v42 = *(void *)(v0 + 168);
  uint64_t v44 = *(void *)(v0 + 88);
  uint64_t v45 = *(void *)(v0 + 96);
  uint64_t v46 = *(void *)(*(void *)(v0 + 184) + *(int *)(v29 + 48));
  *(void *)(v0 + 240) = v46;
  uint64_t v47 = *(void (**)(uint64_t))(v45 + 32);
  *(void *)(v0 + 248) = v47;
  *(void *)(v0 + 256) = (v45 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
  v47(v42);
  uint64_t v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16);
  *(void *)(v0 + 264) = v48;
  *(void *)(v0 + 272) = (v45 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v48(v43, v42, v44);
  uint64_t v49 = *(void *)(v46 + 40);
  v50 = swift_getObjectType();
  v51 = (void *)swift_task_alloc();
  *(void *)(v0 + 280) = v51;
  *v51 = v0;
  v51[1] = specialized BackgroundGroupSessionManager.didDisconnect(client:);
  return GroupSessionProvider.backgroundSessionCreationRequest.getter(v50, v49);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v2 = *v1;
  *(void *)(*v1 + 360) = v0;
  swift_task_dealloc();
  unint64_t v3 = *(void *)(v2 + 56);
  if (v0) {
    uint64_t v4 = specialized BackgroundGroupSessionManager.didDisconnect(client:);
  }
  else {
    uint64_t v4 = specialized BackgroundGroupSessionManager.didDisconnect(client:);
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  BOOL v3;
  void (*v4)(uint64_t, uint64_t);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)();
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  int64_t v29;
  int64_t v30;
  uint64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  char v43;
  NSObject *v44;
  os_log_type_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  int64_t v55;
  uint64_t (*v56)(void);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t, uint64_t);
  NSObject *v63;
  os_log_type_t v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  void (**v68)(uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  void (*v73)(uint64_t, uint64_t);
  uint64_t ObjectType;
  void *v75;
  int v76;
  uint64_t v77;
  void *v78;
  int64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v81 = v0;
  (*(void (**)(void, void, void))(v0 + 328))(*(void *)(v0 + 128), *(void *)(v0 + 144), *(void *)(v0 + 88));
  unint64_t v1 = Logger.logObject.getter();
  uint64_t v2 = static os_log_type_t.default.getter();
  unint64_t v3 = os_log_type_enabled(v1, v2);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
  uint64_t v5 = *(void **)(v0 + 320);
  unint64_t v6 = *(void *)(v0 + 144);
  unint64_t v7 = *(void *)(v0 + 128);
  uint64_t v8 = *(void *)(v0 + 88);
  uint64_t v9 = objc_retain_x21;
  if (v3)
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    v80 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_4((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, 255, MEMORY[0x1E4F27990]);
    uint64_t v12 = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)(v10 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, &v80);
    swift_bridgeObjectRelease();
    v4(v7, v8);
    _os_log_impl(&dword_1A375F000, v1, v2, "Recovered providerID: %s", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    uint64_t v14 = v11;
    uint64_t v9 = objc_retain_x21;
    MEMORY[0x1A624F870](v14, -1, -1);
    MEMORY[0x1A624F870](v10, -1, -1);

    uint64_t v15 = ((uint64_t (*)(uint64_t, uint64_t))v4)(v6, v8);
  }
  else
  {

    v4(v7, v8);
    v4(v6, v8);
  }
  id v17 = *(void *)(v0 + 304);
  uint64_t v18 = *(void *)(v0 + 312);
  v76 = *((void *)v9 + 368);
  while (1)
  {
    if (v18)
    {
      unint64_t v21 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      uint64_t v22 = v21 | (v17 << 6);
      uint64_t v23 = *(void *)(v0 + 208);
LABEL_9:
      uint64_t v24 = *(void *)(v0 + 64);
      (*(void (**)(uint64_t, unint64_t, void))(*(void *)(v0 + 96) + 16))(v24, *(void *)(v23 + 48) + *(void *)(*(void *)(v0 + 96) + 72) * v22, *(void *)(v0 + 88));
      uint64_t v25 = *(void *)(v23 + 56);
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest));
      uint64_t v27 = *(void **)(v25 + 8 * v22);
      *(void *)(v24 + *(int *)(v26 + 48)) = v27;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v24, 0, 1, v26);
      uint64_t v28 = v27;
      goto LABEL_16;
    }
    uint64_t v29 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
      __break(1u);
      return MEMORY[0x1F4113750](v15, v16);
    }
    uint64_t v30 = (unint64_t)((1 << *(unsigned char *)(v0 + 385)) + 63) >> 6;
    if (v29 >= v30)
    {
      char v33 = v17;
    }
    else
    {
      uint64_t v23 = *(void *)(v0 + 208);
      uint64_t v31 = v23 + 64;
      unint64_t v32 = *(void *)(v23 + 64 + 8 * v29);
      if (v32) {
        goto LABEL_13;
      }
      char v33 = v17 + 1;
      if (v17 + 2 < v30)
      {
        unint64_t v32 = *(void *)(v31 + 8 * (v17 + 2));
        if (v32)
        {
          uint64_t v29 = v17 + 2;
LABEL_13:
          uint64_t v18 = (v32 - 1) & v32;
          uint64_t v22 = __clz(__rbit64(v32)) + (v29 << 6);
          id v17 = v29;
          goto LABEL_9;
        }
        char v33 = v17 + 2;
        if (v17 + 3 < v30)
        {
          unint64_t v32 = *(void *)(v31 + 8 * (v17 + 3));
          if (v32)
          {
            uint64_t v29 = v17 + 3;
            goto LABEL_13;
          }
          uint64_t v29 = v17 + 4;
          char v33 = v17 + 3;
          if (v17 + 4 < v30)
          {
            unint64_t v32 = *(void *)(v31 + 8 * v29);
            if (v32) {
              goto LABEL_13;
            }
            char v33 = v30 - 1;
            v55 = v30 - 5;
            while (v55 != v17)
            {
              unint64_t v32 = *(void *)(v23 + 104 + 8 * v17++);
              if (v32)
              {
                uint64_t v29 = v17 + 4;
                goto LABEL_13;
              }
            }
          }
        }
      }
    }
    unint64_t v34 = *(void *)(v0 + 64);
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest));
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v34, 1, 1, v35);
    uint64_t v18 = 0;
    id v17 = v33;
LABEL_16:
    *(void *)(v0 + 304) = v17;
    *(void *)(v0 + 312) = v18;
    uint64_t v36 = *(void *)(v0 + 72);
    outlined init with take of Date?(*(void *)(v0 + 64), v36, &demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest)?);
    v37 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest));
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 48))(v36, 1, v37) == 1) {
      break;
    }
    uint64_t v38 = *(void *)(v0 + 144);
    uint64_t v39 = *(void *)(v0 + 96);
    uint64_t v40 = *(void *)(v0 + 56);
    uint64_t v41 = *(void **)(*(void *)(v0 + 72) + *(int *)(v37 + 48));
    *(void *)(v0 + 320) = v41;
    (*(void (**)(uint64_t))(v39 + 32))(v38);
    if (*(void *)(*(void *)(v40 + 136) + 16))
    {
      uint64_t v42 = *(void *)(v0 + 144);
      swift_bridgeObjectRetain();
      specialized __RawDictionaryStorage.find<A>(_:)(v42);
      if (v43)
      {
        v59 = *(void *)(v0 + 136);
        v58 = *(void *)(v0 + 144);
        v60 = *(void *)(v0 + 88);
        v61 = *(void *)(v0 + 96);
        swift_bridgeObjectRelease();
        v62 = *(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 16);
        *(void *)(v0 + 328) = v62;
        *(void *)(v0 + 336) = (v61 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
        v62(v59, v58, v60);
        v63 = Logger.logObject.getter();
        v64 = static os_log_type_t.default.getter();
        v65 = os_log_type_enabled(v63, v64);
        v66 = *(void *)(v0 + 136);
        v67 = *(void *)(v0 + 88);
        v68 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 96) + 8);
        if (v65)
        {
          v69 = swift_slowAlloc();
          v70 = swift_slowAlloc();
          v80 = v70;
          *(_DWORD *)v69 = v76;
          _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_4((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, 255, MEMORY[0x1E4F27990]);
          v71 = dispatch thunk of CustomStringConvertible.description.getter();
          *(void *)(v69 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v71, v72, &v80);
          swift_bridgeObjectRelease();
          v73 = *v68;
          (*v68)(v66, v67);
          _os_log_impl(&dword_1A375F000, v63, v64, "Attempting to recover providerID: %s", (uint8_t *)v69, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1A624F870](v70, -1, -1);
          MEMORY[0x1A624F870](v69, -1, -1);
        }
        else
        {
          v73 = *v68;
          (*v68)(*(void *)(v0 + 136), *(void *)(v0 + 88));
        }

        *(void *)(v0 + 344) = v73;
        uint64_t ObjectType = swift_getObjectType();
        v75 = (void *)swift_task_alloc();
        *(void *)(v0 + 352) = v75;
        *v75 = v0;
        v75[1] = specialized BackgroundGroupSessionManager.didDisconnect(client:);
        uint64_t v15 = (uint64_t)v41;
        uint64_t v16 = ObjectType;
        return MEMORY[0x1F4113750](v15, v16);
      }
      swift_bridgeObjectRelease();
    }
    v78 = v41;
    v79 = v17;
    (*(void (**)(void, void, void))(*(void *)(v0 + 96) + 16))(*(void *)(v0 + 120), *(void *)(v0 + 144), *(void *)(v0 + 88));
    uint64_t v44 = Logger.logObject.getter();
    uint64_t v45 = static os_log_type_t.default.getter();
    uint64_t v46 = os_log_type_enabled(v44, v45);
    uint64_t v47 = *(void *)(v0 + 144);
    uint64_t v48 = *(void *)(v0 + 120);
    v50 = *(void *)(v0 + 88);
    uint64_t v49 = *(void *)(v0 + 96);
    if (v46)
    {
      v77 = *(void *)(v0 + 144);
      v51 = swift_slowAlloc();
      v52 = swift_slowAlloc();
      v80 = v52;
      *(_DWORD *)v51 = v76;
      _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_4((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, 255, MEMORY[0x1E4F27990]);
      v53 = dispatch thunk of CustomStringConvertible.description.getter();
      *(void *)(v51 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v53, v54, &v80);
      swift_bridgeObjectRelease();
      unint64_t v19 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
      v19(v48, v50);
      swift_arrayDestroy();
      MEMORY[0x1A624F870](v52, -1, -1);
      MEMORY[0x1A624F870](v51, -1, -1);

      uint64_t v20 = v77;
    }
    else
    {

      unint64_t v19 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
      v19(v48, v50);
      uint64_t v20 = v47;
    }
    uint64_t v15 = ((uint64_t (*)(uint64_t, uint64_t))v19)(v20, v50);
    id v17 = v79;
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v56 = *(uint64_t (**)(void))(v0 + 8);
  return v56();
}

{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  NSObject *v9;
  unint64_t v10;
  unint64_t isa;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;
  uint64_t v32;
  unint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  Class v39;
  uint64_t v40;
  char *v41;
  void (**v42)(uint64_t, void, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  void (*v45)(void, uint64_t, uint64_t, void);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t);
  void (*v56)(uint64_t, uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  void *v59;
  int64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  void (*v66)(uint64_t, uint64_t);
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  int64_t v76;
  int64_t v77;
  uint64_t v78;
  unint64_t v79;
  int64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  char v90;
  os_log_type_t v91;
  BOOL v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  int64_t v101;
  uint64_t (*v102)(void);
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void (*v107)(uint64_t, uint64_t, uint64_t);
  NSObject *v108;
  os_log_type_t v109;
  BOOL v110;
  uint64_t v111;
  uint64_t v112;
  void (**v113)(uint64_t, uint64_t);
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  void (*v118)(uint64_t, uint64_t);
  uint64_t ObjectType;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  void (*v125)(uint64_t, char *, uint64_t);
  int64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;

  v128 = v0;
  swift_retain_n();
  unint64_t v1 = Logger.logObject.getter();
  uint64_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    unint64_t v3 = *(void *)(v0 + 240);
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    v127 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v0 + 48) = v3;
    type metadata accessor for GroupSessionProviderObserver();
    swift_retain();
    unint64_t v6 = String.init<A>(reflecting:)();
    *(void *)(v4 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, &v127);
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_1A375F000, v1, v2, "Failed to re-create TUConversationActivityCreateSessionRequest for providerManager: %s", (uint8_t *)v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A624F870](v5, -1, -1);
    MEMORY[0x1A624F870](v4, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  (*(void (**)(void, void, void))(v0 + 264))(*(void *)(v0 + 112), *(void *)(v0 + 168), *(void *)(v0 + 88));
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *(NSObject **)(v0 + 216);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
LABEL_82:
  }
    uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, (int64_t)v9[2].isa + 1, 1, (unint64_t)v9);
  isa = (unint64_t)v9[2].isa;
  uint64_t v10 = (unint64_t)v9[3].isa;
  if (isa >= v10 >> 1) {
    uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v10 > 1, isa + 1, 1, (unint64_t)v9);
  }
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 368);
  unint64_t v13 = *(void **)(v0 + 288);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v0 + 248);
  uint64_t v15 = *(void *)(v0 + 168);
  uint64_t v16 = *(void *)(v0 + 112);
  uint64_t v18 = *(void *)(v0 + 88);
  id v17 = *(void *)(v0 + 96);
  v9[2].isa = (Class)(isa + 1);
  v14((char *)v9+ ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80))+ *(void *)(v17 + 72) * isa, v16, v18);

  swift_release();
  unint64_t v19 = v12(v15, v18);
  unint64_t v21 = *(void *)(v0 + 208);
  uint64_t v23 = *(void *)(v0 + 224);
  uint64_t v22 = *(void *)(v0 + 232);
  *(void *)(v0 + 216) = v9;
  if (!v22)
  {
    uint64_t v30 = v23 + 1;
    if (__OFADD__(v23, 1))
    {
      __break(1u);
LABEL_84:
      __break(1u);
      return MEMORY[0x1F4113750](v19, v20);
    }
    uint64_t v31 = (unint64_t)((1 << *(unsigned char *)(v0 + 384)) + 63) >> 6;
    if (v30 < v31)
    {
      uint64_t v26 = *(void *)(v0 + 200);
      unint64_t v32 = v26 + 64;
      char v33 = *(void *)(v26 + 64 + 8 * v30);
      if (v33)
      {
LABEL_13:
        uint64_t v24 = (v33 - 1) & v33;
        uint64_t v25 = __clz(__rbit64(v33)) + (v30 << 6);
        uint64_t v23 = v30;
        goto LABEL_9;
      }
      unint64_t v34 = v23 + 2;
      ++v23;
      if (v30 + 1 < v31)
      {
        char v33 = *(void *)(v32 + 8 * v34);
        if (v33)
        {
LABEL_16:
          uint64_t v30 = v34;
          goto LABEL_13;
        }
        uint64_t v23 = v30 + 1;
        if (v30 + 2 < v31)
        {
          char v33 = *(void *)(v32 + 8 * (v30 + 2));
          if (v33)
          {
            v30 += 2;
            goto LABEL_13;
          }
          unint64_t v34 = v30 + 3;
          uint64_t v23 = v30 + 2;
          if (v30 + 3 < v31)
          {
            char v33 = *(void *)(v32 + 8 * v34);
            if (v33) {
              goto LABEL_16;
            }
            while (1)
            {
              uint64_t v30 = v34 + 1;
              if (__OFADD__(v34, 1)) {
                goto LABEL_84;
              }
              if (v30 >= v31) {
                break;
              }
              char v33 = *(void *)(v32 + 8 * v30);
              ++v34;
              if (v33) {
                goto LABEL_13;
              }
            }
            uint64_t v23 = v31 - 1;
          }
        }
      }
    }
    uint64_t v35 = *(void *)(v0 + 176);
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: GroupSessionProviderObserver));
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v35, 1, 1, v36);
    uint64_t v24 = 0;
    goto LABEL_28;
  }
  uint64_t v24 = (v22 - 1) & v22;
  uint64_t v25 = __clz(__rbit64(v22)) | (v23 << 6);
  uint64_t v26 = *(void *)(v0 + 200);
LABEL_9:
  uint64_t v27 = *(void *)(v0 + 176);
  (*(void (**)(uint64_t, unint64_t, void))(*(void *)(v0 + 96) + 16))(v27, *(void *)(v26 + 48) + *(void *)(*(void *)(v0 + 96) + 72) * v25, *(void *)(v0 + 88));
  uint64_t v28 = *(void *)(v26 + 56);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: GroupSessionProviderObserver));
  *(void *)(v27 + *(int *)(v29 + 48)) = *(void *)(v28 + 8 * v25);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v27, 0, 1, v29);
  swift_retain();
LABEL_28:
  *(void *)(v0 + 224) = v23;
  *(void *)(v0 + 232) = v24;
  v37 = *(void *)(v0 + 184);
  outlined init with take of Date?(*(void *)(v0 + 176), v37, &demangling cache variable for type metadata for (key: UUID, value: GroupSessionProviderObserver)?);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: GroupSessionProviderObserver));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 48))(v37, 1, v38) == 1)
  {
    v121 = v21;
    swift_release();
    uint64_t v39 = v9[2].isa;
    uint64_t v40 = *(void *)(v0 + 96);
    if (v39)
    {
      uint64_t v41 = (char *)v9 + ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80));
      v123 = *(void *)(v40 + 72);
      v125 = *(void (**)(uint64_t, char *, uint64_t))(v40 + 16);
      uint64_t v42 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v40 + 56);
      uint64_t v9 = (v40 + 48);
      swift_bridgeObjectRetain();
      while (1)
      {
        uint64_t v43 = *(void *)(v0 + 88);
        uint64_t v44 = *(void *)(v0 + 80);
        v125(v44, v41, v43);
        uint64_t v45 = *v42;
        (*v42)(v44, 0, 1, v43);
        if (((unint64_t (*)(uint64_t, uint64_t, uint64_t))v9->isa)(v44, 1, v43) == 1) {
          break;
        }
        uint64_t v46 = *(void *)(v0 + 152);
        uint64_t v47 = *(void *)(v0 + 88);
        uint64_t v48 = *(void *)(v0 + 96);
        uint64_t v49 = *(void *)(v0 + 56);
        (*(void (**)(uint64_t, void, uint64_t))(v48 + 32))(v46, *(void *)(v0 + 80), v47);
        invalidateProvider #1 (id:) in BackgroundGroupSessionManager.didDisconnect(client:)(v46, v49);
        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v46, v47);
        v41 += v123;
        uint64_t v39 = (Class)((char *)v39 - 1);
        if (!v39) {
          goto LABEL_38;
        }
      }
    }
    else
    {
      uint64_t v45 = *(void (**)(void, uint64_t, uint64_t, void))(v40 + 56);
      swift_bridgeObjectRetain();
LABEL_38:
      v45(*(void *)(v0 + 80), 1, 1, *(void *)(v0 + 88));
    }
    swift_bridgeObjectRelease_n();
    v61 = 0;
    v62 = *(unsigned char *)(v121 + 32);
    *(unsigned char *)(v0 + 385) = v62;
    v63 = 1 << v62;
    if (v63 < 64) {
      v64 = ~(-1 << v63);
    }
    else {
      v64 = -1;
    }
    v65 = v64 & *(void *)(v121 + 64);
    while (!v65)
    {
      v76 = v61 + 1;
      if (__OFADD__(v61, 1))
      {
        __break(1u);
        goto LABEL_82;
      }
      v77 = (unint64_t)((1 << *(unsigned char *)(v0 + 385)) + 63) >> 6;
      if (v76 >= v77)
      {
        v80 = v61;
      }
      else
      {
        v70 = *(void *)(v0 + 208);
        v78 = v70 + 64;
        v79 = *(void *)(v70 + 64 + 8 * v76);
        if (v79) {
          goto LABEL_51;
        }
        v80 = v61 + 1;
        if (v61 + 2 < v77)
        {
          v79 = *(void *)(v78 + 8 * (v61 + 2));
          if (v79)
          {
            v76 = v61 + 2;
            goto LABEL_51;
          }
          v80 = v61 + 2;
          if (v61 + 3 < v77)
          {
            v79 = *(void *)(v78 + 8 * (v61 + 3));
            if (v79)
            {
              v76 = v61 + 3;
LABEL_51:
              v65 = (v79 - 1) & v79;
              v69 = __clz(__rbit64(v79)) + (v76 << 6);
              v61 = v76;
LABEL_47:
              v71 = *(void *)(v0 + 64);
              (*(void (**)(uint64_t, unint64_t, void))(*(void *)(v0 + 96) + 16))(v71, *(void *)(v70 + 48) + *(void *)(*(void *)(v0 + 96) + 72) * v69, *(void *)(v0 + 88));
              v72 = *(void *)(v70 + 56);
              v73 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest));
              v74 = *(void **)(v72 + 8 * v69);
              *(void *)(v71 + *(int *)(v73 + 48)) = v74;
              (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56))(v71, 0, 1, v73);
              v75 = v74;
              goto LABEL_54;
            }
            v76 = v61 + 4;
            v80 = v61 + 3;
            if (v61 + 4 < v77)
            {
              v79 = *(void *)(v78 + 8 * v76);
              if (v79) {
                goto LABEL_51;
              }
              v80 = v77 - 1;
              v101 = v77 - 5;
              while (v101 != v61)
              {
                v79 = *(void *)(v70 + 104 + 8 * v61++);
                if (v79)
                {
                  v76 = v61 + 4;
                  goto LABEL_51;
                }
              }
            }
          }
        }
      }
      v81 = *(void *)(v0 + 64);
      v82 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest));
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v82 - 8) + 56))(v81, 1, 1, v82);
      v65 = 0;
      v61 = v80;
LABEL_54:
      *(void *)(v0 + 304) = v61;
      *(void *)(v0 + 312) = v65;
      v83 = *(void *)(v0 + 72);
      outlined init with take of Date?(*(void *)(v0 + 64), v83, &demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest)?);
      v84 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest));
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v84 - 8) + 48))(v83, 1, v84) == 1)
      {
        swift_release();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        v102 = *(uint64_t (**)(void))(v0 + 8);
        return v102();
      }
      v85 = *(void *)(v0 + 144);
      v86 = *(void *)(v0 + 96);
      v87 = *(void *)(v0 + 56);
      v88 = *(void **)(*(void *)(v0 + 72) + *(int *)(v84 + 48));
      *(void *)(v0 + 320) = v88;
      (*(void (**)(uint64_t))(v86 + 32))(v85);
      if (*(void *)(*(void *)(v87 + 136) + 16))
      {
        v89 = *(void *)(v0 + 144);
        swift_bridgeObjectRetain();
        specialized __RawDictionaryStorage.find<A>(_:)(v89);
        if (v90)
        {
          v104 = *(void *)(v0 + 136);
          v103 = *(void *)(v0 + 144);
          v105 = *(void *)(v0 + 88);
          v106 = *(void *)(v0 + 96);
          swift_bridgeObjectRelease();
          v107 = *(void (**)(uint64_t, uint64_t, uint64_t))(v106 + 16);
          *(void *)(v0 + 328) = v107;
          *(void *)(v0 + 336) = (v106 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
          v107(v104, v103, v105);
          v108 = Logger.logObject.getter();
          v109 = static os_log_type_t.default.getter();
          v110 = os_log_type_enabled(v108, v109);
          v111 = *(void *)(v0 + 136);
          v112 = *(void *)(v0 + 88);
          v113 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 96) + 8);
          if (v110)
          {
            v114 = swift_slowAlloc();
            v115 = swift_slowAlloc();
            v127 = v115;
            *(_DWORD *)v114 = 136315138;
            _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_4((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, 255, MEMORY[0x1E4F27990]);
            v116 = dispatch thunk of CustomStringConvertible.description.getter();
            *(void *)(v114 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v116, v117, &v127);
            swift_bridgeObjectRelease();
            v118 = *v113;
            (*v113)(v111, v112);
            _os_log_impl(&dword_1A375F000, v108, v109, "Attempting to recover providerID: %s", (uint8_t *)v114, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1A624F870](v115, -1, -1);
            MEMORY[0x1A624F870](v114, -1, -1);
          }
          else
          {
            v118 = *v113;
            (*v113)(*(void *)(v0 + 136), *(void *)(v0 + 88));
          }

          *(void *)(v0 + 344) = v118;
          uint64_t ObjectType = swift_getObjectType();
          v120 = (void *)swift_task_alloc();
          *(void *)(v0 + 352) = v120;
          *v120 = v0;
          v120[1] = specialized BackgroundGroupSessionManager.didDisconnect(client:);
          unint64_t v19 = (uint64_t)v88;
          uint64_t v20 = ObjectType;
          return MEMORY[0x1F4113750](v19, v20);
        }
        swift_bridgeObjectRelease();
      }
      v124 = v88;
      v126 = v61;
      (*(void (**)(void, void, void))(*(void *)(v0 + 96) + 16))(*(void *)(v0 + 120), *(void *)(v0 + 144), *(void *)(v0 + 88));
      uint64_t v9 = Logger.logObject.getter();
      v91 = static os_log_type_t.default.getter();
      v92 = os_log_type_enabled(v9, v91);
      v93 = *(void *)(v0 + 144);
      v94 = *(void *)(v0 + 120);
      v96 = *(void *)(v0 + 88);
      v95 = *(void *)(v0 + 96);
      if (v92)
      {
        v122 = *(void *)(v0 + 144);
        v97 = swift_slowAlloc();
        v98 = swift_slowAlloc();
        v127 = v98;
        *(_DWORD *)v97 = 136315138;
        _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_4((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, 255, MEMORY[0x1E4F27990]);
        v99 = dispatch thunk of CustomStringConvertible.description.getter();
        *(void *)(v97 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v99, v100, &v127);
        swift_bridgeObjectRelease();
        v66 = *(void (**)(uint64_t, uint64_t))(v95 + 8);
        v66(v94, v96);
        swift_arrayDestroy();
        MEMORY[0x1A624F870](v98, -1, -1);
        MEMORY[0x1A624F870](v97, -1, -1);

        v67 = v122;
      }
      else
      {

        v66 = *(void (**)(uint64_t, uint64_t))(v95 + 8);
        v66(v94, v96);
        v67 = v93;
      }
      v66(v67, v96);
      v61 = v126;
    }
    v68 = __clz(__rbit64(v65));
    v65 &= v65 - 1;
    v69 = v68 | (v61 << 6);
    v70 = *(void *)(v0 + 208);
    goto LABEL_47;
  }
  v51 = *(void *)(v0 + 160);
  v50 = *(void *)(v0 + 168);
  v52 = *(void *)(v0 + 88);
  v53 = *(void *)(v0 + 96);
  v54 = *(void *)(*(void *)(v0 + 184) + *(int *)(v38 + 48));
  *(void *)(v0 + 240) = v54;
  v55 = *(void (**)(uint64_t))(v53 + 32);
  *(void *)(v0 + 248) = v55;
  *(void *)(v0 + 256) = (v53 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
  v55(v50);
  v56 = *(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 16);
  *(void *)(v0 + 264) = v56;
  *(void *)(v0 + 272) = (v53 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v56(v51, v50, v52);
  v57 = *(void *)(v54 + 40);
  v58 = swift_getObjectType();
  v59 = (void *)swift_task_alloc();
  *(void *)(v0 + 280) = v59;
  *v59 = v0;
  v59[1] = specialized BackgroundGroupSessionManager.didDisconnect(client:);
  return GroupSessionProvider.backgroundSessionCreationRequest.getter(v58, v57);
}

{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  unint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  int64_t v36;
  int64_t v37;
  uint64_t v38;
  unint64_t v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  char v50;
  NSObject *v51;
  os_log_type_t v52;
  BOOL v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  int64_t v62;
  uint64_t (*v63)(void);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t, uint64_t);
  NSObject *v70;
  os_log_type_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;
  void (**v75)(uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  void (*v80)(uint64_t, uint64_t);
  uint64_t ObjectType;
  void *v82;
  uint64_t v83;
  void *v84;
  void (*v85)(uint64_t, uint64_t);
  int64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;

  v88 = v0;
  unint64_t v1 = *(void **)(v0 + 360);
  (*(void (**)(void, void, void))(v0 + 328))(*(void *)(v0 + 104), *(void *)(v0 + 144), *(void *)(v0 + 88));
  uint64_t v2 = v1;
  unint64_t v3 = v1;
  uint64_t v4 = Logger.logObject.getter();
  uint64_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    unint64_t v6 = *(void **)(v0 + 360);
    unint64_t v7 = *(void *)(v0 + 104);
    uint64_t v8 = *(void *)(v0 + 88);
    v85 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    v87 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_4((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, 255, MEMORY[0x1E4F27990]);
    uint64_t v11 = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)(v9 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, &v87);
    swift_bridgeObjectRelease();
    v85(v7, v8);
    *(_WORD *)(v9 + 12) = 2080;
    *(void *)(v0 + 40) = v6;
    unint64_t v13 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v14 = String.init<A>(reflecting:)();
    *(void *)(v9 + 14) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, &v87);
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1A375F000, v4, v5, "Failed to recover providerID: %s, error: %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1A624F870](v10, -1, -1);
    MEMORY[0x1A624F870](v9, -1, -1);
  }
  else
  {
    uint64_t v16 = *(void **)(v0 + 360);
    (*(void (**)(void, void))(v0 + 344))(*(void *)(v0 + 104), *(void *)(v0 + 88));
  }
  id v17 = *(void **)(v0 + 360);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
  unint64_t v19 = *(void **)(v0 + 320);
  uint64_t v20 = *(void *)(v0 + 144);
  unint64_t v21 = *(void *)(v0 + 88);
  invalidateProvider #1 (id:) in BackgroundGroupSessionManager.didDisconnect(client:)(v20, *(void *)(v0 + 56));

  v18(v20, v21);
  uint64_t v24 = *(void *)(v0 + 304);
  uint64_t v25 = *(void *)(v0 + 312);
  while (1)
  {
    if (v25)
    {
      uint64_t v28 = __clz(__rbit64(v25));
      v25 &= v25 - 1;
      uint64_t v29 = v28 | (v24 << 6);
      uint64_t v30 = *(void *)(v0 + 208);
LABEL_9:
      uint64_t v31 = *(void *)(v0 + 64);
      (*(void (**)(uint64_t, unint64_t, void))(*(void *)(v0 + 96) + 16))(v31, *(void *)(v30 + 48) + *(void *)(*(void *)(v0 + 96) + 72) * v29, *(void *)(v0 + 88));
      unint64_t v32 = *(void *)(v30 + 56);
      char v33 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest));
      unint64_t v34 = *(void **)(v32 + 8 * v29);
      *(void *)(v31 + *(int *)(v33 + 48)) = v34;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v31, 0, 1, v33);
      uint64_t v35 = v34;
      goto LABEL_16;
    }
    uint64_t v36 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
      return MEMORY[0x1F4113750](v22, v23);
    }
    v37 = (unint64_t)((1 << *(unsigned char *)(v0 + 385)) + 63) >> 6;
    if (v36 >= v37)
    {
      uint64_t v40 = v24;
    }
    else
    {
      uint64_t v30 = *(void *)(v0 + 208);
      uint64_t v38 = v30 + 64;
      uint64_t v39 = *(void *)(v30 + 64 + 8 * v36);
      if (v39) {
        goto LABEL_13;
      }
      uint64_t v40 = v24 + 1;
      if (v24 + 2 < v37)
      {
        uint64_t v39 = *(void *)(v38 + 8 * (v24 + 2));
        if (v39)
        {
          uint64_t v36 = v24 + 2;
LABEL_13:
          uint64_t v25 = (v39 - 1) & v39;
          uint64_t v29 = __clz(__rbit64(v39)) + (v36 << 6);
          uint64_t v24 = v36;
          goto LABEL_9;
        }
        uint64_t v40 = v24 + 2;
        if (v24 + 3 < v37)
        {
          uint64_t v39 = *(void *)(v38 + 8 * (v24 + 3));
          if (v39)
          {
            uint64_t v36 = v24 + 3;
            goto LABEL_13;
          }
          uint64_t v36 = v24 + 4;
          uint64_t v40 = v24 + 3;
          if (v24 + 4 < v37)
          {
            uint64_t v39 = *(void *)(v38 + 8 * v36);
            if (v39) {
              goto LABEL_13;
            }
            uint64_t v40 = v37 - 1;
            v62 = v37 - 5;
            while (v62 != v24)
            {
              uint64_t v39 = *(void *)(v30 + 104 + 8 * v24++);
              if (v39)
              {
                uint64_t v36 = v24 + 4;
                goto LABEL_13;
              }
            }
          }
        }
      }
    }
    uint64_t v41 = *(void *)(v0 + 64);
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest));
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v41, 1, 1, v42);
    uint64_t v25 = 0;
    uint64_t v24 = v40;
LABEL_16:
    *(void *)(v0 + 304) = v24;
    *(void *)(v0 + 312) = v25;
    uint64_t v43 = *(void *)(v0 + 72);
    outlined init with take of Date?(*(void *)(v0 + 64), v43, &demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest)?);
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: UUID, value: BackgroundSessionCreationRequest));
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 48))(v43, 1, v44) == 1) {
      break;
    }
    uint64_t v45 = *(void *)(v0 + 144);
    uint64_t v46 = *(void *)(v0 + 96);
    uint64_t v47 = *(void *)(v0 + 56);
    uint64_t v48 = *(void **)(*(void *)(v0 + 72) + *(int *)(v44 + 48));
    *(void *)(v0 + 320) = v48;
    (*(void (**)(uint64_t))(v46 + 32))(v45);
    if (*(void *)(*(void *)(v47 + 136) + 16))
    {
      uint64_t v49 = *(void *)(v0 + 144);
      swift_bridgeObjectRetain();
      specialized __RawDictionaryStorage.find<A>(_:)(v49);
      if (v50)
      {
        v66 = *(void *)(v0 + 136);
        v65 = *(void *)(v0 + 144);
        v67 = *(void *)(v0 + 88);
        v68 = *(void *)(v0 + 96);
        swift_bridgeObjectRelease();
        v69 = *(void (**)(uint64_t, uint64_t, uint64_t))(v68 + 16);
        *(void *)(v0 + 328) = v69;
        *(void *)(v0 + 336) = (v68 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
        v69(v66, v65, v67);
        v70 = Logger.logObject.getter();
        v71 = static os_log_type_t.default.getter();
        v72 = os_log_type_enabled(v70, v71);
        v73 = *(void *)(v0 + 136);
        v74 = *(void *)(v0 + 88);
        v75 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 96) + 8);
        if (v72)
        {
          v76 = swift_slowAlloc();
          v77 = swift_slowAlloc();
          v87 = v77;
          *(_DWORD *)v76 = 136315138;
          _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_4((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, 255, MEMORY[0x1E4F27990]);
          v78 = dispatch thunk of CustomStringConvertible.description.getter();
          *(void *)(v76 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v78, v79, &v87);
          swift_bridgeObjectRelease();
          v80 = *v75;
          (*v75)(v73, v74);
          _os_log_impl(&dword_1A375F000, v70, v71, "Attempting to recover providerID: %s", (uint8_t *)v76, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1A624F870](v77, -1, -1);
          MEMORY[0x1A624F870](v76, -1, -1);
        }
        else
        {
          v80 = *v75;
          (*v75)(*(void *)(v0 + 136), *(void *)(v0 + 88));
        }

        *(void *)(v0 + 344) = v80;
        uint64_t ObjectType = swift_getObjectType();
        v82 = (void *)swift_task_alloc();
        *(void *)(v0 + 352) = v82;
        *v82 = v0;
        v82[1] = specialized BackgroundGroupSessionManager.didDisconnect(client:);
        uint64_t v22 = (uint64_t)v48;
        uint64_t v23 = ObjectType;
        return MEMORY[0x1F4113750](v22, v23);
      }
      swift_bridgeObjectRelease();
    }
    v84 = v48;
    v86 = v24;
    (*(void (**)(void, void, void))(*(void *)(v0 + 96) + 16))(*(void *)(v0 + 120), *(void *)(v0 + 144), *(void *)(v0 + 88));
    v51 = Logger.logObject.getter();
    v52 = static os_log_type_t.default.getter();
    v53 = os_log_type_enabled(v51, v52);
    v54 = *(void *)(v0 + 144);
    v55 = *(void *)(v0 + 120);
    v57 = *(void *)(v0 + 88);
    v56 = *(void *)(v0 + 96);
    if (v53)
    {
      v83 = *(void *)(v0 + 144);
      v58 = swift_slowAlloc();
      v59 = swift_slowAlloc();
      v87 = v59;
      *(_DWORD *)v58 = 136315138;
      _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_4((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, 255, MEMORY[0x1E4F27990]);
      v60 = dispatch thunk of CustomStringConvertible.description.getter();
      *(void *)(v58 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v60, v61, &v87);
      swift_bridgeObjectRelease();
      uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
      v26(v55, v57);
      swift_arrayDestroy();
      MEMORY[0x1A624F870](v59, -1, -1);
      MEMORY[0x1A624F870](v58, -1, -1);

      uint64_t v27 = v83;
    }
    else
    {

      uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
      v26(v55, v57);
      uint64_t v27 = v54;
    }
    uint64_t v22 = ((uint64_t (*)(uint64_t, uint64_t))v26)(v27, v57);
    uint64_t v24 = v86;
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v63 = *(uint64_t (**)(void))(v0 + 8);
  return v63();
}

uint64_t specialized BackgroundGroupSessionManager.didDisconnect(client:)(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 288) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[20];
    uint64_t v6 = v4[11];
    uint64_t v7 = v4[12];
    uint64_t v8 = v4[7];
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v4[46] = v9;
    v4[47] = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v9(v5, v6);
    uint64_t v10 = specialized BackgroundGroupSessionManager.didDisconnect(client:);
    uint64_t v11 = v8;
  }
  else
  {
    uint64_t v11 = v4[7];
    v4[37] = a1;
    uint64_t v10 = specialized BackgroundGroupSessionManager.didDisconnect(client:);
  }
  return MEMORY[0x1F4188298](v10, v11, 0);
}

uint64_t sub_1A38BCB74()
{
  return objectdestroyTm_5(MEMORY[0x1E4FBC8F8], 56);
}

uint64_t partial apply for closure #1 in BackgroundGroupSessionManager.didDisconnect(client:)()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  uint64_t v4 = (uint64_t (*)(void))((char *)&async function pointer to specialized BackgroundGroupSessionManager.didDisconnect(client:)
                         + async function pointer to specialized BackgroundGroupSessionManager.didDisconnect(client:));
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v4();
}

uint64_t specialized BackgroundGroupSessionManager.didUpdateContainers(client:containers:)(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v4 - 8);
  unint64_t v6 = (unint64_t)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = type metadata accessor for UUID();
  uint64_t v49 = *(void *)(v53 - 8);
  MEMORY[0x1F4188790](v53);
  uint64_t v8 = (char *)v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for default != -1) {
    goto LABEL_28;
  }
  while (1)
  {
    uint64_t v9 = type metadata accessor for Logger();
    __swift_project_value_buffer(v9, (uint64_t)static Log.default);
    swift_bridgeObjectRetain_n();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    BOOL v12 = os_log_type_enabled(v10, v11);
    unint64_t v52 = a1;
    v46[0] = v6;
    if (v12)
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v55 = (void *)v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      uint64_t v54 = a1;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [TUConversationActivitySessionContainer]);
      uint64_t v15 = String.init<A>(reflecting:)();
      uint64_t v54 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, (uint64_t *)&v55);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      a1 = v52;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A375F000, v10, v11, "BackgroundGroupSessionManager received updated containers: %s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A624F870](v14, -1, -1);
      MEMORY[0x1A624F870](v13, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v46[1] = *(void *)(v2 + 200);
    id v17 = (void *)specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E4FBC860]);
    if (!(a1 >> 62))
    {
      uint64_t v18 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      uint64_t v47 = v2;
      if (!v18) {
        break;
      }
      goto LABEL_7;
    }
    swift_bridgeObjectRetain();
    uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v47 = v2;
    if (!v18) {
      break;
    }
LABEL_7:
    uint64_t v48 = v49 + 16;
    v50 = (void (**)(char *, uint64_t))(v49 + 8);
    unint64_t v51 = a1 & 0xC000000000000001;
    uint64_t v19 = 4;
    while (1)
    {
      unint64_t v6 = v19 - 4;
      id v22 = v51 ? (id)MEMORY[0x1A624E900](v19 - 4, a1) : *(id *)(a1 + 8 * v19);
      a1 = (unint64_t)v22;
      uint64_t v23 = v19 - 3;
      if (__OFADD__(v6, 1)) {
        break;
      }
      uint64_t v2 = v18;
      id v24 = objc_msgSend(v22, sel_groupUUID);
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v55 = v17;
      unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v8);
      uint64_t v27 = v17[2];
      BOOL v28 = (v26 & 1) == 0;
      uint64_t v29 = v27 + v28;
      if (__OFADD__(v27, v28)) {
        goto LABEL_26;
      }
      char v30 = v26;
      if (v17[3] >= v29)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          if (v26) {
            goto LABEL_8;
          }
        }
        else
        {
          specialized _NativeDictionary.copy()(&demangling cache variable for type metadata for _DictionaryStorage<UUID, TUConversationActivitySessionContainer>);
          id v17 = v55;
          if (v30) {
            goto LABEL_8;
          }
        }
      }
      else
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v29, isUniquelyReferenced_nonNull_native);
        id v17 = v55;
        unint64_t v31 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v8);
        if ((v30 & 1) != (v32 & 1)) {
          goto LABEL_44;
        }
        unint64_t v6 = v31;
        if (v30)
        {
LABEL_8:
          uint64_t v20 = v17[7];
          uint64_t v21 = 8 * v6;

          *(void *)(v20 + v21) = a1;
          goto LABEL_9;
        }
      }
      v17[(v6 >> 6) + 8] |= 1 << v6;
      (*(void (**)(unint64_t, char *, uint64_t))(v49 + 16))(v17[6] + *(void *)(v49 + 72) * v6, v8, v53);
      *(void *)(v17[7] + 8 * v6) = a1;
      uint64_t v33 = v17[2];
      BOOL v34 = __OFADD__(v33, 1);
      uint64_t v35 = v33 + 1;
      if (v34) {
        goto LABEL_27;
      }
      v17[2] = v35;
LABEL_9:
      swift_bridgeObjectRelease();
      (*v50)(v8, v53);
      ++v19;
      uint64_t v18 = v2;
      a1 = v52;
      if (v23 == v2) {
        goto LABEL_30;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    swift_once();
  }
LABEL_30:
  swift_bridgeObjectRelease();
  v55 = v17;
  CurrentValueSubject.send(_:)();
  swift_bridgeObjectRelease();
  uint64_t v36 = v47;
  unint64_t v37 = MEMORY[0x1E4FBC860];
  v55 = (void *)MEMORY[0x1E4FBC860];
  if (!v18) {
    goto LABEL_42;
  }
  if (v18 < 1)
  {
    __break(1u);
LABEL_44:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v18; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v39 = (id)MEMORY[0x1A624E900](i, a1);
      }
      else {
        id v39 = *(id *)(a1 + 8 * i + 32);
      }
      uint64_t v40 = v39;
      if (objc_msgSend(v39, sel_state, v46[0]) == (id)3 && objc_msgSend(v40, sel_localParticipantIdentifier))
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v37 = (unint64_t)v55;
    uint64_t v36 = v47;
LABEL_42:
    swift_retain();
    uint64_t v41 = specialized Sequence.flatMap<A>(_:)(v37);
    swift_release();
    swift_release();
    v55 = (void *)v41;
    CurrentValueSubject.send(_:)();
    swift_bridgeObjectRelease();
    uint64_t v42 = type metadata accessor for TaskPriority();
    uint64_t v43 = v46[0];
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v46[0], 1, 1, v42);
    uint64_t v44 = (void *)swift_allocObject();
    v44[2] = 0;
    v44[3] = 0;
    v44[4] = v36;
    v44[5] = a1;
    swift_bridgeObjectRetain();
    swift_retain();
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v43, (uint64_t)&async function pointer to partial apply for closure #4 in BackgroundGroupSessionManager.didUpdateContainers(client:containers:), (uint64_t)v44);
    return swift_release();
  }
  return result;
}

uint64_t sub_1A38BD324()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t partial apply for closure #1 in BackgroundGroupSessionManager.sessionDidRejectKeyRecoveryRequest(sessionID:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for UUID() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return closure #1 in BackgroundGroupSessionManager.sessionDidRejectKeyRecoveryRequest(sessionID:)(a1, v5, v6, v7, v8);
}

uint64_t sub_1A38BD4F4()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, v6, v5);
}

uint64_t partial apply for closure #1 in BackgroundGroupSessionManager.sessionDidReceiveUpdatedUnknownParticipantList(sessionID:unknownParticipants:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = *(void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return closure #1 in BackgroundGroupSessionManager.sessionDidReceiveUpdatedUnknownParticipantList(sessionID:unknownParticipants:)(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_1A38BD768@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 128);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A38BD7B8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 136);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A38BD808@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 144);
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A38BD858@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = BackgroundGroupSessionManager.topicManager.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1A38BD884(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 152) = *a1;
  swift_retain();

  return swift_release();
}

uint64_t sub_1A38BD8C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = BackgroundGroupSessionManager.groupSessionTable.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1A38BD8F4(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 216) = *a1;
  swift_retain();

  return swift_release();
}

uint64_t getEnumTagSinglePayload for BackgroundGroupSessionManagerError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BackgroundGroupSessionManagerError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    void *result = a2 + 9;
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
        JUMPOUT(0x1A38BDA94);
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
          void *result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BackgroundGroupSessionManagerError()
{
  return &type metadata for BackgroundGroupSessionManagerError;
}

uint64_t method lookup function for BackgroundGroupSessionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BackgroundGroupSessionManager);
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.presenceProviderObservers.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.presenceProviderObservers.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.presenceProviderObservers.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.providerObservers.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.providerObservers.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.providerObservers.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.requestedGroupSessionSignpostStates.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.requestedGroupSessionSignpostStates.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.requestedGroupSessionSignpostStates.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.__allocating_init(client:)()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.topicManager.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.topicManager.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.topicManager.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.onActivitySessionsChanged.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.activitySessions.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.topicCategory(groupUUID:name:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.pluginClientReporter.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.pubSubTopicReporter.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.groupSessions.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.groupSessionsPublisher.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.groupSessionTable.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.groupSessionTable.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.groupSessionTable.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.prepareForActivation(options:)(uint64_t a1, uint64_t a2)
{
  int v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 344) + **(int **)(*(void *)v2 + 344));
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v8(a1, a2);
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.start(presenceSession:)(uint64_t a1)
{
  unsigned int v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 352) + **(int **)(*(void *)v1 + 352));
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unsigned int v4 = v2;
  v4[1] = partial apply for closure #1 in GroupActivityTransferRepresentation.init<A>(exporting:);
  return v6(a1);
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.start(presenceProvider:)(uint64_t a1, uint64_t a2)
{
  int v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 360) + **(int **)(*(void *)v2 + 360));
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v8(a1, a2);
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.start(provider:)(uint64_t a1, uint64_t a2)
{
  int v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 368) + **(int **)(*(void *)v2 + 368));
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v8(a1, a2);
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.leave(identifier:)(uint64_t a1)
{
  unsigned int v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 376) + **(int **)(*(void *)v1 + 376));
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unsigned int v4 = v2;
  v4[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v6(a1);
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.updateMembers(identifier:members:)(uint64_t a1, uint64_t a2)
{
  int v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 384) + **(int **)(*(void *)v2 + 384));
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = protocol witness for AnyTransportSession.removeAttachment(id:) in conformance GroupSession<A>;
  return v8(a1, a2);
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.begin(activity:request:)(uint64_t a1, uint64_t a2)
{
  int v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 392) + **(int **)(*(void *)v2 + 392));
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = partial apply for closure #1 in GroupActivityTransferRepresentation.init<A>(exporting:);
  return v8(a1, a2);
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.end(activity:)(uint64_t a1)
{
  unsigned int v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 400) + **(int **)(*(void *)v1 + 400));
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unsigned int v4 = v2;
  v4[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v6(a1);
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.updateShare(_:activityID:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.updateShare(_:activityID:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of BackgroundGroupSessionManager.updateProviders(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t sub_1A38BE78C()
{
  return objectdestroyTm_5(MEMORY[0x1E4FBC8F8], 56);
}

uint64_t closure #1 in BackgroundGroupSessionManager.didDisconnect(client:)partial apply()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = protocol witness for AnyTransportSession.removeAttachment(id:) in conformance GroupSession<A>;
  unsigned int v4 = (uint64_t (*)(void))((char *)&async function pointer to specialized BackgroundGroupSessionManager.didDisconnect(client:)
                         + async function pointer to specialized BackgroundGroupSessionManager.didDisconnect(client:));
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  void *v2 = v1;
  v2[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v4();
}

uint64_t sub_1A38BE894()
{
  return objectdestroyTm_5(MEMORY[0x1E4FBC898], 48);
}

uint64_t objectdestroyTm_5(void (*a1)(void), uint64_t a2)
{
  swift_unknownObjectRelease();
  swift_release();
  a1(*(void *)(v2 + 40));

  return MEMORY[0x1F4186498](v2, a2, 7);
}

uint64_t partial apply for closure #4 in BackgroundGroupSessionManager.didUpdateContainers(client:containers:)()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  *(_OWORD *)(v2 + 16) = v3;
  return MEMORY[0x1F4188298](closure #4 in BackgroundGroupSessionManager.didUpdateContainers(client:containers:), v3, 0);
}

uint64_t sub_1A38BE9C0()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t partial apply for closure #2 in closure #1 in BackgroundGroupSessionManager.leave(identifier:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for UUID() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return closure #2 in closure #1 in BackgroundGroupSessionManager.leave(identifier:)(a1, v5, v6, v7, v8, v9);
}

uint64_t partial apply for closure #1 in closure #1 in BackgroundGroupSessionManager.leave(identifier:)()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  v3[4] = v2;
  return MEMORY[0x1F4188298](closure #1 in closure #1 in BackgroundGroupSessionManager.leave(identifier:), 0, 0);
}

uint64_t outlined init with copy of TaskPriority?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A38BECB4()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t _s15GroupActivities12TopicManagerC8provider12featureFlagsAC14CopresenceCore32ActivitySessionContainerProvider_p_So09CPFeatureG0_ptcfcySDy10Foundation4UUIDVSo014TUConversationjkL0CGcfU_TA_0()
{
  return closure #1 in TopicManager.init(provider:featureFlags:)();
}

uint64_t partial apply for closure #1 in BackgroundGroupSessionManager.init(client:)(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return closure #1 in BackgroundGroupSessionManager.init(client:)(a1, v4, v5, v6);
}

uint64_t objectdestroy_77Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t outlined init with copy of LinkManager.Attachment(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LinkManager.Attachment(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void SystemCoordinatorParticipantRoleRequest.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 8);
  if (!v1)
  {
    Swift::UInt v2 = 0;
    goto LABEL_5;
  }
  if (v1 == 1)
  {
    Swift::UInt v2 = 2;
LABEL_5:
    Hasher._combine(_:)(v2);
    return;
  }
  Hasher._combine(_:)(1uLL);

  String.hash(into:)();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SystemCoordinatorParticipantRoleRequest.CodingKeys()
{
  uint64_t v1 = 0x6574736575716572;
  if (*v0 != 1) {
    uint64_t v1 = 0x64656E6769736572;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701736302;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SystemCoordinatorParticipantRoleRequest.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized SystemCoordinatorParticipantRoleRequest.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SystemCoordinatorParticipantRoleRequest.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SystemCoordinatorParticipantRoleRequest.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys()
{
  return 0;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.NoneCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.NoneCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys()
{
  return 0x6E656449656C6F72;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x6E656449656C6F72 && a2 == 0xEE00726569666974)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SystemCoordinatorParticipantRoleRequest.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys>);
  uint64_t v27 = *(void *)(v4 - 8);
  uint64_t v28 = v4;
  MEMORY[0x1F4188790](v4);
  id v24 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys>);
  uint64_t v25 = *(void *)(v6 - 8);
  uint64_t v26 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SystemCoordinatorParticipantRoleRequest.NoneCodingKeys>);
  uint64_t v22 = *(void *)(v9 - 8);
  uint64_t v23 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SystemCoordinatorParticipantRoleRequest.CodingKeys>);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *v2;
  uint64_t v17 = v2[1];
  v21[1] = v16;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if (!v17)
  {
    char v29 = 0;
    lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.NoneCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v23);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  if (v17 == 1)
  {
    char v31 = 2;
    lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys();
    uint64_t v18 = v24;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v18, v28);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  char v30 = 1;
  lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys();
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  uint64_t v20 = v26;
  KeyedEncodingContainer.encode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

Swift::Int SystemCoordinatorParticipantRoleRequest.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  Hasher.init(_seed:)();
  if (v1)
  {
    if (v1 != 1)
    {
      Hasher._combine(_:)(1uLL);
      String.hash(into:)();
      return Hasher._finalize()();
    }
    Swift::UInt v2 = 2;
  }
  else
  {
    Swift::UInt v2 = 0;
  }
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t SystemCoordinatorParticipantRoleRequest.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys>);
  uint64_t v33 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  MEMORY[0x1F4188790](v3);
  unint64_t v37 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys>);
  uint64_t v35 = *(void *)(v31 - 8);
  MEMORY[0x1F4188790](v31);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SystemCoordinatorParticipantRoleRequest.NoneCodingKeys>);
  uint64_t v32 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SystemCoordinatorParticipantRoleRequest.CodingKeys>);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1[3];
  uint64_t v38 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v14);
  lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys();
  uint64_t v15 = v39;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v15)
  {
    uint64_t v16 = v37;
    uint64_t v39 = v11;
    uint64_t v17 = KeyedDecodingContainer.allKeys.getter();
    if (*(void *)(v17 + 16) == 1)
    {
      if (*(unsigned char *)(v17 + 32))
      {
        if (*(unsigned char *)(v17 + 32) == 1)
        {
          char v41 = 1;
          lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys();
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          uint64_t v22 = v31;
          uint64_t v23 = KeyedDecodingContainer.decode(_:forKey:)();
          id v24 = v6;
          uint64_t v25 = v39;
          uint64_t v26 = v23;
          uint64_t v28 = v27;
          (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v22);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v10);
        }
        else
        {
          char v42 = 2;
          lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys();
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          (*(void (**)(char *, uint64_t))(v33 + 8))(v16, v34);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v10);
          uint64_t v26 = 0;
          uint64_t v28 = 1;
        }
      }
      else
      {
        char v40 = 0;
        lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.NoneCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys();
        KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
        (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v7);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v10);
        uint64_t v26 = 0;
        uint64_t v28 = 0;
      }
      char v29 = v36;
      *uint64_t v36 = v26;
      v29[1] = v28;
    }
    else
    {
      uint64_t v18 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v20 = v19;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
      *uint64_t v20 = &type metadata for SystemCoordinatorParticipantRoleRequest;
      KeyedDecodingContainer.codingPath.getter();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x1E4FBBA70], v18);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v10);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
}

uint64_t protocol witness for Decodable.init(from:) in conformance SystemCoordinatorParticipantRoleRequest@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return SystemCoordinatorParticipantRoleRequest.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance SystemCoordinatorParticipantRoleRequest(void *a1)
{
  return SystemCoordinatorParticipantRoleRequest.encode(to:)(a1);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SystemCoordinatorParticipantRoleRequest()
{
  uint64_t v1 = *(void *)(v0 + 8);
  Hasher.init(_seed:)();
  if (v1)
  {
    if (v1 != 1)
    {
      Hasher._combine(_:)(1uLL);
      String.hash(into:)();
      return Hasher._finalize()();
    }
    Swift::UInt v2 = 2;
  }
  else
  {
    Swift::UInt v2 = 0;
  }
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance SystemCoordinatorParticipantRoleRequest()
{
  uint64_t v1 = *(void *)(v0 + 8);
  if (!v1)
  {
    Swift::UInt v2 = 0;
    goto LABEL_5;
  }
  if (v1 == 1)
  {
    Swift::UInt v2 = 2;
LABEL_5:
    Hasher._combine(_:)(v2);
    return;
  }
  Hasher._combine(_:)(1uLL);

  String.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SystemCoordinatorParticipantRoleRequest()
{
  uint64_t v1 = *(void *)(v0 + 8);
  Hasher.init(_seed:)();
  if (v1)
  {
    if (v1 != 1)
    {
      Hasher._combine(_:)(1uLL);
      String.hash(into:)();
      return Hasher._finalize()();
    }
    Swift::UInt v2 = 2;
  }
  else
  {
    Swift::UInt v2 = 0;
  }
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t specialized static SystemCoordinatorParticipantRoleRequest.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (!v3)
  {
    if (!v5)
    {
      unint64_t v3 = 0;
      char v6 = 1;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (v3 != 1)
  {
    if (v5 >= 2)
    {
      if (v2 == v4 && v3 == v5) {
        char v6 = 1;
      }
      else {
        char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
      }
      goto LABEL_9;
    }
LABEL_8:
    char v6 = 0;
LABEL_9:
    outlined copy of SystemCoordinatorParticipantRoleRequest(v4, v5);
    outlined copy of SystemCoordinatorParticipantRoleRequest(v2, v3);
    goto LABEL_10;
  }
  if (v5 != 1) {
    goto LABEL_8;
  }
  unint64_t v3 = 1;
  char v6 = 1;
LABEL_10:
  outlined consume of SystemCoordinatorParticipantRoleRequest(v2, v3);
  outlined consume of SystemCoordinatorParticipantRoleRequest(v4, v5);
  return v6 & 1;
}

unint64_t lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys;
  if (!lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.CodingKeys and conformance SystemCoordinatorParticipantRoleRequest.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys;
  if (!lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys;
  if (!lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys;
  if (!lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys;
  if (!lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys;
  if (!lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys;
  if (!lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys;
  if (!lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SystemCoordinatorParticipantRoleRequest.NoneCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.NoneCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys;
  if (!lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.NoneCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.NoneCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.NoneCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys;
  if (!lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.NoneCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.NoneCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.NoneCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys;
  if (!lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.NoneCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SystemCoordinatorParticipantRoleRequest.NoneCodingKeys and conformance SystemCoordinatorParticipantRoleRequest.NoneCodingKeys);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SystemCoordinatorParticipantRoleRequest(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SystemCoordinatorParticipantRoleRequest(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemCoordinatorParticipantRoleRequest()
{
  return &type metadata for SystemCoordinatorParticipantRoleRequest;
}

unsigned char *storeEnumTagSinglePayload for SystemCoordinatorParticipantRoleRequest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 2;
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
        JUMPOUT(0x1A38C0238);
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
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

void *type metadata accessor for SystemCoordinatorParticipantRoleRequest.CodingKeys()
{
  return &unk_1EF717BE8;
}

void *type metadata accessor for SystemCoordinatorParticipantRoleRequest.NoneCodingKeys()
{
  return &unk_1EF717C78;
}

unsigned char *storeEnumTagSinglePayload for SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys(unsigned char *result, int a2, int a3)
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
        void *result = a2;
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
      void *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1A38C031CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void *type metadata accessor for SystemCoordinatorParticipantRoleRequest.RequestedRoleCodingKeys()
{
  return &unk_1EF717B58;
}

void *type metadata accessor for SystemCoordinatorParticipantRoleRequest.ResignedRoleCodingKeys()
{
  return &unk_1EF717B38;
}

uint64_t specialized SystemCoordinatorParticipantRoleRequest.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701736302 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574736575716572 && a2 == 0xED0000656C6F5264 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64656E6769736572 && a2 == 0xEC000000656C6F52)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t PluginAttachmentLedgerTopic.participantsPublisher.getter()
{
  return PluginAttachmentLedgerTopic.participantsPublisher.getter(MEMORY[0x1E4F5B068], &demangling cache variable for type metadata for CurrentValueSubject<[UInt64 : PluginAttachmentLedgerTopic.Participant], Never>, &lazy protocol witness table cache variable for type CurrentValueSubject<[UInt64 : PluginAttachmentLedgerTopic.Participant], Never> and conformance CurrentValueSubject<A, B>);
}

uint64_t PluginAttachmentLedgerTopic.statePublisher.getter()
{
  return PluginAttachmentLedgerTopic.participantsPublisher.getter(MEMORY[0x1E4F5B0D8], &demangling cache variable for type metadata for CurrentValueSubject<PluginAttachmentLedgerTopic.State, Never>, &lazy protocol witness table cache variable for type CurrentValueSubject<PluginAttachmentLedgerTopic.State, Never> and conformance CurrentValueSubject<A, B>);
}

uint64_t PluginAttachmentLedgerTopic.participantsPublisher.getter(void (*a1)(void), uint64_t *a2, unint64_t *a3)
{
  a1();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  lazy protocol witness table accessor for type CurrentValueSubject<[UInt64 : PluginAttachmentLedgerTopic.Participant], Never> and conformance CurrentValueSubject<A, B>(a3, a2);
  uint64_t v5 = Publisher.eraseToAnyPublisher()();
  swift_release();
  return v5;
}

uint64_t PluginAttachmentLedgerTopic.attachmentsPublisher.getter()
{
  return PluginAttachmentLedgerTopic.participantsPublisher.getter(MEMORY[0x1E4F5B058], (uint64_t *)&demangling cache variable for type metadata for CurrentValueSubject<[Attachment], Never>, &lazy protocol witness table cache variable for type CurrentValueSubject<[Attachment], Never> and conformance CurrentValueSubject<A, B>);
}

uint64_t protocol witness for PluginAttachmentLedgerTopicProvider.participantsPublisher.getter in conformance PluginAttachmentLedgerTopic(uint64_t a1, uint64_t a2)
{
  return protocol witness for PluginAttachmentLedgerTopicProvider.participantsPublisher.getter in conformance PluginAttachmentLedgerTopic(a1, a2, MEMORY[0x1E4F5B068], &demangling cache variable for type metadata for CurrentValueSubject<[UInt64 : PluginAttachmentLedgerTopic.Participant], Never>, &lazy protocol witness table cache variable for type CurrentValueSubject<[UInt64 : PluginAttachmentLedgerTopic.Participant], Never> and conformance CurrentValueSubject<A, B>);
}

uint64_t protocol witness for PluginAttachmentLedgerTopicProvider.statePublisher.getter in conformance PluginAttachmentLedgerTopic(uint64_t a1, uint64_t a2)
{
  return protocol witness for PluginAttachmentLedgerTopicProvider.participantsPublisher.getter in conformance PluginAttachmentLedgerTopic(a1, a2, MEMORY[0x1E4F5B0D8], &demangling cache variable for type metadata for CurrentValueSubject<PluginAttachmentLedgerTopic.State, Never>, &lazy protocol witness table cache variable for type CurrentValueSubject<PluginAttachmentLedgerTopic.State, Never> and conformance CurrentValueSubject<A, B>);
}

uint64_t protocol witness for PluginAttachmentLedgerTopicProvider.participantsPublisher.getter in conformance PluginAttachmentLedgerTopic(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t *a4, unint64_t *a5)
{
  a3();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  lazy protocol witness table accessor for type CurrentValueSubject<[UInt64 : PluginAttachmentLedgerTopic.Participant], Never> and conformance CurrentValueSubject<A, B>(a5, a4);
  uint64_t v7 = Publisher.eraseToAnyPublisher()();
  swift_release();
  return v7;
}

uint64_t protocol witness for PluginAttachmentLedgerTopicProvider.attachmentsPublisher.getter in conformance PluginAttachmentLedgerTopic(uint64_t a1, uint64_t a2)
{
  return protocol witness for PluginAttachmentLedgerTopicProvider.participantsPublisher.getter in conformance PluginAttachmentLedgerTopic(a1, a2, MEMORY[0x1E4F5B058], (uint64_t *)&demangling cache variable for type metadata for CurrentValueSubject<[Attachment], Never>, &lazy protocol witness table cache variable for type CurrentValueSubject<[Attachment], Never> and conformance CurrentValueSubject<A, B>);
}

void protocol witness for PluginAttachmentLedgerTopicProvider.unsubscribe() in conformance PluginAttachmentLedgerTopic()
{
}

uint64_t protocol witness for PluginAttachmentLedgerTopicProvider.requestUploadToken() in conformance PluginAttachmentLedgerTopic(uint64_t a1)
{
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *int v3 = v1;
  v3[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return MEMORY[0x1F41135D8](a1);
}

uint64_t protocol witness for PluginAttachmentLedgerTopicProvider.refreshUploadToken() in conformance PluginAttachmentLedgerTopic(uint64_t a1)
{
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *int v3 = v1;
  v3[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return MEMORY[0x1F41135D0](a1);
}

uint64_t protocol witness for PluginAttachmentLedgerTopicProvider.requestDownloadToken(for:) in conformance PluginAttachmentLedgerTopic(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return MEMORY[0x1F41135E0](a1, a2);
}

uint64_t protocol witness for PluginAttachmentLedgerTopicProvider.upload(id:key:assetSkeleton:developerMetadata:storageLocation:fileHash:refSignature:) in conformance PluginAttachmentLedgerTopic(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v14;
  *uint64_t v14 = v8;
  v14[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return MEMORY[0x1F4113628](a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t protocol witness for PluginAttachmentLedgerTopicProvider.updateStatus(id:status:) in conformance PluginAttachmentLedgerTopic(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = protocol witness for AnyTransportSession.removeAttachment(id:) in conformance GroupSession<A>;
  return MEMORY[0x1F41135B8](a1, a2);
}

uint64_t protocol witness for PluginAttachmentLedgerTopicProvider.remove(id:) in conformance PluginAttachmentLedgerTopic(uint64_t a1)
{
  int v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *int v3 = v1;
  v3[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return MEMORY[0x1F4113620](a1);
}

unint64_t instantiation function for generic protocol witness table for PluginAttachmentLedgerTopic(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type PluginAttachmentLedgerTopic and conformance PluginAttachmentLedgerTopic();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type PluginAttachmentLedgerTopic and conformance PluginAttachmentLedgerTopic()
{
  unint64_t result = lazy protocol witness table cache variable for type PluginAttachmentLedgerTopic and conformance PluginAttachmentLedgerTopic;
  if (!lazy protocol witness table cache variable for type PluginAttachmentLedgerTopic and conformance PluginAttachmentLedgerTopic)
  {
    type metadata accessor for PluginAttachmentLedgerTopic();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PluginAttachmentLedgerTopic and conformance PluginAttachmentLedgerTopic);
  }
  return result;
}

uint64_t dispatch thunk of PluginAttachmentLedgerTopicProvider.participantsPublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PluginAttachmentLedgerTopicProvider.statePublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PluginAttachmentLedgerTopicProvider.attachmentsPublisher.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of PluginAttachmentLedgerTopicProvider.unsubscribe()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PluginAttachmentLedgerTopicProvider.requestUploadToken()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 48) + **(int **)(a3 + 48));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of PluginAttachmentLedgerTopicProvider.refreshUploadToken()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 56) + **(int **)(a3 + 56));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of PluginAttachmentLedgerTopicProvider.requestDownloadToken(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 64) + **(int **)(a4 + 64));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of PluginAttachmentLedgerTopicProvider.upload(id:key:assetSkeleton:developerMetadata:storageLocation:fileHash:refSignature:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a13 + 72) + **(int **)(a13 + 72));
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v13 + 16) = v18;
  *uint64_t v18 = v13;
  v18[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v20(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t dispatch thunk of PluginAttachmentLedgerTopicProvider.updateStatus(id:status:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 80) + **(int **)(a4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = protocol witness for AnyTransportSession.removeAttachment(id:) in conformance GroupSession<A>;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of PluginAttachmentLedgerTopicProvider.remove(id:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 88) + **(int **)(a3 + 88));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v9(a1, a2, a3);
}

uint64_t Topic.__allocating_init(name:delegate:pubSubTopicGenerator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Topic.__allocating_init(name:delegate:pubSubTopicGenerator:)(a1, a2, a3, a4, a5, a6, specialized Topic.__allocating_init(name:delegate:pubSubTopicGenerator:));
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Error) -> ()(void *a1, uint64_t (*a2)(void))
{
  return a2(*a1);
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed Error) -> (@out ())(uint64_t a1, uint64_t (*a2)(uint64_t *))
{
  uint64_t v3 = a1;
  return a2(&v3);
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned UInt64) -> ()(void *a1, uint64_t (*a2)(void))
{
  return a2(*a1);
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed [UInt64]?) -> ()(void *a1, uint64_t (*a2)(void))
{
  return a2(*a1);
}

BOOL static Topic.State.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void Topic.State.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t Topic.BootstrapPubSubTopicInfo.dataCryptorProvider.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of AudioSessionAssertionManager(v1, a1);
}

uint64_t Topic.BootstrapPubSubTopicInfo.delegate.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t Topic.BootstrapPubSubTopicInfo.seqNumWatermark.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Topic.BootstrapPubSubTopicInfo.init(dataCryptorProvider:delegate:seqNumWatermark:)@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t result = outlined init with take of TypedPayloadDecoding(a1, (uint64_t)a5);
  a5[5] = a2;
  a5[6] = a3;
  a5[7] = a4;
  return result;
}

uint64_t Topic.topic.getter()
{
  return swift_retain();
}

uint64_t Topic.state.getter()
{
  dispatch thunk of StateMachine.currentState.getter();
  return v1;
}

uint64_t Topic.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t key path getter for Topic.receivedDataHandler : Topic@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 320))();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = v4;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v5;
    *(void *)(result + 24) = v6;
    uint64_t v7 = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64, @guaranteed [UInt64]?) -> ();
  }
  else
  {
    uint64_t v7 = 0;
  }
  *a2 = v7;
  a2[1] = result;
  return result;
}

uint64_t key path setter for Topic.receivedDataHandler : Topic(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Data, @in_guaranteed UInt64, @in_guaranteed [UInt64]?) -> (@out ());
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t))(**(void **)a2 + 328);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v3);
  return v7(v6, v5);
}

uint64_t Topic.receivedDataHandler.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 96);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v1);
  return v1;
}

uint64_t Topic.receivedDataHandler.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 96);
  *(void *)(v2 + 96) = a1;
  *(void *)(v2 + 104) = a2;
  return outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v5);
}

uint64_t (*Topic.receivedDataHandler.modify())()
{
  return GroupSession.attachmentDownloadBytes.modify;
}

uint64_t key path getter for Topic.pubSubStateChangedHandler : Topic@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 344))();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = v4;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v5;
    *(void *)(result + 24) = v6;
    uint64_t v7 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed PlaybackSyncer.Message, @in_guaranteed UUID) -> ();
  }
  else
  {
    uint64_t v7 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())result;
  return result;
}

uint64_t key path setter for Topic.pubSubStateChangedHandler : Topic(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed PlaybackSyncer.Message, @in_guaranteed UUID) -> (@out ());
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t (*)(), uint64_t))(**(void **)a2 + 352);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v3);
  return v7(v6, v5);
}

uint64_t Topic.pubSubStateChangedHandler.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 112);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v1);
  return v1;
}

uint64_t Topic.pubSubStateChangedHandler.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 112);
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = a2;
  return outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v5);
}

uint64_t (*Topic.pubSubStateChangedHandler.modify())()
{
  return GroupSession.attachmentDownloadBytes.modify;
}

uint64_t key path getter for Topic.catchupNeededHandler : Topic@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 368))();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = v4;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v5;
    *(void *)(result + 24) = v6;
    uint64_t v7 = _ss6UInt64VIegy_ABytIegnr_TRTA_0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  *a2 = v7;
  a2[1] = result;
  return result;
}

uint64_t key path setter for Topic.catchupNeededHandler : Topic(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Error?) -> (@out ());
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t (*)(uint64_t), uint64_t))(**(void **)a2 + 376);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v3);
  return v7(v6, v5);
}

uint64_t Topic.catchupNeededHandler.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 128);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v1);
  return v1;
}

uint64_t Topic.catchupNeededHandler.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 128);
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v5);
}

uint64_t (*Topic.catchupNeededHandler.modify())()
{
  return GroupSession.attachmentDownloadBytes.modify;
}

uint64_t Topic.dataCryptor.didset()
{
  uint64_t v1 = v0;
  if (one-time initialization token for topic != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.topic);
  swift_retain();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v12[0] = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v7 = v1[10];
    unint64_t v8 = v1[11];
    swift_bridgeObjectRetain();
    v12[4] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v8, v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A375F000, v3, v4, "Updating PubSubTopic dataCryptorProvider, topic=%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A624F870](v6, -1, -1);
    MEMORY[0x1A624F870](v5, -1, -1);
  }
  else
  {

    uint64_t v9 = swift_release();
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*v1 + 216))(v9);
  if (result)
  {
    swift_beginAccess();
    uint64_t v11 = v1[18];
    if (v11)
    {
      v12[3] = swift_getObjectType();
      v12[0] = v11;
      swift_unknownObjectRetain_n();
      PubSubTopic.refreshDataCryptorProvider(with:)();
      swift_unknownObjectRelease();
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t Topic.dataCryptor.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t Topic.dataCryptor.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 144) = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  Topic.dataCryptor.didset();
  return swift_unknownObjectRelease();
}

uint64_t (*Topic.dataCryptor.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return Topic.dataCryptor.modify;
}

uint64_t Topic.dataCryptor.modify(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return Topic.dataCryptor.didset();
  }
  return result;
}

uint64_t key path getter for Topic.subscribedParticipants : Topic@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 416))();
  *a2 = result;
  return result;
}

uint64_t key path setter for Topic.subscribedParticipants : Topic(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 424);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t Topic.subscribedParticipants.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t Topic.subscribedParticipants.setter()
{
  return static Published.subscript.setter();
}

void (*Topic.subscribedParticipants.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return GroupSession.internalActiveParticipants.modify;
}

uint64_t key path setter for Topic.$subscribedParticipants : Topic(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>.Publisher);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 448))(v6);
}

uint64_t Topic.$subscribedParticipants.getter()
{
  return swift_endAccess();
}

uint64_t Topic.$subscribedParticipants.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>.Publisher);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>);
  Published.projectedValue.setter();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*Topic.$subscribedParticipants.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>.Publisher);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC15GroupActivities5Topic__subscribedParticipants;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>);
  Published.projectedValue.getter();
  swift_endAccess();
  return SystemCoordinatorHostManager.$configurations.modify;
}

uint64_t key path getter for Topic.invalidationHandler : Topic@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 464))();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = v4;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v5;
    *(void *)(result + 24) = v6;
    uint64_t v7 = _ss5Error_pIegg_sAA_pytIegnr_TRTA_0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  *a2 = v7;
  a2[1] = result;
  return result;
}

uint64_t key path setter for Topic.invalidationHandler : Topic(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Error?) -> (@out ());
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t (*)(uint64_t), uint64_t))(**(void **)a2 + 472);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v3);
  return v7(v6, v5);
}

uint64_t Topic.invalidationHandler.getter()
{
  return Topic.invalidationHandler.getter(&OBJC_IVAR____TtC15GroupActivities5Topic_invalidationHandler, (void (*)(void, void))outlined copy of (@escaping @callee_guaranteed (@guaranteed Error) -> ())?);
}

uint64_t Topic.invalidationHandler.setter(uint64_t a1, uint64_t a2)
{
  return Topic.invalidationHandler.setter(a1, a2, &OBJC_IVAR____TtC15GroupActivities5Topic_invalidationHandler, (uint64_t (*)(uint64_t, uint64_t))outlined consume of (@escaping @callee_guaranteed (@guaranteed Error) -> ())?);
}

uint64_t (*Topic.invalidationHandler.modify())()
{
  return GroupSession.attachmentDownloadBytes.modify;
}

uint64_t key path getter for Topic.requestEncryptionKeysHandler : Topic@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 488))();
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = v4;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v5;
    *(void *)(result + 24) = v6;
    uint64_t v7 = thunk for @escaping @callee_guaranteed (@guaranteed [UInt64]?) -> ()partial apply;
  }
  else
  {
    uint64_t v7 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())result;
  return result;
}

uint64_t key path setter for Topic.requestEncryptionKeysHandler : Topic(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = thunk for @escaping @callee_guaranteed (@in_guaranteed [UInt64]?) -> (@out ())partial apply;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(uint64_t (**)(uint64_t (*)(), uint64_t))(**(void **)a2 + 496);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v3);
  return v7(v6, v5);
}

uint64_t Topic.requestEncryptionKeysHandler.getter()
{
  return Topic.invalidationHandler.getter(&OBJC_IVAR____TtC15GroupActivities5Topic_requestEncryptionKeysHandler, (void (*)(void, void))outlined copy of (@escaping @callee_guaranteed (@guaranteed Error) -> ())?);
}

uint64_t Topic.invalidationHandler.getter(void *a1, void (*a2)(void, void))
{
  uint64_t v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t Topic.requestEncryptionKeysHandler.setter(uint64_t a1, uint64_t a2)
{
  return Topic.invalidationHandler.setter(a1, a2, &OBJC_IVAR____TtC15GroupActivities5Topic_requestEncryptionKeysHandler, (uint64_t (*)(uint64_t, uint64_t))outlined consume of (@escaping @callee_guaranteed (@guaranteed Error) -> ())?);
}

uint64_t Topic.invalidationHandler.setter(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  *uint64_t v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*Topic.requestEncryptionKeysHandler.modify())()
{
  return GroupSession.attachmentDownloadBytes.modify;
}

uint64_t Topic.seqNumWatermark.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Topic.seqNumWatermark.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC15GroupActivities5Topic_seqNumWatermark);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*Topic.seqNumWatermark.modify())()
{
  return GroupSession.GroupSessionPlaybackSyncerLink.shouldRequestCatchup.modify;
}

uint64_t Topic.init(name:delegate:pubSubTopicGenerator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return Topic.__allocating_init(name:delegate:pubSubTopicGenerator:)(a1, a2, a3, a4, a5, a6, specialized Topic.init(name:delegate:pubSubTopicGenerator:));
}

uint64_t Topic.__allocating_init(name:delegate:pubSubTopicGenerator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v16 = a7(a1, a2, a3, a5, a6, v7, ObjectType, a4);
  swift_unknownObjectRelease();
  return v16;
}

Swift::Void __swiftcall Topic.subscribe()()
{
  uint64_t v1 = v0;
  LOBYTE(v38[0]) = 0;
  if (dispatch thunk of StateMachine.execute(_:)())
  {
    if ((*(uint64_t (**)(void))(*v0 + 392))())
    {
      if (one-time initialization token for topic != -1) {
        swift_once();
      }
      uint64_t v2 = type metadata accessor for Logger();
      __swift_project_value_buffer(v2, (uint64_t)static Log.topic);
      swift_retain();
      uint64_t v3 = Logger.logObject.getter();
      os_log_type_t v4 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v3, v4))
      {
        uint64_t v5 = (uint8_t *)swift_slowAlloc();
        uint64_t v6 = swift_slowAlloc();
        v38[0] = v6;
        *(_DWORD *)uint64_t v5 = 136315138;
        uint64_t v7 = v1[10];
        unint64_t v8 = v1[11];
        swift_bridgeObjectRetain();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v8, v38);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_release();
        _os_log_impl(&dword_1A375F000, v3, v4, "Subscribing, topic=%s", v5, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1A624F870](v6, -1, -1);
        MEMORY[0x1A624F870](v5, -1, -1);
      }
      else
      {
        swift_release();
      }

      uint64_t v16 = v1[10];
      uint64_t v17 = v1[11];
      uint64_t v18 = *(uint64_t (**)(uint64_t))(*v1 + 488);
      swift_retain();
      uint64_t v19 = swift_bridgeObjectRetain();
      uint64_t v20 = v18(v19);
      if (v20)
      {
        uint64_t v22 = v20;
        uint64_t v23 = v21;
        uint64_t v24 = swift_allocObject();
        *(void *)(v24 + 16) = v22;
        *(void *)(v24 + 24) = v23;
        uint64_t v25 = thunk for @escaping @callee_guaranteed (@guaranteed [UInt64]?) -> ()partial apply;
      }
      else
      {
        uint64_t v24 = swift_allocObject();
        *(void *)(v24 + 16) = partial apply for closure #1 in Topic.subscribe();
        *(void *)(v24 + 24) = v1;
        swift_retain();
        uint64_t v25 = (uint64_t (*)())_sSays6UInt64VGSgIegg_ADytIegnr_TRTA_0;
      }
      uint64_t v26 = v25;
      uint64_t v27 = swift_allocObject();
      *(void *)(v27 + 16) = v26;
      *(void *)(v27 + 24) = v24;
      uint64_t v28 = type metadata accessor for GroupSessionDataCryptorProvider();
      swift_allocObject();
      swift_unknownObjectRetain();
      uint64_t v29 = GroupSessionDataCryptorProvider.init(topic:dataCryptor:refreshEncryptionKeysHandler:)();
      if (MEMORY[0x1A624F980](v1 + 7))
      {
        uint64_t v30 = v1[8];
        uint64_t ObjectType = swift_getObjectType();
        uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8))(v16, v17, ObjectType, v30);
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v32 = 0;
      }
      v1[9] = v32;
      swift_release();
      v38[3] = v28;
      v38[4] = MEMORY[0x1E4F5B108];
      v38[0] = v29;
      uint64_t v33 = lazy protocol witness table accessor for type Topic and conformance Topic(&lazy protocol witness table cache variable for type Topic and conformance Topic, (void (*)(uint64_t))type metadata accessor for Topic);
      uint64_t v34 = *(uint64_t (**)(uint64_t))(*v1 + 512);
      uint64_t v35 = swift_retain();
      uint64_t v36 = v34(v35);
      v38[5] = (uint64_t)v1;
      v38[6] = v33;
      v38[7] = v36;
      unint64_t v37 = (void (*)(uint64_t *))v1[3];
      swift_retain();
      v37(v38);
      swift_allocObject();
      swift_weakInit();
      swift_allocObject();
      swift_weakInit();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnyPublisher<PubSubTopic, Error>);
      lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type AnyPublisher<PubSubTopic, Error> and conformance AnyPublisher<A, B>, &demangling cache variable for type metadata for AnyPublisher<PubSubTopic, Error>);
      Publisher.sink(receiveCompletion:receiveValue:)();
      swift_release();
      swift_release();
      swift_release();
      swift_beginAccess();
      AnyCancellable.store(in:)();
      swift_endAccess();
      swift_release();
      swift_release();
      swift_unknownObjectRelease();
      swift_release();
      outlined destroy of Topic.BootstrapPubSubTopicInfo((uint64_t)v38);
    }
    else
    {
      if (one-time initialization token for topic != -1) {
        swift_once();
      }
      uint64_t v9 = type metadata accessor for Logger();
      __swift_project_value_buffer(v9, (uint64_t)static Log.topic);
      swift_retain();
      uint64_t v10 = Logger.logObject.getter();
      os_log_type_t v11 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        uint64_t v13 = swift_slowAlloc();
        v38[0] = v13;
        *(_DWORD *)uint64_t v12 = 136315138;
        uint64_t v14 = v1[10];
        unint64_t v15 = v1[11];
        swift_bridgeObjectRetain();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, v38);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_release();
        _os_log_impl(&dword_1A375F000, v10, v11, "No data cryptor is available for topic=%s", v12, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1A624F870](v13, -1, -1);
        MEMORY[0x1A624F870](v12, -1, -1);
      }
      else
      {
        swift_release();
      }
    }
  }
}

void closure #1 in Topic.subscribe()(uint64_t a1, uint64_t a2)
{
  if (one-time initialization token for topic != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  __swift_project_value_buffer(v3, (uint64_t)static Log.topic);
  swift_retain();
  os_log_type_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v10 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v8 = *(void *)(a2 + 80);
    unint64_t v9 = *(void *)(a2 + 88);
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v8, v9, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A375F000, v4, v5, "Topic missing 'requestEncryptionKeysHandler', ignoring request, topic=%s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A624F870](v7, -1, -1);
    MEMORY[0x1A624F870](v6, -1, -1);
  }
  else
  {

    swift_release();
  }
}

void closure #2 in Topic.subscribe()(void **a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    if (v1)
    {
      id v4 = v1;
      if (one-time initialization token for topic != -1) {
        swift_once();
      }
      uint64_t v5 = type metadata accessor for Logger();
      __swift_project_value_buffer(v5, (uint64_t)static Log.topic);
      id v6 = v1;
      swift_retain();
      id v7 = v1;
      swift_retain();
      uint64_t v8 = Logger.logObject.getter();
      os_log_type_t v9 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = swift_slowAlloc();
        uint64_t v11 = swift_slowAlloc();
        v22[0] = v11;
        *(_DWORD *)uint64_t v10 = 136315394;
        id v12 = v1;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
        uint64_t v13 = String.init<A>(reflecting:)();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, v22);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();

        *(_WORD *)(v10 + 12) = 2080;
        uint64_t v15 = v3[10];
        unint64_t v16 = v3[11];
        swift_bridgeObjectRetain();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, v22);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl(&dword_1A375F000, v8, v9, "Failed to subscribe, error=%s topic=%s", (uint8_t *)v10, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1A624F870](v11, -1, -1);
        MEMORY[0x1A624F870](v10, -1, -1);
      }
      else
      {

        swift_release_n();
      }

      LOBYTE(v22[0]) = 3;
      dispatch thunk of StateMachine.execute(_:)();
      v3[9] = 0;
      swift_release();
      swift_retain();
      Lock.withLock<A>(_:)();
      uint64_t v17 = swift_release();
      uint64_t v18 = (*(uint64_t (**)(uint64_t))(*v3 + 464))(v17);
      if (v18)
      {
        uint64_t v19 = (void (*)(void *))v18;
        lazy protocol witness table accessor for type Topic.Errors and conformance Topic.Errors();
        uint64_t v20 = (void *)swift_allocError();
        *uint64_t v21 = 1;
        v19(v20);

        outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?((uint64_t)v19);
        swift_release();

        return;
      }
    }
    swift_release();
  }
}

uint64_t closure #1 in closure #2 in Topic.subscribe()(uint64_t a1)
{
  uint64_t v1 = (uint64_t *)(a1 + OBJC_IVAR____TtC15GroupActivities5Topic_pendingMessages);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 16);
  if (v3)
  {
    uint64_t v17 = v1;
    uint64_t v4 = one-time initialization token for topic;
    swift_bridgeObjectRetain();
    if (v4 != -1) {
      swift_once();
    }
    uint64_t v20 = type metadata accessor for Logger();
    uint64_t v5 = (unint64_t *)(v2 + 40);
    while (1)
    {
      uint64_t v21 = v3;
      uint64_t v7 = *(v5 - 1);
      unint64_t v6 = *v5;
      uint64_t v8 = (void (*)(void))v5[4];
      __swift_project_value_buffer(v20, (uint64_t)static Log.topic);
      outlined copy of Data._Representation(v7, v6);
      swift_bridgeObjectRetain();
      outlined copy of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?((uint64_t)v8);
      outlined copy of Data._Representation(v7, v6);
      swift_bridgeObjectRetain();
      outlined copy of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?((uint64_t)v8);
      os_log_type_t v9 = Logger.logObject.getter();
      os_log_type_t v10 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v9, v10)) {
        break;
      }
      outlined consume of Data._Representation(v7, v6);
      swift_bridgeObjectRelease();
      outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?((uint64_t)v8);
      outlined consume of Data._Representation(v7, v6);
      swift_bridgeObjectRelease();
      outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?((uint64_t)v8);

      if (v8) {
        goto LABEL_10;
      }
LABEL_5:
      v5 += 7;
      uint64_t v3 = v21 - 1;
      if (v21 == 1)
      {
        swift_bridgeObjectRelease();
        uint64_t v1 = v17;
        goto LABEL_12;
      }
    }
    log = v9;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v22 = v19;
    *(_DWORD *)uint64_t v11 = 136315138;
    outlined copy of Data._Representation(v7, v6);
    swift_bridgeObjectRetain();
    outlined copy of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?((uint64_t)v8);
    uint64_t v12 = String.init<A>(reflecting:)();
    *(void *)(v11 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, &v22);
    swift_bridgeObjectRelease();
    outlined consume of Data._Representation(v7, v6);
    swift_bridgeObjectRelease();
    outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?((uint64_t)v8);
    outlined consume of Data._Representation(v7, v6);
    swift_bridgeObjectRelease();
    outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?((uint64_t)v8);
    _os_log_impl(&dword_1A375F000, log, v10, "Dropping pending message due to error in subscribing: %s", (uint8_t *)v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A624F870](v19, -1, -1);
    MEMORY[0x1A624F870](v11, -1, -1);

    if (!v8) {
      goto LABEL_5;
    }
LABEL_10:
    lazy protocol witness table accessor for type Topic.Errors and conformance Topic.Errors();
    unint64_t v14 = (void *)swift_allocError();
    *uint64_t v15 = 0;
    v8();

    goto LABEL_5;
  }
LABEL_12:
  uint64_t *v1 = MEMORY[0x1E4FBC860];
  return swift_bridgeObjectRelease();
}

uint64_t closure #3 in Topic.subscribe()(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v43 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  char v41 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = type metadata accessor for DispatchQoS();
  uint64_t v40 = *(void *)(v42 - 8);
  MEMORY[0x1F4188790](v42);
  uint64_t v39 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>.Publisher);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Publishers.RemoveDuplicates<Published<[UInt64 : PubSubTopic.Participant]>.Publisher>);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a1;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v15 = (void *)result;
    uint64_t v38 = v2;
    swift_beginAccess();
    v15[2] = v13;
    swift_retain_n();
    swift_release();
    if (v15[2])
    {
      swift_retain();
      PubSubTopic.$subscribers.getter();
      lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type Published<[UInt64 : PubSubTopic.Participant]>.Publisher and conformance Published<A>.Publisher, &demangling cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>.Publisher);
      lazy protocol witness table accessor for type [UInt64 : PubSubTopic.Participant] and conformance <> [A : B]();
      Publisher<>.removeDuplicates()();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      unint64_t v16 = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))(*v15 + 456))(aBlock);
      lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type Publishers.RemoveDuplicates<Published<[UInt64 : PubSubTopic.Participant]>.Publisher> and conformance Publishers.RemoveDuplicates<A>, (uint64_t *)&demangling cache variable for type metadata for Publishers.RemoveDuplicates<Published<[UInt64 : PubSubTopic.Participant]>.Publisher>);
      Publisher<>.assign(to:)();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      v16(aBlock, 0);
      swift_release();
    }
    swift_release();
    if (one-time initialization token for topic != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    __swift_project_value_buffer(v17, (uint64_t)static Log.topic);
    swift_retain();
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      aBlock[0] = v21;
      *(_DWORD *)uint64_t v20 = 136315138;
      uint64_t v22 = v15[10];
      unint64_t v23 = v15[11];
      swift_bridgeObjectRetain();
      uint64_t v44 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v23, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release();
      _os_log_impl(&dword_1A375F000, v18, v19, "Successfully subscribed, topic=%s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A624F870](v21, -1, -1);
      MEMORY[0x1A624F870](v20, -1, -1);
    }
    else
    {
      swift_release();
    }

    LOBYTE(aBlock[0]) = 2;
    if (dispatch thunk of StateMachine.execute(_:)())
    {
      uint64_t v24 = (*(uint64_t (**)(void))(*v15 + 392))();
      if (v24)
      {
        uint64_t v25 = v24;
        if ((*(uint64_t (**)(void))(*v15 + 216))())
        {
          uint64_t ObjectType = (void *)swift_getObjectType();
          aBlock[0] = v25;
          swift_unknownObjectRetain();
          PubSubTopic.refreshDataCryptorProvider(with:)();
          swift_release();
          swift_unknownObjectRelease();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)aBlock);
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
      swift_retain();
      Lock.withLock<A>(_:)();
      swift_release();
      (*(void (**)(void))(*v15 + 520))(0);
    }
    else
    {
      swift_retain();
      uint64_t v26 = Logger.logObject.getter();
      os_log_type_t v27 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        aBlock[0] = v29;
        *(_DWORD *)uint64_t v28 = 136315138;
        uint64_t v30 = v15[10];
        unint64_t v31 = v15[11];
        swift_bridgeObjectRetain();
        uint64_t v44 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_release();
        _os_log_impl(&dword_1A375F000, v26, v27, "Unsubscribed while subscribing, topic=%s", v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1A624F870](v29, -1, -1);
        MEMORY[0x1A624F870](v28, -1, -1);
      }
      else
      {
        swift_release();
      }

      if ((*(uint64_t (**)(void))(*v15 + 216))())
      {
        uint64_t v32 = (void *)PubSubTopic.queue.getter();
        swift_release();
        uint64_t v47 = partial apply for closure #1 in closure #3 in Topic.subscribe();
        uint64_t v48 = v15;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed @Sendable () -> ();
        uint64_t ObjectType = &block_descriptor_113;
        uint64_t v33 = _Block_copy(aBlock);
        swift_retain();
        uint64_t v34 = v39;
        static DispatchQoS.unspecified.getter();
        uint64_t v44 = MEMORY[0x1E4FBC860];
        lazy protocol witness table accessor for type Topic and conformance Topic((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x1E4FBCB00]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        uint64_t v35 = v41;
        uint64_t v36 = v38;
        dispatch thunk of SetAlgebra.init<A>(_:)();
        MEMORY[0x1A624E5F0](0, v34, v35, v33);
        _Block_release(v33);

        swift_release();
        (*(void (**)(char *, uint64_t))(v43 + 8))(v35, v36);
        (*(void (**)(char *, uint64_t))(v40 + 8))(v34, v42);
      }
    }
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in closure #3 in Topic.subscribe()(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)a1 + 216))();
  if (result)
  {
    PubSubTopic.unsubscribe(force:)(0);
    return swift_release();
  }
  return result;
}

uint64_t closure #2 in closure #3 in Topic.subscribe()(uint64_t a1)
{
  uint64_t v40 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v40 - 8);
  MEMORY[0x1F4188790](v40);
  uint64_t v39 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v38 - 8);
  MEMORY[0x1F4188790](v38);
  uint64_t v37 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (void *)(a1 + OBJC_IVAR____TtC15GroupActivities5Topic_pendingMessages);
  swift_beginAccess();
  uint64_t v32 = v7;
  uint64_t v8 = *(void *)(*v7 + 16);
  if (v8)
  {
    v31[1] = v1;
    uint64_t v9 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 216);
    uint64_t v41 = *(void *)a1 + 216;
    uint64_t v42 = v9;
    uint64_t v36 = v53;
    uint64_t v35 = (void (**)(char *, uint64_t))(v3 + 8);
    uint64_t v34 = (void (**)(char *, uint64_t))(v5 + 8);
    v31[0] = swift_bridgeObjectRetain();
    uint64_t v10 = v31[0] + 40;
    uint64_t v33 = a1;
    do
    {
      uint64_t v11 = *(void *)(v10 - 8);
      unint64_t v12 = *(void *)v10;
      uint64_t v13 = *(void *)(v10 + 8);
      uint64_t v50 = *(void *)(v10 + 16);
      LODWORD(v49) = *(unsigned __int8 *)(v10 + 24);
      uint64_t v14 = *(void *)(v10 + 32);
      uint64_t v15 = *(void *)(v10 + 40);
      uint64_t v16 = v11;
      outlined copy of Data._Representation(v11, v12);
      uint64_t v17 = v13;
      swift_bridgeObjectRetain();
      uint64_t v18 = outlined copy of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v14);
      uint64_t v19 = v42(v18);
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v48 = v8;
        uint64_t v47 = PubSubTopic.queue.getter();
        uint64_t v21 = swift_allocObject();
        swift_weakInit();
        uint64_t v22 = swift_allocObject();
        *(void *)(v22 + 16) = v20;
        *(void *)(v22 + 24) = v21;
        uint64_t v44 = v21;
        uint64_t v45 = v16;
        uint64_t v8 = v48;
        *(void *)(v22 + 32) = v16;
        *(void *)(v22 + 40) = v12;
        uint64_t v46 = v17;
        uint64_t v23 = v50;
        *(void *)(v22 + 48) = v17;
        *(void *)(v22 + 56) = v23;
        *(unsigned char *)(v22 + 64) = v49;
        *(void *)(v22 + 72) = v14;
        *(void *)(v22 + 80) = v15;
        v53[2] = partial apply for closure #1 in Topic._sendData(_:to:previousSeqNumUnacked:completion:);
        v53[3] = v22;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 1107296256;
        v53[0] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
        v53[1] = &block_descriptor_121;
        uint64_t v43 = _Block_copy(aBlock);
        swift_retain();
        swift_retain();
        outlined copy of Data._Representation(v16, v12);
        swift_bridgeObjectRetain();
        outlined copy of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v14);
        uint64_t v50 = v14;
        uint64_t v24 = v37;
        static DispatchQoS.unspecified.getter();
        uint64_t v51 = MEMORY[0x1E4FBC860];
        lazy protocol witness table accessor for type Topic and conformance Topic((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x1E4FBCB00]);
        uint64_t v49 = v15;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        uint64_t v25 = v39;
        uint64_t v26 = v40;
        dispatch thunk of SetAlgebra.init<A>(_:)();
        os_log_type_t v27 = v43;
        uint64_t v28 = (void *)v47;
        MEMORY[0x1A624E5F0](0, v24, v25, v43);
        _Block_release(v27);

        swift_release();
        (*v35)(v25, v26);
        (*v34)(v24, v38);
        swift_release();
        swift_release();
        outlined consume of Data._Representation(v45, v12);
        swift_bridgeObjectRelease();
        outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v50);
      }
      else
      {
        outlined consume of Data._Representation(v16, v12);
        swift_bridgeObjectRelease();
        outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v14);
      }
      v10 += 56;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
    uint64_t v29 = v32;
  }
  else
  {
    uint64_t v29 = v32;
  }
  *uint64_t v29 = MEMORY[0x1E4FBC860];
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall Topic.unsubscribe()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v46 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(aBlock) = 1;
  if (dispatch thunk of StateMachine.execute(_:)())
  {
    if (one-time initialization token for topic != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    __swift_project_value_buffer(v9, (uint64_t)static Log.topic);
    swift_retain();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    BOOL v12 = os_log_type_enabled(v10, v11);
    uint64_t v45 = v6;
    if (v12)
    {
      uint64_t v44 = (uint64_t (**)(uint64_t))v5;
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v42 = v8;
      uint64_t v15 = v14;
      uint64_t aBlock = v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      uint64_t v43 = v4;
      uint64_t v16 = v1[10];
      unint64_t v17 = v1[11];
      swift_bridgeObjectRetain();
      uint64_t v18 = v16;
      uint64_t v5 = (uint64_t)v44;
      uint64_t v47 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v17, &aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      uint64_t v4 = v43;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A375F000, v10, v11, "Unsubscribing, topic=%s", v13, 0xCu);
      swift_arrayDestroy();
      uint64_t v19 = v15;
      uint64_t v8 = v42;
      MEMORY[0x1A624F870](v19, -1, -1);
      MEMORY[0x1A624F870](v13, -1, -1);
    }
    else
    {

      uint64_t v20 = swift_release();
    }
    uint64_t v21 = (*(uint64_t (**)(uint64_t))(*v1 + 216))(v20);
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = (void *)PubSubTopic.queue.getter();
      unint64_t v52 = partial apply for closure #1 in Topic.unsubscribe();
      uint64_t v53 = v22;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v49 = 1107296256;
      uint64_t v44 = &v50;
      uint64_t v50 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
      uint64_t v51 = &block_descriptor_11;
      uint64_t v24 = _Block_copy(&aBlock);
      swift_retain();
      static DispatchQoS.unspecified.getter();
      uint64_t v47 = MEMORY[0x1E4FBC860];
      uint64_t v25 = lazy protocol witness table accessor for type Topic and conformance Topic((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x1E4FBCB00]);
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      v41[1] = lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
      uint64_t v42 = (char *)v26;
      uint64_t v43 = (char *)v25;
      dispatch thunk of SetAlgebra.init<A>(_:)();
      MEMORY[0x1A624E5F0](0, v8, v4, v24);
      os_log_type_t v27 = v24;
      uint64_t v28 = v45;
      _Block_release(v27);

      uint64_t v29 = *(void (**)(char *, uint64_t))(v46 + 8);
      v46 += 8;
      uint64_t v30 = v29;
      v29(v4, v2);
      uint64_t v33 = *(void (**)(char *, uint64_t (**)(uint64_t)))(v28 + 8);
      uint64_t v31 = v28 + 8;
      uint64_t v32 = v33;
      v33(v8, (uint64_t (**)(uint64_t))v5);
      swift_release();
      uint64_t v34 = PubSubTopic.reporter.getter();
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = PubSubTopicReporter.queue.getter();
        uint64_t v45 = v31;
        uint64_t v37 = (void *)v36;
        uint64_t v38 = swift_allocObject();
        *(void *)(v38 + 16) = v35;
        *(void *)(v38 + 24) = v22;
        unint64_t v52 = partial apply for closure #2 in Topic.unsubscribe();
        uint64_t v53 = v38;
        uint64_t aBlock = MEMORY[0x1E4F143A8];
        uint64_t v49 = 1107296256;
        uint64_t v50 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
        uint64_t v51 = &block_descriptor_19;
        uint64_t v39 = _Block_copy(&aBlock);
        uint64_t v44 = (uint64_t (**)(uint64_t))v5;
        uint64_t v40 = v39;
        swift_retain();
        swift_retain();
        static DispatchQoS.unspecified.getter();
        uint64_t v47 = MEMORY[0x1E4FBC860];
        dispatch thunk of SetAlgebra.init<A>(_:)();
        MEMORY[0x1A624E5F0](0, v8, v4, v40);
        _Block_release(v40);
        swift_release();
        swift_release();

        v30(v4, v2);
        v32(v8, v44);
      }
      swift_release();
    }
  }
}

void closure #2 in Topic.unsubscribe()()
{
  PubSubTopic.reporterTag.getter();
  char v0 = dispatch thunk of PubSubTopicReporter.emitAndRemoveReport(forTag:)();
  swift_bridgeObjectRelease();
  if ((v0 & 1) == 0)
  {
    if (one-time initialization token for topic != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    __swift_project_value_buffer(v1, (uint64_t)static Log.topic);
    swift_retain_n();
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = swift_slowAlloc();
      uint64_t v8 = v5;
      *(_DWORD *)uint64_t v4 = 136315138;
      uint64_t v6 = PubSubTopic.reporterTag.getter();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, &v8);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A375F000, v2, v3, "Could not find or remove the report with tag=%s", v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A624F870](v5, -1, -1);
      MEMORY[0x1A624F870](v4, -1, -1);
    }
    else
    {

      swift_release_n();
    }
  }
}

void Topic.sendData(_:to:completion:)(uint64_t a1, unint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5)
{
  os_log_type_t v11 = (uint64_t (**)(void))(*v5 + 312);
  BOOL v12 = *v11;
  if ((*v11)() == 1)
  {
    Topic._sendData(_:to:previousSeqNumUnacked:completion:)(a1, a2, a3, 0, 1, (uint64_t)a4, a5);
  }
  else
  {
    uint64_t v13 = v12();
    if ((_BYTE)v13)
    {
      lazy protocol witness table accessor for type Topic.Errors and conformance Topic.Errors();
      uint64_t v14 = (void *)swift_allocError();
      *uint64_t v15 = 0;
      a4();
    }
    else
    {
      MEMORY[0x1F4188790](v13);
      swift_retain();
      Lock.withLock<A>(_:)();
      swift_release();
    }
  }
}

uint64_t closure #1 in Topic.sendData(_:to:completion:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  os_log_type_t v11 = (void **)(a1 + OBJC_IVAR____TtC15GroupActivities5Topic_pendingMessages);
  swift_beginAccess();
  BOOL v12 = *v11;
  outlined copy of Data._Representation(a2, a3);
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *os_log_type_t v11 = v12;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    BOOL v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v12[2] + 1, 1, v12);
    *os_log_type_t v11 = v12;
  }
  unint64_t v15 = v12[2];
  unint64_t v14 = v12[3];
  if (v15 >= v14 >> 1)
  {
    BOOL v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v14 > 1), v15 + 1, 1, v12);
    *os_log_type_t v11 = v12;
  }
  v12[2] = v15 + 1;
  uint64_t v16 = &v12[7 * v15];
  v16[4] = a2;
  v16[5] = a3;
  v16[6] = a4;
  v16[7] = 0;
  *((unsigned char *)v16 + 64) = 1;
  v16[9] = a5;
  v16[10] = a6;
  return swift_endAccess();
}

uint64_t Topic._sendData(_:to:previousSeqNumUnacked:completion:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v38 = a6;
  uint64_t v39 = a7;
  LODWORD(v36) = a5;
  uint64_t v35 = a4;
  uint64_t v37 = a1;
  uint64_t v10 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for DispatchQoS();
  uint64_t v40 = *(void *)(v14 - 8);
  uint64_t v15 = MEMORY[0x1F4188790](v14);
  unint64_t v17 = (char *)v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 216))(v15);
  if (result)
  {
    uint64_t v19 = result;
    uint64_t v32 = PubSubTopic.queue.getter();
    uint64_t v20 = swift_allocObject();
    uint64_t v33 = v11;
    uint64_t v34 = v14;
    uint64_t v21 = v20;
    swift_weakInit();
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v19;
    *(void *)(v22 + 24) = v21;
    v31[1] = v21;
    uint64_t v23 = v37;
    *(void *)(v22 + 32) = v37;
    *(void *)(v22 + 40) = a2;
    uint64_t v24 = v35;
    *(void *)(v22 + 48) = a3;
    *(void *)(v22 + 56) = v24;
    *(unsigned char *)(v22 + 64) = v36 & 1;
    uint64_t v36 = v10;
    uint64_t v25 = v13;
    uint64_t v26 = v38;
    uint64_t v27 = v39;
    *(void *)(v22 + 72) = v38;
    *(void *)(v22 + 80) = v27;
    aBlock[4] = partial apply for closure #1 in Topic._sendData(_:to:previousSeqNumUnacked:completion:);
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    void aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    uint64_t aBlock[3] = &block_descriptor_110;
    uint64_t v28 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    outlined copy of Data._Representation(v23, a2);
    swift_bridgeObjectRetain();
    outlined copy of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v26);
    static DispatchQoS.unspecified.getter();
    uint64_t v41 = MEMORY[0x1E4FBC860];
    lazy protocol witness table accessor for type Topic and conformance Topic((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    uint64_t v29 = v36;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    uint64_t v30 = (void *)v32;
    MEMORY[0x1A624E5F0](0, v17, v25, v28);
    _Block_release(v28);

    swift_release();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v29);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v17, v34);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in Topic._sendData(_:to:previousSeqNumUnacked:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(void))
{
  if (PubSubTopic.isAvailableUnsafe.getter())
  {
    uint64_t result = PubSubTopic.publish(message:to:previousSeqNumUnacked:)();
    if (a8) {
      return a8(0);
    }
  }
  else
  {
    swift_beginAccess();
    uint64_t result = swift_weakLoadStrong();
    if (result)
    {
      MEMORY[0x1F4188790](result);
      swift_retain();
      Lock.withLock<A>(_:)();
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t closure #1 in closure #1 in Topic._sendData(_:to:previousSeqNumUnacked:completion:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = (void **)(a1 + OBJC_IVAR____TtC15GroupActivities5Topic_pendingMessages);
  swift_beginAccess();
  uint64_t v14 = *v13;
  outlined copy of Data._Representation(a2, a3);
  swift_bridgeObjectRetain();
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(a7);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v13 = v14;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14[2] + 1, 1, v14);
    *uint64_t v13 = v14;
  }
  unint64_t v17 = v14[2];
  unint64_t v16 = v14[3];
  if (v17 >= v16 >> 1)
  {
    uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v16 > 1), v17 + 1, 1, v14);
    *uint64_t v13 = v14;
  }
  v14[2] = v17 + 1;
  uint64_t v18 = &v14[7 * v17];
  v18[4] = a2;
  v18[5] = a3;
  v18[6] = a4;
  v18[7] = a5;
  *((unsigned char *)v18 + 64) = a6 & 1;
  v18[9] = a7;
  v18[10] = a8;
  return swift_endAccess();
}

uint64_t *Topic.deinit()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  outlined destroy of weak SystemCoordinatorHostDelegate?((uint64_t)(v0 + 7));
  swift_release();
  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v0[12]);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v0[14]);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v0[16]);
  swift_unknownObjectRelease();
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC15GroupActivities5Topic__subscribedParticipants;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(*(uint64_t *)((char *)v0 + OBJC_IVAR____TtC15GroupActivities5Topic_invalidationHandler));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(*(uint64_t *)((char *)v0 + OBJC_IVAR____TtC15GroupActivities5Topic_requestEncryptionKeysHandler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t Topic.__deallocating_deinit()
{
  Topic.deinit();

  return swift_deallocClassInstance();
}

uint64_t Topic.onRecordReceive(topic:)()
{
  while (1)
  {
    PubSubTopic.retrieveNextMessage()();
    if (!v11) {
      break;
    }
    uint64_t v1 = outlined init with take of TypedPayloadDecoding(&v10, (uint64_t)v12);
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 320))(v1);
    if (v2)
    {
      os_log_type_t v3 = (void (*)(uint64_t, unint64_t, uint64_t, uint64_t))v2;
      __swift_project_boxed_opaque_existential_1(v12, v13);
      uint64_t v4 = dispatch thunk of PubSubTopicRecord.data.getter();
      unint64_t v6 = v5;
      __swift_project_boxed_opaque_existential_1(v12, v13);
      uint64_t v7 = dispatch thunk of PubSubTopicRecord.publisherID.getter();
      __swift_project_boxed_opaque_existential_1(v12, v13);
      uint64_t v8 = dispatch thunk of PubSubTopicRecord.toParticipantIDs.getter();
      v3(v4, v6, v7, v8);
      outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?((uint64_t)v3);
      swift_bridgeObjectRelease();
      outlined consume of Data._Representation(v4, v6);
    }
    __swift_project_boxed_opaque_existential_1(v12, v13);
    dispatch thunk of PubSubTopicRecord.acknowledge()();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  }
  return outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)&v10, &demangling cache variable for type metadata for PubSubTopicRecord?);
}

uint64_t Topic.topicClosed(topic:reason:unackedMessages:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  return specialized Topic.topicClosed(topic:reason:unackedMessages:)(a2, a3, a4);
}

uint64_t closure #1 in Topic.topicClosed(topic:reason:unackedMessages:)(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = type metadata accessor for PubSubTopic.Message();
  uint64_t v5 = *(void *)(v32 - 8);
  MEMORY[0x1F4188790](v32);
  uint64_t v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = MEMORY[0x1E4FBC860];
  if (v8)
  {
    v27[0] = a2;
    v27[1] = v2;
    uint64_t v35 = MEMORY[0x1E4FBC860];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v8, 0);
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v10 = v5 + 16;
    uint64_t v12 = a1 + ((*(unsigned __int8 *)(v10 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 64));
    uint64_t v29 = *(void *)(v10 + 56);
    uint64_t v30 = v11;
    uint64_t v28 = (void (**)(char *, uint64_t))(v10 - 8);
    uint64_t v31 = v10;
    do
    {
      uint64_t v13 = v32;
      v30(v7, v12, v32);
      uint64_t v14 = PubSubTopic.Message.data.getter();
      uint64_t v33 = v15;
      uint64_t v34 = v14;
      uint64_t v16 = PubSubTopic.Message.participants.getter();
      uint64_t v17 = PubSubTopic.Message.seqNum.getter();
      char v19 = v18;
      (*v28)(v7, v13);
      uint64_t v9 = v35;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v9 + 16) + 1, 1);
        uint64_t v9 = v35;
      }
      unint64_t v21 = *(void *)(v9 + 16);
      unint64_t v20 = *(void *)(v9 + 24);
      if (v21 >= v20 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v20 > 1, v21 + 1, 1);
        uint64_t v9 = v35;
      }
      *(void *)(v9 + 16) = v21 + 1;
      uint64_t v22 = v9 + 56 * v21;
      uint64_t v23 = v33;
      *(void *)(v22 + 32) = v34;
      *(void *)(v22 + 40) = v23;
      *(void *)(v22 + 48) = v16;
      *(void *)(v22 + 56) = v17;
      *(unsigned char *)(v22 + 64) = v19 & 1;
      *(void *)(v22 + 72) = 0;
      *(void *)(v22 + 80) = 0;
      v12 += v29;
      --v8;
    }
    while (v8);
    a2 = v27[0];
  }
  uint64_t v36 = v9;
  uint64_t v24 = (void *)(a2 + OBJC_IVAR____TtC15GroupActivities5Topic_pendingMessages);
  swift_beginAccess();
  uint64_t v25 = swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)(v25);
  *uint64_t v24 = v36;
  return swift_bridgeObjectRelease();
}

void (*Topic.catchupNeeded(topic:catchupSender:completion:)(uint64_t a1, uint64_t a2, void (*a3)(void)))(uint64_t)
{
  return specialized Topic.catchupNeeded(topic:catchupSender:completion:)(a2, a3);
}

void (*Topic.onStateUpdated(topic:oldState:newState:)(uint64_t a1, uint64_t a2, uint64_t a3))(uint64_t, uint64_t)
{
  uint64_t result = (void (*)(uint64_t, uint64_t))(*(uint64_t (**)(void))(*(void *)v3 + 344))();
  if (result)
  {
    uint64_t v7 = (uint64_t)result;
    result(a2, a3);
    return (void (*)(uint64_t, uint64_t))outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v7);
  }
  return result;
}

void (*protocol witness for PubSubTopicDelegate.onStateUpdated(topic:oldState:newState:) in conformance Topic(uint64_t a1, uint64_t a2, uint64_t a3))(uint64_t, uint64_t)
{
  uint64_t result = (void (*)(uint64_t, uint64_t))(*(uint64_t (**)(void))(*(void *)v3 + 344))();
  if (result)
  {
    uint64_t v7 = (uint64_t)result;
    result(a2, a3);
    return (void (*)(uint64_t, uint64_t))outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v7);
  }
  return result;
}

void (*protocol witness for PubSubTopicDelegate.catchupNeeded(topic:catchupSender:completion:) in conformance Topic(uint64_t a1, uint64_t a2, void (*a3)(void)))(uint64_t)
{
  return specialized Topic.catchupNeeded(topic:catchupSender:completion:)(a2, a3);
}

uint64_t protocol witness for PubSubTopicDelegate.topicClosed(topic:reason:unackedMessages:) in conformance Topic(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  return specialized Topic.topicClosed(topic:reason:unackedMessages:)(a2, a3, a4);
}

uint64_t specialized Topic.init(name:delegate:pubSubTopicGenerator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  *(void *)(a6 + 16) = 0;
  uint64_t v36 = a4;
  uint64_t v37 = a5;
  uint64_t v34 = a3;
  uint64_t v35 = a8;
  uint64_t v32 = a1;
  uint64_t v33 = a2;
  uint64_t v30 = v16;
  uint64_t v31 = v17;
  uint64_t v29 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((MEMORY[0x1E4FBC860] & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    unint64_t v19 = specialized Set.init(_nonEmptyArrayLiteral:)(MEMORY[0x1E4FBC860]);
  }
  else {
    unint64_t v19 = MEMORY[0x1E4FBC870];
  }
  *(void *)(a6 + 40) = v19;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<StateMachine<Topic.State, Topic.Event>.Transition>);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StateMachine<Topic.State, Topic.Event>.Transition);
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_1A38FAC80;
  LOBYTE(v38) = 3;
  __int16 v39 = 0;
  lazy protocol witness table accessor for type Topic.State and conformance Topic.State();
  lazy protocol witness table accessor for type Topic.Event and conformance Topic.Event();
  StateMachine.Transition.init(from:to:event:)();
  LOBYTE(v38) = 0;
  __int16 v39 = 258;
  StateMachine.Transition.init(from:to:event:)();
  LOBYTE(v38) = 0;
  __int16 v39 = 771;
  StateMachine.Transition.init(from:to:event:)();
  LOBYTE(v38) = 0;
  __int16 v39 = 769;
  StateMachine.Transition.init(from:to:event:)();
  LOBYTE(v38) = 1;
  __int16 v39 = 513;
  StateMachine.Transition.init(from:to:event:)();
  LOBYTE(v38) = 1;
  __int16 v39 = 771;
  StateMachine.Transition.init(from:to:event:)();
  LOBYTE(v38) = 2;
  __int16 v39 = 770;
  StateMachine.Transition.init(from:to:event:)();
  LOBYTE(v38) = 3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StateMachine<Topic.State, Topic.Event>);
  swift_allocObject();
  *(void *)(a6 + 48) = StateMachine.init(initialState:transitions:)();
  *(void *)(a6 + 64) = 0;
  swift_unknownObjectWeakInit();
  *(void *)(a6 + 72) = 0;
  *(_OWORD *)(a6 + 96) = 0u;
  *(_OWORD *)(a6 + 112) = 0u;
  *(_OWORD *)(a6 + 128) = 0u;
  *(void *)(a6 + 144) = 0;
  uint64_t v20 = a6 + OBJC_IVAR____TtC15GroupActivities5Topic__subscribedParticipants;
  uint64_t v38 = MEMORY[0x1E4FBC868];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt64 : PubSubTopic.Participant]);
  unint64_t v21 = v29;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v20, v21, v31);
  uint64_t v22 = (void *)(a6 + OBJC_IVAR____TtC15GroupActivities5Topic_invalidationHandler);
  *uint64_t v22 = 0;
  v22[1] = 0;
  uint64_t v23 = (void *)(a6 + OBJC_IVAR____TtC15GroupActivities5Topic_requestEncryptionKeysHandler);
  *uint64_t v23 = 0;
  v23[1] = 0;
  *(void *)(a6 + OBJC_IVAR____TtC15GroupActivities5Topic_seqNumWatermark) = 0;
  *(void *)(a6 + OBJC_IVAR____TtC15GroupActivities5Topic_pendingMessages) = MEMORY[0x1E4FBC860];
  uint64_t v24 = OBJC_IVAR____TtC15GroupActivities5Topic_pendingMessagesLock;
  type metadata accessor for Lock();
  swift_allocObject();
  *(void *)(a6 + v24) = Lock.init()();
  uint64_t v25 = v33;
  *(void *)(a6 + 80) = v32;
  *(void *)(a6 + 88) = v25;
  *(void *)(a6 + 64) = v35;
  swift_unknownObjectWeakAssign();
  uint64_t v26 = v37;
  *(void *)(a6 + 24) = v36;
  *(void *)(a6 + 32) = v26;
  return a6;
}

uint64_t specialized Topic.__allocating_init(name:delegate:pubSubTopicGenerator:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  type metadata accessor for Topic();
  uint64_t v15 = swift_allocObject();

  return specialized Topic.init(name:delegate:pubSubTopicGenerator:)(a1, a2, a3, a4, a5, v15, a7, a8);
}

uint64_t sub_1A38C6B28@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 416))();
  *a2 = result;
  return result;
}

uint64_t sub_1A38C6B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 424);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

void partial apply for closure #1 in Topic.subscribe()(uint64_t a1)
{
  closure #1 in Topic.subscribe()(a1, v1);
}

uint64_t sub_1A38C6BE0()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t _sSays6UInt64VGSgIegg_ADytIegnr_TRTA_0(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t type metadata accessor for Topic()
{
  uint64_t result = type metadata singleton initialization cache for Topic;
  if (!type metadata singleton initialization cache for Topic) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1A38C6C90()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void partial apply for closure #2 in Topic.subscribe()(void **a1)
{
}

uint64_t partial apply for closure #3 in Topic.subscribe()(uint64_t *a1)
{
  return closure #3 in Topic.subscribe()(a1);
}

uint64_t outlined destroy of Topic.BootstrapPubSubTopicInfo(uint64_t a1)
{
  return a1;
}

void partial apply for closure #1 in Topic.unsubscribe()()
{
}

uint64_t block_copy_helper_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

uint64_t sub_1A38C6D28()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void partial apply for closure #2 in Topic.unsubscribe()()
{
}

unint64_t lazy protocol witness table accessor for type Topic.Errors and conformance Topic.Errors()
{
  unint64_t result = lazy protocol witness table cache variable for type Topic.Errors and conformance Topic.Errors;
  if (!lazy protocol witness table cache variable for type Topic.Errors and conformance Topic.Errors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Topic.Errors and conformance Topic.Errors);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Topic.Errors and conformance Topic.Errors;
  if (!lazy protocol witness table cache variable for type Topic.Errors and conformance Topic.Errors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Topic.Errors and conformance Topic.Errors);
  }
  return result;
}

uint64_t partial apply for closure #1 in Topic.sendData(_:to:completion:)()
{
  return closure #1 in Topic.sendData(_:to:completion:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t specialized Topic.topic.setter(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>.Publisher);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Publishers.RemoveDuplicates<Published<[UInt64 : PubSubTopic.Participant]>.Publisher>);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  swift_beginAccess();
  v2[2] = a1;
  swift_retain();
  uint64_t result = swift_release();
  if (v2[2])
  {
    swift_retain();
    PubSubTopic.$subscribers.getter();
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type Published<[UInt64 : PubSubTopic.Participant]>.Publisher and conformance Published<A>.Publisher, &demangling cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>.Publisher);
    lazy protocol witness table accessor for type [UInt64 : PubSubTopic.Participant] and conformance <> [A : B]();
    Publisher<>.removeDuplicates()();
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v13 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*v2 + 456))(v15);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type Publishers.RemoveDuplicates<Published<[UInt64 : PubSubTopic.Participant]>.Publisher> and conformance Publishers.RemoveDuplicates<A>, (uint64_t *)&demangling cache variable for type metadata for Publishers.RemoveDuplicates<Published<[UInt64 : PubSubTopic.Participant]>.Publisher>);
    Publisher<>.assign(to:)();
    (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
    v13(v15, 0);
    return swift_release();
  }
  return result;
}

uint64_t specialized Topic.topicClosed(topic:reason:unackedMessages:)(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v108 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>.Publisher);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v109 = (char *)&v103 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Publishers.RemoveDuplicates<Published<[UInt64 : PubSubTopic.Participant]>.Publisher>);
  uint64_t v11 = *(uint8_t **)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  v110 = (char *)&v103 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    uint64_t v25 = one-time initialization token for topic;
    swift_bridgeObjectRetain();
    if (v25 != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    __swift_project_value_buffer(v26, (uint64_t)static Log.topic);
    swift_retain();
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v27))
    {
      uint64_t v107 = v8;
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v106 = v7;
      uint64_t v30 = v29;
      v111[0] = v29;
      v104 = (uint8_t *)v10;
      v105 = v11;
      *(_DWORD *)uint64_t v28 = 136315138;
      uint64_t v31 = v4[10];
      unint64_t v32 = v4[11];
      swift_bridgeObjectRetain();
      uint64_t v33 = v31;
      uint64_t v8 = v107;
      uint64_t v112 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v32, v111);
      uint64_t v11 = v105;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v10 = (uint64_t)v104;
      swift_bridgeObjectRelease();
      swift_release();
      _os_log_impl(&dword_1A375F000, v15, v27, "[Topic Closed] Disconnected, topic=%s", v28, 0xCu);
      swift_arrayDestroy();
      uint64_t v34 = v30;
      uint64_t v7 = v106;
      MEMORY[0x1A624F870](v34, -1, -1);
      uint64_t v24 = v28;
      goto LABEL_11;
    }
LABEL_17:
    swift_release();
    goto LABEL_18;
  }
  if (a2 == 1)
  {
    uint64_t v13 = one-time initialization token for topic;
    swift_bridgeObjectRetain();
    if (v13 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Log.topic);
    swift_retain();
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v107 = v8;
      uint64_t v17 = swift_slowAlloc();
      v105 = v11;
      uint64_t v18 = (uint8_t *)v17;
      uint64_t v19 = swift_slowAlloc();
      uint64_t v106 = v7;
      uint64_t v20 = v19;
      v111[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      v104 = (uint8_t *)v10;
      uint64_t v21 = v4[10];
      unint64_t v22 = v4[11];
      swift_bridgeObjectRetain();
      uint64_t v112 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, v111);
      uint64_t v8 = v107;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v10 = (uint64_t)v104;
      swift_bridgeObjectRelease();
      swift_release();
      _os_log_impl(&dword_1A375F000, v15, v16, "[Topic Closed] Server bouncing, topic=%s", v18, 0xCu);
      swift_arrayDestroy();
      uint64_t v23 = v20;
      uint64_t v7 = v106;
      MEMORY[0x1A624F870](v23, -1, -1);
      uint64_t v24 = v18;
      uint64_t v11 = v105;
LABEL_11:
      MEMORY[0x1A624F870](v24, -1, -1);
LABEL_18:

      LOBYTE(v111[0]) = 3;
      dispatch thunk of StateMachine.execute(_:)();
      (*(void (**)(uint64_t))(*v4 + 520))(a1);
      int v44 = 1;
      goto LABEL_52;
    }
    goto LABEL_17;
  }
  uint64_t v107 = v8;
  switch(a1)
  {
    case 1:
      uint64_t v45 = v11;
      if (one-time initialization token for topic != -1) {
        swift_once();
      }
      uint64_t v46 = type metadata accessor for Logger();
      __swift_project_value_buffer(v46, (uint64_t)static Log.topic);
      swift_retain();
      uint64_t v47 = Logger.logObject.getter();
      os_log_type_t v48 = static os_log_type_t.default.getter();
      BOOL v49 = os_log_type_enabled(v47, v48);
      uint64_t v106 = v7;
      if (!v49) {
        goto LABEL_40;
      }
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      v111[0] = v51;
      *(_DWORD *)uint64_t v50 = 136315138;
      v105 = v50 + 4;
      uint64_t v53 = v4[10];
      unint64_t v52 = v4[11];
      swift_bridgeObjectRetain();
      uint64_t v112 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v53, v52, v111);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v54 = "[Topic Closed] Cryptor failure, topic=%s";
      goto LABEL_35;
    case 2:
      v55 = v11;
      if (one-time initialization token for topic != -1) {
        swift_once();
      }
      uint64_t v56 = type metadata accessor for Logger();
      __swift_project_value_buffer(v56, (uint64_t)static Log.topic);
      swift_retain();
      v57 = Logger.logObject.getter();
      os_log_type_t v58 = static os_log_type_t.default.getter();
      BOOL v59 = os_log_type_enabled(v57, v58);
      uint64_t v106 = v7;
      if (v59)
      {
        v60 = (uint8_t *)swift_slowAlloc();
        uint64_t v61 = swift_slowAlloc();
        v111[0] = v61;
        *(_DWORD *)v60 = 136315138;
        v105 = v60 + 4;
        uint64_t v63 = v4[10];
        unint64_t v62 = v4[11];
        swift_bridgeObjectRetain();
        uint64_t v112 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v63, v62, v111);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_release();
        _os_log_impl(&dword_1A375F000, v57, v58, "[Topic Closed] Unknown topic, topic=%s", v60, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1A624F870](v61, -1, -1);
        MEMORY[0x1A624F870](v60, -1, -1);
      }
      else
      {
        swift_release();
      }

      uint64_t v11 = v55;
      LOBYTE(v111[0]) = 3;
      uint64_t v92 = dispatch thunk of StateMachine.execute(_:)();
      uint64_t v93 = (*(uint64_t (**)(uint64_t))(*v4 + 464))(v92);
      uint64_t v8 = v107;
      if (!v93) {
        goto LABEL_51;
      }
      v86 = (void (*)(void))v93;
      lazy protocol witness table accessor for type Topic.Errors and conformance Topic.Errors();
      v88 = (void *)swift_allocError();
      char v89 = 2;
      goto LABEL_49;
    case 3:
      v64 = v11;
      if (one-time initialization token for topic != -1) {
        swift_once();
      }
      uint64_t v65 = type metadata accessor for Logger();
      __swift_project_value_buffer(v65, (uint64_t)static Log.topic);
      swift_retain();
      v66 = Logger.logObject.getter();
      os_log_type_t v67 = static os_log_type_t.default.getter();
      BOOL v68 = os_log_type_enabled(v66, v67);
      uint64_t v106 = v7;
      if (v68)
      {
        v69 = (uint8_t *)swift_slowAlloc();
        uint64_t v70 = swift_slowAlloc();
        v111[0] = v70;
        *(_DWORD *)v69 = 136315138;
        v105 = v69 + 4;
        uint64_t v72 = v4[10];
        unint64_t v71 = v4[11];
        swift_bridgeObjectRetain();
        uint64_t v112 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v72, v71, v111);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_release();
        _os_log_impl(&dword_1A375F000, v66, v67, "[Topic Closed] Message rejected, topic=%s", v69, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1A624F870](v70, -1, -1);
        MEMORY[0x1A624F870](v69, -1, -1);
      }
      else
      {
        swift_release();
      }

      uint64_t v11 = v64;
      LOBYTE(v111[0]) = 3;
      uint64_t v100 = dispatch thunk of StateMachine.execute(_:)();
      uint64_t v101 = (*(uint64_t (**)(uint64_t))(*v4 + 464))(v100);
      uint64_t v8 = v107;
      if (!v101) {
        goto LABEL_51;
      }
      v86 = (void (*)(void))v101;
      lazy protocol witness table accessor for type Topic.Errors and conformance Topic.Errors();
      v88 = (void *)swift_allocError();
      unsigned char *v102 = 3;
      goto LABEL_50;
    case 4:
      uint64_t v45 = v11;
      if (one-time initialization token for topic != -1) {
        swift_once();
      }
      uint64_t v73 = type metadata accessor for Logger();
      __swift_project_value_buffer(v73, (uint64_t)static Log.topic);
      swift_retain();
      uint64_t v47 = Logger.logObject.getter();
      os_log_type_t v48 = static os_log_type_t.default.getter();
      BOOL v74 = os_log_type_enabled(v47, v48);
      uint64_t v106 = v7;
      if (v74)
      {
        uint64_t v50 = (uint8_t *)swift_slowAlloc();
        uint64_t v51 = swift_slowAlloc();
        v111[0] = v51;
        *(_DWORD *)uint64_t v50 = 136315138;
        v105 = v50 + 4;
        uint64_t v76 = v4[10];
        unint64_t v75 = v4[11];
        swift_bridgeObjectRetain();
        uint64_t v112 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v76, v75, v111);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v54 = "[Topic Closed] Decryption queue size exceeded, topic=%s";
LABEL_35:
        _os_log_impl(&dword_1A375F000, v47, v48, v54, v50, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1A624F870](v51, -1, -1);
        MEMORY[0x1A624F870](v50, -1, -1);
      }
      else
      {
LABEL_40:
        swift_release();
      }

      uint64_t v11 = v45;
      LOBYTE(v111[0]) = 3;
      uint64_t v84 = dispatch thunk of StateMachine.execute(_:)();
      uint64_t v85 = (*(uint64_t (**)(uint64_t))(*v4 + 464))(v84);
      uint64_t v8 = v107;
      if (!v85) {
        goto LABEL_51;
      }
      v86 = (void (*)(void))v85;
      lazy protocol witness table accessor for type Topic.Errors and conformance Topic.Errors();
      v88 = (void *)swift_allocError();
      char v89 = 4;
      goto LABEL_49;
    case 5:
      v105 = v11;
      if (one-time initialization token for topic != -1) {
        swift_once();
      }
      uint64_t v77 = type metadata accessor for Logger();
      __swift_project_value_buffer(v77, (uint64_t)static Log.topic);
      swift_retain();
      v78 = Logger.logObject.getter();
      os_log_type_t v79 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v78, v79))
      {
        v80 = (uint8_t *)swift_slowAlloc();
        uint64_t v81 = swift_slowAlloc();
        v111[0] = v81;
        *(_DWORD *)v80 = 136315138;
        v104 = v80 + 4;
        uint64_t v83 = v4[10];
        unint64_t v82 = v4[11];
        swift_bridgeObjectRetain();
        uint64_t v112 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v83, v82, v111);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_release();
        _os_log_impl(&dword_1A375F000, v78, v79, "[Topic Closed] Successfully unsubscribed, topic=%s", v80, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1A624F870](v81, -1, -1);
        MEMORY[0x1A624F870](v80, -1, -1);
      }
      else
      {
        swift_release();
      }

      uint64_t v11 = v105;
      LOBYTE(v111[0]) = 2;
      dispatch thunk of StateMachine.execute(_:)();
      int v44 = 0;
      uint64_t v8 = v107;
      break;
    default:
      uint64_t v35 = v11;
      if (one-time initialization token for topic != -1) {
        swift_once();
      }
      uint64_t v36 = type metadata accessor for Logger();
      __swift_project_value_buffer(v36, (uint64_t)static Log.topic);
      swift_retain();
      uint64_t v37 = Logger.logObject.getter();
      os_log_type_t v38 = static os_log_type_t.default.getter();
      BOOL v39 = os_log_type_enabled(v37, v38);
      uint64_t v106 = v7;
      if (v39)
      {
        uint64_t v40 = (uint8_t *)swift_slowAlloc();
        uint64_t v41 = swift_slowAlloc();
        v111[0] = v41;
        *(_DWORD *)uint64_t v40 = 136315138;
        v105 = v40 + 4;
        uint64_t v43 = v4[10];
        unint64_t v42 = v4[11];
        swift_bridgeObjectRetain();
        uint64_t v112 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v43, v42, v111);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_release();
        _os_log_impl(&dword_1A375F000, v37, v38, "[Topic Closed] Became unavailable topic=%s", v40, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1A624F870](v41, -1, -1);
        MEMORY[0x1A624F870](v40, -1, -1);
      }
      else
      {
        swift_release();
      }

      uint64_t v11 = v35;
      LOBYTE(v111[0]) = 3;
      uint64_t v90 = dispatch thunk of StateMachine.execute(_:)();
      uint64_t v91 = (*(uint64_t (**)(uint64_t))(*v4 + 464))(v90);
      uint64_t v8 = v107;
      if (!v91) {
        goto LABEL_51;
      }
      v86 = (void (*)(void))v91;
      lazy protocol witness table accessor for type Topic.Errors and conformance Topic.Errors();
      v88 = (void *)swift_allocError();
      char v89 = 1;
LABEL_49:
      char *v87 = v89;
LABEL_50:
      v86();
      outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?((uint64_t)v86);

LABEL_51:
      int v44 = 0;
      uint64_t v7 = v106;
      break;
  }
LABEL_52:
  swift_beginAccess();
  v4[2] = 0;
  uint64_t v94 = swift_release();
  if (v4[2])
  {
    swift_retain();
    v95 = v109;
    PubSubTopic.$subscribers.getter();
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type Published<[UInt64 : PubSubTopic.Participant]>.Publisher and conformance Published<A>.Publisher, &demangling cache variable for type metadata for Published<[UInt64 : PubSubTopic.Participant]>.Publisher);
    lazy protocol witness table accessor for type [UInt64 : PubSubTopic.Participant] and conformance <> [A : B]();
    v96 = v110;
    Publisher<>.removeDuplicates()();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v95, v7);
    v97 = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))(*v4 + 456))(v111);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type Publishers.RemoveDuplicates<Published<[UInt64 : PubSubTopic.Participant]>.Publisher> and conformance Publishers.RemoveDuplicates<A>, (uint64_t *)&demangling cache variable for type metadata for Publishers.RemoveDuplicates<Published<[UInt64 : PubSubTopic.Participant]>.Publisher>);
    Publisher<>.assign(to:)();
    (*((void (**)(char *, uint64_t))v11 + 1))(v96, v10);
    v97(v111, 0);
    uint64_t v94 = swift_release();
  }
  if (v44)
  {
    MEMORY[0x1F4188790](v94);
    *(&v103 - 2) = v108;
    *(&v103 - 1) = (uint64_t)v4;
    swift_retain();
    Lock.withLock<A>(_:)();
    uint64_t v98 = swift_release();
    return (*(uint64_t (**)(uint64_t))(*v4 + 592))(v98);
  }
  else
  {
    swift_retain();
    Lock.withLock<A>(_:)();
    swift_release();
    v4[9] = 0;
    return swift_release();
  }
}

void (*specialized Topic.catchupNeeded(topic:catchupSender:completion:)(uint64_t a1, void (*a2)(void)))(uint64_t)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<(), TopicCatchupError>);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for topic != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  __swift_project_value_buffer(v9, (uint64_t)static Log.topic);
  swift_retain();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v22 = a2;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v23 = a1;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v25 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    v21[0] = v13 + 4;
    v21[1] = v6;
    uint64_t v15 = v3[10];
    unint64_t v16 = v3[11];
    swift_bridgeObjectRetain();
    uint64_t v24 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v25);
    a2 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A375F000, v10, v11, "Catchup is needed, topic=%s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A624F870](v14, -1, -1);
    uint64_t v17 = v13;
    a1 = v23;
    MEMORY[0x1A624F870](v17, -1, -1);
  }
  else
  {

    swift_release();
  }
  swift_storeEnumTagMultiPayload();
  a2(v8);
  uint64_t v18 = outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v8, &demangling cache variable for type metadata for Result<(), TopicCatchupError>);
  uint64_t result = (void (*)(uint64_t))(*(uint64_t (**)(uint64_t))(*v3 + 368))(v18);
  if (result)
  {
    uint64_t v20 = (uint64_t)result;
    result(a1);
    return (void (*)(uint64_t))outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v20);
  }
  return result;
}

uint64_t sub_1A38C85FC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 216))();
  *a2 = result;
  return result;
}

uint64_t sub_1A38C8648()
{
  uint64_t v0 = swift_retain();
  specialized Topic.topic.setter(v0);

  return swift_release();
}

uint64_t sub_1A38C86A4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 392))();
  *a2 = result;
  return result;
}

uint64_t sub_1A38C86F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 400);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t sub_1A38C8754(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 440))();
}

uint64_t sub_1A38C87B4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 512))();
  *a2 = result;
  return result;
}

uint64_t sub_1A38C8808(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 520);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t ObjC metadata update function for Topic()
{
  return type metadata accessor for Topic();
}

void type metadata completion function for Topic()
{
  type metadata accessor for Published<[UInt64 : PubSubTopic.Participant]>();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for Topic(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Topic);
}

uint64_t dispatch thunk of Topic.topic.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of Topic.state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of Topic.receivedDataHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of Topic.receivedDataHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of Topic.receivedDataHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of Topic.pubSubStateChangedHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of Topic.pubSubStateChangedHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of Topic.pubSubStateChangedHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of Topic.catchupNeededHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of Topic.catchupNeededHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of Topic.catchupNeededHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of Topic.dataCryptor.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of Topic.dataCryptor.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of Topic.dataCryptor.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of Topic.subscribedParticipants.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of Topic.subscribedParticipants.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of Topic.subscribedParticipants.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of Topic.$subscribedParticipants.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of Topic.$subscribedParticipants.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of Topic.$subscribedParticipants.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of Topic.invalidationHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464))();
}

uint64_t dispatch thunk of Topic.invalidationHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472))();
}

uint64_t dispatch thunk of Topic.invalidationHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 480))();
}

uint64_t dispatch thunk of Topic.requestEncryptionKeysHandler.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 488))();
}

uint64_t dispatch thunk of Topic.requestEncryptionKeysHandler.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t dispatch thunk of Topic.requestEncryptionKeysHandler.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of Topic.seqNumWatermark.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512))();
}

uint64_t dispatch thunk of Topic.seqNumWatermark.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of Topic.seqNumWatermark.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 528))();
}

uint64_t dispatch thunk of Topic.__allocating_init(name:delegate:pubSubTopicGenerator:)()
{
  return (*(uint64_t (**)(void))(v0 + 584))();
}

uint64_t dispatch thunk of Topic.subscribe()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 592))();
}

uint64_t dispatch thunk of Topic.unsubscribe()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 600))();
}

uint64_t dispatch thunk of Topic.sendData(_:to:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 608))();
}

ValueMetadata *type metadata accessor for Topic.State()
{
  return &type metadata for Topic.State;
}

unsigned char *storeEnumTagSinglePayload for Topic.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 4;
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
        JUMPOUT(0x1A38C9050);
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
          void *result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Topic.Errors()
{
  return &type metadata for Topic.Errors;
}

uint64_t destroy for Topic.BootstrapPubSubTopicInfo(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Topic.BootstrapPubSubTopicInfo(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for Topic.BootstrapPubSubTopicInfo(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  uint64_t v4 = a2[6];
  a1[5] = a2[5];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[6] = v4;
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Topic.BootstrapPubSubTopicInfo(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_unknownObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Topic.BootstrapPubSubTopicInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Topic.BootstrapPubSubTopicInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Topic.BootstrapPubSubTopicInfo()
{
  return &type metadata for Topic.BootstrapPubSubTopicInfo;
}

uint64_t destroy for Topic.PendingMessage(uint64_t *a1)
{
  outlined consume of Data._Representation(*a1, a1[1]);
  uint64_t result = swift_bridgeObjectRelease();
  if (a1[5])
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for Topic.PendingMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  outlined copy of Data._Representation(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  swift_bridgeObjectRetain();
  if (v6)
  {
    uint64_t v8 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v6;
    *(void *)(a1 + 48) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  }
  return a1;
}

uint64_t assignWithCopy for Topic.PendingMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  outlined copy of Data._Representation(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  outlined consume of Data._Representation(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a1 + 40);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v8;
  uint64_t v10 = *(void *)(a2 + 40);
  if (!v9)
  {
    if (v10)
    {
      uint64_t v12 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = v10;
      *(void *)(a1 + 48) = v12;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    return a1;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v11 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = v11;
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for Topic.PendingMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  outlined consume of Data._Representation(v4, v5);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a1 + 40);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  if (!v7)
  {
    if (v6)
    {
      uint64_t v9 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = v6;
      *(void *)(a1 + 48) = v9;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    return a1;
  }
  if (!v6)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v8;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Topic.PendingMessage(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Topic.PendingMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Topic.PendingMessage()
{
  return &type metadata for Topic.PendingMessage;
}

unsigned char *storeEnumTagSinglePayload for Topic.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 3;
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
        JUMPOUT(0x1A38C96C8);
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
          void *result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Topic.Event()
{
  return &type metadata for Topic.Event;
}

uint64_t _ss5Error_pIegg_sAA_pytIegnr_TRTA_0(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t _ss6UInt64VIegy_ABytIegnr_TRTA_0(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Data, @in_guaranteed UInt64, @in_guaranteed [UInt64]?) -> (@out ())(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(uint64_t (**)(void *, uint64_t *, uint64_t *))(v4 + 16);
  v9[0] = a1;
  v9[1] = a2;
  uint64_t v7 = a4;
  uint64_t v8 = a3;
  return v5(v9, &v8, &v7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64, @guaranteed [UInt64]?) -> ()(void *a1, void *a2, void *a3)
{
  return (*(uint64_t (**)(void, void, void, void))(v3 + 16))(*a1, a1[1], *a2, *a3);
}

uint64_t lazy protocol witness table accessor for type Topic and conformance Topic(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t partial apply for closure #2 in Topic.topicClosed(topic:reason:unackedMessages:)()
{
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC15GroupActivities5Topic_pendingMessages);
  swift_beginAccess();
  void *v1 = MEMORY[0x1E4FBC860];
  return swift_bridgeObjectRelease();
}

uint64_t partial apply for closure #1 in Topic.topicClosed(topic:reason:unackedMessages:)()
{
  return closure #1 in Topic.topicClosed(topic:reason:unackedMessages:)(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t partial apply for closure #1 in closure #1 in Topic._sendData(_:to:previousSeqNumUnacked:completion:)()
{
  return closure #1 in closure #1 in Topic._sendData(_:to:previousSeqNumUnacked:completion:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72));
}

uint64_t partial apply for closure #1 in closure #3 in Topic.subscribe()()
{
  return closure #1 in closure #3 in Topic.subscribe()(v0);
}

uint64_t partial apply for closure #2 in closure #3 in Topic.subscribe()()
{
  return closure #2 in closure #3 in Topic.subscribe()(v0);
}

uint64_t objectdestroy_106Tm()
{
  swift_release();
  swift_release();
  outlined consume of Data._Representation(v0[4], v0[5]);
  swift_bridgeObjectRelease();
  if (v0[9]) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 88, 7);
}

uint64_t partial apply for closure #1 in Topic._sendData(_:to:previousSeqNumUnacked:completion:)()
{
  return closure #1 in Topic._sendData(_:to:previousSeqNumUnacked:completion:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(unsigned __int8 *)(v0 + 64), *(uint64_t (**)(void))(v0 + 72));
}

uint64_t partial apply for closure #1 in closure #2 in Topic.subscribe()()
{
  return closure #1 in closure #2 in Topic.subscribe()(v0);
}

GroupActivities::AbsoluteSpatialTemplateOutput::Role __swiftcall AbsoluteSpatialTemplateOutput.Role.init(identifier:)(GroupActivities::AbsoluteSpatialTemplateOutput::Role identifier)
{
  GroupActivities::AbsoluteSpatialTemplateOutput::Role *v1 = identifier;
  return identifier;
}

GroupActivities::AbsoluteSpatialTemplateOutput __swiftcall AbsoluteSpatialTemplateOutput.init(elements:defaultInitiatorRole:)(Swift::OpaquePointer elements, GroupActivities::AbsoluteSpatialTemplateOutput::Role_optional defaultInitiatorRole)
{
  *(Swift::OpaquePointer *)uint64_t v2 = elements;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)defaultInitiatorRole.value.identifier._countAndFlagsBits;
  result.defaultInitiatorRole = defaultInitiatorRole;
  result.elements = elements;
  return result;
}

uint64_t SpatialTemplatePreferenceOutput.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(result + 8);
  uint64_t v3 = qword_1A38FEB38[*(char *)(result + 9)];
  *(void *)a2 = *(void *)result;
  *(unsigned char *)(a2 + 8) = v2;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 16) = v3;
  *(unsigned char *)(a2 + 40) = 2;
  return result;
}

GroupActivities::PresentationTemplateOutput __swiftcall PresentationTemplateOutput.init(assignInitiatorToPresenterRole:)(GroupActivities::PresentationTemplateOutput assignInitiatorToPresenterRole)
{
  v1->assignInitiatorToPresenterRole = assignInitiatorToPresenterRole.assignInitiatorToPresenterRole;
  return assignInitiatorToPresenterRole;
}

__n128 AbsoluteSpatialTemplateOutput.Element.Seat.init(role:position:direction:)@<Q0>(long long *a1@<X0>, long long *a2@<X1>, __n128 *a3@<X2>, uint64_t a4@<X8>)
{
  long long v4 = *a2;
  uint64_t v5 = *((void *)a2 + 3);
  unint64_t v6 = a3->n128_u64[0];
  char v7 = a3[3].n128_i8[0];
  long long v8 = *a1;
  *(void *)(a4 + 32) = *((void *)a2 + 2);
  *(void *)(a4 + 40) = v5;
  *(_OWORD *)a4 = v8;
  *(_OWORD *)(a4 + 16) = v4;
  *(void *)(a4 + 48) = v6;
  __n128 result = a3[1];
  __n128 v10 = a3[2];
  *(__n128 *)(a4 + 64) = result;
  *(__n128 *)(a4 + 80) = v10;
  *(unsigned char *)(a4 + 96) = v7;
  return result;
}

uint64_t AbsoluteSpatialTemplateOutput.Element.Direction.init(anchor:rotation:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v3 = *(void *)result;
  int v4 = *(unsigned __int8 *)(result + 32);
  if (v4 == 1)
  {
    uint64_t v5 = 0;
    BOOL v6 = v3 == 2;
    BOOL v7 = v3 == 4;
    uint64_t v3 = 2;
    if (!v7) {
      uint64_t v3 = v6;
    }
    long long v8 = 0uLL;
  }
  else
  {
    uint64_t v5 = *(void *)(result + 24);
    long long v8 = *(_OWORD *)(result + 8);
  }
  *(double *)a2 = a3;
  *(void *)(a2 + 16) = v3;
  *(_OWORD *)(a2 + 24) = v8;
  *(void *)(a2 + 40) = v5;
  *(unsigned char *)(a2 + 48) = v4;
  return result;
}

unsigned char *AbsoluteSpatialTemplateOutput.Element.Direction.Anchor.init(alignedWith:)@<X0>(unsigned char *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = 4;
  if (!*result) {
    uint64_t v2 = 1;
  }
  *(void *)a2 = v2;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(unsigned char *)(a2 + 32) = 1;
  return result;
}

void AbsoluteSpatialTemplateOutput.Element.Direction.anchor.getter(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  char v3 = *(unsigned char *)(v1 + 48);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v2 = qword_1A38FEB60[(char)v2];
    long long v5 = 0uLL;
  }
  else
  {
    uint64_t v4 = *(void *)(v1 + 40);
    long long v5 = *(_OWORD *)(v1 + 24);
  }
  *(void *)a1 = v2;
  *(_OWORD *)(a1 + 8) = v5;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v3;
}

void AbsoluteSpatialTemplateOutput.Element.Position.init(anchor:offset:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
}

BOOL static AbsoluteSpatialTemplateOutput.Element.Position.== infix(_:_:)(double *a1, double *a2)
{
  BOOL v2 = *a1 == *a2;
  if (a1[1] != a2[1]) {
    BOOL v2 = 0;
  }
  return a1[2] == a2[2] && v2;
}

uint64_t SpatialTemplatePreferenceOutput.contentExtent.getter()
{
  return *(void *)v0;
}

uint64_t SpatialTemplatePreferenceOutput.template.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 32);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  char v5 = *(unsigned char *)(v1 + 40);
  *(unsigned char *)(a1 + 24) = v5;
  return outlined copy of SpatialTemplatePreferenceOutput.SpatialTemplate(v2, v3, v4, v5);
}

void SpatialTemplatePreferenceOutput.SpatialTemplate.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)v2;
  uint64_t v5 = *(void *)(v2 + 8);
  uint64_t v6 = *(void *)(v2 + 16);
  int v7 = *(unsigned __int8 *)(v2 + 24);
  if (v7)
  {
    if (v7 == 1)
    {
      Hasher._combine(_:)(5uLL);
      Hasher._combine(_:)(v4 & 1);
    }
    else
    {
      uint64_t v8 = v6 | v5;
      if (v6 | v5 | v4)
      {
        if (v4 == 1 && v8 == 0)
        {
          Swift::UInt v10 = 2;
        }
        else if (v4 != 2 || v8)
        {
          Swift::UInt v10 = 4;
        }
        else
        {
          Swift::UInt v10 = 3;
        }
      }
      else
      {
        Swift::UInt v10 = 1;
      }
      Hasher._combine(_:)(v10);
    }
  }
  else
  {
    Hasher._combine(_:)(0);
    specialized Array<A>.hash(into:)(a1, v4);
    if (v6)
    {
      Hasher._combine(_:)(1u);
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
    }
    else
    {
      Hasher._combine(_:)(0);
    }
  }
}

BOOL static PresentationTemplateOutput.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys()
{
  uint64_t result = 0x62416D6F74737563;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x61737265766E6F63;
      break;
    case 2:
      uint64_t result = 0x6953794265646973;
      break;
    case 3:
      uint64_t result = 0x646E756F72727573;
      break;
    case 4:
      uint64_t result = 1701736302;
      break;
    case 5:
      uint64_t result = 0x61746E6573657270;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys()
{
  return 12383;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SpatialTemplatePreferenceOutput.SpatialTemplate.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys>);
  uint64_t v50 = *(void *)(v3 - 8);
  uint64_t v51 = v3;
  MEMORY[0x1F4188790](v3);
  BOOL v49 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys>);
  uint64_t v40 = *(void *)(v5 - 8);
  uint64_t v41 = v5;
  MEMORY[0x1F4188790](v5);
  BOOL v39 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys>);
  uint64_t v37 = *(void *)(v7 - 8);
  uint64_t v38 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v36 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys>);
  uint64_t v43 = *(void *)(v9 - 8);
  uint64_t v44 = v9;
  MEMORY[0x1F4188790](v9);
  unint64_t v42 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys>);
  uint64_t v46 = *(void *)(v11 - 8);
  uint64_t v47 = v11;
  MEMORY[0x1F4188790](v11);
  uint64_t v45 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys>);
  uint64_t v48 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys>);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v52 = v16;
  uint64_t v53 = v17;
  MEMORY[0x1F4188790](v16);
  uint64_t v19 = v1[1];
  uint64_t v57 = *v1;
  uint64_t v20 = v1[2];
  int v21 = *((unsigned __int8 *)v1 + 24);
  uint64_t v22 = a1[3];
  uint64_t v23 = a1;
  uint64_t v24 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(v23, v22);
  lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if (v21)
  {
    if (v21 == 1)
    {
      LOBYTE(v54) = 5;
      lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys();
      uint64_t v25 = v49;
      uint64_t v26 = v52;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      LOBYTE(v54) = v57 & 1;
      lazy protocol witness table accessor for type PresentationTemplateOutput and conformance PresentationTemplateOutput();
      uint64_t v27 = v51;
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v25, v27);
      return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v24, v26);
    }
    else
    {
      uint64_t v30 = v20 | v19;
      if (v20 | v19 | v57)
      {
        if (v57 != 1 || v30)
        {
          if (v57 != 2 || v30)
          {
            LOBYTE(v54) = 4;
            lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys();
            uint64_t v31 = v39;
            uint64_t v32 = v52;
            KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
            uint64_t v34 = v40;
            uint64_t v33 = v41;
          }
          else
          {
            LOBYTE(v54) = 3;
            lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys();
            uint64_t v31 = v36;
            uint64_t v32 = v52;
            KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
            uint64_t v34 = v37;
            uint64_t v33 = v38;
          }
        }
        else
        {
          LOBYTE(v54) = 2;
          lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys();
          uint64_t v31 = v42;
          uint64_t v32 = v52;
          KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          uint64_t v34 = v43;
          uint64_t v33 = v44;
        }
      }
      else
      {
        LOBYTE(v54) = 1;
        lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys();
        uint64_t v31 = v45;
        uint64_t v32 = v52;
        KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
        uint64_t v34 = v46;
        uint64_t v33 = v47;
      }
      (*(void (**)(char *, uint64_t))(v34 + 8))(v31, v33);
      return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v24, v32);
    }
  }
  else
  {
    LOBYTE(v54) = 0;
    lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys();
    uint64_t v29 = v52;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v54 = v57;
    uint64_t v55 = v19;
    uint64_t v56 = v20;
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput and conformance AbsoluteSpatialTemplateOutput();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v15, v13);
    return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v24, v29);
  }
}

Swift::Int SpatialTemplatePreferenceOutput.SpatialTemplate.hashValue.getter()
{
  uint64_t v1 = *((void *)v0 + 2);
  char v2 = *((unsigned char *)v0 + 24);
  long long v5 = *v0;
  uint64_t v6 = v1;
  char v7 = v2;
  Hasher.init(_seed:)();
  SpatialTemplatePreferenceOutput.SpatialTemplate.hash(into:)((uint64_t)v4);
  return Hasher._finalize()();
}

uint64_t SpatialTemplatePreferenceOutput.SpatialTemplate.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  os_log_type_t v58 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v55 = v3;
  uint64_t v56 = v4;
  MEMORY[0x1F4188790](v3);
  uint64_t v61 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys>);
  uint64_t v46 = *(void *)(v54 - 8);
  MEMORY[0x1F4188790](v54);
  v60 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys>);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v52 = v7;
  uint64_t v53 = v8;
  MEMORY[0x1F4188790](v7);
  BOOL v59 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys>);
  uint64_t v50 = *(void *)(v10 - 8);
  uint64_t v51 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v57 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys>);
  uint64_t v48 = *(void *)(v12 - 8);
  uint64_t v49 = v12;
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys>);
  uint64_t v47 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys>);
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  int v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = a1[3];
  unint64_t v62 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys();
  uint64_t v23 = v65;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v23) {
    goto LABEL_6;
  }
  uint64_t v45 = v17;
  uint64_t v44 = v15;
  uint64_t v24 = v59;
  uint64_t v25 = v60;
  uint64_t v26 = v61;
  uint64_t v65 = v19;
  uint64_t v27 = KeyedDecodingContainer.allKeys.getter();
  if (*(void *)(v27 + 16) != 1)
  {
    uint64_t v33 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v35 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *uint64_t v35 = &type metadata for SpatialTemplatePreferenceOutput.SpatialTemplate;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v33 - 8) + 104))(v35, *MEMORY[0x1E4FBBA70], v33);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v21, v18);
LABEL_6:
    uint64_t v36 = (uint64_t)v62;
    return __swift_destroy_boxed_opaque_existential_1Tm(v36);
  }
  switch(*(unsigned char *)(v27 + 32))
  {
    case 1:
      LOBYTE(v63) = 1;
      lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v14, v49);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v21, v18);
      uint64_t v31 = 0;
      long long v32 = 0uLL;
      goto LABEL_11;
    case 2:
      LOBYTE(v63) = 2;
      lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys();
      uint64_t v38 = v57;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v38, v51);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v21, v18);
      long long v32 = 0uLL;
      char v30 = 2;
      uint64_t v31 = 1;
      break;
    case 3:
      LOBYTE(v63) = 3;
      lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v24, v52);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v21, v18);
      long long v32 = 0uLL;
      uint64_t v31 = 2;
LABEL_11:
      char v30 = 2;
      break;
    case 4:
      LOBYTE(v63) = 4;
      lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v25, v54);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v21, v18);
      long long v32 = 0uLL;
      char v30 = 2;
      uint64_t v31 = 3;
      break;
    case 5:
      LOBYTE(v63) = 5;
      lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys();
      BOOL v39 = v26;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      lazy protocol witness table accessor for type PresentationTemplateOutput and conformance PresentationTemplateOutput();
      uint64_t v40 = v55;
      KeyedDecodingContainer.decode<A>(_:forKey:)();
      uint64_t v41 = v65;
      (*(void (**)(char *, uint64_t))(v56 + 8))(v39, v40);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v21, v18);
      uint64_t v31 = v63;
      long long v32 = 0uLL;
      char v30 = 1;
      break;
    default:
      LOBYTE(v63) = 0;
      lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys();
      uint64_t v28 = v45;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput and conformance AbsoluteSpatialTemplateOutput();
      uint64_t v29 = v44;
      KeyedDecodingContainer.decode<A>(_:forKey:)();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v28, v29);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v21, v18);
      char v30 = 0;
      uint64_t v31 = v63;
      long long v32 = v64;
      break;
  }
  uint64_t v36 = (uint64_t)v62;
  unint64_t v42 = v58;
  *os_log_type_t v58 = v31;
  *(_OWORD *)(v42 + 1) = v32;
  *((unsigned char *)v42 + 24) = v30;
  return __swift_destroy_boxed_opaque_existential_1Tm(v36);
}

uint64_t protocol witness for Decodable.init(from:) in conformance SpatialTemplatePreferenceOutput.SpatialTemplate@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return SpatialTemplatePreferenceOutput.SpatialTemplate.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance SpatialTemplatePreferenceOutput.SpatialTemplate(void *a1)
{
  return SpatialTemplatePreferenceOutput.SpatialTemplate.encode(to:)(a1);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SpatialTemplatePreferenceOutput.SpatialTemplate()
{
  uint64_t v1 = *((void *)v0 + 2);
  char v2 = *((unsigned char *)v0 + 24);
  long long v5 = *v0;
  uint64_t v6 = v1;
  char v7 = v2;
  Hasher.init(_seed:)();
  SpatialTemplatePreferenceOutput.SpatialTemplate.hash(into:)((uint64_t)v4);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SpatialTemplatePreferenceOutput.SpatialTemplate()
{
  uint64_t v1 = *((void *)v0 + 2);
  char v2 = *((unsigned char *)v0 + 24);
  long long v5 = *v0;
  uint64_t v6 = v1;
  char v7 = v2;
  Hasher.init(_seed:)();
  SpatialTemplatePreferenceOutput.SpatialTemplate.hash(into:)((uint64_t)v4);
  return Hasher._finalize()();
}

__n128 SpatialTemplatePreferenceOutput.init(template:contentExtent:)@<Q0>(__n128 *a1@<X0>, unint64_t a2@<X1>, char a3@<W2>, __n128 *a4@<X8>)
{
  unint64_t v4 = a1[1].n128_u64[0];
  unsigned __int8 v5 = a1[1].n128_u8[8];
  a4->n128_u64[0] = a2;
  a4->n128_u8[8] = a3 & 1;
  __n128 result = *a1;
  a4[1] = *a1;
  a4[2].n128_u64[0] = v4;
  a4[2].n128_u8[8] = v5;
  return result;
}

void SpatialTemplatePreferenceOutput.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 24);
  uint64_t v6 = *(void *)(v2 + 32);
  int v7 = *(unsigned __int8 *)(v2 + 40);
  if (*(unsigned char *)(v2 + 8) == 1)
  {
    Hasher._combine(_:)(0);
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    Swift::UInt64 v8 = *(void *)v2;
    Hasher._combine(_:)(1u);
    if ((v8 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
      Swift::UInt64 v9 = v8;
    }
    else {
      Swift::UInt64 v9 = 0;
    }
    Hasher._combine(_:)(v9);
    if (v7)
    {
LABEL_3:
      if (v7 == 1)
      {
        Hasher._combine(_:)(5uLL);
        Hasher._combine(_:)(v4 & 1);
      }
      else
      {
        uint64_t v13 = v6 | v5;
        if (v6 | v5 | v4)
        {
          if (v4 != 1 || v13)
          {
            if (v4 != 2 || v13) {
              Swift::UInt v14 = 4;
            }
            else {
              Swift::UInt v14 = 3;
            }
          }
          else
          {
            Swift::UInt v14 = 2;
          }
        }
        else
        {
          Swift::UInt v14 = 1;
        }
        Hasher._combine(_:)(v14);
      }
      return;
    }
  }
  Hasher._combine(_:)(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array<A>.hash(into:)(a1, v4);
  if (v6)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    uint64_t v10 = v4;
    uint64_t v11 = v5;
    uint64_t v12 = v6;
  }
  else
  {
    Hasher._combine(_:)(0);
    uint64_t v10 = v4;
    uint64_t v11 = v5;
    uint64_t v12 = 0;
  }

  outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(v10, v11, v12, 0);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SpatialTemplatePreferenceOutput.CodingKeys()
{
  if (*v0) {
    return 0x6574616C706D6574;
  }
  else {
    return 0x45746E65746E6F63;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SpatialTemplatePreferenceOutput.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized SpatialTemplatePreferenceOutput.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SpatialTemplatePreferenceOutput.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SpatialTemplatePreferenceOutput.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t SpatialTemplatePreferenceOutput.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SpatialTemplatePreferenceOutput.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  char v8 = *((unsigned char *)v1 + 8);
  uint64_t v9 = v1[2];
  uint64_t v13 = v1[3];
  uint64_t v14 = v9;
  uint64_t v12 = v1[4];
  int v20 = *((unsigned __int8 *)v1 + 40);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v16 = v7;
  LOBYTE(v17) = v8;
  char v21 = 0;
  lazy protocol witness table accessor for type CGFloat and conformance CGFloat();
  uint64_t v10 = v15;
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  if (!v10)
  {
    uint64_t v16 = v14;
    uint64_t v17 = v13;
    uint64_t v18 = v12;
    char v19 = v20;
    char v21 = 1;
    lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate and conformance SpatialTemplatePreferenceOutput.SpatialTemplate();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

Swift::Int SpatialTemplatePreferenceOutput.hashValue.getter()
{
  Swift::UInt64 v1 = *(void *)v0;
  int v2 = *(unsigned __int8 *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  int v6 = *(unsigned __int8 *)(v0 + 40);
  Hasher.init(_seed:)();
  if (v2 == 1)
  {
    Hasher._combine(_:)(0);
    if (v6) {
      goto LABEL_3;
    }
LABEL_9:
    Hasher._combine(_:)(0);
    specialized Array<A>.hash(into:)((uint64_t)v11, v3);
    if (v5)
    {
      Hasher._combine(_:)(1u);
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
    }
    else
    {
      Hasher._combine(_:)(0);
    }
    return Hasher._finalize()();
  }
  Hasher._combine(_:)(1u);
  if ((v1 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v7 = v1;
  }
  else {
    Swift::UInt64 v7 = 0;
  }
  Hasher._combine(_:)(v7);
  if (!v6) {
    goto LABEL_9;
  }
LABEL_3:
  if (v6 == 1)
  {
    Hasher._combine(_:)(5uLL);
    Hasher._combine(_:)(v3 & 1);
  }
  else
  {
    uint64_t v8 = v5 | v4;
    if (v5 | v4 | v3)
    {
      if (v3 != 1 || v8)
      {
        if (v3 != 2 || v8) {
          Swift::UInt v9 = 4;
        }
        else {
          Swift::UInt v9 = 3;
        }
      }
      else
      {
        Swift::UInt v9 = 2;
      }
    }
    else
    {
      Swift::UInt v9 = 1;
    }
    Hasher._combine(_:)(v9);
  }
  return Hasher._finalize()();
}

uint64_t SpatialTemplatePreferenceOutput.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SpatialTemplatePreferenceOutput.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    char v18 = 0;
    lazy protocol witness table accessor for type CGFloat and conformance CGFloat();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    uint64_t v9 = v15;
    char v10 = BYTE8(v15);
    char v18 = 1;
    lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate and conformance SpatialTemplatePreferenceOutput.SpatialTemplate();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v11 = v16;
    char v12 = v17;
    long long v13 = v15;
    *(void *)a2 = v9;
    *(unsigned char *)(a2 + 8) = v10;
    *(_OWORD *)(a2 + 16) = v13;
    *(void *)(a2 + 32) = v11;
    *(unsigned char *)(a2 + 40) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t protocol witness for Decodable.init(from:) in conformance SpatialTemplatePreferenceOutput@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SpatialTemplatePreferenceOutput.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance SpatialTemplatePreferenceOutput(void *a1)
{
  return SpatialTemplatePreferenceOutput.encode(to:)(a1);
}

void protocol witness for Hashable.hash(into:) in conformance SpatialTemplatePreferenceOutput(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v2 + 24);
  uint64_t v6 = *(void *)(v2 + 32);
  int v7 = *(unsigned __int8 *)(v2 + 40);
  if (*(unsigned char *)(v2 + 8) == 1)
  {
    Hasher._combine(_:)(0);
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    Swift::UInt64 v8 = *(void *)v2;
    Hasher._combine(_:)(1u);
    if ((v8 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
      Swift::UInt64 v9 = v8;
    }
    else {
      Swift::UInt64 v9 = 0;
    }
    Hasher._combine(_:)(v9);
    if (v7)
    {
LABEL_3:
      if (v7 == 1)
      {
        Hasher._combine(_:)(5uLL);
        Hasher._combine(_:)(v4 & 1);
      }
      else
      {
        uint64_t v10 = v6 | v5;
        if (v6 | v5 | v4)
        {
          if (v4 != 1 || v10)
          {
            if (v4 != 2 || v10) {
              Swift::UInt v11 = 4;
            }
            else {
              Swift::UInt v11 = 3;
            }
          }
          else
          {
            Swift::UInt v11 = 2;
          }
        }
        else
        {
          Swift::UInt v11 = 1;
        }
        Hasher._combine(_:)(v11);
      }
      return;
    }
  }
  Hasher._combine(_:)(0);
  specialized Array<A>.hash(into:)(a1, v4);
  if (v6)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SpatialTemplatePreferenceOutput()
{
  Swift::UInt64 v1 = *(void *)v0;
  int v2 = *(unsigned __int8 *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = *(void *)(v0 + 32);
  int v6 = *(unsigned __int8 *)(v0 + 40);
  Hasher.init(_seed:)();
  if (v2 == 1)
  {
    Hasher._combine(_:)(0);
    if (v6) {
      goto LABEL_3;
    }
LABEL_9:
    Hasher._combine(_:)(0);
    specialized Array<A>.hash(into:)((uint64_t)v11, v3);
    if (v5)
    {
      Hasher._combine(_:)(1u);
      swift_bridgeObjectRetain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
    }
    else
    {
      Hasher._combine(_:)(0);
    }
    return Hasher._finalize()();
  }
  Hasher._combine(_:)(1u);
  if ((v1 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v7 = v1;
  }
  else {
    Swift::UInt64 v7 = 0;
  }
  Hasher._combine(_:)(v7);
  if (!v6) {
    goto LABEL_9;
  }
LABEL_3:
  if (v6 == 1)
  {
    Hasher._combine(_:)(5uLL);
    Hasher._combine(_:)(v3 & 1);
  }
  else
  {
    uint64_t v8 = v5 | v4;
    if (v5 | v4 | v3)
    {
      if (v3 != 1 || v8)
      {
        if (v3 != 2 || v8) {
          Swift::UInt v9 = 4;
        }
        else {
          Swift::UInt v9 = 3;
        }
      }
      else
      {
        Swift::UInt v9 = 2;
      }
    }
    else
    {
      Swift::UInt v9 = 1;
    }
    Hasher._combine(_:)(v9);
  }
  return Hasher._finalize()();
}

uint64_t AbsoluteSpatialTemplateOutput.elements.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AbsoluteSpatialTemplateOutput.defaultInitiatorRole.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  *a1 = *(void *)(v1 + 8);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void AbsoluteSpatialTemplateOutput.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[2];
  swift_bridgeObjectRetain();
  specialized Array<A>.hash(into:)(a1, v3);
  swift_bridgeObjectRelease();
  if (v4)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
}

uint64_t specialized static Array<A>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  for (uint64_t i = 0; ; i += 112)
  {
    uint64_t v6 = *(void *)(a1 + i + 40);
    double v8 = *(double *)(a1 + i + 48);
    double v7 = *(double *)(a1 + i + 56);
    double v9 = *(double *)(a1 + i + 64);
    double v10 = *(double *)(a1 + i + 80);
    double v11 = *(double *)(a1 + i + 96);
    double v13 = *(double *)(a1 + i + 104);
    double v12 = *(double *)(a1 + i + 112);
    char v14 = *(unsigned char *)(a1 + i + 128);
    uint64_t v15 = *(void *)(a2 + i + 40);
    double v17 = *(double *)(a2 + i + 48);
    double v16 = *(double *)(a2 + i + 56);
    double v18 = *(double *)(a2 + i + 64);
    double v19 = *(double *)(a2 + i + 80);
    double v20 = *(double *)(a2 + i + 96);
    double v22 = *(double *)(a2 + i + 104);
    double v21 = *(double *)(a2 + i + 112);
    char v23 = *(unsigned char *)(a2 + i + 128);
    if (v6) {
      break;
    }
    if (v15) {
      goto LABEL_28;
    }
LABEL_13:
    uint64_t result = 0;
    if (v8 != v17 || v7 != v16 || v9 != v18 || v10 != v19) {
      return result;
    }
    if (v14)
    {
      if ((v23 & 1) == 0 || LOBYTE(v20) != LOBYTE(v11)) {
        return 0;
      }
    }
    else
    {
      uint64_t result = 0;
      if ((v23 & 1) != 0 || v11 != v20 || v13 != v22 || v12 != v21) {
        return result;
      }
    }
    if (!--v2) {
      return 1;
    }
  }
  if (v15)
  {
    if (*(void *)(a1 + i + 32) != *(void *)(a2 + i + 32) || v6 != v15)
    {
      double v28 = *(double *)(a2 + i + 112);
      double v29 = *(double *)(a1 + i + 112);
      double v26 = *(double *)(a1 + i + 64);
      double v27 = *(double *)(a1 + i + 80);
      char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
      double v9 = v26;
      double v10 = v27;
      double v21 = v28;
      double v12 = v29;
      if ((v24 & 1) == 0) {
        return 0;
      }
    }
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
LABEL_28:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance AbsoluteSpatialTemplateOutput.CodingKeys()
{
  if (*v0) {
    return 0xD000000000000014;
  }
  else {
    return 0x73746E656D656C65;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance AbsoluteSpatialTemplateOutput.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized AbsoluteSpatialTemplateOutput.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbsoluteSpatialTemplateOutput.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AbsoluteSpatialTemplateOutput.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AbsoluteSpatialTemplateOutput.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.CodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  double v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v11 = v1[2];
  uint64_t v12 = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v13 = v9;
  char v15 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AbsoluteSpatialTemplateOutput.Element]);
  lazy protocol witness table accessor for type [AbsoluteSpatialTemplateOutput.Element] and conformance <A> [A](&lazy protocol witness table cache variable for type [AbsoluteSpatialTemplateOutput.Element] and conformance <A> [A], (void (*)(void))lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element and conformance AbsoluteSpatialTemplateOutput.Element);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    uint64_t v13 = v12;
    uint64_t v14 = v11;
    char v15 = 1;
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Role and conformance AbsoluteSpatialTemplateOutput.Role();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Int AbsoluteSpatialTemplateOutput.hashValue.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[2];
  Hasher.init(_seed:)();
  specialized Array<A>.hash(into:)((uint64_t)v4, v1);
  if (v2)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  return Hasher._finalize()();
}

uint64_t AbsoluteSpatialTemplateOutput.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AbsoluteSpatialTemplateOutput.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AbsoluteSpatialTemplateOutput.Element]);
  char v14 = 0;
  lazy protocol witness table accessor for type [AbsoluteSpatialTemplateOutput.Element] and conformance <A> [A](&lazy protocol witness table cache variable for type [AbsoluteSpatialTemplateOutput.Element] and conformance <A> [A], (void (*)(void))lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element and conformance AbsoluteSpatialTemplateOutput.Element);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v9 = v13[0];
  char v14 = 1;
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Role and conformance AbsoluteSpatialTemplateOutput.Role();
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v10 = v13[0];
  uint64_t v11 = v13[1];
  *a2 = v9;
  a2[1] = v10;
  a2[2] = v11;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for Decodable.init(from:) in conformance AbsoluteSpatialTemplateOutput@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return AbsoluteSpatialTemplateOutput.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance AbsoluteSpatialTemplateOutput(void *a1)
{
  return AbsoluteSpatialTemplateOutput.encode(to:)(a1);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance AbsoluteSpatialTemplateOutput()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[2];
  Hasher.init(_seed:)();
  specialized Array<A>.hash(into:)((uint64_t)v4, v1);
  if (v2)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance AbsoluteSpatialTemplateOutput()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[2];
  Swift::UInt v3 = *(void *)(*v0 + 16);
  Hasher._combine(_:)(v3);
  if (v3)
  {
    uint64_t v4 = v1 + 64;
    do
    {
      uint64_t v5 = *(void *)(v4 - 24);
      uint64_t v6 = *(void *)(v4 + 32);
      char v7 = *(unsigned char *)(v4 + 64);
      Hasher._combine(_:)(0);
      if (v5)
      {
        Hasher._combine(_:)(1u);
        swift_bridgeObjectRetain();
        String.hash(into:)();
      }
      else
      {
        Hasher._combine(_:)(0);
      }
      Hasher._combine(_:)(0);
      SPVector3D.hash(into:)();
      SPAngle.hash(into:)();
      if (v7)
      {
        Hasher._combine(_:)(1uLL);
        Hasher._combine(_:)(v6);
      }
      else
      {
        Hasher._combine(_:)(0);
        Hasher._combine(_:)(0);
        SPVector3D.hash(into:)();
      }
      swift_bridgeObjectRelease();
      v4 += 112;
      --v3;
    }
    while (v3);
  }
  if (v2)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AbsoluteSpatialTemplateOutput()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[2];
  Hasher.init(_seed:)();
  specialized Array<A>.hash(into:)((uint64_t)v4, v1);
  if (v2)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  return Hasher._finalize()();
}

uint64_t PresentationTemplateOutput.assignInitiatorToPresenterRole.getter()
{
  return *v0;
}

void PresentationTemplateOutput.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance PresentationTemplateOutput.CodingKeys()
{
  return 0xD00000000000001ELL;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance PresentationTemplateOutput.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized PresentationTemplateOutput.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance PresentationTemplateOutput.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance PresentationTemplateOutput.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t PresentationTemplateOutput.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<PresentationTemplateOutput.CodingKeys>);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

Swift::Int PresentationTemplateOutput.hashValue.getter()
{
  Swift::UInt8 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t PresentationTemplateOutput.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<PresentationTemplateOutput.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    char v9 = KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t protocol witness for Decodable.init(from:) in conformance PresentationTemplateOutput@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return PresentationTemplateOutput.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance PresentationTemplateOutput(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<PresentationTemplateOutput.CodingKeys>);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance PresentationTemplateOutput()
{
  Swift::UInt8 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance PresentationTemplateOutput()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PresentationTemplateOutput()
{
  Swift::UInt8 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void AbsoluteSpatialTemplateOutput.Element.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 64);
  char v3 = *(unsigned char *)(v0 + 96);
  Hasher._combine(_:)(0);
  if (v1)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  Hasher._combine(_:)(0);
  SPVector3D.hash(into:)();
  SPAngle.hash(into:)();
  if (v3)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v2);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
}

uint64_t static AbsoluteSpatialTemplateOutput.Element.== infix(_:_:)(long long *a1, long long *a2)
{
  uint64_t v2 = *((void *)a1 + 5);
  uint64_t v3 = *((void *)a1 + 6);
  char v4 = *((unsigned char *)a1 + 96);
  uint64_t v5 = *((void *)a2 + 4);
  uint64_t v6 = *((void *)a2 + 5);
  uint64_t v7 = *((void *)a2 + 6);
  char v8 = *((unsigned char *)a2 + 96);
  long long v10 = *a1;
  long long v9 = a1[1];
  uint64_t v24 = *((void *)a1 + 4);
  uint64_t v25 = v2;
  v23[0] = v10;
  v23[1] = v9;
  uint64_t v26 = v3;
  long long v11 = a1[5];
  long long v27 = a1[4];
  long long v28 = v11;
  char v29 = v4;
  long long v13 = *a2;
  long long v12 = a2[1];
  uint64_t v17 = v5;
  uint64_t v18 = v6;
  v16[0] = v13;
  v16[1] = v12;
  uint64_t v19 = v7;
  long long v14 = a2[5];
  long long v20 = a2[4];
  long long v21 = v14;
  char v22 = v8;
  return specialized static AbsoluteSpatialTemplateOutput.Element.Seat.== infix(_:_:)((uint64_t)v23, (uint64_t)v16) & 1;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys()
{
  return 1952540019;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 1952540019 && a2 == 0xE400000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AbsoluteSpatialTemplateOutput.Element.encode(to:)(void *a1)
{
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys>);
  uint64_t v3 = *(void *)(v22 - 8);
  MEMORY[0x1F4188790](v22);
  char v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Element.CodingKeys>);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  long long v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v10 = *v1;
  long long v20 = v1[1];
  long long v21 = v10;
  uint64_t v19 = *((void *)v1 + 4);
  uint64_t v14 = *((void *)v1 + 5);
  uint64_t v11 = *((void *)v1 + 6);
  long long v18 = v1[4];
  uint64_t v17 = *((void *)v1 + 10);
  uint64_t v16 = *((void *)v1 + 11);
  int v15 = *((unsigned __int8 *)v1 + 96);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys();
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  uint64_t v25 = v19;
  uint64_t v26 = v14;
  long long v23 = v21;
  long long v24 = v20;
  uint64_t v27 = v11;
  long long v28 = v18;
  uint64_t v29 = v17;
  uint64_t v30 = v16;
  char v31 = v15;
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Seat and conformance AbsoluteSpatialTemplateOutput.Element.Seat();
  uint64_t v12 = v22;
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v12);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

Swift::Int AbsoluteSpatialTemplateOutput.Element.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 64);
  char v3 = *(unsigned char *)(v0 + 96);
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  if (v1)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  Hasher._combine(_:)(0);
  SPVector3D.hash(into:)();
  SPAngle.hash(into:)();
  if (v3)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v2);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
  return Hasher._finalize()();
}

uint64_t AbsoluteSpatialTemplateOutput.Element.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys>);
  uint64_t v29 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AbsoluteSpatialTemplateOutput.Element.CodingKeys>);
  uint64_t v7 = *(void *)(v38 - 8);
  MEMORY[0x1F4188790](v38);
  long long v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    goto LABEL_5;
  }
  uint64_t v26 = a1;
  uint64_t v27 = v7;
  uint64_t v10 = v38;
  if (*(void *)(KeyedDecodingContainer.allKeys.getter() + 16) != 1)
  {
    uint64_t v12 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v13 = v10;
    int v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *int v15 = &type metadata for AbsoluteSpatialTemplateOutput.Element;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v12 - 8) + 104))(v15, *MEMORY[0x1E4FBBA70], v12);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v13);
    a1 = v26;
LABEL_5:
    uint64_t v25 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1Tm(v25);
  }
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys();
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  uint64_t v11 = v27;
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Seat and conformance AbsoluteSpatialTemplateOutput.Element.Seat();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v6, v4);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  uint64_t v17 = v33;
  uint64_t v18 = v34;
  char v19 = v37;
  long long v21 = v30;
  long long v20 = v31;
  long long v22 = v35;
  long long v23 = v36;
  uint64_t v24 = v28;
  *(void *)(v28 + 32) = v32;
  *(void *)(v24 + 40) = v17;
  *(_OWORD *)uint64_t v24 = v21;
  *(_OWORD *)(v24 + 16) = v20;
  *(void *)(v24 + 48) = v18;
  *(_OWORD *)(v24 + 64) = v22;
  *(_OWORD *)(v24 + 80) = v23;
  *(unsigned char *)(v24 + 96) = v19;
  uint64_t v25 = (uint64_t)v26;
  return __swift_destroy_boxed_opaque_existential_1Tm(v25);
}

uint64_t protocol witness for Decodable.init(from:) in conformance AbsoluteSpatialTemplateOutput.Element@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AbsoluteSpatialTemplateOutput.Element.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance AbsoluteSpatialTemplateOutput.Element(void *a1)
{
  return AbsoluteSpatialTemplateOutput.Element.encode(to:)(a1);
}

void protocol witness for Hashable.hash(into:) in conformance AbsoluteSpatialTemplateOutput.Element()
{
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 64);
  char v3 = *(unsigned char *)(v0 + 96);
  Hasher._combine(_:)(0);
  if (v1)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  Hasher._combine(_:)(0);
  SPVector3D.hash(into:)();
  SPAngle.hash(into:)();
  if (v3)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v2);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AbsoluteSpatialTemplateOutput.Element()
{
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 64);
  char v3 = *(unsigned char *)(v0 + 96);
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  if (v1)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  Hasher._combine(_:)(0);
  SPVector3D.hash(into:)();
  SPAngle.hash(into:)();
  if (v3)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v2);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance AbsoluteSpatialTemplateOutput.Element(long long *a1, long long *a2)
{
  uint64_t v2 = *((void *)a1 + 5);
  uint64_t v3 = *((void *)a1 + 6);
  char v4 = *((unsigned char *)a1 + 96);
  uint64_t v5 = *((void *)a2 + 4);
  uint64_t v6 = *((void *)a2 + 5);
  uint64_t v7 = *((void *)a2 + 6);
  char v8 = *((unsigned char *)a2 + 96);
  long long v10 = *a1;
  long long v9 = a1[1];
  uint64_t v24 = *((void *)a1 + 4);
  uint64_t v25 = v2;
  v23[0] = v10;
  v23[1] = v9;
  uint64_t v26 = v3;
  long long v11 = a1[5];
  long long v27 = a1[4];
  long long v28 = v11;
  char v29 = v4;
  long long v13 = *a2;
  long long v12 = a2[1];
  uint64_t v17 = v5;
  uint64_t v18 = v6;
  v16[0] = v13;
  v16[1] = v12;
  uint64_t v19 = v7;
  long long v14 = a2[5];
  long long v20 = a2[4];
  long long v21 = v14;
  char v22 = v8;
  return specialized static AbsoluteSpatialTemplateOutput.Element.Seat.== infix(_:_:)((uint64_t)v23, (uint64_t)v16) & 1;
}

uint64_t AbsoluteSpatialTemplateOutput.Element.Seat.role.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

__n128 AbsoluteSpatialTemplateOutput.Element.Seat.position.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = v1[1];
  unint64_t v3 = v1[2].n128_u64[1];
  a1[1].n128_u64[0] = v1[2].n128_u64[0];
  a1[1].n128_u64[1] = v3;
  *a1 = result;
  return result;
}

__n128 AbsoluteSpatialTemplateOutput.Element.Seat.direction.getter@<Q0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 96);
  *(void *)a1 = *(void *)(v1 + 48);
  __n128 result = *(__n128 *)(v1 + 64);
  long long v4 = *(_OWORD *)(v1 + 80);
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 48) = v2;
  return result;
}

void AbsoluteSpatialTemplateOutput.Element.Seat.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 64);
  char v2 = *(unsigned char *)(v0 + 96);
  if (*(void *)(v0 + 8))
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  Hasher._combine(_:)(0);
  SPVector3D.hash(into:)();
  SPAngle.hash(into:)();
  if (v2)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys()
{
  uint64_t v1 = 0x6E6F697469736F70;
  if (*v0 != 1) {
    uint64_t v1 = 0x6F69746365726964;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1701605234;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AbsoluteSpatialTemplateOutput.Element.Seat.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  uint64_t v9 = v1[5];
  uint64_t v27 = v1[4];
  uint64_t v28 = v9;
  uint64_t v10 = v1[3];
  uint64_t v25 = v1[2];
  uint64_t v26 = v10;
  uint64_t v11 = v1[6];
  uint64_t v12 = v1[8];
  uint64_t v23 = v1[9];
  uint64_t v24 = v12;
  uint64_t v13 = v1[10];
  uint64_t v21 = v1[11];
  uint64_t v22 = v13;
  HIDWORD(v20) = *((unsigned __int8 *)v1 + 96);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v30 = v8;
  uint64_t v31 = v7;
  char v37 = 0;
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Role and conformance AbsoluteSpatialTemplateOutput.Role();
  uint64_t v14 = v29;
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  if (!v14)
  {
    uint64_t v16 = v21;
    uint64_t v15 = v22;
    uint64_t v18 = v23;
    uint64_t v17 = v24;
    uint64_t v30 = v25;
    uint64_t v31 = v26;
    uint64_t v32 = v27;
    uint64_t v33 = v28;
    char v37 = 1;
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position and conformance AbsoluteSpatialTemplateOutput.Element.Position();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    uint64_t v30 = v11;
    uint64_t v32 = v17;
    uint64_t v33 = v18;
    uint64_t v34 = v15;
    uint64_t v35 = v16;
    char v36 = BYTE4(v20);
    char v37 = 2;
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction and conformance AbsoluteSpatialTemplateOutput.Element.Direction();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

Swift::Int AbsoluteSpatialTemplateOutput.Element.Seat.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 64);
  char v3 = *(unsigned char *)(v0 + 96);
  Hasher.init(_seed:)();
  if (v1)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  Hasher._combine(_:)(0);
  SPVector3D.hash(into:)();
  SPAngle.hash(into:)();
  if (v3)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v2);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
  return Hasher._finalize()();
}

uint64_t AbsoluteSpatialTemplateOutput.Element.Seat.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  char v26 = 0;
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Role and conformance AbsoluteSpatialTemplateOutput.Role();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  uint64_t v10 = v21;
  uint64_t v9 = v22;
  char v26 = 1;
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position and conformance AbsoluteSpatialTemplateOutput.Element.Position();
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  long long v20 = v23;
  uint64_t v18 = v21;
  uint64_t v19 = v22;
  char v26 = 2;
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction and conformance AbsoluteSpatialTemplateOutput.Element.Direction();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v12 = v21;
  char v13 = v25;
  long long v14 = v23;
  long long v15 = v24;
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v9;
  uint64_t v16 = v19;
  *(void *)(a2 + 16) = v18;
  *(void *)(a2 + 24) = v16;
  uint64_t v17 = *((void *)&v20 + 1);
  *(void *)(a2 + 32) = v20;
  *(void *)(a2 + 40) = v17;
  *(void *)(a2 + 48) = v12;
  *(_OWORD *)(a2 + 64) = v14;
  *(_OWORD *)(a2 + 80) = v15;
  *(unsigned char *)(a2 + 96) = v13;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for Decodable.init(from:) in conformance AbsoluteSpatialTemplateOutput.Element.Seat@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AbsoluteSpatialTemplateOutput.Element.Seat.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance AbsoluteSpatialTemplateOutput.Element.Seat(void *a1)
{
  return AbsoluteSpatialTemplateOutput.Element.Seat.encode(to:)(a1);
}

void protocol witness for Hashable.hash(into:) in conformance AbsoluteSpatialTemplateOutput.Element.Seat()
{
  uint64_t v1 = *(void *)(v0 + 64);
  char v2 = *(unsigned char *)(v0 + 96);
  if (*(void *)(v0 + 8))
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  Hasher._combine(_:)(0);
  SPVector3D.hash(into:)();
  SPAngle.hash(into:)();
  if (v2)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AbsoluteSpatialTemplateOutput.Element.Seat()
{
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 64);
  char v3 = *(unsigned char *)(v0 + 96);
  Hasher.init(_seed:)();
  if (v1)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain();
    String.hash(into:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  Hasher._combine(_:)(0);
  SPVector3D.hash(into:)();
  SPAngle.hash(into:)();
  if (v3)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v2);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
  return Hasher._finalize()();
}

__n128 AbsoluteSpatialTemplateOutput.Element.position.getter@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = v1[1];
  unint64_t v3 = v1[2].n128_u64[1];
  a1[1].n128_u64[0] = v1[2].n128_u64[0];
  a1[1].n128_u64[1] = v3;
  *a1 = result;
  return result;
}

__n128 AbsoluteSpatialTemplateOutput.Element.direction.getter@<Q0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 96);
  *(void *)a1 = *(void *)(v1 + 48);
  __n128 result = *(__n128 *)(v1 + 64);
  long long v4 = *(_OWORD *)(v1 + 80);
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 48) = v2;
  return result;
}

uint64_t AbsoluteSpatialTemplateOutput.Element.role.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t AbsoluteSpatialTemplateOutput.Role.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AbsoluteSpatialTemplateOutput.Role.hash(into:)()
{
  swift_bridgeObjectRetain();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

uint64_t static AbsoluteSpatialTemplateOutput.Role.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)();
  }
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys()
{
  return 0x696669746E656469;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AbsoluteSpatialTemplateOutput.Role.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Role.CodingKeys>);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

Swift::Int AbsoluteSpatialTemplateOutput.Role.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t AbsoluteSpatialTemplateOutput.Role.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AbsoluteSpatialTemplateOutput.Role.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t protocol witness for Decodable.init(from:) in conformance AbsoluteSpatialTemplateOutput.Role@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return AbsoluteSpatialTemplateOutput.Role.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance AbsoluteSpatialTemplateOutput.Role(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Role.CodingKeys>);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

double AbsoluteSpatialTemplateOutput.Element.Position.offset.getter()
{
  return *(double *)v0;
}

uint64_t static AbsoluteSpatialTemplateOutput.Element.Position.Anchor.== infix(_:_:)()
{
  return 1;
}

void AbsoluteSpatialTemplateOutput.Element.Position.Anchor.hash(into:)()
{
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys()
{
  return 0x65746E6543707061;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x65746E6543707061 && a2 == 0xE900000000000072)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AbsoluteSpatialTemplateOutput.Element.Position.Anchor.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys>);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys>);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys();
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

Swift::Int AbsoluteSpatialTemplateOutput.Element.Position.Anchor.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t AbsoluteSpatialTemplateOutput.Element.Position.Anchor.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys>);
  uint64_t v16 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  char v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys>);
  uint64_t v6 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    uint64_t v9 = v16;
    uint64_t v15 = v6;
    if (*(void *)(KeyedDecodingContainer.allKeys.getter() + 16) == 1)
    {
      lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v10 = v15;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v3);
    }
    else
    {
      uint64_t v11 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v13 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
      *uint64_t v13 = &type metadata for AbsoluteSpatialTemplateOutput.Element.Position.Anchor;
      KeyedDecodingContainer.codingPath.getter();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x1E4FBBA70], v11);
      swift_willThrow();
      uint64_t v10 = v15;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v17);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t protocol witness for Decodable.init(from:) in conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor(void *a1)
{
  return AbsoluteSpatialTemplateOutput.Element.Position.Anchor.init(from:)(a1);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys>);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys>);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys();
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t AbsoluteSpatialTemplateOutput.Element.Position.hash(into:)()
{
  return SPVector3D.hash(into:)();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys()
{
  if (*v0) {
    return 0x74657366666FLL;
  }
  else {
    return 0x726F68636E61;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AbsoluteSpatialTemplateOutput.Element.Position.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[1];
  uint64_t v13 = v1[2];
  uint64_t v14 = v8;
  uint64_t v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v15) = 0;
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    uint64_t v15 = v12;
    uint64_t v16 = v9;
    uint64_t v17 = v13;
    uint64_t v18 = v14;
    char v19 = 1;
    type metadata accessor for SPVector3D(0);
    lazy protocol witness table accessor for type SPVector3D and conformance SPVector3D(&lazy protocol witness table cache variable for type SPVector3D and conformance SPVector3D, type metadata accessor for SPVector3D);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Int AbsoluteSpatialTemplateOutput.Element.Position.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t AbsoluteSpatialTemplateOutput.Element.Position.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    LOBYTE(v12) = 0;
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    type metadata accessor for SPVector3D(0);
    char v15 = 1;
    lazy protocol witness table accessor for type SPVector3D and conformance SPVector3D(&lazy protocol witness table cache variable for type SPVector3D and conformance SPVector3D, type metadata accessor for SPVector3D);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    long long v9 = v12;
    uint64_t v10 = v14;
    *(void *)(a2 + 16) = v13;
    *(void *)(a2 + 24) = v10;
    *(_OWORD *)a2 = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t protocol witness for Decodable.init(from:) in conformance AbsoluteSpatialTemplateOutput.Element.Position@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AbsoluteSpatialTemplateOutput.Element.Position.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance AbsoluteSpatialTemplateOutput.Element.Position(void *a1)
{
  return AbsoluteSpatialTemplateOutput.Element.Position.encode(to:)(a1);
}

double AbsoluteSpatialTemplateOutput.Element.Direction.rotation.getter()
{
  return *(double *)v0;
}

void AbsoluteSpatialTemplateOutput.Element.Direction.Anchor.hash(into:)()
{
  if (*(unsigned char *)(v0 + 32))
  {
    Hasher._combine(_:)(*(void *)v0);
  }
  else
  {
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
}

BOOL static AbsoluteSpatialTemplateOutput.Element.Direction.Anchor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)a2;
  if (*(unsigned char *)(a1 + 32))
  {
    BOOL v4 = LODWORD(v2) == LODWORD(v3);
    return (*(unsigned char *)(a2 + 32) & 1) != 0 && v4;
  }
  else if (*(unsigned char *)(a2 + 32))
  {
    return 0;
  }
  else
  {
    BOOL v6 = v2 == v3;
    if (*(double *)(a1 + 8) != *(double *)(a2 + 8)) {
      BOOL v6 = 0;
    }
    return *(double *)(a1 + 16) == *(double *)(a2 + 16) && v6;
  }
}

Swift::Int AbsoluteSpatialTemplateOutput.Element.Direction.Anchor.hashValue.getter()
{
  uint64_t v1 = *v0;
  char v2 = *((unsigned char *)v0 + 32);
  Hasher.init(_seed:)();
  if (v2)
  {
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.Anchor()
{
  uint64_t v1 = *v0;
  char v2 = *((unsigned char *)v0 + 32);
  Hasher.init(_seed:)();
  if (v2)
  {
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance AbsoluteSpatialTemplateOutput.Element.Direction.Anchor()
{
  if (*(unsigned char *)(v0 + 32))
  {
    Hasher._combine(_:)(*(void *)v0);
  }
  else
  {
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AbsoluteSpatialTemplateOutput.Element.Direction.Anchor()
{
  uint64_t v1 = *v0;
  char v2 = *((unsigned char *)v0 + 32);
  Hasher.init(_seed:)();
  if (v2)
  {
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance AbsoluteSpatialTemplateOutput.Element.Direction.Anchor(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)a2;
  if (*(unsigned char *)(a1 + 32))
  {
    BOOL v4 = LODWORD(v2) == LODWORD(v3);
    return (*(unsigned char *)(a2 + 32) & 1) != 0 && v4;
  }
  else if (*(unsigned char *)(a2 + 32))
  {
    return 0;
  }
  else
  {
    BOOL v6 = v2 == v3;
    if (*(double *)(a1 + 8) != *(double *)(a2 + 8)) {
      BOOL v6 = 0;
    }
    return *(double *)(a1 + 16) == *(double *)(a2 + 16) && v6;
  }
}

uint64_t AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.encode(to:)(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys>);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys>);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys>);
  uint64_t v18 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys>);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys();
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys();
      char v15 = v21;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys>);
  uint64_t v23 = *(void *)(v3 - 8);
  uint64_t v24 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys>);
  uint64_t v21 = *(void *)(v6 - 8);
  uint64_t v22 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys>);
  uint64_t v26 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = *v1;
  uint64_t v12 = v1[1];
  uint64_t v19 = v1[2];
  uint64_t v20 = v12;
  uint64_t v18 = v1[3];
  char v13 = *((unsigned char *)v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if (v13)
  {
    LOBYTE(v27) = 1;
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    LOBYTE(v27) = v25;
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis();
    uint64_t v14 = v24;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v14);
  }
  else
  {
    LOBYTE(v27) = 0;
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v29 = v19;
    uint64_t v30 = v18;
    uint64_t v27 = v25;
    uint64_t v28 = v20;
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position and conformance AbsoluteSpatialTemplateOutput.Element.Position();
    uint64_t v15 = v22;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v11, v9);
}

uint64_t AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys>);
  uint64_t v34 = *(void *)(v32 - 8);
  MEMORY[0x1F4188790](v32);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys>);
  uint64_t v33 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys>);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  uint64_t v35 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys();
  uint64_t v13 = v40;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v13) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
  }
  uint64_t v40 = v9;
  uint64_t v14 = v11;
  uint64_t v15 = KeyedDecodingContainer.allKeys.getter();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *uint64_t v19 = &unk_1EF7171A0;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x1E4FBBA70], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v8);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
  }
  uint64_t v30 = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    LOBYTE(v36) = 1;
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis();
    uint64_t v23 = v32;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v4, v23);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v8);
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = v36;
  }
  else
  {
    LOBYTE(v36) = 0;
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys();
    uint64_t v21 = v7;
    uint64_t v22 = v14;
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position and conformance AbsoluteSpatialTemplateOutput.Element.Position();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v28 = v40;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v21, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v22, v8);
    uint64_t v27 = v36;
    uint64_t v24 = v37;
    uint64_t v25 = v38;
    uint64_t v26 = v39;
  }
  uint64_t v29 = v31;
  *uint64_t v31 = v27;
  v29[1] = v24;
  v29[2] = v25;
  v29[3] = v26;
  *((unsigned char *)v29 + 32) = v16;
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys()
{
  return *v0 + 120;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

void *protocol witness for Decodable.init(from:) in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = specialized AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.init(from:)(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis(void *a1)
{
  return AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.encode(to:)(a1, *v1);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys()
{
  return 0x73697841707061;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x73697841707061 && a2 == 0xE700000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys()
{
  if (*v0) {
    return 0x5764656E67696C61;
  }
  else {
    return 0x6E6F697469736F70;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for Decodable.init(from:) in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor(void *a1)
{
  return AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.encode(to:)(a1);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor()
{
  uint64_t v1 = *v0;
  char v2 = *((unsigned char *)v0 + 32);
  Hasher.init(_seed:)();
  if (v2)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor()
{
  uint64_t v1 = *v0;
  if (v0[4])
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor()
{
  uint64_t v1 = *v0;
  char v2 = *((unsigned char *)v0 + 32);
  Hasher.init(_seed:)();
  if (v2)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
  return Hasher._finalize()();
}

void AbsoluteSpatialTemplateOutput.Element.Direction.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 48);
  SPAngle.hash(into:)();
  if (v2)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys()
{
  if (*v0) {
    return 0x726F68636E615FLL;
  }
  else {
    return 0x6E6F697461746F72;
  }
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t AbsoluteSpatialTemplateOutput.Element.Direction.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  char v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v10 = v1[2];
  uint64_t v9 = v1[3];
  uint64_t v14 = v1[4];
  uint64_t v15 = v9;
  uint64_t v13 = v1[5];
  HIDWORD(v12) = *((unsigned __int8 *)v1 + 48);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v16 = v8;
  char v21 = 0;
  type metadata accessor for SPAngle(0);
  lazy protocol witness table accessor for type SPVector3D and conformance SPVector3D(&lazy protocol witness table cache variable for type SPAngle and conformance SPAngle, type metadata accessor for SPAngle);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    uint64_t v16 = v10;
    uint64_t v17 = v15;
    uint64_t v18 = v14;
    uint64_t v19 = v13;
    char v20 = BYTE4(v12);
    char v21 = 1;
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Int AbsoluteSpatialTemplateOutput.Element.Direction.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 48);
  Hasher.init(_seed:)();
  SPAngle.hash(into:)();
  if (v2)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
    Hasher._combine(_:)(0);
    SPVector3D.hash(into:)();
  }
  return Hasher._finalize()();
}

uint64_t AbsoluteSpatialTemplateOutput.Element.Direction.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    type metadata accessor for SPAngle(0);
    char v16 = 0;
    lazy protocol witness table accessor for type SPVector3D and conformance SPVector3D(&lazy protocol witness table cache variable for type SPAngle and conformance SPAngle, type metadata accessor for SPAngle);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v9 = *(void *)&v14[0];
    char v16 = 1;
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    char v10 = v15;
    long long v11 = v14[0];
    long long v12 = v14[1];
    *(void *)a2 = v9;
    *(_OWORD *)(a2 + 16) = v11;
    *(_OWORD *)(a2 + 32) = v12;
    *(unsigned char *)(a2 + 48) = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t protocol witness for Decodable.init(from:) in conformance AbsoluteSpatialTemplateOutput.Element.Direction@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AbsoluteSpatialTemplateOutput.Element.Direction.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance AbsoluteSpatialTemplateOutput.Element.Direction(void *a1)
{
  return AbsoluteSpatialTemplateOutput.Element.Direction.encode(to:)(a1);
}

uint64_t specialized static AbsoluteSpatialTemplateOutput.Element.Seat.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  double v4 = *(double *)(a1 + 16);
  double v3 = *(double *)(a1 + 24);
  double v5 = *(double *)(a1 + 32);
  double v6 = *(double *)(a1 + 48);
  double v7 = *(double *)(a1 + 64);
  double v9 = *(double *)(a1 + 72);
  double v8 = *(double *)(a1 + 80);
  char v10 = *(unsigned char *)(a1 + 96);
  uint64_t v11 = *(void *)(a2 + 8);
  double v13 = *(double *)(a2 + 16);
  double v12 = *(double *)(a2 + 24);
  double v14 = *(double *)(a2 + 32);
  double v15 = *(double *)(a2 + 48);
  double v16 = *(double *)(a2 + 64);
  double v18 = *(double *)(a2 + 72);
  double v17 = *(double *)(a2 + 80);
  char v19 = *(unsigned char *)(a2 + 96);
  if (v2)
  {
    if (v11)
    {
      if (*(void *)a1 != *(void *)a2 || v2 != v11)
      {
        double v25 = *(double *)(a2 + 80);
        double v26 = *(double *)(a1 + 80);
        double v23 = *(double *)(a2 + 48);
        double v24 = *(double *)(a1 + 48);
        char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
        double v15 = v23;
        double v6 = v24;
        double v17 = v25;
        double v8 = v26;
        char v21 = v20;
        uint64_t result = 0;
        if ((v21 & 1) == 0) {
          return result;
        }
      }
      goto LABEL_8;
    }
    swift_bridgeObjectRetain();
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (v11) {
    goto LABEL_17;
  }
LABEL_8:
  uint64_t result = 0;
  if (v4 == v13 && v3 == v12 && v5 == v14)
  {
    if (v6 == v15)
    {
      if (v10)
      {
        if ((v19 & 1) != 0 && LOBYTE(v16) == LOBYTE(v7)) {
          return 1;
        }
      }
      else if ((v19 & 1) == 0 && v7 == v16 && v9 == v18 && v8 == v17)
      {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

BOOL specialized static AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)a2;
  if (*(unsigned char *)(a1 + 32))
  {
    BOOL v4 = (LOBYTE(v3) ^ LOBYTE(v2)) == 0;
    return (*(unsigned char *)(a2 + 32) & 1) != 0 && v4;
  }
  else if (*(unsigned char *)(a2 + 32))
  {
    return 0;
  }
  else
  {
    BOOL v6 = v2 == v3;
    if (*(double *)(a1 + 8) != *(double *)(a2 + 8)) {
      BOOL v6 = 0;
    }
    return *(double *)(a1 + 16) == *(double *)(a2 + 16) && v6;
  }
}

uint64_t specialized static AbsoluteSpatialTemplateOutput.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  if ((specialized static Array<A>.== infix(_:_:)(*a1, *a2) & 1) == 0) {
    return 0;
  }
  if (!v3)
  {
    if (!v5) {
      return 1;
    }
    goto LABEL_11;
  }
  if (!v5)
  {
    swift_bridgeObjectRetain();
LABEL_11:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (v2 == v4 && v3 == v5) {
    return 1;
  }
  char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
  uint64_t result = 0;
  if (v6) {
    return 1;
  }
  return result;
}

uint64_t specialized static SpatialTemplatePreferenceOutput.SpatialTemplate.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  int v5 = *(unsigned __int8 *)(a1 + 24);
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  int v9 = *(unsigned __int8 *)(a2 + 24);
  if (!*(unsigned char *)(a1 + 24))
  {
    if (!*(unsigned char *)(a2 + 24))
    {
      v16[0] = *(void *)a1;
      v16[1] = v2;
      _OWORD v16[2] = v4;
      v15[0] = v6;
      v15[1] = v7;
      v15[2] = v8;
      outlined copy of SpatialTemplatePreferenceOutput.SpatialTemplate(v6, v7, v8, 0);
      outlined copy of SpatialTemplatePreferenceOutput.SpatialTemplate(v3, v2, v4, 0);
      outlined copy of SpatialTemplatePreferenceOutput.SpatialTemplate(v3, v2, v4, 0);
      outlined copy of SpatialTemplatePreferenceOutput.SpatialTemplate(v6, v7, v8, 0);
      int v9 = specialized static AbsoluteSpatialTemplateOutput.== infix(_:_:)(v16, v15);
      outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(v3, v2, v4, 0);
      outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(v6, v7, v8, 0);
      outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(v6, v7, v8, 0);
      outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(v3, v2, v4, 0);
      return v9 & 1;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_34;
  }
  if (v5 != 1)
  {
    uint64_t v10 = v4 | v2;
    if (!(v4 | v2 | v3))
    {
      if (v9 != 2 || (v8 | v7 | v6) != 0) {
        goto LABEL_34;
      }
      outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(0, 0, 0, 2);
      uint64_t v12 = 0;
      goto LABEL_33;
    }
    if (v3 != 1 || v10 != 0)
    {
      if (v3 != 2 || v10)
      {
        if (v9 != 2 || v6 != 3 || v8 | v7) {
          goto LABEL_34;
        }
        outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(3, 0, 0, 2);
        uint64_t v12 = 3;
      }
      else
      {
        if (v9 != 2 || v6 != 2 || v8 | v7) {
          goto LABEL_34;
        }
        outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(2, 0, 0, 2);
        uint64_t v12 = 2;
      }
LABEL_33:
      outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(v12, 0, 0, 2);
      LOBYTE(v9) = 1;
      return v9 & 1;
    }
    if (v9 == 2 && v6 == 1 && !(v8 | v7))
    {
      LOBYTE(v9) = 1;
      outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(1, 0, 0, 2);
      outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(1, 0, 0, 2);
      return v9 & 1;
    }
LABEL_34:
    outlined copy of SpatialTemplatePreferenceOutput.SpatialTemplate(v6, v7, v8, v9);
    outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(v3, v2, v4, v5);
    outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(v6, v7, v8, v9);
    LOBYTE(v9) = 0;
    return v9 & 1;
  }
  if (v9 != 1) {
    goto LABEL_34;
  }
  outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(*(void *)a1, v2, v4, 1);
  outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(v6, v7, v8, 1);
  LOBYTE(v9) = ((v3 & 1) == 0) ^ v6;
  return v9 & 1;
}

unint64_t lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PresentationTemplateOutput and conformance PresentationTemplateOutput()
{
  unint64_t result = lazy protocol witness table cache variable for type PresentationTemplateOutput and conformance PresentationTemplateOutput;
  if (!lazy protocol witness table cache variable for type PresentationTemplateOutput and conformance PresentationTemplateOutput)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PresentationTemplateOutput and conformance PresentationTemplateOutput);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PresentationTemplateOutput and conformance PresentationTemplateOutput;
  if (!lazy protocol witness table cache variable for type PresentationTemplateOutput and conformance PresentationTemplateOutput)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PresentationTemplateOutput and conformance PresentationTemplateOutput);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PresentationTemplateOutput and conformance PresentationTemplateOutput;
  if (!lazy protocol witness table cache variable for type PresentationTemplateOutput and conformance PresentationTemplateOutput)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PresentationTemplateOutput and conformance PresentationTemplateOutput);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys and conformance SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput and conformance AbsoluteSpatialTemplateOutput()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput and conformance AbsoluteSpatialTemplateOutput;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput and conformance AbsoluteSpatialTemplateOutput)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput and conformance AbsoluteSpatialTemplateOutput);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput and conformance AbsoluteSpatialTemplateOutput;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput and conformance AbsoluteSpatialTemplateOutput)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput and conformance AbsoluteSpatialTemplateOutput);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput and conformance AbsoluteSpatialTemplateOutput;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput and conformance AbsoluteSpatialTemplateOutput)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput and conformance AbsoluteSpatialTemplateOutput);
  }
  return result;
}

uint64_t specialized static SpatialTemplatePreferenceOutput.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);
  char v4 = *(unsigned char *)(a2 + 8);
  long long v5 = *(_OWORD *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 32);
  char v7 = *(unsigned char *)(a2 + 40);
  if ((*(unsigned char *)(a1 + 8) & 1) == 0)
  {
    if (*(double *)a1 != *(double *)a2) {
      char v4 = 1;
    }
    if (v4) {
      goto LABEL_3;
    }
LABEL_7:
    long long v13 = *(_OWORD *)(a1 + 16);
    uint64_t v14 = v2;
    char v15 = v3;
    long long v10 = v5;
    uint64_t v11 = v6;
    char v12 = v7;
    char v8 = specialized static SpatialTemplatePreferenceOutput.SpatialTemplate.== infix(_:_:)((uint64_t)&v13, (uint64_t)&v10);
    return v8 & 1;
  }
  if (*(unsigned char *)(a2 + 8)) {
    goto LABEL_7;
  }
LABEL_3:
  char v8 = 0;
  return v8 & 1;
}

unint64_t lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.CodingKeys and conformance SpatialTemplatePreferenceOutput.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CGFloat and conformance CGFloat()
{
  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SpatialTemplatePreferenceOutput.SpatialTemplate and conformance SpatialTemplatePreferenceOutput.SpatialTemplate()
{
  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate and conformance SpatialTemplatePreferenceOutput.SpatialTemplate;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate and conformance SpatialTemplatePreferenceOutput.SpatialTemplate)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate and conformance SpatialTemplatePreferenceOutput.SpatialTemplate);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate and conformance SpatialTemplatePreferenceOutput.SpatialTemplate;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate and conformance SpatialTemplatePreferenceOutput.SpatialTemplate)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate and conformance SpatialTemplatePreferenceOutput.SpatialTemplate);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate and conformance SpatialTemplatePreferenceOutput.SpatialTemplate;
  if (!lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate and conformance SpatialTemplatePreferenceOutput.SpatialTemplate)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialTemplatePreferenceOutput.SpatialTemplate and conformance SpatialTemplatePreferenceOutput.SpatialTemplate);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.CodingKeys and conformance AbsoluteSpatialTemplateOutput.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element and conformance AbsoluteSpatialTemplateOutput.Element()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element and conformance AbsoluteSpatialTemplateOutput.Element;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element and conformance AbsoluteSpatialTemplateOutput.Element)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element and conformance AbsoluteSpatialTemplateOutput.Element);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element and conformance AbsoluteSpatialTemplateOutput.Element;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element and conformance AbsoluteSpatialTemplateOutput.Element)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element and conformance AbsoluteSpatialTemplateOutput.Element);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element and conformance AbsoluteSpatialTemplateOutput.Element;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element and conformance AbsoluteSpatialTemplateOutput.Element)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element and conformance AbsoluteSpatialTemplateOutput.Element);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Role and conformance AbsoluteSpatialTemplateOutput.Role()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role and conformance AbsoluteSpatialTemplateOutput.Role;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role and conformance AbsoluteSpatialTemplateOutput.Role)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role and conformance AbsoluteSpatialTemplateOutput.Role);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role and conformance AbsoluteSpatialTemplateOutput.Role;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role and conformance AbsoluteSpatialTemplateOutput.Role)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role and conformance AbsoluteSpatialTemplateOutput.Role);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role and conformance AbsoluteSpatialTemplateOutput.Role;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role and conformance AbsoluteSpatialTemplateOutput.Role)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role and conformance AbsoluteSpatialTemplateOutput.Role);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type [AbsoluteSpatialTemplateOutput.Element] and conformance <A> [A](unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AbsoluteSpatialTemplateOutput.Element]);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys;
  if (!lazy protocol witness table cache variable for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys;
  if (!lazy protocol witness table cache variable for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys;
  if (!lazy protocol witness table cache variable for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys;
  if (!lazy protocol witness table cache variable for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PresentationTemplateOutput.CodingKeys and conformance PresentationTemplateOutput.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Seat and conformance AbsoluteSpatialTemplateOutput.Element.Seat()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat and conformance AbsoluteSpatialTemplateOutput.Element.Seat;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat and conformance AbsoluteSpatialTemplateOutput.Element.Seat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat and conformance AbsoluteSpatialTemplateOutput.Element.Seat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat and conformance AbsoluteSpatialTemplateOutput.Element.Seat;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat and conformance AbsoluteSpatialTemplateOutput.Element.Seat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat and conformance AbsoluteSpatialTemplateOutput.Element.Seat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat and conformance AbsoluteSpatialTemplateOutput.Element.Seat;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat and conformance AbsoluteSpatialTemplateOutput.Element.Seat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat and conformance AbsoluteSpatialTemplateOutput.Element.Seat);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position and conformance AbsoluteSpatialTemplateOutput.Element.Position()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position and conformance AbsoluteSpatialTemplateOutput.Element.Position;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position and conformance AbsoluteSpatialTemplateOutput.Element.Position)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position and conformance AbsoluteSpatialTemplateOutput.Element.Position);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position and conformance AbsoluteSpatialTemplateOutput.Element.Position;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position and conformance AbsoluteSpatialTemplateOutput.Element.Position)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position and conformance AbsoluteSpatialTemplateOutput.Element.Position);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position and conformance AbsoluteSpatialTemplateOutput.Element.Position;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position and conformance AbsoluteSpatialTemplateOutput.Element.Position)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position and conformance AbsoluteSpatialTemplateOutput.Element.Position);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction and conformance AbsoluteSpatialTemplateOutput.Element.Direction()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction and conformance AbsoluteSpatialTemplateOutput.Element.Direction;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction and conformance AbsoluteSpatialTemplateOutput.Element.Direction)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction and conformance AbsoluteSpatialTemplateOutput.Element.Direction);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction and conformance AbsoluteSpatialTemplateOutput.Element.Direction;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction and conformance AbsoluteSpatialTemplateOutput.Element.Direction)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction and conformance AbsoluteSpatialTemplateOutput.Element.Direction);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction and conformance AbsoluteSpatialTemplateOutput.Element.Direction;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction and conformance AbsoluteSpatialTemplateOutput.Element.Direction)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction and conformance AbsoluteSpatialTemplateOutput.Element.Direction);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Role.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Role.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Position.Anchor and conformance AbsoluteSpatialTemplateOutput.Element.Position.Anchor);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type SPVector3D and conformance SPVector3D(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.Anchor and conformance AbsoluteSpatialTemplateOutput.Element.Direction.Anchor()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.Anchor and conformance AbsoluteSpatialTemplateOutput.Element.Direction.Anchor;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.Anchor and conformance AbsoluteSpatialTemplateOutput.Element.Direction.Anchor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.Anchor and conformance AbsoluteSpatialTemplateOutput.Element.Direction.Anchor);
  }
  return result;
}

uint64_t destroy for SpatialTemplatePreferenceOutput(uint64_t a1)
{
  return outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(*(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
}

uint64_t initializeWithCopy for SpatialTemplatePreferenceOutput(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  char v6 = *(unsigned char *)(a2 + 40);
  outlined copy of SpatialTemplatePreferenceOutput.SpatialTemplate(v3, v4, v5, v6);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = v6;
  return a1;
}

uint64_t assignWithCopy for SpatialTemplatePreferenceOutput(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v3;
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  uint64_t v6 = a2[4];
  char v7 = *((unsigned char *)a2 + 40);
  outlined copy of SpatialTemplatePreferenceOutput.SpatialTemplate(v4, v5, v6, v7);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  char v11 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v7;
  outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(v8, v9, v10, v11);
  return a1;
}

uint64_t assignWithTake for SpatialTemplatePreferenceOutput(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = v3;
  char v8 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v4;
  outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for SpatialTemplatePreferenceOutput(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SpatialTemplatePreferenceOutput(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SpatialTemplatePreferenceOutput()
{
  return &type metadata for SpatialTemplatePreferenceOutput;
}

uint64_t destroy for SpatialTemplatePreferenceOutput.SpatialTemplate(uint64_t a1)
{
  return outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t initializeWithCopy for SpatialTemplatePreferenceOutput.SpatialTemplate(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  outlined copy of SpatialTemplatePreferenceOutput.SpatialTemplate(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for SpatialTemplatePreferenceOutput.SpatialTemplate(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  outlined copy of SpatialTemplatePreferenceOutput.SpatialTemplate(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  char v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + 24) = v6;
  outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SpatialTemplatePreferenceOutput.SpatialTemplate(uint64_t a1, uint64_t a2)
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
  outlined consume of SpatialTemplatePreferenceOutput.SpatialTemplate(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for SpatialTemplatePreferenceOutput.SpatialTemplate(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SpatialTemplatePreferenceOutput.SpatialTemplate(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for SpatialTemplatePreferenceOutput.SpatialTemplate(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 1u) {
    return *(unsigned __int8 *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t destructiveInjectEnumTag for SpatialTemplatePreferenceOutput.SpatialTemplate(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 2;
  if (a2 >= 2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    LOBYTE(a2) = 2;
    *(void *)__n128 result = v2;
  }
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SpatialTemplatePreferenceOutput.SpatialTemplate()
{
  return &type metadata for SpatialTemplatePreferenceOutput.SpatialTemplate;
}

uint64_t destroy for AbsoluteSpatialTemplateOutput()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for AbsoluteSpatialTemplateOutput(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for AbsoluteSpatialTemplateOutput(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for AbsoluteSpatialTemplateOutput(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AbsoluteSpatialTemplateOutput(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AbsoluteSpatialTemplateOutput(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AbsoluteSpatialTemplateOutput()
{
  return &type metadata for AbsoluteSpatialTemplateOutput;
}

uint64_t getEnumTagSinglePayload for PresentationTemplateOutput(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PresentationTemplateOutput(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x1A38D376CLL);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PresentationTemplateOutput()
{
  return &type metadata for PresentationTemplateOutput;
}

ValueMetadata *type metadata accessor for AbsoluteSpatialTemplateOutput.Element()
{
  return &type metadata for AbsoluteSpatialTemplateOutput.Element;
}

ValueMetadata *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Seat()
{
  return &type metadata for AbsoluteSpatialTemplateOutput.Element.Seat;
}

ValueMetadata *type metadata accessor for AbsoluteSpatialTemplateOutput.Role()
{
  return &type metadata for AbsoluteSpatialTemplateOutput.Role;
}

ValueMetadata *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Position()
{
  return &type metadata for AbsoluteSpatialTemplateOutput.Element.Position;
}

ValueMetadata *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Position.Anchor()
{
  return &type metadata for AbsoluteSpatialTemplateOutput.Element.Position.Anchor;
}

ValueMetadata *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Direction()
{
  return &type metadata for AbsoluteSpatialTemplateOutput.Element.Direction;
}

__n128 __swift_memcpy33_16(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Direction.Anchor()
{
  return &type metadata for AbsoluteSpatialTemplateOutput.Element.Direction.Anchor;
}

uint64_t getEnumTagSinglePayload for AbsoluteSpatialTemplateOutput.Element.Direction.Anchor(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AbsoluteSpatialTemplateOutput.Element.Direction.Anchor(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t destructiveInjectEnumTag for AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2 & 1;
  return result;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor()
{
  return &unk_1EF7171A0;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys()
{
  return &unk_1EF716DE0;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys()
{
  return &unk_1EF716B90;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Position.Anchor.CodingKeys()
{
  return &unk_1EF716C20;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Position.Anchor.AppCenterCodingKeys()
{
  return &unk_1EF716CB0;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Role.CodingKeys()
{
  return &unk_1EF716848;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys()
{
  return &unk_1EF716A78;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.CodingKeys()
{
  return &unk_1EF716958;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.SeatCodingKeys()
{
  return &unk_1EF7169E8;
}

void *type metadata accessor for PresentationTemplateOutput.CodingKeys()
{
  return &unk_1EF7161D0;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.CodingKeys()
{
  return &unk_1EF7167B8;
}

void *type metadata accessor for SpatialTemplatePreferenceOutput.CodingKeys()
{
  return &unk_1EF7179A8;
}

unsigned char *storeEnumTagSinglePayload for SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 5;
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
        JUMPOUT(0x1A38D3A84);
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
          void *result = a2 + 5;
        break;
    }
  }
  return result;
}

void *type metadata accessor for SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys()
{
  return &unk_1EF717708;
}

void *type metadata accessor for SpatialTemplatePreferenceOutput.SpatialTemplate.CustomAbsoluteCodingKeys()
{
  return &unk_1EF717888;
}

void *type metadata accessor for SpatialTemplatePreferenceOutput.SpatialTemplate.ConversationalCodingKeys()
{
  return &unk_1EF717868;
}

void *type metadata accessor for SpatialTemplatePreferenceOutput.SpatialTemplate.SideBySideCodingKeys()
{
  return &unk_1EF7176E8;
}

void *type metadata accessor for SpatialTemplatePreferenceOutput.SpatialTemplate.SurroundCodingKeys()
{
  return &unk_1EF7177B8;
}

void *type metadata accessor for SpatialTemplatePreferenceOutput.SpatialTemplate.NoneCodingKeys()
{
  return &unk_1EF717798;
}

void *type metadata accessor for SpatialTemplatePreferenceOutput.SpatialTemplate.PresentationCodingKeys()
{
  return &unk_1EF7177D8;
}

uint64_t specialized SpatialTemplatePreferenceOutput.SpatialTemplate.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x62416D6F74737563 && a2 == 0xEE006574756C6F73;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x61737265766E6F63 && a2 == 0xEE006C616E6F6974 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6953794265646973 && a2 == 0xEA00000000006564 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x646E756F72727573 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1701736302 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x61746E6573657270 && a2 == 0xEC0000006E6F6974)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t specialized SpatialTemplatePreferenceOutput.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x45746E65746E6F63 && a2 == 0xED0000746E657478;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574616C706D6574 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t specialized AbsoluteSpatialTemplateOutput.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x73746E656D656C65 && a2 == 0xE800000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001A3903000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t specialized PresentationTemplateOutput.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD00000000000001ELL && a2 == 0x80000001A3903020)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t specialized AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701605234 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F697469736F70 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F69746365726964 && a2 == 0xE90000000000006ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t specialized AbsoluteSpatialTemplateOutput.Element.Position.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x726F68636E61 && a2 == 0xE600000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74657366666FLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t specialized AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 120 && a2 == 0xE100000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 121 && a2 == 0xE100000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 122 && a2 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *specialized AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.init(from:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys>);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x1F4188790](v2);
  uint64_t v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys>);
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x1F4188790](v27);
  char v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys>);
  uint64_t v23 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  int v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys>);
  uint64_t v28 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  char v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys();
  uint64_t v12 = (uint64_t)v30;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  long long v13 = v29;
  uint64_t v30 = a1;
  uint64_t v14 = v11;
  uint64_t v15 = KeyedDecodingContainer.allKeys.getter();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = type metadata accessor for DecodingError();
    swift_allocError();
    char v11 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *char v11 = &unk_1EF716F60;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v11, *MEMORY[0x1E4FBBA70], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
    a1 = v30;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    return v11;
  }
  char v11 = (void *)*(unsigned __int8 *)(v15 + 32);
  if (*(unsigned char *)(v15 + 32))
  {
    if (v11 == 1)
    {
      char v32 = 1;
      lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
  return v11;
}

uint64_t specialized AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6F697469736F70 && a2 == 0xE800000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5764656E67696C61 && a2 == 0xEB00000000687469)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t specialized AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6F697461746F72 && a2 == 0xE800000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F68636E615FLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AbsoluteSpatialTemplateOutput.Element.Direction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x1A38D5EDCLL);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodingKeys()
{
  return &unk_1EF716FF0;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.PositionCodingKeys()
{
  return &unk_1EF717080;
}

unsigned char *storeEnumTagSinglePayload for AbsoluteSpatialTemplateOutput.Element.Position.Anchor(unsigned char *result, int a2, int a3)
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
        void *result = a2;
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
      void *result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1A38D5FC0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.AlignedWithCodingKeys()
{
  return &unk_1EF717110;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis()
{
  return &unk_1EF716F60;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys;
  if (!lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys and conformance AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AbsoluteSpatialTemplateOutput.Element.Seat.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 2;
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
        JUMPOUT(0x1A38D6594);
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
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.CodingKeys()
{
  return &unk_1EF716E70;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.XCodingKeys()
{
  return &unk_1EF716F00;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.YCodingKeys()
{
  return &unk_1EF716F20;
}

void *type metadata accessor for AbsoluteSpatialTemplateOutput.Element.Direction.CodableAnchor.CodableAxis.ZCodingKeys()
{
  return &unk_1EF716F40;
}

uint64_t StaticGroupActivity.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

GroupActivities::StaticGroupActivity __swiftcall StaticGroupActivity.init(id:)(GroupActivities::StaticGroupActivity id)
{
  GroupActivities::StaticGroupActivity *v1 = id;
  return id;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance StaticGroupActivity.CodingKeys()
{
  return 25705;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance StaticGroupActivity.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 25705 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance StaticGroupActivity.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance StaticGroupActivity.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t StaticGroupActivity.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<StaticGroupActivity.CodingKeys>);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t lazy protocol witness table accessor for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys;
  if (!lazy protocol witness table cache variable for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys;
  if (!lazy protocol witness table cache variable for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys;
  if (!lazy protocol witness table cache variable for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys;
  if (!lazy protocol witness table cache variable for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys);
  }
  return result;
}

uint64_t StaticGroupActivity.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<StaticGroupActivity.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  int v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

void protocol witness for static GroupActivity.activityIdentifier.getter in conformance StaticGroupActivity()
{
}

void static StaticGroupActivity.activityIdentifier.getter()
{
}

uint64_t protocol witness for GroupActivity.metadata.getter in conformance StaticGroupActivity(uint64_t a1)
{
  StaticGroupActivity.metadata.getter(a1);
  uint64_t v2 = *(uint64_t (**)(void))(v1 + 8);
  return protocol witness for GroupActivity.metadata.getter in conformance CollaborationActivity(v2);
}

uint64_t StaticGroupActivity.metadata.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for generic != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for GroupActivityMetadata.ActivityType(0);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static GroupActivityMetadata.ActivityType.generic);
  outlined init with copy of GroupActivityMetadata.ActivityType(v3, a1, type metadata accessor for GroupActivityMetadata.ActivityType);
  uint64_t v4 = (int *)type metadata accessor for GroupActivityMetadata(0);
  uint64_t v5 = (void *)(a1 + v4[5]);
  *uint64_t v5 = 0;
  v5[1] = 0;
  uint64_t v6 = (void *)(a1 + v4[6]);
  void *v6 = 0;
  v6[1] = 0;
  *(void *)(a1 + v4[7]) = 0;
  uint64_t v7 = a1 + v4[8];
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  *(void *)(a1 + v4[9]) = 0;
  *(unsigned char *)(a1 + v4[10]) = dyld_program_sdk_at_least() ^ 1;
  v9(a1 + v4[11], 1, 1, v8);
  uint64_t v10 = v4[12];
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  *(unsigned char *)(a1 + v4[13]) = 0;
  *(void *)(a1 + v4[14]) = 2;
  uint64_t v11 = one-time initialization token for none;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v12 = a1 + v10;
  char v13 = static SceneAssociationBehavior.none;
  uint64_t v14 = qword_1E95D64F8;
  long long v16 = xmmword_1E95D6500;
  uint64_t v15 = qword_1E95D6510;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(unsigned char *)uint64_t v12 = v13;
  *(void *)(v12 + 8) = v14;
  *(_OWORD *)(v12 + 16) = v16;
  *(void *)(v12 + 32) = v15;
  return result;
}

uint64_t protocol witness for static GroupActivity._identifiable(by:) in conformance StaticGroupActivity(uint64_t a1, uint64_t a2)
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)static StaticGroupActivityRegistry.shared + 128))(a1, a2) & 1;
}

uint64_t static StaticGroupActivity._identifiable(by:)(uint64_t a1, uint64_t a2)
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)static StaticGroupActivityRegistry.shared + 128))(a1, a2) & 1;
}

uint64_t protocol witness for Decodable.init(from:) in conformance StaticGroupActivity@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return StaticGroupActivity.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance StaticGroupActivity(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<StaticGroupActivity.CodingKeys>);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type StaticGroupActivity.CodingKeys and conformance StaticGroupActivity.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t *StaticGroupActivityRegistry.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  return &static StaticGroupActivityRegistry.shared;
}

Swift::Void __swiftcall StaticGroupActivity.register()()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  v3[0] = v1;
  v3[1] = v2;
  (*(void (**)(void *))(*(void *)static StaticGroupActivityRegistry.shared + 120))(v3);
}

uint64_t StaticGroupActivity.eraseToAnyGroupActivity()@<X0>(uint64_t a1@<X8>)
{
  v33[0] = a1;
  uint64_t v34 = type metadata accessor for AnyGroupActivity.MetadataProvider(0);
  MEMORY[0x1F4188790](v34);
  uint64_t v3 = (char *)v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = one-time initialization token for generic;
  swift_bridgeObjectRetain_n();
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for GroupActivityMetadata.ActivityType(0);
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)static GroupActivityMetadata.ActivityType.generic);
  outlined init with copy of GroupActivityMetadata.ActivityType(v8, (uint64_t)v3, type metadata accessor for GroupActivityMetadata.ActivityType);
  uint64_t v9 = (int *)type metadata accessor for GroupActivityMetadata(0);
  uint64_t v10 = &v3[v9[5]];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  uint64_t v11 = &v3[v9[6]];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *(void *)&v3[v9[7]] = 0;
  uint64_t v12 = &v3[v9[8]];
  uint64_t v13 = type metadata accessor for URL();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v12, 1, 1, v13);
  *(void *)&v3[v9[9]] = 0;
  v3[v9[10]] = dyld_program_sdk_at_least() ^ 1;
  v14(&v3[v9[11]], 1, 1, v13);
  uint64_t v15 = &v3[v9[12]];
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v38 = v5;
  uint64_t v16 = xmmword_1EB58E168;
  v3[v9[13]] = 0;
  *(void *)&v3[v9[14]] = 2;
  uint64_t v17 = one-time initialization token for none;
  v33[1] = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v17 != -1) {
    swift_once();
  }
  char v18 = static SceneAssociationBehavior.none;
  uint64_t v19 = qword_1E95D64F8;
  long long v21 = xmmword_1E95D6500;
  uint64_t v20 = qword_1E95D6510;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *uint64_t v15 = v18;
  *((void *)v15 + 1) = v19;
  *((_OWORD *)v15 + 1) = v21;
  *((void *)v15 + 4) = v20;
  swift_storeEnumTagMultiPayload();
  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  PropertyListEncoder.init()();
  uint64_t v22 = v38;
  uint64_t v36 = v38;
  uint64_t v37 = v4;
  lazy protocol witness table accessor for type StaticGroupActivity and conformance StaticGroupActivity();
  uint64_t v23 = v35;
  uint64_t v24 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  if (v23)
  {
    outlined destroy of AnyGroupActivity.MetadataProvider((uint64_t)v3, type metadata accessor for AnyGroupActivity.MetadataProvider);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v27 = v24;
    uint64_t v28 = v25;
    swift_release();
    uint64_t v29 = (int *)type metadata accessor for AnyGroupActivity(0);
    uint64_t v30 = (void *)v33[0];
    swift_bridgeObjectRetain();
    specialized IdentifiableGroupActivity.uuid.getter();
    swift_bridgeObjectRelease();
    *uint64_t v30 = v22;
    v30[1] = v4;
    _s15GroupActivities03AnyA8ActivityV16MetadataProviderOWObTm_0((uint64_t)v3, (uint64_t)v30 + v29[5], type metadata accessor for AnyGroupActivity.MetadataProvider);
    char v31 = (void *)((char *)v30 + v29[6]);
    *char v31 = v27;
    v31[1] = v28;
    char v32 = (void *)((char *)v30 + v29[8]);
    *char v32 = v22;
    v32[1] = v4;
    return swift_bridgeObjectRetain();
  }
}

uint64_t StaticGroupActivityRegistry.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = MEMORY[0x1E4FBC868];
  type metadata accessor for Lock();
  swift_allocObject();
  *(void *)(v0 + 24) = Lock.init()();
  return v0;
}

uint64_t static StaticGroupActivityRegistry.shared.getter()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t StaticGroupActivityRegistry.subscriptions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t StaticGroupActivityRegistry.subscriptions.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*StaticGroupActivityRegistry.subscriptions.modify())()
{
  return GroupSession.GroupSessionPlaybackSyncerLink.shouldRequestCatchup.modify;
}

Swift::Void __swiftcall StaticGroupActivityRegistry.register(activity:)(GroupActivities::StaticGroupActivity activity)
{
  uint64_t v2 = v1;
  countAndFlagsBits = (uint64_t *)activity.id._countAndFlagsBits;
  uint64_t v33 = *v2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.Map<AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never>, TUConversationActivitySessionContainer?>);
  uint64_t v32 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.RemoveDuplicates<Publishers.Map<AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never>, TUConversationActivitySessionContainer?>>);
  uint64_t v34 = *(void *)(v7 - 8);
  uint64_t v35 = v7;
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *countAndFlagsBits;
  uint64_t v10 = countAndFlagsBits[1];
  uint64_t v12 = v2[3];
  Lock.lock()();
  uint64_t v13 = *(uint64_t (**)(uint64_t))(*v2 + 96);
  uint64_t v14 = swift_bridgeObjectRetain();
  if (*(void *)(v13(v14) + 16) && (specialized __RawDictionaryStorage.find<A>(_:)(v11, v10), (v15 & 1) != 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v31[1] = v12;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v16 = one-time initialization token for conversationManagerClient;
    swift_bridgeObjectRetain();
    if (v16 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v17 = qword_1E95E7A30;
    char v18 = __swift_project_boxed_opaque_existential_1(static StaticGroupActivityRegistry.conversationManagerClient, qword_1E95E7A30);
    v31[0] = v31;
    uint64_t v19 = *(void *)(v17 - 8);
    MEMORY[0x1F4188790](v18);
    long long v21 = (char *)v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v21);
    uint64_t v22 = dispatch thunk of ActivitySessionContainerProvider.onActivitySessionsChanged.getter();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v17);
    v37[0] = v22;
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v11;
    *(void *)(v23 + 24) = v10;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never>);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TUConversationActivitySessionContainer?);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never> and conformance AnyPublisher<A, B>, &demangling cache variable for type metadata for AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never>);
    Publisher.map<A>(_:)();
    swift_release();
    swift_release();
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type Publishers.Map<AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never>, TUConversationActivitySessionContainer?> and conformance Publishers.Map<A, B>, &demangling cache variable for type metadata for Publishers.Map<AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never>, TUConversationActivitySessionContainer?>);
    Publisher.removeDuplicates(by:)();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v4);
    uint64_t v24 = (void *)swift_allocObject();
    v24[2] = v11;
    v24[3] = v10;
    v24[4] = v33;
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type Publishers.RemoveDuplicates<Publishers.Map<AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never>, TUConversationActivitySessionContainer?>> and conformance Publishers.RemoveDuplicates<A>, &demangling cache variable for type metadata for Publishers.RemoveDuplicates<Publishers.Map<AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never>, TUConversationActivitySessionContainer?>>);
    swift_bridgeObjectRetain();
    uint64_t v25 = v35;
    uint64_t v26 = Publisher<>.sink(receiveValue:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v9, v25);
    uint64_t v27 = (void (*)(void *, void))(*(uint64_t (**)(void *))(*v2 + 112))(v37);
    uint64_t v29 = v28;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v36 = *v29;
    *uint64_t v29 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v26, v11, v10, isUniquelyReferenced_nonNull_native);
    *uint64_t v29 = v36;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v27(v37, 0);
  }
  Lock.unlock()();
}

uint64_t *StaticGroupActivityRegistry.conversationManagerClient.unsafeMutableAddressor()
{
  if (one-time initialization token for conversationManagerClient != -1) {
    swift_once();
  }
  return static StaticGroupActivityRegistry.conversationManagerClient;
}

uint64_t closure #1 in StaticGroupActivityRegistry.register(activity:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_bridgeObjectRetain();
  specialized Sequence.first(where:)(v6, a1, a2);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v8;
  return result;
}

uint64_t closure #2 in StaticGroupActivityRegistry.register(activity:)(void **a1, void **a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v34 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID?, UUID?));
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  uint64_t v16 = (char *)&v33 - v15;
  MEMORY[0x1F4188790](v14);
  char v18 = (char *)&v33 - v17;
  uint64_t v19 = *a1;
  uint64_t v20 = *a2;
  if (v19)
  {
    id v21 = objc_msgSend(v19, sel_UUID);
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v22(v18, 0, 1, v4);
  }
  else
  {
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v22((char *)&v33 - v17, 1, 1, v4);
  }
  if (v20)
  {
    id v23 = objc_msgSend(v20, sel_UUID);
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = 1;
  }
  v22(v16, v24, 1, v4);
  uint64_t v25 = (uint64_t)&v9[*(int *)(v7 + 48)];
  outlined init with copy of UUID?((uint64_t)v18, (uint64_t)v9);
  outlined init with copy of UUID?((uint64_t)v16, v25);
  uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v26((uint64_t)v9, 1, v4) == 1)
  {
    outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v16, &demangling cache variable for type metadata for UUID?);
    outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v18, &demangling cache variable for type metadata for UUID?);
    int v27 = v26(v25, 1, v4);
    if (v27 == 1) {
      uint64_t v28 = &demangling cache variable for type metadata for UUID?;
    }
    else {
      uint64_t v28 = &demangling cache variable for type metadata for (UUID?, UUID?);
    }
    if (v27 == 1) {
      char v29 = -1;
    }
    else {
      char v29 = 0;
    }
  }
  else
  {
    outlined init with copy of UUID?((uint64_t)v9, (uint64_t)v13);
    if (v26(v25, 1, v4) == 1)
    {
      outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v16, &demangling cache variable for type metadata for UUID?);
      outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v18, &demangling cache variable for type metadata for UUID?);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
      char v29 = 0;
      uint64_t v28 = &demangling cache variable for type metadata for (UUID?, UUID?);
    }
    else
    {
      uint64_t v30 = v34;
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v34, v25, v4);
      _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_5((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E4F27990]);
      char v29 = dispatch thunk of static Equatable.== infix(_:_:)();
      char v31 = *(void (**)(char *, uint64_t))(v5 + 8);
      v31(v30, v4);
      uint64_t v28 = &demangling cache variable for type metadata for UUID?;
      outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v16, &demangling cache variable for type metadata for UUID?);
      outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v18, &demangling cache variable for type metadata for UUID?);
      v31(v13, v4);
    }
  }
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v9, v28);
  return v29 & 1;
}

uint64_t closure #3 in StaticGroupActivityRegistry.register(activity:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v61 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v13 = (char *)v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnyGroupActivity?);
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for AnyGroupActivity(0);
  uint64_t v18 = *(void *)(*(void *)(v17 - 8) + 64);
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  uint64_t result = MEMORY[0x1F4188790](v19);
  if (*a1)
  {
    uint64_t v62 = (uint64_t)v53 - v21;
    uint64_t v58 = v22;
    BOOL v59 = v10;
    uint64_t v60 = a4;
    MEMORY[0x1F4188790](result);
    uint64_t v56 = a2;
    uint64_t v23 = a3;
    uint64_t v25 = v24;
    id v27 = v26;
    tryLog<A>(_:_:function:line:)();
    uint64_t v57 = v25;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v16, 1, v17) == 1)
    {

      return outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v16, &demangling cache variable for type metadata for AnyGroupActivity?);
    }
    else
    {
      _s15GroupActivities03AnyA8ActivityV16MetadataProviderOWObTm_0((uint64_t)v16, v62, type metadata accessor for AnyGroupActivity);
      if (one-time initialization token for default != -1) {
        swift_once();
      }
      uint64_t v28 = type metadata accessor for Logger();
      __swift_project_value_buffer(v28, (uint64_t)static Log.default);
      id v29 = v27;
      uint64_t v30 = v23;
      swift_bridgeObjectRetain_n();
      id v31 = v29;
      uint64_t v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.default.getter();
      int v34 = v33;
      BOOL v35 = os_log_type_enabled(v32, v33);
      uint64_t v36 = (uint64_t)v59;
      if (v35)
      {
        uint64_t v37 = swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        uint64_t v65 = v55;
        *(_DWORD *)uint64_t v37 = 136315394;
        v53[1] = v37 + 4;
        id v38 = objc_msgSend(v31, sel_UUID);
        int v54 = v34;
        id v39 = v38;
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();

        _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_5((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E4F27990]);
        uint64_t v40 = dispatch thunk of CustomStringConvertible.description.getter();
        unint64_t v42 = v41;
        (*(void (**)(char *, uint64_t))(v61 + 8))(v13, v11);
        uint64_t v63 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v40, v42, &v65);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 12) = 2080;
        uint64_t v63 = v56;
        uint64_t v64 = v30;
        swift_bridgeObjectRetain();
        uint64_t v43 = String.init<A>(reflecting:)();
        uint64_t v63 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v43, v44, &v65);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1A375F000, v32, (os_log_type_t)v54, "Beginning static activity on conversation %s: %s.", (uint8_t *)v37, 0x16u);
        uint64_t v45 = v55;
        swift_arrayDestroy();
        MEMORY[0x1A624F870](v45, -1, -1);
        MEMORY[0x1A624F870](v37, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v46 = type metadata accessor for TaskPriority();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v36, 1, 1, v46);
      uint64_t v47 = v62;
      uint64_t v48 = v58;
      outlined init with copy of GroupActivityMetadata.ActivityType(v62, v58, type metadata accessor for AnyGroupActivity);
      unint64_t v49 = (*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
      unint64_t v50 = (v18 + v49 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v51 = swift_allocObject();
      *(void *)(v51 + 16) = 0;
      *(void *)(v51 + 24) = 0;
      _s15GroupActivities03AnyA8ActivityV16MetadataProviderOWObTm_0(v48, v51 + v49, type metadata accessor for AnyGroupActivity);
      *(void *)(v51 + v50) = v31;
      *(void *)(v51 + ((v50 + 15) & 0xFFFFFFFFFFFFFFF8)) = v60;
      id v52 = v31;
      _sScTss5Error_pRs_rlE8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntcfCyt_Tgm5(v36, (uint64_t)&async function pointer to partial apply for closure #1 in closure #3 in StaticGroupActivityRegistry.register(activity:), v51);

      swift_release();
      return outlined destroy of AnyGroupActivity.MetadataProvider(v47, type metadata accessor for AnyGroupActivity);
    }
  }
  return result;
}

uint64_t implicit closure #1 in closure #3 in StaticGroupActivityRegistry.register(activity:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v38 = a1;
  v33[0] = a3;
  uint64_t v34 = type metadata accessor for AnyGroupActivity.MetadataProvider(0);
  MEMORY[0x1F4188790](v34);
  uint64_t v5 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = one-time initialization token for generic;
  swift_bridgeObjectRetain_n();
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for GroupActivityMetadata.ActivityType(0);
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)static GroupActivityMetadata.ActivityType.generic);
  outlined init with copy of GroupActivityMetadata.ActivityType(v8, (uint64_t)v5, type metadata accessor for GroupActivityMetadata.ActivityType);
  uint64_t v9 = (int *)type metadata accessor for GroupActivityMetadata(0);
  uint64_t v10 = &v5[v9[5]];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  uint64_t v11 = &v5[v9[6]];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *(void *)&v5[v9[7]] = 0;
  uint64_t v12 = &v5[v9[8]];
  uint64_t v13 = type metadata accessor for URL();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v12, 1, 1, v13);
  *(void *)&v5[v9[9]] = 0;
  v5[v9[10]] = dyld_program_sdk_at_least() ^ 1;
  v14(&v5[v9[11]], 1, 1, v13);
  uint64_t v15 = &v5[v9[12]];
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v16 = xmmword_1EB58E168;
  v5[v9[13]] = 0;
  *(void *)&v5[v9[14]] = 2;
  uint64_t v17 = one-time initialization token for none;
  v33[1] = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v17 != -1) {
    swift_once();
  }
  char v18 = static SceneAssociationBehavior.none;
  uint64_t v19 = qword_1E95D64F8;
  long long v21 = xmmword_1E95D6500;
  uint64_t v20 = qword_1E95D6510;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *uint64_t v15 = v18;
  *((void *)v15 + 1) = v19;
  *((_OWORD *)v15 + 1) = v21;
  *((void *)v15 + 4) = v20;
  swift_storeEnumTagMultiPayload();
  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  PropertyListEncoder.init()();
  uint64_t v22 = v38;
  uint64_t v36 = v38;
  uint64_t v37 = a2;
  lazy protocol witness table accessor for type StaticGroupActivity and conformance StaticGroupActivity();
  uint64_t v23 = v35;
  uint64_t v24 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  if (v23)
  {
    outlined destroy of AnyGroupActivity.MetadataProvider((uint64_t)v5, type metadata accessor for AnyGroupActivity.MetadataProvider);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v27 = v24;
    uint64_t v28 = v25;
    swift_release();
    id v29 = (int *)type metadata accessor for AnyGroupActivity(0);
    uint64_t v30 = (void *)v33[0];
    swift_bridgeObjectRetain();
    specialized IdentifiableGroupActivity.uuid.getter();
    swift_bridgeObjectRelease();
    *uint64_t v30 = v22;
    v30[1] = a2;
    _s15GroupActivities03AnyA8ActivityV16MetadataProviderOWObTm_0((uint64_t)v5, (uint64_t)v30 + v29[5], type metadata accessor for AnyGroupActivity.MetadataProvider);
    id v31 = (void *)((char *)v30 + v29[6]);
    *id v31 = v27;
    v31[1] = v28;
    uint64_t v32 = (void *)((char *)v30 + v29[8]);
    *uint64_t v32 = v22;
    v32[1] = a2;
    return swift_bridgeObjectRetain();
  }
}

uint64_t closure #1 in closure #3 in StaticGroupActivityRegistry.register(activity:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[10] = a5;
  uint64_t v6 = type metadata accessor for UUID();
  v5[11] = v6;
  v5[12] = *(void *)(v6 - 8);
  v5[13] = swift_task_alloc();
  uint64_t v7 = (void *)swift_task_alloc();
  v5[14] = v7;
  *uint64_t v7 = v5;
  v7[1] = closure #1 in closure #3 in StaticGroupActivityRegistry.register(activity:);
  return AnyGroupActivity.tuConversationActivityCreateSessionRequest.getter();
}

uint64_t closure #1 in closure #3 in StaticGroupActivityRegistry.register(activity:)(uint64_t a1)
{
  *(void *)(*(void *)v1 + 120) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](closure #1 in closure #3 in StaticGroupActivityRegistry.register(activity:), 0, 0);
}

uint64_t closure #1 in closure #3 in StaticGroupActivityRegistry.register(activity:)()
{
  if (one-time initialization token for conversationManagerClient != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[10];
  swift_beginAccess();
  outlined init with copy of AudioSessionAssertionManager((uint64_t)static StaticGroupActivityRegistry.conversationManagerClient, (uint64_t)(v0 + 2));
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v2);
  id v4 = objc_msgSend(v1, sel_UUID);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v5 = (void *)swift_task_alloc();
  v0[16] = v5;
  *uint64_t v5 = v0;
  v5[1] = closure #1 in closure #3 in StaticGroupActivityRegistry.register(activity:);
  uint64_t v6 = v0[15];
  uint64_t v7 = v0[13];
  return MEMORY[0x1F4113760](v6, v7, v2, v3);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  uint64_t v2 = *(void *)(*(void *)v1 + 104);
  uint64_t v3 = *(void *)(*(void *)v1 + 96);
  id v4 = *(void *)(*(void *)v1 + 88);
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (v0) {
    uint64_t v5 = closure #1 in closure #3 in StaticGroupActivityRegistry.register(activity:);
  }
  else {
    uint64_t v5 = closure #1 in closure #3 in StaticGroupActivityRegistry.register(activity:);
  }
  return MEMORY[0x1F4188298](v5, 0, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

Swift::Bool __swiftcall StaticGroupActivityRegistry.isStaticActivity(activityIdentifier:)(Swift::String activityIdentifier)
{
  Lock.withLock<A>(_:)();
  return v2;
}

uint64_t closure #1 in StaticGroupActivityRegistry.isStaticActivity(activityIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v7 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 96);
  uint64_t v8 = swift_bridgeObjectRetain();
  if (*(void *)(v7(v8) + 16) && (specialized __RawDictionaryStorage.find<A>(_:)(a2, a3), (v9 & 1) != 0))
  {
    swift_retain();
    char v10 = 1;
  }
  else
  {
    char v10 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  *a4 = v10;
  return result;
}

uint64_t one-time initialization function for conversationManagerClient()
{
  uint64_t v0 = type metadata accessor for ConversationManagerClient();
  uint64_t result = static ConversationManagerClient.shared.getter();
  qword_1E95E7A30 = v0;
  unk_1E95E7A38 = MEMORY[0x1E4F5B040];
  static StaticGroupActivityRegistry.conversationManagerClient = result;
  return result;
}

uint64_t static StaticGroupActivityRegistry.conversationManagerClient.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for conversationManagerClient != -1) {
    swift_once();
  }
  swift_beginAccess();
  return outlined init with copy of AudioSessionAssertionManager((uint64_t)static StaticGroupActivityRegistry.conversationManagerClient, a1);
}

uint64_t static StaticGroupActivityRegistry.conversationManagerClient.setter(uint64_t *a1)
{
  if (one-time initialization token for conversationManagerClient != -1) {
    swift_once();
  }
  swift_beginAccess();
  __swift_assign_boxed_opaque_existential_1(static StaticGroupActivityRegistry.conversationManagerClient, a1);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t (*static StaticGroupActivityRegistry.conversationManagerClient.modify())()
{
  if (one-time initialization token for conversationManagerClient != -1) {
    swift_once();
  }
  swift_beginAccess();
  return GroupSession.attachmentDownloadBytes.modify;
}

uint64_t StaticGroupActivityRegistry.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t StaticGroupActivityRegistry.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t StaticGroupActivityRegistry.init()()
{
  *(void *)(v0 + 16) = MEMORY[0x1E4FBC868];
  type metadata accessor for Lock();
  swift_allocObject();
  *(void *)(v0 + 24) = Lock.init()();
  return v0;
}

unint64_t lazy protocol witness table accessor for type StaticGroupActivity and conformance StaticGroupActivity()
{
  unint64_t result = lazy protocol witness table cache variable for type StaticGroupActivity and conformance StaticGroupActivity;
  if (!lazy protocol witness table cache variable for type StaticGroupActivity and conformance StaticGroupActivity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StaticGroupActivity and conformance StaticGroupActivity);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type StaticGroupActivity and conformance StaticGroupActivity;
  if (!lazy protocol witness table cache variable for type StaticGroupActivity and conformance StaticGroupActivity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StaticGroupActivity and conformance StaticGroupActivity);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type StaticGroupActivity and conformance StaticGroupActivity;
  if (!lazy protocol witness table cache variable for type StaticGroupActivity and conformance StaticGroupActivity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StaticGroupActivity and conformance StaticGroupActivity);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type StaticGroupActivity and conformance StaticGroupActivity;
  if (!lazy protocol witness table cache variable for type StaticGroupActivity and conformance StaticGroupActivity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StaticGroupActivity and conformance StaticGroupActivity);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type StaticGroupActivity and conformance StaticGroupActivity;
  if (!lazy protocol witness table cache variable for type StaticGroupActivity and conformance StaticGroupActivity)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StaticGroupActivity and conformance StaticGroupActivity);
  }
  return result;
}

uint64_t sub_1A38D9880()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for closure #1 in StaticGroupActivityRegistry.register(activity:)@<X0>(void *a1@<X8>)
{
  return closure #1 in StaticGroupActivityRegistry.register(activity:)(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_1A38D98C0()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t partial apply for closure #3 in StaticGroupActivityRegistry.register(activity:)(void *a1)
{
  return closure #3 in StaticGroupActivityRegistry.register(activity:)(a1, v1[2], v1[3], v1[4]);
}

uint64_t partial apply for closure #1 in StaticGroupActivityRegistry.isStaticActivity(activityIdentifier:)@<X0>(char *a1@<X8>)
{
  return closure #1 in StaticGroupActivityRegistry.isStaticActivity(activityIdentifier:)(v1[2], v1[3], v1[4], a1);
}

unint64_t instantiation function for generic protocol witness table for StaticGroupActivity(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type StaticGroupActivity and conformance StaticGroupActivity();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for StaticGroupActivity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for StaticGroupActivity(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type StaticGroupActivity and conformance StaticGroupActivity, (uint64_t (*)(void))lazy protocol witness table accessor for type StaticGroupActivity and conformance StaticGroupActivity);
}

{
  return instantiation function for generic protocol witness table for StaticGroupActivity(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type StaticGroupActivity and conformance StaticGroupActivity, (uint64_t (*)(void))lazy protocol witness table accessor for type StaticGroupActivity and conformance StaticGroupActivity);
}

uint64_t instantiation function for generic protocol witness table for StaticGroupActivity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  *(void *)(a1 + 8) = a4();
  uint64_t result = a5();
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A38D9B30@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 96))();
  *a2 = result;
  return result;
}

uint64_t sub_1A38D9B7C(uint64_t a1, uint64_t a2)
{
  Swift::Bool v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 104);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

ValueMetadata *type metadata accessor for StaticGroupActivity()
{
  return &type metadata for StaticGroupActivity;
}

uint64_t type metadata accessor for StaticGroupActivityRegistry()
{
  return self;
}

uint64_t method lookup function for StaticGroupActivityRegistry(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for StaticGroupActivityRegistry);
}

uint64_t dispatch thunk of StaticGroupActivityRegistry.subscriptions.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of StaticGroupActivityRegistry.subscriptions.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of StaticGroupActivityRegistry.subscriptions.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of StaticGroupActivityRegistry.register(activity:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of StaticGroupActivityRegistry.isStaticActivity(activityIdentifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of StaticGroupActivityRegistry.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

unsigned char *storeEnumTagSinglePayload for StaticGroupActivity.CodingKeys(unsigned char *result, int a2, int a3)
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
        void *result = a2;
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
      void *result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1A38D9D80);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void *type metadata accessor for StaticGroupActivity.CodingKeys()
{
  return &unk_1EF718868;
}

uint64_t partial apply for implicit closure #1 in closure #3 in StaticGroupActivityRegistry.register(activity:)@<X0>(uint64_t a1@<X8>)
{
  return implicit closure #1 in closure #3 in StaticGroupActivityRegistry.register(activity:)(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t _s15GroupActivities03AnyA8ActivityV16MetadataProviderOWObTm_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of GroupActivityMetadata.ActivityType(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1A38D9FAC()
{
  uint64_t v1 = v0;
  Swift::Bool v2 = (int *)type metadata accessor for AnyGroupActivity(0);
  uint64_t v3 = *(unsigned __int8 *)(*((void *)v2 - 1) + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*((void *)v2 - 1) + 64);
  swift_unknownObjectRelease();
  uint64_t v6 = v1 + v4;
  swift_bridgeObjectRelease();
  uint64_t v7 = v1 + v4 + v2[5];
  type metadata accessor for AnyGroupActivity.MetadataProvider(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_release();
  }
  else
  {
    uint64_t v19 = v5;
    uint64_t v20 = v1;
    uint64_t v8 = type metadata accessor for GroupActivityDescription();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
    char v9 = (int *)type metadata accessor for GroupActivityMetadata(0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    uint64_t v10 = v7 + v9[8];
    uint64_t v11 = type metadata accessor for URL();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    if (!v13(v10, 1, v11)) {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    }
    uint64_t v14 = v7 + v9[11];
    if (!v13(v14, 1, v11)) {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v14, v11);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = (v3 + 32) & ~v3;
    uint64_t v1 = v20;
    uint64_t v5 = v19;
  }
  unint64_t v15 = (v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  outlined consume of Data._Representation(*(void *)(v6 + v2[6]), *(void *)(v6 + v2[6] + 8));
  uint64_t v16 = v6 + v2[7];
  uint64_t v17 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v1, ((v15 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | 7);
}

uint64_t partial apply for closure #1 in closure #3 in StaticGroupActivityRegistry.register(activity:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for AnyGroupActivity(0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = protocol witness for AnyTransportSession.removeAttachment(id:) in conformance GroupSession<A>;
  return closure #1 in closure #3 in StaticGroupActivityRegistry.register(activity:)(a1, v6, v7, v8, v9);
}

uint64_t outlined destroy of AnyGroupActivity.MetadataProvider(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined init with copy of UUID?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t specialized Sequence.contains(where:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for TUConversationActivitySession();
    _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_5(&lazy protocol witness table cache variable for type TUConversationActivitySession and conformance NSObject, (void (*)(uint64_t))type metadata accessor for TUConversationActivitySession);
    uint64_t result = Set.Iterator.init(_cocoa:)();
    uint64_t v3 = v30;
    uint64_t v27 = v31;
    uint64_t v5 = v32;
    uint64_t v6 = v33;
    unint64_t v7 = v34;
  }
  else
  {
    uint64_t v8 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v27 = a1 + 56;
    uint64_t v5 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v7 = v10 & *(void *)(a1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v6 = 0;
  }
  int64_t v26 = (unint64_t)(v5 + 64) >> 6;
  while (1)
  {
    uint64_t v12 = v6;
    if ((v3 & 0x8000000000000000) == 0) {
      break;
    }
    if (!__CocoaSet.Iterator.next()()) {
      goto LABEL_36;
    }
    type metadata accessor for TUConversationActivitySession();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v15 = v35;
    swift_unknownObjectRelease();
    if (!v35) {
      goto LABEL_36;
    }
LABEL_32:
    uint64_t v19 = v3;
    id v20 = objc_msgSend(v15, sel_activity);
    id v21 = objc_msgSend(v20, sel_activityIdentifier);

    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v24 = v23;

    if (v22 == a2 && v24 == a3)
    {

      swift_bridgeObjectRelease();
      uint64_t v25 = 1;
      goto LABEL_37;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();

    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v3 = v19;
    if (v11)
    {
      uint64_t v25 = 1;
      goto LABEL_37;
    }
  }
  if (v7)
  {
    unint64_t v13 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v14 = v13 | (v6 << 6);
LABEL_31:
    id v15 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
    if (!v15) {
      goto LABEL_36;
    }
    goto LABEL_32;
  }
  int64_t v16 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v16 >= v26) {
      goto LABEL_36;
    }
    unint64_t v17 = *(void *)(v27 + 8 * v16);
    ++v6;
    if (!v17)
    {
      uint64_t v6 = v12 + 2;
      if (v12 + 2 >= v26) {
        goto LABEL_36;
      }
      unint64_t v17 = *(void *)(v27 + 8 * v6);
      if (!v17)
      {
        uint64_t v6 = v12 + 3;
        if (v12 + 3 >= v26) {
          goto LABEL_36;
        }
        unint64_t v17 = *(void *)(v27 + 8 * v6);
        if (!v17)
        {
          uint64_t v6 = v12 + 4;
          if (v12 + 4 >= v26) {
            goto LABEL_36;
          }
          unint64_t v17 = *(void *)(v27 + 8 * v6);
          if (!v17)
          {
            uint64_t v6 = v12 + 5;
            if (v12 + 5 >= v26) {
              goto LABEL_36;
            }
            unint64_t v17 = *(void *)(v27 + 8 * v6);
            if (!v17)
            {
              uint64_t v18 = v12 + 6;
              while (v26 != v18)
              {
                unint64_t v17 = *(void *)(v27 + 8 * v18++);
                if (v17)
                {
                  uint64_t v6 = v18 - 1;
                  goto LABEL_30;
                }
              }
LABEL_36:
              uint64_t v25 = 0;
LABEL_37:
              outlined consume of [AnyHashable : Any].Iterator._Variant();
              return v25;
            }
          }
        }
      }
    }
LABEL_30:
    unint64_t v7 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v6 << 6);
    goto LABEL_31;
  }
  __break(1u);
  return result;
}

void specialized Sequence.first(where:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v20 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (v7)
  {
    unint64_t v9 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v10 = v9 | (v8 << 6);
LABEL_18:
    id v14 = *(id *)(*(void *)(a1 + 56) + 8 * v10);
    if (objc_msgSend(v14, sel_state) == (id)3)
    {
      id v15 = objc_msgSend(v14, sel_activitySessions);
      type metadata accessor for TUConversationActivitySession();
      _s10Foundation4UUIDVACs23CustomStringConvertibleAAWlTm_5(&lazy protocol witness table cache variable for type TUConversationActivitySession and conformance NSObject, (void (*)(uint64_t))type metadata accessor for TUConversationActivitySession);
      uint64_t v16 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

      swift_bridgeObjectRetain();
      LOBYTE(v15) = specialized Sequence.contains(where:)(v16, a2, a3);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v15 & 1) == 0)
      {
LABEL_20:
        swift_release();
        return;
      }
    }
  }
  if (__OFADD__(v8++, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v8 >= v20) {
    goto LABEL_20;
  }
  unint64_t v12 = *(void *)(v19 + 8 * v8);
  if (v12)
  {
LABEL_17:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
    goto LABEL_18;
  }
  int64_t v13 = v8 + 1;
  if (v8 + 1 >= v20) {
    goto LABEL_20;
  }
  unint64_t v12 = *(void *)(v19 + 8 * v13);
  if (v12) {
    goto LABEL_16;
  }
  int64_t v13 = v8 + 2;
  if (v8 + 2 >= v20) {
    goto LABEL_20;
  }
  unint64_t v12 = *(void *)(v19 + 8 * v13);
  if (v12) {
    goto LABEL_16;
  }
  int64_t v13 = v8 + 3;
  if (v8 + 3 >= v20) {
    goto LABEL_20;
  }
  unint64_t v12 = *(void *)(v19 + 8 * v13);
  if (v12)
  {
LABEL_16:
    int64_t v8 = v13;
    goto LABEL_17;
  }
  int64_t v17 = v8 + 4;
  if (v8 + 4 >= v20) {
    goto LABEL_20;
  }
  unint64_t v12 = *(void *)(v19 + 8 * v17);
  v8 += 4;
  if (v12) {
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v8 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v8 >= v20) {
      goto LABEL_20;
    }
    unint64_t v12 = *(void *)(v19 + 8 * v8);
    ++v17;
    if (v12) {
      goto LABEL_17;
    }
  }
LABEL_29:
  __break(1u);
}

void AVPlaybackCoordinator.coordinateWithSession<A>(_:)(char *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  int64_t v8 = (char *)v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Participant();
  MEMORY[0x1F4188790](v9 - 8);
  char v11 = (char *)v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for playback != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  void v46[2] = __swift_project_value_buffer(v12, (uint64_t)static Logger.playback);
  int64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_1A375F000, v13, v14, "coordinateWithSession called", v15, 2u);
    MEMORY[0x1A624F870](v15, -1, -1);
  }

  uint64_t v16 = &a1[direct field offset for GroupSession.playbackSyncerLink];
  swift_beginAccess();
  if (*(void *)v16)
  {
    uint64_t v17 = *(void *)(*(void *)v16 + direct field offset for GroupSession.GroupSessionPlaybackSyncerLink.playbackSyncer);
    GroupSession.localParticipant.getter((uint64_t)v11);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
    swift_retain();
    outlined destroy of Participant((uint64_t)v11);
    (*(void (**)(void *, char *))(*(void *)v17 + 496))(v2, v8);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    type metadata accessor for GroupSessionMessenger();
    uint64_t v18 = swift_retain();
    uint64_t v19 = GroupSessionMessenger.__allocating_init<A>(session:)(v18);
    int64_t v20 = (uint64_t *)&a1[direct field offset for GroupSession.playbackSyncMessenger];
    swift_beginAccess();
    *int64_t v20 = v19;
    swift_retain();
    swift_release();
    v46[1] = type metadata accessor for PlaybackSyncer(0);
    id v21 = *(void **)&a1[*(void *)(*(void *)a1 + 288)];
    GroupSession.localParticipant.getter((uint64_t)v11);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
    id v22 = v2;
    id v23 = v21;
    outlined destroy of Participant((uint64_t)v11);
    uint64_t v24 = PlaybackSyncer.__allocating_init(coordinator:serialQueue:localParticipantUUID:)(v22, v23, (uint64_t)v8);
    uint64_t v25 = *(void *)(v4 + 88);
    uint64_t v48 = *(void *)(v4 + 80);
    uint64_t v49 = v48;
    uint64_t v50 = v25;
    uint64_t v51 = v25;
    type metadata accessor for GroupSession.GroupSessionPlaybackSyncerLink();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v26 = GroupSession.GroupSessionPlaybackSyncerLink.__allocating_init(groupSession:messenger:playbackSyncer:)(a1, v19, v24);
    GroupSession.registerPlaybackSyncerLink(_:)(v26);
    swift_release();
    swift_release();
  }
  swift_release();
  self;
  uint64_t v27 = swift_dynamicCastObjCClass();
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    id v29 = v2;
    id v30 = objc_msgSend(v28, sel_player);
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = UUID.uuidString.getter();
      uint64_t v33 = (void *)MEMORY[0x1A624DFA0](v32);
      swift_bridgeObjectRelease();
      objc_msgSend(v31, sel_setBackgroundPIPAuthorizationToken_, v33);
    }
    swift_retain_n();
    id v34 = v29;
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v47 = v38;
      *(_DWORD *)uint64_t v37 = 136315394;
      uint64_t v48 = UUID.uuidString.getter();
      uint64_t v49 = v39;
      uint64_t v40 = String.init<A>(reflecting:)();
      uint64_t v48 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v40, v41, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2080;
      id v42 = objc_msgSend(v28, sel_player);
      if (v42)
      {
        uint64_t v48 = (uint64_t)v42;
        type metadata accessor for AVPlayer();
        uint64_t v43 = String.init<A>(reflecting:)();
        unint64_t v45 = v44;
      }
      else
      {
        unint64_t v45 = 0xE300000000000000;
        uint64_t v43 = 7104878;
      }
      uint64_t v48 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v43, v45, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A375F000, v35, v36, "Setting session identifier %s on %s", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1A624F870](v38, -1, -1);
      MEMORY[0x1A624F870](v37, -1, -1);
    }
    else
    {

      swift_release_n();
    }
  }
}

unint64_t type metadata accessor for AVPlayer()
{
  unint64_t result = lazy cache variable for type metadata for AVPlayer;
  if (!lazy cache variable for type metadata for AVPlayer)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for AVPlayer);
  }
  return result;
}

id AppCapabilities.task.getter()
{
  return *(id *)(v0 + OBJC_IVAR___GPAppCapabilities_task);
}

id AppCapabilities.managedConfigurationObserver.getter()
{
  uint64_t v1 = OBJC_IVAR___GPAppCapabilities____lazy_storage___managedConfigurationObserver;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___GPAppCapabilities____lazy_storage___managedConfigurationObserver);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___GPAppCapabilities____lazy_storage___managedConfigurationObserver);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CPManagedConfigurationObserver()), sel_init);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t AppCapabilities.managedConfigurationObserver.setter(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR___GPAppCapabilities____lazy_storage___managedConfigurationObserver) = a1;
  return MEMORY[0x1F41817F8]();
}

void (*AppCapabilities.managedConfigurationObserver.modify(id *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = AppCapabilities.managedConfigurationObserver.getter();
  return AppCapabilities.managedConfigurationObserver.modify;
}

void AppCapabilities.managedConfigurationObserver.modify(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  id v3 = *(void **)(v1 + OBJC_IVAR___GPAppCapabilities____lazy_storage___managedConfigurationObserver);
  *(void *)(v1 + OBJC_IVAR___GPAppCapabilities____lazy_storage___managedConfigurationObserver) = v2;
}

uint64_t AppCapabilities.supportsSharePlay.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Entitlement();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR___GPAppCapabilities____lazy_storage___supportsSharePlay;
  int v7 = *(unsigned __int8 *)(v0 + OBJC_IVAR___GPAppCapabilities____lazy_storage___supportsSharePlay);
  if (v7 != 2) {
    return v7 & 1;
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4F5AF38], v2);
  char v8 = specialized SecTaskRef.value<A>(_:forEntitlement:)((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t result = v8 & 1;
  *(unsigned char *)(v1 + v6) = v8 & 1;
  return result;
}

uint64_t AppCapabilities.supportsStartFromApp.getter()
{
  uint64_t v1 = OBJC_IVAR___GPAppCapabilities____lazy_storage___supportsStartFromApp;
  int v2 = *((unsigned __int8 *)v0 + OBJC_IVAR___GPAppCapabilities____lazy_storage___supportsStartFromApp);
  if (v2 == 2)
  {
    uint64_t v3 = v0;
    uint64_t v4 = (void *)MEMORY[0x1E4FBC8C8];
    if ((*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))())
    {
      uint64_t v5 = (void *)(*(uint64_t (**)(void))((*v4 & *v0) + 0x70))();
      char v6 = dispatch thunk of CPManagedConfigurationObserver.allowed.getter();
    }
    else
    {
      char v6 = 0;
    }
    *((unsigned char *)v3 + v1) = v6 & 1;
  }
  else
  {
    char v6 = v2 & 1;
  }
  return v6 & 1;
}

id AppCapabilities.__allocating_init(auditToken:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  return AppCapabilities.init(auditToken:)(a1, a2, a3, a4);
}

id AppCapabilities.init(auditToken:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unsigned int v5 = a4;
  unsigned int v6 = a3;
  unsigned int v7 = a2;
  unsigned int v8 = a1;
  unint64_t v9 = HIDWORD(a1);
  unint64_t v29 = HIDWORD(a2);
  unint64_t v10 = HIDWORD(a3);
  unint64_t v11 = HIDWORD(a4);
  uint64_t v12 = OBJC_IVAR___GPAppCapabilities____lazy_storage___managedConfigurationObserver;
  *(void *)&v4[OBJC_IVAR___GPAppCapabilities____lazy_storage___managedConfigurationObserver] = 0;
  v4[OBJC_IVAR___GPAppCapabilities____lazy_storage___supportsSharePlay] = 2;
  v4[OBJC_IVAR___GPAppCapabilities____lazy_storage___supportsStartFromApp] = 2;
  int64_t v13 = v4;
  token.val[0] = v8;
  token.val[1] = v9;
  token.val[2] = v7;
  token.val[3] = v29;
  token.val[4] = v6;
  token.val[5] = v10;
  token.val[6] = v5;
  token.val[7] = v11;
  SecTaskRef v14 = SecTaskCreateWithAuditToken(0, &token);
  if (v14)
  {
    *(void *)&v13[OBJC_IVAR___GPAppCapabilities_task] = v14;

    v30.receiver = v13;
    v30.super_class = (Class)type metadata accessor for AppCapabilities();
    return objc_msgSendSuper2(&v30, sel_init);
  }
  else
  {
    unsigned int v26 = v5;
    uint64_t v27 = v4;
    unsigned int v25 = v6;
    uint64_t v28 = v12;
    if (one-time initialization token for default != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    __swift_project_value_buffer(v16, (uint64_t)static Log.default);
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    uint64_t v19 = v13;
    if (os_log_type_enabled(v17, v18))
    {
      int64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v31 = v21;
      *(_DWORD *)int64_t v20 = 136315138;
      token.val[0] = v8;
      token.val[1] = v9;
      token.val[2] = v7;
      token.val[3] = v29;
      token.val[4] = v25;
      token.val[5] = v10;
      token.val[6] = v26;
      token.val[7] = v11;
      type metadata accessor for audit_token_t(0);
      uint64_t v22 = String.init<A>(reflecting:)();
      *(void *)token.val = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v23, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A375F000, v17, v18, "Failed to create SecTask with auditToken %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A624F870](v21, -1, -1);
      MEMORY[0x1A624F870](v20, -1, -1);
    }
    else
    {
    }
    uint64_t v24 = *(void **)&v27[v28];

    type metadata accessor for AppCapabilities();
    swift_deallocPartialClassInstance();
    return 0;
  }
}

id AppCapabilities.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void AppCapabilities.init()()
{
}

id AppCapabilities.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppCapabilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AppCapabilities()
{
  return self;
}

uint64_t sub_1A38DB948@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x70))();
  *a2 = result;
  return result;
}

uint64_t sub_1A38DB9A4(id *a1, void **a2)
{
  return (*(uint64_t (**)(id))((*MEMORY[0x1E4FBC8C8] & **a2) + 0x78))(*a1);
}

uint64_t sub_1A38DBA08@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0x88))();
  *a2 = result & 1;
  return result;
}

unsigned char *sub_1A38DBA68(unsigned char *result, void *a2)
{
  *(unsigned char *)(*a2 + OBJC_IVAR___GPAppCapabilities____lazy_storage___supportsSharePlay) = *result;
  return result;
}

uint64_t sub_1A38DBA80@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & **a1) + 0xA0))();
  *a2 = result & 1;
  return result;
}

unsigned char *sub_1A38DBAE0(unsigned char *result, void *a2)
{
  *(unsigned char *)(*a2 + OBJC_IVAR___GPAppCapabilities____lazy_storage___supportsStartFromApp) = *result;
  return result;
}

uint64_t method lookup function for AppCapabilities(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AppCapabilities);
}

uint64_t dispatch thunk of AppCapabilities.managedConfigurationObserver.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of AppCapabilities.managedConfigurationObserver.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AppCapabilities.managedConfigurationObserver.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AppCapabilities.supportsSharePlay.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AppCapabilities.supportsStartFromApp.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of AppCapabilities.__allocating_init(auditToken:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t Conversation.__allocating_init(sessionContainer:)(void *a1)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  unsigned int v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  unsigned int v8 = (char *)&v13 - v7;
  id v9 = objc_msgSend(a1, sel_UUID);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  id v10 = objc_msgSend(a1, sel_groupUUID);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v11 = (*(uint64_t (**)(char *, char *))(v1 + 368))(v8, v6);
  swift_retain();
  Conversation.update(with:)(a1);
  swift_release();

  return v11;
}

Swift::Int specialized InternalGroupSessionProvider.groupSessions(for:)(void *a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(a1, sel_activitySessions);
  type metadata accessor for TUConversationActivitySession();
  _s10Foundation4UUIDVACSHAAWlTm_5(&lazy protocol witness table cache variable for type TUConversationActivitySession and conformance NSObject, (void (*)(uint64_t))type metadata accessor for TUConversationActivitySession);
  uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v5 & 0xC000000000000001) != 0)
  {
    uint64_t v6 = MEMORY[0x1E4FBC870];
    uint64_t v24 = MEMORY[0x1E4FBC870];
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      uint64_t v22 = v2;
      do
      {
        swift_dynamicCast();
        if (objc_msgSend(v23, sel_state) && objc_msgSend(v23, sel_state) != (id)1)
        {
        }
        else
        {
          uint64_t v7 = v24;
          unint64_t v8 = *(void *)(v24 + 16);
          if (*(void *)(v24 + 24) <= v8)
          {
            specialized _NativeSet.resize(capacity:)(v8 + 1);
            uint64_t v7 = v24;
          }
          Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v7 + 40));
          uint64_t v10 = v7 + 56;
          uint64_t v11 = -1 << *(unsigned char *)(v7 + 32);
          unint64_t v12 = result & ~v11;
          unint64_t v13 = v12 >> 6;
          if (((-1 << v12) & ~*(void *)(v7 + 56 + 8 * (v12 >> 6))) != 0)
          {
            unint64_t v14 = __clz(__rbit64((-1 << v12) & ~*(void *)(v7 + 56 + 8 * (v12 >> 6)))) | v12 & 0x7FFFFFFFFFFFFFC0;
          }
          else
          {
            char v15 = 0;
            unint64_t v16 = (unint64_t)(63 - v11) >> 6;
            do
            {
              if (++v13 == v16 && (v15 & 1) != 0)
              {
                __break(1u);
                return result;
              }
              BOOL v17 = v13 == v16;
              if (v13 == v16) {
                unint64_t v13 = 0;
              }
              v15 |= v17;
              uint64_t v18 = *(void *)(v10 + 8 * v13);
            }
            while (v18 == -1);
            unint64_t v14 = __clz(__rbit64(~v18)) + (v13 << 6);
          }
          *(void *)(v10 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
          *(void *)(*(void *)(v7 + 48) + 8 * v14) = v23;
          ++*(void *)(v7 + 16);
        }
      }
      while (__CocoaSet.Iterator.next()());
      uint64_t v6 = v24;
      uint64_t v2 = v22;
    }
    swift_release();
  }
  else
  {
    uint64_t v6 = specialized _NativeSet.filter(_:)(v5);
  }
  id v19 = a1;
  swift_retain();
  specialized Sequence.compactMap<A>(_:)(v6, v19, v2);
  uint64_t v21 = v20;
  swift_release();

  swift_release();
  return v21;
}

{
  uint64_t v1;
  uint64_t v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  Swift::Int result;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;

  uint64_t v2 = v1;
  id v4 = objc_msgSend(a1, sel_activitySessions);
  type metadata accessor for TUConversationActivitySession();
  _s10Foundation4UUIDVACSHAAWlTm_5(&lazy protocol witness table cache variable for type TUConversationActivitySession and conformance NSObject, (void (*)(uint64_t))type metadata accessor for TUConversationActivitySession);
  uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v5 & 0xC000000000000001) != 0)
  {
    uint64_t v6 = MEMORY[0x1E4FBC870];
    uint64_t v24 = MEMORY[0x1E4FBC870];
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      uint64_t v22 = v2;
      do
      {
        swift_dynamicCast();
        if (objc_msgSend(v23, sel_state) && objc_msgSend(v23, sel_state) != (id)1)
        {
        }
        else
        {
          uint64_t v7 = v24;
          unint64_t v8 = *(void *)(v24 + 16);
          if (*(void *)(v24 + 24) <= v8)
          {
            specialized _NativeSet.resize(capacity:)(v8 + 1);
            uint64_t v7 = v24;
          }
          Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v7 + 40));
          uint64_t v10 = v7 + 56;
          uint64_t v11 = -1 << *(unsigned char *)(v7 + 32);
          unint64_t v12 = result & ~v11;
          unint64_t v13 = v12 >> 6;
          if (((-1 << v12) & ~*(void *)(v7 + 56 + 8 * (v12 >> 6))) != 0)
          {
            unint64_t v14 = __clz(__rbit64((-1 << v12) & ~*(void *)(v7 + 56 + 8 * (v12 >> 6)))) | v12 & 0x7FFFFFFFFFFFFFC0;
          }
          else
          {
            char v15 = 0;
            unint64_t v16 = (unint64_t)(63 - v11) >> 6;
            do
            {
              if (++v13 == v16 && (v15 & 1) != 0)
              {
                __break(1u);
                return result;
              }
              BOOL v17 = v13 == v16;
              if (v13 == v16) {
                unint64_t v13 = 0;
              }
              v15 |= v17;
              uint64_t v18 = *(void *)(v10 + 8 * v13);
            }
            while (v18 == -1);
            unint64_t v14 = __clz(__rbit64(~v18)) + (v13 << 6);
          }
          *(void *)(v10 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
          *(void *)(*(void *)(v7 + 48) + 8 * v14) = v23;
          ++*(void *)(v7 + 16);
        }
      }
      while (__CocoaSet.Iterator.next()());
      uint64_t v6 = v24;
      uint64_t v2 = v22;
    }
    swift_release();
  }
  else
  {
    uint64_t v6 = specialized _NativeSet.filter(_:)(v5);
  }
  id v19 = a1;
  swift_retain();
  specialized Sequence.compactMap<A>(_:)(v6, v19, v2);
  uint64_t v21 = v20;
  swift_release();

  swift_release();
  return v21;
}

BOOL static Conversation.State.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void Conversation.State.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int Conversation.State.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t Conversation.id.getter@<X0>(uint64_t a1@<X8>)
{
  return Conversation.id.getter(&OBJC_IVAR____TtC15GroupActivities12Conversation_id, a1);
}

void *key path getter for Conversation.state : Conversation@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  Swift::Int result = (*(void *(**)(uint64_t *__return_ptr))(**(void **)a1 + 152))(&v4);
  *a2 = v4;
  return result;
}

uint64_t key path setter for Conversation.state : Conversation()
{
  return static Published.subscript.setter();
}

uint64_t Conversation.state.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();

  return swift_release();
}

uint64_t Conversation.$state.getter()
{
  return Conversation.$state.getter((uint64_t)&OBJC_IVAR____TtC15GroupActivities12Conversation__state, &demangling cache variable for type metadata for Published<Conversation.State>);
}

uint64_t key path setter for Conversation.id : Conversation(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  uint64_t v12 = *a2 + *a5;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v12, v11, v8);
  return swift_endAccess();
}

uint64_t Conversation.groupUUID.getter@<X0>(uint64_t a1@<X8>)
{
  return Conversation.id.getter(&OBJC_IVAR____TtC15GroupActivities12Conversation_groupUUID, a1);
}

uint64_t Conversation.id.getter@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *a1;
  swift_beginAccess();
  uint64_t v5 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t key path getter for Conversation.activeParticipants : Conversation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 224))();
  *a2 = result;
  return result;
}

uint64_t key path setter for Conversation.activeParticipants : Conversation()
{
  return key path setter for Conversation.activeParticipants : Conversation();
}

{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return static Published.subscript.setter();
}

uint64_t Conversation.activeParticipants.getter()
{
  return Conversation.activeParticipants.getter();
}

{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t Conversation.$activeParticipants.getter()
{
  return Conversation.$state.getter((uint64_t)&OBJC_IVAR____TtC15GroupActivities12Conversation__activeParticipants, &demangling cache variable for type metadata for Published<Set<Participant>>);
}

uint64_t key path getter for Conversation.localParticipantIdentifier : Conversation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 272))();
  *a2 = result;
  return result;
}

uint64_t key path setter for Conversation.localParticipantIdentifier : Conversation()
{
  return static Published.subscript.setter();
}

uint64_t Conversation.localParticipantIdentifier.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t Conversation.$localParticipantIdentifier.getter()
{
  return Conversation.$state.getter((uint64_t)&OBJC_IVAR____TtC15GroupActivities12Conversation__localParticipantIdentifier, &demangling cache variable for type metadata for Published<UInt64>);
}

uint64_t key path getter for Conversation.activitySessions : Conversation@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 320))();
  *a2 = result;
  return result;
}

uint64_t key path setter for Conversation.activitySessions : Conversation()
{
  return key path setter for Conversation.activeParticipants : Conversation();
}

uint64_t Conversation.activitySessions.getter()
{
  return Conversation.activeParticipants.getter();
}

uint64_t key path setter for Conversation.$state : Conversation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  unint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  char v15 = (char *)&v18 - v14;
  unint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  Published.projectedValue.setter();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t Conversation.$activitySessions.getter()
{
  return Conversation.$state.getter((uint64_t)&OBJC_IVAR____TtC15GroupActivities12Conversation__activitySessions, &demangling cache variable for type metadata for Published<[GroupSession<AnyGroupActivity>]>);
}

uint64_t Conversation.$state.getter(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t Conversation.__allocating_init(identifier:groupUUID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  Conversation.init(identifier:groupUUID:)(a1, a2);
  return v4;
}

uint64_t Conversation.init(identifier:groupUUID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[GroupSession<AnyGroupActivity>]>);
  uint64_t v28 = *(void *)(v3 - 8);
  uint64_t v29 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v27 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UInt64>);
  uint64_t v5 = *(void *)(v26 - 8);
  MEMORY[0x1F4188790](v26);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Set<Participant>>);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Conversation.State>);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12);
  char v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = v2 + OBJC_IVAR____TtC15GroupActivities12Conversation__state;
  LOBYTE(v32) = 0;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v16, v15, v12);
  uint64_t v17 = v2 + OBJC_IVAR____TtC15GroupActivities12Conversation__activeParticipants;
  uint64_t v32 = MEMORY[0x1E4FBC870];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Set<Participant>);
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v17, v11, v8);
  uint64_t v18 = v2 + OBJC_IVAR____TtC15GroupActivities12Conversation__localParticipantIdentifier;
  uint64_t v32 = 0;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v18, v7, v26);
  uint64_t v19 = v2 + OBJC_IVAR____TtC15GroupActivities12Conversation__activitySessions;
  uint64_t v32 = MEMORY[0x1E4FBC860];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GroupSession<AnyGroupActivity>]);
  uint64_t v20 = v27;
  Published.init(initialValue:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v19, v20, v29);
  uint64_t v21 = v2 + OBJC_IVAR____TtC15GroupActivities12Conversation_id;
  uint64_t v22 = type metadata accessor for UUID();
  id v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 32);
  v23(v21, v30, v22);
  v23(v2 + OBJC_IVAR____TtC15GroupActivities12Conversation_groupUUID, v31, v22);
  return v2;
}

uint64_t Conversation.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15GroupActivities12Conversation_id;
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC15GroupActivities12Conversation__state;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Conversation.State>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  v3(v0 + OBJC_IVAR____TtC15GroupActivities12Conversation_groupUUID, v2);
  uint64_t v6 = v0 + OBJC_IVAR____TtC15GroupActivities12Conversation__activeParticipants;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Set<Participant>>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v0 + OBJC_IVAR____TtC15GroupActivities12Conversation__localParticipantIdentifier;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UInt64>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = v0 + OBJC_IVAR____TtC15GroupActivities12Conversation__activitySessions;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[GroupSession<AnyGroupActivity>]>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  return v0;
}

uint64_t Conversation.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15GroupActivities12Conversation_id;
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  uint64_t v4 = v0 + OBJC_IVAR____TtC15GroupActivities12Conversation__state;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Conversation.State>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  v3(v0 + OBJC_IVAR____TtC15GroupActivities12Conversation_groupUUID, v2);
  uint64_t v6 = v0 + OBJC_IVAR____TtC15GroupActivities12Conversation__activeParticipants;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Set<Participant>>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = v0 + OBJC_IVAR____TtC15GroupActivities12Conversation__localParticipantIdentifier;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<UInt64>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = v0 + OBJC_IVAR____TtC15GroupActivities12Conversation__activitySessions;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[GroupSession<AnyGroupActivity>]>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);

  return swift_deallocClassInstance();
}

uint64_t protocol witness for Identifiable.id.getter in conformance Conversation()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 128))();
}

uint64_t Conversation.addActivitySession(newSession:)()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  uint64_t v0 = (void (*)(uint64_t *, void))static Published.subscript.modify();
  uint64_t v2 = v1;
  MEMORY[0x1A624E0F0]();
  if (*(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  v0(&v4, 0);
  swift_release();
  return swift_release();
}

unint64_t Conversation.State.init(tuConversationState:)@<X0>(unint64_t result@<X0>, unsigned char *a2@<X8>)
{
  if (result >= 5) {
    char v2 = 0;
  }
  else {
    char v2 = result;
  }
  *a2 = v2;
  return result;
}

uint64_t Conversation.update(with:)(void *a1)
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  specialized InternalGroupSessionProvider.groupSessions(for:)(a1);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return static Published.subscript.setter();
}

void *sub_1A38DD5EC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(**(void **)a1 + 152))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_1A38DD64C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 224))();
  *a2 = result;
  return result;
}

uint64_t sub_1A38DD69C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 272))();
  *a2 = result;
  return result;
}

uint64_t sub_1A38DD6F4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 320))();
  *a2 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Conversation.State and conformance Conversation.State()
{
  unint64_t result = lazy protocol witness table cache variable for type Conversation.State and conformance Conversation.State;
  if (!lazy protocol witness table cache variable for type Conversation.State and conformance Conversation.State)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Conversation.State and conformance Conversation.State);
  }
  return result;
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in Conversation()
{
  return _s10Foundation4UUIDVACSHAAWlTm_5((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E4F27990]);
}

uint64_t sub_1A38DD7EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 128))();
}

uint64_t sub_1A38DD830(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return key path setter for Conversation.id : Conversation(a1, a2, a3, a4, &OBJC_IVAR____TtC15GroupActivities12Conversation_id);
}

uint64_t sub_1A38DD850(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 176))();
}

uint64_t sub_1A38DD894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for Conversation.$state : Conversation(a1, a2, a3, a4, &demangling cache variable for type metadata for Published<Conversation.State>.Publisher, (uint64_t)&OBJC_IVAR____TtC15GroupActivities12Conversation__state, &demangling cache variable for type metadata for Published<Conversation.State>);
}

uint64_t sub_1A38DD8C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 200))();
}

uint64_t sub_1A38DD908(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return key path setter for Conversation.id : Conversation(a1, a2, a3, a4, &OBJC_IVAR____TtC15GroupActivities12Conversation_groupUUID);
}

uint64_t sub_1A38DD928(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 248))();
}

uint64_t sub_1A38DD96C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for Conversation.$state : Conversation(a1, a2, a3, a4, &demangling cache variable for type metadata for Published<Set<Participant>>.Publisher, (uint64_t)&OBJC_IVAR____TtC15GroupActivities12Conversation__activeParticipants, &demangling cache variable for type metadata for Published<Set<Participant>>);
}

uint64_t sub_1A38DD99C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 296))();
}

uint64_t sub_1A38DD9E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for Conversation.$state : Conversation(a1, a2, a3, a4, &demangling cache variable for type metadata for Published<UInt64>.Publisher, (uint64_t)&OBJC_IVAR____TtC15GroupActivities12Conversation__localParticipantIdentifier, &demangling cache variable for type metadata for Published<UInt64>);
}

uint64_t sub_1A38DDA18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 344))();
}

uint64_t sub_1A38DDA64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for Conversation.$state : Conversation(a1, a2, a3, a4, &demangling cache variable for type metadata for Published<[GroupSession<AnyGroupActivity>]>.Publisher, (uint64_t)&OBJC_IVAR____TtC15GroupActivities12Conversation__activitySessions, &demangling cache variable for type metadata for Published<[GroupSession<AnyGroupActivity>]>);
}

uint64_t ObjC metadata update function for Conversation()
{
  return type metadata accessor for Conversation();
}

uint64_t method lookup function for Conversation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Conversation);
}

uint64_t dispatch thunk of Conversation.id.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of Conversation.state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of Conversation.$state.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of Conversation.groupUUID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of Conversation.activeParticipants.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of Conversation.$activeParticipants.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of Conversation.localParticipantIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of Conversation.$localParticipantIdentifier.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of Conversation.activitySessions.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of Conversation.$activitySessions.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of Conversation.__allocating_init(identifier:groupUUID:)()
{
  return (*(uint64_t (**)(void))(v0 + 368))();
}

unsigned char *storeEnumTagSinglePayload for Conversation.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 4;
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
        JUMPOUT(0x1A38DDD1CLL);
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
          void *result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Conversation.State()
{
  return &type metadata for Conversation.State;
}

void specialized Sequence.compactMap<A>(_:)(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned int v4 = v3;
  uint64_t v51 = a3;
  id v56 = a2;
  uint64_t v6 = type metadata accessor for UUID();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v55 = (uint64_t)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = MEMORY[0x1E4FBC860];
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for TUConversationActivitySession();
    _s10Foundation4UUIDVACSHAAWlTm_5(&lazy protocol witness table cache variable for type TUConversationActivitySession and conformance NSObject, (void (*)(uint64_t))type metadata accessor for TUConversationActivitySession);
    Set.Iterator.init(_cocoa:)();
    a1 = v58[5];
    uint64_t v49 = v58[6];
    uint64_t v8 = v58[7];
    int64_t v9 = v58[8];
    unint64_t v10 = v58[9];
  }
  else
  {
    uint64_t v11 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v49 = a1 + 56;
    uint64_t v13 = ~v11;
    uint64_t v14 = -v11;
    if (v14 < 64) {
      uint64_t v15 = ~(-1 << v14);
    }
    else {
      uint64_t v15 = -1;
    }
    unint64_t v10 = v15 & v12;
    swift_bridgeObjectRetain();
    uint64_t v8 = v13;
    int64_t v9 = 0;
  }
  uint64_t v47 = a1 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v45 = v8;
  int64_t v48 = (unint64_t)(v8 + 64) >> 6;
  uint64_t v46 = MEMORY[0x1E4FBC838] + 8;
  uint64_t v50 = a1;
  while (a1 < 0)
  {
    uint64_t v19 = __CocoaSet.Iterator.next()();
    if (!v19) {
      goto LABEL_44;
    }
    uint64_t v57 = v19;
    type metadata accessor for TUConversationActivitySession();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v20 = (id)v58[0];
    swift_unknownObjectRelease();
    int64_t v18 = v9;
    uint64_t v16 = v10;
    if (!v20) {
      goto LABEL_44;
    }
LABEL_28:
    id v23 = v56;
    id v24 = objc_msgSend(v56, sel_groupUUID, v45, v46, v47);
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    id v25 = objc_msgSend(v23, sel_initiator);
    if (v25)
    {
      uint64_t v26 = v25;
      id v27 = objc_msgSend(v25, sel_value);

      uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v29 = v28;
    }
    else
    {
      uint64_t v52 = 0;
      uint64_t v29 = 0xE000000000000000;
    }
    id v30 = v56;
    id v31 = objc_msgSend(v56, sel_localParticipantIdentifier);
    id v32 = objc_msgSend(v30, sel_localMember);
    unint64_t v53 = v16;
    int64_t v54 = v18;
    if (v32)
    {
      uint64_t v33 = v32;
      id v34 = v4;
      id v35 = objc_msgSend(v32, sel_handle);

      id v36 = objc_msgSend(v35, sel_value);
      uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v39 = v38;
    }
    else
    {
      id v34 = v4;
      uint64_t v37 = 0;
      uint64_t v39 = 0xE000000000000000;
    }
    id v40 = objc_msgSend(v56, sel_unreliableMessengerConfig);
    uint64_t v41 = v51;
    uint64_t v42 = (*(uint64_t (**)(void))(*(void *)v51 + 216))();
    (*(void (**)(void *__return_ptr))(*(void *)v41 + 240))(v58);
    id v43 = v20;
    specialized GroupSession<>.init(tuConversationActivitySession:groupUUID:initiatorHandle:localParticipantIdentifier:localParticipantHandle:unreliableMessengerConfig:topicManager:audioSessionAssertionManager:)(v43, v55, v52, v29, (uint64_t)v31, v37, v39, v40, v42, (uint64_t)v58);
    unsigned int v4 = v34;
    if (v34)
    {

      unsigned int v4 = 0;
    }
    else
    {

      MEMORY[0x1A624E0F0]();
      if (*(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
    }
    unint64_t v10 = v53;
    int64_t v9 = v54;
    a1 = v50;
  }
  if (v10)
  {
    uint64_t v16 = (v10 - 1) & v10;
    unint64_t v17 = __clz(__rbit64(v10)) | (v9 << 6);
    int64_t v18 = v9;
LABEL_27:
    id v20 = *(id *)(*(void *)(a1 + 48) + 8 * v17);
    if (!v20) {
      goto LABEL_44;
    }
    goto LABEL_28;
  }
  int64_t v18 = v9 + 1;
  if (!__OFADD__(v9, 1))
  {
    if (v18 >= v48) {
      goto LABEL_44;
    }
    unint64_t v21 = *(void *)(v49 + 8 * v18);
    if (!v21)
    {
      int64_t v22 = v9 + 2;
      if (v9 + 2 >= v48) {
        goto LABEL_44;
      }
      unint64_t v21 = *(void *)(v49 + 8 * v22);
      if (v21) {
        goto LABEL_25;
      }
      int64_t v22 = v9 + 3;
      if (v9 + 3 >= v48) {
        goto LABEL_44;
      }
      unint64_t v21 = *(void *)(v49 + 8 * v22);
      if (v21) {
        goto LABEL_25;
      }
      int64_t v22 = v9 + 4;
      if (v9 + 4 >= v48) {
        goto LABEL_44;
      }
      unint64_t v21 = *(void *)(v49 + 8 * v22);
      if (v21)
      {
LABEL_25:
        int64_t v18 = v22;
      }
      else
      {
        int64_t v18 = v9 + 5;
        if (v9 + 5 >= v48) {
          goto LABEL_44;
        }
        unint64_t v21 = *(void *)(v49 + 8 * v18);
        if (!v21)
        {
          int64_t v44 = v9 + 6;
          while (v48 != v44)
          {
            unint64_t v21 = *(void *)(v49 + 8 * v44++);
            if (v21)
            {
              int64_t v18 = v44 - 1;
              goto LABEL_26;
            }
          }
LABEL_44:
          outlined consume of [AnyHashable : Any].Iterator._Variant();
          return;
        }
      }
    }
LABEL_26:
    uint64_t v16 = (v21 - 1) & v21;
    unint64_t v17 = __clz(__rbit64(v21)) + (v18 << 6);
    goto LABEL_27;
  }
  __break(1u);
}

{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  int64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  int64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  void v58[11];
  uint64_t v59;

  unsigned int v4 = v3;
  uint64_t v52 = a3;
  id v56 = a2;
  uint64_t v6 = type metadata accessor for UUID();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v55 = (uint64_t)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = MEMORY[0x1E4FBC860];
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for TUConversationActivitySession();
    _s10Foundation4UUIDVACSHAAWlTm_5(&lazy protocol witness table cache variable for type TUConversationActivitySession and conformance NSObject, (void (*)(uint64_t))type metadata accessor for TUConversationActivitySession);
    Set.Iterator.init(_cocoa:)();
    a1 = v58[5];
    uint64_t v49 = v58[6];
    uint64_t v8 = v58[7];
    int64_t v9 = v58[8];
    unint64_t v10 = v58[9];
  }
  else
  {
    uint64_t v11 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v49 = a1 + 56;
    uint64_t v13 = ~v11;
    uint64_t v14 = -v11;
    if (v14 < 64) {
      uint64_t v15 = ~(-1 << v14);
    }
    else {
      uint64_t v15 = -1;
    }
    unint64_t v10 = v15 & v12;
    swift_bridgeObjectRetain();
    uint64_t v8 = v13;
    int64_t v9 = 0;
  }
  uint64_t v47 = a1 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v45 = v8;
  int64_t v48 = (unint64_t)(v8 + 64) >> 6;
  uint64_t v51 = v52 + 160;
  uint64_t v46 = MEMORY[0x1E4FBC838] + 8;
  uint64_t v50 = a1;
  while (a1 < 0)
  {
    uint64_t v19 = __CocoaSet.Iterator.next()();
    if (!v19) {
      goto LABEL_44;
    }
    uint64_t v57 = v19;
    type metadata accessor for TUConversationActivitySession();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v20 = (id)v58[0];
    swift_unknownObjectRelease();
    int64_t v18 = v9;
    uint64_t v16 = v10;
    if (!v20) {
      goto LABEL_44;
    }
LABEL_28:
    id v23 = v20;
    id v24 = v56;
    id v25 = objc_msgSend(v56, sel_groupUUID, v45, v46, v47);
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v26 = objc_msgSend(v24, sel_initiator);
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = objc_msgSend(v26, sel_value);

      uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v31 = v30;
    }
    else
    {
      uint64_t v29 = 0;
      id v31 = 0xE000000000000000;
    }
    id v32 = v56;
    uint64_t v33 = objc_msgSend(v56, sel_localParticipantIdentifier);
    id v34 = objc_msgSend(v32, sel_localMember);
    unint64_t v53 = v16;
    int64_t v54 = v18;
    if (v34)
    {
      id v35 = v34;
      id v36 = v4;
      uint64_t v37 = objc_msgSend(v34, sel_handle);

      uint64_t v38 = objc_msgSend(v37, sel_value);
      uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v41 = v40;
    }
    else
    {
      id v36 = v4;
      uint64_t v39 = 0;
      uint64_t v41 = 0xE000000000000000;
    }
    uint64_t v42 = objc_msgSend(v56, sel_unreliableMessengerConfig);
    id v43 = BackgroundGroupSessionManager.topicManager.getter();
    outlined init with copy of AudioSessionAssertionManager(v51, (uint64_t)v58);
    specialized GroupSession<>.init(tuConversationActivitySession:groupUUID:initiatorHandle:localParticipantIdentifier:localParticipantHandle:unreliableMessengerConfig:topicManager:audioSessionAssertionManager:)(v23, v55, v29, v31, (uint64_t)v33, v39, v41, v42, v43, (uint64_t)v58);
    unsigned int v4 = v36;
    if (v36)
    {

      unsigned int v4 = 0;
    }
    else
    {

      MEMORY[0x1A624E0F0]();
      if (*(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
    }
    unint64_t v10 = v53;
    int64_t v9 = v54;
    a1 = v50;
  }
  if (v10)
  {
    uint64_t v16 = (v10 - 1) & v10;
    unint64_t v17 = __clz(__rbit64(v10)) | (v9 << 6);
    int64_t v18 = v9;
LABEL_27:
    id v20 = *(id *)(*(void *)(a1 + 48) + 8 * v17);
    if (!v20) {
      goto LABEL_44;
    }
    goto LABEL_28;
  }
  int64_t v18 = v9 + 1;
  if (!__OFADD__(v9, 1))
  {
    if (v18 >= v48) {
      goto LABEL_44;
    }
    unint64_t v21 = *(void *)(v49 + 8 * v18);
    if (!v21)
    {
      int64_t v22 = v9 + 2;
      if (v9 + 2 >= v48) {
        goto LABEL_44;
      }
      unint64_t v21 = *(void *)(v49 + 8 * v22);
      if (v21) {
        goto LABEL_25;
      }
      int64_t v22 = v9 + 3;
      if (v9 + 3 >= v48) {
        goto LABEL_44;
      }
      unint64_t v21 = *(void *)(v49 + 8 * v22);
      if (v21) {
        goto LABEL_25;
      }
      int64_t v22 = v9 + 4;
      if (v9 + 4 >= v48) {
        goto LABEL_44;
      }
      unint64_t v21 = *(void *)(v49 + 8 * v22);
      if (v21)
      {
LABEL_25:
        int64_t v18 = v22;
      }
      else
      {
        int64_t v18 = v9 + 5;
        if (v9 + 5 >= v48) {
          goto LABEL_44;
        }
        unint64_t v21 = *(void *)(v49 + 8 * v18);
        if (!v21)
        {
          int64_t v44 = v9 + 6;
          while (v48 != v44)
          {
            unint64_t v21 = *(void *)(v49 + 8 * v44++);
            if (v21)
            {
              int64_t v18 = v44 - 1;
              goto LABEL_26;
            }
          }
LABEL_44:
          outlined consume of [AnyHashable : Any].Iterator._Variant();
          return;
        }
      }
    }
LABEL_26:
    uint64_t v16 = (v21 - 1) & v21;
    unint64_t v17 = __clz(__rbit64(v21)) + (v18 << 6);
    goto LABEL_27;
  }
  __break(1u);
}

unint64_t static URLActivity.activityIdentifier.getter()
{
  return 0xD000000000000028;
}

uint64_t URLActivity.webpageURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for URL();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t URLActivity.webpageURL.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for URL();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*URLActivity.webpageURL.modify())(void, void, void)
{
  return destructiveProjectEnumData for GroupSessionErrors;
}

uint64_t URLActivity.metadata.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for generic != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for GroupActivityMetadata.ActivityType(0);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)static GroupActivityMetadata.ActivityType.generic);
  _s15GroupActivities0A16ActivityMetadataV0C4TypeVWOcTm_0(v4, a1, type metadata accessor for GroupActivityMetadata.ActivityType);
  uint64_t v5 = (int *)type metadata accessor for GroupActivityMetadata(0);
  uint64_t v6 = (void *)(a1 + v5[5]);
  void *v6 = 0;
  v6[1] = 0;
  uint64_t v7 = (void *)(a1 + v5[6]);
  *uint64_t v7 = 0;
  v7[1] = 0;
  *(void *)(a1 + v5[7]) = 0;
  uint64_t v8 = a1 + v5[8];
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
  v16(v8, 1, 1, v9);
  *(void *)(a1 + v5[9]) = 0;
  *(unsigned char *)(a1 + v5[10]) = dyld_program_sdk_at_least() ^ 1;
  v16(a1 + v5[11], 1, 1, v9);
  uint64_t v11 = v5[12];
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v12 = a1 + v11;
  uint64_t v13 = qword_1EB58E160;
  uint64_t v14 = qword_1EB58E178;
  *(unsigned char *)uint64_t v12 = static SceneAssociationBehavior.default;
  *(void *)(v12 + 8) = v13;
  *(_OWORD *)(v12 + 16) = xmmword_1EB58E168;
  *(void *)(v12 + 32) = v14;
  *(unsigned char *)(a1 + v5[13]) = 0;
  *(void *)(a1 + v5[14]) = 2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined destroy of URL?(v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v1, v9);

  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v16)(v8, 0, 1, v9);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance URLActivity.CodingKeys()
{
  return 0x5565676170626577;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance URLActivity.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x5565676170626577 && a2 == 0xEA00000000004C52)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance URLActivity.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance URLActivity.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t URLActivity.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<URLActivity.CodingKeys>);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  type metadata accessor for URL();
  lazy protocol witness table accessor for type URL and conformance URL(&lazy protocol witness table cache variable for type URL and conformance URL, MEMORY[0x1E4F276F0]);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t URLActivity.init(webpageURL:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for URL();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);

  return v5(a2, a1, v4);
}

unint64_t protocol witness for static GroupActivity.activityIdentifier.getter in conformance URLActivity()
{
  return 0xD000000000000028;
}

uint64_t protocol witness for GroupActivity.metadata.getter in conformance URLActivity(uint64_t a1)
{
  URLActivity.metadata.getter(a1);
  uint64_t v2 = *(uint64_t (**)(void))(v1 + 8);
  return protocol witness for GroupActivity.metadata.getter in conformance CollaborationActivity(v2);
}

uint64_t static URLActivity._identifiable(by:)()
{
  return 1;
}

uint64_t protocol witness for Decodable.init(from:) in conformance URLActivity(void *a1)
{
  return URLActivity.init(from:)(a1);
}

uint64_t URLActivity.init(from:)(void *a1)
{
  uint64_t v2 = type metadata accessor for DecodingError();
  swift_allocError();
  uint64_t v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
  *uint64_t v4 = type metadata accessor for URLActivity();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Decoder.codingPath.getter();
  _StringGuts.grow(_:)(50);
  swift_bridgeObjectRelease();
  DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v2 - 8) + 104))(v4, *MEMORY[0x1E4FBBA80], v2);
  swift_willThrow();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance URLActivity(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<URLActivity.CodingKeys>);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  type metadata accessor for URL();
  lazy protocol witness table accessor for type URL and conformance URL(&lazy protocol witness table cache variable for type URL and conformance URL, MEMORY[0x1E4F276F0]);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t URLActivity.init(activity:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x1F4188790](v3 - 8);
  char v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for AnyGroupActivity.MetadataProvider(0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for GroupActivityMetadata(0);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for AnyGroupActivity(0);
  _s15GroupActivities0A16ActivityMetadataV0C4TypeVWOcTm_0(a1 + *(int *)(v16 + 20), (uint64_t)v12, type metadata accessor for AnyGroupActivity.MetadataProvider);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    _s15GroupActivities03AnyA8ActivityV16MetadataProviderOWOhTm_0((uint64_t)v12, type metadata accessor for AnyGroupActivity.MetadataProvider);
    uint64_t v17 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *uint64_t v19 = v13;
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x1E4FBBA80], v17);
    swift_willThrow();
    id v20 = type metadata accessor for AnyGroupActivity;
    uint64_t v21 = a1;
    return _s15GroupActivities03AnyA8ActivityV16MetadataProviderOWOhTm_0(v21, v20);
  }
  outlined init with take of GroupActivityMetadata((uint64_t)v12, (uint64_t)v15);
  outlined init with copy of URL?((uint64_t)&v15[*(int *)(v13 + 32)], (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    outlined destroy of URL?((uint64_t)v5);
    uint64_t v22 = type metadata accessor for DecodingError();
    swift_allocError();
    id v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *id v24 = v6;
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x1E4FBBA80], v22);
    swift_willThrow();
    _s15GroupActivities03AnyA8ActivityV16MetadataProviderOWOhTm_0(a1, type metadata accessor for AnyGroupActivity);
    id v20 = type metadata accessor for GroupActivityMetadata;
    uint64_t v21 = (uint64_t)v15;
    return _s15GroupActivities03AnyA8ActivityV16MetadataProviderOWOhTm_0(v21, v20);
  }
  _s15GroupActivities03AnyA8ActivityV16MetadataProviderOWOhTm_0(a1, type metadata accessor for AnyGroupActivity);
  _s15GroupActivities03AnyA8ActivityV16MetadataProviderOWOhTm_0((uint64_t)v15, type metadata accessor for GroupActivityMetadata);
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v26(v9, v5, v6);
  return ((uint64_t (*)(uint64_t, char *, uint64_t))v26)(v28, v9, v6);
}

uint64_t protocol witness for CustomGroupActivityDecodable.init(activity:) in conformance URLActivity@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return URLActivity.init(activity:)(a1, a2);
}

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys;
  if (!lazy protocol witness table cache variable for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys;
  if (!lazy protocol witness table cache variable for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys;
  if (!lazy protocol witness table cache variable for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys;
  if (!lazy protocol witness table cache variable for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type URLActivity.CodingKeys and conformance URLActivity.CodingKeys);
  }
  return result;
}

uint64_t type metadata accessor for URLActivity()
{
  uint64_t result = type metadata singleton initialization cache for URLActivity;
  if (!type metadata singleton initialization cache for URLActivity) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t _s15GroupActivities0A16ActivityMetadataV0C4TypeVWOcTm_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t _s15GroupActivities03AnyA8ActivityV16MetadataProviderOWOhTm_0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t instantiation function for generic protocol witness table for URLActivity(uint64_t a1)
{
  *(void *)(a1 + 8) = lazy protocol witness table accessor for type URL and conformance URL(&lazy protocol witness table cache variable for type URLActivity and conformance URLActivity, (void (*)(uint64_t))type metadata accessor for URLActivity);
  uint64_t result = lazy protocol witness table accessor for type URL and conformance URL(&lazy protocol witness table cache variable for type URLActivity and conformance URLActivity, (void (*)(uint64_t))type metadata accessor for URLActivity);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t lazy protocol witness table accessor for type URL and conformance URL(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t initializeBufferWithCopyOfBuffer for URLActivity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for URLActivity(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for URLActivity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for URLActivity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for URLActivity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for URLActivity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for URLActivity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A38DFC24);
}

uint64_t sub_1A38DFC24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for URLActivity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A38DFCA4);
}

uint64_t sub_1A38DFCA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata completion function for URLActivity()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for URLActivity.CodingKeys(unsigned char *result, int a2, int a3)
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
        void *result = a2;
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
      void *result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1A38DFE3CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void *type metadata accessor for URLActivity.CodingKeys()
{
  return &unk_1EF719CD8;
}

uint64_t Log.systemCoordinator.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for systemCoordinator, (uint64_t)static Log.systemCoordinator);
}

uint64_t >> prefix<A>(_:)(uint64_t a1, uint64_t a2)
{
  v4[2] = a2;
  type metadata accessor for Optional();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in >> prefix<A>(_:), (uint64_t)v4, MEMORY[0x1E4FBC248], MEMORY[0x1E4FBB1A0], v2, (uint64_t)v5);
  if (v5[1]) {
    return v5[0];
  }
  else {
    return 7104878;
  }
}

uint64_t Log.default.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for default, (uint64_t)static Log.default);
}

uint64_t Logger.runtimeIssues.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for runtimeIssues, (uint64_t)static Logger.runtimeIssues);
}

uint64_t Logger.client.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for client, (uint64_t)static Logger.client);
}

uint64_t Logger.playback.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for playback, (uint64_t)static Logger.playback);
}

uint64_t Log.groupSessionProviderObserver.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for groupSessionProviderObserver, (uint64_t)static Log.groupSessionProviderObserver);
}

uint64_t Log.groupSessionProvider.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for groupSessionProvider, (uint64_t)static Log.groupSessionProvider);
}

uint64_t Log.personalGroupSessionProvider.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for personalGroupSessionProvider, (uint64_t)static Log.personalGroupSessionProvider);
}

uint64_t Log.attachmentLedgerTopic.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for attachmentLedgerTopic, (uint64_t)static Log.attachmentLedgerTopic);
}

uint64_t Log.ledger.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for ledger, (uint64_t)static Log.ledger);
}

uint64_t _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v25 = a5;
  uint64_t v26 = a2;
  uint64_t v28 = a4;
  uint64_t v27 = a1;
  uint64_t v24 = *(void *)(a3 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v10);
  int64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  id v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v6);
  uint64_t v22 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    v27(v18, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (v7) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v24 + 32))(v25, v12, a3);
    }
    uint64_t v22 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(a6, v22, 1);
}

uint64_t Log.presenceSession.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for presenceSession, (uint64_t)static Log.presenceSession);
}

uint64_t Log.ckShareGroupSessionProvider.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for ckShareGroupSessionProvider, (uint64_t)static Log.ckShareGroupSessionProvider);
}

uint64_t Log.shareChangeObserver.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for shareChangeObserver, (uint64_t)static Log.shareChangeObserver);
}

uint64_t Log.downloadTask.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for downloadTask, (uint64_t)static Log.downloadTask);
}

uint64_t Log.topicManager.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for topicManager, (uint64_t)static Log.topicManager);
}

uint64_t String.init<A>(describing:in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x1F4188790](a1);
  uint64_t v26 = v8;
  *(void *)&long long v31 = swift_getDynamicType();
  swift_getMetatypeMetadata();
  uint64_t v9 = String.init<A>(describing:)();
  uint64_t v25 = v10;
  *(void *)&long long v31 = a1;
  type metadata accessor for PartialKeyPath();
  uint64_t v11 = type metadata accessor for Array();
  uint64_t WitnessTable = swift_getWitnessTable();
  MEMORY[0x1A624E0A0](&v28, v11, WitnessTable);
  swift_bridgeObjectRelease();
  uint64_t v30 = v28;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a2, a3);
  unint64_t v13 = (*(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v14 = (char *)swift_allocObject();
  *((void *)v14 + 2) = a3;
  *((void *)v14 + 3) = v9;
  uint64_t v15 = v25;
  *((void *)v14 + 4) = v25;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v14[v13], (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
  type metadata accessor for LazySequence();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  LazySequenceProtocol.map<A>(_:)();
  swift_release();
  swift_bridgeObjectRelease();
  long long v24 = v31;
  long long v28 = v31;
  uint64_t v29 = v32;
  type metadata accessor for LazyMapSequence();
  uint64_t v27 = swift_getWitnessTable();
  swift_getWitnessTable();
  uint64_t v16 = BidirectionalCollection<>.joined(separator:)();
  int64_t v18 = v17;
  swift_release();
  swift_bridgeObjectRelease();
  *(void *)&long long v31 = v9;
  *((void *)&v31 + 1) = v15;
  v19._countAndFlagsBits = 40;
  v19._object = (void *)0xE100000000000000;
  String.append(_:)(v19);
  v20._countAndFlagsBits = v16;
  v20._object = v18;
  String.append(_:)(v20);
  swift_bridgeObjectRelease();
  v21._countAndFlagsBits = 41;
  v21._object = (void *)0xE100000000000000;
  String.append(_:)(v21);
  uint64_t v22 = v31;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v26, a3);
  return v22;
}

uint64_t Log.uploadTask.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for uploadTask, (uint64_t)static Log.uploadTask);
}

uint64_t Log.runtimeIssues.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for runtimeIssues, (uint64_t)static Log.runtimeIssues);
}

uint64_t Log.topic.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for topic, (uint64_t)static Log.topic);
}

GroupActivities::Subsystem_optional __swiftcall Subsystem.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Subsystem.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 == 1) {
    v4.value = GroupActivities_Subsystem_runtimeIssues;
  }
  else {
    v4.value = GroupActivities_Subsystem_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

unint64_t Subsystem.rawValue.getter(char a1)
{
  if (a1) {
    return 0xD000000000000018;
  }
  else {
    return 0xD00000000000001ALL;
  }
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Subsystem(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Subsystem()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Subsystem()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Subsystem()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Subsystem@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Subsystem.init(rawValue:), *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance Subsystem(unint64_t *a1@<X8>)
{
  if (*v1) {
    unint64_t v2 = 0xD000000000000018;
  }
  else {
    unint64_t v2 = 0xD00000000000001ALL;
  }
  unint64_t v3 = 0x80000001A38FFB40;
  if (*v1) {
    unint64_t v3 = 0x80000001A38FFB60;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t one-time initialization function for sessionUI()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.sessionUI);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.sessionUI);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.init<A>(subsystem:category:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a1, a4);
}

uint64_t Logger.sessionUI.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for sessionUI, (uint64_t)static Logger.sessionUI);
}

uint64_t static Logger.sessionUI.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for sessionUI, (uint64_t)static Logger.sessionUI, a1);
}

uint64_t one-time initialization function for copmanager()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.copmanager);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.copmanager);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.copmanager.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for copmanager, (uint64_t)static Logger.copmanager);
}

uint64_t static Logger.copmanager.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for copmanager, (uint64_t)static Logger.copmanager, a1);
}

uint64_t one-time initialization function for modelsync()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.modelsync);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.modelsync);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.modelsync.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(one-time initialization token for modelsync, (uint64_t)static Logger.modelsync);
}

uint64_t static Logger.modelsync.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(one-time initialization token for modelsync, (uint64_t)static Logger.modelsync, a1);
}

uint64_t static Logger.client.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for client, (uint64_t)static Logger.client, a1);
}

uint64_t one-time initialization function for playback()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.playback);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.playback);
  return Logger.init(subsystem:category:)();
}

uint64_t static Logger.playback.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for playback, (uint64_t)static Logger.playback, a1);
}

uint64_t one-time initialization function for runtimeIssues(uint64_t a1)
{
  return one-time initialization function for runtimeIssues(a1, static Logger.runtimeIssues);
}

{
  return one-time initialization function for runtimeIssues(a1, static Log.runtimeIssues);
}

uint64_t static Logger.runtimeIssues.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for runtimeIssues, (uint64_t)static Logger.runtimeIssues, a1);
}

uint64_t one-time initialization function for extensionController()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.extensionController);
  __swift_project_value_buffer(v0, (uint64_t)static Log.extensionController);
  return Logger.init(subsystem:category:)();
}

uint64_t Log.extensionController.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(one-time initialization token for extensionController, (uint64_t)static Log.extensionController);
}

uint64_t static Log.extensionController.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(one-time initialization token for extensionController, (uint64_t)static Log.extensionController, a1);
}

uint64_t static Log.default.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for default, (uint64_t)static Log.default, a1);
}

uint64_t one-time initialization function for groupSessionProviderObserver()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.groupSessionProviderObserver);
  __swift_project_value_buffer(v0, (uint64_t)static Log.groupSessionProviderObserver);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.groupSessionProviderObserver.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for groupSessionProviderObserver, (uint64_t)static Log.groupSessionProviderObserver, a1);
}

uint64_t one-time initialization function for groupSessionProvider()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.groupSessionProvider);
  __swift_project_value_buffer(v0, (uint64_t)static Log.groupSessionProvider);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.groupSessionProvider.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for groupSessionProvider, (uint64_t)static Log.groupSessionProvider, a1);
}

uint64_t one-time initialization function for ckShareGroupSessionProvider()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.ckShareGroupSessionProvider);
  __swift_project_value_buffer(v0, (uint64_t)static Log.ckShareGroupSessionProvider);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.ckShareGroupSessionProvider.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for ckShareGroupSessionProvider, (uint64_t)static Log.ckShareGroupSessionProvider, a1);
}

uint64_t one-time initialization function for personalGroupSessionProvider()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.personalGroupSessionProvider);
  __swift_project_value_buffer(v0, (uint64_t)static Log.personalGroupSessionProvider);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.personalGroupSessionProvider.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for personalGroupSessionProvider, (uint64_t)static Log.personalGroupSessionProvider, a1);
}

uint64_t one-time initialization function for shareChangeObserver()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.shareChangeObserver);
  __swift_project_value_buffer(v0, (uint64_t)static Log.shareChangeObserver);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.shareChangeObserver.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for shareChangeObserver, (uint64_t)static Log.shareChangeObserver, a1);
}

uint64_t one-time initialization function for reliableBroadcast()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.reliableBroadcast);
  __swift_project_value_buffer(v0, (uint64_t)static Log.reliableBroadcast);
  return Logger.init(subsystem:category:)();
}

uint64_t Log.reliableBroadcast.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for reliableBroadcast, (uint64_t)static Log.reliableBroadcast);
}

uint64_t static Log.reliableBroadcast.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for reliableBroadcast, (uint64_t)static Log.reliableBroadcast, a1);
}

uint64_t one-time initialization function for topic(uint64_t a1)
{
  return one-time initialization function for topic(a1, static Log.topic);
}

uint64_t static Log.topic.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for topic, (uint64_t)static Log.topic, a1);
}

uint64_t one-time initialization function for attachmentLedgerTopic(uint64_t a1)
{
  return one-time initialization function for topic(a1, static Log.attachmentLedgerTopic);
}

uint64_t static Log.attachmentLedgerTopic.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for attachmentLedgerTopic, (uint64_t)static Log.attachmentLedgerTopic, a1);
}

uint64_t one-time initialization function for topicManager(uint64_t a1)
{
  return one-time initialization function for topic(a1, static Log.topicManager);
}

uint64_t one-time initialization function for topic(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.topicManager.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for topicManager, (uint64_t)static Log.topicManager, a1);
}

uint64_t one-time initialization function for ledger()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.ledger);
  __swift_project_value_buffer(v0, (uint64_t)static Log.ledger);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.ledger.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for ledger, (uint64_t)static Log.ledger, a1);
}

uint64_t one-time initialization function for previews()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.previews);
  __swift_project_value_buffer(v0, (uint64_t)static Log.previews);
  return Logger.init(subsystem:category:)();
}

uint64_t Log.previews.unsafeMutableAddressor()
{
  return Log.systemCoordinator.unsafeMutableAddressor(&one-time initialization token for previews, (uint64_t)static Log.previews);
}

uint64_t Log.systemCoordinator.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Log.previews.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for previews, (uint64_t)static Log.previews, a1);
}

uint64_t one-time initialization function for runtimeIssues(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.runtimeIssues.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for runtimeIssues, (uint64_t)static Log.runtimeIssues, a1);
}

uint64_t one-time initialization function for uploadTask()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.uploadTask);
  __swift_project_value_buffer(v0, (uint64_t)static Log.uploadTask);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.uploadTask.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for uploadTask, (uint64_t)static Log.uploadTask, a1);
}

uint64_t one-time initialization function for downloadTask()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.downloadTask);
  __swift_project_value_buffer(v0, (uint64_t)static Log.downloadTask);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.downloadTask.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for downloadTask, (uint64_t)static Log.downloadTask, a1);
}

uint64_t one-time initialization function for presenceSession()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.presenceSession);
  __swift_project_value_buffer(v0, (uint64_t)static Log.presenceSession);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.presenceSession.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for presenceSession, (uint64_t)static Log.presenceSession, a1);
}

uint64_t one-time initialization function for systemCoordinator()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Log.systemCoordinator);
  __swift_project_value_buffer(v0, (uint64_t)static Log.systemCoordinator);
  return Logger.init(subsystem:category:)();
}

uint64_t static Log.systemCoordinator.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.sessionUI.getter(&one-time initialization token for systemCoordinator, (uint64_t)static Log.systemCoordinator, a1);
}

uint64_t static Logger.sessionUI.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t partial apply for closure #1 in >> prefix<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return closure #1 in >> prefix<A>(_:)(a1, a2);
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2)
{
  v7[2] = a2;
  type metadata accessor for Optional();
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:), (uint64_t)v7, MEMORY[0x1E4FBC248], MEMORY[0x1E4FBB1A0], v2, (uint64_t)&v8);
  if (v9) {
    uint64_t v3 = v8;
  }
  else {
    uint64_t v3 = 7104878;
  }
  if (v9) {
    unint64_t v4 = v9;
  }
  else {
    unint64_t v4 = 0xE300000000000000;
  }
  unint64_t v5 = v4;
  String.append(_:)(*(Swift::String *)&v3);
  return swift_bridgeObjectRelease();
}

uint64_t closure #1 in >> prefix<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  MEMORY[0x1F4188790](a1);
  (*(void (**)(char *))(v4 + 16))((char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = String.init<A>(reflecting:)();
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t Optional.descriptionOfWrappedValue.getter(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](a1);
  unint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x1F4188790](v3);
  uint64_t v8 = (char *)&v14 - v7;
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v11 + 16))(v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v10, 1, v1) == 1) {
    return 7104878;
  }
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v8, v10, v1);
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v8, v1);
  uint64_t v12 = String.init<A>(describing:)();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v8, v1);
  return v12;
}

uint64_t closure #1 in String.init<A>(describing:in:)@<X0>(uint64_t a1@<X1>, void *a2@<X2>, uint64_t *a3@<X8>)
{
  *(void *)&v25[0] = AnyKeyPath.debugDescription.getter();
  *((void *)&v25[0] + 1) = v6;
  uint64_t v28 = 92;
  unint64_t v29 = 0xE100000000000000;
  v7._countAndFlagsBits = a1;
  v7._object = a2;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 46;
  v8._object = (void *)0xE100000000000000;
  String.append(_:)(v8);
  v33[0] = 92;
  v33[1] = 0xE100000000000000;
  lazy protocol witness table accessor for type String and conformance String();
  Collection<>.trimmingPrefix<A>(_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = v30;
  uint64_t v9 = v31;
  swift_getAtPartialKeyPath();
  outlined init with copy of Any((uint64_t)v33, (uint64_t)v27);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OptionalProtocol);
  if (swift_dynamicCast())
  {
    outlined init with take of TypedPayloadDecoding(v25, (uint64_t)&v28);
    uint64_t v11 = v31;
    uint64_t v12 = v32;
    __swift_project_boxed_opaque_existential_1(&v28, v31);
    uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
    uint64_t v15 = v14;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v28);
  }
  else
  {
    uint64_t v26 = 0;
    memset(v25, 0, sizeof(v25));
    outlined destroy of OptionalProtocol?((uint64_t)v25);
    outlined init with copy of Any((uint64_t)v33, (uint64_t)&v28);
    uint64_t v13 = String.init<A>(describing:)();
    uint64_t v15 = v16;
  }
  uint64_t v17 = MEMORY[0x1A624E050](92, 0xE100000000000000, v10, v9);
  unint64_t v19 = v18;
  swift_bridgeObjectRelease();
  uint64_t v28 = v17;
  unint64_t v29 = v19;
  v20._countAndFlagsBits = 8250;
  v20._object = (void *)0xE200000000000000;
  String.append(_:)(v20);
  v21._countAndFlagsBits = v13;
  v21._object = v15;
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  uint64_t v22 = v28;
  unint64_t v23 = v29;
  uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
  *a3 = v22;
  a3[1] = v23;
  return result;
}

uint64_t sub_1A38E2018()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t partial apply for closure #1 in String.init<A>(describing:in:)@<X0>(uint64_t *a1@<X8>)
{
  return closure #1 in String.init<A>(describing:in:)(*(void *)(v1 + 24), *(void **)(v1 + 32), a1);
}

unint64_t lazy protocol witness table accessor for type Subsystem and conformance Subsystem()
{
  unint64_t result = lazy protocol witness table cache variable for type Subsystem and conformance Subsystem;
  if (!lazy protocol witness table cache variable for type Subsystem and conformance Subsystem)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Subsystem and conformance Subsystem);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for Subsystem(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x1A38E2244);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Subsystem()
{
  return &type metadata for Subsystem;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

uint64_t outlined destroy of OptionalProtocol?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OptionalProtocol?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t partial apply for closure #1 in DefaultStringInterpolation.appendInterpolation<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return partial apply for closure #1 in >> prefix<A>(_:)(a1, a2);
}

void closure #1 in NSItemProvider.loadGroupActivity()(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<TUConversationActivity, Error>);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4);
  if (one-time initialization token for _groupActivity != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for UTType();
  __swift_project_value_buffer(v7, (uint64_t)static UTType._groupActivity);
  uint64_t v8 = UTType.identifier.getter();
  uint64_t v9 = (void *)MEMORY[0x1A624DFA0](v8);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v10 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v11 + v10, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = partial apply for closure #1 in closure #1 in NSItemProvider.loadGroupActivity();
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  void aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed CPDataCryptor?, @guaranteed Error?) -> ();
  uint64_t aBlock[3] = &block_descriptor_12;
  uint64_t v12 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_loadItemForTypeIdentifier_options_completionHandler_, v9, 0, v12);
  _Block_release(v12);
}

uint64_t closure #1 in closure #1 in NSItemProvider.loadGroupActivity()(uint64_t a1, id a2)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    swift_unknownObjectRetain_n();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for NSSecureCoding);
    if (swift_dynamicCast())
    {
      unint64_t v2 = v26[0];
      type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for NSKeyedUnarchiver);
      type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivity);
      uint64_t v4 = (void *)static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
      if (one-time initialization token for default != -1) {
        swift_once();
      }
      uint64_t v15 = type metadata accessor for Logger();
      __swift_project_value_buffer(v15, (uint64_t)static Log.default);
      id v16 = v4;
      uint64_t v7 = Logger.logObject.getter();
      os_log_type_t v17 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v7, v17))
      {
        unint64_t v18 = (uint8_t *)swift_slowAlloc();
        long long v24 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v18 = 138412290;
        if (v4)
        {
          unint64_t v23 = v26;
          id v19 = v16;
        }
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *long long v24 = v4;

        _os_log_impl(&dword_1A375F000, v7, v17, "Unarchiving activity from item provider data: %@", v18, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x1A624F870](v24, -1, -1);
        MEMORY[0x1A624F870](v18, -1, -1);
        outlined consume of Data._Representation(v25, v2);
        goto LABEL_26;
      }

      outlined consume of Data._Representation(v25, v26[0]);
      if (!v4) {
        goto LABEL_29;
      }
    }
    else
    {
      self;
      uint64_t v4 = (void *)swift_dynamicCastObjCClass();
      if (v4) {
        swift_unknownObjectRetain();
      }
      if (one-time initialization token for default != -1) {
        swift_once();
      }
      uint64_t v5 = type metadata accessor for Logger();
      __swift_project_value_buffer(v5, (uint64_t)static Log.default);
      id v6 = v4;
      uint64_t v7 = Logger.logObject.getter();
      os_log_type_t v8 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        unint64_t v10 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v9 = 138412290;
        if (v4) {
          id v11 = v6;
        }
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *unint64_t v10 = v4;

        _os_log_impl(&dword_1A375F000, v7, v8, "Received activity object from item provider: %@", v9, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x1A624F870](v10, -1, -1);
        MEMORY[0x1A624F870](v9, -1, -1);
LABEL_26:

        if (!v4) {
          goto LABEL_29;
        }
        goto LABEL_27;
      }

      if (!v4) {
        goto LABEL_29;
      }
    }
LABEL_27:
    id v20 = objc_msgSend(v4, sel_sanitizedCopy, v23);
    if (v20)
    {
      id v21 = v20;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<TUConversationActivity, Error>);
      CheckedContinuation.resume(returning:)();

      return swift_unknownObjectRelease();
    }
LABEL_29:
    lazy protocol witness table accessor for type NSItemProvider.TUConversationActivityLoadError and conformance NSItemProvider.TUConversationActivityLoadError();
    swift_allocError();
    *uint64_t v22 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<TUConversationActivity, Error>);
    CheckedContinuation.resume(throwing:)();

    return swift_unknownObjectRelease();
  }
  if (!a2)
  {
    lazy protocol witness table accessor for type NSItemProvider.TUConversationActivityLoadError and conformance NSItemProvider.TUConversationActivityLoadError();
    swift_allocError();
    *uint64_t v12 = 1;
  }
  id v13 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<TUConversationActivity, Error>);
  return CheckedContinuation.resume(throwing:)();
}

uint64_t sub_1A38E2D4C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<TUConversationActivity, Error>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t partial apply for closure #1 in closure #1 in NSItemProvider.loadGroupActivity()(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<TUConversationActivity, Error>);

  return closure #1 in closure #1 in NSItemProvider.loadGroupActivity()(a1, a2);
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

unint64_t lazy protocol witness table accessor for type NSItemProvider.TUConversationActivityLoadError and conformance NSItemProvider.TUConversationActivityLoadError()
{
  unint64_t result = lazy protocol witness table cache variable for type NSItemProvider.TUConversationActivityLoadError and conformance NSItemProvider.TUConversationActivityLoadError;
  if (!lazy protocol witness table cache variable for type NSItemProvider.TUConversationActivityLoadError and conformance NSItemProvider.TUConversationActivityLoadError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NSItemProvider.TUConversationActivityLoadError and conformance NSItemProvider.TUConversationActivityLoadError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type NSItemProvider.TUConversationActivityLoadError and conformance NSItemProvider.TUConversationActivityLoadError;
  if (!lazy protocol witness table cache variable for type NSItemProvider.TUConversationActivityLoadError and conformance NSItemProvider.TUConversationActivityLoadError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NSItemProvider.TUConversationActivityLoadError and conformance NSItemProvider.TUConversationActivityLoadError);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for NSItemProvider.TUConversationActivityLoadError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x1A38E2F9CLL);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

void *type metadata accessor for NSItemProvider.TUConversationActivityLoadError()
{
  return &unk_1EF71BBE8;
}

void specialized Sequence.contains(where:)(uint64_t (*a1)(id *), uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a3 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 64);
  int64_t v19 = (unint64_t)(v7 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_19;
    }
    if (__OFADD__(v10++, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v10 >= v19) {
      goto LABEL_21;
    }
    unint64_t v14 = *(void *)(v6 + 8 * v10);
    if (!v14) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
LABEL_19:
    id v20 = *(id *)(*(void *)(a3 + 56) + 8 * v12);
    id v16 = v20;
    char v17 = a1(&v20);
    if (v3)
    {
      swift_release();

      return;
    }
    char v18 = v17;

    if (v18)
    {
LABEL_21:
      swift_release();
      return;
    }
  }
  int64_t v15 = v10 + 1;
  if (v10 + 1 >= v19) {
    goto LABEL_21;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14) {
    goto LABEL_17;
  }
  int64_t v15 = v10 + 2;
  if (v10 + 2 >= v19) {
    goto LABEL_21;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14) {
    goto LABEL_17;
  }
  int64_t v15 = v10 + 3;
  if (v10 + 3 >= v19) {
    goto LABEL_21;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14) {
    goto LABEL_17;
  }
  int64_t v15 = v10 + 4;
  if (v10 + 4 >= v19) {
    goto LABEL_21;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14)
  {
LABEL_17:
    int64_t v10 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v19) {
      goto LABEL_21;
    }
    unint64_t v14 = *(void *)(v6 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_29:
  __break(1u);
}

void specialized Sequence.forEach(_:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a1 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v10 = 0;
  if (!v8) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v10 << 6))
  {
    id v18 = *(id *)(*(void *)(a1 + 56) + 8 * i);
    id v16 = v18;
    closure #1 in ConversationManager.updateConversations(conversationsByGroupUUID:)(&v18, a2);
    if (v2)
    {
      swift_release();

      return;
    }

    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v10++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v10 >= v9) {
      goto LABEL_26;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v10);
    if (!v14)
    {
      int64_t v15 = v10 + 1;
      if (v10 + 1 >= v9) {
        goto LABEL_26;
      }
      unint64_t v14 = *(void *)(v5 + 8 * v15);
      if (v14) {
        goto LABEL_14;
      }
      int64_t v15 = v10 + 2;
      if (v10 + 2 >= v9) {
        goto LABEL_26;
      }
      unint64_t v14 = *(void *)(v5 + 8 * v15);
      if (v14) {
        goto LABEL_14;
      }
      int64_t v15 = v10 + 3;
      if (v10 + 3 >= v9) {
        goto LABEL_26;
      }
      unint64_t v14 = *(void *)(v5 + 8 * v15);
      if (v14)
      {
LABEL_14:
        int64_t v10 = v15;
        goto LABEL_15;
      }
      int64_t v17 = v10 + 4;
      if (v10 + 4 >= v9)
      {
LABEL_26:
        swift_release();
        return;
      }
      unint64_t v14 = *(void *)(v5 + 8 * v17);
      v10 += 4;
      if (!v14) {
        break;
      }
    }
LABEL_15:
    unint64_t v8 = (v14 - 1) & v14;
  }
  while (1)
  {
    int64_t v10 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v10 >= v9) {
      goto LABEL_26;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v10);
    ++v17;
    if (v14) {
      goto LABEL_15;
    }
  }
LABEL_28:
  __break(1u);
}

uint64_t ConversationManager.__allocating_init(client:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  uint64_t v9 = specialized ConversationManager.init(client:)((uint64_t)v7, v2, v3, v4);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v9;
}

uint64_t static ConversationManager.shared.getter()
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t ConversationManager.conversationsByUUID.getter()
{
  uint64_t v1 = v0;
  os_unfair_lock_lock((os_unfair_lock_t)(v0 + 16));
  uint64_t v2 = *(void *)(v0 + 24);
  if (v2)
  {
    uint64_t v3 = *(void *)(v0 + 24);
  }
  else
  {
    outlined init with copy of AudioSessionAssertionManager(v0 + 96, (uint64_t)v7);
    __swift_project_boxed_opaque_existential_1(v7, v8);
    uint64_t v4 = dispatch thunk of ActivitySessionContainerProvider.activitySessions.getter();
    uint64_t v3 = specialized ConversationManager.updateConversations(conversationsByGroupUUID:)(v4);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
    *(void *)(v0 + 24) = v3;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock((os_unfair_lock_t)(v0 + 16));
  if (!v2)
  {
    outlined init with copy of AudioSessionAssertionManager(v0 + 96, (uint64_t)v7);
    __swift_project_boxed_opaque_existential_1(v7, v8);
    dispatch thunk of ActivitySessionContainerProvider.onActivitySessionsChanged.getter();
    swift_unownedRetainStrong();
    swift_unownedRetain();
    swift_release();
    *(void *)(swift_allocObject() + 16) = v0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never>);
    lazy protocol witness table accessor for type AnyPublisher<[UUID : TUConversationActivitySessionContainer], Never> and conformance AnyPublisher<A, B>();
    uint64_t v5 = Publisher<>.sink(receiveValue:)();
    swift_release();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
    *(void *)(v1 + 136) = v5;
    swift_release();
  }
  return v3;
}

uint64_t closure #2 in ConversationManager.conversationsByUUID.getter(uint64_t *a1)
{
  uint64_t v1 = *a1;
  swift_unownedRetainStrong();
  swift_unownedRetainStrong();
  uint64_t v2 = specialized ConversationManager.updateConversations(conversationsByGroupUUID:)(v1);
  swift_release();
  ConversationManager.conversationsByUUID.setter(v2);

  return swift_release();
}

uint64_t ConversationManager.conversationsByUUID.setter(uint64_t a1)
{
  uint64_t v2 = v1;
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 16));
  swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
  uint64_t v4 = ConversationManager.conversationsByUUID.getter();
  unint64_t v5 = (unint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(v4);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v7 = MEMORY[0x1E4FBC860];
  uint64_t v19 = MEMORY[0x1E4FBC860];
  if ((v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(v5 + 16);
    if (v8) {
      goto LABEL_4;
    }
LABEL_17:
    swift_release();
    uint64_t v12 = MEMORY[0x1E4FBC860];
    uint64_t v19 = v7;
    if ((MEMORY[0x1E4FBC860] & 0x8000000000000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
  uint64_t result = swift_release();
  if (!v8) {
    goto LABEL_17;
  }
LABEL_4:
  if (v8 < 1)
  {
    __break(1u);
    goto LABEL_31;
  }
  for (uint64_t i = 0; i != v8; ++i)
  {
    if ((v5 & 0xC000000000000001) != 0)
    {
      uint64_t v10 = MEMORY[0x1A624E900](i, v5);
    }
    else
    {
      uint64_t v10 = *(void *)(v5 + 8 * i + 32);
      swift_retain();
    }
    uint64_t v11 = (*(void *(**)(char *__return_ptr))(*(void *)v10 + 152))(&v18);
    if (v18 == 3 && (*(uint64_t (**)(void *))(*(void *)v10 + 272))(v11))
    {
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
    }
    else
    {
      swift_release();
    }
  }
  swift_release();
  uint64_t v12 = v19;
  uint64_t v19 = v7;
  if (v12 < 0) {
    goto LABEL_27;
  }
LABEL_18:
  if ((v12 & 0x4000000000000000) == 0)
  {
    uint64_t v13 = *(void *)(v12 + 16);
    uint64_t result = swift_retain();
    if (!v13)
    {
LABEL_28:
      swift_release_n();
      uint64_t v17 = MEMORY[0x1E4FBC860];
LABEL_29:
      ConversationManager._groupSessions.getter();
      uint64_t v19 = v17;
      CurrentValueSubject.send(_:)();
      swift_release();
      return swift_bridgeObjectRelease();
    }
    goto LABEL_20;
  }
LABEL_27:
  swift_retain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v13 = result;
  if (!result) {
    goto LABEL_28;
  }
LABEL_20:
  if (v13 >= 1)
  {
    uint64_t v14 = 0;
    do
    {
      if ((v12 & 0xC000000000000001) != 0)
      {
        uint64_t v15 = MEMORY[0x1A624E900](v14, v12);
      }
      else
      {
        uint64_t v15 = *(void *)(v12 + 8 * v14 + 32);
        swift_retain();
      }
      ++v14;
      unint64_t v16 = (*(uint64_t (**)(void))(*(void *)v15 + 320))();
      swift_release();
      specialized Array.append<A>(contentsOf:)(v16);
    }
    while (v13 != v14);
    swift_release_n();
    uint64_t v17 = v19;
    goto LABEL_29;
  }
LABEL_31:
  __break(1u);
  return result;
}

void *ConversationManager.conversations.getter()
{
  uint64_t v0 = ConversationManager.conversationsByUUID.getter();
  uint64_t v1 = specialized _copyCollectionToContiguousArray<A>(_:)(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t ConversationManager.suggest(activity:)()
{
  return AnyCancellable.init(_:)();
}

uint64_t ConversationManager.groupSessions(_:)(unint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBC860];
  uint64_t v13 = MEMORY[0x1E4FBC860];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v3 = result;
    if (result)
    {
LABEL_3:
      if (v3 < 1)
      {
        __break(1u);
        goto LABEL_29;
      }
      for (uint64_t i = 0; i != v3; ++i)
      {
        if ((a1 & 0xC000000000000001) != 0)
        {
          uint64_t v6 = MEMORY[0x1A624E900](i, a1);
        }
        else
        {
          uint64_t v6 = *(void *)(a1 + 8 * i + 32);
          swift_retain();
        }
        (*(void (**)(char *__return_ptr))(*(void *)v6 + 152))(&v12);
        if (v12 == 3)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        else
        {
          swift_release();
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v7 = v13;
      uint64_t v13 = v2;
      if (v7 < 0) {
        goto LABEL_25;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = MEMORY[0x1E4FBC860];
  uint64_t v13 = v2;
  if ((MEMORY[0x1E4FBC860] & 0x8000000000000000) != 0) {
    goto LABEL_25;
  }
LABEL_16:
  if ((v7 & 0x4000000000000000) != 0)
  {
LABEL_25:
    swift_retain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v8 = result;
    if (!result) {
      goto LABEL_26;
    }
    goto LABEL_18;
  }
  uint64_t v8 = *(void *)(v7 + 16);
  uint64_t result = swift_retain();
  if (!v8)
  {
LABEL_26:
    swift_release_n();
    return MEMORY[0x1E4FBC860];
  }
LABEL_18:
  if (v8 < 1)
  {
LABEL_29:
    __break(1u);
    return result;
  }
  uint64_t v9 = 0;
  do
  {
    if ((v7 & 0xC000000000000001) != 0)
    {
      uint64_t v10 = MEMORY[0x1A624E900](v9, v7);
    }
    else
    {
      uint64_t v10 = *(void *)(v7 + 8 * v9 + 32);
      swift_retain();
    }
    ++v9;
    unint64_t v11 = (*(uint64_t (**)(void))(*(void *)v10 + 320))();
    swift_release();
    specialized Array.append<A>(contentsOf:)(v11);
  }
  while (v8 != v9);
  swift_release_n();
  return v13;
}

uint64_t ConversationManager._groupSessions.getter()
{
  if (v0[4])
  {
    uint64_t v1 = v0[4];
  }
  else
  {
    uint64_t v2 = v0;
    uint64_t v3 = ConversationManager.conversationsByUUID.getter();
    uint64_t v4 = specialized _copyCollectionToContiguousArray<A>(_:)(v3);
    swift_bridgeObjectRelease();
    (*(void (**)(void *))(*v0 + 168))(v4);
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentValueSubject<[GroupSession<AnyGroupActivity>], Never>);
    swift_allocObject();
    uint64_t v1 = CurrentValueSubject.init(_:)();
    v2[4] = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t ConversationManager.groupSessions.getter()
{
  ConversationManager._groupSessions.getter();
  CurrentValueSubject.value.getter();
  swift_release();
  return v1;
}

uint64_t ConversationManager.groupSessionsPublisher.getter()
{
  uint64_t v0 = ConversationManager._groupSessions.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PublisherBox<CurrentValueSubject<[GroupSession<AnyGroupActivity>], Never>>);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v0;
  return result;
}

uint64_t ConversationManager.topicManager.getter()
{
  if (v0[5])
  {
    uint64_t v1 = v0[5];
  }
  else
  {
    uint64_t v2 = type metadata accessor for TopicManager();
    uint64_t v3 = v0[15];
    uint64_t v4 = v0[16];
    unint64_t v5 = __swift_project_boxed_opaque_existential_1(v0 + 12, v3);
    v11[3] = v3;
    uint64_t v6 = *(void *)(v4 + 8);
    v11[4] = v6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v3 - 8) + 16))(boxed_opaque_existential_1, v5, v3);
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F5B140]), sel_init);
    uint64_t v9 = type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for CPFeatureFlags);
    uint64_t v1 = specialized TopicManager.__allocating_init(provider:featureFlags:)((uint64_t)boxed_opaque_existential_1, (uint64_t)v8, v2, v3, v9, v6);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
    v0[5] = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t ConversationManager.topicManager.setter(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  return swift_release();
}

uint64_t (*ConversationManager.topicManager.modify(uint64_t *a1))(void *a1)
{
  a1[1] = v1;
  *a1 = ConversationManager.topicManager.getter();
  return ConversationManager.topicManager.modify;
}

uint64_t ConversationManager.topicManager.modify(void *a1)
{
  *(void *)(a1[1] + 40) = *a1;
  return swift_release();
}

uint64_t ConversationManager.audioSessionAssertionManager.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return outlined init with copy of AudioSessionAssertionManager(v1 + 48, a1);
}

uint64_t ConversationManager.audioSessionAssertionManager.setter(long long *a1)
{
  uint64_t v3 = v1 + 48;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1Tm(v3);
  outlined init with take of TypedPayloadDecoding(a1, v3);
  return swift_endAccess();
}

uint64_t ConversationManager.groupSessionTable.setter(uint64_t a1)
{
  *(void *)(v1 + 88) = a1;
  return swift_release();
}

uint64_t (*ConversationManager.groupSessionTable.modify(uint64_t *a1))(void *a1)
{
  a1[1] = v1;
  *a1 = ConversationManager.groupSessionTable.getter();
  return ConversationManager.groupSessionTable.modify;
}

uint64_t ConversationManager.groupSessionTable.modify(void *a1)
{
  *(void *)(a1[1] + 88) = *a1;
  return swift_release();
}

uint64_t ConversationManager.prepareForActivation(options:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 88) = a1;
  *(void *)(v3 + 96) = v2;
  outlined init with take of AuthorizationPromptOptions?(a2, v3 + 16);
  return MEMORY[0x1F4188298](ConversationManager.prepareForActivation(options:), 0, 0);
}

uint64_t ConversationManager.prepareForActivation(options:)()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = swift_task_alloc();
  v0[13] = v2;
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = v0 + 2;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[14] = v3;
  *uint64_t v3 = v0;
  v3[1] = ConversationManager.prepareForActivation(options:);
  uint64_t v4 = v0[11];
  return MEMORY[0x1F41880D8](v4, 0, 0, 0xD00000000000001ELL, 0x80000001A3903530, partial apply for closure #1 in ConversationManager.prepareForActivation(options:), v2, &type metadata for GroupActivityActivationResult);
}

{
  uint64_t *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t closure #1 in ConversationManager.prepareForActivation(options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = a1;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GroupActivityActivationResult, Never>);
  uint64_t v5 = *(void *)(v29 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v29);
  uint64_t v7 = type metadata accessor for AuthorizationRequestOverrides.PromptCondition();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  unint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)v19 - v12;
  outlined init with copy of AudioSessionAssertionManager(a2 + 96, (uint64_t)v30);
  uint64_t v27 = v30[4];
  uint64_t v26 = __swift_project_boxed_opaque_existential_1(v30, v30[3]);
  outlined init with take of AuthorizationPromptOptions?(a3, (uint64_t)v31);
  uint64_t v14 = 0;
  if (v31[1] != 1)
  {
    uint64_t v22 = v31[0];
    uint64_t v24 = v31[4];
    uint64_t v25 = v31[2];
    uint64_t v21 = v31[5];
    uint64_t v23 = v31[6];
    v19[1] = v31[7];
    unsigned __int8 v34 = v33;
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, **((unsigned int **)&unk_1E5B12378 + v32), v7);
    int v20 = v34;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v11, v7);
    objc_allocWithZone((Class)type metadata accessor for AuthorizationRequestOverrides());
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v14 = (void *)AuthorizationRequestOverrides.init(title:message:startForEveryone:startForMe:promptCondition:confirmReplacement:)();
  }
  uint64_t v15 = v29;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v28, v29);
  unint64_t v16 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v17 + v16, (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
  dispatch thunk of ConversationManagerClientProtocol.prepareForGroupActivity(overrides:completionHandler:)();
  swift_release();

  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
}

uint64_t closure #1 in closure #1 in ConversationManager.prepareForActivation(options:)(char a1, void *a2)
{
  if (a2)
  {
    if (one-time initialization token for default != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    __swift_project_value_buffer(v3, (uint64_t)static Log.default);
    id v4 = a2;
    id v5 = a2;
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v15 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      id v10 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
      uint64_t v11 = String.init<A>(reflecting:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v11, v12, &v15);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1A375F000, v6, v7, "Error preparing activity for activation: %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A624F870](v9, -1, -1);
      MEMORY[0x1A624F870](v8, -1, -1);
    }
    else
    {
    }
    char v13 = 2;
  }
  else
  {
    char v13 = (a1 & 1) == 0;
  }
  LOBYTE(v15) = v13;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GroupActivityActivationResult, Never>);
  return CheckedContinuation.resume(returning:)();
}

uint64_t ConversationManager.begin(activity:request:)(uint64_t a1, uint64_t a2)
{
  v3[11] = a2;
  v3[12] = v2;
  uint64_t v4 = type metadata accessor for UUID();
  v3[13] = v4;
  v3[14] = *(void *)(v4 - 8);
  v3[15] = swift_task_alloc();
  return MEMORY[0x1F4188298](ConversationManager.begin(activity:request:), 0, 0);
}

uint64_t ConversationManager.begin(activity:request:)()
{
  id v35 = v0;
  uint64_t v1 = ConversationManager.activeConversation.getter();
  v0[16] = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    if (one-time initialization token for default != -1) {
      swift_once();
    }
    uint64_t v3 = (void *)v0[11];
    uint64_t v4 = type metadata accessor for Logger();
    __swift_project_value_buffer(v4, (uint64_t)static Log.default);
    id v5 = v3;
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.default.getter();
    BOOL v8 = os_log_type_enabled(v6, v7);
    uint64_t v9 = (void *)v0[11];
    if (v8)
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v34 = v33;
      *(_DWORD *)id v10 = 136315138;
      v0[9] = v9;
      type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivityCreateSessionRequest);
      id v11 = v9;
      uint64_t v12 = String.init<A>(reflecting:)();
      v0[10] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A375F000, v6, v7, "Activating activity through current session: %s.", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A624F870](v33, -1, -1);
      MEMORY[0x1A624F870](v10, -1, -1);
    }
    else
    {
    }
    outlined init with copy of AudioSessionAssertionManager(v0[12] + 96, (uint64_t)(v0 + 2));
    uint64_t v26 = v0[5];
    uint64_t v27 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v26);
    (*(void (**)(void))(*(void *)v2 + 128))();
    uint64_t v28 = (void *)swift_task_alloc();
    v0[17] = v28;
    *uint64_t v28 = v0;
    v28[1] = ConversationManager.begin(activity:request:);
    uint64_t v29 = v0[15];
    uint64_t v30 = v0[11];
    return MEMORY[0x1F4113760](v30, v29, v26, v27);
  }
  else
  {
    if (one-time initialization token for default != -1) {
      swift_once();
    }
    uint64_t v14 = (void *)v0[11];
    uint64_t v15 = type metadata accessor for Logger();
    __swift_project_value_buffer(v15, (uint64_t)static Log.default);
    id v16 = v14;
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    BOOL v19 = os_log_type_enabled(v17, v18);
    int v20 = (void *)v0[11];
    if (v19)
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v22 = v34;
      *(_DWORD *)uint64_t v21 = 136315138;
      v0[7] = v20;
      type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivityCreateSessionRequest);
      id v23 = v20;
      uint64_t v24 = String.init<A>(reflecting:)();
      v0[8] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A375F000, v17, v18, "Dropping activity as there is no active conversation: %s", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A624F870](v22, -1, -1);
      MEMORY[0x1A624F870](v21, -1, -1);
    }
    else
    {
    }
    swift_task_dealloc();
    uint64_t v31 = (uint64_t (*)(void))v0[1];
    return v31(0);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  uint64_t v1 = *(unsigned __int8 *)(v0 + 152);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t ConversationManager.begin(activity:request:)(char a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 144) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v4 + 120);
  uint64_t v6 = *(void *)(v4 + 112);
  uint64_t v7 = *(void *)(v4 + 104);
  if (v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    BOOL v8 = ConversationManager.begin(activity:request:);
  }
  else
  {
    *(unsigned char *)(v4 + 152) = a1 & 1;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    BOOL v8 = ConversationManager.begin(activity:request:);
  }
  return MEMORY[0x1F4188298](v8, 0, 0);
}

uint64_t ConversationManager.activeConversation.getter()
{
  uint64_t v0 = ConversationManager.conversationsByUUID.getter();
  unint64_t v1 = (unint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(v0);
  swift_bridgeObjectRelease();
  if ((v1 & 0x8000000000000000) != 0 || (v1 & 0x4000000000000000) != 0)
  {
LABEL_15:
    swift_retain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    if (v2) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v2 = *(void *)(v1 + 16);
    swift_retain();
    if (v2)
    {
LABEL_4:
      uint64_t v3 = 4;
      do
      {
        uint64_t v4 = v3 - 4;
        if ((v1 & 0xC000000000000001) != 0)
        {
          uint64_t v5 = MEMORY[0x1A624E900](v3 - 4, v1);
          BOOL v6 = __OFADD__(v4, 1);
          uint64_t v7 = v3 - 3;
          if (v6) {
            goto LABEL_14;
          }
        }
        else
        {
          uint64_t v5 = *(void *)(v1 + 8 * v3);
          swift_retain();
          BOOL v6 = __OFADD__(v4, 1);
          uint64_t v7 = v3 - 3;
          if (v6)
          {
LABEL_14:
            __break(1u);
            goto LABEL_15;
          }
        }
        (*(void (**)(uint64_t *__return_ptr))(*(void *)v5 + 152))(&v9);
        if (v9 == 3) {
          goto LABEL_13;
        }
        swift_release();
        ++v3;
      }
      while (v7 != v2);
    }
  }
  uint64_t v5 = 0;
LABEL_13:
  swift_release_n();
  return v5;
}

uint64_t ConversationManager.end(activity:)()
{
  return ConversationManager.end(activity:)(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t ConversationManager.init(client:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  uint64_t v9 = specialized ConversationManager.init(client:)((uint64_t)v7, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v9;
}

uint64_t closure #1 in ConversationManager.updateConversations(conversationsByGroupUUID:)(id *a1, uint64_t *a2)
{
  uint64_t v28 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v28 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v28);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1F4188790](v5);
  uint64_t v10 = (char *)&v28 - v9;
  MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v28 - v11;
  id v13 = *a1;
  id v14 = objc_msgSend(*a1, sel_UUID);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v15 = *a2;
  if (*(void *)(*a2 + 16) && (unint64_t v16 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v12), (v17 & 1) != 0))
  {
    uint64_t v18 = *(void *)(*(void *)(v15 + 56) + 8 * v16);
    swift_retain();
  }
  else
  {
    id v19 = v13;
    id v20 = [v19 a8];
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    id v21 = objc_msgSend(v19, sel_groupUUID);
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    type metadata accessor for Conversation();
    swift_allocObject();
    uint64_t v18 = Conversation.init(identifier:groupUUID:)((uint64_t)v10, (uint64_t)v7);
    swift_retain();
    Conversation.update(with:)(v19);
    swift_release();
  }
  uint64_t v22 = *(void (**)(char *, uint64_t))(v4 + 8);
  id v23 = v12;
  uint64_t v24 = v28;
  v22(v23, v28);
  Conversation.update(with:)(v13);
  id v25 = [v13 a8];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v29 = *a2;
  *a2 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v18, (uint64_t)v10, isUniquelyReferenced_nonNull_native);
  *a2 = v29;
  swift_bridgeObjectRelease();
  v22(v10, v24);
  return swift_release();
}

uint64_t closure #1 in closure #2 in ConversationManager.updateConversations(conversationsByGroupUUID:)(id *a1)
{
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(*a1, sel_UUID);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  char v7 = static UUID.== infix(_:_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7 & 1;
}

uint64_t ConversationManager.deinit()
{
  outlined destroy of OS_dispatch_queue.SchedulerOptions?(v0 + 16, &demangling cache variable for type metadata for Mutex<LazyState<[UUID : Conversation]>>);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 48);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
  swift_release();
  return v0;
}

uint64_t ConversationManager.__deallocating_deinit()
{
  outlined destroy of OS_dispatch_queue.SchedulerOptions?(v0 + 16, &demangling cache variable for type metadata for Mutex<LazyState<[UUID : Conversation]>>);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 48);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance ConversationManager@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ConversationManager();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t protocol witness for InternalGroupSessionProvider.groupSessions.getter in conformance ConversationManager()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t protocol witness for InternalGroupSessionProvider.groupSessionsPublisher.getter in conformance ConversationManager()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t protocol witness for InternalGroupSessionProvider.topicManager.getter in conformance ConversationManager()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t protocol witness for InternalGroupSessionProvider.audioSessionAssertionManager.getter in conformance ConversationManager()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t protocol witness for InternalGroupSessionProvider.prepareForActivation(options:) in conformance ConversationManager(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 288) + **(int **)(*(void *)v2 + 288));
  id v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v8(a1, a2);
}

uint64_t protocol witness for InternalGroupSessionProvider.begin(activity:request:) in conformance ConversationManager(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 296) + **(int **)(*(void *)v2 + 296));
  id v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = protocol witness for InternalGroupSessionProvider.begin(activity:request:) in conformance ConversationManager;
  return v8(a1, a2);
}

uint64_t protocol witness for InternalGroupSessionProvider.begin(activity:request:) in conformance ConversationManager(char a1)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (v1) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = a1 & 1;
  }
  return v4(v5);
}

uint64_t protocol witness for InternalGroupSessionProvider.end(activity:) in conformance ConversationManager(uint64_t a1)
{
  id v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 304) + **(int **)(*(void *)v1 + 304));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = protocol witness for AnyTransportSession.removeAttachment(id:) in conformance GroupSession<A>;
  return v6(a1);
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  void v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  uint64_t v6 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  outlined consume of [AnyHashable : Any].Iterator._Variant();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Participant();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8 - 8);
  uint64_t v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x1F4188790](v10);
  uint64_t v15 = (char *)&v30 - v14;
  uint64_t v35 = a4;
  uint64_t v18 = *(void *)(a4 + 56);
  uint64_t v17 = a4 + 56;
  uint64_t v16 = v18;
  uint64_t v19 = -1 << *(unsigned char *)(v17 - 24);
  if (-v19 < 64) {
    uint64_t v20 = ~(-1 << -(char)v19);
  }
  else {
    uint64_t v20 = -1;
  }
  unint64_t v21 = v20 & v16;
  if (!a2)
  {
    int64_t v22 = 0;
    a3 = 0;
LABEL_38:
    *a1 = v35;
    a1[1] = v17;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    int64_t v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v32 = -1 << *(unsigned char *)(v17 - 24);
  uint64_t v33 = a1;
  int64_t v22 = 0;
  uint64_t v23 = 0;
  int64_t v34 = (unint64_t)(63 - v19) >> 6;
  int64_t v31 = v34 - 1;
  if (!v21) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  unint64_t v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    uint64_t v29 = *(void *)(v9 + 72);
    outlined init with copy of Participant(*(void *)(v35 + 48) + v29 * v25, (uint64_t)v12);
    outlined init with take of Participant((uint64_t)v12, (uint64_t)v15);
    uint64_t result = outlined init with take of Participant((uint64_t)v15, a2);
    if (v23 == a3) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v21) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v34) {
      goto LABEL_32;
    }
    unint64_t v27 = *(void *)(v17 + 8 * v26);
    if (!v27) {
      break;
    }
LABEL_18:
    unint64_t v21 = (v27 - 1) & v27;
    unint64_t v25 = __clz(__rbit64(v27)) + (v26 << 6);
    int64_t v22 = v26;
  }
  v22 += 2;
  if (v26 + 1 >= v34)
  {
    unint64_t v21 = 0;
    int64_t v22 = v26;
    goto LABEL_36;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v22);
  if (v27) {
    goto LABEL_14;
  }
  int64_t v28 = v26 + 2;
  if (v26 + 2 >= v34) {
    goto LABEL_32;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v28);
  if (v27) {
    goto LABEL_17;
  }
  int64_t v22 = v26 + 3;
  if (v26 + 3 >= v34)
  {
    unint64_t v21 = 0;
    int64_t v22 = v26 + 2;
    goto LABEL_36;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v22);
  if (v27)
  {
LABEL_14:
    int64_t v26 = v22;
    goto LABEL_18;
  }
  int64_t v28 = v26 + 4;
  if (v26 + 4 >= v34)
  {
LABEL_32:
    unint64_t v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    uint64_t v19 = v32;
    a1 = v33;
    goto LABEL_38;
  }
  unint64_t v27 = *(void *)(v17 + 8 * v28);
  if (v27)
  {
LABEL_17:
    int64_t v26 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v26 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v26 >= v34)
    {
      unint64_t v21 = 0;
      int64_t v22 = v31;
      goto LABEL_36;
    }
    unint64_t v27 = *(void *)(v17 + 8 * v26);
    ++v28;
    if (v27) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    void v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    *uint64_t v11 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    if (v13 == v10)
    {
      swift_retain();
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = swift_retain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t specialized ConversationManager.init(client:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = a3;
  uint64_t v12 = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v10);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  *(_DWORD *)(a2 + 16) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 24) = 0;
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v8 = static AVAudioSessionAssertionManager.shared;
  *(void *)(a2 + 72) = type metadata accessor for AVAudioSessionAssertionManager();
  *(void *)(a2 + 80) = &protocol witness table for AVAudioSessionAssertionManager;
  *(void *)(a2 + 48) = v8;
  *(void *)(a2 + 88) = 0;
  *(void *)(a2 + 136) = 0;
  outlined init with take of TypedPayloadDecoding(&v10, a2 + 96);
  swift_retain();
  return a2;
}

uint64_t outlined init with take of AuthorizationPromptOptions?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AuthorizationPromptOptions?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in ConversationManager.prepareForActivation(options:)(uint64_t a1)
{
  return closure #1 in ConversationManager.prepareForActivation(options:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t ConversationManager.end(activity:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1A38E63A4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 216))();
  *a2 = result;
  return result;
}

uint64_t sub_1A38E63F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 224);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_1A38E6444(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 240))();
}

uint64_t sub_1A38E6488(uint64_t a1, uint64_t a2)
{
  outlined init with copy of AudioSessionAssertionManager(a1, (uint64_t)v4);
  return (*(uint64_t (**)(unsigned char *))(**(void **)a2 + 248))(v4);
}

uint64_t sub_1A38E64E4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 264))();
  *a2 = result;
  return result;
}

uint64_t sub_1A38E6538(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 272);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t method lookup function for ConversationManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ConversationManager);
}

uint64_t dispatch thunk of ConversationManager.suggest(activity:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of ConversationManager.groupSessions(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of ConversationManager.groupSessions.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of ConversationManager.groupSessionsPublisher.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of ConversationManager.topicManager.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of ConversationManager.topicManager.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of ConversationManager.topicManager.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of ConversationManager.audioSessionAssertionManager.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of ConversationManager.audioSessionAssertionManager.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of ConversationManager.audioSessionAssertionManager.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of ConversationManager.groupSessionTable.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of ConversationManager.groupSessionTable.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of ConversationManager.groupSessionTable.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of ConversationManager.prepareForActivation(options:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 288) + **(int **)(*(void *)v2 + 288));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = protocol witness for AnyTransportSession.removeAttachment(id:) in conformance GroupSession<A>;
  return v8(a1, a2);
}

uint64_t dispatch thunk of ConversationManager.begin(activity:request:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 296) + **(int **)(*(void *)v2 + 296));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = partial apply for closure #1 in GroupActivityTransferRepresentation.init<A>(exporting:);
  return v8(a1, a2);
}

uint64_t dispatch thunk of ConversationManager.end(activity:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 304) + **(int **)(*(void *)v1 + 304));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = protocol witness for AnyTransportSession.removeAttachment(id:) in conformance GroupSession<A>;
  return v6(a1);
}

uint64_t dispatch thunk of ConversationManager.__allocating_init(client:)()
{
  return (*(uint64_t (**)(void))(v0 + 360))();
}

uint64_t sub_1A38E6B00()
{
  if (MEMORY[0x1E4FBC8F0]) {
    return __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mutex<LazyState<[UUID : Conversation]>>);
  }
  else {
    return MEMORY[0x1E4FBC848] + 8;
  }
}

uint64_t sub_1A38E6B28()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GroupActivityActivationResult, Never>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t partial apply for closure #1 in closure #1 in ConversationManager.prepareForActivation(options:)(char a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<GroupActivityActivationResult, Never>);

  return closure #1 in closure #1 in ConversationManager.prepareForActivation(options:)(a1, a2);
}

uint64_t sub_1A38E6C40()
{
  swift_unownedRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t partial apply for closure #2 in ConversationManager.conversationsByUUID.getter(uint64_t *a1)
{
  return closure #2 in ConversationManager.conversationsByUUID.getter(a1);
}

uint64_t specialized Sequence.filter(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v49 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  int64_t v48 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x1F4188790](v7);
  uint64_t v12 = (char *)&v41 - v10;
  int64_t v13 = 0;
  uint64_t v57 = MEMORY[0x1E4FBC860];
  uint64_t v53 = a1;
  uint64_t v16 = *(void *)(a1 + 64);
  uint64_t v15 = a1 + 64;
  uint64_t v14 = v16;
  uint64_t v17 = 1 << *(unsigned char *)(v15 - 32);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  unint64_t v19 = v18 & v14;
  uint64_t v45 = v15;
  int64_t v46 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v51 = v11 + 16;
  uint64_t v52 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  uint64_t v50 = v11 + 48;
  uint64_t v20 = (uint64_t (**)(char *, char *, uint64_t))(v11 + 32);
  uint64_t v54 = v11;
  uint64_t v42 = (uint64_t (**)(char *, uint64_t))(v11 + 8);
  uint64_t v43 = result;
  int64_t v44 = (char *)&v41 - v10;
  uint64_t v47 = v5;
  if ((v18 & v14) != 0) {
    goto LABEL_6;
  }
LABEL_7:
  if (__OFADD__(v13++, 1))
  {
    __break(1u);
    goto LABEL_36;
  }
  if (v13 >= v46) {
    goto LABEL_33;
  }
  unint64_t v25 = *(void *)(v45 + 8 * v13);
  if (v25) {
    goto LABEL_19;
  }
  int64_t v26 = v13 + 1;
  if (v13 + 1 >= v46) {
    goto LABEL_33;
  }
  unint64_t v25 = *(void *)(v45 + 8 * v26);
  if (v25)
  {
LABEL_18:
    int64_t v13 = v26;
LABEL_19:
    uint64_t v22 = (v25 - 1) & v25;
    for (unint64_t i = __clz(__rbit64(v25)) + (v13 << 6); ; unint64_t i = v21 | (v13 << 6))
    {
      uint64_t v27 = v54;
      uint64_t v28 = *(void *)(v54 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v54 + 16))(v5, *(void *)(v53 + 48) + v28 * i, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v5, 0, 1, v6);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v5, 1, v6) == 1) {
        break;
      }
      unint64_t v55 = v22;
      int64_t v29 = v13;
      uint64_t v30 = *v20;
      uint64_t v31 = (*v20)(v12, v5, v6);
      MEMORY[0x1F4188790](v31);
      *(&v41 - 2) = (uint64_t)v12;
      uint64_t v32 = v20;
      uint64_t v33 = v12;
      uint64_t v34 = v49;
      swift_bridgeObjectRetain();
      uint64_t v35 = v56;
      specialized Sequence.contains(where:)(partial apply for closure #1 in closure #2 in ConversationManager.updateConversations(conversationsByGroupUUID:), (uint64_t)(&v41 - 4), v34);
      char v37 = v36;
      uint64_t v56 = v35;
      swift_bridgeObjectRelease();
      if (v37)
      {
        uint64_t result = (*v42)(v33, v6);
        uint64_t v5 = v47;
        uint64_t v12 = v33;
        uint64_t v20 = v32;
        int64_t v13 = v29;
        unint64_t v19 = v55;
        if (!v55) {
          goto LABEL_7;
        }
      }
      else
      {
        v30(v48, v33, v6);
        uint64_t v38 = v57;
        uint64_t v20 = v32;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v38 + 16) + 1, 1);
          uint64_t v38 = v57;
        }
        int64_t v13 = v29;
        unint64_t v19 = v55;
        unint64_t v40 = *(void *)(v38 + 16);
        unint64_t v39 = *(void *)(v38 + 24);
        if (v40 >= v39 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v39 > 1, v40 + 1, 1);
          uint64_t v38 = v57;
        }
        *(void *)(v38 + 16) = v40 + 1;
        uint64_t v6 = v43;
        uint64_t result = v30((char *)(v38+ ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80))+ v40 * v28), v48, v43);
        uint64_t v57 = v38;
        uint64_t v5 = v47;
        uint64_t v12 = v44;
        if (!v19) {
          goto LABEL_7;
        }
      }
LABEL_6:
      unint64_t v21 = __clz(__rbit64(v19));
      uint64_t v22 = (v19 - 1) & v19;
    }
    swift_release();
    goto LABEL_34;
  }
  int64_t v26 = v13 + 2;
  if (v13 + 2 >= v46)
  {
LABEL_33:
    (*v52)(v5, 1, 1, v6);
    swift_release();
LABEL_34:
    outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v5, &demangling cache variable for type metadata for UUID?);
    return v57;
  }
  unint64_t v25 = *(void *)(v45 + 8 * v26);
  if (v25) {
    goto LABEL_18;
  }
  int64_t v26 = v13 + 3;
  if (v13 + 3 >= v46) {
    goto LABEL_33;
  }
  unint64_t v25 = *(void *)(v45 + 8 * v26);
  if (v25) {
    goto LABEL_18;
  }
  int64_t v26 = v13 + 4;
  if (v13 + 4 >= v46) {
    goto LABEL_33;
  }
  unint64_t v25 = *(void *)(v45 + 8 * v26);
  if (v25) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v13 >= v46) {
      goto LABEL_33;
    }
    unint64_t v25 = *(void *)(v45 + 8 * v13);
    ++v26;
    if (v25) {
      goto LABEL_19;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t specialized ConversationManager.updateConversations(conversationsByGroupUUID:)(uint64_t a1)
{
  uint64_t v46 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v46 - 8);
  MEMORY[0x1F4188790](v46);
  uint64_t v47 = (char *)v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)static Log.default);
  swift_bridgeObjectRetain_n();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v49 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v45 = (void (*)(char *, unint64_t, uint64_t))(v10 + 4);
    type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for TUConversationActivitySessionContainer);
    lazy protocol witness table accessor for type UUID and conformance UUID();
    uint64_t v12 = v6;
    swift_bridgeObjectRetain();
    uint64_t v13 = Dictionary.description.getter();
    unint64_t v15 = v14;
    swift_bridgeObjectRelease();
    uint64_t v16 = v13;
    uint64_t v6 = v12;
    uint64_t v48 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v15, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A375F000, v8, v9, "ConversationManager received event conversationsByGroupUUID: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A624F870](v11, -1, -1);
    MEMORY[0x1A624F870](v10, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v49 = MEMORY[0x1E4FBC868];
  uint64_t v17 = swift_bridgeObjectRetain();
  specialized Sequence.forEach(_:)(v17, &v49);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v18 = swift_bridgeObjectRetain();
  uint64_t v19 = specialized Sequence.filter(_:)(v18, a1);
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(v19 + 16);
  v38[1] = v19;
  if (v20)
  {
    uint64_t v22 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
    uint64_t v21 = v2 + 16;
    uint64_t v45 = v22;
    unint64_t v23 = v19 + ((*(unsigned __int8 *)(v21 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 64));
    uint64_t v24 = *(void *)(v21 + 56);
    uint64_t v43 = (unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 32);
    uint64_t v41 = (void (**)(char *, char *, uint64_t))(v21 + 16);
    swift_bridgeObjectRetain();
    int64_t v44 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 40);
    v38[0] = (v21 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    unint64_t v39 = (void (**)(unint64_t, uint64_t))(v21 - 8);
    uint64_t v40 = (v21 - 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v42 = v21;
    uint64_t v25 = v46;
    while (1)
    {
      v45(v6, v23, v25);
      uint64_t v27 = *v44;
      (*v44)(v6, 0, 1, v25);
      if ((*v43)(v6, 1, v25) == 1) {
        break;
      }
      uint64_t v28 = (uint64_t)v47;
      int64_t v29 = v6;
      (*v41)(v47, v6, v25);
      uint64_t v30 = v49;
      swift_bridgeObjectRetain();
      unint64_t v31 = specialized __RawDictionaryStorage.find<A>(_:)(v28);
      char v33 = v32;
      swift_bridgeObjectRelease();
      if (v33)
      {
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v48 = v30;
        uint64_t v49 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          specialized _NativeDictionary.copy()();
          uint64_t v30 = v48;
        }
        int64_t v26 = *v39;
        uint64_t v25 = v46;
        (*v39)(*(void *)(v30 + 48) + v31 * v24, v46);
        uint64_t v35 = v48;
        specialized _NativeDictionary._delete(at:)(v31, v48);
        uint64_t v49 = v35;
        swift_release();
        swift_bridgeObjectRelease();
      }
      else
      {
        int64_t v26 = *v39;
        uint64_t v25 = v46;
      }
      v26((unint64_t)v47, v25);
      v23 += v24;
      --v20;
      uint64_t v6 = v29;
      if (!v20)
      {
        v27(v29, 1, 1, v25);
        break;
      }
    }
  }
  else
  {
    char v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56);
    swift_bridgeObjectRetain();
    v36(v6, 1, 1, v46);
  }
  swift_bridgeObjectRelease_n();
  return v49;
}

unint64_t lazy protocol witness table accessor for type UUID and conformance UUID()
{
  unint64_t result = lazy protocol witness table cache variable for type UUID and conformance UUID;
  if (!lazy protocol witness table cache variable for type UUID and conformance UUID)
  {
    type metadata accessor for UUID();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID);
  }
  return result;
}

uint64_t partial apply for closure #1 in closure #2 in ConversationManager.updateConversations(conversationsByGroupUUID:)(id *a1)
{
  return closure #1 in closure #2 in ConversationManager.updateConversations(conversationsByGroupUUID:)(a1) & 1;
}

Swift::Void __swiftcall GroupSession.associateScene(persistentIdentifier:)(Swift::String persistentIdentifier)
{
  uint64_t v2 = v1;
  object = persistentIdentifier._object;
  uint64_t countAndFlagsBits = persistentIdentifier._countAndFlagsBits;
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  uint64_t v30 = *(void *)(v9 - 8);
  uint64_t v31 = v9;
  MEMORY[0x1F4188790](v9);
  int64_t v29 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Log.default);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v28 = v8;
    uint64_t v15 = v14;
    uint64_t v25 = swift_slowAlloc();
    aBlock[0] = v25;
    *(_DWORD *)uint64_t v15 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v32 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, aBlock);
    uint64_t v26 = countAndFlagsBits;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2080;
    uint64_t v16 = GroupSession.description.getter();
    uint64_t v27 = v6;
    uint64_t v17 = v5;
    unint64_t v19 = v18;
    swift_release();
    uint64_t v32 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v19, aBlock);
    uint64_t countAndFlagsBits = v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    uint64_t v5 = v17;
    uint64_t v6 = v27;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A375F000, v12, v13, "Application called associateScene with sceneID:%s on %s", (uint8_t *)v15, 0x16u);
    uint64_t v20 = v25;
    swift_arrayDestroy();
    MEMORY[0x1A624F870](v20, -1, -1);
    uint64_t v21 = v15;
    uint64_t v8 = v28;
    MEMORY[0x1A624F870](v21, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  uint64_t v22 = (void *)swift_allocObject();
  uint64_t v22[2] = v2;
  v22[3] = countAndFlagsBits;
  v22[4] = object;
  aBlock[4] = (uint64_t)partial apply for closure #1 in GroupSession.associateScene(persistentIdentifier:);
  aBlock[5] = (uint64_t)v22;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  void aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed @Sendable () -> ();
  uint64_t aBlock[3] = (uint64_t)&block_descriptor_13;
  unint64_t v23 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v24 = v29;
  static DispatchQoS.unspecified.getter();
  uint64_t v32 = MEMORY[0x1E4FBC860];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x1A624E5F0](0, v24, v8, v23);
  _Block_release(v23);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v24, v31);
  swift_release();
}

uint64_t closure #1 in GroupSession.associateScene(persistentIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (id *)(a1 + *(void *)(*(void *)a1 + 280));
  swift_beginAccess();
  id v7 = *v6;
  uint64_t v8 = XPCClient.queue.getter();

  uint64_t v9 = (void *)swift_allocObject();
  void v9[2] = a1;
  v9[3] = a2;
  v9[4] = a3;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = partial apply for closure #1 in closure #1 in GroupSession.associateScene(persistentIdentifier:);
  *(void *)(v10 + 24) = v9;
  aBlock[4] = thunk for @callee_guaranteed () -> ()partial apply;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  void aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  uint64_t aBlock[3] = &block_descriptor_19_0;
  uint64_t v11 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v8, v11);

  _Block_release(v11);
  LOBYTE(a3) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (a3) {
    __break(1u);
  }
  return result;
}

uint64_t partial apply for closure #1 in GroupSession.associateScene(persistentIdentifier:)()
{
  return closure #1 in GroupSession.associateScene(persistentIdentifier:)(v0[2], v0[3], v0[4]);
}

uint64_t block_copy_helper_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

void closure #1 in closure #1 in GroupSession.associateScene(persistentIdentifier:)(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + *(void *)(*(void *)a1 + 280));
  swift_beginAccess();
  id v2 = *v1;
  XPCClient.withHost(body:errorHandler:)();
}

Swift::Void __swiftcall GroupSession.disassociateScene()()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v22 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v21 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)static Log.default);
  swift_retain();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    unint64_t v19 = v4;
    uint64_t v12 = v11;
    aBlock[0] = v11;
    uint64_t v20 = v5;
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v13 = GroupSession.description.getter();
    uint64_t v23 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, aBlock);
    uint64_t v5 = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A375F000, v8, v9, "Application called disassociateScene on %s", v10, 0xCu);
    swift_arrayDestroy();
    uint64_t v15 = v12;
    uint64_t v4 = v19;
    MEMORY[0x1A624F870](v15, -1, -1);
    MEMORY[0x1A624F870](v10, -1, -1);
  }
  else
  {

    swift_release();
  }
  aBlock[4] = (uint64_t)partial apply for closure #1 in GroupSession.disassociateScene();
  aBlock[5] = v0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  void aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed @Sendable () -> ();
  uint64_t aBlock[3] = (uint64_t)&block_descriptor_3;
  uint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  uint64_t v17 = v21;
  static DispatchQoS.unspecified.getter();
  uint64_t v23 = MEMORY[0x1E4FBC860];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x1A624E5F0](0, v17, v4, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v17, v5);
  swift_release();
}

uint64_t closure #1 in GroupSession.disassociateScene()(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + *(void *)(*(void *)a1 + 280));
  swift_beginAccess();
  id v3 = *v2;
  uint64_t v4 = XPCClient.queue.getter();

  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = partial apply for closure #1 in closure #1 in GroupSession.disassociateScene();
  *(void *)(v5 + 24) = a1;
  aBlock[4] = _sIg_Ieg_TRTA_0;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  void aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  uint64_t aBlock[3] = &block_descriptor_9;
  uint64_t v6 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v4, v6);

  _Block_release(v6);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v4) {
    __break(1u);
  }
  return result;
}

void closure #1 in closure #1 in GroupSession.disassociateScene()(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + *(void *)(*(void *)a1 + 280));
  swift_beginAccess();
  id v2 = *v1;
  XPCClient.withHost(body:errorHandler:)();
}

id closure #1 in closure #1 in closure #1 in GroupSession.disassociateScene()(id *a1)
{
  return objc_msgSend(*a1, sel_disassociateScene);
}

uint64_t partial apply for closure #1 in GroupSession.disassociateScene()()
{
  return closure #1 in GroupSession.disassociateScene()(v0);
}

void partial apply for closure #1 in closure #1 in GroupSession.disassociateScene()()
{
  closure #1 in closure #1 in GroupSession.disassociateScene()(v0);
}

uint64_t sub_1A38E84E4()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void partial apply for closure #1 in closure #1 in GroupSession.associateScene(persistentIdentifier:)()
{
  closure #1 in closure #1 in GroupSession.associateScene(persistentIdentifier:)(*(void *)(v0 + 16));
}

uint64_t sub_1A38E8504()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

void partial apply for closure #1 in closure #1 in closure #1 in GroupSession.associateScene(persistentIdentifier:)(void **a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v4 = *a1;
  uint64_t v5 = (void *)MEMORY[0x1A624DFA0](v3, v2);
  objc_msgSend(v4, sel_associateSceneWithSceneID_, v5);
}

void SystemCoordinator.setDefaultSpatialTemplatePreference(_:for:)()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 16) + 16);
  os_unfair_lock_lock(v1);
  partial apply for specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(v2);
  os_unfair_lock_unlock(v1);
}

void closure #1 in SystemCoordinator.setDefaultSpatialTemplatePreference(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5)
{
  uint64_t v10 = (uint64_t *)(a1 + OBJC_IVAR____TtC15GroupActivities17SystemCoordinator_defaultSpatialTemplatePreferences);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = *v10;
  *uint64_t v10 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a4, a5 & 0xFF01, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v10 = v12;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  os_unfair_lock_assert_owner((const os_unfair_lock *)(*(void *)(a1 + 16) + 16));
  SystemCoordinator.refreshConfiguration()();
}

void partial apply for closure #1 in SystemCoordinator.setDefaultSpatialTemplatePreference(_:for:)()
{
  closure #1 in SystemCoordinator.setDefaultSpatialTemplatePreference(_:for:)(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(unsigned __int8 *)(v0 + 48) | (*(unsigned __int8 *)(v0 + 49) << 8));
}

Swift::Void __swiftcall SystemCoordinator.clearDefaultSpatialTemplatePreference(for:)(Swift::String a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(v1 + 16) + 16);
  os_unfair_lock_lock(v2);
  closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)specialized partial apply(v3);
  os_unfair_lock_unlock(v2);
}

void closure #1 in SystemCoordinator.clearDefaultSpatialTemplatePreference(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  specialized Dictionary._Variant.removeValue(forKey:)(a2, a3, (uint64_t)v6);
  swift_bridgeObjectRelease();
  swift_endAccess();
  os_unfair_lock_assert_owner((const os_unfair_lock *)(*(void *)(a1 + 16) + 16));
  SystemCoordinator.refreshConfiguration()();
}

void SystemCoordinator.setDefaultSpatialTemplateRole(_:for:)()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 16) + 16);
  os_unfair_lock_lock(v1);
  closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)specialized partial apply(v2);
  os_unfair_lock_unlock(v1);
}

void closure #1 in SystemCoordinator.setDefaultSpatialTemplateRole(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  outlined init with copy of AudioSessionAssertionManager(a4, (uint64_t)v7);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  specialized Dictionary.subscript.setter((uint64_t)v7, a2, a3);
  swift_endAccess();
  os_unfair_lock_assert_owner((const os_unfair_lock *)(*(void *)(a1 + 16) + 16));
  SystemCoordinator.refreshConfiguration()();
}

Swift::Void __swiftcall SystemCoordinator.clearDefaultSpatialTemplateRole(for:)(Swift::String a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(*(void *)(v1 + 16) + 16);
  os_unfair_lock_lock(v2);
  closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)specialized partial apply(v3);
  os_unfair_lock_unlock(v2);
}

void closure #1 in SystemCoordinator.clearDefaultSpatialTemplateRole(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = 0;
  memset(v6, 0, sizeof(v6));
  swift_beginAccess();
  swift_bridgeObjectRetain();
  specialized Dictionary.subscript.setter((uint64_t)v6, a2, a3);
  swift_endAccess();
  os_unfair_lock_assert_owner((const os_unfair_lock *)(*(void *)(a1 + 16) + 16));
  SystemCoordinator.refreshConfiguration()();
}

uint64_t partial apply for specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(uint64_t a1)
{
  return specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(a1, *(uint64_t (**)(void))(v1 + 16));
}

void partial apply for closure #1 in SystemCoordinator.clearDefaultSpatialTemplatePreference(for:)()
{
  closure #1 in SystemCoordinator.clearDefaultSpatialTemplatePreference(for:)(v0[2], v0[3], v0[4]);
}

void partial apply for closure #1 in SystemCoordinator.setDefaultSpatialTemplateRole(_:for:)()
{
  closure #1 in SystemCoordinator.setDefaultSpatialTemplateRole(_:for:)(v0[2], v0[3], v0[4], v0[5]);
}

void partial apply for closure #1 in SystemCoordinator.clearDefaultSpatialTemplateRole(for:)()
{
  closure #1 in SystemCoordinator.clearDefaultSpatialTemplateRole(for:)(v0[2], v0[3], v0[4]);
}

uint64_t closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)specialized partial apply(uint64_t a1)
{
  return partial apply for specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(a1);
}

uint64_t protocol witness for AssetDownloadCoordinator.result() in conformance AssetDownloadCoordinator(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x1E4F59180] + MEMORY[0x1E4F59180]);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v5(a1);
}

uint64_t protocol witness for AssetDownloadCoordinator.receive(signal:) in conformance AssetDownloadCoordinator(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x1E4F59188] + MEMORY[0x1E4F59188]);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v5(a1);
}

uint64_t protocol witness for AssetUploadCoordinator.assetSkeleton.getter in conformance AssetUploadCoordinator(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x1E4F59168] + MEMORY[0x1E4F59168]);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = protocol witness for AnyTransportSession.removeAttachment(id:) in conformance GroupSession<A>;
  return v5(a1);
}

uint64_t protocol witness for AssetUploadCoordinator.signals.getter in conformance AssetUploadCoordinator(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x1E4F59178] + MEMORY[0x1E4F59178]);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v5(a1);
}

uint64_t protocol witness for AssetUploadCoordinator.result() in conformance AssetUploadCoordinator(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x1E4F59170] + MEMORY[0x1E4F59170]);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = protocol witness for AnyTransportSession.removeAttachment(id:) in conformance GroupSession<A>;
  return v5(a1);
}

uint64_t AssetManager.process(request:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = AssetManager.process(request:);
  return MEMORY[0x1F4111C20](a2);
}

{
  uint64_t v2;
  void *v4;
  uint64_t v6;

  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = AssetManager.process(request:);
  return MEMORY[0x1F4111C28](a2);
}

uint64_t AssetManager.process(request:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return MEMORY[0x1F4188298](AssetManager.process(request:), 0, 0);
  }
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v8;

  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return MEMORY[0x1F4188298](AssetManager.process(request:), 0, 0);
  }
}

uint64_t protocol witness for AssetManager.process(request:) in conformance AssetManager(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return MEMORY[0x1F4111C10](a1, a2);
}

{
  uint64_t v2;
  void *v4;
  uint64_t v6;

  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = protocol witness for AssetManager.process(request:) in conformance AssetManager;
  return MEMORY[0x1F4111C20](a2);
}

{
  uint64_t v2;
  void *v5;
  uint64_t v7;

  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return MEMORY[0x1F4111C18](a1, a2);
}

{
  uint64_t v2;
  void *v4;
  uint64_t v6;

  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = protocol witness for AssetManager.process(request:) in conformance AssetManager;
  return MEMORY[0x1F4111C28](a2);
}

uint64_t protocol witness for AssetManager.process(request:) in conformance AssetManager(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return MEMORY[0x1F4188298](protocol witness for AssetManager.process(request:) in conformance AssetManager, 0, 0);
  }
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v8;

  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return MEMORY[0x1F4188298](protocol witness for AssetManager.process(request:) in conformance AssetManager, 0, 0);
  }
}

uint64_t protocol witness for AssetManager.process(request:) in conformance AssetManager()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = (void *)v0[2];
  v2[3] = type metadata accessor for AssetUploadCoordinator();
  v2[4] = &protocol witness table for AssetUploadCoordinator;
  void *v2 = v1;
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  uint64_t v1 = v0[4];
  uint64_t v2 = (void *)v0[2];
  v2[3] = type metadata accessor for AssetDownloadCoordinator();
  v2[4] = &protocol witness table for AssetDownloadCoordinator;
  void *v2 = v1;
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t dispatch thunk of AssetManager.process(request:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 8) + **(int **)(a4 + 8));
  os_log_type_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *os_log_type_t v9 = v4;
  v9[1] = protocol witness for AnyTransportSession.removeAttachment(id:) in conformance GroupSession<A>;
  return v11(a1, a2, a3, a4);
}

{
  uint64_t v4;
  void *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  os_log_type_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *os_log_type_t v9 = v4;
  v9[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v11(a1, a2, a3, a4);
}

{
  uint64_t v4;
  void *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 24) + **(int **)(a4 + 24));
  os_log_type_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *os_log_type_t v9 = v4;
  v9[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v11(a1, a2, a3, a4);
}

{
  uint64_t v4;
  void *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 32) + **(int **)(a4 + 32));
  os_log_type_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *os_log_type_t v9 = v4;
  v9[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of AssetUploadCoordinator.assetSkeleton.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of AssetUploadCoordinator.signals.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of AssetUploadCoordinator.result()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 24) + **(int **)(a3 + 24));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of AssetDownloadCoordinator.result()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of AssetDownloadCoordinator.receive(signal:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_type_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = protocol witness for AnyTransportSession.downloadAttachment(_:) in conformance GroupSession<A>;
  return v9(a1, a2, a3);
}

void GroupActivityMetadata.init(_:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  v104 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v101 = (char *)&v87 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GroupActivityDescription?);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  uint64_t v89 = (uint64_t)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v92 = (char *)&v87 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GroupActivityMetadata.ActivityType?);
  MEMORY[0x1F4188790](v12 - 8);
  unint64_t v14 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for GroupActivityMetadata.ActivityType(0);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v91 = (uint64_t)&v87 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for generic != -1) {
    swift_once();
  }
  uint64_t v90 = v15;
  uint64_t v87 = __swift_project_value_buffer(v15, (uint64_t)static GroupActivityMetadata.ActivityType.generic);
  _s15GroupActivities0A16ActivityMetadataV0C4TypeVWOcTm_1(v87, a2, type metadata accessor for GroupActivityMetadata.ActivityType);
  uint64_t v18 = (int *)type metadata accessor for GroupActivityMetadata(0);
  unint64_t v19 = (uint64_t *)(a2 + v18[5]);
  *unint64_t v19 = 0;
  v19[1] = 0;
  uint64_t v20 = (uint64_t *)(a2 + v18[6]);
  *uint64_t v20 = 0;
  v20[1] = 0;
  uint64_t v93 = v20;
  uint64_t v88 = v18[7];
  *(void *)(a2 + v88) = 0;
  uint64_t v21 = a2 + v18[8];
  uint64_t v22 = type metadata accessor for URL();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(void (**)(void))(v23 + 56);
  uint64_t v25 = v23 + 56;
  uint64_t v96 = v21;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v24)(v21, 1, 1, v22);
  uint64_t v95 = v18[9];
  *(void *)(a2 + v95) = 0;
  char v26 = dyld_program_sdk_at_least();
  uint64_t v94 = v18[10];
  *(unsigned char *)(a2 + v94) = v26 ^ 1;
  uint64_t v97 = a2 + v18[11];
  uint64_t v98 = v25;
  v99 = v24;
  uint64_t v100 = v22;
  v24();
  uint64_t v27 = a2 + v18[12];
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v28 = qword_1EB58E160;
  uint64_t v29 = qword_1EB58E178;
  *(unsigned char *)uint64_t v27 = static SceneAssociationBehavior.default;
  *(void *)(v27 + 8) = v28;
  *(_OWORD *)(v27 + 16) = xmmword_1EB58E168;
  *(void *)(v27 + 32) = v29;
  uint64_t v102 = v18[13];
  *(unsigned char *)(a2 + v102) = 0;
  uint64_t v103 = v18[14];
  *(void *)(a2 + v103) = 2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v105 = a1;
  id v30 = objc_msgSend(a1, sel_context);
  id v31 = objc_msgSend(v30, sel_typedIdentifier);

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v32 = (uint64_t)v92;
  GroupActivityDescription.init(id:)();
  uint64_t v33 = v89;
  outlined init with copy of URL?(v32, v89, &demangling cache variable for type metadata for GroupActivityDescription?);
  uint64_t v34 = type metadata accessor for GroupActivityDescription();
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = 1;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34) != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 32))(v14, v33, v34);
    uint64_t v36 = 0;
  }
  uint64_t v37 = v36;
  uint64_t v38 = v90;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, v37, 1, v90);
  outlined destroy of OS_dispatch_queue.SchedulerOptions?(v32, &demangling cache variable for type metadata for GroupActivityDescription?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v38) == 1)
  {
    uint64_t v39 = v91;
    _s15GroupActivities0A16ActivityMetadataV0C4TypeVWOcTm_1(v87, v91, type metadata accessor for GroupActivityMetadata.ActivityType);
    outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v14, &demangling cache variable for type metadata for GroupActivityMetadata.ActivityType?);
  }
  else
  {
    uint64_t v39 = v91;
    outlined init with take of GroupActivityMetadata.ActivityType((uint64_t)v14, v91);
  }
  id v40 = v105;
  uint64_t v41 = v99;
  outlined assign with take of GroupActivityMetadata.ActivityType(v39, a2);
  id v42 = objc_msgSend(v40, sel_title);
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v46 = v45;
  }
  else
  {
    uint64_t v44 = 0;
    uint64_t v46 = 0;
  }
  swift_bridgeObjectRelease();
  *unint64_t v19 = v44;
  v19[1] = v46;
  id v47 = objc_msgSend(v40, sel_subTitle);
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v51 = v50;
  }
  else
  {
    uint64_t v49 = 0;
    uint64_t v51 = 0;
  }
  uint64_t v52 = v100;
  uint64_t v53 = v93;
  swift_bridgeObjectRelease();
  *uint64_t v53 = v49;
  v53[1] = v51;
  id v54 = objc_msgSend(v40, sel_imageData);
  if (v54)
  {
    unint64_t v55 = v54;
    uint64_t v56 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v58 = v57;

    CGImageRef v59 = specialized static CGImageRef.thumbnailImage(from:)();
    unint64_t v60 = v58;
    id v40 = v105;
    outlined consume of Data._Representation(v56, v60);
    uint64_t v61 = v88;

    *(void *)(a2 + v61) = v59;
  }
  id v62 = objc_msgSend(v40, sel_fallbackURL);
  uint64_t v63 = (uint64_t)v104;
  if (v62)
  {
    uint64_t v64 = v62;
    uint64_t v65 = (uint64_t)v101;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v66 = 0;
  }
  else
  {
    uint64_t v66 = 1;
    uint64_t v65 = (uint64_t)v101;
  }
  uint64_t v67 = 1;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v41)(v65, v66, 1, v52);
  outlined assign with take of URL?(v65, v96);
  id v68 = objc_msgSend(v40, sel_preferredBroadcastingAttributes);
  *(void *)(a2 + v95) = v68;
  unsigned __int8 v69 = objc_msgSend(v40, sel_supportsContinuationOnTV);
  *(unsigned char *)(a2 + v94) = v69;
  id v70 = objc_msgSend(v40, sel_invitationURL);
  if (v70)
  {
    unint64_t v71 = v70;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v67 = 0;
  }
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v41)(v63, v67, 1, v52);
  outlined assign with take of URL?(v63, v97);
  id v72 = objc_msgSend(v40, sel_sceneAssociationBehavior);
  unsigned __int8 v73 = objc_msgSend(v72, sel_shouldAssociateScene);
  id v74 = objc_msgSend(v72, sel_targetContentIdentifier);
  if (v74)
  {
    unint64_t v75 = v74;
    uint64_t v76 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v78 = v77;
  }
  else
  {
    uint64_t v76 = 0;
    uint64_t v78 = 0;
  }
  swift_bridgeObjectRetain();
  id v79 = objc_msgSend(v72, sel_preferredSceneSessionRole);
  if (v79)
  {
    v80 = v79;
    uint64_t v81 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v83 = v82;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();

    uint64_t v81 = 0;
    uint64_t v83 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(unsigned char *)uint64_t v27 = v73;
  *(void *)(v27 + 8) = v76;
  *(void *)(v27 + 16) = v78;
  *(void *)(v27 + 24) = v81;
  *(void *)(v27 + 32) = v83;
  id v84 = v105;
  unsigned __int8 v85 = objc_msgSend(v105, sel_supportsActivityPreviews);
  *(unsigned char *)(a2 + v102) = v85;
  id v86 = objc_msgSend(v84, sel_lifetimePolicy);

  *(void *)(a2 + v103) = v86;
}

uint64_t GroupActivityMetadata.init()@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for generic != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for GroupActivityMetadata.ActivityType(0);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static GroupActivityMetadata.ActivityType.generic);
  _s15GroupActivities0A16ActivityMetadataV0C4TypeVWOcTm_1(v3, a1, type metadata accessor for GroupActivityMetadata.ActivityType);
  uint64_t v4 = (int *)type metadata accessor for GroupActivityMetadata(0);
  uint64_t v5 = (void *)(a1 + v4[5]);
  *uint64_t v5 = 0;
  v5[1] = 0;
  uint64_t v6 = (void *)(a1 + v4[6]);
  void *v6 = 0;
  v6[1] = 0;
  *(void *)(a1 + v4[7]) = 0;
  uint64_t v7 = a1 + v4[8];
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  *(void *)(a1 + v4[9]) = 0;
  *(unsigned char *)(a1 + v4[10]) = dyld_program_sdk_at_least() ^ 1;
  v9(a1 + v4[11], 1, 1, v8);
  uint64_t v10 = v4[12];
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v11 = a1 + v10;
  uint64_t v12 = qword_1EB58E160;
  uint64_t v13 = qword_1EB58E178;
  *(unsigned char *)uint64_t v11 = static SceneAssociationBehavior.default;
  *(void *)(v11 + 8) = v12;
  *(_OWORD *)(v11 + 16) = xmmword_1EB58E168;
  *(void *)(v11 + 32) = v13;
  *(unsigned char *)(a1 + v4[13]) = 0;
  *(void *)(a1 + v4[14]) = 2;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

id GroupActivityMetadata.tuMetadata.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v40 - v6;
  uint64_t v8 = (int *)type metadata accessor for GroupActivityMetadata(0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GroupActivityMetadata.ActivityType?);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for GroupActivityMetadata.ActivityType(0);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  GroupActivityMetadata.infoDictionaryActivityType.getter((uint64_t)v13);
  _s15GroupActivities0A16ActivityMetadataV0C4TypeVWOcTm_1(v1, (uint64_t)v10, type metadata accessor for GroupActivityMetadata);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    _s15GroupActivities0A16ActivityMetadataV0C4TypeVWOcTm_1((uint64_t)v10, (uint64_t)v17, type metadata accessor for GroupActivityMetadata.ActivityType);
    _s15GroupActivities0A16ActivityMetadataVWOhTm_0((uint64_t)v10, type metadata accessor for GroupActivityMetadata);
    outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v13, &demangling cache variable for type metadata for GroupActivityMetadata.ActivityType?);
  }
  else
  {
    _s15GroupActivities0A16ActivityMetadataVWOhTm_0((uint64_t)v10, type metadata accessor for GroupActivityMetadata);
    outlined init with take of GroupActivityMetadata.ActivityType((uint64_t)v13, (uint64_t)v17);
  }
  id v47 = (void *)GroupActivityDescription.tuActivityContext.getter();
  uint64_t v48 = v7;
  outlined init with copy of URL?(v1 + v8[8], (uint64_t)v7, &demangling cache variable for type metadata for URL?);
  outlined init with copy of URL?(v1 + v8[11], (uint64_t)v5, &demangling cache variable for type metadata for URL?);
  int v46 = *(unsigned __int8 *)(v1 + v8[10]);
  uint64_t v18 = (uint64_t *)(v1 + v8[5]);
  uint64_t v19 = *v18;
  uint64_t v20 = v18[1];
  uint64_t v21 = (uint64_t *)(v1 + v8[6]);
  uint64_t v22 = v21[1];
  uint64_t v44 = *v21;
  uint64_t v45 = v19;
  uint64_t v23 = *(void *)(v1 + v8[7]);
  uint64_t v49 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v23)
  {
    CGImageRef.thumbnailImageData(_:)(300);
    unint64_t v42 = v25;
    uint64_t v43 = v24;
  }
  else
  {
    unint64_t v42 = 0xF000000000000000;
    uint64_t v43 = 0;
  }
  uint64_t v41 = *(void *)(v1 + v8[9]);
  char v26 = (void *)(v1 + v8[12]);
  uint64_t v27 = *(unsigned __int8 *)v26;
  uint64_t v29 = v26[2];
  uint64_t v28 = v26[3];
  uint64_t v30 = v26[4];
  if (!v29)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v32 = 0;
    if (v30) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v33 = 0;
    goto LABEL_12;
  }
  uint64_t v31 = v26[1];
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v32 = (void *)MEMORY[0x1A624DFA0](v31, v29);
  swift_bridgeObjectRelease();
  if (!v30) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v33 = (void *)MEMORY[0x1A624DFA0](v28, v30);
  swift_bridgeObjectRelease();
LABEL_12:
  id v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FADB50]), sel_initWithTargetContentIdentifier_shouldAssociateScene_preferredSceneSessionRole_, v32, v27, v33);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  char v35 = *(unsigned char *)(v1 + v8[13]);
  uint64_t v36 = *(void *)(v1 + v8[14]);
  id v37 = objc_allocWithZone(MEMORY[0x1E4FADB48]);
  id v38 = @nonobjc TUConversationActivityMetadata.init(context:linkMetadata:fallbackURL:invitationURL:supportsContinuationOnTV:title:subTitle:imageData:preferredBroadcastingAttributes:sceneAssociationBehavior:supportsActivityPreviews:lifetimePolicy:)(v47, 0, 0xF000000000000000, (uint64_t)v48, (uint64_t)v49, v46, v45, v20, v44, v22, v43, v42, v41, v34, v35, v36);
  _s15GroupActivities0A16ActivityMetadataVWOhTm_0((uint64_t)v17, type metadata accessor for GroupActivityMetadata.ActivityType);
  return v38;
}

uint64_t type metadata accessor for GroupActivityMetadata.ActivityType(uint64_t a1)
{
  return type metadata accessor for AnyGroupActivity.MetadataProvider(a1, (uint64_t *)&type metadata singleton initialization cache for GroupActivityMetadata.ActivityType);
}

uint64_t GroupActivityMetadata.ActivityType.description.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for GroupActivityDescription();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t GroupActivityMetadata.ActivityType.description.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for GroupActivityDescription();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*GroupActivityMetadata.ActivityType.description.modify())(void, void, void)
{
  return destructiveProjectEnumData for GroupSessionErrors;
}

uint64_t one-time initialization function for generic(uint64_t a1)
{
  return one-time initialization function for generic(a1, static GroupActivityMetadata.ActivityType.generic, MEMORY[0x1E4F5B018]);
}

uint64_t outlined assign with take of GroupActivityMetadata.ActivityType(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GroupActivityMetadata.ActivityType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined assign with take of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t GroupActivityMetadata.ActivityType.init(description:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for GroupActivityDescription();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);

  return v5(a2, a1, v4);
}

uint64_t static GroupActivityMetadata.ActivityType.generic.getter@<X0>(uint64_t a1@<X8>)
{
  return static GroupActivityMetadata.ActivityType.generic.getter(&one-time initialization token for generic, (uint64_t)static GroupActivityMetadata.ActivityType.generic, a1);
}

uint64_t one-time initialization function for collaboration(uint64_t a1)
{
  return one-time initialization function for generic(a1, static GroupActivityMetadata.ActivityType.collaboration, MEMORY[0x1E4F5AFD8]);
}

uint64_t one-time initialization function for generic(uint64_t a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v5 = type metadata accessor for GroupActivityDescription();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for GroupActivityMetadata.ActivityType(0);
  __swift_allocate_value_buffer(v9, a2);
  uint64_t v10 = __swift_project_value_buffer(v9, (uint64_t)a2);
  a3();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(v10, v8, v5);
}

uint64_t static GroupActivityMetadata.ActivityType.collaboration.getter@<X0>(uint64_t a1@<X8>)
{
  return static GroupActivityMetadata.ActivityType.generic.getter(&one-time initialization token for collaboration, (uint64_t)static GroupActivityMetadata.ActivityType.collaboration, a1);
}

uint64_t one-time initialization function for listenTogether(uint64_t a1)
{
  return one-time initialization function for generic(a1, static GroupActivityMetadata.ActivityType.listenTogether, MEMORY[0x1E4F5B000]);
}

uint64_t static GroupActivityMetadata.ActivityType.listenTogether.getter@<X0>(uint64_t a1@<X8>)
{
  return static GroupActivityMetadata.ActivityType.generic.getter(&one-time initialization token for listenTogether, (uint64_t)static GroupActivityMetadata.ActivityType.listenTogether, a1);
}

uint64_t one-time initialization function for watchTogether(uint64_t a1)
{
  return one-time initialization function for generic(a1, static GroupActivityMetadata.ActivityType.watchTogether, MEMORY[0x1E4F5AFF0]);
}

uint64_t static GroupActivityMetadata.ActivityType.watchTogether.getter@<X0>(uint64_t a1@<X8>)
{
  return static GroupActivityMetadata.ActivityType.generic.getter(&one-time initialization token for watchTogether, (uint64_t)static GroupActivityMetadata.ActivityType.watchTogether, a1);
}

uint64_t one-time initialization function for playTogether(uint64_t a1)
{
  return one-time initialization function for generic(a1, static GroupActivityMetadata.ActivityType.playTogether, MEMORY[0x1E4F5AFC0]);
}

uint64_t static GroupActivityMetadata.ActivityType.playTogether.getter@<X0>(uint64_t a1@<X8>)
{
  return static GroupActivityMetadata.ActivityType.generic.getter(&one-time initialization token for playTogether, (uint64_t)static GroupActivityMetadata.ActivityType.playTogether, a1);
}

uint64_t one-time initialization function for workoutTogether(uint64_t a1)
{
  return one-time initialization function for generic(a1, static GroupActivityMetadata.ActivityType.workoutTogether, MEMORY[0x1E4F5B010]);
}

uint64_t static GroupActivityMetadata.ActivityType.workoutTogether.getter@<X0>(uint64_t a1@<X8>)
{
  return static GroupActivityMetadata.ActivityType.generic.getter(&one-time initialization token for workoutTogether, (uint64_t)static GroupActivityMetadata.ActivityType.workoutTogether, a1);
}

uint64_t one-time initialization function for shopTogether(uint64_t a1)
{
  return one-time initialization function for generic(a1, static GroupActivityMetadata.ActivityType.shopTogether, MEMORY[0x1E4F5AFD0]);
}

uint64_t static GroupActivityMetadata.ActivityType.shopTogether.getter@<X0>(uint64_t a1@<X8>)
{
  return static GroupActivityMetadata.ActivityType.generic.getter(&one-time initialization token for shopTogether, (uint64_t)static GroupActivityMetadata.ActivityType.shopTogether, a1);
}

uint64_t one-time initialization function for readTogether(uint64_t a1)
{
  return one-time initialization function for generic(a1, static GroupActivityMetadata.ActivityType.readTogether, MEMORY[0x1E4F5AFC8]);
}

uint64_t static GroupActivityMetadata.ActivityType.readTogether.getter@<X0>(uint64_t a1@<X8>)
{
  return static GroupActivityMetadata.ActivityType.generic.getter(&one-time initialization token for readTogether, (uint64_t)static GroupActivityMetadata.ActivityType.readTogether, a1);
}

uint64_t one-time initialization function for exploreTogether(uint64_t a1)
{
  return one-time initialization function for generic(a1, static GroupActivityMetadata.ActivityType.exploreTogether, MEMORY[0x1E4F5B008]);
}

uint64_t static GroupActivityMetadata.ActivityType.exploreTogether.getter@<X0>(uint64_t a1@<X8>)
{
  return static GroupActivityMetadata.ActivityType.generic.getter(&one-time initialization token for exploreTogether, (uint64_t)static GroupActivityMetadata.ActivityType.exploreTogether, a1);
}

uint64_t one-time initialization function for learnTogether(uint64_t a1)
{
  return one-time initialization function for generic(a1, static GroupActivityMetadata.ActivityType.learnTogether, MEMORY[0x1E4F5AFE0]);
}

uint64_t static GroupActivityMetadata.ActivityType.learnTogether.getter@<X0>(uint64_t a1@<X8>)
{
  return static GroupActivityMetadata.ActivityType.generic.getter(&one-time initialization token for learnTogether, (uint64_t)static GroupActivityMetadata.ActivityType.learnTogether, a1);
}

uint64_t one-time initialization function for createTogether(uint64_t a1)
{
  return one-time initialization function for generic(a1, static GroupActivityMetadata.ActivityType.createTogether, MEMORY[0x1E4F5AFF8]);
}

uint64_t static GroupActivityMetadata.ActivityType.createTogether.getter@<X0>(uint64_t a1@<X8>)
{
  return static GroupActivityMetadata.ActivityType.generic.getter(&one-time initialization token for createTogether, (uint64_t)static GroupActivityMetadata.ActivityType.createTogether, a1);
}

uint64_t one-time initialization function for screenSharing(uint64_t a1)
{
  return one-time initialization function for generic(a1, static GroupActivityMetadata.ActivityType.screenSharing, MEMORY[0x1E4F5AFE8]);
}

uint64_t static GroupActivityMetadata.ActivityType.screenSharing.getter@<X0>(uint64_t a1@<X8>)
{
  return static GroupActivityMetadata.ActivityType.generic.getter(&one-time initialization token for screenSharing, (uint64_t)static GroupActivityMetadata.ActivityType.screenSharing, a1);
}

uint64_t static GroupActivityMetadata.ActivityType.generic.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for GroupActivityMetadata.ActivityType(0);
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  return _s15GroupActivities0A16ActivityMetadataV0C4TypeVWOcTm_1(v6, a3, type metadata accessor for GroupActivityMetadata.ActivityType);
}

uint64_t GroupActivityMetadata.ActivityType.hash(into:)()
{
  type metadata accessor for GroupActivityDescription();
  lazy protocol witness table accessor for type GroupActivityDescription and conformance GroupActivityDescription(&lazy protocol witness table cache variable for type GroupActivityDescription and conformance GroupActivityDescription, MEMORY[0x1E4F5B020]);

  return dispatch thunk of Hashable.hash(into:)();
}

Swift::Int GroupActivityMetadata.ActivityType.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GroupActivityMetadata.ActivityType()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GroupActivityMetadata.ActivityType()
{
  type metadata accessor for GroupActivityDescription();
  lazy protocol witness table accessor for type GroupActivityDescription and conformance GroupActivityDescription(&lazy protocol witness table cache variable for type GroupActivityDescription and conformance GroupActivityDescription, MEMORY[0x1E4F5B020]);

  return dispatch thunk of Hashable.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GroupActivityMetadata.ActivityType()
{
  return Hasher._finalize()();
}

uint64_t GroupActivityMetadata.LifetimePolicy.tuConversationActivityLifetimePolicy.getter()
{
  return *(void *)v0;
}

uint64_t GroupActivityMetadata.LifetimePolicy.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static GroupActivityMetadata.LifetimePolicy.automatic.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static GroupActivityMetadata.LifetimePolicy.endsWhenInitiatorLeaves.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void GroupActivityMetadata.LifetimePolicy.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

BOOL static GroupActivityMetadata.LifetimePolicy.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int GroupActivityMetadata.LifetimePolicy.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t GroupActivityMetadata.type.getter@<X0>(uint64_t a1@<X8>)
{
  return _s15GroupActivities0A16ActivityMetadataV0C4TypeVWOcTm_1(v1, a1, type metadata accessor for GroupActivityMetadata.ActivityType);
}

uint64_t GroupActivityMetadata.type.setter(uint64_t a1)
{
  return outlined assign with take of GroupActivityMetadata.ActivityType(a1, v1);
}

uint64_t (*GroupActivityMetadata.type.modify())(void, void, void)
{
  return destructiveProjectEnumData for GroupSessionErrors;
}

uint64_t (*GroupActivityMetadata.title.modify())(void, void, void)
{
  return destructiveProjectEnumData for GroupSessionErrors;
}

uint64_t (*GroupActivityMetadata.subtitle.modify())(void, void, void)
{
  return destructiveProjectEnumData for GroupSessionErrors;
}

void *GroupActivityMetadata.previewImage.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for GroupActivityMetadata(0) + 28));
  id v2 = v1;
  return v1;
}

void GroupActivityMetadata.previewImage.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for GroupActivityMetadata(0) + 28);

  *(void *)(v1 + v3) = a1;
}

uint64_t (*GroupActivityMetadata.previewImage.modify())(void, void, void)
{
  return destructiveProjectEnumData for GroupSessionErrors;
}

uint64_t GroupActivityMetadata.fallbackURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for GroupActivityMetadata(0);
  return outlined init with copy of URL?(v1 + *(int *)(v3 + 32), a1, &demangling cache variable for type metadata for URL?);
}

uint64_t GroupActivityMetadata.fallbackURL.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for GroupActivityMetadata(0) + 32);

  return outlined assign with take of URL?(a1, v3);
}

uint64_t (*GroupActivityMetadata.fallbackURL.modify())(void, void, void)
{
  return destructiveProjectEnumData for GroupSessionErrors;
}

uint64_t GroupActivityMetadata.preferredBroadcastOptions.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = type metadata accessor for GroupActivityMetadata(0);
  *a1 = *(void *)(v1 + *(int *)(result + 36));
  return result;
}

uint64_t (*GroupActivityMetadata.preferredBroadcastOptions.modify())(void, void, void)
{
  return destructiveProjectEnumData for GroupSessionErrors;
}

uint64_t GroupActivityMetadata.supportsContinuationOnTV.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GroupActivityMetadata(0) + 40));
}

uint64_t GroupActivityMetadata.supportsContinuationOnTV.setter(char a1)
{
  uint64_t result = type metadata accessor for GroupActivityMetadata(0);
  *(unsigned char *)(v1 + *(int *)(result + 40)) = a1;
  return result;
}

uint64_t (*GroupActivityMetadata.supportsContinuationOnTV.modify())(void, void, void)
{
  return destructiveProjectEnumData for GroupSessionErrors;
}

uint64_t GroupActivityMetadata.invitationURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for GroupActivityMetadata(0);
  return outlined init with copy of URL?(v1 + *(int *)(v3 + 44), a1, &demangling cache variable for type metadata for URL?);
}

uint64_t GroupActivityMetadata.invitationURL.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for GroupActivityMetadata(0) + 44);

  return outlined assign with take of URL?(a1, v3);
}

uint64_t (*GroupActivityMetadata.invitationURL.modify())(void, void, void)
{
  return destructiveProjectEnumData for GroupSessionErrors;
}

uint64_t GroupActivityMetadata.sceneAssociationBehavior.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for GroupActivityMetadata(0) + 48);
  uint64_t v4 = *(void *)(v3 + 8);
  uint64_t v5 = *(void *)(v3 + 32);
  *(unsigned char *)a1 = *(unsigned char *)v3;
  *(void *)(a1 + 8) = v4;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v3 + 16);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

__n128 GroupActivityMetadata.sceneAssociationBehavior.setter(char *a1)
{
  char v2 = *a1;
  __n128 v7 = *(__n128 *)(a1 + 8);
  uint64_t v3 = *((void *)a1 + 3);
  uint64_t v4 = *((void *)a1 + 4);
  uint64_t v5 = v1 + *(int *)(type metadata accessor for GroupActivityMetadata(0) + 48);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(unsigned char *)uint64_t v5 = v2;
  __n128 result = v7;
  *(__n128 *)(v5 + 8) = v7;
  *(void *)(v5 + 24) = v3;
  *(void *)(v5 + 32) = v4;
  return result;
}

uint64_t (*GroupActivityMetadata.sceneAssociationBehavior.modify())(void, void, void)
{
  return destructiveProjectEnumData for GroupSessionErrors;
}

uint64_t GroupActivityMetadata.supportsActivityPreviews.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GroupActivityMetadata(0) + 52));
}

uint64_t GroupActivityMetadata.supportsActivityPreviews.setter(char a1)
{
  uint64_t result = type metadata accessor for GroupActivityMetadata(0);
  *(unsigned char *)(v1 + *(int *)(result + 52)) = a1;
  return result;
}

uint64_t (*GroupActivityMetadata.supportsActivityPreviews.modify(uint64_t a1))(uint64_t result)
{
  *(void *)a1 = v1;
  uint64_t v3 = *(int *)(type metadata accessor for GroupActivityMetadata(0) + 52);
  *(_DWORD *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(v1 + v3);
  return GroupActivityMetadata.supportsActivityPreviews.modify;
}

uint64_t GroupActivityMetadata.supportsActivityPreviews.modify(uint64_t result)
{
  *(unsigned char *)(*(void *)result + *(int *)(result + 8)) = *(unsigned char *)(result + 12);
  return result;
}

uint64_t GroupActivityMetadata.lifetimePolicy.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = type metadata accessor for GroupActivityMetadata(0);
  *a1 = *(void *)(v1 + *(int *)(result + 56));
  return result;
}

uint64_t GroupActivityMetadata.lifetimePolicy.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = type metadata accessor for GroupActivityMetadata(0);
  *(void *)(v1 + *(int *)(result + 56)) = v2;
  return result;
}

uint64_t (*GroupActivityMetadata.lifetimePolicy.modify())(void, void, void)
{
  return destructiveProjectEnumData for GroupSessionErrors;
}

GroupActivities::GroupActivityMetadata::CodingKeys_optional __swiftcall GroupActivityMetadata.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  object = stringValue._object;
  v2._uint64_t countAndFlagsBits = stringValue._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of GroupActivityMetadata.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return (GroupActivities::GroupActivityMetadata::CodingKeys_optional)3;
  }
  else {
    return (GroupActivities::GroupActivityMetadata::CodingKeys_optional)v3;
  }
}

GroupActivities::GroupActivityMetadata::CodingKeys_optional __swiftcall GroupActivityMetadata.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (GroupActivities::GroupActivityMetadata::CodingKeys_optional)3;
}

uint64_t GroupActivityMetadata.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t GroupActivityMetadata.CodingKeys.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x6B6361626C6C6166;
  }
  if (a1 == 1) {
    return 0x6974617469766E69;
  }
  return 0xD000000000000018;
}

uint64_t GroupActivityMetadata.CodingKeys.stringValue.getter(char a1)
{
  if (!a1) {
    return 0x6B6361626C6C6166;
  }
  if (a1 == 1) {
    return 0x6974617469766E69;
  }
  return 0xD000000000000018;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GroupActivityMetadata.CodingKeys(unsigned char *a1, unsigned char *a2)
{
  int v2 = *a1;
  unint64_t v3 = 0x6974617469766E69;
  unint64_t v4 = 0xED00004C52556E6FLL;
  unint64_t v5 = 0x80000001A38FFAE0;
  if (v2 != 1)
  {
    unint64_t v3 = 0xD000000000000018;
    unint64_t v4 = 0x80000001A38FFAE0;
  }
  if (*a1) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0x6B6361626C6C6166;
  }
  if (v2) {
    unint64_t v7 = v4;
  }
  else {
    unint64_t v7 = 0xEB000000004C5255;
  }
  unint64_t v8 = 0x6974617469766E69;
  if (*a2 == 1) {
    unint64_t v5 = 0xED00004C52556E6FLL;
  }
  else {
    unint64_t v8 = 0xD000000000000018;
  }
  if (*a2) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0x6B6361626C6C6166;
  }
  if (*a2) {
    unint64_t v10 = v5;
  }
  else {
    unint64_t v10 = 0xEB000000004C5255;
  }
  if (v6 == v9 && v7 == v10) {
    char v11 = 1;
  }
  else {
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GroupActivityMetadata.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GroupActivityMetadata.CodingKeys()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GroupActivityMetadata.CodingKeys()
{
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance GroupActivityMetadata.CodingKeys@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized GroupActivityMetadata.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance GroupActivityMetadata.CodingKeys(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEB000000004C5255;
  unint64_t v4 = 0xED00004C52556E6FLL;
  unint64_t v5 = 0x6974617469766E69;
  if (v2 != 1)
  {
    unint64_t v5 = 0xD000000000000018;
    unint64_t v4 = 0x80000001A38FFAE0;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6B6361626C6C6166;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GroupActivityMetadata.CodingKeys()
{
  unint64_t v1 = 0x6974617469766E69;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000018;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6B6361626C6C6166;
  }
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance GroupActivityMetadata.CodingKeys@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized GroupActivityMetadata.CodingKeys.init(rawValue:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GroupActivityMetadata.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GroupActivityMetadata.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t GroupActivityMetadata.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v3 = MEMORY[0x1F4188790](v43);
  uint64_t v39 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v41 = (char *)&v36 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GroupActivityMetadata.CodingKeys>);
  uint64_t v40 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  unint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (int *)type metadata accessor for GroupActivityMetadata(0);
  MEMORY[0x1F4188790](v9);
  char v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for generic != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for GroupActivityMetadata.ActivityType(0);
  uint64_t v13 = __swift_project_value_buffer(v12, (uint64_t)static GroupActivityMetadata.ActivityType.generic);
  _s15GroupActivities0A16ActivityMetadataV0C4TypeVWOcTm_1(v13, (uint64_t)v11, type metadata accessor for GroupActivityMetadata.ActivityType);
  uint64_t v14 = &v11[v9[5]];
  *(void *)uint64_t v14 = 0;
  *((void *)v14 + 1) = 0;
  uint64_t v15 = &v11[v9[6]];
  *(void *)uint64_t v15 = 0;
  *((void *)v15 + 1) = 0;
  *(void *)&v11[v9[7]] = 0;
  uint64_t v16 = (uint64_t)&v11[v9[8]];
  uint64_t v17 = type metadata accessor for URL();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  uint64_t v38 = v16;
  v18(v16, 1, 1, v17);
  *(void *)&v11[v9[9]] = 0;
  char v19 = dyld_program_sdk_at_least();
  uint64_t v36 = v9[10];
  v11[v36] = v19 ^ 1;
  uint64_t v20 = (uint64_t)&v11[v9[11]];
  v18(v20, 1, 1, v17);
  uint64_t v21 = &v11[v9[12]];
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v22 = qword_1EB58E160;
  uint64_t v23 = qword_1EB58E178;
  *uint64_t v21 = static SceneAssociationBehavior.default;
  *((void *)v21 + 1) = v22;
  *((_OWORD *)v21 + 1) = xmmword_1EB58E168;
  *((void *)v21 + 4) = v23;
  v11[v9[13]] = 0;
  *(void *)&v11[v9[14]] = 2;
  uint64_t v24 = one-time initialization token for default;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v24 != -1) {
    swift_once();
  }
  uint64_t v25 = type metadata accessor for Logger();
  __swift_project_value_buffer(v25, (uint64_t)static Log.default);
  char v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.debug.getter();
  uint64_t v28 = v6;
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&dword_1A375F000, v26, v27, "GroupActivityMetadata should no longer be encoded with your\nactivity. Please adopt asynchronous metadata.", v29, 2u);
    MEMORY[0x1A624F870](v29, -1, -1);
  }

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys();
  uint64_t v30 = v42;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v30)
  {
    uint64_t v42 = v20;
    char v46 = 0;
    lazy protocol witness table accessor for type URL? and conformance <A> A?(&lazy protocol witness table cache variable for type URL? and conformance <A> A?, &lazy protocol witness table cache variable for type URL and conformance URL);
    uint64_t v31 = (uint64_t)v41;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    outlined assign with take of URL?(v31, v38);
    char v45 = 1;
    uint64_t v32 = (uint64_t)v39;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    outlined assign with take of URL?(v32, v42);
    char v44 = 2;
    char v34 = KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v8, v28);
    uint64_t v35 = v37;
    v11[v36] = v34 & 1;
    _s15GroupActivities0A16ActivityMetadataV0C4TypeVWOcTm_1((uint64_t)v11, v35, type metadata accessor for GroupActivityMetadata);
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return _s15GroupActivities0A16ActivityMetadataVWOhTm_0((uint64_t)v11, type metadata accessor for GroupActivityMetadata);
}

uint64_t GroupActivityMetadata.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GroupActivityMetadata.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)static Log.default);
  unint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1A375F000, v8, v9, "GroupActivityMetadata should no longer be encoded with your\nactivity. Please adopt asynchronous metadata.", v10, 2u);
    MEMORY[0x1A624F870](v10, -1, -1);
  }

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  type metadata accessor for GroupActivityMetadata(0);
  char v15 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  lazy protocol witness table accessor for type URL? and conformance <A> A?(&lazy protocol witness table cache variable for type URL? and conformance <A> A?, &lazy protocol witness table cache variable for type URL and conformance URL);
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v1)
  {
    char v14 = 1;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    char v13 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t protocol witness for Decodable.init(from:) in conformance GroupActivityMetadata@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return GroupActivityMetadata.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GroupActivityMetadata(void *a1)
{
  return GroupActivityMetadata.encode(to:)(a1);
}

uint64_t GroupActivityMetadata.init(tuActivityMetadataBlob:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for NSKeyedUnarchiver);
  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for TUConversationActivityMetadata);
  uint64_t v7 = (void *)static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
  if (v3)
  {
  }
  else if (v7)
  {
    GroupActivityMetadata.init(_:)(v7, a3);
    return outlined consume of Data._Representation(a1, a2);
  }
  lazy protocol witness table accessor for type GroupActivityError and conformance GroupActivityError();
  swift_allocError();
  *unint64_t v8 = 1;
  swift_willThrow();
  return outlined consume of Data._Representation(a1, a2);
}

uint64_t GroupActivityMetadata.infoDictionaryActivityType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GroupActivityDescription?);
  uint64_t v3 = MEMORY[0x1F4188790](v2 - 8);
  uint64_t v5 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)v31 - v6;
  id v8 = objc_msgSend(self, sel_mainBundle);
  id v9 = objc_msgSend(v8, sel_infoDictionary);

  if (!v9) {
    goto LABEL_15;
  }
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (!*(void *)(v10 + 16)
    || (unint64_t v11 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000011, 0x80000001A3903610), (v12 & 1) == 0))
  {
    long long v34 = 0u;
    long long v35 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v11, (uint64_t)&v34);
  swift_bridgeObjectRelease();
  if (!*((void *)&v35 + 1))
  {
LABEL_14:
    outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)&v34, &demangling cache variable for type metadata for Any?);
    goto LABEL_15;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [[String : String]]);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_15:
    uint64_t v25 = type metadata accessor for GroupActivityMetadata.ActivityType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(a1, 1, 1, v25);
  }
  if (!*(void *)(v33 + 16)
    || (uint64_t v13 = *(void *)(v33 + 32), swift_bridgeObjectRetain(), swift_bridgeObjectRelease(), !*(void *)(v13 + 16))
    || (unint64_t v14 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000016, 0x80000001A3903630), (v15 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  uint64_t v16 = (uint64_t *)(*(void *)(v13 + 56) + 16 * v14);
  uint64_t v18 = *v16;
  unint64_t v17 = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (one-time initialization token for default != -1) {
    swift_once();
  }
  uint64_t v19 = type metadata accessor for Logger();
  __swift_project_value_buffer(v19, (uint64_t)static Log.default);
  swift_bridgeObjectRetain_n();
  uint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v32 = v18;
    uint64_t v23 = (uint8_t *)v22;
    uint64_t v24 = swift_slowAlloc();
    *(void *)&long long v34 = v24;
    *(_DWORD *)uint64_t v23 = 136315138;
    v31[1] = v23 + 4;
    swift_bridgeObjectRetain();
    uint64_t v33 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v17, (uint64_t *)&v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1A375F000, v20, v21, "Using info dictionary activity type: %s", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A624F870](v24, -1, -1);
    MEMORY[0x1A624F870](v23, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  GroupActivityDescription.init(id:)();
  outlined init with copy of URL?((uint64_t)v7, (uint64_t)v5, &demangling cache variable for type metadata for GroupActivityDescription?);
  uint64_t v27 = type metadata accessor for GroupActivityDescription();
  uint64_t v28 = *(void *)(v27 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v5, 1, v27) == 1)
  {
    uint64_t v29 = type metadata accessor for GroupActivityMetadata.ActivityType(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(a1, 1, 1, v29);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(a1, v5, v27);
    uint64_t v30 = type metadata accessor for GroupActivityMetadata.ActivityType(0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(a1, 0, 1, v30);
  }
  return outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v7, &demangling cache variable for type metadata for GroupActivityDescription?);
}

GroupActivities::GroupActivityMetadata::Experience_optional __swiftcall GroupActivityMetadata.Experience.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  char *v1 = v2;
  return (GroupActivities::GroupActivityMetadata::Experience_optional)rawValue;
}

uint64_t GroupActivityMetadata.Experience.rawValue.getter()
{
  return *v0;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance GroupActivityMetadata.Experience@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance GroupActivityMetadata.Experience()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GroupActivityMetadata.Experience()
{
  return RawRepresentable<>.encode(to:)();
}

void GroupActivityMetadata.experience.getter(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t (*GroupActivityMetadata.experience.modify(unsigned char *a1))(void, void, void)
{
  *a1 = 2;
  return destructiveProjectEnumData for GroupSessionErrors;
}

uint64_t GroupActivityMetadata.title.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for GroupActivityMetadata(0) + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t key path setter for GroupActivityMetadata.localizedTitle : GroupActivityMetadata(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(a2 + *(int *)(type metadata accessor for GroupActivityMetadata(0) + 20));
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v4 = v3;
  v4[1] = v2;
  return result;
}

uint64_t GroupActivityMetadata.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for GroupActivityMetadata(0) + 20));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*GroupActivityMetadata.localizedTitle.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for GroupActivityMetadata(0) + 20);
  *(_DWORD *)(a1 + 24) = v3;
  uint64_t v4 = (void *)(v1 + v3);
  uint64_t v5 = v4[1];
  *(void *)a1 = *v4;
  *(void *)(a1 + 8) = v5;
  swift_bridgeObjectRetain();
  return GroupActivityMetadata.localizedTitle.modify;
}

uint64_t GroupActivityMetadata.subtitle.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for GroupActivityMetadata(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t key path setter for GroupActivityMetadata.localizedSubtitle : GroupActivityMetadata(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(a2 + *(int *)(type metadata accessor for GroupActivityMetadata(0) + 24));
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v4 = v3;
  v4[1] = v2;
  return result;
}

uint64_t GroupActivityMetadata.subtitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for GroupActivityMetadata(0) + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*GroupActivityMetadata.localizedSubtitle.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for GroupActivityMetadata(0) + 24);
  *(_DWORD *)(a1 + 24) = v3;
  uint64_t v4 = (void *)(v1 + v3);
  uint64_t v5 = v4[1];
  *(void *)a1 = *v4;
  *(void *)(a1 + 8) = v5;
  swift_bridgeObjectRetain();
  return GroupActivityMetadata.localizedTitle.modify;
}

uint64_t GroupActivityMetadata.localizedTitle.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = (void *)(a1[2] + *((int *)a1 + 6));
  uint64_t v4 = *a1;
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *uint64_t v3 = v4;
    v3[1] = v2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v3 = v4;
    v3[1] = v2;
  }
  return result;
}

uint64_t GroupActivityMetadata.preferredBroadcastOptions.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = type metadata accessor for GroupActivityMetadata(0);
  *(void *)(v1 + *(int *)(result + 36)) = v2;
  return result;
}

uint64_t (*GroupActivityMetadata.preferredBroadcastingAttributes.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for GroupActivityMetadata(0) + 36);
  uint64_t v4 = *(void *)(v1 + v3);
  *(_DWORD *)(a1 + 16) = v3;
  *(void *)a1 = v4;
  return GroupActivityMetadata.preferredBroadcastingAttributes.modify;
}

uint64_t GroupActivityMetadata.preferredBroadcastingAttributes.modify(uint64_t result)
{
  *(void *)(*(void *)(result + 8) + *(int *)(result + 16)) = *(void *)result;
  return result;
}

uint64_t GroupActivityMetadata.contentAssociation.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = type metadata accessor for GroupActivityMetadata(0);
  *a1 = *(void *)(v1 + *(int *)(result + 56)) == 1;
  return result;
}

uint64_t GroupActivityMetadata.contentAssociation.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = type metadata accessor for GroupActivityMetadata(0);
  uint64_t v4 = 1;
  if (v2 != 1) {
    uint64_t v4 = 2;
  }
  *(void *)(v1 + *(int *)(result + 56)) = v4;
  return result;
}

uint64_t (*GroupActivityMetadata.contentAssociation.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for GroupActivityMetadata(0) + 56);
  *(_DWORD *)(a1 + 16) = v3;
  *(void *)a1 = *(void *)(v1 + v3) == 1;
  return GroupActivityMetadata.contentAssociation.modify;
}

uint64_t GroupActivityMetadata.contentAssociation.modify(uint64_t result)
{
  uint64_t v1 = 1;
  if (*(void *)result != 1) {
    uint64_t v1 = 2;
  }
  *(void *)(*(void *)(result + 8) + *(int *)(result + 16)) = v1;
  return result;
}

id @nonobjc TUConversationActivityMetadata.init(context:linkMetadata:fallbackURL:invitationURL:supportsContinuationOnTV:title:subTitle:imageData:preferredBroadcastingAttributes:sceneAssociationBehavior:supportsActivityPreviews:lifetimePolicy:)(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t a12, uint64_t a13, void *a14, char a15, uint64_t a16)
{
  if (a3 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(a2, a3);
  }
  uint64_t v22 = type metadata accessor for URL();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48);
  char v26 = 0;
  if (v24(a4, 1, v22) != 1)
  {
    URL._bridgeToObjectiveC()(v25);
    char v26 = v27;
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(a4, v22);
  }
  uint64_t v42 = v26;
  if (v24(a5, 1, v22) == 1)
  {
    uint64_t v29 = 0;
    uint64_t v30 = a10;
    if (a8) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v31 = 0;
    unint64_t v32 = a12;
    if (v30) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  URL._bridgeToObjectiveC()(v28);
  uint64_t v29 = v34;
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(a5, v22);
  uint64_t v30 = a10;
  if (!a8) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v31 = (void *)MEMORY[0x1A624DFA0](a7, a8);
  swift_bridgeObjectRelease();
  unint64_t v32 = a12;
  if (v30)
  {
LABEL_9:
    uint64_t v33 = (void *)MEMORY[0x1A624DFA0](a9, v30);
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v33 = 0;
LABEL_13:
  if (v32 >> 60 == 15)
  {
    Class v35 = 0;
  }
  else
  {
    Class v35 = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(a11, v32);
  }
  LOBYTE(v38) = a15 & 1;
  id v36 = objc_msgSend(v41, sel_initWithContext_linkMetadata_fallbackURL_invitationURL_supportsContinuationOnTV_title_subTitle_imageData_preferredBroadcastingAttributes_sceneAssociationBehavior_supportsActivityPreviews_lifetimePolicy_, a1, isa, v42, v29, a6 & 1, v31, v33, v35, a13, a14, v38, a16);

  return v36;
}

BOOL specialized static GroupActivityMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v94 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v92 = (char *)&v84 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (URL?, URL?));
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  uint64_t v91 = (uint64_t)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (int *)((char *)&v84 - v9);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  unint64_t v14 = (char *)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  unint64_t v17 = (char *)&v84 - v16;
  uint64_t v18 = MEMORY[0x1F4188790](v15);
  uint64_t v20 = (char *)&v84 - v19;
  uint64_t v21 = MEMORY[0x1F4188790](v18);
  uint64_t v93 = (char *)&v84 - v22;
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  uint64_t v25 = (char *)&v84 - v24;
  MEMORY[0x1F4188790](v23);
  uint64_t v27 = (char *)&v84 - v26;
  if ((MEMORY[0x1A624CF80](a1, a2) & 1) == 0) {
    return 0;
  }
  uint64_t v28 = (int *)type metadata accessor for GroupActivityMetadata(0);
  uint64_t v29 = v28[5];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = *(void *)(a1 + v29 + 8);
  unint64_t v32 = (void *)(a2 + v29);
  uint64_t v33 = v32[1];
  if (v31)
  {
    if (!v33) {
      return 0;
    }
    if (*v30 != *v32 || v31 != v33)
    {
      uint64_t v90 = v10;
      uint64_t v34 = v6;
      Class v35 = v17;
      uint64_t v36 = a1;
      uint64_t v37 = a2;
      uint64_t v38 = v20;
      uint64_t v39 = v14;
      uint64_t v40 = v28;
      char v41 = _stringCompareWithSmolCheck(_:_:expecting:)();
      uint64_t v28 = v40;
      unint64_t v14 = v39;
      uint64_t v20 = v38;
      a2 = v37;
      a1 = v36;
      unint64_t v17 = v35;
      uint64_t v6 = v34;
      uint64_t v10 = v90;
      char v42 = v41;
      BOOL result = 0;
      if ((v42 & 1) == 0) {
        return result;
      }
    }
  }
  else if (v33)
  {
    return 0;
  }
  uint64_t v44 = v28[6];
  char v45 = (void *)(a1 + v44);
  uint64_t v46 = *(void *)(a1 + v44 + 8);
  id v47 = (void *)(a2 + v44);
  uint64_t v48 = v47[1];
  if (!v46)
  {
    if (v48) {
      return 0;
    }
    goto LABEL_16;
  }
  if (!v48) {
    return 0;
  }
  if (*v45 == *v47 && v46 == v48) {
    goto LABEL_16;
  }
  uint64_t v90 = v10;
  uint64_t v49 = v6;
  uint64_t v50 = v17;
  uint64_t v51 = a1;
  uint64_t v52 = a2;
  uint64_t v53 = v20;
  id v54 = v14;
  unint64_t v55 = v28;
  char v56 = _stringCompareWithSmolCheck(_:_:expecting:)();
  uint64_t v28 = v55;
  unint64_t v14 = v54;
  uint64_t v20 = v53;
  a2 = v52;
  a1 = v51;
  unint64_t v17 = v50;
  uint64_t v6 = v49;
  uint64_t v10 = v90;
  char v57 = v56;
  BOOL result = 0;
  if (v57)
  {
LABEL_16:
    uint64_t v89 = v4;
    uint64_t v58 = v28[7];
    CGImageRef v59 = *(void **)(a1 + v58);
    unint64_t v60 = *(void **)(a2 + v58);
    if (v59)
    {
      if (!v60) {
        return 0;
      }
      uint64_t v90 = v28;
      id v87 = v59;
      type metadata accessor for CGImageRef(0);
      uint64_t v88 = v61;
      uint64_t v86 = lazy protocol witness table accessor for type GroupActivityDescription and conformance GroupActivityDescription(&lazy protocol witness table cache variable for type CGImageRef and conformance CGImageRef, type metadata accessor for CGImageRef);
      id v85 = v60;
      id v87 = v87;
      char v62 = static _CFObject.== infix(_:_:)();

      uint64_t v28 = v90;
      if ((v62 & 1) == 0) {
        return 0;
      }
    }
    else if (v60)
    {
      return 0;
    }
    id v84 = v14;
    uint64_t v63 = v28;
    outlined init with copy of URL?(a1 + v28[8], (uint64_t)v27, &demangling cache variable for type metadata for URL?);
    uint64_t v90 = v63;
    outlined init with copy of URL?(a2 + v63[8], (uint64_t)v25, &demangling cache variable for type metadata for URL?);
    uint64_t v64 = (uint64_t)v10 + *(int *)(v6 + 48);
    outlined init with copy of URL?((uint64_t)v27, (uint64_t)v10, &demangling cache variable for type metadata for URL?);
    uint64_t v88 = v64;
    outlined init with copy of URL?((uint64_t)v25, v64, &demangling cache variable for type metadata for URL?);
    uint64_t v66 = v94 + 48;
    uint64_t v65 = *(void **)(v94 + 48);
    if (((unsigned int (*)(int *, uint64_t, uint64_t))v65)(v10, 1, v89) == 1)
    {
      outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v25, &demangling cache variable for type metadata for URL?);
      outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v27, &demangling cache variable for type metadata for URL?);
      id v87 = v65;
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v65)(v88, 1, v89) == 1)
      {
        outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v10, &demangling cache variable for type metadata for URL?);
LABEL_29:
        if (*(void *)(a1 + v90[9]) != *(void *)(a2 + v90[9])
          || *(unsigned __int8 *)(a1 + v90[10]) != *(unsigned __int8 *)(a2 + v90[10]))
        {
          return 0;
        }
        unsigned __int8 v69 = v90;
        outlined init with copy of URL?(a1 + v90[11], (uint64_t)v20, &demangling cache variable for type metadata for URL?);
        outlined init with copy of URL?(a2 + v69[11], (uint64_t)v17, &demangling cache variable for type metadata for URL?);
        uint64_t v70 = v91;
        uint64_t v71 = v91 + *(int *)(v6 + 48);
        outlined init with copy of URL?((uint64_t)v20, v91, &demangling cache variable for type metadata for URL?);
        outlined init with copy of URL?((uint64_t)v17, v71, &demangling cache variable for type metadata for URL?);
        uint64_t v72 = v89;
        unsigned __int8 v73 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v87;
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v87)(v70, 1, v89) == 1)
        {
          outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v17, &demangling cache variable for type metadata for URL?);
          outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v20, &demangling cache variable for type metadata for URL?);
          if (v73(v71, 1, v72) == 1)
          {
            outlined destroy of OS_dispatch_queue.SchedulerOptions?(v70, &demangling cache variable for type metadata for URL?);
LABEL_40:
            v80 = v90;
            uint64_t v81 = v90[12];
            LOBYTE(v98) = *(unsigned char *)(a1 + v81);
            long long v99 = *(_OWORD *)(a1 + v81 + 8);
            long long v100 = *(_OWORD *)(a1 + v81 + 24);
            uint64_t v82 = a2 + v81;
            LOBYTE(v95) = *(unsigned char *)v82;
            long long v83 = *(_OWORD *)(v82 + 24);
            long long v96 = *(_OWORD *)(v82 + 8);
            long long v97 = v83;
            if (specialized static SceneAssociationBehavior.== infix(_:_:)(&v98, &v95)
              && *(unsigned __int8 *)(a1 + v80[13]) == *(unsigned __int8 *)(a2 + v80[13]))
            {
              return *(void *)(a1 + v80[14]) == *(void *)(a2 + v80[14]);
            }
            return 0;
          }
          goto LABEL_38;
        }
        uint64_t v74 = (uint64_t)v84;
        outlined init with copy of URL?(v70, (uint64_t)v84, &demangling cache variable for type metadata for URL?);
        if (v73(v71, 1, v72) == 1)
        {
          outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v17, &demangling cache variable for type metadata for URL?);
          outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v20, &demangling cache variable for type metadata for URL?);
          (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v74, v72);
LABEL_38:
          uint64_t v67 = v70;
          goto LABEL_27;
        }
        uint64_t v93 = v17;
        uint64_t v75 = v94;
        uint64_t v76 = v74;
        uint64_t v77 = v92;
        (*(void (**)(char *, uint64_t, uint64_t))(v94 + 32))(v92, v71, v72);
        lazy protocol witness table accessor for type GroupActivityDescription and conformance GroupActivityDescription(&lazy protocol witness table cache variable for type URL and conformance URL, MEMORY[0x1E4F276F0]);
        char v78 = dispatch thunk of static Equatable.== infix(_:_:)();
        id v79 = *(void (**)(char *, uint64_t))(v75 + 8);
        v79(v77, v72);
        outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v93, &demangling cache variable for type metadata for URL?);
        outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v20, &demangling cache variable for type metadata for URL?);
        v79((char *)v76, v72);
        outlined destroy of OS_dispatch_queue.SchedulerOptions?(v70, &demangling cache variable for type metadata for URL?);
        if (v78) {
          goto LABEL_40;
        }
        return 0;
      }
    }
    else
    {
      outlined init with copy of URL?((uint64_t)v10, (uint64_t)v93, &demangling cache variable for type metadata for URL?);
      uint64_t v86 = v66;
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v65)(v88, 1, v89) != 1)
      {
        id v87 = v65;
        (*(void (**)(char *, uint64_t, uint64_t))(v94 + 32))(v92, v88, v89);
        lazy protocol witness table accessor for type GroupActivityDescription and conformance GroupActivityDescription(&lazy protocol witness table cache variable for type URL and conformance URL, MEMORY[0x1E4F276F0]);
        LODWORD(v88) = dispatch thunk of static Equatable.== infix(_:_:)();
        id v68 = *(void (**)(char *, uint64_t))(v94 + 8);
        v68(v92, v89);
        outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v25, &demangling cache variable for type metadata for URL?);
        outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v27, &demangling cache variable for type metadata for URL?);
        v68(v93, v89);
        outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v10, &demangling cache variable for type metadata for URL?);
        if ((v88 & 1) == 0) {
          return 0;
        }
        goto LABEL_29;
      }
      outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v25, &demangling cache variable for type metadata for URL?);
      outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)v27, &demangling cache variable for type metadata for URL?);
      (*(void (**)(char *, uint64_t))(v94 + 8))(v93, v89);
    }
    uint64_t v67 = (uint64_t)v10;
LABEL_27:
    outlined destroy of OS_dispatch_queue.SchedulerOptions?(v67, &demangling cache variable for type metadata for (URL?, URL?));
    return 0;
  }
  return result;
}

uint64_t outlined init with take of GroupActivityMetadata.ActivityType(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GroupActivityMetadata.ActivityType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _s15GroupActivities0A16ActivityMetadataV0C4TypeVWOcTm_1(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t _s15GroupActivities0A16ActivityMetadataVWOhTm_0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t specialized GroupActivityMetadata.CodingKeys.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of GroupActivityMetadata.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

unint64_t lazy protocol witness table accessor for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys;
  if (!lazy protocol witness table cache variable for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys;
  if (!lazy protocol witness table cache variable for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys;
  if (!lazy protocol witness table cache variable for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys;
  if (!lazy protocol witness table cache variable for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GroupActivityMetadata.CodingKeys and conformance GroupActivityMetadata.CodingKeys);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type GroupActivityDescription and conformance GroupActivityDescription(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t lazy protocol witness table accessor for type URL? and conformance <A> A?(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for URL?);
    lazy protocol witness table accessor for type GroupActivityDescription and conformance GroupActivityDescription(a2, MEMORY[0x1E4F276F0]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t base witness table accessor for Equatable in GroupActivityMetadata.ActivityType()
{
  return lazy protocol witness table accessor for type GroupActivityDescription and conformance GroupActivityDescription(&lazy protocol witness table cache variable for type GroupActivityMetadata.ActivityType and conformance GroupActivityMetadata.ActivityType, (void (*)(uint64_t))type metadata accessor for GroupActivityMetadata.ActivityType);
}

unint64_t lazy protocol witness table accessor for type GroupActivityMetadata.LifetimePolicy and conformance GroupActivityMetadata.LifetimePolicy()
{
  unint64_t result = lazy protocol witness table cache variable for type GroupActivityMetadata.LifetimePolicy and conformance GroupActivityMetadata.LifetimePolicy;
  if (!lazy protocol witness table cache variable for type GroupActivityMetadata.LifetimePolicy and conformance GroupActivityMetadata.LifetimePolicy)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GroupActivityMetadata.LifetimePolicy and conformance GroupActivityMetadata.LifetimePolicy);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GroupActivityMetadata.Experience and conformance GroupActivityMetadata.Experience()
{
  unint64_t result = lazy protocol witness table cache variable for type GroupActivityMetadata.Experience and conformance GroupActivityMetadata.Experience;
  if (!lazy protocol witness table cache variable for type GroupActivityMetadata.Experience and conformance GroupActivityMetadata.Experience)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GroupActivityMetadata.Experience and conformance GroupActivityMetadata.Experience);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GroupActivityMetadata.Experience and conformance GroupActivityMetadata.Experience;
  if (!lazy protocol witness table cache variable for type GroupActivityMetadata.Experience and conformance GroupActivityMetadata.Experience)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GroupActivityMetadata.Experience and conformance GroupActivityMetadata.Experience);
  }
  return result;
}

uint64_t sub_1A38EED14@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = type metadata accessor for GroupActivityMetadata(0);
  *a2 = *(unsigned char *)(a1 + *(int *)(result + 52));
  return result;
}

uint64_t sub_1A38EED4C(char *a1, uint64_t a2)
{
  char v3 = *a1;
  uint64_t result = type metadata accessor for GroupActivityMetadata(0);
  *(unsigned char *)(a2 + *(int *)(result + 52)) = v3;
  return result;
}

void sub_1A38EED80(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1A38EED90@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v3 = (void *)(a1 + *(int *)(type metadata accessor for GroupActivityMetadata(0) + 20));
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;

  return swift_bridgeObjectRetain();
}

uint64_t sub_1A38EEDE0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  char v3 = (void *)(a1 + *(int *)(type metadata accessor for GroupActivityMetadata(0) + 24));
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;

  return swift_bridgeObjectRetain();
}

uint64_t sub_1A38EEE30@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = type metadata accessor for GroupActivityMetadata(0);
  *a2 = *(void *)(a1 + *(int *)(result + 36));
  return result;
}

uint64_t sub_1A38EEE68(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t result = type metadata accessor for GroupActivityMetadata(0);
  *(void *)(a2 + *(int *)(result + 36)) = v3;
  return result;
}

uint64_t sub_1A38EEE9C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = type metadata accessor for GroupActivityMetadata(0);
  *a2 = *(void *)(a1 + *(int *)(result + 56)) == 1;
  return result;
}

uint64_t sub_1A38EEEDC(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t result = type metadata accessor for GroupActivityMetadata(0);
  uint64_t v5 = 1;
  if (v3 != 1) {
    uint64_t v5 = 2;
  }
  *(void *)(a2 + *(int *)(result + 56)) = v5;
  return result;
}

void *initializeBufferWithCopyOfBuffer for GroupActivityMetadata(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v25 = *a2;
    *a1 = *a2;
    a1 = (void *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for GroupActivityDescription();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (void *)((char *)a1 + v8);
    uint64_t v11 = (void *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (void *)((char *)a1 + v9);
    unint64_t v14 = (void *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[7];
    uint64_t v17 = a3[8];
    uint64_t v18 = *(void **)((char *)a2 + v16);
    *(void *)((char *)a1 + v16) = v18;
    __dst = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = type metadata accessor for URL();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v23 = v18;
    if (v22(v19, 1, v20))
    {
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
      memcpy(__dst, v19, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(__dst, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v20);
    }
    uint64_t v26 = a3[10];
    *(void *)((char *)a1 + a3[9]) = *(void *)((char *)a2 + a3[9]);
    *((unsigned char *)a1 + v26) = *((unsigned char *)a2 + v26);
    uint64_t v27 = a3[11];
    uint64_t v28 = (char *)a1 + v27;
    uint64_t v29 = (char *)a2 + v27;
    if (v22((char *)a2 + v27, 1, v20))
    {
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
      memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v28, v29, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v28, 0, 1, v20);
    }
    uint64_t v31 = a3[12];
    uint64_t v32 = a3[13];
    uint64_t v33 = (char *)a1 + v31;
    uint64_t v34 = (char *)a2 + v31;
    *uint64_t v33 = *v34;
    uint64_t v35 = *((void *)v34 + 2);
    *((void *)v33 + 1) = *((void *)v34 + 1);
    *((void *)v33 + 2) = v35;
    uint64_t v36 = *((void *)v34 + 4);
    *((void *)v33 + 3) = *((void *)v34 + 3);
    *((void *)v33 + 4) = v36;
    *((unsigned char *)a1 + v32) = *((unsigned char *)a2 + v32);
    *(void *)((char *)a1 + a3[14]) = *(void *)((char *)a2 + a3[14]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for GroupActivityMetadata(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for GroupActivityDescription();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v5 = a1 + a2[8];
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v9 = a1 + a2[11];
  if (!v8(v9, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GroupActivityMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for GroupActivityDescription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = *(void **)(a2 + v15);
  *(void *)(a1 + v15) = v17;
  __dst = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  uint64_t v19 = type metadata accessor for URL();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v22 = v17;
  if (v21(v18, 1, v19))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(__dst, v18, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 16))(__dst, v18, v19);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(__dst, 0, 1, v19);
  }
  uint64_t v24 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v24) = *(unsigned char *)(a2 + v24);
  uint64_t v25 = a3[11];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (const void *)(a2 + v25);
  if (v21((const void *)(a2 + v25), 1, v19))
  {
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 16))(v26, v27, v19);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v26, 0, 1, v19);
  }
  uint64_t v29 = a3[12];
  uint64_t v30 = a3[13];
  uint64_t v31 = a1 + v29;
  uint64_t v32 = a2 + v29;
  *(unsigned char *)uint64_t v31 = *(unsigned char *)v32;
  uint64_t v33 = *(void *)(v32 + 16);
  *(void *)(v31 + 8) = *(void *)(v32 + 8);
  *(void *)(v31 + 16) = v33;
  uint64_t v34 = *(void *)(v32 + 32);
  *(void *)(v31 + 24) = *(void *)(v32 + 24);
  *(void *)(v31 + 32) = v34;
  *(unsigned char *)(a1 + v30) = *(unsigned char *)(a2 + v30);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for GroupActivityMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for GroupActivityDescription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = *(void **)(a1 + v13);
  uint64_t v15 = *(void **)(a2 + v13);
  *(void *)(a1 + v13) = v15;
  id v16 = v15;

  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (void *)(a2 + v17);
  uint64_t v20 = type metadata accessor for URL();
  uint64_t v21 = *(void *)(v20 - 8);
  id v22 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  int v23 = v22(v18, 1, v20);
  int v24 = v22(v19, 1, v20);
  if (v23)
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v24)
  {
    (*(void (**)(void *, uint64_t))(v21 + 8))(v18, v20);
LABEL_6:
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v18, v19, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v21 + 24))(v18, v19, v20);
LABEL_7:
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  uint64_t v26 = a3[11];
  uint64_t v27 = (void *)(a1 + v26);
  uint64_t v28 = (void *)(a2 + v26);
  int v29 = v22((void *)(a1 + v26), 1, v20);
  int v30 = v22(v28, 1, v20);
  if (!v29)
  {
    if (!v30)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 24))(v27, v28, v20);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v21 + 8))(v27, v20);
    goto LABEL_12;
  }
  if (v30)
  {
LABEL_12:
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v21 + 16))(v27, v28, v20);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v27, 0, 1, v20);
LABEL_13:
  uint64_t v32 = a3[12];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  *(unsigned char *)uint64_t v33 = *(unsigned char *)(a2 + v32);
  *(void *)(v33 + 8) = *(void *)(a2 + v32 + 8);
  *(void *)(v33 + 16) = *(void *)(a2 + v32 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v33 + 24) = *(void *)(v34 + 24);
  *(void *)(v33 + 32) = *(void *)(v34 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  return a1;
}

uint64_t initializeWithTake for GroupActivityMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for GroupActivityDescription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  if (v13(v10, 1, v11))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v15 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v16 = a3[11];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  if (v13((const void *)(a2 + v16), 1, v11))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v17, v18, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v17, 0, 1, v11);
  }
  uint64_t v20 = a3[12];
  uint64_t v21 = a3[13];
  uint64_t v22 = a1 + v20;
  int v23 = (long long *)(a2 + v20);
  long long v24 = *v23;
  long long v25 = v23[1];
  *(void *)(v22 + 32) = *((void *)v23 + 4);
  *(_OWORD *)uint64_t v22 = v24;
  *(_OWORD *)(v22 + 16) = v25;
  *(unsigned char *)(a1 + v21) = *(unsigned char *)(a2 + v21);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  return a1;
}

uint64_t assignWithTake for GroupActivityMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for GroupActivityDescription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  uint64_t v18 = *(void **)(a1 + v17);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);

  uint64_t v19 = a3[8];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  uint64_t v22 = type metadata accessor for URL();
  uint64_t v23 = *(void *)(v22 - 8);
  long long v24 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v23 + 48);
  int v25 = v24(v20, 1, v22);
  int v26 = v24(v21, 1, v22);
  if (v25)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v23 + 32))(v20, v21, v22);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v26)
  {
    (*(void (**)(void *, uint64_t))(v23 + 8))(v20, v22);
LABEL_6:
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v20, v21, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v23 + 40))(v20, v21, v22);
LABEL_7:
  uint64_t v28 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v28) = *(unsigned char *)(a2 + v28);
  uint64_t v29 = a3[11];
  int v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  int v32 = v24((void *)(a1 + v29), 1, v22);
  int v33 = v24(v31, 1, v22);
  if (!v32)
  {
    if (!v33)
    {
      (*(void (**)(void *, void *, uint64_t))(v23 + 40))(v30, v31, v22);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v23 + 8))(v30, v22);
    goto LABEL_12;
  }
  if (v33)
  {
LABEL_12:
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v23 + 32))(v30, v31, v22);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v30, 0, 1, v22);
LABEL_13:
  uint64_t v35 = a3[12];
  uint64_t v36 = a1 + v35;
  uint64_t v37 = a2 + v35;
  *(unsigned char *)uint64_t v36 = *(unsigned char *)(a2 + v35);
  uint64_t v38 = *(void *)(a2 + v35 + 16);
  *(void *)(v36 + 8) = *(void *)(a2 + v35 + 8);
  *(void *)(v36 + 16) = v38;
  swift_bridgeObjectRelease();
  uint64_t v39 = *(void *)(v37 + 32);
  *(void *)(v36 + 24) = *(void *)(v37 + 24);
  *(void *)(v36 + 32) = v39;
  swift_bridgeObjectRelease();
  uint64_t v40 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(void *)(a1 + v40) = *(void *)(a2 + v40);
  return a1;
}

uint64_t getEnumTagSinglePayload for GroupActivityMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A38EFFB8);
}

uint64_t sub_1A38EFFB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for GroupActivityMetadata.ActivityType(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 2147483646)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a3 + 32);
    return v13(v15, a2, v14);
  }
}

uint64_t storeEnumTagSinglePayload for GroupActivityMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A38F010C);
}

uint64_t sub_1A38F010C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for GroupActivityMetadata.ActivityType(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 2147483646)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 32);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for GroupActivityMetadata.ActivityType(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GroupActivityDescription();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for GroupActivityMetadata.ActivityType(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GroupActivityDescription();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for GroupActivityMetadata.ActivityType(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GroupActivityDescription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for GroupActivityMetadata.ActivityType(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GroupActivityDescription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for GroupActivityMetadata.ActivityType(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GroupActivityDescription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for GroupActivityMetadata.ActivityType(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GroupActivityDescription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for GroupActivityMetadata.ActivityType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1A38F04B4);
}

uint64_t sub_1A38F04B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GroupActivityDescription();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for GroupActivityMetadata.ActivityType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1A38F0534);
}

uint64_t sub_1A38F0534(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GroupActivityDescription();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata completion function for GroupActivityMetadata.ActivityType()
{
  uint64_t result = type metadata accessor for GroupActivityDescription();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for GroupActivityMetadata.LifetimePolicy()
{
  return &type metadata for GroupActivityMetadata.LifetimePolicy;
}

unsigned char *storeEnumTagSinglePayload for GroupActivityMetadata.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 2;
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
        JUMPOUT(0x1A38F070CLL);
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
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GroupActivityMetadata.CodingKeys()
{
  return &type metadata for GroupActivityMetadata.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for GroupActivityMetadata.Experience(unsigned char *result, unsigned int a2, unsigned int a3)
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
    void *result = a2 + 1;
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
        JUMPOUT(0x1A38F0810);
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
          void *result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GroupActivityMetadata.Experience()
{
  return &type metadata for GroupActivityMetadata.Experience;
}

uint64_t *GroupSessionEndpointIdentifier.systemCoordinator.unsafeMutableAddressor()
{
  if (one-time initialization token for systemCoordinator != -1) {
    swift_once();
  }
  return &static GroupSessionEndpointIdentifier.systemCoordinator;
}

uint64_t one-time initialization function for identity()
{
  uint64_t v0 = type metadata accessor for XPCIdentity();
  __swift_allocate_value_buffer(v0, static SystemCoordinatorInterface.identity);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)static SystemCoordinatorInterface.identity);
  uint64_t v2 = *MEMORY[0x1E4F5AF60];
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);

  return v3(v1, v2, v0);
}

uint64_t SystemCoordinatorInterface.identity.unsafeMutableAddressor()
{
  if (one-time initialization token for identity != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for XPCIdentity();

  return __swift_project_value_buffer(v0, (uint64_t)static SystemCoordinatorInterface.identity);
}

uint64_t static SystemCoordinatorInterface.identity.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for identity != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for XPCIdentity();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static SystemCoordinatorInterface.identity);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

id one-time initialization function for hostObjectInterface(uint64_t a1)
{
  return one-time initialization function for hostObjectInterface(a1, &protocolRef_CPSystemCoordinatorXPCHost, &static SystemCoordinatorInterface.hostObjectInterface);
}

void *SystemCoordinatorInterface.hostObjectInterface.unsafeMutableAddressor()
{
  if (one-time initialization token for hostObjectInterface != -1) {
    swift_once();
  }
  return &static SystemCoordinatorInterface.hostObjectInterface;
}

id static SystemCoordinatorInterface.hostObjectInterface.getter()
{
  return static SystemCoordinatorInterface.hostObjectInterface.getter(&one-time initialization token for hostObjectInterface, (void **)&static SystemCoordinatorInterface.hostObjectInterface);
}

void static SystemCoordinatorInterface.hostObjectInterface.setter(void *a1)
{
}

uint64_t (*static SystemCoordinatorInterface.hostObjectInterface.modify())()
{
  if (one-time initialization token for hostObjectInterface != -1) {
    swift_once();
  }
  swift_beginAccess();
  return GroupSession.GroupSessionPlaybackSyncerLink.shouldRequestCatchup.modify;
}

id one-time initialization function for clientObjectInterface(uint64_t a1)
{
  return one-time initialization function for hostObjectInterface(a1, &protocolRef_CPSystemCoordinatorXPCClient, &static SystemCoordinatorInterface.clientObjectInterface);
}

id one-time initialization function for hostObjectInterface(uint64_t a1, void *a2, void *a3)
{
  id result = objc_msgSend(self, sel_interfaceWithProtocol_, *a2);
  *a3 = result;
  return result;
}

void *SystemCoordinatorInterface.clientObjectInterface.unsafeMutableAddressor()
{
  if (one-time initialization token for clientObjectInterface != -1) {
    swift_once();
  }
  return &static SystemCoordinatorInterface.clientObjectInterface;
}

id static SystemCoordinatorInterface.clientObjectInterface.getter()
{
  return static SystemCoordinatorInterface.hostObjectInterface.getter(&one-time initialization token for clientObjectInterface, (void **)&static SystemCoordinatorInterface.clientObjectInterface);
}

id static SystemCoordinatorInterface.hostObjectInterface.getter(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v3 = *a2;

  return v3;
}

void static SystemCoordinatorInterface.clientObjectInterface.setter(void *a1)
{
}

void static SystemCoordinatorInterface.hostObjectInterface.setter(void *a1, void *a2, void **a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v5 = *a3;
  *a3 = a1;
}

uint64_t (*static SystemCoordinatorInterface.clientObjectInterface.modify())()
{
  if (one-time initialization token for clientObjectInterface != -1) {
    swift_once();
  }
  swift_beginAccess();
  return GroupSession.attachmentDownloadBytes.modify;
}

uint64_t protocol witness for static XPCInterface.identity.getter in conformance SystemCoordinatorInterface@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for identity != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for XPCIdentity();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static SystemCoordinatorInterface.identity);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

id protocol witness for static XPCInterface.hostObjectInterface.getter in conformance SystemCoordinatorInterface(uint64_t a1, uint64_t a2)
{
  return protocol witness for static XPCInterface.hostObjectInterface.getter in conformance SystemCoordinatorInterface(a1, a2, &one-time initialization token for hostObjectInterface, (void **)&static SystemCoordinatorInterface.hostObjectInterface);
}

id protocol witness for static XPCInterface.clientObjectInterface.getter in conformance SystemCoordinatorInterface(uint64_t a1, uint64_t a2)
{
  return protocol witness for static XPCInterface.hostObjectInterface.getter in conformance SystemCoordinatorInterface(a1, a2, &one-time initialization token for clientObjectInterface, (void **)&static SystemCoordinatorInterface.clientObjectInterface);
}

id protocol witness for static XPCInterface.hostObjectInterface.getter in conformance SystemCoordinatorInterface(uint64_t a1, uint64_t a2, void *a3, void **a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v5 = *a4;

  return v5;
}

uint64_t protocol witness for static XPCInterface.isConnectionEntitled(_:) in conformance SystemCoordinatorInterface()
{
  return MEMORY[0x1F4113320]();
}

void one-time initialization function for systemCoordinator()
{
  static GroupSessionEndpointIdentifier.systemCoordinator = 0xD00000000000002CLL;
  unk_1E95E7C20 = 0x80000001A3901780;
}

void static GroupSessionEndpointIdentifier.systemCoordinator.getter(void *a1@<X8>)
{
  *a1 = 0xD00000000000002CLL;
  a1[1] = 0x80000001A3901780;
}

ValueMetadata *type metadata accessor for SystemCoordinatorInterface()
{
  return &type metadata for SystemCoordinatorInterface;
}

uint64_t Asset.ID.storageLocation.getter()
{
  return MEMORY[0x1F4111B98]();
}

uint64_t Asset.ID.referenceSignature.getter()
{
  return MEMORY[0x1F4111BA0]();
}

uint64_t Asset.ID.signature.getter()
{
  return MEMORY[0x1F4111BA8]();
}

uint64_t type metadata accessor for Asset.ID()
{
  return MEMORY[0x1F4111BB0]();
}

uint64_t Asset.Protector.init(securityKey:privacyKey:)()
{
  return MEMORY[0x1F4111BB8]();
}

uint64_t type metadata accessor for Asset.Protector()
{
  return MEMORY[0x1F4111BC0]();
}

uint64_t type metadata accessor for Asset()
{
  return MEMORY[0x1F4111BC8]();
}

uint64_t AssetUploadRequest.init(fileURL:storageLocation:protector:credential:)()
{
  return MEMORY[0x1F4111BD0]();
}

uint64_t type metadata accessor for AssetUploadRequest()
{
  return MEMORY[0x1F4111BD8]();
}

uint64_t AssetDownloadRequest.init(asset:fileURL:credential:)()
{
  return MEMORY[0x1F4111BE0]();
}

uint64_t AssetDownloadRequest.init(skeleton:fileURL:)()
{
  return MEMORY[0x1F4111BE8]();
}

uint64_t type metadata accessor for AssetDownloadRequest()
{
  return MEMORY[0x1F4111BF0]();
}

uint64_t type metadata accessor for AssetUploadCoordinator()
{
  return MEMORY[0x1F4111BF8]();
}

uint64_t type metadata accessor for AssetDownloadCoordinator()
{
  return MEMORY[0x1F4111C00]();
}

uint64_t static AssetManager.shared.getter()
{
  return MEMORY[0x1F4111C08]();
}

uint64_t type metadata accessor for AssetManager()
{
  return MEMORY[0x1F4111C30]();
}

uint64_t AssetSkeleton.asset.getter()
{
  return MEMORY[0x1F4111C38]();
}

uint64_t AssetSkeleton.assetID.getter()
{
  return MEMORY[0x1F4111C40]();
}

uint64_t type metadata accessor for AssetSkeleton()
{
  return MEMORY[0x1F4111C48]();
}

uint64_t Credential.Builder.init(tenantName:requestorID:accessToken:)()
{
  return MEMORY[0x1F4111C50]();
}

uint64_t Credential.Builder.setExpirationDate(_:)()
{
  return MEMORY[0x1F4111C58]();
}

uint64_t Credential.Builder.build()()
{
  return MEMORY[0x1F4111C60]();
}

uint64_t type metadata accessor for Credential.Builder()
{
  return MEMORY[0x1F4111C68]();
}

uint64_t type metadata accessor for Credential()
{
  return MEMORY[0x1F4111C70]();
}

uint64_t type metadata accessor for SimultaneousTransferError()
{
  return MEMORY[0x1F4111C78]();
}

uint64_t type metadata accessor for Signal()
{
  return MEMORY[0x1F4111C80]();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t DataProtocol.copyBytes<A>(to:from:)()
{
  return MEMORY[0x1F40E3450]();
}

uint64_t Notification.userInfo.getter()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t type metadata accessor for Notification()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t URLResourceValues.fileSize.getter()
{
  return MEMORY[0x1F40E3FF0]();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return MEMORY[0x1F40E4008]();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t dispatch thunk of PropertyListDecoder.userInfo.modify()
{
  return MEMORY[0x1F40E41E8]();
}

uint64_t dispatch thunk of PropertyListDecoder.userInfo.getter()
{
  return MEMORY[0x1F40E41F0]();
}

uint64_t PropertyListDecoder.init()()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t dispatch thunk of PropertyListEncoder.outputFormat.setter()
{
  return MEMORY[0x1F40E4228]();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t PropertyListEncoder.init()()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t URL.absoluteURL.getter()
{
  return MEMORY[0x1F40E48A0]();
}

uint64_t URL.resourceValues(forKeys:)()
{
  return MEMORY[0x1F40E4918]();
}

uint64_t URL.init(fileURLWithPath:relativeTo:)()
{
  return MEMORY[0x1F40E4920]();
}

uint64_t URL.init(fileURLWithPath:isDirectory:)()
{
  return MEMORY[0x1F40E4930]();
}

uint64_t static URL.temporaryDirectory.getter()
{
  return MEMORY[0x1F40E4990]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t URL.init(string:relativeTo:)()
{
  return MEMORY[0x1F40E4B10]();
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t Data.init(contentsOf:options:)()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t Data.description.getter()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t Data._Representation.subscript.getter()
{
  return MEMORY[0x1F40E4CF8]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x1F40E4D48]();
}

uint64_t static Data._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E4D90]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t Data.range(of:options:in:)()
{
  return MEMORY[0x1F40E4E00]();
}

uint64_t Data.write(to:options:)()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t Data.append(_:)()
{
  return MEMORY[0x1F40E4E30]();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t Date.init()()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t UUID.init(uuidString:)()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x1F40E53B0]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x1F40E53C8]();
}

uint64_t static UUID.== infix(_:_:)()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t UUID.init(uuid:)()
{
  return MEMORY[0x1F40E5418]();
}

uint64_t UUID.uuid.getter()
{
  return MEMORY[0x1F40E5428]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t type metadata accessor for Attachment.MMCSMetadata.UploadStatus()
{
  return MEMORY[0x1F4113188]();
}

uint64_t Attachment.MMCSMetadata.assetSkeleton.getter()
{
  return MEMORY[0x1F4113190]();
}

uint64_t Attachment.MMCSMetadata.status.getter()
{
  return MEMORY[0x1F4113198]();
}

uint64_t type metadata accessor for Attachment.MMCSMetadata()
{
  return MEMORY[0x1F41131A0]();
}

uint64_t Attachment.UpdatingBlob.data.getter()
{
  return MEMORY[0x1F41131A8]();
}

uint64_t Attachment.UpdatingBlob.init(data:)()
{
  return MEMORY[0x1F41131B0]();
}

uint64_t type metadata accessor for Attachment.UpdatingBlob()
{
  return MEMORY[0x1F41131B8]();
}

uint64_t Attachment.mmcsMetadata.getter()
{
  return MEMORY[0x1F41131C0]();
}

uint64_t Attachment.id.getter()
{
  return MEMORY[0x1F41131C8]();
}

uint64_t Attachment.Metadata.developerMetadata.getter()
{
  return MEMORY[0x1F41131D0]();
}

uint64_t type metadata accessor for Attachment.Metadata()
{
  return MEMORY[0x1F41131D8]();
}

uint64_t type metadata accessor for Attachment()
{
  return MEMORY[0x1F41131E8]();
}

uint64_t Entitlement.rawValue.getter()
{
  return MEMORY[0x1F41131F0]();
}

uint64_t type metadata accessor for Entitlement()
{
  return MEMORY[0x1F41131F8]();
}

uint64_t PubSubTopic.Participant.participantID.getter()
{
  return MEMORY[0x1F4113200]();
}

uint64_t PubSubTopic.Participant.isSaltVerified.getter()
{
  return MEMORY[0x1F4113208]();
}

uint64_t type metadata accessor for PubSubTopic.Participant()
{
  return MEMORY[0x1F4113210]();
}

uint64_t PubSubTopic.reporterTag.getter()
{
  return MEMORY[0x1F4113218]();
}

Swift::Void __swiftcall PubSubTopic.unsubscribe(force:)(Swift::Bool force)
{
}

uint64_t PubSubTopic.$subscribers.getter()
{
  return MEMORY[0x1F4113228]();
}

uint64_t type metadata accessor for PubSubTopic.Configuration()
{
  return MEMORY[0x1F4113230]();
}

uint64_t PubSubTopic.isAvailableUnsafe.getter()
{
  return MEMORY[0x1F4113238]();
}

uint64_t PubSubTopic.retrieveNextMessage()()
{
  return MEMORY[0x1F4113240]();
}

uint64_t PubSubTopic.refreshDataCryptorProvider(with:)()
{
  return MEMORY[0x1F4113248]();
}

uint64_t static PubSubTopic.State.== infix(_:_:)()
{
  return MEMORY[0x1F4113250]();
}

uint64_t type metadata accessor for PubSubTopic.State()
{
  return MEMORY[0x1F4113258]();
}

uint64_t PubSubTopic.queue.getter()
{
  return MEMORY[0x1F4113260]();
}

uint64_t PubSubTopic.Message.participants.getter()
{
  return MEMORY[0x1F4113268]();
}

uint64_t PubSubTopic.Message.data.getter()
{
  return MEMORY[0x1F4113270]();
}

uint64_t PubSubTopic.Message.seqNum.getter()
{
  return MEMORY[0x1F4113278]();
}

uint64_t type metadata accessor for PubSubTopic.Message()
{
  return MEMORY[0x1F4113280]();
}

uint64_t PubSubTopic.publish(message:to:previousSeqNumUnacked:)()
{
  return MEMORY[0x1F4113288]();
}

uint64_t PubSubTopic.reporter.getter()
{
  return MEMORY[0x1F4113290]();
}

uint64_t UploadToken.storageLocation.getter()
{
  return MEMORY[0x1F4113298]();
}

uint64_t type metadata accessor for UploadToken()
{
  return MEMORY[0x1F41132A0]();
}

uint64_t type metadata accessor for XPCIdentity()
{
  return MEMORY[0x1F41132A8]();
}

uint64_t PluginClient.Configuration.init(endpoint:connectionMaxAttempts:connectionRetryInterval:serverCertValidationEnabled:serverCertHostname:serverCertLeafMarkerOID:)()
{
  return MEMORY[0x1F41132B0]();
}

uint64_t type metadata accessor for PluginClient.Configuration()
{
  return MEMORY[0x1F41132B8]();
}

uint64_t PluginClient.init(config:queue:reporter:reporterTag:)()
{
  return MEMORY[0x1F41132C0]();
}

uint64_t type metadata accessor for PluginClient()
{
  return MEMORY[0x1F41132C8]();
}

uint64_t PubSubClient.__allocating_init(pluginClient:createTopicMaxAttempts:createTopicRpcRetryIntervalSeconds:topicReporter:topicReporterTag:)()
{
  return MEMORY[0x1F41132D0]();
}

uint64_t dispatch thunk of PubSubClient.createTopic(name:topicConfig:category:dataCryptorProvider:delegate:seqNumWatermark:)()
{
  return MEMORY[0x1F41132D8]();
}

uint64_t type metadata accessor for PubSubClient.TopicCategory()
{
  return MEMORY[0x1F41132E0]();
}

uint64_t dispatch thunk of PubSubClient.updateVirtualParticipant(_:localParticipantID:)()
{
  return MEMORY[0x1F41132E8]();
}

uint64_t dispatch thunk of PubSubClient.close()()
{
  return MEMORY[0x1F41132F0]();
}

uint64_t type metadata accessor for PubSubClient()
{
  return MEMORY[0x1F41132F8]();
}

uint64_t dispatch thunk of StateMachine.currentState.getter()
{
  return MEMORY[0x1F4113300]();
}

uint64_t StateMachine.init(initialState:transitions:)()
{
  return MEMORY[0x1F4113308]();
}

uint64_t StateMachine.Transition.init(from:to:event:)()
{
  return MEMORY[0x1F4113310]();
}

uint64_t dispatch thunk of StateMachine.execute(_:)()
{
  return MEMORY[0x1F4113318]();
}

uint64_t type metadata accessor for AccountMember()
{
  return MEMORY[0x1F4113328]();
}

uint64_t type metadata accessor for DownloadToken()
{
  return MEMORY[0x1F4113330]();
}

uint64_t CurrentSubject.init(wrappedValue:)()
{
  return MEMORY[0x1F4113338]();
}

uint64_t CurrentSubject.wrappedValue.modify()
{
  return MEMORY[0x1F4113340]();
}

uint64_t CurrentSubject.wrappedValue.getter()
{
  return MEMORY[0x1F4113348]();
}

uint64_t CurrentSubject.wrappedValue.setter()
{
  return MEMORY[0x1F4113350]();
}

uint64_t CurrentSubject.projectedValue.getter()
{
  return MEMORY[0x1F4113358]();
}

uint64_t type metadata accessor for CurrentSubject()
{
  return MEMORY[0x1F4113360]();
}

uint64_t DatagramClient.Configuration.init(endpoint:establishChannelMaxAttempts:establishChannelRetryInterval:egressMessagePayloadMaxSizeBytes:)()
{
  return MEMORY[0x1F4113368]();
}

uint64_t type metadata accessor for DatagramClient.Configuration()
{
  return MEMORY[0x1F4113370]();
}

uint64_t DatagramClient.init(config:queue:)()
{
  return MEMORY[0x1F4113378]();
}

uint64_t type metadata accessor for DatagramClient()
{
  return MEMORY[0x1F4113380]();
}

uint64_t type metadata accessor for PluginEndpoint()
{
  return MEMORY[0x1F4113388]();
}

uint64_t AsyncSerialQueue.perform(_:)()
{
  return MEMORY[0x1F4113398]();
}

uint64_t AsyncSerialQueue.init(priority:bufferingPolicy:)()
{
  return MEMORY[0x1F41133A0]();
}

uint64_t type metadata accessor for AsyncSerialQueue()
{
  return MEMORY[0x1F41133A8]();
}

uint64_t type metadata accessor for DatagramEndpoint()
{
  return MEMORY[0x1F41133B0]();
}

uint64_t AddressableMember.init(handle:)()
{
  return MEMORY[0x1F41133B8]();
}

uint64_t type metadata accessor for AddressableMember()
{
  return MEMORY[0x1F41133C0]();
}

uint64_t dispatch thunk of PubSubTopicRecord.acknowledge()()
{
  return MEMORY[0x1F41133C8]();
}

uint64_t dispatch thunk of PubSubTopicRecord.publisherID.getter()
{
  return MEMORY[0x1F41133D0]();
}

uint64_t dispatch thunk of PubSubTopicRecord.toParticipantIDs.getter()
{
  return MEMORY[0x1F41133D8]();
}

uint64_t dispatch thunk of PubSubTopicRecord.data.getter()
{
  return MEMORY[0x1F41133E0]();
}

uint64_t dispatch thunk of XPCHostConnection.destroyConnection()()
{
  return MEMORY[0x1F41133E8]();
}

uint64_t XPCHostConnection.init(connection:queue:)()
{
  return MEMORY[0x1F41133F0]();
}

uint64_t XPCHostConnection.clientObject.getter()
{
  return MEMORY[0x1F41133F8]();
}

uint64_t XPCHostConnection.queue.getter()
{
  return MEMORY[0x1F4113410]();
}

uint64_t dispatch thunk of PubSubTopicReporter.emitAndRemoveReport(forTag:)()
{
  return MEMORY[0x1F4113428]();
}

uint64_t PubSubTopicReporter.queue.getter()
{
  return MEMORY[0x1F4113430]();
}

uint64_t static UnreliableMessenger.ClosedReason.== infix(_:_:)()
{
  return MEMORY[0x1F4113438]();
}

uint64_t UnreliableMessenger.Configuration.init(datagramPayloadMaxSizeBytes:outgoingQueueMaxSize:channelStreamMaxTries:channelStreamRetryInterval:seqNumBufferSize:)()
{
  return MEMORY[0x1F4113440]();
}

uint64_t type metadata accessor for UnreliableMessenger.Configuration()
{
  return MEMORY[0x1F4113448]();
}

uint64_t UnreliableMessenger.$activeReliableSubscribers.modify()
{
  return MEMORY[0x1F4113450]();
}

uint64_t UnreliableMessenger.refreshDataCryptorProvider(with:)()
{
  return MEMORY[0x1F4113458]();
}

uint64_t UnreliableMessenger.__allocating_init(name:config:localParticipantID:delegate:dataCryptorProvider:retainRefOnStart:serviceProvider:)()
{
  return MEMORY[0x1F4113460]();
}

uint64_t UnreliableMessenger.send(_:to:completion:)()
{
  return MEMORY[0x1F4113468]();
}

Swift::Void __swiftcall UnreliableMessenger.close()()
{
}

uint64_t UnreliableMessenger.start(dataCryptorProvider:)()
{
  return MEMORY[0x1F4113478]();
}

uint64_t UnreliableMessenger.Message.fromParticipantID.getter()
{
  return MEMORY[0x1F4113480]();
}

uint64_t UnreliableMessenger.Message.data.getter()
{
  return MEMORY[0x1F4113488]();
}

uint64_t type metadata accessor for UnreliableMessenger()
{
  return MEMORY[0x1F4113490]();
}

uint64_t ActivitySessionEvent.init(type:item:originatorID:queueItemType:url:)()
{
  return MEMORY[0x1F4113498]();
}

uint64_t type metadata accessor for ActivitySessionEvent()
{
  return MEMORY[0x1F41134A0]();
}

uint64_t AttachmentDataReport.init(isSubscribe:responseTime:)()
{
  return MEMORY[0x1F41134A8]();
}

uint64_t AttachmentDataReport.init(totalAttachments:totalDownloadBytes:totalUploadBytes:downloadSpeed:uploadSpeed:)()
{
  return MEMORY[0x1F41134B0]();
}

uint64_t AttachmentDataReport.init(isUpload:assetTotalSize:isServerBlocked:endToEndAttachmentLatency:loadTime:)()
{
  return MEMORY[0x1F41134B8]();
}

uint64_t type metadata accessor for AttachmentDataReport()
{
  return MEMORY[0x1F41134C0]();
}

uint64_t dispatch thunk of TopicCryptorProvider.refresh(with:)()
{
  return MEMORY[0x1F41134C8]();
}

uint64_t dispatch thunk of AttachmentLedgerClient.createTopic(name:dataCryptorProvider:initialAttachments:)()
{
  return MEMORY[0x1F41134D0]();
}

uint64_t dispatch thunk of AttachmentLedgerClient.updateVirtualParticipant(_:localParticipantID:)()
{
  return MEMORY[0x1F41134D8]();
}

uint64_t AttachmentLedgerClient.Config.init(participantIDSalt:createTopicMaxAttempts:createTopicRpcRetryIntervalSeconds:)()
{
  return MEMORY[0x1F41134E0]();
}

uint64_t type metadata accessor for AttachmentLedgerClient.Config()
{
  return MEMORY[0x1F41134E8]();
}

uint64_t AttachmentLedgerClient.__allocating_init(client:config:localParticipantID:)()
{
  return MEMORY[0x1F41134F0]();
}

uint64_t type metadata accessor for AttachmentLedgerClient()
{
  return MEMORY[0x1F41134F8]();
}

uint64_t GroupActivityDescription.tuActivityContext.getter()
{
  return MEMORY[0x1F4113500]();
}

uint64_t static GroupActivityDescription.== infix(_:_:)()
{
  return MEMORY[0x1F4113508]();
}

uint64_t GroupActivityDescription.init(id:)()
{
  return MEMORY[0x1F4113510]();
}

uint64_t type metadata accessor for GroupActivityDescription()
{
  return MEMORY[0x1F4113518]();
}

uint64_t static SharableObjectIdentifier.identifier<A, B>(ofType:with:)()
{
  return MEMORY[0x1F4113520]();
}

uint64_t static SharableObjectIdentifier.identifier<A>(ofType:with:)()
{
  return MEMORY[0x1F4113528]();
}

uint64_t ConversationManagerClient.registerEndpointProvider(_:)()
{
  return MEMORY[0x1F4113540]();
}

uint64_t ConversationManagerClient.onActivitySessionsChanged.getter()
{
  return MEMORY[0x1F4113548]();
}

Swift::Void __swiftcall ConversationManagerClient.unregisterEndpointProvider(identifier:)(Swift::String identifier)
{
}

uint64_t static ConversationManagerClient.shared.getter()
{
  return MEMORY[0x1F4113558]();
}

uint64_t type metadata accessor for ConversationManagerClient()
{
  return MEMORY[0x1F4113560]();
}

uint64_t PresenceSessionParticipant.isCurrentDevice.getter()
{
  return MEMORY[0x1F4113590]();
}

uint64_t PresenceSessionParticipant.id.getter()
{
  return MEMORY[0x1F4113598]();
}

uint64_t PresenceSessionParticipant.handle.getter()
{
  return MEMORY[0x1F41135A0]();
}

uint64_t type metadata accessor for PresenceSessionParticipant()
{
  return MEMORY[0x1F41135A8]();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> PluginAttachmentLedgerTopic.unsubscribe()()
{
}

uint64_t PluginAttachmentLedgerTopic.Configuration.maxSubscribeRetries.getter()
{
  return MEMORY[0x1F41135C0]();
}

uint64_t type metadata accessor for PluginAttachmentLedgerTopic.Configuration()
{
  return MEMORY[0x1F41135C8]();
}

uint64_t PluginAttachmentLedgerTopic.State.ShutdownInfo.pendingAttachments.getter()
{
  return MEMORY[0x1F41135E8]();
}

uint64_t type metadata accessor for PluginAttachmentLedgerTopic.State.ShutdownInfo.Reason()
{
  return MEMORY[0x1F41135F0]();
}

uint64_t PluginAttachmentLedgerTopic.State.ShutdownInfo.config.getter()
{
  return MEMORY[0x1F41135F8]();
}

uint64_t PluginAttachmentLedgerTopic.State.ShutdownInfo.reason.getter()
{
  return MEMORY[0x1F4113600]();
}

uint64_t type metadata accessor for PluginAttachmentLedgerTopic.State.ShutdownInfo()
{
  return MEMORY[0x1F4113608]();
}

uint64_t type metadata accessor for PluginAttachmentLedgerTopic.State.RetryInfo()
{
  return MEMORY[0x1F4113610]();
}

uint64_t type metadata accessor for PluginAttachmentLedgerTopic.State()
{
  return MEMORY[0x1F4113618]();
}

uint64_t type metadata accessor for PluginAttachmentLedgerTopic()
{
  return MEMORY[0x1F4113630]();
}

uint64_t type metadata accessor for AuthorizationRequestOverrides.PromptCondition()
{
  return MEMORY[0x1F4113638]();
}

uint64_t AuthorizationRequestOverrides.init(title:message:startForEveryone:startForMe:promptCondition:confirmReplacement:)()
{
  return MEMORY[0x1F4113640]();
}

uint64_t type metadata accessor for AuthorizationRequestOverrides()
{
  return MEMORY[0x1F4113648]();
}

uint64_t PresenceSessionConnectionInfo.endpoint.getter()
{
  return MEMORY[0x1F4113650]();
}

uint64_t type metadata accessor for BackgroundSessionManagerClient()
{
  return MEMORY[0x1F4113658]();
}

uint64_t dispatch thunk of CPManagedConfigurationObserver.allowed.getter()
{
  return MEMORY[0x1F4113660]();
}

uint64_t type metadata accessor for CPManagedConfigurationObserver()
{
  return MEMORY[0x1F4113668]();
}

uint64_t PresenceSessionCreationRequest.init(id:isCrossAccount:)()
{
  return MEMORY[0x1F4113670]();
}

uint64_t type metadata accessor for PresenceSessionCreationRequest()
{
  return MEMORY[0x1F4113678]();
}

uint64_t ActivitySessionClientConnection.setActivityPublisher.getter()
{
  return MEMORY[0x1F4113680]();
}

uint64_t ActivitySessionClientConnection.setStateCallback.setter()
{
  return MEMORY[0x1F4113688]();
}

uint64_t ActivitySessionClientConnection.requestParticipants(for:)()
{
  return MEMORY[0x1F4113690]();
}

uint64_t ActivitySessionClientConnection.setDataCryptorCallback.setter()
{
  return MEMORY[0x1F4113698]();
}

uint64_t ActivitySessionClientConnection.receivedResourceCallback.setter()
{
  return MEMORY[0x1F41136A0]();
}

uint64_t ActivitySessionClientConnection.serverDisconnectedCallback.setter()
{
  return MEMORY[0x1F41136A8]();
}

uint64_t ActivitySessionClientConnection.setAssociatedSceneCallback.setter()
{
  return MEMORY[0x1F41136B0]();
}

uint64_t ActivitySessionClientConnection.shouldTranslateParticipantIDs.getter()
{
  return MEMORY[0x1F41136B8]();
}

uint64_t type metadata accessor for ActivitySessionClientConnection()
{
  return MEMORY[0x1F41136C0]();
}

uint64_t GroupSessionDataCryptorProvider.init(topic:dataCryptor:refreshEncryptionKeysHandler:)()
{
  return MEMORY[0x1F41136C8]();
}

uint64_t type metadata accessor for GroupSessionDataCryptorProvider()
{
  return MEMORY[0x1F41136D0]();
}

uint64_t PresenceSessionClientConnection.handleUpdatedPresentDevices.setter()
{
  return MEMORY[0x1F41136D8]();
}

uint64_t PresenceSessionClientConnection.handleServerDisconnectClosure.setter()
{
  return MEMORY[0x1F41136E0]();
}

uint64_t type metadata accessor for PresenceSessionClientConnection()
{
  return MEMORY[0x1F41136E8]();
}

uint64_t dispatch thunk of ActivitySessionContainerProvider.onActivitySessionsChanged.getter()
{
  return MEMORY[0x1F41136F0]();
}

uint64_t dispatch thunk of ActivitySessionContainerProvider.topicCategory(groupUUID:name:)()
{
  return MEMORY[0x1F41136F8]();
}

uint64_t dispatch thunk of ActivitySessionContainerProvider.activitySessions.getter()
{
  return MEMORY[0x1F4113700]();
}

uint64_t dispatch thunk of ActivitySessionContainerProvider.pubSubTopicReporter.getter()
{
  return MEMORY[0x1F4113708]();
}

uint64_t dispatch thunk of ActivitySessionContainerProvider.pluginClientReporter.getter()
{
  return MEMORY[0x1F4113710]();
}

uint64_t BackgroundSessionCreationRequest.activitySessionRequest.getter()
{
  return MEMORY[0x1F4113718]();
}

uint64_t BackgroundSessionCreationRequest.isCrossAccount.getter()
{
  return MEMORY[0x1F4113720]();
}

uint64_t BackgroundSessionCreationRequest.init(id:activitySessionRequest:members:localMember:isCrossAccount:)()
{
  return MEMORY[0x1F4113728]();
}

uint64_t BackgroundSessionCreationRequest.id.getter()
{
  return MEMORY[0x1F4113730]();
}

uint64_t type metadata accessor for BackgroundSessionCreationRequest()
{
  return MEMORY[0x1F4113738]();
}

uint64_t dispatch thunk of ConversationManagerClientProtocol.prepareForGroupActivity(overrides:completionHandler:)()
{
  return MEMORY[0x1F4113768]();
}

uint64_t dispatch thunk of BackgroundSessionManagerClientProtocol.delegate.setter()
{
  return MEMORY[0x1F4113770]();
}

uint64_t Lock.withLock<A>(_:)()
{
  return MEMORY[0x1F4113778]();
}

Swift::Void __swiftcall Lock.assertOwned()()
{
}

Swift::Void __swiftcall Lock.assertNotOwned()()
{
}

Swift::Void __swiftcall Lock.lock()()
{
}

Swift::Void __swiftcall Lock.unlock()()
{
}

uint64_t Lock.init()()
{
  return MEMORY[0x1F41137A0]();
}

uint64_t type metadata accessor for Lock()
{
  return MEMORY[0x1F41137A8]();
}

uint64_t dispatch thunk of Token.expirationDate.getter()
{
  return MEMORY[0x1F41137D8]();
}

uint64_t dispatch thunk of Token.token.getter()
{
  return MEMORY[0x1F41137E0]();
}

uint64_t dispatch thunk of Token.accountID.getter()
{
  return MEMORY[0x1F41137E8]();
}

uint64_t tryLog<A>(_:_:function:line:)()
{
  return MEMORY[0x1F41137F0]();
}

uint64_t Testable.init(wrappedValue:)()
{
  return MEMORY[0x1F41137F8]();
}

uint64_t Testable.wrappedValue.modify()
{
  return MEMORY[0x1F4113800]();
}

uint64_t Testable.wrappedValue.getter()
{
  return MEMORY[0x1F4113808]();
}

uint64_t Testable.wrappedValue.setter()
{
  return MEMORY[0x1F4113810]();
}

uint64_t type metadata accessor for Testable()
{
  return MEMORY[0x1F4113818]();
}

uint64_t static Signposts.messengerSignpostIdentifier(forPayload:)()
{
  return MEMORY[0x1F4113820]();
}

uint64_t static Signposts.messenger.getter()
{
  return MEMORY[0x1F4113828]();
}

uint64_t XPCClient.__allocating_init(listenerEndpoint:)()
{
  return MEMORY[0x1F4113830]();
}

uint64_t dispatch thunk of XPCClient.destroyConnection()()
{
  return MEMORY[0x1F4113838]();
}

uint64_t XPCClient.withSynchronousHost<A>(body:errorHandler:)()
{
  return MEMORY[0x1F4113840]();
}

uint64_t XPCClient.queue.getter()
{
  return MEMORY[0x1F4113848]();
}

uint64_t XPCClient.withHost(body:errorHandler:)()
{
  return MEMORY[0x1F4113850]();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return MEMORY[0x1F4186958]();
}

uint64_t _CFObject.hash(into:)()
{
  return MEMORY[0x1F4186968]();
}

uint64_t _CFObject.hashValue.getter()
{
  return MEMORY[0x1F4186978]();
}

uint64_t dispatch thunk of static Transferable.transferRepresentation.getter()
{
  return MEMORY[0x1F40DFA00]();
}

uint64_t static Transferable.readableContentTypes.getter()
{
  return MEMORY[0x1F40DFA08]();
}

uint64_t type metadata accessor for TransferableError()
{
  return MEMORY[0x1F40DFA28]();
}

uint64_t DataRepresentation.init(contentType:exporting:importing:)()
{
  return MEMORY[0x1F40DFA30]();
}

uint64_t DataRepresentation.init(exportedContentType:exporting:)()
{
  return MEMORY[0x1F40DFA38]();
}

uint64_t type metadata accessor for DataRepresentation()
{
  return MEMORY[0x1F40DFA40]();
}

uint64_t dispatch thunk of static TransferRepresentation._decomposedTransferRepresentation(_:inputs:)()
{
  return MEMORY[0x1F40DFA88]();
}

uint64_t type metadata accessor for _TransferRepresentationValue()
{
  return MEMORY[0x1F40DFAB8]();
}

uint64_t _TransferRepresentationValue.init(_:)()
{
  return MEMORY[0x1F40DFAC0]();
}

uint64_t _TransferRepresentationInputs.init()()
{
  return MEMORY[0x1F40DFAD0]();
}

uint64_t type metadata accessor for _TransferRepresentationInputs()
{
  return MEMORY[0x1F40DFAD8]();
}

uint64_t ResolvedTransferRepresentation.contentType.getter()
{
  return MEMORY[0x1F40DFAE0]();
}

uint64_t ResolvedTransferRepresentation.representationType.getter()
{
  return MEMORY[0x1F40DFAF0]();
}

uint64_t ResolvedTransferRepresentation.exporting.getter()
{
  return MEMORY[0x1F40DFAF8]();
}

uint64_t ResolvedTransferRepresentation.importing.getter()
{
  return MEMORY[0x1F40DFB00]();
}

uint64_t type metadata accessor for ResolvedTransferRepresentation()
{
  return MEMORY[0x1F40DFB08]();
}

uint64_t _TransferRepresentationOutputs.storage.getter()
{
  return MEMORY[0x1F40DFB10]();
}

uint64_t type metadata accessor for _TransferRepresentationOutputs()
{
  return MEMORY[0x1F40DFB18]();
}

uint64_t UTType.init(exportedAs:conformingTo:)()
{
  return MEMORY[0x1F4187850]();
}

uint64_t UTType.identifier.getter()
{
  return MEMORY[0x1F4187858]();
}

uint64_t static UTType.== infix(_:_:)()
{
  return MEMORY[0x1F41878E8]();
}

uint64_t static UTType.url.getter()
{
  return MEMORY[0x1F4187928]();
}

uint64_t static UTType.data.getter()
{
  return MEMORY[0x1F4187938]();
}

uint64_t static UTType.jpeg.getter()
{
  return MEMORY[0x1F4187970]();
}

uint64_t static UTType.fileURL.getter()
{
  return MEMORY[0x1F41879D0]();
}

uint64_t type metadata accessor for UTType()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x1F4188570]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x1F4188580]();
}

uint64_t OSSignpostID.init(_:)()
{
  return MEMORY[0x1F4188588]();
}

uint64_t OSSignposter.logHandle.getter()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t OSSignposter.init(subsystem:category:)()
{
  return MEMORY[0x1F41885B8]();
}

uint64_t type metadata accessor for OSSignposter()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t static OSLogIntegerFormatting.decimal.getter()
{
  return MEMORY[0x1F4188648]();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return MEMORY[0x1F4188650]();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return MEMORY[0x1F4188658]();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return MEMORY[0x1F4188660]();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return MEMORY[0x1F4188668]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x1F4188670]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x1F4188680]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t CustomCombineIdentifierConvertible<>.combineIdentifier.getter()
{
  return MEMORY[0x1F40D65E8]();
}

uint64_t type metadata accessor for Publishers.CompactMap()
{
  return MEMORY[0x1F40D6658]();
}

uint64_t type metadata accessor for Publishers.HandleEvents()
{
  return MEMORY[0x1F40D6698]();
}

uint64_t type metadata accessor for Publishers.MeasureInterval()
{
  return MEMORY[0x1F40D66E0]();
}

uint64_t type metadata accessor for Publishers.PrefetchStrategy()
{
  return MEMORY[0x1F40D66E8]();
}

uint64_t type metadata accessor for Publishers.RemoveDuplicates()
{
  return MEMORY[0x1F40D66F8]();
}

uint64_t Publishers.Map.map<A>(_:)()
{
  return MEMORY[0x1F40D6718]();
}

uint64_t type metadata accessor for Publishers.Map()
{
  return MEMORY[0x1F40D6728]();
}

uint64_t type metadata accessor for Publishers.Zip()
{
  return MEMORY[0x1F40D6730]();
}

uint64_t type metadata accessor for Publishers.Drop()
{
  return MEMORY[0x1F40D6740]();
}

uint64_t type metadata accessor for Publishers.Scan()
{
  return MEMORY[0x1F40D6750]();
}

uint64_t type metadata accessor for Publishers.Merge()
{
  return MEMORY[0x1F40D6788]();
}

uint64_t type metadata accessor for Publishers.Share()
{
  return MEMORY[0x1F40D67B0]();
}

uint64_t type metadata accessor for Publishers.Buffer()
{
  return MEMORY[0x1F40D67B8]();
}

uint64_t type metadata accessor for Publishers.Throttle()
{
  return MEMORY[0x1F40D6858]();
}

uint64_t Publishers.MergeMany.init<A>(_:)()
{
  return MEMORY[0x1F40D6880]();
}

uint64_t Publishers.ReceiveOn.receive<A>(subscriber:)()
{
  return MEMORY[0x1F40D6898]();
}

uint64_t type metadata accessor for Publishers.ReceiveOn()
{
  return MEMORY[0x1F40D68A0]();
}

uint64_t dispatch thunk of Cancellable.cancel()()
{
  return MEMORY[0x1F40D68C8]();
}

uint64_t Subscribers.Demand.description.getter()
{
  return MEMORY[0x1F40D68E8]();
}

uint64_t static Subscribers.Demand.== infix(_:_:)()
{
  return MEMORY[0x1F40D68F8]();
}

uint64_t static Subscribers.Demand.none.getter()
{
  return MEMORY[0x1F40D6900]();
}

uint64_t static Subscribers.Demand.unlimited.getter()
{
  return MEMORY[0x1F40D6908]();
}

uint64_t type metadata accessor for AnyPublisher()
{
  return MEMORY[0x1F40D6918]();
}

uint64_t dispatch thunk of Subscription.request(_:)()
{
  return MEMORY[0x1F40D6928]();
}

uint64_t AnyCancellable.store(in:)()
{
  return MEMORY[0x1F40D6940]();
}

Swift::Void __swiftcall AnyCancellable.cancel()()
{
}

uint64_t type metadata accessor for AnyCancellable()
{
  return MEMORY[0x1F40D6960]();
}

uint64_t AnyCancellable.init(_:)()
{
  return MEMORY[0x1F40D6988]();
}

uint64_t AsyncPublisher.makeAsyncIterator()()
{
  return MEMORY[0x1F40D6990]();
}

uint64_t AsyncPublisher.init(_:)()
{
  return MEMORY[0x1F40D69B0]();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t PassthroughSubject.send(completion:)()
{
  return MEMORY[0x1F40D6A00]();
}

uint64_t PassthroughSubject.send(_:)()
{
  return MEMORY[0x1F40D6A08]();
}

uint64_t PassthroughSubject.__allocating_init()()
{
  return MEMORY[0x1F40D6A18]();
}

uint64_t PassthroughSubject.init()()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t type metadata accessor for PassthroughSubject()
{
  return MEMORY[0x1F40D6A28]();
}

uint64_t CurrentValueSubject.send(completion:)()
{
  return MEMORY[0x1F40D6A30]();
}

uint64_t CurrentValueSubject.send(_:)()
{
  return MEMORY[0x1F40D6A40]();
}

uint64_t CurrentValueSubject.value.getter()
{
  return MEMORY[0x1F40D6A50]();
}

uint64_t CurrentValueSubject.init(_:)()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t Just.init(_:)()
{
  return MEMORY[0x1F40D6B18]();
}

uint64_t Future.init(_:)()
{
  return MEMORY[0x1F40D6B48]();
}

uint64_t Published.init(initialValue:)()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t Published.projectedValue.getter()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t Published.projectedValue.setter()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t static Published.subscript.modify()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t static Published.subscript.getter()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t static Published.subscript.setter()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t type metadata accessor for Published.Publisher()
{
  return MEMORY[0x1F40D6BB0]();
}

uint64_t type metadata accessor for Published()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t Publisher.execute(_:onError:)()
{
  return MEMORY[0x1F4113858]();
}

uint64_t Publisher.sinkOnce(_:onError:)()
{
  return MEMORY[0x1F4113860]();
}

uint64_t Publisher<>.execute(_:)()
{
  return MEMORY[0x1F4113868]();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t Publisher.compactMap<A>(_:)()
{
  return MEMORY[0x1F40D6BE0]();
}

uint64_t Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)()
{
  return MEMORY[0x1F40D6BE8]();
}

uint64_t Publisher.measureInterval<A>(using:options:)()
{
  return MEMORY[0x1F40D6C38]();
}

uint64_t Publisher.removeDuplicates(by:)()
{
  return MEMORY[0x1F40D6C40]();
}

uint64_t Publisher.map<A>(_:)()
{
  return MEMORY[0x1F40D6C50]();
}

uint64_t Publisher.zip<A>(_:)()
{
  return MEMORY[0x1F40D6C70]();
}

uint64_t Publisher.scan<A>(_:_:)()
{
  return MEMORY[0x1F40D6C90]();
}

uint64_t Publisher.sink(receiveCompletion:receiveValue:)()
{
  return MEMORY[0x1F40D6C98]();
}

uint64_t Publisher.first()()
{
  return MEMORY[0x1F40D6CC0]();
}

uint64_t Publisher.merge<A>(with:)()
{
  return MEMORY[0x1F40D6CC8]();
}

uint64_t Publisher.share()()
{
  return MEMORY[0x1F40D6CF8]();
}

uint64_t Publisher.buffer(size:prefetch:whenFull:)()
{
  return MEMORY[0x1F40D6D08]();
}

uint64_t Publisher.filter(_:)()
{
  return MEMORY[0x1F40D6D10]();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t Publisher.debounce<A>(for:scheduler:options:)()
{
  return MEMORY[0x1F40D6D90]();
}

uint64_t Publisher.throttle<A>(for:scheduler:latest:)()
{
  return MEMORY[0x1F40D6DA0]();
}

uint64_t Publisher.dropFirst(_:)()
{
  return MEMORY[0x1F40D6DB8]();
}

uint64_t Publisher.subscribe<A>(on:options:)()
{
  return MEMORY[0x1F40D6DD0]();
}

uint64_t Publisher.subscribe<A>(_:)()
{
  return MEMORY[0x1F40D6DE0]();
}

uint64_t Publisher<>.removeDuplicates()()
{
  return MEMORY[0x1F40D6DF0]();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t Publisher<>.assign(to:)()
{
  return MEMORY[0x1F40D6E28]();
}

uint64_t Publisher<>.values.getter()
{
  return MEMORY[0x1F40D6E30]();
}

uint64_t Publisher<>.flatMap<A>(maxPublishers:_:)()
{
  return MEMORY[0x1F40D6E38]();
}

{
  return MEMORY[0x1F40D6E40]();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t DispatchWorkItem.init(flags:block:)()
{
  return MEMORY[0x1F4186EB0]();
}

uint64_t dispatch thunk of DispatchWorkItem.cancel()()
{
  return MEMORY[0x1F4186EC0]();
}

uint64_t type metadata accessor for DispatchWorkItem()
{
  return MEMORY[0x1F4186EE8]();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t + infix(_:_:)()
{
  return MEMORY[0x1F4186F08]();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t SymmetricKey.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x1F40DFFB0]();
}

uint64_t SymmetricKey.init(size:)()
{
  return MEMORY[0x1F40DFFC8]();
}

uint64_t type metadata accessor for SymmetricKey()
{
  return MEMORY[0x1F40DFFD8]();
}

uint64_t static SymmetricKeySize.bits256.getter()
{
  return MEMORY[0x1F40E0008]();
}

uint64_t type metadata accessor for SymmetricKeySize()
{
  return MEMORY[0x1F40E0010]();
}

uint64_t Dictionary.init()()
{
  return MEMORY[0x1F4183270]();
}

uint64_t Array.init()()
{
  return MEMORY[0x1F4183280]();
}

uint64_t CancellationError.init()()
{
  return MEMORY[0x1F4187BE8]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1F40E6000]();
}

uint64_t static Dictionary._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E6008]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x1F4183318]();
}

uint64_t Dictionary.removeValue(forKey:)()
{
  return MEMORY[0x1F4183320]();
}

uint64_t type metadata accessor for Dictionary.Values()
{
  return MEMORY[0x1F4183408]();
}

Swift::Void __swiftcall Dictionary.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x1F4183500]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t dispatch thunk of Hashable.hashValue.getter()
{
  return MEMORY[0x1F41835D0]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x1F4183730]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x1F4183740]();
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x1F4183750]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x1F4183838]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1F40E6190]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t String.init<A>(bytes:encoding:)()
{
  return MEMORY[0x1F40E6200]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x1F4183880]();
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x1F41839F0]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t Sequence.lazy.getter()
{
  return MEMORY[0x1F4183C38]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t dispatch thunk of RawRepresentable.init(rawValue:)()
{
  return MEMORY[0x1F4183D78]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4183E80]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1F40E6338]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1F4183EC8]();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t Array.endIndex.getter()
{
  return MEMORY[0x1F4183F78]();
}

Swift::Void __swiftcall Array.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t type metadata accessor for CheckedContinuation()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t type metadata accessor for CancellationError()
{
  return MEMORY[0x1F4187C18]();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return MEMORY[0x1F4187CB0]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t static AsyncStream.makeStream(of:bufferingPolicy:)()
{
  return MEMORY[0x1F4187D08]();
}

uint64_t type metadata accessor for AsyncStream.Continuation.YieldResult()
{
  return MEMORY[0x1F4187D10]();
}

uint64_t AsyncStream.Continuation.onTermination.setter()
{
  return MEMORY[0x1F4187D18]();
}

uint64_t type metadata accessor for AsyncStream.Continuation.BufferingPolicy()
{
  return MEMORY[0x1F4187D20]();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return MEMORY[0x1F4187D38]();
}

Swift::Void __swiftcall AsyncStream.Continuation.finish()()
{
}

uint64_t type metadata accessor for AsyncStream.Continuation()
{
  return MEMORY[0x1F4187D48]();
}

uint64_t type metadata accessor for AsyncStream()
{
  return MEMORY[0x1F4187D70]();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return MEMORY[0x1F4187D78]();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Task<>.isCancelled.getter()
{
  return MEMORY[0x1F4187DC8]();
}

uint64_t static Task<>.currentPriority.getter()
{
  return MEMORY[0x1F4187DD0]();
}

uint64_t static Task<>.checkCancellation()()
{
  return MEMORY[0x1F4187DD8]();
}

uint64_t type metadata accessor for UnsafeContinuation()
{
  return MEMORY[0x1F4187E00]();
}

uint64_t ThrowingTaskGroup.isEmpty.getter()
{
  return MEMORY[0x1F4187E40]();
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t AsyncThrowingStream.Continuation.onTermination.setter()
{
  return MEMORY[0x1F4187EA8]();
}

uint64_t AsyncThrowingStream.Continuation.yield(_:)()
{
  return MEMORY[0x1F4187EB8]();
}

uint64_t AsyncThrowingStream.Continuation.finish(throwing:)()
{
  return MEMORY[0x1F4187EC0]();
}

uint64_t AsyncThrowingStream.makeAsyncIterator()()
{
  return MEMORY[0x1F4187ED0]();
}

uint64_t AsyncThrowingStream.init<>(_:bufferingPolicy:_:)()
{
  return MEMORY[0x1F4187F00]();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x1F40E6430]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t Set.description.getter()
{
  return MEMORY[0x1F4184100]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x1F4184138]();
}

uint64_t Set.Index._asCocoa.modify()
{
  return MEMORY[0x1F4184178]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x1F41841D0]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1F40E6478]();
}

uint64_t Collection<>.trimmingPrefix<A>(_:)()
{
  return MEMORY[0x1F4188438]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t RangeReplaceableCollection.removeFirst()()
{
  return MEMORY[0x1F41844A0]();
}

uint64_t SPVector3D.hash(into:)()
{
  return MEMORY[0x1F41876B8]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x1F4188700]();
}

uint64_t type metadata accessor for CKRecordChange.ChangeType()
{
  return MEMORY[0x1F4111F18]();
}

uint64_t CKRecordChange.changeType.getter()
{
  return MEMORY[0x1F4111F20]();
}

uint64_t type metadata accessor for CKRecordObserver.RecordChanges.Iterator()
{
  return MEMORY[0x1F4111F28]();
}

uint64_t type metadata accessor for CKRecordObserver.RecordChanges()
{
  return MEMORY[0x1F4111F30]();
}

uint64_t CKRecordObserver.recordChanges.getter()
{
  return MEMORY[0x1F4111F38]();
}

uint64_t CKRecordObserver.init(container:recordType:)()
{
  return MEMORY[0x1F4111F40]();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:execute:)()
{
  return MEMORY[0x1F4187000]();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerOptions()
{
  return MEMORY[0x1F4187040]();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerTimeType.Stride()
{
  return MEMORY[0x1F4187088]();
}

uint64_t OS_dispatch_queue.SchedulerTimeType.Stride.init(_:)()
{
  return MEMORY[0x1F4187090]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x1F4187100]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x1F4188708]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x1F4188710]();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return MEMORY[0x1F4188718]();
}

uint64_t type metadata accessor for NSNotificationCenter.Publisher()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t NSNotificationCenter.publisher(for:object:)()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t NSData.startIndex.getter()
{
  return MEMORY[0x1F40E6800]();
}

uint64_t NSData.endIndex.getter()
{
  return MEMORY[0x1F40E6808]();
}

uint64_t NSCoder.decodeObject<A>(of:forKey:)()
{
  return MEMORY[0x1F40E6858]();
}

uint64_t NSCoder.decodeTopLevelObject<A>(of:forKey:)()
{
  return MEMORY[0x1F40E6890]();
}

uint64_t SPAngle.hash(into:)()
{
  return MEMORY[0x1F41876C0]();
}

uint64_t static CKRecord.SystemType.share.getter()
{
  return MEMORY[0x1F40D6218]();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x1F41874A8](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t NSObject.hash(into:)()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t SPPose3D.hash(into:)()
{
  return MEMORY[0x1F41876C8]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x1F4188720]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1F4184640]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x1F4184820]();
}

uint64_t BinaryInteger.description.getter()
{
  return MEMORY[0x1F4184958]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x1F4184978]();
}

uint64_t AnyKeyPath.debugDescription.getter()
{
  return MEMORY[0x1F4184990]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t __CocoaSet.Index.handleBitPattern.getter()
{
  return MEMORY[0x1F4184B68]();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t __CocoaSet.element(at:)()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t __CocoaSet.formIndex(after:isUnique:)()
{
  return MEMORY[0x1F4184BD8]();
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x1F4184CA8]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t dispatch thunk of Identifiable.id.getter()
{
  return MEMORY[0x1F4184D08]();
}

uint64_t type metadata accessor for LazySequence()
{
  return MEMORY[0x1F4184D18]();
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t static ManagedBuffer.create(minimumCapacity:makingHeaderWith:)()
{
  return MEMORY[0x1F4184E28]();
}

uint64_t type metadata accessor for ManagedBuffer()
{
  return MEMORY[0x1F4184E38]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t type metadata accessor for PartialKeyPath()
{
  return MEMORY[0x1F4184E88]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t ContinuousClock.init()()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return MEMORY[0x1F4184F98]();
}

uint64_t type metadata accessor for LazyMapSequence()
{
  return MEMORY[0x1F4184FC0]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x1F4185050]();
}

uint64_t CodingUserInfoKey.init(rawValue:)()
{
  return MEMORY[0x1F41850B0]();
}

uint64_t type metadata accessor for CodingUserInfoKey()
{
  return MEMORY[0x1F41850C0]();
}

uint64_t dispatch thunk of static FixedWidthInteger.bitWidth.getter()
{
  return MEMORY[0x1F41850E0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1F4185298]();
}

{
  return MEMORY[0x1F41852A0]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)()
{
  return MEMORY[0x1F41852C0]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.zero.getter()
{
  return MEMORY[0x1F41852E0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1F4185350]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x1F4185368]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1F4185370]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x1F4185380]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x1F4185398]();
}

uint64_t AsyncFilterSequence.isIncluded.getter()
{
  return MEMORY[0x1F4188008]();
}

uint64_t AsyncFilterSequence.base.getter()
{
  return MEMORY[0x1F4188010]();
}

uint64_t AsyncFilterSequence.Iterator.baseIterator.modify()
{
  return MEMORY[0x1F4188018]();
}

uint64_t AsyncFilterSequence.Iterator.isIncluded.getter()
{
  return MEMORY[0x1F4188020]();
}

uint64_t AsyncFilterSequence.Iterator.init(_:isIncluded:)()
{
  return MEMORY[0x1F4188028]();
}

uint64_t AsyncFilterSequence.init(_:isIncluded:)()
{
  return MEMORY[0x1F4188038]();
}

uint64_t LazySequenceProtocol.map<A>(_:)()
{
  return MEMORY[0x1F4185410]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x1F41854C8](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x1F4185528]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x1F4185568]();
}

{
  return MEMORY[0x1F4185570]();
}

{
  return MEMORY[0x1F4185588]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x1F4185598]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x1F4185608]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x1F4185628]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x1F4185658]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x1F4185690]();
}

{
  return MEMORY[0x1F4185698]();
}

{
  return MEMORY[0x1F41856B0]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1F4185758]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x1F4185A20]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decodeNil()()
{
  return MEMORY[0x1F4185AC0]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encodeNil()()
{
  return MEMORY[0x1F4185B68]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x1F4185D58]();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return MEMORY[0x1F4188170]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1F4185EB0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher.finalize()()
{
  return MEMORY[0x1F4185EF0]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t Hasher.init()()
{
  return MEMORY[0x1F4185F00]();
}

NSNumber __swiftcall UInt32._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1F40E6EA8]();
}

uint64_t dispatch thunk of Decoder.codingPath.getter()
{
  return MEMORY[0x1F4185FA8]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t dispatch thunk of Decoder.userInfo.getter()
{
  return MEMORY[0x1F4185FC0]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t static Duration.seconds(_:)()
{
  return MEMORY[0x1F41861A8]();
}

uint64_t dispatch thunk of OptionSet.init(rawValue:)()
{
  return MEMORY[0x1F41862B8]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x1F4186318]();
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

uint64_t CGImageCreateThumb()
{
  return MEMORY[0x1F40E96F8]();
}

CGImageRef CGImageCreateWithJPEGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA8A0](source, decode, shouldInterpolate, *(void *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x1F4112A70]();
}

uint64_t CUTWeakLinkSymbol()
{
  return MEMORY[0x1F4112A78]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PNCopyBestGuessCountryCodeForNumber()
{
  return MEMORY[0x1F4114238]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint64_t TUSimulatedModeEnabled()
{
  return MEMORY[0x1F4163AC8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1F41881F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1F41864B0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtPartialKeyPath()
{
  return MEMORY[0x1F4186558]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1F41866B0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x1F4186880]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x1F4186888]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x1F4186890]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x1F41868A8]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x1F41868B0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x1F41868D0]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x1F41868D8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}