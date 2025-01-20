id PostalAddressByAddingCountry(void *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void v8[5];

  v1 = a1;
  v2 = [a1 ISOCountryCode];
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334E0] + 16))()) {
    v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFEA78], "sharedDefaults"), "countryCode");
  }
  v3 = (void *)[MEMORY[0x263EFEB38] supportedCountries];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __PostalAddressByAddingCountry_block_invoke;
  v8[3] = &unk_264CEEE50;
  v8[4] = v2;
  v4 = objc_msgSend(v3, "_cn_firstObjectPassingTest:", v8);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (id)[v1 mutableCopy];
    objc_msgSend(v6, "setCountry:", objc_msgSend(v5, "name"));
    return (id)[v6 copy];
  }
  return v1;
}

uint64_t __PostalAddressByAddingCountry_block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 isoCountryCode];

  return [v2 isEqual:v3];
}

uint64_t StringByRemovingConsecutiveNewLines(void *a1)
{
  v1 = objc_msgSend((id)objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x263F08708], "newlineCharacterSet")), "_cn_filter:", &__block_literal_global);

  return [v1 componentsJoinedByString:@"\n"];
}

uint64_t __StringByRemovingConsecutiveNewLines_block_invoke()
{
  return (*(unsigned int (**)(void))(*MEMORY[0x263F334E0] + 16))() ^ 1;
}

NSString *__cdecl ABCreateStringWithAddressDictionary(NSDictionary *address, BOOL addCountryName)
{
  if (address)
  {
    BOOL v3 = addCountryName;
    v5 = [(NSDictionary *)address objectForKeyedSubscript:@"ABFormattedAddress"];
    if (!v5)
    {
      id v6 = (id)[MEMORY[0x263EFEB30] postalAddressWithAddressBookDictionaryRepresentation:address];
      if ((*(unsigned int (**)(void, uint64_t))(*MEMORY[0x263F334E0] + 16))(*MEMORY[0x263F334E0], [v6 country]))
      {
        BOOL v7 = !v3;
      }
      else
      {
        BOOL v7 = 1;
      }
      if (!v7) {
        id v6 = PostalAddressByAddingCountry(v6);
      }
      v8 = (void *)[MEMORY[0x263EFEB38] stringFromPostalAddress:v6 style:0];
      v9 = objc_msgSend(v8, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet"));
      v5 = (__CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x263F08708], "newlineCharacterSet")), "_cn_filter:", &__block_literal_global), "componentsJoinedByString:", @"\n");
    }
  }
  else
  {
    v5 = &stru_26EAA1368;
  }
  return (NSString *)v5;
}

uint64_t ABAddressBookUIBundle()
{
  if (ABAddressBookUIBundle_onceToken != -1) {
    dispatch_once(&ABAddressBookUIBundle_onceToken, &__block_literal_global_2);
  }
  return ABAddressBookUIBundle___bundle;
}

id __ABAddressBookUIBundle_block_invoke()
{
  id result = (id)[MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AddressBookUI"];
  ABAddressBookUIBundle___bundle = (uint64_t)result;
  return result;
}

uint64_t ABAddressBookBundle()
{
  if (ABAddressBookBundle_onceToken != -1) {
    dispatch_once(&ABAddressBookBundle_onceToken, &__block_literal_global_3);
  }
  return ABAddressBookBundle___bundle;
}

id __ABAddressBookBundle_block_invoke()
{
  id result = (id)[MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AddressBook"];
  ABAddressBookBundle___bundle = (uint64_t)result;
  return result;
}

uint64_t ABUIOldAppsUseModernUI()
{
  if (ABUIOldAppsUseModernUI_onceToken != -1) {
    dispatch_once(&ABUIOldAppsUseModernUI_onceToken, &__block_literal_global_8);
  }
  if (ABUIOldAppsUseModernUI_enabled) {
    return 1;
  }

  return dyld_program_sdk_at_least();
}

uint64_t __ABUIOldAppsUseModernUI_block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"ABOldAppsUseModernUI", (CFStringRef)*MEMORY[0x263EFFE48], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = result == 0;
  }
  else {
    BOOL v1 = 1;
  }
  char v2 = !v1;
  ABUIOldAppsUseModernUI_enabled = v2;
  return result;
}

uint64_t ABUIAppIsOldFMF()
{
  v0 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "infoDictionary"), "valueForKey:", @"CFBundleNumericVersion");
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", @"com.apple.mobileme.fmf1");
  if (result) {
    return [v0 integerValue] == 0;
  }
  return result;
}

uint64_t ABUIShouldUseLegacyUI()
{
  if (!ABUIOldAppsUseModernUI()) {
    return 1;
  }

  return ABUIAppIsOldFMF();
}

uint64_t ABAddressBookSetAutorotationEnabled(uint64_t result)
{
  _ABGloballyAllowAutorotation = result;
  return result;
}

uint64_t ABAddressBookShouldAllowAutorotation()
{
  LODWORD(result) = dyld_program_sdk_at_least();
  if (_ABGloballyAllowAutorotation) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t ABAddressBookGetDefaultRotationContentSettings(uint64_t result)
{
  *(_WORD *)uint64_t result = 257;
  *(unsigned char *)(result + 2) = 1;
  *(void *)(result + 8) = 0x4038000000000000;
  return result;
}

void ABUIRoundToViewScale(void *a1)
{
  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v1 == 0.0 && RoundToScale_onceToken != -1) {
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_43);
  }
}

double ABUIPixelAlignedPoint(void *a1, double a2)
{
  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v4 == 0.0)
  {
    if (RoundToScale_onceToken != -1) {
      dispatch_once(&RoundToScale_onceToken, &__block_literal_global_43);
    }
    double v4 = *(double *)&RoundToScale___s;
  }
  BOOL v5 = v4 == 1.0;
  double v6 = round(a2 * v4) / v4;
  double v7 = round(a2);
  if (v5) {
    double v8 = v7;
  }
  else {
    double v8 = v6;
  }
  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v9 == 0.0 && RoundToScale_onceToken != -1) {
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_43);
  }
  return v8;
}

double ABUIPixelAlignedSize(void *a1, double a2)
{
  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v4 == 0.0)
  {
    if (RoundToScale_onceToken != -1) {
      dispatch_once(&RoundToScale_onceToken, &__block_literal_global_43);
    }
    double v4 = *(double *)&RoundToScale___s;
  }
  BOOL v5 = v4 == 1.0;
  double v6 = round(a2 * v4) / v4;
  double v7 = round(a2);
  if (v5) {
    double v8 = v7;
  }
  else {
    double v8 = v6;
  }
  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v9 == 0.0 && RoundToScale_onceToken != -1) {
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_43);
  }
  return v8;
}

double ABUIPixelAlignedRect(void *a1, double a2)
{
  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v4 == 0.0)
  {
    if (RoundToScale_onceToken != -1) {
      dispatch_once(&RoundToScale_onceToken, &__block_literal_global_43);
    }
    double v4 = *(double *)&RoundToScale___s;
  }
  if (v4 == 1.0) {
    double v5 = round(a2);
  }
  else {
    double v5 = round(a2 * v4) / v4;
  }
  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v6 == 0.0 && RoundToScale_onceToken != -1) {
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_43);
  }
  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v7 == 0.0 && RoundToScale_onceToken != -1) {
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_43);
  }
  objc_msgSend((id)objc_msgSend(a1, "_screen"), "scale");
  if (v8 == 0.0 && RoundToScale_onceToken != -1) {
    dispatch_once(&RoundToScale_onceToken, &__block_literal_global_43);
  }
  return v5;
}

uint64_t ABUISetUseSiriLocalization(uint64_t result)
{
  _useSiriLocalization = result;
  return result;
}

BOOL ABUIShouldUseSiriLocalization()
{
  if (_useSiriLocalization)
  {
    [MEMORY[0x263F086E0] mainBundle];
    if (objc_opt_respondsToSelector()) {
      return _useSiriLocalization != 0;
    }
    NSLog(&cfstr_YouTriedToUseS.isa);
  }
  return 0;
}

BOOL ABUIIsContacts()
{
  int v0 = ABUIIsContacts_isContacts;
  if (ABUIIsContacts_isContacts == -1)
  {
    int v0 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", @"com.apple.MobileAddressBook");
    ABUIIsContacts_isContacts = v0;
  }
  return v0 != 0;
}

BOOL ABUIIsMobilePhone()
{
  int v0 = ABUIIsMobilePhone_isMobilePhone;
  if (ABUIIsMobilePhone_isMobilePhone == -1)
  {
    int v0 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", @"com.apple.mobilephone");
    ABUIIsMobilePhone_isMobilePhone = v0;
  }
  return v0 != 0;
}

BOOL ABUIIsFaceTime()
{
  int v0 = ABUIIsFaceTime_isFaceTime;
  if (ABUIIsFaceTime_isFaceTime == -1)
  {
    int v0 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", @"com.apple.facetime");
    ABUIIsFaceTime_isFaceTime = v0;
  }
  return v0 != 0;
}

BOOL ABUIIsGameCenterFriendRequestExtension()
{
  int v0 = ABUIIsGameCenterFriendRequestExtension_isGameCenter;
  if (ABUIIsGameCenterFriendRequestExtension_isGameCenter == -1)
  {
    int v0 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", @"com.apple.GameCenterUI.GameCenterFriendRequestExtension");
    ABUIIsGameCenterFriendRequestExtension_isGameCenter = v0;
  }
  return v0 != 0;
}

BOOL ABUIIsFirstParty()
{
  int v0 = ABUIIsFirstParty_isFirstParty;
  if (ABUIIsFirstParty_isFirstParty == -1)
  {
    int v0 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier"), "hasPrefix:", @"com.apple.");
    ABUIIsFirstParty_isFirstParty = v0;
  }
  return v0 != 0;
}

BOOL ABUIIsDDActionsService()
{
  int v0 = ABUIIsDDActionsService_isDDActionsService;
  if (ABUIIsDDActionsService_isDDActionsService == -1)
  {
    int v0 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", @"com.apple.datadetectors.DDActionsService");
    ABUIIsDDActionsService_isDDActionsService = v0;
  }
  return v0 != 0;
}

BOOL ABUIIsBlurSupported()
{
  if (ABUIIsBlurSupported_onceToken != -1) {
    dispatch_once(&ABUIIsBlurSupported_onceToken, &__block_literal_global_40);
  }
  return ABUIIsBlurSupported_blurSupported
      && !UIAccessibilityIsReduceMotionEnabled()
      && !UIAccessibilityIsReduceTransparencyEnabled();
}

uint64_t __ABUIIsBlurSupported_block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1CBF0], "settingsForPrivateStyle:", 2030), "blurRadius");
  ABUIIsBlurSupported_blurSupported = v1 > 0.0;
  return result;
}

uint64_t __RoundToScale_block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
  RoundToScale___s = v1;
  return result;
}

uint64_t ABAddressBookCreateWithOptionsAndPolicy()
{
  return MEMORY[0x270EE0940]();
}

ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  return (ABRecordRef)MEMORY[0x270EE0948](addressBook, *(void *)&recordID);
}

ABRecordRef ABGroupCopySource(ABRecordRef group)
{
  return (ABRecordRef)MEMORY[0x270EE0950](group);
}

ABRecordRef ABPersonCreate(void)
{
  return (ABRecordRef)MEMORY[0x270EE0968]();
}

ABRecordRef ABPersonCreateInSource(ABRecordRef source)
{
  return (ABRecordRef)MEMORY[0x270EE0970](source);
}

CFTypeRef ABRecordCopyValue(ABRecordRef record, ABPropertyID property)
{
  return (CFTypeRef)MEMORY[0x270EE0980](record, *(void *)&property);
}

uint64_t ABRecordGetAddressBook()
{
  return MEMORY[0x270EE0988]();
}

ABRecordID ABRecordGetRecordID(ABRecordRef record)
{
  return MEMORY[0x270EE0990](record);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void NSLog(NSString *format, ...)
{
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F05F20]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x270F05F28]();
}

uint64_t _CNUILog()
{
  return MEMORY[0x270EE40D8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

void objc_enumerationMutation(id obj)
{
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}