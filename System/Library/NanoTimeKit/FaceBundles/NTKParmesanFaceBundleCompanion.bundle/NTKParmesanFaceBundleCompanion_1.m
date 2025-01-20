char *sub_246C0ED90(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char *result;
  char *v7;
  void *v8;
  char *v9;
  id v10;

  v3 = *(void *)(v1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_currentIndex);
  v4 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_reader;
  v5 = *(void **)(v1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_reader);
  if (!v5)
  {
    v7 = 0;
    result = 0;
    if (v3 < 0) {
      return result;
    }
    goto LABEL_6;
  }
  result = (char *)objc_msgSend(v5, sel_count);
  v7 = result;
  if (((unint64_t)result & 0x8000000000000000) != 0)
  {
    __break(1u);
    return result;
  }
  result = 0;
  if ((v3 & 0x8000000000000000) == 0)
  {
LABEL_6:
    if (v3 < (uint64_t)v7)
    {
      result = *(char **)(v1 + v4);
      if (result)
      {
        result = (char *)objc_msgSend(result, sel_objectAtIndexedSubscript_, v3);
        if (result)
        {
          v8 = *(void **)(v1
                        + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_previousAsset);
          *(void *)(v1
                    + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_previousAsset) = result;
          v9 = result;

          v10 = objc_allocWithZone((Class)type metadata accessor for ParmesanAssetComposition());
          return sub_246BD55D0(v9, a1);
        }
      }
    }
  }
  return result;
}

uint64_t sub_246C0EE6C(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_reader;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_reader);
  if (!v4) {
    return 0;
  }
  uint64_t result = (uint64_t)objc_msgSend(v4, sel_count);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (!result) {
    return 0;
  }
  uint64_t v6 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_currentIndex;
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_currentIndex);
  uint64_t v8 = v7 + 1;
  if (__OFADD__(v7, 1)) {
    goto LABEL_19;
  }
  uint64_t result = *(void *)(v1 + v3);
  if (!result) {
    goto LABEL_21;
  }
  uint64_t result = (uint64_t)objc_msgSend((id)result, sel_count);
  if (result < 0)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v9 = result;
  if (result)
  {
    uint64_t result = *(void *)(v1 + v3);
    if (!result || (uint64_t result = (uint64_t)objc_msgSend((id)result, sel_count), (result & 0x8000000000000000) == 0))
    {
      v10 = 0;
      uint64_t v11 = v8 % v9;
      if (v11 < 0 || v11 >= result) {
        return (uint64_t)v10;
      }
      v12 = *(void **)(v1 + v3);
      if (v12)
      {
        id v13 = objc_msgSend(v12, sel_objectAtIndexedSubscript_, v11);
        if (v13)
        {
          *(void *)(v1 + v6) = v11;
          v14 = *(void **)(v1
                         + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_previousAsset);
          *(void *)(v1
                    + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_previousAsset) = v13;
          v15 = (char *)v13;

          id v16 = objc_allocWithZone((Class)type metadata accessor for ParmesanAssetComposition());
          v10 = sub_246BD55D0(v15, a1);

          return (uint64_t)v10;
        }
      }
      return 0;
    }
    goto LABEL_20;
  }
LABEL_21:
  __break(1u);
  return result;
}

void sub_246C0EFB0()
{
  uint64_t v1 = v0;
  if (qword_2691D62F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_246C2C088();
  sub_246B8BE0C(v2, (uint64_t)qword_2691E0120);
  uint64_t v3 = sub_246C2C068();
  os_log_type_t v4 = sub_246C2CEE8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = v6;
    *(_DWORD *)v5 = 136315138;
    sub_246BA686C(0x736F507465736572, 0xEF29286E6F697469, &v7);
    sub_246C2D1C8();
    _os_log_impl(&dword_246B51000, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C545990](v6, -1, -1);
    MEMORY[0x24C545990](v5, -1, -1);
  }

  *(void *)(v1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_currentIndex) = 0;
}

unint64_t sub_246C0F1AC()
{
  sub_246C2D278();
  sub_246C2CCD8();
  uint64_t v1 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_reader;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_reader);
  if (v2 && (unint64_t result = (unint64_t)objc_msgSend(v2, sel_count), (result & 0x8000000000000000) != 0))
  {
    __break(1u);
  }
  else
  {
    sub_246C2D528();
    sub_246C2CCD8();
    swift_bridgeObjectRelease();
    sub_246C2CCD8();
    sub_246C2D528();
    sub_246C2CCD8();
    swift_bridgeObjectRelease();
    sub_246C2CCD8();
    sub_246B80250(&qword_2691D8828);
    sub_246C2CCA8();
    sub_246C2CCD8();
    swift_bridgeObjectRelease();
    sub_246C2CCD8();
    swift_bridgeObjectRetain();
    sub_246B80250(&qword_2691D8830);
    sub_246C2CCA8();
    sub_246C2CCD8();
    swift_bridgeObjectRelease();
    sub_246C2CCD8();
    id v4 = *(id *)(v0 + v1);
    sub_246B80250(qword_2691D8838);
    sub_246C2CCA8();
    sub_246C2CCD8();
    swift_bridgeObjectRelease();
    return 0;
  }
  return result;
}

id sub_246C0F400()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ParmesanGalleryReaderDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ParmesanGalleryReaderDataSource()
{
  return self;
}

uint64_t sub_246C0F4C8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_delegate + 8) = a2;
  swift_unknownObjectWeakAssign();

  return swift_unknownObjectRelease();
}

void sub_246C0F514(uint64_t a1, char a2)
{
  uint64_t v3 = v2 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_contentOption;
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_contentOption);
  int v5 = *(unsigned __int8 *)(v2
                          + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_contentOption
                          + 8);
  *(void *)uint64_t v3 = a1;
  *(unsigned char *)(v3 + 8) = a2 & 1;
  if (a2)
  {
    if (v5) {
      return;
    }
    goto LABEL_3;
  }
  if (v4 != a1) {
    LOBYTE(v5) = 1;
  }
  if (v5) {
LABEL_3:
  }
    sub_246C0E114();
}

BOOL sub_246C0F550()
{
  return *(void *)(v0 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion31ParmesanGalleryReaderDataSource_reader) != 0;
}

void sub_246C0F570(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_246C0F594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_246C0F59C()
{
  uint64_t v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t v0 = sub_246C2D1A8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return v0;
}

uint64_t *sub_246C0F67C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  int v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = v8;
  unint64_t v10 = ~(unint64_t)v8;
  uint64_t v11 = v7 + v8;
  if (*(_DWORD *)(v6 + 84)) {
    size_t v12 = *(void *)(v6 + 64);
  }
  else {
    size_t v12 = v7 + 1;
  }
  unint64_t v13 = ((v7 + v8 + ((v7 + v8) & ~(unint64_t)v8)) & ~(unint64_t)v8)
      + v12;
  int v14 = v8 & 0x100000;
  if (v9 > 7 || v14 != 0 || v13 > 0x18)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    uint64_t v18 = v17 + ((v9 + 16) & v10);
    swift_retain();
  }
  else
  {
    v19 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v19(a1, a2, v5);
    v24 = a1;
    unint64_t v20 = ((unint64_t)a1 + v11) & v10;
    unint64_t v21 = ((unint64_t)a2 + v11) & v10;
    v19((uint64_t *)v20, (uint64_t *)v21, v5);
    v22 = (void *)((v11 + v20) & v10);
    if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v6 + 48))((v11 + v21) & v10, 1, v5))
    {
      memcpy(v22, (const void *)((v11 + v21) & v10), v12);
    }
    else
    {
      v19((uint64_t *)v22, (uint64_t *)((v11 + v21) & v10), v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v22, 0, 1, v5);
    }
    return v24;
  }
  return (uint64_t *)v18;
}

uint64_t sub_246C0F840(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = v4;
  size_t v12 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v12(a1, v3);
  uint64_t v6 = *(void *)(v4 + 64);
  uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = v6 + v7;
  uint64_t v9 = (v6 + v7 + a1) & ~v7;
  v12(v9, v3);
  uint64_t v10 = (v8 + v9) & ~v7;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v10, 1, v3);
  if (!result)
  {
    return ((uint64_t (*)(uint64_t, uint64_t))v12)(v10, v3);
  }
  return result;
}

uint64_t sub_246C0F980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  size_t v14 = *(void *)(v6 + 64);
  size_t v9 = v14 + v8;
  size_t v10 = (v14 + v8 + a2) & ~v8;
  v7((v14 + v8 + a1) & ~v8, v10, v5);
  uint64_t v11 = (void *)((v14 + v8 + ((v14 + v8 + a1) & ~v8)) & ~v8);
  if ((*(unsigned int (**)(size_t, uint64_t, uint64_t))(v6 + 48))((v14 + v8 + v10) & ~v8, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v12 = v14;
    }
    else {
      size_t v12 = v14 + 1;
    }
    memcpy(v11, (const void *)((v9 + v10) & ~v8), v12);
  }
  else
  {
    v7((uint64_t)v11, (v9 + v10) & ~v8, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v11, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_246C0FB00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = v6;
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v8(a1, a2, v5);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v18 = *(void *)(v6 + 64);
  size_t v10 = (v18 + v9 + a2) & ~v9;
  v8((v18 + v9 + a1) & ~v9, v10, v5);
  uint64_t v11 = (void *)((v18 + v9 + ((v18 + v9 + a1) & ~v9)) & ~v9);
  size_t v12 = (void *)((v18 + v9 + v10) & ~v9);
  unint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v10) = v13(v11, 1, v5);
  int v14 = v13(v12, 1, v5);
  if (v10)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v11, v12, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v5);
      return a1;
    }
    int v15 = *(_DWORD *)(v7 + 84);
  }
  else
  {
    if (!v14)
    {
      v8((uint64_t)v11, (uint64_t)v12, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(v11, v5);
    int v15 = *(_DWORD *)(v7 + 84);
  }
  if (v15) {
    size_t v16 = v18;
  }
  else {
    size_t v16 = v18 + 1;
  }
  memcpy(v11, v12, v16);
  return a1;
}

uint64_t sub_246C0FCE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  size_t v14 = *(void *)(v6 + 64);
  size_t v9 = v14 + v8;
  size_t v10 = (v14 + v8 + a2) & ~v8;
  v7((v14 + v8 + a1) & ~v8, v10, v5);
  uint64_t v11 = (void *)((v14 + v8 + ((v14 + v8 + a1) & ~v8)) & ~v8);
  if ((*(unsigned int (**)(size_t, uint64_t, uint64_t))(v6 + 48))((v14 + v8 + v10) & ~v8, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v12 = v14;
    }
    else {
      size_t v12 = v14 + 1;
    }
    memcpy(v11, (const void *)((v9 + v10) & ~v8), v12);
  }
  else
  {
    v7((uint64_t)v11, (v9 + v10) & ~v8, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v11, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_246C0FE68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = v6;
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v8(a1, a2, v5);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v18 = *(void *)(v6 + 64);
  size_t v10 = (v18 + v9 + a2) & ~v9;
  v8((v18 + v9 + a1) & ~v9, v10, v5);
  uint64_t v11 = (void *)((v18 + v9 + ((v18 + v9 + a1) & ~v9)) & ~v9);
  size_t v12 = (void *)((v18 + v9 + v10) & ~v9);
  unint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  LODWORD(v10) = v13(v11, 1, v5);
  int v14 = v13(v12, 1, v5);
  if (v10)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 32))(v11, v12, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v5);
      return a1;
    }
    int v15 = *(_DWORD *)(v7 + 84);
  }
  else
  {
    if (!v14)
    {
      v8((uint64_t)v11, (uint64_t)v12, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(v11, v5);
    int v15 = *(_DWORD *)(v7 + 84);
  }
  if (v15) {
    size_t v16 = v18;
  }
  else {
    size_t v16 = v18 + 1;
  }
  memcpy(v11, v12, v16);
  return a1;
}

uint64_t sub_246C10050(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4;
  unsigned int v6 = *(_DWORD *)(v4 + 84);
  uint64_t v7 = *(void *)(v4 + 64);
  if (v6) {
    uint64_t v8 = *(void *)(v4 + 64);
  }
  else {
    uint64_t v8 = v7 + 1;
  }
  if (!a2) {
    return 0;
  }
  unsigned int v9 = a2 - v6;
  if (a2 <= v6) {
    goto LABEL_22;
  }
  uint64_t v10 = v8
      + ((v7
        + *(unsigned __int8 *)(v5 + 80)
        + ((v7 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  char v11 = 8 * v10;
  if (v10 <= 3)
  {
    unsigned int v13 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v13))
    {
      int v12 = *(_DWORD *)((char *)a1 + v10);
      if (!v12) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v13 > 0xFF)
    {
      int v12 = *(unsigned __int16 *)((char *)a1 + v10);
      if (!*(unsigned __int16 *)((char *)a1 + v10)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v13 < 2)
    {
LABEL_22:
      if (v6) {
        return (*(uint64_t (**)(void))(v5 + 48))();
      }
      return 0;
    }
  }
  int v12 = *((unsigned __int8 *)a1 + v10);
  if (!*((unsigned char *)a1 + v10)) {
    goto LABEL_22;
  }
LABEL_14:
  int v14 = (v12 - 1) << v11;
  if (v10 > 3) {
    int v14 = 0;
  }
  if (v10)
  {
    if (v10 > 3) {
      LODWORD(v10) = 4;
    }
    switch((int)v10)
    {
      case 2:
        LODWORD(v10) = *a1;
        break;
      case 3:
        LODWORD(v10) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v10) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v10) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v6 + (v10 | v14) + 1;
}

void sub_246C101CC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(v6 + 64);
  unint64_t v9 = (v8
      + *(unsigned __int8 *)(v6 + 80)
      + ((v8 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  if (!v7) {
    ++v8;
  }
  size_t v10 = v8 + v9;
  BOOL v11 = a3 >= v7;
  unsigned int v12 = a3 - v7;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v14 = ~v7 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_36;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_23;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_23;
    case 3:
LABEL_36:
      __break(1u);
      JUMPOUT(0x246C10404);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_22;
    default:
LABEL_22:
      if (a2)
      {
LABEL_23:
        size_t v18 = *(void (**)(void))(v6 + 56);
        v18();
      }
      return;
  }
}

uint64_t type metadata accessor for ParmesanLayoutConditionalMetric()
{
  return sub_246B98FA0();
}

uint64_t sub_246C10444()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ParmesanGalleryContentConfiguration()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for ParmesanGalleryContentConfiguration.ViewStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x246C1056CLL);
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

ValueMetadata *type metadata accessor for ParmesanGalleryContentConfiguration.ViewStyle()
{
  return &type metadata for ParmesanGalleryContentConfiguration.ViewStyle;
}

unint64_t sub_246C105A8()
{
  unint64_t result = qword_2691D88C0;
  if (!qword_2691D88C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691D88C0);
  }
  return result;
}

BOOL sub_246C105FC(uint64_t *a1, uint64_t *a2)
{
  return sub_246C10608(*a1, *a2);
}

BOOL sub_246C10608(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  BOOL v6 = *(void *)(v4 + OBJC_IVAR___NTKParmesanGalleryComposition_localIdentifier) == *(void *)(v5
                                                                                                + OBJC_IVAR___NTKParmesanGalleryComposition_localIdentifier)
    && *(void *)(v4 + OBJC_IVAR___NTKParmesanGalleryComposition_localIdentifier + 8) == *(void *)(v5 + OBJC_IVAR___NTKParmesanGalleryComposition_localIdentifier + 8);
  if (v6 || (v7 = sub_246C2D578(), BOOL result = 0, (v7 & 1) != 0))
  {
    uint64_t v9 = *(void *)(v4 + OBJC_IVAR___NTKParmesanGalleryComposition_timeLayout);
    uint64_t v10 = *(void *)(v5 + OBJC_IVAR___NTKParmesanGalleryComposition_timeLayout);
    return *(void *)(v9 + OBJC_IVAR___NTKParmesanTimeLayout_alignment) == *(void *)(v10
                                                                                      + OBJC_IVAR___NTKParmesanTimeLayout_alignment)
        && *(void *)(v9 + OBJC_IVAR___NTKParmesanTimeLayout_scale) == *(void *)(v10
                                                                                  + OBJC_IVAR___NTKParmesanTimeLayout_scale)
        && *(unsigned __int8 *)(a1 + 24) == *(unsigned __int8 *)(a2 + 24)
        && *(unsigned __int8 *)(a1 + 25) == *(unsigned __int8 *)(a2 + 25);
  }
  return result;
}

char *sub_246C106EC(void *a1, char a2, double a3, double a4, double a5, double a6)
{
  *(void *)&v6[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion35ParmesanGalleryContentContainerView_opacityPairMatrixFilter] = 0;
  *(void *)&v6[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion35ParmesanGalleryContentContainerView_contentView] = a1;
  id v13 = objc_allocWithZone(MEMORY[0x263F82E00]);
  unsigned int v14 = v6;
  id v15 = a1;
  id v16 = objc_msgSend(v13, sel_initWithFrame_, 0.0, 0.0, a5, a6);
  *(void *)&v14[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion35ParmesanGalleryContentContainerView_legibilityCurtainView] = v16;
  v14[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion35ParmesanGalleryContentContainerView_useOpacityPairFilter] = a2;

  v19.receiver = v14;
  v19.super_class = (Class)type metadata accessor for ParmesanGalleryContentContainerView();
  int v17 = (char *)objc_msgSendSuper2(&v19, sel_initWithFrame_, a3, a4, a5, a6);
  objc_msgSend(v17, sel_addSubview_, v15);
  objc_msgSend(v17, sel_insertSubview_aboveSubview_, *(void *)&v17[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion35ParmesanGalleryContentContainerView_legibilityCurtainView], *(void *)&v17[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion35ParmesanGalleryContentContainerView_contentView]);
  sub_246C108AC();

  return v17;
}

void sub_246C108AC()
{
  uint64_t v1 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion35ParmesanGalleryContentContainerView_opacityPairMatrixFilter;
  if (!*(void *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion35ParmesanGalleryContentContainerView_opacityPairMatrixFilter])
  {
    sub_246C2CC48();
    id v2 = objc_allocWithZone(MEMORY[0x263F157C8]);
    int v3 = (void *)sub_246C2CC08();
    swift_bridgeObjectRelease();
    id v4 = objc_msgSend(v2, sel_initWithType_, v3);

    uint64_t v5 = (void *)sub_246C2C008();
    objc_msgSend(v4, sel_setValue_forKey_, v5, *MEMORY[0x263F15BF8]);

    BOOL v6 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v4;
    id v7 = v4;

    id v8 = objc_msgSend(v0, sel_layer);
    sub_246B80250(&qword_2691D7D20);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_246C33620;
    *(void *)(v9 + 56) = sub_246BF7660();
    *(void *)(v9 + 32) = v7;
    id v10 = v7;
    id v11 = (id)sub_246C2CD28();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setFilters_, v11);
  }
}

id sub_246C10A88()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ParmesanGalleryContentContainerView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ParmesanGalleryContentContainerView()
{
  return self;
}

uint64_t sub_246C10B3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_246C10B50(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_246C10B64(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

void *sub_246C10B78(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_246C16334((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_246C2D358();

  if (!v4) {
    return 0;
  }
  type metadata accessor for ParmesanAssetLayout();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

unint64_t sub_246C10C40(uint64_t a1)
{
  return sub_246C11138(a1, &qword_2691D8A10);
}

unint64_t sub_246C10C4C(uint64_t a1)
{
  return sub_246C10FFC(a1, &qword_2691D8958, &qword_2691D8960, (uint64_t (*)(uint64_t))sub_246C162A0);
}

unint64_t sub_246C10C74(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    objc_super v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_246B80250(&qword_2691D8410);
  objc_super v2 = (void *)sub_246C2D3F8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_246C16334((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
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

unint64_t sub_246C10D80(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_246B80250(&qword_2691D89D0);
  uint64_t v2 = sub_246C2D3F8();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_246BB75D0(v6, (uint64_t)&v15, &qword_2691D89D8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_246C16228(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_246BAAFEC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

unint64_t sub_246C10EB8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_246B80250(&qword_2691D8A08);
  uint64_t v2 = (void *)sub_246C2D3F8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t result = sub_246C16228(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
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

unint64_t sub_246C10FD4(uint64_t a1)
{
  return sub_246C10FFC(a1, &qword_2691D89E8, &qword_2691D89F0, (uint64_t (*)(uint64_t))sub_246C164E0);
}

unint64_t sub_246C10FFC(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_246B80250(a2);
  uint64_t v7 = sub_246C2D3F8();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = v7 + 64;
  uint64_t v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_246BB75D0(v11, (uint64_t)&v18, a3);
    uint64_t v12 = v18;
    unint64_t result = a4(v18);
    if (v14) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v8[6] + 8 * result) = v12;
    unint64_t result = (unint64_t)sub_246BAAFEC(&v19, (_OWORD *)(v8[7] + 32 * result));
    uint64_t v15 = v8[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
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

unint64_t sub_246C1112C(uint64_t a1)
{
  return sub_246C11138(a1, &qword_2691D89F8);
}

unint64_t sub_246C11138(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_246B80250(a2);
  uint64_t v3 = (void *)sub_246C2D3F8();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_246C16228(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
    if (!--v4)
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

unint64_t sub_246C11250(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_246B80250(&qword_2691D8978);
  uint64_t v2 = (void *)sub_246C2D3F8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (char *)(a1 + 33);
  while (1)
  {
    unsigned __int8 v5 = *(v4 - 1);
    char v6 = *v4;
    unint64_t result = sub_246C16424(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    *(unsigned char *)(v2[7] + result) = v6;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v11;
    if (!--v3)
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

unint64_t sub_246C1134C(uint64_t a1)
{
  return sub_246C11364(a1, &qword_2691D8970);
}

unint64_t sub_246C11358(uint64_t a1)
{
  return sub_246C11364(a1, &qword_2691D8968);
}

unint64_t sub_246C11364(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_246B80250(a2);
  uint64_t v3 = (void *)sub_246C2D3F8();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  unsigned __int8 v5 = (void *)(a1 + 40);
  while (1)
  {
    unsigned __int8 v6 = *((unsigned char *)v5 - 8);
    uint64_t v7 = *v5;
    swift_bridgeObjectRetain();
    unint64_t result = sub_246C1637C(v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v3[6] + result) = v6;
    *(void *)(v3[7] + 8 * result) = v7;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v5 += 2;
    if (!--v4)
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

void sub_246C11464()
{
  id v1 = objc_msgSend(v0, sel_layoutForScale_, 0);

  if (!v1)
  {
    uint64_t v2 = (char *)objc_msgSend(v0, sel_layoutForScale_, 1);
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)(*(void *)&v2[OBJC_IVAR___NTKParmesanAssetLayout_timeLayout]
                     + OBJC_IVAR___NTKParmesanTimeLayout_alignment);
      unsigned __int8 v5 = (objc_class *)type metadata accessor for ParmesanTimeLayout();
      unsigned __int8 v6 = (char *)objc_allocWithZone(v5);
      *(void *)&v6[OBJC_IVAR___NTKParmesanTimeLayout_alignment] = v4;
      *(void *)&v6[OBJC_IVAR___NTKParmesanTimeLayout_scale] = 0;
      v16.receiver = v6;
      v16.super_class = v5;
      id v7 = objc_msgSendSuper2(&v16, sel_init);
      char v8 = *(void **)&v3[OBJC_IVAR___NTKParmesanAssetLayout_originalCrop];
      double v9 = *(double *)&v3[OBJC_IVAR___NTKParmesanAssetLayout_imageAOTBrightness];
      uint64_t v10 = *(void *)&v3[OBJC_IVAR___NTKParmesanAssetLayout_baseImageName];
      uint64_t v11 = *(void *)&v3[OBJC_IVAR___NTKParmesanAssetLayout_baseImageName + 8];
      char v12 = v3[OBJC_IVAR___NTKParmesanAssetLayout_userEdited];
      objc_allocWithZone((Class)type metadata accessor for ParmesanAssetLayout());
      id v13 = v7;
      id v14 = v8;
      swift_bridgeObjectRetain();
      id v15 = sub_246BEB9F0(v14, v10, v11, 0, v13, 0, v12, v9);

      swift_beginAccess();
      if (v15) {
        sub_246C16F44((uint64_t)v15, v13);
      }
      else {

      }
      swift_endAccess();
    }
  }
}

id sub_246C11ACC(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4, uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  uint64_t v11 = sub_246B80250(a3);
  MEMORY[0x270FA5388](v11 - 8);
  id v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a1 + *a4;
  swift_beginAccess();
  sub_246BB75D0(v14, (uint64_t)v13, a3);
  uint64_t v15 = a5(0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15) != 1)
  {
    uint64_t v17 = (void *)a6();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
  }

  return v17;
}

void sub_246C11C60(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(uint64_t), uint64_t (*a6)(void), void *a7)
{
  uint64_t v13 = sub_246B80250(a4);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    a5(a3);
    uint64_t v16 = a6(0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 0, 1, v16);
  }
  else
  {
    uint64_t v17 = a6(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 1, 1, v17);
  }
  uint64_t v18 = (uint64_t)a1 + *a7;
  swift_beginAccess();
  id v19 = a1;
  sub_246C17C8C((uint64_t)v15, v18, a4);
  swift_endAccess();
}

id sub_246C12134()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ParmesanAsset();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_246C12214()
{
  return type metadata accessor for ParmesanAsset();
}

uint64_t type metadata accessor for ParmesanAsset()
{
  uint64_t result = qword_2691D88F0;
  if (!qword_2691D88F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_246C12268()
{
  sub_246C12898(319, (unint64_t *)&qword_2691D78C8, MEMORY[0x263F07490]);
  if (v0 <= 0x3F)
  {
    sub_246C12898(319, (unint64_t *)&qword_2691D7E70, MEMORY[0x263F06EA8]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t sub_246C123BC(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_246B80250(&qword_2691D7030);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_246B80250(&qword_2691D89A0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_246B8F7E8(a1, a1[3]);
  sub_246C16048();
  sub_246C2D708();
  char v17 = 0;
  swift_bridgeObjectRetain();
  sub_246C2D4C8();
  if (!v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v13 = v3 + OBJC_IVAR___NTKParmesanAsset_modificationDate;
    swift_beginAccess();
    sub_246BB75D0(v13, (uint64_t)v7, &qword_2691D7030);
    LOBYTE(v16) = 1;
    sub_246C2BC18();
    sub_246C18434(&qword_2691D89A8, MEMORY[0x263F07490]);
    sub_246C2D4B8();
    sub_246B8EA34((uint64_t)v7, &qword_2691D7030);
    long long v16 = *(_OWORD *)(v3 + OBJC_IVAR___NTKParmesanAsset_presentationSize);
    LOBYTE(v18) = 2;
    type metadata accessor for CGSize(0);
    sub_246C18434(&qword_2691D89B0, type metadata accessor for CGSize);
    sub_246C2D508();
    *(void *)&long long v16 = *(void *)(v3 + OBJC_IVAR___NTKParmesanAsset_videoInfo);
    LOBYTE(v18) = 3;
    type metadata accessor for ParmesanAssetVideoInfo();
    sub_246C18434(&qword_2691D89B8, (void (*)(uint64_t))type metadata accessor for ParmesanAssetVideoInfo);
    sub_246C2D4B8();
    *(void *)&long long v16 = *(void *)(v3 + OBJC_IVAR___NTKParmesanAsset_preferredTimeLayout);
    LOBYTE(v18) = 4;
    type metadata accessor for ParmesanTimeLayout();
    sub_246C18434(&qword_2691D81B8, (void (*)(uint64_t))type metadata accessor for ParmesanTimeLayout);
    sub_246C2D508();
    uint64_t v14 = (uint64_t *)(v3 + OBJC_IVAR___NTKParmesanAsset_layouts);
    swift_beginAccess();
    uint64_t v18 = *v14;
    v15[15] = 5;
    sub_246B80250(&qword_2691D8928);
    sub_246C18358();
    sub_246C2D508();
    LOBYTE(v18) = 6;
    swift_bridgeObjectRetain();
    sub_246C2D4A8();
  }
  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_bridgeObjectRelease();
}

void sub_246C12898(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_246C2D1A8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void *sub_246C128EC(uint64_t a1)
{
  uint64_t v4 = sub_246B80250(&qword_2691D7030);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246B80250(&qword_2691D8900);
  uint64_t v40 = *(void *)(v7 - 8);
  uint64_t v41 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t)&v1[OBJC_IVAR___NTKParmesanAsset_modificationDate];
  uint64_t v11 = sub_246C2BC18();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  uint64_t v44 = v10;
  v12(v10, 1, 1, v11);
  uint64_t v13 = (unint64_t *)&v1[OBJC_IVAR___NTKParmesanAsset_layouts];
  uint64_t v14 = v1;
  *uint64_t v13 = sub_246C10C74(MEMORY[0x263F8EE78]);
  uint64_t v15 = (uint64_t *)&v14[OBJC_IVAR___NTKParmesanAsset_accessibilityDescription];
  uint64_t *v15 = 0;
  v15[1] = 0;
  v46 = v15;
  v47 = v13;
  uint64_t v45 = OBJC_IVAR___NTKParmesanAsset_videoInfo;
  *(void *)&v14[OBJC_IVAR___NTKParmesanAsset_videoInfo] = 0;
  uint64_t v16 = (uint64_t)&v14[OBJC_IVAR___NTKParmesanAsset_resourceDirectory];
  uint64_t v17 = sub_246C2BB98();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  uint64_t v42 = v16;
  v18(v16, 1, 1, v17);
  *(void *)&v14[OBJC_IVAR___NTKParmesanAsset_photoVersion] = 10;
  uint64_t v19 = *(void *)(a1 + 24);
  uint64_t v43 = a1;
  uint64_t v20 = (void *)a1;
  unint64_t v21 = v9;
  v22 = sub_246B8F7E8(v20, v19);
  sub_246C16048();
  sub_246C2D6E8();
  if (v2)
  {
    sub_246B8EB94(v43);
    sub_246B8EA34(v44, &qword_2691D7030);
    uint64_t v27 = v45;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    sub_246B8EA34(v42, &qword_2691D7038);
    type metadata accessor for ParmesanAsset();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v23 = (uint64_t)v6;
    uint64_t v25 = v40;
    uint64_t v24 = v41;
    LOBYTE(v49) = 0;
    uint64_t v26 = sub_246C2D458();
    v29 = (uint64_t *)&v14[OBJC_IVAR___NTKParmesanAsset_localIdentifier];
    uint64_t *v29 = v26;
    v29[1] = v30;
    v39[1] = v29;
    LOBYTE(v49) = 1;
    sub_246C18434(&qword_2691D8910, MEMORY[0x263F07490]);
    sub_246C2D448();
    uint64_t v31 = v44;
    swift_beginAccess();
    sub_246C17C8C(v23, v31, &qword_2691D7030);
    swift_endAccess();
    type metadata accessor for CGSize(0);
    LOBYTE(v50) = 2;
    sub_246C18434(&qword_2691D8918, type metadata accessor for CGSize);
    sub_246C2D498();
    *(_OWORD *)&v14[OBJC_IVAR___NTKParmesanAsset_presentationSize] = v49;
    type metadata accessor for ParmesanAssetVideoInfo();
    LOBYTE(v50) = 3;
    sub_246C18434(&qword_2691D8920, (void (*)(uint64_t))type metadata accessor for ParmesanAssetVideoInfo);
    v39[0] = v21;
    sub_246C2D448();
    v32 = v47;
    v33 = *(void **)&v14[v45];
    *(void *)&v14[v45] = v49;

    type metadata accessor for ParmesanTimeLayout();
    LOBYTE(v50) = 4;
    sub_246C18434(&qword_2691D8190, (void (*)(uint64_t))type metadata accessor for ParmesanTimeLayout);
    sub_246C2D498();
    *(void *)&v14[OBJC_IVAR___NTKParmesanAsset_preferredTimeLayout] = v49;
    sub_246B80250(&qword_2691D8928);
    LOBYTE(v49) = 5;
    sub_246C1609C();
    sub_246C2D498();
    unint64_t v34 = v50;
    swift_beginAccess();
    unint64_t *v32 = v34;
    swift_bridgeObjectRelease();
    LOBYTE(v50) = 6;
    uint64_t v35 = sub_246C2D438();
    v36 = v46;
    uint64_t *v46 = v35;
    v36[1] = v37;

    swift_bridgeObjectRelease();
    v38 = (objc_class *)type metadata accessor for ParmesanAsset();
    v48.receiver = v14;
    v48.super_class = v38;
    v22 = objc_msgSendSuper2(&v48, sel_init);
    (*(void (**)(void, uint64_t))(v25 + 8))(v39[0], v24);
    sub_246B8EB94(v43);
  }
  return v22;
}

unint64_t sub_246C13024(char a1)
{
  unint64_t result = 0x6564496C61636F6CLL;
  switch(a1)
  {
    case 1:
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0x666E496F65646976;
      break;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    case 5:
      unint64_t result = 0x7374756F79616CLL;
      break;
    case 6:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_246C1311C(char a1)
{
  unint64_t result = 0x6564496C61636F6CLL;
  switch(a1)
  {
    case 1:
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0x666E496F65646976;
      break;
    case 4:
      unint64_t result = 0xD000000000000013;
      break;
    case 5:
      unint64_t result = 0x7374756F79616CLL;
      break;
    case 6:
      unint64_t result = 0xD000000000000018;
      break;
    default:
      return result;
  }
  return result;
}

void *sub_246C13214@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for ParmesanAsset());
  unint64_t result = sub_246C128EC(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_246C1326C(void *a1)
{
  return sub_246C123BC(a1);
}

uint64_t sub_246C13290(unsigned __int8 *a1, char *a2)
{
  return sub_246BBB434(*a1, *a2);
}

uint64_t sub_246C1329C()
{
  return sub_246BBC2FC();
}

uint64_t sub_246C132A8()
{
  return sub_246BBBED8();
}

uint64_t sub_246C132B0()
{
  return sub_246BBC2FC();
}

uint64_t sub_246C132B8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_246C186E4();
  *a1 = result;
  return result;
}

unint64_t sub_246C132E8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_246C13024(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_246C13314()
{
  return sub_246C1311C(*v0);
}

uint64_t sub_246C1331C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_246C186E4();
  *a1 = result;
  return result;
}

uint64_t sub_246C13344(uint64_t a1)
{
  unint64_t v2 = sub_246C16048();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246C13380(uint64_t a1)
{
  unint64_t v2 = sub_246C16048();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246C133BC@<X0>(void *a1@<X8>)
{
  unint64_t v2 = (void *)(*v1 + OBJC_IVAR___NTKParmesanAsset_localIdentifier);
  uint64_t v3 = v2[1];
  *a1 = *v2;
  a1[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_246C133D8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_246B80250(&qword_2691D7030);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_246C2BC18();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = self;
  uint64_t v10 = (uint64_t *)(v1 + OBJC_IVAR___NTKParmesanAsset_localIdentifier);
  swift_bridgeObjectRetain();
  uint64_t v11 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v9, sel_uuidFromLocalIdentifier_, v11);

  if (v12)
  {
    uint64_t v13 = sub_246C2CC48();
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v13 = *v10;
    uint64_t v15 = v10[1];
    swift_bridgeObjectRetain();
  }
  uint64_t v16 = v1 + OBJC_IVAR___NTKParmesanAsset_modificationDate;
  swift_beginAccess();
  sub_246BB75D0(v16, (uint64_t)v4, &qword_2691D7030);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_246B8EA34((uint64_t)v4, &qword_2691D7030);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    v25[2] = 45;
    v25[3] = 0xE100000000000000;
    sub_246C2BBF8();
    sub_246C2CE68();
    sub_246C2CCD8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  id v17 = objc_msgSend(*(id *)(v1 + OBJC_IVAR___NTKParmesanAsset_preferredTimeLayout), sel_description);
  sub_246C2CC48();

  uint64_t v18 = sub_246BE8B50();
  id v19 = sub_246BE86A4((uint64_t)v18);
  uint64_t v20 = (uint64_t *)(v1 + OBJC_IVAR___NTKParmesanAsset_layouts);
  swift_beginAccess();
  uint64_t v21 = *v20;
  swift_bridgeObjectRetain();
  v22 = sub_246C10B78(v19, v21);

  swift_bridgeObjectRelease();
  if (v22)
  {
    id v23 = objc_msgSend(v22, sel_uniqueSnapshotIdentifier);

    sub_246C2CC48();
  }
  v25[0] = v13;
  v25[1] = v15;
  sub_246C2CCD8();
  sub_246C2CCD8();
  swift_bridgeObjectRelease();
  sub_246C2CCD8();
  sub_246C2CCD8();
  swift_bridgeObjectRelease();
  sub_246C2CCD8();
  swift_bridgeObjectRelease();
  return v25[0];
}

void sub_246C138F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = a1;
  unint64_t v4 = a2 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0) {
      a2 = a1;
    }
    else {
      a2 = a1 & 0xFFFFFFFFFFFFFF8;
    }
    if (v4)
    {
      if (v2 < 0) {
        a1 = v2;
      }
      else {
        a1 = v2 & 0xFFFFFFFFFFFFFF8;
      }
      goto LABEL_52;
    }
    uint64_t v5 = a2;
    uint64_t v6 = v2;
    goto LABEL_18;
  }
  if (v4)
  {
    if (a2 < 0) {
      uint64_t v5 = a2;
    }
    else {
      uint64_t v5 = a2 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t v6 = v3;
LABEL_18:
    sub_246C175B0(v5, v6);
    return;
  }
  if (a1 == a2 || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return;
  }
  int64_t v7 = 0;
  uint64_t v8 = a1 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a1 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v7 << 6);
      goto LABEL_44;
    }
    int64_t v15 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_51;
    }
    if (v15 >= v12) {
      return;
    }
    unint64_t v16 = *(void *)(v8 + 8 * v15);
    ++v7;
    if (!v16)
    {
      int64_t v7 = v15 + 1;
      if (v15 + 1 >= v12) {
        return;
      }
      unint64_t v16 = *(void *)(v8 + 8 * v7);
      if (!v16)
      {
        int64_t v7 = v15 + 2;
        if (v15 + 2 >= v12) {
          return;
        }
        unint64_t v16 = *(void *)(v8 + 8 * v7);
        if (!v16)
        {
          int64_t v7 = v15 + 3;
          if (v15 + 3 >= v12) {
            return;
          }
          unint64_t v16 = *(void *)(v8 + 8 * v7);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_43:
    unint64_t v11 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v7 << 6);
LABEL_44:
    uint64_t v18 = 8 * v14;
    id v19 = *(void **)(*(void *)(v3 + 56) + v18);
    id v20 = *(id *)(*(void *)(v3 + 48) + v18);
    id v21 = v19;
    unint64_t v22 = sub_246C16334((uint64_t)v20);
    char v24 = v23;

    if ((v24 & 1) == 0)
    {

      return;
    }
    type metadata accessor for ParmesanAssetLayout();
    id v25 = *(id *)(*(void *)(v2 + 56) + 8 * v22);
    char v26 = sub_246C2D108();

    if ((v26 & 1) == 0) {
      return;
    }
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v12) {
    return;
  }
  unint64_t v16 = *(void *)(v8 + 8 * v17);
  if (v16)
  {
    int64_t v7 = v17;
    goto LABEL_43;
  }
  while (1)
  {
    int64_t v7 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v7 >= v12) {
      return;
    }
    unint64_t v16 = *(void *)(v8 + 8 * v7);
    ++v17;
    if (v16) {
      goto LABEL_43;
    }
  }
LABEL_51:
  __break(1u);
LABEL_52:
  MEMORY[0x270F9EFB8](a1, a2);
}

void sub_246C13B74(void *a1@<X8>)
{
  v28 = a1;
  uint64_t v2 = sub_246B80250(&qword_2691D7038);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v26 = v4;
  uint64_t v5 = sub_246B80250(&qword_2691D7030);
  MEMORY[0x270FA5388](v5 - 8);
  int64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR___NTKParmesanAsset_localIdentifier + 8);
  uint64_t v27 = *(void *)(v1 + OBJC_IVAR___NTKParmesanAsset_localIdentifier);
  uint64_t v9 = v1 + OBJC_IVAR___NTKParmesanAsset_modificationDate;
  swift_beginAccess();
  sub_246BB75D0(v9, (uint64_t)v7, &qword_2691D7030);
  double v10 = *(double *)(v1 + OBJC_IVAR___NTKParmesanAsset_presentationSize);
  double v11 = *(double *)(v1 + OBJC_IVAR___NTKParmesanAsset_presentationSize + 8);
  int64_t v12 = *(void **)(v1 + OBJC_IVAR___NTKParmesanAsset_videoInfo);
  uint64_t v13 = sub_246C2BB98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
  unint64_t v14 = *(void **)(v1 + OBJC_IVAR___NTKParmesanAsset_preferredTimeLayout);
  int64_t v15 = (unint64_t *)(v1 + OBJC_IVAR___NTKParmesanAsset_layouts);
  swift_beginAccess();
  unint64_t v16 = *v15;
  uint64_t v17 = *(void *)(v1 + OBJC_IVAR___NTKParmesanAsset_accessibilityDescription);
  uint64_t v18 = *(void *)(v1 + OBJC_IVAR___NTKParmesanAsset_accessibilityDescription + 8);
  id v19 = (objc_class *)type metadata accessor for ParmesanAsset();
  id v20 = objc_allocWithZone(v19);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v21 = v12;
  id v22 = v14;
  swift_bridgeObjectRetain();
  id v23 = sub_246C17998(v27, v8, (uint64_t)v7, v12, (uint64_t)v26, v22, v16, v17, v10, v11, v18);

  char v24 = v28;
  v28[3] = v19;
  void *v24 = v23;
}

uint64_t sub_246C13E88()
{
  uint64_t v1 = v0;
  sub_246C2D278();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_246C2CCD8();
  swift_bridgeObjectRelease();
  sub_246C2CCD8();
  id v2 = *(id *)&v0[OBJC_IVAR___NTKParmesanAsset_preferredTimeLayout];
  id v3 = objc_msgSend(v2, sel_description);
  sub_246C2CC48();

  sub_246C2CCD8();
  swift_bridgeObjectRelease();
  sub_246C2CCD8();
  id v4 = objc_msgSend(v1, sel_preferredLayout);
  if (v4)
  {
    uint64_t v5 = v4;
    swift_bridgeObjectRetain();
  }
  sub_246B80250(&qword_2691D8830);
  sub_246C2CCA8();
  sub_246C2CCD8();
  swift_bridgeObjectRelease();
  sub_246C2CCD8();
  return 91;
}

uint64_t sub_246C14038()
{
  v11[4] = *(id *)MEMORY[0x263EF8340];
  sub_246C2B9D8();
  swift_allocObject();
  sub_246C2B9C8();
  type metadata accessor for ParmesanAsset();
  sub_246C18434(&qword_2691D8988, (void (*)(uint64_t))type metadata accessor for ParmesanAsset);
  uint64_t v1 = sub_246C2B9B8();
  unint64_t v3 = v2;
  swift_release();
  id v4 = self;
  uint64_t v5 = (void *)sub_246C2BBB8();
  v11[0] = 0;
  id v6 = objc_msgSend(v4, sel_JSONObjectWithData_options_error_, v5, 4, v11);

  if (v6)
  {
    id v7 = v11[0];
    sub_246C2D1F8();
    sub_246BD7F24(v1, v3);
    swift_unknownObjectRelease();
    sub_246B80250(&qword_2691D7070);
    if (swift_dynamicCast()) {
      return v10;
    }
  }
  else
  {
    id v8 = v11[0];
    uint64_t v9 = (void *)sub_246C2BA48();

    swift_willThrow();
    sub_246BD7F24(v1, v3);
  }
  return 0;
}

id sub_246C14360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v21[0] = a3;
  v22[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = sub_246B80250(&qword_2691D7038);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_246C2BB98();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = self;
  double v11 = (void *)sub_246C2CBA8();
  v22[0] = 0;
  id v12 = objc_msgSend(v10, sel_dataWithJSONObject_options_error_, v11, 1, v22);

  id v13 = v22[0];
  if (v12)
  {
    uint64_t v14 = sub_246C2BBC8();
    unint64_t v16 = v15;

    sub_246C2B9A8();
    swift_allocObject();
    sub_246C2B998();
    sub_246C18434(&qword_2691D8980, (void (*)(uint64_t))type metadata accessor for ParmesanAsset);
    sub_246C2B988();
    id v12 = v22[0];
    if (v21[0])
    {
      sub_246C2BA98();
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v5, v9, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
      uint64_t v19 = (uint64_t)v12 + OBJC_IVAR___NTKParmesanAsset_resourceDirectory;
      swift_beginAccess();
      sub_246C17C8C((uint64_t)v5, v19, &qword_2691D7038);
      swift_endAccess();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    sub_246C11464();
    swift_release();
    sub_246BD7F24(v14, v16);
  }
  else
  {
    uint64_t v17 = v13;
    uint64_t v18 = (void *)sub_246C2BA48();

    swift_willThrow();
  }
  return v12;
}

id sub_246C14A4C(uint64_t a1)
{
  if (*(void *)(*(void *)&v1[OBJC_IVAR___NTKParmesanAsset_preferredTimeLayout]
                 + OBJC_IVAR___NTKParmesanTimeLayout_scale) == a1)
    return objc_msgSend(v1, sel_preferredLayout);
  uint64_t v4 = (objc_class *)type metadata accessor for ParmesanTimeLayout();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR___NTKParmesanTimeLayout_alignment] = 0;
  *(void *)&v5[OBJC_IVAR___NTKParmesanTimeLayout_scale] = a1;
  v14.receiver = v5;
  v14.super_class = v4;
  id v6 = objc_msgSendSuper2(&v14, sel_init);
  uint64_t v7 = (uint64_t *)&v1[OBJC_IVAR___NTKParmesanAsset_layouts];
  swift_beginAccess();
  uint64_t v8 = *v7;
  swift_bridgeObjectRetain();
  unint64_t v2 = sub_246C10B78(v6, v8);

  swift_bridgeObjectRelease();
  if (!v2)
  {
    uint64_t v9 = (char *)objc_allocWithZone(v4);
    *(void *)&v9[OBJC_IVAR___NTKParmesanTimeLayout_alignment] = 1;
    *(void *)&v9[OBJC_IVAR___NTKParmesanTimeLayout_scale] = a1;
    v13.receiver = v9;
    v13.super_class = v4;
    id v10 = objc_msgSendSuper2(&v13, sel_init);
    uint64_t v11 = *v7;
    swift_bridgeObjectRetain();
    unint64_t v2 = sub_246C10B78(v10, v11);

    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t sub_246C14C0C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v58 = a2;
  uint64_t v4 = sub_246C2BA78();
  v57 = *(NSObject **)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246B80250(&qword_2691D7038);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246C2BB98();
  uint64_t v11 = *(NSObject **)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  objc_super v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v14 = &v2[OBJC_IVAR___NTKParmesanAsset_resourceDirectory];
  swift_beginAccess();
  uint64_t v15 = (uint64_t)v14;
  uint64_t v16 = v10;
  sub_246BB75D0(v15, (uint64_t)v9, &qword_2691D7038);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v11[6].isa)(v9, 1, v10) == 1)
  {
    sub_246B8EA34((uint64_t)v9, &qword_2691D7038);
    if (qword_2691D62D0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_246C2C088();
    sub_246B8BE0C(v17, (uint64_t)qword_2691E00C0);
    uint64_t v18 = v2;
    uint64_t v19 = sub_246C2C068();
    os_log_type_t v20 = sub_246C2CED8();
    if (os_log_type_enabled(v19, v20))
    {
      id v21 = (uint8_t *)swift_slowAlloc();
      id v22 = (void *)swift_slowAlloc();
      *(_DWORD *)id v21 = 138412290;
      v59 = v18;
      id v23 = v18;
      v57 = v11;
      uint64_t v24 = v16;
      uint64_t v25 = v23;
      sub_246C2D1C8();
      void *v22 = v18;

      uint64_t v16 = v24;
      uint64_t v11 = v57;
      _os_log_impl(&dword_246B51000, v19, v20, "No resourceDirectory on asset; cannot make imageURL for layout; (asset: %@)",
        v21,
        0xCu);
      sub_246B80250(&qword_2691D6FF0);
      swift_arrayDestroy();
      MEMORY[0x24C545990](v22, -1, -1);
      MEMORY[0x24C545990](v21, -1, -1);
    }
    else
    {

      uint64_t v19 = v18;
    }

LABEL_23:
    uint64_t v33 = 1;
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v11[7].isa)(v58, v33, 1, v16);
  }
  ((void (*)(char *, char *, uint64_t))v11[4].isa)(v13, v9, v10);
  char v26 = v13;
  if (!a1)
  {
    if (qword_2691D62D0 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_246C2C088();
    sub_246B8BE0C(v34, (uint64_t)qword_2691E00C0);
    uint64_t v35 = v2;
    v36 = sub_246C2C068();
    os_log_type_t v37 = sub_246C2CED8();
    if (os_log_type_enabled(v36, v37))
    {
      v57 = v36;
      v38 = (uint8_t *)swift_slowAlloc();
      v56 = (void *)swift_slowAlloc();
      *(_DWORD *)v38 = 138412290;
      v59 = v35;
      v39 = v35;
      v36 = v57;
      sub_246C2D1C8();
      uint64_t v40 = v56;
      void *v56 = v35;

      _os_log_impl(&dword_246B51000, v36, v37, "Provided time layout is nil; cannot fetch asset's layout; (asset: %@)",
        v38,
        0xCu);
      sub_246B80250(&qword_2691D6FF0);
      swift_arrayDestroy();
      MEMORY[0x24C545990](v40, -1, -1);
      MEMORY[0x24C545990](v38, -1, -1);
    }
    else
    {
    }
    ((void (*)(char *, uint64_t))v11[1].isa)(v26, v16);
    goto LABEL_23;
  }
  uint64_t v27 = a1;
  id v28 = a1;
  v29 = (char *)objc_msgSend(v2, sel_layoutFor_, v28);
  if (!v29)
  {
    v57 = v16;
    if (qword_2691D62D0 != -1) {
      swift_once();
    }
    uint64_t v41 = sub_246C2C088();
    sub_246B8BE0C(v41, (uint64_t)qword_2691E00C0);
    id v42 = v28;
    uint64_t v43 = v2;
    uint64_t v44 = v42;
    uint64_t v45 = v43;
    v46 = sub_246C2C068();
    os_log_type_t v47 = sub_246C2CED8();
    int v48 = v47;
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v49 = swift_slowAlloc();
      v54 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v49 = 138412546;
      LODWORD(v56) = v48;
      v55 = v46;
      v59 = v44;
      unint64_t v50 = v44;
      sub_246C2D1C8();
      v51 = v54;
      void *v54 = v27;

      *(_WORD *)(v49 + 12) = 2112;
      v59 = v45;
      v52 = v45;
      v46 = v55;
      sub_246C2D1C8();
      v51[1] = v45;

      _os_log_impl(&dword_246B51000, v46, (os_log_type_t)v56, "No layout found for provided time layout (%@) on asset (%@)", (uint8_t *)v49, 0x16u);
      sub_246B80250(&qword_2691D6FF0);
      swift_arrayDestroy();
      MEMORY[0x24C545990](v51, -1, -1);
      MEMORY[0x24C545990](v49, -1, -1);
      uint64_t v45 = v50;
    }
    else
    {
    }
    uint64_t v16 = (uint64_t)v57;
    ((void (*)(char *, NSObject *))v11[1].isa)(v26, v57);
    goto LABEL_23;
  }
  uint64_t v30 = v29;
  uint64_t v31 = *(void *)&v29[OBJC_IVAR___NTKParmesanAssetLayout_baseImageName + 8];
  v59 = *(NSObject **)&v29[OBJC_IVAR___NTKParmesanAssetLayout_baseImageName];
  uint64_t v60 = v31;
  v32 = v57;
  ((void (*)(char *, void, uint64_t))v57[13].isa)(v6, *MEMORY[0x263F06E50], v4);
  sub_246BAADBC();
  swift_bridgeObjectRetain();
  sub_246C2BB78();

  ((void (*)(char *, uint64_t))v32[1].isa)(v6, v4);
  swift_bridgeObjectRelease();
  ((void (*)(char *, uint64_t))v11[1].isa)(v26, v16);
  uint64_t v33 = 0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v11[7].isa)(v58, v33, 1, v16);
}

uint64_t sub_246C15428@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v77 = a2;
  uint64_t v4 = sub_246C2BA78();
  v76 = *(char **)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v6 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246B80250(&qword_2691D7038);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_246C2BB98();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  objc_super v13 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v14 = &v2[OBJC_IVAR___NTKParmesanAsset_resourceDirectory];
  swift_beginAccess();
  uint64_t v15 = (uint64_t)v14;
  uint64_t v16 = v10;
  sub_246BB75D0(v15, (uint64_t)v9, &qword_2691D7038);
  uint64_t v78 = v11;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_246B8EA34((uint64_t)v9, &qword_2691D7038);
    if (qword_2691D62D0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_246C2C088();
    sub_246B8BE0C(v17, (uint64_t)qword_2691E00C0);
    uint64_t v18 = v2;
    uint64_t v19 = sub_246C2C068();
    os_log_type_t v20 = sub_246C2CED8();
    if (os_log_type_enabled(v19, v20))
    {
      id v21 = (uint8_t *)swift_slowAlloc();
      id v22 = (void *)swift_slowAlloc();
      *(_DWORD *)id v21 = 138412290;
      v79[0] = (uint64_t)v18;
      uint64_t v23 = v16;
      uint64_t v24 = v18;
      sub_246C2D1C8();
      void *v22 = v18;

      uint64_t v16 = v23;
      _os_log_impl(&dword_246B51000, v19, v20, "No resourceDirectory on asset; cannot make imageMaskURL; (asset: %@)",
        v21,
        0xCu);
      sub_246B80250(&qword_2691D6FF0);
      swift_arrayDestroy();
      MEMORY[0x24C545990](v22, -1, -1);
      MEMORY[0x24C545990](v21, -1, -1);
    }
    else
    {

      uint64_t v19 = v18;
    }

    goto LABEL_29;
  }
  (*(void (**)(char *, char *, uint64_t))(v78 + 32))(v13, v9, v10);
  uint64_t v25 = v13;
  if (!a1)
  {
    if (qword_2691D62D0 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_246C2C088();
    sub_246B8BE0C(v35, (uint64_t)qword_2691E00C0);
    v36 = v2;
    os_log_type_t v37 = sub_246C2C068();
    os_log_type_t v38 = sub_246C2CED8();
    if (os_log_type_enabled(v37, v38))
    {
      v76 = v13;
      v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = (void *)swift_slowAlloc();
      *(_DWORD *)v39 = 138412290;
      v79[0] = (uint64_t)v36;
      uint64_t v41 = v36;
      sub_246C2D1C8();
      *uint64_t v40 = v36;

      uint64_t v25 = v76;
      _os_log_impl(&dword_246B51000, v37, v38, "Provided time layout is nil; cannot fetch asset's layout; (asset: %@)",
        v39,
        0xCu);
      sub_246B80250(&qword_2691D6FF0);
      swift_arrayDestroy();
      MEMORY[0x24C545990](v40, -1, -1);
      MEMORY[0x24C545990](v39, -1, -1);
    }
    else
    {
    }
    goto LABEL_22;
  }
  char v26 = a1;
  id v27 = a1;
  id v28 = (char *)objc_msgSend(v2, sel_layoutFor_, v27);
  if (!v28)
  {
    uint64_t v75 = v16;
    v76 = v25;
    if (qword_2691D62D0 != -1) {
      swift_once();
    }
    uint64_t v42 = sub_246C2C088();
    sub_246B8BE0C(v42, (uint64_t)qword_2691E00C0);
    id v43 = v27;
    uint64_t v44 = v2;
    id v45 = v43;
    v46 = v44;
    os_log_type_t v47 = sub_246C2C068();
    os_log_type_t v48 = sub_246C2CED8();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = swift_slowAlloc();
      unint64_t v50 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v49 = 138412546;
      v79[0] = (uint64_t)v45;
      id v51 = v45;
      sub_246C2D1C8();
      *unint64_t v50 = v26;

      *(_WORD *)(v49 + 12) = 2112;
      v79[0] = (uint64_t)v46;
      v52 = v46;
      sub_246C2D1C8();
      v50[1] = v46;

      _os_log_impl(&dword_246B51000, v47, v48, "No layout found for provided time layout (%@) on asset (%@)", (uint8_t *)v49, 0x16u);
      sub_246B80250(&qword_2691D6FF0);
      swift_arrayDestroy();
      MEMORY[0x24C545990](v50, -1, -1);
      MEMORY[0x24C545990](v49, -1, -1);
      v46 = (char *)v51;
    }
    else
    {
    }
    uint64_t v16 = v75;
    (*(void (**)(char *, uint64_t))(v78 + 8))(v76, v75);
    goto LABEL_29;
  }
  v29 = v28;
  uint64_t v30 = *(void *)&v28[OBJC_IVAR___NTKParmesanAssetLayout_mask];
  if (!v30)
  {
    if (qword_2691D62D0 != -1) {
      swift_once();
    }
    uint64_t v53 = sub_246C2C088();
    sub_246B8BE0C(v53, (uint64_t)qword_2691E00C0);
    v54 = v2;
    id v55 = v27;
    v56 = v54;
    id v57 = v55;
    uint64_t v58 = v56;
    v59 = sub_246C2C068();
    os_log_type_t v60 = sub_246C2CED8();
    int v61 = v60;
    if (os_log_type_enabled(v59, v60))
    {
      uint64_t v62 = swift_slowAlloc();
      v72 = (void *)swift_slowAlloc();
      uint64_t v75 = swift_slowAlloc();
      v79[0] = v75;
      *(_DWORD *)uint64_t v62 = 138412802;
      v76 = v25;
      int v74 = v61;
      id v80 = v58;
      os_log_t v73 = v59;
      v63 = v58;
      sub_246C2D1C8();
      v64 = v72;
      void *v72 = v58;

      *(_WORD *)(v62 + 12) = 2112;
      id v80 = v57;
      id v65 = v57;
      sub_246C2D1C8();
      v64[1] = v26;

      *(_WORD *)(v62 + 22) = 2080;
      id v80 = objc_msgSend(v63, sel_preferredLayout);
      sub_246B80250(&qword_2691D7DD0);
      uint64_t v66 = sub_246C2CCA8();
      id v80 = (id)sub_246BA686C(v66, v67, v79);
      sub_246C2D1C8();

      swift_bridgeObjectRelease();
      os_log_t v68 = v73;
      _os_log_impl(&dword_246B51000, v73, (os_log_type_t)v74, "No mask found on asset's layout at the provided layout index; (asset: %@); (timeLayout: (%@); (layout: %s); ",
        (uint8_t *)v62,
        0x20u);
      sub_246B80250(&qword_2691D6FF0);
      swift_arrayDestroy();
      MEMORY[0x24C545990](v64, -1, -1);
      uint64_t v34 = 1;
      uint64_t v69 = v75;
      swift_arrayDestroy();
      MEMORY[0x24C545990](v69, -1, -1);
      MEMORY[0x24C545990](v62, -1, -1);

      (*(void (**)(char *, uint64_t))(v78 + 8))(v76, v16);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v78 + 56))(v77, v34, 1, v16);
    }

LABEL_22:
    (*(void (**)(char *, uint64_t))(v78 + 8))(v25, v16);
LABEL_29:
    uint64_t v34 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v78 + 56))(v77, v34, 1, v16);
  }
  uint64_t v31 = (uint64_t *)(v30 + OBJC_IVAR___NTKParmesanAssetMask_imageName);
  uint64_t v32 = v31[1];
  v79[0] = *v31;
  v79[1] = v32;
  uint64_t v33 = v76;
  (*((void (**)(char *, void, uint64_t))v76 + 13))(v6, *MEMORY[0x263F06E50], v4);
  sub_246BAADBC();
  swift_bridgeObjectRetain();
  sub_246C2BB78();

  (*((void (**)(char *, uint64_t))v33 + 1))(v6, v4);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v78 + 8))(v25, v16);
  uint64_t v34 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v78 + 56))(v77, v34, 1, v16);
}

id sub_246C15EFC(void *a1, uint64_t a2, void *a3, void (*a4)(void *))
{
  uint64_t v7 = sub_246B80250(&qword_2691D7038);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  id v11 = a1;
  a4(a3);

  uint64_t v12 = sub_246C2BB98();
  uint64_t v13 = *(void *)(v12 - 8);
  objc_super v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v9, 1, v12) != 1)
  {
    objc_super v14 = (void *)sub_246C2BAC8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v12);
  }

  return v14;
}

unint64_t sub_246C16048()
{
  unint64_t result = qword_2691D8908;
  if (!qword_2691D8908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691D8908);
  }
  return result;
}

unint64_t sub_246C1609C()
{
  unint64_t result = qword_2691D8930;
  if (!qword_2691D8930)
  {
    sub_246B8BEB0(&qword_2691D8928);
    sub_246C18434(&qword_2691D8190, (void (*)(uint64_t))type metadata accessor for ParmesanTimeLayout);
    sub_246C18434(&qword_2691D8938, (void (*)(uint64_t))type metadata accessor for ParmesanAssetLayout);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691D8930);
  }
  return result;
}

unint64_t sub_246C16178(uint64_t a1)
{
  uint64_t v2 = sub_246C2D228();

  return sub_246C16570(a1, v2);
}

unint64_t sub_246C161C0(uint64_t a1)
{
  sub_246C2D668();
  sub_246C2D678();
  uint64_t v2 = sub_246C2D6B8();
  return sub_246C16C88(a1, v2);
}

unint64_t sub_246C16228(uint64_t a1, uint64_t a2)
{
  sub_246C2D668();
  sub_246C2CCC8();
  uint64_t v4 = sub_246C2D6B8();

  return sub_246C16638(a1, a2, v4);
}

unint64_t sub_246C162A0(uint64_t a1)
{
  sub_246C2CC48();
  sub_246C2D668();
  sub_246C2CCC8();
  uint64_t v2 = sub_246C2D6B8();
  swift_bridgeObjectRelease();

  return sub_246C1671C(a1, v2);
}

unint64_t sub_246C16334(uint64_t a1)
{
  uint64_t v2 = sub_246C2D0F8();

  return sub_246C16894(a1, v2);
}

unint64_t sub_246C1637C(unsigned __int8 a1)
{
  sub_246C2D668();
  sub_246C2CCC8();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_246C2D6B8();

  return sub_246C169A0(a1, v2);
}

unint64_t sub_246C16424(unsigned __int8 a1)
{
  sub_246C2D668();
  sub_246C2CCC8();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_246C2D6B8();

  return sub_246C16AFC(a1, v2);
}

unint64_t sub_246C164E0(uint64_t a1)
{
  sub_246C2CC48();
  sub_246C2D668();
  sub_246C2CCC8();
  uint64_t v2 = sub_246C2D6B8();
  swift_bridgeObjectRelease();
  return sub_246C1671C(a1, v2);
}

unint64_t sub_246C16570(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_246C1847C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x24C5442E0](v9, a1);
      sub_246B8E73C((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_246C16638(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_246C2D578() & 1) == 0)
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
      while (!v14 && (sub_246C2D578() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_246C1671C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_246C2CC48();
    uint64_t v8 = v7;
    if (v6 == sub_246C2CC48() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_246C2D578();
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
          uint64_t v13 = sub_246C2CC48();
          uint64_t v15 = v14;
          if (v13 == sub_246C2CC48() && v15 == v16) {
            break;
          }
          char v18 = sub_246C2D578();
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

unint64_t sub_246C16894(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for ParmesanTimeLayout();
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_246C2D108();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_246C2D108();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_246C169A0(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    while (1)
    {
      if (*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        unint64_t v7 = 0xE200000000000000;
        if (*(unsigned char *)(*(void *)(v2 + 48) + v4) == 1)
        {
          uint64_t v8 = 26466;
          int v9 = a1;
          if (!a1) {
            goto LABEL_14;
          }
        }
        else
        {
          uint64_t v8 = 26470;
          int v9 = a1;
          if (!a1)
          {
LABEL_14:
            unint64_t v11 = 0xE400000000000000;
            if (v8 != 1952541798) {
              goto LABEL_16;
            }
            goto LABEL_15;
          }
        }
      }
      else
      {
        unint64_t v7 = 0xE400000000000000;
        uint64_t v8 = 1952541798;
        int v9 = a1;
        if (!a1) {
          goto LABEL_14;
        }
      }
      if (v9 == 1) {
        uint64_t v10 = 26466;
      }
      else {
        uint64_t v10 = 26470;
      }
      unint64_t v11 = 0xE200000000000000;
      if (v8 != v10) {
        goto LABEL_16;
      }
LABEL_15:
      if (v7 == v11)
      {
        swift_bridgeObjectRelease_n();
        return v4;
      }
LABEL_16:
      char v12 = sub_246C2D578();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v6;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
  }
  return v4;
}

unint64_t sub_246C16AFC(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    while (1)
    {
      if (*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        if (*(unsigned char *)(*(void *)(v2 + 48) + v4) == 1)
        {
          unint64_t v7 = 0xE700000000000000;
          uint64_t v8 = 0x6C61727475656ELL;
          int v9 = a1;
          if (!a1) {
            goto LABEL_17;
          }
        }
        else
        {
          unint64_t v7 = 0xE400000000000000;
          uint64_t v8 = 1802658148;
          int v9 = a1;
          if (!a1)
          {
LABEL_17:
            unint64_t v11 = 0xE500000000000000;
            if (v8 != 0x746867696CLL) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }
        }
      }
      else
      {
        unint64_t v7 = 0xE500000000000000;
        uint64_t v8 = 0x746867696CLL;
        int v9 = a1;
        if (!a1) {
          goto LABEL_17;
        }
      }
      if (v9 == 1) {
        uint64_t v10 = 0x6C61727475656ELL;
      }
      else {
        uint64_t v10 = 1802658148;
      }
      if (v9 == 1) {
        unint64_t v11 = 0xE700000000000000;
      }
      else {
        unint64_t v11 = 0xE400000000000000;
      }
      if (v8 != v10) {
        goto LABEL_19;
      }
LABEL_18:
      if (v7 == v11)
      {
        swift_bridgeObjectRelease_n();
        return v4;
      }
LABEL_19:
      char v12 = sub_246C2D578();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v6;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
  }
  return v4;
}

unint64_t sub_246C16C88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_246C16D24(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_246C16334(a1);
    char v13 = v12;
    swift_bridgeObjectRelease();
    if (v13)
    {
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v9 = *v2;
      uint64_t v17 = *v2;
      *uint64_t v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_246C1B6FC();
        uint64_t v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  id v6 = (id)a1;
  uint64_t v7 = sub_246C2D358();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  uint64_t v8 = sub_246C2D348();
  uint64_t v9 = sub_246C16FF8(v5, v8);
  swift_retain();
  a1 = sub_246C16334((uint64_t)v6);
  char v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  uint64_t v15 = *(void *)(*(void *)(v9 + 56) + 8 * a1);
  sub_246C17224(a1, v9);
  *uint64_t v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_246C16E74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_246C16228(a1, a2);
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
    sub_246C1BA8C();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_246C173D8(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_246C16F44(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = sub_246C2D348();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *uint64_t v3 = sub_246C16FF8(v7, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_246C1AB58(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v10;

  return swift_bridgeObjectRelease();
}

uint64_t sub_246C16FF8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_246B80250(&qword_2691D8410);
    uint64_t v2 = sub_246C2D3E8();
    uint64_t v18 = v2;
    sub_246C2D338();
    uint64_t v3 = sub_246C2D378();
    if (v3)
    {
      uint64_t v4 = v3;
      type metadata accessor for ParmesanTimeLayout();
      do
      {
        swift_dynamicCast();
        type metadata accessor for ParmesanAssetLayout();
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_246C1987C(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_246C2D0F8();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_246C2D378();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  return v2;
}

void sub_246C17224(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_246C2D218();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        uint64_t v11 = sub_246C2D0F8();

        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            uint64_t v15 = *(void *)(a2 + 48);
            uint64_t v16 = (void *)(v15 + 8 * v3);
            uint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1) {
              *uint64_t v16 = *v17;
            }
            uint64_t v18 = *(void *)(a2 + 56);
            uint64_t v19 = (void *)(v18 + 8 * v3);
            os_log_type_t v20 = (void *)(v18 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v19 >= v20 + 1))
            {
              *uint64_t v19 = *v20;
              int64_t v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    id v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    id v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << a1) - 1;
  }
  *id v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

unint64_t sub_246C173D8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_246C2D218();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_246C2D668();
        swift_bridgeObjectRetain();
        sub_246C2CCC8();
        uint64_t v9 = sub_246C2D6B8();
        uint64_t result = swift_bridgeObjectRelease();
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
          unint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          char v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
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
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
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

void sub_246C175B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3 != sub_246C2D348()) {
    return;
  }
  int64_t v4 = 0;
  uint64_t v5 = a2 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a2 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_19;
    }
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v12 >= v9) {
      return;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        return;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13) {
        break;
      }
    }
LABEL_18:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
LABEL_19:
    uint64_t v15 = 8 * v11;
    uint64_t v16 = *(void **)(*(void *)(a2 + 56) + v15);
    id v17 = *(id *)(*(void *)(a2 + 48) + v15);
    id v18 = v16;
    uint64_t v19 = sub_246C2D358();

    if (!v19)
    {

      return;
    }
    type metadata accessor for ParmesanAssetLayout();
    swift_dynamicCast();
    char v20 = sub_246C2D108();

    if ((v20 & 1) == 0) {
      return;
    }
  }
  int64_t v14 = v12 + 2;
  if (v14 >= v9) {
    return;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_18;
    }
  }
LABEL_26:
  __break(1u);
}

unint64_t sub_246C17784(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_246B80250(&qword_2691D8940);
    uint64_t v3 = (void *)sub_246C2D3F8();
    for (unint64_t i = (unsigned char *)(a1 + 64); ; i += 40)
    {
      uint64_t v5 = *((void *)i - 4);
      uint64_t v6 = *((void *)i - 3);
      uint64_t v7 = *((void *)i - 2);
      uint64_t v8 = *((void *)i - 1);
      char v9 = *i;
      unint64_t result = sub_246C161C0(v5);
      if (v11) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v3[6] + 8 * result) = v5;
      uint64_t v12 = v3[7] + 32 * result;
      *(void *)uint64_t v12 = v6;
      *(void *)(v12 + 8) = v7;
      *(void *)(v12 + 16) = v8;
      *(unsigned char *)(v12 + 24) = v9;
      uint64_t v13 = v3[2];
      BOOL v14 = __OFADD__(v13, 1);
      uint64_t v15 = v13 + 1;
      if (v14) {
        goto LABEL_10;
      }
      v3[2] = v15;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

unint64_t sub_246C17878(void *a1)
{
  return sub_246C17890(a1, &qword_2691D8950);
}

unint64_t sub_246C17884(void *a1)
{
  return sub_246C17890(a1, &qword_2691D8948);
}

unint64_t sub_246C17890(void *a1, uint64_t *a2)
{
  uint64_t v2 = a1[2];
  if (!v2) {
    return MEMORY[0x263F8EE80];
  }
  sub_246B80250(a2);
  int64_t v4 = (void *)sub_246C2D3F8();
  uint64_t v6 = a1[4];
  uint64_t v5 = a1[5];
  unint64_t result = sub_246C161C0(v6);
  if (v8)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v4;
  }
  char v9 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v4[6] + v10) = v6;
    *(void *)(v4[7] + v10) = v5;
    uint64_t v11 = v4[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v4[2] = v13;
    if (!--v2) {
      goto LABEL_8;
    }
    BOOL v14 = v9 + 2;
    uint64_t v6 = *(v9 - 1);
    uint64_t v15 = *v9;
    swift_bridgeObjectRetain();
    unint64_t result = sub_246C161C0(v6);
    char v9 = v14;
    uint64_t v5 = v15;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_246C1798C(uint64_t a1)
{
  return sub_246C17CFC(a1, &qword_2691D89E0);
}

id sub_246C17998(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6, unint64_t a7, uint64_t a8, double a9, double a10, uint64_t a11)
{
  uint64_t v18 = (uint64_t)&v11[OBJC_IVAR___NTKParmesanAsset_modificationDate];
  uint64_t v19 = sub_246C2BC18();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  char v20 = (unint64_t *)&v11[OBJC_IVAR___NTKParmesanAsset_layouts];
  BOOL v21 = v11;
  *char v20 = sub_246C10C74(MEMORY[0x263F8EE78]);
  uint64_t v22 = &v21[OBJC_IVAR___NTKParmesanAsset_accessibilityDescription];
  *(void *)uint64_t v22 = 0;
  *((void *)v22 + 1) = 0;
  uint64_t v23 = OBJC_IVAR___NTKParmesanAsset_videoInfo;
  *(void *)&v21[OBJC_IVAR___NTKParmesanAsset_videoInfo] = 0;
  uint64_t v24 = (uint64_t)&v21[OBJC_IVAR___NTKParmesanAsset_resourceDirectory];
  uint64_t v25 = sub_246C2BB98();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v24, 1, 1, v25);
  *(void *)&v21[OBJC_IVAR___NTKParmesanAsset_photoVersion] = 10;
  uint64_t v26 = &v21[OBJC_IVAR___NTKParmesanAsset_localIdentifier];
  *(void *)uint64_t v26 = a1;
  *((void *)v26 + 1) = a2;
  swift_beginAccess();
  sub_246C17C28(a3, v18, &qword_2691D7030);
  swift_endAccess();
  id v27 = (double *)&v21[OBJC_IVAR___NTKParmesanAsset_presentationSize];
  *id v27 = a9;
  v27[1] = a10;
  id v28 = *(void **)&v21[v23];
  *(void *)&v21[v23] = a4;
  id v29 = a4;

  swift_beginAccess();
  sub_246C17C28(a5, v24, &qword_2691D7038);
  swift_endAccess();
  *(void *)&v21[OBJC_IVAR___NTKParmesanAsset_preferredTimeLayout] = a6;
  swift_beginAccess();
  *char v20 = a7;
  id v30 = a6;
  swift_bridgeObjectRelease();
  *(void *)uint64_t v22 = a8;
  *((void *)v22 + 1) = a11;

  swift_bridgeObjectRelease();
  v37.receiver = v21;
  v37.super_class = (Class)type metadata accessor for ParmesanAsset();
  id v31 = objc_msgSendSuper2(&v37, sel_init);
  sub_246B8EA34(a5, &qword_2691D7038);
  sub_246B8EA34(a3, &qword_2691D7030);
  return v31;
}

uint64_t sub_246C17C28(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_246B80250(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 24))(a2, a1, v5);
  return a2;
}

uint64_t sub_246C17C8C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_246B80250(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

unint64_t sub_246C17CF0(uint64_t a1)
{
  return sub_246C17CFC(a1, &qword_2691D8A00);
}

unint64_t sub_246C17CFC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_246B80250(a2);
    int64_t v4 = (void *)sub_246C2D3F8();
    for (unint64_t i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      uint64_t v6 = *(i - 1);
      uint64_t v7 = *i;
      unint64_t result = sub_246C161C0(v6);
      if (v9) {
        break;
      }
      *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v10 = 8 * result;
      *(void *)(v4[6] + v10) = v6;
      *(void *)(v4[7] + v10) = v7;
      uint64_t v11 = v4[2];
      BOOL v12 = __OFADD__(v11, 1);
      uint64_t v13 = v11 + 1;
      if (v12) {
        goto LABEL_10;
      }
      v4[2] = v13;
      if (!--v2) {
        return (unint64_t)v4;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

uint64_t sub_246C17DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_246C2BC18();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_246B80250(&qword_2691D8990);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_246B80250(&qword_2691D7030);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  BOOL v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  char v16 = (char *)&v44 - v15;
  if (*(void *)(a1 + OBJC_IVAR___NTKParmesanAsset_localIdentifier) != *(void *)(a2
                                                                                   + OBJC_IVAR___NTKParmesanAsset_localIdentifier)
    || *(void *)(a1 + OBJC_IVAR___NTKParmesanAsset_localIdentifier + 8) != *(void *)(a2
                                                                                       + OBJC_IVAR___NTKParmesanAsset_localIdentifier
                                                                                       + 8))
  {
    char v18 = sub_246C2D578();
    char v19 = 0;
    if ((v18 & 1) == 0) {
      return v19 & 1;
    }
  }
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  uint64_t v20 = a1 + OBJC_IVAR___NTKParmesanAsset_modificationDate;
  swift_beginAccess();
  sub_246BB75D0(v20, (uint64_t)v16, &qword_2691D7030);
  uint64_t v21 = v45;
  uint64_t v22 = v45 + OBJC_IVAR___NTKParmesanAsset_modificationDate;
  swift_beginAccess();
  uint64_t v23 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_246BB75D0((uint64_t)v16, (uint64_t)v10, &qword_2691D7030);
  sub_246BB75D0(v22, v23, &qword_2691D7030);
  uint64_t v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v24((uint64_t)v10, 1, v4) == 1)
  {
    sub_246B8EA34((uint64_t)v16, &qword_2691D7030);
    if (v24(v23, 1, v4) == 1)
    {
      sub_246B8EA34((uint64_t)v10, &qword_2691D7030);
      goto LABEL_13;
    }
LABEL_11:
    sub_246B8EA34((uint64_t)v10, &qword_2691D8990);
    char v19 = 0;
    return v19 & 1;
  }
  sub_246BB75D0((uint64_t)v10, (uint64_t)v14, &qword_2691D7030);
  if (v24(v23, 1, v4) == 1)
  {
    sub_246B8EA34((uint64_t)v16, &qword_2691D7030);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
    goto LABEL_11;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v23, v4);
  sub_246C18434(&qword_2691D8998, MEMORY[0x263F07490]);
  char v25 = sub_246C2CBF8();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v5 + 8);
  v26(v7, v4);
  sub_246B8EA34((uint64_t)v16, &qword_2691D7030);
  v26(v14, v4);
  uint64_t v21 = v45;
  sub_246B8EA34((uint64_t)v10, &qword_2691D7030);
  if ((v25 & 1) == 0) {
    goto LABEL_28;
  }
LABEL_13:
  char v19 = 0;
  uint64_t v27 = v44;
  if (*(double *)(v44 + OBJC_IVAR___NTKParmesanAsset_presentationSize) != *(double *)(v21
                                                                                     + OBJC_IVAR___NTKParmesanAsset_presentationSize)
    || *(double *)(v44 + OBJC_IVAR___NTKParmesanAsset_presentationSize + 8) != *(double *)(v21
                                                                                         + OBJC_IVAR___NTKParmesanAsset_presentationSize
                                                                                         + 8))
  {
    return v19 & 1;
  }
  id v28 = *(void **)(v44 + OBJC_IVAR___NTKParmesanAsset_videoInfo);
  id v29 = *(void **)(v21 + OBJC_IVAR___NTKParmesanAsset_videoInfo);
  if (!v28)
  {
    if (!v29) {
      goto LABEL_20;
    }
LABEL_28:
    char v19 = 0;
    return v19 & 1;
  }
  if (!v29) {
    goto LABEL_28;
  }
  type metadata accessor for ParmesanAssetVideoInfo();
  id v30 = v29;
  id v31 = v28;
  char v32 = sub_246C2D108();

  if ((v32 & 1) == 0) {
    goto LABEL_28;
  }
LABEL_20:
  uint64_t v33 = *(void *)(v27 + OBJC_IVAR___NTKParmesanAsset_preferredTimeLayout);
  uint64_t v34 = *(void *)(v21 + OBJC_IVAR___NTKParmesanAsset_preferredTimeLayout);
  if (*(void *)(v33 + OBJC_IVAR___NTKParmesanTimeLayout_alignment) != *(void *)(v34
                                                                                   + OBJC_IVAR___NTKParmesanTimeLayout_alignment))
    goto LABEL_28;
  if (*(void *)(v33 + OBJC_IVAR___NTKParmesanTimeLayout_scale) != *(void *)(v34
                                                                               + OBJC_IVAR___NTKParmesanTimeLayout_scale))
    goto LABEL_28;
  uint64_t v35 = (uint64_t *)(v27 + OBJC_IVAR___NTKParmesanAsset_layouts);
  swift_beginAccess();
  uint64_t v36 = *v35;
  objc_super v37 = (uint64_t *)(v21 + OBJC_IVAR___NTKParmesanAsset_layouts);
  swift_beginAccess();
  uint64_t v38 = *v37;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_246C138F4(v36, v38);
  char v40 = v39;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v40 & 1) == 0) {
    goto LABEL_28;
  }
  uint64_t v41 = *(void *)(v27 + OBJC_IVAR___NTKParmesanAsset_accessibilityDescription + 8);
  uint64_t v42 = *(void *)(v21 + OBJC_IVAR___NTKParmesanAsset_accessibilityDescription + 8);
  char v19 = (v41 | v42) == 0;
  if (v41 && v42)
  {
    if (*(void *)(v27 + OBJC_IVAR___NTKParmesanAsset_accessibilityDescription) == *(void *)(v21
                                                                                               + OBJC_IVAR___NTKParmesanAsset_accessibilityDescription)
      && v41 == v42)
    {
      char v19 = 1;
    }
    else
    {
      char v19 = sub_246C2D578();
    }
  }
  return v19 & 1;
}

unint64_t sub_246C18358()
{
  unint64_t result = qword_2691D89C0;
  if (!qword_2691D89C0)
  {
    sub_246B8BEB0(&qword_2691D8928);
    sub_246C18434(&qword_2691D81B8, (void (*)(uint64_t))type metadata accessor for ParmesanTimeLayout);
    sub_246C18434(&qword_2691D89C8, (void (*)(uint64_t))type metadata accessor for ParmesanAssetLayout);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691D89C0);
  }
  return result;
}

uint64_t sub_246C18434(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_246C1847C(uint64_t a1, uint64_t a2)
{
  return a2;
}

unsigned char *storeEnumTagSinglePayload for ParmesanAsset.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x246C185A4);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ParmesanAsset.CodingKeys()
{
  return &type metadata for ParmesanAsset.CodingKeys;
}

unint64_t sub_246C185E0()
{
  unint64_t result = qword_2691D8A18;
  if (!qword_2691D8A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691D8A18);
  }
  return result;
}

unint64_t sub_246C18638()
{
  unint64_t result = qword_2691D8A20;
  if (!qword_2691D8A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691D8A20);
  }
  return result;
}

unint64_t sub_246C18690()
{
  unint64_t result = qword_2691D8A28;
  if (!qword_2691D8A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2691D8A28);
  }
  return result;
}

uint64_t sub_246C186E4()
{
  unint64_t v0 = sub_246C2D428();
  swift_bridgeObjectRelease();
  if (v0 >= 7) {
    return 7;
  }
  else {
    return v0;
  }
}

void sub_246C18730(uint64_t a1, uint64_t a2)
{
  if (objc_msgSend(self, sel_isPartiallySupported_, *(void *)(a1+ OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_numerals)))
  {
    uint64_t v5 = CLKLocaleNumberSystemFromNumeralOption();
    sub_246C1D70C(v5, *(id *)(v2 + OBJC_IVAR___NTKParmesanTypefaceMetrics_device));
  }
  else
  {
    uint64_t v6 = *(void *)(v2 + OBJC_IVAR___NTKParmesanTypefaceMetrics_fontSizes);
    if (*(void *)(v6 + 16))
    {
      uint64_t v7 = sub_246C161BC(*(void *)(a1
                                   + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface));
      if (v8)
      {
        uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
        swift_bridgeObjectRetain();
        uint64_t v10 = CLKLocaleNumberSystemFromNumeralOption();
        if (*(void *)(v9 + 16)
          && (uint64_t v11 = sub_246C161BC(v10), (v12 & 1) != 0)
          && (uint64_t v13 = *(void *)(*(void *)(v9 + 56) + 8 * v11),
              swift_bridgeObjectRetain(),
              swift_bridgeObjectRelease(),
              *(void *)(v13 + 16))
          && (uint64_t v14 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout,
              sub_246C161BC(*(void *)(*(void *)(a1
                                                  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout)
                                      + OBJC_IVAR___NTKParmesanTimeLayout_scale)),
              (v15 & 1) != 0))
        {
          swift_bridgeObjectRelease();
          char v16 = *(char **)(a1 + v14);
          uint64_t v17 = *(void *)&v16[OBJC_IVAR___NTKParmesanTimeLayout_scale];
          unint64_t v18 = *(void *)&v16[OBJC_IVAR___NTKParmesanTimeLayout_alignment];
          sub_246B80250(&qword_2691D8A60);
          switch(a2)
          {
            case 0:
              if (v17 != 3 && v18 >= 2) {
                goto LABEL_26;
              }
              break;
            case 1:
              if (v17 != 3 && v18 >= 2) {
                goto LABEL_26;
              }
              break;
            case 2:
              if (v17 != 3 && v18 >= 2) {
                goto LABEL_26;
              }
              break;
            case 3:
              if (v17 != 3) {
                goto LABEL_27;
              }
              break;
            default:
              do
              {
LABEL_26:
                uint64_t v20 = v16;
                sub_246C2D568();
                __break(1u);
LABEL_27:
                ;
              }
              while (v18 >= 2);
              break;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
      }
    }
  }
}

id sub_246C189BC(uint64_t a1, uint64_t a2)
{
  double v3 = sub_246C18C3C(a1, a2);
  uint64_t v4 = *(void *)(a1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface);
  switch(v4)
  {
    case 0:
      char v11 = 0;
      char v6 = 0;
      uint64_t v7 = 0x4034000000000000;
      uint64_t v5 = 0x4079000000000000;
      uint64_t v9 = 0x4082C00000000000;
      uint64_t v10 = 0x4080E00000000000;
      char v8 = 1;
      goto LABEL_8;
    case 2:
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      char v6 = 0;
      uint64_t v7 = 0x409F400000000000;
      char v8 = 1;
      uint64_t v9 = 0x4082700000000000;
      uint64_t v10 = 0x4080980000000000;
      char v11 = 1;
LABEL_8:
      uint64_t v13 = (objc_class *)type metadata accessor for ParmesanFontAttributes();
      uint64_t v14 = (char *)objc_allocWithZone(v13);
      char v15 = &v14[OBJC_IVAR___NTKParmesanFontAttributes_soft];
      *(void *)char v15 = 0;
      v15[8] = 1;
      char v16 = &v14[OBJC_IVAR___NTKParmesanFontAttributes_grad];
      *(void *)char v16 = 0;
      v16[8] = 1;
      uint64_t v17 = &v14[OBJC_IVAR___NTKParmesanFontAttributes_opticalSize];
      v17[8] = 1;
      *(void *)uint64_t v17 = 0;
      *(void *)&v14[OBJC_IVAR___NTKParmesanFontAttributes_activeWeight] = v9;
      *(void *)&v14[OBJC_IVAR___NTKParmesanFontAttributes_tritiumWeight] = v10;
      *(double *)&v14[OBJC_IVAR___NTKParmesanFontAttributes_width] = v3;
      *(void *)char v15 = v7;
      v15[8] = v6;
      *(void *)char v16 = v5;
      v16[8] = v11;
      *(void *)uint64_t v17 = v4;
      v17[8] = v8;
      v19.receiver = v14;
      v19.super_class = v13;
      return objc_msgSendSuper2(&v19, sel_init);
    case 1:
      unint64_t v12 = *(void *)(*(void *)(a1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout)
                      + OBJC_IVAR___NTKParmesanTimeLayout_scale);
      if (v12 < 4)
      {
        char v8 = 0;
        uint64_t v5 = 0;
        uint64_t v7 = 0;
        uint64_t v4 = qword_246C383D0[v12];
        double v3 = fmin(v3 + -2.0, 30.0);
        char v11 = 1;
        uint64_t v9 = 0x4082700000000000;
        uint64_t v10 = 0x4080980000000000;
        char v6 = 1;
        goto LABEL_8;
      }
      uint64_t v20 = *(void *)(*(void *)(a1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout)
                      + OBJC_IVAR___NTKParmesanTimeLayout_scale);
      break;
    default:
      uint64_t v20 = *(void *)(a1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface);
      break;
  }
  id result = (id)sub_246C2D5A8();
  __break(1u);
  return result;
}

double sub_246C18C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + OBJC_IVAR___NTKParmesanTypefaceMetrics_fontWidths);
  if (!*(void *)(v3 + 16)) {
    return 36.0;
  }
  uint64_t v6 = sub_246C161BC(*(void *)(a1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface));
  if ((v7 & 1) == 0) {
    return 36.0;
  }
  uint64_t v8 = *(void *)(*(void *)(v3 + 56) + 8 * v6);
  swift_bridgeObjectRetain();
  uint64_t v9 = CLKLocaleNumberSystemFromNumeralOption();
  if (!*(void *)(v8 + 16)
    || (uint64_t v10 = sub_246C161BC(v9), (v11 & 1) == 0)
    || (uint64_t v12 = *(void *)(*(void *)(v8 + 56) + 8 * v10),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        !*(void *)(v12 + 16))
    || (uint64_t v13 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout,
        uint64_t v14 = sub_246C161BC(*(void *)(*(void *)(a1
                                                  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout)
                                      + OBJC_IVAR___NTKParmesanTimeLayout_scale)),
        (v15 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    return 36.0;
  }
  uint64_t v16 = *(void *)(v12 + 56) + 32 * v14;
  double v17 = *(double *)v16;
  double v18 = *(double *)(v16 + 8);
  double v19 = *(double *)(v16 + 16);
  int v20 = *(unsigned __int8 *)(v16 + 24);
  swift_bridgeObjectRelease();
  uint64_t v21 = *(char **)(a1 + v13);
  uint64_t v22 = *(void *)&v21[OBJC_IVAR___NTKParmesanTimeLayout_scale];
  unint64_t v23 = *(void *)&v21[OBJC_IVAR___NTKParmesanTimeLayout_alignment];
  sub_246B80250(&qword_2691D8A60);
  switch(a2)
  {
    case 0:
      if (v22 == 3 || v23 < 2) {
        return v17;
      }
      goto LABEL_31;
    case 1:
      if (v22 == 3) {
        goto LABEL_26;
      }
      if (v23)
      {
        double v17 = v18;
        if (v23 != 1) {
          goto LABEL_31;
        }
      }
      return v17;
    case 2:
      if (v22 == 3)
      {
LABEL_26:
        double v17 = v18;
      }
      else if (v23 != 1)
      {
        double v17 = v18;
        if (v23)
        {
LABEL_31:
          uint64_t v26 = v21;
          sub_246C2D568();
          __break(1u);
          JUMPOUT(0x246C18E4CLL);
        }
      }
      return result;
    case 3:
      if (v22 == 3)
      {
        if (v20) {
          double v17 = v18;
        }
        else {
          double v17 = v19;
        }
      }
      else
      {
        double v17 = v18;
        if (v23 >= 2) {
          goto LABEL_31;
        }
      }
      break;
    default:
      goto LABEL_31;
  }
  return v17;
}

id sub_246C18E8C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ParmesanTypefaceMetrics()
{
  return self;
}

uint64_t sub_246C18F44(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_246B80250(&qword_2691D8940);
  uint64_t result = sub_246C2D3D8();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v34 = a2;
    int64_t v8 = 0;
    uint64_t v36 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v8 << 6);
      }
      else
      {
        int64_t v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v17 >= v35) {
          goto LABEL_31;
        }
        unint64_t v18 = v36[v17];
        ++v8;
        if (!v18)
        {
          int64_t v8 = v17 + 1;
          if (v17 + 1 >= v35) {
            goto LABEL_31;
          }
          unint64_t v18 = v36[v8];
          if (!v18)
          {
            int64_t v19 = v17 + 2;
            if (v19 >= v35)
            {
LABEL_31:
              if ((v34 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
              if (v33 >= 64) {
                bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v36 = -1 << v33;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v18 = v36[v19];
            if (!v18)
            {
              while (1)
              {
                int64_t v8 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v35) {
                  goto LABEL_31;
                }
                unint64_t v18 = v36[v8];
                ++v19;
                if (v18) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v19;
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      uint64_t v20 = *(void *)(*(void *)(v5 + 48) + 8 * v16);
      uint64_t v21 = *(void *)(v5 + 56) + 32 * v16;
      char v22 = *(unsigned char *)(v21 + 24);
      uint64_t v23 = *(void *)(v21 + 16);
      uint64_t v25 = *(void *)v21;
      uint64_t v24 = *(void *)(v21 + 8);
      sub_246C2D668();
      sub_246C2D678();
      uint64_t result = sub_246C2D6B8();
      uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v12 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v27) & ~*(void *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_39;
          }
          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v12 + 8 * v28);
        }
        while (v32 == -1);
        unint64_t v13 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(void *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v7 + 48) + 8 * v13) = v20;
      uint64_t v14 = *(void *)(v7 + 56) + 32 * v13;
      *(void *)uint64_t v14 = v25;
      *(void *)(v14 + 8) = v24;
      *(void *)(v14 + 16) = v23;
      *(unsigned char *)(v14 + 24) = v22;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_246C19230(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_246B80250(&qword_2691D8A10);
  char v38 = a2;
  uint64_t v6 = sub_246C2D3D8();
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
    char v22 = (void *)(v5 + 64);
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
    char v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_246C2D668();
    sub_246C2CCC8();
    uint64_t result = sub_246C2D6B8();
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
  char v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_246C19540(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_246B80250(&qword_2691D8958);
  char v35 = a2;
  uint64_t v6 = sub_246C2D3D8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v5 + 64;
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
      unint64_t v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v16 = v15 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v17 >= v33) {
      break;
    }
    unint64_t v18 = (void *)(v5 + 64);
    unint64_t v19 = *(void *)(v34 + 8 * v17);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v17 + 1;
      if (v17 + 1 >= v33) {
        goto LABEL_34;
      }
      unint64_t v19 = *(void *)(v34 + 8 * v13);
      if (!v19)
      {
        int64_t v20 = v17 + 2;
        if (v20 >= v33)
        {
LABEL_34:
          swift_release();
          if ((v35 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v19 = *(void *)(v34 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            int64_t v13 = v20 + 1;
            if (__OFADD__(v20, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v33) {
              goto LABEL_34;
            }
            unint64_t v19 = *(void *)(v34 + 8 * v13);
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
    unint64_t v16 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_22:
    int64_t v21 = *(void **)(*(void *)(v5 + 48) + 8 * v16);
    char v22 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v16);
    if (v35)
    {
      sub_246BAAFEC(v22, v36);
    }
    else
    {
      sub_246B8E790((uint64_t)v22, (uint64_t)v36);
      id v23 = v21;
    }
    sub_246C2CC48();
    sub_246C2D668();
    sub_246C2CCC8();
    uint64_t v24 = sub_246C2D6B8();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = v24 & ~v25;
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
          goto LABEL_42;
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
    *(void *)(*(void *)(v7 + 48) + 8 * v14) = v21;
    uint64_t result = (uint64_t)sub_246BAAFEC(v36, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v18 = (void *)(v5 + 64);
  if ((v35 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v18, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v18 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_246C1987C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_246B80250(&qword_2691D8410);
  uint64_t v6 = sub_246C2D3D8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  int64_t v36 = v2;
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
    id v23 = (void *)(v5 + 64);
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
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_246C2D0F8();
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
  id v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_246C19B50(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_246B80250(&qword_2691D89D0);
  uint64_t v6 = sub_246C2D3D8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    id v34 = (void *)(v5 + 64);
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
                  *id v34 = -1 << v32;
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
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_246BAAFEC(v24, v35);
      }
      else
      {
        sub_246B8E790((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_246C2D668();
      sub_246C2CCC8();
      uint64_t result = sub_246C2D6B8();
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
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      void *v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_246BAAFEC(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_246C19E50(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_246B80250(&qword_2691D8A90);
  char v36 = a2;
  uint64_t v6 = sub_246C2D3D8();
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
      swift_retain();
    }
    sub_246C2D668();
    sub_246C2CCC8();
    uint64_t result = sub_246C2D6B8();
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
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_246C1A168(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_246B80250(&qword_2691D7098);
  uint64_t v6 = sub_246C2D3D8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
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
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_246BAAFEC((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_246C1847C(v25, (uint64_t)&v38);
      sub_246B8E790(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_246C2D228();
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_246BAAFEC(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_246C1A480(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_246B80250(&qword_2691D8A00);
  uint64_t result = sub_246C2D3D8();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v33 = a2;
    int64_t v8 = 0;
    uint64_t v9 = (void *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v13) {
          goto LABEL_31;
        }
        unint64_t v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v20 = v9[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_31:
              if ((v33 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_38;
              }
              uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
              if (v32 >= 64) {
                bzero((void *)(v5 + 64), ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v9 = -1 << v32;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v20 = v9[v8];
                ++v21;
                if (v20) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_21:
        unint64_t v12 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      uint64_t v22 = 8 * v18;
      uint64_t v23 = *(void *)(*(void *)(v5 + 48) + v22);
      uint64_t v24 = *(void *)(*(void *)(v5 + 56) + v22);
      sub_246C2D668();
      sub_246C2D678();
      uint64_t result = sub_246C2D6B8();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_39;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t v16 = 8 * v15;
      *(void *)(*(void *)(v7 + 48) + v16) = v23;
      *(void *)(*(void *)(v7 + 56) + v16) = v24;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

int64_t sub_246C1A754(uint64_t a1, char a2, uint64_t a3, char a4, double a5, double a6)
{
  uint64_t v7 = (void **)v6;
  uint64_t v14 = (void *)*v6;
  unint64_t v16 = sub_246C161BC(a3);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  int64_t result = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v20 = v15;
  int64_t v21 = v14[3];
  if (v21 < result || (a4 & 1) == 0)
  {
    if (v21 >= result && (a4 & 1) == 0)
    {
      int64_t result = (int64_t)sub_246C1B1D4();
      goto LABEL_9;
    }
    sub_246C18F44(result, a4 & 1);
    int64_t result = sub_246C161BC(a3);
    if ((v20 & 1) == (v22 & 1))
    {
      unint64_t v16 = result;
      goto LABEL_9;
    }
LABEL_15:
    int64_t result = sub_246C2D5E8();
    __break(1u);
    return result;
  }
LABEL_9:
  int v23 = a2 & 1;
  uint64_t v24 = *v7;
  if (v20)
  {
    uint64_t v25 = v24[7] + 32 * v16;
    *(double *)uint64_t v25 = a5;
    *(double *)(v25 + 8) = a6;
    *(void *)(v25 + 16) = a1;
    *(unsigned char *)(v25 + 24) = v23 != 0;
  }
  else
  {
    return sub_246C1B0AC(v16, a3, a1, v23, v24, a5, a6);
  }
  return result;
}

void sub_246C1A8A4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_246C16228(a2, a3);
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
    sub_246C1B380();
LABEL_7:
    BOOL v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_246C19230(v15, a4 & 1);
  unint64_t v20 = sub_246C16228(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_246C2D5E8();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  BOOL v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v22 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v22 = a2;
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

_OWORD *sub_246C1AA14(_OWORD *a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_246C162A0((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 < v12 || (a3 & 1) == 0)
  {
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_246C1B534();
      goto LABEL_7;
    }
    sub_246C19540(v12, a3 & 1);
    unint64_t v18 = sub_246C162A0((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      unint64_t v9 = v18;
      uint64_t v15 = *v4;
      if (v13) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    type metadata accessor for Key(0);
    int64_t result = (_OWORD *)sub_246C2D5E8();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v15 = *v4;
  if (v13)
  {
LABEL_8:
    char v16 = (_OWORD *)(v15[7] + 32 * v9);
    sub_246B8EB94((uint64_t)v16);
    return sub_246BAAFEC(a1, v16);
  }
LABEL_13:
  sub_246C1B100(v9, (uint64_t)a2, a1, v15);

  return a2;
}

void sub_246C1AB58(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_246C16334((uint64_t)a2);
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
    sub_246C1B6FC();
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
  sub_246C1987C(v12, a3 & 1);
  unint64_t v17 = sub_246C16334((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    type metadata accessor for ParmesanTimeLayout();
    sub_246C2D5E8();
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

_OWORD *sub_246C1ACBC(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_246C16228(a2, a3);
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
      sub_246C1B8A4();
      goto LABEL_7;
    }
    sub_246C19B50(v15, a4 & 1);
    unint64_t v21 = sub_246C16228(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      char v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    int64_t result = (_OWORD *)sub_246C2D5E8();
    __break(1u);
    return result;
  }
LABEL_7:
  char v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_246B8EB94((uint64_t)v19);
    return sub_246BAAFEC(a1, v19);
  }
LABEL_13:
  sub_246C1B168(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_246C1AE10(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_246C16228(a2, a3);
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
    sub_246C1BA8C();
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
  sub_246C19E50(v15, a4 & 1);
  unint64_t v21 = sub_246C16228(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_246C2D5E8();
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
  id v23 = (uint64_t *)(v18[6] + 16 * v12);
  *id v23 = a2;
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

uint64_t sub_246C1AF80(uint64_t a1, char a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_246C161BC(a1);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a2 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a2 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_246C1BE2C();
LABEL_7:
    char v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(double *)(v16[7] + 8 * v10) = a3;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v18 = 8 * v10;
    *(void *)(v16[6] + v18) = a1;
    *(double *)(v16[7] + v18) = a3;
    uint64_t v19 = v16[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_246C1A480(result, a2 & 1);
  uint64_t result = sub_246C161BC(a1);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    char v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for CLKDeviceSizeClass(0);
  uint64_t result = sub_246C2D5E8();
  __break(1u);
  return result;
}

unint64_t sub_246C1B0AC(unint64_t result, uint64_t a2, uint64_t a3, char a4, void *a5, double a6, double a7)
{
  a5[(result >> 6) + 8] |= 1 << result;
  *(void *)(a5[6] + 8 * result) = a2;
  uint64_t v7 = a5[7] + 32 * result;
  *(double *)uint64_t v7 = a6;
  *(double *)(v7 + 8) = a7;
  *(void *)(v7 + 16) = a3;
  *(unsigned char *)(v7 + 24) = a4 & 1;
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

_OWORD *sub_246C1B100(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_246BAAFEC(a3, (_OWORD *)(a4[7] + 32 * a1));
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

_OWORD *sub_246C1B168(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_246BAAFEC(a4, (_OWORD *)(a5[7] + 32 * a1));
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

void *sub_246C1B1D4()
{
  uint64_t v1 = v0;
  sub_246B80250(&qword_2691D8940);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_246C2D3C8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
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
    unint64_t v27 = __clz(__rbit64(v25));
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = v27 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    uint64_t v19 = *(void *)(v2 + 56) + v18;
    uint64_t v20 = *(void *)(v19 + 16);
    char v21 = *(unsigned char *)(v19 + 24);
    long long v22 = *(_OWORD *)v19;
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t v23 = *(void *)(v4 + 56) + v18;
    *(_OWORD *)uint64_t v23 = v22;
    *(void *)(v23 + 16) = v20;
    *(unsigned char *)(v23 + 24) = v21;
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

id sub_246C1B380()
{
  uint64_t v1 = v0;
  sub_246B80250(&qword_2691D8A10);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_246C2D3C8();
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
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
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

id sub_246C1B534()
{
  uint64_t v1 = v0;
  sub_246B80250(&qword_2691D8958);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_246C2D3C8();
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_246B8E790(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    sub_246BAAFEC(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_246C1B6FC()
{
  uint64_t v1 = v0;
  sub_246B80250(&qword_2691D8410);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_246C2D3C8();
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
    uint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
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

void *sub_246C1B8A4()
{
  uint64_t v1 = v0;
  sub_246B80250(&qword_2691D89D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_246C2D3C8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t v25 = v1;
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
    sub_246B8E790(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_246BAAFEC(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
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

void *sub_246C1BA8C()
{
  uint64_t v1 = v0;
  sub_246B80250(&qword_2691D8A90);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_246C2D3C8();
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
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_retain();
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

void *sub_246C1BC44()
{
  uint64_t v1 = v0;
  sub_246B80250(&qword_2691D7098);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_246C2D3C8();
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_246C1847C(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_246B8E790(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    id result = sub_246BAAFEC(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_246C1BE2C()
{
  uint64_t v1 = v0;
  sub_246B80250(&qword_2691D8A00);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_246C2D3C8();
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
    unint64_t v21 = __clz(__rbit64(v19));
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = v21 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
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

unint64_t sub_246C1BFBC(void *a1)
{
  uint64_t v1 = (char *)objc_msgSend(a1, sel_sizeClass);
  if ((unint64_t)(v1 - 3) > 5) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_246C383F0[(void)(v1 - 3)];
  }
  uint64_t v3 = 8 * v2;
  double v4 = (double)*(uint64_t *)((char *)&unk_26FB1C4C0 + v3 + 32);
  double v5 = (double)*(uint64_t *)((char *)&unk_26FB1C518 + v3 + 32);
  double v6 = (double)*(uint64_t *)((char *)&unk_26FB1C570 + v3 + 32);
  double v7 = (double)*(uint64_t *)((char *)&unk_26FB1C5C8 + v3 + 32);
  double v8 = (double)*(uint64_t *)((char *)&unk_26FB1C620 + v3 + 32);
  sub_246B80250(&qword_2691D8A88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246C36F70;
  *(void *)(inited + 32) = 0;
  *(double *)(inited + 40) = v5;
  *(double *)(inited + 48) = v4;
  *(void *)(inited + 56) = 0;
  *(unsigned char *)(inited + 64) = 1;
  *(void *)(inited + 72) = 1;
  *(double *)(inited + 80) = v5;
  *(double *)(inited + 88) = v4;
  *(void *)(inited + 96) = 0;
  *(unsigned char *)(inited + 104) = 1;
  *(void *)(inited + 112) = 2;
  *(double *)(inited + 120) = v8;
  *(double *)(inited + 128) = v6;
  *(void *)(inited + 136) = 0;
  *(unsigned char *)(inited + 144) = 1;
  *(void *)(inited + 152) = 3;
  *(double *)(inited + 160) = v8;
  *(double *)(inited + 168) = v7;
  *(double *)(inited + 176) = v6;
  *(unsigned char *)(inited + 184) = 0;
  unint64_t v10 = sub_246C17784(inited);
  swift_setDeallocating();
  return v10;
}

unint64_t sub_246C1C118(void *a1)
{
  uint64_t v2 = (char *)objc_msgSend(a1, sel_sizeClass);
  if ((unint64_t)(v2 - 3) > 5) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_246C383F0[(void)(v2 - 3)];
  }
  uint64_t v4 = 8 * v3;
  double v5 = (double)*(uint64_t *)((char *)&unk_26FB1C678 + v4 + 32);
  double v6 = (double)*(uint64_t *)((char *)&unk_26FB1C6D0 + v4 + 32);
  unint64_t v7 = sub_246C1BFBC(a1);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_246C1A754(0, 1, 0, isUniquelyReferenced_nonNull_native, v6, v5);
  swift_bridgeObjectRelease();
  return v7;
}

unint64_t sub_246C1C1E4(void *a1)
{
  uint64_t v2 = (char *)objc_msgSend(a1, sel_sizeClass);
  if ((unint64_t)(v2 - 3) > 5) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_246C383F0[(void)(v2 - 3)];
  }
  uint64_t v4 = 8 * v3;
  double v5 = (double)*(uint64_t *)((char *)&unk_26FB1C728 + v4 + 32);
  double v6 = (double)*(uint64_t *)((char *)&unk_26FB1C780 + v4 + 32);
  unint64_t v7 = sub_246C1BFBC(a1);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_246C1A754(0, 1, 0, isUniquelyReferenced_nonNull_native, v6, v5);
  swift_bridgeObjectRelease();
  return v7;
}

unint64_t sub_246C1C2B0(void *a1)
{
  uint64_t v2 = (char *)objc_msgSend(a1, sel_sizeClass);
  if ((unint64_t)(v2 - 3) > 5) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_246C383F0[(void)(v2 - 3)];
  }
  uint64_t v4 = 8 * v3;
  double v5 = (double)*(uint64_t *)((char *)&unk_26FB1C7D8 + v4 + 32);
  double v6 = (double)*(uint64_t *)((char *)&unk_26FB1C830 + v4 + 32);
  double v7 = (double)*(uint64_t *)((char *)&unk_26FB1C888 + v4 + 32);
  double v8 = (double)*(uint64_t *)((char *)&unk_26FB1C8E0 + v4 + 32);
  unint64_t v9 = sub_246C1BFBC(a1);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_246C1A754(0, 1, 0, isUniquelyReferenced_nonNull_native, v6, v5);
  swift_bridgeObjectRelease();
  char v11 = swift_isUniquelyReferenced_nonNull_native();
  sub_246C1A754(0, 1, 2, v11, v8, v7);
  swift_bridgeObjectRelease();
  return v9;
}

unint64_t sub_246C1C3E4(void *a1)
{
  uint64_t v2 = (char *)objc_msgSend(a1, sel_sizeClass);
  if ((unint64_t)(v2 - 3) > 5) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_246C383F0[(void)(v2 - 3)];
  }
  uint64_t v4 = 8 * v3;
  double v5 = (double)*(uint64_t *)((char *)&unk_26FB1C938 + v4 + 32);
  double v6 = (double)*(uint64_t *)((char *)&unk_26FB1C990 + v4 + 32);
  double v7 = (double)*(uint64_t *)((char *)&unk_26FB1C9E8 + v4 + 32);
  double v8 = (double)*(uint64_t *)((char *)&unk_26FB1CA40 + v4 + 32);
  unint64_t v9 = sub_246C1BFBC(a1);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_246C1A754(0, 1, 0, isUniquelyReferenced_nonNull_native, v6, v5);
  swift_bridgeObjectRelease();
  char v11 = swift_isUniquelyReferenced_nonNull_native();
  sub_246C1A754(0, 1, 2, v11, v8, v7);
  swift_bridgeObjectRelease();
  return v9;
}

unint64_t sub_246C1C518(void *a1)
{
  uint64_t v1 = (char *)objc_msgSend(a1, sel_sizeClass);
  if ((unint64_t)(v1 - 3) > 5) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_246C383F0[(void)(v1 - 3)];
  }
  uint64_t v3 = 8 * v2;
  double v4 = (double)*(uint64_t *)((char *)&unk_26FB1CA98 + v3 + 32);
  double v5 = (double)*(uint64_t *)((char *)&unk_26FB1CAF0 + v3 + 32);
  double v6 = (double)*(uint64_t *)((char *)&unk_26FB1CB48 + v3 + 32);
  double v7 = (double)*(uint64_t *)((char *)&unk_26FB1CBA0 + v3 + 32);
  double v8 = (double)*(uint64_t *)((char *)&unk_26FB1CBF8 + v3 + 32);
  double v9 = (double)*(uint64_t *)((char *)&unk_26FB1CC50 + v3 + 32);
  double v10 = (double)*(uint64_t *)((char *)&unk_26FB1CCA8 + v3 + 32);
  sub_246B80250(&qword_2691D8A88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246C36F70;
  *(void *)(inited + 32) = 0;
  *(double *)(inited + 40) = v4;
  *(double *)(inited + 48) = v9;
  *(void *)(inited + 56) = 0;
  *(unsigned char *)(inited + 64) = 1;
  *(void *)(inited + 72) = 1;
  *(double *)(inited + 80) = v7;
  *(double *)(inited + 88) = v10;
  *(void *)(inited + 96) = 0;
  *(unsigned char *)(inited + 104) = 1;
  *(void *)(inited + 112) = 2;
  *(double *)(inited + 120) = v5;
  *(double *)(inited + 128) = v8;
  *(void *)(inited + 136) = 0;
  *(unsigned char *)(inited + 144) = 1;
  *(void *)(inited + 152) = 3;
  *(double *)(inited + 160) = v5;
  *(double *)(inited + 168) = v6;
  *(double *)(inited + 176) = v8;
  *(unsigned char *)(inited + 184) = 0;
  unint64_t v12 = sub_246C17784(inited);
  swift_setDeallocating();
  return v12;
}

unint64_t sub_246C1C6A4(void *a1)
{
  uint64_t v1 = (char *)objc_msgSend(a1, sel_sizeClass);
  if ((unint64_t)(v1 - 3) > 5) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_246C383F0[(void)(v1 - 3)];
  }
  uint64_t v3 = 8 * v2;
  double v4 = (double)*(uint64_t *)((char *)&unk_26FB1CD00 + v3 + 32);
  double v15 = (double)*(uint64_t *)((char *)&unk_26FB1CD58 + v3 + 32);
  double v5 = (double)*(uint64_t *)((char *)&unk_26FB1CDB0 + v3 + 32);
  double v6 = (double)*(uint64_t *)((char *)&unk_26FB1CE08 + v3 + 32);
  double v7 = (double)*(uint64_t *)((char *)&unk_26FB1CE60 + v3 + 32);
  double v8 = (double)*(uint64_t *)((char *)&unk_26FB1CEB8 + v3 + 32);
  double v9 = (double)*(uint64_t *)((char *)&unk_26FB1CF10 + v3 + 32);
  double v10 = (double)*(uint64_t *)((char *)&unk_26FB1CF68 + v3 + 32);
  double v11 = (double)*(uint64_t *)((char *)&unk_26FB1CFC0 + v3 + 32);
  sub_246B80250(&qword_2691D8A88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246C36F70;
  *(void *)(inited + 32) = 0;
  *(double *)(inited + 40) = v4;
  *(double *)(inited + 48) = v10;
  *(void *)(inited + 56) = 0;
  *(unsigned char *)(inited + 64) = 1;
  *(void *)(inited + 72) = 1;
  *(double *)(inited + 80) = v7;
  *(double *)(inited + 88) = v11;
  *(void *)(inited + 96) = 0;
  *(unsigned char *)(inited + 104) = 1;
  *(void *)(inited + 112) = 2;
  *(double *)(inited + 120) = v5;
  *(double *)(inited + 128) = v9;
  *(void *)(inited + 136) = 0;
  *(unsigned char *)(inited + 144) = 1;
  *(void *)(inited + 152) = 3;
  *(double *)(inited + 160) = v15;
  *(double *)(inited + 168) = v6;
  *(double *)(inited + 176) = v8;
  *(unsigned char *)(inited + 184) = 0;
  unint64_t v13 = sub_246C17784(inited);
  swift_setDeallocating();
  return v13;
}

unint64_t sub_246C1C860(void *a1)
{
  uint64_t v1 = (char *)objc_msgSend(a1, sel_sizeClass);
  if ((unint64_t)(v1 - 3) > 5) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_246C383F0[(void)(v1 - 3)];
  }
  uint64_t v3 = 8 * v2;
  double v4 = (double)*(uint64_t *)((char *)&unk_26FB1D018 + v3 + 32);
  double v5 = (double)*(uint64_t *)((char *)&unk_26FB1D070 + v3 + 32);
  double v6 = (double)*(uint64_t *)((char *)&unk_26FB1D0C8 + v3 + 32);
  double v7 = (double)*(uint64_t *)((char *)&unk_26FB1D120 + v3 + 32);
  double v8 = (double)*(uint64_t *)((char *)&unk_26FB1D178 + v3 + 32);
  double v9 = (double)*(uint64_t *)((char *)&unk_26FB1D1D0 + v3 + 32);
  double v10 = (double)*(uint64_t *)((char *)&unk_26FB1D228 + v3 + 32);
  double v11 = (double)*(uint64_t *)((char *)&unk_26FB1D280 + v3 + 32);
  sub_246B80250(&qword_2691D8A88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246C36F70;
  *(void *)(inited + 32) = 0;
  *(double *)(inited + 40) = v4;
  *(double *)(inited + 48) = v9;
  *(void *)(inited + 56) = 0;
  *(unsigned char *)(inited + 64) = 1;
  *(void *)(inited + 72) = 1;
  *(double *)(inited + 80) = v6;
  *(double *)(inited + 88) = v10;
  *(void *)(inited + 96) = 0;
  *(unsigned char *)(inited + 104) = 1;
  *(void *)(inited + 112) = 2;
  *(double *)(inited + 120) = v5;
  *(double *)(inited + 128) = v8;
  *(void *)(inited + 136) = 0;
  *(unsigned char *)(inited + 144) = 1;
  *(void *)(inited + 152) = 3;
  *(double *)(inited + 160) = v11;
  *(double *)(inited + 168) = v11;
  *(double *)(inited + 176) = v7;
  *(unsigned char *)(inited + 184) = 0;
  unint64_t v13 = sub_246C17784(inited);
  swift_setDeallocating();
  return v13;
}

unint64_t sub_246C1CA00(void *a1)
{
  uint64_t v1 = (char *)objc_msgSend(a1, sel_sizeClass);
  if ((unint64_t)(v1 - 3) > 5) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_246C383F0[(void)(v1 - 3)];
  }
  uint64_t v3 = 8 * v2;
  double v4 = (double)*(uint64_t *)((char *)&unk_26FB1D2D8 + v3 + 32);
  double v15 = (double)*(uint64_t *)((char *)&unk_26FB1D330 + v3 + 32);
  double v5 = (double)*(uint64_t *)((char *)&unk_26FB1D388 + v3 + 32);
  double v6 = (double)*(uint64_t *)((char *)&unk_26FB1D3E0 + v3 + 32);
  double v7 = (double)*(uint64_t *)((char *)&unk_26FB1D438 + v3 + 32);
  double v8 = (double)*(uint64_t *)((char *)&unk_26FB1D490 + v3 + 32);
  double v9 = (double)*(uint64_t *)((char *)&unk_26FB1D4E8 + v3 + 32);
  double v10 = (double)*(uint64_t *)((char *)&unk_26FB1D540 + v3 + 32);
  double v11 = (double)*(uint64_t *)((char *)&unk_26FB1D598 + v3 + 32);
  sub_246B80250(&qword_2691D8A88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246C36F70;
  *(void *)(inited + 32) = 0;
  *(double *)(inited + 40) = v4;
  *(double *)(inited + 48) = v10;
  *(void *)(inited + 56) = 0;
  *(unsigned char *)(inited + 64) = 1;
  *(void *)(inited + 72) = 1;
  *(double *)(inited + 80) = v7;
  *(double *)(inited + 88) = v11;
  *(void *)(inited + 96) = 0;
  *(unsigned char *)(inited + 104) = 1;
  *(void *)(inited + 112) = 2;
  *(double *)(inited + 120) = v5;
  *(double *)(inited + 128) = v9;
  *(void *)(inited + 136) = 0;
  *(unsigned char *)(inited + 144) = 1;
  *(void *)(inited + 152) = 3;
  *(double *)(inited + 160) = v15;
  *(double *)(inited + 168) = v6;
  *(double *)(inited + 176) = v8;
  *(unsigned char *)(inited + 184) = 0;
  unint64_t v13 = sub_246C17784(inited);
  swift_setDeallocating();
  return v13;
}

unint64_t sub_246C1CBBC(void *a1)
{
  uint64_t v1 = (char *)objc_msgSend(a1, sel_sizeClass);
  if ((unint64_t)(v1 - 3) > 5) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_246C383F0[(void)(v1 - 3)];
  }
  uint64_t v3 = 8 * v2;
  double v4 = (double)*(uint64_t *)((char *)&unk_26FB1D5F0 + v3 + 32);
  double v5 = (double)*(uint64_t *)((char *)&unk_26FB1D648 + v3 + 32);
  double v6 = (double)*(uint64_t *)((char *)&unk_26FB1D6A0 + v3 + 32);
  double v7 = (double)*(uint64_t *)((char *)&unk_26FB1D6F8 + v3 + 32);
  double v8 = (double)*(uint64_t *)((char *)&unk_26FB1D750 + v3 + 32);
  double v9 = (double)*(uint64_t *)((char *)&unk_26FB1D7A8 + v3 + 32);
  double v10 = (double)*(uint64_t *)((char *)&unk_26FB1D800 + v3 + 32);
  double v11 = (double)*(uint64_t *)((char *)&unk_26FB1D858 + v3 + 32);
  sub_246B80250(&qword_2691D8A88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246C36F70;
  *(void *)(inited + 32) = 0;
  *(double *)(inited + 40) = v4;
  *(double *)(inited + 48) = v10;
  *(void *)(inited + 56) = 0;
  *(unsigned char *)(inited + 64) = 1;
  *(void *)(inited + 72) = 1;
  *(double *)(inited + 80) = v8;
  *(double *)(inited + 88) = v11;
  *(void *)(inited + 96) = 0;
  *(unsigned char *)(inited + 104) = 1;
  *(void *)(inited + 112) = 2;
  *(double *)(inited + 120) = v5;
  *(double *)(inited + 128) = v9;
  *(void *)(inited + 136) = 0;
  *(unsigned char *)(inited + 144) = 1;
  *(void *)(inited + 152) = 3;
  *(double *)(inited + 160) = v4;
  *(double *)(inited + 168) = v6;
  *(double *)(inited + 176) = v7;
  *(unsigned char *)(inited + 184) = 0;
  unint64_t v13 = sub_246C17784(inited);
  swift_setDeallocating();
  return v13;
}

unint64_t sub_246C1CD5C(void *a1)
{
  uint64_t v1 = (char *)objc_msgSend(a1, sel_sizeClass);
  if ((unint64_t)(v1 - 3) > 5) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_246C383F0[(void)(v1 - 3)];
  }
  uint64_t v3 = 8 * v2;
  double v4 = (double)*(uint64_t *)((char *)&unk_26FB1D8B0 + v3 + 32);
  double v15 = (double)*(uint64_t *)((char *)&unk_26FB1D908 + v3 + 32);
  double v5 = (double)*(uint64_t *)((char *)&unk_26FB1D960 + v3 + 32);
  double v6 = (double)*(uint64_t *)((char *)&unk_26FB1D9B8 + v3 + 32);
  double v7 = (double)*(uint64_t *)((char *)&unk_26FB1DA10 + v3 + 32);
  double v8 = (double)*(uint64_t *)((char *)&unk_26FB1DA68 + v3 + 32);
  double v9 = (double)*(uint64_t *)((char *)&unk_26FB1DAC0 + v3 + 32);
  double v10 = (double)*(uint64_t *)((char *)&unk_26FB1DB18 + v3 + 32);
  double v11 = (double)*(uint64_t *)((char *)&unk_26FB1DB70 + v3 + 32);
  sub_246B80250(&qword_2691D8A88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246C36F70;
  *(void *)(inited + 32) = 0;
  *(double *)(inited + 40) = v4;
  *(double *)(inited + 48) = v10;
  *(void *)(inited + 56) = 0;
  *(unsigned char *)(inited + 64) = 1;
  *(void *)(inited + 72) = 1;
  *(double *)(inited + 80) = v6;
  *(double *)(inited + 88) = v11;
  *(void *)(inited + 96) = 0;
  *(unsigned char *)(inited + 104) = 1;
  *(void *)(inited + 112) = 2;
  *(double *)(inited + 120) = v5;
  *(double *)(inited + 128) = v9;
  *(void *)(inited + 136) = 0;
  *(unsigned char *)(inited + 144) = 1;
  *(void *)(inited + 152) = 3;
  *(double *)(inited + 160) = v15;
  *(double *)(inited + 168) = v7;
  *(double *)(inited + 176) = v8;
  *(unsigned char *)(inited + 184) = 0;
  unint64_t v13 = sub_246C17784(inited);
  swift_setDeallocating();
  return v13;
}

unint64_t sub_246C1CF18(void *a1)
{
  uint64_t v1 = (char *)objc_msgSend(a1, sel_sizeClass);
  if ((unint64_t)(v1 - 3) > 5) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_246C383F0[(void)(v1 - 3)];
  }
  uint64_t v3 = 8 * v2;
  double v4 = (double)*(uint64_t *)((char *)&unk_26FB1DBC8 + v3 + 32);
  double v15 = (double)*(uint64_t *)((char *)&unk_26FB1DC20 + v3 + 32);
  double v5 = (double)*(uint64_t *)((char *)&unk_26FB1DC78 + v3 + 32);
  double v6 = (double)*(uint64_t *)((char *)&unk_26FB1DCD0 + v3 + 32);
  double v7 = (double)*(uint64_t *)((char *)&unk_26FB1DD28 + v3 + 32);
  double v8 = (double)*(uint64_t *)((char *)&unk_26FB1DD80 + v3 + 32);
  double v9 = (double)*(uint64_t *)((char *)&unk_26FB1DDD8 + v3 + 32);
  double v10 = (double)*(uint64_t *)((char *)&unk_26FB1DE30 + v3 + 32);
  double v11 = (double)*(uint64_t *)((char *)&unk_26FB1DE88 + v3 + 32);
  sub_246B80250(&qword_2691D8A88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246C36F70;
  *(void *)(inited + 32) = 0;
  *(double *)(inited + 40) = v4;
  *(double *)(inited + 48) = v10;
  *(void *)(inited + 56) = 0;
  *(unsigned char *)(inited + 64) = 1;
  *(void *)(inited + 72) = 1;
  *(double *)(inited + 80) = v6;
  *(double *)(inited + 88) = v11;
  *(void *)(inited + 96) = 0;
  *(unsigned char *)(inited + 104) = 1;
  *(void *)(inited + 112) = 2;
  *(double *)(inited + 120) = v5;
  *(double *)(inited + 128) = v9;
  *(void *)(inited + 136) = 0;
  *(unsigned char *)(inited + 144) = 1;
  *(void *)(inited + 152) = 3;
  *(double *)(inited + 160) = v15;
  *(double *)(inited + 168) = v7;
  *(double *)(inited + 176) = v8;
  *(unsigned char *)(inited + 184) = 0;
  unint64_t v13 = sub_246C17784(inited);
  swift_setDeallocating();
  return v13;
}

unint64_t sub_246C1D0D4(void *a1)
{
  uint64_t v1 = (char *)objc_msgSend(a1, sel_sizeClass);
  if ((unint64_t)(v1 - 3) > 5) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_246C383F0[(void)(v1 - 3)];
  }
  uint64_t v3 = 8 * v2;
  double v4 = (double)*(uint64_t *)((char *)&unk_26FB1DEE0 + v3 + 32);
  double v5 = (double)*(uint64_t *)((char *)&unk_26FB1DF38 + v3 + 32);
  double v6 = (double)*(uint64_t *)((char *)&unk_26FB1DF90 + v3 + 32);
  double v7 = (double)*(uint64_t *)((char *)&unk_26FB1DFE8 + v3 + 32);
  double v8 = (double)*(uint64_t *)((char *)&unk_26FB1E040 + v3 + 32);
  double v9 = (double)*(uint64_t *)((char *)&unk_26FB1E098 + v3 + 32);
  double v10 = (double)*(uint64_t *)((char *)&unk_26FB1E0F0 + v3 + 32);
  sub_246B80250(&qword_2691D8A88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246C36F70;
  *(void *)(inited + 32) = 0;
  *(double *)(inited + 40) = v4;
  *(double *)(inited + 48) = v9;
  *(void *)(inited + 56) = 0;
  *(unsigned char *)(inited + 64) = 1;
  *(void *)(inited + 72) = 1;
  *(double *)(inited + 80) = v6;
  *(double *)(inited + 88) = v10;
  *(void *)(inited + 96) = 0;
  *(unsigned char *)(inited + 104) = 1;
  *(void *)(inited + 112) = 2;
  *(double *)(inited + 120) = v4;
  *(double *)(inited + 128) = v8;
  *(void *)(inited + 136) = 0;
  *(unsigned char *)(inited + 144) = 1;
  *(void *)(inited + 152) = 3;
  *(double *)(inited + 160) = v4;
  *(double *)(inited + 168) = v5;
  *(double *)(inited + 176) = v7;
  *(unsigned char *)(inited + 184) = 0;
  unint64_t v12 = sub_246C17784(inited);
  swift_setDeallocating();
  return v12;
}

id sub_246C1D260(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR___NTKParmesanTypefaceMetrics_fallbackFontWidth] = 0x4042000000000000;
  *(void *)&v1[OBJC_IVAR___NTKParmesanTypefaceMetrics_fallbackFontSize] = 0x4060C00000000000;
  uint64_t v3 = OBJC_IVAR___NTKParmesanTypefaceMetrics_scale;
  *(void *)&v1[OBJC_IVAR___NTKParmesanTypefaceMetrics_scale] = 0x4000000000000000;
  *(void *)&v1[OBJC_IVAR___NTKParmesanTypefaceMetrics_device] = a1;
  uint64_t v42 = v1;
  id v4 = a1;
  objc_msgSend(v4, sel_screenScale);
  *(void *)&v1[v3] = v5;
  sub_246B80250(&qword_2691D8A68);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246C35F20;
  *(void *)(inited + 32) = 0;
  unint64_t v7 = sub_246C1BFBC(v4);
  unint64_t v8 = sub_246C1BFBC(v4);
  unint64_t v9 = sub_246C1BFBC(v4);
  sub_246B80250(&qword_2691D8A70);
  uint64_t v10 = swift_initStackObject();
  *(_OWORD *)(v10 + 16) = xmmword_246C35F20;
  *(void *)(v10 + 32) = 0;
  *(void *)(v10 + 40) = v7;
  *(void *)(v10 + 48) = 1;
  *(void *)(v10 + 56) = v8;
  *(void *)(v10 + 64) = 2;
  *(void *)(v10 + 72) = v9;
  unint64_t v11 = sub_246C17878((void *)v10);
  swift_setDeallocating();
  sub_246B80250(&qword_2691D8A78);
  swift_arrayDestroy();
  *(void *)(inited + 40) = v11;
  *(void *)(inited + 48) = 1;
  unint64_t v12 = sub_246C1BFBC(v4);
  unint64_t v13 = sub_246C1C118(v4);
  unint64_t v14 = sub_246C1C1E4(v4);
  uint64_t v15 = swift_initStackObject();
  *(void *)(v15 + 32) = 0;
  *(_OWORD *)(v15 + 16) = xmmword_246C35F20;
  *(void *)(v15 + 40) = v12;
  *(void *)(v15 + 48) = 1;
  *(void *)(v15 + 56) = v13;
  *(void *)(v15 + 64) = 2;
  *(void *)(v15 + 72) = v14;
  unint64_t v16 = sub_246C17878((void *)v15);
  swift_setDeallocating();
  swift_arrayDestroy();
  *(void *)(inited + 56) = v16;
  *(void *)(inited + 64) = 2;
  unint64_t v17 = sub_246C1BFBC(v4);
  unint64_t v18 = sub_246C1C2B0(v4);
  unint64_t v19 = sub_246C1C3E4(v4);
  uint64_t v20 = swift_initStackObject();
  *(void *)(v20 + 32) = 0;
  *(_OWORD *)(v20 + 16) = xmmword_246C35F20;
  *(void *)(v20 + 40) = v17;
  *(void *)(v20 + 48) = 1;
  *(void *)(v20 + 56) = v18;
  *(void *)(v20 + 64) = 2;
  *(void *)(v20 + 72) = v19;
  unint64_t v21 = sub_246C17878((void *)v20);
  swift_setDeallocating();
  swift_arrayDestroy();
  *(void *)(inited + 72) = v21;
  unint64_t v22 = sub_246C17884((void *)inited);
  swift_setDeallocating();
  sub_246B80250(&qword_2691D8A80);
  swift_arrayDestroy();
  *(void *)&v42[OBJC_IVAR___NTKParmesanTypefaceMetrics_fontSizes] = v22;
  uint64_t v23 = swift_initStackObject();
  *(_OWORD *)(v23 + 16) = xmmword_246C35F20;
  *(void *)(v23 + 32) = 0;
  unint64_t v24 = sub_246C1C518(v4);
  unint64_t v25 = sub_246C1C6A4(v4);
  unint64_t v26 = sub_246C1C860(v4);
  uint64_t v27 = swift_initStackObject();
  *(void *)(v27 + 32) = 0;
  *(_OWORD *)(v27 + 16) = xmmword_246C35F20;
  *(void *)(v27 + 40) = v24;
  *(void *)(v27 + 48) = 1;
  *(void *)(v27 + 56) = v25;
  *(void *)(v27 + 64) = 2;
  *(void *)(v27 + 72) = v26;
  unint64_t v28 = sub_246C17878((void *)v27);
  swift_setDeallocating();
  swift_arrayDestroy();
  *(void *)(v23 + 40) = v28;
  *(void *)(v23 + 48) = 1;
  unint64_t v29 = sub_246C1CA00(v4);
  unint64_t v30 = sub_246C1CBBC(v4);
  unint64_t v31 = sub_246C1CD5C(v4);
  uint64_t v32 = swift_initStackObject();
  *(void *)(v32 + 32) = 0;
  *(_OWORD *)(v32 + 16) = xmmword_246C35F20;
  *(void *)(v32 + 40) = v29;
  *(void *)(v32 + 48) = 1;
  *(void *)(v32 + 56) = v30;
  *(void *)(v32 + 64) = 2;
  *(void *)(v32 + 72) = v31;
  unint64_t v33 = sub_246C17878((void *)v32);
  swift_setDeallocating();
  swift_arrayDestroy();
  *(void *)(v23 + 56) = v33;
  *(void *)(v23 + 64) = 2;
  unint64_t v34 = sub_246C1CF18(v4);
  unint64_t v35 = sub_246C1C6A4(v4);
  unint64_t v36 = sub_246C1D0D4(v4);
  uint64_t v37 = swift_initStackObject();
  *(void *)(v37 + 32) = 0;
  *(_OWORD *)(v37 + 16) = xmmword_246C35F20;
  *(void *)(v37 + 40) = v34;
  *(void *)(v37 + 48) = 1;
  *(void *)(v37 + 56) = v35;
  *(void *)(v37 + 64) = 2;
  *(void *)(v37 + 72) = v36;
  unint64_t v38 = sub_246C17878((void *)v37);
  swift_setDeallocating();
  swift_arrayDestroy();
  *(void *)(v23 + 72) = v38;
  unint64_t v39 = sub_246C17884((void *)v23);
  swift_setDeallocating();
  swift_arrayDestroy();
  *(void *)&v42[OBJC_IVAR___NTKParmesanTypefaceMetrics_fontWidths] = v39;

  v43.receiver = v42;
  v43.super_class = ObjectType;
  return objc_msgSendSuper2(&v43, sel_init);
}

double sub_246C1D70C(uint64_t a1, id a2)
{
  uint64_t v3 = (char *)objc_msgSend(a2, sel_sizeClass);
  if ((unint64_t)(v3 - 3) > 5) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_246C383F0[(void)(v3 - 3)];
  }
  if ((unint64_t)(a1 - 3) <= 0xB) {
    return (double)*((uint64_t *)*(&off_2651FC838 + a1 - 3) + v5);
  }
  return result;
}

uint64_t sub_246C1D794(uint64_t a1)
{
  uint64_t result = (uint64_t)objc_msgSend(self, sel_isPartiallySupported_, *(void *)(a1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_numerals));
  if (result)
  {
    unint64_t v3 = sub_246C269A0((unint64_t)objc_msgSend(*(id *)(a1+ OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_device), sel_sizeClass));
    uint64_t v4 = CLKLocaleNumberSystemFromNumeralOption();
    if (*(void *)(v3 + 16)) {
      sub_246C161BC(v4);
    }
    return swift_bridgeObjectRelease();
  }
  else if (*(void *)(a1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface) >= 3uLL)
  {
    uint64_t result = sub_246C2D5A8();
    __break(1u);
  }
  return result;
}

id sub_246C1DA64()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ParmseanPassthroughView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ParmseanPassthroughView()
{
  return self;
}

unint64_t sub_246C1DABC()
{
  unint64_t result = qword_2691D7D10;
  if (!qword_2691D7D10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2691D7D10);
  }
  return result;
}

uint64_t sub_246C1DAFC(unint64_t a1)
{
  return sub_246C1DB24(a1, (unint64_t *)&qword_2691D83A8);
}

uint64_t sub_246C1DB10(unint64_t a1)
{
  return sub_246C1DB24(a1, (unint64_t *)&qword_2691D7120);
}

uint64_t sub_246C1DB24(unint64_t a1, unint64_t *a2)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_246C2D3B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (!v4) {
    return v5;
  }
  uint64_t v15 = MEMORY[0x263F8EE78];
  uint64_t result = sub_246C00B8C(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        MEMORY[0x24C544350](i, a1);
        sub_246B8F1E0(0, a2);
        swift_dynamicCast();
        uint64_t v5 = v15;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_246C00B8C(0, *(void *)(v5 + 16) + 1, 1);
          uint64_t v5 = v15;
        }
        unint64_t v9 = *(void *)(v5 + 16);
        unint64_t v8 = *(void *)(v5 + 24);
        if (v9 >= v8 >> 1)
        {
          sub_246C00B8C(v8 > 1, v9 + 1, 1);
          uint64_t v5 = v15;
        }
        *(void *)(v5 + 16) = v9 + 1;
        sub_246BAAFEC(v14, (_OWORD *)(v5 + 32 * v9 + 32));
      }
    }
    else
    {
      uint64_t v10 = (id *)(a1 + 32);
      sub_246B8F1E0(0, a2);
      do
      {
        id v11 = *v10;
        swift_dynamicCast();
        uint64_t v5 = v15;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_246C00B8C(0, *(void *)(v5 + 16) + 1, 1);
          uint64_t v5 = v15;
        }
        unint64_t v13 = *(void *)(v5 + 16);
        unint64_t v12 = *(void *)(v5 + 24);
        if (v13 >= v12 >> 1)
        {
          sub_246C00B8C(v12 > 1, v13 + 1, 1);
          uint64_t v5 = v15;
        }
        *(void *)(v5 + 16) = v13 + 1;
        sub_246BAAFEC(v14, (_OWORD *)(v5 + 32 * v13 + 32));
        ++v10;
        --v4;
      }
      while (v4);
    }
    return v5;
  }
  __break(1u);
  return result;
}

char *sub_246C1DD78(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView_maskingView;
  id v10 = objc_allocWithZone((Class)type metadata accessor for ParmseanPassthroughView());
  id v11 = v4;
  *(void *)&v4[v9] = objc_msgSend(v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(void *)&v11[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView_backdropMarginWidth] = 0;
  *(void *)&v11[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView_backdropFilters] = MEMORY[0x263F8EE78];
  unint64_t v12 = &v11[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView_backdropGroupName];
  *(void *)unint64_t v12 = 0;
  *((void *)v12 + 1) = 0;

  v34.receiver = v11;
  v34.super_class = (Class)type metadata accessor for ParmesanMaskedBackdropView();
  id v13 = objc_msgSendSuper2(&v34, sel_initWithFrame_, a1, a2, a3, a4);
  unint64_t v14 = (objc_class *)type metadata accessor for ParmesanBackdropView();
  v33.receiver = v13;
  v33.super_class = v14;
  uint64_t v15 = (char *)v13;
  id v16 = objc_msgSendSuper2(&v33, sel_layer);
  self;
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setMarginWidth_, *(double *)&v15[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView_backdropMarginWidth]);

  v32.receiver = v15;
  v32.super_class = v14;
  id v17 = objc_msgSendSuper2(&v32, sel_layer);
  self;
  unint64_t v18 = (void *)swift_dynamicCastObjCClassUnconditional();
  unint64_t v19 = swift_bridgeObjectRetain();
  sub_246C1DB24(v19, (unint64_t *)&qword_2691D83A8);
  swift_bridgeObjectRelease();
  uint64_t v20 = (void *)sub_246C2CD28();
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setFilters_, v20);

  v31.receiver = v15;
  v31.super_class = v14;
  id v21 = objc_msgSendSuper2(&v31, sel_layer);
  self;
  unint64_t v22 = (void *)swift_dynamicCastObjCClassUnconditional();
  if (*(void *)&v15[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView_backdropGroupName
                     + 8])
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = (void *)sub_246C2CC08();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v23 = 0;
  }
  objc_msgSend(v22, sel_setGroupName_, v23);

  uint64_t v24 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView_maskingView;
  id v25 = *(id *)&v15[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView_maskingView];
  objc_msgSend(v15, sel_bounds);
  objc_msgSend(v25, sel_setFrame_);

  id v26 = objc_msgSend(*(id *)&v15[v24], sel_layer);
  sub_246C2CC48();
  id v27 = objc_allocWithZone(MEMORY[0x263F157C8]);
  unint64_t v28 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();
  id v29 = objc_msgSend(v27, sel_initWithType_, v28);

  objc_msgSend(v26, sel_setCompositingFilter_, v29);
  objc_msgSend(v15, sel_addSubview_, *(void *)&v15[v24]);

  return v15;
}

uint64_t sub_246C1E268()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

id sub_246C1E2BC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ParmesanMaskedBackdropView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ParmesanMaskedBackdropView()
{
  return self;
}

void sub_246C1E374()
{
  uint64_t v1 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView_maskingView;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ParmseanPassthroughView()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(void *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView_backdropMarginWidth] = 0;
  *(void *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView_backdropFilters] = MEMORY[0x263F8EE78];
  objc_super v2 = &v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion26ParmesanMaskedBackdropView_backdropGroupName];
  *(void *)objc_super v2 = 0;
  *((void *)v2 + 1) = 0;

  sub_246C2D3A8();
  __break(1u);
}

char *sub_246C1E43C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, double a7, double a8, double a9, double a10)
{
  if (a5) {
    id v19 = a5;
  }
  else {
    id v19 = sub_246BE86A4(a4);
  }
  id v20 = a5;
  if (objc_msgSend(a6, sel_isVibrantOption)) {
    id v21 = 0;
  }
  else {
    id v21 = objc_msgSend(a6, sel_primaryColor);
  }
  id v22 = objc_allocWithZone((Class)type metadata accessor for ParmesanGalleryView());
  uint64_t v23 = sub_246BE1364(a1, a2, a3, v19, v21, 0, a7, a8, a9, a10);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v23;
}

void sub_246C1E618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  id v10 = sub_246BE86A4(a1);
  uint64_t v11 = *(void *)(v4 + OBJC_IVAR___NTKParmesanGalleryView_currentItem);
  if (v11)
  {
    unint64_t v12 = *(void **)(v11 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition);
    if (v12)
    {
      type metadata accessor for ParmesanAssetComposition();
      uint64_t v13 = swift_dynamicCastClass();
      if (v13)
      {
        uint64_t v14 = *(void *)(v13 + OBJC_IVAR___NTKParmesanAssetComposition_asset);
        id v15 = v12;
        id v16 = sub_246BD79D8(v14, a1);

        id v10 = v16;
      }
    }
  }
  id v17 = *(void **)(*(void *)(*(void *)(v4 + OBJC_IVAR___NTKParmesanGalleryView_timeView)
                             + OBJC_IVAR___NTKParmesanTimeView_appearance)
                 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_device);
  unint64_t v18 = (objc_class *)type metadata accessor for ParmesanTimeAppearance();
  id v19 = (char *)objc_allocWithZone(v18);
  *(void *)&v19[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout] = v10;
  *(void *)&v19[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_device] = v17;
  *(void *)&v19[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface] = a2;
  *(void *)&v19[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_numerals] = a3;
  v39.receiver = v19;
  v39.super_class = v18;
  id v20 = v10;
  id v21 = v17;
  id v22 = objc_msgSendSuper2(&v39, sel_init);
  sub_246BC4DA4(v22);
  uint64_t v23 = OBJC_IVAR___NTKParmesanGalleryView_contentEffect;
  uint64_t v24 = *(void *)(v4 + OBJC_IVAR___NTKParmesanGalleryView_contentEffect);
  if (v24)
  {
    id v25 = *(void **)(v24 + OBJC_IVAR___NTKParmesanGalleryContentEffect_palette);
    id v26 = (objc_class *)type metadata accessor for ParmesanGalleryContentEffect();
    id v27 = (char *)objc_allocWithZone(v26);
    *(void *)&v27[OBJC_IVAR___NTKParmesanGalleryContentEffect_styleOption] = a4;
    *(void *)&v27[OBJC_IVAR___NTKParmesanGalleryContentEffect_palette] = v25;
    id v28 = v25;
    id v29 = v27;
    uint64_t v30 = sub_246BF0274(a4, v28);
    objc_super v31 = (uint64_t *)&v29[OBJC_IVAR___NTKParmesanGalleryContentEffect_style];
    *objc_super v31 = v30;
    v31[1] = v32;
    v31[2] = v33;
    v31[3] = v34;

    v38.receiver = v29;
    v38.super_class = v26;
    id v35 = objc_msgSendSuper2(&v38, sel_init);

    unint64_t v36 = *(void **)(v5 + v23);
  }
  else
  {
    unint64_t v36 = 0;
    id v35 = 0;
  }
  *(void *)(v5 + v23) = v35;
  id v37 = v35;

  sub_246BE1158();
}

void sub_246C1E8DC(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_246C1EB48()
{
  uint64_t v1 = (double *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_targetSize];
  if ((v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_targetSize
         + 16] & 1) != 0
    || (double v4 = v1[1], v4 <= 0.0)
    || (double v5 = *v1, *v1 <= 0.0))
  {
    objc_super v2 = *(void **)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_contentView];
    if (v2)
    {
      v15.a = 1.0;
      v15.b = 0.0;
      v15.c = 0.0;
      v15.d = 1.0;
      v15.tx = 0.0;
      v15.ty = 0.0;
      objc_msgSend(v2, sel_setTransform_, &v15);
    }
    v14.receiver = v0;
    v14.super_class = (Class)type metadata accessor for PreviewScalingView();
    return objc_msgSendSuper2(&v14, sel_layoutSubviews);
  }
  else
  {
    objc_msgSend(v0, sel_bounds);
    double v7 = v6 / v5;
    objc_msgSend(v0, sel_bounds);
    if (v8 / v4 < v7) {
      double v7 = v8 / v4;
    }
    double v9 = *(double *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_targetCornerRadius];
    if (v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_targetCornerRadius
          + 8])
      double v9 = 0.0;
    double v10 = v9 * v7;
    id v11 = objc_msgSend(v0, sel_layer);
    objc_msgSend(v11, sel_setCornerRadius_, v10);

    uint64_t v12 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_contentView;
    id result = *(id *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_contentView];
    if (result)
    {
      id result = objc_msgSend(result, sel_setFrame_, 0.0, 0.0, v5, v4);
      uint64_t v13 = *(void **)&v0[v12];
      if (v13)
      {
        CGAffineTransformMakeScale(&v15, v7, v7);
        return objc_msgSend(v13, sel_setTransform_, &v15);
      }
    }
  }
  return result;
}

id sub_246C1ED28()
{
  return sub_246C20BA0(0, type metadata accessor for PreviewScalingView);
}

uint64_t type metadata accessor for PreviewScalingView()
{
  return self;
}

id sub_246C1ED78(void *a1, void *a2, void *a3)
{
  swift_unknownObjectWeakInit();
  v3[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_hasLoadedPreview] = 0;
  uint64_t v7 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_indicatorView;
  id v8 = objc_allocWithZone(MEMORY[0x263F823E8]);
  double v9 = v3;
  *(void *)&v3[v7] = objc_msgSend(v8, sel_initWithActivityIndicatorStyle_, 100);
  *(void *)&v9[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_frameContentView] = 0;
  *(void *)&v9[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_sourceFace] = a1;
  *(void *)&v9[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_device] = a2;
  *(void *)&v9[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_upgradeManager] = a3;
  id v10 = a1;
  id v11 = a2;
  id v12 = a3;

  v15.receiver = v9;
  v15.super_class = (Class)type metadata accessor for ParmesanUpgradeOptInViewController();
  id result = objc_msgSendSuper2(&v15, sel_init);
  if (result)
  {
    id v14 = result;
    objc_msgSend(v14, sel_setStyle_, 66);

    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_246C1EF20(void *a1)
{
  sub_246B8F1E0(0, (unint64_t *)&qword_2691D6DC0);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v3 = a1;
  double v4 = (void *)sub_246C2CC08();
  double v5 = (void *)sub_246C2CC08();
  id v6 = objc_msgSend(ObjCClassFromMetadata, sel_localizedStringForKey_comment_, v4, v5);

  sub_246C2CC48();
  uint64_t v7 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return v7;
}

void sub_246C1F050()
{
  uint64_t v1 = (objc_class *)type metadata accessor for ParmesanUpgradeOptInViewController();
  v17.receiver = v0;
  v17.super_class = v1;
  objc_msgSendSuper2(&v17, sel_loadView);
  v16[3] = v1;
  v16[0] = v0;
  id v2 = v0;
  id v3 = (void *)sub_246C2CC08();
  if (v1)
  {
    double v4 = sub_246B8F7E8(v16, (uint64_t)v1);
    uint64_t v5 = *((void *)v1 - 1);
    MEMORY[0x270FA5388](v4);
    uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    uint64_t v8 = sub_246C2D558();
    (*(void (**)(char *, objc_class *))(v5 + 8))(v7, v1);
    sub_246B8EB94((uint64_t)v16);
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_allocWithZone(MEMORY[0x263F824A8]);
  id v10 = objc_msgSend(v9, sel_initWithTitle_style_target_action_, v3, 0, v8, sel_cancelTapped_, v16[0]);

  swift_unknownObjectRelease();
  id v11 = objc_msgSend(v2, sel_navigationItem);
  objc_msgSend(v11, sel_setLeftBarButtonItem_, v10);

  id v12 = objc_msgSend(v2, sel_navigationController);
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = objc_msgSend(v12, sel_navigationBar);

    id v15 = objc_msgSend(self, sel_tintColor);
    objc_msgSend(v14, sel_setTintColor_, v15);
  }
}

id sub_246C1F2E4(char a1)
{
  uint64_t v3 = sub_246B80250(&qword_2691D6FB0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)type metadata accessor for ParmesanUpgradeOptInViewController();
  v26.receiver = v1;
  v26.super_class = v6;
  id result = objc_msgSendSuper2(&v26, sel_viewWillAppear_, a1 & 1);
  uint64_t v8 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_hasLoadedPreview;
  if ((v1[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_hasLoadedPreview] & 1) == 0)
  {
    id v9 = *(void **)&v1[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_indicatorView];
    sub_246C1F698(v9);
    id result = objc_msgSend(v9, sel_startAnimating);
    if ((v1[v8] & 1) == 0)
    {
      v1[v8] = 1;
      id v10 = *(char **)&v1[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_upgradeManager];
      uint64_t v11 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v12 = *(void *)&v10[OBJC_IVAR___NTKParmesanUpgradeManager_resourceDirectory + 8];
      if (v12)
      {
        uint64_t v13 = *(void *)&v10[OBJC_IVAR___NTKParmesanUpgradeManager_upgradeContext];
        if (v13)
        {
          uint64_t v14 = *(void *)&v10[OBJC_IVAR___NTKParmesanUpgradeManager_resourceDirectory];
          uint64_t v15 = sub_246C2CE28();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v5, 1, 1, v15);
          id v16 = (void *)swift_allocObject();
          v16[2] = 0;
          v16[3] = 0;
          void v16[4] = v10;
          v16[5] = v13;
          v16[6] = sub_246C232CC;
          v16[7] = v11;
          v16[8] = v14;
          v16[9] = v12;
          swift_retain_n();
          swift_bridgeObjectRetain();
          swift_unknownObjectRetain();
          objc_super v17 = v10;
          sub_246B9B9B8((uint64_t)v5, (uint64_t)&unk_2691D8B40, (uint64_t)v16);
          swift_release();
LABEL_13:
          swift_release_n();
          return (id)swift_release();
        }
        uint64_t v20 = qword_2691D6318;
        swift_retain_n();
        if (v20 != -1) {
          swift_once();
        }
        uint64_t v21 = sub_246C2C088();
        sub_246B8BE0C(v21, (uint64_t)qword_2691E0198);
        id v22 = sub_246C2C068();
        os_log_type_t v23 = sub_246C2CEE8();
        if (os_log_type_enabled(v22, v23))
        {
          uint64_t v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v24 = 0;
          _os_log_impl(&dword_246B51000, v22, v23, "No upgrade context provided, bailing on preview view", v24, 2u);
          MEMORY[0x24C545990](v24, -1, -1);
        }

        sub_246BA3D40();
        sub_246BAAA7C();
        unint64_t v18 = (void *)swift_allocError();
        *id v25 = 0;
      }
      else
      {
        sub_246BAAA7C();
        unint64_t v18 = (void *)swift_allocError();
        *id v19 = 1;
        swift_retain_n();
      }
      sub_246C1FD64(0, v18, v11);

      goto LABEL_13;
    }
  }
  return result;
}

void sub_246C1F698(void *a1)
{
  id v2 = v1;
  uint64_t v4 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_frameContentView;
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_frameContentView], sel_removeFromSuperview);
  id v5 = objc_msgSend(v1, sel_illustratedWatchView);
  if (!v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v6 = v5;
  objc_msgSend(v5, sel_addSubview_, a1);

  id v7 = objc_msgSend(v2, sel_illustratedWatchView);
  if (!v7)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v8 = v7;
  objc_msgSend(v7, sel_watchScreenInsetGuide);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  objc_msgSend(a1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  sub_246B80250((uint64_t *)&unk_2691D6A80);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_246C37DF0;
  id v18 = objc_msgSend(a1, sel_leadingAnchor);
  id v19 = objc_msgSend(v2, sel_illustratedWatchView);
  if (!v19)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v20 = v19;
  id v21 = objc_msgSend(v19, sel_leadingAnchor);

  id v22 = objc_msgSend(v18, sel_constraintEqualToAnchor_constant_, v21, v10);
  *(void *)(v17 + 32) = v22;
  id v23 = objc_msgSend(a1, sel_topAnchor);
  id v24 = objc_msgSend(v2, sel_illustratedWatchView);
  if (!v24)
  {
LABEL_11:
    __break(1u);
    return;
  }
  id v25 = v24;
  objc_super v26 = self;
  id v27 = objc_msgSend(v25, sel_topAnchor);

  id v28 = objc_msgSend(v23, sel_constraintEqualToAnchor_constant_, v27, v12);
  *(void *)(v17 + 40) = v28;
  id v29 = objc_msgSend(a1, sel_widthAnchor);
  id v30 = objc_msgSend(v29, sel_constraintEqualToConstant_, v14);

  *(void *)(v17 + 48) = v30;
  id v31 = objc_msgSend(a1, sel_heightAnchor);
  id v32 = objc_msgSend(v31, sel_constraintEqualToConstant_, v16);

  *(void *)(v17 + 56) = v32;
  sub_246C2CD58();
  sub_246B8F1E0(0, (unint64_t *)&qword_2691D8B30);
  uint64_t v33 = (void *)sub_246C2CD28();
  swift_bridgeObjectRelease();
  objc_msgSend(v26, sel_activateConstraints_, v33);

  id v35 = *(id *)&v2[v4];
  *(void *)&v2[v4] = a1;
  id v34 = a1;
}

void sub_246C1F9D0()
{
  uint64_t v1 = v0;
  if (qword_2691D6318 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_246C2C088();
  sub_246B8BE0C(v2, (uint64_t)qword_2691E0198);
  uint64_t v3 = sub_246C2C068();
  os_log_type_t v4 = sub_246C2CED8();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_246B51000, v3, v4, "User tapped Cancel", v5, 2u);
    MEMORY[0x24C545990](v5, -1, -1);
  }

  sub_246BA3D40();
  id v6 = objc_msgSend(v1, sel_presentingViewController);
  if (v6)
  {
    id v7 = v6;
    objc_msgSend(v6, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
}

uint64_t sub_246C1FB38()
{
  id v1 = objc_msgSend(v0, sel_navigationItem);
  id v2 = objc_msgSend(v1, sel_leftBarButtonItem);

  if (v2)
  {
    objc_msgSend(v2, sel_setEnabled_, 0);
  }
  id v3 = objc_msgSend(v0, sel_buttonTray);
  id v4 = objc_msgSend(v3, sel_allButtons);

  sub_246B8F1E0(0, &qword_2691D7D08);
  unint64_t v5 = sub_246C2CD38();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_246C2D3B8();
    uint64_t v6 = result;
    if (!result) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v6) {
      goto LABEL_12;
    }
  }
  if (v6 < 1)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v6; ++i)
  {
    if ((v5 & 0xC000000000000001) != 0) {
      id v9 = (id)MEMORY[0x24C544350](i, v5);
    }
    else {
      id v9 = *(id *)(v5 + 8 * i + 32);
    }
    double v10 = v9;
    objc_msgSend(v9, sel_showsBusyIndicator);
  }
LABEL_12:
  swift_bridgeObjectRelease_n();

  return sub_246C20604();
}

uint64_t sub_246C1FCF0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  id v6 = a1;
  sub_246C2D1F8();
  uint64_t v7 = swift_unknownObjectRelease();
  a4(v7);

  return sub_246B8EB94((uint64_t)&v9);
}

void sub_246C1FD64(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a3 + 16;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x24C545A70](v5);
  if (v6)
  {
    uint64_t v7 = (unsigned char *)v6;
    objc_msgSend(*(id *)(v6 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_indicatorView), sel_stopAnimating);
    if (a2)
    {
      v7[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_hasLoadedPreview] = 0;
      id v8 = a2;
      if (qword_2691D6318 != -1) {
        swift_once();
      }
      uint64_t v9 = sub_246C2C088();
      sub_246B8BE0C(v9, (uint64_t)qword_2691E0198);
      id v10 = a2;
      id v11 = a2;
      double v12 = sub_246C2C068();
      os_log_type_t v13 = sub_246C2CEE8();
      if (os_log_type_enabled(v12, v13))
      {
        double v14 = (uint8_t *)swift_slowAlloc();
        double v15 = (void *)swift_slowAlloc();
        *(_DWORD *)double v14 = 138412290;
        id v16 = a2;
        uint64_t v41 = _swift_stdlib_bridgeErrorToNSError();
        sub_246C2D1C8();
        void *v15 = v41;

        _os_log_impl(&dword_246B51000, v12, v13, "Upgrade preview generation failed: %@", v14, 0xCu);
        sub_246B80250(&qword_2691D6FF0);
        swift_arrayDestroy();
        MEMORY[0x24C545990](v15, -1, -1);
        MEMORY[0x24C545990](v14, -1, -1);

        return;
      }
    }
    else
    {
      if (a1)
      {
        uint64_t v17 = qword_2691D6318;
        id v18 = a1;
        if (v17 != -1) {
          swift_once();
        }
        uint64_t v19 = sub_246C2C088();
        sub_246B8BE0C(v19, (uint64_t)qword_2691E0198);
        uint64_t v20 = (char *)v18;
        id v21 = sub_246C2C068();
        os_log_type_t v22 = sub_246C2CEC8();
        if (os_log_type_enabled(v21, v22))
        {
          id v23 = (uint8_t *)swift_slowAlloc();
          uint64_t v24 = swift_slowAlloc();
          uint64_t v41 = v24;
          *(_DWORD *)id v23 = 136315138;
          uint64_t v25 = *(void *)&v20[OBJC_IVAR___NTKParmesanAsset_localIdentifier];
          unint64_t v26 = *(void *)&v20[OBJC_IVAR___NTKParmesanAsset_localIdentifier + 8];
          swift_bridgeObjectRetain();
          sub_246BA686C(v25, v26, &v41);
          sub_246C2D1C8();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_246B51000, v21, v22, "Preview loaded for asset: %s", v23, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24C545990](v24, -1, -1);
          MEMORY[0x24C545990](v23, -1, -1);
        }
        else
        {
        }
        id v30 = sub_246C202E0(v20);
        id v31 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PreviewScalingView()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
        uint64_t v32 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_contentView;
        uint64_t v33 = *(void **)&v31[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_contentView];
        *(void *)&v31[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_contentView] = v30;
        id v34 = v30;
        objc_msgSend(v33, sel_removeFromSuperview);
        if (*(void *)&v31[v32]) {
          objc_msgSend(v31, sel_addSubview_);
        }

        id v35 = *(void **)&v7[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_device];
        objc_msgSend(v35, sel_screenBounds);
        unint64_t v36 = &v31[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_targetSize];
        *(void *)unint64_t v36 = v37;
        *((void *)v36 + 1) = v38;
        v36[16] = 0;
        objc_msgSend(v31, sel_setNeedsLayout);
        objc_msgSend(v35, sel_screenCornerRadius);
        objc_super v39 = &v31[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_DC3BA41EEB072E14570EF1C5DEF2692418PreviewScalingView_targetCornerRadius];
        *(void *)objc_super v39 = v40;
        v39[8] = 0;
        sub_246C1F698(v31);

        goto LABEL_22;
      }
      v7[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_hasLoadedPreview] = 0;
      if (qword_2691D6318 != -1) {
        swift_once();
      }
      uint64_t v27 = sub_246C2C088();
      sub_246B8BE0C(v27, (uint64_t)qword_2691E0198);
      double v12 = sub_246C2C068();
      os_log_type_t v28 = sub_246C2CEE8();
      if (os_log_type_enabled(v12, v28))
      {
        id v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v29 = 0;
        _os_log_impl(&dword_246B51000, v12, v28, "Logic error, error or face should be non-nil", v29, 2u);
        MEMORY[0x24C545990](v29, -1, -1);

        return;
      }
    }

LABEL_22:
  }
}

char *sub_246C202E0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_246B80250(&qword_2691D7030);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_allocWithZone((Class)type metadata accessor for ParmesanAssetComposition());
  id v8 = sub_246BD55D0((char *)a1, 0);
  uint64_t v9 = *(void **)(v2 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_device);
  objc_msgSend(v9, sel_screenBounds);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  uint64_t v18 = qword_2691D62B8;
  id v19 = v9;
  if (v18 != -1) {
    swift_once();
  }
  uint64_t v20 = (void *)qword_2691E0068;
  id v21 = (objc_class *)type metadata accessor for ParmesanGalleryView();
  id v22 = objc_allocWithZone(v21);
  id v23 = objc_allocWithZone(v21);
  uint64_t v24 = sub_246BE1364(v19, 0, 0, v20, 0, 0, v11, v13, v15, v17);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  id v25 = (id)NTKIdealizedDate();
  if (v25)
  {
    unint64_t v26 = v25;
    sub_246C2BC08();

    uint64_t v27 = sub_246C2BC18();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v6, 0, 1, v27);
  }
  else
  {
    uint64_t v28 = sub_246C2BC18();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v6, 1, 1, v28);
  }
  sub_246BC6BD4((uint64_t)v6);
  sub_246BB04B4((uint64_t)v6);
  id v29 = *(void **)&v24[OBJC_IVAR___NTKParmesanGalleryView_noPhotosView];
  id v30 = v8;
  objc_msgSend(v29, sel_removeFromSuperview);
  type metadata accessor for ParmesanGalleryTransitionNone();
  uint64_t v31 = swift_allocObject();
  uint64_t v32 = *(void *)&v24[OBJC_IVAR___NTKParmesanGalleryView_currentItem];
  if (v32)
  {
    uint64_t v33 = *(void **)(v32 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition);
    id v34 = v33;
  }
  else
  {
    uint64_t v33 = 0;
  }
  sub_246C22C14(v33, v30, v31, v24, (void (*)(void, void, void, void))sub_246C2172C);

  swift_release();
  id v35 = objc_msgSend(v24, sel_layer);
  objc_msgSend(v35, sel_setMasksToBounds_, 1);

  return v24;
}

uint64_t sub_246C20604()
{
  uint64_t v1 = v0;
  if (qword_2691D6318 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_246C2C088();
  sub_246B8BE0C(v2, (uint64_t)qword_2691E0198);
  id v3 = sub_246C2C068();
  os_log_type_t v4 = sub_246C2CF08();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_246B51000, v3, v4, "User confirmed Parmesan Face Creation, beginning process…", v5, 2u);
    MEMORY[0x24C545990](v5, -1, -1);
  }

  uint64_t v6 = *(char **)(v1
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_upgradeManager);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_246BAA484(v6, v7);

  return swift_release();
}

void sub_246C20730(uint64_t a1, id a2, uint64_t a3)
{
  uint64_t v3 = a3 + 16;
  if (a2)
  {
    id v5 = a2;
    if (qword_2691D6318 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_246C2C088();
    sub_246B8BE0C(v6, (uint64_t)qword_2691E0198);
    id v7 = a2;
    id v8 = a2;
    uint64_t v9 = sub_246C2C068();
    os_log_type_t v10 = sub_246C2CEE8();
    if (os_log_type_enabled(v9, v10))
    {
      double v11 = (uint8_t *)swift_slowAlloc();
      double v12 = (void *)swift_slowAlloc();
      *(_DWORD *)double v11 = 138412290;
      id v13 = a2;
      uint64_t v26 = _swift_stdlib_bridgeErrorToNSError();
      sub_246C2D1C8();
      void *v12 = v26;

      _os_log_impl(&dword_246B51000, v9, v10, "Face upgrade failed: %@", v11, 0xCu);
      sub_246B80250(&qword_2691D6FF0);
      swift_arrayDestroy();
      MEMORY[0x24C545990](v12, -1, -1);
      MEMORY[0x24C545990](v11, -1, -1);
    }
    else
    {
    }
    swift_beginAccess();
    uint64_t v20 = MEMORY[0x24C545A70](v3);
    if (v20)
    {
      id v21 = (void *)v20;
      id v22 = a2;
      sub_246C230D4();
    }
    else
    {
    }
  }
  else
  {
    swift_beginAccess();
    uint64_t v15 = MEMORY[0x24C545A70](v3);
    if (v15)
    {
      double v16 = (char *)v15;
      uint64_t v17 = MEMORY[0x24C545A70](v15 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_upgradeDelegate);
      if (v17)
      {
        uint64_t v18 = (void *)v17;
        id v19 = *(id *)&v16[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion34ParmesanUpgradeOptInViewController_upgradeManager];
        objc_msgSend(v18, sel_upgradeManager_didCompleteWithFace_error_, v19, a1, 0);

        swift_unknownObjectRelease();
      }
      else
      {
      }
      swift_beginAccess();
      id v23 = (void *)MEMORY[0x24C545A70](v3);
      if (!v23) {
        return;
      }
    }
    else
    {
      swift_beginAccess();
      id v23 = (void *)MEMORY[0x24C545A70](v3);
      if (!v23) {
        return;
      }
    }
    uint64_t v24 = v23;
    id v25 = objc_msgSend(v23, sel_presentingViewController);

    if (v25)
    {
      objc_msgSend(v25, sel_dismissViewControllerAnimated_completion_, 1, 0);
    }
  }
}

void sub_246C20A6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x24C545A70](v2);
  if (v3)
  {
    os_log_type_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_presentingViewController);

    if (v5)
    {
      objc_msgSend(v5, sel_dismissViewControllerAnimated_completion_, 1, 0);
    }
  }
}

id sub_246C20B88(uint64_t a1)
{
  return sub_246C20BA0(a1, type metadata accessor for ParmesanUpgradeOptInViewController);
}

id sub_246C20BA0(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for ParmesanUpgradeOptInViewController()
{
  return self;
}

uint64_t sub_246C20C88()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_246C20CC0(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

void sub_246C20CD0(char *a1, void *a2, uint64_t a3, char *a4)
{
  objc_super v4 = a4;
  uint64_t v6 = *(void *)&a4[OBJC_IVAR___NTKParmesanGalleryView_backgroundContainerView];
  uint64_t v7 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_transitionView;
  objc_msgSend(*(id *)(v6 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_transitionView), sel_removeFromSuperview);
  id v8 = *(void **)(v6 + v7);
  *(void *)(v6 + v7) = 0;

  uint64_t v9 = *(void *)&v4[OBJC_IVAR___NTKParmesanGalleryView_foregroundContainerView];
  uint64_t v10 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_transitionView;
  objc_msgSend(*(id *)(v9 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_transitionView), sel_removeFromSuperview);
  double v11 = *(void **)(v9 + v10);
  *(void *)(v9 + v10) = 0;

  double v12 = a1;
  v161 = v4;
  if (!a1)
  {
    uint64_t v13 = *(void *)&v4[OBJC_IVAR___NTKParmesanGalleryView_transitionCoordinator]
        + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion36ParmesanGalleryTransitionCoordinator_context;
    id v14 = *(id *)v13;
    if (*(void *)v13)
    {
      uint64_t v15 = *(void *)(v13 + 8);
      double v16 = *(void **)(v13 + 16);
      double v12 = *(char **)(v13 + 24);
      uint64_t v17 = *(void **)(v13 + 32);
      uint64_t v18 = *(void **)(v13 + 40);
      if (v12)
      {
        sub_246BE4540(*(id *)v13, *(void *)(v13 + 8), *(void **)(v13 + 16), *(void **)(v13 + 24), *(void **)(v13 + 32), *(void **)(v13 + 40));
        id v19 = v12;
        sub_246BE4624((uint64_t)v14, v15, v16, v12, v17, v18);
        double v12 = *(char **)&v19[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition];
        uint64_t v20 = v12;

        objc_super v4 = v161;
      }
      else
      {
        swift_unknownObjectRetain();
        sub_246BE45A4(v16, 0);
        sub_246BE45E4(v17, v18);
        sub_246BE4624((uint64_t)v14, v15, v16, 0, v17, v18);
      }
    }
    else
    {
      double v12 = 0;
    }
  }
  uint64_t v21 = *(void *)&v4[OBJC_IVAR___NTKParmesanGalleryView_timeView];
  uint64_t v22 = OBJC_IVAR___NTKParmesanTimeView_appearance;
  id v23 = *(void **)(v21 + OBJC_IVAR___NTKParmesanTimeView_appearance);
  uint64_t v156 = OBJC_IVAR___NTKParmesanGalleryView_transitionCoordinator;
  uint64_t v24 = *(void *)&v4[OBJC_IVAR___NTKParmesanGalleryView_transitionCoordinator]
      + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion36ParmesanGalleryTransitionCoordinator_context;
  id v25 = *(void **)v24;
  v152 = v12;
  if (*(void *)v24)
  {
    uint64_t v26 = *(void *)(v24 + 8);
    uint64_t v27 = *(void **)(v24 + 16);
    id v29 = *(void **)(v24 + 24);
    uint64_t v28 = *(void **)(v24 + 32);
    id v30 = *(void **)(v24 + 40);
    uint64_t v31 = a1;
    if (v28)
    {
      sub_246BE4540(v25, v26, v27, v29, v28, v30);
      id v32 = v30;
      uint64_t v33 = (uint64_t)v25;
      uint64_t v34 = v26;
      id v35 = v27;
      unint64_t v36 = v29;
      uint64_t v37 = v28;
    }
    else
    {
      id v32 = v23;
      sub_246BE4540(v25, v26, v27, v29, 0, v30);
      uint64_t v33 = (uint64_t)v25;
      uint64_t v34 = v26;
      id v35 = v27;
      unint64_t v36 = v29;
      uint64_t v37 = 0;
    }
    sub_246BE4624(v33, v34, v35, v36, v37, v30);
    objc_super v4 = v161;
    double v12 = v152;
  }
  else
  {
    uint64_t v38 = a1;
    id v32 = v23;
  }
  if (v12)
  {
    double v12 = *(char **)&v12[OBJC_IVAR___NTKParmesanGalleryComposition_timeLayout];
    objc_super v39 = v12;
  }
  v151 = v12;
  id v40 = sub_246BCF4A4(v12, 0, 1, 0, 1);

  id v41 = v40;
  sub_246BC4DA4(v41);
  uint64_t v42 = (uint64_t *)(*(void *)&v4[v156]
                  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion36ParmesanGalleryTransitionCoordinator_context);
  uint64_t v43 = *v42;
  uint64_t v44 = v42[1];
  uint64_t v45 = (void *)v42[2];
  v46 = (void *)v42[3];
  os_log_type_t v47 = (void *)v42[4];
  os_log_type_t v48 = (void *)v42[5];
  *(_OWORD *)uint64_t v42 = 0u;
  *((_OWORD *)v42 + 1) = 0u;
  *((_OWORD *)v42 + 2) = 0u;
  sub_246BE4624(v43, v44, v45, v46, v47, v48);
  uint64_t v49 = *(void **)((char *)a2 + OBJC_IVAR___NTKParmesanGalleryComposition_timeLayout);
  uint64_t v50 = *(void *)(v21 + v22);
  id v51 = *(void **)(v50 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_device);
  uint64_t v52 = *(void *)(v50 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface);
  uint64_t v53 = *(void *)(v50 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_numerals);
  v54 = (objc_class *)type metadata accessor for ParmesanTimeAppearance();
  id v55 = (char *)objc_allocWithZone(v54);
  *(void *)&v55[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout] = v49;
  *(void *)&v55[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_device] = v51;
  *(void *)&v55[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface] = v52;
  *(void *)&v55[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_numerals] = v53;
  v56 = v161;
  v167.receiver = v55;
  v167.super_class = v54;
  id v57 = v49;
  swift_retain();
  id v58 = v51;
  id v59 = objc_msgSendSuper2(&v167, sel_init);
  id v60 = v41;
  LOBYTE(v40) = sub_246C2D108();

  id v61 = 0;
  id v62 = 0;
  if ((v40 & 1) == 0)
  {
    id v63 = v60;
    id v64 = v59;
    id v65 = v63;
    id v66 = v64;
    char v67 = sub_246C2D108();

    if (v67)
    {
      sub_246BC4DA4(v66);
      os_log_t v68 = v151;
      if (!v151) {
        goto LABEL_21;
      }
    }
    else
    {
      sub_246BC4DA4(v65);
      sub_246BC626C(v66);
      os_log_t v68 = v151;
      if (!v151) {
        goto LABEL_21;
      }
    }
    type metadata accessor for ParmesanTimeLayout();
    id v69 = v57;
    id v70 = v68;
    char v71 = sub_246C2D108();

    if (v71)
    {
LABEL_23:

      id v61 = v60;
      id v62 = v59;
      goto LABEL_24;
    }
LABEL_21:
    v72 = (void *)MEMORY[0x24C545A70](&v161[OBJC_IVAR___NTKParmesanGalleryView_transitionDelegate]);
    if (v72)
    {
      objc_msgSend(v72, sel_willStartTransitionToLayout_, v57);
      swift_unknownObjectRelease();
    }
    goto LABEL_23;
  }
LABEL_24:
  v144 = v62;
  v145 = v61;
  v146 = v59;

  os_log_t v73 = *(char **)&v161[OBJC_IVAR___NTKParmesanGalleryView_currentItem];
  int v74 = (void *)MEMORY[0x263F8EED0];
  uint64_t v75 = v152;
  v147 = v60;
  v148 = v57;
  if (!v152)
  {
    v154 = v73;
    v149 = v73;
    v150 = 0;
    id v80 = &selRef__colorStyleKeylineViewWithEditOption_slot_;
    goto LABEL_34;
  }
  if (!v73)
  {
    v154 = 0;
    v81 = v152;
LABEL_33:
    id v83 = objc_msgSend(v161, sel_bounds);
    double v85 = v84;
    double v87 = v86;
    double v89 = v88;
    double v91 = v90;
    uint64_t v92 = (*(uint64_t (**)(id))((*v74 & *(void *)v75) + 0x130))(v83);
    v93 = (objc_class *)type metadata accessor for ParmesanGalleryContentViews();
    v94 = (char *)objc_allocWithZone(v93);
    *(void *)&v94[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_backgroundView] = 0;
    *(void *)&v94[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_foregroundView] = 0;
    *(void *)&v94[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_config] = v92;
    v163.receiver = v94;
    v163.super_class = v93;
    id v80 = &selRef__colorStyleKeylineViewWithEditOption_slot_;
    swift_retain();
    id v95 = objc_msgSendSuper2(&v163, sel_init);
    sub_246BC057C(v85, v87, v89, v91);
    sub_246BC0F08(v85, v87, v89, v91);

    swift_release();
    v96 = (objc_class *)type metadata accessor for ParmesanGalleryItem();
    v97 = (char *)objc_allocWithZone(v96);
    v98 = v75;
    v99 = v97;
    uint64_t v100 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition;
    *(void *)&v97[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition] = 0;
    uint64_t v101 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views;
    *(void *)&v97[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views] = 0;
    v102 = *(void **)&v97[v100];
    *(void *)&v97[v100] = v98;
    v103 = v98;
    id v104 = v95;
    v105 = v99;

    v106 = *(void **)&v99[v101];
    *(void *)&v99[v101] = v95;
    id v107 = v104;

    v56 = v161;
    v162.receiver = v105;
    v162.super_class = v96;
    id v108 = objc_msgSendSuper2(&v162, sel_init);

    v150 = v103;
    int v74 = (void *)MEMORY[0x263F8EED0];
    v149 = v108;
    v154 = (char *)v108;
    goto LABEL_34;
  }
  v76 = *(void **)&v73[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition];
  if (!v76)
  {
    v154 = v73;
    v82 = v152;
    goto LABEL_33;
  }
  type metadata accessor for ParmesanGalleryComposition();
  v149 = v73;
  v154 = v73;
  uint64_t v77 = v152;
  id v78 = v76;
  v150 = v77;
  char v79 = sub_246C2D108();

  if ((v79 & 1) == 0)
  {
    uint64_t v75 = v152;
    int v74 = (void *)MEMORY[0x263F8EED0];
    goto LABEL_33;
  }

  id v80 = &selRef__colorStyleKeylineViewWithEditOption_slot_;
  int v74 = (void *)MEMORY[0x263F8EED0];
LABEL_34:
  id v109 = objc_msgSend(v56, sel_bounds);
  double v111 = v110;
  double v113 = v112;
  double v115 = v114;
  double v117 = v116;
  uint64_t v118 = (*(uint64_t (**)(id))((*v74 & *a2) + 0x130))(v109);
  v119 = (objc_class *)type metadata accessor for ParmesanGalleryContentViews();
  v120 = (char *)objc_allocWithZone(v119);
  *(void *)&v120[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_backgroundView] = 0;
  *(void *)&v120[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_foregroundView] = 0;
  *(void *)&v120[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_config] = v118;
  v166.receiver = v120;
  v166.super_class = v119;
  v121 = v80[340];
  swift_retain();
  id v122 = objc_msgSendSuper2(&v166, v121);
  sub_246BC057C(v111, v113, v115, v117);
  sub_246BC0F08(v111, v113, v115, v117);

  swift_release();
  v123 = (objc_class *)type metadata accessor for ParmesanGalleryItem();
  v124 = (char *)objc_allocWithZone(v123);
  uint64_t v125 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition;
  *(void *)&v124[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition] = 0;
  uint64_t v126 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views;
  *(void *)&v124[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views] = 0;
  v127 = *(void **)&v124[v125];
  *(void *)&v124[v125] = a2;
  v128 = a2;
  v129 = v80;
  v130 = v56;
  id v131 = v122;
  v132 = v128;
  v133 = v124;

  v134 = *(void **)&v124[v126];
  *(void *)&v124[v126] = v122;
  id v159 = v131;

  v165.receiver = v133;
  v165.super_class = v123;
  id v135 = objc_msgSendSuper2(&v165, (SEL)v129 + 1560);

  v164[0] = v149;
  v164[1] = v135;
  v136 = v154;
  id v137 = v135;
  sub_246BE36AC((uint64_t)v164);
  v138 = (uint64_t *)(*(void *)&v130[v156]
                   + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion36ParmesanGalleryTransitionCoordinator_context);
  uint64_t v139 = *v138;
  uint64_t v140 = v138[1];
  v141 = (void *)v138[2];
  v155 = (void *)v138[4];
  v157 = (void *)v138[3];
  v153 = (void *)v138[5];
  uint64_t *v138 = a3;
  v138[1] = (uint64_t)&off_26FB22590;
  v138[2] = (uint64_t)v149;
  v138[3] = (uint64_t)v137;
  v138[4] = (uint64_t)v145;
  v138[5] = (uint64_t)v144;
  v142 = v136;
  id v143 = v137;
  swift_unknownObjectRetain();
  sub_246BE45A4(v149, v137);
  sub_246BE45E4(v145, v144);
  sub_246BE4624(v139, v140, v141, v157, v155, v153);
  sub_246BE41B0();
  swift_unknownObjectRelease();

  sub_246BE4688(v149, v137);
  sub_246BC80B0(v145, v144);
}

void sub_246C2172C(char *a1, void *a2, uint64_t a3, char *a4)
{
  objc_super v4 = a4;
  uint64_t v6 = *(void *)&a4[OBJC_IVAR___NTKParmesanGalleryView_backgroundContainerView];
  uint64_t v7 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_transitionView;
  objc_msgSend(*(id *)(v6 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_transitionView), sel_removeFromSuperview);
  id v8 = *(void **)(v6 + v7);
  *(void *)(v6 + v7) = 0;

  uint64_t v9 = *(void *)&v4[OBJC_IVAR___NTKParmesanGalleryView_foregroundContainerView];
  uint64_t v10 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_transitionView;
  objc_msgSend(*(id *)(v9 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_transitionView), sel_removeFromSuperview);
  double v11 = *(void **)(v9 + v10);
  *(void *)(v9 + v10) = 0;

  double v12 = a1;
  v161 = v4;
  if (!a1)
  {
    uint64_t v13 = *(void *)&v4[OBJC_IVAR___NTKParmesanGalleryView_transitionCoordinator]
        + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion36ParmesanGalleryTransitionCoordinator_context;
    id v14 = *(id *)v13;
    if (*(void *)v13)
    {
      uint64_t v15 = *(void *)(v13 + 8);
      double v16 = *(void **)(v13 + 16);
      double v12 = *(char **)(v13 + 24);
      uint64_t v17 = *(void **)(v13 + 32);
      uint64_t v18 = *(void **)(v13 + 40);
      if (v12)
      {
        sub_246BE4540(*(id *)v13, *(void *)(v13 + 8), *(void **)(v13 + 16), *(void **)(v13 + 24), *(void **)(v13 + 32), *(void **)(v13 + 40));
        id v19 = v12;
        sub_246BE4624((uint64_t)v14, v15, v16, v12, v17, v18);
        double v12 = *(char **)&v19[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition];
        uint64_t v20 = v12;

        objc_super v4 = v161;
      }
      else
      {
        swift_unknownObjectRetain();
        sub_246BE45A4(v16, 0);
        sub_246BE45E4(v17, v18);
        sub_246BE4624((uint64_t)v14, v15, v16, 0, v17, v18);
      }
    }
    else
    {
      double v12 = 0;
    }
  }
  uint64_t v21 = *(void *)&v4[OBJC_IVAR___NTKParmesanGalleryView_timeView];
  uint64_t v22 = OBJC_IVAR___NTKParmesanTimeView_appearance;
  id v23 = *(void **)(v21 + OBJC_IVAR___NTKParmesanTimeView_appearance);
  uint64_t v156 = OBJC_IVAR___NTKParmesanGalleryView_transitionCoordinator;
  uint64_t v24 = *(void *)&v4[OBJC_IVAR___NTKParmesanGalleryView_transitionCoordinator]
      + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion36ParmesanGalleryTransitionCoordinator_context;
  id v25 = *(void **)v24;
  v152 = v12;
  if (*(void *)v24)
  {
    uint64_t v26 = *(void *)(v24 + 8);
    uint64_t v27 = *(void **)(v24 + 16);
    id v29 = *(void **)(v24 + 24);
    uint64_t v28 = *(void **)(v24 + 32);
    id v30 = *(void **)(v24 + 40);
    uint64_t v31 = a1;
    if (v28)
    {
      sub_246BE4540(v25, v26, v27, v29, v28, v30);
      id v32 = v30;
      uint64_t v33 = (uint64_t)v25;
      uint64_t v34 = v26;
      id v35 = v27;
      unint64_t v36 = v29;
      uint64_t v37 = v28;
    }
    else
    {
      id v32 = v23;
      sub_246BE4540(v25, v26, v27, v29, 0, v30);
      uint64_t v33 = (uint64_t)v25;
      uint64_t v34 = v26;
      id v35 = v27;
      unint64_t v36 = v29;
      uint64_t v37 = 0;
    }
    sub_246BE4624(v33, v34, v35, v36, v37, v30);
    objc_super v4 = v161;
    double v12 = v152;
  }
  else
  {
    uint64_t v38 = a1;
    id v32 = v23;
  }
  if (v12)
  {
    double v12 = *(char **)&v12[OBJC_IVAR___NTKParmesanGalleryComposition_timeLayout];
    objc_super v39 = v12;
  }
  v151 = v12;
  id v40 = sub_246BCF4A4(v12, 0, 1, 0, 1);

  id v41 = v40;
  sub_246BC4DA4(v41);
  uint64_t v42 = (uint64_t *)(*(void *)&v4[v156]
                  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion36ParmesanGalleryTransitionCoordinator_context);
  uint64_t v43 = *v42;
  uint64_t v44 = v42[1];
  uint64_t v45 = (void *)v42[2];
  v46 = (void *)v42[3];
  os_log_type_t v47 = (void *)v42[4];
  os_log_type_t v48 = (void *)v42[5];
  *(_OWORD *)uint64_t v42 = 0u;
  *((_OWORD *)v42 + 1) = 0u;
  *((_OWORD *)v42 + 2) = 0u;
  sub_246BE4624(v43, v44, v45, v46, v47, v48);
  uint64_t v49 = *(void **)((char *)a2 + OBJC_IVAR___NTKParmesanGalleryComposition_timeLayout);
  uint64_t v50 = *(void *)(v21 + v22);
  id v51 = *(void **)(v50 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_device);
  uint64_t v52 = *(void *)(v50 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface);
  uint64_t v53 = *(void *)(v50 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_numerals);
  v54 = (objc_class *)type metadata accessor for ParmesanTimeAppearance();
  id v55 = (char *)objc_allocWithZone(v54);
  *(void *)&v55[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout] = v49;
  *(void *)&v55[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_device] = v51;
  *(void *)&v55[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface] = v52;
  *(void *)&v55[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_numerals] = v53;
  v56 = v161;
  v167.receiver = v55;
  v167.super_class = v54;
  id v57 = v49;
  swift_retain();
  id v58 = v51;
  id v59 = objc_msgSendSuper2(&v167, sel_init);
  id v60 = v41;
  LOBYTE(v40) = sub_246C2D108();

  id v61 = 0;
  id v62 = 0;
  if ((v40 & 1) == 0)
  {
    id v63 = v60;
    id v64 = v59;
    id v65 = v63;
    id v66 = v64;
    char v67 = sub_246C2D108();

    if (v67)
    {
      sub_246BC4DA4(v66);
      os_log_t v68 = v151;
      if (!v151) {
        goto LABEL_21;
      }
    }
    else
    {
      sub_246BC4DA4(v65);
      sub_246BC626C(v66);
      os_log_t v68 = v151;
      if (!v151) {
        goto LABEL_21;
      }
    }
    type metadata accessor for ParmesanTimeLayout();
    id v69 = v57;
    id v70 = v68;
    char v71 = sub_246C2D108();

    if (v71)
    {
LABEL_23:

      id v61 = v60;
      id v62 = v59;
      goto LABEL_24;
    }
LABEL_21:
    v72 = (void *)MEMORY[0x24C545A70](&v161[OBJC_IVAR___NTKParmesanGalleryView_transitionDelegate]);
    if (v72)
    {
      objc_msgSend(v72, sel_willStartTransitionToLayout_, v57);
      swift_unknownObjectRelease();
    }
    goto LABEL_23;
  }
LABEL_24:
  v144 = v62;
  v145 = v61;
  v146 = v59;

  os_log_t v73 = *(char **)&v161[OBJC_IVAR___NTKParmesanGalleryView_currentItem];
  int v74 = (void *)MEMORY[0x263F8EED0];
  uint64_t v75 = v152;
  v147 = v60;
  v148 = v57;
  if (!v152)
  {
    v154 = v73;
    v149 = v73;
    v150 = 0;
    id v80 = &selRef__colorStyleKeylineViewWithEditOption_slot_;
    goto LABEL_34;
  }
  if (!v73)
  {
    v154 = 0;
    v81 = v152;
LABEL_33:
    id v83 = objc_msgSend(v161, sel_bounds);
    double v85 = v84;
    double v87 = v86;
    double v89 = v88;
    double v91 = v90;
    uint64_t v92 = (*(uint64_t (**)(id))((*v74 & *(void *)v75) + 0x130))(v83);
    v93 = (objc_class *)type metadata accessor for ParmesanGalleryContentViews();
    v94 = (char *)objc_allocWithZone(v93);
    *(void *)&v94[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_backgroundView] = 0;
    *(void *)&v94[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_foregroundView] = 0;
    *(void *)&v94[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_config] = v92;
    v163.receiver = v94;
    v163.super_class = v93;
    id v80 = &selRef__colorStyleKeylineViewWithEditOption_slot_;
    swift_retain();
    id v95 = objc_msgSendSuper2(&v163, sel_init);
    sub_246BC057C(v85, v87, v89, v91);
    sub_246BC0F08(v85, v87, v89, v91);

    swift_release();
    v96 = (objc_class *)type metadata accessor for ParmesanGalleryItem();
    v97 = (char *)objc_allocWithZone(v96);
    v98 = v75;
    v99 = v97;
    uint64_t v100 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition;
    *(void *)&v97[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition] = 0;
    uint64_t v101 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views;
    *(void *)&v97[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views] = 0;
    v102 = *(void **)&v97[v100];
    *(void *)&v97[v100] = v98;
    v103 = v98;
    id v104 = v95;
    v105 = v99;

    v106 = *(void **)&v99[v101];
    *(void *)&v99[v101] = v95;
    id v107 = v104;

    v56 = v161;
    v162.receiver = v105;
    v162.super_class = v96;
    id v108 = objc_msgSendSuper2(&v162, sel_init);

    v150 = v103;
    int v74 = (void *)MEMORY[0x263F8EED0];
    v149 = v108;
    v154 = (char *)v108;
    goto LABEL_34;
  }
  v76 = *(void **)&v73[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition];
  if (!v76)
  {
    v154 = v73;
    v82 = v152;
    goto LABEL_33;
  }
  type metadata accessor for ParmesanGalleryComposition();
  v149 = v73;
  v154 = v73;
  uint64_t v77 = v152;
  id v78 = v76;
  v150 = v77;
  char v79 = sub_246C2D108();

  if ((v79 & 1) == 0)
  {
    uint64_t v75 = v152;
    int v74 = (void *)MEMORY[0x263F8EED0];
    goto LABEL_33;
  }

  id v80 = &selRef__colorStyleKeylineViewWithEditOption_slot_;
  int v74 = (void *)MEMORY[0x263F8EED0];
LABEL_34:
  id v109 = objc_msgSend(v56, sel_bounds);
  double v111 = v110;
  double v113 = v112;
  double v115 = v114;
  double v117 = v116;
  uint64_t v118 = (*(uint64_t (**)(id))((*v74 & *a2) + 0x130))(v109);
  v119 = (objc_class *)type metadata accessor for ParmesanGalleryContentViews();
  v120 = (char *)objc_allocWithZone(v119);
  *(void *)&v120[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_backgroundView] = 0;
  *(void *)&v120[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_foregroundView] = 0;
  *(void *)&v120[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_config] = v118;
  v166.receiver = v120;
  v166.super_class = v119;
  v121 = v80[340];
  swift_retain();
  id v122 = objc_msgSendSuper2(&v166, v121);
  sub_246BC057C(v111, v113, v115, v117);
  sub_246BC0F08(v111, v113, v115, v117);

  swift_release();
  v123 = (objc_class *)type metadata accessor for ParmesanGalleryItem();
  v124 = (char *)objc_allocWithZone(v123);
  uint64_t v125 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition;
  *(void *)&v124[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition] = 0;
  uint64_t v126 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views;
  *(void *)&v124[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views] = 0;
  v127 = *(void **)&v124[v125];
  *(void *)&v124[v125] = a2;
  v128 = a2;
  v129 = v80;
  v130 = v56;
  id v131 = v122;
  v132 = v128;
  v133 = v124;

  v134 = *(void **)&v124[v126];
  *(void *)&v124[v126] = v122;
  id v159 = v131;

  v165.receiver = v133;
  v165.super_class = v123;
  id v135 = objc_msgSendSuper2(&v165, (SEL)v129 + 1560);

  v164[0] = v149;
  v164[1] = v135;
  v136 = v154;
  id v137 = v135;
  sub_246BE36AC((uint64_t)v164);
  v138 = (uint64_t *)(*(void *)&v130[v156]
                   + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion36ParmesanGalleryTransitionCoordinator_context);
  uint64_t v139 = *v138;
  uint64_t v140 = v138[1];
  v141 = (void *)v138[2];
  v155 = (void *)v138[4];
  v157 = (void *)v138[3];
  v153 = (void *)v138[5];
  uint64_t *v138 = a3;
  v138[1] = (uint64_t)&off_26FB20890;
  v138[2] = (uint64_t)v149;
  v138[3] = (uint64_t)v137;
  v138[4] = (uint64_t)v145;
  v138[5] = (uint64_t)v144;
  v142 = v136;
  id v143 = v137;
  swift_unknownObjectRetain();
  sub_246BE45A4(v149, v137);
  sub_246BE45E4(v145, v144);
  sub_246BE4624(v139, v140, v141, v157, v155, v153);
  sub_246BE41B0();
  swift_unknownObjectRelease();

  sub_246BE4688(v149, v137);
  sub_246BC80B0(v145, v144);
}

void sub_246C22188(char *a1, void *a2, uint64_t a3, char *a4)
{
  objc_super v4 = a4;
  uint64_t v6 = *(void *)&a4[OBJC_IVAR___NTKParmesanGalleryView_backgroundContainerView];
  uint64_t v7 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_transitionView;
  objc_msgSend(*(id *)(v6 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_transitionView), sel_removeFromSuperview);
  id v8 = *(void **)(v6 + v7);
  *(void *)(v6 + v7) = 0;

  uint64_t v9 = *(void *)&v4[OBJC_IVAR___NTKParmesanGalleryView_foregroundContainerView];
  uint64_t v10 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_transitionView;
  objc_msgSend(*(id *)(v9 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion38ParmesanGalleryTransitionContainerView_transitionView), sel_removeFromSuperview);
  double v11 = *(void **)(v9 + v10);
  *(void *)(v9 + v10) = 0;

  double v12 = a1;
  v161 = v4;
  if (!a1)
  {
    uint64_t v13 = *(void *)&v4[OBJC_IVAR___NTKParmesanGalleryView_transitionCoordinator]
        + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion36ParmesanGalleryTransitionCoordinator_context;
    id v14 = *(id *)v13;
    if (*(void *)v13)
    {
      uint64_t v15 = *(void *)(v13 + 8);
      double v16 = *(void **)(v13 + 16);
      double v12 = *(char **)(v13 + 24);
      uint64_t v17 = *(void **)(v13 + 32);
      uint64_t v18 = *(void **)(v13 + 40);
      if (v12)
      {
        sub_246BE4540(*(id *)v13, *(void *)(v13 + 8), *(void **)(v13 + 16), *(void **)(v13 + 24), *(void **)(v13 + 32), *(void **)(v13 + 40));
        id v19 = v12;
        sub_246BE4624((uint64_t)v14, v15, v16, v12, v17, v18);
        double v12 = *(char **)&v19[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition];
        uint64_t v20 = v12;

        objc_super v4 = v161;
      }
      else
      {
        swift_unknownObjectRetain();
        sub_246BE45A4(v16, 0);
        sub_246BE45E4(v17, v18);
        sub_246BE4624((uint64_t)v14, v15, v16, 0, v17, v18);
      }
    }
    else
    {
      double v12 = 0;
    }
  }
  uint64_t v21 = *(void *)&v4[OBJC_IVAR___NTKParmesanGalleryView_timeView];
  uint64_t v22 = OBJC_IVAR___NTKParmesanTimeView_appearance;
  id v23 = *(void **)(v21 + OBJC_IVAR___NTKParmesanTimeView_appearance);
  uint64_t v156 = OBJC_IVAR___NTKParmesanGalleryView_transitionCoordinator;
  uint64_t v24 = *(void *)&v4[OBJC_IVAR___NTKParmesanGalleryView_transitionCoordinator]
      + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion36ParmesanGalleryTransitionCoordinator_context;
  id v25 = *(void **)v24;
  v152 = v12;
  if (*(void *)v24)
  {
    uint64_t v26 = *(void *)(v24 + 8);
    uint64_t v27 = *(void **)(v24 + 16);
    id v29 = *(void **)(v24 + 24);
    uint64_t v28 = *(void **)(v24 + 32);
    id v30 = *(void **)(v24 + 40);
    uint64_t v31 = a1;
    if (v28)
    {
      sub_246BE4540(v25, v26, v27, v29, v28, v30);
      id v32 = v30;
      uint64_t v33 = (uint64_t)v25;
      uint64_t v34 = v26;
      id v35 = v27;
      unint64_t v36 = v29;
      uint64_t v37 = v28;
    }
    else
    {
      id v32 = v23;
      sub_246BE4540(v25, v26, v27, v29, 0, v30);
      uint64_t v33 = (uint64_t)v25;
      uint64_t v34 = v26;
      id v35 = v27;
      unint64_t v36 = v29;
      uint64_t v37 = 0;
    }
    sub_246BE4624(v33, v34, v35, v36, v37, v30);
    objc_super v4 = v161;
    double v12 = v152;
  }
  else
  {
    uint64_t v38 = a1;
    id v32 = v23;
  }
  if (v12)
  {
    double v12 = *(char **)&v12[OBJC_IVAR___NTKParmesanGalleryComposition_timeLayout];
    objc_super v39 = v12;
  }
  v151 = v12;
  id v40 = sub_246BCF4A4(v12, 0, 1, 0, 1);

  id v41 = v40;
  sub_246BC4DA4(v41);
  uint64_t v42 = (uint64_t *)(*(void *)&v4[v156]
                  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion36ParmesanGalleryTransitionCoordinator_context);
  uint64_t v43 = *v42;
  uint64_t v44 = v42[1];
  uint64_t v45 = (void *)v42[2];
  v46 = (void *)v42[3];
  os_log_type_t v47 = (void *)v42[4];
  os_log_type_t v48 = (void *)v42[5];
  *(_OWORD *)uint64_t v42 = 0u;
  *((_OWORD *)v42 + 1) = 0u;
  *((_OWORD *)v42 + 2) = 0u;
  sub_246BE4624(v43, v44, v45, v46, v47, v48);
  uint64_t v49 = *(void **)((char *)a2 + OBJC_IVAR___NTKParmesanGalleryComposition_timeLayout);
  uint64_t v50 = *(void *)(v21 + v22);
  id v51 = *(void **)(v50 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_device);
  uint64_t v52 = *(void *)(v50 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface);
  uint64_t v53 = *(void *)(v50 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_numerals);
  v54 = (objc_class *)type metadata accessor for ParmesanTimeAppearance();
  id v55 = (char *)objc_allocWithZone(v54);
  *(void *)&v55[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout] = v49;
  *(void *)&v55[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_device] = v51;
  *(void *)&v55[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface] = v52;
  *(void *)&v55[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_numerals] = v53;
  v56 = v161;
  v167.receiver = v55;
  v167.super_class = v54;
  id v57 = v49;
  swift_retain();
  id v58 = v51;
  id v59 = objc_msgSendSuper2(&v167, sel_init);
  id v60 = v41;
  LOBYTE(v40) = sub_246C2D108();

  id v61 = 0;
  id v62 = 0;
  if ((v40 & 1) == 0)
  {
    id v63 = v60;
    id v64 = v59;
    id v65 = v63;
    id v66 = v64;
    char v67 = sub_246C2D108();

    if (v67)
    {
      sub_246BC4DA4(v66);
      os_log_t v68 = v151;
      if (!v151) {
        goto LABEL_21;
      }
    }
    else
    {
      sub_246BC4DA4(v65);
      sub_246BC626C(v66);
      os_log_t v68 = v151;
      if (!v151) {
        goto LABEL_21;
      }
    }
    type metadata accessor for ParmesanTimeLayout();
    id v69 = v57;
    id v70 = v68;
    char v71 = sub_246C2D108();

    if (v71)
    {
LABEL_23:

      id v61 = v60;
      id v62 = v59;
      goto LABEL_24;
    }
LABEL_21:
    v72 = (void *)MEMORY[0x24C545A70](&v161[OBJC_IVAR___NTKParmesanGalleryView_transitionDelegate]);
    if (v72)
    {
      objc_msgSend(v72, sel_willStartTransitionToLayout_, v57);
      swift_unknownObjectRelease();
    }
    goto LABEL_23;
  }
LABEL_24:
  v144 = v62;
  v145 = v61;
  v146 = v59;

  os_log_t v73 = *(char **)&v161[OBJC_IVAR___NTKParmesanGalleryView_currentItem];
  int v74 = (void *)MEMORY[0x263F8EED0];
  uint64_t v75 = v152;
  v147 = v60;
  v148 = v57;
  if (!v152)
  {
    v154 = v73;
    v149 = v73;
    v150 = 0;
    id v80 = &selRef__colorStyleKeylineViewWithEditOption_slot_;
    goto LABEL_34;
  }
  if (!v73)
  {
    v154 = 0;
    v81 = v152;
LABEL_33:
    id v83 = objc_msgSend(v161, sel_bounds);
    double v85 = v84;
    double v87 = v86;
    double v89 = v88;
    double v91 = v90;
    uint64_t v92 = (*(uint64_t (**)(id))((*v74 & *(void *)v75) + 0x130))(v83);
    v93 = (objc_class *)type metadata accessor for ParmesanGalleryContentViews();
    v94 = (char *)objc_allocWithZone(v93);
    *(void *)&v94[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_backgroundView] = 0;
    *(void *)&v94[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_foregroundView] = 0;
    *(void *)&v94[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_config] = v92;
    v163.receiver = v94;
    v163.super_class = v93;
    id v80 = &selRef__colorStyleKeylineViewWithEditOption_slot_;
    swift_retain();
    id v95 = objc_msgSendSuper2(&v163, sel_init);
    sub_246BC057C(v85, v87, v89, v91);
    sub_246BC0F08(v85, v87, v89, v91);

    swift_release();
    v96 = (objc_class *)type metadata accessor for ParmesanGalleryItem();
    v97 = (char *)objc_allocWithZone(v96);
    v98 = v75;
    v99 = v97;
    uint64_t v100 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition;
    *(void *)&v97[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition] = 0;
    uint64_t v101 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views;
    *(void *)&v97[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views] = 0;
    v102 = *(void **)&v97[v100];
    *(void *)&v97[v100] = v98;
    v103 = v98;
    id v104 = v95;
    v105 = v99;

    v106 = *(void **)&v99[v101];
    *(void *)&v99[v101] = v95;
    id v107 = v104;

    v56 = v161;
    v162.receiver = v105;
    v162.super_class = v96;
    id v108 = objc_msgSendSuper2(&v162, sel_init);

    v150 = v103;
    int v74 = (void *)MEMORY[0x263F8EED0];
    v149 = v108;
    v154 = (char *)v108;
    goto LABEL_34;
  }
  v76 = *(void **)&v73[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition];
  if (!v76)
  {
    v154 = v73;
    v82 = v152;
    goto LABEL_33;
  }
  type metadata accessor for ParmesanGalleryComposition();
  v149 = v73;
  v154 = v73;
  uint64_t v77 = v152;
  id v78 = v76;
  v150 = v77;
  char v79 = sub_246C2D108();

  if ((v79 & 1) == 0)
  {
    uint64_t v75 = v152;
    int v74 = (void *)MEMORY[0x263F8EED0];
    goto LABEL_33;
  }

  id v80 = &selRef__colorStyleKeylineViewWithEditOption_slot_;
  int v74 = (void *)MEMORY[0x263F8EED0];
LABEL_34:
  id v109 = objc_msgSend(v56, sel_bounds);
  double v111 = v110;
  double v113 = v112;
  double v115 = v114;
  double v117 = v116;
  uint64_t v118 = (*(uint64_t (**)(id))((*v74 & *a2) + 0x130))(v109);
  v119 = (objc_class *)type metadata accessor for ParmesanGalleryContentViews();
  v120 = (char *)objc_allocWithZone(v119);
  *(void *)&v120[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_backgroundView] = 0;
  *(void *)&v120[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_foregroundView] = 0;
  *(void *)&v120[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27ParmesanGalleryContentViews_config] = v118;
  v166.receiver = v120;
  v166.super_class = v119;
  v121 = v80[340];
  swift_retain();
  id v122 = objc_msgSendSuper2(&v166, v121);
  sub_246BC057C(v111, v113, v115, v117);
  sub_246BC0F08(v111, v113, v115, v117);

  swift_release();
  v123 = (objc_class *)type metadata accessor for ParmesanGalleryItem();
  v124 = (char *)objc_allocWithZone(v123);
  uint64_t v125 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition;
  *(void *)&v124[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition] = 0;
  uint64_t v126 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views;
  *(void *)&v124[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_views] = 0;
  v127 = *(void **)&v124[v125];
  *(void *)&v124[v125] = a2;
  v128 = a2;
  v129 = v80;
  v130 = v56;
  id v131 = v122;
  v132 = v128;
  v133 = v124;

  v134 = *(void **)&v124[v126];
  *(void *)&v124[v126] = v122;
  id v159 = v131;

  v165.receiver = v133;
  v165.super_class = v123;
  id v135 = objc_msgSendSuper2(&v165, (SEL)v129 + 1560);

  v164[0] = v149;
  v164[1] = v135;
  v136 = v154;
  id v137 = v135;
  sub_246BE36AC((uint64_t)v164);
  v138 = (uint64_t *)(*(void *)&v130[v156]
                   + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion36ParmesanGalleryTransitionCoordinator_context);
  uint64_t v139 = *v138;
  uint64_t v140 = v138[1];
  v141 = (void *)v138[2];
  v155 = (void *)v138[4];
  v157 = (void *)v138[3];
  v153 = (void *)v138[5];
  uint64_t *v138 = a3;
  v138[1] = (uint64_t)&off_26FB21498;
  v138[2] = (uint64_t)v149;
  v138[3] = (uint64_t)v137;
  v138[4] = (uint64_t)v145;
  v138[5] = (uint64_t)v144;
  v142 = v136;
  id v143 = v137;
  swift_unknownObjectRetain();
  sub_246BE45A4(v149, v137);
  sub_246BE45E4(v145, v144);
  sub_246BE4624(v139, v140, v141, v157, v155, v153);
  sub_246BE41B0();
  swift_unknownObjectRelease();

  sub_246BE4688(v149, v137);
  sub_246BC80B0(v145, v144);
}

void sub_246C22BE4(void *a1, void *a2, uint64_t a3, void *a4)
{
}

void sub_246C22BFC(void *a1, void *a2, uint64_t a3, void *a4)
{
}

void sub_246C22C14(void *a1, void *a2, uint64_t a3, void *a4, void (*a5)(void, void, void, void))
{
  if (qword_2691D62D8 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_246C2C088();
  sub_246B8BE0C(v10, (uint64_t)qword_2691E00D8);
  id v11 = a4;
  id v12 = a2;
  uint64_t v13 = (char *)v11;
  id v14 = (char *)v12;
  uint64_t v15 = sub_246C2C068();
  os_log_type_t v16 = sub_246C2CED8();
  if (os_log_type_enabled(v15, v16))
  {
    id v41 = a1;
    uint64_t v43 = a5;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    v44[0] = v39;
    *(_DWORD *)uint64_t v17 = 136315650;
    sub_246BA686C(0xD00000000000001ELL, 0x8000000246C41960, v44);
    sub_246C2D1C8();
    *(_WORD *)(v17 + 12) = 2080;
    uint64_t v18 = *(void *)&v13[OBJC_IVAR___NTKParmesanGalleryView_currentItem];
    uint64_t v42 = a3;
    uint64_t v40 = v10;
    if (v18)
    {
      uint64_t v19 = *(void *)(v18 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion19ParmesanGalleryItem_composition);
      if (v19) {
        id v20 = *(id *)(v19 + OBJC_IVAR___NTKParmesanGalleryComposition_timeLayout);
      }
    }
    sub_246B80250((uint64_t *)&unk_2691D8B20);
    uint64_t v21 = sub_246C2CCA8();
    sub_246BA686C(v21, v22, v44);
    sub_246C2D1C8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2080;
    id v23 = *(id *)&v14[OBJC_IVAR___NTKParmesanGalleryComposition_timeLayout];
    id v24 = objc_msgSend(v23, sel_description);
    uint64_t v25 = sub_246C2CC48();
    unint64_t v27 = v26;

    sub_246BA686C(v25, v27, v44);
    sub_246C2D1C8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246B51000, v15, v16, "%s: Transitioning from: (%s to (%s)", (uint8_t *)v17, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24C545990](v39, -1, -1);
    MEMORY[0x24C545990](v17, -1, -1);

    a3 = v42;
    a5 = v43;
    uint64_t v10 = v40;
    a1 = v41;
    if (!v41) {
      goto LABEL_16;
    }
  }
  else
  {

    if (!a1) {
      goto LABEL_16;
    }
  }
  type metadata accessor for ParmesanGalleryComposition();
  uint64_t v28 = v14;
  id v29 = a1;
  char v30 = sub_246C2D108();

  if (v30)
  {
    if (qword_2691D62D0 != -1) {
      swift_once();
    }
    sub_246B8BE0C(v10, (uint64_t)qword_2691E00C0);
    uint64_t v31 = sub_246C2C068();
    os_log_type_t v32 = sub_246C2CF08();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_246B51000, v31, v32, "attempted transition between the same compositions; do nothing",
        v33,
        2u);
      MEMORY[0x24C545990](v33, -1, -1);
    }

    return;
  }
LABEL_16:
  a5(a1, v14, a3, v13);
  uint64_t v34 = *(void **)&v13[OBJC_IVAR___NTKParmesanGalleryView_transitionCoordinator];
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  id v35 = (void *)MEMORY[0x24C545A70](v46);
  id v36 = v34;
  if (v35)
  {
    sub_246BE2A50(1.0);
  }
  swift_beginAccess();
  uint64_t v37 = MEMORY[0x24C545A70](v45);
  if (v37)
  {
    uint64_t v38 = (void *)v37;
    sub_246BE3058();

    id v36 = v38;
  }

  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

void sub_246C230D4()
{
  uint64_t v1 = (void *)sub_246C2CC08();
  uint64_t v2 = (void *)sub_246C2CC08();
  id v3 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v1, v2, 1);

  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  id v5 = (void *)sub_246C2CC08();
  v8[4] = sub_246C232AC;
  v8[5] = v4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_246C1E8DC;
  v8[3] = &unk_26FB22D70;
  uint64_t v6 = _Block_copy(v8);
  swift_release();
  id v7 = objc_msgSend(self, sel_actionWithTitle_style_handler_, v5, 0, v6);
  _Block_release(v6);
  swift_release();

  objc_msgSend(v3, sel_addAction_, v7);
  objc_msgSend(v0, sel_presentViewController_animated_completion_, v3, 1, 0);
}

void sub_246C232AC(uint64_t a1)
{
  sub_246C20A6C(a1, v1);
}

uint64_t sub_246C232B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_246C232C4()
{
  return swift_release();
}

void sub_246C232CC(void *a1, void *a2)
{
  sub_246C1FD64(a1, a2, v2);
}

uint64_t sub_246C232D4()
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_246C2332C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  id v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *id v11 = v2;
  v11[1] = sub_246B803A8;
  return sub_246B9A99C(a1, v4, v5, v6, v7, v8, v9, v10);
}

void sub_246C23418()
{
  sub_246C2CC48();
  id v1 = objc_allocWithZone(MEMORY[0x263F157C8]);
  uint64_t v2 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_initWithType_, v2);

  uint64_t v4 = (void *)sub_246C2C008();
  uint64_t v5 = *MEMORY[0x263F15BF8];
  objc_msgSend(v3, sel_setValue_forKey_, v4, *MEMORY[0x263F15BF8]);

  uint64_t v6 = (void *)sub_246C2CC08();
  objc_msgSend(v3, sel_setName_, v6);

  sub_246C2CC48();
  id v7 = objc_allocWithZone(MEMORY[0x263F157C8]);
  uint64_t v8 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v7, sel_initWithType_, v8);

  uint64_t v10 = (void *)sub_246C2C008();
  objc_msgSend(v9, sel_setValue_forKey_, v10, v5);

  id v11 = (void *)sub_246C2CC08();
  objc_msgSend(v9, sel_setName_, v11);

  id v12 = objc_msgSend(v0, sel_layer);
  sub_246B80250(&qword_2691D7D20);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_246C34330;
  unint64_t v14 = sub_246BF7660();
  *(void *)(v13 + 32) = v3;
  *(void *)(v13 + 88) = v14;
  *(void *)(v13 + 56) = v14;
  *(void *)(v13 + 64) = v9;
  id v15 = v3;
  id v16 = v9;
  id v17 = (id)sub_246C2CD28();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setFilters_, v17);
}

uint64_t sub_246C237C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!a2) {
    goto LABEL_10;
  }
  if ((a1 != 0xD000000000000023 || a2 != (void *)0x8000000246C41C80)
    && (sub_246C2D578() & 1) == 0
    && (a1 != 0xD000000000000021 || v3 != (void *)0x8000000246C41C50)
    && (sub_246C2D578() & 1) == 0)
  {
    id v3 = (void *)sub_246C2CC08();
LABEL_10:
    v7.receiver = v2;
    v7.super_class = (Class)type metadata accessor for ParmesanColorAdjustView();
    id v5 = objc_msgSendSuper2(&v7, sel__shouldAnimatePropertyWithKey_, v3);

    return (uint64_t)v5;
  }
  return 1;
}

id sub_246C2393C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ParmesanColorAdjustView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ParmesanColorAdjustView()
{
  return self;
}

void sub_246C23AB0(char a1)
{
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for ParmesanShuffleSelectionFlowController();
  objc_msgSendSuper2(&v7, sel_viewWillAppear_, a1 & 1);
  unsigned int v3 = objc_msgSend(*(id *)&v1[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_suggestionsDataSource], sel_hasSuggestions);
  if (*(void *)&v1[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_shuffleSelectionViewController])
  {
    if (v3) {
      goto LABEL_11;
    }
LABEL_10:
    sub_246C23BD4();
    goto LABEL_11;
  }
  if (*(void *)&v1[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_noContentViewController]) {
    char v4 = v3;
  }
  else {
    char v4 = 1;
  }
  if (v4)
  {
    if (v3)
    {
      sub_246C23E94();
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_11:
  id v5 = objc_msgSend(v1, sel_sheetPresentationController);
  if (v5)
  {
    uint64_t v6 = v5;
    objc_msgSend(v5, sel_setPrefersGrabberVisible_, 1);
  }
}

void sub_246C23BD4()
{
  uint64_t v1 = OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_shuffleSelectionViewController;
  objc_super v2 = *(void **)&v0[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_shuffleSelectionViewController];
  if (!v2)
  {
LABEL_4:
    objc_super v7 = *(void **)&v0[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_editor];
    uint64_t v8 = *(void **)&v0[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_face];
    char v9 = v0[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_inGallery];
    uint64_t v10 = objc_allocWithZone((Class)type metadata accessor for ParmesanNoShufflesViewController());
    swift_unknownObjectWeakInit();
    *(void *)&v10[OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_editor] = v7;
    *(void *)&v10[OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_face] = v8;
    v10[OBJC_IVAR___NTKParmesanShuffleSelectionBaseViewController_inGallery] = v9;
    v23.receiver = v10;
    v23.super_class = (Class)type metadata accessor for ParmesanShuffleSelectionBaseViewController();
    id v11 = v7;
    id v12 = v8;
    id v13 = objc_msgSendSuper2(&v23, sel_initWithNibName_bundle_, 0, 0);
    MEMORY[0x24C545A70](&v0[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_delegate]);
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    objc_msgSend(v0, sel_addChildViewController_, v13, v23.receiver, v23.super_class);
    id v14 = objc_msgSend(v0, sel_view);
    if (v14)
    {
      id v15 = v14;
      id v16 = objc_msgSend(v13, sel_view);
      if (v16)
      {
        id v17 = v16;
        objc_msgSend(v15, sel_addSubview_, v16);

        id v18 = objc_msgSend(v13, sel_view);
        if (v18)
        {
          uint64_t v19 = v18;
          objc_msgSend(v18, sel_constrainToSuperviewWithEdges_insets_useLayoutMargins_, 15, 0, *MEMORY[0x263F82250], *(double *)(MEMORY[0x263F82250] + 8), *(double *)(MEMORY[0x263F82250] + 16), *(double *)(MEMORY[0x263F82250] + 24));

          objc_msgSend(v13, sel_didMoveToParentViewController_, v0);
          id v20 = *(void **)&v0[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_noContentViewController];
          *(void *)&v0[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_noContentViewController] = v13;
          id v21 = v13;

          id v22 = objc_msgSend(v0, sel_navigationItem);
          objc_msgSend(v22, sel_setLeftBarButtonItem_, 0);

          return;
        }
        goto LABEL_10;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v3 = v2;
  objc_msgSend(v3, sel_willMoveToParentViewController_, 0);
  id v4 = objc_msgSend(v3, sel_view);
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(v4, sel_removeFromSuperview);

    objc_msgSend(v3, sel_removeFromParentViewController);
    objc_msgSend(v3, sel_didMoveToParentViewController_, 0);
    uint64_t v6 = *(void **)&v0[v1];
    *(void *)&v0[v1] = 0;

    goto LABEL_4;
  }
LABEL_11:
  __break(1u);
}

void sub_246C23E94()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_noContentViewController;
  id v3 = *(void **)&v0[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_noContentViewController];
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v4, sel_willMoveToParentViewController_, 0);
    id v5 = objc_msgSend(v4, sel_view);
    if (!v5)
    {
LABEL_14:
      __break(1u);
      return;
    }
    uint64_t v6 = v5;
    objc_msgSend(v5, sel_removeFromSuperview);

    objc_msgSend(v4, sel_removeFromParentViewController);
    objc_msgSend(v4, sel_didMoveToParentViewController_, 0);
    objc_super v7 = *(void **)&v1[v2];
    *(void *)&v1[v2] = 0;
  }
  uint64_t v8 = *(void **)&v1[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_editor];
  char v9 = *(void **)&v1[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_face];
  char v10 = v1[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_inGallery];
  objc_allocWithZone((Class)type metadata accessor for ParmesanShuffleSelectionViewController());
  id v11 = sub_246B8143C(v8, v9, v10);
  MEMORY[0x24C545A70](&v1[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_delegate]);
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  objc_msgSend(v1, sel_addChildViewController_, v11);
  id v12 = objc_msgSend(v1, sel_view);
  if (!v12)
  {
    __break(1u);
    goto LABEL_12;
  }
  id v13 = v12;
  id v14 = objc_msgSend(v11, sel_view);
  if (!v14)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  id v15 = v14;
  objc_msgSend(v13, sel_addSubview_, v14);

  id v16 = objc_msgSend(v11, sel_view);
  if (!v16)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v17 = v16;
  objc_msgSend(v16, sel_constrainToSuperviewWithEdges_insets_useLayoutMargins_, 15, 0, *MEMORY[0x263F82250], *(double *)(MEMORY[0x263F82250] + 8), *(double *)(MEMORY[0x263F82250] + 16), *(double *)(MEMORY[0x263F82250] + 24));

  objc_msgSend(v11, sel_didMoveToParentViewController_, v1);
  id v18 = *(void **)&v1[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_shuffleSelectionViewController];
  *(void *)&v1[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_shuffleSelectionViewController] = v11;
  uint64_t v19 = v11;

  sub_246BB6A38();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v21 = (void *)sub_246C2CC08();
  id v22 = (void *)sub_246C2CC08();
  id v23 = objc_msgSend(ObjCClassFromMetadata, sel_localizedStringForKey_comment_, v21, v22);

  sub_246C2CC48();
  uint64_t v24 = type metadata accessor for ParmesanShuffleSelectionFlowController();
  v35[3] = v24;
  v35[0] = v1;
  uint64_t v25 = v1;
  unint64_t v26 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();
  if (v24)
  {
    unint64_t v27 = sub_246B8F7E8(v35, v24);
    uint64_t v28 = *(void *)(v24 - 8);
    MEMORY[0x270FA5388](v27);
    char v30 = (char *)v35 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v28 + 16))(v30);
    uint64_t v31 = sub_246C2D558();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v24);
    sub_246B8EB94((uint64_t)v35);
  }
  else
  {
    uint64_t v31 = 0;
  }
  id v32 = objc_allocWithZone(MEMORY[0x263F824A8]);
  id v33 = objc_msgSend(v32, sel_initWithTitle_style_target_action_, v26, 0, v31, sel_userDidSelectCancel_, v35[0]);

  swift_unknownObjectRelease();
  id v34 = objc_msgSend(v25, sel_navigationItem);
  objc_msgSend(v34, sel_setLeftBarButtonItem_, v33);
}

id sub_246C24398()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ParmesanShuffleSelectionFlowController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ParmesanShuffleSelectionFlowController()
{
  return self;
}

uint64_t sub_246C2447C()
{
  uint64_t v1 = v0 + OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_delegate;
  uint64_t result = swift_unknownObjectWeakAssign();
  if (*(void *)(v0 + OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_shuffleSelectionViewController))
  {
    MEMORY[0x24C545A70](v1);
    swift_unknownObjectWeakAssign();
    uint64_t result = swift_unknownObjectRelease();
  }
  if (*(void *)(v0 + OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_noContentViewController))
  {
    MEMORY[0x24C545A70](v1);
    swift_unknownObjectWeakAssign();
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_246C24550(void *a1, void *a2, char a3)
{
  uint64_t v7 = OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_suggestionsDataSource;
  uint64_t v8 = self;
  char v9 = v3;
  id v10 = objc_msgSend(v8, sel_sharedPhotoLibrary);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5DE80]), sel_initWithPhotoLibrary_, v10);

  *(void *)&v3[v7] = v11;
  swift_unknownObjectWeakInit();
  *(void *)&v9[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_shuffleSelectionViewController] = 0;
  *(void *)&v9[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_noContentViewController] = 0;
  *(void *)&v9[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_editor] = a1;
  *(void *)&v9[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_face] = a2;
  v9[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_inGallery] = a3;
  id v12 = a1;
  id v13 = a2;

  v15.receiver = v9;
  v15.super_class = (Class)type metadata accessor for ParmesanShuffleSelectionFlowController();
  return objc_msgSendSuper2(&v15, sel_initWithNibName_bundle_, 0, 0);
}

void sub_246C24678()
{
  uint64_t v1 = OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_suggestionsDataSource;
  id v2 = objc_msgSend(self, sel_sharedPhotoLibrary);
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F5DE80]), sel_initWithPhotoLibrary_, v2);

  *(void *)&v0[v1] = v3;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_shuffleSelectionViewController] = 0;
  *(void *)&v0[OBJC_IVAR___NTKParmesanShuffleSelectionFlowController_noContentViewController] = 0;

  sub_246C2D3A8();
  __break(1u);
}

uint64_t sub_246C24760()
{
  return swift_initClassMetadata2();
}

id sub_246C247A4()
{
  id result = objc_msgSend(v0, sel_view);
  if (result)
  {
    self;
    return (id)swift_dynamicCastObjCClassUnconditional();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_246C24814(uint64_t a1)
{
  id v2 = *(void **)(v1 + qword_2691D8B90);
  *(void *)(v1 + qword_2691D8B90) = a1;
}

uint64_t sub_246C24828()
{
  uint64_t v1 = *MEMORY[0x263F8EED0] & *v0;
  long long v2 = *(_OWORD *)(v1 + 0x60);
  v11[0] = *(_OWORD *)(v1 + 0x50);
  v11[1] = v2;
  uint64_t v3 = sub_246C2C2E8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v11 - v6;
  uint64_t result = (*(uint64_t (**)(uint64_t))(v1 + 176))(v5);
  char v9 = *(void **)((char *)v0 + qword_2691D8B90);
  if (v9)
  {
    id v10 = v9;
    sub_246C2C338();

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_246C24970(void *a1)
{
  uint64_t v3 = *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x58);
  uint64_t v4 = sub_246C2D1A8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v15 - v7;
  uint64_t v9 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v6);
  id v11 = (char *)&v15 - v10;
  id v12 = (void *)sub_246C2BC78();
  objc_msgSend(a1, sel_deselectItemAtIndexPath_animated_, v12, 1);

  id v13 = *(void **)((char *)v1 + qword_2691D8B90);
  if (v13)
  {
    id v14 = v13;
    sub_246C2C348();

    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v3) == 1)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v8, v3);
      (*(void (**)(char *))((*MEMORY[0x263F8EED0] & *v1) + 0xC0))(v11);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v3);
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_246C24BCC()
{
  uint64_t v1 = v0;
  long long v2 = (void *)(*MEMORY[0x263F8EED0] & *(void *)v0);
  uint64_t v3 = sub_246C2C418();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_246C2C438();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F81FC8], v3);
  sub_246C2C428();
  sub_246C254AC();
  id v11 = (void *)sub_246C2D078();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82528]), sel_initWithFrame_collectionViewLayout_, v11, 0.0, 0.0, 0.0, 0.0);

  objc_msgSend(v1, sel_setView_, v12);
  uint64_t v14 = v2[11];
  uint64_t v15 = v2[12];
  uint64_t v16 = v2[13];
  v22[0] = v2[10];
  uint64_t v13 = v22[0];
  v22[1] = v14;
  _OWORD v22[2] = v15;
  v22[3] = v16;
  sub_246C2C3D8();
  sub_246C247A4();
  uint64_t v17 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v18 = (void *)swift_allocObject();
  v18[2] = v13;
  v18[3] = v14;
  v18[4] = v15;
  v18[5] = v16;
  v18[6] = v17;
  uint64_t v19 = sub_246C2C308();
  id v20 = *(void **)&v1[qword_2691D8B90];
  *(void *)&v1[qword_2691D8B90] = v19;

  id v21 = sub_246C247A4();
  objc_msgSend(v21, sel_setDelegate_, v1);
}

uint64_t sub_246C24ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a4 + 16;
  swift_beginAccess();
  uint64_t v7 = (void *)MEMORY[0x24C545A70](v6);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v7) + 0xA0))(a3, a2);

  return v9;
}

void sub_246C24F7C(void *a1)
{
  id v1 = a1;
  sub_246C24BCC();
}

uint64_t sub_246C24FC4(char a1)
{
  long long v4 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v1) + 0x50);
  long long v5 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v1) + 0x60);
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for ParmesanDebugBaseListViewController();
  objc_msgSendSuper2(&v6, sel_viewWillAppear_, a1 & 1, v4, v5);
  return sub_246C24828();
}

void sub_246C25050(void *a1, uint64_t a2, char a3)
{
  id v4 = a1;
  sub_246C24FC4(a3);
}

uint64_t sub_246C250A4()
{
  return sub_246C2C2D8();
}

uint64_t sub_246C2510C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_246C2BCD8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246C2BC88();
  id v9 = a3;
  id v10 = a1;
  sub_246C24970(v9);

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

id sub_246C25208(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *MEMORY[0x263F8EED0] & *v3;
  *(void *)((char *)v3 + qword_2691D8B90) = 0;
  if (a2)
  {
    uint64_t v6 = (void *)sub_246C2CC08();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  long long v9 = *(_OWORD *)(v5 + 80);
  long long v10 = *(_OWORD *)(v5 + 96);
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for ParmesanDebugBaseListViewController();
  id v7 = objc_msgSendSuper2(&v11, sel_initWithNibName_bundle_, v6, a3, v9, v10);

  return v7;
}

id sub_246C252E4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v5 = sub_246C2CC48();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return sub_246C25208(v5, v7, a4);
}

id sub_246C25344(void *a1)
{
  uint64_t v3 = *MEMORY[0x263F8EED0] & *v1;
  *(void *)((char *)v1 + qword_2691D8B90) = 0;
  long long v6 = *(_OWORD *)(v3 + 80);
  long long v7 = *(_OWORD *)(v3 + 96);
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for ParmesanDebugBaseListViewController();
  id v4 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1, v6, v7);

  return v4;
}

id sub_246C253E4(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_246C25344(a3);
}

id sub_246C2540C()
{
  long long v2 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v0) + 0x50);
  long long v3 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v0) + 0x60);
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for ParmesanDebugBaseListViewController();
  return objc_msgSendSuper2(&v4, sel_dealloc, v2, v3);
}

void sub_246C25484(uint64_t a1)
{
}

uint64_t type metadata accessor for ParmesanDebugBaseListViewController()
{
  return swift_getGenericMetadata();
}

unint64_t sub_246C254AC()
{
  unint64_t result = qword_2691D8C18;
  if (!qword_2691D8C18)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2691D8C18);
  }
  return result;
}

uint64_t sub_246C254EC()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_246C25524()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_246C2555C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_246C24ECC(a1, a2, a3, *(void *)(v3 + 48));
}

char *sub_246C2556C(double a1, double a2, double a3, double a4)
{
  long long v9 = &v4[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_timeRect];
  *(void *)long long v9 = 0;
  *((void *)v9 + 1) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *((_OWORD *)v9 + 1) = _Q0;
  *(void *)&v4[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_currentFontAttributes] = MEMORY[0x263F8EE80];
  id v15 = objc_allocWithZone(MEMORY[0x263F828E0]);
  uint64_t v16 = v4;
  id v17 = objc_msgSend(v15, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v18 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_hourLabel;
  *(void *)&v16[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_hourLabel] = v17;
  objc_msgSend(v17, sel_setTextAlignment_, 1);
  uint64_t v19 = self;
  id v20 = v17;
  id v21 = objc_msgSend(v19, sel_whiteColor);
  objc_msgSend(v20, sel_setTextColor_, v21);

  id v22 = *(void **)&v16[v18];
  objc_msgSend(v22, sel_setLineBreakMode_, 2);
  objc_msgSend(v22, sel_setNumberOfLines_, 0);
  id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v24 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_minuteLabel;
  *(void *)&v16[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_minuteLabel] = v23;
  objc_msgSend(v23, sel_setTextAlignment_, 1);
  id v25 = v23;
  id v26 = objc_msgSend(v19, sel_whiteColor);
  objc_msgSend(v25, sel_setTextColor_, v26);

  unint64_t v27 = *(void **)&v16[v24];
  objc_msgSend(v27, sel_setLineBreakMode_, 2);
  id v28 = v27;
  objc_msgSend(v28, sel_setNumberOfLines_, 0);

  v33.receiver = v16;
  v33.super_class = (Class)type metadata accessor for ParmesanStackedTimeLabel();
  uint64_t v29 = (char *)objc_msgSendSuper2(&v33, sel_initWithFrame_, a1, a2, a3, a4);
  uint64_t v30 = *(void *)&v29[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_hourLabel];
  uint64_t v31 = v29;
  objc_msgSend(v31, sel_addSubview_, v30);
  objc_msgSend(v31, sel_addSubview_, *(void *)&v31[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_minuteLabel]);

  return v31;
}

id sub_246C2589C()
{
  id v1 = v0;
  uint64_t v49 = *MEMORY[0x263EF8340];
  v47.receiver = v0;
  v47.super_class = (Class)type metadata accessor for ParmesanStackedTimeLabel();
  objc_msgSendSuper2(&v47, sel_layoutSubviews);
  double v2 = *(double *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_timeRect];
  double v3 = *(double *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_timeRect + 8];
  double v4 = *(double *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_timeRect + 16];
  double v5 = *(double *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_timeRect + 24];
  objc_msgSend(v0, sel_bounds);
  CGFloat v8 = v7 + v2 * v6;
  CGFloat v11 = v10 + v3 * v9;
  CGFloat v12 = v4 * v6;
  CGFloat v13 = v5 * v9;
  id v14 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v14, sel_scale);
  double v16 = v15;

  v50.origin.CGFloat x = v8;
  v50.origin.double y = v11;
  v50.size.CGFloat width = v12;
  v50.size.height = v13;
  CGFloat Height = CGRectGetHeight(v50);
  memset(&slice, 0, sizeof(slice));
  CGFloat v18 = round((v16 * Height + -16.0) * 0.5) / v16;
  memset(&remainder, 0, sizeof(remainder));
  v51.origin.CGFloat x = v8;
  v51.origin.double y = v11;
  v51.size.CGFloat width = v12;
  v51.size.height = v13;
  CGRectDivide(v51, &slice, &remainder, v18, CGRectMinYEdge);
  CGFloat width = slice.size.width;
  CGFloat x = slice.origin.x;
  double y = slice.origin.y;
  double v20 = slice.size.height;
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v52.origin.CGFloat x = v8;
  v52.origin.double y = v11;
  v52.size.CGFloat width = v12;
  v52.size.height = v13;
  CGRectDivide(v52, &slice, &remainder, v18, CGRectMaxYEdge);
  double v21 = slice.origin.y;
  CGFloat v42 = slice.origin.x;
  CGFloat v22 = slice.size.width;
  double v45 = slice.size.height;
  uint64_t v23 = *(void *)&v1[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_currentFontAttributes];
  if (!*(void *)(v23 + 16))
  {
    memset(&slice, 0, sizeof(slice));
LABEL_9:
    sub_246BAD92C((uint64_t)&slice);
    goto LABEL_10;
  }
  id v24 = (id)*MEMORY[0x263F814F0];
  swift_bridgeObjectRetain();
  unint64_t v25 = sub_246C162A0((uint64_t)v24);
  if (v26) {
    sub_246B8E790(*(void *)(v23 + 56) + 32 * v25, (uint64_t)&slice);
  }
  else {
    memset(&slice, 0, sizeof(slice));
  }

  swift_bridgeObjectRelease();
  if (!*(void *)&slice.size.height) {
    goto LABEL_9;
  }
  sub_246B8F1E0(0, &qword_2691D8090);
  if (swift_dynamicCast())
  {
    CGFloat v27 = remainder.origin.x;
    objc_msgSend(*(id *)&remainder.origin.x, sel_descender);
    UIRoundToViewScale();
    double v29 = v28;
    objc_msgSend(*(id *)&v27, sel_ascender);
    UIRoundToViewScale();
    double v31 = v30;
    objc_msgSend(*(id *)&v27, sel_capHeight);
    UIRoundToViewScale();
    double v33 = v32;

    double v34 = y - (v31 - v33) + -4.0;
    double v20 = v31 - v29 + 8.0;
    double v21 = v21 + v45 - v31 + -4.0;
    double y = v34;
    double v45 = v20;
  }
LABEL_10:
  id v35 = *(void **)&v1[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_hourLabel];
  if (objc_msgSend(v35, sel_textAlignment) == (id)2)
  {
    v53.origin.CGFloat x = x;
    v53.origin.double y = y;
    v53.size.CGFloat width = width;
    v53.size.height = v20;
    CGRectGetMinY(v53);
    v54.origin.CGFloat x = x;
    v54.origin.double y = y;
    v54.size.CGFloat width = width;
    v54.size.height = v20;
    CGRectGetMaxX(v54);
    double v36 = 0.0;
  }
  else
  {
    v55.origin.CGFloat x = x;
    v55.origin.double y = y;
    v55.size.CGFloat width = width;
    v55.size.height = v20;
    CGFloat MinX = CGRectGetMinX(v55);
    v56.origin.CGFloat x = x;
    v56.origin.double y = y;
    v56.size.CGFloat width = width;
    v56.size.height = v20;
    CGRectGetMinY(v56);
    objc_msgSend(v1, sel_bounds);
    v57.origin.CGFloat x = x;
    v57.origin.double y = y;
    v57.size.CGFloat width = width;
    v57.size.height = v20;
    CGRectGetMinX(v57);
    double v36 = MinX;
  }
  objc_msgSend(v35, sel_setFrame_, nullsub_2(v36));
  uint64_t v37 = *(void **)&v1[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_minuteLabel];
  if (objc_msgSend(v37, sel_textAlignment) == (id)2)
  {
    v58.origin.CGFloat x = v42;
    v58.origin.double y = v21;
    v58.size.CGFloat width = v22;
    v58.size.height = v45;
    CGRectGetMinY(v58);
    v59.origin.CGFloat x = v42;
    v59.origin.double y = v21;
    v59.size.CGFloat width = v22;
    v59.size.height = v45;
    CGRectGetMaxX(v59);
    double v38 = 0.0;
  }
  else
  {
    v60.origin.CGFloat x = v42;
    v60.origin.double y = v21;
    v60.size.CGFloat width = v22;
    v60.size.height = v45;
    CGFloat v39 = CGRectGetMinX(v60);
    v61.origin.CGFloat x = v42;
    v61.origin.double y = v21;
    v61.size.CGFloat width = v22;
    v61.size.height = v45;
    CGRectGetMinY(v61);
    objc_msgSend(v1, sel_bounds);
    v62.origin.CGFloat x = v42;
    v62.origin.double y = v21;
    v62.size.CGFloat width = v22;
    v62.size.height = v45;
    CGRectGetMinX(v62);
    double v38 = v39;
  }
  return objc_msgSend(v37, sel_setFrame_, nullsub_2(v38));
}

void sub_246C25DC4(uint64_t a1, void *a2)
{
  double v3 = v2;
  sub_246B80250(&qword_2691D8088);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246C33620;
  double v7 = (void *)*MEMORY[0x263F814F0];
  *(void *)(inited + 32) = *MEMORY[0x263F814F0];
  *(void *)(inited + 64) = sub_246B8F1E0(0, &qword_2691D8C40);
  *(void *)(inited + 40) = a2;
  id v8 = v7;
  id v9 = a2;
  unint64_t v10 = sub_246C10C4C(inited);
  uint64_t v38 = a1;
  CLKLocaleNumberSystemFromNumeralOption();
  id v11 = (id)CLKLocaleRenderingHintLanguageIdentifierForNumberingSystem();
  if (v11)
  {
    CGFloat v12 = v11;
    uint64_t v13 = sub_246C2CC48();
    uint64_t v15 = v14;

    double v16 = (void *)*MEMORY[0x263F081E8];
    uint64_t v41 = MEMORY[0x263F8D310];
    *(void *)&long long v40 = v13;
    *((void *)&v40 + 1) = v15;
    sub_246BAAFEC(&v40, v39);
    id v17 = v16;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_246C1AA14(v39, v17, isUniquelyReferenced_nonNull_native);

    swift_bridgeObjectRelease();
  }
  uint64_t v19 = *(void **)&v3[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_hourLabel];
  id v20 = objc_msgSend(v19, sel_text);
  if (v20)
  {
    double v21 = v20;
    sub_246C2CC48();
  }
  id v22 = objc_allocWithZone(MEMORY[0x263F086A0]);
  swift_bridgeObjectRetain();
  uint64_t v23 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_246BE62A8();
  id v24 = (void *)sub_246C2CBA8();
  swift_bridgeObjectRelease();
  id v25 = objc_msgSend(v22, sel_initWithString_attributes_, v23, v24);

  uint64_t v37 = v25;
  objc_msgSend(v19, sel_setAttributedText_, v25);
  char v26 = *(void **)&v3[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_minuteLabel];
  id v27 = objc_msgSend(v26, sel_text);
  if (v27)
  {
    double v28 = v27;
    sub_246C2CC48();
  }
  id v29 = objc_allocWithZone(MEMORY[0x263F086A0]);
  swift_bridgeObjectRetain();
  double v30 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();
  double v31 = (void *)sub_246C2CBA8();
  swift_bridgeObjectRelease();
  id v32 = objc_msgSend(v29, sel_initWithString_attributes_, v30, v31);

  objc_msgSend(v26, sel_setAttributedText_, v32);
  double v33 = *(char **)(v38 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout);
  uint64_t v34 = *(void *)&v33[OBJC_IVAR___NTKParmesanTimeLayout_scale];
  sub_246B80250(&qword_2691D72D0);
  if ((unint64_t)(v34 - 1) < 2)
  {
    uint64_t v35 = 1;
LABEL_14:
    objc_msgSend(v19, sel_setTextAlignment_, v35);
    objc_msgSend(v26, sel_setTextAlignment_, v35);
    *(void *)&v3[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_currentFontAttributes] = v10;
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_setNeedsLayout);

    return;
  }
  if (!v34) {
    goto LABEL_13;
  }
  if (v34 == 3)
  {
    uint64_t v35 = *(void *)&v33[OBJC_IVAR___NTKParmesanTimeLayout_alignment];
    if (!v35) {
      goto LABEL_14;
    }
    if (v35 == 1)
    {
LABEL_13:
      uint64_t v35 = 2;
      goto LABEL_14;
    }
  }
  double v36 = v33;
  sub_246C2D568();
  __break(1u);
}

id sub_246C261B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ParmesanStackedTimeLabel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ParmesanStackedTimeLabel()
{
  return self;
}

id sub_246C26268(double a1, double a2, double a3, double a4)
{
  double v5 = (double *)&v4[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_timeRect];
  double *v5 = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  return objc_msgSend(v4, sel_setNeedsLayout);
}

void sub_246C2628C(uint64_t a1, uint64_t a2)
{
  id v3 = sub_246BAC128(a1, a2, *(void *)(a1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface));
  sub_246C25DC4(a1, v3);
}

void sub_246C262EC()
{
}

void sub_246C262FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = sub_246BAC2C0(a1, a2, a3, *(void *)(a3 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface));
  sub_246C25DC4(a3, v4);
}

void sub_246C26360()
{
  uint64_t v8 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_currentFontAttributes;
  id v1 = objc_allocWithZone(MEMORY[0x263F086A0]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  objc_super v2 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_246BE62A8();
  id v3 = (void *)sub_246C2CBA8();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v1, sel_initWithString_attributes_, v2, v3, v8);

  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_hourLabel), sel_setAttributedText_, v4);
  id v5 = objc_allocWithZone(MEMORY[0x263F086A0]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  double v6 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();
  double v7 = (void *)sub_246C2CBA8();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v5, sel_initWithString_attributes_, v6, v7);

  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion24ParmesanStackedTimeLabel_minuteLabel), sel_setAttributedText_, v9);
}

id sub_246C26574()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_246C265DC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = sub_246C2CC48();
  double v7 = (uint64_t *)(a1 + *a4);
  *double v7 = v6;
  v7[1] = v8;

  return swift_bridgeObjectRelease();
}

uint64_t sub_246C26718()
{
  sub_246C2D278();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "NTKAlbumID(id=");
  swift_bridgeObjectRetain();
  sub_246C2CCD8();
  swift_bridgeObjectRelease();
  sub_246C2CCD8();
  swift_bridgeObjectRetain();
  sub_246C2CCD8();
  swift_bridgeObjectRelease();
  sub_246C2CCD8();
  return v1[0];
}

id sub_246C2684C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NTKAlbumID();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for NTKAlbumID()
{
  return self;
}

uint64_t sub_246C268F8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_246C2690C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_246C26920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_246C26934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t sub_246C26948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  id v4 = *(uint64_t (**)(void *))(a3 + 40);
  v7[0] = *(void *)a1;
  v7[1] = v3;
  long long v5 = *(_OWORD *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 16);
  long long v9 = v5;
  return v4(v7);
}

uint64_t sub_246C2698C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

unint64_t sub_246C269A0(unint64_t a1)
{
  if (a1 > 8) {
    return sub_246C1798C((uint64_t)&unk_26FB1EEF8);
  }
  else {
    return sub_246C1798C((uint64_t)*(&off_2651FC898 + a1));
  }
}

char *sub_246C269C4(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR___NTKParmesanSingleTimeLabel_alignment] = 0;
  long long v9 = &v4[OBJC_IVAR___NTKParmesanSingleTimeLabel_timeRect];
  *(void *)long long v9 = 0;
  *((void *)v9 + 1) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *((_OWORD *)v9 + 1) = _Q0;
  *(void *)&v4[OBJC_IVAR___NTKParmesanSingleTimeLabel_currentFontAttributes] = MEMORY[0x263F8EE80];
  id v15 = objc_allocWithZone(MEMORY[0x263F828E0]);
  double v16 = v4;
  id v17 = objc_msgSend(v15, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v18 = OBJC_IVAR___NTKParmesanSingleTimeLabel_timeLabel;
  *(void *)&v16[OBJC_IVAR___NTKParmesanSingleTimeLabel_timeLabel] = v17;
  objc_msgSend(v17, sel_setTextAlignment_, 1);
  uint64_t v19 = self;
  id v20 = v17;
  id v21 = objc_msgSend(v19, sel_whiteColor);
  objc_msgSend(v20, sel_setTextColor_, v21);

  id v22 = *(id *)&v16[v18];
  objc_msgSend(v22, sel_setLineBreakMode_, 2);

  v25.receiver = v16;
  v25.super_class = (Class)type metadata accessor for ParmesanSingleTimeLabel();
  uint64_t v23 = (char *)objc_msgSendSuper2(&v25, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v23, sel_addSubview_, *(void *)&v23[OBJC_IVAR___NTKParmesanSingleTimeLabel_timeLabel]);
  return v23;
}

id sub_246C26C24()
{
  id v1 = v0;
  v34.receiver = v0;
  v34.super_class = (Class)type metadata accessor for ParmesanSingleTimeLabel();
  objc_msgSendSuper2(&v34, sel_layoutSubviews);
  double v3 = *(double *)&v0[OBJC_IVAR___NTKParmesanSingleTimeLabel_timeRect];
  double v2 = *(double *)&v0[OBJC_IVAR___NTKParmesanSingleTimeLabel_timeRect + 8];
  double v5 = *(double *)&v0[OBJC_IVAR___NTKParmesanSingleTimeLabel_timeRect + 16];
  double v4 = *(double *)&v0[OBJC_IVAR___NTKParmesanSingleTimeLabel_timeRect + 24];
  objc_msgSend(v0, sel_bounds);
  double v7 = v6;
  double v9 = v8;
  double v12 = v11 + v2 * v10;
  double v13 = v4 * v10;
  uint64_t v14 = *(void *)&v0[OBJC_IVAR___NTKParmesanSingleTimeLabel_currentFontAttributes];
  if (!*(void *)(v14 + 16))
  {
    long long v32 = 0u;
    long long v33 = 0u;
LABEL_10:
    sub_246BAD92C((uint64_t)&v32);
    goto LABEL_13;
  }
  id v15 = (id)*MEMORY[0x263F814F0];
  swift_bridgeObjectRetain();
  unint64_t v16 = sub_246C162A0((uint64_t)v15);
  if (v17)
  {
    sub_246B8E790(*(void *)(v14 + 56) + 32 * v16, (uint64_t)&v32);
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
  }

  swift_bridgeObjectRelease();
  if (!*((void *)&v33 + 1)) {
    goto LABEL_10;
  }
  sub_246B8F1E0(0, &qword_2691D8090);
  if (swift_dynamicCast())
  {
    objc_msgSend(v31, sel_descender);
    UIRoundToViewScale();
    double v30 = v18;
    objc_msgSend(v31, sel_ascender);
    UIRoundToViewScale();
    double v20 = v19;
    objc_msgSend(v31, sel_capHeight);
    UIRoundToViewScale();
    double v22 = v21;

    if (*(void *)&v1[OBJC_IVAR___NTKParmesanSingleTimeLabel_alignment]) {
      double v23 = v13 + v12 - v20;
    }
    else {
      double v23 = v12 - (v20 - v22);
    }
    double v12 = v23 + -4.0;
    double v13 = v20 - v30 + 8.0;
  }
LABEL_13:
  double v24 = v7 + v3 * v9;
  double v25 = v5 * v9;
  char v26 = *(void **)&v1[OBJC_IVAR___NTKParmesanSingleTimeLabel_timeLabel];
  id v27 = objc_msgSend(v26, sel_textAlignment);
  v35.origin.CGFloat x = v24;
  v35.origin.double y = v12;
  v35.size.CGFloat width = v25;
  v35.size.height = v13;
  double MinY = CGRectGetMinY(v35);
  if (v27 == (id)2)
  {
    v36.origin.CGFloat x = v24;
    v36.origin.double y = v12;
    v36.size.CGFloat width = v25;
    v36.size.height = v13;
    CGRectGetMaxX(v36);
  }
  else
  {
    objc_msgSend(v1, sel_bounds, MinY);
  }
  return objc_msgSend(v26, sel_setFrame_, sub_246BF4690());
}

id sub_246C26EFC(uint64_t a1, void *a2)
{
  double v3 = v2;
  sub_246B80250(&qword_2691D8088);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246C33620;
  double v7 = (void *)*MEMORY[0x263F814F0];
  *(void *)(inited + 32) = *MEMORY[0x263F814F0];
  *(void *)(inited + 64) = sub_246B8F1E0(0, &qword_2691D8C40);
  *(void *)(inited + 40) = a2;
  id v8 = v7;
  id v9 = a2;
  unint64_t v10 = sub_246C10C4C(inited);
  CLKLocaleNumberSystemFromNumeralOption();
  id v11 = (id)CLKLocaleRenderingHintLanguageIdentifierForNumberingSystem();
  if (v11)
  {
    double v12 = v11;
    uint64_t v13 = sub_246C2CC48();
    uint64_t v15 = v14;

    unint64_t v16 = (void *)*MEMORY[0x263F081E8];
    uint64_t v35 = MEMORY[0x263F8D310];
    *(void *)&long long v34 = v13;
    *((void *)&v34 + 1) = v15;
    sub_246BAAFEC(&v34, v33);
    id v17 = v16;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v32 = v10;
    sub_246C1AA14(v33, v17, isUniquelyReferenced_nonNull_native);

    swift_bridgeObjectRelease();
  }
  double v19 = *(void **)&v3[OBJC_IVAR___NTKParmesanSingleTimeLabel_timeLabel];
  id v20 = objc_msgSend(v19, sel_text, v32);
  if (v20)
  {
    double v21 = v20;
    sub_246C2CC48();
  }
  id v22 = objc_allocWithZone(MEMORY[0x263F086A0]);
  swift_bridgeObjectRetain();
  double v23 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_246BE62A8();
  double v24 = (void *)sub_246C2CBA8();
  swift_bridgeObjectRelease();
  id v25 = objc_msgSend(v22, sel_initWithString_attributes_, v23, v24);

  objc_msgSend(v19, sel_setAttributedText_, v25);
  uint64_t v26 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout;
  id v27 = *(char **)(a1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout);
  uint64_t v28 = *(void *)&v27[OBJC_IVAR___NTKParmesanTimeLayout_scale];
  sub_246B80250(&qword_2691D72D0);
  if ((unint64_t)(v28 - 1) < 2)
  {
    uint64_t v29 = 1;
LABEL_12:
    objc_msgSend(v19, sel_setTextAlignment_, v29);
    *(void *)&v3[OBJC_IVAR___NTKParmesanSingleTimeLabel_alignment] = *(void *)(*(void *)(a1 + v26)
                                                                                 + OBJC_IVAR___NTKParmesanTimeLayout_alignment);
    *(void *)&v3[OBJC_IVAR___NTKParmesanSingleTimeLabel_currentFontAttributes] = v10;
    swift_bridgeObjectRelease();
    return objc_msgSend(v3, sel_setNeedsLayout);
  }
  if (!v28) {
    goto LABEL_11;
  }
  if (v28 == 3)
  {
    uint64_t v29 = *(void *)&v27[OBJC_IVAR___NTKParmesanTimeLayout_alignment];
    if (!v29) {
      goto LABEL_12;
    }
    if (v29 == 1)
    {
LABEL_11:
      uint64_t v29 = 2;
      goto LABEL_12;
    }
  }
  id v31 = v27;
  id result = (id)sub_246C2D568();
  __break(1u);
  return result;
}

id sub_246C27200()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ParmesanSingleTimeLabel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ParmesanSingleTimeLabel()
{
  return self;
}

id sub_246C272A4(double a1, double a2, double a3, double a4)
{
  double v5 = (double *)&v4[OBJC_IVAR___NTKParmesanSingleTimeLabel_timeRect];
  double *v5 = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  return objc_msgSend(v4, sel_setNeedsLayout);
}

void sub_246C272C8(uint64_t a1, uint64_t a2)
{
  id v3 = sub_246BAC128(a1, a2, *(void *)(a1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface));
  sub_246C26EFC(a1, v3);
}

void sub_246C27328()
{
}

void sub_246C27334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = sub_246BAC2C0(a1, a2, a3, *(void *)(a3 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface));
  sub_246C26EFC(a3, v4);
}

void sub_246C27398()
{
  id v1 = objc_allocWithZone(MEMORY[0x263F086A0]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  objc_super v2 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_246BE62A8();
  id v3 = (void *)sub_246C2CBA8();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v1, sel_initWithString_attributes_, v2, v3);

  objc_msgSend(*(id *)(v0 + OBJC_IVAR___NTKParmesanSingleTimeLabel_timeLabel), sel_setAttributedText_, v4);
}

char *sub_246C274A4(double a1, double a2, double a3, double a4)
{
  id v9 = &v4[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion17TimeContainerView_deviceSize];
  *(void *)id v9 = 0;
  *((void *)v9 + 1) = 0;
  uint64_t v10 = qword_2691D62B8;
  id v11 = v4;
  if (v10 != -1) {
    swift_once();
  }
  double v12 = (void *)qword_2691E0068;
  uint64_t v13 = (objc_class *)type metadata accessor for ParmesanTimeView();
  objc_allocWithZone(v13);
  uint64_t v14 = self;
  id v15 = v12;
  id result = (char *)objc_msgSend(v14, sel_currentDevice);
  if (result)
  {
    id v17 = result;
    double v18 = (objc_class *)type metadata accessor for ParmesanTimeAppearance();
    double v19 = (char *)objc_allocWithZone(v18);
    *(void *)&v19[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout] = v15;
    *(void *)&v19[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_device] = v17;
    *(void *)&v19[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_typeface] = 0;
    *(void *)&v19[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_numerals] = 0;
    v28.receiver = v19;
    v28.super_class = v18;
    id v20 = v15;
    id v21 = objc_msgSendSuper2(&v28, sel_init);
    id v22 = objc_allocWithZone(v13);
    double v23 = sub_246BC52C4(v21, 0.0, 0.0, 0.0, 0.0);

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    *(void *)&v11[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion17TimeContainerView_timeView] = v23;

    v27.receiver = v11;
    v27.super_class = (Class)type metadata accessor for TimeContainerView();
    double v24 = (char *)objc_msgSendSuper2(&v27, sel_initWithFrame_, a1, a2, a3, a4);
    id v25 = *(void **)&v24[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion17TimeContainerView_timeView];
    uint64_t v26 = v24;
    objc_msgSend(v25, sel_setAnchorPoint_, 0.0, 0.0);
    objc_msgSend(v26, sel_setClipsToBounds_, 1);

    return v26;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_246C277A4()
{
  uint64_t v1 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion17TimeContainerView_timeView;
  objc_super v2 = *(void **)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion17TimeContainerView_timeView];
  v8.a = 1.0;
  v8.b = 0.0;
  v8.c = 0.0;
  v8.d = 1.0;
  v8.tCGFloat x = 0.0;
  v8.tdouble y = 0.0;
  objc_msgSend(v2, sel_setTransform_, &v8);
  id v3 = (double *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion17TimeContainerView_deviceSize];
  if (*(double *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion17TimeContainerView_deviceSize] == 0.0
    && *(double *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion17TimeContainerView_deviceSize + 8] == 0.0)
  {
    v7.receiver = v0;
    v7.super_class = (Class)type metadata accessor for TimeContainerView();
    return objc_msgSendSuper2(&v7, sel_layoutSubviews);
  }
  else
  {
    objc_msgSend(*(id *)&v0[v1], sel_setFrame_, 0.0, 0.0);
    objc_msgSend(v0, sel_bounds);
    double v5 = *(void **)&v0[v1];
    CGAffineTransformMakeScale(&v8, v6 / v3[1], v6 / v3[1]);
    return objc_msgSend(v5, sel_setTransform_, &v8);
  }
}

id sub_246C278E0(uint64_t a1)
{
  return sub_246C293F0(a1, type metadata accessor for TimeContainerView);
}

uint64_t type metadata accessor for TimeContainerView()
{
  return self;
}

char *sub_246C2792C(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_titleLabel;
  id v10 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v11 = v4;
  *(void *)&v4[v9] = objc_msgSend(v10, sel_init);
  uint64_t v12 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_subtitleLabel;
  *(void *)&v11[v12] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  v11[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_showBackground] = 0;
  uint64_t v13 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_activeBackgroundColor;
  *(void *)&v11[v13] = objc_msgSend(self, sel_tintColor);

  v48.receiver = v11;
  v48.super_class = (Class)type metadata accessor for CapsuleLabelView();
  uint64_t v14 = (char *)objc_msgSendSuper2(&v48, sel_initWithFrame_, a1, a2, a3, a4);
  uint64_t v15 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_titleLabel;
  unint64_t v16 = *(void **)&v14[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_titleLabel];
  id v17 = v14;
  objc_msgSend(v16, sel_setTextAlignment_, 1);
  uint64_t v18 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_subtitleLabel;
  objc_msgSend(*(id *)&v17[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_subtitleLabel], sel_setTextAlignment_, 1);
  objc_msgSend(v17, sel_addSubview_, *(void *)&v14[v15]);
  objc_msgSend(v17, sel_addSubview_, *(void *)&v17[v18]);
  objc_msgSend(*(id *)&v14[v15], sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(*(id *)&v17[v18], sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v47 = self;
  sub_246B80250((uint64_t *)&unk_2691D6A80);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_246C387C0;
  id v20 = objc_msgSend(*(id *)&v14[v15], sel_topAnchor);
  id v21 = objc_msgSend(v17, (SEL)&selRef_setDataSource_ + 3);
  id v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_constant_, v21, 6.0);

  *(void *)(v19 + 32) = v22;
  id v23 = objc_msgSend(*(id *)&v14[v15], sel_centerXAnchor);
  id v24 = objc_msgSend(v17, sel_centerXAnchor);
  id v25 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v24);

  *(void *)(v19 + 40) = v25;
  id v26 = objc_msgSend(*(id *)&v17[v18], sel_bottomAnchor);
  id v27 = objc_msgSend(v17, sel_bottomAnchor);
  id v28 = objc_msgSend(v26, sel_constraintEqualToAnchor_constant_, v27, -6.0);

  *(void *)(v19 + 48) = v28;
  id v29 = objc_msgSend(*(id *)&v17[v18], sel_centerXAnchor);
  id v30 = objc_msgSend(v17, sel_centerXAnchor);
  id v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_, v30);

  *(void *)(v19 + 56) = v31;
  id v32 = objc_msgSend(*(id *)&v17[v18], sel_topAnchor);
  id v33 = objc_msgSend(*(id *)&v14[v15], sel_bottomAnchor);
  id v34 = objc_msgSend(v32, sel_constraintEqualToAnchor_constant_, v33, 1.0);

  *(void *)(v19 + 64) = v34;
  id v35 = objc_msgSend(v17, sel_widthAnchor);
  id v36 = objc_msgSend(v35, sel_constraintGreaterThanOrEqualToConstant_, 65.0);

  *(void *)(v19 + 72) = v36;
  id v37 = objc_msgSend(v17, sel_heightAnchor);
  id v38 = objc_msgSend(v37, sel_constraintGreaterThanOrEqualToConstant_, 32.0);

  *(void *)(v19 + 80) = v38;
  id v39 = objc_msgSend(v17, sel_widthAnchor);
  id v40 = objc_msgSend(*(id *)&v17[v18], sel_widthAnchor);
  id v41 = objc_msgSend(v39, sel_constraintGreaterThanOrEqualToAnchor_constant_, v40, 8.0);

  *(void *)(v19 + 88) = v41;
  id v42 = objc_msgSend(v17, sel_widthAnchor);
  id v43 = objc_msgSend(*(id *)&v14[v15], sel_widthAnchor);
  id v44 = objc_msgSend(v42, sel_constraintGreaterThanOrEqualToAnchor_constant_, v43, 8.0);

  *(void *)(v19 + 96) = v44;
  sub_246C2CD58();
  sub_246B8F1E0(0, (unint64_t *)&qword_2691D8B30);
  double v45 = (void *)sub_246C2CD28();
  swift_bridgeObjectRelease();
  objc_msgSend(v47, sel_activateConstraints_, v45);

  return v17;
}

void sub_246C27EE4()
{
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for CapsuleLabelView();
  objc_msgSendSuper2(&v8, sel_layoutSubviews);
  uint64_t v1 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_showBackground;
  double v2 = 0.0;
  if (v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_showBackground] == 1
    && (objc_msgSend(v0, sel_bounds), double v2 = CGRectGetHeight(v9) / 2.1, v0[v1] == 1))
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_activeBackgroundColor];
  }
  else
  {
    id v3 = objc_msgSend(self, sel_clearColor);
  }
  id v4 = v3;
  objc_msgSend(v0, sel_setBackgroundColor_, v3);

  id v5 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v5, sel_setCornerRadius_, v2);

  id v6 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v6, sel_setCornerCurve_, *MEMORY[0x263F15A20]);

  id v7 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v7, sel_setMasksToBounds_, 0);
}

id sub_246C280A0()
{
  return sub_246C293F0(0, type metadata accessor for CapsuleLabelView);
}

uint64_t type metadata accessor for CapsuleLabelView()
{
  return self;
}

void sub_246C2813C()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_systemFontOfSize_weight_, 11.0, *MEMORY[0x263F81800]);
  id v2 = objc_msgSend(v1, sel_fontDescriptor);

  id v3 = objc_msgSend(v2, sel_fontDescriptorWithSymbolicTraits_, 0x8000);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v3, sel_fontDescriptorWithSymbolicTraits_, 2);

    if (v5)
    {
      id v6 = objc_msgSend(v0, sel_fontWithDescriptor_size_, v5, 11.0);

      qword_2691E0238 = (uint64_t)v6;
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void (*sub_246C28234(void *a1))(_OWORD **a1, char a2)
{
  id v3 = malloc(0x170uLL);
  *a1 = v3;
  v3[45] = v1;
  id v4 = *(void **)(v1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_appliedConfiguration);
  long long v17 = *(_OWORD *)(v1
                  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_appliedConfiguration
                  + 24);
  long long v18 = *(_OWORD *)(v1
                  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_appliedConfiguration
                  + 8);
  uint64_t v5 = *(void *)(v1
                 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_appliedConfiguration
                 + 40);
  id v6 = *(void **)(v1
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_appliedConfiguration
                + 48);
  id v7 = *(void **)(v1
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_appliedConfiguration
                + 56);
  objc_super v8 = *(void **)(v1
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_appliedConfiguration
                + 64);
  CGRect v9 = *(void **)(v1
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_appliedConfiguration
                + 72);
  v3[38] = &type metadata for TimeLayoutOptionCellConfiguration;
  v3[39] = sub_246C0C370();
  uint64_t v10 = swift_allocObject();
  v3[35] = v10;
  *(void *)(v10 + 16) = v4;
  *(_OWORD *)(v10 + 24) = v18;
  *(_OWORD *)(v10 + 40) = v17;
  *(void *)(v10 + 56) = v5;
  *(void *)(v10 + 64) = v6;
  *(void *)(v10 + 72) = v7;
  *(void *)(v10 + 80) = v8;
  *(void *)(v10 + 88) = v9;
  id v11 = v9;
  id v12 = v4;
  id v13 = v6;
  id v14 = v7;
  id v15 = v8;
  return sub_246C28344;
}

void sub_246C28344(_OWORD **a1, char a2)
{
  id v3 = *a1;
  id v4 = *a1 + 10;
  uint64_t v5 = (uint64_t)(*a1 + 15);
  uint64_t v6 = (uint64_t)*a1 + 280;
  sub_246BBE940(v6, v5);
  if (a2)
  {
    sub_246BBE940(v5, (uint64_t)(v3 + 20));
    sub_246B80250(&qword_2691D8CE0);
    if (swift_dynamicCast())
    {
      long long v7 = v4[3];
      v3[2] = v4[2];
      v3[3] = v7;
      v3[4] = v4[4];
      long long v8 = v4[1];
      *id v3 = *v4;
      v3[1] = v8;
      sub_246C28DA4((uint64_t)v3);
      sub_246C29738((uint64_t)v3);
    }
    sub_246B8EB94(v5);
  }
  else
  {
    sub_246B80250(&qword_2691D8CE0);
    if (swift_dynamicCast())
    {
      long long v9 = v4[3];
      v3[7] = v4[2];
      v3[8] = v9;
      v3[9] = v4[4];
      long long v10 = v4[1];
      v3[5] = *v4;
      v3[6] = v10;
      sub_246C28DA4((uint64_t)(v3 + 5));
      sub_246C29738((uint64_t)(v3 + 5));
    }
  }
  sub_246B8EB94(v6);

  free(v3);
}

id sub_246C28480()
{
  return sub_246C284A8(&OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView____lazy_storage___previewHeightAnchor, (SEL *)&selRef_heightAnchor);
}

id sub_246C28494()
{
  return sub_246C284A8(&OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView____lazy_storage___previewWidthAnchor, (SEL *)&selRef_widthAnchor);
}

id sub_246C284A8(uint64_t *a1, SEL *a2)
{
  uint64_t v3 = *a1;
  id v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    id v6 = [*(id *)(v2 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_previewContainer) *a2];
    id v7 = objc_msgSend(v6, sel_constraintEqualToConstant_, 0.0);

    long long v8 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v7;
    id v5 = v7;

    id v4 = 0;
  }
  id v9 = v4;
  return v5;
}

id sub_246C28548()
{
  uint64_t v1 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView____lazy_storage___alignmentView;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView____lazy_storage___alignmentView);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView____lazy_storage___alignmentView);
  }
  else
  {
    uint64_t v4 = v0;
    sub_246B80250((uint64_t *)&unk_2691D6A80);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_246C33940;
    id v6 = *(void **)(v0 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_previewContainer);
    id v7 = *(void **)(v0 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_previewLabel);
    *(void *)(v5 + 32) = v6;
    *(void *)(v5 + 40) = v7;
    sub_246C2CD58();
    id v8 = objc_allocWithZone(MEMORY[0x263F82BF8]);
    sub_246B8F1E0(0, (unint64_t *)&qword_2691D7D10);
    id v9 = v6;
    id v10 = v7;
    id v11 = (void *)sub_246C2CD28();
    swift_bridgeObjectRelease();
    id v12 = objc_msgSend(v8, sel_initWithArrangedSubviews_, v11);

    objc_msgSend(v12, sel_setAxis_, 1);
    objc_msgSend(v12, sel_setSpacing_, 12.0);
    id v13 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v12;
    id v3 = v12;

    uint64_t v2 = 0;
  }
  id v14 = v2;
  return v3;
}

id sub_246C286A0(_OWORD *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_previewContainer;
  id v4 = objc_allocWithZone(MEMORY[0x263F82E00]);
  uint64_t v5 = v1;
  *(void *)&v1[v3] = objc_msgSend(v4, sel_init);
  uint64_t v6 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_timeContainer;
  type metadata accessor for TimeContainerView();
  *(void *)&v5[v6] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v7 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_previewLabel;
  *(void *)&v5[v7] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CapsuleLabelView()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(void *)&v5[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView____lazy_storage___previewHeightAnchor] = 0;
  *(void *)&v5[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView____lazy_storage___previewWidthAnchor] = 0;
  *(void *)&v5[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView____lazy_storage___alignmentView] = 0;
  id v8 = &v5[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_appliedConfiguration];
  *(_OWORD *)id v8 = *a1;
  long long v9 = a1[4];
  long long v11 = a1[1];
  long long v10 = a1[2];
  *((_OWORD *)v8 + 3) = a1[3];
  *((_OWORD *)v8 + 4) = v9;
  *((_OWORD *)v8 + 1) = v11;
  *((_OWORD *)v8 + 2) = v10;
  sub_246C0DE88((uint64_t)a1);

  v15.receiver = v5;
  v15.super_class = (Class)type metadata accessor for TimeLayoutOptionContentView();
  id v12 = objc_msgSendSuper2(&v15, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_246C28840();
  sub_246C28DA4((uint64_t)a1);
  id v13 = v12;
  objc_msgSend(v13, sel_setIsAccessibilityElement_, 1);
  sub_246C29738((uint64_t)a1);

  return v13;
}

void sub_246C28840()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_246B80250(&qword_2691D7030);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_timeContainer;
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_previewContainer], sel_addSubview_, *(void *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_timeContainer]);
  objc_msgSend(*(id *)&v0[v5], sel_addSubview_, *(void *)(*(void *)&v0[v5] + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion17TimeContainerView_timeView));
  id v6 = objc_retain(*(id *)(*(void *)&v0[v5]
                         + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion17TimeContainerView_timeView));
  id v7 = (id)NTKIdealizedDate();
  if (v7)
  {
    id v8 = v7;
    sub_246C2BC08();

    uint64_t v9 = sub_246C2BC18();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_246C2BC18();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v4, 1, 1, v10);
  }
  sub_246BC6BD4((uint64_t)v4);

  sub_246BB04B4((uint64_t)v4);
  uint64_t v11 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_previewLabel;
  uint64_t v12 = qword_2691D6350;
  id v13 = objc_retain(*(id *)(*(void *)&v1[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_previewLabel]
                          + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_titleLabel));
  if (v12 != -1) {
    swift_once();
  }
  objc_msgSend(v13, sel_setFont_, qword_2691E0238);

  objc_msgSend(*(id *)(*(void *)&v1[v11]+ OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_subtitleLabel), sel_setFont_, qword_2691E0238);
  objc_msgSend(*(id *)(*(void *)&v1[v11]+ OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_titleLabel), sel_setTextAlignment_, 1);
  objc_msgSend(*(id *)(*(void *)&v1[v11]+ OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_subtitleLabel), sel_setTextAlignment_, 1);
  id v14 = sub_246C28548();
  objc_msgSend(v1, sel_addSubview_, v14);

  id v15 = sub_246C28548();
  objc_msgSend(v15, sel_setAlignment_, 3);

  id v16 = sub_246C28548();
  objc_msgSend(v16, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  long long v17 = self;
  sub_246B80250((uint64_t *)&unk_2691D6A80);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_246C37DF0;
  id v19 = sub_246C28548();
  id v20 = objc_msgSend(v19, sel_topAnchor);

  id v21 = objc_msgSend(v1, sel_topAnchor);
  id v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v21);

  *(void *)(v18 + 32) = v22;
  id v23 = sub_246C28548();
  id v24 = objc_msgSend(v23, sel_bottomAnchor);

  id v25 = objc_msgSend(v1, sel_bottomAnchor);
  id v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

  *(void *)(v18 + 40) = v26;
  id v27 = sub_246C28548();
  id v28 = objc_msgSend(v27, sel_leadingAnchor);

  id v29 = objc_msgSend(v1, sel_leadingAnchor);
  id v30 = objc_msgSend(v28, sel_constraintGreaterThanOrEqualToAnchor_, v29);

  *(void *)(v18 + 48) = v30;
  id v31 = sub_246C28548();
  id v32 = objc_msgSend(v31, sel_trailingAnchor);

  id v33 = objc_msgSend(v1, sel_trailingAnchor);
  id v34 = objc_msgSend(v32, sel_constraintGreaterThanOrEqualToAnchor_, v33);

  *(void *)(v18 + 56) = v34;
  v38[1] = v18;
  sub_246C2CD58();
  sub_246B8F1E0(0, (unint64_t *)&qword_2691D8B30);
  id v35 = (void *)sub_246C2CD28();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_activateConstraints_, v35);

  objc_msgSend(*(id *)&v1[v5], sel_constrainToSuperviewWithEdges_insets_useLayoutMargins_, 15, 0, *MEMORY[0x263F82250], *(double *)(MEMORY[0x263F82250] + 8), *(double *)(MEMORY[0x263F82250] + 16), *(double *)(MEMORY[0x263F82250] + 24));
  id v36 = objc_msgSend(*(id *)&v1[v5], sel_layer);
  objc_msgSend(v36, sel_setMasksToBounds_, 1);

  id v37 = objc_msgSend(*(id *)&v1[v5], sel_layer);
  objc_msgSend(v37, sel_setCornerCurve_, *MEMORY[0x263F15A20]);
}

id sub_246C28DA4(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = &v1[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_appliedConfiguration];
  uint64_t v5 = *(void **)&v1[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_appliedConfiguration];
  id v6 = (void *)*((void *)v4 + 6);
  id v7 = (void *)*((void *)v4 + 7);
  id v8 = (void *)*((void *)v4 + 8);
  uint64_t v9 = (void *)*((void *)v4 + 9);
  long long v10 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v4 + 2) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v4 + 3) = v10;
  *((_OWORD *)v4 + 4) = *(_OWORD *)(a1 + 64);
  long long v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)id v4 = *(_OWORD *)a1;
  *((_OWORD *)v4 + 1) = v11;
  sub_246C0DE88(a1);

  uint64_t v12 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_previewLabel;
  id v13 = *(char **)a1;
  uint64_t v60 = OBJC_IVAR___NTKParmesanTimeLayout_scale;
  uint64_t v14 = *(void *)(*(void *)a1 + OBJC_IVAR___NTKParmesanTimeLayout_scale);
  id v15 = objc_retain(*(id *)(*(void *)&v2[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_previewLabel]
                          + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_titleLabel));
  sub_246BB1104(v14);
  sub_246C2CCB8();
  swift_bridgeObjectRelease();
  id v16 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setText_, v16);

  id v17 = objc_retain(*(id *)(*(void *)&v2[v12]
                          + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_subtitleLabel));
  CGRect v61 = v13;
  sub_246BB1DA0();
  sub_246C2CCB8();
  swift_bridgeObjectRelease();
  uint64_t v18 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_setText_, v18);

  objc_msgSend(*(id *)(*(void *)&v2[v12]+ OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_titleLabel), sel_setTextColor_, *(void *)(a1 + 48));
  uint64_t v19 = v12;
  objc_msgSend(*(id *)(*(void *)&v2[v12]+ OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_subtitleLabel), sel_setTextColor_, *(void *)(a1 + 56));
  id v20 = sub_246C28480();
  double v21 = *(double *)(a1 + 8);
  objc_msgSend(v20, sel_setConstant_, *(double *)(a1 + 16));

  id v22 = sub_246C28494();
  objc_msgSend(v22, sel_setConstant_, v21);

  id v23 = sub_246C28480();
  objc_msgSend(v23, sel_setActive_, 1);

  id v24 = sub_246C28494();
  objc_msgSend(v24, sel_setActive_, 1);

  uint64_t v25 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_timeContainer;
  id v26 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_timeContainer], sel_layer);
  sub_246C0DEDC(a1 + 72, (uint64_t)v62);
  sub_246C0DEDC((uint64_t)v62, (uint64_t)&v64);
  if (v64) {
    id v27 = objc_msgSend(v64, sel_CGColor);
  }
  else {
    id v27 = 0;
  }
  objc_msgSend(v26, sel_setBorderColor_, v27);

  id v28 = objc_msgSend(*(id *)&v2[v25], sel_layer);
  sub_246C0DEDC((uint64_t)v62, (uint64_t)&v63);
  double v29 = 3.0;
  if (!v63) {
    double v29 = 0.0;
  }
  objc_msgSend(v28, sel_setBorderWidth_, v29);

  id v30 = *(void **)&v2[v25];
  id v31 = self;
  id v32 = v30;
  id v33 = objc_msgSend(v31, sel_darkGrayColor);
  objc_msgSend(v32, sel_setBackgroundColor_, v33);

  id v34 = *(void **)(a1 + 64);
  if (v34)
  {
    uint64_t v35 = *(void *)&v2[v19];
    id v36 = *(void **)(v35
                   + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_activeBackgroundColor);
    *(void *)(v35
              + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_activeBackgroundColor) = v34;
    id v37 = v34;

    id v38 = *(unsigned char **)&v2[v19];
    char v39 = v38[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_showBackground];
    v38[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_showBackground] = 1;
    if ((v39 & 1) == 0)
    {
      id v40 = v38;
      id v41 = objc_msgSend(v31, sel_clearColor);
      objc_msgSend(v40, sel_setBackgroundColor_, v41);

      objc_msgSend(v40, sel_setNeedsLayout);
      id v37 = v40;
    }
    uint64_t v43 = v60;
    id v42 = v61;
    id v44 = &selRef__colorStyleKeylineViewWithEditOption_slot_;
  }
  else
  {
    double v45 = (char *)*(id *)&v2[v19];
    id v46 = objc_msgSend(v31, sel_clearColor);
    id v47 = *(void **)&v45[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_activeBackgroundColor];
    *(void *)&v45[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_activeBackgroundColor] = v46;

    objc_super v48 = *(unsigned char **)&v2[v19];
    int v49 = v48[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_showBackground];
    v48[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_showBackground] = 0;
    uint64_t v43 = v60;
    id v42 = v61;
    id v44 = &selRef__colorStyleKeylineViewWithEditOption_slot_;
    if (v49 != 1) {
      goto LABEL_13;
    }
    uint64_t v50 = *(void *)&v48[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_activeBackgroundColor];
    id v37 = v48;
    objc_msgSend(v37, sel_setBackgroundColor_, v50);
    objc_msgSend(v37, sel_setNeedsLayout);
  }

LABEL_13:
  *(_OWORD *)(*(void *)&v2[v25] + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion17TimeContainerView_deviceSize) = *(_OWORD *)(a1 + 24);
  id v51 = [*(id *)&v2[v25] v44[421]];
  objc_msgSend(v51, sel_setCornerRadius_, *((double *)v4 + 5));

  CGRect v52 = *(char **)(*(void *)&v2[v25] + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion17TimeContainerView_timeView);
  uint64_t v53 = *(void *)&v52[OBJC_IVAR___NTKParmesanTimeView_appearance];
  CGRect v54 = *(void **)(v53 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout);
  *(void *)(v53 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion22ParmesanTimeAppearance_layout) = v42;
  CGRect v55 = v52;
  v42;

  sub_246BC5900();
  objc_msgSend(*(id *)(*(void *)&v2[v25] + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion17TimeContainerView_timeView), sel_setNeedsLayout);
  sub_246BB1104(*(void *)&v42[v43]);
  sub_246C2CCD8();
  sub_246BB1DA0();
  sub_246C2CCD8();
  swift_bridgeObjectRelease();
  CGRect v56 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setAccessibilityLabel_, v56);

  uint64_t v57 = *MEMORY[0x263F83260];
  if (v34)
  {
    uint64_t v58 = *MEMORY[0x263F832A8];
    if (v57)
    {
      if ((v58 & ~v57) == 0) {
        return objc_msgSend(v2, sel_setAccessibilityTraits_, v57);
      }
    }
    else if (!v58)
    {
      uint64_t v57 = 0;
      return objc_msgSend(v2, sel_setAccessibilityTraits_, v57);
    }
    v57 |= v58;
  }
  return objc_msgSend(v2, sel_setAccessibilityTraits_, v57);
}

id sub_246C293D8(uint64_t a1)
{
  return sub_246C293F0(a1, type metadata accessor for TimeLayoutOptionContentView);
}

id sub_246C293F0(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for TimeLayoutOptionContentView()
{
  return self;
}

id sub_246C2951C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_appliedConfiguration;
  objc_super v4 = *(void **)(v1 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_appliedConfiguration);
  long long v15 = *(_OWORD *)(v3 + 24);
  long long v16 = *(_OWORD *)(v3 + 8);
  uint64_t v5 = *(void *)(v3 + 40);
  id v6 = *(void **)(v3 + 48);
  id v7 = *(void **)(v3 + 56);
  id v8 = *(void **)(v3 + 72);
  id v17 = *(id *)(v3 + 64);
  a1[3] = (uint64_t)&type metadata for TimeLayoutOptionCellConfiguration;
  a1[4] = sub_246C0C370();
  uint64_t v9 = swift_allocObject();
  *a1 = v9;
  *(void *)(v9 + 16) = v4;
  *(_OWORD *)(v9 + 24) = v16;
  *(_OWORD *)(v9 + 40) = v15;
  *(void *)(v9 + 56) = v5;
  *(void *)(v9 + 64) = v6;
  *(void *)(v9 + 72) = v7;
  *(void *)(v9 + 80) = v17;
  *(void *)(v9 + 88) = v8;
  id v10 = v8;
  id v11 = v4;
  id v12 = v6;
  id v13 = v7;

  return v17;
}

uint64_t sub_246C295FC(uint64_t a1)
{
  sub_246BBE940(a1, (uint64_t)v8);
  sub_246B80250(&qword_2691D8CE0);
  if (swift_dynamicCast())
  {
    v9[1] = v4;
    v9[2] = v5;
    v9[3] = v6;
    v9[4] = v7;
    v9[0] = v3;
    sub_246C28DA4((uint64_t)v9);
    sub_246C29738((uint64_t)v9);
  }
  return sub_246B8EB94(a1);
}

void (*sub_246C29694(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_246C28234(v2);
  return sub_246C296EC;
}

void sub_246C296EC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_246C29738(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  long long v3 = *(void **)(a1 + 56);
  long long v4 = *(void **)(a1 + 64);
  long long v5 = *(void **)(a1 + 72);

  return a1;
}

uint64_t sub_246C2978C()
{
  return MEMORY[0x270FA0238](v0, 96, 7);
}

void sub_246C297E4()
{
  uint64_t v1 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_titleLabel;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_subtitleLabel;
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_showBackground] = 0;
  uint64_t v3 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_activeBackgroundColor;
  *(void *)&v0[v3] = objc_msgSend(self, sel_tintColor);

  sub_246C2D3A8();
  __break(1u);
}

void sub_246C298C4()
{
  uint64_t v1 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_previewContainer;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  uint64_t v2 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_timeContainer;
  type metadata accessor for TimeContainerView();
  *(void *)&v0[v2] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  uint64_t v3 = OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView_previewLabel;
  *(void *)&v0[v3] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CapsuleLabelView()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(void *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView____lazy_storage___previewHeightAnchor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView____lazy_storage___previewWidthAnchor] = 0;
  *(void *)&v0[OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion27TimeLayoutOptionContentView____lazy_storage___alignmentView] = 0;

  sub_246C2D3A8();
  __break(1u);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_246C299EC(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 176);
  uint64_t v5 = *(void *)(a2 + 192);
  int v6 = 134218496;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  uint64_t v9 = v4;
  __int16 v10 = 2048;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_246B51000, log, OS_LOG_TYPE_ERROR, "Editor type was switched, but we have external assets, that shouldn't be possible… photoEditor = %p, albumEditor = %p, imageEditor = %p", (uint8_t *)&v6, 0x20u);
}

void sub_246C29A98(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl(&dword_246B51000, log, OS_LOG_TYPE_DEBUG, "isInitialSetSelectOptions: %{BOOL}d, option: %@", (uint8_t *)v3, 0x12u);
}

void sub_246C29B24(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_246B51000, log, OS_LOG_TYPE_ERROR, "Trying to create preview navigation, but no editor is instantiated", v1, 2u);
}

void sub_246C29B68(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_246B51000, a2, OS_LOG_TYPE_ERROR, "Parmesan couldn't get preview %@", (uint8_t *)&v2, 0xCu);
}

void sub_246C29BE0(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_246B51000, a2, OS_LOG_TYPE_ERROR, "Parmesan couldn't get reset preview %@", (uint8_t *)&v2, 0xCu);
}

void sub_246C29C58(uint64_t a1, const char *a2, NSObject *a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_localIdentifier(*(void **)(a1 + 32), a2, (uint64_t)a3, a4);
  int v7 = 138412546;
  __int16 v8 = v6;
  __int16 v9 = 2112;
  __int16 v10 = a2;
  _os_log_error_impl(&dword_246B51000, a3, OS_LOG_TYPE_ERROR, "Failed to create new preview for changed asset with id = %@, error = %@", (uint8_t *)&v7, 0x16u);
}

void sub_246C29D0C(void *a1, const char *a2, NSObject *a3, uint64_t a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_count(a1, a2, (uint64_t)a3, a4);
  uint64_t v10 = objc_msgSend_count(*(void **)a2, v7, v8, v9);
  int v11 = 134218240;
  uint64_t v12 = v6;
  __int16 v13 = 2048;
  uint64_t v14 = v10;
  _os_log_error_impl(&dword_246B51000, a3, OS_LOG_TYPE_ERROR, "Image reorder contains different number of items which is invalid, new = %ld, old = %ld", (uint8_t *)&v11, 0x16u);
}

void sub_246C29DBC(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_246B51000, a2, OS_LOG_TYPE_ERROR, "New image order contains item that doesn't exist: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_246C29E34(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[NTKParmesanImageEditor savePreview:forPhotoAtIndex:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_246B51000, a2, OS_LOG_TYPE_DEBUG, "%s: saving preview %@", (uint8_t *)&v2, 0x16u);
}

void sub_246C29EC0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_246B51000, log, OS_LOG_TYPE_ERROR, "Encoding image editor items failed", v1, 2u);
}

void sub_246C29F04(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_246B51000, log, OS_LOG_TYPE_ERROR, "Writing image list failed", v1, 2u);
}

void sub_246C29F48(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_246B51000, a2, OS_LOG_TYPE_ERROR, "Failed to get heic data for image with identifier: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_246C29FC0(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_localizedDescription(a1, a2, a3, a4);
  int v6 = 138543362;
  int v7 = v5;
  _os_log_error_impl(&dword_246B51000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "Failed to write image data to disk: %{public}@", (uint8_t *)&v6, 0xCu);
}

void sub_246C2A058(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_246B51000, log, OS_LOG_TYPE_ERROR, "Invalid assets provided, Parmesan cannot hanlde them", v1, 2u);
}

void sub_246C2A09C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_246B51000, a2, OS_LOG_TYPE_ERROR, "Invalid asset types given to face for editor initialization, type = %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_246C2A114(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_246B51000, log, OS_LOG_TYPE_ERROR, "face view is nil for NTKParmesanFaceViewComplicationFactory", v1, 2u);
}

void sub_246C2A158(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_246B51000, log, OS_LOG_TYPE_ERROR, "face view is nil for NTKParmesanComplicationFactory", v1, 2u);
}

void sub_246C2A19C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_pixelWidth(*(void **)(a1 + 32), a2, a3, a4);
  objc_msgSend_pixelHeight(*(void **)(a1 + 32), v5, v6, v7);
  sub_246B6AE58(&dword_246B51000, v8, v9, "%s: w == %ld, h == %ld, o == %ld", v10, v11, v12, v13, 2u);
}

void sub_246C2A260(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = objc_msgSend_localIdentifier(*(void **)(a1 + 32), a2, a3, a4);
  objc_msgSend_length(a2, v7, v8, v9);
  uint64_t v18 = objc_msgSend_originalUniformTypeIdentifierForAsset_(MEMORY[0x263F14D18], v10, *(void *)(a1 + 32), v11);
  sub_246B6AE58(&dword_246B51000, v12, v13, "%s: f == %@, size == %ld bytes, type == %@", v14, v15, v16, v17, 2u);
}

void sub_246C2A34C()
{
  LODWORD(v2) = 136315650;
  *(void *)((char *)&v2 + 4) = "-[PHAsset(NTKCParmesanPhotosEditor) ntk_getFullSizePHAssetData]_block_invoke";
  sub_246B6AE44();
  sub_246B6ADEC(&dword_246B51000, v0, v1, "%s: Failed to get image data for asset %@, error %@", (void)v2, DWORD2(v2));
}

void sub_246C2A3CC(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&v3[4] = "-[_NTKEditedParmesanAsset addOriginalAssetAndMaskData]";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a1;
  *(_WORD *)&v3[22] = 2112;
  sub_246B6AE78(&dword_246B51000, a2, a3, "%s: original asset == %@, maskdata == %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *(void *)(a2 + 48));
}

void sub_246C2A45C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_phAsset(a1, a2, a3, a4);
  sub_246B6ADB8();
  sub_246B6ADCC(&dword_246B51000, v5, v6, "%s: Cannot get mask && original ParmesanAsset for %@", v7, v8, v9, v10, 2u);
}

void sub_246C2A4EC()
{
  int v2 = 136315650;
  sub_246B6AE0C();
  sub_246B6ADEC(&dword_246B51000, v0, v1, "%s: Cannot remove temporary directory %@, error %@", v2);
}

void sub_246C2A560(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_asset(a1, a2, a3, a4);
  sub_246B6ADB8();
  sub_246B6ADCC(&dword_246B51000, v5, v6, "%s: No layout data for asset %@", v7, v8, v9, v10, 2u);
}

void sub_246C2A5F0(void *a1, const char *a2, NSObject *a3, uint64_t a4)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_asset(a1, a2, (uint64_t)a3, a4);
  uint64_t v8 = "-[_NTKUserOverrideSession initWithEditedAsset:]";
  int v7 = 136315650;
  sub_246B6AE44();
  uint64_t v9 = v6;
  _os_log_debug_impl(&dword_246B51000, a3, OS_LOG_TYPE_DEBUG, "%s: initial override from %@: %@", (uint8_t *)&v7, 0x20u);
}

void sub_246C2A6C0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246C2A744(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[NTKCParmesanPhotosEditor replaceAssetAtIndex:withAsset:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_246B51000, a2, OS_LOG_TYPE_ERROR, "%s: invalid index for asset to replace: %ld", (uint8_t *)&v2, 0x16u);
}

void sub_246C2A7D0(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&v3[4] = "-[NTKCParmesanPhotosEditor previewOfLibraryPhotoAtIndex:completion:]_block_invoke_3";
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = *a1;
  *(_WORD *)&v3[22] = 2112;
  sub_246B6AE78(&dword_246B51000, a2, a3, "%s: preview model for index %ld == %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

void sub_246C2A860()
{
  sub_246B6ADB8();
  sub_246B6AE28(&dword_246B51000, v0, v1, "%s: saving preview %@", v2, v3, v4, v5, 2u);
}

void sub_246C2A8D4(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_count(a1, a2, a3, a4);
  objc_msgSend_count(a2, v5, v6, v7);
  sub_246B6ADCC(&dword_246B51000, v8, v9, "_fetchAssetsForNewPhotos: could only retrieve %ld assets for %ld local identifiers", v10, v11, v12, v13, 0);
}

void sub_246C2A974()
{
  sub_246B6ADB8();
  sub_246B6AE28(&dword_246B51000, v0, v1, "%s: dstDir = %@", v2, v3, v4, v5, 2u);
}

void sub_246C2A9E8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_246B51000, log, OS_LOG_TYPE_ERROR, "_copyOrTranscodeAssetWithIds: invalid asset %@; exception %@; skipping",
    (uint8_t *)&v3,
    0x16u);
}

void sub_246C2AA70()
{
  int v2 = 136315650;
  sub_246B6AE0C();
  sub_246B6ADEC(&dword_246B51000, v0, v1, "%s: Preferred time layout: %@ not found in layouts to be saved: %@", v2);
}

void sub_246C2AAE4(void *a1, const char *a2, NSObject *a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_phAsset(a1, a2, (uint64_t)a3, a4);
  uint64_t v10 = objc_msgSend_localIdentifier(v6, v7, v8, v9);
  int v11 = 136315650;
  uint64_t v12 = "-[NTKCParmesanPhotosEditor _copyOrTranscodeAssetWithIds:to:shouldPurgeOriginalData:progress:completion:]_block_invoke";
  __int16 v13 = 2048;
  uint64_t v14 = a2;
  __int16 v15 = 2112;
  uint64_t v16 = v10;
  _os_log_error_impl(&dword_246B51000, a3, OS_LOG_TYPE_ERROR, "%s: Cannot finalize layer for time size %ld for asset %@; skipping",
    (uint8_t *)&v11,
    0x20u);
}

void sub_246C2ABBC(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  __int16 v5 = objc_msgSend_phAsset(a1, a2, a3, a4);
  uint64_t v9 = objc_msgSend_localIdentifier(v5, v6, v7, v8);
  int v10 = 138412290;
  int v11 = v9;
  _os_log_error_impl(&dword_246B51000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "_copyOrTranscodeAssetWithIds: cannot compute the original layout for %@; skipping",
    (uint8_t *)&v10,
    0xCu);
}

void sub_246C2AC70(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_opt_class();
  sub_246B6C9CC();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  id v6 = v5;
  _os_log_error_impl(&dword_246B51000, a3, OS_LOG_TYPE_ERROR, "%@: cannot read image list from %@", v7, 0x16u);
}

void sub_246C2AD14(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_opt_class();
  sub_246B6C9CC();
  id v4 = v3;
  _os_log_error_impl(&dword_246B51000, a2, OS_LOG_TYPE_ERROR, "%@: No version specified in plist", v5, 0xCu);
}

void sub_246C2ADA8()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_246B6C9CC();
  _os_log_error_impl(&dword_246B51000, v0, OS_LOG_TYPE_ERROR, "%@: bad resource directory wrapper; inconsistent people description",
    v1,
    0xCu);
}

void sub_246C2AE1C()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_246B6C9CC();
  _os_log_error_impl(&dword_246B51000, v0, OS_LOG_TYPE_ERROR, "%@: bad resource directory wrapper; inconsistent shuffle/album combination",
    v1,
    0xCu);
}

void sub_246C2AE90(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_246B6EAC4(&dword_246B51000, a2, a3, "Cannot get list of gallery shuffles: error == %@", a5, a6, a7, a8, 2u);
}

void sub_246C2AF00()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  sub_246B6EAE0();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_246B51000, v1, OS_LOG_TYPE_ERROR, "Cannot create resource directory for shuffle %@: %@", v2, 0x16u);
}

void sub_246C2AF80(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246C2AFF0()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  sub_246B6EAE0();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_246B51000, v1, OS_LOG_TYPE_ERROR, "_queue_createResourceDirectoryForShuffle: cannot delete resource directory at path %@, error == %@", v2, 0x16u);
}

void sub_246C2B070(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246C2B0DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246C2B148(unsigned int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "CGImagePropertyOrientation orientationFromData(NSData *__strong _Nonnull)";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_246B51000, a2, OS_LOG_TYPE_DEBUG, "%s: orientation == %ld", (uint8_t *)&v2, 0x16u);
}

void sub_246C2B1D8()
{
  sub_246B6C9CC();
  sub_246B6EAC4(&dword_246B51000, v0, v1, "NTKCParmesanAlbumEditor::init: directory %@ has no valid shuffle or album", v2, v3, v4, v5, v6);
}

void sub_246C2B240(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_246B51000, log, OS_LOG_TYPE_ERROR, "setShouldFinalize: trying to set the state while finalizing or generating a preview", v1, 2u);
}

void sub_246C2B284()
{
  sub_246B6C9CC();
  sub_246B6EAC4(&dword_246B51000, v0, v1, "setShuffleSelection: bad shuffle selection: %@", v2, v3, v4, v5, v6);
}

void sub_246C2B2EC()
{
  sub_246B6C9CC();
  sub_246B6EAC4(&dword_246B51000, v0, v1, "setShuffleSelection: bad people selection: %@", v2, v3, v4, v5, v6);
}

void sub_246C2B354(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136315394;
  uint64_t v4 = "-[NTKCParmesanAlbumEditor generateGalleryPreviewResourceDirectoryWithCompletion:]_block_invoke_4";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_246B51000, a2, OS_LOG_TYPE_ERROR, "%s failed to generate gallery resource preview directory: %@", (uint8_t *)&v3, 0x16u);
}

void sub_246C2B3E4(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[NTKCParmesanAlbumEditor finalizeWithProgress:completion:]";
  _os_log_debug_impl(&dword_246B51000, log, OS_LOG_TYPE_DEBUG, "%s: Editor is finalizing", (uint8_t *)&v1, 0xCu);
}

void sub_246C2B468(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_246C2B4E0(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_246B51000, log, OS_LOG_TYPE_ERROR, "NTKCParmesanAlbumEditor: Cannot fetch single asset, no album or key asset given", v1, 2u);
}

void sub_246C2B524()
{
  sub_246B6C9CC();
  sub_246B6EAC4(&dword_246B51000, v0, v1, "_writeImageList: cannot write the image list to %@", v2, v3, v4, v5, v6);
}

void sub_246C2B58C(void *a1, char *a2, NSObject *a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint8_t v6 = objc_msgSend_resourceDirectoryURL(a1, a2, (uint64_t)a3, a4);
  uint64_t v10 = objc_msgSend_lastPathComponent(v6, v7, v8, v9);
  __int16 v13 = objc_msgSend_objectForKeyedSubscript_(a2, v11, @"localIdentifier", v12);
  int v14 = 138412546;
  __int16 v15 = v10;
  __int16 v16 = 2112;
  uint64_t v17 = v13;
  _os_log_error_impl(&dword_246B51000, a3, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid image list item: %@", (uint8_t *)&v14, 0x16u);
}

void sub_246C2B66C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_resourceDirectoryURL(a1, a2, a3, a4);
  uint64_t v8 = objc_msgSend_lastPathComponent(v4, v5, v6, v7);
  sub_246B789BC(&dword_246B51000, v9, v10, "[SANITIZER:%@]: invalid mask url", v11, v12, v13, v14, 2u);
}

void sub_246C2B70C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_resourceDirectoryURL(a1, a2, a3, a4);
  uint64_t v8 = objc_msgSend_lastPathComponent(v4, v5, v6, v7);
  sub_246B789BC(&dword_246B51000, v9, v10, "[SANITIZER:%@]: invalid baseImageURL", v11, v12, v13, v14, 2u);
}

void sub_246C2B7AC(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = NSNumber;
  uint64_t v7 = objc_msgSend__value(a1, a2, a3, a4);
  uint64_t v10 = objc_msgSend_numberWithUnsignedInteger_(v6, v8, v7, v9);
  int v11 = 138412546;
  uint64_t v12 = a1;
  __int16 v13 = 2112;
  uint64_t v14 = v10;
  _os_log_error_impl(&dword_246B51000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%@: invalid value (%@)", (uint8_t *)&v11, 0x16u);
}

void sub_246C2B870(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_246B51000, a2, OS_LOG_TYPE_ERROR, "Parmesan_getPreviewWithCompletion: no editor; index == %ld",
    (uint8_t *)&v3,
    0xCu);
}

void sub_246C2B8EC(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  int v3 = "-[NTKParmesanFace _createDynamicContentDirectoryFromReader:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_246B51000, a2, OS_LOG_TYPE_ERROR, "%s: cannot write the image list to %@", (uint8_t *)&v2, 0x16u);
}

uint64_t sub_246C2B978()
{
  return MEMORY[0x270EEDAC8]();
}

uint64_t sub_246C2B988()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_246C2B998()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_246C2B9A8()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_246C2B9B8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_246C2B9C8()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_246C2B9D8()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_246C2B9E8()
{
  return MEMORY[0x270EEE3E0]();
}

uint64_t sub_246C2B9F8()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_246C2BA08()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_246C2BA18()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_246C2BA28()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_246C2BA38()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_246C2BA48()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_246C2BA58()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_246C2BA68()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_246C2BA78()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_246C2BA88()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_246C2BA98()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_246C2BAA8()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_246C2BAB8()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_246C2BAC8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_246C2BAD8()
{
  return MEMORY[0x270FA1648]();
}

uint64_t sub_246C2BAE8()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_246C2BAF8()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_246C2BB08()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_246C2BB18()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_246C2BB28()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_246C2BB38()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_246C2BB48()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_246C2BB58()
{
  return MEMORY[0x270EEFEB8]();
}

uint64_t sub_246C2BB68()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_246C2BB78()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_246C2BB88()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_246C2BB98()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_246C2BBA8()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_246C2BBB8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_246C2BBC8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_246C2BBD8()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_246C2BBE8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_246C2BBF8()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_246C2BC08()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_246C2BC18()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_246C2BC28()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_246C2BC38()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_246C2BC48()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_246C2BC58()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_246C2BC68()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_246C2BC78()
{
  return MEMORY[0x270EF16E0]();
}

uint64_t sub_246C2BC88()
{
  return MEMORY[0x270EF1700]();
}

uint64_t sub_246C2BC98()
{
  return MEMORY[0x270F816F8]();
}

uint64_t sub_246C2BCA8()
{
  return MEMORY[0x270F81700]();
}

uint64_t sub_246C2BCB8()
{
  return MEMORY[0x270F81718]();
}

uint64_t sub_246C2BCC8()
{
  return MEMORY[0x270F81740]();
}

uint64_t sub_246C2BCD8()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_246C2BD48()
{
  return MEMORY[0x270F53948]();
}

uint64_t sub_246C2BD58()
{
  return MEMORY[0x270F53950]();
}

uint64_t sub_246C2BD68()
{
  return MEMORY[0x270F53958]();
}

uint64_t sub_246C2BD78()
{
  return MEMORY[0x270F53960]();
}

uint64_t sub_246C2BD88()
{
  return MEMORY[0x270F53968]();
}

uint64_t sub_246C2BD98()
{
  return MEMORY[0x270F53970]();
}

uint64_t sub_246C2BDA8()
{
  return MEMORY[0x270F53978]();
}

uint64_t sub_246C2BDB8()
{
  return MEMORY[0x270F53980]();
}

uint64_t sub_246C2BDC8()
{
  return MEMORY[0x270F53988]();
}

uint64_t sub_246C2BDD8()
{
  return MEMORY[0x270F53990]();
}

uint64_t sub_246C2BDE8()
{
  return MEMORY[0x270F53998]();
}

uint64_t sub_246C2BDF8()
{
  return MEMORY[0x270F539A0]();
}

uint64_t sub_246C2BE08()
{
  return MEMORY[0x270F539A8]();
}

uint64_t sub_246C2BE18()
{
  return MEMORY[0x270F539B0]();
}

uint64_t sub_246C2BE28()
{
  return MEMORY[0x270F539B8]();
}

uint64_t sub_246C2BE38()
{
  return MEMORY[0x270F539C0]();
}

uint64_t sub_246C2BE48()
{
  return MEMORY[0x270F539C8]();
}

uint64_t sub_246C2BE58()
{
  return MEMORY[0x270F539D0]();
}

uint64_t sub_246C2BE68()
{
  return MEMORY[0x270F539D8]();
}

uint64_t sub_246C2BE78()
{
  return MEMORY[0x270F539E0]();
}

uint64_t sub_246C2BE88()
{
  return MEMORY[0x270F539E8]();
}

uint64_t sub_246C2BE98()
{
  return MEMORY[0x270F539F0]();
}

uint64_t sub_246C2BEA8()
{
  return MEMORY[0x270F539F8]();
}

uint64_t sub_246C2BEB8()
{
  return MEMORY[0x270F53A00]();
}

uint64_t sub_246C2BEC8()
{
  return MEMORY[0x270F53A08]();
}

uint64_t sub_246C2BED8()
{
  return MEMORY[0x270F53A10]();
}

uint64_t sub_246C2BEE8()
{
  return MEMORY[0x270F53A18]();
}

uint64_t sub_246C2BEF8()
{
  return MEMORY[0x270F53A20]();
}

uint64_t sub_246C2BF08()
{
  return MEMORY[0x270F53A28]();
}

uint64_t sub_246C2BF18()
{
  return MEMORY[0x270F53A30]();
}

uint64_t sub_246C2BF28()
{
  return MEMORY[0x270F53A38]();
}

uint64_t sub_246C2BF38()
{
  return MEMORY[0x270F53A40]();
}

uint64_t sub_246C2BF48()
{
  return MEMORY[0x270F53A48]();
}

uint64_t sub_246C2BF58()
{
  return MEMORY[0x270F53A50]();
}

uint64_t sub_246C2BF68()
{
  return MEMORY[0x270F53A58]();
}

uint64_t sub_246C2BF78()
{
  return MEMORY[0x270F53A60]();
}

uint64_t sub_246C2BF88()
{
  return MEMORY[0x270F53A68]();
}

uint64_t sub_246C2BF98()
{
  return MEMORY[0x270F53A70]();
}

uint64_t sub_246C2BFA8()
{
  return MEMORY[0x270F53A78]();
}

uint64_t sub_246C2BFB8()
{
  return MEMORY[0x270F53A80]();
}

uint64_t sub_246C2BFC8()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_246C2BFD8()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_246C2BFE8()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_246C2BFF8()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_246C2C008()
{
  return MEMORY[0x270EF17B0]();
}

uint64_t sub_246C2C018()
{
  return MEMORY[0x270EE3130]();
}

uint64_t sub_246C2C028()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_246C2C038()
{
  return MEMORY[0x270FA18C8]();
}

uint64_t sub_246C2C048()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_246C2C058()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_246C2C068()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_246C2C078()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_246C2C088()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_246C2C098()
{
  return MEMORY[0x270F81770]();
}

uint64_t sub_246C2C0A8()
{
  return MEMORY[0x270F81948]();
}

uint64_t sub_246C2C0B8()
{
  return MEMORY[0x270F81960]();
}

uint64_t sub_246C2C0C8()
{
  return MEMORY[0x270F81978]();
}

uint64_t sub_246C2C0D8()
{
  return MEMORY[0x270F81980]();
}

uint64_t sub_246C2C0E8()
{
  return MEMORY[0x270F81988]();
}

uint64_t sub_246C2C0F8()
{
  return MEMORY[0x270F81990]();
}

uint64_t sub_246C2C108()
{
  return MEMORY[0x270F819A8]();
}

uint64_t sub_246C2C118()
{
  return MEMORY[0x270F819B0]();
}

uint64_t sub_246C2C128()
{
  return MEMORY[0x270F819D0]();
}

uint64_t sub_246C2C138()
{
  return MEMORY[0x270F81C48]();
}

uint64_t sub_246C2C148()
{
  return MEMORY[0x270F81C68]();
}

uint64_t sub_246C2C158()
{
  return MEMORY[0x270F81C70]();
}

uint64_t sub_246C2C168()
{
  return MEMORY[0x270F81C80]();
}

uint64_t sub_246C2C178()
{
  return MEMORY[0x270F81D48]();
}

uint64_t sub_246C2C188()
{
  return MEMORY[0x270F81D68]();
}

uint64_t sub_246C2C198()
{
  return MEMORY[0x270F81DB0]();
}

uint64_t sub_246C2C1A8()
{
  return MEMORY[0x270F81DD8]();
}

uint64_t sub_246C2C1B8()
{
  return MEMORY[0x270F81DF8]();
}

uint64_t sub_246C2C1C8()
{
  return MEMORY[0x270F81E00]();
}

uint64_t sub_246C2C1D8()
{
  return MEMORY[0x270F81E20]();
}

uint64_t sub_246C2C1E8()
{
  return MEMORY[0x270F81E28]();
}

uint64_t sub_246C2C1F8()
{
  return MEMORY[0x270F81E30]();
}

uint64_t sub_246C2C208()
{
  return MEMORY[0x270F81E38]();
}

uint64_t sub_246C2C218()
{
  return MEMORY[0x270F81E98]();
}

uint64_t sub_246C2C228()
{
  return MEMORY[0x270F81EB0]();
}

uint64_t sub_246C2C238()
{
  return MEMORY[0x270F81EC0]();
}

uint64_t sub_246C2C248()
{
  return MEMORY[0x270F81ED0]();
}

uint64_t sub_246C2C258()
{
  return MEMORY[0x270F81ED8]();
}

uint64_t sub_246C2C268()
{
  return MEMORY[0x270F81EE0]();
}

uint64_t sub_246C2C278()
{
  return MEMORY[0x270F81F60]();
}

uint64_t sub_246C2C288()
{
  return MEMORY[0x270F81F68]();
}

uint64_t sub_246C2C298()
{
  return MEMORY[0x270F81F78]();
}

uint64_t sub_246C2C2A8()
{
  return MEMORY[0x270F81F80]();
}

uint64_t sub_246C2C2B8()
{
  return MEMORY[0x270F81FB0]();
}

uint64_t sub_246C2C2C8()
{
  return MEMORY[0x270F82018]();
}

uint64_t sub_246C2C2D8()
{
  return MEMORY[0x270F82058]();
}

uint64_t sub_246C2C2E8()
{
  return MEMORY[0x270F82068]();
}

uint64_t sub_246C2C2F8()
{
  return MEMORY[0x270F821C8]();
}

uint64_t sub_246C2C308()
{
  return MEMORY[0x270F82268]();
}

uint64_t sub_246C2C318()
{
  return MEMORY[0x270F82270]();
}

uint64_t sub_246C2C328()
{
  return MEMORY[0x270F82280]();
}

uint64_t sub_246C2C338()
{
  return MEMORY[0x270F82288]();
}

uint64_t sub_246C2C348()
{
  return MEMORY[0x270F82298]();
}

uint64_t sub_246C2C358()
{
  return MEMORY[0x270F822A8]();
}

uint64_t sub_246C2C368()
{
  return MEMORY[0x270F822B0]();
}

uint64_t sub_246C2C378()
{
  return MEMORY[0x270F822B8]();
}

uint64_t sub_246C2C388()
{
  return MEMORY[0x270F822C0]();
}

uint64_t sub_246C2C398()
{
  return MEMORY[0x270F822D0]();
}

uint64_t sub_246C2C3A8()
{
  return MEMORY[0x270F822D8]();
}

uint64_t sub_246C2C3B8()
{
  return MEMORY[0x270F822F0]();
}

uint64_t sub_246C2C3C8()
{
  return MEMORY[0x270F822F8]();
}

uint64_t sub_246C2C3D8()
{
  return MEMORY[0x270F82300]();
}

uint64_t sub_246C2C3E8()
{
  return MEMORY[0x270F82308]();
}

uint64_t sub_246C2C3F8()
{
  return MEMORY[0x270F82310]();
}

uint64_t sub_246C2C408()
{
  return MEMORY[0x270F82330]();
}

uint64_t sub_246C2C418()
{
  return MEMORY[0x270F82348]();
}

uint64_t sub_246C2C428()
{
  return MEMORY[0x270F82360]();
}

uint64_t sub_246C2C438()
{
  return MEMORY[0x270F82398]();
}

uint64_t sub_246C2C448()
{
  return MEMORY[0x270F823C0]();
}

uint64_t sub_246C2C458()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_246C2C468()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_246C2C478()
{
  return MEMORY[0x270EFEEA8]();
}

uint64_t sub_246C2C488()
{
  return MEMORY[0x270EFEF50]();
}

uint64_t sub_246C2C498()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_246C2C4A8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_246C2C4B8()
{
  return MEMORY[0x270EFF648]();
}

uint64_t sub_246C2C4C8()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_246C2C4D8()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_246C2C4E8()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_246C2C4F8()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_246C2C508()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_246C2C518()
{
  return MEMORY[0x270F006C0]();
}

uint64_t sub_246C2C528()
{
  return MEMORY[0x270F006F0]();
}

uint64_t sub_246C2C538()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_246C2C548()
{
  return MEMORY[0x270F008E8]();
}

uint64_t sub_246C2C558()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_246C2C568()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_246C2C578()
{
  return MEMORY[0x270F00B28]();
}

uint64_t sub_246C2C588()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_246C2C598()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_246C2C5A8()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_246C2C5B8()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_246C2C5C8()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_246C2C5D8()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_246C2C5E8()
{
  return MEMORY[0x270F00FA0]();
}

uint64_t sub_246C2C5F8()
{
  return MEMORY[0x270F00FA8]();
}

uint64_t sub_246C2C608()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_246C2C618()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_246C2C628()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_246C2C638()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_246C2C648()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_246C2C658()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_246C2C678()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_246C2C688()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_246C2C698()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_246C2C6A8()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_246C2C6B8()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_246C2C6C8()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_246C2C6E8()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_246C2C6F8()
{
  return MEMORY[0x270F01940]();
}

uint64_t sub_246C2C708()
{
  return MEMORY[0x270F01950]();
}

uint64_t sub_246C2C718()
{
  return MEMORY[0x270F01E28]();
}

uint64_t sub_246C2C728()
{
  return MEMORY[0x270F02258]();
}

uint64_t sub_246C2C738()
{
  return MEMORY[0x270F022F0]();
}

uint64_t sub_246C2C748()
{
  return MEMORY[0x270F025C8]();
}

uint64_t sub_246C2C758()
{
  return MEMORY[0x270F025E0]();
}

uint64_t sub_246C2C768()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_246C2C778()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_246C2C788()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_246C2C798()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_246C2C7A8()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_246C2C7B8()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_246C2C7C8()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_246C2C7D8()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_246C2C7E8()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_246C2C7F8()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_246C2C808()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_246C2C818()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_246C2C828()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_246C2C838()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_246C2C848()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_246C2C858()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_246C2C868()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_246C2C878()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_246C2C888()
{
  return MEMORY[0x270F035F0]();
}

uint64_t sub_246C2C898()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_246C2C8A8()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_246C2C8B8()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_246C2C8C8()
{
  return MEMORY[0x270F03C30]();
}

uint64_t sub_246C2C8D8()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_246C2C8E8()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_246C2C8F8()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_246C2C908()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_246C2C918()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_246C2C928()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_246C2C938()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_246C2C948()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_246C2C958()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_246C2C968()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_246C2C978()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_246C2C988()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_246C2C998()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_246C2C9A8()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_246C2C9B8()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_246C2C9C8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_246C2C9D8()
{
  return MEMORY[0x270F050D0]();
}

uint64_t sub_246C2C9E8()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_246C2C9F8()
{
  return MEMORY[0x270F05238]();
}

uint64_t sub_246C2CA08()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_246C2CA18()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_246C2CA28()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_246C2CA38()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_246C2CA48()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_246C2CA58()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_246C2CA68()
{
  return MEMORY[0x270FA0AD0]();
}

uint64_t sub_246C2CA78()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_246C2CA88()
{
  return MEMORY[0x270EFA388]();
}

uint64_t sub_246C2CA98()
{
  return MEMORY[0x270EFA398]();
}

uint64_t sub_246C2CAA8()
{
  return MEMORY[0x270EFA3A0]();
}

uint64_t sub_246C2CAB8()
{
  return MEMORY[0x270EFA3B0]();
}

uint64_t sub_246C2CAC8()
{
  return MEMORY[0x270EFA3B8]();
}

uint64_t sub_246C2CAD8()
{
  return MEMORY[0x270EFA3C0]();
}

uint64_t sub_246C2CAE8()
{
  return MEMORY[0x270EFA3C8]();
}

uint64_t sub_246C2CAF8()
{
  return MEMORY[0x270EFA3E0]();
}

uint64_t sub_246C2CB08()
{
  return MEMORY[0x270EFA3F8]();
}

uint64_t sub_246C2CB18()
{
  return MEMORY[0x270EFA440]();
}

uint64_t sub_246C2CB28()
{
  return MEMORY[0x270EFA458]();
}

uint64_t sub_246C2CB38()
{
  return MEMORY[0x270EFA4B8]();
}

uint64_t sub_246C2CB48()
{
  return MEMORY[0x270EFA4D8]();
}

uint64_t sub_246C2CB58()
{
  return MEMORY[0x270EFA4E0]();
}

uint64_t sub_246C2CB68()
{
  return MEMORY[0x270EFA4F0]();
}

uint64_t sub_246C2CB78()
{
  return MEMORY[0x270EFA4F8]();
}

uint64_t sub_246C2CB88()
{
  return MEMORY[0x270EFA500]();
}

uint64_t sub_246C2CB98()
{
  return MEMORY[0x270FA1DF0]();
}

uint64_t sub_246C2CBA8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_246C2CBB8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_246C2CBC8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_246C2CBD8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_246C2CBE8()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_246C2CBF8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_246C2CC08()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_246C2CC18()
{
  return MEMORY[0x270EF19B8]();
}

uint64_t sub_246C2CC28()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_246C2CC38()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_246C2CC48()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_246C2CC58()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_246C2CC68()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_246C2CC78()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_246C2CC88()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_246C2CC98()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_246C2CCA8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_246C2CCB8()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_246C2CCC8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_246C2CCD8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_246C2CCE8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_246C2CCF8()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_246C2CD08()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_246C2CD18()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_246C2CD28()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_246C2CD38()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_246C2CD48()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_246C2CD58()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_246C2CD68()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_246C2CD78()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_246C2CD88()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_246C2CD98()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_246C2CDA8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_246C2CDB8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_246C2CDC8()
{
  return MEMORY[0x270FA1E30]();
}

uint64_t sub_246C2CDF8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_246C2CE08()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_246C2CE18()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_246C2CE28()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_246C2CE38()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_246C2CE48()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_246C2CE58()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_246C2CE68()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_246C2CE78()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_246C2CE88()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_246C2CE98()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_246C2CEA8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_246C2CEB8()
{
  return MEMORY[0x270F53CA0]();
}

uint64_t sub_246C2CEC8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_246C2CED8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_246C2CEE8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_246C2CEF8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_246C2CF08()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_246C2CF18()
{
  return MEMORY[0x270EE3148]();
}

uint64_t sub_246C2CF28()
{
  return MEMORY[0x270F824D8]();
}

uint64_t sub_246C2CF38()
{
  return MEMORY[0x270F824E8]();
}

uint64_t sub_246C2CF48()
{
  return MEMORY[0x270F824F8]();
}

uint64_t sub_246C2CF58()
{
  return MEMORY[0x270F82508]();
}

uint64_t sub_246C2CF68()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_246C2CF78()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_246C2CF88()
{
  return MEMORY[0x270F82590]();
}

uint64_t sub_246C2CF98()
{
  return MEMORY[0x270F82598]();
}

uint64_t sub_246C2CFA8()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_246C2CFB8()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_246C2CFC8()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_246C2CFD8()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_246C2CFE8()
{
  return MEMORY[0x270FA0EE0]();
}

uint64_t sub_246C2CFF8()
{
  return MEMORY[0x270F82658]();
}

uint64_t sub_246C2D008()
{
  return MEMORY[0x270EFA510]();
}

uint64_t sub_246C2D018()
{
  return MEMORY[0x270EFA518]();
}

uint64_t sub_246C2D028()
{
  return MEMORY[0x270EFA520]();
}

uint64_t sub_246C2D038()
{
  return MEMORY[0x270FA0F58]();
}

uint64_t sub_246C2D048()
{
  return MEMORY[0x270F826D0]();
}

uint64_t sub_246C2D058()
{
  return MEMORY[0x270F826D8]();
}

uint64_t sub_246C2D068()
{
  return MEMORY[0x270F82708]();
}

uint64_t sub_246C2D078()
{
  return MEMORY[0x270F82858]();
}

uint64_t sub_246C2D088()
{
  return MEMORY[0x270EE5908]();
}

uint64_t sub_246C2D098()
{
  return MEMORY[0x270EE5910]();
}

uint64_t sub_246C2D0A8()
{
  return MEMORY[0x270EE5920]();
}

uint64_t sub_246C2D0B8()
{
  return MEMORY[0x270EE3150]();
}

uint64_t sub_246C2D0C8()
{
  return MEMORY[0x270EF20D8]();
}

uint64_t sub_246C2D0D8()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_246C2D0E8()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_246C2D0F8()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_246C2D108()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_246C2D118()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_246C2D128()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_246C2D138()
{
  return MEMORY[0x270F82998]();
}

uint64_t sub_246C2D148()
{
  return MEMORY[0x270F82AD0]();
}

uint64_t sub_246C2D158()
{
  return MEMORY[0x270F82B00]();
}

uint64_t sub_246C2D168()
{
  return MEMORY[0x270F82B28]();
}

uint64_t sub_246C2D178()
{
  return MEMORY[0x270F82B58]();
}

uint64_t sub_246C2D188()
{
  return MEMORY[0x270F82B60]();
}

uint64_t sub_246C2D198()
{
  return MEMORY[0x270F82B88]();
}

uint64_t sub_246C2D1A8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_246C2D1B8()
{
  return MEMORY[0x270EF23C8]();
}

uint64_t sub_246C2D1C8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_246C2D1D8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_246C2D1E8()
{
  return MEMORY[0x270EF2410]();
}

uint64_t sub_246C2D1F8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_246C2D208()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_246C2D218()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_246C2D228()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_246C2D238()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_246C2D248()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_246C2D258()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_246C2D268()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_246C2D278()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_246C2D288()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_246C2D298()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_246C2D2A8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_246C2D2B8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_246C2D2C8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_246C2D2D8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_246C2D2E8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_246C2D2F8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_246C2D308()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_246C2D318()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_246C2D328()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_246C2D338()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_246C2D348()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_246C2D358()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_246C2D378()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_246C2D388()
{
  return MEMORY[0x270F9EFC8]();
}

uint64_t sub_246C2D398()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_246C2D3A8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_246C2D3B8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_246C2D3C8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_246C2D3D8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_246C2D3E8()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_246C2D3F8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_246C2D408()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_246C2D428()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_246C2D438()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_246C2D448()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_246C2D458()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_246C2D468()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_246C2D478()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_246C2D488()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_246C2D498()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_246C2D4A8()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_246C2D4B8()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_246C2D4C8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_246C2D4D8()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_246C2D4E8()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_246C2D4F8()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_246C2D508()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_246C2D518()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_246C2D528()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_246C2D548()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_246C2D558()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_246C2D568()
{
  return MEMORY[0x270F9F7C8]();
}

uint64_t sub_246C2D578()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_246C2D588()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_246C2D598()
{
  return MEMORY[0x270F9F878]();
}

uint64_t sub_246C2D5A8()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_246C2D5B8()
{
  return MEMORY[0x270F9FA98]();
}

uint64_t sub_246C2D5C8()
{
  return MEMORY[0x270F9FAA8]();
}

uint64_t sub_246C2D5D8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_246C2D5E8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_246C2D5F8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_246C2D608()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_246C2D618()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_246C2D628()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_246C2D638()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_246C2D658()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_246C2D668()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_246C2D678()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_246C2D688()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_246C2D698()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_246C2D6A8()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_246C2D6B8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_246C2D6C8()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t sub_246C2D6D8()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_246C2D6E8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_246C2D6F8()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_246C2D708()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t BPSBridgeTintColor()
{
  return MEMORY[0x270F12828]();
}

uint64_t BPSDetailTextColor()
{
  return MEMORY[0x270F12830]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
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

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D18](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return (CGGradientRef)MEMORY[0x270EE6680](space, components, locations, count);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x270EE67E8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x270EE6888](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
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

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

uint64_t CLKCompressFraction()
{
  return MEMORY[0x270EE3170]();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return MEMORY[0x270EE31B0]();
}

uint64_t CLKInterpolateBetweenFloatsUnclipped()
{
  return MEMORY[0x270EE31B8]();
}

uint64_t CLKInterpolateBetweenRects()
{
  return MEMORY[0x270EE31C8]();
}

uint64_t CLKIsBridge()
{
  return MEMORY[0x270EE31D0]();
}

uint64_t CLKLocaleNumberSystemFromNumeralOption()
{
  return MEMORY[0x270F4D8C8]();
}

uint64_t CLKLocaleRenderingHintLanguageIdentifierForNumberingSystem()
{
  return MEMORY[0x270EE3208]();
}

uint64_t CLKRectEqualsRect()
{
  return MEMORY[0x270EE3238]();
}

uint64_t CLKUIConvertToRGBfFromSRGBf_fast()
{
  return MEMORY[0x270F168F0]();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NTKAllUtilitySmallFlatComplicationTypes()
{
  return MEMORY[0x270F4D8F0]();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return MEMORY[0x270F4D8F8]();
}

uint64_t NTKCCustomizationLocalizedFormat()
{
  return MEMORY[0x270F4D908]();
}

uint64_t NTKCCustomizationLocalizedString()
{
  return MEMORY[0x270F4D910]();
}

uint64_t NTKCGImagePropertyOrientationToUIImageOrientation()
{
  return MEMORY[0x270F4D918]();
}

uint64_t NTKCacheDirectory()
{
  return MEMORY[0x270F4D920]();
}

uint64_t NTKClockFaceLocalizedString()
{
  return MEMORY[0x270F4D928]();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return MEMORY[0x270F4D948]();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return MEMORY[0x270F4D950]();
}

uint64_t NTKCropImage()
{
  return MEMORY[0x270F4D958]();
}

uint64_t NTKDefaultMonochromeColorMatrix()
{
  return MEMORY[0x270F4D960]();
}

uint64_t NTKEnumerateComplicationStates()
{
  return MEMORY[0x270F4D968]();
}

uint64_t NTKEqualStrings()
{
  return MEMORY[0x270F4D970]();
}

uint64_t NTKFaceColorNameAndCollection()
{
  return MEMORY[0x270F4D978]();
}

uint64_t NTKFaceColorNameForDuotones()
{
  return MEMORY[0x270F4D980]();
}

uint64_t NTKFaceDataModeDescription()
{
  return MEMORY[0x270F4D988]();
}

uint64_t NTKFaceEditingFullscreenKeylineMargin()
{
  return MEMORY[0x270F4D990]();
}

uint64_t NTKForegroundColor()
{
  return MEMORY[0x270F4D9A0]();
}

uint64_t NTKGenerateMonochromeColorMatrixFromImage()
{
  return MEMORY[0x270F4D9A8]();
}

uint64_t NTKIdealizedDate()
{
  return MEMORY[0x270F4D9C0]();
}

uint64_t NTKImageNamed()
{
  return MEMORY[0x270F4D9C8]();
}

uint64_t NTKImagePresentationSize()
{
  return MEMORY[0x270F4D9D0]();
}

uint64_t NTKImagePresentationTransform()
{
  return MEMORY[0x270F4D9D8]();
}

uint64_t NTKInternalBuild()
{
  return MEMORY[0x270F4D9E0]();
}

uint64_t NTKInterpolateBetweenImages()
{
  return MEMORY[0x270F4D9F0]();
}

uint64_t NTKInterpolateColorMatrixToIdentity()
{
  return MEMORY[0x270F4D9F8]();
}

uint64_t NTKIsDefaultMonochromeColorMatrix()
{
  return MEMORY[0x270F4DA00]();
}

uint64_t NTKIsScreenOn()
{
  return MEMORY[0x270F4DA08]();
}

uint64_t NTKKeylineCornerRadiusLarge()
{
  return MEMORY[0x270F4DA10]();
}

uint64_t NTKKeylineViewWithContinuousCurveCornerRadius()
{
  return MEMORY[0x270F4DA18]();
}

uint64_t NTKKeylineViewWithFullScreenContinuousCurves()
{
  return MEMORY[0x270F4DA20]();
}

uint64_t NTKKeylineWidth()
{
  return MEMORY[0x270F4DA28]();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return MEMORY[0x270F4DA30]();
}

uint64_t NTKNewUniqueTeporaryResourceDirectory()
{
  return MEMORY[0x270F4DA48]();
}

uint64_t NTKPHAssetsForLocalIdentifiers()
{
  return MEMORY[0x270F4DA50]();
}

uint64_t NTKPeerDeviceHandlesWideLoads()
{
  return MEMORY[0x270F4DA58]();
}

uint64_t NTKPhotosCreateResourceDirectory()
{
  return MEMORY[0x270F4DA60]();
}

uint64_t NTKPhotosDefaultCropForImage()
{
  return MEMORY[0x270F4DA68]();
}

uint64_t NTKPhotosImageForURL()
{
  return MEMORY[0x270F4DA70]();
}

uint64_t NTKPhotosLinkURL()
{
  return MEMORY[0x270F4DA78]();
}

uint64_t NTKPhotosWriteImageListWithVersion()
{
  return MEMORY[0x270F4DA80]();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return MEMORY[0x270F4DA90]();
}

uint64_t NTKShowIndicScriptNumerals()
{
  return MEMORY[0x270F4DA98]();
}

uint64_t NTKSwatchColorSectorsImage()
{
  return MEMORY[0x270F4DAA0]();
}

uint64_t NTKSwatchTwoColorGradientImage()
{
  return MEMORY[0x270F4DAA8]();
}

uint64_t NTKUIImageOrientationToCGImagePropertyOrientation()
{
  return MEMORY[0x270F4DAB8]();
}

uint64_t NTKUtilityComplicationFontSize()
{
  return MEMORY[0x270F4DAC0]();
}

uint64_t PFCRectForTimePosition()
{
  return MEMORY[0x270F53A90]();
}

uint64_t PFLGenerateWatchLayout()
{
  return MEMORY[0x270F53A98]();
}

uint64_t TextToFourCharCode()
{
  return MEMORY[0x270F247A8]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  MEMORY[0x270F82BE8](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v3;
  result.origin.CGFloat x = v2;
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
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

NSData *__cdecl UIImageHEICRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DC8](image);
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x270F82E70]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F82F00]();
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

uint64_t _NTKLoggingObjectForDomain()
{
  return MEMORY[0x270F4DAE0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
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

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
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

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}