uint64_t CCUIGridSizeClassMaskAll()
{
  return 2015;
}

__CFString *NSStringFromCCUIGridSizeClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9) {
    return @"CCUIGridSizeClassSmall";
  }
  else {
    return off_26528F230[a1 - 1];
  }
}

void CCUIEnumerateGridSizeClassesWithBlock(void (**a1)(id, uint64_t))
{
  v1 = a1 + 2;
  v2 = (void (*)(void))a1[2];
  v3 = a1;
  v2();
  (*v1)(v3, 1);
  (*v1)(v3, 2);
  (*v1)(v3, 3);
  (*v1)(v3, 4);
  (*v1)(v3, 5);
  (*v1)(v3, 6);
  (*v1)(v3, 7);
  (*v1)(v3, 8);
  (*v1)(v3, 9);
  (*v1)(v3, 10);
}

uint64_t CCUIGridSizeClassMaskForGridSizeClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9) {
    return 1;
  }
  else {
    return qword_24A7DDCA8[a1 - 1];
  }
}

uint64_t CCUIAdjustGridSizeClassForAccessibility(uint64_t result, int a2)
{
  if (a2)
  {
    if (result == 2)
    {
      return 3;
    }
    else if (result == 4)
    {
      return 5;
    }
  }
  else if (result == 3)
  {
    return 2;
  }
  else if (result == 5)
  {
    return 4;
  }
  return result;
}

uint64_t CCUIDefaultSupportedGridSizeClassesForChronoControls()
{
  return 21;
}

__CFString *SBHIconGridSizeClassForCCUIGridSizeClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9) {
    return @"CCUIIconGridSizeClassSmall";
  }
  else {
    return off_26528F2C8[a1 - 1];
  }
}

uint64_t CCUIGridSizeClassForSBHIconGridSizeClass(void *a1, uint64_t a2)
{
  v3 = a1;
  v4 = v3;
  if (v3 == @"CCUIIconGridSizeClassSmall"
    || ([(__CFString *)v3 isEqualToString:@"CCUIIconGridSizeClassSmall"] & 1) != 0)
  {
    goto LABEL_3;
  }
  if (v4 == @"CCUIIconGridSizeClassSmallTall"
    || ([(__CFString *)v4 isEqualToString:@"CCUIIconGridSizeClassSmallTall"] & 1) != 0)
  {
    uint64_t v5 = 1;
    goto LABEL_32;
  }
  if (v4 == @"CCUIIconGridSizeClassSmallWide"
    || ([(__CFString *)v4 isEqualToString:@"CCUIIconGridSizeClassSmallWide"] & 1) != 0)
  {
    uint64_t v5 = 2;
    goto LABEL_32;
  }
  if (v4 == @"CCUIIconGridSizeClassSmallExtraWide"
    || ([(__CFString *)v4 isEqualToString:@"CCUIIconGridSizeClassSmallExtraWide"] & 1) != 0)
  {
    uint64_t v5 = 3;
    goto LABEL_32;
  }
  if (v4 == @"CCUIIconGridSizeClassMedium"
    || ([(__CFString *)v4 isEqualToString:@"CCUIIconGridSizeClassMedium"] & 1) != 0)
  {
    uint64_t v5 = 4;
    goto LABEL_32;
  }
  if (v4 == @"CCUIIconGridSizeClassMediumWide"
    || ([(__CFString *)v4 isEqualToString:@"CCUIIconGridSizeClassMediumWide"] & 1) != 0)
  {
    uint64_t v5 = 5;
    goto LABEL_32;
  }
  if (v4 == @"CCUIIconGridSizeClassLarge"
    || ([(__CFString *)v4 isEqualToString:@"CCUIIconGridSizeClassLarge"] & 1) != 0)
  {
    uint64_t v5 = 6;
    goto LABEL_32;
  }
  if (v4 == @"CCUIIconGridSizeClassLargeTall"
    || [(__CFString *)v4 isEqualToString:@"CCUIIconGridSizeClassLargeTall"])
  {
    if ((unint64_t)(a2 - 3) < 2) {
      uint64_t v5 = 6;
    }
    else {
      uint64_t v5 = 7;
    }
  }
  else
  {
    if (v4 != @"CCUIIconGridSizeClassLargeExtraTall"
      && ![(__CFString *)v4 isEqualToString:@"CCUIIconGridSizeClassLargeExtraTall"])
    {
      v7 = [MEMORY[0x263F08690] currentHandler];
      v8 = objc_msgSend(NSString, "stringWithUTF8String:", "CCUIGridSizeClass CCUIGridSizeClassForSBHIconGridSizeClass(__strong SBHIconGridSizeClass _Nonnull, UIInterfaceOrientation)");
      [v7 handleFailureInFunction:v8, @"CCUIIconTypes.m", 89, @"Unimplemented Control Center grid size class: %@", v4 file lineNumber description];

LABEL_3:
      uint64_t v5 = 0;
      goto LABEL_32;
    }
    if ((unint64_t)(a2 - 3) >= 2) {
      uint64_t v5 = 9;
    }
    else {
      uint64_t v5 = 10;
    }
  }
LABEL_32:

  return v5;
}

id SBHIconGridSizeClassSetForCCUIGridSizeClassMask(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F79230]);
  v6 = (void (*)(id, uint64_t))MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __SBHIconGridSizeClassSetForCCUIGridSizeClassMask_block_invoke;
  v9 = &unk_26528F288;
  id v10 = v2;
  uint64_t v11 = a1;
  id v3 = v2;
  CCUIEnumerateGridSizeClassesWithBlock(&v6);
  v4 = objc_msgSend(v3, "copy", v6, v7, v8, v9);

  return v4;
}

uint64_t __SBHIconGridSizeClassSetForCCUIGridSizeClassMask_block_invoke(uint64_t result, uint64_t a2)
{
  if ((*(void *)(result + 40) & (1 << a2)) != 0)
  {
    id v2 = *(void **)(result + 32);
    if ((unint64_t)(a2 - 1) > 9) {
      id v3 = @"CCUIIconGridSizeClassSmall";
    }
    else {
      id v3 = off_26528F2C8[a2 - 1];
    }
    return [v2 addGridSizeClass:v3];
  }
  return result;
}

ControlCenterUIServices::ControlsGalleryCustomElementType_optional __swiftcall ControlsGalleryCustomElementType.init(rawValue:)(Swift::Int rawValue)
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
  return (ControlCenterUIServices::ControlsGalleryCustomElementType_optional)rawValue;
}

uint64_t ControlsGalleryCustomElementType.rawValue.getter()
{
  return *v0;
}

BOOL sub_24A7C4A48(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24A7C4A60()
{
  return sub_24A7DCDC0();
}

uint64_t sub_24A7C4AA8()
{
  return sub_24A7DCDB0();
}

uint64_t sub_24A7C4AD4()
{
  return sub_24A7DCDC0();
}

void *sub_24A7C4B18@<X0>(void *result@<X0>, char *a2@<X8>)
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

void sub_24A7C4B38(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_24A7C4B44()
{
  qword_2697BD3C8 = (uint64_t)&unk_26FE47778;
}

uint64_t static ControlsGalleryCustomCollections.legacyModuleIdentifiersToHidePhone.getter()
{
  return sub_24A7C4BB4(&qword_2697BD3C0);
}

void sub_24A7C4B7C()
{
  qword_2697BD3D8 = (uint64_t)&unk_26FE47678;
}

uint64_t static ControlsGalleryCustomCollections.legacyModuleIdentifiersToHidePad.getter()
{
  return sub_24A7C4BB4(&qword_2697BD3D0);
}

uint64_t sub_24A7C4BB4(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

unint64_t sub_24A7C4C04()
{
  unint64_t result = qword_2697BD3F8;
  if (!qword_2697BD3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697BD3F8);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ControlsGalleryCustomElementType(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ControlsGalleryCustomElementType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24A7C4DC4);
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

uint64_t sub_24A7C4DEC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24A7C4DF8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ControlsGalleryCustomElementType()
{
  return &type metadata for ControlsGalleryCustomElementType;
}

ValueMetadata *type metadata accessor for ControlsGalleryCustomCollections()
{
  return &type metadata for ControlsGalleryCustomCollections;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24A7C4E30(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24A7C4E50(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CCUIGridGeometryInfo(uint64_t a1)
{
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_24A7C4E98(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24A7C4EB8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for SBIconImageInfo(uint64_t a1)
{
}

void type metadata accessor for CHSControlSize(uint64_t a1)
{
}

uint64_t sub_24A7C4F0C(uint64_t a1, uint64_t a2)
{
  return sub_24A7C5218(a1, a2, MEMORY[0x263F07B58]);
}

void sub_24A7C4F30(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_24A7C4F38@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_24A7C4F4C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

void *sub_24A7C4F60@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_24A7C4F8C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_24A7C4FB0(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_24A7C4FC4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_24A7C4FD8(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_24A7C4FEC(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_24A7C5000(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_24A7C5014()
{
  return *v0 == 0;
}

uint64_t sub_24A7C5024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_24A7C503C(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_24A7C5050(uint64_t a1, id *a2)
{
  uint64_t result = sub_24A7DCA20();
  *a2 = 0;
  return result;
}

uint64_t sub_24A7C50C8(uint64_t a1, id *a2)
{
  char v3 = sub_24A7DCA30();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24A7C5148@<X0>(uint64_t *a1@<X8>)
{
  sub_24A7DCA40();
  uint64_t v2 = sub_24A7DCA10();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24A7C518C(uint64_t a1, uint64_t a2)
{
  return sub_24A7C5218(a1, a2, MEMORY[0x263F8D308]);
}

void *sub_24A7C51AC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_24A7C51C0(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_24A7C51F0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_24A7C5204(void *result)
{
  *v1 &= *result;
  return result;
}

uint64_t sub_24A7C5218(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24A7DCA40();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24A7C525C()
{
  sub_24A7DCA40();
  sub_24A7DCA50();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A7C52B0()
{
  sub_24A7DCA40();
  sub_24A7DCDA0();
  sub_24A7DCA50();
  uint64_t v0 = sub_24A7DCDC0();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_24A7C5324(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24A7C5338@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_24A7C7B74(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void *sub_24A7C537C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_24A7C5388()
{
  uint64_t v0 = sub_24A7DCA40();
  uint64_t v2 = v1;
  if (v0 == sub_24A7DCA40() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24A7DCD80();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void *sub_24A7C5414@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_24A7C5424(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24A7C5434(uint64_t a1)
{
  uint64_t v2 = sub_24A7C78EC(&qword_2697BD5C8, type metadata accessor for SBHIconGridSizeClass);
  uint64_t v3 = sub_24A7C78EC(&qword_2697BD5D0, type metadata accessor for SBHIconGridSizeClass);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_24A7C54F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24A7DCA10();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24A7C5538@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24A7DCA40();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24A7C5564(uint64_t a1)
{
  uint64_t v2 = sub_24A7C78EC(&qword_2697BDC70, type metadata accessor for SBIconLocation);
  uint64_t v3 = sub_24A7C78EC(&qword_2697BD5C0, type metadata accessor for SBIconLocation);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

char *sub_24A7C5620()
{
  if (qword_2697BD3E0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_2697BEC68;
  uint64_t v1 = (void *)sub_24A7DCA10();
  id v2 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, 0, 0);

  uint64_t v3 = sub_24A7DCA40();
  uint64_t v5 = v4;

  unsigned int v6 = (void *)sub_24A7DCA10();
  v241 = self;
  id v7 = objc_msgSend(v241, sel_systemImageNamed_, v6);

  v240 = self;
  id v8 = objc_msgSend(v240, sel_systemBlueColor);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
  id v10 = objc_msgSend(v9, sel_UUIDString);

  uint64_t v11 = sub_24A7DCA40();
  uint64_t v13 = v12;

  swift_bridgeObjectRetain();
  id v232 = v7;
  id v231 = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = sub_24A7CFF60(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v16 = *((void *)v14 + 2);
  unint64_t v15 = *((void *)v14 + 3);
  if (v16 >= v15 >> 1) {
    v14 = sub_24A7CFF60((char *)(v15 > 1), v16 + 1, 1, v14);
  }
  *((void *)v14 + 2) = v16 + 1;
  v17 = &v14[72 * v16];
  *((void *)v17 + 4) = v3;
  *((void *)v17 + 5) = v5;
  *((void *)v17 + 6) = v7;
  *((void *)v17 + 7) = v8;
  *((void *)v17 + 8) = &unk_26FE47568;
  *((void *)v17 + 9) = 0;
  *((void *)v17 + 10) = 0;
  *((void *)v17 + 11) = v11;
  *((void *)v17 + 12) = v13;
  v18 = (void *)qword_2697BEC68;
  v19 = (void *)sub_24A7DCA10();
  id v20 = objc_msgSend(v18, sel_localizedStringForKey_value_table_, v19, 0, 0);

  uint64_t v239 = sub_24A7DCA40();
  uint64_t v22 = v21;

  v23 = (void *)sub_24A7DCA10();
  id v24 = objc_msgSend(v241, sel_systemImageNamed_, v23);

  id v25 = objc_msgSend(v240, sel_systemGreenColor);
  id v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
  id v27 = objc_msgSend(v26, sel_UUIDString);

  uint64_t v28 = sub_24A7DCA40();
  uint64_t v30 = v29;

  unint64_t v31 = *((void *)v14 + 2);
  unint64_t v32 = *((void *)v14 + 3);
  swift_bridgeObjectRetain();
  id v230 = v24;
  id v229 = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v31 >= v32 >> 1) {
    v14 = sub_24A7CFF60((char *)(v32 > 1), v31 + 1, 1, v14);
  }
  *((void *)v14 + 2) = v31 + 1;
  v33 = &v14[72 * v31];
  *((void *)v33 + 4) = v239;
  *((void *)v33 + 5) = v22;
  *((void *)v33 + 6) = v24;
  *((void *)v33 + 7) = v25;
  *((void *)v33 + 8) = &unk_26FE45A78;
  *((void *)v33 + 9) = 0;
  *((void *)v33 + 10) = 0;
  *((void *)v33 + 11) = v28;
  *((void *)v33 + 12) = v30;
  v34 = (void *)qword_2697BEC68;
  v35 = (void *)sub_24A7DCA10();
  id v36 = objc_msgSend(v34, sel_localizedStringForKey_value_table_, v35, 0, 0);

  uint64_t v238 = sub_24A7DCA40();
  uint64_t v38 = v37;

  v39 = (void *)sub_24A7DCA10();
  id v40 = objc_msgSend(v241, sel_systemImageNamed_, v39);

  id v41 = objc_msgSend(v240, sel_systemRedColor);
  id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
  id v43 = objc_msgSend(v42, sel_UUIDString);

  uint64_t v44 = sub_24A7DCA40();
  uint64_t v46 = v45;

  unint64_t v47 = *((void *)v14 + 2);
  unint64_t v48 = *((void *)v14 + 3);
  swift_bridgeObjectRetain();
  id v228 = v40;
  id v227 = v41;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v47 >= v48 >> 1) {
    v14 = sub_24A7CFF60((char *)(v48 > 1), v47 + 1, 1, v14);
  }
  *((void *)v14 + 2) = v47 + 1;
  v49 = &v14[72 * v47];
  *((void *)v49 + 4) = v238;
  *((void *)v49 + 5) = v38;
  *((void *)v49 + 6) = v40;
  *((void *)v49 + 7) = v41;
  *((void *)v49 + 8) = &unk_26FE46098;
  *((void *)v49 + 9) = 0;
  *((void *)v49 + 10) = 0;
  *((void *)v49 + 11) = v44;
  *((void *)v49 + 12) = v46;
  v50 = (void *)qword_2697BEC68;
  v51 = (void *)sub_24A7DCA10();
  id v52 = objc_msgSend(v50, sel_localizedStringForKey_value_table_, v51, 0, 0);

  uint64_t v237 = sub_24A7DCA40();
  uint64_t v54 = v53;

  v55 = (void *)sub_24A7DCA10();
  id v56 = objc_msgSend(v241, sel__systemImageNamed_, v55);

  id v57 = objc_msgSend(v240, sel_systemPinkColor);
  id v58 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
  id v59 = objc_msgSend(v58, sel_UUIDString);

  uint64_t v60 = sub_24A7DCA40();
  uint64_t v62 = v61;

  unint64_t v63 = *((void *)v14 + 2);
  unint64_t v64 = *((void *)v14 + 3);
  swift_bridgeObjectRetain();
  id v226 = v56;
  id v225 = v57;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v63 >= v64 >> 1) {
    v14 = sub_24A7CFF60((char *)(v64 > 1), v63 + 1, 1, v14);
  }
  *((void *)v14 + 2) = v63 + 1;
  v65 = &v14[72 * v63];
  *((void *)v65 + 4) = v237;
  *((void *)v65 + 5) = v54;
  *((void *)v65 + 6) = v56;
  *((void *)v65 + 7) = v57;
  *((void *)v65 + 8) = &unk_26FE46248;
  *((void *)v65 + 9) = 0;
  *((void *)v65 + 10) = 0;
  *((void *)v65 + 11) = v60;
  *((void *)v65 + 12) = v62;
  v66 = (void *)qword_2697BEC68;
  v67 = (void *)sub_24A7DCA10();
  id v68 = objc_msgSend(v66, sel_localizedStringForKey_value_table_, v67, 0, 0);

  uint64_t v236 = sub_24A7DCA40();
  uint64_t v70 = v69;

  v71 = (void *)sub_24A7DCA10();
  id v72 = objc_msgSend(v241, sel_systemImageNamed_, v71);

  id v73 = objc_msgSend(v240, sel_systemDarkPurpleColor);
  id v74 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
  id v75 = objc_msgSend(v74, sel_UUIDString);

  uint64_t v76 = sub_24A7DCA40();
  uint64_t v78 = v77;

  unint64_t v79 = *((void *)v14 + 2);
  unint64_t v80 = *((void *)v14 + 3);
  swift_bridgeObjectRetain();
  id v224 = v72;
  id v223 = v73;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v79 >= v80 >> 1) {
    v14 = sub_24A7CFF60((char *)(v80 > 1), v79 + 1, 1, v14);
  }
  *((void *)v14 + 2) = v79 + 1;
  v81 = &v14[72 * v79];
  *((void *)v81 + 4) = v236;
  *((void *)v81 + 5) = v70;
  *((void *)v81 + 6) = v72;
  *((void *)v81 + 7) = v73;
  *((void *)v81 + 8) = &unk_26FE462B8;
  *((void *)v81 + 9) = 0;
  *((void *)v81 + 10) = 0;
  *((void *)v81 + 11) = v76;
  *((void *)v81 + 12) = v78;
  v82 = (void *)qword_2697BEC68;
  v83 = (void *)sub_24A7DCA10();
  id v84 = objc_msgSend(v82, sel_localizedStringForKey_value_table_, v83, 0, 0);

  uint64_t v235 = sub_24A7DCA40();
  uint64_t v86 = v85;

  v87 = (void *)sub_24A7DCA10();
  id v88 = objc_msgSend(v241, sel_systemImageNamed_, v87);

  id v89 = objc_msgSend(v240, sel_systemBlueColor);
  id v90 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
  id v91 = objc_msgSend(v90, sel_UUIDString);

  uint64_t v234 = sub_24A7DCA40();
  uint64_t v93 = v92;

  unint64_t v94 = *((void *)v14 + 2);
  unint64_t v95 = *((void *)v14 + 3);
  swift_bridgeObjectRetain();
  id v222 = v88;
  id v221 = v89;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v94 >= v95 >> 1) {
    v14 = sub_24A7CFF60((char *)(v95 > 1), v94 + 1, 1, v14);
  }
  *((void *)v14 + 2) = v94 + 1;
  v96 = &v14[72 * v94];
  *((void *)v96 + 4) = v235;
  *((void *)v96 + 5) = v86;
  *((void *)v96 + 6) = v88;
  *((void *)v96 + 7) = v89;
  *((void *)v96 + 8) = &unk_26FE46328;
  *((void *)v96 + 9) = 0;
  *((void *)v96 + 10) = 0;
  *((void *)v96 + 11) = v234;
  *((void *)v96 + 12) = v93;
  v97 = (void *)qword_2697BEC68;
  v98 = (void *)sub_24A7DCA10();
  id v99 = objc_msgSend(v97, sel_localizedStringForKey_value_table_, v98, 0, 0);

  uint64_t v233 = sub_24A7DCA40();
  uint64_t v101 = v100;

  v102 = (void *)sub_24A7DCA10();
  id v103 = objc_msgSend(v241, sel_systemImageNamed_, v102);

  id v104 = objc_msgSend(v240, sel_systemPurpleColor);
  id v105 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
  id v106 = objc_msgSend(v105, sel_UUIDString);

  uint64_t v107 = sub_24A7DCA40();
  uint64_t v109 = v108;

  unint64_t v110 = *((void *)v14 + 2);
  unint64_t v111 = *((void *)v14 + 3);
  swift_bridgeObjectRetain();
  id v220 = v103;
  id v219 = v104;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v110 >= v111 >> 1) {
    v14 = sub_24A7CFF60((char *)(v111 > 1), v110 + 1, 1, v14);
  }
  *((void *)v14 + 2) = v110 + 1;
  v112 = &v14[72 * v110];
  *((void *)v112 + 4) = v233;
  *((void *)v112 + 5) = v101;
  *((void *)v112 + 6) = v103;
  *((void *)v112 + 7) = v104;
  *((void *)v112 + 8) = &unk_26FE46578;
  *((void *)v112 + 9) = 0;
  *((void *)v112 + 10) = 0;
  *((void *)v112 + 11) = v107;
  *((void *)v112 + 12) = v109;
  v113 = (void *)qword_2697BEC68;
  v114 = (void *)sub_24A7DCA10();
  id v115 = objc_msgSend(v113, sel_localizedStringForKey_value_table_, v114, 0, 0);

  uint64_t v116 = sub_24A7DCA40();
  uint64_t v118 = v117;

  v119 = (void *)sub_24A7DCA10();
  id v120 = objc_msgSend(v241, sel_systemImageNamed_, v119);

  id v121 = objc_msgSend(v240, sel_systemBlueColor);
  unint64_t v122 = *((void *)v14 + 2);
  unint64_t v123 = *((void *)v14 + 3);
  swift_bridgeObjectRetain();
  id v218 = v120;
  id v217 = v121;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v122 >= v123 >> 1) {
    v14 = sub_24A7CFF60((char *)(v123 > 1), v122 + 1, 1, v14);
  }
  *((void *)v14 + 2) = v122 + 1;
  v124 = &v14[72 * v122];
  *((void *)v124 + 4) = v116;
  *((void *)v124 + 5) = v118;
  *((void *)v124 + 6) = v120;
  *((void *)v124 + 7) = v121;
  *((void *)v124 + 8) = &unk_26FE46958;
  *((void *)v124 + 9) = 0;
  *((void *)v124 + 10) = 0;
  strcpy(v124 + 88, "ACCESSIBILITY");
  *((_WORD *)v124 + 51) = -4864;
  v125 = (void *)qword_2697BEC68;
  v126 = (void *)sub_24A7DCA10();
  id v127 = objc_msgSend(v125, sel_localizedStringForKey_value_table_, v126, 0, 0);

  uint64_t v128 = sub_24A7DCA40();
  uint64_t v130 = v129;

  v131 = (void *)sub_24A7DCA10();
  id v132 = objc_msgSend(v241, sel_systemImageNamed_, v131);

  id v133 = objc_msgSend(v240, sel_systemBlueColor);
  unint64_t v134 = *((void *)v14 + 2);
  unint64_t v135 = *((void *)v14 + 3);
  swift_bridgeObjectRetain();
  id v216 = v132;
  id v215 = v133;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v134 >= v135 >> 1) {
    v14 = sub_24A7CFF60((char *)(v135 > 1), v134 + 1, 1, v14);
  }
  *((void *)v14 + 2) = v134 + 1;
  v136 = &v14[72 * v134];
  *((void *)v136 + 4) = v128;
  *((void *)v136 + 5) = v130;
  *((void *)v136 + 6) = v132;
  *((void *)v136 + 7) = v133;
  *((void *)v136 + 8) = &unk_26FE46B08;
  *((void *)v136 + 9) = 0;
  *((void *)v136 + 10) = 0;
  *((void *)v136 + 11) = 0xD000000000000014;
  *((void *)v136 + 12) = 0x800000024A7E04A0;
  v137 = (void *)qword_2697BEC68;
  v138 = (void *)sub_24A7DCA10();
  id v139 = objc_msgSend(v137, sel_localizedStringForKey_value_table_, v138, 0, 0);

  uint64_t v140 = sub_24A7DCA40();
  uint64_t v142 = v141;

  v143 = (void *)sub_24A7DCA10();
  id v144 = objc_msgSend(v241, sel_systemImageNamed_, v143);

  id v145 = objc_msgSend(v240, sel_systemBlueColor);
  unint64_t v146 = *((void *)v14 + 2);
  unint64_t v147 = *((void *)v14 + 3);
  swift_bridgeObjectRetain();
  id v214 = v144;
  id v213 = v145;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v146 >= v147 >> 1) {
    v14 = sub_24A7CFF60((char *)(v147 > 1), v146 + 1, 1, v14);
  }
  *((void *)v14 + 2) = v146 + 1;
  v148 = &v14[72 * v146];
  *((void *)v148 + 4) = v140;
  *((void *)v148 + 5) = v142;
  *((void *)v148 + 6) = v144;
  *((void *)v148 + 7) = v145;
  *((void *)v148 + 8) = &unk_26FE47028;
  *((void *)v148 + 9) = 0;
  *((void *)v148 + 10) = 0;
  *((void *)v148 + 11) = 0xD000000000000013;
  *((void *)v148 + 12) = 0x800000024A7E0480;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BD538);
  uint64_t v149 = swift_allocObject();
  *(_OWORD *)(v149 + 16) = xmmword_24A7DDD00;
  *(unsigned char *)(v149 + 32) = 1;
  *(_OWORD *)(v149 + 40) = xmmword_24A7DDD10;
  *(void *)(v149 + 56) = 0x800000024A7E0760;
  long long v150 = 0uLL;
  *(_OWORD *)(v149 + 64) = 0u;
  *(_OWORD *)(v149 + 80) = 0u;
  *(_OWORD *)(v149 + 96) = 0u;
  *(unsigned char *)(v149 + 112) = 0;
  *(void *)(v149 + 120) = 2;
  *(void *)(v149 + 128) = 0;
  *(void *)(v149 + 136) = 0;
  *(void *)(v149 + 144) = 0xD00000000000003ELL;
  *(void *)(v149 + 152) = 0x800000024A7DF360;
  *(void *)(v149 + 160) = 0xD00000000000001FLL;
  *(void *)(v149 + 168) = 0x800000024A7DF3A0;
  *(void *)(v149 + 176) = 0xD000000000000024;
  *(void *)(v149 + 184) = 0x800000024A7E07A0;
  *(unsigned char *)(v149 + 192) = 0;
  *(void *)(v149 + 200) = 0;
  *(void *)(v149 + 208) = 0;
  *(void *)(v149 + 216) = 0;
  *(void *)(v149 + 224) = 0xD00000000000003ELL;
  *(void *)(v149 + 232) = 0x800000024A7DF360;
  *(void *)(v149 + 240) = 0xD00000000000001FLL;
  *(void *)(v149 + 248) = 0x800000024A7DF3A0;
  *(void *)(v149 + 256) = 0xD00000000000004BLL;
  *(void *)(v149 + 264) = 0x800000024A7E07D0;
  *(unsigned char *)(v149 + 272) = 0;
  *(void *)(v149 + 280) = 0;
  *(void *)(v149 + 288) = 0;
  *(void *)(v149 + 296) = 0;
  *(void *)(v149 + 304) = 0xD00000000000003ELL;
  *(void *)(v149 + 312) = 0x800000024A7DF360;
  *(void *)(v149 + 320) = 0xD00000000000001FLL;
  *(void *)(v149 + 328) = 0x800000024A7DF3A0;
  *(void *)(v149 + 336) = 0xD000000000000047;
  *(void *)(v149 + 344) = 0x800000024A7E0820;
  *(unsigned char *)(v149 + 352) = 1;
  *(void *)(v149 + 360) = 0;
  *(void *)(v149 + 368) = 0xD000000000000034;
  *(void *)(v149 + 376) = 0x800000024A7E0870;
  *(_OWORD *)(v149 + 400) = 0u;
  *(_OWORD *)(v149 + 416) = 0u;
  *(_OWORD *)(v149 + 384) = 0u;
  *(unsigned char *)(v149 + 432) = 1;
  *(void *)(v149 + 440) = 0;
  *(void *)(v149 + 448) = 0xD000000000000035;
  *(void *)(v149 + 456) = 0x800000024A7E08B0;
  *(_OWORD *)(v149 + 464) = 0u;
  *(_OWORD *)(v149 + 480) = 0u;
  *(_OWORD *)(v149 + 496) = 0u;
  *(unsigned char *)(v149 + 512) = 1;
  *(void *)(v149 + 520) = 0;
  *(void *)(v149 + 528) = 0xD000000000000030;
  *(void *)(v149 + 536) = 0x800000024A7E08F0;
  *(_OWORD *)(v149 + 544) = 0u;
  *(_OWORD *)(v149 + 560) = 0u;
  *(_OWORD *)(v149 + 576) = 0u;
  *(unsigned char *)(v149 + 592) = 1;
  *(void *)(v149 + 600) = 0;
  *(void *)(v149 + 608) = 0xD00000000000003DLL;
  *(void *)(v149 + 616) = 0x800000024A7E0970;
  *(_OWORD *)(v149 + 640) = 0u;
  *(_OWORD *)(v149 + 656) = 0u;
  *(_OWORD *)(v149 + 624) = 0u;
  *(unsigned char *)(v149 + 672) = 1;
  *(void *)(v149 + 680) = 0;
  *(void *)(v149 + 688) = 0xD000000000000034;
  *(void *)(v149 + 696) = 0x800000024A7E0930;
  *(_OWORD *)(v149 + 720) = 0u;
  *(_OWORD *)(v149 + 736) = 0u;
  *(_OWORD *)(v149 + 704) = 0u;
  *(unsigned char *)(v149 + 752) = 1;
  *(void *)(v149 + 760) = 0;
  *(void *)(v149 + 768) = 0xD000000000000031;
  *(void *)(v149 + 776) = 0x800000024A7E09B0;
  *(_OWORD *)(v149 + 800) = 0u;
  *(_OWORD *)(v149 + 816) = 0u;
  unint64_t v152 = *(void *)(v149 + 16);
  unint64_t v151 = *(void *)(v149 + 24);
  *(_OWORD *)(v149 + 784) = 0u;
  if (v152 >= v151 >> 1)
  {
    v206 = sub_24A7CFE48((char *)(v151 > 1), v152 + 1, 1, (char *)v149);
    long long v150 = 0uLL;
    uint64_t v149 = (uint64_t)v206;
  }
  *(void *)(v149 + 16) = v152 + 1;
  uint64_t v153 = v149 + 80 * v152;
  *(unsigned char *)(v153 + 32) = 1;
  *(_OWORD *)(v153 + 40) = xmmword_24A7DDD20;
  *(void *)(v153 + 56) = 0x800000024A7E09F0;
  *(_OWORD *)(v153 + 64) = v150;
  *(_OWORD *)(v153 + 80) = v150;
  *(_OWORD *)(v153 + 96) = v150;
  v154 = (void *)qword_2697BEC68;
  v155 = (void *)sub_24A7DCA10();
  id v156 = objc_msgSend(v154, sel_localizedStringForKey_value_table_, v155, 0, 0);

  uint64_t v157 = sub_24A7DCA40();
  uint64_t v159 = v158;

  v160 = (void *)sub_24A7DCA10();
  id v161 = objc_msgSend(v241, sel_systemImageNamed_, v160);

  id v162 = objc_msgSend(v240, sel_systemBlueColor);
  unint64_t v163 = *((void *)v14 + 2);
  unint64_t v164 = *((void *)v14 + 3);
  swift_bridgeObjectRetain();
  id v212 = v161;
  id v211 = v162;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v163 >= v164 >> 1) {
    v14 = sub_24A7CFF60((char *)(v164 > 1), v163 + 1, 1, v14);
  }
  *((void *)v14 + 2) = v163 + 1;
  v165 = &v14[72 * v163];
  *((void *)v165 + 4) = v157;
  *((void *)v165 + 5) = v159;
  *((void *)v165 + 6) = v161;
  *((void *)v165 + 7) = v162;
  *((void *)v165 + 8) = v149;
  *((void *)v165 + 9) = 0;
  *((void *)v165 + 10) = 0;
  *((void *)v165 + 11) = 0xD000000000000015;
  *((void *)v165 + 12) = 0x800000024A7E0460;
  v166 = (void *)qword_2697BEC68;
  v167 = (void *)sub_24A7DCA10();
  id v168 = objc_msgSend(v166, sel_localizedStringForKey_value_table_, v167, 0, 0);

  uint64_t v208 = sub_24A7DCA40();
  uint64_t v170 = v169;

  v171 = (void *)sub_24A7DCA10();
  id v172 = objc_msgSend(v241, sel_systemImageNamed_, v171);

  id v173 = objc_msgSend(v240, sel_systemBlueColor);
  id v174 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
  id v175 = objc_msgSend(v174, sel_UUIDString);

  uint64_t v207 = sub_24A7DCA40();
  uint64_t v177 = v176;

  unint64_t v178 = *((void *)v14 + 2);
  unint64_t v179 = *((void *)v14 + 3);
  swift_bridgeObjectRetain();
  id v210 = v172;
  id v209 = v173;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v178 >= v179 >> 1) {
    v14 = sub_24A7CFF60((char *)(v179 > 1), v178 + 1, 1, v14);
  }
  *((void *)v14 + 2) = v178 + 1;
  v180 = &v14[72 * v178];
  *((void *)v180 + 4) = v208;
  *((void *)v180 + 5) = v170;
  *((void *)v180 + 6) = v172;
  *((void *)v180 + 7) = v173;
  *((void *)v180 + 8) = &unk_26FE47278;
  *((void *)v180 + 9) = 0;
  *((void *)v180 + 10) = 0;
  *((void *)v180 + 11) = v207;
  *((void *)v180 + 12) = v177;
  id v181 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
  id v182 = objc_msgSend(v181, sel_UUIDString);

  uint64_t v183 = sub_24A7DCA40();
  uint64_t v185 = v184;

  unint64_t v186 = *((void *)v14 + 2);
  unint64_t v187 = *((void *)v14 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v186 >= v187 >> 1) {
    v14 = sub_24A7CFF60((char *)(v187 > 1), v186 + 1, 1, v14);
  }
  *((void *)v14 + 2) = v186 + 1;
  v188 = &v14[72 * v186];
  *((_OWORD *)v188 + 2) = 0u;
  *((_OWORD *)v188 + 3) = 0u;
  *((void *)v188 + 8) = &unk_26FE45D18;
  *(_OWORD *)(v188 + 72) = xmmword_24A7DDD30;
  *((void *)v188 + 11) = v183;
  *((void *)v188 + 12) = v185;
  id v189 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
  id v190 = objc_msgSend(v189, sel_UUIDString);

  uint64_t v191 = sub_24A7DCA40();
  uint64_t v193 = v192;

  unint64_t v194 = *((void *)v14 + 2);
  unint64_t v195 = *((void *)v14 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v194 >= v195 >> 1) {
    v14 = sub_24A7CFF60((char *)(v195 > 1), v194 + 1, 1, v14);
  }
  *((void *)v14 + 2) = v194 + 1;
  v196 = &v14[72 * v194];
  *((_OWORD *)v196 + 2) = 0u;
  *((_OWORD *)v196 + 3) = 0u;
  *((void *)v196 + 8) = &unk_26FE45E28;
  *((void *)v196 + 9) = 0xD000000000000015;
  *((void *)v196 + 10) = 0x800000024A7DFE60;
  *((void *)v196 + 11) = v191;
  *((void *)v196 + 12) = v193;
  id v197 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
  id v198 = objc_msgSend(v197, sel_UUIDString);

  uint64_t v199 = sub_24A7DCA40();
  uint64_t v201 = v200;

  unint64_t v203 = *((void *)v14 + 2);
  unint64_t v202 = *((void *)v14 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v203 >= v202 >> 1) {
    v14 = sub_24A7CFF60((char *)(v202 > 1), v203 + 1, 1, v14);
  }
  *((void *)v14 + 2) = v203 + 1;
  v204 = &v14[72 * v203];
  *((_OWORD *)v204 + 2) = 0u;
  *((_OWORD *)v204 + 3) = 0u;
  *((void *)v204 + 8) = &unk_26FE45F88;
  *((void *)v204 + 9) = 0xD000000000000015;
  *((void *)v204 + 10) = 0x800000024A7DFFE0;
  *((void *)v204 + 11) = v199;
  *((void *)v204 + 12) = v201;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v14;
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

void type metadata accessor for CCUIGridSizeClassMask(uint64_t a1)
{
}

void type metadata accessor for SBIconLocation(uint64_t a1)
{
}

_DWORD *__swift_memcpy4_2(_DWORD *result, _DWORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_24A7C71C0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_24A7C71E0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)uint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 4) = v3;
  return result;
}

void type metadata accessor for SBHIconGridSize(uint64_t a1)
{
}

void type metadata accessor for SBHIconGridSizeClass(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for ControlsGalleryCustomControlsSectionCollection(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ControlsGalleryCustomControlsSectionCollection(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ControlsGalleryCustomControlsSectionCollection(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = (void *)a2[2];
  uint64_t v5 = (void *)a2[3];
  a1[2] = v4;
  a1[3] = v5;
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  id v8 = v4;
  id v9 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ControlsGalleryCustomControlsSectionCollection(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[2];
  uint64_t v5 = (void *)a2[2];
  a1[2] = v5;
  id v6 = v5;

  uint64_t v7 = (void *)a1[3];
  id v8 = (void *)a2[3];
  a1[3] = v8;
  id v9 = v8;

  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for ControlsGalleryCustomControlsSectionCollection(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  long long v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ControlsGalleryCustomControlsSectionCollection(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ControlsGalleryCustomControlsSectionCollection(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlsGalleryCustomControlsSectionCollection()
{
  return &type metadata for ControlsGalleryCustomControlsSectionCollection;
}

uint64_t destroy for ControlsGalleryCustomElement()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ControlsGalleryCustomElement(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ControlsGalleryCustomElement(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for ControlsGalleryCustomElement(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ControlsGalleryCustomElement(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 80)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ControlsGalleryCustomElement(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 80) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlsGalleryCustomElement()
{
  return &type metadata for ControlsGalleryCustomElement;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t sub_24A7C785C()
{
  return sub_24A7C78EC(&qword_2697BD568, type metadata accessor for SBHIconGridSizeClass);
}

uint64_t sub_24A7C78A4()
{
  return sub_24A7C78EC(&qword_2697BD570, type metadata accessor for SBHIconGridSizeClass);
}

uint64_t sub_24A7C78EC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A7C7934()
{
  return sub_24A7C78EC(&qword_2697BD578, type metadata accessor for SBIconLocation);
}

uint64_t sub_24A7C797C()
{
  return sub_24A7C78EC(&qword_2697BD580, type metadata accessor for SBIconLocation);
}

uint64_t sub_24A7C79C4()
{
  return sub_24A7C78EC(&qword_2697BD588, type metadata accessor for CCUIGridSizeClassMask);
}

uint64_t sub_24A7C7A0C()
{
  return sub_24A7C78EC(&qword_2697BD590, type metadata accessor for CCUIGridSizeClassMask);
}

uint64_t sub_24A7C7A54()
{
  return sub_24A7C78EC(&qword_2697BD598, type metadata accessor for CCUIGridSizeClassMask);
}

uint64_t sub_24A7C7A9C()
{
  return sub_24A7C78EC(&qword_2697BD5A0, type metadata accessor for CCUIGridSizeClassMask);
}

uint64_t sub_24A7C7AE4()
{
  return sub_24A7C78EC(&qword_2697BD5A8, type metadata accessor for SBIconLocation);
}

uint64_t sub_24A7C7B2C()
{
  return sub_24A7C78EC((unint64_t *)&unk_2697BD5B0, type metadata accessor for SBHIconGridSizeClass);
}

uint64_t sub_24A7C7B74(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  int v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

void type metadata accessor for CCUIGridSizeClass(uint64_t a1)
{
}

void sub_24A7C7BC0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id sub_24A7C7C40()
{
  _s2__CMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2697BEC68 = (uint64_t)result;
  return result;
}

uint64_t sub_24A7C7C98()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t _s2__CMa()
{
  return self;
}

uint64_t CCUISConfiguredControl.description.getter()
{
  uint64_t v1 = v0;
  sub_24A7DCC70();
  sub_24A7DCA60();
  id v2 = objc_msgSend(v0, sel_identity);
  id v3 = objc_msgSend(v2, sel_description);
  sub_24A7DCA40();

  sub_24A7DCA60();
  swift_bridgeObjectRelease();
  sub_24A7DCA60();
  objc_msgSend(v1, sel_type);
  sub_24A7DCB60();
  sub_24A7DCA60();
  swift_bridgeObjectRelease();
  sub_24A7DCA60();
  objc_msgSend(v1, sel_size);
  type metadata accessor for CHSControlSize(0);
  sub_24A7DCCF0();
  sub_24A7DCA60();
  return 0;
}

void __swiftcall CCUISConfiguredControl.init()(CCUISConfiguredControl *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void CCUISConfiguredControl.init()()
{
}

unint64_t type metadata accessor for CCUISConfiguredControl()
{
  unint64_t result = qword_2697BD8F8;
  if (!qword_2697BD8F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697BD8F8);
  }
  return result;
}

uint64_t CCUIModuleIconElement.moduleIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___CCUIModuleIconElement_moduleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CCUIModuleIconElement.containerBundleIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___CCUIModuleIconElement_containerBundleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

id CCUIModuleIconElement.standardSupportedGridSizeClasses.getter()
{
  return *(id *)(v0 + OBJC_IVAR___CCUIModuleIconElement_standardSupportedGridSizeClasses);
}

uint64_t CCUIModuleIconElement.expandsGridSizeClassesForAccessibility.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR___CCUIModuleIconElement_expandsGridSizeClassesForAccessibility);
}

id CCUIModuleIconElement.supportedGridSizeClasses.getter()
{
  return *(id *)(v0 + OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses);
}

id sub_24A7C8148()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CCUIModuleIconElement.uniqueIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___CCUIModuleIconElement_uniqueIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CCUIModuleIconElement.displayName.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___CCUIModuleIconElement_displayName);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t CCUIModuleIconElement.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR___CCUIModuleIconElement_displayName);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

void sub_24A7C83A0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_displayName);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_24A7DCA40();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_24A7C8408(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_24A7DCA10();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setDisplayName_);
}

uint64_t CCUIModuleIconElement.preferredGallerySizeClass.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___CCUIModuleIconElement_preferredGallerySizeClass;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t CCUIModuleIconElement.preferredGallerySizeClass.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___CCUIModuleIconElement_preferredGallerySizeClass);
  uint64_t result = swift_beginAccess();
  void *v3 = a1;
  return result;
}

void sub_24A7C85A0(char a1)
{
  if (objc_msgSend(v1, sel_expandsGridSizeClassesForAccessibility))
  {
    if (a1) {
      id v3 = *(id *)&v1[OBJC_IVAR___CCUIModuleIconElement_accessibilitySupportedGridSizeClasses];
    }
    else {
      id v3 = objc_msgSend(v1, sel_standardSupportedGridSizeClasses);
    }
    id v4 = *(void **)&v1[OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses];
    *(void *)&v1[OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses] = v3;

    id v5 = objc_msgSend(self, sel_sbh_leafIconDataSourceNotificationCenter);
    objc_msgSend(v5, sel_postNotificationName_object_, *MEMORY[0x263F79328], v1);
  }
}

id CCUIModuleIconElement.init(moduleIdentifier:containerBundleIdentifier:standardSupportedGridSizeClasses:expandsGridSizeClassesForAccessibility:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, char a6)
{
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v9 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  id v10 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v8, sel_initWithModuleIdentifier_containerBundleIdentifier_standardSupportedGridSizeClasses_expandsGridSizeClassesForAccessibility_, v9, v10, a5, a6 & 1);

  return v11;
}

id CCUIModuleIconElement.init(moduleIdentifier:containerBundleIdentifier:standardSupportedGridSizeClasses:expandsGridSizeClassesForAccessibility:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  HIDWORD(v16) = a6;
  uint64_t v7 = sub_24A7DC930();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A7DC920();
  sub_24A7DC910();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  id v11 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  uint64_t v13 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v17, sel_initWithUniqueIdentifier_moduleIdentifier_containerBundleIdentifier_standardSupportedGridSizeClasses_expandsGridSizeClassesForAccessibility_, v11, v12, v13, a5, BYTE4(v16) & 1);

  return v14;
}

id CCUIModuleIconElement.init(uniqueIdentifier:moduleIdentifier:containerBundleIdentifier:standardSupportedGridSizeClasses:expandsGridSizeClassesForAccessibility:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, char a8)
{
  id v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v11 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  uint64_t v13 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v10, sel_initWithUniqueIdentifier_moduleIdentifier_containerBundleIdentifier_standardSupportedGridSizeClasses_expandsGridSizeClassesForAccessibility_, v11, v12, v13, a7, a8 & 1);

  return v14;
}

{
  id v9;

  uint64_t v9 = sub_24A7CA660(a1, a2, a3, a4, a5, a6, a7, a8);

  return v9;
}

void sub_24A7C8BF0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = SBHIconGridSizeClassForCCUIGridSizeClass(a1);
  LODWORD(a2) = objc_msgSend(a2, sel_containsGridSizeClass_, v6);

  if (a2)
  {
    uint64_t v7 = (void *)(a3 + 16);
    uint64_t v8 = CCUIAdjustGridSizeClassForAccessibility(a1, 1);
    uint64_t v9 = CCUIGridSizeClassMaskForGridSizeClass(v8);
    swift_beginAccess();
    if ((v9 & ~*v7) != 0) {
      *v7 |= v9;
    }
  }
}

uint64_t CCUIModuleIconElement.priority(for:)()
{
  return 1;
}

uint64_t CCUIModuleIconElement.icon(_:displayNameForLocation:)()
{
  id v1 = objc_msgSend(v0, sel_displayName);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_24A7DCA40();

  return v3;
}

id CCUIModuleIconElement.supportedGridSizeClasses(for:)()
{
  id v1 = objc_msgSend(v0, sel_supportedGridSizeClasses);
  return v1;
}

char *CCUIModuleIconElement.copyWithUniqueIdentifier()()
{
  swift_getObjectType();
  id v1 = objc_msgSend(v0, sel_moduleIdentifier);
  sub_24A7DCA40();

  id v2 = objc_msgSend(v0, sel_containerBundleIdentifier);
  sub_24A7DCA40();

  id v3 = objc_msgSend(v0, sel_standardSupportedGridSizeClasses);
  id v4 = objc_msgSend(v0, sel_expandsGridSizeClassesForAccessibility);
  id v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v6 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  uint64_t v8 = (char *)objc_msgSend(v5, sel_initWithModuleIdentifier_containerBundleIdentifier_standardSupportedGridSizeClasses_expandsGridSizeClassesForAccessibility_, v6, v7, v3, v4);

  id v9 = objc_msgSend(v0, sel_displayName);
  objc_msgSend(v8, sel_setDisplayName_, v9);

  objc_msgSend(v8, sel_setPreferredGallerySizeClass_, objc_msgSend(v0, sel_preferredGallerySizeClass));
  id v10 = *(void **)&v0[OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses];
  id v11 = *(void **)&v8[OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses];
  *(void *)&v8[OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses] = v10;
  id v12 = v10;

  return v8;
}

unint64_t CCUIModuleIconElement.hash.getter()
{
  id v1 = v0;
  id v2 = objc_msgSend(v0, sel_uniqueIdentifier);
  uint64_t v3 = sub_24A7DCA40();
  uint64_t v5 = v4;

  uint64_t v20 = v3;
  sub_24A7CA890();
  uint64_t v6 = sub_24A7DCC10();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v1, sel_moduleIdentifier, v20, v5);
  uint64_t v8 = sub_24A7DCA40();
  uint64_t v10 = v9;

  uint64_t v21 = v8;
  uint64_t v11 = sub_24A7DCC10();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v1, sel_containerBundleIdentifier, v21, v10);
  uint64_t v13 = sub_24A7DCA40();
  uint64_t v15 = v14;

  uint64_t v16 = sub_24A7DCC10();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v1, sel_standardSupportedGridSizeClasses, v13, v15);
  unint64_t v18 = (unint64_t)objc_msgSend(v17, sel_hash);

  return v11 ^ v6 ^ v16 ^ v18 ^ objc_msgSend(v1, sel_expandsGridSizeClassesForAccessibility);
}

uint64_t CCUIModuleIconElement.isEqual(_:)(uint64_t a1)
{
  id v2 = v1;
  uint64_t v3 = sub_24A7CA8E4(a1, (uint64_t)v38);
  if (v39)
  {
    type metadata accessor for CCUIModuleIconElement(v3);
    if (swift_dynamicCast())
    {
      if (v37 == v1)
      {

        return 1;
      }
      id v4 = objc_msgSend(v1, sel_uniqueIdentifier);
      uint64_t v5 = sub_24A7DCA40();
      uint64_t v7 = v6;

      id v8 = objc_msgSend(v37, sel_uniqueIdentifier);
      uint64_t v9 = sub_24A7DCA40();
      uint64_t v11 = v10;

      if (v5 == v9 && v7 == v11)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v13 = sub_24A7DCD80();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v13 & 1) == 0) {
          goto LABEL_20;
        }
      }
      id v14 = objc_msgSend(v2, sel_moduleIdentifier);
      uint64_t v15 = sub_24A7DCA40();
      uint64_t v17 = v16;

      id v18 = objc_msgSend(v37, sel_moduleIdentifier);
      uint64_t v19 = sub_24A7DCA40();
      uint64_t v21 = v20;

      if (v15 == v19 && v17 == v21)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v22 = sub_24A7DCD80();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v22 & 1) == 0) {
          goto LABEL_20;
        }
      }
      id v23 = objc_msgSend(v2, sel_containerBundleIdentifier);
      uint64_t v24 = sub_24A7DCA40();
      uint64_t v26 = v25;

      id v27 = objc_msgSend(v37, sel_containerBundleIdentifier);
      uint64_t v28 = sub_24A7DCA40();
      uint64_t v30 = v29;

      if (v24 == v28 && v26 == v30)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_18;
      }
      char v31 = sub_24A7DCD80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v31)
      {
LABEL_18:
        sub_24A7CAA58(0, (unint64_t *)&unk_2697BD940);
        id v32 = objc_msgSend(v2, sel_standardSupportedGridSizeClasses);
        id v33 = objc_msgSend(v37, sel_standardSupportedGridSizeClasses);
        char v34 = sub_24A7DCBE0();

        if (v34)
        {
          unsigned int v35 = objc_msgSend(v2, sel_expandsGridSizeClassesForAccessibility);
          unsigned int v36 = objc_msgSend(v37, sel_expandsGridSizeClassesForAccessibility);

          return v35 ^ v36 ^ 1;
        }
      }
LABEL_20:
    }
  }
  else
  {
    sub_24A7CA94C((uint64_t)v38);
  }
  return 0;
}

uint64_t CCUIModuleIconElement.description.getter()
{
  id v1 = objc_msgSend(self, sel_descriptionForRootObject_, v0);
  uint64_t v2 = sub_24A7DCA40();

  return v2;
}

id sub_24A7C974C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = swift_getObjectType();
  id v3 = objc_msgSend(v1, sel_uniqueIdentifier);
  sub_24A7DCA40();

  id v4 = objc_msgSend(v1, sel_moduleIdentifier);
  sub_24A7DCA40();

  id v5 = objc_msgSend(v1, sel_containerBundleIdentifier);
  sub_24A7DCA40();

  id v6 = objc_msgSend(v1, sel_standardSupportedGridSizeClasses);
  id v7 = objc_msgSend(v1, sel_expandsGridSizeClassesForAccessibility);
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v9 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(v8, sel_initWithUniqueIdentifier_moduleIdentifier_containerBundleIdentifier_standardSupportedGridSizeClasses_expandsGridSizeClassesForAccessibility_, v9, v10, v11, v6, v7);

  id v13 = objc_msgSend(v2, sel_displayName);
  objc_msgSend(v12, sel_setDisplayName_, v13);

  id result = objc_msgSend(v12, sel_setPreferredGallerySizeClass_, objc_msgSend(v2, sel_preferredGallerySizeClass));
  a1[3] = ObjectType;
  *a1 = v12;
  return result;
}

uint64_t CCUIModuleIconElement.appendDescription(to:)(void *a1)
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_24A7CAA00;
  *(void *)(v4 + 24) = v3;
  v9[4] = sub_24A7CAA18;
  v9[5] = v4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_24A7C9F28;
  v9[3] = &block_descriptor;
  id v5 = _Block_copy(v9);
  id v6 = a1;
  id v7 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_appendProem_block_, v7, v5);
  _Block_release(v5);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v7) {
    __break(1u);
  }
  return result;
}

uint64_t sub_24A7C9B14(void *a1, void *a2)
{
  uint64_t result = (uint64_t)objc_msgSend(a1, sel_hasSuccinctStyle);
  if ((result & 1) == 0)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = a1;
    *(void *)(v5 + 24) = a2;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = sub_24A7CAB90;
    *(void *)(v6 + 24) = v5;
    v11[4] = sub_24A7CAC00;
    v11[5] = v6;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1107296256;
    v11[2] = sub_24A7C9F28;
    v11[3] = &block_descriptor_17;
    id v7 = _Block_copy(v11);
    id v8 = a1;
    id v9 = a2;
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_appendBodySectionWithName_block_, 0, v7);
    _Block_release(v7);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
  }
  return result;
}

void sub_24A7C9C88(void *a1, id a2)
{
  id v4 = objc_msgSend(a2, sel_moduleIdentifier);
  if (!v4)
  {
    sub_24A7DCA40();
    id v4 = (id)sub_24A7DCA10();
    swift_bridgeObjectRelease();
  }
  uint64_t v5 = (void *)sub_24A7DCA10();
  objc_msgSend(a1, sel_appendString_withName_, v4, v5);

  id v6 = objc_msgSend(a2, sel_containerBundleIdentifier);
  if (!v6)
  {
    sub_24A7DCA40();
    id v6 = (id)sub_24A7DCA10();
    swift_bridgeObjectRelease();
  }
  id v7 = (void *)sub_24A7DCA10();
  objc_msgSend(a1, sel_appendString_withName_, v6, v7);

  id v8 = objc_msgSend(a2, sel_supportedGridSizeClasses);
  id v9 = (void *)sub_24A7DCA10();

  id v10 = objc_msgSend(a2, sel_uniqueIdentifier);
  if (!v10)
  {
    sub_24A7DCA40();
    id v10 = (id)sub_24A7DCA10();
    swift_bridgeObjectRelease();
  }
  uint64_t v11 = (void *)sub_24A7DCA10();
  objc_msgSend(a1, sel_appendString_withName_, v10, v11);

  id v12 = objc_msgSend(a2, sel_displayName);
  id v13 = (id)sub_24A7DCA10();
  objc_msgSend(a1, sel_appendString_withName_skipIfEmpty_, v12, v13, 1);
}

uint64_t sub_24A7C9F00(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24A7C9F28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void __swiftcall CCUIModuleIconElement.init()(CCUIModuleIconElement *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void CCUIModuleIconElement.init()()
{
}

unint64_t CCUIModuleIconElement.sbh_galleryItemIdentifier.getter()
{
  sub_24A7DCC70();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend(v0, sel_uniqueIdentifier);
  sub_24A7DCA40();

  sub_24A7DCA60();
  swift_bridgeObjectRelease();
  return 0xD00000000000001DLL;
}

uint64_t CCUIModuleIconElement.sbh_appName.getter()
{
  sub_24A7CAA58(0, (unint64_t *)&unk_2697BDD20);
  id v1 = objc_msgSend(v0, sel_containerBundleIdentifier);
  uint64_t v2 = sub_24A7DCA40();
  uint64_t v4 = v3;

  id v5 = sub_24A7CA3A8(v2, v4, 1);
  id v9 = v5;
  if (v5)
  {
    id v7 = objc_msgSend(v5, sel_localizedName);
    uint64_t v8 = sub_24A7DCA40();
  }
  else
  {
    id v6 = objc_msgSend(v0, sel_sbh_widgetName);
    if (!v6) {
      return 0;
    }
    id v7 = v6;
    uint64_t v8 = sub_24A7DCA40();
  }

  return v8;
}

id sub_24A7CA3A8(uint64_t a1, uint64_t a2, char a3)
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  v9[0] = 0;
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordWithBundleIdentifier_allowPlaceholder_error_, v4, a3 & 1, v9);

  if (v5)
  {
    id v6 = v9[0];
  }
  else
  {
    id v7 = v9[0];
    sub_24A7DC900();

    swift_willThrow();
  }
  return v5;
}

uint64_t CCUIModuleIconElement.sbh_widgetName.getter()
{
  id v1 = objc_msgSend(v0, sel_displayName);
  if (!v1) {
    id v1 = objc_msgSend(v0, sel_moduleIdentifier);
  }
  uint64_t v2 = sub_24A7DCA40();

  return v2;
}

uint64_t CCUIModuleIconElement.sbh_supportedSizeClasses.getter()
{
  return 0;
}

uint64_t CCUIModuleIconElement.sbh_widgetDescription.getter()
{
  return 0;
}

uint64_t CCUIModuleIconElement.sbh_canBeAddedToStack.getter()
{
  return 0;
}

uint64_t CCUIModuleIconElement.sbh_supportsRemovableBackground.getter()
{
  return 0;
}

uint64_t CCUIModuleIconElement.sbh_supportsRemovableBackgroundOrAccessoryFamilies.getter()
{
  return 0;
}

uint64_t CCUIModuleIconElement.backgroundColor.getter()
{
  return 0;
}

uint64_t CCUIModuleIconElement.accentColor.getter()
{
  return 0;
}

uint64_t CCUIModuleIconElement.mostInterestingColor.getter()
{
  return 0;
}

uint64_t CCUIModuleIconElement.sbh_favoredSizeClasses(for:)()
{
  return 0;
}

uint64_t CCUIModuleIconElement.sbh_isLinkedOnOr(after:)()
{
  return 1;
}

id sub_24A7CA660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, char a8)
{
  uint64_t v11 = &v8[OBJC_IVAR___CCUIModuleIconElement_displayName];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *(void *)&v8[OBJC_IVAR___CCUIModuleIconElement_preferredGallerySizeClass] = 0;
  id v12 = &v8[OBJC_IVAR___CCUIModuleIconElement_uniqueIdentifier];
  *(void *)id v12 = a1;
  *((void *)v12 + 1) = a2;
  id v13 = &v8[OBJC_IVAR___CCUIModuleIconElement_moduleIdentifier];
  *(void *)id v13 = a3;
  *((void *)v13 + 1) = a4;
  id v14 = &v8[OBJC_IVAR___CCUIModuleIconElement_containerBundleIdentifier];
  *(void *)id v14 = a5;
  *((void *)v14 + 1) = a6;
  *(void *)&v8[OBJC_IVAR___CCUIModuleIconElement_standardSupportedGridSizeClasses] = a7;
  if (a8)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = 0;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = a7;
    *(void *)(v16 + 24) = v15;
    v25[4] = sub_24A7CABF8;
    v25[5] = v16;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 1107296256;
    v25[2] = sub_24A7D02F0;
    v25[3] = &block_descriptor_26;
    uint64_t v17 = (void (**)(id, uint64_t))_Block_copy(v25);
    id v18 = a7;
    uint64_t v19 = v8;
    swift_retain();
    swift_release();
    CCUIEnumerateGridSizeClassesWithBlock(v17);
    _Block_release(v17);
    swift_beginAccess();
    id v20 = SBHIconGridSizeClassSetForCCUIGridSizeClassMask(*(void *)(v15 + 16));
    *(void *)&v19[OBJC_IVAR___CCUIModuleIconElement_accessibilitySupportedGridSizeClasses] = v20;
    id v21 = objc_msgSend(v18, sel_gridSizeClassSetByUnioningWithGridSizeClassSet_, v20);
    *(void *)&v19[OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses] = v21;
    swift_release();
  }
  else
  {
    *(void *)&v8[OBJC_IVAR___CCUIModuleIconElement_accessibilitySupportedGridSizeClasses] = a7;
    *(void *)&v8[OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses] = a7;
    id v22 = a7;
    id v23 = v8;
  }
  v8[OBJC_IVAR___CCUIModuleIconElement_expandsGridSizeClassesForAccessibility] = a8 & 1;

  v26.receiver = v8;
  v26.super_class = (Class)CCUIModuleIconElement;
  return objc_msgSendSuper2(&v26, sel_init);
}

unint64_t sub_24A7CA890()
{
  unint64_t result = qword_26B17BA10;
  if (!qword_26B17BA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B17BA10);
  }
  return result;
}

uint64_t sub_24A7CA8E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17B9D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A7CA94C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17B9D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for CCUIModuleIconElement(uint64_t a1)
{
  return sub_24A7CAA58(a1, qword_26B17BA30);
}

uint64_t sub_24A7CA9C0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A7CAA00()
{
  return sub_24A7C9B14(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_24A7CAA08()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A7CAA18()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_24A7CAA58(uint64_t a1, unint64_t *a2)
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

char *keypath_get_selector_displayName()
{
  return sel_displayName;
}

char *keypath_get_selector_preferredGallerySizeClass()
{
  return sel_preferredGallerySizeClass;
}

id sub_24A7CAAB4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_preferredGallerySizeClass);
  *a2 = result;
  return result;
}

id sub_24A7CAAE8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPreferredGallerySizeClass_, *a1);
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
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

void sub_24A7CAB90()
{
  sub_24A7C9C88(*(void **)(v0 + 16), *(id *)(v0 + 24));
}

uint64_t sub_24A7CAB98()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A7CABA8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A7CABB8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24A7CABF8(uint64_t a1)
{
  sub_24A7C8BF0(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t CCUISControlsGalleryResult.description.getter()
{
  uint64_t v1 = v0;
  sub_24A7DCC70();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_control);
  id v3 = objc_msgSend(v2, sel_description);
  sub_24A7DCA40();

  sub_24A7DCA60();
  swift_bridgeObjectRelease();
  sub_24A7DCA60();
  objc_msgSend(v1, sel_promptsForUserConfiguration);
  sub_24A7DCA60();
  swift_bridgeObjectRelease();
  sub_24A7DCA60();
  return 0x6C6F72746E6F6328;
}

void __swiftcall CCUISControlsGalleryResult.init()(CCUISControlsGalleryResult *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void CCUISControlsGalleryResult.init()()
{
}

unint64_t type metadata accessor for CCUISControlsGalleryResult()
{
  unint64_t result = qword_2697BDAF0;
  if (!qword_2697BDAF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697BDAF0);
  }
  return result;
}

uint64_t sub_24A7CAF3C()
{
  uint64_t v0 = sub_24A7DC980();
  __swift_allocate_value_buffer(v0, qword_26B17B980);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B17B980);
  uint64_t result = *MEMORY[0x263F33C58];
  if (*MEMORY[0x263F33C58])
  {
    sub_24A7DCA70();
    return sub_24A7DC970();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static Logger.controlServices.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B17B998 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24A7DC980();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B17B980);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

void sub_24A7CB180()
{
  id v1 = v0;
  v17.receiver = v0;
  v17.super_class = (Class)type metadata accessor for ControlContainerViewController();
  objc_msgSendSuper2(&v17, sel_viewDidLoad);
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_controlViewController];
  objc_msgSend(v0, sel_bs_addChildViewController_, v2);
  id v3 = objc_msgSend(v2, sel_view);
  if (!v3)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v4 = v3;
  id v5 = objc_msgSend(v1, sel_view);
  if (!v5)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  id v6 = v5;
  objc_msgSend(v5, sel_bounds);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
  id v15 = objc_msgSend(v2, sel_view);
  if (v15)
  {
    uint64_t v16 = v15;
    objc_msgSend(v15, sel_setAutoresizingMask_, 18);

    return;
  }
LABEL_7:
  __break(1u);
}

id sub_24A7CB41C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ControlContainerViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ControlContainerViewController()
{
  return self;
}

char *sub_24A7CB484(void *a1)
{
  sub_24A7DC9A0();
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR___CCUISControlsGalleryViewController_selectedControl] = 0;
  *(void *)&v1[OBJC_IVAR___CCUISControlsGalleryViewController_addWidgetSheetViewController] = 0;
  *(void *)&v1[OBJC_IVAR___CCUISControlsGalleryViewController_galleryManager] = 0;
  swift_unknownObjectWeakInit();
  if (a1)
  {
    id v5 = v1;
    objc_msgSend(a1, sel_copy);
    sub_24A7DCC20();
    swift_unknownObjectRelease();
    type metadata accessor for CCUISControlsGalleryConfiguration(0);
    if (swift_dynamicCast())
    {
      id v6 = (id)v19[1];
      goto LABEL_6;
    }
  }
  else
  {
    double v7 = v1;
  }
  id v6 = objc_msgSend(objc_allocWithZone((Class)CCUISControlsGalleryConfiguration), sel_init);
LABEL_6:
  *(void *)&v1[OBJC_IVAR___CCUISControlsGalleryViewController_configuration] = v6;

  v20.receiver = v1;
  v20.super_class = (Class)CCUISControlsGalleryViewController;
  id v8 = objc_msgSendSuper2(&v20, sel_initWithNibName_bundle_, 0, 0);
  objc_allocWithZone((Class)type metadata accessor for ControlsGalleryManager());
  double v9 = (char *)v8;
  double v10 = sub_24A7D30A4(v9);
  double v11 = *(void **)&v9[OBJC_IVAR___CCUISControlsGalleryViewController_galleryManager];
  *(void *)&v9[OBJC_IVAR___CCUISControlsGalleryViewController_galleryManager] = v10;

  id v12 = objc_msgSend(v9, sel_sheetPresentationController);
  if (v12)
  {
    double v13 = v12;
    sub_24A7DCBD0();
    id v14 = objc_msgSend(v9, sel_traitCollection);
    id v15 = objc_msgSend(v14, sel_userInterfaceIdiom);

    objc_msgSend(v13, sel_setPrefersGrabberVisible_, v15 == 0);
    objc_msgSend(v13, sel__setShouldDismissWhenTappedOutside_, 1);
    id v16 = v13;
    MEMORY[0x24C5D09A0]();
    sub_24A7DC990();
    MEMORY[0x24C5D09B0](v4);
  }
  objc_super v17 = v9;
  sub_24A7CB738();
  objc_msgSend(v17, sel_setPreferredContentSize_);

  return v17;
}

void sub_24A7CB738()
{
  id v1 = objc_msgSend(v0, sel_traitCollection);
  id v2 = objc_msgSend(v1, sel_userInterfaceIdiom);

  if (v2 == (id)1)
  {
    CCUIReferenceScreenBounds();
    CGRectGetWidth(v5);
    CCUIScreenSafeAreaInsets();
    id v3 = objc_msgSend(self, sel_currentDevice);
    id v4 = objc_msgSend(v3, sel_userInterfaceIdiom);

    if (v4 != (id)1)
    {
      CCUIReferenceScreenBounds();
      CGRectGetWidth(v6);
    }
  }
}

void __swiftcall CCUISControlsGalleryViewController.init(coder:)(CCUISControlsGalleryViewController_optional *__return_ptr retstr, NSCoder coder)
{
}

Swift::Void __swiftcall CCUISControlsGalleryViewController.viewDidLoad()()
{
  id v1 = v0;
  v23.super_class = (Class)CCUISControlsGalleryViewController;
  objc_msgSendSuper2(&v23, sel_viewDidLoad);
  objc_msgSend(v0, sel_setOverrideUserInterfaceStyle_, 2);
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F791B8]), sel_init);
  if (qword_2697BD3E0 != -1) {
    swift_once();
  }
  id v3 = (void *)qword_2697BEC68;
  id v4 = (void *)sub_24A7DCA10();
  id v5 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, 0);

  sub_24A7DCA40();
  CGRect v6 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setSearchPlaceholderText_, v6);

  id v7 = objc_msgSend(self, sel_labelColor);
  objc_msgSend(v2, sel_setSearchTintColor_, v7);

  objc_msgSend(v2, sel_setBackgroundMaterial_, 1);
  objc_msgSend(v2, sel_setApplicationCellIncludesGalleryListView_, 1);
  objc_msgSend(v2, sel_setContentContainsInteractiveUIControls_, 1);
  id v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ControlsGalleryIconListLayoutProvider()), sel_init);
  objc_msgSend(v2, sel_setListLayoutProvider_, v8);

  uint64_t v9 = OBJC_IVAR___CCUISControlsGalleryViewController_galleryManager;
  uint64_t v10 = *(void *)&v1[OBJC_IVAR___CCUISControlsGalleryViewController_galleryManager];
  if (!v10)
  {
    __break(1u);
    goto LABEL_12;
  }
  objc_msgSend(v2, sel_setIconViewProvider_, *(void *)(v10 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_iconViewProvider));
  id v11 = objc_msgSend(self, sel_controlCenterDomain);
  objc_msgSend(v2, sel_setGridSizeClassDomain_, v11);

  id v12 = SBHIconGridSizeClassForCCUIGridSizeClass(3);
  objc_msgSend(v2, sel_setGridSizeClassForContentWidth_, v12);

  objc_msgSend(v2, sel_setWantsCustomApplicationsSection_, 1);
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F791C8]), sel_initWithConfiguration_, v2);
  objc_msgSend(v13, sel_setOverrideUserInterfaceStyle_, 2);
  objc_msgSend(v13, sel_setDelegate_, *(void *)&v1[v9]);
  id v14 = v13;
  id v15 = objc_msgSend(v1, sel_traitCollection);
  id v16 = objc_msgSend(v15, sel_userInterfaceIdiom);

  objc_msgSend(v14, sel_setWantsBottomAttachedPresentation_, v16 == 0);
  objc_msgSend(v1, sel_bs_addChildViewController_, v14);
  objc_super v17 = *(void **)&v1[v9];
  if (!v17)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  id v18 = v17;
  sub_24A7D3644();

  uint64_t v19 = *(void *)&v1[v9];
  if (!v19)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    return;
  }
  if (*(void *)(v19 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_applicationControlCollections))
  {
    sub_24A7CAA58(0, &qword_2697BDBF0);
    swift_bridgeObjectRetain();
    objc_super v20 = (void *)sub_24A7DCAC0();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_setApplicationWidgetCollections_, v20);

    uint64_t v19 = *(void *)&v1[v9];
    if (!v19) {
      goto LABEL_14;
    }
  }
  if (*(void *)(v19
                 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_galleryApplicationControlCollections))
  {
    sub_24A7CAA58(0, &qword_2697BDBF0);
    swift_bridgeObjectRetain();
    id v21 = (void *)sub_24A7DCAC0();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_setCustomApplicationWidgetCollections_, v21);
  }
  id v22 = *(void **)&v1[OBJC_IVAR___CCUISControlsGalleryViewController_addWidgetSheetViewController];
  *(void *)&v1[OBJC_IVAR___CCUISControlsGalleryViewController_addWidgetSheetViewController] = v14;
}

Swift::Void __swiftcall CCUISControlsGalleryViewController.viewWillAppear(_:)(Swift::Bool a1)
{
}

Swift::Void __swiftcall CCUISControlsGalleryViewController.viewIsAppearing(_:)(Swift::Bool a1)
{
  v3.super_class = (Class)CCUISControlsGalleryViewController;
  objc_msgSendSuper2(&v3, sel_viewIsAppearing_, a1);
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F31E28]), sel_init);
  id v2 = (void *)sub_24A7DCA10();
  objc_msgSend(v1, sel_userEnteredAddGalleryForHost_, v2);
}

Swift::Void __swiftcall CCUISControlsGalleryViewController.viewDidAppear(_:)(Swift::Bool a1)
{
}

Swift::Void __swiftcall CCUISControlsGalleryViewController.viewWillDisappear(_:)(Swift::Bool a1)
{
}

Swift::Void __swiftcall CCUISControlsGalleryViewController.viewDidDisappear(_:)(Swift::Bool a1)
{
}

id sub_24A7CC028(char a1, SEL *a2, SEL *a3)
{
  CGRect v6 = v3;
  id v8 = objc_msgSend(v6, sel_delegate);
  if (v8)
  {
    uint64_t v9 = v8;
    if (objc_msgSend(v8, sel_respondsToSelector_, *a2)) {
      objc_msgSend(v9, *a2, v6);
    }
    swift_unknownObjectRelease();
  }
  v11.receiver = v6;
  v11.super_class = (Class)CCUISControlsGalleryViewController;
  return objc_msgSendSuper2(&v11, *a3, a1 & 1);
}

void sub_24A7CC0E8(void *a1, uint64_t a2, uint64_t a3, SEL *a4, SEL *a5)
{
  id v8 = a1;
  id v9 = objc_msgSend(v8, sel_delegate);
  if (v9)
  {
    uint64_t v10 = v9;
    if (objc_msgSend(v9, sel_respondsToSelector_, *a4)) {
      objc_msgSend(v10, *a4, v8);
    }
    swift_unknownObjectRelease();
  }
  v11.receiver = v8;
  v11.super_class = (Class)CCUISControlsGalleryViewController;
  objc_msgSendSuper2(&v11, *a5, a3);
}

Swift::Void __swiftcall CCUISControlsGalleryViewController.viewWillLayoutSubviews()()
{
  v14.super_class = (Class)CCUISControlsGalleryViewController;
  objc_msgSendSuper2(&v14, sel_viewWillLayoutSubviews);
  id v1 = *(void **)&v0[OBJC_IVAR___CCUISControlsGalleryViewController_addWidgetSheetViewController];
  if (!v1)
  {
    __break(1u);
    goto LABEL_6;
  }
  id v2 = objc_msgSend(v1, sel_view);
  if (!v2)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  objc_super v3 = v2;
  id v4 = objc_msgSend(v0, sel_view);
  if (v4)
  {
    id v5 = v4;
    objc_msgSend(v4, sel_bounds);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
    return;
  }
LABEL_7:
  __break(1u);
}

void __swiftcall CCUISControlsGalleryViewController.init(nibName:bundle:)(CCUISControlsGalleryViewController *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    id v4 = (void *)sub_24A7DCA10();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);
}

void CCUISControlsGalleryViewController.init(nibName:bundle:)()
{
}

void _sSo34CCUISControlsGalleryViewControllerC23ControlCenterUIServicesE5coderABSgSo7NSCoderC_tcfc_0()
{
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR___CCUISControlsGalleryViewController_selectedControl] = 0;
  *(void *)&v0[OBJC_IVAR___CCUISControlsGalleryViewController_addWidgetSheetViewController] = 0;
  *(void *)&v0[OBJC_IVAR___CCUISControlsGalleryViewController_galleryManager] = 0;
  swift_unknownObjectWeakInit();

  sub_24A7DCD00();
  __break(1u);
}

uint64_t type metadata accessor for CCUISControlsGalleryViewController(uint64_t a1)
{
  return sub_24A7CAA58(a1, (unint64_t *)&unk_2697BDC18);
}

uint64_t sub_24A7CC544(uint64_t a1)
{
  return a1;
}

uint64_t CCUIGridSizeClass.init(controlSize:)(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return 0;
  }
  else {
    return qword_24A7DE4F0[a1 - 1];
  }
}

id sub_24A7CC590()
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ControlsGalleryIconListLayout()), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDC78);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A7DE510;
  objc_super v3 = (void *)*MEMORY[0x263F79320];
  *(void *)(inited + 32) = *MEMORY[0x263F79320];
  *(void *)(inited + 40) = v1;
  id v4 = v3;
  id v5 = v1;
  sub_24A7D2D34(inited);
  type metadata accessor for SBIconLocation(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDC68);
  sub_24A7CE2D0(&qword_2697BDC70, type metadata accessor for SBIconLocation);
  double v6 = (void *)sub_24A7DC9B0();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v0, sel_initWithListLayouts_, v6);

  return v7;
}

id sub_24A7CC7E8()
{
  return sub_24A7CD16C(type metadata accessor for ControlsGalleryIconListLayoutProvider);
}

uint64_t type metadata accessor for ControlsGalleryIconListLayoutProvider()
{
  return self;
}

uint64_t sub_24A7CC8F4(void *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4, uint64_t a5)
{
  id v7 = (uint64_t *)(a5 + 16);
  CCUIGridSizeClassForSBHIconGridSizeClass(a1, 1);
  int v8 = CCUINumberOfColumnsForGridSizeClass();
  int v9 = CCUINumberOfRowsForGridSizeClass();
  unsigned int v10 = a3(v8 | (v9 << 16));
  double v11 = self;
  id v12 = a1;
  id v13 = objc_msgSend(v11, sel_sbh_valueWithSBHIconGridSize_, v10);
  swift_beginAccess();
  if (v13)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v7;
    uint64_t *v7 = 0x8000000000000000;
    sub_24A7CDB10((uint64_t)v13, v12, isUniquelyReferenced_nonNull_native);
    uint64_t *v7 = v17;

    swift_bridgeObjectRelease();
  }
  else
  {
    id v15 = (void *)sub_24A7CD214((uint64_t)v12);
  }
  return swift_endAccess();
}

void sub_24A7CCA24(uint64_t a1, void *a2)
{
  objc_super v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_24A7CCB84(uint64_t result)
{
  double v1 = ceil((double)(unsigned __int16)result * 0.5);
  double v2 = v1 + v1;
  if ((~*(void *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v2 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v2 < 65536.0) {
    return result & 0xFFFF0000 | (int)v2;
  }
LABEL_7:
  __break(1u);
  return result;
}

double sub_24A7CCC74(void *a1)
{
  id v3 = objc_msgSend(self, sel_controlCenterDomain);
  id v4 = objc_msgSend(v3, sel_allNonDefaultGridSizeClasses);

  LOBYTE(v3) = objc_msgSend(v4, sel_containsGridSizeClass_, a1);
  if (v3)
  {
    sub_24A7CCF18();
    double v6 = v5;
    double v8 = v7;
    unsigned __int16 v9 = (unsigned __int16)objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout_realIconGridSizeClassSizes), sel_gridSizeForGridSizeClass_, a1);
    double v10 = v6 * (double)v9 + v8 * ((double)v9 + -1.0);
    CCUIGridSizeClassForSBHIconGridSizeClass(a1, 1);
    CCUICompactModuleContinuousCornerRadiusForGridSizeClass();
    sub_24A7CCE94();
  }
  else
  {
    id v11 = sub_24A7CCFE8();
    if (objc_msgSend(v11, sel_respondsToSelector_, sel_iconImageInfoForGridSizeClass_))
    {
      objc_msgSend(v11, sel_iconImageInfoForGridSizeClass_, a1);
    }
    else
    {
      swift_unknownObjectRelease();
      objc_msgSend(sub_24A7CCFE8(), sel_iconImageInfo);
    }
    double v10 = v12;
    swift_unknownObjectRelease();
  }
  return v10;
}

double sub_24A7CCE94()
{
  uint64_t v1 = (unsigned char *)(v0
               + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___displayScale);
  if ((v1[8] & 1) == 0) {
    return *(double *)v1;
  }
  id v2 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v2, sel_scale);
  double v4 = v3;

  *(double *)uint64_t v1 = v4;
  v1[8] = 0;
  return v4;
}

void sub_24A7CCF18()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___gridGeometryInfo;
  if ((*(unsigned char *)(v0
                 + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___gridGeometryInfo
                 + 16) & 1) != 0)
  {
    id v2 = objc_msgSend(self, sel_currentDevice);
    id v3 = objc_msgSend(v2, sel_userInterfaceIdiom);

    if (v3 != (id)1)
    {
      CCUIReferenceScreenBounds();
      CGRectGetWidth(v6);
    }
    sub_24A7CCE94();
    CCUICalculateGridGeometryInfo();
    *(void *)uint64_t v1 = v4;
    *(void *)(v1 + 8) = v5;
    *(unsigned char *)(v1 + 16) = 0;
  }
}

id sub_24A7CCFE8()
{
  uint64_t v1 = OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___defaultRootListLayout;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___defaultRootListLayout))
  {
    id v2 = *(id *)(v0
               + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___defaultRootListLayout);
LABEL_5:
    swift_unknownObjectRetain();
    return v2;
  }
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F791F0]), sel_initWithScreenType_, SBHScreenTypeForCurrentDevice());
  id result = objc_msgSend(v3, sel_layoutForIconLocation_, *MEMORY[0x263F79320]);
  if (result)
  {
    id v2 = result;

    *(void *)(v0 + v1) = v2;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id sub_24A7CD154()
{
  return sub_24A7CD16C(type metadata accessor for ControlsGalleryIconListLayout);
}

id sub_24A7CD16C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for ControlsGalleryIconListLayout()
{
  return self;
}

uint64_t sub_24A7CD214(uint64_t a1)
{
  id v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_24A7D8CDC(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v10 = *v2;
  *id v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24A7CDE28();
    uint64_t v7 = v10;
  }

  uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_24A7CD91C(v4, v7);
  *id v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_24A7CD2DC(uint64_t a1, char a2)
{
  objc_super v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BDC80);
  char v38 = a2;
  uint64_t v6 = sub_24A7DCD30();
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
  unsigned int v35 = v2;
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
    id v22 = (void *)(v5 + 64);
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
          objc_super v3 = v35;
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
    id v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_24A7DCDA0();
    sub_24A7DCA50();
    uint64_t result = sub_24A7DCDC0();
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
    id v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  objc_super v3 = v35;
  id v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_24A7CD5EC(uint64_t a1, char a2)
{
  objc_super v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDC60);
  char v39 = a2;
  uint64_t v6 = sub_24A7DCD30();
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
  int64_t v36 = v2;
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
    unint64_t v23 = (void *)(v5 + 64);
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
          objc_super v3 = v36;
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
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    id v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((v39 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    sub_24A7DCA40();
    sub_24A7DCDA0();
    sub_24A7DCA50();
    uint64_t v14 = sub_24A7DCDC0();
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
  objc_super v3 = v36;
  unint64_t v23 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_24A7CD91C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_24A7DCC40();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void **)(*(void *)(a2 + 48) + 8 * v6);
        sub_24A7DCA40();
        sub_24A7DCDA0();
        id v10 = v9;
        sub_24A7DCA50();
        uint64_t v11 = sub_24A7DCDC0();

        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          uint64_t v14 = (void *)(v13 + 8 * v3);
          uint64_t v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            void *v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = (void *)(v16 + 8 * v3);
          unint64_t v18 = (void *)(v16 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= v18 + 1))
          {
            void *v17 = *v18;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  uint64_t *v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_24A7CDB10(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_24A7D8CDC((uint64_t)a2);
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
    sub_24A7CDE28();
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
  sub_24A7CD5EC(v12, a3 & 1);
  unint64_t v17 = sub_24A7D8CDC((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    type metadata accessor for SBHIconGridSizeClass(0);
    sub_24A7DCD90();
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

id sub_24A7CDC74()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BDC80);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24A7DCD20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    BOOL v21 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v21 = *v17;
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

id sub_24A7CDE28()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDC60);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24A7DCD20();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
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

id sub_24A7CDFD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = MEMORY[0x263F8EE80];
  id v5 = objc_msgSend(self, sel_controlCenterDomain);
  id v6 = objc_msgSend(v5, sel_allNonDefaultGridSizeClasses);

  unint64_t v7 = (void *)swift_allocObject();
  v7[2] = a1;
  v7[3] = a2;
  v7[4] = v4;
  v13[4] = sub_24A7CE26C;
  v13[5] = v7;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = sub_24A7CCA24;
  v13[3] = &block_descriptor_0;
  char v8 = _Block_copy(v13);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_enumerateGridSizeClassesUsingBlock_, v8);
  _Block_release(v8);

  swift_beginAccess();
  id v9 = objc_allocWithZone(MEMORY[0x263F79210]);
  type metadata accessor for SBHIconGridSizeClass(0);
  sub_24A7CE290();
  sub_24A7CE2D0(&qword_2697BD5C8, type metadata accessor for SBHIconGridSizeClass);
  swift_bridgeObjectRetain();
  uint64_t v10 = (void *)sub_24A7DC9B0();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v9, sel_initWithGridSizeClassSizes_, v10);
  swift_release();

  return v11;
}

uint64_t sub_24A7CE1F4()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A7CE22C()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24A7CE26C(void *a1, uint64_t a2)
{
  return sub_24A7CC8F4(a1, a2, *(uint64_t (**)(void))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_24A7CE290()
{
  unint64_t result = qword_2697BDC50;
  if (!qword_2697BDC50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697BDC50);
  }
  return result;
}

uint64_t sub_24A7CE2D0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_24A7CE318()
{
  id v0 = objc_allocWithZone(NSString);
  uint64_t v1 = (void *)sub_24A7DCA10();
  id v2 = objc_msgSend(v0, sel_initWithString_, v1);

  qword_2697BEC70 = (uint64_t)v2;
}

void *CHSWidgetExtensionProvider.controlDescriptor(for:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B17BA00);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17B9F0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  id v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  char v8 = (char *)v29 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B17B9E0);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
  v10(v8, 1, 1, v9);
  id v11 = objc_msgSend(a1, sel_containerBundleIdentifier);
  if (v11)
  {
    unint64_t v12 = v11;
    sub_24A7DCA40();

    sub_24A7DC950();
    sub_24A7CF1CC((uint64_t)v8);
    v10(v6, 0, 1, v9);
    sub_24A7CF3D4((uint64_t)v6, (uint64_t)v8);
  }
  sub_24A7DCB80();
  id v13 = objc_msgSend(a1, sel_extensionBundleIdentifier);
  sub_24A7DCA40();

  sub_24A7DC950();
  sub_24A7CE730((uint64_t)v8, (uint64_t)v6);
  unint64_t v14 = (void *)sub_24A7DCB70();
  id v15 = objc_msgSend(a1, sel_kind);
  uint64_t v16 = sub_24A7DCA40();
  uint64_t v18 = v17;

  id v19 = objc_msgSend(v29[0], sel_extensions);
  sub_24A7CAA58(0, &qword_26B17BA18);
  sub_24A7CE798();
  uint64_t v20 = sub_24A7DCB20();

  id v21 = v14;
  sub_24A7CEEB8(v20, (uint64_t)v21);
  unint64_t v23 = v22;
  swift_bridgeObjectRelease();

  if (!v23)
  {
    sub_24A7CF1CC((uint64_t)v8);
    swift_bridgeObjectRelease();

    return 0;
  }
  id v24 = objc_msgSend(v23, sel_orderedControlDescriptors);
  if (!v24)
  {

    swift_bridgeObjectRelease();
    sub_24A7CF1CC((uint64_t)v8);
    return 0;
  }
  int64_t v25 = v24;
  sub_24A7CAA58(0, &qword_26B17BA28);
  unint64_t v26 = sub_24A7DCAD0();

  swift_bridgeObjectRetain();
  unint64_t v27 = sub_24A7CF22C(v26, v16, v18);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease_n();
  sub_24A7CF1CC((uint64_t)v8);
  return v27;
}

uint64_t sub_24A7CE730(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17B9F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24A7CE798()
{
  unint64_t result = qword_26B17BA20;
  if (!qword_26B17BA20)
  {
    sub_24A7CAA58(255, &qword_26B17BA18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B17BA20);
  }
  return result;
}

uint64_t sub_24A7CE800(void **a1, uint64_t a2)
{
  uint64_t v59 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B17B9F0);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v51 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v55 = (char *)&v51 - v5;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B17B9E0);
  uint64_t v56 = *(void *)(v54 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v54);
  uint64_t v53 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  id v52 = (char *)&v51 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v67 = (char *)&v51 - v11;
  MEMORY[0x270FA5388](v10);
  id v57 = (char *)&v51 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B17BA00);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  id v19 = (char *)&v51 - v18;
  uint64_t v20 = *a1;
  id v21 = (char *)objc_msgSend(v20, sel_identity);
  int64_t v22 = (uint64_t *)MEMORY[0x263F31DA8];
  unint64_t v23 = &v21[*MEMORY[0x263F31DA8]];
  swift_beginAccess();
  uint64_t v58 = v14;
  id v24 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  uint64_t v60 = v19;
  int64_t v25 = v19;
  uint64_t v26 = v54;
  v24(v25, v23, v13);

  uint64_t v27 = *v22;
  uint64_t v28 = (uint64_t)v55;
  uint64_t v29 = (char *)(v59 + v27);
  swift_beginAccess();
  uint64_t v61 = v17;
  uint64_t v62 = v13;
  uint64_t v30 = v13;
  uint64_t v31 = v56;
  v24(v17, v29, v30);
  id v32 = objc_msgSend(v20, sel_identity);
  id v33 = (void *)MEMORY[0x263F31DA0];
  uint64_t v34 = (uint64_t)v32 + *MEMORY[0x263F31DA0];
  swift_beginAccess();
  sub_24A7CE730(v34, v28);

  uint64_t v35 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48);
  BOOL v36 = v35(v28, 1, v26) == 1;
  int64_t v37 = v57;
  if (v36)
  {
    sub_24A7DC940();
    sub_24A7CF1CC(v28);
  }
  else
  {
    (*(void (**)(void))(v31 + 32))();
  }
  uint64_t v38 = (uint64_t)v51;
  uint64_t v39 = v59 + *v33;
  swift_beginAccess();
  sub_24A7CE730(v39, v38);
  if (v35(v38, 1, v26) == 1)
  {
    sub_24A7DC940();
    sub_24A7CF1CC(v38);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 32))(v67, v38, v26);
  }
  id v40 = v53;
  id v41 = v52;
  sub_24A7CF48C(&qword_26B17B9F8, (uint64_t *)&unk_26B17BA00);
  sub_24A7DCAA0();
  sub_24A7DCAA0();
  if (v65 == v63 && v66 == v64)
  {
    swift_bridgeObjectRelease_n();
    id v42 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
    v42(v41, v37, v26);
    v42(v40, v67, v26);
  }
  else
  {
    char v43 = sub_24A7DCD80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
    uint64_t v45 = v37;
    v44(v41, v37, v26);
    v44(v40, v67, v26);
    char v46 = 0;
    if ((v43 & 1) == 0) {
      goto LABEL_16;
    }
  }
  sub_24A7CF48C(&qword_26B17B978, (uint64_t *)&unk_26B17B9E0);
  sub_24A7DCAA0();
  sub_24A7DCAA0();
  if (v65 == v63 && v66 == v64) {
    char v46 = 1;
  }
  else {
    char v46 = sub_24A7DCD80();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v45 = v37;
LABEL_16:
  unint64_t v47 = *(void (**)(char *, uint64_t))(v31 + 8);
  v47(v40, v26);
  v47(v41, v26);
  v47(v67, v26);
  v47(v45, v26);
  unint64_t v48 = *(void (**)(char *, uint64_t))(v58 + 8);
  uint64_t v49 = v62;
  v48(v61, v62);
  v48(v60, v49);
  return v46 & 1;
}

void sub_24A7CEEB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_24A7DCC50();
    sub_24A7CAA58(0, &qword_26B17BA18);
    sub_24A7CE798();
    sub_24A7DCB30();
    uint64_t v5 = v23;
    uint64_t v22 = v24;
    uint64_t v6 = v25;
    int64_t v7 = v26;
    unint64_t v8 = v27;
  }
  else
  {
    uint64_t v9 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v22 = a1 + 56;
    uint64_t v10 = ~v9;
    uint64_t v11 = -v9;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v8 = v12 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v6 = v10;
    int64_t v7 = 0;
  }
  int64_t v21 = (unint64_t)(v6 + 64) >> 6;
  if ((v5 & 0x8000000000000000) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  if (!sub_24A7DCC60()) {
    goto LABEL_36;
  }
  sub_24A7CAA58(0, &qword_26B17BA18);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  id v13 = v28;
  swift_unknownObjectRelease();
  int64_t v14 = v7;
  uint64_t v15 = v8;
  if (!v13) {
    goto LABEL_36;
  }
  while (1)
  {
    uint64_t v28 = v13;
    char v19 = sub_24A7CE800(&v28, a2);
    if (v3)
    {

      goto LABEL_36;
    }
    if (v19) {
      goto LABEL_36;
    }

    int64_t v7 = v14;
    unint64_t v8 = v15;
    if (v5 < 0) {
      goto LABEL_8;
    }
LABEL_11:
    if (!v8) {
      break;
    }
    uint64_t v15 = (v8 - 1) & v8;
    unint64_t v16 = __clz(__rbit64(v8)) | (v7 << 6);
    int64_t v14 = v7;
LABEL_24:
    id v13 = *(id *)(*(void *)(v5 + 48) + 8 * v16);
    if (!v13) {
      goto LABEL_36;
    }
  }
  int64_t v14 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    return;
  }
  if (v14 >= v21) {
    goto LABEL_36;
  }
  unint64_t v17 = *(void *)(v22 + 8 * v14);
  if (v17)
  {
LABEL_23:
    uint64_t v15 = (v17 - 1) & v17;
    unint64_t v16 = __clz(__rbit64(v17)) + (v14 << 6);
    goto LABEL_24;
  }
  int64_t v18 = v7 + 2;
  if (v7 + 2 >= v21) {
    goto LABEL_36;
  }
  unint64_t v17 = *(void *)(v22 + 8 * v18);
  if (v17) {
    goto LABEL_22;
  }
  int64_t v18 = v7 + 3;
  if (v7 + 3 >= v21) {
    goto LABEL_36;
  }
  unint64_t v17 = *(void *)(v22 + 8 * v18);
  if (v17) {
    goto LABEL_22;
  }
  int64_t v18 = v7 + 4;
  if (v7 + 4 >= v21) {
    goto LABEL_36;
  }
  unint64_t v17 = *(void *)(v22 + 8 * v18);
  if (v17)
  {
LABEL_22:
    int64_t v14 = v18;
    goto LABEL_23;
  }
  int64_t v14 = v7 + 5;
  if (v7 + 5 >= v21) {
    goto LABEL_36;
  }
  unint64_t v17 = *(void *)(v22 + 8 * v14);
  if (v17) {
    goto LABEL_23;
  }
  int64_t v20 = v7 + 6;
  while (v21 != v20)
  {
    unint64_t v17 = *(void *)(v22 + 8 * v20++);
    if (v17)
    {
      int64_t v14 = v20 - 1;
      goto LABEL_23;
    }
  }
LABEL_36:
  sub_24A7CF43C();
}

uint64_t sub_24A7CF1CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17B9F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_24A7CF22C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_24A7DCD10();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v22 = v4;
      unint64_t v23 = v7;
      unint64_t v24 = v7 & 0xC000000000000001;
      uint64_t v4 = 4;
      do
      {
        uint64_t v9 = v4 - 4;
        if (v24)
        {
          id v10 = (id)MEMORY[0x24C5D0A70](v4 - 4, v7);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v10 = *(id *)(v7 + 8 * v4);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        id v13 = v10;
        uint64_t v14 = a3;
        id v15 = objc_msgSend(v10, sel_kind, v22);
        uint64_t v16 = sub_24A7DCA40();
        uint64_t v18 = v17;

        a3 = v14;
        BOOL v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        char v20 = sub_24A7DCD80();
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_18;
        }

        ++v4;
        uint64_t v8 = v12;
        BOOL v19 = v11 == v12;
        unint64_t v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_24A7CF3D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17B9F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A7CF43C()
{
  return swift_release();
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

uint64_t sub_24A7CF48C(unint64_t *a1, uint64_t *a2)
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

void __swiftcall CCUISControlsGalleryConfiguration.init()(CCUISControlsGalleryConfiguration *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

id sub_24A7CF568(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  if (*(void *)(a1 + *a3))
  {
    sub_24A7CAA58(0, a4);
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_24A7DCAC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t sub_24A7CF5F8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, void *a6)
{
  if (a3)
  {
    sub_24A7CAA58(0, a4);
    uint64_t v8 = sub_24A7DCAD0();
  }
  else
  {
    uint64_t v8 = 0;
  }
  *(void *)(a1 + *a6) = v8;
  return swift_bridgeObjectRelease();
}

id sub_24A7CF690(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void))
{
  if (*(void *)(a1 + *a3))
  {
    a4(0);
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)sub_24A7DCAC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t sub_24A7CF720(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), void *a5)
{
  if (a3)
  {
    a4(0);
    uint64_t v7 = sub_24A7DCAD0();
  }
  else
  {
    uint64_t v7 = 0;
  }
  *(void *)(a1 + *a5) = v7;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A7CF7D4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(objc_allocWithZone((Class)CCUISControlsGalleryConfiguration), sel_init);
  id v5 = objc_msgSend(v2, sel_allowedControlSizes);
  objc_msgSend(v4, sel_setAllowedControlSizes_, v5);

  id v6 = objc_msgSend(v2, sel_disallowedExtensionIdentities);
  objc_msgSend(v4, sel_setDisallowedExtensionIdentities_, v6);

  id v7 = objc_msgSend(v2, sel_disallowedControlIdentities);
  objc_msgSend(v4, sel_setDisallowedControlIdentities_, v7);

  id v8 = objc_msgSend(v2, sel_suggestedControls);
  objc_msgSend(v4, sel_setSuggestedControls_, v8);

  uint64_t result = type metadata accessor for CCUISControlsGalleryConfiguration(v9);
  a1[3] = result;
  *a1 = v4;
  return result;
}

id CCUISControlsGalleryConfiguration.init()()
{
  *(void *)(v0 + OBJC_IVAR___CCUISControlsGalleryConfiguration___allowedControlSizes) = 0;
  *(void *)(v0 + OBJC_IVAR___CCUISControlsGalleryConfiguration_disallowedControlIdentities) = 0;
  *(void *)(v0 + OBJC_IVAR___CCUISControlsGalleryConfiguration_disallowedExtensionIdentities) = 0;
  *(void *)(v0 + OBJC_IVAR___CCUISControlsGalleryConfiguration_suggestedControls) = 0;
  v2.super_class = (Class)CCUISControlsGalleryConfiguration;
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t CCUISControlsGalleryConfiguration.allowedControlSizes.getter()
{
  id v1 = objc_msgSend(v0, sel_allowedControlSizes);
  if (!v1) {
    return 0;
  }
  objc_super v2 = v1;
  sub_24A7CAA58(0, &qword_2697BDCB0);
  unint64_t v3 = sub_24A7DCAD0();

  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_4;
    }
LABEL_17:
    id v7 = (char *)MEMORY[0x263F8EE78];
LABEL_18:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v7;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_24A7DCD10();
  uint64_t v4 = result;
  if (!result) {
    goto LABEL_17;
  }
LABEL_4:
  if (v4 >= 1)
  {
    uint64_t v6 = 0;
    id v7 = (char *)MEMORY[0x263F8EE78];
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x24C5D0A70](v6, v3);
      }
      else {
        id v8 = *(id *)(v3 + 8 * v6 + 32);
      }
      uint64_t v9 = v8;
      id v10 = objc_msgSend(v8, sel_unsignedIntegerValue);

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v7 = sub_24A7D0080(0, *((void *)v7 + 2) + 1, 1, v7);
      }
      unint64_t v12 = *((void *)v7 + 2);
      unint64_t v11 = *((void *)v7 + 3);
      if (v12 >= v11 >> 1) {
        id v7 = sub_24A7D0080((char *)(v11 > 1), v12 + 1, 1, v7);
      }
      ++v6;
      *((void *)v7 + 2) = v12 + 1;
      *(void *)&v7[8 * v12 + 32] = v10;
    }
    while (v4 != v6);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

void CCUISControlsGalleryConfiguration.allowedControlSizes.setter(uint64_t a1)
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    if (v3)
    {
      uint64_t v8 = MEMORY[0x263F8EE78];
      sub_24A7DCCC0();
      uint64_t v4 = 0;
      do
      {
        uint64_t v5 = v4 + 1;
        objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, *(void *)(a1 + 8 * v4 + 32));
        sub_24A7DCCA0();
        sub_24A7DCCD0();
        sub_24A7DCCE0();
        sub_24A7DCCB0();
        uint64_t v4 = v5;
      }
      while (v3 != v5);
    }
    swift_bridgeObjectRelease();
    sub_24A7CAA58(0, &qword_2697BDCB0);
    id v7 = (id)sub_24A7DCAC0();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_setAllowedControlSizes_, v7, v7, v8);
  }
  else
  {
    objc_msgSend(v1, sel_setAllowedControlSizes_, 0, 0, v8);
  }
}

void (*CCUISControlsGalleryConfiguration.allowedControlSizes.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = CCUISControlsGalleryConfiguration.allowedControlSizes.getter();
  return sub_24A7CFDF0;
}

void sub_24A7CFDF0(uint64_t *a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = swift_bridgeObjectRetain();
    CCUISControlsGalleryConfiguration.allowedControlSizes.setter(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    CCUISControlsGalleryConfiguration.allowedControlSizes.setter(*a1);
  }
}

char *sub_24A7CFE48(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BD538);
    id v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 80);
  }
  else
  {
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[80 * v8]) {
      memmove(v12, v13, 80 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_24A7CFF60(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BDCD0);
    id v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 72);
  }
  else
  {
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[72 * v8]) {
      memmove(v12, v13, 72 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_24A7D0080(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDCC8);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24A7D017C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CCUISControlsGalleryConfiguration.allowedControlSizes.getter();
  *a1 = result;
  return result;
}

void sub_24A7D01A8()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  CCUISControlsGalleryConfiguration.allowedControlSizes.setter(v0);
}

uint64_t type metadata accessor for CCUISControlsGalleryConfiguration(uint64_t a1)
{
  return sub_24A7CAA58(a1, &qword_2697BDCB8);
}

char *sub_24A7D01E8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDCC0);
    id v10 = (char *)swift_allocObject();
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
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24A7D02F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t CCUIControlIconElement.uniqueIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___CCUIControlIconElement_uniqueIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CCUIControlIconElement.kind.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___CCUIControlIconElement_kind);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CCUIControlIconElement.controlType.getter()
{
  return *(void *)(v0 + OBJC_IVAR___CCUIControlIconElement_controlType);
}

uint64_t CCUIControlIconElement.extensionBundleIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___CCUIControlIconElement_extensionBundleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CCUIControlIconElement.containerBundleIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___CCUIControlIconElement_containerBundleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CCUIControlIconElement.displayName.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___CCUIControlIconElement_displayName);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t CCUIControlIconElement.displayName.setter(uint64_t a1, uint64_t a2)
{
  char v5 = (void *)(v2 + OBJC_IVAR___CCUIControlIconElement_displayName);
  swift_beginAccess();
  *char v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t CCUIControlIconElement.preferredGallerySizeClass.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___CCUIControlIconElement_preferredGallerySizeClass;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t CCUIControlIconElement.preferredGallerySizeClass.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___CCUIControlIconElement_preferredGallerySizeClass);
  uint64_t result = swift_beginAccess();
  void *v3 = a1;
  return result;
}

id CCUIControlIconElement.supportedGridSizeClasses.getter()
{
  return *(id *)(v0 + OBJC_IVAR___CCUIControlIconElement__supportedGridSizeClasses);
}

void sub_24A7D07F0(char a1)
{
  if (a1)
  {
    if (qword_26B17B9C0 != -1) {
      swift_once();
    }
    uint64_t v2 = &qword_26B17B9B8;
  }
  else
  {
    if (qword_26B17B9A8 != -1) {
      swift_once();
    }
    uint64_t v2 = &qword_26B17B9A0;
  }
  uint64_t v3 = (void *)*v2;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR___CCUIControlIconElement__supportedGridSizeClasses);
  *(void *)(v1 + OBJC_IVAR___CCUIControlIconElement__supportedGridSizeClasses) = v3;
  id v5 = v3;

  id v6 = objc_msgSend(self, sel_sbh_leafIconDataSourceNotificationCenter);
  objc_msgSend(v6, sel_postNotificationName_object_, *MEMORY[0x263F79328], v1);
}

id CCUIControlIconElement.init(kind:controlType:extensionBundleIdentifier:containerBundleIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  id v10 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  if (a7)
  {
    int64_t v11 = (void *)sub_24A7DCA10();
    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v11 = 0;
  }
  id v12 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithKind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v9, a3, v10, v11);

  return v12;
}

{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void v18[2];
  uint64_t v19;
  id v20;

  BOOL v19 = a3;
  v18[1] = a6;
  uint64_t v8 = sub_24A7DC930();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  int64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A7DC920();
  sub_24A7DC910();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  id v12 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  id v13 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  if (a7)
  {
    id v15 = (void *)sub_24A7DCA10();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v15 = 0;
  }
  uint64_t v16 = objc_msgSend(v20, sel_initWithUniqueIdentifier_kind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v12, v13, v19, v14, v15);

  return v16;
}

id CCUIControlIconElement.init(uniqueIdentifier:kind:controlType:extensionBundleIdentifier:containerBundleIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_24A7D1B54(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

{
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  id v18;
  objc_super v20;

  id v10 = &v9[OBJC_IVAR___CCUIControlIconElement_displayName];
  *(void *)id v10 = 0;
  *((void *)v10 + 1) = 0;
  *(void *)&v9[OBJC_IVAR___CCUIControlIconElement_preferredGallerySizeClass] = 0;
  int64_t v11 = &v9[OBJC_IVAR___CCUIControlIconElement_uniqueIdentifier];
  *(void *)int64_t v11 = a1;
  *((void *)v11 + 1) = a2;
  id v12 = &v9[OBJC_IVAR___CCUIControlIconElement_kind];
  *(void *)id v12 = a3;
  *((void *)v12 + 1) = a4;
  *(void *)&v9[OBJC_IVAR___CCUIControlIconElement_controlType] = a5;
  id v13 = &v9[OBJC_IVAR___CCUIControlIconElement_extensionBundleIdentifier];
  *(void *)id v13 = a6;
  *((void *)v13 + 1) = a7;
  uint64_t v14 = &v9[OBJC_IVAR___CCUIControlIconElement_containerBundleIdentifier];
  *(void *)uint64_t v14 = a8;
  *((void *)v14 + 1) = a9;
  id v15 = qword_26B17B9A8;
  uint64_t v16 = v9;
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v17 = (void *)qword_26B17B9A0;
  if (qword_26B17B9C0 != -1) {
    swift_once();
  }
  uint64_t v18 = objc_msgSend(v17, sel_gridSizeClassSetByUnioningWithGridSizeClassSet_, qword_26B17B9B8);
  *(void *)&v16[OBJC_IVAR___CCUIControlIconElement__supportedGridSizeClasses] = v18;

  v20.receiver = v16;
  v20.super_class = (Class)CCUIControlIconElement;
  return objc_msgSendSuper2(&v20, sel_init);
}

uint64_t CCUIControlIconElement.priority(for:)()
{
  return 1;
}

uint64_t CCUIControlIconElement.icon(_:displayNameForLocation:)()
{
  id v1 = objc_msgSend(v0, sel_displayName);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_24A7DCA40();

  return v3;
}

id CCUIControlIconElement.supportedGridSizeClasses(for:)()
{
  id v1 = objc_msgSend(v0, sel_supportedGridSizeClasses);
  return v1;
}

uint64_t CCUIControlIconElement.iconSupportsConfiguration(_:)()
{
  return 1;
}

char *CCUIControlIconElement.copyWithUniqueIdentifier()()
{
  swift_getObjectType();
  id v1 = objc_msgSend(v0, sel_kind);
  sub_24A7DCA40();

  id v2 = objc_msgSend(v0, sel_controlType);
  id v3 = objc_msgSend(v0, sel_extensionBundleIdentifier);
  sub_24A7DCA40();

  id v4 = objc_msgSend(v0, sel_containerBundleIdentifier);
  if (v4)
  {
    id v5 = v4;
    sub_24A7DCA40();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  if (v7)
  {
    id v10 = (void *)sub_24A7DCA10();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = 0;
  }
  int64_t v11 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithKind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v8, v2, v9, v10);

  id v12 = objc_msgSend(v0, sel_displayName);
  objc_msgSend(v11, sel_setDisplayName_, v12);

  objc_msgSend(v11, sel_setPreferredGallerySizeClass_, objc_msgSend(v0, sel_preferredGallerySizeClass));
  id v13 = *(void **)&v0[OBJC_IVAR___CCUIControlIconElement__supportedGridSizeClasses];
  uint64_t v14 = *(void **)&v11[OBJC_IVAR___CCUIControlIconElement__supportedGridSizeClasses];
  *(void *)&v11[OBJC_IVAR___CCUIControlIconElement__supportedGridSizeClasses] = v13;
  id v15 = v13;

  return v11;
}

unint64_t CCUIControlIconElement.hash.getter()
{
  id v1 = v0;
  id v2 = objc_msgSend(v0, sel_uniqueIdentifier);
  uint64_t v3 = sub_24A7DCA40();
  uint64_t v5 = v4;

  sub_24A7CA890();
  uint64_t v6 = sub_24A7DCC10();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v1, sel_containerBundleIdentifier, v3, v5);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = sub_24A7DCA40();
    uint64_t v11 = v10;

    uint64_t v22 = v9;
    uint64_t v23 = v11;
    uint64_t v12 = sub_24A7DCC10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = objc_msgSend(v1, sel_kind, v22, v23);
  uint64_t v14 = sub_24A7DCA40();
  uint64_t v16 = v15;

  uint64_t v17 = sub_24A7DCC10();
  swift_bridgeObjectRelease();
  unint64_t v18 = (unint64_t)objc_msgSend(v1, sel_controlType, v14, v16);
  id v19 = objc_msgSend(v1, sel_extensionBundleIdentifier);
  sub_24A7DCA40();

  uint64_t v20 = sub_24A7DCC10();
  swift_bridgeObjectRelease();
  return v12 ^ v6 ^ v17 ^ v18 ^ v20;
}

uint64_t CCUIControlIconElement.isEqual(_:)(uint64_t a1)
{
  uint64_t v2 = sub_24A7CA8E4(a1, (uint64_t)v44);
  if (!v45)
  {
    sub_24A7CA94C((uint64_t)v44);
    goto LABEL_22;
  }
  type metadata accessor for CCUIControlIconElement(v2);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_22:
    char v11 = 0;
    return v11 & 1;
  }
  if (v43 == v1)
  {

    char v11 = 1;
    return v11 & 1;
  }
  id v3 = objc_msgSend(v1, sel_uniqueIdentifier);
  uint64_t v4 = sub_24A7DCA40();
  uint64_t v6 = v5;

  id v7 = objc_msgSend(v43, sel_uniqueIdentifier);
  uint64_t v8 = sub_24A7DCA40();
  uint64_t v10 = v9;

  if (v4 == v8 && v6 == v10)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v12 = sub_24A7DCD80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0) {
      goto LABEL_21;
    }
  }
  id v13 = objc_msgSend(v1, sel_kind);
  uint64_t v14 = sub_24A7DCA40();
  uint64_t v16 = v15;

  id v17 = objc_msgSend(v43, sel_kind);
  uint64_t v18 = sub_24A7DCA40();
  uint64_t v20 = v19;

  if (v14 != v18 || v16 != v20)
  {
    char v21 = sub_24A7DCD80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v21) {
      goto LABEL_14;
    }
LABEL_21:

    goto LABEL_22;
  }
  swift_bridgeObjectRelease_n();
LABEL_14:
  id v22 = objc_msgSend(v1, sel_controlType);
  if (v22 != objc_msgSend(v43, sel_controlType)) {
    goto LABEL_21;
  }
  id v23 = objc_msgSend(v1, sel_extensionBundleIdentifier);
  uint64_t v24 = sub_24A7DCA40();
  uint64_t v26 = v25;

  id v27 = objc_msgSend(v43, sel_extensionBundleIdentifier);
  uint64_t v28 = sub_24A7DCA40();
  uint64_t v30 = v29;

  if (v24 == v28 && v26 == v30)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_19;
  }
  char v31 = sub_24A7DCD80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v31 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_19:
  id v32 = objc_msgSend(v1, sel_containerBundleIdentifier);
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = sub_24A7DCA40();
    uint64_t v36 = v35;
  }
  else
  {
    uint64_t v34 = 0;
    uint64_t v36 = 0;
  }
  id v38 = objc_msgSend(v43, sel_containerBundleIdentifier);
  if (!v38)
  {
    if (!v36)
    {

      char v11 = 1;
      return v11 & 1;
    }
LABEL_32:

    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  uint64_t v39 = v38;
  uint64_t v40 = sub_24A7DCA40();
  uint64_t v42 = v41;

  if (!v36)
  {

    if (!v42)
    {
      char v11 = 1;
      return v11 & 1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  if (!v42) {
    goto LABEL_32;
  }
  if (v34 == v40 && v36 == v42) {
    char v11 = 1;
  }
  else {
    char v11 = sub_24A7DCD80();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v11 & 1;
}

uint64_t CCUIControlIconElement.description.getter()
{
  id v1 = objc_msgSend(self, sel_descriptionForRootObject_, v0);
  uint64_t v2 = sub_24A7DCA40();

  return v2;
}

id CCUIControlIconElement.copy(with:)@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = swift_getObjectType();
  id v3 = objc_msgSend(v1, sel_uniqueIdentifier);
  uint64_t v23 = sub_24A7DCA40();
  uint64_t v5 = v4;

  id v6 = objc_msgSend(v1, sel_kind);
  uint64_t v7 = sub_24A7DCA40();
  uint64_t v9 = v8;

  id v10 = objc_msgSend(v1, sel_controlType);
  id v11 = objc_msgSend(v1, sel_extensionBundleIdentifier);
  uint64_t v12 = sub_24A7DCA40();
  uint64_t v14 = v13;

  id v15 = objc_msgSend(v1, sel_containerBundleIdentifier);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = sub_24A7DCA40();
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v19 = 0;
  }
  id v20 = sub_24A7D1B54(v23, v5, v7, v9, (uint64_t)v10, v12, v14, v17, v19);
  id v21 = objc_msgSend(v2, sel_displayName);
  objc_msgSend(v20, sel_setDisplayName_, v21);

  id result = objc_msgSend(v20, sel_setPreferredGallerySizeClass_, objc_msgSend(v2, sel_preferredGallerySizeClass));
  a1[3] = ObjectType;
  *a1 = v20;
  return result;
}

id sub_24A7D1B54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  id v11 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  if (a9)
  {
    uint64_t v13 = (void *)sub_24A7DCA10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithUniqueIdentifier_kind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v10, v11, a5, v12, v13);

  return v14;
}

uint64_t CCUIControlIconElement.appendDescription(to:)(void *a1)
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v1;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_24A7D2B0C;
  *(void *)(v4 + 24) = v3;
  v9[4] = sub_24A7D2B24;
  v9[5] = v4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  id v9[2] = sub_24A7C9F28;
  v9[3] = &block_descriptor_1;
  uint64_t v5 = _Block_copy(v9);
  id v6 = a1;
  id v7 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_appendProem_block_, v7, v5);
  _Block_release(v5);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v7) {
    __break(1u);
  }
  return result;
}

uint64_t sub_24A7D1E20(void *a1, void *a2)
{
  uint64_t result = (uint64_t)objc_msgSend(a1, sel_hasSuccinctStyle);
  if ((result & 1) == 0)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = a1;
    *(void *)(v5 + 24) = a2;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = sub_24A7D2B94;
    *(void *)(v6 + 24) = v5;
    v11[4] = sub_24A7D2BFC;
    v11[5] = v6;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1107296256;
    v11[2] = sub_24A7C9F28;
    v11[3] = &block_descriptor_17_0;
    id v7 = _Block_copy(v11);
    id v8 = a1;
    id v9 = a2;
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_appendBodySectionWithName_block_, 0, v7);
    _Block_release(v7);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    uint64_t result = swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
  }
  return result;
}

void sub_24A7D1F94(void *a1, id a2)
{
  id v4 = objc_msgSend(a2, sel_kind);
  if (!v4)
  {
    sub_24A7DCA40();
    id v4 = (id)sub_24A7DCA10();
    swift_bridgeObjectRelease();
  }
  uint64_t v5 = (void *)sub_24A7DCA10();
  objc_msgSend(a1, sel_appendString_withName_, v4, v5);

  objc_msgSend(a2, sel_controlType);
  sub_24A7DCB60();
  uint64_t v6 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  id v7 = (void *)sub_24A7DCA10();
  objc_msgSend(a1, sel_appendString_withName_, v6, v7);

  id v8 = objc_msgSend(a2, sel_extensionBundleIdentifier);
  if (!v8)
  {
    sub_24A7DCA40();
    id v8 = (id)sub_24A7DCA10();
    swift_bridgeObjectRelease();
  }
  id v9 = (void *)sub_24A7DCA10();
  objc_msgSend(a1, sel_appendString_withName_, v8, v9);

  id v10 = objc_msgSend(a2, sel_containerBundleIdentifier);
  id v11 = (void *)sub_24A7DCA10();
  objc_msgSend(a1, sel_appendString_withName_, v10, v11);

  id v12 = objc_msgSend(a2, sel_supportedGridSizeClasses);
  uint64_t v13 = (void *)sub_24A7DCA10();

  id v14 = objc_msgSend(a2, sel_uniqueIdentifier);
  if (!v14)
  {
    sub_24A7DCA40();
    id v14 = (id)sub_24A7DCA10();
    swift_bridgeObjectRelease();
  }
  id v15 = (void *)sub_24A7DCA10();
  objc_msgSend(a1, sel_appendString_withName_, v14, v15);

  id v16 = objc_msgSend(a2, sel_displayName);
  id v17 = (id)sub_24A7DCA10();
  objc_msgSend(a1, sel_appendString_withName_skipIfEmpty_, v16, v17, 1);
}

id sub_24A7D232C()
{
  uint64_t v0 = CCUIDefaultSupportedGridSizeClassesForChronoControls();
  id result = SBHIconGridSizeClassSetForCCUIGridSizeClassMask(v0);
  qword_26B17B9A0 = (uint64_t)result;
  return result;
}

uint64_t sub_24A7D2358()
{
  uint64_t v0 = CCUIDefaultSupportedGridSizeClassesForChronoControls();
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = 0;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  *(void *)(v2 + 24) = v1;
  v6[4] = sub_24A7D2BF4;
  v6[5] = v2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_24A7D02F0;
  v6[3] = &block_descriptor_26_0;
  uint64_t v3 = (void (**)(id, uint64_t))_Block_copy(v6);
  swift_retain();
  swift_release();
  CCUIEnumerateGridSizeClassesWithBlock(v3);
  _Block_release(v3);
  swift_beginAccess();
  id v4 = SBHIconGridSizeClassSetForCCUIGridSizeClassMask(*(void *)(v1 + 16));
  uint64_t result = swift_release();
  qword_26B17B9B8 = (uint64_t)v4;
  return result;
}

uint64_t type metadata accessor for CCUIControlIconElement(uint64_t a1)
{
  return sub_24A7CAA58(a1, &qword_26B17B9D0);
}

uint64_t sub_24A7D2498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = CCUIGridSizeClassMaskForGridSizeClass(a1);
  if ((result & ~a2) == 0)
  {
    id v7 = (void *)(a3 + 16);
    uint64_t v8 = CCUIAdjustGridSizeClassForAccessibility(a1, 1);
    uint64_t v9 = CCUIGridSizeClassMaskForGridSizeClass(v8);
    uint64_t result = swift_beginAccess();
    if ((v9 & ~*v7) != 0) {
      *v7 |= v9;
    }
  }
  return result;
}

void __swiftcall CCUIControlIconElement.init()(CCUIControlIconElement *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void CCUIControlIconElement.init()()
{
}

unint64_t CCUIControlIconElement.sbh_galleryItemIdentifier.getter()
{
  sub_24A7DCC70();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend(v0, sel_uniqueIdentifier);
  sub_24A7DCA40();

  sub_24A7DCA60();
  swift_bridgeObjectRelease();
  return 0xD00000000000001ELL;
}

uint64_t CCUIControlIconElement.sbh_appName.getter()
{
  id v1 = v0;
  id v2 = objc_msgSend(v0, sel_containerBundleIdentifier);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = sub_24A7DCA40();
    uint64_t v6 = v5;

    sub_24A7CAA58(0, (unint64_t *)&unk_2697BDD20);
    id v7 = sub_24A7CA3A8(v4, v6, 1);
    id v11 = v7;
    if (v7)
    {
      id v9 = objc_msgSend(v7, sel_localizedName);
      uint64_t v10 = sub_24A7DCA40();

      goto LABEL_8;
    }
  }
  id v8 = objc_msgSend(v1, sel_sbh_widgetName);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = sub_24A7DCA40();
LABEL_8:

    return v10;
  }
  return 0;
}

uint64_t CCUIControlIconElement.sbh_widgetName.getter()
{
  id v1 = objc_msgSend(v0, sel_displayName);
  if (!v1) {
    id v1 = objc_msgSend(v0, sel_kind);
  }
  uint64_t v2 = sub_24A7DCA40();

  return v2;
}

uint64_t CCUIControlIconElement.sbh_supportedSizeClasses.getter()
{
  return 0;
}

uint64_t CCUIControlIconElement.sbh_widgetDescription.getter()
{
  return 0;
}

uint64_t CCUIControlIconElement.sbh_canBeAddedToStack.getter()
{
  return 0;
}

uint64_t CCUIControlIconElement.sbh_supportsRemovableBackground.getter()
{
  return 0;
}

uint64_t CCUIControlIconElement.sbh_supportsRemovableBackgroundOrAccessoryFamilies.getter()
{
  return 0;
}

uint64_t CCUIControlIconElement.backgroundColor.getter()
{
  return 0;
}

uint64_t CCUIControlIconElement.accentColor.getter()
{
  return 0;
}

uint64_t CCUIControlIconElement.mostInterestingColor.getter()
{
  return 0;
}

uint64_t CCUIControlIconElement.sbh_favoredSizeClasses(for:)()
{
  return 0;
}

uint64_t CCUIControlIconElement.sbh_isLinkedOnOr(after:)()
{
  return 1;
}

uint64_t sub_24A7D2ACC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A7D2B0C()
{
  return sub_24A7D1E20(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_24A7D2B14()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A7D2B24()
{
  return sub_24A7C9F00(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

id sub_24A7D2B4C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_preferredGallerySizeClass);
  *a2 = result;
  return result;
}

id sub_24A7D2B80(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPreferredGallerySizeClass_, *a1);
}

void sub_24A7D2B94()
{
  sub_24A7D1F94(*(void **)(v0 + 16), *(id *)(v0 + 24));
}

uint64_t sub_24A7D2B9C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A7D2BAC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A7D2BBC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24A7D2BF4(uint64_t a1)
{
  return sub_24A7D2498(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

unint64_t sub_24A7D2C18(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BDC80);
  uint64_t v2 = (void *)sub_24A7DCD40();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    id v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_24A7D8C64(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v11 = (uint64_t *)(v2[6] + 16 * result);
    *id v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
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

unint64_t sub_24A7D2D34(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BE048);
  uint64_t v2 = (void *)sub_24A7DCD40();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_unknownObjectRetain();
    unint64_t result = sub_24A7D8CDC((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
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

unint64_t sub_24A7D2E40(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDF18);
  uint64_t v2 = sub_24A7DCD40();
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
    sub_24A7DC7D4(v6, (uint64_t)&v15, &qword_2697BDF20);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24A7D8C64(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    *BOOL v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_24A7DC4C4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_24A7D2F78(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24A7D2FDC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_24A7DCD80();
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
    if (v12 || (sub_24A7DCD80() & 1) != 0) {
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

char *sub_24A7D30A4(void *a1)
{
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_iconViewProvider] = 0;
  *(void *)&v1[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_applicationControlCollections] = 0;
  *(void *)&v1[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_galleryApplicationControlCollections] = 0;
  *(void *)&v1[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_moduleUniqueIdentifiers] = 0;
  *(void *)&v1[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager____lazy_storage___moduleContentMetrics] = 0;
  swift_unknownObjectWeakAssign();
  uint64_t v3 = self;
  uint64_t v4 = v1;
  id v5 = objc_msgSend(v3, sel_visibleControls);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F31EB0]), sel_initWithOptions_, v5);

  *(void *)&v4[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_extensionProvider] = v6;
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F791C0]), sel_initWithWidgetExtensionProvider_, v6);
  *(void *)&v4[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_configurationManager] = v7;

  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for ControlsGalleryManager();
  uint64_t v8 = (char *)objc_msgSendSuper2(&v14, sel_init);
  uint64_t v9 = *(void **)&v8[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_configurationManager];
  char v10 = v8;
  objc_msgSend(v9, sel_setAllowsFakeWidgets_, 0);
  objc_msgSend(v9, sel_setConfigurationManagerDelegate_, v10);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F79240]), sel_initWithDelegate_, v10);

  type metadata accessor for ControlsGalleryManager.IconViewProvider();
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(void *)(v12 + 24) = v11;
  *(void *)&v10[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_iconViewProvider] = v12;
  swift_retain();
  swift_unknownObjectRelease();
  swift_unknownObjectWeakAssign();
  swift_release();
  return v10;
}

uint64_t sub_24A7D329C(unint64_t a1)
{
  unint64_t v1 = a1;
  uint64_t v2 = MEMORY[0x263F8EE78];
  uint64_t v24 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_35;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_24A7DCD10())
  {
    unint64_t v4 = 0;
    uint64_t v20 = v3;
    unint64_t v21 = v1 & 0xC000000000000001;
    uint64_t v17 = v1 + 32;
    uint64_t v18 = v1 & 0xFFFFFFFFFFFFFF8;
    unint64_t v19 = v1;
    while (v21)
    {
      id v5 = (id)MEMORY[0x24C5D0A70](v4, v1);
      BOOL v6 = __OFADD__(v4++, 1);
      if (v6) {
        goto LABEL_32;
      }
LABEL_10:
      uint64_t v23 = v2;
      id v22 = v5;
      id v7 = objc_msgSend(v5, sel_widgetDescriptors, v17);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDFF0);
      unint64_t v8 = sub_24A7DCAD0();

      if (v8 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v9 = sub_24A7DCD10();
        swift_bridgeObjectRelease();
        if (!v9)
        {
LABEL_27:
          swift_bridgeObjectRelease();
          goto LABEL_28;
        }
      }
      else
      {
        uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v9) {
          goto LABEL_27;
        }
      }
      if (v9 < 1) {
        goto LABEL_33;
      }
      for (uint64_t i = 0; i != v9; ++i)
      {
        if ((v8 & 0xC000000000000001) != 0) {
          MEMORY[0x24C5D0A70](i, v8);
        }
        else {
          swift_unknownObjectRetain();
        }
        self;
        uint64_t v12 = (void *)swift_dynamicCastObjCClass();
        if (v12)
        {
          id v11 = sub_24A7D5CAC(v12);
          MEMORY[0x24C5D08A0]();
          if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_24A7DCAF0();
          }
          sub_24A7DCB10();
          sub_24A7DCAE0();
          swift_unknownObjectRelease();
        }
        else
        {
          uint64_t v13 = swift_unknownObjectRetain();
          MEMORY[0x24C5D08A0](v13);
          if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_24A7DCAF0();
          }
          sub_24A7DCB10();
          sub_24A7DCAE0();
          swift_unknownObjectRelease();
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v1 = v19;
      uint64_t v2 = MEMORY[0x263F8EE78];
LABEL_28:
      objc_super v14 = (void *)sub_24A7DCAC0();
      swift_bridgeObjectRelease();
      objc_msgSend(v22, sel_setWidgetDescriptors_, v14);

      id v15 = v22;
      MEMORY[0x24C5D08A0]();
      if (*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_24A7DCAF0();
      }
      sub_24A7DCB10();
      sub_24A7DCAE0();

      if (v4 == v20)
      {
        swift_bridgeObjectRelease();
        return v24;
      }
    }
    if (v4 >= *(void *)(v18 + 16)) {
      goto LABEL_34;
    }
    id v5 = *(id *)(v17 + 8 * v4);
    BOOL v6 = __OFADD__(v4++, 1);
    if (!v6) {
      goto LABEL_10;
    }
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_24A7D3644()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_configurationManager), sel_applicationControlCollections);
  sub_24A7CAA58(0, &qword_2697BDBF0);
  unint64_t v2 = sub_24A7DCAD0();

  unint64_t v3 = sub_24A7D329C(v2);
  swift_bridgeObjectRelease();
  sub_24A7D5750((uint64_t)v127);
  unint64_t v107 = v3;
  id v4 = sub_24A7D6C7C((uint64_t)v127, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDFF8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_24A7DE590;
  *(void *)(v5 + 32) = v4;
  v128[0] = v5;
  sub_24A7DCAE0();
  uint64_t v114 = v0;
  *(void *)(v0 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_galleryApplicationControlCollections) = v128[0];
  id v97 = v4;
  swift_bridgeObjectRelease();
  v126 = sub_24A7C5620();
  uint64_t v6 = *((void *)v126 + 2);
  uint64_t v116 = v6;
  if (!v6)
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
LABEL_14:
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    goto LABEL_17;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  while (1)
  {
    uint64_t v10 = *(void *)&v126[v7 + 32];
    uint64_t v11 = *(void *)&v126[v7 + 40];
    uint64_t v12 = *(void **)&v126[v7 + 48];
    uint64_t v13 = *(void **)&v126[v7 + 56];
    uint64_t v14 = qword_2697BD3E0;
    swift_bridgeObjectRetain_n();
    id v119 = v12;
    id v118 = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v14 != -1) {
      swift_once();
    }
    id v15 = (void *)qword_2697BEC68;
    uint64_t v16 = (void *)sub_24A7DCA10();
    id v17 = objc_msgSend(v15, sel_localizedStringForKey_value_table_, v16, 0, 0);

    uint64_t v18 = sub_24A7DCA40();
    uint64_t v20 = v19;

    if (!v11)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_4;
    }
    if (v10 == v18 && v11 == v20)
    {
      uint64_t v29 = &v126[v7 + 40];
      swift_bridgeObjectRelease();
      uint64_t v30 = &v126[v7 + 80];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      char v31 = &v126[v7 + 96];
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease_n();
      goto LABEL_16;
    }
    char v9 = sub_24A7DCD80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    if (v9) {
      break;
    }
LABEL_4:
    ++v8;
    v7 += 72;
    if (v116 == v8)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      uint64_t v6 = 0;
      goto LABEL_14;
    }
  }
  uint64_t v29 = &v126[v7 + 40];
  uint64_t v30 = &v126[v7 + 80];
  char v31 = &v126[v7 + 96];
LABEL_16:
  swift_bridgeObjectRelease();
  id v32 = &v126[v7];
  uint64_t v100 = *(void *)v29;
  uint64_t v102 = *(void *)&v126[v7 + 32];
  uint64_t v23 = *(void **)&v126[v7 + 48];
  uint64_t v24 = (void *)*((void *)v32 + 7);
  uint64_t v25 = *((void *)v32 + 8);
  uint64_t v33 = *(void *)v30;
  uint64_t v98 = *((void *)v32 + 11);
  uint64_t v99 = *((void *)v32 + 9);
  uint64_t v34 = *(void *)v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v35 = v23;
  id v36 = v24;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_24A7D43D0(v8, (uint64_t)v128);
  int64_t v37 = v129;
  id v38 = v130;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v26 = v33;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v28 = v34;
  uint64_t v27 = v98;
  uint64_t v6 = v99;
  uint64_t v22 = v100;
  uint64_t v21 = v102;
LABEL_17:
  uint64_t v101 = v22;
  v128[0] = v21;
  v128[1] = v22;
  unint64_t v95 = v24;
  v96 = v23;
  uint64_t v129 = v23;
  uint64_t v130 = v24;
  uint64_t v94 = v25;
  uint64_t v131 = v25;
  uint64_t v132 = v6;
  uint64_t v133 = v26;
  uint64_t v134 = v27;
  uint64_t v135 = v28;
  unint64_t v125 = MEMORY[0x263F8EE78];
  unint64_t v124 = MEMORY[0x263F8EE78];
  unint64_t v39 = v107;
  if (v107 >> 62) {
    goto LABEL_74;
  }
  uint64_t v40 = *(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v40)
  {
LABEL_75:
    swift_bridgeObjectRelease();
    unint64_t v74 = MEMORY[0x263F8EE78];
    goto LABEL_76;
  }
  while (2)
  {
    unint64_t v41 = 0;
    uint64_t v105 = v40;
    unint64_t v106 = v39 & 0xC000000000000001;
    unint64_t v103 = v39 + 32;
    uint64_t v104 = v39 & 0xFFFFFFFFFFFFFF8;
LABEL_20:
    if (v106)
    {
      unint64_t v42 = v41;
      id v43 = (id)MEMORY[0x24C5D0A70](v41, v39);
      BOOL v44 = __OFADD__(v42, 1);
      unint64_t v45 = v42 + 1;
      if (v44) {
        goto LABEL_72;
      }
    }
    else
    {
      if (v41 >= *(void *)(v104 + 16)) {
        goto LABEL_73;
      }
      unint64_t v46 = v41;
      id v43 = *(id *)(v103 + 8 * v41);
      BOOL v44 = __OFADD__(v46, 1);
      unint64_t v45 = v46 + 1;
      if (v44)
      {
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        swift_bridgeObjectRetain();
        unint64_t v39 = v107;
        uint64_t v40 = sub_24A7DCD10();
        swift_bridgeObjectRelease();
        if (!v40) {
          goto LABEL_75;
        }
        continue;
      }
    }
    break;
  }
  unint64_t v109 = v45;
  uint64_t v122 = MEMORY[0x263F8EE78];
  id v108 = v43;
  id v47 = objc_msgSend(v43, sel_widgetDescriptors);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDFF0);
  unint64_t v48 = sub_24A7DCAD0();

  if (!(v48 >> 62))
  {
    uint64_t v49 = *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v49) {
      goto LABEL_28;
    }
    goto LABEL_64;
  }
  swift_bridgeObjectRetain();
  uint64_t v49 = sub_24A7DCD10();
  swift_bridgeObjectRelease();
  if (!v49)
  {
LABEL_64:
    swift_bridgeObjectRelease();
    id v72 = (void *)sub_24A7DCAC0();
    swift_bridgeObjectRelease();
    objc_msgSend(v108, sel_setWidgetDescriptors_, v72);

    id v73 = v108;
    MEMORY[0x24C5D08A0]();
    if (*(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24A7DCAF0();
    }
    sub_24A7DCB10();
    sub_24A7DCAE0();

    unint64_t v41 = v109;
    unint64_t v39 = v107;
    if (v109 == v105) {
      goto LABEL_69;
    }
    goto LABEL_20;
  }
LABEL_28:
  unint64_t v50 = 0;
  unint64_t v115 = v48 & 0xC000000000000001;
  unint64_t v110 = v48 + 32;
  uint64_t v111 = v48 & 0xFFFFFFFFFFFFFF8;
  uint64_t v112 = v49;
  unint64_t v113 = v48;
  while (1)
  {
LABEL_32:
    if (v115)
    {
      uint64_t v51 = MEMORY[0x24C5D0A70](v50, v48);
      BOOL v44 = __OFADD__(v50++, 1);
      if (v44) {
        goto LABEL_70;
      }
    }
    else
    {
      if (v50 >= *(void *)(v111 + 16)) {
        goto LABEL_71;
      }
      uint64_t v51 = *(void *)(v110 + 8 * v50);
      swift_unknownObjectRetain();
      BOOL v44 = __OFADD__(v50++, 1);
      if (v44)
      {
LABEL_70:
        __break(1u);
LABEL_71:
        __break(1u);
        goto LABEL_72;
      }
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v52 = sub_24A7D611C(v51, v125, (uint64_t)v126);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v120 = v52;
    if (v52) {
      break;
    }
    uint64_t v70 = swift_unknownObjectRetain();
    MEMORY[0x24C5D08A0](v70);
    if (*(void *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v122 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24A7DCAF0();
    }
    sub_24A7DCB10();
    sub_24A7DCAE0();
    swift_unknownObjectRelease();
    if (v50 == v49) {
      goto LABEL_64;
    }
  }
  unint64_t v117 = v50;
  if (!(v125 >> 62))
  {
    uint64_t v53 = *(void *)((v125 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    id v54 = v120;
    if (v53) {
      goto LABEL_41;
    }
    goto LABEL_52;
  }
  swift_bridgeObjectRetain_n();
  id v71 = v52;
  uint64_t v53 = sub_24A7DCD10();
  if (!v53)
  {
LABEL_52:
    swift_bridgeObjectRelease_n();
    id v69 = v120;
    MEMORY[0x24C5D08A0]();
    if (*(void *)((v125 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v125 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24A7DCAF0();
    }
    sub_24A7DCB10();
    sub_24A7DCAE0();
    swift_unknownObjectRelease();

    uint64_t v49 = v112;
    unint64_t v48 = v113;
LABEL_31:
    unint64_t v50 = v117;
    if (v117 == v49) {
      goto LABEL_64;
    }
    goto LABEL_32;
  }
LABEL_41:
  uint64_t v55 = 4;
  while (1)
  {
    id v56 = (v125 & 0xC000000000000001) != 0
        ? (id)MEMORY[0x24C5D0A70](v55 - 4, v125)
        : *(id *)(v125 + 8 * v55);
    id v57 = v56;
    uint64_t v58 = v55 - 3;
    if (__OFADD__(v55 - 4, 1)) {
      break;
    }
    id v59 = objc_msgSend(v56, sel_uniqueIdentifier);
    uint64_t v60 = sub_24A7DCA40();
    uint64_t v62 = v61;

    id v63 = objc_msgSend(v120, sel_uniqueIdentifier);
    uint64_t v64 = sub_24A7DCA40();
    uint64_t v66 = v65;

    if (v60 == v64 && v62 == v66)
    {
      swift_bridgeObjectRelease_n();

LABEL_30:
      uint64_t v49 = v112;
      unint64_t v48 = v113;
      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease();

      goto LABEL_31;
    }
    char v68 = sub_24A7DCD80();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v68) {
      goto LABEL_30;
    }
    ++v55;
    if (v58 == v53) {
      goto LABEL_52;
    }
  }
  __break(1u);
LABEL_69:
  swift_bridgeObjectRelease();
  unint64_t v74 = v125;
LABEL_76:
  swift_bridgeObjectRetain();
  sub_24A7DAE8C(v74, (uint64_t)v126);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v75 = swift_bridgeObjectRetain();
  sub_24A7D464C(v75);
  id v76 = (id)sub_24A7D48A0(&v124, (uint64_t)v128);
  MEMORY[0x24C5D08A0]();
  if (*(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_24A7DCAF0();
  }
  sub_24A7DCB10();
  sub_24A7DCAE0();
  sub_24A7D4818(&v124);
  unint64_t v77 = v124;
  unint64_t v123 = MEMORY[0x263F8EE78];
  if (v124 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_24A7DCD10();
    uint64_t v78 = result;
    if (!result) {
      goto LABEL_96;
    }
LABEL_80:
    if (v78 < 1)
    {
      __break(1u);
      return result;
    }
    id v121 = v76;
    uint64_t v80 = 0;
    while (1)
    {
      if ((v77 & 0xC000000000000001) != 0) {
        id v81 = (id)MEMORY[0x24C5D0A70](v80, v77);
      }
      else {
        id v81 = *(id *)(v77 + 8 * v80 + 32);
      }
      v82 = v81;
      id v83 = objc_msgSend(v81, sel_displayName);
      if (!v83) {
        goto LABEL_82;
      }
      id v84 = v83;
      uint64_t v85 = sub_24A7DCA40();
      unint64_t v87 = v86;

      uint64_t v88 = HIBYTE(v87) & 0xF;
      if ((v87 & 0x2000000000000000) == 0) {
        uint64_t v88 = v85 & 0xFFFFFFFFFFFFLL;
      }
      if (!v88)
      {

        swift_bridgeObjectRelease();
        goto LABEL_83;
      }
      sub_24A7DCA90();
      swift_bridgeObjectRelease();
      char v89 = sub_24A7DC9D0();
      swift_bridgeObjectRelease();
      if (v89)
      {
LABEL_82:
      }
      else
      {
        sub_24A7DCCA0();
        sub_24A7DCCD0();
        sub_24A7DCCE0();
        sub_24A7DCCB0();
      }
LABEL_83:
      if (v78 == ++v80)
      {
        swift_bridgeObjectRelease();
        unint64_t v90 = v123;
        id v76 = v121;
        goto LABEL_97;
      }
    }
  }
  uint64_t v78 = *(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (v78) {
    goto LABEL_80;
  }
LABEL_96:
  swift_bridgeObjectRelease();
  unint64_t v90 = MEMORY[0x263F8EE78];
LABEL_97:
  swift_retain();
  unint64_t v91 = swift_bridgeObjectRetain();
  uint64_t v92 = sub_24A7DB480(v91, v90);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_release();
  unint64_t v124 = v92;
  sub_24A7D464C(v90);
  uint64_t v93 = sub_24A7DB73C(v124);
  swift_bridgeObjectRelease();
  *(void *)(v114 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_applicationControlCollections) = v93;
  swift_bridgeObjectRelease();
  sub_24A7DC758(v21, v101, v96, v95, v94);

  return sub_24A7DC614((uint64_t)v127);
}

void sub_24A7D4338(unint64_t a1)
{
  unint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    sub_24A7DA0D4(v3);
    unint64_t v3 = v5;
    unint64_t *v1 = v5;
  }
  unint64_t v6 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    memmove((void *)((v3 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 32), (const void *)((v3 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 40), 8 * (v6 - 1 - a1));
    *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    sub_24A7DCAE0();
  }
}

uint64_t sub_24A7D43D0@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_24A7DA150(v5);
    uint64_t v5 = result;
  }
  unint64_t v7 = *(void *)(v5 + 16);
  if (v7 <= a1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = v5 + 72 * a1;
    long long v9 = *(_OWORD *)(v8 + 32);
    v8 += 32;
    uint64_t v10 = *(void *)(v8 + 32);
    unint64_t v11 = v7 - 1;
    uint64_t v12 = *(void *)(v8 + 56);
    uint64_t v13 = *(void *)(v8 + 64);
    long long v14 = *(_OWORD *)(v8 + 16);
    *(_OWORD *)a2 = v9;
    *(_OWORD *)(a2 + 16) = v14;
    *(void *)(a2 + 32) = v10;
    *(_OWORD *)(a2 + 40) = *(_OWORD *)(v8 + 40);
    *(void *)(a2 + 56) = v12;
    *(void *)(a2 + 64) = v13;
    uint64_t result = (uint64_t)memmove((void *)v8, (const void *)(v8 + 72), 72 * (v11 - a1));
    *(void *)(v5 + 16) = v11;
    *unint64_t v2 = v5;
  }
  return result;
}

uint64_t sub_24A7D4480(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24A7DCD10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24A7DCD10();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x24C5D0A80](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_24A7DA164(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24A7DCD10();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_24A7DCAE0();
}

uint64_t sub_24A7D464C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24A7DCD10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24A7DCD10();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x24C5D0A80](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    unint64_t *v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_24A7DA328(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24A7DCD10();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_24A7DCAE0();
}

uint64_t sub_24A7D4818(unint64_t *a1)
{
  unint64_t v2 = *a1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v2;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v2 & 0x8000000000000000) != 0
    || (v2 & 0x4000000000000000) != 0)
  {
    sub_24A7DA0D4(v2);
    unint64_t v2 = v4;
    *a1 = v4;
  }
  uint64_t v5 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v7[0] = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  v7[1] = v5;
  sub_24A7D9104(v7);
  return sub_24A7DCAE0();
}

uint64_t sub_24A7D48A0(void *a1, uint64_t a2)
{
  unint64_t v2 = (void *)a2;
  sub_24A7DC838(a2, (uint64_t)v117, &qword_2697BE000);
  v77[2] = v117[0];
  uint64_t v78 = v117[1];
  id v88 = (id)v117[3];
  uint64_t v4 = sub_24A7DCA00();
  uint64_t v81 = *(void *)(v4 - 8);
  uint64_t v82 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v80 = (char *)v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v79 = (char *)v77 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BE008);
  uint64_t v84 = *(void *)(v8 - 8);
  uint64_t v85 = v8;
  MEMORY[0x270FA5388](v8);
  id v83 = (char *)v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B17BA00);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v103 = (char *)v77 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B17B9F0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  id v15 = (char *)v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  id v17 = (char *)v77 - v16;
  unint64_t v115 = MEMORY[0x263F8EE78];
  uint64_t v116 = MEMORY[0x263F8EE78];
  uint64_t v114 = MEMORY[0x263F8EE78];
  v125[0] = 0;
  uint64_t v128 = 0;
  unint64_t v129 = 0xD000000000000029;
  unint64_t v130 = 0x800000024A7DE9E0;
  unint64_t v131 = 0xD000000000000010;
  unint64_t v132 = 0x800000024A7DEA10;
  unint64_t v133 = 0xD000000000000020;
  unint64_t v134 = 0x800000024A7DEA30;
  v77[1] = a1;
  uint64_t v18 = (char *)*a1;
  uint64_t v19 = *a1 >> 62;
  uint64_t v126 = 0;
  uint64_t v127 = 0;
  if (v19) {
    goto LABEL_68;
  }
  uint64_t v20 = *(void *)(((unint64_t)v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (uint64_t i = v20; i; uint64_t i = sub_24A7DCD10())
  {
    int v87 = 0;
    unint64_t v22 = 0;
    uint64_t v113 = 0;
    uint64_t v101 = v17;
    uint64_t v102 = OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_extensionProvider;
    uint64_t v93 = i;
    unint64_t v94 = (unint64_t)v18 & 0xC000000000000001;
    char v89 = v18 + 32;
    uint64_t v90 = (unint64_t)v18 & 0xFFFFFFFFFFFFFF8;
    unint64_t v86 = -1;
    unint64_t v91 = v18;
    uint64_t v92 = v2;
    uint64_t v105 = v15;
    while (1)
    {
      if (v94)
      {
        id v23 = (id)MEMORY[0x24C5D0A70](v22, v18);
      }
      else
      {
        if (v22 >= *(void *)(v90 + 16)) {
          goto LABEL_67;
        }
        id v23 = *(id *)&v89[8 * v22];
      }
      id v99 = v23;
      if (__OFADD__(v22, 1)) {
        goto LABEL_65;
      }
      unint64_t v97 = v22 + 1;
      id v24 = objc_msgSend(v99, sel_widgetDescriptors);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDFF0);
      unint64_t v25 = sub_24A7DCAD0();

      id v17 = (char *)(v25 >> 62);
      unint64_t v106 = v25;
      if (!(v25 >> 62)) {
        break;
      }
      swift_bridgeObjectRetain();
      uint64_t v58 = sub_24A7DCD10();
      swift_bridgeObjectRelease();
      uint64_t v98 = v58;
      if (v58 < 1)
      {
        int v96 = 0;
        goto LABEL_22;
      }
LABEL_14:
      if ((v25 & 0xC000000000000001) != 0)
      {
        MEMORY[0x24C5D0A70](0, v25);
      }
      else
      {
        if (!*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_66;
        }
        swift_unknownObjectRetain();
      }
      self;
      uint64_t v26 = (void *)swift_dynamicCastObjCClass();
      if (v26 && (id v27 = objc_msgSend(v26, sel_containerBundleIdentifier)) != 0)
      {
        uint64_t v28 = v27;
        sub_24A7DCA40();

        int v96 = sub_24A7DCA80();
        swift_unknownObjectRelease();
        unint64_t v25 = v106;
        swift_bridgeObjectRelease();
        if (!v17) {
          goto LABEL_25;
        }
      }
      else
      {
        swift_unknownObjectRelease();
        int v96 = 0;
        if (!v17) {
          goto LABEL_25;
        }
      }
LABEL_22:
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_24A7DCD10();
      id v17 = v101;
      if (v29) {
        goto LABEL_26;
      }
LABEL_6:

      swift_bridgeObjectRelease_n();
      unint64_t v22 = v97;
      if (v97 == v93) {
        goto LABEL_70;
      }
    }
    uint64_t v98 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v98) {
      goto LABEL_14;
    }
    uint64_t v98 = 0;
    int v96 = 0;
LABEL_25:
    uint64_t v29 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    id v17 = v101;
    if (!v29) {
      goto LABEL_6;
    }
LABEL_26:
    uint64_t v18 = 0;
    unint64_t v109 = v25 & 0xC000000000000001;
    uint64_t v100 = v25 & 0xFFFFFFFFFFFFFF8;
    uint64_t v30 = v113;
    unint64_t v95 = v22;
    unint64_t v107 = (char *)v29;
    while (v109)
    {
      uint64_t v31 = MEMORY[0x24C5D0A70](v18, v25);
      id v15 = v18 + 1;
      if (__OFADD__(v18, 1)) {
        goto LABEL_63;
      }
LABEL_35:
      self;
      uint64_t v32 = swift_dynamicCastObjCClass();
      if (v32)
      {
        uint64_t v33 = (void *)v32;
        uint64_t v113 = v30;
        id v110 = *(id *)(v104 + v102);
        uint64_t v111 = v15;
        uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B17B9E0);
        id v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56);
        v35(v17, 1, 1, v34);
        uint64_t v112 = v31;
        swift_unknownObjectRetain();
        id v36 = objc_msgSend(v33, sel_containerBundleIdentifier);
        uint64_t v37 = (uint64_t)v105;
        uint64_t v38 = (uint64_t)v17;
        if (v36)
        {
          unint64_t v39 = v36;
          sub_24A7DCA40();
          id v108 = v35;

          uint64_t v38 = (uint64_t)v17;
          sub_24A7DC950();
          sub_24A7CF1CC((uint64_t)v17);
          v108((char *)v37, 0, 1, v34);
          sub_24A7DC838(v37, (uint64_t)v17, &qword_26B17B9F0);
        }
        sub_24A7DCB80();
        id v40 = objc_msgSend(v33, sel_extensionBundleIdentifier);
        sub_24A7DCA40();

        sub_24A7DC950();
        sub_24A7DC7D4(v38, v37, &qword_26B17B9F0);
        unint64_t v41 = (void *)sub_24A7DCB70();
        id v108 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v33;
        id v42 = objc_msgSend(v33, sel_kind);
        uint64_t v43 = sub_24A7DCA40();
        uint64_t v45 = v44;

        id v46 = objc_msgSend(v110, sel_extensions);
        sub_24A7CAA58(0, &qword_26B17BA18);
        sub_24A7CE798();
        uint64_t v47 = sub_24A7DCB20();

        unint64_t v2 = v41;
        uint64_t v30 = v113;
        sub_24A7CEEB8(v47, (uint64_t)v2);
        uint64_t v49 = v48;
        swift_bridgeObjectRelease();

        id v17 = (char *)v38;
        if (!v49)
        {
          sub_24A7CF1CC(v38);
          swift_unknownObjectRelease_n();
          swift_bridgeObjectRelease();

          unint64_t v25 = v106;
          uint64_t v29 = (uint64_t)v107;
          id v15 = v111;
          goto LABEL_28;
        }
        id v50 = objc_msgSend(v49, sel_orderedControlDescriptors);
        id v15 = v111;
        if (!v50)
        {

          swift_bridgeObjectRelease();
          sub_24A7CF1CC((uint64_t)v17);
LABEL_49:
          swift_unknownObjectRelease_n();
          unint64_t v25 = v106;
          uint64_t v29 = (uint64_t)v107;
          goto LABEL_28;
        }
        uint64_t v51 = v50;
        sub_24A7CAA58(0, &qword_26B17BA28);
        unint64_t v52 = sub_24A7DCAD0();

        swift_bridgeObjectRetain();
        uint64_t v53 = sub_24A7CF22C(v52, v43, v45);
        id v17 = v101;
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease_n();
        sub_24A7CF1CC((uint64_t)v17);
        if (!v53) {
          goto LABEL_49;
        }
        id v54 = objc_msgSend(v53, sel_actionMetadata);
        unint64_t v25 = v106;
        uint64_t v29 = (uint64_t)v107;
        if (!v54)
        {

          swift_unknownObjectRelease_n();
          id v17 = v101;
          goto LABEL_28;
        }
        uint64_t v55 = v54;
        if ((objc_msgSend(v54, sel_isCameraCapture) & 1) == 0)
        {
          swift_unknownObjectRelease_n();

          id v17 = v101;
          goto LABEL_28;
        }
        uint64_t v56 = swift_unknownObjectRetain();
        if (v96)
        {
          MEMORY[0x24C5D08A0](v56);
          if (*(void *)((v115 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v115 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_24A7DCAF0();
          }
        }
        else
        {
          MEMORY[0x24C5D08A0](v56);
          if (*(void *)((v114 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v114 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_24A7DCAF0();
          }
        }
        unint64_t v2 = v108;
        sub_24A7DCB10();
        sub_24A7DCAE0();
        swift_unknownObjectRetain();
        char v57 = sub_24A7DB178(v2, (uint64_t)v125);

        swift_unknownObjectRelease_n();
        if (v98 != 1)
        {
          id v17 = v101;
          uint64_t v29 = (uint64_t)v107;
          goto LABEL_28;
        }
        id v17 = v101;
        if ((v57 & 1) == 0)
        {
          uint64_t v29 = (uint64_t)v107;
          goto LABEL_28;
        }
        int v87 = 1;
        unint64_t v86 = v95;
        uint64_t v18 = v15;
        uint64_t v29 = (uint64_t)v107;
        if (v15 == v107)
        {
          uint64_t v113 = v30;
          unint64_t v86 = v95;
          goto LABEL_5;
        }
      }
      else
      {
        swift_unknownObjectRelease();
LABEL_28:
        ++v18;
        if (v15 == (char *)v29)
        {
          uint64_t v113 = v30;
LABEL_5:
          uint64_t v18 = v91;
          unint64_t v2 = v92;
          id v15 = v105;
          goto LABEL_6;
        }
      }
    }
    if ((unint64_t)v18 >= *(void *)(v100 + 16)) {
      goto LABEL_64;
    }
    uint64_t v31 = *(void *)(v25 + 8 * (void)v18 + 32);
    swift_unknownObjectRetain();
    id v15 = v18 + 1;
    if (!__OFADD__(v18, 1)) {
      goto LABEL_35;
    }
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
LABEL_68:
    swift_bridgeObjectRetain();
  }
  int v87 = 0;
  unint64_t v86 = -1;
LABEL_70:
  swift_bridgeObjectRelease();
  sub_24A7DC838((uint64_t)v2, (uint64_t)v119, &qword_2697BE000);
  if ((void)v120)
  {
    v123[2] = v120;
    v123[3] = v121;
    uint64_t v124 = v122;
    v123[0] = v119[0];
    v123[1] = v119[1];
    unint64_t v59 = v115;
    sub_24A7DC708(v2, (void (*)(void, void, void, void, void, void, void, void, void))sub_24A7DC68C);
    uint64_t v60 = sub_24A7DA724(v59, (uint64_t)v123);
    sub_24A7DC708(v2, (void (*)(void, void, void, void, void, void, void, void, void))sub_24A7DC758);
    swift_bridgeObjectRelease();
    unint64_t v115 = v60;
  }
  swift_getKeyPath();
  uint64_t v61 = v79;
  sub_24A7DC9F0();
  uint64_t v62 = v81;
  uint64_t v63 = v82;
  (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v80, v61, v82);
  uint64_t v64 = v83;
  sub_24A7DC8E0();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v61, v63);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BE018);
  sub_24A7DC89C(&qword_2697BE020, &qword_2697BE018);
  sub_24A7DC89C(&qword_2697BE028, &qword_2697BE018);
  sub_24A7DC89C((unint64_t *)&unk_2697BE030, (uint64_t *)&unk_2697BE008);
  uint64_t v65 = v85;
  sub_24A7DC9E0();
  (*(void (**)(char *, uint64_t))(v84 + 8))(v64, v65);
  unint64_t v66 = swift_bridgeObjectRetain();
  sub_24A7D4480(v66);
  unint64_t v67 = swift_bridgeObjectRetain();
  sub_24A7D4480(v67);
  if (v87)
  {
    sub_24A7D4338(v86);
  }
  uint64_t result = sub_24A7DC838((uint64_t)v2, (uint64_t)v118, &qword_2697BE000);
  if (!v118[4])
  {
    __break(1u);
    goto LABEL_79;
  }
  if (!v88)
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  if (v78)
  {
    id v70 = v118[2];
    id v71 = v88;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v72 = objc_allocWithZone(MEMORY[0x263F791D0]);
    id v73 = (void *)sub_24A7DCA10();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDFF0);
    unint64_t v74 = (void *)sub_24A7DCAC0();
    swift_bridgeObjectRelease();
    unint64_t v75 = (void *)sub_24A7DCA10();
    id v76 = objc_msgSend(v72, sel_initWithCustomImage_iconBackgroundColor_displayName_galleryItems_vendorName_, v70, v71, v73, v74, v75);

    return (uint64_t)v76;
  }
LABEL_80:
  __break(1u);
  return result;
}

void sub_24A7D56E8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_sbh_appName);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_24A7DCA40();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_24A7D5750(uint64_t a1@<X8>)
{
  uint64_t v3 = MEMORY[0x24C5D11D0](v1 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
  if (!v3) {
    goto LABEL_16;
  }
  uint64_t v4 = (void *)v3;
  id v5 = *(id *)(v3 + OBJC_IVAR___CCUISControlsGalleryViewController_configuration);
  id v6 = objc_msgSend(v5, sel_suggestedControls);
  if (!v6)
  {

LABEL_16:
    id v21 = objc_msgSend(self, sel_systemPinkColor);
    id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
    id v23 = objc_msgSend(v22, sel_UUIDString);

    uint64_t v24 = sub_24A7DCA40();
    uint64_t v26 = v25;
    uint64_t v11 = &unk_26FE453C8;
LABEL_21:

    *(_OWORD *)a1 = xmmword_24A7DE5A0;
    *(void *)(a1 + 16) = 0;
    *(void *)(a1 + 24) = v21;
    *(void *)(a1 + 32) = v11;
    *(void *)(a1 + 40) = 0;
    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = v24;
    *(void *)(a1 + 64) = v26;
    return;
  }
  uint64_t v7 = v6;
  type metadata accessor for CCUISConfiguredControl();
  unint64_t v8 = sub_24A7DCAD0();

  if (v8 >> 62) {
    goto LABEL_18;
  }
  uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v9)
  {
LABEL_19:
    swift_bridgeObjectRelease();
    uint64_t v11 = (void *)MEMORY[0x263F8EE78];
LABEL_20:
    id v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
    id v23 = objc_msgSend(v27, sel_UUIDString);

    uint64_t v24 = sub_24A7DCA40();
    uint64_t v26 = v28;

    id v21 = 0;
    goto LABEL_21;
  }
  while (1)
  {
    uint64_t v44 = (void *)MEMORY[0x263F8EE78];
    sub_24A7D8FCC(0, v9 & ~(v9 >> 63), 0);
    if (v9 < 0) {
      break;
    }
    id v33 = v5;
    uint64_t v34 = v4;
    uint64_t v10 = 0;
    uint64_t v11 = v44;
    uint64_t v35 = a1;
    unint64_t v36 = v8 & 0xC000000000000001;
    id v5 = (id)v8;
    while (v9 != v10)
    {
      if (v36) {
        id v12 = (id)MEMORY[0x24C5D0A70](v10, v8);
      }
      else {
        id v12 = *(id *)(v8 + 8 * v10 + 32);
      }
      uint64_t v13 = v12;
      id v37 = v12;
      sub_24A7D5A78(&v37, (uint64_t)v38);

      a1 = v38[0];
      long long v14 = v39;
      long long v15 = v40;
      long long v16 = v41;
      long long v17 = v42;
      uint64_t v4 = v43;
      uint64_t v44 = v11;
      unint64_t v19 = v11[2];
      unint64_t v18 = v11[3];
      if (v19 >= v18 >> 1)
      {
        long long v31 = v40;
        long long v32 = v39;
        long long v29 = v42;
        long long v30 = v41;
        sub_24A7D8FCC((char *)(v18 > 1), v19 + 1, 1);
        long long v17 = v29;
        long long v16 = v30;
        long long v15 = v31;
        long long v14 = v32;
        uint64_t v11 = v44;
      }
      v11[2] = v19 + 1;
      uint64_t v20 = (char *)&v11[10 * v19];
      v20[32] = a1;
      ++v10;
      *(_OWORD *)(v20 + 40) = v14;
      *(_OWORD *)(v20 + 56) = v15;
      *(_OWORD *)(v20 + 72) = v16;
      *(_OWORD *)(v20 + 88) = v17;
      *((void *)v20 + 13) = v4;
      unint64_t v8 = (unint64_t)v5;
      if (v9 == v10)
      {
        swift_bridgeObjectRelease();
        uint64_t v4 = v34;
        a1 = v35;
        id v5 = v33;
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_24A7DCD10();
    swift_bridgeObjectRelease();
    if (!v9) {
      goto LABEL_19;
    }
  }
  __break(1u);
}

void sub_24A7D5A78(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = *a1;
  unint64_t v4 = (unint64_t)objc_msgSend(*a1, sel_size) - 1;
  if (v4 > 2) {
    id v5 = objc_msgSend(v3, sel_identity, 0);
  }
  else {
    id v5 = objc_msgSend(v3, sel_identity, qword_24A7DE660[v4]);
  }
  id v6 = v5;
  id v7 = objc_msgSend(v6, sel_extensionIdentity);

  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B17BA00);
  uint64_t v8 = sub_24A7DC960();
  uint64_t v10 = v9;
  swift_endAccess();

  id v11 = objc_msgSend(v3, sel_identity);
  id v12 = (char *)objc_msgSend(v11, sel_extensionIdentity);

  uint64_t v13 = &v12[*MEMORY[0x263F31DA0]];
  swift_beginAccess();
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B17B9E0);
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v13, 1, v14))
  {
    uint64_t v15 = sub_24A7DC960();
    uint64_t v16 = v17;
  }
  swift_endAccess();

  id v18 = objc_msgSend(v3, sel_identity);
  id v19 = objc_msgSend(v18, sel_kind);

  uint64_t v20 = sub_24A7DCA40();
  uint64_t v22 = v21;

  *(unsigned char *)a2 = 0;
  *(void *)(a2 + 8) = v23;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = v8;
  *(void *)(a2 + 40) = v10;
  *(void *)(a2 + 48) = v15;
  *(void *)(a2 + 56) = v16;
  *(void *)(a2 + 64) = v20;
  *(void *)(a2 + 72) = v22;
}

id sub_24A7D5CAC(void *a1)
{
  uint64_t v2 = v1;
  unint64_t v4 = (char *)objc_msgSend(a1, sel_extensionIdentity);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B17BA00);
  sub_24A7DC960();
  swift_endAccess();
  id v5 = &v4[*MEMORY[0x263F31DA0]];
  swift_beginAccess();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B17B9E0);
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6))
  {
    uint64_t v7 = sub_24A7DC960();
    uint64_t v8 = v9;
  }
  swift_endAccess();
  id v10 = objc_msgSend(a1, sel_kind);
  sub_24A7DCA40();

  id v11 = objc_msgSend(a1, sel_controlType);
  swift_bridgeObjectRetain();
  id v12 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  uint64_t v13 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  if (v8)
  {
    uint64_t v14 = (void *)sub_24A7DCA10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = objc_msgSend(objc_allocWithZone((Class)CCUIControlIconElement), sel_initWithKind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v12, v11, v13, v14);

  uint64_t v16 = MEMORY[0x24C5D11D0](v2 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    id v18 = *(id *)(v16 + OBJC_IVAR___CCUISControlsGalleryViewController_configuration);
    id v19 = (char *)objc_msgSend(a1, sel_preferredControlSize);
    uint64_t v20 = CCUISControlsGalleryConfiguration.allowedControlSizes.getter();
    if (!v20) {
      goto LABEL_13;
    }
    uint64_t v21 = v20;
    if (*(void *)(v20 + 16) && (sub_24A7D2F78((uint64_t)v19, v20) & 1) == 0) {
      id v19 = *(char **)(v21 + 32);
    }
    swift_bridgeObjectRelease();
    if ((unint64_t)(v19 - 1) < 3) {
      uint64_t v22 = qword_24A7DE660[(void)(v19 - 1)];
    }
    else {
LABEL_13:
    }
      uint64_t v22 = 0;
    id v23 = objc_msgSend(self, sel_sharedApplication);
    id v24 = objc_msgSend(v23, sel_preferredContentSizeCategory);

    LOBYTE(v23) = sub_24A7DCB90();
    objc_msgSend(v15, sel_setPreferredGallerySizeClass_, CCUIAdjustGridSizeClassForAccessibility(v22, v23 & 1));
  }
  sub_24A7D6024(a1, v7, v8);
  uint64_t v26 = v25;
  swift_bridgeObjectRelease();
  if (v26)
  {
    id v27 = (void *)sub_24A7DCA10();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v27 = 0;
  }
  objc_msgSend(v15, sel_setDisplayName_, v27);

  return v15;
}

uint64_t sub_24A7D6024(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_msgSend(a1, sel_displayName);
  if (v5)
  {
    id v6 = v5;
    a2 = sub_24A7DCA40();
  }
  else
  {
    if (!a3) {
      return a2;
    }
    sub_24A7CAA58(0, (unint64_t *)&unk_2697BDD20);
    swift_bridgeObjectRetain();
    id v7 = sub_24A7CA3A8(a2, a3, 1);
    uint64_t v9 = v7;
    if (!v7) {
      return 0;
    }
    id v6 = objc_msgSend(v7, sel_localizedName);
    a2 = sub_24A7DCA40();
  }
  return a2;
}

id sub_24A7D611C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (!v3) {
    return 0;
  }
  uint64_t v5 = a3 + 32;
  swift_bridgeObjectRetain();
  uint64_t v6 = 0;
  uint64_t v81 = v5;
  uint64_t v82 = v3;
  while (1)
  {
    id v7 = (long long *)(v5 + 72 * v6);
    uint64_t v96 = *((void *)v7 + 8);
    long long v8 = v7[3];
    long long v94 = v7[2];
    long long v95 = v8;
    long long v9 = v7[1];
    long long v92 = *v7;
    long long v93 = v9;
    uint64_t v10 = v94;
    v97[0] = v94;
    uint64_t v11 = *(void *)(v94 + 16);
    if (v11) {
      break;
    }
LABEL_4:
    if (++v6 == v3)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  uint64_t v84 = v6;
  uint64_t v83 = v95;
  long long v12 = v93;
  sub_24A7DC5AC((uint64_t)&v92);
  sub_24A7DC580((uint64_t)v97);
  uint64_t v13 = (void *)(v10 + 56);
  while (1)
  {
    uint64_t v14 = *(v13 - 2);
    uint64_t v15 = *v13;
    uint64_t v16 = v13[2];
    uint64_t v17 = v13[4];
    uint64_t v18 = v13[6];
    if (*((unsigned char *)v13 - 24) == 1)
    {
      uint64_t v89 = *(v13 - 1);
      self;
      uint64_t v19 = swift_dynamicCastObjCClass();
      if (v19)
      {
        uint64_t v20 = (void *)v19;
        uint64_t v88 = v14;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v21 = a1;
        id v22 = objc_msgSend(v20, sel_moduleIdentifier);
        uint64_t v23 = sub_24A7DCA40();
        uint64_t v25 = v24;

        if (v15)
        {
          if (v89 == v23 && v15 == v25)
          {
            unint64_t v51 = a2;
            uint64_t v31 = v21;
LABEL_49:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_unknownObjectRelease();
            goto LABEL_51;
          }
          char v27 = sub_24A7DCD80();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          a1 = v21;
          swift_unknownObjectRelease();
          if (v27)
          {
            unint64_t v51 = a2;
            uint64_t v31 = v21;
            goto LABEL_51;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          a1 = v21;
        }
      }
      goto LABEL_8;
    }
    uint64_t v90 = v13[1];
    uint64_t v86 = v13[3];
    uint64_t v28 = v13[5];
    self;
    uint64_t v29 = swift_dynamicCastObjCClass();
    if (!v29) {
      goto LABEL_8;
    }
    long long v30 = (void *)v29;
    uint64_t v85 = v28;
    uint64_t v88 = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v87 = v30;
    uint64_t v31 = a1;
    id v32 = objc_msgSend(v30, sel_extensionBundleIdentifier);
    uint64_t v33 = sub_24A7DCA40();
    uint64_t v35 = v34;

    if (!v16)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
LABEL_44:
      swift_bridgeObjectRelease();
      a1 = v31;
      goto LABEL_8;
    }
    if (v90 == v33 && v16 == v35)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v37 = sub_24A7DCD80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v37 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        goto LABEL_8;
      }
    }
    uint64_t v31 = a1;
    swift_bridgeObjectRetain();
    id v38 = objc_msgSend(v87, sel_containerBundleIdentifier);
    if (!v38)
    {
      uint64_t v43 = v87;
      if (!v17) {
        goto LABEL_39;
      }
      goto LABEL_35;
    }
    long long v39 = v38;
    uint64_t v40 = sub_24A7DCA40();
    uint64_t v42 = v41;

    if (v17) {
      break;
    }
    uint64_t v43 = v87;
    if (!v42) {
      goto LABEL_39;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    a1 = v31;
    swift_bridgeObjectRelease();
LABEL_8:
    v13 += 10;
    if (!--v11)
    {
      sub_24A7DC554((uint64_t)v97);
      sub_24A7DC614((uint64_t)&v92);
      uint64_t v5 = v81;
      uint64_t v3 = v82;
      uint64_t v6 = v84;
      goto LABEL_4;
    }
  }
  uint64_t v43 = v87;
  if (!v42)
  {
LABEL_35:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 = v31;
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease_n();
    goto LABEL_8;
  }
  if (v86 == v40 && v17 == v42)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_39;
  }
  char v44 = sub_24A7DCD80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v44 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_47;
  }
LABEL_39:
  swift_bridgeObjectRetain();
  id v45 = objc_msgSend(v43, sel_kind);
  uint64_t v46 = sub_24A7DCA40();
  uint64_t v47 = v18;
  uint64_t v49 = v48;

  if (!v47)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_47:
    swift_bridgeObjectRelease();
    a1 = v31;
    swift_unknownObjectRelease();
    goto LABEL_8;
  }
  if (v85 == v46 && v47 == v49)
  {
    unint64_t v51 = a2;
    goto LABEL_49;
  }
  char v50 = sub_24A7DCD80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if ((v50 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_44;
  }
  unint64_t v51 = a2;
LABEL_51:
  sub_24A7DC554((uint64_t)v97);
  id v52 = sub_24A7D7558(v31, v88);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24A7DC5AC((uint64_t)&v92);
  id v53 = sub_24A7DACE4(v51, (uint64_t)&v92);
  sub_24A7DC614((uint64_t)&v92);
  swift_bridgeObjectRelease();
  if (v53)
  {
    swift_unknownObjectRetain();
    id v54 = v53;
    id v55 = objc_msgSend(v54, sel_widgetDescriptors);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDFF0);
    uint64_t v56 = sub_24A7DCAD0();

    MEMORY[0x24C5D08A0]();
    if (*(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24A7DCAF0();
    }
    sub_24A7DCB10();
    sub_24A7DCAE0();
    char v57 = (void *)sub_24A7DCAC0();
    swift_bridgeObjectRelease();
    objc_msgSend(v54, sel_setWidgetDescriptors_, v57);
    swift_unknownObjectRelease();
    sub_24A7DC614((uint64_t)&v92);
  }
  else
  {
    if (v83)
    {
      id v58 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08C38]), sel_init);
      id v59 = objc_msgSend(v58, sel_UUIDString);

      sub_24A7DCA40();
      id v60 = objc_allocWithZone(MEMORY[0x263F792B8]);
      swift_bridgeObjectRetain();
      uint64_t v61 = (void *)sub_24A7DCA10();
      swift_bridgeObjectRelease();
      uint64_t v62 = (void *)sub_24A7DCA10();
      swift_bridgeObjectRelease();
      id v63 = objc_msgSend(v60, sel_initWithLeafIdentifier_applicationBundleID_, v61, v62);

      __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDFF8);
      uint64_t v64 = swift_allocObject();
      *(_OWORD *)(v64 + 16) = xmmword_24A7DE590;
      *(void *)(v64 + 32) = v52;
      sub_24A7DCAE0();
      id v65 = objc_allocWithZone(MEMORY[0x263F791D0]);
      id v66 = v63;
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDFF0);
      unint64_t v67 = (void *)sub_24A7DCAC0();
      swift_bridgeObjectRelease();
      id v68 = (void *)sub_24A7DCA10();
      id v69 = (void *)sub_24A7DCA10();
      swift_bridgeObjectRelease();
      id v53 = objc_msgSend(v65, sel_initWithIcon_galleryItems_vendorName_uniqueIdentifier_, v66, v67, v68, v69);
      swift_unknownObjectRelease();
    }
    else
    {
      if (*((void *)&v12 + 1))
      {
        id v91 = (id)v12;
        id v70 = (id)*((void *)&v12 + 1);
      }
      else
      {
        id v71 = self;
        id v91 = (id)v12;
        id v70 = objc_msgSend(v71, sel_systemPinkColor);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDFF8);
      uint64_t v72 = swift_allocObject();
      *(_OWORD *)(v72 + 16) = xmmword_24A7DE590;
      *(void *)(v72 + 32) = v52;
      sub_24A7DCAE0();
      id v73 = objc_allocWithZone(MEMORY[0x263F791D0]);
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();
      id v74 = *((id *)&v12 + 1);
      swift_bridgeObjectRetain();
      unint64_t v75 = (void *)sub_24A7DCA10();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDFF0);
      id v76 = (void *)sub_24A7DCAC0();
      swift_bridgeObjectRelease();
      unint64_t v77 = (void *)sub_24A7DCA10();
      uint64_t v78 = (void *)sub_24A7DCA10();
      swift_bridgeObjectRelease();
      id v53 = objc_msgSend(v73, sel_initWithCustomImage_iconBackgroundColor_displayName_galleryItems_vendorName_uniqueIdentifier_, v91, v70, v75, v76, v77, v78);
      swift_unknownObjectRelease();
    }
    sub_24A7DC614((uint64_t)&v92);
  }
  return v53;
}

id sub_24A7D6C7C(uint64_t a1, unint64_t a2)
{
  unint64_t v79 = MEMORY[0x263F8EE78];
  if (a2 >> 62) {
    goto LABEL_79;
  }
  uint64_t v2 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  uint64_t v3 = v2;
  if (!v2)
  {
LABEL_80:
    swift_bridgeObjectRelease();
    unint64_t v51 = MEMORY[0x263F8EE78];
    goto LABEL_81;
  }
LABEL_3:
  unint64_t v4 = 0;
  unint64_t v5 = a2;
  uint64_t v60 = v3;
  do
  {
    if ((a2 & 0xC000000000000001) != 0)
    {
      unint64_t v6 = v4;
      id v7 = (id)MEMORY[0x24C5D0A70](v4, v5);
    }
    else
    {
      if (v4 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_78;
      }
      unint64_t v6 = v4;
      id v7 = *(id *)(a2 + 32 + 8 * v4);
    }
    id v63 = v7;
    BOOL v8 = __OFADD__(v6, 1);
    unint64_t v9 = v6 + 1;
    if (v8) {
      goto LABEL_77;
    }
    unint64_t v62 = v9;
    id v10 = objc_msgSend(v7, sel_widgetDescriptors);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDFF0);
    unint64_t v11 = sub_24A7DCAD0();

    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_24A7DCD10();
      swift_bridgeObjectRelease();
      if (!v12) {
        goto LABEL_4;
      }
LABEL_12:
      unint64_t v13 = 0;
      v80[0] = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(v80[0] + 16);
      unint64_t v70 = v11 & 0xC000000000000001;
      unint64_t v64 = v11 + 32;
      uint64_t v65 = v11 & 0xFFFFFFFFFFFFFF8;
      uint64_t v68 = v14;
      uint64_t v69 = v80[0] + 56;
      uint64_t v66 = v12;
      unint64_t v67 = v11;
LABEL_16:
      if (v70)
      {
        uint64_t v15 = MEMORY[0x24C5D0A70](v13, v11);
        BOOL v8 = __OFADD__(v13++, 1);
        if (v8) {
          goto LABEL_75;
        }
      }
      else
      {
        if (v13 >= *(void *)(v65 + 16)) {
          goto LABEL_76;
        }
        uint64_t v15 = *(void *)(v64 + 8 * v13);
        swift_unknownObjectRetain();
        BOOL v8 = __OFADD__(v13++, 1);
        if (v8)
        {
LABEL_75:
          __break(1u);
LABEL_76:
          __break(1u);
LABEL_77:
          __break(1u);
LABEL_78:
          __break(1u);
LABEL_79:
          swift_bridgeObjectRetain();
          uint64_t v3 = sub_24A7DCD10();
          if (!v3) {
            goto LABEL_80;
          }
          goto LABEL_3;
        }
      }
      if (!v14) {
        goto LABEL_15;
      }
      unint64_t v71 = v13;
      swift_bridgeObjectRetain();
      uint64_t v16 = (void *)v69;
      while (1)
      {
        uint64_t v17 = *(v16 - 2);
        uint64_t v18 = *v16;
        uint64_t v19 = v16[2];
        uint64_t v20 = v16[4];
        uint64_t v21 = v16[6];
        if (*((unsigned char *)v16 - 24) == 1)
        {
          uint64_t v75 = *(v16 - 1);
          self;
          uint64_t v22 = swift_dynamicCastObjCClass();
          if (v22)
          {
            uint64_t v23 = (void *)v22;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_unknownObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            id v24 = objc_msgSend(v23, sel_moduleIdentifier);
            uint64_t v25 = sub_24A7DCA40();
            uint64_t v27 = v26;

            if (!v18) {
              goto LABEL_44;
            }
            if (v75 == v25 && v18 == v27)
            {
              uint64_t v12 = v66;
              unint64_t v11 = v67;
LABEL_66:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_unknownObjectRelease();
              goto LABEL_68;
            }
            char v29 = sub_24A7DCD80();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_unknownObjectRelease();
            if (v29) {
              goto LABEL_67;
            }
            goto LABEL_34;
          }
        }
        else
        {
          uint64_t v74 = v16[3];
          uint64_t v76 = v16[1];
          uint64_t v30 = v16[5];
          self;
          uint64_t v31 = swift_dynamicCastObjCClass();
          if (!v31) {
            goto LABEL_25;
          }
          id v32 = (void *)v31;
          uint64_t v72 = v30;
          uint64_t v78 = v17;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_unknownObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          id v73 = v32;
          id v33 = objc_msgSend(v32, sel_extensionBundleIdentifier);
          uint64_t v34 = sub_24A7DCA40();
          uint64_t v36 = v35;

          if (v19)
          {
            uint64_t v77 = v21;
            if (v76 == v34 && v19 == v36)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
            else
            {
              char v38 = sub_24A7DCD80();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v38 & 1) == 0) {
                goto LABEL_43;
              }
            }
            swift_bridgeObjectRetain();
            id v39 = objc_msgSend(v73, sel_containerBundleIdentifier);
            if (!v39)
            {
              uint64_t v17 = v78;
              if (v20)
              {
LABEL_54:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_unknownObjectRelease();
                swift_bridgeObjectRelease_n();
                goto LABEL_25;
              }
              goto LABEL_58;
            }
            uint64_t v40 = v39;
            uint64_t v41 = sub_24A7DCA40();
            uint64_t v43 = v42;

            uint64_t v17 = v78;
            if (v20)
            {
              if (!v43) {
                goto LABEL_54;
              }
              if (v74 == v41 && v20 == v43)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
              }
              else
              {
                char v44 = sub_24A7DCD80();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v44 & 1) == 0)
                {
LABEL_43:
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
LABEL_45:
                  swift_bridgeObjectRelease();
                  swift_unknownObjectRelease();
                  goto LABEL_25;
                }
              }
LABEL_58:
              swift_bridgeObjectRetain();
              id v45 = objc_msgSend(v73, sel_kind);
              uint64_t v46 = sub_24A7DCA40();
              uint64_t v48 = v47;

              if (!v77)
              {
LABEL_44:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                goto LABEL_45;
              }
              if (v72 == v46 && v77 == v48)
              {
                uint64_t v12 = v66;
                unint64_t v11 = v67;
                goto LABEL_66;
              }
              char v49 = sub_24A7DCD80();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_unknownObjectRelease();
              if (v49)
              {
LABEL_67:
                uint64_t v12 = v66;
                unint64_t v11 = v67;
LABEL_68:
                sub_24A7DC554((uint64_t)v80);
                sub_24A7D7558(v15, v17);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v50 = swift_unknownObjectRetain();
                MEMORY[0x24C5D08A0](v50);
                if (*(void *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                  sub_24A7DCAF0();
                }
                sub_24A7DCB10();
                sub_24A7DCAE0();
                swift_unknownObjectRelease();
LABEL_14:
                unint64_t v13 = v71;
                uint64_t v14 = v68;
LABEL_15:
                swift_unknownObjectRelease();
                if (v13 == v12) {
                  goto LABEL_4;
                }
                goto LABEL_16;
              }
LABEL_34:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
            else
            {
              if (!v43) {
                goto LABEL_58;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_unknownObjectRelease();
            }
            swift_bridgeObjectRelease();
            goto LABEL_25;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
        }
LABEL_25:
        v16 += 10;
        if (!--v14)
        {
          sub_24A7DC554((uint64_t)v80);
          uint64_t v12 = v66;
          unint64_t v11 = v67;
          goto LABEL_14;
        }
      }
    }
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v12) {
      goto LABEL_12;
    }
LABEL_4:

    swift_bridgeObjectRelease();
    unint64_t v4 = v62;
    unint64_t v5 = a2;
  }
  while (v62 != v60);
  swift_bridgeObjectRelease();
  unint64_t v51 = v79;
LABEL_81:
  sub_24A7DA724(v51, a1);
  swift_bridgeObjectRelease();
  id v52 = objc_msgSend(self, sel_systemPinkColor);
  id v53 = objc_allocWithZone(MEMORY[0x263F791D0]);
  id v54 = (void *)sub_24A7DCA10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDFF0);
  id v55 = (void *)sub_24A7DCAC0();
  swift_bridgeObjectRelease();
  uint64_t v56 = (void *)sub_24A7DCA10();
  id v57 = objc_msgSend(v53, sel_initWithCustomImage_iconBackgroundColor_displayName_galleryItems_vendorName_, 0, v52, v54, v55, v56);

  return v57;
}

id sub_24A7D7558(uint64_t a1, uint64_t a2)
{
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    unint64_t v6 = (void *)v5;
    uint64_t v7 = OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_moduleUniqueIdentifiers;
    if (*(void *)(v2 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_moduleUniqueIdentifiers)) {
      BOOL v8 = *(char **)(v2 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_moduleUniqueIdentifiers);
    }
    else {
      BOOL v8 = (char *)MEMORY[0x263F8EE78];
    }
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v9 = objc_msgSend(v6, sel_uniqueIdentifier);
    uint64_t v10 = sub_24A7DCA40();
    uint64_t v12 = v11;

    LOBYTE(v9) = sub_24A7D2FDC(v10, v12, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v9)
    {
      id v13 = objc_msgSend(v6, sel_copyWithUniqueIdentifier);
    }
    else
    {
      objc_msgSend(v6, sel_copy);
      sub_24A7DCC20();
      swift_unknownObjectRelease();
      type metadata accessor for CCUIModuleIconElement(0);
      if (swift_dynamicCast())
      {
        id v13 = v58;
      }
      else
      {
        swift_unknownObjectRetain();
        id v13 = v6;
      }
    }
    id v22 = objc_msgSend(v13, sel_uniqueIdentifier, a2);
    uint64_t v23 = sub_24A7DCA40();
    uint64_t v25 = v24;

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      BOOL v8 = sub_24A7D01E8(0, *((void *)v8 + 2) + 1, 1, v8);
    }
    unint64_t v27 = *((void *)v8 + 2);
    unint64_t v26 = *((void *)v8 + 3);
    if (v27 >= v26 >> 1) {
      BOOL v8 = sub_24A7D01E8((char *)(v26 > 1), v27 + 1, 1, v8);
    }
    *((void *)v8 + 2) = v27 + 1;
    uint64_t v28 = &v8[16 * v27];
    *((void *)v28 + 4) = v23;
    *((void *)v28 + 5) = v25;
    *(void *)(v2 + v7) = v8;
    swift_bridgeObjectRelease();
    unsigned int v29 = objc_msgSend(v13, sel_expandsGridSizeClassesForAccessibility);
    uint64_t v30 = v57;
    if (v29)
    {
      id v31 = objc_msgSend(self, sel_sharedApplication);
      id v32 = objc_msgSend(v31, sel_preferredContentSizeCategory);

      LOBYTE(v31) = sub_24A7DCB90();
      uint64_t v30 = CCUIAdjustGridSizeClassForAccessibility(v57, v31 & 1);
    }
    objc_msgSend(v13, sel_setPreferredGallerySizeClass_, v30);
    id v33 = objc_msgSend(v6, sel_moduleIdentifier);
    uint64_t v34 = sub_24A7DCA40();
    uint64_t v36 = v35;

    if (v34 == 0xD000000000000026 && v36 == 0x800000024A7DFDA0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v37 = sub_24A7DCD80();
      swift_bridgeObjectRelease();
      if ((v37 & 1) == 0) {
        goto LABEL_32;
      }
    }
    if (v57 == 2)
    {
      if (qword_2697BD3E0 != -1) {
        swift_once();
      }
      char v38 = (void *)qword_2697BEC68;
      id v39 = (void *)sub_24A7DCA10();
      id v40 = objc_msgSend(v38, sel_localizedStringForKey_value_table_, v39, 0, 0);

      sub_24A7DCA40();
      uint64_t v41 = (void *)sub_24A7DCA10();
      swift_bridgeObjectRelease();
      objc_msgSend(v13, sel_setDisplayName_, v41);
    }
LABEL_32:
    id v42 = objc_msgSend(v6, sel_moduleIdentifier);
    uint64_t v43 = sub_24A7DCA40();
    uint64_t v45 = v44;

    if (v43 == 0xD000000000000023 && v45 == 0x800000024A7DECF0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v46 = sub_24A7DCD80();
      swift_bridgeObjectRelease();
      if ((v46 & 1) == 0) {
        goto LABEL_44;
      }
    }
    uint64_t v47 = (void *)sub_24A7DCA10();
    char v48 = MGGetBoolAnswer();

    if (v48)
    {
      if (qword_2697BD3E0 != -1) {
        swift_once();
      }
      char v49 = (void *)qword_2697BEC68;
      uint64_t v50 = (void *)sub_24A7DCA10();
      id v51 = objc_msgSend(v49, sel_localizedStringForKey_value_table_, v50, 0, 0);

      sub_24A7DCA40();
      id v17 = (id)sub_24A7DCA10();
      swift_bridgeObjectRelease();
      objc_msgSend(v13, sel_setDisplayName_, v17);
LABEL_43:
    }
LABEL_44:
    swift_unknownObjectRelease();
    return v13;
  }
  self;
  uint64_t v14 = (void *)swift_dynamicCastObjCClass();
  swift_unknownObjectRetain();
  if (v14)
  {
    id v13 = objc_msgSend(v14, sel_copyWithUniqueIdentifier);
    uint64_t v15 = MEMORY[0x24C5D11D0](v2 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
    if (!v15)
    {
      id v55 = objc_msgSend(self, sel_sharedApplication);
      id v56 = objc_msgSend(v55, sel_preferredContentSizeCategory);

      LOBYTE(v55) = sub_24A7DCB90();
      objc_msgSend(v13, sel_setPreferredGallerySizeClass_, CCUIAdjustGridSizeClassForAccessibility(a2, v55 & 1));
      goto LABEL_44;
    }
    uint64_t v16 = (void *)v15;
    id v17 = *(id *)(v15 + OBJC_IVAR___CCUISControlsGalleryViewController_configuration);
    uint64_t v18 = sub_24A7DCB50();
    uint64_t v19 = CCUISControlsGalleryConfiguration.allowedControlSizes.getter();
    if (!v19) {
      goto LABEL_41;
    }
    uint64_t v20 = v19;
    if (*(void *)(v19 + 16) && (sub_24A7D2F78(v18, v19) & 1) == 0) {
      uint64_t v18 = *(void *)(v20 + 32);
    }
    swift_bridgeObjectRelease();
    if ((unint64_t)(v18 - 1) < 3) {
      uint64_t v21 = qword_24A7DE660[v18 - 1];
    }
    else {
LABEL_41:
    }
      uint64_t v21 = 0;
    id v52 = objc_msgSend(v16, sel_traitCollection);
    id v53 = objc_msgSend(v52, sel_preferredContentSizeCategory);

    LOBYTE(v52) = sub_24A7DCB90();
    objc_msgSend(v13, sel_setPreferredGallerySizeClass_, CCUIAdjustGridSizeClassForAccessibility(v21, v52 & 1));

    goto LABEL_43;
  }
  return (id)a1;
}

id sub_24A7D7C78()
{
  uint64_t v1 = OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager____lazy_storage___moduleContentMetrics;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager____lazy_storage___moduleContentMetrics);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager____lazy_storage___moduleContentMetrics);
  }
  else
  {
    uint64_t v4 = v0;
    id v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ControlsGalleryIconListLayout()), sel_init);
    unint64_t v6 = SBHIconGridSizeClassForCCUIGridSizeClass(0);
    double v7 = sub_24A7CCC74(v6);

    sub_24A7CCF18();
    id v9 = objc_msgSend(self, sel_defaultMetricsForGridGeometryInfo_, v7, v8);

    uint64_t v10 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = v9;
    id v3 = v9;

    uint64_t v2 = 0;
  }
  id v11 = v2;
  return v3;
}

uint64_t sub_24A7D7E3C()
{
  sub_24A7CC544(v0 + 16);

  return MEMORY[0x270FA0228](v0, 32, 7);
}

id sub_24A7D7EAC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ControlsGalleryManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ControlsGalleryManager()
{
  return self;
}

uint64_t type metadata accessor for ControlsGalleryManager.IconViewProvider()
{
  return self;
}

id sub_24A7D8038(void *a1)
{
  uint64_t v2 = v1;
  id v3 = objc_msgSend(a1, sel_icon);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (!v5)
  {

    return 0;
  }
  unint64_t v6 = (void *)v5;
  id v7 = v4;
  if (!objc_msgSend(v6, sel_activeDataSource))
  {
LABEL_17:

    return 0;
  }
  self;
  uint64_t v8 = swift_dynamicCastObjCClass();
  if (v8)
  {
    id v9 = (void *)v8;
    swift_unknownObjectRetain();
    uint64_t v10 = CHSWidgetExtensionProvider.controlDescriptor(for:)(v9);
    if (v10)
    {
      id v11 = v10;
      id v12 = objc_msgSend(v10, sel_extensionIdentity);
      id v13 = objc_msgSend(v11, sel_kind);
      sub_24A7DCA40();

      id v14 = objc_msgSend(v11, sel_defaultIntentReference);
      id v15 = objc_allocWithZone(MEMORY[0x263F31DF8]);
      uint64_t v16 = (void *)sub_24A7DCA10();
      swift_bridgeObjectRelease();
      id v17 = objc_msgSend(v15, sel_initWithExtensionIdentity_kind_intentReference_, v12, v16, v14);

      id v18 = v17;
      id v19 = objc_msgSend(v9, sel_controlType);
      id v20 = objc_msgSend(v9, sel_uniqueIdentifier);
      sub_24A7DCA40();

      id v21 = objc_allocWithZone(MEMORY[0x263F33CA8]);
      id v22 = (void *)sub_24A7DCA10();
      swift_bridgeObjectRelease();
      id v23 = objc_msgSend(v21, sel_initWithIdentity_type_contentType_configurationIdentifier_, v18, v19, 1, v22);

      id v24 = objc_msgSend(v7, sel_gridSizeClass);
      uint64_t v25 = CCUIGridSizeClassForSBHIconGridSizeClass(v24, 1);

      objc_msgSend(v23, sel_setGridSizeClass_, v25);
      id v26 = sub_24A7D7C78();
      objc_msgSend(v23, sel_setContentMetrics_, v26);

      objc_msgSend(v23, sel_setDelegate_, v2);
      unint64_t v27 = (objc_class *)type metadata accessor for ControlContainerViewController();
      uint64_t v28 = objc_allocWithZone(v27);
      v28[OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_showsSquareCorners] = 0;
      *(void *)&v28[OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_controlViewController] = v23;
      unsigned int v29 = &v28[OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_iconImageInfo];
      *unsigned int v29 = 0u;
      v29[1] = 0u;
      v43.receiver = v28;
      v43.super_class = v27;
      id v30 = v23;
      id v31 = objc_msgSendSuper2(&v43, sel_initWithNibName_bundle_, 0, 0);
      id result = objc_msgSend(v31, sel_view);
      if (result)
      {
        id v33 = result;
        objc_msgSend(result, sel__controlCenterApplyGalleryModuleBackgroundMaterial);

        swift_unknownObjectRelease_n();
LABEL_13:

        return v31;
      }
      __break(1u);
      goto LABEL_21;
    }

    swift_unknownObjectRelease_n();
    return 0;
  }
  uint64_t v34 = MEMORY[0x24C5D11D0](v1 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
  if (!v34)
  {
LABEL_16:
    swift_unknownObjectRelease();
    goto LABEL_17;
  }
  uint64_t v35 = (void *)v34;
  sub_24A7CAA58(0, &qword_2697BDF28);
  uint64_t v36 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = v36;
  *(void *)(v37 + 24) = v6;
  id v7 = v7;
  char v38 = (void *)sub_24A7DCBF0();
  id v39 = objc_msgSend(v35, sel_customItemsDelegate, 0, 0, 0, sub_24A7DC54C, v37);
  if (!v39)
  {

    goto LABEL_16;
  }
  id v40 = v39;
  id v41 = sub_24A7D7C78();
  id v31 = objc_msgSend(v40, sel_controlsGalleryViewController_customImageViewControllerForWidgetIcon_withPrimaryAction_contentMetrics_, v35, v6, v38, v41);
  swift_unknownObjectRelease();

  id result = objc_msgSend(v31, sel_view);
  if (result)
  {
    id v42 = result;
    objc_msgSend(result, sel__controlCenterApplyGalleryModuleBackgroundMaterial);

    swift_unknownObjectRelease();
    goto LABEL_13;
  }
LABEL_21:
  __break(1u);
  return result;
}

void sub_24A7D85C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x24C5D11D0](v4);
  if (v5)
  {
    unint64_t v6 = (void *)v5;
    id v7 = (void *)MEMORY[0x24C5D11D0](v5 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);

    if (v7)
    {
      id v8 = objc_msgSend(v7, sel_customItemsDelegate);
      if (v8)
      {
        objc_msgSend(v8, sel_controlsGalleryViewController_didFinishWithWidgetIcon_, v7, a3);

        swift_unknownObjectRelease();
      }
      else
      {
      }
    }
  }
}

uint64_t sub_24A7D86DC(void *a1)
{
  uint64_t v3 = MEMORY[0x24C5D11D0](v1 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    id v5 = objc_msgSend(a1, sel_identity);
    id v6 = objc_msgSend(a1, sel_type);
    objc_msgSend(a1, sel_gridSizeClass);
    id v7 = objc_msgSend(objc_allocWithZone((Class)CCUISConfiguredControl), sel_initWithIdentity_type_size_, v5, v6, sub_24A7DCB50());

    id v8 = *(void **)(v1 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_extensionProvider);
    id v9 = objc_msgSend(v7, sel_identity);
    id v10 = objc_msgSend(v8, sel_controlDescriptorForControl_, v9);

    if (v10)
    {
      id v11 = v7;
      id v12 = objc_msgSend(objc_allocWithZone((Class)CCUISControlsGalleryResult), sel_initWithControl_promptsForUserConfiguration_, v11, objc_msgSend(v10, sel_promptsForUserConfiguration));

      id v13 = v12;
      id v14 = objc_msgSend(v4, sel_delegate);
      if (v14)
      {
        objc_msgSend(v14, sel_controlsGalleryViewController_didFinishWithResult_error_, v4, v13, 0);

        swift_unknownObjectRelease();
      }
      else
      {
        objc_msgSend(v4, sel_dismissViewControllerAnimated_completion_, 1, 0);
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDF10);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_24A7DE510;
      *(void *)(inited + 32) = sub_24A7DCA40();
      *(void *)(inited + 40) = v16;
      *(void *)(inited + 72) = MEMORY[0x263F8D310];
      *(void *)(inited + 48) = 0xD000000000000014;
      *(void *)(inited + 56) = 0x800000024A7E1E70;
      sub_24A7D2E40(inited);
      id v17 = objc_allocWithZone(MEMORY[0x263F087E8]);
      if (qword_2697BD3F0 != -1) {
        swift_once();
      }
      uint64_t v18 = qword_2697BEC70;
      id v19 = (void *)sub_24A7DC9B0();
      swift_bridgeObjectRelease();
      id v20 = objc_msgSend(v17, sel_initWithDomain_code_userInfo_, v18, 1001, v19);

      id v21 = objc_msgSend(v4, sel_delegate);
      if (v21)
      {
        id v22 = v21;
        id v23 = (void *)sub_24A7DC8F0();
        objc_msgSend(v22, sel_controlsGalleryViewController_didFinishWithResult_error_, v4, 0, v23);

        swift_unknownObjectRelease();
      }
      else
      {
        objc_msgSend(v4, sel_dismissViewControllerAnimated_completion_, 1, 0);
      }
    }
  }
  return 0;
}

unint64_t sub_24A7D8C64(uint64_t a1, uint64_t a2)
{
  sub_24A7DCDA0();
  sub_24A7DCA50();
  uint64_t v4 = sub_24A7DCDC0();
  return sub_24A7D8D70(a1, a2, v4);
}

unint64_t sub_24A7D8CDC(uint64_t a1)
{
  sub_24A7DCA40();
  sub_24A7DCDA0();
  sub_24A7DCA50();
  uint64_t v2 = sub_24A7DCDC0();
  swift_bridgeObjectRelease();
  return sub_24A7D8E54(a1, v2);
}

unint64_t sub_24A7D8D70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24A7DCD80() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24A7DCD80() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24A7D8E54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_24A7DCA40();
    uint64_t v8 = v7;
    if (v6 == sub_24A7DCA40() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_24A7DCD80();
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
          uint64_t v13 = sub_24A7DCA40();
          uint64_t v15 = v14;
          if (v13 == sub_24A7DCA40() && v15 == v16) {
            break;
          }
          char v18 = sub_24A7DCD80();
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

char *sub_24A7D8FCC(char *a1, int64_t a2, char a3)
{
  id result = sub_24A7D8FEC(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_24A7D8FEC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697BD538);
    id v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 80);
  }
  else
  {
    id v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[80 * v8]) {
      memmove(v12, v13, 80 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_24A7D9104(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = a1[1];
  uint64_t result = sub_24A7DCD60();
  if (result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_147;
    }
    if (v4) {
      return sub_24A7D9A0C(0, v4, 1, a1);
    }
    return result;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_146;
  }
  uint64_t v7 = result;
  id v108 = a1;
  if (v4 <= 1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    uint64_t v121 = MEMORY[0x263F8EE78];
    id v119 = (id *)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      if (v12 < 2) {
        goto LABEL_123;
      }
      goto LABEL_110;
    }
  }
  else
  {
    uint64_t v8 = v6 >> 1;
    sub_24A7CAA58(0, &qword_2697BDBF0);
    uint64_t result = sub_24A7DCB00();
    *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    id v119 = (id *)((result & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v121 = result;
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v110 = *a1 + 16;
  uint64_t v111 = v7;
  uint64_t v109 = *a1 - 8;
  uint64_t v9 = MEMORY[0x263F8EE78];
  uint64_t v120 = *a1;
  uint64_t v116 = v4;
  while (1)
  {
    uint64_t v13 = v10++;
    uint64_t v115 = v13;
    if (v10 < v4)
    {
      uint64_t v112 = v9;
      uint64_t v14 = *(void **)(v11 + 8 * v13);
      id v15 = *(id *)(v11 + 8 * v10);
      id v16 = v14;
      id v17 = objc_msgSend(v15, sel_displayName);
      if (v17)
      {
        char v18 = v17;
        sub_24A7DCA40();
      }
      id v19 = objc_msgSend(v16, sel_displayName, v108);
      if (v19)
      {
        id v20 = v19;
        sub_24A7DCA40();
      }
      sub_24A7CA890();
      uint64_t v117 = sub_24A7DCC00();

      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = v13 + 2;
      if (v13 + 2 < v116)
      {
        id v21 = (id *)(v110 + 8 * v13);
        while (1)
        {
          id v22 = *(v21 - 1);
          id v23 = *v21;
          id v24 = v22;
          id v25 = objc_msgSend(v23, sel_displayName);
          if (v25)
          {
            id v26 = v25;
            sub_24A7DCA40();
          }
          id v27 = objc_msgSend(v24, sel_displayName);
          if (v27)
          {
            uint64_t v28 = v27;
            sub_24A7DCA40();
          }
          uint64_t v29 = sub_24A7DCC00();

          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if ((v117 == -1) == (v29 != -1)) {
            break;
          }
          ++v10;
          ++v21;
          if (v116 == v10)
          {
            uint64_t v10 = v116;
            break;
          }
        }
        uint64_t v13 = v115;
      }
      uint64_t v9 = v112;
      uint64_t v11 = v120;
      if (v117 == -1)
      {
        if (v10 < v13) {
          goto LABEL_150;
        }
        if (v13 < v10)
        {
          id v30 = (uint64_t *)(v109 + 8 * v10);
          uint64_t v31 = v10;
          uint64_t v32 = v13;
          id v33 = (uint64_t *)(v120 + 8 * v13);
          do
          {
            if (v32 != --v31)
            {
              if (!v120) {
                goto LABEL_153;
              }
              uint64_t v34 = *v33;
              uint64_t *v33 = *v30;
              *id v30 = v34;
            }
            ++v32;
            --v30;
            ++v33;
          }
          while (v32 < v31);
        }
      }
    }
    if (v10 >= v116) {
      goto LABEL_60;
    }
    if (__OFSUB__(v10, v13)) {
      goto LABEL_145;
    }
    if (v10 - v13 >= v111) {
      goto LABEL_60;
    }
    if (__OFADD__(v13, v111)) {
      goto LABEL_148;
    }
    uint64_t v35 = v116;
    if (v13 + v111 < v116) {
      uint64_t v35 = v13 + v111;
    }
    if (v35 < v13) {
      break;
    }
    if (v10 != v35)
    {
      uint64_t v113 = v9;
      uint64_t v114 = v35;
      uint64_t v36 = v109 + 8 * v10;
      do
      {
        uint64_t v37 = v36;
        char v38 = *(void **)(v11 + 8 * v10);
        uint64_t v39 = v13;
        uint64_t v118 = v37;
        uint64_t v40 = v37;
        while (1)
        {
          id v41 = *(void **)v40;
          id v42 = v38;
          id v43 = v41;
          id v44 = objc_msgSend(v42, sel_displayName);
          if (v44)
          {
            uint64_t v45 = v44;
            sub_24A7DCA40();
          }
          id v46 = objc_msgSend(v43, sel_displayName, v108);
          if (v46)
          {
            uint64_t v47 = v46;
            sub_24A7DCA40();
          }
          sub_24A7CA890();
          uint64_t v48 = sub_24A7DCC00();

          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v48 != -1) {
            break;
          }
          uint64_t v11 = v120;
          if (!v120) {
            goto LABEL_151;
          }
          char v49 = *(void **)v40;
          char v38 = *(void **)(v40 + 8);
          *(void *)uint64_t v40 = v38;
          *(void *)(v40 + 8) = v49;
          v40 -= 8;
          if (v10 == ++v39) {
            goto LABEL_49;
          }
        }
        uint64_t v11 = v120;
LABEL_49:
        ++v10;
        uint64_t v36 = v118 + 8;
        uint64_t v13 = v115;
      }
      while (v10 != v114);
      uint64_t v10 = v114;
      uint64_t v9 = v113;
    }
LABEL_60:
    if (v10 < v13) {
      goto LABEL_140;
    }
    uint64_t v50 = v9;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if (result)
    {
      uint64_t v9 = v50;
    }
    else
    {
      uint64_t result = (uint64_t)sub_24A7D9FC4(0, *(void *)(v50 + 16) + 1, 1, (char *)v50);
      uint64_t v9 = result;
    }
    unint64_t v52 = *(void *)(v9 + 16);
    unint64_t v51 = *(void *)(v9 + 24);
    unint64_t v12 = v52 + 1;
    uint64_t v11 = v120;
    if (v52 >= v51 >> 1)
    {
      uint64_t result = (uint64_t)sub_24A7D9FC4((char *)(v51 > 1), v52 + 1, 1, (char *)v9);
      uint64_t v11 = v120;
      uint64_t v9 = result;
    }
    *(void *)(v9 + 16) = v12;
    uint64_t v53 = v9 + 32;
    id v54 = (uint64_t *)(v9 + 32 + 16 * v52);
    *id v54 = v13;
    v54[1] = v10;
    if (v52)
    {
      while (1)
      {
        unint64_t v55 = v12 - 1;
        if (v12 >= 4)
        {
          unint64_t v60 = v53 + 16 * v12;
          uint64_t v61 = *(void *)(v60 - 64);
          uint64_t v62 = *(void *)(v60 - 56);
          BOOL v66 = __OFSUB__(v62, v61);
          uint64_t v63 = v62 - v61;
          if (v66) {
            goto LABEL_129;
          }
          uint64_t v65 = *(void *)(v60 - 48);
          uint64_t v64 = *(void *)(v60 - 40);
          BOOL v66 = __OFSUB__(v64, v65);
          uint64_t v58 = v64 - v65;
          char v59 = v66;
          if (v66) {
            goto LABEL_130;
          }
          unint64_t v67 = v12 - 2;
          uint64_t v68 = (uint64_t *)(v53 + 16 * (v12 - 2));
          uint64_t v70 = *v68;
          uint64_t v69 = v68[1];
          BOOL v66 = __OFSUB__(v69, v70);
          uint64_t v71 = v69 - v70;
          if (v66) {
            goto LABEL_131;
          }
          BOOL v66 = __OFADD__(v58, v71);
          uint64_t v72 = v58 + v71;
          if (v66) {
            goto LABEL_133;
          }
          if (v72 >= v63)
          {
            uint64_t v90 = (uint64_t *)(v53 + 16 * v55);
            uint64_t v92 = *v90;
            uint64_t v91 = v90[1];
            BOOL v66 = __OFSUB__(v91, v92);
            uint64_t v93 = v91 - v92;
            if (v66) {
              goto LABEL_139;
            }
            BOOL v83 = v58 < v93;
            goto LABEL_97;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v84 = *(void *)(v9 + 32);
            uint64_t v85 = *(void *)(v9 + 40);
            BOOL v66 = __OFSUB__(v85, v84);
            uint64_t v77 = v85 - v84;
            char v78 = v66;
            goto LABEL_91;
          }
          uint64_t v57 = *(void *)(v9 + 32);
          uint64_t v56 = *(void *)(v9 + 40);
          BOOL v66 = __OFSUB__(v56, v57);
          uint64_t v58 = v56 - v57;
          char v59 = v66;
        }
        if (v59) {
          goto LABEL_132;
        }
        unint64_t v67 = v12 - 2;
        id v73 = (uint64_t *)(v53 + 16 * (v12 - 2));
        uint64_t v75 = *v73;
        uint64_t v74 = v73[1];
        BOOL v76 = __OFSUB__(v74, v75);
        uint64_t v77 = v74 - v75;
        char v78 = v76;
        if (v76) {
          goto LABEL_134;
        }
        unint64_t v79 = (uint64_t *)(v53 + 16 * v55);
        uint64_t v81 = *v79;
        uint64_t v80 = v79[1];
        BOOL v66 = __OFSUB__(v80, v81);
        uint64_t v82 = v80 - v81;
        if (v66) {
          goto LABEL_136;
        }
        if (__OFADD__(v77, v82)) {
          goto LABEL_138;
        }
        if (v77 + v82 >= v58)
        {
          BOOL v83 = v58 < v82;
LABEL_97:
          if (v83) {
            unint64_t v55 = v67;
          }
          goto LABEL_99;
        }
LABEL_91:
        if (v78) {
          goto LABEL_135;
        }
        uint64_t v86 = (uint64_t *)(v53 + 16 * v55);
        uint64_t v88 = *v86;
        uint64_t v87 = v86[1];
        BOOL v66 = __OFSUB__(v87, v88);
        uint64_t v89 = v87 - v88;
        if (v66) {
          goto LABEL_137;
        }
        if (v89 < v77) {
          goto LABEL_14;
        }
LABEL_99:
        unint64_t v94 = v55 - 1;
        if (v55 - 1 >= v12)
        {
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
          goto LABEL_149;
        }
        if (!v11) {
          goto LABEL_152;
        }
        uint64_t v95 = v9;
        uint64_t v96 = (uint64_t *)(v53 + 16 * v94);
        uint64_t v97 = *v96;
        uint64_t v98 = (void *)(v53 + 16 * v55);
        uint64_t v99 = v98[1];
        uint64_t result = sub_24A7D9BAC((id *)(v11 + 8 * *v96), (id *)(v11 + 8 * *v98), v11 + 8 * v99, v119);
        if (v1) {
          goto LABEL_123;
        }
        if (v99 < v97) {
          goto LABEL_126;
        }
        if (v55 > *(void *)(v95 + 16)) {
          goto LABEL_127;
        }
        uint64_t *v96 = v97;
        *(void *)(v53 + 16 * v94 + 8) = v99;
        unint64_t v100 = *(void *)(v95 + 16);
        if (v55 >= v100) {
          goto LABEL_128;
        }
        unint64_t v12 = v100 - 1;
        uint64_t result = (uint64_t)memmove((void *)(v53 + 16 * v55), v98 + 2, 16 * (v100 - 1 - v55));
        uint64_t v9 = v95;
        *(void *)(v95 + 16) = v100 - 1;
        uint64_t v11 = v120;
        if (v100 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_14:
    uint64_t v4 = v116;
    if (v10 >= v116)
    {
      uint64_t v2 = v1;
      if (v12 < 2)
      {
LABEL_123:
        swift_bridgeObjectRelease();
        *(void *)((v121 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
        sub_24A7DCAE0();
        return swift_bridgeObjectRelease();
      }
LABEL_110:
      uint64_t v101 = *v108;
      while (1)
      {
        unint64_t v102 = v12 - 2;
        if (v12 < 2) {
          goto LABEL_141;
        }
        if (!v101) {
          goto LABEL_154;
        }
        uint64_t v103 = v9;
        uint64_t v104 = *(void *)(v9 + 32 + 16 * v102);
        uint64_t v105 = *(void *)(v9 + 32 + 16 * (v12 - 1) + 8);
        uint64_t result = sub_24A7D9BAC((id *)(v101 + 8 * v104), (id *)(v101 + 8 * *(void *)(v9 + 32 + 16 * (v12 - 1))), v101 + 8 * v105, v119);
        if (v2) {
          goto LABEL_123;
        }
        if (v105 < v104) {
          goto LABEL_142;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_24A7DA0C0(v103);
          uint64_t v103 = result;
        }
        if (v102 >= *(void *)(v103 + 16)) {
          goto LABEL_143;
        }
        unint64_t v106 = (void *)(v103 + 32 + 16 * v102);
        *unint64_t v106 = v104;
        v106[1] = v105;
        unint64_t v107 = *(void *)(v103 + 16);
        if (v12 > v107) {
          goto LABEL_144;
        }
        uint64_t result = (uint64_t)memmove((void *)(v103 + 32 + 16 * (v12 - 1)), (const void *)(v103 + 32 + 16 * v12), 16 * (v107 - v12));
        uint64_t v9 = v103;
        *(void *)(v103 + 16) = v107 - 1;
        unint64_t v12 = v107 - 1;
        if (v107 <= 2) {
          goto LABEL_123;
        }
      }
    }
  }
LABEL_149:
  __break(1u);
LABEL_150:
  __break(1u);
LABEL_151:
  __break(1u);
LABEL_152:
  __break(1u);
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
  return result;
}

uint64_t sub_24A7D9A0C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v19 = result;
  if (a3 != a2)
  {
    uint64_t v21 = *a4;
    uint64_t v4 = *a4 + 8 * a3 - 8;
    char v5 = &off_26528F000;
LABEL_5:
    uint64_t v6 = *(void **)(v21 + 8 * a3);
    uint64_t v7 = v19;
    uint64_t v20 = v4;
    uint64_t v22 = a3;
    while (1)
    {
      uint64_t v8 = *(void **)v4;
      id v9 = v6;
      id v10 = v8;
      id v11 = [v9 (SEL)v5[286]];
      if (v11)
      {
        unint64_t v12 = v11;
        sub_24A7DCA40();
      }
      uint64_t v13 = v5;
      id v14 = [v10 (SEL)v5[286]];
      if (v14)
      {
        id v15 = v14;
        sub_24A7DCA40();
      }
      sub_24A7CA890();
      uint64_t v16 = sub_24A7DCC00();

      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      char v5 = v13;
      if (v16 != -1)
      {
LABEL_4:
        a3 = v22 + 1;
        uint64_t v4 = v20 + 8;
        if (v22 + 1 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v21) {
        break;
      }
      id v17 = *(void **)v4;
      uint64_t v6 = *(void **)(v4 + 8);
      *(void *)uint64_t v4 = v6;
      *(void *)(v4 + 8) = v17;
      v4 -= 8;
      if (v22 == ++v7) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24A7D9BAC(id *__src, id *__dst, unint64_t a3, id *a4)
{
  char v5 = __dst;
  uint64_t v6 = __src;
  int64_t v7 = (char *)__dst - (char *)__src;
  int64_t v8 = (char *)__dst - (char *)__src + 7;
  if ((char *)__dst - (char *)__src >= 0) {
    int64_t v8 = (char *)__dst - (char *)__src;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)__dst;
  uint64_t v11 = a3 - (void)__dst + 7;
  if ((uint64_t)(a3 - (void)__dst) >= 0) {
    uint64_t v11 = a3 - (void)__dst;
  }
  uint64_t v12 = v11 >> 3;
  if (v9 >= v11 >> 3)
  {
    if (a4 != __dst || &__dst[v12] <= a4) {
      memmove(a4, __dst, 8 * v12);
    }
    id v14 = (char *)&a4[v12];
    uint64_t v13 = a4;
    if (v6 >= v5 || v10 < 8) {
      goto LABEL_51;
    }
    id v27 = (id *)(a3 - 8);
    uint64_t v28 = &off_26528F000;
    id v44 = v6;
    uint64_t v45 = v13;
    while (1)
    {
      char v49 = v14;
      uint64_t v29 = v14 - 8;
      uint64_t v47 = v5;
      uint64_t v31 = v5 - 1;
      id v30 = *(v5 - 1);
      id v32 = *((id *)v14 - 1);
      id v33 = v30;
      id v34 = [v32 (SEL)v28[286]];
      if (v34)
      {
        uint64_t v35 = v34;
        sub_24A7DCA40();
      }
      id v36 = [v33 (SEL)v28[286]];
      if (v36)
      {
        uint64_t v37 = v36;
        sub_24A7DCA40();
      }
      char v38 = v27 + 1;
      sub_24A7CA890();
      uint64_t v39 = sub_24A7DCC00();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v39 == -1)
      {
        id v14 = v49;
        if (v38 != v47)
        {
          char v5 = v31;
          goto LABEL_45;
        }
        BOOL v40 = v27 >= v47;
        char v5 = v31;
      }
      else
      {
        char v5 = v47;
        uint64_t v31 = (id *)v29;
        if (v38 != (id *)v49)
        {
          id v14 = v29;
LABEL_45:
          uint64_t v13 = v45;
          uint64_t v28 = &off_26528F000;
LABEL_46:
          *id v27 = *v31;
          goto LABEL_47;
        }
        BOOL v40 = v27 >= (id *)v49;
        id v14 = v29;
      }
      uint64_t v13 = v45;
      uint64_t v28 = &off_26528F000;
      if (v40) {
        goto LABEL_46;
      }
LABEL_47:
      if (v5 > v44)
      {
        --v27;
        if (v14 > (char *)v13) {
          continue;
        }
      }
      goto LABEL_51;
    }
  }
  uint64_t v13 = a4;
  if (a4 != __src || &__src[v9] <= a4) {
    memmove(a4, __src, 8 * v9);
  }
  id v14 = (char *)&a4[v9];
  if ((unint64_t)v5 < a3 && v7 >= 8)
  {
    uint64_t v48 = &v13[v9];
    while (1)
    {
      id v15 = v6;
      uint64_t v16 = *v13;
      id v17 = *v5;
      id v18 = v16;
      id v19 = objc_msgSend(v17, sel_displayName);
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = v5;
        sub_24A7DCA40();
      }
      else
      {
        uint64_t v21 = v5;
      }
      id v22 = objc_msgSend(v18, sel_displayName);
      if (v22)
      {
        id v23 = v22;
        sub_24A7DCA40();
      }
      char v5 = v21;
      sub_24A7CA890();
      uint64_t v24 = sub_24A7DCC00();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v24 != -1) {
        break;
      }
      id v25 = v21;
      char v5 = v21 + 1;
      if (v15 != v21) {
        goto LABEL_19;
      }
LABEL_20:
      uint64_t v6 = v15 + 1;
      id v14 = (char *)v48;
      if (v13 >= v48 || (unint64_t)v5 >= a3) {
        goto LABEL_50;
      }
    }
    id v25 = v13;
    if (v15 == v13++) {
      goto LABEL_20;
    }
LABEL_19:
    *id v15 = *v25;
    goto LABEL_20;
  }
LABEL_50:
  char v5 = v6;
LABEL_51:
  uint64_t v41 = v14 - (char *)v13;
  uint64_t v42 = v14 - (char *)v13 + 7;
  if (v41 < 0) {
    uint64_t v41 = v42;
  }
  if (v5 != v13 || v5 >= (void **)((char *)v13 + (v41 & 0xFFFFFFFFFFFFFFF8))) {
    memmove(v5, v13, 8 * (v41 >> 3));
  }
  return 1;
}

char *sub_24A7D9FC4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2697BE070);
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
  id v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_24A7DA0C0(uint64_t a1)
{
  return sub_24A7D9FC4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_24A7DA0D4(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24A7DCD10();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x24C5D0A80);
}

char *sub_24A7DA150(uint64_t a1)
{
  return sub_24A7CFF60(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24A7DA164(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24A7DCD10();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_24A7DCD10();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_24A7DC89C(&qword_2697BE040, &qword_2697BE018);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_2697BE018);
            uint64_t v10 = sub_24A7DA4F8(v13, i, a3);
            uint64_t v12 = *v11;
            swift_unknownObjectRetain();
            ((void (*)(uint64_t (**)(), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDFF0);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24A7DA328(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24A7DCD10();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_24A7DCD10();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_24A7DC89C((unint64_t *)&unk_2697BE060, &qword_2697BE058);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_2697BE058);
            uint64_t v10 = sub_24A7DA564(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_24A7CAA58(0, &qword_2697BDBF0);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t (*sub_24A7DA4F8(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_24A7DA614(v6, a2, a3);
  return sub_24A7DA560;
}

uint64_t (*sub_24A7DA564(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_24A7DA69C(v6, a2, a3);
  return sub_24A7DA560;
}

void sub_24A7DA5CC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_24A7DA614(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x24C5D0A70](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_unknownObjectRetain();
LABEL_5:
    uint64_t *v3 = v4;
    return sub_24A7DA694;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A7DA694()
{
  return swift_unknownObjectRelease();
}

void (*sub_24A7DA69C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x24C5D0A70](a2, a3);
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
    *(void *)uint64_t v3 = v4;
    return sub_24A7DA71C;
  }
  __break(1u);
  return result;
}

void sub_24A7DA71C(id *a1)
{
}

uint64_t sub_24A7DA724(unint64_t a1, uint64_t a2)
{
  if (a1) {
    unint64_t v2 = a1;
  }
  else {
    unint64_t v2 = MEMORY[0x263F8EE78];
  }
  uint64_t v55 = MEMORY[0x263F8EE78];
  uint64_t v3 = *(void *)(a2 + 32);
  uint64_t v56 = v3;
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    if (v2 >> 62) {
      goto LABEL_67;
    }
    uint64_t v53 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    sub_24A7DC580((uint64_t)&v56);
LABEL_7:
    uint64_t v5 = 0;
    uint64_t v43 = v3 + 32;
    uint64_t v44 = v4;
    unint64_t v54 = v2 & 0xC000000000000001;
    do
    {
      if (v5 == v4)
      {
        __break(1u);
LABEL_66:
        __break(1u);
LABEL_67:
        swift_bridgeObjectRetain();
        sub_24A7DC580((uint64_t)&v56);
        swift_bridgeObjectRetain();
        uint64_t v53 = sub_24A7DCD10();
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
      if (v53)
      {
        if (v53 >= 1)
        {
          uint64_t v45 = v5;
          unint64_t v6 = (void *)(v43 + 80 * v5);
          uint64_t v3 = *(unsigned __int8 *)v6;
          uint64_t v7 = v6[3];
          uint64_t v8 = v6[5];
          uint64_t v50 = v6[4];
          uint64_t v51 = v6[2];
          uint64_t v9 = v6[7];
          uint64_t v10 = v6[9];
          uint64_t v46 = v6[6];
          uint64_t v47 = v6[8];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v52 = v9;
          swift_bridgeObjectRetain();
          uint64_t v48 = v10;
          swift_bridgeObjectRetain();
          uint64_t v11 = 0;
          uint64_t v12 = v53;
          unsigned int v49 = v3;
          while (1)
          {
            if (v54)
            {
              MEMORY[0x24C5D0A70](v11, v2);
              if (v3) {
                goto LABEL_22;
              }
            }
            else
            {
              swift_unknownObjectRetain();
              if (v3)
              {
LABEL_22:
                self;
                uint64_t v14 = swift_dynamicCastObjCClass();
                if (v14)
                {
                  id v15 = (void *)v14;
                  swift_unknownObjectRetain();
                  swift_bridgeObjectRetain();
                  id v16 = objc_msgSend(v15, sel_moduleIdentifier);
                  uint64_t v17 = sub_24A7DCA40();
                  uint64_t v19 = v18;

                  if (!v7)
                  {
                    swift_bridgeObjectRelease();
                    swift_unknownObjectRelease_n();
                    goto LABEL_19;
                  }
                  if (v51 == v17 && v7 == v19) {
                    goto LABEL_14;
                  }
                  char v21 = sub_24A7DCD80();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_unknownObjectRelease();
                  if (v21) {
                    goto LABEL_15;
                  }
                }
                goto LABEL_18;
              }
            }
            self;
            uint64_t v22 = swift_dynamicCastObjCClass();
            if (v22)
            {
              id v23 = (void *)v22;
              unint64_t v24 = v2;
              swift_unknownObjectRetain();
              swift_bridgeObjectRetain();
              id v25 = objc_msgSend(v23, sel_extensionBundleIdentifier);
              uint64_t v26 = sub_24A7DCA40();
              uint64_t v28 = v27;

              if (!v8)
              {
                swift_unknownObjectRelease_n();
                swift_bridgeObjectRelease();
                goto LABEL_41;
              }
              if (v50 == v26 && v8 == v28)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
              }
              else
              {
                char v30 = sub_24A7DCD80();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v30 & 1) == 0)
                {
                  swift_unknownObjectRelease_n();
LABEL_41:
                  unint64_t v2 = v24;
                  uint64_t v12 = v53;
                  goto LABEL_19;
                }
              }
              swift_bridgeObjectRetain();
              id v31 = objc_msgSend(v23, sel_containerBundleIdentifier);
              if (v31)
              {
                id v32 = v31;
                uint64_t v33 = sub_24A7DCA40();
                uint64_t v35 = v34;

                if (v52)
                {
                  if (!v35) {
                    goto LABEL_52;
                  }
                  if (v46 == v33 && v52 == v35)
                  {
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    char v36 = sub_24A7DCD80();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    if ((v36 & 1) == 0) {
                      goto LABEL_59;
                    }
                  }
                }
                else if (v35)
                {
LABEL_52:
                  swift_unknownObjectRelease_n();
                  swift_bridgeObjectRelease();
                  goto LABEL_60;
                }
              }
              else if (v52)
              {
                goto LABEL_52;
              }
              swift_bridgeObjectRetain();
              id v37 = objc_msgSend(v23, sel_kind);
              uint64_t v38 = sub_24A7DCA40();
              uint64_t v40 = v39;

              if (!v48)
              {
                swift_bridgeObjectRelease();
LABEL_59:
                swift_unknownObjectRelease_n();
LABEL_60:
                unint64_t v2 = v24;
                uint64_t v12 = v53;
                uint64_t v3 = v49;
                goto LABEL_19;
              }
              unint64_t v2 = v24;
              uint64_t v3 = v49;
              if (v47 == v38 && v48 == v40)
              {
                uint64_t v12 = v53;
LABEL_14:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_unknownObjectRelease();
LABEL_15:
                uint64_t v13 = swift_unknownObjectRetain();
                MEMORY[0x24C5D08A0](v13);
                if (*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                  sub_24A7DCAF0();
                }
                sub_24A7DCB10();
                sub_24A7DCAE0();
                goto LABEL_18;
              }
              char v41 = sub_24A7DCD80();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_unknownObjectRelease();
              uint64_t v12 = v53;
              if (v41) {
                goto LABEL_15;
              }
            }
LABEL_18:
            swift_unknownObjectRelease();
LABEL_19:
            if (v12 == ++v11)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v4 = v44;
              uint64_t v5 = v45;
              goto LABEL_9;
            }
          }
        }
        goto LABEL_66;
      }
LABEL_9:
      ++v5;
    }
    while (v5 != v4);
    sub_24A7DC554((uint64_t)&v56);
    swift_bridgeObjectRelease();
    return v55;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
}

void *sub_24A7DACE4(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  unint64_t v5 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_24A7DCD10();
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6)
    {
LABEL_3:
      uint64_t v21 = v3;
      unint64_t v22 = v5;
      unint64_t v23 = v5 & 0xC000000000000001;
      uint64_t v7 = *(void *)(a2 + 56);
      uint64_t v8 = *(void *)(a2 + 64);
      uint64_t v3 = 4;
      do
      {
        uint64_t v9 = v3 - 4;
        if (v23)
        {
          id v10 = (id)MEMORY[0x24C5D0A70](v3 - 4, v5);
          a2 = v3 - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v10 = *(id *)(v5 + 8 * v3);
          a2 = v3 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v11 = v6;
        uint64_t v12 = v10;
        uint64_t v13 = v8;
        id v14 = objc_msgSend(v10, sel_uniqueIdentifier, v21);
        uint64_t v15 = sub_24A7DCA40();
        uint64_t v17 = v16;

        uint64_t v8 = v13;
        BOOL v18 = v15 == v7 && v17 == v13;
        if (v18)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v12;
        }
        char v19 = sub_24A7DCD80();
        swift_bridgeObjectRelease();
        if (v19) {
          goto LABEL_18;
        }

        ++v3;
        uint64_t v6 = v11;
        BOOL v18 = a2 == v11;
        unint64_t v5 = v22;
      }
      while (!v18);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_24A7DAE8C(unint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v27 = MEMORY[0x263F8EE78];
  uint64_t v4 = *(void *)(a2 + 16);
  if (v4)
  {
    uint64_t v5 = a2;
    if (a1 >> 62)
    {
LABEL_30:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_24A7DCD10();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v26 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    uint64_t v6 = 0;
    uint64_t v24 = v4;
    uint64_t v25 = v5 + 32;
    do
    {
      if (v6 == v4) {
        goto LABEL_29;
      }
      uint64_t v11 = v25 + 72 * v6;
      long long v12 = *(_OWORD *)(v11 + 48);
      v28[2] = *(_OWORD *)(v11 + 32);
      long long v29 = v12;
      uint64_t v30 = *(void *)(v11 + 64);
      long long v13 = *(_OWORD *)(v11 + 16);
      v28[0] = *(_OWORD *)v11;
      v28[1] = v13;
      if (v26)
      {
        uint64_t v15 = *((void *)&v29 + 1);
        uint64_t v14 = v30;
        swift_bridgeObjectRetain();
        sub_24A7DC5AC((uint64_t)v28);
        uint64_t v5 = 4;
        while (1)
        {
          id v16 = (a1 & 0xC000000000000001) != 0
              ? (id)MEMORY[0x24C5D0A70](v5 - 4, a1)
              : *(id *)(a1 + 8 * v5);
          uint64_t v17 = v16;
          uint64_t v4 = v5 - 3;
          if (__OFADD__(v5 - 4, 1)) {
            break;
          }
          id v18 = objc_msgSend(v16, sel_uniqueIdentifier);
          uint64_t v19 = sub_24A7DCA40();
          uint64_t v21 = v20;

          if (v19 == v15 && v21 == v14)
          {
            swift_bridgeObjectRelease();
LABEL_6:
            swift_bridgeObjectRelease();
            id v7 = objc_msgSend(v17, sel_widgetDescriptors);
            __swift_instantiateConcreteTypeFromMangledName(&qword_2697BDFF0);
            unint64_t v8 = sub_24A7DCAD0();

            sub_24A7DA724(v8, (uint64_t)v28);
            swift_bridgeObjectRelease();
            id v9 = v17;
            id v10 = (void *)sub_24A7DCAC0();
            swift_bridgeObjectRelease();
            objc_msgSend(v9, sel_setWidgetDescriptors_, v10);

            MEMORY[0x24C5D08A0]();
            if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_24A7DCAF0();
            }
            sub_24A7DCB10();
            sub_24A7DCAE0();

LABEL_9:
            sub_24A7DC614((uint64_t)v28);
            uint64_t v4 = v24;
            goto LABEL_10;
          }
          char v23 = sub_24A7DCD80();
          swift_bridgeObjectRelease();
          if (v23) {
            goto LABEL_6;
          }

          ++v5;
          if (v4 == v26)
          {
            swift_bridgeObjectRelease();
            goto LABEL_9;
          }
        }
        __break(1u);
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
LABEL_10:
      ++v6;
    }
    while (v6 != v4);
    swift_bridgeObjectRelease();
    return v27;
  }
  return result;
}

uint64_t sub_24A7DB178(void *a1, uint64_t a2)
{
  if (*(unsigned char *)a2 == 1)
  {
    self;
    uint64_t v4 = swift_dynamicCastObjCClass();
    if (!v4)
    {
LABEL_32:
      LOBYTE(v14) = 0;
      return v14 & 1;
    }
    uint64_t v5 = (void *)v4;
    uint64_t v7 = *(void *)(a2 + 16);
    uint64_t v6 = *(void *)(a2 + 24);
    swift_bridgeObjectRetain();
    id v8 = a1;
    id v9 = objc_msgSend(v5, sel_moduleIdentifier);
    uint64_t v10 = sub_24A7DCA40();
    uint64_t v12 = v11;

    if (v6)
    {
      if (v7 == v10 && v6 == v12)
      {
        LOBYTE(v14) = 1;
        goto LABEL_20;
      }
LABEL_8:
      LOBYTE(v14) = sub_24A7DCD80();
LABEL_20:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return v14 & 1;
    }
    goto LABEL_17;
  }
  self;
  uint64_t v14 = swift_dynamicCastObjCClass();
  if (v14)
  {
    uint64_t v16 = *(void *)(a2 + 32);
    uint64_t v15 = *(void *)(a2 + 40);
    swift_bridgeObjectRetain();
    id v8 = a1;
    id v17 = objc_msgSend((id)v14, sel_extensionBundleIdentifier);
    uint64_t v18 = sub_24A7DCA40();
    uint64_t v20 = v19;

    if (!v15) {
      goto LABEL_31;
    }
    if (v16 == v18 && v15 == v20)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      char v22 = sub_24A7DCD80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v22 & 1) == 0)
      {
LABEL_18:

        goto LABEL_32;
      }
    }
    uint64_t v24 = *(void *)(a2 + 48);
    uint64_t v23 = *(void *)(a2 + 56);
    swift_bridgeObjectRetain();
    id v25 = objc_msgSend((id)v14, sel_containerBundleIdentifier);
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = sub_24A7DCA40();
      uint64_t v29 = v28;

      if (v23)
      {
        if (v29)
        {
          if (v24 == v27 && v23 == v29)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            char v31 = sub_24A7DCD80();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v31 & 1) == 0) {
              goto LABEL_18;
            }
          }
          goto LABEL_35;
        }
LABEL_31:

        swift_bridgeObjectRelease();
        goto LABEL_32;
      }
      if (v29) {
        goto LABEL_31;
      }
    }
    else if (v23)
    {
      goto LABEL_31;
    }
LABEL_35:
    uint64_t v33 = *(void *)(a2 + 64);
    uint64_t v32 = *(void *)(a2 + 72);
    swift_bridgeObjectRetain();
    id v34 = objc_msgSend((id)v14, sel_kind);
    uint64_t v35 = sub_24A7DCA40();
    uint64_t v37 = v36;

    if (v32)
    {
      if (v33 == v35 && v32 == v37)
      {
        LOBYTE(v14) = 1;
        goto LABEL_20;
      }
      goto LABEL_8;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  return v14 & 1;
}

uint64_t sub_24A7DB480(unint64_t a1, unint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v28 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_39;
  }
  for (uint64_t i = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10); i; uint64_t i = sub_24A7DCD10())
  {
    uint64_t v22 = v3;
    unint64_t v5 = 0;
    unint64_t v6 = v3 & 0xC000000000000001;
    uint64_t v26 = v3 + 32;
    uint64_t v27 = v3 & 0xFFFFFFFFFFFFFF8;
    uint64_t v24 = i;
    unint64_t v25 = a2 & 0xC000000000000001;
    unint64_t v23 = v3 & 0xC000000000000001;
    while (1)
    {
      if (v6)
      {
        id v7 = (id)MEMORY[0x24C5D0A70](v5, v22);
      }
      else
      {
        if (v5 >= *(void *)(v27 + 16)) {
          goto LABEL_36;
        }
        id v7 = *(id *)(v26 + 8 * v5);
      }
      id v8 = v7;
      if (__OFADD__(v5++, 1)) {
        goto LABEL_37;
      }
      if (a2 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v10 = sub_24A7DCD10();
        if (!v10) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v10 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v10) {
          goto LABEL_16;
        }
      }
      id v11 = v25 ? (id)MEMORY[0x24C5D0A70](0, a2) : *(id *)(a2 + 32);
      uint64_t v12 = v11;
      uint64_t v3 = sub_24A7CAA58(0, &qword_2697BDBF0);
      char v13 = sub_24A7DCBE0();

      if ((v13 & 1) == 0) {
        break;
      }

      swift_bridgeObjectRelease();
LABEL_5:
      if (v5 == i) {
        return v28;
      }
    }
    if (v10 == 1)
    {
LABEL_16:
      swift_bridgeObjectRelease();
LABEL_17:
      uint64_t v3 = (uint64_t)&v28;
      sub_24A7DCCA0();
      sub_24A7DCCD0();
      sub_24A7DCCE0();
      sub_24A7DCCB0();
      goto LABEL_5;
    }
    if (v25)
    {
      uint64_t v14 = 1;
      while (1)
      {
        MEMORY[0x24C5D0A70](v14, a2);
        uint64_t v15 = v14 + 1;
        if (__OFADD__(v14, 1)) {
          break;
        }
        char v16 = sub_24A7DCBE0();
        swift_unknownObjectRelease();
        if (v16) {
          goto LABEL_29;
        }
        ++v14;
        if (v15 == v10) {
          goto LABEL_28;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    uint64_t v17 = 5;
    while (1)
    {
      uint64_t v18 = v17 - 3;
      if (__OFADD__(v17 - 4, 1)) {
        break;
      }
      id v19 = *(id *)(a2 + 8 * v17);
      char v20 = sub_24A7DCBE0();

      if (v20)
      {
LABEL_29:

        swift_bridgeObjectRelease();
        unint64_t v6 = v23;
        uint64_t i = v24;
        goto LABEL_5;
      }
      ++v17;
      if (v18 == v10)
      {
LABEL_28:
        swift_bridgeObjectRelease();
        unint64_t v6 = v23;
        uint64_t i = v24;
        goto LABEL_17;
      }
    }
LABEL_38:
    __break(1u);
LABEL_39:
    ;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_24A7DB73C(unint64_t a1)
{
  unint64_t v2 = sub_24A7D2C18(MEMORY[0x263F8EE78]);
  if (a1 >> 62)
  {
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_24A7DCD10();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      id v4 = (id)(a1 & 0xC000000000000001);
      uint64_t v5 = 4;
      unint64_t v6 = &off_26528F000;
      uint64_t v61 = v3;
      unint64_t v62 = a1 & 0xC000000000000001;
      while (1)
      {
        if (v4) {
          id v8 = (id)MEMORY[0x24C5D0A70](v5 - 4, a1);
        }
        else {
          id v8 = *(id *)(a1 + 8 * v5);
        }
        id v9 = v8;
        uint64_t v10 = v5 - 3;
        if (__OFADD__(v5 - 4, 1))
        {
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
          goto LABEL_36;
        }
        id v11 = [v8 (SEL)v6[295]];
        sub_24A7DCA40();

        LOBYTE(v11) = sub_24A7DCA80();
        swift_bridgeObjectRelease();
        if (v11) {
          break;
        }

LABEL_5:
        ++v5;
        BOOL v7 = v10 == v3;
        id v4 = (id)v62;
        if (v7)
        {
          swift_bridgeObjectRelease();
          unint64_t v65 = a1;
          unint64_t v63 = MEMORY[0x263F8EE78];
          if (v3 < 1)
          {
            __break(1u);
            goto LABEL_63;
          }
          swift_bridgeObjectRetain_n();
          for (uint64_t i = 0; i != v3; ++i)
          {
            if (v62) {
              id v33 = (id)MEMORY[0x24C5D0A70](i, a1);
            }
            else {
              id v33 = *(id *)(a1 + 8 * i + 32);
            }
            id v34 = v33;
            id v35 = objc_msgSend(v33, (SEL)v6[295], v61);
            sub_24A7DCA40();

            LOBYTE(v35) = sub_24A7DCA80();
            swift_bridgeObjectRelease();
            if (v35)
            {
            }
            else
            {
              sub_24A7DCCA0();
              sub_24A7DCCD0();
              sub_24A7DCCE0();
              sub_24A7DCCB0();
            }
            unint64_t v6 = &off_26528F000;
          }
          swift_bridgeObjectRelease();
          unint64_t v36 = v63;
          goto LABEL_38;
        }
      }
      unint64_t v12 = a1;
      id v13 = [v9 (SEL)v6[295]];
      uint64_t v14 = sub_24A7DCA40();
      uint64_t v16 = v15;

      id v17 = v9;
      unint64_t v18 = v2;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v64 = (void *)v2;
      a1 = sub_24A7D8C64(v14, v16);
      uint64_t v21 = *(void *)(v2 + 16);
      BOOL v22 = (v20 & 1) == 0;
      uint64_t v23 = v21 + v22;
      if (__OFADD__(v21, v22)) {
        goto LABEL_34;
      }
      unint64_t v2 = v20;
      if (*(void *)(v18 + 24) < v23)
      {
        sub_24A7CD2DC(v23, isUniquelyReferenced_nonNull_native);
        unint64_t v24 = sub_24A7D8C64(v14, v16);
        if ((v2 & 1) != (v25 & 1))
        {
          uint64_t result = sub_24A7DCD90();
          __break(1u);
          return result;
        }
        a1 = v24;
        uint64_t v26 = v64;
        if ((v2 & 1) == 0) {
          goto LABEL_20;
        }
LABEL_18:
        unint64_t v2 = (unint64_t)v26;
        uint64_t v27 = v26[7];

        *(void *)(v27 + 8 * a1) = v17;
LABEL_22:

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        a1 = v12;
        uint64_t v3 = v61;
        unint64_t v6 = &off_26528F000;
        goto LABEL_5;
      }
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v26 = v64;
        if (v20) {
          goto LABEL_18;
        }
      }
      else
      {
        sub_24A7CDC74();
        uint64_t v26 = v64;
        if (v2) {
          goto LABEL_18;
        }
      }
LABEL_20:
      v26[(a1 >> 6) + 8] |= 1 << a1;
      uint64_t v28 = (uint64_t *)(v26[6] + 16 * a1);
      *uint64_t v28 = v14;
      v28[1] = v16;
      *(void *)(v26[7] + 8 * a1) = v17;
      uint64_t v29 = v26[2];
      BOOL v30 = __OFADD__(v29, 1);
      uint64_t v31 = v29 + 1;
      if (v30) {
        goto LABEL_35;
      }
      unint64_t v2 = (unint64_t)v26;
      v26[2] = v31;
      swift_bridgeObjectRetain();
      goto LABEL_22;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  unint64_t v36 = MEMORY[0x263F8EE78];
LABEL_38:
  swift_bridgeObjectRelease();
  unint64_t v65 = v36;
  if (*(void *)(v2 + 16))
  {
    uint64_t v37 = *(void *)&aAccessibility[8];
    uint64_t v38 = *(void *)aAccessibility;
    swift_bridgeObjectRetain();
    unint64_t v39 = sub_24A7D8C64(v38, v37);
    if (v40)
    {
      id v41 = *(id *)(*(void *)(v2 + 56) + 8 * v39);
      swift_bridgeObjectRelease();
      id v4 = v41;
      MEMORY[0x24C5D08A0]();
      if (*(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_63:
      }
        sub_24A7DCAF0();
      sub_24A7DCB10();
      sub_24A7DCAE0();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    if (*(void *)(v2 + 16))
    {
      uint64_t v42 = qword_26FE45310;
      uint64_t v43 = qword_26FE45308;
      swift_bridgeObjectRetain();
      unint64_t v44 = sub_24A7D8C64(v43, v42);
      if (v45)
      {
        id v46 = *(id *)(*(void *)(v2 + 56) + 8 * v44);
        swift_bridgeObjectRelease();
        id v47 = v46;
        MEMORY[0x24C5D08A0]();
        if (*(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_24A7DCAF0();
        }
        sub_24A7DCB10();
        sub_24A7DCAE0();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      if (*(void *)(v2 + 16))
      {
        uint64_t v48 = qword_26FE45320;
        uint64_t v49 = qword_26FE45318;
        swift_bridgeObjectRetain();
        unint64_t v50 = sub_24A7D8C64(v49, v48);
        if (v51)
        {
          id v52 = *(id *)(*(void *)(v2 + 56) + 8 * v50);
          swift_bridgeObjectRelease();
          id v53 = v52;
          MEMORY[0x24C5D08A0]();
          if (*(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_24A7DCAF0();
          }
          sub_24A7DCB10();
          sub_24A7DCAE0();
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        if (*(void *)(v2 + 16))
        {
          uint64_t v54 = qword_26FE45330;
          uint64_t v55 = qword_26FE45328;
          swift_bridgeObjectRetain();
          unint64_t v56 = sub_24A7D8C64(v55, v54);
          if (v57)
          {
            id v58 = *(id *)(*(void *)(v2 + 56) + 8 * v56);
            swift_bridgeObjectRelease();
            id v59 = v58;
            MEMORY[0x24C5D08A0]();
            if (*(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_24A7DCAF0();
            }
            sub_24A7DCB10();
            sub_24A7DCAE0();
          }
          else
          {
            swift_bridgeObjectRelease();
          }
        }
      }
    }
  }
  swift_arrayDestroy();
  swift_bridgeObjectRelease();
  return v65;
}

void sub_24A7DBE40()
{
  uint64_t v1 = (void *)MEMORY[0x24C5D11D0](v0 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
  if (v1)
  {
    unint64_t v2 = v1;
    id v3 = objc_msgSend(v1, sel_view);

    if (v3)
    {
      id v4 = objc_msgSend(v3, sel_window);

      if (v4)
      {
        if (!swift_dynamicCastObjCProtocolConditional()) {
      }
        }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_24A7DBEEC()
{
  uint64_t v1 = (void *)MEMORY[0x24C5D11D0](v0 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  id v3 = objc_msgSend(v1, sel_customItemsDelegate);
  uint64_t v4 = (uint64_t)v3;
  if (v3)
  {
    id v5 = objc_msgSend(v3, sel_customApplicationWidgetCollectionsForControlsGalleryViewController_, v2);
    swift_unknownObjectRelease();
    sub_24A7CAA58(0, &qword_2697BDBF0);
    uint64_t v4 = sub_24A7DCAD0();
  }
  return v4;
}

void sub_24A7DBFA8(void *a1)
{
  self;
  uint64_t v3 = swift_dynamicCastObjCClass();
  if (!v3) {
    return;
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = MEMORY[0x24C5D11D0](v1 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
  if (!v5) {
    return;
  }
  unint64_t v6 = (_UNKNOWN **)v5;
  BOOL v7 = *(void **)(v5 + OBJC_IVAR___CCUISControlsGalleryViewController_configuration);
  uint64_t v8 = a1;
  id v9 = v7;
  id v10 = objc_msgSend(v4, sel_extensionIdentity);
  id v11 = objc_msgSend(v9, sel_disallowedExtensionIdentities);
  if (!v11) {
    goto LABEL_18;
  }
  unint64_t v12 = v11;
  sub_24A7DCB80();
  unint64_t v13 = sub_24A7DCAD0();

  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_24A7DCD10();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_6;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v14) {
    goto LABEL_17;
  }
LABEL_6:
  if (v14 >= 1)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if ((v13 & 0xC000000000000001) != 0) {
        id v16 = (id)MEMORY[0x24C5D0A70](i, v13);
      }
      else {
        id v16 = *(id *)(v13 + 8 * i + 32);
      }
      id v17 = v16;
      unsigned __int8 v18 = objc_msgSend(v10, sel_isEqual_, v16);
    }
    swift_bridgeObjectRelease();
    if (v18)
    {
      id v19 = (id)v8;
      id v20 = v9;
      id v9 = v10;
LABEL_33:

      return;
    }
LABEL_18:
    id v19 = v10;
    id v21 = objc_msgSend(v4, sel_kind);
    sub_24A7DCA40();

    id v22 = objc_msgSend(v4, sel_defaultIntentReference);
    id v23 = objc_allocWithZone(MEMORY[0x263F31DF8]);
    unint64_t v24 = (void *)sub_24A7DCA10();
    swift_bridgeObjectRelease();
    id v20 = objc_msgSend(v23, sel_initWithExtensionIdentity_kind_intentReference_, v19, v24, v22);

    id v25 = objc_msgSend(v9, sel_disallowedControlIdentities);
    if (v25)
    {
      uint64_t v26 = v25;
      sub_24A7CAA58(0, (unint64_t *)&unk_2697BDF00);
      unint64_t v27 = sub_24A7DCAD0();

      if (v27 >> 62) {
        goto LABEL_31;
      }
      uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
      while (v28)
      {
        uint64_t v33 = v8;
        id v34 = v9;
        uint64_t v32 = v6;
        uint64_t v8 = 4;
        unint64_t v6 = &off_26528F000;
        while (1)
        {
          id v29 = (v27 & 0xC000000000000001) != 0
              ? (id)MEMORY[0x24C5D0A70](v8 - 4, v27)
              : *(id *)(v27 + 8 * v8);
          BOOL v30 = v29;
          id v9 = (id)(v8 - 3);
          if (__OFADD__(v8 - 4, 1)) {
            break;
          }
          unsigned __int8 v31 = objc_msgSend(v20, sel_matches_, v29);

          if ((v31 & 1) == 0)
          {
            ++v8;
            if (v9 != (id)v28) {
              continue;
            }
          }
          unint64_t v6 = v32;
          uint64_t v8 = v33;
          id v9 = v34;
          goto LABEL_32;
        }
        __break(1u);
LABEL_31:
        swift_bridgeObjectRetain();
        uint64_t v28 = sub_24A7DCD10();
        swift_bridgeObjectRelease();
      }
LABEL_32:

      swift_bridgeObjectRelease();
      id v19 = v20;
      id v20 = (id)v8;
    }
    else
    {

      unint64_t v6 = (_UNKNOWN **)v9;
      id v9 = (id)v8;
    }
    goto LABEL_33;
  }
  __break(1u);
}

id sub_24A7DC378(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x24C5D11D0](v1 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (void *)v3;
  self;
  uint64_t v5 = swift_dynamicCastObjCClass();
  if (!v5)
  {
    id v10 = objc_msgSend(v4, sel_customItemsDelegate);
    if (v10)
    {
      id v8 = objc_msgSend(v10, sel_controlsGalleryViewController_widgetIconForGalleryItem_, v4, a1);
      swift_unknownObjectRelease();

      return v8;
    }

    return 0;
  }
  unint64_t v6 = (void *)v5;
  sub_24A7CAA58(0, &qword_2697BDEF8);
  swift_unknownObjectRetain();
  BOOL v7 = (void *)sub_24A7DCB40();
  objc_msgSend(v7, sel_addIconDataSource_, v6);
  id v8 = v7;
  id v9 = SBHIconGridSizeClassForCCUIGridSizeClass((uint64_t)objc_msgSend(v6, sel_preferredGallerySizeClass));
  objc_msgSend(v8, sel_setGridSizeClass_, v9);

  swift_unknownObjectRelease();
  return v8;
}

_OWORD *sub_24A7DC4C4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24A7DC4D4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24A7DC50C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24A7DC54C(uint64_t a1)
{
  sub_24A7D85C0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_24A7DC554(uint64_t a1)
{
  return a1;
}

uint64_t sub_24A7DC580(uint64_t a1)
{
  return a1;
}

uint64_t sub_24A7DC5AC(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 16);
  uint64_t v3 = *(void **)(a1 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v4 = v2;
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24A7DC614(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 16);
  uint64_t v3 = *(void **)(a1 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return a1;
}

char *keypath_get_selector_sbh_appName()
{
  return sel_sbh_appName;
}

uint64_t sub_24A7DC68C(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  if (a5)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v7 = a3;
    id v8 = a4;
    return swift_bridgeObjectRetain();
  }
  return result;
}

void *sub_24A7DC708(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_24A7DC758(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  if (a5)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24A7DC7D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A7DC838(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24A7DC89C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_24A7DC8E0()
{
  return MEMORY[0x270EEE9A0]();
}

uint64_t sub_24A7DC8F0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24A7DC900()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24A7DC910()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24A7DC920()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24A7DC930()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24A7DC940()
{
  return MEMORY[0x270F16660]();
}

uint64_t sub_24A7DC950()
{
  return MEMORY[0x270F16668]();
}

uint64_t sub_24A7DC960()
{
  return MEMORY[0x270F16670]();
}

uint64_t sub_24A7DC970()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24A7DC980()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24A7DC990()
{
  return MEMORY[0x270F819F8]();
}

uint64_t sub_24A7DC9A0()
{
  return MEMORY[0x270F81B08]();
}

uint64_t sub_24A7DC9B0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24A7DC9C0()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24A7DC9D0()
{
  return MEMORY[0x270F9D3D8]();
}

uint64_t sub_24A7DC9E0()
{
  return MEMORY[0x270EF1860]();
}

uint64_t sub_24A7DC9F0()
{
  return MEMORY[0x270EF1978]();
}

uint64_t sub_24A7DCA00()
{
  return MEMORY[0x270EF19A0]();
}

uint64_t sub_24A7DCA10()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24A7DCA20()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24A7DCA30()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24A7DCA40()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24A7DCA50()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24A7DCA60()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24A7DCA70()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_24A7DCA80()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_24A7DCA90()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_24A7DCAA0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_24A7DCAB0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24A7DCAC0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24A7DCAD0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24A7DCAE0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24A7DCAF0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24A7DCB00()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24A7DCB10()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24A7DCB20()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_24A7DCB30()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_24A7DCB40()
{
  return MEMORY[0x270F77098]();
}

uint64_t sub_24A7DCB50()
{
  return MEMORY[0x270F18820]();
}

uint64_t sub_24A7DCB60()
{
  return MEMORY[0x270F16698]();
}

uint64_t sub_24A7DCB70()
{
  return MEMORY[0x270F166A0]();
}

uint64_t sub_24A7DCB80()
{
  return MEMORY[0x270F166A8]();
}

uint64_t sub_24A7DCB90()
{
  return MEMORY[0x270F82688]();
}

uint64_t sub_24A7DCBA0()
{
  return MEMORY[0x270F826B0]();
}

uint64_t sub_24A7DCBB0()
{
  return MEMORY[0x270F826F0]();
}

uint64_t sub_24A7DCBC0()
{
  return MEMORY[0x270F826F8]();
}

uint64_t sub_24A7DCBD0()
{
  return MEMORY[0x270F82730]();
}

uint64_t sub_24A7DCBE0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24A7DCBF0()
{
  return MEMORY[0x270F82960]();
}

uint64_t sub_24A7DCC00()
{
  return MEMORY[0x270EF24F0]();
}

uint64_t sub_24A7DCC10()
{
  return MEMORY[0x270EF2550]();
}

uint64_t sub_24A7DCC20()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24A7DCC40()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24A7DCC50()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_24A7DCC60()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_24A7DCC70()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24A7DCC80()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24A7DCC90()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_24A7DCCA0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24A7DCCB0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24A7DCCC0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24A7DCCD0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24A7DCCE0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24A7DCCF0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24A7DCD00()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24A7DCD10()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24A7DCD20()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24A7DCD30()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24A7DCD40()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24A7DCD60()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24A7DCD70()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_24A7DCD80()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24A7DCD90()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24A7DCDA0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24A7DCDB0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24A7DCDC0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t CCUICalculateGridGeometryInfo()
{
  return MEMORY[0x270F18828]();
}

uint64_t CCUICompactModuleContinuousCornerRadiusForGridSizeClass()
{
  return MEMORY[0x270F18838]();
}

uint64_t CCUINumberOfColumnsForGridSizeClass()
{
  return MEMORY[0x270F18888]();
}

uint64_t CCUINumberOfRowsForGridSizeClass()
{
  return MEMORY[0x270F18890]();
}

uint64_t CCUIReferenceScreenBounds()
{
  return MEMORY[0x270F18898]();
}

uint64_t CCUIScreenSafeAreaInsets()
{
  return MEMORY[0x270F188A8]();
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t SBHScreenTypeForCurrentDevice()
{
  return MEMORY[0x270F770B8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}