@interface CN
+ (BOOL)areValidDayComponents:(id)a3 error:(id *)a4;
+ (BOOL)areValidGregorianDayComponents:(id)a3 error:(id *)a4;
+ (BOOL)areValidKeyPaths:(id)a3 forObject:(id)a4 expectedClasses:(id)a5 allowNil:(id)a6 error:(id *)a7;
+ (BOOL)areValidNonGregorianDayComponents:(id)a3 error:(id *)a4;
+ (BOOL)hasContactChineseJapaneseKoreanName:(id)a3;
+ (BOOL)hasContactChineseJapaneseKoreanPhoneticName:(id)a3;
+ (BOOL)isEmptyNameContact:(id)a3 phonetic:(BOOL)a4 includingPrefixAndSuffix:(BOOL)a5;
+ (BOOL)shouldContactUseFamilyGivenNameOrder:(id)a3;
+ (Class)defaultDataMapperClass;
+ (NSArray)restrictedProperties;
+ (NSArray)runtimeOnlyProperties;
+ (id)_unifyContacts:(id)a3 options:(id)a4;
+ (id)addressingGrammarFromEncryptedStringTransform;
+ (id)addressingGrammarFromStringTransform;
+ (id)addressingGrammarToEncryptedStringTransform;
+ (id)addressingGrammarToStringTransform;
+ (id)addressingGrammarsDescription;
+ (id)addressingGrammarsEncryptedDescription;
+ (id)allContactProperties;
+ (id)allContactPropertyKeys;
+ (id)allContainerProperties;
+ (id)allImageDataProperties;
+ (id)allImageDataPropertyKeys;
+ (id)allNameComponentRelatedProperties;
+ (id)allPhoneticNameComponentProperties;
+ (id)allWallpaperProperties;
+ (id)allWallpaperPropertyKeys;
+ (id)alwaysFetchedProperties;
+ (id)birthdayDescription;
+ (id)calendarURIsDescription;
+ (id)callAlertDescription;
+ (id)contactFlagsDescription;
+ (id)contactPropertiesByKey;
+ (id)contactRelationsDescription;
+ (id)contactTypeDescription;
+ (id)contactUnifyingContacts:(id)a3 includingMainStoreContacts:(BOOL)a4 allowMutableContactFreeze:(BOOL)a5;
+ (id)contactUnifyingContacts:(id)a3 options:(id)a4;
+ (id)containerAccountIdentifierDescription;
+ (id)containerConstraintsPathDescription;
+ (id)containerEnabledDescription;
+ (id)containerExternalIdentifierDescription;
+ (id)containerExternalModificationTagDescription;
+ (id)containerExternalSyncDataDescription;
+ (id)containerExternalSyncTagDescription;
+ (id)containerGuardianRestrictedDescription;
+ (id)containerGuardianStateDirtyDescription;
+ (id)containerIdentifierDescription;
+ (id)containerLastSyncDateDescription;
+ (id)containerMeIdentifierDescription;
+ (id)containerNameDescription;
+ (id)containerProviderIdentifierDescription;
+ (id)containerProviderMetadataDescription;
+ (id)containerRestrictionsDescription;
+ (id)containerTypeDescription;
+ (id)containeriOSLegacyIdentifierDescription;
+ (id)creationDateDescription;
+ (id)cropRectDescription;
+ (id)dateComponentsFromDictionaryTransform;
+ (id)dateComponentsToDictionaryTransform;
+ (id)datesDescription;
+ (id)departmentDescription;
+ (id)downtimeWhitelistDescription;
+ (id)emailAddressesDescription;
+ (id)explicitDisplayNameDescription;
+ (id)externalIdentifierDescription;
+ (id)externalImageURIDescription;
+ (id)externalModificationTagDescription;
+ (id)externalRepresentationDescription;
+ (id)externalUUIDDescription;
+ (id)familyNameDescription;
+ (id)fullscreenImageDataDescription;
+ (id)givenNameDescription;
+ (id)groupIdentifiersByLabeledValue:(id)a3 forProperty:(id)a4;
+ (id)iOSLegacyIdentifierDescription;
+ (id)identifierDescription;
+ (id)identifierMapForUnifiedContact:(id)a3 backingContacts:(id)a4;
+ (id)identifierMapForUnifiedMultiValue:(id)a3 backingMultiValues:(id)a4 forProperty:(id)a5;
+ (id)imageBackgroundColorsDataDescription;
+ (id)imageDataAvailableDescription;
+ (id)imageDataDescription;
+ (id)imageHash;
+ (id)imageSyncFailedTimeDescription;
+ (id)imageType;
+ (id)instantMessagAddressesDescription;
+ (id)instantMessageAddressFromDictionaryTransform;
+ (id)instantMessageAddressToDictionaryTransform;
+ (id)isUsingSharedPhotoDescription;
+ (id)jobTitleDescription;
+ (id)joinNonEmptyContactProperties:(id)a3 onContact:(id)a4;
+ (id)joinNonEmptyContactProperties:(id)a3 onContact:(id)a4 withDelimiter:(id)a5;
+ (id)keyVectorForAllUsedKeysForInternationalSupport;
+ (id)linkIdentifierDescription;
+ (id)localizedNameDelimiterForContact:(id)a3;
+ (id)localizedPhoneticNameDelimiterForContact:(id)a3;
+ (id)mapsDataDescription;
+ (id)memojiMetadataDescription;
+ (id)middleNameDescription;
+ (id)modificationDateDescription;
+ (id)multiValueContactProperties;
+ (id)mutableContactUnifyingContacts:(id)a3 includingMainStoreContacts:(BOOL)a4;
+ (id)namePrefixDescription;
+ (id)nameSuffixDescription;
+ (id)nicknameDescription;
+ (id)nonGregorianBirthdayDescription;
+ (id)noteDescription;
+ (id)nullTransform;
+ (id)orderForContactName:(id)a3;
+ (id)orderForContactName:(id)a3 phonetic:(BOOL)a4;
+ (id)orderForContactPhoneticName:(id)a3;
+ (id)organizationNameDescription;
+ (id)phoneNumberFromStringTransform;
+ (id)phoneNumberToStringTransform;
+ (id)phoneNumbersDescription;
+ (id)phonemeDataDescription;
+ (id)phoneticFamilyNameDescription;
+ (id)phoneticGivenNameDescription;
+ (id)phoneticMiddleNameDescription;
+ (id)phoneticOrganizationNameDescription;
+ (id)postalAddressFromDictionaryTransform;
+ (id)postalAddressToDictionaryTransform;
+ (id)postalAddressesDescription;
+ (id)preferredApplePersonaIdentifierDescription;
+ (id)preferredChannelDescription;
+ (id)preferredForImageDescription;
+ (id)preferredForNameDescription;
+ (id)preferredLikenessSourceDescription;
+ (id)previousFamilyNameDescription;
+ (id)pronunciationFamilyNameDescription;
+ (id)pronunciationGivenNameDescription;
+ (id)relatedContactFromStringTransform;
+ (id)relatedContactToStringTransform;
+ (id)requiredPropertiesForNameScriptDetection;
+ (id)requiredPropertiesForPhoneticNameScriptDetection;
+ (id)sectionForSortingByFamilyNameDescription;
+ (id)sectionForSortingByGivenNameDescription;
+ (id)sensitiveContentConfigurationDescription;
+ (id)sensitiveContentConfigurationFromDataTransform;
+ (id)sharedPhotoDisplayPreferenceDescription;
+ (id)singleValueContactProperties;
+ (id)socialProfileFromDictionaryTransform;
+ (id)socialProfileToDictionaryTransform;
+ (id)socialProfileToFoundationProfileTransform;
+ (id)socialProfilesDescription;
+ (id)sourceContactForValue:(id)a3 labeledValueIdentifier:(id)a4 propertyKey:(id)a5 inUnifiedContact:(id)a6;
+ (id)squashableContactCardProperties;
+ (id)squashableContactCardPropertyKeys;
+ (id)syncImageDataDescription;
+ (id)textAlertDescription;
+ (id)thumbnailImageDataDescription;
+ (id)unifyContactMatchInfos:(id)a3 linkedContacts:(id)a4;
+ (id)unifyMultivalues:(id)a3 forProperty:(id)a4;
+ (id)unifyMultivalues:(id)a3 forProperty:(id)a4 options:(id)a5;
+ (id)urlAddressesDescription;
+ (id)wallpaperDescription;
+ (id)wallpaperFromDataTransform;
+ (id)wallpaperMetadataDescription;
+ (id)wallpaperSyncFailedTimeDescription;
+ (id)wallpaperURIDescription;
+ (id)watchWallpaperImageDataDescription;
+ (id)writableAlwaysFetchedProperties;
+ (id)writableContactProperties;
+ (id)writableContainerProperties;
+ (id)writableMultiValueContactProperties;
+ (id)writableSingleValueContactProperties;
+ (unint64_t)indexOfPreferredContactsForUnifying:(id)a3 includingMainStoreContacts:(BOOL)a4;
+ (unint64_t)indexOfUnifiedIdentifier:(id)a3 onNonUnifiedMultiValue:(id)a4 withIdentifierMap:(id)a5;
+ (void)addLinkedIdentifier:(id)a3 toLabeledValue:(id)a4;
+ (void)resetRestrictedPropertiesOnMutableContact:(id)a3;
@end

@implementation CN

uint64_t __49__CN_PropertyDescription__contactPropertiesByKey__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 key];
}

+ (id)contactUnifyingContacts:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    v8 = 0;
  }
  else if ([v6 count] == 1)
  {
    objc_opt_class();
    v9 = [v6 firstObject];
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      if ([v7 shouldFreezeMutableContacts])
      {
        uint64_t v12 = [v11 freezeWithSelfAsSnapshot];
      }
      else
      {
        uint64_t v12 = [v11 copy];
      }
    }
    else
    {
      uint64_t v12 = [v6 firstObject];
    }
    v8 = (void *)v12;
  }
  else
  {
    v8 = [a1 _unifyContacts:v6 options:v7];
    id v13 = (id)[v8 freezeWithSelfAsSnapshot];
  }

  return v8;
}

+ (id)_unifyContacts:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(v7, "_cn_arrayByRotatingRange:by:", 0, objc_msgSend(a1, "indexOfPreferredContactsForUnifying:includingMainStoreContacts:", v7, objc_msgSend(v6, "shouldIncludeMainStoreContacts"))+ 1, 1);

  v9 = +[CNUnifiedContacts _unifyContactsSortedByPreference:options:]((uint64_t)CNUnifiedContacts, v8, v6);

  return v9;
}

+ (id)allImageDataPropertyKeys
{
  if (allImageDataPropertyKeys_cn_once_token_9 != -1) {
    dispatch_once(&allImageDataPropertyKeys_cn_once_token_9, &__block_literal_global_160_0);
  }
  v2 = (void *)allImageDataPropertyKeys_cn_once_object_9;

  return v2;
}

+ (unint64_t)indexOfPreferredContactsForUnifying:(id)a3 includingMainStoreContacts:(BOOL)a4
{
  return +[CNUnifiedContacts indexOfPreferredContactForUnifying:includingMainStoreContacts:]((uint64_t)CNUnifiedContacts, a3, a4);
}

+ (id)allWallpaperPropertyKeys
{
  if (allWallpaperPropertyKeys_cn_once_token_11 != -1) {
    dispatch_once(&allWallpaperPropertyKeys_cn_once_token_11, &__block_literal_global_164);
  }
  v2 = (void *)allWallpaperPropertyKeys_cn_once_object_11;

  return v2;
}

+ (id)allPhoneticNameComponentProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CN_PropertyDescription__allPhoneticNameComponentProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allPhoneticNameComponentProperties_cn_once_token_13 != -1) {
    dispatch_once(&allPhoneticNameComponentProperties_cn_once_token_13, block);
  }
  v2 = (void *)allPhoneticNameComponentProperties_cn_once_object_13;

  return v2;
}

uint64_t __52__CN_PropertyDescription__writableContactProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isWritable];
}

uint64_t __62__CN_PropertyDescription__writableMultiValueContactProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isMultiValue];
}

uint64_t __63__CN_PropertyDescription__writableSingleValueContactProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isMultiValue] ^ 1;
}

uint64_t __51__CN_PropertyDescription__allImageDataPropertyKeys__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 key];
}

+ (id)allContactProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CN_PropertyDescription__allContactProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allContactProperties_cn_once_token_2 != -1) {
    dispatch_once(&allContactProperties_cn_once_token_2, block);
  }
  v2 = (void *)allContactProperties_cn_once_object_2;

  return v2;
}

+ (id)writableMultiValueContactProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CN_PropertyDescription__writableMultiValueContactProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (writableMultiValueContactProperties_cn_once_token_18 != -1) {
    dispatch_once(&writableMultiValueContactProperties_cn_once_token_18, block);
  }
  v2 = (void *)writableMultiValueContactProperties_cn_once_object_18;

  return v2;
}

+ (id)contactPropertiesByKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CN_PropertyDescription__contactPropertiesByKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (contactPropertiesByKey_cn_once_token_19 != -1) {
    dispatch_once(&contactPropertiesByKey_cn_once_token_19, block);
  }
  v2 = (void *)contactPropertiesByKey_cn_once_object_19;

  return v2;
}

+ (id)thumbnailImageDataDescription
{
  if (thumbnailImageDataDescription_cn_once_token_50 != -1) {
    dispatch_once(&thumbnailImageDataDescription_cn_once_token_50, &__block_literal_global_268);
  }
  v2 = (void *)thumbnailImageDataDescription_cn_once_object_50;

  return v2;
}

+ (id)imageDataDescription
{
  if (imageDataDescription_cn_once_token_48 != -1) {
    dispatch_once(&imageDataDescription_cn_once_token_48, &__block_literal_global_262);
  }
  v2 = (void *)imageDataDescription_cn_once_object_48;

  return v2;
}

+ (id)fullscreenImageDataDescription
{
  if (fullscreenImageDataDescription_cn_once_token_51 != -1) {
    dispatch_once(&fullscreenImageDataDescription_cn_once_token_51, &__block_literal_global_271);
  }
  v2 = (void *)fullscreenImageDataDescription_cn_once_object_51;

  return v2;
}

+ (id)externalImageURIDescription
{
  if (externalImageURIDescription_cn_once_token_77 != -1) {
    dispatch_once(&externalImageURIDescription_cn_once_token_77, &__block_literal_global_349);
  }
  v2 = (void *)externalImageURIDescription_cn_once_object_77;

  return v2;
}

+ (Class)defaultDataMapperClass
{
  return (Class)objc_opt_class();
}

+ (id)organizationNameDescription
{
  if (organizationNameDescription_cn_once_token_40 != -1) {
    dispatch_once(&organizationNameDescription_cn_once_token_40, &__block_literal_global_238);
  }
  v2 = (void *)organizationNameDescription_cn_once_object_40;

  return v2;
}

+ (id)orderForContactName:(id)a3 phonetic:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4
    && [a1 isEmptyNameContact:v6 phonetic:0 includingPrefixAndSuffix:0]
    && +[CN hasContactChineseJapaneseKoreanPhoneticName:](CN, "hasContactChineseJapaneseKoreanPhoneticName:", v6)|| +[CN shouldContactUseFamilyGivenNameOrder:v6])
  {
    uint64_t v7 = +[CNContactNameOrderImpl familyNameFirstOrder];
  }
  else
  {
    if ([a1 isEmptyNameContact:v6 phonetic:v4 includingPrefixAndSuffix:1]) {
      +[CNContactNameOrderImpl defaultNewContactOrder];
    }
    else {
    uint64_t v7 = +[CNContactNameOrderImpl defaultOrder];
    }
  }
  v8 = (void *)v7;

  return v8;
}

+ (id)orderForContactName:(id)a3
{
  return (id)[a1 orderForContactName:a3 phonetic:0];
}

+ (id)localizedNameDelimiterForContact:(id)a3
{
  id v4 = a3;
  v5 = [a1 requiredPropertiesForNameScriptDetection];
  id v6 = +[CN joinNonEmptyContactProperties:v5 onContact:v4 withDelimiter:&stru_1EE052B80];

  uint64_t v7 = CNNameDelimiterForString();

  return v7;
}

+ (id)requiredPropertiesForNameScriptDetection
{
  if (requiredPropertiesForNameScriptDetection_cn_once_token_0 != -1) {
    dispatch_once(&requiredPropertiesForNameScriptDetection_cn_once_token_0, &__block_literal_global_143);
  }
  v2 = (void *)requiredPropertiesForNameScriptDetection_cn_once_object_0;

  return v2;
}

+ (id)joinNonEmptyContactProperties:(id)a3 onContact:(id)a4 withDelimiter:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    uint64_t v15 = *MEMORY[0x1E4F5A298];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "CNValueForContact:", v8, (void)v19);
        if (((*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v17) & 1) == 0)
        {
          if ([v10 length]) {
            [v10 appendString:v9];
          }
          [v10 appendString:v17];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  return v10;
}

+ (BOOL)isEmptyNameContact:(id)a3 phonetic:(BOOL)a4 includingPrefixAndSuffix:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = v7;
  uint64_t v9 = *MEMORY[0x1E4F5A298];
  if (v6)
  {
    id v10 = [v7 phoneticFamilyName];
    if ((*(unsigned int (**)(uint64_t, void *))(v9 + 16))(v9, v10))
    {
      id v11 = [v8 phoneticGivenName];
      if ((*(unsigned int (**)(uint64_t, void *))(v9 + 16))(v9, v11))
      {
        uint64_t v12 = [v8 phoneticMiddleName];
        LOBYTE(v13) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v12);

LABEL_15:
        goto LABEL_16;
      }
LABEL_14:
      LOBYTE(v13) = 0;
      goto LABEL_15;
    }
LABEL_13:
    LOBYTE(v13) = 0;
LABEL_16:

    goto LABEL_17;
  }
  id v10 = [v7 givenName];
  if (!(*(unsigned int (**)(uint64_t, void *))(v9 + 16))(v9, v10)) {
    goto LABEL_13;
  }
  id v11 = [v8 middleName];
  if (!(*(unsigned int (**)(uint64_t, void *))(v9 + 16))(v9, v11)) {
    goto LABEL_14;
  }
  uint64_t v14 = [v8 familyName];
  int v13 = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v14);

  if (v13) {
    BOOL v15 = !v5;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    id v10 = [v8 namePrefix];
    if ((*(unsigned int (**)(uint64_t, void *))(v9 + 16))(v9, v10))
    {
      id v11 = [v8 nameSuffix];
      LOBYTE(v13) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v11);
      goto LABEL_15;
    }
    goto LABEL_13;
  }
LABEL_17:

  return v13;
}

+ (BOOL)shouldContactUseFamilyGivenNameOrder:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  BOOL v5 = [MEMORY[0x1E4F28F30] componentsForContact:v3];

  LOBYTE(v3) = [v4 _nameOrderWithOverridesForComponents:v5] == 2;
  return (char)v3;
}

+ (id)allNameComponentRelatedProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CN_PropertyDescription__allNameComponentRelatedProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allNameComponentRelatedProperties_cn_once_token_12 != -1) {
    dispatch_once(&allNameComponentRelatedProperties_cn_once_token_12, block);
  }
  v2 = (void *)allNameComponentRelatedProperties_cn_once_object_12;

  return v2;
}

uint64_t __51__CN_PropertyDescription__allWallpaperPropertyKeys__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 key];
}

+ (NSArray)runtimeOnlyProperties
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 contactFlagsDescription];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

+ (id)contactFlagsDescription
{
  if (contactFlagsDescription_cn_once_token_20 != -1) {
    dispatch_once(&contactFlagsDescription_cn_once_token_20, &__block_literal_global_181);
  }
  v2 = (void *)contactFlagsDescription_cn_once_object_20;

  return v2;
}

uint64_t __50__CN_PropertyDescription__contactFlagsDescription__block_invoke()
{
  contactFlagsDescription_cn_once_object_20 = objc_alloc_init(CNContactFlagsDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __57__CN_PropertyDescription__iOSLegacyIdentifierDescription__block_invoke()
{
  iOSLegacyIdentifierDescription_cn_once_object_23 = objc_alloc_init(CNIOSLegacyIdentifierDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __46__CN_PropertyDescription__nicknameDescription__block_invoke()
{
  nicknameDescription_cn_once_object_30 = objc_alloc_init(CNNicknameNameDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __50__CN_PropertyDescription__wallpaperURIDescription__block_invoke()
{
  wallpaperURIDescription_cn_once_object_90 = objc_alloc_init(CNWallpaperURIDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __54__CN_PropertyDescription__contactRelationsDescription__block_invoke()
{
  contactRelationsDescription_cn_once_object_67 = objc_alloc_init(CNContactRelationsDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __47__CN_PropertyDescription__callAlertDescription__block_invoke()
{
  callAlertDescription_cn_once_object_80 = objc_alloc_init(CNCallAlertDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __66__CN_PropertyDescription__sharedPhotoDisplayPreferenceDescription__block_invoke()
{
  sharedPhotoDisplayPreferenceDescription_cn_once_object_60 = objc_alloc_init(CNSharedPhotoDisplayPreferenceDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __61__CN_PropertyDescription__watchWallpaperImageDataDescription__block_invoke()
{
  watchWallpaperImageDataDescription_cn_once_object_89 = objc_alloc_init(CNWatchWallpaperImageDataDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __56__CN_PropertyDescription__isUsingSharedPhotoDescription__block_invoke()
{
  isUsingSharedPhotoDescription_cn_once_object_61 = objc_alloc_init(CNisUsingSharedPhotoDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __54__CN_PropertyDescription__preferredForNameDescription__block_invoke()
{
  preferredForNameDescription_cn_once_object_55 = objc_alloc_init(CNPreferredForNameDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __52__CN_PropertyDescription__emailAddressesDescription__block_invoke()
{
  emailAddressesDescription_cn_once_object_63 = objc_alloc_init(CNEmailAddressesDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __36__CN_PropertyDescription__imageHash__block_invoke()
{
  imageHash_cn_once_object_85 = objc_alloc_init(CNImageHashDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __47__CN_PropertyDescription__wallpaperDescription__block_invoke()
{
  wallpaperDescription_cn_once_object_87 = objc_alloc_init(CNWallpaperDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __46__CN_PropertyDescription__birthdayDescription__block_invoke()
{
  birthdayDescription_cn_once_object_43 = objc_alloc_init(CNBirthdayDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __49__CN_PropertyDescription__phonemeDataDescription__block_invoke()
{
  phonemeDataDescription_cn_once_object_78 = objc_alloc_init(CNPhonemeDataDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __67__CN_PropertyDescription__sectionForSortingByFamilyNameDescription__block_invoke()
{
  sectionForSortingByFamilyNameDescription_cn_once_object_38 = objc_alloc_init(CNSectionForSortingByFamilyNameDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __61__CN_PropertyDescription__preferredLikenessSourceDescription__block_invoke()
{
  preferredLikenessSourceDescription_cn_once_object_57 = objc_alloc_init(CNPreferredLikenessSourceDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __50__CN_PropertyDescription__calendarURIsDescription__block_invoke()
{
  calendarURIsDescription_cn_once_object_72 = objc_alloc_init(CNCalendarURIsDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __36__CN_PropertyDescription__imageType__block_invoke()
{
  imageType_cn_once_object_84 = objc_alloc_init(CNImageTypeDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __56__CN_PropertyDescription__phoneticMiddleNameDescription__block_invoke()
{
  phoneticMiddleNameDescription_cn_once_object_32 = objc_alloc_init(CNPhoneticMiddleNameDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __48__CN_PropertyDescription__identifierDescription__block_invoke()
{
  identifierDescription_cn_once_object_22 = objc_alloc_init(CNInternalIdentifierDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __54__CN_PropertyDescription__preferredChannelDescription__block_invoke()
{
  preferredChannelDescription_cn_once_object_81 = objc_alloc_init(CNPreferredChannelDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __54__CN_PropertyDescription__modificationDateDescription__block_invoke()
{
  modificationDateDescription_cn_once_object_46 = objc_alloc_init(CNModificationDateDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __46__CN_PropertyDescription__jobTitleDescription__block_invoke()
{
  jobTitleDescription_cn_once_object_42 = objc_alloc_init(CNJobTitleDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __51__CN_PropertyDescription__syncImageDataDescription__block_invoke()
{
  syncImageDataDescription_cn_once_object_52 = objc_alloc_init(CNSyncImageDataDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __52__CN_PropertyDescription__linkIdentifierDescription__block_invoke()
{
  linkIdentifierDescription_cn_once_object_54 = objc_alloc_init(CNLinkIdentifierDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __50__CN_PropertyDescription__externalUUIDDescription__block_invoke()
{
  externalUUIDDescription_cn_once_object_76 = objc_alloc_init(CNExternalUUIDDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __48__CN_PropertyDescription__departmentDescription__block_invoke()
{
  departmentDescription_cn_once_object_41 = objc_alloc_init(CNDepartmentDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __61__CN_PropertyDescription__wallpaperSyncFailedTimeDescription__block_invoke()
{
  wallpaperSyncFailedTimeDescription_cn_once_object_94 = objc_alloc_init(CNWallpaperSyncFailedTimeDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __55__CN_PropertyDescription__downtimeWhitelistDescription__block_invoke()
{
  downtimeWhitelistDescription_cn_once_object_83 = objc_alloc_init(CNDowntimeWhitelistDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __60__CN_PropertyDescription__pronunciationGivenNameDescription__block_invoke()
{
  pronunciationGivenNameDescription_cn_once_object_35 = objc_alloc_init(CNPronunciationGivenNameDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __56__CN_PropertyDescription__phoneticFamilyNameDescription__block_invoke()
{
  phoneticFamilyNameDescription_cn_once_object_33 = objc_alloc_init(CNPhoneticFamilyNameDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __43__CN_PropertyDescription__datesDescription__block_invoke()
{
  datesDescription_cn_once_object_65 = objc_alloc_init(CNDatesDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __55__CN_PropertyDescription__phoneticGivenNameDescription__block_invoke()
{
  phoneticGivenNameDescription_cn_once_object_31 = objc_alloc_init(CNPhoneticGivenNameDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __50__CN_PropertyDescription__phoneNumbersDescription__block_invoke()
{
  phoneNumbersDescription_cn_once_object_62 = objc_alloc_init(CNPhoneNumbersDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __54__CN_PropertyDescription__organizationNameDescription__block_invoke()
{
  organizationNameDescription_cn_once_object_40 = objc_alloc_init(CNOrganizationNameDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __52__CN_PropertyDescription__memojiMetadataDescription__block_invoke()
{
  memojiMetadataDescription_cn_once_object_86 = objc_alloc_init(CNMemojiMetadataDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __62__CN_PropertyDescription__phoneticOrganizationNameDescription__block_invoke()
{
  phoneticOrganizationNameDescription_cn_once_object_34 = objc_alloc_init(CNPhoneticOrganizationNameDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __58__CN_PropertyDescription__nonGregorianBirthdayDescription__block_invoke()
{
  nonGregorianBirthdayDescription_cn_once_object_44 = objc_alloc_init(CNNonGregorianBirthdayDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __61__CN_PropertyDescription__pronunciationFamilyNameDescription__block_invoke()
{
  pronunciationFamilyNameDescription_cn_once_object_36 = objc_alloc_init(CNPronunciationFamilyNameDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __66__CN_PropertyDescription__sectionForSortingByGivenNameDescription__block_invoke()
{
  sectionForSortingByGivenNameDescription_cn_once_object_39 = objc_alloc_init(CNSectionForSortingByGivenNameDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __63__CN_PropertyDescription__imageBackgroundColorsDataDescription__block_invoke()
{
  imageBackgroundColorsDataDescription_cn_once_object_91 = objc_alloc_init(CNImageBackgroundColorsDataDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __52__CN_PropertyDescription__socialProfilesDescription__block_invoke()
{
  socialProfilesDescription_cn_once_object_68 = objc_alloc_init(CNSocialProfilesDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __57__CN_PropertyDescription__fullscreenImageDataDescription__block_invoke()
{
  fullscreenImageDataDescription_cn_once_object_51 = objc_alloc_init(CNFullscreenImageDataDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __56__CN_PropertyDescription__externalIdentifierDescription__block_invoke()
{
  externalIdentifierDescription_cn_once_object_73 = objc_alloc_init(CNExternalIdentifierDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __50__CN_PropertyDescription__creationDateDescription__block_invoke()
{
  creationDateDescription_cn_once_object_45 = objc_alloc_init(CNCreationDateDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __57__CN_PropertyDescription__explicitDisplayNameDescription__block_invoke()
{
  explicitDisplayNameDescription_cn_once_object_37 = objc_alloc_init(CNExplicitDisplayNameDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __54__CN_PropertyDescription__externalImageURIDescription__block_invoke()
{
  externalImageURIDescription_cn_once_object_77 = objc_alloc_init(CNExternalImageURIDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __53__CN_PropertyDescription__postalAddressesDescription__block_invoke()
{
  postalAddressesDescription_cn_once_object_69 = objc_alloc_init(CNPostalAddressesDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __42__CN_PropertyDescription__noteDescription__block_invoke()
{
  noteDescription_cn_once_object_47 = objc_alloc_init(CNNoteDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __56__CN_PropertyDescription__thumbnailImageDataDescription__block_invoke()
{
  thumbnailImageDataDescription_cn_once_object_50 = objc_alloc_init(CNThumbnailImageDataDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __55__CN_PropertyDescription__wallpaperMetadataDescription__block_invoke()
{
  wallpaperMetadataDescription_cn_once_object_88 = objc_alloc_init(CNWallpaperMetadataDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __67__CN_PropertyDescription__sensitiveContentConfigurationDescription__block_invoke()
{
  sensitiveContentConfigurationDescription_cn_once_object_92 = objc_alloc_init(CNSensitiveContentConfigurationDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __65__CN_PropertyDescription__addressingGrammarsEncryptedDescription__block_invoke()
{
  addressingGrammarsEncryptedDescription_cn_once_object_71 = objc_alloc_init(CNAddressingGrammarsEncryptedDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __55__CN_PropertyDescription__preferredForImageDescription__block_invoke()
{
  preferredForImageDescription_cn_once_object_56 = objc_alloc_init(CNPreferredForImageDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __61__CN_PropertyDescription__externalModificationTagDescription__block_invoke()
{
  externalModificationTagDescription_cn_once_object_74 = objc_alloc_init(CNExternalModificationTagDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __60__CN_PropertyDescription__instantMessagAddressesDescription__block_invoke()
{
  instantMessagAddressesDescription_cn_once_object_66 = objc_alloc_init(CNInstantMessageAddressesDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __46__CN_PropertyDescription__mapsDataDescription__block_invoke()
{
  mapsDataDescription_cn_once_object_82 = objc_alloc_init(CNMapsDataDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __69__CN_PropertyDescription__preferredApplePersonaIdentifierDescription__block_invoke()
{
  preferredApplePersonaIdentifierDescription_cn_once_object_58 = objc_alloc_init(CNPreferredApplePersonaIdentifierDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __57__CN_PropertyDescription__imageSyncFailedTimeDescription__block_invoke()
{
  imageSyncFailedTimeDescription_cn_once_object_93 = objc_alloc_init(CNImageSyncFailedTimeDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __56__CN_PropertyDescription__addressingGrammarsDescription__block_invoke()
{
  addressingGrammarsDescription_cn_once_object_70 = objc_alloc_init(CNAddressingGrammarsDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __49__CN_PropertyDescription__contactTypeDescription__block_invoke()
{
  contactTypeDescription_cn_once_object_59 = objc_alloc_init(CNContactTypeDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __56__CN_PropertyDescription__imageDataAvailableDescription__block_invoke()
{
  imageDataAvailableDescription_cn_once_object_53 = objc_alloc_init(CNImageDataAvailableDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __47__CN_PropertyDescription__textAlertDescription__block_invoke()
{
  textAlertDescription_cn_once_object_79 = objc_alloc_init(CNTextAlertDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __60__CN_PropertyDescription__externalRepresentationDescription__block_invoke()
{
  externalRepresentationDescription_cn_once_object_75 = objc_alloc_init(CNExternalRepresentationDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __56__CN_PropertyDescription__previousFamilyNameDescription__block_invoke()
{
  previousFamilyNameDescription_cn_once_object_29 = objc_alloc_init(CNPreviousFamilyNameDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __50__CN_PropertyDescription__urlAddressesDescription__block_invoke()
{
  urlAddressesDescription_cn_once_object_64 = objc_alloc_init(CNUrlAddressesDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __47__CN_PropertyDescription__imageDataDescription__block_invoke()
{
  imageDataDescription_cn_once_object_48 = objc_alloc_init(CNImageDataDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __46__CN_PropertyDescription__cropRectDescription__block_invoke()
{
  cropRectDescription_cn_once_object_49 = objc_alloc_init(CNCropRectDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __48__CN_PropertyDescription__nameSuffixDescription__block_invoke()
{
  nameSuffixDescription_cn_once_object_28 = objc_alloc_init(CNNameSuffixDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __48__CN_PropertyDescription__familyNameDescription__block_invoke()
{
  familyNameDescription_cn_once_object_27 = objc_alloc_init(CNFamilyNameDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __48__CN_PropertyDescription__namePrefixDescription__block_invoke()
{
  namePrefixDescription_cn_once_object_24 = objc_alloc_init(CNNamePrefixDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __47__CN_PropertyDescription__givenNameDescription__block_invoke()
{
  givenNameDescription_cn_once_object_25 = objc_alloc_init(CNGivenNameDescription);

  return MEMORY[0x1F41817F8]();
}

uint64_t __48__CN_PropertyDescription__middleNameDescription__block_invoke()
{
  middleNameDescription_cn_once_object_26 = objc_alloc_init(CNMiddleNameDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)postalAddressFromDictionaryTransform
{
  return &__block_literal_global_23_0;
}

void __49__CN_PropertyDescription__allWallpaperProperties__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) wallpaperDescription];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  uint64_t v3 = [v2 copy];
  id v4 = (void *)allWallpaperProperties_cn_once_object_10;
  allWallpaperProperties_cn_once_object_10 = v3;
}

void __49__CN_PropertyDescription__contactPropertiesByKey__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) allContactProperties];
  v1 = objc_msgSend(v4, "_cn_indexBy:", &__block_literal_global_179_0);
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)contactPropertiesByKey_cn_once_object_19;
  contactPropertiesByKey_cn_once_object_19 = v2;
}

+ (id)writableSingleValueContactProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CN_PropertyDescription__writableSingleValueContactProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (writableSingleValueContactProperties_cn_once_token_17 != -1) {
    dispatch_once(&writableSingleValueContactProperties_cn_once_token_17, block);
  }
  uint64_t v2 = (void *)writableSingleValueContactProperties_cn_once_object_17;

  return v2;
}

void __50__CN_PropertyDescription__alwaysFetchedProperties__block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) identifierDescription];
  v7[0] = v2;
  uint64_t v3 = [*(id *)(a1 + 32) iOSLegacyIdentifierDescription];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  uint64_t v5 = [v4 copy];
  BOOL v6 = (void *)alwaysFetchedProperties_cn_once_object_6;
  alwaysFetchedProperties_cn_once_object_6 = v5;
}

void __70__CN_CNInternationalSupport__requiredPropertiesForNameScriptDetection__block_invoke()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v0 = +[CN givenNameDescription];
  v1 = +[CN middleNameDescription];
  v6[1] = v1;
  uint64_t v2 = +[CN familyNameDescription];
  v6[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = (void *)requiredPropertiesForNameScriptDetection_cn_once_object_0;
  requiredPropertiesForNameScriptDetection_cn_once_object_0 = v4;
}

void __61__CN_PropertyDescription__allPhoneticNameComponentProperties__block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) phoneticGivenNameDescription];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "phoneticMiddleNameDescription", v2);
  v8[1] = v3;
  uint64_t v4 = [*(id *)(a1 + 32) phoneticFamilyNameDescription];
  v8[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  uint64_t v6 = [v5 copy];
  id v7 = (void *)allPhoneticNameComponentProperties_cn_once_object_13;
  allPhoneticNameComponentProperties_cn_once_object_13 = v6;
}

void __49__CN_PropertyDescription__allImageDataProperties__block_invoke(uint64_t a1)
{
  v15[10] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = [*(id *)(a1 + 32) imageDataDescription];
  v15[0] = v14;
  uint64_t v2 = [*(id *)(a1 + 32) fullscreenImageDataDescription];
  v15[1] = v2;
  uint64_t v3 = [*(id *)(a1 + 32) syncImageDataDescription];
  v15[2] = v3;
  uint64_t v4 = [*(id *)(a1 + 32) imageType];
  v15[3] = v4;
  uint64_t v5 = [*(id *)(a1 + 32) imageHash];
  v15[4] = v5;
  uint64_t v6 = [*(id *)(a1 + 32) thumbnailImageDataDescription];
  v15[5] = v6;
  id v7 = [*(id *)(a1 + 32) cropRectDescription];
  v15[6] = v7;
  id v8 = [*(id *)(a1 + 32) externalImageURIDescription];
  v15[7] = v8;
  uint64_t v9 = [*(id *)(a1 + 32) memojiMetadataDescription];
  v15[8] = v9;
  id v10 = [*(id *)(a1 + 32) sharedPhotoDisplayPreferenceDescription];
  v15[9] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:10];
  uint64_t v12 = [v11 copy];
  int v13 = (void *)allImageDataProperties_cn_once_object_8;
  allImageDataProperties_cn_once_object_8 = v12;
}

void __60__CN_PropertyDescription__allNameComponentRelatedProperties__block_invoke(uint64_t a1)
{
  v22[15] = *MEMORY[0x1E4F143B8];
  long long v21 = [*(id *)(a1 + 32) namePrefixDescription];
  v22[0] = v21;
  long long v20 = [*(id *)(a1 + 32) givenNameDescription];
  v22[1] = v20;
  long long v19 = [*(id *)(a1 + 32) middleNameDescription];
  v22[2] = v19;
  v18 = [*(id *)(a1 + 32) familyNameDescription];
  v22[3] = v18;
  v17 = [*(id *)(a1 + 32) previousFamilyNameDescription];
  v22[4] = v17;
  v16 = [*(id *)(a1 + 32) nameSuffixDescription];
  v22[5] = v16;
  BOOL v15 = [*(id *)(a1 + 32) nicknameDescription];
  v22[6] = v15;
  uint64_t v14 = [*(id *)(a1 + 32) pronunciationGivenNameDescription];
  v22[7] = v14;
  uint64_t v2 = [*(id *)(a1 + 32) pronunciationFamilyNameDescription];
  v22[8] = v2;
  uint64_t v3 = [*(id *)(a1 + 32) explicitDisplayNameDescription];
  v22[9] = v3;
  uint64_t v4 = [*(id *)(a1 + 32) organizationNameDescription];
  v22[10] = v4;
  uint64_t v5 = [*(id *)(a1 + 32) phoneticOrganizationNameDescription];
  v22[11] = v5;
  uint64_t v6 = [*(id *)(a1 + 32) contactTypeDescription];
  v22[12] = v6;
  id v7 = [*(id *)(a1 + 32) departmentDescription];
  v22[13] = v7;
  id v8 = [*(id *)(a1 + 32) jobTitleDescription];
  v22[14] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:15];
  id v10 = [*(id *)(a1 + 32) allPhoneticNameComponentProperties];
  id v11 = [v9 arrayByAddingObjectsFromArray:v10];
  uint64_t v12 = [v11 copy];
  int v13 = (void *)allNameComponentRelatedProperties_cn_once_object_12;
  allNameComponentRelatedProperties_cn_once_object_12 = v12;
}

void __47__CN_PropertyDescription__allContactProperties__block_invoke(uint64_t a1)
{
  v78[73] = *MEMORY[0x1E4F143B8];
  v77 = [*(id *)(a1 + 32) identifierDescription];
  v78[0] = v77;
  v76 = [*(id *)(a1 + 32) iOSLegacyIdentifierDescription];
  v78[1] = v76;
  v75 = [*(id *)(a1 + 32) namePrefixDescription];
  v78[2] = v75;
  v74 = [*(id *)(a1 + 32) givenNameDescription];
  v78[3] = v74;
  v73 = [*(id *)(a1 + 32) middleNameDescription];
  v78[4] = v73;
  v72 = [*(id *)(a1 + 32) familyNameDescription];
  v78[5] = v72;
  v71 = [*(id *)(a1 + 32) nameSuffixDescription];
  v78[6] = v71;
  v70 = [*(id *)(a1 + 32) previousFamilyNameDescription];
  v78[7] = v70;
  v69 = [*(id *)(a1 + 32) nicknameDescription];
  v78[8] = v69;
  v68 = [*(id *)(a1 + 32) phoneticGivenNameDescription];
  v78[9] = v68;
  v67 = [*(id *)(a1 + 32) phoneticMiddleNameDescription];
  v78[10] = v67;
  v66 = [*(id *)(a1 + 32) phoneticFamilyNameDescription];
  v78[11] = v66;
  v65 = [*(id *)(a1 + 32) phoneticOrganizationNameDescription];
  v78[12] = v65;
  v64 = [*(id *)(a1 + 32) pronunciationGivenNameDescription];
  v78[13] = v64;
  v63 = [*(id *)(a1 + 32) pronunciationFamilyNameDescription];
  v78[14] = v63;
  v62 = [*(id *)(a1 + 32) explicitDisplayNameDescription];
  v78[15] = v62;
  v61 = [*(id *)(a1 + 32) addressingGrammarsDescription];
  v78[16] = v61;
  v60 = [*(id *)(a1 + 32) addressingGrammarsEncryptedDescription];
  v78[17] = v60;
  v59 = [*(id *)(a1 + 32) sectionForSortingByFamilyNameDescription];
  v78[18] = v59;
  v58 = [*(id *)(a1 + 32) sectionForSortingByGivenNameDescription];
  v78[19] = v58;
  v57 = [*(id *)(a1 + 32) organizationNameDescription];
  v78[20] = v57;
  v56 = [*(id *)(a1 + 32) departmentDescription];
  v78[21] = v56;
  v55 = [*(id *)(a1 + 32) jobTitleDescription];
  v78[22] = v55;
  v54 = [*(id *)(a1 + 32) birthdayDescription];
  v78[23] = v54;
  v53 = [*(id *)(a1 + 32) nonGregorianBirthdayDescription];
  v78[24] = v53;
  v52 = [*(id *)(a1 + 32) creationDateDescription];
  v78[25] = v52;
  v51 = [*(id *)(a1 + 32) modificationDateDescription];
  v78[26] = v51;
  v50 = [*(id *)(a1 + 32) noteDescription];
  v78[27] = v50;
  v49 = [*(id *)(a1 + 32) imageDataDescription];
  v78[28] = v49;
  v48 = [*(id *)(a1 + 32) cropRectDescription];
  v78[29] = v48;
  v47 = [*(id *)(a1 + 32) thumbnailImageDataDescription];
  v78[30] = v47;
  v46 = [*(id *)(a1 + 32) imageDataAvailableDescription];
  v78[31] = v46;
  v45 = [*(id *)(a1 + 32) fullscreenImageDataDescription];
  v78[32] = v45;
  v44 = [*(id *)(a1 + 32) syncImageDataDescription];
  v78[33] = v44;
  v43 = [*(id *)(a1 + 32) linkIdentifierDescription];
  v78[34] = v43;
  v42 = [*(id *)(a1 + 32) preferredForNameDescription];
  v78[35] = v42;
  v41 = [*(id *)(a1 + 32) preferredForImageDescription];
  v78[36] = v41;
  v40 = [*(id *)(a1 + 32) contactTypeDescription];
  v78[37] = v40;
  v39 = [*(id *)(a1 + 32) preferredLikenessSourceDescription];
  v78[38] = v39;
  v38 = [*(id *)(a1 + 32) preferredApplePersonaIdentifierDescription];
  v78[39] = v38;
  v37 = [*(id *)(a1 + 32) sharedPhotoDisplayPreferenceDescription];
  v78[40] = v37;
  v36 = [*(id *)(a1 + 32) isUsingSharedPhotoDescription];
  v78[41] = v36;
  v35 = [*(id *)(a1 + 32) phoneNumbersDescription];
  v78[42] = v35;
  v34 = [*(id *)(a1 + 32) emailAddressesDescription];
  v78[43] = v34;
  v33 = [*(id *)(a1 + 32) urlAddressesDescription];
  v78[44] = v33;
  v32 = [*(id *)(a1 + 32) datesDescription];
  v78[45] = v32;
  v31 = [*(id *)(a1 + 32) instantMessagAddressesDescription];
  v78[46] = v31;
  v30 = [*(id *)(a1 + 32) contactRelationsDescription];
  v78[47] = v30;
  v29 = [*(id *)(a1 + 32) socialProfilesDescription];
  v78[48] = v29;
  v28 = [*(id *)(a1 + 32) postalAddressesDescription];
  v78[49] = v28;
  v27 = [*(id *)(a1 + 32) phonemeDataDescription];
  v78[50] = v27;
  v26 = [*(id *)(a1 + 32) textAlertDescription];
  v78[51] = v26;
  v25 = [*(id *)(a1 + 32) callAlertDescription];
  v78[52] = v25;
  uint64_t v24 = [*(id *)(a1 + 32) mapsDataDescription];
  v78[53] = v24;
  v23 = [*(id *)(a1 + 32) preferredChannelDescription];
  v78[54] = v23;
  long long v22 = [*(id *)(a1 + 32) calendarURIsDescription];
  v78[55] = v22;
  long long v21 = [*(id *)(a1 + 32) externalIdentifierDescription];
  v78[56] = v21;
  long long v20 = [*(id *)(a1 + 32) externalModificationTagDescription];
  v78[57] = v20;
  long long v19 = [*(id *)(a1 + 32) externalRepresentationDescription];
  v78[58] = v19;
  v18 = [*(id *)(a1 + 32) externalUUIDDescription];
  v78[59] = v18;
  v17 = [*(id *)(a1 + 32) externalImageURIDescription];
  v78[60] = v17;
  v16 = [*(id *)(a1 + 32) imageType];
  v78[61] = v16;
  BOOL v15 = [*(id *)(a1 + 32) imageHash];
  v78[62] = v15;
  uint64_t v14 = [*(id *)(a1 + 32) downtimeWhitelistDescription];
  v78[63] = v14;
  uint64_t v2 = [*(id *)(a1 + 32) memojiMetadataDescription];
  v78[64] = v2;
  uint64_t v3 = [*(id *)(a1 + 32) wallpaperDescription];
  v78[65] = v3;
  uint64_t v4 = [*(id *)(a1 + 32) wallpaperMetadataDescription];
  v78[66] = v4;
  uint64_t v5 = [*(id *)(a1 + 32) watchWallpaperImageDataDescription];
  v78[67] = v5;
  uint64_t v6 = [*(id *)(a1 + 32) wallpaperURIDescription];
  v78[68] = v6;
  id v7 = [*(id *)(a1 + 32) imageBackgroundColorsDataDescription];
  v78[69] = v7;
  id v8 = [*(id *)(a1 + 32) sensitiveContentConfigurationDescription];
  v78[70] = v8;
  uint64_t v9 = [*(id *)(a1 + 32) imageSyncFailedTimeDescription];
  v78[71] = v9;
  id v10 = [*(id *)(a1 + 32) wallpaperSyncFailedTimeDescription];
  v78[72] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:73];
  uint64_t v12 = [v11 copy];
  int v13 = (void *)allContactProperties_cn_once_object_2;
  allContactProperties_cn_once_object_2 = v12;
}

+ (id)middleNameDescription
{
  if (middleNameDescription_cn_once_token_26 != -1) {
    dispatch_once(&middleNameDescription_cn_once_token_26, &__block_literal_global_196);
  }
  uint64_t v2 = (void *)middleNameDescription_cn_once_object_26;

  return v2;
}

+ (id)givenNameDescription
{
  if (givenNameDescription_cn_once_token_25 != -1) {
    dispatch_once(&givenNameDescription_cn_once_token_25, &__block_literal_global_193);
  }
  uint64_t v2 = (void *)givenNameDescription_cn_once_object_25;

  return v2;
}

+ (id)familyNameDescription
{
  if (familyNameDescription_cn_once_token_27 != -1) {
    dispatch_once(&familyNameDescription_cn_once_token_27, &__block_literal_global_199);
  }
  uint64_t v2 = (void *)familyNameDescription_cn_once_object_27;

  return v2;
}

+ (id)nameSuffixDescription
{
  if (nameSuffixDescription_cn_once_token_28 != -1) {
    dispatch_once(&nameSuffixDescription_cn_once_token_28, &__block_literal_global_202);
  }
  uint64_t v2 = (void *)nameSuffixDescription_cn_once_object_28;

  return v2;
}

+ (id)namePrefixDescription
{
  if (namePrefixDescription_cn_once_token_24 != -1) {
    dispatch_once(&namePrefixDescription_cn_once_token_24, &__block_literal_global_190);
  }
  uint64_t v2 = (void *)namePrefixDescription_cn_once_object_24;

  return v2;
}

+ (id)identifierDescription
{
  if (identifierDescription_cn_once_token_22 != -1) {
    dispatch_once(&identifierDescription_cn_once_token_22, &__block_literal_global_184);
  }
  uint64_t v2 = (void *)identifierDescription_cn_once_object_22;

  return v2;
}

+ (id)iOSLegacyIdentifierDescription
{
  if (iOSLegacyIdentifierDescription_cn_once_token_23 != -1) {
    dispatch_once(&iOSLegacyIdentifierDescription_cn_once_token_23, &__block_literal_global_187);
  }
  uint64_t v2 = (void *)iOSLegacyIdentifierDescription_cn_once_object_23;

  return v2;
}

+ (id)wallpaperDescription
{
  if (wallpaperDescription_cn_once_token_87 != -1) {
    dispatch_once(&wallpaperDescription_cn_once_token_87, &__block_literal_global_379);
  }
  uint64_t v2 = (void *)wallpaperDescription_cn_once_object_87;

  return v2;
}

+ (id)syncImageDataDescription
{
  if (syncImageDataDescription_cn_once_token_52 != -1) {
    dispatch_once(&syncImageDataDescription_cn_once_token_52, &__block_literal_global_274);
  }
  uint64_t v2 = (void *)syncImageDataDescription_cn_once_object_52;

  return v2;
}

+ (id)cropRectDescription
{
  if (cropRectDescription_cn_once_token_49 != -1) {
    dispatch_once(&cropRectDescription_cn_once_token_49, &__block_literal_global_265);
  }
  uint64_t v2 = (void *)cropRectDescription_cn_once_object_49;

  return v2;
}

+ (id)sharedPhotoDisplayPreferenceDescription
{
  if (sharedPhotoDisplayPreferenceDescription_cn_once_token_60 != -1) {
    dispatch_once(&sharedPhotoDisplayPreferenceDescription_cn_once_token_60, &__block_literal_global_298);
  }
  uint64_t v2 = (void *)sharedPhotoDisplayPreferenceDescription_cn_once_object_60;

  return v2;
}

+ (id)pronunciationGivenNameDescription
{
  if (pronunciationGivenNameDescription_cn_once_token_35 != -1) {
    dispatch_once(&pronunciationGivenNameDescription_cn_once_token_35, &__block_literal_global_223);
  }
  uint64_t v2 = (void *)pronunciationGivenNameDescription_cn_once_object_35;

  return v2;
}

+ (id)pronunciationFamilyNameDescription
{
  if (pronunciationFamilyNameDescription_cn_once_token_36 != -1) {
    dispatch_once(&pronunciationFamilyNameDescription_cn_once_token_36, &__block_literal_global_226_0);
  }
  uint64_t v2 = (void *)pronunciationFamilyNameDescription_cn_once_object_36;

  return v2;
}

+ (id)previousFamilyNameDescription
{
  if (previousFamilyNameDescription_cn_once_token_29 != -1) {
    dispatch_once(&previousFamilyNameDescription_cn_once_token_29, &__block_literal_global_205);
  }
  uint64_t v2 = (void *)previousFamilyNameDescription_cn_once_object_29;

  return v2;
}

+ (id)phoneticOrganizationNameDescription
{
  if (phoneticOrganizationNameDescription_cn_once_token_34 != -1) {
    dispatch_once(&phoneticOrganizationNameDescription_cn_once_token_34, &__block_literal_global_220);
  }
  uint64_t v2 = (void *)phoneticOrganizationNameDescription_cn_once_object_34;

  return v2;
}

+ (id)phoneticMiddleNameDescription
{
  if (phoneticMiddleNameDescription_cn_once_token_32 != -1) {
    dispatch_once(&phoneticMiddleNameDescription_cn_once_token_32, &__block_literal_global_214);
  }
  uint64_t v2 = (void *)phoneticMiddleNameDescription_cn_once_object_32;

  return v2;
}

+ (id)phoneticGivenNameDescription
{
  if (phoneticGivenNameDescription_cn_once_token_31 != -1) {
    dispatch_once(&phoneticGivenNameDescription_cn_once_token_31, &__block_literal_global_211);
  }
  uint64_t v2 = (void *)phoneticGivenNameDescription_cn_once_object_31;

  return v2;
}

+ (id)phoneticFamilyNameDescription
{
  if (phoneticFamilyNameDescription_cn_once_token_33 != -1) {
    dispatch_once(&phoneticFamilyNameDescription_cn_once_token_33, &__block_literal_global_217);
  }
  uint64_t v2 = (void *)phoneticFamilyNameDescription_cn_once_object_33;

  return v2;
}

+ (id)nicknameDescription
{
  if (nicknameDescription_cn_once_token_30 != -1) {
    dispatch_once(&nicknameDescription_cn_once_token_30, &__block_literal_global_208);
  }
  uint64_t v2 = (void *)nicknameDescription_cn_once_object_30;

  return v2;
}

+ (id)memojiMetadataDescription
{
  if (memojiMetadataDescription_cn_once_token_86 != -1) {
    dispatch_once(&memojiMetadataDescription_cn_once_token_86, &__block_literal_global_376);
  }
  uint64_t v2 = (void *)memojiMetadataDescription_cn_once_object_86;

  return v2;
}

+ (id)jobTitleDescription
{
  if (jobTitleDescription_cn_once_token_42 != -1) {
    dispatch_once(&jobTitleDescription_cn_once_token_42, &__block_literal_global_244);
  }
  uint64_t v2 = (void *)jobTitleDescription_cn_once_object_42;

  return v2;
}

+ (id)imageType
{
  if (imageType_cn_once_token_84 != -1) {
    dispatch_once(&imageType_cn_once_token_84, &__block_literal_global_370);
  }
  uint64_t v2 = (void *)imageType_cn_once_object_84;

  return v2;
}

+ (id)imageHash
{
  if (imageHash_cn_once_token_85 != -1) {
    dispatch_once(&imageHash_cn_once_token_85, &__block_literal_global_373);
  }
  uint64_t v2 = (void *)imageHash_cn_once_object_85;

  return v2;
}

+ (id)explicitDisplayNameDescription
{
  if (explicitDisplayNameDescription_cn_once_token_37 != -1) {
    dispatch_once(&explicitDisplayNameDescription_cn_once_token_37, &__block_literal_global_229_0);
  }
  uint64_t v2 = (void *)explicitDisplayNameDescription_cn_once_object_37;

  return v2;
}

+ (id)departmentDescription
{
  if (departmentDescription_cn_once_token_41 != -1) {
    dispatch_once(&departmentDescription_cn_once_token_41, &__block_literal_global_241);
  }
  uint64_t v2 = (void *)departmentDescription_cn_once_object_41;

  return v2;
}

+ (id)contactTypeDescription
{
  if (contactTypeDescription_cn_once_token_59 != -1) {
    dispatch_once(&contactTypeDescription_cn_once_token_59, &__block_literal_global_295);
  }
  uint64_t v2 = (void *)contactTypeDescription_cn_once_object_59;

  return v2;
}

+ (id)watchWallpaperImageDataDescription
{
  if (watchWallpaperImageDataDescription_cn_once_token_89 != -1) {
    dispatch_once(&watchWallpaperImageDataDescription_cn_once_token_89, &__block_literal_global_385);
  }
  uint64_t v2 = (void *)watchWallpaperImageDataDescription_cn_once_object_89;

  return v2;
}

+ (id)wallpaperMetadataDescription
{
  if (wallpaperMetadataDescription_cn_once_token_88 != -1) {
    dispatch_once(&wallpaperMetadataDescription_cn_once_token_88, &__block_literal_global_382);
  }
  uint64_t v2 = (void *)wallpaperMetadataDescription_cn_once_object_88;

  return v2;
}

+ (id)preferredLikenessSourceDescription
{
  if (preferredLikenessSourceDescription_cn_once_token_57 != -1) {
    dispatch_once(&preferredLikenessSourceDescription_cn_once_token_57, &__block_literal_global_289);
  }
  uint64_t v2 = (void *)preferredLikenessSourceDescription_cn_once_object_57;

  return v2;
}

+ (id)preferredForNameDescription
{
  if (preferredForNameDescription_cn_once_token_55 != -1) {
    dispatch_once(&preferredForNameDescription_cn_once_token_55, &__block_literal_global_283);
  }
  uint64_t v2 = (void *)preferredForNameDescription_cn_once_object_55;

  return v2;
}

+ (id)preferredForImageDescription
{
  if (preferredForImageDescription_cn_once_token_56 != -1) {
    dispatch_once(&preferredForImageDescription_cn_once_token_56, &__block_literal_global_286);
  }
  uint64_t v2 = (void *)preferredForImageDescription_cn_once_object_56;

  return v2;
}

+ (id)preferredApplePersonaIdentifierDescription
{
  if (preferredApplePersonaIdentifierDescription_cn_once_token_58 != -1) {
    dispatch_once(&preferredApplePersonaIdentifierDescription_cn_once_token_58, &__block_literal_global_292);
  }
  uint64_t v2 = (void *)preferredApplePersonaIdentifierDescription_cn_once_object_58;

  return v2;
}

+ (id)isUsingSharedPhotoDescription
{
  if (isUsingSharedPhotoDescription_cn_once_token_61 != -1) {
    dispatch_once(&isUsingSharedPhotoDescription_cn_once_token_61, &__block_literal_global_301);
  }
  uint64_t v2 = (void *)isUsingSharedPhotoDescription_cn_once_object_61;

  return v2;
}

+ (id)wallpaperURIDescription
{
  if (wallpaperURIDescription_cn_once_token_90 != -1) {
    dispatch_once(&wallpaperURIDescription_cn_once_token_90, &__block_literal_global_388);
  }
  uint64_t v2 = (void *)wallpaperURIDescription_cn_once_object_90;

  return v2;
}

+ (id)wallpaperSyncFailedTimeDescription
{
  if (wallpaperSyncFailedTimeDescription_cn_once_token_94 != -1) {
    dispatch_once(&wallpaperSyncFailedTimeDescription_cn_once_token_94, &__block_literal_global_400);
  }
  uint64_t v2 = (void *)wallpaperSyncFailedTimeDescription_cn_once_object_94;

  return v2;
}

+ (id)urlAddressesDescription
{
  if (urlAddressesDescription_cn_once_token_64 != -1) {
    dispatch_once(&urlAddressesDescription_cn_once_token_64, &__block_literal_global_310);
  }
  uint64_t v2 = (void *)urlAddressesDescription_cn_once_object_64;

  return v2;
}

+ (id)textAlertDescription
{
  if (textAlertDescription_cn_once_token_79 != -1) {
    dispatch_once(&textAlertDescription_cn_once_token_79, &__block_literal_global_355_0);
  }
  uint64_t v2 = (void *)textAlertDescription_cn_once_object_79;

  return v2;
}

+ (id)socialProfilesDescription
{
  if (socialProfilesDescription_cn_once_token_68 != -1) {
    dispatch_once(&socialProfilesDescription_cn_once_token_68, &__block_literal_global_322);
  }
  uint64_t v2 = (void *)socialProfilesDescription_cn_once_object_68;

  return v2;
}

+ (id)sensitiveContentConfigurationDescription
{
  if (sensitiveContentConfigurationDescription_cn_once_token_92 != -1) {
    dispatch_once(&sensitiveContentConfigurationDescription_cn_once_token_92, &__block_literal_global_394);
  }
  uint64_t v2 = (void *)sensitiveContentConfigurationDescription_cn_once_object_92;

  return v2;
}

+ (id)sectionForSortingByGivenNameDescription
{
  if (sectionForSortingByGivenNameDescription_cn_once_token_39 != -1) {
    dispatch_once(&sectionForSortingByGivenNameDescription_cn_once_token_39, &__block_literal_global_235);
  }
  uint64_t v2 = (void *)sectionForSortingByGivenNameDescription_cn_once_object_39;

  return v2;
}

+ (id)sectionForSortingByFamilyNameDescription
{
  if (sectionForSortingByFamilyNameDescription_cn_once_token_38 != -1) {
    dispatch_once(&sectionForSortingByFamilyNameDescription_cn_once_token_38, &__block_literal_global_232);
  }
  uint64_t v2 = (void *)sectionForSortingByFamilyNameDescription_cn_once_object_38;

  return v2;
}

+ (id)preferredChannelDescription
{
  if (preferredChannelDescription_cn_once_token_81 != -1) {
    dispatch_once(&preferredChannelDescription_cn_once_token_81, &__block_literal_global_361);
  }
  uint64_t v2 = (void *)preferredChannelDescription_cn_once_object_81;

  return v2;
}

+ (id)postalAddressesDescription
{
  if (postalAddressesDescription_cn_once_token_69 != -1) {
    dispatch_once(&postalAddressesDescription_cn_once_token_69, &__block_literal_global_325_0);
  }
  uint64_t v2 = (void *)postalAddressesDescription_cn_once_object_69;

  return v2;
}

+ (id)phonemeDataDescription
{
  if (phonemeDataDescription_cn_once_token_78 != -1) {
    dispatch_once(&phonemeDataDescription_cn_once_token_78, &__block_literal_global_352);
  }
  uint64_t v2 = (void *)phonemeDataDescription_cn_once_object_78;

  return v2;
}

+ (id)phoneNumbersDescription
{
  if (phoneNumbersDescription_cn_once_token_62 != -1) {
    dispatch_once(&phoneNumbersDescription_cn_once_token_62, &__block_literal_global_304);
  }
  uint64_t v2 = (void *)phoneNumbersDescription_cn_once_object_62;

  return v2;
}

+ (id)noteDescription
{
  if (noteDescription_cn_once_token_47 != -1) {
    dispatch_once(&noteDescription_cn_once_token_47, &__block_literal_global_259);
  }
  uint64_t v2 = (void *)noteDescription_cn_once_object_47;

  return v2;
}

+ (id)nonGregorianBirthdayDescription
{
  if (nonGregorianBirthdayDescription_cn_once_token_44 != -1) {
    dispatch_once(&nonGregorianBirthdayDescription_cn_once_token_44, &__block_literal_global_250);
  }
  uint64_t v2 = (void *)nonGregorianBirthdayDescription_cn_once_object_44;

  return v2;
}

+ (id)modificationDateDescription
{
  if (modificationDateDescription_cn_once_token_46 != -1) {
    dispatch_once(&modificationDateDescription_cn_once_token_46, &__block_literal_global_256);
  }
  uint64_t v2 = (void *)modificationDateDescription_cn_once_object_46;

  return v2;
}

+ (id)mapsDataDescription
{
  if (mapsDataDescription_cn_once_token_82 != -1) {
    dispatch_once(&mapsDataDescription_cn_once_token_82, &__block_literal_global_364);
  }
  uint64_t v2 = (void *)mapsDataDescription_cn_once_object_82;

  return v2;
}

+ (id)linkIdentifierDescription
{
  if (linkIdentifierDescription_cn_once_token_54 != -1) {
    dispatch_once(&linkIdentifierDescription_cn_once_token_54, &__block_literal_global_280);
  }
  uint64_t v2 = (void *)linkIdentifierDescription_cn_once_object_54;

  return v2;
}

+ (id)instantMessagAddressesDescription
{
  if (instantMessagAddressesDescription_cn_once_token_66 != -1) {
    dispatch_once(&instantMessagAddressesDescription_cn_once_token_66, &__block_literal_global_316);
  }
  uint64_t v2 = (void *)instantMessagAddressesDescription_cn_once_object_66;

  return v2;
}

+ (id)imageSyncFailedTimeDescription
{
  if (imageSyncFailedTimeDescription_cn_once_token_93 != -1) {
    dispatch_once(&imageSyncFailedTimeDescription_cn_once_token_93, &__block_literal_global_397);
  }
  uint64_t v2 = (void *)imageSyncFailedTimeDescription_cn_once_object_93;

  return v2;
}

+ (id)imageDataAvailableDescription
{
  if (imageDataAvailableDescription_cn_once_token_53 != -1) {
    dispatch_once(&imageDataAvailableDescription_cn_once_token_53, &__block_literal_global_277);
  }
  uint64_t v2 = (void *)imageDataAvailableDescription_cn_once_object_53;

  return v2;
}

+ (id)imageBackgroundColorsDataDescription
{
  if (imageBackgroundColorsDataDescription_cn_once_token_91 != -1) {
    dispatch_once(&imageBackgroundColorsDataDescription_cn_once_token_91, &__block_literal_global_391);
  }
  uint64_t v2 = (void *)imageBackgroundColorsDataDescription_cn_once_object_91;

  return v2;
}

+ (id)externalUUIDDescription
{
  if (externalUUIDDescription_cn_once_token_76 != -1) {
    dispatch_once(&externalUUIDDescription_cn_once_token_76, &__block_literal_global_346);
  }
  uint64_t v2 = (void *)externalUUIDDescription_cn_once_object_76;

  return v2;
}

+ (id)externalRepresentationDescription
{
  if (externalRepresentationDescription_cn_once_token_75 != -1) {
    dispatch_once(&externalRepresentationDescription_cn_once_token_75, &__block_literal_global_343);
  }
  uint64_t v2 = (void *)externalRepresentationDescription_cn_once_object_75;

  return v2;
}

+ (id)externalModificationTagDescription
{
  if (externalModificationTagDescription_cn_once_token_74 != -1) {
    dispatch_once(&externalModificationTagDescription_cn_once_token_74, &__block_literal_global_340);
  }
  uint64_t v2 = (void *)externalModificationTagDescription_cn_once_object_74;

  return v2;
}

+ (id)externalIdentifierDescription
{
  if (externalIdentifierDescription_cn_once_token_73 != -1) {
    dispatch_once(&externalIdentifierDescription_cn_once_token_73, &__block_literal_global_337);
  }
  uint64_t v2 = (void *)externalIdentifierDescription_cn_once_object_73;

  return v2;
}

+ (id)emailAddressesDescription
{
  if (emailAddressesDescription_cn_once_token_63 != -1) {
    dispatch_once(&emailAddressesDescription_cn_once_token_63, &__block_literal_global_307);
  }
  uint64_t v2 = (void *)emailAddressesDescription_cn_once_object_63;

  return v2;
}

+ (id)downtimeWhitelistDescription
{
  if (downtimeWhitelistDescription_cn_once_token_83 != -1) {
    dispatch_once(&downtimeWhitelistDescription_cn_once_token_83, &__block_literal_global_367);
  }
  uint64_t v2 = (void *)downtimeWhitelistDescription_cn_once_object_83;

  return v2;
}

+ (id)datesDescription
{
  if (datesDescription_cn_once_token_65 != -1) {
    dispatch_once(&datesDescription_cn_once_token_65, &__block_literal_global_313);
  }
  uint64_t v2 = (void *)datesDescription_cn_once_object_65;

  return v2;
}

+ (id)creationDateDescription
{
  if (creationDateDescription_cn_once_token_45 != -1) {
    dispatch_once(&creationDateDescription_cn_once_token_45, &__block_literal_global_253);
  }
  uint64_t v2 = (void *)creationDateDescription_cn_once_object_45;

  return v2;
}

+ (id)contactRelationsDescription
{
  if (contactRelationsDescription_cn_once_token_67 != -1) {
    dispatch_once(&contactRelationsDescription_cn_once_token_67, &__block_literal_global_319);
  }
  uint64_t v2 = (void *)contactRelationsDescription_cn_once_object_67;

  return v2;
}

+ (id)callAlertDescription
{
  if (callAlertDescription_cn_once_token_80 != -1) {
    dispatch_once(&callAlertDescription_cn_once_token_80, &__block_literal_global_358_0);
  }
  uint64_t v2 = (void *)callAlertDescription_cn_once_object_80;

  return v2;
}

+ (id)calendarURIsDescription
{
  if (calendarURIsDescription_cn_once_token_72 != -1) {
    dispatch_once(&calendarURIsDescription_cn_once_token_72, &__block_literal_global_334);
  }
  uint64_t v2 = (void *)calendarURIsDescription_cn_once_object_72;

  return v2;
}

+ (id)birthdayDescription
{
  if (birthdayDescription_cn_once_token_43 != -1) {
    dispatch_once(&birthdayDescription_cn_once_token_43, &__block_literal_global_247);
  }
  uint64_t v2 = (void *)birthdayDescription_cn_once_object_43;

  return v2;
}

+ (id)addressingGrammarsEncryptedDescription
{
  if (addressingGrammarsEncryptedDescription_cn_once_token_71 != -1) {
    dispatch_once(&addressingGrammarsEncryptedDescription_cn_once_token_71, &__block_literal_global_331);
  }
  uint64_t v2 = (void *)addressingGrammarsEncryptedDescription_cn_once_object_71;

  return v2;
}

+ (id)addressingGrammarsDescription
{
  if (addressingGrammarsDescription_cn_once_token_70 != -1) {
    dispatch_once(&addressingGrammarsDescription_cn_once_token_70, &__block_literal_global_328);
  }
  uint64_t v2 = (void *)addressingGrammarsDescription_cn_once_object_70;

  return v2;
}

+ (id)alwaysFetchedProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CN_PropertyDescription__alwaysFetchedProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (alwaysFetchedProperties_cn_once_token_6 != -1) {
    dispatch_once(&alwaysFetchedProperties_cn_once_token_6, block);
  }
  uint64_t v2 = (void *)alwaysFetchedProperties_cn_once_object_6;

  return v2;
}

void __51__CN_PropertyDescription__allWallpaperPropertyKeys__block_invoke()
{
  id v4 = +[CN allWallpaperProperties];
  v0 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_166);
  v1 = +[CNContactKeyVector keyVectorWithKeys:v0];
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)allWallpaperPropertyKeys_cn_once_object_11;
  allWallpaperPropertyKeys_cn_once_object_11 = v2;
}

+ (id)allWallpaperProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CN_PropertyDescription__allWallpaperProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allWallpaperProperties_cn_once_token_10 != -1) {
    dispatch_once(&allWallpaperProperties_cn_once_token_10, block);
  }
  uint64_t v2 = (void *)allWallpaperProperties_cn_once_object_10;

  return v2;
}

void __51__CN_PropertyDescription__allImageDataPropertyKeys__block_invoke()
{
  id v4 = +[CN allImageDataProperties];
  v0 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_162);
  v1 = +[CNContactKeyVector keyVectorWithKeys:v0];
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)allImageDataPropertyKeys_cn_once_object_9;
  allImageDataPropertyKeys_cn_once_object_9 = v2;
}

+ (id)allImageDataProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CN_PropertyDescription__allImageDataProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allImageDataProperties_cn_once_token_8 != -1) {
    dispatch_once(&allImageDataProperties_cn_once_token_8, block);
  }
  uint64_t v2 = (void *)allImageDataProperties_cn_once_object_8;

  return v2;
}

void __62__CN_PropertyDescription__writableMultiValueContactProperties__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) writableContactProperties];
  v1 = objc_msgSend(v4, "_cn_filter:", &__block_literal_global_177);
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)writableMultiValueContactProperties_cn_once_object_18;
  writableMultiValueContactProperties_cn_once_object_18 = v2;
}

void __63__CN_PropertyDescription__writableSingleValueContactProperties__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) writableContactProperties];
  v1 = objc_msgSend(v4, "_cn_filter:", &__block_literal_global_175_0);
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)writableSingleValueContactProperties_cn_once_object_17;
  writableSingleValueContactProperties_cn_once_object_17 = v2;
}

+ (id)writableContactProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CN_PropertyDescription__writableContactProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (writableContactProperties_cn_once_token_16 != -1) {
    dispatch_once(&writableContactProperties_cn_once_token_16, block);
  }
  uint64_t v2 = (void *)writableContactProperties_cn_once_object_16;

  return v2;
}

void __52__CN_PropertyDescription__writableContactProperties__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) allContactProperties];
  v1 = objc_msgSend(v4, "_cn_filter:", &__block_literal_global_173);
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)writableContactProperties_cn_once_object_16;
  writableContactProperties_cn_once_object_16 = v2;
}

+ (id)containerIdentifierDescription
{
  if (containerIdentifierDescription_cn_once_token_0 != -1) {
    dispatch_once(&containerIdentifierDescription_cn_once_token_0, &__block_literal_global_5);
  }
  uint64_t v2 = (void *)containerIdentifierDescription_cn_once_object_0;

  return v2;
}

uint64_t __68__CN_CNContainerPropertyDescription__containerIdentifierDescription__block_invoke()
{
  containerIdentifierDescription_cn_once_object_0 = objc_alloc_init(CNContainerIdentifierDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containerNameDescription
{
  if (containerNameDescription_cn_once_token_1 != -1) {
    dispatch_once(&containerNameDescription_cn_once_token_1, &__block_literal_global_101);
  }
  uint64_t v2 = (void *)containerNameDescription_cn_once_object_1;

  return v2;
}

uint64_t __62__CN_CNContainerPropertyDescription__containerNameDescription__block_invoke()
{
  containerNameDescription_cn_once_object_1 = objc_alloc_init(CNContainerNameDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containerTypeDescription
{
  if (containerTypeDescription_cn_once_token_2 != -1) {
    dispatch_once(&containerTypeDescription_cn_once_token_2, &__block_literal_global_104);
  }
  uint64_t v2 = (void *)containerTypeDescription_cn_once_object_2;

  return v2;
}

uint64_t __62__CN_CNContainerPropertyDescription__containerTypeDescription__block_invoke()
{
  containerTypeDescription_cn_once_object_2 = objc_alloc_init(CNContainerTypeDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containeriOSLegacyIdentifierDescription
{
  if (containeriOSLegacyIdentifierDescription_cn_once_token_3 != -1) {
    dispatch_once(&containeriOSLegacyIdentifierDescription_cn_once_token_3, &__block_literal_global_107_0);
  }
  uint64_t v2 = (void *)containeriOSLegacyIdentifierDescription_cn_once_object_3;

  return v2;
}

uint64_t __77__CN_CNContainerPropertyDescription__containeriOSLegacyIdentifierDescription__block_invoke()
{
  containeriOSLegacyIdentifierDescription_cn_once_object_3 = objc_alloc_init(CNContainerIOSLegacyIdentifierDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containerAccountIdentifierDescription
{
  if (containerAccountIdentifierDescription_cn_once_token_4 != -1) {
    dispatch_once(&containerAccountIdentifierDescription_cn_once_token_4, &__block_literal_global_110_0);
  }
  uint64_t v2 = (void *)containerAccountIdentifierDescription_cn_once_object_4;

  return v2;
}

uint64_t __75__CN_CNContainerPropertyDescription__containerAccountIdentifierDescription__block_invoke()
{
  containerAccountIdentifierDescription_cn_once_object_4 = objc_alloc_init(CNContainerAccountIdentifierDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containerEnabledDescription
{
  if (containerEnabledDescription_cn_once_token_5 != -1) {
    dispatch_once(&containerEnabledDescription_cn_once_token_5, &__block_literal_global_113_0);
  }
  uint64_t v2 = (void *)containerEnabledDescription_cn_once_object_5;

  return v2;
}

uint64_t __65__CN_CNContainerPropertyDescription__containerEnabledDescription__block_invoke()
{
  containerEnabledDescription_cn_once_object_5 = objc_alloc_init(CNContainerEnabledDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containerExternalIdentifierDescription
{
  if (containerExternalIdentifierDescription_cn_once_token_6 != -1) {
    dispatch_once(&containerExternalIdentifierDescription_cn_once_token_6, &__block_literal_global_116);
  }
  uint64_t v2 = (void *)containerExternalIdentifierDescription_cn_once_object_6;

  return v2;
}

uint64_t __76__CN_CNContainerPropertyDescription__containerExternalIdentifierDescription__block_invoke()
{
  containerExternalIdentifierDescription_cn_once_object_6 = objc_alloc_init(CNContainerExternalIdentifierDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containerExternalModificationTagDescription
{
  if (containerExternalModificationTagDescription_cn_once_token_7 != -1) {
    dispatch_once(&containerExternalModificationTagDescription_cn_once_token_7, &__block_literal_global_119);
  }
  uint64_t v2 = (void *)containerExternalModificationTagDescription_cn_once_object_7;

  return v2;
}

uint64_t __81__CN_CNContainerPropertyDescription__containerExternalModificationTagDescription__block_invoke()
{
  containerExternalModificationTagDescription_cn_once_object_7 = objc_alloc_init(CNContainerExternalModificationTagDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containerExternalSyncTagDescription
{
  if (containerExternalSyncTagDescription_cn_once_token_8 != -1) {
    dispatch_once(&containerExternalSyncTagDescription_cn_once_token_8, &__block_literal_global_122);
  }
  uint64_t v2 = (void *)containerExternalSyncTagDescription_cn_once_object_8;

  return v2;
}

uint64_t __73__CN_CNContainerPropertyDescription__containerExternalSyncTagDescription__block_invoke()
{
  containerExternalSyncTagDescription_cn_once_object_8 = objc_alloc_init(CNContainerExternalSyncTagDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containerExternalSyncDataDescription
{
  if (containerExternalSyncDataDescription_cn_once_token_9 != -1) {
    dispatch_once(&containerExternalSyncDataDescription_cn_once_token_9, &__block_literal_global_125);
  }
  uint64_t v2 = (void *)containerExternalSyncDataDescription_cn_once_object_9;

  return v2;
}

uint64_t __74__CN_CNContainerPropertyDescription__containerExternalSyncDataDescription__block_invoke()
{
  containerExternalSyncDataDescription_cn_once_object_9 = objc_alloc_init(CNContainerExternalSyncDataDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containerConstraintsPathDescription
{
  if (containerConstraintsPathDescription_cn_once_token_10 != -1) {
    dispatch_once(&containerConstraintsPathDescription_cn_once_token_10, &__block_literal_global_128);
  }
  uint64_t v2 = (void *)containerConstraintsPathDescription_cn_once_object_10;

  return v2;
}

uint64_t __73__CN_CNContainerPropertyDescription__containerConstraintsPathDescription__block_invoke()
{
  containerConstraintsPathDescription_cn_once_object_10 = objc_alloc_init(CNContainerConstraintsPathDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containerMeIdentifierDescription
{
  if (containerMeIdentifierDescription_cn_once_token_11 != -1) {
    dispatch_once(&containerMeIdentifierDescription_cn_once_token_11, &__block_literal_global_131);
  }
  uint64_t v2 = (void *)containerMeIdentifierDescription_cn_once_object_11;

  return v2;
}

uint64_t __70__CN_CNContainerPropertyDescription__containerMeIdentifierDescription__block_invoke()
{
  containerMeIdentifierDescription_cn_once_object_11 = objc_alloc_init(CNContainerMeIdentifierDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containerRestrictionsDescription
{
  if (containerRestrictionsDescription_cn_once_token_12 != -1) {
    dispatch_once(&containerRestrictionsDescription_cn_once_token_12, &__block_literal_global_134);
  }
  uint64_t v2 = (void *)containerRestrictionsDescription_cn_once_object_12;

  return v2;
}

uint64_t __70__CN_CNContainerPropertyDescription__containerRestrictionsDescription__block_invoke()
{
  containerRestrictionsDescription_cn_once_object_12 = objc_alloc_init(CNContainerRestrictionsDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containerGuardianRestrictedDescription
{
  if (containerGuardianRestrictedDescription_cn_once_token_13 != -1) {
    dispatch_once(&containerGuardianRestrictedDescription_cn_once_token_13, &__block_literal_global_137);
  }
  uint64_t v2 = (void *)containerGuardianRestrictedDescription_cn_once_object_13;

  return v2;
}

uint64_t __76__CN_CNContainerPropertyDescription__containerGuardianRestrictedDescription__block_invoke()
{
  containerGuardianRestrictedDescription_cn_once_object_13 = objc_alloc_init(CNContainerGuardianRestrictedDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containerGuardianStateDirtyDescription
{
  if (containerGuardianStateDirtyDescription_cn_once_token_14 != -1) {
    dispatch_once(&containerGuardianStateDirtyDescription_cn_once_token_14, &__block_literal_global_140);
  }
  uint64_t v2 = (void *)containerGuardianStateDirtyDescription_cn_once_object_14;

  return v2;
}

uint64_t __76__CN_CNContainerPropertyDescription__containerGuardianStateDirtyDescription__block_invoke()
{
  containerGuardianStateDirtyDescription_cn_once_object_14 = objc_alloc_init(CNContainerGuardianStateDirtyDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containerLastSyncDateDescription
{
  if (containerLastSyncDateDescription_cn_once_token_15 != -1) {
    dispatch_once(&containerLastSyncDateDescription_cn_once_token_15, &__block_literal_global_143);
  }
  uint64_t v2 = (void *)containerLastSyncDateDescription_cn_once_object_15;

  return v2;
}

uint64_t __70__CN_CNContainerPropertyDescription__containerLastSyncDateDescription__block_invoke()
{
  containerLastSyncDateDescription_cn_once_object_15 = objc_alloc_init(CNContainerLastSyncDateDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containerProviderIdentifierDescription
{
  if (containerProviderIdentifierDescription_cn_once_token_16 != -1) {
    dispatch_once(&containerProviderIdentifierDescription_cn_once_token_16, &__block_literal_global_146);
  }
  uint64_t v2 = (void *)containerProviderIdentifierDescription_cn_once_object_16;

  return v2;
}

uint64_t __76__CN_CNContainerPropertyDescription__containerProviderIdentifierDescription__block_invoke()
{
  containerProviderIdentifierDescription_cn_once_object_16 = objc_alloc_init(CNContainerProviderIdentifierDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)containerProviderMetadataDescription
{
  if (containerProviderMetadataDescription_cn_once_token_17 != -1) {
    dispatch_once(&containerProviderMetadataDescription_cn_once_token_17, &__block_literal_global_149);
  }
  uint64_t v2 = (void *)containerProviderMetadataDescription_cn_once_object_17;

  return v2;
}

uint64_t __74__CN_CNContainerPropertyDescription__containerProviderMetadataDescription__block_invoke()
{
  containerProviderMetadataDescription_cn_once_object_17 = objc_alloc_init(CNContainerProviderMetadataDescription);

  return MEMORY[0x1F41817F8]();
}

+ (id)allContainerProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CN_CNContainerPropertyDescription__allContainerProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allContainerProperties_cn_once_token_18 != -1) {
    dispatch_once(&allContainerProperties_cn_once_token_18, block);
  }
  uint64_t v2 = (void *)allContainerProperties_cn_once_object_18;

  return v2;
}

void __60__CN_CNContainerPropertyDescription__allContainerProperties__block_invoke(uint64_t a1)
{
  v23[18] = *MEMORY[0x1E4F143B8];
  long long v22 = [*(id *)(a1 + 32) containerIdentifierDescription];
  v23[0] = v22;
  long long v21 = [*(id *)(a1 + 32) containerNameDescription];
  v23[1] = v21;
  long long v20 = [*(id *)(a1 + 32) containerTypeDescription];
  v23[2] = v20;
  long long v19 = [*(id *)(a1 + 32) containeriOSLegacyIdentifierDescription];
  v23[3] = v19;
  v18 = [*(id *)(a1 + 32) containerAccountIdentifierDescription];
  v23[4] = v18;
  v17 = [*(id *)(a1 + 32) containerEnabledDescription];
  v23[5] = v17;
  v16 = [*(id *)(a1 + 32) containerExternalIdentifierDescription];
  v23[6] = v16;
  BOOL v15 = [*(id *)(a1 + 32) containerExternalModificationTagDescription];
  v23[7] = v15;
  uint64_t v14 = [*(id *)(a1 + 32) containerExternalSyncTagDescription];
  v23[8] = v14;
  uint64_t v2 = [*(id *)(a1 + 32) containerExternalSyncDataDescription];
  v23[9] = v2;
  uint64_t v3 = [*(id *)(a1 + 32) containerConstraintsPathDescription];
  v23[10] = v3;
  id v4 = [*(id *)(a1 + 32) containerMeIdentifierDescription];
  v23[11] = v4;
  uint64_t v5 = [*(id *)(a1 + 32) containerRestrictionsDescription];
  v23[12] = v5;
  uint64_t v6 = [*(id *)(a1 + 32) containerGuardianRestrictedDescription];
  v23[13] = v6;
  id v7 = [*(id *)(a1 + 32) containerGuardianStateDirtyDescription];
  v23[14] = v7;
  id v8 = [*(id *)(a1 + 32) containerLastSyncDateDescription];
  v23[15] = v8;
  uint64_t v9 = [*(id *)(a1 + 32) containerProviderIdentifierDescription];
  v23[16] = v9;
  id v10 = [*(id *)(a1 + 32) containerProviderMetadataDescription];
  v23[17] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:18];
  uint64_t v12 = [v11 copy];
  int v13 = (void *)allContainerProperties_cn_once_object_18;
  allContainerProperties_cn_once_object_18 = v12;
}

+ (id)writableContainerProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CN_CNContainerPropertyDescription__writableContainerProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (writableContainerProperties_cn_once_token_19 != -1) {
    dispatch_once(&writableContainerProperties_cn_once_token_19, block);
  }
  uint64_t v2 = (void *)writableContainerProperties_cn_once_object_19;

  return v2;
}

void __65__CN_CNContainerPropertyDescription__writableContainerProperties__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) allContainerProperties];
  v1 = objc_msgSend(v4, "_cn_filter:", &__block_literal_global_155);
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)writableContainerProperties_cn_once_object_19;
  writableContainerProperties_cn_once_object_19 = v2;
}

uint64_t __65__CN_CNContainerPropertyDescription__writableContainerProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isWritable];
}

+ (id)mutableContactUnifyingContacts:(id)a3 includingMainStoreContacts:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    id v7 = 0;
  }
  else
  {
    if ([v6 count] == 1)
    {
      objc_opt_class();
      id v7 = [v6 firstObject];
      if (objc_opt_isKindOfClass()) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
      uint64_t v9 = v8;

      if (v9)
      {
        uint64_t v9 = v9;
      }
      else
      {
        id v10 = [v6 firstObject];
        id v7 = (void *)[v10 mutableCopy];
      }
    }
    else
    {
      uint64_t v9 = objc_alloc_init(CNContactUnificationOptions);
      [(CNContactUnificationOptions *)v9 setShouldIncludeMainStoreContacts:v4];
      id v7 = [a1 _unifyContacts:v6 options:v9];
      [v7 setFrozenSelfAsSnapshot];
    }
  }

  return v7;
}

+ (id)contactUnifyingContacts:(id)a3 includingMainStoreContacts:(BOOL)a4 allowMutableContactFreeze:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = objc_alloc_init(CNContactUnificationOptions);
  [(CNContactUnificationOptions *)v9 setShouldIncludeMainStoreContacts:v6];
  [(CNContactUnificationOptions *)v9 setShouldFreezeMutableContacts:v5];
  id v10 = [a1 contactUnifyingContacts:v8 options:v9];

  return v10;
}

+ (id)unifyMultivalues:(id)a3 forProperty:(id)a4
{
  return +[CNUnifiedContacts unifyMultivalues:forProperty:]((uint64_t)CNUnifiedContacts, a3, a4);
}

+ (id)unifyMultivalues:(id)a3 forProperty:(id)a4 options:(id)a5
{
  return +[CNUnifiedContacts unifyMultivalues:forProperty:options:]((uint64_t)CNUnifiedContacts, a3, a4, a5);
}

+ (id)unifyContactMatchInfos:(id)a3 linkedContacts:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__8;
  v29 = __Block_byref_object_dispose__8;
  id v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__CN_UnifiedContacts__unifyContactMatchInfos_linkedContacts___block_invoke;
  v19[3] = &unk_1E56B4CE0;
  id v7 = v5;
  id v20 = v7;
  long long v21 = &v25;
  long long v22 = v23;
  [v6 enumerateObjectsUsingBlock:v19];
  if ((unint64_t)[v7 count] < 2)
  {
    id v8 = (id)v26[5];
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__8;
    v17 = __Block_byref_object_dispose__8;
    id v18 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__CN_UnifiedContacts__unifyContactMatchInfos_linkedContacts___block_invoke_2;
    v12[3] = &unk_1E56B4D08;
    v12[4] = &v13;
    [v7 enumerateKeysAndObjectsUsingBlock:v12];
    id v8 = (id)[(id)v26[5] copy];
    [v8 setMatchedTerms:v14[5]];
    _Block_object_dispose(&v13, 8);
  }
  uint64_t v9 = v20;
  id v10 = v8;

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  return v10;
}

void __61__CN_UnifiedContacts__unifyContactMatchInfos_linkedContacts___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = (void *)a1[4];
  id v10 = v6;
  id v8 = [v6 identifier];
  uint64_t v9 = [v7 objectForKey:v8];

  if (v9) {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v9);
  }
  if ([v10 isPreferredForName]) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24) && *(void *)(*(void *)(a1[5] + 8) + 40)) {
    *a4 = 1;
  }
}

void __61__CN_UnifiedContacts__unifyContactMatchInfos_linkedContacts___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  BOOL v4 = [v11 matchedTerms];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    id v10 = [v11 matchedTerms];
    [v6 unionSet:v10];
  }
}

+ (id)identifierMapForUnifiedContact:(id)a3 backingContacts:(id)a4
{
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  uint64_t v7 = CNResultWithAutoreleasePool();

  return v7;
}

id __70__CN_UnifiedContacts__identifierMapForUnifiedContact_backingContacts___block_invoke(uint64_t a1)
{
  return +[CNUnifiedContacts identifierMapForUnifiedContact:backingContacts:]((uint64_t)CNUnifiedContacts, *(void **)(a1 + 32), *(void **)(a1 + 40));
}

+ (id)identifierMapForUnifiedMultiValue:(id)a3 backingMultiValues:(id)a4 forProperty:(id)a5
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  id v10 = CNResultWithAutoreleasePool();

  return v10;
}

id __88__CN_UnifiedContacts__identifierMapForUnifiedMultiValue_backingMultiValues_forProperty___block_invoke(void **a1)
{
  return +[CNUnifiedContacts identifierMapForUnifiedMultiValue:backingMultiValues:forProperty:]((uint64_t)CNUnifiedContacts, a1[4], a1[5], a1[6]);
}

+ (id)groupIdentifiersByLabeledValue:(id)a3 forProperty:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F5A460] multiDictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v13 = [v7 allKeys];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __66__CN_UnifiedContacts__groupIdentifiersByLabeledValue_forProperty___block_invoke;
        v19[3] = &unk_1E56B4D58;
        void v19[4] = v12;
        id v20 = v6;
        id v14 = objc_msgSend(v13, "_cn_filter:", v19);

        if ([v14 count]) {
          [v14 lastObject];
        }
        else {
        uint64_t v15 = [v12 labelValuePair];
        }
        v16 = [v12 identifier];
        [v7 addObject:v16 forKey:v15];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  return v7;
}

uint64_t __66__CN_UnifiedContacts__groupIdentifiersByLabeledValue_forProperty___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 labelValuePair];
  uint64_t v6 = canUnifyLabeledValuePairs(v5, v4, *(void **)(a1 + 40));

  return v6;
}

+ (unint64_t)indexOfUnifiedIdentifier:(id)a3 onNonUnifiedMultiValue:(id)a4 withIdentifierMap:(id)a5
{
  return +[CNUnifiedContacts indexOfUnifiedIdentifier:onNonUnifiedMultiValue:withIdentifierMap:]((uint64_t)CNUnifiedContacts, a3, a4, a5);
}

+ (void)addLinkedIdentifier:(id)a3 toLabeledValue:(id)a4
{
}

+ (id)sourceContactForValue:(id)a3 labeledValueIdentifier:(id)a4 propertyKey:(id)a5 inUnifiedContact:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v12 isUnified])
  {
    id v13 = +[CN contactPropertiesByKey];
    id v14 = [v13 objectForKeyedSubscript:v11];

    char v15 = [v14 isMultiValue];
    if (v10 && (v15 & 1) != 0 || (int v16 = [v14 isMultiValue], v9) && !v16)
    {
      if ([v14 isMultiValue])
      {
        id v17 = v10;
        id v18 = v14;
        uint64_t v26 = MEMORY[0x1E4F143A8];
        uint64_t v27 = 3221225472;
        long long v19 = ___contactTestMatchingLabeledValueID_block_invoke;
      }
      else
      {
        id v17 = v9;
        id v18 = v14;
        uint64_t v26 = MEMORY[0x1E4F143A8];
        uint64_t v27 = 3221225472;
        long long v19 = ___contactTestMatchingValue_block_invoke;
      }
      v28 = v19;
      v29 = &unk_1E56B4FB8;
      id v30 = v18;
      id v31 = v17;
      long long v21 = _Block_copy(&v26);

      long long v22 = objc_msgSend(v12, "linkedContacts", v26, v27);
      long long v23 = objc_msgSend(v22, "_cn_firstObjectPassingTest:", v21);

      if (v23) {
        long long v24 = v23;
      }
      else {
        long long v24 = v12;
      }
      id v20 = v24;
    }
    else
    {
      id v20 = v12;
    }
  }
  else
  {
    id v20 = v12;
  }

  return v20;
}

+ (id)squashableContactCardPropertyKeys
{
  if (squashableContactCardPropertyKeys_cn_once_token_3 != -1) {
    dispatch_once(&squashableContactCardPropertyKeys_cn_once_token_3, &__block_literal_global_145_0);
  }
  uint64_t v2 = (void *)squashableContactCardPropertyKeys_cn_once_object_3;

  return v2;
}

void __60__CN_PropertyDescription__squashableContactCardPropertyKeys__block_invoke()
{
  id v4 = +[CN squashableContactCardProperties];
  v0 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_149_0);
  v1 = +[CNContactKeyVector keyVectorWithKeys:v0];
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)squashableContactCardPropertyKeys_cn_once_object_3;
  squashableContactCardPropertyKeys_cn_once_object_3 = v2;
}

uint64_t __60__CN_PropertyDescription__squashableContactCardPropertyKeys__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 key];
}

+ (id)squashableContactCardProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CN_PropertyDescription__squashableContactCardProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (squashableContactCardProperties_cn_once_token_4 != -1) {
    dispatch_once(&squashableContactCardProperties_cn_once_token_4, block);
  }
  uint64_t v2 = (void *)squashableContactCardProperties_cn_once_object_4;

  return v2;
}

void __58__CN_PropertyDescription__squashableContactCardProperties__block_invoke(uint64_t a1)
{
  v31[26] = *MEMORY[0x1E4F143B8];
  id v30 = [*(id *)(a1 + 32) namePrefixDescription];
  v31[0] = v30;
  v29 = [*(id *)(a1 + 32) givenNameDescription];
  v31[1] = v29;
  v28 = [*(id *)(a1 + 32) middleNameDescription];
  v31[2] = v28;
  uint64_t v27 = [*(id *)(a1 + 32) familyNameDescription];
  v31[3] = v27;
  uint64_t v26 = [*(id *)(a1 + 32) nameSuffixDescription];
  v31[4] = v26;
  uint64_t v25 = [*(id *)(a1 + 32) previousFamilyNameDescription];
  v31[5] = v25;
  long long v24 = [*(id *)(a1 + 32) nicknameDescription];
  v31[6] = v24;
  long long v23 = [*(id *)(a1 + 32) phoneticGivenNameDescription];
  v31[7] = v23;
  long long v22 = [*(id *)(a1 + 32) phoneticMiddleNameDescription];
  v31[8] = v22;
  long long v21 = [*(id *)(a1 + 32) phoneticFamilyNameDescription];
  v31[9] = v21;
  id v20 = [*(id *)(a1 + 32) phoneticOrganizationNameDescription];
  v31[10] = v20;
  long long v19 = [*(id *)(a1 + 32) addressingGrammarsDescription];
  v31[11] = v19;
  id v18 = [*(id *)(a1 + 32) addressingGrammarsEncryptedDescription];
  v31[12] = v18;
  id v17 = [*(id *)(a1 + 32) organizationNameDescription];
  v31[13] = v17;
  int v16 = [*(id *)(a1 + 32) departmentDescription];
  v31[14] = v16;
  char v15 = [*(id *)(a1 + 32) jobTitleDescription];
  v31[15] = v15;
  id v14 = [*(id *)(a1 + 32) birthdayDescription];
  v31[16] = v14;
  uint64_t v2 = [*(id *)(a1 + 32) nonGregorianBirthdayDescription];
  v31[17] = v2;
  uint64_t v3 = [*(id *)(a1 + 32) phoneNumbersDescription];
  v31[18] = v3;
  id v4 = [*(id *)(a1 + 32) emailAddressesDescription];
  v31[19] = v4;
  id v5 = [*(id *)(a1 + 32) urlAddressesDescription];
  v31[20] = v5;
  uint64_t v6 = [*(id *)(a1 + 32) datesDescription];
  v31[21] = v6;
  id v7 = [*(id *)(a1 + 32) instantMessagAddressesDescription];
  v31[22] = v7;
  uint64_t v8 = [*(id *)(a1 + 32) contactRelationsDescription];
  v31[23] = v8;
  id v9 = [*(id *)(a1 + 32) socialProfilesDescription];
  v31[24] = v9;
  id v10 = [*(id *)(a1 + 32) postalAddressesDescription];
  v31[25] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:26];
  uint64_t v12 = [v11 copy];
  id v13 = (void *)squashableContactCardProperties_cn_once_object_4;
  squashableContactCardProperties_cn_once_object_4 = v12;
}

+ (id)allContactPropertyKeys
{
  if (allContactPropertyKeys_cn_once_token_5 != -1) {
    dispatch_once(&allContactPropertyKeys_cn_once_token_5, &__block_literal_global_151);
  }
  uint64_t v2 = (void *)allContactPropertyKeys_cn_once_object_5;

  return v2;
}

void __49__CN_PropertyDescription__allContactPropertyKeys__block_invoke()
{
  id v4 = +[CN allContactProperties];
  v0 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_153_0);
  v1 = +[CNContactKeyVector keyVectorWithKeys:v0];
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)allContactPropertyKeys_cn_once_object_5;
  allContactPropertyKeys_cn_once_object_5 = v2;
}

uint64_t __49__CN_PropertyDescription__allContactPropertyKeys__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 key];
}

+ (id)writableAlwaysFetchedProperties
{
  if (writableAlwaysFetchedProperties_cn_once_token_7 != -1) {
    dispatch_once(&writableAlwaysFetchedProperties_cn_once_token_7, &__block_literal_global_155_0);
  }
  uint64_t v2 = (void *)writableAlwaysFetchedProperties_cn_once_object_7;

  return v2;
}

void __58__CN_PropertyDescription__writableAlwaysFetchedProperties__block_invoke()
{
  id v3 = +[CN alwaysFetchedProperties];
  v0 = objc_msgSend(v3, "_cn_filter:", &__block_literal_global_158);
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)writableAlwaysFetchedProperties_cn_once_object_7;
  writableAlwaysFetchedProperties_cn_once_object_7 = v1;
}

uint64_t __58__CN_PropertyDescription__writableAlwaysFetchedProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isWritable];
}

+ (id)singleValueContactProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CN_PropertyDescription__singleValueContactProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (singleValueContactProperties_cn_once_token_14 != -1) {
    dispatch_once(&singleValueContactProperties_cn_once_token_14, block);
  }
  uint64_t v2 = (void *)singleValueContactProperties_cn_once_object_14;

  return v2;
}

void __55__CN_PropertyDescription__singleValueContactProperties__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) allContactProperties];
  uint64_t v1 = objc_msgSend(v4, "_cn_filter:", &__block_literal_global_169);
  uint64_t v2 = [v1 copy];
  id v3 = (void *)singleValueContactProperties_cn_once_object_14;
  singleValueContactProperties_cn_once_object_14 = v2;
}

uint64_t __55__CN_PropertyDescription__singleValueContactProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isMultiValue] ^ 1;
}

+ (id)multiValueContactProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CN_PropertyDescription__multiValueContactProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (multiValueContactProperties_cn_once_token_15 != -1) {
    dispatch_once(&multiValueContactProperties_cn_once_token_15, block);
  }
  uint64_t v2 = (void *)multiValueContactProperties_cn_once_object_15;

  return v2;
}

void __54__CN_PropertyDescription__multiValueContactProperties__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) allContactProperties];
  uint64_t v1 = objc_msgSend(v4, "_cn_filter:", &__block_literal_global_171);
  uint64_t v2 = [v1 copy];
  id v3 = (void *)multiValueContactProperties_cn_once_object_15;
  multiValueContactProperties_cn_once_object_15 = v2;
}

uint64_t __54__CN_PropertyDescription__multiValueContactProperties__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isMultiValue];
}

+ (void)resetRestrictedPropertiesOnMutableContact:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = objc_msgSend(a1, "restrictedProperties", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v10 key];
        int v12 = [v4 isKeyAvailable:v11];

        if (v12) {
          [v10 resetGuardianManagedValueOnContact:v4];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

+ (NSArray)restrictedProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CN_PropertyDescription__restrictedProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (restrictedProperties_cn_once_token_21 != -1) {
    dispatch_once(&restrictedProperties_cn_once_token_21, block);
  }
  uint64_t v2 = (void *)restrictedProperties_cn_once_object_21;

  return (NSArray *)v2;
}

void __47__CN_PropertyDescription__restrictedProperties__block_invoke(uint64_t a1)
{
  v13[8] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) downtimeWhitelistDescription];
  v13[0] = v2;
  id v3 = [*(id *)(a1 + 32) externalIdentifierDescription];
  v13[1] = v3;
  id v4 = [*(id *)(a1 + 32) externalModificationTagDescription];
  v13[2] = v4;
  id v5 = [*(id *)(a1 + 32) externalRepresentationDescription];
  v13[3] = v5;
  uint64_t v6 = [*(id *)(a1 + 32) externalUUIDDescription];
  v13[4] = v6;
  uint64_t v7 = [*(id *)(a1 + 32) iOSLegacyIdentifierDescription];
  v13[5] = v7;
  uint64_t v8 = [*(id *)(a1 + 32) preferredChannelDescription];
  v13[6] = v8;
  id v9 = [*(id *)(a1 + 32) externalImageURIDescription];
  v13[7] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:8];
  uint64_t v11 = [v10 copy];
  int v12 = (void *)restrictedProperties_cn_once_object_21;
  restrictedProperties_cn_once_object_21 = v11;
}

+ (id)nullTransform
{
  return &__block_literal_global_109;
}

+ (id)phoneNumberFromStringTransform
{
  return &__block_literal_global_2_5;
}

+ (id)phoneNumberToStringTransform
{
  return &__block_literal_global_5_3;
}

+ (id)socialProfileFromDictionaryTransform
{
  return &__block_literal_global_7_1;
}

+ (id)socialProfileToDictionaryTransform
{
  return &__block_literal_global_11_1;
}

+ (id)socialProfileToFoundationProfileTransform
{
  return &__block_literal_global_14_0;
}

+ (id)instantMessageAddressFromDictionaryTransform
{
  return &__block_literal_global_17_1;
}

+ (id)instantMessageAddressToDictionaryTransform
{
  return &__block_literal_global_21_1;
}

+ (id)postalAddressToDictionaryTransform
{
  return &__block_literal_global_26_1;
}

+ (id)relatedContactFromStringTransform
{
  return &__block_literal_global_29_0;
}

+ (id)relatedContactToStringTransform
{
  return &__block_literal_global_32_1;
}

+ (id)dateComponentsFromDictionaryTransform
{
  return &__block_literal_global_34;
}

+ (id)dateComponentsToDictionaryTransform
{
  return 0;
}

+ (id)addressingGrammarFromStringTransform
{
  return &__block_literal_global_38_1;
}

+ (id)addressingGrammarToStringTransform
{
  return &__block_literal_global_42_0;
}

+ (id)addressingGrammarFromEncryptedStringTransform
{
  return &__block_literal_global_44_0;
}

+ (id)addressingGrammarToEncryptedStringTransform
{
  return &__block_literal_global_46_0;
}

+ (id)wallpaperFromDataTransform
{
  return &__block_literal_global_48_1;
}

+ (id)sensitiveContentConfigurationFromDataTransform
{
  return &__block_literal_global_52_0;
}

+ (BOOL)areValidKeyPaths:(id)a3 forObject:(id)a4 expectedClasses:(id)a5 allowNil:(id)a6 error:(id *)a7
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v33 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v15 = [v11 count];
  if (v15 != [v13 count]) {
    +[CN(CNObjectValidation) areValidKeyPaths:forObject:expectedClasses:allowNil:error:]();
  }
  uint64_t v16 = [v11 count];
  if (v16 != [v14 count]) {
    +[CN(CNObjectValidation) areValidKeyPaths:forObject:expectedClasses:allowNil:error:]();
  }
  v32 = a7;
  if ([v11 count])
  {
    unint64_t v17 = 0;
    do
    {
      uint64_t v18 = [v11 objectAtIndexedSubscript:v17];
      id v19 = (id)[v13 objectAtIndexedSubscript:v17];
      id v20 = [v14 objectAtIndexedSubscript:v17];
      int v21 = [v20 BOOLValue];

      int v22 = [v19 isSubclassOfClass:objc_opt_class()];
      uint64_t v23 = [v12 valueForKey:v18];
      long long v24 = (void *)v23;
      int v25 = v22 ^ 1;
      if (!v23) {
        int v25 = v21;
      }
      if (v25 != 1 || (!v23 ? (char v26 = 1) : (char v26 = v22), (v26 & 1) == 0 && (objc_opt_isKindOfClass() & 1) == 0)) {
        [v33 addObject:v18];
      }

      ++v17;
    }
    while (v17 < [v11 count]);
  }
  uint64_t v27 = [v33 count];
  uint64_t v28 = v27;
  if (v32 && v27)
  {
    v34 = @"CNKeyPaths";
    v29 = (void *)[v33 copy];
    v35[0] = v29;
    id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];

    id *v32 = +[CNErrorFactory errorWithCode:301 userInfo:v30];
  }
  return v28 == 0;
}

+ (BOOL)areValidDayComponents:(id)a3 error:(id *)a4
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke;
  aBlock[3] = &unk_1E56B8F58;
  id v6 = v5;
  id v64 = v6;
  uint64_t v7 = (char *)_Block_copy(aBlock);
  uint64_t v8 = [v4 timeZone];

  if (v8) {
    [v6 addObject:@"timeZone"];
  }
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_2;
  v61[3] = &unk_1E56B52C8;
  id v9 = v4;
  id v62 = v9;
  v38 = v6;
  id v10 = (uint64_t (**)(char *, void *, __CFString *, uint64_t))(v7 + 16);
  int v11 = (*((uint64_t (**)(char *, void *, __CFString *, uint64_t))v7 + 2))(v7, v61, @"month", 1);
  if (v8) {
    int v12 = 0;
  }
  else {
    int v12 = v11;
  }
  int v36 = v12;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_3;
  v59[3] = &unk_1E56B52C8;
  id v13 = v9;
  id v60 = v13;
  int v35 = (*v10)(v7, v59, @"day", 1);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_4;
  v57[3] = &unk_1E56B52C8;
  id v14 = v13;
  id v58 = v14;
  int v34 = (*v10)(v7, v57, @"hour", 0);
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_5;
  v55[3] = &unk_1E56B52C8;
  id v15 = v14;
  id v56 = v15;
  int v33 = (*v10)(v7, v55, @"minute", 0);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_6;
  v53[3] = &unk_1E56B52C8;
  id v16 = v15;
  id v54 = v16;
  int v32 = (*v10)(v7, v53, @"second", 0);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_7;
  v51[3] = &unk_1E56B52C8;
  id v17 = v16;
  id v52 = v17;
  int v18 = (*v10)(v7, v51, @"nanosecond", 0);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_8;
  v49[3] = &unk_1E56B52C8;
  id v19 = v17;
  id v50 = v19;
  int v20 = (*v10)(v7, v49, @"weekday", 0);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_9;
  v47[3] = &unk_1E56B52C8;
  id v21 = v19;
  id v48 = v21;
  LODWORD(v19) = (*v10)(v7, v47, @"weekdayOrdinal", 0);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_10;
  v45[3] = &unk_1E56B52C8;
  id v22 = v21;
  id v46 = v22;
  LODWORD(v21) = (*v10)(v7, v45, @"quarter", 0);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_11;
  v43[3] = &unk_1E56B52C8;
  id v23 = v22;
  id v44 = v23;
  int v24 = (*v10)(v7, v43, @"weekOfMonth", 0);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_12;
  v41[3] = &unk_1E56B52C8;
  id v25 = v23;
  id v42 = v25;
  int v26 = (*v10)(v7, v41, @"weekOfYear", 0);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_13;
  v39[3] = &unk_1E56B52C8;
  id v27 = v25;
  id v40 = v27;
  int v28 = (*v10)(v7, v39, @"yearForWeekOfYear", 0) & v26 & v24 & v21 & v19 & v20 & v18 & v32 & v33 & v34 & v35 & v36;
  if (a4 && (v28 & 1) == 0)
  {
    v65 = @"CNKeyPaths";
    v29 = (void *)[v38 copy];
    v66[0] = v29;
    id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:&v65 count:1];

    *a4 = +[CNErrorFactory errorWithCode:302 userInfo:v30];
  }
  return v28;
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned int a4)
{
  id v7 = a3;
  uint64_t v8 = ((*(uint64_t (**)(uint64_t))(a2 + 16))(a2) == 0x7FFFFFFFFFFFFFFFLL) ^ a4;
  if ((v8 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v7];
  }

  return v8;
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) month];
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) day];
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) hour];
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) minute];
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) second];
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) nanosecond];
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) weekday];
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) weekdayOrdinal];
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) quarter];
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) weekOfMonth];
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) weekOfYear];
}

uint64_t __54__CN_CNObjectValidation__areValidDayComponents_error___block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) yearForWeekOfYear];
}

+ (BOOL)areValidGregorianDayComponents:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 calendar];
  if (!v7) {
    goto LABEL_3;
  }
  uint64_t v8 = (void *)v7;
  id v9 = [v6 calendar];
  id v10 = [v9 calendarIdentifier];
  char v11 = [v10 isEqualToString:*MEMORY[0x1E4F1C318]];

  if ((v11 & 1) == 0)
  {
    if (a4)
    {
      id v14 = @"CNKeyPaths";
      v15[0] = &unk_1EE0897B8;
      int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      *a4 = +[CNErrorFactory errorWithCode:302 userInfo:v12];

      LOBYTE(a4) = 0;
    }
  }
  else
  {
LABEL_3:
    LOBYTE(a4) = [a1 areValidDayComponents:v6 error:a4];
  }

  return (char)a4;
}

+ (BOOL)areValidNonGregorianDayComponents:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 calendar];
  if (!v7) {
    goto LABEL_3;
  }
  uint64_t v8 = (void *)v7;
  id v9 = [v6 calendar];
  id v10 = [v9 calendarIdentifier];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F1C318]];

  if (!v11)
  {
    LOBYTE(a4) = [a1 areValidDayComponents:v6 error:a4];
  }
  else
  {
LABEL_3:
    if (a4)
    {
      id v14 = @"CNKeyPaths";
      v15[0] = &unk_1EE0897D0;
      int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      *a4 = +[CNErrorFactory errorWithCode:302 userInfo:v12];

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

+ (BOOL)hasContactChineseJapaneseKoreanName:(id)a3
{
  id v4 = a3;
  char v5 = 0;
  if (([a1 isEmptyNameContact:v4 phonetic:0 includingPrefixAndSuffix:0] & 1) == 0)
  {
    id v6 = [a1 requiredPropertiesForNameScriptDetection];
    uint64_t v7 = +[CN joinNonEmptyContactProperties:v6 onContact:v4 withDelimiter:&stru_1EE052B80];

    char v5 = CNIsChineseJapaneseKoreanString();
  }

  return v5;
}

+ (BOOL)hasContactChineseJapaneseKoreanPhoneticName:(id)a3
{
  id v4 = a3;
  char v5 = 0;
  if (([a1 isEmptyNameContact:v4 phonetic:1 includingPrefixAndSuffix:0] & 1) == 0)
  {
    id v6 = [a1 requiredPropertiesForPhoneticNameScriptDetection];
    uint64_t v7 = +[CN joinNonEmptyContactProperties:v6 onContact:v4 withDelimiter:&stru_1EE052B80];

    char v5 = CNIsChineseJapaneseKoreanString();
  }

  return v5;
}

+ (id)localizedPhoneticNameDelimiterForContact:(id)a3
{
  return @" ";
}

+ (id)orderForContactPhoneticName:(id)a3
{
  return (id)[a1 orderForContactName:a3 phonetic:1];
}

+ (id)requiredPropertiesForPhoneticNameScriptDetection
{
  if (requiredPropertiesForPhoneticNameScriptDetection_cn_once_token_1 != -1) {
    dispatch_once(&requiredPropertiesForPhoneticNameScriptDetection_cn_once_token_1, &__block_literal_global_19_1);
  }
  uint64_t v2 = (void *)requiredPropertiesForPhoneticNameScriptDetection_cn_once_object_1;

  return v2;
}

void __78__CN_CNInternationalSupport__requiredPropertiesForPhoneticNameScriptDetection__block_invoke()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v0 = +[CN phoneticGivenNameDescription];
  uint64_t v1 = +[CN phoneticMiddleNameDescription];
  v6[1] = v1;
  uint64_t v2 = +[CN phoneticFamilyNameDescription];
  v6[2] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  uint64_t v4 = [v3 copy];
  char v5 = (void *)requiredPropertiesForPhoneticNameScriptDetection_cn_once_object_1;
  requiredPropertiesForPhoneticNameScriptDetection_cn_once_object_1 = v4;
}

+ (id)keyVectorForAllUsedKeysForInternationalSupport
{
  if (keyVectorForAllUsedKeysForInternationalSupport_cn_once_token_2 != -1) {
    dispatch_once(&keyVectorForAllUsedKeysForInternationalSupport_cn_once_token_2, &__block_literal_global_21_2);
  }
  uint64_t v2 = (void *)keyVectorForAllUsedKeysForInternationalSupport_cn_once_object_2;

  return v2;
}

void __76__CN_CNInternationalSupport__keyVectorForAllUsedKeysForInternationalSupport__block_invoke()
{
  v4[8] = *MEMORY[0x1E4F143B8];
  v4[0] = @"namePrefix";
  v4[1] = @"givenName";
  v4[2] = @"middleName";
  v4[3] = @"familyName";
  v4[4] = @"nameSuffix";
  v4[5] = @"phoneticGivenName";
  v4[6] = @"phoneticMiddleName";
  v4[7] = @"phoneticFamilyName";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:8];
  uint64_t v1 = +[CNContactKeyVector keyVectorWithKeys:v0];
  uint64_t v2 = [v1 copy];
  id v3 = (void *)keyVectorForAllUsedKeysForInternationalSupport_cn_once_object_2;
  keyVectorForAllUsedKeysForInternationalSupport_cn_once_object_2 = v2;
}

+ (id)joinNonEmptyContactProperties:(id)a3 onContact:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[CN joinNonEmptyContactProperties:v6 onContact:v5 withDelimiter:&stru_1EE052B80];
  uint64_t v8 = CNNameDelimiterForString();

  id v9 = +[CN joinNonEmptyContactProperties:v6 onContact:v5 withDelimiter:v8];

  return v9;
}

@end