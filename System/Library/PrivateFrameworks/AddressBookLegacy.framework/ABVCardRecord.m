@interface ABVCardRecord
+ (BOOL)includeABClipRectInVCardPhotos;
+ (BOOL)includeAddressingGrammarInVCards;
+ (BOOL)includeImageURIInVCards;
+ (BOOL)includeNotesInVCards;
+ (BOOL)includePhotosInVCards;
+ (BOOL)includeREVInVCards;
+ (BOOL)includeWallpaperURIInVCards;
+ (BOOL)privateVCardEnabled;
+ (BOOL)vcardFieldisPrivate:(id)a3;
+ (__CFArray)supportedProperties;
+ (void)clearPrivateFields;
+ (void)setIncludeAddressingGrammarInVCards:(BOOL)a3;
+ (void)setIncludeNotesInVCards:(BOOL)a3;
+ (void)setIncludePhotosInVCards:(BOOL)a3;
+ (void)setIncludeREVInVCards:(BOOL)a3;
+ (void)setPrivateVCardEnabled:(BOOL)a3;
+ (void)setVCardField:(id)a3 isPrivate:(BOOL)a4;
- (ABVCardRecord)init;
- (ABVCardRecord)initWithRecord:(void *)a3;
- (ABVCardRecord)initWithVCardRepresentation:(id)a3;
- (BOOL)_isCompany;
- (BOOL)_showField:(unsigned int)a3;
- (BOOL)_showField:(unsigned int)a3 identifier:(int)a4;
- (BOOL)_usesArrayForExternalPropKey:(id)a3;
- (BOOL)setValue:(void *)a3 forProperty:(unsigned int)a4;
- (BOOL)useThumbnailImageFormatIfAvailable;
- (__CFString)_vCardKeyForEmailLabel:(id)a3;
- (__CFString)_vCardKeyForGenericLabel:(id)a3;
- (id)ISO8061StringFromDate:(id)a3;
- (id)ISO8061StringFromDateTime:(id)a3;
- (id)_21vCardRepresentationAsData;
- (id)_copyGroupVCardRepresentationAsStringIncludeExternalProperties:(BOOL)a3;
- (id)_copyVCardRepresentationAsStringIncludeExternalProperties:(BOOL)a3 withPhoto:(id)a4 extraPhotoParameters:(id)a5 includePrivateData:(BOOL)a6 includeWallpaper:(BOOL)a7;
- (id)_dictionaryForActivityAlerts;
- (id)_fullName;
- (id)_fullNameIncludingAuxiliaryElements:(BOOL)a3;
- (id)_prodID;
- (id)_realCompositeName;
- (id)_typeParameterForToneType:(id)a3;
- (id)_vCardKeyForAddressLabel:(id)a3 vCard3:(BOOL)a4;
- (id)_vCardKeysForPhoneLabel:(id)a3;
- (id)_valueForPersonSounds:(void *)a3 identifier:(int)a4;
- (id)alternateName;
- (id)dataForInstantMessageProperties;
- (id)dataForSocialProfileProperty:(void *)a3 groupCount:(int64_t *)a4 includePrivateData:(BOOL)a5;
- (id)dataForSoundProperty:(void *)a3;
- (id)encodedDataForValue:(id)a3 charsetName:(id *)a4;
- (id)encodedLineForValue:(id)a3;
- (id)imageData;
- (id)newISO8061StringFromDate:(id)a3;
- (id)propertyLineForGenericABProperty21:(unsigned int)a3 vCardProperty:(id)a4;
- (id)propertyLineForGenericABProperty:(unsigned int)a3 vCardProperty:(id)a4 is21:(BOOL)a5 groupCount:(int64_t *)a6;
- (id)propertyLineForIMHandles:(id)a3 labels:(id)a4 vCardProperty:(id)a5;
- (id)propertyLineForIMPPProperty:(BOOL)a3 groupCount:(int64_t *)a4 includePrivateData:(BOOL)a5;
- (id)propertyLineForInstantMessageHandles:(BOOL)a3 groupCount:(int64_t *)a4 includePrivateData:(BOOL)a5;
- (id)sharedPhotoDisplayPreferenceStringValue;
- (id)stringForAlternateBirthdayComponent:(id)a3 key:(id)a4 formatWidth:(int)a5;
- (id)stringFromAlternateBirthday:(id)a3;
- (id)vCardRepresentationForMode:(int)a3;
- (void)_addPersonSounds:(void *)a3 identifier:(int)a4 toActivityAlerts:(id *)a5 activity:(id)a6 alert:(id)a7;
- (void)_appendPropValue:(id)a3 forPropKey:(id)a4 toOutString:(id)a5 usingDelimiter:(id)a6 inGroup:(id)a7;
- (void)appendLabel:(id)a3 toVCardRep:(id)a4 inGroup:(id)a5;
- (void)copyValueForProperty:(unsigned int)a3;
- (void)dealloc;
- (void)record;
- (void)valueForProperty:(unsigned int)a3;
@end

@implementation ABVCardRecord

- (ABVCardRecord)initWithRecord:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ABVCardRecord;
  v4 = [(ABVCardRecord *)&v6 init];
  if (v4)
  {
    v4->_record = (void *)CFRetain(a3);
    v4->_properties = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  }
  return v4;
}

- (ABVCardRecord)init
{
  v4.receiver = self;
  v4.super_class = (Class)ABVCardRecord;
  v2 = [(ABVCardRecord *)&v4 init];
  if (v2)
  {
    v2->_record = (void *)ABPersonCreate();
    v2->_properties = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  }
  return v2;
}

- (ABVCardRecord)initWithVCardRepresentation:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ABVCardRecord;
  objc_super v4 = [(ABVCardRecord *)&v10 init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      objc_super v6 = objc_opt_new();
      v7 = [[ABVCardParser alloc] initWithData:a3];
      id v8 = [(ABVCardParser *)v7 sortedPeopleAndProperties:0];
      if ([v8 count] == 1) {
        v5->_record = (void *)CFRetain((CFTypeRef)[v8 lastObject]);
      }

      v5->_properties = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  record = self->_record;
  if (record) {
    CFRelease(record);
  }
  properties = self->_properties;
  if (properties) {
    CFRelease(properties);
  }
  v5.receiver = self;
  v5.super_class = (Class)ABVCardRecord;
  [(ABVCardRecord *)&v5 dealloc];
}

- (id)vCardRepresentationForMode:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = [(ABVCardRecord *)self _copyVCardRepresentationAsStringIncludeExternalProperties:0 withPhoto:0 extraPhotoParameters:0 includePrivateData:0 includeWallpaper:0];
      id v5 = (id)[v4 copyABVCardDataRepresentation];
      ABRegulatoryLogReadTransmitContactsData();

      return v5;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return [(ABVCardRecord *)self _21vCardRepresentationAsData];
  }
}

- (void)record
{
  return self->_record;
}

+ (__CFArray)supportedProperties
{
  if (supportedProperties_onceToken != -1) {
    dispatch_once(&supportedProperties_onceToken, &__block_literal_global_71);
  }
  return (__CFArray *)supportedProperties_retVal;
}

CFArrayRef __36__ABVCardRecord_supportedProperties__block_invoke()
{
  values[36] = *(void **)MEMORY[0x1E4F143B8];
  values[0] = (void *)kABPersonKindProperty;
  values[1] = (void *)kABPersonFirstNameProperty;
  values[2] = (void *)kABPersonMiddleNameProperty;
  values[3] = (void *)kABPersonLastNameProperty;
  values[4] = (void *)kABPersonPreviousFamilyNameProperty;
  values[5] = (void *)kABPersonPrefixProperty;
  values[6] = (void *)kABPersonSuffixProperty;
  values[7] = (void *)kABPersonNicknameProperty;
  values[8] = (void *)kABPersonFirstNamePhoneticProperty;
  values[9] = (void *)kABPersonMiddleNamePhoneticProperty;
  values[10] = (void *)kABPersonLastNamePhoneticProperty;
  values[11] = (void *)kABPersonFirstNamePronunciationProperty;
  values[12] = (void *)kABPersonMiddleNamePronunciationProperty;
  values[13] = (void *)kABPersonLastNamePronunciationProperty;
  values[14] = (void *)kABPersonOrganizationProperty;
  values[15] = (void *)kABPersonOrganizationPhoneticProperty;
  values[16] = (void *)kABPersonOrganizationPronunciationProperty;
  values[17] = (void *)kABPersonJobTitleProperty;
  values[18] = (void *)kABPersonDepartmentProperty;
  values[19] = (void *)kABPersonPhoneProperty;
  values[20] = (void *)kABPersonEmailProperty;
  values[21] = (void *)kABPersonAddressProperty;
  values[22] = (void *)kABPersonURLProperty;
  values[23] = (void *)kABPersonDateProperty;
  values[24] = (void *)kABPersonBirthdayProperty;
  values[25] = (void *)kABPersonNoteProperty;
  values[26] = (void *)kABPersonSocialProfileProperty;
  values[27] = (void *)kABPersonInstantMessageProperty;
  values[28] = (void *)kABPersonRelatedNamesProperty;
  values[29] = (void *)kABPersonImageURIProperty;
  values[30] = (void *)kABPersonPhonemeDataProperty;
  values[31] = (void *)kABPersonAlternateBirthdayProperty;
  values[32] = (void *)kABPersonMapsDataProperty;
  values[33] = (void *)kABPersonSoundProperty;
  values[34] = (void *)kABPersonWallpaperProperty;
  values[35] = (void *)kABPersonWallpaperURIProperty;
  CFArrayRef result = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)values, 36, 0);
  supportedProperties_retVal = (uint64_t)result;
  return result;
}

- (BOOL)setValue:(void *)a3 forProperty:(unsigned int)a4
{
  v7 = +[ABVCardRecord supportedProperties];
  if (a4
    && (CFArrayRef v8 = v7,
        v11.length = CFArrayGetCount(v7),
        v11.location = 0,
        CFArrayGetFirstIndexOfValue(v8, v11, (const void *)(int)a4) == -1))
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    BOOL v9 = ABRecordSetValue(self->_record, a4, a3, 0);
    if (v9)
    {
      CFArrayAppendValue(self->_properties, (const void *)(int)a4);
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

+ (BOOL)privateVCardEnabled
{
  return CFPreferencesGetAppBooleanValue(@"ABPrivateVCardFieldsEnabled", @"com.apple.AddressBook", 0) != 0;
}

+ (void)setPrivateVCardEnabled:(BOOL)a3
{
  uint64_t v3 = (const void *)[NSNumber numberWithBool:a3];
  CFPreferencesSetAppValue(@"ABPrivateVCardFieldsEnabled", v3, @"com.apple.AddressBook");
}

+ (void)setVCardField:(id)a3 isPrivate:(BOOL)a4
{
  objc_super v6 = (void *)CFPreferencesCopyAppValue(@"ABPrivateVCardFields", @"com.apple.AddressBook");
  CFPropertyListRef valuea = (CFPropertyListRef)[v6 mutableCopy];

  id v7 = (id)valuea;
  if (!valuea) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  value = v7;
  if (a4) {
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), a3);
  }
  else {
    [v7 removeObjectForKey:a3];
  }
  CFPreferencesSetAppValue(@"ABPrivateVCardFields", value, @"com.apple.AddressBook");
}

+ (void)clearPrivateFields
{
}

+ (BOOL)vcardFieldisPrivate:(id)a3
{
  id v4 = (void *)CFPreferencesCopyAppValue(@"ABPrivateVCardFields", @"com.apple.AddressBook");
  LOBYTE(a3) = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", a3), "BOOLValue");

  return (char)a3;
}

+ (void)setIncludeNotesInVCards:(BOOL)a3
{
  uint64_t v3 = (const void *)[NSNumber numberWithBool:a3];
  CFPreferencesSetAppValue(@"ABIncludeNotesInVCard", v3, @"com.apple.AddressBook");
}

+ (BOOL)includeNotesInVCards
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ABIncludeNotesInVCard", @"com.apple.AddressBook", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

+ (void)setIncludeAddressingGrammarInVCards:(BOOL)a3
{
  BOOL v3 = (const void *)[NSNumber numberWithBool:a3];
  CFPreferencesSetAppValue(@"ABIncludeAddressingGrammarInVCard", v3, @"com.apple.AddressBook");
}

+ (BOOL)includeAddressingGrammarInVCards
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ABIncludeAddressingGrammarInVCard", @"com.apple.AddressBook", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

+ (void)setIncludeREVInVCards:(BOOL)a3
{
  BOOL v3 = (const void *)[NSNumber numberWithBool:a3];
  CFPreferencesSetAppValue(@"ABIncludeREVInVCard", v3, @"com.apple.AddressBook");
}

+ (BOOL)includeREVInVCards
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ABIncludeREVInVCard", @"com.apple.AddressBook", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

+ (BOOL)includeImageURIInVCards
{
  return 0;
}

+ (BOOL)includeABClipRectInVCardPhotos
{
  return 0;
}

+ (void)setIncludePhotosInVCards:(BOOL)a3
{
  BOOL v3 = (const void *)[NSNumber numberWithBool:a3];
  CFPreferencesSetAppValue(@"ABIncludePhotosInVCard", v3, @"com.apple.AddressBook");
}

+ (BOOL)includePhotosInVCards
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ABIncludePhotosInVCard", @"com.apple.AddressBook", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

+ (BOOL)includeWallpaperURIInVCards
{
  return 0;
}

- (BOOL)_showField:(unsigned int)a3
{
  return 1;
}

- (BOOL)_showField:(unsigned int)a3 identifier:(int)a4
{
  return 1;
}

- (id)_vCardKeyForAddressLabel:(id)a3 vCard3:(BOOL)a4
{
  BOOL v4 = a4;
  if ([a3 isEqualToString:@"_$!<Work>!$_"])
  {
    objc_super v6 = @"WORK";
    id v7 = @";type=WORK";
    goto LABEL_5;
  }
  if ([a3 isEqualToString:@"_$!<Home>!$_"])
  {
    objc_super v6 = @"HOME";
    id v7 = @";type=HOME";
LABEL_5:
    if (v4) {
      return v7;
    }
    else {
      return v6;
    }
  }
  int v9 = [a3 isEqualToString:@"_$!<Other>!$_"];
  objc_super v10 = @"OTHER";
  if (v4) {
    objc_super v10 = @";type=OTHER";
  }
  if (v9) {
    return v10;
  }
  else {
    return 0;
  }
}

- (__CFString)_vCardKeyForGenericLabel:(id)a3
{
  if ([a3 isEqualToString:@"_$!<Work>!$_"]) {
    return @"WORK";
  }
  if ([a3 isEqualToString:@"_$!<Home>!$_"]) {
    return @"HOME";
  }
  return 0;
}

- (id)_vCardKeysForPhoneLabel:(id)a3
{
  if ([a3 isEqualToString:@"_$!<Work>!$_"])
  {
    BOOL v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = @"VOICE";
    return (id)objc_msgSend(v4, "arrayWithObjects:", @"WORK", v5, 0, v13);
  }
  if ([a3 isEqualToString:@"_$!<Home>!$_"])
  {
    id v7 = (void *)MEMORY[0x1E4F1C978];
    CFArrayRef v8 = @"VOICE";
    return (id)objc_msgSend(v7, "arrayWithObjects:", @"HOME", v8, 0, v13);
  }
  if ([a3 isEqualToString:@"_$!<Other>!$_"])
  {
    int v9 = (void *)MEMORY[0x1E4F1C978];
    objc_super v10 = @"VOICE";
    return (id)objc_msgSend(v9, "arrayWithObjects:", @"OTHER", v10, 0, v13);
  }
  if ([a3 isEqualToString:@"_$!<Mobile>!$_"]) {
    return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"CELL", @"VOICE", 0, v13);
  }
  if ([a3 isEqualToString:@"iPhone"]) {
    return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"IPHONE", @"CELL", @"VOICE", 0);
  }
  if ([a3 isEqualToString:@"Apple Watch"]) {
    return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"APPLEWATCH", @"CELL", @"VOICE", 0);
  }
  if ([a3 isEqualToString:@"_$!<Main>!$_"])
  {
    CFRange v11 = (void *)MEMORY[0x1E4F1C978];
    v12 = @"MAIN";
  }
  else
  {
    if ([a3 isEqualToString:@"_$!<WorkFAX>!$_"])
    {
      BOOL v4 = (void *)MEMORY[0x1E4F1C978];
      id v5 = @"FAX";
      return (id)objc_msgSend(v4, "arrayWithObjects:", @"WORK", v5, 0, v13);
    }
    if ([a3 isEqualToString:@"_$!<HomeFAX>!$_"])
    {
      id v7 = (void *)MEMORY[0x1E4F1C978];
      CFArrayRef v8 = @"FAX";
      return (id)objc_msgSend(v7, "arrayWithObjects:", @"HOME", v8, 0, v13);
    }
    if ([a3 isEqualToString:@"_$!<OtherFAX>!$_"])
    {
      int v9 = (void *)MEMORY[0x1E4F1C978];
      objc_super v10 = @"FAX";
      return (id)objc_msgSend(v9, "arrayWithObjects:", @"OTHER", v10, 0, v13);
    }
    if (![a3 isEqualToString:@"_$!<Pager>!$_"]) {
      return 0;
    }
    CFRange v11 = (void *)MEMORY[0x1E4F1C978];
    v12 = @"PAGER";
  }
  return (id)[v11 arrayWithObject:v12];
}

- (__CFString)_vCardKeyForEmailLabel:(id)a3
{
  if ([a3 isEqualToString:@"_$!<Work>!$_"]) {
    return @"WORK";
  }
  if ([a3 isEqualToString:@"_$!<Home>!$_"]) {
    return @"HOME";
  }
  return 0;
}

- (void)appendLabel:(id)a3 toVCardRep:(id)a4 inGroup:(id)a5
{
  if (a3)
  {
    [a4 appendString:a5];
    [a4 appendString:@"."];
    [a4 appendString:@"X-ABLabel:"];
    objc_msgSend(a4, "appendString:", objc_msgSend(a3, "abVCardKoshify"));
    [a4 appendString:@"\r\n"];
  }
}

- (id)newISO8061StringFromDate:(id)a3
{
  if (newISO8061StringFromDate__pred != -1) {
    dispatch_once(&newISO8061StringFromDate__pred, &__block_literal_global_163);
  }
  BOOL v4 = (void *)[(id)newISO8061StringFromDate__gmtDateFormatter stringFromDate:a3];
  return v4;
}

uint64_t __42__ABVCardRecord_newISO8061StringFromDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  newISO8061StringFromDate__gmtDateFormatter = (uint64_t)v0;
  return [v0 setFormatOptions:275];
}

- (id)ISO8061StringFromDate:(id)a3
{
  id v3 = [(ABVCardRecord *)self newISO8061StringFromDate:a3];
  return v3;
}

- (id)ISO8061StringFromDateTime:(id)a3
{
  if (ISO8061StringFromDateTime__pred != -1) {
    dispatch_once(&ISO8061StringFromDateTime__pred, &__block_literal_global_166);
  }
  BOOL v4 = (void *)ISO8061StringFromDateTime__gmtDateFormatter;
  return (id)[v4 stringFromDate:a3];
}

uint64_t __43__ABVCardRecord_ISO8061StringFromDateTime___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  ISO8061StringFromDateTime__gmtDateFormatter = (uint64_t)v0;
  return [v0 setFormatOptions:1907];
}

- (id)stringForAlternateBirthdayComponent:(id)a3 key:(id)a4 formatWidth:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if ([a3 objectForKeyedSubscript:a4]) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"%0*li", v5, objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", a4), "integerValue"));
  }
  else {
    return @"-";
  }
}

- (id)stringFromAlternateBirthday:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F28E78] string];
  [v5 appendFormat:@"CALSCALE=%@:", objc_msgSend(a3, "objectForKeyedSubscript:", @"calendarIdentifier"];
  objc_msgSend(v5, "appendString:", -[ABVCardRecord stringForAlternateBirthdayComponent:key:formatWidth:](self, "stringForAlternateBirthdayComponent:key:formatWidth:", a3, @"era", 4));
  objc_msgSend(v5, "appendString:", -[ABVCardRecord stringForAlternateBirthdayComponent:key:formatWidth:](self, "stringForAlternateBirthdayComponent:key:formatWidth:", a3, @"year", 4));
  objc_msgSend(v5, "appendString:", -[ABVCardRecord stringForAlternateBirthdayComponent:key:formatWidth:](self, "stringForAlternateBirthdayComponent:key:formatWidth:", a3, @"month", 2));
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"isLeapMonth"), "BOOLValue")) {
    [v5 appendString:@"L"];
  }
  objc_msgSend(v5, "appendString:", -[ABVCardRecord stringForAlternateBirthdayComponent:key:formatWidth:](self, "stringForAlternateBirthdayComponent:key:formatWidth:", a3, @"day", 2));
  return v5;
}

- (void)copyValueForProperty:(unsigned int)a3
{
  return (void *)ABRecordCopyValue(self->_record, a3);
}

- (void)valueForProperty:(unsigned int)a3
{
  id v3 = [(ABVCardRecord *)self copyValueForProperty:*(void *)&a3];
  return v3;
}

- (id)propertyLineForGenericABProperty:(unsigned int)a3 vCardProperty:(id)a4 is21:(BOOL)a5 groupCount:(int64_t *)a6
{
  uint64_t v8 = *(void *)&a3;
  objc_super v10 = (void *)[MEMORY[0x1E4F28E78] string];
  CFRange v11 = [(ABVCardRecord *)self valueForProperty:v8];
  if (v11)
  {
    v12 = v11;
    ABPropertyType PropertyType = ABMultiValueGetPropertyType(v11);
    int PrimaryIdentifier = ABCMultiValueGetPrimaryIdentifier((uint64_t)v12);
    CFIndex Count = ABMultiValueGetCount(v12);
    if (Count)
    {
      CFIndex v14 = Count;
      CFIndex v15 = 0;
      v26 = v12;
      v27 = self;
      CFIndex v25 = Count;
      do
      {
        uint64_t IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v12, v15);
        if ([(ABVCardRecord *)self _showField:v8 identifier:IdentifierAtIndex])
        {
          CFTypeRef v17 = ABMultiValueCopyValueAtIndex(v12, v15);
          v18 = v17;
          if (PropertyType == 4) {
            CFTypeRef v19 = [(ABVCardRecord *)self newISO8061StringFromDate:v17];
          }
          else {
            CFTypeRef v19 = CFRetain(v17);
          }
          v30 = (void *)v19;
          v20 = (__CFString *)ABMultiValueCopyLabelAtIndex(v12, v15);
          v21 = [(ABVCardRecord *)self _vCardKeyForGenericLabel:v20];
          uint64_t v22 = (uint64_t)v21;
          if (a5 || v21)
          {
            [v10 appendString:a4];
            if (v22)
            {
              [v10 appendString:@";type="];
              [v10 appendString:v22];
              uint64_t v22 = 0;
            }
          }
          else
          {
            uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"item%ld", (*a6)++);
            [v10 appendString:v22];
            [v10 appendString:@"."];
            [v10 appendString:a4];
          }
          if (IdentifierAtIndex == PrimaryIdentifier) {
            [v10 appendString:@";type=pref"];
          }
          [v10 appendString:@":"];
          objc_msgSend(v10, "appendString:", objc_msgSend(v30, "abVCardKoshify"));
          [v10 appendString:@"\r\n"];
          self = v27;
          if (v22) {
            [(ABVCardRecord *)v27 appendLabel:v20 toVCardRep:v10 inGroup:v22];
          }

          CFIndex v14 = v25;
          v12 = v26;
          if (v18) {
            CFRelease(v18);
          }
        }
        ++v15;
      }
      while (v14 != v15);
    }
  }
  return v10;
}

- (id)propertyLineForInstantMessageHandles:(BOOL)a3 groupCount:(int64_t *)a4 includePrivateData:(BOOL)a5
{
  BOOL v31 = a5;
  objc_super v6 = (void *)[MEMORY[0x1E4F28E78] string];
  uint64_t v7 = kABPersonInstantMessageProperty;
  uint64_t v8 = [(ABVCardRecord *)self valueForProperty:kABPersonInstantMessageProperty];
  if (v8)
  {
    int v9 = v8;
    int PrimaryIdentifier = ABCMultiValueGetPrimaryIdentifier((uint64_t)v8);
    CFIndex Count = ABMultiValueGetCount(v9);
    if (Count)
    {
      CFIndex v11 = Count;
      CFIndex v12 = 0;
      v28 = v9;
      CFIndex v32 = Count;
      while (1)
      {
        uint64_t IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v9, v12);
        if ([(ABVCardRecord *)self _showField:v7 identifier:IdentifierAtIndex]) {
          break;
        }
LABEL_36:
        if (++v12 == v11) {
          return v6;
        }
      }
      CFIndex v14 = (void *)ABMultiValueCopyValueAtIndex(v9, v12);
      CFIndex v15 = (void *)[v14 objectForKey:@"service"];
      v35 = (void *)[v14 objectForKey:@"username"];
      uint64_t v33 = [v14 objectForKey:@"teamIdentifier"];
      v16 = (void *)[v14 objectForKey:@"bundleIdentifiers"];
      v34 = (void *)[v14 objectForKey:@"identifier"];
      CFTypeRef v17 = @"X-AIM";
      if (([v15 isEqualToString:@"AIM"] & 1) == 0)
      {
        CFTypeRef v17 = @"X-JABBER";
        if (([v15 isEqualToString:@"Jabber"] & 1) == 0)
        {
          CFTypeRef v17 = @"X-MSN";
          if (([v15 isEqualToString:@"MSN"] & 1) == 0)
          {
            CFTypeRef v17 = @"X-YAHOO";
            if (([v15 isEqualToString:@"Yahoo"] & 1) == 0)
            {
              CFTypeRef v17 = @"X-ICQ";
              if (([v15 isEqualToString:@"ICQ"] & 1) == 0)
              {
                if ([v15 length]) {
                  goto LABEL_35;
                }
                CFTypeRef v17 = @"X-MS-IMADDRESS";
              }
            }
          }
        }
      }
      if ([v35 length])
      {
        v18 = (__CFString *)ABMultiValueCopyLabelAtIndex(v9, v12);
        CFTypeRef v19 = self;
        v20 = [(ABVCardRecord *)self _vCardKeyForGenericLabel:v18];
        v21 = v20;
        if (!v18 || a3 || v20)
        {
          [v6 appendString:v17];
          uint64_t v22 = 0;
          uint64_t v24 = 0;
          v23 = @";type=";
          if (!v21)
          {
LABEL_19:
            self = v19;
            int v9 = v28;
            if (v31)
            {
              if (v33)
              {
                [v6 appendString:@";x-teamidentifier="];
                [v6 appendString:v33];
              }
              if (v16)
              {
                [v6 appendString:@";x-bundleidentifiers="];
                if ([v16 count])
                {
                  unint64_t v25 = 0;
                  do
                  {
                    if (v25) {
                      [v6 appendString:@","];
                    }
                    objc_msgSend(v6, "appendString:", objc_msgSend(v16, "objectAtIndexedSubscript:", v25++));
                  }
                  while (v25 < [v16 count]);
                }
              }
              if (v34)
              {
                [v6 appendString:@";x-userid="];
                objc_msgSend(v6, "appendString:", objc_msgSend(v34, "abVCardKoshify"));
              }
            }
            if (IdentifierAtIndex == PrimaryIdentifier) {
              [v6 appendString:@";type=pref"];
            }
            [v6 appendString:@":"];
            objc_msgSend(v6, "appendString:", objc_msgSend(v35, "abVCardKoshify"));
            [v6 appendString:@"\r\n"];
            if (v24) {
              [(ABVCardRecord *)self appendLabel:v18 toVCardRep:v6 inGroup:v24];
            }

            uint64_t v7 = kABPersonInstantMessageProperty;
            goto LABEL_35;
          }
        }
        else
        {
          uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"item%ld", (*a4)++);
          [v6 appendString:v22];
          v23 = @".";
          v21 = v17;
        }
        [v6 appendString:v23];
        [v6 appendString:v21];
        uint64_t v24 = v22;
        goto LABEL_19;
      }
LABEL_35:

      CFIndex v11 = v32;
      goto LABEL_36;
    }
  }
  return v6;
}

- (id)propertyLineForIMPPProperty:(BOOL)a3 groupCount:(int64_t *)a4 includePrivateData:(BOOL)a5
{
  BOOL v28 = a5;
  objc_super v6 = objc_msgSend(MEMORY[0x1E4F28E78], "string", a3);
  uint64_t v7 = [(ABVCardRecord *)self valueForProperty:kABPersonInstantMessageProperty];
  if (v7)
  {
    uint64_t v8 = v7;
    CFIndex Count = ABMultiValueGetCount(v7);
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        uint64_t IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v8, i);
        if ([(ABVCardRecord *)self _showField:kABPersonInstantMessageProperty identifier:IdentifierAtIndex])
        {
          CFIndex v11 = (void *)ABMultiValueCopyValueAtIndex(v8, i);
          uint64_t v12 = [v11 objectForKey:@"username"];
          uint64_t v33 = (void *)[v11 objectForKey:@"service"];
          uint64_t v13 = [v11 objectForKey:@"teamIdentifier"];
          CFIndex v14 = (void *)[v11 objectForKey:@"bundleIdentifiers"];
          v30 = (void *)[v11 objectForKey:@"identifier"];

          BOOL v31 = (void *)v12;
          if (v12)
          {
            CFIndex v15 = (__CFString *)ABMultiValueCopyLabelAtIndex(v8, i);
            v16 = [(ABVCardRecord *)self _vCardKeyForGenericLabel:v15];
            uint64_t v17 = 0;
            v29 = v16;
            if (v15 && !v16)
            {
              uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"item%ld", (*a4)++);
              uint64_t v17 = v18;
              [v6 appendString:v18];
              [v6 appendString:@"."];
            }
            [v6 appendString:@"IMPP"];
            if (v33) {
              [v6 appendFormat:@";X-SERVICE-TYPE=%@", v33];
            }
            if (v28)
            {
              if (v13)
              {
                [v6 appendString:@";x-teamidentifier="];
                [v6 appendString:v13];
              }
              if (v14)
              {
                [v6 appendString:@";x-bundleidentifiers="];
                if ([v14 count])
                {
                  unint64_t v19 = 0;
                  do
                  {
                    if (v19) {
                      [v6 appendString:@","];
                    }
                    objc_msgSend(v6, "appendString:", objc_msgSend(v14, "objectAtIndexedSubscript:", v19++));
                  }
                  while (v19 < [v14 count]);
                }
              }
              if (v30)
              {
                [v6 appendString:@";x-userid="];
                objc_msgSend(v6, "appendString:", objc_msgSend(v30, "abVCardKoshify"));
              }
            }
            if (v29)
            {
              [v6 appendString:@";type="];
              [v6 appendString:v29];
            }
            if (IdentifierAtIndex == ABCMultiValueGetPrimaryIdentifier((uint64_t)v8)) {
              [v6 appendString:@";type=pref"];
            }
            if (v33
              && (v20 = (void *)MEMORY[0x1E4F1C9E8],
                  uint64_t v21 = v17,
                  uint64_t v22 = (void *)MEMORY[0x1E4F28B50],
                  uint64_t v23 = objc_opt_class(),
                  uint64_t v24 = v22,
                  uint64_t v17 = v21,
                  (uint64_t v25 = objc_msgSend((id)objc_msgSend(v20, "dictionaryWithContentsOfFile:", objc_msgSend((id)objc_msgSend(v24, "bundleForClass:", v23), "pathForResource:ofType:", @"InstantMessageURLSchemes", @"plist")), "valueForKey:", objc_msgSend(v33, "lowercaseString"))) != 0))
            {
              [v6 appendFormat:@":%@", v25];
            }
            else
            {
              [v6 appendString:@":x-apple"];
            }
            [v6 appendFormat:@":%@\r\n", objc_msgSend((id)objc_msgSend(v31, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E4F28B88], "URLPathAllowedCharacterSet")), "abVCardKoshify")];
            if (v17) {
              [(ABVCardRecord *)self appendLabel:v15 toVCardRep:v6 inGroup:v17];
            }
          }
        }
      }
    }
  }
  return v6;
}

- (id)propertyLineForGenericABProperty21:(unsigned int)a3 vCardProperty:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  objc_super v6 = (void *)[MEMORY[0x1E4F1CA58] data];
  uint64_t v27 = 0;
  uint64_t v7 = [(ABVCardRecord *)self valueForProperty:v4];
  if (v7)
  {
    uint64_t v8 = v7;
    ABPropertyType PropertyType = ABMultiValueGetPropertyType(v7);
    int PrimaryIdentifier = ABCMultiValueGetPrimaryIdentifier((uint64_t)v8);
    CFIndex Count = ABMultiValueGetCount(v8);
    if (Count)
    {
      CFIndex v10 = Count;
      CFIndex v11 = 0;
      unsigned int v23 = v4;
      do
      {
        uint64_t IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v8, v11);
        if ([(ABVCardRecord *)self _showField:v4 identifier:IdentifierAtIndex])
        {
          CFTypeRef v13 = ABMultiValueCopyValueAtIndex(v8, v11);
          CFIndex v14 = v13;
          if (PropertyType == 260) {
            CFTypeRef v15 = [(ABVCardRecord *)self newISO8061StringFromDate:v13];
          }
          else {
            CFTypeRef v15 = CFRetain(v13);
          }
          v16 = (void *)v15;
          uint64_t v17 = (__CFString *)ABMultiValueCopyLabelAtIndex(v8, v11);
          uint64_t v18 = [(ABVCardRecord *)self _vCardKeyForGenericLabel:v17];
          [v6 abAppendString:a4];
          if (v18)
          {
            [v6 abAppendString:@";type="];
            [v6 abAppendString:v18];
          }
          if (IdentifierAtIndex == PrimaryIdentifier) {
            [v6 abAppendString:@";type=pref"];
          }
          uint64_t v19 = [v16 abVCardKoshify];
          id v20 = [(ABVCardRecord *)self encodedDataForValue:v19 charsetName:&v27];
          if (v27)
          {
            id v21 = v20;
            [v6 abAppendString:@";CHARSET="];
            [v6 abAppendString:v27];
            [v6 abAppendString:@":"];
            [v6 appendData:v21];
          }
          else
          {
            [v6 abAppendString:@":"];
            [v6 abAppendString:v19];
          }
          uint64_t v4 = v23;
          [v6 abAppendString:@"\r\n"];

          if (v14) {
            CFRelease(v14);
          }
        }
        ++v11;
      }
      while (v10 != v11);
    }
  }
  return v6;
}

- (id)dataForSocialProfileProperty:(void *)a3 groupCount:(int64_t *)a4 includePrivateData:(BOOL)a5
{
  BOOL v29 = a5;
  objc_super v6 = objc_msgSend(MEMORY[0x1E4F1CA58], "data", a3, a4);
  CFIndex v32 = a3;
  if (a3)
  {
    CFIndex Count = ABMultiValueGetCount(a3);
    if (Count)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        uint64_t v8 = (void *)ABMultiValueCopyValueAtIndex(v32, i);
        uint64_t v9 = [v8 objectForKey:@"url"];
        CFIndex v10 = (void *)[v8 objectForKey:@"service"];
        uint64_t v11 = [v8 objectForKey:@"username"];
        uint64_t v12 = (void *)[v8 objectForKey:@"identifier"];
        CFTypeRef v13 = (void *)[v8 objectForKey:@"displayname"];
        CFIndex v14 = (void *)[v8 objectForKey:@"bundleIdentifiers"];
        uint64_t v15 = [v8 objectForKey:@"teamIdentifier"];
        if (v9 | v11)
        {
          v30 = (void *)v15;
          [v6 abAppendString:@"X-SOCIALPROFILE"];
          v16 = v10;
          if (v10)
          {
            uint64_t v17 = NSString;
            uint64_t v25 = [v16 abVCardKoshify];
            uint64_t v18 = v17;
            CFIndex v10 = v16;
            [v6 abAppendString:objc_msgSend(v18, "stringWithFormat:", @";type=%@", v25)];
          }
          if (v11)
          {
            uint64_t v19 = NSString;
            uint64_t v26 = [(id)v11 abVCardKoshify];
            id v20 = v19;
            CFIndex v10 = v16;
            [v6 abAppendString:objc_msgSend(v20, "stringWithFormat:", @";x-user=%@", v26)];
          }
          if (v12)
          {
            id v21 = NSString;
            uint64_t v27 = [v12 abVCardKoshify];
            uint64_t v22 = v21;
            CFIndex v10 = v16;
            [v6 abAppendString:objc_msgSend(v22, "stringWithFormat:", @";x-userid=%@", v27)];
          }
          if (v13) {
            objc_msgSend(v6, "abAppendString:", objc_msgSend(NSString, "stringWithFormat:", @";x-displayname=%@",
          }
                [v13 abVCardKoshify]));
          if (v29)
          {
            if (v30) {
              objc_msgSend(v6, "abAppendString:", objc_msgSend(NSString, "stringWithFormat:", @";x-teamidentifier=%@",
            }
                  [v30 abVCardKoshify]));
            if (v14)
            {
              [v6 abAppendString:@";x-bundleidentifiers="];
              if ([v14 count])
              {
                unint64_t v23 = 0;
                do
                {
                  if (v23) {
                    [v6 abAppendString:@","];
                  }
                  objc_msgSend(v6, "abAppendString:", objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", v23++), "abVCardKoshify"));
                }
                while (v23 < [v14 count]);
              }
            }
          }
          if (![(id)v9 length]) {
            uint64_t v9 = socialProfileURLForServiceAndUsername(v10, (void *)v11);
          }
          objc_msgSend(v6, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend((id)v9, "abVCardKoshify")));
        }
      }
    }
  }
  return v6;
}

- (id)propertyLineForIMHandles:(id)a3 labels:(id)a4 vCardProperty:(id)a5
{
  uint64_t v9 = (void *)[MEMORY[0x1E4F1CA58] data];
  uint64_t v19 = 0;
  uint64_t v10 = [a3 count];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t i = 0; i != v11; ++i)
    {
      CFTypeRef v13 = (void *)[a3 objectAtIndex:i];
      CFIndex v14 = -[ABVCardRecord _vCardKeyForGenericLabel:](self, "_vCardKeyForGenericLabel:", [a4 objectAtIndex:i]);
      [v9 abAppendString:a5];
      if (v14)
      {
        [v9 abAppendString:@";type="];
        [v9 abAppendString:v14];
      }
      uint64_t v15 = [v13 abVCardKoshify];
      id v16 = [(ABVCardRecord *)self encodedDataForValue:v15 charsetName:&v19];
      if (v19)
      {
        id v17 = v16;
        [v9 abAppendString:@";CHARSET="];
        [v9 abAppendString:v19];
        [v9 abAppendString:@":"];
        [v9 appendData:v17];
      }
      else
      {
        [v9 abAppendString:@":"];
        [v9 abAppendString:v15];
      }
      [v9 abAppendString:@"\r\n"];
    }
  }
  return v9;
}

- (id)dataForInstantMessageProperties
{
  v2 = [(ABVCardRecord *)self valueForProperty:kABPersonInstantMessageProperty];
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v2)
  {
    CFIndex Count = ABMultiValueGetCount(v2);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      CFIndex v5 = 0;
      uint64_t v26 = @"ICQ";
      do
      {
        objc_super v6 = (void *)ABMultiValueCopyValueAtIndex(v2, v5);
        uint64_t v7 = (__CFString *)ABMultiValueCopyLabelAtIndex(v2, v5);
        uint64_t v8 = (void *)[v6 objectForKey:@"service"];
        uint64_t v10 = v36;
        uint64_t v9 = v37;
        if (([v8 isEqualToString:@"AIM"] & 1) == 0)
        {
          uint64_t v10 = v34;
          uint64_t v9 = v35;
          if (([v8 isEqualToString:@"Jabber"] & 1) == 0)
          {
            uint64_t v10 = v32;
            uint64_t v9 = v33;
            if (([v8 isEqualToString:@"MSN"] & 1) == 0)
            {
              uint64_t v10 = v30;
              uint64_t v9 = v31;
              if (([v8 isEqualToString:@"Yahoo"] & 1) == 0)
              {
                int v11 = [v8 isEqualToString:v26];
                if (v11) {
                  uint64_t v9 = v29;
                }
                else {
                  uint64_t v9 = 0;
                }
                if (v11) {
                  uint64_t v10 = v28;
                }
                else {
                  uint64_t v10 = 0;
                }
              }
            }
          }
        }
        uint64_t v12 = objc_msgSend(v6, "objectForKey:", @"username", v26);
        if (v12)
        {
          [v9 addObject:v12];
          if (v7) {
            CFTypeRef v13 = v7;
          }
          else {
            CFTypeRef v13 = &stru_1EF03E278;
          }
          [v10 addObject:v13];
        }

        ++v5;
      }
      while (v4 != v5);
    }
  }
  CFIndex v14 = (void *)[MEMORY[0x1E4F1CA58] data];
  id v15 = [(ABVCardRecord *)self propertyLineForIMHandles:v37 labels:v36 vCardProperty:@"X-AIM"];
  if (v15)
  {
    id v16 = v15;
    if ([v15 length]) {
      [v14 appendData:v16];
    }
  }
  id v17 = [(ABVCardRecord *)self propertyLineForIMHandles:v35 labels:v34 vCardProperty:@"X-JABBER"];
  if (v17)
  {
    id v18 = v17;
    if ([v17 length]) {
      [v14 appendData:v18];
    }
  }
  id v19 = [(ABVCardRecord *)self propertyLineForIMHandles:v33 labels:v32 vCardProperty:@"X-MSN"];
  if (v19)
  {
    id v20 = v19;
    if ([v19 length]) {
      [v14 appendData:v20];
    }
  }
  id v21 = [(ABVCardRecord *)self propertyLineForIMHandles:v31 labels:v30 vCardProperty:@"X-YAHOO"];
  if (v21)
  {
    id v22 = v21;
    if ([v21 length]) {
      [v14 appendData:v22];
    }
  }
  id v23 = [(ABVCardRecord *)self propertyLineForIMHandles:v29 labels:v28 vCardProperty:@"X-ICQ"];
  if (v23)
  {
    id v24 = v23;
    if ([v23 length]) {
      [v14 appendData:v24];
    }
  }

  return v14;
}

- (id)_valueForPersonSounds:(void *)a3 identifier:(int)a4
{
  CFIndex IndexForIdentifier = ABMultiValueGetIndexForIdentifier(a3, a4);
  if (IndexForIdentifier == -1) {
    objc_super v6 = 0;
  }
  else {
    objc_super v6 = (void *)ABMultiValueCopyValueAtIndex(a3, IndexForIdentifier);
  }
  return v6;
}

- (void)_addPersonSounds:(void *)a3 identifier:(int)a4 toActivityAlerts:(id *)a5 activity:(id)a6 alert:(id)a7
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v10 = [(ABVCardRecord *)self _valueForPersonSounds:a3 identifier:*(void *)&a4];
  if (v10)
  {
    id v11 = v10;
    id v12 = *a5;
    if (!*a5)
    {
      id v12 = (id)[MEMORY[0x1E4F1CA60] dictionary];
      *a5 = v12;
    }
    CFTypeRef v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", objc_msgSend(v12, "objectForKeyedSubscript:", a6));
    id v17 = a7;
    v18[0] = v11;
    objc_msgSend(v13, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1));
    id v14 = *a5;
    id v15 = a6;
    id v16 = v13;
    objc_msgSend(v14, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  }
}

- (id)_dictionaryForActivityAlerts
{
  uint64_t v7 = 0;
  id result = [(ABVCardRecord *)self valueForProperty:kABPersonSoundProperty];
  if (result)
  {
    id v4 = result;
    id v5 = [(ABVCardRecord *)self _valueForPersonSounds:result identifier:4294967293];
    if (v5)
    {
      uint64_t v6 = [v5 dataUsingEncoding:4];
      uint64_t v7 = (void *)[MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:1 error:0];
    }
    [(ABVCardRecord *)self _addPersonSounds:v4 identifier:0xFFFFFFFFLL toActivityAlerts:&v7 activity:@"com.apple.activityalert.call" alert:@"sound"];
    [(ABVCardRecord *)self _addPersonSounds:v4 identifier:4294967195 toActivityAlerts:&v7 activity:@"com.apple.activityalert.call" alert:@"vibration"];
    [(ABVCardRecord *)self _addPersonSounds:v4 identifier:4294967292 toActivityAlerts:&v7 activity:@"com.apple.activityalert.call" alert:@"ignoreMute"];
    [(ABVCardRecord *)self _addPersonSounds:v4 identifier:4294967294 toActivityAlerts:&v7 activity:@"com.apple.activityalert.text" alert:@"sound"];
    [(ABVCardRecord *)self _addPersonSounds:v4 identifier:4294967194 toActivityAlerts:&v7 activity:@"com.apple.activityalert.text" alert:@"vibration"];
    [(ABVCardRecord *)self _addPersonSounds:v4 identifier:4294967291 toActivityAlerts:&v7 activity:@"com.apple.activityalert.text" alert:@"ignoreMute"];
    return v7;
  }
  return result;
}

- (id)_typeParameterForToneType:(id)a3
{
  if (![a3 caseInsensitiveCompare:@"com.apple.activityalert.call"]) {
    return @"call";
  }
  if ([a3 caseInsensitiveCompare:@"com.apple.activityalert.text"]) {
    return a3;
  }
  return @"text";
}

- (id)dataForSoundProperty:(void *)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA58], "data", a3);
  id v5 = [(ABVCardRecord *)self _dictionaryForActivityAlerts];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__ABVCardRecord_dataForSoundProperty___block_invoke;
  v7[3] = &unk_1E59890F8;
  v7[4] = v4;
  v7[5] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
  return v4;
}

uint64_t __38__ABVCardRecord_dataForSoundProperty___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  if (result)
  {
    [*(id *)(a1 + 32) abAppendString:@"X-ACTIVITY-ALERT:"];
    objc_msgSend(*(id *)(a1 + 32), "abAppendString:", +[ABVCardActivityAlertSerialization stringWithType:info:](ABVCardActivityAlertSerialization, "stringWithType:info:", objc_msgSend(*(id *)(a1 + 40), "_typeParameterForToneType:", a2), a3));
    uint64_t v7 = *(void **)(a1 + 32);
    return [v7 abAppendString:@"\r\n"];
  }
  return result;
}

- (id)encodedLineForValue:(id)a3
{
  id v4 = (void *)[MEMORY[0x1E4F1CA58] data];
  if ([a3 canBeConvertedToEncoding:1])
  {
    id v5 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@":"];
    [(__CFString *)v5 appendString:a3];
    [(__CFString *)v5 appendString:@"\r\n"];
    uint64_t v6 = v5;
LABEL_6:
    uint64_t v12 = 1;
    goto LABEL_7;
  }
  [v4 appendData:objc_msgSend(@";CHARSET=", "dataUsingEncoding:", 1)];
  CFStringRef v7 = (const __CFString *)CFPreferencesCopyAppValue(@"AB21vCardEncoding", @"com.apple.AddressBook");
  if (v7)
  {
    id v5 = (__CFString *)v7;
    CFStringEncoding v8 = CFStringConvertIANACharSetNameToEncoding(v7);
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, (CFStringRef)a3, v8, 0);
    CFTypeRef v10 = CFMakeCollectable(ExternalRepresentation);
    if (v10)
    {
      id v11 = (void *)v10;
      objc_msgSend(v4, "appendData:", -[__CFString dataUsingEncoding:](v5, "dataUsingEncoding:", 1));
      [v4 appendData:objc_msgSend(@":", "dataUsingEncoding:", 1)];
      [v4 appendData:v11];

      uint64_t v6 = @"\r\n";
      goto LABEL_6;
    }
  }
  if ([a3 canBeConvertedToEncoding:5])
  {
    id v5 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"LATIN1:"];
    [(__CFString *)v5 appendString:a3];
    [(__CFString *)v5 appendString:@"\r\n"];
    uint64_t v6 = v5;
    uint64_t v12 = 5;
  }
  else
  {
    int v14 = [a3 canBeConvertedToEncoding:30];
    id v15 = objc_alloc(MEMORY[0x1E4F28E78]);
    if (v14)
    {
      id v5 = (__CFString *)[v15 initWithString:@"MACINTOSH:"];
      [(__CFString *)v5 appendString:a3];
      [(__CFString *)v5 appendString:@"\r\n"];
      uint64_t v6 = v5;
      uint64_t v12 = 30;
    }
    else
    {
      id v5 = (__CFString *)[v15 initWithString:@"UTF-8:"];
      [(__CFString *)v5 appendString:a3];
      [(__CFString *)v5 appendString:@"\r\n"];
      uint64_t v6 = v5;
      uint64_t v12 = 4;
    }
  }
LABEL_7:
  objc_msgSend(v4, "appendData:", -[__CFString dataUsingEncoding:](v6, "dataUsingEncoding:", v12));

  return v4;
}

- (id)encodedDataForValue:(id)a3 charsetName:(id *)a4
{
  if ([a3 canBeConvertedToEncoding:1])
  {
    *a4 = 0;
    id v6 = a3;
    uint64_t v7 = 1;
    goto LABEL_13;
  }
  CFStringEncoding v8 = (id)CFPreferencesCopyAppValue(@"AB21vCardEncoding", @"com.apple.AddressBook");
  if ([a3 canBeConvertedToEncoding:5])
  {
    *a4 = @"LATIN1";
    id v6 = a3;
    uint64_t v7 = 5;
    goto LABEL_13;
  }
  if (!v8
    || (CFStringEncoding v9 = CFStringConvertIANACharSetNameToEncoding(v8),
        CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, (CFStringRef)a3, v9, 0),
        (id v11 = (void *)CFMakeCollectable(ExternalRepresentation)) == 0))
  {
    if ([a3 canBeConvertedToEncoding:30])
    {
      *a4 = @"MACINTOSH";
      id v6 = a3;
      uint64_t v7 = 30;
    }
    else
    {
      *a4 = @"UTF-8";
      id v6 = a3;
      uint64_t v7 = 4;
    }
LABEL_13:
    return (id)[v6 dataUsingEncoding:v7];
  }
  *a4 = v8;
  return v11;
}

- (id)_fullNameIncludingAuxiliaryElements:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ABVCardRecord *)self valueForProperty:kABPersonFirstNameProperty];
  id v6 = [(ABVCardRecord *)self valueForProperty:kABPersonLastNameProperty];
  uint64_t v7 = [(ABVCardRecord *)self valueForProperty:kABPersonMiddleNameProperty];
  if (v3) {
    CFStringEncoding v8 = [(ABVCardRecord *)self valueForProperty:kABPersonPrefixProperty];
  }
  else {
    CFStringEncoding v8 = 0;
  }
  CFStringEncoding v9 = [(ABVCardRecord *)self valueForProperty:kABPersonSuffixProperty];
  CFTypeRef v10 = (void *)[MEMORY[0x1E4F28E78] string];
  if (v5) {
    id v11 = v5;
  }
  else {
    id v11 = &stru_1EF03E278;
  }
  if (v6) {
    uint64_t v12 = v6;
  }
  else {
    uint64_t v12 = &stru_1EF03E278;
  }
  if (v7) {
    CFTypeRef v13 = v7;
  }
  else {
    CFTypeRef v13 = &stru_1EF03E278;
  }
  if (v8) {
    int v14 = v8;
  }
  else {
    int v14 = &stru_1EF03E278;
  }
  if (v9) {
    id v15 = v9;
  }
  else {
    id v15 = &stru_1EF03E278;
  }
  uint64_t v16 = [(__CFString *)v11 length];
  uint64_t v17 = [(__CFString *)v12 length];
  uint64_t v24 = [(__CFString *)v13 length];
  uint64_t v18 = [(__CFString *)v14 length];
  uint64_t v19 = [(__CFString *)v15 length];
  if (v16)
  {
    if (!v17) {
      return v11;
    }
    uint64_t v20 = v19;
    uint64_t v25 = 0;
    int CompositeNameFormatAndDelimiterForRecord = ABPersonGetCompositeNameFormatAndDelimiterForRecord(self->_record, (CFStringRef *)&v25);
    if (v25) {
      id v22 = v25;
    }
    else {
      id v22 = @" ";
    }
    if (CompositeNameFormatAndDelimiterForRecord == 1)
    {
      if (v18)
      {
        [v10 appendString:v14];
        [v10 appendString:v22];
      }
      [v10 appendString:v12];
      [v10 appendString:v22];
      [v10 appendString:v11];
      if (v20)
      {
        [v10 appendString:v22];
        [v10 appendString:v15];
      }
      if (!v24) {
        return v10;
      }
LABEL_40:
      [v10 appendString:v22];
      [v10 appendString:v13];
      return v10;
    }
    if (v18)
    {
      [v10 appendString:v14];
      [v10 appendString:v22];
    }
    [v10 appendString:v11];
    [v10 appendString:v22];
    if (v24)
    {
      [v10 appendString:v13];
      [v10 appendString:v22];
    }
    [v10 appendString:v12];
    CFTypeRef v13 = v15;
    if (v20) {
      goto LABEL_40;
    }
  }
  else if (v17)
  {
    return v12;
  }
  return v10;
}

- (BOOL)_isCompany
{
  v2 = [(ABVCardRecord *)self valueForProperty:kABPersonKindProperty];
  if (v2) {
    LOBYTE(v2) = CFEqual(v2, kABPersonKindOrganization) != 0;
  }
  return (char)v2;
}

- (id)_fullName
{
  return [(ABVCardRecord *)self _fullNameIncludingAuxiliaryElements:1];
}

- (id)alternateName
{
  id result = [(ABVCardRecord *)self valueForProperty:kABPersonNicknameProperty];
  if (!result)
  {
    id result = [(ABVCardRecord *)self valueForProperty:kABPersonOrganizationProperty];
    if (!result)
    {
      id v4 = [(ABVCardRecord *)self valueForProperty:kABPersonEmailProperty];
      if (v4 && (id v5 = v4, ABMultiValueGetCount(v4)))
      {
        id v6 = (void *)ABMultiValueCopyValueAtIndex(v5, 0);
        return v6;
      }
      else
      {
        return &stru_1EF03E278;
      }
    }
  }
  return result;
}

- (id)_realCompositeName
{
  if ([(ABVCardRecord *)self _isCompany])
  {
    BOOL v3 = [(ABVCardRecord *)self valueForProperty:kABPersonOrganizationProperty];
    if (v3)
    {
      id v4 = v3;
      if ([v3 length]) {
        goto LABEL_8;
      }
    }
    id v5 = [(ABVCardRecord *)self _fullName];
LABEL_6:
    id v4 = v5;
    if ([v5 length]) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v5 = [(ABVCardRecord *)self _fullNameIncludingAuxiliaryElements:1];
  if (v5) {
    goto LABEL_6;
  }
LABEL_7:
  id v4 = [(ABVCardRecord *)self alternateName];
LABEL_8:
  if (v4) {
    return v4;
  }
  else {
    return &stru_1EF03E278;
  }
}

- (id)sharedPhotoDisplayPreferenceStringValue
{
  return (id)qword_1E5989118[objc_msgSend(-[ABVCardRecord valueForProperty:](self, "valueForProperty:", kABPersonDisplayFlagsProperty), "integerValue") >> 6];
}

- (id)_21vCardRepresentationAsData
{
  v2 = (void *)[MEMORY[0x1E4F1CA58] data];
  v84 = (void *)[MEMORY[0x1E4F1CA48] array];
  [v2 abAppendString:@"BEGIN:VCARD"];
  [v2 abAppendString:@"\r\n"];
  [v2 abAppendString:@"VERSION:2.1"];
  [v2 abAppendString:@"\r\n"];
  BOOL v3 = [(ABVCardRecord *)self valueForProperty:kABPersonLastNameProperty];
  if (!v3) {
    BOOL v3 = &stru_1EF03E278;
  }
  objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v3, "abVCardKoshify"));
  id v4 = [(ABVCardRecord *)self valueForProperty:kABPersonFirstNameProperty];
  if (!v4) {
    id v4 = &stru_1EF03E278;
  }
  objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v4, "abVCardKoshify"));
  id v5 = [(ABVCardRecord *)self valueForProperty:kABPersonMiddleNameProperty];
  if (!v5) {
    id v5 = &stru_1EF03E278;
  }
  objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v5, "abVCardKoshify"));
  id v6 = [(ABVCardRecord *)self valueForProperty:kABCPrefixProperty];
  if (!v6) {
    id v6 = &stru_1EF03E278;
  }
  objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v6, "abVCardKoshify"));
  uint64_t v7 = [(ABVCardRecord *)self valueForProperty:kABCSuffixProperty];
  if (!v7) {
    uint64_t v7 = &stru_1EF03E278;
  }
  objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v7, "abVCardKoshify"));
  [v2 abAppendString:@"N"];
  objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v84, "componentsJoinedByString:", @";")));
  [v84 removeAllObjects];
  id v8 = [(ABVCardRecord *)self _realCompositeName];
  if ([v8 length])
  {
    [v2 abAppendString:@"FN"];
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v8, "abVCardKoshify")));
  }
  CFStringEncoding v9 = [(ABVCardRecord *)self valueForProperty:kABPersonNicknameProperty];
  CFTypeRef v10 = v9;
  if (v9 && ([v9 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v2 abAppendString:@"NICKNAME"];
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v10, "abVCardKoshify")));
  }
  id v11 = [(ABVCardRecord *)self valueForProperty:kABPersonPreviousFamilyNameProperty];
  uint64_t v12 = v11;
  if (v11 && ([v11 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v2 abAppendString:@"X-MAIDENNAME"];
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v12, "abVCardKoshify")));
  }
  CFTypeRef v13 = [(ABVCardRecord *)self valueForProperty:kABPersonFirstNamePhoneticProperty];
  int v14 = v13;
  if (v13 && ([v13 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v2 abAppendString:@"X-PHONETIC-FIRST-NAME"];
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v14, "abVCardKoshify")));
  }
  id v15 = [(ABVCardRecord *)self valueForProperty:kABPersonFirstNamePronunciationProperty];
  uint64_t v16 = v15;
  if (v15 && ([v15 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v2 abAppendString:@"X-PRONUNCIATION-FIRST-NAME"];
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v16, "abVCardKoshify")));
  }
  uint64_t v17 = [(ABVCardRecord *)self valueForProperty:kABPersonMiddleNamePhoneticProperty];
  uint64_t v18 = v17;
  if (v17 && ([v17 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v2 abAppendString:@"X-PHONETIC-MIDDLE-NAME"];
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v18, "abVCardKoshify")));
  }
  uint64_t v19 = [(ABVCardRecord *)self valueForProperty:kABPersonMiddleNamePronunciationProperty];
  uint64_t v20 = v19;
  if (v19 && ([v19 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v2 abAppendString:@"X-PRONUNCIATION-MIDDLE-NAME"];
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v20, "abVCardKoshify")));
  }
  id v21 = [(ABVCardRecord *)self valueForProperty:kABPersonLastNamePhoneticProperty];
  id v22 = v21;
  if (v21 && ([v21 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v2 abAppendString:@"X-PHONETIC-LAST-NAME"];
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v22, "abVCardKoshify")));
  }
  id v23 = [(ABVCardRecord *)self valueForProperty:kABPersonLastNamePronunciationProperty];
  uint64_t v24 = v23;
  if (v23 && ([v23 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v2 abAppendString:@"X-PRONUNCIATION-LAST-NAME"];
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v24, "abVCardKoshify")));
  }
  unint64_t v25 = [(ABVCardRecord *)self valueForProperty:kABPersonOrganizationProperty];
  unint64_t v26 = [(ABVCardRecord *)self valueForProperty:kABPersonDepartmentProperty];
  if (v25 | v26
    && (![(id)v25 isEqualToString:&stru_1EF03E278]
     || ([(id)v26 isEqualToString:&stru_1EF03E278] & 1) == 0))
  {
    id v27 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    if ([(id)v25 length]) {
      id v28 = (__CFString *)[(id)v25 abVCardKoshify];
    }
    else {
      id v28 = &stru_1EF03E278;
    }
    [v27 appendString:v28];
    [v27 appendString:@";"];
    if ([(id)v26 length]) {
      id v29 = (__CFString *)[(id)v26 abVCardKoshify];
    }
    else {
      id v29 = &stru_1EF03E278;
    }
    [v27 appendString:v29];
    [v2 abAppendString:@"ORG"];
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", v27));
  }
  id v30 = [(ABVCardRecord *)self valueForProperty:kABPersonOrganizationPhoneticProperty];
  id v31 = v30;
  if (v30 && ([v30 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v2 abAppendString:@"X-PHONETIC-ORG"];
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v31, "abVCardKoshify")));
  }
  id v32 = [(ABVCardRecord *)self valueForProperty:kABPersonOrganizationPronunciationProperty];
  id v33 = v32;
  if (v32 && ([v32 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v2 abAppendString:@"X-PRONUNCIATION-ORG"];
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v33, "abVCardKoshify")));
  }
  id v34 = [(ABVCardRecord *)self valueForProperty:kABPersonJobTitleProperty];
  id v35 = v34;
  if (v34 && ([v34 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v2 abAppendString:@"TITLE"];
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v35, "abVCardKoshify")));
  }
  id v36 = [(ABVCardRecord *)self valueForProperty:kABPersonEmailProperty];
  id v37 = v36;
  if (v36)
  {
    CFIndex Count = ABMultiValueGetCount(v36);
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        if ([(ABVCardRecord *)self _showField:kABPersonEmailProperty identifier:ABMultiValueGetIdentifierAtIndex(v37, i)])
        {
          v40 = (void *)ABMultiValueCopyValueAtIndex(v37, i);
          v41 = (__CFString *)ABMultiValueCopyLabelAtIndex(v37, i);
          [v2 abAppendString:@"EMAIL;INTERNET"];
          v42 = [(ABVCardRecord *)self _vCardKeyForEmailLabel:v41];
          if (v42)
          {
            [v2 abAppendString:@";"];
            [v2 abAppendString:v42];
          }
          objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v40, "abVCardKoshify")));
        }
      }
    }
  }
  v43 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:");
  v44 = v43;
  if (v43)
  {
    CFIndex v83 = ABMultiValueGetCount(v43);
    if (v83 >= 1)
    {
      for (CFIndex j = 0; j != v83; ++j)
      {
        if ([(ABVCardRecord *)self _showField:kABPersonPhoneProperty identifier:ABMultiValueGetIdentifierAtIndex(v44, j)])
        {
          v46 = (void *)ABMultiValueCopyValueAtIndex(v44, j);
          v47 = (__CFString *)ABMultiValueCopyLabelAtIndex(v44, j);
          [v2 abAppendString:@"TEL"];
          id v48 = [(ABVCardRecord *)self _vCardKeysForPhoneLabel:v47];
          uint64_t v49 = [v48 count];
          if (v49 >= 1)
          {
            for (uint64_t k = 0; k != v49; ++k)
            {
              uint64_t v51 = [v48 objectAtIndex:k];
              [v2 abAppendString:@";"];
              [v2 abAppendString:v51];
            }
          }
          objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v46, "abVCardKoshify")));
        }
      }
    }
  }
  v52 = [(ABVCardRecord *)self valueForProperty:kABPersonAddressProperty];
  v53 = v52;
  if (v52)
  {
    CFIndex v54 = ABMultiValueGetCount(v52);
    if (v54 >= 1)
    {
      for (CFIndex m = 0; m != v54; ++m)
      {
        if ([(ABVCardRecord *)self _showField:kABPersonAddressProperty identifier:ABMultiValueGetIdentifierAtIndex(v53, m)])
        {
          v56 = (void *)ABMultiValueCopyValueAtIndex(v53, m);
          v57 = (__CFString *)ABMultiValueCopyLabelAtIndex(v53, m);
          [v2 abAppendString:@"ADR"];
          id v58 = [(ABVCardRecord *)self _vCardKeyForAddressLabel:v57 vCard3:0];
          if (v58)
          {
            [v2 abAppendString:@";"];
            [v2 abAppendString:v58];
          }
          [v84 addObject:&stru_1EF03E278];
          v59 = (void *)[v56 objectForKey:@"Street"];
          v60 = v59;
          if (v59)
          {
            uint64_t v61 = [v59 rangeOfString:@"\r"];
            if (v62)
            {
              uint64_t v63 = v61;
              objc_msgSend(v84, "addObject:", objc_msgSend((id)objc_msgSend(v60, "substringToIndex:", v61), "abVCardKoshify"));
              uint64_t v64 = objc_msgSend((id)objc_msgSend(v60, "substringFromIndex:", v63 + 1), "abVCardKoshify");
            }
            else
            {
              [v84 addObject:&stru_1EF03E278];
              uint64_t v64 = [v60 abVCardKoshify];
            }
            [v84 addObject:v64];
          }
          else
          {
            [v84 addObject:&stru_1EF03E278];
            [v84 addObject:&stru_1EF03E278];
          }
          v65 = (__CFString *)[v56 objectForKey:@"City"];
          if (!v65) {
            v65 = &stru_1EF03E278;
          }
          objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v65, "abVCardKoshify"));
          v66 = (__CFString *)[v56 objectForKey:@"State"];
          if (!v66) {
            v66 = &stru_1EF03E278;
          }
          objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v66, "abVCardKoshify"));
          v67 = (__CFString *)[v56 objectForKey:@"ZIP"];
          if (!v67) {
            v67 = &stru_1EF03E278;
          }
          objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v67, "abVCardKoshify"));
          v68 = (__CFString *)[v56 objectForKey:@"Country"];
          if (!v68) {
            v68 = &stru_1EF03E278;
          }
          objc_msgSend(v84, "addObject:", -[__CFString abVCardKoshify](v68, "abVCardKoshify"));
          objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v84, "componentsJoinedByString:", @";")));
          [v84 removeAllObjects];
        }
      }
    }
  }
  v69 = [(ABVCardRecord *)self valueForProperty:kABPersonNoteProperty];
  v70 = v69;
  if (v69
    && ([v69 isEqualToString:&stru_1EF03E278] & 1) == 0
    && [(id)objc_opt_class() includeNotesInVCards])
  {
    [v2 abAppendString:@"NOTE"];
    objc_msgSend(v2, "appendData:", -[ABVCardRecord encodedLineForValue:](self, "encodedLineForValue:", objc_msgSend(v70, "abVCardKoshify")));
  }
  id v71 = [(ABVCardRecord *)self propertyLineForGenericABProperty21:kABPersonURLProperty vCardProperty:@"URL"];
  id v72 = v71;
  if (v71 && [v71 length]) {
    [v2 appendData:v72];
  }
  v73 = [(ABVCardRecord *)self valueForProperty:kABPersonBirthdayProperty];
  if (v73 && [(ABVCardRecord *)self _showField:kABPersonBirthdayProperty])
  {
    [v2 abAppendString:@"BDAY;"];
    [v2 abAppendString:@"value=date:"];
    objc_msgSend(v2, "abAppendString:", -[ABVCardRecord ISO8061StringFromDate:](self, "ISO8061StringFromDate:", v73));
    [v2 abAppendString:@"\r\n"];
  }
  id v74 = [(ABVCardRecord *)self dataForInstantMessageProperties];
  id v75 = v74;
  if (v74 && [v74 length]) {
    [v2 appendData:v75];
  }
  id v76 = [(ABVCardRecord *)self dataForSocialProfileProperty:[(ABVCardRecord *)self valueForProperty:kABPersonSocialProfileProperty] groupCount:0 includePrivateData:0];
  id v77 = v76;
  if (v76 && [v76 length]) {
    [v2 appendData:v77];
  }
  id v78 = [(ABVCardRecord *)self propertyLineForGenericABProperty21:kABPersonRelatedNamesProperty vCardProperty:@"X-ABRELATEDNAMES"];
  id v79 = v78;
  if (v78 && [v78 length]) {
    [v2 appendData:v79];
  }
  v80 = [(ABVCardRecord *)self valueForProperty:kABPersonModificationDateProperty];
  if (v80 && [(id)objc_opt_class() includeREVInVCards])
  {
    [v2 abAppendString:@"REV:"];
    objc_msgSend(v2, "abAppendString:", -[ABVCardRecord ISO8061StringFromDateTime:](self, "ISO8061StringFromDateTime:", v80));
    [v2 abAppendString:@"\r\n"];
  }
  v81 = [(ABVCardRecord *)self valueForProperty:kABPersonAlternateBirthdayProperty];
  if ([v81 count]
    && [(ABVCardRecord *)self _showField:kABPersonAlternateBirthdayProperty])
  {
    [v2 abAppendString:@"X-ALTBDAY;"];
    objc_msgSend(v2, "abAppendString:", -[ABVCardRecord stringFromAlternateBirthday:](self, "stringFromAlternateBirthday:", v81));
    [v2 abAppendString:@"\r\n"];
  }
  [v2 abAppendString:@"END:VCARD"];
  [v2 abAppendString:@"\r\n"];
  return v2;
}

- (BOOL)useThumbnailImageFormatIfAvailable
{
  return 1;
}

- (id)imageData
{
  if (ABPersonHasImageData(self->_record))
  {
    if (![(ABVCardRecord *)self useThumbnailImageFormatIfAvailable]
      || (CFDataRef v3 = ABPersonCopyImageDataWithFormat(self->_record, kABPersonImageFormatThumbnail)) == 0)
    {
      CFDataRef v3 = ABPersonCopyImageDataWithFormat(self->_record, kABPersonImageFormatOriginalSize);
    }
  }
  else
  {
    CFDataRef v3 = 0;
  }
  return v3;
}

- (id)_prodID
{
  if (_prodID_onceToken != -1) {
    dispatch_once(&_prodID_onceToken, &__block_literal_global_414);
  }
  return (id)_prodID__sProdID;
}

void __24__ABVCardRecord__prodID__block_invoke()
{
  uint64_t v0 = _CFCopyServerVersionDictionary();
  if (!v0) {
    uint64_t v0 = _CFCopySystemVersionDictionary();
  }
  id v2 = (id)v0;
  id v1 = [NSString alloc];
  _prodID__sProdID = [v1 initWithFormat:@"-//Apple Inc.//iOS %@//EN", objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E4F1CD30])];
}

- (BOOL)_usesArrayForExternalPropKey:(id)a3
{
  return [a3 compare:@"CATEGORIES" options:1] == 0;
}

- (void)_appendPropValue:(id)a3 forPropKey:(id)a4 toOutString:(id)a5 usingDelimiter:(id)a6 inGroup:(id)a7
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a7)
  {
    [a5 appendString:a7];
    [a5 appendString:@"."];
  }
  [a5 appendString:a4];
  [a5 appendString:@":"];
  if ([(ABVCardRecord *)self _usesArrayForExternalPropKey:a4])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v12 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      char v15 = 1;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(a3);
          }
          uint64_t v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ((v15 & 1) == 0) {
            [a5 appendString:@","];
          }
          objc_msgSend(a5, "appendString:", objc_msgSend(v17, "abVCardKoshify"));
          char v15 = 0;
        }
        uint64_t v13 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
        char v15 = 0;
      }
      while (v13);
    }
  }
  else
  {
    objc_msgSend(a5, "appendString:", objc_msgSend(a3, "abVCardKoshify"));
  }
  [a5 appendString:a6];
}

- (id)_copyVCardRepresentationAsStringIncludeExternalProperties:(BOOL)a3 withPhoto:(id)a4 extraPhotoParameters:(id)a5 includePrivateData:(BOOL)a6 includeWallpaper:(BOOL)a7
{
  BOOL v175 = a7;
  BOOL v176 = a6;
  BOOL v174 = a3;
  uint64_t v201 = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v198 = 1;
  v187 = (void *)[MEMORY[0x1E4F1CA48] array];
  [v8 appendString:@"BEGIN:VCARD"];
  [v8 appendString:@"\r\n"];
  [v8 appendString:@"VERSION:3.0"];
  [v8 appendString:@"\r\n"];
  [v8 appendString:@"PRODID:"];
  objc_msgSend(v8, "appendString:", -[ABVCardRecord _prodID](self, "_prodID"));
  [v8 appendString:@"\r\n"];
  CFStringEncoding v9 = [(ABVCardRecord *)self valueForProperty:kABPersonLastNameProperty];
  if (!v9) {
    CFStringEncoding v9 = &stru_1EF03E278;
  }
  objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v9, "abVCardKoshify"));
  CFTypeRef v10 = [(ABVCardRecord *)self valueForProperty:kABPersonFirstNameProperty];
  if (!v10) {
    CFTypeRef v10 = &stru_1EF03E278;
  }
  objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v10, "abVCardKoshify"));
  id v11 = [(ABVCardRecord *)self valueForProperty:kABPersonMiddleNameProperty];
  if (!v11) {
    id v11 = &stru_1EF03E278;
  }
  objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v11, "abVCardKoshify"));
  uint64_t v12 = [(ABVCardRecord *)self valueForProperty:kABPersonPrefixProperty];
  if (!v12) {
    uint64_t v12 = &stru_1EF03E278;
  }
  objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v12, "abVCardKoshify"));
  uint64_t v13 = [(ABVCardRecord *)self valueForProperty:kABPersonSuffixProperty];
  if (!v13) {
    uint64_t v13 = &stru_1EF03E278;
  }
  objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v13, "abVCardKoshify"));
  [v8 appendString:@"N:"];
  objc_msgSend(v8, "appendString:", objc_msgSend(v187, "componentsJoinedByString:", @";"));
  [v8 appendString:@"\r\n"];
  [v187 removeAllObjects];
  uint64_t v14 = [(ABVCardRecord *)self _realCompositeName];
  [v8 appendString:@"FN:"];
  if (v14) {
    char v15 = v14;
  }
  else {
    char v15 = &stru_1EF03E278;
  }
  objc_msgSend(v8, "appendString:", -[__CFString abVCardKoshify](v15, "abVCardKoshify"));
  [v8 appendString:@"\r\n"];
  uint64_t v16 = [(ABVCardRecord *)self valueForProperty:kABPersonNicknameProperty];
  uint64_t v17 = v16;
  if (v16 && ([v16 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v8 appendString:@"NICKNAME:"];
    objc_msgSend(v8, "appendString:", objc_msgSend(v17, "abVCardKoshify"));
    [v8 appendString:@"\r\n"];
  }
  long long v18 = [(ABVCardRecord *)self valueForProperty:kABPersonPreviousFamilyNameProperty];
  long long v19 = v18;
  if (v18 && ([v18 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v8 appendString:@"X-MAIDENNAME:"];
    objc_msgSend(v8, "appendString:", objc_msgSend(v19, "abVCardKoshify"));
    [v8 appendString:@"\r\n"];
  }
  long long v20 = [(ABVCardRecord *)self valueForProperty:kABPersonFirstNamePhoneticProperty];
  long long v21 = v20;
  if (v20 && ([v20 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v8 appendString:@"X-PHONETIC-FIRST-NAME:"];
    objc_msgSend(v8, "appendString:", objc_msgSend(v21, "abVCardKoshify"));
    [v8 appendString:@"\r\n"];
  }
  id v22 = [(ABVCardRecord *)self valueForProperty:kABPersonFirstNamePronunciationProperty];
  uint64_t v23 = v22;
  if (v22 && ([v22 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v8 appendString:@"X-PRONUNCIATION-FIRST-NAME:"];
    objc_msgSend(v8, "appendString:", objc_msgSend(v23, "abVCardKoshify"));
    [v8 appendString:@"\r\n"];
  }
  uint64_t v24 = [(ABVCardRecord *)self valueForProperty:kABPersonMiddleNamePhoneticProperty];
  unint64_t v25 = v24;
  if (v24 && ([v24 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v8 appendString:@"X-PHONETIC-MIDDLE-NAME:"];
    objc_msgSend(v8, "appendString:", objc_msgSend(v25, "abVCardKoshify"));
    [v8 appendString:@"\r\n"];
  }
  unint64_t v26 = [(ABVCardRecord *)self valueForProperty:kABPersonMiddleNamePronunciationProperty];
  id v27 = v26;
  if (v26 && ([v26 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v8 appendString:@"X-PRONUNCIATION-MIDDLE-NAME:"];
    objc_msgSend(v8, "appendString:", objc_msgSend(v27, "abVCardKoshify"));
    [v8 appendString:@"\r\n"];
  }
  id v28 = [(ABVCardRecord *)self valueForProperty:kABPersonLastNamePhoneticProperty];
  id v29 = v28;
  if (v28 && ([v28 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v8 appendString:@"X-PHONETIC-LAST-NAME:"];
    objc_msgSend(v8, "appendString:", objc_msgSend(v29, "abVCardKoshify"));
    [v8 appendString:@"\r\n"];
  }
  id v30 = [(ABVCardRecord *)self valueForProperty:kABPersonLastNamePronunciationProperty];
  id v31 = v30;
  if (v30 && ([v30 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v8 appendString:@"X-PRONUNCIATION-LAST-NAME:"];
    objc_msgSend(v8, "appendString:", objc_msgSend(v31, "abVCardKoshify"));
    [v8 appendString:@"\r\n"];
  }
  id v32 = [(ABVCardRecord *)self valueForProperty:kABPersonAddressingGrammarProperty];
  if (v32)
  {
    if ([(id)objc_opt_class() includeAddressingGrammarInVCards])
    {
      CFIndex Count = ABMultiValueGetCount(v32);
      if (Count)
      {
        for (CFIndex i = 0; i != Count; ++i)
        {
          id v35 = (void *)ABMultiValueCopyValueAtIndex(v32, i);
          uint64_t v171 = v198++;
          [v8 appendString:objc_msgSend(NSString, "stringWithFormat:", @"item%ld"];
          [v8 appendString:@".X-ADDRESSING-GRAMMAR:"];
          objc_msgSend(v8, "appendString:", objc_msgSend(v35, "abVCardKoshify"));
          [v8 appendString:@"\r\n"];
        }
      }
    }
  }
  unint64_t v36 = [(ABVCardRecord *)self valueForProperty:kABPersonOrganizationProperty];
  unint64_t v37 = [(ABVCardRecord *)self valueForProperty:kABPersonDepartmentProperty];
  if (v36 | v37
    && (![(id)v36 isEqualToString:&stru_1EF03E278]
     || ([(id)v37 isEqualToString:&stru_1EF03E278] & 1) == 0))
  {
    [v8 appendString:@"ORG:"];
    if ([(id)v36 length]) {
      v38 = (__CFString *)[(id)v36 abVCardKoshify];
    }
    else {
      v38 = &stru_1EF03E278;
    }
    [v8 appendString:v38];
    [v8 appendString:@";"];
    if ([(id)v37 length]) {
      v39 = (__CFString *)[(id)v37 abVCardKoshify];
    }
    else {
      v39 = &stru_1EF03E278;
    }
    [v8 appendString:v39];
    [v8 appendString:@"\r\n"];
  }
  v40 = [(ABVCardRecord *)self valueForProperty:kABPersonOrganizationPhoneticProperty];
  v41 = v40;
  if (v40 && ([v40 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v8 appendString:@"X-PHONETIC-ORG:"];
    objc_msgSend(v8, "appendString:", objc_msgSend(v41, "abVCardKoshify"));
    [v8 appendString:@"\r\n"];
  }
  v42 = [(ABVCardRecord *)self valueForProperty:kABPersonOrganizationPronunciationProperty];
  v43 = v42;
  if (v42 && ([v42 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v8 appendString:@"X-PRONUNCIATION-ORG:"];
    objc_msgSend(v8, "appendString:", objc_msgSend(v43, "abVCardKoshify"));
    [v8 appendString:@"\r\n"];
  }
  v44 = [(ABVCardRecord *)self valueForProperty:kABPersonJobTitleProperty];
  v45 = v44;
  if (v44 && ([v44 isEqualToString:&stru_1EF03E278] & 1) == 0)
  {
    [v8 appendString:@"TITLE:"];
    objc_msgSend(v8, "appendString:", objc_msgSend(v45, "abVCardKoshify"));
    [v8 appendString:@"\r\n"];
  }
  v46 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:");
  v47 = v46;
  if (v46)
  {
    obCFIndex j = ABCMultiValueGetPrimaryIdentifier((uint64_t)v46);
    CFIndex v48 = ABMultiValueGetCount(v47);
    if (v48)
    {
      for (CFIndex j = 0; j != v48; ++j)
      {
        uint64_t IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(v47, j);
        if ([(ABVCardRecord *)self _showField:kABPersonEmailProperty identifier:IdentifierAtIndex])
        {
          uint64_t v51 = (void *)ABMultiValueCopyValueAtIndex(v47, j);
          v52 = (__CFString *)ABMultiValueCopyLabelAtIndex(v47, j);
          v53 = [(ABVCardRecord *)self _vCardKeyForEmailLabel:v52];
          if (v53)
          {
            uint64_t v54 = 0;
          }
          else
          {
            uint64_t v171 = v198;
            uint64_t v54 = [NSString stringWithFormat:@"item%ld"];
            ++v198;
            [v8 appendString:v54];
            [v8 appendString:@"."];
          }
          [v8 appendString:@"EMAIL;type=INTERNET"];
          if (v53)
          {
            [v8 appendString:@";type="];
            [v8 appendString:v53];
          }
          if (IdentifierAtIndex == obj) {
            [v8 appendString:@";type=pref"];
          }
          [v8 appendString:@":"];
          objc_msgSend(v8, "appendString:", objc_msgSend(v51, "abVCardKoshify"));
          [v8 appendString:@"\r\n"];
          if (v54) {
            [(ABVCardRecord *)self appendLabel:v52 toVCardRep:v8 inGroup:v54];
          }
        }
      }
    }
  }
  v55 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:");
  v56 = v55;
  if (v55)
  {
    int PrimaryIdentifier = ABCMultiValueGetPrimaryIdentifier((uint64_t)v55);
    CFIndex v178 = ABMultiValueGetCount(v56);
    if (v178)
    {
      for (CFIndex k = 0; k != v178; ++k)
      {
        id v58 = v56;
        uint64_t v59 = ABMultiValueGetIdentifierAtIndex(v56, k);
        if ([(ABVCardRecord *)self _showField:kABPersonPhoneProperty identifier:v59])
        {
          v179 = (void *)ABMultiValueCopyValueAtIndex(v56, k);
          v185 = (__CFString *)ABMultiValueCopyLabelAtIndex(v56, k);
          id v60 = [(ABVCardRecord *)self _vCardKeysForPhoneLabel:v185];
          uint64_t v61 = [v60 count];
          if (v61)
          {
            id obja = 0;
          }
          else
          {
            uint64_t v171 = v198;
            id obja = (id)[NSString stringWithFormat:@"item%ld"];
            ++v198;
            [v8 appendString:obja];
            [v8 appendString:@"."];
          }
          [v8 appendString:@"TEL"];
          if (v61 >= 1)
          {
            for (uint64_t m = 0; m != v61; ++m)
            {
              uint64_t v63 = [v60 objectAtIndex:m];
              [v8 appendString:@";type="];
              [v8 appendString:v63];
            }
          }
          if (v59 == PrimaryIdentifier) {
            [v8 appendString:@";type=pref"];
          }
          [v8 appendString:@":"];
          objc_msgSend(v8, "appendString:", objc_msgSend(v179, "abVCardKoshify"));
          [v8 appendString:@"\r\n"];
          if (obja) {
            [(ABVCardRecord *)self appendLabel:v185 toVCardRep:v8 inGroup:obja];
          }
        }
        v56 = v58;
      }
    }
  }
  uint64_t v64 = -[ABVCardRecord valueForProperty:](self, "valueForProperty:");
  v65 = v64;
  if (v64)
  {
    int v180 = ABCMultiValueGetPrimaryIdentifier((uint64_t)v64);
    id objb = (id)ABMultiValueGetCount(v65);
    if (objb)
    {
      for (CFIndex n = 0; (id)n != objb; ++n)
      {
        uint64_t v67 = ABMultiValueGetIdentifierAtIndex(v65, n);
        if ([(ABVCardRecord *)self _showField:kABPersonAddressProperty identifier:v67])
        {
          v68 = (void *)ABMultiValueCopyValueAtIndex(v65, n);
          v69 = (__CFString *)ABMultiValueCopyLabelAtIndex(v65, n);
          v70 = [(ABVCardRecord *)self _vCardKeyForAddressLabel:v69 vCard3:1];
          uint64_t v171 = v198;
          uint64_t v71 = [NSString stringWithFormat:@"item%ld"];
          ++v198;
          [v8 appendString:v71];
          [v8 appendString:@"."];
          [v8 appendString:@"ADR"];
          if (v70) {
            id v72 = v70;
          }
          else {
            id v72 = @";type=HOME";
          }
          [v8 appendString:v72];
          if (v67 == v180) {
            [v8 appendString:@";type=pref"];
          }
          [v8 appendString:@":"];
          [v187 addObject:&stru_1EF03E278];
          v73 = (void *)[v68 objectForKey:@"Street"];
          id v74 = v73;
          if (v73)
          {
            uint64_t v75 = [v73 rangeOfString:@"\r"];
            if (v76)
            {
              uint64_t v77 = v75;
              objc_msgSend(v187, "addObject:", objc_msgSend((id)objc_msgSend(v74, "substringToIndex:", v75), "abVCardKoshify"));
              uint64_t v78 = objc_msgSend((id)objc_msgSend(v74, "substringFromIndex:", v77 + 1), "abVCardKoshify");
            }
            else
            {
              [v187 addObject:&stru_1EF03E278];
              uint64_t v78 = [v74 abVCardKoshify];
            }
            [v187 addObject:v78];
          }
          else
          {
            [v187 addObject:&stru_1EF03E278];
            [v187 addObject:&stru_1EF03E278];
          }
          id v79 = (__CFString *)[v68 objectForKey:@"City"];
          if (!v79) {
            id v79 = &stru_1EF03E278;
          }
          objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v79, "abVCardKoshify"));
          v80 = (__CFString *)[v68 objectForKey:@"State"];
          if (!v80) {
            v80 = &stru_1EF03E278;
          }
          objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v80, "abVCardKoshify"));
          v81 = (__CFString *)[v68 objectForKey:@"ZIP"];
          if (!v81) {
            v81 = &stru_1EF03E278;
          }
          objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v81, "abVCardKoshify"));
          v82 = (__CFString *)[v68 objectForKey:@"Country"];
          if (!v82) {
            v82 = &stru_1EF03E278;
          }
          objc_msgSend(v187, "addObject:", -[__CFString abVCardKoshify](v82, "abVCardKoshify"));
          objc_msgSend(v8, "appendString:", objc_msgSend(v187, "componentsJoinedByString:", @";"));
          [v187 removeAllObjects];
          [v8 appendString:@"\r\n"];
          if (!v70) {
            [(ABVCardRecord *)self appendLabel:v69 toVCardRep:v8 inGroup:v71];
          }
          uint64_t v83 = [v68 objectForKey:@"CountryCode"];
          if (v83) {
            [(ABVCardRecord *)self _appendPropValue:v83 forPropKey:@"X-ABADR" toOutString:v8 usingDelimiter:@"\r\n" inGroup:v71];
          }
          uint64_t v84 = [v68 objectForKey:@"SubLocality"];
          if (v84) {
            [(ABVCardRecord *)self _appendPropValue:v84 forPropKey:@"X-APPLE-SUBLOCALITY" toOutString:v8 usingDelimiter:@"\r\n" inGroup:v71];
          }
          uint64_t v85 = [v68 objectForKey:@"SubAdministrativeArea"];
          if (v85) {
            [(ABVCardRecord *)self _appendPropValue:v85 forPropKey:@"X-APPLE-SUBADMINISTRATIVEAREA" toOutString:v8 usingDelimiter:@"\r\n" inGroup:v71];
          }
        }
      }
    }
  }
  v86 = [(ABVCardRecord *)self valueForProperty:kABPersonNoteProperty];
  v87 = v86;
  if (v86
    && ([v86 isEqualToString:&stru_1EF03E278] & 1) == 0
    && [(id)objc_opt_class() includeNotesInVCards])
  {
    [v8 appendString:@"NOTE:"];
    objc_msgSend(v8, "appendString:", objc_msgSend(v87, "abVCardKoshify"));
    [v8 appendString:@"\r\n"];
  }
  id v88 = [(ABVCardRecord *)self propertyLineForGenericABProperty:kABPersonURLProperty vCardProperty:@"URL" is21:0 groupCount:&v198];
  id v89 = v88;
  if (v88 && ([v88 isEqualToString:&stru_1EF03E278] & 1) == 0) {
    [v8 appendString:v89];
  }
  v90 = [(ABVCardRecord *)self valueForProperty:kABPersonBirthdayProperty];
  if (v90 && [(ABVCardRecord *)self _showField:kABPersonBirthdayProperty])
  {
    [v8 appendString:@"BDAY;"];
    [v8 appendString:@"value=date:"];
    objc_msgSend(v8, "appendString:", -[ABVCardRecord ISO8061StringFromDate:](self, "ISO8061StringFromDate:", v90));
    [v8 appendString:@"\r\n"];
  }
  v91 = [(ABVCardRecord *)self valueForProperty:kABPersonImageURIProperty];
  int v92 = [(id)objc_opt_class() includeImageURIInVCards];
  if (v91) {
    int v93 = v92;
  }
  else {
    int v93 = 0;
  }
  if (v93 == 1 && [v91 length])
  {
    v94 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"PHOTO"];
    v95 = [(ABVCardRecord *)self valueForProperty:kABPersonMemojiMetadataProperty];
    v96 = v95;
    if (v95 && [v95 length]) {
      objc_msgSend(v94, "appendFormat:", @";VND-63-MEMOJI-DETAILS=%@",
    }
        [v96 base64EncodedStringWithOptions:0]);
    if (a5) {
      [v94 appendFormat:@";%@;VALUE=uri:", a5];
    }
    else {
      [v94 appendString:@";VALUE=uri:"];
    }
    [v8 appendString:v94];
    objc_msgSend(v8, "appendString:", objc_msgSend(v91, "abVCardKoshify"));
    [v8 appendString:@"\r\n"];
  }
  else
  {
    CFDataRef v97 = (const __CFData *)a4;
    if (!a4) {
      CFDataRef v97 = [(ABVCardRecord *)self imageData];
    }
    CFDataRef v98 = v97;
    if ([(__CFData *)v97 length])
    {
      v99 = CGImageSourceCreateWithData(v98, 0);
      v100 = v99;
      if (v99)
      {
        CFStringRef Type = CGImageSourceGetType(v99);
        CFStringRef v102 = Type;
        if (Type)
        {
          if (UTTypeConformsTo(Type, (CFStringRef)*MEMORY[0x1E4F22610]))
          {
            BOOL v103 = 0;
            v104 = @"JPEG";
          }
          else if (UTTypeConformsTo(v102, (CFStringRef)*MEMORY[0x1E4F226E8]))
          {
            BOOL v103 = 0;
            v104 = @"TIFF";
          }
          else
          {
            int v108 = UTTypeConformsTo(v102, (CFStringRef)*MEMORY[0x1E4F22678]);
            BOOL v103 = v108 == 0;
            if (v108) {
              v104 = @"PNG";
            }
            else {
              v104 = 0;
            }
          }
        }
        else
        {
          v104 = 0;
          BOOL v103 = 1;
        }
        CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v100, 0, 0);
        if (ImageAtIndex)
        {
          v110 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"PHOTO"];
          v111 = [(ABVCardRecord *)self valueForProperty:kABPersonMemojiMetadataProperty];
          v112 = v111;
          if (v111 && [v111 length]) {
            objc_msgSend(v110, "appendFormat:", @";VND-63-MEMOJI-DETAILS=%@",
          }
              [v112 base64EncodedStringWithOptions:0]);
          [v110 appendString:@";ENCODING=b"];
          if (!v103) {
            [v110 appendFormat:@";TYPE=%@", v104];
          }
          if (a5) {
            [v110 appendFormat:@";%@", a5];
          }
          [v110 appendString:@":"];
          uint64_t v113 = -[__CFData abEncodeVCardBase64DataWithInitialLength:](v98, "abEncodeVCardBase64DataWithInitialLength:", [v110 length]);
          v114 = (void *)[[NSString alloc] initWithData:v113 encoding:1];
          [v110 appendString:v114];
          [v8 appendString:v110];
          [v8 appendString:@"\r\n"];

          CFRelease(ImageAtIndex);
        }
        else
        {
          ABDiagnosticsEnabled();
          _ABLog2(4, (uint64_t)"-[ABVCardRecord _copyVCardRepresentationAsStringIncludeExternalProperties:withPhoto:extraPhotoParameters:includePrivateData:includeWallpaper:]", 2617, 0, @"Discarding corrupted image data", v115, v116, v117, v171);
        }
        CFRelease(v100);
      }
      else
      {
        ABDiagnosticsEnabled();
        _ABLog2(4, (uint64_t)"-[ABVCardRecord _copyVCardRepresentationAsStringIncludeExternalProperties:withPhoto:extraPhotoParameters:includePrivateData:includeWallpaper:]", 2621, 0, @"Discarding corrupted image data", v105, v106, v107, v171);
      }
    }
  }
  if (v175)
  {
    v118 = [(ABVCardRecord *)self valueForProperty:kABPersonWallpaperURIProperty];
    int v119 = [(id)objc_opt_class() includeWallpaperURIInVCards];
    if (v118) {
      int v120 = v119;
    }
    else {
      int v120 = 0;
    }
    if (v120 == 1 && [v118 length])
    {
      [v8 appendString:@"VND-63-WALLPAPER;VALUE=uri:"];
      objc_msgSend(v8, "appendString:", objc_msgSend(v118, "abVCardKoshify"));
      [v8 appendString:@"\r\n"];
    }
    else
    {
      v121 = [(ABVCardRecord *)self valueForProperty:kABPersonWallpaperProperty];
      v122 = v121;
      if (v121 && [v121 length])
      {
        [v8 appendString:@"VND-63-WALLPAPER;ENCODING=b:"];
        objc_msgSend(v8, "appendString:", objc_msgSend((id)objc_msgSend(v122, "base64EncodedStringWithOptions:", 0), "abVCardKoshify"));
        [v8 appendString:@"\r\n"];
      }
    }
  }
  v123 = [(ABVCardRecord *)self valueForProperty:kABPersonSensitiveContentConfigurationProperty];
  if (v123)
  {
    [v8 appendString:@"VND-63-SENSITIVE-CONTENT-CONFIG:"];
    objc_msgSend(v8, "appendString:", objc_msgSend((id)objc_msgSend(v123, "base64EncodedStringWithOptions:", 0), "abVCardKoshify"));
    [v8 appendString:@"\r\n"];
  }
  id v124 = [(ABVCardRecord *)self propertyLineForInstantMessageHandles:0 groupCount:&v198 includePrivateData:v176];
  id v125 = v124;
  if (v124 && ([v124 isEqualToString:&stru_1EF03E278] & 1) == 0) {
    [v8 appendString:v125];
  }
  id v126 = [(ABVCardRecord *)self propertyLineForIMPPProperty:0 groupCount:&v198 includePrivateData:v176];
  id v127 = v126;
  if (v126 && ([v126 isEqualToString:&stru_1EF03E278] & 1) == 0) {
    [v8 appendString:v127];
  }
  id v128 = [(ABVCardRecord *)self dataForSocialProfileProperty:[(ABVCardRecord *)self valueForProperty:kABPersonSocialProfileProperty] groupCount:&v198 includePrivateData:v176];
  id v129 = v128;
  if (v128 && [v128 length])
  {
    v130 = (void *)[[NSString alloc] initWithData:v129 encoding:1];
    [v8 appendString:v130];
  }
  id v131 = [(ABVCardRecord *)self propertyLineForGenericABProperty:kABPersonDateProperty vCardProperty:@"X-ABDATE" is21:0 groupCount:&v198];
  id v132 = v131;
  if (v131 && ([v131 isEqualToString:&stru_1EF03E278] & 1) == 0) {
    [v8 appendString:v132];
  }
  id v133 = [(ABVCardRecord *)self propertyLineForGenericABProperty:kABPersonRelatedNamesProperty vCardProperty:@"X-ABRELATEDNAMES" is21:0 groupCount:&v198];
  id v134 = v133;
  if (v133 && ([v133 isEqualToString:&stru_1EF03E278] & 1) == 0) {
    [v8 appendString:v134];
  }
  if ([(ABVCardRecord *)self _isCompany])
  {
    [v8 appendString:@"X-ABShowAs:COMPANY"];
    [v8 appendString:@"\r\n"];
  }
  id v135 = [(ABVCardRecord *)self sharedPhotoDisplayPreferenceStringValue];
  if (v135)
  {
    [v8 appendString:@"X-SHARED-PHOTO-DISPLAY-PREF:"];
    [v8 appendString:v135];
    [v8 appendString:@"\r\n"];
  }
  v136 = [(ABVCardRecord *)self valueForProperty:kABPersonModificationDateProperty];
  if (v136 && [(id)objc_opt_class() includeREVInVCards])
  {
    [v8 appendString:@"REV:"];
    objc_msgSend(v8, "appendString:", -[ABVCardRecord ISO8061StringFromDateTime:](self, "ISO8061StringFromDateTime:", v136));
    [v8 appendString:@"\r\n"];
  }
  if (v174)
  {
    v137 = [(ABVCardRecord *)self valueForProperty:kABPersonExternalUUIDProperty];
    if ([v137 length])
    {
      [v8 appendString:@"UID:"];
      objc_msgSend(v8, "appendString:", objc_msgSend(v137, "abVCardKoshify"));
      [v8 appendString:@"\r\n"];
    }
    v138 = [(ABVCardRecord *)self valueForProperty:kABPersonExternalRepresentationProperty];
    if (v138)
    {
      uint64_t v197 = 0;
      v139 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v138 error:&v197];
      if (v139)
      {
        v140 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v141 = objc_opt_class();
        uint64_t v142 = objc_opt_class();
        v188 = objc_msgSend(v139, "decodeObjectOfClasses:forKey:", objc_msgSend(v140, "setWithObjects:", v141, v142, objc_opt_class(), 0), *MEMORY[0x1E4F284E8]);
        [v139 finishDecoding];
      }
      else
      {
        ABDiagnosticsEnabled();
        _ABLog2(4, (uint64_t)"-[ABVCardRecord _copyVCardRepresentationAsStringIncludeExternalProperties:withPhoto:extraPhotoParameters:includePrivateData:includeWallpaper:]", 2757, 0, @"Error trying to decode external representation: %@", v143, v144, v145, v197);
        v188 = 0;
      }

      long long v195 = 0u;
      long long v196 = 0u;
      long long v193 = 0u;
      long long v194 = 0u;
      v146 = (void *)[v188 allKeys];
      uint64_t v147 = [v146 countByEnumeratingWithState:&v193 objects:v200 count:16];
      if (v147)
      {
        id objc = v146;
        uint64_t v186 = *(void *)v194;
        do
        {
          for (iCFIndex i = 0; ii != v147; ++ii)
          {
            if (*(void *)v194 != v186) {
              objc_enumerationMutation(objc);
            }
            uint64_t v149 = *(void *)(*((void *)&v193 + 1) + 8 * ii);
            v150 = (void *)[v188 objectForKey:v149];
            long long v191 = 0u;
            long long v192 = 0u;
            long long v189 = 0u;
            long long v190 = 0u;
            uint64_t v151 = [v150 countByEnumeratingWithState:&v189 objects:v199 count:16];
            if (v151)
            {
              uint64_t v152 = *(void *)v190;
              do
              {
                for (jCFIndex j = 0; jj != v151; ++jj)
                {
                  if (*(void *)v190 != v152) {
                    objc_enumerationMutation(v150);
                  }
                  [(ABVCardRecord *)self _appendPropValue:*(void *)(*((void *)&v189 + 1) + 8 * jj) forPropKey:v149 toOutString:v8 usingDelimiter:@"\r\n" inGroup:0];
                }
                uint64_t v151 = [v150 countByEnumeratingWithState:&v189 objects:v199 count:16];
              }
              while (v151);
            }
          }
          uint64_t v147 = [objc countByEnumeratingWithState:&v193 objects:v200 count:16];
        }
        while (v147);
      }
    }
  }
  if (v176)
  {
    v154 = [(ABVCardRecord *)self valueForProperty:kABPersonPhonemeDataProperty];
    v155 = v154;
    if (v154)
    {
      if (([v154 isEqualToString:&stru_1EF03E278] & 1) == 0)
      {
        [v8 appendString:@"X-ADDRESSBOOKSERVER-PHONEME-DATA:"];
        objc_msgSend(v8, "appendString:", objc_msgSend(v155, "abVCardKoshify"));
        [v8 appendString:@"\r\n"];
      }
    }
  }
  v156 = [(ABVCardRecord *)self valueForProperty:kABPersonAlternateBirthdayProperty];
  if ([v156 count]
    && [(ABVCardRecord *)self _showField:kABPersonAlternateBirthdayProperty])
  {
    [v8 appendString:@"X-ALTBDAY;"];
    objc_msgSend(v8, "appendString:", -[ABVCardRecord stringFromAlternateBirthday:](self, "stringFromAlternateBirthday:", v156));
    [v8 appendString:@"\r\n"];
  }
  if (v176)
  {
    v157 = [(ABVCardRecord *)self valueForProperty:kABPersonMapsDataProperty];
    v158 = v157;
    if (v157 && ([v157 isEqualToString:&stru_1EF03E278] & 1) == 0)
    {
      [v8 appendString:@"X-APPLE-MAPS-DATA:"];
      objc_msgSend(v8, "appendString:", objc_msgSend(v158, "abVCardKoshify"));
      [v8 appendString:@"\r\n"];
    }
    id v159 = [(ABVCardRecord *)self dataForSoundProperty:[(ABVCardRecord *)self valueForProperty:kABPersonSoundProperty]];
    id v160 = v159;
    if (v159 && [v159 length])
    {
      v161 = (void *)[[NSString alloc] initWithData:v160 encoding:1];
      [v8 appendString:v161];
    }
    v162 = [(ABVCardRecord *)self valueForProperty:kABPersonDowntimeWhitelistProperty];
    v163 = v162;
    if (v162 && [v162 length])
    {
      if ([v163 isEqualToString:@"true"]) {
        v164 = @"X-APPLE-GUARDIAN-WHITELISTED:true";
      }
      else {
        v164 = @"X-APPLE-GUARDIAN-WHITELISTED:false";
      }
      [v8 appendString:v164];
      [v8 appendString:@"\r\n"];
    }
    v165 = [(ABVCardRecord *)self valueForProperty:kABPersonImageTypeProperty];
    v166 = v165;
    if (v165 && ([v165 isEqualToString:&stru_1EF03E278] & 1) == 0)
    {
      [v8 appendString:@"X-IMAGETYPE:"];
      objc_msgSend(v8, "appendString:", objc_msgSend(v166, "abVCardKoshify"));
      [v8 appendString:@"\r\n"];
    }
    v167 = [(ABVCardRecord *)self valueForProperty:kABPersonImageHashProperty];
    v168 = v167;
    if (v167 && [v167 length])
    {
      [v8 appendString:@"X-IMAGEHASH:"];
      objc_msgSend(v8, "appendString:", objc_msgSend((id)objc_msgSend(v168, "base64EncodedStringWithOptions:", 0), "abVCardKoshify"));
      [v8 appendString:@"\r\n"];
    }
  }
  [v8 appendString:@"END:VCARD"];
  [v8 appendString:@"\r\n"];
  id v169 = (id)[v8 abStringByStrippingControlCharacters];

  return v169;
}

- (id)_copyGroupVCardRepresentationAsStringIncludeExternalProperties:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v5 appendString:@"BEGIN:VCARD"];
  [v5 appendString:@"\r\n"];
  [v5 appendString:@"VERSION:3.0"];
  [v5 appendString:@"\r\n"];
  [v5 appendString:@"X-ADDRESSBOOKSERVER-KIND:group"];
  [v5 appendString:@"\r\n"];
  [v5 appendString:@"PRODID:"];
  objc_msgSend(v5, "appendString:", -[ABVCardRecord _prodID](self, "_prodID"));
  [v5 appendString:@"\r\n"];
  id v6 = [(ABVCardRecord *)self valueForProperty:kABGroupNameProperty];
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = &stru_1EF03E278;
  }
  [v5 appendString:@"N:"];
  [v5 appendString:v7];
  [v5 appendString:@"\r\n"];
  [v5 appendString:@"FN:"];
  [v5 appendString:v7];
  [v5 appendString:@"\r\n"];
  if (v3)
  {
    id v8 = [(ABVCardRecord *)self valueForProperty:kABGroupExternalUUIDProperty];
    if ([v8 length])
    {
      [v5 appendString:@"UID:"];
      objc_msgSend(v5, "appendString:", objc_msgSend(v8, "abVCardKoshify"));
      [v5 appendString:@"\r\n"];
    }
    CFStringEncoding v9 = [(ABVCardRecord *)self valueForProperty:kABGroupExternalRepresentationProperty];
    if (v9)
    {
      uint64_t v45 = 0;
      CFTypeRef v10 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v9 error:&v45];
      if (v10)
      {
        id v11 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = objc_opt_class();
        id v34 = objc_msgSend(v10, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0), *MEMORY[0x1E4F284E8]);
        [v10 finishDecoding];
      }
      else
      {
        ABDiagnosticsEnabled();
        _ABLog2(4, (uint64_t)"-[ABVCardRecord _copyGroupVCardRepresentationAsStringIncludeExternalProperties:]", 2912, 0, @"Error trying to decode external representation: %@", v14, v15, v16, v45);
        id v34 = 0;
      }

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v17 = (void *)[v34 allKeys];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v18)
      {
        obuint64_t j = v17;
        uint64_t v36 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v42 != v36) {
              objc_enumerationMutation(obj);
            }
            long long v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            if ([v20 compare:@"X-ADDRESSBOOKSERVER-KIND" options:1])
            {
              if ([v20 compare:@"X-ADDRESSBOOKSERVER-MEMBER" options:1])
              {
                long long v21 = (void *)[v34 objectForKey:v20];
                long long v39 = 0u;
                long long v40 = 0u;
                long long v37 = 0u;
                long long v38 = 0u;
                uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v46 count:16];
                if (v22)
                {
                  uint64_t v23 = *(void *)v38;
                  do
                  {
                    for (uint64_t j = 0; j != v22; ++j)
                    {
                      if (*(void *)v38 != v23) {
                        objc_enumerationMutation(v21);
                      }
                      [(ABVCardRecord *)self _appendPropValue:*(void *)(*((void *)&v37 + 1) + 8 * j) forPropKey:v20 toOutString:v5 usingDelimiter:@"\r\n" inGroup:0];
                    }
                    uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v46 count:16];
                  }
                  while (v22);
                }
              }
            }
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v18);
      }
    }
    CFArrayRef v25 = ABGroupCopyArrayOfAllMembers(self->_record);
    CFArrayRef v26 = v25;
    if (v25)
    {
      CFIndex Count = CFArrayGetCount(v25);
      if (Count >= 1)
      {
        CFIndex v28 = 0;
        ABPropertyID v29 = kABPersonExternalUUIDProperty;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v26, v28);
          id v31 = (void *)ABRecordCopyValue(ValueAtIndex, v29);
          if (v31)
          {
            [v5 appendString:@"X-ADDRESSBOOKSERVER-MEMBER:urn:uuid:"];
            objc_msgSend(v5, "appendString:", objc_msgSend(v31, "abVCardKoshify"));
            [v5 appendString:@"\r\n"];
          }

          ++v28;
        }
        while (Count != v28);
      }
      CFRelease(v26);
    }
  }
  [v5 appendString:@"END:VCARD"];
  [v5 appendString:@"\r\n"];
  id v32 = (id)[v5 abStringByStrippingControlCharacters];

  return v32;
}

@end