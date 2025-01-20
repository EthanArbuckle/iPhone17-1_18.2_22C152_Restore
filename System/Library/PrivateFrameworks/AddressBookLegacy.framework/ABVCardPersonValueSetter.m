@interface ABVCardPersonValueSetter
+ (__CFArray)supportedProperties;
- (ABVCardPersonValueSetter)initWithPerson:(void *)a3;
- (BOOL)setImageData:(id)a3 cropRectX:(int)a4 cropRectY:(int)a5 cropRectWidth:(int)a6 cropRectHeight:(int)a7;
- (BOOL)setValue:(void *)a3 forProperty:(unsigned int)a4;
- (__CFArray)foundProperties;
- (id)fullName;
- (id)imageData;
- (void)dealloc;
- (void)setValueInTemporaryCache:(id)a3 forProperty:(unsigned int)a4;
- (void)valueForProperty:(unsigned int)a3;
@end

@implementation ABVCardPersonValueSetter

- (ABVCardPersonValueSetter)initWithPerson:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ABVCardPersonValueSetter;
  v4 = [(ABVCardPersonValueSetter *)&v6 init];
  if (a3) {
    CFRetain(a3);
  }
  v4->_person = a3;
  v4->_properties = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  return v4;
}

- (__CFArray)foundProperties
{
  return self->_properties;
}

- (void)dealloc
{
  person = self->_person;
  if (person) {
    CFRelease(person);
  }
  properties = self->_properties;
  if (properties) {
    CFRelease(properties);
  }
  v5.receiver = self;
  v5.super_class = (Class)ABVCardPersonValueSetter;
  [(ABVCardPersonValueSetter *)&v5 dealloc];
}

+ (__CFArray)supportedProperties
{
  if (supportedProperties_onceToken_0 != -1) {
    dispatch_once(&supportedProperties_onceToken_0, &__block_literal_global_769);
  }
  return (__CFArray *)supportedProperties_retVal_0;
}

CFArrayRef __47__ABVCardPersonValueSetter_supportedProperties__block_invoke()
{
  values[46] = *(void **)MEMORY[0x1E4F143B8];
  values[0] = (void *)kABPersonKindProperty;
  values[1] = (void *)kABPersonFirstNameProperty;
  values[2] = (void *)kABPersonMiddleNameProperty;
  values[3] = (void *)kABPersonLastNameProperty;
  values[4] = (void *)kABPersonPrefixProperty;
  values[5] = (void *)kABPersonSuffixProperty;
  values[6] = (void *)kABPersonNicknameProperty;
  values[7] = (void *)kABPersonPreviousFamilyNameProperty;
  values[8] = (void *)kABPersonFirstNamePhoneticProperty;
  values[9] = (void *)kABPersonMiddleNamePhoneticProperty;
  values[10] = (void *)kABPersonLastNamePhoneticProperty;
  values[11] = (void *)kABPersonFirstNamePronunciationProperty;
  values[12] = (void *)kABPersonMiddleNamePronunciationProperty;
  values[13] = (void *)kABPersonLastNamePronunciationProperty;
  values[14] = (void *)kABPersonAddressingGrammarProperty;
  values[15] = (void *)kABPersonOrganizationProperty;
  values[16] = (void *)kABPersonOrganizationPhoneticProperty;
  values[17] = (void *)kABPersonOrganizationPronunciationProperty;
  values[18] = (void *)kABPersonJobTitleProperty;
  values[19] = (void *)kABPersonDepartmentProperty;
  values[20] = (void *)kABPersonPhoneProperty;
  values[21] = (void *)kABPersonEmailProperty;
  values[22] = (void *)kABPersonAddressProperty;
  values[23] = (void *)kABPersonURLProperty;
  values[24] = (void *)kABPersonDateProperty;
  values[25] = (void *)kABPersonBirthdayProperty;
  values[26] = (void *)kABPersonNoteProperty;
  values[27] = (void *)kABPersonSocialProfileProperty;
  values[28] = (void *)kABPersonInstantMessageProperty;
  values[29] = (void *)kABPersonRelatedNamesProperty;
  values[30] = (void *)kABPersonExternalIdentifierProperty;
  values[31] = (void *)kABPersonExternalUUIDProperty;
  values[32] = (void *)kABPersonExternalRepresentationProperty;
  values[33] = (void *)kABPersonImageURIProperty;
  values[34] = (void *)kABPersonPhonemeDataProperty;
  values[35] = (void *)kABPersonAlternateBirthdayProperty;
  values[36] = (void *)kABPersonMapsDataProperty;
  values[37] = (void *)kABPersonSoundProperty;
  values[38] = (void *)kABPersonDowntimeWhitelistProperty;
  values[39] = (void *)kABPersonImageTypeProperty;
  values[40] = (void *)kABPersonImageHashProperty;
  values[41] = (void *)kABPersonMemojiMetadataProperty;
  values[42] = (void *)kABPersonWallpaperProperty;
  values[43] = (void *)kABPersonWallpaperURIProperty;
  values[44] = (void *)kABPersonDisplayFlagsProperty;
  values[45] = (void *)kABPersonSensitiveContentConfigurationProperty;
  CFArrayRef result = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)values, 46, 0);
  supportedProperties_retVal_0 = (uint64_t)result;
  return result;
}

- (BOOL)setValue:(void *)a3 forProperty:(unsigned int)a4
{
  v7 = +[ABVCardPersonValueSetter supportedProperties];
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
    BOOL v9 = ABRecordSetValue(self->_person, a4, a3, 0);
    if (v9)
    {
      CFArrayAppendValue(self->_properties, (const void *)(int)a4);
      LOBYTE(v9) = 1;
    }
  }
  return v9;
}

- (void)valueForProperty:(unsigned int)a3
{
  v3 = (void *)ABRecordCopyValue(self->_person, a3);
  return v3;
}

- (BOOL)setImageData:(id)a3 cropRectX:(int)a4 cropRectY:(int)a5 cropRectWidth:(int)a6 cropRectHeight:(int)a7
{
  person = self->_person;
  if (a6 && a7) {
    return ABPersonSetImageDataWithInvertedCropRect(person, 2, (const __CFData *)a3, a4, a5, a6, a7);
  }
  else {
    return ABPersonSetImageData(person, (CFDataRef)a3, 0);
  }
}

- (id)imageData
{
  CFDataRef v2 = ABPersonCopyImageData(self->_person);
  return v2;
}

- (id)fullName
{
  return 0;
}

- (void)setValueInTemporaryCache:(id)a3 forProperty:(unsigned int)a4
{
  if (ABDiagnosticsEnabled()) {
    _ABLog2(6, (uint64_t)"-[ABVCardPersonValueSetter setValueInTemporaryCache:forProperty:]", 3454, 0, @"%s", v4, v5, v6, (uint64_t)"-[ABVCardPersonValueSetter setValueInTemporaryCache:forProperty:]");
  }
}

@end