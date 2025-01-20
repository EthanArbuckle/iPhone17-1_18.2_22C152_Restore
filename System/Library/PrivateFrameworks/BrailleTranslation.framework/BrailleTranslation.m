uint64_t BRLTSConnectionHasEntitlement(void *a1)
{
  void *v1;
  uint64_t v2;

  v1 = [a1 valueForEntitlement:@"com.apple.accessibility.BrailleTranslationService-access"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = [v1 BOOLValue];
  }
  else {
    v2 = 0;
  }

  return v2;
}

uint64_t BRLTModeForFlags(int a1, int a2, int a3)
{
  uint64_t v3 = 1;
  if (a1) {
    uint64_t v3 = 2;
  }
  if (a2) {
    uint64_t v3 = 3;
  }
  if (a3) {
    return 4;
  }
  else {
    return v3;
  }
}

uint64_t BRLTFlagsForMode(uint64_t result, unsigned char *a2, unsigned char *a3, char *a4)
{
  switch(result)
  {
    case 1:
      if (a2) {
        *a2 = 0;
      }
      goto LABEL_6;
    case 2:
      if (a2) {
        *a2 = 1;
      }
LABEL_6:
      if (a3) {
        *a3 = 0;
      }
      goto LABEL_12;
    case 3:
      if (a2) {
        *a2 = 0;
      }
      if (a3) {
        *a3 = 1;
      }
LABEL_12:
      if (!a4) {
        return result;
      }
      char v4 = 0;
      break;
    case 4:
      if (a2) {
        *a2 = 0;
      }
      if (a3) {
        *a3 = 0;
      }
      if (!a4) {
        return result;
      }
      char v4 = 1;
      break;
    default:
      return result;
  }
  *a4 = v4;
  return result;
}

__CFString *BRLTModeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"?";
  }
  else {
    return off_26440BB50[a1 - 1];
  }
}

unint64_t BRLTJUnicharIndexForIndex(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (a2 < 1)
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = 0;
    while (v4 < [v3 length])
    {
      uint64_t v5 = [v3 rangeOfComposedCharacterSequenceAtIndex:v4];
      unint64_t v4 = v5 + v6;
      if (!--a2) {
        goto LABEL_8;
      }
    }
    unint64_t v4 = [v3 length];
  }
LABEL_8:

  return v4;
}

unint64_t BRLTJUnicharRangeForRange(void *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = a1;
    unint64_t v3 = BRLTJUnicharIndexForIndex(v6, a2);
    BRLTJUnicharIndexForIndex(v6, a2 + a3);
  }
  return v3;
}

uint64_t BRLTJIndexForUnicharIndex(void *a1, uint64_t a2)
{
  id v3 = a1;
  unint64_t v4 = v3;
  if (a2 < 0) {
    goto LABEL_10;
  }
  if ([v3 length] < (unint64_t)a2) {
    a2 = [v4 length];
  }
  if (a2 < 1)
  {
LABEL_10:
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v4 rangeOfComposedCharacterSequenceAtIndex:v6];
      uint64_t v6 = v7 + v8;
      if (v7 + v8 <= a2) {
        ++v5;
      }
    }
    while (v7 + v8 < a2);
  }

  return v5;
}

uint64_t BRLTJRangeForUnicharRange(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = a1;
    uint64_t v3 = BRLTJIndexForUnicharIndex(v6, a2);
    BRLTJIndexForUnicharIndex(v6, a2 + a3);
  }
  return v3;
}

id BRLTTranslationServiceInterface()
{
  if (BRLTTranslationServiceInterface_onceToken != -1) {
    dispatch_once(&BRLTTranslationServiceInterface_onceToken, &__block_literal_global);
  }
  v0 = (void *)BRLTTranslationServiceInterface__Interface;
  return v0;
}

void __BRLTTranslationServiceInterface_block_invoke()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CCC36F0];
  id v2 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v0 setClasses:v2 forSelector:sel_brailleForText_parameters_withReply_ argumentIndex:1 ofReply:0];
  [v0 setClasses:v2 forSelector:sel_textForBraille_parameters_withReply_ argumentIndex:1 ofReply:0];
  v1 = (void *)BRLTTranslationServiceInterface__Interface;
  BRLTTranslationServiceInterface__Interface = (uint64_t)v0;
}

id BRLTTranslationServiceClientInterface()
{
  if (BRLTTranslationServiceClientInterface_onceToken != -1) {
    dispatch_once(&BRLTTranslationServiceClientInterface_onceToken, &__block_literal_global_11);
  }
  v0 = (void *)BRLTTranslationServiceClientInterface__Interface;
  return v0;
}

uint64_t __BRLTTranslationServiceClientInterface_block_invoke()
{
  BRLTTranslationServiceClientInterface__Interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CCC8760];
  return MEMORY[0x270F9A758]();
}

void sub_21C559B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C55AB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21C55AD64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id BRLTLog()
{
  if (MEMORY[0x263F21378])
  {
    BRLLogTranslation();
    id v0 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (BRLTLog_onceToken != -1) {
      dispatch_once(&BRLTLog_onceToken, &__block_literal_global_1);
    }
    id v0 = (id)BRLTLog_Logger;
  }
  return v0;
}

uint64_t __BRLTLog_block_invoke()
{
  BRLTLog_Logger = (uint64_t)os_log_create("com.apple.Accessibility", "BRLTranslation");
  return MEMORY[0x270F9A758]();
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t BRLTTranslatorClassIsValid(void *a1)
{
  v15[9] = *MEMORY[0x263EF8340];
  v15[0] = sel_interfaceVersion;
  v15[1] = sel_setActiveTable_;
  v15[2] = sel_activeTable;
  v15[3] = sel_activeTableSupportsContractedBraille;
  v15[4] = sel_activeTableSupportsEightDotBraille;
  v15[5] = sel_activeTableSupportsTechnicalBraille;
  v15[6] = sel_activeTableSupportsIPA;
  v15[7] = sel_printBrailleForText_mode_locations_textPositionsRange_textFormattingRanges_;
  v15[8] = sel_textForPrintBraille_mode_locations_;
  char v2 = [a1 conformsToProtocol:&unk_26CCC87C0];
  if ((v2 & 1) == 0)
  {
    unint64_t v4 = BRLTLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      BRLTTranslatorClassIsValid_cold_1((uint64_t)a1, v4);
    }
  }
  uint64_t v5 = 0;
  *(void *)&long long v3 = 138412546;
  long long v10 = v3;
  do
  {
    id v6 = (const char *)v15[v5];
    if ((objc_msgSend(a1, "instancesRespondToSelector:", v6, v10) & 1) == 0)
    {
      uint64_t v7 = BRLTLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = NSStringFromSelector(v6);
        *(_DWORD *)buf = v10;
        v12 = a1;
        __int16 v13 = 2112;
        v14 = v8;
        _os_log_error_impl(&dword_21C554000, v7, OS_LOG_TYPE_ERROR, "%@ doesn't implement %@", buf, 0x16u);
      }
      char v2 = 0;
    }
    ++v5;
  }
  while (v5 != 9);
  return v2 & 1;
}

id BRLTFirstPreferredLocale()
{
  id v0 = (void *)MEMORY[0x263EFF960];
  v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v2 = [v1 preferredLocalizations];
  long long v3 = [v2 firstObject];
  unint64_t v4 = [v0 localeWithLocaleIdentifier:v3];

  return v4;
}

id BRLTLocalizedNameForLanguage(void *a1)
{
  id v1 = a1;
  char v2 = BRLTFirstPreferredLocale();
  long long v3 = [v2 localizedStringForLanguage:v1 context:3];

  return v3;
}

id BRLTLocalizedStringForKey(void *a1)
{
  id v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  long long v3 = [v1 bundleForClass:objc_opt_class()];
  unint64_t v4 = [v3 localizedStringForKey:v2 value:&stru_26CCBD108 table:@"BrailleTables"];

  return v4;
}

void sub_21C56297C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NSUInteger _unionRangeIgnoringNotFound(NSRange a1, NSRange a2)
{
  if (a1.location != 0x7FFFFFFFFFFFFFFFLL && a2.location != 0x7FFFFFFFFFFFFFFFLL) {
    return NSUnionRange(a1, a2).location;
  }
  if (a1.location == 0x7FFFFFFFFFFFFFFFLL) {
    a1.location = a2.location;
  }
  return a1.location;
}

uint64_t sub_21C565440()
{
  return 0;
}

uint64_t sub_21C565478()
{
  return *(unsigned char *)(v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16) & 1 | (*(void *)(v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage) == *(void *)(v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 8));
}

unint64_t sub_21C5654B8()
{
  if (*((unsigned char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16)) {
    return 0;
  }
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
  unint64_t v2 = sub_21C589C88();
  unint64_t result = sub_21C589C88();
  if (result >> 14 >= v2 >> 14)
  {
    uint64_t v4 = sub_21C589CE8();
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    swift_bridgeObjectRelease();
    uint64_t v1 = MEMORY[0x21D4A95E0](v4, v6, v8, v10);
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C5655D8()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(void))((*v1 & *v0) + 0x90))();
    long long v3 = (char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
    *(void *)long long v3 = result;
    *((void *)v3 + 1) = v4;
    char v6 = v5 & 1;
  }
  else
  {
    long long v3 = (char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
    *(void *)long long v3 = 0;
    *((void *)v3 + 1) = 0;
    char v6 = 1;
  }
  v3[16] = v6;
  return result;
}

uint64_t sub_21C565688()
{
  return MEMORY[0x263F8EE78];
}

id BRLTJBrailleString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  char v20 = a5 & 1;
  char v14 = a5 & 1 | (a3 != a4);
  if (v14) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = a3;
  }
  if (a5 & 1 | (a3 != a4)) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = a4;
  }
  char v17 = a8 & 1;
  v18 = (char *)objc_allocWithZone((Class)type metadata accessor for BRLTJBrailleString())
      + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
  *(void *)v18 = v15;
  *((void *)v18 + 1) = v16;
  v18[16] = v14;
  return BRLTJEditableString.init(string:selection:focus:suggestion:tokenRanges:)(a1, a2, a3, a4, v20, a6, a7, v17, a9, a10, a11 & 1, a12);
}

uint64_t type metadata accessor for BRLTJBrailleString()
{
  return self;
}

id BRLTJBrailleString.__allocating_init(editableString:)(void *a1)
{
  unint64_t v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0x78))();
  uint64_t v29 = v4;
  uint64_t v30 = v3;
  uint64_t v5 = (*(uint64_t (**)(void))((*v2 & *a1) + 0x90))();
  uint64_t v7 = v6;
  char v9 = v8;
  char v28 = v8 & 1;
  uint64_t v10 = (*(uint64_t (**)(void))((*v2 & *a1) + 0xA8))();
  uint64_t v26 = v11;
  uint64_t v27 = v10;
  char v13 = v12;
  uint64_t v15 = (*(uint64_t (**)(void))((*v2 & *a1) + 0xC0))();
  uint64_t v17 = v16;
  char v18 = v9 | (v5 != v7);
  char v19 = v9 & 1 | (v5 != v7);
  if (v18) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = v5;
  }
  if (v18) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = v7;
  }
  char v22 = v14 & 1;
  v23 = (char *)objc_allocWithZone((Class)type metadata accessor for BRLTJBrailleString())
      + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
  *(void *)v23 = v20;
  *((void *)v23 + 1) = v21;
  v23[16] = v19;
  id v24 = BRLTJEditableString.init(string:selection:focus:suggestion:tokenRanges:)(v30, v29, v5, v7, v28, v27, v26, v13 & 1, v15, v17, v22, MEMORY[0x263F8EE78]);

  return v24;
}

uint64_t sub_21C56593C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result = sub_21C577860(a1, a2, a3 & 1);
  uint64_t v8 = v3 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
  *(void *)uint64_t v8 = 0;
  *(void *)(v8 + 8) = 0;
  *(unsigned char *)(v8 + 16) = 1;
  if ((a3 & 1) == 0 && a1 == a2)
  {
    *(void *)uint64_t v8 = a1;
    *(void *)(v8 + 8) = a1;
    *(unsigned char *)(v8 + 16) = 0;
  }
  return result;
}

uint64_t sub_21C5659A0()
{
  uint64_t result = sub_21C5779D4();
  uint64_t v2 = v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
  *(void *)uint64_t v2 = 0;
  *(void *)(v2 + 8) = 0;
  *(unsigned char *)(v2 + 16) = 1;
  return result;
}

uint64_t sub_21C5659D0()
{
  uint64_t v1 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90);
  uint64_t v2 = v1();
  if ((v4 & 1) == 0 && v2 != v3)
  {
    uint64_t v5 = (char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
    *(void *)uint64_t v5 = v2;
    *((void *)v5 + 1) = v2;
    v5[16] = 0;
  }
  uint64_t v6 = sub_21C577A70();
  uint64_t v7 = (char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
  if (*((unsigned char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16))
  {
    uint64_t result = ((uint64_t (*)(uint64_t))v1)(v6);
    uint64_t v10 = result;
    char v12 = v11 & 1;
LABEL_9:
    *(void *)uint64_t v7 = v10;
    *((void *)v7 + 1) = v9;
    v7[16] = v12;
    return result;
  }
  uint64_t v10 = *(void *)v7;
  uint64_t v13 = *((void *)v7 + 1);
  uint64_t result = sub_21C589C58();
  uint64_t v9 = v13 + result;
  if (__OFADD__(v13, result))
  {
    __break(1u);
  }
  else if (v9 >= v10)
  {
    char v12 = 0;
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C565AC0()
{
  uint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
  if (v3) {
    return 0;
  }
  uint64_t v4 = v1;
  uint64_t v5 = v2;
  uint64_t result = sub_21C577D40();
  if ((result & 1) == 0) {
    return 0;
  }
  uint64_t v7 = (char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
  if (v4 != v5)
  {
    *(void *)uint64_t v7 = v4;
    *((void *)v7 + 1) = v4;
    uint64_t v8 = v7 + 16;
LABEL_12:
    *uint64_t v8 = 0;
    return 1;
  }
  if (v7[16]) {
    return 1;
  }
  uint64_t v8 = v7 + 16;
  uint64_t v9 = *((void *)v7 + 1);
  if (*(void *)v7 < v9)
  {
    uint64_t v10 = v9 - 1;
LABEL_11:
    *((void *)v7 + 1) = v10;
    goto LABEL_12;
  }
  BOOL v11 = __OFSUB__(v9, 1);
  uint64_t v12 = v9 - 1;
  if (!v11)
  {
    uint64_t v10 = v12 & ~(v12 >> 63);
    *(void *)uint64_t v7 = v10;
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C565B94()
{
  if ((sub_21C578054() & 1) == 0) {
    return 0;
  }
  uint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
  if (v3) {
    return 0;
  }
  uint64_t v4 = (char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
  *(void *)uint64_t v4 = v1;
  *((void *)v4 + 1) = v2;
  v4[16] = 0;
  return 1;
}

uint64_t sub_21C565C0C()
{
  if (*((unsigned char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16)) {
    return 0;
  }
  uint64_t v1 = *(void *)((char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage);
  uint64_t v2 = *(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78);
  v2();
  v2();
  swift_bridgeObjectRelease();
  unint64_t v3 = sub_21C589C88();
  uint64_t v4 = swift_bridgeObjectRelease();
  ((void (*)(uint64_t))v2)(v4);
  uint64_t v5 = swift_bridgeObjectRelease();
  if (v3 >= 0x4000)
  {
    ((void (*)(uint64_t))v2)(v5);
    unint64_t v6 = sub_21C589C78();
    uint64_t v7 = swift_bridgeObjectRelease();
    ((void (*)(uint64_t))v2)(v7);
    uint64_t v8 = sub_21C589CD8();
    uint64_t v10 = v9;
    swift_bridgeObjectRelease();
    if (v8 == 8429794 && v10 == 0xA300000000000000)
    {
LABEL_13:
      swift_bridgeObjectRelease();
    }
    else
    {
      while (1)
      {
        char v12 = sub_21C589EC8();
        uint64_t result = swift_bridgeObjectRelease();
        if (v12) {
          break;
        }
        if (__OFSUB__(v1--, 1))
        {
          __break(1u);
          return result;
        }
        ((void (*)(uint64_t))v2)(result);
        uint64_t v15 = swift_bridgeObjectRelease();
        if (v6 < 0x4000) {
          return v1;
        }
        ((void (*)(uint64_t))v2)(v15);
        unint64_t v6 = sub_21C589C78();
        uint64_t v16 = swift_bridgeObjectRelease();
        ((void (*)(uint64_t))v2)(v16);
        uint64_t v17 = sub_21C589CD8();
        uint64_t v19 = v18;
        swift_bridgeObjectRelease();
        if (v17 == 8429794 && v19 == 0xA300000000000000) {
          goto LABEL_13;
        }
      }
    }
  }
  return v1;
}

uint64_t sub_21C565E4C()
{
  if (*((unsigned char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16)) {
    return 0;
  }
  uint64_t v1 = *(void *)((char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 8);
  uint64_t v2 = *(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78);
  v2();
  v2();
  swift_bridgeObjectRelease();
  unint64_t v3 = sub_21C589C88();
  uint64_t v4 = swift_bridgeObjectRelease();
  while (1)
  {
    uint64_t v5 = ((uint64_t (*)(uint64_t))v2)(v4);
    unint64_t v7 = v6;
    uint64_t v8 = swift_bridgeObjectRelease();
    uint64_t v9 = HIBYTE(v7) & 0xF;
    if ((v7 & 0x2000000000000000) == 0) {
      uint64_t v9 = v5 & 0xFFFFFFFFFFFFLL;
    }
    if (v3 >> 14 == 4 * v9) {
      return v1;
    }
    ((void (*)(uint64_t))v2)(v8);
    uint64_t v10 = sub_21C589CD8();
    uint64_t v12 = v11;
    swift_bridgeObjectRelease();
    if (v10 == 8429794 && v12 == 0xA300000000000000) {
      goto LABEL_13;
    }
    char v13 = sub_21C589EC8();
    uint64_t v14 = swift_bridgeObjectRelease();
    if (v13) {
      return v1;
    }
    ((void (*)(uint64_t))v2)(v14);
    unint64_t v3 = sub_21C589C68();
    uint64_t v4 = swift_bridgeObjectRelease();
    if (__OFADD__(v1++, 1))
    {
      __break(1u);
LABEL_13:
      swift_bridgeObjectRelease();
      return v1;
    }
  }
}

uint64_t sub_21C56601C()
{
  if (*((unsigned char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16)) {
    return 0;
  }
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  unint64_t v3 = *(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78);
  v3();
  v3();
  uint64_t v4 = swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(uint64_t))((*v2 & *v0) + 0x1B0))(v4);
  if ((v6 & 1) == 0)
  {
    unint64_t v7 = sub_21C589C88();
    uint64_t v8 = swift_bridgeObjectRelease();
    ((void (*)(uint64_t))v3)(v8);
    v3();
    swift_bridgeObjectRelease();
    unint64_t v9 = sub_21C589C88();
    uint64_t v10 = swift_bridgeObjectRelease();
    uint64_t result = ((uint64_t (*)(uint64_t))v3)(v10);
    if (v9 >> 14 >= v7 >> 14)
    {
      uint64_t v11 = sub_21C589CE8();
      uint64_t v13 = v12;
      uint64_t v15 = v14;
      uint64_t v17 = v16;
      swift_bridgeObjectRelease();
      uint64_t v1 = MEMORY[0x21D4A95E0](v11, v13, v15, v17);
      swift_bridgeObjectRelease();
      return v1;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21C5661F0()
{
  if (*((unsigned char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16)) {
    return 0;
  }
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  unint64_t v3 = *(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78);
  v3();
  v3();
  swift_bridgeObjectRelease();
  unint64_t v4 = sub_21C589C88();
  uint64_t v5 = swift_bridgeObjectRelease();
  ((void (*)(uint64_t))v3)(v5);
  v3();
  uint64_t v6 = swift_bridgeObjectRelease();
  uint64_t result = (*(uint64_t (**)(uint64_t))((*v2 & *v0) + 0x1B8))(v6);
  if ((v8 & 1) == 0)
  {
    unint64_t v9 = sub_21C589C88();
    uint64_t v10 = swift_bridgeObjectRelease();
    uint64_t result = ((uint64_t (*)(uint64_t))v3)(v10);
    if (v9 >> 14 >= v4 >> 14)
    {
      uint64_t v11 = sub_21C589CE8();
      uint64_t v13 = v12;
      uint64_t v15 = v14;
      uint64_t v17 = v16;
      swift_bridgeObjectRelease();
      uint64_t v1 = MEMORY[0x21D4A95E0](v11, v13, v15, v17);
      swift_bridgeObjectRelease();
      return v1;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_21C5663DC()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  char v2 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
  unint64_t v3 = *(uint64_t (**)(void))((*v1 & *v0) + 0x78);
  uint64_t v4 = v3();
  unint64_t v6 = v5;
  if (v2) {
    return (id)v4;
  }
  v3();
  v3();
  id result = (id)swift_bridgeObjectRelease();
  if (*((unsigned char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16)) {
    goto LABEL_16;
  }
  v63 = (char *)v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage;
  unint64_t v8 = sub_21C589C88();
  uint64_t v9 = swift_bridgeObjectRelease();
  ((void (*)(uint64_t))v3)(v9);
  unint64_t v62 = sub_21C589C68();
  uint64_t v10 = swift_bridgeObjectRelease();
  ((void (*)(uint64_t))v3)(v10);
  sub_21C589CD8();
  swift_bridgeObjectRelease();
  id v11 = objc_allocWithZone((Class)BRLTBrailleChar);
  uint64_t v12 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v11, sel_initWithUnicode_, v12);

  if ((objc_msgSend(v13, sel_dot7) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    id v60 = v13;
    id result = objc_msgSend(v13, sel_bits);
    if (((result + 64) >> 8))
    {
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    id v14 = objc_msgSend(objc_allocWithZone((Class)BRLTBrailleChar), sel_initWithBits_, ((_BYTE)result + 64));
    id v15 = objc_msgSend(v14, sel_unicode);

    sub_21C589C08();
    v3();
    uint64_t v16 = sub_21C589CE8();
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    v59 = v3;
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    uint64_t v23 = MEMORY[0x21D4A95E0](v16, v18, v20, v22);
    unint64_t v25 = v24;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21C589CA8();
    swift_bridgeObjectRelease();
    uint64_t v26 = swift_bridgeObjectRelease();
    unint64_t v27 = v25;
    uint64_t v28 = ((uint64_t (*)(uint64_t))v59)(v26);
    unint64_t v30 = sub_21C5669DC(v62, v28, v29);
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    swift_bridgeObjectRelease();
    MEMORY[0x21D4A95E0](v30, v32, v34, v36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21C589CA8();
    swift_bridgeObjectRelease();
    unint64_t v3 = v59;
    swift_bridgeObjectRelease();
    uint64_t v4 = v23;
    unint64_t v6 = v27;
    id v13 = v60;
  }
  v3();
  id result = (id)swift_bridgeObjectRelease();
  if (v8 < 0x4000)
  {

    return (id)v4;
  }
  if ((v63[16] & 1) == 0)
  {
    uint64_t v37 = sub_21C589C88();
    sub_21C589C78();
    sub_21C589CD8();
    id v38 = objc_allocWithZone((Class)BRLTBrailleChar);
    v39 = (void *)sub_21C589BF8();
    swift_bridgeObjectRelease();
    id v40 = objc_msgSend(v38, sel_initWithUnicode_, v39);

    if (objc_msgSend(v40, sel_dot8))
    {

      return (id)v4;
    }
    unint64_t v64 = v37;
    v61 = v13;
    id result = objc_msgSend(v40, sel_bits);
    if ((((result + 128) >> 8) & 1) == 0)
    {
      id v41 = objc_msgSend(objc_allocWithZone((Class)BRLTBrailleChar), sel_initWithBits_, ((_BYTE)result + 0x80));
      id v42 = objc_msgSend(v41, sel_unicode);

      sub_21C589C08();
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_21C589CE8();
      uint64_t v45 = v44;
      uint64_t v47 = v46;
      uint64_t v49 = v48;
      swift_bridgeObjectRelease();
      uint64_t v50 = MEMORY[0x21D4A95E0](v43, v45, v47, v49);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_21C589CA8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v51 = v50;
      unint64_t v52 = sub_21C5669DC(v64, v4, v6);
      uint64_t v54 = v53;
      uint64_t v56 = v55;
      uint64_t v58 = v57;
      swift_bridgeObjectRelease();
      MEMORY[0x21D4A95E0](v52, v54, v56, v58);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_21C589CA8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return (id)v51;
    }
    goto LABEL_15;
  }
LABEL_17:
  __break(1u);
  return result;
}

unint64_t sub_21C5669DC(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 >= result >> 14) {
    return sub_21C589CE8();
  }
  __break(1u);
  return result;
}

uint64_t sub_21C566A2C(uint64_t a1)
{
  sub_21C5674C4(a1, (uint64_t)v5);
  if (!v6)
  {
    sub_21C567570((uint64_t)v5);
    goto LABEL_5;
  }
  type metadata accessor for BRLTJBrailleString();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    char v2 = 0;
    return v2 & 1;
  }
  char v2 = _s18BrailleTranslation18BRLTJBrailleStringC2eeoiySbAC_ACtFZ_0(v1, v4);

  return v2 & 1;
}

id sub_21C566BB0(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  unint64_t v5 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21C566C20()
{
  sub_21C589E18();
  uint64_t v1 = sub_21C589CA8();
  char v2 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0x78))(v1);
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_21C589CA8();
  (*(void (**)(uint64_t))((*v2 & *v0) + 0x90))(v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C899E0);
  sub_21C589C18();
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  sub_21C589CA8();
  sub_21C589C18();
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  return 0;
}

__n128 sub_21C566DCC@<Q0>(void *a1@<X8>)
{
  char v2 = v1;
  uint64_t v3 = (void *)MEMORY[0x263F8EED0];
  uint64_t v4 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x78))();
  uint64_t v36 = v5;
  uint64_t v37 = v4;
  uint64_t v6 = (*(uint64_t (**)(void))((*v3 & *v1) + 0x90))();
  uint64_t v8 = v7;
  char v10 = v9;
  char v35 = v9 & 1;
  uint64_t v11 = (*(uint64_t (**)(void))((*v3 & *v1) + 0xA8))();
  uint64_t v33 = v12;
  uint64_t v34 = v11;
  char v14 = v13;
  uint64_t v15 = (*(uint64_t (**)(void))((*v3 & *v1) + 0xC0))();
  uint64_t v31 = v16;
  uint64_t v32 = v15;
  char v18 = v17;
  uint64_t v19 = (*(uint64_t (**)(void))((*v3 & *v1) + 0xD8))();
  char v20 = v10 & 1 | (v6 != v8);
  if (v20) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = v6;
  }
  if (v10 & 1 | (v6 != v8)) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = v8;
  }
  char v23 = v14 & 1;
  unint64_t v24 = (objc_class *)type metadata accessor for BRLTJBrailleString();
  unint64_t v25 = (char *)objc_allocWithZone(v24);
  uint64_t v26 = &v25[OBJC_IVAR___BRLTJBrailleStringInternal_stage];
  *(void *)uint64_t v26 = v21;
  *((void *)v26 + 1) = v22;
  v26[16] = v20;
  unint64_t v27 = (char *)BRLTJEditableString.init(string:selection:focus:suggestion:tokenRanges:)(v37, v36, v6, v8, v35, v34, v33, v23, v32, v31, v18 & 1, v19);
  unsigned __int8 v28 = *((unsigned char *)v2 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16);
  unint64_t v29 = (__n128 *)&v27[OBJC_IVAR___BRLTJBrailleStringInternal_stage];
  __n128 result = *(__n128 *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStringInternal_stage);
  *unint64_t v29 = result;
  v29[1].n128_u8[0] = v28;
  a1[3] = v24;
  *a1 = v27;
  return result;
}

id BRLTJBrailleString.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BRLTJBrailleString();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t BRLTJBrailleString.NSStage.getter()
{
  return sub_21C57BDA4(*(void *)(v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage), *(void *)(v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 8), *(unsigned char *)(v0 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16));
}

uint64_t _s18BrailleTranslation18BRLTJBrailleStringC2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = (void *)MEMORY[0x263F8EED0];
  uint64_t v5 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0x78))();
  uint64_t v7 = v6;
  BOOL v9 = v5 == (*(uint64_t (**)(void))((*v4 & *a2) + 0x78))() && v7 == v8;
  if (v9)
  {
    uint64_t v11 = swift_bridgeObjectRelease_n();
  }
  else
  {
    char v10 = sub_21C589EC8();
    swift_bridgeObjectRelease();
    uint64_t v11 = swift_bridgeObjectRelease();
    BOOL v12 = 0;
    if ((v10 & 1) == 0) {
      return v12;
    }
  }
  uint64_t v13 = (*(uint64_t (**)(uint64_t))((*v4 & *a1) + 0x90))(v11);
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v18 = (*(uint64_t (**)(void))((*v4 & *a2) + 0x90))();
  if (v17)
  {
    if ((v20 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    if (v20) {
      return 0;
    }
    if (v13 != v18 || v15 != v19) {
      return 0;
    }
  }
  uint64_t v22 = (*(uint64_t (**)(uint64_t))((*v4 & *a1) + 0xA8))(v18);
  uint64_t v24 = v23;
  char v26 = v25;
  uint64_t v27 = (*(uint64_t (**)(void))((*v4 & *a2) + 0xA8))();
  if (v26)
  {
    if ((v29 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    if (v29) {
      return 0;
    }
    if (v22 != v27 || v24 != v28) {
      return 0;
    }
  }
  uint64_t v31 = (void *)((char *)a1 + OBJC_IVAR___BRLTJBrailleStringInternal_stage);
  uint64_t v32 = (void *)((char *)a2 + OBJC_IVAR___BRLTJBrailleStringInternal_stage);
  if (*((unsigned char *)a1 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16))
  {
    if (*((unsigned char *)a2 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16)) {
      goto LABEL_30;
    }
    return 0;
  }
  BOOL v12 = 0;
  if ((*((unsigned char *)a2 + OBJC_IVAR___BRLTJBrailleStringInternal_stage + 16) & 1) != 0 || *v31 != *v32 || v31[1] != v32[1]) {
    return v12;
  }
LABEL_30:
  uint64_t v33 = *(uint64_t (**)(uint64_t))((*v4 & *a1) + 0xD8);
  uint64_t v34 = *(void *)(v33(v27) + 16);
  uint64_t v35 = swift_bridgeObjectRelease();
  unint64_t v62 = *(uint64_t (**)(uint64_t))((*v4 & *a2) + 0xD8);
  uint64_t v36 = *(void *)(v62(v35) + 16);
  uint64_t v37 = swift_bridgeObjectRelease();
  if (v34 != v36) {
    return 0;
  }
  uint64_t v38 = *(void *)(v33(v37) + 16);
  uint64_t v39 = swift_bridgeObjectRelease();
  uint64_t v61 = v38;
  if (!v38) {
    return 1;
  }
  uint64_t result = v33(v39);
  if (*(void *)(result + 16))
  {
    uint64_t v42 = *(void *)(result + 32);
    uint64_t v41 = *(void *)(result + 40);
    uint64_t v43 = *(void *)(result + 48);
    uint64_t v44 = swift_bridgeObjectRelease();
    uint64_t result = v62(v44);
    if (*(void *)(result + 16))
    {
      uint64_t v46 = *(void *)(result + 32);
      uint64_t v45 = *(void *)(result + 40);
      uint64_t v47 = *(void *)(result + 48);
      uint64_t v48 = swift_bridgeObjectRelease();
      BOOL v12 = 0;
      if (v42 == v46 && v41 == v45 && v43 == v47)
      {
        uint64_t v49 = 0;
        unint64_t v50 = 1;
        while (1)
        {
          BOOL v12 = v61 == v50;
          if (v61 == v50) {
            break;
          }
          uint64_t result = v33(v48);
          if (v50 >= *(void *)(result + 16))
          {
            __break(1u);
LABEL_53:
            __break(1u);
            goto LABEL_54;
          }
          ++v50;
          uint64_t v51 = *(void *)(result + v49 + 56);
          uint64_t v52 = *(void *)(result + v49 + 64);
          uint64_t v53 = *(void *)(result + v49 + 72);
          uint64_t v54 = swift_bridgeObjectRelease();
          uint64_t result = v62(v54);
          if (v50 - 1 >= *(void *)(result + 16)) {
            goto LABEL_53;
          }
          uint64_t v55 = v49 + 24;
          uint64_t v56 = result + v49;
          uint64_t v57 = *(void *)(result + v49 + 56);
          uint64_t v63 = *(void *)(v56 + 64);
          uint64_t v64 = v55;
          uint64_t v58 = *(void *)(v56 + 72);
          uint64_t v48 = swift_bridgeObjectRelease();
          BOOL v9 = v51 == v57;
          uint64_t v49 = v64;
          if (!v9 || v52 != v63 || v53 != v58) {
            return v12;
          }
        }
      }
      return v12;
    }
  }
  else
  {
LABEL_54:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21C5674C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C899D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

uint64_t sub_21C567570(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C899D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t method lookup function for BRLTJBrailleString(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BRLTJBrailleString);
}

uint64_t dispatch thunk of BRLTJBrailleString.isStageEmpty.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of BRLTJBrailleString.stageString.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of BRLTJBrailleString.resetStage()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of BRLTJBrailleString.stageSignalledString.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D0))();
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

void sub_21C56776C()
{
}

void *sub_21C567780()
{
  uint64_t result = (void *)swift_allocObject();
  result[2] = &unk_26CCBCE38;
  result[3] = &unk_26CCBCE08;
  uint64_t v1 = MEMORY[0x263F8EE78];
  result[4] = 0;
  result[5] = v1;
  return result;
}

void *sub_21C5677C4()
{
  uint64_t result = v0;
  v0[2] = &unk_26CCBCE98;
  v0[3] = &unk_26CCBCE68;
  uint64_t v2 = MEMORY[0x263F8EE78];
  v0[4] = 0;
  v0[5] = v2;
  return result;
}

unint64_t sub_21C5677EC(uint64_t *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v10 = a1[2];
  unint64_t v9 = a1[3];
  v94 = v5;
  unint64_t v97 = v9;
  uint64_t v98 = v10;
  if ((a4 & 1) == 0)
  {
    unint64_t v12 = sub_21C568480(a2, v10, v9, 1);
    sub_21C5693E8(v12, v13);
    if (sub_21C589C58() < v14) {
      sub_21C589C58();
    }
    unint64_t v15 = sub_21C589C88();
    unint64_t result = sub_21C589C88();
    if (result >> 14 < v15 >> 14) {
      goto LABEL_36;
    }
    uint64_t v17 = sub_21C589CE8();
    uint64_t v18 = MEMORY[0x21D4A95E0](v17);
    uint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v99 = v18;
    uint64_t v100 = v20;
    uint64_t v21 = sub_21C589BA8();
    uint64_t v22 = *(void *)(v21 - 8);
    uint64_t v23 = *(void *)(v22 + 64);
    MEMORY[0x270FA5388](v21, v24, v25);
    sub_21C589B98();
    unint64_t v96 = sub_21C56886C();
    uint64_t v26 = sub_21C589DC8();
    uint64_t v28 = v27;
    char v29 = *(void (**)(char *, uint64_t))(v22 + 8);
    v29((char *)v93 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), v21);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C899E8);
    uint64_t v30 = swift_allocObject();
    long long v95 = xmmword_21C58CBD0;
    *(_OWORD *)(v30 + 16) = xmmword_21C58CBD0;
    *(void *)(v30 + 32) = v26;
    *(void *)(v30 + 40) = v28;
    v5[3] = v30;
    swift_bridgeObjectRelease();
    sub_21C568480(a2, v98, v97, 0);
    if (sub_21C589C58() < v31) {
      sub_21C589C58();
    }
    unint64_t v32 = sub_21C589C88();
    unint64_t result = sub_21C589C88();
    if (result >> 14 < v32 >> 14) {
      goto LABEL_37;
    }
    uint64_t v33 = sub_21C589CE8();
    uint64_t v34 = MEMORY[0x21D4A95E0](v33);
    uint64_t v36 = v35;
    uint64_t v37 = swift_bridgeObjectRelease();
    uint64_t v99 = v34;
    uint64_t v100 = v36;
    MEMORY[0x270FA5388](v37, v38, v39);
    sub_21C589B98();
    uint64_t v40 = sub_21C589DC8();
    uint64_t v42 = v41;
    v29((char *)v93 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), v21);
    swift_bridgeObjectRelease();
    uint64_t v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = v95;
    *(void *)(v43 + 32) = v40;
    *(void *)(v43 + 40) = v42;
    uint64_t v5 = v94;
    v94[2] = v43;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  uint64_t v44 = MEMORY[0x263F8EE78];
  v5[3] = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  v5[2] = v44;
  swift_bridgeObjectRelease();
  if (sub_21C589C58() < 1 || (unint64_t v45 = sub_21C568480(0, v10, v9, 1), v45 == v46))
  {
LABEL_11:
    if (!*(void *)(v5[3] + 16))
    {
      v5[3] = &unk_26CCBCDD8;
      swift_bridgeObjectRelease();
      v5[2] = &unk_26CCBCDA8;
      swift_bridgeObjectRelease();
    }
    v5[4] = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C899E8);
    unint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = xmmword_21C58CBD0;
    if (*(void *)(v5[3] + 16))
    {
      unint64_t v47 = result;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_21C568728();
      uint64_t v50 = v49;
      swift_bridgeObjectRelease();
      *(void *)(v47 + 32) = v48;
      *(void *)(v47 + 40) = v50;
      v5[5] = v47;
      return swift_bridgeObjectRelease();
    }
    goto LABEL_35;
  }
  uint64_t v51 = v46;
  uint64_t v52 = 0;
  v93[1] = v8;
  v93[2] = v7;
  v93[0] = a1;
  while (1)
  {
    sub_21C5693E8(v45, v51);
    if (sub_21C589C58() < v53) {
      sub_21C589C58();
    }
    unint64_t v54 = sub_21C589C88();
    unint64_t result = sub_21C589C88();
    if (result >> 14 < v54 >> 14) {
      break;
    }
    uint64_t v55 = sub_21C589CE8();
    uint64_t v56 = MEMORY[0x21D4A95E0](v55);
    uint64_t v58 = v57;
    swift_bridgeObjectRelease();
    uint64_t v99 = v56;
    uint64_t v100 = v58;
    uint64_t v59 = sub_21C589BA8();
    uint64_t v60 = *(void *)(v59 - 8);
    uint64_t v61 = *(void *)(v60 + 64);
    MEMORY[0x270FA5388](v59, v62, v63);
    sub_21C589B98();
    unint64_t v96 = sub_21C56886C();
    uint64_t v64 = sub_21C589DC8();
    uint64_t v66 = v65;
    *(void *)&long long v95 = *(void *)(v60 + 8);
    ((void (*)(char *, uint64_t))v95)((char *)v93 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0), v59);
    swift_bridgeObjectRelease();
    v67 = v5;
    v68 = (char *)v5[3];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v67[3] = v68;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v68 = sub_21C56837C(0, *((void *)v68 + 2) + 1, 1, v68);
      v94[3] = v68;
    }
    unint64_t v71 = *((void *)v68 + 2);
    unint64_t v70 = *((void *)v68 + 3);
    if (v71 >= v70 >> 1)
    {
      v68 = sub_21C56837C((char *)(v70 > 1), v71 + 1, 1, v68);
      v94[3] = v68;
    }
    *((void *)v68 + 2) = v71 + 1;
    v72 = &v68[16 * v71];
    *((void *)v72 + 4) = v64;
    *((void *)v72 + 5) = v66;
    sub_21C568480(v52, v98, v97, 0);
    if (sub_21C589C58() < v73) {
      sub_21C589C58();
    }
    unint64_t v74 = sub_21C589C88();
    unint64_t result = sub_21C589C88();
    if (result >> 14 < v74 >> 14) {
      goto LABEL_34;
    }
    uint64_t v75 = sub_21C589CE8();
    uint64_t v76 = MEMORY[0x21D4A95E0](v75);
    uint64_t v78 = v77;
    uint64_t v79 = swift_bridgeObjectRelease();
    uint64_t v99 = v76;
    uint64_t v100 = v78;
    MEMORY[0x270FA5388](v79, v80, v81);
    sub_21C589B98();
    uint64_t v82 = sub_21C589DC8();
    uint64_t v84 = v83;
    ((void (*)(char *, uint64_t))v95)((char *)v93 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0), v59);
    swift_bridgeObjectRelease();
    uint64_t v5 = v94;
    v85 = (char *)v94[2];
    char v86 = swift_isUniquelyReferenced_nonNull_native();
    v5[2] = v85;
    if ((v86 & 1) == 0)
    {
      v85 = sub_21C56837C(0, *((void *)v85 + 2) + 1, 1, v85);
      v5[2] = v85;
    }
    unint64_t v88 = *((void *)v85 + 2);
    unint64_t v87 = *((void *)v85 + 3);
    if (v88 >= v87 >> 1)
    {
      v85 = sub_21C56837C((char *)(v87 > 1), v88 + 1, 1, v85);
      v5[2] = v85;
    }
    *((void *)v85 + 2) = v88 + 1;
    v89 = &v85[16 * v88];
    *((void *)v89 + 4) = v82;
    *((void *)v89 + 5) = v84;
    unint64_t v91 = v97;
    uint64_t v90 = v98;
    if (v51 < sub_21C589C58())
    {
      unint64_t v45 = sub_21C568480(v51, v90, v91, 1);
      uint64_t v52 = v51;
      uint64_t v51 = v92;
      if (v45 != v92) {
        continue;
      }
    }
    goto LABEL_11;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

BOOL sub_21C568054()
{
  uint64_t v1 = *(void *)(v0 + 32);
  BOOL v2 = __OFADD__(v1, 1);
  uint64_t v3 = v1 + 1;
  if (!v2) {
    return v3 < *(void *)(*(void *)(v0 + 24) + 16);
  }
  __break(1u);
  return result;
}

BOOL sub_21C568078()
{
  return *(void *)(v0 + 32) > 0;
}

uint64_t sub_21C568088()
{
  uint64_t result = (*(uint64_t (**)(void))(*v1 + 224))();
  if ((result & 1) == 0) {
    return result;
  }
  uint64_t v5 = v1[4];
  BOOL v6 = __OFADD__(v5, 1);
  unint64_t v7 = v5 + 1;
  if (v6)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v1[4] = v7;
  if (v7 != *(void *)(v1[5] + 16)) {
    return result;
  }
  if (v7 >= *(void *)(v1[3] + 16)) {
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_21C568728();
  uint64_t v2 = v8;
  swift_bridgeObjectRelease();
  uint64_t v3 = v1[5];
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  v1[5] = v3;
  if ((result & 1) == 0)
  {
LABEL_12:
    uint64_t result = (uint64_t)sub_21C56837C(0, *(void *)(v3 + 16) + 1, 1, (char *)v3);
    uint64_t v3 = result;
    v1[5] = result;
  }
  unint64_t v9 = *(void *)(v3 + 16);
  unint64_t v10 = *(void *)(v3 + 24);
  unint64_t v11 = v9 + 1;
  if (v9 >= v10 >> 1)
  {
    unint64_t v15 = v9 + 1;
    uint64_t v13 = (char *)v3;
    unint64_t v14 = *(void *)(v3 + 16);
    uint64_t result = (uint64_t)sub_21C56837C((char *)(v10 > 1), v9 + 1, 1, v13);
    unint64_t v9 = v14;
    unint64_t v11 = v15;
    uint64_t v3 = result;
    v1[5] = result;
  }
  *(void *)(v3 + 16) = v11;
  unint64_t v12 = v3 + 16 * v9;
  *(void *)(v12 + 32) = v0;
  *(void *)(v12 + 40) = v2;
  return result;
}

uint64_t sub_21C5681C8()
{
  uint64_t result = (*(uint64_t (**)(void))(*v0 + 232))();
  if (result)
  {
    uint64_t v2 = v0[4];
    BOOL v3 = __OFSUB__(v2, 1);
    uint64_t v4 = v2 - 1;
    if (v3) {
      __break(1u);
    }
    else {
      v0[4] = v4;
    }
  }
  return result;
}

void sub_21C568218()
{
  unint64_t v1 = v0[4];
  if ((int64_t)v1 >= *(void *)(v0[5] + 16))
  {
    if (v1 < *(void *)(v0[3] + 16))
    {
      swift_bridgeObjectRetain();
      sub_21C568728();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    if ((v1 & 0x8000000000000000) == 0)
    {
      swift_bridgeObjectRetain();
      return;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_21C5682B0()
{
  unint64_t v1 = *(void *)(v0 + 32);
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = *(void *)(v0 + 16);
    if (v1 < *(void *)(v2 + 16))
    {
      uint64_t v3 = *(void *)(v2 + 16 * v1 + 32);
      swift_bridgeObjectRetain();
      return v3;
    }
  }
  __break(1u);
  return result;
}

uint64_t BRLTWordDescriptionManager.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BRLTWordDescriptionManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

char *sub_21C56837C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C899E8);
    unint64_t v10 = (char *)swift_allocObject();
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
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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

unint64_t sub_21C568480(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  unint64_t result = sub_21C589C88();
  unint64_t v9 = result;
  uint64_t v10 = a1;
  if (result >= 0x4000)
  {
    unint64_t v11 = sub_21C589C78();
    BOOL v13 = sub_21C589CD8() == 8429794 && v12 == 0xA300000000000000;
    uint64_t v10 = a1;
    if (v13)
    {
LABEL_13:
      unint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      char v14 = sub_21C589EC8();
      unint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = a1;
      if ((v14 & 1) == 0)
      {
        uint64_t v10 = a1;
        while (1)
        {
          BOOL v16 = __OFSUB__(v10--, 1);
          if (v16) {
            break;
          }
          if (v11 < 0x4000) {
            goto LABEL_14;
          }
          unint64_t v11 = sub_21C589C78();
          if (sub_21C589CD8() == 8429794 && v17 == 0xA300000000000000) {
            goto LABEL_13;
          }
          char v15 = sub_21C589EC8();
          unint64_t result = swift_bridgeObjectRelease();
          if (v15) {
            goto LABEL_14;
          }
        }
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
    }
  }
LABEL_14:
  uint64_t v18 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v18 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v19 = 4 * v18;
  while (v19 != v9 >> 14)
  {
    if (sub_21C589CD8() == 8429794 && v20 == 0xA300000000000000) {
      goto LABEL_24;
    }
    char v21 = sub_21C589EC8();
    unint64_t result = swift_bridgeObjectRelease();
    if (v21) {
      goto LABEL_25;
    }
    unint64_t result = sub_21C589C68();
    unint64_t v9 = result;
    BOOL v16 = __OFADD__(a1++, 1);
    if (v16)
    {
      __break(1u);
LABEL_24:
      unint64_t result = swift_bridgeObjectRelease();
LABEL_25:
      if (a4)
      {
        while (v19 != v9 >> 14)
        {
          if (sub_21C589CD8() == 8429794 && v23 == 0xA300000000000000)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            char v22 = sub_21C589EC8();
            unint64_t result = swift_bridgeObjectRelease();
            if ((v22 & 1) == 0) {
              goto LABEL_33;
            }
          }
          unint64_t result = sub_21C589C68();
          unint64_t v9 = result;
          BOOL v16 = __OFADD__(a1++, 1);
          if (v16)
          {
            __break(1u);
            goto LABEL_36;
          }
        }
      }
      break;
    }
  }
LABEL_33:
  if (a1 >= v10) {
    return v10;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_21C568728()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  unint64_t v1 = (void *)sub_21C589BF8();
  uint64_t v2 = (void *)sub_21C589BF8();
  id v3 = objc_msgSend(v0, sel_descriptionOfWord_forLanguage_, v1, v2);

  if (v3)
  {
    sub_21C589C08();
  }
  id v4 = objc_msgSend(objc_allocWithZone((Class)BRLTJJapaneseProcessor), sel_init);
  char v5 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  id v6 = objc_msgSend(v4, sel_spacedYomiOfWordDescription_, v5);

  uint64_t v7 = sub_21C589C08();
  return v7;
}

unint64_t sub_21C56886C()
{
  unint64_t result = qword_267C899F0;
  if (!qword_267C899F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C899F0);
  }
  return result;
}

uint64_t type metadata accessor for BRLTWordDescriptionManager()
{
  return self;
}

uint64_t method lookup function for BRLTWordDescriptionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BRLTWordDescriptionManager);
}

uint64_t sub_21C568900()
{
  return 0;
}

uint64_t sub_21C568908@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  unint64_t v11 = (void *)sub_21C589BF8();
  id v12 = objc_msgSend(v5, sel__translate_isTechnical_textFormattingRanges_, v11, a3 & 1, a4);

  uint64_t v13 = sub_21C589BE8();
  sub_21C589E08();
  if (*(void *)(v13 + 16) && (unint64_t v14 = sub_21C56995C((uint64_t)v23), (v15 & 1) != 0))
  {
    sub_21C569D70(*(void *)(v13 + 56) + 32 * v14, (uint64_t)&v24);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  sub_21C5699A0((uint64_t)v23);
  if (!*((void *)&v25 + 1))
  {
    sub_21C567570((uint64_t)&v24);
    goto LABEL_9;
  }
  if (!swift_dynamicCast())
  {
LABEL_9:
    uint64_t v16 = 0;
    unint64_t v17 = 0xE000000000000000;
    goto LABEL_10;
  }
  uint64_t v16 = 0x656C6C69617262;
  unint64_t v17 = 0xE700000000000000;
LABEL_10:
  sub_21C589E08();
  if (*(void *)(v13 + 16) && (unint64_t v18 = sub_21C56995C((uint64_t)v23), (v19 & 1) != 0))
  {
    sub_21C569D70(*(void *)(v13 + 56) + 32 * v18, (uint64_t)&v24);
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_21C5699A0((uint64_t)v23);
  if (!*((void *)&v25 + 1))
  {
    sub_21C567570((uint64_t)&v24);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C899F8);
  if (!swift_dynamicCast())
  {
LABEL_18:
    char v21 = (char *)sub_21C589C58();
    uint64_t v20 = (uint64_t)sub_21C569CD0(v21);
    goto LABEL_19;
  }
  uint64_t v20 = 0x6E6F697461636F6CLL;
LABEL_19:
  *a5 = a1;
  a5[1] = a2;
  a5[2] = v16;
  a5[3] = v17;
  a5[4] = v20;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21C568B44@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t sub_21C568B54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v7 = (void *)sub_21C589BF8();
  id v8 = objc_msgSend(v3, sel__backTranslate_, v7);

  uint64_t v9 = sub_21C589BE8();
  sub_21C589E08();
  if (*(void *)(v9 + 16) && (unint64_t v10 = sub_21C56995C((uint64_t)v20), (v11 & 1) != 0))
  {
    sub_21C569D70(*(void *)(v9 + 56) + 32 * v10, (uint64_t)&v21);
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
  }
  sub_21C5699A0((uint64_t)v20);
  if (!*((void *)&v22 + 1))
  {
    sub_21C567570((uint64_t)&v21);
    goto LABEL_9;
  }
  if (!swift_dynamicCast())
  {
LABEL_9:
    uint64_t v12 = 0;
    unint64_t v13 = 0xE000000000000000;
    goto LABEL_10;
  }
  uint64_t v12 = 1954047348;
  unint64_t v13 = 0xE400000000000000;
LABEL_10:
  sub_21C589E08();
  if (*(void *)(v9 + 16) && (unint64_t v14 = sub_21C56995C((uint64_t)v20), (v15 & 1) != 0))
  {
    sub_21C569D70(*(void *)(v9 + 56) + 32 * v14, (uint64_t)&v21);
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_21C5699A0((uint64_t)v20);
  if (*((void *)&v22 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C899F8);
    if (swift_dynamicCast())
    {
      uint64_t v16 = 0x6E6F697461636F6CLL;
      if (!MEMORY[0x6E6F697461636F7C]) {
        goto LABEL_20;
      }
      goto LABEL_21;
    }
  }
  else
  {
    sub_21C567570((uint64_t)&v21);
  }
  unint64_t v17 = (char *)sub_21C589C58();
  uint64_t v16 = (uint64_t)sub_21C569CD0(v17);
  if (!*(void *)(v16 + 16))
  {
LABEL_20:
    swift_bridgeObjectRelease();
    unint64_t v18 = (char *)sub_21C589C58();
    uint64_t v16 = (uint64_t)sub_21C569CD0(v18);
  }
LABEL_21:
  *a3 = a1;
  a3[1] = a2;
  a3[2] = v12;
  a3[3] = v13;
  a3[4] = v16;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21C568D98@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3 = a1;
  sub_21C568908(*(void *)(a1 + OBJC_IVAR___BRLTEditStringInternal_string), *(void *)(a1 + OBJC_IVAR___BRLTEditStringInternal_string + 8), a2, *(void *)(a1 + OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges), &v65);
  uint64_t v52 = v66;
  uint64_t v53 = v65;
  uint64_t v64 = v67;
  long long v55 = v68;
  id v4 = (uint64_t *)(v3 + OBJC_IVAR___BRLTEditStringInternal_selection);
  char v51 = *(unsigned char *)(v3 + OBJC_IVAR___BRLTEditStringInternal_selection + 16);
  if (v51)
  {
    uint64_t v50 = 0;
    uint64_t v47 = 0;
  }
  else
  {
    uint64_t v5 = v4[1];
    uint64_t v6 = sub_21C5696A4(*v4);
    uint64_t result = sub_21C5696A4(v5);
    uint64_t v50 = v6;
    if (result < v6) {
      goto LABEL_67;
    }
    uint64_t v47 = result;
  }
  id v8 = (uint64_t *)(v3 + OBJC_IVAR___BRLTEditStringInternal_focus);
  char v49 = *(unsigned char *)(v3 + OBJC_IVAR___BRLTEditStringInternal_focus + 16);
  if (v49)
  {
    uint64_t v48 = 0;
    uint64_t v46 = 0;
  }
  else
  {
    uint64_t v9 = v8[1];
    uint64_t v10 = sub_21C5696A4(*v8);
    uint64_t result = sub_21C5696A4(v9);
    uint64_t v48 = v10;
    if (result < v10) {
      goto LABEL_68;
    }
    uint64_t v46 = result;
  }
  uint64_t v11 = *(void *)(v3 + OBJC_IVAR___BRLTEditStringInternal_tokenRanges);
  uint64_t v58 = *(void *)(v11 + 16);
  if (!v58)
  {
    uint64_t v13 = MEMORY[0x263F8EE78];
    goto LABEL_56;
  }
  uint64_t v45 = v3;
  uint64_t v57 = v11 + 32;
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v12 = 0;
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v56 = v11;
  do
  {
    if (v12 >= *(void *)(v11 + 16)) {
      goto LABEL_65;
    }
    uint64_t v61 = v13;
    unint64_t v60 = v12;
    unint64_t v14 = (uint64_t *)(v57 + 24 * v12);
    uint64_t v16 = *v14;
    uint64_t v15 = v14[1];
    uint64_t v59 = v14[2];
    uint64_t result = sub_21C589C58();
    if (result >= 1)
    {
      uint64_t v17 = result;
      uint64_t v18 = 0;
      uint64_t v19 = *((void *)&v68 + 1);
      uint64_t v21 = v65;
      uint64_t v20 = v66;
      uint64_t v62 = *((void *)&v68 + 1) + 32;
      while (1)
      {
        uint64_t v23 = v18 + v17;
        if (__OFADD__(v18, v17))
        {
          __break(1u);
LABEL_62:
          __break(1u);
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
          __break(1u);
LABEL_69:
          __break(1u);
          return result;
        }
        uint64_t v24 = v23 >= 0 ? v18 + v17 : v23 + 1;
        uint64_t v22 = v24 >> 1;
        if (v23 > -2)
        {
          uint64_t result = sub_21C57BE6C(v64, v55, v24 >> 1);
          if (result >= *(void *)(v19 + 16)) {
            goto LABEL_26;
          }
          if (result < 0) {
            goto LABEL_63;
          }
          uint64_t result = sub_21C57BE34(v21, v20, *(void *)(v62 + 8 * result));
          if ((result & 0x8000000000000000) == 0) {
            break;
          }
        }
        if (v16 > 0) {
          goto LABEL_15;
        }
LABEL_16:
        uint64_t v17 = v22;
        if (v18 >= v22) {
          goto LABEL_30;
        }
      }
      uint64_t v25 = result;
      uint64_t result = sub_21C589C58();
      if (result < v25)
      {
LABEL_26:
        uint64_t result = sub_21C589C58();
        uint64_t v25 = result;
      }
      if (v25 >= v16) {
        goto LABEL_16;
      }
LABEL_15:
      uint64_t v18 = v22 + 1;
      uint64_t v22 = v17;
      goto LABEL_16;
    }
    uint64_t v18 = 0;
LABEL_30:
    uint64_t result = sub_21C589C58();
    if (result >= 1)
    {
      uint64_t v26 = result;
      uint64_t v27 = 0;
      uint64_t v28 = *((void *)&v68 + 1);
      uint64_t v30 = v65;
      uint64_t v29 = v66;
      uint64_t v63 = *((void *)&v68 + 1) + 32;
      while (1)
      {
        uint64_t v32 = v27 + v26;
        if (__OFADD__(v27, v26)) {
          goto LABEL_62;
        }
        uint64_t v33 = v32 >= 0 ? v27 + v26 : v32 + 1;
        uint64_t v31 = v33 >> 1;
        if (v32 > -2)
        {
          uint64_t result = sub_21C57BE6C(v64, v55, v33 >> 1);
          if (result >= *(void *)(v28 + 16)) {
            goto LABEL_44;
          }
          if (result < 0) {
            goto LABEL_64;
          }
          uint64_t result = sub_21C57BE34(v30, v29, *(void *)(v63 + 8 * result));
          if ((result & 0x8000000000000000) == 0) {
            break;
          }
        }
        if (v15 > 0) {
          goto LABEL_33;
        }
LABEL_34:
        uint64_t v26 = v31;
        if (v27 >= v31) {
          goto LABEL_48;
        }
      }
      uint64_t v34 = result;
      uint64_t result = sub_21C589C58();
      if (result < v34)
      {
LABEL_44:
        uint64_t result = sub_21C589C58();
        uint64_t v34 = result;
      }
      if (v34 >= v15) {
        goto LABEL_34;
      }
LABEL_33:
      uint64_t v27 = v31 + 1;
      uint64_t v31 = v26;
      goto LABEL_34;
    }
    uint64_t v27 = 0;
LABEL_48:
    if (v27 < v18) {
      goto LABEL_66;
    }
    uint64_t v13 = v61;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_21C569BB8(0, *(void *)(v61 + 16) + 1, 1, (char *)v61);
      uint64_t v13 = result;
    }
    uint64_t v11 = v56;
    unint64_t v36 = *(void *)(v13 + 16);
    unint64_t v35 = *(void *)(v13 + 24);
    if (v36 >= v35 >> 1)
    {
      uint64_t result = (uint64_t)sub_21C569BB8((char *)(v35 > 1), v36 + 1, 1, (char *)v13);
      uint64_t v13 = result;
    }
    unint64_t v12 = v60 + 1;
    *(void *)(v13 + 16) = v36 + 1;
    uint64_t v37 = (void *)(v13 + 24 * v36);
    v37[4] = v18;
    v37[5] = v27;
    v37[6] = v59;
  }
  while (v60 + 1 != v58);
  swift_bridgeObjectRelease();
  uint64_t v3 = v45;
LABEL_56:
  uint64_t v38 = (uint64_t *)(v3 + OBJC_IVAR___BRLTEditStringInternal_suggestion);
  char v39 = *(unsigned char *)(v3 + OBJC_IVAR___BRLTEditStringInternal_suggestion + 16);
  if (v39)
  {
    uint64_t v40 = 0;
    uint64_t v41 = 0;
  }
  else
  {
    uint64_t v42 = v38[1];
    uint64_t v40 = sub_21C5696A4(*v38);
    uint64_t result = sub_21C5696A4(v42);
    if (result < v40) {
      goto LABEL_69;
    }
    uint64_t v41 = result;
  }
  type metadata accessor for BRLTEditString();
  uint64_t v43 = v67;
  uint64_t v44 = v68;
  swift_bridgeObjectRetain();
  uint64_t result = (uint64_t)sub_21C56A208(v43, v44, v50, v47, v51, v48, v46, v49, v13, v40, v41, v39, 0);
  *(void *)a3 = result;
  *(void *)(a3 + 8) = v53;
  *(void *)(a3 + 16) = v52;
  *(void *)(a3 + 24) = v64;
  *(_OWORD *)(a3 + 32) = v55;
  return result;
}

uint64_t sub_21C56927C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_21C5696A4(a1);
  uint64_t result = sub_21C5696A4(a2);
  if (result >= v3) {
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C5692C8()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21C5692F8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21C569328()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21C569330(uint64_t a1)
{
  if (a1 < 0) {
    return 0;
  }
  uint64_t result = sub_21C57BE6C(v1[2], v1[3], a1);
  uint64_t v3 = v1[4];
  if (result < *(void *)(v3 + 16))
  {
    if (result < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = sub_21C57BE34(*v1, v1[1], *(void *)(v3 + 8 * result + 32));
    if ((v4 & 0x8000000000000000) == 0)
    {
      uint64_t v5 = v4;
      if (sub_21C589C58() < v4) {
        goto LABEL_9;
      }
      return v5;
    }
    return 0;
  }
LABEL_9:
  return sub_21C589C58();
}

uint64_t sub_21C5693E8(uint64_t result, uint64_t a2)
{
  uint64_t v4 = result;
  if (result < 0) {
    goto LABEL_7;
  }
  uint64_t result = sub_21C57BE6C(v2[2], v2[3], result);
  uint64_t v5 = v2[4];
  if (result >= *(void *)(v5 + 16)) {
    goto LABEL_10;
  }
  if (result < 0)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  uint64_t result = sub_21C57BE34(*v2, v2[1], *(void *)(v5 + 8 * result + 32));
  if (result < 0)
  {
LABEL_7:
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = result;
    uint64_t result = sub_21C589C58();
    if (result < v6)
    {
LABEL_10:
      uint64_t result = sub_21C589C58();
      uint64_t v6 = result;
      if (v4 == a2) {
        goto LABEL_12;
      }
LABEL_11:
      uint64_t v7 = v2[2];
      uint64_t v8 = v2[3];
      uint64_t result = sub_21C589C58();
      uint64_t v4 = a2;
      if (result <= a2) {
        goto LABEL_12;
      }
      while (1)
      {
        uint64_t v11 = v4 - 1;
        if (__OFSUB__(v4, 1)) {
          goto LABEL_46;
        }
        if ((v11 & 0x8000000000000000) == 0)
        {
          uint64_t result = sub_21C57BE6C(v7, v8, v11);
          uint64_t v12 = v2[4];
          if (result >= *(void *)(v12 + 16)) {
            goto LABEL_30;
          }
          if (result < 0) {
            goto LABEL_47;
          }
          uint64_t v13 = sub_21C57BE34(*v2, v2[1], *(void *)(v12 + 8 * result + 32));
          if ((v13 & 0x8000000000000000) == 0) {
            break;
          }
        }
        if (v4 < 0) {
          goto LABEL_20;
        }
        uint64_t v14 = 0;
LABEL_32:
        uint64_t result = sub_21C57BE6C(v7, v8, v4);
        uint64_t v15 = v2[4];
        if (result >= *(void *)(v15 + 16)) {
          goto LABEL_36;
        }
        if (result < 0) {
          goto LABEL_48;
        }
        uint64_t v16 = sub_21C57BE34(*v2, v2[1], *(void *)(v15 + 8 * result + 32));
        if ((v16 & 0x8000000000000000) == 0)
        {
          uint64_t v17 = v16;
          if (sub_21C589C58() < v16) {
LABEL_36:
          }
            uint64_t v17 = sub_21C589C58();
          if (v14 < v17) {
            goto LABEL_14;
          }
          goto LABEL_20;
        }
        if (v14 < 0) {
          goto LABEL_14;
        }
LABEL_20:
        ++v4;
        uint64_t result = sub_21C589C58();
        if (v4 >= result) {
          goto LABEL_12;
        }
      }
      uint64_t v14 = v13;
      uint64_t result = sub_21C589C58();
      if (result < v14)
      {
LABEL_30:
        uint64_t result = sub_21C589C58();
        uint64_t v14 = result;
      }
      if (v4 < 0)
      {
        if (v14 < 0) {
          goto LABEL_41;
        }
        goto LABEL_20;
      }
      goto LABEL_32;
    }
  }
  if (v4 != a2) {
    goto LABEL_11;
  }
LABEL_12:
  if (v4 < 0) {
    goto LABEL_41;
  }
  uint64_t v7 = v2[2];
  uint64_t v8 = v2[3];
LABEL_14:
  uint64_t result = sub_21C57BE6C(v7, v8, v4);
  uint64_t v9 = v2[4];
  if (result >= *(void *)(v9 + 16))
  {
LABEL_44:
    uint64_t result = sub_21C589C58();
    if (result < v6)
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
      goto LABEL_49;
    }
    return v6;
  }
  if ((result & 0x8000000000000000) == 0)
  {
    uint64_t result = sub_21C57BE34(*v2, v2[1], *(void *)(v9 + 8 * result + 32));
    if ((result & 0x8000000000000000) == 0)
    {
      uint64_t v10 = result;
      uint64_t result = sub_21C589C58();
      if (result < v10) {
        goto LABEL_44;
      }
LABEL_42:
      if (v10 < v6) {
        goto LABEL_45;
      }
      return v6;
    }
LABEL_41:
    uint64_t v10 = 0;
    goto LABEL_42;
  }
LABEL_50:
  __break(1u);
  return result;
}

uint64_t sub_21C5696A4(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t result = sub_21C589C58();
  if (result < 1) {
    return 0;
  }
  uint64_t v6 = result;
  uint64_t v7 = 0;
  while (1)
  {
    uint64_t v9 = v7 + v6;
    if (__OFADD__(v7, v6)) {
      break;
    }
    if (v9 >= 0) {
      uint64_t v10 = v7 + v6;
    }
    else {
      uint64_t v10 = v9 + 1;
    }
    uint64_t v8 = v10 >> 1;
    if (v9 > -2)
    {
      uint64_t result = sub_21C57BE6C(v3, v4, v10 >> 1);
      uint64_t v11 = v1[4];
      if (result >= *(void *)(v11 + 16)) {
        goto LABEL_15;
      }
      if (result < 0) {
        goto LABEL_21;
      }
      uint64_t result = sub_21C57BE34(*v1, v1[1], *(void *)(v11 + 8 * result + 32));
      if ((result & 0x8000000000000000) == 0)
      {
        uint64_t v12 = result;
        uint64_t result = sub_21C589C58();
        if (result < v12)
        {
LABEL_15:
          uint64_t result = sub_21C589C58();
          uint64_t v12 = result;
        }
        if (v12 >= a1) {
          goto LABEL_5;
        }
LABEL_4:
        uint64_t v7 = v8 + 1;
        uint64_t v8 = v6;
        goto LABEL_5;
      }
    }
    if (a1 > 0) {
      goto LABEL_4;
    }
LABEL_5:
    uint64_t v6 = v8;
    if (v7 >= v8) {
      return v7;
    }
  }
  __break(1u);
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_21C5697CC@<X0>(uint64_t a1@<X0>, char **a2@<X8>)
{
  uint64_t v5 = v2[1];
  uint64_t v24 = *v2;
  uint64_t v25 = v5;
  swift_bridgeObjectRetain();
  sub_21C589CA8();
  uint64_t v6 = v24;
  uint64_t v7 = v5;
  uint64_t v8 = v2[3];
  uint64_t v24 = v2[2];
  uint64_t v25 = v8;
  swift_bridgeObjectRetain();
  sub_21C589CA8();
  uint64_t v9 = v24;
  uint64_t v10 = v25;
  uint64_t v11 = v2[4];
  uint64_t v24 = v11;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v26 = v12;
  uint64_t v13 = *(void *)(v12 + 16);
  if (v13)
  {
    uint64_t v22 = v9;
    uint64_t v23 = v6;
    uint64_t v14 = (uint64_t *)(v12 + 32);
    sub_21C569DCC((uint64_t)&v24);
    sub_21C569DCC((uint64_t)&v26);
    while (1)
    {
      uint64_t v15 = *v14++;
      uint64_t result = sub_21C589C58();
      uint64_t v17 = result + v15;
      if (__OFADD__(result, v15)) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v11 = sub_21C569ABC(0, *((void *)v11 + 2) + 1, 1, v11);
      }
      unint64_t v19 = *((void *)v11 + 2);
      unint64_t v18 = *((void *)v11 + 3);
      if (v19 >= v18 >> 1) {
        uint64_t v11 = sub_21C569ABC((char *)(v18 > 1), v19 + 1, 1, v11);
      }
      *((void *)v11 + 2) = v19 + 1;
      *(void *)&v11[8 * v19 + 32] = v17;
      if (!--v13)
      {
        uint64_t result = sub_21C569DF8((uint64_t)&v26);
        uint64_t v7 = v5;
        uint64_t v6 = v23;
        uint64_t v20 = v22;
        goto LABEL_11;
      }
    }
    __break(1u);
  }
  else
  {
    uint64_t v21 = v9;
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v20 = v21;
LABEL_11:
    *a2 = v6;
    a2[1] = v7;
    a2[2] = v20;
    a2[3] = v10;
    a2[4] = v11;
  }
  return result;
}

unint64_t sub_21C56995C(uint64_t a1)
{
  uint64_t v2 = sub_21C589DE8();
  return sub_21C5699F4(a1, v2);
}

uint64_t sub_21C5699A0(uint64_t a1)
{
  return a1;
}

unint64_t sub_21C5699F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_21C56A088(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x21D4A97B0](v9, a1);
      sub_21C5699A0((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

char *sub_21C569ABC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C89A00);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
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

char *sub_21C569BB8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C89A08);
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
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 24 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21C569CD0(char *result)
{
  if (((unint64_t)result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v1 = (char *)MEMORY[0x263F8EE78];
    uint64_t v2 = result;
    if (result)
    {
      uint64_t v1 = sub_21C569ABC(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v3 = *((void *)v1 + 2);
      do
      {
        unint64_t v4 = *((void *)v1 + 3);
        if (v3 >= v4 >> 1) {
          uint64_t v1 = sub_21C569ABC((char *)(v4 > 1), v3 + 1, 1, v1);
        }
        *((void *)v1 + 2) = v3 + 1;
        *(void *)&v1[8 * v3++ + 32] = 0;
        --v2;
      }
      while (v2);
    }
    return v1;
  }
  return result;
}

uint64_t sub_21C569D70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21C569DCC(uint64_t a1)
{
  return a1;
}

uint64_t sub_21C569DF8(uint64_t a1)
{
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for BRLTTranslationResult(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BRLTTranslationResult()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for BRLTTranslationResult(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for BRLTTranslationResult(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for BRLTTranslationResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BRLTTranslationResult(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BRLTTranslationResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BRLTTranslationResult()
{
  return &type metadata for BRLTTranslationResult;
}

uint64_t sub_21C56A088(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t BRLTEditString.string.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___BRLTEditStringInternal_string);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21C56A180()
{
  return *(void *)(v0 + OBJC_IVAR___BRLTEditStringInternal_selection);
}

uint64_t sub_21C56A198()
{
  return *(void *)(v0 + OBJC_IVAR___BRLTEditStringInternal_focus);
}

uint64_t sub_21C56A1B0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21C56A1C0()
{
  return *(void *)(v0 + OBJC_IVAR___BRLTEditStringInternal_suggestion);
}

void *sub_21C56A1D8()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges);
  id v2 = v1;
  return v1;
}

id sub_21C56A208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13)
{
  uint64_t v21 = (char *)objc_allocWithZone(v13);
  uint64_t v22 = &v21[OBJC_IVAR___BRLTEditStringInternal_string];
  *(void *)uint64_t v22 = a1;
  *((void *)v22 + 1) = a2;
  uint64_t v23 = &v21[OBJC_IVAR___BRLTEditStringInternal_selection];
  *(void *)uint64_t v23 = a3;
  *((void *)v23 + 1) = a4;
  v23[16] = a5 & 1;
  uint64_t v24 = &v21[OBJC_IVAR___BRLTEditStringInternal_focus];
  *(void *)uint64_t v24 = a6;
  *((void *)v24 + 1) = a7;
  v24[16] = a8 & 1;
  *(void *)&v21[OBJC_IVAR___BRLTEditStringInternal_tokenRanges] = a9;
  uint64_t v25 = &v21[OBJC_IVAR___BRLTEditStringInternal_suggestion];
  *(void *)uint64_t v25 = a10;
  *((void *)v25 + 1) = a11;
  v25[16] = a12 & 1;
  *(void *)&v21[OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges] = a13;
  v28.receiver = v21;
  v28.super_class = v13;
  return objc_msgSendSuper2(&v28, sel_init);
}

id sub_21C56A324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13)
{
  uint64_t v14 = &v13[OBJC_IVAR___BRLTEditStringInternal_string];
  *(void *)uint64_t v14 = a1;
  *((void *)v14 + 1) = a2;
  uint64_t v15 = &v13[OBJC_IVAR___BRLTEditStringInternal_selection];
  *(void *)uint64_t v15 = a3;
  *((void *)v15 + 1) = a4;
  v15[16] = a5 & 1;
  uint64_t v16 = &v13[OBJC_IVAR___BRLTEditStringInternal_focus];
  *(void *)uint64_t v16 = a6;
  *((void *)v16 + 1) = a7;
  v16[16] = a8 & 1;
  *(void *)&v13[OBJC_IVAR___BRLTEditStringInternal_tokenRanges] = a9;
  uint64_t v17 = &v13[OBJC_IVAR___BRLTEditStringInternal_suggestion];
  *(void *)uint64_t v17 = a10;
  *((void *)v17 + 1) = a11;
  v17[16] = a12 & 1;
  *(void *)&v13[OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges] = a13;
  v19.receiver = v13;
  v19.super_class = (Class)type metadata accessor for BRLTEditString();
  return objc_msgSendSuper2(&v19, sel_init);
}

uint64_t type metadata accessor for BRLTEditString()
{
  return self;
}

uint64_t sub_21C56A3FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, void, uint64_t, void, void, char, void))(v9 + 128))(a1, a2, a3, a4, a5 & 1, a6, a7, a8 & 1, a9, 0, 0, 1, 0);
}

uint64_t sub_21C56A44C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, uint64_t, void, void, void, char, void))(v5 + 128))(a1, a2, a3, a4, a5 & 1, 0, 0, 1, MEMORY[0x263F8EE78], 0, 0, 1, 0);
}

uint64_t sub_21C56A4A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, uint64_t, void, void, void, char, void))(v3 + 128))(a1, a2, a3, a3, 0, 0, 0, 1, MEMORY[0x263F8EE78], 0, 0, v5, 0);
}

unint64_t sub_21C56A508()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___BRLTEditStringInternal_selection);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___BRLTEditStringInternal_selection + 8);
  if (*(unsigned char *)(v0 + OBJC_IVAR___BRLTEditStringInternal_selection + 16)) {
    return v1;
  }
  unint64_t v3 = sub_21C56BA90(v2);
  unint64_t v4 = *(void *)(v0 + OBJC_IVAR___BRLTEditStringInternal_string + 8);
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = *(void *)(v0 + OBJC_IVAR___BRLTEditStringInternal_string) & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v6 = 4 * v5;
  while (v6 != v3 >> 14)
  {
    if (sub_21C589CD8() == 8429794 && v7 == 0xA300000000000000) {
      goto LABEL_12;
    }
    char v8 = sub_21C589EC8();
    swift_bridgeObjectRelease();
    if (v8) {
      break;
    }
    unint64_t v3 = sub_21C589C68();
    BOOL v9 = __OFADD__(v2++, 1);
    if (v9)
    {
      __break(1u);
LABEL_12:
      swift_bridgeObjectRelease();
      break;
    }
  }
  unint64_t result = sub_21C56BA90(v1);
  if (result >= 0x4000)
  {
    unint64_t v11 = sub_21C589C78();
    if (sub_21C589CD8() == 8429794 && v12 == 0xA300000000000000)
    {
LABEL_16:
      unint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      while (1)
      {
        char v13 = sub_21C589EC8();
        unint64_t result = swift_bridgeObjectRelease();
        if (v13) {
          break;
        }
        BOOL v9 = __OFSUB__(v1--, 1);
        if (v9)
        {
          __break(1u);
          goto LABEL_26;
        }
        if (v11 < 0x4000) {
          break;
        }
        unint64_t v11 = sub_21C589C78();
        if (sub_21C589CD8() == 8429794 && v14 == 0xA300000000000000) {
          goto LABEL_16;
        }
      }
    }
  }
  if (v2 >= v1) {
    return v1;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_21C56A710()
{
  uint64_t v1 = *(void *)((char *)v0 + OBJC_IVAR___BRLTEditStringInternal_selection);
  if ((*((unsigned char *)v0 + OBJC_IVAR___BRLTEditStringInternal_selection + 16) & 1) == 0)
  {
    if (v1 < 1 || v1 != *(void *)((char *)v0 + OBJC_IVAR___BRLTEditStringInternal_selection + 8)) {
      return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
    }
    sub_21C56BA90(v1 - 1);
    BOOL v4 = sub_21C589CD8() == 8429794 && v3 == 0xA300000000000000;
    uint64_t v5 = (void *)MEMORY[0x263F8EED0];
    if (v4)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v6 = sub_21C589EC8();
      swift_bridgeObjectRelease();
      if ((v6 & 1) == 0)
      {
        uint64_t v7 = v0;
LABEL_15:
        char v8 = v7;
        uint64_t v1 = (*(uint64_t (**)(void))((*v5 & *v7) + 0x88))();

        return v1;
      }
    }
    uint64_t v7 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, unint64_t, uint64_t, uint64_t, void))((*v5 & *v0) + 0xA8))(v1 - 1, v1, 0, 12558562, 0xA300000000000000, v1, v1, 0);
    goto LABEL_15;
  }
  return v1;
}

uint64_t sub_21C56A8C0()
{
  char v1 = 0;
  uint64_t v2 = (void *)((char *)v0 + OBJC_IVAR___BRLTEditStringInternal_selection);
  if ((*((unsigned char *)v0 + OBJC_IVAR___BRLTEditStringInternal_selection + 16) & 1) == 0 && *v2 >= 1)
  {
    uint64_t v3 = v2[1];
    uint64_t v4 = *v2 - (*v2 == v3);
    uint64_t v5 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0xD8);
    v5(v4, v3);
    uint64_t v6 = sub_21C589CB8();
    if (v7)
    {
      uint64_t v8 = v7;
      do
      {
        if (v6 == 8429794 && v8 == 0xA300000000000000)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v9 = sub_21C589EC8();
          swift_bridgeObjectRelease();
          if ((v9 & 1) == 0)
          {
            swift_bridgeObjectRelease();
            char v1 = 0;
            return v1 & 1;
          }
        }
        uint64_t v6 = sub_21C589CB8();
        uint64_t v8 = v10;
      }
      while (v10);
    }
    swift_bridgeObjectRelease();
    if (v4 >= 1)
    {
      if (((uint64_t (*)(uint64_t, uint64_t))v5)(v4 - 1, v4) != 8429794 || v11 != 0xA300000000000000)
      {
        char v13 = sub_21C589EC8();
        swift_bridgeObjectRelease();
        goto LABEL_18;
      }
      swift_bridgeObjectRelease();
    }
    char v13 = 1;
LABEL_18:
    if (v3 < sub_21C589C58())
    {
      if (((uint64_t (*)(uint64_t, uint64_t))v5)(v3, v3 + 1) != 8429794 || v14 != 0xA300000000000000)
      {
        char v16 = sub_21C589EC8();
        swift_bridgeObjectRelease();
        char v1 = v16 | v13;
        return v1 & 1;
      }
      swift_bridgeObjectRelease();
    }
    char v1 = 1;
  }
  return v1 & 1;
}

uint64_t sub_21C56AAFC(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR___BRLTEditStringInternal_tokenRanges);
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3) {
    return 0;
  }
  for (uint64_t i = v2 + 48; ; i += 24)
  {
    uint64_t v5 = *(void *)(i - 8);
    if (*(void *)(i - 16) <= a1)
    {
      BOOL v8 = __OFSUB__(v5, a1);
      BOOL v6 = v5 == a1;
      BOOL v7 = v5 - a1 < 0;
    }
    else
    {
      BOOL v8 = 0;
      BOOL v6 = 1;
      BOOL v7 = 0;
    }
    if (!(v7 ^ v8 | v6)) {
      break;
    }
    if (!--v3) {
      return 0;
    }
  }
  return *(void *)i;
}

id sub_21C56AB68(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a3)
  {
    uint64_t v59 = *(void *)(v8 + OBJC_IVAR___BRLTEditStringInternal_string);
    uint64_t v58 = *(void *)(v8 + OBJC_IVAR___BRLTEditStringInternal_string + 8);
    uint64_t v60 = *(void *)(v8 + OBJC_IVAR___BRLTEditStringInternal_focus);
    uint64_t v61 = *(void *)(v8 + OBJC_IVAR___BRLTEditStringInternal_focus + 8);
    char v62 = *(unsigned char *)(v8 + OBJC_IVAR___BRLTEditStringInternal_focus + 16);
    uint64_t v63 = *(void *)(v8 + OBJC_IVAR___BRLTEditStringInternal_tokenRanges);
    uint64_t v64 = (objc_class *)type metadata accessor for BRLTEditString();
    uint64_t v65 = (char *)objc_allocWithZone(v64);
    uint64_t v66 = &v65[OBJC_IVAR___BRLTEditStringInternal_string];
    *(void *)uint64_t v66 = v59;
    *((void *)v66 + 1) = v58;
    uint64_t v67 = &v65[OBJC_IVAR___BRLTEditStringInternal_selection];
    *(void *)uint64_t v67 = a6;
    *((void *)v67 + 1) = a7;
    v67[16] = a8 & 1;
    long long v68 = &v65[OBJC_IVAR___BRLTEditStringInternal_focus];
    *(void *)long long v68 = v60;
    *((void *)v68 + 1) = v61;
    v68[16] = v62;
    *(void *)&v65[OBJC_IVAR___BRLTEditStringInternal_tokenRanges] = v63;
    v69 = &v65[OBJC_IVAR___BRLTEditStringInternal_suggestion];
    *(void *)v69 = a1;
    *((void *)v69 + 1) = a2;
    v69[16] = 1;
    *(void *)&v65[OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges] = 0;
    v82.receiver = v65;
    v82.super_class = v64;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return objc_msgSendSuper2(&v82, sel_init);
  }
  else
  {
    sub_21C56BA90(a1);
    unint64_t v11 = sub_21C56BA90(a2);
    uint64_t v12 = v8 + OBJC_IVAR___BRLTEditStringInternal_string;
    uint64_t v13 = *(void *)(v8 + OBJC_IVAR___BRLTEditStringInternal_string);
    unint64_t v14 = *(void *)(v12 + 8);
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_21C589CE8();
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    unint64_t v22 = sub_21C5669DC(v11, v13, v14);
    uint64_t v70 = v23;
    unint64_t v71 = v22;
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v28 = MEMORY[0x21D4A95E0](v15, v17, v19, v21);
    uint64_t v30 = v29;
    swift_bridgeObjectRelease();
    sub_21C589C98();
    uint64_t v31 = MEMORY[0x21D4A9750](v28, v30);
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v76 = v71;
    uint64_t v77 = v70;
    uint64_t v78 = v25;
    uint64_t v79 = v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v38 = MEMORY[0x21D4A95E0](v31, v33, v35, v37);
    uint64_t v40 = v39;
    swift_bridgeObjectRelease();
    uint64_t v80 = v38;
    uint64_t v81 = v40;
    sub_21C56BB40();
    sub_21C589C98();
    uint64_t v41 = MEMORY[0x21D4A9750](v38, v40);
    uint64_t v43 = v42;
    uint64_t v45 = v44;
    uint64_t v47 = v46;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    uint64_t v48 = MEMORY[0x21D4A95E0](v41, v43, v45, v47);
    uint64_t v50 = v49;
    swift_bridgeObjectRelease();
    char v51 = (objc_class *)type metadata accessor for BRLTEditString();
    uint64_t v52 = (char *)objc_allocWithZone(v51);
    uint64_t v53 = (uint64_t *)&v52[OBJC_IVAR___BRLTEditStringInternal_string];
    *uint64_t v53 = v48;
    v53[1] = v50;
    unint64_t v54 = &v52[OBJC_IVAR___BRLTEditStringInternal_selection];
    *(void *)unint64_t v54 = a6;
    *((void *)v54 + 1) = a7;
    v54[16] = a8 & 1;
    long long v55 = &v52[OBJC_IVAR___BRLTEditStringInternal_focus];
    *(void *)long long v55 = 0;
    *((void *)v55 + 1) = 0;
    v55[16] = 1;
    *(void *)&v52[OBJC_IVAR___BRLTEditStringInternal_tokenRanges] = MEMORY[0x263F8EE78];
    uint64_t v56 = &v52[OBJC_IVAR___BRLTEditStringInternal_suggestion];
    *(void *)uint64_t v56 = 0;
    *((void *)v56 + 1) = 0;
    v56[16] = 1;
    *(void *)&v52[OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges] = 0;
    v75.receiver = v52;
    v75.super_class = v51;
    return objc_msgSendSuper2(&v75, sel_init);
  }
}

uint64_t sub_21C56AEFC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, void))((*MEMORY[0x263F8EED0] & *v6) + 0xA8))(a1, a2, a3 & 1, a4, a5, a6, a6, 0);
}

id sub_21C56AF3C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v8 = *(void *)(v3 + OBJC_IVAR___BRLTEditStringInternal_string);
  uint64_t v7 = *(void *)(v3 + OBJC_IVAR___BRLTEditStringInternal_string + 8);
  uint64_t v10 = *(void *)(v3 + OBJC_IVAR___BRLTEditStringInternal_focus);
  uint64_t v9 = *(void *)(v3 + OBJC_IVAR___BRLTEditStringInternal_focus + 8);
  char v11 = *(unsigned char *)(v3 + OBJC_IVAR___BRLTEditStringInternal_focus + 16);
  uint64_t v12 = *(void *)(v3 + OBJC_IVAR___BRLTEditStringInternal_tokenRanges);
  uint64_t v13 = (objc_class *)type metadata accessor for BRLTEditString();
  unint64_t v14 = (char *)objc_allocWithZone(v13);
  uint64_t v15 = &v14[OBJC_IVAR___BRLTEditStringInternal_string];
  *(void *)uint64_t v15 = v8;
  *((void *)v15 + 1) = v7;
  uint64_t v16 = &v14[OBJC_IVAR___BRLTEditStringInternal_selection];
  *(void *)uint64_t v16 = a1;
  *((void *)v16 + 1) = a2;
  v16[16] = a3 & 1;
  uint64_t v17 = &v14[OBJC_IVAR___BRLTEditStringInternal_focus];
  *(void *)uint64_t v17 = v10;
  *((void *)v17 + 1) = v9;
  v17[16] = v11;
  *(void *)&v14[OBJC_IVAR___BRLTEditStringInternal_tokenRanges] = v12;
  uint64_t v18 = &v14[OBJC_IVAR___BRLTEditStringInternal_suggestion];
  *(void *)uint64_t v18 = 0;
  *((void *)v18 + 1) = 0;
  v18[16] = 1;
  *(void *)&v14[OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges] = 0;
  v20.receiver = v14;
  v20.super_class = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v20, sel_init);
}

uint64_t sub_21C56B05C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))((*MEMORY[0x263F8EED0] & *v1) + 0xB8))(a1, a1, 0);
}

void sub_21C56B098(unsigned char *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)&a1[OBJC_IVAR___BRLTEditStringInternal_string + 8];
  uint64_t v97 = *(void *)&v1[OBJC_IVAR___BRLTEditStringInternal_string];
  uint64_t v98 = *(void *)&v1[OBJC_IVAR___BRLTEditStringInternal_string + 8];
  swift_bridgeObjectRetain();
  sub_21C589CA8();
  uint64_t v5 = (uint64_t *)&v3[OBJC_IVAR___BRLTEditStringInternal_focus];
  if (v3[OBJC_IVAR___BRLTEditStringInternal_focus + 16])
  {
    uint64_t v6 = *(void *)&v1[OBJC_IVAR___BRLTEditStringInternal_focus];
    uint64_t v90 = *(void *)&v1[OBJC_IVAR___BRLTEditStringInternal_focus + 8];
    char v89 = v1[OBJC_IVAR___BRLTEditStringInternal_focus + 16];
    goto LABEL_7;
  }
  uint64_t v8 = *v5;
  uint64_t v7 = v5[1];
  uint64_t v9 = sub_21C589C58();
  uint64_t v6 = v9 + v8;
  if (__OFADD__(v9, v8))
  {
    __break(1u);
    goto LABEL_76;
  }
  uint64_t v10 = sub_21C589C58();
  if (__OFADD__(v10, v7))
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  if (v10 + v7 < v6)
  {
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  uint64_t v90 = v10 + v7;
  char v89 = 0;
LABEL_7:
  char v11 = (uint64_t *)&v3[OBJC_IVAR___BRLTEditStringInternal_selection];
  if (v3[OBJC_IVAR___BRLTEditStringInternal_selection + 16])
  {
    uint64_t v94 = *(void *)&v2[OBJC_IVAR___BRLTEditStringInternal_selection];
    uint64_t v12 = *(void *)&v2[OBJC_IVAR___BRLTEditStringInternal_selection + 8];
    char v87 = v2[OBJC_IVAR___BRLTEditStringInternal_selection + 16];
    goto LABEL_13;
  }
  uint64_t v14 = *v11;
  uint64_t v13 = v11[1];
  uint64_t v15 = sub_21C589C58();
  uint64_t v94 = v15 + v14;
  if (__OFADD__(v15, v14)) {
    goto LABEL_78;
  }
  uint64_t v16 = sub_21C589C58();
  uint64_t v12 = v16 + v13;
  if (__OFADD__(v16, v13))
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  if (v12 < v94)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  char v87 = 0;
LABEL_13:
  uint64_t v88 = v12;
  long long v95 = v2;
  uint64_t v17 = *(char **)&v2[OBJC_IVAR___BRLTEditStringInternal_tokenRanges];
  uint64_t v18 = *(void *)&v3[OBJC_IVAR___BRLTEditStringInternal_tokenRanges];
  uint64_t v19 = *(void *)(v18 + 16);
  uint64_t v92 = v6;
  if (v19)
  {
    v93 = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v91 = v18;
    objc_super v20 = (uint64_t *)(v18 + 48);
    do
    {
      uint64_t v22 = *(v20 - 2);
      uint64_t v21 = *(v20 - 1);
      uint64_t v23 = *v20;
      uint64_t v24 = sub_21C589C58();
      BOOL v25 = __OFADD__(v24, v22);
      uint64_t v26 = v24 + v22;
      if (v25)
      {
        __break(1u);
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
        goto LABEL_66;
      }
      uint64_t v27 = sub_21C589C58();
      BOOL v25 = __OFADD__(v27, v21);
      uint64_t v28 = v27 + v21;
      if (v25) {
        goto LABEL_64;
      }
      if (v28 < v26) {
        goto LABEL_65;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v17 = sub_21C569BB8(0, *((void *)v17 + 2) + 1, 1, v17);
      }
      unint64_t v30 = *((void *)v17 + 2);
      unint64_t v29 = *((void *)v17 + 3);
      uint64_t v4 = v30 + 1;
      if (v30 >= v29 >> 1) {
        uint64_t v17 = sub_21C569BB8((char *)(v29 > 1), v30 + 1, 1, v17);
      }
      v20 += 3;
      *((void *)v17 + 2) = v4;
      uint64_t v31 = &v17[24 * v30];
      *((void *)v31 + 4) = v26;
      *((void *)v31 + 5) = v28;
      *((void *)v31 + 6) = v23;
      --v19;
    }
    while (v19);
    swift_bridgeObjectRelease();
    uint64_t v6 = v92;
    uint64_t v3 = v93;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  uint64_t v32 = (uint64_t *)&v3[OBJC_IVAR___BRLTEditStringInternal_suggestion];
  if ((v3[OBJC_IVAR___BRLTEditStringInternal_suggestion + 16] & 1) == 0)
  {
    uint64_t v37 = *v32;
    uint64_t v36 = v32[1];
    uint64_t v38 = sub_21C589C58();
    BOOL v25 = __OFADD__(v38, v37);
    uint64_t v39 = v38 + v37;
    if (!v25)
    {
      uint64_t v40 = sub_21C589C58();
      uint64_t v35 = v40 + v36;
      if (!__OFADD__(v40, v36))
      {
        if (v35 >= v39)
        {
          uint64_t v34 = v39;
          char v86 = 0;
          uint64_t v33 = v95;
          goto LABEL_31;
        }
LABEL_83:
        __break(1u);
LABEL_84:
        __break(1u);
        goto LABEL_85;
      }
LABEL_82:
      __break(1u);
      goto LABEL_83;
    }
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  uint64_t v33 = v95;
  uint64_t v34 = *(void *)&v95[OBJC_IVAR___BRLTEditStringInternal_suggestion];
  uint64_t v35 = *(void *)&v95[OBJC_IVAR___BRLTEditStringInternal_suggestion + 8];
  char v86 = v95[OBJC_IVAR___BRLTEditStringInternal_suggestion + 16];
LABEL_31:
  id v41 = objc_msgSend(objc_allocWithZone((Class)BRLTTextFormattingRanges), sel_init);
  uint64_t v42 = OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges;
  uint64_t v43 = *(void **)&v33[OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges];
  uint64_t v91 = v35;
  if (v43)
  {
    uint64_t v44 = v34;
    uint64_t v45 = v6;
    uint64_t v46 = v3;
    uint64_t v47 = v41;
    id v48 = v43;
    objc_msgSend(v48, sel_copy);
    sub_21C589DD8();

    swift_unknownObjectRelease();
    uint64_t v3 = v46;
    uint64_t v6 = v45;
    uint64_t v34 = v44;
    uint64_t v35 = v91;
    sub_21C56C500(0, &qword_267C89A50);
    swift_dynamicCast();
    id v41 = v96;
    uint64_t v42 = OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges;
  }
  unint64_t v49 = 0x267C89000;
  uint64_t v50 = *(void **)&v3[v42];
  if (!v50)
  {
LABEL_62:
    uint64_t v79 = (objc_class *)type metadata accessor for BRLTEditString();
    uint64_t v80 = (char *)objc_allocWithZone(v79);
    uint64_t v81 = &v80[OBJC_IVAR___BRLTEditStringInternal_string];
    *(void *)uint64_t v81 = v97;
    *((void *)v81 + 1) = v98;
    objc_super v82 = &v80[OBJC_IVAR___BRLTEditStringInternal_selection];
    *(void *)objc_super v82 = v94;
    *((void *)v82 + 1) = v88;
    v82[16] = v87;
    uint64_t v83 = &v80[OBJC_IVAR___BRLTEditStringInternal_focus];
    *(void *)uint64_t v83 = v6;
    *((void *)v83 + 1) = v90;
    v83[16] = v89;
    *(void *)&v80[OBJC_IVAR___BRLTEditStringInternal_tokenRanges] = v17;
    uint64_t v84 = &v80[*(void *)(v49 + 2608)];
    *(void *)uint64_t v84 = v34;
    *((void *)v84 + 1) = v35;
    v84[16] = v86;
    *(void *)&v80[OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges] = v41;
    v99.receiver = v80;
    v99.super_class = v79;
    objc_msgSendSuper2(&v99, sel_init);
    return;
  }
  v93 = v50;
  id v51 = objc_msgSend(v93, sel_boldRanges);
  sub_21C56C500(0, &qword_267C89A48);
  uint64_t v4 = sub_21C589D08();

  uint64_t v85 = v34;
  long long v95 = v41;
  if ((unint64_t)v4 >> 62) {
    goto LABEL_69;
  }
  uint64_t v52 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v53 = &off_26440C000;
  if (v52) {
    goto LABEL_36;
  }
LABEL_43:
  while (1)
  {
    swift_bridgeObjectRelease();
    id v61 = objc_msgSend(v93, sel_italicRanges);
    uint64_t v4 = sub_21C589D08();

    if ((unint64_t)v4 >> 62) {
      break;
    }
    uint64_t v62 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v62) {
      goto LABEL_45;
    }
LABEL_52:
    swift_bridgeObjectRelease();
    id v70 = objc_msgSend(v93, sel_underlineRanges);
    unint64_t v71 = sub_21C589D08();

    if (v71 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_21C589E88();
      swift_bridgeObjectRelease();
      if (!v4)
      {
LABEL_61:

        swift_bridgeObjectRelease();
        uint64_t v35 = v91;
        uint64_t v6 = v92;
        unint64_t v49 = 0x267C89000uLL;
        uint64_t v34 = v85;
        id v41 = v95;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v4 = *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v4) {
        goto LABEL_61;
      }
    }
    if (v4 < 1) {
      goto LABEL_86;
    }
    uint64_t v72 = 0;
    while (1)
    {
      id v73 = (v71 & 0xC000000000000001) != 0
          ? (id)MEMORY[0x21D4A97F0](v72, v71)
          : *(id *)(v71 + 8 * v72 + 32);
      unint64_t v74 = v73;
      uint64_t v75 = sub_21C589C58();
      unint64_t v76 = (char *)[v74 (SEL)v53[279]];
      BOOL v25 = __OFADD__(v75, v76);
      uint64_t v77 = &v76[v75];
      if (v25) {
        break;
      }
      ++v72;
      [v74 (SEL)v53[279]];
      objc_msgSend(v95, sel_addUnderlineRange_, v77, v78);

      if (v4 == v72) {
        goto LABEL_61;
      }
    }
    while (1)
    {
      __break(1u);
LABEL_69:
      swift_bridgeObjectRetain();
      uint64_t v52 = sub_21C589E88();
      swift_bridgeObjectRelease();
      uint64_t v53 = &off_26440C000;
      if (!v52) {
        break;
      }
LABEL_36:
      if (v52 < 1) {
        goto LABEL_84;
      }
      uint64_t v54 = 0;
      while (1)
      {
        id v55 = (v4 & 0xC000000000000001) != 0
            ? (id)MEMORY[0x21D4A97F0](v54, v4)
            : *(id *)(v4 + 8 * v54 + 32);
        uint64_t v56 = v55;
        uint64_t v57 = sub_21C589C58();
        uint64_t v58 = (char *)[v56 (SEL)v53[279]];
        BOOL v25 = __OFADD__(v57, v58);
        uint64_t v59 = &v58[v57];
        if (v25) {
          break;
        }
        ++v54;
        [v56 (SEL)v53[279]];
        objc_msgSend(v95, sel_addBoldRange_, v59, v60);

        if (v52 == v54) {
          goto LABEL_43;
        }
      }
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v62 = sub_21C589E88();
  swift_bridgeObjectRelease();
  if (!v62) {
    goto LABEL_52;
  }
LABEL_45:
  if (v62 >= 1)
  {
    uint64_t v63 = 0;
    while (1)
    {
      id v64 = (v4 & 0xC000000000000001) != 0
          ? (id)MEMORY[0x21D4A97F0](v63, v4)
          : *(id *)(v4 + 8 * v63 + 32);
      uint64_t v65 = v64;
      uint64_t v66 = sub_21C589C58();
      uint64_t v67 = (char *)[v65 (SEL)v53[279]];
      BOOL v25 = __OFADD__(v66, v67);
      long long v68 = &v67[v66];
      if (v25) {
        goto LABEL_67;
      }
      ++v63;
      [v65 (SEL)v53[279]];
      objc_msgSend(v95, sel_addItalicRange_, v68, v69);

      if (v62 == v63) {
        goto LABEL_52;
      }
    }
  }
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
}

id sub_21C56B8E4()
{
  uint64_t v8 = 0x80A0E2BFA0E2;
  unint64_t v9 = 0xA600000000000000;
  sub_21C589CA8();
  swift_bridgeObjectRetain();
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  uint64_t v0 = (objc_class *)type metadata accessor for BRLTEditString();
  uint64_t v1 = (char *)objc_allocWithZone(v0);
  uint64_t v2 = &v1[OBJC_IVAR___BRLTEditStringInternal_string];
  *(void *)uint64_t v2 = 0x80A0E2BFA0E2;
  *((void *)v2 + 1) = 0xA600000000000000;
  uint64_t v3 = &v1[OBJC_IVAR___BRLTEditStringInternal_selection];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
  uint64_t v4 = &v1[OBJC_IVAR___BRLTEditStringInternal_focus];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  *(void *)&v1[OBJC_IVAR___BRLTEditStringInternal_tokenRanges] = MEMORY[0x263F8EE78];
  uint64_t v5 = &v1[OBJC_IVAR___BRLTEditStringInternal_suggestion];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  *(void *)&v1[OBJC_IVAR___BRLTEditStringInternal_textFormattingRanges] = 0;
  v7.receiver = v1;
  v7.super_class = v0;
  return objc_msgSendSuper2(&v7, sel_init);
}

unint64_t sub_21C56B9FC(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = sub_21C56BA90(a1);
  unint64_t result = sub_21C56BA90(a2);
  if (result >> 14 < v3 >> 14)
  {
    __break(1u);
  }
  else
  {
    uint64_t v5 = sub_21C589CE8();
    uint64_t v6 = MEMORY[0x21D4A95E0](v5);
    swift_bridgeObjectRelease();
    return v6;
  }
  return result;
}

uint64_t sub_21C56BA90(uint64_t a1)
{
  if (a1 < 0) {
    return 15;
  }
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR___BRLTEditStringInternal_string);
  unint64_t v3 = *(void *)(v1 + OBJC_IVAR___BRLTEditStringInternal_string + 8);
  if (sub_21C589C58() >= a1)
  {
    return sub_21C589C88();
  }
  else
  {
    uint64_t v4 = HIBYTE(v3) & 0xF;
    if ((v3 & 0x2000000000000000) == 0) {
      uint64_t v4 = v2;
    }
    uint64_t v5 = v4 << 16;
    if ((v3 & 0x1000000000000000) == 0 || (v2 & 0x800000000000000) != 0) {
      return v5 | 7;
    }
    else {
      return v5 | 0xB;
    }
  }
}

unint64_t sub_21C56BB40()
{
  unint64_t result = qword_267C89A40;
  if (!qword_267C89A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C89A40);
  }
  return result;
}

uint64_t sub_21C56BB98(uint64_t a1)
{
  sub_21C5674C4(a1, (uint64_t)v5);
  if (!v6)
  {
    sub_21C567570((uint64_t)v5);
    goto LABEL_5;
  }
  type metadata accessor for BRLTEditString();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    char v2 = 0;
    return v2 & 1;
  }
  char v2 = sub_21C56C53C(v1, (uint64_t)v4);

  return v2 & 1;
}

uint64_t sub_21C56BD6C()
{
  sub_21C589E18();
  sub_21C589CA8();
  swift_bridgeObjectRetain();
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  sub_21C589CA8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C899E0);
  sub_21C589C18();
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  sub_21C589CA8();
  sub_21C589C18();
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  sub_21C589CA8();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___BRLTEditStringInternal_tokenRanges);
  swift_bridgeObjectRetain();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C89A58);
  MEMORY[0x21D4A96D0](v1, v2);
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21C589CA8();
  sub_21C589C18();
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  return 0;
}

id BRLTEditString.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void BRLTEditString.init()()
{
}

id BRLTEditString.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BRLTEditString();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t BRLTEditString.NSSelection.getter()
{
  return sub_21C56C138(&OBJC_IVAR___BRLTEditStringInternal_selection);
}

uint64_t BRLTEditString.NSFocus.getter()
{
  return sub_21C56C138(&OBJC_IVAR___BRLTEditStringInternal_focus);
}

uint64_t sub_21C56C118(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_21C57BDA4(*(void *)(a1 + *a3), *(void *)(a1 + *a3 + 8), *(unsigned char *)(a1 + *a3 + 16));
}

uint64_t BRLTEditString.NSSuggestion.getter()
{
  return sub_21C56C138(&OBJC_IVAR___BRLTEditStringInternal_suggestion);
}

uint64_t sub_21C56C138(void *a1)
{
  return sub_21C57BDA4(*(void *)(v1 + *a1), *(void *)(v1 + *a1 + 8), *(unsigned char *)(v1 + *a1 + 16));
}

id BRLTEditString.__allocating_init(string:NSSelection:NSFocus:token:NSSuggestion:textFormattingRanges:)(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  id v16 = objc_allocWithZone(v10);
  uint64_t v17 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(v16, sel_initWithString_NSSelection_NSFocus_token_NSSuggestion_textFormattingRanges_, v17, a3, a4, a5, a6, a7, a8, a9, a10);

  return v18;
}

uint64_t BRLTEditString.init(string:NSSelection:NSFocus:token:NSSuggestion:textFormattingRanges:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  id v18 = v10;
  uint64_t v19 = sub_21C57BDD8(a3, a4);
  uint64_t v38 = v20;
  uint64_t v39 = v19;
  char v22 = v21;
  uint64_t v23 = sub_21C57BDD8(a5, a6);
  uint64_t v36 = v24;
  uint64_t v37 = v23;
  char v26 = v25;
  uint64_t v27 = sub_21C57BDD8(a8, a9);
  uint64_t v29 = v28;
  char v31 = v30;
  uint64_t ObjectType = swift_getObjectType();

  __swift_instantiateConcreteTypeFromMangledName(&qword_267C89A08);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_21C58CBD0;
  uint64_t result = sub_21C589C58();
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v33 + 32) = 0;
    *(void *)(v33 + 40) = result;
    *(void *)(v33 + 48) = a7;
    uint64_t v35 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, _BYTE, uint64_t))(ObjectType + 128))(a1, a2, v39, v38, v22 & 1, v37, v36, v26 & 1, v33, v27, v29, v31 & 1, a10);
    swift_deallocPartialClassInstance();
    return v35;
  }
  return result;
}

uint64_t sub_21C56C500(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21C56C53C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + OBJC_IVAR___BRLTEditStringInternal_string) != *(void *)(a2
                                                                                + OBJC_IVAR___BRLTEditStringInternal_string)
    || *(void *)(a1 + OBJC_IVAR___BRLTEditStringInternal_string + 8) != *(void *)(a2
                                                                                    + OBJC_IVAR___BRLTEditStringInternal_string
                                                                                    + 8))
  {
    char v5 = sub_21C589EC8();
    uint64_t result = 0;
    if ((v5 & 1) == 0) {
      return result;
    }
  }
  objc_super v7 = (uint64_t *)(a1 + OBJC_IVAR___BRLTEditStringInternal_selection);
  uint64_t v8 = (uint64_t *)(a2 + OBJC_IVAR___BRLTEditStringInternal_selection);
  if (*(unsigned char *)(a1 + OBJC_IVAR___BRLTEditStringInternal_selection + 16))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___BRLTEditStringInternal_selection + 16)) {
      goto LABEL_15;
    }
    return 0;
  }
  if (*(unsigned char *)(a2 + OBJC_IVAR___BRLTEditStringInternal_selection + 16)) {
    return 0;
  }
  uint64_t v10 = *v7;
  uint64_t v9 = v7[1];
  uint64_t v12 = *v8;
  uint64_t v11 = v8[1];
  if (v10 != v12 || v9 != v11) {
    return 0;
  }
LABEL_15:
  int v14 = *(unsigned __int8 *)(a1 + OBJC_IVAR___BRLTEditStringInternal_focus + 16);
  unsigned int v15 = *(unsigned __int8 *)(a2 + OBJC_IVAR___BRLTEditStringInternal_focus + 16);
  uint64_t result = v14 & v15;
  if ((v14 & 1) == 0 && (v15 & 1) == 0) {
    return *(void *)(a1 + OBJC_IVAR___BRLTEditStringInternal_focus) == *(void *)(a2
  }
                                                                                   + OBJC_IVAR___BRLTEditStringInternal_focus)
        && *(void *)(a1 + OBJC_IVAR___BRLTEditStringInternal_focus + 8) == *(void *)(a2
                                                                                       + OBJC_IVAR___BRLTEditStringInternal_focus
                                                                                       + 8);
  return result;
}

uint64_t method lookup function for BRLTEditString(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BRLTEditString);
}

uint64_t dispatch thunk of BRLTEditString.tokenFor(location:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of BRLTEditString.appending(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t sub_21C56C694()
{
  return 0;
}

uint64_t sub_21C56C6F8()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_21C56C7AC(uint64_t a1)
{
  unint64_t v3 = (void *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_delegate);
  swift_beginAccess();
  *unint64_t v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_21C56C800@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x160))();
  *a2 = result;
  return result;
}

uint64_t sub_21C56C864(uint64_t a1, void **a2)
{
  objc_super v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x168);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t (*sub_21C56C8D0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21C56C974()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_backTranslateByCell);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21C56CA08(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_backTranslateByCell);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t sub_21C56CA54@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x190))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21C56CABC(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a2) + 0x198))(*a1);
}

uint64_t (*sub_21C56CB1C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21C56CB78()
{
  return 1;
}

uint64_t sub_21C56CBC8()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_technicalMode);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21C56CC5C(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_technicalMode);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t sub_21C56CCA8@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x1D8))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21C56CD10(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a2) + 0x1E0))(*a1);
}

uint64_t (*sub_21C56CD70())()
{
  return j__swift_endAccess;
}

uint64_t sub_21C56CE18()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_editable);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21C56CEAC(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editable);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t sub_21C56CEF8@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x220))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21C56CF60(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a2) + 0x228))(*a1);
}

uint64_t (*sub_21C56CFC0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21C56D064()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21C56D0F8(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t sub_21C56D144@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x280))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21C56D1AC(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (unsigned char *)(*a2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

void sub_21C56D1FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_allocWithZone((Class)BRLTTranslator);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_initWithDelegate_tableIdentifier_, a3, v6);

  swift_unknownObjectRelease();
  uint64_t v8 = *(void **)(v3 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator);
  *(void *)(v3 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator) = v7;

  id v9 = objc_allocWithZone((Class)BRLTTable);
  swift_bridgeObjectRetain();
  uint64_t v10 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v9, sel_initWithIdentifier_, v10);

  id v12 = objc_msgSend(v11, sel_candidateSelectionLanguage);
  sub_21C589C08();

  uint64_t v13 = sub_21C589C58();
  swift_bridgeObjectRelease();
  if (v13 <= 0) {
    unsigned __int8 v14 = objc_msgSend(v11, sel_supportsTranslationByCell);
  }
  else {
    unsigned __int8 v14 = 1;
  }

  *(unsigned char *)(v3 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) = v14;
}

void sub_21C56D384(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_allocWithZone((Class)BRLTTranslator);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_initWithDelegate_tableIdentifier_, a3, v6);

  swift_unknownObjectRelease();
  uint64_t v8 = *(void **)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_inputTranslator);
  *(void *)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_inputTranslator) = v7;

  id v9 = objc_allocWithZone((Class)BRLTTable);
  swift_bridgeObjectRetain();
  uint64_t v10 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  id v16 = objc_msgSend(v9, sel_initWithIdentifier_, v10);

  id v11 = objc_msgSend(v16, sel_candidateSelectionLanguage);
  uint64_t v12 = sub_21C589C08();
  uint64_t v14 = v13;

  sub_21C571AD4(v12, v14, 0);
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v16, sel_supportsTranslationByCell);
  (*(void (**)(id))((*MEMORY[0x263F8EED0] & *v3) + 0x198))(v15);
}

uint64_t sub_21C56D54C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = sub_21C589C08();
  uint64_t v10 = v9;
  swift_unknownObjectRetain();
  id v11 = a1;
  a5(v8, v10, a4);
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

id sub_21C56D5D8()
{
  id result = *(id *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_inputTranslator);
  if (result)
  {
    if (*(void *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator)) {
      return objc_msgSend(result, sel_isEqualTable_);
    }
    else {
      return 0;
    }
  }
  return result;
}

BOOL sub_21C56D624()
{
  return *(void *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager) != 0;
}

uint64_t sub_21C56D63C()
{
  if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x368))()) {
    return *((unsigned __int8 *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_editScript);
  }
  else {
    return 1;
  }
}

uint64_t sub_21C56D72C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
  if (!v1) {
    return 0;
  }
  char v2 = *(uint64_t (**)(uint64_t))(*(void *)v1 + 136);
  uint64_t v3 = swift_retain();
  LOBYTE(v2) = v2(v3);
  swift_release();
  return v2 & 1;
}

id sub_21C56D7D4()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_showingAlert)) {
    uint64_t v1 = &OBJC_IVAR___BRLTBrailleModelInternal_alertScript;
  }
  else {
    uint64_t v1 = &OBJC_IVAR___BRLTBrailleModelInternal_script;
  }
  return *(id *)(v0 + *v1);
}

void *sub_21C56D848()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_showingAlert) == 1)
  {
    uint64_t v1 = *(void **)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_alertBraille);
  }
  else
  {
    uint64_t v1 = *(void **)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    if (*(unsigned char *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_showingTerminalOutput) == 1)
    {
      char v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0xD0);
      uint64_t v3 = v1;
      uint64_t v4 = v2();

      return (void *)v4;
    }
  }
  return v1;
}

void sub_21C56D980()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange);
  if ((*(unsigned char *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) == 0)
  {
    uint64_t v5 = *v1;
    uint64_t v4 = v1[1];
    uint64_t v6 = *(void **)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    id v7 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v6) + 0xD8);
    uint64_t v8 = v6;
    v7(v5, v4);
    goto LABEL_6;
  }
  char v2 = (uint64_t *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange);
  if ((*(unsigned char *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange + 16) & 1) == 0)
  {
    uint64_t v3 = *(void **)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    if ((*((unsigned char *)v3 + OBJC_IVAR___BRLTEditStringInternal_selection + 16) & 1) == 0)
    {
      uint64_t v9 = *v2;
      uint64_t v10 = *(void *)((char *)v3 + OBJC_IVAR___BRLTEditStringInternal_selection + 8);
      if (v10 < *v2)
      {
        __break(1u);
        return;
      }
      id v11 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0xD8);
      uint64_t v8 = v3;
      v11(v9, v10);
LABEL_6:
    }
  }
}

uint64_t sub_21C56DAD0(uint64_t a1)
{
  long long v5 = *(_OWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
  long long v7 = *(_OWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
  long long v8 = v5;
  uint64_t v9 = v6;
  sub_21C571BC4((uint64_t)&v7);
  sub_21C571BC4((uint64_t)&v8);
  sub_21C569DCC((uint64_t)&v9);
  uint64_t v3 = sub_21C569330(a1);
  sub_21C571BF0((uint64_t)&v7);
  sub_21C571BF0((uint64_t)&v8);
  sub_21C569DF8((uint64_t)&v9);
  return v3;
}

id sub_21C56DC08()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BRLTBrailleModel()), sel_init);
  qword_267C89DD8 = (uint64_t)result;
  return result;
}

uint64_t *sub_21C56DC38()
{
  if (qword_267C89DD0 != -1) {
    swift_once();
  }
  return &qword_267C89DD8;
}

id static BRLTBrailleModel.shared.getter()
{
  if (qword_267C89DD0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_267C89DD8;
  return v0;
}

id sub_21C56DD3C()
{
  *(void *)&v0[OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator] = 0;
  *(void *)&v0[OBJC_IVAR___BRLTBrailleModelInternal_inputTranslator] = 0;
  *(void *)&v0[OBJC_IVAR___BRLTBrailleModelInternal_delegate] = 0;
  *(void *)&v0[OBJC_IVAR___BRLTBrailleModelInternal_candidateManager] = 0;
  v0[OBJC_IVAR___BRLTBrailleModelInternal_backTranslateByCell] = 0;
  v0[OBJC_IVAR___BRLTBrailleModelInternal_backTranslateLocally] = 1;
  v0[OBJC_IVAR___BRLTBrailleModelInternal_editScript] = 0;
  v0[OBJC_IVAR___BRLTBrailleModelInternal_technicalMode] = 0;
  v0[OBJC_IVAR___BRLTBrailleModelInternal_editable] = 0;
  uint64_t v1 = &v0[OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  v1[16] = 1;
  char v2 = &v0[OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange];
  *(void *)char v2 = 0;
  *((void *)v2 + 1) = 0;
  v2[16] = 1;
  uint64_t v3 = &v0[OBJC_IVAR___BRLTBrailleModelInternal_stageRange];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
  uint64_t v4 = &v0[OBJC_IVAR___BRLTBrailleModelInternal_candidateSelectionLanguage];
  *uint64_t v4 = 0;
  v4[1] = 0;
  *(void *)&v0[OBJC_IVAR___BRLTBrailleModelInternal_brailleCache] = 0;
  type metadata accessor for BRLTEditString();
  long long v5 = v0;
  *(void *)&v5[OBJC_IVAR___BRLTBrailleModelInternal_script] = sub_21C56A44C(0, 0xE000000000000000, 0, 0, 1);
  *(void *)&v5[OBJC_IVAR___BRLTBrailleModelInternal_braille] = sub_21C56A44C(0, 0xE000000000000000, 0, 0, 1);
  uint64_t v6 = MEMORY[0x263F8EE78];
  sub_21C568B44(0, 0xE000000000000000, 0, 0xE000000000000000, MEMORY[0x263F8EE78], v12);
  long long v7 = &v5[OBJC_IVAR___BRLTBrailleModelInternal_translationResult];
  long long v8 = v12[1];
  *(_OWORD *)long long v7 = v12[0];
  *((_OWORD *)v7 + 1) = v8;
  *((void *)v7 + 4) = v13;
  v5[OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty] = 0;
  v5[OBJC_IVAR___BRLTBrailleModelInternal_brailleSelectionDirty] = 0;
  v5[OBJC_IVAR___BRLTBrailleModelInternal_showingAlert] = 0;
  *(void *)&v5[OBJC_IVAR___BRLTBrailleModelInternal_alertScript] = sub_21C56A3FC(0, 0xE000000000000000, 0, 0, 1, 0, 0, 1, v6);
  *(void *)&v5[OBJC_IVAR___BRLTBrailleModelInternal_alertBraille] = sub_21C56A3FC(0, 0xE000000000000000, 0, 0, 1, 0, 0, 1, v6);
  v5[OBJC_IVAR___BRLTBrailleModelInternal_showingTerminalOutput] = 0;
  v5[OBJC_IVAR___BRLTBrailleModelInternal_isWordDescriptionActive] = 0;
  type metadata accessor for BRLTWordDescriptionManager();
  *(void *)&v5[OBJC_IVAR___BRLTBrailleModelInternal_wordDescriptionManager] = sub_21C567780();
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08958]), sel_init);
  *(void *)&v5[OBJC_IVAR___BRLTBrailleModelInternal_contentLock] = v9;
  *(void *)&v5[OBJC_IVAR___BRLTBrailleModelInternal_scriptHistory] = v6;
  *(void *)&v5[OBJC_IVAR___BRLTBrailleModelInternal_lastScriptOutputTime] = 0;

  v11.receiver = v5;
  v11.super_class = (Class)type metadata accessor for BRLTBrailleModel();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t sub_21C56DFE8()
{
  return 0;
}

uint64_t sub_21C56E018(void *a1)
{
  char v2 = v1;
  *((unsigned char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_showingAlert) = 0;
  uint64_t v4 = (void *)MEMORY[0x263F8EED0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x380))() & 1) != 0
    || ((*(uint64_t (**)(void))((*v4 & *v1) + 0x548))() & 1) != 0)
  {
    return sub_21C5740A4();
  }
  else
  {
    type metadata accessor for BRLTEditString();
    uint64_t v6 = OBJC_IVAR___BRLTBrailleModelInternal_script;
    id v7 = *(id *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_script);
    char v8 = sub_21C56BB94((uint64_t)v7, (uint64_t)a1);

    if (v8)
    {
      id v9 = (void *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_scriptHistory);
      swift_beginAccess();
      void *v9 = MEMORY[0x263F8EE78];
      return swift_bridgeObjectRelease();
    }
    uint64_t result = (*(uint64_t (**)(void))((*v4 & *v2) + 0x280))();
    if ((result & 1) == 0)
    {
      if (CFAbsoluteTimeGetCurrent()
         - *(double *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_lastScriptOutputTime) >= 5.0)
        goto LABEL_14;
      uint64_t v10 = (void *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_scriptHistory);
      swift_beginAccess();
      unint64_t v11 = *v10;
      swift_bridgeObjectRetain();
      sub_21C56E2B8((uint64_t)a1, v11);
      uint64_t v13 = v12;
      char v15 = v14;
      uint64_t result = swift_bridgeObjectRelease();
      if (v15)
      {
LABEL_14:
        id v16 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
        objc_msgSend(v16, sel_lock);
        uint64_t v17 = *(void **)((char *)v2 + v6);
        *(void *)((char *)v2 + v6) = a1;
        id v18 = a1;

        *((unsigned char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_showingTerminalOutput) = 0;
        sub_21C570F48();
        sub_21C5740A4();
        return (uint64_t)objc_msgSend(v16, sel_unlock);
      }
      else
      {
        if (__OFADD__(v13, 1))
        {
          __break(1u);
        }
        else if (((v13 + 1) & 0x8000000000000000) == 0)
        {
          swift_beginAccess();
          sub_21C574D0C(0, v13 + 1);
          return swift_endAccess();
        }
        __break(1u);
      }
    }
  }
  return result;
}

void sub_21C56E2B8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v4 = (id)MEMORY[0x21D4A97F0](0, a2);
      }
      else
      {
        if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v4 = *(id *)(a2 + 32);
      }
      long long v5 = v4;
      type metadata accessor for BRLTEditString();
      char v6 = sub_21C589D78();

      if ((v6 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          unint64_t v11 = i + 1;
          if (__OFADD__(i, 1)) {
            break;
          }
          if (v11 == v3) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v8 = (id)MEMORY[0x21D4A97F0](i + 1, a2);
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0) {
              goto LABEL_18;
            }
            if (v11 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_19;
            }
            id v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          id v9 = v8;
          char v10 = sub_21C589D78();

          if (v10) {
            return;
          }
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        uint64_t v3 = sub_21C589E88();
        swift_bridgeObjectRelease();
        if (v3) {
          continue;
        }
      }
      return;
    }
  }
}

void sub_21C56E4AC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator);
  if (v3)
  {
    long long v5 = *(void **)(v2 + OBJC_IVAR___BRLTBrailleModelInternal_alertScript);
    *(void *)(v2 + OBJC_IVAR___BRLTBrailleModelInternal_alertScript) = a1;
    id v10 = v3;
    id v6 = a1;

    char v7 = sub_21C568900() & 1;
    sub_21C568D98((uint64_t)v6, v7, (uint64_t)&v11);
    uint64_t v8 = v11;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v9 = *(void **)(v2 + OBJC_IVAR___BRLTBrailleModelInternal_alertBraille);
    *(void *)(v2 + OBJC_IVAR___BRLTBrailleModelInternal_alertBraille) = v8;

    *(unsigned char *)(v2 + OBJC_IVAR___BRLTBrailleModelInternal_showingAlert) = 1;
    sub_21C5740A4();
  }
}

uint64_t sub_21C56E608(void *a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_script);
  *(void *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_script) = a1;
  id v3 = a1;

  *(unsigned char *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_showingTerminalOutput) = 1;
  sub_21C570F48();
  return sub_21C5740A4();
}

uint64_t sub_21C56E6F4()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x370))();
  if ((result & 1) == 0)
  {
    if (((*(uint64_t (**)(void))((*v1 & *v0) + 0x280))() & 1) != 0
      || *((unsigned char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleSelectionDirty) == 1)
    {
      id v3 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
      objc_msgSend(v3, sel_lock);
      if (*((unsigned char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) == 1) {
        sub_21C5709B8();
      }
      else {
        sub_21C5706BC();
      }
      objc_msgSend(v3, sel_unlock);
    }
    return sub_21C5740A4();
  }
  return result;
}

void sub_21C56E84C(void *a1)
{
  uint64_t v2 = v1;
  id v4 = (void *)MEMORY[0x263F8EED0];
  long long v5 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x548);
  if ((v5() & 1) == 0)
  {
    uint64_t v8 = *(uint64_t (**)(void))((*v4 & *v1) + 0x370);
    if (v8() & 1) != 0 && (sub_21C56ED54(a1)) {
      return;
    }
    uint64_t v20 = *(uint64_t (**)(void))((*v4 & *v1) + 0x220);
    uint64_t v9 = v20();
    if ((v9 & 1) == 0)
    {
      uint64_t v10 = OBJC_IVAR___BRLTBrailleModelInternal_braille;
      if (*(unsigned char *)(*(void *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille)
                    + OBJC_IVAR___BRLTEditStringInternal_selection
                    + 16) == 1)
      {
        type metadata accessor for BRLTEditString();
        uint64_t v11 = sub_21C56A3FC(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, MEMORY[0x263F8EE78]);
        uint64_t v12 = *(void **)((char *)v1 + v10);
        *(void *)((char *)v1 + v10) = v11;

        uint64_t v13 = (char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange;
        v13[16] = 0;
        *(void *)uint64_t v13 = 0;
        *((void *)v13 + 1) = 0;
        char v14 = (char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange;
        v14[16] = 0;
        *(void *)char v14 = 0;
        *((void *)v14 + 1) = 0;
        uint64_t v9 = (*(uint64_t (**)(void))((*v4 & *v1) + 0x378))();
        if (v9)
        {
          char v15 = (char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
          *(void *)char v15 = 0;
          *((void *)v15 + 1) = 0;
          v15[16] = 0;
        }
      }
    }
    uint64_t v16 = *(void *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille)
        + OBJC_IVAR___BRLTEditStringInternal_selection;
    if ((*(unsigned char *)(v16 + 16) & 1) == 0
      && *(void *)v16 != *(void *)(*(void *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille)
                                     + OBJC_IVAR___BRLTEditStringInternal_selection
                                     + 8))
    {
      uint64_t v9 = sub_21C56F0F0(objc_msgSend(a1, sel_bits) != 0, 1);
    }
    if (((uint64_t (*)(uint64_t))v8)(v9))
    {
      if (objc_msgSend(a1, sel_bits))
      {
        sub_21C56EEB8(a1);
        goto LABEL_30;
      }
      char v18 = sub_21C572FA0();
      sub_21C56EEB8(a1);
      if (v18) {
        goto LABEL_30;
      }
      uint64_t v17 = *(void **)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
      objc_msgSend(v17, sel_lock);
      if ((*((unsigned char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) & 1) == 0) {
        goto LABEL_28;
      }
    }
    else
    {
      sub_21C56EEB8(a1);
      if (objc_msgSend(a1, sel_bits)
        && (((*(uint64_t (**)(void))((*v4 & *v1) + 0x190))() & 1) == 0 || (v20() & 1) == 0))
      {
        goto LABEL_30;
      }
      uint64_t v17 = *(void **)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
      objc_msgSend(v17, sel_lock);
      if (*((unsigned char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) != 1)
      {
LABEL_28:
        sub_21C5706BC();
        goto LABEL_29;
      }
    }
    sub_21C5709B8();
LABEL_29:
    objc_msgSend(v17, sel_unlock);
    goto LABEL_30;
  }
  if ((v5() & 1) == 0) {
    return;
  }
  (*(void (**)(void))((*v4 & *v1) + 0x550))(0);
  id v6 = *(void **)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
  if (v6)
  {
    char v7 = *(void **)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    *(void *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v6;
    id v19 = v6;

    sub_21C5740A4();

    return;
  }
  sub_21C570F48();
LABEL_30:
  sub_21C5740A4();
}

uint64_t sub_21C56ED54(void *a1)
{
  uint64_t v2 = (void *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange);
  if (*((unsigned char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16)) {
    return 0;
  }
  uint64_t v4 = *v2;
  uint64_t v5 = v2[1];
  id v6 = (void *)MEMORY[0x263F8EED0];
  char v7 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x380))();
  unsigned int v8 = objc_msgSend(a1, sel_bits);
  if (v7)
  {
    if (v8 == 1)
    {
      (*(void (**)(void))((*v6 & *v1) + 0x520))();
    }
    else if (objc_msgSend(a1, sel_bits) == 8 || !objc_msgSend(a1, sel_bits))
    {
      (*(void (**)(void))((*v6 & *v1) + 0x518))();
    }
    return 1;
  }
  BOOL v9 = v8 || v4 == v5;
  if (v9 || (sub_21C572FA0() & 1) != 0) {
    return 0;
  }
  sub_21C571C1C();
  return 1;
}

void sub_21C56EEB8(void *a1)
{
  uint64_t v2 = OBJC_IVAR___BRLTBrailleModelInternal_braille;
  id v3 = *(char **)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
  uint64_t v4 = &v3[OBJC_IVAR___BRLTEditStringInternal_selection];
  if ((v3[OBJC_IVAR___BRLTEditStringInternal_selection + 16] & 1) == 0)
  {
    uint64_t v5 = v1;
    id v6 = (uint64_t *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange);
    if ((*(unsigned char *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange + 16) & 1) == 0)
    {
      uint64_t v7 = *(void *)v4;
      uint64_t v8 = *(void *)v4 + 1;
      if (__OFADD__(*(void *)v4, 1))
      {
        __break(1u);
      }
      else
      {
        uint64_t v10 = *((void *)v4 + 1);
        uint64_t v24 = *v6;
        uint64_t v25 = v6[1];
        uint64_t v11 = v3;
        id v12 = objc_msgSend(a1, sel_unicode);
        uint64_t v13 = sub_21C589C08();
        uint64_t v15 = v14;

        uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, void))((*MEMORY[0x263F8EED0] & *(void *)v11) + 0xA8))(v7, v10, 0, v13, v15, v8, v8, 0);
        swift_bridgeObjectRelease();
        uint64_t v17 = *(void **)(v5 + v2);
        *(void *)(v5 + v2) = v16;

        uint64_t v18 = v25 + 1;
        if (!__OFADD__(v25, 1))
        {
          if (v18 >= v24)
          {
            *id v6 = v24;
            v6[1] = v18;
            *((unsigned char *)v6 + 16) = 0;
            id v19 = (unsigned char *)(v5 + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty);
            swift_beginAccess();
            *id v19 = 1;
            *(unsigned char *)(v5 + OBJC_IVAR___BRLTBrailleModelInternal_brailleSelectionDirty) = 1;
            uint64_t v20 = v5 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
            if (*(unsigned char *)(v5 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16))
            {
LABEL_10:
              sub_21C5740A4();
              return;
            }
            uint64_t v21 = *(void *)(v20 + 8);
            BOOL v22 = __OFADD__(v21, 1);
            uint64_t v23 = v21 + 1;
            if (!v22)
            {
              if (v23 >= *(void *)v20)
              {
                *(void *)(v20 + 8) = v23;
                *(unsigned char *)(v20 + 16) = 0;
                goto LABEL_10;
              }
LABEL_16:
              __break(1u);
              return;
            }
LABEL_15:
            __break(1u);
            goto LABEL_16;
          }
LABEL_14:
          __break(1u);
          goto LABEL_15;
        }
      }
      __break(1u);
      goto LABEL_14;
    }
  }
}

uint64_t sub_21C56F0A4(char a1)
{
  return sub_21C56F0F0(0, a1);
}

uint64_t sub_21C56F0F0(char a1, char a2)
{
  uint64_t v5 = (void *)MEMORY[0x263F8EED0];
  id v6 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x548);
  if (v6())
  {
    if (v6())
    {
      (*(void (**)(void))((*v5 & *v2) + 0x550))(0);
      uint64_t v7 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
      if (v7)
      {
        uint64_t v8 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
        *(void *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v7;
        id v9 = v7;

        sub_21C5740A4();
      }
      else
      {
        sub_21C570F48();
        sub_21C5740A4();
      }
    }
    return 1;
  }
  if ((*(uint64_t (**)(void))((*v5 & *v2) + 0x380))())
  {
    sub_21C57284C();
    return 1;
  }
  if (*((unsigned char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) != 1
    || (uint64_t v10 = *(void *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_script)
            + OBJC_IVAR___BRLTEditStringInternal_selection,
        (*(unsigned char *)(v10 + 16) & 1) != 0)
    || (uint64_t v11 = *(void *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille)
            + OBJC_IVAR___BRLTEditStringInternal_selection,
        (*(unsigned char *)(v11 + 16) & 1) != 0)
    || *(void *)v10 == *(void *)(v10 + 8)
    && ((*((unsigned char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) != 0
     || (*(void *)v11 == *(void *)(v11 + 8)
       ? (BOOL v12 = *(void *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange) == *(void *)v11)
       : (BOOL v12 = 0),
         !v12)))
  {
    return sub_21C56F308(a1 & 1, a2 & 1);
  }
  else
  {
    return sub_21C56F800();
  }
}

uint64_t sub_21C56F308(char a1, char a2)
{
  uint64_t v3 = OBJC_IVAR___BRLTBrailleModelInternal_braille;
  uint64_t v4 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
  uint64_t v5 = (void *)((char *)v4 + OBJC_IVAR___BRLTEditStringInternal_selection);
  if (*((unsigned char *)v4 + OBJC_IVAR___BRLTEditStringInternal_selection + 16)) {
    return 0;
  }
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  if (*v5 <= 0 && v6 == v7) {
    return 0;
  }
  id v9 = v2;
  BOOL v12 = (void *)MEMORY[0x263F8EED0];
  uint64_t v13 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v4) + 0x90);
  uint64_t v14 = v4;
  uint64_t v15 = v13();
  uint64_t v55 = v16;
  LOBYTE(v13) = v17;

  if (v13) {
    return 0;
  }
  char v54 = a1;
  uint64_t v18 = *(void **)((char *)v9 + v3);
  id v19 = *(uint64_t (**)(void))((*v12 & *v18) + 0x98);
  uint64_t v20 = v18;
  char v21 = v19();

  BOOL v22 = (char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult;
  long long v58 = *(_OWORD *)((char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
  uint64_t v59 = *(void *)((char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
  long long v60 = *(_OWORD *)((char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
  long long v61 = v58;
  uint64_t v62 = v59;
  sub_21C571BC4((uint64_t)&v60);
  sub_21C571BC4((uint64_t)&v61);
  sub_21C569DCC((uint64_t)&v62);
  uint64_t v23 = sub_21C569330(v15);
  sub_21C571BF0((uint64_t)&v60);
  sub_21C571BF0((uint64_t)&v61);
  sub_21C569DF8((uint64_t)&v62);
  uint64_t v24 = sub_21C56FAD0(v55);
  long long v56 = *((_OWORD *)v22 + 1);
  uint64_t v57 = *((void *)v22 + 4);
  long long v63 = *(_OWORD *)v22;
  long long v64 = v56;
  v65[0] = v57;
  sub_21C571BC4((uint64_t)&v63);
  sub_21C571BC4((uint64_t)&v64);
  sub_21C569DCC((uint64_t)v65);
  uint64_t v25 = sub_21C569330(v24);
  sub_21C571BF0((uint64_t)&v63);
  sub_21C571BF0((uint64_t)&v64);
  uint64_t result = sub_21C569DF8((uint64_t)v65);
  if (v25 < v23)
  {
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v27 = (char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange;
  *(void *)uint64_t v27 = v23;
  *((void *)v27 + 1) = v25;
  v27[16] = 0;
  char v53 = v21;
  if (v6 != v7)
  {
    uint64_t v28 = v6;
    goto LABEL_16;
  }
  uint64_t v28 = v6 - 1;
  if (__OFSUB__(v6, 1)) {
    goto LABEL_30;
  }
  if (v6 < v28)
  {
LABEL_31:
    __break(1u);
    return result;
  }
  if ((a2 & 1) == 0)
  {
    char v30 = *(void **)((char *)v9 + v3);
    char v31 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v30) + 0xD8);
    uint64_t v32 = v30;
    v31(v6 - 1, v6);

    id v33 = objc_allocWithZone((Class)BRLTBrailleChar);
    uint64_t v34 = (void *)sub_21C589BF8();
    uint64_t v29 = (void *)MEMORY[0x263F8EED0];
    swift_bridgeObjectRelease();
    id v35 = objc_msgSend(v33, sel_initWithUnicode_, v34);

    uint64_t v36 = (void *)(*(uint64_t (**)(void))((*v29 & *v9) + 0x160))();
    if (v36)
    {
      objc_msgSend(v36, sel_didDeleteBrailleChar_, v35);

      swift_unknownObjectRelease();
    }
    else
    {
    }
    uint64_t v7 = v6;
    goto LABEL_21;
  }
  uint64_t v7 = v6;
LABEL_16:
  uint64_t v29 = (void *)MEMORY[0x263F8EED0];
LABEL_21:
  uint64_t v37 = *(void **)((char *)v9 + v3);
  uint64_t v38 = *(uint64_t (**)(uint64_t, uint64_t, void, void, unint64_t, uint64_t))((*v29 & *v37) + 0xB0);
  uint64_t v39 = v37;
  uint64_t v40 = v38(v28, v7, 0, 0, 0xE000000000000000, v28);

  id v41 = *(void **)((char *)v9 + v3);
  *(void *)((char *)v9 + v3) = v40;

  uint64_t v42 = *(void **)((char *)v9 + v3);
  uint64_t v43 = *(uint64_t (**)(void))((*v29 & *v42) + 0x88);
  uint64_t v44 = v42;
  uint64_t v45 = v43();
  uint64_t v47 = v46;
  char v49 = v48;

  uint64_t v50 = (char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange;
  *(void *)uint64_t v50 = v45;
  *((void *)v50 + 1) = v47;
  v50[16] = v49 & 1;
  id v51 = (char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty;
  swift_beginAccess();
  *id v51 = 1;
  *((unsigned char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_brailleSelectionDirty) = 1;
  sub_21C56FA40(v28, v7);
  if ((v54 & 1) == 0 && (v50[16] & 1) == 0 && (*(void *)v50 == *((void *)v50 + 1)) | v53 & 1)
  {
    uint64_t v52 = *(void **)((char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
    objc_msgSend(v52, sel_lock);
    if (*((unsigned char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) == 1) {
      sub_21C5709B8();
    }
    else {
      sub_21C5706BC();
    }
    objc_msgSend(v52, sel_unlock);
  }
  sub_21C5740A4();
  return 1;
}

uint64_t sub_21C56F800()
{
  uint64_t v1 = OBJC_IVAR___BRLTBrailleModelInternal_script;
  uint64_t v2 = *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_script);
  uint64_t v3 = (uint64_t *)(v2 + OBJC_IVAR___BRLTEditStringInternal_selection);
  if (*(unsigned char *)(v2 + OBJC_IVAR___BRLTEditStringInternal_selection + 16)) {
    return 0;
  }
  uint64_t v5 = v0;
  uint64_t v6 = *v3;
  uint64_t v7 = v3[1];
  if (*v3 == v7)
  {
    if (v6 < 1) {
      return 0;
    }
    uint64_t v7 = *v3;
    --v6;
  }
  uint64_t v8 = (uint64_t *)(v2 + OBJC_IVAR___BRLTEditStringInternal_string);
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_21C57BE6C(v9, v10, v7);
  swift_bridgeObjectRelease();
  BOOL v12 = (uint64_t *)(*(void *)((char *)v5 + v1) + OBJC_IVAR___BRLTEditStringInternal_string);
  uint64_t v13 = *v12;
  uint64_t v14 = v12[1];
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_21C57BE6C(v13, v14, v6);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v16 = v7 - v6;
  if (__OFSUB__(v7, v6))
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t result = v11 - v16;
  if (__OFSUB__(v11, v16))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v11 < result)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  uint64_t v17 = sub_21C57BDA4(result, v11, 0);
  uint64_t v19 = v18;
  uint64_t v20 = *(void **)((char *)v5 + v1);
  char v21 = (void *)MEMORY[0x263F8EED0];
  BOOL v22 = *(uint64_t (**)(uint64_t, uint64_t, void, void, unint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v20)
                                                                                              + 0xB0);
  uint64_t v23 = v20;
  uint64_t v24 = v22(v6, v7, 0, 0, 0xE000000000000000, v6);

  uint64_t v25 = *(void **)((char *)v5 + v1);
  *(void *)((char *)v5 + v1) = v24;

  uint64_t v26 = (*(uint64_t (**)(void))((*v21 & *v5) + 0x160))();
  if (v26)
  {
    uint64_t v27 = (void *)v26;
    uint64_t v28 = (void *)sub_21C589BF8();
    objc_msgSend(v27, sel_didReplaceScriptStringRange_withScriptString_cursorLocation_, v17, v19, v28, v15);

    swift_unknownObjectRelease();
  }
  sub_21C570F48();
  sub_21C5740A4();
  return 1;
}

uint64_t sub_21C56FA40(uint64_t result, uint64_t a2)
{
  uint64_t v3 = v2 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
  if ((*(unsigned char *)(v2 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) == 0)
  {
    uint64_t v4 = *(void *)(v3 + 8);
    if (*(void *)v3 >= result) {
      goto LABEL_8;
    }
    if (v4 > a2)
    {
      uint64_t v5 = a2 - result;
      if (__OFSUB__(a2, result))
      {
        __break(1u);
      }
      else
      {
        uint64_t result = v4 - v5;
        if (!__OFSUB__(v4, v5))
        {
          if (result < *(void *)v3)
          {
            __break(1u);
LABEL_8:
            uint64_t v6 = result;
            if (v4 <= a2)
            {
LABEL_12:
              *(void *)uint64_t v3 = result;
              uint64_t result = v6;
              goto LABEL_13;
            }
            uint64_t v7 = a2 - result;
            if (!__OFSUB__(a2, result))
            {
              BOOL v8 = __OFSUB__(v4, v7);
              uint64_t v6 = v4 - v7;
              if (!v8)
              {
                if (v6 >= result) {
                  goto LABEL_12;
                }
LABEL_19:
                __break(1u);
                return result;
              }
LABEL_18:
              __break(1u);
              goto LABEL_19;
            }
LABEL_17:
            __break(1u);
            goto LABEL_18;
          }
          goto LABEL_13;
        }
      }
      __break(1u);
      goto LABEL_17;
    }
LABEL_13:
    *(void *)(v3 + 8) = result;
    *(unsigned char *)(v3 + 16) = 0;
  }
  return result;
}

uint64_t sub_21C56FAD0(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange);
  if (*(unsigned char *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange + 16)) {
    return 0;
  }
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange);
  if (*(unsigned char *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange + 16)) {
    return 0;
  }
  uint64_t v6 = *v2;
  uint64_t v7 = v2[1];
  uint64_t v9 = *v3;
  uint64_t v8 = v3[1];
  long long v17 = *(_OWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
  uint64_t v18 = *(void *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
  long long v19 = *(_OWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
  long long v20 = v17;
  uint64_t v21 = v18;
  sub_21C571BC4((uint64_t)&v19);
  sub_21C571BC4((uint64_t)&v20);
  sub_21C569DCC((uint64_t)&v21);
  uint64_t v10 = sub_21C56927C(v9, v8);
  uint64_t v12 = v11;
  sub_21C571BF0((uint64_t)&v19);
  sub_21C571BF0((uint64_t)&v20);
  uint64_t result = sub_21C569DF8((uint64_t)&v21);
  uint64_t v13 = v7 - v6;
  if (__OFSUB__(v7, v6))
  {
    __break(1u);
    goto LABEL_10;
  }
  BOOL v14 = __OFSUB__(a1, v13);
  uint64_t v15 = a1 - v13;
  if (v14)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v16 = v12 - v10;
  if (__OFSUB__(v12, v10))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t result = v15 + v16;
  if (__OFADD__(v15, v16)) {
LABEL_12:
  }
    __break(1u);
  return result;
}

uint64_t sub_21C56FBDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_21C57BDD8(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v2) + 0x458);
  return v4(v3);
}

uint64_t sub_21C56FCE0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = (void *)MEMORY[0x263F8EED0];
  if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0x380))()) {
    return 0;
  }
  if (((*(uint64_t (**)(void))((*v7 & *v3) + 0x220))() & 1) != 0
    && (*((unsigned char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_showingAlert) & 1) == 0)
  {
    if (((*(uint64_t (**)(void))((*v7 & *v3) + 0x370))() & 1) != 0
      && (*((unsigned char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) == 0
      && *(void *)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange) != *(void *)((char *)v3
                                                                                                + OBJC_IVAR___BRLTBrailleModelInternal_stageRange
                                                                                                + 8))
    {
      BOOL v14 = *(void **)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
      objc_msgSend(v14, sel_lock);
      if (*((unsigned char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) == 1) {
        sub_21C5709B8();
      }
      else {
        sub_21C5706BC();
      }
      objc_msgSend(v14, sel_unlock);
      sub_21C5740A4();
      return 0;
    }
    uint64_t v9 = *(uint64_t (**)(void))((*v7 & *v3) + 0x548);
    if (v9())
    {
      if (v9())
      {
        (*(void (**)(void))((*v7 & *v3) + 0x550))(0);
        uint64_t v10 = *(void **)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
        if (v10)
        {
          uint64_t v11 = *(void **)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
          *(void *)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v10;
          id v12 = v10;

          sub_21C5740A4();
        }
        else
        {
          sub_21C570F48();
          sub_21C5740A4();
        }
      }
      return 0;
    }
    uint64_t v13 = a3 & 1;
    if (*((unsigned char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) != 1)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))((*v7 & *v3) + 0x460))(a1, a2, v13);
      return 0;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))((*v7 & *v3) + 0x468))(a1, a2, v13);
  }
  return 1;
}

uint64_t sub_21C56FFAC(uint64_t result, uint64_t a2, char a3)
{
  if (a3) {
    return result;
  }
  uint64_t v4 = v3;
  uint64_t v5 = a2;
  uint64_t v6 = result;
  uint64_t v7 = OBJC_IVAR___BRLTBrailleModelInternal_braille;
  uint64_t v8 = *(void **)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
  uint64_t v9 = *(void *)((char *)v8 + OBJC_IVAR___BRLTEditStringInternal_selection);
  uint64_t v10 = *(void *)((char *)v8 + OBJC_IVAR___BRLTEditStringInternal_selection + 8);
  int v11 = *((unsigned __int8 *)v8 + OBJC_IVAR___BRLTEditStringInternal_selection + 16);
  if ((v11 & 1) == 0)
  {
    BOOL v12 = v9 == result && v10 == a2;
    if (v12 && result == a2)
    {
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_21C589C58();
      swift_bridgeObjectRelease();
      if (v14 <= v6) {
        uint64_t v5 = v6;
      }
      else {
        uint64_t v5 = v6 + 1;
      }
      uint64_t v8 = *(void **)((char *)v4 + v7);
      uint64_t v6 = v5;
    }
  }
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, void))((*MEMORY[0x263F8EED0] & *v8) + 0xB8);
  uint64_t v16 = v8;
  uint64_t v17 = v15(v6, v5, 0);

  uint64_t v18 = *(void **)((char *)v4 + v7);
  *(void *)((char *)v4 + v7) = v17;

  if ((v11 & 1) != 0 || (v6 == v9 ? (BOOL v19 = v5 == v10) : (BOOL v19 = 0), !v19)) {
    *((unsigned char *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_brailleSelectionDirty) = 1;
  }
  long long v20 = (void *)MEMORY[0x263F8EED0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v4) + 0x280))() & 1) == 0
    && ((*(uint64_t (**)(void))((*v20 & *v4) + 0x378))() & 1) != 0
    && (*((unsigned char *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) == 0)
  {
    if (*(void *)((char *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange) == *(void *)((char *)v4
                                                                                                + OBJC_IVAR___BRLTBrailleModelInternal_stageRange
                                                                                                + 8))
      char v23 = 1;
    else {
      char v23 = v11;
    }
    if ((v23 & 1) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v11) {
LABEL_25:
  }
    sub_21C571108();
LABEL_26:
  uint64_t v21 = *(void **)((char *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
  objc_msgSend(v21, sel_lock);
  if (*((unsigned char *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) == 1) {
    sub_21C5709B8();
  }
  else {
    sub_21C5706BC();
  }
  if (((*(uint64_t (**)(id))((*v20 & *v4) + 0x378))(objc_msgSend(v21, sel_unlock)) & 1) != 0 && v6 == v5)
  {
    BOOL v22 = (char *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
    if (*((unsigned char *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) == 1)
    {
      *(void *)BOOL v22 = v5;
      *((void *)v22 + 1) = v5;
      v22[16] = 0;
    }
  }
  return sub_21C5740A4();
}

uint64_t sub_21C570290(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_script)
       + OBJC_IVAR___BRLTEditStringInternal_selection;
    if ((*(unsigned char *)(v5 + 16) & 1) == 0)
    {
      uint64_t v7 = result;
      uint64_t v8 = *(void *)v5;
      uint64_t v9 = *(void *)(v5 + 8);
      uint64_t v10 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0x280);
      char v11 = v10();
      if (v10())
      {
        BOOL v12 = *(void **)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
        objc_msgSend(v12, sel_lock);
        if (*((unsigned char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) == 1) {
          sub_21C5709B8();
        }
        else {
          sub_21C5706BC();
        }
        objc_msgSend(v12, sel_unlock);
      }
      uint64_t v13 = (char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult;
      long long v39 = *(_OWORD *)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
      uint64_t v40 = *(void *)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
      long long v41 = *(_OWORD *)((char *)v3 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
      long long v42 = v39;
      uint64_t v43 = v40;
      sub_21C571BC4((uint64_t)&v41);
      sub_21C571BC4((uint64_t)&v42);
      sub_21C569DCC((uint64_t)&v43);
      uint64_t v14 = sub_21C5693E8(v7, a2);
      uint64_t v16 = v15;
      sub_21C571BF0((uint64_t)&v41);
      sub_21C571BF0((uint64_t)&v42);
      sub_21C569DF8((uint64_t)&v43);
      if ((v11 & 1) == 0)
      {
        BOOL v17 = v14 == v8 && v16 == v9;
        if (v17 && v14 == v16)
        {
          swift_bridgeObjectRetain();
          uint64_t v19 = sub_21C589C58();
          swift_bridgeObjectRelease();
          if (v8 >= v19)
          {
LABEL_24:
            uint64_t v16 = v8;
            uint64_t v14 = v8;
          }
          else
          {
            long long v37 = *((_OWORD *)v13 + 1);
            uint64_t v38 = *((void *)v13 + 4);
            long long v44 = *(_OWORD *)v13;
            long long v45 = v37;
            uint64_t v46 = v38;
            sub_21C571BC4((uint64_t)&v44);
            sub_21C571BC4((uint64_t)&v45);
            sub_21C569DCC((uint64_t)&v46);
            uint64_t v20 = sub_21C5696A4(v8);
            sub_21C571BF0((uint64_t)&v44);
            sub_21C571BF0((uint64_t)&v45);
            sub_21C569DF8((uint64_t)&v46);
            swift_bridgeObjectRetain();
            uint64_t v21 = sub_21C589C58();
            uint64_t result = swift_bridgeObjectRelease();
            if (v21 < v20)
            {
              __break(1u);
              return result;
            }
            while (1)
            {
              uint64_t v36 = *((void *)v13 + 4);
              long long v35 = *((_OWORD *)v13 + 1);
              long long v47 = *(_OWORD *)v13;
              long long v48 = v35;
              uint64_t v49 = v36;
              sub_21C571BC4((uint64_t)&v47);
              sub_21C571BC4((uint64_t)&v48);
              sub_21C569DCC((uint64_t)&v49);
              uint64_t v16 = sub_21C569330(v20);
              sub_21C571BF0((uint64_t)&v47);
              sub_21C571BF0((uint64_t)&v48);
              sub_21C569DF8((uint64_t)&v49);
              if (v8 < v16) {
                break;
              }
              if (v21 == v20) {
                goto LABEL_24;
              }
              if (__OFADD__(v20++, 1))
              {
                __break(1u);
                goto LABEL_24;
              }
            }
            uint64_t v14 = v16;
          }
        }
      }
      sub_21C573B5C(0, 0, 1, 0, 0xE000000000000000, v14, v16, 0);
      long long v33 = *((_OWORD *)v13 + 1);
      uint64_t v34 = *((void *)v13 + 4);
      long long v50 = *(_OWORD *)v13;
      long long v51 = v33;
      v52[0] = v34;
      sub_21C571BC4((uint64_t)&v50);
      sub_21C571BC4((uint64_t)&v51);
      sub_21C569DCC((uint64_t)v52);
      uint64_t v23 = sub_21C56927C(v14, v16);
      uint64_t v25 = v24;
      sub_21C571BF0((uint64_t)&v50);
      sub_21C571BF0((uint64_t)&v51);
      sub_21C569DF8((uint64_t)v52);
      uint64_t v26 = OBJC_IVAR___BRLTBrailleModelInternal_braille;
      uint64_t v27 = *(void **)((char *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
      uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, void))((*MEMORY[0x263F8EED0] & *v27) + 0xB8);
      uint64_t v29 = v27;
      uint64_t v30 = v28(v23, v25, 0);

      char v31 = *(void **)((char *)v4 + v26);
      *(void *)((char *)v4 + v26) = v30;

      if (v23 == v25)
      {
        uint64_t v32 = (char *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
        *(void *)uint64_t v32 = v23;
        *((void *)v32 + 1) = v23;
        v32[16] = 0;
      }
      *((unsigned char *)v4 + OBJC_IVAR___BRLTBrailleModelInternal_brailleSelectionDirty) = 0;
      return sub_21C5740A4();
    }
  }
  return result;
}

void sub_21C5706BC()
{
  uint64_t v1 = *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille)
     + OBJC_IVAR___BRLTEditStringInternal_selection;
  if ((*(unsigned char *)(v1 + 16) & 1) == 0)
  {
    uint64_t v2 = (void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange);
    if ((*((unsigned char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange + 16) & 1) == 0)
    {
      uint64_t v3 = (void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange);
      if ((*((unsigned char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange + 16) & 1) == 0)
      {
        uint64_t v5 = *(void *)v1;
        uint64_t v4 = *(void *)(v1 + 8);
        uint64_t v6 = *v2;
        uint64_t v7 = v2[1];
        uint64_t v8 = *v3;
        uint64_t v9 = v3[1];
        sub_21C570B50((uint64_t)&v13);
        if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))())
        {
          uint64_t v10 = sub_21C570844(v5, v6, v7, (uint64_t)v0, v8, v9);
          uint64_t v11 = sub_21C570844(v4, v6, v7, (uint64_t)v0, v8, v9);
          if (v11 < v10)
          {
            __break(1u);
            return;
          }
          uint64_t v12 = v11;
        }
        else
        {
          uint64_t v12 = 0;
          uint64_t v10 = 0;
        }
        sub_21C573B5C(v8, v9, 0, v14, v15, v10, v12, 0);
        long long v18 = v13;
        sub_21C571BF0((uint64_t)&v18);
        swift_bridgeObjectRelease();
        uint64_t v17 = v16;
        sub_21C569DF8((uint64_t)&v17);
        sub_21C570F48();
      }
    }
  }
}

uint64_t sub_21C570844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = a1;
  if (a1 < a2)
  {
    long long v15 = *(_OWORD *)(a4 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
    uint64_t v17 = *(void *)(a4 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
    long long v19 = *(_OWORD *)(a4 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
    long long v20 = v15;
    uint64_t v21 = v17;
    sub_21C571BC4((uint64_t)&v19);
    sub_21C571BC4((uint64_t)&v20);
    sub_21C569DCC((uint64_t)&v21);
    uint64_t v7 = sub_21C569330(v7);
    sub_21C571BF0((uint64_t)&v19);
    sub_21C571BF0((uint64_t)&v20);
    sub_21C569DF8((uint64_t)&v21);
    return v7;
  }
  if (a3 < a1)
  {
    uint64_t result = sub_21C589C58();
    uint64_t v11 = a6 - a5;
    if (__OFSUB__(a6, a5))
    {
      __break(1u);
    }
    else
    {
      a5 = result - v11;
      if (!__OFSUB__(result, v11))
      {
        uint64_t v12 = sub_21C56FAD0(v7);
        long long v16 = *(_OWORD *)(a4 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
        uint64_t v18 = *(void *)(a4 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
        long long v19 = *(_OWORD *)(a4 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
        long long v20 = v16;
        uint64_t v21 = v18;
        sub_21C571BC4((uint64_t)&v19);
        sub_21C571BC4((uint64_t)&v20);
        sub_21C569DCC((uint64_t)&v21);
        uint64_t v13 = sub_21C569330(v12);
        sub_21C571BF0((uint64_t)&v19);
        sub_21C571BF0((uint64_t)&v20);
        sub_21C569DF8((uint64_t)&v21);
        BOOL v14 = __OFADD__(v13, a5);
        uint64_t v7 = v13 + a5;
        if (!v14) {
          return v7;
        }
        __break(1u);
        goto LABEL_9;
      }
    }
    __break(1u);
    goto LABEL_14;
  }
LABEL_9:
  uint64_t result = v7 - a2;
  if (__OFSUB__(v7, a2))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t result = sub_21C5696A4(result);
  uint64_t v7 = a5 + result;
  if (!__OFADD__(a5, result)) {
    return v7;
  }
LABEL_15:
  __break(1u);
  return result;
}

void sub_21C5709B8()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange);
  if ((*(unsigned char *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) == 0)
  {
    uint64_t v2 = v0;
    uint64_t v3 = *(void **)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_inputTranslator);
    if (v3)
    {
      uint64_t v4 = *v1;
      uint64_t v5 = v1[1];
      uint64_t v6 = *(void *)(v2 + OBJC_IVAR___BRLTBrailleModelInternal_script) + OBJC_IVAR___BRLTEditStringInternal_selection;
      if (*(unsigned char *)(v6 + 16)) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = *(void *)(v6 + 8);
      }
      if ((*(unsigned char *)(v6 + 16) & 1) != 0 || *(void *)v6 == *(void *)(v6 + 8))
      {
        uint64_t v8 = *(void **)(v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
        uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v8) + 0xD8);
        id v10 = v3;
        uint64_t v11 = v8;
        uint64_t v12 = v9(v4, v5);
        uint64_t v14 = v13;

        sub_21C568B54(v12, v14, &v18);
        swift_bridgeObjectRelease();
        uint64_t v15 = v19;
        uint64_t v16 = v20;
        long long v23 = v18;
        sub_21C571BF0((uint64_t)&v23);
        uint64_t v22 = v21;
        sub_21C569DF8((uint64_t)&v22);
        uint64_t v17 = sub_21C589C58();
        if (__OFADD__(v7, v17))
        {
          __break(1u);
        }
        else
        {
          sub_21C573B5C(v7, v7, 0, v15, v16, v7 + v17, v7 + v17, 0);
          swift_bridgeObjectRelease();
          sub_21C570F48();
        }
      }
    }
  }
}

void sub_21C570B50(uint64_t a1@<X8>)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange);
  if ((*(unsigned char *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange + 16) & 1) != 0
    || (uint64_t v4 = v1, (v5 = *(void **)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator)) == 0)
    || (uint64_t v6 = *(void **)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_inputTranslator)) == 0)
  {
    sub_21C568B44(0, 0xE000000000000000, 0, 0xE000000000000000, MEMORY[0x263F8EE78], &v54);
    goto LABEL_12;
  }
  uint64_t v7 = *v3;
  uint64_t v8 = v3[1];
  uint64_t v9 = (uint64_t *)(v4 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange);
  if ((*(unsigned char *)(v4 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) != 0
    || (v11 = *v9, uint64_t v10 = v9[1], *v9 == v10))
  {
    uint64_t v34 = *(void **)(v4 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    long long v35 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v34) + 0xD8);
    id v36 = v5;
    id v37 = v6;
    uint64_t v38 = v34;
    uint64_t v39 = v35(v7, v8);
    uint64_t v41 = v40;

    sub_21C568B54(v39, v41, &v54);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  BOOL v12 = v11 < v7 || v8 < v10;
  uint64_t v45 = v8;
  if (!v12)
  {
    uint64_t v42 = OBJC_IVAR___BRLTBrailleModelInternal_braille;
    uint64_t v13 = *(void **)(v4 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v13) + 0xD8);
    id v44 = v5;
    id v43 = v6;
    uint64_t v15 = v13;
    uint64_t v16 = v14(v7, v11);
    uint64_t v18 = v17;

    sub_21C568B54(v16, v18, v46);
    swift_bridgeObjectRelease();
    uint64_t v19 = *(void **)(v4 + v42);
    uint64_t v20 = (void *)MEMORY[0x263F8EED0];
    uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v19) + 0xD8);
    uint64_t v22 = v19;
    uint64_t v23 = v21(v11, v10);
    uint64_t v25 = v24;

    sub_21C568B54(v23, v25, v48);
    swift_bridgeObjectRelease();
    uint64_t v26 = *(void **)(v4 + v42);
    uint64_t v27 = *(uint64_t (**)(uint64_t, uint64_t))((*v20 & *v26) + 0xD8);
    uint64_t v28 = v26;
    uint64_t v29 = v27(v10, v45);
    uint64_t v31 = v30;

    sub_21C568B54(v29, v31, v50);
    swift_bridgeObjectRelease();
    sub_21C5697CC((uint64_t)v48, (char **)v52);
    long long v68 = v46[0];
    sub_21C571BF0((uint64_t)&v68);
    long long v67 = v46[1];
    sub_21C571BF0((uint64_t)&v67);
    uint64_t v66 = v47;
    sub_21C569DF8((uint64_t)&v66);
    long long v65 = v48[0];
    sub_21C571BF0((uint64_t)&v65);
    long long v64 = v48[1];
    sub_21C571BF0((uint64_t)&v64);
    uint64_t v63 = v49;
    sub_21C569DF8((uint64_t)&v63);
    sub_21C5697CC((uint64_t)v50, (char **)&v54);
    long long v62 = v52[0];
    sub_21C571BF0((uint64_t)&v62);
    long long v61 = v52[1];
    sub_21C571BF0((uint64_t)&v61);
    uint64_t v60 = v53;
    sub_21C569DF8((uint64_t)&v60);
    long long v59 = v50[0];
    sub_21C571BF0((uint64_t)&v59);
    long long v58 = v50[1];
    sub_21C571BF0((uint64_t)&v58);
    uint64_t v57 = v51;
    sub_21C569DF8((uint64_t)&v57);

LABEL_12:
    uint64_t v32 = v55;
    long long v33 = v56;
    *(_OWORD *)a1 = v54;
    *(void *)(a1 + 16) = v32;
    *(_OWORD *)(a1 + 24) = v33;
    return;
  }
  __break(1u);
}

void sub_21C570F48()
{
  uint64_t v1 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator);
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_script);
    uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x1D8);
    id v5 = v1;
    id v6 = v3;
    char v7 = v4();
    sub_21C568D98((uint64_t)v6, v7 & 1, (uint64_t)v19);
    uint64_t v8 = v19[0];
    uint64_t v9 = v19[1];
    uint64_t v10 = v19[2];
    uint64_t v11 = v19[3];
    long long v18 = v20;

    BOOL v12 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    *(void *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v8;

    uint64_t v13 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult;
    *(void *)uint64_t v13 = v9;
    *((void *)v13 + 1) = v10;
    *((void *)v13 + 2) = v11;
    *(_OWORD *)(v13 + 24) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v14 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty;
    swift_beginAccess();
    unsigned char *v14 = 0;
    *((unsigned char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleSelectionDirty) = 0;
    uint64_t v15 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange;
    *(void *)uint64_t v15 = 0;
    *((void *)v15 + 1) = 0;
    v15[16] = 1;
    uint64_t v16 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange;
    *(void *)uint64_t v16 = 0;
    *((void *)v16 + 1) = 0;
    v16[16] = 1;
    uint64_t v17 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
    *(void *)uint64_t v17 = 0;
    *((void *)v17 + 1) = 0;
    v17[16] = 1;
    sub_21C571108();
  }
}

void sub_21C571108()
{
  uint64_t v1 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
  if ((*((unsigned char *)v1 + OBJC_IVAR___BRLTEditStringInternal_selection + 16) & 1) == 0)
  {
    uint64_t v2 = v0;
    long long v18 = *(_OWORD *)((char *)v1 + OBJC_IVAR___BRLTEditStringInternal_selection);
    uint64_t v3 = (void *)MEMORY[0x263F8EED0];
    uint64_t v4 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x88);
    id v5 = v1;
    uint64_t v6 = v4();
    uint64_t v8 = v7;
    char v10 = v9;

    uint64_t v11 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_editingBrailleRange;
    *(void *)uint64_t v11 = v6;
    *((void *)v11 + 1) = v8;
    v11[16] = v10 & 1;
    long long v19 = *(_OWORD *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
    uint64_t v20 = *(void *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
    if (v10)
    {
      __break(1u);
    }
    else
    {
      long long v21 = *(_OWORD *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
      long long v22 = v19;
      uint64_t v23 = v20;
      sub_21C571BC4((uint64_t)&v21);
      sub_21C571BC4((uint64_t)&v22);
      sub_21C569DCC((uint64_t)&v23);
      uint64_t v12 = sub_21C5693E8(v6, v8);
      uint64_t v14 = v13;
      sub_21C571BF0((uint64_t)&v21);
      sub_21C571BF0((uint64_t)&v22);
      uint64_t v15 = sub_21C569DF8((uint64_t)&v23);
      uint64_t v16 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_editingScriptRange;
      *(void *)uint64_t v16 = v12;
      *((void *)v16 + 1) = v14;
      v16[16] = 0;
      if ((*(uint64_t (**)(uint64_t))((*v3 & *v2) + 0x378))(v15))
      {
        uint64_t v17 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
        *(_OWORD *)uint64_t v17 = v18;
        v17[16] = 0;
      }
    }
  }
}

uint64_t sub_21C5712C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x380);
  if (v3())
  {
    uint64_t v4 = *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
    if (v4)
    {
      uint64_t v5 = swift_retain();
      if (((uint64_t (*)(uint64_t))v3)(v5))
      {
        (*(void (**)(void))(*(void *)v4 + 320))();
        uint64_t v6 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
        if (v6)
        {
          uint64_t v7 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
          *(void *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v6;
          id v8 = v6;
        }
        else
        {
          sub_21C570F48();
        }
        sub_21C5740A4();
      }
      swift_release();
    }
  }
  else
  {
    char v9 = *(uint64_t (**)(void))((*v2 & *v0) + 0x548);
    if ((v9() & 1) == 0)
    {
      (*(void (**)(void))((*v2 & *v0) + 0x3C0))();
      return 0;
    }
    if (v9())
    {
      (*(void (**)(void))((*v2 & *v0) + 0x550))(0);
      char v10 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
      if (v10)
      {
        uint64_t v11 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
        *(void *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v10;
        id v12 = v10;

        sub_21C5740A4();
      }
      else
      {
        sub_21C570F48();
        sub_21C5740A4();
      }
    }
  }
  return 1;
}

uint64_t sub_21C571528()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x380))())
  {
    (*(void (**)(void))((*v1 & *v0) + 0x528))();
    return 1;
  }
  if (((*(uint64_t (**)(void))((*v1 & *v0) + 0x370))() & 1) != 0
    && (*((unsigned char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) == 0
    && *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange) != *(void *)((char *)v0
                                                                                              + OBJC_IVAR___BRLTBrailleModelInternal_stageRange
                                                                                              + 8))
  {
    uint64_t v7 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_contentLock);
    objc_msgSend(v7, sel_lock);
    if (*((unsigned char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_editScript) == 1) {
      sub_21C5709B8();
    }
    else {
      sub_21C5706BC();
    }
    objc_msgSend(v7, sel_unlock);
    goto LABEL_17;
  }
  uint64_t v3 = *(uint64_t (**)(void))((*v1 & *v0) + 0x548);
  if (v3())
  {
    if ((v3() & 1) == 0) {
      return 1;
    }
    (*(void (**)(void))((*v1 & *v0) + 0x550))(0);
    uint64_t v4 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
    if (v4)
    {
      uint64_t v5 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
      *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v4;
      id v6 = v4;

      sub_21C5740A4();
      return 1;
    }
    sub_21C570F48();
LABEL_17:
    sub_21C5740A4();
    return 1;
  }
  (*(void (**)(void))((*v1 & *v0) + 0x3C0))();
  return 0;
}

void sub_21C571790()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x370))())
  {
    uint64_t v2 = *(uint64_t (**)(void))((*v1 & *v0) + 0x548);
    if (v2())
    {
      if (v2())
      {
        (*(void (**)(void))((*v1 & *v0) + 0x550))(0);
        uint64_t v3 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
        if (v3)
        {
          uint64_t v4 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
          *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v3;
          id v5 = v3;

          sub_21C5740A4();
        }
        else
        {
          sub_21C570F48();
          sub_21C5740A4();
        }
      }
    }
    else
    {
      sub_21C5733E4();
    }
  }
}

uint64_t sub_21C57196C(uint64_t a1)
{
  uint64_t v3 = (long long *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
  long long v11 = *(_OWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
  uint64_t v12 = *(void *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
  long long v13 = *(_OWORD *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
  long long v14 = v11;
  uint64_t v15 = v12;
  sub_21C571BC4((uint64_t)&v13);
  sub_21C571BC4((uint64_t)&v14);
  sub_21C569DCC((uint64_t)&v15);
  uint64_t v4 = sub_21C5696A4(a1);
  sub_21C571BF0((uint64_t)&v13);
  sub_21C571BF0((uint64_t)&v14);
  uint64_t result = sub_21C569DF8((uint64_t)&v15);
  long long v9 = v3[1];
  uint64_t v10 = *((void *)v3 + 4);
  long long v16 = *v3;
  long long v17 = v9;
  uint64_t v18 = v10;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
  }
  else if (v4 + 1 >= v4)
  {
    sub_21C571BC4((uint64_t)&v16);
    sub_21C571BC4((uint64_t)&v17);
    sub_21C569DCC((uint64_t)&v18);
    uint64_t v6 = sub_21C5693E8(v4, v4 + 1);
    uint64_t v8 = v7;
    sub_21C571BF0((uint64_t)&v16);
    sub_21C571BF0((uint64_t)&v17);
    sub_21C569DF8((uint64_t)&v18);
    return sub_21C57BDA4(v6, v8, 0);
  }
  __break(1u);
  return result;
}

uint64_t sub_21C571AD4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = (void *)(v4 + OBJC_IVAR___BRLTBrailleModelInternal_candidateSelectionLanguage);
  *uint64_t v8 = a1;
  v8[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a2 && (a1 == 7237738 && a2 == 0xE300000000000000 || (sub_21C589EC8() & 1) != 0))
  {
    type metadata accessor for BRLTCandidateManager();
    *(void *)(v4 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager) = sub_21C57C434(a3 & 1);
  }
  else
  {
    *(void *)(v4 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager) = 0;
  }
  return swift_release();
}

uint64_t sub_21C571BC4(uint64_t a1)
{
  return a1;
}

uint64_t sub_21C571BF0(uint64_t a1)
{
  return a1;
}

void sub_21C571C1C()
{
  uint64_t v1 = *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = (void *)MEMORY[0x263F8EED0];
    uint64_t v4 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0x380);
    uint64_t v5 = swift_retain();
    if ((v4(v5) & 1) != 0
      || (uint64_t v6 = (void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange),
          *((unsigned char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) == 1)
      || (uint64_t v7 = *v6, v8 = v6[1], *v6 == v8)
      || (long long v9 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_inputTranslator)) == 0)
    {
      swift_release();
    }
    else
    {
      uint64_t v10 = OBJC_IVAR___BRLTBrailleModelInternal_braille;
      long long v11 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
      uint64_t v12 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
      *(void *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache) = v11;
      id v13 = v9;
      id v14 = v11;

      uint64_t v15 = *(void **)((char *)v2 + v10);
      long long v16 = *(uint64_t (**)(uint64_t, uint64_t))((*v3 & *v15) + 0xD8);
      long long v17 = v15;
      uint64_t v18 = v16(v7, v8);
      uint64_t v20 = v19;

      sub_21C568B54(v18, v20, &v42);
      swift_bridgeObjectRelease();
      uint64_t v22 = v43;
      unint64_t v21 = v44;
      long long v47 = v42;
      sub_21C571BF0((uint64_t)&v47);
      uint64_t v46 = v45;
      sub_21C569DF8((uint64_t)&v46);
      (*(void (**)(uint64_t, unint64_t))(*(void *)v1 + 312))(v22, v21);
      sub_21C572968();
      uint64_t v23 = sub_21C57661C();
      swift_beginAccess();
      uint64_t v24 = sub_21C589BD8();
      uint64_t v25 = *(void *)(v24 - 8);
      MEMORY[0x270FA5388](v24, v26, v27);
      uint64_t v29 = (char *)v36 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v29, v23, v24);
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_21C589BB8();
      os_log_type_t v31 = sub_21C589D58();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v39 = v24;
        uint64_t v32 = swift_slowAlloc();
        uint64_t v38 = v36;
        long long v33 = (uint8_t *)v32;
        uint64_t v34 = swift_slowAlloc();
        id v37 = v13;
        uint64_t v35 = v34;
        uint64_t v41 = v34;
        *(_DWORD *)long long v33 = 136315138;
        v36[1] = v33 + 4;
        swift_bridgeObjectRetain();
        uint64_t v40 = sub_21C574638(v22, v21, &v41);
        sub_21C589DA8();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_21C554000, v30, v31, "Start candidate selection with stageScript = %s", v33, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x21D4AA0F0](v35, -1, -1);
        MEMORY[0x21D4AA0F0](v33, -1, -1);

        swift_release();
        (*(void (**)(char *, uint64_t))(v25 + 8))(v29, v39);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_release();
        (*(void (**)(char *, uint64_t))(v25 + 8))(v29, v24);
      }
    }
  }
}

void sub_21C572064()
{
  uint64_t v1 = *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
  if (v1)
  {
    uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0x380);
    uint64_t v3 = swift_retain();
    if (v2(v3) & 1) != 0 && ((*(uint64_t (**)(void))(*(void *)v1 + 328))())
    {
      (*(void (**)(void))(*(void *)v1 + 336))();
      sub_21C572968();
    }
    swift_release();
  }
}

void sub_21C5721C8()
{
  uint64_t v1 = *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
  if (v1)
  {
    uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0x380);
    uint64_t v3 = swift_retain();
    if (v2(v3) & 1) != 0 && ((*(uint64_t (**)(void))(*(void *)v1 + 344))())
    {
      (*(void (**)(void))(*(void *)v1 + 352))();
      sub_21C572968();
    }
    swift_release();
  }
}

void sub_21C57232C()
{
  uint64_t v1 = *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
  if (!v1) {
    return;
  }
  uint64_t v2 = v0;
  uint64_t v3 = (void *)MEMORY[0x263F8EED0];
  uint64_t v4 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0x380);
  uint64_t v5 = swift_retain();
  if (v4(v5))
  {
    uint64_t v6 = OBJC_IVAR___BRLTBrailleModelInternal_script;
    uint64_t v7 = *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_script)
       + OBJC_IVAR___BRLTEditStringInternal_selection;
    if ((*(unsigned char *)(v7 + 16) & 1) == 0)
    {
      uint64_t v8 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator);
      if (v8)
      {
        uint64_t v9 = *(void *)v7;
        uint64_t v10 = *(void *)(v7 + 8);
        long long v11 = *(uint64_t (**)(void))(*(void *)v1 + 376);
        id v41 = v8;
        uint64_t v12 = v11();
        uint64_t v14 = v13;
        uint64_t v15 = sub_21C589C58();
        if (__OFADD__(v9, v15))
        {
          __break(1u);
        }
        else
        {
          sub_21C573B5C(v9, v10, 0, v12, v14, v9 + v15, v9 + v15, 0);
          uint64_t v16 = swift_bridgeObjectRelease();
          uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 384))(v16);
          uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 400))(v17);
          if (v18) {
            BOOL v20 = 0;
          }
          else {
            BOOL v20 = v19 == 0xE000000000000000;
          }
          if (v20 || (uint64_t v21 = v18, v22 = v19, (sub_21C589EC8() & 1) != 0))
          {
            swift_bridgeObjectRelease();
            uint64_t v23 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
            *(void *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache) = 0;

            (*(void (**)(void))(*(void *)v1 + 320))();
            sub_21C570F48();
            sub_21C5740A4();
            swift_release();

            return;
          }
          char v24 = sub_21C568900();
          sub_21C568908(v21, v22, v24 & 1, 0, &v43);
          uint64_t v37 = v44;
          uint64_t v40 = v45;
          long long v48 = v43;
          sub_21C571BF0((uint64_t)&v48);
          uint64_t v47 = v46;
          sub_21C569DF8((uint64_t)&v47);
          id v25 = *(id *)((char *)v2 + v6);
          char v26 = sub_21C568900();
          sub_21C568D98((uint64_t)v25, v26 & 1, (uint64_t)&v42);
          uint64_t v38 = v42;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          uint64_t v27 = OBJC_IVAR___BRLTBrailleModelInternal_brailleCache;
          uint64_t v28 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
          *(void *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache) = v38;

          uint64_t v29 = *(unsigned char **)((char *)v2 + v27);
          if (!v29 || (v29[OBJC_IVAR___BRLTEditStringInternal_selection + 16] & 1) != 0)
          {
            swift_bridgeObjectRelease();
LABEL_26:
            (*(void (**)(uint64_t, uint64_t))(*(void *)v1 + 312))(v21, v22);
            swift_bridgeObjectRelease();
            sub_21C572968();
            swift_release();

            return;
          }
          uint64_t v30 = *(void *)&v29[OBJC_IVAR___BRLTEditStringInternal_selection];
          uint64_t v39 = v29;
          uint64_t v31 = sub_21C589C58();
          if (!__OFADD__(v30, v31))
          {
            uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t))((*v3 & *v39) + 0xB0))(v30, v30, 0, v37, v40, v30 + v31);

            long long v33 = *(void **)((char *)v2 + v27);
            *(void *)((char *)v2 + v27) = v32;

            uint64_t v34 = sub_21C589C58();
            swift_bridgeObjectRelease();
            uint64_t v35 = v30 + v34;
            if (!__OFADD__(v30, v34))
            {
              if (v35 >= v30)
              {
                id v36 = (char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange;
                *(void *)id v36 = v30;
                *((void *)v36 + 1) = v35;
                v36[16] = 0;
                goto LABEL_26;
              }
LABEL_31:
              __break(1u);
              return;
            }
LABEL_30:
            __break(1u);
            goto LABEL_31;
          }
        }
        __break(1u);
        goto LABEL_30;
      }
    }
  }
  swift_release();
}

void sub_21C57284C()
{
  uint64_t v1 = *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0x380);
    uint64_t v4 = swift_retain();
    if (v3(v4))
    {
      (*(void (**)(void))(*(void *)v1 + 320))();
      uint64_t v5 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
      if (v5)
      {
        uint64_t v6 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
        *(void *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v5;
        id v7 = v5;
      }
      else
      {
        sub_21C570F48();
      }
      sub_21C5740A4();
    }
    swift_release();
  }
}

void sub_21C572968()
{
  uint64_t v1 = *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateManager);
  if (v1)
  {
    uint64_t v2 = v0;
    if (*(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateSelectionLanguage + 8))
    {
      uint64_t v3 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator);
      if (v3)
      {
        uint64_t v4 = *(uint64_t (**)(void))(*(void *)v1 + 184);
        swift_retain();
        swift_bridgeObjectRetain();
        id v5 = v3;
        uint64_t v6 = v4();
        if (__OFADD__(v6, 1))
        {
          __break(1u);
        }
        else
        {
          *(void *)&long long v46 = v6 + 1;
          uint64_t v7 = sub_21C589EA8();
          uint64_t v9 = v8;
          char v10 = sub_21C568900();
          sub_21C568908(v7, v9, v10 & 1, 0, v44);
          swift_bridgeObjectRelease();
          long long v51 = v44[0];
          long long v52 = v44[1];
          sub_21C571BF0((uint64_t)&v51);
          uint64_t v50 = v45;
          uint64_t v11 = sub_21C569DF8((uint64_t)&v50);
          uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 368))(v11);
          uint64_t v14 = v13;
          char v15 = sub_21C568900();
          sub_21C568908(v12, v14, v15 & 1, 0, &v46);
          swift_bridgeObjectRelease();
          long long v49 = v46;
          sub_21C571BF0((uint64_t)&v49);
          uint64_t v48 = v47;
          sub_21C569DF8((uint64_t)&v48);
          long long v43 = v52;
          swift_bridgeObjectRetain();
          sub_21C589CA8();
          sub_21C571BF0((uint64_t)&v52);
          swift_bridgeObjectRetain();
          sub_21C589CA8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_21C589CA8();
          swift_bridgeObjectRelease();
          long long v16 = v43;
          type metadata accessor for BRLTEditString();
          swift_bridgeObjectRetain();
          uint64_t v17 = sub_21C56A3FC(v43, *((uint64_t *)&v43 + 1), 0, 0, 1, 0, 0, 0, MEMORY[0x263F8EE78]);
          uint64_t v18 = *(void **)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
          *(void *)((char *)v2 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v17;

          uint64_t v19 = sub_21C5740A4();
          uint64_t v20 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v2) + 0x160))(v19);
          if (v20)
          {
            uint64_t v21 = (void *)v20;
            (*(void (**)(void))(*(void *)v1 + 360))();
            uint64_t v22 = (void *)sub_21C589BF8();
            swift_bridgeObjectRelease();
            uint64_t v23 = (void *)sub_21C589BF8();
            swift_bridgeObjectRelease();
            objc_msgSend(v21, sel_requestSpeech_language_, v22, v23);

            swift_unknownObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          uint64_t v24 = sub_21C57661C();
          swift_beginAccess();
          uint64_t v25 = sub_21C589BD8();
          uint64_t v26 = *(void *)(v25 - 8);
          MEMORY[0x270FA5388](v25, v27, v28);
          uint64_t v30 = (char *)&v37 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
          (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v30, v24, v25);
          swift_bridgeObjectRetain();
          uint64_t v31 = sub_21C589BB8();
          os_log_type_t v32 = sub_21C589D58();
          if (os_log_type_enabled(v31, v32))
          {
            uint64_t v40 = v25;
            uint64_t v33 = swift_slowAlloc();
            uint64_t v37 = v16;
            uint64_t v34 = (uint8_t *)v33;
            uint64_t v35 = swift_slowAlloc();
            id v38 = v5;
            uint64_t v36 = v35;
            uint64_t v42 = v35;
            uint64_t v39 = &v37;
            *(_DWORD *)uint64_t v34 = 136315138;
            swift_bridgeObjectRetain();
            uint64_t v41 = sub_21C574638(v37, *((unint64_t *)&v16 + 1), &v42);
            sub_21C589DA8();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_21C554000, v31, v32, "Show current candidate description: %s", v34, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x21D4AA0F0](v36, -1, -1);
            MEMORY[0x21D4AA0F0](v34, -1, -1);

            swift_release();
            (*(void (**)(char *, uint64_t))(v26 + 8))(v30, v40);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_release();
            (*(void (**)(char *, uint64_t))(v26 + 8))(v30, v25);
          }
        }
      }
    }
  }
}

uint64_t sub_21C572FA0()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateSelectionLanguage + 8);
  if (v1)
  {
    BOOL v2 = *(void *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_candidateSelectionLanguage) == 7237738
      && v1 == 0xE300000000000000;
    if (v2 || (char v3 = 0, (sub_21C589EC8() & 1) != 0))
    {
      char v3 = 0;
      uint64_t v4 = (uint64_t *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange);
      if ((*(unsigned char *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) == 0)
      {
        uint64_t v5 = *v4;
        uint64_t v6 = v4[1];
        if (*v4 != v6)
        {
          uint64_t v7 = *(void **)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
          uint64_t v8 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v7) + 0xD8);
          uint64_t v9 = v7;
          v8(v5, v6);

          uint64_t v10 = sub_21C589CB8();
          if (v11)
          {
            uint64_t v12 = v10;
            uint64_t v13 = v11;
            char v3 = 0;
            do
            {
              if (v12 == 10920162 && v13 == 0xA300000000000000 || (sub_21C589EC8() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                char v3 = 1;
              }
              else if (v12 == 11837666 && v13 == 0xA300000000000000)
              {
                swift_bridgeObjectRelease();
                char v3 = 0;
              }
              else
              {
                char v15 = sub_21C589EC8();
                swift_bridgeObjectRelease();
                v3 &= v15 ^ 1;
              }
              uint64_t v12 = sub_21C589CB8();
              uint64_t v13 = v14;
            }
            while (v14);
          }
          else
          {
            char v3 = 0;
          }
          swift_bridgeObjectRelease();
        }
      }
    }
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

uint64_t sub_21C5731E0()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_isWordDescriptionActive);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21C573274(char a1)
{
  char v3 = (unsigned char *)(v1 + OBJC_IVAR___BRLTBrailleModelInternal_isWordDescriptionActive);
  uint64_t result = swift_beginAccess();
  *char v3 = a1;
  return result;
}

uint64_t sub_21C5732C0@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x548))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21C573328(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a2) + 0x550))(*a1);
}

uint64_t (*sub_21C573388())()
{
  return j_j__swift_endAccess;
}

void sub_21C5733E4()
{
  uint64_t v1 = v0;
  BOOL v2 = (void *)MEMORY[0x263F8EED0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x370))() & 1) != 0
    && ((*(uint64_t (**)(void))((*v2 & *v0) + 0x380))() & 1) == 0
    && ((*((unsigned char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange + 16) & 1) != 0
     || *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_stageRange) == *(void *)((char *)v0
                                                                                               + OBJC_IVAR___BRLTBrailleModelInternal_stageRange
                                                                                               + 8))
    && ((*(uint64_t (**)(void))((*v2 & *v0) + 0x548))() & 1) == 0)
  {
    (*(void (**)(uint64_t))((*v2 & *v0) + 0x550))(1);
    uint64_t v3 = OBJC_IVAR___BRLTBrailleModelInternal_braille;
    uint64_t v4 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    uint64_t v5 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache);
    *(void *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_brailleCache) = v4;
    id v6 = v4;

    uint64_t v7 = *(void *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_wordDescriptionManager);
    uint64_t v16 = *(void *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 32);
    long long v8 = *(_OWORD *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult + 16);
    v15[0] = *(_OWORD *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult);
    v15[1] = v8;
    long long v17 = v15[0];
    long long v18 = v8;
    uint64_t v9 = *(void *)((char *)v1 + v3);
    uint64_t v19 = v16;
    uint64_t v10 = (uint64_t *)(v9 + OBJC_IVAR___BRLTEditStringInternal_selection);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    uint64_t v13 = *((unsigned __int8 *)v10 + 16);
    uint64_t v14 = *(void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))(*(void *)v7 + 216);
    swift_retain();
    sub_21C571BC4((uint64_t)&v17);
    sub_21C571BC4((uint64_t)&v18);
    sub_21C569DCC((uint64_t)&v19);
    v14(v15, v11, v12, v13);
    sub_21C571BF0((uint64_t)&v17);
    sub_21C571BF0((uint64_t)&v18);
    sub_21C569DF8((uint64_t)&v19);
    swift_release();
    sub_21C5738DC();
  }
}

void sub_21C573624()
{
  if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x548))())
  {
    uint64_t v1 = OBJC_IVAR___BRLTBrailleModelInternal_wordDescriptionManager;
    BOOL v2 = *(uint64_t (**)(uint64_t))(**(void **)((char *)v0
                                                         + OBJC_IVAR___BRLTBrailleModelInternal_wordDescriptionManager)
                                           + 224);
    uint64_t v3 = swift_retain();
    LOBYTE(v2) = v2(v3);
    swift_release();
    if (v2)
    {
      uint64_t v4 = *(void (**)(uint64_t))(**(void **)((char *)v0 + v1) + 240);
      uint64_t v5 = swift_retain();
      v4(v5);
      swift_release();
      sub_21C5738DC();
    }
  }
}

void sub_21C573780()
{
  if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x548))())
  {
    uint64_t v1 = OBJC_IVAR___BRLTBrailleModelInternal_wordDescriptionManager;
    BOOL v2 = *(uint64_t (**)(uint64_t))(**(void **)((char *)v0
                                                         + OBJC_IVAR___BRLTBrailleModelInternal_wordDescriptionManager)
                                           + 232);
    uint64_t v3 = swift_retain();
    LOBYTE(v2) = v2(v3);
    swift_release();
    if (v2)
    {
      uint64_t v4 = *(void (**)(uint64_t))(**(void **)((char *)v0 + v1) + 248);
      uint64_t v5 = swift_retain();
      v4(v5);
      swift_release();
      sub_21C5738DC();
    }
  }
}

void sub_21C5738DC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_outputTranslator);
  if (v1)
  {
    type metadata accessor for BRLTEditString();
    uint64_t v2 = OBJC_IVAR___BRLTBrailleModelInternal_wordDescriptionManager;
    uint64_t v3 = *(uint64_t (**)(uint64_t))(**(void **)(v0
                                                         + OBJC_IVAR___BRLTBrailleModelInternal_wordDescriptionManager)
                                           + 256);
    id v4 = v1;
    uint64_t v5 = swift_retain();
    uint64_t v6 = v3(v5);
    uint64_t v8 = v7;
    swift_release();
    uint64_t v9 = (void *)sub_21C56A44C(v6, v8, 0, 0, 1);
    char v10 = sub_21C568900();
    sub_21C568D98((uint64_t)v9, v10 & 1, (uint64_t)&v19);
    id v18 = v19;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    uint64_t v11 = *(uint64_t (**)(uint64_t))(**(void **)(v0 + v2) + 264);
    uint64_t v12 = swift_retain();
    uint64_t v13 = v11(v12);
    uint64_t v15 = v14;
    swift_release();
    uint64_t v19 = (void *)v13;
    uint64_t v20 = v15;
    swift_bridgeObjectRetain();
    sub_21C589CA8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21C589CA8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21C589CA8();
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_21C56A3FC((uint64_t)v19, v20, 0, 0, 1, 0, 0, 0, MEMORY[0x263F8EE78]);
    long long v17 = *(void **)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
    *(void *)(v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v16;

    sub_21C5740A4();
  }
}

uint64_t sub_21C573B5C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v9 = v8;
  uint64_t v16 = (void *)MEMORY[0x263F8EED0];
  if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v8) + 0x220))())
  {
    unsigned int v55 = a8 & 1;
    int v17 = a3 & 1;
    unsigned int v53 = v17;
    uint64_t v54 = a7;
    uint64_t v18 = OBJC_IVAR___BRLTBrailleModelInternal_script;
    uint64_t v19 = (uint64_t *)(*(void *)((char *)v8 + OBJC_IVAR___BRLTBrailleModelInternal_script)
                    + OBJC_IVAR___BRLTEditStringInternal_string);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    swift_bridgeObjectRetain();
    uint64_t v22 = a2;
    uint64_t v23 = sub_21C57BED0(v21, v20, a1, a2, v17);
    uint64_t v25 = v24;
    char v27 = v26;
    swift_bridgeObjectRelease();
    uint64_t v28 = sub_21C57BDA4(v23, v25, v27 & 1);
    uint64_t v51 = v29;
    uint64_t v52 = v28;
    uint64_t v30 = *(void **)((char *)v9 + v18);
    uint64_t v31 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, void))((*MEMORY[0x263F8EED0] & *v30) + 0xA8);
    os_log_type_t v32 = v30;
    uint64_t v57 = a4;
    uint64_t v33 = v31(a1, v22, v53, a4, a5, a6, v54, v55);

    uint64_t v34 = *(void **)((char *)v9 + v18);
    *(void *)((char *)v9 + v18) = v33;

    uint64_t v35 = (void *)((char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_scriptHistory);
    swift_beginAccess();
    if (*v35 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_21C589E88();
      swift_bridgeObjectRelease();
      if (v50 < 6) {
        goto LABEL_5;
      }
    }
    else if (*(uint64_t *)((*v35 & 0xFFFFFFFFFFFFFF8) + 0x10) < 6)
    {
LABEL_5:
      uint64_t v37 = *(void **)((char *)v9 + v18);
      swift_beginAccess();
      id v38 = v37;
      MEMORY[0x21D4A96B0]();
      if (*(void *)((*v35 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_21C589D38();
      }
      sub_21C589D48();
      sub_21C589D28();
      swift_endAccess();
      *(CFAbsoluteTime *)((char *)v9 + OBJC_IVAR___BRLTBrailleModelInternal_lastScriptOutputTime) = CFAbsoluteTimeGetCurrent();
      swift_bridgeObjectRetain();
      uint64_t v39 = sub_21C589C58();
      swift_bridgeObjectRelease();
      if (!v55) {
        uint64_t v39 = a6;
      }
      uint64_t v40 = (uint64_t *)(*(void *)((char *)v9 + v18) + OBJC_IVAR___BRLTEditStringInternal_string);
      uint64_t v41 = *v40;
      uint64_t v42 = v40[1];
      swift_bridgeObjectRetain();
      uint64_t v43 = sub_21C57BE6C(v41, v42, v39);
      uint64_t v44 = swift_bridgeObjectRelease();
      uint64_t v45 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v9) + 0x160))(v44);
      uint64_t result = v57;
      if (v45)
      {
        uint64_t v47 = (void *)sub_21C589BF8();
        objc_msgSend(v45, sel_didReplaceScriptStringRange_withScriptString_cursorLocation_, v52, v51, v47, v43);

        return swift_unknownObjectRelease();
      }
      return result;
    }
    swift_beginAccess();
    uint64_t v36 = (void *)sub_21C573FC0(0);
    swift_endAccess();

    goto LABEL_5;
  }
  uint64_t result = (*(uint64_t (**)(void))((*v16 & *v8) + 0x160))();
  if (result)
  {
    uint64_t v48 = (void *)result;
    long long v49 = (void *)sub_21C589BF8();
    objc_msgSend(v48, sel_didInsertScriptString_, v49);

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_21C573FC0(unint64_t a1)
{
  unint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    sub_21C574C90(v3);
    unint64_t v3 = v5;
    unint64_t *v1 = v5;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v7 = *(void *)(v6 + 16);
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
      *(void *)(v6 + 16) = v8;
      sub_21C589D28();
      return v11;
    }
  }
  uint64_t result = sub_21C589E98();
  __break(1u);
  return result;
}

uint64_t sub_21C5740A4()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
  if (result)
  {
    unint64_t v3 = (void *)result;
    id v4 = *(uint64_t (**)(void))((*v1 & *v0) + 0x390);
    unint64_t v5 = (void *)v4();
    swift_bridgeObjectRetain();

    uint64_t v6 = (void *)sub_21C589BF8();
    uint64_t v7 = swift_bridgeObjectRelease();
    unint64_t v8 = (unsigned char *)((uint64_t (*)(uint64_t))v4)(v7);
    uint64_t v9 = *(void *)&v8[OBJC_IVAR___BRLTEditStringInternal_selection];
    uint64_t v10 = *(void *)&v8[OBJC_IVAR___BRLTEditStringInternal_selection + 8];
    char v11 = v8[OBJC_IVAR___BRLTEditStringInternal_selection + 16];

    uint64_t v12 = sub_21C57BDA4(v9, v10, v11);
    objc_msgSend(v3, sel_didChangeBrailleString_brailleSelection_, v6, v12, v13);

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_21C574210()
{
  uint64_t v1 = v0;
  type metadata accessor for BRLTEditString();
  uint64_t v2 = sub_21C56A44C(0, 0xE000000000000000, 0, 0, 1);
  unint64_t v3 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_script);
  *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_script) = v2;

  uint64_t v4 = sub_21C56A44C(0, 0xE000000000000000, 0, 0, 1);
  unint64_t v5 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille);
  *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_braille) = v4;

  uint64_t v6 = MEMORY[0x263F8EE78];
  sub_21C568B44(0, 0xE000000000000000, 0, 0xE000000000000000, MEMORY[0x263F8EE78], v18);
  uint64_t v7 = (char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_translationResult;
  long long v8 = v18[0];
  long long v9 = v18[1];
  *(_OWORD *)uint64_t v7 = v18[0];
  *((_OWORD *)v7 + 1) = v9;
  uint64_t v10 = v19;
  *((void *)v7 + 4) = v19;
  long long v21 = v9;
  long long v22 = v8;
  uint64_t v20 = v10;
  sub_21C571BC4((uint64_t)&v22);
  sub_21C571BC4((uint64_t)&v21);
  sub_21C569DCC((uint64_t)&v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21C571BF0((uint64_t)&v22);
  sub_21C571BF0((uint64_t)&v21);
  sub_21C569DF8((uint64_t)&v20);
  char v11 = (char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleStringDirty;
  swift_beginAccess();
  *char v11 = 0;
  *((unsigned char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_brailleSelectionDirty) = 0;
  *((unsigned char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_showingAlert) = 0;
  uint64_t v12 = sub_21C56A3FC(0, 0xE000000000000000, 0, 0, 1, 0, 0, 1, v6);
  uint64_t v13 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_alertScript);
  *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_alertScript) = v12;

  uint64_t v14 = sub_21C56A3FC(0, 0xE000000000000000, 0, 0, 1, 0, 0, 1, v6);
  uint64_t v15 = *(void **)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_alertBraille);
  *(void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_alertBraille) = v14;

  *((unsigned char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_showingTerminalOutput) = 0;
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x550))(0);
  uint64_t v16 = (void *)((char *)v0 + OBJC_IVAR___BRLTBrailleModelInternal_scriptHistory);
  swift_beginAccess();
  *uint64_t v16 = v6;
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)((char *)v1 + OBJC_IVAR___BRLTBrailleModelInternal_lastScriptOutputTime) = 0;
  return result;
}

id BRLTBrailleModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BRLTBrailleModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21C574638(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21C57470C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21C569D70((uint64_t)v12, *a3);
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
      sub_21C569D70((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21C57470C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21C589DB8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_21C5748C8(a5, a6);
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
  uint64_t v8 = sub_21C589E58();
  if (!v8)
  {
    sub_21C589E78();
    __break(1u);
LABEL_17:
    uint64_t result = sub_21C589E98();
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

uint64_t sub_21C5748C8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21C574960(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21C574B40(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_21C574B40(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21C574960(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_21C574AD8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_21C589E28();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_21C589E78();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_21C589CC8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_21C589E98();
    __break(1u);
LABEL_14:
    uint64_t result = sub_21C589E78();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21C574AD8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C89BA0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21C574B40(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C89BA0);
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
  uint64_t result = sub_21C589E98();
  __break(1u);
  return result;
}

void sub_21C574C90(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_21C589E88();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x21D4A9800);
}

uint64_t sub_21C574D0C(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    unint64_t v5 = *v3;
    if (!(*v3 >> 62))
    {
      if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_21C589E88();
  swift_bridgeObjectRelease();
  if (v19 < v2) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v7 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v6 = v4 - v2;
  if (__OFSUB__(0, v7))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_21C589E88();
    swift_bridgeObjectRelease();
    uint64_t v9 = v8 + v6;
    if (!__OFADD__(v8, v6)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_21C589E88();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  unint64_t v5 = *v3;
  if (*v3 >> 62) {
    goto LABEL_36;
  }
  uint64_t v8 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v9 = v8 - v7;
  if (__OFADD__(v8, v6)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v5 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *unint64_t v3 = v5;
  uint64_t v8 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v5 & 0xFFFFFFFFFFFFFF8;
    if (v9 <= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v8 = 1;
  }
  if (v5 >> 62) {
    goto LABEL_39;
  }
  uint64_t v12 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v9) {
    uint64_t v12 = v9;
  }
  swift_bridgeObjectRetain();
  unint64_t v5 = MEMORY[0x21D4A9800](v8, v12, 1, v5);
  swift_bridgeObjectRelease();
  *unint64_t v3 = v5;
  uint64_t v11 = v5 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  type metadata accessor for BRLTEditString();
  swift_arrayDestroy();
  if (v6)
  {
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_21C589E88();
      swift_bridgeObjectRelease();
      uint64_t v14 = v20 - v2;
      if (!__OFSUB__(v20, v2))
      {
LABEL_21:
        if (v14 < 0)
        {
LABEL_46:
          uint64_t result = sub_21C589E98();
          __break(1u);
          return result;
        }
        uint64_t v15 = (const void *)(v11 + 32 + 8 * v2);
        if (v4 != v2 || v11 + 32 + 8 * v4 >= (unint64_t)v15 + 8 * v14) {
          memmove((void *)(v11 + 32 + 8 * v4), v15, 8 * v14);
        }
        if (!(v5 >> 62))
        {
          uint64_t v16 = *(void *)(v11 + 16);
          uint64_t v17 = v16 + v6;
          if (!__OFADD__(v16, v6))
          {
LABEL_27:
            *(void *)(v11 + 16) = v17;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v21 = sub_21C589E88();
        swift_bridgeObjectRelease();
        uint64_t v17 = v21 + v6;
        if (!__OFADD__(v21, v6)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v13 = *(void *)(v11 + 16);
      uint64_t v14 = v13 - v2;
      if (!__OFSUB__(v13, v2)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:
  return sub_21C589D28();
}

uint64_t type metadata accessor for BRLTBrailleModel()
{
  return self;
}

uint64_t method lookup function for BRLTBrailleModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BRLTBrailleModel);
}

uint64_t dispatch thunk of BRLTBrailleModel.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of BRLTBrailleModel.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of BRLTBrailleModel.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of BRLTBrailleModel.backTranslateByCell.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of BRLTBrailleModel.backTranslateByCell.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of BRLTBrailleModel.backTranslateByCell.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of BRLTBrailleModel.technicalMode.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of BRLTBrailleModel.technicalMode.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of BRLTBrailleModel.technicalMode.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of BRLTBrailleModel.editable.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of BRLTBrailleModel.editable.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of BRLTBrailleModel.editable.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of BRLTBrailleModel.brailleStringDirty.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x280))();
}

uint64_t dispatch thunk of BRLTBrailleModel.setOutputTableIdentifier(_:manager:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x358))();
}

uint64_t dispatch thunk of BRLTBrailleModel.setInputTableIdentifier(_:manager:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x360))();
}

uint64_t dispatch thunk of BRLTBrailleModel.isCandidateSelectionActive.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x380))();
}

uint64_t dispatch thunk of BRLTBrailleModel.displayedScript.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x388))();
}

uint64_t dispatch thunk of BRLTBrailleModel.displayedBraille.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x390))();
}

uint64_t dispatch thunk of BRLTBrailleModel.bufferBrailleString.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x398))();
}

uint64_t dispatch thunk of BRLTBrailleModel.scriptLocation(forBrailleLocation:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3A0))();
}

uint64_t dispatch thunk of BRLTBrailleModel.setScript(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3A8))();
}

uint64_t dispatch thunk of BRLTBrailleModel.setAlert(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3B0))();
}

uint64_t dispatch thunk of BRLTBrailleModel.setTerminalOutput(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3B8))();
}

uint64_t dispatch thunk of BRLTBrailleModel.forceTranslate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3C0))();
}

uint64_t dispatch thunk of BRLTBrailleModel.handleBrailleDotPress(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x3C8))();
}

uint64_t dispatch thunk of BRLTBrailleModel.handleDelete(silently:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x408))();
}

uint64_t dispatch thunk of BRLTBrailleModel.handleBrailleSelection(NSSelection:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x450))();
}

uint64_t dispatch thunk of BRLTBrailleModel.handleEscape()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x4B8))();
}

uint64_t dispatch thunk of BRLTBrailleModel.handleReturn()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x4C0))();
}

uint64_t dispatch thunk of BRLTBrailleModel.handleWordDescriptionCommand()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x4C8))();
}

uint64_t dispatch thunk of BRLTBrailleModel.scriptRangeOfBrailleCellRepresentingCharacter(at:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x4D0))();
}

uint64_t dispatch thunk of BRLTBrailleModel.showNextCandidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x518))();
}

uint64_t dispatch thunk of BRLTBrailleModel.showPreviousCandidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x520))();
}

uint64_t dispatch thunk of BRLTBrailleModel.selectCandidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x528))();
}

uint64_t dispatch thunk of BRLTBrailleModel.isWordDescriptionActive.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x548))();
}

uint64_t dispatch thunk of BRLTBrailleModel.isWordDescriptionActive.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x550))();
}

uint64_t dispatch thunk of BRLTBrailleModel.isWordDescriptionActive.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x558))();
}

uint64_t dispatch thunk of BRLTBrailleModel.showNextWordDescription()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x588))();
}

uint64_t dispatch thunk of BRLTBrailleModel.showPreviousWordDescription()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x590))();
}

uint64_t dispatch thunk of BRLTBrailleModel._resetForTest()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x5B8))();
}

void *sub_21C57598C()
{
  uint64_t result = (void *)swift_allocObject();
  result[2] = &unk_26CCBCF58;
  result[3] = &unk_26CCBCF28;
  uint64_t v1 = MEMORY[0x263F8EE78];
  result[4] = 0;
  result[5] = v1;
  return result;
}

void *sub_21C5759D0()
{
  uint64_t result = v0;
  v0[2] = &unk_26CCBCFB8;
  v0[3] = &unk_26CCBCF88;
  uint64_t v2 = MEMORY[0x263F8EE78];
  v0[4] = 0;
  v0[5] = v2;
  return result;
}

uint64_t sub_21C5759F8(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v5 = v4;
  uint64_t v8 = a1;
  uint64_t v9 = (void *)MEMORY[0x263F8EED0];
  uint64_t v10 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0xB8);
  uint64_t v124 = (*MEMORY[0x263F8EED0] & *a1) + 184;
  *(void *)&long long v125 = v10;
  uint64_t v11 = (void *)v10();
  uint64_t v12 = (void *)(*(uint64_t (**)(void))((*v9 & *v8) + 0xD0))();
  uint64_t v13 = v12;
  v126 = v5;
  v117 = v11;
  id v118 = v12;
  if (a4)
  {
    uint64_t v49 = MEMORY[0x263F8EE78];
    v5[3] = MEMORY[0x263F8EE78];
    swift_bridgeObjectRelease();
    v5[2] = v49;
    swift_bridgeObjectRelease();
    uint64_t v50 = *(void (**)(void))((*v9 & *v13) + 0x78);
    uint64_t v51 = (*v9 & *v13) + 120;
    uint64_t v52 = v13;
    v50();

    uint64_t v53 = sub_21C589C58();
    swift_bridgeObjectRelease();
    if (v53 >= 1)
    {
      uint64_t v54 = v52;
      uint64_t v55 = ((uint64_t (*)(void))v50)();
      unint64_t v57 = v56;
      v123 = v54;

      unint64_t v58 = sub_21C568480(0, v55, v57, 1);
      uint64_t v60 = v59;
      swift_bridgeObjectRelease();
      if (v58 != v60)
      {
        long long v67 = *(uint64_t (**)(unint64_t, uint64_t))((*v9 & *v123) + 0x168);
        uint64_t v121 = (*v9 & *v123) + 360;
        v122 = v67;
        v119 = v8;
        uint64_t v120 = type metadata accessor for BRLTJBrailleForScriptTranslationResult();
        uint64_t v68 = 0;
        v129 = (uint64_t (*)(void))v51;
        v130 = (uint64_t (*)(void))v50;
        do
        {
          uint64_t v131 = (uint64_t)v8;
          uint64_t v128 = v60;
          uint64_t v69 = BRLTJTranslationResultProtocol.sourceRangeFor(targetRange:)(v58, v60, v120, (uint64_t)&protocol witness table for BRLTJBrailleForTextTranslationResult);
          uint64_t v71 = v70;
          uint64_t v72 = (void *)((uint64_t (*)(void))v125)();
          uint64_t v73 = (*(uint64_t (**)(uint64_t, uint64_t))((*v9 & *v72) + 0x168))(v69, v71);
          uint64_t v75 = v74;

          uint64_t v131 = v73;
          uint64_t v132 = v75;
          uint64_t v76 = sub_21C589BA8();
          uint64_t v77 = *(void *)(v76 - 8);
          uint64_t v78 = *(void *)(v77 + 64);
          MEMORY[0x270FA5388](v76, v79, v80);
          sub_21C589B98();
          unint64_t v127 = sub_21C56886C();
          uint64_t v81 = sub_21C589DC8();
          uint64_t v83 = v82;
          uint64_t v84 = *(void (**)(char *, uint64_t))(v77 + 8);
          v84((char *)&v117 - ((v78 + 15) & 0xFFFFFFFFFFFFFFF0), v76);
          swift_bridgeObjectRelease();
          uint64_t v85 = v5;
          char v86 = (char *)v5[3];
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v85[3] = v86;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            char v86 = sub_21C56837C(0, *((void *)v86 + 2) + 1, 1, v86);
            v126[3] = v86;
          }
          unint64_t v89 = *((void *)v86 + 2);
          unint64_t v88 = *((void *)v86 + 3);
          if (v89 >= v88 >> 1)
          {
            char v86 = sub_21C56837C((char *)(v88 > 1), v89 + 1, 1, v86);
            v126[3] = v86;
          }
          *((void *)v86 + 2) = v89 + 1;
          uint64_t v90 = &v86[16 * v89];
          *((void *)v90 + 4) = v81;
          *((void *)v90 + 5) = v83;
          uint64_t v91 = v123;
          uint64_t v92 = v130();
          unint64_t v94 = v93;

          unint64_t v95 = sub_21C568480(v68, v92, v94, 0);
          uint64_t v97 = v96;
          swift_bridgeObjectRelease();
          uint64_t v131 = v122(v95, v97);
          uint64_t v132 = v98;
          MEMORY[0x270FA5388](v131, v98, v99);
          sub_21C589B98();
          uint64_t v100 = sub_21C589DC8();
          uint64_t v102 = v101;
          v84((char *)&v117 - ((v78 + 15) & 0xFFFFFFFFFFFFFFF0), v76);
          swift_bridgeObjectRelease();
          unint64_t v5 = v126;
          v103 = (char *)v126[2];
          char v104 = swift_isUniquelyReferenced_nonNull_native();
          v5[2] = v103;
          if ((v104 & 1) == 0)
          {
            v103 = sub_21C56837C(0, *((void *)v103 + 2) + 1, 1, v103);
            v5[2] = v103;
          }
          uint64_t v9 = (void *)MEMORY[0x263F8EED0];
          uint64_t v8 = v119;
          unint64_t v106 = *((void *)v103 + 2);
          unint64_t v105 = *((void *)v103 + 3);
          if (v106 >= v105 >> 1)
          {
            v103 = sub_21C56837C((char *)(v105 > 1), v106 + 1, 1, v103);
            v5[2] = v103;
          }
          *((void *)v103 + 2) = v106 + 1;
          v107 = &v103[16 * v106];
          *((void *)v107 + 4) = v100;
          *((void *)v107 + 5) = v102;
          v108 = v91;
          v109 = v130;
          v130();

          uint64_t v110 = sub_21C589C58();
          swift_bridgeObjectRelease();
          uint64_t v68 = v128;
          if (v128 >= v110) {
            break;
          }
          v111 = v108;
          uint64_t v112 = v109();
          unint64_t v114 = v113;

          unint64_t v58 = sub_21C568480(v68, v112, v114, 1);
          uint64_t v116 = v115;
          swift_bridgeObjectRelease();
          uint64_t v60 = v116;
        }
        while (v58 != v116);
      }
    }
  }
  else
  {
    uint64_t v14 = (*v9 & *v12) + 120;
    v129 = *(uint64_t (**)(void))((*v9 & *v12) + 0x78);
    v130 = (uint64_t (*)(void))v14;
    uint64_t v15 = v12;
    uint64_t v16 = v129();
    unint64_t v18 = v17;

    unint64_t v19 = sub_21C568480(a2, v16, v18, 1);
    uint64_t v128 = a2;
    uint64_t v21 = v20;
    swift_bridgeObjectRelease();
    uint64_t v131 = (uint64_t)v8;
    uint64_t v22 = type metadata accessor for BRLTJBrailleForScriptTranslationResult();
    uint64_t v23 = BRLTJTranslationResultProtocol.sourceRangeFor(targetRange:)(v19, v21, v22, (uint64_t)&protocol witness table for BRLTJBrailleForTextTranslationResult);
    uint64_t v131 = (*(uint64_t (**)(uint64_t))((*v9 & *v11) + 0x168))(v23);
    uint64_t v132 = v24;
    uint64_t v25 = sub_21C589BA8();
    uint64_t v26 = *(void *)(v25 - 8);
    uint64_t v27 = *(void *)(v26 + 64);
    MEMORY[0x270FA5388](v25, v28, v29);
    unint64_t v30 = (v27 + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_21C589B98();
    unint64_t v127 = sub_21C56886C();
    uint64_t v31 = sub_21C589DC8();
    uint64_t v33 = v32;
    uint64_t v34 = *(void (**)(char *, uint64_t))(v26 + 8);
    v34((char *)&v117 - v30, v25);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C899E8);
    uint64_t v35 = swift_allocObject();
    long long v125 = xmmword_21C58CBD0;
    *(_OWORD *)(v35 + 16) = xmmword_21C58CBD0;
    *(void *)(v35 + 32) = v31;
    *(void *)(v35 + 40) = v33;
    v126[3] = v35;
    swift_bridgeObjectRelease();
    uint64_t v36 = v15;
    uint64_t v37 = v129();
    unint64_t v39 = v38;

    unint64_t v40 = sub_21C568480(v128, v37, v39, 0);
    uint64_t v42 = v41;
    swift_bridgeObjectRelease();
    uint64_t v131 = (*(uint64_t (**)(unint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *v36) + 0x168))(v40, v42);
    uint64_t v132 = v43;
    MEMORY[0x270FA5388](v131, v43, v44);
    sub_21C589B98();
    uint64_t v45 = sub_21C589DC8();
    uint64_t v47 = v46;
    v34((char *)&v117 - v30, v25);
    swift_bridgeObjectRelease();
    unint64_t v5 = v126;
    uint64_t v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = v125;
    *(void *)(v48 + 32) = v45;
    *(void *)(v48 + 40) = v47;
    v5[2] = v48;
    swift_bridgeObjectRelease();
  }
  if (!*(void *)(v5[3] + 16))
  {
    v5[3] = &unk_26CCBCEF8;
    swift_bridgeObjectRelease();
    v5[2] = &unk_26CCBCEC8;
    swift_bridgeObjectRelease();
  }
  v5[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C899E8);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_21C58CBD0;
  long long v62 = v117;
  if (*(void *)(v5[3] + 16))
  {
    uint64_t v63 = result;
    swift_bridgeObjectRetain();
    uint64_t v64 = sub_21C568728();
    uint64_t v66 = v65;
    swift_bridgeObjectRelease();
    *(void *)(v63 + 32) = v64;
    *(void *)(v63 + 40) = v66;
    v5[5] = v63;

    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21C5763CC()
{
  uint64_t result = (*(uint64_t (**)(void))(*v1 + 224))();
  if ((result & 1) == 0) {
    return result;
  }
  uint64_t v5 = v1[4];
  BOOL v6 = __OFADD__(v5, 1);
  unint64_t v7 = v5 + 1;
  if (v6)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v1[4] = v7;
  if (v7 != *(void *)(v1[5] + 16)) {
    return result;
  }
  if (v7 >= *(void *)(v1[3] + 16)) {
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_21C568728();
  uint64_t v2 = v8;
  swift_bridgeObjectRelease();
  uint64_t v3 = v1[5];
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  v1[5] = v3;
  if ((result & 1) == 0)
  {
LABEL_12:
    uint64_t result = (uint64_t)sub_21C56837C(0, *(void *)(v3 + 16) + 1, 1, (char *)v3);
    uint64_t v3 = result;
    v1[5] = result;
  }
  unint64_t v9 = *(void *)(v3 + 16);
  unint64_t v10 = *(void *)(v3 + 24);
  unint64_t v11 = v9 + 1;
  if (v9 >= v10 >> 1)
  {
    unint64_t v15 = v9 + 1;
    uint64_t v13 = (char *)v3;
    unint64_t v14 = *(void *)(v3 + 16);
    uint64_t result = (uint64_t)sub_21C56837C((char *)(v10 > 1), v9 + 1, 1, v13);
    unint64_t v9 = v14;
    unint64_t v11 = v15;
    uint64_t v3 = result;
    v1[5] = result;
  }
  *(void *)(v3 + 16) = v11;
  unint64_t v12 = v3 + 16 * v9;
  *(void *)(v12 + 32) = v0;
  *(void *)(v12 + 40) = v2;
  return result;
}

uint64_t sub_21C57650C()
{
  uint64_t result = (*(uint64_t (**)(void))(*v0 + 232))();
  if (result)
  {
    uint64_t v2 = v0[4];
    BOOL v3 = __OFSUB__(v2, 1);
    uint64_t v4 = v2 - 1;
    if (v3) {
      __break(1u);
    }
    else {
      v0[4] = v4;
    }
  }
  return result;
}

uint64_t BRLTJWordDescriptionManager.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BRLTJWordDescriptionManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for BRLTJWordDescriptionManager()
{
  return self;
}

uint64_t method lookup function for BRLTJWordDescriptionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BRLTJWordDescriptionManager);
}

uint64_t sub_21C576610(uint64_t a1)
{
  return sub_21C576760(a1, qword_267C89DE8);
}

uint64_t sub_21C57661C()
{
  return sub_21C576808(&qword_267C89DE0, (uint64_t)qword_267C89DE8);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t BRLTJLog.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21C576880(&qword_267C89DE0, (uint64_t)qword_267C89DE8, a1);
}

uint64_t BRLTJLog.setter(uint64_t a1)
{
  return sub_21C57694C(a1, &qword_267C89DE0, (uint64_t)qword_267C89DE8);
}

uint64_t (*BRLTJLog.modify())()
{
  if (qword_267C89DE0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21C589BD8();
  __swift_project_value_buffer(v0, (uint64_t)qword_267C89DE8);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_21C576754(uint64_t a1)
{
  return sub_21C576760(a1, qword_267C89E08);
}

uint64_t sub_21C576760(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_21C589BD8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_21C589BC8();
}

uint64_t sub_21C5767E4()
{
  return sub_21C576808(&qword_267C89E00, (uint64_t)qword_267C89E08);
}

uint64_t sub_21C576808(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_21C589BD8();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t BRLTJLogEvent.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21C576880(&qword_267C89E00, (uint64_t)qword_267C89E08, a1);
}

uint64_t sub_21C576880@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_21C589BD8();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t BRLTJLogEvent.setter(uint64_t a1)
{
  return sub_21C57694C(a1, &qword_267C89E00, (uint64_t)qword_267C89E08);
}

uint64_t sub_21C57694C(uint64_t a1, void *a2, uint64_t a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_21C589BD8();
  uint64_t v6 = __swift_project_value_buffer(v5, a3);
  swift_beginAccess();
  uint64_t v7 = *(void *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v6, a1, v5);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v5);
}

uint64_t (*BRLTJLogEvent.modify())()
{
  if (qword_267C89E00 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21C589BD8();
  __swift_project_value_buffer(v0, (uint64_t)qword_267C89E08);
  swift_beginAccess();
  return j__swift_endAccess;
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

Swift::Int __swiftcall BRLTJTranslationResultProtocol.sourceLocationFor(targetLocation:)(Swift::Int targetLocation)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  (*(void (**)())(v2 + 16))();
  Swift::Int v6 = sub_21C589C58();
  swift_bridgeObjectRelease();
  if (v6 <= targetLocation)
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v3);
    Swift::Int v9 = sub_21C589C58();
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    uint64_t v7 = *(uint64_t (**)(Swift::Int, uint64_t, uint64_t))(v3 + 24);
    return v7(targetLocation, v4, v3);
  }
}

uint64_t BRLTJTranslationResultProtocol.sourceRangeFor(targetRange:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21C576D00(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))BRLTJTranslationResultProtocol.sourceLocationFor(targetLocation:));
}

Swift::Int __swiftcall BRLTJTranslationResultProtocol.targetLocationFor(sourceLocation:)(Swift::Int sourceLocation)
{
  (*(void (**)())(v1 + 16))();
  uint64_t v3 = sub_21C589C58();
  Swift::Int result = swift_bridgeObjectRelease();
  if (v3 < 1)
  {
    return 0;
  }
  else
  {
    Swift::Int v5 = 0;
    while (!__OFADD__(v5, v3))
    {
      Swift::Int result = BRLTJTranslationResultProtocol.sourceLocationFor(targetLocation:)((v5 + v3) / 2);
      if (result < sourceLocation) {
        Swift::Int v5 = (v5 + v3) / 2 + 1;
      }
      else {
        uint64_t v3 = (v5 + v3) / 2;
      }
      if (v5 >= v3) {
        return v5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t BRLTJTranslationResultProtocol.targetRangeFor(sourceRange:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21C576D00(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))BRLTJTranslationResultProtocol.targetLocationFor(sourceLocation:));
}

uint64_t sub_21C576D00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = a5(a1, a3, a4);
  uint64_t result = a5(a2, a3, a4);
  if (result >= v9) {
    return v9;
  }
  __break(1u);
  return result;
}

uint64_t dispatch thunk of BRLTJTranslationResultProtocol.source.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of BRLTJTranslationResultProtocol.target.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of BRLTJTranslationResultProtocol.sourceLocation(forTargetLocation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_21C576E30()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___BRLTJEditableStringInternal_string);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_21C576EF4(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = (void *)(v2 + OBJC_IVAR___BRLTJEditableStringInternal_string);
  swift_beginAccess();
  *Swift::Int v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C576F54@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x78))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_21C576FB0(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR___BRLTJEditableStringInternal_string);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C57701C@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x90))();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  return result;
}

uint64_t sub_21C577080(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_21C57719C(a1, a2, a3, a4, &OBJC_IVAR___BRLTJEditableStringInternal_selection);
}

uint64_t sub_21C57708C()
{
  return sub_21C577204(&OBJC_IVAR___BRLTJEditableStringInternal_selection);
}

uint64_t sub_21C577098(uint64_t a1, uint64_t a2, char a3)
{
  return sub_21C577258(a1, a2, a3, &OBJC_IVAR___BRLTJEditableStringInternal_selection);
}

uint64_t sub_21C5770A4@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xA8))();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  return result;
}

uint64_t sub_21C577108(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_21C57719C(a1, a2, a3, a4, &OBJC_IVAR___BRLTJEditableStringInternal_focus);
}

uint64_t sub_21C577114()
{
  return sub_21C577204(&OBJC_IVAR___BRLTJEditableStringInternal_focus);
}

uint64_t sub_21C577120(uint64_t a1, uint64_t a2, char a3)
{
  return sub_21C577258(a1, a2, a3, &OBJC_IVAR___BRLTJEditableStringInternal_focus);
}

uint64_t sub_21C57712C@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xC0))();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5 & 1;
  return result;
}

uint64_t sub_21C577190(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_21C57719C(a1, a2, a3, a4, &OBJC_IVAR___BRLTJEditableStringInternal_suggestion);
}

uint64_t sub_21C57719C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  char v7 = *((unsigned char *)a1 + 16);
  uint64_t v8 = *a2 + *a5;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v8 = v5;
  *(void *)(v8 + 8) = v6;
  *(unsigned char *)(v8 + 16) = v7;
  return result;
}

uint64_t sub_21C5771F8()
{
  return sub_21C577204(&OBJC_IVAR___BRLTJEditableStringInternal_suggestion);
}

uint64_t sub_21C577204(void *a1)
{
  uint64_t v2 = v1 + *a1;
  swift_beginAccess();
  return *(void *)v2;
}

uint64_t sub_21C57724C(uint64_t a1, uint64_t a2, char a3)
{
  return sub_21C577258(a1, a2, a3, &OBJC_IVAR___BRLTJEditableStringInternal_suggestion);
}

uint64_t sub_21C577258(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v8 = v4 + *a4;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v8 = a1;
  *(void *)(v8 + 8) = a2;
  *(unsigned char *)(v8 + 16) = a3 & 1;
  return result;
}

uint64_t sub_21C5772B8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xD8))();
  *a2 = result;
  return result;
}

uint64_t sub_21C577314(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR___BRLTJEditableStringInternal_tokenRanges);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C577380()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21C5773CC(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___BRLTJEditableStringInternal_tokenRanges);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

BOOL sub_21C577420()
{
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
  return (v1 & 1) == 0;
}

uint64_t sub_21C577470()
{
  char v1 = (void *)MEMORY[0x263F8EED0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))() & 1) == 0) {
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(void))((*v1 & *v0) + 0x90))();
  if ((v4 & 1) == 0) {
    return result == v3;
  }
  __break(1u);
  return result;
}

id BRLTJEditableString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  unint64_t v18 = (char *)objc_allocWithZone(v12);
  unint64_t v19 = &v18[OBJC_IVAR___BRLTJEditableStringInternal_selection];
  *(void *)unint64_t v19 = 0;
  *((void *)v19 + 1) = 0;
  v19[16] = 1;
  uint64_t v20 = &v18[OBJC_IVAR___BRLTJEditableStringInternal_focus];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  v20[16] = 1;
  uint64_t v21 = &v18[OBJC_IVAR___BRLTJEditableStringInternal_suggestion];
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0;
  v21[16] = 1;
  uint64_t v22 = &v18[OBJC_IVAR___BRLTJEditableStringInternal_string];
  *(void *)uint64_t v22 = a1;
  *((void *)v22 + 1) = a2;
  swift_beginAccess();
  *(void *)unint64_t v19 = a3;
  *((void *)v19 + 1) = a4;
  v19[16] = a5 & 1;
  swift_beginAccess();
  *(void *)uint64_t v20 = a6;
  *((void *)v20 + 1) = a7;
  v20[16] = a8 & 1;
  swift_beginAccess();
  *(void *)uint64_t v21 = a9;
  *((void *)v21 + 1) = a10;
  v21[16] = a11 & 1;
  *(void *)&v18[OBJC_IVAR___BRLTJEditableStringInternal_tokenRanges] = a12;
  v27.receiver = v18;
  v27.super_class = v12;
  return objc_msgSendSuper2(&v27, sel_init);
}

id BRLTJEditableString.init(string:selection:focus:suggestion:tokenRanges:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12)
{
  unint64_t v18 = &v12[OBJC_IVAR___BRLTJEditableStringInternal_selection];
  *(void *)unint64_t v18 = 0;
  *((void *)v18 + 1) = 0;
  v18[16] = 1;
  unint64_t v19 = &v12[OBJC_IVAR___BRLTJEditableStringInternal_focus];
  *(void *)unint64_t v19 = 0;
  *((void *)v19 + 1) = 0;
  v19[16] = 1;
  uint64_t v20 = &v12[OBJC_IVAR___BRLTJEditableStringInternal_suggestion];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  v20[16] = 1;
  uint64_t v21 = &v12[OBJC_IVAR___BRLTJEditableStringInternal_string];
  *(void *)uint64_t v21 = a1;
  *((void *)v21 + 1) = a2;
  swift_beginAccess();
  *(void *)unint64_t v18 = a3;
  *((void *)v18 + 1) = a4;
  v18[16] = a5 & 1;
  swift_beginAccess();
  *(void *)unint64_t v19 = a6;
  *((void *)v19 + 1) = a7;
  v19[16] = a8 & 1;
  swift_beginAccess();
  *(void *)uint64_t v20 = a9;
  *((void *)v20 + 1) = a10;
  v20[16] = a11 & 1;
  *(void *)&v12[OBJC_IVAR___BRLTJEditableStringInternal_tokenRanges] = a12;
  v24.receiver = v12;
  v24.super_class = (Class)type metadata accessor for BRLTJEditableString();
  return objc_msgSendSuper2(&v24, sel_init);
}

uint64_t type metadata accessor for BRLTJEditableString()
{
  return self;
}

uint64_t BRLTJEditableString.__allocating_init(string:cursor:focus:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, void, void, void, char, void))(v6 + 256))(a1, a2, a3, a3, 0, a4, a5, a6 & 1, 0, 0, 1, MEMORY[0x263F8EE78]);
}

uint64_t sub_21C577860(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    char v7 = (char *)v3 + OBJC_IVAR___BRLTJEditableStringInternal_selection;
    uint64_t result = swift_beginAccess();
    *(void *)char v7 = a1;
LABEL_10:
    *((void *)v7 + 1) = a2;
    v7[16] = a3 & 1;
    return result;
  }
  uint64_t v9 = a1 & ~(a1 >> 63);
  unint64_t v10 = *(void (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0x78);
  v10();
  uint64_t v11 = sub_21C589C58();
  uint64_t v12 = swift_bridgeObjectRelease();
  if (v11 >= v9) {
    uint64_t v11 = v9;
  }
  ((void (*)(uint64_t))v10)(v12);
  uint64_t v13 = sub_21C589C58();
  uint64_t result = swift_bridgeObjectRelease();
  if (v13 >= (a2 & ~(a2 >> 63))) {
    a2 &= ~(a2 >> 63);
  }
  else {
    a2 = v13;
  }
  if (a2 >= v11)
  {
    char v7 = (char *)v3 + OBJC_IVAR___BRLTJEditableStringInternal_selection;
    uint64_t result = swift_beginAccess();
    *(void *)char v7 = v11;
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C577990(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))((*MEMORY[0x263F8EED0] & *v1) + 0x108))(a1, a1, 0);
}

uint64_t sub_21C5779D4()
{
  uint64_t v1 = v0 + OBJC_IVAR___BRLTJEditableStringInternal_selection;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v1 = 0;
  *(void *)(v1 + 8) = 0;
  *(unsigned char *)(v1 + 16) = 1;
  return result;
}

uint64_t sub_21C577A24()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t sub_21C577A70()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void (**)(void))((*v2 & *v0) + 0x78);
    v6();
    v6();
    swift_bridgeObjectRelease();
    unint64_t v7 = sub_21C589C88();
    uint64_t v8 = swift_bridgeObjectRelease();
    ((void (*)(uint64_t))v6)(v8);
    v6();
    swift_bridgeObjectRelease();
    unint64_t v9 = sub_21C589C88();
    uint64_t result = swift_bridgeObjectRelease();
    if (v9 >> 14 < v7 >> 14)
    {
      __break(1u);
    }
    else
    {
      swift_beginAccess();
      sub_21C577C5C();
      sub_21C589C38();
      swift_endAccess();
      uint64_t result = sub_21C589C58();
      uint64_t v10 = v5 + result;
      if (!__OFADD__(v5, result))
      {
        uint64_t v11 = (char *)v1 + OBJC_IVAR___BRLTJEditableStringInternal_selection;
        uint64_t result = swift_beginAccess();
        *(void *)uint64_t v11 = v10;
        *((void *)v11 + 1) = v10;
        v11[16] = 0;
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_21C577C5C()
{
  unint64_t result = qword_267C89BD0;
  if (!qword_267C89BD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267C89BD0);
  }
  return result;
}

uint64_t sub_21C577CB0()
{
  uint64_t v1 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90);
  uint64_t v2 = v1();
  if (v4) {
    return ((uint64_t (*)(uint64_t))v1)(v2);
  }
  if (v2 != v3 || v2 < 1) {
    return ((uint64_t (*)(uint64_t))v1)(v2);
  }
  else {
    return v2 - 1;
  }
}

uint64_t sub_21C577D40()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
  if (v4) {
    return 0;
  }
  uint64_t v5 = v3;
  if (((*(uint64_t (**)(void))((*v2 & *v0) + 0xF8))() & 1) == 0)
  {
    (*(void (**)(void, unint64_t))((*v2 & *v0) + 0x128))(0, 0xE000000000000000);
    return 1;
  }
  BOOL v6 = v5 < 1;
  uint64_t v7 = v5 - 1;
  if (v6) {
    return 0;
  }
  uint64_t v8 = *(void (**)(void))((*v2 & *v0) + 0x78);
  v8();
  v8();
  swift_bridgeObjectRelease();
  unint64_t v9 = sub_21C589C88();
  uint64_t v10 = swift_bridgeObjectRelease();
  ((void (*)(uint64_t))v8)(v10);
  unint64_t v11 = sub_21C589C68();
  uint64_t result = swift_bridgeObjectRelease();
  if (v11 >> 14 >= v9 >> 14)
  {
    swift_beginAccess();
    sub_21C577C5C();
    sub_21C589C38();
    swift_endAccess();
    uint64_t v13 = (char *)v1 + OBJC_IVAR___BRLTJEditableStringInternal_selection;
    uint64_t v14 = 1;
    swift_beginAccess();
    *(void *)uint64_t v13 = v7;
    *((void *)v13 + 1) = v7;
    v13[16] = 0;
    return v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C577F78()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  uint64_t v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90);
  uint64_t v3 = v2();
  if (v5) {
    return ((uint64_t (*)(uint64_t))v2)(v3);
  }
  uint64_t v6 = v4;
  if (v3 != v4) {
    return ((uint64_t (*)(uint64_t))v2)(v3);
  }
  (*(void (**)(void))((*v1 & *v0) + 0x78))();
  uint64_t v7 = sub_21C589C58();
  uint64_t v3 = swift_bridgeObjectRelease();
  if (v6 >= v7) {
    return ((uint64_t (*)(void))v2)(v3);
  }
  return v6;
}

uint64_t sub_21C578054()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  uint64_t v2 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
  if (v3) {
    return 0;
  }
  uint64_t v4 = v2;
  if (((*(uint64_t (**)(void))((*v1 & *v0) + 0xF8))() & 1) == 0)
  {
    (*(void (**)(void, unint64_t))((*v1 & *v0) + 0x128))(0, 0xE000000000000000);
    return 1;
  }
  char v5 = *(void (**)(void))((*v1 & *v0) + 0x78);
  v5();
  uint64_t v6 = sub_21C589C58();
  uint64_t v7 = swift_bridgeObjectRelease();
  if (v4 >= v6) {
    return 0;
  }
  ((void (*)(uint64_t))v5)(v7);
  v5();
  swift_bridgeObjectRelease();
  unint64_t v8 = sub_21C589C88();
  uint64_t v9 = swift_bridgeObjectRelease();
  ((void (*)(uint64_t))v5)(v9);
  unint64_t v10 = sub_21C589C68();
  uint64_t result = swift_bridgeObjectRelease();
  if (v10 >> 14 < v8 >> 14)
  {
    __break(1u);
    return result;
  }
  swift_beginAccess();
  sub_21C577C5C();
  sub_21C589C38();
  swift_endAccess();
  return 1;
}

uint64_t sub_21C578254(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)MEMORY[0x263F8EED0];
  uint64_t v5 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0xA8))();
  if ((v7 & 1) == 0)
  {
    uint64_t v8 = v5;
    uint64_t v9 = v6;
    unint64_t v10 = *(void (**)(void))((*v4 & *v1) + 0x78);
    v10();
    uint64_t v11 = sub_21C589C58();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v13 = v11 + v8;
    if (__OFADD__(v11, v8))
    {
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    ((void (*)(uint64_t))v10)(result);
    uint64_t v14 = sub_21C589C58();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v15 = v14 + v9;
    if (__OFADD__(v14, v9))
    {
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    if (v15 < v13)
    {
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    uint64_t v16 = (char *)v1 + OBJC_IVAR___BRLTJEditableStringInternal_focus;
    uint64_t v5 = swift_beginAccess();
    *(void *)uint64_t v16 = v13;
    *((void *)v16 + 1) = v15;
    v16[16] = 0;
  }
  uint64_t v17 = (*(uint64_t (**)(uint64_t))((*v4 & *a1) + 0x90))(v5);
  if ((v19 & 1) == 0)
  {
    uint64_t v20 = v17;
    uint64_t v21 = v18;
    uint64_t v22 = *(void (**)(void))((*v4 & *v2) + 0x78);
    v22();
    uint64_t v23 = sub_21C589C58();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v24 = v23 + v20;
    if (__OFADD__(v23, v20))
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    ((void (*)(uint64_t))v22)(result);
    uint64_t v25 = sub_21C589C58();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v26 = v25 + v21;
    if (__OFADD__(v25, v21))
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    if (v26 < v24)
    {
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
    objc_super v27 = (char *)v2 + OBJC_IVAR___BRLTJEditableStringInternal_selection;
    uint64_t v17 = swift_beginAccess();
    *(void *)objc_super v27 = v24;
    *((void *)v27 + 1) = v26;
    v27[16] = 0;
  }
  uint64_t v28 = (*(uint64_t (**)(uint64_t))((*v4 & *a1) + 0xC0))(v17);
  if (v30)
  {
LABEL_16:
    unint64_t v56 = a1;
    uint64_t v57 = (*(uint64_t (**)(uint64_t))((*v4 & *a1) + 0xD8))(v28);
    uint64_t v39 = *(void *)(v57 + 16);
    if (!v39)
    {
LABEL_26:
      uint64_t v55 = swift_bridgeObjectRelease();
      (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v56) + 0x78))(v55);
      swift_beginAccess();
      sub_21C589CA8();
      swift_endAccess();
      return swift_bridgeObjectRelease();
    }
    unint64_t v40 = *(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v2) + 0x78);
    unint64_t v58 = (void *)((char *)v2 + OBJC_IVAR___BRLTJEditableStringInternal_tokenRanges);
    uint64_t isUniquelyReferenced_nonNull_native = swift_beginAccess();
    uint64_t v42 = (uint64_t *)(v57 + 48);
    while (1)
    {
      uint64_t v59 = v39;
      uint64_t v44 = *(v42 - 2);
      uint64_t v43 = *(v42 - 1);
      uint64_t v45 = *v42;
      v40(isUniquelyReferenced_nonNull_native);
      uint64_t v46 = sub_21C589C58();
      uint64_t result = swift_bridgeObjectRelease();
      BOOL v47 = __OFADD__(v46, v44);
      uint64_t v48 = v46 + v44;
      if (v47) {
        break;
      }
      v40(result);
      uint64_t v49 = sub_21C589C58();
      uint64_t result = swift_bridgeObjectRelease();
      BOOL v47 = __OFADD__(v49, v43);
      uint64_t v50 = v49 + v43;
      if (v47) {
        goto LABEL_28;
      }
      if (v50 < v48) {
        goto LABEL_29;
      }
      uint64_t v51 = *v58;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *unint64_t v58 = v51;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_21C569BB8(0, *(void *)(v51 + 16) + 1, 1, (char *)v51);
        uint64_t v51 = isUniquelyReferenced_nonNull_native;
        *unint64_t v58 = isUniquelyReferenced_nonNull_native;
      }
      unint64_t v53 = *(void *)(v51 + 16);
      unint64_t v52 = *(void *)(v51 + 24);
      if (v53 >= v52 >> 1)
      {
        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_21C569BB8((char *)(v52 > 1), v53 + 1, 1, (char *)v51);
        uint64_t v51 = isUniquelyReferenced_nonNull_native;
        *unint64_t v58 = isUniquelyReferenced_nonNull_native;
      }
      v42 += 3;
      *(void *)(v51 + 16) = v53 + 1;
      uint64_t v54 = (void *)(v51 + 24 * v53);
      v54[4] = v48;
      v54[5] = v50;
      v54[6] = v45;
      uint64_t v39 = v59 - 1;
      if (v59 == 1) {
        goto LABEL_26;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v31 = v28;
  uint64_t v32 = v29;
  uint64_t v33 = *(void (**)(void))((*v4 & *v2) + 0x78);
  v33();
  uint64_t v34 = sub_21C589C58();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v35 = v34 + v31;
  if (__OFADD__(v34, v31))
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  ((void (*)(uint64_t))v33)(result);
  uint64_t v36 = sub_21C589C58();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v37 = v36 + v32;
  if (__OFADD__(v36, v32))
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (v37 >= v35)
  {
    unint64_t v38 = (char *)v2 + OBJC_IVAR___BRLTJEditableStringInternal_suggestion;
    uint64_t v28 = swift_beginAccess();
    *(void *)unint64_t v38 = v35;
    *((void *)v38 + 1) = v37;
    v38[16] = 0;
    goto LABEL_16;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_21C578820(uint64_t a1)
{
  uint64_t v3 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0xD8))();
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = (uint64_t *)(v3 + 48);
    while (*(v5 - 2) > a1 || *(v5 - 1) <= a1)
    {
      v5 += 3;
      if (!--v4) {
        goto LABEL_9;
      }
    }
    uint64_t v7 = *v5;
  }
  else
  {
LABEL_9:
    uint64_t v7 = 0;
  }
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_21C5788F0(uint64_t a1)
{
  sub_21C5674C4(a1, (uint64_t)v5);
  if (!v6)
  {
    sub_21C567570((uint64_t)v5);
    goto LABEL_5;
  }
  type metadata accessor for BRLTJEditableString();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    char v2 = 0;
    return v2 & 1;
  }
  char v2 = _s18BrailleTranslation19BRLTJEditableStringC2eeoiySbAC_ACtFZ_0(v1, v4);

  return v2 & 1;
}

uint64_t sub_21C578AC4()
{
  sub_21C589E18();
  uint64_t v1 = sub_21C589CA8();
  char v2 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0x78))(v1);
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_21C589CA8();
  (*(void (**)(uint64_t))((*v2 & *v0) + 0x90))(v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267C899E0);
  sub_21C589C18();
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_21C589CA8();
  (*(void (**)(uint64_t))((*v2 & *v0) + 0xA8))(v4);
  sub_21C589C18();
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_21C589CA8();
  (*(void (**)(uint64_t))((*v2 & *v0) + 0xC0))(v5);
  sub_21C589C18();
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_21C589CA8();
  uint64_t v7 = (*(uint64_t (**)(uint64_t))((*v2 & *v0) + 0xD8))(v6);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267C89A58);
  MEMORY[0x21D4A96D0](v7, v8);
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

id sub_21C578DA8@<X0>(void *a1@<X8>)
{
  char v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x78))();
  uint64_t v30 = v4;
  uint64_t v31 = v3;
  uint64_t v5 = (*(uint64_t (**)(void))((*v2 & *v1) + 0x90))();
  uint64_t v28 = v6;
  uint64_t v29 = v5;
  char v27 = v7;
  uint64_t v8 = (*(uint64_t (**)(void))((*v2 & *v1) + 0xA8))();
  uint64_t v25 = v9;
  uint64_t v26 = v8;
  char v11 = v10;
  uint64_t v12 = (*(uint64_t (**)(void))((*v2 & *v1) + 0xC0))();
  uint64_t v14 = v13;
  char v16 = v15;
  uint64_t v17 = (*(uint64_t (**)(void))((*v2 & *v1) + 0xD8))();
  uint64_t v18 = (objc_class *)type metadata accessor for BRLTJEditableString();
  char v19 = (char *)objc_allocWithZone(v18);
  uint64_t v20 = &v19[OBJC_IVAR___BRLTJEditableStringInternal_selection];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  v20[16] = 1;
  uint64_t v21 = &v19[OBJC_IVAR___BRLTJEditableStringInternal_focus];
  *(void *)uint64_t v21 = 0;
  *((void *)v21 + 1) = 0;
  v21[16] = 1;
  uint64_t v22 = &v19[OBJC_IVAR___BRLTJEditableStringInternal_suggestion];
  *(void *)uint64_t v22 = 0;
  *((void *)v22 + 1) = 0;
  v22[16] = 1;
  uint64_t v23 = (uint64_t *)&v19[OBJC_IVAR___BRLTJEditableStringInternal_string];
  uint64_t *v23 = v31;
  v23[1] = v30;
  swift_beginAccess();
  *(void *)uint64_t v20 = v29;
  *((void *)v20 + 1) = v28;
  v20[16] = v27 & 1;
  swift_beginAccess();
  *(void *)uint64_t v21 = v26;
  *((void *)v21 + 1) = v25;
  v21[16] = v11 & 1;
  swift_beginAccess();
  *(void *)uint64_t v22 = v12;
  *((void *)v22 + 1) = v14;
  v22[16] = v16 & 1;
  *(void *)&v19[OBJC_IVAR___BRLTJEditableStringInternal_tokenRanges] = v17;
  v33.receiver = v19;
  v33.super_class = v18;
  id result = objc_msgSendSuper2(&v33, sel_init);
  a1[3] = v18;
  *a1 = result;
  return result;
}

uint64_t sub_21C579060(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x78);
  v4();
  uint64_t v5 = sub_21C589C58();
  uint64_t v6 = swift_bridgeObjectRelease();
  if (v5 < a2)
  {
    ((void (*)(uint64_t))v4)(v6);
    sub_21C589C58();
    uint64_t v6 = swift_bridgeObjectRelease();
  }
  ((void (*)(uint64_t))v4)(v6);
  v4();
  swift_bridgeObjectRelease();
  unint64_t v7 = sub_21C589C88();
  uint64_t v8 = swift_bridgeObjectRelease();
  ((void (*)(uint64_t))v4)(v8);
  v4();
  swift_bridgeObjectRelease();
  unint64_t v9 = sub_21C589C88();
  uint64_t v10 = swift_bridgeObjectRelease();
  uint64_t result = ((uint64_t (*)(uint64_t))v4)(v10);
  if (v9 >> 14 < v7 >> 14)
  {
    __break(1u);
  }
  else
  {
    uint64_t v12 = sub_21C589CE8();
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();
    uint64_t v19 = MEMORY[0x21D4A95E0](v12, v14, v16, v18);
    swift_bridgeObjectRelease();
    return v19;
  }
  return result;
}

id BRLTJEditableString.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void BRLTJEditableString.init()()
{
}

id BRLTJEditableString.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BRLTJEditableString();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t BRLTJEditableString.NSSelection.getter()
{
  uint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
  char v4 = v3 & 1;
  return sub_21C57BDA4(v1, v2, v4);
}

uint64_t BRLTJEditableString.NSFocus.getter()
{
  uint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
  char v4 = v3 & 1;
  return sub_21C57BDA4(v1, v2, v4);
}

uint64_t BRLTJEditableString.NSSuggestion.getter()
{
  uint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
  char v4 = v3 & 1;
  return sub_21C57BDA4(v1, v2, v4);
}

id BRLTJEditableString.__allocating_init(string:selection:focus:token:suggestion:)(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v16 = objc_allocWithZone(v9);
  uint64_t v17 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  id v18 = objc_msgSend(v16, sel_initWithString_selection_focus_token_suggestion_, v17, a3, a4, a5, a6, a7, a8, a9);

  return v18;
}

uint64_t BRLTJEditableString.init(string:selection:focus:token:suggestion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v17 = v9;
  uint64_t v18 = sub_21C57BDD8(a3, a4);
  uint64_t v37 = v19;
  uint64_t v38 = v18;
  char v21 = v20;
  uint64_t v22 = sub_21C57BDD8(a5, a6);
  uint64_t v35 = v23;
  uint64_t v36 = v22;
  char v25 = v24;
  uint64_t v26 = sub_21C57BDD8(a8, a9);
  uint64_t v28 = v27;
  char v30 = v29;
  uint64_t ObjectType = swift_getObjectType();

  __swift_instantiateConcreteTypeFromMangledName(&qword_267C89A08);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_21C58CBD0;
  uint64_t result = sub_21C589C58();
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v32 + 32) = 0;
    *(void *)(v32 + 40) = result;
    *(void *)(v32 + 48) = a7;
    uint64_t v34 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, void, uint64_t, uint64_t, _BYTE, uint64_t))(ObjectType + 256))(a1, a2, v38, v37, v21 & 1, v36, v35, v25 & 1, v26, v28, v30 & 1, v32);
    swift_deallocPartialClassInstance();
    return v34;
  }
  return result;
}

uint64_t _s18BrailleTranslation19BRLTJEditableStringC2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  char v4 = (void *)MEMORY[0x263F8EED0];
  uint64_t v5 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0x78))();
  uint64_t v7 = v6;
  BOOL v9 = v5 == (*(uint64_t (**)(void))((*v4 & *a2) + 0x78))() && v7 == v8;
  if (v9)
  {
    uint64_t v11 = swift_bridgeObjectRelease_n();
  }
  else
  {
    char v10 = sub_21C589EC8();
    swift_bridgeObjectRelease();
    uint64_t v11 = swift_bridgeObjectRelease();
    BOOL v12 = 0;
    if ((v10 & 1) == 0) {
      return v12;
    }
  }
  uint64_t v13 = (*(uint64_t (**)(uint64_t))((*v4 & *a1) + 0x90))(v11);
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v18 = (*(uint64_t (**)(void))((*v4 & *a2) + 0x90))();
  if (v17)
  {
    if ((v20 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    if (v20) {
      return 0;
    }
    if (v13 != v18 || v15 != v19) {
      return 0;
    }
  }
  uint64_t v22 = (*(uint64_t (**)(uint64_t))((*v4 & *a1) + 0xA8))(v18);
  uint64_t v24 = v23;
  char v26 = v25;
  uint64_t v27 = (*(uint64_t (**)(void))((*v4 & *a2) + 0xA8))();
  if (v26)
  {
    if ((v29 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    if (v29) {
      return 0;
    }
    if (v22 != v27 || v24 != v28) {
      return 0;
    }
  }
  uint64_t v31 = (*(uint64_t (**)(uint64_t))((*v4 & *a1) + 0xC0))(v27);
  uint64_t v33 = v32;
  char v35 = v34;
  uint64_t v36 = (*(uint64_t (**)(void))((*v4 & *a2) + 0xC0))();
  if (v35)
  {
    if (v38) {
      goto LABEL_33;
    }
    return 0;
  }
  if (v38) {
    return 0;
  }
  if (v31 != v36 || v33 != v37) {
    return 0;
  }
LABEL_33:
  unint64_t v40 = *(uint64_t (**)(void))((*v4 & *a1) + 0xD8);
  uint64_t v41 = *(void *)(v40() + 16);
  uint64_t v42 = swift_bridgeObjectRelease();
  uint64_t v69 = *(uint64_t (**)(uint64_t))((*v4 & *a2) + 0xD8);
  uint64_t v43 = *(void *)(v69(v42) + 16);
  uint64_t v44 = swift_bridgeObjectRelease();
  if (v41 != v43) {
    return 0;
  }
  uint64_t v45 = *(void *)(((uint64_t (*)(uint64_t))v40)(v44) + 16);
  uint64_t v46 = swift_bridgeObjectRelease();
  uint64_t v68 = v45;
  if (!v45) {
    return 1;
  }
  uint64_t result = ((uint64_t (*)(uint64_t))v40)(v46);
  if (*(void *)(result + 16))
  {
    uint64_t v49 = *(void *)(result + 32);
    uint64_t v48 = *(void *)(result + 40);
    uint64_t v50 = *(void *)(result + 48);
    uint64_t v51 = swift_bridgeObjectRelease();
    uint64_t result = v69(v51);
    if (*(void *)(result + 16))
    {
      uint64_t v53 = *(void *)(result + 32);
      uint64_t v52 = *(void *)(result + 40);
      uint64_t v54 = *(void *)(result + 48);
      uint64_t v55 = swift_bridgeObjectRelease();
      BOOL v12 = 0;
      if (v49 == v53 && v48 == v52 && v50 == v54)
      {
        uint64_t v56 = 0;
        unint64_t v57 = 1;
        while (1)
        {
          BOOL v12 = v68 == v57;
          if (v68 == v57) {
            break;
          }
          uint64_t result = ((uint64_t (*)(uint64_t))v40)(v55);
          if (v57 >= *(void *)(result + 16))
          {
            __break(1u);
LABEL_56:
            __break(1u);
            goto LABEL_57;
          }
          ++v57;
          uint64_t v58 = *(void *)(result + v56 + 56);
          uint64_t v59 = *(void *)(result + v56 + 64);
          uint64_t v60 = *(void *)(result + v56 + 72);
          uint64_t v61 = swift_bridgeObjectRelease();
          uint64_t result = v69(v61);
          if (v57 - 1 >= *(void *)(result + 16)) {
            goto LABEL_56;
          }
          uint64_t v62 = v56 + 24;
          uint64_t v63 = result + v56;
          uint64_t v64 = *(void *)(result + v56 + 56);
          uint64_t v70 = *(void *)(v63 + 64);
          uint64_t v71 = v62;
          uint64_t v65 = *(void *)(v63 + 72);
          uint64_t v55 = swift_bridgeObjectRelease();
          BOOL v9 = v58 == v64;
          uint64_t v56 = v71;
          if (!v9 || v59 != v70 || v60 != v65) {
            return v12;
          }
        }
      }
      return v12;
    }
  }
  else
  {
LABEL_57:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t method lookup function for BRLTJEditableString(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BRLTJEditableString);
}

uint64_t dispatch thunk of BRLTJEditableString.string.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of BRLTJEditableString.selection.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of BRLTJEditableString.focus.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of BRLTJEditableString.suggestion.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of BRLTJEditableString.tokenRanges.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of BRLTJEditableString.isEditing.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of BRLTJEditableString.isCursor.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of BRLTJEditableString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, void, uint64_t, uint64_t))(v10 + 256))(a1, a2, a3, a4, a5 & 1, a6, a7, a8 & 1, a9, a10);
}

uint64_t dispatch thunk of BRLTJEditableString.select(_:)(uint64_t a1, uint64_t a2, char a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))((*MEMORY[0x263F8EED0] & *v3) + 0x108))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of BRLTJEditableString.setCursor(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of BRLTJEditableString.unselect()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of BRLTJEditableString.toInsertRange.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of BRLTJEditableString.insert(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of BRLTJEditableString.toDeleteRange.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of BRLTJEditableString.delete()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of BRLTJEditableString.toForwardDeleteRange.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of BRLTJEditableString.forwardDelete()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of BRLTJEditableString.append(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of BRLTJEditableString.tokenFor(location:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of BRLTJEditableString.copy(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of BRLTJEditableString.substringAt(range:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

id sub_21C57A344(uint64_t a1)
{
  char v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR____TtC18BrailleTranslation15BRLTJTranslator_translationDelegate] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id sub_21C57A394(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC18BrailleTranslation15BRLTJTranslator_translationDelegate] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for BRLTJTranslator();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for BRLTJTranslator()
{
  return self;
}

uint64_t sub_21C57A3F8(uint64_t a1, uint64_t a2)
{
  return sub_21C57A430(a1, a2, (SEL *)&selRef_brailleForText_, 0x656C6C69617262);
}

uint64_t sub_21C57A418(uint64_t a1, uint64_t a2)
{
  return sub_21C57A430(a1, a2, (SEL *)&selRef_textForBraille_, 1954047348);
}

uint64_t sub_21C57A430(uint64_t a1, uint64_t a2, SEL *a3, uint64_t a4)
{
  uint64_t v6 = *(void **)(v4 + OBJC_IVAR____TtC18BrailleTranslation15BRLTJTranslator_translationDelegate);
  if (v6)
  {
    uint64_t v8 = (void *)sub_21C589BF8();
    id v9 = objc_msgSend(v6, *a3, v8);

    uint64_t v10 = sub_21C589BE8();
  }
  else
  {
    uint64_t v10 = MEMORY[0x263F8EE80];
  }
  sub_21C589E08();
  if (*(void *)(v10 + 16) && (unint64_t v11 = sub_21C56995C((uint64_t)v17), (v12 & 1) != 0))
  {
    sub_21C569D70(*(void *)(v10 + 56) + 32 * v11, (uint64_t)&v18);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  sub_21C5699A0((uint64_t)v17);
  if (!*((void *)&v19 + 1))
  {
    sub_21C567570((uint64_t)&v18);
    goto LABEL_12;
  }
  if (!swift_dynamicCast())
  {
LABEL_12:
    uint64_t v13 = 0;
    goto LABEL_13;
  }
  uint64_t v13 = a4;
LABEL_13:
  sub_21C589E08();
  if (*(void *)(v10 + 16) && (unint64_t v14 = sub_21C56995C((uint64_t)v17), (v15 & 1) != 0))
  {
    sub_21C569D70(*(void *)(v10 + 56) + 32 * v14, (uint64_t)&v18);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_21C5699A0((uint64_t)v17);
  if (*((void *)&v19 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C899F8);
    swift_dynamicCast();
  }
  else
  {
    sub_21C567570((uint64_t)&v18);
  }
  return v13;
}

void BRLTJTranslator.init()()
{
}

id BRLTJTranslator.__deallocating_deinit()
{
  return sub_21C57B580(type metadata accessor for BRLTJTranslator);
}

uint64_t sub_21C57A6C8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x68))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_21C57A724(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_21C57B224(a1, a2, a3, a4, &OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_source);
}

uint64_t sub_21C57A730()
{
  return sub_21C57B298(&OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_source);
}

uint64_t sub_21C57A73C(uint64_t a1, uint64_t a2)
{
  return sub_21C57B2F8(a1, a2, &OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_source);
}

uint64_t sub_21C57A748@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x80))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_21C57A7A4(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_21C57B224(a1, a2, a3, a4, &OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_target);
}

uint64_t sub_21C57A7B0()
{
  return sub_21C57B298(&OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_target);
}

uint64_t sub_21C57A7BC(uint64_t a1, uint64_t a2)
{
  return sub_21C57B2F8(a1, a2, &OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_target);
}

id sub_21C57A7C8(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_21C57B738(a1, a2, a3);

  return v8;
}

id sub_21C57A820(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = sub_21C57B738(a1, a2, a3);

  return v4;
}

uint64_t sub_21C57A850(uint64_t a1)
{
  if (a1 < 0) {
    return 0;
  }
  objc_super v3 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x80))();
  uint64_t v4 = sub_21C589C58();
  uint64_t v5 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))((*v3 & *v1) + 0x68))(v5);
  if (v4 <= a1)
  {
    uint64_t v9 = sub_21C589C58();
    swift_bridgeObjectRelease();
    return v9;
  }
  uint64_t v6 = (void *)sub_21C589BF8();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)((char *)v1
                 + OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_unicharLocations);
  if (*(void *)(v8 + 16) > (unint64_t)a1)
  {
    uint64_t v9 = BRLTJIndexForUnicharIndex(v6, *(void *)(v8 + 8 * a1 + 32));

    return v9;
  }
  __break(1u);
  return result;
}

void BRLTJBrailleForTextTranslationResult.init()()
{
}

id BRLTJBrailleForTextTranslationResult.__deallocating_deinit()
{
  return sub_21C57B580(type metadata accessor for BRLTJBrailleForTextTranslationResult);
}

uint64_t sub_21C57A9FC()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x68))();
}

uint64_t sub_21C57AA50()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x80))();
}

uint64_t sub_21C57AAA4()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0xA0))();
}

uint64_t sub_21C57AAF8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xB8))();
  *a2 = result;
  return result;
}

void sub_21C57AB54(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_21C57AB60()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18BrailleTranslation38BRLTJBrailleForScriptTranslationResult_script);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void sub_21C57ABB8(void *a1)
{
}

uint64_t sub_21C57ABC4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xD0))();
  *a2 = result;
  return result;
}

void sub_21C57AC20(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

void sub_21C57AC2C(void **a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  uint64_t v6 = (void **)(*a2 + *a5);
  swift_beginAccess();
  id v7 = *v6;
  *uint64_t v6 = v5;
  id v8 = v5;
}

id sub_21C57AC8C()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC18BrailleTranslation38BRLTJBrailleForScriptTranslationResult_braille);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void sub_21C57ACE4(void *a1)
{
}

void sub_21C57ACF0(void *a1, void *a2)
{
  uint64_t v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a1;
}

void *sub_21C57AD40(void *a1, void *a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_21C57AD84(a1, a2);
}

void *sub_21C57AD84(void *a1, void *a2)
{
  *(void *)&v2[OBJC_IVAR____TtC18BrailleTranslation38BRLTJBrailleForScriptTranslationResult_script] = a2;
  type metadata accessor for BRLTJBrailleString();
  id v5 = v2;
  uint64_t v6 = a2;
  uint64_t v7 = sub_21C565688();
  *(void *)&v5[OBJC_IVAR____TtC18BrailleTranslation38BRLTJBrailleForScriptTranslationResult_braille] = BRLTJBrailleString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(0, 0xE000000000000000, 0, 0, 1, 0, 0, 1, 0, 0, 1, v7);

  id v8 = (void *)MEMORY[0x263F8EED0];
  uint64_t v9 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v6) + 0x78);
  uint64_t v10 = a1;
  uint64_t v11 = v9();
  id v13 = sub_21C57B738(a1, v11, v12);

  unint64_t v14 = *(uint64_t (**)(void))((*v8 & *v6) + 0x90);
  char v15 = v13;
  uint64_t v16 = v14();
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  char v45 = v20 & 1;
  if ((v20 & 1) == 0)
  {
    uint64_t v21 = v16;
    uint64_t v22 = v17;
    uint64_t v23 = type metadata accessor for BRLTJBrailleForScriptTranslationResult();
    uint64_t v16 = BRLTJTranslationResultProtocol.targetRangeFor(sourceRange:)(v21, v22, v23, (uint64_t)&protocol witness table for BRLTJBrailleForTextTranslationResult);
    uint64_t v18 = v16;
    uint64_t v19 = v24;
  }
  uint64_t v25 = (*(uint64_t (**)(uint64_t))((*v8 & *v6) + 0xC0))(v16);
  char v28 = v27 & 1;
  if (v27)
  {
    uint64_t v32 = 0;
    uint64_t v34 = 0;
  }
  else
  {
    uint64_t v29 = v25;
    uint64_t v30 = v26;
    uint64_t v31 = type metadata accessor for BRLTJBrailleForScriptTranslationResult();
    uint64_t v32 = BRLTJTranslationResultProtocol.targetRangeFor(sourceRange:)(v29, v30, v31, (uint64_t)&protocol witness table for BRLTJBrailleForTextTranslationResult);
    uint64_t v34 = v33;
  }
  char v35 = *(uint64_t (**)(void))((*v8 & *v15) + 0x80);
  uint64_t v36 = v15;
  uint64_t v37 = v35();
  uint64_t v39 = v38;

  uint64_t v44 = sub_21C565688();
  id v40 = BRLTJBrailleString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(v37, v39, v18, v19, v45, 0, 0, 1, v32, v34, v28, v44);

  uint64_t v41 = (void **)((char *)v36 + OBJC_IVAR____TtC18BrailleTranslation38BRLTJBrailleForScriptTranslationResult_braille);
  swift_beginAccess();
  uint64_t v42 = *v41;
  *uint64_t v41 = v40;

  return v36;
}

void sub_21C57B068()
{
}

void sub_21C57B098()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC18BrailleTranslation38BRLTJBrailleForScriptTranslationResult_braille);
}

id BRLTJBrailleForScriptTranslationResult.__deallocating_deinit()
{
  return sub_21C57B580(type metadata accessor for BRLTJBrailleForScriptTranslationResult);
}

uint64_t sub_21C57B13C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x68))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_21C57B198(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_21C57B224(a1, a2, a3, a4, &OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_source);
}

uint64_t sub_21C57B1A4()
{
  return sub_21C57B298(&OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_source);
}

uint64_t sub_21C57B1B0(uint64_t a1, uint64_t a2)
{
  return sub_21C57B2F8(a1, a2, &OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_source);
}

uint64_t sub_21C57B1BC@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x80))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_21C57B218(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_21C57B224(a1, a2, a3, a4, &OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_target);
}

uint64_t sub_21C57B224(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v7 = (void *)(*a2 + *a5);
  swift_beginAccess();
  *uint64_t v7 = v6;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C57B28C()
{
  return sub_21C57B298(&OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_target);
}

uint64_t sub_21C57B298(void *a1)
{
  uint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_21C57B2EC(uint64_t a1, uint64_t a2)
{
  return sub_21C57B2F8(a1, a2, &OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_target);
}

uint64_t sub_21C57B2F8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

id sub_21C57B354(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_21C57B948(a1, a2, a3);

  return v8;
}

id sub_21C57B3AC(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = sub_21C57B948(a1, a2, a3);

  return v4;
}

uint64_t sub_21C57B3DC(uint64_t a1)
{
  if (a1 < 0) {
    return 0;
  }
  uint64_t v3 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x80))();
  uint64_t v4 = sub_21C589C58();
  uint64_t result = swift_bridgeObjectRelease();
  if (v4 <= a1)
  {
    (*(void (**)(uint64_t))((*v3 & *v1) + 0x68))(result);
    uint64_t v7 = sub_21C589C58();
    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {
    uint64_t v6 = *(void *)((char *)v1 + OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_locations);
    if (*(void *)(v6 + 16) <= (unint64_t)a1) {
      __break(1u);
    }
    else {
      return *(void *)(v6 + 8 * a1 + 32);
    }
  }
  return result;
}

id BRLTJTextForBrailleTranslationResult.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void BRLTJTextForBrailleTranslationResult.init()()
{
}

id BRLTJTextForBrailleTranslationResult.__deallocating_deinit()
{
  return sub_21C57B580(type metadata accessor for BRLTJTextForBrailleTranslationResult);
}

id sub_21C57B580(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_21C57B5D4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C57B63C()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x68))();
}

uint64_t sub_21C57B690()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x80))();
}

uint64_t sub_21C57B6E4()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0xA0))();
}

id sub_21C57B738(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = &v4[OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_source];
  *(void *)uint64_t v7 = a2;
  *((void *)v7 + 1) = a3;
  if (a1)
  {
    id v8 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *a1) + 0x60);
    swift_bridgeObjectRetain();
    uint64_t v9 = v4;
    uint64_t v10 = v8(a2, a3);
    uint64_t v12 = v11;
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    char v15 = (uint64_t *)&v9[OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_target];
    *char v15 = v10;
    v15[1] = v12;
LABEL_3:
    *(void *)&v9[OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_unicharLocations] = v14;

    v22.receiver = v4;
    v22.super_class = (Class)type metadata accessor for BRLTJBrailleForTextTranslationResult();
    return objc_msgSendSuper2(&v22, sel_init);
  }
  uint64_t v17 = &v4[OBJC_IVAR____TtC18BrailleTranslation36BRLTJBrailleForTextTranslationResult_target];
  *(void *)uint64_t v17 = a2;
  *((void *)v17 + 1) = a3;
  swift_bridgeObjectRetain_n();
  uint64_t v9 = v4;
  uint64_t v18 = sub_21C589C58();
  id result = (id)swift_bridgeObjectRelease();
  if ((v18 & 0x8000000000000000) == 0)
  {
    if (v18)
    {
      unint64_t v14 = sub_21C569ABC(0, 1, 1, MEMORY[0x263F8EE78]);
      uint64_t v19 = 0;
      unint64_t v20 = *((void *)v14 + 2);
      do
      {
        unint64_t v21 = *((void *)v14 + 3);
        if (v20 >= v21 >> 1) {
          unint64_t v14 = sub_21C569ABC((char *)(v21 > 1), v20 + 1, 1, v14);
        }
        *((void *)v14 + 2) = v20 + 1;
        *(void *)&v14[8 * v20++ + 32] = v19++;
      }
      while (v18 != v19);
    }
    else
    {
      unint64_t v14 = (char *)MEMORY[0x263F8EE78];
    }
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BRLTJBrailleForTextTranslationResult()
{
  return self;
}

uint64_t type metadata accessor for BRLTJBrailleForScriptTranslationResult()
{
  return self;
}

id sub_21C57B948(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = &v4[OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_source];
  *(void *)uint64_t v7 = a2;
  *((void *)v7 + 1) = a3;
  if (a1)
  {
    id v8 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & *a1) + 0x68);
    swift_bridgeObjectRetain();
    uint64_t v9 = v4;
    uint64_t v10 = v8(a2, a3);
    uint64_t v12 = v11;
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    char v15 = (uint64_t *)&v9[OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_target];
    *char v15 = v10;
    v15[1] = v12;
LABEL_3:
    *(void *)&v9[OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_locations] = v14;

    v22.receiver = v4;
    v22.super_class = (Class)type metadata accessor for BRLTJTextForBrailleTranslationResult();
    return objc_msgSendSuper2(&v22, sel_init);
  }
  uint64_t v17 = &v4[OBJC_IVAR____TtC18BrailleTranslation36BRLTJTextForBrailleTranslationResult_target];
  *(void *)uint64_t v17 = a2;
  *((void *)v17 + 1) = a3;
  swift_bridgeObjectRetain_n();
  uint64_t v9 = v4;
  uint64_t v18 = sub_21C589C58();
  id result = (id)swift_bridgeObjectRelease();
  if ((v18 & 0x8000000000000000) == 0)
  {
    if (v18)
    {
      unint64_t v14 = sub_21C569ABC(0, 1, 1, MEMORY[0x263F8EE78]);
      uint64_t v19 = 0;
      unint64_t v20 = *((void *)v14 + 2);
      do
      {
        unint64_t v21 = *((void *)v14 + 3);
        if (v20 >= v21 >> 1) {
          unint64_t v14 = sub_21C569ABC((char *)(v21 > 1), v20 + 1, 1, v14);
        }
        *((void *)v14 + 2) = v20 + 1;
        *(void *)&v14[8 * v20++ + 32] = v19++;
      }
      while (v18 != v19);
    }
    else
    {
      unint64_t v14 = (char *)MEMORY[0x263F8EE78];
    }
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BRLTJTextForBrailleTranslationResult()
{
  return self;
}

uint64_t method lookup function for BRLTJTranslator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BRLTJTranslator);
}

uint64_t dispatch thunk of BRLTJTranslator.braille(forText:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of BRLTJTranslator.text(forBraille:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t method lookup function for BRLTJBrailleForTextTranslationResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BRLTJBrailleForTextTranslationResult);
}

uint64_t dispatch thunk of BRLTJBrailleForTextTranslationResult.source.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of BRLTJBrailleForTextTranslationResult.target.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of BRLTJBrailleForTextTranslationResult.sourceLocation(forTargetLocation:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t method lookup function for BRLTJBrailleForScriptTranslationResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BRLTJBrailleForScriptTranslationResult);
}

uint64_t dispatch thunk of BRLTJBrailleForScriptTranslationResult.script.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of BRLTJBrailleForScriptTranslationResult.braille.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t method lookup function for BRLTJTextForBrailleTranslationResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BRLTJTextForBrailleTranslationResult);
}

uint64_t dispatch thunk of BRLTJTextForBrailleTranslationResult.source.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of BRLTJTextForBrailleTranslationResult.target.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of BRLTJTextForBrailleTranslationResult.sourceLocation(forTargetLocation:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t sub_21C57BDA4(uint64_t result, uint64_t a2, char a3)
{
  if (a3) {
    return sub_21C589B88();
  }
  if (__OFSUB__(a2, result)) {
    __break(1u);
  }
  return result;
}

uint64_t sub_21C57BDD8(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_21C589B88();
  if (result == a1) {
    return 0;
  }
  uint64_t v5 = a1;
  if (a2 + a1 >= a1) {
    return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C57BE34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21C57BE84(a1, a2, a3, BRLTJIndexForUnicharIndex);
}

uint64_t sub_21C57BE4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_21C57BEF0(a1, a2, a3, a4, a5, BRLTJIndexForUnicharIndex, "Unichar Range %s -> Char Range %s");
}

uint64_t sub_21C57BE6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21C57BE84(a1, a2, a3, (uint64_t (*)(void *, uint64_t))BRLTJUnicharIndexForIndex);
}

uint64_t sub_21C57BE84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *, uint64_t))
{
  uint64_t v6 = (void *)sub_21C589BF8();
  uint64_t v7 = a4(v6, a3);

  return v7;
}

uint64_t sub_21C57BED0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  return sub_21C57BEF0(a1, a2, a3, a4, a5, (uint64_t (*)(void *, uint64_t))BRLTJUnicharIndexForIndex, "Char Range %s -> Unichar Range %s");
}

uint64_t sub_21C57BEF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t (*a6)(void *, uint64_t), const char *a7)
{
  if (a5) {
    return a3;
  }
  int v33 = a5;
  uint64_t v11 = (void *)sub_21C589BF8();
  uint64_t v12 = a6(v11, a3);

  id v13 = (void *)sub_21C589BF8();
  uint64_t v14 = a6(v13, a4);

  uint64_t v15 = sub_21C57661C();
  swift_beginAccess();
  uint64_t v16 = sub_21C589BD8();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16, v18, v19);
  unint64_t v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v21, v15, v16);
  objc_super v22 = sub_21C589BB8();
  int v32 = sub_21C589D68();
  if (os_log_type_enabled(v22, (os_log_type_t)v32))
  {
    os_log_t v28 = v22;
    uint64_t v29 = v16;
    uint64_t v30 = &v27;
    uint64_t v31 = a7;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v37 = a3;
    uint64_t v38 = v27;
    *(_DWORD *)uint64_t v23 = 136315394;
    uint64_t v34 = 0;
    unint64_t v35 = 0xE000000000000000;
    uint64_t v36 = a4;
    sub_21C589E68();
    sub_21C589CA8();
    sub_21C589E68();
    uint64_t v34 = sub_21C574638(v34, v35, &v38);
    sub_21C589DA8();
    uint64_t result = swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 12) = 2080;
    if (v14 < v12) {
      goto LABEL_10;
    }
    uint64_t v36 = v14;
    uint64_t v37 = v12;
    uint64_t v34 = 0;
    unint64_t v35 = 0xE000000000000000;
    sub_21C589E68();
    sub_21C589CA8();
    sub_21C589E68();
    uint64_t v34 = sub_21C574638(v34, v35, &v38);
    sub_21C589DA8();
    swift_bridgeObjectRelease();
    uint64_t v26 = v27;
    os_log_t v25 = v28;
    _os_log_impl(&dword_21C554000, v28, (os_log_type_t)v32, v31, (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x21D4AA0F0](v26, -1, -1);
    MEMORY[0x21D4AA0F0](v23, -1, -1);

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v21, v29);
  }
  else
  {

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v21, v16);
  }
  if (v14 >= v12) {
    return v12;
  }
  __break(1u);
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_21C57C2AC()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_21C57C2E0(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 16) = a1;
  return result;
}

uint64_t sub_21C57C320()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21C57C36C(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C57C3C0()
{
  swift_beginAccess();
  return *(void *)(v0 + 40);
}

uint64_t sub_21C57C3F4(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 40) = a1;
  return result;
}

uint64_t sub_21C57C434(char a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0xE000000000000000;
  uint64_t v3 = MEMORY[0x263F8EE78];
  *(void *)(result + 56) = MEMORY[0x263F8EE78];
  *(void *)(result + 64) = v3;
  *(void *)(result + 40) = 0;
  *(void *)(result + 48) = 0;
  *(unsigned char *)(result + 16) = 0;
  *(unsigned char *)(result + 72) = a1;
  return result;
}

uint64_t sub_21C57C484(char a1)
{
  *(void *)(v1 + 24) = 0;
  *(void *)(v1 + 32) = 0xE000000000000000;
  uint64_t v2 = MEMORY[0x263F8EE78];
  *(void *)(v1 + 56) = MEMORY[0x263F8EE78];
  *(void *)(v1 + 64) = v2;
  *(void *)(v1 + 40) = 0;
  *(void *)(v1 + 48) = 0;
  *(unsigned char *)(v1 + 16) = 0;
  *(unsigned char *)(v1 + 72) = a1;
  return v1;
}

void *sub_21C57C4AC(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(unsigned char *)(v2 + 16) = 1;
  id v5 = objc_msgSend(objc_allocWithZone((Class)BRLTJMecabraWrapper), sel_initWithUnitTesting_, *(unsigned __int8 *)(v2 + 72));
  uint64_t v6 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = v5;

  uint64_t v7 = (char **)(v2 + 56);
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x263F8EE78];
  *(void *)(v2 + 56) = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  uint64_t v9 = (char **)(v2 + 64);
  swift_beginAccess();
  *(void *)(v2 + 64) = v8;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)(v2 + 40) = 0;
  swift_beginAccess();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (sub_21C589C58() < 33)
  {
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  else
  {
    sub_21C589C88();
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_21C589CE8();
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    MEMORY[0x21D4A95E0](v10, v12, v14, v16);
    uint64_t result = (void *)swift_bridgeObjectRelease();
  }
  uint64_t v18 = *(void **)(v2 + 48);
  if (!v18)
  {
    __break(1u);
    goto LABEL_29;
  }
  id v19 = v18;
  uint64_t v20 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_analyzeString_, v20);

  uint64_t result = *(void **)(v2 + 48);
  if (!result)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (!objc_msgSend(result, sel_moveToNextCandidate))
  {
    swift_beginAccess();
    uint64_t v39 = *v7;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v7 = v39;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v39 = sub_21C56837C(0, *((void *)v39 + 2) + 1, 1, v39);
      *uint64_t v7 = v39;
    }
    unint64_t v42 = *((void *)v39 + 2);
    unint64_t v41 = *((void *)v39 + 3);
    if (v42 >= v41 >> 1)
    {
      uint64_t v39 = sub_21C56837C((char *)(v41 > 1), v42 + 1, 1, v39);
      *uint64_t v7 = v39;
    }
    *((void *)v39 + 2) = v42 + 1;
    uint64_t v43 = &v39[16 * v42];
    *((void *)v43 + 4) = 0;
    *((void *)v43 + 5) = 0xE000000000000000;
    swift_endAccess();
    swift_beginAccess();
    uint64_t v44 = *v9;
    swift_bridgeObjectRetain();
    char v45 = swift_isUniquelyReferenced_nonNull_native();
    char *v9 = v44;
    if ((v45 & 1) == 0)
    {
      uint64_t v44 = sub_21C56837C(0, *((void *)v44 + 2) + 1, 1, v44);
      char *v9 = v44;
    }
    unint64_t v47 = *((void *)v44 + 2);
    unint64_t v46 = *((void *)v44 + 3);
    if (v47 >= v46 >> 1)
    {
      uint64_t v44 = sub_21C56837C((char *)(v46 > 1), v47 + 1, 1, v44);
      char *v9 = v44;
    }
    *((void *)v44 + 2) = v47 + 1;
    uint64_t v48 = &v44[16 * v47];
    *((void *)v48 + 4) = a1;
    *((void *)v48 + 5) = a2;
    return (void *)swift_endAccess();
  }
  uint64_t result = *(void **)(v2 + 48);
  if (!result) {
    goto LABEL_30;
  }
  id v21 = objc_msgSend(result, sel_getCurrentCandidateSurface);
  uint64_t v22 = sub_21C589C08();
  uint64_t v24 = v23;

  swift_beginAccess();
  os_log_t v25 = *v7;
  char v26 = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v7 = v25;
  if ((v26 & 1) == 0)
  {
    os_log_t v25 = sub_21C56837C(0, *((void *)v25 + 2) + 1, 1, v25);
    *uint64_t v7 = v25;
  }
  unint64_t v28 = *((void *)v25 + 2);
  unint64_t v27 = *((void *)v25 + 3);
  if (v28 >= v27 >> 1)
  {
    os_log_t v25 = sub_21C56837C((char *)(v27 > 1), v28 + 1, 1, v25);
    *uint64_t v7 = v25;
  }
  *((void *)v25 + 2) = v28 + 1;
  uint64_t v29 = &v25[16 * v28];
  *((void *)v29 + 4) = v22;
  *((void *)v29 + 5) = v24;
  swift_endAccess();
  uint64_t result = *(void **)(v2 + 48);
  if (result)
  {
    id v30 = objc_msgSend(result, sel_getCurrentCandidateAnalysisString);
    uint64_t v31 = sub_21C589C08();
    uint64_t v33 = v32;

    swift_beginAccess();
    uint64_t v34 = *v9;
    char v35 = swift_isUniquelyReferenced_nonNull_native();
    char *v9 = v34;
    if ((v35 & 1) == 0)
    {
      uint64_t v34 = sub_21C56837C(0, *((void *)v34 + 2) + 1, 1, v34);
      char *v9 = v34;
    }
    unint64_t v37 = *((void *)v34 + 2);
    unint64_t v36 = *((void *)v34 + 3);
    if (v37 >= v36 >> 1)
    {
      uint64_t v34 = sub_21C56837C((char *)(v36 > 1), v37 + 1, 1, v34);
      char *v9 = v34;
    }
    *((void *)v34 + 2) = v37 + 1;
    uint64_t v38 = &v34[16 * v37];
    *((void *)v38 + 4) = v31;
    *((void *)v38 + 5) = v33;
    return (void *)swift_endAccess();
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_21C57C990()
{
  swift_beginAccess();
  *(unsigned char *)(v0 + 16) = 0;
  uint64_t v1 = *(void **)(v0 + 48);
  *(void *)(v0 + 48) = 0;

  swift_beginAccess();
  *(void *)(v0 + 24) = 0;
  *(void *)(v0 + 32) = 0xE000000000000000;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C57C9F4()
{
  uint64_t v1 = (*((uint64_t (**)(void))*v0 + 23))();
  uint64_t v2 = v0 + 7;
  swift_beginAccess();
  if (v1 != *((void *)v0[7] + 2) - 1) {
    return 1;
  }
  uint64_t v3 = v0[6];
  if (v3 && objc_msgSend(v3, sel_moveToNextCandidate))
  {
    uint64_t result = (uint64_t)v0[6];
    if (result)
    {
      id v5 = objc_msgSend((id)result, sel_getCurrentCandidateSurface);
      uint64_t v6 = sub_21C589C08();
      uint64_t v8 = v7;

      swift_beginAccess();
      uint64_t v9 = *v2;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v2 = v9;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v9 = sub_21C56837C(0, *((void *)v9 + 2) + 1, 1, v9);
        *uint64_t v2 = v9;
      }
      unint64_t v12 = *((void *)v9 + 2);
      unint64_t v11 = *((void *)v9 + 3);
      unint64_t v13 = v12 + 1;
      if (v12 >= v11 >> 1)
      {
        v36[1] = v12 + 1;
        char v35 = sub_21C56837C((char *)(v11 > 1), v12 + 1, 1, v9);
        unint64_t v13 = v12 + 1;
        uint64_t v9 = v35;
        *uint64_t v2 = v35;
      }
      *((void *)v9 + 2) = v13;
      uint64_t v14 = &v9[16 * v12];
      *((void *)v14 + 4) = v6;
      *((void *)v14 + 5) = v8;
      swift_endAccess();
      uint64_t result = (uint64_t)v0[6];
      if (result)
      {
        id v15 = objc_msgSend((id)result, sel_getCurrentCandidateAnalysisString);
        uint64_t v16 = sub_21C589C08();
        uint64_t v18 = v17;

        id v19 = v0 + 8;
        swift_beginAccess();
        uint64_t v20 = v0[8];
        char v21 = swift_isUniquelyReferenced_nonNull_native();
        v0[8] = v20;
        if ((v21 & 1) == 0)
        {
          uint64_t v20 = sub_21C56837C(0, *((void *)v20 + 2) + 1, 1, v20);
          *id v19 = v20;
        }
        unint64_t v23 = *((void *)v20 + 2);
        unint64_t v22 = *((void *)v20 + 3);
        if (v23 >= v22 >> 1)
        {
          uint64_t v20 = sub_21C56837C((char *)(v22 > 1), v23 + 1, 1, v20);
          *id v19 = v20;
        }
        *((void *)v20 + 2) = v23 + 1;
        uint64_t v24 = &v20[16 * v23];
        *((void *)v24 + 4) = v16;
        *((void *)v24 + 5) = v18;
        swift_endAccess();
        return 1;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    uint64_t v25 = sub_21C57661C();
    swift_beginAccess();
    uint64_t v26 = sub_21C589BD8();
    uint64_t v27 = *(void *)(v26 - 8);
    MEMORY[0x270FA5388](v26, v28, v29);
    uint64_t v31 = (char *)v36 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v31, v25, v26);
    uint64_t v32 = sub_21C589BB8();
    os_log_type_t v33 = sub_21C589D68();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_21C554000, v32, v33, "Candidate Manager: no more candidates", v34, 2u);
      MEMORY[0x21D4AA0F0](v34, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v27 + 8))(v31, v26);
    return 0;
  }
  return result;
}

uint64_t sub_21C57CD80()
{
  uint64_t result = (*(uint64_t (**)(void))(*v0 + 328))();
  if (result)
  {
    uint64_t result = swift_beginAccess();
    uint64_t v2 = v0[5];
    BOOL v3 = __OFADD__(v2, 1);
    uint64_t v4 = v2 + 1;
    if (v3) {
      __break(1u);
    }
    else {
      v0[5] = v4;
    }
  }
  return result;
}

BOOL sub_21C57CE00()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))() > 0;
}

uint64_t sub_21C57CE40()
{
  uint64_t result = (*(uint64_t (**)(void))(*v0 + 344))();
  if (result)
  {
    uint64_t result = swift_beginAccess();
    uint64_t v2 = v0[5];
    BOOL v3 = __OFSUB__(v2, 1);
    uint64_t v4 = v2 - 1;
    if (v3) {
      __break(1u);
    }
    else {
      v0[5] = v4;
    }
  }
  return result;
}

uint64_t sub_21C57CEC0()
{
  id v1 = objc_msgSend(self, sel_sharedInstance);
  (*(void (**)(void))(*(void *)v0 + 376))();
  uint64_t v2 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  BOOL v3 = (void *)sub_21C589BF8();
  id v4 = objc_msgSend(v1, sel_descriptionOfWord_forLanguage_, v2, v3);

  if (!v4) {
    return 0;
  }
  uint64_t v5 = sub_21C589C08();

  return v5;
}

uint64_t sub_21C57CFC8()
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)BRLTJJapaneseProcessor), sel_init);
  (*(void (**)(void))(*(void *)v0 + 360))();
  uint64_t v2 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_spacedYomiOfWordDescription_, v2);

  uint64_t v4 = sub_21C589C08();
  unint64_t v6 = v5;

  uint64_t v7 = sub_21C57661C();
  swift_beginAccess();
  uint64_t v8 = sub_21C589BD8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10, v11);
  unint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, v7, v8);
  swift_bridgeObjectRetain_n();
  uint64_t v14 = sub_21C589BB8();
  os_log_type_t v15 = sub_21C589D68();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v22 = v8;
    uint64_t v16 = swift_slowAlloc();
    id v21 = v1;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v24 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_21C574638(v4, v6, &v24);
    sub_21C589DA8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21C554000, v14, v15, "Candidate Manager: current description = '%s'", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4AA0F0](v18, -1, -1);
    MEMORY[0x21D4AA0F0](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v22);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  }
  return v4;
}

uint64_t sub_21C57D2C0()
{
  unint64_t v1 = (*(uint64_t (**)(void))(*v0 + 184))();
  uint64_t result = swift_beginAccess();
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v3 = v0[7];
  if (v1 >= *(void *)(v3 + 16))
  {
LABEL_8:
    __break(1u);
    return result;
  }
  uint64_t v4 = v3 + 16 * v1;
  uint64_t v6 = *(void *)(v4 + 32);
  unint64_t v5 = *(void *)(v4 + 40);
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_21C57661C();
  swift_beginAccess();
  uint64_t v8 = sub_21C589BD8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10, v11);
  unint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, v7, v8);
  swift_bridgeObjectRetain_n();
  uint64_t v14 = sub_21C589BB8();
  os_log_type_t v15 = sub_21C589D68();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v21 = v6;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v23 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_21C574638(v21, v5, &v23);
    sub_21C589DA8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21C554000, v14, v15, "Candidate Manager: current candidate = '%s'", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4AA0F0](v18, -1, -1);
    id v19 = v17;
    uint64_t v6 = v21;
    MEMORY[0x21D4AA0F0](v19, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  return v6;
}

void sub_21C57D560()
{
  unint64_t v1 = (void *)v0[6];
  if (v1)
  {
    uint64_t v2 = *(void (**)(void))(*v0 + 376);
    id v3 = v1;
    v2();
    id v4 = (id)sub_21C589BF8();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_learnCandidate_, v4);
  }
}

uint64_t sub_21C57D61C()
{
  unint64_t v1 = *(void (**)(void))(*v0 + 160);
  v1();
  v1();
  uint64_t v2 = swift_bridgeObjectRelease();
  unint64_t v3 = (*(uint64_t (**)(uint64_t))(*v0 + 184))(v2);
  uint64_t result = swift_beginAccess();
  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(void *)(v0[8] + 16))
  {
    swift_bridgeObjectRetain();
    sub_21C589C58();
    swift_bridgeObjectRelease();
    unint64_t v5 = sub_21C589C88();
    uint64_t v6 = swift_bridgeObjectRelease();
    uint64_t v7 = ((uint64_t (*)(uint64_t))v1)(v6);
    unint64_t v9 = sub_21C5669DC(v5, v7, v8);
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    swift_bridgeObjectRelease();
    uint64_t v16 = MEMORY[0x21D4A95E0](v9, v11, v13, v15);
    swift_bridgeObjectRelease();
    return v16;
  }
  __break(1u);
  return result;
}

uint64_t sub_21C57D7A0()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21C57D7D8()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 73, 7);
}

uint64_t type metadata accessor for BRLTCandidateManager()
{
  return self;
}

uint64_t sub_21C57D84C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_21C589E98();
  __break(1u);
  return result;
}

uint64_t sub_21C57D940@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x150))();
  *a2 = result;
  return result;
}

uint64_t sub_21C57D9A4(id *a1, void **a2)
{
  id v2 = *a1;
  unint64_t v3 = *(uint64_t (**)(id))((*MEMORY[0x263F8EED0] & **a2) + 0x158);
  id v4 = *a1;
  return v3(v2);
}

void *sub_21C57DA14()
{
  unint64_t v1 = (void **)(v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_translator);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_21C57DA64(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_translator);
  swift_beginAccess();
  id v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_21C57DAB8())()
{
  return j_j__swift_endAccess;
}

id sub_21C57DB14()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier;
  *(void *)&v0[OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier] = 0;
  id v3 = (id *)&v0[OBJC_IVAR___BRLTJBrailleStateManagerInternal_translator];
  *(void *)&v0[OBJC_IVAR___BRLTJBrailleStateManagerInternal_translator] = 0;
  id v4 = &v0[OBJC_IVAR___BRLTJBrailleStateManagerInternal_candidateSelectionLanguage];
  *(void *)id v4 = 0;
  *((void *)v4 + 1) = 0;
  uint64_t v5 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache;
  *(void *)&v0[OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache] = 0;
  *(void *)&v0[OBJC_IVAR___BRLTJBrailleStateManagerInternal_outputMode] = 1;
  *(void *)&v0[OBJC_IVAR___BRLTJBrailleStateManagerInternal_inputMode] = 1;
  type metadata accessor for BRLTJEditableString();
  unint64_t v6 = v0;
  uint64_t v7 = sub_21C565688();
  id v8 = BRLTJEditableString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(0, 0xE000000000000000, 0, 0, 1, 0, 0, 1, 0, 0, 1, v7);
  uint64_t v9 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
  *(void *)&v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_script] = v8;
  type metadata accessor for BRLTJBrailleString();
  uint64_t v10 = sub_21C565688();
  *(void *)&v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille] = BRLTJBrailleString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(0, 0xE000000000000000, 0, 0, 1, 0, 0, 1, 0, 0, 1, v10);
  *(void *)&v0[v2] = 0;
  swift_release();
  type metadata accessor for BRLTJBrailleForScriptTranslationResult();
  swift_beginAccess();
  uint64_t v11 = *v3;
  uint64_t v12 = *(void **)&v6[v9];
  id v13 = *v3;
  *(void *)&v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult] = sub_21C57AD40(v11, v12);
  uint64_t v14 = type metadata accessor for BRLTJCandidateManager();
  id v15 = BRLTJCandidateManager.__allocating_init()();
  uint64_t v16 = &v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_candidateManager];
  *((void *)v16 + 3) = v14;
  *((void *)v16 + 4) = &protocol witness table for BRLTJCandidateManager;
  *(void *)uint64_t v16 = v15;
  uint64_t v17 = *(void **)&v1[v5];
  *(void *)&v1[v5] = 0;

  v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_isWordDescriptionActive] = 0;
  type metadata accessor for BRLTJWordDescriptionManager();
  *(void *)&v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_wordDescriptionManager] = sub_21C57598C();
  v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingAlert] = 0;
  uint64_t v18 = sub_21C565688();
  *(void *)&v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertScript] = BRLTJEditableString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(0, 0xE000000000000000, 0, 0, 1, 0, 0, 1, 0, 0, 1, v18);
  uint64_t v19 = sub_21C565688();
  *(void *)&v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertBraille] = BRLTJBrailleString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(0, 0xE000000000000000, 0, 0, 1, 0, 0, 1, 0, 0, 1, v19);
  type metadata accessor for BRLTJTextForBrailleTranslationResult();
  uint64_t v20 = *v3;
  uint64_t v21 = v20;
  *(void *)&v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_stageScriptForStageResult] = sub_21C57B354(v20, 0, 0xE000000000000000);
  v6[OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingTerminalOutput] = 0;

  v23.receiver = v6;
  v23.super_class = (Class)type metadata accessor for BRLTJBrailleStateManager();
  return objc_msgSendSuper2(&v23, sel_init);
}

id static BRLTJBrailleStateManager.manager.getter()
{
  id result = (id)qword_267C89E20;
  if (qword_267C89E20
    || (id v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BRLTJBrailleStateManager()), sel_init),
        uint64_t v2 = (void *)qword_267C89E20,
        qword_267C89E20 = (uint64_t)v1,
        v2,
        (id result = (id)qword_267C89E20) != 0))
  {
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for BRLTJBrailleStateManager()
{
  return self;
}

uint64_t sub_21C57DF3C()
{
  id v1 = v0;
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))()) {
    return 1;
  }
  id v4 = *(void **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
  uint64_t v5 = *(uint64_t (**)(void))((*v2 & *v4) + 0xF0);
  unint64_t v6 = v4;
  LOBYTE(v5) = v5();

  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v7 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
  id v8 = *(uint64_t (**)(void))((*v2 & *v7) + 0xF0);
  uint64_t v9 = v7;
  LOBYTE(v8) = v8();

  return v8 & 1;
}

void sub_21C57E054(void *a1)
{
  uint64_t v2 = v1;
  id v4 = (void *)MEMORY[0x263F8EED0];
  if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x288))())
  {
    uint64_t v5 = sub_21C57661C();
    swift_beginAccess();
    unint64_t v6 = (uint8_t *)sub_21C589BD8();
    uint64_t v7 = *((void *)v6 - 1);
    MEMORY[0x270FA5388](v6, v8, v9);
    uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint8_t *))(v7 + 16))(v11, v5, v6);
    uint64_t v12 = a1;
    id v13 = sub_21C589BB8();
    os_log_type_t v14 = sub_21C589D58();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v44 = &v42;
      uint64_t v15 = swift_slowAlloc();
      uint64_t v43 = v6;
      uint64_t v16 = (uint8_t *)v15;
      unint64_t v42 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 138412290;
      unint64_t v46 = v12;
      uint64_t v17 = v12;
      char v45 = v2;
      uint64_t v18 = v17;
      sub_21C589DA8();
      uint64_t v19 = v42;
      *unint64_t v42 = v12;

      _os_log_impl(&dword_21C554000, v13, v14, "Set alert: \"%@\"", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C89C38);
      swift_arrayDestroy();
      MEMORY[0x21D4AA0F0](v19, -1, -1);
      uint64_t v20 = v16;
      unint64_t v6 = v43;
      MEMORY[0x21D4AA0F0](v20, -1, -1);
    }
    else
    {

      id v13 = v12;
    }

    (*(void (**)(char *, uint8_t *))(v7 + 8))(v11, v6);
    sub_21C583B74(v12);
  }
  else
  {
    uint64_t v21 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
    uint64_t v22 = *(uint64_t (**)(void))((*v4 & *v21) + 0x190);
    objc_super v23 = v21;
    LOBYTE(v22) = v22();

    if ((v22 & 1) != 0 && ((*(uint64_t (**)(void))((*v4 & *v2) + 0x220))() & 1) == 0)
    {
      uint64_t v24 = sub_21C57661C();
      swift_beginAccess();
      uint64_t v25 = sub_21C589BD8();
      uint64_t v26 = *(void *)(v25 - 8);
      MEMORY[0x270FA5388](v25, v27, v28);
      uint64_t v30 = (char *)&v42 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v30, v24, v25);
      uint64_t v31 = a1;
      uint64_t v32 = sub_21C589BB8();
      os_log_type_t v33 = sub_21C589D58();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v44 = &v42;
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        unint64_t v42 = (void *)swift_slowAlloc();
        uint64_t v43 = v34;
        *(_DWORD *)uint64_t v34 = 138412290;
        unint64_t v46 = v31;
        char v35 = v31;
        char v45 = v2;
        unint64_t v36 = v35;
        sub_21C589DA8();
        unint64_t v37 = v42;
        *unint64_t v42 = v31;

        uint64_t v2 = v45;
        os_log_type_t v38 = v33;
        uint64_t v39 = v43;
        _os_log_impl(&dword_21C554000, v32, v38, "Set script: \"%@\"", v43, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267C89C38);
        swift_arrayDestroy();
        MEMORY[0x21D4AA0F0](v37, -1, -1);
        MEMORY[0x21D4AA0F0](v39, -1, -1);
      }
      else
      {

        uint64_t v32 = v31;
      }

      (*(void (**)(char *, uint64_t))(v26 + 8))(v30, v25);
      id v40 = *(void **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
      *(void *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script) = v31;
      unint64_t v41 = v31;

      sub_21C5859DC();
    }
  }
}

void sub_21C57E5FC(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = (void *)MEMORY[0x263F8EED0];
  if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x2F0))())
  {
    sub_21C584EF0();
    return;
  }
  (*(void (**)(void *__return_ptr))((*v4 & *v1) + 0x208))(v148);
  uint64_t v5 = v149;
  uint64_t v6 = v150;
  __swift_project_boxed_opaque_existential_0(v148, v149);
  char v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 16))(v5, v6);
  uint64_t v8 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v148);
  if (v7)
  {
    if (!a1 || a1 == 8)
    {
      uint64_t v85 = sub_21C57661C();
      swift_beginAccess();
      uint64_t v86 = sub_21C589BD8();
      uint64_t v87 = *(void *)(v86 - 8);
      MEMORY[0x270FA5388](v86, v88, v89);
      uint64_t v91 = (char *)&v146 - ((v90 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t))(v87 + 16))(v91, v85, v86);
      uint64_t v92 = sub_21C589BB8();
      os_log_type_t v93 = sub_21C589D58();
      if (os_log_type_enabled(v92, v93))
      {
        unint64_t v94 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v94 = 0;
        _os_log_impl(&dword_21C554000, v92, v93, "Insert: candidate on; dot-4 pressed", v94, 2u);
        MEMORY[0x21D4AA0F0](v94, -1, -1);
      }

      uint64_t v95 = (*(uint64_t (**)(char *, uint64_t))(v87 + 8))(v91, v86);
      (*(void (**)(uint64_t))((*v4 & *v2) + 0x260))(v95);
    }
    else if (a1 == 1)
    {
      uint64_t v9 = sub_21C57661C();
      swift_beginAccess();
      uint64_t v10 = sub_21C589BD8();
      uint64_t v11 = *(void *)(v10 - 8);
      MEMORY[0x270FA5388](v10, v12, v13);
      uint64_t v15 = (char *)&v146 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v15, v9, v10);
      uint64_t v16 = sub_21C589BB8();
      os_log_type_t v17 = sub_21C589D58();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_21C554000, v16, v17, "Insert: candidate on; dot-1 pressed", v18, 2u);
        MEMORY[0x21D4AA0F0](v18, -1, -1);
      }

      uint64_t v19 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v15, v10);
      (*(void (**)(uint64_t))((*v4 & *v2) + 0x268))(v19);
    }
    else
    {
      uint64_t v113 = sub_21C57661C();
      swift_beginAccess();
      uint64_t v114 = sub_21C589BD8();
      uint64_t v115 = *(void *)(v114 - 8);
      MEMORY[0x270FA5388](v114, v116, v117);
      v119 = (char *)&v146 - ((v118 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t))(v115 + 16))(v119, v113, v114);
      uint64_t v120 = sub_21C589BB8();
      os_log_type_t v121 = sub_21C589D58();
      if (os_log_type_enabled(v120, v121))
      {
        v122 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v122 = 0;
        _os_log_impl(&dword_21C554000, v120, v121, "Insert: candidate on; invalid input", v122, 2u);
        MEMORY[0x21D4AA0F0](v122, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v115 + 8))(v119, v114);
    }
    return;
  }
  unint64_t v20 = 0x267C89000;
  if (((*(uint64_t (**)(uint64_t))((*v4 & *v2) + 0x180))(v8) & 1) == 0)
  {
    uint64_t v21 = sub_21C57661C();
    swift_beginAccess();
    uint64_t v22 = sub_21C589BD8();
    uint64_t v23 = *(void *)(v22 - 8);
    MEMORY[0x270FA5388](v22, v24, v25);
    uint64_t v27 = (char *)&v146 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v27, v21, v22);
    uint64_t v28 = sub_21C589BB8();
    os_log_type_t v29 = sub_21C589D58();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_21C554000, v28, v29, "Insert: not editing - created empty script/braille", v30, 2u);
      uint64_t v31 = v30;
      unint64_t v20 = 0x267C89000uLL;
      MEMORY[0x21D4AA0F0](v31, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v23 + 8))(v27, v22);
    type metadata accessor for BRLTJEditableString();
    uint64_t v32 = BRLTJEditableString.__allocating_init(string:cursor:focus:)(0, 0xE000000000000000, 0, 0, 0, 1);
    os_log_type_t v33 = *(void **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
    *(void *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script) = v32;

    type metadata accessor for BRLTJBrailleString();
    uint64_t v34 = BRLTJEditableString.__allocating_init(string:cursor:focus:)(0, 0xE000000000000000, 0, 0, 0, 1);
    uint64_t v35 = *(void *)(v20 + 3112);
    unint64_t v36 = *(void **)((char *)v2 + v35);
    *(void *)((char *)v2 + v35) = v34;
  }
  unint64_t v37 = 0x267C89000;
  if (a1) {
    goto LABEL_17;
  }
  uint64_t v96 = *(void *)(v20 + 3112);
  uint64_t v97 = *(void **)((char *)v2 + v96);
  uint64_t v98 = *(uint64_t (**)(void))((*v4 & *v97) + 0x190);
  uint64_t v99 = v97;
  LOBYTE(v98) = v98();

  if (v98 & 1) != 0 || (sub_21C585780())
  {
    uint64_t v100 = *(void **)((char *)v2 + v96);
    uint64_t v101 = *(uint64_t (**)(void))((*v4 & *v100) + 0x190);
    uint64_t v102 = v100;
    LOBYTE(v101) = v101();

    if (v101)
    {
      uint64_t v103 = sub_21C57661C();
      swift_beginAccess();
      uint64_t v104 = sub_21C589BD8();
      uint64_t v105 = *(void *)(v104 - 8);
      MEMORY[0x270FA5388](v104, v106, v107);
      v109 = (char *)&v146 - ((v108 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t))(v105 + 16))(v109, v103, v104);
      uint64_t v110 = sub_21C589BB8();
      os_log_type_t v111 = sub_21C589D58();
      if (os_log_type_enabled(v110, v111))
      {
        uint64_t v112 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v112 = 0;
        _os_log_impl(&dword_21C554000, v110, v111, "Insert: space while stage empty", v112, 2u);
        MEMORY[0x21D4AA0F0](v112, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v105 + 8))(v109, v104);
      sub_21C580AA4();
      goto LABEL_33;
    }
LABEL_17:
    uint64_t v38 = sub_21C57661C();
    swift_beginAccess();
    uint64_t v39 = sub_21C589BD8();
    uint64_t v146 = (uint64_t)&v146;
    uint64_t v40 = *(void *)(v39 - 8);
    MEMORY[0x270FA5388](v39, v41, v42);
    uint64_t v44 = (char *)&v146 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v44, v38, v39);
    char v45 = sub_21C589BB8();
    os_log_type_t v46 = sub_21C589D58();
    if (os_log_type_enabled(v45, v46))
    {
      unint64_t v47 = v20;
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v48 = 134217984;
      id v4 = (void *)MEMORY[0x263F8EED0];
      uint64_t v147 = a1;
      sub_21C589DA8();
      _os_log_impl(&dword_21C554000, v45, v46, "Insert: braille char %ld", v48, 0xCu);
      uint64_t v49 = v48;
      unint64_t v20 = v47;
      unint64_t v37 = 0x267C89000;
      MEMORY[0x21D4AA0F0](v49, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v40 + 8))(v44, v39);
    uint64_t v50 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
    uint64_t v51 = *(void **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
    uint64_t v52 = *(uint64_t (**)(void *))((*v4 & *v51) + 0x90);
    uint64_t v53 = v51;
    uint64_t v54 = v52(v53);
    uint64_t v56 = v55;
    char v58 = v57;

    if ((v58 & 1) == 0 && v54 != v56)
    {
      uint64_t v61 = *(void **)((char *)v2 + v50);
      uint64_t v62 = *(uint64_t (**)(void *))((*v4 & *v61) + 0x78);
      uint64_t v63 = v61;
      uint64_t v64 = v62(v63);
      uint64_t v66 = v65;

      long long v67 = *(void **)((char *)v2 + v50);
      uint64_t v68 = v4;
      uint64_t v69 = *(uint64_t (**)(void *))((*v4 & *v67) + 0x138);
      uint64_t v70 = v67;
      char v71 = v69(v70);

      if (v71)
      {
        uint64_t v72 = *(void *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
        if (v72)
        {
          uint64_t v73 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v72 + 112);
          swift_retain();
          v73(v64, v66, v54, v56);
          swift_release();
        }
      }
      swift_bridgeObjectRelease();
      id v4 = v68;
      unint64_t v20 = 0x267C89000uLL;
      unint64_t v37 = 0x267C89000uLL;
    }
    uint64_t v74 = 10240;
    unint64_t v75 = a1 + 10240;
    if (__OFADD__(a1, 10240))
    {
      __break(1u);
    }
    else
    {
      uint64_t v74 = HIDWORD(v75);
      if (!HIDWORD(v75))
      {
        uint64_t v74 = v75 >> 11;
        if (v74 == 27)
        {
LABEL_61:
          __break(1u);
          goto LABEL_62;
        }
        unsigned int v59 = WORD1(v75);
        if (WORD1(v75) <= 0x10u)
        {
          uint64_t v74 = *(void *)((char *)v2 + *(void *)(v20 + 3112));
          if ((v75 & 0xFFFFFF80) == 0)
          {
            if (v75 <= 0xFF)
            {
              unsigned int v76 = (a1 + 1);
LABEL_32:
              unsigned int v77 = __clz(v76);
              uint64_t v78 = 4 - (v77 >> 3);
              uint64_t v147 = (v76 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (v77 >> 3)) & 7)));
              uint64_t v79 = (id)v74;
              uint64_t v80 = MEMORY[0x21D4A9600](&v147, v78);
              (*(void (**)(uint64_t))((*v4 & *v79) + 0x128))(v80);

              swift_bridgeObjectRelease();
LABEL_33:
              uint64_t v81 = *(void *)((char *)v2 + *(void *)(v37 + 3136));
              if (v81)
              {
                uint64_t v82 = *(void **)((char *)v2 + *(void *)(v20 + 3112));
                uint64_t v83 = *(void (**)(id))(*(void *)v81 + 96);
                swift_retain();
                id v84 = v82;
                v83(v84);
                swift_release();
              }
              return;
            }
            __break(1u);
            goto LABEL_61;
          }
LABEL_58:
          int v60 = (a1 & 0x3F) << 8;
          if (v75 < 0x800)
          {
            unsigned int v76 = (v60 | (v75 >> 6)) + 33217;
            goto LABEL_32;
          }
LABEL_62:
          unsigned int v145 = (v60 | (v75 >> 6) & 0x3F) << 8;
          if (v59) {
            unsigned int v76 = (((v145 | (v75 >> 12) & 0x3F) << 8) | (v75 >> 18)) - 2122219023;
          }
          else {
            unsigned int v76 = (v145 | (v75 >> 12)) + 8487393;
          }
          goto LABEL_32;
        }
LABEL_57:
        __break(1u);
        goto LABEL_58;
      }
    }
    __break(1u);
    goto LABEL_57;
  }
  (*(void (**)(void))((*v4 & *v2) + 0x1E8))();
  if (v123)
  {
    swift_bridgeObjectRelease();
    uint64_t v124 = sub_21C57661C();
    swift_beginAccess();
    uint64_t v125 = sub_21C589BD8();
    uint64_t v126 = *(void *)(v125 - 8);
    MEMORY[0x270FA5388](v125, v127, v128);
    v130 = (char *)&v146 - ((v129 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v126 + 16))(v130, v124, v125);
    uint64_t v131 = sub_21C589BB8();
    os_log_type_t v132 = sub_21C589D58();
    if (os_log_type_enabled(v131, v132))
    {
      v133 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v133 = 0;
      _os_log_impl(&dword_21C554000, v131, v132, "Insert: candidate off; turn on candidate mode", v133, 2u);
      MEMORY[0x21D4AA0F0](v133, -1, -1);
    }

    uint64_t v134 = (*(uint64_t (**)(char *, uint64_t))(v126 + 8))(v130, v125);
    (*(void (**)(uint64_t))((*v4 & *v2) + 0x258))(v134);
  }
  else
  {
    uint64_t v135 = sub_21C57661C();
    swift_beginAccess();
    uint64_t v136 = sub_21C589BD8();
    uint64_t v137 = *(void *)(v136 - 8);
    MEMORY[0x270FA5388](v136, v138, v139);
    v141 = (char *)&v146 - ((v140 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v137 + 16))(v141, v135, v136);
    v142 = sub_21C589BB8();
    os_log_type_t v143 = sub_21C589D58();
    if (os_log_type_enabled(v142, v143))
    {
      v144 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v144 = 0;
      _os_log_impl(&dword_21C554000, v142, v143, "Insert: commit stage to script", v144, 2u);
      MEMORY[0x21D4AA0F0](v144, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v137 + 8))(v141, v136);
    sub_21C580CCC();
    sub_21C580AA4();
  }
}

uint64_t sub_21C57F788()
{
  id v1 = v0;
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))())
  {
    (*(void (**)(void *__return_ptr))((*v2 & *v0) + 0x208))(v91);
    uint64_t v3 = v92;
    uint64_t v4 = v93;
    __swift_project_boxed_opaque_existential_0(v91, v92);
    char v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v3, v4);
    uint64_t v6 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v91);
    if (v5)
    {
      sub_21C582F24();
      char v7 = 1;
    }
    else if ((*(uint64_t (**)(uint64_t))((*v2 & *v1) + 0x2F0))(v6))
    {
      sub_21C584EF0();
      char v7 = 1;
    }
    else
    {
      uint64_t v18 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
      uint64_t v19 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
      unint64_t v20 = *(uint64_t (**)(void))((*v2 & *v19) + 0x190);
      uint64_t v21 = v19;
      LOBYTE(v20) = v20();

      uint64_t v22 = sub_21C57661C();
      if (v20)
      {
        swift_beginAccess();
        uint64_t v23 = sub_21C589BD8();
        uint64_t v24 = *(void *)(v23 - 8);
        MEMORY[0x270FA5388](v23, v25, v26);
        uint64_t v28 = (char *)&v82 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v28, v22, v23);
        os_log_type_t v29 = sub_21C589BB8();
        os_log_type_t v30 = sub_21C589D58();
        if (os_log_type_enabled(v29, v30))
        {
          uint64_t v31 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v31 = 0;
          _os_log_impl(&dword_21C554000, v29, v30, "Delete: stage empty", v31, 2u);
          MEMORY[0x21D4AA0F0](v31, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v24 + 8))(v28, v23);
        uint64_t v32 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
        os_log_type_t v33 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
        uint64_t v34 = *(uint64_t (**)(void))((*v2 & *v33) + 0x78);
        uint64_t v35 = v33;
        uint64_t v36 = v34();
        uint64_t v38 = v37;

        uint64_t v39 = *(void **)((char *)v1 + v32);
        uint64_t v40 = *(uint64_t (**)(void))((*v2 & *v39) + 0x130);
        uint64_t v41 = v39;
        uint64_t v42 = v40();
        uint64_t v44 = v43;
        LOBYTE(v40) = v45;

        os_log_type_t v46 = *(void **)((char *)v1 + v32);
        unint64_t v47 = *(uint64_t (**)(void))((*v2 & *v46) + 0x138);
        uint64_t v48 = v46;
        char v7 = v47();

        if ((v40 & 1) == 0)
        {
          uint64_t v49 = *(void *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
          if (v49)
          {
            uint64_t v50 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v49 + 112);
            swift_retain();
            v50(v36, v38, v42, v44);
            swift_release();
          }
        }
        swift_bridgeObjectRelease();
        sub_21C5859DC();
      }
      else
      {
        swift_beginAccess();
        uint64_t v51 = sub_21C589BD8();
        uint64_t v52 = *(void *)(v51 - 8);
        MEMORY[0x270FA5388](v51, v53, v54);
        uint64_t v56 = (char *)&v82 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v56, v22, v51);
        uint64_t v88 = v1;
        char v57 = sub_21C589BB8();
        os_log_type_t v58 = sub_21C589D58();
        if (os_log_type_enabled(v57, v58))
        {
          unsigned int v59 = (uint8_t *)swift_slowAlloc();
          uint64_t v60 = swift_slowAlloc();
          uint64_t v84 = v60;
          uint64_t v85 = v51;
          uint64_t v86 = &v82;
          *(_DWORD *)unsigned int v59 = 136315138;
          uint64_t v90 = v60;
          uint64_t v82 = v59 + 4;
          uint64_t v83 = v59;
          uint64_t v61 = *(void **)((char *)v1 + v18);
          uint64_t v62 = *v2 & *v61;
          uint64_t v87 = v18;
          uint64_t v63 = *(uint64_t (**)(void *))(v62 + 408);
          uint64_t v64 = v61;
          uint64_t v65 = v63(v64);
          unint64_t v67 = v66;

          uint64_t v68 = v65;
          uint64_t v18 = v87;
          uint64_t v89 = sub_21C574638(v68, v67, &v90);
          sub_21C589DA8();
          uint64_t v69 = v88;

          swift_bridgeObjectRelease();
          os_log_type_t v70 = v58;
          char v71 = v83;
          _os_log_impl(&dword_21C554000, v57, v70, "Delete: stage nonempty: %s", v83, 0xCu);
          uint64_t v72 = v84;
          swift_arrayDestroy();
          MEMORY[0x21D4AA0F0](v72, -1, -1);
          MEMORY[0x21D4AA0F0](v71, -1, -1);

          uint64_t v73 = v69;
          (*(void (**)(char *, uint64_t))(v52 + 8))(v56, v85);
        }
        else
        {

          uint64_t v73 = v88;
          (*(void (**)(char *, uint64_t))(v52 + 8))(v56, v51);
        }
        uint64_t v74 = *(void **)((char *)v1 + v18);
        unint64_t v75 = *(uint64_t (**)(void *))((*v2 & *v74) + 0x138);
        unsigned int v76 = v74;
        char v7 = v75(v76);

        uint64_t v77 = *(void *)&v73[OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier];
        if (v77)
        {
          uint64_t v78 = *(void **)((char *)v1 + v18);
          uint64_t v79 = *(void (**)(id))(*(void *)v77 + 96);
          swift_retain();
          id v80 = v78;
          v79(v80);
          swift_release();
        }
      }
    }
  }
  else
  {
    uint64_t v8 = sub_21C57661C();
    swift_beginAccess();
    uint64_t v9 = sub_21C589BD8();
    uint64_t v10 = *(void *)(v9 - 8);
    MEMORY[0x270FA5388](v9, v11, v12);
    uint64_t v14 = (char *)&v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v14, v8, v9);
    uint64_t v15 = sub_21C589BB8();
    os_log_type_t v16 = sub_21C589D58();
    if (os_log_type_enabled(v15, v16))
    {
      os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v17 = 0;
      _os_log_impl(&dword_21C554000, v15, v16, "Delete: ignored (not editing)", v17, 2u);
      MEMORY[0x21D4AA0F0](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
    char v7 = 0;
  }
  return v7 & 1;
}

uint64_t sub_21C58005C()
{
  id v1 = v0;
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))() & 1) == 0
    || ((*(uint64_t (**)(void))((*v2 & *v0) + 0x220))() & 1) != 0
    || ((*(uint64_t (**)(void))((*v2 & *v0) + 0x2F0))() & 1) != 0)
  {
    sub_21C584EF0();
    uint64_t v3 = sub_21C57661C();
    swift_beginAccess();
    uint64_t v4 = sub_21C589BD8();
    uint64_t v5 = *(void *)(v4 - 8);
    MEMORY[0x270FA5388](v4, v6, v7);
    uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v9, v3, v4);
    uint64_t v10 = sub_21C589BB8();
    os_log_type_t v11 = sub_21C589D58();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_21C554000, v10, v11, "Forward delete: ignored (not editing or candidate on or word description on)", v12, 2u);
      MEMORY[0x21D4AA0F0](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
    char v13 = 0;
  }
  else
  {
    uint64_t v15 = sub_21C57661C();
    swift_beginAccess();
    uint64_t v16 = sub_21C589BD8();
    uint64_t v17 = *(void *)(v16 - 8);
    MEMORY[0x270FA5388](v16, v18, v19);
    uint64_t v21 = (char *)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v21, v15, v16);
    uint64_t v22 = sub_21C589BB8();
    os_log_type_t v23 = sub_21C589D58();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_21C554000, v22, v23, "Forward delete: executed", v24, 2u);
      MEMORY[0x21D4AA0F0](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v17 + 8))(v21, v16);
    uint64_t v25 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
    uint64_t v26 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
    uint64_t v27 = *(uint64_t (**)(void))((*v2 & *v26) + 0x78);
    uint64_t v28 = v26;
    uint64_t v29 = v27();
    uint64_t v31 = v30;

    uint64_t v32 = *(void **)((char *)v1 + v25);
    os_log_type_t v33 = *(uint64_t (**)(void))((*v2 & *v32) + 0x140);
    uint64_t v34 = v32;
    uint64_t v35 = v33();
    uint64_t v37 = v36;
    char v39 = v38;

    uint64_t v40 = *(void **)((char *)v1 + v25);
    uint64_t v41 = *(uint64_t (**)(void))((*v2 & *v40) + 0x148);
    uint64_t v42 = v40;
    char v13 = v41();

    if ((v39 & 1) == 0)
    {
      uint64_t v43 = *(void *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
      if (v43)
      {
        uint64_t v44 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v43 + 112);
        swift_retain();
        v44(v29, v31, v35, v37);
        swift_release();
      }
    }
    swift_bridgeObjectRelease();
    sub_21C5859DC();
  }
  return v13 & 1;
}

void sub_21C580580()
{
  id v1 = (void *)MEMORY[0x263F8EED0];
  if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))())
  {
    sub_21C582F24();
  }
  else if ((*(uint64_t (**)(void))((*v1 & *v0) + 0x2F0))())
  {
    sub_21C584EF0();
  }
  else
  {
    uint64_t v2 = *(void **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
    uint64_t v3 = *(uint64_t (**)(void))((*v1 & *v2) + 0x190);
    uint64_t v4 = v2;
    LOBYTE(v3) = v3();

    if ((v3 & 1) == 0)
    {
      sub_21C580CCC();
    }
  }
}

uint64_t sub_21C580720()
{
  id v1 = v0;
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))())
  {
    (*(void (**)(void))((*v2 & *v0) + 0x270))();
    return 1;
  }
  if ((*(uint64_t (**)(void))((*v2 & *v0) + 0x2F0))())
  {
    sub_21C584EF0();
    return 1;
  }
  uint64_t v3 = *(void **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
  uint64_t v4 = *(uint64_t (**)(void))((*v2 & *v3) + 0x190);
  uint64_t v5 = v3;
  LOBYTE(v4) = v4();

  if ((v4 & 1) == 0)
  {
    sub_21C580CCC();
    (*(void (**)(void))((*v2 & *v1) + 0x1E8))();
    if (v6)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
  }
  return 0;
}

void sub_21C5808DC()
{
  id v1 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
  if (v2)
  {
    uint64_t v3 = swift_bridgeObjectRelease();
    if ((*(uint64_t (**)(uint64_t))((*v1 & *v0) + 0x2F0))(v3))
    {
      sub_21C584EF0();
    }
    else
    {
      sub_21C5847E4();
    }
  }
}

void sub_21C580AA4()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
  uint64_t v4 = (void *)MEMORY[0x263F8EED0];
  uint64_t v5 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0x78);
  uint64_t v6 = v3;
  uint64_t v27 = v5();
  uint64_t v8 = v7;

  uint64_t v9 = *(void **)(v1 + v2);
  uint64_t v10 = *(uint64_t (**)(void))((*v4 & *v9) + 0x120);
  os_log_type_t v11 = v9;
  uint64_t v12 = v10();
  uint64_t v14 = v13;
  char v16 = v15;

  uint64_t v17 = *(void **)(v1 + v2);
  uint64_t v18 = *(void (**)(uint64_t, unint64_t))((*v4 & *v17) + 0x128);
  uint64_t v19 = v17;
  v18(32, 0xE100000000000000);

  uint64_t v20 = *(void *)(v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
  if (v20)
  {
    uint64_t v21 = *(void **)(v1 + v2);
    uint64_t v22 = *(uint64_t (**)(void))((*v4 & *v21) + 0x78);
    swift_retain();
    os_log_type_t v23 = v21;
    uint64_t v24 = v22();
    uint64_t v26 = v25;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, unint64_t))(*(void *)v20 + 104))(v24, v26, v27, v8, v12, v14, v16 & 1, 32, 0xE100000000000000);
    swift_release();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  sub_21C5859DC();
}

void sub_21C580CCC()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
  uint64_t v3 = *(void **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
  uint64_t v4 = (void *)MEMORY[0x263F8EED0];
  uint64_t v5 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0x78);
  uint64_t v6 = v3;
  uint64_t v39 = v5();
  uint64_t v8 = v7;

  uint64_t v9 = *(void **)((char *)v1 + v2);
  uint64_t v10 = *(uint64_t (**)(void))((*v4 & *v9) + 0x90);
  os_log_type_t v11 = v9;
  uint64_t v12 = v10();
  uint64_t v37 = v13;
  uint64_t v38 = v12;
  char v15 = v14;

  type metadata accessor for BRLTJTextForBrailleTranslationResult();
  char v16 = (void *)(*(uint64_t (**)(void))((*v4 & *v1) + 0x150))();
  uint64_t v17 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
  uint64_t v18 = *(uint64_t (**)(void))((*v4 & *v17) + 0x198);
  uint64_t v19 = v17;
  uint64_t v20 = v18();
  uint64_t v22 = v21;

  uint64_t v40 = sub_21C57B354(v16, v20, v22);
  uint64_t v23 = (*(uint64_t (**)(void))((*v4 & *v40) + 0x80))();
  uint64_t v25 = v24;
  uint64_t v26 = *(void **)((char *)v1 + v2);
  uint64_t v27 = *(void (**)(uint64_t, uint64_t))((*v4 & *v26) + 0x128);
  uint64_t v28 = v26;
  v27(v23, v25);

  uint64_t v29 = *(void *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
  if (v29)
  {
    uint64_t v30 = v15 & 1;
    uint64_t v31 = *(void **)((char *)v1 + v2);
    uint64_t v32 = *(uint64_t (**)(void))((*v4 & *v31) + 0x78);
    swift_retain();
    os_log_type_t v33 = v31;
    uint64_t v34 = v32();
    uint64_t v36 = v35;

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v29 + 104))(v34, v36, v39, v8, v38, v37, v30, v23, v25);
    swift_release();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21C5859DC();
}

void sub_21C580FEC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = v3;
  uint64_t v77 = a1;
  uint64_t v7 = sub_21C57661C();
  swift_beginAccess();
  uint64_t v8 = sub_21C589BD8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10, v11);
  uint64_t v13 = (char *)&v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, v7, v8);
  char v14 = sub_21C589BB8();
  os_log_type_t v15 = sub_21C589D58();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v75 = a2;
  LODWORD(v76) = a3;
  if (v16)
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v74 = v4;
    *(_DWORD *)uint64_t v17 = 136315138;
    uint64_t v81 = v18;
    uint64_t v73 = v17 + 4;
    uint64_t v78 = v77;
    uint64_t v79 = a2;
    char v80 = a3 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C899E0);
    uint64_t v19 = sub_21C589C18();
    uint64_t v78 = sub_21C574638(v19, v20, &v81);
    uint64_t v4 = v74;
    sub_21C589DA8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21C554000, v14, v15, "Set Braille selection: \"%s\"", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4AA0F0](v18, -1, -1);
    MEMORY[0x21D4AA0F0](v17, -1, -1);
  }

  uint64_t v21 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  uint64_t v22 = (void *)MEMORY[0x263F8EED0];
  if (((*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v4) + 0x220))(v21) & 1) == 0)
  {
    uint64_t v23 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
    uint64_t v24 = *(void **)((char *)v4 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
    uint64_t v25 = *(uint64_t (**)(void))((*v22 & *v24) + 0x190);
    uint64_t v26 = v24;
    char v27 = v25();

    if ((v27 & 1) == 0)
    {
      (*(void (**)(void))((*v22 & *v4) + 0x1A8))();
      return;
    }
    if ((*(uint64_t (**)(void))((*v22 & *v4) + 0x2F0))())
    {
      sub_21C584EF0();
      return;
    }
    if (v76)
    {
      uint64_t v28 = *(void **)((char *)v4 + v23);
      uint64_t v29 = *(void (**)(void))((*v22 & *v28) + 0x118);
      uint64_t v30 = v28;
      v29();

      uint64_t v31 = *(void **)((char *)v4 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
      uint64_t v32 = *(void (**)(void))((*v22 & *v31) + 0x118);
      os_log_type_t v33 = v31;
      v32();
      goto LABEL_32;
    }
    uint64_t v76 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
    uint64_t v34 = *(void **)((char *)v4 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
    uint64_t v35 = *(uint64_t (**)(void))((*v22 & *v34) + 0x90);
    uint64_t v36 = v34;
    uint64_t v37 = v35();
    uint64_t v39 = v38;
    uint64_t v40 = v4;
    char v42 = v41;

    uint64_t v43 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult;
    uint64_t v44 = v40;
    uint64_t v78 = *(void *)((char *)v40 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult);
    uint64_t v45 = type metadata accessor for BRLTJBrailleForScriptTranslationResult();
    uint64_t v46 = v77;
    uint64_t v77 = v45;
    uint64_t v47 = BRLTJTranslationResultProtocol.sourceRangeFor(targetRange:)(v46, v75, v45, (uint64_t)&protocol witness table for BRLTJBrailleForTextTranslationResult);
    uint64_t v49 = v47;
    uint64_t v50 = v48;
    if ((v42 & 1) == 0)
    {
      BOOL v51 = v37 == v47 && v39 == v48;
      if (v51 && v47 == v48)
      {
        uint64_t v4 = v44;
        uint64_t v53 = *(void **)((char *)v44 + v76);
        uint64_t v54 = *(void (**)(void))((*v22 & *v53) + 0x78);
        uint64_t v55 = v53;
        v54();

        uint64_t v56 = sub_21C589C58();
        swift_bridgeObjectRelease();
        if (v49 >= v56)
        {
LABEL_27:
          uint64_t v50 = v49;
LABEL_31:
          uint64_t v64 = *(void **)((char *)v4 + v76);
          uint64_t v65 = *(void (**)(uint64_t, uint64_t, void))((*v22 & *v64) + 0x108);
          unint64_t v66 = v64;
          v65(v49, v50, 0);

          unint64_t v67 = *(void **)((char *)v4 + v23);
          uint64_t v78 = *(void *)((char *)v4 + v43);
          os_log_type_t v33 = v67;
          uint64_t v68 = BRLTJTranslationResultProtocol.targetRangeFor(sourceRange:)(v49, v50, v77, (uint64_t)&protocol witness table for BRLTJBrailleForTextTranslationResult);
          (*(void (**)(uint64_t))((*v22 & *v33) + 0x108))(v68);
LABEL_32:

          uint64_t v69 = *(void *)((char *)v4 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
          if (v69)
          {
            os_log_type_t v70 = *(void **)((char *)v4 + v23);
            char v71 = *(void (**)(void))(*(void *)v69 + 96);
            swift_retain();
            id v72 = v70;
            v71();
            swift_release();
          }
          return;
        }
        uint64_t v78 = *(void *)((char *)v44 + v43);
        Swift::Int v57 = BRLTJTranslationResultProtocol.targetLocationFor(sourceLocation:)(v49);
        os_log_type_t v58 = *(void **)((char *)v44 + v23);
        unsigned int v59 = *(void (**)(void))((*v22 & *v58) + 0x78);
        uint64_t v60 = v58;
        v59();

        uint64_t v61 = sub_21C589C58();
        swift_bridgeObjectRelease();
        if (v61 < v57)
        {
          __break(1u);
          return;
        }
        uint64_t v4 = &protocol witness table for BRLTJBrailleForTextTranslationResult;
        while (1)
        {
          uint64_t v78 = *(void *)((char *)v44 + v43);
          Swift::Int v62 = BRLTJTranslationResultProtocol.sourceLocationFor(targetLocation:)(v57);
          if (v49 < v62)
          {
            uint64_t v50 = v62;
            uint64_t v49 = v62;
            goto LABEL_30;
          }
          if (v61 == v57) {
            break;
          }
          if (__OFADD__(v57++, 1))
          {
            __break(1u);
            goto LABEL_27;
          }
        }
        uint64_t v50 = v49;
      }
    }
LABEL_30:
    uint64_t v4 = v44;
    goto LABEL_31;
  }
}

uint64_t sub_21C581708(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_21C57BDD8(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v2) + 0x1D0);
  return v4(v3);
}

uint64_t sub_21C581820(Swift::Int a1)
{
  v22[1] = *(void *)(v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult);
  type metadata accessor for BRLTJBrailleForScriptTranslationResult();
  Swift::Int v3 = BRLTJTranslationResultProtocol.sourceLocationFor(targetLocation:)(a1);
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
  uint64_t v5 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v4) + 0x78);
  uint64_t v6 = v4;
  uint64_t v7 = v5();
  uint64_t v9 = v8;

  uint64_t v10 = sub_21C57BE6C(v7, v9, v3);
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_21C57661C();
  swift_beginAccess();
  uint64_t v12 = sub_21C589BD8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12, v14, v15);
  uint64_t v17 = (char *)v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v17, v11, v12);
  uint64_t v18 = sub_21C589BB8();
  os_log_type_t v19 = sub_21C589D68();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 134218240;
    v22[0] = v10;
    sub_21C589DA8();
    *(_WORD *)(v20 + 12) = 2048;
    v22[0] = a1;
    sub_21C589DA8();
    _os_log_impl(&dword_21C554000, v18, v19, "Script location %ld for Braille location %ld", (uint8_t *)v20, 0x16u);
    MEMORY[0x21D4AA0F0](v20, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v12);
  return v10;
}

uint64_t sub_21C581ACC@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x1E8))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_21C581B30(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x1F0);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_21C581BB0()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_candidateSelectionLanguage);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_21C581C08(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_candidateSelectionLanguage);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_21C581C68())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21C581CC4(void **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x208))();
}

uint64_t sub_21C581D20(uint64_t a1, void **a2)
{
  sub_21C586194(a1, (uint64_t)v4);
  return (*(uint64_t (**)(unsigned char *))((*MEMORY[0x263F8EED0] & **a2) + 0x210))(v4);
}

uint64_t sub_21C581DA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_candidateManager;
  swift_beginAccess();
  return sub_21C586194(v3, a1);
}

uint64_t sub_21C581DF4(long long *a1)
{
  uint64_t v3 = v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_candidateManager;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0(v3);
  sub_21C5861F8(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_21C581E58())()
{
  return j__swift_endAccess;
}

uint64_t sub_21C581F70()
{
  (*(void (**)(void *__return_ptr))((*MEMORY[0x263F8EED0] & *v0) + 0x208))(v4);
  uint64_t v1 = v5;
  uint64_t v2 = v6;
  __swift_project_boxed_opaque_existential_0(v4, v5);
  LOBYTE(v1) = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v1 & 1;
}

void sub_21C58201C()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
  uint64_t v3 = *(void **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
  uint64_t v4 = (void *)MEMORY[0x263F8EED0];
  uint64_t v5 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0x190);
  uint64_t v6 = v3;
  LOBYTE(v5) = v5();

  if ((v5 & 1) == 0
    && ((*(uint64_t (**)(void))((*v4 & *v1) + 0x220))() & 1) == 0
    && ((*(uint64_t (**)(void))((*v4 & *v1) + 0x2F0))() & 1) == 0)
  {
    uint64_t v7 = *(void **)((char *)v1 + v2);
    uint64_t v8 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache);
    *(void *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache) = v7;
    id v9 = v7;

    type metadata accessor for BRLTJTextForBrailleTranslationResult();
    uint64_t v10 = (void *)(*(uint64_t (**)(void))((*v4 & *v1) + 0x150))();
    uint64_t v11 = *(void **)((char *)v1 + v2);
    uint64_t v12 = *(uint64_t (**)(void))((*v4 & *v11) + 0x198);
    uint64_t v13 = v11;
    uint64_t v14 = v12();
    uint64_t v16 = v15;

    id v17 = sub_21C57B354(v10, v14, v16);
    uint64_t v18 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_stageScriptForStageResult;
    os_log_type_t v19 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_stageScriptForStageResult);
    *(void *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_stageScriptForStageResult) = v17;

    uint64_t v20 = *(void **)((char *)v1 + v18);
    uint64_t v21 = *(uint64_t (**)(void))((*v4 & *v20) + 0x80);
    uint64_t v22 = v20;
    uint64_t v23 = v21();
    unint64_t v25 = v24;

    uint64_t v26 = sub_21C57661C();
    swift_beginAccess();
    uint64_t v27 = sub_21C589BD8();
    uint64_t v28 = *(void *)(v27 - 8);
    MEMORY[0x270FA5388](v27, v29, v30);
    uint64_t v32 = (char *)v43 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v32, v26, v27);
    swift_bridgeObjectRetain_n();
    os_log_type_t v33 = sub_21C589BB8();
    os_log_type_t v34 = sub_21C589D58();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = swift_slowAlloc();
      uint64_t v46 = v23;
      uint64_t v36 = (uint8_t *)v35;
      uint64_t v37 = swift_slowAlloc();
      uint64_t v45 = v43;
      uint64_t v38 = v37;
      v48[0] = v37;
      uint64_t v44 = v27;
      *(_DWORD *)uint64_t v36 = 136315138;
      v43[1] = v36 + 4;
      swift_bridgeObjectRetain();
      uint64_t v47 = sub_21C574638(v46, v25, v48);
      sub_21C589DA8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21C554000, v33, v34, "Start candidate selection with stageScript = %s", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4AA0F0](v38, -1, -1);
      uint64_t v39 = v36;
      uint64_t v23 = v46;
      MEMORY[0x21D4AA0F0](v39, -1, -1);

      uint64_t v40 = (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v32, v44);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v40 = (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v32, v27);
    }
    (*(void (**)(uint64_t *__return_ptr, uint64_t))((*v4 & *v1) + 0x208))(v48, v40);
    uint64_t v41 = v49;
    uint64_t v42 = v50;
    __swift_project_boxed_opaque_existential_0(v48, v49);
    (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v42 + 32))(v23, v25, v41, v42);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v48);
    sub_21C5830BC();
  }
}

uint64_t sub_21C582550()
{
  void (*v1)(void *__return_ptr);
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void v11[3];
  uint64_t v12;
  uint64_t v13;

  uint64_t v1 = *(void (**)(void *__return_ptr))((*MEMORY[0x263F8EED0] & *v0) + 0x208);
  v1(v11);
  uint64_t v2 = v12;
  uint64_t v3 = v13;
  __swift_project_boxed_opaque_existential_0(v11, v12);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v2, v3);
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  if (v4)
  {
    ((void (*)(void *__return_ptr, uint64_t))v1)(v11, result);
    uint64_t v6 = v12;
    uint64_t v7 = v13;
    __swift_project_boxed_opaque_existential_0(v11, v12);
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 48))(v6, v7);
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
    if (v8)
    {
      ((void (*)(void *__return_ptr, uint64_t))v1)(v11, result);
      id v9 = v12;
      uint64_t v10 = v13;
      __swift_project_boxed_opaque_existential_0(v11, v12);
      (*(void (**)(uint64_t, uint64_t))(v10 + 56))(v9, v10);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
      return sub_21C5830BC();
    }
  }
  return result;
}

uint64_t sub_21C5826F8()
{
  void (*v1)(void *__return_ptr);
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void v11[3];
  uint64_t v12;
  uint64_t v13;

  uint64_t v1 = *(void (**)(void *__return_ptr))((*MEMORY[0x263F8EED0] & *v0) + 0x208);
  v1(v11);
  uint64_t v2 = v12;
  uint64_t v3 = v13;
  __swift_project_boxed_opaque_existential_0(v11, v12);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v2, v3);
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  if (v4)
  {
    ((void (*)(void *__return_ptr, uint64_t))v1)(v11, result);
    uint64_t v6 = v12;
    uint64_t v7 = v13;
    __swift_project_boxed_opaque_existential_0(v11, v12);
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 64))(v6, v7);
    uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
    if (v8)
    {
      ((void (*)(void *__return_ptr, uint64_t))v1)(v11, result);
      id v9 = v12;
      uint64_t v10 = v13;
      __swift_project_boxed_opaque_existential_0(v11, v12);
      (*(void (**)(uint64_t, uint64_t))(v10 + 72))(v9, v10);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
      return sub_21C5830BC();
    }
  }
  return result;
}

void sub_21C5828A0()
{
  void (*v3)(void *__return_ptr);
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t (*v15)(void);
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t (*v20)(void);
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  void *v26;
  void (*v27)(uint64_t, uint64_t);
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t (*v32)(void);
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(void);
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t (*v61)(void);
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void (*v67)(uint64_t, uint64_t);
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(void *__return_ptr);
  void v77[3];
  uint64_t v78;
  uint64_t v79;

  uint64_t v1 = v0;
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = *(void (**)(void *__return_ptr))((*MEMORY[0x263F8EED0] & *v0) + 0x208);
  v3(v77);
  uint64_t v4 = v78;
  uint64_t v5 = v79;
  __swift_project_boxed_opaque_existential_0(v77, v78);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v4, v5);
  uint64_t v7 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v77);
  if (v6)
  {
    uint64_t v76 = v3;
    ((void (*)(void *__return_ptr, uint64_t))v3)(v77, v7);
    uint64_t v8 = v78;
    id v9 = v79;
    __swift_project_boxed_opaque_existential_0(v77, v78);
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 96))(v8, v9);
    uint64_t v12 = v11;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v77);
    uint64_t v13 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
    uint64_t v14 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
    uint64_t v15 = *(uint64_t (**)(void))((*v2 & *v14) + 0x78);
    uint64_t v16 = v14;
    uint64_t v74 = v15();
    uint64_t v18 = v17;

    os_log_type_t v19 = *(void **)((char *)v1 + v13);
    uint64_t v20 = *(uint64_t (**)(void))((*v2 & *v19) + 0x90);
    uint64_t v21 = v19;
    uint64_t v22 = v20();
    id v72 = v23;
    uint64_t v73 = v22;
    unint64_t v25 = v24;

    uint64_t v26 = *(void **)((char *)v1 + v13);
    uint64_t v27 = *(void (**)(uint64_t, uint64_t))((*v2 & *v26) + 0x128);
    uint64_t v28 = v26;
    v27(v10, v12);

    uint64_t v29 = v2;
    uint64_t v30 = *(void *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
    if (v30)
    {
      uint64_t v31 = *(void **)((char *)v1 + v13);
      uint64_t v32 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v31) + 0x78);
      swift_retain();
      os_log_type_t v33 = v31;
      os_log_type_t v34 = v32();
      uint64_t v36 = v35;

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))(*(void *)v30 + 104))(v34, v36, v74, v18, v73, v72, v25 & 1, v10, v12);
      swift_release();
      swift_bridgeObjectRelease();
      uint64_t v29 = (void *)MEMORY[0x263F8EED0];
    }
    uint64_t v37 = v13;
    uint64_t v38 = v29;
    swift_bridgeObjectRelease();
    uint64_t v39 = swift_bridgeObjectRelease();
    ((void (*)(void *__return_ptr, uint64_t))v76)(v77, v39);
    uint64_t v40 = v78;
    uint64_t v41 = v79;
    __swift_project_boxed_opaque_existential_0(v77, v78);
    (*(void (**)(uint64_t, uint64_t))(v41 + 104))(v40, v41);
    uint64_t v42 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v77);
    ((void (*)(void *__return_ptr, uint64_t))v76)(v77, v42);
    uint64_t v43 = v78;
    uint64_t v44 = v79;
    __swift_project_boxed_opaque_existential_0(v77, v78);
    uint64_t v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 112))(v43, v44);
    uint64_t v47 = v46;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v77);
    if (!v45 && v47 == 0xE000000000000000 || (sub_21C589EC8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v48 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache);
      *(void *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache) = 0;

      v76(v77);
      uint64_t v49 = v78;
      uint64_t v50 = v79;
      __swift_project_boxed_opaque_existential_0(v77, v78);
      (*(void (**)(uint64_t, uint64_t))(v50 + 40))(v49, v50);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v77);
      sub_21C5859DC();
    }
    else
    {
      type metadata accessor for BRLTJBrailleForTextTranslationResult();
      BOOL v51 = *(uint64_t (**)(void))((*v38 & *v1) + 0x150);
      uint64_t v52 = (void *)v51();
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_21C57A7C8(v52, v45, v47);
      uint64_t v75 = (*(uint64_t (**)(void))((*v38 & *v53) + 0x80))();
      uint64_t v55 = v54;

      type metadata accessor for BRLTJBrailleForScriptTranslationResult();
      uint64_t v56 = (void *)v51();
      Swift::Int v57 = sub_21C57AD40(v56, *(id *)((char *)v1 + v37));
      os_log_type_t v58 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult;
      unsigned int v59 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult);
      *(void *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult) = v57;

      uint64_t v60 = *(void **)((char *)v1 + v58);
      uint64_t v61 = *(uint64_t (**)(void))((*v38 & *v60) + 0xD0);
      Swift::Int v62 = v60;
      uint64_t v63 = v61();

      uint64_t v64 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache;
      uint64_t v65 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache);
      *(void *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache) = v63;

      unint64_t v66 = *(void **)((char *)v1 + v64);
      if (v66)
      {
        unint64_t v67 = *(void (**)(uint64_t, uint64_t))((*v38 & *v66) + 0x128);
        uint64_t v68 = v66;
        v67(v75, v55);

        uint64_t v69 = swift_bridgeObjectRelease();
        ((void (*)(void *__return_ptr, uint64_t))v76)(v77, v69);
        os_log_type_t v70 = v78;
        char v71 = v79;
        __swift_project_boxed_opaque_existential_0(v77, v78);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v71 + 32))(v45, v47, v70, v71);
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v77);
        sub_21C5830BC();
      }
      else
      {
        __break(1u);
      }
    }
  }
}

void sub_21C582F24()
{
  void (*v2)(void *__return_ptr);
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void (*v15)(void);
  id v16;
  void v17[3];
  uint64_t v18;
  uint64_t v19;

  uint64_t v1 = v0;
  uint64_t v2 = *(void (**)(void *__return_ptr))((*MEMORY[0x263F8EED0] & *v0) + 0x208);
  v2(v17);
  uint64_t v3 = v18;
  uint64_t v4 = v19;
  __swift_project_boxed_opaque_existential_0(v17, v18);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v3, v4);
  uint64_t v6 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  if (v5)
  {
    ((void (*)(void *__return_ptr, uint64_t))v2)(v17, v6);
    uint64_t v7 = v18;
    uint64_t v8 = v19;
    __swift_project_boxed_opaque_existential_0(v17, v18);
    (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v7, v8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
    id v9 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache);
    if (v9)
    {
      uint64_t v10 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
      uint64_t v11 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
      *(void *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille) = v9;
      uint64_t v12 = v9;

      uint64_t v13 = *(void *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
      if (v13)
      {
        uint64_t v14 = *(void **)((char *)v1 + v10);
        uint64_t v15 = *(void (**)(void))(*(void *)v13 + 96);
        swift_retain();
        uint64_t v16 = v14;
        v15();
        swift_release();
      }
    }
    else
    {
      sub_21C5859DC();
    }
  }
}

uint64_t sub_21C5830BC()
{
  void (*v6)(uint64_t *__return_ptr);
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned char *v40;
  NSObject *v41;
  NSObject *v42;
  os_log_type_t v43;
  int v44;
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  void (*v56)(void, void);
  uint64_t (*v57)(void, void);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t *__return_ptr, uint64_t);
  void *v62;
  void (*v63)(void);
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unsigned char *v75;
  NSObject *v76;
  os_log_type_t v77;
  uint8_t *v78;
  uint64_t v79;
  unsigned char v80[12];
  int v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unsigned char *v86;
  uint64_t (*v87)(void, void);
  void (*v88)(unsigned char *, uint64_t, uint64_t);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(uint64_t *__return_ptr);
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;

  uint64_t v1 = v0;
  type metadata accessor for BRLTJBrailleForTextTranslationResult();
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *(void *)v0) + 0x150);
  uint64_t v4 = (void *)v3();
  uint64_t v5 = (*v2 & *(void *)v0) + 520;
  uint64_t v6 = *(void (**)(uint64_t *__return_ptr))((*v2 & *(void *)v0) + 0x208);
  v6(&v97);
  uint64_t v7 = v99;
  uint64_t v8 = v100;
  __swift_project_boxed_opaque_existential_0(&v97, v99);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 24))(v7, v8);
  uint64_t v10 = result + 1;
  if (__OFADD__(result, 1))
  {
    __break(1u);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v97);
    uint64_t v97 = v10;
    uint64_t v11 = sub_21C589EA8();
    uint64_t v13 = sub_21C57A7C8(v4, v11, v12);
    uint64_t v14 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v13) + 0x80))();
    uint64_t v16 = v15;

    uint64_t v97 = v14;
    uint64_t v98 = v16;
    swift_bridgeObjectRetain();
    sub_21C589CA8();
    id v17 = swift_bridgeObjectRelease();
    uint64_t v18 = v5;
    uint64_t v20 = v97;
    os_log_type_t v19 = v98;
    uint64_t v21 = (void *)((uint64_t (*)(uint64_t))v3)(v17);
    uint64_t v92 = v6;
    uint64_t v93 = v18;
    v6(&v97);
    uint64_t v22 = v99;
    uint64_t v23 = v100;
    __swift_project_boxed_opaque_existential_0(&v97, v99);
    unint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 88))(v22, v23);
    uint64_t v26 = sub_21C57A7C8(v21, v24, v25);
    uint64_t v27 = __swift_destroy_boxed_opaque_existential_0((uint64_t)&v97);
    (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v26) + 0x80))(v27);

    uint64_t v97 = v20;
    uint64_t v98 = v19;
    swift_bridgeObjectRetain();
    sub_21C589CA8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21C589CA8();
    swift_bridgeObjectRelease();
    uint64_t v28 = v97;
    uint64_t v29 = v98;
    type metadata accessor for BRLTJBrailleString();
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_21C565688();
    uint64_t v84 = v28;
    uint64_t v31 = BRLTJBrailleString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(v28, v29, 0, 0, 1, 0, 0, 0, 0, 0, 1, v30);
    uint64_t v32 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
    os_log_type_t v33 = *(void **)&v1[OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille];
    *(void *)&v1[OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille] = v31;

    os_log_type_t v34 = sub_21C57661C();
    swift_beginAccess();
    uint64_t v35 = sub_21C589BD8();
    uint64_t v86 = v80;
    uint64_t v36 = *(void *)(v35 - 8);
    MEMORY[0x270FA5388](v35, v37, v38);
    uint64_t v90 = v39;
    uint64_t v91 = v34;
    uint64_t v40 = &v80[-((v39 + 15) & 0xFFFFFFFFFFFFFFF0)];
    uint64_t v88 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v36 + 16);
    uint64_t v89 = v36 + 16;
    v88(v40, v34, v35);
    uint64_t v41 = v1;
    uint64_t v87 = (uint64_t (*)(void, void))v40;
    uint64_t v42 = sub_21C589BB8();
    uint64_t v43 = sub_21C589D58();
    uint64_t v44 = v43;
    uint64_t v45 = os_log_type_enabled(v42, v43);
    uint64_t v85 = v32;
    if (v45)
    {
      uint64_t v46 = swift_slowAlloc();
      uint64_t v83 = v29;
      uint64_t v47 = v46;
      uint64_t v48 = swift_slowAlloc();
      uint64_t v82 = v35;
      uint64_t v49 = (void *)v48;
      *(_DWORD *)uint64_t v47 = 138412546;
      unint64_t v94 = v36;
      uint64_t v50 = *(Class *)((char *)&v41->isa + OBJC_IVAR___BRLTJBrailleStateManagerInternal_script);
      uint64_t v81 = v44;
      uint64_t v97 = (uint64_t)v50;
      BOOL v51 = v50;
      sub_21C589DA8();
      *uint64_t v49 = v50;

      *(_WORD *)(v47 + 12) = 2112;
      uint64_t v52 = *(void **)&v1[v32];
      uint64_t v97 = (uint64_t)v52;
      uint64_t v53 = v52;
      uint64_t v36 = v94;
      sub_21C589DA8();
      v49[1] = v52;

      _os_log_impl(&dword_21C554000, v42, (os_log_type_t)v81, "Translate: \"%@\" -> \"%@\"", (uint8_t *)v47, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C89C38);
      swift_arrayDestroy();
      uint64_t v54 = v49;
      uint64_t v35 = v82;
      MEMORY[0x21D4AA0F0](v54, -1, -1);
      uint64_t v55 = v47;
      uint64_t v29 = v83;
      MEMORY[0x21D4AA0F0](v55, -1, -1);
    }
    else
    {

      uint64_t v42 = v41;
    }

    uint64_t v56 = *(void (**)(void, void))(v36 + 8);
    Swift::Int v57 = v87;
    os_log_type_t v58 = v35;
    unint64_t v94 = v36 + 8;
    uint64_t v87 = (uint64_t (*)(void, void))v56;
    v56(v57, v35);
    unsigned int v59 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier;
    uint64_t v60 = *(uint64_t *)((char *)&v41->isa + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
    uint64_t v61 = (void (*)(uint64_t *__return_ptr, uint64_t))v92;
    if (v60)
    {
      Swift::Int v62 = *(void **)&v1[v85];
      uint64_t v63 = *(void (**)(void))(*(void *)v60 + 96);
      swift_retain();
      uint64_t v64 = v62;
      v63();
      swift_release();

      uint64_t v65 = *(uint64_t *)((char *)&v41->isa + v59);
      if (v65)
      {
        unint64_t v66 = swift_retain();
        v61(&v97, v66);
        unint64_t v67 = v99;
        uint64_t v68 = v100;
        __swift_project_boxed_opaque_existential_0(&v97, v99);
        uint64_t v69 = (*(uint64_t (**)(uint64_t, uint64_t))(v68 + 80))(v67, v68);
        (*(void (**)(uint64_t))(*(void *)v65 + 120))(v69);
        swift_bridgeObjectRelease();
        swift_release();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v97);
      }
    }
    os_log_type_t v70 = v91;
    char v71 = swift_beginAccess();
    MEMORY[0x270FA5388](v71, v72, v73);
    uint64_t v75 = &v80[-((v74 + 15) & 0xFFFFFFFFFFFFFFF0)];
    v88(v75, v70, v58);
    swift_bridgeObjectRetain();
    uint64_t v76 = sub_21C589BB8();
    uint64_t v77 = sub_21C589D58();
    if (os_log_type_enabled(v76, v77))
    {
      uint64_t v78 = (uint8_t *)swift_slowAlloc();
      uint64_t v79 = swift_slowAlloc();
      uint64_t v96 = v79;
      *(_DWORD *)uint64_t v78 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v95 = sub_21C574638(v84, v29, &v96);
      sub_21C589DA8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21C554000, v76, v77, "Show current candidate description: %s", v78, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x21D4AA0F0](v79, -1, -1);
      MEMORY[0x21D4AA0F0](v78, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return v87(v75, v58);
  }
  return result;
}

uint64_t sub_21C583970()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingAlert);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21C583A04(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingAlert);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t sub_21C583A50@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x288))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21C583AB8(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a2) + 0x290))(*a1);
}

uint64_t (*sub_21C583B18())()
{
  return j_j__swift_endAccess;
}

void sub_21C583B74(void *a1)
{
  uint64_t v2 = v1;
  id v4 = objc_msgSend(objc_allocWithZone((Class)BRLTJJapaneseProcessor), sel_init);
  uint64_t v5 = (void *)MEMORY[0x263F8EED0];
  uint64_t v6 = *(void (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0x78);
  v6();
  uint64_t v7 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  unsigned int v8 = objc_msgSend(v4, sel_isWordDescriptionLike_, v7);

  if (v8)
  {
    type metadata accessor for BRLTJEditableString();
    v6();
    id v9 = (void *)sub_21C589BF8();
    swift_bridgeObjectRelease();
    id v10 = objc_msgSend(v4, sel_spacedYomiOfWordDescription_, v9);

    uint64_t v11 = sub_21C589C08();
    uint64_t v13 = v12;

    uint64_t v14 = sub_21C565688();
    id v15 = BRLTJEditableString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(v11, v13, 0, 0, 1, 0, 0, 1, 0, 0, 1, v14);
    uint64_t v16 = *(void **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertScript);
    *(void *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertScript) = v15;
  }
  else
  {
    uint64_t v16 = *(void **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertScript);
    *(void *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertScript) = a1;
    id v17 = a1;
  }

  type metadata accessor for BRLTJBrailleForScriptTranslationResult();
  uint64_t v18 = (void *)(*(uint64_t (**)(void))((*v5 & *v2) + 0x150))();
  uint64_t v19 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertScript;
  uint64_t v20 = sub_21C57AD40(v18, *(id *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertScript));
  uint64_t v21 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult;
  uint64_t v22 = *(void **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult);
  *(void *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult) = v20;

  uint64_t v23 = *(void **)((char *)v2 + v21);
  unint64_t v24 = *(uint64_t (**)(void))((*v5 & *v23) + 0xD0);
  unint64_t v25 = v23;
  uint64_t v26 = v24();

  uint64_t v27 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertBraille;
  uint64_t v28 = *(void **)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertBraille);
  *(void *)((char *)v2 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertBraille) = v26;

  uint64_t v29 = sub_21C57661C();
  swift_beginAccess();
  uint64_t v30 = sub_21C589BD8();
  uint64_t v74 = &v72;
  uint64_t v31 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30, v32, v33);
  uint64_t v35 = (char *)&v72 - (((unint64_t)v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  uint64_t v76 = (uint64_t *)(v31 + 16);
  uint64_t v77 = v34;
  uint64_t v75 = v36;
  v36(v35, v29, v30);
  uint64_t v37 = v2;
  uint64_t v38 = sub_21C589BB8();
  os_log_type_t v39 = sub_21C589D58();
  int v73 = v39;
  BOOL v40 = os_log_type_enabled(v38, v39);
  id v80 = v4;
  uint64_t v81 = v2;
  uint64_t v82 = v27;
  uint64_t v79 = v30;
  if (v40)
  {
    uint64_t v41 = swift_slowAlloc();
    uint64_t v42 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v41 = 138412546;
    uint64_t v78 = v31;
    uint64_t v43 = v2;
    uint64_t v44 = *(void **)((char *)v2 + v19);
    uint64_t v84 = v44;
    uint64_t v72 = v29;
    id v45 = v44;
    sub_21C589DA8();
    *uint64_t v42 = v44;

    *(_WORD *)(v41 + 12) = 2112;
    uint64_t v46 = *(void **)((char *)v43 + v82);
    uint64_t v84 = v46;
    id v47 = v46;
    uint64_t v29 = v72;
    uint64_t v31 = v78;
    sub_21C589DA8();
    v42[1] = v46;

    _os_log_impl(&dword_21C554000, v38, (os_log_type_t)v73, "Translate alert: \"%@\" -> \"%@\"", (uint8_t *)v41, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C89C38);
    swift_arrayDestroy();
    uint64_t v48 = v42;
    uint64_t v30 = v79;
    MEMORY[0x21D4AA0F0](v48, -1, -1);
    MEMORY[0x21D4AA0F0](v41, -1, -1);
    uint64_t v49 = v82;
  }
  else
  {

    uint64_t v38 = v37;
    uint64_t v49 = v27;
  }

  uint64_t v52 = *(void (**)(void, void))(v31 + 8);
  uint64_t v50 = v31 + 8;
  BOOL v51 = v52;
  v52(v35, v30);
  uint64_t v53 = swift_beginAccess();
  MEMORY[0x270FA5388](v53, v54, v55);
  Swift::Int v57 = (char *)&v72 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75(v57, v29, v30);
  os_log_type_t v58 = v37;
  unsigned int v59 = sub_21C589BB8();
  os_log_type_t v60 = sub_21C589D58();
  if (os_log_type_enabled(v59, v60))
  {
    uint64_t v76 = &v72;
    uint64_t v61 = (uint8_t *)swift_slowAlloc();
    uint64_t v62 = swift_slowAlloc();
    uint64_t v78 = v50;
    uint64_t v63 = (void *)v62;
    uint64_t v77 = v51;
    *(_DWORD *)uint64_t v61 = 138412290;
    uint64_t v64 = *(void **)((char *)v81 + v49);
    uint64_t v83 = v64;
    id v65 = v64;
    BOOL v51 = v77;
    sub_21C589DA8();
    void *v63 = v64;

    _os_log_impl(&dword_21C554000, v59, v60, "Refresh Braille display with alert: %@", v61, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C89C38);
    swift_arrayDestroy();
    MEMORY[0x21D4AA0F0](v63, -1, -1);
    unint64_t v66 = v61;
    uint64_t v30 = v79;
    MEMORY[0x21D4AA0F0](v66, -1, -1);
  }
  else
  {

    unsigned int v59 = v58;
  }
  unint64_t v67 = v80;

  v51(v57, v30);
  uint64_t v68 = *(uint64_t *)((char *)&v58->isa + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
  if (v68)
  {
    uint64_t v69 = *(void **)((char *)v81 + v82);
    os_log_type_t v70 = *(void (**)(void))(*(void *)v68 + 96);
    swift_retain();
    id v71 = v69;
    v70();
    swift_release();
  }
}

uint64_t sub_21C584290()
{
  if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x288))()) {
    uint64_t v1 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertScript;
  }
  else {
    uint64_t v1 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
  }
  objc_msgSend(*(id *)((char *)v0 + v1), sel_copy);
  sub_21C589DD8();
  swift_unknownObjectRelease();
  type metadata accessor for BRLTJEditableString();
  swift_dynamicCast();
  return v3;
}

id sub_21C58439C()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x288))())
  {
    uint64_t v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_alertBraille;
  }
  else
  {
    if ((*(uint64_t (**)(void))((*v1 & *v0) + 0x348))())
    {
      uint64_t v3 = *(void **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
      id v4 = *(void (**)(void))((*v1 & *v3) + 0x78);
      uint64_t v5 = v3;
      v4();

      sub_21C589CA8();
      swift_bridgeObjectRelease();
      type metadata accessor for BRLTJBrailleString();
      swift_bridgeObjectRetain();
      sub_21C589CA8();
      swift_bridgeObjectRelease();
      uint64_t v6 = sub_21C565688();
      return BRLTJBrailleString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(0x80A0E2BFA0E2, 0xA600000000000000, 0, 0, 1, 0, 0, 1, 0, 0, 1, v6);
    }
    uint64_t v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
  }
  objc_msgSend(*(id *)((char *)v0 + v2), sel_copy);
  sub_21C589DD8();
  swift_unknownObjectRelease();
  type metadata accessor for BRLTJBrailleString();
  swift_dynamicCast();
  return (id)v8;
}

uint64_t sub_21C5845E0()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isWordDescriptionActive);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21C584674(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isWordDescriptionActive);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t sub_21C5846C0@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x2F0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21C584728(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a2) + 0x2F8))(*a1);
}

uint64_t (*sub_21C584788())()
{
  return j_j__swift_endAccess;
}

void sub_21C5847E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
  uint64_t v3 = *(void **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
  id v4 = (void *)MEMORY[0x263F8EED0];
  uint64_t v5 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0x190);
  uint64_t v6 = v3;
  LOBYTE(v5) = v5();

  if ((v5 & 1) != 0
    && ((*(uint64_t (**)(void))((*v4 & *v1) + 0x220))() & 1) == 0
    && ((*(uint64_t (**)(void))((*v4 & *v1) + 0x2F0))() & 1) == 0)
  {
    (*(void (**)(uint64_t))((*v4 & *v1) + 0x2F8))(1);
    uint64_t v7 = *(void **)((char *)v1 + v2);
    uint64_t v8 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache);
    *(void *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache) = v7;
    id v9 = v7;

    uint64_t v10 = *(void *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_wordDescriptionManager);
    uint64_t v11 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult;
    uint64_t v12 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult);
    uint64_t v13 = *(void **)((char *)v1 + v2);
    uint64_t v14 = *(uint64_t (**)(void))((*v4 & *v13) + 0x90);
    swift_retain();
    id v15 = v12;
    uint64_t v16 = v13;
    uint64_t v17 = v14();
    uint64_t v19 = v18;
    char v21 = v20;

    (*(void (**)(id, uint64_t, uint64_t, void))(*(void *)v10 + 216))(v15, v17, v19, v21 & 1);
    swift_release();

    sub_21C585078();
    uint64_t v22 = sub_21C57661C();
    swift_beginAccess();
    uint64_t v23 = sub_21C589BD8();
    uint64_t v24 = *(void *)(v23 - 8);
    MEMORY[0x270FA5388](v23, v25, v26);
    uint64_t v28 = (char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v28, v22, v23);
    uint64_t v43 = v1;
    uint64_t v29 = sub_21C589BB8();
    os_log_type_t v30 = sub_21C589D58();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v41 = v23;
      uint64_t v32 = (uint8_t *)v31;
      uint64_t v33 = swift_slowAlloc();
      uint64_t v42 = &v40;
      os_log_type_t v34 = (void *)v33;
      *(_DWORD *)uint64_t v32 = 138412290;
      BOOL v40 = v32 + 4;
      uint64_t v35 = *(void **)((char *)v1 + v11);
      uint64_t v36 = *(uint64_t (**)(void))((*v4 & *v35) + 0xB8);
      uint64_t v37 = v35;
      uint64_t v38 = v36();

      uint64_t v44 = v38;
      sub_21C589DA8();
      *os_log_type_t v34 = v38;

      _os_log_impl(&dword_21C554000, v29, v30, "Start word description with stage = %@", v32, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267C89C38);
      swift_arrayDestroy();
      MEMORY[0x21D4AA0F0](v34, -1, -1);
      os_log_type_t v39 = v32;
      uint64_t v23 = v41;
      MEMORY[0x21D4AA0F0](v39, -1, -1);
    }
    else
    {

      uint64_t v29 = v43;
    }

    (*(void (**)(char *, uint64_t))(v24 + 8))(v28, v23);
  }
}

uint64_t sub_21C584C38()
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2F0))();
  if (result)
  {
    uint64_t v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_wordDescriptionManager;
    uint64_t v3 = *(uint64_t (**)(uint64_t))(**(void **)((char *)v0
                                                         + OBJC_IVAR___BRLTJBrailleStateManagerInternal_wordDescriptionManager)
                                           + 224);
    uint64_t v4 = swift_retain();
    LOBYTE(v3) = v3(v4);
    uint64_t result = swift_release();
    if (v3)
    {
      uint64_t v5 = *(void (**)(uint64_t))(**(void **)((char *)v0 + v2) + 240);
      uint64_t v6 = swift_retain();
      v5(v6);
      swift_release();
      return sub_21C585078();
    }
  }
  return result;
}

uint64_t sub_21C584D94()
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2F0))();
  if (result)
  {
    uint64_t v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_wordDescriptionManager;
    uint64_t v3 = *(uint64_t (**)(uint64_t))(**(void **)((char *)v0
                                                         + OBJC_IVAR___BRLTJBrailleStateManagerInternal_wordDescriptionManager)
                                           + 232);
    uint64_t v4 = swift_retain();
    LOBYTE(v3) = v3(v4);
    uint64_t result = swift_release();
    if (v3)
    {
      uint64_t v5 = *(void (**)(uint64_t))(**(void **)((char *)v0 + v2) + 248);
      uint64_t v6 = swift_retain();
      v5(v6);
      swift_release();
      return sub_21C585078();
    }
  }
  return result;
}

void sub_21C584EF0()
{
  uint64_t v1 = (void *)MEMORY[0x263F8EED0];
  if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2F0))())
  {
    (*(void (**)(void))((*v1 & *v0) + 0x2F8))(0);
    uint64_t v2 = *(void **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleCache);
    if (v2)
    {
      uint64_t v3 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
      uint64_t v4 = *(void **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
      *(void *)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille) = v2;
      id v9 = v2;

      uint64_t v5 = *(void *)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
      if (v5)
      {
        uint64_t v6 = *(void **)((char *)v0 + v3);
        uint64_t v7 = *(void (**)(void))(*(void *)v5 + 96);
        swift_retain();
        id v8 = v6;
        v7();
        swift_release();
      }
    }
    else
    {
      sub_21C5859DC();
    }
  }
}

uint64_t sub_21C585078()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_wordDescriptionManager;
  uint64_t v3 = *(uint64_t (**)(uint64_t))(**(void **)((char *)v0
                                                       + OBJC_IVAR___BRLTJBrailleStateManagerInternal_wordDescriptionManager)
                                         + 264);
  uint64_t v4 = swift_retain();
  uint64_t v5 = v3(v4);
  uint64_t v7 = v6;
  swift_release();
  uint64_t v41 = v5;
  uint64_t v42 = v7;
  swift_bridgeObjectRetain();
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  type metadata accessor for BRLTJBrailleForTextTranslationResult();
  id v8 = (void *)MEMORY[0x263F8EED0];
  id v9 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
  uint64_t v10 = *(uint64_t (**)(uint64_t))(**(void **)((char *)v0 + v2) + 256);
  uint64_t v11 = swift_retain();
  uint64_t v12 = v10(v11);
  uint64_t v14 = v13;
  swift_release();
  id v15 = sub_21C57A7C8(v9, v12, v14);
  (*(void (**)(void))((*v8 & *v15) + 0x80))();

  uint64_t v41 = v5;
  uint64_t v42 = v7;
  swift_bridgeObjectRetain();
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21C589CA8();
  swift_bridgeObjectRelease();
  uint64_t v17 = v5;
  unint64_t v16 = v7;
  type metadata accessor for BRLTJBrailleString();
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_21C565688();
  id v19 = BRLTJBrailleString.__allocating_init(string:selection:focus:suggestion:tokenRanges:)(v17, v7, 0, 0, 1, 0, 0, 0, 0, 0, 1, v18);
  uint64_t v20 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
  char v21 = *(void **)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
  *(void *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille) = v19;

  uint64_t v22 = *(void *)((char *)v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
  if (v22)
  {
    uint64_t v23 = *(void **)((char *)v1 + v20);
    uint64_t v24 = *(void (**)(void))(*(void *)v22 + 96);
    swift_retain();
    id v25 = v23;
    v24();
    swift_release();
  }
  uint64_t v26 = sub_21C57661C();
  swift_beginAccess();
  uint64_t v27 = sub_21C589BD8();
  uint64_t v28 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27, v29, v30);
  uint64_t v32 = (char *)v39 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v32, v26, v27);
  swift_bridgeObjectRetain();
  uint64_t v33 = sub_21C589BB8();
  os_log_type_t v34 = sub_21C589D58();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = swift_slowAlloc();
    v39[0] = v17;
    uint64_t v36 = (uint8_t *)v35;
    uint64_t v37 = swift_slowAlloc();
    uint64_t v40 = v37;
    *(_DWORD *)uint64_t v36 = 136315138;
    swift_bridgeObjectRetain();
    v39[1] = sub_21C574638(v39[0], v16, &v40);
    sub_21C589DA8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21C554000, v33, v34, "Show current word description: %s", v36, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4AA0F0](v37, -1, -1);
    MEMORY[0x21D4AA0F0](v36, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v32, v27);
}

uint64_t sub_21C58557C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingTerminalOutput);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_21C585610(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_isShowingTerminalOutput);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t sub_21C58565C@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x348))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21C5856C4(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a2) + 0x350))(*a1);
}

uint64_t (*sub_21C585724())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_21C585780()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
  if (!v4) {
    goto LABEL_10;
  }
  if (v3 == 24938 && v4 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = sub_21C589EC8();
    swift_bridgeObjectRelease();
    char v7 = 0;
    if ((v6 & 1) == 0) {
      return v7 & 1;
    }
  }
  uint64_t v8 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
  id v9 = *(void **)((char *)v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille);
  uint64_t v10 = *(uint64_t (**)(void))((*v2 & *v9) + 0x190);
  uint64_t v11 = v9;
  LOBYTE(v10) = v10();

  if ((v10 & 1) == 0)
  {
    uint64_t v12 = *(void **)((char *)v1 + v8);
    uint64_t v13 = *(void (**)(void))((*v2 & *v12) + 0x198);
    uint64_t v14 = v12;
    v13();

    uint64_t v15 = sub_21C589CB8();
    if (v16)
    {
      uint64_t v17 = v15;
      uint64_t v18 = v16;
      char v7 = 0;
      do
      {
        if (v17 == 10920162 && v18 == 0xA300000000000000 || (sub_21C589EC8() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          char v7 = 1;
        }
        else if (v17 == 11837666 && v18 == 0xA300000000000000)
        {
          swift_bridgeObjectRelease();
          char v7 = 0;
        }
        else
        {
          char v20 = sub_21C589EC8();
          swift_bridgeObjectRelease();
          v7 &= v20 ^ 1;
        }
        uint64_t v17 = sub_21C589CB8();
        uint64_t v18 = v19;
      }
      while (v19);
    }
    else
    {
      char v7 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_10:
    char v7 = 0;
  }
  return v7 & 1;
}

void sub_21C5859DC()
{
  uint64_t v1 = v0;
  type metadata accessor for BRLTJBrailleForScriptTranslationResult();
  uint64_t v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *(void *)v0) + 0x150))();
  uint64_t v4 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_script;
  uint64_t v5 = sub_21C57AD40(v3, *(id *)&v1[OBJC_IVAR___BRLTJBrailleStateManagerInternal_script]);
  uint64_t v6 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult;
  char v7 = *(void **)&v1[OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult];
  *(void *)&v1[OBJC_IVAR___BRLTJBrailleStateManagerInternal_brailleForScriptTranslationResult] = v5;

  uint64_t v8 = *(void **)&v1[v6];
  id v9 = *(uint64_t (**)(void))((*v2 & *v8) + 0xD0);
  uint64_t v10 = v8;
  uint64_t v11 = v9();

  uint64_t v12 = OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille;
  uint64_t v13 = *(void **)&v1[OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille];
  *(void *)&v1[OBJC_IVAR___BRLTJBrailleStateManagerInternal_braille] = v11;

  uint64_t v14 = sub_21C57661C();
  swift_beginAccess();
  uint64_t v15 = sub_21C589BD8();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15, v17, v18);
  char v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v20, v14, v15);
  char v21 = v1;
  uint64_t v22 = sub_21C589BB8();
  os_log_type_t v23 = sub_21C589D58();
  int v24 = v23;
  BOOL v25 = os_log_type_enabled(v22, v23);
  uint64_t v44 = v12;
  if (v25)
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v42 = v16;
    uint64_t v27 = v26;
    uint64_t v28 = swift_slowAlloc();
    int v40 = v24;
    uint64_t v29 = (void *)v28;
    *(_DWORD *)uint64_t v27 = 138412546;
    uint64_t v41 = v20;
    uint64_t v30 = *(void **)&v1[v4];
    id v45 = v30;
    uint64_t v43 = v15;
    id v31 = v30;
    sub_21C589DA8();
    *uint64_t v29 = v30;

    *(_WORD *)(v27 + 12) = 2112;
    uint64_t v32 = *(void **)&v1[v12];
    id v45 = v32;
    id v33 = v32;
    uint64_t v15 = v43;
    sub_21C589DA8();
    v29[1] = v32;
    char v20 = v41;

    _os_log_impl(&dword_21C554000, v22, (os_log_type_t)v40, "Translate: \"%@\" -> \"%@\"", (uint8_t *)v27, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C89C38);
    swift_arrayDestroy();
    MEMORY[0x21D4AA0F0](v29, -1, -1);
    uint64_t v34 = v27;
    uint64_t v16 = v42;
    MEMORY[0x21D4AA0F0](v34, -1, -1);
  }
  else
  {

    uint64_t v22 = v21;
  }

  (*(void (**)(char *, uint64_t))(v16 + 8))(v20, v15);
  uint64_t v35 = *(uint64_t *)((char *)&v21->isa + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier);
  if (v35)
  {
    uint64_t v36 = *(void **)&v1[v44];
    uint64_t v37 = *(void (**)(void))(*(void *)v35 + 96);
    swift_retain();
    id v38 = v36;
    v37();
    swift_release();
  }
}

id BRLTJBrailleStateManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BRLTJBrailleStateManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t BRLTJBrailleStateManager.setDelegate(_:)()
{
  type metadata accessor for BRLTJStateNotifier();
  uint64_t v1 = swift_unknownObjectRetain();
  *(void *)(v0 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_notifier) = sub_21C586C8C(v1);
  return swift_release();
}

uint64_t BRLTJBrailleStateManager.setTranslationDelegate(_:outputMode:inputMode:candidateSelectionLanguage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  type metadata accessor for BRLTJTranslator();
  id v12 = sub_21C57A344((uint64_t)objc_msgSend(objc_allocWithZone((Class)BRLTJTranslatorWrapper), sel_initWithTranslationDelegate_outputMode_inputMode_, a1, a2, a3));
  uint64_t v13 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(id))((*MEMORY[0x263F8EED0] & *v6) + 0x158))(v12);
  *(void *)((char *)v6 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_outputMode) = a2;
  *(void *)((char *)v6 + OBJC_IVAR___BRLTJBrailleStateManagerInternal_inputMode) = a3;
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t))((*v13 & *v6) + 0x1F0);
  swift_bridgeObjectRetain();
  return v15(a4, a5);
}

uint64_t sub_21C586194(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21C5861F8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t method lookup function for BRLTJBrailleStateManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BRLTJBrailleStateManager);
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.translator.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.translator.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.translator.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isEditing.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.setScript(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.insertBrailleChar(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.delete()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.forwardDelete()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.escapeCommand()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.returnCommand()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.wordDescriptionCommand()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.setBrailleSelection(_:)(uint64_t a1, uint64_t a2, char a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))((*MEMORY[0x263F8EED0] & *v3) + 0x1D0))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.setBrailleSelection(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.scriptLocationForBrailleLocation(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.candidateSelectionLanguage.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.candidateSelectionLanguage.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.candidateSelectionLanguage.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.candidateManager.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.candidateManager.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.candidateManager.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isCandidateSelectionActive.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.startCandidateSelection()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x258))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.showNextCandidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x260))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.showPreviousCandidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x268))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.selectCandidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x270))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isShowingAlert.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x288))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isShowingAlert.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x290))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isShowingAlert.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x298))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.displayedScript.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2E0))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.displayedBraille.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2E8))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isWordDescriptionActive.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2F0))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isWordDescriptionActive.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2F8))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isWordDescriptionActive.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x300))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.showNextWordDescription()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x328))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.showPreviousWordDescription()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x330))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isShowingTerminalOutput.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x348))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isShowingTerminalOutput.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x350))();
}

uint64_t dispatch thunk of BRLTJBrailleStateManager.isShowingTerminalOutput.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x358))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.stageScript.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.isActive.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.currentIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.activate(stageScript:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.deactivate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.hasNext.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.moveToNext()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.hasPrevious.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.moveToPrevious()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.currentRawDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.currentDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.currentCandidate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.learnCurrentCandidate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of BRLTJCandidateManagerProtocol.stageRemainder.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

void type metadata accessor for BRLTTranslationMode()
{
  if (!qword_267C89CB0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267C89CB0);
    }
  }
}

uint64_t sub_21C586C84()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_21C586C8C(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t sub_21C586CC0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

void sub_21C586CCC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21C57661C();
  swift_beginAccess();
  uint64_t v5 = sub_21C589BD8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7, v8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v10, v4, v5);
  uint64_t v11 = a1;
  id v12 = sub_21C589BB8();
  os_log_type_t v13 = sub_21C589D68();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v32 = v2;
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v30 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 138412290;
    id v33 = v11;
    uint64_t v15 = v11;
    uint64_t v31 = v5;
    id v16 = v15;
    uint64_t v2 = v32;
    sub_21C589DA8();
    uint64_t v17 = v30;
    *uint64_t v30 = v11;

    uint64_t v5 = v31;
    _os_log_impl(&dword_21C554000, v12, v13, "Refresh Braille display: %@", v14, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C89C38);
    swift_arrayDestroy();
    MEMORY[0x21D4AA0F0](v17, -1, -1);
    MEMORY[0x21D4AA0F0](v14, -1, -1);
  }
  else
  {
  }
  uint64_t v18 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  uint64_t v19 = *(void **)(v2 + 16);
  char v20 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v11) + 0x1D0))(v18);
  id v21 = objc_allocWithZone((Class)BRLTBrailleString);
  uint64_t v22 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  id v23 = objc_msgSend(v21, sel_initWithUnicode_, v22);

  uint64_t v24 = (*(uint64_t (**)(void))((*v20 & *v11) + 0x90))();
  uint64_t v27 = sub_21C57BDA4(v24, v26, v25 & 1);
  objc_msgSend(v19, sel_brailleDisplayStringDidChange_brailleSelection_modifiers_, v23, v27, v28, 0);
}

void sub_21C586FF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, unint64_t a9)
{
  uint64_t v10 = v9;
  uint64_t v52 = a1;
  uint64_t v53 = a2;
  uint64_t v58 = a3;
  uint64_t v59 = a4;
  int v60 = a7 & 1;
  uint64_t v14 = sub_21C57BED0(a3, a4, a5, a6, v60);
  uint64_t v17 = sub_21C57BDA4(v14, v16, v15 & 1);
  uint64_t v19 = v18;
  uint64_t v20 = sub_21C57661C();
  swift_beginAccess();
  uint64_t v21 = sub_21C589BD8();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21, v23, v21);
  char v25 = (char *)&v49 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = *(void (**)(char *, uint64_t))(v22 + 16);
  uint64_t v57 = v27;
  v26(v25, v20);
  swift_bridgeObjectRetain_n();
  uint64_t v28 = sub_21C589BB8();
  os_log_type_t v29 = sub_21C589D68();
  int v54 = v29;
  BOOL v30 = os_log_type_enabled(v28, v29);
  uint64_t v55 = a5;
  if (v30)
  {
    uint64_t v56 = v17;
    BOOL v31 = v60 != 0;
    uint64_t v32 = swift_slowAlloc();
    uint64_t v50 = v10;
    uint64_t v33 = v32;
    uint64_t v49 = swift_slowAlloc();
    uint64_t v64 = v49;
    *(_DWORD *)uint64_t v33 = 136315650;
    uint64_t v51 = a8;
    uint64_t v61 = a5;
    uint64_t v62 = a6;
    BOOL v63 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267C899E0);
    uint64_t v34 = sub_21C589C18();
    uint64_t v61 = sub_21C574638(v34, v35, &v64);
    sub_21C589DA8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2080;
    uint64_t v36 = sub_21C589D88();
    uint64_t v61 = sub_21C574638(v36, v37, &v64);
    sub_21C589DA8();
    uint64_t v38 = v51;
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_21C574638(v38, a9, &v64);
    uint64_t v17 = v56;
    sub_21C589DA8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21C554000, v28, (os_log_type_t)v54, "Notify script replacement: range = %s, translated range = %s string = \"%s\"", (uint8_t *)v33, 0x20u);
    uint64_t v39 = v49;
    swift_arrayDestroy();
    MEMORY[0x21D4AA0F0](v39, -1, -1);
    uint64_t v40 = v33;
    uint64_t v10 = v50;
    MEMORY[0x21D4AA0F0](v40, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v57);
  uint64_t v41 = sub_21C589C58();
  if (v60)
  {
    uint64_t v42 = v41;
LABEL_8:
    uint64_t v44 = *(void **)(v10 + 16);
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_21C589B88();
    id v46 = objc_allocWithZone((Class)BRLTScriptString);
    id v47 = (void *)sub_21C589BF8();
    swift_bridgeObjectRelease();
    id v48 = objc_msgSend(v46, sel_initWithString_selection_, v47, v45, 0);

    objc_msgSend(v44, sel_replaceScriptStringRange_withScriptString_cursorLocation_, v17, v19, v48, v42);
    return;
  }
  uint64_t v43 = sub_21C589C58();
  if (!__OFADD__(v55, v43))
  {
    uint64_t v42 = sub_21C57BE6C(v52, v53, v55 + v43);
    goto LABEL_8;
  }
  __break(1u);
}

void sub_21C5873FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = sub_21C57BE6C(a1, a2, a4);
  uint64_t v10 = sub_21C57BE6C(a1, a2, a3);
  uint64_t v11 = a4 - a3;
  if (__OFSUB__(a4, a3))
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v12 = v10;
  uint64_t v13 = v9 - v11;
  if (__OFSUB__(v9, v11))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v9 < v13)
  {
LABEL_9:
    __break(1u);
    return;
  }
  uint64_t v14 = sub_21C57BDA4(v13, v9, 0);
  uint64_t v16 = v15;
  uint64_t v17 = *(void **)(v4 + 16);
  id v18 = objc_msgSend(objc_allocWithZone((Class)BRLTScriptString), sel_init);
  objc_msgSend(v17, sel_replaceScriptStringRange_withScriptString_cursorLocation_, v14, v16, v18, v12);
}

void sub_21C5874EC()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = (void *)sub_21C589BF8();
  id v3 = (id)sub_21C589BF8();
  objc_msgSend(v1, sel_requestSpeech_language_, v2, v3);
}

uint64_t sub_21C58756C()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_21C58758C()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for BRLTJStateNotifier()
{
  return self;
}

uint64_t sub_21C5875E8()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager__stageScript);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21C587624@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xE8))();
  *a2 = result;
  return result;
}

uint64_t sub_21C587680(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void *)(*a2 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_currentIndex);
  uint64_t result = swift_beginAccess();
  *id v3 = v2;
  return result;
}

uint64_t sub_21C5876D0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_currentIndex;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_21C587718(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_currentIndex);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

id BRLTJCandidateManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id BRLTJCandidateManager.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra;
  *(void *)&v0[OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra] = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager__stageScript];
  *(void *)uint64_t v2 = 0;
  *((void *)v2 + 1) = 0xE000000000000000;
  id v3 = *(void **)&v0[v1];
  *(void *)&v0[v1] = 0;
  uint64_t v4 = v0;

  uint64_t v5 = MEMORY[0x263F8EE78];
  *(void *)&v4[OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_candidateList] = MEMORY[0x263F8EE78];
  *(void *)&v4[OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_analysisStringList] = v5;
  *(void *)&v4[OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_currentIndex] = 0;
  v4[OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager__isActive] = 0;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for BRLTJCandidateManager();
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t type metadata accessor for BRLTJCandidateManager()
{
  return self;
}

uint64_t sub_21C587894()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager__isActive);
}

void *sub_21C5878A4(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(v2 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager__isActive) = 1;
  id v5 = objc_msgSend(objc_allocWithZone((Class)BRLTJMecabraWrapper), sel_init);
  uint64_t v6 = OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra;
  objc_super v7 = *(void **)(v2 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra);
  *(void *)(v2 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra) = v5;

  uint64_t v8 = (char **)(v2 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_candidateList);
  swift_beginAccess();
  uint64_t v9 = (char *)MEMORY[0x263F8EE78];
  *uint64_t v8 = (char *)MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  uint64_t v10 = (char **)(v2 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_analysisStringList);
  swift_beginAccess();
  *uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)(v2 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_currentIndex);
  swift_beginAccess();
  *uint64_t v11 = 0;
  uint64_t v12 = (void *)(v2 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager__stageScript);
  void *v12 = a1;
  v12[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (sub_21C589C58() < 33)
  {
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  else
  {
    sub_21C589C88();
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_21C589CE8();
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    swift_bridgeObjectRelease();
    MEMORY[0x21D4A95E0](v13, v15, v17, v19);
    uint64_t result = (void *)swift_bridgeObjectRelease();
  }
  uint64_t v21 = *(void **)(v2 + v6);
  if (!v21)
  {
    __break(1u);
    goto LABEL_29;
  }
  id v22 = v21;
  uint64_t v23 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_analyzeString_, v23);

  uint64_t result = *(void **)(v2 + v6);
  if (!result)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (!objc_msgSend(result, sel_moveToNextCandidate))
  {
    swift_beginAccess();
    uint64_t v42 = *v8;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v8 = v42;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v42 = sub_21C56837C(0, *((void *)v42 + 2) + 1, 1, v42);
      *uint64_t v8 = v42;
    }
    unint64_t v45 = *((void *)v42 + 2);
    unint64_t v44 = *((void *)v42 + 3);
    if (v45 >= v44 >> 1)
    {
      uint64_t v42 = sub_21C56837C((char *)(v44 > 1), v45 + 1, 1, v42);
      *uint64_t v8 = v42;
    }
    *((void *)v42 + 2) = v45 + 1;
    id v46 = &v42[16 * v45];
    *((void *)v46 + 4) = 0;
    *((void *)v46 + 5) = 0xE000000000000000;
    swift_endAccess();
    swift_beginAccess();
    id v47 = *v10;
    swift_bridgeObjectRetain();
    char v48 = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v10 = v47;
    if ((v48 & 1) == 0)
    {
      id v47 = sub_21C56837C(0, *((void *)v47 + 2) + 1, 1, v47);
      *uint64_t v10 = v47;
    }
    unint64_t v50 = *((void *)v47 + 2);
    unint64_t v49 = *((void *)v47 + 3);
    if (v50 >= v49 >> 1)
    {
      id v47 = sub_21C56837C((char *)(v49 > 1), v50 + 1, 1, v47);
      *uint64_t v10 = v47;
    }
    *((void *)v47 + 2) = v50 + 1;
    uint64_t v51 = &v47[16 * v50];
    *((void *)v51 + 4) = a1;
    *((void *)v51 + 5) = a2;
    return (void *)swift_endAccess();
  }
  uint64_t result = *(void **)(v2 + v6);
  if (!result) {
    goto LABEL_30;
  }
  id v24 = objc_msgSend(result, sel_getCurrentCandidateSurface);
  uint64_t v25 = sub_21C589C08();
  uint64_t v27 = v26;

  swift_beginAccess();
  uint64_t v28 = *v8;
  char v29 = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v8 = v28;
  if ((v29 & 1) == 0)
  {
    uint64_t v28 = sub_21C56837C(0, *((void *)v28 + 2) + 1, 1, v28);
    *uint64_t v8 = v28;
  }
  unint64_t v31 = *((void *)v28 + 2);
  unint64_t v30 = *((void *)v28 + 3);
  if (v31 >= v30 >> 1)
  {
    uint64_t v28 = sub_21C56837C((char *)(v30 > 1), v31 + 1, 1, v28);
    *uint64_t v8 = v28;
  }
  *((void *)v28 + 2) = v31 + 1;
  uint64_t v32 = &v28[16 * v31];
  *((void *)v32 + 4) = v25;
  *((void *)v32 + 5) = v27;
  swift_endAccess();
  uint64_t result = *(void **)(v2 + v6);
  if (result)
  {
    id v33 = objc_msgSend(result, sel_getCurrentCandidateAnalysisString);
    uint64_t v34 = sub_21C589C08();
    uint64_t v36 = v35;

    swift_beginAccess();
    unint64_t v37 = *v10;
    char v38 = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v10 = v37;
    if ((v38 & 1) == 0)
    {
      unint64_t v37 = sub_21C56837C(0, *((void *)v37 + 2) + 1, 1, v37);
      *uint64_t v10 = v37;
    }
    unint64_t v40 = *((void *)v37 + 2);
    unint64_t v39 = *((void *)v37 + 3);
    if (v40 >= v39 >> 1)
    {
      unint64_t v37 = sub_21C56837C((char *)(v39 > 1), v40 + 1, 1, v37);
      *uint64_t v10 = v37;
    }
    *((void *)v37 + 2) = v40 + 1;
    uint64_t v41 = &v37[16 * v40];
    *((void *)v41 + 4) = v34;
    *((void *)v41 + 5) = v36;
    return (void *)swift_endAccess();
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_21C587D90()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager__isActive) = 0;
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra);
  *(void *)(v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra) = 0;

  uint64_t v2 = (void *)(v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager__stageScript);
  *uint64_t v2 = 0;
  v2[1] = 0xE000000000000000;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C587DEC()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t sub_21C587E20()
{
  uint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
  uint64_t v2 = (char **)((char *)v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_candidateList);
  swift_beginAccess();
  if (v1 != *((void *)*v2 + 2) - 1) {
    return 1;
  }
  uint64_t v3 = OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra;
  uint64_t v4 = *(void **)((char *)v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra);
  if (v4 && objc_msgSend(v4, sel_moveToNextCandidate))
  {
    uint64_t result = *(void *)((char *)v0 + v3);
    if (result)
    {
      id v6 = objc_msgSend((id)result, sel_getCurrentCandidateSurface);
      uint64_t v7 = sub_21C589C08();
      uint64_t v9 = v8;

      swift_beginAccess();
      uint64_t v10 = *v2;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v2 = v10;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v10 = sub_21C56837C(0, *((void *)v10 + 2) + 1, 1, v10);
        *uint64_t v2 = v10;
      }
      unint64_t v13 = *((void *)v10 + 2);
      unint64_t v12 = *((void *)v10 + 3);
      unint64_t v14 = v13 + 1;
      if (v13 >= v12 >> 1)
      {
        v37[1] = v13 + 1;
        uint64_t v36 = sub_21C56837C((char *)(v12 > 1), v13 + 1, 1, v10);
        unint64_t v14 = v13 + 1;
        uint64_t v10 = v36;
        *uint64_t v2 = v36;
      }
      *((void *)v10 + 2) = v14;
      uint64_t v15 = &v10[16 * v13];
      *((void *)v15 + 4) = v7;
      *((void *)v15 + 5) = v9;
      swift_endAccess();
      uint64_t result = *(void *)((char *)v0 + v3);
      if (result)
      {
        id v16 = objc_msgSend((id)result, sel_getCurrentCandidateAnalysisString);
        uint64_t v17 = sub_21C589C08();
        uint64_t v19 = v18;

        uint64_t v20 = (char **)((char *)v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_analysisStringList);
        swift_beginAccess();
        uint64_t v21 = *v20;
        char v22 = swift_isUniquelyReferenced_nonNull_native();
        void *v20 = v21;
        if ((v22 & 1) == 0)
        {
          uint64_t v21 = sub_21C56837C(0, *((void *)v21 + 2) + 1, 1, v21);
          void *v20 = v21;
        }
        unint64_t v24 = *((void *)v21 + 2);
        unint64_t v23 = *((void *)v21 + 3);
        if (v24 >= v23 >> 1)
        {
          uint64_t v21 = sub_21C56837C((char *)(v23 > 1), v24 + 1, 1, v21);
          void *v20 = v21;
        }
        *((void *)v21 + 2) = v24 + 1;
        uint64_t v25 = &v21[16 * v24];
        *((void *)v25 + 4) = v17;
        *((void *)v25 + 5) = v19;
        swift_endAccess();
        return 1;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    uint64_t v26 = sub_21C57661C();
    swift_beginAccess();
    uint64_t v27 = sub_21C589BD8();
    uint64_t v28 = *(void *)(v27 - 8);
    MEMORY[0x270FA5388](v27, v29, v30);
    uint64_t v32 = (char *)v37 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v32, v26, v27);
    id v33 = sub_21C589BB8();
    os_log_type_t v34 = sub_21C589D68();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v35 = 0;
      _os_log_impl(&dword_21C554000, v33, v34, "Candidate Manager: no more candidates", v35, 2u);
      MEMORY[0x21D4AA0F0](v35, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v28 + 8))(v32, v27);
    return 0;
  }
  return result;
}

uint64_t sub_21C5881D4()
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
  if (result)
  {
    uint64_t v2 = (void *)((char *)v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_currentIndex);
    uint64_t result = swift_beginAccess();
    if (__OFADD__(*v2, 1)) {
      __break(1u);
    }
    else {
      ++*v2;
    }
  }
  return result;
}

BOOL sub_21C58826C()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))() > 0;
}

uint64_t sub_21C5882BC()
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
  if (result)
  {
    uint64_t v2 = (void *)((char *)v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_currentIndex);
    uint64_t result = swift_beginAccess();
    if (__OFSUB__(*v2, 1)) {
      __break(1u);
    }
    else {
      --*v2;
    }
  }
  return result;
}

uint64_t sub_21C588354()
{
  id v1 = objc_msgSend(self, sel_sharedInstance);
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
  uint64_t v2 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_21C589BF8();
  id v4 = objc_msgSend(v1, sel_descriptionOfWord_forLanguage_, v2, v3);

  if (!v4) {
    return 0;
  }
  uint64_t v5 = sub_21C589C08();

  return v5;
}

uint64_t sub_21C58846C()
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)BRLTJJapaneseProcessor), sel_init);
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
  uint64_t v2 = (void *)sub_21C589BF8();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_spacedYomiOfWordDescription_, v2);

  uint64_t v4 = sub_21C589C08();
  unint64_t v6 = v5;

  uint64_t v7 = sub_21C57661C();
  swift_beginAccess();
  uint64_t v8 = sub_21C589BD8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10, v11);
  unint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, v7, v8);
  swift_bridgeObjectRetain_n();
  unint64_t v14 = sub_21C589BB8();
  os_log_type_t v15 = sub_21C589D68();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v22 = v8;
    uint64_t v16 = swift_slowAlloc();
    id v21 = v1;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v24 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_21C574638(v4, v6, &v24);
    sub_21C589DA8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21C554000, v14, v15, "Candidate Manager: current description = '%s'", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4AA0F0](v18, -1, -1);
    MEMORY[0x21D4AA0F0](v17, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v22);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  }
  return v4;
}

uint64_t sub_21C588774()
{
  unint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
  uint64_t v2 = (char *)v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_candidateList;
  uint64_t result = swift_beginAccess();
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v1 >= *(void *)(*(void *)v2 + 16))
  {
LABEL_8:
    __break(1u);
    return result;
  }
  uint64_t v4 = *(void *)v2 + 16 * v1;
  uint64_t v6 = *(void *)(v4 + 32);
  unint64_t v5 = *(void *)(v4 + 40);
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_21C57661C();
  swift_beginAccess();
  uint64_t v8 = sub_21C589BD8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10, v11);
  unint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, v7, v8);
  swift_bridgeObjectRetain_n();
  unint64_t v14 = sub_21C589BB8();
  os_log_type_t v15 = sub_21C589D68();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v21 = v6;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v23 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_21C574638(v21, v5, &v23);
    sub_21C589DA8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21C554000, v14, v15, "Candidate Manager: current candidate = '%s'", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x21D4AA0F0](v18, -1, -1);
    uint64_t v19 = v17;
    uint64_t v6 = v21;
    MEMORY[0x21D4AA0F0](v19, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  return v6;
}

void sub_21C588A30()
{
  unint64_t v1 = *(void **)((char *)v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_mecabra);
  if (v1)
  {
    uint64_t v2 = *(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168);
    id v3 = v1;
    v2();
    id v4 = (id)sub_21C589BF8();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_learnCandidate_, v4);
  }
}

uint64_t sub_21C588B04()
{
  unint64_t v1 = (void *)MEMORY[0x263F8EED0];
  uint64_t v2 = *(void (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98);
  v2();
  v2();
  uint64_t v3 = swift_bridgeObjectRelease();
  unint64_t v4 = (*(uint64_t (**)(uint64_t))((*v1 & *v0) + 0xE8))(v3);
  unint64_t v5 = (char *)v0 + OBJC_IVAR____TtC18BrailleTranslation21BRLTJCandidateManager_analysisStringList;
  uint64_t result = swift_beginAccess();
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v4 < *(void *)(*(void *)v5 + 16))
  {
    swift_bridgeObjectRetain();
    sub_21C589C58();
    swift_bridgeObjectRelease();
    unint64_t v7 = sub_21C589C88();
    uint64_t v8 = swift_bridgeObjectRelease();
    uint64_t v9 = ((uint64_t (*)(uint64_t))v2)(v8);
    unint64_t v11 = sub_21C5669DC(v7, v9, v10);
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    swift_bridgeObjectRelease();
    uint64_t v18 = MEMORY[0x21D4A95E0](v11, v13, v15, v17);
    swift_bridgeObjectRelease();
    return v18;
  }
  __break(1u);
  return result;
}

id BRLTJCandidateManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BRLTJCandidateManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21C588D50()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x98))();
}

uint64_t sub_21C588DA4()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x118))() & 1;
}

uint64_t sub_21C588E04()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0xE8))();
}

uint64_t sub_21C588E58()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x120))();
}

uint64_t sub_21C588EB4()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x128))();
}

uint64_t sub_21C588F10()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x138))() & 1;
}

uint64_t sub_21C588F70()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x140))();
}

uint64_t sub_21C588FCC()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x148))() & 1;
}

uint64_t sub_21C58902C()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x150))();
}

uint64_t sub_21C589088()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x158))();
}

uint64_t sub_21C5890E4()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x160))();
}

uint64_t sub_21C589140()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x168))();
}

uint64_t sub_21C58919C()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x170))();
}

uint64_t sub_21C5891F8()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **v0) + 0x180))();
}

uint64_t method lookup function for BRLTJCandidateManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BRLTJCandidateManager);
}

uint64_t dispatch thunk of BRLTJCandidateManager.stageScript.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.currentIndex.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.isActive.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.activate(stageScript:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.deactivate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.hasNext.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.moveToNext()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.hasPrevious.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.moveToPrevious()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.currentRawDescription.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.currentDescription.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.currentCandidate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.learnCurrentCandidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of BRLTJCandidateManager.stageRemainder.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

void BRLTTranslatorClassIsValid_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C554000, a2, OS_LOG_TYPE_ERROR, "%@ doesn't conform to BRLTTranslatorProtocol", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_21C589B88()
{
  return MEMORY[0x270EEDAD0]();
}

uint64_t sub_21C589B98()
{
  return MEMORY[0x270EEE0A0]();
}

uint64_t sub_21C589BA8()
{
  return MEMORY[0x270EEE250]();
}

uint64_t sub_21C589BB8()
{
  return MEMORY[0x270FA2DF8]();
}

uint64_t sub_21C589BC8()
{
  return MEMORY[0x270FA2E10]();
}

uint64_t sub_21C589BD8()
{
  return MEMORY[0x270FA2E28]();
}

uint64_t sub_21C589BE8()
{
  return MEMORY[0x270EF1848]();
}

uint64_t sub_21C589BF8()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_21C589C08()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_21C589C18()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_21C589C28()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_21C589C38()
{
  return MEMORY[0x270F9D660]();
}

uint64_t sub_21C589C48()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_21C589C58()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_21C589C68()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_21C589C78()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_21C589C88()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_21C589C98()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_21C589CA8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21C589CB8()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_21C589CC8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21C589CD8()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_21C589CE8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_21C589CF8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_21C589D08()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_21C589D18()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_21C589D28()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21C589D38()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_21C589D48()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_21C589D58()
{
  return MEMORY[0x270FA2E48]();
}

uint64_t sub_21C589D68()
{
  return MEMORY[0x270FA2E50]();
}

uint64_t sub_21C589D78()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_21C589D88()
{
  return MEMORY[0x270EF21E0]();
}

uint64_t sub_21C589D98()
{
  return MEMORY[0x270F9E500]();
}

uint64_t sub_21C589DA8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21C589DB8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21C589DC8()
{
  return MEMORY[0x270EF2480]();
}

uint64_t sub_21C589DD8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_21C589DE8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_21C589DF8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_21C589E08()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_21C589E18()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_21C589E28()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21C589E38()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21C589E48()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_21C589E58()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21C589E68()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_21C589E78()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21C589E88()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21C589E98()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21C589EA8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_21C589EB8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_21C589EC8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t AXBrailleTablesDirectory()
{
  return MEMORY[0x270F09158]();
}

uint64_t BRLLogTranslation()
{
  return MEMORY[0x270F09580]();
}

uint64_t CEMCreateEmojiLocaleData()
{
  return MEMORY[0x270F18BE0]();
}

uint64_t CEMEmojiTokenCopyName()
{
  return MEMORY[0x270F18C20]();
}

uint64_t CEMEnumerateEmojiTokensInStringWithLocaleAndBlock()
{
  return MEMORY[0x270F18C50]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4AD0](locale, key);
}

void CFRelease(CFTypeRef cf)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x270EE5278](tokenizer);
}

CFTypeRef CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizerRef tokenizer, CFOptionFlags attribute)
{
  return (CFTypeRef)MEMORY[0x270EE5288](tokenizer, attribute);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x270EE5290](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x270EE52A0](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

uint64_t MecabraAnalyzeStringWithContext()
{
  return MEMORY[0x270F99CE8]();
}

uint64_t MecabraCandidateGetAnalysisString()
{
  return MEMORY[0x270F99D00]();
}

uint64_t MecabraCandidateGetSurface()
{
  return MEMORY[0x270F99D18]();
}

uint64_t MecabraContextAddInlineCandidate()
{
  return MEMORY[0x270F99D88]();
}

uint64_t MecabraContextCreateMutable()
{
  return MEMORY[0x270F99D90]();
}

uint64_t MecabraContextRelease()
{
  return MEMORY[0x270F99D98]();
}

uint64_t MecabraCreateWithOptions()
{
  return MEMORY[0x270F99DE8]();
}

uint64_t MecabraGetNextCandidate()
{
  return MEMORY[0x270F99E00]();
}

uint64_t MecabraRelease()
{
  return MEMORY[0x270F99E40]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFStringTokenizerGetCurrentTokenPartOfSpeech()
{
  return MEMORY[0x270EE5708]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void free(void *a1)
{
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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