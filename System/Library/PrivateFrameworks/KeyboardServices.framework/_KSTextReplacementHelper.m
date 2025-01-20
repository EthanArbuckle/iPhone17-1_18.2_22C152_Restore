@interface _KSTextReplacementHelper
+ (id)aggdPrefix;
+ (id)appleLanguagesPreference;
+ (id)errorStringForCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4;
+ (id)errorWithCode:(int64_t)a3 failedAdds:(id)a4 failedDeletes:(id)a5;
+ (id)errorWithCode:(int64_t)a3 forEntry:(id)a4;
+ (id)fetchConfigurationPlist;
+ (id)multipleAddErrors:(id)a3 removeErrors:(id)a4;
+ (id)sampleShortcut;
+ (id)textReplaceEntryFromTIDictionaryValue:(id)a3;
+ (id)transactionFromTextReplacementEntry:(id)a3 forDelete:(BOOL)a4;
+ (int64_t)validateTextReplacement:(id)a3;
+ (void)extractAggdMetricsForTextReplacement:(id)a3;
+ (void)fetchConfigurationPlistIfNeeded;
+ (void)logAggdValueForSyncIsPull:(BOOL)a3 success:(BOOL)a4;
+ (void)logPhraseWordCount:(int64_t)a3;
@end

@implementation _KSTextReplacementHelper

+ (int64_t)validateTextReplacement:(id)a3
{
  id v3 = a3;
  v4 = [v3 phrase];
  v5 = [v3 shortcut];

  uint64_t v6 = [v4 length] == 0;
  if ((unint64_t)[v4 length] > 0x7D0) {
    uint64_t v6 = 3;
  }
  if ((unint64_t)[v5 length] > 0x7D0) {
    uint64_t v6 = 5;
  }
  if (v6) {
    goto LABEL_6;
  }
  int v9 = [v4 _containsIdeographicCharacters];
  v10 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" "];
  v11 = [v4 stringByTrimmingCharactersInSet:v10];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    if ([v5 length]) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = v12 == 1;
    }
    if (v13) {
      int v14 = v9;
    }
    else {
      int v14 = 1;
    }
    if (v14 == 1)
    {
      if (v5)
      {
        v15 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        uint64_t v16 = [v5 rangeOfCharacterFromSet:v15];

        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v6 = 4;
          goto LABEL_6;
        }
      }
      if ([v5 _containsEmoji])
      {
        uint64_t v6 = 7;
      }
      else
      {
        char v17 = [v5 _containsCJKSymbolsAndPunctuation];
        if (v17 & 1) != 0 || ((v9 ^ 1))
        {
          if (v17)
          {
            uint64_t v6 = 8;
            goto LABEL_6;
          }
        }
        else if (![v5 length])
        {
          uint64_t v6 = 9;
          goto LABEL_6;
        }
        if (![v5 _containsIdeographicCharacters])
        {
          uint64_t v6 = 0;
          goto LABEL_9;
        }
        uint64_t v6 = 6;
      }
    }
    else
    {
      uint64_t v6 = 3;
    }
  }
  else
  {
    uint64_t v6 = 2;
  }
LABEL_6:
  v7 = KSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    +[_KSTextReplacementHelper validateTextReplacement:](v6, v7);
  }

LABEL_9:
  return v6;
}

+ (id)errorStringForCode:(int64_t)a3
{
  if ((unint64_t)(a3 + 2) > 0xE) {
    return @"_KSTextReplacementErrorNone";
  }
  else {
    return off_264891938[a3 + 2];
  }
}

+ (id)textReplaceEntryFromTIDictionaryValue:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_KSTextReplacementEntry);
  v5 = [v3 phrase];
  [(_KSTextReplacementEntry *)v4 setPhrase:v5];

  uint64_t v6 = [v3 shortcut];
  [(_KSTextReplacementEntry *)v4 setShortcut:v6];

  v7 = [v3 timestamp];

  [(_KSTextReplacementEntry *)v4 setTimestamp:v7];
  return v4;
}

+ (id)transactionFromTextReplacementEntry:(id)a3 forDelete:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(_KSTIUserDictionaryEntryValue);
  v7 = [v5 phrase];
  [(_KSTIUserDictionaryEntryValue *)v6 setPhrase:v7];

  uint64_t v8 = [v5 shortcut];
  if (!v8
    || (int v9 = (void *)v8,
        [v5 shortcut],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isEqualToString:&stru_26DE8B7B0],
        v10,
        v9,
        v11))
  {
    uint64_t v12 = [v5 phrase];
    [v5 setShortcut:v12];
  }
  BOOL v13 = [v5 shortcut];
  [(_KSTIUserDictionaryEntryValue *)v6 setShortcut:v13];

  int v14 = [v5 timestamp];
  [(_KSTIUserDictionaryEntryValue *)v6 setTimestamp:v14];

  v15 = objc_alloc_init(_KSTIUserDictionaryTransaction);
  uint64_t v16 = v15;
  if (a4) {
    [(_KSTIUserDictionaryTransaction *)v15 setValueToDelete:v6];
  }
  else {
    [(_KSTIUserDictionaryTransaction *)v15 setValueToInsert:v6];
  }

  return v16;
}

+ (id)errorWithCode:(int64_t)a3 forEntry:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F087E8];
  int v11 = @"_KSTextReplacementEntryDidFailErrorKey";
  v12[0] = a4;
  uint64_t v6 = NSDictionary;
  id v7 = a4;
  uint64_t v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  int v9 = [v5 errorWithDomain:@"KSTextReplacementErrorDomain" code:a3 userInfo:v8];

  return v9;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F08338];
  v12[0] = a4;
  uint64_t v6 = NSDictionary;
  id v7 = a4;
  uint64_t v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  int v9 = [v5 errorWithDomain:@"KSTextReplacementErrorDomain" code:a3 userInfo:v8];

  return v9;
}

+ (id)errorWithCode:(int64_t)a3 failedAdds:(id)a4 failedDeletes:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  int v9 = [MEMORY[0x263EFF9A0] dictionary];
  if ([v7 count]) {
    [v9 setObject:v7 forKeyedSubscript:@"_KSTextReplacementUpdateDidFailEntriesKey"];
  }
  if ([v8 count]) {
    [v9 setObject:v8 forKeyedSubscript:@"_KSTextReplacementDeleteDidFailEntriesKey"];
  }
  v10 = [MEMORY[0x263F087E8] errorWithDomain:@"KSTextReplacementErrorDomain" code:a3 userInfo:v9];

  return v10;
}

+ (id)multipleAddErrors:(id)a3 removeErrors:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  if ([v5 count]) {
    [v7 setObject:v5 forKeyedSubscript:@"_KSTextReplacementUpdateDidFailErrorsKey"];
  }
  if ([v6 count]) {
    [v7 setObject:v6 forKeyedSubscript:@"_KSTextReplacementDeleteDidFailErrorsKey"];
  }
  id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"KSTextReplacementErrorDomain" code:11 userInfo:v7];

  return v8;
}

+ (void)extractAggdMetricsForTextReplacement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 phrase];
  objc_msgSend(a1, "logPhraseWordCount:", objc_msgSend(v5, "wordCount"));

  id v6 = [v4 shortcut];

  uint64_t v7 = [v6 length];
  if (!v7)
  {
    id v8 = [NSString stringWithFormat:@"%@.phraseOnly", @"com.apple.keyboard.textReplacement"];
    +[_KSAggdLogger addValue:1 forDistributionKey:v8];
  }
}

+ (void)logPhraseWordCount:(int64_t)a3
{
  if (logPhraseWordCount__onceToken != -1) {
    dispatch_once(&logPhraseWordCount__onceToken, &__block_literal_global_9);
  }
  if ((unint64_t)(a3 - 1) > 4)
  {
    id v5 = @"sixteenToInf";
    if ((unint64_t)a3 < 0x10) {
      id v5 = @"elevenToFifteen";
    }
    if (a3 >= 11) {
      id v4 = v5;
    }
    else {
      id v4 = @"sixToTen";
    }
  }
  else
  {
    objc_msgSend((id)logPhraseWordCount__keyStringForCount, "objectAtIndexedSubscript:");
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v7 = v4;
  id v6 = [NSString stringWithFormat:@"%@.countWords.%@", @"com.apple.keyboard.textReplacement", v4];
  +[_KSAggdLogger addValue:1 forDistributionKey:v6];
}

+ (id)aggdPrefix
{
  return @"com.apple.keyboard.textReplacement";
}

+ (void)logAggdValueForSyncIsPull:(BOOL)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [MEMORY[0x263F089D8] stringWithString:@"com.apple.keyboard.textReplacement"];
  id v9 = v6;
  if (v5) {
    uint64_t v7 = @".pull";
  }
  else {
    uint64_t v7 = @".push";
  }
  [v6 appendString:v7];
  if (v4) {
    id v8 = @".success";
  }
  else {
    id v8 = @".fail";
  }
  [v9 appendString:v8];
  +[_KSAggdLogger addValue:1 forScalarKey:v9];
}

+ (id)appleLanguagesPreference
{
  CFPropertyListRef v2 = CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x263EFFE48], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  id v3 = (void *)v2;
  if (v2)
  {
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 != CFArrayGetTypeID())
    {
      CFRelease(v3);
      id v3 = 0;
    }
  }
  return v3;
}

+ (id)sampleShortcut
{
  CFPropertyListRef v2 = objc_alloc_init(_KSTextReplacementEntry);
  id v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.TextInput"];
  uint64_t v4 = +[_KSTextReplacementHelper appleLanguagesPreference];
  BOOL v5 = (void *)v4;
  if (v4) {
    NSLog(&cfstr_Applelanguages_0.isa, v4);
  }
  else {
    NSLog(&cfstr_CouldnTReadApp.isa);
  }
  id v6 = (void *)MEMORY[0x263F086E0];
  uint64_t v7 = [v3 localizations];
  id v8 = [v6 preferredLocalizationsFromArray:v7 forPreferences:v5];

  NSLog(&cfstr_PreferredLocal.isa, v8);
  if ([v8 count])
  {
    id v9 = [v8 objectAtIndex:0];
    v10 = [v3 pathForResource:@"TIUserDictionarySampleShortcuts" ofType:@"plist" inDirectory:0 forLocalization:v9];

    NSLog(&cfstr_LoadingSampleS.isa, v10);
    if (v10)
    {
      uint64_t v11 = [NSDictionary dictionaryWithContentsOfFile:v10];
      uint64_t v12 = [v11 objectForKey:@"_LOCALIZABLE_"];

      BOOL v13 = [v12 objectForKey:@"shortcut"];
      [(_KSTextReplacementEntry *)v2 setShortcut:v13];

      int v14 = [v12 objectForKey:@"target"];
      [(_KSTextReplacementEntry *)v2 setPhrase:v14];
    }
  }
  else
  {
    NSLog(&cfstr_LoadingSampleS.isa, 0);
  }

  return v2;
}

+ (void)fetchConfigurationPlistIfNeeded
{
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  id v3 = +[_KSUtilities userDefaultsSuiteName];
  uint64_t v4 = (void *)[v2 initWithSuiteName:v3];

  BOOL v5 = [MEMORY[0x263EFF910] date];
  id v6 = [v4 objectForKey:@"configPullTime"];
  [v5 timeIntervalSinceDate:v6];
  if (!v6 || fabs(v7) >= 86400.0)
  {
    id v8 = +[_KSTextReplacementHelper fetchConfigurationPlist];
    if (v8)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __59___KSTextReplacementHelper_fetchConfigurationPlistIfNeeded__block_invoke;
      v13[3] = &unk_264890C78;
      id v9 = v4;
      id v14 = v9;
      [v8 enumerateKeysAndObjectsUsingBlock:v13];
      v10 = [MEMORY[0x263EFF910] date];
      [v9 setObject:v10 forKey:@"configPullTime"];

      uint64_t v11 = [v8 allKeys];
      if ([v11 containsObject:@"osxMajorVersForCloudKitSync"])
      {
      }
      else
      {
        uint64_t v12 = [v9 objectForKey:@"osxMajorVersForCloudKitSync"];

        if (!v12)
        {
          [v9 setInteger:10 forKey:@"osxMajorVersForCloudKitSync"];
          [v9 setInteger:12 forKey:@"osxMinorVersForCloudKitSync"];
          [v9 setInteger:2 forKey:@"osxMinorSubversionForCloudKitSync"];
          [v9 setInteger:10 forKey:@"iOSMajorVersForCloudKitSync"];
          [v9 setInteger:2 forKey:@"iOSMinorVersForCloudKitSync"];
        }
      }
    }
  }
}

+ (id)fetchConfigurationPlist
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = KSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "+[_KSTextReplacementHelper fetchConfigurationPlist]";
    _os_log_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_INFO, "%s  Fetching configuration plist", buf, 0xCu);
  }

  id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v4 = [NSURL URLWithString:@"https://configuration.apple.com/configurations/internetservices/cloudkit/textinput/textinput-1.0.plist"];
  BOOL v5 = (void *)[v3 initWithContentsOfURL:v4];

  if (v5)
  {
    id v9 = 0;
    id v6 = [MEMORY[0x263F08AC0] propertyListWithData:v5 options:0 format:0 error:&v9];
    id v7 = v9;
  }
  else
  {
    id v7 = 0;
    id v6 = 0;
  }

  return v6;
}

+ (void)validateTextReplacement:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = +[_KSTextReplacementHelper errorStringForCode:a1];
  int v4 = 136315394;
  BOOL v5 = "+[_KSTextReplacementHelper validateTextReplacement:]";
  __int16 v6 = 2112;
  id v7 = v3;
  _os_log_error_impl(&dword_22B2BC000, a2, OS_LOG_TYPE_ERROR, "%s  >>> ERROR: invalid TR entry, error: %@", (uint8_t *)&v4, 0x16u);
}

@end