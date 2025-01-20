uint64_t sub_247940748(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  BOOL v17;
  uint64_t v19;

  v4 = _s18ImageGeneratorCallV5ImageVMa(0) - 8;
  v5 = MEMORY[0x270FA5388](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v10 = (char *)&v19 - v9;
  v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v15 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(void *)(v8 + 72);
      v14 = v11 - 1;
      do
      {
        sub_247946014(a1 + v12, (uint64_t)v10, _s18ImageGeneratorCallV5ImageVMa);
        sub_247946014(a2 + v12, (uint64_t)v7, _s18ImageGeneratorCallV5ImageVMa);
        v15 = MEMORY[0x24C561D20](v10, v7);
        sub_2479460E4((uint64_t)v7, _s18ImageGeneratorCallV5ImageVMa);
        sub_2479460E4((uint64_t)v10, _s18ImageGeneratorCallV5ImageVMa);
        v17 = v14-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_2479408E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s14MessageContentOMa(0) - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v10 = (char *)&v19 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v15 = 1;
    }
    else
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = *(void *)(v8 + 72);
      uint64_t v14 = v11 - 1;
      do
      {
        sub_247946014(a1 + v12, (uint64_t)v10, _s14MessageContentOMa);
        sub_247946014(a2 + v12, (uint64_t)v7, _s14MessageContentOMa);
        char v15 = sub_2478E1864((uint64_t)v10, (uint64_t)v7);
        sub_2479460E4((uint64_t)v7, _s14MessageContentOMa);
        sub_2479460E4((uint64_t)v10, _s14MessageContentOMa);
        BOOL v17 = v14-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_247940A88(uint64_t a1, uint64_t a2)
{
  uint64_t v46 = _s14TextAnnotationV11URLCitationVMa(0);
  MEMORY[0x270FA5388](v46);
  uint64_t v5 = (char *)v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = _s14TextAnnotationV4TypeOMa(0);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  v42 = (void *)((char *)v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v7);
  uint64_t v43 = (uint64_t)v40 - v9;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_269267248);
  MEMORY[0x270FA5388](v47);
  uint64_t v11 = (char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _s14TextAnnotationVMa(0) - 8;
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  char v15 = (char *)v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v18 = (char *)v40 - v17;
  uint64_t v48 = a1;
  uint64_t v19 = *(void *)(a1 + 16);
  if (v19 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v19) {
    return 1;
  }
  uint64_t v20 = a2;
  if (v48 == a2) {
    return 1;
  }
  unint64_t v21 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v40[0] = *(void *)(v16 + 72);
  v40[1] = v6;
  v41 = v5;
  v44 = (char *)v40 - v17;
  v45 = v15;
  while (1)
  {
    sub_247946014(v48 + v21, (uint64_t)v18, _s14TextAnnotationVMa);
    sub_247946014(v20 + v21, (uint64_t)v15, _s14TextAnnotationVMa);
    v22 = &v11[*(int *)(v47 + 48)];
    sub_247946014((uint64_t)v18, (uint64_t)v11, _s14TextAnnotationV4TypeOMa);
    sub_247946014((uint64_t)v15, (uint64_t)v22, _s14TextAnnotationV4TypeOMa);
    if (swift_getEnumCaseMultiPayload() != 1) {
      break;
    }
    v23 = v42;
    sub_247946014((uint64_t)v11, (uint64_t)v42, _s14TextAnnotationV4TypeOMa);
    uint64_t v25 = *v23;
    uint64_t v24 = v23[1];
    uint64_t v26 = v23[2];
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
    uint64_t v27 = *(void *)v22;
    uint64_t v28 = *((void *)v22 + 1);
    uint64_t v29 = *((void *)v22 + 2);
    if (v25 == v27 && v24 == v28)
    {
      swift_bridgeObjectRelease_n();
      v18 = v44;
      char v15 = v45;
      if (v26 != v29) {
        goto LABEL_27;
      }
    }
    else
    {
      char v31 = sub_247999B80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v18 = v44;
      char v15 = v45;
      if ((v31 & 1) == 0 || v26 != v29) {
        goto LABEL_27;
      }
    }
LABEL_6:
    sub_2479460E4((uint64_t)v11, _s14TextAnnotationV4TypeOMa);
    sub_2479460E4((uint64_t)v15, _s14TextAnnotationVMa);
    sub_2479460E4((uint64_t)v18, _s14TextAnnotationVMa);
    v21 += v40[0];
    --v19;
    uint64_t v5 = v41;
    if (!v19) {
      return 1;
    }
  }
  uint64_t v32 = v43;
  sub_247946014((uint64_t)v11, v43, _s14TextAnnotationV4TypeOMa);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_24794607C((uint64_t)v22, (uint64_t)v5, _s14TextAnnotationV11URLCitationVMa);
    char v33 = MEMORY[0x24C561D20](v32, v5);
    v18 = v44;
    char v15 = v45;
    if ((v33 & 1) == 0
      || ((uint64_t v34 = *(int *)(v46 + 20),
           uint64_t v35 = *(void *)(v32 + v34),
           uint64_t v36 = *(void *)(v32 + v34 + 8),
           v37 = &v5[v34],
           v35 == *(void *)v37)
        ? (BOOL v38 = v36 == *((void *)v37 + 1))
        : (BOOL v38 = 0),
          !v38 && (sub_247999B80() & 1) == 0
       || *(void *)(v32 + *(int *)(v46 + 24)) != *(void *)&v5[*(int *)(v46 + 24)]))
    {
      sub_2479460E4((uint64_t)v5, _s14TextAnnotationV11URLCitationVMa);
      sub_2479460E4(v32, _s14TextAnnotationV11URLCitationVMa);
LABEL_27:
      sub_2479460E4((uint64_t)v11, _s14TextAnnotationV4TypeOMa);
      goto LABEL_31;
    }
    sub_2479460E4((uint64_t)v5, _s14TextAnnotationV11URLCitationVMa);
    sub_2479460E4(v32, _s14TextAnnotationV11URLCitationVMa);
    goto LABEL_6;
  }
  sub_2479460E4(v32, _s14TextAnnotationV11URLCitationVMa);
LABEL_30:
  v18 = v44;
  char v15 = v45;
  sub_2478A1A1C((uint64_t)v11, &qword_269267248);
LABEL_31:
  sub_2479460E4((uint64_t)v15, _s14TextAnnotationVMa);
  sub_2479460E4((uint64_t)v18, _s14TextAnnotationVMa);
  return 0;
}

uint64_t sub_247940FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = a1 + 40;
    uint64_t v4 = (unsigned __int8 *)(a2 + 72);
    do
    {
      unint64_t v5 = *(void *)v3;
      unint64_t v6 = *((void *)v4 - 4);
      if (*(void *)v3)
      {
        if (v5 == 1)
        {
          if (v6 != 1) {
            return 0;
          }
        }
        else if (v5 == 2)
        {
          if (v6 != 2) {
            return 0;
          }
        }
        else
        {
          if (v6 < 3) {
            return 0;
          }
          uint64_t v7 = *(void *)(v3 + 16);
          uint64_t v13 = *(void *)(v3 + 24);
          char v14 = *(unsigned char *)(v3 + 32);
          uint64_t v8 = *((void *)v4 - 3);
          uint64_t v9 = *((void *)v4 - 2);
          uint64_t v10 = *((void *)v4 - 1);
          int v15 = *v4;
          uint64_t v17 = *((void *)v4 - 5);
          uint64_t v18 = *(void *)(v3 + 8);
          uint64_t v16 = *(void *)(v3 - 8);
          if ((v16 != v17 || v5 != v6) && (sub_247999B80() & 1) == 0) {
            return 0;
          }
          if ((v18 != v8 || v7 != v9) && (sub_247999B80() & 1) == 0) {
            return 0;
          }
          sub_247945F6C(v17, v6);
          sub_247945F6C(v16, v5);
          swift_retain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_retain();
          char v11 = sub_247945330(v13, v10);
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_247945FC0(v17, v6);
          sub_247945FC0(v16, v5);
          uint64_t result = 0;
          if ((v11 & 1) == 0 || ((((v14 & 1) == 0) ^ v15) & 1) == 0) {
            return result;
          }
        }
      }
      else if (v6)
      {
        return 0;
      }
      v3 += 48;
      v4 += 48;
      --v2;
    }
    while (v2);
  }
  return 1;
}

uint64_t sub_247941258(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (uint64_t *)(a2 + 56);
    for (i = (uint64_t *)(a1 + 56); ; i += 4)
    {
      uint64_t v5 = *(i - 1);
      uint64_t v6 = *i;
      uint64_t v7 = *(v3 - 1);
      uint64_t v8 = *v3;
      BOOL v9 = *(i - 3) == *(v3 - 3) && *(i - 2) == *(v3 - 2);
      if (!v9 && (sub_247999B80() & 1) == 0) {
        break;
      }
      BOOL v10 = v5 == v7 && v6 == v8;
      if (!v10 && (sub_247999B80() & 1) == 0) {
        break;
      }
      v3 += 4;
      if (!--v2) {
        return 1;
      }
    }
    return 0;
  }
  return 1;
}

uint64_t sub_247941320(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (char v6 = sub_247999B80(), result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    BOOL v9 = a2 + 7;
    for (i = a1 + 7; ; i += 2)
    {
      BOOL v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_247999B80() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_2479413E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (unint64_t *)(a1 + 32);
    uint64_t v4 = (unint64_t *)(a2 + 32);
    do
    {
      unint64_t v6 = *v3++;
      unint64_t v5 = v6;
      unint64_t v8 = *v4++;
      unint64_t v7 = v8;
      switch(v5)
      {
        case 0uLL:
          if (v7) {
            return 0;
          }
          break;
        case 1uLL:
          if (v7 != 1) {
            return 0;
          }
          break;
        case 2uLL:
          if (v7 != 2) {
            return 0;
          }
          break;
        case 3uLL:
          if (v7 != 3) {
            return 0;
          }
          break;
        case 4uLL:
          if (v7 != 4) {
            return 0;
          }
          break;
        case 5uLL:
          if (v7 != 5) {
            return 0;
          }
          break;
        case 6uLL:
          if (v7 != 6) {
            return 0;
          }
          break;
        default:
          if (v7 < 7) {
            return 0;
          }
          sub_247945508(v7);
          sub_247945508(v5);
          char v9 = sub_2479413E8(v5, v7);
          sub_247945258(v7);
          sub_247945258(v5);
          if ((v9 & 1) == 0) {
            return 0;
          }
          break;
      }
      --v2;
    }
    while (v2);
  }
  return 1;
}

uint64_t sub_247941528(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t v3 = (uint64_t *)(a2 + 48);
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (2)
  {
    uint64_t v7 = *(v4 - 1);
    uint64_t v6 = *v4;
    uint64_t v8 = *((unsigned __int8 *)v3 - 16);
    uint64_t v10 = *(v3 - 1);
    uint64_t v9 = *v3;
    v3 += 3;
    uint64_t v11 = *((unsigned __int8 *)v4 - 16);
    v4 += 3;
    unint64_t v12 = 0x80000002479A4B00;
    unint64_t v13 = 0xD000000000000010;
    switch(v11)
    {
      case 1:
        unint64_t v13 = 0x65675F6567616D69;
        unint64_t v12 = 0xEF726F746172656ELL;
        break;
      case 2:
        unint64_t v12 = 0x80000002479A4B30;
        break;
      case 3:
        unint64_t v13 = 0x6C70755F656C6966;
        unint64_t v12 = 0xEB0000000064616FLL;
        break;
      default:
        break;
    }
    unint64_t v14 = 0x80000002479A4B00;
    switch(v8)
    {
      case 1:
        unint64_t v14 = 0xEF726F746172656ELL;
        if (v13 == 0x65675F6567616D69) {
          goto LABEL_16;
        }
        goto LABEL_19;
      case 2:
        unint64_t v14 = 0x80000002479A4B30;
        goto LABEL_15;
      case 3:
        unint64_t v14 = 0xEB0000000064616FLL;
        if (v13 != 0x6C70755F656C6966) {
          goto LABEL_19;
        }
        goto LABEL_16;
      default:
LABEL_15:
        if (v13 != 0xD000000000000010) {
          goto LABEL_19;
        }
LABEL_16:
        if (v12 == v14)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease_n();
          goto LABEL_20;
        }
LABEL_19:
        char v15 = sub_247999B80();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v15)
        {
LABEL_20:
          if (v7 == v10 && v6 == v9)
          {
            swift_bridgeObjectRelease_n();
          }
          else
          {
            char v5 = sub_247999B80();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v5 & 1) == 0) {
              return 0;
            }
          }
          if (!--v2) {
            return 1;
          }
          continue;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 0;
    }
  }
}

uint64_t sub_2479417D0(uint64_t a1)
{
  sub_247999C90();
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      sub_247999CA0();
      break;
    default:
      sub_247999CA0();
      sub_247945158((uint64_t)v3, a1);
      break;
  }
  return sub_247999CD0();
}

uint64_t sub_2479418C4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_2479457BC(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_2479418F0(void *a1)
{
  return sub_24793EF20(a1, *v1);
}

uint64_t sub_24794190C()
{
  return sub_2479417D0(*v0);
}

unint64_t sub_247941914(uint64_t a1)
{
  uint64_t v3 = *v1;
  switch(*v1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      unint64_t result = sub_247999CA0();
      break;
    default:
      sub_247999CA0();
      unint64_t result = sub_247945158(a1, v3);
      break;
  }
  return result;
}

uint64_t sub_2479419F8()
{
  uint64_t v1 = *v0;
  sub_247999C90();
  switch(v1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      sub_247999CA0();
      break;
    default:
      sub_247999CA0();
      sub_247945158((uint64_t)v3, v1);
      break;
  }
  return sub_247999CD0();
}

uint64_t sub_247941AE8(uint64_t *a1, unint64_t *a2)
{
  return sub_247945268(*a1, *a2);
}

uint64_t sub_247941AF4()
{
  swift_bridgeObjectRelease();
  sub_247945258(*(void *)(v0 + 32));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 72);
  *(void *)(v0 + 72) = 0;
  if (v1)
  {
    do
    {
      if (!swift_isUniquelyReferenced_native()) {
        break;
      }
      uint64_t v2 = *(void *)(v1 + 72);
      swift_retain();
      swift_release();
      uint64_t v1 = v2;
    }
    while (v2);
  }
  swift_release();
  return v0;
}

uint64_t sub_247941B88()
{
  sub_247941AF4();

  return MEMORY[0x270FA0228](v0, 81, 7);
}

uint64_t type metadata accessor for JSONSchema()
{
  return self;
}

uint64_t *initializeBufferWithCopyOfBuffer for JSONSchema.Type(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    uint64_t v3 = swift_bridgeObjectRetain();
  }
  *a1 = v3;
  return a1;
}

unint64_t destroy for JSONSchema.Type(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t *assignWithCopy for JSONSchema.Type(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF) {
      swift_bridgeObjectRetain();
    }
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for JSONSchema.Type(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JSONSchema.Type(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFF9 && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483641);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 6;
  if (v4 >= 8) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for JSONSchema.Type(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF9)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483641;
    if (a3 >= 0x7FFFFFF9) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFF9) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 6;
    }
  }
  return result;
}

uint64_t sub_247941DD8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_247941DF0(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for JSONSchema.Type()
{
  return &type metadata for JSONSchema.Type;
}

unint64_t sub_247941E24()
{
  unint64_t result = qword_269268AE8;
  if (!qword_269268AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269268AE8);
  }
  return result;
}

uint64_t sub_247941E78(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268B20);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247942840();
  sub_247999D40();
  LOBYTE(v13) = 0;
  swift_bridgeObjectRetain();
  sub_247999A60();
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v13 = v3[4];
    char v12 = 1;
    sub_247942994();
    sub_247999AE0();
    uint64_t v13 = v3[5];
    char v12 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269268B10);
    sub_2479429E8();
    sub_247999A90();
    uint64_t v13 = v3[6];
    char v12 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692682D8);
    sub_247942A94(&qword_2692688D0);
    sub_247999A90();
    uint64_t v13 = v3[7];
    char v12 = 4;
    sub_247999A90();
    uint64_t v13 = v3[8];
    char v12 = 5;
    sub_247999A90();
    uint64_t v13 = v3[9];
    char v12 = 6;
    sub_247945CC4(&qword_269267E60, v10, (void (*)(uint64_t))type metadata accessor for JSONSchema);
    sub_247999A90();
    LOBYTE(v13) = 7;
    sub_247999A70();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_247942220(void *a1)
{
  uint64_t v3 = v1;
  v14[1] = *(void *)v3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268AF8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_OWORD *)(v3 + 40) = 0u;
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  *(_OWORD *)(v3 + 56) = 0u;
  *(void *)(v3 + 72) = 0;
  *(unsigned char *)(v3 + 80) = 2;
  uint64_t v9 = a1[3];
  char v15 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_247942840();
  sub_247999D10();
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_deallocPartialClassInstance();
  }
  else
  {
    LOBYTE(v17) = 0;
    *(void *)(v3 + 16) = sub_2479999B0();
    *(void *)(v3 + 24) = v10;
    swift_bridgeObjectRelease();
    char v16 = 1;
    sub_247942894();
    sub_247999A30();
    *(void *)(v3 + 32) = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269268B10);
    char v16 = 2;
    sub_2479428E8();
    sub_2479999E0();
    *(void *)(v3 + 40) = v17;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692682D8);
    char v16 = 3;
    sub_247942A94(&qword_2692688D8);
    sub_2479999E0();
    *(void *)(v3 + 48) = v17;
    swift_bridgeObjectRelease();
    char v16 = 4;
    sub_2479999E0();
    *(void *)(v3 + 56) = v17;
    swift_bridgeObjectRelease();
    char v16 = 5;
    sub_2479999E0();
    *(void *)(v3 + 64) = v17;
    swift_bridgeObjectRelease();
    char v16 = 6;
    sub_247945CC4(&qword_269267E78, v12, (void (*)(uint64_t))type metadata accessor for JSONSchema);
    sub_2479999E0();
    *(void *)(v3 + 72) = v17;
    swift_release();
    LOBYTE(v17) = 7;
    char v13 = sub_2479999C0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(unsigned char *)(v3 + 80) = v13;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v3;
}

uint64_t sub_2479426C8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = swift_allocObject();
  uint64_t result = sub_247942220(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_247942720(void *a1)
{
  return sub_247941E78(a1);
}

uint64_t sub_247942744()
{
  sub_247999C90();
  sub_24793E658((uint64_t)v1);
  return sub_247999CD0();
}

uint64_t sub_247942788(uint64_t a1)
{
  return sub_24793E658(a1);
}

uint64_t sub_2479427AC()
{
  sub_247999C90();
  sub_24793E658((uint64_t)v1);
  return sub_247999CD0();
}

uint64_t sub_2479427EC(uint64_t *a1, uint64_t *a2)
{
  return sub_247945330(*a1, *a2);
}

uint64_t sub_2479427F8(uint64_t a1, uint64_t a2)
{
  return sub_247945CC4(&qword_269268AF0, a2, (void (*)(uint64_t))type metadata accessor for JSONSchema);
}

unint64_t sub_247942840()
{
  unint64_t result = qword_269268B00;
  if (!qword_269268B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269268B00);
  }
  return result;
}

unint64_t sub_247942894()
{
  unint64_t result = qword_269268B08;
  if (!qword_269268B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269268B08);
  }
  return result;
}

unint64_t sub_2479428E8()
{
  unint64_t result = qword_269268B18;
  if (!qword_269268B18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269268B10);
    sub_247945CC4(&qword_269267E78, v1, (void (*)(uint64_t))type metadata accessor for JSONSchema);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269268B18);
  }
  return result;
}

unint64_t sub_247942994()
{
  unint64_t result = qword_269268B28;
  if (!qword_269268B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269268B28);
  }
  return result;
}

unint64_t sub_2479429E8()
{
  unint64_t result = qword_269268B30;
  if (!qword_269268B30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269268B10);
    sub_247945CC4(&qword_269267E60, v1, (void (*)(uint64_t))type metadata accessor for JSONSchema);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269268B30);
  }
  return result;
}

uint64_t sub_247942A94(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2692682D8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247942AF8(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v28 = result + 64;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 64);
  int64_t v29 = (unint64_t)(v4 + 63) >> 6;
  while (v6)
  {
    unint64_t v7 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    int64_t v30 = v3;
    unint64_t v8 = v7 | (v3 << 6);
LABEL_23:
    uint64_t v13 = result;
    unint64_t v14 = (uint64_t *)(*(void *)(result + 48) + 16 * v8);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = *(void *)(result + 56) + 24 * v8;
    uint64_t v19 = *(void *)v17;
    uint64_t v18 = *(void *)(v17 + 8);
    char v20 = *(unsigned char *)(v17 + 16);
    swift_bridgeObjectRetain();
    sub_2478EFD5C(v19, v18, v20);
    unint64_t v21 = sub_247917D8C(v15, v16);
    char v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0) {
      goto LABEL_37;
    }
    uint64_t v24 = *(void *)(a2 + 56) + 24 * v21;
    uint64_t v25 = *(void *)v24;
    if (*(unsigned char *)(v24 + 16) == 1)
    {
      if ((v20 & 1) == 0) {
        return 0;
      }
      BOOL v26 = v25 == v19 && *(void *)(v24 + 8) == v18;
      if (v26)
      {
        sub_2478EFD7C(v19, v18, 1);
        uint64_t result = v13;
        int64_t v3 = v30;
      }
      else
      {
        char v27 = sub_247999B80();
        sub_2478EFD7C(v19, v18, 1);
        uint64_t result = v13;
        int64_t v3 = v30;
        if ((v27 & 1) == 0) {
          return 0;
        }
      }
    }
    else
    {
      if (v20)
      {
        char v20 = 1;
LABEL_37:
        sub_2478EFD7C(v19, v18, v20);
        return 0;
      }
      BOOL v26 = v25 == v19;
      uint64_t result = v13;
      int64_t v3 = v30;
      if (!v26) {
        return 0;
      }
    }
  }
  int64_t v9 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
    goto LABEL_40;
  }
  if (v9 >= v29) {
    return 1;
  }
  unint64_t v10 = *(void *)(v28 + 8 * v9);
  int64_t v11 = v3 + 1;
  if (v10) {
    goto LABEL_22;
  }
  int64_t v11 = v3 + 2;
  if (v3 + 2 >= v29) {
    return 1;
  }
  unint64_t v10 = *(void *)(v28 + 8 * v11);
  if (v10) {
    goto LABEL_22;
  }
  int64_t v11 = v3 + 3;
  if (v3 + 3 >= v29) {
    return 1;
  }
  unint64_t v10 = *(void *)(v28 + 8 * v11);
  if (v10)
  {
LABEL_22:
    unint64_t v6 = (v10 - 1) & v10;
    int64_t v30 = v11;
    unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
    goto LABEL_23;
  }
  uint64_t v12 = v3 + 4;
  if (v3 + 4 >= v29) {
    return 1;
  }
  unint64_t v10 = *(void *)(v28 + 8 * v12);
  if (v10)
  {
    int64_t v11 = v3 + 4;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v11 >= v29) {
      return 1;
    }
    unint64_t v10 = *(void *)(v28 + 8 * v11);
    ++v12;
    if (v10) {
      goto LABEL_22;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_247942D8C(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v2 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v4 = result + 64;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_24;
    }
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v11 >= v8) {
      return 1;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        return 1;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          return 1;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12)
        {
          int64_t v3 = v11 + 3;
          if (v11 + 3 >= v8) {
            return 1;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v3);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_24:
    unint64_t v14 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v10);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_247917D8C(v15, v16);
    char v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
    {
      swift_release();
      return 0;
    }
    type metadata accessor for JSONSchema();
    uint64_t v20 = swift_retain();
    char v21 = sub_247945330(v20, v17);
    swift_release();
    uint64_t result = swift_release();
    if ((v21 & 1) == 0) {
      return 0;
    }
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8) {
    return 1;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      return 1;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_23;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

void sub_247942F70(void *a1, char a2, void *a3)
{
  if (!a1[2])
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v42 = a1[2];
  uint64_t v7 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v8 = a1[6];
  swift_bridgeObjectRetain();
  unint64_t v9 = (void *)*a3;
  swift_bridgeObjectRetain();
  swift_retain();
  unint64_t v11 = sub_247917D8C(v7, v6);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13)) {
    goto LABEL_23;
  }
  char v15 = v10;
  if (v9[3] >= v14)
  {
    if (a2)
    {
      if (v10) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_24791A1E8();
      if (v15) {
        goto LABEL_10;
      }
    }
LABEL_13:
    uint64_t v20 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    char v21 = (uint64_t *)(v20[6] + 16 * v11);
    *char v21 = v7;
    v21[1] = v6;
    *(void *)(v20[7] + 8 * v11) = v8;
    uint64_t v22 = v20[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v24;
    uint64_t v25 = v42 - 1;
    if (v42 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    BOOL v26 = a1 + 9;
    while (1)
    {
      uint64_t v28 = *(v26 - 2);
      uint64_t v27 = *(v26 - 1);
      uint64_t v29 = *v26;
      int64_t v30 = (void *)*a3;
      swift_bridgeObjectRetain();
      swift_retain();
      unint64_t v31 = sub_247917D8C(v28, v27);
      uint64_t v33 = v30[2];
      BOOL v34 = (v32 & 1) == 0;
      BOOL v23 = __OFADD__(v33, v34);
      uint64_t v35 = v33 + v34;
      if (v23) {
        break;
      }
      char v36 = v32;
      if (v30[3] < v35)
      {
        sub_24791B4A4(v35, 1);
        unint64_t v31 = sub_247917D8C(v28, v27);
        if ((v36 & 1) != (v37 & 1)) {
          goto LABEL_25;
        }
      }
      if (v36) {
        goto LABEL_10;
      }
      BOOL v38 = (void *)*a3;
      *(void *)(*a3 + 8 * (v31 >> 6) + 64) |= 1 << v31;
      v39 = (uint64_t *)(v38[6] + 16 * v31);
      uint64_t *v39 = v28;
      v39[1] = v27;
      *(void *)(v38[7] + 8 * v31) = v29;
      uint64_t v40 = v38[2];
      BOOL v23 = __OFADD__(v40, 1);
      uint64_t v41 = v40 + 1;
      if (v23) {
        goto LABEL_24;
      }
      v38[2] = v41;
      v26 += 3;
      if (!--v25) {
        goto LABEL_22;
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_24791B4A4(v14, a2 & 1);
  unint64_t v16 = sub_247917D8C(v7, v6);
  if ((v15 & 1) == (v17 & 1))
  {
    unint64_t v11 = v16;
    if ((v15 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    char v18 = (void *)swift_allocError();
    swift_willThrow();
    id v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269266BD8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_247999C20();
  __break(1u);
LABEL_26:
  sub_247999800();
  sub_2479993D0();
  sub_2479998E0();
  sub_2479993D0();
  sub_247999910();
  __break(1u);
}

uint64_t sub_247943304(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a2 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a2 + 64);
  int64_t v18 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v7 = 0;
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_20;
    }
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_24;
    }
    if (v11 >= v18) {
      goto LABEL_22;
    }
    unint64_t v12 = *(void *)(v19 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v18) {
        goto LABEL_22;
      }
      unint64_t v12 = *(void *)(v19 + 8 * v8);
      if (!v12) {
        break;
      }
    }
LABEL_19:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_20:
    uint64_t v14 = *(void *)(a2 + 56) + 24 * v10;
    uint64_t v15 = *(void *)v14;
    uint64_t v16 = *(void *)(v14 + 8);
    int v17 = *(unsigned __int8 *)(v14 + 16);
    swift_bridgeObjectRetain();
    sub_2478EFD5C(v15, v16, v17);
    sub_2479993B0();
    swift_bridgeObjectRelease();
    sub_247999CA0();
    if (v17 == 1)
    {
      sub_2479993B0();
      sub_2478EFD7C(v15, v16, 1);
    }
    else
    {
      sub_247999CA0();
    }
    uint64_t result = sub_247999CD0();
    v7 ^= result;
  }
  int64_t v13 = v11 + 2;
  if (v13 >= v18)
  {
LABEL_22:
    swift_release();
    return sub_247999CA0();
  }
  unint64_t v12 = *(void *)(v19 + 8 * v13);
  if (v12)
  {
    int64_t v8 = v13;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v8 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v8 >= v18) {
      goto LABEL_22;
    }
    unint64_t v12 = *(void *)(v19 + 8 * v8);
    ++v13;
    if (v12) {
      goto LABEL_19;
    }
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_247943510(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  uint64_t v6 = v5 & *(void *)(a2 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v9 = 0;
  int64_t v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_5;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v14 >= v7) {
      goto LABEL_19;
    }
    uint64_t v15 = *(void *)(v3 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v7) {
        goto LABEL_19;
      }
      uint64_t v15 = *(void *)(v3 + 8 * v10);
      if (!v15) {
        break;
      }
    }
LABEL_18:
    uint64_t v6 = (v15 - 1) & v15;
LABEL_5:
    uint64_t v11 = *(void *)(a1 + 64);
    long long v12 = *(_OWORD *)(a1 + 16);
    v17[0] = *(_OWORD *)a1;
    v17[1] = v12;
    long long v13 = *(_OWORD *)(a1 + 48);
    v17[2] = *(_OWORD *)(a1 + 32);
    v17[3] = v13;
    uint64_t v18 = v11;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_2479993B0();
    swift_bridgeObjectRelease();
    sub_24793E658(v17);
    swift_release();
    uint64_t result = sub_247999CD0();
    v9 ^= result;
  }
  int64_t v16 = v14 + 2;
  if (v16 >= v7)
  {
LABEL_19:
    swift_release();
    return sub_247999CA0();
  }
  uint64_t v15 = *(void *)(v3 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v7) {
      goto LABEL_19;
    }
    uint64_t v15 = *(void *)(v3 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_18;
    }
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_2479436C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s18ImageGeneratorCallV5ImageVMa(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  int64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269267230);
  MEMORY[0x270FA5388](v8 - 8);
  int64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(a2 + 16);
  uint64_t v21 = a1;
  sub_247999CA0();
  if (v11)
  {
    uint64_t v12 = a2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v13 = v5;
    unint64_t v14 = v5 + 56;
    uint64_t v15 = (uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
    uint64_t v16 = *(void *)(v13 + 72);
    v19[1] = v14 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v20 = v16;
    while (1)
    {
      sub_247946014(v12, (uint64_t)v10, _s18ImageGeneratorCallV5ImageVMa);
      int v17 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))v14;
      (*(void (**)(char *, void, uint64_t, uint64_t))v14)(v10, 0, 1, v4);
      uint64_t result = (*v15)(v10, 1, v4);
      if (result == 1) {
        break;
      }
      sub_24794607C((uint64_t)v10, (uint64_t)v7, _s18ImageGeneratorCallV5ImageVMa);
      sub_247998240();
      sub_247945CC4(&qword_269267228, 255, MEMORY[0x263F06EA8]);
      sub_2479992F0();
      sub_2479460E4((uint64_t)v7, _s18ImageGeneratorCallV5ImageVMa);
      v12 += v20;
      if (!--v11) {
        return v17(v10, 1, 1, v4);
      }
    }
  }
  else
  {
    int v17 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    return v17(v10, 1, 1, v4);
  }
  return result;
}

uint64_t sub_24794393C(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = _s19ImageGeneratorImageVMa(0);
  MEMORY[0x270FA5388](v23);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = _s12ImageURLItemVMa(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v22 = (uint64_t)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = _s14MessageContentOMa(0);
  uint64_t v7 = *(void *)(v24 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v24);
  int64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v21 - v11;
  uint64_t v13 = *(void *)(a2 + 16);
  uint64_t result = sub_247999CA0();
  if (v13)
  {
    uint64_t v15 = a2 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v16 = *(void *)(v7 + 72);
    do
    {
      sub_247946014(v15, (uint64_t)v12, _s14MessageContentOMa);
      sub_247946014((uint64_t)v12, (uint64_t)v10, _s14MessageContentOMa);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload)
      {
        if (EnumCaseMultiPayload == 1)
        {
          uint64_t v20 = v22;
          sub_24794607C((uint64_t)v10, v22, _s12ImageURLItemVMa);
          sub_247999CA0();
          sub_247998240();
          sub_247945CC4(&qword_269267228, 255, MEMORY[0x263F06EA8]);
          sub_2479992F0();
          int v17 = _s12ImageURLItemVMa;
          uint64_t v18 = v20;
        }
        else
        {
          sub_24794607C((uint64_t)v10, (uint64_t)v4, _s19ImageGeneratorImageVMa);
          sub_247999CA0();
          sub_2479993B0();
          sub_247999CA0();
          sub_247999CA0();
          sub_247998240();
          sub_247945CC4(&qword_269267228, 255, MEMORY[0x263F06EA8]);
          sub_2479992F0();
          int v17 = _s19ImageGeneratorImageVMa;
          uint64_t v18 = (uint64_t)v4;
        }
        sub_2479460E4(v18, v17);
      }
      else
      {
        sub_247999CA0();
        sub_2479993B0();
        swift_bridgeObjectRelease();
      }
      uint64_t result = sub_2479460E4((uint64_t)v12, _s14MessageContentOMa);
      v15 += v16;
      --v13;
    }
    while (v13);
  }
  return result;
}

uint64_t sub_247943CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_247999CA0();
  if (v3)
  {
    uint64_t v5 = a2 + 33;
    do
    {
      v5 += 2;
      sub_2479993B0();
      swift_bridgeObjectRelease();
      sub_2479993B0();
      uint64_t result = swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_247943F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v64 = _s19ImageGeneratorImageVMa(0);
  MEMORY[0x270FA5388](v64);
  uint64_t v63 = (uint64_t)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = _s12ImageURLItemVMa(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v62 = (uint64_t)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = _s14MessageContentOMa(0);
  uint64_t v56 = *(void *)(v73 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v73);
  uint64_t v8 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  int64_t v10 = (char *)&v55 - v9;
  uint64_t v76 = _s18ImageGeneratorCallV5ImageVMa(0);
  uint64_t v59 = *(void *)(v76 - 8);
  MEMORY[0x270FA5388](v76);
  uint64_t v12 = (char *)&v55 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269267230);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(a2 + 16);
  uint64_t result = sub_247999CA0();
  uint64_t v68 = v16;
  if (v16)
  {
    uint64_t v18 = 0;
    uint64_t v67 = a2 + 32;
    unint64_t v77 = v59 + 56;
    v74 = (unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48);
    v75 = v10;
    v57 = v12;
    v60 = v8;
    while (2)
    {
      uint64_t v28 = v67 + 56 * v18;
      uint64_t v30 = *(void *)v28;
      uint64_t v29 = *(void *)(v28 + 8);
      uint64_t v32 = *(void *)(v28 + 16);
      uint64_t v31 = *(void *)(v28 + 24);
      uint64_t v33 = *(void *)(v28 + 32);
      uint64_t v34 = *(void *)(v28 + 40);
      ++v18;
      switch(*(unsigned char *)(v28 + 48))
      {
        case 1:
          uint64_t v72 = *(void *)(v28 + 32);
          uint64_t v19 = v29;
          sub_247999CA0();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_2479993B0();
          sub_2479993B0();
          uint64_t v20 = v72;
          sub_2479993B0();
          uint64_t v21 = v30;
          uint64_t v22 = v19;
          uint64_t v23 = v32;
          uint64_t v24 = v31;
          uint64_t v25 = v20;
          uint64_t v26 = v34;
          char v27 = 1;
          goto LABEL_4;
        case 2:
          uint64_t v66 = *(void *)(v28 + 40);
          uint64_t v61 = v18;
          uint64_t v72 = v33;
          uint64_t v35 = v32;
          uint64_t v36 = v29;
          sub_247999CA0();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v65 = v30;
          uint64_t v71 = v36;
          sub_2479993B0();
          uint64_t v69 = v35;
          uint64_t v70 = v31;
          sub_2479993B0();
          sub_247999CA0();
          uint64_t v37 = v72;
          uint64_t v38 = *(void *)(v72 + 16);
          if (!v38)
          {
            uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v77;
            uint64_t v18 = v61;
            goto LABEL_14;
          }
          unint64_t v58 = v77 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
          uint64_t v39 = v72 + ((*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80));
          uint64_t v40 = *(void *)(v59 + 72);
          uint64_t v41 = (uint64_t)v57;
          while (1)
          {
            sub_247946014(v39, (uint64_t)v15, _s18ImageGeneratorCallV5ImageVMa);
            uint64_t v42 = v76;
            uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v77;
            (*(void (**)(char *, void, uint64_t, uint64_t))v77)(v15, 0, 1, v76);
            if ((*v74)(v15, 1, v42) == 1) {
              break;
            }
            sub_24794607C((uint64_t)v15, v41, _s18ImageGeneratorCallV5ImageVMa);
            sub_247998240();
            sub_247945CC4(&qword_269267228, 255, MEMORY[0x263F06EA8]);
            sub_2479992F0();
            sub_2479460E4(v41, _s18ImageGeneratorCallV5ImageVMa);
            v39 += v40;
            if (!--v38)
            {
              int64_t v10 = v75;
              uint64_t v18 = v61;
              uint64_t v37 = v72;
LABEL_14:
              v43(v15, 1, 1, v76);
              uint64_t v21 = v65;
              uint64_t v26 = v66;
              uint64_t v24 = v70;
              uint64_t v22 = v71;
              uint64_t v23 = v69;
              uint64_t v25 = v37;
              char v27 = 2;
              goto LABEL_4;
            }
          }
          uint64_t result = sub_2478AE754(v65, v71, v69, v70, v72, v66, 2);
          int64_t v10 = v75;
          uint64_t v18 = v61;
LABEL_5:
          if (v18 != v68) {
            continue;
          }
          return result;
        case 3:
          uint64_t result = sub_247999CA0();
          goto LABEL_5;
        default:
          uint64_t v70 = *(void *)(v28 + 24);
          uint64_t v71 = v29;
          uint64_t v69 = v32;
          uint64_t v72 = v33;
          uint64_t v66 = v34;
          sub_247999CA0();
          uint64_t v65 = v30;
          uint64_t v44 = v70;
          uint64_t v45 = (uint64_t)v60;
          uint64_t v46 = v69;
          sub_2478ADF2C();
          sub_2479993B0();
          swift_bridgeObjectRelease();
          if (v44)
          {
            sub_247999CA0();
            uint64_t v47 = v71;
            uint64_t v48 = *(void *)(v71 + 16);
            sub_247999CA0();
            if (v48)
            {
              uint64_t v61 = v18;
              uint64_t v49 = v47 + ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80));
              uint64_t v50 = *(void *)(v56 + 72);
              do
              {
                sub_247946014(v49, (uint64_t)v10, _s14MessageContentOMa);
                sub_247946014((uint64_t)v10, v45, _s14MessageContentOMa);
                int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
                if (EnumCaseMultiPayload)
                {
                  if (EnumCaseMultiPayload == 1)
                  {
                    uint64_t v51 = v62;
                    sub_24794607C(v45, v62, _s12ImageURLItemVMa);
                    sub_247999CA0();
                    sub_247998240();
                    sub_247945CC4(&qword_269267228, 255, MEMORY[0x263F06EA8]);
                    sub_2479992F0();
                    v52 = _s12ImageURLItemVMa;
                  }
                  else
                  {
                    uint64_t v51 = v63;
                    sub_24794607C(v45, v63, _s19ImageGeneratorImageVMa);
                    sub_247999CA0();
                    sub_2479993B0();
                    sub_247999CA0();
                    sub_247999CA0();
                    sub_247998240();
                    sub_247945CC4(&qword_269267228, 255, MEMORY[0x263F06EA8]);
                    sub_2479992F0();
                    v52 = _s19ImageGeneratorImageVMa;
                  }
                  sub_2479460E4(v51, v52);
                }
                else
                {
                  sub_247999CA0();
                  sub_2479993B0();
                  swift_bridgeObjectRelease();
                }
                int64_t v10 = v75;
                sub_2479460E4((uint64_t)v75, _s14MessageContentOMa);
                v49 += v50;
                --v48;
              }
              while (v48);
              uint64_t result = sub_2478AE754(v65, v71, v69, v70, v72, v66, 0);
              uint64_t v18 = v61;
              goto LABEL_5;
            }
            uint64_t v21 = v65;
            uint64_t v22 = v47;
            uint64_t v23 = v69;
            uint64_t v24 = v70;
          }
          else
          {
            sub_247999CA0();
            uint64_t v54 = v71;
            sub_2479993B0();
            uint64_t v21 = v65;
            uint64_t v22 = v54;
            uint64_t v23 = v46;
            uint64_t v24 = v44;
          }
          uint64_t v25 = v72;
          uint64_t v26 = v66;
          char v27 = 0;
LABEL_4:
          uint64_t result = sub_2478AE754(v21, v22, v23, v24, v25, v26, v27);
          goto LABEL_5;
      }
    }
  }
  return result;
}

uint64_t sub_24794487C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_247999CA0();
  if (v3)
  {
    uint64_t v5 = a2 + 48;
    do
    {
      v5 += 24;
      swift_bridgeObjectRetain();
      sub_2479993B0();
      swift_bridgeObjectRelease();
      sub_2479993B0();
      uint64_t result = swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_2479449C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s9ChatChunkO6ChoiceVMa(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t result = sub_247999CA0();
  if (v8)
  {
    uint64_t v10 = a2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v11 = *(void *)(v5 + 72);
    do
    {
      sub_247946014(v10, (uint64_t)v7, _s9ChatChunkO6ChoiceVMa);
      swift_bridgeObjectRetain();
      sub_2479993B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_2479993B0();
      swift_bridgeObjectRelease();
      uint64_t v12 = *((void *)v7 + 4);
      swift_bridgeObjectRetain();
      sub_247943F6C(a1, v12);
      swift_bridgeObjectRelease();
      uint64_t v13 = *((void *)v7 + 5);
      sub_247999CB0();
      if (v13)
      {
        swift_bridgeObjectRetain();
        sub_247943CE8(a1, v13);
        swift_bridgeObjectRelease();
      }
      sub_247998240();
      sub_247945CC4(&qword_269267228, 255, MEMORY[0x263F06EA8]);
      sub_2479992F0();
      uint64_t result = sub_2479460E4((uint64_t)v7, _s9ChatChunkO6ChoiceVMa);
      v10 += v11;
      --v8;
    }
    while (v8);
  }
  return result;
}

uint64_t sub_247944BFC(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = _s14TextAnnotationV11URLCitationVMa(0);
  MEMORY[0x270FA5388](v19);
  uint64_t v18 = (uint64_t)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = _s14TextAnnotationV4TypeOMa(0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _s14TextAnnotationVMa(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(a2 + 16);
  uint64_t v20 = a1;
  uint64_t result = sub_247999CA0();
  if (v12)
  {
    uint64_t v14 = a2 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v15 = *(void *)(v9 + 72);
    do
    {
      sub_247946014(v14, (uint64_t)v11, _s14TextAnnotationVMa);
      sub_247946014((uint64_t)v11, (uint64_t)v7, _s14TextAnnotationV4TypeOMa);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_247999CA0();
        sub_2479993B0();
        sub_247999CA0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v16 = v18;
        sub_24794607C((uint64_t)v7, v18, _s14TextAnnotationV11URLCitationVMa);
        sub_247999CA0();
        sub_247998240();
        sub_247945CC4(&qword_269267228, 255, MEMORY[0x263F06EA8]);
        sub_2479992F0();
        sub_2479993B0();
        sub_247999CA0();
        sub_2479460E4(v16, _s14TextAnnotationV11URLCitationVMa);
      }
      uint64_t result = sub_2479460E4((uint64_t)v11, _s14TextAnnotationVMa);
      v14 += v15;
      --v12;
    }
    while (v12);
  }
  return result;
}

uint64_t sub_247944F14(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_247999CA0();
  if (v3)
  {
    uint64_t v5 = a2 + 56;
    do
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2479993B0();
      swift_bridgeObjectRetain();
      sub_2479993B0();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease_n();
      v5 += 32;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_247944FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t result = sub_247999CA0();
  if (v4)
  {
    uint64_t v6 = (unint64_t *)(a2 + 40);
    uint64_t v7 = (unint64_t *)(a2 + 40);
    do
    {
      unint64_t v9 = *v7;
      v7 += 6;
      unint64_t v8 = v9;
      if (!v9 || v8 == 1 || v8 == 2)
      {
        uint64_t result = sub_247999CA0();
      }
      else
      {
        uint64_t v10 = *(v6 - 1);
        sub_247999CA0();
        sub_247945F6C(v10, v8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        sub_2479993B0();
        swift_bridgeObjectRetain();
        sub_2479993B0();
        swift_bridgeObjectRelease();
        swift_retain();
        sub_24793E658(a1);
        swift_release();
        sub_247999CB0();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = sub_247945FC0(v10, v8);
      }
      uint64_t v6 = v7;
      --v4;
    }
    while (v4);
  }
  return result;
}

unint64_t sub_247945158(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  unint64_t result = sub_247999CA0();
  if (v4)
  {
    uint64_t v6 = (unint64_t *)(a2 + 32);
    while (2)
    {
      unint64_t v8 = *v6++;
      unint64_t v7 = v8;
      switch(v8)
      {
        case 0uLL:
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
          unint64_t result = sub_247999CA0();
          if (--v4) {
            continue;
          }
          break;
        default:
          sub_247999CA0();
          swift_bridgeObjectRetain();
          sub_247945158(a1, v7);
          unint64_t result = sub_247945258(v7);
          if (--v4) {
            continue;
          }
          break;
      }
      break;
    }
  }
  return result;
}

unint64_t sub_247945258(unint64_t result)
{
  if (result >= 7) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_247945268(uint64_t a1, unint64_t a2)
{
  switch(a1)
  {
    case 0:
      if (a2) {
        goto LABEL_18;
      }
      uint64_t result = 1;
      break;
    case 1:
      if (a2 != 1) {
        goto LABEL_18;
      }
      uint64_t result = 1;
      break;
    case 2:
      if (a2 != 2) {
        goto LABEL_18;
      }
      uint64_t result = 1;
      break;
    case 3:
      if (a2 != 3) {
        goto LABEL_18;
      }
      uint64_t result = 1;
      break;
    case 4:
      if (a2 != 4) {
        goto LABEL_18;
      }
      uint64_t result = 1;
      break;
    case 5:
      if (a2 != 5) {
        goto LABEL_18;
      }
      uint64_t result = 1;
      break;
    case 6:
      if (a2 != 6) {
        goto LABEL_18;
      }
      uint64_t result = 1;
      break;
    default:
      if (a2 < 7) {
LABEL_18:
      }
        uint64_t result = 0;
      else {
        uint64_t result = sub_2479413E8(a1, a2);
      }
      break;
  }
  return result;
}

uint64_t sub_247945330(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a2 + 24);
  if (v4)
  {
    if (!v5) {
      goto LABEL_40;
    }
    if (*(void *)(a1 + 16) != *(void *)(a2 + 16) || v4 != v5)
    {
      char v7 = sub_247999B80();
      char v8 = 0;
      if ((v7 & 1) == 0) {
        return v8 & 1;
      }
    }
  }
  else if (v5)
  {
    goto LABEL_40;
  }
  unint64_t v9 = *(void *)(a1 + 32);
  unint64_t v10 = *(void *)(a2 + 32);
  sub_247945508(v9);
  sub_247945508(v10);
  char v11 = sub_247945268(v9, v10);
  sub_247945258(v10);
  sub_247945258(v9);
  if ((v11 & 1) == 0) {
    goto LABEL_40;
  }
  uint64_t v12 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40))
  {
    if (!v12) {
      goto LABEL_40;
    }
    swift_bridgeObjectRetain();
    uint64_t v13 = swift_bridgeObjectRetain();
    char v14 = sub_247942D8C(v13, v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (v12)
  {
    goto LABEL_40;
  }
  uint64_t v15 = *(void **)(a1 + 48);
  uint64_t v16 = *(void **)(a2 + 48);
  if (v15)
  {
    if (!v16 || (sub_247941320(v15, v16) & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (v16)
  {
    goto LABEL_40;
  }
  uint64_t v17 = *(void **)(a1 + 56);
  uint64_t v18 = *(void **)(a2 + 56);
  if (v17)
  {
    if (!v18 || (sub_247941320(v17, v18) & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (v18)
  {
    goto LABEL_40;
  }
  uint64_t v19 = *(void **)(a1 + 64);
  uint64_t v20 = *(void **)(a2 + 64);
  if (v19)
  {
    if (!v20 || (sub_247941320(v19, v20) & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (v20)
  {
    goto LABEL_40;
  }
  uint64_t v21 = *(void *)(a2 + 72);
  if (*(void *)(a1 + 72))
  {
    if (v21)
    {
      swift_retain();
      uint64_t v22 = swift_retain();
      char v23 = sub_247945330(v22, v21);
      swift_release();
      swift_release();
      if (v23) {
        goto LABEL_34;
      }
    }
LABEL_40:
    char v8 = 0;
    return v8 & 1;
  }
  if (v21) {
    goto LABEL_40;
  }
LABEL_34:
  int v24 = *(unsigned __int8 *)(a1 + 80);
  char v8 = v24 == 2;
  int v25 = *(unsigned __int8 *)(a2 + 80);
  if (v25 != 2) {
    char v8 = 0;
  }
  if (v24 != 2 && v25 != 2) {
    char v8 = ((v24 & 1) == 0) ^ v25;
  }
  return v8 & 1;
}

unint64_t sub_247945508(unint64_t result)
{
  if (result >= 7) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_247945518()
{
  unint64_t v0 = sub_247999970();
  swift_bridgeObjectRelease();
  if (v0 >= 8) {
    return 8;
  }
  else {
    return v0;
  }
}

uint64_t sub_247945564(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v21 = MEMORY[0x263F8EE78];
    sub_247966104(0, v1, 0);
    uint64_t v2 = v21;
    uint64_t v4 = (unsigned __int8 *)(a1 + 72);
    do
    {
      uint64_t v6 = *((void *)v4 - 5);
      uint64_t v5 = *((void *)v4 - 4);
      uint64_t v7 = *((void *)v4 - 2);
      char v8 = (void *)*((void *)v4 - 1);
      int v9 = *v4;
      v8[2] = *((void *)v4 - 3);
      v8[3] = v7;
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v9 == 1)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_269268B50);
        uint64_t v10 = swift_allocObject();
        *(_OWORD *)(v10 + 16) = xmmword_2479A4340;
        unint64_t v11 = v8[4];
        *(void *)(v10 + 32) = v11;
        *(void *)(v10 + 40) = 0;
      }
      else
      {
        unint64_t v11 = v8[4];
        uint64_t v10 = v11;
      }
      sub_247945508(v11);
      unint64_t v12 = v8[4];
      v8[4] = v10;
      sub_247945258(v12);
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v21 = v2;
      unint64_t v14 = *(void *)(v2 + 16);
      unint64_t v13 = *(void *)(v2 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_247966104(v13 > 1, v14 + 1, 1);
        uint64_t v2 = v21;
      }
      v4 += 48;
      *(void *)(v2 + 16) = v14 + 1;
      uint64_t v15 = (void *)(v2 + 24 * v14);
      v15[4] = v6;
      v15[5] = v5;
      v15[6] = v8;
      --v1;
    }
    while (v1);
  }
  if (*(void *)(sub_24793ECE4(v2) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269268448);
    uint64_t v16 = sub_247999950();
  }
  else
  {
    uint64_t v16 = MEMORY[0x263F8EE80];
  }
  uint64_t v21 = v16;
  uint64_t v17 = (void *)swift_bridgeObjectRetain();
  sub_247942F70(v17, 1, &v21);
  swift_bridgeObjectRelease();
  uint64_t v18 = v21;
  uint64_t v19 = sub_24793E580(v2);
  swift_bridgeObjectRelease();
  type metadata accessor for JSONSchema();
  swift_allocObject();
  return sub_24793EE60(0, 0, 6, v18, 0, v19, 0, 0);
}

uint64_t sub_2479457BC(void *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247999D00();
  if (!v1)
  {
    sub_2478A2438(v24, (uint64_t)v26);
    __swift_project_boxed_opaque_existential_1(v26, v27);
    uint64_t v4 = sub_247999B90();
    uint64_t v6 = v5;
    uint64_t v3 = 1;
    *(void *)&v24[0] = 1;
    if (sub_247999390() != v4 || v7 != v6)
    {
      char v9 = sub_247999B80();
      swift_bridgeObjectRelease();
      if (v9)
      {
        uint64_t v3 = 1;
LABEL_12:
        swift_bridgeObjectRelease();
        goto LABEL_13;
      }
      uint64_t v3 = 2;
      *(void *)&v24[0] = 2;
      if (sub_247999390() != v4 || v10 != v6)
      {
        char v12 = sub_247999B80();
        swift_bridgeObjectRelease();
        if (v12)
        {
          uint64_t v3 = 2;
          goto LABEL_12;
        }
        uint64_t v3 = 3;
        *(void *)&v24[0] = 3;
        if (sub_247999390() != v4 || v13 != v6)
        {
          char v14 = sub_247999B80();
          swift_bridgeObjectRelease();
          if (v14)
          {
            uint64_t v3 = 3;
            goto LABEL_12;
          }
          uint64_t v3 = 4;
          *(void *)&v24[0] = 4;
          if (sub_247999390() != v4 || v15 != v6)
          {
            char v16 = sub_247999B80();
            swift_bridgeObjectRelease();
            if (v16)
            {
              uint64_t v3 = 4;
              goto LABEL_12;
            }
            uint64_t v3 = 5;
            *(void *)&v24[0] = 5;
            if (sub_247999390() != v4 || v17 != v6)
            {
              char v18 = sub_247999B80();
              swift_bridgeObjectRelease();
              if (v18)
              {
                uint64_t v3 = 5;
                goto LABEL_12;
              }
              uint64_t v3 = 6;
              *(void *)&v24[0] = 6;
              if (sub_247999390() != v4 || v19 != v6)
              {
                char v20 = sub_247999B80();
                swift_bridgeObjectRelease();
                if ((v20 & 1) == 0)
                {
                  uint64_t v21 = sub_247999860();
                  swift_allocError();
                  uint64_t v23 = v22;
                  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
                  sub_247999CE0();
                  *(void *)&v24[0] = 0;
                  *((void *)&v24[0] + 1) = 0xE000000000000000;
                  sub_247999800();
                  swift_bridgeObjectRelease();
                  *(void *)&v24[0] = v4;
                  *((void *)&v24[0] + 1) = v6;
                  uint64_t v3 = (uint64_t)v24;
                  sub_2479993D0();
                  sub_247999840();
                  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCB8], v21);
                  swift_willThrow();
                  goto LABEL_13;
                }
                uint64_t v3 = 6;
                goto LABEL_12;
              }
            }
          }
        }
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }

  uint64_t v25 = 0;
  memset(v24, 0, sizeof(v24));
  sub_2478A1A1C((uint64_t)v24, &qword_269268B38);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247999CF0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268B40);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
  sub_247945C50();
  sub_247999B60();
  uint64_t v3 = *(void *)&v24[0];
LABEL_13:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

unint64_t sub_247945C50()
{
  unint64_t result = qword_269268B48;
  if (!qword_269268B48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269268B40);
    sub_247942894();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269268B48);
  }
  return result;
}

uint64_t sub_247945CC4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t destroy for JSONSchema.Property()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

ValueMetadata *type metadata accessor for JSONSchema.Property()
{
  return &type metadata for JSONSchema.Property;
}

unsigned char *storeEnumTagSinglePayload for JSONSchema.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x247945E2CLL);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for JSONSchema.CodingKeys()
{
  return &type metadata for JSONSchema.CodingKeys;
}

unint64_t sub_247945E68()
{
  unint64_t result = qword_269268B68;
  if (!qword_269268B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269268B68);
  }
  return result;
}

unint64_t sub_247945EC0()
{
  unint64_t result = qword_269268B70;
  if (!qword_269268B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269268B70);
  }
  return result;
}

unint64_t sub_247945F18()
{
  unint64_t result = qword_269268B78;
  if (!qword_269268B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269268B78);
  }
  return result;
}

uint64_t sub_247945F6C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 3)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_247945FC0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_247946014(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24794607C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2479460E4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_247946148@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v5 = sub_247998D10();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  char v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)&v21 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C98);
  MEMORY[0x270FA5388](v12 - 8);
  char v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2478E6A48(a1, (uint64_t)v14, &qword_269268C98);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v14, 1, v5) == 1)
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268CC0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(a3, 1, 1, v15);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v14, v5);
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268CC0);
    uint64_t v17 = *(int *)(v16 + 48);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    sub_2479985E0();
    uint64_t v18 = *MEMORY[0x263F7F8D8];
    uint64_t v19 = sub_247998570();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(a3, v18, v19);
    *(void *)(a3 + v17) = v22;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(a3, 0, 1, v16);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_247946404(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5, char a6)
{
  *(void *)(v7 + 304) = a5;
  *(void *)(v7 + 312) = v6;
  *(unsigned char *)(v7 + 218) = a6;
  *(void *)(v7 + 288) = a2;
  *(void *)(v7 + 296) = a4;
  *(void *)(v7 + 280) = a1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C28);
  *(void *)(v7 + 320) = v9;
  *(void *)(v7 + 328) = *(void *)(v9 - 8);
  *(void *)(v7 + 336) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268CE0);
  *(void *)(v7 + 344) = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268CE8);
  *(void *)(v7 + 352) = v10;
  *(void *)(v7 + 360) = *(void *)(v10 - 8);
  *(void *)(v7 + 368) = swift_task_alloc();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268CF0);
  *(void *)(v7 + 376) = v11;
  *(void *)(v7 + 384) = *(void *)(v11 - 8);
  *(void *)(v7 + 392) = swift_task_alloc();
  *(void *)(v7 + 400) = swift_task_alloc();
  uint64_t v12 = sub_247997EC0();
  *(void *)(v7 + 408) = v12;
  *(void *)(v7 + 416) = *(void *)(v12 - 8);
  *(void *)(v7 + 424) = swift_task_alloc();
  long long v13 = a3[11];
  *(_OWORD *)(v7 + 176) = a3[10];
  *(_OWORD *)(v7 + 192) = v13;
  *(_OWORD *)(v7 + 202) = *(_OWORD *)((char *)a3 + 186);
  long long v14 = a3[7];
  *(_OWORD *)(v7 + 112) = a3[6];
  *(_OWORD *)(v7 + 128) = v14;
  long long v15 = a3[9];
  *(_OWORD *)(v7 + 144) = a3[8];
  *(_OWORD *)(v7 + 160) = v15;
  long long v16 = a3[3];
  *(_OWORD *)(v7 + 48) = a3[2];
  *(_OWORD *)(v7 + 64) = v16;
  long long v17 = a3[5];
  *(_OWORD *)(v7 + 80) = a3[4];
  *(_OWORD *)(v7 + 96) = v17;
  long long v18 = a3[1];
  *(_OWORD *)(v7 + 16) = *a3;
  *(_OWORD *)(v7 + 32) = v18;
  return MEMORY[0x270FA2498](sub_24794666C, 0, 0);
}

uint64_t sub_24794666C()
{
  sub_24796A99C();
  uint64_t v1 = sub_247997F90();
  unint64_t v3 = v2;
  sub_24789CFFC(v1, v2, *(void *)(v0 + 288), 0, *(void *)(v0 + 296), *(void *)(v0 + 304), *(unsigned char *)(v0 + 218) & 1, *(void *)(v0 + 424));
  sub_2478A0704(v1, v3);
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 432) = v4;
  *unsigned int v4 = v0;
  v4[1] = sub_247946800;
  uint64_t v5 = *(void *)(v0 + 424);
  uint64_t v6 = *(void *)(v0 + 400);
  return sub_24789E278(v6, v5, 1);
}

uint64_t sub_247946800(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 440) = a1;
  *(void *)(v3 + 448) = v1;
  swift_task_dealloc();
  if (v1) {
    unsigned int v4 = sub_247946CF4;
  }
  else {
    unsigned int v4 = sub_247946914;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_247946914()
{
  uint64_t v33 = v0;
  id v30 = *(id *)(v0 + 440);
  uint64_t v31 = *(void *)(v0 + 448);
  uint64_t v2 = *(void *)(v0 + 392);
  uint64_t v1 = *(void *)(v0 + 400);
  uint64_t v3 = *(void *)(v0 + 376);
  uint64_t v4 = *(void *)(v0 + 384);
  uint64_t v5 = *(void *)(v0 + 360);
  uint64_t v6 = *(void *)(v0 + 368);
  uint64_t v7 = *(void *)(v0 + 352);
  uint64_t v8 = *(void *)(v0 + 312);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268D00);
  swift_allocBox();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  sub_247920218(v8, v0 + 224);
  uint64_t v9 = swift_allocObject();
  long long v10 = *(_OWORD *)(v0 + 240);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)(v0 + 224);
  *(_OWORD *)(v9 + 32) = v10;
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(v0 + 256);
  *(void *)(v9 + 64) = *(void *)(v0 + 272);
  _s9ChatChunkOMa(0);
  sub_2478A23F4(&qword_269268D18, &qword_269268CF0);
  sub_247999B40();
  MEMORY[0x24C563610](v7);
  sub_247999580();
  sub_247999B10();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
  sub_247999B20();
  swift_retain();
  sub_2479995F0();
  id v11 = objc_msgSend(v30, sel_allHeaderFields);
  uint64_t v12 = sub_2479992C0();

  uint64_t v13 = sub_24789DDA4(v12);
  swift_bridgeObjectRelease();
  if (*(void *)(v13 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269266BD0);
    uint64_t v14 = sub_247999950();
  }
  else
  {
    uint64_t v14 = MEMORY[0x263F8EE80];
  }
  uint64_t v32 = v14;
  long long v15 = (void *)swift_bridgeObjectRetain();
  sub_2478A0290(v15, 1, &v32);
  if (v31)
  {
    return swift_unexpectedError();
  }
  else
  {
    long long v17 = *(void **)(v0 + 440);
    uint64_t v18 = *(void *)(v0 + 416);
    uint64_t v19 = *(void *)(v0 + 424);
    uint64_t v20 = *(void *)(v0 + 400);
    uint64_t v21 = *(void *)(v0 + 384);
    uint64_t v29 = *(void *)(v0 + 408);
    uint64_t v22 = *(void *)(v0 + 376);
    uint64_t v23 = *(void *)(v0 + 328);
    uint64_t v27 = *(void *)(v0 + 320);
    uint64_t v28 = *(void *)(v0 + 336);
    uint64_t v24 = *(void *)(v0 + 280);
    swift_bridgeObjectRelease();

    uint64_t v25 = v32;
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v29);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v24, v28, v27);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v26 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v26(v25);
  }
}

uint64_t sub_247946CF4()
{
  (*(void (**)(void, void))(v0[52] + 8))(v0[53], v0[51]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_247946DB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a3;
  v4[7] = a4;
  v4[4] = a1;
  v4[5] = a2;
  sub_247999380();
  v4[8] = swift_task_alloc();
  uint64_t v5 = _s9ChatChunkOMa(0);
  v4[9] = v5;
  v4[10] = *(void *)(v5 - 8);
  v4[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247946EA4, 0, 0);
}

uint64_t sub_247946EA4()
{
  sub_24796D17C(&qword_269268D50, (void (*)(uint64_t))_s9ChatChunkOMa);
  sub_247997EF0();
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[4];
  sub_24796CCB4(v0[11], v3, _s9ChatChunkOMa);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1 + 56))(v3, 0, 1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_247947284(uint64_t a1)
{
  v1[6] = a1;
  v1[7] = __swift_instantiateConcreteTypeFromMangledName(&qword_269268D30);
  v1[8] = swift_task_alloc();
  v1[9] = swift_task_alloc();
  v1[10] = swift_projectBox();
  return MEMORY[0x270FA2498](sub_24794733C, 0, 0);
}

uint64_t sub_24794733C()
{
  swift_beginAccess();
  uint64_t v4 = (uint64_t (*)(uint64_t))((char *)&dword_269268D38 + dword_269268D38);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  void *v1 = v0;
  v1[1] = sub_2479473FC;
  uint64_t v2 = *(void *)(v0 + 48);
  return v4(v2);
}

uint64_t sub_2479473FC()
{
  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24794774C;
  }
  else
  {
    swift_endAccess();
    uint64_t v2 = sub_247947518;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247947518()
{
  long long v16 = v0;
  if (qword_269266A80 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[9];
  uint64_t v3 = sub_247999030();
  __swift_project_value_buffer(v3, (uint64_t)qword_26927FC08);
  sub_2478E6A48(v1, v2, &qword_269268D30);
  uint64_t v4 = sub_247999010();
  os_log_type_t v5 = sub_247999680();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = v0[9];
  if (v6)
  {
    uint64_t v8 = v0[8];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    sub_2478E6A48(v7, v8, &qword_269268D30);
    uint64_t v11 = sub_247999390();
    v0[5] = sub_247918FF0(v11, v12, &v15);
    sub_247999720();
    swift_bridgeObjectRelease();
    sub_2478A1A1C(v7, &qword_269268D30);
    _os_log_impl(&dword_247896000, v4, v5, "Recieved streaming chunk response: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v10, -1, -1);
    MEMORY[0x24C564070](v9, -1, -1);
  }
  else
  {
    sub_2478A1A1C(v0[9], &qword_269268D30);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_24794774C()
{
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2479477C4(uint64_t a1)
{
  v2[10] = a1;
  v2[11] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268D30);
  v2[12] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268D00);
  v2[13] = v3;
  v2[14] = *(void *)(v3 - 8);
  v2[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2479478B8, 0, 0);
}

uint64_t sub_2479478B8()
{
  *(void *)(v0 + 128) = sub_247999B00();
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268CE0);
  uint64_t v2 = sub_2478A23F4(&qword_269268D40, &qword_269268CE0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_2479479B8;
  return MEMORY[0x270FA1E80](v0 + 64, v1, v2);
}

uint64_t sub_2479479B8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_247947CD8;
  }
  else
  {
    (*(void (**)(void))(v2 + 128))();
    uint64_t v3 = sub_247947AE4;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_247947AE4()
{
  unint64_t v1 = v0[9];
  if (v1 >> 60 == 15)
  {
    uint64_t v2 = v0[10];
    uint64_t v3 = _s9ChatChunkOMa(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    uint64_t v7 = v0[14];
    uint64_t v6 = v0[15];
    uint64_t v8 = v0[13];
    uint64_t v9 = v0[11];
    v0[6] = v0[8];
    v0[7] = v1;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
    uint64_t v10 = (int *)sub_247999B10();
    v0[19] = v11;
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    uint64_t v14 = (int *)((char *)v10 + *v10);
    unint64_t v12 = (void *)swift_task_alloc();
    v0[20] = v12;
    *unint64_t v12 = v0;
    v12[1] = sub_247947D60;
    uint64_t v13 = v0[12];
    return ((uint64_t (*)(uint64_t, void *))v14)(v13, v0 + 6);
  }
}

uint64_t sub_247947CD8()
{
  (*(void (**)(void))(v0 + 128))();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247947D60()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  sub_2478A0704(*(void *)(v1 + 48), *(void *)(v1 + 56));
  return MEMORY[0x270FA2498](sub_247947EB0, 0, 0);
}

uint64_t sub_247947EB0()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = _s9ChatChunkOMa(0);
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_2478A1A1C(v1, &qword_269268D30);
    v0[16] = sub_247999B00();
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268CE0);
    uint64_t v5 = sub_2478A23F4(&qword_269268D40, &qword_269268CE0);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[17] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_2479479B8;
    return MEMORY[0x270FA1E80](v0 + 8, v4, v5);
  }
  else
  {
    uint64_t v7 = v0[10];
    sub_24796CCB4(v1, v7, _s9ChatChunkOMa);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v7, 0, 1, v2);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
    return v8();
  }
}

uint64_t sub_2479480CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 72) = a8;
  *(void *)(v9 + 80) = v8;
  *(void *)(v9 + 56) = a5;
  *(void *)(v9 + 64) = a7;
  *(unsigned char *)(v9 + 164) = a6;
  *(void *)(v9 + 40) = a2;
  *(void *)(v9 + 48) = a4;
  *(_DWORD *)(v9 + 160) = a3;
  *(void *)(v9 + 32) = a1;
  uint64_t v10 = sub_247998240();
  *(void *)(v9 + 88) = v10;
  *(void *)(v9 + 96) = *(void *)(v10 - 8);
  *(void *)(v9 + 104) = swift_task_alloc();
  uint64_t v11 = sub_247997EC0();
  *(void *)(v9 + 112) = v11;
  *(void *)(v9 + 120) = *(void *)(v11 - 8);
  *(void *)(v9 + 128) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2479481FC, 0, 0);
}

uint64_t sub_2479481FC()
{
  (*(void (**)(void, void, void))(*(void *)(v0 + 96) + 16))(*(void *)(v0 + 104), *(void *)(v0 + 32), *(void *)(v0 + 88));
  sub_247997E70();
  uint64_t v1 = *(void *)(v0 + 40);
  sub_247997E30();
  uint64_t v26 = v1 + 64;
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  uint64_t v4 = v2 & *(void *)(v1 + 64);
  int64_t v5 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = swift_bridgeObjectRetain();
  int64_t v14 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    int64_t v15 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return MEMORY[0x270FA2360](v6, v7, v8, v9, v10, v11, v12, v13);
    }
    if (v15 >= v5) {
      goto LABEL_23;
    }
    uint64_t v16 = *(void *)(v26 + 8 * v15);
    ++v14;
    if (!v16)
    {
      int64_t v14 = v15 + 1;
      if (v15 + 1 >= v5) {
        goto LABEL_23;
      }
      uint64_t v16 = *(void *)(v26 + 8 * v14);
      if (!v16)
      {
        int64_t v14 = v15 + 2;
        if (v15 + 2 >= v5) {
          goto LABEL_23;
        }
        uint64_t v16 = *(void *)(v26 + 8 * v14);
        if (!v16)
        {
          int64_t v14 = v15 + 3;
          if (v15 + 3 >= v5) {
            goto LABEL_23;
          }
          uint64_t v16 = *(void *)(v26 + 8 * v14);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_22:
    uint64_t v4 = (v16 - 1) & v16;
LABEL_5:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_247997E80();
    swift_bridgeObjectRelease();
    uint64_t v6 = swift_bridgeObjectRelease();
  }
  int64_t v17 = v15 + 4;
  if (v17 < v5)
  {
    uint64_t v16 = *(void *)(v26 + 8 * v17);
    if (!v16)
    {
      while (1)
      {
        int64_t v14 = v17 + 1;
        if (__OFADD__(v17, 1)) {
          goto LABEL_27;
        }
        if (v14 >= v5) {
          goto LABEL_23;
        }
        uint64_t v16 = *(void *)(v26 + 8 * v14);
        ++v17;
        if (v16) {
          goto LABEL_22;
        }
      }
    }
    int64_t v14 = v17;
    goto LABEL_22;
  }
LABEL_23:
  uint64_t v18 = *(void *)(v0 + 128);
  uint64_t v19 = *(void *)(v0 + 80);
  uint64_t v21 = *(void *)(v0 + 48);
  uint64_t v20 = *(void *)(v0 + 56);
  int v22 = *(_DWORD *)(v0 + 160);
  long long v27 = *(_OWORD *)(v0 + 64);
  swift_release();
  uint64_t v23 = swift_task_alloc();
  *(void *)(v0 + 136) = v23;
  *(void *)(v23 + 16) = v19;
  *(void *)(v23 + 24) = v18;
  *(_OWORD *)(v23 + 32) = v27;
  *(_DWORD *)(v23 + 48) = v22;
  *(void *)(v23 + 56) = v20;
  *(void *)(v23 + 64) = v21;
  uint64_t v24 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v24;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268900);
  *uint64_t v24 = v0;
  v24[1] = sub_247948524;
  unint64_t v10 = 0x80000002479A6EF0;
  uint64_t v11 = sub_24796C68C;
  uint64_t v6 = v0 + 16;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  unint64_t v9 = 0xD00000000000005ELL;
  uint64_t v12 = v23;
  return MEMORY[0x270FA2360](v6, v7, v8, v9, v10, v11, v12, v13);
}

uint64_t sub_247948524()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2479486DC;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_247948640;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247948640()
{
  (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v1, v2);
}

uint64_t sub_2479486DC()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[15];
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

void sub_247948778(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v45 = a8;
  uint64_t v46 = a4;
  uint64_t v49 = a7;
  int v48 = a6;
  uint64_t v47 = a5;
  uint64_t v41 = a1;
  id v42 = a3;
  uint64_t v43 = sub_247998240();
  uint64_t v9 = *(void *)(v43 - 8);
  uint64_t v44 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v43);
  uint64_t v40 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268ED8);
  uint64_t v11 = *(void *)(v39 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v39);
  uint64_t v38 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_247997EC0();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = a2[5];
  uint64_t v18 = a2[6];
  __swift_project_boxed_opaque_existential_1(a2 + 2, v17);
  (*(void (**)(char *, id, uint64_t))(v14 + 16))(v16, v42, v13);
  id v42 = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 32))(v16, v17, v18);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v19 = v38;
  uint64_t v20 = v39;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v38, v41, v39);
  sub_247920218((uint64_t)a2, (uint64_t)v51);
  uint64_t v21 = v40;
  uint64_t v22 = v43;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v40, v45, v43);
  unint64_t v23 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v24 = (v12 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v25 = (*(unsigned __int8 *)(v9 + 80) + v24 + 56) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v26 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v26 + v23, v19, v20);
  unint64_t v27 = v26 + v24;
  long long v28 = v51[1];
  *(_OWORD *)unint64_t v27 = v51[0];
  *(_OWORD *)(v27 + 16) = v28;
  *(_OWORD *)(v27 + 32) = v51[2];
  *(void *)(v27 + 48) = v52;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v26 + v25, v21, v22);
  uint64_t v29 = (objc_class *)type metadata accessor for DocumentRegistrationURLSessionDelegate();
  id v30 = (char *)objc_allocWithZone(v29);
  *(_OWORD *)&v30[OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_data] = xmmword_24799A8E0;
  uint64_t v31 = &v30[OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_fileSize];
  *(void *)uint64_t v31 = 0;
  v31[8] = 1;
  uint64_t v32 = &v30[OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_update];
  uint64_t v33 = v47;
  *(void *)uint64_t v32 = v46;
  *((void *)v32 + 1) = v33;
  uint64_t v34 = (uint64_t (**)(uint64_t, unint64_t, void *, void *))&v30[OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_completion];
  *uint64_t v34 = sub_24796C81C;
  v34[1] = (uint64_t (*)(uint64_t, unint64_t, void *, void *))v26;
  uint64_t v35 = &v30[OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_fileDescriptor];
  *(_DWORD *)uint64_t v35 = v48;
  v35[4] = 0;
  *(void *)uint64_t v31 = v49;
  v31[8] = 0;
  v50.receiver = v30;
  v50.super_class = v29;
  id v36 = v42;
  swift_retain();
  id v37 = objc_msgSendSuper2(&v50, sel_init);
  objc_msgSend(v36, sel_setDelegate_, v37);

  objc_msgSend(v36, sel_resume);
}

uint64_t sub_247948BB8(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v8 = sub_247998240();
  uint64_t result = MEMORY[0x270FA5388](v8);
  if (a4)
  {
    id v10 = a4;
    if (qword_269266A80 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_247999030();
    __swift_project_value_buffer(v11, (uint64_t)qword_26927FC08);
    id v12 = a4;
    id v13 = a4;
    uint64_t v14 = sub_247999010();
    os_log_type_t v15 = sub_247999690();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 138412290;
      id v18 = a4;
      uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
      sub_247999720();
      *uint64_t v17 = v19;

      _os_log_impl(&dword_247896000, v14, v15, "Recieved error response: %@", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269266F40);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v17, -1, -1);
      MEMORY[0x24C564070](v16, -1, -1);
    }
    else
    {
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_269268ED8);
    return sub_2479994C0();
  }
  else
  {
    if (a2 >> 60 == 15)
    {
      __break(1u);
    }
    else if (a3)
    {
      sub_2479490E0(a1, a2, a3);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269268ED8);
      return sub_2479994D0();
    }
    __break(1u);
  }
  return result;
}

void sub_2479490E0(uint64_t a1, unint64_t a2, void *a3)
{
  self;
  uint64_t v7 = (void *)swift_dynamicCastObjCClassUnconditional();
  __swift_project_boxed_opaque_existential_1((void *)(v3 + 16), *(void *)(v3 + 40));
  id v8 = a3;
  if (sub_2478A0B90(v7, a1, a2))
  {
    swift_willThrow();
  }
  else
  {
    switch(a2 >> 62)
    {
      case 1uLL:
        if ((int)a1 != a1 >> 32) {
          goto LABEL_5;
        }
        goto LABEL_9;
      case 2uLL:
        if (*(void *)(a1 + 16) == *(void *)(a1 + 24)) {
          goto LABEL_9;
        }
        goto LABEL_5;
      case 3uLL:
        goto LABEL_9;
      default:
        if ((a2 & 0xFF000000000000) != 0)
        {
LABEL_5:
          sub_247997EF0();
        }
        else
        {
LABEL_9:
        }
        break;
    }
  }
}

uint64_t sub_24794924C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 80) = v15;
  *(void *)(v9 + 88) = v8;
  *(void *)(v9 + 64) = a8;
  *(void *)(v9 + 72) = v14;
  *(void *)(v9 + 48) = a6;
  *(void *)(v9 + 56) = a7;
  *(_DWORD *)(v9 + 168) = a5;
  *(void *)(v9 + 32) = a3;
  *(void *)(v9 + 40) = a4;
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  uint64_t v10 = sub_247998240();
  *(void *)(v9 + 96) = v10;
  *(void *)(v9 + 104) = *(void *)(v10 - 8);
  *(void *)(v9 + 112) = swift_task_alloc();
  uint64_t v11 = sub_247997EC0();
  *(void *)(v9 + 120) = v11;
  *(void *)(v9 + 128) = *(void *)(v11 - 8);
  *(void *)(v9 + 136) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247949384, 0, 0);
}

uint64_t sub_247949384()
{
  sub_2479497AC(*(void *)(v0 + 136), *(void *)(v0 + 112), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void **)(v0 + 40), *(_DWORD *)(v0 + 168), *(void *)(v0 + 48), *(void *)(v0 + 56));
  uint64_t v1 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v0 + 144) = v5;
  long long v6 = *(_OWORD *)(v0 + 72);
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v1;
  *(void *)(v5 + 32) = v2;
  *(_OWORD *)(v5 + 40) = v6;
  *(void *)(v5 + 56) = v4;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 152) = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268EE0);
  void *v7 = v0;
  v7[1] = sub_247949524;
  uint64_t v9 = *(void *)(v0 + 16);
  return MEMORY[0x270FA2360](v9, 0, 0, 0xD000000000000073, 0x80000002479A6F70, sub_24796CE88, v5, v8);
}

uint64_t sub_247949524()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_247949700;
  }
  else {
    uint64_t v2 = sub_247949654;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247949654()
{
  uint64_t v2 = v0[16];
  uint64_t v1 = v0[17];
  uint64_t v3 = v0[15];
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_247949700()
{
  uint64_t v2 = v0[16];
  uint64_t v1 = v0[17];
  uint64_t v3 = v0[15];
  (*(void (**)(void, void))(v0[13] + 8))(v0[14], v0[12]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_2479497AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6, uint64_t a7, uint64_t a8)
{
  id v185 = a5;
  uint64_t v166 = a7;
  uint64_t v167 = a8;
  LODWORD(v174) = a6;
  uint64_t v193 = a4;
  uint64_t v164 = a3;
  uint64_t v165 = a2;
  uint64_t v156 = a1;
  sub_2478F5268(a3, (uint64_t)v205, &qword_269268F28);
  uint64_t v162 = v205[1];
  uint64_t v163 = v205[0];
  uint64_t v160 = v205[3];
  uint64_t v161 = v205[2];
  uint64_t v158 = v205[5];
  uint64_t v159 = v205[4];
  int v157 = v206;
  uint64_t v8 = sub_247998BF0();
  v170 = *(uint64_t **)(v8 - 8);
  uint64_t v171 = v8;
  MEMORY[0x270FA5388](v8);
  v168 = (char *)&v155 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268EA0);
  MEMORY[0x270FA5388](v10 - 8);
  v169 = (char *)&v155 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = (void *)sub_247999380();
  unint64_t v188 = *(v12 - 1);
  id v189 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v187 = (uint64_t)&v155 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_247998190();
  uint64_t v183 = *(void *)(v14 - 8);
  uint64_t v184 = v14;
  MEMORY[0x270FA5388](v14);
  unint64_t v182 = (unint64_t)&v155 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v195 = sub_247998240();
  v208 = *(NSObject **)(v195 - 8);
  uint64_t v16 = v208;
  uint64_t v17 = MEMORY[0x270FA5388](v195);
  *(void *)&long long v175 = (char *)&v155 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  unint64_t v173 = (unint64_t)&v155 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v194 = (char *)&v155 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v179 = (uint64_t)&v155 - v23;
  uint64_t v24 = sub_247997EC0();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v177 = v24;
  uint64_t v178 = v25;
  MEMORY[0x270FA5388](v24);
  unint64_t v27 = (char *)&v155 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_247998400();
  unint64_t v181 = v28;
  uint64_t v29 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)&v155 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2479983F0();
  sub_2479983E0();
  *(void *)&long long v180 = *(void *)(v29 + 8);
  ((void (*)(char *, uint64_t))v180)(v31, v28);
  strcpy((char *)&v198, "Boundry-");
  BYTE9(v198) = 0;
  WORD5(v198) = 0;
  HIDWORD(v198) = -402653184;
  sub_2479993D0();
  swift_bridgeObjectRelease();
  long long v32 = v198;
  uint64_t v33 = v179;
  isa = (void (*)(uint64_t, uint64_t, uint64_t))v16[2].isa;
  os_log_t v192 = v16 + 2;
  isa(v179, v193, v195);
  sub_247997E70();
  sub_247997E30();
  *(void *)&long long v198 = 0;
  *((void *)&v198 + 1) = 0xE000000000000000;
  sub_247999800();
  swift_bridgeObjectRelease();
  *(void *)&long long v198 = 0xD00000000000001ELL;
  *((void *)&v198 + 1) = 0x80000002479A6FF0;
  uint64_t v193 = *((void *)&v32 + 1);
  uint64_t v172 = v32;
  sub_2479993D0();
  sub_247997EB0();
  swift_bridgeObjectRelease();
  v176 = v27;
  sub_24789E908((uint64_t)v27, (uint64_t)v185);
  uint64_t v34 = NSTemporaryDirectory();
  sub_247999330();

  sub_2479981C0();
  swift_bridgeObjectRelease();
  sub_2479983F0();
  uint64_t v35 = sub_2479983E0();
  uint64_t v37 = v36;
  ((void (*)(char *, unint64_t))v180)(v31, v181);
  uint64_t v38 = v208;
  *(void *)&long long v198 = v35;
  *((void *)&v198 + 1) = v37;
  unint64_t v39 = v182;
  uint64_t v40 = v183;
  uint64_t v41 = v184;
  (*(void (**)(unint64_t, void, uint64_t))(v183 + 104))(v182, *MEMORY[0x263F06E50], v184);
  sub_2478A3014();
  id v42 = v194;
  sub_247998230();
  (*(void (**)(unint64_t, uint64_t))(v40 + 8))(v39, v41);
  swift_bridgeObjectRelease();
  uint64_t v43 = (void (*)(uint64_t, uint64_t))v38[1].isa;
  uint64_t v44 = v33;
  uint64_t v45 = v195;
  v43(v44, v195);
  *(void *)&long long v198 = 0;
  *((void *)&v198 + 1) = 0xE000000000000000;
  uint64_t v46 = v187;
  sub_247999370();
  uint64_t v47 = v190;
  sub_247999760();
  v208 = v38 + 1;
  if (v47)
  {
    uint64_t v48 = v45;
    uint64_t v49 = isa;
    v190 = v43;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, id))(v188 + 8))(v46, v189);
    swift_bridgeObjectRelease();
    if (qword_269266A80 != -1) {
      swift_once();
    }
    uint64_t v50 = sub_247999030();
    __swift_project_value_buffer(v50, (uint64_t)qword_26927FC08);
    uint64_t v51 = v175;
    uint64_t v52 = v45;
    v49(v175, (uint64_t)v42, v45);
    v53 = v47;
    uint64_t v54 = v47;
    uint64_t v55 = sub_247999010();
    os_log_type_t v56 = sub_247999690();
    int v57 = v56;
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v58 = swift_slowAlloc();
      os_log_t v192 = v55;
      uint64_t v59 = v58;
      isa = (void (*)(uint64_t, uint64_t, uint64_t))swift_slowAlloc();
      uint64_t v193 = swift_slowAlloc();
      *(void *)&long long v198 = v193;
      *(_DWORD *)uint64_t v59 = 136315394;
      sub_24796D17C((unint64_t *)&qword_269268270, MEMORY[0x263F06EA8]);
      LODWORD(v189) = v57;
      uint64_t v60 = sub_247999B50();
      *(void *)&long long v204 = sub_247918FF0(v60, v61, (uint64_t *)&v198);
      sub_247999720();
      swift_bridgeObjectRelease();
      v190(v51, v48);
      *(_WORD *)(v59 + 12) = 2112;
      uint64_t v62 = v47;
      uint64_t v63 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)&long long v204 = v63;
      sub_247999720();
      uint64_t v64 = isa;
      *(void *)isa = v63;

      os_log_t v65 = v192;
      uint64_t v66 = (void (*)(char *, uint64_t))v190;
      _os_log_impl(&dword_247896000, v192, (os_log_type_t)v189, "Unable to create a new file at: %s, with error: %@ upload stopped", (uint8_t *)v59, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269266F40);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v64, -1, -1);
      uint64_t v67 = v193;
      swift_arrayDestroy();
      MEMORY[0x24C564070](v67, -1, -1);
      MEMORY[0x24C564070](v59, -1, -1);
    }
    else
    {
      uint64_t v66 = (void (*)(char *, uint64_t))v190;
      v190(v51, v48);
    }
    swift_willThrow();
    v66(v42, v52);
    return (*(uint64_t (**)(char *, uint64_t))(v178 + 8))(v176, v177);
  }
  uint64_t v68 = v174;
  (*(void (**)(uint64_t, id))(v188 + 8))(v46, v189);
  swift_bridgeObjectRelease();
  sub_24796D1C4();
  uint64_t v69 = v173;
  isa(v173, (uint64_t)v42, v45);
  id v189 = sub_24794BFFC(v69);
  v190 = v43;
  uint64_t v184 = 0;
  id v185 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08840]), sel_initWithFileDescriptor_closeOnDealloc_, v68, 0);
  sub_2479981D0();
  *(void *)&long long v198 = 11565;
  *((void *)&v198 + 1) = 0xE200000000000000;
  sub_2479993D0();
  sub_2479993D0();
  uint64_t v187 = sub_2478FFA2C(v198, *((unint64_t *)&v198 + 1));
  unint64_t v188 = v71;
  *(void *)&long long v198 = 0;
  *((void *)&v198 + 1) = 0xE000000000000000;
  sub_247999800();
  sub_2479993D0();
  sub_2479993D0();
  sub_2479993D0();
  sub_2479993D0();
  swift_bridgeObjectRelease();
  sub_2479993D0();
  uint64_t v186 = sub_2478FFA2C(v198, *((unint64_t *)&v198 + 1));
  unint64_t v73 = v72;
  *(void *)&long long v198 = 0;
  *((void *)&v198 + 1) = 0xE000000000000000;
  sub_247999800();
  swift_bridgeObjectRelease();
  strcpy((char *)&v198, "Content-Type: ");
  HIBYTE(v198) = -18;
  sub_2479981A0();
  sub_247998BE0();
  uint64_t v74 = (uint64_t)v169;
  sub_247998BC0();
  uint64_t v76 = v170;
  uint64_t v75 = v171;
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v170[6])(v74, 1, v171) == 1)
  {
    sub_2478A1A1C(v74, &qword_269268EA0);
  }
  else
  {
    sub_247998BD0();
    ((void (*)(uint64_t, uint64_t))v76[1])(v74, v75);
  }
  sub_2479993D0();
  swift_bridgeObjectRelease();
  sub_2479993D0();
  uint64_t v77 = sub_2478FFA2C(v198, *((unint64_t *)&v198 + 1));
  unint64_t v79 = v78;
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F38);
  uint64_t inited = swift_initStackObject();
  uint64_t v82 = v187;
  unint64_t v83 = v188;
  *(void *)(inited + 32) = v187;
  long long v180 = xmmword_24799A910;
  *(_OWORD *)(inited + 16) = xmmword_24799A910;
  uint64_t v84 = v186;
  *(void *)(inited + 40) = v83;
  *(void *)(inited + 48) = v84;
  *(void *)(inited + 56) = v73;
  *(void *)(inited + 64) = v77;
  *(void *)(inited + 72) = v79;
  sub_2478A06AC(v82, v83);
  unint64_t v182 = v73;
  sub_2478A06AC(v84, v73);
  uint64_t v183 = v77;
  unint64_t v181 = v79;
  sub_2478A06AC(v77, v79);
  unint64_t v86 = *(void *)(inited + 40);
  *(void *)&long long v198 = *(void *)(inited + 32);
  uint64_t v85 = v198;
  *((void *)&v198 + 1) = v86;
  sub_2478A06AC(v198, v86);
  unint64_t v87 = sub_24796D204();
  uint64_t v88 = v184;
  sub_247999630();
  if (v88)
  {
    uint64_t v91 = v195;
    swift_bridgeObjectRelease();
    sub_2478A0704(v187, v188);
    sub_2478A0704(v186, v182);
    sub_2478A0704(v183, v181);
    swift_bridgeObjectRelease();

    sub_2478A0704(v85, v86);
    id v92 = v189;
    objc_msgSend(v189, sel_closeFile);

    v190((uint64_t)v194, v91);
    return (*(uint64_t (**)(char *, uint64_t))(v178 + 8))(v176, v177);
  }
  uint64_t v184 = inited + 32;
  uint64_t v179 = v80;
  sub_2478A0704(v85, v86);
  uint64_t v89 = *(void *)(inited + 48);
  unint64_t v90 = *(void *)(inited + 56);
  *(void *)&long long v198 = v89;
  *((void *)&v198 + 1) = v90;
  sub_2478A06AC(v89, v90);
  sub_247999630();
  sub_2478A0704(v89, v90);
  uint64_t v93 = *(void *)(inited + 64);
  unint64_t v94 = *(void *)(inited + 72);
  *(void *)&long long v198 = v93;
  *((void *)&v198 + 1) = v94;
  sub_2478A06AC(v93, v94);
  sub_247999630();
  uint64_t v95 = v195;
  unint64_t v174 = v87;
  sub_2478A0704(v93, v94);
  swift_setDeallocating();
  swift_arrayDestroy();
  sub_2479980F0();
  swift_allocObject();
  uint64_t v96 = sub_2479980E0();
  *(void *)&long long v204 = 0;
  *((void *)&v204 + 1) = v96 | 0x4000000000000000;
  *(void *)&long long v175 = v96 | 0x4000000000000000;
  uint64_t v97 = sub_247999620();
  uint64_t v99 = 0;
  unint64_t v101 = v98;
  v102 = v194;
  if (v98 >> 60 == 15)
  {
    v103 = (void (*)(char *, uint64_t))v190;
    goto LABEL_25;
  }
  uint64_t v104 = v97;
  v103 = (void (*)(char *, uint64_t))v190;
  switch(v98 >> 62)
  {
    case 1uLL:
      uint64_t v105 = (int)v97;
      uint64_t v106 = v97 >> 32;
      goto LABEL_22;
    case 2uLL:
      uint64_t v105 = *(void *)(v97 + 16);
      uint64_t v106 = *(void *)(v97 + 24);
LABEL_22:
      if (v105 == v106) {
        goto LABEL_23;
      }
      goto LABEL_27;
    case 3uLL:
      goto LABEL_23;
    default:
      if ((v98 & 0xFF000000000000) == 0) {
        goto LABEL_23;
      }
LABEL_27:
      sub_247998300();
      unint64_t v118 = *((void *)&v204 + 1);
      uint64_t v117 = v204;
      long long v198 = v204;
      sub_2478A06AC(v204, *((unint64_t *)&v204 + 1));
      sub_247999630();
      uint64_t v184 = 0;
      sub_2478A0704(v117, v118);
      sub_2478A0704(v117, v118);
      sub_2478A1BBC(v104, v101);
      long long v175 = xmmword_24799A8E0;
      long long v204 = xmmword_24799A8E0;
      uint64_t v119 = v184;
      uint64_t v120 = sub_247999620();
      uint64_t v99 = v119;
      if (v119)
      {
        v122 = (void (*)(char *, uint64_t))v190;
        sub_2478A0704(0, 0xC000000000000000);
        sub_2478A0704(v187, v188);
        sub_2478A0704(v186, v182);
        sub_2478A0704(v183, v181);
        swift_bridgeObjectRelease();

        id v100 = v189;
        objc_msgSend(v189, sel_closeFile);

        v122(v102, v195);
        return (*(uint64_t (**)(char *, uint64_t))(v178 + 8))(v176, v177);
      }
      uint64_t v104 = v120;
      unint64_t v101 = v121;
      v103 = (void (*)(char *, uint64_t))v190;
      break;
  }
  while (2)
  {
    if (v101 >> 60 == 15)
    {
      *(void *)&long long v175 = 0xC000000000000000;
      goto LABEL_24;
    }
    switch(v101 >> 62)
    {
      case 1uLL:
        uint64_t v141 = (int)v104;
        uint64_t v142 = v104 >> 32;
        goto LABEL_39;
      case 2uLL:
        uint64_t v141 = *(void *)(v104 + 16);
        uint64_t v142 = *(void *)(v104 + 24);
LABEL_39:
        if (v141 != v142) {
          goto LABEL_40;
        }
        goto LABEL_42;
      case 3uLL:
        *(void *)&long long v175 = 0xC000000000000000;
        goto LABEL_23;
      default:
        if ((v101 & 0xFF000000000000) != 0)
        {
LABEL_40:
          sub_247998300();
          unint64_t v144 = *((void *)&v204 + 1);
          uint64_t v143 = v204;
          long long v198 = v204;
          sub_2478A06AC(v204, *((unint64_t *)&v204 + 1));
          sub_247999630();
          sub_2478A0704(v143, v144);
          sub_2478A0704(v143, v144);
          sub_2478A1BBC(v104, v101);
          long long v204 = v175;
          uint64_t v104 = sub_247999620();
          unint64_t v101 = v145;
          v103 = (void (*)(char *, uint64_t))v190;
          uint64_t v99 = 0;
          continue;
        }
LABEL_42:
        *(void *)&long long v175 = 0xC000000000000000;
        uint64_t v99 = 0;
        v103 = (void (*)(char *, uint64_t))v190;
LABEL_23:
        sub_2478A1BBC(v104, v101);
LABEL_24:
        uint64_t v95 = v195;
LABEL_25:
        uint64_t v107 = sub_2478FFA2C(0xA0DuLL, 0xE200000000000000);
        unint64_t v109 = v108;
        *(void *)&long long v198 = v107;
        *((void *)&v198 + 1) = v108;
        sub_247999630();
        uint64_t v110 = v165;
        sub_2478A0704(v107, v109);
        sub_2478F5268(v164, (uint64_t)v207, &qword_269268F28);
        if (v207[48] != 255)
        {
          *(void *)&long long v198 = v163;
          *((void *)&v198 + 1) = v162;
          uint64_t v199 = v161;
          uint64_t v200 = v160;
          uint64_t v201 = v159;
          uint64_t v202 = v158;
          char v203 = v157 & 1;
          unint64_t v196 = 11565;
          unint64_t v197 = 0xE200000000000000;
          sub_2478ED360(v163, v162, v161, v160, v159, v158, v157 & 1);
          sub_2479993D0();
          sub_2479993D0();
          uint64_t v111 = sub_2478FFA2C(v196, v197);
          unint64_t v113 = v112;
          uint64_t v114 = sub_2478FFA2C(0xD00000000000002FLL, 0x80000002479A7040);
          unint64_t v116 = v115;
          sub_247997FB0();
          swift_allocObject();
          sub_247997FA0();
          sub_24796D258();
          uint64_t v123 = sub_247997F90();
          unint64_t v125 = v124;
          swift_release();
          uint64_t v126 = swift_initStackObject();
          uint64_t v127 = v111;
          v128 = (void *)v126;
          *(void *)(v126 + 32) = v127;
          v129 = (uint64_t *)(v126 + 32);
          *(_OWORD *)(v126 + 16) = v180;
          *(void *)(v126 + 40) = v113;
          *(void *)(v126 + 48) = v114;
          *(void *)(v126 + 56) = v116;
          *(void *)(v126 + 64) = v123;
          *(void *)(v126 + 72) = v125;
          uint64_t v179 = v127;
          *(void *)&long long v180 = v113;
          sub_2478A06AC(v127, v113);
          uint64_t v171 = v114;
          unint64_t v173 = v116;
          sub_2478A06AC(v114, v116);
          uint64_t v130 = v123;
          unint64_t v131 = v125;
          sub_2478A06AC(v123, v125);
          v170 = v129;
          uint64_t v132 = *v129;
          unint64_t v133 = v128[5];
          unint64_t v196 = v132;
          unint64_t v197 = v133;
          sub_2478A06AC(v132, v133);
          sub_247999630();
          uint64_t v184 = 0;
          sub_2478A0704(v132, v133);
          uint64_t v134 = v128[6];
          unint64_t v135 = v128[7];
          unint64_t v196 = v134;
          unint64_t v197 = v135;
          sub_2478A06AC(v134, v135);
          uint64_t v136 = v184;
          sub_247999630();
          uint64_t v184 = v136;
          if (v136) {
            goto LABEL_31;
          }
          sub_2478A0704(v134, v135);
          uint64_t v134 = v128[8];
          unint64_t v135 = v128[9];
          unint64_t v196 = v134;
          unint64_t v197 = v135;
          sub_2478A06AC(v134, v135);
          uint64_t v137 = v184;
          sub_247999630();
          uint64_t v184 = v137;
          if (v137)
          {
LABEL_31:
            unint64_t v139 = v181;
            unint64_t v138 = v182;

            swift_bridgeObjectRelease();
            sub_2478A0704(v130, v131);
            sub_2478A0704(v171, v173);
            sub_2478A0704(v179, v180);
            sub_2478A0704(v183, v139);
            sub_2478A0704(v186, v138);
            sub_2478A0704(v187, v188);
            swift_bridgeObjectRelease();
            sub_24796D2AC(v164, (void (*)(void, void, void, void, void, void, void))sub_24796D67C);
            sub_2478A0704(0, v175);
            sub_2478A0704(v134, v135);
            id v140 = v189;
            objc_msgSend(v189, sel_closeFile);

            v190((uint64_t)v194, v195);
            return (*(uint64_t (**)(char *, uint64_t))(v178 + 8))(v176, v177);
          }
          sub_2478A0704(v134, v135);
          sub_2478A0704(v130, v125);
          sub_2478A0704(v171, v173);
          sub_2478A0704(v179, v180);
          swift_setDeallocating();
          swift_arrayDestroy();
          sub_24796D2AC(v164, (void (*)(void, void, void, void, void, void, void))sub_24796D67C);
          uint64_t v95 = v195;
          uint64_t v99 = v184;
          v103 = (void (*)(char *, uint64_t))v190;
          uint64_t v110 = v165;
        }
        *(void *)&long long v198 = 11565;
        *((void *)&v198 + 1) = 0xE200000000000000;
        sub_2479993D0();
        swift_bridgeObjectRelease();
        sub_2479993D0();
        uint64_t v146 = sub_2478FFA2C(v198, *((unint64_t *)&v198 + 1));
        unint64_t v148 = v147;
        *(void *)&long long v198 = v146;
        *((void *)&v198 + 1) = v147;
        id v149 = v189;
        sub_247999630();
        uint64_t v184 = v99;
        if (v99)
        {
          sub_2478A0704(0, v175);
          sub_2478A0704(v187, v188);
          sub_2478A0704(v186, v182);
          sub_2478A0704(v183, v181);

          sub_2478A0704(v146, v148);
          objc_msgSend(v149, sel_closeFile);

          v103(v194, v95);
          return (*(uint64_t (**)(char *, uint64_t))(v178 + 8))(v176, v177);
        }
        else
        {
          sub_2478A0704(0, v175);
          sub_2478A0704(v187, v188);
          sub_2478A0704(v186, v182);
          sub_2478A0704(v183, v181);

          sub_2478A0704(v146, v148);
          uint64_t v151 = v177;
          uint64_t v150 = v178;
          v152 = v176;
          (*(void (**)(uint64_t, char *, uint64_t))(v178 + 16))(v156, v176, v177);
          uint64_t v153 = v110;
          v154 = v194;
          isa(v153, (uint64_t)v194, v95);
          objc_msgSend(v149, sel_closeFile);

          v103(v154, v95);
          return (*(uint64_t (**)(char *, uint64_t))(v150 + 8))(v152, v151);
        }
    }
  }
}

void sub_24794B124(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v45 = a7;
  uint64_t v46 = a1;
  uint64_t v49 = a5;
  uint64_t v50 = a6;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F20);
  uint64_t v43 = *(void *)(v10 - 8);
  uint64_t v44 = v10;
  uint64_t v47 = *(void *)(v43 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v51 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_247998240();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  id v42 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v42 - v16;
  uint64_t v18 = a2[5];
  uint64_t v19 = a2[6];
  __swift_project_boxed_opaque_existential_1(a2 + 2, v18);
  id v48 = (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 24))(a3, a4, v18, v19);
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v20(v17, a4, v12);
  v20((char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v45, v12);
  uint64_t v21 = v43;
  uint64_t v22 = v44;
  (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v51, v46, v44);
  sub_247920218((uint64_t)a2, (uint64_t)v53);
  uint64_t v23 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v24 = (v23 + 16) & ~v23;
  uint64_t v25 = (v14 + v23 + v24) & ~v23;
  uint64_t v26 = v21;
  unint64_t v27 = (v14 + *(unsigned __int8 *)(v21 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v28 = (v47 + v27 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v29 = swift_allocObject();
  uint64_t v30 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
  v30(v29 + v24, v17, v12);
  v30(v29 + v25, v42, v12);
  (*(void (**)(unint64_t, char *, uint64_t))(v26 + 32))(v29 + v27, v51, v22);
  unint64_t v31 = v29 + v28;
  long long v32 = v53[1];
  *(_OWORD *)unint64_t v31 = v53[0];
  *(_OWORD *)(v31 + 16) = v32;
  *(_OWORD *)(v31 + 32) = v53[2];
  *(void *)(v31 + 48) = v54;
  uint64_t v33 = (objc_class *)type metadata accessor for DocumentRegistrationURLSessionDelegate();
  uint64_t v34 = (char *)objc_allocWithZone(v33);
  *(_OWORD *)&v34[OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_data] = xmmword_24799A8E0;
  uint64_t v35 = &v34[OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_fileSize];
  *(void *)uint64_t v35 = 0;
  v35[8] = 1;
  uint64_t v36 = &v34[OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_update];
  uint64_t v37 = v50;
  *(void *)uint64_t v36 = v49;
  *((void *)v36 + 1) = v37;
  uint64_t v38 = (uint64_t (**)(uint64_t, unint64_t, void *, void *))&v34[OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_completion];
  *uint64_t v38 = sub_24796D040;
  v38[1] = (uint64_t (*)(uint64_t, unint64_t, void *, void *))v29;
  unint64_t v39 = &v34[OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_fileDescriptor];
  *(_DWORD *)unint64_t v39 = 0;
  v39[4] = 1;
  *(void *)uint64_t v35 = 0;
  v35[8] = 1;
  v52.receiver = v34;
  v52.super_class = v33;
  id v40 = v48;
  swift_retain();
  id v41 = objc_msgSendSuper2(&v52, sel_init);
  objc_msgSend(v40, sel_setDelegate_, v41);

  objc_msgSend(v40, sel_resume);
}

uint64_t sub_24794B508(uint64_t a1, unint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  unint64_t v82 = a2;
  unint64_t v83 = a8;
  uint64_t v84 = a1;
  uint64_t v85 = a7;
  v81 = a3;
  v87[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268EE0);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v79 = (uint64_t)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v80 = (char *)&v74 - v13;
  uint64_t v14 = sub_247998240();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v74 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v74 - v19;
  id v21 = objc_msgSend(self, sel_defaultManager);
  uint64_t v22 = (void *)sub_2479981E0();
  v87[0] = 0;
  unsigned int v23 = objc_msgSend(v21, sel_removeItemAtURL_error_, v22, v87);

  if (!v23)
  {
    unint64_t v78 = v18;
    id v25 = v87[0];
    uint64_t v26 = (void *)sub_247998180();

    swift_willThrow();
    if (qword_269266A80 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_247999030();
    __swift_project_value_buffer(v27, (uint64_t)qword_26927FC08);
    unint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v77 = a6;
    v28(v20, a6, v14);
    id v29 = v26;
    id v30 = v26;
    unint64_t v31 = sub_247999010();
    os_log_type_t v32 = sub_247999690();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v74 = (void *)swift_slowAlloc();
      uint64_t v75 = (void *)swift_slowAlloc();
      v87[0] = v75;
      *(_DWORD *)uint64_t v33 = 136315394;
      uint64_t v76 = v15;
      sub_24796D17C((unint64_t *)&qword_269268270, MEMORY[0x263F06EA8]);
      uint64_t v34 = sub_247999B50();
      uint64_t v86 = sub_247918FF0(v34, v35, (uint64_t *)v87);
      sub_247999720();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v76 + 8))(v20, v14);
      *(_WORD *)(v33 + 12) = 2112;
      id v36 = v26;
      uint64_t v37 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v86 = v37;
      sub_247999720();
      uint64_t v38 = v74;
      *uint64_t v74 = v37;
      uint64_t v15 = v76;

      _os_log_impl(&dword_247896000, v31, v32, "Unable to delete temporary client file for: %s with error %@", (uint8_t *)v33, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269266F40);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v38, -1, -1);
      unint64_t v39 = v75;
      swift_arrayDestroy();
      MEMORY[0x24C564070](v39, -1, -1);
      MEMORY[0x24C564070](v33, -1, -1);

      a6 = v77;
      uint64_t v18 = v78;
      if (!a4) {
        goto LABEL_15;
      }
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v14);
      a6 = v77;
      uint64_t v18 = v78;
      if (!a4) {
        goto LABEL_15;
      }
    }
LABEL_8:
    id v40 = a4;
    if (qword_269266A80 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_247999030();
    __swift_project_value_buffer(v41, (uint64_t)qword_26927FC08);
    id v42 = a4;
    id v43 = a4;
    uint64_t v44 = sub_247999010();
    os_log_type_t v45 = sub_247999690();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v46 = 138412290;
      id v48 = a4;
      uint64_t v49 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v87[0] = v49;
      sub_247999720();
      *uint64_t v47 = v49;

      _os_log_impl(&dword_247896000, v44, v45, "Recieved error response: %@", v46, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269266F40);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v47, -1, -1);
      MEMORY[0x24C564070](v46, -1, -1);
    }
    else
    {
    }
    v87[0] = a4;
    goto LABEL_27;
  }
  id v24 = v87[0];
  if (a4) {
    goto LABEL_8;
  }
LABEL_15:
  unint64_t v50 = v82;
  if (v82 >> 60 == 15)
  {
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v51 = a6;
  objc_super v52 = v81;
  if (!v81)
  {
LABEL_34:
    __break(1u);
    JUMPOUT(0x24794BFECLL);
  }
  __swift_project_boxed_opaque_existential_1(v83 + 2, v83[5]);
  id v53 = v52;
  uint64_t v54 = sub_2478A0B90(v53, v84, v50);
  if (v54)
  {
    uint64_t v55 = (void *)v54;
    swift_willThrow();

    if (qword_269266A80 != -1) {
      swift_once();
    }
    uint64_t v56 = sub_247999030();
    __swift_project_value_buffer(v56, (uint64_t)qword_26927FC08);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, v51, v14);
    id v57 = v55;
    id v58 = v55;
    uint64_t v59 = sub_247999010();
    os_log_type_t v60 = sub_247999690();
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v61 = swift_slowAlloc();
      unint64_t v83 = (void *)swift_slowAlloc();
      uint64_t v84 = swift_slowAlloc();
      v87[0] = (id)v84;
      *(_DWORD *)uint64_t v61 = 136315394;
      sub_24796D17C((unint64_t *)&qword_269268270, MEMORY[0x263F06EA8]);
      uint64_t v62 = sub_247999B50();
      uint64_t v86 = sub_247918FF0(v62, v63, (uint64_t *)v87);
      sub_247999720();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
      *(_WORD *)(v61 + 12) = 2112;
      id v64 = v55;
      uint64_t v65 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v86 = v65;
      sub_247999720();
      uint64_t v66 = v83;
      *unint64_t v83 = v65;

      _os_log_impl(&dword_247896000, v59, v60, "Encountered error while uploading file: %s, error: %@", (uint8_t *)v61, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269266F40);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v66, -1, -1);
      uint64_t v67 = v84;
      swift_arrayDestroy();
      MEMORY[0x24C564070](v67, -1, -1);
      MEMORY[0x24C564070](v61, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    }
    v87[0] = v55;
LABEL_27:
    __swift_instantiateConcreteTypeFromMangledName(&qword_269268F20);
    return sub_2479994C0();
  }
  switch(v50 >> 62)
  {
    case 1uLL:
      uint64_t v71 = (int)v84;
      uint64_t v72 = v84 >> 32;
      goto LABEL_30;
    case 2uLL:
      uint64_t v71 = *(void *)(v84 + 16);
      uint64_t v72 = *(void *)(v84 + 24);
LABEL_30:
      if (v71 == v72) {
        goto LABEL_31;
      }
      goto LABEL_24;
    case 3uLL:
      goto LABEL_31;
    default:
      if ((v50 & 0xFF000000000000) != 0)
      {
LABEL_24:
        unint64_t v83 = (void *)v83[1];
        uint64_t v68 = _s22UploadDocumentResponseVMa(0);
        sub_24796D17C(&qword_2692684B0, (void (*)(uint64_t))_s22UploadDocumentResponseVMa);
        sub_247997EF0();

        uint64_t v69 = (uint64_t)v80;
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v80, 0, 1, v68);
      }
      else
      {
LABEL_31:
        uint64_t v73 = _s22UploadDocumentResponseVMa(0);
        uint64_t v69 = (uint64_t)v80;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56))(v80, 1, 1, v73);
      }
      sub_2478E6A48(v69, v79, &qword_269268EE0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269268F20);
      sub_2479994D0();
      uint64_t result = sub_2478A1A1C(v69, &qword_269268EE0);
      break;
  }
  return result;
}

id sub_24794BFFC(uint64_t a1)
{
  v11[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = (void *)sub_2479981E0();
  v11[0] = 0;
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fileHandleForWritingToURL_error_, v2, v11);

  id v4 = v11[0];
  if (v3)
  {
    uint64_t v5 = sub_247998240();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    id v7 = v4;
    v6(a1, v5);
  }
  else
  {
    id v8 = v11[0];
    sub_247998180();

    swift_willThrow();
    uint64_t v9 = sub_247998240();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  }
  return v3;
}

uint64_t sub_24794C154(uint64_t a1)
{
  uint64_t v33 = sub_247998D10();
  uint64_t v3 = *(void *)(v33 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v33);
  os_log_type_t v32 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v31 = (char *)v27 - v6;
  int64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (!v7) {
    return v8;
  }
  v27[0] = v1;
  uint64_t v34 = MEMORY[0x263F8EE78];
  sub_2479660B4(0, v7, 0);
  uint64_t result = sub_24796A2E0(a1);
  int64_t v10 = result;
  int v12 = v11;
  char v14 = v13 & 1;
  uint64_t v29 = a1;
  uint64_t v30 = a1 + 56;
  v27[2] = v3 + 32;
  v27[3] = v3 + 16;
  v27[1] = v3 + 8;
  uint64_t v28 = v3;
  while ((v10 & 0x8000000000000000) == 0 && v10 < 1 << *(unsigned char *)(a1 + 32))
  {
    if (((*(void *)(v30 + (((unint64_t)v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
      goto LABEL_15;
    }
    if (*(_DWORD *)(a1 + 36) != v12) {
      goto LABEL_16;
    }
    int64_t v15 = *(void *)(a1 + 48) + *(void *)(v3 + 72) * v10;
    uint64_t v16 = v31;
    uint64_t v17 = v33;
    (*(void (**)(char *, int64_t, uint64_t))(v3 + 16))(v31, v15, v33);
    uint64_t v18 = v32;
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v32, v16, v17);
    uint64_t v19 = sub_247998CF0();
    uint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v18, v17);
    uint64_t v8 = v34;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2479660B4(0, *(void *)(v8 + 16) + 1, 1);
      uint64_t v8 = v34;
    }
    unint64_t v23 = *(void *)(v8 + 16);
    unint64_t v22 = *(void *)(v8 + 24);
    if (v23 >= v22 >> 1)
    {
      sub_2479660B4(v22 > 1, v23 + 1, 1);
      uint64_t v8 = v34;
    }
    *(void *)(v8 + 16) = v23 + 1;
    uint64_t v24 = v8 + 16 * v23;
    *(void *)(v24 + 32) = v19;
    *(void *)(v24 + 40) = v21;
    a1 = v29;
    uint64_t result = sub_24796A380(v10, v12, v14 & 1, v29);
    int64_t v10 = result;
    int v12 = v25;
    char v14 = v26 & 1;
    --v7;
    uint64_t v3 = v28;
    if (!v7)
    {
      sub_24796B01C(result, v25, v26 & 1);
      return v8;
    }
  }
  __break(1u);
LABEL_15:
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_24794C41C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247999520();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_247999510();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2478A1A1C(a1, &qword_2692687D8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2479994B0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24794C5C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9 = sub_247999520();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) != 1)
  {
    sub_247999510();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2478A1A1C(a1, &qword_2692687D8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2479994B0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  *(void *)(v11 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  return swift_task_create();
}

uint64_t sub_24794C778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24794C5C8(a1, a2, a3, (uint64_t)&unk_26FBE4640, &qword_269268C30);
}

uint64_t sub_24794C7A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v36 = a4;
  int v43 = a3;
  uint64_t v42 = a2;
  uint64_t v44 = a5;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F58);
  uint64_t v34 = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v39 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v35 = v8;
  uint64_t v9 = sub_247999030();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  int v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_247998FB0();
  uint64_t v13 = *(void *)(v37 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v15 = MEMORY[0x270FA5388](v37);
  uint64_t v16 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v33 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v36, v9);
  uint64_t v38 = v18;
  sub_247998F90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268F60);
  uint64_t v19 = swift_allocBox();
  uint64_t v21 = v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F68);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = 0;
  uint64_t v24 = v18;
  uint64_t v25 = v37;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v24, v37);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v40, v5);
  unint64_t v26 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v27 = (v14 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = (*(unsigned __int8 *)(v6 + 80) + v27 + 17) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v19;
  *(void *)(v29 + 24) = v23;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v29 + v26, v16, v25);
  unint64_t v30 = v29 + v27;
  uint64_t v31 = v42;
  *(void *)unint64_t v30 = v41;
  *(void *)(v30 + 8) = v31;
  *(unsigned char *)(v30 + 16) = v43;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v29 + v28, v35, v34);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C58);
  sub_2479995F0();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v38, v25);
  swift_release();
  return swift_release();
}

uint64_t sub_24794CB7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v36 = a4;
  int v43 = a3;
  uint64_t v42 = a2;
  uint64_t v44 = a5;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D0);
  uint64_t v34 = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v39 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v35 = v8;
  uint64_t v9 = sub_247999030();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  int v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_247998FB0();
  uint64_t v13 = *(void *)(v38 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v15 = MEMORY[0x270FA5388](v38);
  uint64_t v16 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v33 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v36, v9);
  uint64_t v37 = v18;
  sub_247998F90();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268E20);
  uint64_t v19 = swift_allocBox();
  uint64_t v21 = v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268818);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = 0;
  uint64_t v24 = v18;
  uint64_t v25 = v38;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v24, v38);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v40, v5);
  unint64_t v26 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v27 = (v14 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = (*(unsigned __int8 *)(v6 + 80) + v27 + 17) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v19;
  *(void *)(v29 + 24) = v23;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v29 + v26, v16, v25);
  unint64_t v30 = v29 + v27;
  uint64_t v31 = v42;
  *(void *)unint64_t v30 = v41;
  *(void *)(v30 + 8) = v31;
  *(unsigned char *)(v30 + 16) = v43;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v29 + v28, v35, v34);
  sub_247998CD0();
  swift_retain();
  swift_retain();
  sub_2479995F0();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v37, v25);
  swift_release();
  return swift_release();
}

uint64_t sub_24794CF58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  *(void *)(v8 + 216) = a5;
  *(void *)(v8 + 224) = a8;
  *(unsigned char *)(v8 + 336) = a7;
  *(void *)(v8 + 200) = a3;
  *(void *)(v8 + 208) = a4;
  *(void *)(v8 + 192) = a1;
  uint64_t v9 = sub_247998FC0();
  *(void *)(v8 + 232) = v9;
  *(void *)(v8 + 240) = *(void *)(v9 - 8);
  *(void *)(v8 + 248) = swift_task_alloc();
  uint64_t v10 = sub_247998F80();
  *(void *)(v8 + 256) = v10;
  *(void *)(v8 + 264) = *(void *)(v10 - 8);
  *(void *)(v8 + 272) = swift_task_alloc();
  *(void *)(v8 + 280) = swift_task_alloc();
  *(void *)(v8 + 288) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268F60);
  *(void *)(v8 + 296) = swift_task_alloc();
  *(void *)(v8 + 304) = swift_task_alloc();
  *(void *)(v8 + 312) = swift_projectBox();
  return MEMORY[0x270FA2498](sub_24794D0EC, 0, 0);
}

uint64_t sub_24794D0EC()
{
  uint64_t v2 = *(void *)(v0 + 304);
  uint64_t v1 = *(void *)(v0 + 312);
  swift_beginAccess();
  sub_2478E6A48(v1, v2, &qword_269268F60);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F68);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  LODWORD(v1) = v5(v2, 1, v3);
  sub_2478A1A1C(v2, &qword_269268F60);
  if (v1 == 1)
  {
    sub_247998F70();
    uint64_t v6 = sub_247998FA0();
    os_signpost_type_t v7 = sub_2479996E0();
    uint64_t v8 = sub_2479996F0();
    uint64_t v29 = v4;
    unint64_t v30 = v5;
    if ((v8 & 1) == 0)
    {
LABEL_6:
      uint64_t v11 = *(void *)(v0 + 264);

      uint64_t v12 = *(void (**)(void, uint64_t, uint64_t))(v11 + 16);
LABEL_12:
      uint64_t v28 = *(void *)(v0 + 312);
      uint64_t v19 = *(void *)(v0 + 288);
      uint64_t v18 = *(void *)(v0 + 296);
      uint64_t v21 = *(void *)(v0 + 256);
      uint64_t v20 = *(void *)(v0 + 264);
      unint64_t v26 = (uint64_t *)(*(void *)(v0 + 200) + 16);
      v12(*(void *)(v0 + 280), v19, v21);
      sub_247998FF0();
      swift_allocObject();
      uint64_t v22 = sub_247998FE0();
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
      swift_beginAccess();
      *unint64_t v26 = v22;
      swift_release();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269268F58);
      sub_2479995D0();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v29 + 56))(v18, 0, 1, v3);
      swift_beginAccess();
      sub_2478E7964(v18, v28, &qword_269268F60);
      uint64_t v5 = v30;
      goto LABEL_13;
    }
    uint64_t v10 = *(const char **)(v0 + 216);
    if ((*(unsigned char *)(v0 + 336) & 1) == 0)
    {
      if (!v10)
      {
        __break(1u);
        goto LABEL_6;
      }
LABEL_11:
      uint64_t v13 = *(void *)(v0 + 280);
      uint64_t v14 = *(void *)(v0 + 264);
      uint64_t v27 = *(void *)(v0 + 256);
      uint64_t v15 = *(void (**)(uint64_t, void))(v14 + 16);
      v15(v13, *(void *)(v0 + 288));
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      os_signpost_id_t v17 = sub_247998F60();
      _os_signpost_emit_with_name_impl(&dword_247896000, v6, v7, v17, v10, "", v16, 2u);
      MEMORY[0x24C564070](v16, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v27);
      uint64_t v12 = (void (*)(void, uint64_t, uint64_t))v15;
      goto LABEL_12;
    }
    if ((unint64_t)v10 >> 32)
    {
      __break(1u);
    }
    else
    {
      if (v10 >> 11 == 27)
      {
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      if (v10 >> 16 <= 0x10)
      {
        uint64_t v10 = (const char *)(v0 + 184);
        goto LABEL_11;
      }
    }
    __break(1u);
    goto LABEL_19;
  }
LABEL_13:
  uint64_t v23 = *(void *)(v0 + 312);
  swift_beginAccess();
  uint64_t v8 = v5(v23, 1, v3);
  if (v8 == 1)
  {
LABEL_20:
    __break(1u);
    return MEMORY[0x270FA2100](v8, v9);
  }
  uint64_t v24 = (void *)swift_task_alloc();
  *(void *)(v0 + 320) = v24;
  *uint64_t v24 = v0;
  v24[1] = sub_24794D4C4;
  uint64_t v8 = v0 + 16;
  uint64_t v9 = v3;
  return MEMORY[0x270FA2100](v8, v9);
}

uint64_t sub_24794D4C4()
{
  *(void *)(*(void *)v1 + 328) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24794D8CC;
  }
  else
  {
    swift_endAccess();
    uint64_t v2 = sub_24794D5E0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24794D5E0()
{
  uint64_t v1 = (long long *)(v0 + 16);
  if (!*(void *)(v0 + 40))
  {
    uint64_t v2 = *(void *)(v0 + 200);
    sub_2478A1A1C((uint64_t)v1, &qword_269268F80);
    uint64_t result = swift_beginAccess();
    if (!*(void *)(v2 + 16))
    {
LABEL_24:
      __break(1u);
      return result;
    }
    swift_retain();
    uint64_t v4 = sub_247998FA0();
    sub_247998FD0();
    os_signpost_type_t v5 = sub_2479996D0();
    uint64_t result = sub_2479996F0();
    if ((result & 1) == 0)
    {
LABEL_8:
      os_signpost_type_t v7 = (uint64_t *)(v0 + 272);
      uint64_t v8 = *(void *)(v0 + 264);

      swift_release();
      uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
LABEL_17:
      uint64_t v19 = *(void *)(v0 + 192);
      v9(*v7, *(void *)(v0 + 256));
      *(void *)(v19 + 32) = 0;
      *(_OWORD *)uint64_t v19 = 0u;
      *(_OWORD *)(v19 + 16) = 0u;
      goto LABEL_18;
    }
    uint64_t v6 = *(const char **)(v0 + 216);
    os_signpost_type_t v22 = v5;
    if ((*(unsigned char *)(v0 + 336) & 1) == 0)
    {
      if (!v6)
      {
        __break(1u);
        goto LABEL_8;
      }
LABEL_13:
      uint64_t v11 = *(void *)(v0 + 240);
      uint64_t v10 = *(void *)(v0 + 248);
      uint64_t v12 = *(void *)(v0 + 232);
      swift_retain();
      sub_247999000();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v11 + 88))(v10, v12) == *MEMORY[0x263F90238])
      {
        uint64_t v13 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 240) + 8))(*(void *)(v0 + 248), *(void *)(v0 + 232));
        uint64_t v13 = "";
      }
      format = (char *)v13;
      os_signpost_type_t v7 = (uint64_t *)(v0 + 280);
      uint64_t v14 = *(void *)(v0 + 272);
      uint64_t v15 = *(void *)(v0 + 256);
      uint64_t v16 = *(void *)(v0 + 264);
      (*(void (**)(void, uint64_t, uint64_t))(v16 + 16))(*(void *)(v0 + 280), v14, v15);
      os_signpost_id_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_signpost_id_t v17 = 0;
      os_signpost_id_t v18 = sub_247998F60();
      _os_signpost_emit_with_name_impl(&dword_247896000, v4, v22, v18, v6, format, v17, 2u);
      MEMORY[0x24C564070](v17, -1, -1);

      swift_release();
      uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
      v9(v14, v15);
      goto LABEL_17;
    }
    if ((unint64_t)v6 >> 32)
    {
      __break(1u);
    }
    else
    {
      if (v6 >> 11 == 27)
      {
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      if (v6 >> 16 <= 0x10)
      {
        uint64_t v6 = (const char *)(v0 + 176);
        goto LABEL_13;
      }
    }
    __break(1u);
    goto LABEL_23;
  }
  sub_2478A2438(v1, *(void *)(v0 + 192));
LABEL_18:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
  return v20();
}

uint64_t sub_24794D8CC()
{
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24794D980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  *(void *)(v8 + 176) = a5;
  *(void *)(v8 + 184) = a8;
  *(unsigned char *)(v8 + 304) = a7;
  *(void *)(v8 + 160) = a3;
  *(void *)(v8 + 168) = a4;
  *(void *)(v8 + 152) = a1;
  uint64_t v9 = sub_247998FC0();
  *(void *)(v8 + 192) = v9;
  *(void *)(v8 + 200) = *(void *)(v9 - 8);
  *(void *)(v8 + 208) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268810);
  *(void *)(v8 + 216) = swift_task_alloc();
  uint64_t v10 = sub_247998F80();
  *(void *)(v8 + 224) = v10;
  *(void *)(v8 + 232) = *(void *)(v10 - 8);
  *(void *)(v8 + 240) = swift_task_alloc();
  *(void *)(v8 + 248) = swift_task_alloc();
  *(void *)(v8 + 256) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268E20);
  *(void *)(v8 + 264) = swift_task_alloc();
  *(void *)(v8 + 272) = swift_task_alloc();
  *(void *)(v8 + 280) = swift_projectBox();
  return MEMORY[0x270FA2498](sub_24794DB44, 0, 0);
}

uint64_t sub_24794DB44()
{
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v1 = *(void *)(v0 + 280);
  swift_beginAccess();
  sub_2478E6A48(v1, v2, &qword_269268E20);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268818);
  uint64_t v4 = *(void *)(v3 - 8);
  os_signpost_type_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  LODWORD(v1) = v5(v2, 1, v3);
  sub_2478A1A1C(v2, &qword_269268E20);
  if (v1 == 1)
  {
    sub_247998F70();
    uint64_t v6 = sub_247998FA0();
    os_signpost_type_t v7 = sub_2479996E0();
    uint64_t v8 = sub_2479996F0();
    uint64_t v29 = v4;
    unint64_t v30 = v5;
    if ((v8 & 1) == 0)
    {
LABEL_6:
      uint64_t v11 = *(void *)(v0 + 232);

      uint64_t v12 = *(void (**)(void, uint64_t, uint64_t))(v11 + 16);
LABEL_12:
      uint64_t v28 = *(void *)(v0 + 280);
      uint64_t v19 = *(void *)(v0 + 256);
      uint64_t v18 = *(void *)(v0 + 264);
      uint64_t v20 = *(void *)(v0 + 232);
      uint64_t v21 = *(void *)(v0 + 224);
      unint64_t v26 = (uint64_t *)(*(void *)(v0 + 160) + 16);
      v12(*(void *)(v0 + 240), v19, v21);
      sub_247998FF0();
      swift_allocObject();
      uint64_t v22 = sub_247998FE0();
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
      swift_beginAccess();
      *unint64_t v26 = v22;
      swift_release();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D0);
      sub_2479995D0();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v29 + 56))(v18, 0, 1, v3);
      swift_beginAccess();
      sub_2478E7964(v18, v28, &qword_269268E20);
      os_signpost_type_t v5 = v30;
      goto LABEL_13;
    }
    uint64_t v10 = *(const char **)(v0 + 176);
    if ((*(unsigned char *)(v0 + 304) & 1) == 0)
    {
      if (!v10)
      {
        __break(1u);
        goto LABEL_6;
      }
LABEL_11:
      uint64_t v14 = *(void *)(v0 + 232);
      uint64_t v13 = *(void *)(v0 + 240);
      uint64_t v27 = *(void *)(v0 + 224);
      uint64_t v15 = *(void (**)(uint64_t, void))(v14 + 16);
      v15(v13, *(void *)(v0 + 256));
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      os_signpost_id_t v17 = sub_247998F60();
      _os_signpost_emit_with_name_impl(&dword_247896000, v6, v7, v17, v10, "", v16, 2u);
      MEMORY[0x24C564070](v16, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v27);
      uint64_t v12 = (void (*)(void, uint64_t, uint64_t))v15;
      goto LABEL_12;
    }
    if ((unint64_t)v10 >> 32)
    {
      __break(1u);
    }
    else
    {
      if (v10 >> 11 == 27)
      {
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      if (v10 >> 16 <= 0x10)
      {
        uint64_t v10 = (const char *)(v0 + 144);
        goto LABEL_11;
      }
    }
    __break(1u);
    goto LABEL_19;
  }
LABEL_13:
  uint64_t v23 = *(void *)(v0 + 280);
  swift_beginAccess();
  uint64_t v8 = v5(v23, 1, v3);
  if (v8 == 1)
  {
LABEL_20:
    __break(1u);
    return MEMORY[0x270FA2100](v8, v9);
  }
  uint64_t v24 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v24;
  *uint64_t v24 = v0;
  v24[1] = sub_24794DF1C;
  uint64_t v8 = *(void *)(v0 + 216);
  uint64_t v9 = v3;
  return MEMORY[0x270FA2100](v8, v9);
}

uint64_t sub_24794DF1C()
{
  *(void *)(*(void *)v1 + 296) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24794E3D0;
  }
  else
  {
    swift_endAccess();
    uint64_t v2 = sub_24794E038;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24794E038()
{
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = sub_247998CD0();
  uint64_t v3 = *(void *)(v2 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v4 = *(void *)(v0 + 160);
    sub_2478A1A1C(v1, &qword_269268810);
    uint64_t result = swift_beginAccess();
    if (!*(void *)(v4 + 16))
    {
LABEL_25:
      __break(1u);
      return result;
    }
    swift_retain();
    uint64_t v6 = sub_247998FA0();
    sub_247998FD0();
    os_signpost_type_t v7 = sub_2479996D0();
    uint64_t result = sub_2479996F0();
    if ((result & 1) == 0)
    {
      uint64_t v10 = *(void *)(v0 + 232);

      swift_release();
      (*(void (**)(void, void))(v10 + 8))(*(void *)(v0 + 248), *(void *)(v0 + 224));
LABEL_17:
      uint64_t v9 = 1;
      goto LABEL_18;
    }
    unint64_t v8 = *(void *)(v0 + 176);
    os_signpost_type_t v24 = v7;
    if (*(unsigned char *)(v0 + 304))
    {
      if (!HIDWORD(v8))
      {
        if (v8 >> 11 == 27)
        {
LABEL_24:
          __break(1u);
          goto LABEL_25;
        }
        if (WORD1(v8) <= 0x10u)
        {
          uint64_t v21 = (const char *)(v0 + 136);
          goto LABEL_13;
        }
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
    }
    else
    {
      if (v8)
      {
        uint64_t v21 = *(const char **)(v0 + 176);
LABEL_13:
        uint64_t v12 = *(void *)(v0 + 200);
        uint64_t v11 = *(void *)(v0 + 208);
        uint64_t v13 = *(void *)(v0 + 192);
        swift_retain();
        sub_247999000();
        swift_release();
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 88))(v11, v13) == *MEMORY[0x263F90238])
        {
          uint64_t v14 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 192));
          uint64_t v14 = "";
        }
        uint64_t v22 = v14;
        uint64_t v23 = *(void *)(v0 + 248);
        uint64_t v16 = *(void *)(v0 + 224);
        uint64_t v15 = *(void *)(v0 + 232);
        (*(void (**)(void))(v15 + 16))(*(void *)(v0 + 240));
        os_signpost_id_t v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_signpost_id_t v17 = 0;
        os_signpost_id_t v18 = sub_247998F60();
        _os_signpost_emit_with_name_impl(&dword_247896000, v6, v24, v18, v21, v22, v17, 2u);
        MEMORY[0x24C564070](v17, -1, -1);

        swift_release();
        uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
        v19(v23, v16);
        v19(*(void *)(v0 + 240), *(void *)(v0 + 224));
        goto LABEL_17;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_23;
  }
  (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(*(void *)(v0 + 152), v1, v2);
  uint64_t v9 = 0;
LABEL_18:
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v3 + 56))(*(void *)(v0 + 152), v9, 1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
  return v20();
}

uint64_t sub_24794E3D0()
{
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24794E494@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v87 = a4;
  uint64_t v78 = a3;
  uint64_t v86 = a2;
  uint64_t v79 = a1;
  uint64_t v72 = a5;
  uint64_t v80 = sub_247998240();
  uint64_t v5 = *(void *)(v80 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v80);
  uint64_t v67 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v85 = (char *)&v67 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  uint64_t v77 = *(void *)(v9 - 8);
  uint64_t v76 = *(void *)(v77 + 64);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v75 = (uint64_t)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692687E0);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  os_signpost_id_t v17 = (char *)&v67 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692687E8);
  uint64_t v82 = *(void *)(v18 - 8);
  uint64_t v83 = v18;
  uint64_t v19 = *(void *)(v82 + 64);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v73 = (char *)&v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v67 - v21;
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D0);
  uint64_t v70 = *(void *)(v71 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v71);
  uint64_t v68 = (uint64_t)&v67 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  unint64_t v26 = (char *)&v67 - v25;
  sub_247998CD0();
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x263F8F680], v14);
  uint64_t v69 = v26;
  uint64_t v27 = v22;
  v81 = v22;
  sub_247999590();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  uint64_t v28 = sub_247999520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v13, 1, 1, v28);
  uint64_t v29 = v75;
  sub_2478E6A48(v78, v75, &qword_269268C10);
  uint64_t v30 = v82;
  uint64_t v31 = v83;
  (*(void (**)(char *, char *, uint64_t))(v82 + 16))((char *)&v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v27, v83);
  uint64_t v32 = sub_24796D17C(&qword_269268D90, (void (*)(uint64_t))_s7SessionCMa);
  unint64_t v33 = (*(unsigned __int8 *)(v77 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80);
  uint64_t v34 = v30;
  unint64_t v35 = (v76 + *(unsigned __int8 *)(v30 + 80) + v33) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v36 = (char *)swift_allocObject();
  uint64_t v37 = v84;
  *((void *)v36 + 2) = v84;
  *((void *)v36 + 3) = v32;
  uint64_t v38 = v79;
  *((void *)v36 + 4) = v37;
  *((void *)v36 + 5) = v38;
  unint64_t v39 = v87;
  *((void *)v36 + 6) = v86;
  *((void *)v36 + 7) = v39;
  sub_2478F5268(v29, (uint64_t)&v36[v33], &qword_269268C10);
  (*(void (**)(char *, char *, uint64_t))(v34 + 32))(&v36[v35], v73, v31);
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v40 = sub_24795818C((uint64_t)v74, (uint64_t)&unk_269268E18, (uint64_t)v36);
  swift_retain();
  sub_2479995A0();
  sub_2479293C8(v37 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_client + 16, (uint64_t)v88);
  if (v39 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v41 = sub_247999920();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v41 = *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v42 = MEMORY[0x263F8EE78];
  uint64_t v43 = v80;
  uint64_t v44 = v85;
  if (v41)
  {
    v89[0] = MEMORY[0x263F8EE78];
    sub_247966134(0, v41 & ~(v41 >> 63), 0);
    uint64_t v45 = v87;
    if (v41 < 0)
    {
      __break(1u);
      uint64_t result = swift_release();
      __break(1u);
      return result;
    }
    uint64_t v79 = v40;
    uint64_t v42 = v89[0];
    uint64_t v86 = v41;
    if ((v87 & 0xC000000000000001) != 0)
    {
      uint64_t v46 = 0;
      do
      {
        uint64_t v47 = MEMORY[0x24C563340](v46, v45);
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v44, v47 + OBJC_IVAR____TtC5Anvil19ImmutableFileHandle_url, v43);
        swift_unknownObjectRelease();
        v89[0] = v42;
        unint64_t v49 = *(void *)(v42 + 16);
        unint64_t v48 = *(void *)(v42 + 24);
        if (v49 >= v48 >> 1)
        {
          sub_247966134(v48 > 1, v49 + 1, 1);
          uint64_t v42 = v89[0];
        }
        ++v46;
        *(void *)(v42 + 16) = v49 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v42+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v49, v44, v43);
        uint64_t v45 = v87;
      }
      while (v86 != v46);
    }
    else
    {
      uint64_t v51 = (void *)(v87 + 32);
      objc_super v52 = *(char **)(v5 + 16);
      uint64_t v84 = v5 + 32;
      uint64_t v85 = v52;
      id v53 = v67;
      do
      {
        uint64_t v54 = v45;
        ((void (*)(char *, uint64_t, uint64_t))v85)(v53, *v51 + OBJC_IVAR____TtC5Anvil19ImmutableFileHandle_url, v43);
        v89[0] = v42;
        unint64_t v56 = *(void *)(v42 + 16);
        unint64_t v55 = *(void *)(v42 + 24);
        if (v56 >= v55 >> 1)
        {
          sub_247966134(v55 > 1, v56 + 1, 1);
          id v53 = v67;
          uint64_t v42 = v89[0];
        }
        *(void *)(v42 + 16) = v56 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v42+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v56, v53, v43);
        ++v51;
        --v41;
        uint64_t v45 = v54;
      }
      while (v41);
    }
    uint64_t v50 = v72;
    uint64_t v41 = v86;
  }
  else
  {
    uint64_t v50 = v72;
    uint64_t v45 = v87;
  }
  if (v41 >= *(void *)(v42 + 16)) {
    uint64_t v57 = *(void *)(v42 + 16);
  }
  else {
    uint64_t v57 = v41;
  }
  if (v57)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269268490);
    uint64_t v58 = sub_247999950();
  }
  else
  {
    uint64_t v58 = MEMORY[0x263F8EE80];
  }
  v89[0] = v58;
  swift_bridgeObjectRetain();
  sub_247965B34(v42, v45, 1, v89);
  uint64_t v59 = v89[0];
  sub_2478A2438(v88, (uint64_t)v89);
  v89[5] = v59;
  uint64_t v60 = v68;
  uint64_t v61 = v69;
  sub_24792B794((uint64_t)v89, v68);
  sub_24792D790((uint64_t)v89);
  if (qword_269266A88 != -1) {
    swift_once();
  }
  uint64_t v62 = sub_247999030();
  uint64_t v63 = __swift_project_value_buffer(v62, (uint64_t)qword_26927FC20);
  sub_24794CB7C((uint64_t)"RegisterDocumentsStream", 23, 2, v63, v50);
  swift_release();
  id v64 = *(void (**)(uint64_t, uint64_t))(v70 + 8);
  uint64_t v65 = v71;
  v64(v60, v71);
  (*(void (**)(char *, uint64_t))(v82 + 8))(v81, v83);
  return ((uint64_t (*)(char *, uint64_t))v64)(v61, v65);
}

uint64_t sub_24794EE44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[8] = a8;
  v8[9] = v14;
  v8[6] = a6;
  v8[7] = a7;
  v8[4] = a4;
  v8[5] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  v8[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269266F78);
  v8[11] = swift_task_alloc();
  uint64_t v10 = sub_247998190();
  v8[12] = v10;
  v8[13] = *(void *)(v10 - 8);
  v8[14] = swift_task_alloc();
  uint64_t v11 = sub_247998240();
  v8[15] = v11;
  v8[16] = *(void *)(v11 - 8);
  v8[17] = swift_task_alloc();
  v8[18] = _s21CreateSessionResponseVMa(0);
  v8[19] = swift_task_alloc();
  v8[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  v8[21] = swift_task_alloc();
  v8[22] = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C30);
  v8[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24794F078, a4, 0);
}

uint64_t sub_24794F078()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[4];
  uint64_t v3 = OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_authenticator;
  v0[24] = OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_provider;
  v0[25] = v3;
  uint64_t v4 = sub_2479037AC();
  uint64_t v6 = v5;
  v0[26] = v5;
  uint64_t v7 = *(void *)(v2 + 144);
  v0[27] = v7;
  uint64_t v8 = *(void *)(v2 + 152);
  v0[28] = v8;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[29] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_24794F174;
  uint64_t v10 = v0[5];
  return sub_24796F0F0(v4, v6, v7, v8, v10, v1);
}

uint64_t sub_24794F174(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 32);
  *(void *)(*(void *)v1 + 240) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24794F2A8, v2, 0);
}

uint64_t sub_24794F2A8()
{
  uint64_t v1 = v0[4];
  v0[31] = *(void *)(v1 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_registry);
  v0[32] = *(void *)(v1 + 112);
  v0[33] = *(void *)(v1 + 120);
  return MEMORY[0x270FA2498](sub_24794F2E8, 0, 0);
}

uint64_t sub_24794F2E8()
{
  uint64_t v2 = v0[32];
  uint64_t v1 = v0[33];
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[21];
  uint64_t v5 = sub_247999520();
  v0[34] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v0[35] = v7;
  v0[36] = (v6 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v7(v4, 1, 1, v5);
  v0[37] = sub_247999500();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v8 = sub_2479994F0();
  uint64_t v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v2;
  v9[5] = v1;
  v9[6] = v3;
  uint64_t v11 = sub_24794C5C8(v4, (uint64_t)&unk_269268E48, (uint64_t)v9, (uint64_t)&unk_26FBE4640, &qword_269268C30);
  v0[38] = v11;
  uint64_t v12 = (void *)swift_task_alloc();
  v0[39] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_24794F48C;
  uint64_t v14 = v0[22];
  uint64_t v13 = v0[23];
  return MEMORY[0x270FA1FD0](v13, v11, v14);
}

uint64_t sub_24794F48C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24794F5B8, v1, 0);
}

uint64_t sub_24794F5B8()
{
  uint64_t v1 = *(void *)(v0 + 184);
  uint64_t v2 = type metadata accessor for SessionRegistry.SessionInfo(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    unint64_t v3 = *(void *)(v0 + 56);
    sub_2478A1A1C(v1, &qword_269268C30);
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_247999920();
      swift_bridgeObjectRelease();
      if (v12 > 1) {
        goto LABEL_4;
      }
    }
    else if (*(uint64_t *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1)
    {
LABEL_4:
      uint64_t v5 = *(void *)(v0 + 104);
      uint64_t v4 = *(void *)(v0 + 112);
      uint64_t v6 = *(void *)(v0 + 96);
      *(void *)(v0 + 16) = 0x6E6F69737365732FLL;
      *(void *)(v0 + 24) = 0xE900000000000073;
      (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, *MEMORY[0x263F06E50], v6);
      sub_2478A3014();
      sub_247998230();
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
      swift_bridgeObjectRelease();
      uint64_t v21 = (uint64_t (*)(uint64_t, uint64_t, char, char, uint64_t, uint64_t, char))((char *)&dword_2692684A0
                                                                                         + dword_2692684A0);
      uint64_t v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 320) = v7;
      void *v7 = v0;
      v7[1] = sub_24794F960;
      uint64_t v8 = *(void *)(v0 + 240);
      uint64_t v9 = *(void *)(v0 + 152);
      uint64_t v10 = *(void *)(v0 + 136);
      return v21(v9, v10, 1, 0, v8, 0, 1);
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_24796D2F0(v1, type metadata accessor for SessionRegistry.SessionInfo);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(v0 + 64);
  uint64_t v13 = *(void *)(v0 + 72);
  uint64_t v15 = *(void *)(v0 + 56);
  long long v20 = *(_OWORD *)(v0 + 40);
  long long v22 = *(_OWORD *)(v0 + 216);
  uint64_t v16 = *(void *)(v0 + 32);
  uint64_t v17 = v16 + *(void *)(v0 + 200);
  sub_24796D17C(&qword_269268D90, (void (*)(uint64_t))_s7SessionCMa);
  uint64_t v18 = swift_task_alloc();
  *(void *)(v0 + 336) = v18;
  *(void *)(v18 + 16) = v15;
  *(void *)(v18 + 24) = v13;
  *(void *)(v18 + 32) = v16;
  *(void *)(v18 + 40) = v17;
  *(_OWORD *)(v18 + 48) = v22;
  *(_OWORD *)(v18 + 64) = v20;
  *(void *)(v18 + 80) = v14;
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 344) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_2479500A0;
  return MEMORY[0x270FA2158]();
}

uint64_t sub_24794F960()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 128);
  *(void *)(*(void *)v1 + 328) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = sub_24794FF50;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = v2[17];
    uint64_t v7 = v2[15];
    uint64_t v8 = v2[4];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v7);
    uint64_t v4 = sub_24794FAD8;
    uint64_t v5 = v8;
  }
  return MEMORY[0x270FA2498](v4, v5, 0);
}

uint64_t sub_24794FAD8()
{
  uint64_t v1 = *(uint64_t **)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 32);
  sub_24796CCB4(*(void *)(v0 + 152), (uint64_t)v1, _s21CreateSessionResponseVMa);
  uint64_t v43 = *(void *)(v3 + 128);
  uint64_t v40 = *(void *)(v3 + 136);
  uint64_t v41 = *v1;
  uint64_t v4 = v1[1];
  swift_bridgeObjectRetain();
  OpenAIAuthenticator.credentials.getter(v2);
  uint64_t v5 = type metadata accessor for OpenAIAuthenticator.Credentials(0);
  int v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v2, 1, v5);
  uint64_t v7 = *(void *)(v0 + 88);
  if (v6 == 1)
  {
    sub_2478A1A1C(*(void *)(v0 + 88), &qword_269266F78);
    uint64_t v39 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v39 = OpenAIAuthenticator.Credentials.credentialsID.getter();
    uint64_t v8 = v9;
    sub_24796D2F0(v7, type metadata accessor for OpenAIAuthenticator.Credentials);
  }
  uint64_t v10 = *(void *)(v0 + 80);
  sub_2478E6A48(*(void *)(v0 + 64), v10, &qword_269268C10);
  uint64_t v11 = sub_247998B20();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11);
  uint64_t v14 = *(void *)(v0 + 80);
  if (v13 == 1)
  {
    sub_2478A1A1C(*(void *)(v0 + 80), &qword_269268C10);
    int v37 = 0;
  }
  else
  {
    int v37 = sub_247998B10();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v14, v11);
  }
  uint64_t v38 = *(void *)(v0 + 160);
  uint64_t v15 = (uint64_t *)(v38 + *(int *)(*(void *)(v0 + 144) + 32));
  uint64_t v16 = *(unsigned __int8 *)v15;
  double v17 = 0.0;
  if (v16 != 2) {
    double v17 = (double)v15[1];
  }
  BOOL v35 = v13 == 1;
  BOOL v36 = v16 == 2;
  uint64_t v18 = *(void *)(v0 + 264);
  uint64_t v34 = *(void *)(v0 + 256);
  uint64_t v19 = *(void *)(v0 + 248);
  uint64_t v21 = *(void *)(v0 + 216);
  uint64_t v20 = *(void *)(v0 + 224);
  uint64_t v22 = *(void *)(v0 + 168);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0 + 280))(v22, 1, 1, *(void *)(v0 + 272));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_2479994F0();
  uint64_t v24 = swift_allocObject();
  uint64_t v25 = MEMORY[0x263F8F500];
  *(void *)(v24 + 16) = v23;
  *(void *)(v24 + 24) = v25;
  *(void *)(v24 + 32) = v43;
  *(void *)(v24 + 40) = v40;
  *(void *)(v24 + 48) = v41;
  *(void *)(v24 + 56) = v4;
  *(void *)(v24 + 64) = v34;
  *(void *)(v24 + 72) = v18;
  *(void *)(v24 + 80) = v19;
  *(void *)(v24 + 88) = v21;
  *(void *)(v24 + 96) = v20;
  *(void *)(v24 + 104) = v39;
  *(void *)(v24 + 112) = v8;
  *(_DWORD *)(v24 + 120) = v37;
  *(unsigned char *)(v24 + 124) = v35;
  *(double *)(v24 + 128) = v17;
  *(unsigned char *)(v24 + 136) = v36;
  sub_24794C41C(v22, (uint64_t)&unk_269268E60, v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_24796D2F0(v38, _s21CreateSessionResponseVMa);
  uint64_t v27 = *(void *)(v0 + 64);
  uint64_t v26 = *(void *)(v0 + 72);
  uint64_t v28 = *(void *)(v0 + 56);
  long long v42 = *(_OWORD *)(v0 + 40);
  long long v44 = *(_OWORD *)(v0 + 216);
  uint64_t v29 = *(void *)(v0 + 32);
  uint64_t v30 = v29 + *(void *)(v0 + 200);
  sub_24796D17C(&qword_269268D90, (void (*)(uint64_t))_s7SessionCMa);
  uint64_t v31 = swift_task_alloc();
  *(void *)(v0 + 336) = v31;
  *(void *)(v31 + 16) = v28;
  *(void *)(v31 + 24) = v26;
  *(void *)(v31 + 32) = v29;
  *(void *)(v31 + 40) = v30;
  *(_OWORD *)(v31 + 48) = v44;
  *(_OWORD *)(v31 + 64) = v42;
  *(void *)(v31 + 80) = v27;
  uint64_t v32 = (void *)swift_task_alloc();
  *(void *)(v0 + 344) = v32;
  *uint64_t v32 = v0;
  v32[1] = sub_2479500A0;
  return MEMORY[0x270FA2158]();
}

uint64_t sub_24794FF50()
{
  uint64_t v1 = v0[4];
  (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24794FFD8, v1, 0);
}

uint64_t sub_24794FFD8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2479500A0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 32);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2479501CC, v1, 0);
}

uint64_t sub_2479501CC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247950294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 1336) = v19;
  *(_OWORD *)(v8 + 1320) = v18;
  *(void *)(v8 + 1312) = a8;
  *(void *)(v8 + 1304) = a7;
  *(void *)(v8 + 1296) = a6;
  *(void *)(v8 + 1288) = a5;
  *(void *)(v8 + 1280) = a4;
  *(void *)(v8 + 1272) = a3;
  *(void *)(v8 + 1264) = a2;
  sub_247998CD0();
  *(void *)(v8 + 1344) = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268808);
  *(void *)(v8 + 1352) = v10;
  *(void *)(v8 + 1360) = *(void *)(v10 - 8);
  *(void *)(v8 + 1368) = swift_task_alloc();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692687E8);
  *(void *)(v8 + 1376) = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  *(void *)(v8 + 1384) = v12;
  *(void *)(v8 + 1392) = *(void *)(v12 + 64);
  *(void *)(v8 + 1400) = swift_task_alloc();
  uint64_t v13 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268C10) - 8);
  *(void *)(v8 + 1408) = v13;
  *(void *)(v8 + 1416) = *(void *)(v13 + 64);
  *(void *)(v8 + 1424) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  *(void *)(v8 + 1432) = swift_task_alloc();
  *(void *)(v8 + 1440) = swift_task_alloc();
  *(void *)(v8 + 1448) = swift_task_alloc();
  *(void *)(v8 + 1456) = swift_task_alloc();
  uint64_t v14 = sub_247998240();
  *(void *)(v8 + 1464) = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  *(void *)(v8 + 1472) = v15;
  *(void *)(v8 + 1480) = *(void *)(v15 + 64);
  *(void *)(v8 + 1488) = swift_task_alloc();
  *(void *)(v8 + 1496) = swift_task_alloc();
  *(void *)(v8 + 1504) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247950590, a5, 0);
}

uint64_t sub_247950590()
{
  uint64_t v141 = v0;
  uint64_t v140 = *MEMORY[0x263EF8340];
  unint64_t v1 = *(void *)(v0 + 1272);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_247999920();
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      if (v2 < 1) {
        __break(1u);
      }
      uint64_t v3 = 0;
      __src = (void *)(v0 + 512);
      v122 = (void *)(v0 + 16);
      uint64_t v132 = (stat *)(v0 + 1008);
      uint64_t v130 = *(void *)(v0 + 1288) + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_provider;
      uint64_t v4 = *(void *)(v0 + 1472);
      uint64_t v119 = *(void *)(v0 + 1408);
      unint64_t v134 = v1 & 0xC000000000000001;
      uint64_t v131 = *(void *)(v0 + 1272) + 32;
      uint64_t v137 = (void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
      unint64_t v133 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 1360) + 8);
      uint64_t v136 = (void (**)(uint64_t, uint64_t))(v4 + 8);
      uint64_t v120 = v4;
      uint64_t v129 = *(void *)(v0 + 1384);
      uint64_t v86 = *(void *)(v0 + 1480) + 7;
      uint64_t v135 = v2;
      do
      {
        if (v134)
        {
          uint64_t v9 = MEMORY[0x24C563340](v3, *(void *)(v0 + 1272));
        }
        else
        {
          uint64_t v9 = *(void *)(v131 + 8 * v3);
          swift_retain();
        }
        uint64_t v10 = *v137;
        (*v137)(*(void *)(v0 + 1504), v9 + OBJC_IVAR____TtC5Anvil19ImmutableFileHandle_url, *(void *)(v0 + 1464));
        int v11 = *(_DWORD *)(v9 + 16);
        if (v11 < 0)
        {
          if (qword_269266A80 != -1) {
            swift_once();
          }
          uint64_t v22 = *(void *)(v0 + 1504);
          uint64_t v23 = *(void *)(v0 + 1488);
          uint64_t v24 = *(void *)(v0 + 1464);
          uint64_t v25 = sub_247999030();
          __swift_project_value_buffer(v25, (uint64_t)qword_26927FC08);
          v10(v23, v22, v24);
          uint64_t v26 = sub_247999010();
          os_log_type_t v27 = sub_247999690();
          BOOL v28 = os_log_type_enabled(v26, v27);
          uint64_t v29 = *(void *)(v0 + 1488);
          uint64_t v30 = *(void *)(v0 + 1464);
          if (v28)
          {
            uint64_t v31 = swift_slowAlloc();
            uint64_t v32 = swift_slowAlloc();
            uint64_t v138 = v32;
            *(_DWORD *)uint64_t v31 = 136315138;
            sub_24796D17C((unint64_t *)&qword_269268270, MEMORY[0x263F06EA8]);
            uint64_t v33 = sub_247999B50();
            *(void *)(v31 + 4) = sub_247918FF0(v33, v34, &v138);
            swift_bridgeObjectRelease();
            uint64_t v5 = *v136;
            (*v136)(v29, v30);
            _os_log_impl(&dword_247896000, v26, v27, "Invalid file descriptor provided: %s", (uint8_t *)v31, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24C564070](v32, -1, -1);
            MEMORY[0x24C564070](v31, -1, -1);
          }
          else
          {
            uint64_t v5 = *v136;
            (*v136)(*(void *)(v0 + 1488), *(void *)(v0 + 1464));
          }

          uint64_t v6 = v135;
          uint64_t v7 = *(void *)(v0 + 1368);
          uint64_t v8 = *(void *)(v0 + 1352);
          sub_247998C80();
          sub_2479995B0();
          swift_release();
          (*v133)(v7, v8);
          goto LABEL_7;
        }
        *(void *)&v132->st_dev = 0;
        *(void *)(v0 + 1016) = 0;
        *(_DWORD *)(v0 + 1032) = 0;
        *(void *)(v0 + 1024) = 0;
        *(_OWORD *)(v0 + 1040) = 0u;
        *(_OWORD *)(v0 + 1056) = 0u;
        *(_OWORD *)(v0 + 1072) = 0u;
        *(_OWORD *)(v0 + 1088) = 0u;
        *(_OWORD *)(v0 + 1104) = 0u;
        *(_OWORD *)(v0 + 1120) = 0u;
        *(_OWORD *)(v0 + 1136) = 0u;
        if (fstat(v11, v132))
        {
          if (qword_269266A70 != -1) {
            swift_once();
          }
          uint64_t v12 = sub_247999030();
          __swift_project_value_buffer(v12, (uint64_t)qword_26927FBD8);
          uint64_t v13 = sub_247999010();
          os_log_type_t v14 = sub_247999690();
          if (os_log_type_enabled(v13, v14))
          {
            uint64_t v15 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v15 = 0;
            _os_log_impl(&dword_247896000, v13, v14, "Unable to access file size", v15, 2u);
            MEMORY[0x24C564070](v15, -1, -1);
          }
        }
        else
        {
          uint64_t v35 = *(void *)(v0 + 1104);
          if (v35 > 0)
          {
            uint64_t v36 = type metadata accessor for BlackPowder();
            uint64_t v37 = v130 + *(int *)(v36 + 20);
            if ((*(unsigned char *)(v37 + 232) & 1) != 0
              && ((*(void (**)(uint64_t *__return_ptr, void))(v37 + 216))(&v138, *(void *)(v37 + 192)),
                  v139 != 1))
            {
              int64_t v38 = v138;
            }
            else
            {
              int64_t v38 = *(void *)(v130 + *(int *)(v36 + 24));
            }
            if (v38 >= (uint64_t)(v35 / 0xF4240uLL))
            {
              if (qword_269266AA0 != -1) {
                swift_once();
              }
              uint64_t v57 = sub_247999030();
              __swift_project_value_buffer(v57, (uint64_t)qword_26927FC68);
              uint64_t v58 = sub_247999010();
              os_log_type_t v59 = sub_247999670();
              if (os_log_type_enabled(v58, v59))
              {
                uint64_t v60 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)uint64_t v60 = 0;
                _os_log_impl(&dword_247896000, v58, v59, "Using direct upload", v60, 2u);
                MEMORY[0x24C564070](v60, -1, -1);
              }
              uint64_t v92 = *(void *)(v0 + 1504);
              uint64_t v61 = *(void *)(v0 + 1496);
              uint64_t v105 = *(void *)(v0 + 1480);
              uint64_t v62 = *(void *)(v0 + 1464);
              uint64_t v63 = *(void *)(v0 + 1440);
              uint64_t v118 = *(void *)(v0 + 1432);
              uint64_t v124 = *(void *)(v0 + 1424);
              uint64_t v64 = *(void *)(v0 + 1400);
              uint64_t v100 = v64;
              uint64_t v102 = *(void *)(v0 + 1392);
              uint64_t v65 = *(void *)(v0 + 1376);
              uint64_t v98 = v65;
              uint64_t v95 = *(void *)(v0 + 1336);
              uint64_t v112 = *(void *)(v0 + 1320);
              uint64_t v114 = *(void *)(v0 + 1328);
              uint64_t v128 = *(void *)(v0 + 1312);
              uint64_t v109 = *(void *)(v0 + 1304);
              uint64_t v88 = *(void *)(v0 + 1296);
              uint64_t v126 = *(void *)(v0 + 1288);
              uint64_t v90 = *(void *)(v0 + 1280);

              uint64_t v107 = sub_247999520();
              uint64_t v111 = *(void *)(v107 - 8);
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v111 + 56))(v63, 1, 1, v107);
              sub_2479030DC(v88, (uint64_t)v122);
              v10(v61, v92, v62);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v129 + 16))(v64, v90, v65);
              sub_2478E6A48(v95, v124, &qword_269268C10);
              unint64_t v66 = (*(unsigned __int8 *)(v120 + 80) + 576) & ~(unint64_t)*(unsigned __int8 *)(v120 + 80);
              unint64_t v67 = (v105 + *(unsigned __int8 *)(v129 + 80) + v66) & ~(unint64_t)*(unsigned __int8 *)(v129 + 80);
              unint64_t v68 = (v102 + *(unsigned __int8 *)(v119 + 80) + v67) & ~(unint64_t)*(unsigned __int8 *)(v119 + 80);
              uint64_t v69 = (char *)swift_allocObject();
              *((void *)v69 + 2) = 0;
              *((void *)v69 + 3) = 0;
              *((void *)v69 + 4) = v126;
              memcpy(v69 + 40, v122, 0x1E9uLL);
              *((void *)v69 + 67) = v109;
              *((void *)v69 + 68) = v128;
              *((void *)v69 + 69) = v112;
              *((void *)v69 + 70) = v114;
              *((void *)v69 + 71) = v9;
              (*(void (**)(char *, uint64_t, uint64_t))(v120 + 32))(&v69[v66], v61, v62);
              (*(void (**)(char *, uint64_t, uint64_t))(v129 + 32))(&v69[v67], v100, v98);
              sub_2478F5268(v124, (uint64_t)&v69[v68], &qword_269268C10);
              sub_2478E6A48(v63, v118, &qword_2692687D8);
              LODWORD(v67) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v111 + 48))(v118, 1, v107);
              swift_retain();
              swift_retain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              uint64_t v70 = *(void *)(v0 + 1432);
              if (v67 == 1)
              {
                sub_2478A1A1C(*(void *)(v0 + 1432), &qword_2692687D8);
              }
              else
              {
                sub_247999510();
                (*(void (**)(uint64_t, uint64_t))(v111 + 8))(v70, v107);
              }
              if (*((void *)v69 + 2))
              {
                swift_getObjectType();
                swift_unknownObjectRetain();
                uint64_t v74 = sub_2479994B0();
                uint64_t v76 = v75;
                swift_unknownObjectRelease();
              }
              else
              {
                uint64_t v74 = 0;
                uint64_t v76 = 0;
              }
              uint64_t v81 = **(void **)(v0 + 1264);
              uint64_t v82 = swift_allocObject();
              *(void *)(v82 + 16) = &unk_269268E70;
              *(void *)(v82 + 24) = v69;
              uint64_t v83 = v76 | v74;
              if (v76 | v74)
              {
                uint64_t v83 = v0 + 1152;
                *(void *)(v0 + 1152) = 0;
                *(void *)(v0 + 1160) = 0;
                *(void *)(v0 + 1168) = v74;
                *(void *)(v0 + 1176) = v76;
              }
              uint64_t v80 = *(void *)(v0 + 1440);
              *(void *)(v0 + 1216) = 1;
              *(void *)(v0 + 1224) = v83;
              *(void *)(v0 + 1232) = v81;
            }
            else
            {
              uint64_t v123 = v35;
              if (qword_269266AA0 != -1) {
                swift_once();
              }
              uint64_t v39 = sub_247999030();
              __swift_project_value_buffer(v39, (uint64_t)qword_26927FC68);
              uint64_t v40 = sub_247999010();
              os_log_type_t v41 = sub_247999670();
              if (os_log_type_enabled(v40, v41))
              {
                long long v42 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)long long v42 = 0;
                _os_log_impl(&dword_247896000, v40, v41, "Using two phase upload", v42, 2u);
                MEMORY[0x24C564070](v42, -1, -1);
              }
              uint64_t v91 = *(void *)(v0 + 1504);
              uint64_t v43 = *(void *)(v0 + 1496);
              uint64_t v44 = *(void *)(v0 + 1464);
              uint64_t v96 = v43;
              uint64_t v45 = *(void *)(v0 + 1456);
              uint64_t v108 = v45;
              uint64_t v117 = *(void *)(v0 + 1448);
              uint64_t v46 = *(void *)(v0 + 1424);
              uint64_t v97 = v46;
              uint64_t v103 = *(void *)(v0 + 1416);
              uint64_t v125 = *(void *)(v0 + 1400);
              uint64_t v47 = *(void *)(v0 + 1376);
              uint64_t v99 = v47;
              uint64_t v115 = *(void *)(v0 + 1320);
              uint64_t v116 = *(void *)(v0 + 1328);
              uint64_t v113 = *(void *)(v0 + 1312);
              uint64_t v110 = *(void *)(v0 + 1304);
              uint64_t v87 = *(void *)(v0 + 1296);
              uint64_t v89 = *(void *)(v0 + 1336);
              uint64_t v127 = *(void *)(v0 + 1288);
              uint64_t v93 = *(void *)(v0 + 1280);

              uint64_t v106 = sub_247999520();
              uint64_t v101 = *(void *)(v106 - 8);
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v101 + 56))(v45, 1, 1, v106);
              v10(v43, v91, v44);
              sub_2479030DC(v87, (uint64_t)__src);
              sub_2478E6A48(v89, v46, &qword_269268C10);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v129 + 16))(v125, v93, v47);
              unint64_t v48 = (*(unsigned __int8 *)(v120 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v120 + 80);
              unint64_t v49 = (v86 + v48) & 0xFFFFFFFFFFFFFFF8;
              unint64_t v50 = (v49 + 15) & 0xFFFFFFFFFFFFFFF8;
              unint64_t v51 = (v50 + 511) & 0xFFFFFFFFFFFFFFF8;
              unint64_t v94 = (v51 + 23) & 0xFFFFFFFFFFFFFFF8;
              unint64_t v52 = (*(unsigned __int8 *)(v119 + 80) + v94 + 16) & ~(unint64_t)*(unsigned __int8 *)(v119 + 80);
              unint64_t v104 = (v103 + *(unsigned __int8 *)(v129 + 80) + v52) & ~(unint64_t)*(unsigned __int8 *)(v129 + 80);
              id v53 = (char *)swift_allocObject();
              *((void *)v53 + 2) = 0;
              *((void *)v53 + 3) = 0;
              *((void *)v53 + 4) = v127;
              (*(void (**)(char *, uint64_t, uint64_t))(v120 + 32))(&v53[v48], v96, v44);
              *(void *)&v53[v49] = v123;
              *(void *)&v53[v50] = v9;
              memcpy(&v53[(v50 + 15) & 0xFFFFFFFFFFFFFFF8], __src, 0x1E9uLL);
              uint64_t v54 = &v53[v51];
              *(void *)uint64_t v54 = v110;
              *((void *)v54 + 1) = v113;
              unint64_t v55 = &v53[v94];
              *(void *)unint64_t v55 = v115;
              *((void *)v55 + 1) = v116;
              sub_2478F5268(v97, (uint64_t)&v53[v52], &qword_269268C10);
              (*(void (**)(char *, uint64_t, uint64_t))(v129 + 32))(&v53[v104], v125, v99);
              sub_2478E6A48(v108, v117, &qword_2692687D8);
              LODWORD(v49) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v101 + 48))(v117, 1, v106);
              swift_retain();
              swift_retain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              uint64_t v56 = *(void *)(v0 + 1448);
              if (v49 == 1)
              {
                sub_2478A1A1C(*(void *)(v0 + 1448), &qword_2692687D8);
              }
              else
              {
                sub_247999510();
                (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v56, v106);
              }
              if (*((void *)v53 + 2))
              {
                swift_getObjectType();
                swift_unknownObjectRetain();
                uint64_t v71 = sub_2479994B0();
                uint64_t v73 = v72;
                swift_unknownObjectRelease();
              }
              else
              {
                uint64_t v71 = 0;
                uint64_t v73 = 0;
              }
              uint64_t v77 = **(void **)(v0 + 1264);
              uint64_t v78 = swift_allocObject();
              *(void *)(v78 + 16) = &unk_269268E90;
              *(void *)(v78 + 24) = v53;
              uint64_t v79 = v73 | v71;
              if (v73 | v71)
              {
                uint64_t v79 = v0 + 1184;
                *(void *)(v0 + 1184) = 0;
                *(void *)(v0 + 1192) = 0;
                *(void *)(v0 + 1200) = v71;
                *(void *)(v0 + 1208) = v73;
              }
              uint64_t v80 = *(void *)(v0 + 1456);
              *(void *)(v0 + 1240) = 1;
              *(void *)(v0 + 1248) = v79;
              *(void *)(v0 + 1256) = v77;
            }
            swift_task_create();
            swift_release();
            swift_release();
            sub_2478A1A1C(v80, &qword_2692687D8);
            goto LABEL_60;
          }
        }
        if (qword_269266A80 != -1) {
          swift_once();
        }
        uint64_t v16 = sub_247999030();
        __swift_project_value_buffer(v16, (uint64_t)qword_26927FC08);
        uint64_t v17 = sub_247999010();
        os_log_type_t v18 = sub_247999690();
        if (os_log_type_enabled(v17, v18))
        {
          uint64_t v19 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v19 = 0;
          _os_log_impl(&dword_247896000, v17, v18, "Unable to get file size.", v19, 2u);
          MEMORY[0x24C564070](v19, -1, -1);
        }
        uint64_t v20 = *(void *)(v0 + 1368);
        uint64_t v21 = *(void *)(v0 + 1352);

        sub_247998C80();
        sub_2479995B0();
        swift_release();
        (*v133)(v20, v21);
LABEL_60:
        uint64_t v6 = v135;
        uint64_t v5 = *v136;
LABEL_7:
        ++v3;
        v5(*(void *)(v0 + 1504), *(void *)(v0 + 1464));
      }
      while (v6 != v3);
    }
  }
  swift_bridgeObjectRelease();
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
  uint64_t v84 = *(uint64_t (**)(void))(v0 + 8);
  return v84();
}

uint64_t sub_2479516A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 448) = v22;
  *(void *)(v8 + 456) = v23;
  *(_OWORD *)(v8 + 416) = v20;
  *(_OWORD *)(v8 + 432) = v21;
  *(void *)(v8 + 400) = a7;
  *(void *)(v8 + 408) = a8;
  *(void *)(v8 + 384) = a5;
  *(void *)(v8 + 392) = a6;
  *(void *)(v8 + 376) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692684F0);
  *(void *)(v8 + 464) = swift_task_alloc();
  uint64_t v9 = sub_2479984D0();
  *(void *)(v8 + 472) = v9;
  *(void *)(v8 + 480) = *(void *)(v9 - 8);
  *(void *)(v8 + 488) = swift_task_alloc();
  *(void *)(v8 + 496) = swift_task_alloc();
  sub_247998CD0();
  *(void *)(v8 + 504) = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268808);
  *(void *)(v8 + 512) = v10;
  *(void *)(v8 + 520) = *(void *)(v10 - 8);
  *(void *)(v8 + 528) = swift_task_alloc();
  uint64_t v11 = sub_247998D10();
  *(void *)(v8 + 536) = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  *(void *)(v8 + 544) = v12;
  *(void *)(v8 + 552) = *(void *)(v12 + 64);
  *(void *)(v8 + 560) = swift_task_alloc();
  *(void *)(v8 + 568) = swift_task_alloc();
  _s22UploadDocumentResponseVMa(0);
  *(void *)(v8 + 576) = swift_task_alloc();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692687E8);
  *(void *)(v8 + 584) = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  *(void *)(v8 + 592) = v14;
  *(void *)(v8 + 600) = *(void *)(v14 + 64);
  *(void *)(v8 + 608) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268250);
  *(void *)(v8 + 616) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  *(void *)(v8 + 624) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269266F78);
  *(void *)(v8 + 632) = swift_task_alloc();
  uint64_t v15 = sub_247998240();
  *(void *)(v8 + 640) = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  *(void *)(v8 + 648) = v16;
  *(void *)(v8 + 656) = *(void *)(v16 + 64);
  *(void *)(v8 + 664) = swift_task_alloc();
  *(void *)(v8 + 672) = swift_task_alloc();
  *(void *)(v8 + 680) = swift_task_alloc();
  *(void *)(v8 + 688) = swift_task_alloc();
  *(void *)(v8 + 696) = _s30TwoPhaseUploadDocumentResponseVMa(0);
  *(void *)(v8 + 704) = swift_task_alloc();
  *(void *)(v8 + 712) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  *(void *)(v8 + 720) = swift_task_alloc();
  *(void *)(v8 + 728) = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C30);
  *(void *)(v8 + 736) = swift_task_alloc();
  uint64_t v17 = sub_247998BF0();
  *(void *)(v8 + 744) = v17;
  *(void *)(v8 + 752) = *(void *)(v17 - 8);
  *(void *)(v8 + 760) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268EA0);
  *(void *)(v8 + 768) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247951B9C, 0, 0);
}

uint64_t sub_247951B9C()
{
  uint64_t v1 = v0[47];
  swift_retain();
  v0[40] = sub_2478FAFE4(MEMORY[0x263F8EE78]);
  v0[41] = sub_24796D684;
  v0[42] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[97] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_247951C68;
  return sub_247978B3C((uint64_t)&unk_26FBDF1F8);
}

uint64_t sub_247951C68(uint64_t a1)
{
  *(void *)(*(void *)v1 + 784) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_247951D68, 0, 0);
}

uint64_t sub_247951D68()
{
  uint64_t v1 = *(void *)(v0 + 768);
  uint64_t v2 = *(void *)(v0 + 752);
  uint64_t v3 = *(void *)(v0 + 744);
  uint64_t v4 = *(void *)(v0 + 400);
  *(void *)(v0 + 792) = OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_provider;
  uint64_t v5 = *(void *)(v4 + OBJC_IVAR____TtC5Anvil19ImmutableFileHandle_metadata);
  *(void *)(v0 + 800) = sub_2479981D0();
  *(void *)(v0 + 808) = v6;
  sub_2479981A0();
  sub_247998BE0();
  sub_247998BC0();
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3);
  uint64_t v8 = *(void *)(v0 + 768);
  if (v7 == 1)
  {
    uint64_t v9 = 0xD000000000000018;
    sub_2478A1A1C(*(void *)(v0 + 768), &qword_269268EA0);
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 752);
    uint64_t v11 = *(void *)(v0 + 744);
    uint64_t v9 = sub_247998BD0();
    unint64_t v13 = v12;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v11);
    if (v13) {
      goto LABEL_6;
    }
    uint64_t v9 = 0xD000000000000018;
  }
  unint64_t v13 = 0x80000002479A6ED0;
LABEL_6:
  *(void *)(v0 + 824) = v13;
  *(void *)(v0 + 816) = v9;
  uint64_t v14 = *(void *)(v0 + 720);
  uint64_t v15 = *(void *)(v0 + 376);
  sub_247977344(v5, v0 + 240);
  long long v16 = *(_OWORD *)(v0 + 256);
  *(_OWORD *)(v0 + 832) = *(_OWORD *)(v0 + 240);
  *(_OWORD *)(v0 + 848) = v16;
  *(_OWORD *)(v0 + 864) = *(_OWORD *)(v0 + 272);
  *(unsigned char *)(v0 + 105) = *(unsigned char *)(v0 + 288);
  uint64_t v17 = *(void *)(v15 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_registry);
  *(void *)(v0 + 880) = v17;
  uint64_t v18 = *(void *)(v15 + 112);
  *(void *)(v0 + 888) = v18;
  uint64_t v19 = *(void *)(v15 + 120);
  *(void *)(v0 + 896) = v19;
  uint64_t v20 = sub_247999520();
  *(void *)(v0 + 904) = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
  *(void *)(v0 + 912) = v22;
  *(void *)(v0 + 920) = (v21 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v22(v14, 1, 1, v20);
  *(void *)(v0 + 928) = sub_247999500();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v23 = sub_2479994F0();
  uint64_t v24 = (void *)swift_allocObject();
  uint64_t v25 = MEMORY[0x263F8F500];
  long long v24[2] = v23;
  v24[3] = v25;
  v24[4] = v18;
  v24[5] = v19;
  v24[6] = v17;
  uint64_t v26 = sub_24794C5C8(v14, (uint64_t)&unk_269268EA8, (uint64_t)v24, (uint64_t)&unk_26FBE4640, &qword_269268C30);
  *(void *)(v0 + 936) = v26;
  os_log_type_t v27 = (void *)swift_task_alloc();
  *(void *)(v0 + 944) = v27;
  *os_log_type_t v27 = v0;
  v27[1] = sub_247952068;
  uint64_t v28 = *(void *)(v0 + 736);
  uint64_t v29 = *(void *)(v0 + 728);
  return MEMORY[0x270FA1FD0](v28, v26, v29);
}

uint64_t sub_247952068()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_247952180, 0, 0);
}

uint64_t sub_247952180()
{
  uint64_t v1 = v0[92];
  uint64_t v2 = type metadata accessor for SessionRegistry.SessionInfo(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    sub_2478A1A1C(v1, &qword_269268C30);
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v3 = *(void *)(v1 + 16);
    uint64_t v4 = *(void *)(v1 + 24);
    swift_bridgeObjectRetain();
    sub_24796D2F0(v1, type metadata accessor for SessionRegistry.SessionInfo);
  }
  v0[120] = v4;
  v0[119] = v3;
  uint64_t v5 = v0[55];
  uint64_t v6 = v0[53];
  uint64_t v7 = sub_2479037AC();
  uint64_t v9 = v8;
  v0[121] = v8;
  uint64_t v10 = (void *)swift_task_alloc();
  v0[122] = v10;
  void *v10 = v0;
  v10[1] = sub_2479522F8;
  uint64_t v11 = v0[54];
  uint64_t v12 = v0[52];
  return sub_24796F0F0(v7, v9, v12, v6, v11, v5);
}

uint64_t sub_2479522F8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 984) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_247952418, 0, 0);
}

uint64_t sub_247952418()
{
  uint64_t v1 = *(void *)(v0 + 960);
  char v18 = *(unsigned char *)(v0 + 105);
  uint64_t v16 = *(void *)(v0 + 864);
  uint64_t v17 = *(void *)(v0 + 872);
  uint64_t v14 = *(void *)(v0 + 848);
  uint64_t v15 = *(void *)(v0 + 856);
  uint64_t v12 = *(void *)(v0 + 832);
  uint64_t v13 = *(void *)(v0 + 840);
  uint64_t v11 = *(void *)(v0 + 824);
  uint64_t v2 = *(void *)(v0 + 816);
  long long v10 = *(_OWORD *)(v0 + 800);
  uint64_t v3 = *(void *)(v0 + 688);
  uint64_t v4 = *(void *)(v0 + 392);
  uint64_t v5 = sub_247914C20(*(void *)(v0 + 784), *(void *)(v0 + 984));
  *(void *)(v0 + 992) = v5;
  *(void *)(v0 + 1000) = OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_client;
  sub_24796FEC8(v1, v3);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v0 + 16) = v10;
  *(void *)(v0 + 32) = v4;
  *(void *)(v0 + 40) = v2;
  *(void *)(v0 + 48) = v11;
  *(void *)(v0 + 56) = v12;
  *(void *)(v0 + 64) = v13;
  *(void *)(v0 + 72) = v14;
  *(void *)(v0 + 80) = v15;
  *(void *)(v0 + 88) = v16;
  *(void *)(v0 + 96) = v17;
  *(unsigned char *)(v0 + 104) = v18;
  uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t, char))((char *)&dword_2692684B8
                                                                                        + dword_2692684B8);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 1008) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2479525DC;
  uint64_t v7 = *(void *)(v0 + 704);
  uint64_t v8 = *(void *)(v0 + 688);
  return v19(v7, v8, v0 + 16, 0, v5, 0, 1);
}

uint64_t sub_2479525DC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 1016) = v0;
  swift_task_dealloc();
  unsigned __int8 v15 = *(unsigned char *)(v2 + 105);
  uint64_t v14 = *(void *)(v2 + 872);
  uint64_t v12 = *(void *)(v2 + 864);
  uint64_t v11 = *(void *)(v2 + 856);
  uint64_t v3 = *(void *)(v2 + 848);
  uint64_t v4 = *(void *)(v2 + 840);
  uint64_t v5 = *(void *)(v2 + 832);
  uint64_t v13 = *(void *)(v2 + 688);
  uint64_t v6 = *(void *)(v2 + 648);
  uint64_t v7 = *(void *)(v2 + 640);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v0)
  {
    sub_2478F5614(v5, v4, v3, v11, v12, v14, v15);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v13, v7);
    uint64_t v8 = sub_247954A64;
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2478F5614(v5, v4, v3, v11, v12, v14, v15);
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    *(void *)(v2 + 1024) = v9;
    *(void *)(v2 + 1032) = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v9(v13, v7);
    uint64_t v8 = sub_2479528B0;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t sub_2479528B0()
{
  uint64_t v1 = *(void *)(v0 + 712);
  uint64_t v2 = *(void *)(v0 + 632);
  uint64_t v3 = *(void *)(v0 + 376);
  sub_24796CCB4(*(void *)(v0 + 704), v1, _s30TwoPhaseUploadDocumentResponseVMa);
  uint64_t v41 = *(void *)(v3 + 136);
  uint64_t v42 = *(void *)(v1 + 112);
  uint64_t v43 = *(void *)(v3 + 128);
  uint64_t v4 = *(void *)(v1 + 120);
  swift_bridgeObjectRetain();
  OpenAIAuthenticator.credentials.getter(v2);
  uint64_t v5 = type metadata accessor for OpenAIAuthenticator.Credentials(0);
  int v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v2, 1, v5);
  uint64_t v7 = *(void *)(v0 + 632);
  if (v6 == 1)
  {
    sub_2478A1A1C(*(void *)(v0 + 632), &qword_269266F78);
    uint64_t v40 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v40 = OpenAIAuthenticator.Credentials.credentialsID.getter();
    uint64_t v8 = v9;
    sub_24796D2F0(v7, type metadata accessor for OpenAIAuthenticator.Credentials);
  }
  uint64_t v10 = *(void *)(v0 + 624);
  sub_2478E6A48(*(void *)(v0 + 448), v10, &qword_269268C10);
  uint64_t v11 = sub_247998B20();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11);
  uint64_t v14 = *(void *)(v0 + 624);
  if (v13 == 1)
  {
    sub_2478A1A1C(*(void *)(v0 + 624), &qword_269268C10);
    int v38 = 0;
  }
  else
  {
    int v38 = sub_247998B10();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v14, v11);
  }
  uint64_t v15 = *(void *)(v0 + 712);
  uint64_t v16 = *(int *)(*(void *)(v0 + 696) + 52);
  uint64_t v17 = (uint64_t *)(v15 + *(int *)(_s21CreateSessionResponseVMa(0) + 32) + v16);
  uint64_t v18 = *(unsigned __int8 *)v17;
  double v19 = 0.0;
  if (v18 != 2) {
    double v19 = (double)v17[1];
  }
  BOOL v36 = v13 == 1;
  BOOL v37 = v18 == 2;
  uint64_t v20 = *(void *)(v0 + 896);
  uint64_t v35 = *(void *)(v0 + 888);
  uint64_t v21 = *(void *)(v0 + 880);
  uint64_t v22 = *(void *)(v0 + 720);
  uint64_t v39 = *(void *)(v0 + 440);
  uint64_t v23 = *(void *)(v0 + 416);
  uint64_t v24 = *(void *)(v0 + 424);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0 + 912))(v22, 1, 1, *(void *)(v0 + 904));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_2479994F0();
  uint64_t v26 = swift_allocObject();
  uint64_t v27 = MEMORY[0x263F8F500];
  *(void *)(v26 + 16) = v25;
  *(void *)(v26 + 24) = v27;
  *(void *)(v26 + 32) = v43;
  *(void *)(v26 + 40) = v41;
  *(void *)(v26 + 48) = v42;
  *(void *)(v26 + 56) = v4;
  *(void *)(v26 + 64) = v35;
  *(void *)(v26 + 72) = v20;
  *(void *)(v26 + 80) = v21;
  *(void *)(v26 + 88) = v23;
  *(void *)(v26 + 96) = v24;
  *(void *)(v26 + 104) = v40;
  *(void *)(v26 + 112) = v8;
  *(_DWORD *)(v26 + 120) = v38;
  *(unsigned char *)(v26 + 124) = v36;
  *(double *)(v26 + 128) = v19;
  *(unsigned char *)(v26 + 136) = v37;
  sub_24794C41C(v22, (uint64_t)&unk_269268EC0, v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v28 = sub_2479037AC();
  uint64_t v30 = v29;
  *(void *)(v0 + 1040) = v29;
  uint64_t v31 = (void *)swift_task_alloc();
  *(void *)(v0 + 1048) = v31;
  *uint64_t v31 = v0;
  v31[1] = sub_247952CB4;
  uint64_t v32 = *(void *)(v0 + 432);
  uint64_t v33 = *(void *)(v0 + 416);
  return sub_24796F0F0(v28, v30, v33, v24, v32, v39);
}

uint64_t sub_247952CB4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 1056) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_247952DD4, 0, 0);
}

uint64_t sub_247952DD4()
{
  uint64_t v1 = v0[132];
  uint64_t v2 = v0[81];
  uint64_t v3 = v0[80];
  uint64_t v4 = v0[77];
  uint64_t v5 = v0[47] + v0[125];
  unint64_t v6 = sub_2478FAC44((uint64_t)&unk_26FBDF220);
  uint64_t v26 = sub_247914C20(v6, v1);
  v0[133] = v26;
  sub_247920218(v5, (uint64_t)(v0 + 23));
  swift_bridgeObjectRetain();
  sub_247998220();
  swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v4, 1, v3);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = v0[85];
    uint64_t v9 = v0[81];
    uint64_t v10 = v0[80];
    uint64_t v11 = v0[76];
    uint64_t v12 = v0[75];
    uint64_t v13 = v0[74];
    uint64_t v14 = v0[73];
    uint64_t v15 = v0[48];
    int v25 = *(_DWORD *)(v0[50] + 16);
    (*(void (**)(uint64_t, void, uint64_t))(v13 + 16))(v11, v0[57], v14);
    uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
    v0[134] = v16;
    v0[135] = (v9 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v16(v8, v15, v10);
    unint64_t v17 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    unint64_t v18 = (v12 + *(unsigned __int8 *)(v9 + 80) + v17) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v19 = swift_allocObject();
    v0[136] = v19;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v13 + 32))(v19 + v17, v11, v14);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 32))(v19 + v18, v8, v10);
    uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t, int, uint64_t, uint64_t, char, uint64_t, uint64_t))((char *)&dword_269268EC8
                                                                                                  + dword_269268EC8);
    uint64_t v20 = (void *)swift_task_alloc();
    v0[137] = v20;
    *uint64_t v20 = v0;
    v20[1] = sub_24795305C;
    uint64_t v21 = v0[48];
    uint64_t v22 = v0[49];
    uint64_t v23 = v0[77];
    return v24(v23, v26, v25, v21, v22, 3, (uint64_t)sub_24796C540, v19);
  }
  return result;
}

uint64_t sub_24795305C()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)v1 + 184;
  *(void *)(*(void *)v1 + 1104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_247920430(v3);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v4 = sub_2479551E0;
  }
  else
  {
    uint64_t v5 = (void (*)(uint64_t, uint64_t))v2[128];
    uint64_t v6 = v2[80];
    uint64_t v7 = v2[77];
    swift_bridgeObjectRelease();
    swift_release();
    sub_247920430(v3);
    swift_bridgeObjectRelease();
    v5(v7, v6);
    uint64_t v4 = sub_247953214;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_247953214()
{
  uint64_t v1 = (uint64_t *)v0[89];
  uint64_t v2 = v0[84];
  uint64_t v3 = v0[55];
  uint64_t v4 = v0[53];
  uint64_t v5 = v1[14];
  uint64_t v6 = v1[15];
  uint64_t v7 = *v1;
  uint64_t v8 = v1[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24796FEE0(v5, v6, v7, v8, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_2479037AC();
  uint64_t v11 = v10;
  v0[139] = v10;
  uint64_t v12 = (void *)swift_task_alloc();
  v0[140] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_247953354;
  uint64_t v13 = v0[54];
  uint64_t v14 = v0[52];
  return sub_24796F0F0(v9, v11, v14, v4, v13, v3);
}

uint64_t sub_247953354(uint64_t a1)
{
  uint64_t v3 = (void *)*v1;
  uint64_t v4 = (void *)*v1;
  v3[141] = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, char, char, uint64_t, uint64_t, char))((char *)&dword_2692684A8
                                                                                    + dword_2692684A8);
  uint64_t v5 = (void *)swift_task_alloc();
  v3[142] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_247953534;
  uint64_t v6 = v3[84];
  uint64_t v7 = v3[72];
  return v9(v7, v6, 1, 0, a1, 0, 1);
}

uint64_t sub_247953534()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 1144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_247953A94;
  }
  else
  {
    uint64_t v4 = (void (*)(uint64_t, uint64_t))v2[128];
    uint64_t v5 = v2[84];
    uint64_t v6 = v2[80];
    uint64_t v7 = v2[72];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v4(v5, v6);
    sub_24796D2F0(v7, _s22UploadDocumentResponseVMa);
    uint64_t v3 = sub_2479536A8;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_2479536A8()
{
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 912);
  uint64_t v16 = *(void *)(v0 + 904);
  uint64_t v18 = *(void *)(v0 + 896);
  uint64_t v22 = *(void *)(v0 + 888);
  uint64_t v1 = *(void *)(v0 + 880);
  uint64_t v2 = *(void *)(v0 + 720);
  uint64_t v21 = v2;
  uint64_t v26 = *(void *)(v0 + 712);
  uint64_t v3 = *(void *)(v0 + 568);
  uint64_t v4 = *(void *)(v0 + 560);
  uint64_t v17 = v4;
  uint64_t v20 = *(void *)(v0 + 552);
  uint64_t v5 = *(void *)(v0 + 544);
  uint64_t v15 = *(void *)(v0 + 536);
  uint64_t v23 = *(void *)(v0 + 528);
  uint64_t v24 = *(void *)(v0 + 520);
  uint64_t v25 = *(void *)(v0 + 512);
  (*(void (**)(void))(v0 + 1072))(*(void *)(v0 + 664));
  swift_bridgeObjectRetain();
  sub_247998CE0();
  v19(v2, 1, 1, v16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v3, v15);
  swift_bridgeObjectRetain();
  uint64_t v6 = v1;
  swift_retain();
  uint64_t v7 = sub_2479994F0();
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v9 = (v20 + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8F500];
  *(void *)(v10 + 16) = v7;
  *(void *)(v10 + 24) = v11;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 32))(v10 + v8, v17, v15);
  uint64_t v12 = (void *)(v10 + v9);
  *uint64_t v12 = v22;
  v12[1] = v18;
  *(void *)(v10 + ((v9 + 23) & 0xFFFFFFFFFFFFFFF8)) = v6;
  sub_24794C41C(v21, (uint64_t)&unk_269268ED0, v10);
  swift_release();
  sub_247998CC0();
  sub_2479995B0();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v15);
  sub_24796D2F0(v26, _s30TwoPhaseUploadDocumentResponseVMa);
  swift_bridgeObjectRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_247953A94()
{
  uint64_t v49 = v0;
  uint64_t v1 = *(void *)(v0 + 712);
  (*(void (**)(void, void))(v0 + 1024))(*(void *)(v0 + 672), *(void *)(v0 + 640));
  swift_bridgeObjectRelease();
  sub_24796D2F0(v1, _s30TwoPhaseUploadDocumentResponseVMa);
  uint64_t v2 = *(void **)(v0 + 1144);
  *(void *)(v0 + 1152) = v2;
  *(void *)(v0 + 352) = v2;
  id v3 = v2;
  *(void *)(v0 + 1160) = __swift_instantiateConcreteTypeFromMangledName(&qword_269266BD8);
  if (swift_dynamicCast())
  {
    uint64_t v4 = *(void *)(v0 + 160);
    if (v4)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2478A1B10(v4);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2478A1B10(0);
      uint64_t v4 = MEMORY[0x263F8EE78];
    }
    *(void *)(v0 + 1168) = v4;
    uint64_t v5 = *(void *)(v4 + 16);
    *(void *)(v0 + 1176) = v5;
    if (v5)
    {
      *(void *)(v0 + 1184) = 0;
      uint64_t v6 = *(void *)(v4 + 40);
      uint64_t v7 = *(void *)(v4 + 48);
      uint64_t v8 = *(unsigned __int8 *)(v4 + 32);
      *(void *)(v0 + 1192) = v7;
      uint64_t v9 = *(void *)(v0 + 320);
      *(void *)(v0 + 1200) = v9;
      *(void *)(v0 + 1208) = *(void *)(v0 + 336);
      uint64_t v47 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_269269198 + dword_269269198);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v10 = (void *)swift_task_alloc();
      *(void *)(v0 + 1216) = v10;
      void *v10 = v0;
      v10[1] = sub_247954250;
      return v47(v6, v7, v8, v9);
    }
    swift_bridgeObjectRelease();
  }
  *(void *)(v0 + 368) = sub_247977978(*(void **)(v0 + 1152));
  uint64_t v12 = sub_2479984E0();
  int v13 = swift_dynamicCast();
  uint64_t v14 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
  uint64_t v15 = *(void *)(v0 + 464);
  if (v13)
  {
    uint64_t v16 = *(void *)(v12 - 8);
    v14(*(void *)(v0 + 464), 0, 1, v12);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v16 + 88))(v15, v12) == *MEMORY[0x263F7F7F0])
    {
      uint64_t v17 = *(void *)(v0 + 496);
      uint64_t v18 = *(void *)(v0 + 472);
      uint64_t v19 = *(void *)(v0 + 480);
      uint64_t v20 = *(void *)(v0 + 464);
      (*(void (**)(uint64_t, uint64_t))(v16 + 96))(v20, v12);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v17, v20, v18);
      if (qword_269266AA0 != -1) {
        swift_once();
      }
      uint64_t v22 = *(void *)(v0 + 488);
      uint64_t v21 = *(void *)(v0 + 496);
      uint64_t v23 = *(void *)(v0 + 472);
      uint64_t v24 = *(void *)(v0 + 480);
      uint64_t v25 = sub_247999030();
      __swift_project_value_buffer(v25, (uint64_t)qword_26927FC68);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v22, v21, v23);
      uint64_t v26 = sub_247999010();
      os_log_type_t v27 = sub_247999690();
      BOOL v28 = os_log_type_enabled(v26, v27);
      uint64_t v30 = *(void *)(v0 + 480);
      uint64_t v29 = *(void *)(v0 + 488);
      if (v28)
      {
        uint64_t v45 = *(void *)(v0 + 472);
        uint64_t v31 = (uint8_t *)swift_slowAlloc();
        uint64_t v46 = swift_slowAlloc();
        uint64_t v48 = v46;
        *(_DWORD *)uint64_t v31 = 136315138;
        uint64_t v32 = sub_2479984C0();
        *(void *)(v0 + 360) = sub_247918FF0(v32, v33, &v48);
        sub_247999720();
        swift_bridgeObjectRelease();
        unint64_t v34 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
        v34(v29, v45);
        _os_log_impl(&dword_247896000, v26, v27, "Attempted a two-phase document upload to an expired session! %s", v31, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C564070](v46, -1, -1);
        MEMORY[0x24C564070](v31, -1, -1);
      }
      else
      {
        unint64_t v34 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
        v34(*(void *)(v0 + 488), *(void *)(v0 + 472));
      }
      uint64_t v35 = *(void *)(v0 + 720);
      uint64_t v36 = *(void *)(v0 + 496);
      uint64_t v37 = *(void *)(v0 + 472);
      uint64_t v38 = *(void *)(v0 + 376);
      (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0 + 912))(v35, 1, 1, *(void *)(v0 + 904));
      uint64_t v39 = (void *)swift_allocObject();
      v39[2] = 0;
      v39[3] = 0;
      v39[4] = v38;
      swift_retain();
      sub_24794C41C(v35, (uint64_t)&unk_269268EB8, (uint64_t)v39);
      swift_release();
      v34(v36, v37);
    }
    else
    {
      (*(void (**)(void, uint64_t))(v16 + 8))(*(void *)(v0 + 464), v12);
    }
  }
  else
  {
    v14(*(void *)(v0 + 464), 1, 1, v12);
    sub_2478A1A1C(v15, &qword_2692684F0);
  }
  uint64_t v40 = *(void **)(v0 + 1152);
  uint64_t v41 = *(void *)(v0 + 528);
  uint64_t v42 = *(void *)(v0 + 520);
  uint64_t v43 = *(void *)(v0 + 512);
  swift_getErrorValue();
  sub_247999C30();
  sub_247998C80();
  swift_bridgeObjectRelease();
  sub_2479995B0();

  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
  swift_bridgeObjectRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v44 = *(uint64_t (**)(void))(v0 + 8);
  return v44();
}

uint64_t sub_247954250()
{
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_2479543A8, 0, 0);
}

uint64_t sub_2479543A8()
{
  uint64_t v46 = v0;
  uint64_t v1 = *(void *)(v0 + 1184) + 1;
  if (v1 == *(void *)(v0 + 1176))
  {
    swift_bridgeObjectRelease();
    *(void *)(v0 + 368) = sub_247977978(*(void **)(v0 + 1152));
    uint64_t v2 = sub_2479984E0();
    int v3 = swift_dynamicCast();
    uint64_t v4 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
    uint64_t v5 = *(void *)(v0 + 464);
    if (v3)
    {
      uint64_t v6 = *(void *)(v2 - 8);
      v4(*(void *)(v0 + 464), 0, 1, v2);
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v6 + 88))(v5, v2) == *MEMORY[0x263F7F7F0])
      {
        uint64_t v7 = *(void *)(v0 + 496);
        uint64_t v8 = *(void *)(v0 + 472);
        uint64_t v9 = *(void *)(v0 + 480);
        uint64_t v10 = *(void *)(v0 + 464);
        (*(void (**)(uint64_t, uint64_t))(v6 + 96))(v10, v2);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v7, v10, v8);
        if (qword_269266AA0 != -1) {
          swift_once();
        }
        uint64_t v12 = *(void *)(v0 + 488);
        uint64_t v11 = *(void *)(v0 + 496);
        uint64_t v13 = *(void *)(v0 + 472);
        uint64_t v14 = *(void *)(v0 + 480);
        uint64_t v15 = sub_247999030();
        __swift_project_value_buffer(v15, (uint64_t)qword_26927FC68);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v12, v11, v13);
        uint64_t v16 = sub_247999010();
        os_log_type_t v17 = sub_247999690();
        BOOL v18 = os_log_type_enabled(v16, v17);
        uint64_t v20 = *(void *)(v0 + 480);
        uint64_t v19 = *(void *)(v0 + 488);
        if (v18)
        {
          uint64_t v42 = *(void *)(v0 + 472);
          uint64_t v21 = (uint8_t *)swift_slowAlloc();
          uint64_t v43 = swift_slowAlloc();
          uint64_t v45 = v43;
          *(_DWORD *)uint64_t v21 = 136315138;
          uint64_t v22 = sub_2479984C0();
          *(void *)(v0 + 360) = sub_247918FF0(v22, v23, &v45);
          sub_247999720();
          swift_bridgeObjectRelease();
          uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
          v24(v19, v42);
          _os_log_impl(&dword_247896000, v16, v17, "Attempted a two-phase document upload to an expired session! %s", v21, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C564070](v43, -1, -1);
          MEMORY[0x24C564070](v21, -1, -1);
        }
        else
        {
          uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
          v24(*(void *)(v0 + 488), *(void *)(v0 + 472));
        }
        uint64_t v32 = *(void *)(v0 + 720);
        uint64_t v33 = *(void *)(v0 + 496);
        uint64_t v34 = *(void *)(v0 + 472);
        uint64_t v35 = *(void *)(v0 + 376);
        (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0 + 912))(v32, 1, 1, *(void *)(v0 + 904));
        uint64_t v36 = (void *)swift_allocObject();
        v36[2] = 0;
        v36[3] = 0;
        v36[4] = v35;
        swift_retain();
        sub_24794C41C(v32, (uint64_t)&unk_269268EB8, (uint64_t)v36);
        swift_release();
        v24(v33, v34);
      }
      else
      {
        (*(void (**)(void, uint64_t))(v6 + 8))(*(void *)(v0 + 464), v2);
      }
    }
    else
    {
      v4(*(void *)(v0 + 464), 1, 1, v2);
      sub_2478A1A1C(v5, &qword_2692684F0);
    }
    uint64_t v37 = *(void **)(v0 + 1152);
    uint64_t v38 = *(void *)(v0 + 528);
    uint64_t v39 = *(void *)(v0 + 520);
    uint64_t v40 = *(void *)(v0 + 512);
    swift_getErrorValue();
    sub_247999C30();
    sub_247998C80();
    swift_bridgeObjectRelease();
    sub_2479995B0();

    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
    swift_bridgeObjectRelease();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
    return v41();
  }
  else
  {
    *(void *)(v0 + 1184) = v1;
    uint64_t v25 = *(void *)(v0 + 1168) + 24 * v1;
    uint64_t v27 = *(void *)(v25 + 40);
    uint64_t v26 = *(void *)(v25 + 48);
    uint64_t v28 = *(unsigned __int8 *)(v25 + 32);
    *(void *)(v0 + 1192) = v26;
    uint64_t v29 = *(void *)(v0 + 320);
    *(void *)(v0 + 1200) = v29;
    uint64_t v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_269269198 + dword_269269198);
    *(void *)(v0 + 1208) = *(void *)(v0 + 336);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v30 = (void *)swift_task_alloc();
    *(void *)(v0 + 1216) = v30;
    *uint64_t v30 = v0;
    v30[1] = sub_247954250;
    return v44(v27, v26, v28, v29);
  }
}

uint64_t sub_247954A64()
{
  uint64_t v48 = v0;
  uint64_t v1 = *(void **)(v0 + 1016);
  *(void *)(v0 + 1152) = v1;
  *(void *)(v0 + 352) = v1;
  id v2 = v1;
  *(void *)(v0 + 1160) = __swift_instantiateConcreteTypeFromMangledName(&qword_269266BD8);
  if (swift_dynamicCast())
  {
    uint64_t v3 = *(void *)(v0 + 160);
    if (v3)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2478A1B10(v3);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2478A1B10(0);
      uint64_t v3 = MEMORY[0x263F8EE78];
    }
    *(void *)(v0 + 1168) = v3;
    uint64_t v4 = *(void *)(v3 + 16);
    *(void *)(v0 + 1176) = v4;
    if (v4)
    {
      *(void *)(v0 + 1184) = 0;
      uint64_t v5 = *(void *)(v3 + 40);
      uint64_t v6 = *(void *)(v3 + 48);
      uint64_t v7 = *(unsigned __int8 *)(v3 + 32);
      *(void *)(v0 + 1192) = v6;
      uint64_t v8 = *(void *)(v0 + 320);
      *(void *)(v0 + 1200) = v8;
      *(void *)(v0 + 1208) = *(void *)(v0 + 336);
      uint64_t v46 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_269269198 + dword_269269198);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v9 = (void *)swift_task_alloc();
      *(void *)(v0 + 1216) = v9;
      *uint64_t v9 = v0;
      v9[1] = sub_247954250;
      return v46(v5, v6, v7, v8);
    }
    swift_bridgeObjectRelease();
  }
  *(void *)(v0 + 368) = sub_247977978(*(void **)(v0 + 1152));
  uint64_t v11 = sub_2479984E0();
  int v12 = swift_dynamicCast();
  uint64_t v13 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  uint64_t v14 = *(void *)(v0 + 464);
  if (v12)
  {
    uint64_t v15 = *(void *)(v11 - 8);
    v13(*(void *)(v0 + 464), 0, 1, v11);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v15 + 88))(v14, v11) == *MEMORY[0x263F7F7F0])
    {
      uint64_t v16 = *(void *)(v0 + 496);
      uint64_t v17 = *(void *)(v0 + 472);
      uint64_t v18 = *(void *)(v0 + 480);
      uint64_t v19 = *(void *)(v0 + 464);
      (*(void (**)(uint64_t, uint64_t))(v15 + 96))(v19, v11);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(v16, v19, v17);
      if (qword_269266AA0 != -1) {
        swift_once();
      }
      uint64_t v21 = *(void *)(v0 + 488);
      uint64_t v20 = *(void *)(v0 + 496);
      uint64_t v22 = *(void *)(v0 + 472);
      uint64_t v23 = *(void *)(v0 + 480);
      uint64_t v24 = sub_247999030();
      __swift_project_value_buffer(v24, (uint64_t)qword_26927FC68);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v21, v20, v22);
      uint64_t v25 = sub_247999010();
      os_log_type_t v26 = sub_247999690();
      BOOL v27 = os_log_type_enabled(v25, v26);
      uint64_t v29 = *(void *)(v0 + 480);
      uint64_t v28 = *(void *)(v0 + 488);
      if (v27)
      {
        uint64_t v44 = *(void *)(v0 + 472);
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        uint64_t v45 = swift_slowAlloc();
        uint64_t v47 = v45;
        *(_DWORD *)uint64_t v30 = 136315138;
        uint64_t v31 = sub_2479984C0();
        *(void *)(v0 + 360) = sub_247918FF0(v31, v32, &v47);
        sub_247999720();
        swift_bridgeObjectRelease();
        uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
        v33(v28, v44);
        _os_log_impl(&dword_247896000, v25, v26, "Attempted a two-phase document upload to an expired session! %s", v30, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C564070](v45, -1, -1);
        MEMORY[0x24C564070](v30, -1, -1);
      }
      else
      {
        uint64_t v33 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
        v33(*(void *)(v0 + 488), *(void *)(v0 + 472));
      }
      uint64_t v34 = *(void *)(v0 + 720);
      uint64_t v35 = *(void *)(v0 + 496);
      uint64_t v36 = *(void *)(v0 + 472);
      uint64_t v37 = *(void *)(v0 + 376);
      (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0 + 912))(v34, 1, 1, *(void *)(v0 + 904));
      uint64_t v38 = (void *)swift_allocObject();
      v38[2] = 0;
      v38[3] = 0;
      v38[4] = v37;
      swift_retain();
      sub_24794C41C(v34, (uint64_t)&unk_269268EB8, (uint64_t)v38);
      swift_release();
      v33(v35, v36);
    }
    else
    {
      (*(void (**)(void, uint64_t))(v15 + 8))(*(void *)(v0 + 464), v11);
    }
  }
  else
  {
    v13(*(void *)(v0 + 464), 1, 1, v11);
    sub_2478A1A1C(v14, &qword_2692684F0);
  }
  uint64_t v39 = *(void **)(v0 + 1152);
  uint64_t v40 = *(void *)(v0 + 528);
  uint64_t v41 = *(void *)(v0 + 520);
  uint64_t v42 = *(void *)(v0 + 512);
  swift_getErrorValue();
  sub_247999C30();
  sub_247998C80();
  swift_bridgeObjectRelease();
  sub_2479995B0();

  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
  swift_bridgeObjectRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v43 = *(uint64_t (**)(void))(v0 + 8);
  return v43();
}

uint64_t sub_2479551E0()
{
  uint64_t v51 = v0;
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 1024);
  uint64_t v2 = *(void *)(v0 + 640);
  uint64_t v3 = *(void *)(v0 + 616);
  sub_24796D2F0(*(void *)(v0 + 712), _s30TwoPhaseUploadDocumentResponseVMa);
  v1(v3, v2);
  uint64_t v4 = *(void **)(v0 + 1104);
  *(void *)(v0 + 1152) = v4;
  *(void *)(v0 + 352) = v4;
  id v5 = v4;
  *(void *)(v0 + 1160) = __swift_instantiateConcreteTypeFromMangledName(&qword_269266BD8);
  if (swift_dynamicCast())
  {
    uint64_t v6 = *(void *)(v0 + 160);
    if (v6)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2478A1B10(v6);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2478A1B10(0);
      uint64_t v6 = MEMORY[0x263F8EE78];
    }
    *(void *)(v0 + 1168) = v6;
    uint64_t v7 = *(void *)(v6 + 16);
    *(void *)(v0 + 1176) = v7;
    if (v7)
    {
      *(void *)(v0 + 1184) = 0;
      uint64_t v8 = *(void *)(v6 + 40);
      uint64_t v9 = *(void *)(v6 + 48);
      uint64_t v10 = *(unsigned __int8 *)(v6 + 32);
      *(void *)(v0 + 1192) = v9;
      uint64_t v11 = *(void *)(v0 + 320);
      *(void *)(v0 + 1200) = v11;
      *(void *)(v0 + 1208) = *(void *)(v0 + 336);
      uint64_t v49 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_269269198 + dword_269269198);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      int v12 = (void *)swift_task_alloc();
      *(void *)(v0 + 1216) = v12;
      *int v12 = v0;
      v12[1] = sub_247954250;
      return v49(v8, v9, v10, v11);
    }
    swift_bridgeObjectRelease();
  }
  *(void *)(v0 + 368) = sub_247977978(*(void **)(v0 + 1152));
  uint64_t v14 = sub_2479984E0();
  int v15 = swift_dynamicCast();
  uint64_t v16 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  uint64_t v17 = *(void *)(v0 + 464);
  if (v15)
  {
    uint64_t v18 = *(void *)(v14 - 8);
    v16(*(void *)(v0 + 464), 0, 1, v14);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 88))(v17, v14) == *MEMORY[0x263F7F7F0])
    {
      uint64_t v19 = *(void *)(v0 + 496);
      uint64_t v20 = *(void *)(v0 + 472);
      uint64_t v21 = *(void *)(v0 + 480);
      uint64_t v22 = *(void *)(v0 + 464);
      (*(void (**)(uint64_t, uint64_t))(v18 + 96))(v22, v14);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32))(v19, v22, v20);
      if (qword_269266AA0 != -1) {
        swift_once();
      }
      uint64_t v24 = *(void *)(v0 + 488);
      uint64_t v23 = *(void *)(v0 + 496);
      uint64_t v25 = *(void *)(v0 + 472);
      uint64_t v26 = *(void *)(v0 + 480);
      uint64_t v27 = sub_247999030();
      __swift_project_value_buffer(v27, (uint64_t)qword_26927FC68);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v24, v23, v25);
      uint64_t v28 = sub_247999010();
      os_log_type_t v29 = sub_247999690();
      BOOL v30 = os_log_type_enabled(v28, v29);
      uint64_t v32 = *(void *)(v0 + 480);
      uint64_t v31 = *(void *)(v0 + 488);
      if (v30)
      {
        uint64_t v47 = *(void *)(v0 + 472);
        uint64_t v33 = (uint8_t *)swift_slowAlloc();
        uint64_t v48 = swift_slowAlloc();
        uint64_t v50 = v48;
        *(_DWORD *)uint64_t v33 = 136315138;
        uint64_t v34 = sub_2479984C0();
        *(void *)(v0 + 360) = sub_247918FF0(v34, v35, &v50);
        sub_247999720();
        swift_bridgeObjectRelease();
        uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
        v36(v31, v47);
        _os_log_impl(&dword_247896000, v28, v29, "Attempted a two-phase document upload to an expired session! %s", v33, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C564070](v48, -1, -1);
        MEMORY[0x24C564070](v33, -1, -1);
      }
      else
      {
        uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
        v36(*(void *)(v0 + 488), *(void *)(v0 + 472));
      }
      uint64_t v37 = *(void *)(v0 + 720);
      uint64_t v38 = *(void *)(v0 + 496);
      uint64_t v39 = *(void *)(v0 + 472);
      uint64_t v40 = *(void *)(v0 + 376);
      (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0 + 912))(v37, 1, 1, *(void *)(v0 + 904));
      uint64_t v41 = (void *)swift_allocObject();
      v41[2] = 0;
      v41[3] = 0;
      v41[4] = v40;
      swift_retain();
      sub_24794C41C(v37, (uint64_t)&unk_269268EB8, (uint64_t)v41);
      swift_release();
      v36(v38, v39);
    }
    else
    {
      (*(void (**)(void, uint64_t))(v18 + 8))(*(void *)(v0 + 464), v14);
    }
  }
  else
  {
    v16(*(void *)(v0 + 464), 1, 1, v14);
    sub_2478A1A1C(v17, &qword_2692684F0);
  }
  uint64_t v42 = *(void **)(v0 + 1152);
  uint64_t v43 = *(void *)(v0 + 528);
  uint64_t v44 = *(void *)(v0 + 520);
  uint64_t v45 = *(void *)(v0 + 512);
  swift_getErrorValue();
  sub_247999C30();
  sub_247998C80();
  swift_bridgeObjectRelease();
  sub_2479995B0();

  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v43, v45);
  swift_bridgeObjectRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v46 = *(uint64_t (**)(void))(v0 + 8);
  return v46();
}

uint64_t sub_247955994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_2479559B4, 0, 0);
}

uint64_t sub_2479559B4()
{
  uint64_t v3 = (uint64_t (*)(void))(*(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_sessionExpired)
                         + **(int **)(*(void *)(v0 + 16) + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_sessionExpired));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  void *v1 = v0;
  v1[1] = sub_24796D660;
  return v3();
}

uint64_t sub_247955A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 400) = v21;
  *(_OWORD *)(v8 + 368) = v19;
  *(_OWORD *)(v8 + 384) = v20;
  *(void *)(v8 + 352) = a7;
  *(void *)(v8 + 360) = a8;
  *(void *)(v8 + 336) = a5;
  *(void *)(v8 + 344) = a6;
  *(void *)(v8 + 328) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692684F0);
  *(void *)(v8 + 408) = swift_task_alloc();
  uint64_t v9 = sub_247998D10();
  *(void *)(v8 + 416) = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  *(void *)(v8 + 424) = v10;
  *(void *)(v8 + 432) = *(void *)(v10 + 64);
  *(void *)(v8 + 440) = swift_task_alloc();
  *(void *)(v8 + 448) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  *(void *)(v8 + 456) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269266F78);
  *(void *)(v8 + 464) = swift_task_alloc();
  sub_247998CD0();
  *(void *)(v8 + 472) = swift_task_alloc();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268808);
  *(void *)(v8 + 480) = v11;
  *(void *)(v8 + 488) = *(void *)(v11 - 8);
  *(void *)(v8 + 496) = swift_task_alloc();
  uint64_t v12 = _s22UploadDocumentResponseVMa(0);
  *(void *)(v8 + 504) = v12;
  *(void *)(v8 + 512) = *(void *)(v12 - 8);
  *(void *)(v8 + 520) = swift_task_alloc();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692687E8);
  *(void *)(v8 + 528) = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  *(void *)(v8 + 536) = v14;
  *(void *)(v8 + 544) = *(void *)(v14 + 64);
  *(void *)(v8 + 552) = swift_task_alloc();
  uint64_t v15 = sub_247998240();
  *(void *)(v8 + 560) = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  *(void *)(v8 + 568) = v16;
  *(void *)(v8 + 576) = *(void *)(v16 + 64);
  *(void *)(v8 + 584) = swift_task_alloc();
  *(void *)(v8 + 592) = swift_task_alloc();
  *(void *)(v8 + 600) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268EE0);
  *(void *)(v8 + 608) = swift_task_alloc();
  *(void *)(v8 + 616) = swift_task_alloc();
  *(void *)(v8 + 624) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  *(void *)(v8 + 632) = swift_task_alloc();
  *(void *)(v8 + 640) = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C30);
  *(void *)(v8 + 648) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247955E90, 0, 0);
}

uint64_t sub_247955E90()
{
  uint64_t v1 = v0[41];
  swift_retain();
  v0[35] = sub_2478FAFE4(MEMORY[0x263F8EE78]);
  v0[36] = sub_24796C92C;
  v0[37] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[82] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_247955F5C;
  return sub_247978B3C((uint64_t)&unk_26FBDF260);
}

uint64_t sub_247955F5C(uint64_t a1)
{
  *(void *)(*(void *)v1 + 664) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24795605C, 0, 0);
}

uint64_t sub_24795605C()
{
  uint64_t v1 = v0[46];
  uint64_t v2 = v0[44];
  v0[84] = OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_provider;
  uint64_t v3 = sub_2479037AC();
  uint64_t v5 = v4;
  v0[85] = v4;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[86] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_247956140;
  uint64_t v7 = v0[45];
  uint64_t v8 = v0[43];
  return sub_24796F0F0(v3, v5, v8, v2, v7, v1);
}

uint64_t sub_247956140(uint64_t a1)
{
  *(void *)(*(void *)v1 + 696) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_247956260, 0, 0);
}

uint64_t sub_247956260()
{
  uint64_t v1 = v0[79];
  uint64_t v2 = v0[41];
  v0[88] = sub_247914C20(v0[83], v0[87]);
  uint64_t v3 = *(void *)(v2 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_registry);
  v0[89] = v3;
  uint64_t v4 = *(void *)(v2 + 112);
  v0[90] = v4;
  uint64_t v5 = *(void *)(v2 + 120);
  v0[91] = v5;
  uint64_t v6 = sub_247999520();
  v0[92] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v0[93] = v8;
  v0[94] = (v7 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v8(v1, 1, 1, v6);
  v0[95] = sub_247999500();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v9 = sub_2479994F0();
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8F500];
  v10[2] = v9;
  v10[3] = v11;
  v10[4] = v4;
  v10[5] = v5;
  v10[6] = v3;
  uint64_t v12 = sub_24794C5C8(v1, (uint64_t)&unk_269268EE8, (uint64_t)v10, (uint64_t)&unk_26FBE4640, &qword_269268C30);
  v0[96] = v12;
  uint64_t v13 = (void *)swift_task_alloc();
  v0[97] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_24795643C;
  uint64_t v14 = v0[81];
  uint64_t v15 = v0[80];
  return MEMORY[0x270FA1FD0](v14, v12, v15);
}

uint64_t sub_24795643C()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_247956554, 0, 0);
}

void sub_247956554()
{
  uint64_t v1 = *(void *)(v0 + 648);
  uint64_t v2 = type metadata accessor for SessionRegistry.SessionInfo(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    sub_2478A1A1C(v1, &qword_269268C30);
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = *(void *)(v1 + 24);
    swift_bridgeObjectRetain();
    sub_24796D2F0(v1, type metadata accessor for SessionRegistry.SessionInfo);
  }
  sub_247977344(*(void *)(*(void *)(v0 + 376) + OBJC_IVAR____TtC5Anvil19ImmutableFileHandle_metadata), v0 + 200);
  sub_2478F5268(v0 + 200, v0 + 144, &qword_269268EF0);
  int v3 = *(unsigned __int8 *)(v0 + 192);
  if (v3 == 255)
  {
    long long v4 = 0uLL;
    char v5 = -1;
    long long v6 = 0uLL;
    long long v7 = 0uLL;
  }
  else
  {
    char v5 = v3 & 1;
    long long v4 = *(_OWORD *)(v0 + 144);
    long long v6 = *(_OWORD *)(v0 + 160);
    long long v7 = *(_OWORD *)(v0 + 176);
  }
  uint64_t v8 = *(void *)(v0 + 600);
  uint64_t v9 = *(void *)(v0 + 592);
  uint64_t v10 = *(void *)(v0 + 568);
  uint64_t v21 = *(void *)(v0 + 560);
  uint64_t v11 = *(void *)(v0 + 552);
  uint64_t v22 = *(void *)(v0 + 544);
  uint64_t v12 = *(void *)(v0 + 536);
  uint64_t v13 = *(void *)(v0 + 528);
  uint64_t v14 = *(void *)(v0 + 392);
  uint64_t v20 = *(void *)(v0 + 384);
  *(_OWORD *)(v0 + 88) = v4;
  *(_OWORD *)(v0 + 104) = v6;
  *(_OWORD *)(v0 + 120) = v7;
  *(unsigned char *)(v0 + 136) = v5;
  sub_247970194(v24, v8);
  swift_bridgeObjectRelease();
  type metadata accessor for BlackPowder();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v14, v13);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  *(void *)(v0 + 784) = v15;
  *(void *)(v0 + 792) = (v10 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v15(v9, v20, v21);
  unint64_t v16 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v17 = (v22 + *(unsigned __int8 *)(v10 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = swift_allocObject();
  *(void *)(v0 + 800) = v18;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v12 + 32))(v18 + v16, v11, v13);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v10 + 32))(v18 + v17, v9, v21);
  uint64_t v23 = (char *)&dword_269268EF8 + dword_269268EF8;
  long long v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 808) = v19;
  *long long v19 = v0;
  v19[1] = sub_2479568BC;
  __asm { BR              X8; sub_24794924C }
}

uint64_t sub_2479568BC()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)v1 + 200;
  *(void *)(*(void *)v1 + 816) = v0;
  swift_task_dealloc();
  uint64_t v4 = v2[75];
  uint64_t v5 = v2[71];
  uint64_t v6 = v2[70];
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  sub_24796D2AC(v3, (void (*)(void, void, void, void, void, void, void))sub_2478F5614);
  if (v0) {
    long long v7 = sub_247957888;
  }
  else {
    long long v7 = sub_247956A90;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_247956A90()
{
  uint64_t v1 = v0[78];
  uint64_t v2 = v0[76];
  uint64_t v3 = v0[63];
  uint64_t v4 = v0[64];
  sub_2478F5268(v0[77], v1, &qword_269268EE0);
  sub_2478E6A48(v1, v2, &qword_269268EE0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    uint64_t v5 = v0[78];
    uint64_t v7 = v0[61];
    uint64_t v6 = v0[62];
    uint64_t v8 = v0[60];
    sub_2478A1A1C(v0[76], &qword_269268EE0);
    sub_247998C80();
    sub_2479995B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }
  else
  {
    uint64_t v9 = v0[65];
    uint64_t v10 = v0[58];
    uint64_t v11 = v0[41];
    sub_24796CCB4(v0[76], v9, _s22UploadDocumentResponseVMa);
    uint64_t v12 = *(void *)(v11 + 136);
    uint64_t v61 = *(void *)(v9 + 16);
    uint64_t v62 = *(void *)(v11 + 128);
    uint64_t v59 = *(void *)(v9 + 24);
    swift_bridgeObjectRetain();
    OpenAIAuthenticator.credentials.getter(v10);
    uint64_t v13 = type metadata accessor for OpenAIAuthenticator.Credentials(0);
    int v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v10, 1, v13);
    uint64_t v15 = v0[58];
    if (v14 == 1)
    {
      sub_2478A1A1C(v0[58], &qword_269266F78);
      uint64_t v56 = 0;
      uint64_t v60 = 0;
    }
    else
    {
      uint64_t v56 = OpenAIAuthenticator.Credentials.credentialsID.getter();
      uint64_t v60 = v16;
      sub_24796D2F0(v15, type metadata accessor for OpenAIAuthenticator.Credentials);
    }
    uint64_t v17 = v0[57];
    sub_2478E6A48(v0[50], v17, &qword_269268C10);
    uint64_t v18 = sub_247998B20();
    uint64_t v19 = *(void *)(v18 - 8);
    int v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18);
    uint64_t v21 = v0[57];
    if (v20 == 1)
    {
      sub_2478A1A1C(v0[57], &qword_269268C10);
      int v52 = 0;
    }
    else
    {
      int v52 = sub_247998B10();
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v21, v18);
    }
    uint64_t v22 = *(int *)(v0[63] + 24);
    uint64_t v66 = v0[65];
    uint64_t v23 = (uint64_t *)(v66 + *(int *)(_s21CreateSessionResponseVMa(0) + 32) + v22);
    uint64_t v24 = *(unsigned __int8 *)v23;
    double v25 = 0.0;
    if (v24 != 2) {
      double v25 = (double)v23[1];
    }
    uint64_t v49 = (void (*)(uint64_t, uint64_t, uint64_t))v0[98];
    BOOL v42 = v20 == 1;
    BOOL v43 = v24 == 2;
    uint64_t v45 = (void (*)(void))v0[93];
    uint64_t v44 = v0[92];
    uint64_t v26 = v0[91];
    uint64_t v27 = v0[90];
    uint64_t v28 = v0[89];
    uint64_t v63 = v0[79];
    uint64_t v54 = v0[78];
    uint64_t v46 = v0[73];
    uint64_t v47 = v0[70];
    uint64_t v55 = v0[62];
    uint64_t v57 = v0[61];
    uint64_t v58 = v0[60];
    uint64_t v64 = v0[56];
    uint64_t v53 = v0[54];
    uint64_t v48 = v0[53];
    uint64_t v50 = v0[52];
    uint64_t v51 = v0[55];
    uint64_t v65 = v0[48];
    uint64_t v29 = v0[44];
    uint64_t v41 = v0[43];
    v45();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v30 = v12;
    uint64_t v31 = sub_2479994F0();
    uint64_t v32 = swift_allocObject();
    uint64_t v33 = MEMORY[0x263F8F500];
    *(void *)(v32 + 16) = v31;
    *(void *)(v32 + 24) = v33;
    *(void *)(v32 + 32) = v62;
    *(void *)(v32 + 40) = v30;
    *(void *)(v32 + 48) = v61;
    *(void *)(v32 + 56) = v59;
    *(void *)(v32 + 64) = v27;
    *(void *)(v32 + 72) = v26;
    *(void *)(v32 + 80) = v28;
    *(void *)(v32 + 88) = v41;
    *(void *)(v32 + 96) = v29;
    *(void *)(v32 + 104) = v56;
    *(void *)(v32 + 112) = v60;
    *(_DWORD *)(v32 + 120) = v52;
    *(unsigned char *)(v32 + 124) = v42;
    *(double *)(v32 + 128) = v25;
    *(unsigned char *)(v32 + 136) = v43;
    sub_24794C41C(v63, (uint64_t)&unk_269268F10, v32);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v49(v46, v65, v47);
    swift_bridgeObjectRetain();
    sub_247998CE0();
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v45)(v63, 1, 1, v44);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16))(v51, v64, v50);
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v34 = sub_2479994F0();
    unint64_t v35 = (*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
    unint64_t v36 = (v53 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 16) = v34;
    *(void *)(v37 + 24) = MEMORY[0x263F8F500];
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v48 + 32))(v37 + v35, v51, v50);
    uint64_t v38 = (void *)(v37 + v36);
    *uint64_t v38 = v27;
    v38[1] = v26;
    *(void *)(v37 + ((v36 + 23) & 0xFFFFFFFFFFFFFFF8)) = v28;
    uint64_t v5 = v54;
    sub_24794C41C(v63, (uint64_t)&unk_269268F18, v37);
    swift_release();
    sub_247998CC0();
    sub_2479995B0();
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v55, v58);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v64, v50);
    sub_24796D2F0(v66, _s22UploadDocumentResponseVMa);
  }
  sub_2478A1A1C(v5, &qword_269268EE0);
  swift_bridgeObjectRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v39 = (uint64_t (*)(void))v0[1];
  return v39();
}

uint64_t sub_24795721C()
{
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_247957374, 0, 0);
}

uint64_t sub_247957374()
{
  uint64_t v1 = *(void *)(v0 + 840) + 1;
  if (v1 == *(void *)(v0 + 832))
  {
    swift_bridgeObjectRelease();
    *(void *)(v0 + 304) = sub_247977978(*(void **)(v0 + 816));
    uint64_t v2 = sub_2479984E0();
    int v3 = swift_dynamicCast();
    uint64_t v4 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
    uint64_t v5 = *(void *)(v0 + 408);
    if (v3)
    {
      uint64_t v6 = *(void *)(v2 - 8);
      v4(*(void *)(v0 + 408), 0, 1, v2);
      int v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 88))(v5, v2);
      int v8 = *MEMORY[0x263F7F7F0];
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v2);
      if (v7 == v8)
      {
        if (qword_269266AA0 != -1) {
          swift_once();
        }
        uint64_t v9 = sub_247999030();
        __swift_project_value_buffer(v9, (uint64_t)qword_26927FC68);
        uint64_t v10 = sub_247999010();
        os_log_type_t v11 = sub_247999690();
        if (os_log_type_enabled(v10, v11))
        {
          uint64_t v12 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl(&dword_247896000, v10, v11, "Attempted to upload a document to an expired session!", v12, 2u);
          MEMORY[0x24C564070](v12, -1, -1);
        }
        uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 744);
        uint64_t v14 = *(void *)(v0 + 736);
        uint64_t v15 = *(void *)(v0 + 632);
        uint64_t v16 = *(void *)(v0 + 328);

        v13(v15, 1, 1, v14);
        uint64_t v17 = (void *)swift_allocObject();
        v17[2] = 0;
        v17[3] = 0;
        _OWORD v17[4] = v16;
        swift_retain();
        sub_24794C41C(v15, (uint64_t)&unk_269268F08, (uint64_t)v17);
        swift_release();
      }
    }
    else
    {
      v4(*(void *)(v0 + 408), 1, 1, v2);
      sub_2478A1A1C(v5, &qword_2692684F0);
    }
    double v25 = *(void **)(v0 + 816);
    uint64_t v27 = *(void *)(v0 + 488);
    uint64_t v26 = *(void *)(v0 + 496);
    uint64_t v28 = *(void *)(v0 + 480);
    swift_getErrorValue();
    sub_247999C30();
    sub_247998C80();
    swift_bridgeObjectRelease();
    sub_2479995B0();

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    swift_bridgeObjectRelease();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v29 = *(uint64_t (**)(void))(v0 + 8);
    return v29();
  }
  else
  {
    *(void *)(v0 + 840) = v1;
    uint64_t v18 = *(void *)(v0 + 824) + 24 * v1;
    uint64_t v20 = *(void *)(v18 + 40);
    uint64_t v19 = *(void *)(v18 + 48);
    char v21 = *(unsigned char *)(v18 + 32);
    *(void *)(v0 + 848) = v19;
    uint64_t v22 = *(void *)(v0 + 280);
    *(void *)(v0 + 856) = v22;
    uint64_t v30 = (uint64_t (*)(uint64_t, uint64_t, char, uint64_t))((char *)&dword_269269198 + dword_269269198);
    *(void *)(v0 + 864) = *(void *)(v0 + 296);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 872) = v23;
    void *v23 = v0;
    v23[1] = sub_24795721C;
    return v30(v20, v19, v21, v22);
  }
}

uint64_t sub_247957888()
{
  uint64_t v1 = *(void **)(v0 + 816);
  *(void *)(v0 + 320) = v1;
  id v2 = v1;
  *(void *)(v0 + 880) = __swift_instantiateConcreteTypeFromMangledName(&qword_269266BD8);
  if (swift_dynamicCast())
  {
    uint64_t v3 = *(void *)(v0 + 64);
    if (v3)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2478A1B10(v3);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2478A1B10(0);
      uint64_t v3 = MEMORY[0x263F8EE78];
    }
    *(void *)(v0 + 824) = v3;
    uint64_t v4 = *(void *)(v3 + 16);
    *(void *)(v0 + 832) = v4;
    if (v4)
    {
      *(void *)(v0 + 840) = 0;
      uint64_t v5 = *(void *)(v3 + 40);
      uint64_t v6 = *(void *)(v3 + 48);
      char v7 = *(unsigned char *)(v3 + 32);
      *(void *)(v0 + 848) = v6;
      uint64_t v8 = *(void *)(v0 + 280);
      *(void *)(v0 + 856) = v8;
      *(void *)(v0 + 864) = *(void *)(v0 + 296);
      uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, char, uint64_t))((char *)&dword_269269198 + dword_269269198);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v9 = (void *)swift_task_alloc();
      *(void *)(v0 + 872) = v9;
      *uint64_t v9 = v0;
      v9[1] = sub_24795721C;
      return v32(v5, v6, v7, v8);
    }
    swift_bridgeObjectRelease();
  }
  *(void *)(v0 + 304) = sub_247977978(*(void **)(v0 + 816));
  uint64_t v11 = sub_2479984E0();
  int v12 = swift_dynamicCast();
  uint64_t v13 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  uint64_t v14 = *(void *)(v0 + 408);
  if (v12)
  {
    uint64_t v15 = *(void *)(v11 - 8);
    v13(*(void *)(v0 + 408), 0, 1, v11);
    int v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 88))(v14, v11);
    int v17 = *MEMORY[0x263F7F7F0];
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v11);
    if (v16 == v17)
    {
      if (qword_269266AA0 != -1) {
        swift_once();
      }
      uint64_t v18 = sub_247999030();
      __swift_project_value_buffer(v18, (uint64_t)qword_26927FC68);
      uint64_t v19 = sub_247999010();
      os_log_type_t v20 = sub_247999690();
      if (os_log_type_enabled(v19, v20))
      {
        char v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v21 = 0;
        _os_log_impl(&dword_247896000, v19, v20, "Attempted to upload a document to an expired session!", v21, 2u);
        MEMORY[0x24C564070](v21, -1, -1);
      }
      uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 744);
      uint64_t v23 = *(void *)(v0 + 736);
      uint64_t v24 = *(void *)(v0 + 632);
      uint64_t v25 = *(void *)(v0 + 328);

      v22(v24, 1, 1, v23);
      uint64_t v26 = (void *)swift_allocObject();
      v26[2] = 0;
      void v26[3] = 0;
      v26[4] = v25;
      swift_retain();
      sub_24794C41C(v24, (uint64_t)&unk_269268F08, (uint64_t)v26);
      swift_release();
    }
  }
  else
  {
    v13(*(void *)(v0 + 408), 1, 1, v11);
    sub_2478A1A1C(v14, &qword_2692684F0);
  }
  uint64_t v27 = *(void **)(v0 + 816);
  uint64_t v29 = *(void *)(v0 + 488);
  uint64_t v28 = *(void *)(v0 + 496);
  uint64_t v30 = *(void *)(v0 + 480);
  swift_getErrorValue();
  sub_247999C30();
  sub_247998C80();
  swift_bridgeObjectRelease();
  sub_2479995B0();

  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
  swift_bridgeObjectRelease();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
  return v31();
}

uint64_t sub_247957E58()
{
  uint64_t v0 = sub_247998CD0();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268808);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247998C40();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687E8);
  sub_2479995B0();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_247957FA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_247957FC0, 0, 0);
}

uint64_t sub_247957FC0()
{
  uint64_t v3 = (uint64_t (*)(void))(*(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_sessionExpired)
                         + **(int **)(*(void *)(v0 + 16) + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_sessionExpired));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  void *v1 = v0;
  v1[1] = sub_247958098;
  return v3();
}

uint64_t sub_247958098()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24795818C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_247999520();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_247999510();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_2478A1A1C(a1, &qword_2692687D8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2479994B0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_247958314(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268800);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  int v6 = *MEMORY[0x263F8F650];
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (a1 == v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269266BD8);
    return sub_247999530();
  }
  return result;
}

uint64_t sub_247958460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  v4[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2479584F8, v3, 0);
}

uint64_t sub_2479584F8()
{
  if (sub_247999430())
  {
    uint64_t v1 = v0[6];
    v0[8] = *(void *)(v1 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_registry);
    v0[9] = *(void *)(v1 + 112);
    v0[10] = *(void *)(v1 + 120);
    return MEMORY[0x270FA2498](sub_2479586C0, 0, 0);
  }
  else
  {
    uint64_t v2 = v0[3];
    uint64_t v3 = v0[4];
    v0[14] = v2;
    uint64_t v5 = v0[5];
    uint64_t v4 = v0[6];
    sub_24796D17C(&qword_269268D90, (void (*)(uint64_t))_s7SessionCMa);
    swift_bridgeObjectRetain();
    uint64_t v6 = (void *)swift_task_alloc();
    v0[15] = v6;
    v6[2] = v4;
    v6[3] = v2;
    v6[4] = v3;
    v6[5] = v5;
    char v7 = (void *)swift_task_alloc();
    v0[16] = v7;
    void *v7 = v0;
    v7[1] = sub_247958ADC;
    return MEMORY[0x270FA22B8]();
  }
}

uint64_t sub_2479586C0()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[8];
  uint64_t v5 = sub_247999520();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 1, 1, v5);
  sub_247999500();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v6 = sub_2479994F0();
  char v7 = (void *)swift_allocObject();
  uint64_t v8 = MEMORY[0x263F8F500];
  v7[2] = v6;
  v7[3] = v8;
  v7[4] = v2;
  v7[5] = v1;
  v7[6] = v4;
  uint64_t v9 = sub_24794C5C8(v3, (uint64_t)&unk_269268DA8, (uint64_t)v7, (uint64_t)&unk_26FBE46E0, &qword_269268DB0);
  v0[11] = v9;
  uint64_t v10 = (void *)swift_task_alloc();
  v0[12] = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268DB0);
  void *v10 = v0;
  v10[1] = sub_247958864;
  return MEMORY[0x270FA1FD0](v0 + 2, v9, v11);
}

uint64_t sub_247958864()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24795897C, 0, 0);
}

uint64_t sub_24795897C()
{
  uint64_t v1 = v0[6];
  v0[13] = v0[2];
  return MEMORY[0x270FA2498](sub_2479589A0, v1, 0);
}

uint64_t sub_2479589A0()
{
  uint64_t v1 = v0[13];
  v0[14] = v1;
  uint64_t v3 = v0[5];
  uint64_t v2 = v0[6];
  uint64_t v4 = v0[4];
  sub_24796D17C(&qword_269268D90, (void (*)(uint64_t))_s7SessionCMa);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[15] = v5;
  v5[2] = v2;
  v5[3] = v1;
  v5[4] = v4;
  v5[5] = v3;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[16] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_247958ADC;
  return MEMORY[0x270FA22B8]();
}

uint64_t sub_247958ADC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = sub_247958C70;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 48);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v4 = sub_247958C0C;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_247958C0C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247958C70()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247958CE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[19] = a5;
  v6[20] = a6;
  v6[17] = a3;
  v6[18] = a4;
  v6[16] = a2;
  uint64_t v8 = sub_2479984E0();
  v6[21] = v8;
  v6[22] = *(void *)(v8 - 8);
  v6[23] = swift_task_alloc();
  uint64_t v9 = sub_2479984D0();
  v6[24] = v9;
  v6[25] = *(void *)(v9 - 8);
  v6[26] = swift_task_alloc();
  uint64_t v10 = sub_247998D10();
  v6[27] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v6[28] = v11;
  v6[29] = *(void *)(v11 + 64);
  v6[30] = swift_task_alloc();
  v6[31] = swift_task_alloc();
  v6[32] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  v6[33] = swift_task_alloc();
  v6[34] = swift_task_alloc();
  v6[35] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247958EDC, a3, 0);
}

uint64_t sub_247958EDC()
{
  uint64_t v1 = v0[17];
  v0[36] = *(void *)(v1 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_registry);
  v0[37] = *(void *)(v1 + 112);
  v0[38] = *(void *)(v1 + 120);
  return MEMORY[0x270FA2498](sub_247958F1C, 0, 0);
}

uint64_t sub_247958F1C()
{
  uint64_t v2 = v0[37];
  uint64_t v1 = v0[38];
  uint64_t v3 = v0[35];
  uint64_t v4 = v0[36];
  uint64_t v5 = sub_247999520();
  v0[39] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v0[40] = v6;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v0[41] = v7;
  v0[42] = (v6 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v7(v3, 1, 1, v5);
  sub_247999500();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v8 = sub_2479994F0();
  uint64_t v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v2;
  v9[5] = v1;
  v9[6] = v4;
  uint64_t v11 = sub_24794C5C8(v3, (uint64_t)&unk_269268DD0, (uint64_t)v9, (uint64_t)&unk_26FBE46E0, &qword_269268DB0);
  v0[43] = v11;
  int v12 = (void *)swift_task_alloc();
  v0[44] = v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268DB0);
  *int v12 = v0;
  v12[1] = sub_2479590E8;
  return MEMORY[0x270FA1FD0](v0 + 11, v11, v13);
}

uint64_t sub_2479590E8()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_247959200, 0, 0);
}

uint64_t sub_247959200()
{
  uint64_t v1 = v0[17];
  v0[45] = v0[11];
  return MEMORY[0x270FA2498](sub_247959224, v1, 0);
}

uint64_t sub_247959224()
{
  uint64_t v199 = v0;
  uint64_t v1 = *(void *)(v0 + 360);
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v4 = sub_24796A518(v3);
  swift_bridgeObjectRelease();
  uint64_t v5 = (uint64_t *)sub_247967278(v1, v4);
  uint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v7 = sub_24796A518(v6);
  swift_bridgeObjectRelease();
  int64_t v8 = sub_247967278(v2, v7);
  if (qword_269266AA0 != -1) {
    goto LABEL_105;
  }
  while (1)
  {
    uint64_t v9 = sub_247999030();
    __swift_project_value_buffer(v9, (uint64_t)qword_26927FC68);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_retain_n();
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_247999010();
    os_log_type_t v11 = sub_2479996B0();
    uint64_t v188 = (uint64_t)v5;
    uint64_t v173 = v8;
    if (!os_log_type_enabled(v10, v11))
    {

      swift_release_n();
      swift_release_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      if (v5[2]) {
        break;
      }
      goto LABEL_59;
    }
    os_log_type_t v170 = v11;
    log = v10;
    uint64_t v12 = *(void *)(v192 + 144);
    uint64_t v13 = (_DWORD *)swift_slowAlloc();
    uint64_t v169 = swift_slowAlloc();
    v198[0] = v169;
    v176 = v13;
    *uint64_t v13 = 136315906;
    int64_t v14 = *(void *)(v12 + 16);
    uint64_t v15 = MEMORY[0x263F8EE78];
    if (v14)
    {
      uint64_t v16 = *(void *)(v192 + 224);
      uint64_t v17 = *(void *)(v192 + 144);
      uint64_t v193 = MEMORY[0x263F8EE78];
      sub_2479660B4(0, v14, 0);
      uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
      uint64_t v18 = v16 + 16;
      uint64_t v183 = v19;
      uint64_t v20 = v17 + ((*(unsigned __int8 *)(v18 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 64));
      uint64_t v21 = *(void *)(v18 + 56);
      do
      {
        uint64_t v22 = *(void *)(v192 + 256);
        uint64_t v23 = *(void *)(v192 + 216);
        v183(v22, v20, v23);
        uint64_t v24 = sub_247998CF0();
        uint64_t v26 = v25;
        (*(void (**)(uint64_t, uint64_t))(v18 - 8))(v22, v23);
        uint64_t v15 = v193;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2479660B4(0, *(void *)(v193 + 16) + 1, 1);
          uint64_t v15 = v193;
        }
        unint64_t v28 = *(void *)(v15 + 16);
        unint64_t v27 = *(void *)(v15 + 24);
        if (v28 >= v27 >> 1)
        {
          sub_2479660B4(v27 > 1, v28 + 1, 1);
          uint64_t v15 = v193;
        }
        *(void *)(v15 + 16) = v28 + 1;
        uint64_t v29 = v15 + 16 * v28;
        *(void *)(v29 + 32) = v24;
        *(void *)(v29 + 40) = v26;
        v20 += v21;
        --v14;
      }
      while (v14);
      uint64_t v5 = (uint64_t *)v188;
    }
    int v52 = (uint64_t *)(v192 + 112);
    uint64_t v53 = *(void *)(v192 + 360);
    uint64_t v54 = MEMORY[0x24C562FA0](v15, MEMORY[0x263F8D310]);
    unint64_t v56 = v55;
    swift_bridgeObjectRelease();
    *(void *)(v192 + 96) = sub_247918FF0(v54, v56, v198);
    sub_247999720();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *((_WORD *)v176 + 6) = 2080;
    int64_t v57 = *(void *)(v53 + 16);
    uint64_t v58 = MEMORY[0x263F8EE78];
    if (v57)
    {
      uint64_t v59 = *(void *)(v192 + 360);
      uint64_t v60 = *(void *)(v192 + 224);
      uint64_t v195 = MEMORY[0x263F8EE78];
      sub_2479660B4(0, v57, 0);
      uint64_t v62 = *(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 16);
      uint64_t v61 = v60 + 16;
      id v185 = v62;
      uint64_t v63 = v59 + ((*(unsigned __int8 *)(v61 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v61 + 64));
      uint64_t v64 = *(void *)(v61 + 56);
      do
      {
        uint64_t v65 = *(void *)(v192 + 256);
        uint64_t v66 = *(void *)(v192 + 216);
        v185(v65, v63, v66);
        uint64_t v67 = sub_247998CF0();
        uint64_t v69 = v68;
        (*(void (**)(uint64_t, uint64_t))(v61 - 8))(v65, v66);
        uint64_t v58 = v195;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2479660B4(0, *(void *)(v195 + 16) + 1, 1);
          uint64_t v58 = v195;
        }
        unint64_t v71 = *(void *)(v58 + 16);
        unint64_t v70 = *(void *)(v58 + 24);
        if (v71 >= v70 >> 1)
        {
          sub_2479660B4(v70 > 1, v71 + 1, 1);
          uint64_t v58 = v195;
        }
        *(void *)(v58 + 16) = v71 + 1;
        uint64_t v72 = v58 + 16 * v71;
        *(void *)(v72 + 32) = v67;
        *(void *)(v72 + 40) = v69;
        v63 += v64;
        --v57;
      }
      while (v57);
      uint64_t v5 = (uint64_t *)v188;
      int v52 = (uint64_t *)(v192 + 112);
    }
    uint64_t v73 = MEMORY[0x24C562FA0](v58, MEMORY[0x263F8D310]);
    unint64_t v75 = v74;
    swift_bridgeObjectRelease();
    *(void *)(v192 + 104) = sub_247918FF0(v73, v75, v198);
    sub_247999720();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *((_WORD *)v176 + 11) = 2080;
    int64_t v76 = v5[2];
    uint64_t v77 = MEMORY[0x263F8EE78];
    if (v76)
    {
      uint64_t v78 = *(void *)(v192 + 224);
      uint64_t v196 = MEMORY[0x263F8EE78];
      sub_2479660B4(0, v76, 0);
      int64_t v8 = sub_24796A2E0((uint64_t)v5);
      int v80 = v79;
      char v82 = v81 & 1;
      uint64_t v186 = v5 + 7;
      uint64_t v83 = v78;
      do
      {
        if (v8 < 0 || v8 >= 1 << *((unsigned char *)v5 + 32))
        {
          __break(1u);
LABEL_95:
          __break(1u);
LABEL_96:
          __break(1u);
LABEL_97:
          __break(1u);
LABEL_98:
          __break(1u);
LABEL_99:
          __break(1u);
LABEL_100:
          __break(1u);
LABEL_101:
          __break(1u);
LABEL_102:
          __break(1u);
LABEL_103:
          __break(1u);
          goto LABEL_104;
        }
        if (((*(unint64_t *)((char *)v186 + (((unint64_t)v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
          goto LABEL_95;
        }
        if (*((_DWORD *)v5 + 9) != v80) {
          goto LABEL_96;
        }
        uint64_t v85 = *(void *)(v192 + 248);
        uint64_t v84 = *(void *)(v192 + 256);
        uint64_t v86 = *(void *)(v192 + 216);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 16))(v84, v5[6] + *(void *)(v83 + 72) * v8, v86);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 32))(v85, v84, v86);
        uint64_t v87 = sub_247998CF0();
        uint64_t v89 = v88;
        (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v85, v86);
        uint64_t v77 = v196;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2479660B4(0, *(void *)(v196 + 16) + 1, 1);
          uint64_t v77 = v196;
        }
        unint64_t v91 = *(void *)(v77 + 16);
        unint64_t v90 = *(void *)(v77 + 24);
        if (v91 >= v90 >> 1)
        {
          sub_2479660B4(v90 > 1, v91 + 1, 1);
          uint64_t v77 = v196;
        }
        *(void *)(v77 + 16) = v91 + 1;
        uint64_t v92 = v77 + 16 * v91;
        *(void *)(v92 + 32) = v87;
        *(void *)(v92 + 40) = v89;
        uint64_t v5 = (uint64_t *)v188;
        int64_t v93 = sub_24796A380(v8, v80, v82 & 1, v188);
        int64_t v8 = v93;
        int v80 = v94;
        char v82 = v95 & 1;
        --v76;
      }
      while (v76);
      sub_24796B01C(v93, v94, v95 & 1);
      int v52 = (uint64_t *)(v192 + 112);
    }
    uint64_t v96 = MEMORY[0x24C562FA0](v77, MEMORY[0x263F8D310]);
    unint64_t v98 = v97;
    swift_bridgeObjectRelease();
    *int v52 = sub_247918FF0(v96, v98, v198);
    sub_247999720();
    swift_release_n();
    swift_bridgeObjectRelease();
    *((_WORD *)v176 + 16) = 2080;
    int64_t v8 = v173;
    int64_t v99 = *(void *)(v173 + 16);
    uint64_t v100 = MEMORY[0x263F8EE78];
    if (v99)
    {
      uint64_t v101 = *(void *)(v192 + 224);
      uint64_t v197 = MEMORY[0x263F8EE78];
      sub_2479660B4(0, v99, 0);
      int64_t v102 = sub_24796A2E0(v173);
      uint64_t v5 = v103;
      char v105 = v104 & 1;
      do
      {
        if (v102 < 0 || v102 >= 1 << *(unsigned char *)(v8 + 32)) {
          goto LABEL_97;
        }
        if (((*(void *)(v173 + 56 + (((unint64_t)v102 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v102) & 1) == 0) {
          goto LABEL_98;
        }
        if (*(_DWORD *)(v8 + 36) != v5) {
          goto LABEL_99;
        }
        uint64_t v106 = *(void *)(v192 + 248);
        uint64_t v107 = *(void *)(v192 + 256);
        uint64_t v108 = *(void *)(v192 + 216);
        (*(void (**)(uint64_t, int64_t, uint64_t))(v101 + 16))(v107, *(void *)(v8 + 48) + *(void *)(v101 + 72) * v102, v108);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v101 + 32))(v106, v107, v108);
        uint64_t v109 = sub_247998CF0();
        uint64_t v111 = v110;
        (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v106, v108);
        uint64_t v100 = v197;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2479660B4(0, *(void *)(v197 + 16) + 1, 1);
          uint64_t v100 = v197;
        }
        unint64_t v113 = *(void *)(v100 + 16);
        unint64_t v112 = *(void *)(v100 + 24);
        if (v113 >= v112 >> 1)
        {
          sub_2479660B4(v112 > 1, v113 + 1, 1);
          uint64_t v100 = v197;
        }
        *(void *)(v100 + 16) = v113 + 1;
        uint64_t v114 = v100 + 16 * v113;
        *(void *)(v114 + 32) = v109;
        *(void *)(v114 + 40) = v111;
        int64_t v8 = v173;
        int64_t v115 = sub_24796A380(v102, (int)v5, v105 & 1, v173);
        int64_t v102 = v115;
        uint64_t v5 = (uint64_t *)v116;
        char v105 = v117 & 1;
        --v99;
      }
      while (v99);
      sub_24796B01C(v115, v116, v117 & 1);
      uint64_t v5 = (uint64_t *)v188;
    }
    uint64_t v118 = MEMORY[0x24C562FA0](v100, MEMORY[0x263F8D310]);
    unint64_t v120 = v119;
    swift_bridgeObjectRelease();
    *(void *)(v192 + 120) = sub_247918FF0(v118, v120, v198);
    sub_247999720();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247896000, log, v170, "Resolving registration for documents: %s\nCurrently attached documents: %s\nAdditions: %s\nDeletions: %s", (uint8_t *)v176, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v169, -1, -1);
    MEMORY[0x24C564070](v176, -1, -1);

    if (v5[2]) {
      break;
    }
LABEL_59:
    uint64_t v121 = *(void *)(v192 + 320);
    v122 = *(NSObject **)(v192 + 224);
    swift_release();
    int64_t v123 = 0;
    int64_t v166 = v8 + 56;
    uint64_t v124 = -1;
    uint64_t v125 = -1 << *(unsigned char *)(v8 + 32);
    if (-v125 < 64) {
      uint64_t v124 = ~(-1 << -(char)v125);
    }
    unint64_t v126 = v124 & *(void *)(v8 + 56);
    int64_t v167 = (unint64_t)(63 - v125) >> 6;
    os_log_t loga = v122;
    v168 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v121 + 48);
    uint64_t v165 = (void (**)(uint64_t, uint64_t))(v121 + 8);
    while (1)
    {
      if (v126)
      {
        uint64_t v187 = (v126 - 1) & v126;
        int64_t v189 = v123;
        unint64_t v128 = __clz(__rbit64(v126)) | (v123 << 6);
        goto LABEL_79;
      }
      int64_t v129 = v123 + 1;
      if (__OFADD__(v123, 1)) {
        goto LABEL_100;
      }
      if (v129 >= v167)
      {
LABEL_87:
        uint64_t v150 = *(void *)(v192 + 136);
        swift_release();
        uint64_t v151 = sub_24796D17C(&qword_269268D90, (void (*)(uint64_t))_s7SessionCMa);
        v190 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_269268DE8 + dword_269268DE8);
        v152 = (void *)swift_task_alloc();
        *(void *)(v192 + 368) = v152;
        void *v152 = v192;
        v152[1] = sub_24795A62C;
        return v190(v150, v151);
      }
      unint64_t v130 = *(void *)(v166 + 8 * v129);
      int64_t v131 = v123 + 1;
      if (!v130)
      {
        int64_t v131 = v123 + 2;
        if (v123 + 2 >= v167) {
          goto LABEL_87;
        }
        unint64_t v130 = *(void *)(v166 + 8 * v131);
        if (!v130)
        {
          int64_t v131 = v123 + 3;
          if (v123 + 3 >= v167) {
            goto LABEL_87;
          }
          unint64_t v130 = *(void *)(v166 + 8 * v131);
          if (!v130) {
            break;
          }
        }
      }
LABEL_78:
      uint64_t v187 = (v130 - 1) & v130;
      int64_t v189 = v131;
      unint64_t v128 = __clz(__rbit64(v130)) + (v131 << 6);
LABEL_79:
      unint64_t v133 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v192 + 328);
      uint64_t v134 = *(void *)(v192 + 312);
      uint64_t v135 = *(void *)(v192 + 272);
      uint64_t v181 = v134;
      uint64_t v182 = *(void *)(v192 + 264);
      uint64_t v136 = *(void *)(v192 + 256);
      uint64_t v137 = *(void *)(v192 + 240);
      uint64_t v138 = *(void *)(v192 + 216);
      uint64_t v179 = *(void *)(v192 + 152);
      uint64_t v180 = *(void *)(v192 + 160);
      uint64_t v139 = *(void *)(v192 + 136);
      ((void (*)(uint64_t, unint64_t, uint64_t))loga[2].isa)(v137, *(void *)(v8 + 48) + (unint64_t)loga[9].isa * v128, v138);
      v133(v135, 1, 1, v134);
      isa = (void (*)(uint64_t, uint64_t, uint64_t))loga[4].isa;
      isa(v136, v137, v138);
      unint64_t v141 = (LOBYTE(loga[10].isa) + 56) & ~(unint64_t)LOBYTE(loga[10].isa);
      uint64_t v142 = (void *)swift_allocObject();
      v142[2] = 0;
      v142[3] = 0;
      v142[4] = v139;
      v142[5] = v179;
      v142[6] = v180;
      isa((uint64_t)v142 + v141, v136, v138);
      uint64_t v5 = &qword_2692687D8;
      sub_2478E6A48(v135, v182, &qword_2692687D8);
      LODWORD(v136) = (*v168)(v182, 1, v181);
      swift_retain();
      swift_bridgeObjectRetain();
      if (v136 == 1)
      {
        sub_2478A1A1C(*(void *)(v192 + 264), &qword_2692687D8);
      }
      else
      {
        uint64_t v143 = *(void *)(v192 + 312);
        uint64_t v144 = *(void *)(v192 + 264);
        sub_247999510();
        (*v165)(v144, v143);
      }
      int64_t v8 = v173;
      if (v142[2])
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v145 = sub_2479994B0();
        uint64_t v147 = v146;
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v145 = 0;
        uint64_t v147 = 0;
      }
      uint64_t v148 = **(void **)(v192 + 128);
      uint64_t v149 = v147 | v145;
      if (v147 | v145)
      {
        uint64_t v149 = v192 + 16;
        *(void *)(v192 + 16) = 0;
        *(void *)(v192 + 24) = 0;
        *(void *)(v192 + 32) = v145;
        *(void *)(v192 + 40) = v147;
      }
      uint64_t v127 = *(void *)(v192 + 272);
      *(void *)(v192 + 48) = 1;
      *(void *)(v192 + 56) = v149;
      *(void *)(v192 + 64) = v148;
      swift_task_create();
      swift_release();
      sub_2478A1A1C(v127, &qword_2692687D8);
      int64_t v123 = v189;
      unint64_t v126 = v187;
    }
    uint64_t v132 = v123 + 4;
    if (v123 + 4 >= v167) {
      goto LABEL_87;
    }
    unint64_t v130 = *(void *)(v166 + 8 * v132);
    if (v130)
    {
      int64_t v131 = v123 + 4;
      goto LABEL_78;
    }
    while (1)
    {
      int64_t v131 = v132 + 1;
      if (__OFADD__(v132, 1)) {
        break;
      }
      if (v131 >= v167) {
        goto LABEL_87;
      }
      unint64_t v130 = *(void *)(v166 + 8 * v131);
      ++v132;
      if (v130) {
        goto LABEL_78;
      }
    }
LABEL_104:
    __break(1u);
LABEL_105:
    swift_once();
  }
  swift_release();
  swift_retain_n();
  uint64_t v30 = sub_247999010();
  os_log_type_t v31 = sub_247999690();
  if (os_log_type_enabled(v30, v31))
  {
    os_log_type_t v178 = v31;
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v177 = swift_slowAlloc();
    v198[0] = v177;
    *(_DWORD *)uint64_t v32 = 136315138;
    int64_t v33 = v5[2];
    uint64_t v34 = MEMORY[0x263F8EE78];
    if (v33)
    {
      unint64_t v174 = v32;
      long long v175 = v30;
      uint64_t v35 = *(void *)(v192 + 224);
      uint64_t v194 = MEMORY[0x263F8EE78];
      sub_2479660B4(0, v33, 0);
      int64_t v8 = sub_24796A2E0((uint64_t)v5);
      unint64_t v36 = v5;
      uint64_t v5 = v37;
      char v39 = v38 & 1;
      uint64_t v184 = v36 + 7;
      do
      {
        if (v8 < 0 || v8 >= 1 << *(unsigned char *)(v188 + 32)) {
          goto LABEL_101;
        }
        if (((*(unint64_t *)((char *)v184 + (((unint64_t)v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
          goto LABEL_102;
        }
        if (*(_DWORD *)(v188 + 36) != v5) {
          goto LABEL_103;
        }
        uint64_t v40 = *(void *)(v192 + 248);
        uint64_t v41 = *(void *)(v192 + 256);
        uint64_t v42 = *(void *)(v192 + 216);
        (*(void (**)(uint64_t, int64_t, uint64_t))(v35 + 16))(v41, *(void *)(v188 + 48) + *(void *)(v35 + 72) * v8, v42);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 32))(v40, v41, v42);
        uint64_t v43 = sub_247998CF0();
        uint64_t v45 = v44;
        (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v40, v42);
        uint64_t v34 = v194;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2479660B4(0, *(void *)(v194 + 16) + 1, 1);
          uint64_t v34 = v194;
        }
        unint64_t v47 = *(void *)(v34 + 16);
        unint64_t v46 = *(void *)(v34 + 24);
        if (v47 >= v46 >> 1)
        {
          sub_2479660B4(v46 > 1, v47 + 1, 1);
          uint64_t v34 = v194;
        }
        *(void *)(v34 + 16) = v47 + 1;
        uint64_t v48 = v34 + 16 * v47;
        *(void *)(v48 + 32) = v43;
        *(void *)(v48 + 40) = v45;
        int64_t v49 = sub_24796A380(v8, (int)v5, v39 & 1, v188);
        int64_t v8 = v49;
        uint64_t v5 = (uint64_t *)v50;
        char v39 = v51 & 1;
        --v33;
      }
      while (v33);
      sub_24796B01C(v49, v50, v51 & 1);
      uint64_t v5 = (uint64_t *)v188;
      uint64_t v32 = v174;
      uint64_t v30 = v175;
    }
    uint64_t v154 = MEMORY[0x24C562FA0](v34, MEMORY[0x263F8D310]);
    unint64_t v156 = v155;
    swift_bridgeObjectRelease();
    *(void *)(v192 + 72) = sub_247918FF0(v154, v156, v198);
    sub_247999720();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247896000, v30, v178, "Received unknown document identiers: %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v177, -1, -1);
    MEMORY[0x24C564070](v32, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  uint64_t v158 = *(void *)(v192 + 200);
  uint64_t v157 = *(void *)(v192 + 208);
  uint64_t v159 = *(void *)(v192 + 184);
  uint64_t v191 = *(void *)(v192 + 192);
  uint64_t v161 = *(void *)(v192 + 168);
  uint64_t v160 = *(void *)(v192 + 176);
  sub_247999800();
  swift_bridgeObjectRelease();
  uint64_t v162 = sub_24794C154((uint64_t)v5);
  swift_release();
  MEMORY[0x24C562FA0](v162, MEMORY[0x263F8D310]);
  sub_2479993D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2479984B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v158 + 16))(v159, v157, v191);
  (*(void (**)(uint64_t, void, uint64_t))(v160 + 104))(v159, *MEMORY[0x263F7F810], v161);
  sub_24796D17C(&qword_269266BF0, MEMORY[0x263F7F830]);
  swift_allocError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v160 + 16))(v163, v159, v161);
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v160 + 8))(v159, v161);
  (*(void (**)(uint64_t, uint64_t))(v158 + 8))(v157, v191);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v164 = *(uint64_t (**)(void))(v192 + 8);
  return v164();
}

uint64_t sub_24795A62C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24795A820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  os_log_type_t v11 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v11;
  *os_log_type_t v11 = v7;
  v11[1] = sub_2478A1D80;
  return sub_24795AE34(a5, a6, a7);
}

uint64_t sub_24795A8D4(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  if (a1)
  {
    swift_getObjectType();
    uint64_t v4 = sub_2479994B0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v3[5] = v4;
  v3[6] = v6;
  return MEMORY[0x270FA2498](sub_24795A974, v4, v6);
}

uint64_t sub_24795A974()
{
  v0[7] = __swift_instantiateConcreteTypeFromMangledName(&qword_269266BD8);
  if (sub_247999560())
  {
    uint64_t v1 = (uint64_t (*)(void))v0[1];
    return v1();
  }
  else
  {
    v0[8] = 0;
    uint64_t v3 = (void *)swift_task_alloc();
    v0[9] = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268DF0);
    *uint64_t v3 = v0;
    v3[1] = sub_24795AAA8;
    uint64_t v5 = v0[3];
    uint64_t v6 = v0[2];
    return MEMORY[0x270FA2048](v0 + 11, v6, v5, v4);
  }
}

uint64_t sub_24795AAA8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    uint64_t v5 = sub_24795ACF4;
  }
  else
  {
    *(unsigned char *)(v2 + 89) = *(unsigned char *)(v2 + 88);
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    uint64_t v5 = sub_24795ABC4;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_24795ABC4()
{
  if (*(unsigned char *)(v0 + 89))
  {
    uint64_t v1 = *(void *)(v0 + 64);
    if (sub_247999560())
    {
      if (v1) {
        swift_willThrow();
      }
      uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
      return v2();
    }
    *(void *)(v0 + 64) = v1;
  }
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268DF0);
  *uint64_t v4 = v0;
  v4[1] = sub_24795AAA8;
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v7 = *(void *)(v0 + 16);
  return MEMORY[0x270FA2048](v0 + 88, v7, v6, v5);
}

uint64_t sub_24795ACF4()
{
  uint64_t v1 = (void *)v0[10];
  if (v0[8])
  {

    uint64_t v1 = (void *)v0[8];
  }
  if (sub_247999560())
  {
    if (v1) {
      swift_willThrow();
    }
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  else
  {
    v0[8] = v1;
    uint64_t v4 = (void *)swift_task_alloc();
    v0[9] = v4;
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268DF0);
    *uint64_t v4 = v0;
    v4[1] = sub_24795AAA8;
    uint64_t v6 = v0[3];
    uint64_t v7 = v0[2];
    return MEMORY[0x270FA2048](v0 + 11, v7, v6, v5);
  }
}

uint64_t sub_24795AE34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  uint64_t v5 = sub_247998240();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  uint64_t v6 = sub_247998D10();
  v4[11] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v4[12] = v7;
  v4[13] = *(void *)(v7 + 64);
  v4[14] = swift_task_alloc();
  v4[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  v4[16] = swift_task_alloc();
  v4[17] = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C30);
  v4[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24795AFD0, 0, 0);
}

uint64_t sub_24795AFD0()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_registry);
  uint64_t v3 = v0[16];
  v0[19] = v2;
  uint64_t v4 = *(void *)(v1 + 112);
  v0[20] = v4;
  uint64_t v5 = *(void *)(v1 + 120);
  v0[21] = v5;
  uint64_t v6 = sub_247999520();
  v0[22] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v0[23] = v8;
  v0[24] = (v7 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v8(v3, 1, 1, v6);
  v0[25] = sub_247999500();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v9 = sub_2479994F0();
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8F500];
  v10[2] = v9;
  v10[3] = v11;
  v10[4] = v4;
  v10[5] = v5;
  v10[6] = v2;
  uint64_t v12 = sub_24794C5C8(v3, (uint64_t)&unk_269268D80, (uint64_t)v10, (uint64_t)&unk_26FBE4640, &qword_269268C30);
  v0[26] = v12;
  uint64_t v13 = (void *)swift_task_alloc();
  v0[27] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_24795B190;
  uint64_t v15 = v0[17];
  uint64_t v14 = v0[18];
  return MEMORY[0x270FA1FD0](v14, v12, v15);
}

uint64_t sub_24795B190()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24795B2A8, 0, 0);
}

uint64_t sub_24795B2A8()
{
  uint64_t v35 = v0;
  uint64_t v1 = v0[18];
  uint64_t v2 = type metadata accessor for SessionRegistry.SessionInfo(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    uint64_t result = sub_2478A1A1C(v1, &qword_269268C30);
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(void *)(v1 + 16);
    unint64_t v3 = *(void *)(v1 + 24);
    swift_bridgeObjectRetain();
    sub_24796D2F0(v1, type metadata accessor for SessionRegistry.SessionInfo);
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    uint64_t v5 = v0[15];
    uint64_t v7 = v0[11];
    uint64_t v6 = v0[12];
    uint64_t v8 = v0[6];
    uint64_t v9 = sub_247999030();
    __swift_project_value_buffer(v9, (uint64_t)qword_26927FC68);
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    v0[28] = v10;
    v0[29] = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v10(v5, v8, v7);
    swift_bridgeObjectRetain_n();
    uint64_t v11 = sub_247999010();
    os_log_type_t v12 = sub_2479996B0();
    BOOL v13 = os_log_type_enabled(v11, v12);
    uint64_t v14 = v0[15];
    uint64_t v16 = v0[11];
    uint64_t v15 = v0[12];
    if (v13)
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v34 = v33;
      *(_DWORD *)uint64_t v17 = 136315394;
      uint64_t v18 = sub_247998CF0();
      v0[2] = sub_247918FF0(v18, v19, &v34);
      sub_247999720();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
      *(_WORD *)(v17 + 12) = 2080;
      swift_bridgeObjectRetain();
      v0[3] = sub_247918FF0(v4, v3, &v34);
      sub_247999720();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_247896000, v11, v12, "Deleting document:%s from session:%s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v33, -1, -1);
      MEMORY[0x24C564070](v17, -1, -1);
    }
    else
    {
      (*(void (**)(void, void))(v15 + 8))(v0[15], v0[11]);
      swift_bridgeObjectRelease_n();
    }
    uint64_t v20 = v0[10];
    uint64_t v21 = v0[7];
    uint64_t v22 = v0[5];
    v0[30] = OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_client;
    uint64_t v23 = sub_247998CF0();
    sub_2479701A8(v4, v3, v23, v24, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v25 = sub_2479037AC();
    uint64_t v27 = v26;
    v0[31] = v26;
    uint64_t v28 = *(void *)(v21 + 144);
    uint64_t v29 = *(void *)(v21 + 152);
    uint64_t v30 = (void *)swift_task_alloc();
    v0[32] = v30;
    *uint64_t v30 = v0;
    v30[1] = sub_24795B690;
    uint64_t v31 = v0[4];
    return sub_24796F0F0(v25, v27, v28, v29, v31, v22);
  }
  return result;
}

uint64_t sub_24795B690(uint64_t a1)
{
  unint64_t v3 = (void *)*v1;
  uint64_t v4 = (void *)*v1;
  v3[33] = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, char, char, uint64_t, uint64_t, char))((char *)&dword_269268478
                                                                                    + dword_269268478);
  uint64_t v5 = (void *)swift_task_alloc();
  v3[34] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_24795B858;
  uint64_t v6 = v3[10];
  return v8((uint64_t)v8, v6, 1, 2, a1, 0, 1);
}

uint64_t sub_24795B858()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 72);
  *(void *)(*v1 + 280) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = sub_24795BB74;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 80);
    uint64_t v6 = *(void *)(v2 + 64);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v6);
    uint64_t v4 = sub_24795B9C8;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24795B9C8()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 224);
  uint64_t v2 = *(void *)(v0 + 152);
  uint64_t v18 = *(void *)(v0 + 160);
  uint64_t v16 = *(void *)(v0 + 168);
  uint64_t v17 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v15 = *(void *)(v0 + 104);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v6 = *(void *)(v0 + 48);
  (*(void (**)(void))(v0 + 184))();
  v1(v3, v6, v5);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v7 = sub_2479994F0();
  unint64_t v8 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v9 = (v15 + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8F500];
  *(void *)(v10 + 16) = v7;
  *(void *)(v10 + 24) = v11;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v10 + v8, v3, v5);
  os_log_type_t v12 = (void *)(v10 + v9);
  *os_log_type_t v12 = v18;
  v12[1] = v16;
  *(void *)(v10 + ((v9 + 23) & 0xFFFFFFFFFFFFFFF8)) = v2;
  sub_24794C41C(v17, (uint64_t)&unk_269268D88, v10);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  BOOL v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_24795BB74()
{
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24795BC3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[42] = v27;
  v9[43] = v8;
  v9[40] = v25;
  v9[41] = v26;
  v9[38] = a8;
  v9[39] = v24;
  v9[36] = a6;
  v9[37] = a7;
  v9[34] = a4;
  v9[35] = a5;
  v9[32] = a2;
  v9[33] = a3;
  v9[31] = a1;
  uint64_t v12 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268C10) - 8);
  v9[44] = v12;
  v9[45] = *(void *)(v12 + 64);
  v9[46] = swift_task_alloc();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C18);
  v9[47] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v9[48] = v14;
  v9[49] = *(void *)(v14 + 64);
  v9[50] = swift_task_alloc();
  v9[51] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C20);
  v9[52] = swift_task_alloc();
  uint64_t v15 = sub_247998400();
  v9[53] = v15;
  v9[54] = *(void *)(v15 - 8);
  v9[55] = swift_task_alloc();
  uint64_t v16 = _s15InstrumentationVMa();
  v9[56] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v9[57] = v17;
  v9[58] = *(void *)(v17 + 64);
  v9[59] = swift_task_alloc();
  v9[60] = swift_task_alloc();
  uint64_t v18 = sub_247998240();
  v9[61] = v18;
  v9[62] = *(void *)(v18 - 8);
  v9[63] = swift_task_alloc();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C28);
  v9[64] = v19;
  v9[65] = *(void *)(v19 - 8);
  v9[66] = swift_task_alloc();
  v9[67] = swift_task_alloc();
  v9[68] = swift_task_alloc();
  uint64_t v20 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269266F78) - 8);
  v9[69] = v20;
  v9[70] = *(void *)(v20 + 64);
  v9[71] = swift_task_alloc();
  v9[72] = swift_task_alloc();
  v9[73] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  v9[74] = swift_task_alloc();
  v9[75] = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C30);
  v9[76] = swift_task_alloc();
  v9[77] = swift_task_alloc();
  uint64_t v21 = (void *)swift_task_alloc();
  v9[78] = v21;
  *uint64_t v21 = v9;
  v21[1] = sub_24795C0BC;
  return sub_247958460(v26, a2, a3);
}

uint64_t sub_24795C0BC()
{
  uint64_t v2 = (void *)*v1;
  v2[79] = v0;
  swift_task_dealloc();
  if (v0)
  {
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = (uint64_t (*)(void))v2[1];
    return v3();
  }
  else
  {
    uint64_t v5 = v2[43];
    return MEMORY[0x270FA2498](sub_24795C2F8, v5, 0);
  }
}

uint64_t sub_24795C2F8()
{
  uint64_t v1 = v0[43];
  v0[80] = *(void *)(v1 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_registry);
  v0[81] = *(void *)(v1 + 112);
  v0[82] = *(void *)(v1 + 120);
  return MEMORY[0x270FA2498](sub_24795C338, 0, 0);
}

uint64_t sub_24795C338()
{
  uint64_t v1 = v0[82];
  uint64_t v2 = v0[81];
  uint64_t v3 = v0[80];
  uint64_t v4 = v0[74];
  uint64_t v5 = sub_247999520();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  sub_247999500();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v6 = sub_2479994F0();
  uint64_t v7 = (void *)swift_allocObject();
  uint64_t v8 = MEMORY[0x263F8F500];
  v7[2] = v6;
  v7[3] = v8;
  v7[4] = v2;
  v7[5] = v1;
  v7[6] = v3;
  uint64_t v9 = sub_24794C5C8(v4, (uint64_t)&unk_269268C38, (uint64_t)v7, (uint64_t)&unk_26FBE4640, &qword_269268C30);
  v0[83] = v9;
  uint64_t v10 = (void *)swift_task_alloc();
  v0[84] = v10;
  void *v10 = v0;
  v10[1] = sub_24795C4D0;
  uint64_t v11 = v0[77];
  uint64_t v12 = v0[75];
  return MEMORY[0x270FA1FD0](v11, v9, v12);
}

uint64_t sub_24795C4D0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 344);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24795C5FC, v1, 0);
}

uint64_t sub_24795C5FC()
{
  uint64_t v1 = v0[76];
  sub_2478E6A48(v0[77], v1, &qword_269268C30);
  uint64_t v2 = type metadata accessor for SessionRegistry.SessionInfo(0);
  int v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2);
  uint64_t v4 = v0[76];
  if (v3 == 1)
  {
    sub_2478A1A1C(v0[76], &qword_269268C30);
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v5 = *(void *)(v4 + 16);
    uint64_t v6 = *(void *)(v4 + 24);
    swift_bridgeObjectRetain();
    sub_24796D2F0(v4, type metadata accessor for SessionRegistry.SessionInfo);
  }
  v0[86] = v6;
  v0[85] = v5;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[87] = v7;
  void *v7 = v0;
  v7[1] = sub_24795C754;
  uint64_t v8 = v0[82];
  uint64_t v9 = v0[81];
  uint64_t v10 = v0[37];
  uint64_t v11 = v0[32];
  uint64_t v12 = v0[33];
  return sub_247963BBC(v9, v8, v11, v12, v10);
}

uint64_t sub_24795C754(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 344);
  *(void *)(v3 + 704) = a1;
  *(void *)(v3 + 712) = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24795C870, v4, 0);
}

uint64_t sub_24795C870()
{
  uint64_t v25 = *(void *)(v0 + 704);
  uint64_t v26 = *(void *)(v0 + 712);
  uint64_t v27 = *(void *)(v0 + 632);
  uint64_t v1 = *(void *)(v0 + 584);
  uint64_t v2 = *(void *)(v0 + 336);
  long long v23 = *(_OWORD *)(v0 + 320);
  uint64_t v3 = *(void *)(v0 + 304);
  uint64_t v24 = *(void *)(v0 + 312);
  uint64_t v5 = *(void *)(v0 + 288);
  uint64_t v4 = *(void *)(v0 + 296);
  *(void *)(v0 + 720) = OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_authenticator;
  uint64_t v6 = *(void *)(v0 + 256);
  uint64_t v7 = *(void *)(v0 + 264);
  OpenAIAuthenticator.credentials.getter(v1);
  *(void *)(v0 + 728) = OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_provider;
  sub_247970424(v6, v7, v25, v26, v5, v4, v3, v24, (uint64_t *)(v0 + 16), v23, *((uint64_t *)&v23 + 1), v2);
  *(void *)(v0 + 736) = v27;
  if (v27)
  {
    uint64_t v8 = *(void *)(v0 + 616);
    uint64_t v9 = *(void *)(v0 + 584);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2478A1A1C(v9, &qword_269266F78);
    sub_2478A1A1C(v8, &qword_269268C30);
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 344);
    uint64_t v13 = *(void *)(v0 + 264);
    swift_bridgeObjectRelease();
    _s7SessionC12ResponseInfoCMa();
    uint64_t v14 = (void *)swift_allocObject();
    *(void *)(v0 + 744) = v14;
    swift_defaultActor_initialize();
    v14[14] = 0;
    v14[15] = 0;
    uint64_t v15 = MEMORY[0x263F8EE80];
    v14[16] = MEMORY[0x263F8EE80];
    v14[17] = v15;
    v14[18] = v15;
    uint64_t v16 = sub_2479037AC();
    uint64_t v18 = v17;
    *(void *)(v0 + 752) = v17;
    uint64_t v19 = *(void *)(v12 + 144);
    uint64_t v20 = *(void *)(v12 + 152);
    uint64_t v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 760) = v21;
    *uint64_t v21 = v0;
    v21[1] = sub_24795CB88;
    uint64_t v22 = *(void *)(v0 + 256);
    return sub_24796F0F0(v16, v18, v19, v20, v22, v13);
  }
}

uint64_t sub_24795CB88(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 344);
  *(void *)(*(void *)v1 + 768) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24795CCBC, v2, 0);
}

uint64_t sub_24795CCBC()
{
  uint64_t v1 = v0[43];
  swift_retain();
  v0[28] = sub_2478FAFE4(MEMORY[0x263F8EE78]);
  v0[29] = sub_24796D684;
  v0[30] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[97] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24795CD88;
  return sub_247978B3C((uint64_t)&unk_26FBDF2C8);
}

uint64_t sub_24795CD88(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 344);
  *(void *)(*(void *)v1 + 784) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24795CEA0, v2, 0);
}

uint64_t sub_24795CEA0()
{
  uint64_t v1 = *(void *)(v0 + 688);
  uint64_t v2 = *(void *)(v0 + 504);
  uint64_t v3 = sub_247914C20(*(void *)(v0 + 768), *(void *)(v0 + 784));
  *(void *)(v0 + 792) = v3;
  sub_247975954(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_247998680();
  char v6 = v5 & 1;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, _OWORD *, uint64_t, uint64_t, char))((char *)&dword_269268C40
                                                                                   + dword_269268C40);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 800) = v7;
  void *v7 = v0;
  v7[1] = sub_24795CFEC;
  uint64_t v8 = *(void *)(v0 + 536);
  uint64_t v9 = *(void *)(v0 + 504);
  return v11(v8, v9, (_OWORD *)(v0 + 16), v3, v4, v6);
}

uint64_t sub_24795CFEC()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 808) = v0;
  swift_task_dealloc();
  uint64_t v3 = v2[63];
  uint64_t v4 = v2[62];
  uint64_t v5 = v2[61];
  uint64_t v6 = v2[43];
  swift_bridgeObjectRelease();
  if (v0)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v7 = sub_24795D914;
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v7 = sub_24795D1BC;
  }
  return MEMORY[0x270FA2498](v7, v6, 0);
}

uint64_t sub_24795D1BC()
{
  uint64_t v60 = *(void *)(v0 + 576);
  uint64_t v2 = *(void *)(v0 + 472);
  uint64_t v1 = *(void *)(v0 + 480);
  uint64_t v4 = *(void *)(v0 + 440);
  uint64_t v3 = *(void *)(v0 + 448);
  uint64_t v6 = *(void *)(v0 + 424);
  uint64_t v5 = *(void *)(v0 + 432);
  uint64_t v62 = *(void **)(v0 + 808);
  uint64_t v7 = *(void *)(v0 + 272);
  (*(void (**)(void, void, void))(*(void *)(v0 + 520) + 32))(*(void *)(v0 + 544), *(void *)(v0 + 536), *(void *)(v0 + 512));
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v8(v4, v7, v6);
  v8(v2, v4, v6);
  sub_247999060();
  swift_allocObject();
  uint64_t v9 = sub_247999050();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  *(void *)(v2 + *(int *)(v3 + 20)) = v9;
  sub_24796CCB4(v2, v1, (uint64_t (*)(void))_s15InstrumentationVMa);
  OpenAIAuthenticator.credentials.getter(v60);
  uint64_t v10 = swift_task_alloc();
  *(void *)(v10 + 16) = v1;
  *(void *)(v10 + 24) = v60;
  sub_247999040();
  if (v62)
  {

    unsigned int v38 = 1;
  }
  else
  {
    unsigned int v38 = 0;
  }
  uint64_t v57 = *(void *)(v0 + 744);
  uint64_t v54 = *(void *)(v0 + 616);
  uint64_t v11 = *(void *)(v0 + 584);
  uint64_t v12 = *(void *)(v0 + 576);
  uint64_t v53 = v11;
  uint64_t v59 = *(void *)(v0 + 568);
  uint64_t v44 = *(void *)(v0 + 560);
  uint64_t v42 = *(void *)(v0 + 552);
  uint64_t v13 = *(void *)(v0 + 544);
  uint64_t v14 = *(void *)(v0 + 528);
  uint64_t v15 = *(void *)(v0 + 520);
  uint64_t v52 = v15;
  uint64_t v16 = *(void *)(v0 + 512);
  uint64_t v47 = v16;
  uint64_t v58 = *(void *)(v0 + 480);
  uint64_t v63 = *(void *)(v0 + 472);
  uint64_t v55 = *(void *)(v0 + 464);
  uint64_t v43 = *(void *)(v0 + 456);
  uint64_t v17 = *(void *)(v0 + 416);
  uint64_t v51 = *(void *)(v0 + 400);
  uint64_t v48 = *(void *)(v0 + 408);
  uint64_t v49 = *(void *)(v0 + 384);
  uint64_t v18 = *(void *)(v0 + 368);
  uint64_t v50 = *(void *)(v0 + 376);
  uint64_t v61 = v18;
  uint64_t v40 = *(void *)(v0 + 352);
  uint64_t v41 = *(void *)(v0 + 360);
  uint64_t v45 = *(void *)(v0 + 344);
  uint64_t v46 = *(void *)(v0 + 328);
  uint64_t v37 = *(void *)(v0 + 280);
  swift_task_dealloc();
  uint64_t v19 = sub_247998D70();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, v38, 1, v19);
  sub_2478A1A1C(v17, &qword_269268C20);
  sub_2478A1A1C(v12, &qword_269266F78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v14, v13, v16);
  sub_2478E6A48(v11, v59, &qword_269266F78);
  sub_2478E6A48(v37, v18, &qword_269268C10);
  sub_24796A7FC(v58, v63, (uint64_t (*)(void))_s15InstrumentationVMa);
  uint64_t v39 = *(void *)(v0 + 240);
  unint64_t v20 = (*(unsigned __int8 *)(v42 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  unint64_t v21 = (v44 + *(unsigned __int8 *)(v40 + 80) + v20) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  unint64_t v22 = (v41 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v23 = (v22 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v24 = (*(unsigned __int8 *)(v43 + 80) + v23 + 8) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v45;
  uint64_t v26 = v25 + v20;
  uint64_t v27 = v25 + v21;
  unint64_t v28 = v25 + ((v55 + v24 + 7) & 0xFFFFFFFFFFFFFFF8);
  long long v56 = *(_OWORD *)(v0 + 224);
  sub_2478F5268(v59, v26, &qword_269266F78);
  sub_2478F5268(v61, v27, &qword_269268C10);
  *(void *)(v25 + v22) = v57;
  *(void *)(v25 + v23) = v46;
  sub_24796CCB4(v63, v25 + v24, (uint64_t (*)(void))_s15InstrumentationVMa);
  *(_OWORD *)unint64_t v28 = v56;
  *(void *)(v28 + 16) = v39;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C58);
  sub_2478A23F4(&qword_269268C60, &qword_269268C28);
  sub_247999B40();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C68);
  uint64_t v29 = swift_allocBox();
  uint64_t v31 = v30;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C70);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v31, 1, 1, v32);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v51, v48, v50);
  unint64_t v33 = (*(unsigned __int8 *)(v49 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = v29;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v49 + 32))(v34 + v33, v51, v50);
  swift_retain();
  sub_2479995F0();
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v50);
  swift_release();
  sub_247969840((void *)(v0 + 16));
  swift_release();
  sub_24796D2F0(v58, (uint64_t (*)(void))_s15InstrumentationVMa);
  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v13, v47);
  swift_bridgeObjectRelease();
  swift_release();
  sub_2478A1A1C(v53, &qword_269266F78);
  sub_2478A1A1C(v54, &qword_269268C30);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
  return v35();
}

uint64_t sub_24795D914()
{
  uint64_t v1 = v0[77];
  uint64_t v2 = v0[73];
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_2478A1A1C(v2, &qword_269266F78);
  sub_2478A1A1C(v1, &qword_269268C30);
  sub_247969840(v0 + 2);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24795DABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[79] = v16;
  v8[78] = a8;
  v8[77] = a7;
  v8[76] = a6;
  v8[75] = a5;
  v8[74] = a4;
  v8[73] = a3;
  v8[72] = a2;
  v8[71] = a1;
  uint64_t v9 = sub_247998500();
  v8[80] = v9;
  v8[81] = *(void *)(v9 - 8);
  v8[82] = swift_task_alloc();
  sub_2479985D0();
  v8[83] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C20);
  v8[84] = swift_task_alloc();
  v8[85] = swift_task_alloc();
  uint64_t v10 = sub_247998D10();
  v8[86] = v10;
  v8[87] = *(void *)(v10 - 8);
  v8[88] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C98);
  v8[89] = swift_task_alloc();
  sub_247998590();
  v8[90] = swift_task_alloc();
  uint64_t v11 = sub_247998570();
  v8[91] = v11;
  v8[92] = *(void *)(v11 - 8);
  v8[93] = swift_task_alloc();
  v8[94] = swift_task_alloc();
  v8[95] = _s14TextAnnotationV11URLCitationVMa(0);
  v8[96] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  v8[97] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  v8[98] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268280);
  v8[99] = swift_task_alloc();
  uint64_t v12 = _s9ChatChunkO10RateLimitsVMa(0);
  v8[100] = v12;
  v8[101] = *(void *)(v12 - 8);
  v8[102] = swift_task_alloc();
  v8[103] = swift_task_alloc();
  v8[104] = swift_task_alloc();
  _s18ImageGeneratorCallV5ImageVMa(0);
  v8[105] = swift_task_alloc();
  v8[106] = swift_task_alloc();
  uint64_t v13 = sub_247998240();
  v8[107] = v13;
  v8[108] = *(void *)(v13 - 8);
  v8[109] = swift_task_alloc();
  v8[110] = _s9ChatChunkO28ImageGeneratorCallImageAddedVMa(0);
  v8[111] = swift_task_alloc();
  v8[112] = swift_task_alloc();
  v8[113] = _s14TextAnnotationV4TypeOMa(0);
  v8[114] = swift_task_alloc();
  _s14TextAnnotationVMa(0);
  v8[115] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268CA0);
  v8[116] = swift_task_alloc();
  v8[117] = swift_task_alloc();
  v8[118] = swift_task_alloc();
  v8[119] = _s9ChatChunkO19TextValueAnnotationVMa(0);
  v8[120] = swift_task_alloc();
  v8[121] = swift_task_alloc();
  v8[122] = swift_task_alloc();
  v8[123] = _s9ChatChunkO14ChoiceResourceVMa(0);
  v8[124] = swift_task_alloc();
  v8[125] = swift_task_alloc();
  sub_247998560();
  v8[126] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269266F78);
  v8[127] = swift_task_alloc();
  v8[128] = _s21CreateSessionResponseVMa(0);
  v8[129] = swift_task_alloc();
  v8[130] = _s9ChatChunkOMa(0);
  v8[131] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24795E134, 0, 0);
}

uint64_t sub_24795E134()
{
  long long v198 = v0;
  sub_24796A7FC(v0[72], v0[131], _s9ChatChunkOMa);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v1 = (uint64_t *)v0[129];
      uint64_t v2 = v0[127];
      uint64_t v3 = v0[74];
      uint64_t v4 = (void *)v0[73];
      sub_24796CCB4(v0[131], (uint64_t)v1, _s21CreateSessionResponseVMa);
      uint64_t v5 = v4[15];
      uint64_t v186 = *(void *)((char *)v4 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_registry);
      uint64_t v188 = v4[14];
      uint64_t v190 = v4[18];
      uint64_t v180 = v4[19];
      uint64_t v6 = v4[16];
      uint64_t v7 = v4[17];
      uint64_t v8 = *v1;
      uint64_t v9 = v1[1];
      uint64_t v182 = v8;
      uint64_t v183 = v6;
      sub_2478E6A48(v3, v2, &qword_269266F78);
      uint64_t v10 = type metadata accessor for OpenAIAuthenticator.Credentials(0);
      LODWORD(v2) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v2, 1, v10);
      uint64_t v11 = v9;
      swift_bridgeObjectRetain();
      uint64_t v12 = v0[127];
      if (v2 == 1)
      {
        sub_2478A1A1C(v0[127], &qword_269266F78);
        uint64_t v179 = 0;
        uint64_t v13 = 0;
      }
      else
      {
        uint64_t v179 = OpenAIAuthenticator.Credentials.credentialsID.getter();
        uint64_t v13 = v90;
        sub_24796D2F0(v12, type metadata accessor for OpenAIAuthenticator.Credentials);
      }
      uint64_t v91 = v0[98];
      sub_2478E6A48(v0[75], v91, &qword_269268C10);
      uint64_t v92 = sub_247998B20();
      uint64_t v93 = *(void *)(v92 - 8);
      int v94 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v93 + 48))(v91, 1, v92);
      uint64_t v95 = v0[98];
      if (v94 == 1)
      {
        sub_2478A1A1C(v0[98], &qword_269268C10);
        int v178 = 0;
      }
      else
      {
        int v178 = sub_247998B10();
        (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v95, v92);
      }
      uint64_t v128 = v0[129];
      int64_t v129 = (uint64_t *)(v128 + *(int *)(v0[128] + 32));
      uint64_t v130 = *(unsigned __int8 *)v129;
      double v131 = 0.0;
      if (v130 != 2) {
        double v131 = (double)v129[1];
      }
      BOOL v177 = v130 == 2;
      BOOL loga = v94 == 1;
      uint64_t v132 = v0[97];
      uint64_t v133 = sub_247999520();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v133 - 8) + 56))(v132, 1, 1, v133);
      sub_247999500();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v134 = sub_2479994F0();
      uint64_t v135 = swift_allocObject();
      uint64_t v136 = MEMORY[0x263F8F500];
      *(void *)(v135 + 16) = v134;
      *(void *)(v135 + 24) = v136;
      *(void *)(v135 + 32) = v183;
      *(void *)(v135 + 40) = v7;
      *(void *)(v135 + 48) = v182;
      *(void *)(v135 + 56) = v11;
      *(void *)(v135 + 64) = v188;
      *(void *)(v135 + 72) = v5;
      *(void *)(v135 + 80) = v186;
      *(void *)(v135 + 88) = v190;
      *(void *)(v135 + 96) = v180;
      *(void *)(v135 + 104) = v179;
      *(void *)(v135 + 112) = v13;
      *(_DWORD *)(v135 + 120) = v178;
      *(unsigned char *)(v135 + 124) = loga;
      *(double *)(v135 + 128) = v131;
      *(unsigned char *)(v135 + 136) = v177;
      sub_24794C41C(v132, (uint64_t)&unk_269268CD0, v135);
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v18 = _s21CreateSessionResponseVMa;
      uint64_t v17 = v128;
      goto LABEL_66;
    case 1u:
      uint64_t v14 = (void *)v0[131];
      uint64_t v15 = v0[76];
      v0[132] = *v14;
      v0[133] = v14[1];
      v0[134] = v14[3];
      v0[135] = v14[5];
      v0[136] = v14[6];
      v0[137] = v14[7];
      v0[138] = v14[8];
      v0[139] = v14[9];
      v0[140] = v14[10];
      v0[141] = v14[11];
      v0[142] = v14[12];
      v0[143] = v14[13];
      uint64_t v16 = sub_24795FD44;
      goto LABEL_27;
    case 3u:
      uint64_t v19 = (void *)v0[131];
      v0[182] = v19[1];
      v0[183] = v19[3];
      v0[184] = v19[5];
      v0[185] = v19[7];
      v0[186] = v19[8];
      v0[187] = v19[9];
      v0[188] = v19[10];
      uint64_t v20 = v19[11];
      v0[189] = v20;
      v0[190] = v19[12];
      v0[191] = v19[13];
      if (qword_269266AA0 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_247999030();
      __swift_project_value_buffer(v21, (uint64_t)qword_26927FC68);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2478A1ACC(v20);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v181 = v20;
      sub_2478A1ACC(v20);
      unint64_t v22 = sub_247999010();
      os_log_type_t v23 = sub_2479996B0();
      log = v22;
      if (os_log_type_enabled(v22, v23))
      {
        unint64_t v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v174 = swift_slowAlloc();
        v197[0] = v174;
        *(_DWORD *)unint64_t v24 = 136315138;
        uint64_t v25 = swift_bridgeObjectRetain();
        uint64_t v26 = MEMORY[0x24C562FA0](v25, &_s9ChatChunkO6NoticeVN);
        unint64_t v28 = v27;
        swift_bridgeObjectRelease();
        v0[69] = sub_247918FF0(v26, v28, v197);
        sub_247999720();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_2478A1B10(v181);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v29 = v181;
        sub_2478A1B10(v181);
        _os_log_impl(&dword_247896000, log, v23, "Received response notices: %s", v24, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C564070](v174, -1, -1);
        MEMORY[0x24C564070](v24, -1, -1);

        if (v181)
        {
LABEL_10:
          sub_2478A1ACC(v29);
          swift_bridgeObjectRetain();
          goto LABEL_41;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_2478A1B10(v181);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_2478A1B10(v181);

        uint64_t v29 = v181;
        if (v181) {
          goto LABEL_10;
        }
      }
      uint64_t v29 = MEMORY[0x263F8EE78];
LABEL_41:
      v0[207] = v29;
      uint64_t v96 = *(void *)(v29 + 16);
      v0[208] = v96;
      if (v96)
      {
        v0[209] = 0;
        uint64_t v97 = *(void *)(v29 + 40);
        uint64_t v98 = *(void *)(v29 + 48);
        uint64_t v99 = *(unsigned __int8 *)(v29 + 32);
        v0[210] = v98;
        uint64_t v192 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_269269198 + dword_269269198);
        swift_bridgeObjectRetain();
        uint64_t v100 = (void *)swift_task_alloc();
        v0[211] = v100;
        *uint64_t v100 = v0;
        v100[1] = sub_247962ED4;
        uint64_t v101 = v0[79];
        return v192(v97, v98, v99, v101);
      }
      else
      {
        uint64_t v147 = v0[189];
        swift_bridgeObjectRelease();
        if (v147 && (uint64_t v148 = v0[191], swift_bridgeObjectRelease(), v148))
        {
          unint64_t v149 = v0[191];
          uint64_t v150 = v0[190];
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v150 = 0;
          unint64_t v149 = 0xE000000000000000;
        }
        v0[212] = v149;
        uint64_t v196 = (uint64_t (*)(uint64_t, unint64_t))((char *)&dword_269269190 + dword_269269190);
        uint64_t v151 = (void *)swift_task_alloc();
        v0[213] = v151;
        *uint64_t v151 = v0;
        v151[1] = sub_2479631A8;
        return v196(v150, v149);
      }
    case 4u:
      uint64_t v30 = (void *)v0[125];
      uint64_t v31 = v0[123];
      uint64_t v32 = v0[76];
      sub_24796CCB4(v0[131], (uint64_t)v30, _s9ChatChunkO14ChoiceResourceVMa);
      unint64_t v33 = (void *)((char *)v30 + *(int *)(v31 + 20));
      v0[146] = *v33;
      v0[147] = v33[1];
      v0[148] = *v30;
      uint64_t v34 = sub_24796054C;
      goto LABEL_90;
    case 8u:
      uint64_t v35 = v0[76];
      sub_24796CCB4(v0[131], v0[124], _s9ChatChunkO14ChoiceResourceVMa);
      uint64_t v36 = sub_247961620;
      goto LABEL_15;
    case 9u:
      uint64_t v37 = v0[131];
      uint64_t v38 = *(void *)(v37 + 16);
      v0[149] = v38;
      uint64_t v39 = *(void *)(v37 + 24);
      v0[150] = v39;
      uint64_t v40 = *(void *)(v37 + 32);
      v0[151] = v40;
      uint64_t v41 = *(void *)(v37 + 40);
      v0[152] = v41;
      uint64_t v42 = *(void *)(v37 + 48);
      v0[153] = v42;
      uint64_t v43 = *(void *)(v37 + 56);
      v0[154] = v43;
      int v44 = *(unsigned __int8 *)(v37 + 64);
      if (v44 != 1) {
        goto LABEL_20;
      }
      uint64_t v35 = v0[76];
      v0[155] = *(void *)(v37 + 8);
      sub_2478ADE68(v38, v39, v40, v41, v42, v43, 1);
      uint64_t v36 = sub_2479608B4;
LABEL_15:
      uint64_t v45 = v36;
      uint64_t v15 = v35;
      goto LABEL_91;
    case 0xAu:
      uint64_t v46 = v0[131];
      uint64_t v38 = *(void *)(v46 + 16);
      uint64_t v39 = *(void *)(v46 + 24);
      uint64_t v40 = *(void *)(v46 + 32);
      uint64_t v41 = *(void *)(v46 + 40);
      uint64_t v42 = *(void *)(v46 + 48);
      uint64_t v43 = *(void *)(v46 + 56);
      int v44 = *(unsigned __int8 *)(v46 + 64);
      if (v44 == 3 && (v39 | v38 | v40 | v41 | v42 | v43) == 0)
      {
        uint64_t v152 = v0[78];
        _s15InstrumentationVMa();
        *(void *)(swift_task_alloc() + 16) = v152;
        sub_247999040();
        uint64_t v172 = v0[84];
        swift_task_dealloc();
        uint64_t v173 = sub_247998D70();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v173 - 8) + 56))(v172, 0, 1, v173);
        sub_2478A1A1C(v172, &qword_269268C20);
      }
      else
      {
LABEL_20:
        sub_2478AE754(v38, v39, v40, v41, v42, v43, v44);
      }
      goto LABEL_67;
    case 0xDu:
      uint64_t v48 = (void *)v0[131];
      uint64_t v15 = v0[76];
      v0[156] = *v48;
      v0[157] = v48[2];
      v0[158] = v48[3];
      v0[159] = v48[4];
      uint64_t v16 = sub_247960CC0;
      goto LABEL_27;
    case 0xFu:
      sub_24796CCB4(v0[131], v0[122], _s9ChatChunkO19TextValueAnnotationVMa);
      if (qword_269266AA0 != -1) {
        swift_once();
      }
      uint64_t v49 = v0[122];
      uint64_t v50 = v0[121];
      uint64_t v51 = sub_247999030();
      __swift_project_value_buffer(v51, (uint64_t)qword_26927FC68);
      sub_24796A7FC(v49, v50, _s9ChatChunkO19TextValueAnnotationVMa);
      uint64_t v52 = sub_247999010();
      os_log_type_t v53 = sub_2479996B0();
      BOOL v54 = os_log_type_enabled(v52, v53);
      uint64_t v55 = v0[121];
      if (v54)
      {
        uint64_t v56 = v0[120];
        uint64_t v57 = (uint8_t *)swift_slowAlloc();
        uint64_t v58 = swift_slowAlloc();
        v197[0] = v58;
        *(_DWORD *)uint64_t v57 = 136315138;
        sub_24796A7FC(v55, v56, _s9ChatChunkO19TextValueAnnotationVMa);
        uint64_t v59 = sub_247999390();
        v0[65] = sub_247918FF0(v59, v60, v197);
        sub_247999720();
        swift_bridgeObjectRelease();
        sub_24796D2F0(v55, _s9ChatChunkO19TextValueAnnotationVMa);
        _os_log_impl(&dword_247896000, v52, v53, "Received response annotation update: %s", v57, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C564070](v58, -1, -1);
        MEMORY[0x24C564070](v57, -1, -1);
      }
      else
      {
        sub_24796D2F0(v0[121], _s9ChatChunkO19TextValueAnnotationVMa);
      }

      uint64_t v103 = v0[115];
      uint64_t v104 = v0[114];
      sub_24796A7FC(v0[122] + *(int *)(v0[119] + 32), v103, _s14TextAnnotationVMa);
      sub_24796CCB4(v103, v104, _s14TextAnnotationV4TypeOMa);
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        uint64_t v139 = v0[117];
        uint64_t v140 = v0[109];
        uint64_t v141 = v0[108];
        uint64_t v185 = v0[107];
        uint64_t v142 = v0[96];
        uint64_t v143 = v0[95];
        uint64_t v144 = v0[92];
        uint64_t v195 = v0[91];
        sub_24796CCB4(v0[114], v142, _s14TextAnnotationV11URLCitationVMa);
        uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268CC0);
        uint64_t v187 = *(int *)(v145 + 48);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v141 + 16))(v140, v142, v185);
        swift_bridgeObjectRetain();
        sub_2479985B0();
        (*(void (**)(uint64_t, void, uint64_t))(v144 + 104))(v139, *MEMORY[0x263F7F8D0], v195);
        uint64_t v146 = *(void *)(v142 + *(int *)(v143 + 24));
        sub_24796D2F0(v142, _s14TextAnnotationV11URLCitationVMa);
        *(void *)(v139 + v187) = v146;
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v145 - 8) + 56))(v139, 0, 1, v145);
        goto LABEL_85;
      }
      char v105 = (uint64_t *)v0[114];
      uint64_t v106 = v0[77];
      uint64_t v107 = *v105;
      uint64_t v108 = v105[1];
      uint64_t v109 = v105[2];
      uint64_t v110 = *(void *)(v106 + 16);
      if (!v110)
      {
        uint64_t v119 = 1;
        goto LABEL_84;
      }
      uint64_t v184 = v105[2];
      uint64_t v111 = v0[87];
      unint64_t v113 = *(void (**)(void, uint64_t, void))(v111 + 16);
      uint64_t v112 = v111 + 16;
      uint64_t v193 = v113;
      uint64_t v114 = v106 + ((*(unsigned __int8 *)(v112 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v112 + 64));
      uint64_t v115 = *(void *)(v112 + 56);
      swift_bridgeObjectRetain();
      while (2)
      {
        v193(v0[88], v114, v0[86]);
        if (sub_247998CF0() == v107 && v116 == v108)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v118 = sub_247999B80();
          swift_bridgeObjectRelease();
          if ((v118 & 1) == 0)
          {
            (*(void (**)(void, void))(v112 - 8))(v0[88], v0[86]);
            v114 += v115;
            if (!--v110)
            {
              swift_bridgeObjectRelease();
              uint64_t v119 = 1;
              goto LABEL_83;
            }
            continue;
          }
        }
        break;
      }
      uint64_t v153 = v0[89];
      uint64_t v154 = v0[88];
      uint64_t v155 = v0[87];
      uint64_t v156 = v0[86];
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v155 + 32))(v153, v154, v156);
      uint64_t v119 = 0;
LABEL_83:
      uint64_t v109 = v184;
LABEL_84:
      uint64_t v157 = v0[117];
      uint64_t v158 = v0[89];
      (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[87] + 56))(v158, v119, 1, v0[86]);
      swift_bridgeObjectRetain();
      sub_247946148(v158, v109, v157);
      sub_2478A1A1C(v158, &qword_269268C98);
      swift_bridgeObjectRelease();
LABEL_85:
      uint64_t v159 = v0[118];
      uint64_t v160 = v0[116];
      sub_2478F5268(v0[117], v159, &qword_269268CA0);
      sub_2478E6A48(v159, v160, &qword_269268CA0);
      uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268CC0);
      int v162 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v161 - 8) + 48))(v160, 1, v161);
      uint64_t v163 = v0[116];
      if (v162 == 1)
      {
        sub_2478A1A1C(v0[116], &qword_269268CA0);
        uint64_t v164 = sub_247999010();
        os_log_type_t v165 = sub_2479996A0();
        if (os_log_type_enabled(v164, v165))
        {
          int64_t v166 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)int64_t v166 = 0;
          _os_log_impl(&dword_247896000, v164, v165, "Failed to convert annotation!", v166, 2u);
          MEMORY[0x24C564070](v166, -1, -1);
        }
        uint64_t v167 = v0[122];
        uint64_t v168 = v0[118];
        uint64_t v137 = v0[71];

        sub_2478A1A1C(v168, &qword_269268CA0);
        sub_24796D2F0(v167, _s9ChatChunkO19TextValueAnnotationVMa);
LABEL_68:
        *(void *)(v137 + 32) = 0;
        *(_OWORD *)uint64_t v137 = 0u;
        *(_OWORD *)(v137 + 16) = 0u;
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
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v138 = (uint64_t (*)(void))v0[1];
        return v138();
      }
      else
      {
        uint64_t v169 = v0[94];
        uint64_t v170 = v0[92];
        uint64_t v171 = v0[91];
        uint64_t v32 = v0[76];
        v0[192] = *(void *)(v163 + *(int *)(v161 + 48));
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v170 + 32))(v169, v163, v171);
        uint64_t v34 = sub_247961B58;
LABEL_90:
        uint64_t v45 = v34;
        uint64_t v15 = v32;
LABEL_91:
        return MEMORY[0x270FA2498](v45, v15, 0);
      }
    case 0x10u:
      uint64_t v61 = (void *)v0[131];
      uint64_t v15 = v0[76];
      v0[163] = *v61;
      v0[164] = v61[1];
      v0[165] = v61[2];
      v0[166] = v61[3];
      uint64_t v16 = sub_2479610E4;
LABEL_27:
      uint64_t v45 = v16;
      goto LABEL_91;
    case 0x16u:
      sub_24796CCB4(v0[131], v0[112], _s9ChatChunkO28ImageGeneratorCallImageAddedVMa);
      if (qword_269266AA0 != -1) {
        swift_once();
      }
      uint64_t v62 = v0[112];
      uint64_t v63 = v0[111];
      uint64_t v64 = sub_247999030();
      v0[170] = __swift_project_value_buffer(v64, (uint64_t)qword_26927FC68);
      sub_24796A7FC(v62, v63, _s9ChatChunkO28ImageGeneratorCallImageAddedVMa);
      uint64_t v65 = sub_247999010();
      os_log_type_t v66 = sub_2479996B0();
      BOOL v67 = os_log_type_enabled(v65, v66);
      uint64_t v68 = v0[111];
      if (v67)
      {
        uint64_t v69 = v0[110];
        os_log_type_t v191 = v66;
        uint64_t v70 = v0[109];
        uint64_t v71 = v0[108];
        uint64_t v72 = v0[107];
        uint64_t v73 = v0[106];
        unint64_t v74 = (uint8_t *)swift_slowAlloc();
        uint64_t v189 = swift_slowAlloc();
        v197[0] = v189;
        *(_DWORD *)unint64_t v74 = 136315138;
        sub_24796A7FC(v68 + *(int *)(v69 + 24), v73, _s18ImageGeneratorCallV5ImageVMa);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v71 + 32))(v70, v73, v72);
        sub_24796D17C((unint64_t *)&qword_269268270, MEMORY[0x263F06EA8]);
        uint64_t v75 = sub_247999B50();
        unint64_t v77 = v76;
        (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v70, v72);
        v0[67] = sub_247918FF0(v75, v77, v197);
        sub_247999720();
        swift_bridgeObjectRelease();
        sub_24796D2F0(v68, _s9ChatChunkO28ImageGeneratorCallImageAddedVMa);
        _os_log_impl(&dword_247896000, v65, v191, "Received image generation update: %s", v74, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C564070](v189, -1, -1);
        MEMORY[0x24C564070](v74, -1, -1);
      }
      else
      {
        sub_24796D2F0(v0[111], _s9ChatChunkO28ImageGeneratorCallImageAddedVMa);
      }

      uint64_t v120 = v0[112];
      uint64_t v121 = v0[110];
      uint64_t v122 = v0[105];
      v0[171] = OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_client;
      sub_24796A7FC(v120 + *(int *)(v121 + 24), v122, _s18ImageGeneratorCallV5ImageVMa);
      uint64_t v194 = (uint64_t (*)(void))((char *)&dword_269266CF8 + dword_269266CF8);
      int64_t v123 = (void *)swift_task_alloc();
      v0[172] = v123;
      *int64_t v123 = v0;
      v123[1] = sub_2479612B0;
      return v194();
    case 0x19u:
      sub_24796CCB4(v0[131], v0[104], _s9ChatChunkO10RateLimitsVMa);
      if (qword_269266AA0 != -1) {
        swift_once();
      }
      uint64_t v78 = v0[104];
      uint64_t v79 = v0[103];
      uint64_t v80 = sub_247999030();
      __swift_project_value_buffer(v80, (uint64_t)qword_26927FC68);
      sub_24796A7FC(v78, v79, _s9ChatChunkO10RateLimitsVMa);
      char v81 = sub_247999010();
      os_log_type_t v82 = sub_247999670();
      BOOL v83 = os_log_type_enabled(v81, v82);
      uint64_t v84 = v0[103];
      if (v83)
      {
        uint64_t v85 = v0[102];
        uint64_t v86 = (uint8_t *)swift_slowAlloc();
        uint64_t v87 = swift_slowAlloc();
        v197[0] = v87;
        *(_DWORD *)uint64_t v86 = 136315138;
        sub_24796A7FC(v84, v85, _s9ChatChunkO10RateLimitsVMa);
        uint64_t v88 = sub_247999390();
        v0[66] = sub_247918FF0(v88, v89, v197);
        sub_247999720();
        swift_bridgeObjectRelease();
        sub_24796D2F0(v84, _s9ChatChunkO10RateLimitsVMa);
        _os_log_impl(&dword_247896000, v81, v82, "Updating rate limits: %s", v86, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C564070](v87, -1, -1);
        MEMORY[0x24C564070](v86, -1, -1);
      }
      else
      {
        sub_24796D2F0(v0[103], _s9ChatChunkO10RateLimitsVMa);
      }

      uint64_t v124 = v0[104];
      uint64_t v125 = v0[101];
      uint64_t v126 = v0[100];
      uint64_t v127 = v0[99];
      sub_24796A7FC(v124, v127, _s9ChatChunkO10RateLimitsVMa);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v125 + 56))(v127, 0, 1, v126);
      sub_24790A1EC(v127);
      sub_2478A1A1C(v127, &qword_269268280);
      uint64_t v18 = _s9ChatChunkO10RateLimitsVMa;
      uint64_t v17 = v124;
      goto LABEL_66;
    default:
      uint64_t v17 = v0[131];
      uint64_t v18 = _s9ChatChunkOMa;
LABEL_66:
      sub_24796D2F0(v17, v18);
LABEL_67:
      uint64_t v137 = v0[71];
      goto LABEL_68;
  }
}

uint64_t sub_24795FD44()
{
  uint64_t v1 = v0[133];
  uint64_t v2 = v0[76];
  *(void *)(v2 + 112) = v0[132];
  *(void *)(v2 + 120) = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24795FDC4, 0, 0);
}

uint64_t sub_24795FDC4()
{
  uint64_t v15 = v0;
  if (qword_269266AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[141];
  uint64_t v2 = sub_247999030();
  __swift_project_value_buffer(v2, (uint64_t)qword_26927FC68);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2478A1ACC(v1);
  uint64_t v3 = sub_247999010();
  os_log_type_t v4 = sub_2479996B0();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = v0[141];
  unint64_t v7 = v0[137];
  if (v5)
  {
    uint64_t v8 = v0[136];
    uint64_t v13 = v0[141];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v14 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain();
    v0[70] = sub_247918FF0(v8, v7, &v14);
    sub_247999720();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2478A1B10(v13);
    _os_log_impl(&dword_247896000, v3, v4, "Received response model info: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v10, -1, -1);
    MEMORY[0x24C564070](v9, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2478A1B10(v6);
  }

  uint64_t v11 = v0[76];
  return MEMORY[0x270FA2498](sub_2479600C8, v11, 0);
}

uint64_t sub_2479600C8()
{
  uint64_t v1 = v0[76];
  v0[144] = *(void *)(v1 + 112);
  v0[145] = *(void *)(v1 + 120);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_247960144, 0, 0);
}

uint64_t sub_247960144()
{
  uint64_t v6 = v0[141];
  uint64_t v1 = (uint64_t *)v0[71];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268CC8);
  sub_247998540();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_24799A920;
  swift_bridgeObjectRetain();
  sub_2478FAEAC(MEMORY[0x263F8EE78]);
  sub_247998530();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2478A1B10(v6);
  sub_247998550();
  uint64_t v2 = sub_247998880();
  uint64_t v3 = MEMORY[0x263F7FA30];
  v1[3] = v2;
  v1[4] = v3;
  __swift_allocate_boxed_opaque_existential_1(v1);
  sub_247998870();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24796054C()
{
  uint64_t v1 = v0[148];
  uint64_t v2 = v0[147];
  uint64_t v3 = v0[146];
  uint64_t v4 = v0[76];
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *(void *)(v4 + 128);
  *(void *)(v4 + 128) = 0x8000000000000000;
  sub_24791D3DC(v3, v2, v1, isUniquelyReferenced_nonNull_native);
  *(void *)(v4 + 128) = v7;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return MEMORY[0x270FA2498](sub_24796063C, 0, 0);
}

uint64_t sub_24796063C()
{
  sub_24796D2F0(v0[125], _s9ChatChunkO14ChoiceResourceVMa);
  uint64_t v1 = v0[71];
  *(_OWORD *)uint64_t v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(void *)(v1 + 32) = 0;
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_2479608B4()
{
  uint64_t v1 = v0[155];
  uint64_t v10 = v0[153];
  uint64_t v11 = v0[154];
  uint64_t v2 = v0[152];
  uint64_t v3 = v0[151];
  uint64_t v4 = v0[150];
  uint64_t v5 = v0[149];
  uint64_t v6 = v0[76];
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = *(void *)(v6 + 136);
  *(void *)(v6 + 136) = 0x8000000000000000;
  sub_24791D3DC(v5, v4, v1, isUniquelyReferenced_nonNull_native);
  *(void *)(v6 + 136) = v12;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char v8 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *(void *)(v6 + 144);
  *(void *)(v6 + 144) = 0x8000000000000000;
  sub_24791D3DC(v3, v2, v1, v8);
  *(void *)(v6 + 144) = v13;
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_2478AE754(v5, v4, v3, v2, v10, v11, 1);
  return MEMORY[0x270FA2498](sub_247960A44, 0, 0);
}

uint64_t sub_247960A44()
{
  sub_2478AE754(v0[149], v0[150], v0[151], v0[152], v0[153], v0[154], 1);
  uint64_t v1 = v0[71];
  *(void *)(v1 + 32) = 0;
  *(_OWORD *)uint64_t v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_247960CC0()
{
  uint64_t v1 = v0[76];
  v0[160] = *(void *)(v1 + 112);
  v0[161] = *(void *)(v1 + 120);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_247960D3C, v1, 0);
}

uint64_t sub_247960D3C()
{
  uint64_t v1 = *(void *)(v0 + 608);
  swift_beginAccess();
  *(void *)(v0 + 1296) = *(void *)(v1 + 128);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_247960DC4, 0, 0);
}

uint64_t sub_247960DC4()
{
  if (*(void *)(v0[162] + 16))
  {
    sub_24791800C(v0[156]);
    if (v1) {
      swift_bridgeObjectRetain();
    }
  }
  uint64_t v2 = (uint64_t *)v0[71];
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_2479988E0();
  uint64_t v4 = MEMORY[0x263F7FA60];
  v2[3] = v3;
  v2[4] = v4;
  __swift_allocate_boxed_opaque_existential_1(v2);
  sub_2479988D0();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_2479610E4()
{
  uint64_t v1 = v0[76];
  v0[167] = *(void *)(v1 + 112);
  v0[168] = *(void *)(v1 + 120);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_247961160, v1, 0);
}

uint64_t sub_247961160()
{
  uint64_t v1 = *(void *)(v0 + 608);
  swift_beginAccess();
  *(void *)(v0 + 1352) = *(void *)(v1 + 128);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2479611E8, 0, 0);
}

uint64_t sub_2479611E8()
{
  unint64_t v1 = 0xE90000000000003ELL;
  if (*(void *)(v0[169] + 16) && (unint64_t v2 = sub_24791800C(v0[163]), (v3 & 1) != 0))
  {
    uint64_t v4 = (uint64_t *)(*(void *)(v0[169] + 56) + 16 * v2);
    uint64_t v5 = *v4;
    unint64_t v1 = v4[1];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v5 = 0x6E776F6E6B6E753CLL;
  }
  v0[198] = v1;
  v0[197] = v5;
  uint64_t v6 = v0[76];
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_247962020, v6, 0);
}

uint64_t sub_2479612B0(uint64_t a1)
{
  char v3 = (void *)*v1;
  uint64_t v4 = (void *)*v1;
  v3[173] = a1;
  swift_task_dealloc();
  uint64_t v5 = (void *)swift_task_alloc();
  v3[174] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_247961448;
  uint64_t v6 = v3[105];
  return sub_24789C840(v6, 0, 0xF000000000000000, 1, a1, 0, 1);
}

uint64_t sub_247961448(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  uint64_t v5 = (void *)*v3;
  v5[175] = a1;
  v5[176] = a2;
  v5[177] = v2;
  swift_task_dealloc();
  uint64_t v6 = v4[108];
  uint64_t v7 = v4[107];
  uint64_t v8 = v4[105];
  if (v2)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v7);
    uint64_t v9 = sub_247962B18;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v9 = sub_247962534;
  }
  return MEMORY[0x270FA2498](v9, 0, 0);
}

uint64_t sub_247961620()
{
  unint64_t v1 = (void *)v0[124];
  uint64_t v2 = v0[76];
  v0[178] = *(void *)(v2 + 112);
  v0[179] = *(void *)(v2 + 120);
  v0[180] = *v1;
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2479616A8, v2, 0);
}

uint64_t sub_2479616A8()
{
  uint64_t v1 = *(void *)(v0 + 608);
  swift_beginAccess();
  *(void *)(v0 + 1448) = *(void *)(v1 + 128);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_247961730, 0, 0);
}

uint64_t sub_247961730()
{
  if (*(void *)(v0[181] + 16))
  {
    sub_24791800C(v0[180]);
    if (v1) {
      swift_bridgeObjectRetain();
    }
  }
  uint64_t v2 = v0[124];
  uint64_t v3 = v0[123];
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v2 + *(int *)(v3 + 20) + 32);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v6 = (unsigned __int8 *)(v4 + 80);
    uint64_t v7 = (unsigned int *)MEMORY[0x263F7F878];
    while (1)
    {
      int v8 = *v6;
      v6 += 56;
      if (v8 == 1) {
        break;
      }
      if (!--v5)
      {
        uint64_t v7 = (unsigned int *)MEMORY[0x263F7F870];
        break;
      }
    }
  }
  else
  {
    uint64_t v7 = (unsigned int *)MEMORY[0x263F7F870];
  }
  uint64_t v9 = v0[124];
  uint64_t v10 = (uint64_t *)v0[71];
  (*(void (**)(void, void, void))(v0[81] + 104))(v0[82], *v7, v0[80]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268CB0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24799A920;
  *(void *)(inited + 32) = 0x61756E69746E6F43;
  *(void *)(inited + 40) = 0xEF4C52556E6F6974;
  _s9ChatChunkO6ChoiceVMa(0);
  uint64_t v12 = sub_2479981B0();
  *(void *)(inited + 72) = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v12;
  *(void *)(inited + 56) = v13;
  sub_2478FAEAC(inited);
  uint64_t v14 = sub_2479988C0();
  uint64_t v15 = MEMORY[0x263F7FA58];
  v10[3] = v14;
  v10[4] = v15;
  __swift_allocate_boxed_opaque_existential_1(v10);
  sub_2479988B0();
  sub_24796D2F0(v9, _s9ChatChunkO14ChoiceResourceVMa);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_247961B58()
{
  char v1 = (void *)v0[122];
  uint64_t v2 = v0[76];
  v0[193] = *(void *)(v2 + 112);
  v0[194] = *(void *)(v2 + 120);
  v0[195] = *v1;
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_247961BE0, v2, 0);
}

uint64_t sub_247961BE0()
{
  uint64_t v1 = *(void *)(v0 + 608);
  swift_beginAccess();
  *(void *)(v0 + 1568) = *(void *)(v1 + 128);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_247961C68, 0, 0);
}

uint64_t sub_247961C68()
{
  if (*(void *)(v0[196] + 16))
  {
    sub_24791800C(v0[195]);
    if (v1) {
      swift_bridgeObjectRetain();
    }
  }
  uint64_t v2 = v0[122];
  uint64_t v12 = v0[118];
  uint64_t v3 = v0[94];
  uint64_t v4 = v0[93];
  uint64_t v5 = v0[92];
  uint64_t v6 = v0[91];
  uint64_t v7 = (uint64_t *)v0[71];
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v3, v6);
  sub_247998580();
  uint64_t v8 = sub_247998900();
  uint64_t v9 = MEMORY[0x263F7FA68];
  v7[3] = v8;
  v7[4] = v9;
  __swift_allocate_boxed_opaque_existential_1(v7);
  sub_2479988F0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v6);
  sub_2478A1A1C(v12, &qword_269268CA0);
  sub_24796D2F0(v2, _s9ChatChunkO19TextValueAnnotationVMa);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_247962020()
{
  uint64_t v1 = *(void *)(v0 + 608);
  swift_beginAccess();
  *(void *)(v0 + 1592) = *(void *)(v1 + 136);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2479620A8, 0, 0);
}

uint64_t sub_2479620A8()
{
  unint64_t v1 = 0xE90000000000003ELL;
  if (*(void *)(v0[199] + 16) && (unint64_t v2 = sub_24791800C(v0[164]), (v3 & 1) != 0))
  {
    uint64_t v4 = (uint64_t *)(*(void *)(v0[199] + 56) + 16 * v2);
    uint64_t v5 = *v4;
    unint64_t v1 = v4[1];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v5 = 0x6E776F6E6B6E753CLL;
  }
  v0[201] = v1;
  v0[200] = v5;
  uint64_t v6 = v0[76];
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_247962170, v6, 0);
}

uint64_t sub_247962170()
{
  uint64_t v1 = *(void *)(v0 + 608);
  swift_beginAccess();
  *(void *)(v0 + 1616) = *(void *)(v1 + 144);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2479621F8, 0, 0);
}

uint64_t sub_2479621F8()
{
  if (*(void *)(v0[202] + 16))
  {
    sub_24791800C(v0[164]);
    if (v1) {
      swift_bridgeObjectRetain();
    }
  }
  unint64_t v2 = (uint64_t *)v0[71];
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_247998920();
  uint64_t v4 = MEMORY[0x263F7FA70];
  v2[3] = v3;
  v2[4] = v4;
  __swift_allocate_boxed_opaque_existential_1(v2);
  sub_247998910();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_247962534()
{
  char v1 = (void *)v0[177];
  uint64_t v2 = v0[78];
  _s15InstrumentationVMa();
  *(void *)(swift_task_alloc() + 16) = v2;
  sub_247999040();
  uint64_t v3 = v0[85];
  if (v1)
  {

    swift_task_dealloc();
    uint64_t v4 = sub_247998D70();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v5 = sub_247998D70();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 0, 1, v5);
  }
  uint64_t v6 = v0[76];
  sub_2478A1A1C(v0[85], &qword_269268C20);
  return MEMORY[0x270FA2498](sub_247962698, v6, 0);
}

uint64_t sub_247962698()
{
  char v1 = (void *)v0[112];
  uint64_t v2 = v0[76];
  v0[203] = *(void *)(v2 + 112);
  v0[204] = *(void *)(v2 + 120);
  v0[205] = *v1;
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_247962720, v2, 0);
}

uint64_t sub_247962720()
{
  uint64_t v1 = *(void *)(v0 + 608);
  swift_beginAccess();
  *(void *)(v0 + 1648) = *(void *)(v1 + 128);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2479627A8, 0, 0);
}

uint64_t sub_2479627A8()
{
  if (*(void *)(v0[206] + 16))
  {
    sub_24791800C(v0[205]);
    if (v1) {
      swift_bridgeObjectRetain();
    }
  }
  unint64_t v2 = v0[176];
  uint64_t v3 = v0[175];
  uint64_t v4 = v0[112];
  uint64_t v5 = (uint64_t *)v0[71];
  swift_bridgeObjectRelease();
  sub_2478A06AC(v3, v2);
  sub_2479985C0();
  uint64_t v6 = sub_2479984A0();
  uint64_t v7 = MEMORY[0x263F7F740];
  v5[3] = v6;
  v5[4] = v7;
  __swift_allocate_boxed_opaque_existential_1(v5);
  sub_247998490();
  sub_2478A0704(v3, v2);
  sub_24796D2F0(v4, _s9ChatChunkO28ImageGeneratorCallImageAddedVMa);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_247962B18()
{
  char v1 = *(void **)(v0 + 1416);
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_247999010();
  os_log_type_t v5 = sub_247999690();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 1416);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 544) = v10;
    sub_247999720();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_247896000, v4, v5, "Failed to download generated image. Error: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269266F40);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v8, -1, -1);
    MEMORY[0x24C564070](v7, -1, -1);
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 1416);
  }
  uint64_t v12 = *(void *)(v0 + 896);
  uint64_t v13 = *(void *)(v0 + 568);

  sub_24796D2F0(v12, _s9ChatChunkO28ImageGeneratorCallImageAddedVMa);
  *(_OWORD *)uint64_t v13 = 0u;
  *(_OWORD *)(v13 + 16) = 0u;
  *(void *)(v13 + 32) = 0;
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_247962ED4()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_247962FEC, 0, 0);
}

uint64_t sub_247962FEC()
{
  uint64_t v1 = v0[209] + 1;
  if (v1 == v0[208])
  {
    uint64_t v2 = v0[189];
    swift_bridgeObjectRelease();
    if (v2 && (uint64_t v3 = v0[191], swift_bridgeObjectRelease(), v3))
    {
      unint64_t v4 = v0[191];
      uint64_t v5 = v0[190];
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v5 = 0;
      unint64_t v4 = 0xE000000000000000;
    }
    v0[212] = v4;
    uint64_t v15 = (uint64_t (*)(uint64_t, unint64_t))((char *)&dword_269269190 + dword_269269190);
    uint64_t v13 = (void *)swift_task_alloc();
    v0[213] = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_2479631A8;
    return v15(v5, v4);
  }
  else
  {
    v0[209] = v1;
    uint64_t v6 = v0[207] + 24 * v1;
    uint64_t v8 = *(void *)(v6 + 40);
    uint64_t v7 = *(void *)(v6 + 48);
    uint64_t v9 = *(unsigned __int8 *)(v6 + 32);
    v0[210] = v7;
    uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_269269198 + dword_269269198);
    swift_bridgeObjectRetain();
    uint64_t v10 = (void *)swift_task_alloc();
    v0[211] = v10;
    void *v10 = v0;
    v10[1] = sub_247962ED4;
    uint64_t v11 = v0[79];
    return v14(v8, v7, v9, v11);
  }
}

uint64_t sub_2479631A8()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_2479632C0, 0, 0);
}

uint64_t sub_2479632C0()
{
  uint64_t v1 = v0[186];
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = v0[97];
    uint64_t v3 = v0[73];
    uint64_t v4 = *(void *)(_s9ChatChunkO6ChoiceVMa(0) - 8);
    uint64_t v5 = (uint64_t *)(v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)));
    uint64_t v7 = *v5;
    uint64_t v6 = v5[1];
    uint64_t v8 = *(void *)(v3 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_registry);
    uint64_t v10 = *(void *)(v3 + 112);
    uint64_t v9 = *(void *)(v3 + 120);
    uint64_t v11 = sub_247999520();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v2, 1, 1, v11);
    sub_247999500();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v12 = sub_2479994F0();
    uint64_t v13 = (void *)swift_allocObject();
    uint64_t v14 = MEMORY[0x263F8F500];
    v13[2] = v12;
    v13[3] = v14;
    v13[4] = v7;
    v13[5] = v6;
    v13[6] = v10;
    v13[7] = v9;
    v13[8] = v8;
    sub_24794C41C(v2, (uint64_t)&unk_269268CA8, (uint64_t)v13);
    swift_release();
    swift_bridgeObjectRelease();
  }
  uint64_t v15 = v0[76];
  return MEMORY[0x270FA2498](sub_247963464, v15, 0);
}

uint64_t sub_247963464()
{
  uint64_t v1 = v0[76];
  v0[214] = *(void *)(v1 + 112);
  v0[215] = *(void *)(v1 + 120);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_2479634E0, 0, 0);
}

unint64_t sub_2479634E0()
{
  uint64_t v1 = v0[188];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268CB0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24799A920;
  *(void *)(inited + 32) = 0x73656369746F4ELL;
  *(void *)(inited + 40) = 0xE700000000000000;
  uint64_t v40 = inited;
  int64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = v0[188];
    uint64_t v43 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_2479661AC(0, v3, 0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269266BD0);
    uint64_t v5 = (void *)(v4 + 56);
    while (1)
    {
      uint64_t v6 = *(v5 - 3);
      uint64_t v7 = *(v5 - 2);
      uint64_t v8 = *(v5 - 1);
      uint64_t v9 = *v5;
      uint64_t v42 = v5;
      v0[6] = 25705;
      v0[7] = 0xE200000000000000;
      v0[8] = v6;
      v0[9] = v7;
      v0[10] = 0x6567617373656DLL;
      v0[11] = 0xE700000000000000;
      v0[12] = v8;
      v0[13] = v9;
      uint64_t v10 = (void *)sub_247999950();
      uint64_t v12 = v0[6];
      uint64_t v11 = v0[7];
      uint64_t v14 = v0[8];
      uint64_t v13 = v0[9];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_retain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t result = sub_247917D8C(v12, v11);
      if (v16) {
        break;
      }
      int64_t v41 = v3;
      *(void *)((char *)v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v17 = (uint64_t *)(v10[6] + 16 * result);
      *uint64_t v17 = v12;
      v17[1] = v11;
      uint64_t v18 = (void *)(v10[7] + 16 * result);
      void *v18 = v14;
      v18[1] = v13;
      uint64_t v19 = v10[2];
      BOOL v20 = __OFADD__(v19, 1);
      uint64_t v21 = v19 + 1;
      if (v20) {
        goto LABEL_18;
      }
      v10[2] = v21;
      uint64_t v22 = v0[10];
      uint64_t v23 = v0[11];
      uint64_t v25 = v0[12];
      uint64_t v24 = v0[13];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t result = sub_247917D8C(v22, v23);
      if (v26) {
        goto LABEL_19;
      }
      *(void *)((char *)v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      unint64_t v27 = (uint64_t *)(v10[6] + 16 * result);
      *unint64_t v27 = v22;
      v27[1] = v23;
      unint64_t v28 = (void *)(v10[7] + 16 * result);
      *unint64_t v28 = v25;
      v28[1] = v24;
      uint64_t v29 = v10[2];
      BOOL v20 = __OFADD__(v29, 1);
      uint64_t v30 = v29 + 1;
      if (v20) {
        goto LABEL_20;
      }
      v10[2] = v30;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269268410);
      swift_arrayDestroy();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v31 = v43;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2479661AC(0, *(void *)(v43 + 16) + 1, 1);
        uint64_t v31 = v43;
      }
      unint64_t v33 = *(void *)(v31 + 16);
      unint64_t v32 = *(void *)(v31 + 24);
      if (v33 >= v32 >> 1)
      {
        sub_2479661AC(v32 > 1, v33 + 1, 1);
        uint64_t v31 = v43;
      }
      *(void *)(v31 + 16) = v33 + 1;
      *(void *)(v31 + 8 * v33 + 32) = v10;
      uint64_t v5 = v42 + 4;
      int64_t v3 = v41 - 1;
      if (v41 == 1)
      {
        uint64_t v34 = v0[189];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_2478A1B10(v34);
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
  }
  else
  {
    uint64_t v35 = v0[189];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2478A1B10(v35);
    uint64_t v31 = MEMORY[0x263F8EE78];
LABEL_14:
    uint64_t v36 = (uint64_t *)v0[71];
    *(void *)(v40 + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_269268CB8);
    *(void *)(v40 + 48) = v31;
    sub_2478FAEAC(v40);
    uint64_t v37 = sub_2479988A0();
    uint64_t v38 = MEMORY[0x263F7FA38];
    v36[3] = v37;
    v36[4] = v38;
    __swift_allocate_boxed_opaque_existential_1(v36);
    sub_247998890();
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v39 = (uint64_t (*)(void))v0[1];
    return v39();
  }
  return result;
}

uint64_t sub_247963B60()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_247963BB0()
{
  return v0;
}

uint64_t sub_247963BBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[11] = a5;
  v6[12] = v5;
  v6[9] = a3;
  v6[10] = a4;
  v6[7] = a1;
  v6[8] = a2;
  uint64_t v7 = sub_2479989D0();
  v6[13] = v7;
  v6[14] = *(void *)(v7 - 8);
  v6[15] = swift_task_alloc();
  v6[16] = swift_task_alloc();
  uint64_t v8 = sub_247998A20();
  v6[17] = v8;
  v6[18] = *(void *)(v8 - 8);
  v6[19] = swift_task_alloc();
  v6[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  v6[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247963D30, v5, 0);
}

uint64_t sub_247963D30()
{
  *(void *)(v0 + 176) = *(void *)(*(void *)(v0 + 96) + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_registry);
  return MEMORY[0x270FA2498](sub_247963D60, 0, 0);
}

uint64_t sub_247963D60()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v4 = v0[7];
  uint64_t v3 = v0[8];
  uint64_t v5 = sub_247999520();
  v0[23] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v0[24] = v7;
  v0[25] = (v6 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v7(v1, 1, 1, v5);
  v0[26] = sub_247999500();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v8 = sub_2479994F0();
  uint64_t v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v4;
  v9[5] = v3;
  v9[6] = v2;
  uint64_t v11 = sub_24794C5C8(v1, (uint64_t)&unk_269268BD8, (uint64_t)v9, (uint64_t)&unk_26FBE4528, &qword_2692682D8);
  v0[27] = v11;
  uint64_t v12 = (void *)swift_task_alloc();
  v0[28] = v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692682D8);
  *uint64_t v12 = v0;
  v12[1] = sub_247963F18;
  return MEMORY[0x270FA1FD0](v0 + 2, v11, v13);
}

uint64_t sub_247963F18()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_247964030, 0, 0);
}

uint64_t sub_247964030()
{
  uint64_t v1 = v0[12];
  v0[29] = v0[2];
  return MEMORY[0x270FA2498](sub_247964054, v1, 0);
}

uint64_t sub_247964054()
{
  uint64_t v95 = v0;
  if ((sub_247999430() & 1) == 0 && (sub_247999430() & 1) == 0)
  {
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    uint64_t v62 = sub_247999030();
    __swift_project_value_buffer(v62, (uint64_t)qword_26927FC68);
    swift_bridgeObjectRetain_n();
    uint64_t v63 = sub_247999010();
    os_log_type_t v64 = sub_247999670();
    BOOL v65 = os_log_type_enabled(v63, v64);
    uint64_t v66 = v0[29];
    if (v65)
    {
      BOOL v67 = (uint8_t *)swift_slowAlloc();
      uint64_t v68 = swift_slowAlloc();
      uint64_t v94 = v68;
      *(_DWORD *)BOOL v67 = 136446210;
      uint64_t v69 = *(void *)(v66 + 16);
      if (v69)
      {
        uint64_t v70 = v0[29] + 16 * v69;
        uint64_t v72 = *(void *)(v70 + 16);
        unint64_t v71 = *(void *)(v70 + 24);
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v72 = 7104878;
        unint64_t v71 = 0xE300000000000000;
      }
      v0[3] = sub_247918FF0(v72, v71, &v94);
      sub_247999720();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_247896000, v63, v64, "Resolving previous candidate to %{public}s.", v67, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v68, -1, -1);
      MEMORY[0x24C564070](v67, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v78 = v0[29];
    uint64_t v77 = *(void *)(v78 + 16);
    if (v77) {
      goto LABEL_47;
    }
    goto LABEL_51;
  }
  os_log_type_t v82 = v0 + 4;
  uint64_t v1 = v0[11];
  uint64_t v2 = MEMORY[0x263F8EE78];
  uint64_t v94 = MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = swift_bridgeObjectRetain();
  if (v3)
  {
    uint64_t v5 = v0[18];
    uint64_t v6 = v0[14];
    uint64_t v7 = *(void (**)(void, unint64_t, void))(v5 + 16);
    v5 += 16;
    uint64_t v91 = v7;
    unint64_t v84 = (*(unsigned __int8 *)(v5 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 64);
    unint64_t v8 = v4 + v84;
    unsigned int v87 = *MEMORY[0x263F7FA90];
    uint64_t v9 = (void (**)(uint64_t, uint64_t))(v6 + 8);
    BOOL v83 = (void (**)(void, void))(v5 - 8);
    uint64_t v85 = (void (**)(unint64_t, uint64_t, uint64_t))(v5 + 16);
    uint64_t v86 = (void (**)(uint64_t, void, uint64_t))(v6 + 104);
    uint64_t v89 = *(void *)(v5 + 56);
    do
    {
      uint64_t v11 = v0[16];
      uint64_t v12 = v0[15];
      uint64_t v13 = v0[13];
      v91(v0[20], v8, v0[17]);
      sub_2479989E0();
      (*v86)(v12, v87, v13);
      char v14 = sub_2479989C0();
      uint64_t v15 = v0;
      char v16 = *v9;
      (*v9)(v12, v13);
      v16(v11, v13);
      uint64_t v0 = v15;
      if (v14)
      {
        uint64_t v17 = *v85;
        (*v85)(v15[19], v15[20], v15[17]);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_247966170(0, *(void *)(v2 + 16) + 1, 1);
          uint64_t v2 = v94;
        }
        unint64_t v19 = *(void *)(v2 + 16);
        unint64_t v18 = *(void *)(v2 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_247966170(v18 > 1, v19 + 1, 1);
          uint64_t v2 = v94;
        }
        uint64_t v20 = v15[19];
        uint64_t v21 = v15[17];
        *(void *)(v2 + 16) = v19 + 1;
        uint64_t v10 = v89;
        v17(v2 + v84 + v19 * v89, v20, v21);
        uint64_t v94 = v2;
      }
      else
      {
        (*v83)(v15[20], v15[17]);
        uint64_t v10 = v89;
      }
      v8 += v10;
      --v3;
    }
    while (v3);
  }
  uint64_t v22 = v0[29];
  swift_bridgeObjectRelease();
  uint64_t v23 = *(void *)(v2 + 16);
  swift_release();
  unint64_t v24 = *(void *)(v22 + 16);
  unint64_t v25 = v24 - v23;
  if ((uint64_t)v24 <= v23)
  {
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    uint64_t v53 = sub_247999030();
    __swift_project_value_buffer(v53, (uint64_t)qword_26927FC68);
    swift_bridgeObjectRetain_n();
    BOOL v54 = sub_247999010();
    os_log_type_t v55 = sub_247999670();
    if (os_log_type_enabled(v54, v55))
    {
      uint64_t v56 = (uint8_t *)swift_slowAlloc();
      uint64_t v57 = swift_slowAlloc();
      uint64_t v94 = v57;
      *(_DWORD *)uint64_t v56 = 136446210;
      uint64_t v58 = *(void *)(v22 + 16);
      if (v58)
      {
        uint64_t v59 = v0[29] + 16 * v58;
        uint64_t v61 = *(void *)(v59 + 16);
        unint64_t v60 = *(void *)(v59 + 24);
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v61 = 7104878;
        unint64_t v60 = 0xE300000000000000;
      }
      *os_log_type_t v82 = sub_247918FF0(v61, v60, &v94);
      sub_247999720();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_247896000, v54, v55, "Resolving previous candidate to %{public}s.", v56, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v57, -1, -1);
      MEMORY[0x24C564070](v56, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v77 = *(void *)(v22 + 16);
    uint64_t v78 = v0[29];
    if (v77)
    {
LABEL_47:
      uint64_t v79 = v78 + 16 * v77;
      uint64_t v75 = *(void *)(v79 + 16);
      uint64_t v76 = *(void *)(v79 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_53;
    }
LABEL_51:
    swift_bridgeObjectRelease();
    goto LABEL_52;
  }
  uint64_t v90 = v24 - v23;
  uint64_t v92 = v0 + 5;
  uint64_t v26 = v0[29];
  BOOL v27 = v24 >= v25;
  unint64_t v28 = v24 - v25;
  uint64_t v29 = v0;
  if (v27) {
    unint64_t v30 = v28;
  }
  else {
    unint64_t v30 = 0;
  }
  sub_247999BE0();
  swift_unknownObjectRetain_n();
  uint64_t v31 = swift_dynamicCastClass();
  if (!v31)
  {
    swift_unknownObjectRelease();
    uint64_t v31 = MEMORY[0x263F8EE78];
  }
  uint64_t v32 = *(void *)(v31 + 16);
  swift_release();
  uint64_t v93 = v29;
  uint64_t v33 = v29[29];
  if (v32 == v30)
  {
    uint64_t v34 = swift_dynamicCastClass();
    if (!v34)
    {
      swift_unknownObjectRelease();
      uint64_t v34 = MEMORY[0x263F8EE78];
    }
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v34 = sub_247966A54(v33, v26 + 32, 0, (2 * v30) | 1);
  }
  uint64_t v35 = v93[7];
  uint64_t v36 = v93[23];
  uint64_t v37 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v93[24];
  uint64_t v39 = v93[21];
  uint64_t v38 = v93[22];
  uint64_t v40 = v93[8];
  swift_unknownObjectRelease();
  v37(v39, 1, 1, v36);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v41 = sub_2479994F0();
  uint64_t v42 = (void *)swift_allocObject();
  uint64_t v43 = MEMORY[0x263F8F500];
  v42[2] = v41;
  v42[3] = v43;
  v42[4] = v34;
  v42[5] = v35;
  v42[6] = v40;
  v42[7] = v38;
  sub_24794C41C(v39, (uint64_t)&unk_269268BE0, (uint64_t)v42);
  swift_release();
  if (qword_269266AA0 != -1) {
    swift_once();
  }
  uint64_t v44 = sub_247999030();
  __swift_project_value_buffer(v44, (uint64_t)qword_26927FC68);
  swift_bridgeObjectRetain_n();
  uint64_t v45 = sub_247999010();
  os_log_type_t v46 = sub_247999670();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v0 = v93;
    uint64_t v47 = swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    uint64_t v94 = v48;
    *(_DWORD *)uint64_t v47 = 134349314;
    *uint64_t v92 = v90;
    sub_247999720();
    *(_WORD *)(v47 + 12) = 2082;
    uint64_t v49 = *(void *)(v34 + 16);
    uint64_t v88 = v48;
    if (v49)
    {
      uint64_t v50 = v34 + 16 * v49;
      uint64_t v52 = *(void *)(v50 + 16);
      unint64_t v51 = *(void *)(v50 + 24);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v52 = 7104878;
      unint64_t v51 = 0xE300000000000000;
    }
    v93[6] = sub_247918FF0(v52, v51, &v94);
    sub_247999720();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_247896000, v45, v46, "%{public}ld undo operations performed. Resolving previous candidate to %{public}s.", (uint8_t *)v47, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v88, -1, -1);
    MEMORY[0x24C564070](v47, -1, -1);

    uint64_t v73 = *(void *)(v34 + 16);
    if (!v73) {
      goto LABEL_43;
    }
LABEL_38:
    uint64_t v74 = v34 + 16 * v73;
    uint64_t v75 = *(void *)(v74 + 16);
    uint64_t v76 = *(void *)(v74 + 24);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_53;
  }
  swift_release_n();

  uint64_t v0 = v93;
  uint64_t v73 = *(void *)(v34 + 16);
  if (v73) {
    goto LABEL_38;
  }
LABEL_43:
  swift_release();
LABEL_52:
  uint64_t v75 = 0;
  uint64_t v76 = 0;
LABEL_53:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v80 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v80(v75, v76);
}

uint64_t sub_247964A0C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24796D2F0(v0 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_provider, (uint64_t (*)(void))type metadata accessor for BlackPowder);
  sub_2479203E0((id *)(v0 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_authenticator));
  sub_247920430(v0 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_client);
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_247964AAC()
{
  sub_247964A0C();

  return MEMORY[0x270FA2418](v0);
}

uint64_t sub_247964AD8()
{
  return _s7SessionCMa();
}

uint64_t _s7SessionCMa()
{
  uint64_t result = qword_269268BA8;
  if (!qword_269268BA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_247964B2C()
{
  uint64_t result = type metadata accessor for BlackPowder();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t _s7SessionC12ResponseInfoCMa()
{
  return self;
}

uint64_t sub_247964C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[11] = a1;
  v3[12] = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C18);
  v3[13] = v4;
  v3[14] = *(void *)(v4 - 8);
  v3[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C68);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  v3[18] = swift_projectBox();
  return MEMORY[0x270FA2498](sub_247964D3C, 0, 0);
}

uint64_t sub_247964D3C()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  swift_beginAccess();
  sub_2478E6A48(v1, v2, &qword_269268C68);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C70);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  LODWORD(v1) = v5(v2, 1, v3);
  sub_2478A1A1C(v2, &qword_269268C68);
  if (v1 == 1)
  {
    uint64_t v6 = v0[18];
    uint64_t v7 = v0[16];
    (*(void (**)(void, void, void))(v0[14] + 16))(v0[15], v0[12], v0[13]);
    sub_2478A23F4(&qword_269268C88, &qword_269268C18);
    sub_247999580();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v7, 0, 1, v3);
    swift_beginAccess();
    sub_2478E7964(v7, v6, &qword_269268C68);
  }
  uint64_t v8 = v0[18];
  swift_beginAccess();
  if (v5(v8, 1, v3))
  {
    uint64_t v9 = v0[11];
    swift_endAccess();
    *(void *)(v9 + 32) = 0;
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v9 + 16) = 0u;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
  else
  {
    uint64_t v12 = sub_2478A23F4(&qword_269268C90, &qword_269268C70);
    uint64_t v13 = (void *)swift_task_alloc();
    v0[19] = v13;
    *uint64_t v13 = v0;
    v13[1] = sub_247965034;
    uint64_t v14 = v0[11];
    return MEMORY[0x270FA1E80](v14, v3, v12);
  }
}

uint64_t sub_247965034()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24796D654, 0, 0);
  }
  else
  {
    swift_endAccess();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_247965190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[11] = a1;
  v3[12] = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F90);
  v3[13] = v4;
  v3[14] = *(void *)(v4 - 8);
  v3[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268F98);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  v3[18] = swift_projectBox();
  return MEMORY[0x270FA2498](sub_2479652A4, 0, 0);
}

uint64_t sub_2479652A4()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  swift_beginAccess();
  sub_2478E6A48(v1, v2, &qword_269268F98);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268FA0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  LODWORD(v1) = v5(v2, 1, v3);
  sub_2478A1A1C(v2, &qword_269268F98);
  if (v1 == 1)
  {
    uint64_t v6 = v0[18];
    uint64_t v7 = v0[16];
    (*(void (**)(void, void, void))(v0[14] + 16))(v0[15], v0[12], v0[13]);
    sub_2478A23F4(&qword_269268FA8, &qword_269268F90);
    sub_247999580();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v7, 0, 1, v3);
    swift_beginAccess();
    sub_2478E7964(v7, v6, &qword_269268F98);
  }
  uint64_t v8 = v0[18];
  swift_beginAccess();
  if (v5(v8, 1, v3))
  {
    uint64_t v9 = v0[11];
    swift_endAccess();
    uint64_t v10 = sub_2479987D0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
  else
  {
    uint64_t v13 = sub_2478A23F4(&qword_269268FB0, &qword_269268FA0);
    uint64_t v14 = (void *)swift_task_alloc();
    v0[19] = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_2479655D0;
    uint64_t v15 = v0[11];
    return MEMORY[0x270FA1E80](v15, v3, v13);
  }
}

uint64_t sub_2479655D0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24796572C, 0, 0);
  }
  else
  {
    swift_endAccess();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24796572C()
{
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2479657B8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24796D680;
  return v6(a1);
}

uint64_t sub_247965894(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_247965970;
  return v6(a1);
}

uint64_t sub_247965970()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_247965A6C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_24796D664;
  return sub_247931DEC(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_247965B34(uint64_t a1, uint64_t a2, char a3, uint64_t *a4)
{
  unint64_t v60 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268250);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_247998240();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v59 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v57 = (char *)v42 - v14;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268E38);
  MEMORY[0x270FA5388](v52);
  unint64_t v51 = (char *)v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v50 = v16;
  if (!v16)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
LABEL_31:
    sub_2478A1A1C((uint64_t)v9, &qword_269268250);
LABEL_32:
    swift_bridgeObjectRelease_n();
    return swift_bridgeObjectRelease_n();
  }
  unint64_t v17 = 0;
  uint64_t v54 = v11 + 16;
  uint64_t v55 = v11 + 56;
  uint64_t v53 = v11 + 48;
  uint64_t v58 = (void (**)(char *, char *, uint64_t))(v11 + 32);
  uint64_t v18 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v56 = a2 & 0xFFFFFFFFFFFFFF8;
  if (a2 < 0) {
    uint64_t v18 = a2;
  }
  v42[1] = v18;
  uint64_t v48 = v11;
  unint64_t v49 = a2 & 0xC000000000000001;
  uint64_t v43 = (void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v46 = a2;
  uint64_t v47 = a1;
  uint64_t v45 = v9;
  while (v17 < *(void *)(a1 + 16))
  {
    uint64_t v20 = *(void *)(v11 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v9, a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)) + v20 * v17, v10);
    uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v44(v9, 0, 1, v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1) {
      goto LABEL_31;
    }
    uint64_t v21 = *v58;
    (*v58)(v57, v9, v10);
    if ((unint64_t)a2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_247999920();
      swift_bridgeObjectRelease();
      if (v17 == v40)
      {
LABEL_29:
        (*v43)(v57, v10);
        goto LABEL_32;
      }
    }
    else if (v17 == *(void *)(v56 + 16))
    {
      goto LABEL_29;
    }
    if (v49)
    {
      char v22 = a3;
      uint64_t v23 = MEMORY[0x24C563340](v17, a2);
    }
    else
    {
      if (v17 >= *(void *)(v56 + 16)) {
        goto LABEL_35;
      }
      char v22 = a3;
      uint64_t v23 = *(void *)(a2 + 8 * v17 + 32);
      swift_retain();
    }
    unint64_t v24 = v51;
    uint64_t v25 = *(int *)(v52 + 48);
    v21(v51, v57, v10);
    *(void *)&v24[v25] = v23;
    uint64_t v26 = (uint64_t)v59;
    v21(v59, v24, v10);
    uint64_t v27 = *v60;
    unint64_t v29 = sub_247917F74(v26);
    uint64_t v30 = *(void *)(v27 + 16);
    BOOL v31 = (v28 & 1) == 0;
    uint64_t v32 = v30 + v31;
    if (__OFADD__(v30, v31)) {
      goto LABEL_34;
    }
    char v33 = v28;
    if (*(void *)(v27 + 24) >= v32)
    {
      if (v22)
      {
        uint64_t v11 = v48;
        if (v28) {
          goto LABEL_5;
        }
      }
      else
      {
        sub_247919F50();
        uint64_t v11 = v48;
        if (v33) {
          goto LABEL_5;
        }
      }
    }
    else
    {
      sub_24791B080(v32, v22 & 1);
      unint64_t v34 = sub_247917F74((uint64_t)v59);
      if ((v33 & 1) != (v35 & 1)) {
        goto LABEL_37;
      }
      unint64_t v29 = v34;
      uint64_t v11 = v48;
      if (v33)
      {
LABEL_5:
        (*v43)(v59, v10);
        uint64_t v19 = *(void *)(*v60 + 56);
        swift_release();
        *(void *)(v19 + 8 * v29) = v23;
        goto LABEL_6;
      }
    }
    uint64_t v36 = (void *)*v60;
    *(void *)(*v60 + 8 * (v29 >> 6) + 64) |= 1 << v29;
    v21((char *)(v36[6] + v29 * v20), v59, v10);
    *(void *)(v36[7] + 8 * v29) = v23;
    uint64_t v37 = v36[2];
    BOOL v38 = __OFADD__(v37, 1);
    uint64_t v39 = v37 + 1;
    if (v38) {
      goto LABEL_36;
    }
    v36[2] = v39;
LABEL_6:
    ++v17;
    a3 = 1;
    a2 = v46;
    a1 = v47;
    uint64_t v9 = v45;
    if (v50 == v17)
    {
      v44(v45, 1, 1, v10);
      goto LABEL_31;
    }
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  uint64_t result = sub_247999C20();
  __break(1u);
  return result;
}

uint64_t sub_247966078(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_247966504(a1, a2, a3, (void *)*v3, &qword_269268DC8, MEMORY[0x263F415B0]);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2479660B4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2479661EC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2479660D4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_247966358(a1, a2, a3, (void *)*v3, &qword_269268D58, &qword_269268B60);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_247966104(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_247966358(a1, a2, a3, (void *)*v3, &qword_269268D60, &qword_269268B58);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_247966134(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_247966504(a1, a2, a3, (void *)*v3, &qword_269268E40, MEMORY[0x263F06EA8]);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_247966170(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_247966504(a1, a2, a3, (void *)*v3, &qword_269268BF8, MEMORY[0x263F7FAB8]);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2479661AC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24796674C(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_2479661CC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2479668D8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2479661EC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692685B0);
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
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_247999960();
  __break(1u);
  return result;
}

uint64_t sub_247966358(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v13 = (void *)swift_allocObject();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 24);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v15 = (unint64_t)(v13 + 4);
  unint64_t v16 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v15 >= v16 + 24 * v11) {
      memmove(v13 + 4, a4 + 4, 24 * v11);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= v15 + 24 * v11 || v15 >= v16 + 24 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  uint64_t result = sub_247999960();
  __break(1u);
  return result;
}

uint64_t sub_247966504(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    unint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v16 + v20;
  char v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  unint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_247999960();
  __break(1u);
  return result;
}

uint64_t sub_24796674C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269268CD8);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269268820);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_247999960();
  __break(1u);
  return result;
}

uint64_t sub_2479668D8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269268D68);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  size_t v14 = 48 * v8;
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
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_247999960();
  __break(1u);
  return result;
}

uint64_t sub_247966A54(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return MEMORY[0x263F8EE78];
    }
    uint64_t v8 = 2 * v5;
    if (v5 <= 0)
    {
      uint64_t v9 = (void *)MEMORY[0x263F8EE78];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        unint64_t v12 = a2 + 16 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8) {
          goto LABEL_19;
        }
        swift_arrayInitWithCopy();
        return (uint64_t)v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692685B0);
      uint64_t v9 = (void *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 17;
      }
      v9[2] = v5;
      v9[3] = 2 * (v11 >> 4);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  uint64_t result = sub_247999960();
  __break(1u);
  return result;
}

uint64_t sub_247966BC8()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_247966C18(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  int64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = sub_24796D664;
  return sub_247930C20(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_247966CEC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24796D664;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269268BE8 + dword_269268BE8);
  return v6(a1, v4);
}

uint64_t sub_247966DA4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_247999C90();
  swift_bridgeObjectRetain();
  sub_2479993B0();
  uint64_t v8 = sub_247999CD0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_247999B80() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      size_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_247999B80() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_247968534(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_247966F54(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_247998D10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_24796D17C(&qword_269268DF8, MEMORY[0x263F415B0]);
  swift_bridgeObjectRetain();
  char v33 = a2;
  uint64_t v11 = sub_2479992E0();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    char v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    unint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    size_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      unint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_24796D17C(&qword_269268E00, MEMORY[0x263F415B0]);
      char v21 = sub_247999310();
      char v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      size_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    size_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_2479686D0((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_247967278(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_247998D10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  char v35 = (char *)&v30 - v9;
  if (*(void *)(a2 + 16))
  {
    uint64_t v36 = a1;
    unint64_t v10 = *(void *)(a1 + 16);
    swift_bridgeObjectRetain();
    if (v10)
    {
      unint64_t v11 = 0;
      uint64_t v33 = v5 + 16;
      uint64_t v34 = (char *)(a2 + 56);
      uint64_t v12 = (void (**)(char *, uint64_t))(v5 + 8);
      uint64_t v31 = v5;
      uint64_t v32 = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      while (1)
      {
        if (v11 >= v10) {
          __break(1u);
        }
        uint64_t v13 = *(void *)(v5 + 72);
        unint64_t v14 = a1
            + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
            + v13 * v11;
        unint64_t v37 = v11 + 1;
        uint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
        v15(v35, v14, v4);
        sub_24796D17C(&qword_269268DF8, MEMORY[0x263F415B0]);
        uint64_t v16 = sub_2479992E0();
        uint64_t v17 = -1 << *(unsigned char *)(a2 + 32);
        unint64_t v18 = v16 & ~v17;
        if ((*(void *)&v34[(v18 >> 3) & 0xFFFFFFFFFFFFFF8] >> v18)) {
          break;
        }
        char v22 = *v12;
LABEL_11:
        v22(v35, v4);
        a1 = v36;
        unint64_t v11 = v37;
        unint64_t v10 = *(void *)(v36 + 16);
        if (v37 == v10) {
          goto LABEL_12;
        }
      }
      uint64_t v19 = a2;
      uint64_t v20 = ~v17;
      while (1)
      {
        v15(v8, *(void *)(v19 + 48) + v18 * v13, v4);
        sub_24796D17C(&qword_269268E00, MEMORY[0x263F415B0]);
        char v21 = sub_247999310();
        char v22 = *v12;
        (*v12)(v8, v4);
        if (v21) {
          break;
        }
        unint64_t v18 = (v18 + 1) & v20;
        if (((*(void *)&v34[(v18 >> 3) & 0xFFFFFFFFFFFFFF8] >> v18) & 1) == 0)
        {
          a2 = v19;
          uint64_t v5 = v31;
          goto LABEL_11;
        }
      }
      uint64_t isStackAllocationSafe = ((uint64_t (*)(char *, uint64_t))v22)(v35, v4);
      char v24 = *(unsigned char *)(v19 + 32);
      unint64_t v25 = (unint64_t)((1 << v24) + 63) >> 6;
      size_t v26 = 8 * v25;
      if ((v24 & 0x3Fu) <= 0xD
        || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
      {
        MEMORY[0x270FA5388](isStackAllocationSafe);
        memcpy((char *)&v30 - ((v26 + 15) & 0x3FFFFFFFFFFFFFF0), v34, v26);
        uint64_t v27 = sub_247967DB0((unint64_t *)((char *)&v30 - ((v26 + 15) & 0x3FFFFFFFFFFFFFF0)), v25, v19, v18, &v36);
        swift_release();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v28 = (void *)swift_slowAlloc();
        memcpy(v28, v34, v26);
        uint64_t v27 = sub_247967DB0((unint64_t *)v28, v25, v19, v18, &v36);
        swift_release();
        swift_bridgeObjectRelease();
        MEMORY[0x24C564070](v28, -1, -1);
      }
      return v27;
    }
    else
    {
LABEL_12:
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  return a2;
}

uint64_t sub_2479676EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268F50);
  uint64_t v3 = sub_2479997E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16)) {
    goto LABEL_37;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v31 = v0;
  uint64_t v32 = v2 + 56;
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
      goto LABEL_22;
    }
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
      break;
    }
    uint64_t v17 = (void *)(v2 + 56);
    unint64_t v18 = *(void *)(v32 + 8 * v16);
    ++v11;
    if (!v18)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v8) {
        goto LABEL_31;
      }
      unint64_t v18 = *(void *)(v32 + 8 * v11);
      if (!v18)
      {
        int64_t v19 = v16 + 2;
        if (v19 >= v8)
        {
LABEL_31:
          swift_release();
          uint64_t v1 = v31;
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v32 + 8 * v19);
        if (!v18)
        {
          while (1)
          {
            int64_t v11 = v19 + 1;
            if (__OFADD__(v19, 1)) {
              goto LABEL_39;
            }
            if (v11 >= v8) {
              goto LABEL_31;
            }
            unint64_t v18 = *(void *)(v32 + 8 * v11);
            ++v19;
            if (v18) {
              goto LABEL_21;
            }
          }
        }
        int64_t v11 = v19;
      }
    }
LABEL_21:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v11 << 6);
LABEL_22:
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    sub_247999C90();
    sub_2479993B0();
    uint64_t result = sub_247999CD0();
    uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v9 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v24) & ~*(void *)(v9 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v9 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v12 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *uint64_t v13 = v21;
    v13[1] = v22;
    ++*(void *)(v4 + 16);
  }
  swift_release();
  uint64_t v1 = v31;
  uint64_t v17 = (void *)(v2 + 56);
LABEL_33:
  uint64_t v30 = 1 << *(unsigned char *)(v2 + 32);
  if (v30 > 63) {
    bzero(v17, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v17 = -1 << v30;
  }
  *(void *)(v2 + 16) = 0;
LABEL_37:
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_2479679B4()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_247998D10();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268E08);
  uint64_t v5 = sub_2479997E0();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    unint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    char v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    unint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      char v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_24796D17C(&qword_269268DF8, MEMORY[0x263F415B0]);
      uint64_t result = sub_2479992E0();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_247967DB0(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v10 = sub_247998D10();
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  int64_t v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t result = MEMORY[0x270FA5388](v14);
  int64_t v19 = (char *)&v44 - v18;
  uint64_t v20 = *(void *)(a3 + 16);
  uint64_t v21 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  uint64_t v22 = *(unint64_t *)((char *)a1 + v21);
  uint64_t v45 = a1;
  *(unint64_t *)((char *)a1 + v21) = v22 & ((-1 << a4) - 1);
  uint64_t v23 = v20 - 1;
  uint64_t v24 = *a5;
  unint64_t v25 = a5[1];
  unint64_t v26 = *(void *)(*a5 + 16);
  uint64_t v44 = a2;
  uint64_t v46 = v23;
  if (v25 == v26)
  {
    uint64_t v27 = a3;
LABEL_3:
    swift_retain();
    return sub_2479681A8(v45, v44, v46, v27);
  }
  else
  {
    uint64_t v55 = v19;
    uint64_t v54 = v16 + 16;
    uint64_t v49 = v16 + 32;
    uint64_t v50 = v17;
    uint64_t v51 = v16;
    uint64_t v52 = a3 + 56;
    unint64_t v28 = (void (**)(char *, uint64_t))(v16 + 8);
    uint64_t v27 = a3;
    unint64_t v29 = a5;
    uint64_t v47 = a5;
    while (v25 < v26)
    {
      uint64_t v32 = v50;
      uint64_t v31 = v51;
      uint64_t v33 = *(unsigned __int8 *)(v51 + 80);
      uint64_t v53 = *(void *)(v51 + 72);
      uint64_t v34 = *(void (**)(uint64_t, unint64_t, uint64_t))(v51 + 16);
      v34(v50, v24 + ((v33 + 32) & ~v33) + v53 * v25, v10);
      v29[1] = v25 + 1;
      (*(void (**)(char *, uint64_t, uint64_t))(v31 + 32))(v55, v32, v10);
      sub_24796D17C(&qword_269268DF8, MEMORY[0x263F415B0]);
      uint64_t v35 = sub_2479992E0();
      uint64_t v36 = -1 << *(unsigned char *)(v27 + 32);
      unint64_t v37 = v35 & ~v36;
      if ((*(void *)(v52 + ((v37 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v37))
      {
        uint64_t v48 = (unint64_t)v28 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        uint64_t v38 = v27;
        uint64_t v39 = ~v36;
        while (1)
        {
          v34((uint64_t)v13, *(void *)(v38 + 48) + v37 * v53, v10);
          sub_24796D17C(&qword_269268E00, MEMORY[0x263F415B0]);
          char v40 = sub_247999310();
          char v30 = *v28;
          (*v28)(v13, v10);
          if (v40) {
            break;
          }
          unint64_t v37 = (v37 + 1) & v39;
          if (((*(void *)(v52 + ((v37 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v37) & 1) == 0)
          {
            uint64_t v27 = v38;
            unint64_t v29 = v47;
            goto LABEL_7;
          }
        }
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v30)(v55, v10);
        uint64_t v41 = (v37 >> 3) & 0x1FFFFFFFFFFFFFF8;
        uint64_t v42 = *(unint64_t *)((char *)v45 + v41);
        *(unint64_t *)((char *)v45 + v41) = v42 & ~(1 << v37);
        if ((v42 & (1 << v37)) != 0)
        {
          uint64_t v43 = v46 - 1;
          if (__OFSUB__(v46, 1)) {
            goto LABEL_21;
          }
          uint64_t v27 = v38;
          unint64_t v29 = v47;
          --v46;
          if (!v43) {
            return MEMORY[0x263F8EE88];
          }
        }
        else
        {
          uint64_t v27 = v38;
          unint64_t v29 = v47;
        }
      }
      else
      {
        char v30 = *v28;
LABEL_7:
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v30)(v55, v10);
      }
      uint64_t v24 = *v29;
      unint64_t v25 = v29[1];
      unint64_t v26 = *(void *)(*v29 + 16);
      if (v25 == v26) {
        goto LABEL_3;
      }
    }
    __break(1u);
LABEL_21:
    __break(1u);
  }
  return result;
}

uint64_t sub_2479681A8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v34 = a1;
  uint64_t v7 = sub_247998D10();
  uint64_t v37 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268E08);
  uint64_t result = sub_2479997F0();
  uint64_t v10 = result;
  uint64_t v33 = a2;
  if (a2 < 1) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = *v34;
  }
  uint64_t v13 = 0;
  uint64_t v14 = result + 56;
  uint64_t v35 = (uint64_t (**)(unint64_t, char *, uint64_t))(v37 + 32);
  uint64_t v36 = v37 + 16;
  while (1)
  {
    if (v12)
    {
      unint64_t v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v16 = v15 | (v13 << 6);
    }
    else
    {
      uint64_t v17 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_40;
      }
      if (v17 >= v33)
      {
LABEL_37:
        swift_release();
        return v10;
      }
      unint64_t v18 = v34[v17];
      ++v13;
      if (!v18)
      {
        uint64_t v13 = v17 + 1;
        if (v17 + 1 >= v33) {
          goto LABEL_37;
        }
        unint64_t v18 = v34[v13];
        if (!v18)
        {
          uint64_t v13 = v17 + 2;
          if (v17 + 2 >= v33) {
            goto LABEL_37;
          }
          unint64_t v18 = v34[v13];
          if (!v18)
          {
            uint64_t v19 = v17 + 3;
            if (v19 >= v33) {
              goto LABEL_37;
            }
            unint64_t v18 = v34[v19];
            if (!v18)
            {
              while (1)
              {
                uint64_t v13 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_37;
                }
                unint64_t v18 = v34[v13];
                ++v19;
                if (v18) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v13 = v19;
          }
        }
      }
LABEL_24:
      unint64_t v12 = (v18 - 1) & v18;
      unint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
    }
    uint64_t v20 = a4;
    uint64_t v21 = *(void *)(a4 + 48);
    uint64_t v22 = *(void *)(v37 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v37 + 16))(v9, v21 + v22 * v16, v7);
    sub_24796D17C(&qword_269268DF8, MEMORY[0x263F415B0]);
    uint64_t result = sub_2479992E0();
    uint64_t v23 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v26 = __clz(__rbit64((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v29 = v25 == v28;
        if (v25 == v28) {
          unint64_t v25 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v14 + 8 * v25);
      }
      while (v30 == -1);
      unint64_t v26 = __clz(__rbit64(~v30)) + (v25 << 6);
    }
    *(void *)(v14 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
    uint64_t result = (*v35)(*(void *)(v10 + 48) + v26 * v22, v9, v7);
    ++*(void *)(v10 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v20;
    if (!a3) {
      goto LABEL_37;
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

uint64_t sub_247968534(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2479676EC();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_247968970();
      goto LABEL_22;
    }
    sub_247968DB4();
  }
  uint64_t v11 = *v4;
  sub_247999C90();
  sub_2479993B0();
  uint64_t result = sub_247999CD0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_247999B80(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_247999C10();
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
          uint64_t result = sub_247999B80();
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
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

uint64_t sub_2479686D0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_247998D10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  unint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_2479679B4();
  }
  else
  {
    if (v11 > v10)
    {
      sub_247968B10();
      goto LABEL_12;
    }
    sub_247969040();
  }
  uint64_t v12 = *v3;
  sub_24796D17C(&qword_269268DF8, MEMORY[0x263F415B0]);
  uint64_t v13 = sub_2479992E0();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_24796D17C(&qword_269268E00, MEMORY[0x263F415B0]);
      char v21 = sub_247999310();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_247999C10();
  __break(1u);
  return result;
}

void *sub_247968970()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268F50);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2479997D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_247968B10()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_247998D10();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268E08);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_2479997D0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    uint64_t *v1 = v8;
    return result;
  }
  int64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_247968DB4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268F50);
  uint64_t v3 = sub_2479997E0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_32:
    uint64_t *v1 = v4;
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
  uint64_t result = swift_retain_n();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_21;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    if (v16 >= v29) {
      goto LABEL_30;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_30;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v18 = v16 + 2;
        if (v18 >= v29)
        {
LABEL_30:
          uint64_t result = swift_release_n();
          uint64_t v1 = v0;
          goto LABEL_32;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v18);
        int64_t v11 = v18;
        if (!v17) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_21:
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_247999C90();
    swift_bridgeObjectRetain();
    sub_2479993B0();
    uint64_t result = sub_247999CD0();
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
          goto LABEL_33;
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
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *uint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_30;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_20;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_247969040()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_247998D10();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268E08);
  uint64_t v7 = sub_2479997E0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_24796D17C(&qword_269268DF8, MEMORY[0x263F415B0]);
    uint64_t result = sub_2479992E0();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2479693F0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = a1[3];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  a2[3] = v4;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_247969438()
{
  void (*v14)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  void v23[4];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = 16 * v6;
    uint64_t v8 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v9 = *v8;
    uint64_t v10 = v8[1];
    uint64_t v11 = (uint64_t *)(*(void *)(v1 + 56) + v7);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    v0[3] = v4;
    v0[4] = v5;
    unint64_t v14 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v23[0] = v9;
    v23[1] = v10;
    v23[2] = v12;
    v23[3] = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(&v22, v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v22;
  }
  int64_t v16 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t v17 = (unint64_t)(v0[2] + 64) >> 6;
    if (v16 < v17)
    {
      unint64_t v18 = v0[1];
      unint64_t v19 = *(void *)(v18 + 8 * v16);
      if (v19)
      {
LABEL_7:
        uint64_t v5 = (v19 - 1) & v19;
        unint64_t v6 = __clz(__rbit64(v19)) + (v16 << 6);
        int64_t v4 = v16;
        goto LABEL_3;
      }
      int64_t v20 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v17)
      {
        unint64_t v19 = *(void *)(v18 + 8 * v20);
        if (v19)
        {
LABEL_10:
          int64_t v16 = v20;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v17)
        {
          unint64_t v19 = *(void *)(v18 + 8 * (v3 + 3));
          if (v19)
          {
            int64_t v16 = v3 + 3;
            goto LABEL_7;
          }
          int64_t v20 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v17)
          {
            unint64_t v19 = *(void *)(v18 + 8 * v20);
            if (v19) {
              goto LABEL_10;
            }
            int64_t v16 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v17)
            {
              unint64_t v19 = *(void *)(v18 + 8 * v16);
              if (v19) {
                goto LABEL_7;
              }
              int64_t v4 = v17 - 1;
              unint64_t v21 = v3 + 6;
              while (v17 != v21)
              {
                unint64_t v19 = *(void *)(v18 + 8 * v21++);
                if (v19)
                {
                  int64_t v16 = v21 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    uint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_2479695DC(uint64_t a1, int *a2)
{
  *(void *)(v2 + 24) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  int64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v3;
  *int64_t v3 = v2;
  v3[1] = sub_24796D658;
  return v5(v2 + 16);
}

uint64_t sub_2479696BC(uint64_t a1)
{
  int64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24796D664;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269268C00 + dword_269268C00);
  return v6(a1, v4);
}

uint64_t sub_247969778(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_24796D664;
  return sub_247935ADC(a1, v4, v5, v6, v7, v8);
}

void *sub_247969840(void *a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[13];
  unint64_t v6 = a1[14];
  uint64_t v7 = a1[19];
  uint64_t v8 = a1[18];
  swift_bridgeObjectRelease();
  sub_2478F5B10(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2478F5B54(v4, v6);
  swift_bridgeObjectRelease();
  sub_2478F5BDC(v8, v7);
  return a1;
}

uint64_t sub_24796994C(uint64_t a1)
{
  return sub_2478A9EE4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_247969968()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269266F78) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268C10) - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = (v3 + v4 + v6) & ~v6;
  uint64_t v20 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(_s15InstrumentationVMa() - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 64);
  swift_release();
  uint64_t v11 = v0 + v3;
  uint64_t v12 = type metadata accessor for OpenAIAuthenticator.Credentials(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v11, 1, v12))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v13 = v11 + *(int *)(v12 + 28);
    uint64_t v14 = sub_2479983D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  }
  uint64_t v15 = sub_247998B20();
  uint64_t v16 = *(void *)(v15 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v0 + v7, 1, v15)) {
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v0 + v7, v15);
  }
  unint64_t v17 = (((((v20 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + v9 + 8) & ~v9;
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_247998400();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v0 + v17, v18);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, ((v10 + v17 + 7) & 0xFFFFFFFFFFFFFFF8) + 24, v2 | v6 | v9 | 7);
}

uint64_t sub_247969CB8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v3;
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269266F78) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268C10) - 8);
  unint64_t v11 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v12 = (*(void *)(v10 + 64) + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = *(void *)(_s15InstrumentationVMa() - 8);
  unint64_t v15 = (v13 + *(unsigned __int8 *)(v14 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = *(void *)(v2 + 16);
  uint64_t v17 = *(void *)(v2 + v12);
  uint64_t v18 = *(void *)(v2 + v13);
  uint64_t v19 = v2 + v15;
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v20;
  *uint64_t v20 = v5;
  v20[1] = sub_24796D664;
  return sub_24795DABC(a1, a2, v16, v2 + v8, v2 + v11, v17, v18, v19);
}

uint64_t sub_247969EF8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C18);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_247969FC8(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268C18) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24796D664;
  return sub_247964C28(a1, v5, v6);
}

uint64_t sub_24796A0B4(uint64_t a1)
{
  return sub_2478AA350(a1, *(void *)(v1 + 16));
}

uint64_t sub_24796A0D0(uint64_t a1, int *a2)
{
  *(void *)(v2 + 24) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_24796A1B0;
  return v5(v2 + 16);
}

uint64_t sub_24796A1B0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_24796A2E0(uint64_t a1)
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
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
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

int64_t sub_24796A380(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_24796A464(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  unint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *unint64_t v8 = v3;
  v8[1] = sub_24796D664;
  return sub_247946DB4(a1, v6, v7, a3);
}

uint64_t sub_24796A518(uint64_t a1)
{
  uint64_t v2 = sub_247998D10();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_24796D17C(&qword_269268DF8, MEMORY[0x263F415B0]);
  uint64_t result = sub_247999610();
  uint64_t v17 = result;
  if (v9)
  {
    unint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    unint64_t v12 = v13;
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v15 = *(void *)(v11 + 56);
    do
    {
      v12(v6, v14, v2);
      sub_247966F54((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v11 - 8))(v8, v2);
      v14 += v15;
      --v9;
    }
    while (v9);
    return v17;
  }
  return result;
}

uint64_t sub_24796A6B4()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24796A704(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_24796D664;
  return sub_2479313F4(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_24796A7E0()
{
  return sub_2478AA5A4();
}

uint64_t sub_24796A7FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24796A868(uint64_t a1)
{
  uint64_t v11 = v1[3];
  uint64_t v12 = v1[2];
  uint64_t v4 = v1[6];
  uint64_t v9 = v1[5];
  uint64_t v10 = v1[4];
  uint64_t v5 = v1[7];
  uint64_t v6 = v1[8];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24796D664;
  return sub_24792F13C(a1, v12, v11, v10, v9, v4, v5, v6);
}

unint64_t sub_24796A99C()
{
  unint64_t result = qword_269268CF8;
  if (!qword_269268CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269268CF8);
  }
  return result;
}

uint64_t sub_24796A9F0()
{
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24796AA38(uint64_t a1, uint64_t *a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_2478A1D80;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t *, uint64_t))((char *)&dword_269268D08 + dword_269268D08);
  return v7(a1, a2, v2 + 16);
}

uint64_t sub_24796AAF4(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2478A1D80;
  return sub_247947284(a1);
}

uint64_t sub_24796AB90(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24796D664;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269268D70 + dword_269268D70);
  return v6(a1, v4);
}

uint64_t sub_24796AC50(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_247998D10() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = *(void *)(v1 + v6 + 8);
  uint64_t v12 = *(void *)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_24796D664;
  return sub_247934624(a1, v7, v8, v9, v10, v11, v12);
}

uint64_t sub_24796AD94(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  void *v10 = v3;
  v10[1] = sub_24796D664;
  return sub_247958CE8(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_24796AE60(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_24796D664;
  return sub_247932BF0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_24796AF28()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24796AF60(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24796D664;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269268DB8 + dword_269268DB8);
  return v6(a1, v4);
}

uint64_t sub_24796B01C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24796B028()
{
  uint64_t v1 = sub_247998D10();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24796B104()
{
  uint64_t v2 = *(void *)(sub_247998D10() - 8);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_24796D664;
  uint64_t v7 = (void *)swift_task_alloc();
  v6[2] = v7;
  void *v7 = v6;
  v7[1] = sub_2478A1D80;
  return sub_24795AE34(v3, v4, v5);
}

uint64_t sub_24796B238()
{
  uint64_t v1 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268C10) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 64) & ~v2;
  uint64_t v13 = *(void *)(v1 + 64);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692687E8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_247998B20();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v0 + v3, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0 + v3, v8);
  }
  uint64_t v10 = (v3 + v13 + v6) & ~v6;
  uint64_t v11 = v10 + v7;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v10, v4);

  return MEMORY[0x270FA0238](v0, v11, v2 | v6 | 7);
}

uint64_t sub_24796B418(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268C10) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687E8);
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[4];
  uint64_t v10 = v1[5];
  uint64_t v11 = v1[6];
  uint64_t v12 = v1[7];
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v13;
  *uint64_t v13 = v3;
  v13[1] = sub_24796D664;
  return sub_24794EE44(a1, v7, v8, v9, v10, v11, v12, (uint64_t)v1 + v6);
}

uint64_t sub_24796B5A4(uint64_t a1)
{
  return sub_247958314(a1);
}

uint64_t sub_24796B5AC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24796B5E4()
{
  return objectdestroy_143Tm(&qword_2692687D0);
}

uint64_t sub_24796B5F0(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(sub_247998FB0() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692687D0) - 8);
  unint64_t v9 = (v7 + *(unsigned __int8 *)(v8 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v1 + 16);
  uint64_t v11 = *(void *)(v1 + 24);
  uint64_t v12 = v1 + v6;
  uint64_t v13 = v1 + v7;
  uint64_t v14 = *(void *)(v1 + v7);
  uint64_t v15 = *(void *)(v13 + 8);
  uint64_t v16 = v1 + v9;
  char v17 = *(unsigned char *)(v13 + 16);
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v18;
  void *v18 = v3;
  v18[1] = sub_24796D664;
  return sub_24794D980(a1, v10, v11, v12, v14, v15, v17, v16);
}

uint64_t sub_24796B77C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v10 = v2[6];
  uint64_t v11 = v2[7];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = sub_24796D664;
  return sub_247950294(a1, a2, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_24796B880()
{
  uint64_t v16 = sub_247998240();
  uint64_t v1 = *(void *)(v16 - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 576) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692687E8);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v4 + v7) & ~v7;
  uint64_t v9 = *(void *)(v6 + 64);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268C10) - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v17 = *(void *)(v10 + 64);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))((char *)v0 + v3, v16);
  (*(void (**)(char *, uint64_t))(v6 + 8))((char *)v0 + v8, v5);
  uint64_t v12 = (v8 + v9 + v11) & ~v11;
  uint64_t v13 = sub_247998B20();
  uint64_t v14 = *(void *)(v13 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))((char *)v0 + v12, 1, v13)) {
    (*(void (**)(char *, uint64_t))(v14 + 8))((char *)v0 + v12, v13);
  }

  return MEMORY[0x270FA0238](v0, v12 + v17, v2 | v7 | v11 | 7);
}

uint64_t sub_24796BBE0(uint64_t a1)
{
  sub_247998240();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687E8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  uint64_t v2 = v1[4];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[2];
  uint64_t v3 = v1[67];
  uint64_t v4 = v1[68];
  uint64_t v5 = v1[69];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v10 + 16) = v6;
  *uint64_t v6 = v10;
  v6[1] = sub_24796D664;
  return sub_247955A8C(a1, v9, v8, v2, (uint64_t)(v1 + 5), v3, v4, v5);
}

uint64_t sub_24796BDE4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24796D664;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269268E78 + dword_269268E78);
  return v6(a1, v4);
}

uint64_t sub_24796BE9C()
{
  uint64_t v1 = sub_247998240();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v18 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v3 = (v18 + 40) & ~v18;
  unint64_t v4 = (((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268C10) - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (v6 + ((((v4 + 511) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v6;
  uint64_t v17 = *(void *)(v5 + 64);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692687E8);
  uint64_t v8 = *(void *)(v19 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v16 = *(void *)(v8 + 64);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  uint64_t v10 = (id *)(v0 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8));
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v10 + 2));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_247998B20();
  uint64_t v12 = *(void *)(v11 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v12 + 48))(v0 + v7, 1, v11)) {
    (*(void (**)(unint64_t, uint64_t))(v12 + 8))(v0 + v7, v11);
  }
  unint64_t v13 = (v17 + v9 + v7) & ~v9;
  uint64_t v14 = v13 + v16;
  (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v0 + v13, v19);

  return MEMORY[0x270FA0238](v0, v14, v18 | v6 | v9 | 7);
}

uint64_t sub_24796C250(uint64_t a1)
{
  uint64_t v2 = *(void *)(sub_247998240() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687E8);
  uint64_t v12 = v1[3];
  uint64_t v13 = v1[2];
  uint64_t v11 = v1[4];
  uint64_t v7 = *(void *)((char *)v1 + v4);
  uint64_t v8 = *(void *)((char *)v1 + v5);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v14 + 16) = v9;
  *uint64_t v9 = v14;
  v9[1] = sub_24796D664;
  return sub_2479516A0(a1, v13, v12, v11, (uint64_t)v1 + v3, v7, v8, (uint64_t)v1 + v6);
}

uint64_t sub_24796C490()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = sub_24796D664;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_2479559B4, 0, 0);
}

uint64_t sub_24796C548(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_247998D10() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = *(void *)(v1 + v6 + 8);
  uint64_t v12 = *(void *)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_24796D664;
  return sub_24793387C(a1, v7, v8, v9, v10, v11, v12);
}

void sub_24796C68C(uint64_t a1)
{
  sub_247948778(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(_DWORD *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64));
}

uint64_t sub_24796C6A0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268ED8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = sub_247998240();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 56) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + v5 + 16);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_24796C81C(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268ED8);
  sub_247998240();

  return sub_247948BB8(a1, a2, a3, a4);
}

uint64_t sub_24796C92C(char a1)
{
  return sub_247903AA8(a1);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t objectdestroy_205Tm()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692687E8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_247998240();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_24796CAFC()
{
  return sub_247957E58();
}

uint64_t objectdestroy_193Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24796CC0C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24796D664;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_247957FC0, 0, 0);
}

uint64_t sub_24796CCB4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t objectdestroy_72Tm()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 137, 7);
}

uint64_t objectdestroy_102Tm()
{
  uint64_t v1 = sub_247998D10();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, v6 + 8, v5);
}

void sub_24796CE88(uint64_t a1)
{
  sub_24794B124(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

uint64_t sub_24796CE98()
{
  uint64_t v1 = sub_247998240();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = (v5 + v3 + v4) & ~v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F20);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = (v6 + v5 + v9) & ~v9;
  uint64_t v15 = v3 | v9 | 7;
  unint64_t v11 = (*(void *)(v8 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v12 = v0 + v4;
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v13(v12, v1);
  v13(v0 + v6, v1);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0 + v10, v7);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + v11 + 16);

  return MEMORY[0x270FA0238](v0, v11 + 56, v15);
}

uint64_t sub_24796D040(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v9 = *(void *)(sub_247998240() - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 16) & ~v10;
  uint64_t v12 = *(void *)(v9 + 64);
  uint64_t v13 = (v12 + v10 + v11) & ~v10;
  uint64_t v14 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268F20) - 8);
  unint64_t v15 = (v13 + v12 + *(unsigned __int8 *)(v14 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = (void *)(v4 + ((*(void *)(v14 + 64) + v15 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_24794B508(a1, a2, a3, a4, v4 + v11, v4 + v13, v4 + v15, v16);
}

uint64_t sub_24796D17C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24796D1C4()
{
  unint64_t result = qword_269268F30;
  if (!qword_269268F30)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269268F30);
  }
  return result;
}

unint64_t sub_24796D204()
{
  unint64_t result = qword_269268F40;
  if (!qword_269268F40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269268F40);
  }
  return result;
}

unint64_t sub_24796D258()
{
  unint64_t result = qword_269268F48;
  if (!qword_269268F48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269268F48);
  }
  return result;
}

uint64_t sub_24796D2AC(uint64_t a1, void (*a2)(void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_24796D2F0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24796D350()
{
  return objectdestroy_143Tm(&qword_269268F58);
}

uint64_t objectdestroy_143Tm(uint64_t *a1)
{
  uint64_t v3 = sub_247998FB0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = (v5 + 32) & ~v5;
  unint64_t v7 = (*(void *)(v4 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v7 + v10 + 17) & ~v10;
  uint64_t v12 = v11 + *(void *)(v9 + 64);
  uint64_t v13 = v5 | v10 | 7;
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1 + v6, v3);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1 + v11, v8);

  return MEMORY[0x270FA0238](v1, v12, v13);
}

uint64_t sub_24796D4CC(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(sub_247998FB0() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268F58) - 8);
  unint64_t v9 = (v7 + *(unsigned __int8 *)(v8 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v1 + 16);
  uint64_t v11 = *(void *)(v1 + 24);
  uint64_t v12 = v1 + v6;
  uint64_t v13 = v1 + v7;
  uint64_t v14 = *(void *)(v1 + v7);
  uint64_t v15 = *(void *)(v13 + 8);
  uint64_t v16 = v1 + v9;
  char v17 = *(unsigned char *)(v13 + 16);
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v18;
  void *v18 = v3;
  v18[1] = sub_24796D664;
  return sub_24794CF58(a1, v10, v11, v12, v14, v15, v17, v16);
}

uint64_t sub_24796D688()
{
  close(v0[4]);
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC5Anvil19ImmutableFileHandle_url;
  uint64_t v2 = sub_247998240();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24796D740()
{
  return type metadata accessor for ImmutableFileHandle();
}

uint64_t type metadata accessor for ImmutableFileHandle()
{
  uint64_t result = qword_269268FB8;
  if (!qword_269268FB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24796D794()
{
  uint64_t result = sub_247998240();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for DocumentRegistrationURLSessionDelegate()
{
  return self;
}

uint64_t sub_24796DBD4(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void (**)(uint64_t, unint64_t, void *, uint64_t))(v2
                                                                         + OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_completion);
  unint64_t v6 = (uint64_t *)(v2 + OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_data);
  swift_beginAccess();
  uint64_t v7 = *v6;
  unint64_t v8 = v6[1];
  sub_2478A06AC(v7, v8);
  id v9 = objc_msgSend(a1, sel_response);
  if (v9)
  {
    uint64_t v10 = v9;
    self;
    uint64_t v11 = (void *)swift_dynamicCastObjCClass();
    if (!v11) {
  }
    }
  else
  {
    uint64_t v11 = 0;
  }
  v5(v7, v8, v11, a2);

  return sub_2478A0704(v7, v8);
}

uint64_t sub_24796DCD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_247998CB0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_fileSize + 8)) {
    uint64_t v11 = a3;
  }
  else {
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_fileSize);
  }
  if (v11 < 1)
  {
    if (a1 < 0) {
      goto LABEL_10;
    }
  }
  else if (a1 < 0)
  {
    goto LABEL_10;
  }
  if ((a2 & 0x8000000000000000) == 0)
  {
    sub_247998C90();
    (*(void (**)(char *))(v3 + OBJC_IVAR____TtC5Anvil38DocumentRegistrationURLSessionDelegate_update))(v10);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
LABEL_10:
  uint64_t result = sub_247999900();
  __break(1u);
  return result;
}

uint64_t *sub_24796DE70(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v45 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v45 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_247998240();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v8;
    uint64_t v11 = (char *)a2 + v8;
    uint64_t v12 = *(void **)v11;
    uint64_t v13 = *((void *)v11 + 1);
    *(void *)uint64_t v10 = *(void *)v11;
    *((void *)v10 + 1) = v13;
    uint64_t v14 = *((void *)v11 + 4);
    *((_OWORD *)v10 + 1) = *((_OWORD *)v11 + 1);
    *((void *)v10 + 4) = v14;
    v10[40] = v11[40];
    uint64_t v16 = (void *)*((void *)v11 + 6);
    uint64_t v15 = *((void *)v11 + 7);
    *((void *)v10 + 6) = v16;
    *((void *)v10 + 7) = v15;
    uint64_t v17 = *((void *)v11 + 10);
    *((_OWORD *)v10 + 4) = *((_OWORD *)v11 + 4);
    *((void *)v10 + 10) = v17;
    v10[88] = v11[88];
    uint64_t v19 = (void *)*((void *)v11 + 12);
    uint64_t v18 = *((void *)v11 + 13);
    *((void *)v10 + 12) = v19;
    *((void *)v10 + 13) = v18;
    uint64_t v20 = *((void *)v11 + 16);
    *((_OWORD *)v10 + 7) = *((_OWORD *)v11 + 7);
    *((void *)v10 + 16) = v20;
    v10[136] = v11[136];
    uint64_t v22 = (void *)*((void *)v11 + 18);
    uint64_t v21 = *((void *)v11 + 19);
    *((void *)v10 + 18) = v22;
    *((void *)v10 + 19) = v21;
    uint64_t v23 = *((void *)v11 + 22);
    *((_OWORD *)v10 + 10) = *((_OWORD *)v11 + 10);
    *((void *)v10 + 22) = v23;
    v10[184] = v11[184];
    uint64_t v24 = *((void *)v11 + 25);
    uint64_t v47 = (void *)*((void *)v11 + 24);
    *((void *)v10 + 24) = v47;
    *((void *)v10 + 25) = v24;
    uint64_t v25 = *((void *)v11 + 28);
    *((_OWORD *)v10 + 13) = *((_OWORD *)v11 + 13);
    *((void *)v10 + 28) = v25;
    v10[232] = v11[232];
    uint64_t v26 = *((void *)v11 + 31);
    uint64_t v48 = (void *)*((void *)v11 + 30);
    *((void *)v10 + 30) = v48;
    *((void *)v10 + 31) = v26;
    uint64_t v27 = *((void *)v11 + 34);
    *((_OWORD *)v10 + 16) = *((_OWORD *)v11 + 16);
    *((void *)v10 + 34) = v27;
    v10[280] = v11[280];
    char v29 = (void *)*((void *)v11 + 36);
    uint64_t v28 = *((void *)v11 + 37);
    *((void *)v10 + 36) = v29;
    *((void *)v10 + 37) = v28;
    uint64_t v49 = v29;
    uint64_t v50 = *((void *)v11 + 40);
    *((_OWORD *)v10 + 19) = *((_OWORD *)v11 + 19);
    *((void *)v10 + 40) = v50;
    v10[328] = v11[328];
    BOOL v31 = (void *)*((void *)v11 + 42);
    uint64_t v30 = *((void *)v11 + 43);
    *((void *)v10 + 42) = v31;
    *((void *)v10 + 43) = v30;
    uint64_t v51 = v31;
    uint64_t v52 = *((void *)v11 + 46);
    *((_OWORD *)v10 + 22) = *((_OWORD *)v11 + 22);
    *((void *)v10 + 46) = v52;
    v10[376] = v11[376];
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    uint64_t v32 = a3[7];
    uint64_t v33 = a3[8];
    uint64_t v34 = (uint64_t *)((char *)a1 + v32);
    uint64_t v35 = (uint64_t *)((char *)a2 + v32);
    uint64_t v36 = v35[1];
    *uint64_t v34 = *v35;
    v34[1] = v36;
    *(uint64_t *)((char *)a1 + v33) = *(uint64_t *)((char *)a2 + v33);
    id v37 = v12;
    swift_bridgeObjectRetain();
    swift_retain();
    id v38 = v16;
    swift_bridgeObjectRetain();
    swift_retain();
    id v39 = v19;
    swift_bridgeObjectRetain();
    swift_retain();
    id v40 = v22;
    swift_bridgeObjectRetain();
    swift_retain();
    id v41 = v47;
    swift_bridgeObjectRetain();
    swift_retain();
    id v42 = v48;
    swift_bridgeObjectRetain();
    swift_retain();
    id v43 = v49;
    swift_bridgeObjectRetain();
    swift_retain();
    id v44 = v51;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_24796E198(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_247998240();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = (id *)(a1 + *(int *)(a2 + 20));

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24796E2EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247998240();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a3;
  uint64_t v10 = a1;
  uint64_t v11 = a1 + v7;
  uint64_t v12 = a2;
  uint64_t v13 = a2 + v7;
  uint64_t v14 = *(void **)v13;
  uint64_t v15 = *(void *)(v13 + 8);
  *(void *)uint64_t v11 = *(void *)v13;
  *(void *)(v11 + 8) = v15;
  uint64_t v16 = *(void *)(v13 + 32);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)(v13 + 16);
  *(void *)(v11 + 32) = v16;
  *(unsigned char *)(v11 + 40) = *(unsigned char *)(v13 + 40);
  uint64_t v18 = *(void **)(v13 + 48);
  uint64_t v17 = *(void *)(v13 + 56);
  *(void *)(v11 + 48) = v18;
  *(void *)(v11 + 56) = v17;
  uint64_t v19 = *(void *)(v13 + 80);
  *(_OWORD *)(v11 + 64) = *(_OWORD *)(v13 + 64);
  *(void *)(v11 + 80) = v19;
  *(unsigned char *)(v11 + 88) = *(unsigned char *)(v13 + 88);
  uint64_t v21 = *(void **)(v13 + 96);
  uint64_t v20 = *(void *)(v13 + 104);
  *(void *)(v11 + 96) = v21;
  *(void *)(v11 + 104) = v20;
  uint64_t v22 = *(void *)(v13 + 128);
  *(_OWORD *)(v11 + 112) = *(_OWORD *)(v13 + 112);
  *(void *)(v11 + 128) = v22;
  *(unsigned char *)(v11 + 136) = *(unsigned char *)(v13 + 136);
  uint64_t v24 = *(void **)(v13 + 144);
  uint64_t v23 = *(void *)(v13 + 152);
  *(void *)(v11 + 144) = v24;
  *(void *)(v11 + 152) = v23;
  uint64_t v25 = *(void *)(v13 + 176);
  *(_OWORD *)(v11 + 160) = *(_OWORD *)(v13 + 160);
  *(void *)(v11 + 176) = v25;
  *(unsigned char *)(v11 + 184) = *(unsigned char *)(v13 + 184);
  uint64_t v27 = *(void **)(v13 + 192);
  uint64_t v26 = *(void *)(v13 + 200);
  *(void *)(v11 + 192) = v27;
  *(void *)(v11 + 200) = v26;
  uint64_t v28 = *(void *)(v13 + 224);
  *(_OWORD *)(v11 + 208) = *(_OWORD *)(v13 + 208);
  *(void *)(v11 + 224) = v28;
  *(unsigned char *)(v11 + 232) = *(unsigned char *)(v13 + 232);
  uint64_t v30 = *(void **)(v13 + 240);
  uint64_t v29 = *(void *)(v13 + 248);
  *(void *)(v11 + 240) = v30;
  *(void *)(v11 + 248) = v29;
  uint64_t v31 = *(void *)(v13 + 272);
  *(_OWORD *)(v11 + 256) = *(_OWORD *)(v13 + 256);
  *(void *)(v11 + 272) = v31;
  *(unsigned char *)(v11 + 280) = *(unsigned char *)(v13 + 280);
  uint64_t v32 = *(void **)(v13 + 288);
  uint64_t v33 = *(void *)(v13 + 296);
  *(void *)(v11 + 288) = v32;
  *(void *)(v11 + 296) = v33;
  uint64_t v48 = v32;
  uint64_t v49 = *(void *)(v13 + 320);
  *(_OWORD *)(v11 + 304) = *(_OWORD *)(v13 + 304);
  *(void *)(v11 + 320) = v49;
  *(unsigned char *)(v11 + 328) = *(unsigned char *)(v13 + 328);
  uint64_t v34 = *(void *)(v13 + 344);
  uint64_t v51 = *(void **)(v13 + 336);
  *(void *)(v11 + 336) = v51;
  *(void *)(v11 + 344) = v34;
  uint64_t v53 = *(void *)(v13 + 368);
  *(_OWORD *)(v11 + 352) = *(_OWORD *)(v13 + 352);
  *(void *)(v11 + 368) = v53;
  *(unsigned char *)(v11 + 376) = *(unsigned char *)(v13 + 376);
  *(void *)(v10 + v8) = *(void *)(v12 + v8);
  uint64_t v35 = *(int *)(v9 + 28);
  uint64_t v36 = *(int *)(v9 + 32);
  id v37 = (void *)(v10 + v35);
  uint64_t v52 = v10;
  id v38 = (void *)(v12 + v35);
  uint64_t v50 = v38[1];
  void *v37 = *v38;
  v37[1] = v50;
  *(void *)(v10 + v36) = *(void *)(v12 + v36);
  id v39 = v14;
  swift_bridgeObjectRetain();
  swift_retain();
  id v40 = v18;
  swift_bridgeObjectRetain();
  swift_retain();
  id v41 = v21;
  swift_bridgeObjectRetain();
  swift_retain();
  id v42 = v24;
  swift_bridgeObjectRetain();
  swift_retain();
  id v43 = v27;
  swift_bridgeObjectRetain();
  swift_retain();
  id v44 = v30;
  swift_bridgeObjectRetain();
  swift_retain();
  id v45 = v48;
  swift_bridgeObjectRetain();
  swift_retain();
  id v46 = v51;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v52;
}

uint64_t sub_24796E5CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_247998240();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a2 + v7);
  uint64_t v11 = *(void **)v8;
  *(void *)uint64_t v8 = v10;
  id v12 = v10;

  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  *(void *)(v8 + 16) = *(void *)(v9 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(v9 + 32);
  *(void *)(v8 + 24) = *(void *)(v9 + 24);
  *(void *)(v8 + 32) = v13;
  swift_retain();
  swift_release();
  *(unsigned char *)(v8 + 40) = *(unsigned char *)(v9 + 40);
  uint64_t v14 = *(void **)(v9 + 48);
  uint64_t v15 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = v14;
  id v16 = v14;

  *(void *)(v8 + 56) = *(void *)(v9 + 56);
  *(void *)(v8 + 64) = *(void *)(v9 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(v9 + 80);
  *(void *)(v8 + 72) = *(void *)(v9 + 72);
  *(void *)(v8 + 80) = v17;
  swift_retain();
  swift_release();
  *(unsigned char *)(v8 + 88) = *(unsigned char *)(v9 + 88);
  uint64_t v18 = *(void **)(v9 + 96);
  uint64_t v19 = *(void **)(v8 + 96);
  *(void *)(v8 + 96) = v18;
  id v20 = v18;

  *(void *)(v8 + 104) = *(void *)(v9 + 104);
  *(void *)(v8 + 112) = *(void *)(v9 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = *(void *)(v9 + 128);
  *(void *)(v8 + 120) = *(void *)(v9 + 120);
  *(void *)(v8 + 128) = v21;
  swift_retain();
  swift_release();
  *(unsigned char *)(v8 + 136) = *(unsigned char *)(v9 + 136);
  uint64_t v22 = *(void **)(v9 + 144);
  uint64_t v23 = *(void **)(v8 + 144);
  *(void *)(v8 + 144) = v22;
  id v24 = v22;

  *(void *)(v8 + 152) = *(void *)(v9 + 152);
  *(void *)(v8 + 160) = *(void *)(v9 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v25 = *(void *)(v9 + 176);
  *(void *)(v8 + 168) = *(void *)(v9 + 168);
  *(void *)(v8 + 176) = v25;
  swift_retain();
  swift_release();
  *(unsigned char *)(v8 + 184) = *(unsigned char *)(v9 + 184);
  uint64_t v26 = *(void **)(v9 + 192);
  uint64_t v27 = *(void **)(v8 + 192);
  *(void *)(v8 + 192) = v26;
  id v28 = v26;

  *(void *)(v8 + 200) = *(void *)(v9 + 200);
  *(void *)(v8 + 208) = *(void *)(v9 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v29 = *(void *)(v9 + 224);
  *(void *)(v8 + 216) = *(void *)(v9 + 216);
  *(void *)(v8 + 224) = v29;
  swift_retain();
  swift_release();
  *(unsigned char *)(v8 + 232) = *(unsigned char *)(v9 + 232);
  uint64_t v30 = *(void **)(v9 + 240);
  v9 += 240;
  uint64_t v31 = *(void **)(v8 + 240);
  *(void *)(v8 + 240) = v30;
  id v32 = v30;

  *(void *)(v8 + 248) = *(void *)(v9 + 8);
  *(void *)(v8 + 256) = *(void *)(v9 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v33 = *(void *)(v9 + 32);
  *(void *)(v8 + 264) = *(void *)(v9 + 24);
  *(void *)(v8 + 272) = v33;
  swift_retain();
  swift_release();
  *(unsigned char *)(v8 + 280) = *(unsigned char *)(v9 + 40);
  uint64_t v34 = *(void **)(v9 + 48);
  uint64_t v35 = *(void **)(v8 + 288);
  *(void *)(v8 + 288) = v34;
  id v36 = v34;

  *(void *)(v8 + 296) = *(void *)(v9 + 56);
  *(void *)(v8 + 304) = *(void *)(v9 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v37 = *(void *)(v9 + 80);
  *(void *)(v8 + 312) = *(void *)(v9 + 72);
  *(void *)(v8 + 320) = v37;
  swift_retain();
  swift_release();
  *(unsigned char *)(v8 + 328) = *(unsigned char *)(v9 + 88);
  id v38 = *(void **)(v9 + 96);
  id v39 = *(void **)(v8 + 336);
  *(void *)(v8 + 336) = v38;
  id v40 = v38;

  *(void *)(v8 + 344) = *(void *)(v9 + 104);
  *(void *)(v8 + 352) = *(void *)(v9 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v41 = *(void *)(v9 + 128);
  *(void *)(v8 + 360) = *(void *)(v9 + 120);
  *(void *)(v8 + 368) = v41;
  swift_retain();
  swift_release();
  *(unsigned char *)(v8 + 376) = *(unsigned char *)(v9 + 136);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v42 = a3[7];
  id v43 = (void *)(a1 + v42);
  id v44 = (void *)(a2 + v42);
  *id v43 = *v44;
  v43[1] = v44[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24796E944(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_247998240();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  memcpy((void *)(a1 + a3[5]), (const void *)(a2 + a3[5]), 0x179uLL);
  uint64_t v7 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_24796E9E8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_247998240();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v11 = *(void *)(v9 + 16);
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  *(void *)(v8 + 16) = v11;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v8 + 24) = *(_OWORD *)(v9 + 24);
  swift_release();
  *(unsigned char *)(v8 + 40) = *(unsigned char *)(v9 + 40);
  id v12 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = *(void *)(v9 + 48);

  uint64_t v13 = *(void *)(v9 + 64);
  *(void *)(v8 + 56) = *(void *)(v9 + 56);
  *(void *)(v8 + 64) = v13;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v8 + 72) = *(_OWORD *)(v9 + 72);
  swift_release();
  *(unsigned char *)(v8 + 88) = *(unsigned char *)(v9 + 88);
  uint64_t v14 = *(void **)(v8 + 96);
  *(void *)(v8 + 96) = *(void *)(v9 + 96);

  uint64_t v15 = *(void *)(v9 + 112);
  *(void *)(v8 + 104) = *(void *)(v9 + 104);
  *(void *)(v8 + 112) = v15;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v8 + 120) = *(_OWORD *)(v9 + 120);
  swift_release();
  *(unsigned char *)(v8 + 136) = *(unsigned char *)(v9 + 136);
  id v16 = *(void **)(v8 + 144);
  *(void *)(v8 + 144) = *(void *)(v9 + 144);

  uint64_t v17 = *(void *)(v9 + 160);
  *(void *)(v8 + 152) = *(void *)(v9 + 152);
  *(void *)(v8 + 160) = v17;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v8 + 168) = *(_OWORD *)(v9 + 168);
  swift_release();
  *(unsigned char *)(v8 + 184) = *(unsigned char *)(v9 + 184);
  uint64_t v18 = *(void **)(v8 + 192);
  *(void *)(v8 + 192) = *(void *)(v9 + 192);

  uint64_t v19 = *(void *)(v9 + 208);
  *(void *)(v8 + 200) = *(void *)(v9 + 200);
  *(void *)(v8 + 208) = v19;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v8 + 216) = *(_OWORD *)(v9 + 216);
  swift_release();
  uint64_t v21 = *(void *)(v9 + 240);
  v9 += 240;
  uint64_t v20 = v21;
  uint64_t v22 = *(void **)(v8 + 240);
  v8 += 240;
  *(unsigned char *)(v8 - 8) = *(unsigned char *)(v9 - 8);
  *(void *)uint64_t v8 = v20;

  uint64_t v23 = *(void *)(v9 + 16);
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  *(void *)(v8 + 16) = v23;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v8 + 24) = *(_OWORD *)(v9 + 24);
  swift_release();
  *(unsigned char *)(v8 + 40) = *(unsigned char *)(v9 + 40);
  id v24 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = *(void *)(v9 + 48);

  uint64_t v25 = *(void *)(v9 + 64);
  *(void *)(v8 + 56) = *(void *)(v9 + 56);
  *(void *)(v8 + 64) = v25;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v8 + 72) = *(_OWORD *)(v9 + 72);
  swift_release();
  *(unsigned char *)(v8 + 88) = *(unsigned char *)(v9 + 88);
  uint64_t v26 = *(void **)(v8 + 96);
  *(void *)(v8 + 96) = *(void *)(v9 + 96);

  uint64_t v27 = *(void *)(v9 + 112);
  *(void *)(v8 + 104) = *(void *)(v9 + 104);
  *(void *)(v8 + 112) = v27;
  swift_bridgeObjectRelease();
  *(_OWORD *)(v8 + 120) = *(_OWORD *)(v9 + 120);
  swift_release();
  *(unsigned char *)(v8 + 136) = *(unsigned char *)(v9 + 136);
  uint64_t v28 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (uint64_t *)(a2 + v28);
  uint64_t v32 = *v30;
  uint64_t v31 = v30[1];
  *uint64_t v29 = v32;
  v29[1] = v31;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24796EC64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24796EC78);
}

uint64_t sub_24796EC78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247998240();
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
    return (v10 + 1);
  }
}

uint64_t sub_24796ED38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24796ED4C);
}

uint64_t sub_24796ED4C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_247998240();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for BlackPowder()
{
  uint64_t result = qword_269269120;
  if (!qword_269269120) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24796EE54()
{
  uint64_t result = sub_247998240();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24796EF10(void (*a1)(uint64_t *__return_ptr, char *))
{
  uint64_t v4 = sub_247998B00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269160);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2478E6A48(v1, (uint64_t)v10, &qword_269269160);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1) {
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
  a1(&v13, v7);
  if (v2) {
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v13;
}

uint64_t sub_24796F0F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[10] = a6;
  v7[11] = v6;
  v7[8] = a4;
  v7[9] = a5;
  v7[6] = a2;
  v7[7] = a3;
  v7[5] = a1;
  v7[12] = type metadata accessor for BlackPowder();
  v7[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24796F190, 0, 0);
}

uint64_t sub_24796F190()
{
  void (*v12)(uint64_t *__return_ptr, uint64_t);
  int v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (__cdecl *v62)();
  uint64_t v63;
  unint64_t v64;
  void *v65;
  uint64_t v66;

  BOOL v65 = v0;
  uint64_t v1 = v0[8];
  if (!(v0[6] | v1))
  {
    __break(1u);
    JUMPOUT(0x24796F9F0);
  }
  unint64_t v60 = v0[6];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[12];
  v0[2] = MEMORY[0x263F8EE80];
  uint64_t v4 = v2 + *(int *)(v3 + 20);
  uint64_t v5 = v0[13];
  uint64_t v57 = v1;
  if (*(unsigned char *)(v4 + 40))
  {
    (*(void (**)(uint64_t *__return_ptr, void))(v4 + 24))(&v63, *(void *)v4);
    unint64_t v6 = v64;
    uint64_t v61 = v63;
    sub_2479787DC(v2, v5);
    if (v6) {
      goto LABEL_15;
    }
  }
  else
  {
    sub_2479787DC(v2, v5);
  }
  if (qword_269266A50 != -1) {
    swift_once();
  }
  unint64_t v7 = *(void *)algn_26927FB98;
  uint64_t v56 = qword_26927FB90;
  unint64_t v8 = unk_26927FBA8;
  uint64_t v58 = qword_26927FBA0;
  unint64_t v6 = unk_26927FBB8;
  uint64_t v61 = qword_26927FBB0;
  int v9 = byte_26927FBC0;
  uint64_t v10 = v0[13] + *(int *)(v3 + 20);
  uint64_t v11 = *(void *)(v10 + 144);
  uint64_t v12 = *(void (**)(uint64_t *__return_ptr, uint64_t))(v10 + 168);
  uint64_t v13 = *(unsigned __int8 *)(v10 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v13 == 1)
  {
    v12(&v63, v11);
    uint64_t v14 = v63;
    if (!v9) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v14 = 3;
    if (!v9)
    {
LABEL_14:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
  }
  switch(v14)
  {
    case 1:
    case 3:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v61 = v58;
      unint64_t v6 = v8;
      break;
    case 2:
      goto LABEL_14;
    default:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v61 = v56;
      unint64_t v6 = v7;
      break;
  }
LABEL_15:
  sub_247978840(v0[13]);
  if (*(unsigned char *)(v4 + 136) == 1)
  {
    (*(void (**)(uint64_t *__return_ptr, void))(v4 + 120))(&v63, *(void *)(v4 + 96));
    id v16 = v63;
    uint64_t v15 = v64;
  }
  else
  {
    uint64_t v15 = 0;
    id v16 = 0;
  }
  if (v15) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0x2D38302D34323032;
  }
  if (v15) {
    uint64_t v18 = v15;
  }
  else {
    uint64_t v18 = 0xEA00000000003832;
  }
  if (qword_269266AA0 != -1) {
    swift_once();
  }
  uint64_t v19 = v0 + 2;
  uint64_t v20 = sub_247999030();
  __swift_project_value_buffer(v20, (uint64_t)qword_26927FC68);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v21 = sub_247999010();
  uint64_t v22 = sub_2479996B0();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v59 = v17;
    id v24 = swift_slowAlloc();
    uint64_t v63 = v24;
    *(_DWORD *)uint64_t v23 = 136315394;
    swift_bridgeObjectRetain();
    v0[3] = sub_247918FF0(v59, v18, &v63);
    sub_247999720();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v23 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[4] = sub_247918FF0(v61, v6, &v63);
    sub_247999720();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247896000, v21, v22, "Using API version:%s and app id: %s", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    uint64_t v25 = v24;
    uint64_t v17 = v59;
    MEMORY[0x24C564070](v25, -1, -1);
    uint64_t v26 = v23;
    uint64_t v19 = v0 + 2;
    MEMORY[0x24C564070](v26, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  uint64_t v27 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v63 = v27;
  *uint64_t v19 = 0x8000000000000000;
  sub_24791D0E4(v17, v18, 0x2D54504774616843, 0xEF6E6F6973726556, isUniquelyReferenced_nonNull_native);
  uint64_t v29 = v63;
  swift_bridgeObjectRelease();
  if (*(unsigned char *)(v4 + 88))
  {
    (*(void (**)(uint64_t *__return_ptr, void))(v4 + 72))(&v63, *(void *)(v4 + 48));
    if (v64)
    {
      swift_bridgeObjectRelease();
      uint64_t v30 = sub_247999010();
      uint64_t v31 = sub_247999690();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v32 = 0;
        _os_log_impl(&dword_247896000, v30, v31, "Using overridden API key!", v32, 2u);
        MEMORY[0x24C564070](v32, -1, -1);
      }

      uint64_t v63 = 0x20726572616542;
      os_log_type_t v64 = 0xE700000000000000;
      sub_2479993D0();
      swift_bridgeObjectRelease();
      uint64_t v33 = v63;
      uint64_t v34 = v64;
      uint64_t v35 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v63 = v29;
      sub_24791D0E4(v33, v34, 0x7A69726F68747541, 0xED00006E6F697461, v35);
      id v36 = v63;
      *uint64_t v19 = v63;
      goto LABEL_43;
    }
  }
  if (v60)
  {
    swift_bridgeObjectRelease();
    uint64_t v37 = sub_247999010();
    id v38 = sub_247999680();
    if (os_log_type_enabled(v37, v38))
    {
      id v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v39 = 0;
      _os_log_impl(&dword_247896000, v37, v38, "User is signed in. Authenticating with stored access token.", v39, 2u);
      MEMORY[0x24C564070](v39, -1, -1);
    }

    uint64_t v63 = 0x20726572616542;
    os_log_type_t v64 = 0xE700000000000000;
    sub_2479993D0();
    id v40 = v63;
    uint64_t v41 = v64;
    uint64_t v42 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v63 = v29;
    id v43 = v40;
    id v44 = v41;
    id v45 = 0x7A69726F68747541;
    id v46 = 0xED00006E6F697461;
    goto LABEL_42;
  }
  uint64_t v47 = sub_247999010();
  uint64_t v48 = sub_247999680();
  if (os_log_type_enabled(v47, v48))
  {
    uint64_t v49 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v49 = 0;
    _os_log_impl(&dword_247896000, v47, v48, "User is not logged in. Authenticating anonymously.", v49, 2u);
    MEMORY[0x24C564070](v49, -1, -1);
  }

  uint64_t v50 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v63 = v29;
  sub_24791D0E4(v61, v6, 0x412D49416E65704FLL, 0xEA00000000007070, v50);
  uint64_t v51 = v63;
  *uint64_t v19 = v63;
  swift_bridgeObjectRelease();
  if (v57)
  {
    uint64_t v53 = v0[7];
    uint64_t v52 = v0[8];
    swift_bridgeObjectRetain();
    uint64_t v42 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v63 = v51;
    id v46 = 0x80000002479A7560;
    id v43 = v53;
    id v44 = v52;
    id v45 = 0xD000000000000016;
LABEL_42:
    sub_24791D0E4(v43, v44, v45, v46, v42);
    id v36 = v63;
    v0[2] = v63;
LABEL_43:
    swift_bridgeObjectRelease();
    goto LABEL_44;
  }
  sub_24791C430(0xD000000000000016, 0x80000002479A7560);
  swift_bridgeObjectRelease();
  id v36 = *v19;
LABEL_44:
  v0[14] = v36;
  uint64_t v62 = (uint64_t (__cdecl *)())((char *)&dword_269266CF8 + dword_269266CF8);
  uint64_t v54 = (void *)swift_task_alloc();
  v0[15] = v54;
  *uint64_t v54 = v0;
  v54[1] = sub_24796FA00;
  return v62();
}

uint64_t sub_24796FA00(uint64_t a1)
{
  *(void *)(*(void *)v1 + 128) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24796FB00, 0, 0);
}

void sub_24796FB00()
{
  int64_t v1 = 0;
  uint64_t v2 = v0[16];
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v49 = v2;
  uint64_t v50 = v0 + 2;
  char v4 = *(unsigned char *)(v2 + 32);
  uint64_t v5 = -1;
  uint64_t v6 = -1 << v4;
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & v3;
  int64_t v48 = (unint64_t)(63 - v6) >> 6;
  unint64_t v8 = (void *)v0[14];
  while (1)
  {
    if (v7)
    {
      unint64_t v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      int64_t v11 = v1;
      unint64_t v12 = v10 | (v1 << 6);
      goto LABEL_22;
    }
    int64_t v13 = v1 + 1;
    if (__OFADD__(v1, 1)) {
      goto LABEL_41;
    }
    if (v13 >= v48) {
      break;
    }
    unint64_t v14 = *(void *)(v47 + 8 * v13);
    int64_t v15 = v1 + 1;
    if (!v14)
    {
      int64_t v15 = v1 + 2;
      if (v1 + 2 >= v48) {
        break;
      }
      unint64_t v14 = *(void *)(v47 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v1 + 3;
        if (v1 + 3 >= v48) {
          break;
        }
        unint64_t v14 = *(void *)(v47 + 8 * v15);
        if (!v14)
        {
          uint64_t v16 = v1 + 4;
          if (v1 + 4 >= v48) {
            break;
          }
          unint64_t v14 = *(void *)(v47 + 8 * v16);
          if (!v14)
          {
            while (1)
            {
              int64_t v15 = v16 + 1;
              if (__OFADD__(v16, 1)) {
                goto LABEL_42;
              }
              if (v15 >= v48) {
                goto LABEL_33;
              }
              unint64_t v14 = *(void *)(v47 + 8 * v15);
              ++v16;
              if (v14) {
                goto LABEL_21;
              }
            }
          }
          int64_t v15 = v1 + 4;
        }
      }
    }
LABEL_21:
    unint64_t v7 = (v14 - 1) & v14;
    int64_t v11 = v15;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
LABEL_22:
    uint64_t v17 = 16 * v12;
    uint64_t v18 = (uint64_t *)(*(void *)(v49 + 48) + v17);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    uint64_t v21 = (uint64_t *)(*(void *)(v49 + 56) + v17);
    uint64_t v23 = *v21;
    uint64_t v22 = v21[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v50 = 0x8000000000000000;
    unint64_t v26 = sub_247917D8C(v20, v19);
    uint64_t v27 = v8[2];
    BOOL v28 = (v25 & 1) == 0;
    uint64_t v29 = v27 + v28;
    if (__OFADD__(v27, v28))
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return;
    }
    char v30 = v25;
    if (v8[3] >= v29)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v25) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_2479199D0();
        if (v30) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_24791A704(v29, isUniquelyReferenced_nonNull_native);
      unint64_t v31 = sub_247917D8C(v20, v19);
      if ((v30 & 1) != (v32 & 1))
      {
        sub_247999C20();
        return;
      }
      unint64_t v26 = v31;
      if (v30)
      {
LABEL_4:
        int v9 = (void *)(v8[7] + 16 * v26);
        swift_bridgeObjectRelease();
        *int v9 = v23;
        v9[1] = v22;
        goto LABEL_5;
      }
    }
    v8[(v26 >> 6) + 8] |= 1 << v26;
    uint64_t v33 = (uint64_t *)(v8[6] + 16 * v26);
    *uint64_t v33 = v20;
    v33[1] = v19;
    uint64_t v34 = (void *)(v8[7] + 16 * v26);
    *uint64_t v34 = v23;
    v34[1] = v22;
    uint64_t v35 = v8[2];
    BOOL v36 = __OFADD__(v35, 1);
    uint64_t v37 = v35 + 1;
    if (v36) {
      goto LABEL_40;
    }
    v8[2] = v37;
    swift_bridgeObjectRetain();
LABEL_5:
    int64_t v1 = v11;
    *uint64_t v50 = v8;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_33:
  uint64_t v39 = v46[9];
  uint64_t v38 = v46[10];
  swift_release();
  uint64_t v40 = sub_24792E0A8(v39, v38);
  uint64_t v42 = v41;
  uint64_t v43 = v46[2];
  char v44 = swift_isUniquelyReferenced_nonNull_native();
  v46[2] = 0x8000000000000000;
  sub_24791D0E4(v40, v42, 0x6567412D72657355, 0xEA0000000000746ELL, v44);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  id v45 = (void (*)(uint64_t))v46[1];
  v45(v43);
}

uint64_t sub_24796FEC8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_247975970(a1, 0x7364616F6C70752FLL, 0xE800000000000000, a2);
}

uint64_t sub_24796FEE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v16[3] = a3;
  v16[4] = a4;
  v16[1] = a1;
  v16[2] = a2;
  uint64_t v19 = a5;
  uint64_t v5 = sub_247998190();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_247998240();
  uint64_t v17 = *(void *)(v9 - 8);
  uint64_t v18 = v9;
  MEMORY[0x270FA5388](v9);
  int64_t v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = 0x6E6F69737365732FLL;
  unint64_t v21 = 0xE900000000000073;
  uint64_t v12 = *MEMORY[0x263F06E50];
  int64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v13(v8, v12, v5);
  sub_2478A3014();
  sub_247998230();
  unint64_t v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v8, v5);
  swift_bridgeObjectRelease();
  uint64_t v20 = 0;
  unint64_t v21 = 0xE000000000000000;
  sub_247999800();
  swift_bridgeObjectRelease();
  uint64_t v20 = 47;
  unint64_t v21 = 0xE100000000000000;
  sub_2479993D0();
  sub_2479993D0();
  sub_2479993D0();
  sub_2479993D0();
  v13(v8, v12, v5);
  sub_247998230();
  v14(v8, v5);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v11, v18);
}

uint64_t sub_247970194@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_247975970(a1, 0x73656C69662FLL, 0xE600000000000000, a2);
}

uint64_t sub_2479701A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  v15[1] = a1;
  v15[2] = a2;
  uint64_t v20 = a5;
  uint64_t v5 = sub_247998190();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_247998240();
  uint64_t v16 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = 0x6E6F69737365732FLL;
  unint64_t v22 = 0xE900000000000073;
  uint64_t v11 = *MEMORY[0x263F06E50];
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v12(v8, v11, v5);
  sub_2478A3014();
  sub_247998230();
  int64_t v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v8, v5);
  swift_bridgeObjectRelease();
  uint64_t v21 = 47;
  unint64_t v22 = 0xE100000000000000;
  sub_2479993D0();
  sub_2479993D0();
  sub_2479993D0();
  v12(v8, v11, v5);
  sub_247998230();
  v13(v8, v5);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v10, v19);
}

id sub_247970424@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v514 = a8;
  uint64_t v541 = a6;
  uint64_t v490 = a5;
  uint64_t v508 = a4;
  uint64_t v492 = a3;
  uint64_t v486 = a2;
  uint64_t v485 = a1;
  v489 = a9;
  uint64_t v500 = sub_2479986A0();
  uint64_t v499 = *(void *)(v500 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v500);
  v497 = (char *)&v431 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v498 = (char *)&v431 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v488 = (char *)&v431 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v495 = (char *)&v431 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v496 = (char *)&v431 - v22;
  MEMORY[0x270FA5388](v21);
  v487 = (char *)&v431 - v23;
  v569 = (void *)sub_247999030();
  uint64_t v24 = *(v569 - 1);
  MEMORY[0x270FA5388](v569);
  v507 = (char *)&v431 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v506 = sub_247998E30();
  uint64_t v505 = *(void *)(v506 - 8);
  MEMORY[0x270FA5388](v506);
  v491 = (char *)&v431 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269130);
  MEMORY[0x270FA5388](v27 - 8);
  uint64_t v504 = (uint64_t)&v431 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v512 = sub_247998E90();
  uint64_t v511 = *(void *)(v512 - 8);
  MEMORY[0x270FA5388](v512);
  v503 = (char *)&v431 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269138);
  uint64_t v31 = MEMORY[0x270FA5388](v30 - 8);
  uint64_t v509 = (uint64_t)&v431 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  uint64_t v513 = (uint64_t)&v431 - v33;
  uint64_t v520 = sub_247998EA0();
  uint64_t v510 = *(void *)(v520 - 8);
  uint64_t v34 = MEMORY[0x270FA5388](v520);
  v502 = (uint64_t *)((char *)&v431 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v34);
  v519 = (char *)&v431 - v36;
  uint64_t v516 = sub_247998F20();
  uint64_t v494 = *(void *)(v516 - 8);
  MEMORY[0x270FA5388](v516);
  v518 = (char *)&v431 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v523 = sub_247998EC0();
  uint64_t v493 = *(void *)(v523 - 8);
  uint64_t v38 = MEMORY[0x270FA5388](v523);
  v522 = (char *)&v431 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v38);
  v517 = (char *)&v431 - v40;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269140);
  MEMORY[0x270FA5388](v41 - 8);
  v528 = (char *)&v431 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v532 = sub_247998960();
  uint64_t v540 = *(void *)(v532 - 8);
  MEMORY[0x270FA5388](v532);
  v527 = (char *)&v431 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v563 = (void (**)(char *, uint64_t))sub_247998A90();
  v535 = (char *)*(v563 - 1);
  MEMORY[0x270FA5388](v563);
  v562 = (char *)&v431 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  v549 = (uint8_t *)sub_247998A50();
  uint64_t v537 = *((void *)v549 - 1);
  uint64_t v45 = MEMORY[0x270FA5388](v549);
  v526 = (char *)&v431 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v45);
  v548 = (char *)&v431 - v47;
  uint64_t v550 = sub_247998AA0();
  uint64_t v538 = *(void *)(v550 - 8);
  uint64_t v48 = MEMORY[0x270FA5388](v550);
  v531 = (char *)&v431 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v48);
  v551 = ((char *)&v431 - v50);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268250);
  MEMORY[0x270FA5388](v51 - 8);
  v544 = (char *)&v431 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_247998240();
  uint64_t v534 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v564 = (uint64_t)&v431 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_2479984E0();
  uint64_t v56 = *(void *)(v55 - 8);
  uint64_t v567 = v55;
  uint64_t v568 = v56;
  MEMORY[0x270FA5388](v55);
  v566 = (char *)&v431 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = (void (*)(char *, uint64_t))sub_2479984D0();
  uint64_t v570 = *((void *)v58 - 1);
  MEMORY[0x270FA5388](v58);
  unint64_t v60 = (char *)&v431 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_247998980();
  uint64_t v536 = *(void *)(v61 - 8);
  uint64_t v62 = MEMORY[0x270FA5388](v61);
  v524 = (char *)&v431 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v62);
  v545 = (char *)&v431 - v64;
  uint64_t v555 = sub_2479989A0();
  v533 = *(char **)(v555 - 8);
  MEMORY[0x270FA5388](v555);
  v565 = (char *)&v431 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v553 = _s14MessageContentOMa(0);
  uint64_t v552 = *(void *)(v553 - 8);
  uint64_t v66 = MEMORY[0x270FA5388](v553);
  uint64_t v554 = (uint64_t)&v431 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v66);
  v546 = (void (**)(uint64_t, uint64_t))((char *)&v431 - v68);
  v560 = (void (**)(void, void))sub_2479989F0();
  uint64_t v539 = (uint64_t)*(v560 - 1);
  uint64_t v69 = MEMORY[0x270FA5388](v560);
  v530 = (char *)&v431 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = MEMORY[0x270FA5388](v69);
  v525 = (char *)&v431 - v72;
  uint64_t v73 = MEMORY[0x270FA5388](v71);
  v561 = (void (**)(uint64_t, uint64_t))((char *)&v431 - v74);
  MEMORY[0x270FA5388](v73);
  v547 = (char *)&v431 - v75;
  uint64_t v558 = sub_2479989D0();
  unint64_t v543 = *(void *)(v558 - 8);
  uint64_t v76 = MEMORY[0x270FA5388](v558);
  v529 = (char *)&v431 - ((v77 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = MEMORY[0x270FA5388](v76);
  v556 = (char *)&v431 - v79;
  MEMORY[0x270FA5388](v78);
  v557 = (void (*)(char *, uint64_t))((char *)&v431 - v80);
  v559 = (void (**)(void, void, void))sub_247998A20();
  uint64_t v542 = (uint64_t)*(v559 - 1);
  uint64_t v81 = MEMORY[0x270FA5388](v559);
  v515 = (char *)&v431 - ((v82 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = MEMORY[0x270FA5388](v81);
  uint64_t v85 = (uint64_t)&v431 - v84;
  MEMORY[0x270FA5388](v83);
  unsigned int v87 = (char *)&v431 - v86;
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269148);
  MEMORY[0x270FA5388](v88 - 8);
  uint64_t v90 = (char *)&v431 - ((v89 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247998670();
  if ((v91 & 1) == 0)
  {
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer((uint64_t)v569, (uint64_t)qword_26927FC68);
    uint64_t v92 = sub_247999010();
    os_log_type_t v93 = sub_247999690();
    if (os_log_type_enabled(v92, v93))
    {
      uint64_t v94 = (uint8_t *)swift_slowAlloc();
      uint64_t v95 = swift_slowAlloc();
      v571[0] = v95;
      *(_DWORD *)uint64_t v94 = 136315138;
      v578 = (char *)type metadata accessor for BlackPowder();
      __swift_instantiateConcreteTypeFromMangledName(qword_269268A60);
      uint64_t v96 = sub_247999390();
      v578 = (char *)sub_247918FF0(v96, v97, v571);
      sub_247999720();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247896000, v92, v93, "%s does not support frequency penalty!", v94, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v95, -1, -1);
      MEMORY[0x24C564070](v94, -1, -1);
    }
LABEL_25:

    uint64_t v119 = v567;
    uint64_t v118 = v568;
    uint64_t v120 = v570;
    v571[0] = 0;
    v571[1] = 0xE000000000000000;
    sub_247999800();
    v571[0] = type metadata accessor for BlackPowder();
    __swift_instantiateConcreteTypeFromMangledName(qword_269268A60);
    uint64_t v121 = sub_247999390();
    uint64_t v123 = v122;
    swift_bridgeObjectRelease();
    v571[0] = v121;
    v571[1] = v123;
    sub_2479993D0();
    sub_2479984B0();
    uint64_t v124 = v566;
    (*(void (**)(char *, char *, void (*)(char *, uint64_t)))(v120 + 16))(v566, v60, v58);
    (*(void (**)(char *, void, uint64_t))(v118 + 104))(v124, *MEMORY[0x263F7F810], v119);
    sub_247977850(&qword_269266BF0, MEMORY[0x263F7F830]);
    swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v118 + 16))(v125, v124, v119);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v118 + 8))(v124, v119);
    return (id)(*(uint64_t (**)(char *, void *))(v120 + 8))(v60, v58);
  }
  sub_247998640();
  if ((v98 & 1) == 0)
  {
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer((uint64_t)v569, (uint64_t)qword_26927FC68);
    uint64_t v92 = sub_247999010();
    os_log_type_t v99 = sub_247999690();
    if (os_log_type_enabled(v92, v99))
    {
      uint64_t v100 = (uint8_t *)swift_slowAlloc();
      uint64_t v101 = swift_slowAlloc();
      v571[0] = v101;
      *(_DWORD *)uint64_t v100 = 136315138;
      v578 = (char *)type metadata accessor for BlackPowder();
      __swift_instantiateConcreteTypeFromMangledName(qword_269268A60);
      uint64_t v102 = sub_247999390();
      v578 = (char *)sub_247918FF0(v102, v103, v571);
      sub_247999720();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247896000, v92, v99, "%s does not support length penalty!", v100, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v101, -1, -1);
      MEMORY[0x24C564070](v100, -1, -1);
    }
    goto LABEL_25;
  }
  sub_247998650();
  if ((v104 & 1) == 0)
  {
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer((uint64_t)v569, (uint64_t)qword_26927FC68);
    uint64_t v92 = sub_247999010();
    os_log_type_t v105 = sub_247999690();
    if (os_log_type_enabled(v92, v105))
    {
      uint64_t v106 = (uint8_t *)swift_slowAlloc();
      uint64_t v107 = swift_slowAlloc();
      v571[0] = v107;
      *(_DWORD *)uint64_t v106 = 136315138;
      v578 = (char *)type metadata accessor for BlackPowder();
      __swift_instantiateConcreteTypeFromMangledName(qword_269268A60);
      uint64_t v108 = sub_247999390();
      v578 = (char *)sub_247918FF0(v108, v109, v571);
      sub_247999720();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247896000, v92, v105, "%s does not support maximum tokens!", v106, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v107, -1, -1);
      MEMORY[0x24C564070](v106, -1, -1);
    }
    goto LABEL_25;
  }
  uint64_t v452 = v24;
  sub_247998690();
  uint64_t v110 = sub_247998600();
  int v111 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v110 - 8) + 48))(v90, 1, v110);
  sub_2478A1A1C((uint64_t)v90, &qword_269269148);
  if (v111 != 1)
  {
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer((uint64_t)v569, (uint64_t)qword_26927FC68);
    uint64_t v92 = sub_247999010();
    os_log_type_t v127 = sub_247999690();
    if (os_log_type_enabled(v92, v127))
    {
      uint64_t v128 = (uint8_t *)swift_slowAlloc();
      uint64_t v129 = swift_slowAlloc();
      v571[0] = v129;
      *(_DWORD *)uint64_t v128 = 136315138;
      v578 = (char *)type metadata accessor for BlackPowder();
      __swift_instantiateConcreteTypeFromMangledName(qword_269268A60);
      uint64_t v130 = sub_247999390();
      v578 = (char *)sub_247918FF0(v130, v131, v571);
      sub_247999720();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247896000, v92, v127, "%s does not support sampling strategies!", v128, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v129, -1, -1);
      MEMORY[0x24C564070](v128, -1, -1);
    }
    goto LABEL_25;
  }
  uint64_t v112 = *(void *)(sub_247998660() + 16);
  swift_bridgeObjectRelease();
  if (v112)
  {
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer((uint64_t)v569, (uint64_t)qword_26927FC68);
    uint64_t v92 = sub_247999010();
    os_log_type_t v113 = sub_247999690();
    if (os_log_type_enabled(v92, v113))
    {
      uint64_t v114 = (uint8_t *)swift_slowAlloc();
      uint64_t v115 = swift_slowAlloc();
      v571[0] = v115;
      *(_DWORD *)uint64_t v114 = 136315138;
      v578 = (char *)type metadata accessor for BlackPowder();
      __swift_instantiateConcreteTypeFromMangledName(qword_269268A60);
      uint64_t v116 = sub_247999390();
      v578 = (char *)sub_247918FF0(v116, v117, v571);
      sub_247999720();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247896000, v92, v113, "%s does not support stop sequences!", v114, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v115, -1, -1);
      MEMORY[0x24C564070](v114, -1, -1);
    }
    goto LABEL_25;
  }
  uint64_t v132 = *(void *)(v541 + 16);
  uint64_t v432 = a7;
  uint64_t v478 = v85;
  uint64_t v484 = v61;
  uint64_t v480 = v53;
  uint64_t v447 = v132;
  v446 = v58;
  v479 = v60;
  if (v132)
  {
    v483 = *(void (**)(char *, uint64_t, void))(v542 + 16);
    uint64_t v85 = v132;
    unint64_t v133 = (*(unsigned __int8 *)(v542 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v542 + 80);
    LODWORD(v481) = *MEMORY[0x263F7FA90];
    v477 = (void (**)(char *, void, uint64_t))(v543 + 104);
    v475 = (void (**)(char *, uint64_t))(v543 + 8);
    v476 = (void (**)(char *, uint64_t))(v542 + 8);
    uint64_t v482 = v542 + 16;
    uint64_t v134 = *(void *)(v542 + 72);
    uint64_t v135 = swift_bridgeObjectRetain() + v133 + v134 * (v85 - 1);
    v474 = (uint64_t (**)(char *, uint8_t *))-v134;
    uint64_t v58 = v557;
    uint64_t v136 = v556;
    uint64_t v137 = v475;
    while (1)
    {
      v483(v87, v135, v559);
      sub_2479989E0();
      uint64_t v138 = v558;
      (*v477)(v136, v481, v558);
      sub_247977850(&qword_269269150, MEMORY[0x263F7FA98]);
      char v139 = sub_247999310();
      uint64_t v140 = *v137;
      (*v137)(v136, v138);
      v140((char *)v58, v138);
      (*v476)(v87, (uint64_t)v559);
      if (v139) {
        break;
      }
      v135 += (uint64_t)v474;
      if (!--v85)
      {
        uint64_t v141 = 0;
        uint64_t v142 = v478;
        uint64_t v61 = v484;
        uint64_t v132 = v447;
        goto LABEL_38;
      }
    }
    uint64_t v132 = v447;
    uint64_t v141 = v85;
    uint64_t v142 = v478;
    uint64_t v143 = &v516;
    uint64_t v61 = v484;
    if (v447 < v85)
    {
      __break(1u);
LABEL_133:
      *(v143 - 32) = 0;
      uint64_t v467 = 0;
      v448 = (void *)MEMORY[0x263F8EE78];
      v451 = (void *)MEMORY[0x263F8EE78];
LABEL_134:
      swift_bridgeObjectRelease();
      v557 = *(void (**)(char *, uint64_t))(v514 + 16);
      if (!v557)
      {
        v318 = (void *)MEMORY[0x263F8EE78];
        v566 = (char *)MEMORY[0x263F8EE78];
LABEL_159:
        if (*(void *)(a11 + 16))
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v318 = sub_247918858(0, v318[2] + 1, 1, v318);
          }
          unint64_t v328 = v318[2];
          unint64_t v327 = v318[3];
          if (v328 >= v327 >> 1) {
            v318 = sub_247918858((void *)(v327 > 1), v328 + 1, 1, v318);
          }
          v318[2] = v328 + 1;
          v329 = &v318[6 * v328];
          *((_OWORD *)v329 + 2) = xmmword_2479A4830;
          v329[7] = 0;
          v329[8] = 0;
          v329[6] = 0;
          *((unsigned char *)v329 + 72) = 0;
        }
        if (*(void *)(a12 + 16))
        {
          (*(void (**)(uint64_t, unint64_t, uint64_t))(v511 + 16))(v513, a12 + ((*(unsigned __int8 *)(v511 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v511 + 80)), v512);
          uint64_t v330 = 0;
        }
        else
        {
          uint64_t v330 = 1;
        }
        uint64_t v331 = v511;
        uint64_t v332 = v513;
        uint64_t v333 = v512;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v511 + 56))(v513, v330, 1, v512);
        uint64_t v334 = v332;
        uint64_t v335 = v509;
        sub_2478E6A48(v334, v509, &qword_269269138);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v331 + 48))(v335, 1, v333) == 1)
        {
          uint64_t v570 = 0;
          uint64_t v568 = 0;
          uint64_t v554 = 0;
          uint64_t v555 = 0;
          v565 = 0;
          v559 = 0;
          uint64_t v558 = 0;
          LODWORD(v556) = 0;
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t))(v511 + 32))(v503, v509, v512);
          uint64_t v336 = swift_allocObject();
          *(void *)(v336 + 16) = a12;
          uint64_t v337 = (uint64_t)v502;
          uint64_t *v502 = v336;
          (*(void (**)(uint64_t, void, uint64_t))(v510 + 104))(v337, *MEMORY[0x263F40C30], v520);
          swift_bridgeObjectRetain();
          uint64_t v338 = v521;
          v565 = (char *)sub_247975C14(v337);
          uint64_t v521 = v338;
          if (v338)
          {
            (*(void (**)(uint64_t *, uint64_t))(v510 + 8))(v502, v520);
            (*(void (**)(char *, uint64_t))(v511 + 8))(v503, v512);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_2478A1A1C(v513, &qword_269269138);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return (id)swift_bridgeObjectRelease();
          }
          (*(void (**)(uint64_t *, uint64_t))(v510 + 8))(v502, v520);
          v339 = v503;
          v559 = (void (**)(void, void, void))sub_247998E60();
          uint64_t v558 = v340;
          (*(void (**)(char *, uint64_t))(v511 + 8))(v339, v512);
          LODWORD(v556) = 1;
          uint64_t v555 = 0xE800000000000000;
          uint64_t v554 = 0x65736E6F70736572;
          uint64_t v568 = 0xEB00000000616D65;
          uint64_t v570 = 0x6863735F6E6F736ALL;
        }
        sub_2478A1A1C(v513, &qword_269269138);
        uint64_t v341 = v504;
        sub_2478E6A48(a10, v504, &qword_269269130);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v505 + 48))(v341, 1, v506) == 1)
        {
          uint64_t v342 = 0;
          unint64_t v343 = 3;
        }
        else
        {
          uint64_t v344 = (uint64_t)v491;
          (*(void (**)(char *, uint64_t, uint64_t))(v505 + 32))(v491, v504, v506);
          uint64_t v345 = v521;
          sub_2479767B4(v344, (uint64_t *)&v578, v571);
          uint64_t v521 = v345;
          if (v345)
          {
            (*(void (**)(char *, uint64_t))(v505 + 8))(v491, v506);
            swift_bridgeObjectRelease();
            sub_2478F5BDC(v570, v568);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return (id)swift_bridgeObjectRelease();
          }
          (*(void (**)(char *, uint64_t))(v505 + 8))(v491, v506);
          uint64_t v342 = v571[0];
          unint64_t v343 = v571[1];
        }
        if (!v557)
        {
          sub_2478F5B54(v342, v343);
          uint64_t v342 = 0;
          unint64_t v343 = 3;
        }
        sub_2479778FC(v342, v343);
        id result = (id)MobileGestalt_get_current_device();
        if (result)
        {
          v346 = result;
          int internalBuild = MobileGestalt_get_internalBuild();

          uint64_t v348 = v501 + *(int *)(type metadata accessor for BlackPowder() + 20);
          if (*(unsigned char *)(v348 + 184))
          {
            (*(void (**)(uint64_t *__return_ptr, void))(v348 + 168))(v571, *(void *)(v348 + 144));
            if (LOBYTE(v571[0]) == 2) {
              uint64_t v349 = 0;
            }
            else {
              uint64_t v349 = v342;
            }
            uint64_t v350 = 3;
            if (LOBYTE(v571[0]) != 2) {
              uint64_t v350 = v343;
            }
          }
          else
          {
            uint64_t v349 = v342;
            uint64_t v350 = v343;
          }
          if (internalBuild) {
            uint64_t v351 = v349;
          }
          else {
            uint64_t v351 = 0;
          }
          if (internalBuild) {
            unint64_t v352 = v350;
          }
          else {
            unint64_t v352 = 3;
          }
          v563 = (void (**)(char *, uint64_t))v352;
          uint64_t v564 = v351;
          sub_2479778FC(v351, v352);
          sub_2478F5B54(v342, v343);
          sub_2478F5B54(v342, v343);
          uint64_t v353 = sub_2478F5B54(0, 3uLL);
          MEMORY[0x270FA5388](v353);
          *(&v431 - 2) = v501;
          uint64_t v354 = v521;
          v560 = (void (**)(void, void))sub_24796EF10((void (*)(uint64_t *__return_ptr, char *))sub_247977920);
          v561 = v355;
          v562 = v356;
          uint64_t v521 = v354;
          if (*(unsigned char *)(v348 + 328))
          {
            (*(void (**)(uint64_t *__return_ptr, void))(v348 + 312))(v571, *(void *)(v348 + 288));
            if (v571[0])
            {
              uint64_t v357 = sub_247998B00();
              if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v357 - 8) + 48))(v490, 1, v357) == 1)
              {
                if (qword_269266AA0 != -1) {
                  swift_once();
                }
                __swift_project_value_buffer((uint64_t)v569, (uint64_t)qword_26927FC68);
                v358 = sub_247999010();
                os_log_type_t v359 = sub_2479996B0();
                if (os_log_type_enabled(v358, v359))
                {
                  v360 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)v360 = 0;
                  _os_log_impl(&dword_247896000, v358, v359, "PromptTemplate not passed, keeping instructions.", v360, 2u);
                  MEMORY[0x24C564070](v360, -1, -1);
                }
              }
              else
              {
                swift_bridgeObjectRelease();
                uint64_t v464 = 0;
                uint64_t v467 = 0;
              }
            }
          }
          swift_bridgeObjectRetain();
          id result = (id)MobileGestalt_get_current_device();
          if (result)
          {
            v361 = result;
            int v362 = MobileGestalt_get_internalBuild();

            if (*(unsigned char *)(v348 + 184))
            {
              (*(void (**)(uint64_t *__return_ptr, void))(v348 + 168))(v571, *(void *)(v348 + 144));
              uint64_t v363 = v464;
              if (LOBYTE(v571[0]) == 2) {
                uint64_t v363 = 0;
              }
              uint64_t v464 = v363;
              uint64_t v364 = v467;
              if (LOBYTE(v571[0]) == 2) {
                uint64_t v364 = 0;
              }
            }
            else
            {
              uint64_t v364 = v467;
            }
            uint64_t v365 = v464;
            if (!v362) {
              uint64_t v365 = 0;
            }
            uint64_t v553 = v365;
            if (v362) {
              uint64_t v366 = v364;
            }
            else {
              uint64_t v366 = 0;
            }
            uint64_t v552 = v366;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            if (v448[2]) {
              uint64_t v567 = swift_bridgeObjectRetain();
            }
            else {
              uint64_t v567 = 0;
            }
            int v367 = sub_247978A14(v485, v486, qword_26FBDF288);
            swift_arrayDestroy();
            if (qword_269266AA0 != -1) {
              swift_once();
            }
            LODWORD(v557) = v367 ^ 1;
            v368 = (void (*)(void, void))v569;
            uint64_t v369 = __swift_project_value_buffer((uint64_t)v569, (uint64_t)qword_26927FC68);
            (*(void (**)(char *, uint64_t, void (*)(void, void)))(v452 + 16))(v507, v369, v368);
            uint64_t v370 = v499;
            v371 = *(void (**)(char *, uint64_t, uint64_t))(v499 + 16);
            v372 = v487;
            uint64_t v373 = v432;
            uint64_t v374 = v500;
            v371(v487, v432, v500);
            v371(v496, (uint64_t)v372, v374);
            v375 = *(void (**)(char *, char *, uint64_t))(v370 + 32);
            v375(v495, v372, v374);
            v376 = v488;
            v371(v488, v373, v374);
            v371(v498, (uint64_t)v376, v374);
            v375(v497, v376, v374);
            swift_bridgeObjectRetain();
            sub_2479778FC(v564, (unint64_t)v563);
            swift_bridgeObjectRetain();
            sub_2478F5ACC((uint64_t)v560, (uint64_t)v561);
            swift_bridgeObjectRetain();
            sub_2478F5B78(v570, v568);
            swift_bridgeObjectRetain();
            sub_2479778FC(v564, (unint64_t)v563);
            swift_bridgeObjectRetain();
            sub_2478F5ACC((uint64_t)v560, (uint64_t)v561);
            swift_bridgeObjectRetain();
            sub_2478F5B78(v570, v568);
            v377 = sub_247999010();
            LODWORD(v550) = sub_2479996B0();
            v551 = v377;
            if (os_log_type_enabled(v377, (os_log_type_t)v550))
            {
              uint64_t v378 = swift_slowAlloc();
              v548 = (char *)swift_slowAlloc();
              v578 = v548;
              *(_DWORD *)uint64_t v378 = 136317186;
              v571[0] = v492;
              v571[1] = v508;
              swift_bridgeObjectRetain();
              __swift_instantiateConcreteTypeFromMangledName(&qword_269268900);
              uint64_t v379 = sub_247999390();
              v571[0] = sub_247918FF0(v379, v380, (uint64_t *)&v578);
              sub_247999720();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              *(_WORD *)(v378 + 12) = 2080;
              v382 = v560;
              v381 = v561;
              v571[0] = (uint64_t)v560;
              v571[1] = (uint64_t)v561;
              uint64_t v572 = (uint64_t)v562;
              sub_2478F5ACC((uint64_t)v560, (uint64_t)v561);
              __swift_instantiateConcreteTypeFromMangledName(&qword_2692678A8);
              uint64_t v383 = sub_247999390();
              v571[0] = sub_247918FF0(v383, v384, (uint64_t *)&v578);
              sub_247999720();
              swift_bridgeObjectRelease();
              sub_2478F5B10((uint64_t)v382, (uint64_t)v381);
              sub_2478F5B10((uint64_t)v382, (uint64_t)v381);
              *(_WORD *)(v378 + 22) = 2080;
              LOBYTE(v571[0]) = v557 & 1;
              __swift_instantiateConcreteTypeFromMangledName(&qword_2692678C8);
              uint64_t v385 = sub_247999390();
              v571[0] = sub_247918FF0(v385, v386, (uint64_t *)&v578);
              sub_247999720();
              swift_bridgeObjectRelease();
              *(_WORD *)(v378 + 32) = 2080;
              uint64_t v387 = sub_247998F40();
              uint64_t v388 = swift_bridgeObjectRetain();
              uint64_t v389 = MEMORY[0x24C562FA0](v388, v387);
              unint64_t v391 = v390;
              swift_bridgeObjectRelease();
              v571[0] = sub_247918FF0(v389, v391, (uint64_t *)&v578);
              sub_247999720();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              *(_WORD *)(v378 + 42) = 2080;
              unint64_t v393 = (unint64_t)v563;
              uint64_t v392 = v564;
              v571[0] = v564;
              v571[1] = (uint64_t)v563;
              sub_2479778FC(v564, (unint64_t)v563);
              __swift_instantiateConcreteTypeFromMangledName(&qword_2692678F0);
              uint64_t v394 = sub_247999390();
              v571[0] = sub_247918FF0(v394, v395, (uint64_t *)&v578);
              sub_247999720();
              swift_bridgeObjectRelease();
              sub_2478F5B54(v392, v393);
              sub_2478F5B54(v392, v393);
              *(_WORD *)(v378 + 52) = 2048;
              if (v567)
              {
                uint64_t v396 = *(void *)(v567 + 16);
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v396 = 0;
              }
              v571[0] = v396;
              sub_247999720();
              swift_bridgeObjectRelease();
              *(_WORD *)(v378 + 62) = 2080;
              v405 = v496;
              v571[0] = sub_247998620();
              LOBYTE(v571[1]) = v406 & 1;
              __swift_instantiateConcreteTypeFromMangledName(&qword_269269158);
              uint64_t v407 = sub_247999390();
              v571[0] = sub_247918FF0(v407, v408, (uint64_t *)&v578);
              sub_247999720();
              swift_bridgeObjectRelease();
              v409 = *(void (**)(char *, uint64_t))(v499 + 8);
              uint64_t v410 = v500;
              v409(v495, v500);
              v409(v405, v410);
              *(_WORD *)(v378 + 72) = 2080;
              v411 = v498;
              v571[0] = sub_247998630();
              LOBYTE(v571[1]) = v412 & 1;
              __swift_instantiateConcreteTypeFromMangledName(&qword_269268898);
              uint64_t v413 = sub_247999390();
              v571[0] = sub_247918FF0(v413, v414, (uint64_t *)&v578);
              sub_247999720();
              swift_bridgeObjectRelease();
              v409(v497, v410);
              v409(v411, v410);
              v549 = (uint8_t *)v378;
              *(_WORD *)(v378 + 82) = 2080;
              v547 = (char *)(v378 + 84);
              uint64_t v415 = v568;
              v571[0] = v570;
              v571[1] = v568;
              uint64_t v572 = v554;
              uint64_t v573 = v555;
              v574 = v565;
              v575 = v559;
              uint64_t v576 = v558;
              char v577 = (char)v556;
              sub_2478F5B78(v570, v568);
              __swift_instantiateConcreteTypeFromMangledName(&qword_269267920);
              uint64_t v416 = sub_247999390();
              v571[0] = sub_247918FF0(v416, v417, (uint64_t *)&v578);
              sub_247999720();
              swift_bridgeObjectRelease();
              uint64_t v418 = v570;
              sub_2478F5BDC(v570, v415);
              sub_2478F5BDC(v418, v415);
              v419 = v551;
              v420 = v549;
              _os_log_impl(&dword_247896000, v551, (os_log_type_t)v550, "Preparing request:\n  previousChoiceID: %s\n  configuration: %s\n  model: nil\n  input: <private>\n  inputHint: %s\n  tools: %s\n  toolChoice: %s\n  toolCallOutputs: <count=%ld>\n  seed: %s\n  temperature: %s\n  responseFormat: %s", v549, 0x5Cu);
              v421 = v548;
              swift_arrayDestroy();
              MEMORY[0x24C564070](v421, -1, -1);
              MEMORY[0x24C564070](v420, -1, -1);
            }
            else
            {
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease();
              v398 = v560;
              v397 = v561;
              sub_2478F5B10((uint64_t)v560, (uint64_t)v561);
              sub_2478F5B10((uint64_t)v398, (uint64_t)v397);
              swift_bridgeObjectRelease_n();
              unint64_t v400 = (unint64_t)v563;
              uint64_t v399 = v564;
              sub_2478F5B54(v564, (unint64_t)v563);
              sub_2478F5B54(v399, v400);
              swift_bridgeObjectRelease();
              v401 = *(void (**)(char *, uint64_t))(v499 + 8);
              uint64_t v402 = v500;
              v401(v495, v500);
              v401(v496, v402);
              v401(v497, v402);
              v401(v498, v402);
              uint64_t v403 = v570;
              uint64_t v404 = v568;
              sub_2478F5BDC(v570, v568);
              sub_2478F5BDC(v403, v404);
            }
            (*(void (**)(char *, void *))(v452 + 8))(v507, v569);
            v422 = v451;
            swift_bridgeObjectRetain();
            double v423 = COERCE_DOUBLE(sub_247998630());
            char v425 = v424;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            char v426 = v557 & 1;
            LOBYTE(v571[0]) = v557 & 1;
            LOBYTE(v578) = v425 & 1;
            double v427 = v423 * 0.5;
            if (v425) {
              double v427 = v423;
            }
            v428 = v489;
            uint64_t *v489 = v492;
            v429 = v560;
            v428[1] = v508;
            v428[2] = (uint64_t)v429;
            v428[3] = (uint64_t)v561;
            v428[4] = (uint64_t)v562;
            v428[5] = 0;
            uint64_t v430 = v553;
            v428[6] = 0;
            v428[7] = v430;
            v428[8] = v552;
            v428[9] = (uint64_t)v422;
            *((unsigned char *)v428 + 80) = v426;
            v428[11] = (uint64_t)v566;
            v428[12] = (uint64_t)v318;
            v428[13] = v564;
            v428[14] = (uint64_t)v563;
            v428[15] = v567;
            *((double *)v428 + 16) = v427;
            *((unsigned char *)v428 + 136) = (_BYTE)v578;
            v428[18] = v570;
            v428[19] = v568;
            v428[20] = v554;
            v428[21] = v555;
            v428[22] = (uint64_t)v565;
            v428[23] = (uint64_t)v559;
            v428[24] = v558;
            *((unsigned char *)v428 + 200) = (_BYTE)v556;
            *((unsigned char *)v428 + 201) = 1;
            return (id)swift_bridgeObjectRetain();
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        return result;
      }
      uint64_t v293 = *(void *)(sub_247998F40() - 8);
      v294 = (char *)(v514
                    + ((*(unsigned __int8 *)(v293 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v293 + 80)));
      uint64_t v568 = *(void *)(v293 + 72);
      uint64_t v570 = v493 + 88;
      v563 = (void (**)(char *, uint64_t))(v493 + 8);
      int v295 = *MEMORY[0x263F40DC8];
      v560 = (void (**)(void, void))(v493 + 96);
      v559 = (void (**)(void, void, void))(v494 + 32);
      v561 = (void (**)(uint64_t, uint64_t))(v510 + 8);
      v562 = (char *)(v494 + 8);
      swift_bridgeObjectRetain();
      v566 = (char *)MEMORY[0x263F8EE78];
      v556 = v294;
      v296 = v557;
      uint64_t v297 = v523;
      uint64_t v298 = (uint64_t)v519;
      v299 = v518;
      v300 = v517;
      LODWORD(v558) = v295;
      do
      {
        sub_247998ED0();
        uint64_t v567 = *(void *)v570;
        if (((unsigned int (*)(char *, uint64_t))v567)(v300, v297) == v295)
        {
          (*v560)(v300, v297);
          uint64_t v301 = v516;
          (*v559)(v299, v300, v516);
          v302 = v299;
          uint64_t v564 = sub_247998F10();
          uint64_t v304 = v303;
          v565 = (char *)sub_247998F00();
          uint64_t v306 = v305;
          sub_247998EF0();
          uint64_t v307 = v521;
          uint64_t v308 = sub_247975C14(v298);
          if (v307)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            (*v561)(v298, v520);
            (*(void (**)(char *, uint64_t))v562)(v299, v301);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return (id)swift_bridgeObjectRelease();
          }
          uint64_t v309 = v308;
          (*v561)(v298, v520);
          (*(void (**)(char *, uint64_t))v562)(v302, v301);
          v310 = v566;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v521 = 0;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            v310 = (char *)sub_247918858(0, *((void *)v310 + 2) + 1, 1, v310);
          }
          uint64_t v312 = v564;
          unint64_t v314 = *((void *)v310 + 2);
          unint64_t v313 = *((void *)v310 + 3);
          if (v314 >= v313 >> 1) {
            v310 = (char *)sub_247918858((void *)(v313 > 1), v314 + 1, 1, v310);
          }
          *((void *)v310 + 2) = v314 + 1;
          v566 = v310;
          v315 = &v310[48 * v314];
          *((void *)v315 + 4) = v312;
          *((void *)v315 + 5) = v304;
          *((void *)v315 + 6) = v565;
          *((void *)v315 + 7) = v306;
          *((void *)v315 + 8) = v309;
          v315[72] = 1;
          uint64_t v297 = v523;
          uint64_t v298 = (uint64_t)v519;
          v299 = v518;
          v300 = v517;
          int v295 = v558;
        }
        else
        {
          (*v563)(v300, v297);
        }
        v294 += v568;
        v296 = (void (*)(char *, uint64_t))((char *)v296 - 1);
      }
      while (v296);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      int v316 = *MEMORY[0x263F40DC0];
      int v317 = *MEMORY[0x263F40DB8];
      v318 = (void *)MEMORY[0x263F8EE78];
      v319 = v557;
      v320 = v556;
      while (1)
      {
        v321 = v522;
        sub_247998ED0();
        int v322 = ((uint64_t (*)(char *, uint64_t))v567)(v321, v297);
        if (v322 == v316) {
          break;
        }
        if (v322 == v317)
        {
          uint64_t v323 = 2;
          goto LABEL_152;
        }
        (*v563)(v522, v297);
LABEL_147:
        v320 += v568;
        v319 = (void (*)(char *, uint64_t))((char *)v319 - 1);
        if (!v319)
        {
          swift_bridgeObjectRelease();
          goto LABEL_159;
        }
      }
      uint64_t v323 = 0;
LABEL_152:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        v318 = sub_247918858(0, v318[2] + 1, 1, v318);
      }
      unint64_t v325 = v318[2];
      unint64_t v324 = v318[3];
      if (v325 >= v324 >> 1) {
        v318 = sub_247918858((void *)(v324 > 1), v325 + 1, 1, v318);
      }
      v318[2] = v325 + 1;
      v326 = &v318[6 * v325];
      v326[4] = 0;
      v326[5] = v323;
      v326[7] = 0;
      v326[8] = 0;
      v326[6] = 0;
      *((unsigned char *)v326 + 72) = 0;
      uint64_t v297 = v523;
      goto LABEL_147;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v141 = 0;
    uint64_t v142 = v85;
  }
LABEL_38:
  uint64_t v144 = v561;
  uint64_t v143 = (uint64_t *)&v496;
  if (v141 == v132) {
    goto LABEL_133;
  }
  uint64_t v464 = 0;
  uint64_t v467 = 0;
  uint64_t v145 = v541 + ((*(unsigned __int8 *)(v542 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v542 + 80));
  uint64_t v469 = v539 + 16;
  v483 = (void (*)(char *, uint64_t, void))(v539 + 88);
  LODWORD(v482) = *MEMORY[0x263F7FAA8];
  int v463 = *MEMORY[0x263F7FAB0];
  v481 = (void (**)(void *, void))(v539 + 96);
  v462 = (void (**)(char *, void (**)(uint64_t, uint64_t), uint64_t))(v533 + 32);
  v461 = (uint64_t (**)(char *, uint64_t))(v536 + 88);
  v458 = (unsigned int (**)(char *, uint64_t, uint64_t))(v534 + 48);
  int v460 = *MEMORY[0x263F7FB50];
  v457 = (void (**)(uint64_t, char *, uint64_t))(v534 + 32);
  v456 = (void (**)(uint64_t, uint64_t, uint64_t))(v534 + 16);
  v455 = (void (**)(uint64_t, uint64_t))(v534 + 8);
  int v454 = *MEMORY[0x263F7FB48];
  v459 = (void (**)(char *, uint64_t))(v533 + 8);
  v465 = (void (**)(char *, void, uint64_t))(v543 + 104);
  v466 = (void (**)(char *, uint64_t))(v543 + 8);
  unsigned int v468 = *MEMORY[0x263F7FA78];
  v473 = (void (**)(char *, char *, void (**)(char *, uint64_t)))(v535 + 32);
  v472 = (void (**)(char *, void))(v535 + 8);
  v440 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v540 + 48);
  v437 = (void (**)(char *, uint64_t, uint64_t))(v540 + 32);
  v436 = (void (**)(char *, uint64_t))(v540 + 8);
  v439 = (uint64_t (**)(char *, uint64_t))(v543 + 88);
  *((void *)&v146 + 1) = 1;
  long long v438 = xmmword_2479A4830;
  *(void *)&long long v146 = 134217984;
  long long v453 = v146;
  LODWORD(v475) = *MEMORY[0x263F7FAC0];
  int v435 = *MEMORY[0x263F7FA90];
  int v434 = *MEMORY[0x263F7FA88];
  int v433 = *MEMORY[0x263F7FA80];
  uint64_t v534 = v539 + 8;
  v477 = (void (**)(char *, void, uint64_t))(v538 + 16);
  v474 = (uint64_t (**)(char *, uint8_t *))(v537 + 88);
  v471 = (void (**)(char *, uint8_t *))(v537 + 96);
  v476 = (void (**)(char *, uint64_t))(v538 + 8);
  uint64_t v450 = v542 + 8;
  if (v141 <= v132) {
    uint64_t v147 = v132;
  }
  else {
    uint64_t v147 = v141;
  }
  v448 = (void *)MEMORY[0x263F8EE78];
  v451 = (void *)MEMORY[0x263F8EE78];
  uint64_t v445 = v542 + 16;
  uint64_t v444 = v145;
  uint64_t v443 = v147;
  while (1)
  {
    if (v132 <= v141)
    {
      __break(1u);
LABEL_129:
      __break(1u);
      goto LABEL_130;
    }
    if (v141 == v147) {
      goto LABEL_129;
    }
    uint64_t v148 = *(void *)(v542 + 72);
    uint64_t v449 = v141;
    v442 = *(void (**)(uint64_t, uint64_t, void))(v542 + 16);
    v442(v142, v145 + v148 * v141, v559);
    uint64_t v149 = sub_247998A00();
    uint64_t v150 = *(void *)(v149 + 16);
    if (v150) {
      break;
    }
    swift_bridgeObjectRelease();
    unint64_t v154 = MEMORY[0x263F8EE78];
LABEL_77:
    unint64_t v543 = v154;
    uint64_t v186 = sub_247998A10();
    uint64_t v187 = *(void *)(v186 + 16);
    uint64_t v188 = v570;
    uint64_t v189 = v479;
    if (v187)
    {
      unint64_t v190 = (*(unsigned __int8 *)(v538 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v538 + 80);
      uint64_t v441 = v186;
      unint64_t v191 = v186 + v190;
      uint64_t v470 = *(void *)(v538 + 72);
      v533 = *(char **)(v538 + 16);
      uint64_t v192 = (void *)MEMORY[0x263F8EE78];
      uint64_t v193 = v550;
      uint64_t v194 = v551;
      while (1)
      {
        ((void (*)(NSObject *, unint64_t, uint64_t))v533)(v194, v191, v193);
        uint64_t v195 = v548;
        sub_247998A60();
        uint64_t v196 = v549;
        int v197 = (*v474)(v195, v549);
        if (v197 != v475) {
          break;
        }
        (*v471)(v195, v196);
        (*v473)(v562, v195, v563);
        uint64_t v540 = sub_247998A40();
        v535 = v198;
        uint64_t v199 = sub_247998940();
        uint64_t v201 = v200;
        uint64_t v202 = sub_247998950();
        uint64_t v204 = v203;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v192 = sub_247918BE0(0, v192[2] + 1, 1, v192);
        }
        unint64_t v206 = v192[2];
        unint64_t v205 = v192[3];
        if (v206 >= v205 >> 1) {
          uint64_t v192 = sub_247918BE0((void *)(v205 > 1), v206 + 1, 1, v192);
        }
        v192[2] = v206 + 1;
        v207 = &v192[6 * v206];
        v208 = v535;
        v207[4] = v540;
        v207[5] = v208;
        v207[6] = v199;
        v207[7] = v201;
        v207[8] = v202;
        v207[9] = v204;
        (*v472)(v562, v563);
        uint64_t v194 = v551;
        uint64_t v193 = v550;
        (*v476)((char *)v551, v550);
        v191 += v470;
        --v187;
        uint64_t v188 = v570;
        uint64_t v189 = v479;
        if (!v187)
        {
          swift_bridgeObjectRelease();
          uint64_t v144 = v561;
          uint64_t v61 = v484;
          goto LABEL_87;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_269266AA0 != -1) {
        swift_once();
      }
      __swift_project_value_buffer((uint64_t)v569, (uint64_t)qword_26927FC68);
      v231 = v531;
      ((void (*)(char *, NSObject *, uint64_t))v533)(v531, v551, v193);
      v232 = sub_247999010();
      os_log_type_t v233 = sub_247999690();
      if (os_log_type_enabled(v232, v233))
      {
        v234 = (uint8_t *)swift_slowAlloc();
        uint64_t v235 = swift_slowAlloc();
        *(_DWORD *)v234 = 136315138;
        uint64_t v570 = (uint64_t)(v234 + 4);
        v571[0] = v235;
        sub_247998A60();
        uint64_t v236 = sub_247999390();
        v578 = (char *)sub_247918FF0(v236, v237, v571);
        sub_247999720();
        swift_bridgeObjectRelease();
        v238 = *v476;
        v569 = (void *)((unint64_t)v476 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
        uint64_t v570 = (uint64_t)v238;
        v238(v531, v550);
        _os_log_impl(&dword_247896000, v232, v233, "Unknown tool call kind: %s", v234, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C564070](v235, -1, -1);
        MEMORY[0x24C564070](v234, -1, -1);
      }
      else
      {
        v251 = *v476;
        v569 = (void *)((unint64_t)v476 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
        uint64_t v570 = (uint64_t)v251;
        v251(v231, v193);
      }

      v571[0] = 0;
      v571[1] = 0xE000000000000000;
      sub_247999800();
      swift_bridgeObjectRelease();
      v571[0] = 0xD000000000000018;
      v571[1] = 0x80000002479A7230;
      v252 = v551;
      sub_247998A60();
      v253 = v549;
      sub_247999390();
      sub_2479993D0();
      swift_bridgeObjectRelease();
      sub_2479984B0();
      v254 = v566;
      v255 = v446;
      (*(void (**)(char *, char *, void (*)(char *, uint64_t)))(v188 + 16))(v566, v189, v446);
      uint64_t v257 = v567;
      uint64_t v256 = v568;
      (*(void (**)(char *, void, uint64_t))(v568 + 104))(v254, *MEMORY[0x263F7F810], v567);
      sub_247977850(&qword_269266BF0, MEMORY[0x263F7F830]);
      swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v256 + 16))(v258, v254, v257);
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v256 + 8))(v254, v257);
      (*(void (**)(char *, void *))(v188 + 8))(v189, v255);
      ((void (*)(NSObject *, uint64_t))v570)(v252, v550);
      (*(void (**)(uint64_t, void (**)(void, void, void)))v450)(v478, v559);
      return (id)(*(uint64_t (**)(char *, uint8_t *))(v537 + 8))(v548, v253);
    }
    swift_bridgeObjectRelease();
LABEL_87:
    swift_bridgeObjectRelease();
    uint64_t v85 = (uint64_t)v557;
    sub_2479989E0();
    v209 = v556;
    uint64_t v210 = v558;
    (*v465)(v556, v468, v558);
    sub_247977850(&qword_269269150, MEMORY[0x263F7FA98]);
    char v211 = sub_247999310();
    uint64_t v58 = *v466;
    (*v466)(v209, v210);
    v58((char *)v85, v210);
    if ((v211 & 1) == 0)
    {
      uint64_t v213 = (uint64_t)v528;
      uint64_t v142 = v478;
      sub_2479989B0();
      uint64_t v85 = v532;
      int v214 = (*v440)(v213, 1, v532);
      unint64_t v215 = v543;
      if (v214 == 1)
      {
        sub_2478A1A1C(v213, &qword_269269140);
      }
      else
      {
        (*v437)(v527, v213, v85);
        uint64_t v216 = sub_247998940();
        uint64_t v85 = v217;
        uint64_t v218 = sub_247998950();
        uint64_t v220 = v219;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v448 = sub_247918AA4(0, v448[2] + 1, 1, v448);
        }
        unint64_t v222 = v448[2];
        unint64_t v221 = v448[3];
        if (v222 >= v221 >> 1) {
          v448 = sub_247918AA4((void *)(v221 > 1), v222 + 1, 1, v448);
        }
        v223 = v448;
        v448[2] = v222 + 1;
        v224 = &v223[4 * v222];
        v224[4] = v216;
        v224[5] = v85;
        v224[6] = v218;
        v224[7] = v220;
        (*v436)(v527, v532);
        uint64_t v144 = v561;
        uint64_t v61 = v484;
        unint64_t v215 = v543;
      }
      v225 = v529;
      sub_2479989E0();
      int v226 = (*v439)(v225, v558);
      if (v226 == v468)
      {
        uint64_t v227 = 0;
        goto LABEL_102;
      }
      if (v226 == v435)
      {
        uint64_t v227 = 1;
        goto LABEL_102;
      }
      if (v226 == v434)
      {
        uint64_t v227 = 2;
LABEL_102:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v451 = sub_24791897C(0, v451[2] + 1, 1, v451);
        }
        uint64_t v85 = v451[2];
        unint64_t v228 = v451[3];
        if (v85 >= v228 >> 1) {
          v451 = sub_24791897C((void *)(v228 > 1), v85 + 1, 1, v451);
        }
        v229 = v451;
        v451[2] = v85 + 1;
        v230 = &v229[7 * v85];
        v230[4] = v227;
        v230[5] = v215;
        *((_OWORD *)v230 + 3) = v438;
        v230[8] = 0;
        v230[9] = 0;
        *((unsigned char *)v230 + 80) = 0;
      }
      else
      {
        if (v226 != v433)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (qword_269266AA0 != -1) {
            goto LABEL_234;
          }
          goto LABEL_126;
        }
        swift_bridgeObjectRelease();
      }
      uint64_t v212 = v449;
      goto LABEL_108;
    }
    swift_bridgeObjectRelease();
    uint64_t v212 = v449;
    uint64_t v142 = v478;
LABEL_108:
    uint64_t v141 = v212 + 1;
    (*(void (**)(uint64_t, void (**)(void, void, void)))v450)(v142, v559);
    uint64_t v132 = v447;
    uint64_t v145 = v444;
    uint64_t v147 = v443;
    if (v141 == v447) {
      goto LABEL_134;
    }
  }
  unint64_t v151 = (*(unsigned __int8 *)(v539 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v539 + 80);
  uint64_t v470 = v149;
  unint64_t v152 = v149 + v151;
  v533 = *(char **)(v539 + 72);
  unint64_t v154 = MEMORY[0x263F8EE78];
  uint64_t v155 = v560;
  uint64_t v58 = (void (*)(char *, uint64_t))v547;
  v535 = *(char **)(v539 + 16);
  uint64_t v153 = (void (*)(void (**)(uint64_t, uint64_t), void (*)(char *, uint64_t), void (**)(void, void)))v535;
  ((void (*)(char *, unint64_t, void (**)(void, void)))v535)(v547, v149 + v151, v560);
  while (1)
  {
    v153(v144, v58, v155);
    int v159 = (*(uint64_t (**)(void *, void))v483)(v144, v155);
    unint64_t v543 = v154;
    uint64_t v540 = v150;
    if (v159 != v482) {
      break;
    }
    (*v481)(v144, v155);
    uint64_t v161 = *v144;
    uint64_t v160 = v144[1];
    int v162 = (char *)v557;
    sub_2479989E0();
    uint64_t v163 = v556;
    uint64_t v164 = v558;
    (*v465)(v556, v468, v558);
    char v165 = sub_2479989C0();
    int64_t v166 = *v466;
    (*v466)(v163, v164);
    v166(v162, v164);
    if (v165)
    {
      uint64_t v156 = v464;
      if (v467)
      {
        uint64_t v157 = v467;
      }
      else
      {
        uint64_t v156 = 0;
        uint64_t v157 = 0xE000000000000000;
      }
      v571[0] = v156;
      v571[1] = v157;
      swift_bridgeObjectRetain();
      sub_2479993D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v464 = v571[0];
      uint64_t v467 = v571[1];
      uint64_t v58 = (void (*)(char *, uint64_t))v547;
      uint64_t v155 = v560;
      (*(void (**)(char *, void))v534)(v547, v560);
      uint64_t v144 = v561;
      uint64_t v61 = v484;
      unint64_t v154 = v543;
LABEL_51:
      uint64_t v158 = v540;
      goto LABEL_52;
    }
    uint64_t v167 = v546;
    *v546 = v161;
    v167[1] = v160;
    swift_storeEnumTagMultiPayload();
    unint64_t v154 = v543;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v154 = sub_247918D08(0, *(void *)(v154 + 16) + 1, 1, v154);
    }
    uint64_t v58 = (void (*)(char *, uint64_t))v547;
    uint64_t v144 = v561;
    uint64_t v61 = v484;
    uint64_t v158 = v540;
    unint64_t v169 = *(void *)(v154 + 16);
    unint64_t v168 = *(void *)(v154 + 24);
    if (v169 >= v168 >> 1) {
      unint64_t v154 = sub_247918D08(v168 > 1, v169 + 1, 1, v154);
    }
    *(void *)(v154 + 16) = v169 + 1;
    sub_247977898((uint64_t)v546, v154+ ((*(unsigned __int8 *)(v552 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v552 + 80))+ *(void *)(v552 + 72) * v169);
    uint64_t v155 = v560;
    (*(void (**)(void *, void))v534)(v58, v560);
LABEL_52:
    v152 += (unint64_t)v533;
    uint64_t v150 = v158 - 1;
    uint64_t v153 = (void (*)(void (**)(uint64_t, uint64_t), void (*)(char *, uint64_t), void (**)(void, void)))v535;
    if (!v150)
    {
      swift_bridgeObjectRelease();
      goto LABEL_77;
    }
    ((void (*)(void (*)(char *, uint64_t), unint64_t, void (**)(void, void)))v535)(v58, v152, v155);
  }
  if (v159 != v463)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer((uint64_t)v569, (uint64_t)qword_26927FC68);
    v239 = v525;
    v240 = v560;
    v153((void (**)(uint64_t, uint64_t))v525, v58, v560);
    v241 = (void (*)(char *, void (*)(char *, uint64_t), void (**)(void, void)))v153;
    v242 = sub_247999010();
    os_log_type_t v243 = sub_247999690();
    BOOL v244 = os_log_type_enabled(v242, v243);
    v245 = v530;
    if (v244)
    {
      v246 = (uint8_t *)swift_slowAlloc();
      uint64_t v564 = swift_slowAlloc();
      v571[0] = v564;
      *(_DWORD *)v246 = 136315138;
      v569 = v246 + 4;
      ((void (*)(char *, char *, void (**)(void, void)))v535)(v245, v239, v240);
      uint64_t v247 = sub_247999390();
      v578 = (char *)sub_247918FF0(v247, v248, v571);
      sub_247999720();
      v245 = v530;
      swift_bridgeObjectRelease();
      v249 = *(void (**)(char *, void))v534;
      v565 = (char *)(v534 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
      v241 = (void (*)(char *, void (*)(char *, uint64_t), void (**)(void, void)))v535;
      v569 = v249;
      v249(v239, v240);
      _os_log_impl(&dword_247896000, v242, v243, "Unknown segment type. %s", v246, 0xCu);
      uint64_t v250 = v564;
      swift_arrayDestroy();
      MEMORY[0x24C564070](v250, -1, -1);
      MEMORY[0x24C564070](v246, -1, -1);
    }
    else
    {
      v259 = *(void (**)(char *, void))v534;
      v565 = (char *)(v534 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
      v569 = v259;
      v259(v239, v240);
    }

    v571[0] = 0;
    v571[1] = 0xE000000000000000;
    sub_247999800();
    swift_bridgeObjectRelease();
    v571[0] = 0xD000000000000016;
    v571[1] = 0x80000002479A71F0;
    v241(v245, v58, v240);
    sub_247999390();
    sub_2479993D0();
    swift_bridgeObjectRelease();
    v260 = v479;
    sub_2479984B0();
    uint64_t v261 = v570;
    v262 = v58;
    v263 = v566;
    v264 = v446;
    (*(void (**)(char *, char *, void (*)(char *, uint64_t)))(v570 + 16))(v566, v260, v446);
    uint64_t v266 = v567;
    uint64_t v265 = v568;
    (*(void (**)(char *, void, uint64_t))(v568 + 104))(v263, *MEMORY[0x263F7F810], v567);
    sub_247977850(&qword_269266BF0, MEMORY[0x263F7F830]);
    swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v265 + 16))(v267, v263, v266);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v265 + 8))(v263, v266);
    (*(void (**)(char *, void *))(v261 + 8))(v260, v264);
    v268 = (uint64_t (*)(void, void))v569;
    ((void (*)(void, void))v569)(v262, v240);
    (*(void (**)(uint64_t, void (**)(void, void, void)))v450)(v478, v559);
    return (id)v268(v561, v240);
  }
  (*v481)(v144, v155);
  (*v462)(v565, v144, v555);
  uint64_t v170 = v545;
  sub_247998990();
  int v171 = (*v461)(v170, v61);
  if (v171 != v460 && v171 != v454)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v571[0] = 0;
    v571[1] = 0xE000000000000000;
    sub_247999800();
    swift_bridgeObjectRelease();
    v571[0] = 0xD00000000000001ALL;
    v571[1] = 0x80000002479A7210;
    v269 = v565;
    sub_247998990();
    sub_247999390();
    sub_2479993D0();
    swift_bridgeObjectRelease();
    v270 = v479;
    sub_2479984B0();
    uint64_t v271 = v570;
    v272 = v566;
    v273 = v446;
    (*(void (**)(char *, char *, void (*)(char *, uint64_t)))(v570 + 16))(v566, v270, v446);
    uint64_t v275 = v567;
    uint64_t v274 = v568;
    (*(void (**)(char *, void, uint64_t))(v568 + 104))(v272, *MEMORY[0x263F7F810], v567);
    sub_247977850(&qword_269266BF0, MEMORY[0x263F7F830]);
    swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v274 + 16))(v276, v272, v275);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v274 + 8))(v272, v275);
    (*(void (**)(char *, void *))(v271 + 8))(v270, v273);
    (*v459)(v269, v555);
    (*(void (**)(void *, void))v534)(v58, v560);
    (*(void (**)(uint64_t, void (**)(void, void, void)))v450)(v478, v559);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v536 + 8))(v545, v484);
  }
  uint64_t v172 = sub_247998970();
  unint64_t v174 = v173;
  sub_2479982E0();
  sub_2478A0704(v172, v174);
  v571[0] = 0;
  v571[1] = 0xE000000000000000;
  sub_247999800();
  swift_bridgeObjectRelease();
  v571[0] = 0x3A61746164;
  v571[1] = 0xE500000000000000;
  sub_2479993D0();
  swift_bridgeObjectRelease();
  sub_2479993D0();
  sub_2479993D0();
  long long v175 = v544;
  sub_247998220();
  swift_bridgeObjectRelease();
  uint64_t v176 = v480;
  if ((*v458)(v175, 1, v480) != 1)
  {
    (*v457)(v564, v175, v176);
    BOOL v177 = (void (*)(void, void))v569;
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer((uint64_t)v177, (uint64_t)qword_26927FC68);
    swift_bridgeObjectRetain();
    int v178 = sub_247999010();
    os_log_type_t v179 = sub_2479996B0();
    BOOL v180 = os_log_type_enabled(v178, v179);
    uint64_t v61 = v484;
    if (v180)
    {
      uint64_t v181 = swift_slowAlloc();
      *(_DWORD *)uint64_t v181 = v453;
      uint64_t v182 = sub_2479993C0();
      swift_bridgeObjectRelease();
      *(void *)(v181 + 4) = v182;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247896000, v178, v179, "Attatching prompt image with size: %ld", (uint8_t *)v181, 0xCu);
      MEMORY[0x24C564070](v181, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v144 = v561;
    uint64_t v183 = v480;
    (*v456)(v554, v564, v480);
    swift_storeEnumTagMultiPayload();
    unint64_t v154 = v543;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v154 = sub_247918D08(0, *(void *)(v154 + 16) + 1, 1, v154);
    }
    unint64_t v185 = *(void *)(v154 + 16);
    unint64_t v184 = *(void *)(v154 + 24);
    if (v185 >= v184 >> 1) {
      unint64_t v154 = sub_247918D08(v184 > 1, v185 + 1, 1, v154);
    }
    *(void *)(v154 + 16) = v185 + 1;
    sub_247977898(v554, v154+ ((*(unsigned __int8 *)(v552 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v552 + 80))+ *(void *)(v552 + 72) * v185);
    (*v455)(v564, v183);
    (*v459)(v565, v555);
    uint64_t v155 = v560;
    (*(void (**)(void *, void))v534)(v58, v560);
    goto LABEL_51;
  }
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_234:
  swift_once();
LABEL_126:
  __swift_project_value_buffer((uint64_t)v569, (uint64_t)qword_26927FC68);
  v442((uint64_t)v515, v478, v559);
  uint64_t v85 = sub_247999010();
  os_log_type_t v277 = sub_247999690();
  if (os_log_type_enabled((os_log_t)v85, v277))
  {
    v278 = (uint8_t *)swift_slowAlloc();
    uint64_t v279 = swift_slowAlloc();
    v571[0] = v279;
    *(_DWORD *)v278 = 136315138;
    v569 = v278 + 4;
    v280 = v515;
    sub_2479989E0();
    uint64_t v281 = sub_247999390();
    v578 = (char *)sub_247918FF0(v281, v282, v571);
    sub_247999720();
    swift_bridgeObjectRelease();
    v283 = *(void **)v450;
    v565 = (char *)(v450 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
    v569 = v283;
    ((void (*)(char *, void (**)(void, void, void)))v283)(v280, v559);
    _os_log_impl(&dword_247896000, (os_log_t)v85, v277, "Unknown role: %s", v278, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v279, -1, -1);
    MEMORY[0x24C564070](v278, -1, -1);
    goto LABEL_131;
  }
LABEL_130:
  v284 = *(void **)v450;
  v565 = (char *)(v450 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000);
  v569 = v284;
  ((void (*)(char *, void (**)(void, void, void)))v284)(v515, v559);
LABEL_131:

  v571[0] = 0;
  v571[1] = 0xE000000000000000;
  sub_247999800();
  swift_bridgeObjectRelease();
  strcpy((char *)v571, "Unknown role: ");
  HIBYTE(v571[1]) = -18;
  uint64_t v285 = v478;
  sub_2479989E0();
  sub_247999390();
  sub_2479993D0();
  swift_bridgeObjectRelease();
  v286 = v479;
  sub_2479984B0();
  uint64_t v287 = v570;
  v288 = v566;
  v289 = v446;
  (*(void (**)(char *, char *, void (*)(char *, uint64_t)))(v570 + 16))(v566, v286, v446);
  uint64_t v291 = v567;
  uint64_t v290 = v568;
  (*(void (**)(char *, void, uint64_t))(v568 + 104))(v288, *MEMORY[0x263F7F810], v567);
  sub_247977850(&qword_269266BF0, MEMORY[0x263F7F830]);
  swift_allocError();
  (*(void (**)(uint64_t, char *, uint64_t))(v290 + 16))(v292, v288, v291);
  swift_willThrow();
  (*(void (**)(char *, uint64_t))(v290 + 8))(v288, v291);
  (*(void (**)(char *, void *))(v287 + 8))(v286, v289);
  ((void (*)(uint64_t, void (**)(void, void, void)))v569)(v285, v559);
  return (id)((uint64_t (*)(char *, uint64_t))v58)(v529, v558);
}

uint64_t sub_247975954@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_247975970(a1, 0x736E6F707365722FLL, 0xEA00000000007365, a2);
}

uint64_t sub_247975970@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v25 = a4;
  uint64_t v5 = sub_247998190();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_247998240();
  uint64_t v23 = *(void *)(v9 - 8);
  uint64_t v24 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v26 = 47;
    unint64_t v27 = 0xE100000000000000;
    sub_2479993D0();
    unint64_t v12 = v27;
    uint64_t v20 = v26;
  }
  else
  {
    uint64_t v20 = 0;
    unint64_t v12 = 0xE000000000000000;
  }
  uint64_t v26 = 0x6E6F69737365732FLL;
  unint64_t v27 = 0xE900000000000073;
  uint64_t v13 = *MEMORY[0x263F06E50];
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v14(v8, v13, v5);
  sub_2478A3014();
  sub_247998230();
  uint64_t v19 = v11;
  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v15(v8, v5);
  swift_bridgeObjectRelease();
  uint64_t v26 = v20;
  unint64_t v27 = v12;
  swift_bridgeObjectRetain();
  sub_2479993D0();
  swift_bridgeObjectRelease();
  v14(v8, v13, v5);
  uint64_t v16 = v19;
  sub_247998230();
  v15(v8, v5);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v16, v24);
}

uint64_t sub_247975C14(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_247998E90();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v64 = v4;
  uint64_t v65 = v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v63 = (char *)v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269266FA0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_247998EA0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v62 = (char *)v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v56 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v56 - v17;
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v19((char *)v56 - v17, a1, v10);
  int v20 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v18, v10);
  if (v20 == *MEMORY[0x263F40C38])
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v18, v10);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269266FA8);
    uint64_t v22 = (uint64_t *)swift_projectBox();
    uint64_t v23 = *v22;
    sub_2478E6A48((uint64_t)v22 + *(int *)(v21 + 48), (uint64_t)v9, &qword_269266FA0);
    uint64_t v24 = sub_247998E40();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48))(v9, 1, v24) == 1)
    {
      type metadata accessor for JSONSchema();
      swift_allocObject();
      swift_bridgeObjectRetain();
      a1 = sub_24793EE60(0, 0, 4, 0, v23, 0, 0, 2);
    }
    else
    {
      a1 = sub_2479984E0();
      sub_247977850(&qword_269266BF0, MEMORY[0x263F7F830]);
      swift_allocError();
      uint64_t v45 = v44;
      sub_2479984B0();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(a1 - 8) + 104))(v45, *MEMORY[0x263F7F808], a1);
      swift_willThrow();
    }
    sub_2478A1A1C((uint64_t)v9, &qword_269266FA0);
LABEL_5:
    swift_release();
    return a1;
  }
  if (v20 == *MEMORY[0x263F40C30])
  {
    (*(void (**)(char *, uint64_t))(v11 + 96))(v18, v10);
    uint64_t v25 = *(void *)v18;
    uint64_t v26 = *(void *)(*(void *)v18 + 16);
    int64_t v27 = *(void *)(v26 + 16);
    uint64_t v28 = MEMORY[0x263F8EE78];
    if (v27)
    {
      v56[1] = v25;
      uint64_t v60 = v10;
      unint64_t v69 = MEMORY[0x263F8EE78];
      sub_2479661CC(0, v27, 0);
      uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 16);
      uint64_t v29 = v26 + ((*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80));
      uint64_t v57 = *(void *)(v65 + 72);
      uint64_t v58 = (void (**)(char *, uint64_t))(v11 + 8);
      v65 += 16;
      uint64_t v59 = (void (**)(char *, uint64_t))(v65 - 8);
      while (1)
      {
        int64_t v67 = v27;
        uint64_t v30 = v63;
        uint64_t v31 = v64;
        v61(v63, v29, v64);
        uint64_t v32 = sub_247998E60();
        uint64_t v34 = v33;
        uint64_t v35 = sub_247998E50();
        uint64_t v37 = v36;
        uint64_t v38 = v62;
        sub_247998E70();
        uint64_t v39 = sub_247975C14(v38);
        uint64_t v68 = v2;
        if (v2) {
          break;
        }
        uint64_t v40 = v39;
        (*v58)(v38, v60);
        int v66 = sub_247998E80();
        (*v59)(v30, v31);
        uint64_t v28 = v69;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2479661CC(0, *(void *)(v28 + 16) + 1, 1);
          uint64_t v28 = v69;
        }
        unint64_t v42 = *(void *)(v28 + 16);
        unint64_t v41 = *(void *)(v28 + 24);
        if (v42 >= v41 >> 1)
        {
          sub_2479661CC(v41 > 1, v42 + 1, 1);
          uint64_t v28 = v69;
        }
        *(void *)(v28 + 16) = v42 + 1;
        uint64_t v43 = v28 + 48 * v42;
        *(void *)(v43 + 32) = v32;
        *(void *)(v43 + 40) = v34;
        *(void *)(v43 + 48) = v35;
        *(void *)(v43 + 56) = v37;
        *(void *)(v43 + 64) = v40;
        *(unsigned char *)(v43 + 72) = (v66 & 1) == 0;
        v29 += v57;
        uint64_t v2 = v68;
        int64_t v27 = v67 - 1;
        if (v67 == 1) {
          goto LABEL_24;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*v58)(v38, v60);
      (*v59)(v30, v31);
      a1 = v69;
      swift_release();
      swift_release();
    }
    else
    {
LABEL_24:
      a1 = sub_247945564(v28);
      swift_release();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    if (v20 == *MEMORY[0x263F40C18])
    {
      (*(void (**)(char *, uint64_t))(v11 + 96))(v18, v10);
      uint64_t v46 = swift_projectBox();
      v19(v16, v46, v10);
      uint64_t v47 = sub_247975C14(v16);
      if (!v1)
      {
        uint64_t v48 = v47;
        type metadata accessor for JSONSchema();
        swift_allocObject();
        a1 = sub_24793EE60(0, 0, 5, 0, 0, 0, v48, 2);
      }
      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
      goto LABEL_5;
    }
    if (v20 == *MEMORY[0x263F40BF0] || v20 == *MEMORY[0x263F40C20] || v20 == *MEMORY[0x263F40C50])
    {
      (*(void (**)(char *, uint64_t))(v11 + 96))(v18, v10);
      swift_release();
      a1 = sub_2479984E0();
      sub_247977850(&qword_269266BF0, MEMORY[0x263F7F830]);
      swift_allocError();
      uint64_t v50 = v49;
      sub_2479984B0();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(a1 - 8) + 104))(v50, *MEMORY[0x263F7F808], a1);
      swift_willThrow();
    }
    else
    {
      if (v20 == *MEMORY[0x263F40C40])
      {
        type metadata accessor for JSONSchema();
        swift_allocObject();
        uint64_t v52 = 1;
      }
      else if (v20 == *MEMORY[0x263F40C48])
      {
        type metadata accessor for JSONSchema();
        swift_allocObject();
        uint64_t v52 = 2;
      }
      else
      {
        if (v20 != *MEMORY[0x263F40C28])
        {
          a1 = sub_2479984E0();
          sub_247977850(&qword_269266BF0, MEMORY[0x263F7F830]);
          swift_allocError();
          uint64_t v53 = v10;
          uint64_t v55 = v54;
          unint64_t v69 = 0;
          unint64_t v70 = 0xE000000000000000;
          sub_247999800();
          swift_bridgeObjectRelease();
          unint64_t v69 = 0xD000000000000015;
          unint64_t v70 = 0x80000002479A7310;
          uint64_t v71 = type metadata accessor for BlackPowder();
          __swift_instantiateConcreteTypeFromMangledName(qword_269268A60);
          sub_247999390();
          sub_2479993D0();
          swift_bridgeObjectRelease();
          sub_2479984B0();
          (*(void (**)(uint64_t, void, uint64_t))(*(void *)(a1 - 8) + 104))(v55, *MEMORY[0x263F7F808], a1);
          swift_willThrow();
          (*(void (**)(char *, uint64_t))(v11 + 8))(v18, v53);
          return a1;
        }
        type metadata accessor for JSONSchema();
        swift_allocObject();
        uint64_t v52 = 3;
      }
      return sub_24793EE60(0, 0, v52, 0, 0, 0, 0, 2);
    }
  }
  return a1;
}

uint64_t sub_2479767B4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v57 = a2;
  uint64_t v5 = sub_2479984E0();
  uint64_t v55 = *(void *)(v5 - 8);
  uint64_t v56 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v54 = (char *)v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_2479984D0();
  uint64_t v53 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v52 = (char *)v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_247998E30();
  uint64_t v50 = *(void *)(v60 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v60);
  uint64_t v51 = (char *)v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v45 - v10;
  uint64_t v12 = sub_247998E00();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_247998E10();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = a1;
  sub_247998E20();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v17 + 88))(v19, v16);
  if (result == *MEMORY[0x263F40BB8])
  {
    (*(void (**)(char *, uint64_t))(v17 + 96))(v19, v16);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v19, v12);
    uint64_t v21 = sub_247998DF0();
    uint64_t v23 = v22;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    *a3 = v21;
    a3[1] = v23;
    return result;
  }
  if (result == *MEMORY[0x263F40BB0])
  {
    *a3 = 0;
    a3[1] = 0;
    return result;
  }
  if (result == *MEMORY[0x263F40BC8])
  {
    long long v24 = xmmword_2479A4830;
LABEL_9:
    *(_OWORD *)a3 = v24;
    return result;
  }
  if (result == *MEMORY[0x263F40BC0])
  {
    long long v24 = xmmword_2479A4840;
    goto LABEL_9;
  }
  if (qword_269266AA0 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_247999030();
  __swift_project_value_buffer(v25, (uint64_t)qword_26927FC68);
  uint64_t v26 = v50;
  uint64_t v27 = v60;
  uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 16);
  v61(v11, v58, v60);
  uint64_t v28 = sub_247999010();
  os_log_type_t v29 = sub_247999690();
  int v30 = v29;
  uint64_t v49 = v28;
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    uint64_t v62 = v48;
    int v47 = v30;
    *(_DWORD *)uint64_t v31 = 136315138;
    v45[1] = v31 + 4;
    uint64_t v46 = v31;
    uint64_t v32 = v51;
    v61(v51, (uint64_t)v11, v60);
    uint64_t v33 = sub_247999390();
    uint64_t v64 = sub_247918FF0(v33, v34, &v62);
    sub_247999720();
    uint64_t v27 = v60;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v27);
    uint64_t v35 = v49;
    uint64_t v36 = v46;
    _os_log_impl(&dword_247896000, v49, (os_log_type_t)v47, "Unknown tool choice: %s", v46, 0xCu);
    uint64_t v37 = v48;
    swift_arrayDestroy();
    MEMORY[0x24C564070](v37, -1, -1);
    MEMORY[0x24C564070](v36, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v27);

    uint64_t v32 = v51;
  }
  uint64_t v62 = 0;
  unint64_t v63 = 0xE000000000000000;
  sub_247999800();
  swift_bridgeObjectRelease();
  uint64_t v62 = 0xD000000000000015;
  unint64_t v63 = 0x80000002479A7430;
  v61(v32, v58, v27);
  sub_247999390();
  sub_2479993D0();
  swift_bridgeObjectRelease();
  uint64_t v38 = v52;
  sub_2479984B0();
  uint64_t v40 = v53;
  uint64_t v39 = v54;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v54, v38, v59);
  uint64_t v42 = v55;
  uint64_t v41 = v56;
  (*(void (**)(char *, void, uint64_t))(v55 + 104))(v39, *MEMORY[0x263F7F810], v56);
  sub_247977850(&qword_269266BF0, MEMORY[0x263F7F830]);
  uint64_t v43 = swift_allocError();
  (*(void (**)(uint64_t, char *, uint64_t))(v42 + 16))(v44, v39, v41);
  swift_willThrow();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v39, v41);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v38, v59);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  uint64_t *v57 = v43;
  return result;
}

unint64_t sub_247976F14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_247998430();
  uint64_t v43 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v38 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269168);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_247998B00();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for BlackPowder();
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = a2 + *(int *)(v15 + 20);
  uint64_t v21 = *(void *)(v18 + 240);
  uint64_t v20 = v18 + 240;
  uint64_t v19 = v21;
  if (*(unsigned char *)(v20 + 40) == 1)
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(v20 + 24))(&v44, v19);
    uint64_t v17 = v44;
    uint64_t v16 = v45;
  }
  uint64_t v47 = v16;
  uint64_t v42 = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  uint64_t v39 = a3;
  uint64_t v40 = a1;
  uint64_t v41 = v6;
  if (!v47)
  {
    uint64_t v42 = sub_247998AE0();
    uint64_t v47 = v22;
  }
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269170);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2479A4850;
  *(void *)(inited + 32) = 0xD000000000000010;
  *(void *)(inited + 40) = 0x80000002479A7450;
  long long v24 = self;
  id v25 = objc_msgSend(v24, sel_processInfo);
  objc_msgSend(v25, sel_operatingSystemVersion);
  uint64_t v26 = v44;

  *(void *)(inited + 48) = v26;
  *(void *)(inited + 56) = 0;
  *(unsigned char *)(inited + 64) = 0;
  *(void *)(inited + 72) = 0xD000000000000010;
  *(void *)(inited + 80) = 0x80000002479A7470;
  id v27 = objc_msgSend(v24, sel_processInfo);
  objc_msgSend(v27, sel_operatingSystemVersion);
  uint64_t v28 = v45;

  *(void *)(inited + 88) = v28;
  *(void *)(inited + 96) = 0;
  *(unsigned char *)(inited + 104) = 0;
  *(void *)(inited + 112) = 0xD000000000000010;
  *(void *)(inited + 120) = 0x80000002479A7490;
  id v29 = objc_msgSend(v24, sel_processInfo);
  objc_msgSend(v29, sel_operatingSystemVersion);
  uint64_t v30 = v46;

  *(void *)(inited + 128) = v30;
  *(void *)(inited + 136) = 0;
  *(unsigned char *)(inited + 144) = 0;
  *(void *)(inited + 152) = 0x656C61636F6CLL;
  *(void *)(inited + 160) = 0xE600000000000000;
  sub_247998AF0();
  uint64_t v31 = v41;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v10, 1, v41) == 1)
  {
    sub_2478A1A1C((uint64_t)v10, &qword_269269168);
    uint64_t v10 = v38;
    sub_247998420();
  }
  uint64_t v32 = v39;
  uint64_t v33 = sub_247998410();
  uint64_t v35 = v34;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v31);
  *(void *)(inited + 168) = v33;
  *(void *)(inited + 176) = v35;
  *(unsigned char *)(inited + 184) = 1;
  *(void *)(inited + 192) = 0x6D726F6674616C70;
  *(void *)(inited + 200) = 0xE800000000000000;
  *(_OWORD *)(inited + 208) = xmmword_2479A4860;
  *(unsigned char *)(inited + 224) = 1;
  unint64_t result = sub_2478FB100(inited);
  uint64_t v37 = v47;
  *uint64_t v32 = v42;
  v32[1] = v37;
  v32[2] = result;
  return result;
}

uint64_t sub_247977344@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (!*(void *)(a1 + 16) || (unint64_t v4 = sub_247917D8C(0x745F656372756F73, 0xEB00000000657079), (v5 & 1) == 0))
  {
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_247999030();
    __swift_project_value_buffer(v15, (uint64_t)qword_26927FC68);
    uint64_t v16 = sub_247999010();
    os_log_type_t v17 = sub_247999690();
    if (!os_log_type_enabled(v16, v17)) {
      goto LABEL_16;
    }
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    uint64_t v19 = "Extended attributes for file were not provided";
    goto LABEL_15;
  }
  uint64_t v6 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v4);
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  BOOL v9 = *v6 == 0x65746973626577 && v8 == 0xE700000000000000;
  if (!v9 && (sub_247999B80() & 1) == 0)
  {
    BOOL v28 = v7 == 1701603686 && v8 == 0xE400000000000000;
    if (v28 || (sub_247999B80() & 1) != 0)
    {
      if (*(void *)(a1 + 16) && (unint64_t v29 = sub_247917D8C(0x6D616E5F656C6966, 0xE900000000000065), (v30 & 1) != 0))
      {
        if (*(void *)(a1 + 16))
        {
          uint64_t v31 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v29);
          uint64_t v14 = *v31;
          uint64_t v13 = v31[1];
          swift_bridgeObjectRetain();
          unint64_t v32 = sub_247917D8C(0x6D696D5F656C6966, 0xEE00657079745F65);
          if (v33)
          {
            uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 16 * v32);
            uint64_t result = swift_bridgeObjectRetain();
            long long v22 = xmmword_2479A4870;
            char v23 = 1;
            goto LABEL_23;
          }
          swift_bridgeObjectRelease();
        }
        if (qword_269266AA0 != -1) {
          swift_once();
        }
        uint64_t v36 = sub_247999030();
        __swift_project_value_buffer(v36, (uint64_t)qword_26927FC68);
        uint64_t v16 = sub_247999010();
        os_log_type_t v17 = sub_247999690();
        if (!os_log_type_enabled(v16, v17)) {
          goto LABEL_16;
        }
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v18 = 0;
        uint64_t v19 = "Extended attributes were provided for file, but missing mime type attribute";
      }
      else
      {
        if (qword_269266AA0 != -1) {
          swift_once();
        }
        uint64_t v34 = sub_247999030();
        __swift_project_value_buffer(v34, (uint64_t)qword_26927FC68);
        uint64_t v16 = sub_247999010();
        os_log_type_t v17 = sub_247999690();
        if (!os_log_type_enabled(v16, v17)) {
          goto LABEL_16;
        }
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v18 = 0;
        uint64_t v19 = "Extended attributes were provided for file, but missing name attribute";
      }
    }
    else
    {
      if (qword_269266AA0 != -1) {
        swift_once();
      }
      uint64_t v35 = sub_247999030();
      __swift_project_value_buffer(v35, (uint64_t)qword_26927FC68);
      uint64_t v16 = sub_247999010();
      os_log_type_t v17 = sub_247999690();
      if (!os_log_type_enabled(v16, v17)) {
        goto LABEL_16;
      }
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      uint64_t v19 = "Provided source type attribute is currently not supported. Not saving extended attribute information.";
    }
LABEL_15:
    _os_log_impl(&dword_247896000, v16, v17, v19, v18, 2u);
    MEMORY[0x24C564070](v18, -1, -1);
LABEL_16:

    uint64_t v14 = 0;
    uint64_t v13 = 0;
    uint64_t v20 = 0;
    uint64_t result = 0;
    long long v22 = 0uLL;
    char v23 = -1;
    goto LABEL_23;
  }
  if (*(void *)(a1 + 16) && (unint64_t v10 = sub_247917D8C(7107189, 0xE300000000000000), (v11 & 1) != 0))
  {
    uint64_t v12 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v10);
    uint64_t v14 = *v12;
    uint64_t v13 = v12[1];
    swift_bridgeObjectRetain();
  }
  else
  {
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_247999030();
    __swift_project_value_buffer(v24, (uint64_t)qword_26927FC68);
    id v25 = sub_247999010();
    os_log_type_t v26 = sub_247999690();
    if (os_log_type_enabled(v25, v26))
    {
      id v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v27 = 0;
      _os_log_impl(&dword_247896000, v25, v26, "Extended attributes were provided for website, but missing url attribute", v27, 2u);
      MEMORY[0x24C564070](v27, -1, -1);
    }

    uint64_t v14 = 0;
    uint64_t v13 = 0;
  }
  uint64_t v20 = 0;
  uint64_t result = 0;
  char v23 = 0;
  long long v22 = xmmword_2479A4880;
LABEL_23:
  *(_OWORD *)a2 = v22;
  *(void *)(a2 + 16) = v14;
  *(void *)(a2 + 24) = v13;
  *(void *)(a2 + 32) = v20;
  *(void *)(a2 + 40) = result;
  *(unsigned char *)(a2 + 48) = v23;
  return result;
}

uint64_t sub_247977850(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_247977898(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s14MessageContentOMa(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2479778FC(uint64_t a1, unint64_t a2)
{
  if (a2 != 3) {
    return sub_24797790C(a1, a2);
  }
  return a1;
}

uint64_t sub_24797790C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_247977920@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_247976F14(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_247977940()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void *sub_247977978(void *a1)
{
  uint64_t v2 = sub_2479984D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  os_log_t v92 = (os_log_t)((char *)v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_269266AA0 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_247999030();
  uint64_t v6 = __swift_project_value_buffer(v5, (uint64_t)qword_26927FC68);
  id v7 = a1;
  id v8 = a1;
  uint64_t v93 = v6;
  BOOL v9 = sub_247999010();
  os_log_type_t v10 = sub_247999680();
  if (os_log_type_enabled(v9, v10))
  {
    char v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)char v11 = 138412290;
    id v13 = a1;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v94 = v14;
    sub_247999720();
    *uint64_t v12 = v14;

    _os_log_impl(&dword_247896000, v9, v10, "Transforming error: %@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269266F40);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v12, -1, -1);
    MEMORY[0x24C564070](v11, -1, -1);
  }
  else
  {
  }
  uint64_t v103 = (uint64_t)a1;
  id v15 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269266BD8);
  if (swift_dynamicCast())
  {
    unint64_t v91 = v95;
    uint64_t v16 = v97;
    uint64_t v17 = v98;
    uint64_t v19 = v99;
    uint64_t v18 = v100;
    uint64_t v21 = v101;
    uint64_t v20 = v102;
    uint64_t v89 = v94;
    uint64_t v90 = v96;
    if (v99)
    {
      swift_bridgeObjectRetain();
      char v22 = sub_2478ED30C();
      switch(v22)
      {
        case 6:
        case 7:
        case 8:
          uint64_t v87 = v17;
          char v23 = sub_247999010();
          os_log_type_t v24 = sub_2479996B0();
          if (os_log_type_enabled(v23, v24))
          {
            uint64_t v86 = v3;
            uint64_t v25 = swift_slowAlloc();
            uint64_t v85 = v20;
            os_log_type_t v26 = (uint8_t *)v25;
            uint64_t v27 = swift_slowAlloc();
            uint64_t v93 = v16;
            uint64_t v94 = v27;
            uint64_t v28 = v27;
            uint64_t v88 = v18;
            *(_DWORD *)os_log_type_t v26 = 136315138;
            unint64_t v29 = sub_2478E0878(v22);
            uint64_t v103 = sub_247918FF0(v29, v30, &v94);
            uint64_t v3 = v86;
            uint64_t v18 = v88;
            sub_247999720();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_247896000, v23, v24, "Converted error code %s to TokenGenerationError.authenticationFailed", v26, 0xCu);
            swift_arrayDestroy();
            uint64_t v31 = v28;
            uint64_t v16 = v93;
            MEMORY[0x24C564070](v31, -1, -1);
            unint64_t v32 = v26;
            uint64_t v20 = v85;
            MEMORY[0x24C564070](v32, -1, -1);
          }

          sub_2478A1B50();
          swift_allocError();
          unint64_t v33 = v91;
          *uint64_t v34 = v89;
          v34[1] = v33;
          v34[2] = v90;
          v34[3] = v16;
          v34[4] = v87;
          v34[5] = v19;
          v34[6] = v18;
          v34[7] = v21;
          v34[8] = v20;
          os_log_t v35 = v92;
          goto LABEL_24;
        case 18:
          uint64_t v88 = v18;
          unint64_t v63 = sub_247999010();
          os_log_type_t v64 = sub_2479996B0();
          if (os_log_type_enabled(v63, v64))
          {
            uint64_t v93 = v19;
            uint64_t v87 = v17;
            uint64_t v65 = (uint8_t *)swift_slowAlloc();
            uint64_t v86 = swift_slowAlloc();
            uint64_t v94 = v86;
            *(_DWORD *)uint64_t v65 = 136315138;
            uint64_t v85 = (uint64_t)(v65 + 4);
            unint64_t v66 = sub_2478E0878(18);
            uint64_t v103 = sub_247918FF0(v66, v67, &v94);
            sub_247999720();
            uint64_t v17 = v87;
            uint64_t v19 = v93;
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_247896000, v63, v64, "Converted error code %s to TokenGenerationError.authenticationFailed", v65, 0xCu);
            uint64_t v68 = v86;
            swift_arrayDestroy();
            MEMORY[0x24C564070](v68, -1, -1);
            MEMORY[0x24C564070](v65, -1, -1);
          }

          uint64_t v69 = v89;
          sub_2478A1B50();
          swift_allocError();
          unint64_t v70 = v91;
          os_log_t v35 = v92;
          *uint64_t v71 = v69;
          v71[1] = v70;
          v71[2] = v90;
          v71[3] = v16;
          v71[4] = v17;
          v71[5] = v19;
          v71[6] = v88;
          v71[7] = v21;
          v71[8] = v20;
          goto LABEL_24;
        case 22:
        case 23:
          uint64_t v87 = v17;
          uint64_t v47 = sub_247999010();
          os_log_type_t v48 = sub_2479996B0();
          if (os_log_type_enabled(v47, v48))
          {
            uint64_t v86 = v21;
            uint64_t v49 = swift_slowAlloc();
            uint64_t v93 = v16;
            uint64_t v50 = (uint8_t *)v49;
            uint64_t v85 = swift_slowAlloc();
            uint64_t v94 = v85;
            uint64_t v88 = v18;
            *(_DWORD *)uint64_t v50 = 136315138;
            uint64_t v21 = v86;
            v84[1] = v50 + 4;
            unint64_t v51 = sub_2478E0878(v22);
            uint64_t v103 = sub_247918FF0(v51, v52, &v94);
            uint64_t v18 = v88;
            sub_247999720();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_247896000, v47, v48, "Converted error code %s to TokenGenerationError.invalidated", v50, 0xCu);
            uint64_t v53 = v85;
            swift_arrayDestroy();
            MEMORY[0x24C564070](v53, -1, -1);
            uint64_t v54 = v50;
            uint64_t v16 = v93;
            MEMORY[0x24C564070](v54, -1, -1);
          }

          sub_2478A1B50();
          swift_allocError();
          unint64_t v55 = v91;
          *uint64_t v56 = v89;
          v56[1] = v55;
          void v56[2] = v90;
          v56[3] = v16;
          v56[4] = v87;
          v56[5] = v19;
          v56[6] = v18;
          v56[7] = v21;
          v56[8] = v20;
          os_log_t v35 = v92;
          sub_2479984B0();
          uint64_t v57 = sub_2479984E0();
          sub_247977850(&qword_269266BF0, MEMORY[0x263F7F830]);
          a1 = (void *)swift_allocError();
          uint64_t v59 = v58;
          (*(void (**)(uint64_t, os_log_t, uint64_t))(v3 + 16))(v58, v35, v2);
          uint64_t v60 = (unsigned int *)MEMORY[0x263F7F7F0];
          goto LABEL_25;
        case 24:
          uint64_t v88 = v18;
          uint64_t v74 = sub_247999010();
          os_log_type_t v75 = sub_2479996B0();
          if (os_log_type_enabled(v74, v75))
          {
            uint64_t v93 = v19;
            uint64_t v87 = v17;
            uint64_t v76 = (uint8_t *)swift_slowAlloc();
            uint64_t v86 = swift_slowAlloc();
            uint64_t v94 = v86;
            *(_DWORD *)uint64_t v76 = 136315138;
            uint64_t v85 = (uint64_t)(v76 + 4);
            unint64_t v77 = sub_2478E0878(24);
            uint64_t v103 = sub_247918FF0(v77, v78, &v94);
            sub_247999720();
            uint64_t v17 = v87;
            uint64_t v19 = v93;
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_247896000, v74, v75, "Converted error code %s to TokenGenerationError.invalidParameters", v76, 0xCu);
            uint64_t v79 = v86;
            swift_arrayDestroy();
            MEMORY[0x24C564070](v79, -1, -1);
            MEMORY[0x24C564070](v76, -1, -1);
          }

          uint64_t v80 = v89;
          sub_2478A1B50();
          swift_allocError();
          unint64_t v81 = v91;
          os_log_t v35 = v92;
          *uint64_t v82 = v80;
          v82[1] = v81;
          v82[2] = v90;
          v82[3] = v16;
          v82[4] = v17;
          v82[5] = v19;
          v82[6] = v88;
          v82[7] = v21;
          v82[8] = v20;
          sub_2479984B0();
          uint64_t v57 = sub_2479984E0();
          sub_247977850(&qword_269266BF0, MEMORY[0x263F7F830]);
          a1 = (void *)swift_allocError();
          uint64_t v59 = v83;
          (*(void (**)(uint64_t, os_log_t, uint64_t))(v3 + 16))(v83, v35, v2);
          uint64_t v60 = (unsigned int *)MEMORY[0x263F7F810];
          goto LABEL_25;
        case 25:
          goto LABEL_13;
        default:
          uint64_t v94 = 0;
          unint64_t v95 = 0xE000000000000000;
          sub_247999800();
          swift_bridgeObjectRelease();
          uint64_t v94 = 0xD000000000000022;
          unint64_t v95 = 0x80000002479A74B0;
          sub_2478E0878(v22);
          sub_2479993D0();
          swift_bridgeObjectRelease();
          sub_2478A1B50();
          swift_allocError();
          unint64_t v61 = v91;
          *uint64_t v62 = v89;
          v62[1] = v61;
          v62[2] = v90;
          v62[3] = v16;
          v62[4] = v17;
          v62[5] = v19;
          v62[6] = v18;
          v62[7] = v21;
          v62[8] = v20;
          os_log_t v35 = v92;
LABEL_24:
          sub_2479984B0();
          uint64_t v57 = sub_2479984E0();
          sub_247977850(&qword_269266BF0, MEMORY[0x263F7F830]);
          a1 = (void *)swift_allocError();
          uint64_t v59 = v72;
          (*(void (**)(uint64_t, os_log_t, uint64_t))(v3 + 16))(v72, v35, v2);
          uint64_t v60 = (unsigned int *)MEMORY[0x263F7F818];
LABEL_25:
          (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v57 - 8) + 104))(v59, *v60, v57);
          (*(void (**)(os_log_t, uint64_t))(v3 + 8))(v35, v2);
          break;
      }
    }
    else
    {
LABEL_13:
      unint64_t v37 = v91;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2478A1ACC(v18);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2478A1ACC(v18);
      uint64_t v38 = sub_247999010();
      os_log_type_t v39 = sub_247999690();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = swift_slowAlloc();
        os_log_t v92 = v38;
        uint64_t v41 = (uint8_t *)v40;
        uint64_t v93 = swift_slowAlloc();
        uint64_t v94 = v17;
        uint64_t v103 = v93;
        uint64_t v88 = v18;
        *(_DWORD *)uint64_t v41 = 136446210;
        unint64_t v95 = v19;
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_269268900);
        uint64_t v42 = sub_247999390();
        uint64_t v94 = sub_247918FF0(v42, v43, &v103);
        uint64_t v18 = v88;
        sub_247999720();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v37 = v91;
        swift_bridgeObjectRelease();
        sub_2478A1B10(v18);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_2478A1B10(v18);
        os_log_t v44 = v92;
        _os_log_impl(&dword_247896000, v92, v39, "Unrecognized error code: %{public}s", v41, 0xCu);
        uint64_t v45 = v93;
        swift_arrayDestroy();
        MEMORY[0x24C564070](v45, -1, -1);
        MEMORY[0x24C564070](v41, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_2478A1B10(v18);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_2478A1B10(v18);
      }
      sub_2478A1B50();
      a1 = (void *)swift_allocError();
      *uint64_t v46 = v89;
      v46[1] = v37;
      v46[2] = v90;
      v46[3] = v16;
      v46[4] = v17;
      v46[5] = v19;
      v46[6] = v18;
      v46[7] = v21;
      v46[8] = v20;
    }
  }
  else
  {
    id v36 = a1;
  }
  return a1;
}

uint64_t sub_2479787DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BlackPowder();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247978840(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BlackPowder();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24797889C@<X0>(unint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (uint64_t result = sub_247917F08(result), (v5 & 1) != 0))
  {
    uint64_t v6 = (uint64_t *)(*(void *)(a2 + 56) + 48 * result);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    uint64_t v10 = v6[2];
    uint64_t v9 = v6[3];
    uint64_t v12 = v6[4];
    uint64_t v11 = v6[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    uint64_t v12 = 0;
    uint64_t v11 = 0;
  }
  *a3 = v8;
  a3[1] = v7;
  a3[2] = v10;
  a3[3] = v9;
  a3[4] = v12;
  a3[5] = v11;
  return result;
}

uint64_t sub_247978940(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269266BD8);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    id v8 = a2;
    uint64_t v9 = sub_2479982F0();
    uint64_t v11 = v10;

    uint64_t v12 = *(uint64_t **)(*(void *)(v3 + 64) + 40);
    *uint64_t v12 = v9;
    v12[1] = v11;
    return MEMORY[0x270FA2408](v3);
  }
}

uint64_t sub_247978A14(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_247999B80();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_247999B80() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

BOOL sub_247978ADC(BOOL result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  int v3 = result;
  if (*(unsigned char *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 33; ; ++i)
  {
    uint64_t v5 = i - 31;
    if (__OFADD__(i - 32, 1)) {
      break;
    }
    int v6 = *(unsigned __int8 *)(a2 + i);
    uint64_t result = v6 == v3;
    if (v6 == v3 || v5 == v2) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_247978B3C(uint64_t a1)
{
  v2[32] = a1;
  v2[33] = v1;
  uint64_t v3 = sub_247997FD0();
  v2[34] = v3;
  v2[35] = *(void *)(v3 - 8);
  v2[36] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247978BFC, 0, 0);
}

uint64_t sub_247978BFC()
{
  uint64_t v1 = v0[33];
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[37] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_247978CA0;
  uint64_t v5 = v0[32];
  return sub_24797CA0C(v5, v3, v2);
}

uint64_t sub_247978CA0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 304) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_247978DA0, 0, 0);
}

uint64_t sub_247978DA0()
{
  id v8 = v0;
  uint64_t v1 = v0[38];
  uint64_t v2 = MEMORY[0x263F8EE80];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = v2;
  sub_2479196C4(v1, (uint64_t)sub_2479693F0, 0, isUniquelyReferenced_nonNull_native, &v7);
  v0[39] = 0;
  v0[40] = v7;
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[41] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_247978EC0;
  uint64_t v5 = v0[32];
  return sub_247979CEC(v5);
}

uint64_t sub_247978EC0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 336) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_247978FC0, 0, 0);
}

uint64_t sub_247978FC0()
{
  uint64_t v14 = v0;
  uint64_t v1 = v0[42];
  uint64_t v3 = v0[39];
  uint64_t v2 = v0[40];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = v2;
  sub_2479196C4(v1, (uint64_t)sub_2479693F0, 0, isUniquelyReferenced_nonNull_native, &v13);
  if (v3)
  {
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = v0[32];
    uint64_t v7 = v13;
    v0[43] = v13;
    swift_bridgeObjectRelease();
    if (sub_247978ADC(0, v6))
    {
      id v8 = self;
      uint64_t v9 = sub_247999320();
      v0[44] = v9;
      uint64_t v10 = sub_247999320();
      v0[45] = v10;
      v0[2] = v0;
      v0[7] = v0 + 15;
      v0[3] = sub_247979208;
      uint64_t v11 = swift_continuation_init();
      v0[10] = MEMORY[0x263EF8330];
      v0[11] = 0x40000000;
      v0[12] = sub_247978940;
      v0[13] = &block_descriptor_3;
      v0[14] = v11;
      objc_msgSend(v8, sel_fetchAuxiliaryAuthenticationDataFromCacheForType_label_cacheKey_completionHandler_, 1, v9, v10, v0 + 10);
      return MEMORY[0x270FA23F0](v0 + 2);
    }
    else
    {
      swift_task_dealloc();
      BOOL v12 = (uint64_t (*)(uint64_t))v0[1];
      return v12(v7);
    }
  }
}

uint64_t sub_247979208()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 368) = v1;
  if (v1) {
    uint64_t v2 = sub_247979744;
  }
  else {
    uint64_t v2 = sub_247979318;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247979318()
{
  uint64_t v1 = *(void **)(v0 + 352);
  uint64_t v3 = *(void *)(v0 + 120);
  unint64_t v2 = *(void *)(v0 + 128);

  switch(v2 >> 62)
  {
    case 1uLL:
      if ((int)v3 != v3 >> 32) {
        goto LABEL_3;
      }
      goto LABEL_10;
    case 2uLL:
      if (*(void *)(v3 + 16) == *(void *)(v3 + 24)) {
        goto LABEL_10;
      }
      goto LABEL_3;
    case 3uLL:
      goto LABEL_10;
    default:
      if ((v2 & 0xFF000000000000) != 0)
      {
LABEL_3:
        uint64_t v4 = *(void *)(v0 + 280);
        uint64_t v5 = *(void *)(v0 + 288);
        uint64_t v28 = *(void *)(v0 + 272);
        uint64_t v29 = *(void *)(v0 + 344);
        *(void *)(v0 + 152) = sub_2479982E0();
        *(void *)(v0 + 160) = v6;
        *(void *)(v0 + 168) = 43;
        *(void *)(v0 + 176) = 0xE100000000000000;
        *(void *)(v0 + 184) = 45;
        *(void *)(v0 + 192) = 0xE100000000000000;
        sub_2478A3014();
        uint64_t v7 = sub_247999750();
        uint64_t v9 = v8;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 136) = v7;
        *(void *)(v0 + 144) = v9;
        *(void *)(v0 + 216) = 47;
        *(void *)(v0 + 224) = 0xE100000000000000;
        *(void *)(v0 + 232) = 95;
        *(void *)(v0 + 240) = 0xE100000000000000;
        uint64_t v10 = sub_247999750();
        uint64_t v12 = v11;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 200) = v10;
        *(void *)(v0 + 208) = v12;
        sub_247997FC0();
        uint64_t v13 = sub_247999740();
        uint64_t v15 = v14;
        (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v28);
        swift_bridgeObjectRelease();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_24791D0E4(v13, v15, 0xD000000000000010, 0x80000002479A7600, isUniquelyReferenced_nonNull_native);
        uint64_t v17 = v29;
        swift_bridgeObjectRelease();
        if (qword_269266AA0 != -1) {
          swift_once();
        }
        uint64_t v18 = sub_247999030();
        __swift_project_value_buffer(v18, (uint64_t)qword_26927FC68);
        uint64_t v19 = sub_247999010();
        os_log_type_t v20 = sub_247999670();
        if (os_log_type_enabled(v19, v20))
        {
          uint64_t v21 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v21 = 0;
          _os_log_impl(&dword_247896000, v19, v20, "Successfully retrieved the downgrade signal", v21, 2u);
          MEMORY[0x24C564070](v21, -1, -1);

          sub_2478A0704(v3, v2);
        }
        else
        {
          sub_2478A0704(v3, v2);
        }
      }
      else
      {
LABEL_10:
        if (qword_269266AA0 != -1) {
          swift_once();
        }
        uint64_t v22 = sub_247999030();
        __swift_project_value_buffer(v22, (uint64_t)qword_26927FC68);
        char v23 = sub_247999010();
        os_log_type_t v24 = sub_247999690();
        if (os_log_type_enabled(v23, v24))
        {
          uint64_t v25 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v25 = 0;
          _os_log_impl(&dword_247896000, v23, v24, "Returned downgrade signal from networking layer is unexpectedly empty", v25, 2u);
          MEMORY[0x24C564070](v25, -1, -1);

          sub_2478A0704(v3, v2);
        }
        else
        {
          sub_2478A0704(v3, v2);
        }
        uint64_t v17 = *(void *)(v0 + 344);
      }
      swift_task_dealloc();
      os_log_type_t v26 = *(uint64_t (**)(uint64_t))(v0 + 8);
      return v26(v17);
  }
}

uint64_t sub_247979744()
{
  uint64_t v1 = (void *)v0[45];
  unint64_t v2 = (void *)v0[44];
  swift_willThrow();

  if (qword_269266AA0 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)v0[46];
  uint64_t v4 = sub_247999030();
  __swift_project_value_buffer(v4, (uint64_t)qword_26927FC68);
  id v5 = v3;
  id v6 = v3;
  uint64_t v7 = sub_247999010();
  os_log_type_t v8 = sub_247999690();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = (void *)v0[46];
  if (v9)
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 138412290;
    id v13 = v10;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[31] = v14;
    sub_247999720();
    *uint64_t v12 = v14;

    _os_log_impl(&dword_247896000, v7, v8, "Failed to fetch downgrade signal %@.", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269266F40);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v12, -1, -1);
    MEMORY[0x24C564070](v11, -1, -1);
  }
  else
  {
  }
  uint64_t v15 = v0[43];
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(uint64_t))v0[1];
  return v16(v15);
}

uint64_t sub_24797996C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692691C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24799A900;
  *(void *)(inited + 40) = 0xD000000000000022;
  *(void *)(inited + 48) = 0x80000002479A7730;
  *(void *)(inited + 56) = 0xD00000000000001CLL;
  *(void *)(inited + 64) = 0x80000002479A7620;
  *(void *)(inited + 72) = 0xD000000000000025;
  *(void *)(inited + 80) = 0x80000002479A7640;
  *(unsigned char *)(inited + 88) = 1;
  *(void *)(inited + 96) = 0xD000000000000021;
  *(void *)(inited + 104) = 0x80000002479A7760;
  *(void *)(inited + 112) = 0xD000000000000011;
  *(void *)(inited + 120) = 0x80000002479A7670;
  *(void *)(inited + 128) = 0xD00000000000001ALL;
  *(void *)(inited + 136) = 0x80000002479A7690;
  *(unsigned char *)(inited + 144) = 2;
  *(void *)(inited + 152) = 0xD000000000000022;
  *(void *)(inited + 160) = 0x80000002479A7790;
  *(void *)(inited + 168) = 0xD000000000000010;
  *(void *)(inited + 176) = 0x80000002479A76B0;
  *(void *)(inited + 184) = 0xD000000000000019;
  *(void *)(inited + 192) = 0x80000002479A76D0;
  *(unsigned char *)(inited + 200) = 3;
  *(void *)(inited + 208) = 0xD00000000000001DLL;
  *(void *)(inited + 216) = 0x80000002479A77C0;
  *(void *)(inited + 224) = 0xD000000000000010;
  *(void *)(inited + 232) = 0x80000002479A76F0;
  *(void *)(inited + 240) = 0xD000000000000019;
  *(void *)(inited + 248) = 0x80000002479A7710;
  *(unsigned char *)(inited + 32) = 0;
  uint64_t v1 = (void *)sub_24791D8B0(inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692691D0);
  uint64_t result = swift_arrayDestroy();
  off_269269180 = v1;
  return result;
}

uint64_t sub_247979B34()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692691C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24799A900;
  *(void *)(inited + 40) = 0xD00000000000001ELL;
  *(void *)(inited + 48) = 0x80000002479A7580;
  *(void *)(inited + 56) = 0xD00000000000001CLL;
  *(void *)(inited + 64) = 0x80000002479A7620;
  *(void *)(inited + 72) = 0xD000000000000025;
  *(void *)(inited + 80) = 0x80000002479A7640;
  *(unsigned char *)(inited + 88) = 1;
  *(void *)(inited + 96) = 0xD00000000000001DLL;
  *(void *)(inited + 104) = 0x80000002479A75A0;
  *(void *)(inited + 112) = 0xD000000000000011;
  *(void *)(inited + 120) = 0x80000002479A7670;
  *(void *)(inited + 128) = 0xD00000000000001ALL;
  *(void *)(inited + 136) = 0x80000002479A7690;
  *(unsigned char *)(inited + 144) = 2;
  *(void *)(inited + 152) = 0xD00000000000001ELL;
  *(void *)(inited + 160) = 0x80000002479A75E0;
  *(void *)(inited + 168) = 0xD000000000000010;
  *(void *)(inited + 176) = 0x80000002479A76B0;
  *(void *)(inited + 184) = 0xD000000000000019;
  *(void *)(inited + 192) = 0x80000002479A76D0;
  *(unsigned char *)(inited + 200) = 3;
  *(void *)(inited + 208) = 0xD000000000000019;
  *(void *)(inited + 216) = 0x80000002479A75C0;
  *(void *)(inited + 224) = 0xD000000000000010;
  *(void *)(inited + 232) = 0x80000002479A76F0;
  *(void *)(inited + 240) = 0xD000000000000019;
  *(void *)(inited + 248) = 0x80000002479A7710;
  *(unsigned char *)(inited + 32) = 0;
  uint64_t v1 = (void *)sub_24791D8B0(inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692691D0);
  uint64_t result = swift_arrayDestroy();
  off_269269188 = v1;
  return result;
}

uint64_t sub_247979CEC(uint64_t a1)
{
  v2[25] = a1;
  v2[26] = v1;
  uint64_t v3 = sub_247997FD0();
  v2[27] = v3;
  v2[28] = *(void *)(v3 - 8);
  v2[29] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247979DAC, 0, 0);
}

uint64_t sub_247979DAC()
{
  uint64_t v1 = *(void *)(v0[25] + 16);
  v0[30] = v1;
  if (v1)
  {
    uint64_t v2 = qword_269266AB8;
    unint64_t v3 = swift_bridgeObjectRetain();
    if (v2 != -1) {
      unint64_t v3 = swift_once();
    }
    v0[31] = MEMORY[0x263F8EE80];
    v0[32] = 0;
    id v6 = off_269269188;
    if (*((void *)off_269269188 + 2))
    {
      unint64_t v3 = sub_247917F08(*(unsigned char *)(v0[25] + 32));
      if (v4)
      {
        uint64_t v7 = (void *)(v6[7] + 48 * v3);
        v0[33] = *v7;
        v0[34] = v7[1];
        uint64_t v9 = v7[2];
        uint64_t v8 = v7[3];
        v0[35] = v8;
        v0[36] = v7[4];
        v0[37] = v7[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v10 = (void *)swift_task_alloc();
        v0[38] = v10;
        void *v10 = v0;
        v10[1] = sub_247979F64;
        v10[3] = v9;
        v10[4] = v8;
        unint64_t v3 = (unint64_t)sub_24797DCA0;
        uint64_t v4 = 0;
        uint64_t v5 = 0;
        return MEMORY[0x270FA2498](v3, v4, v5);
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return MEMORY[0x270FA2498](v3, v4, v5);
  }
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v12 = MEMORY[0x263F8EE80];
  return v11(v12);
}

uint64_t sub_247979F64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = a3;
  v4[39] = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24797A088, 0, 0);
}

uint64_t sub_24797A088()
{
  uint64_t v53 = v0;
  if (!v0[39])
  {
    uint64_t v18 = (void *)swift_task_alloc();
    v0[40] = v18;
    void *v18 = v0;
    v18[1] = sub_24797A66C;
    uint64_t v19 = v0[37];
    v18[3] = v0[36];
    v18[4] = v19;
    goto LABEL_15;
  }
  uint64_t v1 = v0[3];
  unint64_t v2 = v0[4];
  swift_bridgeObjectRelease();
  sub_2478A06AC(v1, v2);
  unint64_t v3 = (void *)v0[39];
  uint64_t v5 = v0[33];
  uint64_t v4 = v0[34];
  uint64_t v6 = (uint64_t *)v0[26];
  swift_bridgeObjectRetain();
  uint64_t v50 = v3;
  id v7 = v3;
  sub_2478A06AC(v1, v2);
  id v8 = v7;
  uint64_t v51 = v1;
  sub_2478A0704(v1, v2);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v52 = *v6;
  *uint64_t v6 = 0x8000000000000000;
  uint64_t v49 = v8;
  sub_24791D26C((uint64_t)v8, v5, v4, isUniquelyReferenced_nonNull_native);
  *uint64_t v6 = v52;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_269266AA0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_247999030();
  __swift_project_value_buffer(v10, (uint64_t)qword_26927FC68);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_247999010();
  os_log_type_t v12 = sub_247999670();
  BOOL v13 = os_log_type_enabled(v11, v12);
  unint64_t v14 = v0[34];
  if (v13)
  {
    uint64_t v15 = v0[33];
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v52 = v17;
    *(_DWORD *)uint64_t v16 = 136315138;
    swift_bridgeObjectRetain();
    v0[24] = sub_247918FF0(v15, v14, &v52);
    sub_247999720();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247896000, v11, v12, "Fetched request for refund token: %s from attester.", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v17, -1, -1);
    MEMORY[0x24C564070](v16, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v47 = v0[33];
  uint64_t v48 = v0[34];
  uint64_t v20 = v0[28];
  uint64_t v21 = v0[29];
  uint64_t v45 = v0[27];
  uint64_t v46 = v0[31];
  v0[10] = sub_2479982E0();
  v0[11] = v22;
  v0[12] = 43;
  v0[13] = 0xE100000000000000;
  v0[14] = 45;
  v0[15] = 0xE100000000000000;
  sub_2478A3014();
  uint64_t v23 = sub_247999750();
  uint64_t v25 = v24;
  swift_bridgeObjectRelease();
  v0[16] = v23;
  v0[17] = v25;
  v0[18] = 47;
  v0[19] = 0xE100000000000000;
  v0[20] = 95;
  v0[21] = 0xE100000000000000;
  uint64_t v26 = sub_247999750();
  uint64_t v28 = v27;
  swift_bridgeObjectRelease();
  v0[22] = v26;
  v0[23] = v28;
  sub_247997FC0();
  uint64_t v29 = sub_247999740();
  uint64_t v31 = v30;
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v45);
  swift_bridgeObjectRelease();
  char v32 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v52 = v46;
  sub_24791D0E4(v29, v31, v47, v48, v32);
  uint64_t v33 = v52;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24797F3CC(v51, v2, v50);
  sub_2478A0704(v51, v2);

  uint64_t v37 = v0[32] + 1;
  if (v37 != v0[30])
  {
    v0[31] = v33;
    v0[32] = v37;
    uint64_t v40 = off_269269188;
    if (*((void *)off_269269188 + 2))
    {
      unint64_t v34 = sub_247917F08(*(unsigned char *)(v0[25] + v37 + 32));
      if (v35)
      {
        uint64_t v41 = (void *)(v40[7] + 48 * v34);
        v0[33] = *v41;
        v0[34] = v41[1];
        uint64_t v43 = v41[2];
        uint64_t v42 = v41[3];
        v0[35] = v42;
        v0[36] = v41[4];
        v0[37] = v41[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        os_log_t v44 = (void *)swift_task_alloc();
        v0[38] = v44;
        void *v44 = v0;
        v44[1] = sub_247979F64;
        v44[3] = v43;
        v44[4] = v42;
LABEL_15:
        unint64_t v34 = (unint64_t)sub_24797DCA0;
        uint64_t v35 = 0;
        uint64_t v36 = 0;
        return MEMORY[0x270FA2498](v34, v35, v36);
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return MEMORY[0x270FA2498](v34, v35, v36);
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v38 = (uint64_t (*)(uint64_t))v0[1];
  return v38(v33);
}

uint64_t sub_24797A66C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)*v3;
  v4[6] = v3;
  v4[7] = a1;
  v4[8] = a2;
  v4[9] = a3;
  v4[41] = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24797A790, 0, 0);
}

uint64_t sub_24797A790()
{
  uint64_t v58 = v0;
  if (!v0[41])
  {
    if (qword_269266AA0 == -1) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
  uint64_t v1 = v0[7];
  unint64_t v2 = v0[8];
  sub_2478A06AC(v1, v2);
  unint64_t v3 = (void *)v0[41];
  uint64_t v5 = v0[33];
  uint64_t v4 = v0[34];
  uint64_t v6 = (uint64_t *)v0[26];
  swift_bridgeObjectRetain();
  unint64_t v55 = v3;
  id v7 = v3;
  sub_2478A06AC(v1, v2);
  id v8 = v7;
  uint64_t v56 = v1;
  sub_2478A0704(v1, v2);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v57 = *v6;
  *uint64_t v6 = 0x8000000000000000;
  uint64_t v54 = v8;
  sub_24791D26C((uint64_t)v8, v5, v4, isUniquelyReferenced_nonNull_native);
  *uint64_t v6 = v57;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_269266AA0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_247999030();
  __swift_project_value_buffer(v10, (uint64_t)qword_26927FC68);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_247999010();
  os_log_type_t v12 = sub_247999670();
  BOOL v13 = os_log_type_enabled(v11, v12);
  unint64_t v14 = v0[34];
  if (v13)
  {
    uint64_t v51 = v0[33];
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v57 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    swift_bridgeObjectRetain();
    v0[24] = sub_247918FF0(v51, v14, &v57);
    sub_247999720();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247896000, v11, v12, "Fetched request for refund token: %s from attester.", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v16, -1, -1);
    MEMORY[0x24C564070](v15, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v52 = v0[33];
  uint64_t v53 = v0[34];
  uint64_t v25 = v0[28];
  uint64_t v26 = v0[29];
  uint64_t v49 = v0[27];
  uint64_t v50 = v0[31];
  v0[10] = sub_2479982E0();
  v0[11] = v27;
  v0[12] = 43;
  v0[13] = 0xE100000000000000;
  v0[14] = 45;
  v0[15] = 0xE100000000000000;
  sub_2478A3014();
  uint64_t v28 = sub_247999750();
  uint64_t v30 = v29;
  swift_bridgeObjectRelease();
  v0[16] = v28;
  v0[17] = v30;
  v0[18] = 47;
  v0[19] = 0xE100000000000000;
  v0[20] = 95;
  v0[21] = 0xE100000000000000;
  uint64_t v31 = sub_247999750();
  uint64_t v33 = v32;
  swift_bridgeObjectRelease();
  v0[22] = v31;
  v0[23] = v33;
  sub_247997FC0();
  uint64_t v34 = sub_247999740();
  uint64_t v36 = v35;
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v26, v49);
  swift_bridgeObjectRelease();
  char v37 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v57 = v50;
  sub_24791D0E4(v34, v36, v52, v53, v37);
  uint64_t v38 = v57;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24797F3CC(v56, v2, v55);
  sub_2478A0704(v56, v2);

  while (1)
  {
    uint64_t v39 = v0[32] + 1;
    if (v39 == v0[30])
    {
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      uint64_t v40 = (uint64_t (*)(uint64_t))v0[1];
      return v40(v38);
    }
    v0[31] = v38;
    v0[32] = v39;
    uint64_t v42 = off_269269188;
    if (!*((void *)off_269269188 + 2))
    {
      __break(1u);
      goto LABEL_23;
    }
    unint64_t v43 = sub_247917F08(*(unsigned char *)(v0[25] + v39 + 32));
    if (v44) {
      break;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    swift_once();
LABEL_7:
    uint64_t v17 = sub_247999030();
    __swift_project_value_buffer(v17, (uint64_t)qword_26927FC68);
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_247999010();
    os_log_type_t v19 = sub_247999690();
    BOOL v20 = os_log_type_enabled(v18, v19);
    unint64_t v21 = v0[34];
    if (v20)
    {
      uint64_t v22 = v0[33];
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v57 = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v23 + 4) = sub_247918FF0(v22, v21, &v57);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_247896000, v18, v19, "Unable to fetch request for refund token: %s from attester. High chance of inference failure.", (uint8_t *)v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v24, -1, -1);
      MEMORY[0x24C564070](v23, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v38 = v0[31];
  }
  uint64_t v45 = (void *)(v42[7] + 48 * v43);
  v0[33] = *v45;
  v0[34] = v45[1];
  uint64_t v47 = v45[2];
  uint64_t v46 = v45[3];
  v0[35] = v46;
  v0[36] = v45[4];
  v0[37] = v45[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v48 = (void *)swift_task_alloc();
  v0[38] = v48;
  *uint64_t v48 = v0;
  v48[1] = sub_247979F64;
  v48[3] = v47;
  v48[4] = v46;
  return MEMORY[0x270FA2498](sub_24797DCA0, 0, 0);
}

uint64_t sub_24797AE70(uint64_t a1)
{
  v1[17] = a1;
  uint64_t v2 = sub_247999070();
  v1[18] = v2;
  v1[19] = *(void *)(v2 - 8);
  v1[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24797AF30, 0, 0);
}

uint64_t sub_24797AF30()
{
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  unint64_t v3 = (void *)v0[17];
  uint64_t v4 = v0[18];
  sub_24797F38C();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F8F060], v4);
  uint64_t v5 = sub_2479996C0();
  v0[21] = v5;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24797B0A4;
  uint64_t v6 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_247978940;
  v0[13] = &block_descriptor_7;
  v0[14] = v6;
  objc_msgSend(v3, sel_generateTokenRequestWithQueue_completionHandler_, v5, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24797B0A4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 176) = v1;
  if (v1) {
    uint64_t v2 = sub_24797F714;
  }
  else {
    uint64_t v2 = sub_24797F710;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24797B1B4(uint64_t a1)
{
  v1[17] = a1;
  uint64_t v2 = sub_247999070();
  v1[18] = v2;
  v1[19] = *(void *)(v2 - 8);
  v1[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24797B274, 0, 0);
}

uint64_t sub_24797B274()
{
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  unint64_t v3 = (void *)v0[17];
  uint64_t v4 = v0[18];
  uint64_t v5 = (void *)sub_247999320();
  objc_msgSend(v3, sel_setAuxiliaryAuthenticationCacheKey_, v5);

  sub_24797F38C();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, *MEMORY[0x263F8F060], v4);
  uint64_t v6 = sub_2479996C0();
  v0[21] = v6;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24797B420;
  uint64_t v7 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_247978940;
  v0[13] = &block_descriptor_16;
  v0[14] = v7;
  objc_msgSend(v3, sel_fetchTokenWithQueue_completionHandler_, v6, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24797B420()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 176) = v1;
  if (v1) {
    uint64_t v2 = sub_24797B5B0;
  }
  else {
    uint64_t v2 = sub_24797B530;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24797B530()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 128);

  swift_task_dealloc();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v3(v1, v2);
}

uint64_t sub_24797B5B0()
{
  uint64_t v1 = *(void **)(v0 + 168);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24797B62C(uint64_t a1, char a2)
{
  *(unsigned char *)(v2 + 184) = a2;
  *(void *)(v2 + 136) = a1;
  uint64_t v3 = sub_247999070();
  *(void *)(v2 + 144) = v3;
  *(void *)(v2 + 152) = *(void *)(v3 - 8);
  *(void *)(v2 + 160) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24797B6F0, 0, 0);
}

uint64_t sub_24797B6F0()
{
  if (!*(unsigned char *)(v0 + 184))
  {
    uint64_t v1 = *(void **)(v0 + 136);
    uint64_t v2 = (void *)sub_247999320();
    objc_msgSend(v1, sel_setAuxiliaryAuthenticationCacheKey_, v2);
  }
  uint64_t v4 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v5 = *(void **)(v0 + 136);
  uint64_t v6 = *(void *)(v0 + 144);
  sub_24797F38C();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, *MEMORY[0x263F8F060], v6);
  uint64_t v7 = sub_2479996C0();
  *(void *)(v0 + 168) = v7;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v6);
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 120;
  *(void *)(v0 + 24) = sub_24797B420;
  uint64_t v8 = swift_continuation_init();
  *(void *)(v0 + 80) = MEMORY[0x263EF8330];
  *(void *)(v0 + 88) = 0x40000000;
  *(void *)(v0 + 96) = sub_247978940;
  *(void *)(v0 + 104) = &block_descriptor_12;
  *(void *)(v0 + 112) = v8;
  objc_msgSend(v5, sel_fetchTokenWithQueue_completionHandler_, v7, v0 + 80);
  return MEMORY[0x270FA23F0](v0 + 16);
}

uint64_t sub_24797B8A4(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_24797B8C4, 0, 0);
}

uint64_t sub_24797B8C4()
{
  id v1 = objc_allocWithZone(MEMORY[0x263F58260]);
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_247999320();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_initRSABlindSignatureChallengeWithIssuerName_redemptionNonce_originNames_, v2, 0, 0);
  v0[5] = v3;

  id v4 = objc_msgSend(v3, sel_challengeData);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_2479982F0();
    unint64_t v8 = v7;

    v0[6] = v6;
    v0[7] = v8;
    id v9 = objc_allocWithZone(MEMORY[0x263F58268]);
    sub_2478A06AC(v6, v8);
    uint64_t v10 = (void *)sub_2479982D0();
    id v11 = objc_msgSend(v9, sel_initForKnownIssuerWithChallenge_, v10);
    v0[8] = v11;
    sub_2478A0704(v6, v8);

    objc_msgSend(v11, sel_setSystemClient_, 1);
    os_log_type_t v12 = (void *)swift_task_alloc();
    v0[9] = v12;
    *os_log_type_t v12 = v0;
    v12[1] = sub_24797BB50;
    return sub_24797B1B4((uint64_t)v11);
  }
  else
  {
    if (qword_269266A80 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_247999030();
    __swift_project_value_buffer(v14, (uint64_t)qword_26927FC08);
    uint64_t v15 = sub_247999010();
    os_log_type_t v16 = sub_247999690();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_247896000, v15, v16, "Privacy pass challenge data was empty. This is unexpected.", v17, 2u);
      MEMORY[0x24C564070](v17, -1, -1);
    }

    uint64_t v18 = (uint64_t (*)(void, void, void))v0[1];
    return v18(0, 0, 0);
  }
}

uint64_t sub_24797BB50(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)*v3;
  v4[10] = a1;
  v4[11] = a2;
  v4[12] = v2;
  swift_task_dealloc();
  if (v2) {
    uint64_t v5 = sub_24797F70C;
  }
  else {
    uint64_t v5 = sub_24797F718;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24797BC68()
{
  return MEMORY[0x270FA2498](sub_24797BC84, 0, 0);
}

uint64_t sub_24797BC84()
{
  if (qword_269266AB0 != -1) {
    swift_once();
  }
  sub_24797889C(0, (uint64_t)off_269269180, v0 + 8);
  uint64_t v1 = sub_24797F40C((uint64_t)(v0 + 8), (uint64_t)(v0 + 2));
  if (v0[3])
  {
    uint64_t v4 = v0[4];
    uint64_t v5 = v0[5];
    v0[14] = v5;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v6 = (void *)swift_task_alloc();
    v0[15] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_24797BDB0;
    v6[3] = v4;
    v6[4] = v5;
    uint64_t v1 = (uint64_t)sub_24797B8C4;
    uint64_t v2 = 0;
    uint64_t v3 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](v1, v2, v3);
}

uint64_t sub_24797BDB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)*v3;
  v4[16] = a1;
  v4[17] = a2;
  v4[18] = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24797BED4, 0, 0);
}

uint64_t sub_24797BED4()
{
  uint64_t v1 = (void *)v0[18];
  if (v1)
  {
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_247999030();
    __swift_project_value_buffer(v2, (uint64_t)qword_26927FC68);
    uint64_t v3 = sub_247999010();
    os_log_type_t v4 = sub_247999670();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_247896000, v3, v4, "Anonymous user is not rate limited.", v5, 2u);
      MEMORY[0x24C564070](v5, -1, -1);
    }
    uint64_t v7 = v0[16];
    unint64_t v6 = v0[17];

    sub_2478A06AC(v7, v6);
    uint64_t v8 = v1;
    id v9 = (void *)sub_2479982D0();
    [v8 saveTokenToCache:v9];

    sub_2478A0704(v7, v6);
    sub_2478A0704(v7, v6);
  }
  else
  {
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_247999030();
    __swift_project_value_buffer(v10, (uint64_t)qword_26927FC68);
    uint64_t v8 = sub_247999010();
    os_log_type_t v11 = sub_247999670();
    if (os_log_type_enabled(v8, v11))
    {
      os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v12 = 0;
      _os_log_impl(&dword_247896000, v8, v11, "Anonymous user is rate limited.", v12, 2u);
      MEMORY[0x24C564070](v12, -1, -1);
    }
  }

  BOOL v13 = (uint64_t (*)(BOOL))v0[1];
  return v13(v1 == 0);
}

uint64_t sub_24797C118(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 104) = a3;
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = a2;
  return MEMORY[0x270FA2498](sub_24797C13C, 0, 0);
}

uint64_t sub_24797C13C()
{
  id v1 = objc_allocWithZone(MEMORY[0x263F58260]);
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_247999320();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_initRSABlindSignatureChallengeWithIssuerName_redemptionNonce_originNames_, v2, 0, 0);
  *(void *)(v0 + 40) = v3;

  id v4 = objc_msgSend(v3, sel_challengeData);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_2479982F0();
    unint64_t v8 = v7;

    *(void *)(v0 + 48) = v6;
    *(void *)(v0 + 56) = v8;
    id v9 = objc_allocWithZone(MEMORY[0x263F58268]);
    sub_2478A06AC(v6, v8);
    uint64_t v10 = (void *)sub_2479982D0();
    id v11 = objc_msgSend(v9, sel_initForKnownIssuerWithChallenge_, v10);
    *(void *)(v0 + 64) = v11;
    sub_2478A0704(v6, v8);

    objc_msgSend(v11, sel_setSystemClient_, 1);
    os_log_type_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v12;
    *os_log_type_t v12 = v0;
    v12[1] = sub_24797C3CC;
    char v13 = *(unsigned char *)(v0 + 104);
    return sub_24797B62C((uint64_t)v11, v13);
  }
  else
  {
    if (qword_269266A80 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_247999030();
    __swift_project_value_buffer(v15, (uint64_t)qword_26927FC08);
    os_log_type_t v16 = sub_247999010();
    os_log_type_t v17 = sub_247999690();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_247896000, v16, v17, "Privacy pass challenge data was empty. This is unexpected.", v18, 2u);
      MEMORY[0x24C564070](v18, -1, -1);
    }

    uint64_t v19 = *(uint64_t (**)(void, void, void))(v0 + 8);
    return v19(0, 0, 0);
  }
}

uint64_t sub_24797C3CC(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)*v3;
  v4[10] = a1;
  v4[11] = a2;
  v4[12] = v2;
  swift_task_dealloc();
  if (v2) {
    uint64_t v5 = sub_24797C7C0;
  }
  else {
    uint64_t v5 = sub_24797C4E4;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24797C4E4()
{
  unint64_t v1 = v0[11];
  switch(v1 >> 62)
  {
    case 1uLL:
      uint64_t v10 = v0[10];
      uint64_t v11 = (int)v10;
      uint64_t v12 = v10 >> 32;
      goto LABEL_9;
    case 2uLL:
      uint64_t v13 = v0[10];
      uint64_t v11 = *(void *)(v13 + 16);
      uint64_t v12 = *(void *)(v13 + 24);
LABEL_9:
      if (v11 == v12) {
        goto LABEL_10;
      }
      goto LABEL_3;
    case 3uLL:
      goto LABEL_10;
    default:
      if ((v1 & 0xFF000000000000) != 0)
      {
LABEL_3:
        if (qword_269266A80 != -1) {
          swift_once();
        }
        uint64_t v2 = sub_247999030();
        __swift_project_value_buffer(v2, (uint64_t)qword_26927FC08);
        id v3 = sub_247999010();
        os_log_type_t v4 = sub_247999670();
        BOOL v5 = os_log_type_enabled(v3, v4);
        uint64_t v7 = v0[6];
        unint64_t v6 = v0[7];
        unint64_t v8 = (void *)v0[5];
        if (v5)
        {
          id v9 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v9 = 0;
          _os_log_impl(&dword_247896000, v3, v4, "Successfully retrieved privacy pass token", v9, 2u);
          MEMORY[0x24C564070](v9, -1, -1);

          sub_2478A0704(v7, v6);
        }
        else
        {
          sub_2478A0704(v0[6], v0[7]);
        }
        uint64_t v27 = v0[8];
        uint64_t v25 = v0[10];
        uint64_t v26 = v0[11];
      }
      else
      {
LABEL_10:
        if (qword_269266A80 != -1) {
          swift_once();
        }
        uint64_t v14 = sub_247999030();
        __swift_project_value_buffer(v14, (uint64_t)qword_26927FC08);
        uint64_t v15 = sub_247999010();
        os_log_type_t v16 = sub_247999690();
        BOOL v17 = os_log_type_enabled(v15, v16);
        uint64_t v19 = v0[10];
        unint64_t v18 = v0[11];
        unint64_t v20 = v0[7];
        unint64_t v21 = (void *)v0[8];
        uint64_t v23 = (void *)v0[5];
        uint64_t v22 = v0[6];
        if (v17)
        {
          uint64_t v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v24 = 0;
          _os_log_impl(&dword_247896000, v15, v16, "Attester returned empty data value, treating it as if attester returned nothing.", v24, 2u);
          MEMORY[0x24C564070](v24, -1, -1);

          sub_2478A0704(v19, v18);
          sub_2478A0704(v22, v20);
        }
        else
        {
          sub_2478A0704(v0[6], v0[7]);
          sub_2478A0704(v19, v18);
        }
        uint64_t v25 = 0;
        uint64_t v26 = 0;
        uint64_t v27 = 0;
      }
      uint64_t v28 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v0[1];
      return v28(v25, v26, v27);
  }
}

uint64_t sub_24797C7C0()
{
  if (qword_269266A80 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)v0[12];
  uint64_t v2 = sub_247999030();
  __swift_project_value_buffer(v2, (uint64_t)qword_26927FC08);
  id v3 = v1;
  id v4 = v1;
  BOOL v5 = sub_247999010();
  os_log_type_t v6 = sub_247999690();
  BOOL v7 = os_log_type_enabled(v5, v6);
  unint64_t v8 = (void *)v0[12];
  id v9 = (void *)v0[8];
  uint64_t v10 = (void *)v0[5];
  if (v7)
  {
    unint64_t v18 = (void *)v0[8];
    uint64_t v19 = v0[6];
    unint64_t v20 = v0[7];
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 138412290;
    id v13 = v8;
    BOOL v17 = v10;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v14;
    sub_247999720();
    *uint64_t v12 = v14;

    _os_log_impl(&dword_247896000, v5, v6, "Failed to fetch privacy pass token! %@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269266F40);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v12, -1, -1);
    MEMORY[0x24C564070](v11, -1, -1);

    sub_2478A0704(v19, v20);
  }
  else
  {
    sub_2478A0704(v0[6], v0[7]);
  }
  uint64_t v15 = (uint64_t (*)(void, void, void))v0[1];
  return v15(0, 0, 0);
}

uint64_t sub_24797CA0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[30] = a2;
  v3[31] = a3;
  v3[29] = a1;
  uint64_t v4 = sub_247997FD0();
  v3[32] = v4;
  v3[33] = *(void *)(v4 - 8);
  v3[34] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24797CAD0, 0, 0);
}

uint64_t sub_24797CAD0()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 232) + 16);
  *(void *)(v0 + 280) = v1;
  if (v1)
  {
    uint64_t v2 = qword_269266AB0;
    unint64_t v3 = swift_bridgeObjectRetain();
    if (v2 == -1)
    {
      *(void *)(v0 + 288) = MEMORY[0x263F8EE80];
      *(void *)(v0 + 296) = v1;
      *(void *)(v0 + 304) = 0;
      *(unsigned char *)(v0 + 384) = 0;
    }
    else
    {
      unint64_t v3 = swift_once();
      uint64_t v15 = *(void *)(v0 + 280);
      *(void *)(v0 + 288) = MEMORY[0x263F8EE80];
      *(void *)(v0 + 296) = v15;
      *(void *)(v0 + 304) = 0;
      *(unsigned char *)(v0 + 384) = 0;
      if (!v15)
      {
        __break(1u);
        goto LABEL_14;
      }
    }
    unsigned __int8 v6 = *(unsigned char *)(*(void *)(v0 + 232) + 32);
    *(unsigned char *)(v0 + 385) = v6;
    BOOL v7 = off_269269180;
    if (*((void *)off_269269180 + 2))
    {
      unint64_t v3 = sub_247917F08(v6);
      if (v4)
      {
        unint64_t v8 = (void *)(v7[7] + 48 * v3);
        *(void *)(v0 + 312) = *v8;
        *(void *)(v0 + 320) = v8[1];
        uint64_t v10 = v8[2];
        uint64_t v9 = v8[3];
        *(void *)(v0 + 328) = v9;
        *(void *)(v0 + 336) = v8[4];
        *(void *)(v0 + 344) = v8[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v11 = swift_task_alloc();
        *(void *)(v0 + 352) = v11;
        *(void *)uint64_t v11 = v0;
        *(void *)(v11 + 8) = sub_24797CCD8;
        *(unsigned char *)(v11 + 104) = v6;
        *(void *)(v11 + 24) = v10;
        *(void *)(v11 + 32) = v9;
        unint64_t v3 = (unint64_t)sub_24797C13C;
        uint64_t v4 = 0;
        uint64_t v5 = 0;
        return MEMORY[0x270FA2498](v3, v4, v5);
      }
LABEL_15:
      __break(1u);
      return MEMORY[0x270FA2498](v3, v4, v5);
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  (*(void (**)(void))(v0 + 240))(0);
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v13 = MEMORY[0x263F8EE80];
  return v12(v13);
}

uint64_t sub_24797CCD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)*v3;
  v4[2] = v3;
  v4[3] = a1;
  v4[4] = a2;
  v4[5] = a3;
  v4[45] = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24797CDFC, 0, 0);
}

uint64_t sub_24797CDFC()
{
  uint64_t v55 = v0;
  if (!*(void *)(v0 + 360))
  {
    uint64_t v12 = swift_task_alloc();
    *(void *)(v0 + 368) = v12;
    *(void *)uint64_t v12 = v0;
    *(void *)(v12 + 8) = sub_24797D430;
    uint64_t v14 = *(void *)(v0 + 336);
    uint64_t v13 = *(void *)(v0 + 344);
    *(unsigned char *)(v12 + 104) = *(unsigned char *)(v0 + 385);
    *(void *)(v12 + 24) = v14;
    *(void *)(v12 + 32) = v13;
    goto LABEL_19;
  }
  uint64_t v2 = *(void *)(v0 + 24);
  unint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRelease();
  uint64_t v51 = v2;
  unint64_t v53 = v1;
  sub_2478A06AC(v2, v1);
  unsigned int v52 = *(unsigned __int8 *)(v0 + 384);
  uint64_t v3 = qword_269266AA0;
  uint64_t v49 = *(void **)(v0 + 360);
  id v50 = v49;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_247999030();
  __swift_project_value_buffer(v4, (uint64_t)qword_26927FC68);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_247999010();
  os_log_type_t v6 = sub_247999670();
  BOOL v7 = os_log_type_enabled(v5, v6);
  unint64_t v8 = *(void *)(v0 + 320);
  if (v7)
  {
    uint64_t v9 = *(void *)(v0 + 312);
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v54 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 224) = sub_247918FF0(v9, v8, &v54);
    sub_247999720();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247896000, v5, v6, "Fetched rate limiting token: %s from attester.", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v11, -1, -1);
    MEMORY[0x24C564070](v10, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v45 = *(void *)(v0 + 312);
  uint64_t v46 = *(void *)(v0 + 320);
  uint64_t v15 = *(void *)(v0 + 272);
  uint64_t v16 = *(void *)(v0 + 264);
  uint64_t v43 = *(void *)(v0 + 256);
  uint64_t v44 = *(void *)(v0 + 288);
  uint64_t v47 = *(void *)(v0 + 304) + 1;
  uint64_t v48 = *(void *)(v0 + 280);
  *(void *)(v0 + 80) = sub_2479982E0();
  *(void *)(v0 + 88) = v17;
  *(void *)(v0 + 96) = 43;
  *(void *)(v0 + 104) = 0xE100000000000000;
  *(void *)(v0 + 112) = 45;
  *(void *)(v0 + 120) = 0xE100000000000000;
  sub_2478A3014();
  uint64_t v18 = sub_247999750();
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 128) = v18;
  *(void *)(v0 + 136) = v20;
  *(void *)(v0 + 144) = 47;
  *(void *)(v0 + 152) = 0xE100000000000000;
  *(void *)(v0 + 160) = 95;
  *(void *)(v0 + 168) = 0xE100000000000000;
  uint64_t v21 = sub_247999750();
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 176) = v21;
  *(void *)(v0 + 184) = v23;
  sub_247997FC0();
  sub_247999740();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v43);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 208) = 0;
  *(void *)(v0 + 216) = 0xE000000000000000;
  sub_247999800();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 192) = 0xD000000000000013;
  *(void *)(v0 + 200) = 0x80000002479A5510;
  sub_2479993D0();
  swift_bridgeObjectRelease();
  uint64_t v24 = *(void *)(v0 + 192);
  uint64_t v25 = *(void *)(v0 + 200);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v54 = v44;
  sub_24791D0E4(v24, v25, v45, v46, isUniquelyReferenced_nonNull_native);
  uint64_t v27 = v54;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24797F3CC(v51, v53, v49);
  sub_2478A0704(v51, v53);

  if (v47 != v48)
  {
    uint64_t v33 = *(void *)(v0 + 304);
    uint64_t v34 = v33 + 1;
    unint64_t v35 = *(void *)(v0 + 280);
    *(unsigned char *)(v0 + 384) = v52;
    if (v33 + 1 > v35) {
      unint64_t v36 = v33 + 1;
    }
    else {
      unint64_t v36 = v35;
    }
    *(void *)(v0 + 288) = v27;
    *(void *)(v0 + 296) = v36;
    *(void *)(v0 + 304) = v34;
    if (v33 + 1 >= v35)
    {
      __break(1u);
    }
    else
    {
      unsigned __int8 v37 = *(unsigned char *)(*(void *)(v0 + 232) + v34 + 32);
      *(unsigned char *)(v0 + 385) = v37;
      uint64_t v38 = off_269269180;
      if (*((void *)off_269269180 + 2))
      {
        unint64_t v28 = sub_247917F08(v37);
        if (v29)
        {
          uint64_t v39 = (void *)(v38[7] + 48 * v28);
          *(void *)(v0 + 312) = *v39;
          *(void *)(v0 + 320) = v39[1];
          uint64_t v41 = v39[2];
          uint64_t v40 = v39[3];
          *(void *)(v0 + 328) = v40;
          *(void *)(v0 + 336) = v39[4];
          *(void *)(v0 + 344) = v39[5];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v42 = swift_task_alloc();
          *(void *)(v0 + 352) = v42;
          *(void *)uint64_t v42 = v0;
          *(void *)(v42 + 8) = sub_24797CCD8;
          *(unsigned char *)(v42 + 104) = v37;
          *(void *)(v42 + 24) = v41;
          *(void *)(v42 + 32) = v40;
LABEL_19:
          unint64_t v28 = (unint64_t)sub_24797C13C;
          uint64_t v29 = 0;
          uint64_t v30 = 0;
          return MEMORY[0x270FA2498](v28, v29, v30);
        }
LABEL_24:
        __break(1u);
        return MEMORY[0x270FA2498](v28, v29, v30);
      }
    }
    __break(1u);
    goto LABEL_24;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(void))(v0 + 240))(v52);
  swift_task_dealloc();
  uint64_t v31 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v31(v27);
}

uint64_t sub_24797D430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)*v3;
  v4[6] = v3;
  v4[7] = a1;
  v4[8] = a2;
  v4[9] = a3;
  v4[47] = a3;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24797D554, 0, 0);
}

uint64_t sub_24797D554()
{
  uint64_t v55 = v0;
  if (!*(void *)(v0 + 376))
  {
    if (qword_269266AA0 == -1) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
  uint64_t v52 = *(void *)(v0 + 56);
  unint64_t v53 = *(void *)(v0 + 64);
  sub_2478A06AC(v52, v53);
  uint64_t v1 = qword_269266AA0;
  id v50 = *(void **)(v0 + 376);
  id v51 = v50;
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_247999030();
  __swift_project_value_buffer(v2, (uint64_t)qword_26927FC68);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_247999010();
  os_log_type_t v4 = sub_247999670();
  BOOL v5 = os_log_type_enabled(v3, v4);
  unint64_t v6 = *(void *)(v0 + 320);
  if (v5)
  {
    uint64_t v7 = *(void *)(v0 + 312);
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    v54[0] = v9;
    *(_DWORD *)unint64_t v8 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 224) = sub_247918FF0(v7, v6, v54);
    sub_247999720();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247896000, v3, v4, "Fetched rate limiting token: %s from attester.", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v9, -1, -1);
    MEMORY[0x24C564070](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v46 = *(void *)(v0 + 312);
  uint64_t v47 = *(void *)(v0 + 320);
  uint64_t v18 = *(void *)(v0 + 272);
  uint64_t v19 = *(void *)(v0 + 264);
  uint64_t v44 = *(void *)(v0 + 256);
  uint64_t v45 = *(void *)(v0 + 288);
  uint64_t v48 = *(void *)(v0 + 304) + 1;
  uint64_t v49 = *(void *)(v0 + 280);
  *(void *)(v0 + 80) = sub_2479982E0();
  *(void *)(v0 + 88) = v20;
  *(void *)(v0 + 96) = 43;
  *(void *)(v0 + 104) = 0xE100000000000000;
  *(void *)(v0 + 112) = 45;
  *(void *)(v0 + 120) = 0xE100000000000000;
  sub_2478A3014();
  uint64_t v21 = sub_247999750();
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 128) = v21;
  *(void *)(v0 + 136) = v23;
  *(void *)(v0 + 144) = 47;
  *(void *)(v0 + 152) = 0xE100000000000000;
  *(void *)(v0 + 160) = 95;
  *(void *)(v0 + 168) = 0xE100000000000000;
  uint64_t v24 = sub_247999750();
  uint64_t v26 = v25;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 176) = v24;
  *(void *)(v0 + 184) = v26;
  sub_247997FC0();
  sub_247999740();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v44);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 208) = 0;
  *(void *)(v0 + 216) = 0xE000000000000000;
  sub_247999800();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 192) = 0xD000000000000013;
  *(void *)(v0 + 200) = 0x80000002479A5510;
  sub_2479993D0();
  swift_bridgeObjectRelease();
  uint64_t v27 = *(void *)(v0 + 192);
  uint64_t v28 = *(void *)(v0 + 200);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v54[0] = v45;
  sub_24791D0E4(v27, v28, v46, v47, isUniquelyReferenced_nonNull_native);
  uint64_t v30 = v54[0];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24797F3CC(v52, v53, v50);
  sub_2478A0704(v52, v53);

  if (v48 != v49)
  {
    uint64_t v31 = *(void *)(v0 + 304);
    uint64_t v32 = v31 + 1;
    if ((unint64_t)(v31 + 1) > *(void *)(v0 + 280)) {
      uint64_t v33 = v31 + 1;
    }
    else {
      uint64_t v33 = *(void *)(v0 + 280);
    }
    *(void *)(v0 + 288) = v30;
    for (*(void *)(v0 + 296) = v33; ; uint64_t v33 = *(void *)(v0 + 296))
    {
      *(void *)(v0 + 304) = v32;
      *(unsigned char *)(v0 + 384) = 1;
      if (v32 == v33) {
        break;
      }
      unsigned __int8 v36 = *(unsigned char *)(*(void *)(v0 + 232) + v32 + 32);
      *(unsigned char *)(v0 + 385) = v36;
      unsigned __int8 v37 = off_269269180;
      if (!*((void *)off_269269180 + 2)) {
        goto LABEL_29;
      }
      unint64_t v38 = sub_247917F08(v36);
      if (v39)
      {
        uint64_t v40 = (void *)(v37[7] + 48 * v38);
        *(void *)(v0 + 312) = *v40;
        *(void *)(v0 + 320) = v40[1];
        uint64_t v42 = v40[2];
        uint64_t v41 = v40[3];
        *(void *)(v0 + 328) = v41;
        *(void *)(v0 + 336) = v40[4];
        *(void *)(v0 + 344) = v40[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v43 = swift_task_alloc();
        *(void *)(v0 + 352) = v43;
        *(void *)uint64_t v43 = v0;
        *(void *)(v43 + 8) = sub_24797CCD8;
        *(unsigned char *)(v43 + 104) = v36;
        *(void *)(v43 + 24) = v42;
        *(void *)(v43 + 32) = v41;
        return MEMORY[0x270FA2498](sub_24797C13C, 0, 0);
      }
LABEL_30:
      __break(1u);
LABEL_31:
      swift_once();
LABEL_7:
      uint64_t v10 = sub_247999030();
      __swift_project_value_buffer(v10, (uint64_t)qword_26927FC68);
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_247999010();
      os_log_type_t v12 = sub_247999690();
      BOOL v13 = os_log_type_enabled(v11, v12);
      unint64_t v14 = *(void *)(v0 + 320);
      if (v13)
      {
        uint64_t v15 = *(void *)(v0 + 312);
        uint64_t v16 = swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        v54[0] = v17;
        *(_DWORD *)uint64_t v16 = 136315138;
        swift_bridgeObjectRetain();
        *(void *)(v16 + 4) = sub_247918FF0(v15, v14, v54);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_247896000, v11, v12, "Unable to fetch rate limiting token %s from attester. High chance of inference failure.", (uint8_t *)v16, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C564070](v17, -1, -1);
        MEMORY[0x24C564070](v16, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      uint64_t v32 = *(void *)(v0 + 304) + 1;
      if (v32 == *(void *)(v0 + 280))
      {
        uint64_t v30 = *(void *)(v0 + 288);
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
LABEL_18:
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(v0 + 240))(1);
  swift_task_dealloc();
  uint64_t v34 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v34(v30);
}

uint64_t sub_24797DC80(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_24797DCA0, 0, 0);
}

uint64_t sub_24797DCA0()
{
  id v1 = objc_allocWithZone(MEMORY[0x263F58260]);
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_247999320();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_initRSABlindSignatureChallengeWithIssuerName_redemptionNonce_originNames_, v2, 0, 0);
  v0[5] = v3;

  id v4 = objc_msgSend(v3, sel_challengeData);
  if (v4)
  {
    BOOL v5 = v4;
    uint64_t v6 = sub_2479982F0();
    unint64_t v8 = v7;

    v0[6] = v6;
    v0[7] = v8;
    id v9 = objc_allocWithZone(MEMORY[0x263F58268]);
    sub_2478A06AC(v6, v8);
    uint64_t v10 = (void *)sub_2479982D0();
    id v11 = objc_msgSend(v9, sel_initForKnownIssuerWithChallenge_, v10);
    v0[8] = v11;
    sub_2478A0704(v6, v8);

    objc_msgSend(v11, sel_setSystemClient_, 1);
    os_log_type_t v12 = (void *)swift_task_alloc();
    v0[9] = v12;
    *os_log_type_t v12 = v0;
    v12[1] = sub_24797BB50;
    return sub_24797AE70((uint64_t)v11);
  }
  else
  {
    if (qword_269266A80 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_247999030();
    __swift_project_value_buffer(v14, (uint64_t)qword_26927FC08);
    uint64_t v15 = sub_247999010();
    os_log_type_t v16 = sub_247999690();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_247896000, v15, v16, "Privacy pass challenge data was empty. This is unexpected.", v17, 2u);
      MEMORY[0x24C564070](v17, -1, -1);
    }

    uint64_t v18 = (uint64_t (*)(void, void, void))v0[1];
    return v18(0, 0, 0);
  }
}

uint64_t sub_24797DF2C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  *(void *)(v4 + 280) = a2;
  *(void *)(v4 + 288) = a4;
  *(unsigned char *)(v4 + 368) = a3;
  *(void *)(v4 + 272) = a1;
  uint64_t v5 = sub_247999070();
  *(void *)(v4 + 296) = v5;
  *(void *)(v4 + 304) = *(void *)(v5 - 8);
  *(void *)(v4 + 312) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24797DFF4, 0, 0);
}

uint64_t sub_24797DFF4()
{
  uint64_t v50 = v0;
  uint64_t v1 = 0xD000000000000010;
  uint64_t v2 = 0xD00000000000001ELL;
  unint64_t v3 = 0x80000002479A75E0;
  switch(*(unsigned char *)(v0 + 368))
  {
    case 1:
      uint64_t v2 = 0xD00000000000001DLL;
      uint64_t v4 = "Token-Request-Image-Generator";
      goto LABEL_5;
    case 2:
      goto LABEL_6;
    case 3:
      uint64_t v2 = 0xD000000000000019;
      uint64_t v4 = "Token-Request-File-Upload";
      goto LABEL_5;
    default:
      uint64_t v2 = 0xD00000000000001ELL;
      uint64_t v4 = "Token-Request-Session-Response";
LABEL_5:
      unint64_t v3 = (unint64_t)(v4 - 32) | 0x8000000000000000;
LABEL_6:
      if (!*(void *)(*(void *)(v0 + 288) + 16) || (unint64_t v5 = sub_247917D8C(v2, v3), (v6 & 1) == 0))
      {
        swift_bridgeObjectRelease();
        if (qword_269266AA0 != -1) {
          swift_once();
        }
        uint64_t v23 = sub_247999030();
        __swift_project_value_buffer(v23, (uint64_t)qword_26927FC68);
        uint64_t v19 = sub_247999010();
        os_log_type_t v24 = sub_2479996A0();
        if (os_log_type_enabled(v19, v24))
        {
          uint64_t v25 = *(unsigned __int8 *)(v0 + 368);
          uint64_t v26 = (uint8_t *)swift_slowAlloc();
          uint64_t v27 = swift_slowAlloc();
          uint64_t v49 = v27;
          *(_DWORD *)uint64_t v26 = 136315138;
          unint64_t v28 = 0x80000002479A4B00;
          uint64_t v29 = v27;
          switch(v25)
          {
            case 1:
              uint64_t v1 = 0x65675F6567616D69;
              unint64_t v28 = 0xEF726F746172656ELL;
              break;
            case 2:
              unint64_t v28 = 0x80000002479A4B30;
              break;
            case 3:
              uint64_t v1 = 0x6C70755F656C6966;
              unint64_t v28 = 0xEB0000000064616FLL;
              break;
            default:
              break;
          }
          *(void *)(v0 + 232) = sub_247918FF0(v1, v28, &v49);
          sub_247999720();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_247896000, v19, v24, "Unable to obtain original issuer for: %s. Redemption will fail. This should never happen. Please file a radar. Future inference will most likely fail.", v26, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C564070](v29, -1, -1);
          MEMORY[0x24C564070](v26, -1, -1);
        }
        goto LABEL_37;
      }
      unint64_t v7 = *(void *)(v0 + 280);
      uint64_t v8 = *(void *)(v0 + 272);
      id v9 = *(void **)(*(void *)(*(void *)(v0 + 288) + 56) + 8 * v5);
      *(void *)(v0 + 320) = v9;
      id v48 = v9;
      swift_bridgeObjectRelease();
      uint64_t v10 = HIBYTE(v7) & 0xF;
      if ((v7 & 0x2000000000000000) == 0) {
        uint64_t v10 = v8 & 0xFFFFFFFFFFFFLL;
      }
      if (!v10)
      {
        if (qword_269266AA0 != -1) {
          swift_once();
        }
        uint64_t v30 = sub_247999030();
        __swift_project_value_buffer(v30, (uint64_t)qword_26927FC68);
        uint64_t v19 = sub_247999010();
        os_log_type_t v31 = sub_247999690();
        if (!os_log_type_enabled(v19, v31)) {
          goto LABEL_36;
        }
        uint64_t v32 = *(unsigned __int8 *)(v0 + 368);
        uint64_t v33 = (uint8_t *)swift_slowAlloc();
        uint64_t v34 = swift_slowAlloc();
        uint64_t v49 = v34;
        *(_DWORD *)uint64_t v33 = 136315138;
        unint64_t v35 = 0x80000002479A4B00;
        uint64_t v36 = v34;
        switch(v32)
        {
          case 1:
            uint64_t v1 = 0x65675F6567616D69;
            unint64_t v35 = 0xEF726F746172656ELL;
            break;
          case 2:
            unint64_t v35 = 0x80000002479A4B30;
            break;
          case 3:
            uint64_t v1 = 0x6C70755F656C6966;
            unint64_t v35 = 0xEB0000000064616FLL;
            break;
          default:
            break;
        }
        *(void *)(v0 + 264) = sub_247918FF0(v1, v35, &v49);
        sub_247999720();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247896000, v19, v31, "Origin unexpectedly returned empty refund for key: %s", v33, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C564070](v36, -1, -1);
        uint64_t v22 = v33;
        goto LABEL_35;
      }
      uint64_t v11 = *(void *)(v0 + 280);
      *(void *)(v0 + 200) = *(void *)(v0 + 272);
      *(void *)(v0 + 208) = v11;
      *(void *)(v0 + 120) = 45;
      *(void *)(v0 + 128) = 0xE100000000000000;
      *(void *)(v0 + 136) = 43;
      *(void *)(v0 + 144) = 0xE100000000000000;
      unint64_t v12 = sub_2478A3014();
      uint64_t v13 = MEMORY[0x263F8D310];
      *(void *)(v0 + 216) = sub_247999750();
      *(void *)(v0 + 224) = v14;
      *(void *)(v0 + 168) = 95;
      *(void *)(v0 + 176) = 0xE100000000000000;
      *(void *)(v0 + 184) = 47;
      *(void *)(v0 + 192) = 0xE100000000000000;
      unint64_t v46 = v12;
      unint64_t v47 = v12;
      unint64_t v45 = v12;
      sub_247999750();
      swift_bridgeObjectRelease();
      uint64_t v15 = sub_247998280();
      unint64_t v17 = v16;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 328) = v15;
      *(void *)(v0 + 336) = v17;
      if (v17 >> 60 == 15)
      {
        if (qword_269266AA0 != -1) {
          swift_once();
        }
        uint64_t v18 = sub_247999030();
        __swift_project_value_buffer(v18, (uint64_t)qword_26927FC68);
        uint64_t v19 = sub_247999010();
        os_log_type_t v20 = sub_247999690();
        if (!os_log_type_enabled(v19, v20)) {
          goto LABEL_36;
        }
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_247896000, v19, v20, "Unable to get base64 data from OAI response. Refund tickets from OAI seem malformed. Future inference likely to fail.", v21, 2u);
        uint64_t v22 = v21;
LABEL_35:
        MEMORY[0x24C564070](v22, -1, -1);
LABEL_36:

LABEL_37:
        swift_task_dealloc();
        uint64_t v43 = *(uint64_t (**)(void))(v0 + 8);
        return v43();
      }
      uint64_t v38 = *(void *)(v0 + 304);
      uint64_t v37 = *(void *)(v0 + 312);
      uint64_t v39 = *(void *)(v0 + 296);
      uint64_t v40 = sub_2479982D0();
      *(void *)(v0 + 344) = v40;
      sub_24797F38C();
      (*(void (**)(uint64_t, void, uint64_t))(v38 + 104))(v37, *MEMORY[0x263F8F060], v39);
      uint64_t v41 = sub_2479996C0();
      *(void *)(v0 + 352) = v41;
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 56) = v0 + 152;
      *(void *)(v0 + 24) = sub_24797E7FC;
      uint64_t v42 = swift_continuation_init();
      *(void *)(v0 + 80) = MEMORY[0x263EF8330];
      *(void *)(v0 + 88) = 0x40000000;
      *(void *)(v0 + 96) = sub_247978940;
      *(void *)(v0 + 104) = &block_descriptor;
      *(void *)(v0 + 112) = v42;
      objc_msgSend(v48, sel_handleTokenResponse_withQueue_completionHandler_, v40, v41, v0 + 80, v13, v45, v46, v47);
      return MEMORY[0x270FA23F0](v0 + 16);
  }
}

uint64_t sub_24797E7FC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 360) = v1;
  if (v1) {
    uint64_t v2 = sub_24797EBF0;
  }
  else {
    uint64_t v2 = sub_24797E90C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24797E90C()
{
  uint64_t v22 = v0;
  uint64_t v1 = *(void **)(v0 + 344);
  uint64_t v2 = *(void **)(v0 + 320);
  uint64_t v4 = *(void *)(v0 + 152);
  unint64_t v3 = *(void *)(v0 + 160);

  unint64_t v5 = (void *)sub_2479982D0();
  objc_msgSend(v2, sel_saveTokenToCache_, v5);

  if (qword_269266AA0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_247999030();
  __swift_project_value_buffer(v6, (uint64_t)qword_26927FC68);
  unint64_t v7 = sub_247999010();
  os_log_type_t v8 = sub_247999670();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = 0xD000000000000010;
    uint64_t v10 = *(unsigned __int8 *)(v0 + 368);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v21 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    unint64_t v13 = 0x80000002479A4B00;
    uint64_t v14 = v12;
    switch(v10)
    {
      case 1:
        unint64_t v13 = 0xEF726F746172656ELL;
        uint64_t v9 = 0x65675F6567616D69;
        break;
      case 2:
        unint64_t v13 = 0x80000002479A4B30;
        break;
      case 3:
        unint64_t v13 = 0xEB0000000064616FLL;
        uint64_t v9 = 0x6C70755F656C6966;
        break;
      default:
        break;
    }
    uint64_t v18 = *(void *)(v0 + 328);
    unint64_t v19 = *(void *)(v0 + 336);
    os_log_type_t v20 = *(void **)(v0 + 320);
    *(void *)(v0 + 256) = sub_247918FF0(v9, v13, &v21);
    sub_247999720();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247896000, v7, v8, "Successfully saved refund to cache for key: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v14, -1, -1);
    MEMORY[0x24C564070](v11, -1, -1);
    sub_2478A1BBC(v18, v19);
    sub_2478A0704(v4, v3);
  }
  else
  {
    uint64_t v15 = *(void **)(v0 + 320);
    sub_2478A1BBC(*(void *)(v0 + 328), *(void *)(v0 + 336));
    sub_2478A0704(v4, v3);
  }
  swift_task_dealloc();
  unint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_24797EBF0()
{
  uint64_t v26 = v0;
  uint64_t v1 = *(void **)(v0 + 352);
  unint64_t v2 = *(void *)(v0 + 336);
  unint64_t v3 = *(void **)(v0 + 344);
  uint64_t v4 = *(void *)(v0 + 328);
  swift_willThrow();
  sub_2478A1BBC(v4, v2);

  if (qword_269266AA0 != -1) {
    swift_once();
  }
  unint64_t v5 = *(void **)(v0 + 360);
  uint64_t v6 = sub_247999030();
  __swift_project_value_buffer(v6, (uint64_t)qword_26927FC68);
  id v7 = v5;
  id v8 = v5;
  uint64_t v9 = sub_247999010();
  os_log_type_t v10 = sub_247999690();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = 0xD000000000000010;
    uint64_t v12 = *(unsigned __int8 *)(v0 + 368);
    uint64_t v13 = swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v25 = v15;
    *(_DWORD *)uint64_t v13 = 136315394;
    unint64_t v16 = 0x80000002479A4B00;
    uint64_t v17 = v15;
    switch(v12)
    {
      case 1:
        unint64_t v16 = 0xEF726F746172656ELL;
        uint64_t v11 = 0x65675F6567616D69;
        break;
      case 2:
        unint64_t v16 = 0x80000002479A4B30;
        break;
      case 3:
        unint64_t v16 = 0xEB0000000064616FLL;
        uint64_t v11 = 0x6C70755F656C6966;
        break;
      default:
        break;
    }
    unint64_t v19 = *(void **)(v0 + 360);
    os_log_type_t v24 = *(void **)(v0 + 320);
    *(void *)(v0 + 240) = sub_247918FF0(v11, v16, &v25);
    sub_247999720();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2112;
    id v20 = v19;
    uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 248) = v21;
    sub_247999720();
    *uint64_t v14 = v21;

    _os_log_impl(&dword_247896000, v9, v10, "Unable to save refund to cache for key: %s with error: %@", (uint8_t *)v13, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269266F40);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v14, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v17, -1, -1);
    MEMORY[0x24C564070](v13, -1, -1);
  }
  else
  {
    uint64_t v18 = *(void **)(v0 + 360);
  }
  swift_task_dealloc();
  uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

uint64_t sub_24797EF60(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return MEMORY[0x270FA2498](sub_24797EF80, 0, 0);
}

uint64_t sub_24797EF80()
{
  uint64_t v2 = v0[8];
  unint64_t v1 = v0[9];
  uint64_t v3 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0) {
    uint64_t v3 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v3)
  {
    v0[2] = v2;
    v0[3] = v1;
    v0[4] = 45;
    v0[5] = 0xE100000000000000;
    v0[6] = 43;
    v0[7] = 0xE100000000000000;
    unint64_t v4 = sub_2478A3014();
    uint64_t v5 = MEMORY[0x263F8D310];
    v0[2] = sub_247999750();
    v0[3] = v6;
    v0[4] = 95;
    v0[5] = 0xE100000000000000;
    v0[6] = 47;
    v0[7] = 0xE100000000000000;
    unint64_t v27 = v4;
    unint64_t v28 = v4;
    uint64_t v25 = v5;
    unint64_t v26 = v4;
    sub_247999750();
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_247998280();
    unint64_t v9 = v8;
    swift_bridgeObjectRelease();
    if (v9 >> 60 == 15)
    {
      if (qword_269266AA0 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_247999030();
      __swift_project_value_buffer(v10, (uint64_t)qword_26927FC68);
      uint64_t v11 = sub_247999010();
      os_log_type_t v12 = sub_247999690();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v13 = 0;
        uint64_t v14 = "Unable to get base64 data from OAI response. Reputation signal from OAI seems malformed. Future inference likely to fail.";
LABEL_13:
        _os_log_impl(&dword_247896000, v11, v12, v14, v13, 2u);
        MEMORY[0x24C564070](v13, -1, -1);
      }
    }
    else
    {
      unint64_t v16 = self;
      uint64_t v17 = (void *)sub_2479982D0();
      uint64_t v18 = (void *)sub_247999320();
      unint64_t v19 = (void *)sub_247999320();
      objc_msgSend(v16, sel_saveAuxiliaryAuthenticationDataToCache_type_forLabel_cacheKey_, v17, 1, v18, v19, v25, v26, v27, v28);

      if (qword_269266AA0 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_247999030();
      __swift_project_value_buffer(v20, (uint64_t)qword_26927FC68);
      uint64_t v11 = sub_247999010();
      os_log_type_t v21 = sub_247999670();
      if (os_log_type_enabled(v11, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl(&dword_247896000, v11, v21, "Successfully stored the reputation signal.", v22, 2u);
        MEMORY[0x24C564070](v22, -1, -1);
      }
      sub_2478A1BBC(v7, v9);
    }
  }
  else
  {
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_247999030();
    __swift_project_value_buffer(v15, (uint64_t)qword_26927FC68);
    uint64_t v11 = sub_247999010();
    os_log_type_t v12 = sub_247999690();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      uint64_t v14 = "Origin returned empty reputation signal";
      goto LABEL_13;
    }
  }

  uint64_t v23 = (uint64_t (*)(void))v0[1];
  return v23();
}

unint64_t sub_24797F38C()
{
  unint64_t result = qword_269266D00;
  if (!qword_269266D00)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269266D00);
  }
  return result;
}

void sub_24797F3CC(uint64_t a1, unint64_t a2, void *a3)
{
  if (a3)
  {
    sub_2478A0704(a1, a2);
  }
}

uint64_t sub_24797F40C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692691F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t destroy for FraudTicketing()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t _s5Anvil14FraudTicketingVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for FraudTicketing(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for FraudTicketing(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for FraudTicketing()
{
  return &type metadata for FraudTicketing;
}

unsigned char *storeEnumTagSinglePayload for FraudTicketing.TicketingTypes(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24797F67CLL);
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

ValueMetadata *type metadata accessor for FraudTicketing.TicketingTypes()
{
  return &type metadata for FraudTicketing.TicketingTypes;
}

unint64_t sub_24797F6B8()
{
  unint64_t result = qword_269269208;
  if (!qword_269269208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269269208);
  }
  return result;
}

uint64_t sub_24797F71C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v9 + 160) = v17;
  *(void *)(v9 + 168) = v8;
  *(void *)(v9 + 152) = v16;
  *(_OWORD *)(v9 + 136) = v15;
  *(_OWORD *)(v9 + 120) = v14;
  *(_OWORD *)(v9 + 104) = v13;
  *(void *)(v9 + 88) = a7;
  *(void *)(v9 + 96) = a8;
  *(void *)(v9 + 72) = a5;
  *(void *)(v9 + 80) = a6;
  *(void *)(v9 + 56) = a3;
  *(void *)(v9 + 64) = a4;
  *(void *)(v9 + 40) = a1;
  *(void *)(v9 + 48) = a2;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F58);
  *(void *)(v9 + 176) = v10;
  *(void *)(v9 + 184) = *(void *)(v10 - 8);
  *(void *)(v9 + 192) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24797F810, 0, 0);
}

uint64_t sub_24797F810()
{
  uint64_t v35 = v0;
  if (qword_269266A78 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_247999030();
  *(void *)(v0 + 200) = __swift_project_value_buffer(v1, (uint64_t)qword_26927FBF0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_247999010();
  os_log_type_t v3 = sub_2479996B0();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = *(void *)(v0 + 88);
  if (v4)
  {
    uint64_t v33 = *(void *)(v0 + 80);
    unint64_t v6 = *(void *)(v0 + 56);
    uint64_t v30 = *(void *)(v0 + 48);
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v34 = v8;
    *(_DWORD *)uint64_t v7 = 136315650;
    *(void *)(v0 + 16) = sub_247918FF0(0xD000000000000084, 0x80000002479A7920, &v34);
    sub_247999720();
    *(_WORD *)(v7 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 24) = sub_247918FF0(v30, v6, &v34);
    sub_247999720();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 22) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 32) = sub_247918FF0(v33, v5, &v34);
    sub_247999720();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247896000, v2, v3, "%s\n  useCaseID:%s\n  sessionID:%s", (uint8_t *)v7, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v8, -1, -1);
    MEMORY[0x24C564070](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  uint64_t v9 = sub_247999010();
  os_log_type_t v10 = sub_2479996B0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_247896000, v9, v10, "#tokenperf: Starting one-shot complete prompt request (implementation relies on streaming)", v11, 2u);
    MEMORY[0x24C564070](v11, -1, -1);
  }
  uint64_t v12 = *(void *)(v0 + 192);
  long long v13 = *(char **)(v0 + 160);
  long long v29 = *(_OWORD *)(v0 + 128);
  long long v31 = *(_OWORD *)(v0 + 144);
  long long v28 = *(_OWORD *)(v0 + 112);
  uint64_t v14 = *(void *)(v0 + 96);
  unint64_t v32 = *(void *)(v0 + 104);
  uint64_t v16 = *(void *)(v0 + 80);
  unint64_t v15 = *(void *)(v0 + 88);
  uint64_t v18 = *(void *)(v0 + 64);
  uint64_t v17 = *(void *)(v0 + 72);
  unint64_t v19 = v9;
  uint64_t v20 = *(void *)(v0 + 48);
  unint64_t v21 = *(void *)(v0 + 56);

  sub_24798F824(v20, v21, v18, v17, v16, v15, v14, v32, v12, v28, *((uint64_t *)&v28 + 1), v29, *((uint64_t *)&v29 + 1), v31, *((uint64_t *)&v31 + 1), v13);
  uint64_t v22 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v22;
  uint64_t v23 = sub_247989568(&qword_269269330, &qword_269268F58);
  void *v22 = v0;
  v22[1] = sub_24797FBF8;
  uint64_t v24 = *(void *)(v0 + 192);
  uint64_t v25 = *(void *)(v0 + 176);
  uint64_t v26 = *(void *)(v0 + 40);
  return MEMORY[0x270F7ED70](v26, v24, v25, v23);
}

uint64_t sub_24797FBF8()
{
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24797FE08;
  }
  else {
    uint64_t v2 = sub_24797FD0C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24797FD0C()
{
  uint64_t v1 = sub_247999010();
  os_log_type_t v2 = sub_2479996B0();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v3 = 0;
    _os_log_impl(&dword_247896000, v1, v2, "#tokenperf: Finished one-shot complete prompt request", v3, 2u);
    MEMORY[0x24C564070](v3, -1, -1);
  }
  uint64_t v5 = v0[23];
  uint64_t v4 = v0[24];
  uint64_t v6 = v0[22];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24797FE08()
{
  (*(void (**)(void, void))(v0[23] + 8))(v0[24], v0[22]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24797FE88@<X0>(uint64_t a1@<X8>)
{
  os_log_type_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(qword_269269240);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  os_log_type_t v10 = (char *)&v21 - v9;
  uint64_t v11 = (uint64_t)v2 + OBJC_IVAR____TtC5Anvil28BlackPowderInferenceProvider____lazy_storage___handler;
  swift_beginAccess();
  sub_2478E6A48(v11, (uint64_t)v10, qword_269269240);
  uint64_t v12 = sub_2479987B0();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a1, v10, v12);
  }
  sub_2478A1A1C((uint64_t)v10, qword_269269240);
  uint64_t v31 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269290);
  uint64_t v14 = sub_247999390();
  uint64_t v29 = v15;
  uint64_t v30 = v14;
  swift_unownedRetainStrong();
  swift_unownedRetain();
  swift_unownedRetain();
  swift_release();
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = v2;
  swift_unownedRetainStrong();
  swift_unownedRetain();
  swift_unownedRetain();
  swift_release();
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v2;
  swift_unownedRetainStrong();
  swift_unownedRetain();
  swift_unownedRetain();
  swift_release();
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = v2;
  swift_unownedRetainStrong();
  swift_unownedRetain();
  swift_release();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v2;
  swift_unownedRetainStrong();
  swift_unownedRetain();
  swift_release();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v2;
  swift_unownedRetainStrong();
  swift_unownedRetain();
  swift_release();
  *(void *)(swift_allocObject() + 16) = v2;
  swift_unownedRetainStrong();
  swift_unownedRetain();
  swift_unownedRetain();
  swift_release();
  uint64_t v16 = swift_allocObject();
  uint64_t v23 = v12;
  *(void *)(v16 + 16) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692692D8);
  uint64_t v17 = (uint64_t)v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D0);
  uint64_t v24 = v11;
  sub_247989568(&qword_2692692E0, &qword_2692692D8);
  sub_247989568(&qword_2692692E8, &qword_2692687D0);
  sub_2479987A0();
  swift_unownedRelease();
  swift_unownedRelease();
  swift_unownedRelease();
  swift_unownedRelease();
  uint64_t v18 = v23;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v17, a1, v23);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(v17, 0, 1, v18);
  uint64_t v19 = v24;
  swift_beginAccess();
  sub_247989428(v17, v19);
  return swift_endAccess();
}

uint64_t sub_247980330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_247980354, 0, 0);
}

uint64_t sub_247980354()
{
  uint64_t v1 = v0[5];
  swift_unownedRetainStrong();
  v0[6] = *(void *)(v1 + 16);
  swift_retain();
  swift_release();
  os_log_type_t v2 = (void *)swift_task_alloc();
  v0[7] = v2;
  *os_log_type_t v2 = v0;
  v2[1] = sub_247980414;
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[2];
  return sub_247980550(v5, v3, v4);
}

uint64_t sub_247980414()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24798988C, 0, 0);
  }
  else
  {
    swift_release();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_247980550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692692F8);
  v3[6] = swift_task_alloc();
  uint64_t v4 = sub_247998AC0();
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = swift_task_alloc();
  uint64_t v5 = sub_247998400();
  v3[10] = v5;
  v3[11] = *(void *)(v5 - 8);
  v3[12] = swift_task_alloc();
  uint64_t v6 = sub_247998BB0();
  v3[13] = v6;
  v3[14] = *(void *)(v6 - 8);
  v3[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2479806FC, 0, 0);
}

uint64_t sub_2479806FC()
{
  uint64_t v29 = v0;
  if (qword_269266A78 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[13];
  uint64_t v4 = v0[5];
  uint64_t v5 = sub_247999030();
  __swift_project_value_buffer(v5, (uint64_t)qword_26927FBF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v6 = sub_247999010();
  os_log_type_t v7 = sub_2479996B0();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[14];
  uint64_t v10 = v0[15];
  if (v8)
  {
    uint64_t v25 = v0[13];
    uint64_t v11 = v0[11];
    uint64_t v12 = v0[12];
    uint64_t v13 = v0[10];
    os_log_type_t type = v7;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v28 = v26;
    *(_DWORD *)uint64_t v14 = 136315138;
    sub_247998B70();
    sub_24798981C(&qword_269269308, MEMORY[0x263F07508]);
    log = v6;
    uint64_t v15 = v13;
    uint64_t v16 = sub_247999B50();
    unint64_t v18 = v17;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v15);
    v0[2] = sub_247918FF0(v16, v18, &v28);
    sub_247999720();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v25);
    uint64_t v6 = log;
    _os_log_impl(&dword_247896000, log, type, "Received count tokens request with identifier: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v26, -1, -1);
    MEMORY[0x24C564070](v14, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v9 + 8))(v0[15], v0[13]);
  }

  uint64_t v19 = v0[9];
  sub_247998610();
  sub_247986E28(v19);
  uint64_t v20 = v0[6];
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
  uint64_t v21 = sub_247998AB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 1, 1, v21);
  sub_2479986B0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(void))v0[1];
  return v22();
}

uint64_t sub_247980AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_247980AC8, 0, 0);
}

uint64_t sub_247980AC8()
{
  uint64_t v1 = v0[5];
  swift_unownedRetainStrong();
  v0[6] = *(void *)(v1 + 16);
  swift_retain();
  swift_release();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[7] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_247980414;
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[2];
  return sub_247980B88(v5, v3, v4);
}

uint64_t sub_247980B88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269310);
  v4[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269130);
  v4[9] = swift_task_alloc();
  uint64_t v5 = sub_2479986A0();
  v4[10] = v5;
  v4[11] = *(void *)(v5 - 8);
  v4[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269318);
  v4[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269160);
  v4[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  v4[15] = swift_task_alloc();
  uint64_t v6 = sub_2479985F0();
  v4[16] = v6;
  v4[17] = *(void *)(v6 - 8);
  v4[18] = swift_task_alloc();
  v4[19] = swift_task_alloc();
  uint64_t v7 = sub_247998400();
  v4[20] = v7;
  v4[21] = *(void *)(v7 - 8);
  v4[22] = swift_task_alloc();
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  uint64_t v8 = sub_247998BB0();
  v4[26] = v8;
  v4[27] = *(void *)(v8 - 8);
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247980E98, 0, 0);
}

void sub_247980E98()
{
  uint64_t v51 = v0;
  if (qword_269266A78 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[29];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[6];
  uint64_t v5 = sub_247999030();
  v0[30] = __swift_project_value_buffer(v5, (uint64_t)qword_26927FBF0);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[31] = v6;
  v0[32] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v1, v4, v2);
  uint64_t v7 = sub_247999010();
  os_log_type_t v8 = sub_2479996B0();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = v0[29];
  uint64_t v11 = v0[27];
  if (v9)
  {
    uint64_t v45 = v0[26];
    uint64_t v12 = v0[25];
    uint64_t v13 = v0[20];
    uint64_t v14 = v0[21];
    os_log_type_t typea = v8;
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    v50[0] = v46;
    *(_DWORD *)uint64_t v15 = 136315138;
    sub_247998B70();
    sub_24798981C(&qword_269269308, MEMORY[0x263F07508]);
    log = v7;
    uint64_t v16 = v13;
    uint64_t v17 = sub_247999B50();
    unint64_t v19 = v18;
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v16);
    v0[3] = sub_247918FF0(v17, v19, v50);
    sub_247999720();
    swift_bridgeObjectRelease();
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v20(v10, v45);
    uint64_t v7 = log;
    _os_log_impl(&dword_247896000, log, typea, "Received complete prompt request with identifier: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v46, -1, -1);
    MEMORY[0x24C564070](v15, -1, -1);
  }
  else
  {
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v20(v0[29], v0[26]);
  }

  v0[33] = v20;
  uint64_t v21 = v0[23];
  uint64_t v22 = v0[24];
  uint64_t v23 = v0[21];
  uint64_t v24 = v0[20];
  uint64_t v25 = v0[13];
  uint64_t v44 = v0[14];
  typeb = (void (*)(char *, char *, uint64_t))v0[8];
  __swift_project_boxed_opaque_existential_1((void *)(v0[7] + 16), *(void *)(v0[7] + 40));
  sub_247998BA0();
  v0[34] = v26;
  sub_247998B90();
  sub_2479983E0();
  v0[35] = v27;
  uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  v0[36] = v28;
  v0[37] = (v23 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v28(v22, v24);
  sub_247998B80();
  sub_2479983E0();
  v0[38] = v29;
  v28(v21, v24);
  sub_247998B70();
  sub_247998B60();
  uint64_t v30 = sub_247998B00();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v44, 1, 1, v30);
  sub_247998740();
  uint64_t v31 = sub_247998AC0();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v25, 0, 1, v31);
  sub_247998700();
  uint64_t v32 = sub_247998730();
  unint64_t v33 = sub_247987FFC(v32);
  v0[39] = v33;
  swift_bridgeObjectRelease();
  sub_247998710();
  uint64_t v34 = sub_247998750();
  v0[40] = v34;
  sub_247998720();
  uint64_t v35 = sub_247987590(typeb);
  v0[41] = v35;
  uint64_t v36 = v35;
  os_log_type_t type = (char *)&dword_269269368 + dword_269269368;
  uint64_t v37 = (void *)swift_task_alloc();
  v0[42] = v37;
  void *v37 = v0;
  v37[1] = sub_247981554;
  uint64_t v39 = v0[14];
  uint64_t v38 = v0[15];
  uint64_t v41 = v0[12];
  uint64_t v40 = v0[13];
  uint64_t v42 = v0[9];
  uint64_t v59 = v34;
  uint64_t v60 = v36;
  unint64_t v57 = v33;
  uint64_t v58 = v42;
  uint64_t v55 = v40;
  uint64_t v56 = v41;
  uint64_t v53 = v38;
  uint64_t v54 = v39;
  __asm { BR              X8; sub_24797F71C }
}

uint64_t sub_247981554()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 344) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_247981AE0;
  }
  else
  {
    uint64_t v15 = (void (*)(uint64_t, uint64_t))v2[36];
    uint64_t v13 = v2[20];
    uint64_t v14 = v2[22];
    uint64_t v11 = v2[14];
    uint64_t v12 = v2[15];
    uint64_t v4 = v2[11];
    uint64_t v9 = v2[12];
    uint64_t v10 = v2[13];
    uint64_t v5 = v2[9];
    uint64_t v6 = v2[10];
    uint64_t v7 = v2[8];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2478A1A1C(v7, &qword_269269310);
    sub_2478A1A1C(v5, &qword_269269130);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v9, v6);
    sub_2478A1A1C(v10, &qword_269269318);
    sub_2478A1A1C(v11, &qword_269269160);
    sub_2478A1A1C(v12, &qword_269268C10);
    v15(v14, v13);
    uint64_t v3 = sub_24798176C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24798176C()
{
  uint64_t v30 = v0;
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[31];
  uint64_t v2 = v0[28];
  uint64_t v3 = v0[26];
  uint64_t v4 = v0[6];
  (*(void (**)(void, void, void))(v0[17] + 16))(v0[18], v0[19], v0[16]);
  sub_247998760();
  v1(v2, v4, v3);
  uint64_t v5 = sub_247999010();
  os_log_type_t v6 = sub_2479996B0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v23 = (void (*)(uint64_t, uint64_t))v0[36];
    uint64_t v22 = v0[28];
    uint64_t v7 = v0[25];
    uint64_t v24 = v0[26];
    uint64_t v25 = (void (*)(uint64_t, uint64_t))v0[33];
    uint64_t v8 = v0[20];
    uint64_t v26 = v0[17];
    uint64_t v27 = v0[16];
    uint64_t v28 = v0[19];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v29 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    sub_247998B70();
    sub_24798981C(&qword_269269308, MEMORY[0x263F07508]);
    uint64_t v11 = sub_247999B50();
    unint64_t v13 = v12;
    v23(v7, v8);
    v0[2] = sub_247918FF0(v11, v13, &v29);
    sub_247999720();
    swift_bridgeObjectRelease();
    v25(v22, v24);
    _os_log_impl(&dword_247896000, v5, v6, "Finished complete prompt request with identifier: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v10, -1, -1);
    MEMORY[0x24C564070](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v28, v27);
  }
  else
  {
    uint64_t v14 = (void (*)(uint64_t, uint64_t))v0[33];
    uint64_t v15 = v0[28];
    uint64_t v16 = v0[26];
    uint64_t v17 = v0[19];
    uint64_t v18 = v0[16];
    uint64_t v19 = v0[17];

    v14(v15, v16);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  }
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
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_247981AE0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v13 = (void (*)(uint64_t, uint64_t))v0[36];
  uint64_t v12 = v0[20];
  uint64_t v1 = v0[14];
  uint64_t v10 = v0[15];
  uint64_t v11 = v0[22];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[13];
  uint64_t v5 = v0[10];
  uint64_t v4 = v0[11];
  uint64_t v7 = v0[8];
  uint64_t v6 = v0[9];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2478A1A1C(v7, &qword_269269310);
  sub_2478A1A1C(v6, &qword_269269130);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v5);
  sub_2478A1A1C(v3, &qword_269269318);
  sub_2478A1A1C(v1, &qword_269269160);
  sub_2478A1A1C(v10, &qword_269268C10);
  v13(v11, v12);
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
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_247981CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_247981D00, 0, 0);
}

uint64_t sub_247981D00()
{
  uint64_t v1 = v0[5];
  swift_unownedRetainStrong();
  v0[6] = *(void *)(v1 + 16);
  swift_retain();
  swift_release();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[7] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_247980414;
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[2];
  return sub_247981DC0(v5, v3, v4);
}

uint64_t sub_247981DC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269310);
  v4[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269130);
  v4[9] = swift_task_alloc();
  uint64_t v5 = sub_2479986A0();
  v4[10] = v5;
  v4[11] = *(void *)(v5 - 8);
  v4[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269318);
  v4[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269160);
  v4[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  v4[15] = swift_task_alloc();
  uint64_t v6 = sub_2479985F0();
  v4[16] = v6;
  v4[17] = *(void *)(v6 - 8);
  v4[18] = swift_task_alloc();
  v4[19] = swift_task_alloc();
  uint64_t v7 = sub_247998400();
  v4[20] = v7;
  v4[21] = *(void *)(v7 - 8);
  v4[22] = swift_task_alloc();
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  uint64_t v8 = sub_247998BB0();
  v4[26] = v8;
  v4[27] = *(void *)(v8 - 8);
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2479820D0, 0, 0);
}

void sub_2479820D0()
{
  uint64_t v50 = v0;
  if (qword_269266A78 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[29];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[27];
  uint64_t v4 = v0[6];
  uint64_t v5 = sub_247999030();
  v0[30] = __swift_project_value_buffer(v5, (uint64_t)qword_26927FBF0);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[31] = v6;
  v0[32] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v1, v4, v2);
  uint64_t v7 = sub_247999010();
  os_log_type_t v8 = sub_2479996B0();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = v0[29];
  uint64_t v11 = v0[27];
  if (v9)
  {
    uint64_t v44 = v0[26];
    uint64_t v12 = v0[25];
    uint64_t v13 = v0[20];
    uint64_t v14 = v0[21];
    os_log_type_t typea = v8;
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    v49[0] = v45;
    *(_DWORD *)uint64_t v15 = 136315138;
    sub_247998B70();
    sub_24798981C(&qword_269269308, MEMORY[0x263F07508]);
    log = v7;
    uint64_t v16 = v13;
    uint64_t v17 = sub_247999B50();
    unint64_t v19 = v18;
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v16);
    v0[3] = sub_247918FF0(v17, v19, v49);
    sub_247999720();
    swift_bridgeObjectRelease();
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v20(v10, v44);
    uint64_t v7 = log;
    _os_log_impl(&dword_247896000, log, typea, "Received complete prompt template request with identifier: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v45, -1, -1);
    MEMORY[0x24C564070](v15, -1, -1);
  }
  else
  {
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v20(v0[29], v0[26]);
  }

  v0[33] = v20;
  uint64_t v22 = v0[23];
  uint64_t v21 = v0[24];
  uint64_t v23 = v0[21];
  uint64_t v24 = v0[20];
  uint64_t v25 = v0[14];
  typeb = (void (*)(char *, char *, uint64_t))v0[8];
  __swift_project_boxed_opaque_existential_1((void *)(v0[7] + 16), *(void *)(v0[7] + 40));
  sub_247998BA0();
  v0[34] = v26;
  sub_247998B90();
  sub_2479983E0();
  v0[35] = v27;
  uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  v0[36] = v28;
  v0[37] = (v23 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v28(v21, v24);
  sub_247998B80();
  sub_2479983E0();
  v0[38] = v29;
  v28(v22, v24);
  sub_247998B70();
  sub_247998B60();
  sub_2479987F0();
  uint64_t v30 = sub_247998B00();
  uint64_t v31 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v25, 0, 1, v30);
  MEMORY[0x24C562360](v31);
  sub_247998800();
  uint64_t v32 = sub_247998830();
  unint64_t v33 = sub_247987FFC(v32);
  v0[39] = v33;
  swift_bridgeObjectRelease();
  sub_247998810();
  uint64_t v34 = sub_247998850();
  v0[40] = v34;
  sub_247998820();
  uint64_t v35 = sub_247987590(typeb);
  v0[41] = v35;
  uint64_t v36 = v35;
  os_log_type_t type = (char *)&dword_269269368 + dword_269269368;
  uint64_t v37 = (void *)swift_task_alloc();
  v0[42] = v37;
  void *v37 = v0;
  v37[1] = sub_247982754;
  uint64_t v39 = v0[14];
  uint64_t v38 = v0[15];
  uint64_t v41 = v0[12];
  uint64_t v40 = v0[13];
  uint64_t v42 = v0[9];
  uint64_t v58 = v34;
  uint64_t v59 = v36;
  unint64_t v56 = v33;
  uint64_t v57 = v42;
  uint64_t v54 = v40;
  uint64_t v55 = v41;
  uint64_t v52 = v38;
  uint64_t v53 = v39;
  __asm { BR              X8; sub_24797F71C }
}

uint64_t sub_247982754()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 344) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_247989864;
  }
  else
  {
    uint64_t v15 = (void (*)(uint64_t, uint64_t))v2[36];
    uint64_t v13 = v2[20];
    uint64_t v14 = v2[22];
    uint64_t v11 = v2[14];
    uint64_t v12 = v2[15];
    uint64_t v4 = v2[11];
    uint64_t v9 = v2[12];
    uint64_t v10 = v2[13];
    uint64_t v5 = v2[9];
    uint64_t v6 = v2[10];
    uint64_t v7 = v2[8];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2478A1A1C(v7, &qword_269269310);
    sub_2478A1A1C(v5, &qword_269269130);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v9, v6);
    sub_2478A1A1C(v10, &qword_269269318);
    sub_2478A1A1C(v11, &qword_269269160);
    sub_2478A1A1C(v12, &qword_269268C10);
    v15(v14, v13);
    uint64_t v3 = sub_24798296C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24798296C()
{
  uint64_t v30 = v0;
  uint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[31];
  uint64_t v2 = v0[28];
  uint64_t v3 = v0[26];
  uint64_t v4 = v0[6];
  (*(void (**)(void, void, void))(v0[17] + 16))(v0[18], v0[19], v0[16]);
  sub_247998760();
  v1(v2, v4, v3);
  uint64_t v5 = sub_247999010();
  os_log_type_t v6 = sub_2479996B0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v23 = (void (*)(uint64_t, uint64_t))v0[36];
    uint64_t v22 = v0[28];
    uint64_t v7 = v0[25];
    uint64_t v24 = v0[26];
    uint64_t v25 = (void (*)(uint64_t, uint64_t))v0[33];
    uint64_t v8 = v0[20];
    uint64_t v26 = v0[17];
    uint64_t v27 = v0[16];
    uint64_t v28 = v0[19];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v29 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    sub_247998B70();
    sub_24798981C(&qword_269269308, MEMORY[0x263F07508]);
    uint64_t v11 = sub_247999B50();
    unint64_t v13 = v12;
    v23(v7, v8);
    v0[2] = sub_247918FF0(v11, v13, &v29);
    sub_247999720();
    swift_bridgeObjectRelease();
    v25(v22, v24);
    _os_log_impl(&dword_247896000, v5, v6, "Finished complete prompt template request with identifier: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v10, -1, -1);
    MEMORY[0x24C564070](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v28, v27);
  }
  else
  {
    uint64_t v14 = (void (*)(uint64_t, uint64_t))v0[33];
    uint64_t v15 = v0[28];
    uint64_t v16 = v0[26];
    uint64_t v17 = v0[19];
    uint64_t v18 = v0[16];
    uint64_t v19 = v0[17];

    v14(v15, v16);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v17, v18);
  }
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
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_247982CE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v85 = a1;
  uint64_t v97 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269310);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v103 = (void (*)(char *, char *, uint64_t))((char *)&v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269130);
  MEMORY[0x270FA5388](v6 - 8);
  unint64_t v100 = (unint64_t)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_2479986A0();
  uint64_t v91 = *(void *)(v93 - 8);
  MEMORY[0x270FA5388](v93);
  uint64_t v9 = (char *)&v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269318);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v89 = (char *)&v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269160);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v77 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v86 = (char *)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F58);
  MEMORY[0x270FA5388](v88);
  uint64_t v87 = (uint64_t)&v77 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F90);
  uint64_t v95 = *(void *)(v18 - 8);
  uint64_t v96 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  os_log_t v92 = (char *)&v77 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v94 = (char *)&v77 - v21;
  uint64_t v102 = sub_247998400();
  uint64_t v22 = *(void *)(v102 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v102);
  uint64_t v25 = (char *)&v77 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v84 = (char *)&v77 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  unint64_t v98 = (unint64_t)&v77 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)&v77 - v30;
  uint64_t v32 = sub_247998BB0();
  uint64_t v33 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)&v77 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269266A78 != -1) {
    swift_once();
  }
  char v104 = v25;
  uint64_t v36 = sub_247999030();
  __swift_project_value_buffer(v36, (uint64_t)qword_26927FBF0);
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v33 + 16);
  uint64_t v83 = a2;
  v37(v35, a2, v32);
  uint64_t v38 = sub_247999010();
  os_log_type_t v39 = sub_2479996B0();
  BOOL v40 = os_log_type_enabled(v38, v39);
  uint64_t v101 = v14;
  if (v40)
  {
    uint64_t v41 = (uint8_t *)swift_slowAlloc();
    uint64_t v81 = swift_slowAlloc();
    v106[0] = v81;
    uint64_t v82 = v9;
    uint64_t v80 = v41;
    *(_DWORD *)uint64_t v41 = 136315138;
    uint64_t v79 = v41 + 4;
    sub_247998B70();
    sub_24798981C(&qword_269269308, MEMORY[0x263F07508]);
    uint64_t v78 = v32;
    uint64_t v42 = v102;
    uint64_t v43 = sub_247999B50();
    unint64_t v45 = v44;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v31, v42);
    uint64_t v105 = sub_247918FF0(v43, v45, v106);
    uint64_t v9 = v82;
    sub_247999720();
    uint64_t v14 = v101;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v78);
    uint64_t v46 = v80;
    _os_log_impl(&dword_247896000, v38, v39, "Received streaming complete prompt request with identifier: %s", v80, 0xCu);
    uint64_t v47 = v81;
    swift_arrayDestroy();
    MEMORY[0x24C564070](v47, -1, -1);
    unint64_t v48 = v100;
    MEMORY[0x24C564070](v46, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v32);

    uint64_t v42 = v102;
    unint64_t v48 = v100;
  }
  uint64_t v82 = (char *)__swift_project_boxed_opaque_existential_1((void *)(v99 + 16), *(void *)(v99 + 40));
  uint64_t v81 = sub_247998BA0();
  unint64_t v100 = v49;
  unint64_t v50 = v98;
  sub_247998B90();
  uint64_t v80 = (uint8_t *)sub_2479983E0();
  uint64_t v99 = v51;
  uint64_t v52 = *(void (**)(unint64_t, uint64_t))(v22 + 8);
  v52(v50, v42);
  uint64_t v53 = v84;
  sub_247998B80();
  uint64_t v79 = (uint8_t *)sub_2479983E0();
  unint64_t v98 = v54;
  uint64_t v84 = (char *)(v22 + 8);
  v52((unint64_t)v53, v42);
  sub_247998B70();
  unint64_t v55 = (unint64_t)v86;
  sub_247998B60();
  uint64_t v56 = sub_247998B00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v14, 1, 1, v56);
  uint64_t v57 = (uint64_t)v89;
  sub_247998740();
  uint64_t v58 = sub_247998AC0();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v57, 0, 1, v58);
  sub_247998700();
  uint64_t v59 = sub_247998730();
  uint64_t v60 = (uint64_t)v9;
  unint64_t v61 = sub_247987FFC(v59);
  swift_bridgeObjectRelease();
  sub_247998710();
  uint64_t v62 = v48;
  uint64_t v63 = sub_247998750();
  os_log_type_t v64 = v103;
  sub_247998720();
  uint64_t v65 = sub_247987590(v64);
  sub_24798F824(v81, v100, (uint64_t)v80, v99, (uint64_t)v79, v98, (uint64_t)v104, v55, v87, (uint64_t)v101, v57, v60, v61, v62, v63, v65);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2478A1A1C((uint64_t)v103, &qword_269269310);
  sub_2478A1A1C(v62, &qword_269269130);
  (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v60, v93);
  sub_2478A1A1C(v57, &qword_269269318);
  sub_2478A1A1C((uint64_t)v101, &qword_269269160);
  sub_2478A1A1C(v55, &qword_269268C10);
  v52((unint64_t)v104, v102);
  sub_2479987D0();
  sub_247989568(&qword_269269330, &qword_269268F58);
  unint64_t v66 = v94;
  sub_2479998F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268F98);
  uint64_t v67 = swift_allocBox();
  uint64_t v69 = v68;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268FA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 56))(v69, 1, 1, v70);
  uint64_t v72 = v95;
  uint64_t v71 = v96;
  uint64_t v73 = v92;
  (*(void (**)(char *, char *, uint64_t))(v95 + 16))(v92, v66, v96);
  unint64_t v74 = (*(unsigned __int8 *)(v72 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80);
  uint64_t v75 = swift_allocObject();
  *(void *)(v75 + 16) = v67;
  (*(void (**)(unint64_t, char *, uint64_t))(v72 + 32))(v75 + v74, v73, v71);
  swift_retain();
  sub_2479995F0();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v66, v71);
  return swift_release();
}

uint64_t sub_247983890@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v84 = a1;
  uint64_t v96 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269310);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v102 = (void (*)(char *, char *, uint64_t))((char *)v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269130);
  MEMORY[0x270FA5388](v6 - 8);
  unint64_t v99 = (unint64_t)v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_2479986A0();
  uint64_t v90 = *(void *)(v92 - 8);
  MEMORY[0x270FA5388](v92);
  uint64_t v9 = (char *)v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269318);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v88 = (char *)v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269160);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v86 = (char *)v77 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v77 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F58);
  MEMORY[0x270FA5388](v87);
  uint64_t v85 = (uint64_t)v77 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F90);
  uint64_t v94 = *(void *)(v18 - 8);
  uint64_t v95 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v91 = (char *)v77 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v93 = (char *)v77 - v21;
  uint64_t v101 = sub_247998400();
  uint64_t v22 = *(void *)(v101 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v101);
  uint64_t v25 = (char *)v77 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v83 = (char *)v77 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  unint64_t v97 = (unint64_t)v77 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)v77 - v30;
  uint64_t v32 = sub_247998BB0();
  uint64_t v33 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)v77 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269266A78 != -1) {
    swift_once();
  }
  uint64_t v103 = v25;
  uint64_t v36 = sub_247999030();
  __swift_project_value_buffer(v36, (uint64_t)qword_26927FBF0);
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v33 + 16);
  uint64_t v82 = a2;
  v37(v35, a2, v32);
  uint64_t v38 = sub_247999010();
  uint64_t v39 = v32;
  os_log_type_t v40 = sub_2479996B0();
  BOOL v41 = os_log_type_enabled(v38, v40);
  unint64_t v100 = (unint64_t)v16;
  if (v41)
  {
    uint64_t v79 = v39;
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v80 = swift_slowAlloc();
    v105[0] = v80;
    uint64_t v81 = v9;
    uint64_t v78 = v42;
    *(_DWORD *)uint64_t v42 = 136315138;
    v77[1] = v42 + 4;
    sub_247998B70();
    sub_24798981C(&qword_269269308, MEMORY[0x263F07508]);
    uint64_t v43 = v101;
    uint64_t v44 = sub_247999B50();
    unint64_t v46 = v45;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v31, v43);
    uint64_t v104 = sub_247918FF0(v44, v46, v105);
    uint64_t v9 = v81;
    sub_247999720();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v79);
    uint64_t v47 = v78;
    _os_log_impl(&dword_247896000, v38, v40, "Received streaming complete prompt template request with identifier: %s", v78, 0xCu);
    uint64_t v48 = v80;
    swift_arrayDestroy();
    MEMORY[0x24C564070](v48, -1, -1);
    uint64_t v49 = v99;
    MEMORY[0x24C564070](v47, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v39);

    uint64_t v43 = v101;
    uint64_t v49 = v99;
  }
  uint64_t v81 = (char *)__swift_project_boxed_opaque_existential_1((void *)(v98 + 16), *(void *)(v98 + 40));
  uint64_t v80 = sub_247998BA0();
  unint64_t v99 = v50;
  unint64_t v51 = v97;
  sub_247998B90();
  uint64_t v79 = sub_2479983E0();
  uint64_t v98 = v52;
  uint64_t v53 = *(void (**)(unint64_t, uint64_t))(v22 + 8);
  v53(v51, v43);
  unint64_t v54 = v83;
  sub_247998B80();
  uint64_t v78 = (uint8_t *)sub_2479983E0();
  unint64_t v97 = v55;
  uint64_t v83 = (char *)(v22 + 8);
  v53((unint64_t)v54, v43);
  sub_247998B70();
  sub_247998B60();
  uint64_t v56 = (uint64_t)v86;
  sub_2479987F0();
  uint64_t v57 = sub_247998B00();
  uint64_t v58 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v56, 0, 1, v57);
  uint64_t v59 = (uint64_t)v88;
  MEMORY[0x24C562360](v58);
  sub_247998800();
  uint64_t v60 = sub_247998830();
  uint64_t v61 = (uint64_t)v9;
  unint64_t v62 = sub_247987FFC(v60);
  swift_bridgeObjectRelease();
  sub_247998810();
  uint64_t v63 = sub_247998850();
  os_log_type_t v64 = v102;
  sub_247998820();
  uint64_t v65 = sub_247987590(v64);
  sub_24798F824(v80, v99, v79, v98, (uint64_t)v78, v97, (uint64_t)v103, v100, v85, v56, v59, v61, v62, v49, v63, v65);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2478A1A1C((uint64_t)v102, &qword_269269310);
  sub_2478A1A1C(v49, &qword_269269130);
  (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v61, v92);
  sub_2478A1A1C(v59, &qword_269269318);
  sub_2478A1A1C(v56, &qword_269269160);
  sub_2478A1A1C(v100, &qword_269268C10);
  v53((unint64_t)v103, v101);
  sub_2479987D0();
  sub_247989568(&qword_269269330, &qword_269268F58);
  unint64_t v66 = v93;
  sub_2479998F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268F98);
  uint64_t v67 = swift_allocBox();
  uint64_t v69 = v68;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268FA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 56))(v69, 1, 1, v70);
  uint64_t v72 = v94;
  uint64_t v71 = v95;
  uint64_t v73 = v91;
  (*(void (**)(char *, char *, uint64_t))(v94 + 16))(v91, v66, v95);
  unint64_t v74 = (*(unsigned __int8 *)(v72 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80);
  uint64_t v75 = swift_allocObject();
  *(void *)(v75 + 16) = v67;
  (*(void (**)(unint64_t, char *, uint64_t))(v72 + 32))(v75 + v74, v73, v71);
  swift_retain();
  sub_2479995F0();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v66, v71);
  return swift_release();
}

uint64_t sub_247984400(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  swift_unownedRetainStrong();
  swift_retain();
  swift_release();
  a4(a1, a2);

  return swift_release();
}

uint64_t sub_247984488@<X0>(void (*a1)(char *, unint64_t, uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v83 = a1;
  uint64_t v79 = a3;
  uint64_t v84 = sub_247998240();
  uint64_t v68 = *(void *)(v84 - 8);
  MEMORY[0x270FA5388](v84);
  uint64_t v5 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_247998C30();
  uint64_t v69 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v67 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v80 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_247998400();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v78 = (char *)&v62 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v77 = (uint64_t)&v62 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v76 = (uint64_t)&v62 - v19;
  uint64_t v20 = sub_247998BB0();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v62 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269266A78 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_247999030();
  __swift_project_value_buffer(v24, (uint64_t)qword_26927FBF0);
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  uint64_t v82 = a2;
  v25(v23, a2, v20);
  uint64_t v26 = sub_247999010();
  os_log_type_t v27 = sub_2479996B0();
  int v28 = v27;
  BOOL v29 = os_log_type_enabled(v26, v27);
  uint64_t v70 = v6;
  uint64_t v71 = v5;
  if (v29)
  {
    LODWORD(v75) = v28;
    uint64_t v73 = v20;
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v74 = swift_slowAlloc();
    v86[0] = v74;
    uint64_t v72 = v30;
    *(_DWORD *)uint64_t v30 = 136315138;
    unint64_t v66 = v30 + 4;
    uint64_t v31 = v76;
    sub_247998B70();
    sub_24798981C(&qword_269269308, MEMORY[0x263F07508]);
    uint64_t v32 = sub_247999B50();
    uint64_t v33 = v14;
    unint64_t v35 = v34;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v31, v10);
    uint64_t v85 = sub_247918FF0(v32, v35, v86);
    sub_247999720();
    uint64_t v14 = v33;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v73);
    uint64_t v36 = v72;
    _os_log_impl(&dword_247896000, v26, (os_log_type_t)v75, "Received register document(s) request with identifier: %s", v72, 0xCu);
    uint64_t v37 = v74;
    swift_arrayDestroy();
    MEMORY[0x24C564070](v37, -1, -1);
    MEMORY[0x24C564070](v36, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  }

  uint64_t v38 = v80;
  sub_2479293C8((uint64_t)(v81 + 2), (uint64_t)v86);
  uint64_t v75 = __swift_project_boxed_opaque_existential_1(v86, v86[3]);
  uint64_t v74 = sub_247998BA0();
  uint64_t v40 = v39;
  uint64_t v41 = v77;
  sub_247998B90();
  uint64_t v73 = sub_2479983E0();
  uint64_t v76 = v42;
  unint64_t v45 = *(void (**)(void, void))(v11 + 8);
  uint64_t v43 = (uint8_t *)(v11 + 8);
  uint64_t v44 = v45;
  v45(v41, v10);
  unint64_t v46 = v78;
  sub_247998B80();
  uint64_t v72 = (uint8_t *)sub_2479983E0();
  uint64_t v77 = v47;
  v45(v46, v10);
  sub_247998B70();
  sub_247998B60();
  uint64_t v48 = sub_2479987C0();
  uint64_t v49 = *(void *)(v48 + 16);
  if (v49)
  {
    uint64_t v63 = v40;
    os_log_type_t v64 = v44;
    uint64_t v65 = v14;
    unint64_t v66 = v43;
    uint64_t v78 = (char *)v10;
    uint64_t v85 = MEMORY[0x263F8EE78];
    sub_2479998B0();
    unint64_t v50 = v67;
    uint64_t v51 = v69 + 16;
    uint64_t v83 = *(void (**)(char *, unint64_t, uint64_t))(v69 + 16);
    unint64_t v52 = (*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
    uint64_t v69 = v48;
    unint64_t v53 = v48 + v52;
    uint64_t v82 = *(void *)(v51 + 56);
    uint64_t v81 = (void (**)(uint64_t, char *, uint64_t))(v68 + 32);
    uint64_t v54 = v70;
    unint64_t v55 = v71;
    do
    {
      v83(v50, v53, v54);
      int v56 = sub_247998C00();
      sub_247998C10();
      uint64_t v57 = sub_247998C20();
      type metadata accessor for ImmutableFileHandle();
      uint64_t v58 = swift_allocObject();
      *(_DWORD *)(v58 + 16) = v56;
      (*v81)(v58 + OBJC_IVAR____TtC5Anvil19ImmutableFileHandle_url, v55, v84);
      *(void *)(v58 + OBJC_IVAR____TtC5Anvil19ImmutableFileHandle_metadata) = v57;
      (*(void (**)(char *, uint64_t))(v51 - 8))(v50, v54);
      sub_247999890();
      sub_2479998C0();
      sub_2479998D0();
      sub_2479998A0();
      v53 += v82;
      --v49;
    }
    while (v49);
    uint64_t v59 = v85;
    swift_bridgeObjectRelease();
    uint64_t v60 = v79;
    uint64_t v38 = v80;
    uint64_t v10 = (uint64_t)v78;
    uint64_t v14 = v65;
    uint64_t v44 = v64;
    uint64_t v40 = v63;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v59 = MEMORY[0x263F8EE78];
    uint64_t v60 = v79;
  }
  sub_247989BEC(v74, v40, v73, v76, (uint64_t)v72, v77, (uint64_t)v14, v38, v60, v59);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2478A1A1C((uint64_t)v38, &qword_269268C10);
  v44(v14, v10);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
}

uint64_t sub_247984CC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_247984CEC, 0, 0);
}

uint64_t sub_247984CEC()
{
  uint64_t v1 = v0[5];
  swift_unownedRetainStrong();
  v0[6] = *(void *)(v1 + 16);
  swift_retain();
  swift_release();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[7] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_247984DAC;
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[2];
  return sub_247984F4C(v5, v3, v4);
}

uint64_t sub_247984DAC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_247984EE8, 0, 0);
  }
  else
  {
    swift_release();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_247984EE8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247984F4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692692F8);
  v3[6] = swift_task_alloc();
  uint64_t v4 = sub_247998B00();
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = swift_task_alloc();
  uint64_t v5 = sub_247998400();
  v3[10] = v5;
  v3[11] = *(void *)(v5 - 8);
  v3[12] = swift_task_alloc();
  uint64_t v6 = sub_247998BB0();
  v3[13] = v6;
  v3[14] = *(void *)(v6 - 8);
  v3[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2479850F8, 0, 0);
}

uint64_t sub_2479850F8()
{
  os_log_type_t v27 = v0;
  if (qword_269266A78 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[13];
  uint64_t v4 = v0[5];
  uint64_t v5 = sub_247999030();
  __swift_project_value_buffer(v5, (uint64_t)qword_26927FBF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v6 = sub_247999010();
  os_log_type_t v7 = sub_2479996B0();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[14];
  uint64_t v10 = v0[15];
  if (v8)
  {
    uint64_t v22 = v0[13];
    uint64_t v11 = v0[11];
    uint64_t v12 = v0[12];
    uint64_t v13 = v0[10];
    os_log_type_t typea = v7;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v26 = v23;
    *(_DWORD *)uint64_t v14 = 136315138;
    sub_247998B70();
    sub_24798981C(&qword_269269308, MEMORY[0x263F07508]);
    log = v6;
    uint64_t v15 = v13;
    uint64_t v16 = sub_247999B50();
    unint64_t v18 = v17;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v15);
    v0[2] = sub_247918FF0(v16, v18, &v26);
    sub_247999720();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v22);
    uint64_t v6 = log;
    _os_log_impl(&dword_247896000, log, typea, "Received count tokens in prompt template request with identifier: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v23, -1, -1);
    MEMORY[0x24C564070](v14, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v9 + 8))(v0[15], v0[13]);
  }

  sub_247998860();
  os_log_type_t type = (uint64_t (__cdecl *)())((char *)&dword_269269300 + dword_269269300);
  uint64_t v19 = (void *)swift_task_alloc();
  v0[16] = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_2479853F8;
  return type();
}

uint64_t sub_2479853F8(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[17] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[9];
  uint64_t v6 = v4[8];
  uint64_t v7 = v4[7];
  if (v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    BOOL v8 = sub_247985674;
  }
  else
  {
    v4[18] = a1;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    BOOL v8 = sub_247985580;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t sub_247985580()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = sub_247998AB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  sub_2479986B0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_247985674()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t BlackPowderInferenceProvider.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  BlackPowderInferenceProvider.init()();
  return v0;
}

void BlackPowderInferenceProvider.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_247999030();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v0 + OBJC_IVAR____TtC5Anvil28BlackPowderInferenceProvider____lazy_storage___handler;
  uint64_t v7 = sub_2479987B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = _s13LanguageModelCMa();
  uint64_t v41 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  swift_allocObject();
  uint64_t v9 = sub_247989890((uint64_t)&v38, 0, 0, 0);
  *((void *)&v39 + 1) = v8;
  *(void *)&long long v40 = &off_26FBE4DA8;
  *(void *)&long long v38 = v9;
  type metadata accessor for InferenceProvider();
  uint64_t v10 = (void *)swift_allocObject();
  uint64_t v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v38, v8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (uint64_t *)((char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  uint64_t v15 = *v13;
  v10[5] = v8;
  v10[6] = &off_26FBE4DA8;
  v10[2] = v15;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v38);
  *(void *)(v1 + 16) = v10;
  if (qword_269266AA0 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v2, (uint64_t)qword_26927FC68);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v16, v2);
  unint64_t v17 = sub_247999010();
  os_log_type_t v18 = sub_2479996B0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v35 = v2;
    uint64_t v36 = v1;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(void *)&long long v38 = v34;
    *(_DWORD *)uint64_t v19 = 136315650;
    id v33 = self;
    id v20 = objc_msgSend(v33, sel_processInfo);
    id v21 = objc_msgSend(v20, sel_processName);

    uint64_t v22 = sub_247999330();
    unint64_t v24 = v23;

    uint64_t v37 = sub_247918FF0(v22, v24, (uint64_t *)&v38);
    sub_247999720();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    id v25 = objc_msgSend(self, sel_mainBundle);
    id v26 = objc_msgSend(v25, sel_bundleIdentifier);

    if (v26)
    {
      uint64_t v27 = sub_247999330();
      unint64_t v29 = v28;

      uint64_t v37 = sub_247918FF0(v27, v29, (uint64_t *)&v38);
      sub_247999720();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 22) = 1024;
      id v30 = objc_msgSend(v33, sel_processInfo);
      LODWORD(v29) = objc_msgSend(v30, sel_processIdentifier);

      LODWORD(v37) = v29;
      sub_247999720();
      _os_log_impl(&dword_247896000, v17, v18, "Starting process: %s, bundle identifier: %s, pid: %d", (uint8_t *)v19, 0x1Cu);
      uint64_t v31 = v34;
      swift_arrayDestroy();
      MEMORY[0x24C564070](v31, -1, -1);
      MEMORY[0x24C564070](v19, -1, -1);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v35);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t BlackPowderInferenceProvider.loadIn(inferenceAssetIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24796D664;
  v5[3] = a1;
  v5[4] = a2;
  return MEMORY[0x270FA2498](sub_247988954, 0, 0);
}

uint64_t BlackPowderInferenceProvider.loadOut(inferenceAssetIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24796D664;
  v5[3] = a1;
  v5[4] = a2;
  return MEMORY[0x270FA2498](sub_247988CA0, 0, 0);
}

uint64_t BlackPowderInferenceProvider.requestStream(clientData:configuration:)()
{
  uint64_t v0 = sub_2479987B0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24797FE88((uint64_t)v3);
  sub_247998780();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  uint64_t v0 = sub_2479987B0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24797FE88((uint64_t)v3);
  sub_247998770();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t BlackPowderInferenceProvider.requestOneShot(clientData:configuration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = sub_2479987B0();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247986048, 0, 0);
}

uint64_t sub_247986048()
{
  sub_24797FE88(v0[8]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[9] = v1;
  void *v1 = v0;
  v1[1] = sub_2479860F4;
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[2];
  return MEMORY[0x270F7F060](v4, v2, v3);
}

uint64_t sub_2479860F4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void **)v3;
  uint64_t v7 = *(void **)v3;
  *(void *)(*(void *)v3 + 80) = v2;
  swift_task_dealloc();
  (*(void (**)(void, void))(v6[7] + 8))(v6[8], v6[6]);
  if (v2)
  {
    return MEMORY[0x270FA2498](sub_2479862AC, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))v7[1];
    return v8(a1, a2);
  }
}

uint64_t sub_2479862AC()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t BlackPowderInferenceProvider.deinit()
{
  swift_release();
  sub_2478A1A1C(v0 + OBJC_IVAR____TtC5Anvil28BlackPowderInferenceProvider____lazy_storage___handler, qword_269269240);
  return v0;
}

uint64_t BlackPowderInferenceProvider.__deallocating_deinit()
{
  swift_release();
  sub_2478A1A1C(v0 + OBJC_IVAR____TtC5Anvil28BlackPowderInferenceProvider____lazy_storage___handler, qword_269269240);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

void sub_2479863BC(uint64_t *a1@<X8>)
{
  uint64_t v2 = swift_allocObject();
  BlackPowderInferenceProvider.init()();
  *a1 = v2;
}

uint64_t sub_2479863F8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24796D664;
  v5[3] = a1;
  v5[4] = a2;
  return MEMORY[0x270FA2498](sub_247988954, 0, 0);
}

uint64_t sub_2479864A8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24796D664;
  v5[3] = a1;
  v5[4] = a2;
  return MEMORY[0x270FA2498](sub_247988CA0, 0, 0);
}

uint64_t sub_247986558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_24796D664;
  return MEMORY[0x270F4C2C0](a1, a2, a3, a4, a5);
}

uint64_t sub_247986620()
{
  uint64_t v0 = sub_2479987B0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24797FE88((uint64_t)v3);
  sub_247998780();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_24798671C()
{
  uint64_t v0 = sub_2479987B0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24797FE88((uint64_t)v3);
  sub_247998770();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_247986810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[3] = a2;
  v4[4] = a3;
  v4[2] = a1;
  uint64_t v5 = sub_2479987B0();
  v4[5] = v5;
  v4[6] = *(void *)(v5 - 8);
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = *v3;
  v4[7] = v6;
  v4[8] = v7;
  return MEMORY[0x270FA2498](sub_2479868D8, 0, 0);
}

uint64_t sub_2479868D8()
{
  sub_24797FE88(v0[7]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[9] = v1;
  void *v1 = v0;
  v1[1] = sub_247986980;
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[2];
  return MEMORY[0x270F7F060](v4, v2, v3);
}

uint64_t sub_247986980(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void **)v3;
  uint64_t v7 = *(void **)v3;
  *(void *)(*(void *)v3 + 80) = v2;
  swift_task_dealloc();
  (*(void (**)(void, void))(v6[6] + 8))(v6[7], v6[5]);
  if (v2)
  {
    return MEMORY[0x270FA2498](sub_247986B38, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))v7[1];
    return v8(a1, a2);
  }
}

uint64_t sub_247986B38()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247986B9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_24796D664;
  return MEMORY[0x270F4C2B8](a1, a2, a3, a4, a5);
}

uint64_t sub_247986C68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_2478A1D80;
  return MEMORY[0x270F4C2A8](a1, a2, a3);
}

uint64_t sub_247986D18(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return MEMORY[0x270FA2498](sub_247986D38, 0, 0);
}

uint64_t sub_247986D38()
{
  sub_2479293C8(*(void *)(v0 + 64), v0 + 16);
  sub_2479987E0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247986DAC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return MEMORY[0x270FA2498](sub_247989868, 0, 0);
}

uint64_t sub_247986DCC()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for InferenceProvider()
{
  return self;
}

uint64_t sub_247986E28(uint64_t a1)
{
  uint64_t v3 = sub_247998AC0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269266A78 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_247999030();
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_26927FBF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t v9 = sub_247999010();
  os_log_type_t v10 = sub_247999680();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v27 = v1;
    uint64_t v12 = v11;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v29 = v24;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v28 = sub_247918FF0(0xD000000000000014, 0x80000002479A79B0, &v29);
    uint64_t v26 = a1;
    sub_247999720();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v25 = v8;
    sub_24798981C(&qword_269269380, MEMORY[0x263F7FB90]);
    uint64_t v13 = sub_247999B50();
    uint64_t v28 = sub_247918FF0(v13, v14, &v29);
    sub_247999720();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    _os_log_impl(&dword_247896000, v9, v10, "%s\n  prompt:%s", (uint8_t *)v12, 0x16u);
    uint64_t v15 = v24;
    swift_arrayDestroy();
    MEMORY[0x24C564070](v15, -1, -1);
    MEMORY[0x24C564070](v12, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

  sub_247998930();
  uint64_t v16 = sub_2479993C0();
  uint64_t result = swift_bridgeObjectRelease();
  float v18 = (float)v16 / 3.5;
  if ((~LODWORD(v18) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v18 <= -9.2234e18)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v18 >= 9.2234e18)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t v19 = (uint64_t)v18;
  id v20 = sub_247999010();
  os_log_type_t v21 = sub_2479996B0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 134217984;
    uint64_t v29 = v19;
    sub_247999720();
    _os_log_impl(&dword_247896000, v20, v21, "Estimated %ld tokens", v22, 0xCu);
    MEMORY[0x24C564070](v22, -1, -1);
  }

  return v19;
}

uint64_t sub_24798721C()
{
  uint64_t v1 = sub_2479984E0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  uint64_t v2 = sub_2479984D0();
  v0[5] = v2;
  v0[6] = *(void *)(v2 - 8);
  v0[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247987334, 0, 0);
}

uint64_t sub_247987334()
{
  if (qword_269266A78 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_247999030();
  __swift_project_value_buffer(v1, (uint64_t)qword_26927FBF0);
  uint64_t v2 = sub_247999010();
  os_log_type_t v3 = sub_247999690();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_247896000, v2, v3, "Counting tokens for a prompt template is not supported.", v4, 2u);
    MEMORY[0x24C564070](v4, -1, -1);
  }
  uint64_t v6 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v7 = v0[4];
  uint64_t v8 = v0[5];
  uint64_t v9 = v0[2];
  uint64_t v10 = v0[3];

  sub_2479984B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v7, v5, v8);
  (*(void (**)(uint64_t, void, uint64_t))(v10 + 104))(v7, *MEMORY[0x263F7F810], v9);
  sub_24798981C(&qword_269266BF0, MEMORY[0x263F7F830]);
  swift_allocError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v11, v7, v9);
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

char *sub_247987590(void (*a1)(char *, char *, uint64_t))
{
  uint64_t v78 = a1;
  uint64_t v2 = sub_2479984E0();
  uint64_t v75 = *(void *)(v2 - 8);
  uint64_t v76 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v72 = (char *)&v68 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_2479984D0();
  uint64_t v71 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  uint64_t v70 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_247998E90();
  uint64_t v79 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  uint64_t v6 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = (void *)sub_247998EA0();
  uint64_t v74 = *(v80 - 1);
  uint64_t v7 = MEMORY[0x270FA5388](v80);
  uint64_t v9 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v68 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v77 = (char *)&v68 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269310);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_2479984F0();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  os_log_type_t v21 = (char *)&v68 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v68 - v22;
  uint64_t v25 = v24;
  sub_2478E6A48((uint64_t)v78, (uint64_t)v16, &qword_269269310);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v25) == 1)
  {
    sub_2478A1A1C((uint64_t)v16, &qword_269269310);
    return (char *)MEMORY[0x263F8EE78];
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v23, v16, v25);
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v23, v25);
    if ((*(unsigned int (**)(char *, uint64_t))(v18 + 88))(v21, v25) == *MEMORY[0x263F7F848])
    {
      uint64_t v73 = (uint64_t)v23;
      (*(void (**)(char *, uint64_t))(v18 + 96))(v21, v25);
      uint64_t v27 = v74;
      uint64_t v28 = v77;
      uint64_t v29 = v21;
      id v30 = v80;
      (*(void (**)(char *, char *, void *))(v74 + 32))(v77, v29, v80);
      (*(void (**)(char *, char *, void *))(v27 + 16))(v12, v28, v30);
      if ((*(unsigned int (**)(char *, void *))(v27 + 88))(v12, v30) == *MEMORY[0x263F40C30])
      {
        uint64_t v75 = v25;
        (*(void (**)(char *, void *))(v27 + 96))(v12, v30);
        uint64_t v26 = *(char **)(*(void *)v12 + 16);
        swift_bridgeObjectRetain();
        swift_release();
        uint64_t v31 = *((void *)v26 + 2);
        if (v31)
        {
          uint64_t v68 = v18;
          uint64_t v78 = *(void (**)(char *, char *, uint64_t))(v79 + 16);
          v79 += 16;
          uint64_t v32 = v26;
          id v33 = &v26[(*(unsigned __int8 *)(v79 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v79 + 64)];
          uint64_t v34 = v27 + 8;
          uint64_t v35 = (void (**)(char *, uint64_t))(v79 - 8);
          uint64_t v76 = *(void *)(v79 + 56);
          uint64_t v72 = v32;
          swift_bridgeObjectRetain();
          uint64_t v74 = v34 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
          uint64_t v36 = v69;
          while (1)
          {
            v78(v6, v33, v36);
            sub_247998E70();
            sub_2478AB004((uint64_t)v9);
            if (v1) {
              break;
            }
            uint64_t v37 = *(void (**)(char *, void *))v34;
            (*(void (**)(char *, void *))v34)(v9, v80);
            (*v35)(v6, v36);
            v33 += v76;
            if (!--v31)
            {
              uint64_t v26 = v72;
              swift_bridgeObjectRelease();
              uint64_t v18 = v68;
              id v30 = v80;
              goto LABEL_21;
            }
          }
          uint64_t v26 = v72;
          swift_bridgeObjectRelease();
          uint64_t v65 = *(void (**)(char *, void *))v34;
          unint64_t v66 = v80;
          (*(void (**)(char *, void *))v34)(v9, v80);
          (*v35)(v6, v36);
          swift_bridgeObjectRelease();
          v65(v77, v66);
          (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v73, v75);
        }
        else
        {
          uint64_t v37 = *(void (**)(char *, void *))(v27 + 8);
LABEL_21:
          v37(v77, v30);
          (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v73, v75);
        }
      }
      else
      {
        uint64_t v52 = v18;
        unint64_t v53 = *(void (**)(char *, void *))(v27 + 8);
        uint64_t v54 = v12;
        uint64_t v26 = (char *)(v27 + 8);
        v53(v54, v30);
        uint64_t v55 = v73;
        if (qword_269266A78 != -1) {
          swift_once();
        }
        uint64_t v56 = sub_247999030();
        __swift_project_value_buffer(v56, (uint64_t)qword_26927FBF0);
        uint64_t v57 = sub_247999010();
        os_log_type_t v58 = sub_247999690();
        if (os_log_type_enabled(v57, v58))
        {
          uint64_t v59 = v55;
          uint64_t v60 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v60 = 0;
          _os_log_impl(&dword_247896000, v57, v58, "Only top level object schemas are supported", v60, 2u);
          uint64_t v61 = v60;
          uint64_t v55 = v59;
          MEMORY[0x24C564070](v61, -1, -1);
        }

        sub_24798981C(&qword_269266BF0, MEMORY[0x263F7F830]);
        uint64_t v62 = v76;
        swift_allocError();
        uint64_t v64 = v63;
        sub_2479984B0();
        (*(void (**)(uint64_t, void, uint64_t))(v75 + 104))(v64, *MEMORY[0x263F7F808], v62);
        swift_willThrow();
        v53(v77, v30);
        (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v55, v25);
      }
    }
    else
    {
      long long v38 = *(void **)(v18 + 8);
      uint64_t v68 = v18 + 8;
      uint64_t v80 = v38;
      ((void (*)(char *, uint64_t))v38)(v21, v25);
      if (qword_269266A78 != -1) {
        swift_once();
      }
      uint64_t v39 = sub_247999030();
      __swift_project_value_buffer(v39, (uint64_t)qword_26927FBF0);
      long long v40 = sub_247999010();
      os_log_type_t v41 = sub_247999690();
      if (os_log_type_enabled(v40, v41))
      {
        uint64_t v42 = v23;
        uint64_t v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v43 = 0;
        _os_log_impl(&dword_247896000, v40, v41, "Grammars are not supported", v43, 2u);
        uint64_t v44 = v43;
        uint64_t v23 = v42;
        MEMORY[0x24C564070](v44, -1, -1);
      }

      unint64_t v45 = v70;
      sub_2479984B0();
      uint64_t v46 = v71;
      uint64_t v26 = v72;
      uint64_t v47 = v23;
      uint64_t v48 = v73;
      (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v72, v45, v73);
      uint64_t v50 = v75;
      uint64_t v49 = v76;
      (*(void (**)(char *, void, uint64_t))(v75 + 104))(v26, *MEMORY[0x263F7F808], v76);
      sub_24798981C(&qword_269266BF0, MEMORY[0x263F7F830]);
      swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v50 + 16))(v51, v26, v49);
      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v26, v49);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v45, v48);
      ((void (*)(char *, uint64_t))v80)(v47, v25);
    }
  }
  return v26;
}

unint64_t sub_247987FFC(uint64_t a1)
{
  uint64_t v56 = sub_247998520();
  uint64_t v2 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v4 = (char *)v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_247998F50();
  uint64_t v5 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v65 = (char *)v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_2479986F0();
  uint64_t v7 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  uint64_t v64 = (char *)v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_247998AD0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v49 = (char *)v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v47 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269340);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_247998F40();
  uint64_t v18 = MEMORY[0x270FA5388](v67);
  uint64_t v76 = (char *)v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v63 = (char *)v47 - v21;
  unint64_t v22 = *(void *)(a1 + 16);
  if (!v22) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v23 = v7;
  uint64_t v24 = a1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v74 = *(void *)(v2 + 72);
  uint64_t v73 = (uint64_t (**)(char *, uint64_t))(v10 + 88);
  int v72 = *MEMORY[0x263F7FAD8];
  int v61 = *MEMORY[0x263F7FAD0];
  uint64_t v54 = (void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  uint64_t v52 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v71 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  unint64_t v53 = (void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v59 = (void (**)(char *, char *, uint64_t))(v23 + 32);
  uint64_t v60 = (void (**)(char *, uint64_t))(v10 + 96);
  int v55 = *MEMORY[0x263F7FAC8];
  os_log_type_t v58 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v57 = (void (**)(char *, uint64_t))(v23 + 8);
  uint64_t v62 = v20;
  uint64_t v69 = (void (**)(char *, char *, uint64_t))(v20 + 32);
  uint64_t v70 = (unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  v47[0] = a1;
  swift_bridgeObjectRetain();
  unint64_t v25 = MEMORY[0x263F8EE78];
  *(void *)&long long v26 = 136315138;
  long long v48 = v26;
  v47[1] = MEMORY[0x263F8EE58] + 8;
  uint64_t v27 = v67;
  uint64_t v75 = v17;
  do
  {
    sub_247998510();
    int v28 = (*v73)(v14, v9);
    uint64_t v78 = v24;
    if (v28 == v72)
    {
      (*v60)(v14, v9);
      uint64_t v29 = v64;
      (*v59)(v64, v14, v77);
      sub_2479986E0();
      sub_2479986C0();
      unint64_t v68 = v22;
      id v30 = v65;
      sub_2479986D0();
      uint64_t v27 = v67;
      sub_247998F30();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v31 = v30;
      unint64_t v22 = v68;
      (*v58)(v31, v66);
      uint64_t v17 = v75;
      (*v57)(v29, v77);
LABEL_11:
      (*v71)(v17, 0, 1, v27);
      goto LABEL_12;
    }
    if (v28 == v61)
    {
      sub_247998EE0();
      goto LABEL_11;
    }
    if (v28 == v55)
    {
      sub_247998EB0();
      goto LABEL_11;
    }
    unint64_t v68 = v25;
    if (qword_269266A70 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_247999030();
    __swift_project_value_buffer(v37, (uint64_t)qword_26927FBD8);
    (*v54)(v4, v24, v56);
    long long v38 = sub_247999010();
    uint64_t v39 = v4;
    os_log_type_t v40 = sub_247999690();
    if (os_log_type_enabled(v38, v40))
    {
      uint64_t v41 = swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      uint64_t v79 = v51;
      *(_DWORD *)uint64_t v41 = v48;
      os_log_t v50 = v38;
      sub_247998510();
      uint64_t v42 = sub_247999390();
      *(void *)(v41 + 4) = sub_247918FF0(v42, v43, &v79);
      swift_bridgeObjectRelease();
      (*v52)(v39, v56);
      long long v38 = v50;
      _os_log_impl(&dword_247896000, v50, v40, "Unknown tool type: %s", (uint8_t *)v41, 0xCu);
      uint64_t v44 = v51;
      swift_arrayDestroy();
      MEMORY[0x24C564070](v44, -1, -1);
      MEMORY[0x24C564070](v41, -1, -1);
    }
    else
    {
      (*v52)(v39, v56);
    }

    uint64_t v4 = v39;
    (*v71)(v17, 1, 1, v27);
    (*v53)(v14, v9);
    unint64_t v25 = v68;
LABEL_12:
    if ((*v70)(v17, 1, v27) == 1)
    {
      sub_2478A1A1C((uint64_t)v17, &qword_269269340);
    }
    else
    {
      uint64_t v32 = *v69;
      id v33 = v63;
      (*v69)(v63, v17, v27);
      v32(v76, v33, v27);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v25 = sub_247918FBC(0, *(void *)(v25 + 16) + 1, 1, v25);
      }
      unint64_t v35 = *(void *)(v25 + 16);
      unint64_t v34 = *(void *)(v25 + 24);
      uint64_t v36 = v62;
      if (v35 >= v34 >> 1)
      {
        uint64_t v45 = sub_247918FBC(v34 > 1, v35 + 1, 1, v25);
        uint64_t v36 = v62;
        unint64_t v25 = v45;
      }
      *(void *)(v25 + 16) = v35 + 1;
      v32((char *)(v25+ ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))+ *(void *)(v36 + 72) * v35), v76, v27);
    }
    uint64_t v24 = v78 + v74;
    --v22;
  }
  while (v22);
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t sub_247988934(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_247988954, 0, 0);
}

uint64_t sub_247988954()
{
  uint64_t v13 = v0;
  if (qword_269266A78 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_247999030();
  __swift_project_value_buffer(v1, (uint64_t)qword_26927FBF0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_247999010();
  os_log_type_t v3 = sub_2479996B0();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[4];
  if (v4)
  {
    uint64_t v6 = v0[3];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v12 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[2] = sub_247918FF0(v6, v5, &v12);
    sub_247999720();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247896000, v2, v3, "Received load in request for asset: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v8, -1, -1);
    MEMORY[0x24C564070](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v11 = (uint64_t (__cdecl *)())((char *)&dword_269269488 + dword_269269488);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[5] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_247988B8C;
  return v11();
}

uint64_t sub_247988B8C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_247988C80(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return MEMORY[0x270FA2498](sub_247988CA0, 0, 0);
}

uint64_t sub_247988CA0()
{
  uint64_t v13 = v0;
  if (qword_269266A78 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_247999030();
  __swift_project_value_buffer(v1, (uint64_t)qword_26927FBF0);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_247999010();
  os_log_type_t v3 = sub_2479996B0();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[4];
  if (v4)
  {
    uint64_t v6 = v0[3];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v12 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[2] = sub_247918FF0(v6, v5, &v12);
    sub_247999720();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247896000, v2, v3, "Received load out request for asset: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v8, -1, -1);
    MEMORY[0x24C564070](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v11 = (uint64_t (__cdecl *)())((char *)&dword_269269488 + dword_269269488);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[5] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_247989888;
  return v11();
}

uint64_t sub_247988ED8()
{
  return type metadata accessor for BlackPowderInferenceProvider();
}

uint64_t type metadata accessor for BlackPowderInferenceProvider()
{
  uint64_t result = qword_269269278;
  if (!qword_269269278) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_247988F2C()
{
  sub_247988FF8();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for BlackPowderInferenceProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BlackPowderInferenceProvider);
}

uint64_t dispatch thunk of BlackPowderInferenceProvider.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

void sub_247988FF8()
{
  if (!qword_269269288)
  {
    sub_2479987B0();
    unint64_t v0 = sub_247999700();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269269288);
    }
  }
}

uint64_t sub_247989050()
{
  swift_unownedRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_247989088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[4] = a3;
  v9[5] = v8;
  v9[2] = a1;
  v9[3] = a2;
  v9[1] = sub_24796D664;
  return MEMORY[0x270FA2498](sub_247980354, 0, 0);
}

uint64_t sub_24798914C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[4] = a3;
  v9[5] = v8;
  v9[2] = a1;
  v9[3] = a2;
  v9[1] = sub_24796D664;
  return MEMORY[0x270FA2498](sub_247980AC8, 0, 0);
}

uint64_t sub_247989210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[4] = a3;
  v9[5] = v8;
  v9[2] = a1;
  v9[3] = a2;
  v9[1] = sub_24796D664;
  return MEMORY[0x270FA2498](sub_247981D00, 0, 0);
}

uint64_t sub_2479892D4(uint64_t a1, uint64_t a2)
{
  return sub_247984400(a1, a2, *(void *)(v2 + 16), (void (*)(uint64_t, uint64_t))sub_247982CE0);
}

uint64_t sub_247989304(uint64_t a1, uint64_t a2)
{
  return sub_247984400(a1, a2, *(void *)(v2 + 16), (void (*)(uint64_t, uint64_t))sub_247983890);
}

uint64_t sub_247989334(uint64_t a1, uint64_t a2)
{
  return sub_247984400(a1, a2, *(void *)(v2 + 16), (void (*)(uint64_t, uint64_t))sub_247984488);
}

uint64_t sub_247989364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[4] = a3;
  v9[5] = v8;
  v9[2] = a1;
  v9[3] = a2;
  v9[1] = sub_24796D664;
  return MEMORY[0x270FA2498](sub_247984CEC, 0, 0);
}

uint64_t sub_247989428(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_269269240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_247989490()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2479894C8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_24796D664;
  return sub_2478AAF6C(a1, v4);
}

uint64_t sub_247989568(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2479895BC(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268F90) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24796D664;
  return sub_247965190(a1, v5, v6);
}

uint64_t sub_2479896A8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2478A1D80;
  return sub_2478AAF6C(a1, v4);
}

uint64_t objectdestroy_57Tm()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F90);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24798981C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_247989890(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  uint64_t v28 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268250);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (int *)type metadata accessor for BlackPowder();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v28 - v13;
  uint64_t v15 = OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_expiredSessions;
  _s15ExpiredSessionsCMa();
  uint64_t v16 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v16 + 112) = MEMORY[0x263F8EE88];
  *(void *)(v4 + v15) = v16;
  unint64_t v17 = sub_2478FAC44(MEMORY[0x263F8EE78]);
  sub_247998220();
  uint64_t v18 = sub_247998240();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48))(v8, 1, v18);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v12, v8, v18);
    uint64_t v21 = &v12[v9[5]];
    sub_24793D6A0((uint64_t)v37);
    memcpy(v21, v37, 0x179uLL);
    *(void *)&v12[v9[6]] = 4;
    unint64_t v22 = &v12[v9[7]];
    *(void *)unint64_t v22 = 1701603686;
    *((void *)v22 + 1) = 0xE400000000000000;
    *(void *)&v12[v9[8]] = v17;
    sub_247997A3C((uint64_t)v12, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for BlackPowder);
    sub_247997A3C((uint64_t)v14, v4 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_provider, (uint64_t (*)(void))type metadata accessor for BlackPowder);
    sub_2478E6A48(a1, (uint64_t)v31, (uint64_t *)&unk_269269490);
    if (*(void *)&v31[0])
    {
      long long v33 = v31[0];
      long long v34 = v31[1];
      long long v35 = v31[2];
      uint64_t v36 = v32;
    }
    else
    {
      sub_24789C138(1, (uint64_t *)&v33);
      sub_2478A1A1C((uint64_t)v31, (uint64_t *)&unk_269269490);
    }
    uint64_t v24 = v29;
    uint64_t v23 = v30;
    uint64_t v25 = v28;
    long long v26 = v34;
    *(_OWORD *)(v4 + 16) = v33;
    *(_OWORD *)(v4 + 32) = v26;
    *(_OWORD *)(v4 + 48) = v35;
    *(void *)(v4 + 64) = v36;
    if (!v25)
    {
      if (qword_269266A68 != -1) {
        swift_once();
      }
      uint64_t v25 = qword_26927FBD0;
      swift_retain();
    }
    sub_2478A1A1C(a1, (uint64_t *)&unk_269269490);
    *(void *)(v4 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_registry) = v25;
    uint64_t v27 = (void *)(v4 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_makeAuthenticator);
    *uint64_t v27 = v24;
    v27[1] = v23;
    return v4;
  }
  return result;
}

uint64_t sub_247989BEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  void (*v36)(void *__return_ptr, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t, uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  void (*v88)(char *, uint64_t);
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void v97[63];
  id v98[63];

  uint64_t v11 = v10;
  uint64_t v88 = (void (*)(char *, uint64_t))a8;
  uint64_t v92 = a5;
  uint64_t v93 = a3;
  uint64_t v79 = a1;
  uint64_t v80 = a2;
  uint64_t v85 = a9;
  uint64_t v89 = sub_247998400();
  uint64_t v74 = *(void *)(v89 - 8);
  MEMORY[0x270FA5388](v89);
  uint64_t v73 = v15;
  uint64_t v87 = (char *)&v71 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D0);
  uint64_t v83 = *(void *)(v16 - 8);
  uint64_t v84 = v16;
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v81 = v18;
  uint64_t v82 = (char *)&v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v91 = (char *)&v71 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269266F78);
  MEMORY[0x270FA5388](v20 - 8);
  unint64_t v22 = (char *)&v71 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  int v72 = *(void *)(v23 - 8);
  uint64_t v24 = *(void *)(v72 + 64);
  uint64_t v25 = MEMORY[0x270FA5388](v23 - 8);
  uint64_t v86 = (uint64_t)&v71 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v71 - v27;
  MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v71 - v29;
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268E20);
  uint64_t v90 = swift_allocBox();
  uint64_t v32 = v31;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268818);
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v76 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 56);
  uint64_t v77 = v33;
  uint64_t v75 = v34 + 56;
  uint64_t v35 = v76(v32, 1, 1);
  uint64_t v36 = *(void (**)(void *__return_ptr, uint64_t))(v11
                                                             + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_makeAuthenticator);
  if (v36) {
    v36(v97, v35);
  }
  else {
    memset(v97, 0, 489);
  }
  sub_2478E6A48((uint64_t)v88, (uint64_t)v30, &qword_269268C10);
  uint64_t v95 = v11;
  uint64_t v96 = a6;
  uint64_t v94 = a4;
  if (v97[0])
  {
    sub_2478A1A1C((uint64_t)v30, &qword_269268C10);
    memcpy(v98, v97, 0x1E9uLL);
    uint64_t v37 = v73;
  }
  else
  {
    sub_2478E6A48((uint64_t)v30, (uint64_t)v28, &qword_269268C10);
    long long v38 = sub_247998B20();
    uint64_t v39 = *(void *)(v38 - 8);
    os_log_type_t v40 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v39 + 48))(v28, 1, v38);
    if (v40 == 1)
    {
      sub_2478A1A1C((uint64_t)v28, &qword_269268C10);
      uint64_t v41 = 0;
    }
    else
    {
      uint64_t v42 = sub_247998B10();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v28, v38);
      uint64_t v41 = v42;
    }
    uint64_t v37 = v73;
    LOBYTE(v98[0]) = v40 == 1;
    sub_247902E04(v41 | ((unint64_t)(v40 == 1) << 32), (uint64_t)v98);
    sub_2478A1A1C((uint64_t)v30, &qword_269268C10);
    sub_2478A1A1C((uint64_t)v97, &qword_2692693A0);
  }
  uint64_t v71 = a10;
  OpenAIAuthenticator.credentials.getter((uint64_t)v22);
  unint64_t v43 = type metadata accessor for OpenAIAuthenticator.Credentials(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 48))(v22, 1, v43) == 1)
  {
    sub_2478A1A1C((uint64_t)v22, &qword_269266F78);
    uint64_t v73 = 0;
    uint64_t v44 = 0;
  }
  else
  {
    uint64_t v73 = OpenAIAuthenticator.Credentials.credentialsID.getter();
    uint64_t v44 = v45;
    sub_247997AC0((uint64_t)v22, type metadata accessor for OpenAIAuthenticator.Credentials);
  }
  sub_2479030DC((uint64_t)v98, (uint64_t)v97);
  uint64_t v46 = v74;
  (*(void (**)(char *, uint64_t, uint64_t))(v74 + 16))(v87, a7, v89);
  sub_2478E6A48((uint64_t)v88, v86, &qword_269268C10);
  uint64_t v47 = (*(unsigned __int8 *)(v46 + 80) + 592) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
  long long v48 = (v37 + *(unsigned __int8 *)(v72 + 80) + v47) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80);
  uint64_t v88 = (void (*)(char *, uint64_t))((v24 + v48 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v49 = (char *)swift_allocObject();
  os_log_t v50 = v95;
  *((void *)v49 + 2) = v90;
  *((void *)v49 + 3) = v50;
  memcpy(v49 + 32, v97, 0x1E9uLL);
  uint64_t v51 = v94;
  *((void *)v49 + 66) = v93;
  *((void *)v49 + 67) = v51;
  *((void *)v49 + 68) = v92;
  *((void *)v49 + 69) = v96;
  *((void *)v49 + 70) = v73;
  *((void *)v49 + 71) = v44;
  uint64_t v52 = v80;
  *((void *)v49 + 72) = v79;
  *((void *)v49 + 73) = v52;
  (*(void (**)(char *, char *, uint64_t))(v46 + 32))(&v49[v47], v87, v89);
  sub_2478F5268(v86, (uint64_t)&v49[v48], &qword_269268C10);
  *(void *)((char *)v88 + (void)v49) = v71;
  unint64_t v53 = sub_247998CD0();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v54 = v82;
  uint64_t v89 = v53;
  sub_2479995F0();
  if (qword_269266A88 != -1) {
    swift_once();
  }
  int v55 = sub_247999030();
  uint64_t v56 = __swift_project_value_buffer(v55, (uint64_t)qword_26927FC20);
  uint64_t v57 = (uint64_t)v91;
  sub_24794CB7C((uint64_t)"RegisteringDocument", 19, 2, v56, (uint64_t)v91);
  uint64_t v59 = v83;
  os_log_type_t v58 = v84;
  uint64_t v88 = *(void (**)(char *, uint64_t))(v83 + 8);
  v88(v54, v84);
  uint64_t v87 = (char *)swift_allocBox();
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v76)(v60, 1, 1, v77);
  (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v54, v57, v58);
  int v61 = (*(unsigned __int8 *)(v59 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
  uint64_t v62 = (v81 + v61 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v63 = (v62 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v64 = swift_allocObject();
  *(void *)(v64 + 16) = v87;
  (*(void (**)(unint64_t, char *, uint64_t))(v59 + 32))(v64 + v61, v54, v58);
  uint64_t v65 = (void *)(v64 + v62);
  uint64_t v66 = v95;
  uint64_t v67 = v96;
  *uint64_t v65 = v92;
  v65[1] = v67;
  *(void *)(v64 + v63) = v66;
  unint64_t v68 = (void *)(v64 + ((v63 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v69 = v94;
  *unint64_t v68 = v93;
  v68[1] = v69;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2479995F0();
  v88(v91, v58);
  sub_2479203E0(v98);
  return swift_release();
}

uint64_t sub_24798A474(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 672) = v18;
  *(_OWORD *)(v8 + 640) = v16;
  *(_OWORD *)(v8 + 656) = v17;
  *(_OWORD *)(v8 + 624) = v15;
  *(void *)(v8 + 616) = a8;
  *(void *)(v8 + 608) = a7;
  *(void *)(v8 + 600) = a6;
  *(void *)(v8 + 592) = a5;
  *(void *)(v8 + 584) = a4;
  *(void *)(v8 + 576) = a3;
  *(void *)(v8 + 568) = a2;
  *(void *)(v8 + 560) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  *(void *)(v8 + 680) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268810);
  *(void *)(v8 + 688) = swift_task_alloc();
  uint64_t v9 = sub_247998CD0();
  *(void *)(v8 + 696) = v9;
  *(void *)(v8 + 704) = *(void *)(v9 - 8);
  *(void *)(v8 + 712) = swift_task_alloc();
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268C10) - 8);
  *(void *)(v8 + 720) = v10;
  *(void *)(v8 + 728) = *(void *)(v10 + 64);
  *(void *)(v8 + 736) = swift_task_alloc();
  uint64_t v11 = sub_247998400();
  *(void *)(v8 + 744) = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  *(void *)(v8 + 752) = v12;
  *(void *)(v8 + 760) = *(void *)(v12 + 64);
  *(void *)(v8 + 768) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268E20);
  *(void *)(v8 + 776) = swift_task_alloc();
  *(void *)(v8 + 784) = swift_projectBox();
  return MEMORY[0x270FA2498](sub_24798A6D4, 0, 0);
}

uint64_t sub_24798A6D4()
{
  uint64_t v1 = v0[98];
  uint64_t v2 = v0[97];
  swift_beginAccess();
  sub_2478E6A48(v1, v2, &qword_269268E20);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268818);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 48);
  int v5 = v4(v2, 1, v3);
  sub_2478A1A1C(v2, &qword_269268E20);
  if (v5 == 1)
  {
    uint64_t v6 = v0[96];
    uint64_t v7 = v0[94];
    uint64_t v8 = v0[93];
    uint64_t v46 = v6;
    uint64_t v9 = v0[92];
    uint64_t v41 = v0[95];
    uint64_t v42 = v0[91];
    uint64_t v40 = v0[90];
    uint64_t v10 = v0[83];
    uint64_t v11 = v0[82];
    uint64_t v49 = v0[81];
    uint64_t v50 = v0[84];
    uint64_t v48 = v0[80];
    uint64_t v51 = v0[79];
    uint64_t v45 = v0[78];
    uint64_t v12 = v0[77];
    uint64_t v13 = v0[75];
    uint64_t v43 = v0[74];
    uint64_t v44 = v0[76];
    uint64_t v14 = v0[72];
    uint64_t v47 = v0[71];
    sub_2479030DC(v0[73], (uint64_t)(v0 + 2));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v11, v8);
    sub_2478E6A48(v10, v9, &qword_269268C10);
    unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 592) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    unint64_t v16 = (v41 + *(unsigned __int8 *)(v40 + 80) + v15) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
    long long v17 = (char *)swift_allocObject();
    v0[99] = v17;
    *((void *)v17 + 2) = v14;
    *((void *)v17 + 3) = v43;
    *((void *)v17 + 4) = v13;
    *((void *)v17 + 5) = v44;
    *((void *)v17 + 6) = v12;
    *((void *)v17 + 7) = v45;
    *((void *)v17 + 8) = v51;
    memcpy(v17 + 72, v0 + 2, 0x1E9uLL);
    *((void *)v17 + 71) = v47;
    *((void *)v17 + 72) = v48;
    *((void *)v17 + 73) = v49;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(&v17[v15], v46, v8);
    sub_2478F5268(v9, (uint64_t)&v17[v16], &qword_269268C10);
    *(void *)&v17[(v42 + v16 + 7) & 0xFFFFFFFFFFFFFFF8] = v50;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v18 = (void *)swift_task_alloc();
    v0[100] = v18;
    void *v18 = v0;
    v18[1] = sub_24798AC5C;
    uint64_t v19 = v0[73];
    uint64_t v20 = v0[70];
    return sub_24798DF18(v20, v19, dword_2692693D8, (uint64_t)v17);
  }
  else
  {
    uint64_t v22 = v0[98];
    swift_beginAccess();
    if (v4(v22, 1, v3))
    {
      uint64_t v23 = v0[88];
      uint64_t v24 = v0[87];
      uint64_t v25 = v0[86];
      swift_endAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56))(v25, 1, 1, v24);
      uint64_t v26 = v0[85];
      uint64_t v27 = v0[75];
      uint64_t v28 = v0[74];
      uint64_t v29 = v0[72];
      sub_2478A1A1C(v0[86], &qword_269268810);
      uint64_t v30 = *(void *)(v29 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_registry);
      uint64_t v31 = sub_247999520();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v26, 1, 1, v31);
      sub_247999500();
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v32 = sub_2479994F0();
      uint64_t v33 = (void *)swift_allocObject();
      uint64_t v34 = MEMORY[0x263F8F500];
      v33[2] = v32;
      v33[3] = v34;
      v33[4] = v28;
      v33[5] = v27;
      v33[6] = v30;
      uint64_t v35 = sub_24794C41C(v26, (uint64_t)&unk_2692693E8, (uint64_t)v33);
      v0[104] = v35;
      uint64_t v36 = (void *)swift_task_alloc();
      v0[105] = v36;
      *uint64_t v36 = v0;
      v36[1] = sub_24798B1C4;
      uint64_t v37 = MEMORY[0x263F8EE60] + 8;
      return MEMORY[0x270FA1FD0](v36, v35, v37);
    }
    else
    {
      long long v38 = (void *)swift_task_alloc();
      v0[102] = v38;
      *long long v38 = v0;
      v38[1] = sub_24798ADF8;
      uint64_t v39 = v0[86];
      return MEMORY[0x270FA2100](v39, v3);
    }
  }
}

uint64_t sub_24798AC5C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 808) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24798B3B0, 0, 0);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24798ADF8()
{
  *(void *)(*(void *)v1 + 824) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24798B468;
  }
  else
  {
    swift_endAccess();
    uint64_t v2 = sub_24798AF14;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24798AF14()
{
  uint64_t v1 = v0[88];
  uint64_t v2 = v0[87];
  uint64_t v3 = v0[86];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2) == 1)
  {
    uint64_t v4 = v0[85];
    uint64_t v5 = v0[75];
    uint64_t v6 = v0[74];
    uint64_t v7 = v0[72];
    sub_2478A1A1C(v3, &qword_269268810);
    uint64_t v8 = *(void *)(v7 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_registry);
    uint64_t v9 = sub_247999520();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
    sub_247999500();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v10 = sub_2479994F0();
    uint64_t v11 = (void *)swift_allocObject();
    uint64_t v12 = MEMORY[0x263F8F500];
    id v11[2] = v10;
    v11[3] = v12;
    v11[4] = v6;
    v11[5] = v5;
    v11[6] = v8;
    uint64_t v13 = sub_24794C41C(v4, (uint64_t)&unk_2692693E8, (uint64_t)v11);
    v0[104] = v13;
    uint64_t v14 = (void *)swift_task_alloc();
    v0[105] = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_24798B1C4;
    uint64_t v15 = MEMORY[0x263F8EE60] + 8;
    return MEMORY[0x270FA1FD0](v14, v13, v15);
  }
  else
  {
    uint64_t v16 = v0[89];
    uint64_t v17 = v0[70];
    uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32);
    v18(v16, v3, v2);
    v18(v17, v16, v2);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1 + 56))(v17, 0, 1, v2);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v19 = (uint64_t (*)(void))v0[1];
    return v19();
  }
}

uint64_t sub_24798B1C4()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24798B2DC, 0, 0);
}

uint64_t sub_24798B2DC()
{
  (*(void (**)(void, uint64_t, uint64_t, void))(v0[88] + 56))(v0[70], 1, 1, v0[87]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24798B3B0()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24798B468()
{
  swift_endAccess();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24798B520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 104) = v22;
  *(_OWORD *)(v8 + 88) = v21;
  *(_OWORD *)(v8 + 72) = v20;
  *(void *)(v8 + 64) = a1;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D0);
  *(void *)(v8 + 112) = v15;
  *(void *)(v8 + 120) = *(void *)(v15 - 8);
  *(void *)(v8 + 128) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268E20);
  *(void *)(v8 + 136) = swift_task_alloc();
  *(void *)(v8 + 144) = swift_projectBox();
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v8 + 152) = v16;
  *uint64_t v16 = v8;
  v16[1] = sub_24798B6C4;
  return sub_24798BCF4(a3, a4, a5, a6, a7, a8, v19);
}

uint64_t sub_24798B6C4(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 160) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24798B818, a1, 0);
  }
}

uint64_t sub_24798B818()
{
  sub_24794E494(v0[9], v0[10], v0[12], v0[13], v0[16]);
  return MEMORY[0x270FA2498](sub_24798B890, 0, 0);
}

uint64_t sub_24798B890()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v5 = v0[14];
  sub_2479995D0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268818);
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v2, 0, 1, v6);
  swift_beginAccess();
  sub_2478E7964(v2, v1, &qword_269268E20);
  swift_beginAccess();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v1, 1, v6))
  {
    uint64_t v8 = v0[8];
    swift_endAccess();
    swift_release();
    uint64_t v9 = sub_247998CD0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
  else
  {
    uint64_t v12 = (void *)swift_task_alloc();
    v0[21] = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_24798BAE4;
    uint64_t v13 = v0[8];
    return MEMORY[0x270FA2100](v13, v6);
  }
}

uint64_t sub_24798BAE4()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24798BC74;
  }
  else
  {
    swift_endAccess();
    uint64_t v2 = sub_24798BC00;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24798BC00()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24798BC74()
{
  swift_endAccess();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24798BCF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[164] = v7;
  v8[163] = a7;
  v8[162] = a6;
  v8[161] = a5;
  v8[160] = a4;
  v8[159] = a3;
  v8[158] = a2;
  v8[157] = a1;
  type metadata accessor for BlackPowder();
  v8[165] = swift_task_alloc();
  uint64_t v9 = sub_2479984E0();
  v8[166] = v9;
  v8[167] = *(void *)(v9 - 8);
  v8[168] = swift_task_alloc();
  uint64_t v10 = sub_2479984D0();
  v8[169] = v10;
  v8[170] = *(void *)(v10 - 8);
  v8[171] = swift_task_alloc();
  v8[172] = __swift_instantiateConcreteTypeFromMangledName(&qword_269266FB0);
  v8[173] = swift_task_alloc();
  v8[174] = swift_task_alloc();
  uint64_t v11 = sub_2479983D0();
  v8[175] = v11;
  v8[176] = *(void *)(v11 - 8);
  v8[177] = swift_task_alloc();
  v8[178] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  v8[179] = swift_task_alloc();
  v8[180] = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C30);
  v8[181] = swift_task_alloc();
  uint64_t v12 = type metadata accessor for SessionRegistry.SessionInfo(0);
  v8[182] = v12;
  v8[183] = *(void *)(v12 - 8);
  v8[184] = swift_task_alloc();
  v8[185] = swift_task_alloc();
  v8[186] = swift_task_alloc();
  v8[187] = swift_task_alloc();
  v8[188] = swift_task_alloc();
  v8[189] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24798C008, 0, 0);
}

uint64_t sub_24798C008()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 1312) + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_expiredSessions);
  *(void *)(v0 + 1520) = v1;
  return MEMORY[0x270FA2498](sub_24798C034, v1, 0);
}

uint64_t sub_24798C034()
{
  uint64_t v1 = *(void *)(v0 + 1520);
  uint64_t v2 = *(void *)(v0 + 1280);
  uint64_t v3 = *(void *)(v0 + 1272);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 112);
  swift_bridgeObjectRetain();
  *(unsigned char *)(v0 + 505) = sub_24799514C(v3, v2, v4) & 1;
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24798C0E8, 0, 0);
}

uint64_t sub_24798C0E8()
{
  uint64_t v39 = v0;
  if (*(unsigned char *)(v0 + 505))
  {
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_247999030();
    __swift_project_value_buffer(v1, (uint64_t)qword_26927FC68);
    swift_bridgeObjectRetain_n();
    uint64_t v2 = sub_247999010();
    os_log_type_t v3 = sub_247999690();
    BOOL v4 = os_log_type_enabled(v2, v3);
    unint64_t v5 = *(void *)(v0 + 1280);
    if (v4)
    {
      uint64_t v6 = *(void *)(v0 + 1272);
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v37 = v8;
      *(_DWORD *)uint64_t v7 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 1184) = sub_247918FF0(v6, v5, &v37);
      sub_247999720();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_247896000, v2, v3, "Client attempted to use expired session %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v8, -1, -1);
      MEMORY[0x24C564070](v7, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v28 = *(void *)(v0 + 1368);
    uint64_t v29 = *(void *)(v0 + 1360);
    uint64_t v30 = *(void *)(v0 + 1352);
    uint64_t v31 = *(void *)(v0 + 1344);
    uint64_t v32 = *(void *)(v0 + 1336);
    uint64_t v33 = *(void *)(v0 + 1328);
    uint64_t v37 = 0;
    unint64_t v38 = 0xE000000000000000;
    sub_247999800();
    swift_bridgeObjectRelease();
    uint64_t v37 = 0xD000000000000022;
    unint64_t v38 = 0x80000002479A7AD0;
    sub_2479993D0();
    sub_2479984B0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v31, v28, v30);
    (*(void (**)(uint64_t, void, uint64_t))(v32 + 104))(v31, *MEMORY[0x263F7F7F0], v33);
    sub_2479961B8(&qword_269266BF0, MEMORY[0x263F7F830]);
    swift_allocError();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v34, v31, v33);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
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
    swift_task_dealloc();
    uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
    return v35();
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + 1432);
    uint64_t v10 = *(void *)(v0 + 1312);
    uint64_t v11 = *(void *)(v0 + 1304);
    uint64_t v12 = *(void *)(v0 + 1280);
    uint64_t v13 = *(void *)(v0 + 1272);
    uint64_t v14 = *(void *)(v0 + 1264);
    uint64_t v15 = *(void *)(v0 + 1256);
    uint64_t v16 = (void *)swift_allocObject();
    *(void *)(v0 + 1528) = v16;
    v16[2] = v13;
    v16[3] = v12;
    v16[4] = v10;
    void v16[5] = v15;
    v16[6] = v14;
    *(_DWORD *)(v0 + 524) = *(_DWORD *)(v11 + 484);
    *(unsigned char *)(v0 + 506) = *(unsigned char *)(v11 + 488);
    sub_2479030DC(v11, v0 + 16);
    uint64_t v17 = *(void *)(v10 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_registry);
    *(void *)(v0 + 1536) = v17;
    uint64_t v18 = sub_247999520();
    *(void *)(v0 + 1544) = v18;
    uint64_t v19 = *(void *)(v18 - 8);
    long long v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
    *(void *)(v0 + 1552) = v20;
    *(void *)(v0 + 1560) = (v19 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    v20(v9, 1, 1, v18);
    *(void *)(v0 + 1568) = sub_247999500();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v21 = sub_2479994F0();
    uint64_t v22 = (void *)swift_allocObject();
    uint64_t v23 = MEMORY[0x263F8F500];
    v22[2] = v21;
    v22[3] = v23;
    v22[4] = v15;
    v22[5] = v14;
    v22[6] = v17;
    uint64_t v24 = sub_24794C778(v9, (uint64_t)&unk_269268C38, (uint64_t)v22);
    *(void *)(v0 + 1576) = v24;
    uint64_t v25 = (void *)swift_task_alloc();
    *(void *)(v0 + 1584) = v25;
    *uint64_t v25 = v0;
    v25[1] = sub_24798C6E4;
    uint64_t v26 = *(void *)(v0 + 1448);
    uint64_t v27 = *(void *)(v0 + 1440);
    return MEMORY[0x270FA1FD0](v26, v24, v27);
  }
}

uint64_t sub_24798C6E4()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24798C7FC, 0, 0);
}

uint64_t sub_24798C7FC()
{
  uint64_t v155 = v0;
  uint64_t v1 = *(void *)(v0 + 1448);
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(*(void *)(v0 + 1464) + 48))(v1, 1, *(void *)(v0 + 1456)) == 1)
  {
    sub_2478A1A1C(v1, &qword_269268C30);
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_247999030();
    __swift_project_value_buffer(v2, (uint64_t)qword_26927FC68);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    os_log_type_t v3 = sub_247999010();
    os_log_type_t v4 = sub_2479996B0();
    BOOL v5 = os_log_type_enabled(v3, v4);
    unint64_t v6 = *(void *)(v0 + 1280);
    if (v5)
    {
      unint64_t v7 = *(void *)(v0 + 1264);
      uint64_t v137 = *(void *)(v0 + 1272);
      uint64_t v141 = *(void *)(v0 + 1256);
      uint64_t v8 = swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      v154[0] = v9;
      *(_DWORD *)uint64_t v8 = 136315394;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 1232) = sub_247918FF0(v137, v6, v154);
      sub_247999720();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 1216) = sub_247918FF0(v141, v7, v154);
      sub_247999720();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_247896000, v3, v4, "New session with localID:%s and groupID:%s. Remote session will be created lazily.", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v9, -1, -1);
      MEMORY[0x24C564070](v8, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    uint64_t v135 = sub_2479937BC(*(void *)(v0 + 1256), *(void *)(v0 + 1264), *(void *)(v0 + 1272), *(void *)(v0 + 1280), *(void *)(v0 + 1312), v0 + 16, (uint64_t)&unk_269269408, *(void *)(v0 + 1528));
    swift_release();
    uint64_t v31 = (id *)(v0 + 16);
    goto LABEL_30;
  }
  uint64_t v10 = *(void *)(v0 + 1512);
  uint64_t v11 = *(void *)(v0 + 1296);
  sub_247997A3C(v1, v10, type metadata accessor for SessionRegistry.SessionInfo);
  uint64_t v12 = *(void *)(v10 + 56);
  if (!v12)
  {
    if (!v11) {
      goto LABEL_13;
    }
LABEL_23:
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    uint64_t v151 = v0 + 16;
    uint64_t v32 = sub_247999030();
    __swift_project_value_buffer(v32, (uint64_t)qword_26927FC68);
    uint64_t v33 = sub_247999010();
    os_log_type_t v34 = sub_247999690();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v35 = 0;
      _os_log_impl(&dword_247896000, v33, v34, "Existing session accessed with different credentials. New remote session will be created.", v35, 2u);
      MEMORY[0x24C564070](v35, -1, -1);
    }
    uint64_t v36 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 1552);
    uint64_t v37 = *(void *)(v0 + 1544);
    uint64_t v38 = *(void *)(v0 + 1536);
    uint64_t v145 = *(void *)(v0 + 1528);
    uint64_t v148 = *(void *)(v0 + 1512);
    uint64_t v39 = *(void *)(v0 + 1432);
    uint64_t v138 = *(void *)(v0 + 1280);
    uint64_t v142 = *(void *)(v0 + 1312);
    uint64_t v134 = *(void *)(v0 + 1272);
    uint64_t v24 = *(void *)(v0 + 1264);
    uint64_t v25 = *(void *)(v0 + 1256);

    v36(v39, 1, 1, v37);
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v40 = sub_2479994F0();
    uint64_t v27 = (void *)swift_allocObject();
    uint64_t v41 = MEMORY[0x263F8F500];
    v27[2] = v40;
    v27[3] = v41;
    void v27[4] = v25;
    v27[5] = v24;
    v27[6] = v38;
    uint64_t v29 = &unk_269269410;
    uint64_t v30 = v39;
    goto LABEL_28;
  }
  if (!v11) {
    goto LABEL_23;
  }
  BOOL v13 = *(void *)(v10 + 48) == *(void *)(v0 + 1288) && v12 == *(void *)(v0 + 1296);
  if (!v13 && (sub_247999B80() & 1) == 0) {
    goto LABEL_23;
  }
LABEL_13:
  uint64_t v14 = *(void *)(v0 + 1512);
  char v15 = *(unsigned char *)(v0 + 506);
  if (*(unsigned char *)(v14 + 68))
  {
    if (!*(unsigned char *)(v0 + 506))
    {
LABEL_15:
      if (qword_269266AA0 != -1) {
        swift_once();
      }
      uint64_t v151 = v0 + 16;
      uint64_t v16 = sub_247999030();
      __swift_project_value_buffer(v16, (uint64_t)qword_26927FC68);
      uint64_t v17 = sub_247999010();
      os_log_type_t v18 = sub_247999690();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl(&dword_247896000, v17, v18, "Existing session accessed with different user account. New remote session will be created.", v19, 2u);
        MEMORY[0x24C564070](v19, -1, -1);
      }
      long long v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 1552);
      uint64_t v21 = *(void *)(v0 + 1544);
      uint64_t v22 = *(void *)(v0 + 1536);
      uint64_t v145 = *(void *)(v0 + 1528);
      uint64_t v148 = *(void *)(v0 + 1512);
      uint64_t v23 = *(void *)(v0 + 1432);
      uint64_t v138 = *(void *)(v0 + 1280);
      uint64_t v142 = *(void *)(v0 + 1312);
      uint64_t v134 = *(void *)(v0 + 1272);
      uint64_t v24 = *(void *)(v0 + 1264);
      uint64_t v25 = *(void *)(v0 + 1256);

      v20(v23, 1, 1, v21);
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v26 = sub_2479994F0();
      uint64_t v27 = (void *)swift_allocObject();
      uint64_t v28 = MEMORY[0x263F8F500];
      v27[2] = v26;
      v27[3] = v28;
      void v27[4] = v25;
      v27[5] = v24;
      v27[6] = v22;
      uint64_t v29 = &unk_269269418;
      uint64_t v30 = v23;
LABEL_28:
      sub_24794C41C(v30, (uint64_t)v29, (uint64_t)v27);
      swift_release();
      uint64_t v42 = (id *)v151;
      uint64_t v135 = sub_2479937BC(v25, v24, v134, v138, v142, v151, (uint64_t)&unk_269269408, v145);
      swift_release();
      uint64_t v43 = v148;
LABEL_29:
      sub_247997AC0(v43, type metadata accessor for SessionRegistry.SessionInfo);
      uint64_t v31 = v42;
LABEL_30:
      sub_2479203E0(v31);
LABEL_31:
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
      swift_task_dealloc();
      uint64_t v44 = *(uint64_t (**)(void *))(v0 + 8);
      return v44(v135);
    }
  }
  else
  {
    if (*(_DWORD *)(v14 + 64) != *(_DWORD *)(v0 + 524)) {
      char v15 = 1;
    }
    if (v15) {
      goto LABEL_15;
    }
  }
  uint64_t v46 = *(void *)(v0 + 1408);
  uint64_t v47 = *(void *)(v0 + 1400);
  uint64_t v48 = *(void *)(v0 + 1392);
  uint64_t v131 = *(void *)(v0 + 1456);
  sub_2478E6A48(v14 + *(int *)(v131 + 36), v48, &qword_269266FB0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v48, 1, v47) == 1)
  {
    uint64_t v49 = *(void *)(v0 + 1392);
    sub_2479203E0((id *)(v0 + 16));
    sub_2478A1A1C(v49, &qword_269266FB0);
LABEL_51:
    uint64_t v140 = (const void *)(v0 + 528);
    if (qword_269266AA0 != -1) {
      swift_once();
    }
    uint64_t v136 = (_OWORD *)(v0 + 1024);
    uint64_t v70 = *(void *)(v0 + 1512);
    uint64_t v71 = *(void *)(v0 + 1504);
    uint64_t v72 = *(void *)(v0 + 1496);
    uint64_t v73 = *(void *)(v0 + 1488);
    uint64_t v74 = *(void *)(v0 + 1480);
    uint64_t v75 = *(void *)(v0 + 1472);
    uint64_t v76 = sub_247999030();
    __swift_project_value_buffer(v76, (uint64_t)qword_26927FC68);
    sub_24799614C(v70, v71, type metadata accessor for SessionRegistry.SessionInfo);
    sub_24799614C(v70, v72, type metadata accessor for SessionRegistry.SessionInfo);
    sub_24799614C(v70, v73, type metadata accessor for SessionRegistry.SessionInfo);
    sub_24799614C(v70, v74, type metadata accessor for SessionRegistry.SessionInfo);
    sub_24799614C(v70, v75, type metadata accessor for SessionRegistry.SessionInfo);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v77 = sub_247999010();
    os_log_type_t v78 = sub_2479996B0();
    if (os_log_type_enabled(v77, v78))
    {
      int v121 = *(_DWORD *)(v0 + 524);
      char v122 = *(unsigned char *)(v0 + 506);
      uint64_t v124 = *(void *)(v0 + 1504);
      uint64_t v125 = *(void *)(v0 + 1496);
      uint64_t v126 = *(void *)(v0 + 1488);
      uint64_t v127 = *(void *)(v0 + 1480);
      uint64_t v128 = *(void *)(v0 + 1472);
      uint64_t v129 = *(void *)(v0 + 1384);
      uint64_t v123 = *(void *)(v0 + 1296);
      uint64_t v79 = *(void *)(v0 + 1288);
      os_log_type_t v132 = v78;
      unint64_t v80 = *(void *)(v0 + 1280);
      uint64_t v81 = *(void *)(v0 + 1272);
      unint64_t v82 = *(void *)(v0 + 1264);
      uint64_t v83 = *(void *)(v0 + 1256);
      uint64_t v84 = swift_slowAlloc();
      uint64_t v130 = swift_slowAlloc();
      v154[0] = v130;
      *(_DWORD *)uint64_t v84 = 136317186;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 1168) = sub_247918FF0(v83, v82, v154);
      sub_247999720();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v84 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 1160) = sub_247918FF0(v81, v80, v154);
      sub_247999720();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v84 + 22) = 2080;
      *(void *)(v0 + 1144) = v79;
      *(void *)(v0 + 1152) = v123;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269268900);
      uint64_t v85 = sub_247999390();
      *(void *)(v0 + 1176) = sub_247918FF0(v85, v86, v154);
      sub_247999720();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v84 + 32) = 2080;
      *(_DWORD *)(v0 + 516) = v121;
      *(unsigned char *)(v0 + 520) = v122;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2692688E8);
      uint64_t v87 = sub_247999390();
      *(void *)(v0 + 1192) = sub_247918FF0(v87, v88, v154);
      sub_247999720();
      swift_bridgeObjectRelease();
      *(_WORD *)(v84 + 42) = 2080;
      uint64_t v89 = *(void *)(v124 + 32);
      unint64_t v90 = *(void *)(v124 + 40);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 1200) = sub_247918FF0(v89, v90, v154);
      sub_247999720();
      swift_bridgeObjectRelease();
      sub_247997AC0(v124, type metadata accessor for SessionRegistry.SessionInfo);
      *(_WORD *)(v84 + 52) = 2080;
      uint64_t v91 = *(void *)(v125 + 16);
      unint64_t v92 = *(void *)(v125 + 24);
      swift_bridgeObjectRetain();
      *(void *)(v0 + 1208) = sub_247918FF0(v91, v92, v154);
      sub_247999720();
      swift_bridgeObjectRelease();
      sub_247997AC0(v125, type metadata accessor for SessionRegistry.SessionInfo);
      *(_WORD *)(v84 + 62) = 2080;
      uint64_t v93 = *(void *)(v126 + 56);
      *(void *)(v0 + 1128) = *(void *)(v126 + 48);
      *(void *)(v0 + 1136) = v93;
      swift_bridgeObjectRetain();
      uint64_t v94 = sub_247999390();
      *(void *)(v0 + 1224) = sub_247918FF0(v94, v95, v154);
      sub_247999720();
      swift_bridgeObjectRelease();
      sub_247997AC0(v126, type metadata accessor for SessionRegistry.SessionInfo);
      *(_WORD *)(v84 + 72) = 2080;
      char v96 = *(unsigned char *)(v127 + 68);
      *(_DWORD *)(v0 + 508) = *(_DWORD *)(v127 + 64);
      *(unsigned char *)(v0 + 512) = v96;
      uint64_t v97 = sub_247999390();
      *(void *)(v0 + 1240) = sub_247918FF0(v97, v98, v154);
      sub_247999720();
      swift_bridgeObjectRelease();
      sub_247997AC0(v127, type metadata accessor for SessionRegistry.SessionInfo);
      *(_WORD *)(v84 + 82) = 2080;
      sub_2478E6A48(v128 + *(int *)(v131 + 36), v129, &qword_269266FB0);
      uint64_t v99 = sub_247999390();
      *(void *)(v0 + 1248) = sub_247918FF0(v99, v100, v154);
      sub_247999720();
      swift_bridgeObjectRelease();
      sub_247997AC0(v128, type metadata accessor for SessionRegistry.SessionInfo);
      _os_log_impl(&dword_247896000, v77, v132, "New local session with:\n  groupID:%s\n  localID:%s\n  credentialsID:%s\n  auditID:%s\n\nAttaching to existing remote session:\n  userID:%s\n  remoteID:%s\n  credentialsID:%s\n  auditID:%s\n  expirationDate:%s", (uint8_t *)v84, 0x5Cu);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v130, -1, -1);
      MEMORY[0x24C564070](v84, -1, -1);
    }
    else
    {
      uint64_t v101 = *(void *)(v0 + 1504);
      uint64_t v102 = *(void *)(v0 + 1496);
      uint64_t v103 = *(void *)(v0 + 1488);
      uint64_t v104 = *(void *)(v0 + 1480);
      uint64_t v105 = *(void *)(v0 + 1472);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      sub_247997AC0(v101, type metadata accessor for SessionRegistry.SessionInfo);
      sub_247997AC0(v102, type metadata accessor for SessionRegistry.SessionInfo);
      sub_247997AC0(v103, type metadata accessor for SessionRegistry.SessionInfo);
      sub_247997AC0(v104, type metadata accessor for SessionRegistry.SessionInfo);
      sub_247997AC0(v105, type metadata accessor for SessionRegistry.SessionInfo);
    }
    uint64_t v106 = *(void *)(v0 + 1536);
    uint64_t v107 = *(void *)(v0 + 1512);
    uint64_t v108 = *(void *)(v0 + 1320);
    uint64_t v109 = *(void *)(v0 + 1312);
    uint64_t v110 = *(void *)(v0 + 1304);
    uint64_t v111 = *(void *)(v0 + 1280);
    uint64_t v150 = *(void *)(v0 + 1272);
    uint64_t v153 = *(void *)(v0 + 1528);
    uint64_t v112 = *(void *)(v0 + 1264);
    uint64_t v113 = *(void *)(v107 + 40);
    uint64_t v144 = *(void *)(v107 + 32);
    uint64_t v147 = *(void *)(v0 + 1256);
    sub_24799614C(v109 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_provider, v108, (uint64_t (*)(void))type metadata accessor for BlackPowder);
    sub_2479030DC(v110, (uint64_t)v140);
    sub_247920218(v109 + 16, (uint64_t)v136);
    _s7SessionCMa();
    uint64_t v114 = (void *)swift_allocObject();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_defaultActor_initialize();
    v114[14] = v147;
    v114[15] = v112;
    v114[16] = v150;
    v114[17] = v111;
    v114[18] = v144;
    v114[19] = v113;
    sub_247997A3C(v108, (uint64_t)v114 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_provider, (uint64_t (*)(void))type metadata accessor for BlackPowder);
    memcpy((char *)v114 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_authenticator, v140, 0x1E9uLL);
    uint64_t v115 = (char *)v114 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_client;
    long long v116 = *(_OWORD *)(v0 + 1040);
    *(_OWORD *)uint64_t v115 = *v136;
    *((_OWORD *)v115 + 1) = v116;
    *((_OWORD *)v115 + 2) = *(_OWORD *)(v0 + 1056);
    *((void *)v115 + 6) = *(void *)(v0 + 1072);
    *(void *)((char *)v114 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_registry) = v106;
    uint64_t v135 = v114;
    unint64_t v117 = (void *)((char *)v114 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_sessionExpired);
    *unint64_t v117 = &unk_269269408;
    v117[1] = v153;
    sub_247997AC0(v107, type metadata accessor for SessionRegistry.SessionInfo);
    goto LABEL_31;
  }
  uint64_t v50 = *(void *)(v0 + 1416);
  uint64_t v51 = *(void *)(v0 + 1408);
  uint64_t v52 = *(void *)(v0 + 1400);
  (*(void (**)(void, void, uint64_t))(v51 + 32))(*(void *)(v0 + 1424), *(void *)(v0 + 1392), v52);
  sub_2479983B0();
  char v53 = sub_247998360();
  uint64_t v54 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
  *(void *)(v0 + 1592) = v54;
  *(void *)(v0 + 1600) = (v51 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  uint64_t v55 = v50;
  uint64_t v56 = v54;
  v54(v55, v52);
  if ((v53 & 1) == 0)
  {
    v56(*(void *)(v0 + 1424), *(void *)(v0 + 1400));
    sub_2479203E0((id *)(v0 + 16));
    goto LABEL_51;
  }
  unint64_t v133 = v56;
  if (qword_269266AA0 != -1) {
    swift_once();
  }
  unint64_t v152 = (id *)(v0 + 16);
  uint64_t v57 = sub_247999030();
  __swift_project_value_buffer(v57, (uint64_t)qword_26927FC68);
  os_log_type_t v58 = sub_247999010();
  os_log_type_t v59 = sub_2479996B0();
  if (os_log_type_enabled(v58, v59))
  {
    uint64_t v60 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v60 = 0;
    _os_log_impl(&dword_247896000, v58, v59, "Existing session has expired.", v60, 2u);
    MEMORY[0x24C564070](v60, -1, -1);
  }
  int v61 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 1552);
  uint64_t v62 = *(void *)(v0 + 1544);
  uint64_t v63 = *(void *)(v0 + 1536);
  uint64_t v64 = *(void *)(v0 + 1432);
  uint64_t v146 = *(void *)(v0 + 1272);
  uint64_t v149 = *(void **)(v0 + 1512);
  uint64_t v65 = *(void *)(v0 + 1264);
  uint64_t v139 = *(void *)(v0 + 1280);
  uint64_t v143 = *(void *)(v0 + 1256);

  v61(v64, 1, 1, v62);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v66 = sub_2479994F0();
  uint64_t v67 = (void *)swift_allocObject();
  uint64_t v68 = MEMORY[0x263F8F500];
  v67[2] = v66;
  v67[3] = v68;
  v67[4] = v143;
  v67[5] = v65;
  v67[6] = v63;
  sub_24794C41C(v64, (uint64_t)&unk_269269420, (uint64_t)v67);
  swift_release();
  if ((*v149 != v146 || v149[1] != v139) && (sub_247999B80() & 1) == 0)
  {
    uint64_t v118 = *(void *)(v0 + 1512);
    uint64_t v119 = *(void *)(v0 + 1424);
    uint64_t v120 = *(void *)(v0 + 1400);
    uint64_t v42 = (id *)(v0 + 16);
    uint64_t v135 = sub_2479937BC(*(void *)(v0 + 1256), *(void *)(v0 + 1264), *(void *)(v0 + 1272), *(void *)(v0 + 1280), *(void *)(v0 + 1312), (uint64_t)v152, (uint64_t)&unk_269269408, *(void *)(v0 + 1528));
    swift_release();
    v133(v119, v120);
    uint64_t v43 = v118;
    goto LABEL_29;
  }
  uint64_t v69 = *(void *)(v0 + 1520);
  sub_2479203E0(v152);
  return MEMORY[0x270FA2498](sub_24798DB1C, v69, 0);
}

uint64_t sub_24798DB1C()
{
  uint64_t v5 = v0;
  uint64_t v1 = *(void *)(v0 + 1280);
  uint64_t v2 = *(void *)(v0 + 1272);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_247966DA4(&v4, v2, v1);
  swift_endAccess();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24798DBE0, 0, 0);
}

uint64_t sub_24798DBE0()
{
  uint64_t v12 = (void (*)(uint64_t, uint64_t))v0[199];
  uint64_t v13 = v0[189];
  uint64_t v11 = v0[178];
  uint64_t v1 = v0[175];
  uint64_t v2 = v0[171];
  uint64_t v3 = v0[170];
  uint64_t v4 = v0[169];
  uint64_t v5 = v0[168];
  uint64_t v6 = v0[167];
  uint64_t v7 = v0[166];
  sub_247999800();
  swift_bridgeObjectRelease();
  sub_2479961B8(&qword_2692684E8, MEMORY[0x263F07490]);
  sub_247999B50();
  sub_2479993D0();
  swift_bridgeObjectRelease();
  sub_2479984B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v5, v2, v4);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v5, *MEMORY[0x263F7F7F0], v7);
  sub_2479961B8(&qword_269266BF0, MEMORY[0x263F7F830]);
  swift_allocError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v8, v5, v7);
  swift_willThrow();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v12(v11, v1);
  sub_247997AC0(v13, type metadata accessor for SessionRegistry.SessionInfo);
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
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_24798DF18(uint64_t a1, uint64_t a2, int *a3, uint64_t a4)
{
  v4[77] = a4;
  v4[76] = a3;
  v4[75] = a2;
  v4[74] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269266F78);
  v4[78] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  v4[79] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268810);
  uint64_t v6 = swift_task_alloc();
  v4[80] = v6;
  uint64_t v9 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v7 = (void *)swift_task_alloc();
  v4[81] = v7;
  void *v7 = v4;
  v7[1] = sub_24798E09C;
  return v9(v6);
}

uint64_t sub_24798E09C()
{
  *(void *)(*(void *)v1 + 656) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24798E300;
  }
  else {
    uint64_t v2 = sub_24798E1B0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24798E1B0()
{
  uint64_t v1 = v0[80];
  uint64_t v2 = v0[79];
  uint64_t v3 = v0[75];
  uint64_t v4 = v0[74];
  uint64_t v5 = sub_247999520();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
  sub_2479030DC(v3, (uint64_t)(v0 + 2));
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  memcpy(v6 + 4, v0 + 2, 0x1E9uLL);
  sub_24794C41C(v2, (uint64_t)&unk_2692693F0, (uint64_t)v6);
  swift_release();
  sub_2478F5268(v1, v4, &qword_269268810);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_24798E300()
{
  uint64_t v1 = *(void **)(v0 + 656);
  *(void *)(v0 + 584) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269266BD8);
  if (swift_dynamicCast())
  {
    uint64_t v3 = *(void *)(v0 + 560);
    if (*(void *)(v0 + 552))
    {
      swift_bridgeObjectRetain_n();
      char v4 = sub_2478ED30C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2478A1B10(v3);
      swift_bridgeObjectRelease();
      if (v4 != 25)
      {
        if (sub_2478E0878(v4) == 0x78655F6E656B6F74 && v5 == 0xED00006465726970)
        {
          swift_bridgeObjectRelease();
LABEL_12:

          if (qword_269266AA0 != -1) {
            swift_once();
          }
          uint64_t v9 = sub_247999030();
          __swift_project_value_buffer(v9, (uint64_t)qword_26927FC68);
          uint64_t v10 = sub_247999010();
          os_log_type_t v11 = sub_2479996B0();
          if (os_log_type_enabled(v10, v11))
          {
            uint64_t v12 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v12 = 0;
            _os_log_impl(&dword_247896000, v10, v11, "Access token expired. Attempting refresh+retry.", v12, 2u);
            MEMORY[0x24C564070](v12, -1, -1);
          }

          uint64_t v13 = (void *)swift_task_alloc();
          *(void *)(v0 + 664) = v13;
          *uint64_t v13 = v0;
          v13[1] = sub_24798E658;
          uint64_t v14 = *(void *)(v0 + 624);
          return sub_2479061E4(v14);
        }
        char v8 = sub_247999B80();
        swift_bridgeObjectRelease();
        if (v8) {
          goto LABEL_12;
        }
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2478A1B10(v3);
    }
  }

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_24798E658()
{
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v1 = sub_24798E89C;
  }
  else
  {
    uint64_t v1 = sub_24798E770;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_24798E770()
{
  uint64_t v1 = v0[78];
  uint64_t v2 = type metadata accessor for OpenAIAuthenticator.Credentials(0);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 0, 1, v2);
  uint64_t v3 = (int *)v0[76];
  sub_2478A1A1C(v0[78], &qword_269266F78);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v3 + *v3);
  char v4 = (void *)swift_task_alloc();
  v0[84] = v4;
  *char v4 = v0;
  v4[1] = sub_24798E9C8;
  uint64_t v5 = v0[74];
  return v7(v5);
}

uint64_t sub_24798E89C()
{
  uint64_t v1 = v0[78];
  uint64_t v2 = type metadata accessor for OpenAIAuthenticator.Credentials(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = (int *)v0[76];
  sub_2478A1A1C(v0[78], &qword_269266F78);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v3 + *v3);
  char v4 = (void *)swift_task_alloc();
  v0[84] = v4;
  *char v4 = v0;
  v4[1] = sub_24798E9C8;
  uint64_t v5 = v0[74];
  return v7(v5);
}

uint64_t sub_24798E9C8()
{
  *(void *)(*(void *)v1 + 680) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24798EB60;
  }
  else {
    uint64_t v2 = sub_24798EADC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24798EADC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24798EB60()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24798EBEC(uint64_t a1, uint64_t a2, int *a3, uint64_t a4)
{
  v4[77] = a4;
  v4[76] = a3;
  v4[75] = a2;
  v4[74] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269266F78);
  v4[78] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  v4[79] = swift_task_alloc();
  uint64_t v8 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v6 = (void *)swift_task_alloc();
  v4[80] = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_24798ED30;
  return v8();
}

uint64_t sub_24798ED30()
{
  *(void *)(*(void *)v1 + 648) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24798EF64;
  }
  else {
    uint64_t v2 = sub_24798EE44;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24798EE44()
{
  uint64_t v1 = v0[79];
  uint64_t v2 = v0[75];
  uint64_t v3 = sub_247999520();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v1, 1, 1, v3);
  sub_2479030DC(v2, (uint64_t)(v0 + 2));
  uint64_t v4 = (void *)swift_allocObject();
  v4[2] = 0;
  v4[3] = 0;
  memcpy(v4 + 4, v0 + 2, 0x1E9uLL);
  sub_24794C41C(v1, (uint64_t)&unk_269269480, (uint64_t)v4);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_24798EF64()
{
  uint64_t v1 = *(void **)(v0 + 648);
  *(void *)(v0 + 584) = v1;
  id v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269266BD8);
  if (swift_dynamicCast())
  {
    uint64_t v3 = *(void *)(v0 + 560);
    if (*(void *)(v0 + 552))
    {
      swift_bridgeObjectRetain_n();
      char v4 = sub_2478ED30C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2478A1B10(v3);
      swift_bridgeObjectRelease();
      if (v4 != 25)
      {
        if (sub_2478E0878(v4) == 0x78655F6E656B6F74 && v5 == 0xED00006465726970)
        {
          swift_bridgeObjectRelease();
LABEL_12:

          if (qword_269266AA0 != -1) {
            swift_once();
          }
          uint64_t v9 = sub_247999030();
          __swift_project_value_buffer(v9, (uint64_t)qword_26927FC68);
          uint64_t v10 = sub_247999010();
          os_log_type_t v11 = sub_2479996B0();
          if (os_log_type_enabled(v10, v11))
          {
            uint64_t v12 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v12 = 0;
            _os_log_impl(&dword_247896000, v10, v11, "Access token expired. Attempting refresh+retry.", v12, 2u);
            MEMORY[0x24C564070](v12, -1, -1);
          }

          uint64_t v13 = (void *)swift_task_alloc();
          *(void *)(v0 + 656) = v13;
          *uint64_t v13 = v0;
          v13[1] = sub_24798F2B0;
          uint64_t v14 = *(void *)(v0 + 624);
          return sub_2479061E4(v14);
        }
        char v8 = sub_247999B80();
        swift_bridgeObjectRelease();
        if (v8) {
          goto LABEL_12;
        }
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2478A1B10(v3);
    }
  }

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_24798F2B0()
{
  swift_task_dealloc();
  if (v0)
  {

    uint64_t v1 = sub_24798F4F4;
  }
  else
  {
    uint64_t v1 = sub_24798F3C8;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_24798F3C8()
{
  uint64_t v1 = v0[78];
  uint64_t v2 = type metadata accessor for OpenAIAuthenticator.Credentials(0);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 0, 1, v2);
  uint64_t v3 = (int *)v0[76];
  sub_2478A1A1C(v0[78], &qword_269266F78);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v3 + *v3);
  char v4 = (void *)swift_task_alloc();
  v0[83] = v4;
  *char v4 = v0;
  v4[1] = sub_24798F620;
  uint64_t v5 = v0[74];
  return v7(v5);
}

uint64_t sub_24798F4F4()
{
  uint64_t v1 = v0[78];
  uint64_t v2 = type metadata accessor for OpenAIAuthenticator.Credentials(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = (int *)v0[76];
  sub_2478A1A1C(v0[78], &qword_269266F78);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v3 + *v3);
  char v4 = (void *)swift_task_alloc();
  v0[83] = v4;
  *char v4 = v0;
  v4[1] = sub_24798F620;
  uint64_t v5 = v0[74];
  return v7(v5);
}

uint64_t sub_24798F620()
{
  *(void *)(*(void *)v1 + 672) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24798F7AC;
  }
  else {
    uint64_t v2 = sub_24798F734;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24798F734()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24798F7AC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24798F824@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char *a16)
{
  unint64_t v138 = a8;
  uint64_t v149 = a4;
  uint64_t v150 = a5;
  uint64_t v147 = a3;
  uint64_t v133 = a1;
  uint64_t v130 = a9;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269130);
  unint64_t v123 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v106 = v20;
  uint64_t v145 = (uint64_t)&v103 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = (void (*)(char *, uint64_t))sub_2479986A0();
  uint64_t v124 = *((void *)v144 - 1);
  MEMORY[0x270FA5388](v144);
  unint64_t v122 = v21;
  uint64_t v143 = (char *)&v103 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269318);
  unint64_t v119 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22 - 8);
  unint64_t v120 = v23;
  uint64_t v142 = (uint64_t)&v103 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269269160);
  unint64_t v117 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24 - 8);
  unint64_t v118 = v25;
  uint64_t v141 = (uint64_t)&v103 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = sub_247998400();
  uint64_t v121 = *(void *)(v140 - 8);
  MEMORY[0x270FA5388](v140);
  unint64_t v116 = v26;
  uint64_t v139 = (char *)&v103 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F58);
  uint64_t v127 = *(void *)(v129 - 8);
  uint64_t v27 = MEMORY[0x270FA5388](v129);
  uint64_t v125 = v28;
  uint64_t v126 = (char *)&v103 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v146 = (char *)&v103 - v29;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269266F78);
  MEMORY[0x270FA5388](v30 - 8);
  os_log_type_t v132 = (char *)&v103 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  uint64_t v113 = *(void *)(v32 - 8);
  uint64_t v33 = MEMORY[0x270FA5388](v32 - 8);
  uint64_t v136 = (uint64_t)&v103 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  uint64_t v37 = (char *)&v103 - v36;
  uint64_t v115 = v38;
  MEMORY[0x270FA5388](v35);
  uint64_t v131 = (uint64_t)&v103 - v39;
  uint64_t v40 = sub_2479983D0();
  uint64_t v152 = *(void *)(v40 - 8);
  uint64_t v153 = v40;
  uint64_t v41 = MEMORY[0x270FA5388](v40);
  uint64_t v137 = (char *)&v103 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = v42;
  MEMORY[0x270FA5388](v41);
  uint64_t v44 = (char *)&v103 - v43;
  if (qword_269266AA0 != -1) {
    swift_once();
  }
  uint64_t v45 = sub_247999030();
  __swift_project_value_buffer(v45, (uint64_t)qword_26927FC68);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v46 = sub_247999010();
  os_log_type_t v47 = sub_2479996B0();
  BOOL v48 = os_log_type_enabled(v46, v47);
  unint64_t v148 = a6;
  unint64_t v128 = a2;
  uint64_t v134 = v44;
  uint64_t v107 = v37;
  if (v48)
  {
    unint64_t v49 = a6;
    uint64_t v50 = swift_slowAlloc();
    uint64_t v51 = (void *)swift_slowAlloc();
    uint64_t v151 = a7;
    uint64_t v52 = v51;
    v156[0] = v51;
    *(_DWORD *)uint64_t v50 = 136315650;
    v155[0] = sub_247918FF0(0xD000000000000092, 0x80000002479A7B20, (uint64_t *)v156);
    sub_247999720();
    *(_WORD *)(v50 + 12) = 2080;
    swift_bridgeObjectRetain();
    v155[0] = sub_247918FF0(v133, a2, (uint64_t *)v156);
    sub_247999720();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v50 + 22) = 2080;
    swift_bridgeObjectRetain();
    v155[0] = sub_247918FF0(v150, v49, (uint64_t *)v156);
    uint64_t v44 = v134;
    sub_247999720();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247896000, v46, v47, "%s\n  useCaseID: %s\n  sessionID: %s", (uint8_t *)v50, 0x20u);
    swift_arrayDestroy();
    char v53 = v52;
    a7 = v151;
    MEMORY[0x24C564070](v53, -1, -1);
    MEMORY[0x24C564070](v50, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v54 = (uint64_t)v132;
  if (qword_269266A88 != -1) {
    swift_once();
  }
  uint64_t v112 = __swift_project_value_buffer(v45, (uint64_t)qword_26927FC20);
  uint64_t v55 = sub_247999010();
  os_log_type_t v56 = sub_2479996B0();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v57 = 0;
    _os_log_impl(&dword_247896000, v55, v56, "#tokenperf: Starting streaming complete prompt request", v57, 2u);
    MEMORY[0x24C564070](v57, -1, -1);
  }

  sub_2479983C0();
  uint64_t v135 = swift_allocObject();
  *(void *)(v135 + 16) = 0;
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F60);
  uint64_t v151 = swift_allocBox();
  uint64_t v59 = v58;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F68);
  uint64_t v61 = *(void *)(v60 - 8);
  uint64_t v109 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v61 + 56);
  uint64_t v110 = v60;
  uint64_t v108 = v61 + 56;
  uint64_t v62 = v109(v59, 1, 1);
  if (*(void *)(v154 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_makeAuthenticator)) {
    (*(void (**)(void *__return_ptr, uint64_t))(v154
  }
                                                          + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_makeAuthenticator))(v155, v62);
  else {
    memset(v155, 0, 489);
  }
  uint64_t v63 = a14;
  uint64_t v64 = a11;
  uint64_t v65 = a12;
  uint64_t v66 = v131;
  sub_2478E6A48(v138, v131, &qword_269268C10);
  if (v155[0])
  {
    sub_2478A1A1C(v66, &qword_269268C10);
    memcpy(v156, v155, 0x1E9uLL);
  }
  else
  {
    uint64_t v104 = a11;
    uint64_t v105 = a12;
    uint64_t v67 = a7;
    uint64_t v68 = (uint64_t)v107;
    sub_2478E6A48(v66, (uint64_t)v107, &qword_269268C10);
    uint64_t v69 = sub_247998B20();
    uint64_t v70 = *(void *)(v69 - 8);
    int v71 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v70 + 48))(v68, 1, v69);
    if (v71 == 1)
    {
      sub_2478A1A1C(v68, &qword_269268C10);
      uint64_t v72 = 0;
    }
    else
    {
      unsigned int v73 = sub_247998B10();
      (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v68, v69);
      uint64_t v72 = v73;
      uint64_t v66 = v131;
    }
    a7 = v67;
    uint64_t v54 = (uint64_t)v132;
    LOBYTE(v156[0]) = v71 == 1;
    sub_247902E04(v72 | ((unint64_t)(v71 == 1) << 32), (uint64_t)v156);
    sub_2478A1A1C(v66, &qword_269268C10);
    sub_2478A1A1C((uint64_t)v155, &qword_2692693A0);
    uint64_t v63 = a14;
    uint64_t v64 = v104;
    uint64_t v65 = v105;
  }
  os_log_type_t v132 = a16;
  uint64_t v131 = a15;
  uint64_t v107 = (char *)a13;
  OpenAIAuthenticator.credentials.getter(v54);
  uint64_t v74 = type metadata accessor for OpenAIAuthenticator.Credentials(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 48))(v54, 1, v74) == 1)
  {
    sub_2478A1A1C(v54, &qword_269266F78);
    uint64_t v104 = 0;
    uint64_t v105 = 0;
  }
  else
  {
    uint64_t v75 = OpenAIAuthenticator.Credentials.credentialsID.getter();
    uint64_t v104 = v76;
    uint64_t v105 = v75;
    sub_247997AC0(v54, type metadata accessor for OpenAIAuthenticator.Credentials);
  }
  sub_2479030DC((uint64_t)v156, (uint64_t)v155);
  uint64_t v77 = v121;
  (*(void (**)(char *, uint64_t, uint64_t))(v121 + 16))(v139, a7, v140);
  sub_2478E6A48(v138, v136, &qword_269268C10);
  sub_2478E6A48(a10, v141, &qword_269269160);
  sub_2478E6A48(v64, v142, &qword_269269318);
  uint64_t v78 = v124;
  (*(void (**)(char *, uint64_t, void (*)(char *, uint64_t)))(v124 + 16))(v143, v65, v144);
  sub_2478E6A48(v63, v145, &qword_269269130);
  uint64_t v79 = v152;
  (*(void (**)(char *, char *, uint64_t))(v152 + 16))(v137, v44, v153);
  unint64_t v80 = (*(unsigned __int8 *)(v77 + 80) + 592) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80);
  unint64_t v81 = (v116 + *(unsigned __int8 *)(v113 + 80) + v80) & ~(unint64_t)*(unsigned __int8 *)(v113 + 80);
  unint64_t v82 = (v115 + *(unsigned __int8 *)(v117 + 80) + v81) & ~(unint64_t)*(unsigned __int8 *)(v117 + 80);
  unint64_t v116 = (v118 + *(unsigned __int8 *)(v119 + 80) + v82) & ~(unint64_t)*(unsigned __int8 *)(v119 + 80);
  unint64_t v118 = (v120 + *(unsigned __int8 *)(v78 + 80) + v116) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80);
  unint64_t v122 = (v122 + v118 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v119 = (*(unsigned __int8 *)(v123 + 80) + v122 + 8) & ~(unint64_t)*(unsigned __int8 *)(v123 + 80);
  unint64_t v138 = (v106 + v119 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v123 = (v138 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v120 = (v123 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v117 = (*(unsigned __int8 *)(v79 + 80) + v120 + 8) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
  uint64_t v83 = (char *)swift_allocObject();
  uint64_t v84 = v154;
  *((void *)v83 + 2) = v151;
  *((void *)v83 + 3) = v84;
  memcpy(v83 + 32, v155, 0x1E9uLL);
  unint64_t v85 = v148;
  *((void *)v83 + 66) = v147;
  uint64_t v86 = v150;
  *((void *)v83 + 67) = v149;
  *((void *)v83 + 68) = v86;
  *((void *)v83 + 69) = v85;
  *((void *)v83 + 70) = v105;
  *((void *)v83 + 71) = v104;
  *((void *)v83 + 72) = v133;
  *((void *)v83 + 73) = v128;
  (*(void (**)(char *, char *, uint64_t))(v77 + 32))(&v83[v80], v139, v140);
  sub_2478F5268(v136, (uint64_t)&v83[v81], &qword_269268C10);
  sub_2478F5268(v141, (uint64_t)&v83[v82], &qword_269269160);
  sub_2478F5268(v142, (uint64_t)&v83[v116], &qword_269269318);
  (*(void (**)(char *, char *, void (*)(char *, uint64_t)))(v78 + 32))(&v83[v118], v143, v144);
  *(void *)&v83[v122] = v107;
  sub_2478F5268(v145, (uint64_t)&v83[v119], &qword_269269130);
  uint64_t v87 = v132;
  unint64_t v88 = v137;
  *(void *)&v83[v138] = v131;
  *(void *)&v83[v123] = v87;
  *(void *)&v83[v120] = v135;
  (*(void (**)(char *, char *, uint64_t))(v152 + 32))(&v83[v117], v88, v153);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268C58);
  uint64_t v89 = v126;
  sub_2479995F0();
  uint64_t v90 = (uint64_t)v146;
  sub_24794C7A0((uint64_t)"StreamingPromptCompletion", 25, 2, v112, (uint64_t)v146);
  uint64_t v91 = v127;
  uint64_t v144 = *(void (**)(char *, uint64_t))(v127 + 8);
  uint64_t v92 = v129;
  v144(v89, v129);
  uint64_t v143 = (char *)swift_allocBox();
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v109)(v93, 1, 1, v110);
  (*(void (**)(char *, uint64_t, uint64_t))(v91 + 16))(v89, v90, v92);
  unint64_t v94 = (*(unsigned __int8 *)(v91 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v91 + 80);
  unint64_t v95 = (v125 + v94 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v96 = (v95 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v97 = swift_allocObject();
  *(void *)(v97 + 16) = v143;
  (*(void (**)(unint64_t, char *, uint64_t))(v91 + 32))(v97 + v94, v89, v92);
  unint64_t v98 = (void *)(v97 + v95);
  uint64_t v99 = v149;
  unint64_t v100 = v148;
  *unint64_t v98 = v150;
  v98[1] = v100;
  *(void *)(v97 + v96) = v154;
  uint64_t v101 = (void *)(v97 + ((v96 + 15) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v101 = v147;
  v101[1] = v99;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_2479995F0();
  v144(v146, v92);
  sub_2479203E0(v156);
  (*(void (**)(char *, uint64_t))(v152 + 8))(v134, v153);
  swift_release();
  return swift_release();
}

uint64_t sub_247990850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 952) = v27;
  *(_OWORD *)(v8 + 936) = v26;
  *(_OWORD *)(v8 + 920) = v25;
  *(_OWORD *)(v8 + 904) = v24;
  *(_OWORD *)(v8 + 888) = v23;
  *(_OWORD *)(v8 + 872) = v22;
  *(_OWORD *)(v8 + 856) = v21;
  *(_OWORD *)(v8 + 840) = v20;
  *(void *)(v8 + 832) = a8;
  *(void *)(v8 + 824) = a7;
  *(void *)(v8 + 816) = a6;
  *(void *)(v8 + 808) = a5;
  *(void *)(v8 + 800) = a4;
  *(void *)(v8 + 792) = a3;
  *(void *)(v8 + 784) = a2;
  *(void *)(v8 + 776) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  *(void *)(v8 + 960) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C20);
  *(void *)(v8 + 968) = swift_task_alloc();
  *(void *)(v8 + 976) = _s15InstrumentationVMa();
  *(void *)(v8 + 984) = swift_task_alloc();
  *(void *)(v8 + 992) = swift_task_alloc();
  uint64_t v9 = sub_2479983D0();
  *(void *)(v8 + 1000) = v9;
  *(void *)(v8 + 1008) = *(void *)(v9 - 8);
  *(void *)(v8 + 1016) = swift_task_alloc();
  *(void *)(v8 + 1024) = swift_task_alloc();
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269269130) - 8);
  *(void *)(v8 + 1032) = v10;
  *(void *)(v8 + 1040) = *(void *)(v10 + 64);
  *(void *)(v8 + 1048) = swift_task_alloc();
  uint64_t v11 = sub_2479986A0();
  *(void *)(v8 + 1056) = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  *(void *)(v8 + 1064) = v12;
  *(void *)(v8 + 1072) = *(void *)(v12 + 64);
  *(void *)(v8 + 1080) = swift_task_alloc();
  uint64_t v13 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269269318) - 8);
  *(void *)(v8 + 1088) = v13;
  *(void *)(v8 + 1096) = *(void *)(v13 + 64);
  *(void *)(v8 + 1104) = swift_task_alloc();
  uint64_t v14 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269269160) - 8);
  *(void *)(v8 + 1112) = v14;
  *(void *)(v8 + 1120) = *(void *)(v14 + 64);
  *(void *)(v8 + 1128) = swift_task_alloc();
  uint64_t v15 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268C10) - 8);
  *(void *)(v8 + 1136) = v15;
  *(void *)(v8 + 1144) = *(void *)(v15 + 64);
  *(void *)(v8 + 1152) = swift_task_alloc();
  uint64_t v16 = sub_247998400();
  *(void *)(v8 + 1160) = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  *(void *)(v8 + 1168) = v17;
  *(void *)(v8 + 1176) = *(void *)(v17 + 64);
  *(void *)(v8 + 1184) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268F60);
  *(void *)(v8 + 1192) = swift_task_alloc();
  *(void *)(v8 + 1200) = swift_projectBox();
  return MEMORY[0x270FA2498](sub_247990CC8, 0, 0);
}

uint64_t sub_247990CC8()
{
  uint64_t v96 = v0;
  uint64_t v1 = *(void *)(v0 + 1200);
  uint64_t v2 = *(void *)(v0 + 1192);
  swift_beginAccess();
  sub_2478E6A48(v1, v2, &qword_269268F60);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F68);
  *(void *)(v0 + 1208) = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  *(void *)(v0 + 1216) = v5;
  *(void *)(v0 + 1224) = (v4 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  LODWORD(v1) = v5(v2, 1, v3);
  sub_2478A1A1C(v2, &qword_269268F60);
  if (v1 == 1)
  {
    uint64_t v6 = *(void *)(v0 + 1184);
    uint64_t v7 = *(void *)(v0 + 1168);
    uint64_t v8 = *(void *)(v0 + 1160);
    uint64_t v79 = v8;
    uint64_t v9 = *(void *)(v0 + 1152);
    uint64_t v62 = *(void *)(v0 + 1176);
    uint64_t v63 = *(void *)(v0 + 1144);
    uint64_t v10 = *(void *)(v0 + 1128);
    uint64_t v66 = *(void *)(v0 + 1120);
    uint64_t v59 = *(void *)(v0 + 1136);
    uint64_t v60 = *(void *)(v0 + 1112);
    uint64_t v11 = *(void *)(v0 + 1104);
    uint64_t v76 = v10;
    uint64_t v77 = v11;
    uint64_t v69 = *(void *)(v0 + 1096);
    uint64_t v61 = *(void *)(v0 + 1088);
    uint64_t v88 = *(void *)(v0 + 1080);
    uint64_t v67 = *(void *)(v0 + 1072);
    uint64_t v87 = *(void *)(v0 + 1064);
    uint64_t v12 = *(void *)(v0 + 1056);
    uint64_t v80 = v12;
    uint64_t v89 = *(void *)(v0 + 1048);
    uint64_t v72 = *(void *)(v0 + 1040);
    uint64_t v64 = *(void *)(v0 + 1032);
    uint64_t v85 = *(void *)(v0 + 928);
    uint64_t v86 = *(void *)(v0 + 936);
    uint64_t v58 = *(void *)(v0 + 920);
    uint64_t v84 = *(void *)(v0 + 912);
    uint64_t v56 = *(void *)(v0 + 896);
    uint64_t v57 = *(void *)(v0 + 904);
    uint64_t v55 = *(void *)(v0 + 888);
    uint64_t v13 = *(void *)(v0 + 880);
    uint64_t v14 = *(void *)(v0 + 872);
    uint64_t v81 = *(void *)(v0 + 856);
    uint64_t v82 = *(void *)(v0 + 864);
    uint64_t v93 = *(void *)(v0 + 848);
    uint64_t v78 = *(void *)(v0 + 840);
    uint64_t v91 = *(void *)(v0 + 832);
    uint64_t v74 = *(void *)(v0 + 816);
    uint64_t v75 = *(void *)(v0 + 824);
    uint64_t v71 = *(void *)(v0 + 808);
    uint64_t v90 = *(void *)(v0 + 792);
    uint64_t v83 = *(void *)(v0 + 784);
    sub_2479030DC(*(void *)(v0 + 800), v0 + 16);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v14, v8);
    sub_2478E6A48(v13, v9, &qword_269268C10);
    sub_2478E6A48(v55, v10, &qword_269269160);
    sub_2478E6A48(v56, v11, &qword_269269318);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v87 + 16))(v88, v57, v12);
    sub_2478E6A48(v58, v89, &qword_269269130);
    unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 584) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    unint64_t v16 = (v62 + *(unsigned __int8 *)(v59 + 80) + v15) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
    unint64_t v17 = (v63 + *(unsigned __int8 *)(v60 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
    unint64_t v18 = (v66 + *(unsigned __int8 *)(v61 + 80) + v17) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80);
    unint64_t v19 = (v69 + *(unsigned __int8 *)(v87 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v87 + 80);
    unint64_t v70 = (v67 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v73 = (v72 + ((*(unsigned __int8 *)(v64 + 80) + v70 + 8) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v68 = (v73 + 15) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v65 = (*(unsigned __int8 *)(v64 + 80) + v70 + 8) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
    long long v20 = (char *)swift_allocObject();
    *(void *)(v0 + 1232) = v20;
    *((void *)v20 + 2) = v90;
    *((void *)v20 + 3) = v71;
    *((void *)v20 + 4) = v74;
    *((void *)v20 + 5) = v75;
    *((void *)v20 + 6) = v91;
    *((void *)v20 + 7) = v78;
    *((void *)v20 + 8) = v93;
    memcpy(v20 + 72, (const void *)(v0 + 16), 0x1E9uLL);
    *((void *)v20 + 71) = v81;
    *((void *)v20 + 72) = v82;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(&v20[v15], v6, v79);
    sub_2478F5268(v9, (uint64_t)&v20[v16], &qword_269268C10);
    sub_2478F5268(v76, (uint64_t)&v20[v17], &qword_269269160);
    sub_2478F5268(v77, (uint64_t)&v20[v18], &qword_269269318);
    (*(void (**)(char *, uint64_t, uint64_t))(v87 + 32))(&v20[v19], v88, v80);
    *(void *)&v20[v70] = v84;
    sub_2478F5268(v89, (uint64_t)&v20[v65], &qword_269269130);
    *(void *)&v20[v73] = v85;
    *(void *)&v20[v68] = v86;
    *(void *)&v20[(v68 + 15) & 0xFFFFFFFFFFFFFFF8] = v83;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    long long v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 1240) = v21;
    *long long v21 = v0;
    v21[1] = sub_2479916E4;
    uint64_t v22 = *(void *)(v0 + 800);
    return sub_24798EBEC((uint64_t)v21, v22, dword_269269460, (uint64_t)v20);
  }
  else
  {
    long long v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 1216);
    uint64_t v25 = *(void *)(v0 + 1208);
    uint64_t v26 = *(void *)(v0 + 1200);
    swift_beginAccess();
    if (v24(v26, 1, v25))
    {
      swift_endAccess();
      *(void *)(v0 + 544) = 0;
      *(_OWORD *)(v0 + 512) = 0u;
      *(_OWORD *)(v0 + 528) = 0u;
      uint64_t v27 = *(void *)(v0 + 944);
      sub_2478A1A1C(v0 + 512, &qword_269268F80);
      sub_2479983C0();
      sub_247998340();
      double v29 = v28;
      sub_247998340();
      double v31 = v29 - v30;
      swift_beginAccess();
      *(double *)(v0 + 760) = (double)*(uint64_t *)(v27 + 16) / v31;
      sub_2479979E4();
      uint64_t v32 = sub_2479992A0();
      unint64_t v34 = v33;
      if (qword_269266A88 != -1) {
        swift_once();
      }
      uint64_t v35 = sub_247999030();
      *(void *)(v0 + 1272) = __swift_project_value_buffer(v35, (uint64_t)qword_26927FC20);
      swift_retain_n();
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_247999010();
      os_log_type_t v37 = sub_2479996B0();
      BOOL v38 = os_log_type_enabled(v36, v37);
      uint64_t v39 = *(void *)(v0 + 944);
      if (v38)
      {
        os_log_type_t v92 = v37;
        uint64_t v40 = swift_slowAlloc();
        uint64_t v94 = swift_slowAlloc();
        uint64_t v95 = v94;
        *(_DWORD *)uint64_t v40 = 134218498;
        *(double *)(v0 + 752) = v31;
        sub_247999720();
        *(_WORD *)(v40 + 12) = 2048;
        swift_beginAccess();
        uint64_t v41 = *(void *)(v39 + 16);
        swift_release();
        *(void *)(v0 + 736) = v41;
        sub_247999720();
        swift_release();
        *(_WORD *)(v40 + 22) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 744) = sub_247918FF0(v32, v34, &v95);
        sub_247999720();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_247896000, v36, v92, "#tokenperf: Received last token. Total: %f. %ld tokens at @ %s tokens per second", (uint8_t *)v40, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x24C564070](v94, -1, -1);
        MEMORY[0x24C564070](v40, -1, -1);
      }
      else
      {
        swift_release_n();
        swift_bridgeObjectRelease_n();
      }

      uint64_t v44 = *(void *)(v0 + 960);
      uint64_t v45 = *(void *)(v0 + 816);
      uint64_t v46 = *(void *)(v0 + 808);
      uint64_t v47 = *(void *)(*(void *)(v0 + 792) + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_registry);
      uint64_t v48 = sub_247999520();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v44, 1, 1, v48);
      sub_247999500();
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v49 = sub_2479994F0();
      uint64_t v50 = (void *)swift_allocObject();
      uint64_t v51 = MEMORY[0x263F8F500];
      v50[2] = v49;
      uint64_t v50[3] = v51;
      v50[4] = v46;
      v50[5] = v45;
      v50[6] = v47;
      uint64_t v52 = sub_24794C41C(v44, (uint64_t)&unk_269269478, (uint64_t)v50);
      *(void *)(v0 + 1280) = v52;
      char v53 = (void *)swift_task_alloc();
      *(void *)(v0 + 1288) = v53;
      *char v53 = v0;
      v53[1] = sub_2479926A8;
      uint64_t v54 = MEMORY[0x263F8EE60] + 8;
      return MEMORY[0x270FA1FD0](v53, v52, v54);
    }
    else
    {
      uint64_t v42 = (void *)swift_task_alloc();
      *(void *)(v0 + 1256) = v42;
      void *v42 = v0;
      v42[1] = sub_247991D08;
      uint64_t v43 = *(void *)(v0 + 1208);
      return MEMORY[0x270FA2100](v0 + 512, v43);
    }
  }
}

uint64_t sub_2479916E4()
{
  *(void *)(*(void *)v1 + 1248) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_247992980;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_247991800;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247991800()
{
  uint64_t v36 = v0;
  uint64_t v1 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 1216);
  uint64_t v2 = *(void *)(v0 + 1208);
  uint64_t v3 = *(void *)(v0 + 1200);
  swift_beginAccess();
  if (v1(v3, 1, v2))
  {
    swift_endAccess();
    *(void *)(v0 + 544) = 0;
    *(_OWORD *)(v0 + 512) = 0u;
    *(_OWORD *)(v0 + 528) = 0u;
    uint64_t v4 = *(void *)(v0 + 944);
    sub_2478A1A1C(v0 + 512, &qword_269268F80);
    sub_2479983C0();
    sub_247998340();
    double v6 = v5;
    sub_247998340();
    double v8 = v6 - v7;
    swift_beginAccess();
    *(double *)(v0 + 760) = (double)*(uint64_t *)(v4 + 16) / v8;
    sub_2479979E4();
    uint64_t v9 = sub_2479992A0();
    unint64_t v11 = v10;
    if (qword_269266A88 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_247999030();
    *(void *)(v0 + 1272) = __swift_project_value_buffer(v12, (uint64_t)qword_26927FC20);
    swift_retain_n();
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_247999010();
    os_log_type_t v14 = sub_2479996B0();
    BOOL v15 = os_log_type_enabled(v13, v14);
    uint64_t v16 = *(void *)(v0 + 944);
    if (v15)
    {
      os_log_type_t type = v14;
      uint64_t v17 = swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      uint64_t v35 = v34;
      *(_DWORD *)uint64_t v17 = 134218498;
      *(double *)(v0 + 752) = v8;
      sub_247999720();
      *(_WORD *)(v17 + 12) = 2048;
      swift_beginAccess();
      uint64_t v18 = *(void *)(v16 + 16);
      swift_release();
      *(void *)(v0 + 736) = v18;
      sub_247999720();
      swift_release();
      *(_WORD *)(v17 + 22) = 2080;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 744) = sub_247918FF0(v9, v11, &v35);
      sub_247999720();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_247896000, v13, type, "#tokenperf: Received last token. Total: %f. %ld tokens at @ %s tokens per second", (uint8_t *)v17, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24C564070](v34, -1, -1);
      MEMORY[0x24C564070](v17, -1, -1);
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();
    }

    uint64_t v21 = *(void *)(v0 + 960);
    uint64_t v22 = *(void *)(v0 + 816);
    uint64_t v23 = *(void *)(v0 + 808);
    uint64_t v24 = *(void *)(*(void *)(v0 + 792) + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_registry);
    uint64_t v25 = sub_247999520();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v21, 1, 1, v25);
    sub_247999500();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v26 = sub_2479994F0();
    uint64_t v27 = (void *)swift_allocObject();
    uint64_t v28 = MEMORY[0x263F8F500];
    v27[2] = v26;
    v27[3] = v28;
    void v27[4] = v23;
    v27[5] = v22;
    v27[6] = v24;
    uint64_t v29 = sub_24794C41C(v21, (uint64_t)&unk_269269478, (uint64_t)v27);
    *(void *)(v0 + 1280) = v29;
    double v30 = (void *)swift_task_alloc();
    *(void *)(v0 + 1288) = v30;
    *double v30 = v0;
    v30[1] = sub_2479926A8;
    uint64_t v31 = MEMORY[0x263F8EE60] + 8;
    return MEMORY[0x270FA1FD0](v30, v29, v31);
  }
  else
  {
    unint64_t v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 1256) = v19;
    *unint64_t v19 = v0;
    v19[1] = sub_247991D08;
    uint64_t v20 = *(void *)(v0 + 1208);
    return MEMORY[0x270FA2100](v0 + 512, v20);
  }
}

uint64_t sub_247991D08()
{
  *(void *)(*(void *)v1 + 1264) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_247992AA8;
  }
  else
  {
    swift_endAccess();
    uint64_t v2 = sub_247991E24;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_247991E24()
{
  uint64_t v60 = v0;
  uint64_t v2 = (long long *)(v0 + 512);
  if (*(void *)(v0 + 536))
  {
    uint64_t v3 = (long long *)(v0 + 552);
    uint64_t v4 = (void *)(*(void *)(v0 + 944) + 16);
    sub_2478A2438(v2, v0 + 552);
    swift_beginAccess();
    if (!*v4)
    {
      sub_2479983C0();
      sub_247998340();
      double v1 = v5;
      sub_247998340();
      double v7 = v6;
      if (qword_269266A88 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_247999030();
      __swift_project_value_buffer(v8, (uint64_t)qword_26927FC20);
      uint64_t v9 = sub_247999010();
      os_log_type_t v10 = sub_2479996B0();
      if (os_log_type_enabled(v9, v10))
      {
        double v1 = v1 - v7;
        unint64_t v11 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)unint64_t v11 = 134217984;
        *(double *)(v0 + 768) = v1;
        sub_247999720();
        _os_log_impl(&dword_247896000, v9, v10, "#tokenperf: Received first token. TTFT: %f", v11, 0xCu);
        MEMORY[0x24C564070](v11, -1, -1);
      }
      uint64_t v12 = *(void *)(v0 + 1184);
      uint64_t v13 = *(void *)(v0 + 1168);
      uint64_t v14 = *(void *)(v0 + 1160);
      uint64_t v15 = *(void *)(v0 + 992);
      uint64_t v16 = *(void *)(v0 + 984);
      uint64_t v17 = *(void *)(v0 + 976);
      uint64_t v56 = *(void **)(v0 + 1264);
      uint64_t v18 = *(void *)(v0 + 872);

      unint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
      v19(v12, v18, v14);
      v19(v16, v12, v14);
      sub_247999060();
      swift_allocObject();
      uint64_t v20 = sub_247999050();
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
      *(void *)(v16 + *(int *)(v17 + 20)) = v20;
      sub_247997A3C(v16, v15, (uint64_t (*)(void))_s15InstrumentationVMa);
      *(void *)(swift_task_alloc() + 16) = v15;
      sub_247999040();
      uint64_t v21 = *(void *)(v0 + 968);
      if (v56)
      {

        swift_task_dealloc();
        uint64_t v22 = sub_247998D70();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
      }
      else
      {
        swift_task_dealloc();
        uint64_t v47 = sub_247998D70();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v21, 0, 1, v47);
      }
      uint64_t v3 = (long long *)(v0 + 552);
      uint64_t v48 = *(void *)(v0 + 1016);
      uint64_t v49 = *(void *)(v0 + 1008);
      uint64_t v50 = *(void *)(v0 + 1000);
      uint64_t v4 = *(void **)(v0 + 992);
      sub_2478A1A1C(*(void *)(v0 + 968), &qword_269268C20);
      sub_247997AC0((uint64_t)v4, (uint64_t (*)(void))_s15InstrumentationVMa);
      (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v50);
    }
    unint64_t v28 = *(void *)(v0 + 944);
    sub_2478A2438(v3, *(void *)(v0 + 776));
    swift_beginAccess();
    uint64_t v51 = *(void *)(v28 + 16);
    BOOL v52 = __OFADD__(v51, 1);
    uint64_t v53 = v51 + 1;
    if (!v52)
    {
      *(void *)(*(void *)(v0 + 944) + 16) = v53;
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
      uint64_t v54 = *(uint64_t (**)(void))(v0 + 8);
      return v54();
    }
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v23 = *(void *)(v0 + 944);
  sub_2478A1A1C((uint64_t)v2, &qword_269268F80);
  sub_2479983C0();
  sub_247998340();
  double v25 = v24;
  sub_247998340();
  double v1 = v25 - v26;
  swift_beginAccess();
  *(double *)(v0 + 760) = (double)*(uint64_t *)(v23 + 16) / v1;
  sub_2479979E4();
  uint64_t v4 = (void *)sub_2479992A0();
  unint64_t v28 = v27;
  if (qword_269266A88 != -1) {
LABEL_23:
  }
    swift_once();
  uint64_t v29 = sub_247999030();
  *(void *)(v0 + 1272) = __swift_project_value_buffer(v29, (uint64_t)qword_26927FC20);
  swift_retain_n();
  swift_bridgeObjectRetain();
  double v30 = sub_247999010();
  os_log_type_t v31 = sub_2479996B0();
  BOOL v32 = os_log_type_enabled(v30, v31);
  uint64_t v33 = *(void *)(v0 + 944);
  if (v32)
  {
    uint64_t v34 = swift_slowAlloc();
    uint64_t v57 = swift_slowAlloc();
    uint64_t v59 = v57;
    *(_DWORD *)uint64_t v34 = 134218498;
    *(double *)(v0 + 752) = v1;
    sub_247999720();
    *(_WORD *)(v34 + 12) = 2048;
    swift_beginAccess();
    os_log_type_t type = v31;
    uint64_t v35 = *(void *)(v33 + 16);
    swift_release();
    *(void *)(v0 + 736) = v35;
    sub_247999720();
    swift_release();
    *(_WORD *)(v34 + 22) = 2080;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 744) = sub_247918FF0((uint64_t)v4, v28, &v59);
    sub_247999720();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247896000, v30, type, "#tokenperf: Received last token. Total: %f. %ld tokens at @ %s tokens per second", (uint8_t *)v34, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v57, -1, -1);
    MEMORY[0x24C564070](v34, -1, -1);
  }
  else
  {
    swift_release_n();
    swift_bridgeObjectRelease_n();
  }

  uint64_t v36 = *(void *)(v0 + 960);
  uint64_t v37 = *(void *)(v0 + 816);
  uint64_t v38 = *(void *)(v0 + 808);
  uint64_t v39 = *(void *)(*(void *)(v0 + 792) + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_registry);
  uint64_t v40 = sub_247999520();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v36, 1, 1, v40);
  sub_247999500();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v41 = sub_2479994F0();
  uint64_t v42 = (void *)swift_allocObject();
  uint64_t v43 = MEMORY[0x263F8F500];
  void v42[2] = v41;
  v42[3] = v43;
  v42[4] = v38;
  v42[5] = v37;
  v42[6] = v39;
  uint64_t v44 = sub_24794C41C(v36, (uint64_t)&unk_269269478, (uint64_t)v42);
  *(void *)(v0 + 1280) = v44;
  uint64_t v45 = (void *)swift_task_alloc();
  *(void *)(v0 + 1288) = v45;
  void *v45 = v0;
  v45[1] = sub_2479926A8;
  uint64_t v46 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA1FD0](v45, v44, v46);
}

uint64_t sub_2479926A8()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_2479927C0, 0, 0);
}

uint64_t sub_2479927C0()
{
  uint64_t v1 = sub_247999010();
  os_log_type_t v2 = sub_2479996B0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_247896000, v1, v2, "#tokenperf: Finished streaming complete prompt request", v3, 2u);
    MEMORY[0x24C564070](v3, -1, -1);
  }
  uint64_t v4 = v0[128];
  uint64_t v5 = v0[126];
  uint64_t v6 = v0[125];
  uint64_t v7 = v0[97];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  *(void *)(v7 + 32) = 0;
  *(_OWORD *)uint64_t v7 = 0u;
  *(_OWORD *)(v7 + 16) = 0u;
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
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_247992980()
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
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247992AA8()
{
  swift_endAccess();
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
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247992BD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 120) = v25;
  *(_OWORD *)(v8 + 104) = v24;
  *(_OWORD *)(v8 + 88) = v23;
  *(_OWORD *)(v8 + 72) = v22;
  *(_OWORD *)(v8 + 56) = v21;
  *(_OWORD *)(v8 + 40) = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268F60);
  *(void *)(v8 + 128) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269318);
  *(void *)(v8 + 136) = swift_task_alloc();
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F58);
  *(void *)(v8 + 144) = v15;
  *(void *)(v8 + 152) = *(void *)(v15 - 8);
  *(void *)(v8 + 160) = swift_task_alloc();
  *(void *)(v8 + 168) = swift_projectBox();
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v8 + 176) = v16;
  *uint64_t v16 = v8;
  v16[1] = sub_247992DBC;
  return sub_24798BCF4(a3, a4, a5, a6, a7, a8, v19);
}

uint64_t sub_247992DBC(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 184) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_247992F18, 0, 0);
  }
}

uint64_t sub_247992F18()
{
  uint64_t v1 = v0[17];
  sub_2478E6A48(v0[10], v1, &qword_269269318);
  uint64_t v2 = sub_247998AC0();
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v5 = v0[17];
  if (v4 == 1)
  {
    sub_2478A1A1C(v0[17], &qword_269269318);
    uint64_t v6 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = sub_247998A30();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v2);
  }
  v0[24] = v6;
  uint64_t v7 = (void *)swift_task_alloc();
  v0[25] = v7;
  void *v7 = v0;
  v7[1] = sub_2479930A8;
  uint64_t v8 = v0[20];
  uint64_t v9 = v0[11];
  uint64_t v10 = v0[8];
  uint64_t v11 = v0[9];
  uint64_t v12 = v0[6];
  uint64_t v13 = v0[7];
  uint64_t v14 = v0[5];
  return sub_24795BC3C(v8, v14, v12, v13, v10, v11, v6, v9);
}

uint64_t sub_2479930A8()
{
  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0) {
    uint64_t v2 = sub_247993310;
  }
  else {
    uint64_t v2 = sub_2479931D8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2479931D8()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[18];
  uint64_t v4 = v0[19];
  uint64_t v5 = v0[16];
  sub_2479995D0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F68);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  swift_beginAccess();
  sub_2478E7964(v5, v2, &qword_269268F60);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_247993310()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_247993398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[9] = a4;
  v5[10] = a5;
  v5[7] = a2;
  v5[8] = a3;
  v5[6] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  v5[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247993434, 0, 0);
}

uint64_t sub_247993434()
{
  long long v21 = v0;
  if (qword_269266AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_247999030();
  __swift_project_value_buffer(v1, (uint64_t)qword_26927FC68);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_247999010();
  os_log_type_t v3 = sub_2479996B0();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[7];
  if (v4)
  {
    uint64_t v6 = v0[6];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v20 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[5] = sub_247918FF0(v6, v5, &v20);
    sub_247999720();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247896000, v2, v3, "Session %s invalidated and will be deleted.", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v8, -1, -1);
    MEMORY[0x24C564070](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v10 = v0[10];
  uint64_t v9 = v0[11];
  uint64_t v11 = v0[8];
  uint64_t v12 = v0[9];
  uint64_t v13 = *(void *)(v11 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_registry);
  uint64_t v14 = sub_247999520();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
  sub_247999500();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v15 = sub_2479994F0();
  uint64_t v16 = (void *)swift_allocObject();
  uint64_t v17 = MEMORY[0x263F8F500];
  v16[2] = v15;
  v16[3] = v17;
  v16[4] = v12;
  void v16[5] = v10;
  v16[6] = v13;
  sub_24794C41C(v9, (uint64_t)&unk_269269428, (uint64_t)v16);
  swift_release();
  uint64_t v18 = *(void *)(v11 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_expiredSessions);
  v0[12] = v18;
  return MEMORY[0x270FA2498](sub_2479936FC, v18, 0);
}

uint64_t sub_2479936FC()
{
  uint64_t v6 = v0;
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_247966DA4(&v5, v2, v1);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  os_log_type_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

void *sub_2479937BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v29 = a6;
  uint64_t v30 = a8;
  uint64_t v32 = a3;
  uint64_t v33 = a7;
  uint64_t v31 = a1;
  uint64_t v11 = type metadata accessor for BlackPowder();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_247998400();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2479983F0();
  uint64_t v18 = sub_2479983E0();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  sub_24799614C(a5 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_provider, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for BlackPowder);
  sub_2479030DC(v29, (uint64_t)v36);
  sub_247920218(a5 + 16, (uint64_t)v34);
  uint64_t v21 = *(void *)(a5 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_registry);
  _s7SessionCMa();
  uint64_t v22 = (void *)swift_allocObject();
  swift_retain();
  uint64_t v23 = v30;
  swift_retain();
  swift_defaultActor_initialize();
  v22[14] = v31;
  v22[15] = a2;
  v22[16] = v32;
  v22[17] = a4;
  v22[18] = v18;
  v22[19] = v20;
  sub_247997A3C((uint64_t)v13, (uint64_t)v22 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_provider, (uint64_t (*)(void))type metadata accessor for BlackPowder);
  memcpy((char *)v22 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_authenticator, v36, 0x1E9uLL);
  long long v24 = (char *)v22 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_client;
  long long v25 = v34[1];
  *(_OWORD *)long long v24 = v34[0];
  *((_OWORD *)v24 + 1) = v25;
  *((_OWORD *)v24 + 2) = v34[2];
  *((void *)v24 + 6) = v35;
  *(void *)((char *)v22 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_registry) = v21;
  double v26 = (void *)((char *)v22 + OBJC_IVAR____TtCV5Anvil11BlackPowder7Session_sessionExpired);
  *double v26 = v33;
  v26[1] = v23;
  return v22;
}

uint64_t sub_247993A30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[21] = a7;
  v8[22] = a8;
  v8[19] = a5;
  v8[20] = a6;
  v8[17] = a3;
  v8[18] = a4;
  v8[16] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  v8[23] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692684F0);
  v8[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268F60);
  v8[25] = swift_task_alloc();
  v8[26] = swift_task_alloc();
  v8[27] = swift_projectBox();
  return MEMORY[0x270FA2498](sub_247993B50, 0, 0);
}

uint64_t sub_247993B50()
{
  uint64_t v2 = v0[26];
  uint64_t v1 = v0[27];
  swift_beginAccess();
  sub_2478E6A48(v1, v2, &qword_269268F60);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268F68);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  LODWORD(v1) = v5(v2, 1, v3);
  sub_2478A1A1C(v2, &qword_269268F60);
  if (v1 == 1)
  {
    uint64_t v6 = v0[27];
    uint64_t v7 = v0[25];
    __swift_instantiateConcreteTypeFromMangledName(&qword_269268F58);
    sub_2479995D0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v7, 0, 1, v3);
    swift_beginAccess();
    sub_2478E7964(v7, v6, &qword_269268F60);
  }
  uint64_t v8 = v0[27];
  swift_beginAccess();
  if (v5(v8, 1, v3))
  {
    uint64_t v9 = v0[16];
    swift_endAccess();
    *(void *)(v9 + 32) = 0;
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v9 + 16) = 0u;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
  else
  {
    uint64_t v12 = (void *)swift_task_alloc();
    v0[28] = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_247993DD8;
    uint64_t v13 = v0[16];
    return MEMORY[0x270FA2100](v13, v3);
  }
}

uint64_t sub_247993DD8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 232) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_247993F48, 0, 0);
  }
  else
  {
    swift_endAccess();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_247993F48()
{
  uint64_t v33 = v0;
  uint64_t v1 = (void *)v0[29];
  swift_endAccess();
  uint64_t v2 = sub_247977978(v1);
  v0[14] = v2;
  v0[30] = v2;
  id v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269266BD8);
  uint64_t v4 = sub_2479984E0();
  int v5 = swift_dynamicCast();
  uint64_t v6 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  uint64_t v7 = v0[24];
  if (v5)
  {
    uint64_t v8 = *(void *)(v4 - 8);
    v6(v0[24], 0, 1, v4);
    int v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 88))(v7, v4);
    int v10 = *MEMORY[0x263F7F7F0];
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v4);
    if (v9 == v10)
    {
      if (qword_269266AA0 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_247999030();
      __swift_project_value_buffer(v11, (uint64_t)qword_26927FC68);
      swift_bridgeObjectRetain_n();
      uint64_t v12 = sub_247999010();
      os_log_type_t v13 = sub_2479996B0();
      BOOL v14 = os_log_type_enabled(v12, v13);
      unint64_t v15 = v0[19];
      if (v14)
      {
        uint64_t v16 = v0[18];
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        uint64_t v32 = v18;
        *(_DWORD *)uint64_t v17 = 136315138;
        swift_bridgeObjectRetain();
        v0[15] = sub_247918FF0(v16, v15, &v32);
        sub_247999720();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_247896000, v12, v13, "Session %s was invalidated and will be deleted.", v17, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C564070](v18, -1, -1);
        MEMORY[0x24C564070](v17, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      uint64_t v23 = v0[22];
      uint64_t v22 = v0[23];
      uint64_t v24 = v0[20];
      uint64_t v25 = v0[21];
      uint64_t v26 = *(void *)(v24 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_registry);
      uint64_t v27 = sub_247999520();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v22, 1, 1, v27);
      sub_247999500();
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v28 = sub_2479994F0();
      uint64_t v29 = (void *)swift_allocObject();
      uint64_t v30 = MEMORY[0x263F8F500];
      v29[2] = v28;
      v29[3] = v30;
      v29[4] = v25;
      v29[5] = v23;
      v29[6] = v26;
      sub_24794C41C(v22, (uint64_t)&unk_269269450, (uint64_t)v29);
      swift_release();
      uint64_t v31 = *(void *)(v24 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_expiredSessions);
      v0[31] = v31;
      return MEMORY[0x270FA2498](sub_2479943B0, v31, 0);
    }
  }
  else
  {
    v6(v0[24], 1, 1, v4);
    sub_2478A1A1C(v7, &qword_2692684F0);
  }
  uint64_t v19 = (void *)v0[29];
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_2479943B0()
{
  uint64_t v5 = v0;
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v1 = *(void *)(v0 + 152);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_247966DA4(&v4, v2, v1);
  swift_endAccess();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_247994470, 0, 0);
}

uint64_t sub_247994470()
{
  uint64_t v1 = *(void **)(v0 + 232);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24799451C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[21] = a7;
  v8[22] = a8;
  v8[19] = a5;
  v8[20] = a6;
  v8[17] = a3;
  v8[18] = a4;
  v8[16] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D8);
  v8[23] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2692684F0);
  v8[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268E20);
  v8[25] = swift_task_alloc();
  v8[26] = swift_task_alloc();
  v8[27] = swift_projectBox();
  return MEMORY[0x270FA2498](sub_24799463C, 0, 0);
}

uint64_t sub_24799463C()
{
  uint64_t v2 = v0[26];
  uint64_t v1 = v0[27];
  swift_beginAccess();
  sub_2478E6A48(v1, v2, &qword_269268E20);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269268818);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  LODWORD(v1) = v5(v2, 1, v3);
  sub_2478A1A1C(v2, &qword_269268E20);
  if (v1 == 1)
  {
    uint64_t v6 = v0[27];
    uint64_t v7 = v0[25];
    __swift_instantiateConcreteTypeFromMangledName(&qword_2692687D0);
    sub_2479995D0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v7, 0, 1, v3);
    swift_beginAccess();
    sub_2478E7964(v7, v6, &qword_269268E20);
  }
  uint64_t v8 = v0[27];
  swift_beginAccess();
  if (v5(v8, 1, v3))
  {
    uint64_t v9 = v0[16];
    swift_endAccess();
    uint64_t v10 = sub_247998CD0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
  else
  {
    os_log_type_t v13 = (void *)swift_task_alloc();
    v0[28] = v13;
    *os_log_type_t v13 = v0;
    v13[1] = sub_2479948F8;
    uint64_t v14 = v0[16];
    return MEMORY[0x270FA2100](v14, v3);
  }
}

uint64_t sub_2479948F8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 232) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_247994A68, 0, 0);
  }
  else
  {
    swift_endAccess();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_247994A68()
{
  uint64_t v33 = v0;
  uint64_t v1 = (void *)v0[29];
  swift_endAccess();
  uint64_t v2 = sub_247977978(v1);
  v0[14] = v2;
  v0[30] = v2;
  id v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269266BD8);
  uint64_t v4 = sub_2479984E0();
  int v5 = swift_dynamicCast();
  uint64_t v6 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  uint64_t v7 = v0[24];
  if (v5)
  {
    uint64_t v8 = *(void *)(v4 - 8);
    v6(v0[24], 0, 1, v4);
    int v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 88))(v7, v4);
    int v10 = *MEMORY[0x263F7F7F0];
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v4);
    if (v9 == v10)
    {
      if (qword_269266AA0 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_247999030();
      __swift_project_value_buffer(v11, (uint64_t)qword_26927FC68);
      swift_bridgeObjectRetain_n();
      uint64_t v12 = sub_247999010();
      os_log_type_t v13 = sub_2479996B0();
      BOOL v14 = os_log_type_enabled(v12, v13);
      unint64_t v15 = v0[19];
      if (v14)
      {
        uint64_t v16 = v0[18];
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        uint64_t v32 = v18;
        *(_DWORD *)uint64_t v17 = 136315138;
        swift_bridgeObjectRetain();
        v0[15] = sub_247918FF0(v16, v15, &v32);
        sub_247999720();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_247896000, v12, v13, "Session %s was invalidated and will be deleted.", v17, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24C564070](v18, -1, -1);
        MEMORY[0x24C564070](v17, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      uint64_t v23 = v0[22];
      uint64_t v22 = v0[23];
      uint64_t v24 = v0[20];
      uint64_t v25 = v0[21];
      uint64_t v26 = *(void *)(v24 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_registry);
      uint64_t v27 = sub_247999520();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v22, 1, 1, v27);
      sub_247999500();
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v28 = sub_2479994F0();
      uint64_t v29 = (void *)swift_allocObject();
      uint64_t v30 = MEMORY[0x263F8F500];
      v29[2] = v28;
      v29[3] = v30;
      v29[4] = v25;
      v29[5] = v23;
      v29[6] = v26;
      sub_24794C41C(v22, (uint64_t)&unk_2692693C8, (uint64_t)v29);
      swift_release();
      uint64_t v31 = *(void *)(v24 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_expiredSessions);
      v0[31] = v31;
      return MEMORY[0x270FA2498](sub_247994ED0, v31, 0);
    }
  }
  else
  {
    v6(v0[24], 1, 1, v4);
    sub_2478A1A1C(v7, &qword_2692684F0);
  }
  uint64_t v19 = (void *)v0[29];
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_247994ED0()
{
  uint64_t v5 = v0;
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v1 = *(void *)(v0 + 152);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_247966DA4(&v4, v2, v1);
  swift_endAccess();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_247997E2C, 0, 0);
}

uint64_t sub_247994F90()
{
  sub_247920430(v0 + 16);
  sub_247997AC0(v0 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_provider, (uint64_t (*)(void))type metadata accessor for BlackPowder);
  swift_release();
  swift_release();
  sub_2479952E0(*(void *)(v0 + OBJC_IVAR____TtCV5Anvil11BlackPowder13LanguageModel_makeAuthenticator));
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_247995044()
{
  return _s13LanguageModelCMa();
}

uint64_t _s13LanguageModelCMa()
{
  uint64_t result = qword_269269390;
  if (!qword_269269390) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_247995098()
{
  uint64_t result = type metadata accessor for BlackPowder();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24799514C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_247999C90();
    sub_2479993B0();
    uint64_t v6 = sub_247999CD0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_247999B80() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_247999B80() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_247995284()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t _s15ExpiredSessionsCMa()
{
  return self;
}

uint64_t sub_2479952E0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2479952F0()
{
  uint64_t v1 = sub_247998400();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 592) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268C10) - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v5 + v7) & ~v7;
  uint64_t v9 = *(void *)(v6 + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 6));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))((char *)v0 + v4, v1);
  uint64_t v10 = sub_247998B20();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))((char *)v0 + v8, 1, v10)) {
    (*(void (**)(char *, uint64_t))(v11 + 8))((char *)v0 + v8, v10);
  }
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, ((v9 + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | v7 | 7);
}

uint64_t sub_2479955D8(uint64_t a1)
{
  sub_247998400();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  uint64_t v9 = v1[3];
  uint64_t v10 = v1[2];
  uint64_t v3 = v1[66];
  uint64_t v4 = v1[67];
  uint64_t v5 = v1[68];
  uint64_t v6 = v1[69];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24796D664;
  return sub_24798A474(a1, v10, v9, (uint64_t)(v1 + 4), v3, v4, v5, v6);
}

uint64_t sub_2479957BC()
{
  return objectdestroy_22Tm(&qword_2692687D0);
}

uint64_t sub_2479957C8(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2692687D0) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(v1 + 16);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v7);
  uint64_t v11 = *(void *)(v1 + v6);
  uint64_t v12 = *(void *)(v1 + v6 + 8);
  os_log_type_t v13 = (uint64_t *)(v1 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v14 = *v13;
  uint64_t v15 = v13[1];
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v16;
  *uint64_t v16 = v2;
  v16[1] = sub_24796D664;
  return sub_24799451C(a1, v8, v9, v11, v12, v10, v14, v15);
}

uint64_t sub_247995928(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_24796D664;
  return sub_2479354A8(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2479959F0()
{
  uint64_t v1 = sub_247998400();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 592) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268C10) - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v5 + v7) & ~v7;
  uint64_t v9 = *(void *)(v6 + 64);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 11));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))((char *)v0 + v4, v1);
  uint64_t v10 = sub_247998B20();
  uint64_t v11 = *(void *)(v10 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))((char *)v0 + v8, 1, v10)) {
    (*(void (**)(char *, uint64_t))(v11 + 8))((char *)v0 + v8, v10);
  }
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, ((v9 + v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v3 | v7 | 7);
}

uint64_t sub_247995CD8(uint64_t a1)
{
  sub_247998400();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  uint64_t v10 = v1[3];
  uint64_t v11 = v1[2];
  uint64_t v3 = v1[5];
  uint64_t v9 = v1[4];
  uint64_t v4 = v1[6];
  uint64_t v5 = v1[7];
  uint64_t v6 = v1[8];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_2478A1D80;
  return sub_24798B520(a1, v11, v10, v9, v3, v4, v5, v6);
}

uint64_t sub_247995EBC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_24796D664;
  return sub_2479324B8(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_247995F88(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_24796D664;
  return sub_247908B08(a1, v4, v5, v1 + 32);
}

uint64_t sub_24799603C()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_247996084()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  void *v7 = v1;
  v7[1] = sub_2478A1D80;
  return sub_247993398(v2, v3, v4, v5, v6);
}

uint64_t sub_24799614C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2479961B8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_247996204()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_247996214()
{
  uint64_t v35 = sub_247998400();
  uint64_t v1 = *(void *)(v35 - 8);
  uint64_t v45 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v2 = (v45 + 592) & ~v45;
  uint64_t v3 = v2 + *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268C10) - 8);
  uint64_t v44 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v5 = (v3 + v44) & ~v44;
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269269160) - 8);
  uint64_t v43 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v8 = (v5 + v6 + v43) & ~v43;
  uint64_t v9 = *(void *)(v7 + 64);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269269318) - 8);
  uint64_t v42 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v11 = (v8 + v9 + v42) & ~v42;
  uint64_t v12 = *(void *)(v10 + 64);
  uint64_t v38 = sub_2479986A0();
  uint64_t v13 = *(void *)(v38 - 8);
  uint64_t v14 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v36 = v11;
  uint64_t v37 = (v11 + v12 + v14) & ~v14;
  unint64_t v15 = (*(void *)(v13 + 64) + v37 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269269130) - 8);
  uint64_t v17 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v34 = v15 + v17;
  uint64_t v40 = *(void *)(v16 + 64);
  uint64_t v41 = sub_2479983D0();
  uint64_t v18 = *(void *)(v41 - 8);
  uint64_t v19 = *(unsigned __int8 *)(v18 + 80);
  uint64_t v39 = *(void *)(v18 + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 6));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))((char *)v0 + v2, v35);
  uint64_t v20 = (char *)v0 + v5;
  uint64_t v21 = sub_247998B20();
  uint64_t v22 = *(void *)(v21 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21)) {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v20, v21);
  }
  uint64_t v23 = (char *)v0 + v8;
  uint64_t v24 = sub_247998B00();
  uint64_t v25 = *(void *)(v24 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24)) {
    (*(void (**)(char *, uint64_t))(v25 + 8))(v23, v24);
  }
  uint64_t v26 = (v34 + 8) & ~v17;
  uint64_t v27 = sub_247998AC0();
  uint64_t v28 = *(void *)(v27 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))((char *)v0 + v36, 1, v27)) {
    (*(void (**)(char *, uint64_t))(v28 + 8))((char *)v0 + v36, v27);
  }
  (*(void (**)(char *, uint64_t))(v13 + 8))((char *)v0 + v37, v38);
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_247998E30();
  uint64_t v30 = *(void *)(v29 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))((char *)v0 + v26, 1, v29)) {
    (*(void (**)(char *, uint64_t))(v30 + 8))((char *)v0 + v26, v29);
  }
  uint64_t v31 = v45 | v44 | v43 | v42 | v14 | v17 | v19 | 7;
  unint64_t v32 = (v19
       + ((((((v40 + v26 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
       + 8) & ~v19;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v18 + 8))((char *)v0 + v32, v41);

  return MEMORY[0x270FA0238](v0, v32 + v39, v31);
}

uint64_t sub_247996934(uint64_t a1)
{
  sub_247998400();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269160);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269318);
  sub_2479986A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269130);
  sub_2479983D0();
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[2];
  uint64_t v7 = v1[66];
  uint64_t v5 = v1[68];
  uint64_t v6 = v1[67];
  uint64_t v4 = v1[69];
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v10 + 16) = v2;
  *uint64_t v2 = v10;
  v2[1] = sub_24796D664;
  return sub_247990850(a1, v9, v8, (uint64_t)(v1 + 4), v7, v6, v5, v4);
}

uint64_t sub_247996D34()
{
  return objectdestroy_22Tm(&qword_269268F58);
}

uint64_t objectdestroy_22Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 24) & ~v4;
  uint64_t v6 = v4 | 7;
  unint64_t v7 = (((((*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v1, v7 + 16, v6);
}

uint64_t sub_247996E54(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268F58) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(v1 + 16);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v7);
  uint64_t v11 = *(void *)(v1 + v6);
  uint64_t v12 = *(void *)(v1 + v6 + 8);
  uint64_t v13 = (uint64_t *)(v1 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v14 = *v13;
  uint64_t v15 = v13[1];
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v16;
  *uint64_t v16 = v2;
  v16[1] = sub_24796D664;
  return sub_247993A30(a1, v8, v9, v11, v12, v10, v14, v15);
}

uint64_t sub_247996FB4()
{
  uint64_t v1 = sub_247998400();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v39 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v3 = (v39 + 584) & ~v39;
  uint64_t v4 = v3 + *(void *)(v2 + 64);
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269268C10) - 8);
  uint64_t v38 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v6 = (v4 + v38) & ~v38;
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269269160) - 8);
  uint64_t v37 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v9 = (v6 + v7 + v37) & ~v37;
  uint64_t v10 = *(void *)(v8 + 64);
  uint64_t v11 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269269318) - 8);
  uint64_t v34 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v12 = (v9 + v10 + v34) & ~v34;
  uint64_t v13 = *(void *)(v11 + 64);
  uint64_t v35 = sub_2479986A0();
  uint64_t v14 = *(void *)(v35 - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v32 = v12;
  uint64_t v33 = (v12 + v13 + v15) & ~v15;
  unint64_t v16 = (*(void *)(v14 + 64) + v33 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269269130) - 8);
  uint64_t v18 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v19 = v16 + v18;
  uint64_t v36 = *(void *)(v17 + 64);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 11));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))((char *)v0 + v3, v1);
  uint64_t v20 = (char *)v0 + v6;
  uint64_t v21 = sub_247998B20();
  uint64_t v22 = *(void *)(v21 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21)) {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v20, v21);
  }
  uint64_t v23 = (char *)v0 + v9;
  uint64_t v24 = sub_247998B00();
  uint64_t v25 = *(void *)(v24 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24)) {
    (*(void (**)(char *, uint64_t))(v25 + 8))(v23, v24);
  }
  uint64_t v26 = (v19 + 8) & ~v18;
  uint64_t v27 = sub_247998AC0();
  uint64_t v28 = *(void *)(v27 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))((char *)v0 + v32, 1, v27)) {
    (*(void (**)(char *, uint64_t))(v28 + 8))((char *)v0 + v32, v27);
  }
  (*(void (**)(char *, uint64_t))(v14 + 8))((char *)v0 + v33, v35);
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_247998E30();
  uint64_t v30 = *(void *)(v29 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))((char *)v0 + v26, 1, v29)) {
    (*(void (**)(char *, uint64_t))(v30 + 8))((char *)v0 + v26, v29);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, ((((((v36 + v26 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v39 | v38 | v37 | v34 | v15 | v18 | 7);
}

uint64_t sub_247997640(uint64_t a1)
{
  sub_247998400();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269268C10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269160);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269318);
  sub_2479986A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269269130);
  uint64_t v10 = v1[2];
  uint64_t v8 = v1[4];
  uint64_t v9 = v1[3];
  uint64_t v6 = v1[6];
  uint64_t v7 = v1[5];
  uint64_t v4 = v1[8];
  uint64_t v5 = v1[7];
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v11 + 16) = v2;
  *uint64_t v2 = v11;
  v2[1] = sub_24796D664;
  return sub_247992BD0(a1, v10, v9, v8, v7, v6, v5, v4);
}

unint64_t sub_2479979E4()
{
  unint64_t result = qword_269269470;
  if (!qword_269269470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269269470);
  }
  return result;
}

uint64_t sub_247997A3C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_247997AA4()
{
  return sub_2478AA744();
}

uint64_t sub_247997AC0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroy_48Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 6));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 521, 7);
}

uint64_t sub_247997C5C()
{
  return MEMORY[0x270FA2498](sub_247997C78, 0, 0);
}

uint64_t sub_247997C78()
{
  uint64_t v9 = v0;
  if (qword_269266AA0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_247999030();
  __swift_project_value_buffer(v1, (uint64_t)qword_26927FC68);
  uint64_t v2 = sub_247999010();
  os_log_type_t v3 = sub_2479996B0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v8 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v0 + 16) = sub_247918FF0(0x5F286E4964616F6CLL, 0xEA0000000000293ALL, &v8);
    sub_247999720();
    _os_log_impl(&dword_247896000, v2, v3, "%s: no-op", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C564070](v5, -1, -1);
    MEMORY[0x24C564070](v4, -1, -1);
  }

  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_247997E30()
{
  return MEMORY[0x270EEDBB0]();
}

uint64_t sub_247997E40()
{
  return MEMORY[0x270EEDBE0]();
}

uint64_t sub_247997E50()
{
  return MEMORY[0x270EEDBE8]();
}

uint64_t sub_247997E60()
{
  return MEMORY[0x270EEDBF8]();
}

uint64_t sub_247997E70()
{
  return MEMORY[0x270EEDC50]();
}

uint64_t sub_247997E80()
{
  return MEMORY[0x270EEDC80]();
}

uint64_t sub_247997E90()
{
  return MEMORY[0x270EEDC88]();
}

uint64_t sub_247997EA0()
{
  return MEMORY[0x270EEDC90]();
}

uint64_t sub_247997EB0()
{
  return MEMORY[0x270EEDCA0]();
}

uint64_t sub_247997EC0()
{
  return MEMORY[0x270EEDCB8]();
}

uint64_t sub_247997ED0()
{
  return MEMORY[0x270EEDD88]();
}

uint64_t sub_247997EE0()
{
  return MEMORY[0x270EEDDA0]();
}

uint64_t sub_247997EF0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_247997F00()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_247997F10()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_247997F20()
{
  return MEMORY[0x270EEDE28]();
}

uint64_t sub_247997F30()
{
  return MEMORY[0x270EEDE38]();
}

uint64_t sub_247997F40()
{
  return MEMORY[0x270EEDE48]();
}

uint64_t sub_247997F50()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_247997F60()
{
  return MEMORY[0x270EEDE70]();
}

uint64_t sub_247997F70()
{
  return MEMORY[0x270EEDEA0]();
}

uint64_t sub_247997F80()
{
  return MEMORY[0x270EEDEB8]();
}

uint64_t sub_247997F90()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_247997FA0()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_247997FB0()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_247997FC0()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_247997FD0()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_247997FE0()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_247997FF0()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_247998000()
{
  return MEMORY[0x270EEE408]();
}

uint64_t sub_247998010()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_247998020()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_247998030()
{
  return MEMORY[0x270EEE4C0]();
}

uint64_t sub_247998040()
{
  return MEMORY[0x270EEE520]();
}

uint64_t sub_247998050()
{
  return MEMORY[0x270EEE568]();
}

uint64_t sub_247998060()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_247998070()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_247998080()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_247998090()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_2479980A0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2479980B0()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_2479980C0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2479980D0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2479980E0()
{
  return MEMORY[0x270EEE680]();
}

uint64_t sub_2479980F0()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_247998100()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_247998110()
{
  return MEMORY[0x270EEEE78]();
}

uint64_t sub_247998130()
{
  return MEMORY[0x270EEF518]();
}

uint64_t sub_247998140()
{
  return MEMORY[0x270EEF548]();
}

uint64_t sub_247998150()
{
  return MEMORY[0x270EEF740]();
}

uint64_t sub_247998160()
{
  return MEMORY[0x270EEF750]();
}

uint64_t sub_247998170()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_247998180()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_247998190()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_2479981A0()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_2479981B0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_2479981C0()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_2479981D0()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_2479981E0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2479981F0()
{
  return MEMORY[0x270EEFDD8]();
}

uint64_t sub_247998200()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_247998210()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_247998220()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_247998230()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_247998240()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_247998250()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_247998260()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_247998270()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_247998280()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_247998290()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_2479982A0()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_2479982B0()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_2479982C0()
{
  return MEMORY[0x270EF00D0]();
}

uint64_t sub_2479982D0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2479982E0()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_2479982F0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_247998300()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_247998310()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_247998320()
{
  return MEMORY[0x270EF0248]();
}

uint64_t sub_247998330()
{
  return MEMORY[0x270EF0268]();
}

uint64_t sub_247998340()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_247998350()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_247998360()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_247998370()
{
  return MEMORY[0x270EF09C8]();
}

uint64_t sub_247998380()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_247998390()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_2479983A0()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_2479983B0()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_2479983C0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2479983D0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2479983E0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2479983F0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_247998400()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_247998410()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_247998420()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_247998430()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_247998440()
{
  return MEMORY[0x270EF1778]();
}

uint64_t sub_247998450()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_247998460()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_247998470()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_247998480()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_247998490()
{
  return MEMORY[0x270F7EB58]();
}

uint64_t sub_2479984A0()
{
  return MEMORY[0x270F7EB60]();
}

uint64_t sub_2479984B0()
{
  return MEMORY[0x270F7EC20]();
}

uint64_t sub_2479984C0()
{
  return MEMORY[0x270F7EC28]();
}

uint64_t sub_2479984D0()
{
  return MEMORY[0x270F7EC30]();
}

uint64_t sub_2479984E0()
{
  return MEMORY[0x270F7EC38]();
}

uint64_t sub_2479984F0()
{
  return MEMORY[0x270F7EC58]();
}

uint64_t sub_247998500()
{
  return MEMORY[0x270F7EC80]();
}

uint64_t sub_247998510()
{
  return MEMORY[0x270F7ECB8]();
}

uint64_t sub_247998520()
{
  return MEMORY[0x270F7ECD0]();
}

uint64_t sub_247998530()
{
  return MEMORY[0x270F7ECE0]();
}

uint64_t sub_247998540()
{
  return MEMORY[0x270F7ECF8]();
}

uint64_t sub_247998550()
{
  return MEMORY[0x270F7ED00]();
}

uint64_t sub_247998560()
{
  return MEMORY[0x270F7ED10]();
}

uint64_t sub_247998570()
{
  return MEMORY[0x270F7ED40]();
}

uint64_t sub_247998580()
{
  return MEMORY[0x270F7ED50]();
}

uint64_t sub_247998590()
{
  return MEMORY[0x270F7ED58]();
}

uint64_t sub_2479985B0()
{
  return MEMORY[0x270F7EDA0]();
}

uint64_t sub_2479985C0()
{
  return MEMORY[0x270F7EDB0]();
}

uint64_t sub_2479985D0()
{
  return MEMORY[0x270F7EDC0]();
}

uint64_t sub_2479985E0()
{
  return MEMORY[0x270F7EDC8]();
}

uint64_t sub_2479985F0()
{
  return MEMORY[0x270F7EE40]();
}

uint64_t sub_247998600()
{
  return MEMORY[0x270F7EE70]();
}

uint64_t sub_247998610()
{
  return MEMORY[0x270F7EE78]();
}

uint64_t sub_247998620()
{
  return MEMORY[0x270F7EE98]();
}

uint64_t sub_247998630()
{
  return MEMORY[0x270F7EEA0]();
}

uint64_t sub_247998640()
{
  return MEMORY[0x270F7EEB8]();
}

uint64_t sub_247998650()
{
  return MEMORY[0x270F7EEC0]();
}

uint64_t sub_247998660()
{
  return MEMORY[0x270F7EED0]();
}

uint64_t sub_247998670()
{
  return MEMORY[0x270F7EED8]();
}

uint64_t sub_247998680()
{
  return MEMORY[0x270F7EEF8]();
}

uint64_t sub_247998690()
{
  return MEMORY[0x270F7EF08]();
}

uint64_t sub_2479986A0()
{
  return MEMORY[0x270F7EF18]();
}

uint64_t sub_2479986B0()
{
  return MEMORY[0x270F7EF38]();
}

uint64_t sub_2479986C0()
{
  return MEMORY[0x270F7EF50]();
}

uint64_t sub_2479986D0()
{
  return MEMORY[0x270F7EF58]();
}

uint64_t sub_2479986E0()
{
  return MEMORY[0x270F7EF60]();
}

uint64_t sub_2479986F0()
{
  return MEMORY[0x270F7EF68]();
}

uint64_t sub_247998700()
{
  return MEMORY[0x270F7EFF0]();
}

uint64_t sub_247998710()
{
  return MEMORY[0x270F7EFF8]();
}

uint64_t sub_247998720()
{
  return MEMORY[0x270F7F000]();
}

uint64_t sub_247998730()
{
  return MEMORY[0x270F7F008]();
}

uint64_t sub_247998740()
{
  return MEMORY[0x270F7F010]();
}

uint64_t sub_247998750()
{
  return MEMORY[0x270F7F020]();
}

uint64_t sub_247998760()
{
  return MEMORY[0x270F7F030]();
}

uint64_t sub_247998770()
{
  return MEMORY[0x270F7F050]();
}

uint64_t sub_247998780()
{
  return MEMORY[0x270F7F058]();
}

uint64_t sub_2479987A0()
{
  return MEMORY[0x270F7F068]();
}

uint64_t sub_2479987B0()
{
  return MEMORY[0x270F7F070]();
}

uint64_t sub_2479987C0()
{
  return MEMORY[0x270F7F078]();
}

uint64_t sub_2479987D0()
{
  return MEMORY[0x270F7F0F8]();
}

uint64_t sub_2479987E0()
{
  return MEMORY[0x270F7F100]();
}

uint64_t sub_2479987F0()
{
  return MEMORY[0x270F7F108]();
}

uint64_t sub_247998800()
{
  return MEMORY[0x270F7F110]();
}

uint64_t sub_247998810()
{
  return MEMORY[0x270F7F118]();
}

uint64_t sub_247998820()
{
  return MEMORY[0x270F7F120]();
}

uint64_t sub_247998830()
{
  return MEMORY[0x270F7F128]();
}

uint64_t sub_247998840()
{
  return MEMORY[0x270F7F130]();
}

uint64_t sub_247998850()
{
  return MEMORY[0x270F7F140]();
}

uint64_t sub_247998860()
{
  return MEMORY[0x270F7F150]();
}

uint64_t sub_247998870()
{
  return MEMORY[0x270F7F170]();
}

uint64_t sub_247998880()
{
  return MEMORY[0x270F7F178]();
}

uint64_t sub_247998890()
{
  return MEMORY[0x270F7F180]();
}

uint64_t sub_2479988A0()
{
  return MEMORY[0x270F7F188]();
}

uint64_t sub_2479988B0()
{
  return MEMORY[0x270F7F1A8]();
}

uint64_t sub_2479988C0()
{
  return MEMORY[0x270F7F1B8]();
}

uint64_t sub_2479988D0()
{
  return MEMORY[0x270F7F1C0]();
}

uint64_t sub_2479988E0()
{
  return MEMORY[0x270F7F1C8]();
}

uint64_t sub_2479988F0()
{
  return MEMORY[0x270F7F1D0]();
}

uint64_t sub_247998900()
{
  return MEMORY[0x270F7F1D8]();
}

uint64_t sub_247998910()
{
  return MEMORY[0x270F7F1E0]();
}

uint64_t sub_247998920()
{
  return MEMORY[0x270F7F1E8]();
}

uint64_t sub_247998930()
{
  return MEMORY[0x270F7F498]();
}

uint64_t sub_247998940()
{
  return MEMORY[0x270F7F208]();
}

uint64_t sub_247998950()
{
  return MEMORY[0x270F7F210]();
}

uint64_t sub_247998960()
{
  return MEMORY[0x270F7F218]();
}

uint64_t sub_247998970()
{
  return MEMORY[0x270F7F4B0]();
}

uint64_t sub_247998980()
{
  return MEMORY[0x270F7F4B8]();
}

uint64_t sub_247998990()
{
  return MEMORY[0x270F7F4C8]();
}

uint64_t sub_2479989A0()
{
  return MEMORY[0x270F7F4D0]();
}

uint64_t sub_2479989B0()
{
  return MEMORY[0x270F7F220]();
}

uint64_t sub_2479989C0()
{
  return MEMORY[0x270F7F230]();
}

uint64_t sub_2479989D0()
{
  return MEMORY[0x270F7F238]();
}

uint64_t sub_2479989E0()
{
  return MEMORY[0x270F7F240]();
}

uint64_t sub_2479989F0()
{
  return MEMORY[0x270F7F250]();
}

uint64_t sub_247998A00()
{
  return MEMORY[0x270F7F258]();
}

uint64_t sub_247998A10()
{
  return MEMORY[0x270F7F260]();
}

uint64_t sub_247998A20()
{
  return MEMORY[0x270F7F268]();
}

uint64_t sub_247998A30()
{
  return MEMORY[0x270F7F270]();
}

uint64_t sub_247998A40()
{
  return MEMORY[0x270F7F278]();
}

uint64_t sub_247998A50()
{
  return MEMORY[0x270F7F280]();
}

uint64_t sub_247998A60()
{
  return MEMORY[0x270F7F288]();
}

uint64_t sub_247998A70()
{
  return MEMORY[0x270F7F290]();
}

uint64_t sub_247998A80()
{
  return MEMORY[0x270F7F298]();
}

uint64_t sub_247998A90()
{
  return MEMORY[0x270F7F2A0]();
}

uint64_t sub_247998AA0()
{
  return MEMORY[0x270F7F2A8]();
}

uint64_t sub_247998AB0()
{
  return MEMORY[0x270F7F5D8]();
}

uint64_t sub_247998AC0()
{
  return MEMORY[0x270F7F5E0]();
}

uint64_t sub_247998AD0()
{
  return MEMORY[0x270F7F2B0]();
}

uint64_t sub_247998AE0()
{
  return MEMORY[0x270F7F780]();
}

uint64_t sub_247998AF0()
{
  return MEMORY[0x270F7F800]();
}

uint64_t sub_247998B00()
{
  return MEMORY[0x270F7F808]();
}

uint64_t sub_247998B10()
{
  return MEMORY[0x270F4C198]();
}

uint64_t sub_247998B20()
{
  return MEMORY[0x270F4C1A0]();
}

uint64_t sub_247998B60()
{
  return MEMORY[0x270F4C348]();
}

uint64_t sub_247998B70()
{
  return MEMORY[0x270F4C350]();
}

uint64_t sub_247998B80()
{
  return MEMORY[0x270F4C358]();
}

uint64_t sub_247998B90()
{
  return MEMORY[0x270F4C360]();
}

uint64_t sub_247998BA0()
{
  return MEMORY[0x270F4C378]();
}

uint64_t sub_247998BB0()
{
  return MEMORY[0x270F4C388]();
}

uint64_t sub_247998BC0()
{
  return MEMORY[0x270FA1750]();
}

uint64_t sub_247998BD0()
{
  return MEMORY[0x270FA1768]();
}

uint64_t sub_247998BE0()
{
  return MEMORY[0x270FA1800]();
}

uint64_t sub_247998BF0()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_247998C00()
{
  return MEMORY[0x270F2FF08]();
}

uint64_t sub_247998C10()
{
  return MEMORY[0x270F2FF10]();
}

uint64_t sub_247998C20()
{
  return MEMORY[0x270F2FF20]();
}

uint64_t sub_247998C30()
{
  return MEMORY[0x270F2FF28]();
}

uint64_t sub_247998C40()
{
  return MEMORY[0x270F2FF38]();
}

uint64_t sub_247998C50()
{
  return MEMORY[0x270F2FF40]();
}

uint64_t sub_247998C60()
{
  return MEMORY[0x270F2FF48]();
}

uint64_t sub_247998C70()
{
  return MEMORY[0x270F2FF50]();
}

uint64_t sub_247998C80()
{
  return MEMORY[0x270F2FF58]();
}

uint64_t sub_247998C90()
{
  return MEMORY[0x270F2FF80]();
}

uint64_t sub_247998CA0()
{
  return MEMORY[0x270F2FF88]();
}

uint64_t sub_247998CB0()
{
  return MEMORY[0x270F2FF90]();
}

uint64_t sub_247998CC0()
{
  return MEMORY[0x270F2FF98]();
}

uint64_t sub_247998CD0()
{
  return MEMORY[0x270F2FFA0]();
}

uint64_t sub_247998CE0()
{
  return MEMORY[0x270F2FFD0]();
}

uint64_t sub_247998CF0()
{
  return MEMORY[0x270F2FFD8]();
}

uint64_t sub_247998D00()
{
  return MEMORY[0x270F2FFE0]();
}

uint64_t sub_247998D10()
{
  return MEMORY[0x270F2FFE8]();
}

uint64_t sub_247998D20()
{
  return MEMORY[0x270F43858]();
}

uint64_t sub_247998D30()
{
  return MEMORY[0x270F43898]();
}

uint64_t sub_247998D40()
{
  return MEMORY[0x270F438B8]();
}

uint64_t sub_247998D50()
{
  return MEMORY[0x270F43978]();
}

uint64_t sub_247998D60()
{
  return MEMORY[0x270F43990]();
}

uint64_t sub_247998D70()
{
  return MEMORY[0x270F439A8]();
}

uint64_t sub_247998D80()
{
  return MEMORY[0x270F43F68]();
}

uint64_t sub_247998D90()
{
  return MEMORY[0x270F43F78]();
}

uint64_t sub_247998DA0()
{
  return MEMORY[0x270F43F80]();
}

uint64_t sub_247998DB0()
{
  return MEMORY[0x270F43F90]();
}

uint64_t sub_247998DC0()
{
  return MEMORY[0x270F43F98]();
}

uint64_t sub_247998DD0()
{
  return MEMORY[0x270F441A8]();
}

uint64_t sub_247998DE0()
{
  return MEMORY[0x270F44210]();
}

uint64_t sub_247998DF0()
{
  return MEMORY[0x270F2F170]();
}

uint64_t sub_247998E00()
{
  return MEMORY[0x270F2F178]();
}

uint64_t sub_247998E10()
{
  return MEMORY[0x270F2F188]();
}

uint64_t sub_247998E20()
{
  return MEMORY[0x270F2F190]();
}

uint64_t sub_247998E30()
{
  return MEMORY[0x270F2F1B0]();
}

uint64_t sub_247998E40()
{
  return MEMORY[0x270F2F218]();
}

uint64_t sub_247998E50()
{
  return MEMORY[0x270F2F228]();
}

uint64_t sub_247998E60()
{
  return MEMORY[0x270F2F238]();
}

uint64_t sub_247998E70()
{
  return MEMORY[0x270F2F240]();
}

uint64_t sub_247998E80()
{
  return MEMORY[0x270F2F248]();
}

uint64_t sub_247998E90()
{
  return MEMORY[0x270F2F250]();
}

uint64_t sub_247998EA0()
{
  return MEMORY[0x270F2F270]();
}

uint64_t sub_247998EB0()
{
  return MEMORY[0x270F2F398]();
}

uint64_t sub_247998EC0()
{
  return MEMORY[0x270F2F3A0]();
}

uint64_t sub_247998ED0()
{
  return MEMORY[0x270F2F3A8]();
}

uint64_t sub_247998EE0()
{
  return MEMORY[0x270F2F3B0]();
}

uint64_t sub_247998EF0()
{
  return MEMORY[0x270F2F3B8]();
}

uint64_t sub_247998F00()
{
  return MEMORY[0x270F2F3C0]();
}

uint64_t sub_247998F10()
{
  return MEMORY[0x270F2F3C8]();
}

uint64_t sub_247998F20()
{
  return MEMORY[0x270F2F3D0]();
}

uint64_t sub_247998F30()
{
  return MEMORY[0x270F2F3D8]();
}

uint64_t sub_247998F40()
{
  return MEMORY[0x270F2F3E0]();
}

uint64_t sub_247998F50()
{
  return MEMORY[0x270F2F458]();
}

uint64_t sub_247998F60()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_247998F70()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_247998F80()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_247998F90()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_247998FA0()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_247998FB0()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_247998FC0()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_247998FD0()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_247998FE0()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_247998FF0()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_247999000()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_247999010()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_247999020()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_247999030()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_247999040()
{
  return MEMORY[0x270F2F668]();
}

uint64_t sub_247999050()
{
  return MEMORY[0x270F2F678]();
}

uint64_t sub_247999060()
{
  return MEMORY[0x270F2F680]();
}

uint64_t sub_247999070()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_247999080()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_247999090()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_2479990A0()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_2479990B0()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_2479990C0()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_2479990D0()
{
  return MEMORY[0x270EFE750]();
}

uint64_t sub_2479990E0()
{
  return MEMORY[0x270EFE7D0]();
}

uint64_t sub_2479990F0()
{
  return MEMORY[0x270EFE7D8]();
}

uint64_t sub_247999100()
{
  return MEMORY[0x270EFE7F8]();
}

uint64_t sub_247999110()
{
  return MEMORY[0x270EFE800]();
}

uint64_t sub_247999120()
{
  return MEMORY[0x270EFE818]();
}

uint64_t sub_247999130()
{
  return MEMORY[0x270EFE828]();
}

uint64_t sub_247999140()
{
  return MEMORY[0x270EFE860]();
}

uint64_t sub_247999150()
{
  return MEMORY[0x270EFE878]();
}

uint64_t sub_247999160()
{
  return MEMORY[0x270EFE880]();
}

uint64_t sub_247999170()
{
  return MEMORY[0x270EFE888]();
}

uint64_t sub_247999180()
{
  return MEMORY[0x270EFE8B8]();
}

uint64_t sub_247999190()
{
  return MEMORY[0x270EFE8D0]();
}

uint64_t sub_2479991B0()
{
  return MEMORY[0x270EFE8F8]();
}

uint64_t sub_2479991C0()
{
  return MEMORY[0x270EFE900]();
}

uint64_t sub_2479991D0()
{
  return MEMORY[0x270EFE918]();
}

uint64_t sub_2479991E0()
{
  return MEMORY[0x270EFE928]();
}

uint64_t sub_2479991F0()
{
  return MEMORY[0x270EFE968]();
}

uint64_t sub_247999200()
{
  return MEMORY[0x270EFE970]();
}

uint64_t sub_247999210()
{
  return MEMORY[0x270EFE978]();
}

uint64_t sub_247999220()
{
  return MEMORY[0x270EFE988]();
}

uint64_t sub_247999230()
{
  return MEMORY[0x270EFE9A0]();
}

uint64_t sub_247999240()
{
  return MEMORY[0x270EFEA50]();
}

uint64_t sub_247999250()
{
  return MEMORY[0x270EFEA58]();
}

uint64_t sub_247999260()
{
  return MEMORY[0x270EFEA90]();
}

uint64_t sub_247999270()
{
  return MEMORY[0x270EFEA98]();
}

uint64_t sub_247999280()
{
  return MEMORY[0x270EFEAA0]();
}

uint64_t sub_247999290()
{
  return MEMORY[0x270EFEAA8]();
}

uint64_t sub_2479992A0()
{
  return MEMORY[0x270EF17F8]();
}

uint64_t sub_2479992B0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2479992C0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2479992D0()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_2479992E0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2479992F0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_247999300()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_247999310()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_247999320()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_247999330()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_247999340()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_247999350()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_247999360()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_247999370()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_247999380()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_247999390()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2479993A0()
{
  return MEMORY[0x270F9D658]();
}

uint64_t sub_2479993B0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2479993C0()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2479993D0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2479993E0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2479993F0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_247999400()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_247999410()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_247999420()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_247999430()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_247999440()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_247999450()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_247999460()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_247999470()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_247999480()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_247999490()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2479994A0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2479994B0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2479994C0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2479994D0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2479994F0()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_247999500()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_247999510()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_247999520()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_247999530()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_247999560()
{
  return MEMORY[0x270FA2050]();
}

uint64_t sub_247999570()
{
  return MEMORY[0x270EF1BF8]();
}

uint64_t sub_247999580()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_247999590()
{
  return MEMORY[0x270FA20B0]();
}

uint64_t sub_2479995A0()
{
  return MEMORY[0x270FA20C0]();
}

uint64_t sub_2479995B0()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_2479995C0()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_2479995D0()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_2479995F0()
{
  return MEMORY[0x270FA2110]();
}

uint64_t sub_247999600()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_247999610()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_247999620()
{
  return MEMORY[0x270EF1E30]();
}

uint64_t sub_247999630()
{
  return MEMORY[0x270EF1E40]();
}

uint64_t sub_247999640()
{
  return MEMORY[0x270EF1E88]();
}

uint64_t sub_247999670()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_247999680()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_247999690()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2479996A0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2479996B0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2479996C0()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_2479996D0()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_2479996E0()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_2479996F0()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_247999700()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_247999710()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_247999720()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_247999730()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_247999740()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_247999750()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_247999760()
{
  return MEMORY[0x270EF2568]();
}

uint64_t sub_247999770()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_247999780()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_247999790()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2479997A0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2479997B0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2479997C0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2479997D0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2479997E0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2479997F0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_247999800()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_247999810()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_247999820()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_247999830()
{
  return MEMORY[0x270F9EA70]();
}

uint64_t sub_247999840()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_247999850()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_247999860()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_247999870()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_247999890()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2479998A0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2479998B0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2479998C0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2479998D0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2479998E0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2479998F0()
{
  return MEMORY[0x270FA2240]();
}

uint64_t sub_247999900()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_247999910()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_247999920()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_247999930()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_247999940()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_247999950()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_247999960()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_247999970()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_247999990()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2479999A0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2479999B0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2479999C0()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_2479999D0()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_2479999E0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2479999F0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_247999A00()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_247999A10()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_247999A20()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_247999A30()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_247999A40()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_247999A50()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_247999A60()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_247999A70()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_247999A80()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_247999A90()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_247999AA0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_247999AB0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_247999AC0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_247999AD0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_247999AE0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_247999AF0()
{
  return MEMORY[0x270FA22D0]();
}

uint64_t sub_247999B00()
{
  return MEMORY[0x270FA22D8]();
}

uint64_t sub_247999B10()
{
  return MEMORY[0x270FA22E8]();
}

uint64_t sub_247999B20()
{
  return MEMORY[0x270FA22F8]();
}

uint64_t sub_247999B30()
{
  return MEMORY[0x270FA2300]();
}

uint64_t sub_247999B40()
{
  return MEMORY[0x270FA2310]();
}

uint64_t sub_247999B50()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_247999B60()
{
  return MEMORY[0x270F9F578]();
}

uint64_t sub_247999B70()
{
  return MEMORY[0x270F9F658]();
}

uint64_t sub_247999B80()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_247999B90()
{
  return MEMORY[0x270F9F7E8]();
}

uint64_t sub_247999BA0()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_247999BB0()
{
  return MEMORY[0x270F9F878]();
}

uint64_t sub_247999BC0()
{
  return MEMORY[0x270F9F898]();
}

uint64_t sub_247999BD0()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_247999BE0()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_247999BF0()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_247999C10()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_247999C20()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_247999C30()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_247999C40()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_247999C50()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_247999C60()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_247999C70()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_247999C80()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_247999C90()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_247999CA0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_247999CB0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_247999CC0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_247999CD0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_247999CE0()
{
  return MEMORY[0x270F9FD50]();
}

uint64_t sub_247999CF0()
{
  return MEMORY[0x270F9FD58]();
}

uint64_t sub_247999D00()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_247999D10()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_247999D20()
{
  return MEMORY[0x270F9FD80]();
}

uint64_t sub_247999D30()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_247999D40()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_247999D70()
{
  return MEMORY[0x270FA0128]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_internalBuild()
{
  return MEMORY[0x270F96148]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
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

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x270FA04B0]();
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

uint64_t swift_unownedRelease()
{
  return MEMORY[0x270FA0610]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x270FA0618]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x270FA0620]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}