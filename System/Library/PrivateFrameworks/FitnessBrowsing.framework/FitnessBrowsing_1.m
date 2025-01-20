uint64_t sub_24EC07504(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  *(unsigned char *)(v3 + 152) = a3;
  *(void *)(v3 + 48) = a1;
  *(void *)(v3 + 56) = a2;
  *(void *)(v3 + 64) = type metadata accessor for BrowseAction();
  *(void *)(v3 + 72) = swift_task_alloc();
  sub_24EC22B80();
  *(void *)(v3 + 80) = sub_24EC22B70();
  v5 = sub_24EC22B50();
  *(void *)(v3 + 88) = v5;
  *(void *)(v3 + 96) = v4;
  return MEMORY[0x270FA2498](sub_24EC075D0, v5, v4);
}

uint64_t sub_24EC075D0()
{
  uint64_t v1 = v0[7];
  v2 = *(int **)(v1 + 32);
  v3 = (_OWORD *)swift_allocObject();
  v0[13] = v3;
  v3[1] = *(_OWORD *)v1;
  long long v4 = *(_OWORD *)(v1 + 64);
  long long v6 = *(_OWORD *)(v1 + 16);
  long long v5 = *(_OWORD *)(v1 + 32);
  v3[4] = *(_OWORD *)(v1 + 48);
  v3[5] = v4;
  v3[2] = v6;
  v3[3] = v5;
  long long v7 = *(_OWORD *)(v1 + 128);
  long long v9 = *(_OWORD *)(v1 + 80);
  long long v8 = *(_OWORD *)(v1 + 96);
  v3[8] = *(_OWORD *)(v1 + 112);
  v3[9] = v7;
  v3[6] = v9;
  v3[7] = v8;
  long long v10 = *(_OWORD *)(v1 + 192);
  long long v12 = *(_OWORD *)(v1 + 144);
  long long v11 = *(_OWORD *)(v1 + 160);
  v3[12] = *(_OWORD *)(v1 + 176);
  v3[13] = v10;
  v3[10] = v12;
  v3[11] = v11;
  sub_24EC130B4(v1);
  v15 = (int *)((char *)v2 + *v2);
  v13 = (void *)swift_task_alloc();
  v0[14] = v13;
  void *v13 = v0;
  v13[1] = sub_24EC07720;
  return ((uint64_t (*)(BOOL (*)(uint64_t), _OWORD *))v15)(sub_24EC141F4, v3);
}

uint64_t sub_24EC07720(uint64_t a1)
{
  long long v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 120) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[11];
    uint64_t v6 = v4[12];
    long long v7 = sub_24EC07B50;
  }
  else
  {
    swift_release();
    v4[16] = a1;
    uint64_t v5 = v4[11];
    uint64_t v6 = v4[12];
    long long v7 = sub_24EC07850;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_24EC07850()
{
  uint64_t v1 = *(uint64_t **)(v0 + 72);
  uint64_t v2 = Array<A>.includingMarketingUpsellSectionDescriptors(isSubscribed:)(*(unsigned char *)(v0 + 152), *(void *)(v0 + 128));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269948688) + 48);
  *uint64_t v1 = v2;
  type metadata accessor for BrowseContent();
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_24EC07E24(v2);
  swift_bridgeObjectRelease();
  *(uint64_t *)((char *)v1 + v3) = v4;
  swift_storeEnumTagMultiPayload();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486C8);
  *uint64_t v5 = v0;
  v5[1] = sub_24EC0798C;
  uint64_t v7 = *(void *)(v0 + 72);
  return MEMORY[0x270F252C8](v7, v6);
}

uint64_t sub_24EC0798C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 72);
  swift_task_dealloc();
  sub_24EC14068(v2, (uint64_t (*)(void))type metadata accessor for BrowseAction);
  uint64_t v3 = *(void *)(v1 + 96);
  uint64_t v4 = *(void *)(v1 + 88);
  return MEMORY[0x270FA2498](sub_24EC07AE4, v4, v3);
}

uint64_t sub_24EC07AE4()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EC07B50()
{
  uint64_t v1 = *(uint64_t **)(v0 + 72);
  swift_release();
  swift_getErrorValue();
  *uint64_t v1 = sub_24EC22FA0();
  v1[1] = v2;
  swift_storeEnumTagMultiPayload();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486C8);
  void *v3 = v0;
  v3[1] = sub_24EC07C54;
  uint64_t v5 = *(void *)(v0 + 72);
  return MEMORY[0x270F252C8](v5, v4);
}

uint64_t sub_24EC07C54()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 72);
  swift_task_dealloc();
  sub_24EC14068(v2, (uint64_t (*)(void))type metadata accessor for BrowseAction);
  uint64_t v3 = *(void *)(v1 + 96);
  uint64_t v4 = *(void *)(v1 + 88);
  return MEMORY[0x270FA2498](sub_24EC07DAC, v4, v3);
}

uint64_t sub_24EC07DAC()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_release();
  MEMORY[0x25334ADD0](v1);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24EC07E24(uint64_t a1)
{
  uint64_t v79 = sub_24EC21DF0();
  v88 = *(char **)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  v78 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v77 = (uint64_t)&v59 - v4;
  uint64_t v73 = type metadata accessor for BrowseItem();
  MEMORY[0x270FA5388](v73);
  uint64_t v72 = (uint64_t)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = type metadata accessor for BrowseLazyItem();
  uint64_t v75 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  uint64_t v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  long long v10 = (char *)&v59 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486D0);
  uint64_t v87 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  v74 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486D8);
  MEMORY[0x270FA5388](v13 - 8);
  v83 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v17 = (uint64_t *)((char *)&v59 - v16);
  uint64_t v65 = type metadata accessor for BrowseSectionDescriptor();
  uint64_t v61 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  v19 = (char *)&v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for BrowseEditorialDescriptor();
  MEMORY[0x270FA5388](v20 - 8);
  v63 = (char *)&v59 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486E0);
  uint64_t v22 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  v60 = (char *)&v59 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486E8);
  MEMORY[0x270FA5388](v24 - 8);
  v26 = (char *)&v59 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  v68 = (uint64_t *)((char *)&v59 - v28);
  uint64_t v89 = MEMORY[0x263F8EE88];
  v67 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
  unint64_t v29 = *(void *)(a1 + 16);
  v66 = (unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v22 + 48);
  v30 = (unint64_t *)v83;
  v85 = (unsigned int (**)(void *, uint64_t, uint64_t))(v87 + 48);
  v86 = (void (**)(unint64_t *, uint64_t, uint64_t, uint64_t))(v87 + 56);
  v76 = (void (**)(uint64_t, uint64_t))(v88 + 8);
  uint64_t v62 = a1;
  swift_bridgeObjectRetain();
  unint64_t v31 = 0;
  v82 = v17;
  v88 = v19;
  v69 = v26;
  for (i = v29; ; unint64_t v29 = i)
  {
    if (v31 == v29)
    {
      uint64_t v34 = 1;
      unint64_t v70 = v29;
      uint64_t v35 = v71;
    }
    else
    {
      if (v31 >= v29) {
        goto LABEL_32;
      }
      unint64_t v36 = v31 + 1;
      unint64_t v37 = v31;
      uint64_t v38 = (uint64_t)&v60[*(int *)(v71 + 48)];
      sub_24EC14124(v62+ ((*(unsigned __int8 *)(v61 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80))+ *(void *)(v61 + 72) * v31, v38, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
      v26 = v69;
      uint64_t v39 = (uint64_t)&v69[*(int *)(v71 + 48)];
      *(void *)v69 = v37;
      uint64_t v40 = v38;
      v19 = v88;
      sub_24EC1418C(v40, v39, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
      uint64_t v35 = v71;
      uint64_t v34 = 0;
      unint64_t v70 = v36;
    }
    (*v67)(v26, v34, 1, v35);
    uint64_t v41 = (uint64_t)v26;
    v42 = v68;
    sub_24EB7D0B0(v41, (uint64_t)v68, &qword_2699486E8);
    if ((*v66)(v42, 1, v35) == 1) {
      break;
    }
    uint64_t v43 = *v42;
    sub_24EC1418C((uint64_t)v42 + *(int *)(v35 + 48), (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
    if (swift_getEnumCaseMultiPayload() != 2)
    {
      v32 = type metadata accessor for BrowseSectionDescriptor;
      uint64_t v33 = (uint64_t)v19;
      goto LABEL_3;
    }
    uint64_t v80 = v43;
    v44 = v63;
    sub_24EC1418C((uint64_t)v19, (uint64_t)v63, (uint64_t (*)(void))type metadata accessor for BrowseEditorialDescriptor);
    if (v44[8] != 1)
    {
      v32 = type metadata accessor for BrowseEditorialDescriptor;
      uint64_t v33 = (uint64_t)v44;
      goto LABEL_3;
    }
    uint64_t v45 = *(void *)v44;
    unint64_t v46 = *(void *)(*(void *)v44 + 16);
    swift_bridgeObjectRetain();
    unint64_t v47 = v46;
    unint64_t v48 = 0;
    unint64_t v84 = v46;
    while (1)
    {
      if (v48 == v47)
      {
        uint64_t v51 = 1;
        unint64_t v48 = v47;
      }
      else
      {
        if ((v48 & 0x8000000000000000) != 0)
        {
          __break(1u);
LABEL_31:
          __break(1u);
LABEL_32:
          __break(1u);
          JUMPOUT(0x24EC08900);
        }
        if (v48 >= *(void *)(v45 + 16)) {
          goto LABEL_31;
        }
        uint64_t v52 = (uint64_t)&v74[*(int *)(v11 + 48)];
        sub_24EC14124(v45+ ((*(unsigned __int8 *)(v75 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80))+ *(void *)(v75 + 72) * v48, v52, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
        uint64_t v53 = (uint64_t)v30 + *(int *)(v11 + 48);
        unint64_t *v30 = v48;
        uint64_t v54 = v52;
        v19 = v88;
        sub_24EC1418C(v54, v53, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
        uint64_t v51 = 0;
        ++v48;
      }
      (*v86)(v30, v51, 1, v11);
      sub_24EB7D0B0((uint64_t)v30, (uint64_t)v17, &qword_2699486D8);
      if ((*v85)(v17, 1, v11) == 1) {
        break;
      }
      uint64_t v87 = *v17;
      sub_24EC1418C((uint64_t)v17 + *(int *)(v11 + 48), (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
      sub_24EC14124((uint64_t)v10, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        int v55 = v7[72];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v19 = v88;
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v56 = v72;
        sub_24EC1418C((uint64_t)v7, v72, (uint64_t (*)(void))type metadata accessor for BrowseItem);
        int v55 = *(unsigned __int8 *)(v56 + *(int *)(v73 + 68));
        sub_24EC14068(v56, (uint64_t (*)(void))type metadata accessor for BrowseItem);
      }
      switch(v55)
      {
        case 7:
          swift_bridgeObjectRelease();
          goto LABEL_13;
        default:
          char v57 = sub_24EC22F70();
          swift_bridgeObjectRelease();
          if (v57)
          {
LABEL_13:
            v49 = v78;
            MEMORY[0x253349960](v87, v80);
            uint64_t v50 = v77;
            sub_24EC10CB8(v77, v49);
            v19 = v88;
            (*v76)(v50, v79);
          }
          sub_24EC14068((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
          v17 = v82;
          v30 = (unint64_t *)v83;
          unint64_t v47 = v84;
          break;
      }
    }
    swift_bridgeObjectRelease();
    v32 = type metadata accessor for BrowseEditorialDescriptor;
    uint64_t v33 = (uint64_t)v63;
LABEL_3:
    sub_24EC14068(v33, (uint64_t (*)(void))v32);
    v26 = v69;
    unint64_t v31 = v70;
  }
  swift_bridgeObjectRelease();
  return v89;
}

uint64_t sub_24EC08924(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BrowseGalleryDescriptor();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for BrowseEditorialDescriptor();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (unsigned __int8 *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for BrowseDetailDescriptor();
  MEMORY[0x270FA5388](v8);
  long long v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for BrowseSectionDescriptor();
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(a1 + 16);
  if (!v15) {
    return 2;
  }
  uint64_t v16 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v17 = *(void *)(v12 + 72);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_24EC14124(v16, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 2) {
      break;
    }
    sub_24EC1418C((uint64_t)v14, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for BrowseEditorialDescriptor);
    if (*(void *)(*(void *)v7 + 16))
    {
      swift_bridgeObjectRelease();
      uint64_t v19 = v7[32];
      sub_24EC14068((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for BrowseEditorialDescriptor);
      return v19;
    }
    sub_24EC14068((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for BrowseEditorialDescriptor);
    v16 += v17;
    if (!--v15)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
  }
  switch(EnumCaseMultiPayload)
  {
    case 1:
      swift_bridgeObjectRelease();
      sub_24EC1418C((uint64_t)v14, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for BrowseDetailDescriptor);
      uint64_t v19 = v10[*(int *)(v8 + 24)];
      sub_24EC14068((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for BrowseDetailDescriptor);
      return v19;
    case 2:
      __break(1u);
      JUMPOUT(0x24EC08CD0);
    case 3:
      swift_bridgeObjectRelease();
      sub_24EC1418C((uint64_t)v14, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for BrowseGalleryDescriptor);
      uint64_t v19 = v4[32];
      sub_24EC14068((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for BrowseGalleryDescriptor);
      return v19;
    case 4:
      swift_bridgeObjectRelease();
      uint64_t v19 = v14[16];
      swift_bridgeObjectRelease();
      return v19;
    case 5:
      swift_bridgeObjectRelease();
      sub_24EC14068((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
      goto LABEL_14;
    default:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      uint64_t v19 = 0;
      break;
  }
  return v19;
}

uint64_t sub_24EC08CE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = type metadata accessor for BrowseAction();
  v4[7] = swift_task_alloc();
  type metadata accessor for EditorialCollectionDetail();
  v4[8] = swift_task_alloc();
  sub_24EC22B80();
  v4[9] = sub_24EC22B70();
  uint64_t v6 = sub_24EC22B50();
  v4[10] = v6;
  v4[11] = v5;
  return MEMORY[0x270FA2498](sub_24EC08DE0, v6, v5);
}

uint64_t sub_24EC08DE0()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = *(int **)v1;
  uint64_t v3 = (_OWORD *)swift_allocObject();
  v0[12] = v3;
  v3[1] = *(_OWORD *)v1;
  long long v4 = *(_OWORD *)(v1 + 64);
  long long v6 = *(_OWORD *)(v1 + 16);
  long long v5 = *(_OWORD *)(v1 + 32);
  v3[4] = *(_OWORD *)(v1 + 48);
  v3[5] = v4;
  v3[2] = v6;
  v3[3] = v5;
  long long v7 = *(_OWORD *)(v1 + 128);
  long long v9 = *(_OWORD *)(v1 + 80);
  long long v8 = *(_OWORD *)(v1 + 96);
  v3[8] = *(_OWORD *)(v1 + 112);
  v3[9] = v7;
  v3[6] = v9;
  v3[7] = v8;
  long long v10 = *(_OWORD *)(v1 + 192);
  long long v12 = *(_OWORD *)(v1 + 144);
  long long v11 = *(_OWORD *)(v1 + 160);
  v3[12] = *(_OWORD *)(v1 + 176);
  v3[13] = v10;
  v3[10] = v12;
  v3[11] = v11;
  sub_24EC130B4(v1);
  uint64_t v18 = (int *)((char *)v2 + *v2);
  uint64_t v13 = (void *)swift_task_alloc();
  v0[13] = v13;
  void *v13 = v0;
  v13[1] = sub_24EC08F3C;
  uint64_t v14 = v0[8];
  uint64_t v15 = v0[4];
  uint64_t v16 = v0[5];
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, BOOL (*)(uint64_t), _OWORD *))v18)(v14, v15, v16, sub_24EC1404C, v3);
}

uint64_t sub_24EC08F3C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 88);
    long long v5 = sub_24EC09364;
  }
  else
  {
    swift_release();
    uint64_t v3 = *(void *)(v2 + 80);
    uint64_t v4 = *(void *)(v2 + 88);
    long long v5 = sub_24EC09058;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_24EC09058()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  uint64_t v3 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269948688) + 48);
  sub_24EC14124(v2, v1, (uint64_t (*)(void))type metadata accessor for EditorialCollectionDetail);
  type metadata accessor for BrowseContent();
  swift_storeEnumTagMultiPayload();
  *(void *)(v1 + v3) = MEMORY[0x263F8EE88];
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[15] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486C8);
  *uint64_t v4 = v0;
  v4[1] = sub_24EC09178;
  uint64_t v6 = v0[7];
  return MEMORY[0x270F252C8](v6, v5);
}

uint64_t sub_24EC09178()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 56);
  swift_task_dealloc();
  sub_24EC14068(v2, (uint64_t (*)(void))type metadata accessor for BrowseAction);
  uint64_t v3 = *(void *)(v1 + 88);
  uint64_t v4 = *(void *)(v1 + 80);
  return MEMORY[0x270FA2498](sub_24EC092D0, v4, v3);
}

uint64_t sub_24EC092D0()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_release();
  sub_24EC14068(v1, (uint64_t (*)(void))type metadata accessor for EditorialCollectionDetail);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24EC09364()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

BOOL sub_24EC093F0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BrowseDetailContent();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for BrowseInsetBehaviorProviderType();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (unsigned __int8 *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EC14124(a1, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for BrowseInsetBehaviorProviderType);
  if (swift_getEnumCaseMultiPayload() != 1) {
    return *v7 == 25;
  }
  sub_24EC1418C((uint64_t)v7, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for BrowseDetailContent);
  BOOL v8 = swift_getEnumCaseMultiPayload() == 0;
  sub_24EC14068((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for BrowseDetailContent);
  return v8;
}

uint64_t sub_24EC09554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 32) = a5;
  *(void *)(v6 + 40) = a6;
  *(unsigned char *)(v6 + 128) = a3;
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a4;
  *(void *)(v6 + 48) = type metadata accessor for BrowseAction();
  *(void *)(v6 + 56) = swift_task_alloc();
  *(void *)(v6 + 64) = sub_24EC22B80();
  *(void *)(v6 + 72) = sub_24EC22B70();
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  long long v11 = (void *)swift_task_alloc();
  *(void *)(v6 + 80) = v11;
  *long long v11 = v6;
  v11[1] = sub_24EC0969C;
  return v13(a3, a4, a5);
}

uint64_t sub_24EC0969C(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 88) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_24EC22B50();
    uint64_t v7 = v6;
    BOOL v8 = sub_24EC09B80;
    uint64_t v9 = v5;
    uint64_t v10 = v7;
  }
  else
  {
    v4[12] = a1;
    uint64_t v11 = sub_24EC22B50();
    uint64_t v10 = v12;
    v4[13] = v11;
    v4[14] = v12;
    BOOL v8 = sub_24EC0982C;
    uint64_t v9 = v11;
  }
  return MEMORY[0x270FA2498](v8, v9, v10);
}

uint64_t sub_24EC0982C()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 24);
  char v6 = *(unsigned char *)(v0 + 128);
  uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269948688) + 48);
  uint64_t v8 = v2 + *(int *)(type metadata accessor for BrowseGalleryDescriptor() + 32);
  uint64_t v9 = sub_24EC21D10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v8, v4, v9);
  *(unsigned char *)uint64_t v2 = v6;
  *(void *)(v2 + 8) = v5;
  *(void *)(v2 + 16) = v3;
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 32) = 0;
  type metadata accessor for BrowseContent();
  swift_storeEnumTagMultiPayload();
  *(void *)(v2 + v7) = MEMORY[0x263F8EE88];
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486C8);
  *uint64_t v10 = v0;
  v10[1] = sub_24EC099B8;
  uint64_t v12 = *(void *)(v0 + 56);
  return MEMORY[0x270F252C8](v12, v11);
}

uint64_t sub_24EC099B8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 56);
  swift_task_dealloc();
  sub_24EC14068(v2, (uint64_t (*)(void))type metadata accessor for BrowseAction);
  uint64_t v3 = *(void *)(v1 + 112);
  uint64_t v4 = *(void *)(v1 + 104);
  return MEMORY[0x270FA2498](sub_24EC09B10, v4, v3);
}

uint64_t sub_24EC09B10()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EC09B80()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EC09BF0(uint64_t a1)
{
  v1[2] = a1;
  v1[3] = type metadata accessor for BrowseAction();
  v1[4] = swift_task_alloc();
  sub_24EC22B80();
  v1[5] = sub_24EC22B70();
  uint64_t v3 = sub_24EC22B50();
  v1[6] = v3;
  v1[7] = v2;
  return MEMORY[0x270FA2498](sub_24EC09CB8, v3, v2);
}

uint64_t sub_24EC09CB8()
{
  swift_storeEnumTagMultiPayload();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486C8);
  *uint64_t v1 = v0;
  v1[1] = sub_24EC09D70;
  uint64_t v3 = *(void *)(v0 + 32);
  return MEMORY[0x270F252C8](v3, v2);
}

uint64_t sub_24EC09D70()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 32);
  swift_task_dealloc();
  sub_24EC14068(v2, (uint64_t (*)(void))type metadata accessor for BrowseAction);
  uint64_t v3 = *(void *)(v1 + 56);
  uint64_t v4 = *(void *)(v1 + 48);
  return MEMORY[0x270FA2498](sub_24EC141FC, v4, v3);
}

uint64_t sub_24EC09EC8(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  v2[13] = type metadata accessor for BrowseAction();
  v2[14] = swift_task_alloc();
  v2[15] = sub_24EC22B80();
  v2[16] = sub_24EC22B70();
  uint64_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 48) + **(int **)(a2 + 48));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[17] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EC09FF8;
  return v6(v2 + 7);
}

uint64_t sub_24EC09FF8()
{
  uint64_t v2 = (void *)*v1;
  v2[18] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EC22B50();
  v2[19] = v4;
  v2[20] = v3;
  if (v0) {
    uint64_t v5 = sub_24EC141F8;
  }
  else {
    uint64_t v5 = sub_24EC0A158;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EC0A158()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_24EC22BD0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = sub_24EC22B70();
  v0[21] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24EC0A348;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 24, v5, v7);
}

uint64_t sub_24EC0A348()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24EC0A48C, v3, v2);
}

uint64_t sub_24EC0A48C()
{
  if (*(unsigned char *)(v0 + 192) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486C8);
    void *v3 = v0;
    v3[1] = sub_24EC0A5A4;
    uint64_t v5 = *(void *)(v0 + 112);
    return MEMORY[0x270F252C8](v5, v4);
  }
}

uint64_t sub_24EC0A5A4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 112);
  swift_task_dealloc();
  sub_24EC14068(v2, (uint64_t (*)(void))type metadata accessor for BrowseAction);
  uint64_t v3 = *(void *)(v1 + 160);
  uint64_t v4 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24EC0A6FC, v4, v3);
}

uint64_t sub_24EC0A6FC()
{
  uint64_t v1 = sub_24EC22B70();
  v0[21] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = sub_24EC0A348;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 24, v1, v3);
}

uint64_t sub_24EC0A7E8(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  v2[13] = type metadata accessor for BrowseAction();
  v2[14] = swift_task_alloc();
  v2[15] = sub_24EC22B80();
  v2[16] = sub_24EC22B70();
  uint64_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 64) + **(int **)(a2 + 64));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[17] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EC0A918;
  return v6(v2 + 7);
}

uint64_t sub_24EC0A918()
{
  uint64_t v2 = (void *)*v1;
  v2[18] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EC22B50();
  v2[19] = v4;
  v2[20] = v3;
  if (v0) {
    uint64_t v5 = sub_24EC141F8;
  }
  else {
    uint64_t v5 = sub_24EC0AA78;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EC0AA78()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_24EC22BD0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = sub_24EC22B70();
  v0[21] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24EC0AC68;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 24, v5, v7);
}

uint64_t sub_24EC0AC68()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24EC0ADAC, v3, v2);
}

uint64_t sub_24EC0ADAC()
{
  if (*(unsigned char *)(v0 + 192) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    sub_24EC21D60();
    swift_storeEnumTagMultiPayload();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486C8);
    void *v3 = v0;
    v3[1] = sub_24EC0AED4;
    uint64_t v5 = *(void *)(v0 + 112);
    return MEMORY[0x270F252C8](v5, v4);
  }
}

uint64_t sub_24EC0AED4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 112);
  swift_task_dealloc();
  sub_24EC14068(v2, (uint64_t (*)(void))type metadata accessor for BrowseAction);
  uint64_t v3 = *(void *)(v1 + 160);
  uint64_t v4 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24EC0B02C, v4, v3);
}

uint64_t sub_24EC0B02C()
{
  uint64_t v1 = sub_24EC22B70();
  v0[21] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = sub_24EC0AC68;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 24, v1, v3);
}

uint64_t sub_24EC0B118(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  v2[13] = type metadata accessor for BrowseAction();
  v2[14] = swift_task_alloc();
  v2[15] = sub_24EC22B80();
  v2[16] = sub_24EC22B70();
  uint64_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 80) + **(int **)(a2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[17] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EC0B248;
  return v6(v2 + 7);
}

uint64_t sub_24EC0B248()
{
  uint64_t v2 = (void *)*v1;
  v2[18] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EC22B50();
  v2[19] = v4;
  v2[20] = v3;
  if (v0) {
    uint64_t v5 = sub_24EC141F8;
  }
  else {
    uint64_t v5 = sub_24EC0B3A8;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EC0B3A8()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_24EC22BD0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = sub_24EC22B70();
  v0[21] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24EC0B598;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 24, v5, v7);
}

uint64_t sub_24EC0B598()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24EC0B6DC, v3, v2);
}

uint64_t sub_24EC0B6DC()
{
  if (*(unsigned char *)(v0 + 192) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486C8);
    void *v3 = v0;
    v3[1] = sub_24EC0B7F4;
    uint64_t v5 = *(void *)(v0 + 112);
    return MEMORY[0x270F252C8](v5, v4);
  }
}

uint64_t sub_24EC0B7F4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 112);
  swift_task_dealloc();
  sub_24EC14068(v2, (uint64_t (*)(void))type metadata accessor for BrowseAction);
  uint64_t v3 = *(void *)(v1 + 160);
  uint64_t v4 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24EC0B94C, v4, v3);
}

uint64_t sub_24EC0B94C()
{
  uint64_t v1 = sub_24EC22B70();
  v0[21] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = sub_24EC0B598;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 24, v1, v3);
}

uint64_t sub_24EC0BA38(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  v2[13] = type metadata accessor for BrowseAction();
  v2[14] = swift_task_alloc();
  v2[15] = sub_24EC22B80();
  v2[16] = sub_24EC22B70();
  uint64_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 96) + **(int **)(a2 + 96));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[17] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EC0BB68;
  return v6(v2 + 7);
}

uint64_t sub_24EC0BB68()
{
  uint64_t v2 = (void *)*v1;
  v2[18] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EC22B50();
  v2[19] = v4;
  v2[20] = v3;
  if (v0) {
    uint64_t v5 = sub_24EC141F8;
  }
  else {
    uint64_t v5 = sub_24EC0BCC8;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EC0BCC8()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_24EC22BD0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = sub_24EC22B70();
  v0[21] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24EC0BEB8;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 24, v5, v7);
}

uint64_t sub_24EC0BEB8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24EC0BFFC, v3, v2);
}

uint64_t sub_24EC0BFFC()
{
  if (*(unsigned char *)(v0 + 192) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486C8);
    void *v3 = v0;
    v3[1] = sub_24EC0C114;
    uint64_t v5 = *(void *)(v0 + 112);
    return MEMORY[0x270F252C8](v5, v4);
  }
}

uint64_t sub_24EC0C114()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 112);
  swift_task_dealloc();
  sub_24EC14068(v2, (uint64_t (*)(void))type metadata accessor for BrowseAction);
  uint64_t v3 = *(void *)(v1 + 160);
  uint64_t v4 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24EC0C26C, v4, v3);
}

uint64_t sub_24EC0C26C()
{
  uint64_t v1 = sub_24EC22B70();
  v0[21] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = sub_24EC0BEB8;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 24, v1, v3);
}

uint64_t sub_24EC0C358(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  v2[13] = type metadata accessor for BrowseAction();
  v2[14] = swift_task_alloc();
  v2[15] = sub_24EC22B80();
  v2[16] = sub_24EC22B70();
  uint64_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 112) + **(int **)(a2 + 112));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[17] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EC0C488;
  return v6(v2 + 7);
}

uint64_t sub_24EC0C488()
{
  uint64_t v2 = (void *)*v1;
  v2[18] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EC22B50();
  v2[19] = v4;
  v2[20] = v3;
  if (v0) {
    uint64_t v5 = sub_24EC141F8;
  }
  else {
    uint64_t v5 = sub_24EC0C5E8;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EC0C5E8()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_24EC22BD0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = sub_24EC22B70();
  v0[21] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24EC0C7D8;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 24, v5, v7);
}

uint64_t sub_24EC0C7D8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24EC0C91C, v3, v2);
}

uint64_t sub_24EC0C91C()
{
  if (*(unsigned char *)(v0 + 192) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486C8);
    void *v3 = v0;
    v3[1] = sub_24EC0CA34;
    uint64_t v5 = *(void *)(v0 + 112);
    return MEMORY[0x270F252C8](v5, v4);
  }
}

uint64_t sub_24EC0CA34()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 112);
  swift_task_dealloc();
  sub_24EC14068(v2, (uint64_t (*)(void))type metadata accessor for BrowseAction);
  uint64_t v3 = *(void *)(v1 + 160);
  uint64_t v4 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24EC0CB8C, v4, v3);
}

uint64_t sub_24EC0CB8C()
{
  uint64_t v1 = sub_24EC22B70();
  v0[21] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = sub_24EC0C7D8;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 24, v1, v3);
}

uint64_t sub_24EC0CC78(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 104) = sub_24EC22B80();
  *(void *)(v2 + 112) = sub_24EC22B70();
  uint64_t v4 = *(int **)(a2 + 144);
  *(_OWORD *)(v2 + 120) = *(_OWORD *)(a2 + 192);
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 136) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24EC0CD78;
  return v7(v2 + 56);
}

uint64_t sub_24EC0CD78()
{
  uint64_t v2 = (void *)*v1;
  v2[18] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EC22B50();
  v2[19] = v4;
  v2[20] = v3;
  if (v0) {
    uint64_t v5 = sub_24EC0D364;
  }
  else {
    uint64_t v5 = sub_24EC0CED8;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EC0CED8()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_24EC22BD0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = sub_24EC22B70();
  v0[21] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24EC0D0C8;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 12, v5, v7);
}

uint64_t sub_24EC0D0C8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24EC0D20C, v3, v2);
}

uint64_t sub_24EC0D20C()
{
  if (*(void *)(v0 + 96))
  {
    (*(void (**)(void))(v0 + 120))(*(void *)(v0 + 96));
    swift_bridgeObjectRelease();
    uint64_t v1 = sub_24EC22B70();
    *(void *)(v0 + 168) = v1;
    __swift_mutable_project_boxed_opaque_existential_1(v0 + 16, *(void *)(v0 + 40));
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v2;
    void *v2 = v0;
    v2[1] = sub_24EC0D0C8;
    uint64_t v3 = MEMORY[0x263F8F500];
    return MEMORY[0x270FA1E88](v0 + 96, v1, v3);
  }
  else
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
}

uint64_t sub_24EC0D364()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EC0D3C8(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  v2[13] = type metadata accessor for BrowseAction();
  v2[14] = swift_task_alloc();
  v2[15] = sub_24EC22B80();
  v2[16] = sub_24EC22B70();
  uint64_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 128) + **(int **)(a2 + 128));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[17] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EC0D4F8;
  return v6(v2 + 7);
}

uint64_t sub_24EC0D4F8()
{
  uint64_t v2 = (void *)*v1;
  v2[18] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EC22B50();
  v2[19] = v4;
  v2[20] = v3;
  if (v0) {
    uint64_t v5 = sub_24EC141F8;
  }
  else {
    uint64_t v5 = sub_24EC0D658;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EC0D658()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_24EC22BD0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = sub_24EC22B70();
  v0[21] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24EC0D848;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 24, v5, v7);
}

uint64_t sub_24EC0D848()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24EC0D98C, v3, v2);
}

uint64_t sub_24EC0D98C()
{
  if (*(unsigned char *)(v0 + 192) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486C8);
    void *v3 = v0;
    v3[1] = sub_24EC0DAA4;
    uint64_t v5 = *(void *)(v0 + 112);
    return MEMORY[0x270F252C8](v5, v4);
  }
}

uint64_t sub_24EC0DAA4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 112);
  swift_task_dealloc();
  sub_24EC14068(v2, (uint64_t (*)(void))type metadata accessor for BrowseAction);
  uint64_t v3 = *(void *)(v1 + 160);
  uint64_t v4 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24EC0DBFC, v4, v3);
}

uint64_t sub_24EC0DBFC()
{
  uint64_t v1 = sub_24EC22B70();
  v0[21] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = sub_24EC0D848;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 24, v1, v3);
}

uint64_t sub_24EC0DCE8(uint64_t a1, uint64_t a2)
{
  v2[12] = a1;
  v2[13] = type metadata accessor for BrowseAction();
  v2[14] = swift_task_alloc();
  v2[15] = sub_24EC22B80();
  v2[16] = sub_24EC22B70();
  uint64_t v6 = (uint64_t (*)(void *))(*(void *)(a2 + 160) + **(int **)(a2 + 160));
  uint64_t v4 = (void *)swift_task_alloc();
  v2[17] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EC0DE18;
  return v6(v2 + 7);
}

uint64_t sub_24EC0DE18()
{
  uint64_t v2 = (void *)*v1;
  v2[18] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24EC22B50();
  v2[19] = v4;
  v2[20] = v3;
  if (v0) {
    uint64_t v5 = sub_24EC0E608;
  }
  else {
    uint64_t v5 = sub_24EC0DF78;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EC0DF78()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_24EC22BD0();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = sub_24EC22B70();
  v0[21] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24EC0E168;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 24, v5, v7);
}

uint64_t sub_24EC0E168()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24EC0E2AC, v3, v2);
}

uint64_t sub_24EC0E2AC()
{
  if (*(unsigned char *)(v0 + 192) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486C8);
    void *v3 = v0;
    v3[1] = sub_24EC0E3C4;
    uint64_t v5 = *(void *)(v0 + 112);
    return MEMORY[0x270F252C8](v5, v4);
  }
}

uint64_t sub_24EC0E3C4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 112);
  swift_task_dealloc();
  sub_24EC14068(v2, (uint64_t (*)(void))type metadata accessor for BrowseAction);
  uint64_t v3 = *(void *)(v1 + 160);
  uint64_t v4 = *(void *)(v1 + 152);
  return MEMORY[0x270FA2498](sub_24EC0E51C, v4, v3);
}

uint64_t sub_24EC0E51C()
{
  uint64_t v1 = sub_24EC22B70();
  v0[21] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[22] = (uint64_t)v2;
  void *v2 = v0;
  v2[1] = sub_24EC0E168;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 24, v1, v3);
}

uint64_t sub_24EC0E608()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EC0E678(uint64_t a1)
{
  v1[2] = a1;
  v1[3] = type metadata accessor for BrowseAction();
  v1[4] = swift_task_alloc();
  sub_24EC22B80();
  v1[5] = sub_24EC22B70();
  uint64_t v3 = sub_24EC22B50();
  v1[6] = v3;
  v1[7] = v2;
  return MEMORY[0x270FA2498](sub_24EC0E740, v3, v2);
}

uint64_t sub_24EC0E740()
{
  swift_storeEnumTagMultiPayload();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486C8);
  *uint64_t v1 = v0;
  v1[1] = sub_24EC0E7F8;
  uint64_t v3 = *(void *)(v0 + 32);
  return MEMORY[0x270F252C8](v3, v2);
}

uint64_t sub_24EC0E7F8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 32);
  swift_task_dealloc();
  sub_24EC14068(v2, (uint64_t (*)(void))type metadata accessor for BrowseAction);
  uint64_t v3 = *(void *)(v1 + 56);
  uint64_t v4 = *(void *)(v1 + 48);
  return MEMORY[0x270FA2498](sub_24EC0E950, v4, v3);
}

uint64_t sub_24EC0E950()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EC0E9BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v96 = a3;
  uint64_t v90 = a1;
  uint64_t v6 = sub_24EC21DF0();
  uint64_t v78 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v97 = (char *)v69 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269948708);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = type metadata accessor for BrowseLazyItem();
  uint64_t v14 = *(void *)(v89 - 8);
  MEMORY[0x270FA5388](v89);
  uint64_t v88 = (uint64_t)v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v84 = (uint64_t)v69 - v17;
  uint64_t v18 = sub_24EC21D10();
  uint64_t v76 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v75 = (uint64_t)v69 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486D0);
  MEMORY[0x270FA5388](v87);
  v86 = (char *)v69 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  v93 = (void *)((char *)v69 - v25);
  uint64_t v74 = type metadata accessor for BrowseEditorialDescriptor();
  MEMORY[0x270FA5388](v74);
  uint64_t v77 = (uint64_t)v69 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = type metadata accessor for BrowseSectionDescriptor();
  MEMORY[0x270FA5388](v27);
  unint64_t v29 = (char *)v69 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EC14124(a2, (uint64_t)v29, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 5u:
      sub_24EC14068((uint64_t)v29, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
      return sub_24EC14124(a2, a4, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
    case 2u:
      v30 = (unsigned char *)v77;
      sub_24EC1418C((uint64_t)v29, v77, (uint64_t (*)(void))type metadata accessor for BrowseEditorialDescriptor);
      if ((v30[8] & 1) == 0)
      {
        sub_24EC1418C((uint64_t)v30, a4, (uint64_t (*)(void))type metadata accessor for BrowseEditorialDescriptor);
        return swift_storeEnumTagMultiPayload();
      }
      v69[1] = v69;
      uint64_t v31 = *(void *)(*(void *)v30 + 16);
      uint64_t v32 = swift_bridgeObjectRetain();
      uint64_t v83 = v31;
      uint64_t v72 = (void *)a4;
      uint64_t v71 = v18;
      unint64_t v70 = v20;
      v69[2] = v27;
      v69[0] = v32;
      if (!v31)
      {
        unint64_t v91 = MEMORY[0x263F8EE78];
        goto LABEL_28;
      }
      uint64_t v33 = 0;
      unint64_t v34 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
      uint64_t v85 = *(void *)(v14 + 72);
      unint64_t v73 = v34;
      unint64_t v82 = v32 + v34;
      uint64_t v94 = v78 + 16;
      uint64_t v95 = v96 + 56;
      uint64_t v35 = (void (**)(char *, uint64_t))(v78 + 8);
      uint64_t v81 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
      unint64_t v91 = MEMORY[0x263F8EE78];
      uint64_t v79 = v13;
      uint64_t v80 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
      break;
    case 3u:
      sub_24EC14124(a2, a4, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
      return sub_24EC14068((uint64_t)v29, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
    case 4u:
      goto LABEL_23;
    default:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_23:
      swift_bridgeObjectRelease();
      return sub_24EC14124(a2, a4, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
  }
  do
  {
    uint64_t v36 = v87;
    uint64_t v37 = (uint64_t)&v86[*(int *)(v87 + 48)];
    sub_24EC14124(v82 + v85 * v33, v37, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
    uint64_t v38 = *(int *)(v36 + 48);
    uint64_t v39 = v93;
    uint64_t v40 = (uint64_t)v93 + v38;
    void *v93 = v33;
    uint64_t v92 = (uint64_t)v39 + v38;
    sub_24EC1418C(v37, v40, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
    MEMORY[0x253349960](v33, v90);
    if (*(void *)(v96 + 16)
      && (uint64_t v41 = v96,
          sub_24EC13F58(&qword_2699466F8, MEMORY[0x263F07A30]),
          uint64_t v42 = sub_24EC22A10(),
          uint64_t v43 = -1 << *(unsigned char *)(v41 + 32),
          unint64_t v44 = v42 & ~v43,
          ((*(void *)(v95 + ((v44 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v44) & 1) != 0))
    {
      uint64_t v45 = ~v43;
      uint64_t v46 = *(void *)(v78 + 72);
      unint64_t v47 = *(void (**)(char *, unint64_t, uint64_t))(v78 + 16);
      while (1)
      {
        v47(v8, *(void *)(v96 + 48) + v46 * v44, v6);
        sub_24EC13F58(&qword_2699486F0, MEMORY[0x263F07A30]);
        char v48 = sub_24EC22A30();
        v49 = *v35;
        (*v35)(v8, v6);
        if (v48) {
          break;
        }
        unint64_t v44 = (v44 + 1) & v45;
        if (((*(void *)(v95 + ((v44 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v44) & 1) == 0) {
          goto LABEL_14;
        }
      }
      v49(v97, v6);
      uint64_t v51 = 1;
      uint64_t v50 = (uint64_t)v79;
    }
    else
    {
LABEL_14:
      (*v35)(v97, v6);
      uint64_t v50 = (uint64_t)v79;
      sub_24EC14124(v92, (uint64_t)v79, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
      uint64_t v51 = 0;
    }
    uint64_t v52 = v89;
    (*v81)(v50, v51, 1, v89);
    sub_24EB742F4((uint64_t)v93, &qword_2699486D0);
    if ((*v80)(v50, 1, v52) == 1)
    {
      sub_24EB742F4(v50, &qword_269948708);
    }
    else
    {
      uint64_t v53 = v84;
      sub_24EC1418C(v50, v84, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
      sub_24EC1418C(v53, v88, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v91 = sub_24EBC3634(0, *(void *)(v91 + 16) + 1, 1, v91);
      }
      unint64_t v55 = *(void *)(v91 + 16);
      unint64_t v54 = *(void *)(v91 + 24);
      if (v55 >= v54 >> 1) {
        unint64_t v91 = sub_24EBC3634(v54 > 1, v55 + 1, 1, v91);
      }
      unint64_t v56 = v91;
      *(void *)(v91 + 16) = v55 + 1;
      sub_24EC1418C(v88, v56 + v73 + v55 * v85, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
    }
    ++v33;
  }
  while (v33 != v83);
LABEL_28:
  swift_bridgeObjectRelease();
  uint64_t v58 = v77;
  LODWORD(v97) = *(unsigned __int16 *)(v77 + 9);
  char v59 = *(unsigned char *)(v77 + 11);
  uint64_t v61 = *(void *)(v77 + 16);
  uint64_t v60 = *(void *)(v77 + 24);
  char v62 = *(unsigned char *)(v77 + 32);
  uint64_t v63 = v74;
  uint64_t v64 = v75;
  sub_24EB741CC(v77 + *(int *)(v74 + 40), v75, &qword_2699465B8);
  uint64_t v65 = v76;
  v66 = v70;
  uint64_t v67 = v71;
  (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v70, v58 + *(int *)(v63 + 44), v71);
  swift_bridgeObjectRetain();
  sub_24EC14068(v58, (uint64_t (*)(void))type metadata accessor for BrowseEditorialDescriptor);
  v68 = v72;
  *uint64_t v72 = v91;
  *((unsigned char *)v68 + 8) = 1;
  *(_WORD *)((char *)v68 + 9) = (_WORD)v97;
  *((unsigned char *)v68 + 11) = v59;
  v68[2] = v61;
  v68[3] = v60;
  *((unsigned char *)v68 + 32) = v62;
  sub_24EB7D0B0(v64, (uint64_t)v68 + *(int *)(v63 + 40), &qword_2699465B8);
  (*(void (**)(char *, char *, uint64_t))(v65 + 32))((char *)v68 + *(int *)(v63 + 44), v66, v67);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24EC0F430@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24EC0E9BC(a1, a2, *(void *)(v3 + 16), a3);
}

uint64_t sub_24EC0F438(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 72) = a4;
  *(void *)(v5 + 80) = a5;
  *(unsigned char *)(v5 + 164) = a2;
  *(void *)(v5 + 56) = a1;
  *(void *)(v5 + 64) = a3;
  *(void *)(v5 + 88) = type metadata accessor for BrowseAction();
  *(void *)(v5 + 96) = swift_task_alloc();
  sub_24EC22B80();
  *(void *)(v5 + 104) = sub_24EC22B70();
  uint64_t v7 = sub_24EC22B50();
  *(void *)(v5 + 112) = v7;
  *(void *)(v5 + 120) = v6;
  return MEMORY[0x270FA2498](sub_24EC0F508, v7, v6);
}

uint64_t sub_24EC0F508()
{
  if (qword_269945EA8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24EC222B0();
  *(void *)(v0 + 128) = __swift_project_value_buffer(v1, (uint64_t)qword_269961E88);
  uint64_t v2 = sub_24EC22290();
  os_log_type_t v3 = sub_24EC22C80();
  if (os_log_type_enabled(v2, v3))
  {
    int v4 = *(unsigned __int8 *)(v0 + 164);
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 67109120;
    *(_DWORD *)(v0 + 160) = v4;
    sub_24EC22CA0();
    _os_log_impl(&dword_24EB5D000, v2, v3, "[BrowseFeature] subscriptionChanged, isSubscribed: %{BOOL}d", v5, 8u);
    MEMORY[0x25334AFF0](v5, -1, -1);
  }

  uint64_t v6 = *(void **)(v0 + 96);
  uint64_t v8 = *(void *)(v0 + 72);
  uint64_t v7 = *(void *)(v0 + 80);
  uint64_t v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269948688) + 48);
  sub_24EC0FC54(v8, v7, v6);
  *(void *)((char *)v6 + v9) = sub_24EC07E24(v7);
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486C8);
  *uint64_t v10 = v0;
  v10[1] = sub_24EC0F708;
  uint64_t v12 = *(void *)(v0 + 96);
  return MEMORY[0x270F252C8](v12, v11);
}

uint64_t sub_24EC0F708()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 96);
  uint64_t v3 = *(void *)(*v0 + 64);
  uint64_t v7 = *v0;
  swift_task_dealloc();
  sub_24EC14068(v2, (uint64_t (*)(void))type metadata accessor for BrowseAction);
  uint64_t v6 = (uint64_t (*)(void))(*(void *)(v3 + 176) + **(int **)(v3 + 176));
  int v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 144) = v4;
  *int v4 = v7;
  v4[1] = sub_24EC0F8B8;
  return v6();
}

uint64_t sub_24EC0F8B8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 120);
  uint64_t v4 = *(void *)(v2 + 112);
  if (v0) {
    uint64_t v5 = sub_24EC0FA60;
  }
  else {
    uint64_t v5 = sub_24EC0F9F4;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24EC0F9F4()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EC0FA60()
{
  uint64_t v13 = v0;
  uint64_t v1 = v0[19];
  swift_release();
  MEMORY[0x25334ADE0](v1);
  MEMORY[0x25334ADE0](v1);
  uint64_t v2 = sub_24EC22290();
  os_log_type_t v3 = sub_24EC22C80();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = v0[19];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v12 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_getErrorValue();
    uint64_t v7 = sub_24EC22FA0();
    v0[6] = sub_24EC0FF2C(v7, v8, &v12);
    sub_24EC22CA0();
    swift_bridgeObjectRelease();
    MEMORY[0x25334ADD0](v4);
    MEMORY[0x25334ADD0](v4);
    _os_log_impl(&dword_24EB5D000, v2, v3, "[BrowseFeature] Failed to refresh canvas after subscription changed with error: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25334AFF0](v6, -1, -1);
    MEMORY[0x25334AFF0](v5, -1, -1);

    MEMORY[0x25334ADD0](v4);
  }
  else
  {
    uint64_t v9 = v0[19];
    MEMORY[0x25334ADD0](v9);
    MEMORY[0x25334ADD0](v9);
    MEMORY[0x25334ADD0](v9);
  }
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_24EC0FC54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for EditorialCollection();
  MEMORY[0x270FA5388](v6 - 8);
  unint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946778);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for EditorialCollectionDetail();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for BrowseContent();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EC14124(a1, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for BrowseContent);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_24EC14124(a1, (uint64_t)a3, (uint64_t (*)(void))type metadata accessor for BrowseContent);
      return sub_24EC14068((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for BrowseGalleryDescriptor);
    }
    swift_bridgeObjectRelease();
    *a3 = a2;
  }
  else
  {
    sub_24EC1418C((uint64_t)v17, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for EditorialCollectionDetail);
    sub_24EB741CC((uint64_t)v14, (uint64_t)v11, &qword_269946778);
    sub_24EC14124((uint64_t)&v14[*(int *)(v12 + 20)], (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for EditorialCollection);
    sub_24EC14068((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for EditorialCollectionDetail);
    sub_24EB7D0B0((uint64_t)v11, (uint64_t)a3, &qword_269946778);
    sub_24EC1418C((uint64_t)v8, (uint64_t)a3 + *(int *)(v12 + 20), (uint64_t (*)(void))type metadata accessor for EditorialCollection);
    *(void *)((char *)a3 + *(int *)(v12 + 24)) = a2;
  }
  swift_storeEnumTagMultiPayload();
  return swift_bridgeObjectRetain();
}

uint64_t sub_24EC0FF2C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24EC10000(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24EC140C8((uint64_t)v12, *a3);
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
      sub_24EC140C8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24EC10000(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24EC22CB0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24EC101BC(a5, a6);
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
  uint64_t v8 = sub_24EC22D60();
  if (!v8)
  {
    sub_24EC22DC0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24EC22DD0();
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

uint64_t sub_24EC101BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24EC10254(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24EC10434(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24EC10434(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24EC10254(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24EC103CC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24EC22D30();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24EC22DC0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24EC22AD0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24EC22DD0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24EC22DC0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24EC103CC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269948700);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24EC10434(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269948700);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_24EC22DD0();
  __break(1u);
  return result;
}

uint64_t sub_24EC10584(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24EC105C4(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_24EC105A4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24EC10740(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_24EC105C4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_269948718);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  size_t v14 = 24 * v8;
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
  uint64_t result = sub_24EC22DD0();
  __break(1u);
  return result;
}

uint64_t sub_24EC10740(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699472E8);
  uint64_t v10 = *(void *)(type metadata accessor for BrowseSectionDescriptor() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for BrowseSectionDescriptor() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_24EC22DD0();
  __break(1u);
  return result;
}

uint64_t sub_24EC10980(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  int v8 = a4 & 1;
  uint64_t v9 = *v4;
  sub_24EC22FF0();
  sub_24EC23000();
  swift_bridgeObjectRetain();
  sub_24EC22AB0();
  uint64_t v10 = sub_24EC23030();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  unint64_t v12 = v10 & ~v11;
  uint64_t v27 = v9;
  uint64_t v13 = v9 + 56;
  uint64_t v25 = a1;
  if (((*(void *)(v13 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
  {
LABEL_19:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v4;
    *unint64_t v4 = 0x8000000000000000;
    sub_24EBBC8CC();
    sub_24EC116F4(a2, a3, v8, v12, isUniquelyReferenced_nonNull_native);
    *unint64_t v4 = v28;
    swift_bridgeObjectRelease();
    *(void *)uint64_t v25 = a2;
    *(void *)(v25 + 8) = a3;
    uint64_t result = 1;
    *(unsigned char *)(v25 + 16) = v8 != 0;
    return result;
  }
  uint64_t v26 = ~v11;
  while (1)
  {
    uint64_t v14 = *(void *)(v27 + 48) + 24 * v12;
    uint64_t v16 = *(void *)v14;
    uint64_t v15 = *(void *)(v14 + 8);
    if (*(unsigned char *)(v14 + 16))
    {
      if (!v8) {
        goto LABEL_3;
      }
      if (v16 == a2 && v15 == a3) {
        break;
      }
      goto LABEL_17;
    }
    if (v8)
    {
LABEL_3:
      sub_24EBBC8CC();
      sub_24EBBC8CC();
      sub_24EBBC584();
      sub_24EBBC584();
      goto LABEL_4;
    }
    if (v16 == a2 && v15 == a3) {
      break;
    }
LABEL_17:
    char v19 = sub_24EC22F70();
    sub_24EBBC8CC();
    sub_24EBBC8CC();
    sub_24EBBC584();
    sub_24EBBC584();
    if (v19) {
      goto LABEL_21;
    }
LABEL_4:
    unint64_t v12 = (v12 + 1) & v26;
    if (((*(void *)(v13 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
      goto LABEL_19;
    }
  }
  sub_24EBBC8CC();
  sub_24EBBC8CC();
  sub_24EBBC584();
  sub_24EBBC584();
LABEL_21:
  swift_bridgeObjectRelease();
  sub_24EBBC584();
  uint64_t v22 = *(void *)(*v4 + 48) + 24 * v12;
  uint64_t v23 = *(void *)(v22 + 8);
  char v24 = *(unsigned char *)(v22 + 16);
  *(void *)uint64_t v25 = *(void *)v22;
  *(void *)(v25 + 8) = v23;
  *(unsigned char *)(v25 + 16) = v24;
  sub_24EBBC8CC();
  return 0;
}

uint64_t sub_24EC10CB8(uint64_t a1, char *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = sub_24EC21DF0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_24EC13F58(&qword_2699466F8, MEMORY[0x263F07A30]);
  swift_bridgeObjectRetain();
  uint64_t v33 = a2;
  uint64_t v11 = sub_24EC22A10();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    unint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      uint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_24EC13F58(&qword_2699486F0, MEMORY[0x263F07A30]);
      char v21 = sub_24EC22A30();
      uint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        unint64_t v3 = v28;
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
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    char v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_24EC119E0((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_24EC10FDC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269948710);
  uint64_t v3 = sub_24EC22D00();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v32 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v31 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
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
        if (v15 >= v31) {
          goto LABEL_33;
        }
        unint64_t v16 = v32[v15];
        ++v10;
        if (!v16)
        {
          int64_t v10 = v15 + 1;
          if (v15 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v16 = v32[v10];
          if (!v16)
          {
            int64_t v10 = v15 + 2;
            if (v15 + 2 >= v31) {
              goto LABEL_33;
            }
            unint64_t v16 = v32[v10];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v31)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v30 = 1 << *(unsigned char *)(v2 + 32);
                if (v30 > 63) {
                  bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v32 = -1 << v30;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v32[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v10 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v31) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v32[v10];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      uint64_t v18 = v2;
      uint64_t v19 = *(void *)(v2 + 48) + 24 * v14;
      uint64_t v20 = *(void *)v19;
      uint64_t v21 = *(void *)(v19 + 8);
      char v22 = *(unsigned char *)(v19 + 16);
      sub_24EC22FF0();
      sub_24EC23000();
      sub_24EC22AB0();
      uint64_t result = sub_24EC23030();
      uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v29 = *(void *)(v8 + 8 * v25);
        }
        while (v29 == -1);
        unint64_t v11 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      uint64_t v12 = *(void *)(v4 + 48) + 24 * v11;
      *(void *)uint64_t v12 = v20;
      *(void *)(v12 + 8) = v21;
      *(unsigned char *)(v12 + 16) = v22;
      ++*(void *)(v4 + 16);
      uint64_t v2 = v18;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24EC112F8()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_24EC21DF0();
  uint64_t v2 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699486F8);
  uint64_t v5 = sub_24EC22D00();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
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
                  *uint64_t v37 = -1 << v34;
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
      sub_24EC13F58(&qword_2699466F8, MEMORY[0x263F07A30]);
      uint64_t result = sub_24EC22A10();
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
  *uint64_t v1 = v6;
  return result;
}

uint64_t sub_24EC116F4(uint64_t result, uint64_t a2, char a3, unint64_t a4, char a5)
{
  uint64_t v8 = result;
  int v9 = a3 & 1;
  unint64_t v10 = *(void *)(*v5 + 16);
  unint64_t v11 = *(void *)(*v5 + 24);
  if (v11 <= v10 || (a5 & 1) == 0)
  {
    if (a5)
    {
      sub_24EC10FDC();
    }
    else
    {
      if (v11 > v10)
      {
        uint64_t result = (uint64_t)sub_24EC11C80();
        goto LABEL_26;
      }
      sub_24EC120E4();
    }
    uint64_t v12 = *v5;
    sub_24EC22FF0();
    sub_24EC23000();
    sub_24EC22AB0();
    uint64_t result = sub_24EC23030();
    uint64_t v13 = -1 << *(unsigned char *)(v12 + 32);
    a4 = result & ~v13;
    if ((*(void *)(v12 + 56 + ((a4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a4))
    {
      uint64_t v14 = ~v13;
      do
      {
        uint64_t v15 = *(void *)(v12 + 48) + 24 * a4;
        uint64_t v17 = *(void *)v15;
        uint64_t v16 = *(void *)(v15 + 8);
        if (*(unsigned char *)(v15 + 16))
        {
          if (!v9) {
            goto LABEL_10;
          }
          if (v17 == v8 && v16 == a2) {
            goto LABEL_29;
          }
        }
        else
        {
          if (v9)
          {
LABEL_10:
            sub_24EBBC8CC();
            sub_24EBBC8CC();
            sub_24EBBC584();
            uint64_t result = sub_24EBBC584();
            goto LABEL_11;
          }
          if (v17 == v8 && v16 == a2) {
            goto LABEL_29;
          }
        }
        char v20 = sub_24EC22F70();
        sub_24EBBC8CC();
        sub_24EBBC8CC();
        sub_24EBBC584();
        uint64_t result = sub_24EBBC584();
        if (v20) {
          goto LABEL_30;
        }
LABEL_11:
        a4 = (a4 + 1) & v14;
      }
      while (((*(void *)(v12 + 56 + ((a4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a4) & 1) != 0);
    }
  }
LABEL_26:
  uint64_t v21 = *v26;
  *(void *)(*v26 + 8 * (a4 >> 6) + 56) |= 1 << a4;
  uint64_t v22 = *(void *)(v21 + 48) + 24 * a4;
  *(void *)uint64_t v22 = v8;
  *(void *)(v22 + 8) = a2;
  *(unsigned char *)(v22 + 16) = v9 != 0;
  uint64_t v23 = *(void *)(v21 + 16);
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
    __break(1u);
LABEL_29:
    sub_24EBBC8CC();
    sub_24EBBC8CC();
    sub_24EBBC584();
    sub_24EBBC584();
LABEL_30:
    uint64_t result = sub_24EC22F90();
    __break(1u);
  }
  else
  {
    *(void *)(v21 + 16) = v25;
  }
  return result;
}

uint64_t sub_24EC119E0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v32 = a1;
  uint64_t v6 = sub_24EC21DF0();
  uint64_t v7 = *(void *)(v6 - 8);
  v8.n128_f64[0] = MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = *(void *)(*v3 + 16);
  unint64_t v12 = *(void *)(*v3 + 24);
  unint64_t v29 = v3;
  uint64_t v30 = v7;
  if (v12 > v11 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_24EC112F8();
  }
  else
  {
    if (v12 > v11)
    {
      sub_24EC11E40();
      goto LABEL_12;
    }
    sub_24EC123C8();
  }
  uint64_t v13 = *v3;
  sub_24EC13F58(&qword_2699466F8, MEMORY[0x263F07A30]);
  uint64_t v14 = sub_24EC22A10();
  uint64_t v15 = -1 << *(unsigned char *)(v13 + 32);
  a2 = v14 & ~v15;
  uint64_t v31 = v13;
  uint64_t v16 = v13 + 56;
  if ((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v17 = ~v15;
    char v20 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v19 = v7 + 16;
    unint64_t v18 = v20;
    uint64_t v21 = *(void *)(v19 + 56);
    do
    {
      v18(v10, *(void *)(v31 + 48) + v21 * a2, v6);
      sub_24EC13F58(&qword_2699486F0, MEMORY[0x263F07A30]);
      char v22 = sub_24EC22A30();
      (*(void (**)(char *, uint64_t))(v19 - 8))(v10, v6);
      if (v22) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v17;
    }
    while (((*(void *)(v16 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v23 = v30;
  uint64_t v24 = *v29;
  *(void *)(v24 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, __n128))(v23 + 32))(*(void *)(v24 + 48) + *(void *)(v23 + 72) * a2, v32, v6, v8);
  uint64_t v26 = *(void *)(v24 + 16);
  BOOL v27 = __OFADD__(v26, 1);
  uint64_t v28 = v26 + 1;
  if (!v27)
  {
    *(void *)(v24 + 16) = v28;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_24EC22F90();
  __break(1u);
  return result;
}

void *sub_24EC11C80()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269948710);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24EC22CF0();
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v13) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22)
      {
        int64_t v9 = v21 + 2;
        if (v21 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v22 = *(void *)(v6 + 8 * v9);
        if (!v22) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v18 = *(void *)(v17 + 8);
    char v19 = *(unsigned char *)(v17 + 16);
    uint64_t v20 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v20 = *(void *)v17;
    *(void *)(v20 + 8) = v18;
    *(unsigned char *)(v20 + 16) = v19;
    uint64_t result = (void *)sub_24EBBC8CC();
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v13) {
    goto LABEL_28;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_24EC11E40()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24EC21DF0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699486F8);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_24EC22CF0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  unint64_t v22 = v1;
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

uint64_t sub_24EC120E4()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269948710);
  uint64_t v2 = sub_24EC22D00();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v0 = v3;
    return result;
  }
  uint64_t v4 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v28 = v1 + 56;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 56);
  int64_t v29 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = v2 + 56;
  uint64_t result = swift_retain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v13 = v12 | (v9 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v14);
    ++v9;
    if (!v15)
    {
      int64_t v9 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v28 + 8 * v9);
      if (!v15)
      {
        int64_t v9 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v28 + 8 * v9);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v9 << 6);
LABEL_24:
    uint64_t v17 = *(void *)(v1 + 48) + 24 * v13;
    uint64_t v18 = *(void *)v17;
    uint64_t v19 = *(void *)(v17 + 8);
    char v20 = *(unsigned char *)(v17 + 16);
    sub_24EC22FF0();
    sub_24EC23000();
    swift_bridgeObjectRetain();
    sub_24EC22AB0();
    uint64_t result = sub_24EC23030();
    uint64_t v21 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v7 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v10 = __clz(__rbit64((-1 << v22) & ~*(void *)(v7 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v7 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v7 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    uint64_t v11 = *(void *)(v3 + 48) + 24 * v10;
    *(void *)uint64_t v11 = v18;
    *(void *)(v11 + 8) = v19;
    *(unsigned char *)(v11 + 16) = v20;
    ++*(void *)(v3 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v28 + 8 * v16);
  if (v15)
  {
    int64_t v9 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v9 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v9);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24EC123C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24EC21DF0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699486F8);
  uint64_t v7 = sub_24EC22D00();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
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
  int64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
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
    sub_24EC13F58(&qword_2699466F8, MEMORY[0x263F07A30]);
    uint64_t result = sub_24EC22A10();
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

uint64_t sub_24EC12778(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2)
  {
    case 0:
      if (a4) {
        goto LABEL_28;
      }
      uint64_t result = 1;
      break;
    case 1:
      if (a4 != 1) {
        goto LABEL_28;
      }
      uint64_t result = 1;
      break;
    case 2:
      if (a4 != 2) {
        goto LABEL_28;
      }
      uint64_t result = 1;
      break;
    case 3:
      if (a4 != 3) {
        goto LABEL_28;
      }
      uint64_t result = 1;
      break;
    case 4:
      if (a4 != 4) {
        goto LABEL_28;
      }
      uint64_t result = 1;
      break;
    case 5:
      if (a4 != 5) {
        goto LABEL_28;
      }
      uint64_t result = 1;
      break;
    case 6:
      if (a4 != 6) {
        goto LABEL_28;
      }
      uint64_t result = 1;
      break;
    case 7:
      if (a4 != 7) {
        goto LABEL_28;
      }
      uint64_t result = 1;
      break;
    case 8:
      if (a4 != 8) {
        goto LABEL_28;
      }
      uint64_t result = 1;
      break;
    case 9:
      if (a4 != 9) {
        goto LABEL_28;
      }
      uint64_t result = 1;
      break;
    case 10:
      if (a4 != 10) {
        goto LABEL_28;
      }
      uint64_t result = 1;
      break;
    default:
      if (a4 < 0xB)
      {
LABEL_28:
        uint64_t result = 0;
      }
      else if (a1 == a3 && a2 == a4)
      {
        uint64_t result = 1;
      }
      else
      {
        uint64_t result = sub_24EC22F70();
      }
      break;
  }
  return result;
}

uint64_t sub_24EC128AC(uint64_t a1, void (*a2)(void, char *), uint64_t a3)
{
  uint64_t v35 = a2;
  uint64_t v36 = a3;
  uint64_t v4 = type metadata accessor for BrowseSectionDescriptor();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699486E0);
  MEMORY[0x270FA5388](v8);
  uint64_t v34 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  unint64_t v12 = (void *)((char *)v29 - v11);
  MEMORY[0x270FA5388](v13);
  unint64_t v15 = (char *)v29 - v14;
  uint64_t v37 = MEMORY[0x263F8EE78];
  sub_24EC105A4(0, 0, 0);
  uint64_t v16 = a1;
  uint64_t v17 = v37;
  uint64_t v18 = *(void *)(v16 + 16);
  uint64_t v19 = swift_bridgeObjectRetain();
  uint64_t v33 = v18;
  v29[1] = v19;
  if (v18)
  {
    uint64_t v20 = 0;
    unint64_t v21 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v30 = *(void *)(v5 + 72);
    unint64_t v31 = v21;
    uint64_t v22 = v19 + v21;
    uint64_t v32 = v7;
    do
    {
      uint64_t v23 = (uint64_t)&v34[*(int *)(v8 + 48)];
      sub_24EC14124(v22, v23, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
      uint64_t v24 = (uint64_t)v12 + *(int *)(v8 + 48);
      *unint64_t v12 = v20;
      sub_24EC1418C(v23, v24, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
      sub_24EB7D0B0((uint64_t)v12, (uint64_t)v15, &qword_2699486E0);
      v35(*(void *)v15, &v15[*(int *)(v8 + 48)]);
      sub_24EB742F4((uint64_t)v15, &qword_2699486E0);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24EC105A4(0, *(void *)(v17 + 16) + 1, 1);
        uint64_t v17 = v37;
      }
      unint64_t v26 = *(void *)(v17 + 16);
      unint64_t v25 = *(void *)(v17 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_24EC105A4(v25 > 1, v26 + 1, 1);
        uint64_t v17 = v37;
      }
      ++v20;
      *(void *)(v17 + 16) = v26 + 1;
      uint64_t v27 = v30;
      sub_24EC1418C((uint64_t)v32, v17 + v31 + v26 * v30, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
      v22 += v27;
    }
    while (v33 != v20);
  }
  swift_bridgeObjectRelease();
  return v17;
}

unint64_t sub_24EC12BA0()
{
  unint64_t result = qword_2699485C0;
  if (!qword_2699485C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2699485C0);
  }
  return result;
}

uint64_t sub_24EC12BF4()
{
  uint64_t v1 = *(void *)(type metadata accessor for BrowseContent() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 232) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = v0 + v2;
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  if (EnumCaseMultiPayload != 1)
  {
    if (EnumCaseMultiPayload) {
      goto LABEL_12;
    }
    uint64_t v5 = type metadata accessor for BrowseArtwork();
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v0 + v2, 1, v5))
    {
      uint64_t v6 = sub_24EC21E00();
      uint64_t v7 = *(void *)(v6 - 8);
      if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v7 + 48))(v0 + v2, 1, v6)) {
        (*(void (**)(unint64_t, uint64_t))(v7 + 8))(v0 + v2, v6);
      }
      uint64_t v8 = v3 + *(int *)(v5 + 20);
      uint64_t v9 = sub_24EC21D30();
      uint64_t v10 = *(void *)(v9 - 8);
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
        (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
      }
    }
    uint64_t v11 = v3 + *(int *)(type metadata accessor for EditorialCollectionDetail() + 20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v12 = v11 + *(int *)(type metadata accessor for EditorialCollection() + 32);
    uint64_t v13 = sub_24EC21D30();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
    goto LABEL_10;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = v3 + *(int *)(type metadata accessor for BrowseGalleryDescriptor() + 32);
  uint64_t v15 = sub_24EC21D10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
LABEL_12:
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24EC12F90(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for BrowseContent() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 232) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  char v6 = *(unsigned char *)(v1 + 16);
  uint64_t v7 = v1 + 24;
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24EBC3C54;
  return sub_24EC0F438(a1, v6, v7, v8, v9);
}

uint64_t sub_24EC130B4(uint64_t a1)
{
  return a1;
}

uint64_t sub_24EC131A0()
{
  return objectdestroy_3Tm_2();
}

uint64_t sub_24EC131A8(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EBC3C54;
  return sub_24EC09EC8(a1, v1 + 16);
}

uint64_t sub_24EC13244()
{
  return objectdestroy_3Tm_2();
}

uint64_t sub_24EC1324C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EBC3C54;
  return sub_24EC0A7E8(a1, v1 + 16);
}

uint64_t sub_24EC132E8()
{
  return objectdestroy_3Tm_2();
}

uint64_t sub_24EC132F0(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EBC3C54;
  return sub_24EC0B118(a1, v1 + 16);
}

uint64_t sub_24EC1338C()
{
  return objectdestroy_3Tm_2();
}

uint64_t sub_24EC13394(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EBC3C54;
  return sub_24EC0BA38(a1, v1 + 16);
}

uint64_t sub_24EC13430()
{
  return objectdestroy_3Tm_2();
}

uint64_t sub_24EC13438(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EBC3C54;
  return sub_24EC0C358(a1, v1 + 16);
}

uint64_t sub_24EC134D4()
{
  return objectdestroy_3Tm_2();
}

uint64_t sub_24EC134DC(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EBC3C54;
  return sub_24EC0CC78(a1, v1 + 16);
}

uint64_t sub_24EC13578()
{
  return objectdestroy_3Tm_2();
}

uint64_t sub_24EC13580(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EBC3C54;
  return sub_24EC0D3C8(a1, v1 + 16);
}

uint64_t sub_24EC1361C()
{
  return objectdestroy_3Tm_2();
}

uint64_t sub_24EC13624(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EBC3C54;
  return sub_24EC0DCE8(a1, v1 + 16);
}

uint64_t sub_24EC136C0()
{
  uint64_t v1 = sub_24EC21D10();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 248) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_24EC137F4(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_24EC21D10() - 8);
  uint64_t v5 = v1 + 16;
  uint64_t v6 = *(void *)(v1 + 232);
  uint64_t v7 = *(void *)(v1 + 240);
  uint64_t v8 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 248) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = *(unsigned __int8 *)(v1 + 224);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24EBC3C54;
  return sub_24EC09554(a1, v5, v9, v6, v7, v8);
}

uint64_t sub_24EC138F4()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24EC13994(uint64_t a1)
{
  uint64_t v4 = v1 + 16;
  uint64_t v6 = *(void *)(v1 + 224);
  uint64_t v5 = *(void *)(v1 + 232);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24EBBC9C4;
  return sub_24EC08CE8(a1, v4, v6, v5);
}

uint64_t sub_24EC13A44(uint64_t a1, uint64_t a2)
{
  uint64_t State = type metadata accessor for BrowseLoadState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(State - 8) + 40))(a2, a1, State);
  return a2;
}

uint64_t sub_24EC13AA8()
{
  return objectdestroy_3Tm_2();
}

uint64_t sub_24EC13AB0(uint64_t a1)
{
  uint64_t v4 = v1 + 16;
  char v5 = *(unsigned char *)(v1 + 224);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_24EBC3C54;
  return sub_24EC07504(a1, v4, v5);
}

uint64_t sub_24EC13B5C()
{
  return sub_24EC13F58(&qword_2699486A0, (void (*)(uint64_t))type metadata accessor for BrowseAction);
}

uint64_t sub_24EC13BA4()
{
  return sub_24EC13F58(&qword_2699486A8, (void (*)(uint64_t))type metadata accessor for BrowseAction);
}

uint64_t sub_24EC13BEC()
{
  return sub_24EC13F58(&qword_2699486B0, (void (*)(uint64_t))type metadata accessor for BrowseLocalState);
}

uint64_t sub_24EC13C34()
{
  return sub_24EC13F58(&qword_2699486B8, (void (*)(uint64_t))type metadata accessor for BrowseState);
}

ValueMetadata *type metadata accessor for BrowseFeature()
{
  return &type metadata for BrowseFeature;
}

unint64_t destroy for BrowseFeature.TaskIdentifier(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s15FitnessBrowsing13BrowseFeatureV14TaskIdentifierOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *assignWithCopy for BrowseFeature.TaskIdentifier(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
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

uint64_t assignWithTake for BrowseFeature.TaskIdentifier(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BrowseFeature.TaskIdentifier(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFF4 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483637);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 10;
  if (v4 >= 0xC) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for BrowseFeature.TaskIdentifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF5)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483637;
    if (a3 >= 0x7FFFFFF5) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFF5) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 10;
    }
  }
  return result;
}

uint64_t sub_24EC13EB0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_24EC13EC8(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for BrowseFeature.TaskIdentifier()
{
  return &type metadata for BrowseFeature.TaskIdentifier;
}

unint64_t sub_24EC13EFC()
{
  unint64_t result = qword_2699486C0;
  if (!qword_2699486C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699486C0);
  }
  return result;
}

uint64_t sub_24EC13F50()
{
  return objectdestroy_3Tm_2();
}

uint64_t sub_24EC13F58(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24EC13FA0()
{
  return objectdestroy_3Tm_2();
}

uint64_t objectdestroy_3Tm_2()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

BOOL sub_24EC1404C(uint64_t a1)
{
  return sub_24EC093F0(a1);
}

uint64_t sub_24EC14068(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24EC140C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24EC14124(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24EC1418C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t Array<A>.includingMarketingUpsellSectionDescriptors(isSubscribed:)(char a1, unint64_t a2)
{
  uint64_t v4 = sub_24EC21DA0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v56 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for BrowseEditorialDescriptor();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = type metadata accessor for BrowseSectionDescriptor();
  MEMORY[0x270FA5388](v57);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v48 - v11;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v48 - v16;
  if (a1)
  {
    swift_bridgeObjectRetain();
    return a2;
  }
  uint64_t v53 = v7;
  uint64_t v54 = v15;
  uint64_t v55 = v14;
  uint64_t v18 = *(void *)(a2 + 16);
  if (!v18)
  {
LABEL_15:
    unint64_t v26 = v56;
    sub_24EC21D90();
    uint64_t v27 = sub_24EC21D80();
    uint64_t v29 = v28;
    uint64_t v30 = *(void (**)(char *, uint64_t))(v5 + 8);
    v30(v26, v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699472E0);
    uint64_t v31 = *(void *)(type metadata accessor for BrowseLazyItem() - 8);
    unint64_t v32 = (*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
    uint64_t v33 = swift_allocObject();
    long long v52 = xmmword_24EC28530;
    *(_OWORD *)(v33 + 16) = xmmword_24EC28530;
    unint64_t v34 = v33 + v32;
    *(unsigned char *)unint64_t v34 = 25;
    *(_OWORD *)(v34 + 24) = 0u;
    *(_OWORD *)(v34 + 8) = 0u;
    *(void *)(v34 + 40) = v27;
    *(void *)(v34 + 48) = v29;
    *(void *)(v34 + 56) = v27;
    *(void *)(v34 + 64) = v29;
    *(unsigned char *)(v34 + 72) = 7;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    sub_24EC21D90();
    uint64_t v35 = sub_24EC21D80();
    uint64_t v37 = v36;
    v30(v26, v4);
    uint64_t v38 = v55;
    uint64_t v39 = v55 + *(int *)(v53 + 40);
    sub_24EC21CE0();
    uint64_t v40 = sub_24EC21D10();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v39, 0, 1, v40);
    sub_24EC21CE0();
    *(void *)uint64_t v38 = v33;
    *(unsigned char *)(v38 + 8) = 1;
    *(_WORD *)(v38 + 9) = 537;
    *(unsigned char *)(v38 + 11) = 25;
    *(void *)(v38 + 16) = v35;
    *(void *)(v38 + 24) = v37;
    *(unsigned char *)(v38 + 32) = 1;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699472E8);
    unint64_t v41 = (*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = v52;
    sub_24EC15214(v38, v42 + v41, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
    unint64_t v58 = v42;
    uint64_t v43 = swift_bridgeObjectRetain();
    sub_24EC15058(v43, (uint64_t (*)(void))sub_24EBC3380, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
    a2 = v58;
    sub_24EC1527C(v38, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
    return a2;
  }
  uint64_t v49 = v5;
  uint64_t v50 = v4;
  uint64_t v19 = a2 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  uint64_t v20 = *(void *)(v15 + 72);
  *(void *)&long long v52 = a2;
  swift_bridgeObjectRetain();
  uint64_t v21 = v19;
  uint64_t v51 = v18;
  uint64_t v22 = v18;
  while (1)
  {
    sub_24EC15214(v21, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
    sub_24EC15214((uint64_t)v17, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
    if (swift_getEnumCaseMultiPayload() != 2)
    {
      sub_24EC1527C((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
      sub_24EC1527C((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
      goto LABEL_6;
    }
    sub_24EC14FF0((uint64_t)v12, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BrowseEditorialDescriptor);
    if (BrowseDisplayStyle.rawValue.getter(v9[9]) == 0x6564616548626174 && v23 == 0xE900000000000072) {
      break;
    }
    char v25 = sub_24EC22F70();
    swift_bridgeObjectRelease();
    sub_24EC1527C((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BrowseEditorialDescriptor);
    sub_24EC1527C((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
    if (v25) {
      goto LABEL_17;
    }
LABEL_6:
    v21 += v20;
    if (!--v22)
    {
      swift_bridgeObjectRelease();
      uint64_t v5 = v49;
      uint64_t v4 = v50;
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease();
  sub_24EC1527C((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BrowseEditorialDescriptor);
  sub_24EC1527C((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
LABEL_17:
  swift_bridgeObjectRelease();
  unint64_t v58 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  uint64_t v44 = 0;
  uint64_t v45 = v51;
  while (1)
  {
    uint64_t v46 = v44 + 1;
    if (__OFADD__(v44, 1)) {
      break;
    }
    sub_24EC148B4(&v58, v19);
    ++v44;
    v19 += v20;
    if (v46 == v45)
    {
      swift_bridgeObjectRelease();
      return v58;
    }
  }
  __break(1u);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_24EC148B4(unint64_t *a1, uint64_t a2)
{
  uint64_t v60 = a1;
  uint64_t v3 = type metadata accessor for BrowseLazyItem();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v55 = v3;
  uint64_t v56 = v4;
  MEMORY[0x270FA5388](v3);
  unint64_t v58 = &v51[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_24EC21DA0();
  uint64_t v54 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = &v51[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for BrowseSectionDescriptor();
  uint64_t v59 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = &v51[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v12);
  uint64_t v57 = &v51[-v13];
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = &v51[-v15];
  uint64_t v17 = type metadata accessor for BrowseEditorialDescriptor();
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = &v51[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = &v51[-v21];
  sub_24EC15214(a2, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
  if (swift_getEnumCaseMultiPayload() != 2)
  {
    char v25 = type metadata accessor for BrowseSectionDescriptor;
    uint64_t v26 = (uint64_t)v16;
LABEL_11:
    sub_24EC1527C(v26, (uint64_t (*)(void))v25);
    goto LABEL_12;
  }
  sub_24EC14FF0((uint64_t)v16, (uint64_t)v22, (uint64_t (*)(void))type metadata accessor for BrowseEditorialDescriptor);
  if ((v22[8] & 1) == 0)
  {
    char v25 = type metadata accessor for BrowseEditorialDescriptor;
    uint64_t v26 = (uint64_t)v22;
    goto LABEL_11;
  }
  uint64_t v53 = *(void *)v22;
  if (BrowseDisplayStyle.rawValue.getter(v22[9]) == 0x6564616548626174 && v23 == 0xE900000000000072)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    int v52 = sub_24EC22F70();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if ((v52 & 1) == 0)
    {
      sub_24EC1527C((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for BrowseEditorialDescriptor);
      swift_bridgeObjectRelease();
LABEL_12:
      sub_24EC15214(a2, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
      uint64_t v27 = v60;
      unint64_t v28 = *v60;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v30 = v59;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        unint64_t v28 = sub_24EBC3380(0, *(void *)(v28 + 16) + 1, 1, v28);
      }
      unint64_t v32 = *(void *)(v28 + 16);
      unint64_t v31 = *(void *)(v28 + 24);
      if (v32 >= v31 >> 1) {
        unint64_t v28 = sub_24EBC3380(v31 > 1, v32 + 1, 1, v28);
      }
      *(void *)(v28 + 16) = v32 + 1;
      uint64_t result = sub_24EC14FF0((uint64_t)v11, v28+ ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80))+ *(void *)(v30 + 72) * v32, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
      *uint64_t v27 = v28;
      return result;
    }
  }
  sub_24EC21D90();
  uint64_t v34 = sub_24EC21D80();
  uint64_t v36 = v35;
  (*(void (**)(unsigned char *, uint64_t))(v54 + 8))(v8, v6);
  uint64_t v37 = v58;
  *unint64_t v58 = 25;
  *(_OWORD *)(v37 + 8) = 0u;
  *(_OWORD *)(v37 + 24) = 0u;
  *((void *)v37 + 5) = v34;
  *((void *)v37 + 6) = v36;
  *((void *)v37 + 7) = v34;
  *((void *)v37 + 8) = v36;
  v37[72] = 7;
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699472E0);
  unint64_t v38 = (*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  uint64_t v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_24EC28530;
  sub_24EC15214((uint64_t)v37, v39 + v38, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
  uint64_t v61 = v39;
  swift_bridgeObjectRetain();
  sub_24EC15058(v53, (uint64_t (*)(void))sub_24EBC3634, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
  uint64_t v40 = v61;
  LOWORD(v37) = *(_WORD *)(v22 + 9);
  LODWORD(v56) = v22[11];
  uint64_t v41 = *((void *)v22 + 3);
  uint64_t v55 = *((void *)v22 + 2);
  sub_24EBD0AF4((uint64_t)&v22[*(int *)(v17 + 40)], (uint64_t)&v19[*(int *)(v17 + 40)]);
  uint64_t v42 = *(int *)(v17 + 44);
  uint64_t v43 = &v22[v42];
  uint64_t v44 = &v19[v42];
  uint64_t v45 = sub_24EC21D10();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v45 - 8) + 16))(v44, v43, v45);
  *(void *)uint64_t v19 = v40;
  v19[8] = 1;
  *(_WORD *)(v19 + 9) = (_WORD)v37;
  v19[11] = v56;
  *((void *)v19 + 2) = v55;
  *((void *)v19 + 3) = v41;
  v19[32] = 1;
  sub_24EC15214((uint64_t)v19, (uint64_t)v57, (uint64_t (*)(void))type metadata accessor for BrowseEditorialDescriptor);
  swift_storeEnumTagMultiPayload();
  uint64_t v46 = v60;
  unint64_t v47 = *v60;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v47 = sub_24EBC3380(0, *(void *)(v47 + 16) + 1, 1, v47);
  }
  uint64_t v48 = v59;
  unint64_t v50 = *(void *)(v47 + 16);
  unint64_t v49 = *(void *)(v47 + 24);
  if (v50 >= v49 >> 1) {
    unint64_t v47 = sub_24EBC3380(v49 > 1, v50 + 1, 1, v47);
  }
  *(void *)(v47 + 16) = v50 + 1;
  sub_24EC14FF0((uint64_t)v57, v47+ ((*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80))+ *(void *)(v48 + 72) * v50, (uint64_t (*)(void))type metadata accessor for BrowseSectionDescriptor);
  *uint64_t v46 = v47;
  sub_24EC1527C((uint64_t)v19, (uint64_t (*)(void))type metadata accessor for BrowseEditorialDescriptor);
  sub_24EC1527C((uint64_t)v58, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
  return sub_24EC1527C((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for BrowseEditorialDescriptor);
}

uint64_t sub_24EC14FF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24EC15058(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(void))
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *v3;
  uint64_t v6 = *(void *)(*v3 + 16);
  if (__OFADD__(v6, v4))
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (swift_isUniquelyReferenced_nonNull_native() && v6 + v4 <= *(void *)(v5 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
  uint64_t v5 = a2();
  if (!*(void *)(a1 + 16))
  {
LABEL_15:
    if (!v4) {
      goto LABEL_16;
    }
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v10 = *(void *)(v5 + 16);
  uint64_t v11 = (*(void *)(v5 + 24) >> 1) - v10;
  uint64_t v12 = *(void *)(a3(0) - 8);
  uint64_t v13 = *(void *)(v12 + 72);
  if (v11 < v4)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  unint64_t v15 = v5 + v14 + v13 * v10;
  unint64_t v16 = a1 + v14;
  uint64_t v17 = v13 * v4;
  unint64_t v18 = v15 + v17;
  unint64_t v19 = v16 + v17;
  if (v16 < v18 && v15 < v19) {
    goto LABEL_21;
  }
  swift_arrayInitWithCopy();
  if (!v4)
  {
LABEL_16:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t *v3 = v5;
    return result;
  }
  uint64_t v21 = *(void *)(v5 + 16);
  BOOL v22 = __OFADD__(v21, v4);
  uint64_t v23 = v21 + v4;
  if (!v22)
  {
    *(void *)(v5 + 16) = v23;
    goto LABEL_16;
  }
LABEL_20:
  __break(1u);
LABEL_21:
  uint64_t result = sub_24EC22DD0();
  __break(1u);
  return result;
}

uint64_t sub_24EC15214(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24EC1527C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t NewAndFeaturedEnvironment.init(fetchPlaceholders:makeArchivedSessionsUpdatedStream:makeCatalogUpdatedStream:navigateToWorkoutDetail:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

uint64_t sub_24EC152F0()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24EC1533C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_24EC153C0(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
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

_OWORD *sub_24EC15464(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  return a1;
}

uint64_t sub_24EC154CC(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24EC15514(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for NewAndFeaturedEnvironment()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24EC1557C(uint64_t a1)
{
  unint64_t v2 = sub_24EC15BE4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EC155B8(uint64_t a1)
{
  unint64_t v2 = sub_24EC15BE4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EC155F4(uint64_t a1)
{
  unint64_t v2 = sub_24EC15CE0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EC15630(uint64_t a1)
{
  unint64_t v2 = sub_24EC15CE0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EC1566C(uint64_t a1)
{
  unint64_t v2 = sub_24EC15C38();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EC156A8(uint64_t a1)
{
  unint64_t v2 = sub_24EC15C38();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t BrowseLazyItem.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699487A0);
  uint64_t v34 = *(void *)(v2 - 8);
  uint64_t v35 = v2;
  MEMORY[0x270FA5388](v2);
  long long v4 = &v28[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699487A8);
  uint64_t v32 = *(void *)(v5 - 8);
  uint64_t v33 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = &v28[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v31 = type metadata accessor for BrowseItem();
  MEMORY[0x270FA5388](v31);
  uint64_t v9 = &v28[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = type metadata accessor for BrowseLazyItem();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = &v28[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699487B0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v36 = v13;
  uint64_t v37 = v14;
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = &v28[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EC15BE4();
  sub_24EC23050();
  sub_24EBE7BCC(v48, (uint64_t)v12);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    LODWORD(v33) = *v12;
    uint64_t v17 = *((void *)v12 + 1);
    uint64_t v48 = *((void *)v12 + 2);
    uint64_t v18 = v48;
    uint64_t v19 = *((void *)v12 + 4);
    uint64_t v31 = *((void *)v12 + 3);
    uint64_t v32 = v17;
    uint64_t v20 = *((void *)v12 + 6);
    uint64_t v30 = *((void *)v12 + 5);
    uint64_t v22 = *((void *)v12 + 7);
    uint64_t v21 = *((void *)v12 + 8);
    int v29 = v12[72];
    char v38 = 1;
    sub_24EC15C38();
    uint64_t v23 = v36;
    sub_24EC22EC0();
    char v38 = v33;
    uint64_t v39 = v32;
    uint64_t v40 = v18;
    uint64_t v41 = v31;
    uint64_t v42 = v19;
    uint64_t v43 = v30;
    uint64_t v44 = v20;
    uint64_t v45 = v22;
    uint64_t v46 = v21;
    char v47 = v29;
    sub_24EC15C8C();
    uint64_t v24 = v35;
    sub_24EC22F40();
    (*(void (**)(unsigned char *, uint64_t))(v34 + 8))(v4, v24);
    (*(void (**)(unsigned char *, uint64_t))(v37 + 8))(v16, v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_24EC163F4((uint64_t)v12, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BrowseItem);
    char v38 = 0;
    sub_24EC15CE0();
    uint64_t v26 = v36;
    sub_24EC22EC0();
    sub_24EC16AAC(&qword_2699487D8, (void (*)(uint64_t))type metadata accessor for BrowseItem);
    uint64_t v27 = v33;
    sub_24EC22F40();
    (*(void (**)(unsigned char *, uint64_t))(v32 + 8))(v7, v27);
    sub_24EC18508((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BrowseItem);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v37 + 8))(v16, v26);
  }
}

uint64_t type metadata accessor for BrowseLazyItem()
{
  uint64_t result = qword_269948810;
  if (!qword_269948810) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24EC15BE4()
{
  unint64_t result = qword_2699487B8;
  if (!qword_2699487B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699487B8);
  }
  return result;
}

unint64_t sub_24EC15C38()
{
  unint64_t result = qword_2699487C0;
  if (!qword_2699487C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699487C0);
  }
  return result;
}

unint64_t sub_24EC15C8C()
{
  unint64_t result = qword_2699487C8;
  if (!qword_2699487C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699487C8);
  }
  return result;
}

unint64_t sub_24EC15CE0()
{
  unint64_t result = qword_2699487D0;
  if (!qword_2699487D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699487D0);
  }
  return result;
}

uint64_t BrowseLazyItem.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699487E0);
  uint64_t v45 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  unint64_t v50 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699487E8);
  uint64_t v46 = *(void *)(v4 - 8);
  uint64_t v47 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v49 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699487F0);
  uint64_t v48 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for BrowseLazyItem();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v40 - v13;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v40 - v16;
  uint64_t v18 = a1[3];
  int v52 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_24EC15BE4();
  uint64_t v19 = v60;
  sub_24EC23040();
  if (v19) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
  }
  uint64_t v43 = v14;
  uint64_t v41 = v11;
  uint64_t v20 = v49;
  uint64_t v21 = v50;
  uint64_t v22 = v51;
  uint64_t v42 = v17;
  uint64_t v60 = v9;
  uint64_t v23 = sub_24EC22EA0();
  uint64_t v24 = v8;
  if (*(void *)(v23 + 16) != 1)
  {
    uint64_t v25 = sub_24EC22D50();
    swift_allocError();
    uint64_t v27 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269946108);
    *uint64_t v27 = v60;
    sub_24EC22E10();
    sub_24EC22D40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, *MEMORY[0x263F8DCB0], v25);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v8, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v52);
  }
  if (*(unsigned char *)(v23 + 32))
  {
    char v53 = 1;
    sub_24EC15C38();
    sub_24EC22E00();
    sub_24EC163A0();
    sub_24EC22E90();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v21, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v8, v6);
    uint64_t v30 = (uint64_t)v52;
    uint64_t v31 = v57;
    uint64_t v32 = v58;
    char v33 = v59;
    uint64_t v34 = v41;
    *uint64_t v41 = v53;
    *(_OWORD *)(v34 + 8) = v54;
    long long v35 = v56;
    *(_OWORD *)(v34 + 24) = v55;
    *(_OWORD *)(v34 + 40) = v35;
    *((void *)v34 + 7) = v31;
    *((void *)v34 + 8) = v32;
    v34[72] = v33;
    swift_storeEnumTagMultiPayload();
    uint64_t v36 = (uint64_t)v34;
  }
  else
  {
    char v53 = 0;
    sub_24EC15CE0();
    unint64_t v28 = v20;
    sub_24EC22E00();
    type metadata accessor for BrowseItem();
    sub_24EC16AAC(&qword_269948800, (void (*)(uint64_t))type metadata accessor for BrowseItem);
    uint64_t v37 = (uint64_t)v43;
    uint64_t v38 = v47;
    sub_24EC22E90();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v28, v38);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v24, v6);
    uint64_t v30 = (uint64_t)v52;
    swift_storeEnumTagMultiPayload();
    uint64_t v36 = v37;
  }
  uint64_t v39 = (uint64_t)v42;
  sub_24EC163F4(v36, (uint64_t)v42, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
  sub_24EC163F4(v39, v44, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
  return __swift_destroy_boxed_opaque_existential_1(v30);
}

unint64_t sub_24EC163A0()
{
  unint64_t result = qword_2699487F8;
  if (!qword_2699487F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699487F8);
  }
  return result;
}

uint64_t sub_24EC163F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24EC1645C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return BrowseLazyItem.init(from:)(a1, a2);
}

uint64_t sub_24EC16474(void *a1)
{
  return BrowseLazyItem.encode(to:)(a1);
}

uint64_t BrowseLazyItem.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for BrowseItem();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for BrowseLazyItem();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (unsigned __int8 *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EBE7BCC(v2, (uint64_t)v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    int v20 = *v9;
    uint64_t v10 = *((void *)v9 + 2);
    uint64_t v19 = *((void *)v9 + 1);
    uint64_t v12 = *((void *)v9 + 3);
    uint64_t v11 = *((void *)v9 + 4);
    uint64_t v14 = *((void *)v9 + 5);
    uint64_t v13 = *((void *)v9 + 6);
    uint64_t v15 = *((void *)v9 + 7);
    uint64_t v16 = *((void *)v9 + 8);
    unsigned __int8 v17 = v9[72];
    sub_24EC23000();
    char v21 = v20;
    uint64_t v22 = v19;
    uint64_t v23 = v10;
    uint64_t v24 = v12;
    uint64_t v25 = v11;
    uint64_t v26 = v14;
    uint64_t v27 = v13;
    uint64_t v28 = v15;
    uint64_t v29 = v16;
    unsigned __int8 v30 = v17;
    BrowseItemPlaceholder.hash(into:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_24EC163F4((uint64_t)v9, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for BrowseItem);
    sub_24EC23000();
    BrowseItem.hash(into:)(a1);
    return sub_24EC18508((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for BrowseItem);
  }
}

uint64_t BrowseLazyItem.hashValue.getter()
{
  sub_24EC22FF0();
  BrowseLazyItem.hash(into:)((uint64_t)v1);
  return sub_24EC23030();
}

uint64_t sub_24EC16690()
{
  sub_24EC22FF0();
  BrowseLazyItem.hash(into:)((uint64_t)v1);
  return sub_24EC23030();
}

uint64_t sub_24EC166D4()
{
  sub_24EC22FF0();
  BrowseLazyItem.hash(into:)((uint64_t)v1);
  return sub_24EC23030();
}

uint64_t _s15FitnessBrowsing14BrowseLazyItemO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BrowseItem();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for BrowseLazyItem();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v37 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269945F60);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (uint64_t)&v15[*(int *)(v16 + 56)];
  sub_24EBE7BCC(a1, (uint64_t)v15);
  sub_24EBE7BCC(a2, v17);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_24EBE7BCC((uint64_t)v15, (uint64_t)v9);
    uint64_t v18 = *((void *)v9 + 2);
    uint64_t v19 = *((void *)v9 + 4);
    uint64_t v20 = *((void *)v9 + 6);
    uint64_t v21 = *((void *)v9 + 8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      char v22 = v9[72];
      uint64_t v23 = *((void *)v9 + 7);
      uint64_t v24 = *((void *)v9 + 5);
      uint64_t v25 = *((void *)v9 + 3);
      uint64_t v26 = *((void *)v9 + 1);
      char v27 = *v9;
      char v28 = *(unsigned char *)v17;
      uint64_t v29 = *(void *)(v17 + 8);
      uint64_t v31 = *(void *)(v17 + 48);
      uint64_t v30 = *(void *)(v17 + 56);
      uint64_t v32 = *(void *)(v17 + 64);
      char v33 = *(unsigned char *)(v17 + 72);
      v46[0] = v27;
      uint64_t v47 = v26;
      uint64_t v48 = v18;
      uint64_t v49 = v25;
      uint64_t v50 = v19;
      uint64_t v51 = v24;
      uint64_t v52 = v20;
      uint64_t v53 = v23;
      uint64_t v54 = v21;
      char v55 = v22;
      v38[0] = v28;
      uint64_t v39 = v29;
      long long v34 = *(_OWORD *)(v17 + 32);
      v37[0] = *(_OWORD *)(v17 + 16);
      v37[1] = v34;
      long long v40 = v37[0];
      long long v41 = v34;
      uint64_t v42 = v31;
      uint64_t v43 = v30;
      uint64_t v44 = v32;
      char v45 = v33;
      char v35 = _s15FitnessBrowsing21BrowseItemPlaceholderV2eeoiySbAC_ACtFZ_0((uint64_t)v46, (uint64_t)v38);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_9:
      sub_24EC18508((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
      return v35 & 1;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24EBE7BCC((uint64_t)v15, (uint64_t)v12);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      sub_24EC163F4(v17, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for BrowseItem);
      char v35 = static BrowseItem.== infix(_:_:)((uint64_t)v12, (uint64_t)v6);
      sub_24EC18508((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for BrowseItem);
      sub_24EC18508((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for BrowseItem);
      goto LABEL_9;
    }
    sub_24EC18508((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for BrowseItem);
  }
  sub_24EB62820((uint64_t)v15);
  char v35 = 0;
  return v35 & 1;
}

uint64_t sub_24EC16A64()
{
  return sub_24EC16AAC(&qword_269948808, (void (*)(uint64_t))type metadata accessor for BrowseLazyItem);
}

uint64_t sub_24EC16AAC(unint64_t *a1, void (*a2)(uint64_t))
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

void *initializeBufferWithCopyOfBuffer for BrowseLazyItem(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (void *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      uint64_t v6 = a2[2];
      a1[1] = a2[1];
      a1[2] = v6;
      uint64_t v7 = a2[4];
      a1[3] = a2[3];
      a1[4] = v7;
      uint64_t v8 = a2[6];
      a1[5] = a2[5];
      a1[6] = v8;
      uint64_t v9 = a2[8];
      a1[7] = a2[7];
      a1[8] = v9;
      *((unsigned char *)a1 + 72) = *((unsigned char *)a2 + 72);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v11 = sub_24EC21D10();
      uint64_t v12 = *(void *)(v11 - 8);
      uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
      uint64_t v72 = v12;
      if (v13((char *)a2, 1, v11))
      {
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
        memcpy(a1, a2, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v12 + 16))(a1, a2, v11);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
      }
      uint64_t v15 = (int *)type metadata accessor for BrowseItem();
      uint64_t v16 = v15[5];
      uint64_t v17 = (char *)a1 + v16;
      uint64_t v18 = (char *)a2 + v16;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699465C0);
      if (swift_getEnumCaseMultiPayload() == 1) {
        uint64_t v19 = (uint64_t *)&unk_2699466D0;
      }
      else {
        uint64_t v19 = (uint64_t *)&unk_2699466C8;
      }
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(v19);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v17, v18, v20);
      swift_storeEnumTagMultiPayload();
      *(void *)((char *)a1 + v15[6]) = *(void *)((char *)a2 + v15[6]);
      *((unsigned char *)a1 + v15[7]) = *((unsigned char *)a2 + v15[7]);
      *((unsigned char *)a1 + v15[8]) = *((unsigned char *)a2 + v15[8]);
      uint64_t v21 = v15[9];
      char v22 = (char *)a1 + v21;
      uint64_t v23 = (char *)a2 + v21;
      swift_bridgeObjectRetain();
      unint64_t v73 = v13;
      uint64_t v74 = v11;
      if (v13(v23, 1, v11))
      {
        uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
        memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v22, v23, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v22, 0, 1, v11);
      }
      *((unsigned char *)a1 + v15[10]) = *((unsigned char *)a2 + v15[10]);
      *((unsigned char *)a1 + v15[11]) = *((unsigned char *)a2 + v15[11]);
      *(void *)((char *)a1 + v15[12]) = *(void *)((char *)a2 + v15[12]);
      uint64_t v25 = v15[13];
      uint64_t v26 = (void *)((char *)a1 + v25);
      char v27 = (void *)((char *)a2 + v25);
      uint64_t v28 = v27[1];
      void *v26 = *v27;
      v26[1] = v28;
      uint64_t v29 = v15[14];
      __dst = (void *)((char *)a1 + v29);
      uint64_t v30 = (void *)((char *)a2 + v29);
      uint64_t v31 = type metadata accessor for EditorialLink();
      uint64_t v32 = *(void *)(v31 - 8);
      char v33 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v32 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v33(v30, 1, v31))
      {
        uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465C8);
        memcpy(__dst, v30, *(void *)(*(void *)(v34 - 8) + 64));
      }
      else
      {
        *(_OWORD *)__dst = *(_OWORD *)v30;
        __dst[2] = v30[2];
        uint64_t v35 = *(int *)(type metadata accessor for EditorialVideoLink() + 24);
        v69 = (char *)v30 + v35;
        unint64_t v70 = (char *)__dst + v35;
        uint64_t v36 = sub_24EC21D30();
        uint64_t v37 = *(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16);
        swift_bridgeObjectRetain();
        v37(v70, v69, v36);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v32 + 56))(__dst, 0, 1, v31);
      }
      *((unsigned char *)a1 + v15[15]) = *((unsigned char *)a2 + v15[15]);
      uint64_t v38 = v15[16];
      uint64_t v39 = (void *)((char *)a1 + v38);
      long long v40 = (void *)((char *)a2 + v38);
      uint64_t v41 = v40[1];
      *uint64_t v39 = *v40;
      v39[1] = v41;
      *((unsigned char *)a1 + v15[17]) = *((unsigned char *)a2 + v15[17]);
      uint64_t v42 = v15[18];
      uint64_t v43 = (char *)a1 + v42;
      uint64_t v44 = (char *)a2 + v42;
      swift_bridgeObjectRetain();
      if (v73(v44, 1, v74))
      {
        uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
        memcpy(v43, v44, *(void *)(*(void *)(v45 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v43, v44, v74);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v43, 0, 1, v74);
      }
      uint64_t v46 = v15[19];
      uint64_t v47 = (char *)a1 + v46;
      uint64_t v48 = (char *)a2 + v46;
      uint64_t v49 = *(void *)((char *)a2 + v46 + 40);
      if (v49 == 1)
      {
        long long v50 = *((_OWORD *)v48 + 1);
        *(_OWORD *)uint64_t v47 = *(_OWORD *)v48;
        *((_OWORD *)v47 + 1) = v50;
        *((_OWORD *)v47 + 2) = *((_OWORD *)v48 + 2);
        v47[48] = v48[48];
      }
      else
      {
        int v51 = v48[24];
        if (v51 == 255)
        {
          *(_OWORD *)uint64_t v47 = *(_OWORD *)v48;
          *(_OWORD *)(v47 + 9) = *(_OWORD *)(v48 + 9);
        }
        else
        {
          uint64_t v52 = *(void *)v48;
          uint64_t v53 = *((void *)v48 + 1);
          uint64_t v54 = *((void *)v48 + 2);
          sub_24EB7CDBC(*(void *)v48, v53, v54, v48[24]);
          *(void *)uint64_t v47 = v52;
          *((void *)v47 + 1) = v53;
          *((void *)v47 + 2) = v54;
          v47[24] = v51;
          uint64_t v49 = *((void *)v48 + 5);
        }
        *((void *)v47 + 4) = *((void *)v48 + 4);
        *((void *)v47 + 5) = v49;
        v47[48] = v48[48];
        swift_bridgeObjectRetain();
      }
      uint64_t v55 = v15[20];
      long long v56 = (char *)a1 + v55;
      uint64_t v57 = (char *)a2 + v55;
      if (v73((char *)a2 + v55, 1, v74))
      {
        uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
        memcpy(v56, v57, *(void *)(*(void *)(v58 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v56, v57, v74);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v72 + 56))(v56, 0, 1, v74);
      }
      uint64_t v59 = v15[21];
      uint64_t v60 = (char *)a1 + v59;
      uint64_t v61 = (char *)a2 + v59;
      uint64_t v62 = *(void *)((char *)a2 + v59 + 40);
      if (v62 == 1)
      {
        long long v63 = *((_OWORD *)v61 + 1);
        *(_OWORD *)uint64_t v60 = *(_OWORD *)v61;
        *((_OWORD *)v60 + 1) = v63;
        *((_OWORD *)v60 + 2) = *((_OWORD *)v61 + 2);
        v60[48] = v61[48];
      }
      else
      {
        int v64 = v61[24];
        if (v64 == 255)
        {
          *(_OWORD *)uint64_t v60 = *(_OWORD *)v61;
          *(_OWORD *)(v60 + 9) = *(_OWORD *)(v61 + 9);
        }
        else
        {
          uint64_t v65 = *(void *)v61;
          uint64_t v66 = *((void *)v61 + 1);
          uint64_t v67 = *((void *)v61 + 2);
          sub_24EB7CDBC(*(void *)v61, v66, v67, v61[24]);
          *(void *)uint64_t v60 = v65;
          *((void *)v60 + 1) = v66;
          *((void *)v60 + 2) = v67;
          v60[24] = v64;
          uint64_t v62 = *((void *)v61 + 5);
        }
        *((void *)v60 + 4) = *((void *)v61 + 4);
        *((void *)v60 + 5) = v62;
        v60[48] = v61[48];
        swift_bridgeObjectRetain();
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for BrowseLazyItem(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_23:
    return swift_bridgeObjectRelease();
  }
  uint64_t v2 = sub_24EC21D10();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (!v4(a1, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }
  int v5 = (int *)type metadata accessor for BrowseItem();
  uint64_t v6 = a1 + v5[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699465C0);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v7 = (uint64_t *)&unk_2699466D0;
  }
  else {
    uint64_t v7 = (uint64_t *)&unk_2699466C8;
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(v7);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v6, v8);
  swift_bridgeObjectRelease();
  uint64_t v9 = a1 + v5[9];
  if (!v4(v9, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v9, v2);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = a1 + v5[14];
  uint64_t v11 = type metadata accessor for EditorialLink();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v10, 1, v11))
  {
    swift_bridgeObjectRelease();
    uint64_t v12 = v10 + *(int *)(type metadata accessor for EditorialVideoLink() + 24);
    uint64_t v13 = sub_24EC21D30();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  swift_bridgeObjectRelease();
  uint64_t v14 = a1 + v5[18];
  if (!v4(v14, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v14, v2);
  }
  uint64_t v15 = a1 + v5[19];
  if (*(void *)(v15 + 40) != 1)
  {
    int v16 = *(unsigned __int8 *)(v15 + 24);
    if (v16 != 255) {
      sub_24EB7EA4C(*(void *)v15, *(void *)(v15 + 8), *(void *)(v15 + 16), v16);
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v17 = a1 + v5[20];
  if (!v4(v17, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v17, v2);
  }
  uint64_t v18 = a1 + v5[21];
  uint64_t result = *(void *)(v18 + 40);
  if (result != 1)
  {
    int v20 = *(unsigned __int8 *)(v18 + 24);
    if (v20 != 255) {
      sub_24EB7EA4C(*(void *)v18, *(void *)(v18 + 8), *(void *)(v18 + 16), v20);
    }
    goto LABEL_23;
  }
  return result;
}

void *initializeWithCopy for BrowseLazyItem(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v4 = a2[2];
    a1[1] = a2[1];
    a1[2] = v4;
    uint64_t v5 = a2[4];
    a1[3] = a2[3];
    a1[4] = v5;
    uint64_t v6 = a2[6];
    a1[5] = a2[5];
    a1[6] = v6;
    uint64_t v7 = a2[8];
    a1[7] = a2[7];
    a1[8] = v7;
    *((unsigned char *)a1 + 72) = *((unsigned char *)a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v8 = sub_24EC21D10();
    uint64_t v9 = *(void *)(v8 - 8);
    uint64_t v71 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
    uint64_t v70 = v9;
    if (v71((char *)a2, 1, v8))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v9 + 16))(a1, a2, v8);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
    }
    uint64_t v11 = (int *)type metadata accessor for BrowseItem();
    uint64_t v12 = v11[5];
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699465C0);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v15 = (uint64_t *)&unk_2699466D0;
    }
    else {
      uint64_t v15 = (uint64_t *)&unk_2699466C8;
    }
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(v15);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v13, v14, v16);
    swift_storeEnumTagMultiPayload();
    *(void *)((char *)a1 + v11[6]) = *(void *)((char *)a2 + v11[6]);
    *((unsigned char *)a1 + v11[7]) = *((unsigned char *)a2 + v11[7]);
    *((unsigned char *)a1 + v11[8]) = *((unsigned char *)a2 + v11[8]);
    uint64_t v17 = v11[9];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    swift_bridgeObjectRetain();
    uint64_t v69 = v8;
    if (v71(v19, 1, v8))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
      memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v18, v19, v8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v18, 0, 1, v8);
    }
    *((unsigned char *)a1 + v11[10]) = *((unsigned char *)a2 + v11[10]);
    *((unsigned char *)a1 + v11[11]) = *((unsigned char *)a2 + v11[11]);
    *(void *)((char *)a1 + v11[12]) = *(void *)((char *)a2 + v11[12]);
    uint64_t v21 = v11[13];
    char v22 = (void *)((char *)a1 + v21);
    uint64_t v23 = (void *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    *char v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = v11[14];
    __dst = (void *)((char *)a1 + v25);
    uint64_t v26 = (void *)((char *)a2 + v25);
    uint64_t v27 = type metadata accessor for EditorialLink();
    uint64_t v28 = *(void *)(v27 - 8);
    uint64_t v29 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v28 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v29(v26, 1, v27))
    {
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465C8);
      memcpy(__dst, v26, *(void *)(*(void *)(v30 - 8) + 64));
    }
    else
    {
      *(_OWORD *)__dst = *(_OWORD *)v26;
      __dst[2] = v26[2];
      uint64_t v31 = *(int *)(type metadata accessor for EditorialVideoLink() + 24);
      uint64_t v66 = (char *)v26 + v31;
      uint64_t v67 = (char *)__dst + v31;
      uint64_t v32 = sub_24EC21D30();
      char v33 = *(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16);
      swift_bridgeObjectRetain();
      v33(v67, v66, v32);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(__dst, 0, 1, v27);
    }
    uint64_t v34 = v69;
    *((unsigned char *)a1 + v11[15]) = *((unsigned char *)a2 + v11[15]);
    uint64_t v35 = v11[16];
    uint64_t v36 = (void *)((char *)a1 + v35);
    uint64_t v37 = (void *)((char *)a2 + v35);
    uint64_t v38 = v37[1];
    *uint64_t v36 = *v37;
    v36[1] = v38;
    *((unsigned char *)a1 + v11[17]) = *((unsigned char *)a2 + v11[17]);
    uint64_t v39 = v11[18];
    long long v40 = (char *)a1 + v39;
    uint64_t v41 = (char *)a2 + v39;
    swift_bridgeObjectRetain();
    if (v71(v41, 1, v69))
    {
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
      memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v40, v41, v69);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v70 + 56))(v40, 0, 1, v69);
    }
    uint64_t v43 = v11[19];
    uint64_t v44 = (char *)a1 + v43;
    uint64_t v45 = (char *)a2 + v43;
    uint64_t v46 = *(void *)((char *)a2 + v43 + 40);
    if (v46 == 1)
    {
      long long v47 = *((_OWORD *)v45 + 1);
      *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
      *((_OWORD *)v44 + 1) = v47;
      *((_OWORD *)v44 + 2) = *((_OWORD *)v45 + 2);
      v44[48] = v45[48];
    }
    else
    {
      int v48 = v45[24];
      if (v48 == 255)
      {
        *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
        *(_OWORD *)(v44 + 9) = *(_OWORD *)(v45 + 9);
      }
      else
      {
        uint64_t v49 = *(void *)v45;
        uint64_t v50 = *((void *)v45 + 1);
        uint64_t v51 = *((void *)v45 + 2);
        sub_24EB7CDBC(*(void *)v45, v50, v51, v45[24]);
        *(void *)uint64_t v44 = v49;
        *((void *)v44 + 1) = v50;
        uint64_t v34 = v69;
        *((void *)v44 + 2) = v51;
        v44[24] = v48;
        uint64_t v46 = *((void *)v45 + 5);
      }
      *((void *)v44 + 4) = *((void *)v45 + 4);
      *((void *)v44 + 5) = v46;
      v44[48] = v45[48];
      swift_bridgeObjectRetain();
    }
    uint64_t v52 = v11[20];
    uint64_t v53 = (char *)a1 + v52;
    uint64_t v54 = (char *)a2 + v52;
    if (v71((char *)a2 + v52, 1, v34))
    {
      uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
      memcpy(v53, v54, *(void *)(*(void *)(v55 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v53, v54, v34);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v70 + 56))(v53, 0, 1, v34);
    }
    uint64_t v56 = v11[21];
    uint64_t v57 = (char *)a1 + v56;
    uint64_t v58 = (char *)a2 + v56;
    uint64_t v59 = *(void *)((char *)a2 + v56 + 40);
    if (v59 == 1)
    {
      long long v60 = *((_OWORD *)v58 + 1);
      *(_OWORD *)uint64_t v57 = *(_OWORD *)v58;
      *((_OWORD *)v57 + 1) = v60;
      *((_OWORD *)v57 + 2) = *((_OWORD *)v58 + 2);
      v57[48] = v58[48];
    }
    else
    {
      int v61 = v58[24];
      if (v61 == 255)
      {
        *(_OWORD *)uint64_t v57 = *(_OWORD *)v58;
        *(_OWORD *)(v57 + 9) = *(_OWORD *)(v58 + 9);
      }
      else
      {
        uint64_t v62 = *(void *)v58;
        uint64_t v63 = *((void *)v58 + 1);
        uint64_t v64 = *((void *)v58 + 2);
        sub_24EB7CDBC(*(void *)v58, v63, v64, v58[24]);
        *(void *)uint64_t v57 = v62;
        *((void *)v57 + 1) = v63;
        *((void *)v57 + 2) = v64;
        v57[24] = v61;
        uint64_t v59 = *((void *)v58 + 5);
      }
      *((void *)v57 + 4) = *((void *)v58 + 4);
      *((void *)v57 + 5) = v59;
      v57[48] = v58[48];
      swift_bridgeObjectRetain();
    }
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for BrowseLazyItem(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_24EC18508((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      a1[4] = a2[4];
      a1[5] = a2[5];
      a1[6] = a2[6];
      a1[7] = a2[7];
      a1[8] = a2[8];
      *((unsigned char *)a1 + 72) = *((unsigned char *)a2 + 72);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v4 = sub_24EC21D10();
      uint64_t v5 = *(void *)(v4 - 8);
      uint64_t v69 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
      uint64_t v67 = v5;
      if (v69((char *)a2, 1, v4))
      {
        uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
        memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
      }
      uint64_t v7 = (int *)type metadata accessor for BrowseItem();
      uint64_t v8 = v7[5];
      uint64_t v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699465C0);
      if (swift_getEnumCaseMultiPayload() == 1) {
        uint64_t v11 = (uint64_t *)&unk_2699466D0;
      }
      else {
        uint64_t v11 = (uint64_t *)&unk_2699466C8;
      }
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(v11);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
      *(void *)((char *)a1 + v7[6]) = *(void *)((char *)a2 + v7[6]);
      *((unsigned char *)a1 + v7[7]) = *((unsigned char *)a2 + v7[7]);
      *((unsigned char *)a1 + v7[8]) = *((unsigned char *)a2 + v7[8]);
      uint64_t v13 = v7[9];
      uint64_t v14 = (char *)a1 + v13;
      uint64_t v15 = (char *)a2 + v13;
      swift_bridgeObjectRetain();
      uint64_t v68 = v4;
      if (v69(v15, 1, v4))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
        memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v14, v15, v4);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v14, 0, 1, v4);
      }
      *((unsigned char *)a1 + v7[10]) = *((unsigned char *)a2 + v7[10]);
      *((unsigned char *)a1 + v7[11]) = *((unsigned char *)a2 + v7[11]);
      *(void *)((char *)a1 + v7[12]) = *(void *)((char *)a2 + v7[12]);
      uint64_t v17 = v7[13];
      uint64_t v18 = (void *)((char *)a1 + v17);
      uint64_t v19 = (void *)((char *)a2 + v17);
      *uint64_t v18 = *v19;
      v18[1] = v19[1];
      uint64_t v20 = v7[14];
      __dst = (void *)((char *)a1 + v20);
      uint64_t v21 = (void *)((char *)a2 + v20);
      uint64_t v22 = type metadata accessor for EditorialLink();
      uint64_t v23 = *(void *)(v22 - 8);
      uint64_t v24 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v23 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v24(v21, 1, v22))
      {
        uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465C8);
        memcpy(__dst, v21, *(void *)(*(void *)(v25 - 8) + 64));
      }
      else
      {
        void *__dst = *v21;
        __dst[1] = v21[1];
        __dst[2] = v21[2];
        uint64_t v26 = *(int *)(type metadata accessor for EditorialVideoLink() + 24);
        uint64_t v64 = (char *)v21 + v26;
        uint64_t v65 = (char *)__dst + v26;
        uint64_t v27 = sub_24EC21D30();
        uint64_t v28 = *(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16);
        swift_bridgeObjectRetain();
        v28(v65, v64, v27);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(__dst, 0, 1, v22);
      }
      uint64_t v29 = v68;
      *((unsigned char *)a1 + v7[15]) = *((unsigned char *)a2 + v7[15]);
      uint64_t v30 = v7[16];
      uint64_t v31 = (void *)((char *)a1 + v30);
      uint64_t v32 = (void *)((char *)a2 + v30);
      *uint64_t v31 = *v32;
      v31[1] = v32[1];
      *((unsigned char *)a1 + v7[17]) = *((unsigned char *)a2 + v7[17]);
      uint64_t v33 = v7[18];
      uint64_t v34 = (char *)a1 + v33;
      uint64_t v35 = (char *)a2 + v33;
      swift_bridgeObjectRetain();
      if (v69(v35, 1, v68))
      {
        uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
        memcpy(v34, v35, *(void *)(*(void *)(v36 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v34, v35, v68);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v67 + 56))(v34, 0, 1, v68);
      }
      uint64_t v37 = v7[19];
      uint64_t v38 = (char *)a1 + v37;
      uint64_t v39 = (char *)a2 + v37;
      if (*(void *)((char *)a2 + v37 + 40) == 1)
      {
        long long v40 = *(_OWORD *)v39;
        long long v41 = *((_OWORD *)v39 + 1);
        long long v42 = *((_OWORD *)v39 + 2);
        v38[48] = v39[48];
        *((_OWORD *)v38 + 1) = v41;
        *((_OWORD *)v38 + 2) = v42;
        *(_OWORD *)uint64_t v38 = v40;
      }
      else
      {
        int v43 = v39[24];
        if (v43 == 255)
        {
          long long v47 = *(_OWORD *)v39;
          *(_OWORD *)(v38 + 9) = *(_OWORD *)(v39 + 9);
          *(_OWORD *)uint64_t v38 = v47;
        }
        else
        {
          uint64_t v44 = *(void *)v39;
          uint64_t v45 = *((void *)v39 + 1);
          uint64_t v46 = *((void *)v39 + 2);
          sub_24EB7CDBC(*(void *)v39, v45, v46, v39[24]);
          *(void *)uint64_t v38 = v44;
          *((void *)v38 + 1) = v45;
          uint64_t v29 = v68;
          *((void *)v38 + 2) = v46;
          v38[24] = v43;
        }
        *((void *)v38 + 4) = *((void *)v39 + 4);
        *((void *)v38 + 5) = *((void *)v39 + 5);
        v38[48] = v39[48];
        swift_bridgeObjectRetain();
      }
      uint64_t v48 = v7[20];
      uint64_t v49 = (char *)a1 + v48;
      uint64_t v50 = (char *)a2 + v48;
      if (v69((char *)a2 + v48, 1, v29))
      {
        uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
        memcpy(v49, v50, *(void *)(*(void *)(v51 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v49, v50, v29);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v67 + 56))(v49, 0, 1, v29);
      }
      uint64_t v52 = v7[21];
      uint64_t v53 = (char *)a1 + v52;
      uint64_t v54 = (char *)a2 + v52;
      if (*(void *)((char *)a2 + v52 + 40) == 1)
      {
        long long v55 = *(_OWORD *)v54;
        long long v56 = *((_OWORD *)v54 + 1);
        long long v57 = *((_OWORD *)v54 + 2);
        v53[48] = v54[48];
        *((_OWORD *)v53 + 1) = v56;
        *((_OWORD *)v53 + 2) = v57;
        *(_OWORD *)uint64_t v53 = v55;
      }
      else
      {
        int v58 = v54[24];
        if (v58 == 255)
        {
          long long v62 = *(_OWORD *)v54;
          *(_OWORD *)(v53 + 9) = *(_OWORD *)(v54 + 9);
          *(_OWORD *)uint64_t v53 = v62;
        }
        else
        {
          uint64_t v59 = *(void *)v54;
          uint64_t v60 = *((void *)v54 + 1);
          uint64_t v61 = *((void *)v54 + 2);
          sub_24EB7CDBC(*(void *)v54, v60, v61, v54[24]);
          *(void *)uint64_t v53 = v59;
          *((void *)v53 + 1) = v60;
          *((void *)v53 + 2) = v61;
          v53[24] = v58;
        }
        *((void *)v53 + 4) = *((void *)v54 + 4);
        *((void *)v53 + 5) = *((void *)v54 + 5);
        v53[48] = v54[48];
        swift_bridgeObjectRetain();
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24EC18508(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *initializeWithTake for BrowseLazyItem(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_24EC21D10();
    uint64_t v7 = *(void *)(v6 - 8);
    uint64_t v49 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
    if (v49(a2, 1, v6))
    {
      uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
    uint64_t v9 = (int *)type metadata accessor for BrowseItem();
    uint64_t v10 = v9[5];
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699465C0);
    if (swift_getEnumCaseMultiPayload() == 1) {
      uint64_t v13 = (uint64_t *)&unk_2699466D0;
    }
    else {
      uint64_t v13 = (uint64_t *)&unk_2699466C8;
    }
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(v13);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
    swift_storeEnumTagMultiPayload();
    *(void *)&a1[v9[6]] = *(void *)&a2[v9[6]];
    a1[v9[7]] = a2[v9[7]];
    a1[v9[8]] = a2[v9[8]];
    uint64_t v15 = v9[9];
    uint64_t v16 = &a1[v15];
    uint64_t v17 = &a2[v15];
    uint64_t v18 = v49;
    uint64_t v48 = v7;
    if (v49(&a2[v15], 1, v6))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
      memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v16, v17, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
    }
    a1[v9[10]] = a2[v9[10]];
    a1[v9[11]] = a2[v9[11]];
    *(void *)&a1[v9[12]] = *(void *)&a2[v9[12]];
    *(_OWORD *)&a1[v9[13]] = *(_OWORD *)&a2[v9[13]];
    uint64_t v20 = v9[14];
    uint64_t v21 = &a1[v20];
    uint64_t v22 = &a2[v20];
    uint64_t v23 = type metadata accessor for EditorialLink();
    uint64_t v24 = *(void *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    {
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465C8);
      memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      *(void *)uint64_t v21 = *(void *)v22;
      *(_OWORD *)(v21 + 8) = *(_OWORD *)(v22 + 8);
      uint64_t v26 = *(int *)(type metadata accessor for EditorialVideoLink() + 24);
      uint64_t v27 = &v21[v26];
      uint64_t v28 = &v22[v26];
      uint64_t v29 = sub_24EC21D30();
      uint64_t v30 = v27;
      uint64_t v18 = v49;
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(v30, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
    a1[v9[15]] = a2[v9[15]];
    *(_OWORD *)&a1[v9[16]] = *(_OWORD *)&a2[v9[16]];
    a1[v9[17]] = a2[v9[17]];
    uint64_t v31 = v9[18];
    uint64_t v32 = &a1[v31];
    uint64_t v33 = &a2[v31];
    if (v18(&a2[v31], 1, v6))
    {
      uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
      memcpy(v32, v33, *(void *)(*(void *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v32, v33, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v32, 0, 1, v6);
    }
    uint64_t v35 = v9[19];
    uint64_t v36 = &a1[v35];
    uint64_t v37 = &a2[v35];
    long long v38 = *((_OWORD *)v37 + 1);
    *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
    *((_OWORD *)v36 + 1) = v38;
    *((_OWORD *)v36 + 2) = *((_OWORD *)v37 + 2);
    v36[48] = v37[48];
    uint64_t v39 = v9[20];
    long long v40 = &a1[v39];
    long long v41 = &a2[v39];
    if (v18(&a2[v39], 1, v6))
    {
      uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
      memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v40, v41, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v40, 0, 1, v6);
    }
    uint64_t v43 = v9[21];
    uint64_t v44 = &a1[v43];
    uint64_t v45 = &a2[v43];
    long long v46 = *((_OWORD *)v45 + 1);
    *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
    *((_OWORD *)v44 + 1) = v46;
    *((_OWORD *)v44 + 2) = *((_OWORD *)v45 + 2);
    v44[48] = v45[48];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithTake for BrowseLazyItem(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24EC18508((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for BrowseLazyItem);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_24EC21D10();
      uint64_t v7 = *(void *)(v6 - 8);
      uint64_t v49 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
      if (v49(a2, 1, v6))
      {
        uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
        memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
      uint64_t v9 = (int *)type metadata accessor for BrowseItem();
      uint64_t v10 = v9[5];
      uint64_t v11 = &a1[v10];
      uint64_t v12 = &a2[v10];
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699465C0);
      if (swift_getEnumCaseMultiPayload() == 1) {
        uint64_t v13 = (uint64_t *)&unk_2699466D0;
      }
      else {
        uint64_t v13 = (uint64_t *)&unk_2699466C8;
      }
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(v13);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
      *(void *)&a1[v9[6]] = *(void *)&a2[v9[6]];
      a1[v9[7]] = a2[v9[7]];
      a1[v9[8]] = a2[v9[8]];
      uint64_t v15 = v9[9];
      uint64_t v16 = &a1[v15];
      uint64_t v17 = &a2[v15];
      uint64_t v18 = v49;
      uint64_t v48 = v7;
      if (v49(&a2[v15], 1, v6))
      {
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
        memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v16, v17, v6);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
      }
      a1[v9[10]] = a2[v9[10]];
      a1[v9[11]] = a2[v9[11]];
      *(void *)&a1[v9[12]] = *(void *)&a2[v9[12]];
      *(_OWORD *)&a1[v9[13]] = *(_OWORD *)&a2[v9[13]];
      uint64_t v20 = v9[14];
      uint64_t v21 = &a1[v20];
      uint64_t v22 = &a2[v20];
      uint64_t v23 = type metadata accessor for EditorialLink();
      uint64_t v24 = *(void *)(v23 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
      {
        uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465C8);
        memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
      }
      else
      {
        *(void *)uint64_t v21 = *(void *)v22;
        *(_OWORD *)(v21 + 8) = *(_OWORD *)(v22 + 8);
        uint64_t v26 = *(int *)(type metadata accessor for EditorialVideoLink() + 24);
        uint64_t v27 = &v21[v26];
        uint64_t v28 = &v22[v26];
        uint64_t v29 = sub_24EC21D30();
        uint64_t v30 = v27;
        uint64_t v18 = v49;
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(v30, v28, v29);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
      }
      a1[v9[15]] = a2[v9[15]];
      *(_OWORD *)&a1[v9[16]] = *(_OWORD *)&a2[v9[16]];
      a1[v9[17]] = a2[v9[17]];
      uint64_t v31 = v9[18];
      uint64_t v32 = &a1[v31];
      uint64_t v33 = &a2[v31];
      if (v18(&a2[v31], 1, v6))
      {
        uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
        memcpy(v32, v33, *(void *)(*(void *)(v34 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v32, v33, v6);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v32, 0, 1, v6);
      }
      uint64_t v35 = v9[19];
      uint64_t v36 = &a1[v35];
      uint64_t v37 = &a2[v35];
      long long v38 = *((_OWORD *)v37 + 1);
      *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
      *((_OWORD *)v36 + 1) = v38;
      *((_OWORD *)v36 + 2) = *((_OWORD *)v37 + 2);
      v36[48] = v37[48];
      uint64_t v39 = v9[20];
      long long v40 = &a1[v39];
      long long v41 = &a2[v39];
      if (v18(&a2[v39], 1, v6))
      {
        uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
        memcpy(v40, v41, *(void *)(*(void *)(v42 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v40, v41, v6);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v40, 0, 1, v6);
      }
      uint64_t v43 = v9[21];
      uint64_t v44 = &a1[v43];
      uint64_t v45 = &a2[v43];
      long long v46 = *((_OWORD *)v45 + 1);
      *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
      *((_OWORD *)v44 + 1) = v46;
      *((_OWORD *)v44 + 2) = *((_OWORD *)v45 + 2);
      v44[48] = v45[48];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_24EC1913C()
{
  uint64_t result = type metadata accessor for BrowseItem();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for BrowseLazyItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EC19298);
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

ValueMetadata *type metadata accessor for BrowseLazyItem.CodingKeys()
{
  return &type metadata for BrowseLazyItem.CodingKeys;
}

ValueMetadata *type metadata accessor for BrowseLazyItem.ItemCodingKeys()
{
  return &type metadata for BrowseLazyItem.ItemCodingKeys;
}

unsigned char *_s15FitnessBrowsing14BrowseLazyItemO14ItemCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24EC19380);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for BrowseLazyItem.PlaceholderCodingKeys()
{
  return &type metadata for BrowseLazyItem.PlaceholderCodingKeys;
}

unint64_t sub_24EC193BC()
{
  unint64_t result = qword_269948820;
  if (!qword_269948820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948820);
  }
  return result;
}

unint64_t sub_24EC19414()
{
  unint64_t result = qword_269948828;
  if (!qword_269948828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948828);
  }
  return result;
}

unint64_t sub_24EC1946C()
{
  unint64_t result = qword_269948830;
  if (!qword_269948830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948830);
  }
  return result;
}

unint64_t sub_24EC194C4()
{
  unint64_t result = qword_269948838;
  if (!qword_269948838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948838);
  }
  return result;
}

unint64_t sub_24EC1951C()
{
  unint64_t result = qword_269948840;
  if (!qword_269948840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948840);
  }
  return result;
}

unint64_t sub_24EC19574()
{
  unint64_t result = qword_269948848;
  if (!qword_269948848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948848);
  }
  return result;
}

unint64_t sub_24EC195CC()
{
  unint64_t result = qword_269948850;
  if (!qword_269948850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948850);
  }
  return result;
}

unint64_t sub_24EC19624()
{
  unint64_t result = qword_269948858;
  if (!qword_269948858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948858);
  }
  return result;
}

unint64_t sub_24EC1967C()
{
  unint64_t result = qword_269948860;
  if (!qword_269948860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948860);
  }
  return result;
}

uint64_t BrowseDetailTextItem.attributedSummary.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24EBD0AF4(v1, a1);
}

uint64_t BrowseDetailTextItem.attributedTitle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BrowseDetailTextItem() + 20);
  return sub_24EBD0AF4(v3, a1);
}

uint64_t BrowseDetailTextItem.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for BrowseDetailTextItem() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BrowseDetailTextItem.init(identifier:attributedSummary:attributedTitle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for BrowseDetailTextItem();
  uint64_t v11 = (void *)(a5 + *(int *)(v10 + 24));
  *uint64_t v11 = a1;
  v11[1] = a2;
  sub_24EBD0B5C(a3, a5);
  uint64_t v12 = a5 + *(int *)(v10 + 20);
  return sub_24EBD0B5C(a4, v12);
}

uint64_t sub_24EC197E4(char a1)
{
  if (!a1) {
    return 0xD000000000000011;
  }
  if (a1 == 1) {
    return 0x7475626972747461;
  }
  return 0x696669746E656469;
}

uint64_t sub_24EC19850()
{
  return sub_24EC197E4(*v0);
}

uint64_t sub_24EC19858@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EC1BB90(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EC19880(uint64_t a1)
{
  unint64_t v2 = sub_24EC1A988();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EC198BC(uint64_t a1)
{
  unint64_t v2 = sub_24EC1A988();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t BrowseDetailTextItem.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269948868);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unsigned int v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EC1A988();
  sub_24EC23050();
  char v11 = 0;
  sub_24EC21D10();
  sub_24EC1BCFC(&qword_2699465E0, MEMORY[0x263F06828]);
  sub_24EC22EF0();
  if (!v1)
  {
    type metadata accessor for BrowseDetailTextItem();
    char v10 = 1;
    sub_24EC22EF0();
    char v9 = 2;
    sub_24EC22F00();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t BrowseDetailTextItem.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
  MEMORY[0x270FA5388](v4 - 8);
  unsigned int v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v27 = (char *)&v23 - v8;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269948878);
  uint64_t v26 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  char v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for BrowseDetailTextItem();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EC1A988();
  sub_24EC23040();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v23 = v11;
  uint64_t v24 = v13;
  sub_24EC21D10();
  char v31 = 0;
  sub_24EC1BCFC(&qword_269946658, MEMORY[0x263F06828]);
  uint64_t v15 = (uint64_t)v27;
  uint64_t v14 = v28;
  sub_24EC22E40();
  sub_24EBD0B5C(v15, (uint64_t)v24);
  char v30 = 1;
  sub_24EC22E40();
  uint64_t v17 = v23;
  uint64_t v16 = (uint64_t)v24;
  sub_24EBD0B5C((uint64_t)v6, (uint64_t)&v24[*(int *)(v23 + 20)]);
  char v29 = 2;
  uint64_t v18 = sub_24EC22E50();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v14);
  uint64_t v21 = (uint64_t *)(v16 + *(int *)(v17 + 24));
  *uint64_t v21 = v18;
  v21[1] = v20;
  sub_24EC1A9DC(v16, v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24EC1AA40(v16);
}

uint64_t sub_24EC19E9C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return BrowseDetailTextItem.init(from:)(a1, a2);
}

uint64_t sub_24EC19EB4(void *a1)
{
  return BrowseDetailTextItem.encode(to:)(a1);
}

uint64_t BrowseDetailTextItem.hash(into:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24EC21D10();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_24EBD0AF4(v1, (uint64_t)&v15 - v10);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  if (v12(v11, 1, v2) == 1)
  {
    sub_24EC23010();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v11, v2);
    sub_24EC23010();
    sub_24EC1BCFC(&qword_2699466B8, MEMORY[0x263F06828]);
    sub_24EC22A20();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  uint64_t v13 = type metadata accessor for BrowseDetailTextItem();
  sub_24EBD0AF4(v1 + *(int *)(v13 + 20), (uint64_t)v9);
  if (v12(v9, 1, v2) == 1)
  {
    sub_24EC23010();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v9, v2);
    sub_24EC23010();
    sub_24EC1BCFC(&qword_2699466B8, MEMORY[0x263F06828]);
    sub_24EC22A20();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  swift_bridgeObjectRetain();
  sub_24EC22AB0();
  return swift_bridgeObjectRelease();
}

uint64_t BrowseDetailTextItem.hashValue.getter()
{
  return sub_24EC23030();
}

uint64_t sub_24EC1A20C()
{
  return sub_24EC23030();
}

uint64_t sub_24EC1A250()
{
  return sub_24EC23030();
}

uint64_t _s15FitnessBrowsing20BrowseDetailTextItemV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EC21D10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  long long v55 = &v52[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946708);
  MEMORY[0x270FA5388](v7);
  int v58 = &v52[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = &v52[-v10];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = &v52[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v15);
  uint64_t v60 = &v52[-v16];
  MEMORY[0x270FA5388](v17);
  long long v57 = &v52[-v18];
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = &v52[-v20];
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = &v52[-v23];
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = &v52[-v26];
  uint64_t v59 = a1;
  sub_24EBD0AF4(a1, (uint64_t)&v52[-v26]);
  uint64_t v61 = a2;
  sub_24EBD0AF4(a2, (uint64_t)v24);
  uint64_t v56 = v7;
  uint64_t v28 = (uint64_t)&v11[*(int *)(v7 + 48)];
  sub_24EBD0AF4((uint64_t)v27, (uint64_t)v11);
  sub_24EBD0AF4((uint64_t)v24, v28);
  uint64_t v62 = v5;
  char v29 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v29((uint64_t)v11, 1, v4) == 1)
  {
    sub_24EB742F4((uint64_t)v24, &qword_2699465B8);
    sub_24EB742F4((uint64_t)v27, &qword_2699465B8);
    if (v29(v28, 1, v4) == 1)
    {
      sub_24EB742F4((uint64_t)v11, &qword_2699465B8);
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v30 = (uint64_t)v11;
LABEL_14:
    sub_24EB742F4(v30, &qword_269946708);
    goto LABEL_15;
  }
  sub_24EBD0AF4((uint64_t)v11, (uint64_t)v21);
  if (v29(v28, 1, v4) == 1)
  {
    sub_24EB742F4((uint64_t)v24, &qword_2699465B8);
    sub_24EB742F4((uint64_t)v27, &qword_2699465B8);
    (*(void (**)(unsigned char *, uint64_t))(v62 + 8))(v21, v4);
    goto LABEL_6;
  }
  uint64_t v31 = v62;
  uint64_t v32 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v62 + 32);
  uint64_t v54 = v14;
  uint64_t v33 = v55;
  v32(v55, v28, v4);
  sub_24EC1BCFC(&qword_269946710, MEMORY[0x263F06828]);
  int v53 = sub_24EC22A30();
  uint64_t v34 = *(void (**)(unsigned char *, uint64_t))(v31 + 8);
  uint64_t v35 = v33;
  uint64_t v14 = v54;
  v34(v35, v4);
  sub_24EB742F4((uint64_t)v24, &qword_2699465B8);
  sub_24EB742F4((uint64_t)v27, &qword_2699465B8);
  v34(v21, v4);
  sub_24EB742F4((uint64_t)v11, &qword_2699465B8);
  if ((v53 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v36 = type metadata accessor for BrowseDetailTextItem();
  uint64_t v37 = v59;
  long long v38 = v57;
  sub_24EBD0AF4(v59 + *(int *)(v36 + 20), (uint64_t)v57);
  uint64_t v39 = v60;
  sub_24EBD0AF4(v61 + *(int *)(v36 + 20), (uint64_t)v60);
  long long v40 = v58;
  uint64_t v41 = (uint64_t)&v58[*(int *)(v56 + 48)];
  sub_24EBD0AF4((uint64_t)v38, (uint64_t)v58);
  sub_24EBD0AF4((uint64_t)v39, v41);
  if (v29((uint64_t)v40, 1, v4) != 1)
  {
    sub_24EBD0AF4((uint64_t)v40, (uint64_t)v14);
    if (v29(v41, 1, v4) == 1)
    {
      sub_24EB742F4((uint64_t)v39, &qword_2699465B8);
      sub_24EB742F4((uint64_t)v38, &qword_2699465B8);
      (*(void (**)(unsigned char *, uint64_t))(v62 + 8))(v14, v4);
      goto LABEL_13;
    }
    uint64_t v44 = v62;
    uint64_t v45 = v55;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v62 + 32))(v55, v41, v4);
    sub_24EC1BCFC(&qword_269946710, MEMORY[0x263F06828]);
    char v46 = sub_24EC22A30();
    long long v47 = *(void (**)(unsigned char *, uint64_t))(v44 + 8);
    v47(v45, v4);
    sub_24EB742F4((uint64_t)v60, &qword_2699465B8);
    sub_24EB742F4((uint64_t)v38, &qword_2699465B8);
    v47(v14, v4);
    sub_24EB742F4((uint64_t)v40, &qword_2699465B8);
    if (v46) {
      goto LABEL_18;
    }
LABEL_15:
    char v42 = 0;
    return v42 & 1;
  }
  sub_24EB742F4((uint64_t)v39, &qword_2699465B8);
  sub_24EB742F4((uint64_t)v38, &qword_2699465B8);
  if (v29(v41, 1, v4) != 1)
  {
LABEL_13:
    uint64_t v30 = (uint64_t)v40;
    goto LABEL_14;
  }
  sub_24EB742F4((uint64_t)v40, &qword_2699465B8);
LABEL_18:
  uint64_t v48 = *(int *)(v36 + 24);
  uint64_t v49 = *(void *)(v37 + v48);
  uint64_t v50 = *(void *)(v37 + v48 + 8);
  uint64_t v51 = (void *)(v61 + v48);
  if (v49 == *v51 && v50 == v51[1]) {
    char v42 = 1;
  }
  else {
    char v42 = sub_24EC22F70();
  }
  return v42 & 1;
}

uint64_t type metadata accessor for BrowseDetailTextItem()
{
  uint64_t result = qword_26B1D8868;
  if (!qword_26B1D8868) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24EC1A988()
{
  unint64_t result = qword_269948870;
  if (!qword_269948870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948870);
  }
  return result;
}

uint64_t sub_24EC1A9DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BrowseDetailTextItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24EC1AA40(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BrowseDetailTextItem();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24EC1AA9C()
{
  return sub_24EC1BCFC(&qword_269948880, (void (*)(uint64_t))type metadata accessor for BrowseDetailTextItem);
}

uint64_t *initializeBufferWithCopyOfBuffer for BrowseDetailTextItem(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_24EC21D10();
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    if (v9(a2, 1, v7))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
      memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v12 = *(int *)(a3 + 20);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    if (v9((uint64_t *)((char *)a2 + v12), 1, v7))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
      memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v14, v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v13, 0, 1, v7);
    }
    uint64_t v16 = *(int *)(a3 + 24);
    uint64_t v17 = (uint64_t *)((char *)a1 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    void *v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for BrowseDetailTextItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EC21D10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v6(a1, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 20);
  if (!v6(v7, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v7, v4);
  }
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for BrowseDetailTextItem(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24EC21D10();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  if (v8(&a2[v10], 1, v6))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v12, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = *((void *)v16 + 1);
  *(void *)uint64_t v15 = *(void *)v16;
  *((void *)v15 + 1) = v17;
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for BrowseDetailTextItem(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24EC21D10();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  int v15 = v8(&a1[v12], 1, v6);
  int v16 = v8(v14, 1, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(v13, v14, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v14, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
LABEL_13:
  uint64_t v18 = *(int *)(a3 + 24);
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  *(void *)uint64_t v19 = *(void *)v20;
  *((void *)v19 + 1) = *((void *)v20 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for BrowseDetailTextItem(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24EC21D10();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 1, v6))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  if (v8(&a2[v10], 1, v6))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v12, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  *(_OWORD *)&a1[*(int *)(a3 + 24)] = *(_OWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

char *assignWithTake for BrowseDetailTextItem(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_24EC21D10();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  int v15 = v8(&a1[v12], 1, v6);
  int v16 = v8(v14, 1, v6);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(v13, v14, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_12;
  }
  if (v16)
  {
LABEL_12:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v13, v14, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v13, 0, 1, v6);
LABEL_13:
  uint64_t v18 = *(int *)(a3 + 24);
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  uint64_t v22 = *(void *)v20;
  uint64_t v21 = *((void *)v20 + 1);
  *(void *)uint64_t v19 = v22;
  *((void *)v19 + 1) = v21;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BrowseDetailTextItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24EC1B74C);
}

uint64_t sub_24EC1B74C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for BrowseDetailTextItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24EC1B828);
}

uint64_t sub_24EC1B828(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_2699465B8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

void sub_24EC1B8EC()
{
  sub_24EBBA7EC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for BrowseDetailTextItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x24EC1BA50);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BrowseDetailTextItem.CodingKeys()
{
  return &type metadata for BrowseDetailTextItem.CodingKeys;
}

unint64_t sub_24EC1BA8C()
{
  unint64_t result = qword_269948888;
  if (!qword_269948888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948888);
  }
  return result;
}

unint64_t sub_24EC1BAE4()
{
  unint64_t result = qword_269948890;
  if (!qword_269948890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948890);
  }
  return result;
}

unint64_t sub_24EC1BB3C()
{
  unint64_t result = qword_269948898;
  if (!qword_269948898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948898);
  }
  return result;
}

uint64_t sub_24EC1BB90(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000024EC31510 || (sub_24EC22F70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7475626972747461 && a2 == 0xEF656C7469546465 || (sub_24EC22F70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_24EC22F70();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24EC1BCFC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24EC1BD44(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = *(void *)(result + 56);
  uint64_t v26 = result + 56;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & v5;
  int64_t v27 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v9 = a2 + 56;
  uint64_t v25 = result;
  if ((v7 & v5) == 0) {
    goto LABEL_8;
  }
  while (2)
  {
    unint64_t v10 = __clz(__rbit64(v8));
    uint64_t v11 = (v8 - 1) & v8;
    unint64_t v12 = v10 | (v4 << 6);
LABEL_22:
    int v16 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v12);
    sub_24EC22FF0();
    sub_24EC22AB0();
    swift_bridgeObjectRelease();
    uint64_t v17 = sub_24EC23030();
    uint64_t v18 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v19 = v17 & ~v18;
    if (((*(void *)(v9 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
      return 0;
    }
    unint64_t v28 = v11;
    int64_t v29 = v4;
    uint64_t v20 = ~v18;
    while (!*(unsigned char *)(*(void *)(a2 + 48) + v19))
    {
      unint64_t v22 = 0x6C6F427469617274;
      unint64_t v21 = 0xE900000000000064;
      if (!v16) {
        goto LABEL_35;
      }
LABEL_29:
      if (v16 == 1) {
        unint64_t v23 = 0x800000024EC30B30;
      }
      else {
        unint64_t v23 = 0x800000024EC30B50;
      }
      if (v22 == 0xD000000000000011) {
        goto LABEL_36;
      }
LABEL_37:
      char v24 = sub_24EC22F70();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v24) {
        goto LABEL_41;
      }
      unint64_t v19 = (v19 + 1) & v20;
      if (((*(void *)(v9 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
        return 0;
      }
    }
    if (*(unsigned char *)(*(void *)(a2 + 48) + v19) == 1) {
      unint64_t v21 = 0x800000024EC30B30;
    }
    else {
      unint64_t v21 = 0x800000024EC30B50;
    }
    unint64_t v22 = 0xD000000000000011;
    if (v16) {
      goto LABEL_29;
    }
LABEL_35:
    unint64_t v23 = 0xE900000000000064;
    if (v22 != 0x6C6F427469617274) {
      goto LABEL_37;
    }
LABEL_36:
    if (v21 != v23) {
      goto LABEL_37;
    }
    uint64_t result = swift_bridgeObjectRelease_n();
LABEL_41:
    uint64_t v3 = v25;
    unint64_t v8 = v28;
    int64_t v4 = v29;
    if (v28) {
      continue;
    }
    break;
  }
LABEL_8:
  int64_t v13 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_46;
  }
  if (v13 >= v27) {
    return 1;
  }
  unint64_t v14 = *(void *)(v26 + 8 * v13);
  ++v4;
  if (v14) {
    goto LABEL_21;
  }
  int64_t v4 = v13 + 1;
  if (v13 + 1 >= v27) {
    return 1;
  }
  unint64_t v14 = *(void *)(v26 + 8 * v4);
  if (v14) {
    goto LABEL_21;
  }
  int64_t v4 = v13 + 2;
  if (v13 + 2 >= v27) {
    return 1;
  }
  unint64_t v14 = *(void *)(v26 + 8 * v4);
  if (v14) {
    goto LABEL_21;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v27) {
    return 1;
  }
  unint64_t v14 = *(void *)(v26 + 8 * v15);
  if (v14)
  {
    int64_t v4 = v15;
LABEL_21:
    uint64_t v11 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v4 << 6);
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v4 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v4 >= v27) {
      return 1;
    }
    unint64_t v14 = *(void *)(v26 + 8 * v4);
    ++v15;
    if (v14) {
      goto LABEL_21;
    }
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_24EC1C080(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EC21DF0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v45 = (char *)&v34 - v10;
  uint64_t result = MEMORY[0x270FA5388](v9);
  int64_t v13 = (char *)&v34 - v12;
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v14 = 0;
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v36 = a1;
  uint64_t v37 = a1 + 56;
  uint64_t v16 = 1 << *(unsigned char *)(a1 + 32);
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v15;
  int64_t v38 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v42 = v5 + 32;
  uint64_t v43 = a2 + 56;
  uint64_t v44 = v5 + 16;
  unint64_t v19 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v34 = v13;
  uint64_t v35 = v5;
  if (!v18) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v40 = (v18 - 1) & v18;
  int64_t v41 = v14;
  for (unint64_t i = __clz(__rbit64(v18)) | (v14 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v23 << 6))
  {
    uint64_t v25 = *(void *)(v5 + 72);
    uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    v26(v13, *(void *)(a1 + 48) + v25 * i, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v45, v13, v4);
    sub_24EC21C74(&qword_2699466F8, MEMORY[0x263F07A30]);
    uint64_t v27 = sub_24EC22A10();
    uint64_t v28 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v29 = v27 & ~v28;
    if (((*(void *)(v43 + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
    {
      (*v19)(v45, v4);
      return 0;
    }
    uint64_t v39 = (unint64_t)v19 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v30 = a2;
    uint64_t v31 = ~v28;
    while (1)
    {
      v26(v8, *(void *)(v30 + 48) + v29 * v25, v4);
      sub_24EC21C74(&qword_2699486F0, MEMORY[0x263F07A30]);
      char v32 = sub_24EC22A30();
      uint64_t v33 = *v19;
      (*v19)(v8, v4);
      if (v32) {
        break;
      }
      unint64_t v29 = (v29 + 1) & v31;
      if (((*(void *)(v43 + ((v29 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
      {
        v33(v45, v4);
        return 0;
      }
    }
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v33)(v45, v4);
    a2 = v30;
    uint64_t v5 = v35;
    a1 = v36;
    int64_t v13 = v34;
    unint64_t v18 = v40;
    int64_t v14 = v41;
    if (v40) {
      goto LABEL_7;
    }
LABEL_9:
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v21 >= v38) {
      return 1;
    }
    unint64_t v22 = *(void *)(v37 + 8 * v21);
    int64_t v23 = v14 + 1;
    if (!v22)
    {
      int64_t v23 = v14 + 2;
      if (v14 + 2 >= v38) {
        return 1;
      }
      unint64_t v22 = *(void *)(v37 + 8 * v23);
      if (!v22)
      {
        int64_t v23 = v14 + 3;
        if (v14 + 3 >= v38) {
          return 1;
        }
        unint64_t v22 = *(void *)(v37 + 8 * v23);
        if (!v22)
        {
          int64_t v23 = v14 + 4;
          if (v14 + 4 >= v38) {
            return 1;
          }
          unint64_t v22 = *(void *)(v37 + 8 * v23);
          if (!v22) {
            break;
          }
        }
      }
    }
LABEL_24:
    uint64_t v40 = (v22 - 1) & v22;
    int64_t v41 = v23;
  }
  uint64_t v24 = v14 + 5;
  if (v14 + 5 >= v38) {
    return 1;
  }
  unint64_t v22 = *(void *)(v37 + 8 * v24);
  if (v22)
  {
    int64_t v23 = v14 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v23 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v23 >= v38) {
      return 1;
    }
    unint64_t v22 = *(void *)(v37 + 8 * v23);
    ++v24;
    if (v22) {
      goto LABEL_24;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_24EC1C4C4(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 56;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(result + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v10 = a2 + 56;
  do
  {
LABEL_7:
    if (v8)
    {
      unint64_t v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v12 = v11 | (v4 << 6);
      goto LABEL_25;
    }
    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
LABEL_35:
      __break(1u);
      return result;
    }
    if (v13 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v13);
    ++v4;
    if (v14) {
      goto LABEL_24;
    }
    int64_t v4 = v13 + 1;
    if (v13 + 1 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v4);
    if (v14) {
      goto LABEL_24;
    }
    int64_t v4 = v13 + 2;
    if (v13 + 2 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v4);
    if (v14) {
      goto LABEL_24;
    }
    int64_t v4 = v13 + 3;
    if (v13 + 3 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v4);
    if (v14) {
      goto LABEL_24;
    }
    int64_t v15 = v13 + 4;
    if (v15 >= v9) {
      return 1;
    }
    unint64_t v14 = *(void *)(v5 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v4 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_35;
        }
        if (v4 >= v9) {
          return 1;
        }
        unint64_t v14 = *(void *)(v5 + 8 * v4);
        ++v15;
        if (v14) {
          goto LABEL_24;
        }
      }
    }
    int64_t v4 = v15;
LABEL_24:
    unint64_t v8 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v4 << 6);
LABEL_25:
    int v16 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v12);
    sub_24EC22FF0();
    sub_24EC23000();
    uint64_t result = sub_24EC23030();
    uint64_t v17 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v18 = result & ~v17;
    if (((*(void *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
      return 0;
    }
    uint64_t v19 = *(void *)(a2 + 48);
  }
  while (*(unsigned __int8 *)(v19 + v18) == v16);
  uint64_t v20 = ~v17;
  while (1)
  {
    unint64_t v18 = (v18 + 1) & v20;
    if (((*(void *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
      return 0;
    }
    if (*(unsigned __int8 *)(v19 + v18) == v16) {
      goto LABEL_7;
    }
  }
}

unint64_t sub_24EC1C6BC(char a1)
{
  unint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0x646564616F6CLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000013;
      break;
    case 4:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 5:
      unint64_t result = 0x4164694477656976;
      break;
    default:
      unint64_t result = 0x6F5464656C696166;
      break;
  }
  return result;
}

uint64_t sub_24EC1C7A4(char a1)
{
  if (a1) {
    return 0xD000000000000010;
  }
  else {
    return 0x746E65746E6F63;
  }
}

unint64_t sub_24EC1C7E0()
{
  return sub_24EC1C6BC(*v0);
}

uint64_t sub_24EC1C7E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EC218B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EC1C810(uint64_t a1)
{
  unint64_t v2 = sub_24EC1D608();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EC1C84C(uint64_t a1)
{
  unint64_t v2 = sub_24EC1D608();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EC1C888(uint64_t a1)
{
  unint64_t v2 = sub_24EC1D864();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EC1C8C4(uint64_t a1)
{
  unint64_t v2 = sub_24EC1D864();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EC1C900(uint64_t a1)
{
  unint64_t v2 = sub_24EC1D810();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EC1C93C(uint64_t a1)
{
  unint64_t v2 = sub_24EC1D810();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EC1C978()
{
  return sub_24EC1C7A4(*v0);
}

uint64_t sub_24EC1C980@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EC21B2C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EC1C9A8(uint64_t a1)
{
  unint64_t v2 = sub_24EC1D7BC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EC1C9E4(uint64_t a1)
{
  unint64_t v2 = sub_24EC1D7BC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EC1CA20(uint64_t a1)
{
  unint64_t v2 = sub_24EC1D768();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EC1CA5C(uint64_t a1)
{
  unint64_t v2 = sub_24EC1D768();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EC1CA98(uint64_t a1)
{
  unint64_t v2 = sub_24EC1D714();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EC1CAD4(uint64_t a1)
{
  unint64_t v2 = sub_24EC1D714();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EC1CB10(uint64_t a1)
{
  unint64_t v2 = sub_24EC1D6C0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EC1CB4C(uint64_t a1)
{
  unint64_t v2 = sub_24EC1D6C0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t BrowseAction.encode(to:)(void *a1)
{
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699488A0);
  uint64_t v60 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  long long v57 = (char *)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699488A8);
  uint64_t v66 = *(void *)(v3 - 8);
  uint64_t v67 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v62 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24EC21D70();
  uint64_t v64 = *(void *)(v5 - 8);
  uint64_t v65 = v5;
  MEMORY[0x270FA5388](v5);
  int v58 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699488B0);
  uint64_t v53 = *(void *)(v7 - 8);
  uint64_t v54 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v52 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699488B8);
  uint64_t v59 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v56 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = type metadata accessor for BrowseContent();
  MEMORY[0x270FA5388](v51);
  uint64_t v55 = (uint64_t)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699488C0);
  uint64_t v49 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  unint64_t v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699488C8);
  uint64_t v48 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  int64_t v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for BrowseAction();
  MEMORY[0x270FA5388](v16);
  unint64_t v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699488D0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v69 = v19;
  uint64_t v70 = v20;
  MEMORY[0x270FA5388](v19);
  unint64_t v22 = (char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EC1D608();
  uint64_t v68 = v22;
  sub_24EC23050();
  sub_24EC1D65C(v72, (uint64_t)v18);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v26 = *(void *)&v18[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269948688) + 48)];
      uint64_t v27 = v55;
      sub_24EC1E5E0((uint64_t)v18, v55, (uint64_t (*)(void))type metadata accessor for BrowseContent);
      LOBYTE(v74) = 2;
      sub_24EC1D7BC();
      uint64_t v28 = v56;
      uint64_t v30 = v68;
      uint64_t v29 = v69;
      sub_24EC22EC0();
      LOBYTE(v74) = 0;
      sub_24EC21C74(&qword_269948490, (void (*)(uint64_t))type metadata accessor for BrowseContent);
      uint64_t v31 = v61;
      uint64_t v32 = v71;
      sub_24EC22F40();
      if (v32)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v59 + 8))(v28, v31);
        sub_24EC20428(v27, (uint64_t (*)(void))type metadata accessor for BrowseContent);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v30, v29);
      }
      else
      {
        uint64_t v74 = v26;
        char v73 = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269948498);
        sub_24EC1E648(&qword_2699484A0, &qword_2699484A8);
        sub_24EC22F40();
        (*(void (**)(char *, uint64_t))(v59 + 8))(v28, v31);
        sub_24EC20428(v27, (uint64_t (*)(void))type metadata accessor for BrowseContent);
        (*(void (**)(char *, uint64_t))(v70 + 8))(v30, v29);
        uint64_t result = swift_bridgeObjectRelease();
      }
      break;
    case 2u:
      uint64_t v33 = v64;
      uint64_t v34 = v58;
      uint64_t v35 = v18;
      uint64_t v36 = v65;
      (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v58, v35, v65);
      LOBYTE(v74) = 4;
      sub_24EC1D714();
      uint64_t v37 = v62;
      uint64_t v39 = v68;
      uint64_t v38 = v69;
      sub_24EC22EC0();
      sub_24EC21C74(&qword_2699478C8, MEMORY[0x263F07490]);
      uint64_t v40 = v67;
      sub_24EC22F40();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v37, v40);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v36);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v39, v38);
      break;
    case 3u:
      LOBYTE(v74) = 1;
      sub_24EC1D810();
      int64_t v41 = v68;
      uint64_t v42 = v69;
      sub_24EC22EC0();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v12, v50);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v41, v42);
      break;
    case 4u:
      LOBYTE(v74) = 3;
      sub_24EC1D768();
      uint64_t v43 = v52;
      uint64_t v45 = v68;
      uint64_t v44 = v69;
      sub_24EC22EC0();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v43, v54);
      goto LABEL_10;
    case 5u:
      LOBYTE(v74) = 5;
      sub_24EC1D6C0();
      char v46 = v57;
      uint64_t v45 = v68;
      uint64_t v44 = v69;
      sub_24EC22EC0();
      (*(void (**)(char *, uint64_t))(v60 + 8))(v46, v63);
LABEL_10:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v45, v44);
      break;
    default:
      LOBYTE(v74) = 0;
      sub_24EC1D864();
      uint64_t v24 = v68;
      uint64_t v23 = v69;
      sub_24EC22EC0();
      sub_24EC22F00();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v15, v13);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v24, v23);
      break;
  }
  return result;
}

uint64_t type metadata accessor for BrowseAction()
{
  uint64_t result = qword_269948958;
  if (!qword_269948958) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_24EC1D608()
{
  unint64_t result = qword_2699488D8;
  if (!qword_2699488D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699488D8);
  }
  return result;
}

uint64_t sub_24EC1D65C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BrowseAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24EC1D6C0()
{
  unint64_t result = qword_2699488E0;
  if (!qword_2699488E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699488E0);
  }
  return result;
}

unint64_t sub_24EC1D714()
{
  unint64_t result = qword_2699488E8;
  if (!qword_2699488E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699488E8);
  }
  return result;
}

unint64_t sub_24EC1D768()
{
  unint64_t result = qword_2699488F0;
  if (!qword_2699488F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699488F0);
  }
  return result;
}

unint64_t sub_24EC1D7BC()
{
  unint64_t result = qword_2699488F8;
  if (!qword_2699488F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699488F8);
  }
  return result;
}

unint64_t sub_24EC1D810()
{
  unint64_t result = qword_269948900;
  if (!qword_269948900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948900);
  }
  return result;
}

unint64_t sub_24EC1D864()
{
  unint64_t result = qword_269948908;
  if (!qword_269948908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948908);
  }
  return result;
}

uint64_t BrowseAction.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v86 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269948910);
  uint64_t v78 = *(void *)(v3 - 8);
  uint64_t v79 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v84 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269948918);
  uint64_t v90 = *(void *)(v5 - 8);
  uint64_t v91 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v85 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269948920);
  uint64_t v76 = *(void *)(v7 - 8);
  uint64_t v77 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v83 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_269948928);
  uint64_t v80 = *(void *)(v89 - 8);
  MEMORY[0x270FA5388](v89);
  uint64_t v88 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_269948930);
  uint64_t v72 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  unint64_t v82 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_269948938);
  uint64_t v73 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388](v75);
  uint64_t v81 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_269948940);
  uint64_t v87 = *(void *)(v92 - 8);
  MEMORY[0x270FA5388](v92);
  uint64_t v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for BrowseAction();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v66 - v18;
  MEMORY[0x270FA5388](v20);
  unint64_t v22 = (uint64_t *)((char *)&v66 - v21);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v66 - v24;
  uint64_t v26 = a1[3];
  v93 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v26);
  sub_24EC1D608();
  uint64_t v27 = v94;
  sub_24EC23040();
  if (v27)
  {
LABEL_18:
    uint64_t v55 = (uint64_t)v93;
    return __swift_destroy_boxed_opaque_existential_1(v55);
  }
  uint64_t v67 = v22;
  uint64_t v68 = v16;
  uint64_t v69 = v19;
  uint64_t v28 = v88;
  uint64_t v29 = v90;
  uint64_t v71 = 0;
  uint64_t v30 = v91;
  uint64_t v31 = v89;
  uint64_t v94 = v14;
  uint64_t v70 = v25;
  uint64_t v32 = v92;
  uint64_t v33 = sub_24EC22EA0();
  uint64_t v34 = (char *)v33;
  uint64_t v35 = v32;
  if (*(void *)(v33 + 16) != 1)
  {
    uint64_t v40 = sub_24EC22D50();
    swift_allocError();
    uint64_t v42 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269946108);
    uint64_t *v42 = v94;
    uint64_t v43 = v35;
    sub_24EC22E10();
    sub_24EC22D40();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v40 - 8) + 104))(v42, *MEMORY[0x263F8DCB0], v40);
    swift_willThrow();
LABEL_7:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v87 + 8))(v13, v43);
    goto LABEL_18;
  }
  switch(*(unsigned char *)(v33 + 32))
  {
    case 1:
      char v96 = 1;
      sub_24EC1D810();
      uint64_t v44 = v82;
      uint64_t v37 = v32;
      uint64_t v45 = v71;
      sub_24EC22E00();
      if (v45) {
        goto LABEL_17;
      }
      (*(void (**)(char *, uint64_t))(v72 + 8))(v44, v74);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v87 + 8))(v13, v32);
      uint64_t v46 = (uint64_t)v70;
      goto LABEL_23;
    case 2:
      char v99 = 2;
      sub_24EC1D7BC();
      uint64_t v47 = v28;
      uint64_t v48 = v71;
      sub_24EC22E00();
      if (v48)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v87 + 8))(v13, v32);
        goto LABEL_18;
      }
      uint64_t v84 = v34;
      type metadata accessor for BrowseContent();
      char v98 = 0;
      sub_24EC21C74(&qword_2699484E8, (void (*)(uint64_t))type metadata accessor for BrowseContent);
      uint64_t v57 = (uint64_t)v69;
      sub_24EC22E90();
      __swift_instantiateConcreteTypeFromMangledName(&qword_269948688);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269948498);
      char v97 = 1;
      sub_24EC1E648(&qword_2699484F0, &qword_2699484F8);
      sub_24EC22E90();
      uint64_t v63 = v47;
      uint64_t v64 = v87;
      (*(void (**)(char *, uint64_t))(v80 + 8))(v63, v31);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v64 + 8))(v13, v92);
LABEL_24:
      swift_storeEnumTagMultiPayload();
      uint64_t v62 = v57;
      goto LABEL_25;
    case 3:
      char v100 = 3;
      sub_24EC1D768();
      uint64_t v49 = v83;
      uint64_t v37 = v32;
      uint64_t v50 = v71;
      sub_24EC22E00();
      if (v50) {
        goto LABEL_17;
      }
      (*(void (**)(char *, uint64_t))(v76 + 8))(v49, v77);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v87 + 8))(v13, v32);
      uint64_t v46 = (uint64_t)v70;
      goto LABEL_23;
    case 4:
      char v101 = 4;
      sub_24EC1D714();
      uint64_t v51 = v85;
      uint64_t v43 = v32;
      uint64_t v52 = v71;
      sub_24EC22E00();
      if (v52) {
        goto LABEL_7;
      }
      uint64_t v84 = v34;
      sub_24EC21D70();
      sub_24EC21C74(&qword_2699478D8, MEMORY[0x263F07490]);
      uint64_t v57 = (uint64_t)v68;
      sub_24EC22E90();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v51, v30);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v87 + 8))(v13, v92);
      goto LABEL_24;
    case 5:
      char v102 = 5;
      sub_24EC1D6C0();
      uint64_t v53 = v84;
      uint64_t v37 = v32;
      uint64_t v54 = v71;
      sub_24EC22E00();
      if (v54) {
        goto LABEL_17;
      }
      (*(void (**)(char *, uint64_t))(v78 + 8))(v53, v79);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v87 + 8))(v13, v32);
      uint64_t v46 = (uint64_t)v70;
LABEL_23:
      swift_storeEnumTagMultiPayload();
      goto LABEL_26;
    default:
      char v95 = 0;
      sub_24EC1D864();
      uint64_t v36 = v81;
      uint64_t v37 = v32;
      uint64_t v38 = v71;
      sub_24EC22E00();
      if (v38)
      {
LABEL_17:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v87 + 8))(v13, v37);
        goto LABEL_18;
      }
      uint64_t v39 = v75;
      uint64_t v58 = sub_24EC22E50();
      uint64_t v60 = v59;
      (*(void (**)(char *, uint64_t))(v73 + 8))(v36, v39);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v87 + 8))(v13, v32);
      uint64_t v61 = v67;
      *uint64_t v67 = v58;
      v61[1] = v60;
      swift_storeEnumTagMultiPayload();
      uint64_t v62 = (uint64_t)v61;
LABEL_25:
      uint64_t v46 = (uint64_t)v70;
      sub_24EC1E5E0(v62, (uint64_t)v70, (uint64_t (*)(void))type metadata accessor for BrowseAction);
LABEL_26:
      uint64_t v65 = (uint64_t)v93;
      sub_24EC1E5E0(v46, v86, (uint64_t (*)(void))type metadata accessor for BrowseAction);
      uint64_t v55 = v65;
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v55);
}

uint64_t sub_24EC1E5E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24EC1E648(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269948498);
    sub_24EC21C74(a2, MEMORY[0x263F07A30]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24EC1E6DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return BrowseAction.init(from:)(a1, a2);
}

uint64_t sub_24EC1E6F4(void *a1)
{
  return BrowseAction.encode(to:)(a1);
}

uint64_t BrowseAction.hash(into:)(long long *a1)
{
  uint64_t v3 = sub_24EC21D70();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for BrowseContent();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for BrowseAction();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EC1D65C(v1, (uint64_t)v12);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v14 = *(void *)&v12[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269948688) + 48)];
      sub_24EC1E5E0((uint64_t)v12, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BrowseContent);
      sub_24EC23000();
      BrowseContent.hash(into:)((uint64_t)a1);
      sub_24EB7FA1C(a1, v14);
      sub_24EC20428((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BrowseContent);
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 2u:
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v12, v3);
      sub_24EC23000();
      sub_24EC21C74(&qword_269948948, MEMORY[0x263F07490]);
      sub_24EC22A20();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      break;
    case 3u:
    case 4u:
    case 5u:
      uint64_t result = sub_24EC23000();
      break;
    default:
      sub_24EC23000();
      sub_24EC22AB0();
      uint64_t result = swift_bridgeObjectRelease();
      break;
  }
  return result;
}

uint64_t BrowseAction.hashValue.getter()
{
  sub_24EC22FF0();
  BrowseAction.hash(into:)(v1);
  return sub_24EC23030();
}

uint64_t sub_24EC1EA34()
{
  sub_24EC22FF0();
  BrowseAction.hash(into:)(v1);
  return sub_24EC23030();
}

uint64_t sub_24EC1EA78()
{
  sub_24EC22FF0();
  BrowseAction.hash(into:)(v1);
  return sub_24EC23030();
}

uint64_t _s15FitnessBrowsing12BrowseActionO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EC21D70();
  uint64_t v37 = *(void *)(v4 - 8);
  uint64_t v38 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for BrowseContent();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for BrowseAction();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v37 - v14;
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (uint64_t *)((char *)&v37 - v17);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699489F8);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = &v21[*(int *)(v22 + 56)];
  sub_24EC1D65C(a1, (uint64_t)v21);
  sub_24EC1D65C(a2, (uint64_t)v23);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_24EC1D65C((uint64_t)v21, (uint64_t)v15);
      uint64_t v26 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269948688) + 48);
      uint64_t v27 = *(void *)&v15[v26];
      if (swift_getEnumCaseMultiPayload() != 1)
      {
        swift_bridgeObjectRelease();
        sub_24EC20428((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for BrowseContent);
        goto LABEL_18;
      }
      uint64_t v28 = *(void *)&v23[v26];
      sub_24EC1E5E0((uint64_t)v23, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BrowseContent);
      char v29 = static BrowseContent.== infix(_:_:)((uint64_t)v15, (uint64_t)v9);
      sub_24EC20428((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for BrowseContent);
      if (v29)
      {
        char v30 = sub_24EC1C080(v27, v28);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24EC20428((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BrowseContent);
        goto LABEL_9;
      }
      sub_24EC20428((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for BrowseContent);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_27;
    case 2u:
      sub_24EC1D65C((uint64_t)v21, (uint64_t)v12);
      if (swift_getEnumCaseMultiPayload() != 2)
      {
        (*(void (**)(char *, uint64_t))(v37 + 8))(v12, v38);
        goto LABEL_18;
      }
      uint64_t v32 = v37;
      uint64_t v31 = v38;
      (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v6, v23, v38);
      char v30 = sub_24EC21D50();
      uint64_t v33 = *(void (**)(char *, uint64_t))(v32 + 8);
      v33(v6, v31);
      v33(v12, v31);
LABEL_9:
      sub_24EC20428((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for BrowseAction);
      return v30 & 1;
    case 3u:
      if (swift_getEnumCaseMultiPayload() == 3) {
        goto LABEL_29;
      }
      goto LABEL_18;
    case 4u:
      if (swift_getEnumCaseMultiPayload() == 4) {
        goto LABEL_29;
      }
      goto LABEL_18;
    case 5u:
      if (swift_getEnumCaseMultiPayload() == 5) {
        goto LABEL_29;
      }
      goto LABEL_18;
    default:
      sub_24EC1D65C((uint64_t)v21, (uint64_t)v18);
      uint64_t v25 = *v18;
      uint64_t v24 = v18[1];
      if (swift_getEnumCaseMultiPayload())
      {
        swift_bridgeObjectRelease();
LABEL_18:
        sub_24EC21C14((uint64_t)v21);
        goto LABEL_19;
      }
      if (v25 == *(void *)v23 && v24 == *((void *)v23 + 1))
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v35 = sub_24EC22F70();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v35 & 1) == 0)
        {
LABEL_27:
          sub_24EC20428((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for BrowseAction);
LABEL_19:
          char v30 = 0;
          return v30 & 1;
        }
      }
LABEL_29:
      sub_24EC20428((uint64_t)v21, (uint64_t (*)(void))type metadata accessor for BrowseAction);
      char v30 = 1;
      return v30 & 1;
  }
}

uint64_t sub_24EC1EFD4()
{
  return sub_24EC21C74(&qword_269948950, (void (*)(uint64_t))type metadata accessor for BrowseAction);
}

void *initializeBufferWithCopyOfBuffer for BrowseAction(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (void *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v11 = sub_24EC21D70();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      type metadata accessor for BrowseContent();
      int v12 = swift_getEnumCaseMultiPayload();
      if (v12 == 2)
      {
        *a1 = *a2;
        swift_bridgeObjectRetain();
      }
      else if (v12 == 1)
      {
        *(unsigned char *)a1 = *(unsigned char *)a2;
        uint64_t v13 = a2[2];
        a1[1] = a2[1];
        a1[2] = v13;
        a1[3] = a2[3];
        *((unsigned char *)a1 + 32) = *((unsigned char *)a2 + 32);
        uint64_t v14 = *(int *)(type metadata accessor for BrowseGalleryDescriptor() + 32);
        uint64_t v15 = (char *)a1 + v14;
        uint64_t v16 = (char *)a2 + v14;
        uint64_t v17 = sub_24EC21D10();
        uint64_t v18 = *(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v18(v15, v16, v17);
      }
      else
      {
        uint64_t v19 = type metadata accessor for BrowseArtwork();
        uint64_t v20 = *(void *)(v19 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v20 + 48))(a2, 1, v19))
        {
          uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946778);
          memcpy(a1, a2, *(void *)(*(void *)(v21 - 8) + 64));
        }
        else
        {
          uint64_t v22 = sub_24EC21E00();
          uint64_t v23 = *(void *)(v22 - 8);
          if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v23 + 48))(a2, 1, v22))
          {
            uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946768);
            memcpy(a1, a2, *(void *)(*(void *)(v24 - 8) + 64));
          }
          else
          {
            (*(void (**)(void *, void *, uint64_t))(v23 + 16))(a1, a2, v22);
            (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(a1, 0, 1, v22);
          }
          uint64_t v25 = *(int *)(v19 + 20);
          uint64_t v26 = (char *)a1 + v25;
          uint64_t v27 = (char *)a2 + v25;
          uint64_t v28 = sub_24EC21D30();
          uint64_t v29 = *(void *)(v28 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
          {
            uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946770);
            memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
          }
          (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(a1, 0, 1, v19);
        }
        uint64_t v44 = type metadata accessor for EditorialCollectionDetail();
        uint64_t v31 = *(int *)(v44 + 20);
        uint64_t v32 = (void *)((char *)a1 + v31);
        uint64_t v33 = (char *)a2 + v31;
        uint64_t v34 = *(void *)((char *)a2 + v31 + 8);
        *uint64_t v32 = *(void *)((char *)a2 + v31);
        v32[1] = v34;
        uint64_t v35 = *(void *)((char *)a2 + v31 + 24);
        v32[2] = *(void *)((char *)a2 + v31 + 16);
        v32[3] = v35;
        uint64_t v36 = *(void *)((char *)a2 + v31 + 40);
        v32[4] = *(void *)((char *)a2 + v31 + 32);
        v32[5] = v36;
        uint64_t v37 = *(void *)((char *)a2 + v31 + 56);
        v32[6] = *(void *)((char *)a2 + v31 + 48);
        v32[7] = v37;
        uint64_t v38 = *(int *)(type metadata accessor for EditorialCollection() + 32);
        uint64_t v42 = &v33[v38];
        uint64_t v43 = (char *)v32 + v38;
        uint64_t v39 = sub_24EC21D30();
        uint64_t v40 = *(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v40(v43, v42, v39);
        *(void *)((char *)a1 + *(int *)(v44 + 24)) = *(void *)((char *)a2 + *(int *)(v44 + 24));
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_269948688);
      *(void *)((char *)a1 + *(int *)(v41 + 48)) = *(void *)((char *)a2 + *(int *)(v41 + 48));
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for BrowseAction(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result != 2)
  {
    if (result != 1)
    {
      if (result) {
        return result;
      }
      goto LABEL_21;
    }
    type metadata accessor for BrowseContent();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 2)
    {
      if (EnumCaseMultiPayload == 1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v15 = a1 + *(int *)(type metadata accessor for BrowseGalleryDescriptor() + 32);
        uint64_t v16 = sub_24EC21D10();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
        goto LABEL_20;
      }
      if (EnumCaseMultiPayload)
      {
LABEL_20:
        __swift_instantiateConcreteTypeFromMangledName(&qword_269948688);
LABEL_21:
        return swift_bridgeObjectRelease();
      }
      uint64_t v6 = type metadata accessor for BrowseArtwork();
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(a1, 1, v6))
      {
        uint64_t v7 = sub_24EC21E00();
        uint64_t v8 = *(void *)(v7 - 8);
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(a1, 1, v7)) {
          (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
        }
        uint64_t v9 = a1 + *(int *)(v6 + 20);
        uint64_t v10 = sub_24EC21D30();
        uint64_t v11 = *(void *)(v10 - 8);
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
          (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
        }
      }
      uint64_t v12 = a1 + *(int *)(type metadata accessor for EditorialCollectionDetail() + 20);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v13 = v12 + *(int *)(type metadata accessor for EditorialCollection() + 32);
      uint64_t v14 = sub_24EC21D30();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
    }
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  uint64_t v3 = sub_24EC21D70();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  return v4(a1, v3);
}

void *initializeWithCopy for BrowseAction(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      uint64_t v8 = sub_24EC21D70();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      goto LABEL_22;
    case 1:
      type metadata accessor for BrowseContent();
      int v9 = swift_getEnumCaseMultiPayload();
      if (v9 == 2)
      {
        *a1 = *a2;
        swift_bridgeObjectRetain();
      }
      else if (v9 == 1)
      {
        *(unsigned char *)a1 = *(unsigned char *)a2;
        uint64_t v10 = a2[2];
        a1[1] = a2[1];
        a1[2] = v10;
        a1[3] = a2[3];
        *((unsigned char *)a1 + 32) = *((unsigned char *)a2 + 32);
        uint64_t v11 = *(int *)(type metadata accessor for BrowseGalleryDescriptor() + 32);
        uint64_t v12 = (char *)a1 + v11;
        uint64_t v13 = (char *)a2 + v11;
        uint64_t v14 = sub_24EC21D10();
        uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v15(v12, v13, v14);
      }
      else
      {
        uint64_t v16 = type metadata accessor for BrowseArtwork();
        uint64_t v17 = *(void *)(v16 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v17 + 48))(a2, 1, v16))
        {
          uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946778);
          memcpy(a1, a2, *(void *)(*(void *)(v18 - 8) + 64));
        }
        else
        {
          uint64_t v19 = sub_24EC21E00();
          uint64_t v20 = *(void *)(v19 - 8);
          if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v20 + 48))(a2, 1, v19))
          {
            uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946768);
            memcpy(a1, a2, *(void *)(*(void *)(v21 - 8) + 64));
          }
          else
          {
            (*(void (**)(void *, void *, uint64_t))(v20 + 16))(a1, a2, v19);
            (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(a1, 0, 1, v19);
          }
          uint64_t v22 = *(int *)(v16 + 20);
          uint64_t v23 = (char *)a1 + v22;
          uint64_t v24 = (char *)a2 + v22;
          uint64_t v25 = sub_24EC21D30();
          uint64_t v26 = *(void *)(v25 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
          {
            uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946770);
            memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
          }
          (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(a1, 0, 1, v16);
        }
        uint64_t v42 = type metadata accessor for EditorialCollectionDetail();
        uint64_t v28 = *(int *)(v42 + 20);
        uint64_t v29 = (void *)((char *)a1 + v28);
        uint64_t v30 = (char *)a2 + v28;
        uint64_t v31 = *(void *)((char *)a2 + v28 + 8);
        *uint64_t v29 = *(void *)((char *)a2 + v28);
        v29[1] = v31;
        uint64_t v32 = *(void *)((char *)a2 + v28 + 24);
        void v29[2] = *(void *)((char *)a2 + v28 + 16);
        v29[3] = v32;
        uint64_t v33 = *(void *)((char *)a2 + v28 + 40);
        v29[4] = *(void *)((char *)a2 + v28 + 32);
        v29[5] = v33;
        uint64_t v34 = *(void *)((char *)a2 + v28 + 56);
        v29[6] = *(void *)((char *)a2 + v28 + 48);
        v29[7] = v34;
        uint64_t v35 = *(int *)(type metadata accessor for EditorialCollection() + 32);
        uint64_t v40 = &v30[v35];
        uint64_t v41 = (char *)v29 + v35;
        uint64_t v36 = sub_24EC21D30();
        uint64_t v37 = *(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v37(v41, v40, v36);
        *(void *)((char *)a1 + *(int *)(v42 + 24)) = *(void *)((char *)a2 + *(int *)(v42 + 24));
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269948688);
      *(void *)((char *)a1 + *(int *)(v38 + 48)) = *(void *)((char *)a2 + *(int *)(v38 + 48));
      swift_bridgeObjectRetain();
      goto LABEL_22;
    case 0:
      uint64_t v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      swift_bridgeObjectRetain();
LABEL_22:
      swift_storeEnumTagMultiPayload();
      return a1;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

void *assignWithCopy for BrowseAction(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24EC20428((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for BrowseAction);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 2:
        uint64_t v7 = sub_24EC21D70();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        goto LABEL_23;
      case 1:
        type metadata accessor for BrowseContent();
        int v8 = swift_getEnumCaseMultiPayload();
        if (v8 == 2)
        {
          *a1 = *a2;
          swift_bridgeObjectRetain();
        }
        else if (v8 == 1)
        {
          *(unsigned char *)a1 = *(unsigned char *)a2;
          a1[1] = a2[1];
          a1[2] = a2[2];
          a1[3] = a2[3];
          *((unsigned char *)a1 + 32) = *((unsigned char *)a2 + 32);
          uint64_t v9 = *(int *)(type metadata accessor for BrowseGalleryDescriptor() + 32);
          uint64_t v10 = (char *)a1 + v9;
          uint64_t v11 = (char *)a2 + v9;
          uint64_t v12 = sub_24EC21D10();
          uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v13(v10, v11, v12);
        }
        else
        {
          uint64_t v14 = type metadata accessor for BrowseArtwork();
          uint64_t v15 = *(void *)(v14 - 8);
          if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48))(a2, 1, v14))
          {
            uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946778);
            memcpy(a1, a2, *(void *)(*(void *)(v16 - 8) + 64));
          }
          else
          {
            uint64_t v17 = sub_24EC21E00();
            uint64_t v18 = *(void *)(v17 - 8);
            if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v18 + 48))(a2, 1, v17))
            {
              uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946768);
              memcpy(a1, a2, *(void *)(*(void *)(v19 - 8) + 64));
            }
            else
            {
              (*(void (**)(void *, void *, uint64_t))(v18 + 16))(a1, a2, v17);
              (*(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56))(a1, 0, 1, v17);
            }
            uint64_t v20 = *(int *)(v14 + 20);
            uint64_t v21 = (char *)a1 + v20;
            uint64_t v22 = (char *)a2 + v20;
            uint64_t v23 = sub_24EC21D30();
            uint64_t v24 = *(void *)(v23 - 8);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
            {
              uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946770);
              memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
            }
            else
            {
              (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
              (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
            }
            (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(a1, 0, 1, v14);
          }
          uint64_t v36 = type metadata accessor for EditorialCollectionDetail();
          uint64_t v26 = *(int *)(v36 + 20);
          uint64_t v27 = (void *)((char *)a1 + v26);
          uint64_t v28 = (char *)a2 + v26;
          *uint64_t v27 = *(void *)((char *)a2 + v26);
          v27[1] = *(void *)((char *)a2 + v26 + 8);
          v27[2] = *(void *)((char *)a2 + v26 + 16);
          v27[3] = *(void *)((char *)a2 + v26 + 24);
          v27[4] = *(void *)((char *)a2 + v26 + 32);
          v27[5] = *(void *)((char *)a2 + v26 + 40);
          v27[6] = *(void *)((char *)a2 + v26 + 48);
          v27[7] = *(void *)((char *)a2 + v26 + 56);
          uint64_t v29 = *(int *)(type metadata accessor for EditorialCollection() + 32);
          uint64_t v34 = &v28[v29];
          uint64_t v35 = (char *)v27 + v29;
          uint64_t v30 = sub_24EC21D30();
          uint64_t v31 = *(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v31(v35, v34, v30);
          *(void *)((char *)a1 + *(int *)(v36 + 24)) = *(void *)((char *)a2 + *(int *)(v36 + 24));
          swift_bridgeObjectRetain();
        }
        swift_storeEnumTagMultiPayload();
        uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269948688);
        *(void *)((char *)a1 + *(int *)(v32 + 48)) = *(void *)((char *)a2 + *(int *)(v32 + 48));
        swift_bridgeObjectRetain();
        goto LABEL_23;
      case 0:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
LABEL_23:
        swift_storeEnumTagMultiPayload();
        return a1;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_24EC20428(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *initializeWithTake for BrowseAction(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v12 = sub_24EC21D70();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(a1, a2, v12);
LABEL_21:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = type metadata accessor for BrowseContent();
    int v8 = swift_getEnumCaseMultiPayload();
    if (v8 == 1)
    {
      *a1 = *a2;
      *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
      *((void *)a1 + 3) = *((void *)a2 + 3);
      a1[32] = a2[32];
      uint64_t v13 = *(int *)(type metadata accessor for BrowseGalleryDescriptor() + 32);
      uint64_t v14 = &a1[v13];
      uint64_t v15 = &a2[v13];
      uint64_t v16 = sub_24EC21D10();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
    }
    else
    {
      if (v8)
      {
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
LABEL_20:
        uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269948688);
        *(void *)&a1[*(int *)(v36 + 48)] = *(void *)&a2[*(int *)(v36 + 48)];
        goto LABEL_21;
      }
      uint64_t v9 = type metadata accessor for BrowseArtwork();
      uint64_t v10 = *(void *)(v9 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(a2, 1, v9))
      {
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946778);
        memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        uint64_t v17 = sub_24EC21E00();
        uint64_t v18 = *(void *)(v17 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(a2, 1, v17))
        {
          uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946768);
          memcpy(a1, a2, *(void *)(*(void *)(v19 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v18 + 32))(a1, a2, v17);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(a1, 0, 1, v17);
        }
        uint64_t v20 = *(int *)(v9 + 20);
        uint64_t v21 = &a1[v20];
        uint64_t v22 = &a2[v20];
        uint64_t v23 = sub_24EC21D30();
        uint64_t v24 = *(void *)(v23 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
        {
          uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946770);
          memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
        }
        (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
      }
      uint64_t v26 = type metadata accessor for EditorialCollectionDetail();
      uint64_t v27 = *(int *)(v26 + 20);
      uint64_t v28 = &a1[v27];
      uint64_t v29 = &a2[v27];
      long long v30 = *(_OWORD *)&a2[v27 + 16];
      *(_OWORD *)uint64_t v28 = *(_OWORD *)&a2[v27];
      *((_OWORD *)v28 + 1) = v30;
      long long v31 = *(_OWORD *)&a2[v27 + 48];
      *((_OWORD *)v28 + 2) = *(_OWORD *)&a2[v27 + 32];
      *((_OWORD *)v28 + 3) = v31;
      uint64_t v32 = *(int *)(type metadata accessor for EditorialCollection() + 32);
      uint64_t v33 = &v28[v32];
      uint64_t v34 = &v29[v32];
      uint64_t v35 = sub_24EC21D30();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 32))(v33, v34, v35);
      *(void *)&a1[*(int *)(v26 + 24)] = *(void *)&a2[*(int *)(v26 + 24)];
    }
    swift_storeEnumTagMultiPayload();
    goto LABEL_20;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

char *assignWithTake for BrowseAction(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24EC20428((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for BrowseAction);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v12 = sub_24EC21D70();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(a1, a2, v12);
LABEL_22:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v7 = type metadata accessor for BrowseContent();
      int v8 = swift_getEnumCaseMultiPayload();
      if (v8 == 1)
      {
        *a1 = *a2;
        *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
        *((void *)a1 + 3) = *((void *)a2 + 3);
        a1[32] = a2[32];
        uint64_t v13 = *(int *)(type metadata accessor for BrowseGalleryDescriptor() + 32);
        uint64_t v14 = &a1[v13];
        uint64_t v15 = &a2[v13];
        uint64_t v16 = sub_24EC21D10();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
      }
      else
      {
        if (v8)
        {
          memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
LABEL_21:
          uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269948688);
          *(void *)&a1[*(int *)(v36 + 48)] = *(void *)&a2[*(int *)(v36 + 48)];
          goto LABEL_22;
        }
        uint64_t v9 = type metadata accessor for BrowseArtwork();
        uint64_t v10 = *(void *)(v9 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(a2, 1, v9))
        {
          uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946778);
          memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
        }
        else
        {
          uint64_t v17 = sub_24EC21E00();
          uint64_t v18 = *(void *)(v17 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(a2, 1, v17))
          {
            uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946768);
            memcpy(a1, a2, *(void *)(*(void *)(v19 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v18 + 32))(a1, a2, v17);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(a1, 0, 1, v17);
          }
          uint64_t v20 = *(int *)(v9 + 20);
          uint64_t v21 = &a1[v20];
          uint64_t v22 = &a2[v20];
          uint64_t v23 = sub_24EC21D30();
          uint64_t v24 = *(void *)(v23 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
          {
            uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269946770);
            memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
            (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
          }
          (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
        }
        uint64_t v26 = type metadata accessor for EditorialCollectionDetail();
        uint64_t v27 = *(int *)(v26 + 20);
        uint64_t v28 = &a1[v27];
        uint64_t v29 = &a2[v27];
        long long v30 = *(_OWORD *)&a2[v27 + 16];
        *(_OWORD *)uint64_t v28 = *(_OWORD *)&a2[v27];
        *((_OWORD *)v28 + 1) = v30;
        long long v31 = *(_OWORD *)&a2[v27 + 48];
        *((_OWORD *)v28 + 2) = *(_OWORD *)&a2[v27 + 32];
        *((_OWORD *)v28 + 3) = v31;
        uint64_t v32 = *(int *)(type metadata accessor for EditorialCollection() + 32);
        uint64_t v33 = &v28[v32];
        uint64_t v34 = &v29[v32];
        uint64_t v35 = sub_24EC21D30();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 32))(v33, v34, v35);
        *(void *)&a1[*(int *)(v26 + 24)] = *(void *)&a2[*(int *)(v26 + 24)];
      }
      swift_storeEnumTagMultiPayload();
      goto LABEL_21;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_24EC20E7C()
{
  uint64_t v4 = &unk_24EC30080;
  uint64_t result = type metadata accessor for BrowseContent();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    int v5 = &v3;
    uint64_t result = sub_24EC21D70();
    if (v2 <= 0x3F)
    {
      uint64_t v6 = *(void *)(result - 8) + 64;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for BrowseAction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x24EC21030);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BrowseAction.CodingKeys()
{
  return &type metadata for BrowseAction.CodingKeys;
}

ValueMetadata *type metadata accessor for BrowseAction.FailedToLoadCodingKeys()
{
  return &type metadata for BrowseAction.FailedToLoadCodingKeys;
}

ValueMetadata *type metadata accessor for BrowseAction.FetchSectionDescriptorsCodingKeys()
{
  return &type metadata for BrowseAction.FetchSectionDescriptorsCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for BrowseAction.LoadedCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EC21158);
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

ValueMetadata *type metadata accessor for BrowseAction.LoadedCodingKeys()
{
  return &type metadata for BrowseAction.LoadedCodingKeys;
}

ValueMetadata *type metadata accessor for BrowseAction.SubscriptionChangedCodingKeys()
{
  return &type metadata for BrowseAction.SubscriptionChangedCodingKeys;
}

unsigned char *_s15FitnessBrowsing12BrowseActionO22FailedToLoadCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24EC2123CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for BrowseAction.UpdateLastBackgroundTimeStampCodingKeys()
{
  return &type metadata for BrowseAction.UpdateLastBackgroundTimeStampCodingKeys;
}

ValueMetadata *type metadata accessor for BrowseAction.ViewDidAppearCodingKeys()
{
  return &type metadata for BrowseAction.ViewDidAppearCodingKeys;
}

unint64_t sub_24EC21288()
{
  unint64_t result = qword_269948968;
  if (!qword_269948968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948968);
  }
  return result;
}

unint64_t sub_24EC212E0()
{
  unint64_t result = qword_269948970;
  if (!qword_269948970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948970);
  }
  return result;
}

unint64_t sub_24EC21338()
{
  unint64_t result = qword_269948978;
  if (!qword_269948978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948978);
  }
  return result;
}

unint64_t sub_24EC21390()
{
  unint64_t result = qword_269948980;
  if (!qword_269948980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948980);
  }
  return result;
}

unint64_t sub_24EC213E8()
{
  unint64_t result = qword_269948988;
  if (!qword_269948988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948988);
  }
  return result;
}

unint64_t sub_24EC21440()
{
  unint64_t result = qword_269948990;
  if (!qword_269948990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948990);
  }
  return result;
}

unint64_t sub_24EC21498()
{
  unint64_t result = qword_269948998;
  if (!qword_269948998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269948998);
  }
  return result;
}

unint64_t sub_24EC214F0()
{
  unint64_t result = qword_2699489A0;
  if (!qword_2699489A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699489A0);
  }
  return result;
}

unint64_t sub_24EC21548()
{
  unint64_t result = qword_2699489A8;
  if (!qword_2699489A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699489A8);
  }
  return result;
}

unint64_t sub_24EC215A0()
{
  unint64_t result = qword_2699489B0;
  if (!qword_2699489B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699489B0);
  }
  return result;
}

unint64_t sub_24EC215F8()
{
  unint64_t result = qword_2699489B8;
  if (!qword_2699489B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699489B8);
  }
  return result;
}

unint64_t sub_24EC21650()
{
  unint64_t result = qword_2699489C0;
  if (!qword_2699489C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699489C0);
  }
  return result;
}

unint64_t sub_24EC216A8()
{
  unint64_t result = qword_2699489C8;
  if (!qword_2699489C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699489C8);
  }
  return result;
}

unint64_t sub_24EC21700()
{
  unint64_t result = qword_2699489D0;
  if (!qword_2699489D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699489D0);
  }
  return result;
}

unint64_t sub_24EC21758()
{
  unint64_t result = qword_2699489D8;
  if (!qword_2699489D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699489D8);
  }
  return result;
}

unint64_t sub_24EC217B0()
{
  unint64_t result = qword_2699489E0;
  if (!qword_2699489E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699489E0);
  }
  return result;
}

unint64_t sub_24EC21808()
{
  unint64_t result = qword_2699489E8;
  if (!qword_2699489E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699489E8);
  }
  return result;
}

unint64_t sub_24EC21860()
{
  unint64_t result = qword_2699489F0;
  if (!qword_2699489F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699489F0);
  }
  return result;
}

uint64_t sub_24EC218B4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6F5464656C696166 && a2 == 0xEC00000064616F4CLL;
  if (v3 || (sub_24EC22F70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000024EC31530 || (sub_24EC22F70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x646564616F6CLL && a2 == 0xE600000000000000 || (sub_24EC22F70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024EC31550 || (sub_24EC22F70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x800000024EC31570 || (sub_24EC22F70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x4164694477656976 && a2 == 0xED00007261657070)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_24EC22F70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_24EC21B2C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x746E65746E6F63 && a2 == 0xE700000000000000;
  if (v3 || (sub_24EC22F70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024EC312E0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EC22F70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24EC21C14(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699489F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24EC21C74(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_24EC21CE0()
{
  return MEMORY[0x270EEEB40]();
}

uint64_t sub_24EC21CF0()
{
  return MEMORY[0x270F2AD60]();
}

uint64_t sub_24EC21D00()
{
  return MEMORY[0x270EEEC38]();
}

uint64_t sub_24EC21D10()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_24EC21D20()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_24EC21D30()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24EC21D40()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_24EC21D50()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_24EC21D60()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24EC21D70()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24EC21D80()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24EC21D90()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24EC21DA0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24EC21DB0()
{
  return MEMORY[0x270EF0F30]();
}

uint64_t sub_24EC21DC0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24EC21DD0()
{
  return MEMORY[0x270F816E8]();
}

uint64_t sub_24EC21DE0()
{
  return MEMORY[0x270F81700]();
}

uint64_t sub_24EC21DF0()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_24EC21E00()
{
  return MEMORY[0x270F2B2F8]();
}

uint64_t sub_24EC21E10()
{
  return MEMORY[0x270F2B340]();
}

uint64_t sub_24EC21E20()
{
  return MEMORY[0x270F2B348]();
}

uint64_t sub_24EC21E30()
{
  return MEMORY[0x270F2B350]();
}

uint64_t sub_24EC21E40()
{
  return MEMORY[0x270F2B370]();
}

uint64_t sub_24EC21E50()
{
  return MEMORY[0x270F2B378]();
}

uint64_t sub_24EC21E60()
{
  return MEMORY[0x270F2B390]();
}

uint64_t sub_24EC21E70()
{
  return MEMORY[0x270F2B3A0]();
}

uint64_t sub_24EC21E80()
{
  return MEMORY[0x270F2AD68]();
}

uint64_t sub_24EC21E90()
{
  return MEMORY[0x270F2AD70]();
}

uint64_t sub_24EC21EA0()
{
  return MEMORY[0x270F2AD78]();
}

uint64_t sub_24EC21EB0()
{
  return MEMORY[0x270F2AD88]();
}

uint64_t sub_24EC21EC0()
{
  return MEMORY[0x270F2ADD0]();
}

uint64_t sub_24EC21ED0()
{
  return MEMORY[0x270F2ADD8]();
}

uint64_t sub_24EC21EE0()
{
  return MEMORY[0x270F2ADE0]();
}

uint64_t sub_24EC21EF0()
{
  return MEMORY[0x270F2ADE8]();
}

uint64_t sub_24EC21F00()
{
  return MEMORY[0x270F2ADF0]();
}

uint64_t sub_24EC21F10()
{
  return MEMORY[0x270F2ADF8]();
}

uint64_t sub_24EC21F20()
{
  return MEMORY[0x270F2AE00]();
}

uint64_t sub_24EC21F30()
{
  return MEMORY[0x270F2AE08]();
}

uint64_t sub_24EC21F40()
{
  return MEMORY[0x270F2AE30]();
}

uint64_t sub_24EC21F50()
{
  return MEMORY[0x270F2AE48]();
}

uint64_t sub_24EC21F60()
{
  return MEMORY[0x270F2AE50]();
}

uint64_t sub_24EC21F70()
{
  return MEMORY[0x270F2AE58]();
}

uint64_t sub_24EC21F80()
{
  return MEMORY[0x270F2AE60]();
}

uint64_t sub_24EC21F90()
{
  return MEMORY[0x270F2AE68]();
}

uint64_t sub_24EC21FA0()
{
  return MEMORY[0x270F2AE88]();
}

uint64_t sub_24EC21FB0()
{
  return MEMORY[0x270F2AE90]();
}

uint64_t sub_24EC21FC0()
{
  return MEMORY[0x270F2AE98]();
}

uint64_t sub_24EC21FD0()
{
  return MEMORY[0x270F2AEE0]();
}

uint64_t sub_24EC21FE0()
{
  return MEMORY[0x270F2AEE8]();
}

uint64_t sub_24EC21FF0()
{
  return MEMORY[0x270F2AEF0]();
}

uint64_t sub_24EC22000()
{
  return MEMORY[0x270F2AEF8]();
}

uint64_t sub_24EC22010()
{
  return MEMORY[0x270F2AF00]();
}

uint64_t sub_24EC22020()
{
  return MEMORY[0x270F2AF28]();
}

uint64_t sub_24EC22030()
{
  return MEMORY[0x270F2AF30]();
}

uint64_t sub_24EC22040()
{
  return MEMORY[0x270F2AF38]();
}

uint64_t sub_24EC22050()
{
  return MEMORY[0x270F2AF40]();
}

uint64_t sub_24EC22060()
{
  return MEMORY[0x270F2AF48]();
}

uint64_t sub_24EC22070()
{
  return MEMORY[0x270F2AF50]();
}

uint64_t sub_24EC22080()
{
  return MEMORY[0x270F2AF58]();
}

uint64_t sub_24EC22090()
{
  return MEMORY[0x270F2AF80]();
}

uint64_t sub_24EC220A0()
{
  return MEMORY[0x270F2AF88]();
}

uint64_t sub_24EC220B0()
{
  return MEMORY[0x270F2AFF8]();
}

uint64_t sub_24EC220C0()
{
  return MEMORY[0x270F2B010]();
}

uint64_t sub_24EC220D0()
{
  return MEMORY[0x270F2B018]();
}

uint64_t sub_24EC220E0()
{
  return MEMORY[0x270F2B050]();
}

uint64_t sub_24EC220F0()
{
  return MEMORY[0x270F2B058]();
}

uint64_t sub_24EC22100()
{
  return MEMORY[0x270F2B060]();
}

uint64_t sub_24EC22110()
{
  return MEMORY[0x270F2B070]();
}

uint64_t sub_24EC22120()
{
  return MEMORY[0x270F2B078]();
}

uint64_t sub_24EC22130()
{
  return MEMORY[0x270F2B088]();
}

uint64_t sub_24EC22140()
{
  return MEMORY[0x270F2B090]();
}

uint64_t sub_24EC22150()
{
  return MEMORY[0x270F2B098]();
}

uint64_t sub_24EC22160()
{
  return MEMORY[0x270F2B0A0]();
}

uint64_t sub_24EC22170()
{
  return MEMORY[0x270F2B0B0]();
}

uint64_t sub_24EC22180()
{
  return MEMORY[0x270F2B0D8]();
}

uint64_t sub_24EC22190()
{
  return MEMORY[0x270F2B100]();
}

uint64_t sub_24EC221A0()
{
  return MEMORY[0x270F2B110]();
}

uint64_t sub_24EC221B0()
{
  return MEMORY[0x270F2B128]();
}

uint64_t sub_24EC221C0()
{
  return MEMORY[0x270F2B150]();
}

uint64_t sub_24EC221D0()
{
  return MEMORY[0x270F2B170]();
}

uint64_t sub_24EC221E0()
{
  return MEMORY[0x270F2B180]();
}

uint64_t sub_24EC221F0()
{
  return MEMORY[0x270F2B188]();
}

uint64_t sub_24EC22200()
{
  return MEMORY[0x270F2B190]();
}

uint64_t sub_24EC22210()
{
  return MEMORY[0x270F2B198]();
}

uint64_t sub_24EC22220()
{
  return MEMORY[0x270F2B1A8]();
}

uint64_t sub_24EC22230()
{
  return MEMORY[0x270F2B1C0]();
}

uint64_t sub_24EC22240()
{
  return MEMORY[0x270F2B1E8]();
}

uint64_t sub_24EC22250()
{
  return MEMORY[0x270F2B218]();
}

uint64_t sub_24EC22260()
{
  return MEMORY[0x270F2B220]();
}

uint64_t sub_24EC22270()
{
  return MEMORY[0x270F2CD28]();
}

uint64_t sub_24EC22280()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_24EC22290()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24EC222A0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24EC222B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24EC222C0()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_24EC222D0()
{
  return MEMORY[0x270EFF100]();
}

uint64_t sub_24EC222E0()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_24EC222F0()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_24EC22300()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_24EC22310()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_24EC22320()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_24EC22330()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_24EC22340()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_24EC22350()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_24EC22360()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_24EC22370()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_24EC22380()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_24EC22390()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_24EC223A0()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_24EC223B0()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_24EC223C0()
{
  return MEMORY[0x270F009D0]();
}

uint64_t sub_24EC223D0()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_24EC223E0()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_24EC223F0()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_24EC22400()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_24EC22410()
{
  return MEMORY[0x270F01218]();
}

uint64_t sub_24EC22420()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_24EC22430()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_24EC22440()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_24EC22450()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_24EC22460()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_24EC22470()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_24EC22480()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_24EC22490()
{
  return MEMORY[0x270F01430]();
}

uint64_t sub_24EC224A0()
{
  return MEMORY[0x270F01440]();
}

uint64_t sub_24EC224B0()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_24EC224C0()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_24EC224D0()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_24EC224E0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24EC224F0()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_24EC22500()
{
  return MEMORY[0x270F01CB0]();
}

uint64_t sub_24EC22510()
{
  return MEMORY[0x270F02080]();
}

uint64_t sub_24EC22520()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_24EC22530()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_24EC22540()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_24EC22550()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24EC22560()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_24EC22570()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24EC22580()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_24EC22590()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_24EC225A0()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_24EC225B0()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_24EC225C0()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_24EC225D0()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_24EC225E0()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_24EC225F0()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_24EC22600()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_24EC22610()
{
  return MEMORY[0x270F2B438]();
}

uint64_t sub_24EC22620()
{
  return MEMORY[0x270F02FE8]();
}

uint64_t sub_24EC22630()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_24EC22640()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_24EC22650()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_24EC22660()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24EC22670()
{
  return MEMORY[0x270F2B440]();
}

uint64_t sub_24EC22680()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24EC22690()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24EC226A0()
{
  return MEMORY[0x270F03310]();
}

uint64_t sub_24EC226B0()
{
  return MEMORY[0x270F03318]();
}

uint64_t sub_24EC226C0()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_24EC226D0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24EC226E0()
{
  return MEMORY[0x270F03708]();
}

uint64_t sub_24EC226F0()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_24EC22700()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_24EC22710()
{
  return MEMORY[0x270F03CE0]();
}

uint64_t sub_24EC22720()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_24EC22730()
{
  return MEMORY[0x270F03FF8]();
}

uint64_t sub_24EC22740()
{
  return MEMORY[0x270F040F8]();
}

uint64_t sub_24EC22750()
{
  return MEMORY[0x270F04108]();
}

uint64_t sub_24EC22760()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_24EC22770()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_24EC22780()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_24EC22790()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_24EC227A0()
{
  return MEMORY[0x270F041F8]();
}

uint64_t sub_24EC227B0()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_24EC227C0()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_24EC227D0()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_24EC227E0()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_24EC227F0()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_24EC22800()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_24EC22810()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_24EC22820()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_24EC22830()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_24EC22840()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_24EC22850()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_24EC22860()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_24EC22870()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_24EC22880()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_24EC22890()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_24EC228A0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_24EC228B0()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_24EC228C0()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_24EC228D0()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_24EC228E0()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_24EC228F0()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_24EC22900()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_24EC22910()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_24EC22920()
{
  return MEMORY[0x270F04D80]();
}

uint64_t sub_24EC22930()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24EC22940()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_24EC22950()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_24EC22960()
{
  return MEMORY[0x270F05170]();
}

uint64_t sub_24EC22970()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_24EC22980()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_24EC22990()
{
  return MEMORY[0x270F252C0]();
}

uint64_t sub_24EC229B0()
{
  return MEMORY[0x270F252D0]();
}

uint64_t sub_24EC229C0()
{
  return MEMORY[0x270F25398]();
}

uint64_t sub_24EC229D0()
{
  return MEMORY[0x270F253A0]();
}

uint64_t sub_24EC229E0()
{
  return MEMORY[0x270F253B0]();
}

uint64_t sub_24EC229F0()
{
  return MEMORY[0x270F253C0]();
}

uint64_t sub_24EC22A00()
{
  return MEMORY[0x270F253E8]();
}

uint64_t sub_24EC22A10()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24EC22A20()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24EC22A30()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24EC22A40()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_24EC22A50()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_24EC22A60()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_24EC22A70()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_24EC22A80()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_24EC22A90()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_24EC22AA0()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_24EC22AB0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24EC22AC0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24EC22AD0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24EC22AE0()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_24EC22AF0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24EC22B00()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24EC22B10()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_24EC22B20()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_24EC22B30()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_24EC22B40()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24EC22B50()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24EC22B70()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24EC22B80()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24EC22B90()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24EC22BA0()
{
  return MEMORY[0x270FA1EF0]();
}

uint64_t sub_24EC22BB0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24EC22BC0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24EC22BD0()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_24EC22BE0()
{
  return MEMORY[0x270F2CEB8]();
}

uint64_t sub_24EC22BF0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24EC22C00()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_24EC22C10()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_24EC22C20()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_24EC22C30()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t sub_24EC22C40()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_24EC22C50()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_24EC22C60()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_24EC22C70()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24EC22C80()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24EC22C90()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24EC22CA0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24EC22CB0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24EC22CC0()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_24EC22CD0()
{
  return MEMORY[0x270F9E718]();
}

uint64_t sub_24EC22CE0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24EC22CF0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24EC22D00()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24EC22D10()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24EC22D20()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24EC22D30()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24EC22D40()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24EC22D50()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24EC22D60()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24EC22D70()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_24EC22D80()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_24EC22D90()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_24EC22DA0()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_24EC22DB0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24EC22DC0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24EC22DD0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24EC22DE0()
{
  return MEMORY[0x270F9F228]();
}

uint64_t sub_24EC22DF0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24EC22E00()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24EC22E10()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24EC22E20()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24EC22E30()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_24EC22E40()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24EC22E50()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24EC22E60()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24EC22E70()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_24EC22E80()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_24EC22E90()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24EC22EA0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24EC22EB0()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_24EC22EC0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24EC22ED0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24EC22EE0()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_24EC22EF0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24EC22F00()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24EC22F10()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24EC22F20()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_24EC22F30()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24EC22F40()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24EC22F50()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_24EC22F60()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_24EC22F70()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24EC22F80()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_24EC22F90()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24EC22FA0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_24EC22FB0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24EC22FC0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24EC22FD0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24EC22FE0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24EC22FF0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24EC23000()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24EC23010()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24EC23020()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24EC23030()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24EC23040()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24EC23050()
{
  return MEMORY[0x270F9FD98]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x270FA0468]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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