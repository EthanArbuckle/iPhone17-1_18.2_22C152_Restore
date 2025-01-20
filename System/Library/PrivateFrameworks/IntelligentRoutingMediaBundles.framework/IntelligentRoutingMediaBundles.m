uint64_t destroy for IRMBManagerError()
{
  return swift_bridgeObjectRelease();
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_25423B7F8()
{
  unint64_t v1 = sub_25423C210();
  if (!v1) {
    unint64_t v1 = sub_25423E650(MEMORY[0x263F8EE78]);
  }
  unint64_t v2 = v1;
  uint64_t v3 = swift_bridgeObjectRetain();
  sub_25423DCC0(v3, v0 + 16);
  sub_25423DAC0();
  if (v5)
  {
    v6 = v5;
    uint64_t v55 = v0 + 160;
    *(void *)(v0 + 256) = v2;
    while (1)
    {
      *(void *)(v0 + 264) = v6;
      if ((unint64_t)(0x51EB851EB851EB8 - 0x70A3D70A3D70A3D7 * v4) <= 0xA3D70A3D70A3D70) {
        break;
      }
      id v7 = objc_msgSend(v6, sel_identifier);
      v8 = *(void **)(v0 + 264);
      if (v7)
      {
        v14 = v7;
        uint64_t v15 = sub_254242B40();
        uint64_t v17 = v16;

        *(void *)(v0 + 288) = v15;
        *(void *)(v0 + 296) = v17;
        id v18 = v8;
        unint64_t v19 = sub_25423C210();
        if (!v19) {
          unint64_t v19 = sub_25423E650(MEMORY[0x263F8EE78]);
        }
        unint64_t v20 = v19;
        if (*(void *)(v19 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v21 = sub_25423D868(v15, v17);
          if (v22)
          {
            uint64_t v23 = *(void *)(v20 + 56) + 32 * v21;
            uint64_t v24 = *(void *)(v23 + 8);
            uint64_t v53 = *(void *)v23;
            uint64_t v25 = *(unsigned __int8 *)(v23 + 16);
            int v26 = *(unsigned __int8 *)(v23 + 17);
            int v27 = *(unsigned __int8 *)(v23 + 18);
            uint64_t v52 = *(void *)(v23 + 24);
            uint64_t v28 = 256;
            if (!v26) {
              uint64_t v28 = 0;
            }
            uint64_t v29 = v28 | v25;
            uint64_t v30 = 0x10000;
            if (!v27) {
              uint64_t v30 = 0;
            }
            uint64_t v54 = v29 | v30;
            swift_bridgeObjectRetain();
          }
          else
          {
            uint64_t v53 = 0;
            uint64_t v54 = 0;
            uint64_t v24 = 0;
            uint64_t v52 = 0;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v53 = 0;
          uint64_t v54 = 0;
          uint64_t v24 = 0;
          uint64_t v52 = 0;
        }
        *(void *)(v0 + 304) = v24;
        swift_bridgeObjectRelease();
        id v32 = objc_allocWithZone(MEMORY[0x263F01878]);
        swift_bridgeObjectRetain();
        v33 = (void *)sub_254242B30();
        swift_bridgeObjectRelease();
        *(void *)(v0 + 240) = 0;
        id v34 = objc_msgSend(v32, sel_initWithBundleIdentifier_allowPlaceholder_error_, v33, 0, v0 + 240);

        v35 = *(void **)(v0 + 240);
        if (v34)
        {
          id v36 = v35;
          id v37 = objc_msgSend(v34, sel_infoDictionary);
          v38 = (void *)sub_254242B30();
          sub_254241CA4(0, (unint64_t *)&qword_26B2664D8);
          id v39 = objc_msgSend(v37, sel_objectForKey_ofClass_, v38, swift_getObjCClassFromMetadata());

          if (v39)
          {
            uint64_t v40 = v0 + 192;
            sub_254242C10();

            swift_unknownObjectRelease();
          }
          else
          {

            uint64_t v40 = v0 + 192;
            *(_OWORD *)(v0 + 192) = 0u;
            *(_OWORD *)(v0 + 208) = 0u;
          }
          uint64_t v47 = v52;
          sub_2542419C4(v40, v55);
          uint64_t v45 = v0 + 64;
          uint64_t v46 = v53;
          if (*(void *)(v0 + 184))
          {
            int v48 = swift_dynamicCast();
            if (v48) {
              uint64_t v43 = *(void *)(v0 + 224);
            }
            else {
              uint64_t v43 = 0;
            }
            if (v48) {
              uint64_t v44 = *(void *)(v0 + 232);
            }
            else {
              uint64_t v44 = 0;
            }
          }
          else
          {
            sub_254241A2C(v55);
            uint64_t v43 = 0;
            uint64_t v44 = 0;
          }
        }
        else
        {
          id v41 = v35;
          uint64_t v42 = sub_254242AA0();

          swift_willThrow();
          MEMORY[0x25A274580](v42);
          uint64_t v43 = 0;
          uint64_t v44 = 0;
          uint64_t v45 = v0 + 64;
          uint64_t v47 = v52;
          uint64_t v46 = v53;
        }
        *(void *)(v0 + 312) = v44;
        *(void *)(v0 + 96) = v46;
        *(void *)(v0 + 104) = v24;
        *(void *)(v0 + 112) = v54;
        *(void *)(v0 + 120) = v47;
        uint64_t v49 = swift_task_alloc();
        *(void *)(v0 + 320) = v49;
        *(void *)uint64_t v49 = v0;
        *(void *)(v49 + 8) = sub_25423F6A8;
        uint64_t v50 = *(void *)(v0 + 264);
        *(void *)(v49 + 80) = v43;
        *(void *)(v49 + 88) = v44;
        *(void *)(v49 + 64) = v17;
        *(void *)(v49 + 72) = v50;
        *(void *)(v49 + 48) = v45;
        *(void *)(v49 + 56) = v15;
        long long v51 = *(_OWORD *)(v0 + 112);
        *(_OWORD *)(v49 + 96) = *(_OWORD *)(v0 + 96);
        *(_OWORD *)(v49 + 112) = v51;
        return MEMORY[0x270FA2498](sub_25423E7E0, 0, 0);
      }

      sub_25423DAC0();
      v6 = v9;
      if (!v9) {
        goto LABEL_8;
      }
    }
    sub_254242BA0();
    *(void *)(v0 + 272) = 0;
    v31 = (void *)swift_task_alloc();
    *(void *)(v0 + 280) = v31;
    void *v31 = v0;
    v31[1] = sub_25423EF90;
    return MEMORY[0x270FA2000]();
  }
  else
  {
LABEL_8:
    sub_25423DE84();
    uint64_t v10 = swift_bridgeObjectRetain();
    uint64_t v11 = sub_25423CCE0(v10);
    swift_bridgeObjectRelease();
    v12 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v12(v11);
  }
}

uint64_t assignWithTake for IRMBBundle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t IRMBBundle.bundleIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_25423BEA8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v4 = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    uint64_t v23 = a2 + 7;
    v6 = (void *)MEMORY[0x263F8EE78];
    while (1)
    {
      unint64_t v7 = swift_bridgeObjectRetain();
      sub_25423D488(v7, &v28);
      uint64_t v8 = v29;
      if (v29)
      {
        int v26 = v30;
        uint64_t v27 = v31;
        uint64_t v32 = v28;
        if (!a2) {
          goto LABEL_22;
        }
        uint64_t v25 = a2[2];
        if (!v25) {
          goto LABEL_22;
        }
        if (a2[4] != v28 || v29 != a2[5])
        {
          uint64_t result = sub_254242CE0();
          if ((result & 1) == 0)
          {
            uint64_t v10 = v32;
            if (v25 != 1)
            {
              uint64_t v11 = v23;
              uint64_t v12 = 1;
              uint64_t v24 = v6;
              while (1)
              {
                uint64_t v13 = v4;
                uint64_t v14 = v2;
                uint64_t v15 = a2;
                uint64_t v16 = v12 + 1;
                if (__OFADD__(v12, 1)) {
                  break;
                }
                BOOL v17 = *(v11 - 1) == v10 && v8 == *v11;
                if (v17 || (uint64_t result = sub_254242CE0(), (result & 1) != 0))
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  a2 = v15;
                  uint64_t v2 = v14;
                  uint64_t v4 = v13;
                  v6 = v24;
                  goto LABEL_4;
                }
                v11 += 2;
                ++v12;
                BOOL v17 = v16 == v25;
                a2 = v15;
                uint64_t v2 = v14;
                uint64_t v4 = v13;
                v6 = v24;
                uint64_t v10 = v32;
                if (v17) {
                  goto LABEL_22;
                }
              }
              __break(1u);
              return result;
            }
LABEL_22:
            swift_bridgeObjectRelease();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              v6 = sub_25423C100(0, v6[2] + 1, 1, v6);
            }
            unint64_t v19 = v6[2];
            unint64_t v18 = v6[3];
            uint64_t v20 = v32;
            if (v19 >= v18 >> 1)
            {
              char v22 = sub_25423C100((void *)(v18 > 1), v19 + 1, 1, v6);
              uint64_t v20 = v32;
              v6 = v22;
            }
            v6[2] = v19 + 1;
            unint64_t v21 = &v6[4 * v19];
            v21[4] = v20;
            v21[5] = v8;
            *((unsigned char *)v21 + 48) = v26 & 1;
            *((unsigned char *)v21 + 49) = BYTE1(v26) & 1;
            *((unsigned char *)v21 + 50) = BYTE2(v26) & 1;
            v21[7] = v27;
            goto LABEL_4;
          }
        }
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
LABEL_4:
      if (++v5 == v2)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v6;
      }
    }
  }
  return MEMORY[0x263F8EE78];
}

void *sub_25423C100(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B2664E8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25423DD90(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25423C210()
{
  v62[4] = *(id *)MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2664B0);
  uint64_t v0 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v2 = (char *)&v52 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v0);
  uint64_t v4 = (uint64_t *)((char *)&v52 - v3);
  uint64_t v5 = sub_254242AC0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (unint64_t)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_allocWithZone(MEMORY[0x263F086E0]);
  uint64_t v10 = (void *)sub_254242B30();
  id v11 = objc_msgSend(v9, sel_initWithPath_, v10);

  if (!v11)
  {
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
LABEL_11:
    sub_25423D984((uint64_t)v4, &qword_26B2664B0);
    return 0;
  }
  uint64_t v12 = qword_26B2664C8;
  uint64_t v13 = (char **)v11;
  if (v12 != -1) {
LABEL_44:
  }
    swift_once();
  uint64_t v14 = (void *)sub_254242B30();
  if (qword_26B266508 != -1) {
    swift_once();
  }
  uint64_t v15 = (void *)sub_254242B30();
  id v16 = objc_msgSend(v13, sel_URLForResource_withExtension_, v14, v15);

  if (v16)
  {
    sub_254242AB0();

    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v2, 0, 1, v5);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v2, 1, 1, v5);
  }
  sub_25423DFE8((uint64_t)v2, (uint64_t)v4);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {

    goto LABEL_11;
  }
  (*(void (**)(unint64_t, void *, uint64_t))(v6 + 32))(v8, v4, v5);
  uint64_t v18 = sub_254242AD0();
  unint64_t v20 = v19;
  unint64_t v21 = self;
  char v22 = (void *)sub_254242AE0();
  v62[0] = 0;
  id v23 = objc_msgSend(v21, sel_propertyListWithData_options_format_error_, v22, 0, 0, v62);

  if (v23)
  {
    unint64_t v58 = v20;
    id v24 = v62[0];
    sub_254242C10();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2664D0);
    if (swift_dynamicCast()) {
      uint64_t v25 = v61;
    }
    else {
      uint64_t v25 = MEMORY[0x263F8EE78];
    }
    if (qword_26B2664B8 != -1) {
      swift_once();
    }
    uint64_t v28 = (void *)qword_26B266540;
    uint64_t v29 = 0;
    if ((sub_254242AF0() & 1) != 0 && v28)
    {
      uint64_t v30 = v18;
      uint64_t v31 = (void *)sub_254242B30();
      uint64_t v29 = objc_msgSend(v28, sel_arrayForKey_, v31);

      if (v29)
      {
        uint64_t v32 = sub_254242B90();

        uint64_t v29 = (void *)sub_254241F64(v32);
        swift_bridgeObjectRelease();
      }
      uint64_t v18 = v30;
    }
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_25423BEA8(v25, v29);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t v34 = *(void *)(v33 + 16);
    if (v34)
    {
      uint64_t v53 = v18;
      id v54 = v13;
      unint64_t v55 = v8;
      uint64_t v56 = v6;
      uint64_t v57 = v5;
      swift_bridgeObjectRetain();
      uint64_t v52 = v33;
      uint64_t v13 = (char **)(v33 + 56);
      uint64_t v4 = (void *)MEMORY[0x263F8EE80];
      while (1)
      {
        uint64_t v59 = v34;
        uint64_t v6 = (uint64_t)*(v13 - 3);
        uint64_t v36 = (uint64_t)*(v13 - 2);
        int v60 = *((unsigned __int8 *)v13 - 8);
        uint64_t v5 = *((unsigned __int8 *)v13 - 7);
        char v37 = *((unsigned char *)v13 - 6);
        uint64_t v2 = *v13;
        swift_bridgeObjectRetain_n();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v62[0] = v4;
        unint64_t v8 = sub_25423D868(v6, v36);
        uint64_t v40 = v4[2];
        BOOL v41 = (v39 & 1) == 0;
        uint64_t v42 = v40 + v41;
        if (__OFADD__(v40, v41))
        {
          __break(1u);
LABEL_43:
          __break(1u);
          goto LABEL_44;
        }
        char v43 = v39;
        if (v4[3] >= v42)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_2542417FC();
          }
        }
        else
        {
          sub_25423C99C(v42, isUniquelyReferenced_nonNull_native);
          unint64_t v44 = sub_25423D868(v6, v36);
          if ((v43 & 1) != (v45 & 1))
          {
            uint64_t result = sub_254242D00();
            __break(1u);
            return result;
          }
          unint64_t v8 = v44;
        }
        char v46 = v60;
        uint64_t v4 = v62[0];
        if (v43)
        {
          uint64_t v35 = *((void *)v62[0] + 7) + 32 * v8;
          *(void *)uint64_t v35 = v6;
          *(void *)(v35 + 8) = v36;
          *(unsigned char *)(v35 + 16) = v46;
          *(unsigned char *)(v35 + 17) = v5;
          *(unsigned char *)(v35 + 18) = v37;
          *(void *)(v35 + 24) = v2;
          swift_bridgeObjectRelease();
        }
        else
        {
          *((void *)v62[0] + (v8 >> 6) + 8) |= 1 << v8;
          uint64_t v47 = (uint64_t *)(v4[6] + 16 * v8);
          *uint64_t v47 = v6;
          v47[1] = v36;
          uint64_t v48 = v4[7] + 32 * v8;
          *(void *)uint64_t v48 = v6;
          *(void *)(v48 + 8) = v36;
          *(unsigned char *)(v48 + 16) = v46;
          *(unsigned char *)(v48 + 17) = v5;
          *(unsigned char *)(v48 + 18) = v37;
          *(void *)(v48 + 24) = v2;
          uint64_t v49 = v4[2];
          BOOL v50 = __OFADD__(v49, 1);
          uint64_t v51 = v49 + 1;
          if (v50) {
            goto LABEL_43;
          }
          v4[2] = v51;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v13 += 4;
        uint64_t v34 = v59 - 1;
        if (v59 == 1)
        {

          swift_bridgeObjectRelease();
          sub_25423DF90(v53, v58);
          (*(void (**)(unint64_t, uint64_t))(v56 + 8))(v55, v57);
          swift_bridgeObjectRelease();
          return (uint64_t)v4;
        }
      }
    }
    (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRelease();

    sub_25423DF90(v18, v58);
  }
  else
  {
    id v26 = v62[0];
    uint64_t v27 = sub_254242AA0();

    swift_willThrow();
    sub_25423DF90(v18, v20);

    MEMORY[0x25A274580](v27);
    (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v8, v5);
  }
  return 0;
}

uint64_t sub_25423C99C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2664E0);
  char v42 = a2;
  uint64_t v6 = sub_254242CB0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v40 = (void *)(v5 + 64);
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  v38 = v2;
  int64_t v39 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  for (i = v5; ; uint64_t v5 = i)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v13++, 1)) {
      goto LABEL_40;
    }
    if (v13 >= v39) {
      break;
    }
    id v23 = v40;
    unint64_t v24 = v40[v13];
    if (!v24)
    {
      int64_t v25 = v13 + 1;
      if (v13 + 1 >= v39)
      {
LABEL_31:
        swift_release();
        uint64_t v3 = v38;
        if ((v42 & 1) == 0) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      unint64_t v24 = v40[v25];
      if (!v24)
      {
        while (1)
        {
          int64_t v13 = v25 + 1;
          if (__OFADD__(v25, 1)) {
            break;
          }
          if (v13 >= v39) {
            goto LABEL_31;
          }
          unint64_t v24 = v40[v13];
          ++v25;
          if (v24) {
            goto LABEL_20;
          }
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v13;
    }
LABEL_20:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_21:
    id v26 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    uint64_t v29 = *(void *)(v5 + 56) + 32 * v21;
    uint64_t v30 = *(void *)v29;
    uint64_t v31 = *(void *)(v29 + 8);
    char v32 = *(unsigned char *)(v29 + 16);
    char v44 = *(unsigned char *)(v29 + 18);
    char v45 = *(unsigned char *)(v29 + 17);
    uint64_t v43 = *(void *)(v29 + 24);
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_254242D50();
    sub_254242B60();
    uint64_t result = sub_254242D80();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v35 = v16 == v34;
        if (v16 == v34) {
          unint64_t v16 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v11 + 8 * v16);
      }
      while (v36 == -1);
      unint64_t v17 = __clz(__rbit64(~v36)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v28;
    v18[1] = v27;
    uint64_t v19 = *(void *)(v7 + 56) + 32 * v17;
    *(void *)uint64_t v19 = v30;
    *(void *)(v19 + 8) = v31;
    *(unsigned char *)(v19 + 16) = v32;
    *(unsigned char *)(v19 + 17) = v45;
    *(unsigned char *)(v19 + 18) = v44;
    *(void *)(v19 + 24) = v43;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v38;
  id v23 = v40;
  if ((v42 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v37 = 1 << *(unsigned char *)(v5 + 32);
  if (v37 >= 64) {
    bzero(v23, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v23 = -1 << v37;
  }
  *(void *)(v5 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_25423CCE0(uint64_t a1)
{
  sub_25423DF1C();
  uint64_t result = sub_254242BC0();
  int64_t v4 = 0;
  uint64_t v26 = result;
  uint64_t v5 = a1 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a1 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_5;
    }
    int64_t v22 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v22 >= v9) {
      goto LABEL_29;
    }
    unint64_t v23 = *(void *)(v5 + 8 * v22);
    ++v4;
    if (!v23)
    {
      int64_t v4 = v22 + 1;
      if (v22 + 1 >= v9) {
        goto LABEL_29;
      }
      unint64_t v23 = *(void *)(v5 + 8 * v4);
      if (!v23)
      {
        int64_t v4 = v22 + 2;
        if (v22 + 2 >= v9) {
          goto LABEL_29;
        }
        unint64_t v23 = *(void *)(v5 + 8 * v4);
        if (!v23)
        {
          int64_t v4 = v22 + 3;
          if (v22 + 3 >= v9) {
            goto LABEL_29;
          }
          unint64_t v23 = *(void *)(v5 + 8 * v4);
          if (!v23) {
            break;
          }
        }
      }
    }
LABEL_28:
    unint64_t v8 = (v23 - 1) & v23;
    unint64_t v11 = __clz(__rbit64(v23)) + (v4 << 6);
LABEL_5:
    uint64_t v12 = *(void *)(a1 + 56) + 32 * v11;
    uint64_t v13 = *(void *)v12;
    uint64_t v14 = *(void *)(v12 + 8);
    int v15 = *(unsigned __int8 *)(v12 + 17);
    int v16 = *(unsigned __int8 *)(v12 + 18);
    uint64_t v17 = *(void *)(v12 + 24);
    unsigned int v18 = v1 & 0xFF000000 | *(unsigned __int8 *)(v12 + 16);
    if (v15) {
      int v19 = 256;
    }
    else {
      int v19 = 0;
    }
    int v20 = v18 | v19;
    if (v16) {
      int v21 = 0x10000;
    }
    else {
      int v21 = 0;
    }
    int v1 = v20 | v21;
    swift_bridgeObjectRetain();
    sub_25423CEC4((uint64_t)v25, v13, v14, v1, v17);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v24 = v22 + 4;
  if (v24 >= v9)
  {
LABEL_29:
    swift_release();
    return v26;
  }
  unint64_t v23 = *(void *)(v5 + 8 * v24);
  if (v23)
  {
    int64_t v4 = v24;
    goto LABEL_28;
  }
  while (1)
  {
    int64_t v4 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v4 >= v9) {
      goto LABEL_29;
    }
    unint64_t v23 = *(void *)(v5 + 8 * v4);
    ++v24;
    if (v23) {
      goto LABEL_28;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_25423CEC4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v6 = v5;
  int v12 = a4 & 1;
  int v44 = a4 & 0x10000;
  int v45 = a4 & 0x100;
  uint64_t v13 = *v6;
  sub_254242D50();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_254242B60();
  uint64_t v47 = a3;
  swift_bridgeObjectRelease();
  char v46 = v12;
  sub_254242D70();
  sub_254242D70();
  sub_254242D70();
  uint64_t v43 = a5;
  sub_254242D60();
  uint64_t v14 = sub_254242D80();
  uint64_t v15 = -1 << *(unsigned char *)(v13 + 32);
  unint64_t v16 = v14 & ~v15;
  uint64_t v17 = v13 + 56;
  BOOL v41 = v6;
  uint64_t v42 = a1;
  int v40 = a4;
  if ((*(void *)(v13 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16))
  {
    uint64_t v18 = ~v15;
    uint64_t v19 = *(void *)(v13 + 48);
    uint64_t v21 = a2;
    uint64_t v20 = v47;
    while (1)
    {
      uint64_t v22 = v19 + 32 * v16;
      int v23 = *(unsigned __int8 *)(v22 + 16);
      int v24 = *(unsigned __int8 *)(v22 + 17);
      uint64_t v25 = *(void *)(v22 + 24);
      int v26 = (v44 != 0) ^ *(unsigned __int8 *)(v22 + 18);
      if (*(void *)v22 == v21 && *(void *)(v22 + 8) == v20)
      {
        if (((v12 != 0) ^ v23 | (v45 != 0) ^ v24 | v26)) {
          goto LABEL_5;
        }
      }
      else
      {
        char v28 = sub_254242CE0();
        uint64_t v21 = a2;
        uint64_t v20 = v47;
        if (((v12 != 0) ^ v23) & 1 | ((v28 & 1) == 0) | (((v45 != 0) ^ v24) | v26) & 1) {
          goto LABEL_5;
        }
      }
      if (v25 == v43)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v33 = *(void *)(*v41 + 48) + 32 * v16;
        uint64_t v35 = *(void *)v33;
        uint64_t v34 = *(void *)(v33 + 8);
        char v36 = *(unsigned char *)(v33 + 16);
        char v37 = *(unsigned char *)(v33 + 17);
        char v38 = *(unsigned char *)(v33 + 18);
        uint64_t v39 = *(void *)(v33 + 24);
        *(void *)uint64_t v42 = v35;
        *(void *)(v42 + 8) = v34;
        *(unsigned char *)(v42 + 16) = v36;
        *(unsigned char *)(v42 + 17) = v37;
        *(unsigned char *)(v42 + 18) = v38;
        *(void *)(v42 + 24) = v39;
        swift_bridgeObjectRetain();
        return 0;
      }
LABEL_5:
      unint64_t v16 = (v16 + 1) & v18;
      if (((*(void *)(v17 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) == 0) {
        goto LABEL_13;
      }
    }
  }
  uint64_t v21 = a2;
  uint64_t v20 = v47;
LABEL_13:
  uint64_t v29 = v20;
  uint64_t v30 = v21;
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v48 = *v41;
  *BOOL v41 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25423D1C0(v30, v29, v40 & 0x10101, v43, v16, isUniquelyReferenced_nonNull_native);
  *BOOL v41 = v48;
  swift_bridgeObjectRelease();
  *(void *)uint64_t v42 = v30;
  *(void *)(v42 + 8) = v29;
  *(unsigned char *)(v42 + 16) = v46;
  *(unsigned char *)(v42 + 17) = BYTE1(v45);
  *(unsigned char *)(v42 + 18) = BYTE2(v44);
  uint64_t result = 1;
  *(void *)(v42 + 24) = v43;
  return result;
}

uint64_t sub_25423D1C0(uint64_t result, uint64_t a2, int a3, uint64_t a4, unint64_t a5, char a6)
{
  uint64_t v8 = a2;
  uint64_t v9 = result;
  int v10 = a3 & 1;
  uint64_t v11 = a3 & 0x100;
  uint64_t v12 = a3 & 0x10000;
  unint64_t v13 = *(void *)(*v6 + 16);
  unint64_t v14 = *(void *)(*v6 + 24);
  unsigned int v35 = WORD1(v12);
  unsigned int v36 = v11 >> 8;
  if (v14 <= v13 || (a6 & 1) == 0)
  {
    uint64_t v39 = result;
    if (a6)
    {
      sub_254240D60();
    }
    else
    {
      if (v14 > v13)
      {
        uint64_t result = (uint64_t)sub_2542410C8();
        goto LABEL_21;
      }
      sub_25424129C();
    }
    uint64_t v15 = *v6;
    sub_254242D50();
    swift_bridgeObjectRetain();
    sub_254242B60();
    swift_bridgeObjectRelease();
    sub_254242D70();
    sub_254242D70();
    sub_254242D70();
    sub_254242D60();
    uint64_t result = sub_254242D80();
    uint64_t v16 = -1 << *(unsigned char *)(v15 + 32);
    a5 = result & ~v16;
    uint64_t v17 = v15 + 56;
    if ((*(void *)(v15 + 56 + ((a5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a5))
    {
      uint64_t v18 = ~v16;
      uint64_t v19 = *(void *)(v15 + 48);
      uint64_t v8 = a2;
      uint64_t v9 = v39;
      uint64_t v20 = v11;
      int v38 = v10;
      while (1)
      {
        uint64_t v21 = v19 + 32 * a5;
        uint64_t result = *(void *)v21;
        int v22 = *(unsigned __int8 *)(v21 + 16);
        int v23 = *(unsigned __int8 *)(v21 + 17);
        int v24 = (v12 != 0) ^ *(unsigned __int8 *)(v21 + 18);
        if (*(void *)v21 == v9 && *(void *)(v21 + 8) == v8)
        {
          if ((((v10 != 0) ^ v22 | (v20 != 0) ^ v23 | v24) & 1) == 0 && *(void *)(v21 + 24) == a4)
          {
LABEL_20:
            uint64_t result = sub_254242CF0();
            __break(1u);
            break;
          }
        }
        else
        {
          BOOL v41 = v10 != 0;
          BOOL v42 = v20 != 0;
          uint64_t v26 = v12;
          uint64_t v27 = v20;
          uint64_t v28 = *(void *)(v21 + 24);
          uint64_t result = sub_254242CE0();
          uint64_t v29 = v28;
          uint64_t v20 = v27;
          uint64_t v12 = v26;
          uint64_t v9 = v39;
          uint64_t v8 = a2;
          int v10 = v38;
          if (!((v41 ^ v22) & 1 | ((result & 1) == 0) | ((v42 ^ v23) | v24) & 1)
            && v29 == a4)
          {
            goto LABEL_20;
          }
        }
        a5 = (a5 + 1) & v18;
        if (((*(void *)(v17 + ((a5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a5) & 1) == 0) {
          goto LABEL_22;
        }
      }
    }
LABEL_21:
    uint64_t v8 = a2;
    uint64_t v9 = v39;
  }
LABEL_22:
  uint64_t v30 = *v37;
  *(void *)(*v37 + 8 * (a5 >> 6) + 56) |= 1 << a5;
  uint64_t v31 = *(void *)(v30 + 48) + 32 * a5;
  *(void *)uint64_t v31 = v9;
  *(void *)(v31 + 8) = v8;
  *(unsigned char *)(v31 + 16) = v10;
  *(unsigned char *)(v31 + 17) = v36;
  *(unsigned char *)(v31 + 18) = v35;
  *(void *)(v31 + 24) = a4;
  uint64_t v32 = *(void *)(v30 + 16);
  BOOL v33 = __OFADD__(v32, 1);
  uint64_t v34 = v32 + 1;
  if (v33) {
    __break(1u);
  }
  else {
    *(void *)(v30 + 16) = v34;
  }
  return result;
}

unint64_t sub_25423D488@<X0>(unint64_t result@<X0>, void *a2@<X8>)
{
  if (*(void *)(result + 16))
  {
    unint64_t v3 = result;
    uint64_t result = sub_25423D868(0xD000000000000010, 0x80000002542437A0);
    if (v4)
    {
      sub_25423D928(*(void *)(v3 + 56) + 32 * result, (uint64_t)&v21);
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        if (*(void *)(v3 + 16))
        {
          unint64_t v5 = sub_25423D868(0xD000000000000019, 0x80000002542437C0);
          if ((v6 & 1) != 0
            && (sub_25423D928(*(void *)(v3 + 56) + 32 * v5, (uint64_t)&v21), swift_dynamicCast()))
          {
            uint64_t v7 = v19;
          }
          else
          {
            uint64_t v7 = 0;
          }
          if (*(void *)(v3 + 16))
          {
            unint64_t v8 = sub_25423D868(0xD000000000000012, 0x80000002542437E0);
            if ((v9 & 1) != 0
              && (sub_25423D928(*(void *)(v3 + 56) + 32 * v8, (uint64_t)&v21), swift_dynamicCast()))
            {
              if ((_BYTE)v19) {
                uint64_t v10 = 256;
              }
              else {
                uint64_t v10 = 0;
              }
            }
            else
            {
              uint64_t v10 = 0;
            }
            if (*(void *)(v3 + 16))
            {
              unint64_t v17 = sub_25423D868(0xD000000000000015, 0x8000000254243800);
              if (v18)
              {
                sub_25423D928(*(void *)(v3 + 56) + 32 * v17, (uint64_t)&v21);
                if (swift_dynamicCast())
                {
                  if ((_BYTE)v19) {
                    uint64_t v11 = 0x10000;
                  }
                  else {
                    uint64_t v11 = 0;
                  }
LABEL_20:
                  if (qword_26B2664C0 == -1)
                  {
                    if (*(void *)(v3 + 16)) {
                      goto LABEL_22;
                    }
                  }
                  else
                  {
                    swift_once();
                    if (*(void *)(v3 + 16))
                    {
LABEL_22:
                      uint64_t v12 = qword_26B266550;
                      uint64_t v13 = qword_26B266548;
                      swift_bridgeObjectRetain();
                      unint64_t v14 = sub_25423D868(v13, v12);
                      if (v15)
                      {
                        sub_25423D928(*(void *)(v3 + 56) + 32 * v14, (uint64_t)&v21);
                      }
                      else
                      {
                        long long v21 = 0u;
                        long long v22 = 0u;
                      }
                      swift_bridgeObjectRelease();
                      if (*((void *)&v22 + 1))
                      {
                        uint64_t result = swift_dynamicCast();
                        if (result)
                        {
                          if (v19 == 1) {
                            uint64_t v16 = 1;
                          }
                          else {
                            uint64_t v16 = 2 * (v19 == 2);
                          }
                          goto LABEL_41;
                        }
LABEL_40:
                        uint64_t v16 = 0;
LABEL_41:
                        *a2 = v19;
                        a2[1] = v20;
                        a2[2] = v7 | v10 | v11;
                        a2[3] = v16;
                        return result;
                      }
LABEL_39:
                      uint64_t result = sub_25423D984((uint64_t)&v21, &qword_26B2664F0);
                      goto LABEL_40;
                    }
                  }
                  long long v21 = 0u;
                  long long v22 = 0u;
                  goto LABEL_39;
                }
              }
            }
LABEL_19:
            uint64_t v11 = 0;
            goto LABEL_20;
          }
        }
        else
        {
          uint64_t v7 = 0;
        }
        uint64_t v10 = 0;
        goto LABEL_19;
      }
    }
  }
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  return result;
}

unint64_t sub_25423D784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_254242CE0() & 1) == 0)
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
      while (!v14 && (sub_254242CE0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_25423D868(uint64_t a1, uint64_t a2)
{
  sub_254242D50();
  sub_254242B60();
  uint64_t v4 = sub_254242D80();
  return sub_25423D784(a1, a2, v4);
}

uint64_t initializeWithCopy for IRMBBundle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_WORD *)(a1 + 17) = *(_WORD *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_25423D928(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25423D984(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
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

uint64_t storeEnumTagSinglePayload for IRMBBundle(uint64_t result, int a2, int a3)
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

uint64_t getEnumTagSinglePayload for IRMBBundle(uint64_t a1, int a2)
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

ValueMetadata *type metadata accessor for IRMBBundle()
{
  return &type metadata for IRMBBundle;
}

void sub_25423DAC0()
{
  int v1 = v0;
  if ((*v0 & 0x8000000000000000) != 0)
  {
    if (sub_254242C30())
    {
      sub_254241CA4(0, &qword_269DD73B0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      if (v15) {
        goto LABEL_6;
      }
    }
    return;
  }
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  if (v2)
  {
    uint64_t v4 = (v2 - 1) & v2;
    unint64_t v5 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_4:
    unint64_t v6 = *(void **)(*(void *)(*v0 + 48) + 8 * v5);
    id v7 = v6;
    goto LABEL_5;
  }
  int64_t v9 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
LABEL_35:
    __break(1u);
    return;
  }
  int64_t v10 = (unint64_t)(v0[2] + 64) >> 6;
  if (v9 >= v10)
  {
    unint64_t v6 = 0;
    uint64_t v4 = 0;
    goto LABEL_5;
  }
  uint64_t v11 = v0[1];
  unint64_t v12 = *(void *)(v11 + 8 * v9);
  if (v12)
  {
LABEL_14:
    uint64_t v4 = (v12 - 1) & v12;
    unint64_t v5 = __clz(__rbit64(v12)) + (v9 << 6);
    int64_t v3 = v9;
    goto LABEL_4;
  }
  int64_t v13 = v3 + 2;
  if (v3 + 2 >= v10) {
    goto LABEL_31;
  }
  unint64_t v12 = *(void *)(v11 + 8 * v13);
  if (v12)
  {
LABEL_19:
    int64_t v9 = v13;
    goto LABEL_14;
  }
  if (v3 + 3 >= v10) {
    goto LABEL_32;
  }
  unint64_t v12 = *(void *)(v11 + 8 * (v3 + 3));
  if (v12)
  {
    int64_t v9 = v3 + 3;
    goto LABEL_14;
  }
  int64_t v13 = v3 + 4;
  if (v3 + 4 < v10)
  {
    unint64_t v12 = *(void *)(v11 + 8 * v13);
    if (v12) {
      goto LABEL_19;
    }
    int64_t v9 = v3 + 5;
    if (v3 + 5 < v10)
    {
      unint64_t v12 = *(void *)(v11 + 8 * v9);
      if (v12) {
        goto LABEL_14;
      }
      int64_t v9 = v10 - 1;
      int64_t v14 = v3 + 6;
      while (v10 != v14)
      {
        unint64_t v12 = *(void *)(v11 + 8 * v14++);
        if (v12)
        {
          int64_t v9 = v14 - 1;
          goto LABEL_14;
        }
      }
LABEL_31:
      unint64_t v6 = 0;
      uint64_t v4 = 0;
      int64_t v3 = v9;
      goto LABEL_5;
    }
LABEL_32:
    unint64_t v6 = 0;
    uint64_t v4 = 0;
    int64_t v3 = v13;
    goto LABEL_5;
  }
  unint64_t v6 = 0;
  uint64_t v4 = 0;
  v3 += 3;
LABEL_5:
  v1[3] = v3;
  v1[4] = v4;
  if (v6)
  {
LABEL_6:
    uint64_t v8 = v1[5];
    if (!__OFADD__(v8, 1))
    {
      v1[5] = v8 + 1;
      return;
    }
    __break(1u);
    goto LABEL_35;
  }
}

uint64_t sub_25423DCC0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if ((result & 0xC000000000000001) != 0)
  {
    sub_254242C20();
    sub_254241CA4(0, &qword_269DD73B0);
    sub_254241CE0();
    sub_254242BD0();
    uint64_t result = v10;
    uint64_t v3 = v11;
    long long v4 = v12;
    uint64_t v5 = v13;
  }
  else
  {
    uint64_t v6 = -1;
    uint64_t v7 = -1 << *(unsigned char *)(result + 32);
    uint64_t v8 = ~v7;
    uint64_t v3 = result + 56;
    uint64_t v9 = -v7;
    if (v9 < 64) {
      uint64_t v6 = ~(-1 << v9);
    }
    uint64_t v5 = v6 & *(void *)(result + 56);
    long long v4 = (unint64_t)v8;
  }
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v3;
  *(_OWORD *)(a2 + 16) = v4;
  *(void *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_25423DD90(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_254242CD0();
  __break(1u);
  return result;
}

uint64_t sub_25423DE84()
{
  return swift_release();
}

uint64_t static IRMBManager.mergeBundles(_:)(uint64_t a1)
{
  *(void *)(v1 + 248) = a1;
  return MEMORY[0x270FA2498](sub_25423B7F8, 0, 0);
}

unint64_t sub_25423DF1C()
{
  unint64_t result = qword_26B266520;
  if (!qword_26B266520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B266520);
  }
  return result;
}

uint64_t IRMBBundle.mediaType.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t IRMBBundle.isEligibleForOneTapSuggestion.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t IRMBBundle.isEligibleForCallToAction.getter()
{
  return *(unsigned __int8 *)(v0 + 18);
}

uint64_t IRMBBundle.isEligibleForAutoRoute.getter()
{
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_25423DF90(uint64_t a1, unint64_t a2)
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

uint64_t sub_25423DFE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2664B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25423E050()
{
  uint64_t v0 = sub_254242B20();
  __swift_allocate_value_buffer(v0, qword_269DD73F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269DD73F8);
  return sub_254242B10();
}

uint64_t static IRMBManager.query(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25423E188;
  v7[8] = a3;
  v7[9] = 0;
  v7[6] = a1;
  v7[7] = a2;
  return MEMORY[0x270FA2498](sub_25423E2A0, 0, 0);
}

uint64_t sub_25423E188()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t static IRMBManager.query(_:priorBundle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a3;
  v4[9] = a4;
  v4[6] = a1;
  v4[7] = a2;
  return MEMORY[0x270FA2498](sub_25423E2A0, 0, 0);
}

uint64_t sub_25423E2A0()
{
  unint64_t v1 = sub_25423C210();
  if (!v1) {
    unint64_t v1 = sub_25423E650(MEMORY[0x263F8EE78]);
  }
  unint64_t v2 = v1;
  if (*(void *)(v1 + 16))
  {
    uint64_t v4 = *(void *)(v0 + 56);
    uint64_t v3 = *(void *)(v0 + 64);
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_25423D868(v4, v3);
    if (v6)
    {
      uint64_t v7 = *(void *)(v2 + 56) + 32 * v5;
      uint64_t v9 = *(void *)v7;
      uint64_t v8 = *(void *)(v7 + 8);
      uint64_t v10 = *(unsigned __int8 *)(v7 + 16);
      int v11 = *(unsigned __int8 *)(v7 + 17);
      int v12 = *(unsigned __int8 *)(v7 + 18);
      uint64_t v13 = *(void *)(v7 + 24);
      uint64_t v14 = 256;
      if (!v11) {
        uint64_t v14 = 0;
      }
      uint64_t v15 = v14 | v10;
      uint64_t v16 = 0x10000;
      if (!v12) {
        uint64_t v16 = 0;
      }
      uint64_t v17 = v15 | v16;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v8 = 0;
      uint64_t v17 = 0;
      uint64_t v13 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
    uint64_t v17 = 0;
    uint64_t v13 = 0;
  }
  *(void *)(v0 + 80) = v8;
  uint64_t v19 = *(void *)(v0 + 56);
  uint64_t v18 = *(void *)(v0 + 64);
  swift_bridgeObjectRelease();
  uint64_t v20 = sub_254242238(v19, v18);
  uint64_t v22 = v21;
  *(void *)(v0 + 88) = v21;
  *(void *)(v0 + 16) = v9;
  *(void *)(v0 + 24) = v8;
  *(void *)(v0 + 32) = v17;
  *(void *)(v0 + 40) = v13;
  uint64_t v23 = swift_task_alloc();
  *(void *)(v0 + 96) = v23;
  *(void *)uint64_t v23 = v0;
  *(void *)(v23 + 8) = sub_25423E458;
  uint64_t v25 = *(void *)(v0 + 64);
  uint64_t v24 = *(void *)(v0 + 72);
  long long v26 = *(_OWORD *)(v0 + 48);
  *(void *)(v23 + 80) = v20;
  *(void *)(v23 + 88) = v22;
  *(void *)(v23 + 64) = v25;
  *(void *)(v23 + 72) = v24;
  *(_OWORD *)(v23 + 48) = v26;
  long long v27 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v23 + 96) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v23 + 112) = v27;
  return MEMORY[0x270FA2498](sub_25423E7E0, 0, 0);
}

uint64_t sub_25423E458()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    unint64_t v2 = sub_25423E5EC;
  }
  else {
    unint64_t v2 = sub_25423E588;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25423E588()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25423E5EC()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_25423E650(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2664E0);
  uint64_t v2 = sub_254242CC0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v21 = v2 + 64;
  swift_retain();
  unint64_t v5 = (void *)(a1 + 72);
  while (1)
  {
    uint64_t v22 = v4;
    uint64_t v6 = *(v5 - 5);
    uint64_t v7 = *(v5 - 4);
    uint64_t v9 = *(v5 - 3);
    uint64_t v8 = *(v5 - 2);
    char v10 = *((unsigned char *)v5 - 8);
    char v11 = *((unsigned char *)v5 - 7);
    char v12 = *((unsigned char *)v5 - 6);
    uint64_t v13 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_25423D868(v6, v7);
    if (v15) {
      break;
    }
    *(void *)(v21 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v16 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v16 = v6;
    v16[1] = v7;
    uint64_t v17 = v3[7] + 32 * result;
    *(void *)uint64_t v17 = v9;
    *(void *)(v17 + 8) = v8;
    *(unsigned char *)(v17 + 16) = v10;
    *(unsigned char *)(v17 + 17) = v11;
    *(unsigned char *)(v17 + 18) = v12;
    *(void *)(v17 + 24) = v13;
    uint64_t v18 = v3[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (v19) {
      goto LABEL_11;
    }
    v5 += 6;
    v3[2] = v20;
    uint64_t v4 = v22 - 1;
    if (v22 == 1)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_25423E7B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 80) = a6;
  *(void *)(v7 + 88) = a7;
  *(void *)(v7 + 64) = a3;
  *(void *)(v7 + 72) = a4;
  *(void *)(v7 + 48) = a1;
  *(void *)(v7 + 56) = a2;
  long long v8 = a5[1];
  *(_OWORD *)(v7 + 96) = *a5;
  *(_OWORD *)(v7 + 112) = v8;
  return MEMORY[0x270FA2498](sub_25423E7E0, 0, 0);
}

uint64_t sub_25423E7E0()
{
  uint64_t v61 = v0;
  uint64_t v1 = *(void **)(v0 + 72);
  if (!v1) {
    goto LABEL_13;
  }
  id v2 = objc_msgSend(*(id *)(v0 + 72), sel_identifier);
  if (!v2) {
    goto LABEL_8;
  }
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v6 = sub_254242B40();
  uint64_t v8 = v7;

  if (v6 == v5 && v8 == v4)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  char v10 = sub_254242CE0();
  swift_bridgeObjectRelease();
  if (v10)
  {
LABEL_13:
    uint64_t v21 = *(void *)(v0 + 104);
    if (v21)
    {
      BOOL v22 = *(void *)(v0 + 96) == *(void *)(v0 + 56) && v21 == *(void *)(v0 + 64);
      if (!v22 && (sub_254242CE0() & 1) == 0)
      {
        uint64_t v41 = *(void *)(v0 + 112);
        uint64_t v40 = *(void *)(v0 + 120);
        long long v56 = *(_OWORD *)(v0 + 96);
        uint64_t v57 = 0;
        unint64_t v58 = 0xE000000000000000;
        sub_254242C60();
        sub_254242B70();
        sub_254242B70();
        sub_254242B70();
        *(_OWORD *)(v0 + 16) = v56;
        *(void *)(v0 + 32) = v41;
        *(void *)(v0 + 40) = v40;
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_269DD73C0);
        sub_254242B50();
        sub_254242B70();
        swift_bridgeObjectRelease();
        sub_254242B70();
        uint64_t v13 = v57;
        unint64_t v14 = v58;
        if (qword_269DD7370 != -1) {
          swift_once();
        }
        uint64_t v42 = sub_254242B20();
        __swift_project_value_buffer(v42, (uint64_t)qword_269DD73F8);
        swift_bridgeObjectRetain_n();
        uint64_t v16 = sub_254242B00();
        os_log_type_t v43 = sub_254242BE0();
        if (os_log_type_enabled(v16, v43))
        {
          uint64_t v18 = (uint8_t *)swift_slowAlloc();
          uint64_t v44 = swift_slowAlloc();
          uint64_t v57 = v44;
          *(_DWORD *)uint64_t v18 = 136315138;
          swift_bridgeObjectRetain();
          *(void *)(v0 + 16) = sub_254240708(v13, v14, &v57);
          sub_254242BF0();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_25423A000, v16, v43, "%s", v18, 0xCu);
          swift_arrayDestroy();
          uint64_t v20 = v44;
          goto LABEL_40;
        }
LABEL_41:
        swift_bridgeObjectRelease_n();
        goto LABEL_42;
      }
    }
    if (v1)
    {
      sub_254242570(*(void **)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88), &v57);
      uint64_t v23 = v57;
      unint64_t v24 = v58;
      unsigned int v25 = v59;
      uint64_t v1 = v60;
      uint64_t v26 = *(void *)(v0 + 88);
      if (v21)
      {
LABEL_21:
        if (v26)
        {
          uint64_t v27 = sub_2542423B0(*(void *)(v0 + 80), v26);
          uint64_t v28 = *(void *)(v0 + 112);
          if (v24)
          {
            if (v23 == *(void *)(v0 + 96) && v24 == *(void *)(v0 + 104) || (sub_254242CE0() & 1) != 0)
            {
              uint64_t v30 = *(void *)(v0 + 56);
              uint64_t v29 = *(void *)(v0 + 64);
              uint64_t v31 = *(void *)(v0 + 48);
              int v32 = v25 & v28;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              *(void *)uint64_t v31 = v30;
              *(void *)(v31 + 8) = v29;
              *(unsigned char *)(v31 + 16) = v32 & 1;
              *(unsigned char *)(v31 + 17) = BYTE1(v32) & 1;
              *(unsigned char *)(v31 + 18) = BYTE2(v32) & 1;
              *(void *)(v31 + 24) = v27;
LABEL_52:
              char v46 = *(uint64_t (**)(void))(v0 + 8);
              goto LABEL_53;
            }
            swift_bridgeObjectRelease();
            __break(1u);
LABEL_57:
            uint64_t result = swift_bridgeObjectRelease();
            __break(1u);
            return result;
          }
          uint64_t v47 = *(void *)(v0 + 64);
          uint64_t v48 = *(void *)(v0 + 48);
          *(void *)uint64_t v48 = *(void *)(v0 + 56);
          *(void *)(v48 + 8) = v47;
          *(unsigned char *)(v48 + 16) = v28 & 1;
          *(unsigned char *)(v48 + 17) = BYTE1(v28) & 1;
          *(unsigned char *)(v48 + 18) = BYTE2(v28) & 1;
          *(void *)(v48 + 24) = v27;
LABEL_51:
          swift_bridgeObjectRetain();
          goto LABEL_52;
        }
        if (!v24)
        {
          uint64_t v49 = *(void *)(v0 + 120);
          int v50 = *(_DWORD *)(v0 + 112);
          uint64_t v51 = *(void *)(v0 + 104);
          uint64_t v52 = *(void *)(v0 + 48);
          *(void *)uint64_t v52 = *(void *)(v0 + 96);
          *(void *)(v52 + 8) = v51;
          *(unsigned char *)(v52 + 16) = v50 & 1;
          *(unsigned char *)(v52 + 17) = BYTE1(v50) & 1;
          *(unsigned char *)(v52 + 18) = BYTE2(v50) & 1;
          *(void *)(v52 + 24) = v49;
          goto LABEL_51;
        }
        uint64_t v38 = *(void *)(v0 + 112);
        if ((v23 != *(void *)(v0 + 96) || v24 != *(void *)(v0 + 104)) && (sub_254242CE0() & 1) == 0) {
          goto LABEL_57;
        }
        uint64_t v39 = *(void *)(v0 + 48);
        *(void *)uint64_t v39 = v23;
        *(void *)(v39 + 8) = v24;
        *(unsigned char *)(v39 + 16) = v25 & v38 & 1;
        *(unsigned char *)(v39 + 17) = ((unsigned __int16)(v25 & v38) >> 8) & 1;
        *(unsigned char *)(v39 + 18) = ((v25 & v38) >> 16) & 1;
LABEL_46:
        *(void *)(v39 + 24) = v1;
        goto LABEL_52;
      }
    }
    else
    {
      uint64_t v23 = 0;
      unint64_t v24 = 0;
      unsigned int v25 = 0;
      uint64_t v26 = *(void *)(v0 + 88);
      if (v21) {
        goto LABEL_21;
      }
    }
    if (v26)
    {
      uint64_t v33 = sub_2542423B0(*(void *)(v0 + 80), v26);
      uint64_t v35 = *(void *)(v0 + 56);
      uint64_t v34 = *(void *)(v0 + 64);
      uint64_t v36 = *(void *)(v0 + 48);
      if (v24)
      {
        swift_bridgeObjectRelease();
        *(void *)uint64_t v36 = v35;
        *(void *)(v36 + 8) = v34;
        *(unsigned char *)(v36 + 16) = v25 & 1;
        *(unsigned char *)(v36 + 17) = BYTE1(v25) & 1;
        int v37 = HIWORD(v25) & 1;
      }
      else
      {
        *(void *)uint64_t v36 = v35;
        *(void *)(v36 + 8) = v34;
        *(_WORD *)(v36 + 16) = 257;
        LOBYTE(v37) = 1;
      }
      *(unsigned char *)(v36 + 18) = v37;
      *(void *)(v36 + 24) = v33;
      goto LABEL_51;
    }
    if (!v24)
    {
      uint64_t v53 = *(void *)(v0 + 64);
      uint64_t v54 = *(void *)(v0 + 48);
      *(void *)uint64_t v54 = *(void *)(v0 + 56);
      *(void *)(v54 + 8) = v53;
      *(_WORD *)(v54 + 16) = 0;
      *(unsigned char *)(v54 + 18) = 0;
      *(void *)(v54 + 24) = 0;
      goto LABEL_51;
    }
    uint64_t v39 = *(void *)(v0 + 48);
    *(void *)uint64_t v39 = v23;
    *(void *)(v39 + 8) = v24;
    *(unsigned char *)(v39 + 16) = v25 & 1;
    *(unsigned char *)(v39 + 17) = BYTE1(v25) & 1;
    *(unsigned char *)(v39 + 18) = BYTE2(v25) & 1;
    goto LABEL_46;
  }
LABEL_8:
  uint64_t v11 = *(void *)(v0 + 72);
  uint64_t v57 = 0;
  unint64_t v58 = 0xE000000000000000;
  sub_254242C60();
  sub_254242B70();
  sub_254242B70();
  sub_254242B70();
  *(void *)(v0 + 16) = v11;
  id v12 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DD73D0);
  sub_254242B50();
  sub_254242B70();
  swift_bridgeObjectRelease();
  uint64_t v13 = v57;
  unint64_t v14 = v58;
  if (qword_269DD7370 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_254242B20();
  __swift_project_value_buffer(v15, (uint64_t)qword_269DD73F8);
  swift_bridgeObjectRetain_n();
  uint64_t v16 = sub_254242B00();
  os_log_type_t v17 = sub_254242BE0();
  if (!os_log_type_enabled(v16, v17)) {
    goto LABEL_41;
  }
  uint64_t v18 = (uint8_t *)swift_slowAlloc();
  uint64_t v19 = swift_slowAlloc();
  uint64_t v57 = v19;
  *(_DWORD *)uint64_t v18 = 136315138;
  swift_bridgeObjectRetain();
  *(void *)(v0 + 16) = sub_254240708(v13, v14, &v57);
  sub_254242BF0();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_25423A000, v16, v17, "%s", v18, 0xCu);
  swift_arrayDestroy();
  uint64_t v20 = v19;
LABEL_40:
  MEMORY[0x25A274650](v20, -1, -1);
  MEMORY[0x25A274650](v18, -1, -1);
LABEL_42:

  sub_254241D80();
  swift_allocError();
  *int v45 = v13;
  v45[1] = v14;
  swift_willThrow();
  char v46 = *(uint64_t (**)(void))(v0 + 8);
LABEL_53:
  return v46();
}

uint64_t sub_25423EF90()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_25423F0B8, 0, 0);
}

uint64_t sub_25423F0B8()
{
  uint64_t v54 = v0 + 160;
  uint64_t v1 = *(void **)(v0 + 264);
  uint64_t v2 = *(void *)(v0 + 272);
  while (1)
  {
    id v3 = objc_msgSend(v1, sel_identifier);
    uint64_t v4 = *(void **)(v0 + 264);
    if (v3) {
      break;
    }

    sub_25423DAC0();
    if (!v6)
    {
      sub_25423DE84();
      uint64_t v28 = swift_bridgeObjectRetain();
      uint64_t v29 = sub_25423CCE0(v28);
      swift_bridgeObjectRelease();
      uint64_t v30 = *(uint64_t (**)(uint64_t))(v0 + 8);
      return v30(v29);
    }
    uint64_t v1 = v6;
    *(void *)(v0 + 264) = v6;
    if ((unint64_t)(0x51EB851EB851EB8 - 0x70A3D70A3D70A3D7 * v5) <= 0xA3D70A3D70A3D70)
    {
      sub_254242BA0();
      *(void *)(v0 + 272) = v2;
      if (v2)
      {
        sub_25423DE84();

        swift_bridgeObjectRelease();
        uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
        return v7();
      }
      else
      {
        uint64_t v31 = (void *)swift_task_alloc();
        *(void *)(v0 + 280) = v31;
        void *v31 = v0;
        v31[1] = sub_25423EF90;
        return MEMORY[0x270FA2000]();
      }
    }
  }
  uint64_t v9 = v3;
  uint64_t v10 = sub_254242B40();
  uint64_t v12 = v11;

  *(void *)(v0 + 288) = v10;
  *(void *)(v0 + 296) = v12;
  id v13 = v4;
  unint64_t v14 = sub_25423C210();
  if (!v14) {
    unint64_t v14 = sub_25423E650(MEMORY[0x263F8EE78]);
  }
  unint64_t v15 = v14;
  if (*(void *)(v14 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v16 = sub_25423D868(v10, v12);
    if (v17)
    {
      uint64_t v18 = *(void *)(v15 + 56) + 32 * v16;
      uint64_t v20 = *(void *)v18;
      uint64_t v19 = *(void *)(v18 + 8);
      uint64_t v21 = *(unsigned __int8 *)(v18 + 16);
      int v22 = *(unsigned __int8 *)(v18 + 17);
      int v23 = *(unsigned __int8 *)(v18 + 18);
      uint64_t v24 = *(void *)(v18 + 24);
      uint64_t v25 = 256;
      if (!v22) {
        uint64_t v25 = 0;
      }
      uint64_t v26 = v25 | v21;
      uint64_t v27 = 0x10000;
      if (!v23) {
        uint64_t v27 = 0;
      }
      uint64_t v53 = v26 | v27;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v19 = 0;
      uint64_t v53 = 0;
      uint64_t v24 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v19 = 0;
    uint64_t v53 = 0;
    uint64_t v24 = 0;
  }
  *(void *)(v0 + 304) = v19;
  swift_bridgeObjectRelease();
  id v32 = objc_allocWithZone(MEMORY[0x263F01878]);
  swift_bridgeObjectRetain();
  uint64_t v33 = (void *)sub_254242B30();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 240) = 0;
  id v34 = objc_msgSend(v32, sel_initWithBundleIdentifier_allowPlaceholder_error_, v33, 0, v0 + 240);

  uint64_t v35 = *(void **)(v0 + 240);
  if (v34)
  {
    id v36 = v35;
    id v37 = objc_msgSend(v34, sel_infoDictionary);
    uint64_t v38 = (void *)sub_254242B30();
    sub_254241CA4(0, (unint64_t *)&qword_26B2664D8);
    id v39 = objc_msgSend(v37, sel_objectForKey_ofClass_, v38, swift_getObjCClassFromMetadata());

    if (v39)
    {
      uint64_t v40 = v0 + 192;
      sub_254242C10();

      swift_unknownObjectRelease();
    }
    else
    {

      uint64_t v40 = v0 + 192;
      *(_OWORD *)(v0 + 192) = 0u;
      *(_OWORD *)(v0 + 208) = 0u;
    }
    sub_2542419C4(v40, v54);
    uint64_t v47 = v0 + 64;
    uint64_t v48 = v53;
    if (*(void *)(v0 + 184))
    {
      int v49 = swift_dynamicCast();
      if (v49) {
        uint64_t v45 = *(void *)(v0 + 224);
      }
      else {
        uint64_t v45 = 0;
      }
      if (v49) {
        uint64_t v46 = *(void *)(v0 + 232);
      }
      else {
        uint64_t v46 = 0;
      }
    }
    else
    {
      sub_254241A2C(v54);
      uint64_t v45 = 0;
      uint64_t v46 = 0;
    }
  }
  else
  {
    id v41 = v35;
    uint64_t v42 = v20;
    uint64_t v43 = sub_254242AA0();

    swift_willThrow();
    uint64_t v44 = v43;
    uint64_t v20 = v42;
    MEMORY[0x25A274580](v44);
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    uint64_t v47 = v0 + 64;
    uint64_t v48 = v53;
  }
  *(void *)(v0 + 312) = v46;
  *(void *)(v0 + 96) = v20;
  *(void *)(v0 + 104) = v19;
  *(void *)(v0 + 112) = v48;
  *(void *)(v0 + 120) = v24;
  uint64_t v50 = swift_task_alloc();
  *(void *)(v0 + 320) = v50;
  *(void *)uint64_t v50 = v0;
  *(void *)(v50 + 8) = sub_25423F6A8;
  uint64_t v51 = *(void *)(v0 + 264);
  *(void *)(v50 + 80) = v45;
  *(void *)(v50 + 88) = v46;
  *(void *)(v50 + 64) = v12;
  *(void *)(v50 + 72) = v51;
  *(void *)(v50 + 48) = v47;
  *(void *)(v50 + 56) = v10;
  long long v52 = *(_OWORD *)(v0 + 112);
  *(_OWORD *)(v50 + 96) = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v50 + 112) = v52;
  return MEMORY[0x270FA2498](sub_25423E7E0, 0, 0);
}

uint64_t sub_25423F6A8()
{
  *(void *)(*(void *)v1 + 328) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_25423FEF4;
  }
  else {
    uint64_t v2 = sub_25423F800;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25423F800()
{
  uint64_t v1 = v0;
  uint64_t v76 = *(void *)(v0 + 288);
  uint64_t v79 = *(void *)(v0 + 296);
  int v2 = *(unsigned __int8 *)(v0 + 339);
  uint64_t v3 = *(void *)(v0 + 256);
  uint64_t v4 = *(void **)(v0 + 264);

  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v0 + 64);
  uint64_t v5 = v0 + 64;
  uint64_t v74 = v6;
  uint64_t v72 = *(void *)(v5 + 8);
  int v7 = *(unsigned __int8 *)(v5 + 16);
  int v8 = *(unsigned __int8 *)(v5 + 17);
  int v9 = *(unsigned __int8 *)(v5 + 18);
  uint64_t v10 = *(void *)(v5 + 24);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v81 = v3;
  if (v8) {
    int v12 = 256;
  }
  else {
    int v12 = 0;
  }
  int v13 = v7 | (v2 << 24) | v12;
  if (v9) {
    int v14 = 0x10000;
  }
  else {
    int v14 = 0;
  }
  int v15 = v13 | v14;
  sub_2542415D4(v74, v72, v13 | v14, v10, v76, v79, isUniquelyReferenced_nonNull_native, v5 + 64);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25423DAC0();
  if (v17)
  {
    uint64_t v18 = v17;
    v73 = (_OWORD *)(v5 + 128);
    uint64_t v75 = v5 + 96;
    uint64_t v77 = v5 + 176;
    uint64_t v80 = v5;
    uint64_t v19 = *(void *)(v1 + 328);
    *(_DWORD *)(v1 + 336) = v15;
    *(void *)(v1 + 256) = v81;
    uint64_t v20 = (void *)v1;
    while (1)
    {
      v20[33] = v18;
      if (0x8F5C28F5C28F5C29 * v16 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70) {
        break;
      }
      id v21 = objc_msgSend(v18, sel_identifier);
      int v22 = v20;
      int v23 = (void *)v20[33];
      if (v21)
      {
        uint64_t v30 = v21;
        uint64_t v31 = sub_254242B40();
        uint64_t v33 = v32;

        v20[36] = v31;
        v20[37] = v33;
        id v34 = v23;
        unint64_t v35 = sub_25423C210();
        if (!v35) {
          unint64_t v35 = sub_25423E650(MEMORY[0x263F8EE78]);
        }
        unint64_t v36 = v35;
        uint64_t v37 = v77;
        uint64_t v38 = v22;
        if (*(void *)(v35 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v39 = sub_25423D868(v31, v33);
          if (v40)
          {
            uint64_t v41 = *(void *)(v36 + 56) + 32 * v39;
            uint64_t v42 = *(void *)(v41 + 8);
            uint64_t v71 = *(void *)v41;
            uint64_t v43 = *(unsigned __int8 *)(v41 + 16);
            int v44 = *(unsigned __int8 *)(v41 + 17);
            int v45 = *(unsigned __int8 *)(v41 + 18);
            uint64_t v46 = *(void *)(v41 + 24);
            uint64_t v47 = 256;
            if (!v44) {
              uint64_t v47 = 0;
            }
            uint64_t v48 = v47 | v43;
            uint64_t v49 = 0x10000;
            if (!v45) {
              uint64_t v49 = 0;
            }
            uint64_t v78 = v48 | v49;
            swift_bridgeObjectRetain();
          }
          else
          {
            uint64_t v71 = 0;
            uint64_t v42 = 0;
            uint64_t v78 = 0;
            uint64_t v46 = 0;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v71 = 0;
          uint64_t v42 = 0;
          uint64_t v78 = 0;
          uint64_t v46 = 0;
        }
        v22[38] = v42;
        swift_bridgeObjectRelease();
        id v51 = objc_allocWithZone(MEMORY[0x263F01878]);
        swift_bridgeObjectRetain();
        long long v52 = (void *)sub_254242B30();
        swift_bridgeObjectRelease();
        v22[30] = 0;
        id v53 = objc_msgSend(v51, sel_initWithBundleIdentifier_allowPlaceholder_error_, v52, 0, v37);

        uint64_t v54 = (void *)v22[30];
        if (v53)
        {
          id v55 = v54;
          id v56 = objc_msgSend(v53, sel_infoDictionary);
          uint64_t v57 = (void *)sub_254242B30();
          sub_254241CA4(0, (unint64_t *)&qword_26B2664D8);
          id v58 = objc_msgSend(v56, sel_objectForKey_ofClass_, v57, swift_getObjCClassFromMetadata());

          if (v58)
          {
            uint64_t v59 = (uint64_t)v73;
            sub_254242C10();

            swift_unknownObjectRelease();
          }
          else
          {

            uint64_t v59 = (uint64_t)v73;
            _OWORD *v73 = 0u;
            v73[1] = 0u;
          }
          uint64_t v67 = v71;
          sub_2542419C4(v59, v75);
          uint64_t v66 = v78;
          uint64_t v65 = v80;
          if (v38[23])
          {
            int v68 = swift_dynamicCast();
            if (v68) {
              uint64_t v63 = v38[28];
            }
            else {
              uint64_t v63 = 0;
            }
            if (v68) {
              uint64_t v64 = v38[29];
            }
            else {
              uint64_t v64 = 0;
            }
          }
          else
          {
            sub_254241A2C(v75);
            uint64_t v63 = 0;
            uint64_t v64 = 0;
          }
        }
        else
        {
          id v60 = v54;
          uint64_t v61 = sub_254242AA0();

          swift_willThrow();
          uint64_t v62 = v61;
          uint64_t v38 = v22;
          MEMORY[0x25A274580](v62);
          uint64_t v63 = 0;
          uint64_t v64 = 0;
          uint64_t v66 = v78;
          uint64_t v65 = v80;
          uint64_t v67 = v71;
        }
        v38[39] = v64;
        v38[12] = v67;
        v38[13] = v42;
        v38[14] = v66;
        v38[15] = v46;
        uint64_t v69 = swift_task_alloc();
        v38[40] = v69;
        *(void *)uint64_t v69 = v38;
        *(void *)(v69 + 8) = sub_25423F6A8;
        uint64_t v70 = v38[33];
        *(void *)(v69 + 80) = v63;
        *(void *)(v69 + 88) = v64;
        *(void *)(v69 + 64) = v33;
        *(void *)(v69 + 72) = v70;
        *(void *)(v69 + 48) = v65;
        *(void *)(v69 + 56) = v31;
        *(_OWORD *)(v69 + 96) = *((_OWORD *)v38 + 6);
        *(_OWORD *)(v69 + 112) = *((_OWORD *)v38 + 7);
        return MEMORY[0x270FA2498](sub_25423E7E0, 0, 0);
      }

      sub_25423DAC0();
      uint64_t v18 = v24;
      if (!v24) {
        goto LABEL_14;
      }
    }
    sub_254242BA0();
    v20[34] = v19;
    if (v19)
    {
      sub_25423DE84();

      swift_bridgeObjectRelease();
      uint64_t v29 = (uint64_t (*)(void))v20[1];
      return v29();
    }
    else
    {
      uint64_t v50 = (void *)swift_task_alloc();
      v20[35] = v50;
      *uint64_t v50 = v20;
      v50[1] = sub_25423EF90;
      return MEMORY[0x270FA2000]();
    }
  }
  else
  {
    uint64_t v20 = (void *)v1;
LABEL_14:
    sub_25423DE84();
    uint64_t v25 = swift_bridgeObjectRetain();
    uint64_t v26 = sub_25423CCE0(v25);
    swift_bridgeObjectRelease();
    uint64_t v27 = (uint64_t (*)(uint64_t))v20[1];
    return v27(v26);
  }
}

uint64_t sub_25423FEF4()
{
  uint64_t v1 = *(void *)(v0 + 328);
  int v2 = *(void **)(v0 + 264);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  MEMORY[0x25A274580](v1);
  sub_25423DAC0();
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v54 = v0 + 160;
    while (1)
    {
      *(void *)(v0 + 264) = v5;
      if ((unint64_t)(0x51EB851EB851EB8 - 0x70A3D70A3D70A3D7 * v3) <= 0xA3D70A3D70A3D70) {
        break;
      }
      id v6 = objc_msgSend(v5, sel_identifier);
      int v7 = *(void **)(v0 + 264);
      if (v6)
      {
        int v13 = v6;
        uint64_t v14 = sub_254242B40();
        uint64_t v16 = v15;

        *(void *)(v0 + 288) = v14;
        *(void *)(v0 + 296) = v16;
        id v17 = v7;
        unint64_t v18 = sub_25423C210();
        if (!v18) {
          unint64_t v18 = sub_25423E650(MEMORY[0x263F8EE78]);
        }
        unint64_t v19 = v18;
        if (*(void *)(v18 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v20 = sub_25423D868(v14, v16);
          if (v21)
          {
            uint64_t v22 = *(void *)(v19 + 56) + 32 * v20;
            uint64_t v23 = *(void *)v22;
            uint64_t v24 = *(void *)(v22 + 8);
            uint64_t v25 = *(unsigned __int8 *)(v22 + 16);
            int v26 = *(unsigned __int8 *)(v22 + 17);
            int v27 = *(unsigned __int8 *)(v22 + 18);
            uint64_t v52 = *(void *)(v22 + 24);
            uint64_t v28 = 256;
            if (!v26) {
              uint64_t v28 = 0;
            }
            uint64_t v29 = v28 | v25;
            uint64_t v30 = 0x10000;
            if (!v27) {
              uint64_t v30 = 0;
            }
            uint64_t v53 = v29 | v30;
            swift_bridgeObjectRetain();
          }
          else
          {
            uint64_t v23 = 0;
            uint64_t v24 = 0;
            uint64_t v52 = 0;
            uint64_t v53 = 0;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v23 = 0;
          uint64_t v24 = 0;
          uint64_t v52 = 0;
          uint64_t v53 = 0;
        }
        *(void *)(v0 + 304) = v24;
        swift_bridgeObjectRelease();
        id v32 = objc_allocWithZone(MEMORY[0x263F01878]);
        swift_bridgeObjectRetain();
        uint64_t v33 = (void *)sub_254242B30();
        swift_bridgeObjectRelease();
        *(void *)(v0 + 240) = 0;
        id v34 = objc_msgSend(v32, sel_initWithBundleIdentifier_allowPlaceholder_error_, v33, 0, v0 + 240);

        unint64_t v35 = *(void **)(v0 + 240);
        if (v34)
        {
          id v36 = v35;
          id v37 = objc_msgSend(v34, sel_infoDictionary);
          uint64_t v38 = (void *)sub_254242B30();
          sub_254241CA4(0, (unint64_t *)&qword_26B2664D8);
          id v39 = objc_msgSend(v37, sel_objectForKey_ofClass_, v38, swift_getObjCClassFromMetadata());

          if (v39)
          {
            uint64_t v40 = v0 + 192;
            sub_254242C10();

            swift_unknownObjectRelease();
          }
          else
          {

            uint64_t v40 = v0 + 192;
            *(_OWORD *)(v0 + 192) = 0u;
            *(_OWORD *)(v0 + 208) = 0u;
          }
          uint64_t v47 = v52;
          uint64_t v41 = v14;
          sub_2542419C4(v40, v54);
          uint64_t v46 = v0 + 64;
          if (*(void *)(v0 + 184))
          {
            int v48 = swift_dynamicCast();
            if (v48) {
              uint64_t v44 = *(void *)(v0 + 224);
            }
            else {
              uint64_t v44 = 0;
            }
            if (v48) {
              uint64_t v45 = *(void *)(v0 + 232);
            }
            else {
              uint64_t v45 = 0;
            }
          }
          else
          {
            sub_254241A2C(v54);
            uint64_t v44 = 0;
            uint64_t v45 = 0;
          }
        }
        else
        {
          uint64_t v41 = v14;
          id v42 = v35;
          uint64_t v43 = sub_254242AA0();

          swift_willThrow();
          MEMORY[0x25A274580](v43);
          uint64_t v44 = 0;
          uint64_t v45 = 0;
          uint64_t v46 = v0 + 64;
          uint64_t v47 = v52;
        }
        *(void *)(v0 + 312) = v45;
        *(void *)(v0 + 96) = v23;
        *(void *)(v0 + 104) = v24;
        *(void *)(v0 + 112) = v53;
        *(void *)(v0 + 120) = v47;
        uint64_t v49 = swift_task_alloc();
        *(void *)(v0 + 320) = v49;
        *(void *)uint64_t v49 = v0;
        *(void *)(v49 + 8) = sub_25423F6A8;
        uint64_t v50 = *(void *)(v0 + 264);
        *(void *)(v49 + 80) = v44;
        *(void *)(v49 + 88) = v45;
        *(void *)(v49 + 64) = v16;
        *(void *)(v49 + 72) = v50;
        *(void *)(v49 + 48) = v46;
        *(void *)(v49 + 56) = v41;
        long long v51 = *(_OWORD *)(v0 + 112);
        *(_OWORD *)(v49 + 96) = *(_OWORD *)(v0 + 96);
        *(_OWORD *)(v49 + 112) = v51;
        return MEMORY[0x270FA2498](sub_25423E7E0, 0, 0);
      }

      sub_25423DAC0();
      uint64_t v5 = v8;
      if (!v8) {
        goto LABEL_6;
      }
    }
    sub_254242BA0();
    *(void *)(v0 + 272) = 0;
    uint64_t v31 = (void *)swift_task_alloc();
    *(void *)(v0 + 280) = v31;
    void *v31 = v0;
    v31[1] = sub_25423EF90;
    return MEMORY[0x270FA2000]();
  }
  else
  {
LABEL_6:
    sub_25423DE84();
    uint64_t v9 = swift_bridgeObjectRetain();
    uint64_t v10 = sub_25423CCE0(v9);
    swift_bridgeObjectRelease();
    uint64_t v11 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v11(v10);
  }
}

id sub_254240530(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = (void *)sub_254242B30();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_254242AA0();

    swift_willThrow();
  }
  return v6;
}

void sub_25424060C(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_254240614()
{
  return sub_254242D80();
}

uint64_t sub_25424065C()
{
  return sub_254242D60();
}

uint64_t sub_254240688()
{
  return sub_254242D80();
}

void *sub_2542406CC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_2542406DC(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_2542406E8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL sub_2542406F4(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_254240708(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2542407DC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25423D928((uint64_t)v12, *a3);
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
      sub_25423D928((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2542407DC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_254242C00();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_254240998(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_254242C80();
  if (!v8)
  {
    sub_254242C90();
    __break(1u);
LABEL_17:
    uint64_t result = sub_254242CD0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_254240998(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_254240A30(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_254240C10(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_254240C10(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_254240A30(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
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
      unint64_t v3 = sub_254240BA8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_254242C70();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_254242C90();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_254242B80();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_254242CD0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_254242C90();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_254240BA8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DD73D8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_254240C10(char a1, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269DD73D8);
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
  int v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_254242CD0();
  __break(1u);
  return result;
}

uint64_t sub_254240D60()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DD73A8);
  uint64_t v3 = sub_254242C50();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v35 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v34 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    uint64_t v36 = v2;
    while (1)
    {
      if (v7)
      {
        unint64_t v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        int64_t v37 = v10;
        unint64_t v14 = v13 | (v10 << 6);
      }
      else
      {
        int64_t v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v34) {
          goto LABEL_33;
        }
        unint64_t v16 = v35[v15];
        int64_t v17 = v10 + 1;
        if (!v16)
        {
          int64_t v17 = v10 + 2;
          if (v10 + 2 >= v34) {
            goto LABEL_33;
          }
          unint64_t v16 = v35[v17];
          if (!v16)
          {
            int64_t v17 = v10 + 3;
            if (v10 + 3 >= v34) {
              goto LABEL_33;
            }
            unint64_t v16 = v35[v17];
            if (!v16)
            {
              uint64_t v18 = v10 + 4;
              if (v10 + 4 >= v34)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v33 = 1 << *(unsigned char *)(v2 + 32);
                if (v33 > 63) {
                  bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v35 = -1 << v33;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v35[v18];
              if (!v16)
              {
                while (1)
                {
                  int64_t v17 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v17 >= v34) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v35[v17];
                  ++v18;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v17 = v10 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v16 - 1) & v16;
        int64_t v37 = v17;
        unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
      }
      uint64_t v19 = *(void *)(v2 + 48) + 32 * v14;
      uint64_t v20 = *(void *)v19;
      uint64_t v21 = *(void *)(v19 + 8);
      char v22 = *(unsigned char *)(v19 + 16);
      char v23 = *(unsigned char *)(v19 + 17);
      char v24 = *(unsigned char *)(v19 + 18);
      uint64_t v25 = *(void *)(v19 + 24);
      sub_254242D50();
      swift_bridgeObjectRetain();
      sub_254242B60();
      swift_bridgeObjectRelease();
      sub_254242D70();
      sub_254242D70();
      sub_254242D70();
      sub_254242D60();
      uint64_t result = sub_254242D80();
      uint64_t v26 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v8 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v27) & ~*(void *)(v8 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v8 + 8 * v28);
        }
        while (v32 == -1);
        unint64_t v11 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      uint64_t v12 = *(void *)(v4 + 48) + 32 * v11;
      *(void *)uint64_t v12 = v20;
      *(void *)(v12 + 8) = v21;
      *(unsigned char *)(v12 + 16) = v22;
      *(unsigned char *)(v12 + 17) = v23;
      *(unsigned char *)(v12 + 18) = v24;
      *(void *)(v12 + 24) = v25;
      ++*(void *)(v4 + 16);
      uint64_t v2 = v36;
      int64_t v10 = v37;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

void *sub_2542410C8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DD73A8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_254242C40();
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v13) {
      goto LABEL_28;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26)
      {
        int64_t v9 = v25 + 2;
        if (v25 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v26 = *(void *)(v6 + 8 * v9);
        if (!v26) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 32 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v19 = *(void *)v17;
    uint64_t v18 = *(void *)(v17 + 8);
    char v20 = *(unsigned char *)(v17 + 16);
    char v21 = *(unsigned char *)(v17 + 17);
    char v22 = *(unsigned char *)(v17 + 18);
    uint64_t v23 = *(void *)(v17 + 24);
    uint64_t v24 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v24 = v19;
    *(void *)(v24 + 8) = v18;
    *(unsigned char *)(v24 + 16) = v20;
    *(unsigned char *)(v24 + 17) = v21;
    *(unsigned char *)(v24 + 18) = v22;
    *(void *)(v24 + 24) = v23;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 3;
  if (v27 >= v13) {
    goto LABEL_28;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25424129C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269DD73A8);
  uint64_t v3 = sub_254242C50();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v33 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v34 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  uint64_t v35 = v2;
  while (1)
  {
    if (v7)
    {
      unint64_t v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      int64_t v36 = v10;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v34) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v33 + 8 * v15);
    int64_t v17 = v10 + 1;
    if (!v16)
    {
      int64_t v17 = v10 + 2;
      if (v10 + 2 >= v34) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v33 + 8 * v17);
      if (!v16)
      {
        int64_t v17 = v10 + 3;
        if (v10 + 3 >= v34) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v33 + 8 * v17);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v16 - 1) & v16;
    int64_t v36 = v17;
    unint64_t v14 = __clz(__rbit64(v16)) + (v17 << 6);
LABEL_24:
    uint64_t v19 = *(void *)(v2 + 48) + 32 * v14;
    uint64_t v20 = *(void *)v19;
    uint64_t v21 = *(void *)(v19 + 8);
    char v22 = *(unsigned char *)(v19 + 16);
    char v23 = *(unsigned char *)(v19 + 17);
    char v24 = *(unsigned char *)(v19 + 18);
    uint64_t v25 = *(void *)(v19 + 24);
    sub_254242D50();
    swift_bridgeObjectRetain_n();
    sub_254242B60();
    swift_bridgeObjectRelease();
    sub_254242D70();
    sub_254242D70();
    sub_254242D70();
    sub_254242D60();
    uint64_t result = sub_254242D80();
    uint64_t v26 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v8 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v27) & ~*(void *)(v8 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v8 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v11 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    uint64_t v12 = *(void *)(v4 + 48) + 32 * v11;
    *(void *)uint64_t v12 = v20;
    *(void *)(v12 + 8) = v21;
    *(unsigned char *)(v12 + 16) = v22;
    *(unsigned char *)(v12 + 17) = v23;
    *(unsigned char *)(v12 + 18) = v24;
    *(void *)(v12 + 24) = v25;
    ++*(void *)(v4 + 16);
    uint64_t v2 = v35;
    int64_t v10 = v36;
  }
  uint64_t v18 = v10 + 4;
  if (v10 + 4 >= v34)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v33 + 8 * v18);
  if (v16)
  {
    int64_t v17 = v10 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v17 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v17 >= v34) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v33 + 8 * v17);
    ++v18;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2542415D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X8>)
{
  int64_t v9 = (void **)v8;
  unint64_t v16 = (void *)*v8;
  unint64_t v18 = sub_25423D868(a5, a6);
  uint64_t v19 = v16[2];
  BOOL v20 = (v17 & 1) == 0;
  uint64_t result = v19 + v20;
  if (__OFADD__(v19, v20))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v22 = v17;
  uint64_t v23 = v16[3];
  if (v23 >= result && (a7 & 1) != 0)
  {
LABEL_7:
    char v24 = *v9;
    if (v22)
    {
LABEL_8:
      uint64_t v25 = v24[7] + 32 * v18;
      uint64_t v26 = *(void *)(v25 + 8);
      char v27 = *(unsigned char *)(v25 + 16);
      char v28 = *(unsigned char *)(v25 + 17);
      char v29 = *(unsigned char *)(v25 + 18);
      uint64_t v30 = *(void *)(v25 + 24);
      *(void *)a8 = *(void *)v25;
      *(void *)(a8 + 8) = v26;
      *(unsigned char *)(a8 + 16) = v27;
      *(unsigned char *)(a8 + 17) = v28;
      *(unsigned char *)(a8 + 18) = v29;
      *(void *)(a8 + 24) = v30;
      *(void *)uint64_t v25 = a1;
      *(void *)(v25 + 8) = a2;
      *(unsigned char *)(v25 + 16) = a3 & 1;
      *(unsigned char *)(v25 + 17) = BYTE1(a3) & 1;
      *(unsigned char *)(v25 + 18) = BYTE2(a3) & 1;
      *(void *)(v25 + 24) = a4;
      return result;
    }
    goto LABEL_11;
  }
  if (v23 >= result && (a7 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2542417FC();
    goto LABEL_7;
  }
  sub_25423C99C(result, a7 & 1);
  uint64_t result = sub_25423D868(a5, a6);
  if ((v22 & 1) != (v31 & 1))
  {
LABEL_15:
    uint64_t result = sub_254242D00();
    __break(1u);
    return result;
  }
  unint64_t v18 = result;
  char v24 = *v9;
  if (v22) {
    goto LABEL_8;
  }
LABEL_11:
  sub_254241794(v18, a5, a6, a1, a2, a3 & 0x10101, a4, v24);
  *(_OWORD *)a8 = 0u;
  *(_OWORD *)(a8 + 16) = 0u;
  return swift_bridgeObjectRetain();
}

unint64_t sub_254241794(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, void *a8)
{
  a8[(result >> 6) + 8] |= 1 << result;
  uint64_t v8 = (void *)(a8[6] + 16 * result);
  void *v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a8[7] + 32 * result;
  *(void *)uint64_t v9 = a4;
  *(void *)(v9 + 8) = a5;
  *(unsigned char *)(v9 + 16) = a6 & 1;
  *(unsigned char *)(v9 + 17) = BYTE1(a6) & 1;
  *(unsigned char *)(v9 + 18) = BYTE2(a6) & 1;
  *(void *)(v9 + 24) = a7;
  uint64_t v10 = a8[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a8[2] = v12;
  }
  return result;
}

void *sub_2542417FC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2664E0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_254242CA0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v31 = *(void *)(v6 + 8 * v9);
    if (!v31) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v31 - 1) & v31;
    unint64_t v15 = __clz(__rbit64(v31)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    uint64_t v22 = *(void *)v21;
    uint64_t v23 = *(void *)(v21 + 8);
    char v24 = *(unsigned char *)(v21 + 16);
    char v25 = *(unsigned char *)(v21 + 17);
    char v26 = *(unsigned char *)(v21 + 18);
    uint64_t v27 = *(void *)(v21 + 24);
    char v28 = (void *)(*(void *)(v4 + 48) + v16);
    *char v28 = v19;
    v28[1] = v18;
    uint64_t v29 = *(void *)(v4 + 56) + v20;
    *(void *)uint64_t v29 = v22;
    *(void *)(v29 + 8) = v23;
    *(unsigned char *)(v29 + 16) = v24;
    *(unsigned char *)(v29 + 17) = v25;
    *(unsigned char *)(v29 + 18) = v26;
    *(void *)(v29 + 24) = v27;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v32 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v31 = *(void *)(v6 + 8 * v32);
  if (v31)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v31 = *(void *)(v6 + 8 * v9);
    ++v32;
    if (v31) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_2542419C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2664F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_254241A2C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2664F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for IRMBManager()
{
  return &type metadata for IRMBManager;
}

void *initializeBufferWithCopyOfBuffer for IRMBManagerError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for IRMBManagerError(void *a1, void *a2)
{
  *a1 = *a2;
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

void *assignWithTake for IRMBManagerError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IRMBManagerError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IRMBManagerError(uint64_t result, int a2, int a3)
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

uint64_t sub_254241BD4()
{
  return 0;
}

ValueMetadata *type metadata accessor for IRMBManagerError()
{
  return &type metadata for IRMBManagerError;
}

void type metadata accessor for IRMediaBundleType()
{
  if (!qword_269DD7398)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269DD7398);
    }
  }
}

unint64_t sub_254241C4C()
{
  unint64_t result = qword_269DD73A0;
  if (!qword_269DD73A0)
  {
    type metadata accessor for IRMediaBundleType();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DD73A0);
  }
  return result;
}

uint64_t sub_254241CA4(uint64_t a1, unint64_t *a2)
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

unint64_t sub_254241CE0()
{
  unint64_t result = qword_269DD73B8;
  if (!qword_269DD73B8)
  {
    sub_254241CA4(255, &qword_269DD73B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DD73B8);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_254241D80()
{
  unint64_t result = qword_269DD73C8;
  if (!qword_269DD73C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269DD73C8);
  }
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

void sub_254241E8C()
{
  qword_26B266510 = 0x646E7542424D5249;
  *(void *)algn_26B266518 = 0xEB0000000073656CLL;
}

void sub_254241EB8()
{
  qword_26B2664F8 = 0x7473696C70;
  unk_26B266500 = 0xE500000000000000;
}

void sub_254241ED8()
{
  qword_26B266548 = 0x707954616964656DLL;
  qword_26B266550 = 0xE900000000000065;
}

id sub_254241F00()
{
  if (qword_26B266530 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26B266538;
  qword_26B266540 = qword_26B266538;
  return v0;
}

uint64_t sub_254241F64(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v12 = MEMORY[0x263F8EE78];
  sub_2542420AC(0, v2, 0);
  uint64_t v3 = v12;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_25423D928(i, (uint64_t)v11);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2542420AC(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v12;
      }
      unint64_t v6 = *(void *)(v3 + 16);
      unint64_t v5 = *(void *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_2542420AC(v5 > 1, v6 + 1, 1);
        uint64_t v3 = v12;
      }
      *(void *)(v3 + 16) = v6 + 1;
      uint64_t v7 = v3 + 16 * v6;
      *(void *)(v7 + 32) = v9;
      *(void *)(v7 + 40) = v10;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_2542420AC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2542420CC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2542420CC(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269DD73E0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_254242CD0();
  __break(1u);
  return result;
}

uint64_t sub_254242238(uint64_t a1, uint64_t a2)
{
  objc_allocWithZone(MEMORY[0x263F01878]);
  swift_bridgeObjectRetain();
  id v4 = sub_254240530(a1, a2, 0);
  unint64_t v6 = v4;
  if (!v4) {
    return 0;
  }
  id v7 = objc_msgSend(v4, sel_infoDictionary);
  uint64_t v8 = (void *)sub_254242B30();
  sub_2542424AC();
  id v9 = objc_msgSend(v7, sel_objectForKey_ofClass_, v8, swift_getObjCClassFromMetadata());

  if (v9)
  {
    sub_254242C10();
    swift_unknownObjectRelease();
  }
  else
  {

    memset(v11, 0, sizeof(v11));
  }
  sub_2542419C4((uint64_t)v11, (uint64_t)v12);
  if (!v13)
  {
    sub_254241A2C((uint64_t)v12);
    return 0;
  }
  if (swift_dynamicCast()) {
    return v10;
  }
  else {
    return 0;
  }
}

uint64_t sub_2542423B0(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a1 == 0x6D726F46676E6F4CLL && a2 == 0xED00006F69647541 || (sub_254242CE0() & 1) != 0) {
    return 1;
  }
  if (a1 == 0x6D726F46676E6F4CLL && a2 == 0xED00006F65646956 || (sub_254242CE0() & 1) != 0) {
    return 2;
  }
  else {
    return 0;
  }
}

unint64_t sub_2542424AC()
{
  unint64_t result = qword_26B2664D8;
  if (!qword_26B2664D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B2664D8);
  }
  return result;
}

void sub_2542424EC()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_254242B30();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_26B266538 = (uint64_t)v2;
}

double sub_254242570@<D0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  id v8 = objc_msgSend(a1, sel_identifier);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = sub_254242B40();
    uint64_t v12 = v11;

    uint64_t v13 = (uint64_t)objc_msgSend(a1, sel_bundleType);
    if (a3)
    {
      if (a2 == 0x6D726F46676E6F4CLL && a3 == 0xED00006F69647541 || (sub_254242CE0() & 1) != 0)
      {
        uint64_t v13 = 1;
      }
      else if (a2 == 0x6D726F46676E6F4CLL && a3 == 0xED00006F65646956 || (sub_254242CE0() & 1) != 0)
      {
        uint64_t v13 = 2;
      }
    }
    *a4 = v10;
    a4[1] = v12;
    a4[2] = 65793;
    a4[3] = v13;
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)a4 = 0u;
    *((_OWORD *)a4 + 1) = 0u;
  }
  return result;
}

uint64_t IRMBBundle.hash(into:)()
{
  return sub_254242D60();
}

uint64_t IRMBBundle.hashValue.getter()
{
  return sub_254242D80();
}

uint64_t sub_254242828()
{
  return sub_254242D80();
}

BOOL _s30IntelligentRoutingMediaBundles10IRMBBundleV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  int v3 = *(unsigned __int8 *)(a1 + 17);
  uint64_t v4 = *(void *)(a1 + 24);
  int v5 = *(unsigned __int8 *)(a2 + 16);
  int v6 = *(unsigned __int8 *)(a2 + 17);
  uint64_t v7 = *(void *)(a2 + 24);
  int v8 = *(unsigned __int8 *)(a1 + 18) ^ *(unsigned __int8 *)(a2 + 18);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8))
  {
    if ((v2 ^ v5 | v3 ^ v6 | v8)) {
      return 0;
    }
  }
  else
  {
    char v10 = sub_254242CE0();
    BOOL result = 0;
    if ((v2 ^ v5) & 1 | ((v10 & 1) == 0) | (v3 ^ v6 | v8) & 1) {
      return result;
    }
  }
  return v4 == v7;
}

unint64_t sub_2542429A8()
{
  unint64_t result = qword_26B266528;
  if (!qword_26B266528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B266528);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for IRMBBundle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t assignWithCopy for IRMBBundle(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t sub_254242AA0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_254242AB0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_254242AC0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_254242AD0()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_254242AE0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_254242AF0()
{
  return MEMORY[0x270F44260]();
}

uint64_t sub_254242B00()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_254242B10()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_254242B20()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_254242B30()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_254242B40()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_254242B50()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_254242B60()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_254242B70()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_254242B80()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_254242B90()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_254242BA0()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_254242BC0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_254242BD0()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_254242BE0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_254242BF0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_254242C00()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_254242C10()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_254242C20()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_254242C30()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_254242C40()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_254242C50()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_254242C60()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_254242C70()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_254242C80()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_254242C90()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_254242CA0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_254242CB0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_254242CC0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_254242CD0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_254242CE0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_254242CF0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_254242D00()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_254242D10()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_254242D20()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_254242D30()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_254242D40()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_254242D50()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_254242D60()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_254242D70()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_254242D80()
{
  return MEMORY[0x270F9FC90]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
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