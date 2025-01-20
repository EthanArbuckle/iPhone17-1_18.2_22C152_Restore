@interface CNContactVCardWritingAdapter
+ (id)adapterWithContact:(id)a3 options:(id)a4;
+ (id)descriptorForAllSupportedKeysWithOptions:(id)a3;
- (BOOL)isCompany;
- (BOOL)isMe;
- (CNContactVCardWritingAdapter)initWithContact:(id)a3 options:(id)a4;
- (NSArray)addressingGrammars;
- (NSArray)calendarURIs;
- (NSArray)emailAddresses;
- (NSArray)imageReferences;
- (NSArray)instantMessagingAddresses;
- (NSArray)namesOfParentGroups;
- (NSArray)otherDateComponents;
- (NSArray)phoneNumbers;
- (NSArray)postalAddresses;
- (NSArray)relatedNames;
- (NSArray)socialProfiles;
- (NSArray)unknownProperties;
- (NSArray)urls;
- (NSData)imageBackgroundColorsData;
- (NSData)imageData;
- (NSData)imageHash;
- (NSData)largeImageData;
- (NSData)memojiMetadata;
- (NSData)sensitiveContentConfiguration;
- (NSData)wallpaper;
- (NSData)watchWallpaperImageData;
- (NSDateComponents)alternateBirthdayComponents;
- (NSDateComponents)birthdayComponents;
- (NSDictionary)activityAlerts;
- (NSDictionary)imageCropRects;
- (NSDictionary)largeImageCropRects;
- (NSString)cardDAVUID;
- (NSString)department;
- (NSString)firstName;
- (NSString)imageType;
- (NSString)jobTitle;
- (NSString)lastName;
- (NSString)maidenName;
- (NSString)middleName;
- (NSString)nickname;
- (NSString)note;
- (NSString)organization;
- (NSString)phonemeData;
- (NSString)phoneticFirstName;
- (NSString)phoneticLastName;
- (NSString)phoneticMiddleName;
- (NSString)phoneticOrganization;
- (NSString)preferredApplePersonaIdentifier;
- (NSString)preferredLikenessSource;
- (NSString)pronunciationFirstName;
- (NSString)pronunciationLastName;
- (NSString)suffix;
- (NSString)title;
- (NSString)uid;
- (id)largeImageHashOfType:(id)a3;
- (id)vCardPropertyItemsForProperty:(id)a3;
- (id)vCardPropertyItemsForProperty:(id)a3 valueTransform:(id)a4;
- (int)downtimeWhitelistAuthorization;
- (int)nameOrder;
- (int)sharedPhotoDisplayPreference;
@end

@implementation CNContactVCardWritingAdapter

+ (id)descriptorForAllSupportedKeysWithOptions:(id)a3
{
  v9 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = a3;
  objc_msgSend(v9, "arrayWithObjects:", @"givenName", @"familyName", @"middleName", @"namePrefix", @"nameSuffix", @"nickname", @"previousFamilyName", @"phoneticGivenName", @"phoneticMiddleName", @"phoneticFamilyName", @"pronunciationGivenName", @"pronunciationFamilyName", @"organizationName", @"phoneticOrganizationName", @"departmentName", @"jobTitle", @"contactType",
    @"emailAddresses",
    @"phoneNumbers",
    @"postalAddresses",
    @"socialProfiles",
    @"instantMessageAddresses",
    @"urlAddresses",
    @"calendarURIs",
    @"callAlert",
    @"textAlert",
    @"thumbnailImageData",
    @"imageData",
    @"birthday",
    @"nonGregorianBirthday",
    @"dates",
    @"contactRelations",
    @"note",
    @"preferredLikenessSource",
    @"preferredApplePersonaIdentifier",
    @"downtimeWhitelist",
    @"imageType",
    @"imageHash",
    @"memojiMetadata",
    @"wallpaper",
    @"watchWallpaperImageData",
    @"sharedPhotoDisplayPreference",
    @"imageBackgroundColorsData",
    @"sensitiveContentConfiguration",
  v3 = 0);
  int v4 = [v8 includePronouns];

  if (v4) {
    [v3 addObject:@"addressingGrammars"];
  }
  v5 = NSStringFromSelector(a2);
  v6 = +[CNContact descriptorWithKeyDescriptors:v3 description:v5];

  return v6;
}

+ (id)adapterWithContact:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithContact:v7 options:v6];

  return v8;
}

- (CNContactVCardWritingAdapter)initWithContact:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactVCardWritingAdapter;
  v9 = [(CNContactVCardWritingAdapter *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    objc_storeStrong((id *)&v10->_options, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)firstName
{
  return [(CNContact *)self->_contact givenName];
}

- (NSString)lastName
{
  return [(CNContact *)self->_contact familyName];
}

- (NSString)middleName
{
  return [(CNContact *)self->_contact middleName];
}

- (NSString)title
{
  return [(CNContact *)self->_contact namePrefix];
}

- (NSString)suffix
{
  return [(CNContact *)self->_contact nameSuffix];
}

- (NSString)nickname
{
  return [(CNContact *)self->_contact nickname];
}

- (NSString)maidenName
{
  return [(CNContact *)self->_contact previousFamilyName];
}

- (NSString)phoneticFirstName
{
  return [(CNContact *)self->_contact phoneticGivenName];
}

- (NSString)phoneticMiddleName
{
  return [(CNContact *)self->_contact phoneticMiddleName];
}

- (NSString)phoneticLastName
{
  return [(CNContact *)self->_contact phoneticFamilyName];
}

- (NSString)pronunciationFirstName
{
  return [(CNContact *)self->_contact pronunciationGivenName];
}

- (NSString)pronunciationLastName
{
  return [(CNContact *)self->_contact pronunciationFamilyName];
}

- (NSArray)addressingGrammars
{
  if ([(CNVCardWritingOptions *)self->_options useUnencryptedPronouns]) {
    +[CN addressingGrammarToStringTransform];
  }
  else {
  v3 = +[CN addressingGrammarToEncryptedStringTransform];
  }
  int v4 = [(CNContactVCardWritingAdapter *)self vCardPropertyItemsForProperty:@"addressingGrammars" valueTransform:v3];

  return (NSArray *)v4;
}

- (NSString)organization
{
  return [(CNContact *)self->_contact organizationName];
}

- (NSString)phoneticOrganization
{
  return [(CNContact *)self->_contact phoneticOrganizationName];
}

- (NSString)department
{
  return [(CNContact *)self->_contact departmentName];
}

- (NSString)jobTitle
{
  return [(CNContact *)self->_contact jobTitle];
}

- (BOOL)isMe
{
  return 0;
}

- (BOOL)isCompany
{
  return [(CNContact *)self->_contact contactType] == CNContactTypeOrganization;
}

- (int)nameOrder
{
  return 0;
}

- (NSArray)emailAddresses
{
  return (NSArray *)[(CNContactVCardWritingAdapter *)self vCardPropertyItemsForProperty:@"emailAddresses"];
}

- (NSArray)phoneNumbers
{
  v3 = +[CN phoneNumberToStringTransform];
  int v4 = [(CNContactVCardWritingAdapter *)self vCardPropertyItemsForProperty:@"phoneNumbers" valueTransform:v3];

  return (NSArray *)v4;
}

- (NSArray)postalAddresses
{
  return (NSArray *)[(CNContactVCardWritingAdapter *)self vCardPropertyItemsForProperty:@"postalAddresses" valueTransform:&__block_literal_global_79];
}

- (NSArray)socialProfiles
{
  return (NSArray *)[(CNContactVCardWritingAdapter *)self vCardPropertyItemsForProperty:@"socialProfiles" valueTransform:&__block_literal_global_6_4];
}

id __46__CNContactVCardWritingAdapter_socialProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[CN socialProfileToDictionaryTransform];
  int v4 = ((void (**)(void, id))v3)[2](v3, v2);

  v5 = (void *)[v4 mutableCopy];
  id v6 = +[CNVCardConstantsMapping CNToVCardSocialProfileConstantsMapping];
  id v7 = [v5 objectForKeyedSubscript:@"service"];
  id v8 = [v6 mappedConstant:v7];

  if (v8) {
    [v5 setObject:v8 forKeyedSubscript:@"service"];
  }

  return v5;
}

- (NSArray)instantMessagingAddresses
{
  return (NSArray *)[(CNContactVCardWritingAdapter *)self vCardPropertyItemsForProperty:@"instantMessageAddresses" valueTransform:&__block_literal_global_9_2];
}

id __57__CNContactVCardWritingAdapter_instantMessagingAddresses__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[CN instantMessageAddressToDictionaryTransform];
  int v4 = ((void (**)(void, id))v3)[2](v3, v2);

  v5 = (void *)[v4 mutableCopy];
  id v6 = +[CNVCardConstantsMapping CNToVCardInstantMessageConstantsMapping];
  id v7 = [v5 objectForKeyedSubscript:@"service"];
  id v8 = [v6 mappedConstant:v7];

  if (v8) {
    [v5 setObject:v8 forKeyedSubscript:@"service"];
  }

  return v5;
}

- (NSArray)urls
{
  return (NSArray *)[(CNContactVCardWritingAdapter *)self vCardPropertyItemsForProperty:@"urlAddresses"];
}

- (NSArray)calendarURIs
{
  return (NSArray *)[(CNContactVCardWritingAdapter *)self vCardPropertyItemsForProperty:@"calendarURIs"];
}

- (NSDictionary)activityAlerts
{
  id v2 = [(CNContact *)self->_contact activityAlerts];
  v3 = [v2 allKeys];
  int v4 = objc_msgSend(v3, "_cn_map:", &__block_literal_global_14);
  v5 = [MEMORY[0x1E4F1CA98] null];
  id v6 = [v2 objectsForKeys:v3 notFoundMarker:v5];

  id v7 = objc_msgSend(v6, "_cn_map:", &__block_literal_global_17_0);
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v4];

  return (NSDictionary *)v8;
}

- (id)vCardPropertyItemsForProperty:(id)a3
{
  return [(CNContactVCardWritingAdapter *)self vCardPropertyItemsForProperty:a3 valueTransform:0];
}

- (id)vCardPropertyItemsForProperty:(id)a3 valueTransform:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  [(CNContact *)self->_contact valueForKey:v6];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        objc_super v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v14 = [v13 value];
        if (v7)
        {
          uint64_t v15 = v7[2](v7, v14);

          v14 = (void *)v15;
        }
        v16 = (void *)MEMORY[0x1E4FB8C00];
        v17 = [v13 label];
        v18 = [v13 identifier];
        v19 = [v16 itemWithValue:v14 label:v17 identifier:v18];

        objc_msgSend(v8, "_cn_addNonNilObject:", v19);
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  return v8;
}

- (NSArray)imageReferences
{
  return 0;
}

- (NSDictionary)imageCropRects
{
  return 0;
}

- (NSDictionary)largeImageCropRects
{
  return 0;
}

- (NSData)largeImageData
{
  return [(CNContact *)self->_contact imageData];
}

- (NSData)imageData
{
  return [(CNContact *)self->_contact thumbnailImageData];
}

- (id)largeImageHashOfType:(id)a3
{
  return 0;
}

- (NSDateComponents)birthdayComponents
{
  return [(CNContact *)self->_contact birthday];
}

- (NSDateComponents)alternateBirthdayComponents
{
  return [(CNContact *)self->_contact nonGregorianBirthday];
}

- (NSArray)otherDateComponents
{
  return (NSArray *)[(CNContactVCardWritingAdapter *)self vCardPropertyItemsForProperty:@"dates"];
}

- (NSArray)relatedNames
{
  v3 = +[CN relatedContactToStringTransform];
  int v4 = [(CNContactVCardWritingAdapter *)self vCardPropertyItemsForProperty:@"contactRelations" valueTransform:v3];

  return (NSArray *)v4;
}

- (NSString)note
{
  if ([(CNContact *)self->_contact isKeyAvailable:@"note"])
  {
    v3 = [(CNContact *)self->_contact note];
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (NSArray)namesOfParentGroups
{
  return 0;
}

- (NSString)cardDAVUID
{
  return [(CNContact *)self->_contact cardDAVUID];
}

- (NSString)uid
{
  return 0;
}

- (NSString)phonemeData
{
  return 0;
}

- (int)downtimeWhitelistAuthorization
{
  uint64_t v3 = *MEMORY[0x1E4F5A298];
  int v4 = [(CNContact *)self->_contact downtimeWhitelist];
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if (v3) {
    return 0;
  }
  if (+[CNDowntimeWhitelist isWhitelistedContact:self->_contact])
  {
    return 1;
  }
  return 2;
}

- (NSString)preferredLikenessSource
{
  return [(CNContact *)self->_contact preferredLikenessSource];
}

- (NSString)preferredApplePersonaIdentifier
{
  return [(CNContact *)self->_contact preferredApplePersonaIdentifier];
}

- (NSString)imageType
{
  return [(CNContact *)self->_contact imageType];
}

- (NSData)imageHash
{
  return [(CNContact *)self->_contact imageHash];
}

- (NSData)memojiMetadata
{
  return [(CNContact *)self->_contact memojiMetadata];
}

- (NSData)wallpaper
{
  id v2 = [(CNContact *)self->_contact wallpaper];
  uint64_t v3 = [v2 dataRepresentation];

  return (NSData *)v3;
}

- (NSData)watchWallpaperImageData
{
  return [(CNContact *)self->_contact watchWallpaperImageData];
}

- (int)sharedPhotoDisplayPreference
{
  int64_t v2 = [(CNContact *)self->_contact sharedPhotoDisplayPreference];
  if ((unint64_t)(v2 - 1) >= 3) {
    LODWORD(v2) = 0;
  }
  return v2;
}

- (NSData)imageBackgroundColorsData
{
  return [(CNContact *)self->_contact imageBackgroundColorsData];
}

- (NSData)sensitiveContentConfiguration
{
  int64_t v2 = [(CNContact *)self->_contact sensitiveContentConfiguration];
  uint64_t v3 = [v2 dataRepresentation];

  return (NSData *)v3;
}

- (NSArray)unknownProperties
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end