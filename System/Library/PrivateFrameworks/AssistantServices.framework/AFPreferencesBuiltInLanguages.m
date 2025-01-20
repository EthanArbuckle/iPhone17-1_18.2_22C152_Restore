@interface AFPreferencesBuiltInLanguages
@end

@implementation AFPreferencesBuiltInLanguages

void ___AFPreferencesBuiltInLanguages_block_invoke()
{
  v4[39] = *MEMORY[0x1E4F143B8];
  if (AFIsHorseman_onceToken != -1) {
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
  }
  if (AFIsHorseman_isHorseman)
  {
    v4[0] = @"en-US";
    v4[1] = @"en-GB";
    v4[2] = @"en-AU";
    v4[3] = @"en-CA";
    v4[4] = @"fr-FR";
    v4[5] = @"de-DE";
    v4[6] = @"fr-CA";
    v4[7] = @"es-US";
    v4[8] = @"es-MX";
    v4[9] = @"es-ES";
    v4[10] = @"zh-CN";
    v4[11] = @"yue-CN";
    v4[12] = @"zh-HK";
    v4[13] = @"ja-JP";
    v4[14] = @"zh-TW";
    v4[15] = @"en-IN";
    v4[16] = @"en-IE";
    v4[17] = @"en-NZ";
    v4[18] = @"de-AT";
    v4[19] = @"it-IT";
    v4[20] = @"ru-RU";
    v4[21] = @"nl-NL";
    v4[22] = @"nl-BE";
    v4[23] = @"fr-BE";
    v4[24] = @"fr-CH";
    v4[25] = @"de-CH";
    v4[26] = @"it-CH";
    v4[27] = @"nb-NO";
    v4[28] = @"sv-SE";
    v4[29] = @"en-ZA";
    v4[30] = @"es-CL";
    v4[31] = @"fi-FI";
    v4[32] = @"en-SG";
    v4[33] = @"da-DK";
    v4[34] = @"he-IL";
    v4[35] = @"th-TH";
    v4[36] = @"ar-SA";
    v4[37] = @"tr-TR";
    v4[38] = @"ms-MY";
    uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:39];
    v1 = (void *)_AFPreferencesBuiltInLanguages_sStaticLanguages;
    _AFPreferencesBuiltInLanguages_sStaticLanguages = v0;
  }
  else
  {
    uint64_t v2 = _AFPreferencesBuiltIniOSLanguages();
    v3 = (void *)_AFPreferencesBuiltInLanguages_sStaticLanguages;
    _AFPreferencesBuiltInLanguages_sStaticLanguages = v2;
  }
}

@end