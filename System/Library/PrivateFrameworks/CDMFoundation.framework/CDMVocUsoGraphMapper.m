@interface CDMVocUsoGraphMapper
+ (id)buildAppNameUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8;
+ (id)buildAttachmentTypeUSOGraph:(id)a3 withSemantic:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6;
+ (id)buildContactTypeUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8;
+ (id)buildDecimalRegexUSOGraphWithIdentifier:(id)a3 withInput:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6;
+ (id)buildDeviceCategoryUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8;
+ (id)buildEmailAddressRegexUSOGraphWithIdentifier:(id)a3 withInput:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6;
+ (id)buildEmailContactUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8;
+ (id)buildEmergencyPhoneNumberUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8;
+ (id)buildEmergencyPhonePersonUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8;
+ (id)buildFractionNumberUSOGraphWithIdentifier:(id)a3 withFractionSemantic:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6;
+ (id)buildIntegerRegexUSOGraphWithIdentifier:(id)a3 withInput:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6;
+ (id)buildPersonRelationshipUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8;
+ (id)buildPhoneContactUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8;
+ (id)buildPhoneNumberRegexUSOGraphWithIdentifier:(id)a3 withInput:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6;
+ (id)buildRootUSOGraphWithStartCharIndex:(unsigned int)a3 withEndCharIndex:(unsigned int)a4;
+ (id)buildSettingUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8;
+ (id)buildSmsAttributesUSOGraph:(id)a3 withFractionSemantic:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6;
+ (id)buildVocUSOGraphForHandsFreeListPosition:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7;
+ (id)buildVocUSOGraphForRegexOrdinal:(unsigned int)a3 withVocLabel:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7;
+ (id)buildVocUSOGraphWithVocLabel:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7;
+ (id)buildVocUSOGraphWithVocLabel:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8;
+ (id)emergencyPhoneNumberSemantic;
+ (id)emergencyPhonePersonSemantic;
+ (id)listPositionSemantic;
+ (id)ordinalsSemantic;
+ (id)settingVocLabel;
+ (unique_ptr<siri::ontology::UsoEntitySpan,)buildEntitySpanWithSemantic:(id)a3 withVocLabel:(id)a4 withStartIndex:(unsigned int)a5 withEndIndex:(unsigned int)a6 withTokenCount:(unsigned int)a7;
+ (unique_ptr<siri::ontology::UsoIdentifier,)buildIdentifierWithSemantic:(id)a3 withVocLabel:(id)a4;
@end

@implementation CDMVocUsoGraphMapper

+ (id)buildVocUSOGraphWithVocLabel:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v17 = [a1 settingVocLabel];
  int v18 = [v17 containsObject:v14];

  if (v18)
  {
    uint64_t v19 = [a1 buildSettingUSOGraphWithIdentifier:v14 withSemantic:v15 withInput:v16 withStartCharIndex:v10 withEndCharIndex:v9 withTokenCount:v8];
LABEL_38:
    v25 = (void *)v19;
    goto LABEL_39;
  }
  if ([v14 isEqualToString:@"contactType"])
  {
    uint64_t v19 = [a1 buildContactTypeUSOGraphWithIdentifier:v14 withSemantic:v15 withInput:v16 withStartCharIndex:v10 withEndCharIndex:v9 withTokenCount:v8];
    goto LABEL_38;
  }
  if ([v14 isEqualToString:@"emailType"])
  {
    uint64_t v19 = [a1 buildEmailContactUSOGraphWithIdentifier:v14 withSemantic:v15 withInput:v16 withStartCharIndex:v10 withEndCharIndex:v9 withTokenCount:v8];
    goto LABEL_38;
  }
  if ([v14 isEqualToString:@"phoneType"])
  {
    uint64_t v19 = [a1 buildPhoneContactUSOGraphWithIdentifier:v14 withSemantic:v15 withInput:v16 withStartCharIndex:v10 withEndCharIndex:v9 withTokenCount:v8];
    goto LABEL_38;
  }
  if ([v14 isEqualToString:@"answerProduct"])
  {
    uint64_t v19 = [a1 buildDeviceCategoryUSOGraphWithIdentifier:v14 withSemantic:v15 withInput:v16 withStartCharIndex:v10 withEndCharIndex:v9 withTokenCount:v8];
    goto LABEL_38;
  }
  v20 = [a1 emergencyPhoneNumberSemantic];
  int v21 = [v20 containsObject:v15];

  if (v21)
  {
    uint64_t v19 = [a1 buildEmergencyPhoneNumberUSOGraphWithIdentifier:v14 withSemantic:v15 withInput:v16 withStartCharIndex:v10 withEndCharIndex:v9 withTokenCount:v8];
    goto LABEL_38;
  }
  v22 = [a1 emergencyPhonePersonSemantic];
  int v23 = [v22 containsObject:v15];

  if (v23)
  {
    uint64_t v19 = [a1 buildEmergencyPhonePersonUSOGraphWithIdentifier:v14 withSemantic:v15 withInput:v16 withStartCharIndex:v10 withEndCharIndex:v9 withTokenCount:v8];
    goto LABEL_38;
  }
  if ([v14 isEqualToString:@"phoneNumber"])
  {
    uint64_t v19 = [a1 buildPhoneNumberRegexUSOGraphWithIdentifier:v14 withInput:v16 withStartCharIndex:v10 withEndCharIndex:v9];
    goto LABEL_38;
  }
  if ([v14 isEqualToString:@"emailAddress"])
  {
    uint64_t v19 = [a1 buildEmailAddressRegexUSOGraphWithIdentifier:v14 withInput:v16 withStartCharIndex:v10 withEndCharIndex:v9];
    goto LABEL_38;
  }
  if ([v14 isEqualToString:@"appName"])
  {
    uint64_t v19 = [a1 buildAppNameUSOGraphWithIdentifier:v14 withSemantic:v15 withInput:v16 withStartCharIndex:v10 withEndCharIndex:v9 withTokenCount:v8];
    goto LABEL_38;
  }
  if ([v14 isEqualToString:@"integer"])
  {
    v24 = [MEMORY[0x263F08B08] scannerWithString:v15];
    int v33 = 0;
    if ([v24 scanInt:&v33])
    {
      if ([v24 isAtEnd])
      {
        v25 = [a1 buildIntegerRegexUSOGraphWithIdentifier:v14 withInput:v15 withStartCharIndex:v10 withEndCharIndex:v9];
        if (v25)
        {

          goto LABEL_39;
        }
      }
    }

    goto LABEL_29;
  }
  if ([v14 isEqualToString:@"decimal"])
  {
    uint64_t v19 = [a1 buildDecimalRegexUSOGraphWithIdentifier:v14 withInput:v15 withStartCharIndex:v10 withEndCharIndex:v9];
    goto LABEL_38;
  }
  v27 = [a1 ordinalsSemantic];
  int v28 = [v27 containsObject:v15];

  if (v28)
  {
    uint64_t v19 = objc_msgSend(a1, "buildVocUSOGraphForRegexOrdinal:withVocLabel:withInput:withStartCharIndex:withEndCharIndex:", objc_msgSend(v15, "intValue"), v14, v16, v10, v9);
    goto LABEL_38;
  }
  if ([v14 isEqualToString:@"personRelationship"])
  {
    uint64_t v19 = [a1 buildPersonRelationshipUSOGraphWithIdentifier:v14 withSemantic:v15 withInput:v16 withStartCharIndex:v10 withEndCharIndex:v9 withTokenCount:v8];
    goto LABEL_38;
  }
  v29 = [a1 listPositionSemantic];
  int v30 = [v29 containsObject:v15];

  if (v30)
  {
    uint64_t v19 = [a1 buildVocUSOGraphForHandsFreeListPosition:v14 withSemantic:v15 withInput:v16 withStartCharIndex:v10 withEndCharIndex:v9];
    goto LABEL_38;
  }
  if ([@"fractional" isEqualToString:v14])
  {
    uint64_t v32 = [a1 buildFractionNumberUSOGraphWithIdentifier:v14 withFractionSemantic:v15 withStartCharIndex:v10 withEndCharIndex:v9];
  }
  else if ([@"smsAttributes" isEqualToString:v14])
  {
    uint64_t v32 = [a1 buildSmsAttributesUSOGraph:v14 withFractionSemantic:v15 withStartCharIndex:v10 withEndCharIndex:v9];
  }
  else
  {
    if (![@"smsSharedEntity" isEqualToString:v14])
    {
LABEL_29:
      v26 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        int v33 = 136315650;
        v34 = "+[CDMVocUsoGraphMapper buildVocUSOGraphWithVocLabel:withSemantic:withInput:withStartCharIndex:withEndCharI"
              "ndex:withTokenCount:]";
        __int16 v35 = 2112;
        id v36 = v14;
        __int16 v37 = 2112;
        id v38 = v15;
        _os_log_debug_impl(&dword_2263A0000, v26, OS_LOG_TYPE_DEBUG, "%s USO not supported for voc label : %@, vocSemantic : %@", (uint8_t *)&v33, 0x20u);
      }

      uint64_t v19 = [a1 buildRootUSOGraphWithStartCharIndex:v10 withEndCharIndex:v9];
      goto LABEL_38;
    }
    uint64_t v32 = [a1 buildAttachmentTypeUSOGraph:v14 withSemantic:v15 withStartCharIndex:v10 withEndCharIndex:v9];
  }
  v25 = (void *)v32;
  if (!v32) {
    goto LABEL_29;
  }
LABEL_39:

  return v25;
}

+ (id)buildVocUSOGraphWithVocLabel:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7
{
  v7 = [a1 buildVocUSOGraphWithVocLabel:a3 withSemantic:a4 withInput:a5 withStartCharIndex:*(void *)&a6 withEndCharIndex:*(void *)&a7 withTokenCount:0];
  return v7;
}

+ (id)buildRootUSOGraphWithStartCharIndex:(unsigned int)a3 withEndCharIndex:(unsigned int)a4
{
}

+ (unique_ptr<siri::ontology::UsoEntitySpan,)buildEntitySpanWithSemantic:(id)a3 withVocLabel:(id)a4 withStartIndex:(unsigned int)a5 withEndIndex:(unsigned int)a6 withTokenCount:(unsigned int)a7
{
  id v8 = a3;
  id v9 = a4;
  std::make_unique[abi:ne180100]<siri::ontology::UsoEntitySpan>();
}

+ (unique_ptr<siri::ontology::UsoIdentifier,)buildIdentifierWithSemantic:(id)a3 withVocLabel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 UTF8String];
  appName();
  operator new();
}

+ (id)buildEmergencyPhonePersonUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
  a3;
  id v10 = a4;
  a5;
  operator new();
}

+ (id)buildEmergencyPhoneNumberUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
  a3;
  id v10 = a4;
  a5;
  operator new();
}

+ (id)buildVocUSOGraphForRegexOrdinal:(unsigned int)a3 withVocLabel:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7
{
}

+ (id)buildFractionNumberUSOGraphWithIdentifier:(id)a3 withFractionSemantic:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6
{
  id v6 = a4;
  operator new();
}

+ (id)buildAttachmentTypeUSOGraph:(id)a3 withSemantic:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6
{
  id v6 = a4;
  operator new();
}

+ (id)buildSmsAttributesUSOGraph:(id)a3 withFractionSemantic:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6
{
  id v6 = a4;
  operator new();
}

+ (id)buildVocUSOGraphForHandsFreeListPosition:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7
{
  id v7 = a4;
  operator new();
}

+ (id)buildIntegerRegexUSOGraphWithIdentifier:(id)a3 withInput:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6
{
  id v6 = a4;
  operator new();
}

+ (id)buildDecimalRegexUSOGraphWithIdentifier:(id)a3 withInput:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6
{
  id v6 = a4;
  operator new();
}

+ (id)buildEmailAddressRegexUSOGraphWithIdentifier:(id)a3 withInput:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6
{
  id v6 = a4;
  operator new();
}

+ (id)buildDeviceCategoryUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
  a3;
  id v10 = a4;
  a5;
  operator new();
}

+ (id)buildPhoneNumberRegexUSOGraphWithIdentifier:(id)a3 withInput:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6
{
  id v6 = a4;
  operator new();
}

+ (id)buildPersonRelationshipUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
}

+ (id)buildSettingUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
  a3;
  id v10 = a4;
  a5;
  operator new();
}

+ (id)buildAppNameUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
  a3;
  id v10 = a4;
  a5;
  operator new();
}

+ (id)buildPhoneContactUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
}

+ (id)buildEmailContactUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
}

+ (id)buildContactTypeUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
}

+ (id)emergencyPhoneNumberSemantic
{
  if (+[CDMVocUsoGraphMapper emergencyPhoneNumberSemantic]::onceToken != -1) {
    dispatch_once(&+[CDMVocUsoGraphMapper emergencyPhoneNumberSemantic]::onceToken, &__block_literal_global_189);
  }
  v2 = (void *)+[CDMVocUsoGraphMapper emergencyPhoneNumberSemantic]::value;
  return v2;
}

uint64_t __52__CDMVocUsoGraphMapper_emergencyPhoneNumberSemantic__block_invoke()
{
  +[CDMVocUsoGraphMapper emergencyPhoneNumberSemantic]::value = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"emergencyNumber", 0);
  return MEMORY[0x270F9A758]();
}

+ (id)ordinalsSemantic
{
  if (+[CDMVocUsoGraphMapper ordinalsSemantic]::onceToken != -1) {
    dispatch_once(&+[CDMVocUsoGraphMapper ordinalsSemantic]::onceToken, &__block_literal_global_112);
  }
  v2 = (void *)+[CDMVocUsoGraphMapper ordinalsSemantic]::value;
  return v2;
}

uint64_t __40__CDMVocUsoGraphMapper_ordinalsSemantic__block_invoke()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17",
    @"18",
    @"19",
    @"20",
    @"21",
    @"22",
    @"23",
    @"24",
    @"25",
  +[CDMVocUsoGraphMapper ordinalsSemantic]::value = 0);
  return MEMORY[0x270F9A758]();
}

+ (id)listPositionSemantic
{
  if (+[CDMVocUsoGraphMapper listPositionSemantic]::onceToken != -1) {
    dispatch_once(&+[CDMVocUsoGraphMapper listPositionSemantic]::onceToken, &__block_literal_global_89);
  }
  v2 = (void *)+[CDMVocUsoGraphMapper listPositionSemantic]::value;
  return v2;
}

uint64_t __44__CDMVocUsoGraphMapper_listPositionSemantic__block_invoke()
{
  +[CDMVocUsoGraphMapper listPositionSemantic]::value = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"current", @"last", @"next", @"previous", @"middle", @"secondToLast", @"thirdToLast", 0);
  return MEMORY[0x270F9A758]();
}

+ (id)emergencyPhonePersonSemantic
{
  if (+[CDMVocUsoGraphMapper emergencyPhonePersonSemantic]::onceToken != -1) {
    dispatch_once(&+[CDMVocUsoGraphMapper emergencyPhonePersonSemantic]::onceToken, &__block_literal_global_69);
  }
  v2 = (void *)+[CDMVocUsoGraphMapper emergencyPhonePersonSemantic]::value;
  return v2;
}

uint64_t __52__CDMVocUsoGraphMapper_emergencyPhonePersonSemantic__block_invoke()
{
  +[CDMVocUsoGraphMapper emergencyPhonePersonSemantic]::value = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"emergency contact", @"emergency services", @"suicide prevention center", @"sexual assault crisis center", @"poison control center", @"domestic violence hotline", 0);
  return MEMORY[0x270F9A758]();
}

+ (id)settingVocLabel
{
  if (+[CDMVocUsoGraphMapper settingVocLabel]::onceToken != -1) {
    dispatch_once(&+[CDMVocUsoGraphMapper settingVocLabel]::onceToken, &__block_literal_global_9680);
  }
  v2 = (void *)+[CDMVocUsoGraphMapper settingVocLabel]::value;
  return v2;
}

uint64_t __39__CDMVocUsoGraphMapper_settingVocLabel__block_invoke()
{
  +[CDMVocUsoGraphMapper settingVocLabel]::value = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"BOOLSettingName", @"BOOLSettingReference", @"BOOLSettingState", @"BOOLSettingVerb", @"floatSettingState", @"floatSettingName", @"multiSettingName", @"settingGroupName", @"settingIdentifier", 0);
  return MEMORY[0x270F9A758]();
}

@end