@interface CNiOSABContactsUserDefaultsABWrapper
- (BOOL)ABPersonGetShortNameFormatEnabled;
- (BOOL)ABPersonGetShortNamePreferNicknames;
- (id)abDefaultCountryCode;
- (id)displayedContactsFilterRepresentationPref;
- (int64_t)lastIgnoredNewDuplicatesCount;
- (unsigned)ABPersonGetCompositeNameFormatForRecord:(void *)a3;
- (unsigned)ABPersonGetEditNameFormat;
- (unsigned)ABPersonGetShortNameFormat;
- (void)ABPersonSetCompositeNameFormat:(unsigned int)a3;
- (void)ABPersonSetShortNameFormat:(unsigned int)a3;
- (void)ABPersonSetShortNameFormatEnabled:(BOOL)a3;
- (void)ABPersonSetShortNamePreferNicknames:(BOOL)a3;
- (void)setDisplayedContactsFilterRepresentationPref:(id)a3;
- (void)setLastIgnoredNewDuplicatesCount:(int64_t)a3;
@end

@implementation CNiOSABContactsUserDefaultsABWrapper

- (BOOL)ABPersonGetShortNamePreferNicknames
{
  return MEMORY[0x1F4107000](self, a2);
}

- (BOOL)ABPersonGetShortNameFormatEnabled
{
  return MEMORY[0x1F4106FF8](self, a2);
}

- (id)displayedContactsFilterRepresentationPref
{
  CFStringRef v2 = (const __CFString *)ABPeoplePickerPrefs();
  v3 = (void *)CFPreferencesCopyAppValue(@"displayedGroupRepresentation", v2);

  return v3;
}

- (unsigned)ABPersonGetCompositeNameFormatForRecord:(void *)a3
{
  return ABPersonGetCompositeNameFormatForRecord(a3);
}

- (void)ABPersonSetCompositeNameFormat:(unsigned int)a3
{
}

- (unsigned)ABPersonGetEditNameFormat
{
  return MEMORY[0x1F4106FE0](self, a2);
}

- (void)ABPersonSetShortNameFormat:(unsigned int)a3
{
}

- (unsigned)ABPersonGetShortNameFormat
{
  return MEMORY[0x1F4106FF0](self, a2);
}

- (void)ABPersonSetShortNameFormatEnabled:(BOOL)a3
{
}

- (void)ABPersonSetShortNamePreferNicknames:(BOOL)a3
{
}

- (id)abDefaultCountryCode
{
  return (id)[MEMORY[0x1E4F498A0] abDefaultCountryCode];
}

- (void)setDisplayedContactsFilterRepresentationPref:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = (const __CFString *)ABPeoplePickerPrefs();
  CFPreferencesSetAppValue(@"displayedGroupRepresentation", v3, v4);

  CFStringRef v5 = (const __CFString *)ABPeoplePickerPrefs();

  CFPreferencesAppSynchronize(v5);
}

- (int64_t)lastIgnoredNewDuplicatesCount
{
  CFStringRef v2 = (const __CFString *)ABPeoplePickerPrefs();

  return CFPreferencesGetAppIntegerValue(@"lastIgnoredNewDuplicatesCount", v2, 0);
}

- (void)setLastIgnoredNewDuplicatesCount:(int64_t)a3
{
  id v3 = (const void *)[NSNumber numberWithInteger:a3];
  CFStringRef v4 = (const __CFString *)ABPeoplePickerPrefs();
  CFPreferencesSetAppValue(@"lastIgnoredNewDuplicatesCount", v3, v4);
  CFStringRef v5 = (const __CFString *)ABPeoplePickerPrefs();

  CFPreferencesAppSynchronize(v5);
}

@end